@interface ICCloudContext
+ (BOOL)haveZoneIDsInAccountZoneIDs:(id)a3;
+ (BOOL)isZoneConfigurations:(id)a3 subsetOfZoneConfigurations:(id)a4;
+ (BOOL)shouldIgnoreErrorForBackoffTimer:(id)a3;
+ (CKRecordZoneID)metadataZoneID;
+ (CKRecordZoneID)notesZoneID;
+ (ICCloudContext)sharedContext;
+ (id)allZoneIDsInAccountZoneIDs:(id)a3;
+ (id)deduplicatedRecordsForCloudObjects:(id)a3;
+ (id)errorCodesToIgnoreForBackoffTimer;
+ (id)errorForDisabledCloudSyncing;
+ (id)errorForWaitingForRetryTimer;
+ (id)errorFromErrors:(id)a3;
+ (id)errorFromOperations:(id)a3;
+ (id)errorsFromError:(id)a3;
+ (id)newNotesContainer;
+ (id)newNotesContainerForAccountID:(id)a3;
+ (id)objectsByAccount:(id)a3;
+ (id)objectsByDatabaseScope:(id)a3;
+ (id)sortedRecords:(id)a3;
+ (id)userRecordNameForContainer:(id)a3;
+ (id)zoneIDsFromZoneInfos:(id)a3;
+ (id)zoneInfosFromZoneIDs:(id)a3;
+ (void)batchRecordsToSave:(id)a3 delete:(id)a4 maxRecordCountPerBatch:(unint64_t)a5 maxRecordSizePerBatch:(unint64_t)a6 withBlock:(id)a7;
+ (void)registerStateHandler;
- (BOOL)didAddObservers;
- (BOOL)didEnqueueLongLivedOperations;
- (BOOL)disableAutomaticallyRetryNetworkFailures;
- (BOOL)disableRetryTimer;
- (BOOL)enableLongLivedOperations;
- (BOOL)fetchOperationsPending;
- (BOOL)hasNoteContextOptions:(unint64_t)a3;
- (BOOL)hasPendingOperations;
- (BOOL)isCloudKitAccountAvailable;
- (BOOL)isDisabled;
- (BOOL)isDisabledInternal;
- (BOOL)isEnqueueingLongLivedOperations;
- (BOOL)isFetchingAllRecordZones;
- (BOOL)isFetchingEnabled;
- (BOOL)isInForeground;
- (BOOL)isInternetReachable;
- (BOOL)isReadyToSync;
- (BOOL)needsToProcessAllObjects;
- (BOOL)needsToUpdateSubscriptions;
- (BOOL)partialError:(id)a3 containsErrorCode:(int64_t)a4;
- (BOOL)shouldResumeSyncOnForeground;
- (BOOL)syncDisabledByServer;
- (BOOL)syncOnlyIfReachable;
- (ICCloudAnalyticsDelegate)cloudAnalyticsDelegate;
- (ICCloudContext)initWithDelegate:(id)a3;
- (ICCloudContextDelegate)cloudContextDelegate;
- (ICSelectorDelayer)processingSelectorDelayer;
- (NSDictionary)cloudObjectClassesByRecordType;
- (NSDictionary)containersByAccountID;
- (NSMutableDictionary)accountZoneIDsFetchingChanges;
- (NSMutableDictionary)accountZoneIDsNeedingFetchChanges;
- (NSMutableDictionary)accountZoneIDsNeedingToBeSaved;
- (NSMutableDictionary)retryCountsByOperationType;
- (NSMutableSet)objectIDsToProcess;
- (NSMutableSet)objectIDsToRetry;
- (NSMutableSet)operationIDsBeforeEnqueuingLongLivedOperations;
- (NSMutableSet)subscribedSubscriptionIDs;
- (NSOperationQueue)operationQueue;
- (NSTimer)retryTimer;
- (OS_dispatch_queue)containersCreationQueue;
- (OS_dispatch_queue)processingQueue;
- (double)timeIntervalToRetryAfterFromError:(id)a3;
- (id)_objectIDsToProcessForFullSyncInContext:(id)a3;
- (id)accountIDForContainer:(id)a3;
- (id)accountIDForDatabase:(id)a3;
- (id)allCloudObjectIDsInContext:(id)a3;
- (id)allCloudObjectIDsInContext:(id)a3 predicate:(id)a4;
- (id)allZoneIDs;
- (id)backgroundContext;
- (id)containerForAccountID:(id)a3;
- (id)existingCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5;
- (id)existingCloudObjectForRecordID:(id)a3 recordType:(id)a4 accountID:(id)a5 context:(id)a6;
- (id)existingCloudObjectForRecordID:(id)a3 recordType:(id)a4 accountID:(id)a5 context:(id)a6 excludingRecordTypes:(id)a7;
- (id)existingCloudObjectForUserSpecificRecordID:(id)a3 createPlaceholderIfNecessary:(BOOL)a4 accountID:(id)a5 context:(id)a6;
- (id)invernessClientForAccountID:(id)a3;
- (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5;
- (id)newOperationToFetchRecordZoneChangesWithZoneConfigurations:(id)a3 database:(id)a4;
- (id)newPlaceholderObjectForRecordID:(id)a3 recordType:(id)a4 accountID:(id)a5 context:(id)a6;
- (id)operationToFetchDatabaseChangesForDatabase:(id)a3 completionHandler:(id)a4;
- (id)operationToFetchRecordIDs:(id)a3 database:(id)a4 qualityOfService:(int64_t)a5;
- (id)operationToFetchRecordZoneChangesForZoneIDs:(id)a3 database:(id)a4;
- (id)operationToModifyRecordsToSave:(id)a3 delete:(id)a4 rootRecordIDsByShareID:(id)a5 database:(id)a6;
- (id)operationToSaveZonesForZoneIDs:(id)a3 accountID:(id)a4;
- (id)operationToSaveZonesIfNecessaryForAccountID:(id)a3;
- (id)operationsToFetchRecordIDs:(id)a3 database:(id)a4 qualityOfService:(int64_t)a5;
- (id)operationsToFetchRecordIDs:(id)a3 qualityOfService:(int64_t)a4 operationGroupName:(id)a5 accountID:(id)a6;
- (id)operationsToFetchRecordZoneChangesForZoneIDs:(id)a3 accountID:(id)a4;
- (id)operationsToModifyRecordsForCloudObjectsToSave:(id)a3 delete:(id)a4 deleteShares:(id)a5 saveUserSpecificRecords:(id)a6 operationGroupName:(id)a7 addDependencies:(BOOL)a8 accountID:(id)a9;
- (id)operationsToModifyRecordsToSave:(id)a3 delete:(id)a4 rootRecordIDsByShareID:(id)a5 database:(id)a6;
- (id)overrideAccountID;
- (id)persistentStoreCoordinator;
- (id)readinessLoggingDescription;
- (id)serverChangeTokenForChangedZonesInDatabase:(id)a3 accountID:(id)a4 context:(id)a5;
- (id)serverChangeTokenForRecordZoneID:(id)a3 databaseScope:(int64_t)a4 accountID:(id)a5 context:(id)a6;
- (id)subscriptionForDatabase:(id)a3;
- (id)viewContext;
- (int64_t)accountStatus;
- (int64_t)qualityOfService;
- (unint64_t)discretionaryNetworkBehavior;
- (void)_addModifyRecordsOperationsWithCloudObjectsToSave:(id)a3 delete:(id)a4 accountID:(id)a5 operationGroupName:(id)a6 waitForDependencies:(BOOL)a7 completionHandler:(id)a8;
- (void)_filterCloudSyncingObjects:(id)a3 accountID:(id)a4 objectsToSave:(id *)a5 objectsToDelete:(id *)a6 objectsToDeleteShares:(id *)a7 objectsToSaveUserSpecificRecord:(id *)a8;
- (void)_ingestCloudKitRecord:(id)a3 forAccountID:(id)a4 forceMerge:(BOOL)a5 context:(id)a6;
- (void)_processCloudObjects:(id)a3 completionHandler:(id)a4;
- (void)_processPendingCloudObjectsWithCompletionHandler:(id)a3;
- (void)_syncWithReason:(id)a3 uploadUnsyncedChanges:(BOOL)a4 completionHandler:(id)a5;
- (void)addCallbackBlocksToModifyRecordsOperation:(id)a3 rootRecordIDsByShareID:(id)a4;
- (void)addDependenciesForModifyRecordsOperation:(id)a3;
- (void)addFetchOperationsForRecordIDs:(id)a3 accountID:(id)a4 qualityOfService:(int64_t)a5 operationGroupName:(id)a6 completionHandler:(id)a7;
- (void)addModifyRecordsOperationsWithCloudObjectsToSave:(id)a3 delete:(id)a4 accountID:(id)a5 operationGroupName:(id)a6 waitForDependencies:(BOOL)a7 completionHandler:(id)a8;
- (void)addOperationToProcessObjectsWithCompletionHandler:(id)a3;
- (void)addOperations:(id)a3;
- (void)addOperationsToFetchRecordZoneChangesForAccountZoneIDs:(id)a3 reason:(id)a4 completionHandler:(id)a5;
- (void)cancelEverythingWithCompletionHandler:(id)a3;
- (void)clearContainers;
- (void)clearPendingActivity;
- (void)clearRetryCountForOperationType:(id)a3;
- (void)clearSubscribedSubscriptionIDs;
- (void)clearZoneFetchState;
- (void)cloudKitAccountChanged:(id)a3;
- (void)contextDidSaveOrMerge:(id)a3;
- (void)dealloc;
- (void)deleteAllServerChangeTokens;
- (void)deleteRecordZonesWithZoneIDs:(id)a3 accountID:(id)a4 markZonesAsUserPurged:(BOOL)a5 completionHandler:(id)a6;
- (void)deleteServerChangeTokenForChangedZonesInDatabase:(id)a3 accountID:(id)a4 context:(id)a5;
- (void)deleteServerChangeTokenForRecordZoneID:(id)a3 databaseScope:(int64_t)a4 accountID:(id)a5 context:(id)a6;
- (void)deleteSharesForObjects:(id)a3 accountID:(id)a4 completionHandler:(id)a5;
- (void)deleteSharesForObjects:(id)a3 completionHandler:(id)a4;
- (void)didFetchShare:(id)a3 accountID:(id)a4 context:(id)a5;
- (void)disableCloudSyncingIfCurrentVersionNotSupported:(id)a3;
- (void)enqueueLongLivedOperationsIfNeededWithCompletionHandler:(id)a3;
- (void)enqueueLongLivedOperationsWithIDsIfNeeded:(id)a3 container:(id)a4 completionHandler:(id)a5;
- (void)enumerateAllCloudObjectsInContext:(id)a3 batchSize:(unint64_t)a4 saveAfterBatch:(BOOL)a5 usingBlock:(id)a6;
- (void)fetchCloudObjects:(id)a3 accountID:(id)a4 completionHandler:(id)a5;
- (void)fetchDatabaseChangesForDatabases:(id)a3 reason:(id)a4 completionHandler:(id)a5;
- (void)fetchDatabaseChangesOperation:(id)a3 changeTokenUpdated:(id)a4 accountID:(id)a5 context:(id)a6;
- (void)fetchDatabaseChangesOperation:(id)a3 finishedWithServerChangeToken:(id)a4 accountID:(id)a5 error:(id)a6 completionHandler:(id)a7 context:(id)a8;
- (void)fetchDatabaseChangesOperation:(id)a3 recordZoneWithIDChanged:(id)a4 accountID:(id)a5;
- (void)fetchDatabaseChangesOperation:(id)a3 recordZoneWithIDWasDeleted:(id)a4 accountID:(id)a5;
- (void)fetchDatabaseChangesWithReason:(id)a3 completionHandler:(id)a4;
- (void)fetchOperation:(id)a3 didCompleteWithRecordsByRecordID:(id)a4 error:(id)a5;
- (void)fetchOperation:(id)a3 progressChangedWithRecordID:(id)a4 progress:(double)a5;
- (void)fetchOperation:(id)a3 recordWasFetchedWithRecordID:(id)a4 record:(id)a5 error:(id)a6;
- (void)fetchRecordIDs:(id)a3 accountID:(id)a4 operationGroupName:(id)a5 completionHandler:(id)a6;
- (void)fetchRecordZoneChangesForAccountZoneIDs:(id)a3 reason:(id)a4 completionHandler:(id)a5;
- (void)fetchRecordZoneChangesForZoneIDs:(id)a3 accountID:(id)a4 reason:(id)a5 completionHandler:(id)a6;
- (void)fetchRecordZoneChangesOperation:(id)a3 completedFetchForZoneID:(id)a4 serverChangeToken:(id)a5 error:(id)a6 context:(id)a7;
- (void)fetchRecordZoneChangesOperation:(id)a3 recordWasChangedWithRecordID:(id)a4 record:(id)a5 error:(id)a6 context:(id)a7;
- (void)fetchRecordZoneChangesOperation:(id)a3 recordWasDeletedWithRecordID:(id)a4 recordType:(id)a5 context:(id)a6;
- (void)fetchRecordZoneChangesOperation:(id)a3 zoneID:(id)a4 accountID:(id)a5 changeTokenUpdated:(id)a6 context:(id)a7;
- (void)fetchRecordZoneChangesOperationDidComplete:(id)a3 error:(id)a4;
- (void)fetchRecordZoneChangesWithReason:(id)a3 completionHandler:(id)a4;
- (void)fetchSubscriptionsForDatabase:(id)a3 completionHandler:(id)a4;
- (void)fetchUserRecordWithAccountID:(id)a3 completionHandler:(id)a4;
- (void)fetchUserRecordWithContainer:(id)a3 completionHandler:(id)a4;
- (void)finishOperationsForRecordID:(id)a3 completionHandler:(id)a4;
- (void)finishOperationsForRecordID:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5;
- (void)handleCloudKitNotification:(id)a3 completionHandler:(id)a4;
- (void)handleGenericPartialFailuresForError:(id)a3 operation:(id)a4;
- (void)handleRemoteNotificationWithUserInfo:(id)a3 completion:(id)a4;
- (void)incrementOrClearRetryCountForOperationType:(id)a3 error:(id)a4;
- (void)incrementRetryCountForOperationType:(id)a3;
- (void)informCloudAnalyticsDelegateForOperationDidEnd:(id)a3 recordsByRecordID:(id)a4 operationError:(id)a5;
- (void)ingestCloudKitRecord:(id)a3 forAccountID:(id)a4 forceMerge:(BOOL)a5 context:(id)a6;
- (void)loadZoneFetchState;
- (void)modifyRecordsOperation:(id)a3 didCompleteWithError:(id)a4;
- (void)modifyRecordsOperation:(id)a3 recordWasDeletedWithRecordID:(id)a4 rootRecordIDsByShareID:(id)a5 error:(id)a6;
- (void)modifyRecordsOperation:(id)a3 recordWasDeletedWithRecordID:(id)a4 rootRecordIDsByShareID:(id)a5 error:(id)a6 context:(id)a7;
- (void)modifyRecordsOperation:(id)a3 recordWasSavedWithRecordID:(id)a4 record:(id)a5 error:(id)a6;
- (void)modifyRecordsOperation:(id)a3 recordWasSavedWithRecordID:(id)a4 record:(id)a5 error:(id)a6 context:(id)a7;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseCloudSyncWhileSynchronouslyPerformingBlock:(id)a3;
- (void)printOperationQueue;
- (void)processAllCloudObjectsWithCompletionHandler:(id)a3;
- (void)processObjectIDs:(id)a3 completionHandler:(id)a4;
- (void)processPendingCloudObjects;
- (void)pushCloudObjects:(id)a3 operationGroupName:(id)a4 completionHandler:(id)a5;
- (void)reachabilityChanged:(id)a3;
- (void)receivedZoneNotFound:(id)a3 operation:(id)a4 context:(id)a5;
- (void)resetZoneForCloudAccount:(id)a3 withReason:(id)a4;
- (void)retryOperationsIfNecessary;
- (void)saveServerChangeToken:(id)a3 forChangedZonesInDatabase:(id)a4 accountID:(id)a5 context:(id)a6;
- (void)saveServerChangeToken:(id)a3 forRecordZoneID:(id)a4 databaseScope:(int64_t)a5 accountID:(id)a6 context:(id)a7;
- (void)saveSubscriptionsForDatabase:(id)a3 completionHandler:(id)a4;
- (void)saveZoneFetchState;
- (void)setAccountStatus:(int64_t)a3;
- (void)setAccountZoneIDsFetchingChanges:(id)a3;
- (void)setAccountZoneIDsNeedingFetchChanges:(id)a3;
- (void)setAccountZoneIDsNeedingToBeSaved:(id)a3;
- (void)setCloudAnalyticsDelegate:(id)a3;
- (void)setCloudContextDelegate:(id)a3;
- (void)setContainersByAccountID:(id)a3;
- (void)setContainersCreationQueue:(id)a3;
- (void)setDidAddObservers:(BOOL)a3;
- (void)setDidEnqueueLongLivedOperations:(BOOL)a3;
- (void)setDisableAutomaticallyRetryNetworkFailures:(BOOL)a3;
- (void)setDisableRetryTimer:(BOOL)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setDisabledInternal:(BOOL)a3;
- (void)setDiscretionaryNetworkBehavior:(unint64_t)a3;
- (void)setEnableLongLivedOperations:(BOOL)a3;
- (void)setEnqueueingLongLivedOperations:(BOOL)a3;
- (void)setFetchingEnabled:(BOOL)a3;
- (void)setNeedsToProcessAllObjects:(BOOL)a3;
- (void)setNeedsToUpdateSubscriptions:(BOOL)a3;
- (void)setObjectIDsToProcess:(id)a3;
- (void)setObjectIDsToRetry:(id)a3;
- (void)setOperationIDsBeforeEnqueuingLongLivedOperations:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setProcessingQueue:(id)a3;
- (void)setProcessingSelectorDelayer:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRetryCountsByOperationType:(id)a3;
- (void)setRetryTimer:(id)a3;
- (void)setShouldResumeSyncOnForeground:(BOOL)a3;
- (void)setSubscribedSubscriptionIDs:(id)a3;
- (void)setSyncDisabledByServer:(BOOL)a3;
- (void)setSyncOnlyIfReachable:(BOOL)a3;
- (void)startRetryTimerIfNecessaryWithError:(id)a3;
- (void)syncCompletedWithErrors:(id)a3;
- (void)syncWithReason:(id)a3 completionHandler:(id)a4;
- (void)syncWithReason:(id)a3 uploadUnsyncedChanges:(BOOL)a4 completionHandler:(id)a5;
- (void)updateAccountStatusWithCompletionHandler:(id)a3;
- (void)updateCloudContextState;
- (void)updateCloudContextStateWithCompletion:(id)a3;
- (void)updateConfiguration:(id)a3;
- (void)updateSelectorDelayers:(id)a3;
- (void)updateSubscriptionsWithCompletionHandler:(id)a3;
- (void)validateAccountZoneIDsNeedingFetchChanges;
@end

@implementation ICCloudContext

- (void)loadZoneFetchState
{
  if (loadZoneFetchState_onceToken != -1) {
    dispatch_once(&loadZoneFetchState_onceToken, &__block_literal_global_547);
  }
  v3 = objc_opt_new();
  [(ICCloudContext *)self setAccountZoneIDsNeedingFetchChanges:v3];

  v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v5 = [v4 objectForKey:@"CloudKitAccountZonesNeedingFetchChanges"];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__ICCloudContext_loadZoneFetchState__block_invoke_2;
  v8[3] = &unk_1E64A88E8;
  v8[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  v6 = objc_opt_new();
  [(ICCloudContext *)self setAccountZoneIDsFetchingChanges:v6];

  v7 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudContext loadZoneFetchState](self);
  }
}

- (NSMutableDictionary)accountZoneIDsNeedingFetchChanges
{
  return self->_accountZoneIDsNeedingFetchChanges;
}

void __38__ICCloudContext_updateConfiguration___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 disableCloudSyncingIfCurrentVersionNotSupported:v4];
  v5 = *(void **)(a1 + 32);
  id v6 = [v4 throttlingPolicy];

  [v5 updateSelectorDelayers:v6];
}

- (void)updateSelectorDelayers:(id)a3
{
  id v22 = a3;
  objc_opt_class();
  id v4 = ICDynamicCast();
  if (!v4)
  {
    objc_opt_class();
    v5 = ICDynamicCast();
    objc_opt_class();
    id v6 = [v5 object];
    id v4 = ICDynamicCast();

    if (!v4)
    {
      v7 = +[ICCloudConfiguration sharedConfiguration];
      id v4 = [v7 throttlingPolicy];
    }
  }
  [v4 batchInterval];
  double v9 = v8;
  [v4 maximumBatchIntervalFactor];
  double v11 = v10;
  v12 = self;
  objc_sync_enter(v12);
  v13 = [(ICCloudContext *)v12 processingSelectorDelayer];
  double v14 = v9 * v11;

  if (!v13)
  {
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F837C8]) initWithTarget:v12 selector:sel_processPendingCloudObjects delay:1 maximumDelay:v9 callOnMainThread:v14];
    [(ICCloudContext *)v12 setProcessingSelectorDelayer:v15];
  }
  objc_sync_exit(v12);

  v16 = [(ICCloudContext *)v12 processingSelectorDelayer];
  [v16 setDelay:v9];

  v17 = [(ICCloudContext *)v12 processingSelectorDelayer];
  [v17 setMaximumDelay:v14];

  v18 = [(ICCloudContext *)v12 processingSelectorDelayer];
  int v19 = [v18 isScheduledToFire];

  if (v19)
  {
    v20 = [(ICCloudContext *)v12 processingSelectorDelayer];
    [v20 cancelPreviousFireRequests];

    v21 = [(ICCloudContext *)v12 processingSelectorDelayer];
    [v21 requestFire];
  }
}

- (ICSelectorDelayer)processingSelectorDelayer
{
  return (ICSelectorDelayer *)objc_getProperty(self, a2, 112, 1);
}

- (void)disableCloudSyncingIfCurrentVersionNotSupported:(id)a3
{
  id v4 = [a3 minimumClientVersion];
  v5 = [v4 componentsSeparatedByString:@","];
  if ([v5 count] != 3)
  {
    v13 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ICCloudContext disableCloudSyncingIfCurrentVersionNotSupported:]();
    }
    goto LABEL_9;
  }
  id v6 = [v5 objectAtIndexedSubscript:0];
  uint64_t v7 = (int)[v6 intValue];

  double v8 = [v5 objectAtIndexedSubscript:1];
  uint64_t v9 = (int)[v8 intValue];

  double v10 = [v5 objectAtIndexedSubscript:2];
  uint64_t v11 = (int)[v10 intValue];

  v12 = [MEMORY[0x1E4F28F80] processInfo];
  v14[0] = v7;
  v14[1] = v9;
  v14[2] = v11;
  LODWORD(v7) = [v12 isOperatingSystemAtLeastVersion:v14];

  if (!v7)
  {
    [(ICCloudContext *)self setSyncDisabledByServer:1];
    v13 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ICCloudContext disableCloudSyncingIfCurrentVersionNotSupported:]();
    }

LABEL_9:
    goto LABEL_10;
  }
  [(ICCloudContext *)self setSyncDisabledByServer:0];
LABEL_10:
}

- (void)setSyncDisabledByServer:(BOOL)a3
{
  self->_syncDisabledByServer = a3;
}

- (void)setProcessingSelectorDelayer:(id)a3
{
}

+ (ICCloudContext)sharedContext
{
  if (sharedContext_onceToken != -1) {
    dispatch_once(&sharedContext_onceToken, &__block_literal_global_54);
  }
  v2 = (void *)sharedContext_sCloudContext;
  return (ICCloudContext *)v2;
}

void __31__ICCloudContext_sharedContext__block_invoke()
{
  v0 = [[ICCloudContext alloc] initWithDelegate:0];
  v1 = (void *)sharedContext_sCloudContext;
  sharedContext_sCloudContext = (uint64_t)v0;
}

void __36__ICCloudContext_loadZoneFetchState__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v0 removeObjectForKey:@"CloudKitZonesNeedingFetchChanges"];
}

- (id)readinessLoggingDescription
{
  v3 = NSString;
  [(ICCloudContext *)self accountStatus];
  id v4 = CKStringFromAccountStatus();
  v5 = [v3 stringWithFormat:@"accountStatus=%@ syncDisabledByServer=%d accountAvailable=%d", v4, -[ICCloudContext syncDisabledByServer](self, "syncDisabledByServer"), -[ICCloudContext isCloudKitAccountAvailable](self, "isCloudKitAccountAvailable")];

  return v5;
}

- (void)syncWithReason:(id)a3 uploadUnsyncedChanges:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void *))a5;
  double v10 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudContext syncWithReason:uploadUnsyncedChanges:completionHandler:]();
  }

  if (![(ICCloudContext *)self isReadyToSync])
  {
    BOOL v12 = [(ICCloudContext *)self isCloudKitAccountAvailable];
    os_log_t v13 = os_log_create("com.apple.notes", "Cloud");
    os_log_t v14 = v13;
    if (v12)
    {
      v15 = v13;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = [(ICCloudContext *)self readinessLoggingDescription];
        *(_DWORD *)buf = 138412290;
        v23 = v16;
        _os_log_impl(&dword_1C3A61000, v15, OS_LOG_TYPE_DEFAULT, "Trying to sync while not ready <%@>", buf, 0xCu);
      }
      v17 = [(id)objc_opt_class() errorForDisabledCloudSyncing];
      if (!v9) {
        goto LABEL_28;
      }
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[ICCloudContext syncWithReason:uploadUnsyncedChanges:completionHandler:]();
      }

      v17 = 0;
      if (!v9) {
        goto LABEL_28;
      }
    }
LABEL_27:
    v9[2](v9, v17);
LABEL_28:

    goto LABEL_29;
  }
  if (![(ICCloudContext *)self syncOnlyIfReachable]
    || [(ICCloudContext *)self isInternetReachable])
  {
    if ([(ICCloudContext *)self isFetchingEnabled])
    {
      if ([(ICCloudContext *)self syncOnlyIfReachable]) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = 2;
      }
      [(ICCloudContext *)self setDiscretionaryNetworkBehavior:v11];
      [(ICCloudContext *)self _syncWithReason:v8 uploadUnsyncedChanges:v6 completionHandler:v9];
    }
    else
    {
      v18 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C3A61000, v18, OS_LOG_TYPE_INFO, "Trying to sync with fetching disabled, so only pushing", buf, 2u);
      }

      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __73__ICCloudContext_syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke;
      v20[3] = &unk_1E64A7EC0;
      v20[4] = self;
      v21 = v9;
      [(ICCloudContext *)self processAllCloudObjectsWithCompletionHandler:v20];
    }
    goto LABEL_29;
  }
  int v19 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3A61000, v19, OS_LOG_TYPE_INFO, "Trying to sync with no network connection", buf, 2u);
  }

  if (v9)
  {
    v17 = [(id)objc_opt_class() errorForDisabledCloudSyncing];
    goto LABEL_27;
  }
LABEL_29:
}

- (BOOL)isCloudKitAccountAvailable
{
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    [(ICCloudContext *)self viewContext];
  }
  else {
  v3 = [(ICCloudContext *)self backgroundContext];
  }
  id v4 = [v3 persistentStoreCoordinator];

  if (v4) {
    LOBYTE(v4) = +[ICAccount isCloudKitAccountAvailableInContext:v3];
  }

  return (char)v4;
}

- (void)syncWithReason:uploadUnsyncedChanges:completionHandler:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, v0, v1, "Asked to sync with reason: %@", v2);
}

- (BOOL)syncDisabledByServer
{
  return self->_syncDisabledByServer;
}

- (BOOL)isReadyToSync
{
  if ([(ICCloudContext *)self accountStatus] != 1
    && [(ICCloudContext *)self accountStatus]
    || [(ICCloudContext *)self syncDisabledByServer])
  {
    return 0;
  }
  return [(ICCloudContext *)self isCloudKitAccountAvailable];
}

- (int64_t)accountStatus
{
  v2 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  int64_t v3 = [v2 integerForKey:@"CloudKitAccountStatus"];

  return v3;
}

- (ICCloudContext)initWithDelegate:(id)a3
{
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)ICCloudContext;
  v5 = [(ICCloudContext *)&v44 init];
  BOOL v6 = v5;
  if (v5)
  {
    [(ICCloudContext *)v5 setCloudContextDelegate:v4];
    [(ICCloudContext *)v6 setSyncOnlyIfReachable:1];
    uint64_t v7 = objc_opt_new();
    [(ICCloudContext *)v6 setOperationQueue:v7];

    id v8 = [(ICCloudContext *)v6 operationQueue];
    [v8 setMaxConcurrentOperationCount:10];

    uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.notes.cloud", v9);
    [(ICCloudContext *)v6 setProcessingQueue:v10];

    uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.notes.cloud.container-creation", v11);
    [(ICCloudContext *)v6 setContainersCreationQueue:v12];

    os_log_t v13 = [MEMORY[0x1E4F1CA80] set];
    [(ICCloudContext *)v6 setObjectIDsToProcess:v13];

    os_log_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    [(ICCloudContext *)v6 setAccountZoneIDsNeedingToBeSaved:v14];

    v15 = [MEMORY[0x1E4F1CA80] set];
    [(ICCloudContext *)v6 setObjectIDsToRetry:v15];

    v16 = [MEMORY[0x1E4F1CA60] dictionary];
    [(ICCloudContext *)v6 setRetryCountsByOperationType:v16];

    v17 = [MEMORY[0x1E4F1CA80] set];
    [(ICCloudContext *)v6 setSubscribedSubscriptionIDs:v17];

    [(ICCloudContext *)v6 setNeedsToUpdateSubscriptions:1];
    BOOL v18 = [(ICCloudContext *)v6 hasNoteContextOptions:16];
    [(ICCloudContext *)v6 setDisabled:!v18];
    [(ICCloudContext *)v6 setDisabledInternal:0];
    [(ICCloudContext *)v6 setQualityOfService:17];
    [(ICCloudContext *)v6 setDiscretionaryNetworkBehavior:0];
    [(ICCloudContext *)v6 setEnableLongLivedOperations:[(ICCloudContext *)v6 hasNoteContextOptions:0x100000] ^ 1];
    [(ICCloudContext *)v6 setDisableAutomaticallyRetryNetworkFailures:0];
    [(ICCloudContext *)v6 setFetchingEnabled:[(ICCloudContext *)v6 hasNoteContextOptions:0x80000]];
    [(ICCloudContext *)v6 setDidEnqueueLongLivedOperations:0];
    int v19 = [MEMORY[0x1E4F1CA80] set];
    [(ICCloudContext *)v6 setOperationIDsBeforeEnqueuingLongLivedOperations:v19];

    v20 = [MEMORY[0x1E4F83768] currentConfiguration];
    int v21 = [v20 resetsCloud];

    if (v21)
    {
      id v22 = [(ICCloudContext *)v6 viewContext];
      v23 = +[ICAccount cloudKitAccountInContext:v22];

      if (v23)
      {
        [(ICCloudContext *)v6 resetZoneForCloudAccount:v23 withReason:@"LaunchArgument"];
      }
      else
      {
        uint64_t v24 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
          -[ICCloudContext initWithDelegate:]();
        }
      }
    }
    [(ICCloudContext *)v6 loadZoneFetchState];
    if (v18)
    {
      v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v26 = *MEMORY[0x1E4F838C0];
      v27 = [MEMORY[0x1E4F837B0] sharedReachabilityForInternetConnection];
      [v25 addObserver:v6 selector:sel_reachabilityChanged_ name:v26 object:v27];

      v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v28 addObserver:v6 selector:sel_contextDidSaveOrMerge_ name:*MEMORY[0x1E4F1BE28] object:0];

      v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v29 addObserver:v6 selector:sel_contextDidSaveOrMerge_ name:*MEMORY[0x1E4F1BE18] object:0];

      v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v30 addObserver:v6 selector:sel_cloudKitAccountChanged_ name:*MEMORY[0x1E4F19BE0] object:0];

      v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v31 addObserver:v6 selector:sel_cloudKitAccountChanged_ name:@"ICAccountsDidChangeNotification" object:0];

      objc_initWeak(&location, v6);
      dispatch_time_t v32 = dispatch_time(0, 2000000000);
      v33 = dispatch_get_global_queue(-2, 0);
      uint64_t v38 = MEMORY[0x1E4F143A8];
      uint64_t v39 = 3221225472;
      v40 = __35__ICCloudContext_initWithDelegate___block_invoke;
      v41 = &unk_1E64A4758;
      objc_copyWeak(&v42, &location);
      dispatch_after(v32, v33, &v38);

      v34 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v38, v39, v40, v41);
      [v34 addObserver:v6 selector:sel_updateConfiguration_ name:@"ICCloudConfigurationChanged" object:0];

      v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v35 addObserver:v6 selector:sel_updateSelectorDelayers_ name:@"ICCloudBatchIntervalDidChangeNotification" object:0];

      v36 = [(ICCloudContext *)v6 operationQueue];
      objc_msgSend(v36, "ic_addObserver:forKeyPath:context:", v6, @"operationCount", compoundliteral_1);

      [(ICCloudContext *)v6 setDidAddObservers:1];
      objc_destroyWeak(&v42);
      objc_destroyWeak(&location);
    }
    else
    {
      [(ICCloudContext *)v6 setDidAddObservers:0];
    }
    [(ICCloudContext *)v6 updateConfiguration:0];
  }

  return v6;
}

- (BOOL)hasNoteContextOptions:(unint64_t)a3
{
  v5 = [(ICCloudContext *)self cloudContextDelegate];
  if (v5)
  {
    BOOL v6 = [(ICCloudContext *)self cloudContextDelegate];
    char v7 = [v6 cloudContext:self hasContextOptions:a3];
  }
  else
  {
    BOOL v6 = +[ICNoteContext sharedContext];
    char v7 = [v6 hasContextOptions:a3];
  }
  BOOL v8 = v7;

  return v8;
}

- (id)viewContext
{
  int64_t v3 = [(ICCloudContext *)self cloudContextDelegate];
  if (v3)
  {
    id v4 = [(ICCloudContext *)self cloudContextDelegate];
    [v4 viewContextForCloudContext:self];
  }
  else
  {
    id v4 = +[ICNoteContext sharedContext];
    [v4 managedObjectContext];
  v5 = };

  return v5;
}

- (ICCloudContextDelegate)cloudContextDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudContextDelegate);
  return (ICCloudContextDelegate *)WeakRetained;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)updateConfiguration:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__ICCloudContext_updateConfiguration___block_invoke;
  aBlock[3] = &unk_1E64A7E28;
  aBlock[4] = self;
  id v3 = a3;
  id v4 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_opt_class();
  v5 = [v3 object];

  BOOL v6 = ICDynamicCast();

  if (v6) {
    v4[2](v4, v6);
  }
  else {
    +[ICCloudConfiguration loadSharedConfigurationWithCompletionHandler:v4];
  }
}

- (void)setCloudContextDelegate:(id)a3
{
}

- (void)setSyncOnlyIfReachable:(BOOL)a3
{
  self->_syncOnlyIfReachable = a3;
}

- (void)setSubscribedSubscriptionIDs:(id)a3
{
}

- (void)setRetryCountsByOperationType:(id)a3
{
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (void)setProcessingQueue:(id)a3
{
}

- (void)setOperationQueue:(id)a3
{
}

- (void)setOperationIDsBeforeEnqueuingLongLivedOperations:(id)a3
{
}

- (void)setObjectIDsToRetry:(id)a3
{
}

- (void)setObjectIDsToProcess:(id)a3
{
}

- (void)setNeedsToUpdateSubscriptions:(BOOL)a3
{
  self->_needsToUpdateSubscriptions = a3;
}

- (void)setFetchingEnabled:(BOOL)a3
{
  self->_fetchingEnabled = a3;
}

- (void)setEnableLongLivedOperations:(BOOL)a3
{
  self->_enableLongLivedOperations = a3;
}

- (void)setDiscretionaryNetworkBehavior:(unint64_t)a3
{
  self->_discretionaryNetworkBehavior = a3;
}

- (void)setDisabledInternal:(BOOL)a3
{
  self->_disabledInternal = a3;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (void)setDisableAutomaticallyRetryNetworkFailures:(BOOL)a3
{
  self->_disableAutomaticallyRetryNetworkFailures = a3;
}

- (void)setDidEnqueueLongLivedOperations:(BOOL)a3
{
  self->_didEnqueueLongLivedOperations = a3;
}

- (void)setDidAddObservers:(BOOL)a3
{
  self->_didAddObservers = a3;
}

- (void)setContainersCreationQueue:(id)a3
{
}

- (void)setAccountZoneIDsNeedingToBeSaved:(id)a3
{
}

- (void)setAccountZoneIDsNeedingFetchChanges:(id)a3
{
}

- (void)setAccountZoneIDsFetchingChanges:(id)a3
{
}

+ (id)errorForDisabledCloudSyncing
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"Cloud syncing is not enabled.";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [v2 errorWithDomain:@"com.apple.notes.cloud" code:1 userInfo:v3];

  return v4;
}

- (void)syncWithReason:(id)a3 completionHandler:(id)a4
{
}

- (void)setCloudAnalyticsDelegate:(id)a3
{
}

+ (id)newNotesContainer
{
  return (id)[a1 newNotesContainerForAccountID:0];
}

+ (id)newNotesContainerForAccountID:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (ICIsSandboxModeEnabled()) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F19ED8]) initWithContainerIdentifier:@"com.apple.notes" environment:v4];
  id v6 = objc_alloc_init(MEMORY[0x1E4F19EE0]);
  if ([v3 length])
  {
    char v7 = [objc_alloc(MEMORY[0x1E4F19E30]) initWithAccountID:v3];
    [v6 setAccountOverrideInfo:v7];
    BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v5 options:v6];
    uint64_t v9 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      id v25 = v3;
      _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_DEFAULT, "Created new container for account ID %@", (uint8_t *)&v24, 0xCu);
    }
  }
  else
  {
    BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v5];
    char v7 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEFAULT, "Created new default container", (uint8_t *)&v24, 2u);
    }
  }

  dispatch_queue_t v10 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v11 = [v10 bundleIdentifier];

  dispatch_queue_t v12 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    id v25 = v11;
    _os_log_impl(&dword_1C3A61000, v12, OS_LOG_TYPE_DEFAULT, "BundleIDDebug: bundleIdentifier is %@", (uint8_t *)&v24, 0xCu);
  }

  os_log_t v13 = ICNotesAppBundleIdentifier();
  char v14 = [v11 hasPrefix:v13];

  if ((v14 & 1) == 0)
  {
    v15 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = ICNotesAppBundleIdentifier();
      int v24 = 138412290;
      id v25 = v16;
      _os_log_impl(&dword_1C3A61000, v15, OS_LOG_TYPE_DEFAULT, "BundleIDDebug: bundleIdentifier does not have prefix %@, so updating bundleID", (uint8_t *)&v24, 0xCu);
    }
    v17 = ICNotesAppBundleIdentifier();
    BOOL v18 = [v8 options];
    [v18 setApplicationBundleIdentifierOverrideForContainerAccess:v17];

    int v19 = ICNotesAppBundleIdentifier();
    v20 = [v8 options];
    [v20 setApplicationBundleIdentifierOverrideForNetworkAttribution:v19];

    int v21 = ICNotesAppBundleIdentifier();
    id v22 = [v8 options];
    [v22 setApplicationBundleIdentifierOverrideForPushTopicGeneration:v21];
  }
  return v8;
}

void __35__ICCloudContext_initWithDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateCloudContextState];
}

- (id)persistentStoreCoordinator
{
  id v3 = [(ICCloudContext *)self cloudContextDelegate];
  if (v3)
  {
    uint64_t v4 = [(ICCloudContext *)self cloudContextDelegate];
    [v4 persistentStoreCoordinatorForCloudContext:self];
  }
  else
  {
    uint64_t v4 = +[ICNoteContext sharedContext];
    [v4 persistentStoreCoordinator];
  v5 = };

  return v5;
}

- (id)backgroundContext
{
  id v3 = [(ICCloudContext *)self cloudContextDelegate];
  if (v3)
  {
    uint64_t v4 = [(ICCloudContext *)self cloudContextDelegate];
    [v4 backgroundContextForCloudContext:self];
  }
  else
  {
    uint64_t v4 = +[ICNoteContext sharedContext];
    [v4 workerManagedObjectContext];
  v5 = };

  return v5;
}

- (NSDictionary)containersByAccountID
{
  id v3 = [(ICCloudContext *)self containersCreationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__ICCloudContext_containersByAccountID__block_invoke;
  block[3] = &unk_1E64A4240;
  block[4] = self;
  dispatch_sync(v3, block);

  return self->_containersByAccountID;
}

void __39__ICCloudContext_containersByAccountID__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (!v2[15])
  {
    id v3 = [v2 cloudContextDelegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      v5 = [*(id *)(a1 + 32) cloudContextDelegate];
      uint64_t v6 = [v5 containersByAccountIDForCloudContext:*(void *)(a1 + 32)];
      uint64_t v7 = *(void *)(a1 + 32);
      BOOL v8 = *(void **)(v7 + 120);
      *(void *)(v7 + 120) = v6;
    }
    if (!*(void *)(*(void *)(a1 + 32) + 120))
    {
      uint64_t v9 = objc_opt_new();
      dispatch_queue_t v10 = [*(id *)(a1 + 32) backgroundContext];
      uint64_t v11 = [*(id *)(a1 + 32) cloudContextDelegate];
      dispatch_queue_t v12 = [v11 accountIDsForCloudContext:*(void *)(a1 + 32) managedObjectContext:v10];

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v24;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v24 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * v17);
            int v19 = objc_msgSend((id)objc_opt_class(), "newNotesContainerForAccountID:", v18, (void)v23);
            [v9 setObject:v19 forKeyedSubscript:v18];

            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v15);
      }

      uint64_t v20 = [v9 copy];
      uint64_t v21 = *(void *)(a1 + 32);
      id v22 = *(void **)(v21 + 120);
      *(void *)(v21 + 120) = v20;
    }
  }
}

- (void)clearContainers
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Clearing cloud containers.", v2, v3, v4, v5, v6);
}

void __33__ICCloudContext_clearContainers__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 120);
  *(void *)(v1 + 120) = 0;
}

- (id)containerForAccountID:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"accountID != ((void *)0)" functionName:"-[ICCloudContext containerForAccountID:]" simulateCrash:1 showAlert:0 format:@"accountID must not be nil to get container."];
  }
  if ([v4 length])
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__47;
    uint64_t v16 = __Block_byref_object_dispose__47;
    uint64_t v5 = [(ICCloudContext *)self containersByAccountID];
    id v17 = [v5 objectForKeyedSubscript:v4];

    uint8_t v6 = [(ICCloudContext *)self containersCreationQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__ICCloudContext_containerForAccountID___block_invoke;
    block[3] = &unk_1E64A4ED8;
    uint64_t v11 = &v12;
    block[4] = self;
    id v10 = v4;
    dispatch_sync(v6, block);

    id v7 = (id)v13[5];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __40__ICCloudContext_containerForAccountID___block_invoke(void *a1)
{
  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v2 = [(id)objc_opt_class() newNotesContainerForAccountID:a1[5]];
    uint64_t v3 = *(void *)(a1[6] + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    uint64_t v5 = (void *)[*(id *)(a1[4] + 120) mutableCopy];
    [v5 setObject:*(void *)(*(void *)(a1[6] + 8) + 40) forKeyedSubscript:a1[5]];
    uint64_t v6 = a1[4];
    id v7 = *(void **)(v6 + 120);
    *(void *)(v6 + 120) = v5;
  }
}

- (id)invernessClientForAccountID:(id)a3
{
  uint64_t v3 = [(ICCloudContext *)self containerForAccountID:a3];
  id v4 = [[ICNotesInvernessClient alloc] initWithContainer:v3];

  return v4;
}

- (void)dealloc
{
  if ([(ICCloudContext *)self didAddObservers])
  {
    uint64_t v3 = [(ICCloudContext *)self operationQueue];
    objc_msgSend(v3, "ic_removeObserver:forKeyPath:context:", self, @"operationCount", compoundliteral_1);
  }
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  id v4 = [(ICCloudContext *)self retryTimer];
  [v4 invalidate];

  uint64_t v5 = [(ICCloudContext *)self processingSelectorDelayer];
  [v5 cancelPreviousFireRequests];

  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)ICCloudContext;
  [(ICCloudContext *)&v7 dealloc];
}

- (NSDictionary)cloudObjectClassesByRecordType
{
  v5[11] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Note";
  v5[0] = objc_opt_class();
  v4[1] = @"Folder";
  v5[1] = objc_opt_class();
  v4[2] = @"Attachment";
  v5[2] = objc_opt_class();
  v4[3] = @"InlineAttachment";
  v5[3] = objc_opt_class();
  v4[4] = @"Media";
  v5[4] = objc_opt_class();
  v4[5] = @"MigrationState";
  v5[5] = objc_opt_class();
  v4[6] = @"LegacyTombstone";
  v5[6] = objc_opt_class();
  v4[7] = *MEMORY[0x1E4F19D80];
  v5[7] = objc_opt_class();
  v4[8] = @"PasswordProtectedNote";
  v5[8] = objc_opt_class();
  v4[9] = @"AccountData";
  v5[9] = objc_opt_class();
  v4[10] = @"Hashtag";
  v5[10] = objc_opt_class();
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:11];
  return (NSDictionary *)v2;
}

+ (CKRecordZoneID)notesZoneID
{
  if (notesZoneID_onceToken != -1) {
    dispatch_once(&notesZoneID_onceToken, &__block_literal_global_128_0);
  }
  uint64_t v2 = (void *)notesZoneID_sNotesZoneID;
  return (CKRecordZoneID *)v2;
}

void __29__ICCloudContext_notesZoneID__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1A320]);
  uint64_t v1 = [v0 initWithZoneName:@"Notes" ownerName:*MEMORY[0x1E4F19C08]];
  uint64_t v2 = (void *)notesZoneID_sNotesZoneID;
  notesZoneID_sNotesZoneID = v1;
}

+ (CKRecordZoneID)metadataZoneID
{
  if (metadataZoneID_onceToken != -1) {
    dispatch_once(&metadataZoneID_onceToken, &__block_literal_global_131_0);
  }
  uint64_t v2 = (void *)metadataZoneID_sMetadataZoneID;
  return (CKRecordZoneID *)v2;
}

void __32__ICCloudContext_metadataZoneID__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1A320]);
  uint64_t v1 = [v0 initWithZoneName:@"Metadata" ownerName:*MEMORY[0x1E4F19C08]];
  uint64_t v2 = (void *)metadataZoneID_sMetadataZoneID;
  metadataZoneID_sMetadataZoneID = v1;
}

- (void)reachabilityChanged:(id)a3
{
  BOOL v4 = [(ICCloudContext *)self isInternetReachable];
  uint64_t v5 = os_log_create("com.apple.notes", "Cloud");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6) {
      -[ICCloudContext reachabilityChanged:]();
    }

    [(ICCloudContext *)self processPendingCloudObjects];
  }
  else
  {
    if (v6) {
      -[ICCloudContext reachabilityChanged:]();
    }
  }
  [(ICCloudContext *)self updateCloudContextState];
}

- (void)cloudKitAccountChanged:(id)a3
{
  BOOL v4 = [(ICCloudContext *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__ICCloudContext_cloudKitAccountChanged___block_invoke;
  block[3] = &unk_1E64A4240;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __41__ICCloudContext_cloudKitAccountChanged___block_invoke(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __41__ICCloudContext_cloudKitAccountChanged___block_invoke_cold_1();
  }

  uint64_t v3 = [*(id *)(a1 + 32) accountStatus];
  BOOL v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__ICCloudContext_cloudKitAccountChanged___block_invoke_132;
  v6[3] = &unk_1E64A7E50;
  v6[4] = v4;
  v6[5] = v3;
  return [v4 updateAccountStatusWithCompletionHandler:v6];
}

uint64_t __41__ICCloudContext_cloudKitAccountChanged___block_invoke_132(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 40) != a2) {
    return [*(id *)(result + 32) updateCloudContextState];
  }
  return result;
}

- (BOOL)hasPendingOperations
{
  uint64_t v2 = [(ICCloudContext *)self operationQueue];
  BOOL v3 = [v2 operationCount] != 0;

  return v3;
}

- (void)printOperationQueue
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 operationQueue];
  [v1 operationCount];
  OUTLINED_FUNCTION_29(&dword_1C3A61000, v2, v3, "Operation queue has %d operation(s):%@", v4, v5, v6, v7, 2u);
}

+ (void)registerStateHandler
{
}

id __38__ICCloudContext_registerStateHandler__block_invoke()
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
  id v0 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v1 = +[ICCloudContext sharedContext];
  uint64_t v2 = [v1 operationQueue];
  uint64_t v3 = [v2 operations];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v9 = NSString;
        id v10 = (objc_class *)objc_opt_class();
        uint64_t v11 = NSStringFromClass(v10);
        uint64_t v12 = objc_msgSend(v8, "ic_loggingIdentifier");
        id v13 = [v9 stringWithFormat:@"%@ %@", v11, v12];

        uint64_t v14 = objc_msgSend(v8, "ic_loggingValues");
        [v0 setObject:v14 forKeyedSubscript:v13];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  [v16 setObject:v0 forKeyedSubscript:@"operations"];
  return v16;
}

- (id)allZoneIDs
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[ICCloudContext notesZoneID];
  v6[0] = v2;
  uint64_t v3 = +[ICCloudContext metadataZoneID];
  v6[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (void)receivedZoneNotFound:(id)a3 operation:(id)a4 context:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 database];
  uint64_t v12 = [(ICCloudContext *)self accountIDForDatabase:v11];

  int v13 = objc_msgSend(v8, "ic_isOwnedByCurrentUser");
  uint64_t v14 = os_log_create("com.apple.notes", "Cloud");
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      uint64_t v16 = objc_msgSend(v8, "ic_loggingDescription");
      long long v17 = objc_msgSend(v9, "ic_loggingDescription");
      int v24 = 138412546;
      long long v25 = v16;
      __int16 v26 = 2112;
      v27 = v17;
      _os_log_impl(&dword_1C3A61000, v14, OS_LOG_TYPE_DEFAULT, "Zone not found %@ %@", (uint8_t *)&v24, 0x16u);
    }
    long long v18 = [(ICCloudContext *)self accountZoneIDsNeedingToBeSaved];
    objc_msgSend(v18, "ic_addZoneID:forAccountID:", v8, v12);

    long long v19 = [(ICCloudContext *)self cloudContextDelegate];
    [v19 cloudContext:self receivedZoneNotFound:v8 accountID:v12];
  }
  else
  {
    if (v15)
    {
      long long v20 = objc_msgSend(v8, "ic_loggingDescription");
      uint64_t v21 = objc_msgSend(v9, "ic_loggingDescription");
      int v24 = 138412546;
      long long v25 = v20;
      __int16 v26 = 2112;
      v27 = v21;
      _os_log_impl(&dword_1C3A61000, v14, OS_LOG_TYPE_DEFAULT, "Shared zone not found %@ %@", (uint8_t *)&v24, 0x16u);
    }
    uint64_t v22 = [(ICCloudContext *)self accountZoneIDsFetchingChanges];
    objc_msgSend(v22, "ic_removeZoneID:forAccountID:", v8, v12);

    long long v19 = [(ICCloudContext *)self cloudContextDelegate];
    [v19 cloudContext:self sharedZoneWasDeleted:v8 accountID:v12];
  }

  [(ICCloudContext *)self saveZoneFetchState];
  long long v23 = [v9 database];
  -[ICCloudContext deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:context:](self, "deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:context:", v8, [v23 databaseScope], v12, v10);
}

- (id)allCloudObjectIDsInContext:(id)a3
{
  return [(ICCloudContext *)self allCloudObjectIDsInContext:a3 predicate:0];
}

- (id)allCloudObjectIDsInContext:(id)a3 predicate:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA80];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 set];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__ICCloudContext_allCloudObjectIDsInContext_predicate___block_invoke;
  v12[3] = &unk_1E64A7E98;
  id v13 = v8;
  id v9 = v8;
  +[ICCloudSyncingObject enumerateAllCloudObjectsInContext:v7 predicate:v6 sortDescriptors:0 relationshipKeyPathsForPrefetching:0 batchSize:20 saveAfterBatch:0 usingBlock:v12];

  id v10 = (void *)[v9 copy];
  return v10;
}

void __55__ICCloudContext_allCloudObjectIDsInContext_predicate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 objectID];
  [v2 addObject:v3];
}

- (void)enumerateAllCloudObjectsInContext:(id)a3 batchSize:(unint64_t)a4 saveAfterBatch:(BOOL)a5 usingBlock:(id)a6
{
}

void __73__ICCloudContext_syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    uint64_t v4 = [(id)objc_opt_class() errorFromErrors:v3];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    id v9 = __73__ICCloudContext_syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_2;
    id v10 = &unk_1E64A56C8;
    id v5 = *(id *)(a1 + 40);
    id v11 = v4;
    id v12 = v5;
    id v6 = v4;
    dispatch_async(MEMORY[0x1E4F14428], &v7);
  }
  objc_msgSend(*(id *)(a1 + 32), "syncCompletedWithErrors:", v3, v7, v8, v9, v10);
}

uint64_t __73__ICCloudContext_syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_syncWithReason:(id)a3 uploadUnsyncedChanges:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudContext _syncWithReason:uploadUnsyncedChanges:completionHandler:]();
  }

  [MEMORY[0x1E4F837E8] postFullSyncTelemetryWithReason:v8];
  id v11 = [MEMORY[0x1E4F1CA48] array];
  id v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke;
  v24[3] = &unk_1E64A7F38;
  id v13 = v11;
  id v25 = v13;
  __int16 v26 = self;
  id v14 = v8;
  id v27 = v14;
  BOOL v29 = a4;
  BOOL v15 = v12;
  uint64_t v28 = v15;
  [(ICCloudContext *)self fetchDatabaseChangesWithReason:v14 completionHandler:v24];
  if (v9)
  {
    uint64_t v16 = dispatch_get_global_queue(0, 0);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    long long v19 = __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_164;
    long long v20 = &unk_1E64A4578;
    uint64_t v21 = self;
    id v22 = v13;
    id v23 = v9;
    dispatch_group_notify(v15, v16, &v17);
  }
  -[ICCloudContext syncCompletedWithErrors:](self, "syncCompletedWithErrors:", v13, v17, v18, v19, v20, v21);
}

void __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.notes", "Cloud");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_INFO, "Error fetching database changes during sync", buf, 2u);
    }

    [*(id *)(a1 + 32) addObject:v3];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_cold_1();
    }
  }
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_161;
  v10[3] = &unk_1E64A7F10;
  id v8 = *(id *)(a1 + 32);
  char v14 = *(unsigned char *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 40);
  id v11 = v8;
  uint64_t v12 = v9;
  id v13 = *(id *)(a1 + 56);
  [v6 fetchRecordZoneChangesWithReason:v7 completionHandler:v10];
}

void __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_161(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.notes", "Cloud");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_INFO, "Error fetching record zone changes during sync", buf, 2u);
    }

    [*(id *)(a1 + 32) addObject:v3];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_161_cold_1();
    }
  }
  if (*(unsigned char *)(a1 + 56))
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_162;
    v7[3] = &unk_1E64A7EE8;
    id v6 = *(void **)(a1 + 40);
    id v8 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 48);
    [v6 processAllCloudObjectsWithCompletionHandler:v7];
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

void __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_162(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.notes", "Cloud");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_INFO, "Error while processing for full sync", v6, 2u);
    }

    [*(id *)(a1 + 32) addObjectsFromArray:v3];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_162_cold_1();
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_164(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() errorFromErrors:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)syncCompletedWithErrors:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudContext syncCompletedWithErrors:](v4);
  }

  if (![v4 count])
  {
    id v6 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v7 = [(ICCloudContext *)self backgroundContext];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __42__ICCloudContext_syncCompletedWithErrors___block_invoke;
    char v14 = &unk_1E64A4218;
    id v15 = v7;
    id v16 = v6;
    id v8 = v6;
    id v9 = v7;
    [v9 performBlockAndWait:&v11];
    id v10 = objc_msgSend(MEMORY[0x1E4F28C40], "defaultCenter", v11, v12, v13, v14);
    [v10 postNotificationName:@"ICCloudContextSyncCompletedNotification" object:0];
  }
}

uint64_t __42__ICCloudContext_syncCompletedWithErrors___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = +[ICAccount allActiveCloudKitAccountsInContext:](ICAccount, "allActiveCloudKitAccountsInContext:", *(void *)(a1 + 32), 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) setLastSyncDate:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 32), "ic_save");
}

- (void)cancelEverythingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E64A4F70;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v2 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v3 = [*(id *)(a1 + 32) operationQueue];
  id v4 = [v3 operations];
  uint64_t v5 = (void *)[v4 copy];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v34;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v33 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v9, "ic_removeAllCompletionBlocks");
        }
        long long v10 = objc_msgSend(v9, "ic_loggingDescription");
        [v2 appendFormat:@"\n\t%@", v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v6);
  }

  long long v11 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) setDisabledInternal:1];
  [*(id *)(a1 + 32) clearPendingActivity];
  uint64_t v12 = [*(id *)(a1 + 32) operationQueue];
  [v12 cancelAllOperations];

  uint64_t v13 = [*(id *)(a1 + 32) processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_168;
  block[3] = &unk_1E64A4240;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v13, block);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_2;
  aBlock[3] = &unk_1E64A4F70;
  aBlock[4] = *(void *)(a1 + 32);
  id v31 = *(id *)(a1 + 40);
  char v14 = _Block_copy(aBlock);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__47;
  v28[4] = __Block_byref_object_dispose__47;
  id v29 = (id)MEMORY[0x1E4F1CC28];
  dispatch_time_t v15 = dispatch_time(0, 5000000000);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_4;
  v25[3] = &unk_1E64A7F60;
  id v27 = v28;
  id v16 = v14;
  id v26 = v16;
  dispatch_after(v15, MEMORY[0x1E4F14428], v25);
  uint64_t v17 = (const char *)[@"com.apple.notes.cloud.waiting" UTF8String];
  uint64_t v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  long long v19 = dispatch_queue_create(v17, v18);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_169;
  v22[3] = &unk_1E64A7F88;
  uint64_t v20 = *(void *)(a1 + 32);
  id v23 = v16;
  int v24 = v28;
  v22[4] = v20;
  id v21 = v16;
  dispatch_async(v19, v22);

  _Block_object_dispose(v28, 8);
}

uint64_t __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_168(uint64_t a1)
{
  return [*(id *)(a1 + 32) loadZoneFetchState];
}

void __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) clearPendingActivity];
  [*(id *)(a1 + 32) setDisabledInternal:0];
  if (*(void *)(a1 + 40))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_3;
    block[3] = &unk_1E64A56A0;
    id v3 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) BOOLValue] & 1) == 0)
  {
    id v2 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_4_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = MEMORY[0x1E4F1CC38];
  }
}

void __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_169(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) operationQueue];
  [v2 waitUntilAllOperationsAreFinished];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_2_170;
  block[3] = &unk_1E64A7F60;
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_2_170(uint64_t a1)
{
  if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) BOOLValue] & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = MEMORY[0x1E4F1CC38];
  }
}

- (void)clearPendingActivity
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "clearPendingActivity called", v2, v3, v4, v5, v6);
}

void __38__ICCloudContext_clearPendingActivity__block_invoke(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __38__ICCloudContext_clearPendingActivity__block_invoke_cold_2();
  }

  uint64_t v3 = [*(id *)(a1 + 32) objectIDsToProcess];
  [v3 removeAllObjects];

  uint64_t v4 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __38__ICCloudContext_clearPendingActivity__block_invoke_cold_1();
  }

  uint64_t v5 = [*(id *)(a1 + 32) objectIDsToRetry];
  [v5 removeAllObjects];
}

uint64_t __38__ICCloudContext_clearPendingActivity__block_invoke_171(uint64_t a1)
{
  return [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32)];
}

- (void)deleteRecordZonesWithZoneIDs:(id)a3 accountID:(id)a4 markZonesAsUserPurged:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109634;
    BOOL v36 = v7;
    __int16 v37 = 2112;
    id v38 = v11;
    __int16 v39 = 2112;
    id v40 = v10;
    _os_log_debug_impl(&dword_1C3A61000, v13, OS_LOG_TYPE_DEBUG, "Deleting record zones (markZonesAsUserPurged=%d) in account ID %@: %@", buf, 0x1Cu);
  }

  if ([v11 length])
  {
    char v14 = [(ICCloudContext *)self containerForAccountID:v11];
    dispatch_time_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F1A180]) initWithRecordZonesToSave:0 recordZoneIDsToDelete:v10];
    objc_msgSend(v15, "setQualityOfService:", -[ICCloudContext qualityOfService](self, "qualityOfService"));
    unint64_t v16 = [(ICCloudContext *)self discretionaryNetworkBehavior];
    uint64_t v17 = [v15 configuration];
    [v17 setDiscretionaryNetworkBehavior:v16];

    uint64_t v18 = [v14 privateCloudDatabase];
    [v15 setDatabase:v18];
    [v15 setMarkZonesAsUserPurged:v7];
    long long v19 = [(ICCloudContext *)self backgroundContext];
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    id v27 = __97__ICCloudContext_deleteRecordZonesWithZoneIDs_accountID_markZonesAsUserPurged_completionHandler___block_invoke;
    uint64_t v28 = &unk_1E64A7FF8;
    id v29 = v11;
    v30 = self;
    id v31 = v18;
    id v32 = v19;
    id v33 = v12;
    id v20 = v19;
    id v21 = v18;
    [v15 setModifyRecordZonesCompletionBlock:&v25];
    id v22 = objc_alloc_init(MEMORY[0x1E4F1A218]);
    objc_msgSend(v22, "setName:", @"DeleteRecordZones", v25, v26, v27, v28);
    objc_msgSend(v22, "setQuantity:", objc_msgSend(v10, "count"));
    [v22 setExpectedSendSize:1];
    [v22 setExpectedReceiveSize:1];
    [v15 setGroup:v22];
    long long v34 = v15;
    id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    [(ICCloudContext *)self addOperations:v23];

LABEL_9:
    goto LABEL_10;
  }
  int v24 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    -[ICCloudContext deleteRecordZonesWithZoneIDs:accountID:markZonesAsUserPurged:completionHandler:]();
  }

  if (v12)
  {
    char v14 = ICGenericError();
    (*((void (**)(id, void *))v12 + 2))(v12, v14);
    goto LABEL_9;
  }
LABEL_10:
}

void __97__ICCloudContext_deleteRecordZonesWithZoneIDs_accountID_markZonesAsUserPurged_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = os_log_create("com.apple.notes", "Cloud");
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __97__ICCloudContext_deleteRecordZonesWithZoneIDs_accountID_markZonesAsUserPurged_completionHandler___block_invoke_cold_2();
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    __97__ICCloudContext_deleteRecordZonesWithZoneIDs_accountID_markZonesAsUserPurged_completionHandler___block_invoke_cold_1();
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(a1 + 40), "deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:context:", *(void *)(*((void *)&v25 + 1) + 8 * v16++), objc_msgSend(*(id *)(a1 + 48), "databaseScope"), *(void *)(a1 + 32), *(void *)(a1 + 56));
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }

  [*(id *)(a1 + 40) updateCloudContextState];
  uint64_t v17 = [*(id *)(a1 + 40) backgroundContext];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __97__ICCloudContext_deleteRecordZonesWithZoneIDs_accountID_markZonesAsUserPurged_completionHandler___block_invoke_173;
  v21[3] = &unk_1E64A7FD0;
  v21[4] = *(void *)(a1 + 40);
  id v22 = v17;
  id v18 = *(id *)(a1 + 64);
  id v23 = v9;
  id v24 = v18;
  id v19 = v9;
  id v20 = v17;
  [v20 performBlockAndWait:v21];
}

uint64_t __97__ICCloudContext_deleteRecordZonesWithZoneIDs_accountID_markZonesAsUserPurged_completionHandler___block_invoke_173(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __97__ICCloudContext_deleteRecordZonesWithZoneIDs_accountID_markZonesAsUserPurged_completionHandler___block_invoke_173_cold_1();
  }

  [*(id *)(a1 + 32) enumerateAllCloudObjectsInContext:*(void *)(a1 + 40) batchSize:10 saveAfterBatch:1 usingBlock:&__block_literal_global_176];
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 48));
  }
  return result;
}

void __97__ICCloudContext_deleteRecordZonesWithZoneIDs_accountID_markZonesAsUserPurged_completionHandler___block_invoke_174(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  ICCheckedDynamicCast();
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  [v3 clearServerRecords];
}

- (BOOL)isFetchingAllRecordZones
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(ICCloudContext *)self operationQueue];
  id v3 = [v2 operations];
  uint64_t v4 = (void *)[v3 copy];

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
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v5) = 1;
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

  return v5;
}

- (BOOL)isInternetReachable
{
  return [MEMORY[0x1E4F837F8] isInternetReachable];
}

+ (id)errorForWaitingForRetryTimer
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"Cloud syncing is waiting for retry timer.";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  uint64_t v4 = [v2 errorWithDomain:@"com.apple.notes.cloud" code:2 userInfo:v3];

  return v4;
}

+ (id)errorFromErrors:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] == 1)
    {
      uint64_t v4 = [v3 firstObject];
    }
    else
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
      id v8 = @"Errors";
      v9[0] = v3;
      uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
      uint64_t v4 = [v5 errorWithDomain:@"com.apple.notes.cloud" code:3 userInfo:v6];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)errorFromOperations:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        long long v11 = objc_msgSend(v10, "error", (void)v15);

        if (v11)
        {
          long long v12 = [v10 error];
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  uint64_t v13 = [(id)objc_opt_class() errorFromErrors:v4];

  return v13;
}

- (double)timeIntervalToRetryAfterFromError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v15 = 0;
    long long v16 = (double *)&v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0;
    id v5 = [v3 userInfo];
    uint64_t v6 = *MEMORY[0x1E4F19C60];
    uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F19C60]];

    if (v7)
    {
      uint64_t v8 = [v4 userInfo];
      long long v9 = [v8 objectForKeyedSubscript:v6];
      [v9 doubleValue];
      *((void *)v16 + 3) = v10;
    }
    else
    {
      if ([v4 code] != 2)
      {
LABEL_8:
        double v11 = v16[3];
        _Block_object_dispose(&v15, 8);
        goto LABEL_9;
      }
      long long v12 = [v4 userInfo];
      uint64_t v8 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __52__ICCloudContext_timeIntervalToRetryAfterFromError___block_invoke;
      void v14[3] = &unk_1E64A8020;
      v14[4] = &v15;
      [v8 enumerateKeysAndObjectsUsingBlock:v14];
    }

    goto LABEL_8;
  }
  double v11 = 0.0;
LABEL_9:

  return v11;
}

void __52__ICCloudContext_timeIntervalToRetryAfterFromError___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v6 = [a3 userInfo];
  id v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F19C60]];

  uint64_t v7 = v9;
  if (v9)
  {
    [v9 doubleValue];
    uint64_t v7 = v9;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
    *a4 = 1;
  }
}

- (void)finishOperationsForRecordID:(id)a3 completionHandler:(id)a4
{
}

- (void)finishOperationsForRecordID:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(ICCloudContext *)self processingQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__ICCloudContext_finishOperationsForRecordID_qualityOfService_completionHandler___block_invoke;
  v13[3] = &unk_1E64A8048;
  id v16 = v9;
  int64_t v17 = a4;
  id v14 = v8;
  uint64_t v15 = self;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __81__ICCloudContext_finishOperationsForRecordID_qualityOfService_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __81__ICCloudContext_finishOperationsForRecordID_qualityOfService_completionHandler___block_invoke_cold_1(a1);
  }

  id v3 = (void *)MEMORY[0x1E4F28B48];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __81__ICCloudContext_finishOperationsForRecordID_qualityOfService_completionHandler___block_invoke_193;
  v46[3] = &unk_1E64A4F70;
  id v47 = *(id *)(a1 + 32);
  id v48 = *(id *)(a1 + 48);
  uint64_t v4 = [v3 blockOperationWithBlock:v46];
  [v4 setQualityOfService:*(void *)(a1 + 56)];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v5 = [*(id *)(a1 + 40) operationQueue];
  uint64_t v6 = [v5 operations];

  uint64_t v7 = v6;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v42 objects:v55 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v43;
    *(void *)&long long v9 = 138412546;
    long long v33 = v9;
    long long v35 = v4;
    uint64_t v36 = *(void *)v43;
    long long v34 = v6;
    do
    {
      uint64_t v12 = 0;
      uint64_t v37 = v10;
      do
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v42 + 1) + 8 * v12);
        objc_msgSend(v13, "setQualityOfService:", *(void *)(a1 + 56), v33);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_27;
          }
          id v24 = v13;
          long long v25 = [v24 recordIDs];
          char v26 = [v25 containsObject:*(void *)(a1 + 32)];

          uint64_t v11 = v36;
          if ((v26 & 1) == 0) {
            goto LABEL_27;
          }
          goto LABEL_24;
        }
        id v14 = v13;
        uint64_t v15 = [v14 recordIDsToDelete];
        char v16 = [v15 containsObject:*(void *)(a1 + 32)];

        if (v16)
        {
LABEL_23:

          uint64_t v10 = v37;
LABEL_24:
          long long v27 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            long long v28 = objc_msgSend(v13, "ic_loggingDescription");
            id v29 = objc_msgSend(*(id *)(a1 + 32), "ic_loggingDescription");
            *(_DWORD *)buf = v33;
            v51 = v28;
            __int16 v52 = 2112;
            v53 = v29;
            _os_log_debug_impl(&dword_1C3A61000, v27, OS_LOG_TYPE_DEBUG, "Waiting on operation %@ for record ID %@", buf, 0x16u);

            uint64_t v11 = v36;
          }

          [v4 addDependency:v13];
          goto LABEL_27;
        }
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        int64_t v17 = [v14 recordsToSave];
        uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v54 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v39;
          while (2)
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v39 != v20) {
                objc_enumerationMutation(v17);
              }
              id v22 = [*(id *)(*((void *)&v38 + 1) + 8 * i) recordID];
              int v23 = [v22 isEqual:*(void *)(a1 + 32)];

              if (v23)
              {

                uint64_t v7 = v34;
                uint64_t v4 = v35;
                uint64_t v11 = v36;
                goto LABEL_23;
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v38 objects:v54 count:16];
            if (v19) {
              continue;
            }
            break;
          }

          uint64_t v7 = v34;
          uint64_t v4 = v35;
          uint64_t v11 = v36;
        }
        else
        {
        }
        uint64_t v10 = v37;
LABEL_27:
        ++v12;
      }
      while (v12 != v10);
      uint64_t v30 = [v7 countByEnumeratingWithState:&v42 objects:v55 count:16];
      uint64_t v10 = v30;
    }
    while (v30);
  }

  objc_msgSend(v4, "ic_setResistsCancellation:", 1);
  id v31 = *(void **)(a1 + 40);
  v49 = v4;
  id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
  [v31 addOperations:v32];
}

uint64_t __81__ICCloudContext_finishOperationsForRecordID_qualityOfService_completionHandler___block_invoke_193(uint64_t a1)
{
  id v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __81__ICCloudContext_finishOperationsForRecordID_qualityOfService_completionHandler___block_invoke_193_cold_1(a1);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)pauseCloudSyncWhileSynchronouslyPerformingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCloudContext *)self processingQueue];
  dispatch_sync(v5, v4);
}

- (void)ingestCloudKitRecord:(id)a3 forAccountID:(id)a4 forceMerge:(BOOL)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [(ICCloudContext *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__ICCloudContext_ingestCloudKitRecord_forAccountID_forceMerge_context___block_invoke;
  block[3] = &unk_1E64A8070;
  BOOL v22 = a5;
  id v18 = v11;
  id v19 = v10;
  uint64_t v20 = self;
  id v21 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_sync(v13, block);
}

uint64_t __71__ICCloudContext_ingestCloudKitRecord_forAccountID_forceMerge_context___block_invoke(uint64_t a1)
{
  id v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __71__ICCloudContext_ingestCloudKitRecord_forAccountID_forceMerge_context___block_invoke_cold_1(a1);
  }

  return [*(id *)(a1 + 48) _ingestCloudKitRecord:*(void *)(a1 + 40) forAccountID:*(void *)(a1 + 32) forceMerge:*(unsigned __int8 *)(a1 + 64) context:*(void *)(a1 + 56)];
}

- (void)_ingestCloudKitRecord:(id)a3 forAccountID:(id)a4 forceMerge:(BOOL)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [(ICCloudContext *)self processingQueue];
  dispatch_assert_queue_V2(v13);

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__ICCloudContext__ingestCloudKitRecord_forAccountID_forceMerge_context___block_invoke;
  v17[3] = &unk_1E64A8070;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  id v21 = self;
  BOOL v22 = a5;
  id v14 = v10;
  id v15 = v11;
  id v16 = v12;
  [v16 performBlockAndWait:v17];
}

void __72__ICCloudContext__ingestCloudKitRecord_forAccountID_forceMerge_context___block_invoke(uint64_t a1)
{
  if (+[ICAccount isCloudKitAccountAvailableInContext:*(void *)(a1 + 32)])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v3 = *(void *)(a1 + 48);
      id v2 = *(void **)(a1 + 56);
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      [v2 didFetchShare:v3 accountID:v4 context:v5];
    }
    else
    {
      uint64_t v7 = [*(id *)(a1 + 48) recordType];
      BOOL v8 = +[ICUserSpecificRecordIDParser isUserSpecificRecordType:v7];

      long long v9 = *(void **)(a1 + 56);
      if (v8)
      {
        id v10 = [*(id *)(a1 + 48) recordID];
        id v12 = [v9 existingCloudObjectForUserSpecificRecordID:v10 createPlaceholderIfNecessary:1 accountID:*(void *)(a1 + 40) context:*(void *)(a1 + 32)];

        [v12 didFetchUserSpecificRecord:*(void *)(a1 + 48) accountID:*(void *)(a1 + 40) force:*(unsigned __int8 *)(a1 + 64)];
      }
      else
      {
        id v11 = [*(id *)(a1 + 56) existingCloudObjectForRecord:*(void *)(a1 + 48) accountID:*(void *)(a1 + 40) context:*(void *)(a1 + 32)];
        if (v11)
        {
          id v12 = v11;
          [v11 objectWasFetchedFromCloudWithRecord:*(void *)(a1 + 48) accountID:*(void *)(a1 + 40) force:*(unsigned __int8 *)(a1 + 64)];
          +[ICShareNotifier showNotificationIfNecessaryForCloudObject:v12 accountID:*(void *)(a1 + 40)];
        }
        else
        {
          id v12 = (id)[*(id *)(a1 + 56) newCloudObjectForRecord:*(void *)(a1 + 48) accountID:*(void *)(a1 + 40) context:*(void *)(a1 + 32)];
          if (!v12) {
            return;
          }
          +[ICShareNotifier showNotificationIfNecessaryForCloudObject:v12 accountID:*(void *)(a1 + 40)];
        }
      }
    }
  }
  else
  {
    uint64_t v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __72__ICCloudContext__ingestCloudKitRecord_forAccountID_forceMerge_context___block_invoke_cold_1(a1);
    }
  }
}

- (void)setAccountStatus:(int64_t)a3
{
  uint64_t v4 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  [v4 setInteger:a3 forKey:@"CloudKitAccountStatus"];

  id v5 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  [v5 synchronize];
}

- (void)updateAccountStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCloudContext *)self processingQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E64A4F70;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) containersByAccountID];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) containersByAccountID];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E64A80E8;
    id v5 = *(void **)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v5;
    [v4 enumerateKeysAndObjectsUsingBlock:v8];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      uint64_t v7 = *(void (**)(void))(v6 + 16);
      v7();
    }
  }
}

void __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke_2_cold_1();
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke_200;
  v10[3] = &unk_1E64A80C0;
  id v8 = *(void **)(a1 + 40);
  void v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  [v6 accountStatusWithCompletionHandler:v10];
}

void __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke_200(id *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [a1[4] processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke_2_201;
  block[3] = &unk_1E64A8098;
  id v11 = v5;
  id v7 = a1[5];
  id v8 = a1[4];
  id v12 = v7;
  id v13 = v8;
  uint64_t v15 = a2;
  id v14 = a1[6];
  id v9 = v5;
  dispatch_async(v6, block);
}

uint64_t __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke_2_201(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke_2_201_cold_2(a1, v2, v3);
    }
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 48) accountStatus];
    uint64_t v5 = *(void *)(a1 + 64);
    id v6 = os_log_create("com.apple.notes", "Cloud");
    id v7 = v6;
    if (v4 == v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke_2_201_cold_1();
      }
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = CKStringFromAccountStatus();
        uint64_t v9 = *(void *)(a1 + 40);
        int v12 = 138412546;
        id v13 = v8;
        __int16 v14 = 2112;
        uint64_t v15 = v9;
        _os_log_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEFAULT, "CloudKit account status changed to %@ for account: %@", (uint8_t *)&v12, 0x16u);
      }
      [*(id *)(a1 + 48) setAccountStatus:*(void *)(a1 + 64)];
      [*(id *)(a1 + 48) setNeedsToUpdateSubscriptions:1];
      id v10 = [*(id *)(a1 + 48) subscribedSubscriptionIDs];
      [v10 removeAllObjects];

      [*(id *)(a1 + 48) clearZoneFetchState];
    }
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(a1 + 64), *(void *)(a1 + 32));
  }
  return result;
}

- (void)fetchUserRecordWithAccountID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if ([v6 length])
  {
    id v8 = [(ICCloudContext *)self containerForAccountID:v6];
    [(ICCloudContext *)self fetchUserRecordWithContainer:v8 completionHandler:v7];
  }
  else
  {
    uint64_t v9 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICCloudContext fetchUserRecordWithAccountID:completionHandler:]();
    }

    if (v7)
    {
      id v10 = ICGenericError();
      v7[2](v7, 0, v10);
    }
  }
}

- (void)fetchUserRecordWithContainer:(id)a3 completionHandler:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1A0A8] fetchCurrentUserRecordOperation];
  objc_msgSend(v8, "setQualityOfService:", -[ICCloudContext qualityOfService](self, "qualityOfService"));
  unint64_t v9 = [(ICCloudContext *)self discretionaryNetworkBehavior];
  id v10 = [v8 configuration];
  [v10 setDiscretionaryNetworkBehavior:v9];

  id v11 = [v6 privateCloudDatabase];
  [v8 setDatabase:v11];

  objc_initWeak(&location, v8);
  int v12 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudContext fetchUserRecordWithContainer:completionHandler:]();
  }

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__47;
  v21[4] = __Block_byref_object_dispose__47;
  id v22 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __65__ICCloudContext_fetchUserRecordWithContainer_completionHandler___block_invoke;
  v20[3] = &unk_1E64A8110;
  v20[4] = v21;
  [v8 setPerRecordCompletionBlock:v20];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__ICCloudContext_fetchUserRecordWithContainer_completionHandler___block_invoke_204;
  v16[3] = &unk_1E64A8138;
  objc_copyWeak(&v19, &location);
  id v13 = v7;
  id v17 = v13;
  id v18 = v21;
  [v8 setFetchRecordsCompletionBlock:v16];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  [v14 setName:@"FetchUserRecord"];
  [v14 setQuantity:1];
  [v14 setExpectedSendSize:1];
  [v14 setExpectedReceiveSize:1];
  [v8 setGroup:v14];
  v24[0] = v8;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  [(ICCloudContext *)self addOperations:v15];

  objc_destroyWeak(&v19);
  _Block_object_dispose(v21, 8);

  objc_destroyWeak(&location);
}

void __65__ICCloudContext_fetchUserRecordWithContainer_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    unint64_t v9 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __65__ICCloudContext_fetchUserRecordWithContainer_completionHandler___block_invoke_cold_2();
    }
  }
  else
  {
    unint64_t v9 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke_cold_1();
    }
  }
}

void __65__ICCloudContext_fetchUserRecordWithContainer_completionHandler___block_invoke_204(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __65__ICCloudContext_fetchUserRecordWithContainer_completionHandler___block_invoke_204_cold_2(a1);
  }

  if (v4)
  {
    id v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __91__ICMigrationUtilities_fetchMigrationStateAndUserRecordForAccountID_withCompletionHandler___block_invoke_5_cold_1();
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
  }
}

+ (id)userRecordNameForContainer:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"![NSThread isMainThread]" functionName:"+[ICCloudContext userRecordNameForContainer:]" simulateCrash:1 showAlert:0 format:@"Unexpected call from main thread"];
  }
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__47;
  uint64_t v16 = __Block_byref_object_dispose__47;
  id v17 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __45__ICCloudContext_userRecordNameForContainer___block_invoke;
  v9[3] = &unk_1E64A8160;
  id v11 = &v12;
  uint64_t v5 = v4;
  id v10 = v5;
  [v3 fetchUserRecordIDWithCompletionHandler:v9];
  dispatch_time_t v6 = dispatch_time(0, 120000000000);
  dispatch_semaphore_wait(v5, v6);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __45__ICCloudContext_userRecordNameForContainer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 recordName];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (!v5 || v6)
  {
    id v10 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __45__ICCloudContext_userRecordNameForContainer___block_invoke_cold_1();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)existingCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 recordID];
  uint64_t v12 = [v10 recordType];

  id v13 = [(ICCloudContext *)self existingCloudObjectForRecordID:v11 recordType:v12 accountID:v9 context:v8];

  return v13;
}

- (id)existingCloudObjectForRecordID:(id)a3 recordType:(id)a4 accountID:(id)a5 context:(id)a6
{
  return [(ICCloudContext *)self existingCloudObjectForRecordID:a3 recordType:a4 accountID:a5 context:a6 excludingRecordTypes:0];
}

- (id)existingCloudObjectForRecordID:(id)a3 recordType:(id)a4 accountID:(id)a5 context:(id)a6 excludingRecordTypes:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v31 = a6;
  id v15 = a7;
  if (!v12 || !v14)
  {
    if (v12)
    {
      if (v14)
      {
LABEL_7:
        id v18 = 0;
        goto LABEL_24;
      }
    }
    else
    {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"recordID" functionName:"-[ICCloudContext existingCloudObjectForRecordID:recordType:accountID:context:excludingRecordTypes:]" simulateCrash:1 showAlert:0 format:@"Trying to fetch a cloud object without a record ID"];
      if (v14) {
        goto LABEL_7;
      }
    }
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"accountID" functionName:"-[ICCloudContext existingCloudObjectForRecordID:recordType:accountID:context:excludingRecordTypes:]" simulateCrash:1 showAlert:0 format:@"Trying to fetch a cloud object without an account ID"];
    goto LABEL_7;
  }
  if (v13)
  {
    uint64_t v16 = [(ICCloudContext *)self cloudObjectClassesByRecordType];
    id v17 = (void *)[v16 objectForKeyedSubscript:v13];

    id v18 = [v17 existingCloudObjectForRecordID:v12 accountID:v14 context:v31];
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v19 = [(ICCloudContext *)self cloudObjectClassesByRecordType];
    id v20 = [v19 allKeys];

    uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v30 = 0;
      uint64_t v23 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v33 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          if ((objc_msgSend(v15, "containsObject:", v25, v30) & 1) == 0)
          {
            char v26 = [(ICCloudContext *)self cloudObjectClassesByRecordType];
            long long v27 = (void *)[v26 objectForKeyedSubscript:v25];

            uint64_t v28 = [v27 existingCloudObjectForRecordID:v12 accountID:v14 context:v31];
            if (v28)
            {
              id v18 = (void *)v28;
              goto LABEL_21;
            }
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v22) {
          continue;
        }
        break;
      }
      id v18 = 0;
LABEL_21:
      id v13 = v30;
    }
    else
    {
      id v18 = 0;
    }
  }
LABEL_24:

  return v18;
}

- (id)existingCloudObjectForUserSpecificRecordID:(id)a3 createPlaceholderIfNecessary:(BOOL)a4 accountID:(id)a5 context:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [ICUserSpecificRecordIDParser alloc];
  id v14 = [v10 recordName];
  id v15 = [(ICUserSpecificRecordIDParser *)v13 initWithRecordName:v14];

  if (!v15)
  {
    id v24 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[ICCloudContext existingCloudObjectForUserSpecificRecordID:createPlaceholderIfNecessary:accountID:context:]();
    }
    goto LABEL_12;
  }
  uint64_t v16 = [(ICCloudContext *)self cloudObjectClassesByRecordType];
  id v17 = [(ICUserSpecificRecordIDParser *)v15 sharedRecordType];
  id v18 = (void *)[v16 objectForKeyedSubscript:v17];

  if (([v18 supportsUserSpecificRecords] & 1) == 0)
  {
    id v24 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[ICCloudContext existingCloudObjectForUserSpecificRecordID:createPlaceholderIfNecessary:accountID:context:]();
    }
LABEL_12:
    id v21 = 0;
    uint64_t v23 = v24;
LABEL_13:

    goto LABEL_14;
  }
  id v19 = [(ICUserSpecificRecordIDParser *)v15 sharedRecordID];
  id v20 = [(ICUserSpecificRecordIDParser *)v15 sharedRecordType];
  id v21 = [(ICCloudContext *)self existingCloudObjectForRecordID:v19 recordType:v20 accountID:v11 context:v12];

  if (!v21 && v8)
  {
    uint64_t v22 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[ICCloudContext existingCloudObjectForUserSpecificRecordID:createPlaceholderIfNecessary:accountID:context:]();
    }

    uint64_t v23 = [(ICUserSpecificRecordIDParser *)v15 sharedRecordID];
    id v24 = [(ICUserSpecificRecordIDParser *)v15 sharedRecordType];
    id v21 = [(ICCloudContext *)self newPlaceholderObjectForRecordID:v23 recordType:v24 accountID:v11 context:v12];
    goto LABEL_13;
  }
LABEL_14:

  return v21;
}

- (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(ICCloudContext *)self cloudObjectClassesByRecordType];
  id v12 = [v10 recordType];
  id v13 = (void *)[v11 objectForKeyedSubscript:v12];

  id v14 = (void *)[v13 newCloudObjectForRecord:v10 accountID:v9 context:v8];
  return v14;
}

- (id)newPlaceholderObjectForRecordID:(id)a3 recordType:(id)a4 accountID:(id)a5 context:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(ICCloudContext *)self cloudObjectClassesByRecordType];
  id v15 = (void *)[v14 objectForKeyedSubscript:v12];

  uint64_t v16 = [v13 recordName];

  id v17 = (void *)[v15 newPlaceholderObjectForRecordName:v16 accountID:v11 context:v10];
  return v17;
}

- (void)fetchCloudObjects:(id)a3 accountID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    if ([(ICCloudContext *)self isFetchingEnabled])
    {
      id v11 = objc_msgSend(MEMORY[0x1E4F1C108], "ic_objectIDsFromObjects:", v8);
      id v12 = [(ICCloudContext *)self processingQueue];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __64__ICCloudContext_fetchCloudObjects_accountID_completionHandler___block_invoke;
      v15[3] = &unk_1E64A4F48;
      v15[4] = self;
      id v16 = v11;
      id v17 = v9;
      id v18 = v10;
      id v13 = v11;
      dispatch_async(v12, v15);

      goto LABEL_9;
    }
    id v14 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v14, OS_LOG_TYPE_INFO, "Trying to fetch cloud objects, but fetching is disabled", buf, 2u);
    }
  }
  if (v10) {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
LABEL_9:
}

void __64__ICCloudContext_fetchCloudObjects_accountID_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CA80] set];
  id v3 = [*(id *)(a1 + 32) backgroundContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__ICCloudContext_fetchCloudObjects_accountID_completionHandler___block_invoke_2;
  v8[3] = &unk_1E64A4500;
  id v9 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v2;
  id v4 = v2;
  id v5 = v3;
  [v5 performBlockAndWait:v8];
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v4 allObjects];
  [v6 addFetchOperationsForRecordIDs:v7 accountID:*(void *)(a1 + 48) qualityOfService:17 operationGroupName:0 completionHandler:*(void *)(a1 + 56)];
}

void __64__ICCloudContext_fetchCloudObjects_accountID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = +[ICCloudSyncingObject ic_objectsFromObjectIDs:*(void *)(a1 + 32) context:*(void *)(a1 + 40)];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v8 + 1) + 8 * v6) recordID];
        if (v7) {
          [*(id *)(a1 + 48) addObject:v7];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)fetchRecordIDs:(id)a3 accountID:(id)a4 operationGroupName:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(ICCloudContext *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__ICCloudContext_fetchRecordIDs_accountID_operationGroupName_completionHandler___block_invoke;
  block[3] = &unk_1E64A8188;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

uint64_t __80__ICCloudContext_fetchRecordIDs_accountID_operationGroupName_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addFetchOperationsForRecordIDs:*(void *)(a1 + 40) accountID:*(void *)(a1 + 48) qualityOfService:17 operationGroupName:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

- (void)addFetchOperationsForRecordIDs:(id)a3 accountID:(id)a4 qualityOfService:(int64_t)a5 operationGroupName:(id)a6 completionHandler:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudContext addFetchOperationsForRecordIDs:accountID:qualityOfService:operationGroupName:completionHandler:](v12);
  }

  id v17 = [(ICCloudContext *)self operationsToFetchRecordIDs:v12 qualityOfService:a5 operationGroupName:v14 accountID:v13];
  [(ICCloudContext *)self addOperations:v17];
  if (v15)
  {
    id v27 = v12;
    id v18 = (void *)MEMORY[0x1E4F28B48];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __113__ICCloudContext_addFetchOperationsForRecordIDs_accountID_qualityOfService_operationGroupName_completionHandler___block_invoke;
    v32[3] = &unk_1E64A4578;
    v32[4] = self;
    id v19 = v17;
    id v33 = v19;
    id v34 = v15;
    id v20 = [v18 blockOperationWithBlock:v32];
    [v20 setName:@"FetchCompletion"];
    objc_msgSend(v20, "ic_setResistsCancellation:", 1);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v21 = v19;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v29;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(v21);
          }
          [v20 addDependency:*(void *)(*((void *)&v28 + 1) + 8 * v25++)];
        }
        while (v23 != v25);
        uint64_t v23 = [v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v23);
    }

    long long v35 = v20;
    char v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
    [(ICCloudContext *)self addOperations:v26];

    id v12 = v27;
  }
}

void __113__ICCloudContext_addFetchOperationsForRecordIDs_accountID_qualityOfService_operationGroupName_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __113__ICCloudContext_addFetchOperationsForRecordIDs_accountID_qualityOfService_operationGroupName_completionHandler___block_invoke_2;
  block[3] = &unk_1E64A4578;
  uint64_t v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

void __113__ICCloudContext_addFetchOperationsForRecordIDs_accountID_qualityOfService_operationGroupName_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() errorFromOperations:*(void *)(a1 + 40)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __113__ICCloudContext_addFetchOperationsForRecordIDs_accountID_qualityOfService_operationGroupName_completionHandler___block_invoke_3;
  v5[3] = &unk_1E64A56C8;
  id v3 = *(id *)(a1 + 48);
  id v6 = v2;
  id v7 = v3;
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __113__ICCloudContext_addFetchOperationsForRecordIDs_accountID_qualityOfService_operationGroupName_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)operationsToFetchRecordIDs:(id)a3 qualityOfService:(int64_t)a4 operationGroupName:(id)a5 accountID:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = (__CFString *)a5;
  id v12 = a6;
  if ([v12 length])
  {
    id v13 = [MEMORY[0x1E4F1CA48] array];
    id v14 = [(id)objc_opt_class() objectsByDatabaseScope:v10];
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    v36[3] = 0;
    id v15 = [(ICCloudContext *)self containerForAccountID:v12];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __91__ICCloudContext_operationsToFetchRecordIDs_qualityOfService_operationGroupName_accountID___block_invoke;
    v30[3] = &unk_1E64A81B0;
    id v16 = v15;
    id v31 = v16;
    long long v32 = self;
    int64_t v35 = a4;
    id v17 = v13;
    id v33 = v17;
    id v34 = v36;
    [v14 enumerateKeysAndObjectsUsingBlock:v30];
    if (!v11) {
      id v11 = @"FetchIndividualRecords";
    }
    id v18 = objc_alloc_init(MEMORY[0x1E4F1A218]);
    [v18 setName:v11];
    objc_msgSend(v18, "setQuantity:", objc_msgSend(v10, "count"));
    [v18 setExpectedSendSize:1];
    [v18 setExpectedReceiveSize:CKOperationGroupTransferSizeForBytes()];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    os_log_t v19 = (os_log_t)v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v37 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v19);
          }
          objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "setGroup:", v18, (void)v26);
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v37 count:16];
      }
      while (v20);
    }

    uint64_t v23 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v18, "ic_loggingDescription");
      objc_claimAutoreleasedReturnValue();
      -[ICCloudContext operationsToFetchRecordIDs:qualityOfService:operationGroupName:accountID:]();
    }

    id v24 = [v19 copy];
    _Block_object_dispose(v36, 8);
  }
  else
  {
    os_log_t v19 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ICCloudContext operationsToFetchRecordIDs:qualityOfService:operationGroupName:accountID:]();
    }
    id v24 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v24;
}

void __91__ICCloudContext_operationsToFetchRecordIDs_qualityOfService_operationGroupName_accountID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "databaseWithDatabaseScope:", objc_msgSend(a2, "integerValue"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [*(id *)(a1 + 40) operationsToFetchRecordIDs:v5 database:v8 qualityOfService:*(void *)(a1 + 64)];
  [*(id *)(a1 + 48) addObjectsFromArray:v6];
  uint64_t v7 = [v5 count];

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += 10240 * v7;
}

- (id)operationsToFetchRecordIDs:(id)a3 database:(id)a4 qualityOfService:(int64_t)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [MEMORY[0x1E4F1CA48] array];
  id v11 = objc_msgSend(v8, "ic_arrayByGroupingIntoArraysWithMaxCount:", 100);
  if ((unint64_t)[v11 count] >= 2)
  {
    id v12 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v20 = [v8 count];
      [v9 databaseScope];
      uint64_t v21 = CKDatabaseScopeString();
      *(_DWORD *)buf = 67109634;
      int v28 = v20;
      __int16 v29 = 2112;
      long long v30 = v21;
      __int16 v31 = 1024;
      int v32 = [v11 count];
      _os_log_debug_impl(&dword_1C3A61000, v12, OS_LOG_TYPE_DEBUG, "Grouping fetch requests for %d %@ records into %d batches", buf, 0x18u);
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = -[ICCloudContext operationToFetchRecordIDs:database:qualityOfService:](self, "operationToFetchRecordIDs:database:qualityOfService:", *(void *)(*((void *)&v22 + 1) + 8 * i), v9, a5, (void)v22);
        [v10 addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v15);
  }

  return v10;
}

- (id)operationToFetchRecordIDs:(id)a3 database:(id)a4 qualityOfService:(int64_t)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v21 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1A0A8]) initWithRecordIDs:v7];
  [v8 setQualityOfService:a5];
  long long v23 = v8;
  id v9 = [v8 configuration];
  [v9 setDiscretionaryNetworkBehavior:0];

  [v8 setDatabase:v21];
  objc_initWeak(&location, v8);
  id v10 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "ic_loggingDescription");
    objc_claimAutoreleasedReturnValue();
    -[ICCloudContext operationToFetchRecordIDs:database:qualityOfService:]();
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v31;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void **)(*((void *)&v30 + 1) + 8 * v14);
        uint64_t v16 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          id v17 = objc_msgSend(v15, "ic_loggingDescription");
          id v18 = objc_msgSend(v23, "ic_loggingDescription");
          *(_DWORD *)buf = 138412546;
          uint64_t v36 = v17;
          __int16 v37 = 2112;
          uint64_t v38 = v18;
          _os_log_debug_impl(&dword_1C3A61000, v16, OS_LOG_TYPE_DEBUG, "Will fetch %@ %@", buf, 0x16u);
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v12);
  }

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __70__ICCloudContext_operationToFetchRecordIDs_database_qualityOfService___block_invoke;
  v28[3] = &unk_1E64A81D8;
  v28[4] = self;
  objc_copyWeak(&v29, &location);
  [v23 setPerRecordProgressBlock:v28];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __70__ICCloudContext_operationToFetchRecordIDs_database_qualityOfService___block_invoke_2;
  v26[3] = &unk_1E64A8200;
  v26[4] = self;
  objc_copyWeak(&v27, &location);
  [v23 setPerRecordCompletionBlock:v26];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  void v24[2] = __70__ICCloudContext_operationToFetchRecordIDs_database_qualityOfService___block_invoke_3;
  v24[3] = &unk_1E64A8228;
  void v24[4] = self;
  objc_copyWeak(&v25, &location);
  [v23 setFetchRecordsCompletionBlock:v24];
  id v19 = v23;
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);

  objc_destroyWeak(&location);
  return v19;
}

void __70__ICCloudContext_operationToFetchRecordIDs_database_qualityOfService___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = (id *)(a1 + 40);
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [v4 fetchOperation:WeakRetained progressChangedWithRecordID:v6 progress:a3];
}

void __70__ICCloudContext_operationToFetchRecordIDs_database_qualityOfService___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = (id *)(a1 + 40);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  [v6 fetchOperation:WeakRetained recordWasFetchedWithRecordID:v9 record:v10 error:v8];
}

void __70__ICCloudContext_operationToFetchRecordIDs_database_qualityOfService___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = (id *)(a1 + 40);
  id v7 = a3;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [v5 fetchOperation:WeakRetained didCompleteWithRecordsByRecordID:v8 error:v7];

  id v10 = *(void **)(a1 + 32);
  id v11 = objc_loadWeakRetained(v6);
  [v10 informCloudAnalyticsDelegateForOperationDidEnd:v11 recordsByRecordID:v8 operationError:v7];
}

- (void)fetchOperation:(id)a3 progressChangedWithRecordID:(id)a4 progress:(double)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (((int)(a5 * 100.0) - 1) <= 0x62)
  {
    id v9 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = objc_msgSend(v8, "ic_loggingDescription");
      id v11 = objc_msgSend(v7, "ic_loggingDescription");
      int v12 = 138412802;
      uint64_t v13 = v10;
      __int16 v14 = 1024;
      int v15 = (int)(a5 * 100.0);
      __int16 v16 = 2112;
      id v17 = v11;
      _os_log_debug_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_DEBUG, "Progress fetching %@: %d%% %@", (uint8_t *)&v12, 0x1Cu);
    }
  }
}

- (void)fetchOperation:(id)a3 recordWasFetchedWithRecordID:(id)a4 record:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = [(ICCloudContext *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__ICCloudContext_fetchOperation_recordWasFetchedWithRecordID_record_error___block_invoke;
  block[3] = &unk_1E64A8278;
  void block[4] = self;
  id v20 = v10;
  id v21 = v13;
  id v22 = v11;
  id v23 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  id v18 = v10;
  dispatch_async(v14, block);
}

void __75__ICCloudContext_fetchOperation_recordWasFetchedWithRecordID_record_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) backgroundContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__ICCloudContext_fetchOperation_recordWasFetchedWithRecordID_record_error___block_invoke_2;
  v5[3] = &unk_1E64A8250;
  id v3 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  id v10 = v2;
  id v4 = v2;
  [v4 performBlockAndWait:v5];
}

void __75__ICCloudContext_fetchOperation_recordWasFetchedWithRecordID_record_error___block_invoke_2(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) database];
  id v4 = [v2 accountIDForDatabase:v3];

  if (*(void *)(a1 + 48))
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 56);
    id v7 = [*(id *)(a1 + 64) recordType];
    id v8 = [v5 existingCloudObjectForRecordID:v6 recordType:v7 accountID:v4 context:*(void *)(a1 + 72)];

    if (!v8)
    {
      id v9 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        long long v26 = objc_msgSend(*(id *)(a1 + 56), "ic_loggingDescription");
        id v27 = objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
        uint64_t v28 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138413058;
        long long v33 = v4;
        __int16 v34 = 2112;
        int64_t v35 = v26;
        __int16 v36 = 2112;
        __int16 v37 = v27;
        __int16 v38 = 2112;
        uint64_t v39 = v28;
        _os_log_error_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_ERROR, "Failed to find existing cloud object for fetch error in account ID %@: %@ %@: %@", buf, 0x2Au);
      }
    }
    if ([*(id *)(a1 + 48) code] == 26 || objc_msgSend(*(id *)(a1 + 48), "code") == 11)
    {
      id v10 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        id v22 = objc_msgSend(*(id *)(a1 + 56), "ic_loggingDescription");
        id v23 = objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
        *(_DWORD *)buf = 138412802;
        long long v33 = v4;
        __int16 v34 = 2112;
        int64_t v35 = v22;
        __int16 v36 = 2112;
        __int16 v37 = v23;
        _os_log_debug_impl(&dword_1C3A61000, v10, OS_LOG_TYPE_DEBUG, "Tried to fetch record that doesn't exist in account ID %@: %@ %@", buf, 0x20u);
      }
      [v8 objectWasFetchedButDoesNotExistInCloud];
      if ([*(id *)(a1 + 48) code] != 26) {
        goto LABEL_22;
      }
      id v11 = *(void **)(a1 + 32);
      id v12 = [*(id *)(a1 + 56) zoneID];
      [v11 receivedZoneNotFound:v12 operation:*(void *)(a1 + 40) context:*(void *)(a1 + 72)];
    }
    else
    {
      id v12 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v29 = objc_msgSend(*(id *)(a1 + 56), "ic_loggingDescription");
        long long v30 = objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
        uint64_t v31 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138413058;
        long long v33 = v4;
        __int16 v34 = 2112;
        int64_t v35 = v29;
        __int16 v36 = 2112;
        __int16 v37 = v30;
        __int16 v38 = 2112;
        uint64_t v39 = v31;
        _os_log_error_impl(&dword_1C3A61000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch in account ID %@: %@ %@: %@", buf, 0x2Au);
      }
    }

LABEL_22:
    if (!v8)
    {
LABEL_26:

      goto LABEL_27;
    }
    id v18 = [*(id *)(a1 + 32) objectIDsToRetry];
    id v19 = [v8 objectID];
    [v18 addObject:v19];
    goto LABEL_24;
  }
  id v13 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    long long v24 = objc_msgSend(*(id *)(a1 + 64), "ic_loggingDescription");
    id v25 = objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
    *(_DWORD *)buf = 138412802;
    long long v33 = v4;
    __int16 v34 = 2112;
    int64_t v35 = v24;
    __int16 v36 = 2112;
    __int16 v37 = v25;
    _os_log_debug_impl(&dword_1C3A61000, v13, OS_LOG_TYPE_DEBUG, "Fetched in account ID %@: %@ %@", buf, 0x20u);
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v15 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v16 = *(void *)(a1 + 56);
    id v17 = [*(id *)(a1 + 64) recordType];
    id v8 = [v15 existingCloudObjectForRecordID:v16 recordType:v17 accountID:v4 context:*(void *)(a1 + 72)];

    if (!v8)
    {
      id v18 = (void *)[*(id *)(a1 + 32) newCloudObjectForRecord:*(void *)(a1 + 64) accountID:v4 context:*(void *)(a1 + 72)];
      goto LABEL_25;
    }
    [v8 objectWasFetchedFromCloudWithRecord:*(void *)(a1 + 64) accountID:v4];
    id v18 = [*(id *)(a1 + 32) objectIDsToRetry];
    id v19 = [v8 objectID];
    [v18 removeObject:v19];
LABEL_24:

LABEL_25:
    goto LABEL_26;
  }
  [*(id *)(a1 + 32) didFetchShare:*(void *)(a1 + 64) accountID:v4 context:*(void *)(a1 + 72)];
LABEL_27:
  id v20 = *(void **)(a1 + 72);
  id v21 = [*(id *)(a1 + 40) operationID];
  objc_msgSend(v20, "ic_saveWithLogDescription:", @"fetch records operation %@", v21);
}

- (void)fetchOperation:(id)a3 didCompleteWithRecordsByRecordID:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(ICCloudContext *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__ICCloudContext_fetchOperation_didCompleteWithRecordsByRecordID_error___block_invoke;
  block[3] = &unk_1E64A4500;
  id v13 = v8;
  id v14 = v7;
  id v15 = self;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, block);
}

void __72__ICCloudContext_fetchOperation_didCompleteWithRecordsByRecordID_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = os_log_create("com.apple.notes", "Cloud");
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __72__ICCloudContext_fetchOperation_didCompleteWithRecordsByRecordID_error___block_invoke_cold_2();
    }

    [*(id *)(a1 + 48) startRetryTimerIfNecessaryWithError:*(void *)(a1 + 32)];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __72__ICCloudContext_fetchOperation_didCompleteWithRecordsByRecordID_error___block_invoke_cold_1(a1);
    }
  }
}

- (void)didFetchShare:(id)a3 accountID:(id)a4 context:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 rootRecordID];
  if (!v11)
  {
    id v12 = [v8 objectForKeyedSubscript:@"RootRecord"];
    id v11 = [v12 recordID];
  }
  id v13 = [v8 objectForKeyedSubscript:@"RootRecordType"];
  if (v13)
  {
    if (v11)
    {
LABEL_5:
      os_log_t v14 = [(ICCloudContext *)self existingCloudObjectForRecordID:v11 recordType:v13 accountID:v9 context:v10];
      id v15 = os_log_create("com.apple.notes", "Cloud");
      uint64_t v16 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[ICCloudContext didFetchShare:accountID:context:](v8, v14, v16);
        }

        [v14 setServerShareIfNewer:v8];
      }
      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = [v8 recordID];
          id v21 = objc_msgSend(v20, "ic_loggingDescription");
          int v23 = 138412290;
          long long v24 = v21;
          _os_log_impl(&dword_1C3A61000, v16, OS_LOG_TYPE_DEFAULT, "Received share for unknown object: %@", (uint8_t *)&v23, 0xCu);
        }
      }
      goto LABEL_18;
    }
  }
  else
  {
    id v17 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[ICCloudContext didFetchShare:accountID:context:]();
    }

    if (v11) {
      goto LABEL_5;
    }
  }
  os_log_t v14 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [v8 recordID];
    id v19 = objc_msgSend(v18, "ic_loggingDescription");
    int v23 = 138412290;
    long long v24 = v19;
    _os_log_impl(&dword_1C3A61000, v14, OS_LOG_TYPE_DEFAULT, "Received a share with no root record ID: %@", (uint8_t *)&v23, 0xCu);
  }
LABEL_18:

  id v22 = [(ICCloudContext *)self cloudContextDelegate];
  [v22 cloudContext:self didFetchShare:v8 accountID:v9];
}

- (void)pushCloudObjects:(id)a3 operationGroupName:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[ICCloudContext objectsByAccount:v8];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__47;
  v22[4] = __Block_byref_object_dispose__47;
  id v23 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__ICCloudContext_pushCloudObjects_operationGroupName_completionHandler___block_invoke;
  v15[3] = &unk_1E64A82C8;
  v15[4] = self;
  id v12 = v9;
  id v16 = v12;
  id v19 = v22;
  id v13 = v11;
  id v17 = v13;
  id v20 = v21;
  id v14 = v10;
  id v18 = v14;
  [v13 enumerateKeysAndObjectsUsingBlock:v15];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v22, 8);
}

void __72__ICCloudContext_pushCloudObjects_operationGroupName_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  id v21 = 0;
  id v22 = 0;
  [v6 _filterCloudSyncingObjects:a3 accountID:v5 objectsToSave:&v22 objectsToDelete:&v21 objectsToDeleteShares:0 objectsToSaveUserSpecificRecord:0];
  id v7 = v22;
  id v8 = v21;
  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__ICCloudContext_pushCloudObjects_operationGroupName_completionHandler___block_invoke_2;
  v15[3] = &unk_1E64A82A0;
  uint64_t v11 = *(void *)(a1 + 64);
  id v16 = v5;
  uint64_t v19 = v11;
  id v12 = *(id *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 72);
  id v17 = v12;
  uint64_t v20 = v13;
  id v18 = *(id *)(a1 + 56);
  id v14 = v5;
  [v9 addModifyRecordsOperationsWithCloudObjectsToSave:v7 delete:v8 accountID:v14 operationGroupName:v10 waitForDependencies:0 completionHandler:v15];
}

void __72__ICCloudContext_pushCloudObjects_operationGroupName_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __72__ICCloudContext_pushCloudObjects_operationGroupName_completionHandler___block_invoke_2_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
  id v6 = *(id *)(a1 + 40);
  objc_sync_enter(v6);
  ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  objc_sync_exit(v6);

  unint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (v7 >= [*(id *)(a1 + 40) count])
  {
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    }
  }
}

- (void)deleteSharesForObjects:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[ICCloudContext objectsByAccount:v6];
  if ([v8 count])
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__47;
    void v15[4] = __Block_byref_object_dispose__47;
    id v16 = 0;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    void v14[3] = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __59__ICCloudContext_deleteSharesForObjects_completionHandler___block_invoke;
    v9[3] = &unk_1E64A82F0;
    void v9[4] = self;
    id v12 = v15;
    id v10 = v8;
    uint64_t v13 = v14;
    id v11 = v7;
    [v10 enumerateKeysAndObjectsUsingBlock:v9];

    _Block_object_dispose(v14, 8);
    _Block_object_dispose(v15, 8);
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __59__ICCloudContext_deleteSharesForObjects_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__ICCloudContext_deleteSharesForObjects_completionHandler___block_invoke_2;
  v11[3] = &unk_1E64A82A0;
  uint64_t v6 = *(void *)(a1 + 56);
  id v12 = v5;
  uint64_t v15 = v6;
  id v7 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 64);
  id v13 = v8;
  uint64_t v16 = v9;
  id v14 = *(id *)(a1 + 48);
  id v10 = v5;
  [v7 deleteSharesForObjects:a3 accountID:v10 completionHandler:v11];
}

void __59__ICCloudContext_deleteSharesForObjects_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __59__ICCloudContext_deleteSharesForObjects_completionHandler___block_invoke_2_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
  id v6 = *(id *)(a1 + 40);
  objc_sync_enter(v6);
  ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  objc_sync_exit(v6);

  unint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (v7 >= [*(id *)(a1 + 40) count])
  {
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    }
  }
}

- (void)deleteSharesForObjects:(id)a3 accountID:(id)a4 completionHandler:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v31 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v48 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        if ([v16 isSharedRootObject])
        {
          [v10 addObject:v16];
          id v17 = [v16 objectID];
          [v11 addObject:v17];
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v13);
  }

  if ([v10 count] && objc_msgSend(MEMORY[0x1E4F837F8], "isInternetReachable"))
  {
    id v18 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[ICCloudContext deleteSharesForObjects:accountID:completionHandler:]();
    }

    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke;
    v45[3] = &unk_1E64A8318;
    id v19 = v31;
    id v46 = v19;
    [v10 enumerateObjectsUsingBlock:v45];
    uint64_t v20 = [(ICCloudContext *)self operationsToModifyRecordsForCloudObjectsToSave:0 delete:0 deleteShares:v10 saveUserSpecificRecords:0 operationGroupName:@"DeleteShares" addDependencies:0 accountID:v19];
    [(ICCloudContext *)self addOperations:v20];
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_240;
    aBlock[3] = &unk_1E64A8388;
    objc_copyWeak(&v43, &location);
    id v42 = v9;
    id v40 = v11;
    id v41 = v19;
    id v21 = _Block_copy(aBlock);
    id v22 = (void *)MEMORY[0x1E4F28B48];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_6;
    v36[3] = &unk_1E64A4578;
    void v36[4] = self;
    id v23 = v20;
    id v37 = v23;
    id v30 = v21;
    id v38 = v30;
    long long v24 = [v22 blockOperationWithBlock:v36];
    [v24 setName:@"deleteSharesForObjectsFetchAndCompletion"];
    objc_msgSend(v24, "ic_setResistsCancellation:", 1);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v25 = v23;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v32 objects:v52 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v33 != v27) {
            objc_enumerationMutation(v25);
          }
          [v24 addDependency:*(void *)(*((void *)&v32 + 1) + 8 * j)];
        }
        uint64_t v26 = [v25 countByEnumeratingWithState:&v32 objects:v52 count:16];
      }
      while (v26);
    }

    v51 = v24;
    id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
    [(ICCloudContext *)self addOperations:v29];

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }
  else if (v9)
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

void __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_cold_1(a1, v3);
  }
}

void __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_240(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 56));
  id v4 = objc_loadWeakRetained(&to);

  if (v4)
  {
    id v5 = objc_loadWeakRetained(&to);
    id v6 = [v5 backgroundContext];

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_2;
    v19[3] = &unk_1E64A4500;
    id v20 = *(id *)(a1 + 32);
    id v8 = v6;
    id v21 = v8;
    id v9 = v7;
    id v22 = v9;
    [v8 performBlockAndWait:v19];
    id v10 = objc_loadWeakRetained(&to);
    id v11 = [v9 allObjects];
    uint64_t v12 = *(void *)(a1 + 40);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_3;
    void v14[3] = &unk_1E64A8360;
    objc_copyWeak(&v18, &to);
    id v15 = *(id *)(a1 + 32);
    id v16 = v3;
    id v17 = *(id *)(a1 + 48);
    [v10 fetchRecordZoneChangesForZoneIDs:v11 accountID:v12 reason:@"SyncAfterDeleteShare" completionHandler:v14];

    objc_destroyWeak(&v18);
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 48);
    if (v13) {
      (*(void (**)(uint64_t, void))(v13 + 16))(v13, 0);
    }
  }
  objc_destroyWeak(&to);
}

void __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[ICCloudSyncingObject ic_objectsFromObjectIDs:*(void *)(a1 + 32) context:*(void *)(a1 + 40)];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 48);
        id v8 = [*(id *)(*((void *)&v10 + 1) + 8 * v6) recordID];
        id v9 = [v8 zoneID];
        [v7 addObject:v9];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  objc_msgSend(*(id *)(a1 + 40), "ic_save");
}

void __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = [WeakRetained backgroundContext];

  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_4;
  v12[3] = &unk_1E64A5958;
  id v13 = *(id *)(a1 + 32);
  id v6 = v5;
  id v14 = v6;
  uint64_t v15 = &v16;
  [v6 performBlockAndWait:v12];
  if (*((unsigned char *)v17 + 24)
    && ([MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F83668] code:213 userInfo:0],
        (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v8 = v7;
    id v9 = v8;
  }
  else
  {
    if (v3) {
      id v10 = v3;
    }
    else {
      id v10 = *(id *)(a1 + 40);
    }
    id v9 = v10;
    id v8 = 0;
  }
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v9);
  }

  _Block_object_dispose(&v16, 8);
}

void __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_4(void *a1)
{
  id v2 = +[ICCloudSyncingObject ic_objectsFromObjectIDs:a1[4] context:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = objc_msgSend(v2, "ic_containsObjectPassingTest:", &__block_literal_global_246);
}

BOOL __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 serverShare];
  BOOL v3 = v2 != 0;

  return v3;
}

void __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_6(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_7;
  block[3] = &unk_1E64A4578;
  BOOL v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

void __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_7(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() errorFromOperations:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)addModifyRecordsOperationsWithCloudObjectsToSave:(id)a3 delete:(id)a4 accountID:(id)a5 operationGroupName:(id)a6 waitForDependencies:(BOOL)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if ([v14 count] || objc_msgSend(v15, "count"))
  {
    char v19 = objc_msgSend(MEMORY[0x1E4F1C108], "ic_objectIDsFromObjects:", v14);
    id v20 = objc_msgSend(MEMORY[0x1E4F1C108], "ic_objectIDsFromObjects:", v15);
    id v21 = [(ICCloudContext *)self processingQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __141__ICCloudContext_addModifyRecordsOperationsWithCloudObjectsToSave_delete_accountID_operationGroupName_waitForDependencies_completionHandler___block_invoke;
    block[3] = &unk_1E64A83D8;
    void block[4] = self;
    id v25 = v19;
    id v26 = v20;
    id v27 = v16;
    id v28 = v17;
    BOOL v30 = a7;
    id v29 = v18;
    id v22 = v20;
    id v23 = v19;
    dispatch_async(v21, block);
  }
  else if (v18)
  {
    (*((void (**)(id, void))v18 + 2))(v18, 0);
  }
}

void __141__ICCloudContext_addModifyRecordsOperationsWithCloudObjectsToSave_delete_accountID_operationGroupName_waitForDependencies_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) backgroundContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __141__ICCloudContext_addModifyRecordsOperationsWithCloudObjectsToSave_delete_accountID_operationGroupName_waitForDependencies_completionHandler___block_invoke_2;
  void v6[3] = &unk_1E64A83B0;
  id v7 = *(id *)(a1 + 40);
  id v8 = v2;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v4;
  id v11 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 64);
  char v14 = *(unsigned char *)(a1 + 80);
  id v13 = *(id *)(a1 + 72);
  id v5 = v2;
  [v5 performBlockAndWait:v6];
}

void __141__ICCloudContext_addModifyRecordsOperationsWithCloudObjectsToSave_delete_accountID_operationGroupName_waitForDependencies_completionHandler___block_invoke_2(uint64_t a1)
{
  id v3 = +[ICCloudSyncingObject ic_objectsFromObjectIDs:*(void *)(a1 + 32) context:*(void *)(a1 + 40)];
  id v2 = +[ICCloudSyncingObject ic_objectsFromObjectIDs:*(void *)(a1 + 48) context:*(void *)(a1 + 40)];
  [*(id *)(a1 + 56) _addModifyRecordsOperationsWithCloudObjectsToSave:v3 delete:v2 accountID:*(void *)(a1 + 64) operationGroupName:*(void *)(a1 + 72) waitForDependencies:*(unsigned __int8 *)(a1 + 88) completionHandler:*(void *)(a1 + 80)];
}

- (void)_addModifyRecordsOperationsWithCloudObjectsToSave:(id)a3 delete:(id)a4 accountID:(id)a5 operationGroupName:(id)a6 waitForDependencies:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v8 = a7;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v14 = a8;
  id v15 = [(ICCloudContext *)self operationsToModifyRecordsForCloudObjectsToSave:a3 delete:a4 deleteShares:0 saveUserSpecificRecords:0 operationGroupName:a6 addDependencies:v8 accountID:a5];
  [(ICCloudContext *)self addOperations:v15];
  if (v14)
  {
    id v16 = (void *)MEMORY[0x1E4F28B48];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __142__ICCloudContext__addModifyRecordsOperationsWithCloudObjectsToSave_delete_accountID_operationGroupName_waitForDependencies_completionHandler___block_invoke;
    v29[3] = &unk_1E64A4578;
    v29[4] = self;
    id v17 = v15;
    id v30 = v17;
    id v31 = v14;
    id v18 = [v16 blockOperationWithBlock:v29];
    [v18 setName:@"ModifyCompletion"];
    objc_msgSend(v18, "ic_setResistsCancellation:", 1);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v26;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v26 != v22) {
            objc_enumerationMutation(v19);
          }
          [v18 addDependency:*(void *)(*((void *)&v25 + 1) + 8 * v23++)];
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v21);
    }

    long long v32 = v18;
    long long v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    [(ICCloudContext *)self addOperations:v24];
  }
}

void __142__ICCloudContext__addModifyRecordsOperationsWithCloudObjectsToSave_delete_accountID_operationGroupName_waitForDependencies_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __142__ICCloudContext__addModifyRecordsOperationsWithCloudObjectsToSave_delete_accountID_operationGroupName_waitForDependencies_completionHandler___block_invoke_2;
  block[3] = &unk_1E64A4578;
  id v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

void __142__ICCloudContext__addModifyRecordsOperationsWithCloudObjectsToSave_delete_accountID_operationGroupName_waitForDependencies_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() errorFromOperations:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)operationsToModifyRecordsForCloudObjectsToSave:(id)a3 delete:(id)a4 deleteShares:(id)a5 saveUserSpecificRecords:(id)a6 operationGroupName:(id)a7 addDependencies:(BOOL)a8 accountID:(id)a9
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v78 = a4;
  id v77 = a5;
  id v74 = a6;
  v76 = (__CFString *)a7;
  id v79 = a9;
  v75 = v13;
  if (v79)
  {
    if ([v13 count])
    {
      id v14 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[ICCloudContext operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:].cold.6();
      }
    }
    if ([v78 count])
    {
      id v15 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[ICCloudContext operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:].cold.5();
      }
    }
    if ([v77 count])
    {
      id v16 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[ICCloudContext operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:].cold.4();
      }
    }
    v81 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    id v17 = v13;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v114 objects:v127 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v115;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v115 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void **)(*((void *)&v114 + 1) + 8 * i);
          uint64_t v22 = [v21 recordID];
          if (v22) {
            [v81 setObject:v21 forKeyedSubscript:v22];
          }
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v114 objects:v127 count:16];
      }
      while (v18);
    }

    uint64_t v23 = v76;
    if (!v76) {
      uint64_t v23 = @"ModifyRecords";
    }
    v76 = v23;
    id v83 = objc_alloc_init(MEMORY[0x1E4F1A218]);
    [v83 setName:v76];
    objc_msgSend(v83, "setQuantity:", objc_msgSend(v78, "count") + objc_msgSend(v17, "count") + objc_msgSend(v77, "count"));
    [v83 setExpectedReceiveSize:1];
    v82 = [MEMORY[0x1E4F1CA48] array];
    long long v24 = [(id)objc_opt_class() deduplicatedRecordsForCloudObjects:v17];
    v80 = (void *)[v24 mutableCopy];

    long long v25 = [(id)objc_opt_class() deduplicatedRecordsForCloudObjects:v78];
    v86 = (void *)[v25 mutableCopy];

    v85 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id v26 = v77;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v110 objects:v126 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v111;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v111 != v28) {
            objc_enumerationMutation(v26);
          }
          id v30 = *(void **)(*((void *)&v110 + 1) + 8 * j);
          id v31 = [v30 serverShare];
          if (v31)
          {
            [v86 addObject:v31];
            long long v32 = [v30 recordID];
            if (v32)
            {
              long long v33 = [v30 recordID];
              uint64_t v34 = [v31 recordID];
              [v85 setObject:v33 forKeyedSubscript:v34];
            }
            else
            {
              uint64_t v34 = os_log_create("com.apple.notes", "Cloud");
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                long long v35 = [v30 shortLoggingDescription];
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v35;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v79;
                _os_log_impl(&dword_1C3A61000, v34, OS_LOG_TYPE_DEFAULT, "No root record ID when trying to delete share for %@ for account ID %@", buf, 0x16u);
              }
              long long v33 = v34;
            }
          }
          else
          {
            long long v33 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              __int16 v36 = [v30 serverRecord];
              id v37 = objc_msgSend(v36, "ic_loggingDescription");
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v37;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v79;
              _os_log_error_impl(&dword_1C3A61000, v33, OS_LOG_TYPE_ERROR, "Record to delete share from doesn't have a server share %@ for account ID %@", buf, 0x16u);
            }
            long long v32 = v33;
          }
        }
        uint64_t v27 = [v26 countByEnumeratingWithState:&v110 objects:v126 count:16];
      }
      while (v27);
    }

    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v38 = v74;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v106 objects:v125 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v107;
      do
      {
        for (uint64_t k = 0; k != v39; ++k)
        {
          if (*(void *)v107 != v40) {
            objc_enumerationMutation(v38);
          }
          id v42 = [*(id *)(*((void *)&v106 + 1) + 8 * k) makeUserSpecificCloudKitRecordForApproach:0];
          if (v42) {
            [v80 addObject:v42];
          }
        }
        uint64_t v39 = [v38 countByEnumeratingWithState:&v106 objects:v125 count:16];
      }
      while (v39);
    }

    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    id v43 = v78;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v102 objects:v124 count:16];
    if (v44)
    {
      uint64_t v45 = *(void *)v103;
      do
      {
        for (uint64_t m = 0; m != v44; ++m)
        {
          if (*(void *)v103 != v45) {
            objc_enumerationMutation(v43);
          }
          long long v47 = [*(id *)(*((void *)&v102 + 1) + 8 * m) userSpecificServerRecord];
          objc_msgSend(v86, "ic_addNonNilObject:", v47);
        }
        uint64_t v44 = [v43 countByEnumeratingWithState:&v102 objects:v124 count:16];
      }
      while (v44);
    }

    long long v48 = [(id)objc_opt_class() objectsByDatabaseScope:v80];
    long long v49 = [(id)objc_opt_class() objectsByDatabaseScope:v86];
    long long v50 = [(ICCloudContext *)self containerForAccountID:v79];
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    uint64_t v51 = [&unk_1F1F62D00 countByEnumeratingWithState:&v98 objects:v123 count:16];
    if (v51)
    {
      uint64_t v52 = *(void *)v99;
      do
      {
        for (uint64_t n = 0; n != v51; ++n)
        {
          if (*(void *)v99 != v52) {
            objc_enumerationMutation(&unk_1F1F62D00);
          }
          uint64_t v54 = *(void **)(*((void *)&v98 + 1) + 8 * n);
          v55 = objc_msgSend(v50, "databaseWithDatabaseScope:", objc_msgSend(v54, "integerValue"));
          uint64_t v56 = [v48 objectForKeyedSubscript:v54];
          v57 = [v49 objectForKeyedSubscript:v54];
          v58 = [(ICCloudContext *)self operationsToModifyRecordsToSave:v56 delete:v57 rootRecordIDsByShareID:v85 database:v55];
          [v82 addObjectsFromArray:v58];
        }
        uint64_t v51 = [&unk_1F1F62D00 countByEnumeratingWithState:&v98 objects:v123 count:16];
      }
      while (v51);
    }
    v59 = [(ICCloudContext *)self operationToSaveZonesIfNecessaryForAccountID:v79];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    uint64_t v122 = 0;
    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = __154__ICCloudContext_operationsToModifyRecordsForCloudObjectsToSave_delete_deleteShares_saveUserSpecificRecords_operationGroupName_addDependencies_accountID___block_invoke;
    v91[3] = &unk_1E64A8400;
    os_log_t v60 = v81;
    v96 = buf;
    BOOL v97 = a8;
    os_log_t v92 = v60;
    v93 = self;
    id v61 = v59;
    id v94 = v61;
    id v62 = v82;
    id v95 = v62;
    [v62 enumerateObjectsUsingBlock:v91];
    [v83 setExpectedSendSize:CKOperationGroupTransferSizeForBytes()];
    if (v61) {
      [v62 addObject:v61];
    }
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v63 = v62;
    uint64_t v64 = [v63 countByEnumeratingWithState:&v87 objects:v120 count:16];
    if (v64)
    {
      uint64_t v65 = *(void *)v88;
      do
      {
        for (iuint64_t i = 0; ii != v64; ++ii)
        {
          if (*(void *)v88 != v65) {
            objc_enumerationMutation(v63);
          }
          [*(id *)(*((void *)&v87 + 1) + 8 * ii) setGroup:v83];
        }
        uint64_t v64 = [v63 countByEnumeratingWithState:&v87 objects:v120 count:16];
      }
      while (v64);
    }

    if ((unint64_t)[v63 count] >= 2)
    {
      v67 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG)) {
        -[ICCloudContext operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:]((uint64_t)v79, (uint64_t)v119, [v63 count], v67);
      }
    }
    v68 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
    {
      v69 = objc_msgSend(v83, "ic_loggingDescription");
      -[ICCloudContext operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:](v69, (uint64_t)v79, (uint64_t)v118);
    }

    v70 = v95;
    id v71 = v63;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    os_log_t v60 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      -[ICCloudContext operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:]();
    }
    id v71 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v71;
}

void __154__ICCloudContext_operationsToModifyRecordsForCloudObjectsToSave_delete_deleteShares_saveUserSpecificRecords_operationGroupName_addDependencies_accountID___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_opt_class();
  uint64_t v20 = v4;
  id v5 = ICDynamicCast();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = [v5 recordsToSave];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v12 = *(void **)(a1 + 32);
        id v13 = objc_msgSend(v11, "recordID", v20);
        id v14 = [v12 objectForKeyedSubscript:v13];

        [v14 objectWillBePushedToCloudWithOperation:v5];
        unint64_t v15 = [v11 size];
        if (v15 > 0x100000)
        {
          id v16 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            id v17 = objc_msgSend(v11, "ic_loggingDescription");
            *(_DWORD *)buf = 134218242;
            unint64_t v27 = v15;
            __int16 v28 = 2112;
            id v29 = v17;
            _os_log_error_impl(&dword_1C3A61000, v16, OS_LOG_TYPE_ERROR, "Record size (%lu bytes) exceeds CloudKit limit for record: %@", buf, 0x16u);
          }
          [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"-[ICCloudContext operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:]_block_invoke" simulateCrash:1 showAlert:1 format:@"Oversized CloudKit Record"];
        }
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += v15;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)(a1 + 72)) {
    [*(id *)(a1 + 40) addDependenciesForModifyRecordsOperation:v5];
  }
  if (*(void *)(a1 + 48)) {
    objc_msgSend(v5, "addDependency:");
  }
  if (a3)
  {
    uint64_t v18 = 0;
    do
    {
      uint64_t v19 = objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", v18, v20);
      [v5 addDependency:v19];

      ++v18;
    }
    while (a3 != v18);
  }
}

+ (void)batchRecordsToSave:(id)a3 delete:(id)a4 maxRecordCountPerBatch:(unint64_t)a5 maxRecordSizePerBatch:(unint64_t)a6 withBlock:(id)a7
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a7;
  id v12 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v55 = objc_msgSend(v9, "ic_map:", &__block_literal_global_266_0);
    uint64_t v56 = objc_msgSend(v10, "ic_map:", &__block_literal_global_268_0);
    *(_DWORD *)buf = 138413058;
    *(void *)id v74 = v55;
    *(_WORD *)&v74[8] = 2112;
    *(void *)v75 = v56;
    *(_WORD *)&v75[8] = 2048;
    *(void *)v76 = a5;
    *(_WORD *)&v76[8] = 2048;
    unint64_t v77 = a6;
    _os_log_debug_impl(&dword_1C3A61000, v12, OS_LOG_TYPE_DEBUG, "Batching with recordsToSave:%@ recordsToDelete:%@, maxRecordCountPerBatch:%lu, maxRecordSizePerBatch:%lu", buf, 0x2Au);
  }
  v58 = v9;
  id v13 = (void *)[v9 mutableCopy];
  v57 = v10;
  id v14 = (void *)[v10 mutableCopy];
  uint64_t v15 = 0;
  id v60 = v11;
  while ([v13 count] || objc_msgSend(v14, "count"))
  {
    uint64_t v61 = v15 + 1;
    id v16 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a5];
    uint64_t v64 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a5];
    unint64_t v17 = 0;
    while (1)
    {
      if ([v13 count])
      {
        uint64_t v18 = [v13 firstObject];
        uint64_t v19 = [v18 recordType];
        int v20 = [v19 isEqualToString:@"Media"];

        if ((unint64_t)[v13 count] < 2)
        {
          uint64_t v21 = 0;
        }
        else
        {
          uint64_t v21 = [v13 objectAtIndexedSubscript:1];
        }
        long long v25 = [v21 recordType];
        int v26 = [v25 isEqualToString:@"Attachment"];

        uint64_t v27 = [v18 size];
        if ((v20 & v26) == 1)
        {
          unint64_t v28 = v27 + v17 + [v21 size];
          uint64_t v29 = [v16 count];
          unint64_t v30 = v29 + [v64 count] + 2;
          BOOL v31 = v28 >= a6 || v30 > a5;
          char v32 = !v31;
          BOOL v33 = !v31 || v17 != 0;
          if (v33)
          {
            if ((v32 & 1) == 0)
            {
              uint64_t v34 = os_log_create("com.apple.notes", "Cloud");
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                BOOL v59 = v30 <= a5;
                BOOL v35 = v28 < a6;
                __int16 v36 = [v18 recordID];
                id v37 = [v21 recordID];
                *(_DWORD *)buf = 67109890;
                *(_DWORD *)id v74 = v35;
                *(_WORD *)&v74[4] = 1024;
                *(_DWORD *)&v74[6] = v59;
                *(_WORD *)v75 = 2112;
                *(void *)&v75[2] = v36;
                *(_WORD *)v76 = 2112;
                *(void *)&v76[2] = v37;
                _os_log_debug_impl(&dword_1C3A61000, v34, OS_LOG_TYPE_DEBUG, "Ending batch because Media/Attachment pair does not fit isSizeOK: %d isCountOK: %d Media: %@ Attachment: %@", buf, 0x22u);
              }
              goto LABEL_39;
            }
          }
          else
          {
            id v42 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              long long v48 = [v18 recordID];
              long long v49 = [v21 recordID];
              *(_DWORD *)buf = 138412546;
              *(void *)id v74 = v48;
              *(_WORD *)&v74[8] = 2112;
              *(void *)v75 = v49;
              _os_log_error_impl(&dword_1C3A61000, v42, OS_LOG_TYPE_ERROR, "Ending batch because an impossible batch was detected ICCloudContext. Media: %@ Attachment: %@", buf, 0x16u);
            }
          }
          id v43 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            id v46 = [v18 recordID];
            long long v47 = [v21 recordID];
            *(_DWORD *)buf = 138412546;
            *(void *)id v74 = v46;
            *(_WORD *)&v74[8] = 2112;
            *(void *)v75 = v47;
            _os_log_debug_impl(&dword_1C3A61000, v43, OS_LOG_TYPE_DEBUG, "Adding Media/Attachment pair to batch: %@ %@", buf, 0x16u);
          }
          int v24 = !v33;

          objc_msgSend(v13, "removeObjectsInRange:", 0, 2);
          v72[0] = v18;
          v72[1] = v21;
          uint64_t v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:2];
          [v16 addObjectsFromArray:v44];

          unint64_t v17 = v28;
        }
        else
        {
          unint64_t v38 = v27 + v17;
          if (v17) {
            BOOL v39 = 0;
          }
          else {
            BOOL v39 = v38 >= a6;
          }
          int v24 = v39;
          if (v39 || v38 < a6)
          {
            if (v24)
            {
              uint64_t v40 = os_log_create("com.apple.notes", "Cloud");
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
                +[ICCloudContext batchRecordsToSave:delete:maxRecordCountPerBatch:maxRecordSizePerBatch:withBlock:].cold.4((uint64_t)v71, (uint64_t)v18);
              }
            }
            id v41 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
              +[ICCloudContext batchRecordsToSave:delete:maxRecordCountPerBatch:maxRecordSizePerBatch:withBlock:]((uint64_t)v70, (uint64_t)v18);
            }

            [v13 removeObjectAtIndex:0];
            [v16 addObject:v18];
            unint64_t v17 = v38;
          }
          else
          {
            uint64_t v34 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
              +[ICCloudContext batchRecordsToSave:delete:maxRecordCountPerBatch:maxRecordSizePerBatch:withBlock:].cold.5((uint64_t)v69, (uint64_t)v18);
            }
LABEL_39:

            int v24 = 1;
          }
        }

        goto LABEL_54;
      }
      if ([v14 count])
      {
        long long v22 = [v14 firstObject];
        uint64_t v18 = [v22 recordID];

        long long v23 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)id v74 = v18;
          _os_log_debug_impl(&dword_1C3A61000, v23, OS_LOG_TYPE_DEBUG, "Adding record to delete batch: %@", buf, 0xCu);
        }

        [v14 removeObjectAtIndex:0];
        [v64 addObject:v18];
        int v24 = 0;
      }
      else
      {
        uint64_t v18 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          +[ICCloudContext batchRecordsToSave:delete:maxRecordCountPerBatch:maxRecordSizePerBatch:withBlock:](&v67, v68, v18);
        }
        int v24 = 1;
      }
LABEL_54:

      uint64_t v45 = [v16 count];
      if ([v64 count] + v45 >= a5) {
        break;
      }
      if (v24) {
        goto LABEL_63;
      }
    }
    long long v50 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
      +[ICCloudContext batchRecordsToSave:delete:maxRecordCountPerBatch:maxRecordSizePerBatch:withBlock:](&v65, v66, v50);
    }

LABEL_63:
    uint64_t v51 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v54 = objc_msgSend(v16, "ic_map:", &__block_literal_global_271);
      *(_DWORD *)buf = 138412546;
      *(void *)id v74 = v54;
      *(_WORD *)&v74[8] = 2112;
      *(void *)v75 = v64;
      _os_log_debug_impl(&dword_1C3A61000, v51, OS_LOG_TYPE_DEBUG, "Finished batch with batchRecordsToSave:%@ batchRecordIDsToDelete:%@", buf, 0x16u);
    }
    uint64_t v52 = (void *)[v16 copy];
    v53 = (void *)[v64 copy];
    id v11 = v60;
    uint64_t v15 = v61;
    (*((void (**)(id, uint64_t, void *, void *))v60 + 2))(v60, v61, v52, v53);
  }
}

uint64_t __99__ICCloudContext_batchRecordsToSave_delete_maxRecordCountPerBatch_maxRecordSizePerBatch_withBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ic_loggingDescription");
}

uint64_t __99__ICCloudContext_batchRecordsToSave_delete_maxRecordCountPerBatch_maxRecordSizePerBatch_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ic_loggingDescription");
}

uint64_t __99__ICCloudContext_batchRecordsToSave_delete_maxRecordCountPerBatch_maxRecordSizePerBatch_withBlock___block_invoke_269(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ic_loggingDescription");
}

- (id)operationsToModifyRecordsToSave:(id)a3 delete:(id)a4 rootRecordIDsByShareID:(id)a5 database:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [MEMORY[0x1E4F1CA48] array];
  if (!v10)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F1CBF0];
    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v18 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_6;
  }
  uint64_t v15 = [(id)objc_opt_class() sortedRecords:v10];
  if (!v11) {
    goto LABEL_5;
  }
LABEL_3:
  id v16 = [(id)objc_opt_class() sortedRecords:v11];
  unint64_t v17 = [v16 reverseObjectEnumerator];
  uint64_t v18 = [v17 allObjects];

LABEL_6:
  uint64_t v19 = objc_opt_class();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __89__ICCloudContext_operationsToModifyRecordsToSave_delete_rootRecordIDsByShareID_database___block_invoke;
  v26[3] = &unk_1E64A8448;
  v26[4] = self;
  id v27 = v12;
  id v28 = v13;
  id v20 = v14;
  id v29 = v20;
  id v21 = v13;
  id v22 = v12;
  [v19 batchRecordsToSave:v15 delete:v18 maxRecordCountPerBatch:100 maxRecordSizePerBatch:0x200000 withBlock:v26];
  long long v23 = v29;
  id v24 = v20;

  return v24;
}

void __89__ICCloudContext_operationsToModifyRecordsToSave_delete_rootRecordIDsByShareID_database___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = [*(id *)(a1 + 32) operationToModifyRecordsToSave:a3 delete:a4 rootRecordIDsByShareID:*(void *)(a1 + 40) database:*(void *)(a1 + 48)];
  [*(id *)(a1 + 56) addObject:v5];
}

- (id)operationToModifyRecordsToSave:(id)a3 delete:(id)a4 rootRecordIDsByShareID:(id)a5 database:(id)a6
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v42 = a5;
  id v12 = a6;
  id v13 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudContext operationToModifyRecordsToSave:delete:rootRecordIDsByShareID:database:]();
  }

  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F1A198]) initWithRecordsToSave:v10 recordIDsToDelete:v11];
  objc_msgSend(v14, "setQualityOfService:", -[ICCloudContext qualityOfService](self, "qualityOfService"));
  unint64_t v15 = [(ICCloudContext *)self discretionaryNetworkBehavior];
  id v16 = [v14 configuration];
  [v16 setDiscretionaryNetworkBehavior:v15];

  [v14 setDatabase:v12];
  BOOL v17 = [(ICCloudContext *)self enableLongLivedOperations];
  uint64_t v18 = [v14 configuration];
  [v18 setLongLived:v17];

  if ([(ICCloudContext *)self disableAutomaticallyRetryNetworkFailures])
  {
    uint64_t v19 = [v14 configuration];
    [v19 setAutomaticallyRetryNetworkFailures:0];
  }
  id v41 = v12;
  id v43 = self;
  uint64_t v44 = v11;
  uint64_t v45 = v10;
  id v20 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudContext operationToModifyRecordsToSave:delete:rootRecordIDsByShareID:database:](v14);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v21 = v14;
  id v22 = [v14 recordsToSave];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v51;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v51 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = *(void **)(*((void *)&v50 + 1) + 8 * v26);
        id v28 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          id v29 = objc_msgSend(v27, "ic_loggingDescription");
          unint64_t v30 = objc_msgSend(v21, "ic_loggingDescription");
          *(_DWORD *)buf = 138412546;
          uint64_t v56 = v29;
          __int16 v57 = 2112;
          v58 = v30;
          _os_log_debug_impl(&dword_1C3A61000, v28, OS_LOG_TYPE_DEBUG, "Will push %@ %@", buf, 0x16u);
        }
        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v24);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  BOOL v31 = [v21 recordIDsToDelete];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v47;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v47 != v34) {
          objc_enumerationMutation(v31);
        }
        __int16 v36 = *(void **)(*((void *)&v46 + 1) + 8 * v35);
        id v37 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          unint64_t v38 = objc_msgSend(v36, "ic_loggingDescription");
          BOOL v39 = objc_msgSend(v21, "ic_loggingDescription");
          *(_DWORD *)buf = 138412546;
          uint64_t v56 = v38;
          __int16 v57 = 2112;
          v58 = v39;
          _os_log_debug_impl(&dword_1C3A61000, v37, OS_LOG_TYPE_DEBUG, "Will delete %@ %@", buf, 0x16u);
        }
        ++v35;
      }
      while (v33 != v35);
      uint64_t v33 = [v31 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v33);
  }

  [(ICCloudContext *)v43 addCallbackBlocksToModifyRecordsOperation:v21 rootRecordIDsByShareID:v42];
  return v21;
}

- (void)addCallbackBlocksToModifyRecordsOperation:(id)a3 rootRecordIDsByShareID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, v6);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__ICCloudContext_addCallbackBlocksToModifyRecordsOperation_rootRecordIDsByShareID___block_invoke;
  v18[3] = &unk_1E64A8470;
  v18[4] = self;
  objc_copyWeak(&v19, &location);
  [v6 setPerRecordSaveBlock:v18];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__ICCloudContext_addCallbackBlocksToModifyRecordsOperation_rootRecordIDsByShareID___block_invoke_2;
  v15[3] = &unk_1E64A8498;
  void v15[4] = self;
  objc_copyWeak(&v17, &location);
  id v8 = v7;
  id v16 = v8;
  [v6 setPerRecordDeleteBlock:v15];
  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__ICCloudContext_addCallbackBlocksToModifyRecordsOperation_rootRecordIDsByShareID___block_invoke_3;
  v13[3] = &unk_1E64A84C0;
  id v10 = v9;
  id v14 = v10;
  [v6 setPerRecordProgressBlock:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__ICCloudContext_addCallbackBlocksToModifyRecordsOperation_rootRecordIDsByShareID___block_invoke_275;
  v11[3] = &unk_1E64A84E8;
  void v11[4] = self;
  objc_copyWeak(&v12, &location);
  [v6 setModifyRecordsCompletionBlock:v11];
  objc_destroyWeak(&v12);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __83__ICCloudContext_addCallbackBlocksToModifyRecordsOperation_rootRecordIDsByShareID___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = (id *)(a1 + 40);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  [v6 modifyRecordsOperation:WeakRetained recordWasSavedWithRecordID:v10 record:v9 error:v8];
}

void __83__ICCloudContext_addCallbackBlocksToModifyRecordsOperation_rootRecordIDsByShareID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = (id *)(a1 + 48);
  id v7 = a3;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [v5 modifyRecordsOperation:WeakRetained recordWasDeletedWithRecordID:v8 rootRecordIDsByShareID:*(void *)(a1 + 40) error:v7];
}

void __83__ICCloudContext_addCallbackBlocksToModifyRecordsOperation_rootRecordIDsByShareID___block_invoke_3(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  id v6 = v5;
  if (((int)(a3 * 100.0) - 1) <= 0x61)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [v5 recordID];
    id v9 = [v7 objectForKeyedSubscript:v8];

    if (!v9 || ([v9 timeIntervalSinceNow], v10 < -0.7))
    {
      id v11 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __83__ICCloudContext_addCallbackBlocksToModifyRecordsOperation_rootRecordIDsByShareID___block_invoke_3_cold_1(v6);
      }

      id v12 = [MEMORY[0x1E4F1C9C8] date];
      id v13 = *(void **)(a1 + 32);
      id v14 = [v6 recordID];
      [v13 setObject:v12 forKeyedSubscript:v14];
    }
  }
}

void __83__ICCloudContext_addCallbackBlocksToModifyRecordsOperation_rootRecordIDsByShareID___block_invoke_275(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = (id *)(a1 + 40);
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(v6);
  [v5 modifyRecordsOperation:WeakRetained didCompleteWithError:v7];

  id v9 = *(void **)(a1 + 32);
  id v10 = objc_loadWeakRetained(v6);
  [v9 informCloudAnalyticsDelegateForOperationDidEnd:v10 recordsByRecordID:MEMORY[0x1E4F1CC08] operationError:v7];
}

- (void)modifyRecordsOperation:(id)a3 recordWasSavedWithRecordID:(id)a4 record:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(ICCloudContext *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__ICCloudContext_modifyRecordsOperation_recordWasSavedWithRecordID_record_error___block_invoke;
  block[3] = &unk_1E64A8278;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

void __81__ICCloudContext_modifyRecordsOperation_recordWasSavedWithRecordID_record_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) backgroundContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __81__ICCloudContext_modifyRecordsOperation_recordWasSavedWithRecordID_record_error___block_invoke_2;
  v5[3] = &unk_1E64A8250;
  id v3 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  id v10 = v2;
  id v4 = v2;
  [v4 performBlockAndWait:v5];
}

uint64_t __81__ICCloudContext_modifyRecordsOperation_recordWasSavedWithRecordID_record_error___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) modifyRecordsOperation:*(void *)(a1 + 40) recordWasSavedWithRecordID:*(void *)(a1 + 48) record:*(void *)(a1 + 56) error:*(void *)(a1 + 64) context:*(void *)(a1 + 72)];
}

- (void)modifyRecordsOperation:(id)a3 recordWasSavedWithRecordID:(id)a4 record:(id)a5 error:(id)a6 context:(id)a7
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v14)
  {
    if ([v15 code] == 14)
    {
      id v17 = [v15 userInfo];
      id v14 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F19D10]];

      if (!v14) {
        [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"record != ((void *)0)" functionName:"-[ICCloudContext modifyRecordsOperation:recordWasSavedWithRecordID:record:error:context:]" simulateCrash:1 showAlert:1 format:@"Missing server record for CKErrorServerRecordChanged"];
      }
    }
    else
    {
      id v14 = 0;
    }
  }
  id v18 = [v12 database];
  id v19 = [(ICCloudContext *)self accountIDForDatabase:v18];

  BOOL v20 = +[ICUserSpecificRecordIDParser isUserSpecificRecordID:v13];
  if (v15)
  {
    if (v20)
    {
      id v21 = [(ICCloudContext *)self existingCloudObjectForUserSpecificRecordID:v13 createPlaceholderIfNecessary:0 accountID:v19 context:v16];
      int v22 = [v21 didFailToSaveUserSpecificRecordWithID:v13 accountID:v19 error:v15];
    }
    else
    {
      id v21 = [(ICCloudContext *)self existingCloudObjectForRecordID:v13 recordType:0 accountID:v19 context:v16];
      int v22 = [v21 objectFailedToBePushedToCloudWithOperation:v12 recordID:v13 error:v15];
    }
    int v26 = v22;
    if (!v21)
    {
      id v27 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint64_t v44 = objc_msgSend(v13, "ic_loggingDescription");
        id v43 = objc_msgSend(v12, "ic_loggingDescription");
        *(_DWORD *)buf = 138413058;
        long long v46 = v19;
        __int16 v47 = 2112;
        long long v48 = v44;
        __int16 v49 = 2112;
        long long v50 = v43;
        __int16 v51 = 2112;
        id v52 = v15;
        _os_log_error_impl(&dword_1C3A61000, v27, OS_LOG_TYPE_ERROR, "Failed to find existing cloud object for modify error in account ID %@: %@ %@: %@", buf, 0x2Au);
      }
    }
    id v28 = [v21 objectID];
    if (!v28) {
      int v26 = 0;
    }

    if (v26 == 1)
    {
      id v29 = [(ICCloudContext *)self objectIDsToRetry];
      unint64_t v30 = [v21 objectID];
      [v29 addObject:v30];
    }
    unint64_t v31 = [v15 code];
    if (v31 <= 0x1F && ((1 << v31) & 0xC0081400) != 0) {
      [v21 incrementFailureCounts];
    }
  }
  else
  {
    id v23 = os_log_create("com.apple.notes", "Cloud");
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
    if (v20)
    {
      if (v24)
      {
        BOOL v39 = objc_msgSend(v14, "ic_loggingDescription");
        uint64_t v40 = objc_msgSend(v12, "ic_loggingDescription");
        *(_DWORD *)buf = 138412802;
        long long v46 = v19;
        __int16 v47 = 2112;
        long long v48 = v39;
        __int16 v49 = 2112;
        long long v50 = v40;
        _os_log_debug_impl(&dword_1C3A61000, v23, OS_LOG_TYPE_DEBUG, "Pushed user-specific record for account ID %@: %@ %@", buf, 0x20u);
      }
      uint64_t v25 = [v14 recordID];
      id v21 = [(ICCloudContext *)self existingCloudObjectForUserSpecificRecordID:v25 createPlaceholderIfNecessary:0 accountID:v19 context:v16];

      [v21 didSaveUserSpecificRecord:v14];
    }
    else
    {
      if (v24)
      {
        id v41 = objc_msgSend(v14, "ic_loggingDescription");
        id v42 = objc_msgSend(v12, "ic_loggingDescription");
        *(_DWORD *)buf = 138412802;
        long long v46 = v19;
        __int16 v47 = 2112;
        long long v48 = v41;
        __int16 v49 = 2112;
        long long v50 = v42;
        _os_log_debug_impl(&dword_1C3A61000, v23, OS_LOG_TYPE_DEBUG, "Pushed account ID %@: %@ %@", buf, 0x20u);
      }
      uint64_t v34 = [(ICCloudContext *)self cloudContextDelegate];
      uint64_t v35 = [v14 recordID];
      [v34 cloudContext:self didPushRecordID:v35 accountID:v19];

      __int16 v36 = [(ICCloudContext *)self existingCloudObjectForRecord:v14 accountID:v19 context:v16];
      id v21 = v36;
      if (v36)
      {
        [v36 objectWasPushedToCloudWithOperation:v12 serverRecord:v14];
        id v37 = [(ICCloudContext *)self objectIDsToRetry];
        unint64_t v38 = [v21 objectID];
        [v37 removeObject:v38];
      }
    }
  }

  uint64_t v32 = [v14 recordID];
  uint64_t v33 = [v32 recordName];
  objc_msgSend(v16, "ic_saveWithLogDescription:", @"pushing record for account ID %@: %@", v19, v33);
}

- (void)modifyRecordsOperation:(id)a3 recordWasDeletedWithRecordID:(id)a4 rootRecordIDsByShareID:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(ICCloudContext *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__ICCloudContext_modifyRecordsOperation_recordWasDeletedWithRecordID_rootRecordIDsByShareID_error___block_invoke;
  block[3] = &unk_1E64A8278;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

void __99__ICCloudContext_modifyRecordsOperation_recordWasDeletedWithRecordID_rootRecordIDsByShareID_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) backgroundContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __99__ICCloudContext_modifyRecordsOperation_recordWasDeletedWithRecordID_rootRecordIDsByShareID_error___block_invoke_2;
  v5[3] = &unk_1E64A8250;
  id v3 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  id v10 = v2;
  id v4 = v2;
  [v4 performBlockAndWait:v5];
}

uint64_t __99__ICCloudContext_modifyRecordsOperation_recordWasDeletedWithRecordID_rootRecordIDsByShareID_error___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) modifyRecordsOperation:*(void *)(a1 + 40) recordWasDeletedWithRecordID:*(void *)(a1 + 48) rootRecordIDsByShareID:*(void *)(a1 + 56) error:*(void *)(a1 + 64) context:*(void *)(a1 + 72)];
}

- (void)modifyRecordsOperation:(id)a3 recordWasDeletedWithRecordID:(id)a4 rootRecordIDsByShareID:(id)a5 error:(id)a6 context:(id)a7
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = a5;
  id v17 = [v12 database];
  id v18 = [(ICCloudContext *)self accountIDForDatabase:v17];

  BOOL v19 = +[ICUserSpecificRecordIDParser isUserSpecificRecordID:v13];
  id v20 = [v16 objectForKeyedSubscript:v13];

  if (v19)
  {
    uint64_t v21 = [(ICCloudContext *)self existingCloudObjectForUserSpecificRecordID:v13 createPlaceholderIfNecessary:0 accountID:v18 context:v15];
  }
  else
  {
    if (v20) {
      id v22 = v20;
    }
    else {
      id v22 = v13;
    }
    uint64_t v21 = [(ICCloudContext *)self existingCloudObjectForRecordID:v22 recordType:0 accountID:v18 context:v15];
  }
  id v23 = (void *)v21;
  if (v21)
  {
    if (v14) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v25 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v62 = objc_msgSend(v13, "ic_loggingDescription");
      BOOL v59 = objc_msgSend(v12, "ic_loggingDescription");
      *(_DWORD *)buf = 138413058;
      v69 = v18;
      __int16 v70 = 2112;
      id v71 = v62;
      __int16 v72 = 2112;
      uint64_t v73 = (uint64_t)v59;
      __int16 v74 = 2112;
      uint64_t v75 = (uint64_t)v14;
      _os_log_error_impl(&dword_1C3A61000, v25, OS_LOG_TYPE_ERROR, "Failed to find existing cloud object for delete error in account ID %@: %@ %@: %@", buf, 0x2Au);
    }
    if (v14)
    {
LABEL_9:
      if (v19)
      {
        BOOL v24 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          id v42 = objc_msgSend(v13, "ic_loggingDescription");
          *(_DWORD *)buf = 138412802;
          v69 = v18;
          __int16 v70 = 2112;
          id v71 = v42;
          __int16 v72 = 2112;
          uint64_t v73 = (uint64_t)v14;
          _os_log_error_impl(&dword_1C3A61000, v24, OS_LOG_TYPE_ERROR, "Error deleting user-specific record in account ID %@: %@: %@", buf, 0x20u);
        }
LABEL_12:

LABEL_56:
        goto LABEL_57;
      }
      uint64_t v28 = [v14 code];
      if (v20)
      {
        if (v28 != 26)
        {
          if (v28 != 11)
          {
            BOOL v24 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              uint64_t v60 = objc_msgSend(v13, "ic_loggingDescription");
              uint64_t v35 = [v23 shortLoggingDescription];
              uint64_t v36 = objc_msgSend(v12, "ic_loggingDescription");
              *(_DWORD *)buf = 138413314;
              v69 = v18;
              __int16 v70 = 2112;
              id v71 = v60;
              __int16 v72 = 2112;
              uint64_t v73 = (uint64_t)v35;
              __int16 v74 = 2112;
              uint64_t v75 = v36;
              id v37 = (void *)v36;
              __int16 v76 = 2112;
              id v77 = v14;
              _os_log_error_impl(&dword_1C3A61000, v24, OS_LOG_TYPE_ERROR, "Error deleting share in account ID %@: %@ for %@ %@: %@", buf, 0x34u);
            }
            goto LABEL_12;
          }
          id v29 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v64 = objc_msgSend(v13, "ic_loggingDescription");
            __int16 v49 = [v23 shortLoggingDescription];
            uint64_t v50 = objc_msgSend(v12, "ic_loggingDescription");
            *(_DWORD *)buf = 138413058;
            v69 = v18;
            __int16 v70 = 2112;
            id v71 = v64;
            __int16 v72 = 2112;
            uint64_t v73 = (uint64_t)v49;
            __int16 v74 = 2112;
            uint64_t v75 = v50;
            __int16 v51 = (void *)v50;
            _os_log_debug_impl(&dword_1C3A61000, v29, OS_LOG_TYPE_DEBUG, "Unknown item deleting share in account ID %@: %@ for %@ %@", buf, 0x2Au);
          }
          goto LABEL_30;
        }
        uint64_t v33 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          uint8_t v65 = objc_msgSend(v13, "ic_loggingDescription");
          BOOL v59 = [v23 shortLoggingDescription];
          uint64_t v52 = objc_msgSend(v12, "ic_loggingDescription");
          *(_DWORD *)buf = 138413058;
          v69 = v18;
          __int16 v70 = 2112;
          id v71 = v65;
          __int16 v72 = 2112;
          uint64_t v73 = (uint64_t)v59;
          __int16 v74 = 2112;
          uint64_t v75 = v52;
          uint64_t v53 = (void *)v52;
          _os_log_debug_impl(&dword_1C3A61000, v33, OS_LOG_TYPE_DEBUG, "Zone not found deleting share in account ID %@: %@ for %@ %@", buf, 0x2Au);
        }
        [v23 setServerShare:0];
        uint64_t v34 = [v13 zoneID];
        [(ICCloudContext *)self receivedZoneNotFound:v34 operation:v12 context:v15];

        goto LABEL_57;
      }
      switch(v28)
      {
        case 31:
          unint64_t v38 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            uint8_t v67 = objc_msgSend(v13, "ic_loggingDescription");
            uint64_t v56 = objc_msgSend(v12, "ic_loggingDescription");
            *(_DWORD *)buf = 138412802;
            v69 = v18;
            __int16 v70 = 2112;
            id v71 = v67;
            __int16 v72 = 2112;
            uint64_t v73 = v56;
            __int16 v57 = (void *)v56;
            _os_log_error_impl(&dword_1C3A61000, v38, OS_LOG_TYPE_ERROR, "Reference violation in account ID %@: for %@ %@", buf, 0x20u);
          }
          [v23 fixBrokenReferences];
          [v23 incrementFailureCounts];
          goto LABEL_53;
        case 22:
          BOOL v39 = os_log_create("com.apple.notes", "Cloud");
          if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_52;
          }
          uint64_t v61 = objc_msgSend(v13, "ic_loggingDescription");
          uint64_t v40 = objc_msgSend(v12, "ic_loggingDescription");
          *(_DWORD *)buf = 138412802;
          v69 = v18;
          __int16 v70 = 2112;
          id v71 = v61;
          __int16 v72 = 2112;
          uint64_t v73 = v40;
          id v41 = (void *)v40;
          _os_log_debug_impl(&dword_1C3A61000, v39, OS_LOG_TYPE_DEBUG, "Batch request failed for deleting in account ID %@: %@ %@", buf, 0x20u);
          break;
        case 11:
          unint64_t v30 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            v66 = objc_msgSend(v13, "ic_loggingDescription");
            uint64_t v54 = objc_msgSend(v12, "ic_loggingDescription");
            *(_DWORD *)buf = 138412802;
            v69 = v18;
            __int16 v70 = 2112;
            id v71 = v66;
            __int16 v72 = 2112;
            uint64_t v73 = v54;
            v55 = (void *)v54;
            _os_log_debug_impl(&dword_1C3A61000, v30, OS_LOG_TYPE_DEBUG, "No record on server to delete in account ID %@: %@ %@", buf, 0x20u);
          }
          [v23 objectWasDeletedFromCloud];
          goto LABEL_53;
        default:
          BOOL v39 = os_log_create("com.apple.notes", "Cloud");
          if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
LABEL_52:

LABEL_53:
            if (!v23) {
              goto LABEL_57;
            }
            BOOL v24 = [(ICCloudContext *)self objectIDsToRetry];
            uint64_t v32 = [v23 objectID];
            [v24 addObject:v32];
LABEL_55:

            goto LABEL_56;
          }
          uint64_t v61 = objc_msgSend(v13, "ic_loggingDescription");
          uint64_t v58 = objc_msgSend(v12, "ic_loggingDescription");
          *(_DWORD *)buf = 138413058;
          v69 = v18;
          __int16 v70 = 2112;
          id v71 = v61;
          __int16 v72 = 2112;
          uint64_t v73 = v58;
          id v41 = (void *)v58;
          __int16 v74 = 2112;
          uint64_t v75 = (uint64_t)v14;
          _os_log_error_impl(&dword_1C3A61000, v39, OS_LOG_TYPE_ERROR, "Error deleting record in account ID %@: %@ %@: %@", buf, 0x2Au);
          break;
      }

      goto LABEL_52;
    }
  }
  int v26 = os_log_create("com.apple.notes", "Cloud");
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG);
  if (v19)
  {
    if (v27)
    {
      id v43 = objc_msgSend(v13, "ic_loggingDescription");
      uint64_t v44 = objc_msgSend(v12, "ic_loggingDescription");
      *(_DWORD *)buf = 138412802;
      v69 = v18;
      __int16 v70 = 2112;
      id v71 = v43;
      __int16 v72 = 2112;
      uint64_t v73 = (uint64_t)v44;
      _os_log_debug_impl(&dword_1C3A61000, v26, OS_LOG_TYPE_DEBUG, "Deleted user-specific record in account ID %@: %@ %@", buf, 0x20u);
    }
    [v23 didDeleteUserSpecificRecordID:v13];
    goto LABEL_57;
  }
  if (v20)
  {
    if (v27)
    {
      uint64_t v45 = objc_msgSend(v13, "ic_loggingDescription");
      long long v46 = objc_msgSend(v12, "ic_loggingDescription");
      *(_DWORD *)buf = 138412802;
      v69 = v18;
      __int16 v70 = 2112;
      id v71 = v45;
      __int16 v72 = 2112;
      uint64_t v73 = (uint64_t)v46;
      _os_log_debug_impl(&dword_1C3A61000, v26, OS_LOG_TYPE_DEBUG, "Deleted share in account ID %@: %@ %@", buf, 0x20u);
    }
LABEL_30:
    objc_msgSend(v23, "setServerShare:", 0, v59);
    goto LABEL_57;
  }
  if (v27)
  {
    id v63 = objc_msgSend(v13, "ic_loggingDescription");
    uint64_t v47 = objc_msgSend(v12, "ic_loggingDescription");
    *(_DWORD *)buf = 138412802;
    v69 = v18;
    __int16 v70 = 2112;
    id v71 = v63;
    __int16 v72 = 2112;
    uint64_t v73 = v47;
    long long v48 = (void *)v47;
    _os_log_debug_impl(&dword_1C3A61000, v26, OS_LOG_TYPE_DEBUG, "Deleted record in account ID %@: %@ %@", buf, 0x20u);
  }
  [v23 objectWasDeletedFromCloud];
  unint64_t v31 = [v23 objectID];

  if (v31)
  {
    BOOL v24 = [(ICCloudContext *)self objectIDsToRetry];
    uint64_t v32 = [v23 objectID];
    [v24 removeObject:v32];
    goto LABEL_55;
  }
LABEL_57:
  objc_msgSend(v15, "ic_saveWithLogDescription:", @"finished modify operation", v59);
}

- (void)modifyRecordsOperation:(id)a3 didCompleteWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ICCloudContext *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__ICCloudContext_modifyRecordsOperation_didCompleteWithError___block_invoke;
  block[3] = &unk_1E64A4500;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __62__ICCloudContext_modifyRecordsOperation_didCompleteWithError___block_invoke(id *a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  id v3 = a1 + 5;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = a1 + 6;
  [v2 incrementOrClearRetryCountForOperationType:v5 error:a1[6]];

  if (!a1[6]) {
    goto LABEL_25;
  }
  id v7 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = objc_msgSend(*v3, "ic_loggingDescription");
    *(_DWORD *)buf = 138412290;
    uint64_t v33 = v8;
    _os_log_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_INFO, "Error modifying records, canceling dependent operations: %@", buf, 0xCu);
  }
  id v9 = [a1[4] operationQueue];
  id v10 = (id)[v9 iterativelyCancelDependentOperations:a1[5]];

  uint64_t v11 = [a1[6] code];
  if ((unint64_t)(v11 - 3) < 2) {
    goto LABEL_7;
  }
  if (v11 == 2)
  {
    id v15 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = objc_msgSend(*v3, "ic_loggingDescription");
      id v17 = *v6;
      *(_DWORD *)buf = 138412546;
      uint64_t v33 = v16;
      __int16 v34 = 2112;
      id v35 = v17;
      _os_log_impl(&dword_1C3A61000, v15, OS_LOG_TYPE_DEFAULT, "Partial error for modify operation %@: %@", buf, 0x16u);
    }
    [a1[4] handleGenericPartialFailuresForError:a1[6] operation:a1[5]];
    goto LABEL_15;
  }
  if (v11 == 20)
  {
LABEL_7:
    id v12 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = objc_msgSend(*v3, "ic_loggingDescription");
      id v14 = *v6;
      *(_DWORD *)buf = 138412546;
      uint64_t v33 = v13;
      __int16 v34 = 2112;
      id v35 = v14;
      _os_log_impl(&dword_1C3A61000, v12, OS_LOG_TYPE_INFO, "Error modifying records %@: %@", buf, 0x16u);
    }
  }
  else
  {
    id v12 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __62__ICCloudContext_modifyRecordsOperation_didCompleteWithError___block_invoke_cold_2();
    }
  }

LABEL_15:
  if ([*v6 code] != 2)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v18 = objc_msgSend(*v3, "recordsToSave", 0);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = a1[4];
          id v24 = a1[5];
          uint64_t v25 = [*(id *)(*((void *)&v27 + 1) + 8 * v22) recordID];
          [v23 modifyRecordsOperation:v24 recordWasSavedWithRecordID:v25 record:0 error:a1[6]];

          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v20);
    }
  }
  [a1[4] startRetryTimerIfNecessaryWithError:a1[6]];
LABEL_25:
  int v26 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    __62__ICCloudContext_modifyRecordsOperation_didCompleteWithError___block_invoke_cold_1((uint64_t)v3);
  }
}

- (void)handleGenericPartialFailuresForError:(id)a3 operation:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v6 = a4;
  id v7 = [v6 database];
  id v8 = [(ICCloudContext *)self accountIDForDatabase:v7];

  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x2020000000;
  char v56 = 0;
  uint64_t v47 = 0;
  long long v48 = &v47;
  uint64_t v49 = 0x3032000000;
  uint64_t v50 = __Block_byref_object_copy__47;
  __int16 v51 = __Block_byref_object_dispose__47;
  id v52 = 0;
  id v9 = [MEMORY[0x1E4F1CA80] set];
  id v10 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v11 = [v31 userInfo];
  long long v29 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __65__ICCloudContext_handleGenericPartialFailuresForError_operation___block_invoke;
  v42[3] = &unk_1E64A8510;
  uint64_t v45 = &v53;
  long long v46 = &v47;
  id v12 = v9;
  id v43 = v12;
  id v13 = v10;
  id v44 = v13;
  [v29 enumerateKeysAndObjectsUsingBlock:v42];
  if (*((unsigned char *)v54 + 24))
  {
    id v14 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v58 = v8;
      _os_log_impl(&dword_1C3A61000, v14, OS_LOG_TYPE_DEFAULT, "User exceeded iCloud quota in account ID %@", buf, 0xCu);
    }

    id v15 = [(ICCloudContext *)self cloudContextDelegate];
    [v15 cloudContext:self didExceedQuotaForRecordID:v48[5] accountID:v8];
  }
  id v16 = [(ICCloudContext *)self backgroundContext];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = v12;
  uint64_t v17 = [obj countByEnumeratingWithState:&v38 objects:v62 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(obj);
        }
        [(ICCloudContext *)self receivedZoneNotFound:*(void *)(*((void *)&v38 + 1) + 8 * i) operation:v6 context:v16];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v38 objects:v62 count:16];
    }
    while (v17);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v32 = v13;
  uint64_t v20 = [v32 countByEnumeratingWithState:&v34 objects:v61 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(v32);
        }
        id v23 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        id v24 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = objc_msgSend(v23, "ic_loggingDescription");
          *(_DWORD *)buf = 138412546;
          uint64_t v58 = v8;
          __int16 v59 = 2112;
          uint64_t v60 = v25;
          _os_log_impl(&dword_1C3A61000, v24, OS_LOG_TYPE_DEFAULT, "User deleted zone in account ID %@: %@", buf, 0x16u);
        }
        int v26 = [(ICCloudContext *)self accountZoneIDsNeedingToBeSaved];
        objc_msgSend(v26, "ic_addZoneID:forAccountID:", v23, v8);

        long long v27 = [v6 database];
        -[ICCloudContext deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:context:](self, "deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:context:", v23, [v27 databaseScope], v8, v16);

        long long v28 = [(ICCloudContext *)self cloudContextDelegate];
        [v28 cloudContext:self userDidDeleteRecordZoneWithID:v23 accountID:v8];
      }
      uint64_t v20 = [v32 countByEnumeratingWithState:&v34 objects:v61 count:16];
    }
    while (v20);
  }

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);
}

void __65__ICCloudContext_handleGenericPartialFailuresForError_operation___block_invoke(void *a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v13;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v13;
      id v6 = [v7 zoneID];
      goto LABEL_7;
    }
    id v6 = 0;
  }
  id v7 = 0;
LABEL_7:
  uint64_t v8 = [v5 code];
  switch(v8)
  {
    case 28:
      id v12 = (void *)a1[5];
LABEL_15:
      objc_msgSend(v12, "ic_addNonNilObject:", v6);
      break;
    case 26:
      id v12 = (void *)a1[4];
      goto LABEL_15;
    case 25:
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
      if (v7)
      {
        uint64_t v9 = *(void *)(a1[7] + 8);
        uint64_t v11 = *(void *)(v9 + 40);
        id v10 = (id *)(v9 + 40);
        if (!v11) {
          objc_storeStrong(v10, v7);
        }
      }
      break;
  }
}

- (id)overrideAccountID
{
  id v3 = [(ICCloudContext *)self cloudContextDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(ICCloudContext *)self cloudContextDelegate];
    id v6 = [v5 overrideAccountIDForCloudContext:self];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)accountIDForDatabase:(id)a3
{
  char v4 = [a3 container];
  id v5 = [(ICCloudContext *)self accountIDForContainer:v4];

  return v5;
}

- (id)accountIDForContainer:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCloudContext *)self overrideAccountID];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = [v4 options];
    uint64_t v9 = [v8 accountOverrideInfo];
    id v7 = [v9 accountID];
  }
  return v7;
}

+ (id)sortedRecords:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v55 = 0;
  id v4 = [MEMORY[0x1E4F1A2F0] topologicallySortRecords:v3 withError:&v55];
  id v41 = v55;
  id v43 = v3;
  if (v41)
  {
    id v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[ICCloudContext sortedRecords:]();
    }

    id v6 = v3;
    id v4 = v6;
  }
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v45 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", (unint64_t)objc_msgSend(v4, "count") >> 1);
  id v44 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", (unint64_t)objc_msgSend(v4, "count") >> 1);
  uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obuint64_t j = v4;
  uint64_t v9 = [obj countByEnumeratingWithState:&v51 objects:v64 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v52;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v52 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v51 + 1) + 8 * v12);
        id v14 = objc_msgSend(v13, "recordID", v41);
        int v15 = [v8 containsObject:v14];

        if (v15)
        {
          id v16 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            +[ICCloudContext sortedRecords:]((uint64_t)v63, (uint64_t)v13);
          }

          [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"+[ICCloudContext sortedRecords:]" simulateCrash:1 showAlert:1 format:@"Duplicate record ID after sorting in ICCloudContext"];
        }
        else
        {
          uint64_t v17 = [v13 recordID];
          [v8 addObject:v17];

          uint64_t v18 = [v13 recordType];
          int v19 = [v18 isEqualToString:@"Media"];

          if (v19)
          {
            uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
            [v20 setObject:v13 atIndexedSubscript:0];
            [v44 addObject:v20];
            uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v44, "count") - 1);
            uint64_t v22 = [v13 recordID];
            [v45 setObject:v21 forKeyedSubscript:v22];

LABEL_16:
            goto LABEL_23;
          }
          id v23 = [v13 recordType];
          if ([v23 isEqualToString:@"Attachment"])
          {
            id v24 = [v13 objectForKeyedSubscript:@"Media"];

            if (v24)
            {
              uint64_t v20 = [v13 objectForKeyedSubscript:@"Media"];
              uint64_t v25 = [v20 recordID];
              uint64_t v21 = [v45 objectForKeyedSubscript:v25];

              if (v21)
              {
                int v26 = objc_msgSend(v44, "objectAtIndexedSubscript:", objc_msgSend(v21, "integerValue"));
                [v26 addObject:v13];
              }
              else
              {
                [v7 addObject:v13];
              }
              goto LABEL_16;
            }
          }
          else
          {
          }
          [v7 addObject:v13];
        }
LABEL_23:
        ++v12;
      }
      while (v10 != v12);
      uint64_t v27 = [obj countByEnumeratingWithState:&v51 objects:v64 count:16];
      uint64_t v10 = v27;
    }
    while (v27);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v28 = v44;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v47 objects:v62 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v48 != v31) {
          objc_enumerationMutation(v28);
        }
        objc_msgSend(v7, "addObjectsFromArray:", *(void *)(*((void *)&v47 + 1) + 8 * i), v41);
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v47 objects:v62 count:16];
    }
    while (v30);
  }

  uint64_t v33 = [v7 count];
  if (v33 != [v43 count] || (uint64_t v34 = objc_msgSend(v7, "count"), v34 != objc_msgSend(obj, "count")))
  {
    long long v35 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      long long v38 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v43, "count"));
      long long v39 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(obj, "count"));
      long long v40 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
      *(_DWORD *)buf = 138412802;
      __int16 v57 = v38;
      __int16 v58 = 2112;
      __int16 v59 = v39;
      __int16 v60 = 2112;
      uint64_t v61 = v40;
      _os_log_error_impl(&dword_1C3A61000, v35, OS_LOG_TYPE_ERROR, "Record counts after sorting in ICCloudContext were not equal {#unsortedRecords: %@, #topoRecords: %@, #finalRecords: %@}", buf, 0x20u);
    }
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no" functionName:"+[ICCloudContext sortedRecords:]" simulateCrash:1 showAlert:1 format:@"Record counts after sorting in ICCloudContext were not equal"];
  }
  long long v36 = objc_msgSend(v7, "copy", v41);

  return v36;
}

+ (id)objectsByAccount:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v16 = 0;
        uint64_t v17 = &v16;
        uint64_t v18 = 0x3032000000;
        int v19 = __Block_byref_object_copy__47;
        uint64_t v20 = __Block_byref_object_dispose__47;
        id v21 = 0;
        uint64_t v9 = [v8 managedObjectContext];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __35__ICCloudContext_objectsByAccount___block_invoke;
        v15[3] = &unk_1E64A4528;
        void v15[4] = v8;
        void v15[5] = &v16;
        [v9 performBlockAndWait:v15];

        if ([(id)v17[5] length])
        {
          uint64_t v10 = [v4 objectForKeyedSubscript:v17[5]];
          if (!v10)
          {
            uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
            [v4 setObject:v10 forKeyedSubscript:v17[5]];
          }
          [v10 addObject:v8];
        }
        else
        {
          uint64_t v11 = [v8 managedObjectContext];
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __35__ICCloudContext_objectsByAccount___block_invoke_2;
          void v14[3] = &unk_1E64A4240;
          void v14[4] = v8;
          [v11 performBlockAndWait:v14];
        }
        _Block_object_dispose(&v16, 8);
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v5);
  }

  return v4;
}

void __35__ICCloudContext_objectsByAccount___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) cloudAccount];
  uint64_t v2 = [v5 identifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __35__ICCloudContext_objectsByAccount___block_invoke_2()
{
  id v0 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __35__ICCloudContext_objectsByAccount___block_invoke_2_cold_1();
  }
}

+ (id)objectsByDatabaseScope:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "databaseScope", (void)v16);
        uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:v11];
        id v13 = [v4 objectForKeyedSubscript:v12];

        if (!v13)
        {
          id v13 = [MEMORY[0x1E4F1CA48] array];
          id v14 = [MEMORY[0x1E4F28ED0] numberWithInteger:v11];
          [v4 setObject:v13 forKeyedSubscript:v14];
        }
        [v13 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)deduplicatedRecordsForCloudObjects:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v3, "count"));
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v29;
    uint64_t v11 = "com.apple.notes";
    uint64_t v12 = "Cloud";
    *(void *)&long long v8 = 138412290;
    long long v26 = v8;
    do
    {
      uint64_t v13 = 0;
      uint64_t v27 = v9;
      do
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v6);
        }
        id v14 = *(void **)(*((void *)&v28 + 1) + 8 * v13);
        int v15 = objc_msgSend(v14, "recordID", v26);
        if (v15)
        {
          if ([v4 containsObject:v15])
          {
            long long v16 = os_log_create(v11, v12);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v15, "ic_loggingDescription");
              uint64_t v17 = v10;
              long long v18 = v4;
              id v19 = v6;
              uint64_t v20 = v12;
              uint64_t v21 = v11;
              v23 = long long v22 = v5;
              *(_DWORD *)buf = v26;
              uint64_t v33 = v23;
              _os_log_impl(&dword_1C3A61000, v16, OS_LOG_TYPE_DEFAULT, "Trying to modify two instances of the same object %@", buf, 0xCu);

              id v5 = v22;
              uint64_t v11 = v21;
              uint64_t v12 = v20;
              id v6 = v19;
              id v4 = v18;
              uint64_t v10 = v17;
              uint64_t v9 = v27;
            }
          }
          else
          {
            [v4 addObject:v15];
            long long v16 = [v14 makeCloudKitRecordForApproach:0];
            [v5 addObject:v16];
          }
        }
        else
        {
          long long v16 = os_log_create(v11, v12);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C3A61000, v16, OS_LOG_TYPE_DEFAULT, "No record ID when trying to modify record", buf, 2u);
          }
        }

        ++v13;
      }
      while (v9 != v13);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v9);
  }

  long long v24 = (void *)[v5 copy];
  return v24;
}

+ (id)allZoneIDsInAccountZoneIDs:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = [v3 array];
  [v4 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_300];

  id v6 = (void *)[v5 copy];
  return v6;
}

void __45__ICCloudContext_allZoneIDsInAccountZoneIDs___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 count])
  {
    id v3 = [v4 allObjects];
    [v4 addObjectsFromArray:v3];
  }
}

+ (BOOL)haveZoneIDsInAccountZoneIDs:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__ICCloudContext_haveZoneIDsInAccountZoneIDs___block_invoke;
  void v6[3] = &unk_1E64A8558;
  void v6[4] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __46__ICCloudContext_haveZoneIDsInAccountZoneIDs___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 count];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)resetZoneForCloudAccount:(id)a3 withReason:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 accountType] == 1)
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    uint64_t v7 = +[ICCloudContext notesZoneID];
    v14[0] = v7;
    long long v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

    uint64_t v9 = [v5 identifier];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__ICCloudContext_resetZoneForCloudAccount_withReason___block_invoke;
    v11[3] = &unk_1E64A8580;
    id v12 = v5;
    dispatch_semaphore_t v13 = v6;
    char v10 = v6;
    [(ICCloudContext *)self deleteRecordZonesWithZoneIDs:v8 accountID:v9 markZonesAsUserPurged:1 completionHandler:v11];
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    long long v8 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[ICCloudContext resetZoneForCloudAccount:withReason:]();
    }
  }
}

void __54__ICCloudContext_resetZoneForCloudAccount_withReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    char v4 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __54__ICCloudContext_resetZoneForCloudAccount_withReason___block_invoke_cold_1();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (id)errorsFromError:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    char v10 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_22;
  }
  dispatch_semaphore_t v6 = [v4 domain];
  if ([v6 isEqualToString:*MEMORY[0x1E4F19C40]])
  {
    uint64_t v7 = [v5 code];

    if (v7 == 2)
    {
      long long v8 = [v5 userInfo];
      uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v10 = [v9 allValues];
      }
      else
      {
        char v10 = (void *)MEMORY[0x1E4F1CBF0];
      }

      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v11 = [v5 domain];
  if (![v11 isEqualToString:@"com.apple.notes.cloud"])
  {

    goto LABEL_19;
  }
  uint64_t v12 = [v5 code];

  if (v12 != 3)
  {
LABEL_19:
    long long v26 = v5;
    char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    goto LABEL_22;
  }
  char v10 = [MEMORY[0x1E4F1CA48] array];
  dispatch_semaphore_t v13 = [v5 userInfo];
  id v14 = [v13 objectForKeyedSubscript:@"Errors"];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = objc_msgSend(a1, "errorsFromError:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
        [v10 addObjectsFromArray:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v17);
  }

LABEL_22:
  return v10;
}

- (BOOL)partialError:(id)a3 containsErrorCode:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 code] != 2) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"partialError.code == CKErrorPartialFailure" functionName:"-[ICCloudContext partialError:containsErrorCode:]" simulateCrash:1 showAlert:0 format:@"Called -partialFailure:containsError with a non-partialFailure."];
  }
  dispatch_semaphore_t v6 = [v5 userInfo];
  uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];
  long long v8 = [v7 allValues];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "code", (void)v16) == a4)
        {
          BOOL v14 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_13:

  return v14;
}

- (void)addDependenciesForModifyRecordsOperation:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(ICCloudContext *)self operationQueue];
  dispatch_semaphore_t v6 = [v5 operations];
  uint64_t v7 = (void *)[v6 copy];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          [v4 addDependency:v12];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)addOperations:(id)a3
{
  id v7 = a3;
  if (![(ICCloudContext *)self didEnqueueLongLivedOperations])
  {
    id v4 = objc_msgSend(v7, "ic_compactMap:", &__block_literal_global_308);
    id v5 = [(ICCloudContext *)self operationIDsBeforeEnqueuingLongLivedOperations];
    [v5 addObjectsFromArray:v4];
  }
  dispatch_semaphore_t v6 = [(ICCloudContext *)self operationQueue];
  [v6 addOperations:v7 waitUntilFinished:0];
}

id __32__ICCloudContext_addOperations___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = ICDynamicCast();

  id v4 = [v3 operationID];

  return v4;
}

- (void)informCloudAnalyticsDelegateForOperationDidEnd:(id)a3 recordsByRecordID:(id)a4 operationError:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(ICCloudContext *)self cloudAnalyticsDelegate];
  [v11 cloudContext:self reportOperationEnd:v10 recordsByRecordID:v9 operationError:v8];
}

- (id)operationToSaveZonesIfNecessaryForAccountID:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  long long v37 = self;
  dispatch_semaphore_t v6 = [(ICCloudContext *)self accountZoneIDsNeedingToBeSaved];
  long long v36 = v4;
  id v7 = [v6 objectForKeyedSubscript:v4];
  id v8 = [v7 allObjects];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v48;
    uint64_t v13 = *MEMORY[0x1E4F19C08];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v48 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v15 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        long long v16 = [v15 ownerName];
        int v17 = [v16 isEqualToString:v13];

        if (v17) {
          [v5 addObject:v15];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v11);
  }
  uint64_t v35 = v9;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v18 = [(ICCloudContext *)v37 operationQueue];
  long long v19 = [v18 operations];

  uint64_t v20 = [v19 countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v44;
    do
    {
      uint64_t v23 = 0;
      uint64_t v38 = v21;
      do
      {
        if (*(void *)v44 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = *(void **)(*((void *)&v43 + 1) + 8 * v23);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v25 = v24;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v26 = [v25 recordZonesToSave];
          uint64_t v27 = [v26 countByEnumeratingWithState:&v39 objects:v51 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v40;
            do
            {
              for (uint64_t j = 0; j != v28; ++j)
              {
                if (*(void *)v40 != v29) {
                  objc_enumerationMutation(v26);
                }
                long long v31 = [*(id *)(*((void *)&v39 + 1) + 8 * j) zoneID];
                [v5 removeObject:v31];
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v39 objects:v51 count:16];
            }
            while (v28);
          }

          uint64_t v21 = v38;
        }
        ++v23;
      }
      while (v23 != v21);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v43 objects:v52 count:16];
    }
    while (v21);
  }

  if ([v5 count])
  {
    id v32 = [v5 allObjects];
    uint64_t v33 = [(ICCloudContext *)v37 operationToSaveZonesForZoneIDs:v32 accountID:v36];
  }
  else
  {
    uint64_t v33 = 0;
  }

  return v33;
}

- (id)operationToSaveZonesForZoneIDs:(id)a3 accountID:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v28 = a4;
  uint64_t v27 = v5;
  if ([v28 length])
  {
    dispatch_semaphore_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    obuint64_t j = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v41 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:*(void *)(*((void *)&v40 + 1) + 8 * i)];
          [v6 addObject:v10];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
      }
      while (v7);
    }

    long long v26 = [(ICCloudContext *)self containerForAccountID:v28];
    id val = (id)[objc_alloc(MEMORY[0x1E4F1A180]) initWithRecordZonesToSave:v6 recordZoneIDsToDelete:0];
    objc_msgSend(val, "setQualityOfService:", -[ICCloudContext qualityOfService](self, "qualityOfService"));
    unint64_t v11 = [(ICCloudContext *)self discretionaryNetworkBehavior];
    uint64_t v12 = [val configuration];
    [v12 setDiscretionaryNetworkBehavior:v11];

    uint64_t v13 = [v26 privateCloudDatabase];
    [val setDatabase:v13];

    objc_initWeak(&location, val);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    os_log_t v14 = v6;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v48 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v36;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v36 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void **)(*((void *)&v35 + 1) + 8 * v17);
          long long v19 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v20 = [v18 zoneID];
            uint64_t v21 = objc_msgSend(v20, "ic_loggingDescription");
            uint64_t v22 = objc_msgSend(val, "ic_loggingDescription");
            *(_DWORD *)buf = 138412546;
            long long v45 = v21;
            __int16 v46 = 2112;
            long long v47 = v22;
            _os_log_debug_impl(&dword_1C3A61000, v19, OS_LOG_TYPE_DEBUG, "Will save zone %@ %@", buf, 0x16u);
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v48 count:16];
      }
      while (v15);
    }

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __59__ICCloudContext_operationToSaveZonesForZoneIDs_accountID___block_invoke;
    v32[3] = &unk_1E64A85C8;
    objc_copyWeak(&v34, &location);
    v32[4] = self;
    id v33 = v28;
    [val setModifyRecordZonesCompletionBlock:v32];
    id v23 = objc_alloc_init(MEMORY[0x1E4F1A218]);
    [v23 setName:@"SaveRecordZones"];
    objc_msgSend(v23, "setQuantity:", objc_msgSend(obj, "count"));
    [v23 setExpectedSendSize:1];
    [v23 setExpectedReceiveSize:1];
    [val setGroup:v23];
    id v24 = val;

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  else
  {
    os_log_t v14 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[ICCloudContext operationToSaveZonesForZoneIDs:accountID:]();
    }
    id v24 = 0;
  }

  return v24;
}

void __59__ICCloudContext_operationToSaveZonesForZoneIDs_accountID___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v9 = [*(id *)(a1 + 32) processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ICCloudContext_operationToSaveZonesForZoneIDs_accountID___block_invoke_2;
  block[3] = &unk_1E64A8278;
  id v16 = v7;
  id v17 = WeakRetained;
  uint64_t v10 = *(void *)(a1 + 32);
  unint64_t v11 = *(void **)(a1 + 40);
  id v18 = v6;
  uint64_t v19 = v10;
  id v20 = v11;
  id v12 = v6;
  id v13 = WeakRetained;
  id v14 = v7;
  dispatch_async(v9, block);
}

void __59__ICCloudContext_operationToSaveZonesForZoneIDs_accountID___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = os_log_create("com.apple.notes", "Cloud");
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __59__ICCloudContext_operationToSaveZonesForZoneIDs_accountID___block_invoke_2_cold_2();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __59__ICCloudContext_operationToSaveZonesForZoneIDs_accountID___block_invoke_2_cold_1(a1);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    id v17 = v5;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
        unint64_t v11 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          id v14 = [v10 zoneID];
          uint64_t v15 = objc_msgSend(v14, "ic_loggingDescription");
          id v16 = objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
          *(_DWORD *)buf = 138412546;
          id v23 = v15;
          __int16 v24 = 2112;
          id v25 = v16;
          _os_log_debug_impl(&dword_1C3A61000, v11, OS_LOG_TYPE_DEBUG, "Saved record zone %@ %@", buf, 0x16u);

          id v5 = v17;
        }

        id v12 = [*(id *)(a1 + 56) accountZoneIDsNeedingToBeSaved];
        id v13 = [v10 zoneID];
        objc_msgSend(v12, "ic_removeZoneID:forAccountID:", v13, *(void *)(a1 + 64));

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v7);
  }
}

- (void)contextDidSaveOrMerge:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ICCloudContext *)self persistentStoreCoordinator];
  objc_opt_class();
  uint64_t v6 = [v4 object];
  uint64_t v7 = ICDynamicCast();

  uint64_t v8 = [v7 persistentStoreCoordinator];
  int v9 = [v8 isEqual:v5];

  if (v9)
  {
    context = (void *)MEMORY[0x1C877DB80]();
    uint64_t v10 = [v4 userInfo];
    uint64_t v25 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F1BDB8]];

    unint64_t v11 = [v4 userInfo];
    id v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F1BDF0]];

    id v13 = [v4 userInfo];
    id v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F1BFA0]];

    uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
    if ([v12 count]) {
      [v15 unionSet:v12];
    }
    uint64_t v27 = v12;
    if (objc_msgSend(v14, "count", v25)) {
      [v15 unionSet:v14];
    }
    id v16 = [MEMORY[0x1E4F1CA80] set];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v34;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v34 != v20) {
            objc_enumerationMutation(v17);
          }
          [v16 addObject:*(void *)(*((void *)&v33 + 1) + 8 * v21++)];
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v19);
    }

    uint64_t v22 = [(ICCloudContext *)self processingQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__ICCloudContext_contextDidSaveOrMerge___block_invoke;
    block[3] = &unk_1E64A4500;
    id v30 = v26;
    id v31 = v16;
    id v32 = self;
    id v23 = v16;
    id v24 = v26;
    dispatch_async(v22, block);
  }
}

void __40__ICCloudContext_contextDidSaveOrMerge___block_invoke(id *a1)
{
  uint64_t v2 = a1 + 4;
  if ([a1[4] count])
  {
    id v3 = [MEMORY[0x1E4F1CAD0] setWithSet:*v2];
    id v4 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __40__ICCloudContext_contextDidSaveOrMerge___block_invoke_cold_2();
    }

    [a1[5] minusSet:v3];
    id v5 = [a1[6] objectIDsToProcess];
    [v5 minusSet:v3];

    uint64_t v6 = [a1[6] objectIDsToRetry];
    [v6 minusSet:v3];
  }
  if ([a1[5] count])
  {
    uint64_t v7 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __40__ICCloudContext_contextDidSaveOrMerge___block_invoke_cold_1();
    }

    uint64_t v8 = [a1[6] objectIDsToProcess];
    [v8 unionSet:a1[5]];

    int v9 = [a1[6] processingSelectorDelayer];
    [v9 requestFire];
  }
}

- (void)processPendingCloudObjects
{
}

- (void)processAllCloudObjectsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCloudContext *)self processingQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __62__ICCloudContext_processAllCloudObjectsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E64A4F70;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __62__ICCloudContext_processAllCloudObjectsWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsToProcessAllObjects:1];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 addOperationToProcessObjectsWithCompletionHandler:v3];
}

- (void)addOperationToProcessObjectsWithCompletionHandler:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(ICCloudContext *)self isDisabled]
    || [(ICCloudContext *)self isDisabledInternal]
    || ![(ICCloudContext *)self isReadyToSync]
    || [(ICCloudContext *)self syncOnlyIfReachable]
    && ![(ICCloudContext *)self isInternetReachable])
  {
    uint64_t v15 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICCloudContext isDisabled](self, "isDisabled"));
      id v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICCloudContext isDisabledInternal](self, "isDisabledInternal"));
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICCloudContext isReadyToSync](self, "isReadyToSync"));
      uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICCloudContext syncOnlyIfReachable](self, "syncOnlyIfReachable"));
      uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICCloudContext isInternetReachable](self, "isInternetReachable"));
      *(_DWORD *)buf = 138413314;
      id v28 = v16;
      __int16 v29 = 2112;
      id v30 = v17;
      __int16 v31 = 2112;
      id v32 = v18;
      __int16 v33 = 2112;
      long long v34 = v19;
      __int16 v35 = 2112;
      long long v36 = v20;
      _os_log_impl(&dword_1C3A61000, v15, OS_LOG_TYPE_DEFAULT, "Not adding operation to process objects because we're not able to sync: isDisabled=%@, isDisabledInternal=%@, isReadyToSync=%@, syncOnlyIfReachable=%@, isInternetReachable=%@", buf, 0x34u);
    }
    if (v4)
    {
      id v12 = [(id)objc_opt_class() errorForDisabledCloudSyncing];
      long long v26 = v12;
      id v13 = (void *)MEMORY[0x1E4F1C978];
      id v14 = &v26;
      goto LABEL_17;
    }
  }
  else
  {
    if ([(ICCloudContext *)self disableRetryTimer]) {
      goto LABEL_19;
    }
    uint64_t v5 = [(ICCloudContext *)self retryTimer];
    if (!v5) {
      goto LABEL_19;
    }
    id v6 = (void *)v5;
    uint64_t v7 = [(ICCloudContext *)self retryTimer];
    id v8 = [v7 fireDate];
    int v9 = [MEMORY[0x1E4F1C9C8] date];
    int v10 = objc_msgSend(v8, "ic_isLaterThanDate:", v9);

    if (!v10)
    {
LABEL_19:
      uint64_t v22 = [(ICCloudContext *)self processingQueue];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __68__ICCloudContext_addOperationToProcessObjectsWithCompletionHandler___block_invoke;
      v23[3] = &unk_1E64A4F70;
      v23[4] = self;
      id v24 = v4;
      dispatch_async(v22, v23);

      goto LABEL_18;
    }
    unint64_t v11 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3A61000, v11, OS_LOG_TYPE_DEFAULT, "Not adding operation to process objects because we're waiting for a retry timer", buf, 2u);
    }

    if (v4)
    {
      id v12 = [(id)objc_opt_class() errorForWaitingForRetryTimer];
      uint64_t v25 = v12;
      id v13 = (void *)MEMORY[0x1E4F1C978];
      id v14 = &v25;
LABEL_17:
      uint64_t v21 = [v13 arrayWithObjects:v14 count:1];
      (*((void (**)(id, void *))v4 + 2))(v4, v21);
    }
  }
LABEL_18:
}

void __68__ICCloudContext_addOperationToProcessObjectsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B48]);
  [v2 setName:@"ProcessObjects"];
  objc_initWeak(&location, v2);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __68__ICCloudContext_addOperationToProcessObjectsWithCompletionHandler___block_invoke_2;
  v22[3] = &unk_1E64A6858;
  objc_copyWeak(&v24, &location);
  uint64_t v3 = *(void **)(a1 + 40);
  v22[4] = *(void *)(a1 + 32);
  id v23 = v3;
  [v2 addExecutionBlock:v22];
  id v4 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __68__ICCloudContext_addOperationToProcessObjectsWithCompletionHandler___block_invoke_cold_1((uint64_t)v2, [*(id *)(a1 + 32) needsToProcessAllObjects], v32, v4);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "operationQueue", 0);
  id v6 = [v5 operations];
  uint64_t v7 = (void *)[v6 copy];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v7);
        }
        [v2 addDependency:*(void *)(*((void *)&v18 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v31 count:16];
    }
    while (v8);
  }

  unint64_t v11 = [v2 dependencies];
  BOOL v12 = [v11 count] == 0;

  if (!v12)
  {
    id v13 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      id v16 = [v2 dependencies];
      uint64_t v17 = [v16 count];
      *(_DWORD *)buf = 134218240;
      id v28 = v2;
      __int16 v29 = 2048;
      uint64_t v30 = v17;
      _os_log_debug_impl(&dword_1C3A61000, v13, OS_LOG_TYPE_DEBUG, "Process operation %p waiting on %ld other operations", buf, 0x16u);
    }
  }
  id v14 = *(void **)(a1 + 32);
  id v26 = v2;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  [v14 addOperations:v15];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __68__ICCloudContext_addOperationToProcessObjectsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __68__ICCloudContext_addOperationToProcessObjectsWithCompletionHandler___block_invoke_2_cold_1(a1);
  }

  uint64_t v3 = [*(id *)(a1 + 32) processingQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__ICCloudContext_addOperationToProcessObjectsWithCompletionHandler___block_invoke_318;
  v5[3] = &unk_1E64A4F70;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_async(v3, v5);
}

uint64_t __68__ICCloudContext_addOperationToProcessObjectsWithCompletionHandler___block_invoke_318(uint64_t a1)
{
  if ([*(id *)(a1 + 32) needsToProcessAllObjects])
  {
    [*(id *)(a1 + 32) setNeedsToProcessAllObjects:0];
    id v2 = [*(id *)(a1 + 32) backgroundContext];
    uint64_t v3 = [*(id *)(a1 + 32) _objectIDsToProcessForFullSyncInContext:v2];
    id v4 = [*(id *)(a1 + 32) objectIDsToProcess];
    [v4 unionSet:v3];
  }
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  return [v5 _processPendingCloudObjectsWithCompletionHandler:v6];
}

- (id)_objectIDsToProcessForFullSyncInContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__ICCloudContext__objectIDsToProcessForFullSyncInContext___block_invoke;
  v10[3] = &unk_1E64A4500;
  void v10[4] = self;
  id v11 = v4;
  id v12 = v5;
  id v6 = v5;
  id v7 = v4;
  [v7 performBlockAndWait:v10];
  uint64_t v8 = (void *)[v6 copy];

  return v8;
}

void __58__ICCloudContext__objectIDsToProcessForFullSyncInContext___block_invoke(uint64_t a1)
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"needsToBeFetchedFromCloud == YES"];
  id v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"cloudState.currentLocalVersion > cloudState.latestVersionSyncedToCloud", v3);
  v10[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"needsToSaveUserSpecificRecord == YES"];
  v10[2] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  id v7 = [v2 orPredicateWithSubpredicates:v6];

  uint64_t v8 = [*(id *)(a1 + 32) allCloudObjectIDsInContext:*(void *)(a1 + 40) predicate:v7];
  uint64_t v9 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __58__ICCloudContext__objectIDsToProcessForFullSyncInContext___block_invoke_cold_1(v8);
  }

  [*(id *)(a1 + 48) unionSet:v8];
}

- (void)_processPendingCloudObjectsWithCompletionHandler:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(ICCloudContext *)self isReadyToSync])
  {
    if (![(ICCloudContext *)self syncOnlyIfReachable]
      || [(ICCloudContext *)self isInternetReachable])
    {
      uint64_t v5 = [(ICCloudContext *)self processingQueue];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __67__ICCloudContext__processPendingCloudObjectsWithCompletionHandler___block_invoke;
      v11[3] = &unk_1E64A4F70;
      void v11[4] = self;
      id v12 = v4;
      dispatch_async(v5, v11);

      goto LABEL_15;
    }
    uint64_t v8 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[ICCloudContext _processPendingCloudObjectsWithCompletionHandler:]();
    }
  }
  else
  {
    BOOL v6 = [(ICCloudContext *)self isCloudKitAccountAvailable];
    os_log_t v7 = os_log_create("com.apple.notes", "Cloud");
    uint64_t v8 = v7;
    if (v6)
    {
      uint64_t v8 = v7;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[ICCloudContext _processPendingCloudObjectsWithCompletionHandler:](self);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      -[ICCloudContext _processPendingCloudObjectsWithCompletionHandler:]();
    }
  }

  if (v4)
  {
    uint64_t v9 = [(id)objc_opt_class() errorForDisabledCloudSyncing];
    v13[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    (*((void (**)(id, void *))v4 + 2))(v4, v10);
  }
LABEL_15:
}

void __67__ICCloudContext__processPendingCloudObjectsWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) objectIDsToRetry];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __67__ICCloudContext__processPendingCloudObjectsWithCompletionHandler___block_invoke_cold_3((uint64_t)v2);
    }

    BOOL v6 = [*v2 objectIDsToProcess];
    os_log_t v7 = [*v2 objectIDsToRetry];
    [v6 unionSet:v7];

    uint64_t v8 = [*v2 objectIDsToRetry];
    [v8 removeAllObjects];
  }
  uint64_t v9 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __67__ICCloudContext__processPendingCloudObjectsWithCompletionHandler___block_invoke_cold_2((uint64_t)v2);
  }

  uint64_t v10 = *(void **)(a1 + 32);
  id v11 = [v10 objectIDsToProcess];
  [v10 processObjectIDs:v11 completionHandler:*(void *)(a1 + 40)];

  id v12 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    __38__ICCloudContext_clearPendingActivity__block_invoke_cold_2();
  }

  id v13 = [*v2 objectIDsToProcess];
  [v13 removeAllObjects];
}

- (void)processObjectIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ICCloudContext *)self backgroundContext];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__ICCloudContext_processObjectIDs_completionHandler___block_invoke;
  v12[3] = &unk_1E64A4F48;
  id v13 = v6;
  id v14 = v8;
  uint64_t v15 = self;
  id v16 = v7;
  id v9 = v7;
  id v10 = v8;
  id v11 = v6;
  [v10 performBlockAndWait:v12];
}

void __53__ICCloudContext_processObjectIDs_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  long long v42 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v44 = [MEMORY[0x1E4F1CA48] array];
  long long v43 = [MEMORY[0x1E4F1CA48] array];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v41 = (void *)a1;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v54 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "entity", v41);
        id v9 = [v8 name];
        id v10 = (objc_class *)objc_opt_class();
        id v11 = NSStringFromClass(v10);
        int v12 = [v9 isEqualToString:v11];

        if (v12) {
          id v13 = v43;
        }
        else {
          id v13 = v44;
        }
        [v13 addObject:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v4);
  }

  id v14 = (void *)MEMORY[0x1C877DB80]();
  uint64_t v15 = (objc_class *)objc_opt_class();
  id v16 = NSStringFromClass(v15);
  __int16 v60 = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
  long long v18 = +[ICCloudSyncingObject ic_objectsFromObjectIDs:v44 relationshipKeyPathsForPrefetching:v17 context:v41[5]];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v19 = v18;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v50 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = ICProtocolCast();
        uint64_t v25 = v24;
        if (v24
          && (([v24 isInICloudAccount] & 1) != 0
           || [v25 needsToBeDeletedFromCloud]))
        {
          objc_msgSend(v42, "addObject:", v25, v41);
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v49 objects:v59 count:16];
    }
    while (v21);
  }

  id v26 = (void *)MEMORY[0x1C877DB80]();
  uint64_t v27 = (objc_class *)objc_opt_class();
  id v28 = NSStringFromClass(v27);
  __int16 v58 = v28;
  __int16 v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
  uint64_t v30 = +[ICCloudState ic_objectsFromObjectIDs:v43 relationshipKeyPathsForPrefetching:v29 context:v41[5]];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v31 = v30;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v46;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v46 != v34) {
          objc_enumerationMutation(v31);
        }
        objc_opt_class();
        long long v36 = ICDynamicCast();
        uint64_t v37 = [v36 cloudSyncingObject];
        uint64_t v38 = v37;
        if (v37
          && (([v37 isInICloudAccount] & 1) != 0
           || [v38 needsToBeDeletedFromCloud]))
        {
          objc_msgSend(v42, "addObject:", v38, v41);
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v45 objects:v57 count:16];
    }
    while (v33);
  }

  long long v39 = (void *)v41[6];
  long long v40 = [v42 array];
  [v39 _processCloudObjects:v40 completionHandler:v41[7]];
}

- (void)_processCloudObjects:(id)a3 completionHandler:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    id v9 = [(id)objc_opt_class() objectsByAccount:v6];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __57__ICCloudContext__processCloudObjects_completionHandler___block_invoke_2;
    v32[3] = &unk_1E64A85F0;
    v32[4] = self;
    id v10 = v8;
    id v33 = v10;
    [v9 enumerateKeysAndObjectsUsingBlock:v32];
    if ([v10 count])
    {
      id v11 = +[ICCloudConfiguration sharedConfiguration];
      int v12 = [v11 throttlingPolicy];
      [v12 incrementBatchCount];

      [(ICCloudContext *)self addOperations:v10];
    }
    if (v7)
    {
      id v13 = (void *)MEMORY[0x1E4F28B48];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __57__ICCloudContext__processCloudObjects_completionHandler___block_invoke_482;
      v28[3] = &unk_1E64A4578;
      id v14 = v10;
      id v29 = v14;
      uint64_t v30 = self;
      id v31 = v7;
      uint64_t v15 = [v13 blockOperationWithBlock:v28];
      [v15 setName:@"ProcessCompletion"];
      objc_msgSend(v15, "ic_setResistsCancellation:", 1);
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v16 = v14;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v36 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v25;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(v16);
            }
            objc_msgSend(v15, "addDependency:", *(void *)(*((void *)&v24 + 1) + 8 * v20++), (void)v24);
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v36 count:16];
        }
        while (v18);
      }

      uint64_t v21 = [(ICCloudContext *)self operationQueue];
      [v21 addOperation:v15];
    }
    goto LABEL_18;
  }
  uint64_t v22 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudContext _processCloudObjects:completionHandler:]();
  }

  if (v7)
  {
    id v23 = [(ICCloudContext *)self operationQueue];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __57__ICCloudContext__processCloudObjects_completionHandler___block_invoke;
    v34[3] = &unk_1E64A56A0;
    id v35 = v7;
    [v23 addOperationWithBlock:v34];

    id v10 = v35;
LABEL_18:
  }
}

uint64_t __57__ICCloudContext__processCloudObjects_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__ICCloudContext__processCloudObjects_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __57__ICCloudContext__processCloudObjects_completionHandler___block_invoke_2_cold_1();
  }

  id v7 = [MEMORY[0x1E4F1CA80] set];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if ([v13 needsToBeFetchedFromCloud])
        {
          id v14 = [v13 recordID];
          if (v14) {
            [v7 addObject:v14];
          }
        }
        if ([v13 canBeRootShareObject])
        {
          uint64_t v15 = [v13 serverRecord];
          id v16 = [v15 share];
          uint64_t v17 = [v16 recordID];

          if (v17)
          {
            uint64_t v18 = [v13 serverShare];

            if (!v18)
            {
              [v7 addObject:v17];
              [MEMORY[0x1E4F837E8] postBasicEvent:10];
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v10);
  }

  uint64_t v19 = *(void **)(a1 + 32);
  uint64_t v20 = [v7 allObjects];
  uint64_t v21 = objc_msgSend(v19, "operationsToFetchRecordIDs:qualityOfService:operationGroupName:accountID:", v20, objc_msgSend(*(id *)(a1 + 32), "qualityOfService"), 0, v4);

  [*(id *)(a1 + 40) addObjectsFromArray:v21];
  uint64_t v22 = *(void **)(a1 + 32);
  id v31 = 0;
  id v32 = 0;
  id v29 = 0;
  id v30 = 0;
  [v22 _filterCloudSyncingObjects:v8 accountID:v4 objectsToSave:&v32 objectsToDelete:&v31 objectsToDeleteShares:&v30 objectsToSaveUserSpecificRecord:&v29];
  id v23 = v32;
  id v24 = v31;
  id v25 = v30;
  id v26 = v29;
  long long v27 = [*(id *)(a1 + 32) operationsToModifyRecordsForCloudObjectsToSave:v23 delete:v24 deleteShares:v25 saveUserSpecificRecords:v26 operationGroupName:@"SaveChangedObjects" addDependencies:1 accountID:v4];
  [*(id *)(a1 + 40) addObjectsFromArray:v27];
}

void __57__ICCloudContext__processCloudObjects_completionHandler___block_invoke_482(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "error", (void)v14);

        if (v9)
        {
          uint64_t v10 = [v8 error];
          [v2 addObject:v10];

          uint64_t v11 = *(void **)(a1 + 40);
          int v12 = [v8 error];
          [v11 startRetryTimerIfNecessaryWithError:v12];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  if ([v2 count]) {
    id v13 = v2;
  }
  else {
    id v13 = 0;
  }
  (*(void (**)(void, void *))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v13);
}

- (void)_filterCloudSyncingObjects:(id)a3 accountID:(id)a4 objectsToSave:(id *)a5 objectsToDelete:(id *)a6 objectsToDeleteShares:(id *)a7 objectsToSaveUserSpecificRecord:(id *)a8
{
  id v28 = a5;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v33 = a4;
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  int v12 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v14 = v9;
  long long v15 = (void *)v13;
  id v16 = v14;
  uint64_t v17 = [v14 countByEnumeratingWithState:&v34 objects:v42 count:16];
  id v32 = (void *)v13;
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v35 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (objc_msgSend(v21, "needsToBePushedToCloud", v28)
          && ([v21 shouldBeIgnoredForSync] & 1) == 0
          && ([v21 needsToBeDeletedFromCloud] & 1) == 0)
        {
          if ([v21 hasAllMandatoryFields])
          {
            uint64_t v22 = v10;
LABEL_18:
            [v22 addObject:v21];
            goto LABEL_19;
          }
          id v23 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            id v24 = [v21 loggingDescription];
            *(_DWORD *)buf = 138412546;
            id v39 = v33;
            __int16 v40 = 2112;
            long long v41 = v24;
            _os_log_impl(&dword_1C3A61000, v23, OS_LOG_TYPE_DEFAULT, "Not syncing object because it's missing mandatory fields in account ID %@: %@", buf, 0x16u);

            long long v15 = v32;
          }
        }
        if ([v21 shouldBeIgnoredForSync])
        {
          [v21 decrementFailureCounts];
          goto LABEL_19;
        }
        if ([v21 needsToBeDeletedFromCloud])
        {
          uint64_t v22 = v11;
          goto LABEL_18;
        }
LABEL_19:
        if ([v21 needsToDeleteShare])
        {
          [v12 addObject:v21];
          [v10 removeObject:v21];
        }
        if (([v21 needsToBeDeletedFromCloud] & 1) == 0
          && [v21 wantsUserSpecificRecord]
          && [v21 needsToSaveUserSpecificRecord])
        {
          id v25 = [v21 userSpecificRecordID];

          if (v25)
          {
            [v15 addObject:v21];
          }
          else
          {
            id v26 = os_log_create("com.apple.notes", "Cloud");
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              long long v27 = [v21 loggingDescription];
              *(_DWORD *)buf = 138412546;
              id v39 = v33;
              __int16 v40 = 2112;
              long long v41 = v27;
              _os_log_error_impl(&dword_1C3A61000, v26, OS_LOG_TYPE_ERROR, "Not syncing user-specific object because it's missing its user-specific record ID in account ID %@: %@", buf, 0x16u);

              long long v15 = v32;
            }
          }
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v18);
  }

  if (v28) {
    id *v28 = (id)[v10 copy];
  }
  if (a6) {
    *a6 = (id)[v11 copy];
  }
  if (a7) {
    *a7 = (id)[v12 copy];
  }
  if (a8) {
    *a8 = (id)[v32 copy];
  }
}

- (void)handleRemoteNotificationWithUserInfo:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1A1D0];
  id v8 = a3;
  id v9 = [v7 notificationFromRemoteNotificationDictionary:v8];
  uint64_t v10 = [v8 objectForKeyedSubscript:@"aps"];

  uint64_t v11 = [v10 objectForKeyedSubscript:@"content-available"];

  if (v9)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __66__ICCloudContext_handleRemoteNotificationWithUserInfo_completion___block_invoke;
    v15[3] = &unk_1E64A4418;
    id v16 = v6;
    [(ICCloudContext *)self handleCloudKitNotification:v9 completionHandler:v15];
    int v12 = v16;
LABEL_5:

    goto LABEL_6;
  }
  if ([v11 integerValue] == 1)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __66__ICCloudContext_handleRemoteNotificationWithUserInfo_completion___block_invoke_2;
    v13[3] = &unk_1E64A4418;
    id v14 = v6;
    [(ICCloudContext *)self syncWithReason:@"GenericContentAvailablePush" uploadUnsyncedChanges:0 completionHandler:v13];
    int v12 = v14;
    goto LABEL_5;
  }
  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
LABEL_6:
}

uint64_t __66__ICCloudContext_handleRemoteNotificationWithUserInfo_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, 1);
  }
  return result;
}

void __66__ICCloudContext_handleRemoteNotificationWithUserInfo_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v4 = v3;
  performBlockOnMainThread();
}

uint64_t __66__ICCloudContext_handleRemoteNotificationWithUserInfo_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, *(void *)(a1 + 32), 1);
  }
  return result;
}

- (void)handleCloudKitNotification:(id)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudContext handleCloudKitNotification:completionHandler:](v6, v8);
  }

  if ([(ICCloudContext *)self isReadyToSync]
    && ![(ICCloudContext *)self isDisabled]
    && ![(ICCloudContext *)self isDisabledInternal])
  {
    uint64_t v12 = [v6 notificationType];
    if (v12 == 2 || v12 == 4)
    {
      id v13 = v6;
      uint64_t v14 = [v13 databaseScope];
      os_log_t v15 = [v13 subscriptionOwnerUserRecordID];

      uint64_t v11 = [v15 recordName];
    }
    else
    {
      os_log_t v15 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[ICCloudContext handleCloudKitNotification:completionHandler:]((uint64_t)v6, v15);
      }

      uint64_t v11 = 0;
      uint64_t v14 = 0;
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    if (v14)
    {
      if (v11)
      {
        id v16 = [(ICCloudContext *)self containersByAccountID];
        BOOL v17 = [v16 count] == 0;

        if (!v17)
        {
          uint64_t v18 = [(ICCloudContext *)self containersByAccountID];
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __63__ICCloudContext_handleCloudKitNotification_completionHandler___block_invoke;
          v19[3] = &unk_1E64A8668;
          p_long long buf = &buf;
          uint64_t v24 = v14;
          id v20 = v11;
          uint64_t v21 = self;
          id v22 = v7;
          [v18 enumerateKeysAndObjectsUsingBlock:v19];
        }
      }
    }
    if (v7 && !*(unsigned char *)(*((void *)&buf + 1) + 24)) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
    _Block_object_dispose(&buf, 8);
    goto LABEL_10;
  }
  id v9 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [(ICCloudContext *)self readinessLoggingDescription];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_INFO, "Not handling CloudKit push notification: %@", (uint8_t *)&buf, 0xCu);
  }
  if (v7)
  {
    uint64_t v11 = [(id)objc_opt_class() errorForDisabledCloudSyncing];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
LABEL_10:
  }
}

void __63__ICCloudContext_handleCloudKitNotification_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__ICCloudContext_handleCloudKitNotification_completionHandler___block_invoke_2;
  v8[3] = &unk_1E64A8640;
  id v9 = *(id *)(a1 + 32);
  id v10 = v4;
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v11 = v5;
  id v12 = v6;
  id v7 = v4;
  [v7 fetchUserRecordIDWithCompletionHandler:v8];
}

void __63__ICCloudContext_handleCloudKitNotification_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = [a2 recordName];
  if ([*(id *)(a1 + 32) isEqualToString:v3])
  {
    id v4 = [*(id *)(a1 + 40) databaseWithDatabaseScope:*(void *)(a1 + 64)];
    uint64_t v5 = *(void **)(a1 + 48);
    v11[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__ICCloudContext_handleCloudKitNotification_completionHandler___block_invoke_3;
    v8[3] = &unk_1E64A8618;
    id v7 = *(void **)(a1 + 56);
    void v8[4] = *(void *)(a1 + 48);
    id v9 = @"PushNotification";
    id v10 = v7;
    [v5 fetchDatabaseChangesForDatabases:v6 reason:@"PushNotification" completionHandler:v8];
  }
}

uint64_t __63__ICCloudContext_handleCloudKitNotification_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchRecordZoneChangesWithReason:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)validateAccountZoneIDsNeedingFetchChanges
{
  id v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = [(ICCloudContext *)self accountZoneIDsNeedingFetchChanges];
  uint64_t v5 = [v4 allKeys];
  id v6 = [v3 setWithArray:v5];

  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = [(ICCloudContext *)self containersByAccountID];
  id v9 = [v8 allKeys];
  id v10 = [v7 setWithArray:v9];

  [v6 minusSet:v10];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __59__ICCloudContext_validateAccountZoneIDsNeedingFetchChanges__block_invoke;
  v11[3] = &unk_1E64A8690;
  void v11[4] = self;
  [v6 enumerateObjectsUsingBlock:v11];
}

void __59__ICCloudContext_validateAccountZoneIDsNeedingFetchChanges__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_DEFAULT, "Filtering out account ID %@ from needing fetch changes since there is no corresponding container.", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = [*(id *)(a1 + 32) accountZoneIDsNeedingFetchChanges];
  [v5 setObject:0 forKeyedSubscript:v3];
}

- (void)fetchRecordZoneChangesWithReason:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ICCloudContext *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__ICCloudContext_fetchRecordZoneChangesWithReason_completionHandler___block_invoke;
  block[3] = &unk_1E64A4578;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __69__ICCloudContext_fetchRecordZoneChangesWithReason_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) validateAccountZoneIDsNeedingFetchChanges];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 accountZoneIDsNeedingFetchChanges];
  [v2 fetchRecordZoneChangesForAccountZoneIDs:v3 reason:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)fetchRecordZoneChangesForZoneIDs:(id)a3 accountID:(id)a4 reason:(id)a5 completionHandler:(id)a6
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  uint64_t v14 = (void *)v13;
  if (v10)
  {
    id v16 = v10;
    v17[0] = v13;
    os_log_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  }
  else
  {
    os_log_t v15 = 0;
  }
  [(ICCloudContext *)self fetchRecordZoneChangesForAccountZoneIDs:v15 reason:v11 completionHandler:v12];
}

- (void)fetchRecordZoneChangesForAccountZoneIDs:(id)a3 reason:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [MEMORY[0x1E4F837E8] postFetchZoneChangesTelemetryWithReason:v9];
  id v11 = [(ICCloudContext *)self processingQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__ICCloudContext_fetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke;
  v15[3] = &unk_1E64A4F48;
  id v16 = v8;
  BOOL v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __83__ICCloudContext_fetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke(id *a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"Asking to fetch changes for:"];
  id v3 = a1[4];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __83__ICCloudContext_fetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_2;
  v35[3] = &unk_1E64A86B8;
  id v4 = v2;
  id v36 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v35];
  uint64_t v5 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __83__ICCloudContext_fetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_cold_2();
  }
  uint64_t v24 = v4;

  id v6 = (void *)MEMORY[0x1E4F28B48];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __83__ICCloudContext_fetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_504;
  v31[3] = &unk_1E64A4F48;
  int8x16_t v25 = *((int8x16_t *)a1 + 2);
  id v7 = (id)v25.i64[0];
  int8x16_t v32 = vextq_s8(v25, v25, 8uLL);
  id v33 = a1[6];
  id v34 = a1[7];
  uint64_t v26 = [v6 blockOperationWithBlock:v31];
  [v26 setName:@"CreateFetchZoneChanges"];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = [a1[5] operationQueue];
  id v9 = [v8 operations];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v27 + 1) + 8 * v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = v14;
          id v16 = a1[5];
          BOOL v17 = objc_msgSend(v15, "database", v24);
          id v18 = [v16 accountIDForDatabase:v17];

          if (v18)
          {
            id v19 = [a1[4] objectForKeyedSubscript:v18];
            uint64_t v20 = [v19 count];

            if (v20)
            {
              uint64_t v21 = os_log_create("com.apple.notes", "Cloud");
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
                __83__ICCloudContext_fetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_cold_1((uint64_t)v38, (uint64_t)v15);
              }

              [v26 addDependency:v15];
            }
          }
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v11);
  }

  id v22 = a1[5];
  long long v37 = v26;
  id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  [v22 addOperations:v23];
}

void __83__ICCloudContext_fetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "ic_loggingDescription");
        [v7 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  id v14 = [v7 componentsJoinedByString:@" "];
  [*(id *)(a1 + 32) appendFormat:@" account ID: %@, zone IDs: %@.", v5, v14, (void)v15];
}

uint64_t __83__ICCloudContext_fetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_504(uint64_t a1)
{
  return [*(id *)(a1 + 32) addOperationsToFetchRecordZoneChangesForAccountZoneIDs:*(void *)(a1 + 40) reason:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)addOperationsToFetchRecordZoneChangesForAccountZoneIDs:(id)a3 reason:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [(ICCloudContext *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__ICCloudContext_addOperationsToFetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke;
  block[3] = &unk_1E64A4578;
  id v13 = v7;
  id v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __98__ICCloudContext_addOperationsToFetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke(id *a1)
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = a1[4];
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  void v72[2] = __98__ICCloudContext_addOperationsToFetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_2;
  v72[3] = &unk_1E64A86E0;
  id v4 = v2;
  id v5 = a1[5];
  id v73 = v4;
  id v74 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v72];
  id v6 = [a1[5] operationQueue];
  [v6 setSuspended:1];

  long long v52 = [MEMORY[0x1E4F1CA48] array];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  obuint64_t j = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v68 objects:v87 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v69;
    *(void *)&long long v8 = 67109890;
    long long v50 = v8;
    uint64_t v51 = *(void *)v69;
    do
    {
      uint64_t v11 = 0;
      uint64_t v53 = v9;
      do
      {
        if (*(void *)v69 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v68 + 1) + 8 * v11);
        if ((objc_msgSend(v12, "isFinished", v50) & 1) != 0
          || ([v12 isExecuting] & 1) != 0
          || ([v12 isCancelled] & 1) != 0
          || ([a1[5] operationQueue],
              id v13 = objc_claimAutoreleasedReturnValue(),
              [v13 operations],
              id v14 = objc_claimAutoreleasedReturnValue(),
              char v15 = [v14 containsObject:v12],
              v14,
              v13,
              (v15 & 1) != 0))
        {
          long long v16 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            int v31 = [v12 isFinished];
            int v32 = [v12 isExecuting];
            int v33 = [v12 isCancelled];
            objc_msgSend(v12, "ic_loggingDescription");
            v35 = uint64_t v34 = v11;
            *(_DWORD *)long long buf = v50;
            int v78 = v31;
            __int16 v79 = 1024;
            int v80 = v32;
            __int16 v81 = 1024;
            int v82 = v33;
            __int16 v83 = 2112;
            v84 = v35;
            _os_log_debug_impl(&dword_1C3A61000, v16, OS_LOG_TYPE_DEBUG, "Not adding operation to queue. isFinished=%d isExecuting=%d isCancelled=%d %@", buf, 0x1Eu);

            uint64_t v11 = v34;
          }
        }
        else
        {
          long long v56 = v12;
          uint64_t v54 = v11;
          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v17 = [a1[5] operationQueue];
          long long v18 = [v17 operations];

          uint64_t v19 = [v18 countByEnumeratingWithState:&v64 objects:v86 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v65;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v65 != v21) {
                  objc_enumerationMutation(v18);
                }
                id v23 = *(void **)(*((void *)&v64 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v24 = v23;
                  id v25 = a1[5];
                  uint64_t v26 = [v24 database];
                  long long v27 = [v25 accountIDForDatabase:v26];

                  if (v27)
                  {
                    long long v28 = [a1[4] objectForKeyedSubscript:v27];
                    uint64_t v29 = [v28 count];

                    if (v29)
                    {
                      long long v30 = os_log_create("com.apple.notes", "Cloud");
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
                        __98__ICCloudContext_addOperationsToFetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_cold_1((uint64_t)v85, (uint64_t)v24);
                      }

                      [v56 addDependency:v24];
                    }
                  }
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v64 objects:v86 count:16];
            }
            while (v20);
          }

          [v52 addObject:v56];
          uint64_t v10 = v51;
          uint64_t v9 = v53;
          uint64_t v11 = v54;
        }
        ++v11;
      }
      while (v11 != v9);
      uint64_t v36 = [obj countByEnumeratingWithState:&v68 objects:v87 count:16];
      uint64_t v9 = v36;
    }
    while (v36);
  }

  id v37 = a1[5];
  uint64_t v38 = (void *)[v52 copy];
  [v37 addOperations:v38];

  id v39 = [a1[5] operationQueue];
  [v39 setSuspended:0];

  if (a1[6])
  {
    uint64_t v40 = (void *)MEMORY[0x1E4F28B48];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __98__ICCloudContext_addOperationsToFetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_508;
    v61[3] = &unk_1E64A4578;
    v61[4] = a1[5];
    id v41 = obj;
    id v62 = v41;
    id v63 = a1[6];
    long long v42 = [v40 blockOperationWithBlock:v61];
    [v42 setName:@"FetchZoneChangesCompletion"];
    objc_msgSend(v42, "ic_setResistsCancellation:", 1);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v43 = v41;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v57 objects:v76 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v45; ++j)
        {
          if (*(void *)v58 != v46) {
            objc_enumerationMutation(v43);
          }
          [v42 addDependency:*(void *)(*((void *)&v57 + 1) + 8 * j)];
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v57 objects:v76 count:16];
      }
      while (v45);
    }

    id v48 = a1[5];
    uint64_t v75 = v42;
    long long v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
    [v48 addOperations:v49];
  }
}

void __98__ICCloudContext_addOperationsToFetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v8 = [a3 allObjects];
  uint64_t v7 = [v5 operationsToFetchRecordZoneChangesForZoneIDs:v8 accountID:v6];

  [v4 addObjectsFromArray:v7];
}

void __98__ICCloudContext_addOperationsToFetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_508(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__ICCloudContext_addOperationsToFetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_2_509;
  block[3] = &unk_1E64A4578;
  id v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

void __98__ICCloudContext_addOperationsToFetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_2_509(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() errorFromOperations:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)operationsToFetchRecordZoneChangesForZoneIDs:(id)a3 accountID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v9 = [(id)objc_opt_class() objectsByDatabaseScope:v6];
    uint64_t v10 = [(ICCloudContext *)self containerForAccountID:v7];
    uint64_t v11 = [(id)objc_opt_class() userRecordNameForContainer:v10];
    id v12 = objc_alloc_init(MEMORY[0x1E4F1A218]);
    [v12 setName:@"FetchRecordZoneChanges"];
    [v12 setExpectedSendSize:1];
    [v12 setExpectedReceiveSize:0];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __73__ICCloudContext_operationsToFetchRecordZoneChangesForZoneIDs_accountID___block_invoke;
    id v23 = &unk_1E64A8708;
    id v24 = v10;
    id v25 = self;
    id v26 = v7;
    id v27 = v11;
    id v13 = v12;
    id v28 = v13;
    id v29 = v8;
    id v14 = v8;
    id v15 = v11;
    id v16 = v10;
    [v9 enumerateKeysAndObjectsUsingBlock:&v20];
    long long v17 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[ICCloudContext operationsToFetchRecordZoneChangesForZoneIDs:accountID:]();
    }

    long long v18 = objc_msgSend(v14, "copy", v20, v21, v22, v23);
  }
  else
  {
    uint64_t v9 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICCloudContext operationsToFetchRecordZoneChangesForZoneIDs:accountID:]();
    }
    long long v18 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v18;
}

void __73__ICCloudContext_operationsToFetchRecordZoneChangesForZoneIDs_accountID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a2 integerValue];
  id v24 = [*(id *)(a1 + 32) databaseWithDatabaseScope:v6];
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v25 + 1) + 8 * v12);
        id v14 = [*(id *)(a1 + 40) accountZoneIDsNeedingFetchChanges];
        objc_msgSend(v14, "ic_removeZoneID:forAccountID:", v13, *(void *)(a1 + 48));

        if (v6 == 3
          && ([v13 ownerName],
              id v15 = objc_claimAutoreleasedReturnValue(),
              int v16 = [v15 isEqualToString:*(void *)(a1 + 56)],
              v15,
              v16))
        {
          long long v17 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v19 = *(void *)(a1 + 48);
            *(_DWORD *)long long buf = 138412290;
            uint64_t v30 = v19;
            _os_log_debug_impl(&dword_1C3A61000, v17, OS_LOG_TYPE_DEBUG, "Filtered the current users zone from being fetched from the shared db in account ID %@.", buf, 0xCu);
          }
        }
        else
        {
          long long v18 = [*(id *)(a1 + 40) accountZoneIDsFetchingChanges];
          objc_msgSend(v18, "ic_addZoneID:forAccountID:", v13, *(void *)(a1 + 48));

          [v7 addObject:v13];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v10);
  }

  uint64_t v20 = *(void **)(a1 + 40);
  uint64_t v21 = (void *)[v7 copy];
  id v22 = [v20 operationToFetchRecordZoneChangesForZoneIDs:v21 database:v24];

  id v23 = [v22 group];

  if (!v23)
  {
    [v22 setGroup:*(void *)(a1 + 64)];
    objc_msgSend(*(id *)(a1 + 64), "setQuantity:", objc_msgSend(*(id *)(a1 + 64), "quantity") + 1);
  }
  [*(id *)(a1 + 72) addObject:v22];
}

- (id)operationToFetchRecordZoneChangesForZoneIDs:(id)a3 database:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v37 = a4;
  uint64_t v38 = -[ICCloudContext accountIDForDatabase:](self, "accountIDForDatabase:");
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v45;
    uint64_t v12 = *MEMORY[0x1E4F19D88];
    *(void *)&long long v9 = 138412290;
    long long v36 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v15 = objc_msgSend(v14, "zoneName", v36);
        int v16 = [v15 isEqualToString:v12];

        if (v16)
        {
          long long v17 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = v36;
            long long v50 = v38;
            _os_log_debug_impl(&dword_1C3A61000, v17, OS_LOG_TYPE_DEBUG, "Not trying to sync the default record zone in account ID %@.", buf, 0xCu);
          }
        }
        else
        {
          long long v17 = objc_alloc_init(MEMORY[0x1E4F1A060]);
          long long v18 = [(ICCloudContext *)self backgroundContext];
          uint64_t v19 = -[ICCloudContext serverChangeTokenForRecordZoneID:databaseScope:accountID:context:](self, "serverChangeTokenForRecordZoneID:databaseScope:accountID:context:", v14, [v37 databaseScope], v38, v18);
          [v17 setPreviousServerChangeToken:v19];

          uint64_t v20 = +[ICCloudConfiguration sharedConfiguration];
          -[NSObject setResultsLimit:](v17, "setResultsLimit:", [v20 resultsLimitPerSyncOperation]);

          [v7 setObject:v17 forKeyedSubscript:v14];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v10);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v21 = [(ICCloudContext *)self operationQueue];
  id v22 = [v21 operations];

  uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v48 count:16];
  id v24 = v7;
  if (!v23)
  {
LABEL_22:

LABEL_27:
    int v33 = v37;
    id v29 = [(ICCloudContext *)self newOperationToFetchRecordZoneChangesWithZoneConfigurations:v24 database:v37];
    goto LABEL_28;
  }
  uint64_t v25 = v23;
  uint64_t v26 = *(void *)v41;
LABEL_14:
  uint64_t v27 = 0;
  while (1)
  {
    if (*(void *)v41 != v26) {
      objc_enumerationMutation(v22);
    }
    long long v28 = *(void **)(*((void *)&v40 + 1) + 8 * v27);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_20;
    }
    id v29 = v28;
    uint64_t v30 = objc_opt_class();
    int v31 = [v29 configurationsByRecordZoneID];
    LOBYTE(v30) = [(id)v30 isZoneConfigurations:v24 subsetOfZoneConfigurations:v31];

    if (v30) {
      break;
    }

LABEL_20:
    if (v25 == ++v27)
    {
      uint64_t v25 = [v22 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v25) {
        goto LABEL_14;
      }
      goto LABEL_22;
    }
  }

  if (!v29) {
    goto LABEL_27;
  }
  uint64_t v32 = os_log_create("com.apple.notes", "Cloud");
  int v33 = v37;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudContext operationToFetchRecordZoneChangesForZoneIDs:database:]();
  }

LABEL_28:
  id v34 = v29;

  return v34;
}

+ (BOOL)isZoneConfigurations:(id)a3 subsetOfZoneConfigurations:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v25 = a4;
  id v5 = [v24 allKeys];
  id v6 = (void *)[v5 copy];

  id v7 = [MEMORY[0x1E4F1CA80] setWithArray:v6];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v27 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8 * v11);
      uint64_t v13 = [v25 objectForKeyedSubscript:v12];
      if (!v13) {
        goto LABEL_15;
      }
      id v14 = (void *)v13;
      id v15 = [v24 objectForKeyedSubscript:v12];
      int v16 = [v14 previousServerChangeToken];
      if (v16) {
        break;
      }
      long long v17 = [v15 previousServerChangeToken];

      if (v17) {
        goto LABEL_10;
      }
LABEL_11:
      [v7 removeObject:v12];

      if (v9 == ++v11)
      {
        uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_15;
      }
    }

LABEL_10:
    long long v18 = [v14 previousServerChangeToken];
    uint64_t v19 = [v15 previousServerChangeToken];
    char v20 = [v18 isEqual:v19];

    if ((v20 & 1) == 0)
    {

      goto LABEL_15;
    }
    goto LABEL_11;
  }
LABEL_15:

  BOOL v21 = [v7 count] == 0;
  return v21;
}

- (id)newOperationToFetchRecordZoneChangesWithZoneConfigurations:(id)a3 database:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v6 = a4;
  id v7 = [(ICCloudContext *)self accountIDForDatabase:v6];
  id v8 = objc_alloc(MEMORY[0x1E4F1A070]);
  uint64_t v9 = [v23 allKeys];
  uint64_t v10 = (void *)[v8 initWithRecordZoneIDs:v9 configurationsByRecordZoneID:v23];

  objc_msgSend(v10, "setQualityOfService:", -[ICCloudContext qualityOfService](self, "qualityOfService"));
  unint64_t v11 = [(ICCloudContext *)self discretionaryNetworkBehavior];
  uint64_t v12 = [v10 configuration];
  [v12 setDiscretionaryNetworkBehavior:v11];

  [v10 setDatabase:v6];
  objc_initWeak(&location, v10);
  [v10 setFetchAllChanges:1];
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__47;
  v41[4] = __Block_byref_object_dispose__47;
  id v42 = [(ICCloudContext *)self backgroundContext];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke;
  aBlock[3] = &unk_1E64A5A10;
  void aBlock[4] = self;
  void aBlock[5] = v41;
  uint64_t v13 = _Block_copy(aBlock);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_4;
  v38[3] = &unk_1E64A8730;
  v38[4] = self;
  objc_copyWeak(&v39, &location);
  v38[5] = v41;
  [v10 setRecordWasChangedBlock:v38];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_5;
  v36[3] = &unk_1E64A8758;
  void v36[4] = self;
  objc_copyWeak(&v37, &location);
  void v36[5] = v41;
  [v10 setRecordWithIDWasDeletedBlock:v36];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_6;
  v31[3] = &unk_1E64A8780;
  void v31[4] = self;
  objc_copyWeak(&v35, &location);
  id v14 = v7;
  id v32 = v14;
  id v34 = v41;
  id v15 = v13;
  id v33 = v15;
  [v10 setRecordZoneChangeTokensUpdatedBlock:v31];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_7;
  v27[3] = &unk_1E64A87A8;
  v27[4] = self;
  objc_copyWeak(&v30, &location);
  long long v29 = v41;
  id v16 = v15;
  id v28 = v16;
  [v10 setRecordZoneFetchCompletionBlock:v27];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  void v24[2] = __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_8;
  v24[3] = &unk_1E64A87D0;
  void v24[4] = self;
  objc_copyWeak(&v26, &location);
  id v17 = v16;
  id v25 = v17;
  [v10 setFetchRecordZoneChangesCompletionBlock:v24];
  long long v18 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = objc_msgSend(v10, "ic_loggingDescription");
    -[ICCloudContext newOperationToFetchRecordZoneChangesWithZoneConfigurations:database:]((uint64_t)v14, v19, (uint64_t)v44);
  }

  char v20 = v25;
  id v21 = v10;

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v30);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v39);

  _Block_object_dispose(v41, 8);
  objc_destroyWeak(&location);

  return v21;
}

void __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) processingQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_2;
  v7[3] = &unk_1E64A4528;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = *(void **)(*(void *)(v1 + 8) + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_3;
  v3[3] = &unk_1E64A4528;
  uint64_t v5 = v1;
  id v4 = *(id *)(a1 + 32);
  [v2 performBlockAndWait:v3];
}

uint64_t __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "ic_saveWithLogDescription:", @"%@", *(void *)(a1 + 32));
  id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 reset];
}

void __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = (id *)(a1 + 48);
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained(v8);
  [v7 fetchRecordZoneChangesOperation:WeakRetained recordWasChangedWithRecordID:v11 record:v10 error:v9 context:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = (id *)(a1 + 48);
  id v7 = a3;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [v5 fetchRecordZoneChangesOperation:WeakRetained recordWasDeletedWithRecordID:v8 recordType:v7 context:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

uint64_t __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_6(void *a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)a1[4];
  id v6 = (id *)(a1 + 8);
  id v7 = a3;
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [v5 fetchRecordZoneChangesOperation:WeakRetained zoneID:v8 accountID:a1[5] changeTokenUpdated:v7 context:*(void *)(*(void *)(a1[7] + 8) + 40)];

  id v10 = *(uint64_t (**)(void))(a1[6] + 16);
  return v10();
}

uint64_t __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_7(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9 = (void *)a1[4];
  id v10 = (id *)(a1 + 7);
  id v11 = a6;
  id v12 = a3;
  id v13 = a2;
  id WeakRetained = objc_loadWeakRetained(v10);
  [v9 fetchRecordZoneChangesOperation:WeakRetained completedFetchForZoneID:v13 serverChangeToken:v12 error:v11 context:*(void *)(*(void *)(a1[6] + 8) + 40)];

  id v15 = *(uint64_t (**)(void))(a1[5] + 16);
  return v15();
}

void __86__ICCloudContext_newOperationToFetchRecordZoneChangesWithZoneConfigurations_database___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = (id *)(a1 + 48);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [v3 fetchRecordZoneChangesOperationDidComplete:WeakRetained error:v5];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v7 = *(void **)(a1 + 32);
  id v8 = objc_loadWeakRetained(v4);
  [v7 informCloudAnalyticsDelegateForOperationDidEnd:v8 recordsByRecordID:MEMORY[0x1E4F1CC08] operationError:v5];

  id v9 = [ICParticipantUpdater alloc];
  id v11 = [*(id *)(a1 + 32) backgroundContext];
  id v10 = [(ICParticipantUpdater *)v9 initWithManagedObjectContext:v11];
  [(ICParticipantUpdater *)v10 updateWithCompletion:0];
}

- (void)fetchRecordZoneChangesOperation:(id)a3 completedFetchForZoneID:(id)a4 serverChangeToken:(id)a5 error:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(ICCloudContext *)self processingQueue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __106__ICCloudContext_fetchRecordZoneChangesOperation_completedFetchForZoneID_serverChangeToken_error_context___block_invoke;
  v23[3] = &unk_1E64A8250;
  v23[4] = self;
  id v24 = v12;
  id v25 = v15;
  id v26 = v13;
  id v27 = v14;
  id v28 = v16;
  id v18 = v16;
  id v19 = v14;
  id v20 = v13;
  id v21 = v15;
  id v22 = v12;
  dispatch_async(v17, v23);
}

void __106__ICCloudContext_fetchRecordZoneChangesOperation_completedFetchForZoneID_serverChangeToken_error_context___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) database];
  id v4 = [v2 accountIDForDatabase:v3];

  if (*(void *)(a1 + 48))
  {
    id v5 = [*(id *)(a1 + 32) backgroundContext];
    uint64_t v6 = [*(id *)(a1 + 48) code];
    switch(v6)
    {
      case 20:
        goto LABEL_10;
      case 21:
        id v7 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = objc_msgSend(*(id *)(a1 + 56), "ic_loggingDescription");
          id v9 = objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
          *(_DWORD *)long long buf = 138412802;
          id v42 = v8;
          __int16 v43 = 2112;
          long long v44 = v9;
          __int16 v45 = 2112;
          long long v46 = v4;
          _os_log_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_DEFAULT, "Server change token expired for zone %@ %@ in account ID %@", buf, 0x20u);
        }
        uint64_t v10 = *(void *)(a1 + 56);
        id v11 = *(void **)(a1 + 32);
        id v12 = [*(id *)(a1 + 40) database];
        objc_msgSend(v11, "deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:context:", v10, objc_msgSend(v12, "databaseScope"), v4, v5);

        goto LABEL_16;
      case 22:
      case 23:
      case 24:
      case 25:
      case 27:
        goto LABEL_13;
      case 26:
        [*(id *)(a1 + 32) receivedZoneNotFound:*(void *)(a1 + 56) operation:*(void *)(a1 + 40) context:v5];
        goto LABEL_22;
      case 28:
        id v19 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = objc_msgSend(*(id *)(a1 + 56), "ic_loggingDescription");
          id v21 = objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
          *(_DWORD *)long long buf = 138412802;
          id v42 = v20;
          __int16 v43 = 2112;
          long long v44 = v21;
          __int16 v45 = 2112;
          long long v46 = v4;
          _os_log_impl(&dword_1C3A61000, v19, OS_LOG_TYPE_DEFAULT, "User deleted zone %@ %@ in account ID %@", buf, 0x20u);
        }
        uint64_t v22 = *(void *)(a1 + 56);
        id v23 = *(void **)(a1 + 32);
        id v24 = [*(id *)(a1 + 40) database];
        objc_msgSend(v23, "deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:context:", v22, objc_msgSend(v24, "databaseScope"), v4, v5);

        os_log_t v13 = [*(id *)(a1 + 32) cloudContextDelegate];
        [v13 cloudContext:*(void *)(a1 + 32) userDidDeleteRecordZoneWithID:*(void *)(a1 + 56) accountID:v4];
        goto LABEL_21;
      default:
        if (v6 == 3)
        {
LABEL_10:
          os_log_t v13 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            id v14 = objc_msgSend(*(id *)(a1 + 56), "ic_loggingDescription");
            id v15 = objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
            id v16 = *(void **)(a1 + 48);
            *(_DWORD *)long long buf = 138413058;
            id v42 = v14;
            __int16 v43 = 2112;
            long long v44 = v15;
            __int16 v45 = 2112;
            long long v46 = v4;
            __int16 v47 = 2112;
            id v48 = v16;
            _os_log_impl(&dword_1C3A61000, v13, OS_LOG_TYPE_DEFAULT, "Non-fatal error fetching zone changes for zone %@ %@  in account ID %@: %@", buf, 0x2Au);
          }
LABEL_21:

          goto LABEL_22;
        }
LABEL_13:
        id v17 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          long long v36 = objc_msgSend(*(id *)(a1 + 56), "ic_loggingDescription");
          id v37 = objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
          uint64_t v38 = *(void **)(a1 + 48);
          *(_DWORD *)long long buf = 138413058;
          id v42 = v36;
          __int16 v43 = 2112;
          long long v44 = v37;
          __int16 v45 = 2112;
          long long v46 = v4;
          __int16 v47 = 2112;
          id v48 = v38;
          _os_log_error_impl(&dword_1C3A61000, v17, OS_LOG_TYPE_ERROR, "Error fetching zone changes %@ %@ in account ID %@: %@", buf, 0x2Au);
        }
LABEL_16:
        int v18 = 1;
        break;
    }
  }
  else
  {
    id v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v33 = objc_msgSend(*(id *)(a1 + 56), "ic_loggingDescription");
      id v34 = objc_msgSend(*(id *)(a1 + 64), "ic_loggingDescription");
      id v35 = objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
      *(_DWORD *)long long buf = 138413058;
      id v42 = v33;
      __int16 v43 = 2112;
      long long v44 = v34;
      __int16 v45 = 2112;
      long long v46 = v35;
      __int16 v47 = 2112;
      id v48 = v4;
      _os_log_debug_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_DEBUG, "Fetched changes for record zone %@ %@ %@ in account ID %@", buf, 0x2Au);
    }
LABEL_22:
    int v18 = 0;
  }

  id v25 = [*(id *)(a1 + 32) accountZoneIDsFetchingChanges];
  objc_msgSend(v25, "ic_removeZoneID:forAccountID:", *(void *)(a1 + 56), v4);

  if (v18)
  {
    id v26 = [*(id *)(a1 + 56) zoneName];
    char v27 = [v26 isEqualToString:*MEMORY[0x1E4F19D88]];

    if ((v27 & 1) == 0)
    {
      id v28 = [*(id *)(a1 + 32) accountZoneIDsNeedingFetchChanges];
      objc_msgSend(v28, "ic_addZoneID:forAccountID:", *(void *)(a1 + 56), v4);

      [*(id *)(a1 + 32) startRetryTimerIfNecessaryWithError:*(void *)(a1 + 48)];
    }
  }
  [*(id *)(a1 + 32) saveZoneFetchState];
  uint64_t v29 = *(void *)(a1 + 64);
  if (v29)
  {
    uint64_t v30 = *(void *)(a1 + 56);
    uint64_t v31 = *(void **)(a1 + 32);
    id v32 = [*(id *)(a1 + 40) database];
    objc_msgSend(v31, "saveServerChangeToken:forRecordZoneID:databaseScope:accountID:context:", v29, v30, objc_msgSend(v32, "databaseScope"), v4, *(void *)(a1 + 72));
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__ICCloudContext_fetchRecordZoneChangesOperation_completedFetchForZoneID_serverChangeToken_error_context___block_invoke_531;
  block[3] = &unk_1E64A4240;
  id v40 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __106__ICCloudContext_fetchRecordZoneChangesOperation_completedFetchForZoneID_serverChangeToken_error_context___block_invoke_531(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ICCloudContextFetchRecordChangeOperationDidFinishNotification" object:*(void *)(a1 + 32)];
}

- (void)fetchRecordZoneChangesOperationDidComplete:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ICCloudContext *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__ICCloudContext_fetchRecordZoneChangesOperationDidComplete_error___block_invoke;
  block[3] = &unk_1E64A4500;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __67__ICCloudContext_fetchRecordZoneChangesOperationDidComplete_error___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 40;
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) database];
  id v5 = [v3 accountIDForDatabase:v4];

  id v6 = *(void **)(v2 + 8);
  if (!v6)
  {
    id v9 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __67__ICCloudContext_fetchRecordZoneChangesOperationDidComplete_error___block_invoke_cold_1();
    }
    goto LABEL_14;
  }
  uint64_t v7 = [v6 code];
  if (v7 == 20 || v7 == 3)
  {
    id v9 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
      uint64_t v11 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138412802;
      uint64_t v29 = v5;
      __int16 v30 = 2112;
      uint64_t v31 = v10;
      __int16 v32 = 2112;
      uint64_t v33 = v11;
      _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_DEFAULT, "Non-fatal error fetching zone changes in account ID %@: %@: %@", buf, 0x20u);
    }
    goto LABEL_14;
  }
  if (v7 == 2)
  {
    id v9 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __67__ICCloudContext_fetchRecordZoneChangesOperationDidComplete_error___block_invoke_cold_2();
    }
LABEL_14:
    int v12 = 0;
    goto LABEL_15;
  }
  id v9 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v21 = objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
    uint64_t v22 = *(void *)(a1 + 48);
    *(_DWORD *)long long buf = 138412802;
    uint64_t v29 = v5;
    __int16 v30 = 2112;
    uint64_t v31 = v21;
    __int16 v32 = 2112;
    uint64_t v33 = v22;
    _os_log_error_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_ERROR, "Error fetching zone changes in account ID %@: %@: %@", buf, 0x20u);
  }
  int v12 = 1;
LABEL_15:

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = objc_msgSend(*(id *)v2, "recordZoneIDs", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * v17);
        id v19 = [*(id *)(a1 + 32) accountZoneIDsFetchingChanges];
        objc_msgSend(v19, "ic_removeZoneID:forAccountID:", v18, v5);

        if (v12)
        {
          id v20 = [*(id *)(a1 + 32) accountZoneIDsNeedingFetchChanges];
          objc_msgSend(v20, "ic_addZoneID:forAccountID:", v18, v5);
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }

  [*(id *)(a1 + 32) saveZoneFetchState];
  if (v12) {
    [*(id *)(a1 + 32) startRetryTimerIfNecessaryWithError:*(void *)(a1 + 48)];
  }
}

- (void)fetchRecordZoneChangesOperation:(id)a3 recordWasChangedWithRecordID:(id)a4 record:(id)a5 error:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [(ICCloudContext *)self processingQueue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __100__ICCloudContext_fetchRecordZoneChangesOperation_recordWasChangedWithRecordID_record_error_context___block_invoke;
  v23[3] = &unk_1E64A8250;
  v23[4] = self;
  id v24 = v12;
  id v25 = v14;
  id v26 = v16;
  id v27 = v13;
  id v28 = v15;
  id v18 = v15;
  id v19 = v13;
  id v20 = v16;
  id v21 = v14;
  id v22 = v12;
  dispatch_async(v17, v23);
}

void __100__ICCloudContext_fetchRecordZoneChangesOperation_recordWasChangedWithRecordID_record_error_context___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) database];
  id v4 = [v2 accountIDForDatabase:v3];

  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = os_log_create("com.apple.notes", "Cloud");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
    {
      id v8 = objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
      id v9 = objc_msgSend(*(id *)(a1 + 40), "ic_shortLoggingDescription");
      int v13 = 138412802;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_debug_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_DEBUG, "Record changed for account ID %@: %@ %@", (uint8_t *)&v13, 0x20u);
    }
    [*(id *)(a1 + 32) _ingestCloudKitRecord:*(void *)(a1 + 48) forAccountID:v4 forceMerge:0 context:*(void *)(a1 + 56)];
  }
  else
  {
    if (v7)
    {
      id v10 = objc_msgSend(*(id *)(a1 + 64), "ic_loggingDescription");
      uint64_t v11 = *(void **)(a1 + 72);
      id v12 = objc_msgSend(*(id *)(a1 + 40), "ic_shortLoggingDescription");
      int v13 = 138413058;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_debug_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_DEBUG, "Error fetching record for account ID %@: %@ %@ %@", (uint8_t *)&v13, 0x2Au);
    }
  }
}

- (void)fetchRecordZoneChangesOperation:(id)a3 recordWasDeletedWithRecordID:(id)a4 recordType:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(ICCloudContext *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__ICCloudContext_fetchRecordZoneChangesOperation_recordWasDeletedWithRecordID_recordType_context___block_invoke;
  block[3] = &unk_1E64A8278;
  id v20 = v13;
  uint64_t v21 = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  dispatch_async(v14, block);
}

void __98__ICCloudContext_fetchRecordZoneChangesOperation_recordWasDeletedWithRecordID_recordType_context___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __98__ICCloudContext_fetchRecordZoneChangesOperation_recordWasDeletedWithRecordID_recordType_context___block_invoke_2;
  v4[3] = &unk_1E64A8278;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  id v5 = v3;
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 64);
  [v2 performBlockAndWait:v4];
}

void __98__ICCloudContext_fetchRecordZoneChangesOperation_recordWasDeletedWithRecordID_recordType_context___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) database];
  id v4 = [v2 accountIDForDatabase:v3];

  if (+[ICUserSpecificRecordIDParser isUserSpecificRecordID:*(void *)(a1 + 48)])
  {
    id v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v11 = objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
      id v12 = objc_msgSend(*(id *)(a1 + 40), "ic_shortLoggingDescription");
      int v15 = 138412802;
      id v16 = v4;
      __int16 v17 = 2112;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_debug_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_DEBUG, "User-specific record was deleted in account ID %@: %@ %@", (uint8_t *)&v15, 0x20u);
    }
    id v6 = [*(id *)(a1 + 32) existingCloudObjectForUserSpecificRecordID:*(void *)(a1 + 48) createPlaceholderIfNecessary:0 accountID:v4 context:*(void *)(a1 + 56)];
    [v6 didDeleteUserSpecificRecordID:*(void *)(a1 + 48)];
  }
  else
  {
    int v7 = [*(id *)(a1 + 64) isEqualToString:*MEMORY[0x1E4F19D78]];
    id v8 = os_log_create("com.apple.notes", "Cloud");
    id v6 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
        id v10 = objc_msgSend(*(id *)(a1 + 40), "ic_shortLoggingDescription");
        int v15 = 138412802;
        id v16 = v4;
        __int16 v17 = 2112;
        id v18 = v9;
        __int16 v19 = 2112;
        id v20 = v10;
        _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_INFO, "Share was deleted in account ID %@: %@ %@", (uint8_t *)&v15, 0x20u);
      }
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v13 = objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
        id v14 = objc_msgSend(*(id *)(a1 + 40), "ic_shortLoggingDescription");
        int v15 = 138412802;
        id v16 = v4;
        __int16 v17 = 2112;
        id v18 = v13;
        __int16 v19 = 2112;
        id v20 = v14;
        _os_log_debug_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_DEBUG, "Record was deleted in account ID %@: %@ %@", (uint8_t *)&v15, 0x20u);
      }
      id v6 = [*(id *)(a1 + 32) existingCloudObjectForRecordID:*(void *)(a1 + 48) recordType:*(void *)(a1 + 64) accountID:v4 context:*(void *)(a1 + 56)];
      [v6 objectWasDeletedFromCloudByAnotherDevice];
    }
  }
}

- (void)fetchRecordZoneChangesOperation:(id)a3 zoneID:(id)a4 accountID:(id)a5 changeTokenUpdated:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  __int16 v17 = [(ICCloudContext *)self processingQueue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __94__ICCloudContext_fetchRecordZoneChangesOperation_zoneID_accountID_changeTokenUpdated_context___block_invoke;
  v23[3] = &unk_1E64A8250;
  id v24 = v13;
  id v25 = v15;
  id v26 = v12;
  id v27 = self;
  id v28 = v14;
  id v29 = v16;
  id v18 = v16;
  id v19 = v14;
  id v20 = v12;
  id v21 = v15;
  id v22 = v13;
  dispatch_async(v17, v23);
}

void __94__ICCloudContext_fetchRecordZoneChangesOperation_zoneID_accountID_changeTokenUpdated_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __94__ICCloudContext_fetchRecordZoneChangesOperation_zoneID_accountID_changeTokenUpdated_context___block_invoke_cold_1();
  }

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 56);
  id v6 = [*(id *)(a1 + 48) database];
  objc_msgSend(v5, "saveServerChangeToken:forRecordZoneID:databaseScope:accountID:context:", v3, v4, objc_msgSend(v6, "databaseScope"), *(void *)(a1 + 64), *(void *)(a1 + 72));
}

- (void)fetchDatabaseChangesWithReason:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  id v9 = [(ICCloudContext *)self containersByAccountID];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__ICCloudContext_fetchDatabaseChangesWithReason_completionHandler___block_invoke;
  v12[3] = &unk_1E64A87F8;
  id v13 = v8;
  id v10 = v8;
  [v9 enumerateKeysAndObjectsUsingBlock:v12];

  id v11 = (void *)[v10 copy];
  [(ICCloudContext *)self fetchDatabaseChangesForDatabases:v11 reason:v7 completionHandler:v6];
}

void __67__ICCloudContext_fetchDatabaseChangesWithReason_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __67__ICCloudContext_fetchDatabaseChangesWithReason_completionHandler___block_invoke_cold_1();
  }

  id v8 = *(void **)(a1 + 32);
  id v9 = [v6 privateCloudDatabase];
  [v8 addObject:v9];

  id v10 = *(void **)(a1 + 32);
  id v11 = [v6 sharedCloudDatabase];

  [v10 addObject:v11];
}

- (void)fetchDatabaseChangesForDatabases:(id)a3 reason:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [MEMORY[0x1E4F837E8] postFetchDatabaseChangesTelemetryWithReason:v9];
  id v11 = [(ICCloudContext *)self processingQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__ICCloudContext_fetchDatabaseChangesForDatabases_reason_completionHandler___block_invoke;
  v15[3] = &unk_1E64A4F48;
  id v16 = v9;
  id v17 = v8;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __76__ICCloudContext_fetchDatabaseChangesForDatabases_reason_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v20 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  uint64_t v21 = a1;
  if ([*(id *)(a1 + 32) length])
  {
    uint64_t v2 = [@"FetchDatabaseChanges" stringByAppendingFormat:@"-%@", *(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v2 = @"FetchDatabaseChanges";
  }
  id v19 = v2;
  objc_msgSend(v20, "setName:");
  objc_msgSend(v20, "setQuantity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  [v20 setExpectedSendSize:1];
  [v20 setExpectedReceiveSize:1];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__47;
  void v34[4] = __Block_byref_object_dispose__47;
  id v35 = [MEMORY[0x1E4F1CA48] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        id v9 = *(void **)(a1 + 48);
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __76__ICCloudContext_fetchDatabaseChangesForDatabases_reason_completionHandler___block_invoke_2;
        v29[3] = &unk_1E64A8820;
        v29[4] = v9;
        void v29[5] = v34;
        id v10 = [v9 operationToFetchDatabaseChangesForDatabase:v8 completionHandler:v29];
        [v10 setGroup:v20];
        [v3 addObject:v10];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v37 count:16];
    }
    while (v5);
  }

  id v11 = *(void **)(a1 + 56);
  if (v11)
  {
    id v12 = (void *)MEMORY[0x1E4F28B48];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __76__ICCloudContext_fetchDatabaseChangesForDatabases_reason_completionHandler___block_invoke_4;
    v26[3] = &unk_1E64A7F88;
    v26[4] = *(void *)(a1 + 48);
    id v28 = v34;
    id v27 = v11;
    id v13 = [v12 blockOperationWithBlock:v26];
    [v13 setName:@"FetchDatabaseChangesCompletion"];
    objc_msgSend(v13, "ic_setResistsCancellation:", 1);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v14 = v3;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v14);
          }
          [v13 addDependency:*(void *)(*((void *)&v22 + 1) + 8 * j)];
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v36 count:16];
      }
      while (v15);
    }

    [v14 addObject:v13];
  }
  id v18 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v20, "ic_loggingDescription");
    objc_claimAutoreleasedReturnValue();
    __76__ICCloudContext_fetchDatabaseChangesForDatabases_reason_completionHandler___block_invoke_cold_1();
  }

  [*(id *)(v21 + 48) addOperations:v3];
  _Block_object_dispose(v34, 8);
}

void __76__ICCloudContext_fetchDatabaseChangesForDatabases_reason_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) processingQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __76__ICCloudContext_fetchDatabaseChangesForDatabases_reason_completionHandler___block_invoke_3;
    v5[3] = &unk_1E64A4528;
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __76__ICCloudContext_fetchDatabaseChangesForDatabases_reason_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:*(void *)(a1 + 32)];
}

void __76__ICCloudContext_fetchDatabaseChangesForDatabases_reason_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__ICCloudContext_fetchDatabaseChangesForDatabases_reason_completionHandler___block_invoke_5;
  block[3] = &unk_1E64A7F88;
  void block[4] = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  dispatch_async(v2, block);
}

void __76__ICCloudContext_fetchDatabaseChangesForDatabases_reason_completionHandler___block_invoke_5(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() errorFromErrors:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)operationToFetchDatabaseChangesForDatabase:(id)a3 completionHandler:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v35 = v6;
  uint64_t v8 = [(ICCloudContext *)self accountIDForDatabase:v6];
  id v9 = [(ICCloudContext *)self backgroundContext];
  uint64_t v34 = [(ICCloudContext *)self serverChangeTokenForChangedZonesInDatabase:v6 accountID:v8 context:v9];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1A038]) initWithPreviousServerChangeToken:v34];
  objc_msgSend(v10, "setQualityOfService:", -[ICCloudContext qualityOfService](self, "qualityOfService"));
  unint64_t v11 = [(ICCloudContext *)self discretionaryNetworkBehavior];
  long long v36 = v10;
  id v12 = [v10 configuration];
  [v12 setDiscretionaryNetworkBehavior:v11];

  [v36 setDatabase:v35];
  [v36 setFetchAllChanges:1];
  objc_initWeak(&location, v36);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __79__ICCloudContext_operationToFetchDatabaseChangesForDatabase_completionHandler___block_invoke;
  v53[3] = &unk_1E64A8848;
  v53[4] = self;
  objc_copyWeak(&v55, &location);
  id v13 = v8;
  id v54 = v13;
  [v36 setRecordZoneWithIDChangedBlock:v53];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __79__ICCloudContext_operationToFetchDatabaseChangesForDatabase_completionHandler___block_invoke_2;
  v50[3] = &unk_1E64A8848;
  v50[4] = self;
  objc_copyWeak(&v52, &location);
  id v14 = v13;
  id v51 = v14;
  [v36 setRecordZoneWithIDWasDeletedBlock:v50];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __79__ICCloudContext_operationToFetchDatabaseChangesForDatabase_completionHandler___block_invoke_3;
  v46[3] = &unk_1E64A8870;
  void v46[4] = self;
  objc_copyWeak(&v49, &location);
  id v15 = v14;
  id v47 = v15;
  id v16 = v9;
  id v48 = v16;
  [v36 setChangeTokenUpdatedBlock:v46];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __79__ICCloudContext_operationToFetchDatabaseChangesForDatabase_completionHandler___block_invoke_4;
  v41[3] = &unk_1E64A8898;
  v41[4] = self;
  objc_copyWeak(&v45, &location);
  id v33 = v15;
  id v42 = v33;
  id v31 = v7;
  id v44 = v31;
  id v32 = v16;
  id v43 = v32;
  [v36 setFetchDatabaseChangesCompletionBlock:v41];
  id v17 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    id v18 = objc_msgSend(v36, "ic_loggingDescription");
    -[ICCloudContext operationToFetchDatabaseChangesForDatabase:completionHandler:]((uint64_t)v33, v18, (uint64_t)v62);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v19 = [(ICCloudContext *)self operationQueue];
  id v20 = [v19 operations];

  uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v61 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v38;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v38 != v22) {
          objc_enumerationMutation(v20);
        }
        long long v24 = *(void **)(*((void *)&v37 + 1) + 8 * v23);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v25 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v36, "ic_loggingDescription");
            id v26 = (id)objc_claimAutoreleasedReturnValue();
            id v27 = objc_msgSend(v24, "ic_loggingDescription");
            *(_DWORD *)long long buf = 138412546;
            id v58 = v26;
            __int16 v59 = 2112;
            long long v60 = v27;
            _os_log_debug_impl(&dword_1C3A61000, v25, OS_LOG_TYPE_DEBUG, "Database changes operation %@ will wait for %@", buf, 0x16u);
          }
          [v36 addDependency:v24];
        }
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v61 count:16];
    }
    while (v21);
  }

  id v28 = v43;
  id v29 = v36;

  objc_destroyWeak(&v45);
  objc_destroyWeak(&v49);

  objc_destroyWeak(&v52);
  objc_destroyWeak(&v55);

  objc_destroyWeak(&location);
  return v29;
}

void __79__ICCloudContext_operationToFetchDatabaseChangesForDatabase_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  long long v4 = (id *)(a1 + 48);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [v3 fetchDatabaseChangesOperation:WeakRetained recordZoneWithIDChanged:v5 accountID:*(void *)(a1 + 40)];
}

void __79__ICCloudContext_operationToFetchDatabaseChangesForDatabase_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  long long v4 = (id *)(a1 + 48);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [v3 fetchDatabaseChangesOperation:WeakRetained recordZoneWithIDWasDeleted:v5 accountID:*(void *)(a1 + 40)];
}

void __79__ICCloudContext_operationToFetchDatabaseChangesForDatabase_completionHandler___block_invoke_3(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  long long v4 = (id *)(a1 + 7);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [v3 fetchDatabaseChangesOperation:WeakRetained changeTokenUpdated:v5 accountID:a1[5] context:a1[6]];
}

void __79__ICCloudContext_operationToFetchDatabaseChangesForDatabase_completionHandler___block_invoke_4(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = (void *)a1[4];
  id v7 = (id *)(a1 + 8);
  id v8 = a4;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  [v6 fetchDatabaseChangesOperation:WeakRetained finishedWithServerChangeToken:v9 accountID:a1[5] error:v8 completionHandler:a1[7] context:a1[6]];

  unint64_t v11 = (void *)a1[4];
  id v12 = objc_loadWeakRetained(v7);
  [v11 informCloudAnalyticsDelegateForOperationDidEnd:v12 recordsByRecordID:MEMORY[0x1E4F1CC08] operationError:v8];
}

- (void)fetchDatabaseChangesOperation:(id)a3 recordZoneWithIDChanged:(id)a4 accountID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(ICCloudContext *)self processingQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__ICCloudContext_fetchDatabaseChangesOperation_recordZoneWithIDChanged_accountID___block_invoke;
  v15[3] = &unk_1E64A5260;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  id v19 = self;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(v11, v15);
}

void __82__ICCloudContext_fetchDatabaseChangesOperation_recordZoneWithIDChanged_accountID___block_invoke(uint64_t a1)
{
  id v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __82__ICCloudContext_fetchDatabaseChangesOperation_recordZoneWithIDChanged_accountID___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 40) zoneName];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F19D88]];

  if ((v4 & 1) == 0)
  {
    id v5 = [*(id *)(a1 + 56) accountZoneIDsNeedingFetchChanges];
    objc_msgSend(v5, "ic_addZoneID:forAccountID:", *(void *)(a1 + 40), *(void *)(a1 + 32));

    [*(id *)(a1 + 56) saveZoneFetchState];
  }
}

- (void)fetchDatabaseChangesOperation:(id)a3 recordZoneWithIDWasDeleted:(id)a4 accountID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(ICCloudContext *)self processingQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__ICCloudContext_fetchDatabaseChangesOperation_recordZoneWithIDWasDeleted_accountID___block_invoke;
  v15[3] = &unk_1E64A5260;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  id v19 = self;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(v11, v15);
}

void __85__ICCloudContext_fetchDatabaseChangesOperation_recordZoneWithIDWasDeleted_accountID___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __85__ICCloudContext_fetchDatabaseChangesOperation_recordZoneWithIDWasDeleted_accountID___block_invoke_cold_1();
  }

  id v3 = [*(id *)(a1 + 48) database];
  if ([v3 databaseScope] == 3)
  {
    char v4 = [*(id *)(a1 + 40) ownerName];
    int v5 = [v4 isEqualToString:*MEMORY[0x1E4F19C08]];

    if (v5)
    {
      id v6 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
        id v8 = objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
        int v18 = 138412546;
        id v19 = v7;
        __int16 v20 = 2112;
        uint64_t v21 = v8;
        _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_DEFAULT, "Callback for operation in shared database says private zone was deleted %@: %@", (uint8_t *)&v18, 0x16u);
      }
      [MEMORY[0x1E4F837E8] postBasicEvent:11];
      return;
    }
  }
  else
  {
  }
  if (objc_msgSend(*(id *)(a1 + 40), "ic_isOwnedByCurrentUser"))
  {
    id v9 = [*(id *)(a1 + 40) zoneName];
    char v10 = [v9 isEqualToString:*MEMORY[0x1E4F19D88]];

    if ((v10 & 1) == 0)
    {
      unint64_t v11 = [*(id *)(a1 + 56) accountZoneIDsNeedingFetchChanges];
      objc_msgSend(v11, "ic_addZoneID:forAccountID:", *(void *)(a1 + 40), *(void *)(a1 + 32));

      [*(id *)(a1 + 56) saveZoneFetchState];
    }
  }
  else
  {
    id v12 = [*(id *)(a1 + 56) cloudContextDelegate];
    [v12 cloudContext:*(void *)(a1 + 56) sharedZoneWasDeleted:*(void *)(a1 + 40) accountID:*(void *)(a1 + 32)];

    id v13 = [*(id *)(a1 + 56) accountZoneIDsNeedingFetchChanges];
    objc_msgSend(v13, "ic_removeZoneID:forAccountID:", *(void *)(a1 + 40), *(void *)(a1 + 32));

    [*(id *)(a1 + 56) saveZoneFetchState];
    id v14 = [*(id *)(a1 + 56) backgroundContext];
    id v15 = *(void **)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 40);
    id v17 = [*(id *)(a1 + 48) database];
    objc_msgSend(v15, "deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:context:", v16, objc_msgSend(v17, "databaseScope"), *(void *)(a1 + 32), v14);
  }
}

- (void)fetchDatabaseChangesOperation:(id)a3 changeTokenUpdated:(id)a4 accountID:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(ICCloudContext *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__ICCloudContext_fetchDatabaseChangesOperation_changeTokenUpdated_accountID_context___block_invoke;
  block[3] = &unk_1E64A8278;
  id v20 = v12;
  id v21 = v11;
  id v22 = v10;
  uint64_t v23 = self;
  id v24 = v13;
  id v15 = v13;
  id v16 = v10;
  id v17 = v11;
  id v18 = v12;
  dispatch_async(v14, block);
}

void __85__ICCloudContext_fetchDatabaseChangesOperation_changeTokenUpdated_accountID_context___block_invoke(uint64_t a1)
{
  id v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __85__ICCloudContext_fetchDatabaseChangesOperation_changeTokenUpdated_accountID_context___block_invoke_cold_1();
  }

  id v3 = *(void **)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = [*(id *)(a1 + 48) database];
  objc_msgSend(v3, "saveServerChangeToken:forRecordZoneID:databaseScope:accountID:context:", v4, 0, objc_msgSend(v5, "databaseScope"), *(void *)(a1 + 32), *(void *)(a1 + 64));
}

- (void)fetchDatabaseChangesOperation:(id)a3 finishedWithServerChangeToken:(id)a4 accountID:(id)a5 error:(id)a6 completionHandler:(id)a7 context:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = [(ICCloudContext *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __120__ICCloudContext_fetchDatabaseChangesOperation_finishedWithServerChangeToken_accountID_error_completionHandler_context___block_invoke;
  block[3] = &unk_1E64A88C0;
  id v28 = v17;
  id v29 = v16;
  id v30 = v14;
  id v31 = v15;
  id v32 = self;
  id v33 = v19;
  id v34 = v18;
  id v21 = v18;
  id v22 = v19;
  id v23 = v15;
  id v24 = v14;
  id v25 = v16;
  id v26 = v17;
  dispatch_async(v20, block);
}

uint64_t __120__ICCloudContext_fetchDatabaseChangesOperation_finishedWithServerChangeToken_accountID_error_completionHandler_context___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = (id *)(a1 + 32);
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if ([v2 code] == 21)
    {
      uint64_t v4 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v5 = *(void **)(a1 + 40);
        id v6 = objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
        int v25 = 138412546;
        id v26 = v5;
        __int16 v27 = 2112;
        id v28 = v6;
        _os_log_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_INFO, "Database changes server change token expired for account %@, %@", (uint8_t *)&v25, 0x16u);
      }
      id v7 = *(void **)(a1 + 64);
      id v8 = [*(id *)(a1 + 48) database];
      [v7 deleteServerChangeTokenForChangedZonesInDatabase:v8 accountID:*(void *)(a1 + 40) context:*(void *)(a1 + 72)];

LABEL_6:
      [*(id *)(a1 + 64) startRetryTimerIfNecessaryWithError:*(void *)(a1 + 32)];
      goto LABEL_19;
    }
    if ([*v3 code] == 20)
    {
      id v13 = os_log_create("com.apple.notes", "Cloud");
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
LABEL_18:

        goto LABEL_19;
      }
      id v14 = *(void **)(a1 + 40);
      id v15 = objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
      int v25 = 138412546;
      id v26 = v14;
      __int16 v27 = 2112;
      id v28 = v15;
      id v16 = "Operation to fetch database changes was cancelled for account %@, %@";
    }
    else
    {
      uint64_t v17 = [*v3 code];
      id v18 = os_log_create("com.apple.notes", "Cloud");
      id v13 = v18;
      if (v17 != 3)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          __120__ICCloudContext_fetchDatabaseChangesOperation_finishedWithServerChangeToken_accountID_error_completionHandler_context___block_invoke_cold_2();
        }

        goto LABEL_6;
      }
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
        goto LABEL_18;
      }
      id v19 = *(void **)(a1 + 40);
      id v15 = objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
      int v25 = 138412546;
      id v26 = v19;
      __int16 v27 = 2112;
      id v28 = v15;
      id v16 = "Operation to fetch database changes failed with no network connection for account %@, %@";
    }
    _os_log_impl(&dword_1C3A61000, v13, OS_LOG_TYPE_INFO, v16, (uint8_t *)&v25, 0x16u);

    goto LABEL_18;
  }
  id v9 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __120__ICCloudContext_fetchDatabaseChangesOperation_finishedWithServerChangeToken_accountID_error_completionHandler_context___block_invoke_cold_1(a1);
  }

  uint64_t v10 = *(void *)(a1 + 56);
  if (v10)
  {
    id v11 = *(void **)(a1 + 64);
    id v12 = [*(id *)(a1 + 48) database];
    [v11 saveServerChangeToken:v10 forChangedZonesInDatabase:v12 accountID:*(void *)(a1 + 40) context:*(void *)(a1 + 72)];
  }
LABEL_19:
  if (*v3)
  {
    id v20 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
      int v25 = 138412290;
      id v26 = v21;
      _os_log_impl(&dword_1C3A61000, v20, OS_LOG_TYPE_INFO, "Error fetching database changes, canceling dependent operations: %@", (uint8_t *)&v25, 0xCu);
    }
    id v22 = [*(id *)(a1 + 64) operationQueue];
    id v23 = (id)[v22 iterativelyCancelDependentOperations:*(void *)(a1 + 48)];
  }
  uint64_t result = *(void *)(a1 + 80);
  if (result) {
    return (*(uint64_t (**)(uint64_t, id))(result + 16))(result, *v3);
  }
  return result;
}

void __36__ICCloudContext_loadZoneFetchState__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [(id)objc_opt_class() zoneIDsFromZoneInfos:v5];

  id v7 = (void *)[v6 mutableCopy];
  if ([v7 count])
  {
    id v8 = [*(id *)(a1 + 32) accountZoneIDsNeedingFetchChanges];
    [v8 setObject:v7 forKeyedSubscript:v9];
  }
}

- (void)saveZoneFetchState
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, v0, v1, "Saving zone fetch state: zonesNeedingFetchChanges=%@", v2);
}

void __36__ICCloudContext_saveZoneFetchState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [(id)objc_opt_class() zoneInfosFromZoneIDs:v5];

  if ([v6 count]) {
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v7];
  }
}

void __36__ICCloudContext_saveZoneFetchState__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = [(id)objc_opt_class() zoneInfosFromZoneIDs:v5];

  if ([v6 count])
  {
    id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v10];
    id v8 = v7;
    if (v7)
    {
      id v9 = [v7 arrayByAddingObjectsFromArray:v7];
      [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v10];
    }
    else
    {
      [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v10];
    }
  }
}

- (void)clearZoneFetchState
{
  uint64_t v3 = [(ICCloudContext *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__ICCloudContext_clearZoneFetchState__block_invoke;
  block[3] = &unk_1E64A4240;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __37__ICCloudContext_clearZoneFetchState__block_invoke(uint64_t a1)
{
  id v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __37__ICCloudContext_clearZoneFetchState__block_invoke_cold_1();
  }

  uint64_t v3 = [*(id *)(a1 + 32) accountZoneIDsNeedingFetchChanges];
  [v3 removeAllObjects];

  uint64_t v4 = [*(id *)(a1 + 32) accountZoneIDsFetchingChanges];
  [v4 removeAllObjects];

  return [*(id *)(a1 + 32) saveZoneFetchState];
}

+ (id)zoneInfosFromZoneIDs:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
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
    uint64_t v8 = *MEMORY[0x1E4F19C08];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v11 = [MEMORY[0x1E4F1CA60] dictionary];
        id v12 = [v10 zoneName];
        [v11 setObject:v12 forKeyedSubscript:@"ZoneName"];

        id v13 = [v10 ownerName];
        char v14 = [v13 isEqualToString:v8];

        if ((v14 & 1) == 0)
        {
          id v15 = [v10 ownerName];
          [v11 setObject:v15 forKeyedSubscript:@"OwnerName"];
        }
        [v4 addObject:v11];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (id)zoneIDsFromZoneInfos:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    char v14 = (void *)*MEMORY[0x1E4F19C08];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "objectForKeyedSubscript:", @"ZoneName", v14);
        id v11 = [v9 objectForKeyedSubscript:@"OwnerName"];
        if (!v11) {
          id v11 = v14;
        }
        id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:v10 ownerName:v11];
        [v4 addObject:v12];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)subscriptionForDatabase:(id)a3
{
  id v3 = NSString;
  [a3 databaseScope];
  uint64_t v4 = CKDatabaseScopeString();
  uint64_t v5 = [v3 stringWithFormat:@"DatabaseSubscription-%@", v4];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F19F50]) initWithSubscriptionID:v5];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1A1E0]);
  [v7 setShouldSendContentAvailable:1];
  [v6 setNotificationInfo:v7];

  return v6;
}

- (void)updateSubscriptionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(ICCloudContext *)self hasNoteContextOptions:1])
  {
    uint64_t v5 = [(ICCloudContext *)self processingQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke;
    void v6[3] = &unk_1E64A4F70;
    void v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
  else
  {
    [(ICCloudContext *)self setNeedsToUpdateSubscriptions:0];
    if (v4) {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

void __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke_cold_2();
  }

  [*(id *)(a1 + 32) setNeedsToUpdateSubscriptions:0];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [*(id *)(a1 + 32) containersByAccountID];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke_554;
  v37[3] = &unk_1E64A87F8;
  id v5 = v3;
  id v38 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v37];

  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke_2;
  aBlock[3] = &unk_1E64A8960;
  void aBlock[4] = *(void *)(a1 + 32);
  id v7 = v5;
  id v34 = v7;
  id v24 = v6;
  id v35 = v24;
  id v36 = *(id *)(a1 + 40);
  uint64_t v8 = (void (**)(void *, void *, void))_Block_copy(aBlock);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  int v25 = v7;
  obuint64_t j = (id)[v7 copy];
  uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v44 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        char v14 = objc_msgSend(*(id *)(a1 + 32), "subscriptionForDatabase:", v13, v24);
        id v15 = [*(id *)(a1 + 32) subscribedSubscriptionIDs];
        long long v16 = [v14 subscriptionID];
        int v17 = [v15 containsObject:v16];

        long long v18 = os_log_create("com.apple.notes", "Cloud");
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
        if (v17)
        {
          if (v19)
          {
            [v13 databaseScope];
            id v22 = CKDatabaseScopeString();
            uint64_t v23 = [v14 subscriptionID];
            *(_DWORD *)long long buf = 138412546;
            long long v41 = v22;
            __int16 v42 = 2112;
            id v43 = v23;
            _os_log_debug_impl(&dword_1C3A61000, v18, OS_LOG_TYPE_DEBUG, "Not fetching subscriptions for %@, already subscribed to %@", buf, 0x16u);
          }
          v8[2](v8, v13, 0);
        }
        else
        {
          if (v19) {
            __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke_cold_1((uint64_t)v39, (uint64_t)v14);
          }

          long long v20 = *(void **)(a1 + 32);
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke_556;
          v27[3] = &unk_1E64A8988;
          uint64_t v21 = v8;
          v27[4] = v13;
          id v28 = v21;
          [v20 saveSubscriptionsForDatabase:v13 completionHandler:v27];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v44 count:16];
    }
    while (v10);
  }
}

void __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke_554(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  uint64_t v6 = [v5 privateCloudDatabase];
  [v4 addObject:v6];

  id v7 = *(void **)(a1 + 32);
  id v8 = [v5 sharedCloudDatabase];

  [v7 addObject:v8];
}

void __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] processingQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke_3;
  v12[3] = &unk_1E64A8938;
  id v13 = a1[5];
  id v14 = v5;
  id v15 = v6;
  id v8 = a1[6];
  id v9 = a1[4];
  id v16 = v8;
  id v17 = v9;
  id v18 = a1[7];
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

void __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 48)) {
    objc_msgSend(*(id *)(a1 + 56), "addObject:");
  }
  if (![*(id *)(a1 + 32) count])
  {
    id v3 = [(id)objc_opt_class() errorFromErrors:*(void *)(a1 + 56)];
    [*(id *)(a1 + 64) setNeedsToUpdateSubscriptions:v3 != 0];
    uint64_t v2 = *(void *)(a1 + 72);
    if (v2) {
      (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
    }
    if (*(void *)(a1 + 48)) {
      objc_msgSend(*(id *)(a1 + 64), "startRetryTimerIfNecessaryWithError:");
    }
  }
}

uint64_t __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke_556(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (void)fetchSubscriptionsForDatabase:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ICCloudContext *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__ICCloudContext_fetchSubscriptionsForDatabase_completionHandler___block_invoke;
  block[3] = &unk_1E64A4578;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __66__ICCloudContext_fetchSubscriptionsForDatabase_completionHandler___block_invoke(uint64_t a1)
{
  void v12[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1A0F0] fetchAllSubscriptionsOperation];
  objc_msgSend(v2, "setQualityOfService:", objc_msgSend(*(id *)(a1 + 32), "qualityOfService"));
  uint64_t v3 = [*(id *)(a1 + 32) discretionaryNetworkBehavior];
  id v4 = [v2 configuration];
  [v4 setDiscretionaryNetworkBehavior:v3];

  [v2 setDatabase:*(void *)(a1 + 40)];
  objc_initWeak(&location, v2);
  id v5 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v2, "ic_loggingDescription");
    objc_claimAutoreleasedReturnValue();
    __66__ICCloudContext_fetchSubscriptionsForDatabase_completionHandler___block_invoke_cold_1();
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__ICCloudContext_fetchSubscriptionsForDatabase_completionHandler___block_invoke_558;
  v8[3] = &unk_1E64A89B0;
  objc_copyWeak(&v10, &location);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 48);
  [v2 setFetchSubscriptionCompletionBlock:v8];
  id v6 = *(void **)(a1 + 32);
  v12[0] = v2;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v6 addOperations:v7];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __66__ICCloudContext_fetchSubscriptionsForDatabase_completionHandler___block_invoke_558(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = [*(id *)(a1 + 32) processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__ICCloudContext_fetchSubscriptionsForDatabase_completionHandler___block_invoke_2;
  block[3] = &unk_1E64A8188;
  id v14 = v5;
  id v15 = WeakRetained;
  id v9 = *(void **)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = v6;
  id v18 = v9;
  id v10 = v6;
  id v11 = WeakRetained;
  id v12 = v5;
  dispatch_async(v8, block);
}

uint64_t __66__ICCloudContext_fetchSubscriptionsForDatabase_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    id v17 = v2;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v18 + 1) + 8 * v6);
        id v8 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          id v11 = [v7 subscriptionID];
          id v12 = objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
          *(_DWORD *)long long buf = 138412546;
          uint64_t v23 = v11;
          __int16 v24 = 2112;
          int v25 = v12;
          _os_log_debug_impl(&dword_1C3A61000, v8, OS_LOG_TYPE_DEBUG, "Fetched subscription %@ %@", buf, 0x16u);

          uint64_t v2 = v17;
        }

        id v9 = [*(id *)(a1 + 48) subscribedSubscriptionIDs];
        id v10 = [v7 subscriptionID];
        [v9 addObject:v10];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v4);
  }

  uint64_t v13 = *(void *)(a1 + 56);
  id v14 = os_log_create("com.apple.notes", "Cloud");
  id v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __66__ICCloudContext_fetchSubscriptionsForDatabase_completionHandler___block_invoke_2_cold_2();
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    __66__ICCloudContext_fetchSubscriptionsForDatabase_completionHandler___block_invoke_2_cold_1(a1);
  }

  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 56));
  }
  return result;
}

- (void)saveSubscriptionsForDatabase:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ICCloudContext *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke;
  block[3] = &unk_1E64A4578;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke(uint64_t a1)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v3 = a1 + 40;
  uint64_t v4 = [*(id *)(a1 + 32) subscriptionForDatabase:*(void *)(a1 + 40)];
  uint64_t v5 = [*v2 subscribedSubscriptionIDs];
  id v6 = [v4 subscriptionID];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    id v8 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke_cold_1(v3, v4);
    }

    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
    }
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1A1B8]);
    v25[0] = v4;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    id v12 = (void *)[v10 initWithSubscriptionsToSave:v11 subscriptionIDsToDelete:0];

    objc_msgSend(v12, "setQualityOfService:", objc_msgSend(*(id *)(a1 + 32), "qualityOfService"));
    uint64_t v13 = [*(id *)(a1 + 32) discretionaryNetworkBehavior];
    id v14 = [v12 configuration];
    [v14 setDiscretionaryNetworkBehavior:v13];

    [v12 setDatabase:*(void *)(a1 + 40)];
    objc_initWeak(&location, v12);
    id v15 = objc_alloc_init(MEMORY[0x1E4F1A218]);
    [v15 setName:@"SaveSubscriptions"];
    uint64_t v16 = [v12 subscriptionsToSave];
    objc_msgSend(v15, "setQuantity:", objc_msgSend(v16, "count"));

    [v15 setExpectedSendSize:1];
    [v15 setExpectedReceiveSize:1];
    [v12 setGroup:v15];
    id v17 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      [v4 subscriptionID];
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ic_loggingDescription");
      objc_claimAutoreleasedReturnValue();
      __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke_cold_2();
    }

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke_563;
    v20[3] = &unk_1E64A89D8;
    objc_copyWeak(&v22, &location);
    v20[4] = *(void *)(a1 + 32);
    id v21 = *(id *)(a1 + 48);
    [v12 setModifySubscriptionsCompletionBlock:v20];
    long long v18 = *(void **)(a1 + 32);
    __int16 v24 = v12;
    long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    [v18 addOperations:v19];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

void __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke_563(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v9 = [*(id *)(a1 + 32) processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke_2;
  block[3] = &unk_1E64A8188;
  id v16 = v7;
  id v17 = WeakRetained;
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(a1 + 40);
  id v18 = v6;
  uint64_t v19 = v10;
  id v20 = v11;
  id v12 = v6;
  id v13 = WeakRetained;
  id v14 = v7;
  dispatch_async(v9, block);
}

uint64_t __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v4 = os_log_create("com.apple.notes", "Cloud");
  uint64_t v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke_2_cold_2();
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke_2_cold_1(a1);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v5 = *(id *)(a1 + 48);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v17 = v3;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v11 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            id v14 = [v10 subscriptionID];
            id v15 = objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
            *(_DWORD *)long long buf = 138412546;
            uint64_t v23 = v14;
            __int16 v24 = 2112;
            int v25 = v15;
            _os_log_debug_impl(&dword_1C3A61000, v11, OS_LOG_TYPE_DEBUG, "Saved subscription %@ %@", buf, 0x16u);
          }
          id v12 = [*(id *)(a1 + 56) subscribedSubscriptionIDs];
          id v13 = [v10 subscriptionID];
          [v12 addObject:v13];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v7);
      uint64_t v3 = v17;
    }
  }

  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *v3);
  }
  return result;
}

- (void)clearSubscribedSubscriptionIDs
{
  uint64_t v3 = [(ICCloudContext *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__ICCloudContext_clearSubscribedSubscriptionIDs__block_invoke;
  block[3] = &unk_1E64A4240;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __48__ICCloudContext_clearSubscribedSubscriptionIDs__block_invoke(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1C3A61000, v2, OS_LOG_TYPE_INFO, "Clearing subscribed subscription IDs", v4, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) subscribedSubscriptionIDs];
  [v3 removeAllObjects];
}

- (BOOL)isInForeground
{
  return 1;
}

- (void)updateCloudContextState
{
}

- (void)updateCloudContextStateWithCompletion:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  uint64_t v5 = [(ICCloudContext *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke;
  block[3] = &unk_1E64A8A50;
  void block[4] = self;
  id v8 = v4;
  uint64_t v9 = v10;
  id v6 = v4;
  dispatch_async(v5, block);

  _Block_object_dispose(v10, 8);
}

void __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  if (([*(id *)(a1 + 32) isDisabled] & 1) != 0 || objc_msgSend(*v2, "isDisabledInternal"))
  {
    uint64_t v3 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1C3A61000, v3, OS_LOG_TYPE_INFO, "Not updating cloud context state because it's disabled", buf, 2u);
    }

    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, void))(v4 + 16))(v4, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    }
  }
  else
  {
    uint64_t v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_cold_1();
    }

    id v6 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_576;
    v9[3] = &unk_1E64A8A28;
    void v9[4] = v6;
    long long v8 = *(_OWORD *)(a1 + 40);
    id v7 = (id)v8;
    long long v10 = v8;
    [v6 updateAccountStatusWithCompletionHandler:v9];
  }
}

void __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_576(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_2;
  block[3] = &unk_1E64A7F88;
  void block[4] = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  dispatch_async(v2, block);
}

void __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) syncOnlyIfReachable]
    && ([*(id *)(a1 + 32) isInForeground] & 1) == 0)
  {
    uint64_t v9 = os_log_create("com.apple.notes", "Cloud");
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_23;
    }
    LOWORD(buf) = 0;
    char v11 = "No longer in foreground after updating cloud context state";
LABEL_22:
    _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_INFO, v11, (uint8_t *)&buf, 2u);
    goto LABEL_23;
  }
  if ([*(id *)(a1 + 32) syncOnlyIfReachable]
    && ([*(id *)(a1 + 32) isInternetReachable] & 1) == 0)
  {
    uint64_t v9 = os_log_create("com.apple.notes", "Cloud");
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_23;
    }
    LOWORD(buf) = 0;
    char v11 = "No longer reachable after updating cloud context state";
    goto LABEL_22;
  }
  char v2 = [*(id *)(a1 + 32) isReadyToSync];
  id v3 = os_log_create("com.apple.notes", "Cloud");
  long long v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_2_cold_1();
    }

    [*(id *)(a1 + 32) enqueueLongLivedOperationsIfNeededWithCompletionHandler:0];
    if ([*(id *)(a1 + 32) needsToUpdateSubscriptions]) {
      [*(id *)(a1 + 32) updateSubscriptionsWithCompletionHandler:0];
    }
    uint64_t v5 = [*(id *)(a1 + 32) containersByAccountID];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    void v17[2] = __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_577;
    v17[3] = &unk_1E64A87F8;
    void v17[4] = *(void *)(a1 + 32);
    [v5 enumerateKeysAndObjectsUsingBlock:v17];

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    long long v6 = [*(id *)(a1 + 32) backgroundContext];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_580;
    void v14[3] = &unk_1E64A44A8;
    id v7 = v6;
    id v15 = v7;
    p_long long buf = &buf;
    [v7 performBlockAndWait:v14];

    if (*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      [*(id *)(a1 + 32) syncWithReason:@"UpdateContextState" completionHandler:0];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    }
    _Block_object_dispose(&buf, 8);
    return;
  }
  uint64_t v9 = v3;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    long long v10 = [*(id *)(a1 + 32) readinessLoggingDescription];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_INFO, "Not ready to sync after updating cloud context state: %@", (uint8_t *)&buf, 0xCu);
  }
LABEL_23:

  id v12 = [*(id *)(a1 + 32) processingSelectorDelayer];
  [v12 cancelPreviousFireRequests];

  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, void))(v13 + 16))(v13, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  }
}

void __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_577(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  long long v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_2_578;
  v8[3] = &unk_1E64A8A00;
  void v8[4] = v6;
  id v9 = v5;
  id v7 = v5;
  [v6 fetchUserRecordWithContainer:a3 completionHandler:v8];
}

void __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_2_578(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) processingQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_3;
  v11[3] = &unk_1E64A5260;
  id v12 = v6;
  id v13 = v5;
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, v11);
}

void __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = os_log_create("com.apple.notes", "Cloud");
  long long v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_3_cold_2();
    }
  }
  else
  {
    id v5 = v3;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_3_cold_1(a1);
    }
  }
  if (*(void *)(a1 + 40))
  {
    id v6 = [*(id *)(a1 + 48) cloudContextDelegate];
    [v6 cloudContext:*(void *)(a1 + 48) didFetchUserRecord:*(void *)(a1 + 40) accountID:*(void *)(a1 + 56)];
  }
}

void __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_580(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v2 = +[ICAccount allActiveCloudKitAccountsInContext:](ICAccount, "allActiveCloudKitAccountsInContext:", *(void *)(a1 + 32), 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v8 = [v7 serverChangeTokens];
        uint64_t v9 = [v8 count];

        if (!v9)
        {
          id v10 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
            __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_580_cold_1(v7);
          }

          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)enqueueLongLivedOperationsIfNeededWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  if ([(ICCloudContext *)self isEnqueueingLongLivedOperations]
    || [(ICCloudContext *)self didEnqueueLongLivedOperations]
    || ([(ICCloudContext *)self setEnqueueingLongLivedOperations:1],
        [(ICCloudContext *)self containersByAccountID],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        !v6))
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    dispatch_group_t v7 = dispatch_group_create();
    uint64_t v8 = [(ICCloudContext *)self containersByAccountID];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __74__ICCloudContext_enqueueLongLivedOperationsIfNeededWithCompletionHandler___block_invoke;
    v13[3] = &unk_1E64A8AA0;
    dispatch_group_t v14 = v7;
    id v15 = self;
    uint64_t v9 = v7;
    [v8 enumerateKeysAndObjectsUsingBlock:v13];

    id v10 = [(ICCloudContext *)self processingQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __74__ICCloudContext_enqueueLongLivedOperationsIfNeededWithCompletionHandler___block_invoke_2_586;
    v11[3] = &unk_1E64A4F70;
    void v11[4] = self;
    long long v12 = v4;
    dispatch_group_notify(v9, v10, v11);
  }
}

void __74__ICCloudContext_enqueueLongLivedOperationsIfNeededWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__ICCloudContext_enqueueLongLivedOperationsIfNeededWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E64A8A78;
  id v9 = v4;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  id v7 = v4;
  [v7 fetchAllLongLivedOperationIDsWithCompletionHandler:v8];
}

void __74__ICCloudContext_enqueueLongLivedOperationsIfNeededWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __74__ICCloudContext_enqueueLongLivedOperationsIfNeededWithCompletionHandler___block_invoke_2_cold_1();
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __74__ICCloudContext_enqueueLongLivedOperationsIfNeededWithCompletionHandler___block_invoke_584;
    v9[3] = &unk_1E64A4240;
    uint64_t v8 = *(void **)(a1 + 48);
    id v10 = *(id *)(a1 + 40);
    [v8 enqueueLongLivedOperationsWithIDsIfNeeded:a2 container:v7 completionHandler:v9];
  }
}

void __74__ICCloudContext_enqueueLongLivedOperationsIfNeededWithCompletionHandler___block_invoke_584(uint64_t a1)
{
}

uint64_t __74__ICCloudContext_enqueueLongLivedOperationsIfNeededWithCompletionHandler___block_invoke_2_586(uint64_t a1)
{
  [*(id *)(a1 + 32) setDidEnqueueLongLivedOperations:1];
  [*(id *)(a1 + 32) setEnqueueingLongLivedOperations:0];
  uint64_t v2 = [*(id *)(a1 + 32) operationIDsBeforeEnqueuingLongLivedOperations];
  [v2 removeAllObjects];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)enqueueLongLivedOperationsWithIDsIfNeeded:(id)a3 container:(id)a4 completionHandler:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v19 = a5;
  id v10 = dispatch_group_create();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * v14);
        dispatch_group_enter(v10);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke;
        v23[3] = &unk_1E64A8AC8;
        void v23[4] = self;
        id v16 = v9;
        id v24 = v16;
        uint64_t v25 = v15;
        id v26 = v10;
        [v16 fetchLongLivedOperationWithID:v15 completionHandler:v23];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v12);
  }

  id v17 = [(ICCloudContext *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_590;
  block[3] = &unk_1E64A56A0;
  id v22 = v19;
  id v18 = v19;
  dispatch_group_notify(v10, v17, block);
}

void __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = [*(id *)(a1 + 32) operationQueue];
  id v9 = [v8 operations];
  id v10 = objc_msgSend(v9, "ic_compactMap:", &__block_literal_global_588);
  uint64_t v11 = [v7 setWithArray:v10];

  if (v6)
  {
    uint64_t v12 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_cold_6();
    }
LABEL_4:
    uint64_t v13 = v12;
    goto LABEL_5;
  }
  if (!v5)
  {
    uint64_t v12 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_cold_1();
    }
    goto LABEL_4;
  }
  if ([v11 containsObject:*(void *)(a1 + 48)])
  {
    uint64_t v12 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_cold_2();
    }
    goto LABEL_4;
  }
  uint64_t v14 = [*(id *)(a1 + 32) operationIDsBeforeEnqueuingLongLivedOperations];
  int v15 = [v14 containsObject:*(void *)(a1 + 48)];

  if (v15)
  {
    uint64_t v12 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_cold_3();
    }
    goto LABEL_4;
  }
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v12 = os_log_create("com.apple.notes", "Cloud");
  BOOL v17 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if ((isKindOfClass & 1) == 0)
  {
    if (v17) {
      __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_cold_5();
    }
    goto LABEL_4;
  }
  if (v17) {
    __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_cold_4();
  }

  id v18 = *(void **)(a1 + 32);
  uint64_t v12 = v5;
  [v18 addCallbackBlocksToModifyRecordsOperation:v12 rootRecordIDsByShareID:0];
  id v19 = *(void **)(a1 + 32);
  v20[0] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  [v19 addOperations:v13];
LABEL_5:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

id __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  uint64_t v3 = ICDynamicCast();

  id v4 = [v3 operationID];

  return v4;
}

uint64_t __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_590(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)incrementRetryCountForOperationType:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCloudContext *)self processingQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __54__ICCloudContext_incrementRetryCountForOperationType___block_invoke;
  v7[3] = &unk_1E64A4218;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __54__ICCloudContext_incrementRetryCountForOperationType___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) retryCountsByOperationType];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v4 = (void *)v3;
  id v5 = &unk_1F1F629B8;
  if (v3) {
    id v5 = (void *)v3;
  }
  id v6 = v5;

  uint64_t v7 = [v6 unsignedIntegerValue] + 1;
  id v8 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    int v12 = 138412802;
    uint64_t v13 = v11;
    __int16 v14 = 1024;
    int v15 = [v6 unsignedIntegerValue];
    __int16 v16 = 1024;
    int v17 = v7;
    _os_log_debug_impl(&dword_1C3A61000, v8, OS_LOG_TYPE_DEBUG, "Incrementing retry count for %@ from %d to %d", (uint8_t *)&v12, 0x18u);
  }

  id v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v7];
  id v10 = [*(id *)(a1 + 32) retryCountsByOperationType];
  [v10 setObject:v9 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)clearRetryCountForOperationType:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCloudContext *)self processingQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __50__ICCloudContext_clearRetryCountForOperationType___block_invoke;
  v7[3] = &unk_1E64A4218;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __50__ICCloudContext_clearRetryCountForOperationType___block_invoke(uint64_t a1)
{
  id v2 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __50__ICCloudContext_clearRetryCountForOperationType___block_invoke_cold_1();
  }

  uint64_t v3 = [*(id *)(a1 + 40) retryCountsByOperationType];
  [v3 removeObjectForKey:*(void *)(a1 + 32)];
}

- (void)incrementOrClearRetryCountForOperationType:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v6)
  {
    if (([(id)objc_opt_class() shouldIgnoreErrorForBackoffTimer:v6] & 1) == 0) {
      [(ICCloudContext *)self incrementRetryCountForOperationType:v7];
    }
  }
  else
  {
    [(ICCloudContext *)self clearRetryCountForOperationType:v7];
  }
}

+ (id)errorCodesToIgnoreForBackoffTimer
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F1F629D0, &unk_1F1F629E8, &unk_1F1F62A00, 0);
}

+ (BOOL)shouldIgnoreErrorForBackoffTimer:(id)a3
{
  id v4 = a3;
  if ([v4 code] == 2)
  {
    id v5 = [v4 userInfo];
    id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];
    id v7 = [v6 allValues];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__ICCloudContext_shouldIgnoreErrorForBackoffTimer___block_invoke;
    v12[3] = &__block_descriptor_40_e24_B32__0__NSError_8Q16_B24l;
    void v12[4] = a1;
    char v8 = objc_msgSend(v7, "ic_containsObjectPassingTest:", v12);
  }
  else
  {
    id v9 = [a1 errorCodesToIgnoreForBackoffTimer];
    id v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v4, "code"));
    char v8 = [v9 containsObject:v10];
  }
  return v8;
}

uint64_t __51__ICCloudContext_shouldIgnoreErrorForBackoffTimer___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) shouldIgnoreErrorForBackoffTimer:a2];
}

- (void)startRetryTimerIfNecessaryWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCloudContext *)self processingQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __54__ICCloudContext_startRetryTimerIfNecessaryWithError___block_invoke;
  v7[3] = &unk_1E64A4218;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __54__ICCloudContext_startRetryTimerIfNecessaryWithError___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) syncOnlyIfReachable]
    && ([*(id *)(a1 + 32) isInternetReachable] & 1) == 0)
  {
    id v7 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1C3A61000, v7, OS_LOG_TYPE_INFO, "Not retrying because we have no internet connection", (uint8_t *)&buf, 2u);
    }
  }
  else if ([*(id *)(a1 + 32) isReadyToSync])
  {
    int v2 = [*(id *)(a1 + 32) disableRetryTimer];
    uint64_t v3 = os_log_create("com.apple.notes", "Cloud");
    id v4 = v3;
    if (v2)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_INFO, "Not starting retry timer because disableRetryTimer has been set.", (uint8_t *)&buf, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        __54__ICCloudContext_startRetryTimerIfNecessaryWithError___block_invoke_cold_2();
      }

      [*(id *)(a1 + 32) timeIntervalToRetryAfterFromError:*(void *)(a1 + 40)];
      double v9 = v8;
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v19 = 0x2020000000;
      uint64_t v20 = 0;
      id v10 = [*(id *)(a1 + 32) retryCountsByOperationType];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      void v17[2] = __54__ICCloudContext_startRetryTimerIfNecessaryWithError___block_invoke_602;
      v17[3] = &unk_1E64A8B10;
      void v17[4] = &buf;
      [v10 enumerateKeysAndObjectsUsingBlock:v17];

      double v11 = (double)(unint64_t)(*(void *)(*((void *)&buf + 1) + 24) + 1)
          * (double)(unint64_t)(*(void *)(*((void *)&buf + 1) + 24) + 1);
      double v12 = fmin(v11 + v11, 273.0);
      if (v12 > v9)
      {
        uint64_t v13 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          __54__ICCloudContext_startRetryTimerIfNecessaryWithError___block_invoke_cold_1(v13, v12, v14, v15);
        }

        double v9 = v12;
      }
      if (v9 > 0.0)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __54__ICCloudContext_startRetryTimerIfNecessaryWithError___block_invoke_604;
        block[3] = &unk_1E64A6458;
        void block[4] = *(void *)(a1 + 32);
        *(double *)&void block[5] = v9;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
      _Block_object_dispose(&buf, 8);
    }
  }
  else
  {
    id v5 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [*(id *)(a1 + 32) readinessLoggingDescription];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_INFO, "Not retrying because we're not ready: %@", (uint8_t *)&buf, 0xCu);
    }
  }
}

unint64_t __54__ICCloudContext_startRetryTimerIfNecessaryWithError___block_invoke_602(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  unint64_t result = [a3 unsignedIntegerValue];
  if (v4 <= result) {
    unint64_t v6 = result;
  }
  else {
    unint64_t v6 = v4;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
  return result;
}

void __54__ICCloudContext_startRetryTimerIfNecessaryWithError___block_invoke_604(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) retryTimer];
  if (!v2
    || (uint64_t v3 = (void *)v2,
        [*(id *)(a1 + 32) retryTimer],
        unint64_t v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isValid],
        v4,
        v3,
        (v5 & 1) == 0))
  {
    unint64_t v6 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = (int)*(double *)(a1 + 40);
      v9[0] = 67109120;
      v9[1] = v7;
      _os_log_impl(&dword_1C3A61000, v6, OS_LOG_TYPE_INFO, "Retrying operations after %ds", (uint8_t *)v9, 8u);
    }

    double v8 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:sel_retryOperationsIfNecessary selector:0 userInfo:0 repeats:*(double *)(a1 + 40)];
    [*(id *)(a1 + 32) setRetryTimer:v8];
  }
}

- (void)retryOperationsIfNecessary
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__ICCloudContext_retryOperationsIfNecessary__block_invoke;
  block[3] = &unk_1E64A4240;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  uint64_t v3 = [(ICCloudContext *)self processingQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__ICCloudContext_retryOperationsIfNecessary__block_invoke_2;
  v4[3] = &unk_1E64A4240;
  v4[4] = self;
  dispatch_async(v3, v4);
}

uint64_t __44__ICCloudContext_retryOperationsIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) retryTimer];
  [v2 invalidate];

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setRetryTimer:0];
}

void __44__ICCloudContext_retryOperationsIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) syncOnlyIfReachable]
    && ([*v1 isInternetReachable] & 1) == 0)
  {
    __int16 v16 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      __44__ICCloudContext_retryOperationsIfNecessary__block_invoke_2_cold_2();
    }
  }
  else
  {
    char v2 = [*v1 isReadyToSync];
    uint64_t v3 = os_log_create("com.apple.notes", "Cloud");
    unint64_t v4 = v3;
    if (v2)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1C3A61000, v4, OS_LOG_TYPE_INFO, "Retrying operations", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, *v1);
      if ([*v1 needsToUpdateSubscriptions])
      {
        char v5 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v23 = 0;
          _os_log_impl(&dword_1C3A61000, v5, OS_LOG_TYPE_INFO, "Retrying to update subscriptions", v23, 2u);
        }

        id v6 = *v1;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __44__ICCloudContext_retryOperationsIfNecessary__block_invoke_608;
        v21[3] = &unk_1E64A8B38;
        objc_copyWeak(&v22, buf);
        [v6 updateSubscriptionsWithCompletionHandler:v21];
        objc_destroyWeak(&v22);
      }
      int v7 = objc_opt_class();
      double v8 = [*v1 accountZoneIDsNeedingToBeSaved];
      LODWORD(v7) = [v7 haveZoneIDsInAccountZoneIDs:v8];

      if (v7)
      {
        double v9 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v23 = 0;
          _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_INFO, "Retrying to save record zones", v23, 2u);
        }

        uint64_t v10 = [*v1 containersByAccountID];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        void v20[2] = __44__ICCloudContext_retryOperationsIfNecessary__block_invoke_612;
        v20[3] = &unk_1E64A87F8;
        v20[4] = *v1;
        [v10 enumerateKeysAndObjectsUsingBlock:v20];
      }
      double v11 = objc_opt_class();
      double v12 = [*v1 accountZoneIDsNeedingFetchChanges];
      LODWORD(v11) = [v11 haveZoneIDsInAccountZoneIDs:v12];

      if (v11)
      {
        uint64_t v13 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v23 = 0;
          _os_log_impl(&dword_1C3A61000, v13, OS_LOG_TYPE_INFO, "Retrying to fetch record zone changes", v23, 2u);
        }

        [*v1 fetchRecordZoneChangesWithReason:@"RetryOperations" completionHandler:0];
      }
      uint64_t v14 = [*v1 objectIDsToProcess];
      if ([v14 count])
      {
      }
      else
      {
        int v17 = [*v1 objectIDsToRetry];
        uint64_t v18 = [v17 count];

        if (!v18)
        {
LABEL_30:
          objc_destroyWeak(buf);
          return;
        }
      }
      uint64_t v19 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v23 = 0;
        _os_log_impl(&dword_1C3A61000, v19, OS_LOG_TYPE_INFO, "Retrying to process changes", v23, 2u);
      }

      [*v1 processPendingCloudObjects];
      goto LABEL_30;
    }
    uint64_t v15 = v3;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __44__ICCloudContext_retryOperationsIfNecessary__block_invoke_2_cold_1((uint64_t)v1);
    }
  }
}

void __44__ICCloudContext_retryOperationsIfNecessary__block_invoke_608(uint64_t a1, void *a2)
{
  char v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained incrementOrClearRetryCountForOperationType:@"Subscriptions" error:v3];
}

void __44__ICCloudContext_retryOperationsIfNecessary__block_invoke_612(uint64_t a1, uint64_t a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) operationToSaveZonesIfNecessaryForAccountID:a2];
  unint64_t v4 = (void *)v3;
  if (v3)
  {
    char v5 = *(void **)(a1 + 32);
    v7[0] = v3;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [v5 addOperations:v6];
  }
}

- (void)saveServerChangeToken:(id)a3 forRecordZoneID:(id)a4 databaseScope:(int64_t)a5 accountID:(id)a6 context:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = objc_msgSend(v12, "ic_loggingDescription");
    uint64_t v21 = (void *)v20;
    if (v20) {
      id v22 = (__CFString *)v20;
    }
    else {
      id v22 = @"zone changes";
    }
    uint64_t v23 = CKDatabaseScopeString();
    id v24 = objc_msgSend(v11, "ic_loggingDescription");
    *(_DWORD *)long long buf = 138412802;
    uint64_t v32 = v22;
    __int16 v33 = 2112;
    id v34 = v23;
    __int16 v35 = 2112;
    id v36 = v24;
    _os_log_debug_impl(&dword_1C3A61000, v15, OS_LOG_TYPE_DEBUG, "Saving server change token for %@ %@: %@", buf, 0x20u);
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  void v25[2] = __88__ICCloudContext_saveServerChangeToken_forRecordZoneID_databaseScope_accountID_context___block_invoke;
  v25[3] = &unk_1E64A8B60;
  id v26 = v13;
  id v27 = v14;
  id v29 = v11;
  int64_t v30 = a5;
  id v28 = v12;
  id v16 = v11;
  id v17 = v12;
  id v18 = v14;
  id v19 = v13;
  [v18 performBlockAndWait:v25];
}

void __88__ICCloudContext_saveServerChangeToken_forRecordZoneID_databaseScope_accountID_context___block_invoke(uint64_t a1)
{
  char v2 = +[ICAccount accountWithIdentifier:*(void *)(a1 + 32) context:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = +[ICServerChangeToken serverChangeTokenForAccount:v2 zoneID:*(void *)(a1 + 48) databaseScope:*(void *)(a1 + 64) context:*(void *)(a1 + 40)];
    unint64_t v4 = v3;
    if (v3) {
      [v3 setCkServerChangeToken:*(void *)(a1 + 56)];
    }
    else {
      id v5 = +[ICServerChangeToken addServerChangeTokenForAccount:v2 ckServerChangeToken:*(void *)(a1 + 56) zoneID:*(void *)(a1 + 48) databaseScope:*(void *)(a1 + 64) context:*(void *)(a1 + 40)];
    }
  }
  else
  {
    unint64_t v4 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __88__ICCloudContext_saveServerChangeToken_forRecordZoneID_databaseScope_accountID_context___block_invoke_cold_1();
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "ic_saveWithLogDescription:", @"saving server change token");
}

- (id)serverChangeTokenForRecordZoneID:(id)a3 databaseScope:(int64_t)a4 accountID:(id)a5 context:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__47;
  id v27 = __Block_byref_object_dispose__47;
  id v28 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __83__ICCloudContext_serverChangeTokenForRecordZoneID_databaseScope_accountID_context___block_invoke;
  v17[3] = &unk_1E64A8B88;
  id v12 = v10;
  id v18 = v12;
  id v13 = v11;
  id v19 = v13;
  id v14 = v9;
  uint64_t v21 = &v23;
  int64_t v22 = a4;
  id v20 = v14;
  [v13 performBlockAndWait:v17];
  id v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __83__ICCloudContext_serverChangeTokenForRecordZoneID_databaseScope_accountID_context___block_invoke(void *a1)
{
  char v2 = +[ICAccount accountWithIdentifier:a1[4] context:a1[5]];
  if (v2)
  {
    uint64_t v3 = +[ICServerChangeToken serverChangeTokenForAccount:v2 zoneID:a1[6] databaseScope:a1[8] context:a1[5]];
    uint64_t v4 = [v3 ckServerChangeToken];
    uint64_t v5 = *(void *)(a1[7] + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else
  {
    int v7 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __83__ICCloudContext_serverChangeTokenForRecordZoneID_databaseScope_accountID_context___block_invoke_cold_1();
    }
  }
}

- (void)deleteServerChangeTokenForRecordZoneID:(id)a3 databaseScope:(int64_t)a4 accountID:(id)a5 context:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[ICCloudContext deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:context:]();
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __89__ICCloudContext_deleteServerChangeTokenForRecordZoneID_databaseScope_accountID_context___block_invoke;
  v16[3] = &unk_1E64A8BB0;
  id v17 = v10;
  id v18 = v11;
  id v19 = v9;
  int64_t v20 = a4;
  id v13 = v9;
  id v14 = v11;
  id v15 = v10;
  [v14 performBlockAndWait:v16];
}

void __89__ICCloudContext_deleteServerChangeTokenForRecordZoneID_databaseScope_accountID_context___block_invoke(uint64_t a1)
{
  char v2 = +[ICAccount accountWithIdentifier:*(void *)(a1 + 32) context:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = +[ICServerChangeToken serverChangeTokenForAccount:v2 zoneID:*(void *)(a1 + 48) databaseScope:*(void *)(a1 + 56) context:*(void *)(a1 + 40)];
    if (v3)
    {
      [*(id *)(a1 + 40) deleteObject:v3];
      [v2 removeServerChangeTokensObject:v3];
      objc_msgSend(*(id *)(a1 + 40), "ic_saveWithLogDescription:", @"deleting server change token");
    }
  }
  else
  {
    uint64_t v4 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __83__ICCloudContext_serverChangeTokenForRecordZoneID_databaseScope_accountID_context___block_invoke_cold_1();
    }
  }
}

- (void)deleteAllServerChangeTokens
{
  uint64_t v3 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1C3A61000, v3, OS_LOG_TYPE_INFO, "Deleting all server change tokens", buf, 2u);
  }

  uint64_t v4 = [(ICCloudContext *)self backgroundContext];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__ICCloudContext_deleteAllServerChangeTokens__block_invoke;
  void v6[3] = &unk_1E64A4240;
  id v7 = v4;
  id v5 = v4;
  [v5 performBlockAndWait:v6];
}

uint64_t __45__ICCloudContext_deleteAllServerChangeTokens__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = +[ICAccount allActiveCloudKitAccountsInContext:*(void *)(a1 + 32)];
  uint64_t v2 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v21 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v7 = [v6 serverChangeTokens];
        double v8 = (void *)[v7 copy];

        uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v17;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v17 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * j);
              [*(id *)(a1 + 32) deleteObject:v13];
              [v6 removeServerChangeTokensObject:v13];
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v10);
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v3);
  }

  return objc_msgSend(*(id *)(a1 + 32), "ic_saveWithLogDescription:", @"deleting all server change tokens");
}

- (void)saveServerChangeToken:(id)a3 forChangedZonesInDatabase:(id)a4 accountID:(id)a5 context:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  -[ICCloudContext saveServerChangeToken:forRecordZoneID:databaseScope:accountID:context:](self, "saveServerChangeToken:forRecordZoneID:databaseScope:accountID:context:", v12, 0, [a4 databaseScope], v11, v10);
}

- (void)deleteServerChangeTokenForChangedZonesInDatabase:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  -[ICCloudContext deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:context:](self, "deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:context:", 0, [a3 databaseScope], v9, v8);
}

- (id)serverChangeTokenForChangedZonesInDatabase:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = -[ICCloudContext serverChangeTokenForRecordZoneID:databaseScope:accountID:context:](self, "serverChangeTokenForRecordZoneID:databaseScope:accountID:context:", 0, [a3 databaseScope], v9, v8);

  return v10;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  if ([(ICCloudContext *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotesSupport/Ironcade/Shared/CloudKit/ICCloudContext.m"])
  {
    char v13 = [(ICCloudContext *)self ic_shouldIgnoreObserveValue:v10 ofObject:v11 forKeyPath:v12];

    if (a6 == compoundliteral_1 && (v13 & 1) == 0)
    {
      id v14 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F284E0]];
      uint64_t v15 = [v14 unsignedIntegerValue];

      long long v16 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
      uint64_t v17 = [v16 unsignedIntegerValue];

      if (!v15 && v17 || v15 && !v17)
      {
        long long v18 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __65__ICCloudContext_observeValueForKeyPath_ofObject_change_context___block_invoke;
        block[3] = &unk_1E64A4240;
        void block[4] = self;
        dispatch_async(v18, block);
      }
      long long v19 = [(ICCloudContext *)self processingQueue];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      void v20[2] = __65__ICCloudContext_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
      v20[3] = &unk_1E64A4240;
      v20[4] = self;
      dispatch_async(v19, v20);
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)ICCloudContext;
    [(ICCloudContext *)&v22 observeValueForKeyPath:v12 ofObject:v11 change:v10 context:a6];
  }
}

void __65__ICCloudContext_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ICCloudContextHasPendingOperationsDidChangeNotification" object:*(void *)(a1 + 32)];
}

uint64_t __65__ICCloudContext_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) printOperationQueue];
}

- (ICCloudAnalyticsDelegate)cloudAnalyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudAnalyticsDelegate);
  return (ICCloudAnalyticsDelegate *)WeakRetained;
}

- (BOOL)fetchOperationsPending
{
  return self->_fetchOperationsPending;
}

- (BOOL)needsToUpdateSubscriptions
{
  return self->_needsToUpdateSubscriptions;
}

- (BOOL)shouldResumeSyncOnForeground
{
  return self->_shouldResumeSyncOnForeground;
}

- (void)setShouldResumeSyncOnForeground:(BOOL)a3
{
  self->_shouldResumeSyncOnForeground = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (unint64_t)discretionaryNetworkBehavior
{
  return self->_discretionaryNetworkBehavior;
}

- (BOOL)enableLongLivedOperations
{
  return self->_enableLongLivedOperations;
}

- (BOOL)disableAutomaticallyRetryNetworkFailures
{
  return self->_disableAutomaticallyRetryNetworkFailures;
}

- (BOOL)disableRetryTimer
{
  return self->_disableRetryTimer;
}

- (void)setDisableRetryTimer:(BOOL)a3
{
  self->_disableRetryTimer = a3;
}

- (BOOL)syncOnlyIfReachable
{
  return self->_syncOnlyIfReachable;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (OS_dispatch_queue)containersCreationQueue
{
  return self->_containersCreationQueue;
}

- (NSMutableSet)objectIDsToRetry
{
  return self->_objectIDsToRetry;
}

- (NSTimer)retryTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRetryTimer:(id)a3
{
}

- (NSMutableDictionary)retryCountsByOperationType
{
  return self->_retryCountsByOperationType;
}

- (BOOL)isDisabledInternal
{
  return self->_disabledInternal;
}

- (BOOL)needsToProcessAllObjects
{
  return self->_needsToProcessAllObjects;
}

- (void)setNeedsToProcessAllObjects:(BOOL)a3
{
  self->_needsToProcessAllObjects = a3;
}

- (NSMutableSet)objectIDsToProcess
{
  return self->_objectIDsToProcess;
}

- (BOOL)didAddObservers
{
  return self->_didAddObservers;
}

- (BOOL)isFetchingEnabled
{
  return self->_fetchingEnabled;
}

- (void)setContainersByAccountID:(id)a3
{
}

- (NSMutableDictionary)accountZoneIDsFetchingChanges
{
  return self->_accountZoneIDsFetchingChanges;
}

- (NSMutableDictionary)accountZoneIDsNeedingToBeSaved
{
  return self->_accountZoneIDsNeedingToBeSaved;
}

- (NSMutableSet)subscribedSubscriptionIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 152, 1);
}

- (BOOL)didEnqueueLongLivedOperations
{
  return self->_didEnqueueLongLivedOperations;
}

- (BOOL)isEnqueueingLongLivedOperations
{
  return self->_enqueueingLongLivedOperations;
}

- (void)setEnqueueingLongLivedOperations:(BOOL)a3
{
  self->_enqueueingLongLivedOperations = a3;
}

- (NSMutableSet)operationIDsBeforeEnqueuingLongLivedOperations
{
  return self->_operationIDsBeforeEnqueuingLongLivedOperations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationIDsBeforeEnqueuingLongLivedOperations, 0);
  objc_storeStrong((id *)&self->_subscribedSubscriptionIDs, 0);
  objc_storeStrong((id *)&self->_accountZoneIDsNeedingToBeSaved, 0);
  objc_storeStrong((id *)&self->_accountZoneIDsFetchingChanges, 0);
  objc_storeStrong((id *)&self->_accountZoneIDsNeedingFetchChanges, 0);
  objc_storeStrong((id *)&self->_containersByAccountID, 0);
  objc_storeStrong((id *)&self->_processingSelectorDelayer, 0);
  objc_storeStrong((id *)&self->_objectIDsToProcess, 0);
  objc_storeStrong((id *)&self->_retryCountsByOperationType, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_objectIDsToRetry, 0);
  objc_storeStrong((id *)&self->_containersCreationQueue, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_cloudAnalyticsDelegate);
  objc_destroyWeak((id *)&self->_cloudContextDelegate);
}

- (void)initWithDelegate:.cold.1()
{
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_FAULT, "Cannot reset zone of primary iCloud account because there is no iCloud account enabled", v1, 2u);
}

- (void)disableCloudSyncingIfCurrentVersionNotSupported:.cold.1()
{
  OUTLINED_FUNCTION_4();
  os_log_t v0 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v1 = [v0 operatingSystemVersionString];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Current version of the OS (%@) is not supported for sync. Needs at least (%@)", v4, v5, v6, v7, v8);
}

- (void)disableCloudSyncingIfCurrentVersionNotSupported:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "OS version sent from server is in the incorrect format. Should be majorVersion,minorVersion,patchVersion", v2, v3, v4, v5, v6);
}

- (void)reachabilityChanged:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Cloud context found an internet connection.", v2, v3, v4, v5, v6);
}

- (void)reachabilityChanged:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Cloud context lost an internet connection.", v2, v3, v4, v5, v6);
}

void __41__ICCloudContext_cloudKitAccountChanged___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "CloudKit account status may have changed", v2, v3, v4, v5, v6);
}

- (void)syncWithReason:uploadUnsyncedChanges:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Trying to sync with no CloudKit account", v2, v3, v4, v5, v6);
}

- (void)_syncWithReason:uploadUnsyncedChanges:completionHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9_4(&dword_1C3A61000, v0, (uint64_t)v0, "Starting sync with reason: %@ (uploadUnsyncedChanges=%@)", v1);
}

void __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Fetched database changes for full sync", v2, v3, v4, v5, v6);
}

void __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_161_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Fetched record zone changes for sync", v2, v3, v4, v5, v6);
}

void __74__ICCloudContext__syncWithReason_uploadUnsyncedChanges_completionHandler___block_invoke_162_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Processed everything for full sync", v2, v3, v4, v5, v6);
}

- (void)syncCompletedWithErrors:(void *)a1 .cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v1, v2, "Sync completed with error count: %lu", v3, v4, v5, v6, v7);
}

void __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, v0, v1, "Cancelling all operations: %@", v2);
}

void __56__ICCloudContext_cancelEverythingWithCompletionHandler___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Timed out when cancelling the cloud operations. Performing cleanup anyway.", v2, v3, v4, v5, v6);
}

void __38__ICCloudContext_clearPendingActivity__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Cleared the list of objectIDsToRetry", v2, v3, v4, v5, v6);
}

void __38__ICCloudContext_clearPendingActivity__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Cleared the list of objectIDsToProcess", v2, v3, v4, v5, v6);
}

- (void)deleteRecordZonesWithZoneIDs:accountID:markZonesAsUserPurged:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Trying to deleteRecordZonesWithZoneIDs with empty accountID.", v2, v3, v4, v5, v6);
}

void __97__ICCloudContext_deleteRecordZonesWithZoneIDs_accountID_markZonesAsUserPurged_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_28_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_9_4(&dword_1C3A61000, v0, (uint64_t)v0, "Deleted record zones in account ID %@: %@", v1);
}

void __97__ICCloudContext_deleteRecordZonesWithZoneIDs_accountID_markZonesAsUserPurged_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_28_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_13(&dword_1C3A61000, v0, v1, "Error deleting zones in account ID %@: %@");
}

void __97__ICCloudContext_deleteRecordZonesWithZoneIDs_accountID_markZonesAsUserPurged_completionHandler___block_invoke_173_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Deleting record zones", v2, v3, v4, v5, v6);
}

void __81__ICCloudContext_finishOperationsForRecordID_qualityOfService_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_34(a1), "ic_loggingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Finishing operations for record ID %@", v4, v5, v6, v7, v8);
}

void __81__ICCloudContext_finishOperationsForRecordID_qualityOfService_completionHandler___block_invoke_193_cold_1(uint64_t a1)
{
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_34(a1), "ic_loggingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "All operations finished for record ID %@", v4, v5, v6, v7, v8);
}

void __71__ICCloudContext_ingestCloudKitRecord_forAccountID_forceMerge_context___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 40), "ic_loggingDescription");
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1_3(&dword_1C3A61000, v2, v3, "Ingesting record (forced=%@) for account ID %@: %@", v4, v5, v6, v7, 2u);
}

void __72__ICCloudContext__ingestCloudKitRecord_forAccountID_forceMerge_context___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "No CloudKit accounts available for ingesting record (account ID %@) %@", v4, v5, v6, v7, 2u);
}

void __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke_2_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, v0, v1, "Updating CloudKit account status for account: %@", v2);
}

void __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke_2_201_cold_1()
{
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_14(v0);
  uint64_t v1 = CKStringFromAccountStatus();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v2, v3, "No change in CloudKit status %@ for account: %@", v4, v5, v6, v7, v8);
}

void __59__ICCloudContext_updateAccountStatusWithCompletionHandler___block_invoke_2_201_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&void v3[4] = *(void *)(a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_13(&dword_1C3A61000, (uint64_t)a2, a3, "Error updating account status for account: %@, %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)fetchUserRecordWithAccountID:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Trying to fetchUserRecordWithAccountID with empty accountID.", v2, v3, v4, v5, v6);
}

- (void)fetchUserRecordWithContainer:completionHandler:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, v0, v1, "Fetching user record in cloud context: %@", v2);
}

void __65__ICCloudContext_fetchUserRecordWithContainer_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_26(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, v0, v1, "Fetched user record in cloud context: %@", v2);
}

void __65__ICCloudContext_fetchUserRecordWithContainer_completionHandler___block_invoke_204_cold_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Fetch user record operation completed: %@", v4, v5, v6, v7, v8);
}

void __45__ICCloudContext_userRecordNameForContainer___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = objc_msgSend(v0, "ic_loggingDescription");
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Error fetching user record ID: %@, error: %@", v4, v5, v6, v7, v8);
}

- (void)existingCloudObjectForUserSpecificRecordID:createPlaceholderIfNecessary:accountID:context:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_1(v0, v1), "ic_loggingDescription");
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v3, v4, "Cannot parse user-specific record in account ID %@: %@", v5, v6, v7, v8, 2u);
}

- (void)existingCloudObjectForUserSpecificRecordID:createPlaceholderIfNecessary:accountID:context:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_1(v0, v1), "ic_loggingDescription");
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v3, v4, "Creating placeholder object from user-specific record in account ID %@: %@", v5, v6, v7, v8, 2u);
}

- (void)existingCloudObjectForUserSpecificRecordID:createPlaceholderIfNecessary:accountID:context:.cold.3()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_1(v0, v1), "ic_loggingDescription");
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v3, v4, "User-specific record synced for class that doesn't support user-specific records in account ID %@: %@", v5, v6, v7, v8, 2u);
}

- (void)addFetchOperationsForRecordIDs:(void *)a1 accountID:qualityOfService:operationGroupName:completionHandler:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v1, v2, "Adding operations to fetch %ld records", v3, v4, v5, v6, v7);
}

- (void)operationsToFetchRecordIDs:qualityOfService:operationGroupName:accountID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Account ID is required to create fetch record operations.", v2, v3, v4, v5, v6);
}

- (void)operationsToFetchRecordIDs:qualityOfService:operationGroupName:accountID:.cold.2()
{
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_31_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, v3, (uint64_t)v3, "Fetching records with operation group %@", v4);
}

- (void)operationToFetchRecordIDs:database:qualityOfService:.cold.1()
{
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_31_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, v3, (uint64_t)v3, "Creating %@", v4);
}

void __72__ICCloudContext_fetchOperation_didCompleteWithRecordsByRecordID_error___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_16(a1), "ic_loggingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Finished %@", v4, v5, v6, v7, v8);
}

void __72__ICCloudContext_fetchOperation_didCompleteWithRecordsByRecordID_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_12();
  objc_msgSend((id)OUTLINED_FUNCTION_16(v1), "ic_loggingDescription");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Error fetching %@: %@", v4, v5, v6, v7, v8);
}

- (void)didFetchShare:(void *)a1 accountID:(void *)a2 context:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 recordID];
  uint64_t v6 = objc_msgSend(v5, "ic_loggingDescription");
  uint64_t v7 = [a2 recordType];
  uint8_t v8 = [a2 recordID];
  id v9 = objc_msgSend(v8, "ic_loggingDescription");
  int v10 = 138412802;
  id v11 = v6;
  __int16 v12 = 2112;
  char v13 = v7;
  OUTLINED_FUNCTION_14_0();
  _os_log_debug_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_DEBUG, "Received share %@ for %@ %@", (uint8_t *)&v10, 0x20u);
}

- (void)didFetchShare:accountID:context:.cold.2()
{
  OUTLINED_FUNCTION_12();
  uint64_t v2 = objc_msgSend(v1, "ic_loggingDescription");
  uint64_t v3 = objc_msgSend(v0, "ic_loggingDescription");
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v4, v5, "No root record type in share %@ for %@", v6, v7, v8, v9, 2u);
}

void __72__ICCloudContext_pushCloudObjects_operationGroupName_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_28_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error pushing cloud objects for account ID %@", v2, v3, v4, v5, v6);
}

void __59__ICCloudContext_deleteSharesForObjects_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_28_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error deleting shares for objects in account ID %@", v2, v3, v4, v5, v6);
}

- (void)deleteSharesForObjects:accountID:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  [v0 count];
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v1, v2, "Will delete shares in account ID %@ for %lu objects", v3, v4, v5, v6, 2u);
}

void __69__ICCloudContext_deleteSharesForObjects_accountID_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 shortLoggingDescription];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v3, v4, "Will delete share in account ID %@ for %@", v5, v6, v7, v8, 2u);
}

- (void)operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Account ID is required to create operations.", v2, v3, v4, v5, v6);
}

- (void)operationsToModifyRecordsForCloudObjectsToSave:(uint64_t)a3 delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:.cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_18_0((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_9_4(&dword_1C3A61000, v6, v4, "Modifying records with operation group %@ for account ID %@", v5);
}

- (void)operationsToModifyRecordsForCloudObjectsToSave:(uint64_t)a3 delete:(NSObject *)a4 deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:.cold.3(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 134218242;
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_9_4(&dword_1C3A61000, a4, a3, "Grouping modify operations into %ld batches for account ID %@", (uint8_t *)a2);
}

- (void)operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:.cold.4()
{
  OUTLINED_FUNCTION_12();
  [v0 count];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v1, v2, "Creating operations to delete %ld share records for account ID %@", v3, v4, v5, v6, v7);
}

- (void)operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:.cold.5()
{
  OUTLINED_FUNCTION_12();
  [v0 count];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v1, v2, "Creating operations to delete %ld records for account ID %@", v3, v4, v5, v6, v7);
}

- (void)operationsToModifyRecordsForCloudObjectsToSave:delete:deleteShares:saveUserSpecificRecords:operationGroupName:addDependencies:accountID:.cold.6()
{
  OUTLINED_FUNCTION_12();
  [v0 count];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v1, v2, "Creating operations to push %ld records for account ID %@", v3, v4, v5, v6, v7);
}

+ (void)batchRecordsToSave:(os_log_t)log delete:maxRecordCountPerBatch:maxRecordSizePerBatch:withBlock:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Ending batch because we've reached maxRecordCountPerBatch", buf, 2u);
}

+ (void)batchRecordsToSave:(os_log_t)log delete:maxRecordCountPerBatch:maxRecordSizePerBatch:withBlock:.cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Ending batch because we're out of records", buf, 2u);
}

+ (void)batchRecordsToSave:(uint64_t)a1 delete:(uint64_t)a2 maxRecordCountPerBatch:maxRecordSizePerBatch:withBlock:.cold.3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_13_0(a1, a2), "recordID");
  OUTLINED_FUNCTION_23_0((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_9_3(&dword_1C3A61000, v3, v4, "Adding record to save batch: %@");
}

+ (void)batchRecordsToSave:(uint64_t)a1 delete:(uint64_t)a2 maxRecordCountPerBatch:maxRecordSizePerBatch:withBlock:.cold.4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_13_0(a1, a2), "recordID");
  OUTLINED_FUNCTION_23_0((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_33_0(&dword_1C3A61000, v3, v4, "Ending batch because an impossible batch was detected ICCloudContext: %@");
}

+ (void)batchRecordsToSave:(uint64_t)a1 delete:(uint64_t)a2 maxRecordCountPerBatch:maxRecordSizePerBatch:withBlock:.cold.5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_13_0(a1, a2), "recordID");
  OUTLINED_FUNCTION_23_0((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_9_3(&dword_1C3A61000, v3, v4, "Ending batch because record does not fit: %@");
}

- (void)operationToModifyRecordsToSave:(void *)a1 delete:rootRecordIDsByShareID:database:.cold.1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "ic_loggingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Creating modify operation %@", v4, v5, v6, v7, v8);
}

- (void)operationToModifyRecordsToSave:delete:rootRecordIDsByShareID:database:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, v0, v1, "About to create modify operation for database: %@", v2);
}

void __83__ICCloudContext_addCallbackBlocksToModifyRecordsOperation_rootRecordIDsByShareID___block_invoke_3_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "ic_loggingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_29(&dword_1C3A61000, v2, v3, "Progress pushing %@: %d%%", v4, v5, v6, v7, v8);
}

void __62__ICCloudContext_modifyRecordsOperation_didCompleteWithError___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_14(a1), "ic_loggingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Finished modify operation %@", v4, v5, v6, v7, v8);
}

void __62__ICCloudContext_modifyRecordsOperation_didCompleteWithError___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_12();
  objc_msgSend((id)OUTLINED_FUNCTION_14(v1), "ic_loggingDescription");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Error modifying records %@: %@", v4, v5, v6, v7, v8);
}

+ (void)sortedRecords:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_13_0(a1, a2), "recordID");
  OUTLINED_FUNCTION_23_0((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_33_0(&dword_1C3A61000, v3, v4, "Duplicate record ID after sorting in ICCloudContext — skipping {recordID: %@}");
}

+ (void)sortedRecords:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error topologically sorting records: %@", v2, v3, v4, v5, v6);
}

void __35__ICCloudContext_objectsByAccount___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_34(v1);
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = *(void **)(v0 + 32);
  id v4 = v2;
  uint64_t v5 = [v3 identifier];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v6, v7, "Ignoring this object that doesn't have an account id: %@, %@", v8, v9, v10, v11, 2u);
}

- (void)resetZoneForCloudAccount:withReason:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_FAULT, "Cannot reset zone for non-CloudKit account {account: %@}", v1, 0xCu);
}

void __54__ICCloudContext_resetZoneForCloudAccount_withReason___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_FAULT, "Error deleting zone records {error: %@, account: %@}", v1, 0x16u);
}

- (void)operationToSaveZonesForZoneIDs:accountID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Trying to create operationToSaveZonesForZoneIDs with empty accountID.", v2, v3, v4, v5, v6);
}

void __59__ICCloudContext_operationToSaveZonesForZoneIDs_accountID___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_16(a1), "ic_loggingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Saved record zones %@", v4, v5, v6, v7, v8);
}

void __59__ICCloudContext_operationToSaveZonesForZoneIDs_accountID___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_12();
  objc_msgSend((id)OUTLINED_FUNCTION_16(v1), "ic_loggingDescription");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Error saving zones %@: %@", v4, v5, v6, v7, v8);
}

void __40__ICCloudContext_contextDidSaveOrMerge___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_26(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, v0, v1, "Adding to objectIDsToProcess from a MOC save: %@", v2);
}

void __40__ICCloudContext_contextDidSaveOrMerge___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_26(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, v0, v1, "Removing deletedObjectIDs from list of objectIDsToProcess and objectIDsToRetry: %@", v2);
}

void __68__ICCloudContext_addOperationToProcessObjectsWithCompletionHandler___block_invoke_cold_1(uint64_t a1, char a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 134218240;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a2 & 1;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Adding process objects operation %p. allObjects=%d", buf, 0x12u);
}

void __68__ICCloudContext_addOperationToProcessObjectsWithCompletionHandler___block_invoke_2_cold_1(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Processing objects with operation %p", v4, v5, v6, v7, v8);
}

void __58__ICCloudContext__objectIDsToProcessForFullSyncInContext___block_invoke_cold_1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v1, v2, "Fetched %lu cloud objects to process", v3, v4, v5, v6, v7);
}

- (void)_processPendingCloudObjectsWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Not processing objects because the network isn't reachable", v2, v3, v4, v5, v6);
}

- (void)_processPendingCloudObjectsWithCompletionHandler:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 readinessLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Trying to process objects while not ready <%@>", v4, v5, v6, v7, v8);
}

- (void)_processPendingCloudObjectsWithCompletionHandler:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Trying to process objects with no CloudKit account", v2, v3, v4, v5, v6);
}

void __67__ICCloudContext__processPendingCloudObjectsWithCompletionHandler___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_14(a1) objectIDsToProcess];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Processing objectIDs: %@", v4, v5, v6, v7, v8);
}

void __67__ICCloudContext__processPendingCloudObjectsWithCompletionHandler___block_invoke_cold_3(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_14(a1) objectIDsToRetry];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Adding objectIDsToRetry to objectIDsToProcess: %@", v4, v5, v6, v7, v8);
}

- (void)_processCloudObjects:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Skipping processing of empty cloud objects.", v2, v3, v4, v5, v6);
}

void __57__ICCloudContext__processCloudObjects_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_12();
  [v0 count];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v1, v2, "Processing %lu cloud objects for accountID %@", v3, v4, v5, v6, v7);
}

- (void)handleCloudKitNotification:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Unsupported CloudKit notification type: %@", v5, 0xCu);
}

- (void)handleCloudKitNotification:(void *)a1 completionHandler:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_opt_class();
  id v5 = v4;
  uint64_t v6 = [a1 subscriptionID];
  int v8 = 138412546;
  uint64_t v9 = v4;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9_4(&dword_1C3A61000, a2, v7, "Received CloudKit notification %@ for subscription %@", (uint8_t *)&v8);
}

void __83__ICCloudContext_fetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_13_0(a1, a2), "ic_loggingDescription");
  OUTLINED_FUNCTION_23_0((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_9_3(&dword_1C3A61000, v3, v4, "Waiting for previous fetch zone changes operation to finish %@");
}

void __83__ICCloudContext_fetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_cold_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, v0, v1, "%@", v2);
}

void __98__ICCloudContext_addOperationsToFetchRecordZoneChangesForAccountZoneIDs_reason_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_13_0(a1, a2), "ic_loggingDescription");
  OUTLINED_FUNCTION_23_0((uint64_t)v2, 5.8381e-34);
  OUTLINED_FUNCTION_9_3(&dword_1C3A61000, v3, v4, "fetch record zone changes operation waiting for previous fetch zone changes operation to finish %{public}@");
}

- (void)operationsToFetchRecordZoneChangesForZoneIDs:accountID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Trying to populate operationsToFetchRecordZoneChangesForZoneIDs with empty accountID.", v2, v3, v4, v5, v6);
}

- (void)operationsToFetchRecordZoneChangesForZoneIDs:accountID:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_1(v0, v1), "ic_loggingDescription");
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v3, v4, "Fetching record zone changes with operation group in account ID %@: %@", v5, v6, v7, v8, 2u);
}

- (void)operationToFetchRecordZoneChangesForZoneIDs:database:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4_1(v0, v1), "ic_loggingDescription");
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v3, v4, "Found existing operation with identical zone options in account ID %@: %@", v5, v6, v7, v8, 2u);
}

- (void)newOperationToFetchRecordZoneChangesWithZoneConfigurations:(uint64_t)a3 database:.cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_18_0(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_9_4(&dword_1C3A61000, v6, v4, "Creating fetch changes operation in account ID %@: %@", v5);
}

void __67__ICCloudContext_fetchRecordZoneChangesOperationDidComplete_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v1 = objc_msgSend(*v0, "ic_loggingDescription");
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v2, v3, "Fetched zone changes in account ID %@: %@", v4, v5, v6, v7, 2u);
}

void __67__ICCloudContext_fetchRecordZoneChangesOperationDidComplete_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v1 = objc_msgSend(*v0, "ic_loggingDescription");
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v2, v3, "Fetch changes operation had partial failure in account ID %@: %@", v4, v5, v6, v7, 2u);
}

void __94__ICCloudContext_fetchRecordZoneChangesOperation_zoneID_accountID_changeTokenUpdated_context___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = objc_msgSend(*(id *)(v1 + 32), "ic_loggingDescription");
  uint64_t v3 = objc_msgSend(*(id *)(v0 + 40), "ic_loggingDescription");
  uint64_t v4 = objc_msgSend(*(id *)(v0 + 48), "ic_loggingDescription");
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1_3(&dword_1C3A61000, v5, v6, "Zone change token updated %@ %@ %@", v7, v8, v9, v10, 2u);
}

void __67__ICCloudContext_fetchDatabaseChangesWithReason_completionHandler___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, v0, v1, "Adding private and shared cloud databases for account: %@", v2);
}

void __76__ICCloudContext_fetchDatabaseChangesForDatabases_reason_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_31_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, v3, (uint64_t)v3, "Fetching database changes with operation group %@", v4);
}

- (void)operationToFetchDatabaseChangesForDatabase:(uint64_t)a3 completionHandler:.cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_18_0(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_9_4(&dword_1C3A61000, v6, v4, "Creating fetch database changes operation for account %@, %@", v5);
}

void __82__ICCloudContext_fetchDatabaseChangesOperation_recordZoneWithIDChanged_accountID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = objc_msgSend(*(id *)(v1 + 40), "ic_loggingDescription");
  uint64_t v3 = objc_msgSend(*(id *)(v0 + 48), "ic_loggingDescription");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_3(&dword_1C3A61000, v4, v5, "Zone changed for account %@, %@ %@", v6, v7, v8, v9, v10);
}

void __85__ICCloudContext_fetchDatabaseChangesOperation_recordZoneWithIDWasDeleted_accountID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = objc_msgSend(*(id *)(v1 + 40), "ic_loggingDescription");
  uint64_t v3 = objc_msgSend(*(id *)(v0 + 48), "ic_loggingDescription");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_3(&dword_1C3A61000, v4, v5, "Zone was deleted for account %@, %@ %@", v6, v7, v8, v9, v10);
}

void __85__ICCloudContext_fetchDatabaseChangesOperation_changeTokenUpdated_accountID_context___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = objc_msgSend(*(id *)(v1 + 40), "ic_loggingDescription");
  uint64_t v3 = objc_msgSend(*(id *)(v0 + 48), "ic_loggingDescription");
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_3(&dword_1C3A61000, v4, v5, "Database change token updated for account %@, %@ %@", v6, v7, v8, v9, v10);
}

void __120__ICCloudContext_fetchDatabaseChangesOperation_finishedWithServerChangeToken_accountID_error_completionHandler_context___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 48), "ic_loggingDescription");
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v2, v3, "Fetched database changes for account %@, %@", v4, v5, v6, v7, 2u);
}

void __120__ICCloudContext_fetchDatabaseChangesOperation_finishedWithServerChangeToken_accountID_error_completionHandler_context___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_12();
  objc_msgSend(*(id *)(v1 + 48), "ic_loggingDescription");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1_2(&dword_1C3A61000, v2, v3, "Error fetching database changes for account %@, %@: %@", v4, v5, v6, v7, 2u);
}

void __37__ICCloudContext_clearZoneFetchState__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Clearing zone fetch state", v2, v3, v4, v5, v6);
}

void __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_13_0(a1, a2), "subscriptionID");
  OUTLINED_FUNCTION_23_0((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_9_3(&dword_1C3A61000, v3, v4, "Not sure if subscribed to %@");
}

void __59__ICCloudContext_updateSubscriptionsWithCompletionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Updating subscriptions", v2, v3, v4, v5, v6);
}

void __66__ICCloudContext_fetchSubscriptionsForDatabase_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_31_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, v3, (uint64_t)v3, "Fetching subscriptions %@", v4);
}

void __66__ICCloudContext_fetchSubscriptionsForDatabase_completionHandler___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_16(a1), "ic_loggingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Fetched subscriptions %@", v4, v5, v6, v7, v8);
}

void __66__ICCloudContext_fetchSubscriptionsForDatabase_completionHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_12();
  objc_msgSend((id)OUTLINED_FUNCTION_16(v1), "ic_loggingDescription");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Error fetching subscriptions %@: %@", v4, v5, v6, v7, v8);
}

void __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  [(id)OUTLINED_FUNCTION_14(a1) databaseScope];
  uint64_t v3 = CKDatabaseScopeString();
  uint64_t v4 = [a2 subscriptionID];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v5, v6, "Not saving subscriptions for %@, already subscribed to %@", v7, v8, v9, v10, 2u);
}

void __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_18_0(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_9_4(&dword_1C3A61000, v7, v5, "Saving subscription %@ %@", v6);
}

void __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_16(a1), "ic_loggingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Saved subscriptions %@", v4, v5, v6, v7, v8);
}

void __65__ICCloudContext_saveSubscriptionsForDatabase_completionHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_12();
  objc_msgSend((id)OUTLINED_FUNCTION_16(v1), "ic_loggingDescription");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Error saving subscriptions %@: %@", v4, v5, v6, v7, v8);
}

void __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  [*v1 isInForeground];
  [*v0 isInternetReachable];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(*v0, "syncOnlyIfReachable"));
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_1_3(&dword_1C3A61000, v3, v4, "Updating cloud context state. %@ and internet %@. syncOnlyIfReachable: %@", v5, v6, v7, v8, 2u);
}

void __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Syncing enabled after updating account status", v2, v3, v4, v5, v6);
}

void __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_3_cold_1(uint64_t a1)
{
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_16(a1), "ic_loggingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Fetched user record %@", v4, v5, v6, v7, v8);
}

void __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_26(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Error fetching user record: %@", v2, v3, v4, v5, v6);
}

void __56__ICCloudContext_updateCloudContextStateWithCompletion___block_invoke_580_cold_1(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Syncing account (%@) due to missing change tokens", v4, v5, v6, v7, v8);
}

void __74__ICCloudContext_enqueueLongLivedOperationsIfNeededWithCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_34(v0), "ic_loggingDescription");
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Cannot fetch all long-lived operation IDs {container: %@, error: %@}", v4, v5, v6, v7, v8);
}

void __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_16(v0), "ic_loggingDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v2, v3, "Not adding long-lived operation because it's completed or canceled {container: %@, operationID: %@}", v4, v5, v6, v7, v8);
}

void __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_16(v0), "ic_loggingDescription");
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v2, v3, "Not adding long-lived operation because it's already queued {container: %@, operation: %@}", v4, v5, v6, v7, v8);
}

void __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_16(v0), "ic_loggingDescription");
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v2, v3, "Not adding long-lived operation because it's been added since launch {container: %@, operation: %@}", v4, v5, v6, v7, v8);
}

void __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_16(v0), "ic_loggingDescription");
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v2, v3, "Adding long-lived operation back to the queue {container: %@, operation: %@}", v4, v5, v6, v7, v8);
}

void __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = objc_msgSend((id)OUTLINED_FUNCTION_16(v0), "ic_loggingDescription");
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v2, v3, "Not adding long-lived operation because it's not a modify operation {container: %@, operation: %@}", v4, v5, v6, v7, v8);
}

void __88__ICCloudContext_enqueueLongLivedOperationsWithIDsIfNeeded_container_completionHandler___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = objc_msgSend(*(id *)(v0 + 40), "ic_loggingDescription");
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_2(&dword_1C3A61000, v2, v3, "Cannot fetch long-lived operation {container: %@, operationID: %@, error: %@}", v4, v5, v6, v7, v8);
}

void __50__ICCloudContext_clearRetryCountForOperationType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_28_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, v0, v1, "Clearing retry count for %@", v2);
}

void __54__ICCloudContext_startRetryTimerIfNecessaryWithError___block_invoke_cold_1(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 134217984;
  double v5 = a2;
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, a1, a4, "Using backoff time for retry (%.0fs)", (uint8_t *)&v4);
}

void __54__ICCloudContext_startRetryTimerIfNecessaryWithError___block_invoke_cold_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, v0, v1, "Starting a retry timer if necessary for error: %@", v2);
}

void __44__ICCloudContext_retryOperationsIfNecessary__block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_14(a1) readinessLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Retry timer fired, but we're not ready to sync: %@", v4, v5, v6, v7, v8);
}

void __44__ICCloudContext_retryOperationsIfNecessary__block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1C3A61000, v0, v1, "Retry timer fired, but we have no internet connection", v2, v3, v4, v5, v6);
}

void __88__ICCloudContext_saveServerChangeToken_forRecordZoneID_databaseScope_accountID_context___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Trying to save server change token without an account", v2, v3, v4, v5, v6);
}

void __83__ICCloudContext_serverChangeTokenForRecordZoneID_databaseScope_accountID_context___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_26(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Couldn't find account to obtain server change token with account ID: %@", v2, v3, v4, v5, v6);
}

- (void)deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:context:.cold.1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = objc_msgSend(v0, "ic_loggingDescription");
  uint64_t v2 = CKDatabaseScopeString();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1C3A61000, v3, v4, "Deleting server change token for %@ %@", v5, v6, v7, v8, 2u);
}

@end