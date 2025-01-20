@interface CKKSKeychainView
- (BOOL)_onQueueZoneIsReadyForFetching:(id)a3;
- (BOOL)_onqueueOtherDevicesReportHavingTLKs:(id)a3 trustStates:(id)a4;
- (BOOL)_onqueueResetAllInflightOQE:(id *)a3;
- (BOOL)allowOutOfBandFetch:(id *)a3;
- (BOOL)anyViewsInState:(id)a3;
- (BOOL)ckErrorOrPartialError:(id)a3 isError:(int64_t)a4 zoneID:(id)a5;
- (BOOL)firstManateeKeyFetched;
- (BOOL)halted;
- (BOOL)havoc;
- (BOOL)initiatedLocalScan;
- (BOOL)insideSQLTransaction;
- (BOOL)itemModificationsBeforePolicyLoaded;
- (BOOL)keyStateFullRefetchRequested;
- (BOOL)keyStateMachineRefetched;
- (BOOL)outgoingQueueEmpty:(id *)a3;
- (BOOL)scheduleOperationWithoutDependencies:(id)a3;
- (BOOL)setCurrentSyncingPolicy:(id)a3;
- (BOOL)setCurrentSyncingPolicy:(id)a3 policyIsFresh:(BOOL)a4;
- (BOOL)shouldRetryAfterFetchError:(id)a3 zoneID:(id)a4;
- (BOOL)unwrapKeysAndSaveToCache:(id)a3 syncKeys:(id)a4 error:(id *)a5;
- (BOOL)unwrapTLKAndSaveToCache:(id)a3 tlks:(id)a4 tlkShares:(id)a5 error:(id *)a6;
- (BOOL)waitForFetchAndIncomingQueueProcessing;
- (BOOL)waitForKeyHierarchyReadiness;
- (BOOL)waitForPolicy:(unint64_t)a3 error:(id *)a4;
- (BOOL)waitUntilAllOperationsAreFinished;
- (BOOL)waitUntilReadyForRPCForOperation:(id)a3 fast:(BOOL)a4 errorOnNoCloudKitAccount:(BOOL)a5 errorOnPolicyMissing:(BOOL)a6 error:(id *)a7;
- (BOOL)zoneIsReadyForFetching:(id)a3;
- (CKContainer)container;
- (CKKSAccountStateTracker)accountTracker;
- (CKKSCloudKitClassDependencies)cloudKitClassDependencies;
- (CKKSCondition)accountStateKnown;
- (CKKSCondition)loggedIn;
- (CKKSCondition)loggedOut;
- (CKKSCondition)policyLoaded;
- (CKKSCondition)trustStatusKnown;
- (CKKSCuttlefishAdapterProtocol)cuttlefishAdapter;
- (CKKSIncomingQueueOperation)lastIncomingQueueOperation;
- (CKKSKeychainView)initWithContainer:(id)a3 contextID:(id)a4 activeAccount:(id)a5 accountTracker:(id)a6 lockStateTracker:(id)a7 reachabilityTracker:(id)a8 savedTLKNotifier:(id)a9 cloudKitClassDependencies:(id)a10 personaAdapter:(id)a11 accountsAdapter:(id)a12 cuttlefishAdapter:(id)a13;
- (CKKSLockStateTracker)lockStateTracker;
- (CKKSNearFutureScheduler)outgoingQueueOperationScheduler;
- (CKKSNearFutureScheduler)outgoingQueuePriorityOperationScheduler;
- (CKKSNearFutureScheduler)suggestTLKUpload;
- (CKKSNewTLKOperation)lastNewTLKOperation;
- (CKKSOperationDependencies)operationDependencies;
- (CKKSOutgoingQueueOperation)lastOutgoingQueueOperation;
- (CKKSProcessReceivedKeysOperation)lastProcessReceivedKeysOperation;
- (CKKSReachabilityTracker)reachabilityTracker;
- (CKKSReencryptOutgoingItemsOperation)lastReencryptOutgoingItemsOperation;
- (CKKSResultOperation)accountLoggedInDependency;
- (CKKSResultOperation)lastFixupOperation;
- (CKKSResultOperation)resultsOfNextIncomingQueueOperationOperation;
- (CKKSSecDbAdapter)databaseProvider;
- (CKKSSynchronizeOperation)lastSynchronizeOperation;
- (CKKSZoneChangeFetcher)zoneChangeFetcher;
- (NSArray)currentTrustStates;
- (NSDate)earliestFetchTime;
- (NSDictionary)stateConditions;
- (NSHashTable)outgoingQueueOperations;
- (NSMutableSet)resyncRecordsSeen;
- (NSOperation)holdIncomingQueueOperation;
- (NSOperation)holdLocalSynchronizeOperation;
- (NSOperation)holdOutgoingQueueOperation;
- (NSOperationQueue)operationQueue;
- (NSSet)viewAllowList;
- (NSSet)viewList;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)zoneName;
- (OS_dispatch_queue)queue;
- (OTAccountsAdapter)accountsAdapter;
- (OTPersonaAdapter)personaAdapter;
- (OctagonStateMachine)stateMachine;
- (OctagonStateMultiStateArrivalWatcher)priorityViewsProcessed;
- (TPSyncingPolicy)syncingPolicy;
- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5;
- (id)becomeReadyOperation:(id)a3;
- (id)createAccountLoggedInDependency:(id)a3;
- (id)createViewState:(id)a3 contextID:(id)a4 zoneIsNew:(BOOL)a5 priorityView:(BOOL)a6 ckksManagedView:(BOOL)a7;
- (id)externalManagedViewForRPC:(id)a3 error:(id *)a4;
- (id)fastStatus:(id)a3 zoneStateEntry:(id)a4;
- (id)findFirstPendingOperation:(id)a3;
- (id)findFirstPendingOperation:(id)a3 ofClass:(Class)a4;
- (id)findKeySets:(BOOL)a3;
- (id)intransactionSlowStatus:(id)a3;
- (id)loseTrustOperation:(id)a3;
- (id)participateInFetch:(id)a3;
- (id)performInitializedOperation;
- (id)policyDependentViewStateForName:(id)a3 error:(id *)a4;
- (id)policyDependentViewStateForName:(id)a3 timeout:(unint64_t)a4 error:(id *)a5;
- (id)resultsOfNextProcessIncomingQueueOperation;
- (id)resyncLocal;
- (id)resyncWithCloud;
- (id)rpcFetchAndProcessIncomingQueue:(id)a3 because:(id)a4 errorOnClassAFailure:(BOOL)a5;
- (id)rpcFetchBecause:(id)a3;
- (id)rpcProcessIncomingQueue:(id)a3 errorOnClassAFailure:(BOOL)a4;
- (id)rpcProcessOutgoingQueue:(id)a3 operationGroup:(id)a4;
- (id)rpcResetCloudKit:(id)a3 reply:(id)a4;
- (id)rpcResetLocal:(id)a3 reply:(id)a4;
- (id)rpcWaitForPriorityViewProcessing;
- (id)tlkMissingOperation:(id)a3;
- (id)updateDeviceState:(BOOL)a3 waitForKeyHierarchyInitialization:(unint64_t)a4 ckoperationGroup:(id)a5;
- (id)viewStateForName:(id)a3;
- (id)viewsForPeerID:(id)a3 error:(id *)a4;
- (id)viewsInState:(id)a3;
- (id)viewsRequiringTLKUpload;
- (id)zoneIDForViewHint:(id)a3 pcsShortcut:(BOOL)a4 error:(id *)a5;
- (int64_t)accountStatus;
- (int64_t)accountStatusFromCKAccountInfo:(id)a3;
- (int64_t)trustStatus;
- (void)_onqueuePokeKeyStateMachine;
- (void)_onqueuePrioritizePriorityViews;
- (void)_onqueueProcessOutgoingQueue:(id)a3 priorityRush:(BOOL)a4;
- (void)beginCloudKitOperation;
- (void)beginTrustedOperation:(id)a3 suggestTLKUpload:(id)a4 requestPolicyCheck:(id)a5;
- (void)cancelAllOperations;
- (void)cancelPendingOperations;
- (void)changesFetched:(id)a3 deletedRecordIDs:(id)a4 zoneID:(id)a5 newChangeToken:(id)a6 moreComing:(BOOL)a7 resync:(BOOL)a8;
- (void)cloudkitAccountStateChange:(id)a3 to:(id)a4;
- (void)decryptCurrentItems:(id)a3 cache:(id)a4 complete:(id)a5;
- (void)decryptPCSIdentities:(id)a3 cache:(id)a4 complete:(id)a5;
- (void)dispatchSyncWithReadOnlySQLTransaction:(id)a3;
- (void)dispatchSyncWithSQLTransaction:(id)a3;
- (void)endTrustedOperation;
- (void)fetchCloudKitExternallyManagedViewKeyHierarchy:(id)a3 reply:(id)a4;
- (void)fetchExternallyManagedViewKeyHierarchy:(id)a3 forceFetch:(BOOL)a4 reply:(id)a5;
- (void)fetchPCSIdentityOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5;
- (void)getCurrentItemForAccessGroup:(id)a3 identifier:(id)a4 viewHint:(id)a5 fetchCloudValue:(BOOL)a6 complete:(id)a7;
- (void)getCurrentItemOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5;
- (void)halt;
- (void)handleCKLogin;
- (void)handleCKLogout;
- (void)handleKeychainEventDbConnection:(__OpaqueSecDbConnection *)a3 source:(unint64_t)a4 added:(SecDbItem *)a5 deleted:(SecDbItem *)a6 rateLimiter:(id)a7;
- (void)keyStateMachineRequestProcess;
- (void)loadKeys:(id)a3 reply:(id)a4;
- (void)modifyTLKSharesForExternallyManagedView:(id)a3 adding:(id)a4 deleting:(id)a5 reply:(id)a6;
- (void)notifyForItem:(SecDbItem *)a3;
- (void)notifyPasswordsOrPCSChangedForAddedItem:(SecDbItem *)a3 modified:(SecDbItem *)a4 deleted:(SecDbItem *)a5;
- (void)onqueueCreatePriorityViewsProcessedWatcher;
- (void)pcsMirrorKeysForServices:(id)a3 reply:(id)a4;
- (void)proposeTLKForExternallyManagedView:(id)a3 proposedTLK:(id)a4 wrappedOldTLK:(id)a5 tlkShares:(id)a6 reply:(id)a7;
- (void)receiveTLKUploadRecords:(id)a3;
- (void)resetExternallyManagedCloudKitView:(id)a3 reply:(id)a4;
- (void)rpcStatus:(id)a3 fast:(BOOL)a4 waitForNonTransientState:(unint64_t)a5 reply:(id)a6;
- (void)scanLocalItems;
- (void)scheduleOperation:(id)a3;
- (void)selfPeerChanged:(id)a3;
- (void)sendMetricForFirstManateeAccess;
- (void)setAccountLoggedInDependency:(id)a3;
- (void)setAccountStateKnown:(id)a3;
- (void)setAccountStatus:(int64_t)a3;
- (void)setAccountTracker:(id)a3;
- (void)setAccountsAdapter:(id)a3;
- (void)setCurrentItemForAccessGroup:(id)a3 hash:(id)a4 accessGroup:(id)a5 identifier:(id)a6 viewHint:(id)a7 replacing:(id)a8 hash:(id)a9 complete:(id)a10;
- (void)setCurrentTrustStates:(id)a3;
- (void)setCuttlefishAdapter:(id)a3;
- (void)setDatabaseProvider:(id)a3;
- (void)setFirstManateeKeyFetched:(BOOL)a3;
- (void)setHalted:(BOOL)a3;
- (void)setHavoc:(BOOL)a3;
- (void)setHoldIncomingQueueOperation:(id)a3;
- (void)setHoldLocalSynchronizeOperation:(id)a3;
- (void)setHoldOutgoingQueueOperation:(id)a3;
- (void)setInitiatedLocalScan:(BOOL)a3;
- (void)setItemModificationsBeforePolicyLoaded:(BOOL)a3;
- (void)setKeyStateFullRefetchRequested:(BOOL)a3;
- (void)setKeyStateMachineRefetched:(BOOL)a3;
- (void)setLastFixupOperation:(id)a3;
- (void)setLastIncomingQueueOperation:(id)a3;
- (void)setLastNewTLKOperation:(id)a3;
- (void)setLastOutgoingQueueOperation:(id)a3;
- (void)setLastProcessReceivedKeysOperation:(id)a3;
- (void)setLastReencryptOutgoingItemsOperation:(id)a3;
- (void)setLastSynchronizeOperation:(id)a3;
- (void)setLockStateTracker:(id)a3;
- (void)setLoggedIn:(id)a3;
- (void)setLoggedOut:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setOutgoingQueueOperationScheduler:(id)a3;
- (void)setOutgoingQueueOperations:(id)a3;
- (void)setOutgoingQueuePriorityOperationScheduler:(id)a3;
- (void)setPersonaAdapter:(id)a3;
- (void)setPolicyLoaded:(id)a3;
- (void)setPriorityViewsProcessed:(id)a3;
- (void)setResultsOfNextIncomingQueueOperationOperation:(id)a3;
- (void)setResyncRecordsSeen:(id)a3;
- (void)setSuggestTLKUpload:(id)a3;
- (void)setSyncingViewsAllowList:(id)a3;
- (void)setTrustStatus:(int64_t)a3;
- (void)setTrustStatusKnown:(id)a3;
- (void)setViewAllowList:(id)a3;
- (void)setZoneChangeFetcher:(id)a3;
- (void)testDropPolicy;
- (void)toggleHavoc:(id)a3;
- (void)trustedPeerSetChanged:(id)a3;
- (void)unsetCurrentItemsForAccessGroup:(id)a3 identifiers:(id)a4 viewHint:(id)a5 complete:(id)a6;
- (void)waitForOperationsOfClass:(Class)a3;
- (void)xpc24HrNotification;
@end

@implementation CKKSKeychainView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewAllowList, 0);
  objc_storeStrong((id *)&self->_currentTrustStates, 0);
  objc_storeStrong((id *)&self->_accountLoggedInDependency, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_resyncRecordsSeen, 0);
  objc_storeStrong((id *)&self->_outgoingQueueOperations, 0);
  objc_storeStrong((id *)&self->_resultsOfNextIncomingQueueOperationOperation, 0);
  objc_storeStrong((id *)&self->_priorityViewsProcessed, 0);
  objc_storeStrong((id *)&self->_policyLoaded, 0);
  objc_storeStrong((id *)&self->_operationDependencies, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_holdLocalSynchronizeOperation, 0);
  objc_storeStrong((id *)&self->_holdIncomingQueueOperation, 0);
  objc_storeStrong((id *)&self->_holdOutgoingQueueOperation, 0);
  objc_storeStrong((id *)&self->_lastFixupOperation, 0);
  objc_storeStrong((id *)&self->_lastSynchronizeOperation, 0);
  objc_storeStrong((id *)&self->_lastReencryptOutgoingItemsOperation, 0);
  objc_storeStrong((id *)&self->_lastProcessReceivedKeysOperation, 0);
  objc_storeStrong((id *)&self->_lastOutgoingQueueOperation, 0);
  objc_storeStrong((id *)&self->_lastNewTLKOperation, 0);
  objc_storeStrong((id *)&self->_lastIncomingQueueOperation, 0);
  objc_storeStrong((id *)&self->_outgoingQueuePriorityOperationScheduler, 0);
  objc_storeStrong((id *)&self->_outgoingQueueOperationScheduler, 0);
  objc_storeStrong((id *)&self->_suggestTLKUpload, 0);
  objc_storeStrong((id *)&self->_zoneChangeFetcher, 0);
  objc_storeStrong((id *)&self->_cuttlefishAdapter, 0);
  objc_storeStrong((id *)&self->_accountsAdapter, 0);
  objc_storeStrong((id *)&self->_personaAdapter, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_trustStatusKnown, 0);
  objc_storeStrong((id *)&self->_accountStateKnown, 0);
  objc_storeStrong((id *)&self->_loggedOut, 0);
  objc_storeStrong((id *)&self->_loggedIn, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cloudKitClassDependencies, 0);
  objc_storeStrong((id *)&self->_reachabilityTracker, 0);
  objc_storeStrong((id *)&self->_accountTracker, 0);

  objc_storeStrong((id *)&self->_container, 0);
}

- (void)setHavoc:(BOOL)a3
{
  self->_havoc = a3;
}

- (BOOL)havoc
{
  return self->_havoc;
}

- (void)setViewAllowList:(id)a3
{
}

- (NSSet)viewAllowList
{
  return (NSSet *)objc_getProperty(self, a2, 344, 1);
}

- (void)setCurrentTrustStates:(id)a3
{
}

- (NSArray)currentTrustStates
{
  return (NSArray *)objc_getProperty(self, a2, 336, 1);
}

- (void)setHalted:(BOOL)a3
{
  self->_halted = a3;
}

- (BOOL)halted
{
  return self->_halted;
}

- (void)setAccountLoggedInDependency:(id)a3
{
}

- (CKKSResultOperation)accountLoggedInDependency
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 328, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 320, 1);
}

- (void)setDatabaseProvider:(id)a3
{
}

- (CKKSSecDbAdapter)databaseProvider
{
  return (CKKSSecDbAdapter *)objc_getProperty(self, a2, 312, 1);
}

- (void)setResyncRecordsSeen:(id)a3
{
}

- (NSMutableSet)resyncRecordsSeen
{
  return (NSMutableSet *)objc_getProperty(self, a2, 304, 1);
}

- (void)setOutgoingQueueOperations:(id)a3
{
}

- (NSHashTable)outgoingQueueOperations
{
  return (NSHashTable *)objc_getProperty(self, a2, 296, 1);
}

- (void)setResultsOfNextIncomingQueueOperationOperation:(id)a3
{
}

- (CKKSResultOperation)resultsOfNextIncomingQueueOperationOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 288, 1);
}

- (void)setItemModificationsBeforePolicyLoaded:(BOOL)a3
{
  self->_itemModificationsBeforePolicyLoaded = a3;
}

- (BOOL)itemModificationsBeforePolicyLoaded
{
  return self->_itemModificationsBeforePolicyLoaded;
}

- (void)setPriorityViewsProcessed:(id)a3
{
}

- (OctagonStateMultiStateArrivalWatcher)priorityViewsProcessed
{
  return (OctagonStateMultiStateArrivalWatcher *)objc_getProperty(self, a2, 280, 1);
}

- (void)setPolicyLoaded:(id)a3
{
}

- (CKKSCondition)policyLoaded
{
  return (CKKSCondition *)objc_getProperty(self, a2, 272, 1);
}

- (CKKSOperationDependencies)operationDependencies
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 264, 1);
}

- (void)setInitiatedLocalScan:(BOOL)a3
{
  self->_initiatedLocalScan = a3;
}

- (BOOL)initiatedLocalScan
{
  return self->_initiatedLocalScan;
}

- (NSString)zoneName
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setHoldLocalSynchronizeOperation:(id)a3
{
}

- (NSOperation)holdLocalSynchronizeOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 248, 1);
}

- (void)setHoldIncomingQueueOperation:(id)a3
{
}

- (NSOperation)holdIncomingQueueOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 240, 1);
}

- (void)setHoldOutgoingQueueOperation:(id)a3
{
}

- (NSOperation)holdOutgoingQueueOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 232, 1);
}

- (void)setLastFixupOperation:(id)a3
{
}

- (CKKSResultOperation)lastFixupOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 224, 1);
}

- (void)setLastSynchronizeOperation:(id)a3
{
}

- (CKKSSynchronizeOperation)lastSynchronizeOperation
{
  return (CKKSSynchronizeOperation *)objc_getProperty(self, a2, 216, 1);
}

- (void)setLastReencryptOutgoingItemsOperation:(id)a3
{
}

- (CKKSReencryptOutgoingItemsOperation)lastReencryptOutgoingItemsOperation
{
  return (CKKSReencryptOutgoingItemsOperation *)objc_getProperty(self, a2, 208, 1);
}

- (void)setLastProcessReceivedKeysOperation:(id)a3
{
}

- (CKKSProcessReceivedKeysOperation)lastProcessReceivedKeysOperation
{
  return (CKKSProcessReceivedKeysOperation *)objc_getProperty(self, a2, 200, 1);
}

- (void)setLastOutgoingQueueOperation:(id)a3
{
}

- (CKKSOutgoingQueueOperation)lastOutgoingQueueOperation
{
  return (CKKSOutgoingQueueOperation *)objc_getProperty(self, a2, 192, 1);
}

- (void)setLastNewTLKOperation:(id)a3
{
}

- (CKKSNewTLKOperation)lastNewTLKOperation
{
  return (CKKSNewTLKOperation *)objc_getProperty(self, a2, 184, 1);
}

- (void)setLastIncomingQueueOperation:(id)a3
{
}

- (CKKSIncomingQueueOperation)lastIncomingQueueOperation
{
  return (CKKSIncomingQueueOperation *)objc_getProperty(self, a2, 176, 1);
}

- (void)setOutgoingQueuePriorityOperationScheduler:(id)a3
{
}

- (CKKSNearFutureScheduler)outgoingQueuePriorityOperationScheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 168, 1);
}

- (void)setOutgoingQueueOperationScheduler:(id)a3
{
}

- (CKKSNearFutureScheduler)outgoingQueueOperationScheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 160, 1);
}

- (void)setSuggestTLKUpload:(id)a3
{
}

- (CKKSNearFutureScheduler)suggestTLKUpload
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 152, 1);
}

- (void)setZoneChangeFetcher:(id)a3
{
}

- (CKKSZoneChangeFetcher)zoneChangeFetcher
{
  return (CKKSZoneChangeFetcher *)objc_getProperty(self, a2, 144, 1);
}

- (void)setCuttlefishAdapter:(id)a3
{
}

