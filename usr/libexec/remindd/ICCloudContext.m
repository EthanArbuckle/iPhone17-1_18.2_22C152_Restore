@interface ICCloudContext
+ (BOOL)_performLocalObjectMergeWithEligibleObjectIDs:(id)a3 cloudKitAccount:(id)a4 managedObjectContext:(id)a5 error:(id *)a6;
+ (BOOL)conformsToRDICCloudContextCryptoStringProviding;
+ (BOOL)haveZoneIDsInAccountZoneIDs:(id)a3;
+ (BOOL)isNonUploadingTransactionAuthor:(id)a3;
+ (BOOL)isZoneConfigurations:(id)a3 subsetOfZoneConfigurations:(id)a4;
+ (id)_cloudObjectClassesByRecordType;
+ (id)_recordTypesToSortChildrenAfterFetch;
+ (id)_systemBuildVersion;
+ (id)allCloudObjectIDsOfClassesPassingTest:(id)a3 inContext:(id)a4;
+ (id)allDirtyCloudObjectIDsInContext:(id)a3;
+ (id)appZoneID;
+ (id)babysittableWaiterID;
+ (id)base64EncodedHMACStringFromString:(id)a3 usingSalt:(id)a4;
+ (id)deduplicatedRecordsForCloudObjects:(id)a3;
+ (id)errorForDisabledCloudSyncing;
+ (id)errorFromErrors:(id)a3;
+ (id)errorFromOperations:(id)a3;
+ (id)errorsFromError:(id)a3;
+ (id)filterNonUploadableChangedManagedObjectIDs:(id)a3 cloudKitStoreIdentifiers:(id)a4;
+ (id)metadataZoneID;
+ (id)migrationZoneID;
+ (id)objectsByAccount:(id)a3;
+ (id)objectsByDatabaseScope:(id)a3;
+ (id)processingQueue;
+ (id)sortedRecords:(id)a3;
+ (id)userRecordNameForContainer:(id)a3;
+ (id)zoneIDsFromZoneInfos:(id)a3;
+ (id)zoneInfosFromZoneIDs:(id)a3;
+ (void)addRunExclusivelyOperations:(id)a3 operationQueue:(id)a4;
+ (void)batchRecordsToSave:(id)a3 delete:(id)a4 maxRecordCountPerBatch:(unint64_t)a5 maxRecordSizePerBatch:(unint64_t)a6 withBlock:(id)a7;
+ (void)errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessaryForOperationQueue:(id)a3;
+ (void)faultAndPromptToFileRadarWithICTap2RadarType:(unint64_t)a3 logMessage:(id)a4;
+ (void)faultAndPromptToFileRadarWithICTap2RadarType:(unint64_t)a3 title:(id)a4 description:(id)a5 logMessage:(id)a6;
+ (void)promptToFileRadarWithICTap2RadarType:(unint64_t)a3 title:(id)a4 description:(id)a5 logMessage:(id)a6 additionalFaultMessage:(BOOL)a7;
+ (void)recursivelyFixCrossZoneRelationship:(id)a3 perObjectHandler:(id)a4;
+ (void)saveAndFaultIfFailWithContext:(id)a3 shouldTakeServerAsTruth:(BOOL)a4 logDescription:(id)a5;
- (APSConnection)apsConnection;
- (BOOL)_generateAndSavePersonIDSaltIfNeeded:(id)a3;
- (BOOL)_isCloudKitAccountAvailableWithManagedObjectContext:(id)a3 requireActive:(BOOL)a4;
- (BOOL)_isRecognizedCloudObjectClass:(id)a3;
- (BOOL)canRetryImmediatelyAfterError:(id)a3;
- (BOOL)didAddObservers;
- (BOOL)didCheckForLongLivedOperations;
- (BOOL)fetchOperationsPending;
- (BOOL)hasPassedBuddy;
- (BOOL)hasPendingOperations;
- (BOOL)hasRetryTimer;
- (BOOL)isCloudKitAccountAvailable;
- (BOOL)isCloudKitAccountAvailableRequiringActive:(BOOL)a3;
- (BOOL)isDisabled;
- (BOOL)isDisabledInternal;
- (BOOL)isFetchingAllRecordZones;
- (BOOL)isFetchingEnabled;
- (BOOL)isInForeground;
- (BOOL)isInternetReachable;
- (BOOL)isReadyToSync;
- (BOOL)isReadyToSyncWithActiveAccountAvailable:(BOOL)a3;
- (BOOL)isSystemAvailableForSyncing;
- (BOOL)needsToMergeLocalObjects;
- (BOOL)needsToProcessAllDirtyObjects;
- (BOOL)needsToUpdateCloudContextOnAccountsDidChange;
- (BOOL)needsToUpdateSubscriptions;
- (BOOL)notificationContainsCloudContextInternalChangesOnly:(id)a3;
- (BOOL)partialError:(id)a3 containsErrorCode:(int64_t)a4;
- (BOOL)pendingAccountInitializerCompleteOnLaunch;
- (BOOL)retryPerformingCloudSchemaCatchUpSync;
- (BOOL)shouldIgnoreErrorForBackoffTimer:(id)a3 operationType:(id)a4;
- (BOOL)shouldPollCloudKitWhenLaunchingAndBackgrounding;
- (BOOL)shouldUnregisterBuddy;
- (BOOL)supportsCloudKitSyncing;
- (BOOL)syncDisabledByServer;
- (BOOL)uploadSuspended;
- (BOOL)wasInternetReachable;
- (DADBuddyStateObserver)buddyStateObserver;
- (ICCloudContext)contextWithQueryGenerationTokenEnabled:(BOOL)a3;
- (ICCloudContext)initWithStoreController:(id)a3;
- (ICCloudContextDelegate)cloudContextDelegate;
- (ICCloudContextSyncMetrics)lastSyncMetrics;
- (ICCloudSchemaCatchUpSyncController)cloudSchemaCatchUpSyncController;
- (ICSelectorDelayer)pollingSelectorDelayer;
- (ICSelectorDelayer)processingSelectorDelayer;
- (ICUserDefaults)icUserDefaults;
- (NSDate)subscribedSubscriptionIDsLastModifiedDate;
- (NSDictionary)accountStatusNumberByAccountID;
- (NSDictionary)cloudObjectClassesByRecordType;
- (NSDictionary)containersByAccountID;
- (NSDictionary)subscribedSubscriptionIDsByAccountID;
- (NSMutableDictionary)accountZoneIDsFetchingChanges;
- (NSMutableDictionary)accountZoneIDsNeedingFetchChanges;
- (NSMutableDictionary)accountZoneIDsNeedingToBeSaved;
- (NSMutableDictionary)databaseScopeStringsNeedingRetryFetchChangesByAccountID;
- (NSMutableDictionary)recognizedCloudObjectClasses;
- (NSMutableDictionary)retryCountsByOperationType;
- (NSMutableSet)objectIDsToProcess;
- (NSMutableSet)objectIDsToRetry;
- (NSNotificationCenter)unitTest_notificationCenter;
- (NSOperationQueue)operationQueue;
- (NSString)apsTopic;
- (NSTimer)retryTimer;
- (OS_dispatch_queue)processingQueue;
- (RDAccountInitializerDidCompleteInitializeAllAccountsObserver)accountInitializerDidCompleteOnAccountsDidChangeObserver;
- (RDAccountInitializerDidCompleteInitializeAllAccountsObserver)accountInitializerDidCompleteOnLaunchObserver;
- (RDAccountPersonIDSaltObserver)accountPersonIDSaltObserver;
- (RDStoreController)storeController;
- (REMAppleAccountUtilities)appleAccountUtilities;
- (_TtC7remindd21RDDebouncerWithNumber)accountChangedNotificationHandlingDebouncer;
- (_TtC7remindd37RDDebouncerWithCKDatabaseNotification)apsNotificationHandlingDebouncer;
- (double)lastSyncSinceInternetReachable;
- (double)timeIntervalToRetryAfterFromError:(id)a3;
- (double)timeoutIntervalForResource;
- (id)_existingCloudDirtyToken;
- (id)_markCloudAsDirtyAndReturnToken;
- (id)accountIDForDatabase:(id)a3;
- (id)accountStatusByAccountIDDescription;
- (id)allDirtyCloudObjectIDsInContext:(id)a3;
- (id)allZoneIDs;
- (id)batchFetchHelperWithContext:(id)a3;
- (id)cloudKitAccountsInContext:(id)a3;
- (id)configurationDump;
- (id)containerAccountIDsDescription;
- (id)containerForAccountID:(id)a3;
- (id)context;
- (id)contextForAccountID:(id)a3 withBatchFetchHelper:(BOOL)a4;
- (id)debug_replaceWithSimulatedCKErrorIfSetWithOriginalError:(id)a3;
- (id)errorCodesToIgnoreForBackoffTimer;
- (id)existingCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5;
- (id)existingCloudObjectForRecordID:(id)a3 recordType:(id)a4 accountID:(id)a5 context:(id)a6;
- (id)fetchAndCompletionOperationWithDeleteShareObjects:(id)a3 accountID:(id)a4 dependencyOperations:(id)a5 completionHandler:(id)a6;
- (id)fetchUserRecordOperationWithAccountID:(id)a3 completionHandler:(id)a4;
- (id)fetchUserRecordOperationWithContainer:(id)a3 completionHandler:(id)a4;
- (id)internalContextWithBatchFetchHelper;
- (id)mergeLocalObjectsFetchContextAffectingStoreOf:(id)a3;
- (id)mergeLocalObjectsWriteContextAffectingStoreOf:(id)a3;
- (id)newBackgroundContext;
- (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5;
- (id)newOperationToFetchRecordZoneChangesWithZoneConfigurations:(id)a3 database:(id)a4 reason:(id)a5;
- (id)newPlaceholderObjectForRecordID:(id)a3 account:(id)a4 recordType:(id)a5 context:(id)a6;
- (id)operationToFetchDatabaseChangesForDatabase:(id)a3 cloudSchemaCatchUpSyncContextMap:(id)a4 completionHandler:(id)a5;
- (id)operationToFetchRecordIDs:(id)a3 database:(id)a4;
- (id)operationToFetchRecordZoneChangesForZoneIDs:(id)a3 database:(id)a4 reason:(id)a5 ignoreServerChangeTokens:(BOOL)a6;
- (id)operationToModifyRecordsToSave:(id)a3 delete:(id)a4 rootRecordIDsByShareID:(id)a5 database:(id)a6;
- (id)operationToSaveZonesForZoneIDs:(id)a3 accountID:(id)a4;
- (id)operationToSaveZonesIfNecessaryForAccountID:(id)a3;
- (id)operationsToFetchRecordIDs:(id)a3 database:(id)a4;
- (id)operationsToFetchRecordIDs:(id)a3 operationGroupName:(id)a4 accountID:(id)a5;
- (id)operationsToFetchRecordZoneChangesForZoneIDs:(id)a3 accountID:(id)a4 reason:(id)a5 cloudSchemaCatchUpSyncContextMap:(id)a6;
- (id)operationsToModifyRecordsForCloudObjectsToSave:(id)a3 delete:(id)a4 deleteShares:(id)a5 operationGroupName:(id)a6 addDependencies:(BOOL)a7 accountID:(id)a8;
- (id)operationsToModifyRecordsToSave:(id)a3 delete:(id)a4 rootRecordIDsByShareID:(id)a5 database:(id)a6;
- (id)primaryCloudKitAccountInContext:(id)a3;
- (id)readinessLoggingDescription;
- (id)retryCountFetchDatabaseChangesOperationTypeForAccountID:(id)a3 dataScopeString:(id)a4;
- (id)serverChangeTokenContext;
- (id)serverChangeTokenForChangedZonesInDatabase:(id)a3 accountID:(id)a4;
- (id)serverChangeTokenForRecordZoneID:(id)a3 databaseScope:(int64_t)a4 accountID:(id)a5;
- (id)setUpCloudSchemaCatchUpSyncContextMapWithAccountIDs:(id)a3 syncReason:(id)a4;
- (id)setUpCloudSchemaCatchUpSyncContextMapWithAccountIDs:(id)a3 syncReason:(id)a4 outBackgroundScheduledCatchUpSyncContextMap:(id)a5;
- (id)status;
- (id)subscriptionForDatabase:(id)a3;
- (id)unitTest_accountStatusNumberForAccountID:(id)a3;
- (id)unitTest_contextWithBatchFetchHelperForAccountID:(id)a3;
- (id)unsafeUntilSystemReady_hashedAccountPersonIDForAccount:(id)a3 usingSalt:(id)a4;
- (id)waiterID;
- (int64_t)accountStatusFromAccountStatusNumber:(id)a3;
- (int64_t)qualityOfService;
- (os_unfair_lock_s)accountInitializerDidCompleteOnAccountsDidChangeObserverLock;
- (os_unfair_lock_s)containersByAccountIDLock;
- (void)_accountsDidEnableOrDisable;
- (void)_addOperationToProcessBlockWithOperationName:(id)a3 processBlock:(id)a4;
- (void)_clearCloudDirtyForToken:(id)a3;
- (void)_handleDatabaseNotification:(id)a3 database:(id)a4 accountID:(id)a5 completionHandler:(id)a6;
- (void)_performSortingChildrenObjectsAfterFetchingInBlockOfManagedObjectContext:(id)a3 fetchHasFullyCompleted:(BOOL)a4 accountID:(id)a5;
- (void)_processCloudObjectIDs:(id)a3 operationQueue:(id)a4 completionHandler:(id)a5;
- (void)_processFetchedCloudObjectsWithObjectIDs:(id)a3 usingBlock:(id)a4;
- (void)_processFetchedCloudObjectsWithObjectIDs:(id)a3 withManagedObjectContext:(id)a4 usingBlock:(id)a5;
- (void)_scheduleRetryMergeLocalObjects;
- (void)_syncWithReason:(id)a3 completionHandler:(id)a4;
- (void)accountsDidDisable;
- (void)accountsDidEnable;
- (void)addCallbackBlocksToModifyRecordsOperation:(id)a3 rootRecordIDsByShareID:(id)a4;
- (void)addDependenciesForModifyRecordsOperation:(id)a3;
- (void)addFetchOperationsForRecordIDs:(id)a3 accountID:(id)a4 operationGroupName:(id)a5 runExclusively:(BOOL)a6 completionHandler:(id)a7;
- (void)addOperationToProcessObjectsWithOperationName:(id)a3 syncReason:(id)a4 completionHandler:(id)a5;
- (void)addOperationsToFetchRecordZoneChangesForAccountZoneIDs:(id)a3 reason:(id)a4 cloudSchemaCatchUpSyncContextMap:(id)a5 completionHandler:(id)a6;
- (void)addProcessLocalObjectsOperationToMergeLocalObjectsWithCompletionHandler:(id)a3;
- (void)addStateHandler;
- (void)addStateHandlerWithName:(const char *)a3 stateBlock:(id)a4;
- (void)addSubscribedSubscriptionIDs:(id)a3 accountID:(id)a4;
- (void)adjustAPSNotificationDebouncerInterval;
- (void)adjustAPSNotificationDebouncerIntervalWithMigrationState:(BOOL)a3;
- (void)applicationWillEnterForeground;
- (void)bootstrapSyncingOnLaunchIfSystemReady;
- (void)cancelEverythingWithCompletionHandler:(id)a3;
- (void)checkForLongLivedOperations;
- (void)clearContainers;
- (void)clearPendingActivity;
- (void)clearRetryCountForOperationType:(id)a3;
- (void)clearSubscribedSubscriptionIDs;
- (void)clearZoneFetchState;
- (void)cloudKitAccountChanged:(id)a3;
- (void)configureOperation:(id)a3;
- (void)connection:(id)a3 didFailToSendOutgoingMessage:(id)a4 error:(id)a5;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)contextDidSave:(id)a3;
- (void)dealloc;
- (void)debug_retryAccountZoneIDsNeedingToBeSavedWithZoneID:(id)a3 accountID:(id)a4;
- (void)deleteAllApplicationDataFromServerWithAccountID:(id)a3 completion:(id)a4;
- (void)deleteAllServerChangeTokens;
- (void)deleteRecordZonesWithZoneIDs:(id)a3 accountID:(id)a4 markZonesAsUserPurged:(BOOL)a5 completionHandler:(id)a6;
- (void)deleteServerChangeTokenForChangedZonesInDatabase:(id)a3 accountID:(id)a4;
- (void)deleteServerChangeTokenForRecordZoneID:(id)a3 databaseScope:(int64_t)a4 accountID:(id)a5;
- (void)deleteSharesForObjects:(id)a3 accountID:(id)a4 completionHandler:(id)a5;
- (void)deleteSharesForObjects:(id)a3 completionHandler:(id)a4;
- (void)didCompleteCloudSchemaCatchUpSyncWithContextMap:(id)a3 error:(id)a4 syncTypeLabel:(id)a5 debugLogLabel:(id)a6;
- (void)didCompleteInitializeAllAccounts:(id)a3;
- (void)didFetchShare:(id)a3 accountID:(id)a4 context:(id)a5;
- (void)disableCloudSyncingIfCurrentVersionNotSuppported;
- (void)errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary;
- (void)fetchDatabaseChangesForDatabases:(id)a3 reason:(id)a4 cloudSchemaCatchUpSyncContextMap:(id)a5 completionHandler:(id)a6;
- (void)fetchDatabaseChangesOperation:(id)a3 changeTokenUpdated:(id)a4 accountID:(id)a5;
- (void)fetchDatabaseChangesOperation:(id)a3 finishedWithServerChangeToken:(id)a4 accountID:(id)a5 error:(id)a6 completionHandler:(id)a7;
- (void)fetchDatabaseChangesOperation:(id)a3 recordZoneWithIDChanged:(id)a4 accountID:(id)a5;
- (void)fetchDatabaseChangesOperation:(id)a3 recordZoneWithIDWasDeleted:(id)a4 accountID:(id)a5;
- (void)fetchDatabaseChangesWithReason:(id)a3 cloudSchemaCatchUpSyncContextMap:(id)a4 completionHandler:(id)a5;
- (void)fetchOperation:(id)a3 didCompleteWithRecordsByRecordID:(id)a4 error:(id)a5;
- (void)fetchOperation:(id)a3 progressChangedWithRecordID:(id)a4 progress:(double)a5;
- (void)fetchOperation:(id)a3 recordWasFetchedWithRecordID:(id)a4 record:(id)a5 error:(id)a6;
- (void)fetchRecordIDs:(id)a3 accountID:(id)a4 operationGroupName:(id)a5 runExclusively:(BOOL)a6 completionHandler:(id)a7;
- (void)fetchRecordZoneChangesForAccountZoneIDs:(id)a3 reason:(id)a4 cloudSchemaCatchUpSyncContextMap:(id)a5 completionHandler:(id)a6;
- (void)fetchRecordZoneChangesForZoneIDs:(id)a3 accountID:(id)a4 reason:(id)a5 completionHandler:(id)a6;
- (void)fetchRecordZoneChangesOperation:(id)a3 completedFetchForZoneID:(id)a4 serverChangeToken:(id)a5 batchFetchHelper:(id)a6 error:(id)a7;
- (void)fetchRecordZoneChangesOperation:(id)a3 recordWasChangedWithRecordID:(id)a4 record:(id)a5 error:(id)a6 context:(id)a7;
- (void)fetchRecordZoneChangesOperation:(id)a3 recordWasDeletedWithRecordID:(id)a4 recordType:(id)a5 context:(id)a6;
- (void)fetchRecordZoneChangesOperation:(id)a3 zoneID:(id)a4 accountID:(id)a5 changeTokenUpdated:(id)a6 batchFetchHelper:(id)a7;
- (void)fetchRecordZoneChangesOperationDidComplete:(id)a3 error:(id)a4;
- (void)fetchRecordZoneChangesWithReason:(id)a3 cloudSchemaCatchUpSyncContextMap:(id)a4 completionHandler:(id)a5;
- (void)fetchSubscriptionsForDatabase:(id)a3 completionHandler:(id)a4;
- (void)fetchUserRecordWithAccountID:(id)a3 completionHandler:(id)a4;
- (void)fetchUserRecordWithContainer:(id)a3 completionHandler:(id)a4;
- (void)finishOperationsForRecordID:(id)a3 completionHandler:(id)a4;
- (void)firePollingSyncRequest;
- (void)handleDatabaseNotification:(id)a3 completionHandler:(id)a4;
- (void)handleGenericPartialFailuresForError:(id)a3 operation:(id)a4;
- (void)handleNotification:(id)a3 completionHandler:(id)a4;
- (void)handleUnrecoverableError;
- (void)incrementOrClearRetryCountForOperationType:(id)a3 error:(id)a4;
- (void)incrementRetryCountForOperationType:(id)a3;
- (void)loadSubscribedSubscriptionIDs;
- (void)loadZoneFetchState;
- (void)migrationStateDidChange:(BOOL)a3 didFinishMigration:(BOOL)a4;
- (void)modifyRecordsOperation:(id)a3 didCompleteWithError:(id)a4;
- (void)modifyRecordsOperation:(id)a3 recordWasDeletedWithRecordID:(id)a4 rootRecordIDsByShareID:(id)a5 onProcessingQueue:(BOOL)a6 error:(id)a7;
- (void)modifyRecordsOperation:(id)a3 recordWasSavedWithRecordID:(id)a4 record:(id)a5 context:(id)a6 onProcessingQueue:(BOOL)a7 error:(id)a8;
- (void)observePrimaryCloudKitAccountPersonIDSaltChanges;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)operationQueueFetchUserRecordWithAccountID:(id)a3 completionHandler:(id)a4;
- (void)performAndWaitContextWithBatchFetchHelperForAccountID:(id)a3 block:(id)a4;
- (void)pq_unregisterForBuddy;
- (void)primaryCloudKitAccountPersonIDSaltDidFailToSetWithError:(id)a3;
- (void)primaryCloudKitAccountPersonIDSaltDidSetWithSalt:(id)a3;
- (void)printOperationQueue;
- (void)processAllDirtyCloudObjectsWithSyncReason:(id)a3 completionHandler:(id)a4;
- (void)processLocalObjectMergeEligibleObjectIDs:(id)a3 operationQueue:(id)a4 completionHandler:(id)a5;
- (void)processObjectIDs:(id)a3 operationQueue:(id)a4 completionHandler:(id)a5;
- (void)processPendingCloudObjects;
- (void)processPendingCloudObjectsWithOperationName:(id)a3;
- (void)processPendingCloudObjectsWithOperationName:(id)a3 syncReason:(id)a4 completionHandler:(id)a5;
- (void)reachabilityChanged:(id)a3;
- (void)receivedZoneNotFound:(id)a3 operation:(id)a4;
- (void)registerForBuddy;
- (void)removeStaleAccountStatus;
- (void)removeStaleFetchDatabaseRetryMetadata;
- (void)retryOperationsIfNecessary;
- (void)retryProcessingCloudObjects;
- (void)saveServerChangeToken:(id)a3 forChangedZonesInDatabase:(id)a4 accountID:(id)a5;
- (void)saveServerChangeToken:(id)a3 forRecordZoneID:(id)a4 databaseScope:(int64_t)a5 accountID:(id)a6;
- (void)saveSubscriptionsForDatabase:(id)a3 completionHandler:(id)a4;
- (void)saveZoneFetchState;
- (void)setAccountChangedNotificationHandlingDebouncer:(id)a3;
- (void)setAccountInitializerDidCompleteOnAccountsDidChangeObserver:(id)a3;
- (void)setAccountInitializerDidCompleteOnAccountsDidChangeObserverLock:(os_unfair_lock_s)a3;
- (void)setAccountInitializerDidCompleteOnLaunchObserver:(id)a3;
- (void)setAccountPersonIDSaltObserver:(id)a3;
- (void)setAccountStatus:(int64_t)a3 forAccountID:(id)a4;
- (void)setAccountStatusNumberByAccountID:(id)a3;
- (void)setAccountZoneIDsFetchingChanges:(id)a3;
- (void)setAccountZoneIDsNeedingFetchChanges:(id)a3;
- (void)setAccountZoneIDsNeedingToBeSaved:(id)a3;
- (void)setAppleAccountUtilities:(id)a3;
- (void)setApsConnection:(id)a3;
- (void)setApsNotificationHandlingDebouncer:(id)a3;
- (void)setApsTopic:(id)a3;
- (void)setBuddyStateObserver:(id)a3;
- (void)setCloudContextDelegate:(id)a3;
- (void)setCloudSchemaCatchUpSyncController:(id)a3;
- (void)setContainersByAccountID:(id)a3;
- (void)setContainersByAccountIDLock:(os_unfair_lock_s)a3;
- (void)setDatabaseScopeStringsNeedingRetryFetchChangesByAccountID:(id)a3;
- (void)setDidAddObservers:(BOOL)a3;
- (void)setDidCheckForLongLivedOperations:(BOOL)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setDisabledInternal:(BOOL)a3;
- (void)setFetchingEnabled:(BOOL)a3;
- (void)setHasPassedBuddy:(BOOL)a3;
- (void)setHasRetryTimer:(BOOL)a3;
- (void)setIcUserDefaults:(id)a3;
- (void)setIsSystemAvailableForSyncing:(BOOL)a3;
- (void)setLastSyncMetrics:(id)a3;
- (void)setLastSyncSinceInternetReachable:(double)a3;
- (void)setMigrationStateToDidChooseToMigrate:(BOOL)a3 didFinishMigration:(BOOL)a4 createZoneAccountIfFinishMigration:(BOOL)a5 accountID:(id)a6 completionHandler:(id)a7;
- (void)setNeedsToMergeLocalObjects:(BOOL)a3;
- (void)setNeedsToProcessAllDirtyObjects:(BOOL)a3;
- (void)setNeedsToUpdateCloudContextOnAccountsDidChange:(BOOL)a3;
- (void)setNeedsToUpdateSubscriptions:(BOOL)a3;
- (void)setObjectIDsToProcess:(id)a3;
- (void)setObjectIDsToRetry:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPendingAccountInitializerCompleteOnLaunch:(BOOL)a3;
- (void)setPollingSelectorDelayer:(id)a3;
- (void)setProcessingQueue:(id)a3;
- (void)setProcessingSelectorDelayer:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRecognizedCloudObjectClasses:(id)a3;
- (void)setRetryCountsByOperationType:(id)a3;
- (void)setRetryTimer:(id)a3;
- (void)setShouldUnregisterBuddy:(BOOL)a3;
- (void)setSubscribedSubscriptionIDsByAccountID:(id)a3;
- (void)setSubscribedSubscriptionIDsLastModifiedDate:(id)a3;
- (void)setSupportsCloudKitSyncing:(BOOL)a3;
- (void)setSyncDisabledByServer:(BOOL)a3;
- (void)setTimeoutIntervalForResource:(double)a3;
- (void)setUnitTest_notificationCenter:(id)a3;
- (void)setUploadSuspended:(BOOL)a3;
- (void)setWasInternetReachable:(BOOL)a3;
- (void)setupAPSConnection;
- (void)sharedZoneWasDeleted:(id)a3 accountID:(id)a4;
- (void)startRetryTimerIfNecessaryWithError:(id)a3;
- (void)syncWithReason:(id)a3 discretionary:(BOOL)a4 completionHandler:(id)a5;
- (void)unobservePrimaryCloudKitAccountPersonIDSaltChanges;
- (void)updateAccountStatusWithCompletionHandler:(id)a3;
- (void)updateCloudContextStateWithReason:(id)a3;
- (void)updateCloudContextStateWithSyncOption:(int64_t)a3 syncReason:(id)a4 withCompletionHandler:(id)a5;
- (void)updateConfiguration;
- (void)updateSelectorDelayers;
- (void)updateSubscriptionsWithCompletionHandler:(id)a3;
- (void)updateUserRecordWithAccountID:(id)a3 updateFunction:(id)a4 completionHandler:(id)a5;
- (void)validateAccountZoneIDsNeedingFetchChanges;
@end

@implementation ICCloudContext

+ (id)processingQueue
{
  return +[RDDispatchQueue_ObjC utilityQueue];
}

- (ICCloudContext)initWithStoreController:(id)a3
{
  id v5 = a3;
  v74.receiver = self;
  v74.super_class = (Class)ICCloudContext;
  v6 = [(ICCloudContext *)&v74 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storeController, a3);
    v8 = objc_opt_new();
    [(ICCloudContext *)v7 setIcUserDefaults:v8];

    v9 = objc_opt_new();
    [(ICCloudContext *)v7 setOperationQueue:v9];

    v10 = [(ICCloudContext *)v7 operationQueue];
    [v10 setMaxConcurrentOperationCount:10];

    v11 = +[ICCloudContext processingQueue];
    [(ICCloudContext *)v7 setProcessingQueue:v11];

    v12 = +[NSMutableSet set];
    [(ICCloudContext *)v7 setObjectIDsToProcess:v12];

    v13 = +[NSMutableDictionary dictionary];
    [(ICCloudContext *)v7 setAccountZoneIDsNeedingToBeSaved:v13];

    v14 = +[NSMutableSet set];
    [(ICCloudContext *)v7 setObjectIDsToRetry:v14];

    v15 = +[NSMutableDictionary dictionary];
    [(ICCloudContext *)v7 setRetryCountsByOperationType:v15];

    v16 = [[ICCloudContextSyncMetrics alloc] initWithSyncReason:@"InitSyncMetrics"];
    [(ICCloudContext *)v7 setLastSyncMetrics:v16];

    [(ICCloudContext *)v7 setHasRetryTimer:0];
    v17 = +[NSMutableDictionary dictionary];
    [(ICCloudContext *)v7 setDatabaseScopeStringsNeedingRetryFetchChangesByAccountID:v17];

    [(ICCloudContext *)v7 setWasInternetReachable:+[ICUtilities isInternetReachable]];
    v18 = [(ICCloudContext *)v7 icUserDefaults];
    v19 = [v18 userDefaults];
    [v19 doubleForKey:@"CloudKitLastSyncSinceInternetReachable"];
    -[ICCloudContext setLastSyncSinceInternetReachable:](v7, "setLastSyncSinceInternetReachable:");

    v20 = +[ICSyncSettings sharedSettings];
    unsigned int v21 = [v20 hasOptions:16];

    unsigned int v22 = [v5 supportsSyncingToCloudKit];
    v23 = +[REMLog cloudkit];
    int v24 = v21 & v22;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      uint64_t v76 = v21 & v22;
      __int16 v77 = 2048;
      uint64_t v78 = v21;
      __int16 v79 = 2048;
      uint64_t v80 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "ICCloudContext INIT {supportsCloudKitSyncing: %ld, syncSettingsSupportsCloudKitSyncing: %ld, storeControllerSupportsCloudKitSyncing: %ld}", buf, 0x20u);
    }

    [(ICCloudContext *)v7 setSupportsCloudKitSyncing:v21 & v22];
    [(ICCloudContext *)v7 setShouldUnregisterBuddy:1];
    [(ICCloudContext *)v7 setDisabled:v24 ^ 1u];
    [(ICCloudContext *)v7 setDisabledInternal:0];
    [(ICCloudContext *)v7 setQualityOfService:17];
    [(ICCloudContext *)v7 setTimeoutIntervalForResource:0.0];
    v25 = +[ICSyncSettings sharedSettings];
    -[ICCloudContext setFetchingEnabled:](v7, "setFetchingEnabled:", [v25 hasOptions:0x80000]);

    [(ICCloudContext *)v7 setDidCheckForLongLivedOperations:0];
    v26 = [_TtC7remindd37RDDebouncerWithCKDatabaseNotification alloc];
    v27 = [(ICCloudContext *)v7 processingQueue];
    v28 = [(RDDebouncerWithCKDatabaseNotification *)v26 initWithDebouncingInterval:v27 queue:&stru_1008ADBC8 handler:15.0];
    [(ICCloudContext *)v7 setApsNotificationHandlingDebouncer:v28];

    v29 = +[ICCloudConfiguration sharedConfiguration];
    [v29 accountChangedDebouncerInterval];
    double v31 = v30;

    v32 = [_TtC7remindd21RDDebouncerWithNumber alloc];
    v33 = [(ICCloudContext *)v7 processingQueue];
    v34 = [(RDDebouncerWithNumber *)v32 initWithDebouncingInterval:v33 queue:&stru_1008ADBE8 handler:v31];
    [(ICCloudContext *)v7 setAccountChangedNotificationHandlingDebouncer:v34];

    [(ICCloudContext *)v7 loadZoneFetchState];
    v35 = +[NSNotificationCenter defaultCenter];
    v36 = [v5 persistentStoreCoordinator];
    [v35 addObserver:v7 selector:"contextDidSave:" name:NSManagedObjectContextDidSaveObjectIDsNotification object:v36];

    v37 = +[NSNotificationCenter defaultCenter];
    [v37 addObserver:v7 selector:"contextDidSave:" name:@"RDStoreControllerDidRemoveAccountStoresNotification" object:v5];

    v38 = +[NSMutableDictionary dictionary];
    [(ICCloudContext *)v7 setRecognizedCloudObjectClasses:v38];

    if (v24)
    {
      v39 = [v5 appleAccountUtilities];
      if (v39)
      {
        [(ICCloudContext *)v7 setAppleAccountUtilities:v39];
      }
      else
      {
        v40 = +[REMAppleAccountUtilities sharedInstance];
        [(ICCloudContext *)v7 setAppleAccountUtilities:v40];
      }
      v7->_containersByAccountIDLock._os_unfair_lock_opaque = 0;
      v41 = +[NSNotificationCenter defaultCenter];
      v42 = kReachabilityChangedNotification;
      v43 = +[ICReachability sharedReachabilityForInternetConnection];
      [v41 addObserver:v7 selector:"reachabilityChanged:" name:v42 object:v43];

      v44 = +[NSNotificationCenter defaultCenter];
      [v44 addObserver:v7 selector:"cloudKitAccountChanged:" name:CKAccountChangedNotification object:0];

      objc_initWeak((id *)buf, v7);
      [(ICCloudContext *)v7 setIsSystemAvailableForSyncing:0];
      v45 = +[REMLog cloudkit];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v73 = 0;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "os_transaction INIT {name: com.apple.remindd.cloudkit.launch.pending.DADSystemAvailabilityChecker}", v73, 2u);
      }

      v46 = (void *)os_transaction_create();
      v47 = dispatch_get_global_queue(17, 0);
      v48 = [(ICCloudContext *)v7 processingQueue];
      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472;
      v70[2] = sub_1000078C8;
      v70[3] = &unk_1008ADC10;
      objc_copyWeak(&v72, (id *)buf);
      id v49 = v46;
      id v71 = v49;
      +[DADSystemAvailabilityChecker waitForSyncEngineSystemAvailabilityBlockingQueue:v47 completionQueue:v48 completionBlock:v70];

      [(ICCloudContext *)v7 setPendingAccountInitializerCompleteOnLaunch:1];
      v50 = +[REMLog cloudkit];
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v73 = 0;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "os_transaction INIT {name: com.apple.remindd.cloudkit.launch.pending.RDAccountInitializerDidCompleteInitializeAllAccountsObserver}", v73, 2u);
      }

      v51 = (void *)os_transaction_create();
      v52 = [RDAccountInitializerDidCompleteInitializeAllAccountsObserver alloc];
      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472;
      v67[2] = sub_1000079C4;
      v67[3] = &unk_1008ADC38;
      objc_copyWeak(&v69, (id *)buf);
      id v53 = v51;
      id v68 = v53;
      v54 = [(ICCloudContext *)v7 processingQueue];
      v55 = [(RDAccountInitializerDidCompleteInitializeAllAccountsObserver *)v52 initWithHandler:v67 queue:v54];
      [(ICCloudContext *)v7 setAccountInitializerDidCompleteOnLaunchObserver:v55];

      v56 = +[REMLog cloudkit];
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v73 = 0;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "ICCC: Observing RDAccountInitializer.DidCompleteInitializeAllAccountsNotification on daemon launch before we enable syncing.", v73, 2u);
      }

      v57 = [(ICCloudContext *)v7 accountInitializerDidCompleteOnLaunchObserver];
      [v57 observe];

      v58 = +[NSNotificationCenter defaultCenter];
      [v58 addObserver:v7 selector:"updateConfiguration" name:@"ICCloudConfigurationChangedNotification" object:0];

      v59 = +[NSNotificationCenter defaultCenter];
      [v59 addObserver:v7 selector:"updateSelectorDelayers" name:@"ICCloudBatchIntervalDidChangeNotification" object:0];

      v60 = +[NSNotificationCenter defaultCenter];
      [v60 addObserver:v7 selector:"handleUnrecoverableError" name:@"ICCloudContextUnrecoverableErrorNotification" object:0];

      v61 = [(ICCloudContext *)v7 operationQueue];
      [v61 addObserver:v7 forKeyPath:@"operationCount" options:3 context:off_1009061C0];

      [(ICCloudContext *)v7 setDidAddObservers:1];
      v62 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100007AE4;
      block[3] = &unk_1008ADA80;
      v63 = v7;
      v66 = v63;
      dispatch_async(v62, block);

      v63->_accountInitializerDidCompleteOnAccountsDidChangeObserverLock._os_unfair_lock_opaque = 0;
      objc_destroyWeak(&v69);

      objc_destroyWeak(&v72);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [(ICCloudContext *)v7 setDidAddObservers:0];
      [(ICCloudContext *)v7 setIsSystemAvailableForSyncing:1];
    }
    [(ICCloudContext *)v7 addStateHandler];
    [(ICCloudContext *)v7 setBuddyStateObserver:0];
    [(ICCloudContext *)v7 setHasPassedBuddy:+[DADBuddyStateObserver hasPassedBuddy]];
    if (![(ICCloudContext *)v7 hasPassedBuddy]) {
      [(ICCloudContext *)v7 registerForBuddy];
    }
  }

  return v7;
}