- (CKKSCuttlefishAdapterProtocol)cuttlefishAdapter
{
  return (CKKSCuttlefishAdapterProtocol *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAccountsAdapter:(id)a3
{
}

- (OTAccountsAdapter)accountsAdapter
{
  return (OTAccountsAdapter *)objc_getProperty(self, a2, 128, 1);
}

- (void)setFirstManateeKeyFetched:(BOOL)a3
{
  self->_firstManateeKeyFetched = a3;
}

- (BOOL)firstManateeKeyFetched
{
  return self->_firstManateeKeyFetched;
}

- (void)setKeyStateFullRefetchRequested:(BOOL)a3
{
  self->_keyStateFullRefetchRequested = a3;
}

- (BOOL)keyStateFullRefetchRequested
{
  return self->_keyStateFullRefetchRequested;
}

- (void)setKeyStateMachineRefetched:(BOOL)a3
{
  self->_keyStateMachineRefetched = a3;
}

- (BOOL)keyStateMachineRefetched
{
  return self->_keyStateMachineRefetched;
}

- (void)setPersonaAdapter:(id)a3
{
}

- (OTPersonaAdapter)personaAdapter
{
  return (OTPersonaAdapter *)objc_getProperty(self, a2, 120, 1);
}

- (OctagonStateMachine)stateMachine
{
  return (OctagonStateMachine *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLockStateTracker:(id)a3
{
}

- (CKKSLockStateTracker)lockStateTracker
{
  return (CKKSLockStateTracker *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTrustStatusKnown:(id)a3
{
}

- (CKKSCondition)trustStatusKnown
{
  return (CKKSCondition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTrustStatus:(int64_t)a3
{
  self->_trustStatus = a3;
}

- (int64_t)trustStatus
{
  return self->_trustStatus;
}

- (void)setAccountStateKnown:(id)a3
{
}

- (CKKSCondition)accountStateKnown
{
  return (CKKSCondition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLoggedOut:(id)a3
{
}

- (CKKSCondition)loggedOut
{
  return (CKKSCondition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLoggedIn:(id)a3
{
}

- (CKKSCondition)loggedIn
{
  return (CKKSCondition *)objc_getProperty(self, a2, 64, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (CKKSCloudKitClassDependencies)cloudKitClassDependencies
{
  return (CKKSCloudKitClassDependencies *)objc_getProperty(self, a2, 48, 1);
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return (CKKSReachabilityTracker *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAccountTracker:(id)a3
{
}

- (CKKSAccountStateTracker)accountTracker
{
  return (CKKSAccountStateTracker *)objc_getProperty(self, a2, 32, 1);
}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccountStatus:(int64_t)a3
{
  self->_accountStatus = a3;
}

- (int64_t)accountStatus
{
  return self->_accountStatus;
}

- (id)fastStatus:(id)a3 zoneStateEntry:(id)a4
{
  id v5 = a3;
  v26[0] = @"view";
  id v6 = a4;
  v7 = [v5 zoneName];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = +[NSNull null];
  }
  v10 = v9;

  v27[0] = v10;
  v26[1] = @"zoneCreated";
  if ([v6 ckzonecreated]) {
    CFStringRef v11 = @"yes";
  }
  else {
    CFStringRef v11 = @"no";
  }
  v27[1] = v11;
  v26[2] = @"zoneSubscribed";
  unsigned int v12 = [v6 ckzonesubscribed];

  if (v12) {
    CFStringRef v13 = @"yes";
  }
  else {
    CFStringRef v13 = @"no";
  }
  v27[2] = v13;
  v26[3] = @"keystate";
  v14 = [v5 viewKeyHierarchyState];
  v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = +[NSNull null];
  }
  v17 = v16;

  v27[3] = v17;
  v26[4] = @"ckksManaged";
  if ([v5 ckksManagedView]) {
    CFStringRef v18 = @"yes";
  }
  else {
    CFStringRef v18 = @"no";
  }
  v27[4] = v18;
  v26[5] = @"statusError";
  v19 = +[NSNull null];
  v27[5] = v19;
  v26[6] = @"launchSequence";
  v20 = [v5 launch];
  v21 = [v20 eventsByTime];

  if (v21)
  {
    id v22 = v21;
  }
  else
  {
    id v22 = +[NSNull null];
  }
  v23 = v22;

  v27[6] = v23;
  v24 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:7];

  return v24;
}

- (id)intransactionSlowStatus:(id)a3
{
  id v3 = a3;
  v4 = [v3 zoneID];
  id v5 = [v3 contextID];
  id v6 = +[CKKSCurrentKeySet loadForZone:v4 contextID:v5];

  v7 = [v6 error];

  if (v7)
  {
    v8 = [v3 zoneID];
    id v9 = [v8 zoneName];
    v10 = sub_1000CD884(@"ckks", v9);

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v11 = [v6 error];
      *(_DWORD *)buf = 138412290;
      v146 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "error loading keyset: %@", buf, 0xCu);
    }
  }
  id v12 = objc_alloc_init((Class)NSMutableArray);
  id v124 = objc_alloc_init((Class)NSMutableArray);
  CFStringRef v13 = [v3 zoneID];
  id v140 = 0;
  v14 = +[CKKSDeviceStateEntry allInZone:v13 error:&v140];
  id v15 = v140;

  v138[0] = _NSConcreteStackBlock;
  v138[1] = 3221225472;
  v138[2] = sub_100176700;
  v138[3] = &unk_100305AB0;
  id v128 = v12;
  id v139 = v128;
  [v14 enumerateObjectsUsingBlock:v138];
  v129 = v6;
  id v16 = [v6 currentTLKPointer];
  v17 = [v16 currentKeyUUID];
  CFStringRef v18 = [v3 contextID];
  v19 = [v3 zoneID];
  id v137 = v15;
  v20 = +[CKKSTLKShareRecord allForUUID:v17 contextID:v18 zoneID:v19 error:&v137];
  id v21 = v137;

  v135[0] = _NSConcreteStackBlock;
  v135[1] = 3221225472;
  v135[2] = sub_100176758;
  v135[3] = &unk_100305AB0;
  id v22 = v124;
  id v136 = v22;
  [v20 enumerateObjectsUsingBlock:v135];

  if ([v3 ckksManagedView])
  {
    v143[0] = @"statusError";
    v23 = [v21 description];
    v24 = v23;
    v25 = v21;
    if (v23)
    {
      id v26 = v23;
    }
    else
    {
      id v26 = +[NSNull null];
    }
    id v31 = v26;

    context = v31;
    v144[0] = v31;
    v143[1] = @"oqe";
    v32 = [(CKKSKeychainView *)self operationDependencies];
    v33 = [v32 contextID];
    v34 = [v3 zoneID];
    id v134 = v25;
    v35 = +[CKKSOutgoingQueueEntry countsByStateWithContextID:v33 zoneID:v34 error:&v134];
    id v36 = v134;

    if (v35)
    {
      id v37 = v35;
    }
    else
    {
      id v37 = +[NSNull null];
    }
    id v43 = v37;

    v125 = v43;
    v144[1] = v43;
    v143[2] = @"iqe";
    v44 = [(CKKSKeychainView *)self operationDependencies];
    v45 = [v44 contextID];
    v46 = [v3 zoneID];
    id v133 = v36;
    v47 = +[CKKSIncomingQueueEntry countsByStateWithContextID:v45 zoneID:v46 error:&v133];
    id v48 = v133;

    if (v47)
    {
      id v49 = v47;
    }
    else
    {
      id v49 = +[NSNull null];
    }
    id v54 = v49;

    v122 = v54;
    v144[2] = v54;
    v143[3] = @"ckmirror";
    v55 = [(CKKSKeychainView *)self operationDependencies];
    v56 = [v55 contextID];
    v57 = [v3 zoneID];
    id v132 = v48;
    v58 = +[CKKSMirrorEntry countsByParentKeyWithContextID:v56 zoneID:v57 error:&v132];
    id v59 = v132;

    if (v58)
    {
      id v60 = v58;
    }
    else
    {
      id v60 = +[NSNull null];
    }
    id v65 = v60;

    v144[3] = v65;
    v143[4] = @"devicestates";
    id v66 = v128;
    v67 = v66;
    if (v66)
    {
      id v68 = v66;
    }
    else
    {
      id v68 = +[NSNull null];
    }
    id v71 = v68;

    v144[4] = v71;
    v143[5] = @"tlkshares";
    id v72 = v22;
    v73 = v72;
    v120 = v71;
    v121 = v65;
    if (v72)
    {
      id v74 = v72;
    }
    else
    {
      id v74 = +[NSNull null];
    }
    id v75 = v74;

    v119 = v75;
    v144[5] = v75;
    v143[6] = @"keys";
    v76 = [(CKKSKeychainView *)self operationDependencies];
    v77 = [v76 contextID];
    v78 = [v3 zoneID];
    id v131 = v59;
    v79 = +[CKKSKey countsByClassWithContextID:v77 zoneID:v78 error:&v131];
    id v80 = v131;

    if (v79)
    {
      id v81 = v79;
    }
    else
    {
      id v81 = +[NSNull null];
    }
    id v82 = v81;

    v118 = v82;
    v144[6] = v82;
    v143[7] = @"currentTLK";
    v83 = [v129 tlk];
    v84 = [v83 uuid];

    if (v84)
    {
      id v85 = v84;
    }
    else
    {
      id v85 = +[NSNull null];
    }
    id v86 = v85;

    v117 = v86;
    v144[7] = v86;
    v143[8] = @"currentClassA";
    v87 = [v129 classA];
    v88 = [v87 uuid];

    if (v88)
    {
      id v89 = v88;
    }
    else
    {
      id v89 = +[NSNull null];
    }
    id v90 = v89;

    v116 = v90;
    v144[8] = v90;
    v143[9] = @"currentClassC";
    v91 = [v129 classC];
    v92 = [v91 uuid];

    if (v92)
    {
      id v93 = v92;
    }
    else
    {
      id v93 = +[NSNull null];
    }
    id v94 = v93;

    v115 = v94;
    v144[9] = v94;
    v143[10] = @"currentTLKPtr";
    v95 = [v129 currentTLKPointer];
    v96 = [v95 currentKeyUUID];

    if (v96)
    {
      id v97 = v96;
    }
    else
    {
      id v97 = +[NSNull null];
    }
    v98 = v97;

    v144[10] = v98;
    v143[11] = @"currentClassAPtr";
    v99 = [v129 currentClassAPointer];
    v100 = [v99 currentKeyUUID];

    if (v100)
    {
      id v101 = v100;
    }
    else
    {
      id v101 = +[NSNull null];
    }
    v102 = v101;

    v144[11] = v102;
    v143[12] = @"currentClassCPtr";
    v103 = [v129 currentClassCPointer];
    v104 = [v103 currentKeyUUID];

    id v123 = v80;
    id v105 = v22;
    if (v104)
    {
      id v106 = v104;
    }
    else
    {
      id v106 = +[NSNull null];
    }
    v107 = v106;

    v144[12] = v107;
    v143[13] = @"itemsyncing";
    v108 = [(CKKSKeychainView *)self operationDependencies];
    v109 = [v108 syncingPolicy];
    v110 = [v3 zoneID];
    v111 = [v110 zoneName];
    unsigned int v112 = [v109 isSyncingEnabledForView:v111];
    CFStringRef v113 = @"paused";
    if (v112) {
      CFStringRef v113 = @"enabled";
    }
    v144[13] = v113;
    v70 = +[NSDictionary dictionaryWithObjects:v144 forKeys:v143 count:14];

    v39 = v129;
    id v22 = v105;
    v50 = v125;
    v38 = context;
    v61 = v122;
    v29 = v123;
    v69 = v121;
  }
  else
  {
    v141[0] = @"statusError";
    v27 = [v21 description];
    v28 = v27;
    v29 = v21;
    if (v27)
    {
      id v30 = v27;
    }
    else
    {
      id v30 = +[NSNull null];
    }
    v38 = v30;
    v39 = v129;

    v142[0] = v38;
    v141[1] = @"tlkshares";
    id v40 = v22;
    v41 = v40;
    if (v40)
    {
      id v42 = v40;
    }
    else
    {
      id v42 = +[NSNull null];
    }
    v50 = v42;

    v142[1] = v50;
    v141[2] = @"currentTLK";
    v51 = [v129 tlk];
    v52 = [v51 uuid];

    if (v52)
    {
      id v53 = v52;
    }
    else
    {
      id v53 = +[NSNull null];
    }
    v61 = v53;

    v142[2] = v61;
    v141[3] = @"currentTLKPtr";
    v62 = [v129 currentTLKPointer];
    v63 = [v62 currentKeyUUID];

    if (v63)
    {
      id v64 = v63;
    }
    else
    {
      id v64 = +[NSNull null];
    }
    v69 = v64;

    v142[3] = v69;
    v70 = +[NSDictionary dictionaryWithObjects:v142 forKeys:v141 count:4];
  }

  return v70;
}

- (void)rpcStatus:(id)a3 fast:(BOOL)a4 waitForNonTransientState:(unint64_t)a5 reply:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  id v32 = 0;
  unsigned __int8 v12 = [(CKKSKeychainView *)self waitUntilReadyForRPCForOperation:@"status" fast:v8 errorOnNoCloudKitAccount:0 errorOnPolicyMissing:0 error:&v32];
  id v13 = v32;
  if (v12)
  {
    v14 = [OctagonStateMultiStateArrivalWatcher alloc];
    id v15 = [(CKKSKeychainView *)self queue];
    v33[0] = @"loggedout";
    v33[1] = @"ready";
    v33[2] = @"error";
    v33[3] = @"waitfortrust";
    v33[4] = @"halted";
    id v16 = +[NSArray arrayWithObjects:v33 count:5];
    v17 = +[NSSet setWithArray:v16];
    id v18 = [(OctagonStateMultiStateArrivalWatcher *)v14 initNamed:@"rpc-watcher" serialQueue:v15 states:v17];

    v19 = [(CKKSKeychainView *)self stateMachine];
    [v19 registerMultiStateArrivalWatcher:v18 startTimeout:a5];

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    v25 = sub_100176AA0;
    id v26 = &unk_100305A88;
    objc_copyWeak(&v29, &location);
    BOOL v30 = v8;
    id v27 = v10;
    id v28 = v11;
    v20 = +[CKKSResultOperation named:@"status-rpc" withBlock:&v23];
    id v21 = [v18 result:v23, v24, v25, v26];
    [v20 addDependency:v21];

    id v22 = [(CKKSKeychainView *)self operationQueue];
    [v22 addOperation:v20];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void, id))v11 + 2))(v11, 0, v13);
  }
}

- (id)viewsForPeerID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_100177A70;
  uint64_t v24 = sub_100177A80;
  id v25 = (id)0xAAAAAAAAAAAAAAAALL;
  id v25 = +[NSMutableArray array];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_100177A70;
  id v18 = sub_100177A80;
  id v19 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100177A88;
  v10[3] = &unk_100307528;
  v10[4] = self;
  unsigned __int8 v12 = &v14;
  id v7 = v6;
  id v11 = v7;
  id v13 = &v20;
  [(CKKSKeychainView *)self dispatchSyncWithReadOnlySQLTransaction:v10];
  if (a4) {
    *a4 = (id) v15[5];
  }
  id v8 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

- (BOOL)waitUntilReadyForRPCForOperation:(id)a3 fast:(BOOL)a4 errorOnNoCloudKitAccount:(BOOL)a5 errorOnPolicyMissing:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = +[CKKSViewManager manager];
  uint64_t v14 = [v13 completedSecCKKSInitialize];
  id v15 = [v14 wait:5000000000];

  if (v15)
  {
    uint64_t v16 = sub_1000CD884(@"ckks", 0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v28) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Haven't yet initialized SecDb; expect failure",
        (uint8_t *)&v28,
        2u);
    }
  }
  v17 = [(CKKSKeychainView *)self accountStateKnown];
  id v18 = v17;
  if (v10) {
    uint64_t v19 = 500000000;
  }
  else {
    uint64_t v19 = 2000000000;
  }
  [v17 wait:v19];

  int64_t v20 = [(CKKSKeychainView *)self accountStatus];
  if (v9 && v20 != 1)
  {
    if (v20)
    {
      CFStringRef v21 = @"User is not signed into iCloud.";
      uint64_t v22 = 10;
    }
    else
    {
      CFStringRef v21 = @"iCloud account status unknown.";
      uint64_t v22 = 64;
    }
    v23 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:v22 description:v21];
    id v25 = [(CKKSKeychainView *)self zoneName];
    id v26 = sub_1000CD884(@"ckkscurrent", v25);

    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412546;
      id v29 = v12;
      __int16 v30 = 2112;
      id v31 = v23;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Rejecting %@ RPC since we don't have an iCloud account: %@", (uint8_t *)&v28, 0x16u);
    }

    if (a7)
    {
      v23 = v23;
      BOOL v24 = 0;
      *a7 = v23;
LABEL_27:

      goto LABEL_28;
    }
LABEL_23:
    BOOL v24 = 0;
    goto LABEL_27;
  }
  if (v8)
  {
    if (![(CKKSKeychainView *)self waitForPolicy:5000000000 error:a7])
    {
      v23 = sub_1000CD884(@"ckks", 0);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        int v28 = 138412290;
        id v29 = v12;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Haven't yet received a policy; failing %@",
          (uint8_t *)&v28,
          0xCu);
      }
      goto LABEL_23;
    }
  }
  else if (![(CKKSKeychainView *)self waitForPolicy:500000000 error:0])
  {
    v23 = sub_1000CD884(@"ckks", 0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v28 = 138412290;
      id v29 = v12;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Haven't yet received a policy; expect failure later doing %@",
        (uint8_t *)&v28,
        0xCu);
    }
    BOOL v24 = 1;
    goto LABEL_27;
  }
  BOOL v24 = 1;
LABEL_28:

  return v24;
}

- (id)policyDependentViewStateForName:(id)a3 error:(id *)a4
{
  return [(CKKSKeychainView *)self policyDependentViewStateForName:a3 timeout:5000000000 error:a4];
}

- (id)policyDependentViewStateForName:(id)a3 timeout:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (![(CKKSKeychainView *)self waitForPolicy:a4 error:a5])
  {
    a5 = 0;
    goto LABEL_12;
  }
  uint64_t v20 = 0;
  CFStringRef v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_100177A70;
  BOOL v24 = sub_100177A80;
  id v25 = 0;
  BOOL v9 = [(CKKSKeychainView *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100178410;
  block[3] = &unk_100306E50;
  block[4] = self;
  id v10 = v8;
  id v18 = v10;
  uint64_t v19 = &v20;
  dispatch_sync(v9, block);

  id v11 = (void *)v21[5];
  if (!v11)
  {
    if (!a5) {
      goto LABEL_11;
    }
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    id v12 = +[NSString stringWithFormat:@"No syncing view for '%@'", v10];
    id v27 = v12;
    id v13 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    *a5 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:11 userInfo:v13];

LABEL_10:
    a5 = 0;
    goto LABEL_11;
  }
  if (([v11 ckksManagedView] & 1) == 0)
  {
    if (!a5) {
      goto LABEL_11;
    }
    uint64_t v14 = [(id)v21[5] zoneName];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Cannot get view %@; is externally managed",
    id v15 = v14);
    *a5 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:63 description:v15];

    goto LABEL_10;
  }
  a5 = (id *)(id)v21[5];
LABEL_11:

  _Block_object_dispose(&v20, 8);
LABEL_12:

  return a5;
}

- (BOOL)waitForPolicy:(unint64_t)a3 error:(id *)a4
{
  id v6 = [(CKKSKeychainView *)self policyLoaded];
  id v7 = [v6 wait:a3];

  if (v7)
  {
    id v8 = sub_1000CD884(@"ckks", 0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Haven't yet received a syncing policy", v12, 2u);
    }

    if (a4)
    {
      NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
      BOOL v9 = +[NSString stringWithFormat:@"CKKS syncing policy not yet loaded"];
      uint64_t v14 = v9;
      id v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      *a4 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:56 userInfo:v10];
    }
  }
  return v7 == 0;
}

- (void)halt
{
  id v3 = [(CKKSKeychainView *)self stateMachine];
  [v3 haltOperation];

  v4 = [(CKKSKeychainView *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100178960;
  block[3] = &unk_100308558;
  block[4] = self;
  dispatch_sync(v4, block);

  [(CKKSKeychainView *)self cancelAllOperations];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = [(CKKSKeychainView *)self operationQueue];
  id v6 = [v5 operations];

  id v7 = [v6 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v11 isExecuting]) {
          [v11 waitUntilFinished];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v8);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = [(CKKSKeychainView *)self operationDependencies];
  NSErrorUserInfoKey v13 = [v12 allViews];

  id v14 = [v13 countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v22 + 1) + 8 * (void)j);
        uint64_t v19 = [v18 notifyViewChangedScheduler];
        [v19 cancel];

        uint64_t v20 = [v18 notifyViewReadyScheduler];
        [v20 cancel];
      }
      id v15 = [v13 countByEnumeratingWithState:&v22 objects:v31 count:16];
    }
    while (v15);
  }

  CFStringRef v21 = [(CKKSKeychainView *)self zoneChangeFetcher];
  [v21 halt];
}

- (void)cancelAllOperations
{
  [(CKKSKeychainView *)self cancelPendingOperations];
  id v3 = [(CKKSKeychainView *)self operationQueue];
  [v3 cancelAllOperations];
}

- (void)cancelPendingOperations
{
  id v3 = [(CKKSKeychainView *)self outgoingQueueOperations];
  objc_sync_enter(v3);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = [(CKKSKeychainView *)self outgoingQueueOperations];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) cancel];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  id v8 = [(CKKSKeychainView *)self outgoingQueueOperations];
  [v8 removeAllObjects];

  objc_sync_exit(v3);
}

- (void)waitForOperationsOfClass:(Class)a3
{
  id v3 = [(CKKSKeychainView *)self operationQueue];
  v4 = [v3 operations];
  id v5 = [v4 copy];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_isKindOfClass()) {
          [v11 waitUntilFinished];
        }
        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (BOOL)waitUntilAllOperationsAreFinished
{
  v2 = [(CKKSKeychainView *)self stateMachine];
  id v3 = [v2 paused];
  BOOL v4 = [v3 wait:189000000000] == 0;

  return v4;
}

- (BOOL)scheduleOperationWithoutDependencies:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CKKSKeychainView *)self halted];
  if (v5)
  {
    id v6 = [(CKKSKeychainView *)self zoneName];
    id v7 = sub_1000CD884(@"ckkszone", v6);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "attempted to schedule an non-dependent operation on a halted zone, ignoring", v9, 2u);
    }
  }
  else
  {
    id v7 = [(CKKSKeychainView *)self operationQueue];
    [v7 addOperation:v4];
  }

  return v5 ^ 1;
}

- (void)scheduleOperation:(id)a3
{
  id v4 = a3;
  if ([(CKKSKeychainView *)self halted])
  {
    unsigned int v5 = [(CKKSKeychainView *)self zoneName];
    id v6 = sub_1000CD884(@"ckkszone", v5);

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "attempted to schedule an operation on a halted zone, ignoring", v8, 2u);
    }
  }
  else
  {
    id v7 = [(CKKSKeychainView *)self accountLoggedInDependency];
    [v4 addNullableDependency:v7];

    id v6 = [(CKKSKeychainView *)self operationQueue];
    [v6 addOperation:v4];
  }
}

- (BOOL)waitForKeyHierarchyReadiness
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = [(CKKSKeychainView *)self operationDependencies];
  id v3 = [v2 allCKKSManagedViews];

  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    char v7 = 1;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) keyHierarchyConditions];
        long long v10 = [v9 objectForKeyedSubscript:@"ready"];
        BOOL v11 = [v10 wait:300000000000] == 0;

        v7 &= v11;
      }
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)waitForFetchAndIncomingQueueProcessing
{
  id v3 = [(CKKSKeychainView *)self zoneChangeFetcher];
  id v4 = [v3 inflightFetch];

  if (v4) {
    [v4 waitUntilFinished];
  }
  id v5 = [(CKKSKeychainView *)self stateMachine];
  uint64_t v6 = [v5 flags];
  char v7 = [v6 conditionForFlagIfPresent:@"process_incoming_queue"];

  if (v7) {
    BOOL v8 = [v7 wait:117000000000] == 0;
  }
  else {
    BOOL v8 = 1;
  }
  uint64_t v9 = [(CKKSKeychainView *)self stateMachine];
  long long v10 = [v9 paused];
  if ([v10 wait:109000000000]) {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)outgoingQueueEmpty:(id *)a3
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100179190;
  v5[3] = &unk_100306F10;
  v5[4] = &v6;
  v5[5] = a3;
  [(CKKSKeychainView *)self dispatchSyncWithReadOnlySQLTransaction:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)trustedPeerSetChanged:(id)a3
{
  id v4 = [(CKKSKeychainView *)self zoneName];
  id v5 = sub_1000CD884(@"ckks", v4);

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)char v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Received update that the trust set has changed", v7, 2u);
  }

  uint64_t v6 = [(CKKSKeychainView *)self stateMachine];
  [v6 handleFlag:@"trusted_peers_changed"];
}

- (void)selfPeerChanged:(id)a3
{
  id v4 = [(CKKSKeychainView *)self zoneName];
  id v5 = sub_1000CD884(@"ckks", v4);

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Received update that our self identity has changed", v6, 2u);
  }

  [(CKKSKeychainView *)self keyStateMachineRequestProcess];
}

- (BOOL)shouldRetryAfterFetchError:(id)a3 zoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CKKSKeychainView *)self ckErrorOrPartialError:v6 isError:21 zoneID:v7])
  {
    uint64_t v8 = [v7 zoneName];
    char v9 = sub_1000CD884(@"ckks", v8);

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v20 = 138412290;
      id v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Received notice that our change token is out of date (for %@). Resetting local data...", (uint8_t *)&v20, 0xCu);
    }

    long long v10 = [(CKKSKeychainView *)self stateMachine];
    BOOL v11 = v10;
    CFStringRef v12 = @"ck_change_token_expired";
  }
  else
  {
    if (![(CKKSKeychainView *)self ckErrorOrPartialError:v6 isError:26 zoneID:v7])
    {
      v17 = [v6 domain];
      if ([v17 isEqualToString:CKErrorDomain])
      {
        id v18 = [v6 code];

        if (v18 == (id)5)
        {
          uint64_t v19 = [v7 zoneName];
          BOOL v11 = sub_1000CD884(@"ckks", v19);

          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v20) = 0;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Received notice that our container does not exist. Nothing to do.", (uint8_t *)&v20, 2u);
          }
          goto LABEL_10;
        }
      }
      else
      {
      }
      BOOL v15 = 1;
      goto LABEL_11;
    }
    long long v13 = [v7 zoneName];
    long long v14 = sub_1000CD884(@"ckks", v13);

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v20 = 138412290;
      id v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Received notice that our zone(%@) does not exist. Resetting local data.", (uint8_t *)&v20, 0xCu);
    }

    long long v10 = [(CKKSKeychainView *)self stateMachine];
    BOOL v11 = v10;
    CFStringRef v12 = @"ck_zone_missing";
  }
  [v10 handleFlag:v12];
LABEL_10:

  BOOL v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)ckErrorOrPartialError:(id)a3 isError:(int64_t)a4 zoneID:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 code] == (id)a4)
  {
    char v9 = [v7 domain];
    unsigned __int8 v10 = [v9 isEqualToString:CKErrorDomain];

    if (v10) {
      goto LABEL_3;
    }
  }
  if ([v7 code] != (id)2
    || ([v7 domain],
        CFStringRef v12 = objc_claimAutoreleasedReturnValue(),
        unsigned int v13 = [v12 isEqualToString:CKErrorDomain],
        v12,
        !v13))
  {
LABEL_10:
    BOOL v11 = 0;
    goto LABEL_11;
  }
  long long v14 = [v7 userInfo];
  BOOL v15 = [v14 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

  long long v16 = [v15 objectForKeyedSubscript:v8];
  if ([v16 code] != (id)a4)
  {

    goto LABEL_10;
  }
  v17 = [v16 domain];
  unsigned __int8 v18 = [v17 isEqualToString:CKErrorDomain];

  if ((v18 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_3:
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (void)changesFetched:(id)a3 deletedRecordIDs:(id)a4 zoneID:(id)a5 newChangeToken:(id)a6 moreComing:(BOOL)a7 resync:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  long long v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472;
  long long v29 = sub_100179918;
  __int16 v30 = &unk_100305A38;
  id v31 = self;
  id v18 = v16;
  id v32 = v18;
  id v19 = v14;
  id v33 = v19;
  BOOL v36 = a8;
  id v20 = v15;
  BOOL v37 = a7;
  id v34 = v20;
  id v35 = v17;
  id v21 = v17;
  [(CKKSKeychainView *)self dispatchSyncWithSQLTransaction:&v27];
  long long v22 = [(CKKSKeychainView *)self operationDependencies];
  long long v23 = [v18 zoneName];
  long long v24 = [v22 viewStateForName:v23];

  if ([v20 count])
  {
    long long v25 = [v24 notifyViewChangedScheduler];
    [v25 trigger];
  }
  if (([v24 ckksManagedView] & 1) == 0)
  {
    if ([v19 count] || objc_msgSend(v20, "count"))
    {
      long long v26 = [v24 notifyViewChangedScheduler];
      [v26 trigger];
    }
    if (!a7) {
      [v24 launchComplete];
    }
  }
}

- (id)participateInFetch:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  CFStringRef v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_100177A70;
  id v15 = sub_100177A80;
  id v16 = (CKKSCloudKitFetchRequest *)0xAAAAAAAAAAAAAAAALL;
  id v16 = objc_alloc_init(CKKSCloudKitFetchRequest);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10017AA68;
  v8[3] = &unk_100306E50;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  unsigned __int8 v10 = &v11;
  [(CKKSKeychainView *)self dispatchSyncWithReadOnlySQLTransaction:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (BOOL)_onQueueZoneIsReadyForFetching:(id)a3
{
  id v4 = a3;
  id v5 = [(CKKSKeychainView *)self queue];
  dispatch_assert_queue_V2(v5);

  if ((id)[(CKKSKeychainView *)self accountStatus] == (id)1)
  {
    id v6 = [(CKKSKeychainView *)self operationDependencies];
    id v7 = [v6 contextID];
    id v8 = [v4 zoneName];
    id v9 = +[CKKSZoneStateEntry contextID:v7 zoneName:v8];

    if ([v9 ckzonecreated])
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      unsigned __int8 v10 = [(CKKSKeychainView *)self operationDependencies];
      uint64_t v11 = [v10 views];

      id v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v28;
LABEL_5:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v27 + 1) + 8 * v15);
          id v17 = [v16 zoneName];
          id v18 = [v4 zoneName];
          unsigned __int8 v19 = [v17 isEqualToString:v18];

          if (v19) {
            break;
          }
          if (v13 == (id)++v15)
          {
            id v13 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
            if (v13) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
        long long v23 = v16;

        if (!v23) {
          goto LABEL_19;
        }
        BOOL v21 = 1;
        goto LABEL_23;
      }
LABEL_11:

LABEL_19:
      long long v24 = [v4 zoneName];
      long long v25 = sub_1000CD884(@"ckksfetch", v24);

      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Not participating in fetch: zone is not active", buf, 2u);
      }

      long long v23 = 0;
    }
    else
    {
      long long v22 = [v4 zoneName];
      long long v23 = sub_1000CD884(@"ckksfetch", v22);

      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Not participating in fetch: zone not created yet", buf, 2u);
      }
    }
    BOOL v21 = 0;
LABEL_23:

    goto LABEL_24;
  }
  id v20 = [(CKKSKeychainView *)self zoneName];
  id v9 = sub_1000CD884(@"ckksfetch", v20);

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not participating in fetch: not logged in", buf, 2u);
  }
  BOOL v21 = 0;
LABEL_24:

  return v21;
}

- (BOOL)zoneIsReadyForFetching:(id)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10017B0B8;
  v6[3] = &unk_100306E50;
  id v9 = &v10;
  id v7 = self;
  id v3 = a3;
  id v8 = v3;
  [(CKKSKeychainView *)v7 dispatchSyncWithReadOnlySQLTransaction:v6];
  char v4 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (void)_onqueuePrioritizePriorityViews
{
  id v3 = [(CKKSKeychainView *)self operationDependencies];
  char v4 = [v3 allPriorityViews];

  if ([v4 count])
  {
    id v5 = [(CKKSKeychainView *)self operationDependencies];
    [v5 limitOperationToPriorityViews];

    id v6 = [(CKKSKeychainView *)self zoneName];
    id v7 = sub_1000CD884(@"ckksviews", v6);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(CKKSKeychainView *)self operationDependencies];
      id v9 = [v8 views];
      *(_DWORD *)buf = 138412290;
      long long v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Restricting operation to priority views: %@", buf, 0xCu);
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v10 = [(CKKSKeychainView *)self operationDependencies];
    uint64_t v11 = [v10 allViews];

    id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          unsigned int v17 = [v16 priorityView];
          id v18 = [v16 launch];
          unsigned __int8 v19 = v18;
          if (v17) {
            CFStringRef v20 = @"priority-start";
          }
          else {
            CFStringRef v20 = @"priority-pause";
          }
          [v18 addEvent:v20];
        }
        id v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v13);
    }

    BOOL v21 = [(CKKSKeychainView *)self operationDependencies];
    long long v22 = [v21 overallLaunch];
    [v22 addEvent:@"priority-start"];
  }
}

- (id)viewStateForName:(id)a3
{
  id v4 = a3;
  id v5 = [(CKKSKeychainView *)self operationDependencies];
  id v6 = [v5 viewStateForName:v4];

  return v6;
}

- (void)testDropPolicy
{
  id v3 = [(CKKSKeychainView *)self operationDependencies];
  id v4 = +[NSSet set];
  [v3 applyNewSyncingPolicy:0 viewStates:v4];

  id v5 = objc_alloc_init(CKKSCondition);
  [(CKKSKeychainView *)self setPolicyLoaded:v5];
}

- (void)setSyncingViewsAllowList:(id)a3
{
}

- (id)createViewState:(id)a3 contextID:(id)a4 zoneIsNew:(BOOL)a5 priorityView:(BOOL)a6 ckksManagedView:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v25 = a5;
  BOOL v26 = a6;
  id v10 = a3;
  id v11 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v12 = [CKKSNearFutureScheduler alloc];
  id v13 = +[NSString stringWithFormat:@"ckks-%@-notify-scheduler", v10];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10017B748;
  v30[3] = &unk_100306AD0;
  objc_copyWeak(&v32, &location);
  id v14 = v10;
  id v31 = v14;
  uint64_t v15 = [(CKKSNearFutureScheduler *)v12 initWithName:v13 initialDelay:250000000 continuingDelay:1000000000 keepProcessAlive:1 dependencyDescriptionCode:1001 block:v30];

  id v16 = [CKKSNearFutureScheduler alloc];
  unsigned int v17 = +[NSString stringWithFormat:@"%@-ready-scheduler", v14];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10017B8B8;
  v27[3] = &unk_100306AD0;
  objc_copyWeak(&v29, &location);
  id v18 = v14;
  id v28 = v18;
  unsigned __int8 v19 = [(CKKSNearFutureScheduler *)v16 initWithName:v17 initialDelay:250000000 continuingDelay:120000000000 keepProcessAlive:1 dependencyDescriptionCode:1001 block:v27];

  CFStringRef v20 = [CKKSKeychainViewState alloc];
  id v21 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:v18 ownerName:CKCurrentUserDefaultName];
  long long v22 = [(CKKSKeychainViewState *)v20 initWithZoneID:v21 forContextID:v11 ckksManagedView:v7 priorityView:v26 notifyViewChangedScheduler:v15 notifyViewReadyScheduler:v19];

  if (v25)
  {
    long long v23 = [(CKKSKeychainViewState *)v22 launch];
    [v23 setFirstLaunch:1];
  }
  objc_destroyWeak(&v29);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  return v22;
}

- (void)onqueueCreatePriorityViewsProcessedWatcher
{
  id v3 = [OctagonStateMultiStateArrivalWatcher alloc];
  id v4 = [(CKKSKeychainView *)self queue];
  v15[0] = @"ready";
  v15[1] = @"handle_all_views";
  id v5 = +[NSArray arrayWithObjects:v15 count:2];
  id v6 = +[NSSet setWithArray:v5];
  v13[0] = @"loggedout";
  BOOL v7 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:10 description:@"CloudKit account not present"];
  v13[1] = @"error";
  v14[0] = v7;
  id v8 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:65 description:@"CKKS currently in error state"];
  v14[1] = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  id v10 = [(OctagonStateMultiStateArrivalWatcher *)v3 initNamed:@"wait-for-priority-view-processing" serialQueue:v4 states:v6 failStates:v9];
  [(CKKSKeychainView *)self setPriorityViewsProcessed:v10];

  id v11 = [(CKKSKeychainView *)self stateMachine];
  id v12 = [(CKKSKeychainView *)self priorityViewsProcessed];
  [v11 _onqueueRegisterMultiStateArrivalWatcher:v12 startTimeout:-1];
}

- (BOOL)setCurrentSyncingPolicy:(id)a3 policyIsFresh:(BOOL)a4
{
  BOOL v50 = a4;
  id v5 = a3;
  v51 = v5;
  if (v5)
  {
    id v49 = [v5 version];
    id v48 = +[NSString stringWithFormat:@"%llu", [v49 versionNumber]];
    id v6 = objc_alloc((Class)AAFAnalyticsEventSecurity);
    v68[0] = v48;
    v67[0] = kSecurityRTCFieldSyncingPolicy;
    v67[1] = kSecurityRTCFieldPolicyFreshness;
    BOOL v7 = +[NSNumber numberWithBool:v50];
    v68[1] = v7;
    v67[2] = kSecurityRTCFieldNumViews;
    id v8 = [v51 viewList];
    id v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 count]);
    v68[2] = v9;
    id v10 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:3];
    id v11 = [(CKKSKeychainView *)self operationDependencies];
    id v12 = [v11 activeAccount];
    id v13 = [v12 altDSID];
    id v14 = [(CKKSKeychainView *)self operationDependencies];
    id v15 = [v14 sendMetric];
    id v16 = [v6 initWithCKKSMetrics:v10 altDSID:v13 eventName:kSecurityRTCEventNameSyncingPolicySet testsAreEnabled:0 category:kSecurityRTCEventCategoryAccountDataAccessRecovery sendMetric:v15];

    unsigned int v17 = [v51 viewList];
    id v18 = sub_1000CD884(@"ckks-policy", 0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v19 = @"cached";
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v51;
      *(_WORD *)&buf[12] = 2112;
      if (v50) {
        CFStringRef v19 = @"fresh";
      }
      *(void *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 2112;
      id v66 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "New syncing policy: %@ (%@) views: %@", buf, 0x20u);
    }

    CFStringRef v20 = [(CKKSKeychainView *)self operationDependencies];
    id v21 = [v20 overallLaunch];
    [v21 addEvent:@"syncing-policy-set"];

    v64[0] = CKKSSEViewPTA;
    v64[1] = CKKSSEViewPTC;
    long long v22 = +[NSArray arrayWithObjects:v64 count:2];
    long long v23 = +[NSSet setWithArray:v22];

    long long v24 = [(CKKSKeychainView *)self viewAllowList];

    if (v24)
    {
      BOOL v25 = sub_1000CD884(@"ckks-policy", 0);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v26 = [(CKKSKeychainView *)self viewAllowList];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Intersecting view list with allow list: %@", buf, 0xCu);
      }
      id v27 = [v17 mutableCopy];
      id v28 = [(CKKSKeychainView *)self viewAllowList];
      [v27 intersectSet:v28];

      id v29 = v27;
      long long v30 = sub_1000CD884(@"ckks-policy", 0);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v29;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Final list: %@", buf, 0xCu);
      }

      id v31 = [v23 mutableCopy];
      id v32 = [(CKKSKeychainView *)self viewAllowList];
      [v31 intersectSet:v32];

      id v33 = v31;
      id v34 = sub_1000CD884(@"ckks-policy", 0);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v33;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Final list of externally-managed view names: %@", buf, 0xCu);
      }
    }
    else
    {
      id v29 = v17;
      id v33 = v23;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    LOBYTE(v66) = 0;
    uint64_t v60 = 0;
    v61 = &v60;
    uint64_t v62 = 0x2020000000;
    char v63 = 0;
    BOOL v37 = [(CKKSKeychainView *)self operationDependencies];
    v38 = [v37 databaseProvider];
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_10017C3C8;
    v53[3] = &unk_100305A10;
    v53[4] = self;
    id v39 = v29;
    id v54 = v39;
    id v55 = v51;
    id v40 = v33;
    id v56 = v40;
    v57 = &v60;
    v58 = buf;
    BOOL v59 = v50;
    [v38 dispatchSyncWithReadOnlySQLTransaction:v53];

    if (v50)
    {
      v41 = [(CKKSKeychainView *)self stateMachine];
      [v41 handleFlag:@"policy_fresh"];

      id v42 = [(CKKSKeychainView *)self stateMachine];
      [v42 handleFlag:@"process_incoming_queue"];
    }
    if ([(CKKSKeychainView *)self itemModificationsBeforePolicyLoaded])
    {
      id v43 = sub_1000CD884(@"ckks-policy", 0);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v52 = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Issuing scan suggestions to handle missed items", v52, 2u);
      }

      [(CKKSKeychainView *)self setItemModificationsBeforePolicyLoaded:0];
      v44 = [(CKKSKeychainView *)self stateMachine];
      [v44 handleFlag:@"dropped_items"];
    }
    v45 = +[CKKSViewManager manager];
    [v45 setupAnalytics];

    v46 = [(CKKSKeychainView *)self policyLoaded];
    [v46 fulfill];

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v16 success:1 error:0];
    if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
      BOOL v36 = 1;
    }
    else {
      BOOL v36 = *((unsigned char *)v61 + 24) != 0;
    }

    _Block_object_dispose(&v60, 8);
    _Block_object_dispose(buf, 8);

    id v35 = v49;
  }
  else
  {
    id v35 = sub_1000CD884(@"ckks-policy", 0);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Nil syncing policy presented; ignoring",
        buf,
        2u);
    }
    BOOL v36 = 0;
  }

  return v36;
}

- (BOOL)setCurrentSyncingPolicy:(id)a3
{
  return [(CKKSKeychainView *)self setCurrentSyncingPolicy:a3 policyIsFresh:0];
}

- (TPSyncingPolicy)syncingPolicy
{
  v2 = [(CKKSKeychainView *)self operationDependencies];
  id v3 = [v2 syncingPolicy];

  return (TPSyncingPolicy *)v3;
}

- (void)endTrustedOperation
{
  id v3 = objc_alloc((Class)AAFAnalyticsEventSecurity);
  id v4 = [(CKKSKeychainView *)self operationDependencies];
  id v5 = [v4 activeAccount];
  id v6 = [v5 altDSID];
  uint64_t v7 = kSecurityRTCEventNameTrustLoss;
  uint64_t v8 = kSecurityRTCEventCategoryAccountDataAccessRecovery;
  id v9 = [(CKKSKeychainView *)self operationDependencies];
  id v10 = [v3 initWithCKKSMetrics:&__NSDictionary0__struct altDSID:v6 eventName:v7 testsAreEnabled:0 category:v8 sendMetric:objc_msgSend(v9, "sendMetric")];

  id v11 = [(CKKSKeychainView *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017CF88;
  block[3] = &unk_100308558;
  block[4] = self;
  dispatch_sync(v11, block);

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v10 success:1 error:0];
}

- (void)beginTrustedOperation:(id)a3 suggestTLKUpload:(id)a4 requestPolicyCheck:(id)a5
{
  id v8 = a3;
  id v30 = a4;
  id v29 = a5;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v36;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v35 + 1) + 8 * (void)v12) registerForPeerChangeUpdates:self];
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v10);
  }
  id v28 = objc_alloc((Class)AAFAnalyticsEventSecurity);
  uint64_t v39 = kSecurityRTCFieldTrustStatus;
  int64_t v13 = [(CKKSKeychainView *)self trustStatus];
  id v14 = @"available";
  if (v13 == 3) {
    id v14 = @"no account";
  }
  if (!v13) {
    id v14 = @"unknown";
  }
  id v15 = v14;
  id v40 = v15;
  id v16 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
  unsigned int v17 = [(CKKSKeychainView *)self operationDependencies];
  id v18 = [v17 activeAccount];
  CFStringRef v19 = [v18 altDSID];
  uint64_t v20 = kSecurityRTCEventNameTrustGain;
  uint64_t v21 = kSecurityRTCEventCategoryAccountDataAccessRecovery;
  long long v22 = [(CKKSKeychainView *)self operationDependencies];
  id v23 = [v28 initWithCKKSMetrics:v16 altDSID:v19 eventName:v20 testsAreEnabled:0 category:v21 sendMetric:[v22 sendMetric]];

  long long v24 = [(CKKSKeychainView *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017D3AC;
  block[3] = &unk_1003059E8;
  block[4] = self;
  id v32 = v8;
  id v33 = v29;
  id v34 = v30;
  id v25 = v30;
  id v26 = v29;
  id v27 = v8;
  dispatch_sync(v24, block);

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v23 success:1 error:0];
}

- (void)handleCKLogout
{
  id v3 = [(CKKSKeychainView *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017D7E0;
  block[3] = &unk_100308558;
  block[4] = self;
  dispatch_sync(v3, block);

  id v4 = [(CKKSKeychainView *)self operationDependencies];
  id v5 = [v4 overallLaunch];
  [v5 addEvent:@"ck-account-logout"];

  id v6 = [(CKKSKeychainView *)self stateMachine];
  [v6 handleFlag:@"ck_account_logged_out"];

  uint64_t v7 = [(CKKSKeychainView *)self accountStateKnown];
  [v7 fulfill];
}

- (void)handleCKLogin
{
  id v3 = [(CKKSKeychainView *)self zoneName];
  id v4 = sub_1000CD884(@"ckks", v3);

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "received a notification of CK login", buf, 2u);
  }

  if (sub_1000B14D4())
  {
    id v5 = [(CKKSKeychainView *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10017DB80;
    block[3] = &unk_100308558;
    block[4] = self;
    dispatch_sync(v5, block);

    id v6 = [(CKKSKeychainView *)self operationDependencies];
    uint64_t v7 = [v6 overallLaunch];
    [v7 addEvent:@"ck-account-login"];

    id v8 = objc_alloc((Class)AAFAnalyticsEventSecurity);
    id v9 = [(CKKSKeychainView *)self operationDependencies];
    id v10 = [v9 activeAccount];
    uint64_t v11 = [v10 altDSID];
    uint64_t v12 = kSecurityRTCEventNameCKAccountLogin;
    uint64_t v13 = kSecurityRTCEventCategoryAccountDataAccessRecovery;
    id v14 = [(CKKSKeychainView *)self operationDependencies];
    id v15 = [v8 initWithCKKSMetrics:&__NSDictionary0__struct altDSID:v11 eventName:v12 testsAreEnabled:0 category:v13 sendMetric:[v14 sendMetric]];

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v15 success:1 error:0];
    id v16 = [(CKKSKeychainView *)self stateMachine];
    [v16 handleFlag:@"ck_account_logged_in"];

    unsigned int v17 = [(CKKSKeychainView *)self accountStateKnown];
    [v17 fulfill];
  }
  else
  {
    id v18 = [(CKKSKeychainView *)self zoneName];
    CFStringRef v19 = sub_1000CD884(@"ckks", v18);

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Skipping CloudKit initialization due to disabled CKKS", buf, 2u);
    }
  }
}

- (void)cloudkitAccountStateChange:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CKKSKeychainView *)self zoneName];
  id v9 = sub_1000CD884(@"ckkszone", v8);

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v26 = 138412546;
    *(void *)&v26[4] = v6;
    __int16 v27 = 2112;
    id v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received notification of CloudKit account status change, moving from %@ to %@", v26, 0x16u);
  }

  int64_t v10 = [(CKKSKeychainView *)self accountStatusFromCKAccountInfo:v6];
  int64_t v11 = [(CKKSKeychainView *)self accountStatusFromCKAccountInfo:v7];
  if (v10 == v11)
  {
    uint64_t v12 = [(CKKSKeychainView *)self zoneName];
    uint64_t v13 = sub_1000CD884(@"ckkszone", v12);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = +[CKKSAccountStateTracker stringFromAccountStatus:v10];
      *(_DWORD *)id v26 = 138412290;
      *(void *)&v26[4] = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Computed status of new CK account info is same as old status: %@", v26, 0xCu);
    }
    goto LABEL_22;
  }
  if (v11)
  {
    if (v11 != 3)
    {
      if (v11 == 1)
      {
        id v15 = [(CKKSKeychainView *)self zoneName];
        id v16 = sub_1000CD884(@"ckkszone", v15);

        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Logged into iCloud.", v26, 2u);
        }

        [(CKKSKeychainView *)self handleCKLogin];
        unsigned int v17 = [(CKKSKeychainView *)self accountLoggedInDependency];

        if (v17)
        {
          id v18 = [(CKKSKeychainView *)self operationQueue];
          CFStringRef v19 = [(CKKSKeychainView *)self accountLoggedInDependency];
          [v18 addOperation:v19];

          [(CKKSKeychainView *)self setAccountLoggedInDependency:0];
        }
      }
      goto LABEL_22;
    }
    id v23 = [(CKKSKeychainView *)self zoneName];
    uint64_t v21 = sub_1000CD884(@"ckkszone", v23);

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v26 = 0;
      long long v22 = "Logging out of iCloud. Shutting down.";
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v20 = [(CKKSKeychainView *)self zoneName];
    uint64_t v21 = sub_1000CD884(@"ckkszone", v20);

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v26 = 0;
      long long v22 = "Account status has become undetermined. Pausing!";
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, v26, 2u);
    }
  }

  long long v24 = [(CKKSKeychainView *)self accountLoggedInDependency];

  if (!v24)
  {
    id v25 = [(CKKSKeychainView *)self createAccountLoggedInDependency:@"CloudKit account logged in again."];
    [(CKKSKeychainView *)self setAccountLoggedInDependency:v25];
  }
  [(CKKSKeychainView *)self handleCKLogout];
LABEL_22:
}

- (int64_t)accountStatusFromCKAccountInfo:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 accountStatus] == (id)1 && (objc_msgSend(v4, "hasValidCredentials") & 1) != 0) {
      int64_t v5 = 1;
    }
    else {
      int64_t v5 = 3;
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)createAccountLoggedInDependency:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10017E1A8;
  v8[3] = &unk_100306AD0;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  id v6 = +[CKKSResultOperation named:@"account-logged-in-dependency" withBlock:v8];
  [v6 setDescriptionErrorCode:3];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (void)beginCloudKitOperation
{
  id v4 = [(CKKSKeychainView *)self accountTracker];
  id v3 = [v4 registerForNotificationsOfCloudKitAccountStatusChange:self];
}

- (BOOL)insideSQLTransaction
{
  v2 = [(CKKSKeychainView *)self operationDependencies];
  id v3 = [v2 databaseProvider];
  unsigned __int8 v4 = [v3 insideSQLTransaction];

  return v4;
}

- (void)dispatchSyncWithReadOnlySQLTransaction:(id)a3
{
  id v4 = a3;
  id v6 = [(CKKSKeychainView *)self operationDependencies];
  id v5 = [v6 databaseProvider];
  [v5 dispatchSyncWithReadOnlySQLTransaction:v4];
}

- (void)dispatchSyncWithSQLTransaction:(id)a3
{
  id v4 = a3;
  id v6 = [(CKKSKeychainView *)self operationDependencies];
  id v5 = [v6 databaseProvider];
  [v5 dispatchSyncWithSQLTransaction:v4];
}

- (BOOL)_onqueueResetAllInflightOQE:(id *)a3
{
  id v4 = self;
  id v5 = [(CKKSKeychainView *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v48 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v45 = 0u;
  id v6 = [(CKKSKeychainView *)v4 operationDependencies];
  id v7 = [v6 allCKKSManagedViews];

  id v8 = [v7 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v8)
  {
    long long v37 = a3;
    long long v38 = v7;
    uint64_t v9 = *(void *)v46;
    p_cache = OTDetermineCDPCapableAccountStatusOperation.cache;
    CFStringRef v11 = @"inflight";
    uint64_t v34 = *(void *)v46;
    do
    {
      uint64_t v12 = 0;
      id v35 = v8;
      while (2)
      {
        if (*(void *)v46 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v36 = v12;
        uint64_t v13 = *(void **)(*((void *)&v45 + 1) + 8 * v12);
        while (1)
        {
          id v14 = p_cache + 443;
          id v15 = v4;
          id v16 = [(CKKSKeychainView *)v4 operationDependencies];
          unsigned int v17 = [v16 contextID];
          id v18 = [v13 zoneID];
          id v44 = 0;
          CFStringRef v19 = v11;
          id v20 = [v14 fetch:100 state:v11 contextID:v17 zoneID:v18 error:&v44];
          id v21 = v44;

          if (v21)
          {
            id v32 = [(CKKSKeychainView *)v15 zoneName];
            id v33 = sub_1000CD884(@"ckks", v32);

            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v50 = v21;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Error finding inflight outgoing queue records: %@", buf, 0xCu);
            }

            id v7 = v38;
            if (v37)
            {
              id v21 = v21;
              *long long v37 = v21;
            }
LABEL_26:

            BOOL v28 = 0;
            goto LABEL_28;
          }
          if (![v20 count]) {
            break;
          }
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v20 = v20;
          id v22 = [v20 countByEnumeratingWithState:&v40 objects:v53 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v41;
            while (2)
            {
              for (i = 0; i != v23; i = (char *)i + 1)
              {
                if (*(void *)v41 != v24) {
                  objc_enumerationMutation(v20);
                }
                id v26 = *(void **)(*((void *)&v40 + 1) + 8 * i);
                id v39 = 0;
                [v26 intransactionMoveToState:@"new" viewState:v13 error:&v39];
                id v27 = v39;
                if (v27)
                {
                  id v21 = v27;
                  id v29 = [(CKKSKeychainView *)v15 zoneName];
                  id v30 = sub_1000CD884(@"ckks", v29);

                  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    id v50 = v26;
                    __int16 v51 = 2112;
                    id v52 = v21;
                    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Error fixing up inflight OQE(%@): %@", buf, 0x16u);
                  }

                  id v7 = v38;
                  if (v37) {
                    *long long v37 = v21;
                  }

                  goto LABEL_26;
                }
              }
              id v23 = [v20 countByEnumeratingWithState:&v40 objects:v53 count:16];
              if (v23) {
                continue;
              }
              break;
            }
          }

          p_cache = (void **)(OTDetermineCDPCapableAccountStatusOperation + 16);
          CFStringRef v11 = v19;
          id v4 = v15;
        }

        uint64_t v12 = v36 + 1;
        id v7 = v38;
        uint64_t v9 = v34;
        p_cache = (void **)(OTDetermineCDPCapableAccountStatusOperation + 16);
        CFStringRef v11 = v19;
        id v4 = v15;
        if ((id)(v36 + 1) != v35) {
          continue;
        }
        break;
      }
      id v8 = [v38 countByEnumeratingWithState:&v45 objects:v54 count:16];
      BOOL v28 = 1;
    }
    while (v8);
  }
  else
  {
    BOOL v28 = 1;
  }
LABEL_28:

  return v28;
}

- (id)resyncLocal
{
  id v3 = [CKKSLocalSynchronizeOperation alloc];
  id v4 = [(CKKSKeychainView *)self operationDependencies];
  id v5 = [(CKKSLocalSynchronizeOperation *)v3 initWithCKKSKeychainView:self operationDependencies:v4];

  [(CKKSKeychainView *)self scheduleOperation:v5];

  return v5;
}

- (id)resyncWithCloud
{
  id v3 = [CKKSSynchronizeOperation alloc];
  id v4 = [(CKKSKeychainView *)self operationDependencies];
  id v5 = [(CKKSSynchronizeOperation *)v3 initWithCKKSKeychainView:self dependencies:v4];

  [(CKKSKeychainView *)self scheduleOperation:v5];

  return v5;
}

- (void)xpc24HrNotification
{
  id v2 = [(CKKSKeychainView *)self stateMachine];
  [v2 handleFlag:@"24_hr_notification"];
}

- (void)pcsMirrorKeysForServices:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  CFStringRef v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  uint64_t v13 = sub_10017EAA4;
  id v14 = &unk_1003059C0;
  objc_copyWeak(&v17, &location);
  id v8 = v6;
  id v15 = v8;
  id v9 = v7;
  id v16 = v9;
  id v10 = +[CKKSResultOperation named:@"pcs-mirror-keys" withBlock:&v11];
  -[CKKSKeychainView scheduleOperation:](self, "scheduleOperation:", v10, v11, v12, v13, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)toggleHavoc:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v5 = [(CKKSKeychainView *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10017EE6C;
  v6[3] = &unk_100307348;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v5, v6);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v8 + 24), 0);
  _Block_object_dispose(&v7, 8);
}

- (id)updateDeviceState:(BOOL)a3 waitForKeyHierarchyInitialization:(unint64_t)a4 ckoperationGroup:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  uint64_t v9 = [OctagonStateMultiStateArrivalWatcher alloc];
  char v10 = [(CKKSKeychainView *)self queue];
  CFStringRef v11 = sub_1000B1398();
  id v12 = [(OctagonStateMultiStateArrivalWatcher *)v9 initNamed:@"rpc-watcher" serialQueue:v10 states:v11];

  uint64_t v13 = [(CKKSKeychainView *)self stateMachine];
  [v13 registerMultiStateArrivalWatcher:v12 startTimeout:a4];

  id v14 = [CKKSUpdateDeviceStateOperation alloc];
  id v15 = [(CKKSKeychainView *)self operationDependencies];
  id v16 = [(CKKSUpdateDeviceStateOperation *)v14 initWithOperationDependencies:v15 rateLimit:v6 ckoperationGroup:v8];

  [(CKKSGroupOperation *)v16 setName:@"device-state-operation"];
  id v17 = [v12 result];
  [(CKKSGroupOperation *)v16 addDependency:v17];

  id v18 = [(CKKSKeychainView *)self outgoingQueueOperations];
  [(CKKSUpdateDeviceStateOperation *)v16 linearDependenciesWithSelfFirst:v18];

  [(CKKSKeychainView *)self scheduleOperationWithoutDependencies:v16];

  return v16;
}

- (void)scanLocalItems
{
  id v2 = [(CKKSKeychainView *)self stateMachine];
  [v2 handleFlag:@"dropped_items"];
}