- (void)bootstrapSyncingOnLaunchIfSystemReady
{
  if ([(ICCloudContext *)self isSystemAvailableForSyncing]
    && ![(ICCloudContext *)self pendingAccountInitializerCompleteOnLaunch])
  {
    objc_initWeak(&buf, self);
    dispatch_time_t v4 = dispatch_time(0, 2000000000);
    id v5 = [(ICCloudContext *)self processingQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007C9C;
    block[3] = &unk_1008ADAF0;
    objc_copyWeak(&v7, &buf);
    dispatch_after(v4, v5, block);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&buf);
  }
  else
  {
    v3 = +[REMLog cloudkit];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 67109376;
      HIDWORD(buf) = [(ICCloudContext *)self isSystemAvailableForSyncing];
      __int16 v9 = 1024;
      unsigned int v10 = [(ICCloudContext *)self pendingAccountInitializerCompleteOnLaunch];
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ICCC: bootstrapSyncingOnLaunchIfSystemReady: Not ready to bootstrap syncing yet {isSystemAvailableForSyncing=%d, pendingAccountInitializerCompleteOnLaunch=%d}", (uint8_t *)&buf, 0xEu);
    }
  }
}

- (void)registerForBuddy
{
  v3 = +[REMLog cloudkit];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not passed buddy. ICCC now registers for buddy.", (uint8_t *)buf, 2u);
  }

  id v4 = objc_alloc((Class)DADBuddyStateObserver);
  id v5 = [(ICCloudContext *)self processingQueue];
  id v6 = [v4 initWithQueue:v5];
  [(ICCloudContext *)self setBuddyStateObserver:v6];

  objc_initWeak(buf, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100007F28;
  v10[3] = &unk_1008ADAF0;
  objc_copyWeak(&v11, buf);
  id v7 = [(ICCloudContext *)self buddyStateObserver];
  [v7 setBuddyDidFinishHandler:v10];

  v8 = [(ICCloudContext *)self processingQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007FBC;
  v9[3] = &unk_1008ADA80;
  v9[4] = self;
  dispatch_sync(v8, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(buf);
}

- (void)pq_unregisterForBuddy
{
  v3 = [(ICCloudContext *)self processingQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(ICCloudContext *)self buddyStateObserver];

  if (v4)
  {
    id v5 = +[REMLog cloudkit];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ICCC now unregisters buddy observer.", v7, 2u);
    }

    id v6 = [(ICCloudContext *)self buddyStateObserver];
    [v6 stop];

    [(ICCloudContext *)self setBuddyStateObserver:0];
  }
}

- (id)unsafeUntilSystemReady_hashedAccountPersonIDForAccount:(id)a3 usingSalt:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  __int16 v9 = [v7 accountTypeHost];
  unsigned int v10 = [v9 isCloudKit];

  if (v10)
  {
    id v11 = [v7 identifier];
    v12 = [v11 UUIDString];

    if (v12)
    {
      v13 = [(ICCloudContext *)self appleAccountUtilities];
      v14 = [v13 unsafeUntilSystemReady_icloudACAccountMatchingAccountIdentifier:v12];

      v15 = [v14 aa_altDSID];
      if (v15)
      {
        v16 = +[REMUserDefaults daemonUserDefaults];
        unsigned int v17 = [v16 enableHashingUserIdentifiablesWithPersonIDSalt];

        id v18 = v15;
        if (v17)
        {
          objc_opt_class();
          if (objc_opt_respondsToSelector())
          {
            uint64_t v19 = [(id)objc_opt_class() base64EncodedHMACStringFromString:v18 usingSalt:v8];

            id v18 = (id)v19;
          }
          else
          {
            unsigned int v21 = +[REMLog cloudkit];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
              sub_1007494FC();
            }
          }
        }
      }
      else
      {
        v20 = +[REMLog cloudkit];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v23 = (objc_class *)objc_opt_class();
          int v24 = NSStringFromClass(v23);
          v25 = NSStringFromSelector(a2);
          v26 = +[NSString stringWithFormat:@"%@.%@", v24, v25];
          *(_DWORD *)id buf = 138543618;
          v28 = v26;
          __int16 v29 = 2114;
          double v30 = v12;
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Cannot proceed because aaAccount.aa_altDSID is nil {accountIdentifier: %{public}@}", buf, 0x16u);
        }
        id v18 = 0;
      }
    }
    else
    {
      v14 = +[REMLog cloudkit];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10074942C();
      }
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (void)primaryCloudKitAccountPersonIDSaltDidSetWithSalt:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    if ([(ICCloudContext *)self hasPassedBuddy]
      && [(ICCloudContext *)self isSystemAvailableForSyncing])
    {
      id v5 = [v4 base64EncodedStringWithOptions:0];
      id v6 = [(ICCloudContext *)self storeController];
      id v7 = [v6 newBackgroundContextWithAuthor:@"com.apple.remindd.ICCloudContext.setPersonID"];

      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000084F8;
      v10[3] = &unk_1008ADC60;
      id v11 = v7;
      v12 = self;
      id v13 = v4;
      id v14 = v5;
      id v8 = v5;
      __int16 v9 = v7;
      [v9 performBlockAndWait:v10];
    }
    else
    {
      __int16 v9 = +[REMLog cloudkit];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1007495CC();
      }
    }
  }
}

- (void)primaryCloudKitAccountPersonIDSaltDidFailToSetWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCloudContext *)self storeController];
  id v6 = [v5 newBackgroundContextWithAuthor:@"com.apple.remindd.ICCloudContext.setPersonID"];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000088BC;
  v9[3] = &unk_1008ADC88;
  id v10 = v6;
  id v11 = v4;
  id v7 = v4;
  id v8 = v6;
  [v8 performBlockAndWait:v9];
}

- (void)observePrimaryCloudKitAccountPersonIDSaltChanges
{
  v3 = [(ICCloudContext *)self accountPersonIDSaltObserver];

  if (v3)
  {
    id v4 = +[REMLog cloudkit];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = [(ICCloudContext *)self accountPersonIDSaltObserver];
      id v6 = [v5 uuid];
      *(_DWORD *)id buf = 138543362;
      unsigned int v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "ICCC is already observing primary CK account personIDSalt changes with RDAccountPersonIDSaltObserver {observer: %{public}@}", buf, 0xCu);
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100008DB8;
    v18[3] = &unk_1008ADCB0;
    objc_copyWeak(&v19, (id *)buf);
    v18[4] = self;
    id v7 = objc_retainBlock(v18);
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    id v14 = sub_100008F04;
    v15 = &unk_1008ADCD8;
    objc_copyWeak(&v17, (id *)buf);
    v16 = self;
    id v8 = objc_retainBlock(&v12);
    __int16 v9 = [(ICCloudContext *)self storeController];
    id v10 = [(ICCloudContext *)self processingQueue];
    id v11 = [v9 observePrimaryCloudKitAccountPersonIDSaltChangesOnQueue:v10 successHandler:v7 errorHandler:v8];
    [(ICCloudContext *)self setAccountPersonIDSaltObserver:v11];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

- (void)unobservePrimaryCloudKitAccountPersonIDSaltChanges
{
  v3 = [(ICCloudContext *)self accountPersonIDSaltObserver];

  if (v3)
  {
    id v4 = [(ICCloudContext *)self storeController];
    id v5 = [(ICCloudContext *)self accountPersonIDSaltObserver];
    [v4 unobservePrimaryCloudKitAccountPersonIDSaltChanges:v5];

    [(ICCloudContext *)self setAccountPersonIDSaltObserver:0];
  }
}

- (NSDictionary)containersByAccountID
{
  if ([(ICCloudContext *)self supportsCloudKitSyncing]
    && [(ICCloudContext *)self isSystemAvailableForSyncing]
    && [(ICCloudContext *)self hasPassedBuddy])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100009228;
    v6[3] = &unk_1008ADA80;
    v6[4] = self;
    v3 = objc_retainBlock(v6);
    os_unfair_lock_lock(&self->_containersByAccountIDLock);
    ((void (*)(void *))v3[2])(v3);
    os_unfair_lock_unlock(&self->_containersByAccountIDLock);
    id v4 = self->_containersByAccountID;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)clearContainers
{
  v3 = +[REMLog cloudkit];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing cloud containers.", buf, 2u);
  }

  os_unfair_lock_lock(&self->_containersByAccountIDLock);
  containersByAccountID = self->_containersByAccountID;
  self->_containersByAccountID = 0;

  os_unfair_lock_unlock(&self->_containersByAccountIDLock);
}

- (id)containerForAccountID:(id)a3
{
  id v4 = a3;
  if (![(ICCloudContext *)self supportsCloudKitSyncing]
    || ![(ICCloudContext *)self isSystemAvailableForSyncing]
    || ![(ICCloudContext *)self hasPassedBuddy])
  {
    goto LABEL_13;
  }
  if (!v4)
  {
    id v8 = +[REMLog cloudkit];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_1007496D0();
    }
    goto LABEL_12;
  }
  if (![v4 length])
  {
    id v8 = +[REMLog cloudkit];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_100749704();
    }
LABEL_12:

LABEL_13:
    id v9 = 0;
    goto LABEL_14;
  }
  id v5 = +[REMAccount localAccountID];
  id v6 = [v5 uuid];
  id v7 = [v6 UUIDString];
  if ([v4 isEqualToString:v7])
  {

LABEL_18:
    v15 = +[NSString stringWithFormat:@"Attempt to create CKContainer for Local/LocalInternal account: %@", v4];
    [(id)objc_opt_class() faultAndPromptToFileRadarWithICTap2RadarType:6 logMessage:v15];

    goto LABEL_19;
  }
  id v11 = +[REMAccount localInternalAccountID];
  v12 = [v11 uuid];
  uint64_t v13 = [v12 UUIDString];
  unsigned int v14 = [v4 isEqualToString:v13];

  if (v14) {
    goto LABEL_18;
  }
LABEL_19:
  uint64_t v21 = 0;
  unsigned int v22 = &v21;
  uint64_t v23 = 0x3032000000;
  int v24 = sub_10000984C;
  v25 = sub_10000985C;
  v16 = [(ICCloudContext *)self containersByAccountID];
  id v26 = [v16 objectForKeyedSubscript:v4];

  os_unfair_lock_lock(&self->_containersByAccountIDLock);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100009864;
  v17[3] = &unk_1008ADD28;
  v20 = &v21;
  id v18 = v4;
  id v19 = self;
  sub_100009864(v17);
  os_unfair_lock_unlock(&self->_containersByAccountIDLock);

  id v9 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

LABEL_14:

  return v9;
}

- (id)containerAccountIDsDescription
{
  v2 = [(ICCloudContext *)self containersByAccountID];
  v3 = [v2 allKeys];
  id v4 = [v3 componentsJoinedByString:@", "];

  if (v4)
  {
    id v5 = +[NSString stringWithFormat:@"{ %@ }", v4];
  }
  else
  {
    id v5 = @"{ }";
  }

  return v5;
}

- (id)accountIDForDatabase:(id)a3
{
  v3 = [a3 container];
  id v4 = [v3 options];
  id v5 = [v4 accountOverrideInfo];
  id v6 = [v5 accountID];

  return v6;
}

- (void)dealloc
{
  if ([(ICCloudContext *)self shouldUnregisterBuddy])
  {
    v3 = [(ICCloudContext *)self processingQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009B7C;
    block[3] = &unk_1008ADA80;
    void block[4] = self;
    dispatch_sync(v3, block);
  }
  if ([(ICCloudContext *)self didAddObservers])
  {
    id v4 = [(ICCloudContext *)self operationQueue];
    [v4 removeObserver:self forKeyPath:@"operationCount"];
  }
  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
  id v5 = [(ICCloudContext *)self retryTimer];
  [v5 invalidate];

  id v6 = [(ICCloudContext *)self processingSelectorDelayer];
  [v6 cancelPreviousFireRequests];

  id v7 = [(ICCloudContext *)self pollingSelectorDelayer];
  [v7 cancelPreviousFireRequests];

  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 removeObserver:self];

  v9.receiver = self;
  v9.super_class = (Class)ICCloudContext;
  [(ICCloudContext *)&v9 dealloc];
}

- (id)newBackgroundContext
{
  v2 = [(ICCloudContext *)self storeController];
  id v3 = [v2 newBackgroundContextWithAuthor:RDStoreControllerICCloudContextAuthor];

  return v3;
}

- (ICCloudContext)contextWithQueryGenerationTokenEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ICCloudContext *)self storeController];
  id v5 = [v4 newBackgroundContextWithAuthor:RDStoreControllerICCloudContextAuthor enableQueryGenerationToken:v3];

  return (ICCloudContext *)v5;
}

- (id)context
{
  return [(ICCloudContext *)self contextWithQueryGenerationTokenEnabled:1];
}

- (id)contextForAccountID:(id)a3 withBatchFetchHelper:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(ICCloudContext *)self context];
  if (v4)
  {
    id v8 = [(ICCloudContext *)self batchFetchHelperWithContext:v7];
    [v7 setBatchFetchHelper:v8];
  }
  if ([v6 length]
    && (objc_msgSend(v7, "__unsafe_doesNotWorkUniversally_setAffectedStoresWithAccountIdentifier:", v6) & 1) == 0)
  {
    objc_super v9 = +[REMLog cloudkit];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100749738();
    }
  }

  return v7;
}

- (id)unitTest_contextWithBatchFetchHelperForAccountID:(id)a3
{
  return [(ICCloudContext *)self contextForAccountID:a3 withBatchFetchHelper:1];
}

- (void)performAndWaitContextWithBatchFetchHelperForAccountID:(id)a3 block:(id)a4
{
  id v6 = a4;
  [(ICCloudContext *)self contextForAccountID:a3 withBatchFetchHelper:1];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100009DD4;
  v9[3] = &unk_1008ADD50;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v6;
  id v7 = v10;
  id v8 = v6;
  [v7 performBlockAndWait:v9];
}

- (id)mergeLocalObjectsFetchContextAffectingStoreOf:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCloudContext *)self storeController];
  id v6 = [v5 newBackgroundContextWithAuthor:@"com.apple.remindd.ICCloudContext.mergeLocalObjects"];

  if ((objc_msgSend(v6, "__unsafe_doesNotWorkUniversally_setAffectedStoresWithAccountIdentifier:", v4) & 1) == 0)
  {
    id v7 = +[REMLog cloudkit];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1007497A0();
    }
  }

  return v6;
}

- (id)mergeLocalObjectsWriteContextAffectingStoreOf:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCloudContext *)self storeController];
  id v6 = [v5 newBackgroundContextWithAuthor:@"com.apple.remindd.ICCloudContext.mergeLocalObjects"];

  if ((objc_msgSend(v6, "__unsafe_doesNotWorkUniversally_setAffectedStoresWithAccountIdentifier:", v4) & 1) == 0)
  {
    id v7 = +[REMLog cloudkit];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100749808();
    }
  }

  return v6;
}

- (id)internalContextWithBatchFetchHelper
{
  BOOL v3 = [(ICCloudContext *)self storeController];
  id v4 = [v3 newBackgroundContextWithAuthor:RDStoreControllerICCloudContextInternalAuthor];

  id v5 = [(ICCloudContext *)self batchFetchHelperWithContext:v4];
  [v4 setBatchFetchHelper:v5];

  return v4;
}

- (id)serverChangeTokenContext
{
  v2 = [(ICCloudContext *)self storeController];
  id v3 = [v2 newBackgroundContextWithAuthor:RDStoreControllerICCloudContextServerChangeTokenAuthor enableQueryGenerationToken:0];

  return v3;
}

- (id)batchFetchHelperWithContext:(id)a3
{
  id v4 = a3;
  id v5 = +[ICCloudConfiguration sharedConfiguration];
  id v6 = [v5 fetchBatchSize];

  id v7 = +[ICCloudConfiguration sharedConfiguration];
  id v8 = [v7 fetchCacheCountLimit];

  objc_super v9 = [ICBatchFetchHelper alloc];
  id v10 = [(ICCloudContext *)self processingQueue];
  id v11 = [(ICBatchFetchHelper *)v9 initWithQueue:v10 managedObjectContext:v4 batchSize:v6 cacheCountLimit:v8];

  return v11;
}

- (BOOL)notificationContainsCloudContextInternalChangesOnly:(id)a3
{
  uint64_t v3 = NSManagedObjectContextTransactionAuthorKey;
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:v3];

  objc_opt_class();
  id v6 = REMDynamicCast();
  id v7 = v6;
  BOOL v8 = v6
    && (([v6 isEqualToString:RDStoreControllerICCloudContextInternalAuthor] & 1) != 0
     || [v7 isEqualToString:RDStoreControllerICCloudContextServerChangeTokenAuthor]);

  return v8;
}

+ (id)filterNonUploadableChangedManagedObjectIDs:(id)a3 cloudKitStoreIdentifiers:(id)a4
{
  id v5 = a3;
  id v26 = a4;
  if (qword_100922860 != -1) {
    dispatch_once(&qword_100922860, &stru_1008ADD70);
  }
  v25 = +[NSMutableSet set];
  int v24 = +[NSMutableArray array];
  unsigned int v22 = +[NSMutableArray array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v12 = [v11 entity:v22];
        uint64_t v13 = [v12 name];

        if (v13)
        {
          unsigned int v14 = [(id)qword_100922858 containsObject:v13];
        }
        else
        {
          [v24 addObject:v11];
          unsigned int v14 = 0;
        }
        v15 = [v11 persistentStore];
        v16 = [v15 identifier];

        if (v16)
        {
          unsigned int v17 = [v26 containsObject:v16] ^ 1;
        }
        else
        {
          [v22 addObject:v11];
          unsigned int v17 = 0;
        }
        if ((v14 | v17) == 1) {
          [v25 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }

  if ([v24 count])
  {
    id v18 = +[REMLog cloudkit];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_1007498D8();
    }
  }
  if (objc_msgSend(v22, "count", v22))
  {
    id v19 = +[REMLog cloudkit];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      sub_100749870();
    }
  }
  if ([v25 count])
  {
    id v20 = [v6 mutableCopy];
    [v20 minusSet:v25];
  }
  else
  {
    id v20 = v6;
  }

  return v20;
}

+ (BOOL)isNonUploadingTransactionAuthor:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (qword_100922870 == -1)
  {
    if (v3)
    {
LABEL_3:
      unsigned __int8 v5 = [(id)qword_100922868 containsObject:v4];
      goto LABEL_8;
    }
  }
  else
  {
    dispatch_once(&qword_100922870, &stru_1008ADD90);
    if (v4) {
      goto LABEL_3;
    }
  }
  id v6 = +[REMLog cloudkit];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    sub_100749940();
  }

  NSLog(@"'%s' is unexpectedly nil", "transactionAuthor");
  unsigned __int8 v5 = 0;
LABEL_8:

  return v5;
}

- (id)cloudKitAccountsInContext:(id)a3
{
  id v3 = +[REMCDAccount allCloudKitAccountsInContext:a3];
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000A8F4;
  v6[3] = &unk_1008ADDB8;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v4;
  [v3 enumerateObjectsUsingBlock:v6];

  return v4;
}

- (id)primaryCloudKitAccountInContext:(id)a3
{
  id v4 = a3;
  if ([(ICCloudContext *)self hasPassedBuddy]
    && [(ICCloudContext *)self isSystemAvailableForSyncing])
  {
    unsigned __int8 v5 = [(ICCloudContext *)self appleAccountUtilities];
    id v6 = +[REMCDAccount unsafeUntilSystemReady_primaryCloudKitAccountInContext:v4 appleAccountUtilities:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)readinessLoggingDescription
{
  unsigned int v17 = [(ICCloudContext *)self syncDisabledByServer];
  unsigned int v16 = [(ICCloudContext *)self isCloudKitAccountAvailable];
  id v3 = [(ICCloudContext *)self storeController];
  unsigned int v15 = [v3 supportsSyncingToCloudKit];
  id v4 = +[ICSyncSettings sharedSettings];
  unsigned int v5 = [v4 hasOptions:16];
  unsigned int v6 = [(ICCloudContext *)self isDisabled];
  unsigned int v7 = [(ICCloudContext *)self isDisabledInternal];
  unsigned int v8 = [(ICCloudContext *)self isSystemAvailableForSyncing];
  unsigned int v9 = [(ICCloudContext *)self hasPassedBuddy];
  unsigned int v10 = [(ICCloudContext *)self pendingAccountInitializerCompleteOnLaunch];
  id v11 = [(ICCloudContext *)self accountStatusByAccountIDDescription];
  v12 = [(ICCloudContext *)self containerAccountIDsDescription];
  uint64_t v13 = +[NSString stringWithFormat:@"syncDisabledByServer=%d accountAvailable=%d storeControllerSupportCloudKitSyncing=%d icSyncSetting=%d isDisabled=(%d %d) isSystemAvailableForSyncing=%d passedBuddy=%d pendingAccountInitializerCompleteOnLaunch=%d CKAccountStatusByAccountID=%@ ckContainerAccountIDs=%@", v17, v16, v15, v5, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (BOOL)isReadyToSyncWithActiveAccountAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  if (!a3)
  {
    unsigned int v5 = [(ICCloudContext *)self accountStatusNumberByAccountID];
    if ([v5 count])
    {
    }
    else
    {
      v12 = [(ICCloudContext *)self containersByAccountID];
      uint64_t v13 = [v12 allKeys];
      id v14 = [v13 count];

      if (v14)
      {
        unsigned int v15 = +[REMLog cloudkit];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "isReadyToSyncWithActiveAccountAvailable: accountStatusNumberByAccountID is empty, withActiveAccountAvailable = NO, containersByAccountID is not empty", buf, 2u);
        }

        *((unsigned char *)v19 + 24) = 1;
        goto LABEL_5;
      }
    }
  }
  unsigned int v6 = [(ICCloudContext *)self accountStatusNumberByAccountID];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000AD8C;
  v16[3] = &unk_1008ADDE0;
  v16[4] = &v18;
  [v6 enumerateKeysAndObjectsUsingBlock:v16];

  if (!*((unsigned char *)v19 + 24))
  {
LABEL_10:
    BOOL v7 = 0;
    goto LABEL_11;
  }
LABEL_5:
  if (![(ICCloudContext *)self isDisabled])
  {
    unsigned int v8 = [(ICCloudContext *)self supportsCloudKitSyncing];
    *((unsigned char *)v19 + 24) = v8;
    if (v8)
    {
      unsigned __int8 v9 = [(ICCloudContext *)self pendingAccountInitializerCompleteOnLaunch];
      *((unsigned char *)v19 + 24) = v9 ^ 1;
      if ((v9 & 1) == 0)
      {
        unsigned __int8 v10 = [(ICCloudContext *)self syncDisabledByServer];
        *((unsigned char *)v19 + 24) = v10 ^ 1;
        if ((v10 & 1) == 0)
        {
          BOOL v7 = [(ICCloudContext *)self isCloudKitAccountAvailableRequiringActive:v3];
          *((unsigned char *)v19 + 24) = v7;
          goto LABEL_11;
        }
      }
    }
    goto LABEL_10;
  }
  BOOL v7 = 0;
  *((unsigned char *)v19 + 24) = 0;
LABEL_11:
  _Block_object_dispose(&v18, 8);
  return v7;
}

- (BOOL)isReadyToSync
{
  return [(ICCloudContext *)self isReadyToSyncWithActiveAccountAvailable:0];
}

- (BOOL)isCloudKitAccountAvailable
{
  return [(ICCloudContext *)self isCloudKitAccountAvailableRequiringActive:0];
}

- (BOOL)isCloudKitAccountAvailableRequiringActive:(BOOL)a3
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  [(ICCloudContext *)self context];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000AED8;
  v8[3] = &unk_1008ADE08;
  unsigned __int8 v10 = &v12;
  v8[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v5;
  BOOL v11 = a3;
  [v5 performBlockAndWait:v8];
  char v6 = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v6;
}

- (BOOL)_isCloudKitAccountAvailableWithManagedObjectContext:(id)a3 requireActive:(BOOL)a4
{
  BOOL v4 = a4;
  +[REMCDAccount allCloudKitAccountsInContext:a3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (!v4
          || !objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "inactive", (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_13;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      BOOL v10 = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_13:

  return v10;
}

- (void)disableCloudSyncingIfCurrentVersionNotSuppported
{
  BOOL v3 = +[ICCloudConfiguration sharedConfiguration];
  BOOL v4 = [v3 minimumClientVersion];

  id v5 = [v4 componentsSeparatedByString:@","];
  if ([v5 count] != (id)3)
  {
    long long v13 = +[REMLog cloudkit];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_100749AB8();
    }
    goto LABEL_8;
  }
  id v6 = [v5 objectAtIndexedSubscript:0];
  uint64_t v7 = (int)[v6 intValue];

  uint64_t v8 = [v5 objectAtIndexedSubscript:1];
  uint64_t v9 = (int)[v8 intValue];

  BOOL v10 = [v5 objectAtIndexedSubscript:2];
  uint64_t v11 = (int)[v10 intValue];

  long long v12 = +[NSProcessInfo processInfo];
  v14[0] = v7;
  v14[1] = v9;
  v14[2] = v11;
  LODWORD(v7) = [v12 isOperatingSystemAtLeastVersion:v14];

  if (!v7)
  {
    [(ICCloudContext *)self setSyncDisabledByServer:1];
    long long v13 = +[REMLog cloudkit];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100749A14();
    }
LABEL_8:

    goto LABEL_9;
  }
  [(ICCloudContext *)self setSyncDisabledByServer:0];
LABEL_9:
}

- (void)updateConfiguration
{
  [(ICCloudContext *)self disableCloudSyncingIfCurrentVersionNotSuppported];

  [(ICCloudContext *)self updateSelectorDelayers];
}

- (void)updateSelectorDelayers
{
  BOOL v3 = +[ICCloudConfiguration sharedConfiguration];
  BOOL v4 = [v3 throttlingPolicy];
  [v4 batchInterval];
  double v6 = v5;

  uint64_t v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = [(ICCloudContext *)v7 processingSelectorDelayer];

  if (!v8)
  {
    uint64_t v9 = [[ICSelectorDelayer alloc] initWithTarget:v7 selector:"processPendingCloudObjects" delay:1 waitToFireUntilRequestsStop:1 callOnMainThread:v6];
    [(ICCloudContext *)v7 setProcessingSelectorDelayer:v9];
  }
  objc_sync_exit(v7);

  BOOL v10 = [(ICCloudContext *)v7 processingSelectorDelayer];
  [v10 setDelay:v6];

  uint64_t v11 = [(ICCloudContext *)v7 processingSelectorDelayer];
  unsigned int v12 = [v11 isScheduledToFire];

  if (v12)
  {
    long long v13 = [(ICCloudContext *)v7 processingSelectorDelayer];
    [v13 cancelPreviousFireRequests];

    long long v14 = [(ICCloudContext *)v7 processingSelectorDelayer];
    [v14 requestFire];
  }
  long long v15 = [(ICCloudContext *)v7 pollingSelectorDelayer];

  if (v15)
  {
    unsigned int v16 = +[ICCloudConfiguration sharedConfiguration];
    [v16 pollingInterval];
    double v18 = v17;

    id v19 = [(ICCloudContext *)v7 pollingSelectorDelayer];
    [v19 setDelay:v18];

    uint64_t v20 = [(ICCloudContext *)v7 pollingSelectorDelayer];
    unsigned int v21 = [v20 isScheduledToFire];

    if (v21)
    {
      unsigned int v22 = [(ICCloudContext *)v7 pollingSelectorDelayer];
      [v22 cancelPreviousFireRequests];

      id v23 = [(ICCloudContext *)v7 pollingSelectorDelayer];
      [v23 requestFire];
    }
  }
}

- (void)handleUnrecoverableError
{
  [(ICCloudContext *)self deleteAllServerChangeTokens];

  [(ICCloudContext *)self syncWithReason:@"UnrecoverableError" discretionary:0 completionHandler:0];
}

+ (id)_systemBuildVersion
{
  if (qword_100922878 != -1) {
    dispatch_once(&qword_100922878, &stru_1008ADE28);
  }
  v2 = (void *)qword_100922880;

  return v2;
}

+ (id)_cloudObjectClassesByRecordType
{
  if (qword_100922888 != -1) {
    dispatch_once(&qword_100922888, &stru_1008ADE48);
  }
  v2 = (void *)qword_100922890;

  return v2;
}

- (NSDictionary)cloudObjectClassesByRecordType
{
  v2 = objc_opt_class();

  return (NSDictionary *)[v2 _cloudObjectClassesByRecordType];
}

+ (id)_recordTypesToSortChildrenAfterFetch
{
  if (qword_100922898 != -1) {
    dispatch_once(&qword_100922898, &stru_1008ADE68);
  }
  v2 = (void *)qword_1009228A0;

  return v2;
}

+ (id)appZoneID
{
  if (qword_1009228B0 != -1) {
    dispatch_once(&qword_1009228B0, &stru_1008ADE88);
  }
  v2 = (void *)qword_1009228A8;

  return v2;
}

+ (id)migrationZoneID
{
  if (qword_1009228C0 != -1) {
    dispatch_once(&qword_1009228C0, &stru_1008ADEA8);
  }
  v2 = (void *)qword_1009228B8;

  return v2;
}

+ (id)metadataZoneID
{
  if (qword_1009228D0 != -1) {
    dispatch_once(&qword_1009228D0, &stru_1008ADEC8);
  }
  v2 = (void *)qword_1009228C8;

  return v2;
}

- (void)reachabilityChanged:(id)a3
{
  BOOL v4 = +[ICUtilities isInternetReachable];
  if (v4 != [(ICCloudContext *)self wasInternetReachable])
  {
    [(ICCloudContext *)self setWasInternetReachable:v4];
    if (v4)
    {
      double v5 = +[NSDate now];
      [v5 timeIntervalSinceReferenceDate];
      double v7 = v6;

      [(ICCloudContext *)self lastSyncSinceInternetReachable];
      double v9 = v7 - v8;
      BOOL v10 = +[ICCloudConfiguration sharedConfiguration];
      [v10 reachabilityChangeSyncThrottleInterval];
      double v12 = v11;

      if (v9 >= v12)
      {
        [(ICCloudContext *)self setLastSyncSinceInternetReachable:v7];
        unsigned int v16 = [(ICCloudContext *)self icUserDefaults];
        double v17 = [v16 userDefaults];
        [v17 setDouble:@"CloudKitLastSyncSinceInternetReachable" forKey:v7];

        uint64_t v14 = 1;
      }
      else
      {
        long long v13 = +[REMLog cloudkit];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Re-gain internet connection after losing it for a short time. Not going to sync. (throttled)", buf, 2u);
        }

        uint64_t v14 = 2;
      }
      double v18 = +[REMLog cloudkit];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Cloud context found an internet connection.", v20, 2u);
      }

      [(ICCloudContext *)self processPendingCloudObjectsWithOperationName:ICNSBlockOperationNameProcessObjectsForReachabilityChanged];
    }
    else
    {
      long long v15 = +[REMLog cloudkit];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Cloud context lost an internet connection.", v19, 2u);
      }

      uint64_t v14 = 0;
    }
    [(ICCloudContext *)self updateCloudContextStateWithSyncOption:v14 syncReason:@"ReachabilityChanged" withCompletionHandler:&stru_1008ADF08];
  }
}

- (void)cloudKitAccountChanged:(id)a3
{
  BOOL v4 = [(ICCloudContext *)self processingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BFB0;
  block[3] = &unk_1008ADA80;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (BOOL)hasPendingOperations
{
  v2 = [(ICCloudContext *)self operationQueue];
  BOOL v3 = [v2 operationCount] != 0;

  return v3;
}

- (void)printOperationQueue
{
  BOOL v3 = [(ICCloudContext *)self operationQueue];
  id v4 = [v3 operationCount];

  if (v4)
  {
    double v5 = +[NSMutableString string];
  }
  else
  {
    double v5 = 0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v6 = [(ICCloudContext *)self operationQueue];
  double v7 = [v6 operations];

  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      double v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = [[*(id *)(*((void *)&v17 + 1) + 8 * (void)v11) ic_loggingDescription];
        [v5 appendFormat:@"\n\t%@", v12];

        double v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v9);
  }

  long long v13 = +[REMLog cloudkit];
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v14)
    {
      long long v15 = [(ICCloudContext *)self operationQueue];
      unsigned int v16 = [v15 operationCount];
      *(_DWORD *)id buf = 67109378;
      unsigned int v22 = v16;
      __int16 v23 = 2114;
      int v24 = v5;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Operation queue has %d operation(s):%{public}@", buf, 0x12u);
    }
  }
  else if (v14)
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Operation queue has 0 operations", buf, 2u);
  }
}