- (id)rpcWaitForPriorityViewProcessing
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  char v10 = sub_100177A70;
  CFStringRef v11 = sub_100177A80;
  id v12 = 0;
  id v3 = [(CKKSKeychainView *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10017F238;
  v6[3] = &unk_100307348;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)rpcProcessIncomingQueue:(id)a3 errorOnClassAFailure:(BOOL)a4
{
  if (a4)
  {
    CFStringRef v24 = @"become_ready";
    id v5 = +[OctagonStateTransitionPathStep success];
    id v25 = v5;
    BOOL v6 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  }
  else
  {
    v22[0] = @"become_ready";
    id v5 = +[OctagonStateTransitionPathStep success];
    v22[1] = @"class_a_incoming_items_remaining";
    v23[0] = v5;
    CFStringRef v20 = @"become_ready";
    uint64_t v7 = +[OctagonStateTransitionPathStep success];
    id v21 = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    v23[1] = v8;
    BOOL v6 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
  }
  CFStringRef v18 = @"process_incoming_queue";
  CFStringRef v19 = v6;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  char v10 = +[OctagonStateTransitionPath pathFromDictionary:v9];
  CFStringRef v11 = [OctagonStateTransitionWatcher alloc];
  id v12 = [(CKKSKeychainView *)self stateMachine];
  id v13 = [(OctagonStateTransitionWatcher *)v11 initNamed:@"process-incoming-queue" stateMachine:v12 path:v10 initialRequest:0];

  id v14 = [(CKKSKeychainView *)self stateMachine];
  [v14 registerStateTransitionWatcher:v13 startTimeout:300000000000];

  id v15 = [(CKKSKeychainView *)self stateMachine];
  [v15 handleFlag:@"process_incoming_queue"];

  id v16 = [v13 result];

  return v16;
}

- (id)rpcFetchAndProcessIncomingQueue:(id)a3 because:(id)a4 errorOnClassAFailure:(BOOL)a5
{
  BOOL v5 = a5;
  id v37 = a3;
  id v38 = a4;
  id v48 = 0;
  LOBYTE(a4) = [(CKKSKeychainView *)self waitForPolicy:5000000000 error:&v48];
  id v8 = v48;
  uint64_t v36 = v8;
  if (a4)
  {
    if (v5)
    {
      CFStringRef v73 = @"become_ready";
      uint64_t v9 = +[OctagonStateTransitionPathStep success];
      id v74 = v9;
      uint64_t v35 = +[NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1];
    }
    else
    {
      v71[0] = @"become_ready";
      uint64_t v9 = +[OctagonStateTransitionPathStep success];
      v71[1] = @"class_a_incoming_items_remaining";
      v72[0] = v9;
      CFStringRef v69 = @"become_ready";
      id v13 = +[OctagonStateTransitionPathStep success];
      v70 = v13;
      id v14 = +[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
      v72[1] = v14;
      uint64_t v35 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:2];
    }
    CFStringRef v67 = @"begin_fetch";
    CFStringRef v65 = @"fetching";
    CFStringRef v63 = @"fetchcomplete";
    CFStringRef v61 = @"process_key_hierarchy";
    CFStringRef v59 = @"check_zone_hierarchies";
    CFStringRef v55 = @"process_incoming_queue";
    uint64_t v56 = v35;
    v57[0] = @"heal_tlk_shares";
    uint64_t v34 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
    v57[1] = @"tlkmissing";
    v58[0] = v34;
    CFStringRef v53 = @"check_zone_hierarchies";
    CFStringRef v49 = @"process_incoming_queue";
    uint64_t v50 = v35;
    CFStringRef v51 = @"heal_tlk_shares";
    id v15 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    id v52 = v15;
    id v16 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    id v54 = v16;
    id v17 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    v58[1] = v17;
    CFStringRef v18 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
    uint64_t v60 = v18;
    CFStringRef v19 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
    uint64_t v62 = v19;
    CFStringRef v20 = +[NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    id v64 = v20;
    id v21 = +[NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
    id v66 = v21;
    id v22 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    id v68 = v22;
    id v33 = +[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];

    id v23 = +[OctagonStateTransitionPath pathFromDictionary:v33];
    CFStringRef v24 = [OctagonStateTransitionWatcher alloc];
    id v25 = [(CKKSKeychainView *)self stateMachine];
    id v26 = [(OctagonStateTransitionWatcher *)v24 initNamed:@"fetch-and-process" stateMachine:v25 path:v23 initialRequest:0];

    id v27 = [(CKKSKeychainView *)self stateMachine];
    [v27 registerStateTransitionWatcher:v26 startTimeout:300000000000];

    BOOL v28 = [(CKKSKeychainView *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10017FF70;
    block[3] = &unk_100305930;
    block[4] = self;
    id v45 = v38;
    dispatch_sync(v28, block);

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10017FFFC;
    v39[3] = &unk_100305978;
    objc_copyWeak(&v42, &location);
    id v29 = v26;
    id v40 = v29;
    id v41 = v37;
    char v10 = +[CKKSResultOperation named:@"check-keys" withBlockTakingSelf:v39];
    id v30 = [v29 result];
    [v10 addDependency:v30];

    id v31 = [(CKKSKeychainView *)self operationQueue];
    [v31 addOperation:v10];

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);

    id v12 = (void *)v35;
  }
  else
  {
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_10017FF64;
    v46[3] = &unk_1003056C0;
    id v47 = v8;
    char v10 = +[CKKSResultOperation named:@"fail" withBlockTakingSelf:v46];
    CFStringRef v11 = [(CKKSKeychainView *)self operationQueue];
    [v11 addOperation:v10];

    id v12 = v47;
  }

  return v10;
}

- (id)rpcFetchBecause:(id)a3
{
  id v4 = a3;
  id v38 = 0;
  unsigned __int8 v5 = [(CKKSKeychainView *)self waitForPolicy:5000000000 error:&v38];
  id v6 = v38;
  uint64_t v7 = v6;
  if (v5)
  {
    CFStringRef v53 = @"begin_fetch";
    id v30 = v6;
    id v31 = v4;
    CFStringRef v51 = @"fetching";
    v49[0] = @"fetchcomplete";
    id v29 = +[OctagonStateTransitionPathStep success];
    v49[1] = @"resetlocal";
    v50[0] = v29;
    CFStringRef v47 = @"initializing";
    CFStringRef v45 = @"initialized";
    CFStringRef v43 = @"begin_fetch";
    CFStringRef v41 = @"fetching";
    CFStringRef v39 = @"fetchcomplete";
    BOOL v28 = +[OctagonStateTransitionPathStep success];
    id v40 = v28;
    id v8 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    id v42 = v8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    id v44 = v9;
    char v10 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    long long v46 = v10;
    CFStringRef v11 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    id v48 = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    v50[1] = v12;
    id v13 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
    id v52 = v13;
    id v14 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    id v54 = v14;
    id v15 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    id v16 = +[OctagonStateTransitionPath pathFromDictionary:v15];

    id v4 = v31;
    id v17 = [OctagonStateTransitionWatcher alloc];
    CFStringRef v18 = [(CKKSKeychainView *)self stateMachine];
    id v19 = [(OctagonStateTransitionWatcher *)v17 initNamed:@"rpc-fetch" stateMachine:v18 path:v16 initialRequest:0];

    CFStringRef v20 = [(CKKSKeychainView *)self stateMachine];
    [v20 registerStateTransitionWatcher:v19 startTimeout:300000000000];

    id v21 = [(CKKSKeychainView *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001808CC;
    block[3] = &unk_100305930;
    block[4] = self;
    id v35 = v31;
    dispatch_sync(v21, block);

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100180958;
    v32[3] = &unk_1003056C0;
    id v33 = v19;
    id v22 = v19;
    id v23 = +[CKKSResultOperation named:@"check-keys" withBlockTakingSelf:v32];
    CFStringRef v24 = [v22 result];
    [v23 addDependency:v24];

    id v25 = [(CKKSKeychainView *)self operationQueue];
    [v25 addOperation:v23];

    uint64_t v7 = v30;
  }
  else
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1001808C0;
    v36[3] = &unk_1003056C0;
    id v37 = v6;
    id v23 = +[CKKSResultOperation named:@"fail" withBlockTakingSelf:v36];
    id v26 = [(CKKSKeychainView *)self operationQueue];
    [v26 addOperation:v23];

    id v16 = v37;
  }

  return v23;
}

- (id)resultsOfNextProcessIncomingQueueOperation
{
  uint64_t v3 = [(CKKSKeychainView *)self resultsOfNextIncomingQueueOperationOperation];
  if (!v3
    || (id v4 = (void *)v3,
        -[CKKSKeychainView resultsOfNextIncomingQueueOperationOperation](self, "resultsOfNextIncomingQueueOperationOperation"), unsigned __int8 v5 = objc_claimAutoreleasedReturnValue(), v6 = [v5 isPending], v5, v4, (v6 & 1) == 0))
  {
    uint64_t v7 = +[NSString stringWithFormat:@"wait-for-next-incoming-queue-operation"];
    id v8 = +[CKKSResultOperation named:v7 withBlock:&stru_100305950];
    [(CKKSKeychainView *)self setResultsOfNextIncomingQueueOperationOperation:v8];
  }
  uint64_t v9 = [(CKKSKeychainView *)self resultsOfNextIncomingQueueOperationOperation];

  return v9;
}

- (void)_onqueueProcessOutgoingQueue:(id)a3 priorityRush:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(CKKSKeychainView *)self queue];
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    id v8 = [(CKKSKeychainView *)self operationDependencies];
    uint64_t v9 = [v8 currentOutgoingQueueOperationGroup];

    if (v9)
    {
      char v10 = [(CKKSKeychainView *)self zoneName];
      CFStringRef v11 = sub_1000CD884(@"ckks", v10);

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = [v6 name];
        id v13 = [(CKKSKeychainView *)self operationDependencies];
        id v14 = [v13 ckoperationGroup];
        id v15 = [v14 name];
        int v18 = 138412546;
        id v19 = v12;
        __int16 v20 = 2112;
        id v21 = v15;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Throwing away CKOperationGroup(%@) in favor of (%@)", (uint8_t *)&v18, 0x16u);
      }
    }
    else
    {
      CFStringRef v11 = [(CKKSKeychainView *)self operationDependencies];
      [v11 setCurrentOutgoingQueueOperationGroup:v6];
    }
  }
  id v16 = [(CKKSKeychainView *)self stateMachine];
  [v16 _onqueueHandleFlag:@"process_outgoing_queue"];

  if (v4) {
    [(CKKSKeychainView *)self outgoingQueuePriorityOperationScheduler];
  }
  else {
  id v17 = [(CKKSKeychainView *)self outgoingQueueOperationScheduler];
  }
  [v17 trigger];
}

- (id)rpcProcessOutgoingQueue:(id)a3 operationGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = sub_100177A70;
  uint64_t v34 = sub_100177A80;
  id v35 = 0;
  id v8 = [(CKKSKeychainView *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018108C;
  block[3] = &unk_100306E50;
  block[4] = self;
  id v29 = &v30;
  id v9 = v6;
  id v28 = v9;
  dispatch_sync(v8, block);

  if (v31[5])
  {
    -[CKKSKeychainView scheduleOperation:](self, "scheduleOperation:");
    id v10 = (id)v31[5];
  }
  else
  {
    CFStringRef v38 = @"process_outgoing_queue";
    CFStringRef v36 = @"become_ready";
    CFStringRef v11 = +[OctagonStateTransitionPathStep success];
    id v37 = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    CFStringRef v39 = v12;
    id v13 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];

    id v14 = +[OctagonStateTransitionPath pathFromDictionary:v13];
    id v15 = [OctagonStateTransitionWatcher alloc];
    id v16 = [(CKKSKeychainView *)self stateMachine];
    id v17 = [(OctagonStateTransitionWatcher *)v15 initNamed:@"push" stateMachine:v16 path:v14 initialRequest:0];

    int v18 = [(CKKSKeychainView *)self stateMachine];
    [v18 registerStateTransitionWatcher:v17 startTimeout:300000000000];

    id v19 = [(CKKSKeychainView *)self queue];
    id v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    id v23 = sub_100181368;
    CFStringRef v24 = &unk_100305930;
    id v25 = self;
    id v26 = v7;
    dispatch_sync(v19, &v21);

    [v17 result:v21, v22, v23, v24, v25];
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v30, 8);

  return v10;
}

- (id)findFirstPendingOperation:(id)a3 ofClass:(Class)a4
{
  id v5 = a3;
  objc_sync_enter(v5);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (v10
          && objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "isPending", (void)v13)
          && (!a4 || (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v11 = v10;
          goto LABEL_14;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_14:

  objc_sync_exit(v6);

  return v11;
}

- (id)findFirstPendingOperation:(id)a3
{
  return [(CKKSKeychainView *)self findFirstPendingOperation:a3 ofClass:0];
}

- (id)viewsRequiringTLKUpload
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100177A70;
  id v11 = sub_100177A80;
  id v12 = 0;
  uint64_t v3 = [(CKKSKeychainView *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100181848;
  v6[3] = &unk_100307348;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)receiveTLKUploadRecords:(id)a3
{
  id v4 = a3;
  id v5 = [(CKKSKeychainView *)self zoneName];
  id v6 = sub_1000CD884(@"ckkskey", v5);

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v11 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received a set of %lu TLK upload records", buf, 0xCu);
  }

  if (v4 && [v4 count])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100181A0C;
    v7[3] = &unk_100305670;
    id v8 = v4;
    uint64_t v9 = self;
    [(CKKSKeychainView *)self dispatchSyncWithSQLTransaction:v7];
  }
}

- (id)findKeySets:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(CKKSKeychainView *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100181CB8;
    block[3] = &unk_100308558;
    block[4] = self;
    dispatch_sync(v4, block);
  }
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_100177A70;
  id v12 = sub_100177A80;
  id v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100181D48;
  v7[3] = &unk_100307348;
  void v7[4] = self;
  v7[5] = &v8;
  [(CKKSKeychainView *)self dispatchSyncWithReadOnlySQLTransaction:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)sendMetricForFirstManateeAccess
{
  uint64_t v3 = [(CKKSKeychainView *)self operationDependencies];
  unsigned int v4 = [v3 sendMetric];

  if (v4)
  {
    id v5 = objc_alloc((Class)AAFAnalyticsEventSecurity);
    id v6 = [(CKKSKeychainView *)self operationDependencies];
    uint64_t v7 = [v6 activeAccount];
    uint64_t v8 = [v7 altDSID];
    uint64_t v9 = kSecurityRTCEventNameFirstManateeKeyFetch;
    uint64_t v10 = kSecurityRTCEventCategoryAccountDataAccessRecovery;
    id v11 = [(CKKSKeychainView *)self operationDependencies];
    id v12 = [v5 initWithCKKSMetrics:&__NSDictionary0__struct altDSID:v8 eventName:v9 testsAreEnabled:0 category:v10 sendMetric:[v11 sendMetric]];

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v12 success:1 error:0];
  }
}

- (void)decryptCurrentItems:(id)a3 cache:(id)a4 complete:(id)a5
{
  id v7 = a3;
  id v53 = a4;
  id v44 = (void (**)(id, id, id))a5;
  uint64_t v8 = (CKKSItem *)objc_alloc_init((Class)NSMutableArray);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v7;
  id v52 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
  id v9 = 0;
  if (v52)
  {
    uint64_t v51 = *(void *)v57;
    uint64_t v45 = kSecAttrViewHintManatee;
    uint64_t v10 = self;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v57 != v51) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(void **)(*((void *)&v56 + 1) + 8 * v11);
      id v13 = [CKKSItem alloc];
      long long v14 = [v12 item];
      long long v15 = [(CKKSKeychainView *)v10 operationDependencies];
      long long v16 = [v15 contextID];
      id v17 = [(CKKSItem *)v13 initWithCKRecord:v14 contextID:v16];

      int v18 = [(CKKSKeychainView *)v10 operationDependencies];
      id v55 = 0;
      id v19 = +[CKKSIncomingQueueOperation decryptCKKSItemToAttributes:v17 keyCache:v53 ckksOperationalDependencies:v18 error:&v55];
      id v20 = v55;

      if (v20)
      {
        id v21 = sub_1000CD884(@"ckks-oob", 0);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          CFStringRef v61 = v17;
          __int16 v62 = 2112;
          id v63 = v20;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "error decrypting item record(%@): %@", buf, 0x16u);
        }

        uint64_t v8 = 0;
        uint64_t v22 = v9;
        int v23 = 2;
        id v9 = v20;
        CFStringRef v24 = v54;
      }
      else
      {
        uint64_t v50 = v19;
        id v25 = [v12 itemPtr];
        id v26 = [v25 itemPtrName];
        uint64_t v22 = [v26 componentsSeparatedByString:@"-"];

        if ([v22 count] == (id)2)
        {
          long long v46 = v17;
          id v47 = v9;
          id v27 = [v22 objectAtIndexedSubscript:0];
          uint64_t v28 = [v22 objectAtIndexedSubscript:1];
          id v29 = objc_alloc((Class)CKKSCurrentItemQueryResult);
          uint64_t v30 = [v12 itemPtr];
          id v31 = [v30 zoneID];
          id v32 = [v29 initWithIdentifier:v28 accessGroup:v27 zoneID:v31 decryptedRecord:v50];
          [(CKKSItem *)v8 addObject:v32];

          uint64_t v10 = self;
          if ([(CKKSKeychainView *)self firstManateeKeyFetched])
          {
            int v23 = 0;
            id v9 = v47;
            CFStringRef v24 = v54;
          }
          else
          {
            id v40 = [v12 itemPtr];
            CFStringRef v41 = [v40 zoneID];
            unsigned int v42 = [v41 isEqualToString:v45];

            CFStringRef v24 = v54;
            if (v42)
            {
              uint64_t v10 = self;
              [(CKKSKeychainView *)self setFirstManateeKeyFetched:1];
              [(CKKSKeychainView *)self sendMetricForFirstManateeAccess];
              int v23 = 0;
              id v9 = v47;
            }
            else
            {
              int v23 = 0;
              id v9 = v47;
              uint64_t v10 = self;
            }
          }
          CFStringRef v39 = (void *)v28;
          id v17 = v46;
        }
        else
        {
          id v33 = v9;
          uint64_t v34 = sub_1000CD884(@"ckks-oob", 0);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            id v35 = [v12 itemPtr];
            CFStringRef v36 = [v35 itemPtrName];
            *(_DWORD *)buf = 138412290;
            CFStringRef v61 = v36;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "unexpected item pointer name format: %@", buf, 0xCu);
          }
          id v27 = [v12 itemPtr];
          uint64_t v37 = [v27 itemPtrName];
          CFStringRef v38 = +[NSString stringWithFormat:@"Item pointer name %@ does not match expected format", v37];
          id v9 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:20 description:v38];

          CFStringRef v39 = (void *)v37;
          uint64_t v8 = 0;
          int v23 = 2;
          uint64_t v10 = self;
          CFStringRef v24 = v54;
        }

        id v19 = v50;
      }

      if (v23) {
        break;
      }
      if (v52 == (id)++v11)
      {
        id v52 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
        if (v52) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (v8)
  {
    CFStringRef v43 = sub_1000CD884(@"ckks-oob", 0);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v61 = v8;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Successfully retrieved current items: %@", buf, 0xCu);
    }
  }
  v44[2](v44, v8, v9);
}

- (void)decryptPCSIdentities:(id)a3 cache:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v47 = a4;
  id v35 = (void (**)(id, id, void *))a5;
  id v9 = (CKKSItem *)objc_alloc_init((Class)NSMutableArray);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v8;
  id v46 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
  uint64_t v10 = 0;
  if (v46)
  {
    uint64_t v45 = *(void *)v51;
    uint64_t v36 = kSecAttrViewHintManatee;
    uint64_t v37 = self;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v51 != v45) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(void **)(*((void *)&v50 + 1) + 8 * v11);
      id v13 = [CKKSItem alloc];
      long long v14 = [v12 item];
      long long v15 = [(CKKSKeychainView *)self operationDependencies];
      long long v16 = [v15 contextID];
      id v17 = [(CKKSItem *)v13 initWithCKRecord:v14 contextID:v16];

      int v18 = v17;
      id v19 = [(CKKSKeychainView *)self operationDependencies];
      id v49 = 0;
      id v20 = +[CKKSIncomingQueueOperation decryptCKKSItemToAttributes:v17 keyCache:v47 ckksOperationalDependencies:v19 error:&v49];
      id v21 = v49;

      if (v21)
      {
        uint64_t v22 = sub_1000CD884(@"ckks-oob", 0);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v55 = v18;
          __int16 v56 = 2112;
          id v57 = v21;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "error decrypting pcs item record(%@): %@", buf, 0x16u);
        }

        id v23 = v21;
        id v9 = 0;
        uint64_t v10 = v23;
        CFStringRef v24 = v48;
      }
      else
      {
        unsigned int v42 = v17;
        CFStringRef v43 = v10;
        id v44 = objc_alloc((Class)CKKSPCSIdentityQueryResult);
        id v40 = [v12 service];
        id v25 = [v40 PCSServiceID];
        CFStringRef v39 = [v12 service];
        id v26 = [v39 PCSPublicKey];
        id v27 = [v26 base64EncodedStringWithOptions:0];
        uint64_t v28 = [v12 service];
        id v29 = [v28 zoneID];
        CFStringRef v41 = v20;
        id v30 = [v44 initWithServiceNumber:v25 publicKey:v27 zoneID:v29 decryptedRecord:v20];
        [(CKKSItem *)v9 addObject:v30];

        self = v37;
        if ([(CKKSKeychainView *)v37 firstManateeKeyFetched])
        {
          uint64_t v10 = v43;
        }
        else
        {
          id v31 = [v12 service];
          id v32 = [v31 zoneID];
          unsigned int v33 = [v32 isEqualToString:v36];

          uint64_t v10 = v43;
          if (v33)
          {
            [(CKKSKeychainView *)v37 setFirstManateeKeyFetched:1];
            [(CKKSKeychainView *)v37 sendMetricForFirstManateeAccess];
          }
        }
        CFStringRef v24 = v48;
        id v20 = v41;
        int v18 = v42;
      }

      if (v21) {
        break;
      }
      if (v46 == (id)++v11)
      {
        id v46 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
        if (v46) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (v9)
  {
    uint64_t v34 = sub_1000CD884(@"ckks-oob", 0);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v55 = v9;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Successfully retrieved identities: %@", buf, 0xCu);
    }
  }
  v35[2](v35, v9, v10);
}

- (BOOL)unwrapKeysAndSaveToCache:(id)a3 syncKeys:(id)a4 error:(id *)a5
{
  id v7 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = a4;
  id v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v9)
  {
    id v10 = v9;
    id v23 = a5;
    uint64_t v11 = *(void *)v27;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v25 = 0;
        id v14 = [v13 unwrapViaKeyHierarchy:v7 error:&v25];
        id v15 = v25;
        if (v15)
        {
          id v20 = v15;
          id v21 = sub_1000CD884(@"ckks-oob", 0);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v31 = v13;
            __int16 v32 = 2112;
            unsigned int v33 = v20;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Unable to decrypt synckey %@: %@", buf, 0x16u);
          }

          if (v23) {
            id *v23 = v20;
          }

          BOOL v19 = 0;
          goto LABEL_19;
        }
        long long v16 = [v13 uuid];
        [v7 addKeyToCache:v16 key:v13];

        id v24 = 0;
        [v13 saveKeyMaterialToKeychain:&v24];
        id v17 = v24;
        if (v17)
        {
          int v18 = sub_1000CD884(@"ckks-oob", 0);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v31 = v17;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Errored saving synckey to keychain: %@", buf, 0xCu);
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v19 = 1;
LABEL_19:

  return v19;
}

- (BOOL)unwrapTLKAndSaveToCache:(id)a3 tlks:(id)a4 tlkShares:(id)a5 error:(id *)a6
{
  id v35 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v9;
  id v33 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v33)
  {
    id v30 = a6;
    uint64_t v32 = *(void *)v44;
LABEL_3:
    uint64_t v11 = 0;
    while (2)
    {
      if (*(void *)v44 != v32) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(void **)(*((void *)&v43 + 1) + 8 * v11);
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v13 = [(CKKSKeychainView *)self operationDependencies];
      id v14 = [v13 peerProviders];

      id v15 = [v14 countByEnumeratingWithState:&v39 objects:v51 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v36 = v11;
        id v17 = 0;
        uint64_t v18 = *(void *)v40;
LABEL_8:
        BOOL v19 = 0;
        id v20 = v17;
        while (1)
        {
          if (*(void *)v40 != v18) {
            objc_enumerationMutation(v14);
          }
          id v21 = [*(id *)(*((void *)&v39 + 1) + 8 * (void)v19) currentState];
          id v38 = v20;
          unsigned int v22 = [v21 unwrapKey:v12 fromShares:v10 error:&v38];
          id v17 = v38;

          if (v22) {
            break;
          }
          if (v17)
          {
            id v23 = sub_1000CD884(@"ckks-oob", 0);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v48 = v12;
              __int16 v49 = 2112;
              id v50 = v17;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Errored unwrapping TLK %@: %@", buf, 0x16u);
            }
          }
          BOOL v19 = (char *)v19 + 1;
          id v20 = v17;
          if (v16 == v19)
          {
            id v16 = [v14 countByEnumeratingWithState:&v39 objects:v51 count:16];
            if (v16) {
              goto LABEL_8;
            }
            goto LABEL_28;
          }
        }
        id v24 = [v12 uuid];
        [v35 addKeyToCache:v24 key:v12];

        id v37 = 0;
        [v12 saveKeyMaterialToKeychain:&v37];
        id v25 = v37;
        if (v25)
        {
          long long v26 = sub_1000CD884(@"ckks-oob", 0);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v48 = v25;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Errored saving TLK to keychain: %@", buf, 0xCu);
          }
        }
        uint64_t v11 = v36 + 1;
        if ((id)(v36 + 1) != v33) {
          continue;
        }
        BOOL v27 = 1;
        id v33 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
        if (v33) {
          goto LABEL_3;
        }
      }
      else
      {
        id v17 = 0;
LABEL_28:

        if (v30)
        {
          long long v28 = +[NSString stringWithFormat:@"No trusted TLKShares for %@", v12];
          *id v30 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:35 description:v28 underlying:v17];
        }
        BOOL v27 = 0;
      }
      break;
    }
  }
  else
  {
    BOOL v27 = 1;
  }

  return v27;
}

- (void)fetchPCSIdentityOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5
{
  BOOL v6 = a4;
  id v49 = a3;
  id v8 = (void (**)(id, void, id))a5;
  id v9 = [(CKKSKeychainView *)self accountStateKnown];
  [v9 wait:1000000000];

  int64_t v10 = [(CKKSKeychainView *)self accountStatus];
  if (!v10)
  {
    id v50 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:64 description:@"iCloud account status unknown."];
    goto LABEL_25;
  }
  if (v10 != 1
    || ([(CKKSKeychainView *)self cuttlefishAdapter],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v11))
  {
    id v50 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:10 description:@"User is not signed into iCloud."];
LABEL_25:
    id v35 = [(CKKSKeychainView *)self zoneName];
    uint64_t v36 = sub_1000CD884(@"ckks-oob", v35);

    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v50;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Rejecting PCS Identity requests since we don't have an iCloud account: %@", buf, 0xCu);
    }

    v8[2](v8, 0, v50);
    goto LABEL_39;
  }
  id v58 = 0;
  unsigned int v12 = [(CKKSKeychainView *)self allowOutOfBandFetch:&v58];
  id v50 = v58;
  if (v50)
  {
    id v13 = sub_1000CD884(@"ckks-oob", 0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v14 = @"DISABLED";
      if (v6) {
        CFStringRef v14 = @"ENABLED";
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v14;
      __int16 v60 = 2112;
      id v61 = v50;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Error fetching out of band fetch permission, relying on forceFetch enablement (%@) : %@", buf, 0x16u);
    }
  }
  if ((v12 | v6))
  {
    id v47 = objc_alloc_init((Class)NSMutableArray);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obj = v49;
    id v15 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v55;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v55 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          BOOL v19 = [v18 accessGroup];
          if (!v19
            || ([v18 zoneID],
                id v20 = objc_claimAutoreleasedReturnValue(),
                BOOL v21 = v20 == 0,
                v20,
                v19,
                v21))
          {
            id v38 = [(CKKSKeychainView *)self zoneName];
            long long v39 = sub_1000CD884(@"ckks-oob", v38);

            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              long long v40 = [v18 accessGroup];
              long long v41 = [v18 zoneID];
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v18;
              __int16 v60 = 2112;
              id v61 = v40;
              __int16 v62 = 2112;
              id v63 = v41;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Rejecting pcs service (%@) get since no access group(%@) or zoneID(%@) given", buf, 0x20u);
            }
            long long v42 = +[NSString stringWithFormat:@"No access group or view given for PCS Service(%@)", v18];
            long long v43 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:-50 description:v42];
            v8[2](v8, 0, v43);

            goto LABEL_37;
          }
          unsigned int v22 = [CuttlefishPCSServiceIdentifier alloc];
          id v23 = [v18 serviceNumber];
          id v24 = objc_alloc((Class)NSData);
          id v25 = [v18 publicKey];
          id v26 = [v24 initWithBase64EncodedString:v25 options:0];
          BOOL v27 = [v18 zoneID];
          id v28 = [(CuttlefishPCSServiceIdentifier *)v22 init:v23 PCSPublicKey:v26 zoneID:v27];
          [v47 addObject:v28];
        }
        id v15 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    long long v29 = [(CKKSKeychainView *)self accountsAdapter];
    id v30 = [(CKKSKeychainView *)self personaAdapter];
    id v31 = [(CKKSKeychainView *)self operationDependencies];
    uint64_t v32 = [v31 contextID];
    id v53 = 0;
    id obj = [v29 findAccountForCurrentThread:v30 optionalAltDSID:0 cloudkitContainerName:@"com.apple.security.keychain" octagonContextID:v32 error:&v53];
    id v33 = v53;

    if (!obj || v33)
    {
      long long v44 = sub_1000CD884(@"ckks-cuttlefish", 0);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = @"defaultContext";
        __int16 v60 = 2112;
        id v61 = v33;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "unable to determine active account for context(%@). Issues ahead: %@", buf, 0x16u);
      }

      v8[2](v8, 0, v33);