- (void)addStateHandlerWithName:(const char *)a3 stateBlock:(id)a4
{
  id v5 = a4;
  double v6 = +[REMLog cloudkit];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 136446210;
    uint64_t v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Adding os_state handler: %{public}s", buf, 0xCu);
  }

  double v7 = dispatch_get_global_queue(0, 0);
  id v8 = v5;
  os_state_add_handler();
}

- (void)addStateHandler
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000C880;
  v3[3] = &unk_1008ADFA8;
  objc_copyWeak(&v4, &location);
  [(ICCloudContext *)self addStateHandlerWithName:"Cloud Context" stateBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (id)status
{
  v2 = [(ICCloudContext *)self operationQueue];
  id v3 = [v2 operationCount];

  if (v3) {
    return @"Syncing in progress";
  }
  else {
    return @"No Sync in progress";
  }
}

- (id)configurationDump
{
  id v3 = +[NSMutableDictionary dictionary];
  v61 = +[ICCloudConfiguration sharedConfiguration];
  id v4 = [(ICCloudContext *)self containersByAccountID];
  id v5 = [v4 allKeys];

  double v6 = +[NSString stringWithFormat:@"%ld", 20240715];
  double v7 = v3;
  [v3 setObject:v6 forKey:@"runtimeCloudKitSchemaVersion"];

  v63 = [(ICCloudContext *)self icUserDefaults];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obj = v5;
  id v8 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v65;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v65 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v64 + 1) + 8 * i);
        long long v13 = [(ICCloudContext *)self contextForAccountID:v12 withBatchFetchHelper:0];
        BOOL v14 = [ICCloudSchemaCatchUpSyncContext alloc];
        long long v15 = [v63 cloudSchemaCatchUpSyncSchedulingStateStorage];
        unsigned int v16 = [(ICCloudSchemaCatchUpSyncContext *)v14 initWithAccountIdentifier:v12 syncReason:@"DumpConfig" schedulingStateStorage:v15 managedObjectContext:v13];

        long long v17 = +[NSString stringWithFormat:@"accountIdentifier: %@ -> version: %ld", v12, [(ICCloudSchemaCatchUpSyncContext *)v16 persistenceCloudSchemaVersion]];
        [v7 setObject:v17 forKey:@"persistenceCloudSchemaVersion"];
      }
      id v9 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
    }
    while (v9);
  }

  v60 = +[REMUserDefaults daemonUserDefaults];
  long long v18 = [v60 cloudKitSchemaCatchUpSyncLastSuccessDate];
  long long v19 = +[NSString stringWithFormat:@"%@", v18];
  [v7 setObject:v19 forKey:@"cloudKitSchemaCatchUpSyncLastSuccessDate"];

  long long v20 = [v60 cloudKitSchemaCatchUpSyncLastSuccessBuildVersion];
  unsigned int v21 = +[NSString stringWithFormat:@"%@", v20];
  [v7 setObject:v21 forKey:@"cloudKitSchemaCatchUpSyncLastSuccessBuildVersion"];

  unsigned int v22 = [v63 cloudSchemaCatchUpSyncSchedulingStateStorage];
  __int16 v23 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v22 schedulingState]);
  int v24 = +[NSString stringWithFormat:@"%@", v23];
  [v7 setObject:v24 forKey:@"cloudKitSchemaCatchUpSyncSchedulingState"];

  v25 = [v63 cloudSchemaCatchUpSyncSchedulingStateStorage];
  id v26 = [v25 lastScheduledDate];
  long long v27 = +[NSString stringWithFormat:@"%@", v26];
  [v7 setObject:v27 forKey:@"cloudKitSchemaCatchUpSyncLastScheduledDate"];

  long long v28 = [v61 throttlingPolicy];
  [v28 batchInterval];
  uint64_t v30 = v29;

  double v31 = +[NSString stringWithFormat:@"%lf", v30];
  [v7 setObject:v31 forKey:@"throttlingPolicy.processingInterval"];

  v32 = [v61 minimumClientVersion];
  v33 = +[NSString stringWithFormat:@"%@", v32];
  [v7 setObject:v33 forKey:@"minimumClientOSSupportedByServer"];

  [v61 pollingInterval];
  v35 = +[NSString stringWithFormat:@"%lf", v34];
  [v7 setObject:v35 forKey:@"pollingInterval"];

  [v61 reachabilityChangeSyncThrottleInterval];
  v37 = +[NSString stringWithFormat:@"%lf", v36];
  [v7 setObject:v37 forKey:@"reachabilityChangeSyncThrottleInterval"];

  v38 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", [v61 resultsLimitPerSyncOperation]);
  [v7 setObject:v38 forKey:@"resultsLimitPerSyncOperation"];

  v39 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", [v61 resultsLimitPerSyncOperation]);
  [v7 setObject:v39 forKey:@"numberOfRecordsToProcessBeforeSaving"];

  v40 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", [v61 fetchBatchSize]);
  [v7 setObject:v40 forKey:@"fetchBatchSize"];

  [v61 persistedSubscriptionIDsValidityPeriod];
  v42 = +[NSString stringWithFormat:@"%lf", v41];
  [v7 setObject:v42 forKey:@"persistedSubscriptionIDsValidityPeriod"];

  [v61 mergeLocalObjectsInitialRetryInterval];
  v44 = +[NSString stringWithFormat:@"%lf", v43];
  [v7 setObject:v44 forKey:@"mergeLocalObjectsInitialRetryInterval"];

  v45 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", [v61 mergeLocalObjectsMaximumRetryCount]);
  [v7 setObject:v45 forKey:@"mergeLocalObjectsMaximumRetryCount"];

  [v61 mergeLocalObjectsRetryStartOverThrottleInterval];
  v47 = +[NSString stringWithFormat:@"%lf", v46];
  [v7 setObject:v47 forKey:@"mergeLocalObjectsRetryStartOverThrottleInterval"];

  [v61 cloudSchemaCatchUpSyncInitialRetryInterval];
  id v49 = +[NSString stringWithFormat:@"%lf", v48];
  [v7 setObject:v49 forKey:@"cloudSchemaCatchUpSyncInitialRetryInterval"];

  v50 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", [v61 cloudSchemaCatchUpSyncMaximumRetryCount]);
  [v7 setObject:v50 forKey:@"cloudSchemaCatchUpSyncMaximumRetryCount"];

  v51 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", [v61 fetchDatabaseChangesOperationPerScopePerAccountMaximumRetryCount]);
  [v7 setObject:v51 forKey:@"fetchDatabaseChangesOperationPerScopePerAccountMaximumRetryCount"];

  v52 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", [v61 objectEffectiveVersionValidationFlushBatchSize]);
  [v7 setObject:v52 forKey:@"objectEffectiveVersionValidationFlushBatchSize"];

  [v61 manualSortHintClientSideExpiration];
  v54 = +[NSString stringWithFormat:@"%lf", v53];
  [v7 setObject:v54 forKey:@"manualSortHintClientSideExpiration"];

  v55 = [v61 manualSortHintLastAccessedUpdatePolicy];
  v56 = +[NSString stringWithFormat:@"%@", v55];
  [v7 setObject:v56 forKey:@"manualSortHintLastAccessedUpdatePolicy"];

  v57 = +[ICCloudContext _systemBuildVersion];
  v58 = +[NSString stringWithFormat:@"%@", v57];
  [v7 setObject:v58 forKey:@"_systemBuildVersion"];

  return v7;
}

- (id)allZoneIDs
{
  v2 = +[ICCloudContext appZoneID];
  v6[0] = v2;
  id v3 = +[ICCloudContext metadataZoneID];
  v6[1] = v3;
  id v4 = +[NSArray arrayWithObjects:v6 count:2];

  return v4;
}

- (void)receivedZoneNotFound:(id)a3 operation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 database];
  id v9 = [(ICCloudContext *)self accountIDForDatabase:v8];

  if (![v9 length])
  {
    uint64_t v10 = +[REMLog cloudkit];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      long long v18 = [v6 ic_loggingDescription];
      long long v19 = [v7 ic_loggingDescription];
      int v20 = 138543874;
      unsigned int v21 = v18;
      __int16 v22 = 2114;
      __int16 v23 = v19;
      __int16 v24 = 2114;
      v25 = v9;
      _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "accountID is nil or empty in receivedZoneNotFound: %{public}@ %{public}@, accountID: %{public}@", (uint8_t *)&v20, 0x20u);
    }
  }
  unsigned int v11 = [v6 ic_isOwnedByCurrentUser];
  uint64_t v12 = +[REMLog cloudkit];
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (v11)
  {
    if (v13) {
      sub_100749BC4();
    }

    BOOL v14 = [(ICCloudContext *)self accountZoneIDsNeedingToBeSaved];
    [v14 ic_addZoneID:v6 forAccountID:v9];

    long long v15 = [(ICCloudContext *)self cloudContextDelegate];
    [v15 cloudContext:self receivedZoneNotFound:v6 accountID:v9];
  }
  else
  {
    if (v13) {
      sub_100749C60();
    }

    unsigned int v16 = [(ICCloudContext *)self accountZoneIDsNeedingFetchChanges];
    [v16 ic_removeZoneID:v6 forAccountID:v9];

    long long v15 = [(ICCloudContext *)self cloudContextDelegate];
    [v15 cloudContext:self sharedZoneWasDeleted:v6 accountID:v9];
  }

  [(ICCloudContext *)self saveZoneFetchState];
  long long v17 = [v7 database];
  -[ICCloudContext deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:](self, "deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:", v6, [v17 databaseScope], v9);
}

+ (id)allCloudObjectIDsOfClassesPassingTest:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableSet set];
  id v9 = [a1 _cloudObjectClassesByRecordType];
  uint64_t v10 = [v9 allValues];

  if (v6)
  {
    [v10 ic_objectsPassingTest:v6];
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = v10;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v11;
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = [*(id *)(*((void *)&v19 + 1) + 8 * i) allCloudObjectIDsInContext:v7];
        if (v17) {
          [v8 addObjectsFromArray:v17];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return v8;
}

- (id)allDirtyCloudObjectIDsInContext:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() allDirtyCloudObjectIDsInContext:v3];

  return v4;
}

+ (id)allDirtyCloudObjectIDsInContext:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableSet set];
  id v5 = +[REMCDObject allDirtyCloudObjectIDsInContext:v3];

  if (v5) {
    [v4 addObjectsFromArray:v5];
  }

  return v4;
}

- (BOOL)_generateAndSavePersonIDSaltIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = +[REMUserDefaults daemonUserDefaults];
  unsigned int v6 = [v5 enableAutoGenerateCKPersonIDSalt];

  if (!v6)
  {
LABEL_7:
    BOOL v10 = 0;
    goto LABEL_8;
  }
  if ((isCloudContextSyncReasonUserInitiated(v4) & 1) == 0)
  {
    id v11 = +[REMLog cloudkit];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Not generating PersonIDSalt because the sync reason wasn't initiated by the user {reason: %@}", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_7;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v7 = [(ICCloudContext *)self storeController];
  id v8 = [v7 newBackgroundContextWithAuthor:@"com.apple.remindd.ICCloudContext.setPersonIDSalt"];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000DAB8;
  v13[3] = &unk_1008ADFD0;
  v13[4] = self;
  id v9 = v8;
  id v14 = v9;
  p_long long buf = &buf;
  [v9 performBlockAndWait:v13];
  BOOL v10 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
LABEL_8:

  return v10;
}

- (void)syncWithReason:(id)a3 discretionary:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = +[REMLog cloudkit];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v45 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SYNC[FULL] START {reason: %{public}@}", buf, 0xCu);
  }

  id v11 = +[NSString stringWithFormat:@"com.apple.remindd.cloudkit.sync.full[%@]", v8];
  id v12 = +[REMLog cloudkit];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v45 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "os_transaction INIT {name: %{public}@}", buf, 0xCu);
  }

  id v13 = v11;
  [v13 cStringUsingEncoding:1];
  id v14 = (void *)os_transaction_create();
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10000DFA8;
  v40[3] = &unk_1008ADFF8;
  id v15 = v9;
  id v43 = v15;
  id v16 = v13;
  id v41 = v16;
  id v17 = v14;
  id v42 = v17;
  char v18 = objc_retainBlock(v40);
  if (![(ICCloudContext *)self isReadyToSync])
  {
    long long v27 = [(ICCloudContext *)self storeController];
    unsigned __int8 v28 = [v27 supportsSyncingToCloudKit];

    if (v28)
    {
      unsigned __int8 v29 = [(ICCloudContext *)self isCloudKitAccountAvailable];
      uint64_t v30 = +[REMLog cloudkit];
      BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
      if (v29)
      {
        if (v31) {
          sub_100749D64(self, v30);
        }
        goto LABEL_17;
      }
      if (v31) {
        sub_100749DF0();
      }
    }
    else
    {
      v32 = +[REMLog cloudkit];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_100749E24();
      }
    }
    id v26 = 0;
    goto LABEL_25;
  }
  if (![(ICCloudContext *)self isInternetReachable])
  {
    uint64_t v30 = +[REMLog cloudkit];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_100749D30();
    }
LABEL_17:

    id v26 = [(id)objc_opt_class() errorForDisabledCloudSyncing];
LABEL_25:
    ((void (*)(void *, id))v18[2])(v18, v26);
    goto LABEL_26;
  }
  BOOL v33 = a4;
  long long v19 = +[REMSignpost sync];
  os_signpost_id_t v20 = os_signpost_id_generate(v19);
  long long v21 = v19;
  long long v22 = v21;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "cloudkit.full", "", buf, 2u);
  }

  __int16 v23 = +[NSDate date];
  __int16 v24 = [(ICCloudContext *)self processingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E094;
  block[3] = &unk_1008AE098;
  void block[4] = self;
  void block[5] = v8;
  BOOL v39 = v33;
  id v35 = v23;
  uint64_t v36 = v22;
  os_signpost_id_t v38 = v20;
  v37 = v18;
  v25 = v22;
  id v26 = v23;
  dispatch_async(v24, block);

LABEL_26:
}

- (void)_syncWithReason:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableArray array];
  id v9 = [(ICCloudContext *)self containersByAccountID];
  BOOL v10 = [v9 allKeys];

  id v11 = [(ICCloudContext *)self setUpCloudSchemaCatchUpSyncContextMapWithAccountIDs:v10 syncReason:v6];
  id v12 = [v11 count];
  id v13 = +[REMLog cloudkit];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if (v12)
    {
      id v14 = [v11 allKeys];
    }
    else
    {
      id v14 = @"NONE";
    }
    *(_DWORD *)long long buf = 138543362;
    id v26 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SYNC[FULL] CONTINUE - List of accountIDs that need to perform CloudSchemaCatchUpSync: {%{public}@}", buf, 0xCu);
    if (v12) {
  }
    }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000EC74;
  v18[3] = &unk_1008AE110;
  id v19 = v8;
  os_signpost_id_t v20 = self;
  id v21 = v6;
  id v22 = v11;
  id v23 = v7;
  BOOL v24 = v12 != 0;
  id v15 = v7;
  id v16 = v11;
  id v17 = v8;
  [(ICCloudContext *)self fetchDatabaseChangesWithReason:v6 cloudSchemaCatchUpSyncContextMap:v16 completionHandler:v18];
}

- (void)cancelEverythingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(0, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000F1C4;
  v7[3] = &unk_1008AE160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)clearPendingActivity
{
  id v3 = [(ICCloudContext *)self processingSelectorDelayer];
  [v3 cancelPreviousFireRequests];

  id v4 = [(ICCloudContext *)self processingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F9E0;
  block[3] = &unk_1008ADA80;
  void block[4] = self;
  dispatch_async(v4, block);

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000FC64;
  v5[3] = &unk_1008ADA80;
  v5[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)configureOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCloudContext *)self lastSyncMetrics];
  [v5 setOperationCount:[v5 operationCount] + 1];

  [v4 setQualityOfService:-[ICCloudContext qualityOfService](self, "qualityOfService")];
  [(ICCloudContext *)self timeoutIntervalForResource];
  double v7 = v6;
  id v8 = [v4 configuration];

  [v8 setTimeoutIntervalForResource:v7];
}

- (void)deleteRecordZonesWithZoneIDs:(id)a3 accountID:(id)a4 markZonesAsUserPurged:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = +[REMLog cloudkit];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109634;
    BOOL v30 = v7;
    __int16 v31 = 2114;
    id v32 = v11;
    __int16 v33 = 2114;
    id v34 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Deleting record zones (markZonesAsUserPurged=%d) in account ID %{public}@: %{public}@", buf, 0x1Cu);
  }

  if ([v11 length])
  {
    id v14 = [(ICCloudContext *)self containerForAccountID:v11];
    id v15 = [objc_alloc((Class)CKModifyRecordZonesOperation) initWithRecordZonesToSave:0 recordZoneIDsToDelete:v10];
    [(ICCloudContext *)self configureOperation:v15];
    id v16 = [v14 privateCloudDatabase];
    [v15 setDatabase:v16];
    [v15 setMarkZonesAsUserPurged:v7];
    id v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    id v23 = sub_100010010;
    BOOL v24 = &unk_1008AE228;
    id v25 = v11;
    id v26 = self;
    id v27 = v16;
    id v28 = v12;
    id v17 = v16;
    [v15 setModifyRecordZonesCompletionBlock:&v21];
    id v18 = objc_alloc_init((Class)CKOperationGroup);
    [v18 setName:@"DeleteRecordZones" v21, v22, v23, v24];
    [v18 setQuantity:[v10 count]];
    [v18 setExpectedSendSize:1];
    [v18 setExpectedReceiveSize:1];
    [v15 setGroup:v18];
    id v19 = [(ICCloudContext *)self operationQueue];
    [v19 addOperation:v15];

    [(ICCloudContext *)self errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary];
LABEL_9:

    goto LABEL_10;
  }
  os_signpost_id_t v20 = +[REMLog cloudkit];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
    sub_10074A1DC();
  }

  if (v12)
  {
    id v14 = ICGenericError();
    (*((void (**)(id, void *))v12 + 2))(v12, v14);
    goto LABEL_9;
  }
LABEL_10:
}

- (BOOL)isFetchingAllRecordZones
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(ICCloudContext *)self operationQueue];
  id v3 = [v2 operations];
  id v4 = [v3 copy];

  id v5 = (char *)[v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
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
      id v5 = (char *)[v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

- (BOOL)isInternetReachable
{
  return +[ICUtilities isInternetReachable];
}

+ (id)errorForDisabledCloudSyncing
{
  NSErrorUserInfoKey v5 = NSLocalizedDescriptionKey;
  CFStringRef v6 = @"Cloud syncing is not enabled.";
  v2 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  id v3 = +[NSError errorWithDomain:@"com.apple.reminders.cloud" code:1 userInfo:v2];

  return v3;
}

+ (id)errorFromErrors:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] == (id)1)
    {
      id v4 = [v3 firstObject];
    }
    else
    {
      CFStringRef v7 = @"Errors";
      id v8 = v3;
      NSErrorUserInfoKey v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
      id v4 = +[NSError errorWithDomain:@"com.apple.reminders.cloud" code:2 userInfo:v5];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)errorFromOperations:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        long long v11 = [v10 error:v15];

        if (v11)
        {
          long long v12 = [v10 error];
          [v4 addObject:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v13 = [(id)objc_opt_class() errorFromErrors:v4];

  return v13;
}

- (double)timeIntervalToRetryAfterFromError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v18 = 0;
    id v19 = (double *)&v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    id v5 = [v3 userInfo];
    id v6 = [v5 objectForKeyedSubscript:CKErrorRetryAfterKey];

    if (v6)
    {
      objc_opt_class();
      id v7 = [v4 userInfo];
      uint64_t v8 = [v7 objectForKeyedSubscript:CKErrorRetryAfterKey];
      long long v9 = REMDynamicCast();
      [v9 doubleValue];
    }
    else
    {
      long long v12 = [v4 userInfo];
      uint64_t v13 = REMErrorRetryAfterKey;
      id v14 = [v12 objectForKeyedSubscript:REMErrorRetryAfterKey];

      if (!v14)
      {
        if ([v4 code] != (id)2) {
          goto LABEL_9;
        }
        long long v16 = [v4 userInfo];
        id v7 = [v16 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100010B94;
        v17[3] = &unk_1008AE250;
        void v17[4] = &v18;
        [v7 enumerateKeysAndObjectsUsingBlock:v17];
LABEL_8:

LABEL_9:
        double v11 = v19[3];
        _Block_object_dispose(&v18, 8);
        goto LABEL_10;
      }
      objc_opt_class();
      id v7 = [v4 userInfo];
      uint64_t v8 = [v7 objectForKeyedSubscript:v13];
      long long v9 = REMDynamicCast();
      [v9 doubleValue];
    }
    *((void *)v19 + 3) = v10;

    goto LABEL_8;
  }
  double v11 = 0.0;
LABEL_10:

  return v11;
}

- (BOOL)canRetryImmediatelyAfterError:(id)a3
{
  id v4 = a3;
  id v5 = [v4 domain];
  if ([v5 isEqualToString:@"com.apple.reminders.cloud"])
  {
    id v6 = [v4 code];

    if (v6 == (id)2)
    {
      id v7 = [v4 userInfo];
      uint64_t v8 = [v7 objectForKeyedSubscript:@"Errors"];
      goto LABEL_8;
    }
  }
  else
  {
  }
  long long v9 = [v4 domain];
  unsigned int v10 = [v9 isEqualToString:CKErrorDomain];

  if (v10)
  {
    if ([v4 code] == (id)2)
    {
      objc_opt_class();
      id v7 = [v4 userInfo];
      double v11 = [v7 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];
      long long v12 = REMDynamicCast();
      uint64_t v8 = [v12 allValues];

LABEL_8:
      if (v8)
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v13 = v8;
        id v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v21;
          while (2)
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v21 != v16) {
                objc_enumerationMutation(v13);
              }
              if (-[ICCloudContext canRetryImmediatelyAfterError:](self, "canRetryImmediatelyAfterError:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20))
              {

                goto LABEL_22;
              }
            }
            id v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }
      }
      goto LABEL_20;
    }
    if ([v4 code] == (id)31 || objc_msgSend(v4, "code") == (id)14)
    {
LABEL_22:
      BOOL v18 = 1;
      goto LABEL_23;
    }
  }
LABEL_20:
  BOOL v18 = 0;
LABEL_23:

  return v18;
}

- (void)finishOperationsForRecordID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ICCloudContext *)self processingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010F48;
  block[3] = &unk_1008AE278;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (NSDictionary)accountStatusNumberByAccountID
{
  v2 = [(ICCloudContext *)self icUserDefaults];
  id v3 = [v2 userDefaults];
  id v4 = [v3 dictionaryForKey:@"CloudKitAccountStatus"];

  return (NSDictionary *)v4;
}

- (void)setAccountStatusNumberByAccountID:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCloudContext *)self icUserDefaults];
  id v6 = [v5 userDefaults];

  [v6 setObject:v4 forKey:@"CloudKitAccountStatus"];
  [v6 synchronize];
}

- (int64_t)accountStatusFromAccountStatusNumber:(id)a3
{
  return (int)[a3 intValue];
}

- (void)setAccountStatus:(int64_t)a3 forAccountID:(id)a4
{
  id v6 = a4;
  id v7 = [(ICCloudContext *)self accountStatusNumberByAccountID];
  if (v7)
  {
    uint64_t v8 = [(ICCloudContext *)self accountStatusNumberByAccountID];
    id v11 = [v8 mutableCopy];
  }
  else
  {
    id v11 = +[NSMutableDictionary dictionary];
  }

  id v9 = +[NSNumber numberWithInteger:a3];
  [v11 setObject:v9 forKeyedSubscript:v6];

  id v10 = [v11 copy];
  [(ICCloudContext *)self setAccountStatusNumberByAccountID:v10];
}

- (void)updateAccountStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCloudContext *)self processingQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011750;
  v7[3] = &unk_1008AE160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)removeStaleAccountStatus
{
  id v3 = [(ICCloudContext *)self processingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011CD4;
  block[3] = &unk_1008ADA80;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)removeStaleFetchDatabaseRetryMetadata
{
  id v3 = [(ICCloudContext *)self processingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011F84;
  block[3] = &unk_1008ADA80;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (id)accountStatusByAccountIDDescription
{
  id v3 = +[NSMutableString stringWithFormat:@"{"];
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 1;
  id v4 = [(ICCloudContext *)self accountStatusNumberByAccountID];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_100012404;
  id v11 = &unk_1008AE318;
  id v13 = v14;
  id v5 = v3;
  id v12 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:&v8];

  [v5 appendString:@" }" v8, v9, v10, v11];
  id v6 = +[NSString stringWithString:v5];

  _Block_object_dispose(v14, 8);

  return v6;
}

- (id)unitTest_accountStatusNumberForAccountID:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCloudContext *)self accountStatusNumberByAccountID];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)fetchUserRecordOperationWithContainer:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[CKFetchRecordsOperation fetchCurrentUserRecordOperation];
  [(ICCloudContext *)self configureOperation:v8];
  uint64_t v9 = [v6 privateCloudDatabase];
  [v8 setDatabase:v9];

  objc_initWeak(&location, v8);
  id v10 = +[REMLog cloudkit];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Fetching user record in cloud context {operation: %{public}@}", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  long long v23 = sub_10000984C;
  BOOL v24 = sub_10000985C;
  id v25 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100012840;
  v19[3] = &unk_1008AE340;
  v19[4] = &buf;
  [v8 setPerRecordCompletionBlock:v19];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001296C;
  v15[3] = &unk_1008AE368;
  objc_copyWeak(&v18, &location);
  id v11 = v7;
  id v16 = v11;
  p_long long buf = &buf;
  [v8 setFetchRecordsCompletionBlock:v15];
  id v12 = objc_alloc_init((Class)CKOperationGroup);
  [v12 setName:@"FetchUserRecord"];
  [v12 setQuantity:1];
  [v12 setExpectedSendSize:1];
  [v12 setExpectedReceiveSize:1];
  [v8 setGroup:v12];
  id v13 = v8;

  objc_destroyWeak(&v18);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&location);

  return v13;
}

- (id)fetchUserRecordOperationWithAccountID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(ICCloudContext *)self containerForAccountID:a3];
  id v8 = [(ICCloudContext *)self fetchUserRecordOperationWithContainer:v7 completionHandler:v6];

  return v8;
}

- (void)fetchUserRecordWithContainer:(id)a3 completionHandler:(id)a4
{
  id v5 = [(ICCloudContext *)self fetchUserRecordOperationWithContainer:a3 completionHandler:a4];
  id v4 = [v5 database];
  [v4 addOperation:v5];
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
    uint64_t v9 = +[REMLog cloudkit];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_10074A444();
    }

    if (v7)
    {
      id v10 = ICGenericError();
      v7[2](v7, 0, v10);
    }
  }
}

- (void)operationQueueFetchUserRecordWithAccountID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICCloudContext *)self operationQueue];
  uint64_t v9 = [(ICCloudContext *)self fetchUserRecordOperationWithAccountID:v7 completionHandler:v6];

  [v8 addOperation:v9];

  [(ICCloudContext *)self errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary];
}

- (void)updateUserRecordWithAccountID:(id)a3 updateFunction:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 length])
  {
    char v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    long long v17 = sub_100012E5C;
    id v18 = &unk_1008AE3B8;
    id v21 = v9;
    id v19 = self;
    id v20 = v8;
    id v22 = v10;
    id v11 = [(ICCloudContext *)self fetchUserRecordOperationWithAccountID:v20 completionHandler:&v15];
    id v12 = [v11 database:v15, v16, v17, v18, v19];
    [v12 addOperation:v11];

    id v13 = v21;
  }
  else
  {
    id v14 = +[REMLog cloudkit];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_10074A478();
    }

    id v13 = ICGenericError();
    (*((void (**)(id, void *))v10 + 2))(v10, v13);
  }
}

+ (id)userRecordNameForContainer:(id)a3
{
  id v3 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)&_dispatch_main_q);
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_10000984C;
  char v15 = sub_10000985C;
  id v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100013164;
  v8[3] = &unk_1008AE3E0;
  id v10 = &v11;
  id v4 = dispatch_semaphore_create(0);
  id v9 = v4;
  [v3 fetchUserRecordIDWithCompletionHandler:v8];
  dispatch_time_t v5 = dispatch_time(0, 120000000000);
  dispatch_semaphore_wait(v4, v5);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)existingCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v10 recordID];
  id v12 = [v10 recordType];

  uint64_t v13 = [(ICCloudContext *)self existingCloudObjectForRecordID:v11 recordType:v12 accountID:v9 context:v8];

  return v13;
}

- (id)existingCloudObjectForRecordID:(id)a3 recordType:(id)a4 accountID:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10 || !v12)
  {
    if (v10)
    {
      if (v12)
      {
LABEL_7:
        id v16 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      id v25 = +[REMLog cloudkit];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        sub_10074A5E0((uint64_t)v11, (uint64_t)v12, v25);
      }

      if (v12) {
        goto LABEL_7;
      }
    }
    id v26 = +[REMLog cloudkit];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
      sub_10074A544((uint64_t)v11, v10);
    }

    goto LABEL_7;
  }
  if (v11)
  {
    id v14 = [(ICCloudContext *)self cloudObjectClassesByRecordType];
    id v15 = [v14 objectForKeyedSubscript:v11];

    id v16 = [v15 existingCloudObjectForRecordID:v10 accountID:v12 context:v13];
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v17 = [(ICCloudContext *)self cloudObjectClassesByRecordType];
    id v18 = [v17 allValues];

    id v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v28;
      while (2)
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = [*(id *)(*((void *)&v27 + 1) + 8 * i) existingCloudObjectForRecordID:v10 accountID:v12 context:v13];
          if (v23)
          {
            id v16 = (void *)v23;
            goto LABEL_18;
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }
    id v16 = 0;
LABEL_18:
  }
LABEL_19:

  return v16;
}

- (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(ICCloudContext *)self cloudObjectClassesByRecordType];
  id v12 = [v10 recordType];
  id v13 = [v11 objectForKeyedSubscript:v12];

  id v14 = [v13 newCloudObjectForRecord:v10 accountID:v9 context:v8];
  return v14;
}

- (id)newPlaceholderObjectForRecordID:(id)a3 account:(id)a4 recordType:(id)a5 context:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(ICCloudContext *)self cloudObjectClassesByRecordType];
  id v15 = [v14 objectForKeyedSubscript:v11];

  id v16 = [v15 newPlaceholderObjectForRecordID:v13 account:v12 context:v10];
  return v16;
}

- (void)fetchRecordIDs:(id)a3 accountID:(id)a4 operationGroupName:(id)a5 runExclusively:(BOOL)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = [(ICCloudContext *)self processingQueue];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000137AC;
  v21[3] = &unk_1008AE408;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  BOOL v26 = a6;
  id v25 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(v16, v21);
}

- (void)addFetchOperationsForRecordIDs:(id)a3 accountID:(id)a4 operationGroupName:(id)a5 runExclusively:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = +[REMLog cloudkit];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134217984;
    id v39 = [v12 count];
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Adding operations to fetch %ld records", buf, 0xCu);
  }

  id v17 = [(ICCloudContext *)self operationsToFetchRecordIDs:v12 operationGroupName:v14 accountID:v13];
  if (v8)
  {
    id v18 = objc_opt_class();
    id v19 = [(ICCloudContext *)self operationQueue];
    [v18 addRunExclusivelyOperations:v17 operationQueue:v19];

    if (!v15) {
      goto LABEL_15;
    }
  }
  else
  {
    id v20 = [(ICCloudContext *)self operationQueue];
    [v20 addOperations:v17 waitUntilFinished:0];

    [(ICCloudContext *)self errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary];
    if (!v15) {
      goto LABEL_15;
    }
  }
  id v29 = v13;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100013AB0;
  v34[3] = &unk_1008AE430;
  v34[4] = self;
  id v21 = v17;
  id v35 = v21;
  id v36 = v15;
  id v22 = +[ICNSBlockOperation blockOperationWithBlock:v34];
  [v22 setName:ICNSBlockOperationNameFetchCompletion];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v23 = v21;
  id v24 = [v23 countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v31;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(v23);
        }
        [v22 addDependency:*(void *)(*((void *)&v30 + 1) + 8 * i)];
      }
      id v25 = [v23 countByEnumeratingWithState:&v30 objects:v37 count:16];
    }
    while (v25);
  }

  long long v28 = [(ICCloudContext *)self operationQueue];
  [v28 addOperation:v22];

  [(ICCloudContext *)self errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary];
  id v13 = v29;
LABEL_15:
}

- (id)operationsToFetchRecordIDs:(id)a3 operationGroupName:(id)a4 accountID:(id)a5
{
  id v8 = a3;
  id v9 = (__CFString *)a4;
  id v10 = a5;
  if (![v10 length])
  {
    id v12 = +[REMLog cloudkit];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_10074A658();
    }
    goto LABEL_19;
  }
  if (![v8 count])
  {
    id v12 = +[REMLog cloudkit];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LODWORD(v36) = 138543362;
      *(void *)((char *)&v36 + 4) = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "No record IDs to fetch, no fetch record operation is created for accountID: %{public}@", (uint8_t *)&v36, 0xCu);
    }
LABEL_19:
    id v22 = &__NSArray0__struct;
    goto LABEL_20;
  }
  id v11 = +[NSMutableArray array];
  id v12 = [(id)objc_opt_class() objectsByDatabaseScope:v8];
  *(void *)&long long v36 = 0;
  *((void *)&v36 + 1) = &v36;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  [(ICCloudContext *)self containerForAccountID:v10];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100014014;
  v28[3] = &unk_1008AE458;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v29 = v13;
  long long v30 = self;
  id v14 = v11;
  id v31 = v14;
  long long v32 = &v36;
  [v12 enumerateKeysAndObjectsUsingBlock:v28];
  if (!v9) {
    id v9 = @"FetchIndividualRecords";
  }
  id v15 = objc_alloc_init((Class)CKOperationGroup);
  [v15 setName:v9];
  [v15 setQuantity:[v8 count]];
  [v15 setExpectedSendSize:1];
  [v15 setExpectedReceiveSize:CKOperationGroupTransferSizeForBytes()];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v16 = v14;
  id v17 = [v16 countByEnumeratingWithState:&v24 objects:v35 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v25;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * i) setGroup:v15, v24];
      }
      id v17 = [v16 countByEnumeratingWithState:&v24 objects:v35 count:16];
    }
    while (v17);
  }

  id v20 = +[REMLog cloudkit];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    id v21 = [v15 ic_loggingDescription];
    *(_DWORD *)long long buf = 138543362;
    id v34 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Fetching records with operation group %{public}@", buf, 0xCu);
  }
  id v22 = v16;

  _Block_object_dispose(&v36, 8);
LABEL_20:

  return v22;
}

- (id)operationsToFetchRecordIDs:(id)a3 database:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableArray array];
  id v9 = [v6 ic_arrayByGroupingIntoArraysWithMaxCount:100];
  if ((unint64_t)[v9 count] >= 2)
  {
    id v10 = +[REMLog cloudkit];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      unsigned int v11 = [v6 count];
      [v7 databaseScope];
      id v12 = CKDatabaseScopeString();
      *(_DWORD *)long long buf = 67109634;
      unsigned int v26 = v11;
      __int16 v27 = 2114;
      long long v28 = v12;
      __int16 v29 = 1024;
      unsigned int v30 = [v9 count];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Grouping fetch requests for %d %{public}@ records into %d batches", buf, 0x18u);
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v9;
  id v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = -[ICCloudContext operationToFetchRecordIDs:database:](self, "operationToFetchRecordIDs:database:", *(void *)(*((void *)&v20 + 1) + 8 * i), v7, (void)v20);
        [v8 addObject:v18];
      }
      id v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  return v8;
}

- (id)operationToFetchRecordIDs:(id)a3 database:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)CKFetchRecordsOperation) initWithRecordIDs:v6];
  [(ICCloudContext *)self configureOperation:v8];
  [v8 setDatabase:v7];
  objc_initWeak(&location, v8);
  id v9 = +[REMLog cloudkit];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [v8 ic_loggingDescription];
    *(_DWORD *)long long buf = 138543362;
    id v34 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Creating %{public}@", buf, 0xCu);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v29;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v14);
        uint64_t v16 = +[REMLog cloudkit];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          id v17 = v8;
          uint64_t v18 = [v15 ic_loggingDescription];
          id v19 = [v8 ic_loggingDescription];
          *(_DWORD *)long long buf = 138543618;
          id v34 = v18;
          __int16 v35 = 2114;
          long long v36 = v19;
          _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Will fetch %{public}@ %{public}@", buf, 0x16u);

          id v8 = v17;
        }

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v11 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v12);
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100014738;
  v26[3] = &unk_1008AE480;
  v26[4] = self;
  objc_copyWeak(&v27, &location);
  [v8 setPerRecordProgressBlock:v26];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000147B8;
  v24[3] = &unk_1008AE4A8;
  v24[4] = self;
  objc_copyWeak(&v25, &location);
  [v8 setPerRecordCompletionBlock:v24];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100014898;
  v22[3] = &unk_1008AE4D0;
  v22[4] = self;
  objc_copyWeak(&v23, &location);
  [v8 setFetchRecordsCompletionBlock:v22];
  id v20 = v8;
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&location);

  return v20;
}

- (void)fetchOperation:(id)a3 progressChangedWithRecordID:(id)a4 progress:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  if (((int)(a5 * 100.0) - 1) <= 0x62)
  {
    id v9 = +[REMLog cloudkit];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = [v8 ic_loggingDescription];
      id v11 = [v7 ic_loggingDescription];
      int v12 = 138543874;
      uint64_t v13 = v10;
      __int16 v14 = 1024;
      int v15 = (int)(a5 * 100.0);
      __int16 v16 = 2114;
      id v17 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Progress fetching %{public}@: %d%% %{public}@", (uint8_t *)&v12, 0x1Cu);
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
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014B80;
  block[3] = &unk_1008AE520;
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

- (void)fetchOperation:(id)a3 didCompleteWithRecordsByRecordID:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(ICCloudContext *)self processingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000151A4;
  block[3] = &unk_1008ADD00;
  id v13 = v8;
  id v14 = v7;
  id v15 = self;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, block);
}

- (void)didFetchShare:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 rootRecordID];
  if (!v11)
  {
    id v12 = [v8 objectForKeyedSubscript:@"RootRecord"];
    if (v12)
    {
      id v13 = objc_alloc((Class)CKRecordID);
      id v14 = [v12 recordID];
      id v15 = [v14 recordName];
      id v16 = [v8 recordID];
      id v17 = [v16 zoneID];
      id v11 = [v13 initWithRecordName:v15 zoneID:v17];
    }
    else
    {
      id v11 = 0;
    }
  }
  id v18 = [v8 objectForKeyedSubscript:@"RootRecordType"];
  if (!v18)
  {
    unsigned int v26 = [v8 creatorUserRecordID];
    id v19 = [v26 recordName];

    if (v19 && ![v19 isEqualToString:CKCurrentUserDefaultName])
    {
      id v27 = +[REMLog cloudkit];
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        goto LABEL_27;
      }
      long long v29 = [v8 ic_loggingDescription];
      __int16 v35 = [v11 ic_loggingDescription];
      *(_DWORD *)long long buf = 138412802;
      v40 = v29;
      __int16 v41 = 2114;
      id v42 = v35;
      __int16 v43 = 2112;
      uint64_t v44 = (uint64_t)v19;
      _os_log_fault_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "No root record type in share %@ for %{public}@, shareCreatorRecordName %@", buf, 0x20u);
    }
    else
    {
      id v27 = +[REMCDAccount cloudKitAccountWithCKIdentifier:v9 context:v10];
      if (!v27)
      {
        long long v28 = +[REMLog cloudkit];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_10074A898((uint64_t)v9, v11);
        }
      }
      long long v29 = +[REMLog cloudkit];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        uint64_t v38 = [v8 ic_loggingDescription];
        long long v33 = [v11 ic_loggingDescription];
        [v27 ckUserRecordName];
        *(_DWORD *)long long buf = 138412802;
        v40 = v38;
        __int16 v41 = 2114;
        id v42 = v33;
        v44 = __int16 v43 = 2112;
        id v34 = (void *)v44;
        _os_log_fault_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "No root record type in share %@ for %{public}@, default shareUserRecordName %@", buf, 0x20u);
      }
    }

LABEL_27:
    goto LABEL_28;
  }
  if (v11)
  {
    id v19 = [(ICCloudContext *)self existingCloudObjectForRecordID:v11 recordType:v18 accountID:v9 context:v10];
    if (v19)
    {
LABEL_9:
      id v20 = +[REMLog cloudkit];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = [v8 recordID];
        id v22 = [v21 ic_loggingDescription];
        id v23 = [v19 recordType];
        [v19 recordID];
        long long v24 = v37 = v9;
        [v24 ic_loggingDescription];
        v25 = id v36 = v10;
        *(_DWORD *)long long buf = 138543874;
        v40 = v22;
        __int16 v41 = 2114;
        id v42 = v23;
        __int16 v43 = 2114;
        uint64_t v44 = (uint64_t)v25;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Received share %{public}@ for %{public}@ %{public}@", buf, 0x20u);

        id v9 = v37;
        id v10 = v36;
      }
      [v19 setServerShareIfNewer:v8];
      goto LABEL_28;
    }
    uint64_t v30 = +[REMCDAccount cloudKitAccountWithCKIdentifier:v9 context:v10];
    if (v30)
    {
      long long v31 = (void *)v30;
      id v19 = [(ICCloudContext *)self newPlaceholderObjectForRecordID:v11 account:v30 recordType:v18 context:v10];

      if (v19) {
        goto LABEL_9;
      }
    }
    else
    {
      long long v32 = +[REMLog cloudkit];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543874;
        v40 = v9;
        __int16 v41 = 2114;
        id v42 = v11;
        __int16 v43 = 2114;
        uint64_t v44 = (uint64_t)v18;
        _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "didFetchShare: Cannot get CK account {ckIdentifier: %{public}@} for newPlaceholderObjectForRecordID {record: %{public}@, rootRecordType: %{public}@}", buf, 0x20u);
      }
    }
    id v19 = +[REMLog cloudkit];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10074A9D8(v8, v19);
    }
  }
  else
  {
    id v19 = +[REMLog cloudkit];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      sub_10074A934(v8, v19);
    }
  }
LABEL_28:
}

- (void)deleteSharesForObjects:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[ICCloudContext objectsByAccount:v6];
  if ([v8 count])
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = sub_10000984C;
    void v15[4] = sub_10000985C;
    id v16 = 0;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    void v14[3] = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000159D8;
    v9[3] = &unk_1008AE570;
    void v9[4] = self;
    id v12 = v15;
    id v10 = v8;
    id v13 = v14;
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

- (void)deleteSharesForObjects:(id)a3 accountID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  id v12 = objc_alloc_init((Class)NSMutableArray);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v13 = v8;
  id v14 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v18 isSharedRootObject])
        {
          [v11 addObject:v18];
          id v19 = [v18 objectID];
          [v12 addObject:v19];
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v15);
  }

  if ([v11 count])
  {
    id v20 = +[REMLog cloudkit];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v11 count];
      *(_DWORD *)long long buf = 138543618;
      id v34 = v9;
      __int16 v35 = 2048;
      id v36 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Will Delete Shares in account ID %{public}@ for %lu Objects:", buf, 0x16u);
    }

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100015EC4;
    v27[3] = &unk_1008AE598;
    id v22 = v9;
    id v28 = v22;
    [v11 enumerateObjectsUsingBlock:v27];
    id v23 = [(ICCloudContext *)self operationsToModifyRecordsForCloudObjectsToSave:0 delete:0 deleteShares:v11 operationGroupName:@"DeleteShares" addDependencies:0 accountID:v22];
    long long v24 = [(ICCloudContext *)self operationQueue];
    [v24 addOperations:v23 waitUntilFinished:0];

    [(ICCloudContext *)self errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary];
    id v25 = [(ICCloudContext *)self fetchAndCompletionOperationWithDeleteShareObjects:v11 accountID:v22 dependencyOperations:v23 completionHandler:v10];
    unsigned int v26 = [(ICCloudContext *)self operationQueue];
    [v26 addOperation:v25];

    [(ICCloudContext *)self errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary];
  }
  else if (v10)
  {
    v10[2](v10, 0);
  }
}

- (id)fetchAndCompletionOperationWithDeleteShareObjects:(id)a3 accountID:(id)a4 dependencyOperations:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v39 = a5;
  id v37 = a6;
  id v12 = objc_alloc_init((Class)NSMutableArray);
  id v13 = objc_alloc_init((Class)NSMutableSet);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v14 = v10;
  id v15 = [v14 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v53;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v53 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        if ([v19 isSharedRootObject])
        {
          id v20 = [v19 objectID];
          [v12 addObject:v20];

          id v21 = [v19 recordID];
          id v22 = v21;
          if (v21)
          {
            id v23 = [v21 zoneID];
            [v13 addObject:v23];
          }
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v16);
  }

  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100016358;
  v47[3] = &unk_1008AE628;
  v47[4] = self;
  id v24 = v13;
  id v48 = v24;
  id v38 = v11;
  id v49 = v38;
  id v25 = v12;
  id v50 = v25;
  id v26 = v37;
  id v51 = v26;
  id v27 = objc_retainBlock(v47);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100016720;
  v44[3] = &unk_1008AE430;
  v44[4] = self;
  id v28 = v39;
  id v45 = v28;
  long long v29 = v27;
  id v46 = v29;
  long long v30 = +[ICNSBlockOperation blockOperationWithBlock:v44];
  [v30 setName:ICNSBlockOperationNameDeleteSharesForObjectsFetchAndCompletion];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v31 = v28;
  id v32 = [v31 countByEnumeratingWithState:&v40 objects:v56 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v41;
    do
    {
      for (j = 0; j != v33; j = (char *)j + 1)
      {
        if (*(void *)v41 != v34) {
          objc_enumerationMutation(v31);
        }
        [v30 addDependency:*(void *)(*((void *)&v40 + 1) + 8 * (void)j)];
      }
      id v33 = [v31 countByEnumeratingWithState:&v40 objects:v56 count:16];
    }
    while (v33);
  }

  return v30;
}

- (id)operationsToModifyRecordsForCloudObjectsToSave:(id)a3 delete:(id)a4 deleteShares:(id)a5 operationGroupName:(id)a6 addDependencies:(BOOL)a7 accountID:(id)a8
{
  id v13 = a3;
  id v74 = a4;
  id v73 = a5;
  id v72 = (__CFString *)a6;
  id v76 = a8;
  id v71 = v13;
  if (![v76 length])
  {
    v57 = +[REMLog cloudkit];
    if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT)) {
      sub_10074AAE8();
    }
    goto LABEL_72;
  }
  if (![v13 count] && !objc_msgSend(v74, "count") && !objc_msgSend(v73, "count"))
  {
    v57 = +[REMLog cloudkit];
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v76;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "No cloud objects to save or delete or delelet-share, no modify record operation is created for accountID: %{public}@", buf, 0xCu);
    }
LABEL_72:
    id v68 = &__NSArray0__struct;
    goto LABEL_73;
  }
  BOOL v70 = a7;
  if ([v13 count])
  {
    id v14 = +[REMLog cloudkit];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134218242;
      *(void *)&uint8_t buf[4] = [v13 count];
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v76;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Creating operations to push %ld records for account ID %{public}@", buf, 0x16u);
    }
  }
  if ([v74 count])
  {
    id v15 = +[REMLog cloudkit];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = [v74 count];
      *(_DWORD *)long long buf = 134218242;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v76;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Creating operations to delete %ld records for account ID %{public}@", buf, 0x16u);
    }
  }
  if ([v73 count])
  {
    uint64_t v17 = +[REMLog cloudkit];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = [v73 count];
      *(_DWORD *)long long buf = 134218242;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v76;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Creating operations to delete %ld share records for account ID %{public}@", buf, 0x16u);
    }
  }
  uint64_t v78 = +[NSMutableDictionary dictionary];
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v19 = v13;
  id v20 = [v19 countByEnumeratingWithState:&v106 objects:v118 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v107;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v107 != v21) {
          objc_enumerationMutation(v19);
        }
        id v23 = *(void **)(*((void *)&v106 + 1) + 8 * i);
        id v24 = [v23 recordID];
        if (v24) {
          [v78 setObject:v23 forKeyedSubscript:v24];
        }
      }
      id v20 = [v19 countByEnumeratingWithState:&v106 objects:v118 count:16];
    }
    while (v20);
  }

  id v25 = [v19 mutableCopy];
  id v26 = +[NSMutableArray array];
  id v27 = objc_opt_class();
  v103[0] = _NSConcreteStackBlock;
  v103[1] = 3221225472;
  v103[2] = sub_100017478;
  v103[3] = &unk_1008AE650;
  id v77 = v25;
  id v104 = v77;
  id v79 = v26;
  id v105 = v79;
  [v27 recursivelyFixCrossZoneRelationship:v19 perObjectHandler:v103];
  if ([v79 count])
  {
    id v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Records with cross zone relationship are found. Will try to delete old records and upload new records. {count: %lu}", [v79 count]);
    [(id)objc_opt_class() faultAndPromptToFileRadarWithICTap2RadarType:4 logMessage:v28];
  }
  CFStringRef v29 = v72;
  if (!v72) {
    CFStringRef v29 = @"ModifyRecords";
  }
  id v72 = (__CFString *)v29;
  id v81 = objc_alloc_init((Class)CKOperationGroup);
  [v81 setName:v72];
  [v81 setQuantity:((char *)objc_msgSend(v73, "count")+ (void)objc_msgSend(v77, "count")+ (void)objc_msgSend(v79, "count")+ (unint64_t)objc_msgSend(v74, "count"))];
  [v81 setExpectedReceiveSize:1];
  uint64_t v80 = +[NSMutableArray array];
  long long v30 = [(id)objc_opt_class() deduplicatedRecordsForCloudObjects:v74];
  [v79 addObjectsFromArray:v30];

  v83 = +[NSMutableDictionary dictionary];
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v31 = v73;
  id v32 = [v31 countByEnumeratingWithState:&v99 objects:v117 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v100;
    do
    {
      for (j = 0; j != v32; j = (char *)j + 1)
      {
        if (*(void *)v100 != v33) {
          objc_enumerationMutation(v31);
        }
        __int16 v35 = *(void **)(*((void *)&v99 + 1) + 8 * (void)j);
        id v36 = [v35 ckServerShare];
        id v37 = v36;
        if (v36)
        {
          if (objc_msgSend(v36, "ic_isOwnedByCurrentUser"))
          {
            [v35 setCkServerShare:0];
            [v77 addObject:v35];
          }
          [v79 addObject:v37];
          id v38 = [v35 recordID];
          if (v38)
          {
            id v39 = [v35 recordID];
            long long v40 = [v37 recordID];
            [v83 setObject:v39 forKeyedSubscript:v40];
          }
          else
          {
            id v39 = +[REMLog cloudkit];
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              long long v43 = [v35 shortLoggingDescription];
              *(_DWORD *)long long buf = 138543618;
              *(void *)&uint8_t buf[4] = v43;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v76;
              _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "No root record ID when trying to delete share for %{public}@ for account ID %{public}@", buf, 0x16u);
            }
          }
        }
        else
        {
          id v38 = +[REMLog cloudkit];
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            long long v41 = [v35 ckServerRecord];
            long long v42 = [v41 ic_loggingDescription];
            *(_DWORD *)long long buf = 138543618;
            *(void *)&uint8_t buf[4] = v42;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v76;
            _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Record to delete share from doesn't have a server share %{public}@ for accountID %{public}@", buf, 0x16u);
          }
        }
      }
      id v32 = [v31 countByEnumeratingWithState:&v99 objects:v117 count:16];
    }
    while (v32);
  }

  uint64_t v44 = [(id)objc_opt_class() deduplicatedRecordsForCloudObjects:v77];
  id v75 = [v44 mutableCopy];

  [v79 ic_removeRecordsWithSameCKRecordIDInRecords:v75];
  id v45 = [(id)objc_opt_class() objectsByDatabaseScope:v75];
  id v46 = [(id)objc_opt_class() objectsByDatabaseScope:v79];
  v47 = [(ICCloudContext *)self containerForAccountID:v76];
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v48 = [&off_1008D7838 countByEnumeratingWithState:&v95 objects:v116 count:16];
  if (v48)
  {
    uint64_t v49 = *(void *)v96;
    do
    {
      for (k = 0; k != v48; k = (char *)k + 1)
      {
        if (*(void *)v96 != v49) {
          objc_enumerationMutation(&off_1008D7838);
        }
        id v51 = *(void **)(*((void *)&v95 + 1) + 8 * (void)k);
        long long v52 = [v47 databaseWithDatabaseScope:[v51 integerValue]];
        long long v53 = [v45 objectForKeyedSubscript:v51];
        long long v54 = [v46 objectForKeyedSubscript:v51];
        long long v55 = [(ICCloudContext *)self operationsToModifyRecordsToSave:v53 delete:v54 rootRecordIDsByShareID:v83 database:v52];
        [v80 addObjectsFromArray:v55];
      }
      id v48 = [&off_1008D7838 countByEnumeratingWithState:&v95 objects:v116 count:16];
    }
    while (v48);
  }
  v56 = [(ICCloudContext *)self operationToSaveZonesIfNecessaryForAccountID:v76];
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  uint64_t v115 = 0;
  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472;
  v88[2] = sub_1000174E4;
  v88[3] = &unk_1008AE678;
  v57 = v78;
  v89 = v57;
  v90 = self;
  v93 = buf;
  BOOL v94 = v70;
  id v58 = v56;
  id v91 = v58;
  id v59 = v80;
  id v92 = v59;
  [v59 enumerateObjectsUsingBlock:v88];
  [v81 setExpectedSendSize:CKOperationGroupTransferSizeForBytes()];
  if (v58) {
    [v59 addObject:v58];
  }
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v60 = v59;
  id v61 = [v60 countByEnumeratingWithState:&v84 objects:v113 count:16];
  if (v61)
  {
    uint64_t v62 = *(void *)v85;
    do
    {
      for (m = 0; m != v61; m = (char *)m + 1)
      {
        if (*(void *)v85 != v62) {
          objc_enumerationMutation(v60);
        }
        [*(id *)(*((void *)&v84 + 1) + 8 * (void)m) setGroup:v81];
      }
      id v61 = [v60 countByEnumeratingWithState:&v84 objects:v113 count:16];
    }
    while (v61);
  }

  if ((unint64_t)[v60 count] >= 2)
  {
    long long v64 = +[REMLog cloudkit];
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG)) {
      sub_10074AB1C((uint64_t)v112, (uint64_t)[v60 count], v64);
    }
  }
  long long v65 = +[REMLog cloudkit];
  if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
  {
    long long v66 = [v81 ic_loggingDescription];
    *(_DWORD *)v110 = 138543362;
    v111 = v66;
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "Modifying records with operation group %{public}@", v110, 0xCu);
  }
  long long v67 = v92;
  id v68 = v60;

  _Block_object_dispose(buf, 8);
LABEL_73:

  return v68;
}

+ (void)batchRecordsToSave:(id)a3 delete:(id)a4 maxRecordCountPerBatch:(unint64_t)a5 maxRecordSizePerBatch:(unint64_t)a6 withBlock:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a7;
  id v13 = +[REMLog cloudkit];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    long long v65 = [v10 ic_map:&stru_1008AE6B8];
    long long v66 = [v11 ic_map:&stru_1008AE6D8];
    *(_DWORD *)long long buf = 138413058;
    *(void *)v83 = v65;
    *(_WORD *)&v83[8] = 2112;
    *(void *)&v83[10] = v66;
    *(_WORD *)&v83[18] = 2048;
    *(void *)&v83[20] = a5;
    __int16 v84 = 2048;
    unint64_t v85 = a6;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Batching with recordsToSave:%@ recordsToDelete:%@, maxRecordCountPerBatch:%lu, maxRecordSizePerBatch:%lu", buf, 0x2Au);
  }
  id v68 = v10;
  id v14 = [v10 mutableCopy];
  id v15 = v11;
  id v16 = v14;
  long long v67 = v15;
  id v17 = [v15 mutableCopy];
  uint64_t v18 = 0;
  id v69 = v12;
  id v71 = v17;
  while ([v16 count] || objc_msgSend(v17, "count"))
  {
    uint64_t v70 = v18 + 1;
    id v19 = +[NSMutableArray arrayWithCapacity:a5];
    id v73 = +[NSMutableArray arrayWithCapacity:a5];
    unint64_t v20 = 0;
    while (1)
    {
      if ([v16 count])
      {
        uint64_t v21 = [v16 firstObject];
        id v22 = [v21 recordType];
        id v23 = +[REMCDAlarm ckRecordType];
        unsigned int v24 = [v22 isEqualToString:v23];

        if ((unint64_t)[v16 count] < 2)
        {
          id v25 = 0;
        }
        else
        {
          id v25 = [v16 objectAtIndexedSubscript:1];
        }
        CFStringRef v29 = [v25 recordType];
        long long v30 = +[REMCDAlarmTrigger ckRecordType];
        unsigned int v31 = [v29 isEqualToString:v30];

        LODWORD(v30) = v24 & v31;
        id v32 = (char *)[v21 size];
        uint64_t v33 = v32;
        if (v30 == 1)
        {
          uint64_t v34 = (char *)[v25 size];
          __int16 v35 = &v33[v20];
          unint64_t v36 = a6;
          id v37 = &v34[(void)v35];
          id v38 = [v19 count];
          unint64_t v39 = v36;
          long long v40 = (char *)[v73 count] + (void)v38 + 2;
          BOOL v41 = (unint64_t)v37 >= v36 || (unint64_t)v40 > a5;
          char v42 = v41;
          BOOL v28 = v41 && v20 == 0;
          if (v28)
          {
            long long v43 = +[REMLog cloudkit];
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              long long v55 = [v21 recordID];
              v56 = [v25 recordID];
              *(_DWORD *)long long buf = 138543618;
              *(void *)v83 = v55;
              *(_WORD *)&v83[8] = 2114;
              *(void *)&v83[10] = v56;
              _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Ending batch because an impossible batch was detected ICCloudContext. Alarm: %{public}@ AlarmTrigger: %{public}@", buf, 0x16u);
            }
LABEL_51:
            id v50 = +[REMLog cloudkit];
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
            {
              long long v53 = [v21 recordID];
              long long v54 = [v25 recordID];
              *(_DWORD *)long long buf = 138412546;
              *(void *)v83 = v53;
              *(_WORD *)&v83[8] = 2112;
              *(void *)&v83[10] = v54;
              _os_log_debug_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "Adding Alarm/AlarmTrigger pair to batch: %@ %@", buf, 0x16u);
            }
            [v16 removeObjectsInRange:0, 2];
            v81[0] = v21;
            v81[1] = v25;
            id v51 = +[NSArray arrayWithObjects:v81 count:2];
            [v19 addObjectsFromArray:v51];

            unint64_t v20 = (unint64_t)v37;
          }
          else
          {
            if ((v42 & 1) == 0) {
              goto LABEL_51;
            }
            uint64_t v49 = +[REMLog cloudkit];
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
            {
              BOOL v57 = (unint64_t)v40 <= a5;
              id v58 = [v21 recordID];
              id v59 = [v25 recordID];
              *(_DWORD *)long long buf = 67109634;
              *(_DWORD *)v83 = v57;
              *(_WORD *)&v83[4] = 2112;
              *(void *)&v83[6] = v58;
              *(_WORD *)&v83[14] = 2112;
              *(void *)&v83[16] = v59;
              _os_log_debug_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "Ending batch because Alarm/AlarmTrigger pair does not fit isCountOK: %d Alarm: %@ AlarmTrigger: %@", buf, 0x1Cu);
            }
            BOOL v28 = 1;
          }
          a6 = v39;
        }
        else
        {
          unint64_t v44 = (unint64_t)&v32[v20];
          if (v20) {
            BOOL v45 = 0;
          }
          else {
            BOOL v45 = v44 >= a6;
          }
          BOOL v28 = v45;
          if (v45 || v44 < a6)
          {
            if (v28)
            {
              v47 = +[REMLog cloudkit];
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
                sub_10074AC24((uint64_t)v80, (uint64_t)v21);
              }
            }
            id v48 = +[REMLog cloudkit];
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
              sub_10074ABCC((uint64_t)v79, (uint64_t)v21);
            }

            [v16 removeObjectAtIndex:0];
            [v19 addObject:v21];
            unint64_t v20 = v44;
          }
          else
          {
            id v46 = +[REMLog cloudkit];
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
              sub_10074AC8C((uint64_t)v78, (uint64_t)v21);
            }

            BOOL v28 = 1;
          }
        }

        goto LABEL_56;
      }
      if ([v71 count])
      {
        id v26 = [v71 firstObject];
        uint64_t v21 = [v26 recordID];

        id v27 = +[REMLog cloudkit];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)v83 = v21;
          _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Adding record to delete batch: %@", buf, 0xCu);
        }

        [v71 removeObjectAtIndex:0];
        [v73 addObject:v21];
        BOOL v28 = 0;
      }
      else
      {
        uint64_t v21 = +[REMLog cloudkit];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          sub_10074AB94(&v76, v77);
        }
        BOOL v28 = 1;
      }
LABEL_56:

      long long v52 = (char *)[v19 count];
      if (&v52[(void)[v73 count]] >= (char *)a5) {
        break;
      }
      if (v28) {
        goto LABEL_65;
      }
    }
    id v60 = +[REMLog cloudkit];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
      sub_10074AB5C(&v74, v75);
    }

LABEL_65:
    id v61 = +[REMLog cloudkit];
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
    {
      long long v64 = [v19 ic_map:&stru_1008AE6F8];
      *(_DWORD *)long long buf = 138412546;
      *(void *)v83 = v64;
      *(_WORD *)&v83[8] = 2112;
      *(void *)&v83[10] = v73;
      _os_log_debug_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "Finished batch with batchRecordsToSave:%@ batchRecordIDsToDelete:%@", buf, 0x16u);
    }
    id v62 = [v19 copy];
    id v63 = [v73 copy];
    id v12 = v69;
    uint64_t v18 = v70;
    (*((void (**)(id, uint64_t, id, id))v69 + 2))(v69, v70, v62, v63);

    id v17 = v71;
  }
}

- (id)operationsToModifyRecordsToSave:(id)a3 delete:(id)a4 rootRecordIDsByShareID:(id)a5 database:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[NSMutableArray array];
  if (!v10)
  {
    id v16 = 0;
    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    id v25 = 0;
    goto LABEL_6;
  }
  id v15 = [(id)objc_opt_class() sortedRecords:v10];
  id v16 = [v15 mutableCopy];

  if (!v11) {
    goto LABEL_5;
  }
LABEL_3:
  [(id)objc_opt_class() sortedRecords:v11];
  id v33 = v13;
  id v17 = v12;
  id v18 = v16;
  id v19 = v11;
  id v20 = v10;
  v22 = uint64_t v21 = v14;
  id v23 = [v22 reverseObjectEnumerator];
  unsigned int v24 = [v23 allObjects];
  id v25 = [v24 mutableCopy];

  id v14 = v21;
  id v10 = v20;
  id v11 = v19;
  id v16 = v18;
  id v12 = v17;
  id v13 = v33;
LABEL_6:
  id v26 = objc_opt_class();
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100018258;
  v34[3] = &unk_1008AE720;
  v34[4] = self;
  id v35 = v12;
  id v36 = v13;
  id v27 = v14;
  id v37 = v27;
  id v28 = v13;
  id v29 = v12;
  [v26 batchRecordsToSave:v16 delete:v25 maxRecordCountPerBatch:100 maxRecordSizePerBatch:0x200000 withBlock:v34];
  long long v30 = v37;
  id v31 = v27;

  return v31;
}

- (id)operationToModifyRecordsToSave:(id)a3 delete:(id)a4 rootRecordIDsByShareID:(id)a5 database:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v37 = a5;
  id v12 = a6;
  id v13 = +[REMLog cloudkit];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_10074ACE4();
  }

  unint64_t v39 = v11;
  long long v40 = v10;
  id v14 = [objc_alloc((Class)CKModifyRecordsOperation) initWithRecordsToSave:v10 recordIDsToDelete:v11];
  id v38 = self;
  [(ICCloudContext *)self configureOperation:v14];
  id v36 = v12;
  [v14 setDatabase:v12];
  id v15 = +[REMLog cloudkit];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = [v14 ic_loggingDescription];
    *(_DWORD *)long long buf = 138543362;
    id v51 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Creating modify operation %{public}@", buf, 0xCu);
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v17 = [v14 recordsToSave];
  id v18 = [v17 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v46;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v46 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        id v23 = +[REMLog cloudkit];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          unsigned int v24 = [v22 ic_loggingDescription];
          id v25 = [v14 ic_loggingDescription];
          *(_DWORD *)long long buf = 138412546;
          id v51 = v24;
          __int16 v52 = 2114;
          long long v53 = v25;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Will push %@ %{public}@", buf, 0x16u);
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v19);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v26 = [v14 recordIDsToDelete];
  id v27 = [v26 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v42;
    do
    {
      for (j = 0; j != v28; j = (char *)j + 1)
      {
        if (*(void *)v42 != v29) {
          objc_enumerationMutation(v26);
        }
        id v31 = *(void **)(*((void *)&v41 + 1) + 8 * (void)j);
        id v32 = +[REMLog cloudkit];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          id v33 = [v31 ic_loggingDescription];
          uint64_t v34 = [v14 ic_loggingDescription];
          *(_DWORD *)long long buf = 138543618;
          id v51 = v33;
          __int16 v52 = 2114;
          long long v53 = v34;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Will delete %{public}@ %{public}@", buf, 0x16u);
        }
      }
      id v28 = [v26 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v28);
  }

  [(ICCloudContext *)v38 addCallbackBlocksToModifyRecordsOperation:v14 rootRecordIDsByShareID:v37];

  return v14;
}

- (void)addCallbackBlocksToModifyRecordsOperation:(id)a3 rootRecordIDsByShareID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, v6);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100018920;
  v17[3] = &unk_1008AE748;
  void v17[4] = self;
  objc_copyWeak(&v18, &location);
  [v6 setPerRecordSaveBlock:v17];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000189C8;
  void v14[3] = &unk_1008AE770;
  void v14[4] = self;
  objc_copyWeak(&v16, &location);
  id v8 = v7;
  id v15 = v8;
  [v6 setPerRecordDeleteBlock:v14];
  +[NSMutableDictionary dictionary];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100018A60;
  v12[3] = &unk_1008AE798;
  v12[4] = self;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v9;
  [v6 setPerRecordProgressBlock:v12];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100018BAC;
  v10[3] = &unk_1008AE7C0;
  void v10[4] = self;
  objc_copyWeak(&v11, &location);
  [v6 setModifyRecordsCompletionBlock:v10];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)modifyRecordsOperation:(id)a3 recordWasSavedWithRecordID:(id)a4 record:(id)a5 context:(id)a6 onProcessingQueue:(BOOL)a7 error:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v33 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = [v14 database];
  id v19 = [(ICCloudContext *)self accountIDForDatabase:v18];

  if (![v19 length])
  {
    uint64_t v20 = +[REMLog cloudkit];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      sub_10074ADFC();
    }
  }
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x3032000000;
  id v51 = sub_10000984C;
  __int16 v52 = sub_10000985C;
  if (v16)
  {
    id v21 = v16;
  }
  else
  {
    if (v17) {
      [(ICCloudContext *)self contextForAccountID:v19 withBatchFetchHelper:1];
    }
    else {
    id v21 = [(ICCloudContext *)self internalContextWithBatchFetchHelper];
    }
  }
  id v53 = v21;
  id v22 = objc_opt_class();
  id v23 = [v15 recordName];
  unsigned int v24 = [v22 ckIdentifierFromRecordName:v23];
  long long v54 = v24;
  id v25 = +[NSArray arrayWithObjects:&v54 count:1];

  id v26 = [(id)v49[5] batchFetchHelper];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100018FDC;
  v40[3] = &unk_1008AE838;
  id v27 = v17;
  long long v47 = &v48;
  id v41 = v27;
  long long v42 = self;
  id v28 = v15;
  id v43 = v28;
  id v29 = v19;
  id v44 = v29;
  id v30 = v14;
  id v45 = v30;
  id v31 = v33;
  id v46 = v31;
  [v26 addCKIdentifiers:v25 accountIdentifier:v29 onCurrentQueue:v9 dispatchBlock:v40];
  if (!v16)
  {
    [v26 flushOnCurrentQueue:v9];
    id v32 = (void *)v49[5];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100019404;
    v34[3] = &unk_1008AE860;
    id v35 = v29;
    id v36 = v28;
    id v37 = v27;
    id v38 = self;
    unint64_t v39 = &v48;
    [v32 performBlockAndWait:v34];
  }
  _Block_object_dispose(&v48, 8);
}

- (void)modifyRecordsOperation:(id)a3 recordWasDeletedWithRecordID:(id)a4 rootRecordIDsByShareID:(id)a5 onProcessingQueue:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = a5;
  id v16 = [v12 database];
  id v17 = [(ICCloudContext *)self accountIDForDatabase:v16];

  if (![v17 length])
  {
    id v18 = +[REMLog cloudkit];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_10074AE8C();
    }
  }
  long long v40 = v14;
  id v19 = [(ICCloudContext *)self contextForAccountID:v17 withBatchFetchHelper:1];
  uint64_t v20 = [v15 objectForKeyedSubscript:v13];

  id v41 = (void *)v20;
  BOOL v39 = v20 != 0;
  if (v20) {
    id v21 = (void *)v20;
  }
  else {
    id v21 = v13;
  }
  id v22 = v21;
  id v23 = objc_opt_class();
  [v22 recordName];
  v25 = BOOL v24 = v8;
  id v26 = [v23 ckIdentifierFromRecordName:v25];
  BOOL v57 = v26;
  id v27 = +[NSArray arrayWithObjects:&v57 count:1];

  id v28 = [v19 batchFetchHelper];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100019824;
  v48[3] = &unk_1008AE888;
  id v29 = v19;
  id v49 = v29;
  uint64_t v50 = self;
  id v51 = v22;
  id v30 = v17;
  id v52 = v30;
  id v53 = v12;
  id v31 = v40;
  id v54 = v31;
  BOOL v56 = v39;
  id v32 = v13;
  id v55 = v32;
  id v33 = v12;
  id v34 = v22;
  [v28 addCKIdentifiers:v27 accountIdentifier:v30 onCurrentQueue:v24 dispatchBlock:v48];
  [v28 flushOnCurrentQueue:v24];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10001A0F8;
  v42[3] = &unk_1008AE520;
  id v43 = v30;
  id v44 = v32;
  id v45 = v31;
  id v46 = self;
  id v47 = v29;
  id v35 = v29;
  id v36 = v31;
  id v37 = v32;
  id v38 = v30;
  [v35 performBlockAndWait:v42];
}