LABEL_37:
    }
    else
    {
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      uint64_t v34 = [(CKKSKeychainView *)self cuttlefishAdapter];
      objc_copyWeak(&v52, (id *)buf);
      long long v51 = v8;
      id obja = obj;
      [v34 fetchPCSIdentityByKey:pcsservices:reply:];

      objc_destroyWeak(&v52);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    id v37 = sub_1000CD884(@"ckks-oob", 0);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Out of band fetch disabled due to CKKS readiness", buf, 2u);
    }

    id v48 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:67 description:@"Out of band fetch disabled due to CKKS readiness"];
    v8[2](v8, 0, v48);
  }
LABEL_39:
}

- (void)getCurrentItemOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5
{
  BOOL v6 = a4;
  id v50 = a3;
  id v8 = (void (**)(id, void, id))a5;
  id v9 = [(CKKSKeychainView *)self accountStateKnown];
  [v9 wait:1000000000];

  int64_t v10 = [(CKKSKeychainView *)self accountStatus];
  if (!v10)
  {
    id v51 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:64 description:@"iCloud account status unknown."];
    goto LABEL_25;
  }
  if (v10 != 1
    || ([(CKKSKeychainView *)self cuttlefishAdapter],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v11))
  {
    id v51 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:10 description:@"User is not signed into iCloud."];
LABEL_25:
    uint64_t v34 = [(CKKSKeychainView *)self zoneName];
    id v35 = sub_1000CD884(@"ckks-oob", v34);

    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v51;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Rejecting current item requests since we don't have an iCloud account: %@", buf, 0xCu);
    }

    v8[2](v8, 0, v51);
    goto LABEL_39;
  }
  id v59 = 0;
  unsigned int v12 = [(CKKSKeychainView *)self allowOutOfBandFetch:&v59];
  id v51 = v59;
  if (v51)
  {
    id v13 = sub_1000CD884(@"ckks-oob", 0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v14 = @"DISABLED";
      if (v6) {
        CFStringRef v14 = @"ENABLED";
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v14;
      __int16 v61 = 2112;
      id v62 = v51;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Error fetching out of band fetch permission, relying on forceFetch enablement (%@) : %@", buf, 0x16u);
    }
  }
  if ((v12 | v6))
  {
    id v48 = objc_alloc_init((Class)NSMutableArray);
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = v50;
    id v15 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v56;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v56 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          BOOL v19 = [v18 zoneID];
          if (!v19
            || ([v18 accessGroup],
                id v20 = objc_claimAutoreleasedReturnValue(),
                BOOL v21 = v20 == 0,
                v20,
                v19,
                v21))
          {
            id v37 = [(CKKSKeychainView *)self zoneName];
            id v38 = sub_1000CD884(@"ckks-oob", v37);

            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              long long v39 = [v18 identifier];
              long long v40 = [v18 accessGroup];
              long long v41 = [v18 zoneID];
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v39;
              __int16 v61 = 2112;
              id v62 = v40;
              __int16 v63 = 2112;
              id v64 = v41;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Rejecting current item pointer for identifier(%@) get since no access group(%@) or zoneID(%@) given", buf, 0x20u);
            }
            long long v42 = [v18 identifier];
            long long v43 = +[NSString stringWithFormat:@"No access group or view given for identifier(%@)", v42];
            long long v44 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:-50 description:v43];
            v8[2](v8, 0, v44);

            goto LABEL_37;
          }
          unsigned int v22 = [CuttlefishCurrentItemSpecifier alloc];
          id v23 = [v18 accessGroup];
          id v24 = [v18 identifier];
          id v25 = +[NSString stringWithFormat:@"%@-%@", v23, v24];
          id v26 = [v18 zoneID];
          id v27 = [(CuttlefishCurrentItemSpecifier *)v22 init:v25 zoneID:v26];
          [v48 addObject:v27];
        }
        id v15 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    id v28 = [(CKKSKeychainView *)self accountsAdapter];
    long long v29 = [(CKKSKeychainView *)self personaAdapter];
    id v30 = [(CKKSKeychainView *)self operationDependencies];
    id v31 = [v30 contextID];
    id v54 = 0;
    id obj = [v28 findAccountForCurrentThread:v29 optionalAltDSID:0 cloudkitContainerName:@"com.apple.security.keychain" octagonContextID:v31 error:&v54];
    id v32 = v54;

    if (!obj || v32)
    {
      long long v45 = sub_1000CD884(@"ckks-cuttlefish", 0);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = @"defaultContext";
        __int16 v61 = 2112;
        id v62 = v32;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "unable to determine active account for context(%@). Issues ahead: %@", buf, 0x16u);
      }

      v8[2](v8, 0, v32);
LABEL_37:
    }
    else
    {
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      id v33 = [(CKKSKeychainView *)self cuttlefishAdapter];
      objc_copyWeak(&v53, (id *)buf);
      id v52 = v8;
      id obja = obj;
      [v33 fetchCurrentItem:items:reply:];

      objc_destroyWeak(&v53);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    uint64_t v36 = sub_1000CD884(@"ckks", 0);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Out of band fetch disabled due to CKKS readiness", buf, 2u);
    }

    id v49 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:67 description:@"Out of band fetch disabled due to CKKS readiness"];
    v8[2](v8, 0, v49);
  }
LABEL_39:
}

- (void)getCurrentItemForAccessGroup:(id)a3 identifier:(id)a4 viewHint:(id)a5 fetchCloudValue:(BOOL)a6 complete:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (v8) {
    id v16 = 0;
  }
  else {
    id v16 = [v14 isEqualToString:@"ProtectedCloudStorage"];
  }
  id v40 = 0;
  id v17 = [(CKKSKeychainView *)self zoneIDForViewHint:v14 pcsShortcut:v16 error:&v40];
  id v18 = v40;
  if (v17)
  {
    if (v12 && v13)
    {
      if ((v16 & 1) != 0
        || ([(CKKSKeychainView *)self accountStateKnown],
            BOOL v19 = objc_claimAutoreleasedReturnValue(),
            [v19 wait:30000000000],
            v19,
            int64_t v20 = [(CKKSKeychainView *)self accountStatus],
            v20 == 1))
      {
        if (v8)
        {
          id v24 = +[NSSet setWithObject:v14];
          id v25 = [(CKKSKeychainView *)self rpcFetchAndProcessIncomingQueue:v24 because:@"currentitemcheck" errorOnClassAFailure:0];
        }
        else
        {
          id v25 = 0;
        }
        *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
        objc_initWeak((id *)buf, self);
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_100185850;
        v31[3] = &unk_100306BD8;
        id v26 = v25;
        id v32 = v26;
        id v33 = self;
        id v38 = v15;
        objc_copyWeak(&v39, (id *)buf);
        id v34 = v12;
        id v35 = v13;
        id v36 = v14;
        id v37 = v17;
        id v27 = +[CKKSResultOperation named:@"get-current-item-pointer" withBlock:v31];
        [v27 addNullableDependency:v26];
        if (v16) {
          [(CKKSKeychainView *)self scheduleOperationWithoutDependencies:v27];
        }
        else {
          [(CKKSKeychainView *)self scheduleOperation:v27];
        }

        objc_destroyWeak(&v39);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        if (v20) {
          +[NSError errorWithDomain:@"CKKSErrorDomain" code:10 description:@"User is not signed into iCloud."];
        }
        else {
        id v28 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:64 description:@"iCloud account status unknown."];
        }
        long long v29 = [(CKKSKeychainView *)self zoneName];
        id v30 = sub_1000CD884(@"ckkscurrent", v29);

        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v28;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Rejecting current item pointer get since we don't have an iCloud account: %@", buf, 0xCu);
        }

        (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v28);
      }
    }
    else
    {
      BOOL v21 = [(CKKSKeychainView *)self zoneName];
      unsigned int v22 = sub_1000CD884(@"ckkscurrent", v21);

      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v12;
        __int16 v42 = 2112;
        id v43 = v13;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Rejecting current item pointer get since no access group(%@) or identifier(%@) given", buf, 0x16u);
      }

      id v23 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:-50 description:@"No access group or identifier given"];
      (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v23);
    }
  }
  else
  {
    (*((void (**)(id, void, id))v15 + 2))(v15, 0, v18);
  }
}

- (id)zoneIDForViewHint:(id)a3 pcsShortcut:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (v6) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = 5000000000;
  }
  id v17 = 0;
  int64_t v10 = [(CKKSKeychainView *)self policyDependentViewStateForName:v8 timeout:v9 error:&v17];
  id v11 = v17;
  if (v10)
  {
    id v12 = [v10 zoneID];
LABEL_6:
    id v13 = v12;
    goto LABEL_7;
  }
  if (v6 && [v8 isEqualToString:@"ProtectedCloudStorage"])
  {
    id v15 = [(CKKSKeychainView *)self zoneName];
    id v16 = sub_1000CD884(@"ckkscurrent", v15);

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Unable to retrieve view state, using ProtectedCloudStorage: %@", buf, 0xCu);
    }

    id v12 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:@"ProtectedCloudStorage" ownerName:CKCurrentUserDefaultName];
    goto LABEL_6;
  }
  id v13 = 0;
  if (a5) {
    *a5 = v11;
  }
LABEL_7:

  return v13;
}

- (void)unsetCurrentItemsForAccessGroup:(id)a3 identifiers:(id)a4 viewHint:(id)a5 complete:(id)a6
{
  int64_t v10 = (CKKSDeleteCurrentItemPointersOperation *)a3;
  id v11 = a4;
  id v12 = a6;
  id v42 = 0;
  id v13 = [(CKKSKeychainView *)self policyDependentViewStateForName:a5 error:&v42];
  id v14 = v42;
  if (v13)
  {
    if (v10 && v11 && [v11 count])
    {
      id v15 = [(CKKSKeychainView *)self accountStateKnown];
      [v15 wait:30000000000];

      int64_t v16 = [(CKKSKeychainView *)self accountStatus];
      if (v16 == 1)
      {
        unsigned int v22 = [(CKKSKeychainView *)self zoneName];
        id v23 = sub_1000CD884(@"ckkscurrent", v22);

        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          id v24 = [v11 count];
          *(_DWORD *)buf = 138412546;
          long long v44 = v10;
          __int16 v45 = 2048;
          id v46 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Starting delete current item pointer(s) operation for %@ (%lu)", buf, 0x16u);
        }

        id v25 = [CKKSDeleteCurrentItemPointersOperation alloc];
        id v26 = [(CKKSKeychainView *)self operationDependencies];
        id v27 = +[CKOperationGroup CKKSGroupWithName:@"currentitem-api"];
        id v28 = [(CKKSDeleteCurrentItemPointersOperation *)v25 initWithCKKSOperationDependencies:v26 viewState:v13 accessGroup:v10 identifiers:v11 ckoperationGroup:v27];

        id v35 = _NSConcreteStackBlock;
        uint64_t v36 = 3221225472;
        id v37 = sub_1001866A0;
        id v38 = &unk_100305810;
        id v39 = v28;
        id v40 = v13;
        id v41 = v12;
        long long v29 = v28;
        id v30 = +[CKKSResultOperation operationWithBlock:&v35];
        [v30 setName:@"unsetCurrentItems-return-callback" v35, v36, v37, v38];
        [v30 addDependency:v29];
        [(CKKSKeychainView *)self scheduleOperation:v30];
        id v31 = [(CKKSKeychainView *)self outgoingQueueOperations];
        [(CKKSDeleteCurrentItemPointersOperation *)v29 linearDependencies:v31];

        id v32 = [(CKKSResultOperation *)v29 timeout:60000000000];
        [(CKKSKeychainView *)self scheduleOperation:v29];
      }
      else
      {
        if (v16)
        {
          CFStringRef v17 = @"User is not signed into iCloud.";
          uint64_t v18 = 10;
        }
        else
        {
          CFStringRef v17 = @"iCloud account status unknown.";
          uint64_t v18 = 64;
        }
        long long v29 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:v18 description:v17];
        id v33 = [(CKKSKeychainView *)self zoneName];
        id v34 = sub_1000CD884(@"ckkscurrent", v33);

        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          long long v44 = v29;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Rejecting current item pointer delete since we don't have an iCloud account: %@", buf, 0xCu);
        }

        (*((void (**)(id, CKKSDeleteCurrentItemPointersOperation *))v12 + 2))(v12, v29);
      }
    }
    else
    {
      id v19 = [(CKKSKeychainView *)self zoneName];
      int64_t v20 = sub_1000CD884(@"ckkscurrent", v19);

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        long long v44 = v10;
        __int16 v45 = 2112;
        id v46 = v11;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Rejecting current item pointer delete since no access group(%@) or identifiers(%@) given", buf, 0x16u);
      }

      BOOL v21 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:-50 description:@"No access group or identifier given"];
      (*((void (**)(id, void *))v12 + 2))(v12, v21);
    }
  }
  else
  {
    (*((void (**)(id, id))v12 + 2))(v12, v14);
  }
}

- (void)setCurrentItemForAccessGroup:(id)a3 hash:(id)a4 accessGroup:(id)a5 identifier:(id)a6 viewHint:(id)a7 replacing:(id)a8 hash:(id)a9 complete:(id)a10
{
  id v48 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v53 = 0;
  unsigned int v22 = [(CKKSKeychainView *)self policyDependentViewStateForName:a7 error:&v53];
  id v23 = v53;
  if (v22)
  {
    id v47 = v19;
    if (v17 && v18)
    {
      id v24 = [(CKKSKeychainView *)self accountStateKnown];
      [v24 wait:30000000000];

      int64_t v25 = [(CKKSKeychainView *)self accountStatus];
      if (v25 == 1)
      {
        id v46 = v16;
        id v35 = [(CKKSKeychainView *)self zoneName];
        uint64_t v36 = sub_1000CD884(@"ckkscurrent", v35);

        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v55 = v17;
          __int16 v56 = 2112;
          id v57 = v18;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Starting change current pointer operation for %@-%@", buf, 0x16u);
        }

        id v37 = [CKKSUpdateCurrentItemPointerOperation alloc];
        id v38 = [(CKKSKeychainView *)self operationDependencies];
        id v39 = +[CKOperationGroup CKKSGroupWithName:@"currentitem-api"];
        id v40 = [(CKKSUpdateCurrentItemPointerOperation *)v37 initWithCKKSOperationDependencies:v38 viewState:v22 newItem:v48 hash:v46 accessGroup:v17 identifier:v18 replacing:v47 hash:v20 ckoperationGroup:v39];

        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        void v49[2] = sub_100186D04;
        v49[3] = &unk_100305810;
        id v50 = v40;
        id v51 = v22;
        id v52 = v21;
        id v41 = v40;
        id v42 = +[CKKSResultOperation operationWithBlock:v49];
        [v42 setName:@"setCurrentItem-return-callback"];
        [v42 addDependency:v41];
        [(CKKSKeychainView *)self scheduleOperation:v42];
        id v43 = [(CKKSKeychainView *)self outgoingQueueOperations];
        [(CKKSUpdateCurrentItemPointerOperation *)v41 linearDependencies:v43];

        id v44 = [(CKKSResultOperation *)v41 timeout:60000000000];
        [(CKKSKeychainView *)self scheduleOperation:v41];

        id v16 = v46;
        goto LABEL_18;
      }
      id v26 = v16;
      if (v25)
      {
        CFStringRef v27 = @"User is not signed into iCloud.";
        uint64_t v28 = 10;
      }
      else
      {
        CFStringRef v27 = @"iCloud account status unknown.";
        uint64_t v28 = 64;
      }
      long long v29 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:v28 description:v27];
      __int16 v45 = [(CKKSKeychainView *)self zoneName];
      id v31 = sub_1000CD884(@"ckkscurrent", v45);

      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v55 = v29;
        id v32 = "Rejecting current item pointer set since we don't have an iCloud account: %@";
        id v33 = v31;
        os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_16;
      }
    }
    else
    {
      id v26 = v16;
      long long v29 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:-50 description:@"No access group or identifier given"];
      id v30 = [(CKKSKeychainView *)self zoneName];
      id v31 = sub_1000CD884(@"ckkscurrent", v30);

      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v55 = v29;
        id v32 = "Cancelling request: %@";
        id v33 = v31;
        os_log_type_t v34 = OS_LOG_TYPE_ERROR;
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v33, v34, v32, buf, 0xCu);
      }
    }

    (*((void (**)(id, void *))v21 + 2))(v21, v29);
    id v16 = v26;
LABEL_18:
    id v19 = v47;
    goto LABEL_19;
  }
  (*((void (**)(id, id))v21 + 2))(v21, v23);
LABEL_19:
}

- (void)handleKeychainEventDbConnection:(__OpaqueSecDbConnection *)a3 source:(unint64_t)a4 added:(SecDbItem *)a5 deleted:(SecDbItem *)a6 rateLimiter:(id)a7
{
  id v83 = a7;
  if ((sub_1000B14D4() & 1) == 0)
  {
    id v17 = [(CKKSKeychainView *)self zoneName];
    id v13 = sub_1000CD884(@"ckks", v17);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Skipping handleKeychainEventDbConnection due to disabled CKKS", buf, 2u);
    }
    goto LABEL_109;
  }
  v79 = a3;
  unint64_t v80 = a4;
  id v81 = a6;
  if (a5) {
    id v12 = a5;
  }
  else {
    id v12 = a6;
  }
  id v13 = +[CKKSKey isItemKeyForKeychainView:v12];
  if (v13)
  {
    id v14 = [(CKKSKeychainView *)self zoneName];
    id v15 = sub_1000CD884(@"ckks", v14);

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = v80;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Potential new key material from %@ (source %lu)", buf, 0x16u);
    }

    id v16 = [(CKKSKeychainView *)self stateMachine];
    [v16 handleFlag:@"key_process_requested"];

    goto LABEL_109;
  }
  if (a5) {
    int v18 = sub_10011B964(a5);
  }
  else {
    int v18 = 0;
  }
  int v19 = (int)v81;
  if (v81) {
    int v19 = sub_10011B964(v81);
  }
  if (((v18 | v19) & 1) == 0)
  {
    id v30 = sub_1000CD884(@"ckks", 0);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "skipping sync of non-sync item (%d, %d)", buf, 0xEu);
    }
    goto LABEL_31;
  }
  int v75 = v19;
  if (!sub_10011BA64(v12))
  {
    id v30 = sub_1000CD884(@"ckks", 0);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Ignoring syncable keychain item for non-primary account", buf, 2u);
    }
LABEL_31:

    goto LABEL_108;
  }
  int v74 = v18;
  uint64_t v101 = 0;
  v102 = &v101;
  uint64_t v103 = 0x2020000000;
  char v104 = 0;
  id v20 = [(CKKSKeychainView *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100187B5C;
  block[3] = &unk_1003097F0;
  void block[5] = &v101;
  block[6] = v12;
  block[4] = self;
  dispatch_sync(v20, block);

  if (!*((unsigned char *)v102 + 24))
  {
    [(CKKSKeychainView *)self notifyPasswordsOrPCSChangedForAddedItem:a5 modified:v12 deleted:v81];
    goto LABEL_107;
  }
  id v21 = [(CKKSKeychainView *)self operationDependencies];
  v78 = [v21 viewNameForItem:v12];

  if (!v78)
  {
    id v49 = sub_1000CD884(@"ckks", 0);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      *(void *)&uint8_t buf[4] = v12;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "No intended CKKS view for item; skipping: %{private}@",
        buf,
        0xCu);
    }

    [(CKKSKeychainView *)self notifyPasswordsOrPCSChangedForAddedItem:a5 modified:v12 deleted:v81];
    goto LABEL_106;
  }
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  unsigned int v22 = [(CKKSKeychainView *)self operationDependencies];
  id obj = [v22 allCKKSManagedViews];

  id v23 = [obj countByEnumeratingWithState:&v96 objects:v114 count:16];
  if (!v23) {
    goto LABEL_28;
  }
  uint64_t v24 = *(void *)v97;
  while (2)
  {
    for (i = 0; i != v23; i = (char *)i + 1)
    {
      if (*(void *)v97 != v24) {
        objc_enumerationMutation(obj);
      }
      id v26 = *(void **)(*((void *)&v96 + 1) + 8 * i);
      CFStringRef v27 = [v26 zoneID];
      uint64_t v28 = [v27 zoneName];
      unsigned __int8 v29 = [v28 isEqualToString:v78];

      if (v29)
      {
        id v31 = v26;

        if (!v31) {
          goto LABEL_42;
        }
        id v32 = [v31 zoneID];
        id v33 = [v32 zoneName];
        os_log_type_t v34 = sub_1000CD884(@"ckks", v33);

        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412547;
          *(void *)&uint8_t buf[4] = v78;
          *(_WORD *)&unsigned char buf[12] = 2113;
          *(void *)&buf[14] = v12;
          _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "Routing item to zone %@: %{private}@", buf, 0x16u);
        }

        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        v109 = sub_100177A70;
        v110 = sub_100177A80;
        id v111 = 0;
        if (a5)
        {
          int v35 = sub_10011BAEC(a5);
          uint64_t v36 = v81;
          if (!v81)
          {
            int v37 = 0;
            int v38 = 0;
            int v39 = 0;
            int v40 = 1;
            int v41 = 1;
            int v42 = v75;
            goto LABEL_66;
          }
        }
        else
        {
          int v35 = 0;
          uint64_t v36 = v81;
          if (!v81)
          {
            BOOL v50 = 1;
            int v39 = 0;
            int v38 = 0;
LABEL_52:
            if (a5) {
              BOOL v51 = v36 == 0;
            }
            else {
              BOOL v51 = 1;
            }
            int v37 = !v51;
            int v40 = v37 ^ 1;
            int v41 = v37 & ~v35 & v38;
            int v42 = v75;
            if ((v41 & 1) == 0 && (v40 & 1) == 0) {
              int v41 = v74 & (v75 ^ 1);
            }
            if (!v36) {
              BOOL v50 = 0;
            }
            if (v50)
            {
              if ((v37 & 1) == 0)
              {
                if ((v39 & 1) == 0)
                {
                  int v53 = 0;
                  int v52 = 1;
                  goto LABEL_83;
                }
                goto LABEL_79;
              }
              int v52 = 1;
              goto LABEL_70;
            }
LABEL_66:
            if (v37 & v35 & (v38 ^ 1) | v40) {
              int v52 = v37 & v35 & (v38 ^ 1);
            }
            else {
              int v52 = v42 & ~v74;
            }
            if ((v37 & 1) == 0)
            {
              int v54 = v35 ^ 1;
              if (v36) {
                int v54 = 1;
              }
              if (!v54) {
                uint64_t v36 = a5;
              }
              if (!v39)
              {
                int v53 = 0;
                v52 |= v54 ^ 1;
                v41 &= v54;
                goto LABEL_83;
              }
LABEL_79:
              id v55 = [v31 zoneID];
              __int16 v56 = [v55 zoneName];
              id v57 = sub_1000CD884(@"ckks", v56);

              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)id v105 = 67109376;
                *(_DWORD *)id v106 = 1;
                *(_WORD *)&v106[4] = 1024;
                *(_DWORD *)&v106[6] = 1;
                long long v58 = "skipping syncing update of tombstone item (%d, %d)";
                id v59 = v57;
                uint32_t v60 = 14;
LABEL_87:
                _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, v58, v105, v60);
              }
LABEL_104:

              _Block_object_dispose(buf, 8);
              goto LABEL_105;
            }
LABEL_70:
            if ((v39 & 1) == 0)
            {
              int v53 = (v41 | v52) ^ 1;
LABEL_83:
              if (!v52 || (v35 & 1) != 0)
              {
                int obja = v53;
                id v82 = v36;
                if (a5) {
                  __int16 v63 = a5;
                }
                else {
                  __int16 v63 = v36;
                }
                id v57 = sub_100119CB8(v63, kSecAttrAccessible);
                CFStringRef v65 = v79;
                unint64_t v64 = v80;
                if ([v57 isEqualToString:kSecAttrAccessibleWhenUnlocked] & 1) != 0|| ([v57 isEqualToString:kSecAttrAccessibleAfterFirstUnlock] & 1) != 0|| ([v57 isEqualToString:kSecAttrAccessibleAlwaysPrivate])
                {
                  if (!v80)
                  {
                    id v66 = sub_100118CF8(a5, (uint64_t)&off_100305790, 0);
                    CFStringRef v67 = [v31 zoneID];
                    id v68 = [v67 zoneName];
                    CFStringRef v69 = sub_1000CD884(@"ckks", v68);

                    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
                    {
                      CFStringRef v70 = @"deletion";
                      if (obja) {
                        CFStringRef v70 = @"modification";
                      }
                      if (v41) {
                        CFStringRef v70 = @"addition";
                      }
                      *(_DWORD *)id v105 = 138412546;
                      *(void *)id v106 = v70;
                      *(_WORD *)&v106[8] = 2112;
                      v107 = v66;
                      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Received an incoming %@ from SOS (%@)", v105, 0x16u);
                    }

                    CFStringRef v65 = v79;
                    unint64_t v64 = v80;
                  }
                  id v71 = [(CKKSKeychainView *)self databaseProvider];
                  v84[0] = _NSConcreteStackBlock;
                  v84[1] = 3221225472;
                  v84[2] = sub_100187C60;
                  v84[3] = &unk_1003057E8;
                  id v85 = v31;
                  id v86 = self;
                  char v93 = v41;
                  v88 = buf;
                  id v89 = a5;
                  char v94 = v52;
                  char v95 = obja;
                  id v90 = v82;
                  unint64_t v91 = v64;
                  id v87 = v83;
                  v92 = v65;
                  [v71 dispatchSyncWithConnection:v65 readWriteTxion:1 block:v84];

                  id v72 = v85;
                }
                else
                {
                  CFStringRef v73 = [(CKKSKeychainView *)self zoneName];
                  id v72 = sub_1000CD884(@"ckks", v73);

                  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)id v105 = 138412290;
                    *(void *)id v106 = v57;
                    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "skipping sync of device-bound(%@) item", v105, 0xCu);
                  }
                }

                goto LABEL_104;
              }
              __int16 v61 = [v31 zoneID];
              id v62 = [v61 zoneName];
              id v57 = sub_1000CD884(@"ckks", v62);

              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)id v105 = 0;
                long long v58 = "Client has asked for an item deletion to not sync. Keychain is now out of sync with account";
                id v59 = v57;
                uint32_t v60 = 2;
                goto LABEL_87;
              }
              goto LABEL_104;
            }
            goto LABEL_79;
          }
        }
        int v38 = sub_10011BAEC(v36);
        int v39 = v35 & v38;
        BOOL v50 = a5 == 0;
        goto LABEL_52;
      }
    }
    id v23 = [obj countByEnumeratingWithState:&v96 objects:v114 count:16];
    if (v23) {
      continue;
    }
    break;
  }
LABEL_28:

LABEL_42:
  id v43 = sub_1000CD884(@"ckks", 0);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412547;
    *(void *)&uint8_t buf[4] = v78;
    *(_WORD *)&unsigned char buf[12] = 2113;
    *(void *)&buf[14] = v12;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "No CKKS view for %@, skipping: %{private}@", buf, 0x16u);
  }

  sub_100118CF8(v12, (uint64_t)&off_100305790, 0);
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  id v44 = +[CKKSViewManager manager];
  __int16 v45 = [v44 claimCallbackForUUID:v31];

  if (v45)
  {
    NSErrorUserInfoKey v112 = NSLocalizedDescriptionKey;
    id v46 = +[NSString stringWithFormat:@"No syncing view for '%@'", v78];
    CFStringRef v113 = v46;
    id v47 = +[NSDictionary dictionaryWithObjects:&v113 forKeys:&v112 count:1];
    id v48 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:11 userInfo:v47];
    ((void (**)(void, void, void *))v45)[2](v45, 0, v48);
  }