- (void)modifyRecordsOperation:(id)a3 didCompleteWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(ICCloudContext *)self processingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A26C;
  block[3] = &unk_1008ADD00;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)handleGenericPartialFailuresForError:(id)a3 operation:(id)a4
{
  id v31 = a3;
  id v6 = a4;
  id v7 = [v6 database];
  BOOL v8 = [(ICCloudContext *)self accountIDForDatabase:v7];

  if (![v8 length])
  {
    id v9 = +[REMLog cloudkit];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_10074B390();
    }
  }
  uint64_t v45 = 0;
  id v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  id v10 = +[NSMutableSet set];
  id v11 = +[NSMutableSet set];
  id v12 = [v31 userInfo];
  id v30 = [v12 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10001ABA0;
  v41[3] = &unk_1008AE8B0;
  id v44 = &v45;
  id v13 = v10;
  id v42 = v13;
  id v14 = v11;
  id v43 = v14;
  [v30 enumerateKeysAndObjectsUsingBlock:v41];
  if (*((unsigned char *)v46 + 24))
  {
    id v15 = +[REMLog cloudkit];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10074B328();
    }

    id v16 = [(ICCloudContext *)self cloudContextDelegate];
    [v16 didFailPushingExceededStorageQuotaForContext:self accountID:v8];
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v13;
  id v17 = [obj countByEnumeratingWithState:&v37 objects:v54 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v38;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v38 != v18) {
          objc_enumerationMutation(obj);
        }
        -[ICCloudContext receivedZoneNotFound:operation:](self, "receivedZoneNotFound:operation:", *(void *)(*((void *)&v37 + 1) + 8 * i), v6, v30);
      }
      id v17 = [obj countByEnumeratingWithState:&v37 objects:v54 count:16];
    }
    while (v17);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v20 = v14;
  id v21 = [v20 countByEnumeratingWithState:&v33 objects:v53 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v34;
    do
    {
      id v23 = 0;
      do
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v20);
        }
        BOOL v24 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v23);
        id v25 = +[REMLog cloudkit];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          id v29 = [v24 ic_loggingDescription];
          *(_DWORD *)long long buf = 138543618;
          uint64_t v50 = v8;
          __int16 v51 = 2114;
          id v52 = v29;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "User deleted zone in account ID %{public}@: %{public}@", buf, 0x16u);
        }
        id v26 = [(ICCloudContext *)self accountZoneIDsNeedingToBeSaved];
        [v26 ic_addZoneID:v24 forAccountID:v8];

        id v27 = [v6 database];
        -[ICCloudContext deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:](self, "deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:", v24, [v27 databaseScope], v8);

        id v28 = [(ICCloudContext *)self cloudContextDelegate];
        [v28 cloudContext:self userDidDeleteRecordZoneWithID:v24 accountID:v8];

        id v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      id v21 = [v20 countByEnumeratingWithState:&v33 objects:v53 count:16];
    }
    while (v21);
  }

  _Block_object_dispose(&v45, 8);
}

+ (id)sortedRecords:(id)a3
{
  id v3 = a3;
  id v51 = 0;
  id v4 = +[CKRecordGraph topologicallySortRecords:v3 withError:&v51];
  id v5 = v51;
  long long v39 = v3;
  if (v5)
  {
    id v6 = +[REMLog cloudkit];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10074B488();
    }

    id v7 = v3;
    id v4 = v7;
  }
  long long v38 = v5;
  id v40 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v4 count]];
  id v42 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:(unint64_t)[v4 count] >> 1];
  id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:((unint64_t)objc_msgSend(v4, "count") >> 1)];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v4;
  id v9 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v48;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v48 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        id v14 = [v13 recordType];
        id v15 = +[REMCDAlarm ckRecordType];
        unsigned int v16 = [v14 isEqualToString:v15];

        if (v16)
        {
          id v17 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
          [v17 setObject:v13 atIndexedSubscript:0];
          [v8 addObject:v17];
          uint64_t v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v8 count] - 1);
          id v19 = [v13 recordID];
          [v42 setObject:v18 forKeyedSubscript:v19];

          continue;
        }
        id v20 = [v13 recordType];
        id v21 = +[REMCDAlarmTrigger ckRecordType];
        if (([v20 isEqualToString:v21] & 1) == 0)
        {

LABEL_17:
          [v40 addObject:v13];
          continue;
        }
        uint64_t v22 = +[REMCDAlarmTrigger alarmReferenceCKRecordType];
        id v23 = [v13 objectForKeyedSubscript:v22];

        if (!v23) {
          goto LABEL_17;
        }
        BOOL v24 = +[REMCDAlarmTrigger alarmReferenceCKRecordType];
        id v25 = [v13 objectForKeyedSubscript:v24];

        id v26 = [v25 recordID];
        id v27 = [v42 objectForKeyedSubscript:v26];

        if (v27)
        {
          id v28 = [v8 objectAtIndexedSubscript:[v27 integerValue]];
          [v28 addObject:v13];
        }
        else
        {
          [v40 addObject:v13];
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v10);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v29 = v8;
  id v30 = [v29 countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v44;
    do
    {
      for (j = 0; j != v31; j = (char *)j + 1)
      {
        if (*(void *)v44 != v32) {
          objc_enumerationMutation(v29);
        }
        [v40 addObjectsFromArray:*(void *)(*((void *)&v43 + 1) + 8 * (void)j)];
      }
      id v31 = [v29 countByEnumeratingWithState:&v43 objects:v52 count:16];
    }
    while (v31);
  }

  id v34 = [v40 count];
  if (v34 != [v39 count])
  {
    long long v35 = +[NSString stringWithFormat:@"Record counts[%lu] after sorting[%lu] in ICCloudContext were not equal", [v39 count], objc_msgSend(v40, "count")];
    [(id)objc_opt_class() faultAndPromptToFileRadarWithICTap2RadarType:2 logMessage:v35];
  }
  id v36 = [v40 copy];

  return v36;
}

+ (id)objectsByAccount:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v23;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v16 = 0;
        id v17 = &v16;
        uint64_t v18 = 0x3032000000;
        id v19 = sub_10000984C;
        id v20 = sub_10000985C;
        id v21 = 0;
        id v9 = [v8 managedObjectContext];
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_10001B4F4;
        v15[3] = &unk_1008ADB18;
        void v15[4] = v8;
        void v15[5] = &v16;
        [v9 performBlockAndWait:v15];

        if ([(id)v17[5] length])
        {
          id v10 = [v4 objectForKeyedSubscript:v17[5]];
          if (!v10)
          {
            id v10 = +[NSMutableArray array];
            [v4 setObject:v10 forKeyedSubscript:v17[5]];
          }
          [v10 addObject:v8];
        }
        else
        {
          uint64_t v11 = [v8 managedObjectContext];
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_10001B540;
          void v14[3] = &unk_1008ADA80;
          void v14[4] = v8;
          [v11 performBlockAndWait:v14];
        }
        _Block_object_dispose(&v16, 8);
      }
      id v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v5);
  }

  return v4;
}

+ (id)objectsByDatabaseScope:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = [v10 rd_ckDatabaseScope:v16];
        id v12 = +[NSNumber numberWithInteger:v11];
        id v13 = [v4 objectForKeyedSubscript:v12];

        if (!v13)
        {
          id v13 = +[NSMutableArray array];
          id v14 = +[NSNumber numberWithInteger:v11];
          [v4 setObject:v13 forKeyedSubscript:v14];
        }
        [v13 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (void)recursivelyFixCrossZoneRelationship:(id)a3 perObjectHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSMutableSet set];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    long long v16 = v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v14 = [v13 recordID:v16];
        if (v14)
        {
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_10001B940;
          v17[3] = &unk_1008AE8D8;
          long long v18 = v6;
          [v13 recursivelyFixCrossZoneRelationshipWithVisitedMap:v7 perObjectHandler:v17];
          id v15 = v18;
        }
        else
        {
          id v15 = +[REMLog cloudkit];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
            sub_10074B598(&v19, v16);
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }
}

+ (id)deduplicatedRecordsForCloudObjects:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v3 count]);
  id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v12 = [v11 recordID];
        if (v12)
        {
          if ([v4 containsObject:v12])
          {
            id v13 = +[REMLog cloudkit];
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
              sub_10074B5D0((uint64_t)v22, (uint64_t)v12);
            }
          }
          else
          {
            id v13 = [v11 newlyCreatedRecord];
            if (v13)
            {
              [v4 addObject:v12];
              [v5 addObject:v13];
            }
          }
        }
        else
        {
          id v13 = +[REMLog cloudkit];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
            sub_10074B598(&v16, v17);
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v8);
  }

  id v14 = [v5 copy];

  return v14;
}

+ (BOOL)haveZoneIDsInAccountZoneIDs:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_10001BC58;
  v6[3] = &unk_1008AE900;
  void v6[4] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (id)errorsFromError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    uint64_t v11 = &__NSArray0__struct;
    goto LABEL_22;
  }
  id v6 = [v4 domain];
  if ([v6 isEqualToString:CKErrorDomain])
  {
    id v7 = [v5 code];

    if (v7 == (id)2)
    {
      id v8 = [v5 userInfo];
      uint64_t v9 = [v8 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        char v10 = REMDynamicCast();
        uint64_t v11 = [v10 allValues];
      }
      else
      {
        uint64_t v11 = &__NSArray0__struct;
      }

      goto LABEL_22;
    }
  }
  else
  {
  }
  id v12 = [v5 domain];
  if (![v12 isEqualToString:@"com.apple.reminders.cloud"])
  {

    goto LABEL_19;
  }
  id v13 = [v5 code];

  if (v13 != (id)2)
  {
LABEL_19:
    id v27 = v5;
    uint64_t v11 = +[NSArray arrayWithObjects:&v27 count:1];
    goto LABEL_22;
  }
  uint64_t v11 = +[NSMutableArray array];
  id v14 = [v5 userInfo];
  id v15 = [v14 objectForKeyedSubscript:@"Errors"];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = [a1 errorsFromError:*(void *)(*((void *)&v23 + 1) + 8 * i) withError:v23];
        [v11 addObjectsFromArray:v21];
      }
      id v18 = [v16 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v18);
  }

LABEL_22:

  return v11;
}

+ (void)saveAndFaultIfFailWithContext:(id)a3 shouldTakeServerAsTruth:(BOOL)a4 logDescription:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  uint64_t v9 = REMDynamicCast();
  char v10 = (void *)v9;
  if (!v6 || !v9)
  {
    uint64_t v11 = 0;
    if (objc_msgSend(v7, "ic_saveWithLogDescription:", @"%@", v8)) {
      goto LABEL_11;
    }
LABEL_10:
    id v14 = +[NSString stringWithFormat:@"Fail to save context for %@", v8];
    [(id)objc_opt_class() faultAndPromptToFileRadarWithICTap2RadarType:3 logMessage:v14];

    goto LABEL_11;
  }
  uint64_t v11 = [[RDStoreControllerValidationPolicy alloc] initWithShouldValidateMoveAcrossSharedList:0 saveShouldContinueIfCustomValidationFailed:1];
  [v10 setValidationPolicy:v11];
  unsigned __int8 v12 = [v7 ic_saveWithLogDescription:@"%@", v8];
  [v10 setValidationPolicy:0];
  if ((v12 & 1) == 0) {
    goto LABEL_10;
  }
  if (v11 && [(RDStoreControllerValidationPolicy *)v11 customValidationFailed])
  {
    id v13 = +[REMLog cloudkit];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10074B628();
    }
  }
LABEL_11:
}

+ (void)addRunExclusivelyOperations:(id)a3 operationQueue:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_10001C14C;
  v6[3] = &unk_1008ADA80;
  id v7 = a3;
  id v5 = v7;
  [a4 addBarrierBlock:v6];
}

- (BOOL)partialError:(id)a3 containsErrorCode:(int64_t)a4
{
  id v5 = a3;
  if ([v5 code] != (id)2)
  {
    id v17 = +[REMLog cloudkit];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      sub_10074B690();
    }
  }
  objc_opt_class();
  BOOL v6 = [v5 userInfo];
  id v7 = [v6 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];
  id v8 = REMDynamicCast();
  uint64_t v9 = [v8 allValues];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        if (objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "code", (void)v18) == (id)a4)
        {
          BOOL v15 = 1;
          goto LABEL_12;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_12:

  return v15;
}

- (void)addDependenciesForModifyRecordsOperation:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(ICCloudContext *)self operationQueue];
  BOOL v6 = [v5 operations];
  id v7 = [v6 copy];

  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          [v4 addDependency:v12];
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

+ (void)faultAndPromptToFileRadarWithICTap2RadarType:(unint64_t)a3 title:(id)a4 description:(id)a5 logMessage:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  long long v13 = +[REMLog cloudkit];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    sub_10074B6C4();
  }

  [a1 promptToFileRadarWithICTap2RadarType:a3 title:v12 description:v11 logMessage:v10 additionalFaultMessage:0];
}

+ (void)promptToFileRadarWithICTap2RadarType:(unint64_t)a3 title:(id)a4 description:(id)a5 logMessage:(id)a6 additionalFaultMessage:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (+[REMSystemUtilities isInternalInstall])
  {
    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    long long v14 = +[ICCloudConfiguration sharedConfiguration];
    [v14 tapToRadarThrottlingInterval];
    uint64_t v16 = v15;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1009228D8);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10001CB70;
    v25[3] = &unk_1008AE968;
    v25[4] = &v26;
    v25[5] = a3;
    v25[6] = v16;
    sub_10001CB70((uint64_t)v25);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1009228D8);
    if (*((unsigned char *)v27 + 24))
    {
      if (v7)
      {
        id v17 = +[REMLog cloudkit];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          sub_10074B6C4();
        }
      }
      id v18 = REMRadarUtilitiesAlertMessageDefault;
      if ((unint64_t)[v11 length] < 0x97)
      {
        id v19 = v11;
      }
      else
      {
        [v11 substringWithRange:0, 150];
        id v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      long long v20 = v19;
      long long v21 = +[NSString stringWithFormat:@"REM: %@", v19];
      if ((unint64_t)[v12 length] < 0x12D)
      {
        id v22 = v12;
      }
      else
      {
        [v12 substringWithRange:0, 300];
        id v22 = (id)objc_claimAutoreleasedReturnValue();
      }
      long long v23 = v22;
      long long v24 = +[NSString stringWithFormat:@"%@\n%@", v22, REMRadarUtilitiesBugDescriptionDefault];
      +[REMRadarUtilities promptUserToFileBugWithAlertMessage:v18 bugTitle:v21 bugDescription:v24];
    }
    _Block_object_dispose(&v26, 8);
  }
}

+ (void)faultAndPromptToFileRadarWithICTap2RadarType:(unint64_t)a3 logMessage:(id)a4
{
}

+ (void)errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessaryForOperationQueue:(id)a3
{
  id v3 = [a3 operations];
  id v4 = [v3 count];
  if ((unint64_t)v4 >= 0x51)
  {
    id v5 = +[NSString stringWithFormat:@"Too many operations in ICCC operation queue. {count: %lu}", v4];
    id v6 = objc_alloc_init((Class)NSMutableString);
    [v6 appendString:v5];
    [v6 appendString:@", operations: "];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v3;
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) ic_shortLoggingOperationName];
          [v6 appendFormat:@"%@,", v12];

          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    id v13 = +[REMLog cloudkit];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10074B72C();
    }
  }
}

- (void)errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary
{
  id v3 = objc_opt_class();
  id v4 = [(ICCloudContext *)self operationQueue];
  [v3 errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessaryForOperationQueue:v4];
}

- (id)operationToSaveZonesIfNecessaryForAccountID:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet set];
  id v36 = self;
  id v6 = [(ICCloudContext *)self accountZoneIDsNeedingToBeSaved];
  long long v35 = v4;
  id v7 = [v6 objectForKeyedSubscript:v4];
  id v8 = [v7 allObjects];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v47;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v47 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        long long v15 = [v14 ownerName];
        unsigned int v16 = [v15 isEqualToString:CKCurrentUserDefaultName];

        if (v16) {
          [v5 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v11);
  }
  id v34 = v9;

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v17 = [(ICCloudContext *)v36 operationQueue];
  id v18 = [v17 operations];

  id v19 = [v18 countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v43;
    do
    {
      id v22 = 0;
      id v37 = v20;
      do
      {
        if (*(void *)v43 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v22);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v24 = v23;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v25 = [v24 recordZonesToSave];
          id v26 = [v25 countByEnumeratingWithState:&v38 objects:v50 count:16];
          if (v26)
          {
            id v27 = v26;
            uint64_t v28 = *(void *)v39;
            do
            {
              for (j = 0; j != v27; j = (char *)j + 1)
              {
                if (*(void *)v39 != v28) {
                  objc_enumerationMutation(v25);
                }
                id v30 = [*(id *)(*((void *)&v38 + 1) + 8 * (void)j) zoneID];
                [v5 removeObject:v30];
              }
              id v27 = [v25 countByEnumeratingWithState:&v38 objects:v50 count:16];
            }
            while (v27);
          }

          id v20 = v37;
        }
        id v22 = (char *)v22 + 1;
      }
      while (v22 != v20);
      id v20 = [v18 countByEnumeratingWithState:&v42 objects:v51 count:16];
    }
    while (v20);
  }

  if ([v5 count])
  {
    id v31 = [v5 allObjects];
    uint64_t v32 = [(ICCloudContext *)v36 operationToSaveZonesForZoneIDs:v31 accountID:v35];
  }
  else
  {
    uint64_t v32 = 0;
  }

  return v32;
}

- (id)operationToSaveZonesForZoneIDs:(id)a3 accountID:(id)a4
{
  id v5 = a3;
  id v27 = a4;
  long long v25 = v5;
  if ([v27 length])
  {
    id v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v5;
    id v7 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v39;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v39 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = [objc_alloc((Class)CKRecordZone) initWithZoneID:*(void *)(*((void *)&v38 + 1) + 8 * i)];
          [v6 addObject:v10];
        }
        id v7 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v7);
    }

    id v24 = [(ICCloudContext *)self containerForAccountID:v27];
    id val = [objc_alloc((Class)CKModifyRecordZonesOperation) initWithRecordZonesToSave:v6 recordZoneIDsToDelete:0];
    [(ICCloudContext *)self configureOperation:val];
    id v11 = [v24 privateCloudDatabase];
    [val setDatabase:v11];

    objc_initWeak(&location, val);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v12 = v6;
    id v13 = [v12 countByEnumeratingWithState:&v33 objects:v46 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v34;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v34 != v14) {
            objc_enumerationMutation(v12);
          }
          unsigned int v16 = *(void **)(*((void *)&v33 + 1) + 8 * (void)j);
          long long v17 = +[REMLog cloudkit];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            id v18 = [v16 zoneID];
            id v19 = [v18 ic_loggingDescription];
            id v20 = [val ic_loggingDescription];
            *(_DWORD *)long long buf = 138543618;
            long long v43 = v19;
            __int16 v44 = 2114;
            long long v45 = v20;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Will save zone %{public}@ %{public}@", buf, 0x16u);
          }
        }
        id v13 = [v12 countByEnumeratingWithState:&v33 objects:v46 count:16];
      }
      while (v13);
    }

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10001D63C;
    v30[3] = &unk_1008AE990;
    objc_copyWeak(&v32, &location);
    v30[4] = self;
    id v31 = v27;
    [val setModifyRecordZonesCompletionBlock:v30];
    id v21 = objc_alloc_init((Class)CKOperationGroup);
    [v21 setName:@"SaveRecordZones"];
    [v21 setQuantity:[obj count]];
    [v21 setExpectedSendSize:1];
    [v21 setExpectedReceiveSize:1];
    [val setGroup:v21];
    id v22 = val;

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v12 = +[REMLog cloudkit];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_10074B794();
    }
    id v22 = 0;
  }

  return v22;
}

- (void)contextDidSave:(id)a3
{
  id v4 = a3;
  if (![(ICCloudContext *)self isDisabled]
    && ![(ICCloudContext *)self isDisabledInternal]
    && [(ICCloudContext *)self supportsCloudKitSyncing]
    && [(ICCloudContext *)self isInternetReachable]
    && [(ICCloudContext *)self hasPassedBuddy]
    && ([(ICCloudContext *)self pendingAccountInitializerCompleteOnLaunch]
     || [(ICCloudContext *)self isReadyToSyncWithActiveAccountAvailable:1]))
  {
    id v5 = [v4 userInfo];
    id v6 = [v5 objectForKeyedSubscript:NSDeletedObjectIDsKey];

    id v7 = [v4 userInfo];
    long long v23 = [v7 objectForKeyedSubscript:NSInsertedObjectIDsKey];

    uint64_t v8 = [v4 userInfo];
    id v24 = [v8 objectForKeyedSubscript:NSUpdatedObjectIDsKey];

    id v9 = NSManagedObjectContextTransactionAuthorKey;
    id v10 = [v4 userInfo];
    id v11 = [v10 objectForKey:v9];

    objc_opt_class();
    uint64_t v12 = REMDynamicCast();
    if (v12 && [(id)objc_opt_class() isNonUploadingTransactionAuthor:v12])
    {
      id v13 = +[REMLog cloudkit];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "contextDidSave excludes author: %{public}@", (uint8_t *)&buf, 0xCu);
      }

      id v14 = v11;
      id v11 = v9;
      id v9 = v24;
      id v24 = v23;
    }
    else
    {
      long long v15 = +[NSMutableSet set];
      if ([v23 count]) {
        [v15 unionSet:v23];
      }
      if ([v24 count]) {
        [v15 unionSet:v24];
      }
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v35 = 0x3032000000;
      long long v36 = sub_10000984C;
      id v37 = sub_10000985C;
      id v38 = +[NSMutableSet set];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v14 = v15;
      id v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v30;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v30 != v17) {
              objc_enumerationMutation(v14);
            }
            [*(id *)(*((void *)&buf + 1) + 40) addObject:*(void *)(*((void *)&v29 + 1) + 8 * i)];
          }
          id v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v16);
      }

      id v19 = [(ICCloudContext *)self processingQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001DE38;
      block[3] = &unk_1008AE9B8;
      void block[4] = self;
      id v26 = v6;
      id v27 = v12;
      p_long long buf = &buf;
      id v20 = v12;
      id v21 = v6;
      dispatch_async(v19, block);

      _Block_object_dispose(&buf, 8);
      id v6 = v23;
    }
  }
}

- (void)_addOperationToProcessBlockWithOperationName:(id)a3 processBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ICCloudContext *)self processingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E280;
  block[3] = &unk_1008AE430;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)addOperationToProcessObjectsWithOperationName:(id)a3 syncReason:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001E8BC;
  v13[3] = &unk_1008AEA08;
  objc_copyWeak(&v17, &location);
  id v11 = v8;
  id v14 = v11;
  id v15 = v9;
  id v12 = v10;
  id v16 = v12;
  [(ICCloudContext *)self _addOperationToProcessBlockWithOperationName:v11 processBlock:v13];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)processPendingCloudObjects
{
}

- (void)processPendingCloudObjectsWithOperationName:(id)a3
{
  id v4 = a3;
  id v5 = +[REMLog cloudkit];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "os_transaction INIT {name: com.apple.remindd.cloudkit.processPendingCloudObjects[%@]}", buf, 0xCu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001EBA4;
  v8[3] = &unk_1008AEA30;
  id v9 = v4;
  id v10 = (id)os_transaction_create();
  id v6 = v10;
  id v7 = v4;
  [(ICCloudContext *)self addOperationToProcessObjectsWithOperationName:v7 syncReason:0 completionHandler:v8];
}

- (void)processPendingCloudObjectsWithOperationName:(id)a3 syncReason:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[REMLog cloudkit];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v59 = v8;
    __int16 v60 = 2114;
    id v61 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SYNC[COREDATA] START {operationName: %{public}@, syncReason: %{public}@}", buf, 0x16u);
  }

  id v12 = +[REMLog cloudkit];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "os_transaction INIT {name: com.apple.remindd.cloudkit.sync.coredata}", buf, 2u);
  }

  id v13 = (void *)os_transaction_create();
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10001F394;
  v52[3] = &unk_1008AEA58;
  id v14 = v10;
  id v54 = v14;
  id v15 = v13;
  id v53 = v15;
  id v16 = objc_retainBlock(v52);
  if (![(ICCloudContext *)self isReadyToSync])
  {
    if ([(ICCloudContext *)self isCloudKitAccountAvailable])
    {
      unsigned int v18 = [(ICCloudContext *)self pendingAccountInitializerCompleteOnLaunch];
      id v17 = +[REMLog cloudkit];
      BOOL v19 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
      if (v18)
      {
        if (v19) {
          sub_10074B97C(self, v17);
        }

        id v20 = [(ICCloudContext *)self objectIDsToRetry];
        id v21 = [(ICCloudContext *)self objectIDsToProcess];
        [v20 unionSet:v21];

        id v17 = +[NSMutableSet set];
        [(ICCloudContext *)self setObjectIDsToProcess:v17];
      }
      else if (v19)
      {
        sub_10074BA78(self, v17);
      }
    }
    else
    {
      id v17 = +[REMLog cloudkit];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10074BB04();
      }
    }
    goto LABEL_30;
  }
  if (![(ICCloudContext *)self isInternetReachable])
  {
    id v17 = +[REMLog cloudkit];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10074B948();
    }
    goto LABEL_30;
  }
  if ([(ICCloudContext *)self uploadSuspended])
  {
    id v17 = +[REMLog cloudkit];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10074B914();
    }
LABEL_30:

    long long v33 = +[REMLog cloudkit];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_10074B8E0();
    }

    long long v25 = [(id)objc_opt_class() errorForDisabledCloudSyncing];
    long long v64 = v25;
    id v26 = +[NSArray arrayWithObjects:&v64 count:1];
    ((void (*)(void *, void *))v16[2])(v16, v26);
    goto LABEL_33;
  }
  long long v43 = v8;
  id v22 = +[REMSignpost sync];
  os_signpost_id_t v23 = os_signpost_id_generate(v22);
  id v24 = v22;
  long long v25 = v24;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "cloudkit.coredata", "", buf, 2u);
  }
  os_signpost_id_t v40 = v23;

  id v26 = +[NSDate date];
  id v27 = +[DABabysitter sharedBabysitter];
  uint64_t v28 = [v27 tokenByRegisteringAccount:self forOperationWithName:@"SYNC[COREDATA]"];

  if (v28)
  {
LABEL_27:
    long long v30 = [(ICCloudContext *)self processingQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001F444;
    block[3] = &unk_1008AEAD0;
    void block[4] = self;
    id v45 = v43;
    id v46 = v9;
    id v47 = v26;
    long long v48 = v25;
    uint64_t v51 = v41;
    id v49 = v28;
    long long v50 = v16;
    id v31 = v28;
    long long v32 = v25;
    long long v25 = v26;
    dispatch_async(v30, block);

    id v8 = v43;
    id v26 = v32;
    goto LABEL_33;
  }
  if (isCloudContextSyncReasonUserInitiated(v9))
  {
    long long v29 = +[REMLog cloudkit];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v38 = [(ICCloudContext *)self waiterID];
      *(_DWORD *)long long buf = 138543874;
      id v59 = v43;
      __int16 v60 = 2114;
      id v61 = v9;
      __int16 v62 = 2114;
      id v63 = v38;
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Bypassing babysitter against processPendingCloudObjects, which failed too many times, because sync was user initiated {operationName: %{public}@, syncReason: %{public}@, waiterID: %{public}@}", buf, 0x20u);
    }
    goto LABEL_27;
  }
  CFStringRef v56 = @"identifier";
  CFStringRef v57 = @"SYNC[COREDATA]";
  uint64_t v34 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
  uint64_t v35 = +[REMError babySatErrorWithOperationName:@"SYNC[COREDATA]"];
  long long v42 = (void *)v34;
  +[Analytics postEventWithName:@"SYNC[COREDATA]" payload:v34 error:v35 performAutoBugCaptureOnError:1];
  long long v36 = +[REMLog cloudkit];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
  {
    long long v39 = [(ICCloudContext *)self waiterID];
    *(_DWORD *)long long buf = 138543874;
    id v59 = v43;
    __int16 v60 = 2114;
    id v61 = v9;
    __int16 v62 = 2114;
    id v63 = v39;
    _os_log_fault_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_FAULT, "Babysitting processPendingCloudObjects because it failed too many times {operationName: %{public}@, syncReason: %{public}@, waiterID: %{public}@}", buf, 0x20u);
  }
  id v55 = v35;
  id v37 = +[NSArray arrayWithObjects:&v55 count:1];
  ((void (*)(void *, void *))v16[2])(v16, v37);

  id v8 = v43;
LABEL_33:
}

- (void)addProcessLocalObjectsOperationToMergeLocalObjectsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = ICNSBlockOperationNameProcessLocalObjects;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001FDEC;
  v7[3] = &unk_1008AEBD8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(ICCloudContext *)self _addOperationToProcessBlockWithOperationName:v5 processBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_scheduleRetryMergeLocalObjects
{
  id v3 = [(ICCloudContext *)self processingQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(ICCloudContext *)self retryCountsByOperationType];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"Merge.Local"];
  id v6 = (void *)v5;
  id v7 = &off_1008D7198;
  if (v5) {
    id v7 = (_UNKNOWN **)v5;
  }
  id v8 = v7;

  id v9 = +[REMLog cloudkit];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 67109120;
    LODWORD(v28) = [v8 intValue];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MERGE.LOCAL: Scheduling retry, if we are within limit (currentRetryCount: %d).", (uint8_t *)&v27, 8u);
  }

  id v10 = +[ICCloudContext _systemBuildVersion];
  id v11 = +[ICCloudConfiguration sharedConfiguration];
  id v12 = [v11 mergeLocalObjectsMaximumRetryCount];
  if ((unint64_t)v12 > (int)[v8 intValue])
  {
    [v11 mergeLocalObjectsRetryStartOverThrottleInterval];
    double v14 = v13;
    id v15 = +[REMUserDefaults daemonUserDefaults];
    id v16 = [v15 cloudKitMergeLocalLastDateMaxRetryReached];
    id v17 = [v15 cloudKitMergeLocalLastBuildVersionMaxRetryReached];
    if (v16)
    {
      unsigned int v18 = +[NSDate now];
      [v18 timeIntervalSinceDate:v16];
      if (v19 < v14 && v17)
      {
        unsigned __int8 v20 = [v10 isEqualToString:v17];

        if (v20)
        {
          id v21 = +[REMLog cloudkit];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            id v26 = [v16 ic_localDateWithSeconds];
            int v27 = 138412802;
            uint64_t v28 = v26;
            __int16 v29 = 2112;
            long long v30 = v17;
            __int16 v31 = 2112;
            long long v32 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "MERGE.LOCAL: Maximum retry count previously reached, aborting {lastMaxRetry: {date: %@, build: %@}, currentBuild: %@}", (uint8_t *)&v27, 0x20u);
          }
          [(ICCloudContext *)self setNeedsToMergeLocalObjects:0];
          [(ICCloudContext *)self clearRetryCountForOperationType:@"Merge.Local"];
          goto LABEL_18;
        }
      }
      else
      {
      }
    }
    [(ICCloudContext *)self setNeedsToMergeLocalObjects:1];
    [v11 mergeLocalObjectsInitialRetryInterval];
    long long v25 = +[REMError retryLaterErrorWithInterval:](REMError, "retryLaterErrorWithInterval:");
    [(ICCloudContext *)self incrementOrClearRetryCountForOperationType:@"Merge.Local" error:v25];
    [(ICCloudContext *)self startRetryTimerIfNecessaryWithError:v25];

LABEL_18:
    goto LABEL_19;
  }
  id v22 = +[REMLog cloudkit];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
    sub_10074BD90();
  }

  [(ICCloudContext *)self setNeedsToMergeLocalObjects:0];
  [(ICCloudContext *)self clearRetryCountForOperationType:@"Merge.Local"];
  os_signpost_id_t v23 = +[REMUserDefaults daemonUserDefaults];
  id v24 = +[NSDate now];
  [v23 setCloudKitMergeLocalLastDateMaxRetryReached:v24];

  id v15 = +[REMUserDefaults daemonUserDefaults];
  [v15 setCloudKitMergeLocalLastBuildVersionMaxRetryReached:v10];
LABEL_19:
}

- (void)processLocalObjectMergeEligibleObjectIDs:(id)a3 operationQueue:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = +[REMLog cloudkit];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MERGE.LOCAL[COREDATA] START", buf, 2u);
  }

  id v10 = +[REMLog cloudkit];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "os_transaction INIT {name: com.apple.remindd.cloudkit.merge.local.coredata}", buf, 2u);
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100020E6C;
  v24[3] = &unk_1008AEA58;
  id v25 = (id)os_transaction_create();
  id v26 = v8;
  id v11 = v25;
  id v12 = v8;
  double v13 = objc_retainBlock(v24);
  double v14 = +[NSDate date];
  id v15 = [(ICCloudContext *)self processingQueue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100020F1C;
  v19[3] = &unk_1008AEC28;
  id v20 = v7;
  id v21 = self;
  id v22 = v14;
  id v23 = v13;
  id v16 = v13;
  id v17 = v14;
  id v18 = v7;
  dispatch_async(v15, v19);
}

+ (BOOL)_performLocalObjectMergeWithEligibleObjectIDs:(id)a3 cloudKitAccount:(id)a4 managedObjectContext:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [v10 setDaWasMigrated:0];
  id v40 = a1;
  [a1 saveAndFaultIfFailWithContext:v11 shouldTakeServerAsTruth:0 logDescription:@"unset .daWasMigrated"];
  id v12 = INDateRelevanceProvider_ptr;
  double v13 = +[REMLog cloudkit];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v14 = [v10 ckIdentifier];
    *(_DWORD *)long long buf = 138543362;
    long long v48 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "MERGE.LOCAL: Unsetting .daWasMigrated (accountIdentifier=%{public}@, flagSaved=1)", buf, 0xCu);
  }
  id v38 = v10;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v9;
  id v15 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v44;
    do
    {
      id v18 = 0;
      id v41 = v16;
      do
      {
        if (*(void *)v44 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v43 + 1) + 8 * (void)v18);
        id v21 = [v11 objectWithID:v19];
        objc_opt_class();
        id v22 = REMDynamicCast();
        if ([v22 isMergeableWithLocalObject])
        {
          id v23 = v11;
          id v24 = [v22 existingLocalObjectToMergeWithPredicate:0];
          id v25 = [v12[201] cloudkit];
          BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
          if (v24)
          {
            uint64_t v27 = v17;
            if (v26)
            {
              uint64_t v28 = [v22 objectID];
              __int16 v29 = [v24 objectID];
              *(_DWORD *)long long buf = 138543618;
              long long v48 = v28;
              __int16 v49 = 2114;
              long long v50 = v29;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "MERGE.LOCAL: ...found an existingLocalObjectToMerge (objectMID=%{public}@, localObjectMID=%{public}@)", buf, 0x16u);

              id v12 = INDateRelevanceProvider_ptr;
            }

            id v30 = [v22 mergeWithLocalObject:v24];
            __int16 v31 = [v12[201] cloudkit];
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              long long v32 = +[NSNumber numberWithBool:v30];
              *(_DWORD *)long long buf = 138543362;
              long long v48 = v32;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "MERGE.LOCAL: ...mergeWithLocalObject (didMerge=%{public}@)", buf, 0xCu);

              id v12 = INDateRelevanceProvider_ptr;
            }

            id v11 = v23;
            [v23 refreshObject:v24 mergeChanges:1];
            uint64_t v17 = v27;
          }
          else
          {
            if (v26)
            {
              long long v33 = [v22 objectID];
              *(_DWORD *)long long buf = 138543362;
              long long v48 = v33;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "MERGE.LOCAL: ...no matching existingLocalObjectToMerge (objectMID=%{public}@)", buf, 0xCu);

              id v12 = INDateRelevanceProvider_ptr;
            }

            id v11 = v23;
          }
          [v11 refreshObject:v22 mergeChanges:1];

          id v16 = v41;
        }

        id v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v16);
  }

  uint64_t v34 = [v12[201] cloudkit];
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    uint64_t v35 = [v38 ckIdentifier];
    *(_DWORD *)long long buf = 138543362;
    long long v48 = v35;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "MERGE.LOCAL: final step to clean up account and lists, then save... (accountIdentifier=%{public}@)", buf, 0xCu);
  }
  [v38 cleanUpAfterLocalObjectMerge];
  if (a6) {
    *a6 = 0;
  }
  [v40 saveAndFaultIfFailWithContext:v11 shouldTakeServerAsTruth:0 logDescription:@"merged objects"];

  return 1;
}

- (void)processAllDirtyCloudObjectsWithSyncReason:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICCloudContext *)self processingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021950;
  block[3] = &unk_1008AE430;
  void block[4] = self;
  void block[5] = v7;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(v8, block);
}

- (void)retryProcessingCloudObjects
{
  id v3 = +[REMLog cloudkit];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(ICCloudContext *)self objectIDsToRetry];
    v6[0] = 67109120;
    v6[1] = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Retrying to process %d cloud objects", (uint8_t *)v6, 8u);
  }
  uint64_t v5 = [(ICCloudContext *)self processingSelectorDelayer];
  [v5 requestFire];
}

- (void)processObjectIDs:(id)a3 operationQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[REMLog cloudkit];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134217984;
    id v18 = [v8 count];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Processing %lu cloud objects, now going to fetch from CD and submit items to operation queue", buf, 0xCu);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100021D64;
  void v14[3] = &unk_1008AEC90;
  void v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  [(ICCloudContext *)self _processFetchedCloudObjectsWithObjectIDs:v8 usingBlock:v14];
}

- (void)_processFetchedCloudObjectsWithObjectIDs:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICCloudContext *)self processingQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(ICCloudContext *)self context];
  [(ICCloudContext *)self _processFetchedCloudObjectsWithObjectIDs:v7 withManagedObjectContext:v9 usingBlock:v6];
}

- (void)_processFetchedCloudObjectsWithObjectIDs:(id)a3 withManagedObjectContext:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(ICCloudContext *)self processingQueue];
  dispatch_assert_queue_V2(v11);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100021F64;
  v15[3] = &unk_1008AEC28;
  id v16 = v8;
  uint64_t v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v13 performBlockAndWait:v15];
}

- (BOOL)_isRecognizedCloudObjectClass:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = [(ICCloudContext *)self recognizedCloudObjectClasses];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    LOBYTE(v9) = [v8 BOOLValue];
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
    id v10 = [(ICCloudContext *)self cloudObjectClassesByRecordType];
    id v11 = [v10 allValues];

    uint64_t v9 = (uint64_t)[v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v11);
          }
          if (objc_opt_isKindOfClass())
          {
            uint64_t v9 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v9 = (uint64_t)[v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    id v14 = +[NSNumber numberWithBool:v9];
    id v15 = [(ICCloudContext *)self recognizedCloudObjectClasses];
    [v15 setObject:v14 forKeyedSubscript:v6];
  }
  return v9;
}

- (void)_processCloudObjectIDs:(id)a3 operationQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    id v11 = +[NSMutableArray array];
    uint64_t v12 = [(ICCloudContext *)self context];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100022BF4;
    v16[3] = &unk_1008AED08;
    id v17 = v8;
    id v18 = v12;
    long long v19 = self;
    id v20 = v11;
    id v21 = v9;
    id v22 = v10;
    id v13 = v11;
    id v14 = v12;
    [v14 performBlockAndWait:v16];

LABEL_5:
    goto LABEL_6;
  }
  if (v10)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100022BE0;
    v23[3] = &unk_1008AE138;
    id v24 = v10;
    id v15 = +[ICNSBlockOperation blockOperationWithBlock:v23];
    [v15 setName:ICNSBlockOperationNameProcessCompletion];
    [v9 addOperation:v15];
    [(id)objc_opt_class() errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessaryForOperationQueue:v9];

    id v14 = v24;
    goto LABEL_5;
  }
LABEL_6:
}

- (void)handleNotification:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(ICCloudContext *)self processingQueue];
  dispatch_assert_queue_V2(v8);

  if (![(ICCloudContext *)self isReadyToSync]
    || [(ICCloudContext *)self isDisabled]
    || [(ICCloudContext *)self isDisabledInternal]
    || ![(ICCloudContext *)self supportsCloudKitSyncing])
  {
    id v17 = +[REMLog cloudkit];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10074BEEC(self, v17);
    }

    if (v7)
    {
      id v18 = [(id)objc_opt_class() errorForDisabledCloudSyncing];
      v7[2](v7, v18);
    }
  }
  else
  {
    id v9 = +[REMLog cloudkit];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (_TtC7remindd36RDDebounceableCKDatabaseNotification *)objc_opt_class();
      id v11 = v10;
      uint64_t v12 = [v6 subscriptionID];
      *(_DWORD *)long long buf = 138543618;
      long long v33 = v10;
      __int16 v34 = 2114;
      uint64_t v35 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SYNC[APS] CONTINUE {notification.class: %{public}@, subscriptionID: %{public}@}", buf, 0x16u);
    }
    id v13 = (char *)[v6 notificationType];
    if ((unint64_t)(v13 - 1) < 3)
    {
      id v14 = +[REMLog cloudkit];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        id v16 = (_TtC7remindd36RDDebounceableCKDatabaseNotification *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)long long buf = 138543362;
        long long v33 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SYNC[APS] NOOP - Not handling CloudKit database notification %{public}@", buf, 0xCu);
      }
LABEL_23:

LABEL_24:
      if (v7) {
        v7[2](v7, 0);
      }
      goto LABEL_14;
    }
    if (v13 != (char *)4) {
      goto LABEL_24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v14 = +[REMLog cloudkit];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        sub_10074C00C();
      }
      goto LABEL_23;
    }
    id v19 = v6;
    id v20 = [v19 databaseScope];
    id v21 = [v19 notificationID];
    id v22 = [v19 subscriptionOwnerUserRecordID];
    id v23 = [v22 recordName];

    if ([v23 length])
    {
      id v24 = [[_TtC7remindd36RDDebounceableCKDatabaseNotification alloc] initWithDatabaseScope:v20 subscriptionOwnerUserRecordName:v23];
      id v25 = +[REMLog cloudkit];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v26 = [v21 debugDescription];
        *(_DWORD *)long long buf = 138543618;
        long long v33 = v24;
        __int16 v34 = 2114;
        uint64_t v35 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "SYNC[APS] CONTINUE - Received CloudKit database notification {debounceableDatabaseNotification: %{public}@, notificationID: %{public}@}", buf, 0x16u);
      }
      uint64_t v27 = [(ICCloudContext *)self apsNotificationHandlingDebouncer];
      uint64_t v28 = +[NSSet setWithObject:v24];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100023C10;
      v29[3] = &unk_1008AED58;
      v29[4] = self;
      __int16 v31 = v7;
      id v30 = v21;
      [v27 fire:v28 completion:v29];
    }
    else
    {
      id v24 = +[REMLog cloudkit];
      if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_ERROR)) {
        sub_10074BF78();
      }
    }
  }
LABEL_14:
}

- (void)handleDatabaseNotification:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 databaseScope];
  id v9 = [v6 subscriptionOwnerUserRecordName];
  id v10 = +[REMLog cloudkit];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SYNC[APS] CONTINUE - Fired from APS debouncer to execute CKDatabaseNotification handler {databaseNotification: %{public}@}", buf, 0xCu);
  }

  id v11 = [(ICCloudContext *)self containersByAccountID];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000241F0;
  v15[3] = &unk_1008AEDD0;
  void v15[4] = self;
  id v16 = v9;
  id v18 = v7;
  id v19 = v8;
  id v17 = v6;
  id v12 = v7;
  id v13 = v6;
  id v14 = v9;
  [v11 enumerateKeysAndObjectsUsingBlock:v15];
}

- (void)_handleDatabaseNotification:(id)a3 database:(id)a4 accountID:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v26 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = @"PushNotification";
  if (v11)
  {
    id v42 = v11;
    id v14 = +[NSArray arrayWithObjects:&v42 count:1];
    id v15 = [(ICCloudContext *)self setUpCloudSchemaCatchUpSyncContextMapWithAccountIDs:v14 syncReason:v13];
  }
  else
  {
    id v16 = +[REMLog cloudkit];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_10074C0F4();
    }

    id v15 = +[NSDictionary dictionary];
  }
  id v17 = [v15 count];
  id v18 = +[REMLog cloudkit];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543874;
    id v37 = v10;
    __int16 v38 = 2114;
    id v39 = v11;
    __int16 v40 = 1024;
    BOOL v41 = v17 != 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "...SYNC[APS] Handling CloudKit database notification, with potential debounced scopes from other notifications {databaseNotification: %{public}@, accountID: %{public}@, catchUpSync: %d}", buf, 0x1Cu);
  }
  BOOL v19 = v17 != 0;

  id v20 = +[NSMutableArray array];
  id v35 = v26;
  id v21 = +[NSArray arrayWithObjects:&v35 count:1];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100024988;
  v27[3] = &unk_1008AEE48;
  id v28 = v20;
  __int16 v29 = self;
  id v30 = v13;
  id v31 = v15;
  id v32 = v10;
  id v33 = v12;
  BOOL v34 = v19;
  id v22 = v12;
  id v23 = v10;
  id v24 = v15;
  id v25 = v20;
  [(ICCloudContext *)self fetchDatabaseChangesForDatabases:v21 reason:v13 cloudSchemaCatchUpSyncContextMap:v24 completionHandler:v27];
}

- (void)validateAccountZoneIDsNeedingFetchChanges
{
  id v3 = [(ICCloudContext *)self accountZoneIDsNeedingFetchChanges];
  id v4 = [v3 allKeys];
  uint64_t v5 = +[NSMutableSet setWithArray:v4];

  id v6 = [(ICCloudContext *)self containersByAccountID];
  id v7 = [v6 allKeys];
  id v8 = +[NSSet setWithArray:v7];

  [v5 minusSet:v8];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100024F14;
  v9[3] = &unk_1008AE2F0;
  void v9[4] = self;
  [v5 enumerateObjectsUsingBlock:v9];
}

- (void)fetchRecordZoneChangesWithReason:(id)a3 cloudSchemaCatchUpSyncContextMap:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(ICCloudContext *)self processingQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000250E4;
  void v14[3] = &unk_1008AEC28;
  void v14[4] = self;
  void v14[5] = v10;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);
}

- (void)fetchRecordZoneChangesForZoneIDs:(id)a3 accountID:(id)a4 reason:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = +[NSSet setWithArray:a3];
  if ([v10 length])
  {
    id v16 = v10;
    id v17 = v13;
    id v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  }
  else
  {
    id v14 = 0;
  }
  id v15 = +[NSDictionary dictionary];
  [(ICCloudContext *)self fetchRecordZoneChangesForAccountZoneIDs:v14 reason:v12 cloudSchemaCatchUpSyncContextMap:v15 completionHandler:v11];
}

- (void)fetchRecordZoneChangesForAccountZoneIDs:(id)a3 reason:(id)a4 cloudSchemaCatchUpSyncContextMap:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = [(ICCloudContext *)self processingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025388;
  block[3] = &unk_1008AEE98;
  id v19 = v10;
  id v20 = self;
  id v21 = v13;
  id v22 = v11;
  id v23 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  dispatch_async(v14, block);
}

- (void)addOperationsToFetchRecordZoneChangesForAccountZoneIDs:(id)a3 reason:(id)a4 cloudSchemaCatchUpSyncContextMap:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = [(ICCloudContext *)self processingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025AC8;
  block[3] = &unk_1008AEE98;
  id v19 = v10;
  id v20 = self;
  id v21 = v13;
  id v22 = v11;
  id v23 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  dispatch_async(v14, block);
}

- (id)operationsToFetchRecordZoneChangesForZoneIDs:(id)a3 accountID:(id)a4 reason:(id)a5 cloudSchemaCatchUpSyncContextMap:(id)a6
{
  id v32 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v31 = v12;
  if ([v10 length])
  {
    if (v10)
    {
      id v13 = [v12 objectForKey:v10];
    }
    else
    {
      id v13 = 0;
    }
    unsigned int v15 = [v13 shouldPerformCloudSchemaCatchUpSync];
    char v16 = v15;
    if (v15)
    {
      id v17 = +[REMLog cloudkit];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138543874;
        *(void *)&uint8_t buf[4] = v10;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v11;
        *(_WORD *)&buf[22] = 2114;
        id v52 = v32;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Account shouldPerformCloudSchemaCatchUpSync. Will set CKFetchRecordZoneChangesConfiguration.previousServerChangeToken = nil {accountID: %{public}@, reason: %{public}@, zoneIDs: %{public}@}", buf, 0x20u);
      }
    }
    id v18 = +[NSMutableArray array];
    id v30 = [(id)objc_opt_class() objectsByDatabaseScope:v32];
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    id v52 = sub_10000984C;
    id v53 = sub_10000985C;
    id v54 = +[NSMutableSet set];
    [(ICCloudContext *)self context];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100026710;
    v42[3] = &unk_1008ADFD0;
    void v42[4] = self;
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    id v43 = v19;
    long long v44 = buf;
    [v19 performBlockAndWait:v42];
    id v20 = [(ICCloudContext *)self containerForAccountID:v10];
    id v21 = objc_alloc_init((Class)CKOperationGroup);
    [v21 setName:@"FetchRecordZoneChanges"];
    [v21 setExpectedSendSize:1];
    [v21 setExpectedReceiveSize:0];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100026834;
    v33[3] = &unk_1008AEEE8;
    id v22 = v20;
    id v34 = v22;
    id v35 = self;
    id v23 = v10;
    __int16 v40 = buf;
    id v36 = v23;
    id v37 = v11;
    char v41 = v16;
    id v24 = v21;
    id v38 = v24;
    id v25 = v18;
    id v39 = v25;
    [v30 enumerateKeysAndObjectsUsingBlock:v33];
    id v26 = +[REMLog cloudkit];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = [v24 ic_loggingDescription];
      *(_DWORD *)long long v45 = 138543874;
      long long v46 = v27;
      __int16 v47 = 2114;
      id v48 = v23;
      __int16 v49 = 2114;
      id v50 = v11;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Fetching record zone changes with operation group %{public}@ {accountID: %{public}@, reason: %{public}@}", v45, 0x20u);
    }
    id v28 = v39;
    id v14 = v25;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v13 = +[REMLog cloudkit];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_10074C2CC();
    }
    id v14 = &__NSArray0__struct;
  }

  return v14;
}

- (id)operationToFetchRecordZoneChangesForZoneIDs:(id)a3 database:(id)a4 reason:(id)a5 ignoreServerChangeTokens:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v6)
  {
    id v12 = +[REMLog cloudkit];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 databaseScope]);
      *(_DWORD *)long long buf = 138543874;
      id v63 = v13;
      __int16 v64 = 2114;
      id v65 = v11;
      __int16 v66 = 2114;
      id v67 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Will set CKFetchRecordZoneChangesConfiguration.previousServerChangeToken = nil {databaseScope: %{public}@, reason: %{public}@, zoneIDs: %{public}@}", buf, 0x20u);
    }
  }
  id v50 = [(ICCloudContext *)self accountIDForDatabase:v10];
  if (![v50 length])
  {
    id v14 = +[REMLog cloudkit];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_10074C358();
    }
  }
  id v45 = v11;
  id v46 = v10;
  id v48 = +[NSMutableDictionary dictionary];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v9;
  id v15 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v56 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        id v20 = [v19 zoneName];
        unsigned int v21 = [v20 isEqualToString:CKRecordZoneDefaultName];

        if (v21)
        {
          id v22 = +[REMLog cloudkit];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138543362;
            id v63 = v50;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Not trying to sync the default record zone in account ID %{public}@.", buf, 0xCu);
          }
        }
        else
        {
          id v23 = objc_alloc_init((Class)CKFetchRecordZoneChangesConfiguration);
          id v22 = v23;
          if (v6)
          {
            [v23 setPreviousServerChangeToken:0];
          }
          else
          {
            id v24 = -[ICCloudContext serverChangeTokenForRecordZoneID:databaseScope:accountID:](self, "serverChangeTokenForRecordZoneID:databaseScope:accountID:", v19, [v10 databaseScope], v50);
            [v22 setPreviousServerChangeToken:v24];
          }
          id v25 = +[ICCloudConfiguration sharedConfiguration];
          -[NSObject setResultsLimit:](v22, "setResultsLimit:", [v25 resultsLimitPerSyncOperation]);

          [v22 setFetchNewestChangesFirst:1];
          [v48 setObject:v22 forKeyedSubscript:v19];
        }
      }
      id v16 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
    }
    while (v16);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v26 = [(ICCloudContext *)self operationQueue];
  uint64_t v27 = [v26 operations];

  id v28 = [v27 countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (!v28)
  {
LABEL_38:

LABEL_43:
    id v43 = v48;
    __int16 v40 = v46;
    char v41 = v45;
    id v33 = [(ICCloudContext *)self newOperationToFetchRecordZoneChangesWithZoneConfigurations:v48 database:v46 reason:v45];
    goto LABEL_44;
  }
  id v29 = v28;
  uint64_t v30 = *(void *)v52;
LABEL_25:
  uint64_t v31 = 0;
  while (1)
  {
    if (*(void *)v52 != v30) {
      objc_enumerationMutation(v27);
    }
    id v32 = *(void **)(*((void *)&v51 + 1) + 8 * v31);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_36;
    }
    id v33 = v32;
    id v34 = [v33 database];
    id v35 = [(ICCloudContext *)self accountIDForDatabase:v34];

    if (![v35 length])
    {
      id v36 = +[REMLog cloudkit];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
        sub_10074C300((uint64_t)v59, (uint64_t)v33);
      }
    }
    if (+[NSString rem_isFirstString:v50 equalToSecondString:v35])
    {
      uint64_t v37 = objc_opt_class();
      id v38 = [v33 configurationsByRecordZoneID];
      LOBYTE(v37) = [(id)v37 isZoneConfigurations:v48 subsetOfZoneConfigurations:v38];

      if (v37) {
        break;
      }
    }

LABEL_36:
    if (v29 == (id)++v31)
    {
      id v29 = [v27 countByEnumeratingWithState:&v51 objects:v60 count:16];
      if (v29) {
        goto LABEL_25;
      }
      goto LABEL_38;
    }
  }

  if (!v33) {
    goto LABEL_43;
  }
  id v39 = +[REMLog cloudkit];
  __int16 v40 = v46;
  char v41 = v45;
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    id v42 = [v33 ic_loggingDescription];
    *(_DWORD *)long long buf = 138543618;
    id v63 = v50;
    __int16 v64 = 2114;
    id v65 = v42;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Found existing operation with superset zone configuration in account ID %{public}@: %{public}@", buf, 0x16u);
  }
  id v43 = v48;
LABEL_44:

  return v33;
}

+ (BOOL)isZoneConfigurations:(id)a3 subsetOfZoneConfigurations:(id)a4
{
  id v27 = a3;
  id v28 = a4;
  uint64_t v5 = [v27 allKeys];
  id v6 = [v5 copy];

  id v7 = +[NSMutableSet setWithArray:v6];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v30;
    *(void *)&long long v9 = 138543362;
    long long v25 = v9;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v30 != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8 * v12);
      uint64_t v14 = [v28 objectForKeyedSubscript:v13, v25];
      if (!v14) {
        break;
      }
      id v15 = (void *)v14;
      id v16 = [v27 objectForKeyedSubscript:v13];
      uint64_t v17 = [v15 previousServerChangeToken];

      if (v17)
      {
        id v18 = [v15 previousServerChangeToken];
        id v19 = [v16 previousServerChangeToken];
        unsigned __int8 v20 = [v18 isEqual:v19];

        if ((v20 & 1) == 0)
        {

          break;
        }
      }
      else
      {
        unsigned int v21 = +[REMLog cloudkit];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          id v22 = [v15 ic_loggingDescription];
          *(_DWORD *)long long buf = v25;
          id v34 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "isZoneConfigurations: existingConfiguration %{public}@ with nil previousServerChangeToken", buf, 0xCu);
        }
      }
      [v7 removeObject:v13];

      if (v10 == (id)++v12)
      {
        id v10 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  BOOL v23 = [v7 count] == 0;
  return v23;
}

- (id)newOperationToFetchRecordZoneChangesWithZoneConfigurations:(id)a3 database:(id)a4 reason:(id)a5
{
  id v40 = a3;
  id v41 = a4;
  id v42 = a5;
  id v8 = [(ICCloudContext *)self processingQueue];
  dispatch_assert_queue_V2(v8);

  long long v9 = [(ICCloudContext *)self accountIDForDatabase:v41];
  if (![v9 length])
  {
    id v10 = +[REMLog cloudkit];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      id v38 = [v41 ic_loggingDescription];
      *(_DWORD *)v83 = 138543874;
      *(void *)&v83[4] = v38;
      *(_WORD *)&v83[12] = 2114;
      *(void *)&v83[14] = v9;
      *(_WORD *)&v83[22] = 2114;
      id v84 = v42;
      _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "accountID is nil or empty in newOperationToFetchRecordZoneChangesWithZoneConfigurations %{public}@, accountID: %{public}@, reason: %{public}@", v83, 0x20u);
    }
  }
  id v11 = objc_alloc((Class)CKFetchRecordZoneChangesOperation);
  uint64_t v12 = [v40 allKeys];
  id v13 = [v11 initWithRecordZoneIDs:v12 configurationsByRecordZoneID:v40];

  [(ICCloudContext *)self configureOperation:v13];
  [v13 setDatabase:v41];
  objc_initWeak(&location, v13);
  [v13 setFetchAllChanges:1];
  uint64_t v14 = +[ICCloudConfiguration sharedConfiguration];
  id v15 = [v14 resultsLimitPerSyncOperation];

  *(void *)v83 = 0;
  *(void *)&v83[8] = v83;
  *(void *)&v83[16] = 0x2020000000;
  id v84 = 0;
  id v16 = [(ICCloudContext *)self contextForAccountID:v9 withBatchFetchHelper:1];
  if ([v9 length])
  {
    uint64_t v17 = [ICCloudSchemaCatchUpSyncContext alloc];
    id v18 = [(ICCloudContext *)self icUserDefaults];
    id v19 = [v18 cloudSchemaCatchUpSyncSchedulingStateStorage];
    unsigned __int8 v20 = [(ICCloudSchemaCatchUpSyncContext *)v17 initWithAccountIdentifier:v9 syncReason:v42 schedulingStateStorage:v19 managedObjectContext:v16];

    unsigned int v21 = +[NSDictionary dictionaryWithObject:v20 forKey:v9];
    [v16 setCloudSchemaCatchUpSyncContextsByAccountIdentifier:v21];
  }
  [v16 setShouldSortChildrenAfterFetching:1];
  id v22 = +[NSMutableSet set];
  [v16 setRecordIDsToSortChildrenAfterFetching:v22];

  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_100027B5C;
  v72[3] = &unk_1008AEF38;
  char v74 = v83;
  id v75 = v15;
  v72[4] = self;
  id v23 = v9;
  id v73 = v23;
  id v24 = objc_retainBlock(v72);
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x2020000000;
  v71[3] = 0xBFF0000000000000;
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_100027DD4;
  v66[3] = &unk_1008AEF60;
  id v69 = v71;
  v66[4] = self;
  id v39 = &v70;
  objc_copyWeak(&v70, &location);
  id v25 = v16;
  id v67 = v25;
  id v26 = v24;
  id v68 = v26;
  [v13 setRecordWasChangedBlock:v66];
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_100027ED4;
  v61[3] = &unk_1008AEF88;
  __int16 v64 = v71;
  v61[4] = self;
  objc_copyWeak(&v65, &location);
  id v27 = v25;
  id v62 = v27;
  id v28 = v26;
  id v63 = v28;
  [v13 setRecordWithIDWasDeletedBlock:v61];
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_100027FB8;
  v55[3] = &unk_1008AEFB0;
  id v59 = v71;
  id v29 = v27;
  id v56 = v29;
  long long v57 = self;
  id v30 = v23;
  id v58 = v30;
  objc_copyWeak(&v60, &location);
  [v13 setRecordZoneChangeTokensUpdatedBlock:v55];
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_1000281FC;
  v50[3] = &unk_1008AEFD8;
  long long v53 = v71;
  id v31 = v29;
  id v51 = v31;
  long long v52 = self;
  objc_copyWeak(&v54, &location);
  [v13 setRecordZoneFetchCompletionBlock:v50];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10002840C;
  v43[3] = &unk_1008AF000;
  id v48 = v71;
  id v32 = v31;
  id v44 = v32;
  id v45 = self;
  id v33 = v30;
  id v46 = v33;
  objc_copyWeak(&v49, &location);
  id v47 = v42;
  [v13 setFetchRecordZoneChangesCompletionBlock:v43];
  id v34 = +[REMLog cloudkit];
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    id v35 = [v13 ic_loggingDescription:&v70];
    *(_DWORD *)long long buf = 138543874;
    id v78 = v33;
    __int16 v79 = 2114;
    uint64_t v80 = v35;
    __int16 v81 = 2114;
    id v82 = v42;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Creating fetch changes operation in account ID %{public}@: %{public}@, syncReason: %{public}@", buf, 0x20u);
  }
  id v36 = v13;
  objc_destroyWeak(&v49);

  objc_destroyWeak(&v54);
  objc_destroyWeak(&v60);

  objc_destroyWeak(&v65);
  objc_destroyWeak(v39);
  _Block_object_dispose(v71, 8);

  _Block_object_dispose(v83, 8);
  objc_destroyWeak(&location);

  return v36;
}

- (void)fetchRecordZoneChangesOperation:(id)a3 completedFetchForZoneID:(id)a4 serverChangeToken:(id)a5 batchFetchHelper:(id)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  [(ICCloudContext *)self debug_replaceWithSimulatedCKErrorIfSetWithOriginalError:a7];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002886C;
  v20[3] = &unk_1008AE520;
  v20[4] = self;
  id v21 = v12;
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  id v23 = v13;
  id v24 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v22;
  id v19 = v12;
  [v15 addDispatchBlock:v20];
}

- (void)fetchRecordZoneChangesOperationDidComplete:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ICCloudContext *)self processingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028FFC;
  block[3] = &unk_1008ADD00;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (void)fetchRecordZoneChangesOperation:(id)a3 recordWasChangedWithRecordID:(id)a4 record:(id)a5 error:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [v12 database];
  id v18 = [(ICCloudContext *)self accountIDForDatabase:v17];

  if ([v18 length])
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    id v25 = +[REMLog cloudkit];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      sub_10074C4A4();
    }

    if (v15)
    {
LABEL_3:
      id v19 = +[REMLog cloudkit];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        unsigned __int8 v20 = [v13 ic_loggingDescription];
        id v21 = [v12 ic_shortLoggingDescription];
        *(_DWORD *)long long buf = 138544130;
        long long v52 = v18;
        __int16 v53 = 2114;
        id v54 = v20;
        __int16 v55 = 2112;
        id v56 = v15;
        __int16 v57 = 2114;
        id v58 = v21;
        id v22 = "[fetchRecordZoneChangesOperation:recordWasChangedWithRecordID:record:error:context:] Error fetching record"
              " for account ID %{public}@: %{public}@ %@ %{public}@";
        id v23 = v19;
        uint32_t v24 = 42;
LABEL_5:
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);

        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }
  if (!v14)
  {
    id v19 = +[REMLog cloudkit];
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    unsigned __int8 v20 = [v13 ic_loggingDescription];
    id v21 = [v12 ic_shortLoggingDescription];
    *(_DWORD *)long long buf = 138543874;
    long long v52 = v18;
    __int16 v53 = 2114;
    id v54 = v20;
    __int16 v55 = 2114;
    id v56 = v21;
    id v22 = "[fetchRecordZoneChangesOperation:recordWasChangedWithRecordID:record:error:context:] Fetching record with nil "
          "record for account ID %{public}@: %{public}@ %{public}@";
    id v23 = v19;
    uint32_t v24 = 32;
    goto LABEL_5;
  }
  id v26 = objc_opt_class();
  id v42 = v13;
  id v27 = [v13 recordName];
  id v19 = [v26 ckIdentifierFromRecordName:v27];

  id v28 = [v14 parent];
  if (v28)
  {
    v50[0] = v19;
    id v29 = objc_opt_class();
    id v40 = [v14 parent];
    [v40 recordID];
    v39 = id v41 = v16;
    id v30 = [v39 recordName];
    id v31 = [v29 ckIdentifierFromRecordName:v30];
    v50[1] = v31;
    +[NSArray arrayWithObjects:v50 count:2];
    id v32 = v12;
    id v33 = v15;
    id v34 = v14;
    uint64_t v36 = v35 = v28;

    uint64_t v37 = (void *)v36;
    id v28 = v35;
    id v14 = v34;
    id v15 = v33;
    id v12 = v32;

    id v16 = v41;
  }
  else
  {
    id v49 = v19;
    uint64_t v37 = +[NSArray arrayWithObjects:&v49 count:1];
  }

  id v38 = [v16 batchFetchHelper];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100029814;
  v43[3] = &unk_1008AE520;
  id v44 = v16;
  id v45 = v18;
  id v46 = v14;
  id v47 = v12;
  id v48 = self;
  [v38 addCKIdentifiers:v37 accountIdentifier:v45 dispatchBlock:v43];

  id v13 = v42;
LABEL_16:
}

- (void)fetchRecordZoneChangesOperation:(id)a3 recordWasDeletedWithRecordID:(id)a4 recordType:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v13 batchFetchHelper];
  id v15 = [v10 database];
  id v16 = [(ICCloudContext *)self accountIDForDatabase:v15];

  if (![v16 length])
  {
    id v17 = +[REMLog cloudkit];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      sub_10074C5C4();
    }
  }
  if ([v12 isEqualToString:CKRecordTypeShare])
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100029D84;
    v33[3] = &unk_1008ADC60;
    id v34 = v13;
    id v35 = v16;
    id v36 = v11;
    id v37 = v10;
    id v18 = v10;
    id v19 = v11;
    id v20 = v16;
    id v21 = v13;
    [v14 addDispatchBlock:v33];

    id v22 = v34;
  }
  else
  {
    id v23 = objc_opt_class();
    uint32_t v24 = [v11 recordName];
    id v25 = [v23 ckIdentifierFromRecordName:v24];
    id v38 = v25;
    id v21 = +[NSArray arrayWithObjects:&v38 count:1];

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100029F28;
    v26[3] = &unk_1008AF028;
    id v27 = v13;
    id v28 = v16;
    id v29 = v11;
    id v30 = v10;
    id v31 = self;
    id v32 = v12;
    id v22 = v10;
    id v18 = v11;
    id v19 = v16;
    id v20 = v13;
    [v14 addCKIdentifiers:v21 accountIdentifier:v19 dispatchBlock:v26];
  }
}

- (void)fetchRecordZoneChangesOperation:(id)a3 zoneID:(id)a4 accountID:(id)a5 changeTokenUpdated:(id)a6 batchFetchHelper:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002A32C;
  v19[3] = &unk_1008AE520;
  id v20 = v13;
  id v21 = a6;
  id v22 = v12;
  id v23 = self;
  id v24 = v14;
  id v15 = v14;
  id v16 = v12;
  id v17 = v21;
  id v18 = v13;
  [a7 addDispatchBlock:v19];
}

- (void)_performSortingChildrenObjectsAfterFetchingInBlockOfManagedObjectContext:(id)a3 fetchHasFullyCompleted:(BOOL)a4 accountID:(id)a5
{
  id v7 = a3;
  id v37 = a5;
  unint64_t v8 = (unint64_t)[v7 shouldSortChildrenAfterFetching];
  id v9 = [v7 recordIDsToSortChildrenAfterFetching];
  [v7 setShouldSortChildrenAfterFetching:0];
  [v7 setRecordIDsToSortChildrenAfterFetching:0];
  if (v8 && v9)
  {
    unsigned int v28 = v8;
    BOOL v29 = a4;
    id v30 = v9;
    id v10 = +[NSMutableSet setWithSet:v9];
    [(id)objc_opt_class() _recordTypesToSortChildrenAfterFetch];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v34 = [v11 countByEnumeratingWithState:&v42 objects:v49 count:16];
    if (v34)
    {
      uint64_t v31 = *(void *)v43;
      id v32 = v11;
      id v33 = v10;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v43 != v31) {
            objc_enumerationMutation(v11);
          }
          uint64_t v35 = v12;
          uint64_t v13 = *(void *)(*((void *)&v42 + 1) + 8 * v12);
          id v14 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v10 count]);
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v15 = v10;
          id v16 = [v15 countByEnumeratingWithState:&v38 objects:v48 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v39;
            do
            {
              for (uint64_t i = 0; i != v17; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v39 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void *)(*((void *)&v38 + 1) + 8 * i);
                id v22 = v7;
                id v23 = [(ICCloudContext *)self existingCloudObjectForRecordID:v20 recordType:v13 accountID:v37 context:v7];
                id v24 = v23;
                if (v23)
                {
                  [v23 sortChildrenObjects];
                  [v14 addObject:v20];
                }

                id v7 = v22;
              }
              id v17 = [v15 countByEnumeratingWithState:&v38 objects:v48 count:16];
            }
            while (v17);
          }

          if ([v14 count])
          {
            id v25 = +[REMLog cloudkit];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138543362;
              id v47 = v14;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Sorted children objects after fetching RecordZoneChanges {sortedRecordIDs: %{public}@}", buf, 0xCu);
            }
          }
          [v15 minusSet:v14];

          uint64_t v12 = v35 + 1;
          id v10 = v33;
          id v11 = v32;
        }
        while ((id)(v35 + 1) != v34);
        id v34 = [v32 countByEnumeratingWithState:&v42 objects:v49 count:16];
      }
      while (v34);
    }

    id v9 = v30;
    unint64_t v8 = v28;
    if ([v10 count])
    {
      id v27 = +[REMLog cloudkit];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        sub_10074C650();
      }
    }
    a4 = v29;
  }
  if (!a4)
  {
    [v7 setShouldSortChildrenAfterFetching:v8];
    if (v8)
    {
      id v26 = +[NSMutableSet set];
      [v7 setRecordIDsToSortChildrenAfterFetching:v26];
    }
    else
    {
      [v7 setRecordIDsToSortChildrenAfterFetching:0];
    }
  }
}