LABEL_105:

LABEL_106:
LABEL_107:
  _Block_object_dispose(&v101, 8);
LABEL_108:
  id v13 = 0;
LABEL_109:
}

- (void)notifyPasswordsOrPCSChangedForAddedItem:(SecDbItem *)a3 modified:(SecDbItem *)a4 deleted:(SecDbItem *)a5
{
  if (a3) {
    -[CKKSKeychainView notifyForItem:](self, "notifyForItem:");
  }
  if (a4) {
    [(CKKSKeychainView *)self notifyForItem:a4];
  }
  if (a5)
  {
    [(CKKSKeychainView *)self notifyForItem:a5];
  }
}

- (void)notifyForItem:(SecDbItem *)a3
{
  id v5 = (void *)sub_100118CF8(a3, (uint64_t)&off_100305740, 0);
  if (v5)
  {
    BOOL v6 = v5;
    if (!CFEqual(v5, kCFNull))
    {
      CFRetain(v6);
      if ([v6 isEqualToString:@"com.apple.cfnetwork"])
      {
        id v7 = [(CKKSKeychainView *)self cloudKitClassDependencies];
        id v8 = [v7 notifierClass];
        uint64_t v9 = +[NSString stringWithFormat:@"com.apple.security.view-change.Passwords"];
        [v8 post:v9];
      }
    }
  }
  int64_t v10 = (void *)sub_100118CF8(a3, (uint64_t)&off_100305768, 0);
  if (v10)
  {
    cf = v10;
    if (!CFEqual(v10, kCFNull))
    {
      CFRetain(cf);
      if ([cf isEqualToString:kSOSViewHintPCSMasterKey])
      {
        id v11 = [(CKKSKeychainView *)self cloudKitClassDependencies];
        id v12 = [v11 notifierClass];
        id v13 = +[NSString stringWithFormat:@"com.apple.security.view-change.PCS"];
        [v12 post:v13];
      }
    }
  }
}

- (BOOL)_onqueueOtherDevicesReportHavingTLKs:(id)a3 trustStates:(id)a4
{
  id v105 = a3;
  id v5 = a4;
  uint64_t v6 = +[NSDate date];
  id v7 = objc_alloc_init((Class)NSDateComponents);
  [v7 setDay:-45];
  id v8 = +[NSCalendar currentCalendar];
  id v102 = v7;
  v109 = [v8 dateByAddingComponents:v7 toDate:v6 options:0];

  id v9 = objc_alloc_init((Class)NSDateComponents);
  [v9 setDay:-4];
  int64_t v10 = +[NSCalendar currentCalendar];
  id v101 = v9;
  uint64_t v103 = (void *)v6;
  id v106 = [v10 dateByAddingComponents:v9 toDate:v6 options:0];

  id v11 = +[NSMutableSet set];
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  id v12 = v5;
  id v13 = [v12 countByEnumeratingWithState:&v128 objects:v140 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v129;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v129 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v128 + 1) + 8 * i);
        long long v124 = 0u;
        long long v125 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        int v18 = [v17 currentTrustedPeers];
        id v19 = [v18 countByEnumeratingWithState:&v124 objects:v139 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v125;
          do
          {
            for (j = 0; j != v20; j = (char *)j + 1)
            {
              if (*(void *)v125 != v21) {
                objc_enumerationMutation(v18);
              }
              id v23 = [*(id *)(*((void *)&v124 + 1) + 8 * (void)j) peerID];
              [v11 addObject:v23];
            }
            id v20 = [v18 countByEnumeratingWithState:&v124 objects:v139 count:16];
          }
          while (v20);
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v128 objects:v140 count:16];
    }
    while (v14);
  }

  uint64_t v24 = v105;
  int64_t v25 = [v105 currentTLKPointer];
  id v26 = [v25 zoneID];
  id v123 = 0;
  CFStringRef v27 = +[CKKSDeviceStateEntry allInZone:v26 error:&v123];
  uint64_t v28 = v123;

  char v104 = v27;
  if (v28)
  {
    unsigned __int8 v29 = [(CKKSKeychainView *)self zoneName];
    id v30 = sub_1000CD884(@"ckkskey", v29);

    id obj = v28;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v135 = v28;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Error fetching device states: %@", buf, 0xCu);
    }
    BOOL v31 = 1;
    goto LABEL_57;
  }
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id v32 = v27;
  id v33 = [v32 countByEnumeratingWithState:&v119 objects:v138 count:16];
  if (!v33) {
    goto LABEL_48;
  }
  id v35 = v33;
  uint64_t v36 = *(void *)v120;
  *(void *)&long long v34 = 138412546;
  long long v98 = v34;
  id obj = v32;
  do
  {
    int v37 = 0;
    do
    {
      if (*(void *)v120 != v36) {
        objc_enumerationMutation(obj);
      }
      int v38 = *(NSObject **)(*((void *)&v119 + 1) + 8 * (void)v37);
      int v39 = [v38 circlePeerID];
      if (v39)
      {
        int v40 = [v38 circlePeerID];
        id v30 = [@"spid-" stringByAppendingString:v40];
      }
      else
      {
        id v30 = 0;
      }

      int v41 = [v38 circlePeerID];
      if (([v11 containsObject:v41] & 1) != 0
        || v30 && [v11 containsObject:v30])
      {
      }
      else
      {
        int v42 = [v38 octagonPeerID];
        unsigned int v43 = [v11 containsObject:v42];

        if (!v43)
        {
          int v52 = [v38 storedCKRecord];
          int v53 = [v52 modificationDate];
          id v54 = [v53 compare:v106];

          id v55 = [(CKKSKeychainView *)self zoneName];
          BOOL v51 = sub_1000CD884(@"ckkskey", v55);

          BOOL v56 = os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT);
          if (v54 != (id)-1)
          {
            if (v56)
            {
              id v57 = [v38 circlePeerID];
              *(_DWORD *)buf = v98;
              v135 = v57;
              __int16 v136 = 2112;
              id v137 = v38;
              _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Device (%@) is not trusted, but very recent. Including in heuristic: %@", buf, 0x16u);
            }
            goto LABEL_33;
          }
          if (v56)
          {
            long long v58 = [v38 circlePeerID];
            *(_DWORD *)buf = v98;
            v135 = v58;
            __int16 v136 = 2112;
            id v137 = v38;
            _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Device (%@) is not trusted and from too long ago; ignoring device state (%@)",
              buf,
              0x16u);
          }
LABEL_38:

          goto LABEL_39;
        }
      }
      id v44 = [v38 storedCKRecord];
      __int16 v45 = [v44 modificationDate];
      id v46 = [v45 compare:v109];

      if (v46 == (id)-1)
      {
        BOOL v50 = [(CKKSKeychainView *)self zoneName];
        BOOL v51 = sub_1000CD884(@"ckkskey", v50);

        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v135 = v38;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Trusted device state (%@) is too old; ignoring",
            buf,
            0xCu);
        }
        goto LABEL_38;
      }
LABEL_33:
      id v47 = [v38 keyState];
      if ([v47 isEqualToString:@"ready"])
      {

LABEL_53:
        id v68 = [(CKKSKeychainView *)self zoneName];
        CFStringRef v69 = sub_1000CD884(@"ckkskey", v68);

        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v135 = v38;
          _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "Other device (%@) has keys; it should send them to us",
            buf,
            0xCu);
        }

        BOOL v31 = 1;
        goto LABEL_56;
      }
      id v48 = [v38 keyState];
      unsigned int v49 = [v48 isEqualToString:@"readypendingunlock"];

      if (v49) {
        goto LABEL_53;
      }
LABEL_39:

      int v37 = (char *)v37 + 1;
    }
    while (v35 != v37);
    id v32 = obj;
    id v59 = [obj countByEnumeratingWithState:&v119 objects:v138 count:16];
    id v35 = v59;
  }
  while (v59);
LABEL_48:

  uint64_t v24 = v105;
  long long v99 = [v105 currentTLKPointer];
  uint32_t v60 = [v99 currentKeyUUID];
  __int16 v61 = [v105 currentTLKPointer];
  id v62 = [v61 contextID];
  __int16 v63 = [v105 currentTLKPointer];
  unint64_t v64 = [v63 zoneID];
  id v118 = 0;
  CFStringRef v65 = +[CKKSTLKShareRecord allForUUID:v60 contextID:v62 zoneID:v64 error:&v118];
  id v30 = v118;

  id obj = v65;
  if (v30)
  {
    id v66 = [(CKKSKeychainView *)self zoneName];
    CFStringRef v67 = sub_1000CD884(@"ckkskey", v66);

    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v135 = v30;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "Error fetching device states: %@", buf, 0xCu);
    }
    BOOL v31 = 0;
    goto LABEL_86;
  }
  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id v30 = v65;
  id v74 = [v30 countByEnumeratingWithState:&v114 objects:v133 count:16];
  if (!v74)
  {
LABEL_71:

    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id v30 = v30;
    id v86 = [v30 countByEnumeratingWithState:&v110 objects:v132 count:16];
    if (v86)
    {
      id v87 = v86;
      uint64_t v88 = *(void *)v111;
LABEL_73:
      uint64_t v89 = 0;
      while (1)
      {
        if (*(void *)v111 != v88) {
          objc_enumerationMutation(v30);
        }
        id v90 = *(NSObject **)(*((void *)&v110 + 1) + 8 * v89);
        unint64_t v91 = [v90 storedCKRecord];
        v92 = [v91 modificationDate];
        id v93 = [v92 compare:v106];

        if (v93 == (id)1) {
          break;
        }
        if (v87 == (id)++v89)
        {
          id v87 = [v30 countByEnumeratingWithState:&v110 objects:v132 count:16];
          if (v87) {
            goto LABEL_73;
          }
          goto LABEL_79;
        }
      }
      long long v97 = [(CKKSKeychainView *)self zoneName];
      CFStringRef v67 = sub_1000CD884(@"ckkskey", v97);

      if (!os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_85;
      }
      *(_DWORD *)buf = 138412290;
      v135 = v90;
      long long v96 = "Untrusted TLK Share (%@) created very recently; other devices might have keys and should rejoin the circle ("
            "and send them to us)";
LABEL_84:
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, v96, buf, 0xCu);
      goto LABEL_85;
    }
LABEL_79:
    BOOL v31 = 0;
LABEL_56:
    uint64_t v24 = v105;
LABEL_57:
    id v71 = v102;
    CFStringRef v70 = v103;
    id v72 = v101;
    goto LABEL_58;
  }
  id v75 = v74;
  uint64_t v76 = *(void *)v115;
  v100 = v30;
LABEL_61:
  uint64_t v77 = 0;
  while (1)
  {
    if (*(void *)v115 != v76) {
      objc_enumerationMutation(v30);
    }
    v78 = *(NSObject **)(*((void *)&v114 + 1) + 8 * v77);
    v79 = [v78 senderPeerID];
    if ([v11 containsObject:v79]) {
      break;
    }

LABEL_69:
    if (v75 == (id)++v77)
    {
      id v75 = [v30 countByEnumeratingWithState:&v114 objects:v133 count:16];
      if (v75) {
        goto LABEL_61;
      }
      goto LABEL_71;
    }
  }
  unint64_t v80 = [v78 storedCKRecord];
  id v81 = [v80 modificationDate];
  id v82 = v75;
  uint64_t v83 = v76;
  id v84 = [v81 compare:v109];

  BOOL v85 = v84 == (id)1;
  uint64_t v76 = v83;
  id v75 = v82;
  id v30 = v100;
  if (!v85) {
    goto LABEL_69;
  }
  char v94 = [(CKKSKeychainView *)self zoneName];
  CFStringRef v67 = sub_1000CD884(@"ckkskey", v94);

  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v135 = v78;
    long long v96 = "Trusted TLK Share (%@) created recently; other devices have keys and should send them to us";
    goto LABEL_84;
  }
LABEL_85:
  BOOL v31 = 1;
  uint64_t v24 = v105;
LABEL_86:
  id v71 = v102;
  CFStringRef v70 = v103;
  id v72 = v101;

LABEL_58:
  return v31;
}

- (id)tlkMissingOperation:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100189EC0;
  v8[3] = &unk_100305698;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  uint64_t v6 = +[OctagonStateTransitionOperation named:@"tlk-missing" intending:v5 errorState:@"error" withBlockTakingSelf:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (BOOL)allowOutOfBandFetch:(id *)a3
{
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v4 = [(CKKSKeychainView *)self operationDependencies];
  id v5 = [v4 allCKKSManagedViews];

  id obj = v5;
  id v29 = [v5 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (!v29)
  {
    BOOL v20 = 0;
    goto LABEL_22;
  }
  uint64_t v30 = *(void *)v33;
  while (2)
  {
    for (i = 0; i != v29; i = (char *)i + 1)
    {
      if (*(void *)v33 != v30) {
        objc_enumerationMutation(obj);
      }
      id v7 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      id v8 = [(CKKSKeychainView *)self operationDependencies];
      id v9 = [v8 contextID];
      id v10 = [v7 zoneName];
      id v11 = +[CKKSZoneStateEntry contextID:v9 zoneName:v10];

      uint64_t v12 = [v11 lastFetchTime];
      if (!v12
        || (id v13 = (void *)v12,
            unsigned __int8 v14 = [v11 moreRecordsInCloudKit],
            v13,
            (v14 & 1) != 0))
      {
        BOOL v20 = 1;
        goto LABEL_21;
      }
      uint64_t v15 = [(CKKSKeychainView *)self operationDependencies];
      id v16 = [v15 contextID];
      id v17 = [v7 zoneID];
      id v31 = 0;
      int v18 = +[CKKSIncomingQueueEntry fetch:50 startingAtUUID:0 state:@"new" action:0 contextID:v16 zoneID:v17 error:&v31];
      id v19 = v31;

      BOOL v20 = v19 == 0;
      if (!v19)
      {
        if (![v18 count]) {
          goto LABEL_14;
        }
        id v25 = 0;
LABEL_20:

LABEL_21:
        goto LABEL_22;
      }
      uint64_t v21 = [v7 zoneID];
      unsigned int v22 = [v21 zoneName];
      id v23 = sub_1000CD884(@"ckks", v22);

      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = [v7 zoneName];
        *(_DWORD *)buf = 138412546;
        int v37 = v24;
        __int16 v38 = 2112;
        id v39 = v19;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Error fetching IQEs for zone %@: %@", buf, 0x16u);
      }
      if (a3)
      {
        id v25 = v19;
        *a3 = v25;
        goto LABEL_20;
      }
LABEL_14:
    }
    BOOL v20 = 0;
    id v29 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v29) {
      continue;
    }
    break;
  }
LABEL_22:

  return v20;
}

- (NSDate)earliestFetchTime
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v3 = [(CKKSKeychainView *)self operationDependencies];
  id v4 = [v3 views];

  id v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v5)
  {

LABEL_17:
    id v7 = +[NSDate distantPast];
    goto LABEL_18;
  }
  id v6 = v5;
  id v7 = 0;
  uint64_t v8 = *(void *)v24;
  id obj = v4;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v24 != v8) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      id v11 = [(CKKSKeychainView *)self operationDependencies];
      uint64_t v12 = [v11 contextID];
      id v13 = [v10 zoneName];
      unsigned __int8 v14 = +[CKKSZoneStateEntry contextID:v12 zoneName:v13];

      uint64_t v15 = [v14 lastFetchTime];

      if (!v15)
      {
        uint64_t v20 = +[NSDate distantPast];

        id v7 = (void *)v20;
        id v19 = obj;
        goto LABEL_14;
      }
      if (!v7
        || ([v14 lastFetchTime],
            id v16 = objc_claimAutoreleasedReturnValue(),
            id v17 = [v7 compare:v16],
            v16,
            v17 == (id)1))
      {
        uint64_t v18 = [v14 lastFetchTime];

        id v7 = (void *)v18;
      }
    }
    id v19 = obj;
    id v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v6) {
      continue;
    }
    break;
  }
LABEL_14:

  if (!v7) {
    goto LABEL_17;
  }
LABEL_18:

  return (NSDate *)v7;
}

- (NSSet)viewList
{
  uint64_t v3 = +[NSMutableSet set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(CKKSKeychainView *)self operationDependencies];
  id v5 = [v4 activeManagedViews];

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) zoneID];
        id v11 = [v10 zoneName];
        [v3 addObject:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return (NSSet *)v3;
}

- (id)viewsInState:(id)a3
{
  id v4 = a3;
  id v5 = [(CKKSKeychainView *)self operationDependencies];
  id v6 = [v5 viewsInState:v4];

  return v6;
}

- (BOOL)anyViewsInState:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(CKKSKeychainView *)self operationDependencies];
  id v6 = [v5 views];

  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) viewKeyHierarchyState];
        unsigned __int8 v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

- (id)loseTrustOperation:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10018AE48;
  v8[3] = &unk_100305698;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  id v6 = +[OctagonStateTransitionOperation named:@"lose-trust" intending:v5 errorState:@"error" withBlockTakingSelf:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (id)becomeReadyOperation:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10018B174;
  v8[3] = &unk_100305698;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  id v6 = +[OctagonStateTransitionOperation named:@"become-ready" intending:v5 errorState:@"error" withBlockTakingSelf:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = [(CKKSKeychainView *)self queue];
  dispatch_assert_queue_V2(v11);

  if ([v9 _onqueueContains:@"ck_account_logged_out"])
  {
    [v9 _onqueueRemoveFlag:@"ck_account_logged_out"];
    uint64_t v12 = [(CKKSKeychainView *)self zoneName];
    long long v13 = sub_1000CD884(@"ckkskey", v12);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CK account is not present", buf, 2u);
    }

    long long v14 = [(CKKSKeychainView *)self operationDependencies];
    [v14 setStateForActiveZones:@"loggedout"];

    long long v15 = [CKKSLocalResetOperation alloc];
    long long v16 = [(CKKSKeychainView *)self operationDependencies];
    id v17 = [(CKKSLocalResetOperation *)v15 initWithDependencies:v16 intendedState:@"loggedout" errorState:@"error"];

    goto LABEL_35;
  }
  if ([v9 _onqueueContains:@"ck_zone_missing"])
  {
    [v9 _onqueueRemoveFlag:@"ck_zone_missing"];
    uint64_t v18 = [(CKKSKeychainView *)self operationDependencies];
    [v18 setStateForActiveZones:@"initializing"];

    uint64_t v19 = +[OctagonStateTransitionOperation named:@"ck-zone-missing" entering:@"resetlocal"];
    goto LABEL_34;
  }
  if ([v9 _onqueueContains:@"ck_change_token_expired"])
  {
    [v9 _onqueueRemoveFlag:@"ck_change_token_expired"];
    uint64_t v20 = [(CKKSKeychainView *)self operationDependencies];
    [v20 setStateForActiveZones:@"initializing"];

    uint64_t v19 = +[OctagonStateTransitionOperation named:@"ck-token-expired" entering:@"resetlocal"];
    goto LABEL_34;
  }
  if ([v8 isEqualToString:@"loggedout"])
  {
    if (([v9 _onqueueContains:@"ck_account_logged_in"] & 1) != 0
      || (id)[(CKKSKeychainView *)self accountStatus] == (id)1)
    {
      [v9 _onqueueRemoveFlag:@"ck_account_logged_in"];
      uint64_t v21 = [(CKKSKeychainView *)self zoneName];
      unsigned int v22 = sub_1000CD884(@"ckkskey", v21);

      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "CloudKit account now present", buf, 2u);
      }
LABEL_14:

      uint64_t v19 = +[OctagonStateTransitionOperation named:@"ck-sign-in" entering:@"initializing"];
      goto LABEL_34;
    }
    uint64_t v28 = [(CKKSKeychainView *)self operationDependencies];
    [v28 setStateForAllViews:@"loggedout"];

    goto LABEL_27;
  }
  if ([v8 isEqualToString:@"wait_for_ck_account_status"])
  {
    if (([v9 _onqueueContains:@"ck_account_logged_in"] & 1) != 0
      || (id)[(CKKSKeychainView *)self accountStatus] == (id)1)
    {
      [v9 _onqueueRemoveFlag:@"ck_account_logged_in"];
      long long v23 = [(CKKSKeychainView *)self zoneName];
      unsigned int v22 = sub_1000CD884(@"ckkskey", v23);

      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "CloudKit account now present", buf, 2u);
      }
      goto LABEL_14;
    }
    if ([v9 _onqueueContains:@"ck_account_logged_out"])
    {
      [v9 _onqueueRemoveFlag:@"ck_account_logged_out"];
      uint64_t v30 = [(CKKSKeychainView *)self zoneName];
      long long v25 = sub_1000CD884(@"ckkskey", v30);

      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "No account available", buf, 2u);
      }
LABEL_25:

      long long v26 = [CKKSLocalResetOperation alloc];
      CFStringRef v27 = [(CKKSKeychainView *)self operationDependencies];
      id v17 = [(CKKSLocalResetOperation *)v26 initWithDependencies:v27 intendedState:@"loggedout" errorState:@"error"];

      goto LABEL_35;
    }
LABEL_54:
    id v17 = 0;
    goto LABEL_35;
  }
  if ([v8 isEqual:@"initializing"])
  {
    if ((id)[(CKKSKeychainView *)self accountStatus] == (id)3)
    {
      long long v24 = [(CKKSKeychainView *)self zoneName];
      long long v25 = sub_1000CD884(@"ckkskey", v24);

      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "CloudKit account is missing. Departing!", buf, 2u);
      }
      goto LABEL_25;
    }
    id v31 = [(CKKSKeychainView *)self operationDependencies];
    [v31 operateOnAllViews];

    long long v32 = [(CKKSKeychainView *)self operationDependencies];
    [v32 setStateForAllViews:@"initializing"];

    long long v33 = [CKKSCreateCKZoneOperation alloc];
    long long v34 = [(CKKSKeychainView *)self operationDependencies];
    id v17 = [(CKKSCreateCKZoneOperation *)v33 initWithDependencies:v34 intendedState:@"initialized" errorState:@"zonecreationfailed"];

    long long v35 = [(CKKSKeychainView *)self operationDependencies];
    uint64_t v36 = [v35 cloudkitRetryAfter];
    int v37 = [v36 operationDependency];
    [(CKKSLocalResetOperation *)v17 addNullableDependency:v37];

    __int16 v38 = [(CKKSKeychainView *)self operationDependencies];
    id v39 = [v38 cloudkitRetryAfter];
    goto LABEL_43;
  }
  if ([v8 isEqualToString:@"initialized"])
  {
    if ([v9 _onqueueContains:@"new_priority_views"]
      && (id)[(CKKSKeychainView *)self trustStatus] == (id)1)
    {
      [v9 _onqueueRemoveFlag:@"new_priority_views"];
      [(CKKSKeychainView *)self _onqueuePrioritizePriorityViews];
    }
    uint64_t v19 = [(CKKSKeychainView *)self performInitializedOperation];
    goto LABEL_34;
  }
  if ([v8 isEqualToString:@"error"])
  {
    if (![v9 _onqueueContains:@"ck_account_logged_in"])
    {
      id v47 = [(CKKSKeychainView *)self zoneName];
      id v48 = sub_1000CD884(@"ckkskey", v47);

      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v8;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Staying in error state %@", buf, 0xCu);
      }

      goto LABEL_54;
    }
    [v9 _onqueueRemoveFlag:@"ck_account_logged_in"];
    int v41 = [CKKSLocalResetOperation alloc];
    __int16 v38 = [(CKKSKeychainView *)self operationDependencies];
    CFStringRef v42 = @"initializing";
    CFStringRef v43 = @"error";
    goto LABEL_48;
  }
  if ([v8 isEqualToString:@"fixup_fetch_cip"])
  {
    id v44 = [CKKSFixupRefetchAllCurrentItemPointers alloc];
    __int16 v45 = [(CKKSKeychainView *)self operationDependencies];
    uint64_t v46 = +[CKOperationGroup CKKSGroupWithName:@"fixup"];
LABEL_57:
    unsigned int v49 = (void *)v46;
    BOOL v50 = [(CKKSFixupRefetchAllCurrentItemPointers *)v44 initWithOperationDependencies:v45 ckoperationGroup:v46];
LABEL_58:
    id v17 = (CKKSLocalResetOperation *)v50;

LABEL_59:
    [(CKKSKeychainView *)self setLastFixupOperation:v17];
    goto LABEL_35;
  }
  if ([v8 isEqualToString:@"fixup_fetch_tlkshares"])
  {
    id v44 = [CKKSFixupFetchAllTLKShares alloc];
    __int16 v45 = [(CKKSKeychainView *)self operationDependencies];
    uint64_t v46 = +[CKOperationGroup CKKSGroupWithName:@"fixup"];
    goto LABEL_57;
  }
  if ([v8 isEqualToString:@"fixup_local_reload"])
  {
    BOOL v51 = [CKKSFixupLocalReloadOperation alloc];
    __int16 v45 = [(CKKSKeychainView *)self operationDependencies];
    unsigned int v49 = +[CKOperationGroup CKKSGroupWithName:@"fixup"];
    CFStringRef v52 = @"fixup_resave_cdse";
    int v53 = v51;
    id v54 = v45;
    uint64_t v55 = 3;
LABEL_62:
    BOOL v50 = [(CKKSFixupLocalReloadOperation *)v53 initWithOperationDependencies:v54 fixupNumber:v55 ckoperationGroup:v49 entering:v52];
    goto LABEL_58;
  }
  if ([v8 isEqualToString:@"fixup_resave_cdse"])
  {
    BOOL v56 = [CKKSFixupResaveDeviceStateEntriesOperation alloc];
    __int16 v45 = [(CKKSKeychainView *)self operationDependencies];
    id v17 = [(CKKSFixupResaveDeviceStateEntriesOperation *)v56 initWithOperationDependencies:v45];
    goto LABEL_59;
  }
  if ([v8 isEqualToString:@"fixup_delete_tombstones"])
  {
    id v57 = [CKKSFixupLocalReloadOperation alloc];
    __int16 v45 = [(CKKSKeychainView *)self operationDependencies];
    unsigned int v49 = +[CKOperationGroup CKKSGroupWithName:@"fixup"];
    CFStringRef v52 = @"initialized";
    int v53 = v57;
    id v54 = v45;
    uint64_t v55 = 5;
    goto LABEL_62;
  }
  if ([v8 isEqualToString:@"resetzone"])
  {
    long long v58 = [(CKKSKeychainView *)self zoneName];
    id v59 = sub_1000CD884(@"ckkskey", v58);

    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v60 = [(CKKSKeychainView *)self operationDependencies];
      __int16 v61 = [v60 views];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v61;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Deleting the CloudKit Zones for %@", buf, 0xCu);
    }
    id v62 = [(CKKSKeychainView *)self operationDependencies];
    [v62 setStateForActiveZones:@"resetzone"];

    __int16 v63 = [CKKSDeleteCKZoneOperation alloc];
    unint64_t v64 = [(CKKSKeychainView *)self operationDependencies];
    id v17 = [(CKKSDeleteCKZoneOperation *)v63 initWithDependencies:v64 intendedState:@"resetlocal" errorState:@"resetzone"];

    goto LABEL_35;
  }
  if ([v8 isEqualToString:@"zone_deletion_failed_due_to_network_error"])
  {
    if ([v9 _onqueueContains:@"zone_deletion"])
    {
      [v9 _onqueueRemoveFlag:@"zone_deletion"];
      uint64_t v19 = +[OctagonStateTransitionOperation named:@"recover-from-zone-deletion-network-failure" entering:@"resetzone"];
      goto LABEL_34;
    }
    id v72 = [[OctagonPendingFlag alloc] initWithFlag:@"zone_deletion" conditions:2 delayInSeconds:0.2];
    CFStringRef v73 = [(CKKSKeychainView *)self stateMachine];
    goto LABEL_79;
  }
  if ([v8 isEqualToString:@"resetlocal"])
  {
    CFStringRef v65 = [(CKKSKeychainView *)self zoneName];
    id v66 = sub_1000CD884(@"ckkskey", v65);

    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v67 = [(CKKSKeychainView *)self operationDependencies];
      id v68 = [v67 views];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v68;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Resetting local data for %@", buf, 0xCu);
    }
    [(CKKSKeychainView *)self setLastNewTLKOperation:0];
    CFStringRef v69 = [(CKKSKeychainView *)self operationDependencies];
    [v69 setStateForActiveZones:@"initializing"];

    CFStringRef v70 = [CKKSLocalResetOperation alloc];
    id v71 = [(CKKSKeychainView *)self operationDependencies];
    id v17 = [(CKKSLocalResetOperation *)v70 initWithDependencies:v71 intendedState:@"initializing" errorState:@"error"];

    goto LABEL_35;
  }
  if ([v8 isEqualToString:@"zonecreationfailed"])
  {
    id v17 = +[OctagonStateTransitionOperation named:@"recover-from-cloudkit-failure" entering:@"initializing"];
    id v75 = [(CKKSKeychainView *)self operationDependencies];
    uint64_t v76 = [v75 cloudkitRetryAfter];
    uint64_t v77 = [v76 operationDependency];
    [(CKKSLocalResetOperation *)v17 addNullableDependency:v77];

    __int16 v38 = [(CKKSKeychainView *)self operationDependencies];
    id v39 = [v38 cloudkitRetryAfter];
LABEL_43:
    int v40 = v39;
    [v39 trigger];

LABEL_44:
    goto LABEL_35;
  }
  if ([v8 isEqualToString:@"zone_creation_failed_due_to_network_error"])
  {
    if ([v9 _onqueueContains:@"zone_creation"])
    {
      [v9 _onqueueRemoveFlag:@"zone_creation"];
      uint64_t v19 = +[OctagonStateTransitionOperation named:@"recover-from-zone-creation-network-failure" entering:@"initializing"];
      goto LABEL_34;
    }
    id v72 = [[OctagonPendingFlag alloc] initWithFlag:@"zone_creation" conditions:2 delayInSeconds:0.2];
    CFStringRef v73 = [(CKKSKeychainView *)self stateMachine];
LABEL_79:
    id v74 = v73;
    [v73 _onqueueHandlePendingFlagLater:v72];

    goto LABEL_54;
  }
  if ([v8 isEqualToString:@"lose_trust"])
  {
    if ([v9 _onqueueContains:@"trusted_operation_begin"])
    {
      [v9 _onqueueRemoveFlag:@"trusted_operation_begin"];
      +[OctagonStateTransitionOperation named:@"begin-trusted-operation" entering:@"initialized"];
    }
    else
    {
      [(CKKSKeychainView *)self loseTrustOperation:@"waitfortrust"];
    uint64_t v19 = };
    goto LABEL_34;
  }
  if ([v8 isEqualToString:@"waitfortrust"])
  {
    if ((id)[(CKKSKeychainView *)self trustStatus] == (id)1)
    {
      v78 = [(CKKSKeychainView *)self zoneName];
      v79 = sub_1000CD884(@"ckkskey", v78);

      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "Beginning trusted state machine operation", buf, 2u);
      }

      uint64_t v19 = +[OctagonStateTransitionOperation named:@"begin-trusted-operation" entering:@"initialized"];
      goto LABEL_34;
    }
    if ([v9 _onqueueContains:@"fetch_requested"])
    {
      [v9 _onqueueRemoveFlag:@"fetch_requested"];
      uint64_t v19 = +[OctagonStateTransitionOperation named:@"fetch-requested" entering:@"begin_fetch"];
      goto LABEL_34;
    }
    if ([v9 _onqueueContains:@"key_process_requested"])
    {
      [v9 _onqueueRemoveFlag:@"key_process_requested"];
      uint64_t v19 = +[OctagonStateTransitionOperation named:@"begin-trusted-operation" entering:@"process_key_hierarchy"];
      goto LABEL_34;
    }
    if ([v9 _onqueueContains:@"key_set"])
    {
      [v9 _onqueueRemoveFlag:@"key_set"];
      uint64_t v19 = +[OctagonStateTransitionOperation named:@"provide-key-set" entering:@"provide_key_hieararchy_untrusted"];
      goto LABEL_34;
    }
LABEL_27:
    if ([v9 _onqueueContains:@"24_hr_notification"]) {
      [v9 _onqueueRemoveFlag:@"24_hr_notification"];
    }
    goto LABEL_54;
  }
  if ([v8 isEqualToString:@"provide_key_hieararchy"])
  {
    unint64_t v80 = [CKKSNewTLKOperation alloc];
    id v81 = [(CKKSKeychainView *)self operationDependencies];
    id v82 = [(CKKSKeychainView *)self lastNewTLKOperation];
    uint64_t v83 = [v82 keysets];
    CFStringRef v84 = @"become_ready";
LABEL_102:
    id v17 = [(CKKSNewTLKOperation *)v80 initWithDependencies:v81 rollTLKIfPresent:0 preexistingPendingKeySets:v83 intendedState:v84 errorState:@"error"];

    [(CKKSKeychainView *)self setLastNewTLKOperation:v17];
    goto LABEL_35;
  }
  if ([v8 isEqualToString:@"provide_key_hieararchy_untrusted"])
  {
    unint64_t v80 = [CKKSNewTLKOperation alloc];
    id v81 = [(CKKSKeychainView *)self operationDependencies];
    id v82 = [(CKKSKeychainView *)self lastNewTLKOperation];
    uint64_t v83 = [v82 keysets];
    CFStringRef v84 = @"waitfortrust";
    goto LABEL_102;
  }
  if ([v8 isEqualToString:@"handle_all_views"])
  {
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v214[0] = _NSConcreteStackBlock;
    v214[1] = 3221225472;
    v214[2] = sub_100190114;
    v214[3] = &unk_1003077F0;
    objc_copyWeak(&v215, (id *)buf);
    id v17 = +[OctagonStateTransitionOperation named:@"handle-all-views" intending:@"initializing" errorState:@"initializing" withBlockTakingSelf:v214];
    objc_destroyWeak(&v215);
    objc_destroyWeak((id *)buf);
    goto LABEL_35;
  }
  if ([v8 isEqualToString:@"become_ready"])
  {
    uint64_t v19 = [(CKKSKeychainView *)self becomeReadyOperation:@"ready"];
    goto LABEL_34;
  }
  if ([v8 isEqualToString:@"ready"])
  {
    [v9 _onqueueRemoveFlag:@"trusted_operation_begin"];
    if ([v9 _onqueueContains:@"device_unlocked"])
    {
      [v9 _onqueueRemoveFlag:@"device_unlocked"];
      uint64_t v19 = +[OctagonStateTransitionOperation named:@"key-state-after-unlock" entering:@"initialized"];
      goto LABEL_34;
    }
    if ([(CKKSKeychainView *)self keyStateFullRefetchRequested])
    {
      id v102 = [(CKKSKeychainView *)self zoneName];
      uint64_t v103 = sub_1000CD884(@"ckkskey", v102);

      if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = [(CKKSKeychainView *)self keyStateFullRefetchRequested];
        _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "Kicking off a full key refetch based on request:%d", buf, 8u);
      }

      char v104 = [(CKKSKeychainView *)self operationDependencies];
      [v104 setStateForActiveZones:@"fetching"];

      uint64_t v19 = +[OctagonStateTransitionOperation named:@"full-refetch" entering:@"needrefetch"];
      goto LABEL_34;
    }
    if (![v9 _onqueueContains:@"fetch_requested"])
    {
      if ([v9 _onqueueContains:@"key_process_requested"])
      {
        [v9 _onqueueRemoveFlag:@"key_process_requested"];
        v109 = [(CKKSKeychainView *)self zoneName];
        long long v110 = sub_1000CD884(@"ckkskey", v109);

        if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "Kicking off a key reprocess based on request", buf, 2u);
        }

        long long v111 = [(CKKSKeychainView *)self operationDependencies];
        [v111 setStateForActiveCKKSManagedViews:@"process_key_hierarchy"];

        uint64_t v19 = +[OctagonStateTransitionOperation named:@"key-process" entering:@"process_key_hierarchy"];
        goto LABEL_34;
      }
      if ([v9 _onqueueContains:@"key_set"])
      {
        [v9 _onqueueRemoveFlag:@"key_set"];
        uint64_t v19 = +[OctagonStateTransitionOperation named:@"provide-key-set" entering:@"provide_key_hieararchy"];
        goto LABEL_34;
      }
      if ((id)[(CKKSKeychainView *)self trustStatus] != (id)1)
      {
        long long v122 = [(CKKSKeychainView *)self zoneName];
        id v123 = sub_1000CD884(@"ckkskey", v122);

        if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEFAULT, "In ready, but there's no trust; going into waitfortrust",
            buf,
            2u);
        }

        uint64_t v19 = +[OctagonStateTransitionOperation named:@"trust-gone" entering:@"lose_trust"];
        goto LABEL_34;
      }
      if ([v9 _onqueueContains:@"trusted_peers_changed"])
      {
        [v9 _onqueueRemoveFlag:@"trusted_peers_changed"];
        long long v119 = [(CKKSKeychainView *)self zoneName];
        long long v120 = sub_1000CD884(@"ckkskey", v119);

        if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEFAULT, "Received a nudge that the trusted peers set might have changed! Reprocessing.", buf, 2u);
        }

        long long v121 = [(CKKSKeychainView *)self operationDependencies];
        [v121 setStateForActiveCKKSManagedViews:@"process_key_hierarchy"];

        uint64_t v19 = +[OctagonStateTransitionOperation named:@"trusted-peers-changed" entering:@"process_key_hierarchy"];
        goto LABEL_34;
      }
      if ([v9 _onqueueContains:@"check_queues"])
      {
        [v9 _onqueueRemoveFlag:@"check_queues"];
        uint64_t v19 = +[OctagonStateTransitionOperation named:@"check-queues" entering:@"become_ready"];
        goto LABEL_34;
      }
      if ([v9 _onqueueContains:@"24_hr_notification"])
      {
        [v9 _onqueueRemoveFlag:@"24_hr_notification"];
        uint64_t v19 = +[OctagonStateTransitionOperation named:@"24-hr-check" entering:@"initialized"];
        goto LABEL_34;
      }
      if ([v9 _onqueueContains:@"item_reencryption_needed"])
      {
        [v9 _onqueueRemoveFlag:@"item_reencryption_needed"];
        uint64_t v19 = +[OctagonStateTransitionOperation named:@"reencrypt" entering:@"reencrypt_outgoing_items"];
        goto LABEL_34;
      }
      if ([v9 _onqueueContains:@"process_incoming_queue"])
      {
        [v9 _onqueueRemoveFlag:@"process_incoming_queue"];
        uint64_t v19 = +[OctagonStateTransitionOperation named:@"process-incoming" entering:@"process_incoming_queue"];
        goto LABEL_34;
      }
      if ([v9 _onqueueContains:@"dropped_items"])
      {
        [v9 _onqueueRemoveFlag:@"dropped_items"];
        v168 = [(CKKSKeychainView *)self zoneName];
        v169 = sub_1000CD884(@"ckkskey", v168);

        if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v169, OS_LOG_TYPE_DEFAULT, "Launching a scan operation to find dropped items", buf, 2u);
        }

        uint64_t v19 = +[OctagonStateTransitionOperation named:@"scan" entering:@"scan_local_items"];
        goto LABEL_34;
      }
      if ([v9 _onqueueContains:@"process_outgoing_queue"])
      {
        if ([v9 _onqueueContains:@"oqo_token"])
        {
          [v9 _onqueueRemoveFlag:@"process_outgoing_queue"];
          [v9 _onqueueRemoveFlag:@"oqo_token"];
          uint64_t v19 = +[OctagonStateTransitionOperation named:@"oqo" entering:@"process_outgoing_queue"];
          goto LABEL_34;
        }
        v174 = [(CKKSKeychainView *)self outgoingQueueOperationScheduler];
        [v174 trigger];
      }
      if ([v9 _onqueueContains:@"new_priority_views"]) {
        [v9 _onqueueRemoveFlag:@"new_priority_views"];
      }
      long long v212 = 0u;
      long long v213 = 0u;
      long long v210 = 0u;
      long long v211 = 0u;
      v175 = [(CKKSKeychainView *)self operationDependencies];
      v176 = [v175 views];

      id v177 = [v176 countByEnumeratingWithState:&v210 objects:v221 count:16];
      if (v177)
      {
        uint64_t v178 = *(void *)v211;
        do
        {
          for (i = 0; i != v177; i = (char *)i + 1)
          {
            if (*(void *)v211 != v178) {
              objc_enumerationMutation(v176);
            }
            [*(id *)(*((void *)&v210 + 1) + 8 * i) launchComplete];
          }
          id v177 = [v176 countByEnumeratingWithState:&v210 objects:v221 count:16];
        }
        while (v177);
      }

      v180 = [(CKKSKeychainView *)self operationDependencies];
      v181 = [v180 overallLaunch];
      [v181 launch];

      v182 = +[CKKSAnalytics logger];
      v183 = [(CKKSKeychainView *)self operationDependencies];
      v184 = [v183 overallLaunch];
      [v182 noteLaunchSequence:v184];

      goto LABEL_54;
    }
    [v9 _onqueueRemoveFlag:@"fetch_requested"];
    id v105 = [(CKKSKeychainView *)self zoneName];
    id v106 = sub_1000CD884(@"ckkskey", v105);

    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "Kicking off a key refetch based on request", buf, 2u);
    }
LABEL_141:

    uint64_t v19 = +[OctagonStateTransitionOperation named:@"fetch-requested" entering:@"begin_fetch"];
    goto LABEL_34;
  }
  if ([v8 isEqualToString:@"begin_fetch"])
  {
    [v9 _onqueueRemoveFlag:@"fetch_complete"];
    if ([v9 _onqueueContains:@"new_priority_views"]
      && (id)[(CKKSKeychainView *)self trustStatus] == (id)1)
    {
      [v9 _onqueueRemoveFlag:@"new_priority_views"];
      [(CKKSKeychainView *)self _onqueuePrioritizePriorityViews];
    }
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    BOOL v85 = [(CKKSKeychainView *)self operationDependencies];
    id v86 = [v85 currentFetchReasons];
    id v191 = [v86 copy];

    id v87 = [(CKKSKeychainView *)self operationDependencies];
    uint64_t v88 = [v87 currentFetchReasons];
    [v88 removeAllObjects];

    uint64_t v89 = [(CKKSKeychainView *)self zoneChangeFetcher];
    v190 = [v89 requestSuccessfulFetchForManyReasons:v191];

    v207[0] = _NSConcreteStackBlock;
    v207[1] = 3221225472;
    v207[2] = sub_100190310;
    v207[3] = &unk_1003077A0;
    v189 = &v208;
    objc_copyWeak(&v208, &location);
    v192 = +[CKKSResultOperation named:@"post-fetch" withBlock:v207];
    [v192 addDependency:v190];
    [(CKKSKeychainView *)self scheduleOperation:v192];
    id v90 = [(CKKSKeychainView *)self operationDependencies];
    unint64_t v91 = [v90 currentFetchReasons];
    unsigned int v195 = [v91 containsObject:@"keyhierarchy"];

    long long v205 = 0u;
    long long v206 = 0u;
    long long v203 = 0u;
    long long v204 = 0u;
    v92 = [(CKKSKeychainView *)self operationDependencies];
    id obj = [v92 views];

    id v93 = [obj countByEnumeratingWithState:&v203 objects:v220 count:16];
    if (v93)
    {
      uint64_t v194 = *(void *)v204;
      do
      {
        for (j = 0; j != v93; j = (char *)j + 1)
        {
          if (*(void *)v204 != v194) {
            objc_enumerationMutation(obj);
          }
          char v95 = *(void **)(*((void *)&v203 + 1) + 8 * (void)j);
          long long v96 = [v95 zoneName:v189];
          long long v97 = sub_1000CD884(@"fetch", v96);

          if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v95;
            __int16 v218 = 1024;
            unsigned int v219 = v195;
            _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "Current state is %@, khf: %d", buf, 0x12u);
          }

          if ((v195 & 1) == 0)
          {
            long long v98 = [v95 viewKeyHierarchyState];
            unsigned __int8 v99 = [v98 isEqualToString:@"ready"];

            if (v99) {
              continue;
            }
          }
          [v95 setViewKeyHierarchyState:@"fetching"];
        }
        id v93 = [obj countByEnumeratingWithState:&v203 objects:v220 count:16];
      }
      while (v93);
    }

    v100 = [(CKKSKeychainView *)self operationDependencies];
    id v101 = [v100 overallLaunch];
    [v101 addEvent:@"begin-fetch"];

    id v17 = +[OctagonStateTransitionOperation named:@"waiting-for-fetch" entering:@"fetching"];

    objc_destroyWeak(v189);
    objc_destroyWeak(&location);
    goto LABEL_35;
  }
  if ([v8 isEqualToString:@"fetching"])
  {
    if ([v9 _onqueueContains:@"fetch_complete"])
    {
      [v9 _onqueueRemoveFlag:@"fetch_complete"];
      uint64_t v19 = +[OctagonStateTransitionOperation named:@"fetch-complete" entering:@"fetchcomplete"];
      goto LABEL_34;
    }
    if ([v9 _onqueueContains:@"new_priority_views"]
      && (id)[(CKKSKeychainView *)self trustStatus] == (id)1)
    {
      [v9 _onqueueRemoveFlag:@"new_priority_views"];
      [(CKKSKeychainView *)self _onqueuePrioritizePriorityViews];
    }
    goto LABEL_54;
  }
  if ([v8 isEqualToString:@"fetchcomplete"])
  {
    v107 = [(CKKSKeychainView *)self operationDependencies];
    v108 = [v107 overallLaunch];
    [v108 addEvent:@"fetch-complete"];

    uint64_t v19 = +[OctagonStateTransitionOperation named:@"post-fetch-process" entering:@"process_key_hierarchy"];
    goto LABEL_34;
  }
  if ([v8 isEqualToString:@"process_key_hierarchy"])
  {
    if ([v9 _onqueueContains:@"fetch_requested"])
    {
      [v9 _onqueueRemoveFlag:@"fetch_requested"];
      id v106 = sub_1000CD884(@"ckkskey", 0);
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "Kicking off a fetch based on request", buf, 2u);
      }
      goto LABEL_141;
    }
    [v9 _onqueueRemoveFlag:@"key_process_requested"];
    long long v112 = [(CKKSKeychainView *)self operationDependencies];
    [v112 setStateForActiveCKKSManagedViews:@"process_key_hierarchy"];

    long long v113 = [(CKKSKeychainView *)self operationDependencies];
    [v113 setStateForActiveExternallyManagedViews:@"ready"];

    long long v114 = [(CKKSKeychainView *)self operationDependencies];
    long long v115 = [v114 overallLaunch];
    [v115 addEvent:@"process_key_hierarchy"];

    long long v116 = [CKKSProcessReceivedKeysOperation alloc];
    long long v117 = [(CKKSKeychainView *)self operationDependencies];
    id v118 = [(CKKSProcessReceivedKeysOperation *)v116 initWithDependencies:v117 allowFullRefetchResult:[(CKKSKeychainView *)self keyStateMachineRefetched] ^ 1 intendedState:@"check_zone_hierarchies" errorState:@"error"];
LABEL_162:
    id v17 = (CKKSLocalResetOperation *)v118;

    goto LABEL_35;
  }
  if ([v8 isEqualToString:@"check_zone_hierarchies"])
  {
    if ([(CKKSKeychainView *)self anyViewsInState:@"unhealthy"])
    {
      uint64_t v19 = +[OctagonStateTransitionOperation named:@"unhealthy" entering:@"unhealthy"];
      goto LABEL_34;
    }
    if ([(CKKSKeychainView *)self anyViewsInState:@"tlkmissing"])
    {
      uint64_t v19 = +[OctagonStateTransitionOperation named:@"tlk-missing" entering:@"tlkmissing"];
      goto LABEL_34;
    }
    if ([(CKKSKeychainView *)self anyViewsInState:@"newtlksfailed"])
    {
      long long v124 = [(CKKSKeychainView *)self operationDependencies];
      long long v125 = [v124 currentFetchReasons];
      [v125 addObject:@"conflict"];

      uint64_t v19 = +[OctagonStateTransitionOperation named:@"newtlks-failed" entering:@"begin_fetch"];
      goto LABEL_34;
    }
    if ([(CKKSKeychainView *)self anyViewsInState:@"waitfortrust"])
    {
      long long v128 = [(CKKSKeychainView *)self operationDependencies];
      long long v129 = [v128 allViews];
      long long v130 = [(CKKSKeychainView *)self operationDependencies];
      long long v131 = [v130 views];
      unsigned __int8 v132 = [v129 isEqualToSet:v131];

      if ((v132 & 1) == 0)
      {
        *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
        objc_initWeak((id *)buf, self);
        v201[0] = _NSConcreteStackBlock;
        v201[1] = 3221225472;
        v201[2] = sub_100190370;
        v201[3] = &unk_1003077F0;
        objc_copyWeak(&v202, (id *)buf);
        id v17 = +[OctagonStateTransitionOperation named:@"handle-all-views-trust-loss" intending:@"initializing" errorState:@"initializing" withBlockTakingSelf:v201];
        objc_destroyWeak(&v202);
        objc_destroyWeak((id *)buf);
        goto LABEL_35;
      }
      uint64_t v19 = +[OctagonStateTransitionOperation named:@"no-trust" entering:@"lose_trust"];
LABEL_34:
      id v17 = (CKKSLocalResetOperation *)v19;
      goto LABEL_35;
    }
    if ([(CKKSKeychainView *)self anyViewsInState:@"needrefetch"])
    {
      long long v117 = [(CKKSKeychainView *)self viewsInState:@"needrefetch"];
      id v137 = [(CKKSKeychainView *)self operationDependencies];
      [v137 operateOnSelectViews:v117];

      id v118 = +[OctagonStateTransitionOperation named:@"reset-views" entering:@"needrefetch"];
      goto LABEL_162;
    }
    if ([(CKKSKeychainView *)self anyViewsInState:@"waitforunlock"])
    {
      v144 = [[OctagonPendingFlag alloc] initWithFlag:@"device_unlocked" conditions:1];
      [v10 _onqueueHandlePendingFlagLater:v144];
    }
    if ([(CKKSKeychainView *)self anyViewsInState:@"waitfortlkcreation"])
    {
      v145 = sub_1000CD884(@"ckkskey", 0);
      if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_DEFAULT, "Requesting TLK upload", buf, 2u);
      }

      v146 = [(CKKSKeychainView *)self suggestTLKUpload];
      [v146 trigger];
    }
    v196 = +[NSMutableSet set];
    long long v199 = 0u;
    long long v200 = 0u;
    long long v197 = 0u;
    long long v198 = 0u;
    v147 = [(CKKSKeychainView *)self operationDependencies];
    v148 = [v147 views];

    id v149 = [v148 countByEnumeratingWithState:&v197 objects:v216 count:16];
    if (v149)
    {
      uint64_t v150 = *(void *)v198;
      do
      {
        for (k = 0; k != v149; k = (char *)k + 1)
        {
          if (*(void *)v198 != v150) {
            objc_enumerationMutation(v148);
          }
          v152 = [*(id *)(*((void *)&v197 + 1) + 8 * (void)k) viewKeyHierarchyState];
          [v196 addObject:v152];
        }
        id v149 = [v148 countByEnumeratingWithState:&v197 objects:v216 count:16];
      }
      while (v149);
    }

    v153 = sub_1000B1398();
    unsigned __int8 v154 = [v196 isSubsetOfSet:v153];

    if ((v154 & 1) == 0)
    {
      v155 = sub_1000CD884(@"ckks", 0);
      if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v196;
        _os_log_impl((void *)&_mh_execute_header, v155, OS_LOG_TYPE_DEFAULT, "Misbehaving key states: %@", buf, 0xCu);
      }
    }
    if ([v9 _onqueueContains:@"key_set"])
    {
      [v9 _onqueueRemoveFlag:@"key_set"];
      v156 = [CKKSNewTLKOperation alloc];
      v157 = [(CKKSKeychainView *)self operationDependencies];
      v158 = [(CKKSKeychainView *)self lastNewTLKOperation];
      v159 = [v158 keysets];
      id v17 = [(CKKSNewTLKOperation *)v156 initWithDependencies:v157 rollTLKIfPresent:0 preexistingPendingKeySets:v159 intendedState:@"check_zone_hierarchies" errorState:@"error"];

      [(CKKSKeychainView *)self setLastNewTLKOperation:v17];
    }
    else
    {
      id v17 = +[OctagonStateTransitionOperation named:@"heal-tlk-shares" entering:@"heal_tlk_shares"];
    }
  }
  else
  {
    if ([v8 isEqualToString:@"tlkmissing"])
    {
      uint64_t v19 = [(CKKSKeychainView *)self tlkMissingOperation:@"check_zone_hierarchies"];
      goto LABEL_34;
    }
    if ([v8 isEqualToString:@"heal_tlk_shares"])
    {
      int v41 = [CKKSHealTLKSharesOperation alloc];
      __int16 v38 = [(CKKSKeychainView *)self operationDependencies];
      CFStringRef v42 = @"process_incoming_queue";
      CFStringRef v43 = @"healtlksharesfailed";
LABEL_48:
      id v17 = [(CKKSLocalResetOperation *)v41 initWithDependencies:v38 intendedState:v42 errorState:v43];
      goto LABEL_44;
    }
    if ([v8 isEqualToString:@"needrefetch"])
    {
      long long v126 = [(CKKSKeychainView *)self zoneName];
      long long v127 = sub_1000CD884(@"ckkskey", v126);

      if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "Starting a key hierarchy full refetch", buf, 2u);
      }

      [(CKKSKeychainView *)self setKeyStateMachineRefetched:1];
      [(CKKSKeychainView *)self setKeyStateFullRefetchRequested:0];
      uint64_t v19 = +[OctagonStateTransitionOperation named:@"fetch-complete" entering:@"resetlocal"];
      goto LABEL_34;
    }
    if ([v8 isEqualToString:@"healtlksharesfailed"])
    {
      id v133 = [(CKKSKeychainView *)self zoneName];
      id v134 = sub_1000CD884(@"ckkskey", v133);

      if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_DEFAULT, "Creating new TLK shares didn't work. Attempting to refetch!", buf, 2u);
      }

      v135 = [(CKKSKeychainView *)self operationDependencies];
      __int16 v136 = [v135 currentFetchReasons];
      [v136 addObject:@"conflict"];

      uint64_t v19 = +[OctagonStateTransitionOperation named:@"heal-tlks-failed" entering:@"begin_fetch"];
      goto LABEL_34;
    }
    if ([v8 isEqualToString:@"unhealthy"])
    {
      BOOL v138 = (id)[(CKKSKeychainView *)self trustStatus] == (id)1;
      id v139 = [(CKKSKeychainView *)self zoneName];
      id v140 = sub_1000CD884(@"ckkskey", v139);

      BOOL v141 = os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT);
      if (!v138)
      {
        if (v141)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v140, OS_LOG_TYPE_DEFAULT, "Looks like the key hierarchy is unhealthy, but we're untrusted.", buf, 2u);
        }

        uint64_t v19 = +[OctagonStateTransitionOperation named:@"unhealthy-lacking-trust" entering:@"lose_trust"];
        goto LABEL_34;
      }
      if (v141)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v140, OS_LOG_TYPE_DEFAULT, "Looks like the key hierarchy is unhealthy. Launching fix.", buf, 2u);
      }

      v142 = [CKKSHealKeyHierarchyOperation alloc];
      v143 = [(CKKSKeychainView *)self operationDependencies];
      id v17 = [(CKKSHealKeyHierarchyOperation *)v142 initWithDependencies:v143 allowFullRefetchResult:[(CKKSKeychainView *)self keyStateMachineRefetched] ^ 1 intending:@"check_zone_hierarchies" errorState:@"error"];
    }
    else
    {
      if (![v8 isEqualToString:@"process_incoming_queue"])
      {
        if ([v8 isEqualToString:@"class_a_incoming_items_remaining"])
        {
          uint64_t v19 = +[OctagonStateTransitionOperation named:@"iqo-errored" entering:@"become_ready"];
          goto LABEL_34;
        }
        if ([v8 isEqualToString:@"scan_local_items"])
        {
          [v9 _onqueueRemoveFlag:@"dropped_items"];
          v170 = [CKKSScanLocalItemsOperation alloc];
          v171 = [(CKKSKeychainView *)self operationDependencies];
          id v17 = [(CKKSScanLocalItemsOperation *)v170 initWithDependencies:v171 intending:@"become_ready" errorState:@"error" ckoperationGroup:0];

          [(CKKSKeychainView *)self setInitiatedLocalScan:1];
          goto LABEL_35;
        }
        if ([v8 isEqualToString:@"reencrypt_outgoing_items"])
        {
          v172 = [CKKSReencryptOutgoingItemsOperation alloc];
          v173 = [(CKKSKeychainView *)self operationDependencies];
          id v17 = [(CKKSReencryptOutgoingItemsOperation *)v172 initWithDependencies:v173 intendedState:@"become_ready" errorState:@"error" holdOperation:0];

          [(CKKSKeychainView *)self setLastReencryptOutgoingItemsOperation:v17];
          goto LABEL_35;
        }
        if ([v8 isEqualToString:@"process_outgoing_queue"])
        {
          [v9 _onqueueRemoveFlag:@"process_outgoing_queue"];
          v185 = [CKKSOutgoingQueueOperation alloc];
          v186 = [(CKKSKeychainView *)self operationDependencies];
          id v17 = [(CKKSOutgoingQueueOperation *)v185 initWithDependencies:v186 intending:@"become_ready" ckErrorState:@"process_outgoing_queue_failed" errorState:@"initialized"];

          v187 = [(CKKSKeychainView *)self holdOutgoingQueueOperation];
          [(CKKSLocalResetOperation *)v17 addNullableDependency:v187];

          v188 = [(CKKSKeychainView *)self outgoingQueueOperations];
          [(CKKSLocalResetOperation *)v17 linearDependencies:v188];

          [(CKKSKeychainView *)self setLastOutgoingQueueOperation:v17];
          goto LABEL_35;
        }
        if ([v8 isEqualToString:@"process_outgoing_queue_failed"])
        {
          uint64_t v19 = +[OctagonStateTransitionOperation named:@"oqo-failure" entering:@"become_ready"];
          goto LABEL_34;
        }
        goto LABEL_54;
      }
      [v9 _onqueueRemoveFlag:@"process_incoming_queue"];
      id v160 = [v9 _onqueueContains:@"policy_fresh"];
      [v9 _onqueueRemoveFlag:@"policy_fresh"];
      if (v160)
      {
        v161 = sub_1000CD884(@"ckksincoming", 0);
        if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v161, OS_LOG_TYPE_DEFAULT, "Going to process the incoming queue with a fresh policy", buf, 2u);
        }
      }
      v162 = [CKKSIncomingQueueOperation alloc];
      v163 = [(CKKSKeychainView *)self operationDependencies];
      id v17 = [(CKKSIncomingQueueOperation *)v162 initWithDependencies:v163 intending:@"become_ready" pendingClassAItemsRemainingState:@"class_a_incoming_items_remaining" errorState:@"become_ready" handleMismatchedViewItems:v160];

      v164 = [(CKKSKeychainView *)self resultsOfNextIncomingQueueOperationOperation];

      if (v164)
      {
        v165 = [(CKKSKeychainView *)self resultsOfNextIncomingQueueOperationOperation];
        [v165 addSuccessDependency:v17];

        v166 = [(CKKSKeychainView *)self resultsOfNextIncomingQueueOperationOperation];
        [(CKKSKeychainView *)self scheduleOperation:v166];

        [(CKKSKeychainView *)self setResultsOfNextIncomingQueueOperationOperation:0];
      }
      [(CKKSKeychainView *)self setLastIncomingQueueOperation:v17];
      v167 = [(CKKSKeychainView *)self holdIncomingQueueOperation];
      [(CKKSLocalResetOperation *)v17 addNullableDependency:v167];
    }
  }