- (void)firePollingSyncRequest
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_10002A8A8;
  activity_block[3] = &unk_1008ADA80;
  activity_void block[4] = self;
  _os_activity_initiate((void *)&_mh_execute_header, "ICCloudContext Polling Timer Fired", OS_ACTIVITY_FLAG_IF_NONE_PRESENT, activity_block);
}

- (void)fetchDatabaseChangesWithReason:(id)a3 cloudSchemaCatchUpSyncContextMap:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  uint64_t v12 = [(ICCloudContext *)self containersByAccountID];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10002AAD4;
  v23[3] = &unk_1008AF050;
  id v13 = v11;
  id v24 = v13;
  [v12 enumerateKeysAndObjectsUsingBlock:v23];

  id v14 = [(ICCloudContext *)self processingQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002ABCC;
  v18[3] = &unk_1008AEE98;
  void v18[4] = self;
  id v19 = v13;
  id v20 = v10;
  id v21 = v8;
  id v22 = v9;
  id v15 = v9;
  id v16 = v8;
  id v17 = v13;
  dispatch_async(v14, v18);
}

- (void)fetchDatabaseChangesForDatabases:(id)a3 reason:(id)a4 cloudSchemaCatchUpSyncContextMap:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v28 = a4;
  id v31 = a5;
  id v29 = a6;
  id v11 = [(ICCloudContext *)self processingQueue];
  dispatch_assert_queue_V2(v11);

  id v32 = objc_alloc_init((Class)CKOperationGroup);
  if ([v28 length])
  {
    CFStringRef v12 = [@"FetchDatabaseChanges" stringByAppendingFormat:@"-%@", v28];
  }
  else
  {
    CFStringRef v12 = @"FetchDatabaseChanges";
  }
  id v27 = (__CFString *)v12;
  [v32 setName:];
  [v32 setQuantity:[v10 count]];
  [v32 setExpectedSendSize:1];
  [v32 setExpectedReceiveSize:1];
  id v13 = +[NSMutableArray array];
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = sub_10000984C;
  uint8_t v45[4] = sub_10000985C;
  id v46 = +[NSMutableArray array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v10;
  id v14 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_10002B0EC;
        v40[3] = &unk_1008AF078;
        void v40[4] = self;
        v40[5] = v45;
        uint64_t v18 = [(ICCloudContext *)self operationToFetchDatabaseChangesForDatabase:v17 cloudSchemaCatchUpSyncContextMap:v31 completionHandler:v40];
        [v18 setGroup:v32];
        [v13 addObject:v18];
      }
      id v14 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v14);
  }

  if (v29)
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10002B1B8;
    v37[3] = &unk_1008AE1B0;
    v37[4] = self;
    long long v39 = v45;
    id v38 = v29;
    id v19 = +[ICNSBlockOperation blockOperationWithBlock:v37];
    [v19 setName:ICNSBlockOperationNameFetchDatabaseChangesCompletion];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v20 = v13;
    id v21 = [v20 countByEnumeratingWithState:&v33 objects:v49 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v34;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v20);
          }
          [v19 addDependency:*(void *)(*((void *)&v33 + 1) + 8 * (void)j)];
        }
        id v21 = [v20 countByEnumeratingWithState:&v33 objects:v49 count:16];
      }
      while (v21);
    }

    [v20 addObject:v19];
  }
  id v24 = +[REMLog cloudkit];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    id v25 = [v32 ic_loggingDescription];
    *(_DWORD *)long long buf = 138543362;
    id v48 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Fetching database changes with operation group %{public}@", buf, 0xCu);
  }
  id v26 = [(ICCloudContext *)self operationQueue];
  [v26 addOperations:v13 waitUntilFinished:0];

  [(ICCloudContext *)self errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary];
  _Block_object_dispose(v45, 8);
}

- (id)operationToFetchDatabaseChangesForDatabase:(id)a3 cloudSchemaCatchUpSyncContextMap:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v37 = a4;
  id v9 = a5;
  long long v39 = v8;
  id v10 = [(ICCloudContext *)self accountIDForDatabase:v8];
  if (![v10 length])
  {
    id v11 = +[REMLog cloudkit];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_10074C724();
    }
  }
  if (v10)
  {
    CFStringRef v12 = [v37 objectForKey:v10];
  }
  else
  {
    CFStringRef v12 = 0;
  }
  long long v35 = v12;
  if ([v12 shouldPerformCloudSchemaCatchUpSync])
  {
    id v13 = +[REMLog cloudkit];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 databaseScope]);
      *(_DWORD *)long long buf = 138543618;
      id v60 = v10;
      __int16 v61 = 2112;
      id v62 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Account shouldPerformCloudSchemaCatchUpSync. Will create CKFetchDatabaseChangesOperation with nil previousServerChangeToken {accountID: %{public}@, databaseScope: %@}", buf, 0x16u);
    }
    id v38 = 0;
  }
  else
  {
    id v38 = [(ICCloudContext *)self serverChangeTokenForChangedZonesInDatabase:v8 accountID:v10];
  }
  id v15 = [objc_alloc((Class)CKFetchDatabaseChangesOperation) initWithPreviousServerChangeToken:v38];
  [(ICCloudContext *)self configureOperation:v15];
  [v15 setDatabase:v39];
  [v15 setFetchAllChanges:1];
  objc_initWeak(&location, v15);
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_10002B98C;
  v54[3] = &unk_1008AF0A0;
  v54[4] = self;
  objc_copyWeak(&v56, &location);
  id v16 = v10;
  id v55 = v16;
  [v15 setRecordZoneWithIDChangedBlock:v54];
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_10002BA04;
  v51[3] = &unk_1008AF0A0;
  v51[4] = self;
  objc_copyWeak(&v53, &location);
  id v17 = v16;
  id v52 = v17;
  [v15 setRecordZoneWithIDWasDeletedBlock:v51];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_10002BA7C;
  v48[3] = &unk_1008AF0C8;
  void v48[4] = self;
  objc_copyWeak(&v50, &location);
  id v18 = v17;
  id v49 = v18;
  [v15 setChangeTokenUpdatedBlock:v48];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10002BAF4;
  v44[3] = &unk_1008AF0F0;
  v44[4] = self;
  objc_copyWeak(&v47, &location);
  id v36 = v18;
  id v45 = v36;
  id v19 = v9;
  id v46 = v19;
  [v15 setFetchDatabaseChangesCompletionBlock:v44];
  id v20 = +[REMLog cloudkit];
  long long v34 = v19;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    id v21 = [v15 ic_loggingDescription:v19];
    *(_DWORD *)long long buf = 138543618;
    id v60 = v36;
    __int16 v61 = 2114;
    id v62 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Creating fetch database changes operation for account %{public}@, %{public}@", buf, 0x16u);
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v22 = [(ICCloudContext *)self operationQueue];
  id v23 = [v22 operations];

  id v24 = [v23 countByEnumeratingWithState:&v40 objects:v58 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v24; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v41 != v25) {
          objc_enumerationMutation(v23);
        }
        id v27 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v28 = +[REMLog cloudkit];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            [v15 ic_loggingDescription];
            id v29 = (id)objc_claimAutoreleasedReturnValue();
            id v30 = [v27 ic_loggingDescription];
            *(_DWORD *)long long buf = 138543618;
            id v60 = v29;
            __int16 v61 = 2114;
            id v62 = v30;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Database changes operation %{public}@ will wait for %{public}@", buf, 0x16u);
          }
          [v15 addDependency:v27];
        }
      }
      id v24 = [v23 countByEnumeratingWithState:&v40 objects:v58 count:16];
    }
    while (v24);
  }

  id v31 = v46;
  id v32 = v15;

  objc_destroyWeak(&v47);
  objc_destroyWeak(&v50);

  objc_destroyWeak(&v53);
  objc_destroyWeak(&v56);

  objc_destroyWeak(&location);

  return v32;
}

- (void)fetchDatabaseChangesOperation:(id)a3 recordZoneWithIDChanged:(id)a4 accountID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(ICCloudContext *)self processingQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002BC88;
  v15[3] = &unk_1008ADC60;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  id v19 = self;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(v11, v15);
}

- (void)sharedZoneWasDeleted:(id)a3 accountID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[REMLog cloudkit];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 ic_loggingDescription];
    *(_DWORD *)long long buf = 138543618;
    id v17 = v7;
    __int16 v18 = 2114;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Shared zone was deleted for account ID %{public}@: %{public}@", buf, 0x16u);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002BF44;
  v12[3] = &unk_1008AF118;
  id v13 = v6;
  id v14 = v7;
  id v15 = self;
  id v10 = v7;
  id v11 = v6;
  [(ICCloudContext *)self performAndWaitContextWithBatchFetchHelperForAccountID:v10 block:v12];
}

- (void)fetchDatabaseChangesOperation:(id)a3 recordZoneWithIDWasDeleted:(id)a4 accountID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(ICCloudContext *)self processingQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002C358;
  v15[3] = &unk_1008ADC60;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  id v19 = self;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(v11, v15);
}

- (void)fetchDatabaseChangesOperation:(id)a3 changeTokenUpdated:(id)a4 accountID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(ICCloudContext *)self processingQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002C70C;
  v15[3] = &unk_1008ADC60;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  id v19 = self;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(v11, v15);
}

- (void)fetchDatabaseChangesOperation:(id)a3 finishedWithServerChangeToken:(id)a4 accountID:(id)a5 error:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(ICCloudContext *)self processingQueue];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10002C984;
  v23[3] = &unk_1008AF140;
  id v24 = v14;
  id v25 = v13;
  id v26 = v12;
  id v27 = v15;
  id v28 = self;
  id v29 = v16;
  id v18 = v15;
  id v19 = v16;
  id v20 = v12;
  id v21 = v13;
  id v22 = v14;
  dispatch_async(v17, v23);
}

- (id)retryCountFetchDatabaseChangesOperationTypeForAccountID:(id)a3 dataScopeString:(id)a4
{
  return +[NSString stringWithFormat:@"CKFetchDatabaseChangesOperation_%@_%@", a3, a4];
}

- (void)loadZoneFetchState
{
  if (qword_1009228E8 != -1) {
    dispatch_once(&qword_1009228E8, &stru_1008AF160);
  }
  id v3 = objc_opt_new();
  [(ICCloudContext *)self setAccountZoneIDsNeedingFetchChanges:v3];

  id v4 = +[NSUserDefaults standardUserDefaults];
  uint64_t v5 = [v4 objectForKey:@"CloudKitAccountZonesNeedingFetchChanges"];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002D0FC;
  v9[3] = &unk_1008AF188;
  void v9[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];
  id v6 = objc_opt_new();
  [(ICCloudContext *)self setAccountZoneIDsFetchingChanges:v6];

  id v7 = +[REMLog cloudkit];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(ICCloudContext *)self accountZoneIDsNeedingFetchChanges];
    *(_DWORD *)long long buf = 138543362;
    id v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Loaded zone fetch state: zonesNeedingFetchChanges=%{public}@", buf, 0xCu);
  }
}

- (void)saveZoneFetchState
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = [(ICCloudContext *)self accountZoneIDsNeedingFetchChanges];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002D3AC;
  v17[3] = &unk_1008AF1B0;
  void v17[4] = self;
  id v5 = v3;
  id v18 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v17];

  id v6 = [(ICCloudContext *)self accountZoneIDsFetchingChanges];
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_10002D444;
  id v14 = &unk_1008AF1B0;
  id v15 = self;
  id v7 = v5;
  id v16 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:&v11];

  id v8 = +[REMLog cloudkit];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Saving zone fetch state: zonesNeedingFetchChanges=%@", buf, 0xCu);
  }

  id v9 = +[NSUserDefaults standardUserDefaults];
  id v10 = [v7 copy];
  [v9 setObject:v10 forKey:@"CloudKitAccountZonesNeedingFetchChanges"];
}

- (void)clearZoneFetchState
{
  id v3 = [(ICCloudContext *)self processingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D5AC;
  block[3] = &unk_1008ADA80;
  void block[4] = self;
  dispatch_async(v3, block);
}

+ (id)zoneInfosFromZoneIDs:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v10 = +[NSMutableDictionary dictionary];
        id v11 = [v9 zoneName];
        [v10 setObject:v11 forKeyedSubscript:@"ZoneName"];

        uint64_t v12 = [v9 ownerName];
        unsigned __int8 v13 = [v12 isEqualToString:CKCurrentUserDefaultName];

        if ((v13 & 1) == 0)
        {
          id v14 = [v9 ownerName];
          [v10 setObject:v14 forKeyedSubscript:@"OwnerName"];
        }
        [v4 addObject:v10];
      }
      id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (id)zoneIDsFromZoneInfos:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v3 count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    id v14 = CKCurrentUserDefaultName;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = [v9 objectForKeyedSubscript:@"ZoneName" v14];
        id v11 = [v9 objectForKeyedSubscript:@"OwnerName"];
        if (!v11) {
          id v11 = v14;
        }
        id v12 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:v10 ownerName:v11 databaseScope:[CKRecordZoneID ic_defaultDatabaseScopeForOwnerName:v11]];
        [v4 addObject:v12];
      }
      id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)subscriptionForDatabase:(id)a3
{
  [a3 databaseScope];
  id v3 = CKDatabaseScopeString();
  id v4 = +[NSString stringWithFormat:@"DatabaseSubscription-%@", v3];

  id v5 = [objc_alloc((Class)CKDatabaseSubscription) initWithSubscriptionID:v4];
  id v6 = objc_alloc_init((Class)CKNotificationInfo);
  [v6 setShouldSendContentAvailable:1];
  [v5 setNotificationInfo:v6];

  return v5;
}

- (void)setupAPSConnection
{
  id v3 = [(ICCloudContext *)self apsConnection];

  if (!v3)
  {
    unsigned int v4 = +[REMCloudContainer isSandboxEnvironment];
    id v5 = (id *)&APSEnvironmentDevelopment;
    if (!v4) {
      id v5 = (id *)&APSEnvironmentProduction;
    }
    id v6 = *v5;
    id v7 = REMDaemonAPSNamedDelegatePort;
    id v8 = objc_alloc((Class)APSConnection);
    id v9 = [(ICCloudContext *)self processingQueue];
    id v10 = [v8 initWithEnvironmentName:v6 namedDelegatePort:v7 queue:v9];

    if (v10)
    {
      id v11 = [@"com.apple.icloud-container." stringByAppendingString:REMAppBundleIdentifier];
      [(ICCloudContext *)self setApsTopic:v11];

      id v12 = [(ICCloudContext *)self apsTopic];
      id v14 = v12;
      unsigned __int8 v13 = +[NSArray arrayWithObjects:&v14 count:1];
      [v10 _setEnabledTopics:v13];

      [v10 setDelegate:self];
      [(ICCloudContext *)self setApsConnection:v10];
    }
  }
}

- (void)updateSubscriptionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[ICSyncSettings sharedSettings];
  unsigned __int8 v6 = [v5 hasOptions:1];

  if (v6)
  {
    id v7 = [(ICCloudContext *)self processingQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002DD84;
    v8[3] = &unk_1008AE160;
    void v8[4] = self;
    id v9 = v4;
    dispatch_async(v7, v8);
  }
  else
  {
    [(ICCloudContext *)self setNeedsToUpdateSubscriptions:0];
    if (v4) {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

- (void)fetchSubscriptionsForDatabase:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ICCloudContext *)self processingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E7E8;
  block[3] = &unk_1008AE430;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)saveSubscriptionsForDatabase:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ICCloudContext *)self processingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002EEE8;
  block[3] = &unk_1008AE430;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)loadSubscribedSubscriptionIDs
{
  id v3 = [(ICCloudContext *)self icUserDefaults];
  id v4 = [v3 userDefaults];
  [v4 doubleForKey:@"SubscriptionIDsLastModifiedDate"];
  double v6 = v5;

  if (v6 <= 0.0) {
    +[NSDate distantPast];
  }
  else {
  id v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v6];
  }
  [(ICCloudContext *)self setSubscribedSubscriptionIDsLastModifiedDate:v7];

  id v8 = +[ICCloudConfiguration sharedConfiguration];
  [v8 persistedSubscriptionIDsValidityPeriod];
  double v10 = v9;

  id v11 = +[REMLog cloudkit];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = +[NSNumber numberWithDouble:v6];
    id v13 = [(ICCloudContext *)self subscribedSubscriptionIDsLastModifiedDate];
    id v14 = +[NSNumber numberWithDouble:v10];
    *(_DWORD *)long long buf = 138543874;
    id v28 = v12;
    __int16 v29 = 2114;
    id v30 = v13;
    __int16 v31 = 2114;
    id v32 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Loaded subscribed subscription IDs last updated time from user defaults {timestamp: %{public}@, date: %{public}@, validityPeriod: %{public}@}", buf, 0x20u);
  }
  id v15 = +[NSDate date];
  long long v16 = [(ICCloudContext *)self subscribedSubscriptionIDsLastModifiedDate];
  [v15 timeIntervalSinceDate:v16];
  double v18 = v17;

  if (v18 <= v10)
  {
    long long v19 = [(ICCloudContext *)self icUserDefaults];
    long long v20 = [v19 userDefaults];
    id v21 = [v20 dictionaryForKey:@"SubscriptionIDs"];

    id v22 = +[REMLog cloudkit];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v28 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Loaded subscribed subscription IDs from user defaults: %@", buf, 0xCu);
    }

    +[NSMutableDictionary dictionary];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10002FA84;
    v25[3] = &unk_1008AF188;
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    id v23 = v26;
    [v21 enumerateKeysAndObjectsUsingBlock:v25];
    id v24 = [v23 copy];
    [(ICCloudContext *)self setSubscribedSubscriptionIDsByAccountID:v24];
  }
  else
  {
    [(ICCloudContext *)self clearSubscribedSubscriptionIDs];
  }
}

- (void)addSubscribedSubscriptionIDs:(id)a3 accountID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ICCloudContext *)self processingQueue];
  dispatch_assert_queue_V2(v8);

  double v9 = +[REMLog cloudkit];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Persisting subscribed subscription ID to user defaults {subscriptionID: %{public}@}", buf, 0xCu);
  }

  double v10 = [(ICCloudContext *)self subscribedSubscriptionIDsByAccountID];
  if (v10)
  {
    id v11 = [(ICCloudContext *)self subscribedSubscriptionIDsByAccountID];
    id v12 = [v11 mutableCopy];
  }
  else
  {
    id v12 = +[NSMutableDictionary dictionary];
  }

  id v13 = [v12 objectForKeyedSubscript:v7];
  id v14 = v13;
  if (!v13)
  {
    id v14 = +[NSSet set];
  }
  id v15 = [v14 setByAddingObject:v6];
  [v12 setObject:v15 forKeyedSubscript:v7];

  if (!v13) {
  id v16 = [v12 copy];
  }
  [(ICCloudContext *)self setSubscribedSubscriptionIDsByAccountID:v16];

  double v17 = +[NSDate date];
  [(ICCloudContext *)self setSubscribedSubscriptionIDsLastModifiedDate:v17];

  +[NSMutableDictionary dictionary];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10002FDE0;
  v23[3] = &unk_1008AEE70;
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = v24;
  [v12 enumerateKeysAndObjectsUsingBlock:v23];
  long long v19 = [(ICCloudContext *)self icUserDefaults];
  long long v20 = [v19 userDefaults];

  id v21 = [v18 copy];
  [v20 setObject:v21 forKey:@"SubscriptionIDs"];

  id v22 = [(ICCloudContext *)self subscribedSubscriptionIDsLastModifiedDate];
  [v22 timeIntervalSinceReferenceDate];
  [v20 setDouble:@"SubscriptionIDsLastModifiedDate" forKey:];
}

- (void)clearSubscribedSubscriptionIDs
{
  id v3 = [(ICCloudContext *)self processingQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[REMLog cloudkit];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Clearing subscribed subscription IDs", v9, 2u);
  }

  double v5 = [(ICCloudContext *)self icUserDefaults];
  id v6 = [v5 userDefaults];

  [v6 removeObjectForKey:@"SubscriptionIDs"];
  id v7 = +[NSDictionary dictionary];
  [(ICCloudContext *)self setSubscribedSubscriptionIDsByAccountID:v7];

  [v6 removeObjectForKey:@"SubscriptionIDsLastModifiedDate"];
  id v8 = +[NSDate distantPast];
  [(ICCloudContext *)self setSubscribedSubscriptionIDsLastModifiedDate:v8];

  [(ICCloudContext *)self setNeedsToUpdateSubscriptions:1];
}

- (BOOL)isInForeground
{
  return 1;
}

- (void)updateCloudContextStateWithSyncOption:(int64_t)a3 syncReason:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  double v10 = +[REMLog cloudkit];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "os_transaction INIT {name: com.apple.remindd.cloudkit.updateCloudContextState}", buf, 2u);
  }

  id v11 = (void *)os_transaction_create();
  id v12 = [(ICCloudContext *)self processingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000300D0;
  block[3] = &unk_1008AF3B8;
  void block[4] = v9;
  void block[5] = self;
  id v16 = v11;
  id v17 = v8;
  int64_t v18 = a3;
  id v13 = v11;
  id v14 = v8;
  dispatch_async(v12, block);
}

- (void)updateCloudContextStateWithReason:(id)a3
{
}

- (void)checkForLongLivedOperations
{
  id v3 = [(ICCloudContext *)self containersByAccountID];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100031648;
  v4[3] = &unk_1008AF050;
  v4[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

- (id)_existingCloudDirtyToken
{
  id v3 = [(ICCloudContext *)self processingQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(ICCloudContext *)self icUserDefaults];
  double v5 = [v4 userDefaults];
  id v6 = [v5 objectForKey:@"CloudDirtyUUIDKey"];

  return v6;
}

- (id)_markCloudAsDirtyAndReturnToken
{
  id v3 = [(ICCloudContext *)self processingQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc_init((Class)NSUUID);
  double v5 = [v4 UUIDString];

  id v6 = +[REMLog cloudkit];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v10 = 138543362;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Marking cloud as dirty {newToken: %{public}@}", (uint8_t *)&v10, 0xCu);
  }

  id v7 = [(ICCloudContext *)self icUserDefaults];
  id v8 = [v7 userDefaults];
  [v8 setObject:v5 forKey:@"CloudDirtyUUIDKey"];

  return v5;
}

- (void)_clearCloudDirtyForToken:(id)a3
{
  id v4 = a3;
  double v5 = [(ICCloudContext *)self processingQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(ICCloudContext *)self icUserDefaults];
  id v7 = [v6 userDefaults];

  id v8 = [v7 objectForKey:@"CloudDirtyUUIDKey"];
  id v9 = v8;
  if (v8 && ![v8 isEqual:v4])
  {
    id v11 = +[REMLog cloudkit];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543618;
      id v13 = v9;
      __int16 v14 = 2114;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NOT clearing cloud dirty {currentToken: %{public}@, cloudDirtyToken: %{public}@}", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    int v10 = +[REMLog cloudkit];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138543618;
      id v13 = v9;
      __int16 v14 = 2114;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Clearing cloud dirty {currentToken: %{public}@, cloudDirtyToken: %{public}@}", (uint8_t *)&v12, 0x16u);
    }

    [v7 removeObjectForKey:@"CloudDirtyUUIDKey"];
  }
}

- (void)incrementRetryCountForOperationType:(id)a3
{
  id v4 = a3;
  double v5 = [(ICCloudContext *)self processingQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000320A4;
  v7[3] = &unk_1008ADC88;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)clearRetryCountForOperationType:(id)a3
{
  id v4 = a3;
  double v5 = [(ICCloudContext *)self processingQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000322C0;
  v7[3] = &unk_1008ADC88;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)incrementOrClearRetryCountForOperationType:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v6
    && ![(ICCloudContext *)self shouldIgnoreErrorForBackoffTimer:v6 operationType:v7])
  {
    [(ICCloudContext *)self incrementRetryCountForOperationType:v7];
  }
  else
  {
    [(ICCloudContext *)self clearRetryCountForOperationType:v7];
  }
}

- (id)errorCodesToIgnoreForBackoffTimer
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1008D71B0, &off_1008D71C8, 0);
}

- (BOOL)shouldIgnoreErrorForBackoffTimer:(id)a3 operationType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ICCloudContext *)self retryCountsByOperationType];
  id v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    unsigned __int8 v10 = 0;
  }
  else if ([v6 code] == (id)2)
  {
    objc_opt_class();
    id v11 = [v6 userInfo];
    int v12 = [v11 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];
    id v13 = REMDynamicCast();
    __int16 v14 = [v13 allValues];

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100032614;
    v18[3] = &unk_1008AF430;
    void v18[4] = self;
    id v19 = v7;
    unsigned __int8 v10 = [v14 ic_containsObjectPassingTest:v18];
  }
  else
  {
    id v15 = [(ICCloudContext *)self errorCodesToIgnoreForBackoffTimer];
    id v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 code]);
    unsigned __int8 v10 = [v15 containsObject:v16];
  }
  return v10;
}

- (void)startRetryTimerIfNecessaryWithError:(id)a3
{
  id v4 = a3;
  double v5 = [(ICCloudContext *)self processingQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000326D8;
  v7[3] = &unk_1008ADC88;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)retryOperationsIfNecessary
{
  id v3 = _os_activity_create((void *)&_mh_execute_header, "CloudKit Retry", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032C70;
  block[3] = &unk_1008ADA80;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  id v4 = [(ICCloudContext *)self processingQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100032CCC;
  v5[3] = &unk_1008ADA80;
  v5[4] = self;
  dispatch_async(v4, v5);

  os_activity_scope_leave(&state);
}

- (id)debug_replaceWithSimulatedCKErrorIfSetWithOriginalError:(id)a3
{
  id v3 = a3;
  id v4 = +[REMUserDefaults daemonUserDefaults];
  double v5 = [v4 debugSimulatedCKErrorCode];

  if (v5)
  {
    id v6 = +[REMLog cloudkit];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v5;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DEBUG debugSimulatedCKErrorCode=%@, original=%@", (uint8_t *)&v14, 0x16u);
    }

    id v7 = [v3 userInfo];
    id v8 = [v7 mutableCopy];

    id v9 = +[NSNumber numberWithDouble:3.0];
    [v8 setObject:v9 forKeyedSubscript:CKErrorRetryAfterKey];

    id v10 = [v5 integerValue];
    id v11 = +[NSDictionary dictionaryWithDictionary:v8];
    id v12 = +[NSError errorWithDomain:CKErrorDomain code:v10 userInfo:v11];
  }
  else
  {
    id v12 = v3;
  }

  return v12;
}

- (void)debug_retryAccountZoneIDsNeedingToBeSavedWithZoneID:(id)a3 accountID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[REMLog cloudkit];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DEBUG retryAccountZoneIDsNeedingToBeSaved {zoneID=%@, accountID=%@}", (uint8_t *)&v14, 0x16u);
  }

  id v9 = [(ICCloudContext *)self accountZoneIDsNeedingToBeSaved];
  [v9 ic_addZoneID:v6 forAccountID:v7];

  id v10 = +[NSMutableDictionary dictionary];
  id v11 = +[NSNumber numberWithDouble:3.0];
  [v10 setObject:v11 forKeyedSubscript:CKErrorRetryAfterKey];

  id v12 = +[NSDictionary dictionaryWithDictionary:v10];
  id v13 = +[NSError errorWithDomain:CKErrorDomain code:1 userInfo:v12];

  [(ICCloudContext *)self startRetryTimerIfNecessaryWithError:v13];
}

- (void)saveServerChangeToken:(id)a3 forRecordZoneID:(id)a4 databaseScope:(int64_t)a5 accountID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = +[REMLog cloudkit];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = [v11 ic_loggingDescription];
    id v15 = (void *)v14;
    if (v14) {
      CFStringRef v16 = (const __CFString *)v14;
    }
    else {
      CFStringRef v16 = @"zone changes";
    }
    id v17 = CKDatabaseScopeString();
    int64_t v18 = [v10 ic_loggingDescription];
    *(_DWORD *)long long buf = 138543874;
    CFStringRef v29 = v16;
    __int16 v30 = 2114;
    __int16 v31 = v17;
    __int16 v32 = 2114;
    long long v33 = v18;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Saving server change token for %{public}@ %{public}@: %{public}@", buf, 0x20u);
  }
  if (v12)
  {
    id v19 = [(ICCloudContext *)self serverChangeTokenContext];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100034108;
    v21[3] = &unk_1008AF550;
    id v22 = v12;
    id v23 = v19;
    id v24 = self;
    id v25 = v11;
    int64_t v27 = a5;
    id v26 = v10;
    long long v20 = v19;
    [v20 performBlockAndWait:v21];
  }
  else
  {
    long long v20 = +[REMLog cloudkit];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10074D3F8();
    }
  }
}

- (id)serverChangeTokenForRecordZoneID:(id)a3 databaseScope:(int64_t)a4 accountID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = sub_10000984C;
    id v25 = sub_10000985C;
    id v26 = 0;
    id v10 = [(ICCloudContext *)self serverChangeTokenContext];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100034800;
    v15[3] = &unk_1008AF578;
    id v16 = v9;
    id v11 = v10;
    id v17 = v11;
    id v19 = &v21;
    int64_t v20 = a4;
    id v18 = v8;
    [v11 performBlockAndWait:v15];
    id v12 = (id)v22[5];

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    id v13 = +[REMLog cloudkit];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10074D494();
    }

    id v12 = 0;
  }

  return v12;
}

- (void)deleteServerChangeTokenForRecordZoneID:(id)a3 databaseScope:(int64_t)a4 accountID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[REMLog cloudkit];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v8 ic_loggingDescription];
    id v12 = (void *)v11;
    if (v11) {
      CFStringRef v13 = (const __CFString *)v11;
    }
    else {
      CFStringRef v13 = @"zone changes";
    }
    uint64_t v14 = CKDatabaseScopeString();
    *(_DWORD *)long long buf = 138543618;
    CFStringRef v24 = v13;
    __int16 v25 = 2114;
    id v26 = v14;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Deleting server change token for %{public}@ %{public}@", buf, 0x16u);
  }
  if (v9)
  {
    id v15 = [(ICCloudContext *)self serverChangeTokenContext];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100034AC0;
    v17[3] = &unk_1008AF5A0;
    id v18 = v9;
    id v19 = v15;
    uint64_t v21 = self;
    int64_t v22 = a4;
    id v20 = v8;
    id v16 = v15;
    [v16 performBlockAndWait:v17];
  }
  else
  {
    id v16 = +[REMLog cloudkit];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10074D5A8();
    }
  }
}

- (void)deleteAllServerChangeTokens
{
  id v3 = +[REMLog cloudkit];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deleting all server change tokens", buf, 2u);
  }

  [(ICCloudContext *)self serverChangeTokenContext];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100034C84;
  v5[3] = &unk_1008ADC88;
  v5[4] = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v6;
  [v4 performBlockAndWait:v5];
}

- (void)deleteAllApplicationDataFromServerWithAccountID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[REMLog cloudkit];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Deleting all server data", buf, 2u);
  }

  if ([v6 length])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100034FC4;
    v11[3] = &unk_1008AE430;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    [(ICCloudContext *)self cancelEverythingWithCompletionHandler:v11];
  }
  else
  {
    id v9 = +[REMLog cloudkit];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_10074D6AC();
    }

    id v10 = ICGenericError();
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }
}

- (void)saveServerChangeToken:(id)a3 forChangedZonesInDatabase:(id)a4 accountID:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  -[ICCloudContext saveServerChangeToken:forRecordZoneID:databaseScope:accountID:](self, "saveServerChangeToken:forRecordZoneID:databaseScope:accountID:", v9, 0, [a4 databaseScope], v8);
}

- (void)deleteServerChangeTokenForChangedZonesInDatabase:(id)a3 accountID:(id)a4
{
  id v6 = a4;
  -[ICCloudContext deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:](self, "deleteServerChangeTokenForRecordZoneID:databaseScope:accountID:", 0, [a3 databaseScope], v6);
}

- (id)serverChangeTokenForChangedZonesInDatabase:(id)a3 accountID:(id)a4
{
  id v6 = a4;
  id v7 = -[ICCloudContext serverChangeTokenForRecordZoneID:databaseScope:accountID:](self, "serverChangeTokenForRecordZoneID:databaseScope:accountID:", 0, [a3 databaseScope], v6);

  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1009061C0 == a6)
  {
    id v11 = a5;
    objc_opt_class();
    id v12 = [v11 objectForKeyedSubscript:NSKeyValueChangeOldKey];
    id v13 = REMDynamicCast();
    id v14 = [v13 unsignedIntegerValue];

    objc_opt_class();
    id v15 = [v11 objectForKeyedSubscript:NSKeyValueChangeNewKey];

    id v16 = REMDynamicCast();
    id v17 = [v16 unsignedIntegerValue];

    if (v14) {
      BOOL v18 = 1;
    }
    else {
      BOOL v18 = v17 == 0;
    }
    if (!v18 || (v14 ? (BOOL v19 = v17 == 0) : (BOOL v19 = 0), v19))
    {
      id v20 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100035680;
      block[3] = &unk_1008AF458;
      void block[4] = self;
      void block[5] = v17;
      dispatch_async(v20, block);
    }
    uint64_t v21 = [(ICCloudContext *)self processingQueue];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10003575C;
    v23[3] = &unk_1008ADA80;
    void v23[4] = self;
    dispatch_async(v21, v23);
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)ICCloudContext;
    id v10 = a5;
    [(ICCloudContext *)&v22 observeValueForKeyPath:a3 ofObject:a4 change:v10 context:a6];
  }
}

- (BOOL)shouldPollCloudKitWhenLaunchingAndBackgrounding
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035838;
  block[3] = &unk_1008ADA80;
  void block[4] = self;
  if (qword_1009228F0 != -1) {
    dispatch_once(&qword_1009228F0, block);
  }
  id v3 = [(ICCloudContext *)self icUserDefaults];
  id v4 = [v3 userDefaults];
  unsigned __int8 v5 = [v4 BOOLForKey:@"PollCloudKitWhenLaunchingAndBackgrounding"];

  return v5;
}