LABEL_35:

  return v17;
}

- (void)_onqueuePokeKeyStateMachine
{
  uint64_t v3 = [(CKKSKeychainView *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CKKSKeychainView *)self stateMachine];
  [v4 _onqueuePokeStateMachine];
}

- (void)keyStateMachineRequestProcess
{
  id v2 = [(CKKSKeychainView *)self stateMachine];
  [v2 handleFlag:@"key_process_requested"];
}

- (id)rpcResetCloudKit:(id)a3 reply:(id)a4
{
  id v25 = a3;
  CFStringRef v27 = (void (**)(id, id))a4;
  id v35 = 0;
  LOBYTE(a4) = [(CKKSKeychainView *)self waitUntilReadyForRPCForOperation:@"reset-cloudkit" fast:0 errorOnNoCloudKitAccount:1 errorOnPolicyMissing:1 error:&v35];
  id v6 = v35;
  long long v26 = v6;
  if (a4)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v7 = [(CKKSKeychainView *)self zoneName];
    id v8 = sub_1000CD884(@"ckksreset", v7);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Requesting reset of CK zone (logged in)", buf, 2u);
    }

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100190A88;
    v28[3] = &unk_100305698;
    objc_copyWeak(&v30, &location);
    id v29 = v25;
    long long v24 = +[OctagonStateTransitionOperation named:@"set-zones" intending:@"resetzone" errorState:@"error" withBlockTakingSelf:v28];
    CFStringRef v47 = @"initializing";
    v45[0] = @"initialized";
    id v9 = +[OctagonStateTransitionPathStep success];
    v45[1] = @"loggedout";
    v46[0] = v9;
    id v10 = +[OctagonStateTransitionPathStep success];
    v46[1] = v10;
    unsigned __int8 v11 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
    id v48 = v11;
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];

    long long v13 = [(CKKSKeychainView *)self stateMachine];
    v44[0] = @"ready";
    v44[1] = @"initialized";
    v44[2] = @"fetchcomplete";
    v44[3] = @"process_key_hierarchy";
    v44[4] = @"waitfortrust";
    v44[5] = @"loggedout";
    v44[6] = @"error";
    long long v14 = +[NSArray arrayWithObjects:v44 count:7];
    long long v15 = +[NSSet setWithArray:v14];
    CFStringRef v42 = @"resetzone";
    v40[1] = @"resetzone";
    v41[0] = v12;
    v40[0] = @"resetlocal";
    v38[1] = @"resetzone";
    v39[0] = v12;
    int v37 = v12;
    v38[0] = @"resetlocal";
    CFStringRef v36 = @"resetlocal";
    long long v16 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    v39[1] = v16;
    id v17 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
    v41[1] = v17;
    uint64_t v18 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
    CFStringRef v43 = v18;
    uint64_t v19 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    uint64_t v20 = +[OctagonStateTransitionPath pathFromDictionary:v19];
    uint64_t v21 = [v13 doWatchedStateMachineRPC:@"ckks-cloud-reset" sourceStates:v15 path:v20 transitionOp:v24 reply:v27];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  else
  {
    v27[2](v27, v6);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100190A7C;
    v33[3] = &unk_1003056C0;
    id v34 = v26;
    uint64_t v21 = +[CKKSResultOperation named:@"fail" withBlockTakingSelf:v33];
    unsigned int v22 = [(CKKSKeychainView *)self operationQueue];
    [v22 addOperation:v21];
  }

  return v21;
}

- (id)rpcResetLocal:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v22 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v7 = [(CKKSKeychainView *)self zoneName];
  id v8 = sub_1000CD884(@"ckksreset", v7);

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Requesting local data reset", buf, 2u);
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  void v23[2] = sub_1001910C8;
  v23[3] = &unk_100305698;
  objc_copyWeak(&v25, &location);
  id v20 = v6;
  id v24 = v20;
  uint64_t v21 = +[OctagonStateTransitionOperation named:@"set-zones" intending:@"resetlocal" errorState:@"error" withBlockTakingSelf:v23];
  id v9 = [(CKKSKeychainView *)self stateMachine];
  v34[2] = @"fetchcomplete";
  v34[3] = @"process_key_hierarchy";
  v34[0] = @"ready";
  v34[1] = @"initialized";
  v34[4] = @"waitfortrust";
  v34[5] = @"loggedout";
  v34[6] = @"error";
  id v10 = +[NSArray arrayWithObjects:v34 count:7];
  unsigned __int8 v11 = +[NSSet setWithArray:v10];
  CFStringRef v32 = @"resetlocal";
  CFStringRef v30 = @"initializing";
  v28[0] = @"initialized";
  uint64_t v12 = +[OctagonStateTransitionPathStep success];
  v28[1] = @"loggedout";
  v29[0] = v12;
  long long v13 = +[OctagonStateTransitionPathStep success];
  v29[1] = v13;
  long long v14 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
  id v31 = v14;
  long long v15 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  long long v33 = v15;
  long long v16 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  id v17 = +[OctagonStateTransitionPath pathFromDictionary:v16];
  uint64_t v18 = [v9 doWatchedStateMachineRPC:@"local-reset" sourceStates:v11 path:v17 transitionOp:v21 reply:v22];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v18;
}

- (id)performInitializedOperation
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001913C8;
  v4[3] = &unk_1003077F0;
  objc_copyWeak(&v5, &location);
  id v2 = +[OctagonStateTransitionOperation named:@"ckks-initialized-operation" intending:@"become_ready" errorState:@"error" withBlockTakingSelf:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (NSDictionary)stateConditions
{
  id v2 = [(CKKSKeychainView *)self stateMachine];
  uint64_t v3 = [v2 stateConditions];

  return (NSDictionary *)v3;
}

- (NSString)debugDescription
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(CKKSKeychainView *)self operationDependencies];
  id v6 = [v5 contextID];
  id v7 = [(CKKSKeychainView *)self stateMachine];
  id v8 = [v7 currentState];
  id v9 = [(CKKSKeychainView *)self operationDependencies];
  id v10 = [v9 views];
  unsigned __int8 v11 = +[NSString stringWithFormat:@"<%@: cid:%@ state:%@ views:%@ %p>", v4, v6, v8, v10, self];

  return (NSString *)v11;
}

- (NSString)description
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(CKKSKeychainView *)self operationDependencies];
  id v6 = [v5 contextID];
  id v7 = [(CKKSKeychainView *)self stateMachine];
  id v8 = [v7 currentState];
  id v9 = [(CKKSKeychainView *)self operationDependencies];
  id v10 = [v9 views];
  unsigned __int8 v11 = +[NSString stringWithFormat:@"<%@: cid:%@ state:%@ views:%@>", v4, v6, v8, v10];

  return (NSString *)v11;
}

- (CKKSKeychainView)initWithContainer:(id)a3 contextID:(id)a4 activeAccount:(id)a5 accountTracker:(id)a6 lockStateTracker:(id)a7 reachabilityTracker:(id)a8 savedTLKNotifier:(id)a9 cloudKitClassDependencies:(id)a10 personaAdapter:(id)a11 accountsAdapter:(id)a12 cuttlefishAdapter:(id)a13
{
  id v97 = a3;
  id v18 = a4;
  id v94 = a5;
  id v93 = a6;
  id v19 = a8;
  id v95 = a7;
  id v98 = a8;
  id v20 = a9;
  id v96 = a10;
  id v92 = a11;
  id v89 = a12;
  id v21 = a13;
  v104.receiver = self;
  v104.super_class = (Class)CKKSKeychainView;
  id v22 = [(CKKSKeychainView *)&v104 init];
  long long v23 = v22;
  if (v22)
  {
    id v91 = v20;
    id v86 = v21;
    p_container = (id *)&v22->_container;
    objc_storeStrong((id *)&v22->_container, a3);
    objc_storeStrong((id *)&v23->_accountTracker, a6);
    objc_storeStrong((id *)&v23->_reachabilityTracker, v19);
    objc_storeStrong((id *)&v23->_lockStateTracker, a7);
    objc_storeStrong((id *)&v23->_cloudKitClassDependencies, a10);
    objc_storeStrong((id *)&v23->_personaAdapter, a11);
    objc_storeStrong((id *)&v23->_accountsAdapter, a12);
    zoneName = v23->_zoneName;
    v23->_zoneName = (NSString *)@"all";

    *(_WORD *)&v23->_halted = 0;
    v23->_accountStatus = 0;
    uint64_t v25 = [(CKKSKeychainView *)v23 createAccountLoggedInDependency:@"CloudKit account logged in."];
    accountLoggedInDependency = v23->_accountLoggedInDependency;
    v23->_accountLoggedInDependency = (CKKSResultOperation *)v25;

    CFStringRef v27 = [v97 containerIdentifier];
    id v28 = +[NSString stringWithFormat:@"CKKSQueue.%@.%@", v27, v18];
    id v29 = (const char *)[v28 UTF8String];
    CFStringRef v30 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v31 = dispatch_queue_create(v29, v30);
    queue = v23->_queue;
    v23->_queue = (OS_dispatch_queue *)v31;

    long long v33 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v23->_operationQueue;
    v23->_operationQueue = v33;

    id v35 = [[CKKSSecDbAdapter alloc] initWithQueue:v23->_queue];
    databaseProvider = v23->_databaseProvider;
    v23->_databaseProvider = v35;

    int v37 = objc_alloc_init(CKKSCondition);
    loggedIn = v23->_loggedIn;
    v23->_loggedIn = v37;

    id v39 = objc_alloc_init(CKKSCondition);
    loggedOut = v23->_loggedOut;
    v23->_loggedOut = v39;

    int v41 = objc_alloc_init(CKKSCondition);
    accountStateKnown = v23->_accountStateKnown;
    v23->_accountStateKnown = v41;

    v23->_initiatedLocalScan = 0;
    v23->_trustStatus = 0;
    CFStringRef v43 = objc_alloc_init(CKKSCondition);
    trustStatusKnown = v23->_trustStatusKnown;
    v23->_trustStatusKnown = v43;

    uint64_t v45 = +[NSHashTable weakObjectsHashTable];
    outgoingQueueOperations = v23->_outgoingQueueOperations;
    v23->_outgoingQueueOperations = (NSHashTable *)v45;

    currentTrustStates = v23->_currentTrustStates;
    v23->_currentTrustStates = (NSArray *)&__NSArray0__struct;

    resyncRecordsSeen = v23->_resyncRecordsSeen;
    v23->_resyncRecordsSeen = 0;

    v23->_firstManateeKeyFetched = 0;
    if ([v18 isEqualToString:&stru_10030AA90])
    {
      unsigned int v49 = @"ckks";
    }
    else
    {
      unsigned int v49 = +[NSString stringWithFormat:@"ckks-%@", v18];
    }
    BOOL v50 = [OctagonStateMachine alloc];
    if (qword_10035CCE0 != -1) {
      dispatch_once(&qword_10035CCE0, &stru_1002F7E60);
    }
    id v51 = (id)qword_10035CCD8;
    if (qword_10035CCF0 != -1) {
      dispatch_once(&qword_10035CCF0, &stru_1002F7E80);
    }
    id v52 = (id)qword_10035CCE8;
    int v53 = [(OctagonStateMachine *)v50 initWithName:v49 states:v51 flags:v52 initialState:@"wait_for_ck_account_status" queue:v23->_queue stateEngine:v23 unexpectedStateErrorDomain:@"com.apple.ckks.state" lockStateTracker:v95 reachabilityTracker:v98];
    stateMachine = v23->_stateMachine;
    v23->_stateMachine = v53;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v23);
    if (qword_10035CE18 != -1) {
      dispatch_once(&qword_10035CE18, &stru_1002F8ED0);
    }
    if (byte_10035CE20) {
      uint64_t v55 = 200000000;
    }
    else {
      uint64_t v55 = 1000000000;
    }
    if (byte_10035CE20) {
      uint64_t v56 = 200000000;
    }
    else {
      uint64_t v56 = 30000000000;
    }
    id v57 = [CKKSNearFutureScheduler alloc];
    long long v58 = +[NSString stringWithFormat:@"outgoing-queue-scheduler"];
    v101[0] = _NSConcreteStackBlock;
    v101[1] = 3221225472;
    v101[2] = sub_100192A7C;
    v101[3] = &unk_1003077A0;
    objc_copyWeak(&v102, &location);
    id v59 = [(CKKSNearFutureScheduler *)v57 initWithName:v58 initialDelay:v55 continuingDelay:v56 keepProcessAlive:0 dependencyDescriptionCode:1003 block:v101];
    outgoingQueueOperationScheduler = v23->_outgoingQueueOperationScheduler;
    v23->_outgoingQueueOperationScheduler = v59;

    __int16 v61 = [CKKSNearFutureScheduler alloc];
    id v62 = +[NSString stringWithFormat:@"outgoing-queue-priority-scheduler"];
    v99[0] = _NSConcreteStackBlock;
    v99[1] = 3221225472;
    v99[2] = sub_100192ADC;
    v99[3] = &unk_1003077A0;
    objc_copyWeak(&v100, &location);
    __int16 v63 = [(CKKSNearFutureScheduler *)v61 initWithName:v62 initialDelay:500000000 continuingDelay:500000000 keepProcessAlive:0 dependencyDescriptionCode:1003 block:v99];
    outgoingQueuePriorityOperationScheduler = v23->_outgoingQueuePriorityOperationScheduler;
    v23->_outgoingQueuePriorityOperationScheduler = v63;

    id v65 = [objc_alloc((Class)SecLaunchSequence) initWithRocketName:@"com.apple.security.ckks.launch"];
    [v65 addAttribute:@"view" value:@"global"];
    id v66 = objc_alloc_init(CKKSCondition);
    policyLoaded = v23->_policyLoaded;
    v23->_policyLoaded = v66;

    id v68 = [CKKSOperationDependencies alloc];
    CFStringRef v69 = +[NSSet set];
    CFStringRef v70 = [*p_container privateCloudDatabase];
    LOBYTE(v85) = 0;
    id v71 = -[CKKSOperationDependencies initWithViewStates:contextID:activeAccount:ckdatabase:cloudKitClassDependencies:ckoperationGroup:flagHandler:overallLaunch:accountStateTracker:lockStateTracker:reachabilityTracker:peerProviders:databaseProvider:savedTLKNotifier:personaAdapter:sendMetric:](v68, "initWithViewStates:contextID:activeAccount:ckdatabase:cloudKitClassDependencies:ckoperationGroup:flagHandler:overallLaunch:accountStateTracker:lockStateTracker:reachabilityTracker:peerProviders:databaseProvider:savedTLKNotifier:personaAdapter:sendMetric:", v69, v18, v94, v70, v23->_cloudKitClassDependencies, 0, v23->_stateMachine, v65, v93, v23->_lockStateTracker, v98, &__NSArray0__struct, v23->_databaseProvider, v91, v92,
            v85);
    operationDependencies = v23->_operationDependencies;
    v23->_operationDependencies = v71;

    CFStringRef v73 = [CKKSZoneChangeFetcher alloc];
    id v74 = [v96 fetchRecordZoneChangesOperationClass];
    reachabilityTracker = v23->_reachabilityTracker;
    uint64_t v76 = [v94 altDSID];
    uint64_t v77 = [(CKKSZoneChangeFetcher *)v73 initWithContainer:v97 fetchClass:v74 reachabilityTracker:reachabilityTracker altDSID:v76 sendMetric:0];
    zoneChangeFetcher = v23->_zoneChangeFetcher;
    v23->_zoneChangeFetcher = v77;

    v79 = +[OctagonAPSReceiver receiverForNamedDelegatePort:apsConnectionClass:](OctagonAPSReceiver, "receiverForNamedDelegatePort:apsConnectionClass:", @"com.apple.securityd.aps", [v96 apsConnectionClass]);
    id v80 = [v79 registerCKKSReceiver:v23->_zoneChangeFetcher contextID:v18];
    id v81 = objc_alloc((Class)AAFAnalyticsEventSecurity);
    id v82 = [v94 altDSID];
    id v83 = [v81 initWithCKKSMetrics:&__NSDictionary0__struct altDSID:v82 eventName:kSecurityRTCEventNameLaunchStart testsAreEnabled:0 category:kSecurityRTCEventCategoryAccountDataAccessRecovery sendMetric:1];

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:v83 success:1 error:0];
    objc_storeStrong((id *)&v23->_cuttlefishAdapter, a13);
    [(OctagonStateMachine *)v23->_stateMachine startOperation];

    objc_destroyWeak(&v100);
    objc_destroyWeak(&v102);
    objc_destroyWeak(&location);

    id v20 = v91;
    id v21 = v86;
  }

  return v23;
}

- (void)modifyTLKSharesForExternallyManagedView:(id)a3 adding:(id)a4 deleting:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = (void (**)(id, id))a6;
  id v25 = 0;
  long long v14 = [(CKKSKeychainView *)self externalManagedViewForRPC:v10 error:&v25];
  id v15 = v25;
  if (v14)
  {
    *(void *)id location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1001B9EFC;
    v20[3] = &unk_100306CE0;
    objc_copyWeak(&v24, (id *)location);
    id v21 = v14;
    id v22 = v11;
    id v23 = v12;
    long long v16 = +[OctagonStateTransitionGroupOperation named:@"external-tlk-rpc" intending:@"ready" errorState:@"ready" withBlockTakingSelf:v20];
    id v17 = [(CKKSKeychainView *)self stateMachine];
    id v18 = +[NSSet setWithObject:@"ready"];
    [v17 doSimpleStateMachineRPC:@"external-tlkshare-modification-rpc" op:v16 sourceStates:v18 reply:v13];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v19 = sub_1000CD884(@"ckkszone", 0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id location = 138412546;
      *(void *)&location[4] = v10;
      __int16 v27 = 2112;
      id v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Can't modify CloudKit zone for view %@: %@", location, 0x16u);
    }

    v13[2](v13, v15);
  }
}

- (void)loadKeys:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CKKSKeychainView *)self databaseProvider];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001BB3D0;
  v11[3] = &unk_100307280;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 dispatchSyncWithReadOnlySQLTransaction:v11];
}

- (void)fetchCloudKitExternallyManagedViewKeyHierarchy:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CKKSKeychainView *)self rpcFetchBecause:@"se-api"];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  void v13[2] = sub_1001BBCA0;
  v13[3] = &unk_100306C28;
  objc_copyWeak(&v17, &location);
  id v9 = v8;
  id v14 = v9;
  id v10 = v6;
  id v15 = v10;
  id v11 = v7;
  id v16 = v11;
  id v12 = +[CKKSResultOperation named:@"rpc-response" withBlockTakingSelf:v13];
  [v12 addDependency:v9];
  [(CKKSKeychainView *)self scheduleOperation:v12];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)fetchExternallyManagedViewKeyHierarchy:(id)a3 forceFetch:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v13 = 0;
  id v10 = [(CKKSKeychainView *)self externalManagedViewForRPC:v8 error:&v13];
  id v11 = v13;
  if (v10)
  {
    if (v6) {
      [(CKKSKeychainView *)self fetchCloudKitExternallyManagedViewKeyHierarchy:v10 reply:v9];
    }
    else {
      [(CKKSKeychainView *)self loadKeys:v10 reply:v9];
    }
  }
  else
  {
    id v12 = sub_1000CD884(@"ckkszone", 0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Can't fetch CloudKit zone for view %@: %@", buf, 0x16u);
    }

    (*((void (**)(id, void, void, void, id))v9 + 2))(v9, 0, 0, 0, v11);
  }
}

- (void)proposeTLKForExternallyManagedView:(id)a3 proposedTLK:(id)a4 wrappedOldTLK:(id)a5 tlkShares:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v22 = a4;
  id v23 = a5;
  id v13 = a6;
  id v14 = a7;
  id v31 = 0;
  id v15 = [(CKKSKeychainView *)self externalManagedViewForRPC:v12 error:&v31];
  id v16 = v31;
  if (v15)
  {
    *(void *)id location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1001BC26C;
    v24[3] = &unk_100306C00;
    objc_copyWeak(&v30, (id *)location);
    id v25 = v22;
    id v26 = v15;
    id v27 = v23;
    id v17 = v14;
    id v29 = v17;
    id v28 = v13;
    id v18 = +[OctagonStateTransitionGroupOperation named:@"external-tlk-rpc" intending:@"ready" errorState:@"ready" withBlockTakingSelf:v24];
    id v19 = [(CKKSKeychainView *)self stateMachine];
    id v20 = +[NSSet setWithObject:@"ready"];
    [v19 doSimpleStateMachineRPC:@"external-tlk-rpc" op:v18 sourceStates:v20 reply:v17];

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v21 = sub_1000CD884(@"ckkszone", 0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id location = 138412546;
      *(void *)&location[4] = v12;
      __int16 v33 = 2112;
      id v34 = v16;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Can't propose TLKs for view %@: %@", location, 0x16u);
    }

    (*((void (**)(id, id))v14 + 2))(v14, v16);
  }
}

- (void)resetExternallyManagedCloudKitView:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v13 = 0;
  id v8 = [(CKKSKeychainView *)self externalManagedViewForRPC:v6 error:&v13];
  id v9 = v13;
  if (v8)
  {
    id v10 = +[NSSet setWithObject:v6];
    id v11 = [(CKKSKeychainView *)self rpcResetCloudKit:v10 reply:v7];
  }
  else
  {
    id v12 = sub_1000CD884(@"ckkszone", 0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Can't reset CloudKit zone for view %@: %@", buf, 0x16u);
    }

    v7[2](v7, v9);
  }
}

- (id)externalManagedViewForRPC:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![(CKKSKeychainView *)self waitUntilReadyForRPCForOperation:@"external operation" fast:0 errorOnNoCloudKitAccount:1 errorOnPolicyMissing:1 error:a4])
  {
    a4 = 0;
    goto LABEL_22;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [(CKKSKeychainView *)self operationDependencies];
  id v8 = [v7 allExternalManagedViews];

  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
LABEL_4:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v21 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
      id v14 = [v13 zoneName];
      unsigned __int8 v15 = [v14 isEqualToString:v6];

      if (v15) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v10) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
    id v16 = v13;

    if (!v16) {
      goto LABEL_16;
    }
    if (![v16 ckksManagedView])
    {
      id v16 = v16;
      a4 = (id *)v16;
      goto LABEL_21;
    }
    if (!a4) {
      goto LABEL_21;
    }
    id v17 = +[NSString stringWithFormat:@"View is not externally managed: '%@'", v6];
    *a4 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:62 description:v17];
  }
  else
  {
LABEL_10:

LABEL_16:
    if (!a4)
    {
      id v16 = 0;
      goto LABEL_21;
    }
    id v18 = +[NSString stringWithFormat:@"Unknown external view: '%@'", v6];
    *a4 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:11 description:v18];

    id v16 = 0;
  }
  a4 = 0;
LABEL_21:

LABEL_22:

  return a4;
}

@end