- (void)_accountsDidEnableOrDisable
{
  [(ICCloudContext *)self clearContainers];
  id v3 = +[REMUserDefaults daemonUserDefaults];
  [v3 setCloudKitMergeLocalLastDateMaxRetryReached:0];

  id v4 = +[REMUserDefaults daemonUserDefaults];
  [v4 setCloudKitMergeLocalLastBuildVersionMaxRetryReached:0];

  unsigned __int8 v5 = [(ICCloudContext *)self processingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000359D0;
  block[3] = &unk_1008ADA80;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (void)accountsDidDisable
{
  id v3 = +[REMLog cloudkit];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ICCC received accountsDidDisable from RDStoreController.", buf, 2u);
  }

  [(ICCloudContext *)self _accountsDidEnableOrDisable];
  [(ICCloudContext *)self removeStaleAccountStatus];
  [(ICCloudContext *)self removeStaleFetchDatabaseRetryMetadata];
  id v4 = [(ICCloudContext *)self operationQueue];
  id v5 = [v4 operationCount];

  if (v5)
  {
    id v6 = +[REMLog cloudkit];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ICCC: Stopping all CloudKit operations after deleting CloudKit account", buf, 2u);
    }

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100035C24;
    v7[3] = &unk_1008ADA80;
    void v7[4] = self;
    [(ICCloudContext *)self cancelEverythingWithCompletionHandler:v7];
  }
}

- (void)accountsDidEnable
{
  id v3 = +[REMLog cloudkit];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ICCC received accountsDidEnable from RDStoreController.", (uint8_t *)&buf, 2u);
  }

  [(ICCloudContext *)self _accountsDidEnableOrDisable];
  p_accountInitializerDidCompleteOnAccountsDidChangeObserverLock = &self->_accountInitializerDidCompleteOnAccountsDidChangeObserverLock;
  os_unfair_lock_lock(&self->_accountInitializerDidCompleteOnAccountsDidChangeObserverLock);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100035F38;
  v20[3] = &unk_1008ADA80;
  v20[4] = self;
  sub_100035F38((uint64_t)v20);
  os_unfair_lock_unlock(&self->_accountInitializerDidCompleteOnAccountsDidChangeObserverLock);
  id v5 = +[REMLog cloudkit];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "os_transaction INIT {name: com.apple.remindd.cloudkit.accountsDidEnable.pending.RDAccountInitializerDidCompleteInitializeAllAccountsObserver}", (uint8_t *)&buf, 2u);
  }

  id v6 = (void *)os_transaction_create();
  objc_initWeak(&buf, self);
  id v7 = [RDAccountInitializerDidCompleteInitializeAllAccountsObserver alloc];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100035FAC;
  v16[3] = &unk_1008ADC38;
  objc_copyWeak(&v18, &buf);
  id v8 = v6;
  id v17 = v8;
  id v9 = [(ICCloudContext *)self processingQueue];
  id v10 = [(RDAccountInitializerDidCompleteInitializeAllAccountsObserver *)v7 initWithHandler:v16 queue:v9];

  id v11 = +[REMLog cloudkit];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ICCC: Observing DidCompleteInitializeAllAccountsNotification on accountsDidEnable.", v15, 2u);
  }

  [(RDAccountInitializerDidCompleteInitializeAllAccountsObserver *)v10 observe];
  os_unfair_lock_lock(&self->_accountInitializerDidCompleteOnAccountsDidChangeObserverLock);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000360D8;
  v13[3] = &unk_1008ADC88;
  void v13[4] = self;
  id v12 = v10;
  id v14 = v12;
  sub_1000360D8((uint64_t)v13);
  os_unfair_lock_unlock(p_accountInitializerDidCompleteOnAccountsDidChangeObserverLock);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&buf);
}

- (void)didCompleteInitializeAllAccounts:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCloudContext *)self processingQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 userInfo];

  if (v6)
  {
    id v7 = [v4 userInfo];
    id v8 = [v7 objectForKeyedSubscript:@"error"];

    if (v8)
    {
      id v9 = +[REMLog cloudkit];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10074D7E8();
      }

LABEL_12:
      goto LABEL_16;
    }
  }
  id v10 = +[REMLog cloudkit];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "ICCC: Calling -didCompleteInitializeAllAccounts:", (uint8_t *)&v15, 2u);
  }

  [(ICCloudContext *)self observePrimaryCloudKitAccountPersonIDSaltChanges];
  unsigned int v11 = [(ICCloudContext *)self isDisabled];
  id v12 = +[REMLog cloudkit];
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      id v14 = [(ICCloudContext *)self readinessLoggingDescription];
      int v15 = 138543362;
      id v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ICCC still disabled after accountsDidChange and DidCompleteInitializeAllAccountsNotification, will retry UpdateCloudContext in a few seconds... {%{public}@}", (uint8_t *)&v15, 0xCu);
    }
    [(ICCloudContext *)self setNeedsToUpdateCloudContextOnAccountsDidChange:1];
    id v8 = +[REMError retryLaterErrorWithInterval:3.0];
    [(ICCloudContext *)self startRetryTimerIfNecessaryWithError:v8];
    goto LABEL_12;
  }
  if (v13)
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ICCC: Now call UpdateCloudContext after accountsDidChange and RDAccountInitializer completed works.", (uint8_t *)&v15, 2u);
  }

  [(ICCloudContext *)self setNeedsToUpdateCloudContextOnAccountsDidChange:0];
  [(ICCloudContext *)self updateCloudContextStateWithSyncOption:1 syncReason:@"AccountsDidChange" withCompletionHandler:0];
LABEL_16:
}

- (void)applicationWillEnterForeground
{
  id v3 = +[REMLog cloudkit];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Cloud context received application will enter foreground notification", buf, 2u);
  }

  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036424;
  block[3] = &unk_1008ADA80;
  void block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  dispatch_time_t v4 = +[REMLog cloudkit];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Push connection established with iCloud", v5, 2u);
  }
}

- (void)connection:(id)a3 didFailToSendOutgoingMessage:(id)a4 error:(id)a5
{
  id v5 = a5;
  id v6 = +[REMLog cloudkit];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10074D850();
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ICCloudContext *)self processingQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = _os_activity_create((void *)&_mh_execute_header, "SYNC[APS]", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  id v10 = +[REMLog cloudkit];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = [v7 topic];
    *(_DWORD *)id buf = 138543362;
    long long v35 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SYNC[APS] START {topic: %{public}@}", buf, 0xCu);
  }
  id v12 = +[REMLog cloudkit];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "os_transaction INIT {name: com.apple.remindd.cloudkit.sync.aps}", buf, 2u);
  }

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10003691C;
  v31[3] = &unk_1008ADA80;
  id v13 = (id)os_transaction_create();
  id v32 = v13;
  id v14 = objc_retainBlock(v31);
  int v15 = [v7 topic];
  id v16 = [(ICCloudContext *)self apsTopic];
  unsigned __int8 v17 = [v15 isEqualToString:v16];

  if (v17)
  {
    id v18 = [v7 userInfo];
    BOOL v19 = +[CKNotification notificationFromRemoteNotificationDictionary:v18];

    if (v19)
    {
      id v20 = [(ICCloudContext *)self _markCloudAsDirtyAndReturnToken];
      uint64_t v21 = [(ICCloudContext *)self processingQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000369A0;
      block[3] = &unk_1008AF668;
      void block[4] = self;
      __int16 v30 = v14;
      id v28 = v19;
      id v29 = v20;
      id v22 = v20;
      dispatch_async(v21, block);
    }
    else
    {
      __int16 v25 = +[REMLog cloudkit];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        id v26 = [(ICCloudContext *)self apsTopic];
        sub_10074D8B8(v26, (uint64_t)buf, v25);
      }

      ((void (*)(void *))v14[2])(v14);
    }
  }
  else
  {
    uint64_t v23 = +[REMLog cloudkit];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      CFStringRef v24 = [v7 topic];
      sub_10074D908(v24, (uint64_t)buf, v23);
    }

    ((void (*)(void *))v14[2])(v14);
  }

  os_activity_scope_leave(&state);
}

- (void)setMigrationStateToDidChooseToMigrate:(BOOL)a3 didFinishMigration:(BOOL)a4 createZoneAccountIfFinishMigration:(BOOL)a5 accountID:(id)a6 completionHandler:(id)a7
{
  BOOL v8 = a5;
  BOOL v39 = a4;
  BOOL v9 = a3;
  unsigned int v11 = (__CFString *)a6;
  long long v40 = (void (**)(id, id))a7;
  uint64_t v59 = 0;
  id v60 = &v59;
  uint64_t v61 = 0x3032000000;
  id v62 = sub_10000984C;
  id v63 = sub_10000985C;
  id v64 = 0;
  uint64_t v53 = 0;
  id v54 = &v53;
  uint64_t v55 = 0x3032000000;
  id v56 = sub_10000984C;
  __int16 v57 = sub_10000985C;
  id v58 = 0;
  id v12 = +[REMLog cloudkit];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v13 = @"nil";
    *(_DWORD *)id buf = 67109890;
    if (v11) {
      CFStringRef v13 = v11;
    }
    *(_DWORD *)__int16 v66 = v9;
    *(_WORD *)&v66[4] = 1024;
    *(_DWORD *)&v66[6] = v39;
    LOWORD(v67) = 1024;
    *(_DWORD *)((char *)&v67 + 2) = v8;
    HIWORD(v67) = 2114;
    CFStringRef v68 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Force-setting migration state {didChooseToMigrate: %d, didFinishMigration: %d, createZoneIfFinishMigration: %d, accountID = %{public}@", buf, 0x1Eu);
  }

  BOOL v14 = v9 && v8;
  if (v9 && v8)
  {
    int v15 = [(ICCloudContext *)self appleAccountUtilities];
    id v16 = [v15 accountStore];

    unsigned __int8 v17 = [v16 accountWithIdentifier:v11];
    id v18 = [v17 displayAccount];
    BOOL v19 = [v18 identifier];

    if (!v19)
    {
      id v24 = +[NSError errorWithDomain:@"com.apple.reminders.cloud" code:0 userInfo:0];
      id v29 = +[REMLog cloudkit];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10074DA4C();
      }

      v40[2](v40, v24);
      goto LABEL_30;
    }
    id v20 = +[REMLog cloudkit];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138543362;
      *(void *)__int16 v66 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Force-setting migration state: display account: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    BOOL v19 = v11;
  }
  id v16 = [(ICCloudContext *)self containerForAccountID:v19];
  uint64_t v21 = dispatch_group_create();
  id v22 = v21;
  if (v14)
  {
    dispatch_group_enter(v21);
    uint64_t v23 = +[REMLog cloudkit];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138543618;
      *(void *)__int16 v66 = @"Reminders";
      *(_WORD *)&v66[8] = 2114;
      id v67 = v19;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Force-setting migration state: set %{public}@ zone for accountID: %{public}@", buf, 0x16u);
    }

    id v24 = [objc_alloc((Class)CKRecordZone) initWithZoneName:@"Reminders"];
    __int16 v25 = [v16 privateCloudDatabase];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_100037644;
    v51[3] = &unk_1008AF690;
    unsigned __int8 v17 = v22;
    id v52 = v17;
    [v25 saveRecordZone:v24 completionHandler:v51];

    dispatch_time_t v26 = dispatch_time(0, 10000000000);
    if (dispatch_group_wait(v17, v26))
    {
      int64_t v27 = +[NSError errorWithDomain:@"com.apple.reminders.cloud" code:0 userInfo:0];
      id v28 = +[REMLog cloudkit];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_10074DAB4();
      }

      v40[2](v40, v27);
      unsigned int v11 = v19;
      goto LABEL_30;
    }
  }
  dispatch_group_enter(v22);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100037708;
  v43[3] = &unk_1008AF6E0;
  unsigned int v11 = v19;
  long long v44 = v11;
  id v45 = self;
  BOOL v50 = v14;
  id v48 = &v59;
  id v49 = &v53;
  unsigned __int8 v17 = v22;
  id v46 = v17;
  id v16 = v16;
  id v47 = v16;
  __int16 v30 = [(ICCloudContext *)self fetchUserRecordOperationWithAccountID:v11 completionHandler:v43];
  __int16 v31 = [v30 database];
  [v31 addOperation:v30];

  dispatch_time_t v32 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v17, v32))
  {
    long long v33 = +[NSError errorWithDomain:@"com.apple.reminders.cloud" code:0 userInfo:0];
    long long v34 = +[REMLog cloudkit];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_10074DA80();
    }

    v40[2](v40, v33);
  }
  else
  {
    long long v33 = +[NSMutableArray arrayWithObject:v60[5]];
    +[REMCDAccount writeMigrationStateTo:v60[5] didChooseToMigrate:v9 didFinishMigration:v39];
    uint64_t v35 = v54[5];
    if (v35)
    {
      +[REMCDAccount writeMigrationStateTo:v35 didChooseToMigrate:v9 didFinishMigration:v39];
      [v33 addObject:v54[5]];
    }
    id v36 = [objc_alloc((Class)CKModifyRecordsOperation) initWithRecordsToSave:v33 recordIDsToDelete:0];
    [(ICCloudContext *)self configureOperation:v36];
    id v37 = [v16 privateCloudDatabase];
    [v36 setDatabase:v37];

    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100037B0C;
    v41[3] = &unk_1008AE390;
    long long v42 = v40;
    [v36 setModifyRecordsCompletionBlock:v41];
    id v38 = [v36 database];
    [v38 addOperation:v36];
  }
  id v24 = v44;
LABEL_30:

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);
}

- (void)migrationStateDidChange:(BOOL)a3 didFinishMigration:(BOOL)a4
{
  id v7 = [(ICCloudContext *)self processingQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100037CCC;
  v8[3] = &unk_1008AF708;
  BOOL v9 = a3;
  BOOL v10 = a4;
  void v8[4] = self;
  dispatch_async(v7, v8);
}

- (void)adjustAPSNotificationDebouncerInterval
{
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100037E98;
  v4[3] = &unk_1008ADFD0;
  v4[4] = self;
  id v3 = [(ICCloudContext *)self newBackgroundContext];
  id v5 = v3;
  id v6 = &v7;
  [v3 performBlockAndWait:v4];
  [(ICCloudContext *)self adjustAPSNotificationDebouncerIntervalWithMigrationState:*((unsigned __int8 *)v8 + 24)];

  _Block_object_dispose(&v7, 8);
}

- (void)adjustAPSNotificationDebouncerIntervalWithMigrationState:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[ICCloudConfiguration sharedConfiguration];
  id v6 = v5;
  if (v3) {
    [v5 apsDebouncerMigrationInProgressInterval];
  }
  else {
    [v5 apsDebouncerDefaultInterval];
  }
  double v8 = v7;
  uint64_t v9 = +[REMLog cloudkit];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    double v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Setting APS debouncer interval to %f", (uint8_t *)&v11, 0xCu);
  }

  char v10 = [(ICCloudContext *)self apsNotificationHandlingDebouncer];
  [v10 setDebouncingInterval:v8];
}

- (id)setUpCloudSchemaCatchUpSyncContextMapWithAccountIDs:(id)a3 syncReason:(id)a4
{
  return [(ICCloudContext *)self setUpCloudSchemaCatchUpSyncContextMapWithAccountIDs:a3 syncReason:a4 outBackgroundScheduledCatchUpSyncContextMap:0];
}

- (id)setUpCloudSchemaCatchUpSyncContextMapWithAccountIDs:(id)a3 syncReason:(id)a4 outBackgroundScheduledCatchUpSyncContextMap:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v32 = a5;
  char v10 = [(ICCloudContext *)self processingQueue];
  dispatch_assert_queue_V2(v10);

  if (![v8 count])
  {
    id v33 = +[NSDictionary dictionary];
    goto LABEL_30;
  }
  +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v8 count]);
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  int v11 = [(ICCloudContext *)self icUserDefaults];
  double v12 = [v11 cloudSchemaCatchUpSyncSchedulingStateStorage];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v31 = v8;
  id obj = v8;
  id v13 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (!v13) {
    goto LABEL_26;
  }
  id v14 = v13;
  uint64_t v15 = *(void *)v37;
  do
  {
    id v16 = 0;
    id v34 = v14;
    do
    {
      if (*(void *)v37 != v15) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void *)(*((void *)&v36 + 1) + 8 * (void)v16);
      id v18 = -[ICCloudContext contextForAccountID:withBatchFetchHelper:](self, "contextForAccountID:withBatchFetchHelper:", v17, 0, v31);
      BOOL v19 = [[ICCloudSchemaCatchUpSyncContext alloc] initWithAccountIdentifier:v17 syncReason:v9 schedulingStateStorage:v12 managedObjectContext:v18];
      if (![(ICCloudSchemaCatchUpSyncContext *)v19 shouldPerformCloudSchemaCatchUpSync])
      {
        uint64_t v22 = v15;
        uint64_t v23 = v12;
        id v24 = v9;
        unsigned int v25 = [(ICCloudSchemaCatchUpSyncContext *)v19 isCloudSchemaCatchUpSyncNeeded];
        dispatch_time_t v26 = +[REMLog cloudkit];
        int64_t v27 = v26;
        if (v25)
        {
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id buf = 138543618;
            uint64_t v41 = v17;
            __int16 v42 = 2048;
            uint64_t v43 = 20240715;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "CloudSchemaCatchUpSync: Account needs to schedule a cloud schema catch up sync {accountID: %{public}@, runtimeCloudSchemaVersion: %lld}", buf, 0x16u);
          }

          id v28 = [(ICCloudContext *)self cloudSchemaCatchUpSyncController];

          if (v28)
          {
            if (v32) {
              [v32 setObject:v19 forKey:v17];
            }
            id v29 = [(ICCloudContext *)self cloudSchemaCatchUpSyncController];
            [v29 scheduleBackgroundActivity];

            goto LABEL_23;
          }
          int64_t v27 = +[REMLog cloudkit];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)id buf = 138543618;
            uint64_t v41 = v17;
            __int16 v42 = 2048;
            uint64_t v43 = 20240715;
            _os_log_fault_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "CloudSchemaCatchUpSync: No ICCloudSchemaCatchUpSyncController given to the ICCloudContext, cannot schedule cloud schema catch up sync with system {accountID: %{public}@, runtimeCloudSchemaVersion: %lld}", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)id buf = 138543618;
          uint64_t v41 = v17;
          __int16 v42 = 2048;
          uint64_t v43 = 20240715;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "CloudSchemaCatchUpSync: Account does not need a cloud schema catch up sync {accountID: %{public}@, runtimeCloudSchemaVersion: %lld}", buf, 0x16u);
        }

LABEL_23:
        id v9 = v24;
        double v12 = v23;
        uint64_t v15 = v22;
        id v14 = v34;
        goto LABEL_24;
      }
      id v20 = +[REMLog cloudkit];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v21 = [(ICCloudSchemaCatchUpSyncContext *)v19 persistenceCloudSchemaVersion];
        *(_DWORD *)id buf = 138543874;
        uint64_t v41 = v17;
        __int16 v42 = 2048;
        uint64_t v43 = v21;
        __int16 v44 = 2048;
        uint64_t v45 = 20240715;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "CloudSchemaCatchUpSync: Account needs to perform cloud schema catch up sync {accountID: %{public}@, persistenceCloudSchemaVersion: %lld, runtimeCloudSchemaVersion: %lld}", buf, 0x20u);
      }

      [v33 setObject:v19 forKey:v17];
LABEL_24:

      id v16 = (char *)v16 + 1;
    }
    while (v14 != v16);
    id v14 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
  }
  while (v14);
LABEL_26:

  if ([v12 schedulingState] != (id)1)
  {
    [v12 setSchedulingState:0];
    [v12 setLastScheduledDate:0];
  }

  id v8 = v31;
LABEL_30:

  return v33;
}

- (void)didCompleteCloudSchemaCatchUpSyncWithContextMap:(id)a3 error:(id)a4 syncTypeLabel:(id)a5 debugLogLabel:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(ICCloudContext *)self processingQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003872C;
  block[3] = &unk_1008AE520;
  id v20 = v11;
  id v21 = v10;
  uint64_t v22 = self;
  id v23 = v12;
  id v24 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v10;
  id v18 = v11;
  dispatch_async(v14, block);
}

- (BOOL)retryPerformingCloudSchemaCatchUpSync
{
  BOOL v3 = [(ICCloudContext *)self processingQueue];
  dispatch_assert_queue_V2(v3);

  dispatch_time_t v4 = [(ICCloudContext *)self retryCountsByOperationType];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"CloudSchemaCatchUpSync"];
  id v6 = (void *)v5;
  double v7 = &off_1008D7198;
  if (v5) {
    double v7 = (_UNKNOWN **)v5;
  }
  id v8 = v7;

  id v9 = +[ICCloudConfiguration sharedConfiguration];
  id v10 = [v9 cloudSchemaCatchUpSyncMaximumRetryCount];
  unint64_t v11 = (int)[v8 intValue];
  id v12 = +[REMLog cloudkit];
  id v13 = v12;
  if ((unint64_t)v10 <= v11)
  {
    unint64_t v24 = v11;
    unsigned int v25 = v8;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_10074DB50();
    }

    id v15 = [(ICCloudContext *)self containersByAccountID];
    id v16 = [v15 allKeys];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v14 = v16;
    id v17 = [v14 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v18; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v14);
          }
          uint64_t v21 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v22 = -[ICCloudContext contextForAccountID:withBatchFetchHelper:](self, "contextForAccountID:withBatchFetchHelper:", v21, 0, v24, v25, (void)v26);
          +[ICCloudSchemaCompatibilityUtils cloudSchemaCatchUpSyncDidCompleteWithAccountIdentifier:v21 context:v22];
        }
        id v18 = [v14 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v18);
    }

    [(ICCloudContext *)self clearRetryCountForOperationType:@"CloudSchemaCatchUpSync"];
    unint64_t v11 = v24;
    id v8 = v25;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 67109120;
      unsigned int v31 = [v8 intValue];
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CloudSchemaCatchUpSync completed with error, will retry later (currentRetryCount: %d)", buf, 8u);
    }

    [v9 cloudSchemaCatchUpSyncInitialRetryInterval];
    +[REMError retryLaterErrorWithInterval:](REMError, "retryLaterErrorWithInterval:");
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    [(ICCloudContext *)self incrementOrClearRetryCountForOperationType:@"CloudSchemaCatchUpSync" error:v14];
    [(ICCloudContext *)self startRetryTimerIfNecessaryWithError:v14];
  }

  return (unint64_t)v10 > v11;
}

+ (id)babysittableWaiterID
{
  return @"ICCloudContext";
}

- (id)waiterID
{
  v2 = objc_opt_class();

  return _[v2 babysittableWaiterID];
}

- (RDStoreController)storeController
{
  return self->_storeController;
}

- (ICCloudContextDelegate)cloudContextDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudContextDelegate);

  return (ICCloudContextDelegate *)WeakRetained;
}

- (void)setCloudContextDelegate:(id)a3
{
}

- (BOOL)fetchOperationsPending
{
  return self->_fetchOperationsPending;
}

- (BOOL)needsToUpdateSubscriptions
{
  return self->_needsToUpdateSubscriptions;
}

- (void)setNeedsToUpdateSubscriptions:(BOOL)a3
{
  self->_needsToUpdateSubscriptions = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (ICUserDefaults)icUserDefaults
{
  return self->_icUserDefaults;
}

- (void)setIcUserDefaults:(id)a3
{
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (REMAppleAccountUtilities)appleAccountUtilities
{
  return self->_appleAccountUtilities;
}

- (void)setAppleAccountUtilities:(id)a3
{
}

- (ICCloudContextSyncMetrics)lastSyncMetrics
{
  return (ICCloudContextSyncMetrics *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastSyncMetrics:(id)a3
{
}

- (BOOL)hasPassedBuddy
{
  return self->_hasPassedBuddy;
}

- (void)setHasPassedBuddy:(BOOL)a3
{
  self->_hasPassedBuddy = a3;
}

- (BOOL)isSystemAvailableForSyncing
{
  return self->_isSystemAvailableForSyncing;
}

- (void)setIsSystemAvailableForSyncing:(BOOL)a3
{
  self->_isSystemAvailableForSyncing = a3;
}

- (NSMutableSet)objectIDsToRetry
{
  return self->_objectIDsToRetry;
}

- (void)setObjectIDsToRetry:(id)a3
{
}

- (BOOL)hasRetryTimer
{
  return self->_hasRetryTimer;
}

- (void)setHasRetryTimer:(BOOL)a3
{
  self->_hasRetryTimer = a3;
}

- (NSTimer)retryTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 112, 1);
}

- (void)setRetryTimer:(id)a3
{
}

- (NSMutableDictionary)retryCountsByOperationType
{
  return self->_retryCountsByOperationType;
}

- (void)setRetryCountsByOperationType:(id)a3
{
}

- (NSMutableDictionary)databaseScopeStringsNeedingRetryFetchChangesByAccountID
{
  return self->_databaseScopeStringsNeedingRetryFetchChangesByAccountID;
}

- (void)setDatabaseScopeStringsNeedingRetryFetchChangesByAccountID:(id)a3
{
}

- (BOOL)isDisabledInternal
{
  return self->_disabledInternal;
}

- (void)setDisabledInternal:(BOOL)a3
{
  self->_disabledInternal = a3;
}

- (BOOL)needsToProcessAllDirtyObjects
{
  return self->_needsToProcessAllDirtyObjects;
}

- (void)setNeedsToProcessAllDirtyObjects:(BOOL)a3
{
  self->_needsToProcessAllDirtyObjects = a3;
}

- (NSMutableSet)objectIDsToProcess
{
  return self->_objectIDsToProcess;
}

- (void)setObjectIDsToProcess:(id)a3
{
}

- (ICSelectorDelayer)processingSelectorDelayer
{
  return (ICSelectorDelayer *)objc_getProperty(self, a2, 144, 1);
}

- (void)setProcessingSelectorDelayer:(id)a3
{
}

- (ICSelectorDelayer)pollingSelectorDelayer
{
  return (ICSelectorDelayer *)objc_getProperty(self, a2, 152, 1);
}

- (void)setPollingSelectorDelayer:(id)a3
{
}

- (BOOL)didAddObservers
{
  return self->_didAddObservers;
}

- (void)setDidAddObservers:(BOOL)a3
{
  self->_didAddObservers = a3;
}

- (BOOL)isFetchingEnabled
{
  return self->_fetchingEnabled;
}

- (void)setFetchingEnabled:(BOOL)a3
{
  self->_fetchingEnabled = a3;
}

- (BOOL)syncDisabledByServer
{
  return self->_syncDisabledByServer;
}

- (void)setSyncDisabledByServer:(BOOL)a3
{
  self->_syncDisabledByServer = a3;
}

- (BOOL)uploadSuspended
{
  return self->_uploadSuspended;
}

- (void)setUploadSuspended:(BOOL)a3
{
  self->_uploadSuspended = a3;
}

- (BOOL)supportsCloudKitSyncing
{
  return self->_supportsCloudKitSyncing;
}

- (void)setSupportsCloudKitSyncing:(BOOL)a3
{
  self->_supportsCloudKitSyncing = a3;
}

- (BOOL)shouldUnregisterBuddy
{
  return self->_shouldUnregisterBuddy;
}

- (void)setShouldUnregisterBuddy:(BOOL)a3
{
  self->_shouldUnregisterBuddy = a3;
}

- (void)setContainersByAccountID:(id)a3
{
}

- (os_unfair_lock_s)containersByAccountIDLock
{
  return self->_containersByAccountIDLock;
}

- (void)setContainersByAccountIDLock:(os_unfair_lock_s)a3
{
  self->_containersByAccountIDLock = a3;
}

- (NSMutableDictionary)accountZoneIDsNeedingFetchChanges
{
  return self->_accountZoneIDsNeedingFetchChanges;
}

- (void)setAccountZoneIDsNeedingFetchChanges:(id)a3
{
}

- (NSMutableDictionary)accountZoneIDsFetchingChanges
{
  return self->_accountZoneIDsFetchingChanges;
}

- (void)setAccountZoneIDsFetchingChanges:(id)a3
{
}

- (NSMutableDictionary)accountZoneIDsNeedingToBeSaved
{
  return self->_accountZoneIDsNeedingToBeSaved;
}

- (void)setAccountZoneIDsNeedingToBeSaved:(id)a3
{
}

- (NSDictionary)subscribedSubscriptionIDsByAccountID
{
  return (NSDictionary *)objc_getProperty(self, a2, 192, 1);
}

- (void)setSubscribedSubscriptionIDsByAccountID:(id)a3
{
}

- (NSDate)subscribedSubscriptionIDsLastModifiedDate
{
  return (NSDate *)objc_getProperty(self, a2, 200, 1);
}

- (void)setSubscribedSubscriptionIDsLastModifiedDate:(id)a3
{
}

- (BOOL)didCheckForLongLivedOperations
{
  return self->_didCheckForLongLivedOperations;
}

- (void)setDidCheckForLongLivedOperations:(BOOL)a3
{
  self->_didCheckForLongLivedOperations = a3;
}

- (double)timeoutIntervalForResource
{
  return self->_timeoutIntervalForResource;
}

- (void)setTimeoutIntervalForResource:(double)a3
{
  self->_timeoutIntervalForResource = a3;
}

- (NSString)apsTopic
{
  return self->_apsTopic;
}

- (void)setApsTopic:(id)a3
{
}

- (APSConnection)apsConnection
{
  return self->_apsConnection;
}

- (void)setApsConnection:(id)a3
{
}

- (_TtC7remindd37RDDebouncerWithCKDatabaseNotification)apsNotificationHandlingDebouncer
{
  return self->_apsNotificationHandlingDebouncer;
}

- (void)setApsNotificationHandlingDebouncer:(id)a3
{
}

- (_TtC7remindd21RDDebouncerWithNumber)accountChangedNotificationHandlingDebouncer
{
  return self->_accountChangedNotificationHandlingDebouncer;
}

- (void)setAccountChangedNotificationHandlingDebouncer:(id)a3
{
}

- (BOOL)wasInternetReachable
{
  return self->_wasInternetReachable;
}

- (void)setWasInternetReachable:(BOOL)a3
{
  self->_wasInternetReachable = a3;
}

- (double)lastSyncSinceInternetReachable
{
  return self->_lastSyncSinceInternetReachable;
}

- (void)setLastSyncSinceInternetReachable:(double)a3
{
  self->_lastSyncSinceInternetReachable = a3;
}

- (DADBuddyStateObserver)buddyStateObserver
{
  return self->_buddyStateObserver;
}

- (void)setBuddyStateObserver:(id)a3
{
}

- (BOOL)pendingAccountInitializerCompleteOnLaunch
{
  return self->_pendingAccountInitializerCompleteOnLaunch;
}

- (void)setPendingAccountInitializerCompleteOnLaunch:(BOOL)a3
{
  self->_pendingAccountInitializerCompleteOnLaunch = a3;
}

- (RDAccountInitializerDidCompleteInitializeAllAccountsObserver)accountInitializerDidCompleteOnLaunchObserver
{
  return self->_accountInitializerDidCompleteOnLaunchObserver;
}

- (void)setAccountInitializerDidCompleteOnLaunchObserver:(id)a3
{
}

- (BOOL)needsToMergeLocalObjects
{
  return self->_needsToMergeLocalObjects;
}

- (void)setNeedsToMergeLocalObjects:(BOOL)a3
{
  self->_needsToMergeLocalObjects = a3;
}

- (BOOL)needsToUpdateCloudContextOnAccountsDidChange
{
  return self->_needsToUpdateCloudContextOnAccountsDidChange;
}

- (void)setNeedsToUpdateCloudContextOnAccountsDidChange:(BOOL)a3
{
  self->_needsToUpdateCloudContextOnAccountsDidChange = a3;
}

- (RDAccountInitializerDidCompleteInitializeAllAccountsObserver)accountInitializerDidCompleteOnAccountsDidChangeObserver
{
  return self->_accountInitializerDidCompleteOnAccountsDidChangeObserver;
}

- (void)setAccountInitializerDidCompleteOnAccountsDidChangeObserver:(id)a3
{
}

- (os_unfair_lock_s)accountInitializerDidCompleteOnAccountsDidChangeObserverLock
{
  return self->_accountInitializerDidCompleteOnAccountsDidChangeObserverLock;
}

- (void)setAccountInitializerDidCompleteOnAccountsDidChangeObserverLock:(os_unfair_lock_s)a3
{
  self->_accountInitializerDidCompleteOnAccountsDidChangeObserverLock = a3;
}

- (NSMutableDictionary)recognizedCloudObjectClasses
{
  return self->_recognizedCloudObjectClasses;
}

- (void)setRecognizedCloudObjectClasses:(id)a3
{
}

- (RDAccountPersonIDSaltObserver)accountPersonIDSaltObserver
{
  return self->_accountPersonIDSaltObserver;
}

- (void)setAccountPersonIDSaltObserver:(id)a3
{
}

- (NSNotificationCenter)unitTest_notificationCenter
{
  return self->_unitTest_notificationCenter;
}

- (void)setUnitTest_notificationCenter:(id)a3
{
}

- (ICCloudSchemaCatchUpSyncController)cloudSchemaCatchUpSyncController
{
  return self->_cloudSchemaCatchUpSyncController;
}

- (void)setCloudSchemaCatchUpSyncController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudSchemaCatchUpSyncController, 0);
  objc_storeStrong((id *)&self->_unitTest_notificationCenter, 0);
  objc_storeStrong((id *)&self->_accountPersonIDSaltObserver, 0);
  objc_storeStrong((id *)&self->_recognizedCloudObjectClasses, 0);
  objc_storeStrong((id *)&self->_accountInitializerDidCompleteOnAccountsDidChangeObserver, 0);
  objc_storeStrong((id *)&self->_accountInitializerDidCompleteOnLaunchObserver, 0);
  objc_storeStrong((id *)&self->_buddyStateObserver, 0);
  objc_storeStrong((id *)&self->_accountChangedNotificationHandlingDebouncer, 0);
  objc_storeStrong((id *)&self->_apsNotificationHandlingDebouncer, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_apsTopic, 0);
  objc_storeStrong((id *)&self->_subscribedSubscriptionIDsLastModifiedDate, 0);
  objc_storeStrong((id *)&self->_subscribedSubscriptionIDsByAccountID, 0);
  objc_storeStrong((id *)&self->_accountZoneIDsNeedingToBeSaved, 0);
  objc_storeStrong((id *)&self->_accountZoneIDsFetchingChanges, 0);
  objc_storeStrong((id *)&self->_accountZoneIDsNeedingFetchChanges, 0);
  objc_storeStrong((id *)&self->_containersByAccountID, 0);
  objc_storeStrong((id *)&self->_pollingSelectorDelayer, 0);
  objc_storeStrong((id *)&self->_processingSelectorDelayer, 0);
  objc_storeStrong((id *)&self->_objectIDsToProcess, 0);
  objc_storeStrong((id *)&self->_databaseScopeStringsNeedingRetryFetchChangesByAccountID, 0);
  objc_storeStrong((id *)&self->_retryCountsByOperationType, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_objectIDsToRetry, 0);
  objc_storeStrong((id *)&self->_lastSyncMetrics, 0);
  objc_storeStrong((id *)&self->_appleAccountUtilities, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_icUserDefaults, 0);
  objc_destroyWeak((id *)&self->_cloudContextDelegate);

  objc_storeStrong((id *)&self->_storeController, 0);
}

+ (BOOL)conformsToRDICCloudContextCryptoStringProviding
{
  return 1;
}

+ (id)base64EncodedHMACStringFromString:(id)a3 usingSalt:(id)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v5 = a4;
  uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;

  String.base64EncodedHMACString(using:)();
  uint64_t v10 = v9;
  sub_100097F34(v6, v8);
  swift_bridgeObjectRelease();
  if (v10)
  {
    NSString v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v11 = 0;
  }

  return v11;
}

@end