@interface REMStore
+ (BOOL)_shouldNotifyReminddOfInteractionWithPeople;
+ (BOOL)dataaccessDaemonStopSyncingReminders;
+ (BOOL)destroyIsolatedStoreContainerWithToken:(id)a3 error:(id *)a4;
+ (BOOL)isEventKitSyncEnabledForReminderKit;
+ (BOOL)notificationsEnabled;
+ (BOOL)siriShouldRouteIntentsToNewRemindersApp;
+ (NSString)storeDidChangeNotificationName;
+ (id)createIsolatedStoreContainerWithError:(id *)a3;
+ (void)initialize;
+ (void)notifyOfInteractionWithPeople:(id)a3;
- (BOOL)_isUserInteractiveStore;
- (BOOL)assertOnMainThreadFetches;
- (BOOL)containsCustomSmartListForTipKitWithError:(id *)a3;
- (BOOL)containsHashtagsForTipKitWithError:(id *)a3;
- (BOOL)containsListWithCustomBadgeForTipKitWithError:(id *)a3;
- (BOOL)deleteSharedGroceryList:(id)a3 error:(id *)a4;
- (BOOL)everConnectedToCar;
- (BOOL)hasActiveCloudKitAccountForTipKitWithError:(id *)a3;
- (BOOL)saveSaveRequest:(id)a3 accountChangeItems:(id)a4 listChangeItems:(id)a5 listSectionChangeItems:(id)a6 smartListChangeItems:(id)a7 smartListSectionChangeItems:(id)a8 templateChangeItems:(id)a9 templateSectionChangeItems:(id)a10 reminderChangeItems:(id)a11 author:(id)a12 replicaManagerProvider:(id)a13 error:(id *)a14;
- (BOOL)test_revertImageAttachmentsToUnDeduped:(id)a3 error:(id *)a4;
- (REMDaemonController)daemonController;
- (REMStore)init;
- (REMStore)initWithDaemonController:(id)a3;
- (REMStore)initWithDaemonController:(id)a3 storeContainerToken:(id)a4;
- (REMStore)initWithStoreContainerToken:(id)a3;
- (REMStore)nonUserInteractiveStore;
- (REMStoreContainerToken)storeContainerToken;
- (_REMInProgressSaveRequestsContainer)l_inProgressSaveRequestsContainer;
- (id)MCIsManagedAccountWithObjectID:(id)a3 error:(id *)a4;
- (id)_withInProgressSaveRequestContainer:(id)a3;
- (id)_xpcSyncStorePerformerWithReason:(id)a3 errorHandler:(id)a4;
- (id)compressedDistributedEvaluationDataWithOptions:(id)a3 error:(id *)a4;
- (id)createShareForListWithID:(id)a3 appIconData:(id)a4 error:(id *)a5;
- (id)createSharedGroceryListWithError:(id *)a3;
- (id)debugDescription;
- (id)debugFetchPhantomListsWithError:(id *)a3;
- (id)description;
- (id)executeFetchRequest:(id)a3 error:(id *)a4;
- (id)fetchAccountWithExternalIdentifier:(id)a3 error:(id *)a4;
- (id)fetchAccountWithObjectID:(id)a3 error:(id *)a4;
- (id)fetchAccountsForDumpingWithError:(id *)a3;
- (id)fetchAccountsIncludingInactive:(BOOL)a3 error:(id *)a4;
- (id)fetchAccountsWithError:(id *)a3;
- (id)fetchAccountsWithExternalIdentifiers:(id)a3 error:(id *)a4;
- (id)fetchAccountsWithObjectIDs:(id)a3 error:(id *)a4;
- (id)fetchActiveCloudKitAccountObjectIDsWithFetchOption:(int64_t)a3 error:(id *)a4;
- (id)fetchAllListsWithExternalIdentifier:(id)a3 error:(id *)a4;
- (id)fetchAllRemindersWithExternalIdentifier:(id)a3 error:(id *)a4;
- (id)fetchAssignmentsWithObjectIDs:(id)a3 includeConcealedObjects:(BOOL)a4 error:(id *)a5;
- (id)fetchCompletedRemindersForEventKitBridgingWithCompletionDateFrom:(id)a3 to:(id)a4 withListIDs:(id)a5 error:(id *)a6;
- (id)fetchCreatedOrCompletedRemindersCountForAppStoreFromDate:(id)a3 toDate:(id)a4 error:(id *)a5;
- (id)fetchCustomSmartListWithObjectID:(id)a3 error:(id *)a4;
- (id)fetchCustomSmartListsWithError:(id *)a3;
- (id)fetchDefaultAccountWithError:(id *)a3;
- (id)fetchDefaultListRequiringCloudKitAccountWithAccountID:(id)a3 error:(id *)a4;
- (id)fetchDefaultListRequiringCloudKitWithError:(id *)a3;
- (id)fetchDefaultListWithError:(id *)a3;
- (id)fetchEligibleDefaultListsWithError:(id *)a3;
- (id)fetchFamilyGroceryListEligibilityForFamilyChecklistWithLocale:(id)a3 error:(id *)a4;
- (id)fetchHashtagsWithObjectIDs:(id)a3 includeConcealedObjects:(BOOL)a4 error:(id *)a5;
- (id)fetchIncompleteRemindersForEventKitBridgingWithDueDateFrom:(id)a3 to:(id)a4 withListIDs:(id)a5 error:(id *)a6;
- (id)fetchListIncludingConcealedWithObjectID:(id)a3 error:(id *)a4;
- (id)fetchListIncludingMarkedForDeleteWithObjectID:(id)a3 error:(id *)a4;
- (id)fetchListIncludingSpecialContainerWithObjectID:(id)a3 error:(id *)a4;
- (id)fetchListRepresentationOfTemplateWithObjectID:(id)a3 error:(id *)a4;
- (id)fetchListSectionWithObjectID:(id)a3 error:(id *)a4;
- (id)fetchListSectionsCountWithListObjectID:(id)a3 error:(id *)a4;
- (id)fetchListSectionsForListSectionContext:(id)a3 error:(id *)a4;
- (id)fetchListSectionsForListSectionContextChangeItem:(id)a3 error:(id *)a4;
- (id)fetchListSectionsWithListObjectID:(id)a3 error:(id *)a4;
- (id)fetchListSectionsWithObjectIDs:(id)a3 error:(id *)a4;
- (id)fetchListWithObjectID:(id)a3 error:(id *)a4;
- (id)fetchListsForEventKitBridgingWithError:(id *)a3;
- (id)fetchListsIncludingSpecialContainersInAccount:(id)a3 error:(id *)a4;
- (id)fetchListsWithObjectIDs:(id)a3 error:(id *)a4;
- (id)fetchMinimumSearchTermLengthByBaseLanguageWithError:(id *)a3;
- (id)fetchPrimaryActiveCloudKitAccountREMObjectIDWithError:(id *)a3;
- (id)fetchPrimaryActiveCloudKitAccountWithError:(id *)a3;
- (id)fetchReminderIncludingConcealedWithObjectID:(id)a3 error:(id *)a4;
- (id)fetchReminderWithDACalendarItemUniqueIdentifier:(id)a3 inList:(id)a4 error:(id *)a5;
- (id)fetchReminderWithExternalIdentifier:(id)a3 inList:(id)a4 error:(id *)a5;
- (id)fetchReminderWithObjectID:(id)a3 error:(id *)a4;
- (id)fetchReminderWithObjectID:(id)a3 fetchOptions:(id)a4 error:(id *)a5;
- (id)fetchRemindersForEventKitBridgingWithListIDs:(id)a3 error:(id *)a4;
- (id)fetchRemindersIncludingUnsupportedWithObjectIDs:(id)a3 error:(id *)a4;
- (id)fetchRemindersMatchingPredicateDescriptor:(id)a3 sortDescriptors:(id)a4 options:(id)a5 error:(id *)a6;
- (id)fetchRemindersMatchingTitle:(id)a3 dueAfter:(id)a4 dueBefore:(id)a5 isCompleted:(id)a6 hasLocation:(id)a7 location:(id)a8 error:(id *)a9;
- (id)fetchRemindersWithDACalendarItemUniqueIdentifiers:(id)a3 inList:(id)a4 error:(id *)a5;
- (id)fetchRemindersWithExternalIdentifiers:(id)a3 inList:(id)a4 error:(id *)a5;
- (id)fetchRemindersWithObjectIDs:(id)a3 error:(id *)a4;
- (id)fetchRemindersWithObjectIDs:(id)a3 fetchOptions:(id)a4 error:(id *)a5;
- (id)fetchRemindersWithParentReminderIDs:(id)a3 error:(id *)a4;
- (id)fetchReplicaManagerForAccountID:(id)a3 error:(id *)a4;
- (id)fetchReplicaManagersForAccountID:(id)a3 bundleID:(id)a4 error:(id *)a5;
- (id)fetchResultByExecutingFetchRequest:(id)a3 error:(id *)a4;
- (id)fetchShareForListWithID:(id)a3 error:(id *)a4;
- (id)fetchSiriFoundInAppsListWithError:(id *)a3;
- (id)fetchSmartListSectionWithObjectID:(id)a3 error:(id *)a4;
- (id)fetchSmartListSectionsForSmartListSectionContext:(id)a3 error:(id *)a4;
- (id)fetchSmartListSectionsWithObjectIDs:(id)a3 error:(id *)a4;
- (id)fetchTemplateSectionWithObjectID:(id)a3 error:(id *)a4;
- (id)fetchTemplateSectionsForTemplateSectionContext:(id)a3 error:(id *)a4;
- (id)fetchTemplateSectionsWithObjectIDs:(id)a3 error:(id *)a4;
- (id)fetchTemplateWithObjectID:(id)a3 error:(id *)a4;
- (id)initUserInteractive:(BOOL)a3;
- (id)optimisticallyMaterializeReminderChangeItem:(id)a3;
- (id)provideAnonymousChangeTrackingWithTransactionAuthorKeysToExclude:(id)a3;
- (id)provideChangeTrackingForAccountID:(id)a3 clientName:(id)a4;
- (id)provideChangeTrackingForAccountID:(id)a3 clientName:(id)a4 transactionAuthorKeysToExclude:(id)a5;
- (id)refreshAccount:(id)a3;
- (id)refreshList:(id)a3;
- (id)refreshReminder:(id)a3;
- (id)repairPhantomObjectsWithObjectIDs:(id)a3 error:(id *)a4;
- (id)replicaManagerProviderForCalDAVSync;
- (id)resultFromPerformingInvocation:(id)a3 error:(id *)a4;
- (id)resultFromPerformingSwiftInvocation:(id)a3 parametersData:(id)a4 storages:(id)a5 error:(id *)a6;
- (id)resultsIndexedByObjectIDFromExecutingFetchRequest:(id)a3 error:(id *)a4;
- (id)sharedGroceryListForFamilyChecklistWithCommonParticipants:(id)a3 error:(id *)a4;
- (id)test_immediatelyCreateOrUpdatePublicLinkOfTemplateWithTemplateObjectID:(id)a3 configuration:(id)a4 error:(id *)a5;
- (id)test_immediatelyRevokePublicLinkOfTemplateWithTemplateObjectID:(id)a3 error:(id *)a4;
- (os_unfair_lock_s)lock;
- (unint64_t)completedRemindersCountForTipKitWithError:(id *)a3;
- (unint64_t)countForFetchRequest:(id)a3 error:(id *)a4;
- (unint64_t)mode;
- (unint64_t)storeGeneration;
- (void)_addChangeItemChangedKeys:(id)a3 objectID:(id)a4 toChangedKeysMap:(id)a5;
- (void)_enumerateAllListsIncludingGroups:(BOOL)a3 withBlock:(id)a4;
- (void)_incrementStoreGeneration;
- (void)_respondToCalDAVSharedList:(id)a3 withResponse:(int64_t)a4 queue:(id)a5 completion:(id)a6;
- (void)_saveAccountChangeItems:(id)a3 listChangeItems:(id)a4 listSectionChangeItems:(id)a5 smartListChangeItems:(id)a6 smartListSectionChangeItems:(id)a7 templateChangeItems:(id)a8 templateSectionChangeItems:(id)a9 reminderChangeItems:(id)a10 author:(id)a11 replicaManagerProvider:(id)a12 synchronously:(BOOL)a13 syncToCloudKit:(BOOL)a14 performer:(id)a15 completion:(id)a16;
- (void)_triggerSyncWithReason:(id)a3 skipDataAccessSync:(BOOL)a4 forcingCloudKitReload:(BOOL)a5 discretionary:(BOOL)a6 bypassThrottler:(BOOL)a7 completion:(id)a8;
- (void)acceptCalDAVSharedList:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)acceptShareWithMetadata:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)addCKShareObserverIfNeededForAccountID:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)addParticipantsToSharedGroceryList:(id)a3 completion:(id)a4;
- (void)anchoredBubbleCloudOverridesWithCompletion:(id)a3;
- (void)enumerateAllGroupsAndListsWithBlock:(id)a3;
- (void)enumerateAllListsWithBlock:(id)a3;
- (void)enumerateAllRemindersWithBlock:(id)a3;
- (void)invalidate;
- (void)notifyOfInteractionWithPeople:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)nukeDatabase;
- (void)postFamilyAnalyticsPayloadWithOperationId:(id)a3 operationDetail:(id)a4;
- (void)processNoOpSaveRequest:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)rejectCalDAVSharedList:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)removeOrphanedAccountsWithCompletion:(id)a3;
- (void)requestDownloadGroceryModelAssetsFromTrial;
- (void)requestToDeleteLocalDataWithCompletion:(id)a3;
- (void)requestToDeleteSyncDataWithAccountIdentifier:(id)a3 completion:(id)a4;
- (void)requestToMergeLocalDataIntoSyncDataWithAccountIdentifier:(id)a3 completion:(id)a4;
- (void)requestToUpdateClientConnectionsAsynchronously:(BOOL)a3 shouldKeepAlive:(BOOL)a4 completion:(id)a5;
- (void)saveSaveRequest:(id)a3 accountChangeItems:(id)a4 listChangeItems:(id)a5 listSectionChangeItems:(id)a6 smartListChangeItems:(id)a7 smartListSectionChangeItems:(id)a8 templateChangeItems:(id)a9 templateSectionChangeItems:(id)a10 reminderChangeItems:(id)a11 author:(id)a12 replicaManagerProvider:(id)a13 queue:(id)a14 completion:(id)a15;
- (void)setAssertOnMainThreadFetches:(BOOL)a3;
- (void)setDaemonController:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setNonUserInteractiveStore:(id)a3;
- (void)stopShare:(id)a3 accountID:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)test_handleIncompleteGroceryOperationQueueItemsImmediatelyWithTimeout:(double)a3;
- (void)test_handleIncompleteTemplateOperationQueueItemsImmediately;
- (void)test_refreshHashtagLabelsImmediately;
- (void)test_setupForManualHashtagLabelRefreshing;
- (void)triggerCloudKitOnlySyncWithReason:(id)a3 discretionary:(BOOL)a4 completion:(id)a5;
- (void)triggerSyncForDataAccessAccountsWithAccountIDs:(id)a3;
- (void)triggerThrottledSyncWithReason:(id)a3 discretionary:(BOOL)a4 completion:(id)a5;
- (void)updateAccountWithAccountID:(id)a3 completion:(id)a4;
- (void)updateAccountWithAccountID:(id)a3 restartDA:(BOOL)a4 completion:(id)a5;
- (void)updateAccountsAndSync:(BOOL)a3 completion:(id)a4;
- (void)updateShare:(id)a3 accountID:(id)a4 queue:(id)a5 completion:(id)a6;
@end

@implementation REMStore

- (unint64_t)storeGeneration
{
  return atomic_load(&__debug_storeGeneration);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonUserInteractiveStore, 0);
  objc_storeStrong((id *)&self->_storeContainerToken, 0);
  objc_storeStrong((id *)&self->_daemonController, 0);

  objc_storeStrong((id *)&self->_l_inProgressSaveRequestsContainer, 0);
}

- (id)initUserInteractive:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    +[REMXPCDaemonController userInteractiveDaemonController];
  }
  else {
  v5 = +[REMXPCDaemonController weakSharedInstance];
  }
  v6 = [(REMStore *)self initWithDaemonController:v5 storeContainerToken:0];
  if (v3)
  {
    v7 = objc_alloc_init(REMStore);
    nonUserInteractiveStore = v6->_nonUserInteractiveStore;
    v6->_nonUserInteractiveStore = v7;
  }
  return v6;
}

- (REMStore)init
{
  BOOL v3 = +[REMXPCDaemonController weakSharedInstance];
  v4 = [(REMStore *)self initWithDaemonController:v3 storeContainerToken:0];

  return v4;
}

- (REMStore)initWithDaemonController:(id)a3 storeContainerToken:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)REMStore;
  v9 = [(REMStore *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daemonController, a3);
    if (v10->_storeContainerToken)
    {
      v11 = +[REMLog xpc];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v10;
        _os_log_impl(&dword_1B9AA2000, v11, OS_LOG_TYPE_INFO, "Created isolated store {store: %@}", buf, 0xCu);
      }
    }
    objc_storeStrong((id *)&v10->_storeContainerToken, a4);
    v10->_lock._os_unfair_lock_opaque = 0;
    v12 = objc_alloc_init(_REMInProgressSaveRequestsContainer);
    l_inProgressSaveRequestsContainer = v10->_l_inProgressSaveRequestsContainer;
    v10->_l_inProgressSaveRequestsContainer = v12;
  }
  return v10;
}

void __22__REMStore_initialize__block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"REMStoreDidChangeNotification" object:0];
}

- (REMStore)initWithDaemonController:(id)a3
{
  return [(REMStore *)self initWithDaemonController:a3 storeContainerToken:0];
}

void __22__REMStore_initialize__block_invoke()
{
}

- (void)setAssertOnMainThreadFetches:(BOOL)a3
{
  self->_assertOnMainThreadFetches = a3;
}

- (void)requestDownloadGroceryModelAssetsFromTrial
{
  id v2 = [(REMStore *)self _xpcSyncStorePerformerWithReason:@"requestDownloadGroceryModelAssetsFromTrial" errorHandler:&__block_literal_global_456];
  [v2 requestDownloadGroceryModelAssetsFromTrial];
}

- (void)triggerThrottledSyncWithReason:(id)a3 discretionary:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96__REMStore_AccountManagement_Internal__triggerThrottledSyncWithReason_discretionary_completion___block_invoke;
  v10[3] = &unk_1E61DC3F8;
  id v11 = v8;
  id v9 = v8;
  [(REMStore *)self _triggerSyncWithReason:a3 skipDataAccessSync:0 forcingCloudKitReload:0 discretionary:v5 bypassThrottler:0 completion:v10];
}

- (void)_triggerSyncWithReason:(id)a3 skipDataAccessSync:(BOOL)a4 forcingCloudKitReload:(BOOL)a5 discretionary:(BOOL)a6 bypassThrottler:(BOOL)a7 completion:(id)a8
{
  id v14 = a8;
  id v15 = a3;
  v16 = [(REMStore *)self daemonController];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke;
  v20[3] = &unk_1E61DC998;
  BOOL v22 = a5;
  v20[4] = v15;
  BOOL v23 = a7;
  BOOL v24 = a6;
  BOOL v25 = a4;
  id v21 = v14;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke_6;
  v18[3] = &unk_1E61DC3F8;
  id v19 = v21;
  id v17 = v21;
  [v16 asyncSyncInterfacePerformerWithReason:v15 loadHandler:v20 errorHandler:v18];
}

void __78__REMStore_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke_97(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[REMLogStore read];
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __78__REMStore_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke_97_cold_1();
    }

    id v9 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v10 = v6;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 56);
      v12 = [*(id *)(a1 + 32) name];
      v13 = [v5 resultData];
      uint64_t v14 = [v13 length];
      id v15 = [v5 resultStorages];
      int v18 = 134218754;
      uint64_t v19 = v11;
      __int16 v20 = 2114;
      id v21 = v12;
      __int16 v22 = 2048;
      uint64_t v23 = v14;
      __int16 v24 = 2048;
      uint64_t v25 = [v15 count];
      _os_log_impl(&dword_1B9AA2000, v8, OS_LOG_TYPE_DEFAULT, "FETCH END {invocationCounter: %ld, name: %{public}@, result.data.length: %ld, result.storages.count: %ld}", (uint8_t *)&v18, 0x2Au);
    }
    id v9 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v10 = v5;
  }
  id v16 = v10;
  id v17 = *v9;
  REMStore *v9 = v16;
}

- (id)resultFromPerformingSwiftInvocation:(id)a3 parametersData:(id)a4 storages:(id)a5 error:(id *)a6
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v39 = a4;
  id v40 = a5;
  if ([(REMStore *)self assertOnMainThreadFetches]) {
    dispatch_assert_queue_not_V2(MEMORY[0x1E4F14428]);
  }
  [(REMStore *)self _incrementStoreGeneration];
  uint64_t v11 = resultFromPerformingSwiftInvocation_parametersData_storages_error__globalInvocationCounter++;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__1;
  v61 = __Block_byref_object_dispose__1;
  id v62 = 0;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__1;
  v55 = __Block_byref_object_dispose__1;
  id v56 = 0;
  v12 = _os_activity_create(&dword_1B9AA2000, "REMStore swiftInvocation", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  BOOL v13 = [(REMStore *)self _isUserInteractiveStore];
  v38 = v12;
  uint64_t v14 = +[REMSignpost database];
  os_signpost_id_t v15 = os_signpost_id_generate(v14);
  id v16 = v14;
  id v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    id v18 = [v10 name];
    uint64_t v19 = [v18 cStringUsingEncoding:1];
    *(_DWORD *)buf = 136446466;
    uint64_t v64 = v19;
    __int16 v65 = 1026;
    LODWORD(v66) = v13;
    _os_signpost_emit_with_name_impl(&dword_1B9AA2000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "REMStore.invocation", " enableTelemetry=YES Name=%{public, signpost.telemetry:string1, Name=InvocationName}s UserInteractive=%{public, signpost.telemetry:number1, Name=UserInteractive}d", buf, 0x12u);
  }
  __int16 v20 = +[REMLogStore read];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = [v10 name];
    uint64_t v22 = [v39 length];
    uint64_t v23 = [v40 count];
    *(_DWORD *)buf = 134218754;
    uint64_t v64 = v11;
    __int16 v65 = 2114;
    uint64_t v66 = (uint64_t)v21;
    __int16 v67 = 2048;
    uint64_t v68 = v22;
    __int16 v69 = 2048;
    uint64_t v70 = v23;
    _os_log_impl(&dword_1B9AA2000, v20, OS_LOG_TYPE_DEFAULT, "FETCH START {invocationCounter: %ld, name: %{public}@, parametersData.length %ld, storages.count: %ld}", buf, 0x2Au);
  }
  __int16 v24 = NSString;
  uint64_t v25 = [v10 name];
  uint64_t v26 = [v24 stringWithFormat:@"swInv_%@", v25];

  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __78__REMStore_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke;
  v46[3] = &unk_1E61DC4E8;
  uint64_t v49 = v11;
  id v27 = v10;
  id v47 = v27;
  v48 = &v57;
  v28 = [(REMStore *)self _xpcSyncStorePerformerWithReason:v26 errorHandler:v46];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __78__REMStore_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke_97;
  v41[3] = &unk_1E61DC510;
  uint64_t v45 = v11;
  id v29 = v27;
  id v42 = v29;
  v43 = &v51;
  v44 = &v57;
  [v28 performSwiftInvocation:v29 withParametersData:v39 storages:v40 completion:v41];
  if (a6) {
    *a6 = (id) v58[5];
  }
  v30 = v17;
  v31 = v30;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    v32 = [(id)v52[5] resultStorages];
    uint64_t v33 = [v32 count];
    v34 = [(id)v52[5] resultData];
    uint64_t v35 = [v34 length];
    *(_DWORD *)buf = 134349312;
    uint64_t v64 = v33;
    __int16 v65 = 2050;
    uint64_t v66 = v35;
    _os_signpost_emit_with_name_impl(&dword_1B9AA2000, v31, OS_SIGNPOST_INTERVAL_END, v15, "REMStore.invocation", " enableTelemetry=YES ResultCount=%{public, signpost.telemetry:number1, Name:ResultCount}ld DataSize=%{public, signpost.telemetry:number2, Name:DataSize}ld", buf, 0x16u);
  }
  id v36 = (id)v52[5];

  os_activity_scope_leave(&state);
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);

  return v36;
}

- (id)_xpcSyncStorePerformerWithReason:(id)a3 errorHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(REMStore *)self daemonController];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__REMStore__xpcSyncStorePerformerWithReason_errorHandler___block_invoke;
  v12[3] = &unk_1E61DC448;
  v12[4] = self;
  id v13 = v6;
  id v9 = v6;
  id v10 = [v8 syncStorePerformerWithReason:v7 errorHandler:v12];

  return v10;
}

- (REMDaemonController)daemonController
{
  return self->_daemonController;
}

- (BOOL)assertOnMainThreadFetches
{
  return self->_assertOnMainThreadFetches;
}

- (BOOL)_isUserInteractiveStore
{
  id v2 = [(REMStore *)self nonUserInteractiveStore];
  BOOL v3 = v2 != 0;

  return v3;
}

- (REMStore)nonUserInteractiveStore
{
  if (self->_nonUserInteractiveStore) {
    self = self->_nonUserInteractiveStore;
  }
  return self;
}

- (void)_incrementStoreGeneration
{
}

- (void)requestToUpdateClientConnectionsAsynchronously:(BOOL)a3 shouldKeepAlive:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(REMStore *)self daemonController];
  if (v6)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __105__REMStore_ClientConnections__requestToUpdateClientConnectionsAsynchronously_shouldKeepAlive_completion___block_invoke;
    v24[3] = &unk_1E61DCA10;
    BOOL v26 = v5;
    id v10 = &v25;
    id v25 = v8;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __105__REMStore_ClientConnections__requestToUpdateClientConnectionsAsynchronously_shouldKeepAlive_completion___block_invoke_2;
    v20[3] = &unk_1E61DC858;
    BOOL v22 = v6;
    BOOL v23 = v5;
    id v21 = v25;
    [v9 asyncStorePerformerWithReason:@"requestToUpdateClientConnections" loadHandler:v24 errorHandler:v20];

    uint64_t v11 = v21;
  }
  else
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    os_signpost_id_t v15 = __105__REMStore_ClientConnections__requestToUpdateClientConnectionsAsynchronously_shouldKeepAlive_completion___block_invoke_632;
    id v16 = &unk_1E61DC858;
    char v18 = 0;
    BOOL v19 = v5;
    id v10 = (id *)&v17;
    v12 = (void (**)(id, void))v8;
    id v17 = v12;
    uint64_t v11 = [v9 syncStorePerformerWithReason:@"requestToUpdateClientConnections" errorHandler:&v13];

    if (v11)
    {
      objc_msgSend(v11, "requestToUpdateClientConnectionsWithShouldKeepAlive:", v5, v13, v14, v15, v16);
      if (v12) {
        v12[2](v12, 0);
      }
    }
  }
}

void __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__1;
  v22[4] = __Block_byref_object_dispose__1;
  id v23 = 0;
  v4 = dispatch_group_create();
  int v5 = *(unsigned __int8 *)(a1 + 48);
  dispatch_group_enter(v4);
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5)
  {
    uint64_t v7 = *(unsigned __int8 *)(a1 + 49);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke_2;
    v20[3] = &unk_1E61DC948;
    v21[1] = v22;
    v21[0] = v4;
    [v3 restartCloudKitSyncWithReason:v6 bypassThrottler:v7 completion:v20];
    id v8 = (id *)v21;
  }
  else
  {
    uint64_t v9 = *(unsigned __int8 *)(a1 + 50);
    uint64_t v10 = *(unsigned __int8 *)(a1 + 49);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke_3;
    v18[3] = &unk_1E61DC948;
    v19[1] = v22;
    v19[0] = v4;
    [v3 syncCloudKitWithReason:v6 discretionary:v9 bypassThrottler:v10 completion:v18];
    id v8 = (id *)v19;
  }

  if (!*(unsigned char *)(a1 + 51))
  {
    dispatch_group_enter(v4);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 49);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke_4;
    v15[3] = &unk_1E61DC948;
    id v17 = v22;
    id v16 = v4;
    [v3 syncDataAccessAccountsWithAccountIDs:MEMORY[0x1E4F1CBF0] bypassThrottler:v11 completion:v15];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke_5;
  v12[3] = &unk_1E61DC970;
  id v13 = *(id *)(a1 + 40);
  uint64_t v14 = v22;
  dispatch_group_notify(v4, MEMORY[0x1E4F14428], v12);

  _Block_object_dispose(v22, 8);
}

uint64_t __105__REMStore_ClientConnections__requestToUpdateClientConnectionsAsynchronously_shouldKeepAlive_completion___block_invoke(uint64_t a1, void *a2)
{
  [a2 requestToUpdateClientConnectionsWithShouldKeepAlive:*(unsigned __int8 *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

+ (NSString)storeDidChangeNotificationName
{
  return (NSString *)@"REMStoreDidChangeNotification";
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = (const char *)_REMStoreChangedNotificationName;
    id v3 = +[REMDispatchQueue storeQueue];
    notify_register_dispatch(v2, (int *)&initialize_token, v3, &__block_literal_global_2);
  }
}

uint64_t __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __96__REMStore_AccountManagement_Internal__triggerThrottledSyncWithReason_discretionary_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!v3) {
    goto LABEL_8;
  }
  int v5 = [v3 domain];
  if (([v5 isEqual:@"com.apple.reminderkit"] & 1) == 0)
  {

    goto LABEL_8;
  }
  uint64_t v6 = [v4 code];

  if (v6 != -1002)
  {
LABEL_8:
    id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_9;
  }
  uint64_t v7 = +[REMLogStore xpc];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1B9AA2000, v7, OS_LOG_TYPE_INFO, "Sync throttled", v9, 2u);
  }

  id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_9:
  v8();
}

- (id)fetchListsWithObjectIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "listIDs");
  }
  uint64_t v7 = [[REMListsDataView alloc] initWithStore:self];
  id v8 = [(REMListsDataView *)v7 fetchListsWithObjectIDs:v6 error:a4];

  return v8;
}

+ (id)createIsolatedStoreContainerWithError:(id *)a3
{
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  BOOL v19 = __Block_byref_object_copy__1;
  __int16 v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__1;
  uint64_t v14 = __Block_byref_object_dispose__1;
  id v15 = 0;
  id v4 = +[REMXPCDaemonController weakSharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__REMStore_createIsolatedStoreContainerWithError___block_invoke;
  v9[3] = &unk_1E61DC1F8;
  v9[4] = &v16;
  int v5 = [v4 syncDebugPerformerWithReason:@"createIsolatedStoreContainer" errorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__REMStore_createIsolatedStoreContainerWithError___block_invoke_2;
  v8[3] = &unk_1E61DC220;
  v8[4] = &v16;
  v8[5] = &v10;
  [v5 createIsolatedStoreContainerWithCompletion:v8];
  if (a3) {
    *a3 = (id) v17[5];
  }
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);

  return v6;
}

void __50__REMStore_createIsolatedStoreContainerWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __50__REMStore_createIsolatedStoreContainerWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[REMLog xpc];
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __50__REMStore_createIsolatedStoreContainerWithError___block_invoke_2_cold_1();
    }

    uint64_t v9 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v10 = v6;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_1B9AA2000, v8, OS_LOG_TYPE_INFO, "Did create isolated store container {token: %@}", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v9 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = v5;
  }
  id v11 = v10;
  uint64_t v12 = *v9;
  void *v9 = v11;
}

+ (BOOL)destroyIsolatedStoreContainerWithToken:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v18 = 0;
  BOOL v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__1;
  BOOL v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  id v6 = +[REMXPCDaemonController weakSharedInstance];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__REMStore_destroyIsolatedStoreContainerWithToken_error___block_invoke;
  v12[3] = &unk_1E61DC270;
  id v7 = v5;
  id v13 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__REMStore_destroyIsolatedStoreContainerWithToken_error___block_invoke_31;
  v11[3] = &unk_1E61DC298;
  v11[4] = &v14;
  v11[5] = &v18;
  [v6 asyncDebugPerformerWithReason:@"destroyIsolatedStoreContainerWithToken" loadHandler:v12 errorHandler:v11];
  int v8 = *((unsigned __int8 *)v15 + 24);
  if (a4 && !*((unsigned char *)v15 + 24))
  {
    *a4 = (id) v19[5];
    int v8 = *((unsigned __int8 *)v15 + 24);
  }
  BOOL v9 = v8 != 0;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v9;
}

void __57__REMStore_destroyIsolatedStoreContainerWithToken_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__REMStore_destroyIsolatedStoreContainerWithToken_error___block_invoke_2;
  v4[3] = &unk_1E61DC248;
  id v5 = v3;
  [a2 destroyIsolatedStoreContainerWithToken:v5 completion:v4];
}

void __57__REMStore_destroyIsolatedStoreContainerWithToken_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[REMLog xpc];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __57__REMStore_destroyIsolatedStoreContainerWithToken_error___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_INFO, "Did destroy isolated store container {token: %@}", (uint8_t *)&v7, 0xCu);
  }
}

void __57__REMStore_destroyIsolatedStoreContainerWithToken_error___block_invoke_31(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __57__REMStore_destroyIsolatedStoreContainerWithToken_error___block_invoke_31_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (REMStore)initWithStoreContainerToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[REMXPCDaemonController alloc] initWithStoreContainerToken:v4];
  uint64_t v6 = [(REMStore *)self initWithDaemonController:v5 storeContainerToken:v4];

  return v6;
}

- (id)description
{
  id v3 = [(REMStore *)self storeContainerToken];

  if (v3)
  {
    id v4 = NSString;
    uint64_t v5 = objc_opt_class();
    unint64_t v6 = [(REMStore *)self storeGeneration];
    int v7 = [(REMStore *)self storeContainerToken];
    uint64_t v8 = [v4 stringWithFormat:@"<%@: %p[%ld] storeContainerToken: %@>", v5, self, v6, v7];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)REMStore;
    uint64_t v8 = [(REMStore *)&v10 description];
  }

  return v8;
}

- (id)debugDescription
{
  id v3 = NSString;
  id v4 = [(REMStore *)self description];
  uint64_t v5 = [(REMStore *)self l_inProgressSaveRequestsContainer];
  unint64_t v6 = [v3 stringWithFormat:@"<%@ inProgressSaveRequestContainer: %@>", v4, v5];

  return v6;
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = [(REMStore *)self storeContainerToken];

  id v4 = +[REMLogStore xpc];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v6 = 138412290;
      int v7 = self;
      _os_log_impl(&dword_1B9AA2000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating REMStore {store: %@}", (uint8_t *)&v6, 0xCu);
    }

    id v4 = [(REMStore *)self daemonController];
    [v4 invalidate];
  }
  else if (v5)
  {
    int v6 = 138412290;
    int v7 = self;
    _os_log_impl(&dword_1B9AA2000, v4, OS_LOG_TYPE_DEFAULT, "Not invalidating connection for REMStore because its not an isolated store {store: %@}", (uint8_t *)&v6, 0xCu);
  }

  [(REMStore *)self setDaemonController:0];
}

- (void)nukeDatabase
{
  id v2 = [(REMStore *)self daemonController];
  id v3 = [v2 syncDebugPerformerWithReason:@"nukeDatabase" errorHandler:&__block_literal_global_47_0];

  [v3 nukeDatabase:&__block_literal_global_50_0];
}

void __24__REMStore_nukeDatabase__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[REMLogStore xpc];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__REMStore_nukeDatabase__block_invoke_cold_1();
  }
}

void __24__REMStore_nukeDatabase__block_invoke_48(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = +[REMLogStore write];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1B9AA2000, v3, OS_LOG_TYPE_DEFAULT, "Nuked database with error: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)fetchAccountsWithError:(id *)a3
{
  int v4 = [[REMAccountsDataView alloc] initWithStore:self];
  id v5 = [(REMAccountsDataView *)v4 fetchAllAccountsWithError:a3];

  return v5;
}

- (id)fetchAccountsIncludingInactive:(BOOL)a3 error:(id *)a4
{
  if (a3)
  {
    id v5 = [[REMAccountsDataView alloc] initWithStore:self];
    uint64_t v6 = [(REMAccountsDataView *)v5 fetchAllAccountsForAccountManagementWithError:a4];
  }
  else
  {
    uint64_t v6 = [(REMStore *)self fetchAccountsWithError:a4];
  }

  return v6;
}

- (id)fetchAccountsForDumpingWithError:(id *)a3
{
  int v4 = [[REMAccountsDataView alloc] initWithStore:self];
  id v5 = [(REMAccountsDataView *)v4 fetchAllAccountsForDumpingWithError:a3];

  return v5;
}

- (id)fetchSiriFoundInAppsListWithError:(id *)a3
{
  id v5 = +[REMList siriFoundInAppsListID];
  uint64_t v6 = [(REMStore *)self fetchListWithObjectID:v5 error:a3];

  return v6;
}

- (id)refreshAccount:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __27__REMStore_refreshAccount___block_invoke;
  v10[3] = &unk_1E61DC2E0;
  id v11 = v4;
  id v5 = v4;
  uint64_t v6 = [(REMStore *)self _withInProgressSaveRequestContainer:v10];
  int v7 = v6;
  if (!v6) {
    uint64_t v6 = v5;
  }
  id v8 = v6;

  return v8;
}

uint64_t __27__REMStore_refreshAccount___block_invoke(uint64_t a1, void *a2)
{
  return [a2 latestSaveInProgressAccount:*(void *)(a1 + 32)];
}

- (id)refreshList:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __24__REMStore_refreshList___block_invoke;
  v10[3] = &unk_1E61DC2E0;
  id v11 = v4;
  id v5 = v4;
  uint64_t v6 = [(REMStore *)self _withInProgressSaveRequestContainer:v10];
  int v7 = v6;
  if (!v6) {
    uint64_t v6 = v5;
  }
  id v8 = v6;

  return v8;
}

uint64_t __24__REMStore_refreshList___block_invoke(uint64_t a1, void *a2)
{
  return [a2 latestSaveInProgressList:*(void *)(a1 + 32)];
}

- (id)refreshReminder:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __28__REMStore_refreshReminder___block_invoke;
  v10[3] = &unk_1E61DC2E0;
  id v11 = v4;
  id v5 = v4;
  uint64_t v6 = [(REMStore *)self _withInProgressSaveRequestContainer:v10];
  int v7 = v6;
  if (!v6) {
    uint64_t v6 = v5;
  }
  id v8 = v6;

  return v8;
}

uint64_t __28__REMStore_refreshReminder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 latestSaveInProgressReminder:*(void *)(a1 + 32)];
}

- (id)optimisticallyMaterializeReminderChangeItem:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__REMStore_optimisticallyMaterializeReminderChangeItem___block_invoke;
  v8[3] = &unk_1E61DC2E0;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(REMStore *)self _withInProgressSaveRequestContainer:v8];

  return v6;
}

uint64_t __56__REMStore_optimisticallyMaterializeReminderChangeItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 latestSaveInProgressReminderForReminderChangeItem:*(void *)(a1 + 32)];
}

- (id)fetchPrimaryActiveCloudKitAccountREMObjectIDWithError:(id *)a3
{
  id v4 = [[REMAccountsDataView alloc] initWithStore:self];
  id v5 = [(REMAccountsDataView *)v4 fetchPrimaryActiveCloudKitAccountREMObjectIDWithError:a3];

  return v5;
}

- (id)fetchPrimaryActiveCloudKitAccountWithError:(id *)a3
{
  id v4 = [[REMAccountsDataView alloc] initWithStore:self];
  id v5 = [(REMAccountsDataView *)v4 fetchPrimaryActiveCloudKitAccountWithError:a3];

  return v5;
}

- (id)fetchActiveCloudKitAccountObjectIDsWithFetchOption:(int64_t)a3 error:(id *)a4
{
  uint64_t v6 = [[REMAccountsDataView alloc] initWithStore:self];
  int v7 = [(REMAccountsDataView *)v6 fetchActiveCloudKitAccountObjectIDsWithFetchOption:a3 error:a4];

  return v7;
}

- (id)fetchAccountWithObjectID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "accountObjectID");
  }
  int v7 = [[REMAccountsDataView alloc] initWithStore:self];
  id v8 = [(REMAccountsDataView *)v7 fetchAccountWithObjectID:v6 error:a4];

  return v8;
}

- (id)fetchAccountsWithObjectIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "accountObjectIDs");
  }
  int v7 = [[REMAccountsDataView alloc] initWithStore:self];
  id v8 = [(REMAccountsDataView *)v7 fetchAccountsWithObjectIDs:v6 error:a4];

  return v8;
}

- (id)fetchListWithObjectID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
  }
  int v7 = [[REMListsDataView alloc] initWithStore:self];
  id v8 = [(REMListsDataView *)v7 fetchListWithObjectID:v6 error:a4];

  return v8;
}

- (id)fetchCustomSmartListWithObjectID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [[REMSmartListsDataView alloc] initWithStore:self];
  id v8 = [(REMSmartListsDataView *)v7 fetchCustomSmartListWithObjectID:v6 error:a4];

  return v8;
}

- (id)fetchCustomSmartListsWithError:(id *)a3
{
  id v4 = [[REMSmartListsDataView alloc] initWithStore:self];
  id v5 = [(REMSmartListsDataView *)v4 fetchCustomSmartListsWithError:a3];

  return v5;
}

- (id)fetchRemindersWithObjectIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = +[REMReminderFetchOptions defaultFetchOptions];
  id v8 = [(REMStore *)self fetchRemindersWithObjectIDs:v6 fetchOptions:v7 error:a4];

  return v8;
}

- (id)fetchRemindersWithObjectIDs:(id)a3 fetchOptions:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = [[REMRemindersDataView alloc] initWithStore:self];
  id v11 = [(REMRemindersDataView *)v10 fetchRemindersWithObjectIDs:v9 fetchOptions:v8 error:a5];

  return v11;
}

- (id)fetchRemindersMatchingPredicateDescriptor:(id)a3 sortDescriptors:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[REMRemindersDataView alloc] initWithStore:self];
  uint64_t v14 = [(REMRemindersDataView *)v13 fetchRemindersMatchingPredicateDescriptor:v12 sortDescriptors:v11 options:v10 error:a6];

  return v14;
}

- (id)fetchRemindersWithParentReminderIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [[REMRemindersDataView alloc] initWithStore:self];
  id v8 = [(REMRemindersDataView *)v7 fetchRemindersWithParentReminderIDs:v6 error:a4];

  return v8;
}

- (id)fetchReminderWithObjectID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
  }
  int v7 = +[REMReminderFetchOptions defaultFetchOptions];
  id v8 = [(REMStore *)self fetchReminderWithObjectID:v6 fetchOptions:v7 error:a4];

  return v8;
}

- (id)fetchReminderWithObjectID:(id)a3 fetchOptions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
  }
  id v10 = [[REMRemindersDataView alloc] initWithStore:self];
  id v11 = [(REMRemindersDataView *)v10 fetchReminderWithObjectID:v8 fetchOptions:v9 error:a5];

  return v11;
}

- (id)fetchReplicaManagerForAccountID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "accountID");
  }
  uint64_t v25 = 0;
  BOOL v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__1;
  id v29 = __Block_byref_object_dispose__1;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = __Block_byref_object_copy__1;
  id v23 = __Block_byref_object_dispose__1;
  id v24 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__REMStore_fetchReplicaManagerForAccountID_error___block_invoke;
  v16[3] = &unk_1E61DC308;
  id v7 = v6;
  id v17 = v7;
  uint64_t v18 = &v25;
  id v8 = [(REMStore *)self _xpcSyncStorePerformerWithReason:@"fetchReplicaManagerForAccountID:" errorHandler:v16];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__REMStore_fetchReplicaManagerForAccountID_error___block_invoke_69;
  v12[3] = &unk_1E61DC330;
  id v9 = v7;
  id v13 = v9;
  uint64_t v14 = &v19;
  uint64_t v15 = &v25;
  [v8 fetchReplicaManagerForAccountID:v9 completion:v12];
  if (a4) {
    *a4 = (id) v26[5];
  }
  id v10 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v10;
}

void __50__REMStore_fetchReplicaManagerForAccountID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __50__REMStore_fetchReplicaManagerForAccountID_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __50__REMStore_fetchReplicaManagerForAccountID_error___block_invoke_69(void *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[REMLogStore read];
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __50__REMStore_fetchReplicaManagerForAccountID_error___block_invoke_69_cold_1();
    }

    id v9 = (void **)(*(void *)(a1[6] + 8) + 40);
    id v10 = v6;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = a1[4];
    int v14 = 138412546;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_1B9AA2000, v8, OS_LOG_TYPE_INFO, "Store replica manager fetch successful {account: %@, fetchSerializedData: %@}", (uint8_t *)&v14, 0x16u);
  }

  if (v5)
  {
    id v9 = (void **)(*(void *)(a1[5] + 8) + 40);
    id v10 = v5;
LABEL_9:
    id v12 = v10;
    id v13 = *v9;
    void *v9 = v12;
  }
}

- (id)fetchReplicaManagersForAccountID:(id)a3 bundleID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__1;
  v34 = __Block_byref_object_dispose__1;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  id v29 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __60__REMStore_fetchReplicaManagersForAccountID_bundleID_error___block_invoke;
  v21[3] = &unk_1E61DC308;
  id v10 = v8;
  id v22 = v10;
  id v23 = &v30;
  uint64_t v11 = [(REMStore *)self _xpcSyncStorePerformerWithReason:@"fetchReplicaManagersForAccountID" errorHandler:v21];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60__REMStore_fetchReplicaManagersForAccountID_bundleID_error___block_invoke_74;
  v16[3] = &unk_1E61DC358;
  id v12 = v10;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  uint64_t v19 = &v24;
  uint64_t v20 = &v30;
  [v11 fetchReplicaManagersForAccountID:v12 bundleID:v13 completion:v16];
  if (a5) {
    *a5 = (id) v31[5];
  }
  id v14 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v14;
}

void __60__REMStore_fetchReplicaManagersForAccountID_bundleID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __50__REMStore_fetchReplicaManagerForAccountID_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __60__REMStore_fetchReplicaManagersForAccountID_bundleID_error___block_invoke_74(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[REMLogStore read];
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __60__REMStore_fetchReplicaManagersForAccountID_bundleID_error___block_invoke_74_cold_1();
    }

    id v9 = (void **)(*(void *)(a1[7] + 8) + 40);
    id v10 = v6;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = a1[4];
    uint64_t v12 = a1[5];
    int v15 = 138412802;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    __int16 v19 = 2048;
    uint64_t v20 = [v5 count];
    _os_log_impl(&dword_1B9AA2000, v8, OS_LOG_TYPE_INFO, "Store replica manager fetch successful {account: %@, bundleID: %@, managerByID.count: %lu}", (uint8_t *)&v15, 0x20u);
  }

  if (v5)
  {
    id v9 = (void **)(*(void *)(a1[6] + 8) + 40);
    id v10 = v5;
LABEL_9:
    id v13 = v10;
    id v14 = *v9;
    void *v9 = v13;
  }
}

- (BOOL)saveSaveRequest:(id)a3 accountChangeItems:(id)a4 listChangeItems:(id)a5 listSectionChangeItems:(id)a6 smartListChangeItems:(id)a7 smartListSectionChangeItems:(id)a8 templateChangeItems:(id)a9 templateSectionChangeItems:(id)a10 reminderChangeItems:(id)a11 author:(id)a12 replicaManagerProvider:(id)a13 error:(id *)a14
{
  id v35 = a3;
  id v39 = a4;
  id v38 = a5;
  id v37 = a6;
  id v36 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x3032000000;
  uint64_t v53 = __Block_byref_object_copy__1;
  v54 = __Block_byref_object_dispose__1;
  id v55 = 0;
  uint64_t v46 = 0;
  id v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  [(REMStore *)self _incrementStoreGeneration];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __238__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_error___block_invoke;
  v44[3] = &unk_1E61DC2E0;
  id v26 = v35;
  id v45 = v26;
  id v27 = [(REMStore *)self _withInProgressSaveRequestContainer:v44];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __238__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_error___block_invoke_2;
  v43[3] = &unk_1E61DC380;
  v43[4] = self;
  v43[5] = &v50;
  v43[6] = &v46;
  v28 = [(REMStore *)self _xpcSyncStorePerformerWithReason:@"saveRequest" errorHandler:v43];
  char v29 = [v26 syncToCloudKit];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __238__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_error___block_invoke_79;
  v42[3] = &unk_1E61DC298;
  v42[4] = &v50;
  v42[5] = &v46;
  BYTE1(v34) = v29;
  LOBYTE(v34) = 1;
  -[REMStore _saveAccountChangeItems:listChangeItems:listSectionChangeItems:smartListChangeItems:smartListSectionChangeItems:templateChangeItems:templateSectionChangeItems:reminderChangeItems:author:replicaManagerProvider:synchronously:syncToCloudKit:performer:completion:](self, "_saveAccountChangeItems:listChangeItems:listSectionChangeItems:smartListChangeItems:smartListSectionChangeItems:templateChangeItems:templateSectionChangeItems:reminderChangeItems:author:replicaManagerProvider:synchronously:syncToCloudKit:performer:completion:", v39, v38, v37, v36, v20, v21, v22, v23, v24, v25, v34, v28, v42);
  if (a14) {
    *a14 = (id) v51[5];
  }
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __238__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_error___block_invoke_2_80;
  v40[3] = &unk_1E61DC2E0;
  id v30 = v26;
  id v41 = v30;
  id v31 = [(REMStore *)self _withInProgressSaveRequestContainer:v40];
  char v32 = *((unsigned char *)v47 + 24);

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);

  return v32;
}

uint64_t __238__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_error___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

void __238__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __238__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_error___block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
}

void __238__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_error___block_invoke_79(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4 == 0;
}

uint64_t __238__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_error___block_invoke_2_80(uint64_t a1, void *a2)
{
  return 0;
}

- (void)saveSaveRequest:(id)a3 accountChangeItems:(id)a4 listChangeItems:(id)a5 listSectionChangeItems:(id)a6 smartListChangeItems:(id)a7 smartListSectionChangeItems:(id)a8 templateChangeItems:(id)a9 templateSectionChangeItems:(id)a10 reminderChangeItems:(id)a11 author:(id)a12 replicaManagerProvider:(id)a13 queue:(id)a14 completion:(id)a15
{
  id v49 = a3;
  id v52 = a4;
  id v51 = a5;
  id v21 = a6;
  id v22 = a7;
  id v37 = a8;
  id v23 = a9;
  id v24 = a10;
  id v40 = a11;
  id v42 = a12;
  id v44 = a13;
  id v25 = a14;
  id v26 = a15;
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke;
  v70[3] = &unk_1E61DC3D0;
  id v71 = v25;
  v72 = self;
  id v27 = v49;
  id v73 = v27;
  id v74 = v26;
  id v50 = v26;
  id v48 = v25;
  uint64_t v46 = (void *)MEMORY[0x1BA9DBBC0](v70);
  [(REMStore *)self _incrementStoreGeneration];
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke_4;
  v68[3] = &unk_1E61DC2E0;
  id v28 = v27;
  id v69 = v28;
  id v29 = [(REMStore *)self _withInProgressSaveRequestContainer:v68];
  id v36 = [(REMStore *)self daemonController];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke_5;
  v55[3] = &unk_1E61DC420;
  v55[4] = self;
  id v56 = v52;
  id v57 = v51;
  id v58 = v21;
  id v59 = v22;
  id v60 = v37;
  id v61 = v23;
  id v62 = v24;
  id v63 = v40;
  id v64 = v42;
  id v65 = v44;
  id v66 = v28;
  id v67 = v46;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke_7;
  v53[3] = &unk_1E61DC448;
  v53[4] = self;
  id v54 = v67;
  id v30 = v67;
  id v47 = v28;
  id v45 = v44;
  id v43 = v42;
  id v41 = v40;
  id v31 = v24;
  id v39 = v23;
  id v38 = v37;
  id v32 = v22;
  id v33 = v21;
  id v34 = v51;
  id v35 = v52;
  [v36 asyncStorePerformerWithReason:@"saveRequest" loadHandler:v55 errorHandler:v53];
}

void __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke_2;
  v8[3] = &unk_1E61DC3A8;
  id v4 = *(NSObject **)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 48);
  void v8[4] = *(void *)(a1 + 40);
  id v9 = v5;
  id v6 = *(id *)(a1 + 56);
  id v10 = v3;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v4, v8);
}

void __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke_2(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke_3;
  v4[3] = &unk_1E61DC2E0;
  id v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = (id)[v2 _withInProgressSaveRequestContainer:v4];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return 0;
}

uint64_t __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  return 0;
}

void __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v14 = *(void *)(a1 + 40);
  int v15 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 80);
  long long v12 = *(_OWORD *)(a1 + 88);
  uint64_t v7 = *(void *)(a1 + 104);
  uint64_t v8 = *(void *)(a1 + 112);
  id v9 = *(void **)(a1 + 120);
  id v10 = a2;
  LOBYTE(v9) = [v9 syncToCloudKit];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke_6;
  v16[3] = &unk_1E61DC3F8;
  id v17 = *(id *)(a1 + 128);
  BYTE1(v11) = (_BYTE)v9;
  LOBYTE(v11) = 0;
  objc_msgSend(v15, "_saveAccountChangeItems:listChangeItems:listSectionChangeItems:smartListChangeItems:smartListSectionChangeItems:templateChangeItems:templateSectionChangeItems:reminderChangeItems:author:replicaManagerProvider:synchronously:syncToCloudKit:performer:completion:", v14, v13, v3, v4, v5, v6, v12, v7, v8, v11, v10, v16);
}

uint64_t __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __249__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_queue_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __238__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_error___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)processNoOpSaveRequest:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__REMStore_processNoOpSaveRequest_queue_completion___block_invoke;
  v18[3] = &unk_1E61DC2E0;
  id v10 = v8;
  id v19 = v10;
  uint64_t v11 = a4;
  id v12 = [(REMStore *)self _withInProgressSaveRequestContainer:v18];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__REMStore_processNoOpSaveRequest_queue_completion___block_invoke_2;
  v15[3] = &unk_1E61DC470;
  void v15[4] = self;
  id v16 = v10;
  id v17 = v9;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(v11, v15);
}

uint64_t __52__REMStore_processNoOpSaveRequest_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

void __52__REMStore_processNoOpSaveRequest_queue_completion___block_invoke_2(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__REMStore_processNoOpSaveRequest_queue_completion___block_invoke_3;
  v4[3] = &unk_1E61DC2E0;
  id v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = (id)[v2 _withInProgressSaveRequestContainer:v4];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __52__REMStore_processNoOpSaveRequest_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return 0;
}

- (id)executeFetchRequest:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(REMStore *)self fetchResultByExecutingFetchRequest:v6 error:a4];
  if (v7)
  {
    id v8 = [v6 fetchExecutor];
    id v13 = 0;
    id v9 = [v8 resultsFromFetchResult:v7 inStore:self error:&v13];
    id v10 = v13;

    if (!v9)
    {
      uint64_t v11 = +[REMLogStore read];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v15 = v10;
        __int16 v16 = 2112;
        id v17 = v7;
        __int16 v18 = 2112;
        id v19 = v6;
        _os_log_error_impl(&dword_1B9AA2000, v11, OS_LOG_TYPE_ERROR, "Failed to get results from fetchResult {error: %@, fetchResult: %@, fetchRequest: %@}", buf, 0x20u);
      }

      if (a4) {
        *a4 = v10;
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)resultsIndexedByObjectIDFromExecutingFetchRequest:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = +[REMSignpost database];
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  id v9 = v7;
  id v10 = v9;
  unint64_t v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9AA2000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "REMStore.fetchByObjectID", (const char *)&unk_1B9BF4B6D, buf, 2u);
  }

  id v12 = [(REMStore *)self executeFetchRequest:v6 error:a4];
  if (v12)
  {
    os_signpost_id_t v24 = v8;
    id v25 = v6;
    id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v12, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v20 = objc_msgSend(v19, "remObjectID", v24, v25, (void)v26);
          [v13 setObject:v19 forKeyedSubscript:v20];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v16);
    }

    os_signpost_id_t v8 = v24;
    id v6 = v25;
  }
  else
  {
    id v13 = 0;
  }
  id v21 = v10;
  id v22 = v21;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9AA2000, v22, OS_SIGNPOST_INTERVAL_END, v8, "REMStore.fetchByObjectID", (const char *)&unk_1B9BF4B6D, buf, 2u);
  }

  return v13;
}

- (unint64_t)countForFetchRequest:(id)a3 error:(id *)a4
{
  id v6 = (void *)[a3 copy];
  uint64_t v7 = [(REMStore *)self fetchResultByExecutingFetchRequest:v6 error:a4];
  unint64_t v8 = [v7 count];

  return v8;
}

- (id)fetchResultByExecutingFetchRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x3032000000;
  long long v29 = __Block_byref_object_copy__1;
  id v30 = __Block_byref_object_dispose__1;
  id v31 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__1;
  os_signpost_id_t v24 = __Block_byref_object_dispose__1;
  id v25 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __53__REMStore_fetchResultByExecutingFetchRequest_error___block_invoke;
  v17[3] = &unk_1E61DC308;
  id v7 = v6;
  id v18 = v7;
  id v19 = &v26;
  unint64_t v8 = [(REMStore *)self _xpcSyncStorePerformerWithReason:@"fetchRequest" errorHandler:v17];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__REMStore_fetchResultByExecutingFetchRequest_error___block_invoke_87;
  v12[3] = &unk_1E61DC498;
  id v9 = v7;
  id v13 = v9;
  id v14 = self;
  uint64_t v15 = &v20;
  uint64_t v16 = &v26;
  [v8 executeFetchRequest:v9 completion:v12];
  if (a4) {
    *a4 = (id) v27[5];
  }
  id v10 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v10;
}

void __53__REMStore_fetchResultByExecutingFetchRequest_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __53__REMStore_fetchResultByExecutingFetchRequest_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __53__REMStore_fetchResultByExecutingFetchRequest_error___block_invoke_87(void *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[REMLogStore read];
  unint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __53__REMStore_fetchResultByExecutingFetchRequest_error___block_invoke_87_cold_2();
    }

    uint64_t v9 = *(void *)(a1[7] + 8);
    id v10 = v6;
LABEL_11:
    id v13 = *(NSObject **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unint64_t v11 = (void *)a1[4];
    int v21 = 138412546;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_impl(&dword_1B9AA2000, v8, OS_LOG_TYPE_INFO, "Store fetch successful {fetchRequest: %@, fetchResult: %@}", (uint8_t *)&v21, 0x16u);
  }

  id v12 = +[REMLogStore read];
  id v13 = v12;
  if (v5)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412290;
      id v22 = v5;
      _os_log_impl(&dword_1B9AA2000, v13, OS_LOG_TYPE_INFO, "Successfully executed fetch {fetchResult: %@}", (uint8_t *)&v21, 0xCu);
    }

    uint64_t v9 = *(void *)(a1[6] + 8);
    id v10 = v5;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    __53__REMStore_fetchResultByExecutingFetchRequest_error___block_invoke_87_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
  }
LABEL_12:
}

- (id)resultFromPerformingInvocation:(id)a3 error:(id *)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(REMStore *)self assertOnMainThreadFetches]) {
    dispatch_assert_queue_not_V2(MEMORY[0x1E4F14428]);
  }
  [(REMStore *)self _incrementStoreGeneration];
  uint64_t v41 = 0;
  id v42 = &v41;
  uint64_t v43 = 0x3032000000;
  id v44 = __Block_byref_object_copy__1;
  id v45 = __Block_byref_object_dispose__1;
  id v46 = 0;
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__1;
  id v39 = __Block_byref_object_dispose__1;
  id v40 = 0;
  id v7 = _os_activity_create(&dword_1B9AA2000, "REMStore Invocation", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  BOOL v8 = [(REMStore *)self _isUserInteractiveStore];
  uint64_t v9 = +[REMSignpost database];
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  unint64_t v11 = v9;
  id v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    id v13 = [v6 name];
    uint64_t v14 = [v13 cStringUsingEncoding:1];
    *(_DWORD *)buf = 136446466;
    uint64_t v48 = v14;
    __int16 v49 = 1026;
    BOOL v50 = v8;
    _os_signpost_emit_with_name_impl(&dword_1B9AA2000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "REMStore.invocation", " enableTelemetry=YES Name=%{public, signpost.telemetry:string1, Name=InvocationName}s UserInteractive=%{public, signpost.telemetry:number1, Name=UserInteractive}d", buf, 0x12u);
  }
  uint64_t v15 = +[REMLogStore read];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v6 name];
    *(_DWORD *)buf = 138543362;
    uint64_t v48 = (uint64_t)v16;
    _os_log_impl(&dword_1B9AA2000, v15, OS_LOG_TYPE_DEFAULT, "FETCH START {name: %{public}@}", buf, 0xCu);
  }
  uint64_t v17 = NSString;
  uint64_t v18 = [v6 name];
  uint64_t v19 = [v17 stringWithFormat:@"inv_%@", v18];

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __49__REMStore_resultFromPerformingInvocation_error___block_invoke;
  v31[3] = &unk_1E61DC308;
  id v20 = v6;
  id v32 = v20;
  id v33 = &v41;
  int v21 = [(REMStore *)self _xpcSyncStorePerformerWithReason:v19 errorHandler:v31];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __49__REMStore_resultFromPerformingInvocation_error___block_invoke_92;
  v27[3] = &unk_1E61DC4C0;
  id v22 = v20;
  id v28 = v22;
  long long v29 = &v35;
  id v30 = &v41;
  [v21 performInvocation:v22 completion:v27];
  if (a4) {
    *a4 = (id) v42[5];
  }
  __int16 v23 = v12;
  id v24 = v23;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9AA2000, v24, OS_SIGNPOST_INTERVAL_END, v10, "REMStore.invocation", " enableTelemetry=YES ", buf, 2u);
  }

  id v25 = (id)v36[5];
  os_activity_scope_leave(&state);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  return v25;
}

void __49__REMStore_resultFromPerformingInvocation_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __49__REMStore_resultFromPerformingInvocation_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __49__REMStore_resultFromPerformingInvocation_error___block_invoke_92(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[REMLogStore read];
  BOOL v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __49__REMStore_resultFromPerformingInvocation_error___block_invoke_92_cold_1();
    }

    uint64_t v9 = (void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    os_signpost_id_t v10 = v6;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v11 = [*(id *)(a1 + 32) name];
      int v14 = 138543362;
      uint64_t v15 = v11;
      _os_log_impl(&dword_1B9AA2000, v8, OS_LOG_TYPE_DEFAULT, "FETCH END {name: %{public}@}", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v9 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    os_signpost_id_t v10 = v5;
  }
  id v12 = v10;
  id v13 = *v9;
  NSObject *v9 = v12;
}

void __78__REMStore_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __78__REMStore_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (void)enumerateAllRemindersWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__REMStore_enumerateAllRemindersWithBlock___block_invoke;
    v6[3] = &unk_1E61DC538;
    id v7 = v4;
    [(REMStore *)self enumerateAllListsWithBlock:v6];
  }
}

void __43__REMStore_enumerateAllRemindersWithBlock___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  char v20 = 0;
  id v19 = 0;
  id v6 = [v5 fetchRemindersWithError:&v19];
  id v7 = v19;
  if (v7)
  {
    BOOL v8 = +[REMLogStore read];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __43__REMStore_enumerateAllRemindersWithBlock___block_invoke_cold_1((uint64_t)v5, v7, v8);
    }
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = (void *)MEMORY[0x1BA9DB950](v10);
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
        if (v20)
        {
          *a3 = 1;
          goto LABEL_15;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v21 count:16];
      uint64_t v11 = v10;
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

- (void)enumerateAllListsWithBlock:(id)a3
{
}

- (void)enumerateAllGroupsAndListsWithBlock:(id)a3
{
}

- (void)_enumerateAllListsIncludingGroups:(BOOL)a3 withBlock:(id)a4
{
  BOOL v4 = a3;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *, unsigned char *))a4;
  if (v6)
  {
    unsigned __int8 v60 = 0;
    id v59 = 0;
    id v7 = [(REMStore *)self fetchAccountsWithError:&v59];
    id v8 = v59;
    id v9 = &off_1E61DB000;
    if (v8)
    {
      uint64_t v10 = +[REMLogStore read];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[REMStore _enumerateAllListsIncludingGroups:withBlock:](v8, v10);
      }
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v55 objects:v67 count:16];
    if (v12)
    {
      uint64_t v14 = *(void *)v56;
      *(void *)&long long v13 = 138412546;
      long long v34 = v13;
      BOOL v36 = v4;
      uint64_t v41 = v11;
      uint64_t v35 = *(void *)v56;
      do
      {
        uint64_t v15 = 0;
        uint64_t v38 = v12;
        do
        {
          if (*(void *)v56 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v39 = v15;
          long long v16 = *(void **)(*((void *)&v55 + 1) + 8 * v15);
          context = (void *)MEMORY[0x1BA9DB950]();
          id v54 = v8;
          long long v17 = [v16 fetchListsWithError:&v54];
          id v18 = v54;

          if (v18)
          {
            id v19 = [v9[258] read];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              id v33 = [v18 localizedDescription];
              *(_DWORD *)buf = v34;
              id v64 = v16;
              __int16 v65 = 2112;
              id v66 = v33;
              _os_log_error_impl(&dword_1B9AA2000, v19, OS_LOG_TYPE_ERROR, "Unexpected error when fetching all lists from account {account: %@, error: %@}", buf, 0x16u);
            }
          }
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v20 = v17;
          uint64_t v44 = [v20 countByEnumeratingWithState:&v50 objects:v62 count:16];
          if (v44)
          {
            uint64_t v21 = *(void *)v51;
            id v8 = v18;
            id v40 = v20;
            uint64_t v37 = *(void *)v51;
            while (2)
            {
              for (uint64_t i = 0; i != v44; ++i)
              {
                if (*(void *)v51 != v21) {
                  objc_enumerationMutation(v20);
                }
                __int16 v23 = *(void **)(*((void *)&v50 + 1) + 8 * i);
                id v24 = (void *)MEMORY[0x1BA9DB950]();
                if ([v23 isGroup])
                {
                  if (v4)
                  {
                    v6[2](v6, v23, &v60);
                    if (v60)
                    {
LABEL_41:

                      id v11 = v41;
                      goto LABEL_42;
                    }
                  }
                  long long v48 = 0u;
                  long long v49 = 0u;
                  long long v46 = 0u;
                  long long v47 = 0u;
                  id v25 = objc_msgSend(v23, "sublistContext", v34);
                  id v45 = v8;
                  uint64_t v26 = [v25 fetchListsWithError:&v45];
                  id v42 = v45;

                  uint64_t v27 = [v26 countByEnumeratingWithState:&v46 objects:v61 count:16];
                  if (v27)
                  {
                    uint64_t v28 = v27;
                    uint64_t v29 = *(void *)v47;
                    while (2)
                    {
                      for (uint64_t j = 0; j != v28; ++j)
                      {
                        if (*(void *)v47 != v29) {
                          objc_enumerationMutation(v26);
                        }
                        id v31 = *(void **)(*((void *)&v46 + 1) + 8 * j);
                        id v32 = (void *)MEMORY[0x1BA9DB950]();
                        v6[2](v6, v31, &v60);
                        LODWORD(v31) = v60;
                        if (v31)
                        {

                          id v8 = v42;
                          id v20 = v40;
                          goto LABEL_41;
                        }
                      }
                      uint64_t v28 = [v26 countByEnumeratingWithState:&v46 objects:v61 count:16];
                      if (v28) {
                        continue;
                      }
                      break;
                    }
                  }

                  id v8 = v42;
                  BOOL v4 = v36;
                  uint64_t v14 = v35;
                  id v20 = v40;
                  uint64_t v21 = v37;
                }
                else
                {
                  v6[2](v6, v23, &v60);
                  if (v60) {
                    goto LABEL_41;
                  }
                }
              }
              id v9 = &off_1E61DB000;
              uint64_t v44 = [v20 countByEnumeratingWithState:&v50 objects:v62 count:16];
              if (v44) {
                continue;
              }
              break;
            }
          }
          else
          {
            id v8 = v18;
          }

          uint64_t v15 = v39 + 1;
          id v11 = v41;
        }
        while (v39 + 1 != v38);
        uint64_t v12 = [v41 countByEnumeratingWithState:&v55 objects:v67 count:16];
      }
      while (v12);
    }
LABEL_42:
  }
}

void __58__REMStore__xpcSyncStorePerformerWithReason_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __58__REMStore__xpcSyncStorePerformerWithReason_errorHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)_addChangeItemChangedKeys:(id)a3 objectID:(id)a4 toChangedKeysMap:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v9 objectForKeyedSubscript:v8];

  if (v10)
  {
    id v11 = +[REMLogStore write];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[REMStore _addChangeItemChangedKeys:objectID:toChangedKeysMap:]();
    }
  }
  [v9 setObject:v7 forKeyedSubscript:v8];
}

- (void)_saveAccountChangeItems:(id)a3 listChangeItems:(id)a4 listSectionChangeItems:(id)a5 smartListChangeItems:(id)a6 smartListSectionChangeItems:(id)a7 templateChangeItems:(id)a8 templateSectionChangeItems:(id)a9 reminderChangeItems:(id)a10 author:(id)a11 replicaManagerProvider:(id)a12 synchronously:(BOOL)a13 syncToCloudKit:(BOOL)a14 performer:(id)a15 completion:(id)a16
{
  uint64_t v232 = *MEMORY[0x1E4F143B8];
  id v165 = a3;
  id v22 = a4;
  id v154 = a5;
  id v163 = a6;
  id v161 = a7;
  id v159 = a8;
  id v157 = a9;
  id v148 = a10;
  id v23 = a11;
  id v144 = a12;
  id v143 = a15;
  id v141 = a16;
  id v24 = +[REMSignpost database];
  os_signpost_id_t v25 = os_signpost_id_generate(v24);
  uint64_t v26 = v24;
  uint64_t v27 = v26;
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9AA2000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "REMStore.save", (const char *)&unk_1B9BF4B6D, buf, 2u);
  }
  os_signpost_id_t v139 = v25;
  v140 = v27;

  uint64_t v28 = +[REMLogStore write];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = [v165 count];
    uint64_t v30 = [v22 count];
    uint64_t v31 = [v163 count];
    uint64_t v32 = [v148 count];
    *(_DWORD *)buf = 138544386;
    uint64_t v223 = (uint64_t)v23;
    __int16 v224 = 2048;
    uint64_t v225 = v29;
    __int16 v226 = 2048;
    uint64_t v227 = v30;
    __int16 v228 = 2048;
    uint64_t v229 = v31;
    __int16 v230 = 2048;
    uint64_t v231 = v32;
    _os_log_impl(&dword_1B9AA2000, v28, OS_LOG_TYPE_DEFAULT, "(client) SAVE START {author: %{public}@, accountChangeItems.count: %lu, listChangeItems.count: %lu, smartListChangeItems: %lu, reminderChangeItems.count: %lu}", buf, 0x34u);
  }
  v145 = v23;

  id v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v22, "count")+ objc_msgSend(v165, "count")+ objc_msgSend(v163, "count")+ objc_msgSend(v148, "count"));
  long long v34 = [MEMORY[0x1E4F1CA80] set];
  v167 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v165, "count"));
  long long v209 = 0u;
  long long v210 = 0u;
  long long v211 = 0u;
  long long v212 = 0u;
  id v35 = v165;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v209 objects:v221 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v210;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v210 != v38) {
          objc_enumerationMutation(v35);
        }
        id v40 = *(void **)(*((void *)&v209 + 1) + 8 * i);
        uint64_t v41 = [v40 storage];
        [v167 addObject:v41];

        id v42 = [v40 objectID];
        uint64_t v43 = [v40 changedKeys];
        [(REMStore *)self _addChangeItemChangedKeys:v43 objectID:v42 toChangedKeysMap:v33];

        [v34 addObject:v42];
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v209 objects:v221 count:16];
    }
    while (v37);
  }
  v151 = v34;
  v138 = v35;

  v150 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v22, "count"));
  long long v205 = 0u;
  long long v206 = 0u;
  long long v207 = 0u;
  long long v208 = 0u;
  obuint64_t j = v22;
  uint64_t v44 = [obj countByEnumeratingWithState:&v205 objects:v220 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v206;
    do
    {
      uint64_t v47 = 0;
      do
      {
        if (*(void *)v206 != v46) {
          objc_enumerationMutation(obj);
        }
        long long v48 = *(void **)(*((void *)&v205 + 1) + 8 * v47);
        long long v49 = [v48 objectID];
        long long v50 = [v49 entityName];
        long long v51 = +[REMList cdEntityName];
        int v52 = [v50 isEqualToString:v51];

        if (v52)
        {
          long long v53 = [v48 storage];
          [v150 addObject:v53];

          id v54 = [v48 changedKeys];
          [(REMStore *)self _addChangeItemChangedKeys:v54 objectID:v49 toChangedKeysMap:v33];

          long long v55 = [v48 accountID];
          [v151 addObject:v55];
LABEL_20:

          goto LABEL_23;
        }
        long long v56 = [v49 entityName];
        long long v57 = +[REMTemplate cdEntityName];
        int v58 = [v56 isEqualToString:v57];

        if (v58)
        {
          id v59 = [v48 changedKeys];
          unsigned __int8 v60 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F136C080];
          char v61 = [v59 isSubsetOfSet:v60];

          if ((v61 & 1) == 0)
          {
            long long v55 = +[REMLogStore write];
            if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT)) {
              -[REMStore _saveAccountChangeItems:listChangeItems:listSectionChangeItems:smartListChangeItems:smartListSectionChangeItems:templateChangeItems:templateSectionChangeItems:reminderChangeItems:author:replicaManagerProvider:synchronously:syncToCloudKit:performer:completion:](&v203, v204, v55);
            }
            goto LABEL_20;
          }
        }
LABEL_23:

        ++v47;
      }
      while (v45 != v47);
      uint64_t v62 = [obj countByEnumeratingWithState:&v205 objects:v220 count:16];
      uint64_t v45 = v62;
    }
    while (v62);
  }

  id v63 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v154, "count"));
  long long v199 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  id v64 = v154;
  uint64_t v65 = [v64 countByEnumeratingWithState:&v199 objects:v219 count:16];
  if (v65)
  {
    uint64_t v66 = v65;
    uint64_t v67 = *(void *)v200;
    do
    {
      for (uint64_t j = 0; j != v66; ++j)
      {
        if (*(void *)v200 != v67) {
          objc_enumerationMutation(v64);
        }
        id v69 = *(void **)(*((void *)&v199 + 1) + 8 * j);
        uint64_t v70 = [v69 storage];
        [v63 addObject:v70];

        id v71 = [v69 changedKeys];
        v72 = [v69 objectID];
        [(REMStore *)self _addChangeItemChangedKeys:v71 objectID:v72 toChangedKeysMap:v33];
      }
      uint64_t v66 = [v64 countByEnumeratingWithState:&v199 objects:v219 count:16];
    }
    while (v66);
  }

  v166 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v163, "count"));
  long long v195 = 0u;
  long long v196 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  id v155 = v163;
  uint64_t v73 = [v155 countByEnumeratingWithState:&v195 objects:v218 count:16];
  if (v73)
  {
    uint64_t v74 = v73;
    uint64_t v75 = *(void *)v196;
    do
    {
      for (uint64_t k = 0; k != v74; ++k)
      {
        if (*(void *)v196 != v75) {
          objc_enumerationMutation(v155);
        }
        v77 = *(void **)(*((void *)&v195 + 1) + 8 * k);
        v78 = [v77 storage];
        [v166 addObject:v78];

        v79 = [v77 changedKeys];
        v80 = [v77 objectID];
        [(REMStore *)self _addChangeItemChangedKeys:v79 objectID:v80 toChangedKeysMap:v33];
      }
      uint64_t v74 = [v155 countByEnumeratingWithState:&v195 objects:v218 count:16];
    }
    while (v74);
  }
  v136 = v63;

  v164 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v161, "count"));
  long long v191 = 0u;
  long long v192 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  id v153 = v161;
  uint64_t v81 = [v153 countByEnumeratingWithState:&v191 objects:v217 count:16];
  if (v81)
  {
    uint64_t v82 = v81;
    uint64_t v83 = *(void *)v192;
    do
    {
      for (uint64_t m = 0; m != v82; ++m)
      {
        if (*(void *)v192 != v83) {
          objc_enumerationMutation(v153);
        }
        v85 = *(void **)(*((void *)&v191 + 1) + 8 * m);
        v86 = [v85 storage];
        [v164 addObject:v86];

        v87 = [v85 changedKeys];
        v88 = [v85 objectID];
        [(REMStore *)self _addChangeItemChangedKeys:v87 objectID:v88 toChangedKeysMap:v33];
      }
      uint64_t v82 = [v153 countByEnumeratingWithState:&v191 objects:v217 count:16];
    }
    while (v82);
  }
  v137 = v64;

  v162 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v159, "count"));
  long long v187 = 0u;
  long long v188 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  id v152 = v159;
  uint64_t v89 = [v152 countByEnumeratingWithState:&v187 objects:v216 count:16];
  if (v89)
  {
    uint64_t v90 = v89;
    uint64_t v91 = *(void *)v188;
    do
    {
      for (uint64_t n = 0; n != v90; ++n)
      {
        if (*(void *)v188 != v91) {
          objc_enumerationMutation(v152);
        }
        v93 = *(void **)(*((void *)&v187 + 1) + 8 * n);
        v94 = [v93 storage];
        [v162 addObject:v94];

        v95 = [v93 changedKeys];
        v96 = [v93 objectID];
        [(REMStore *)self _addChangeItemChangedKeys:v95 objectID:v96 toChangedKeysMap:v33];

        v97 = [v93 accountID];
        [v151 addObject:v97];
      }
      uint64_t v90 = [v152 countByEnumeratingWithState:&v187 objects:v216 count:16];
    }
    while (v90);
  }

  v160 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v157, "count"));
  long long v183 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  id v98 = v157;
  uint64_t v99 = [v98 countByEnumeratingWithState:&v183 objects:v215 count:16];
  if (v99)
  {
    uint64_t v100 = v99;
    uint64_t v101 = *(void *)v184;
    do
    {
      for (iuint64_t i = 0; ii != v100; ++ii)
      {
        if (*(void *)v184 != v101) {
          objc_enumerationMutation(v98);
        }
        v103 = *(void **)(*((void *)&v183 + 1) + 8 * ii);
        v104 = [v103 storage];
        [v160 addObject:v104];

        v105 = [v103 changedKeys];
        v106 = [v103 objectID];
        [(REMStore *)self _addChangeItemChangedKeys:v105 objectID:v106 toChangedKeysMap:v33];
      }
      uint64_t v100 = [v98 countByEnumeratingWithState:&v183 objects:v215 count:16];
    }
    while (v100);
  }
  v135 = v98;

  v158 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v148, "count"));
  long long v179 = 0u;
  long long v180 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  id v107 = v148;
  uint64_t v108 = [v107 countByEnumeratingWithState:&v179 objects:v214 count:16];
  if (v108)
  {
    uint64_t v109 = v108;
    uint64_t v110 = *(void *)v180;
    do
    {
      for (juint64_t j = 0; jj != v109; ++jj)
      {
        if (*(void *)v180 != v110) {
          objc_enumerationMutation(v107);
        }
        v112 = *(void **)(*((void *)&v179 + 1) + 8 * jj);
        v113 = [v112 storage];
        [v158 addObject:v113];

        v114 = [v112 changedKeys];
        v115 = [v112 objectID];
        [(REMStore *)self _addChangeItemChangedKeys:v114 objectID:v115 toChangedKeysMap:v33];

        v116 = [v112 accountID];
        [v151 addObject:v116];
      }
      uint64_t v109 = [v107 countByEnumeratingWithState:&v179 objects:v214 count:16];
    }
    while (v109);
  }
  v134 = v107;

  v117 = [v144 unsavedReplicaManagersForAccountIDs:v151];
  v149 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v117, "count"));
  long long v175 = 0u;
  long long v176 = 0u;
  long long v177 = 0u;
  long long v178 = 0u;
  id v118 = v117;
  uint64_t v119 = [v118 countByEnumeratingWithState:&v175 objects:v213 count:16];
  if (v119)
  {
    uint64_t v120 = v119;
    uint64_t v121 = *(void *)v176;
    do
    {
      for (kuint64_t k = 0; kk != v120; ++kk)
      {
        if (*(void *)v176 != v121) {
          objc_enumerationMutation(v118);
        }
        uint64_t v123 = *(void *)(*((void *)&v175 + 1) + 8 * kk);
        v124 = [v118 objectForKeyedSubscript:v123];
        id v174 = 0;
        v125 = [v124 serializedDataCappedAtMaxSize:1 error:&v174];
        id v126 = v174;

        v127 = +[REMLogStore write];
        v128 = v127;
        if (v125) {
          BOOL v129 = v126 == 0;
        }
        else {
          BOOL v129 = 0;
        }
        if (v129)
        {
          if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
          {
            uint64_t v130 = [v125 version];
            *(_DWORD *)buf = 134218242;
            uint64_t v223 = v130;
            __int16 v224 = 2112;
            uint64_t v225 = v123;
            _os_log_impl(&dword_1B9AA2000, v128, OS_LOG_TYPE_INFO, "Will save REMReplicaManager {version: %llu, accountID: %@}", buf, 0x16u);
          }

          [v149 setObject:v125 forKeyedSubscript:v123];
        }
        else
        {
          if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v223 = (uint64_t)v126;
            _os_log_error_impl(&dword_1B9AA2000, v128, OS_LOG_TYPE_ERROR, "Failed to serialize REMReplicaManager {error: %{public}@}", buf, 0xCu);
          }
        }
      }
      uint64_t v120 = [v118 countByEnumeratingWithState:&v175 objects:v213 count:16];
    }
    while (v120);
  }

  unint64_t v131 = [(REMStore *)self mode];
  v168[0] = MEMORY[0x1E4F143A8];
  v168[1] = 3221225472;
  v168[2] = __271__REMStore__saveAccountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_synchronously_syncToCloudKit_performer_completion___block_invoke;
  v168[3] = &unk_1E61DC560;
  id v169 = v149;
  id v170 = v118;
  v171 = v140;
  id v172 = v141;
  os_signpost_id_t v173 = v139;
  id v147 = v141;
  v146 = v140;
  id v142 = v118;
  id v132 = v149;
  LOWORD(v133) = __PAIR16__(a14, a13);
  objc_msgSend(v143, "saveAccountStorages:listStorages:listSectionStorages:smartListStorages:smartListSectionStorages:templateStorages:templateSectionStorages:reminderStorages:changedKeys:replicaManagers:author:mode:synchronously:syncToCloudKit:completion:", v167, v150, v136, v166, v164, v162, v160, v158, v33, v132, v145, v131, v133, v168);
}

void __271__REMStore__saveAccountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_synchronously_syncToCloudKit_performer_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = +[REMLogStore write];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __271__REMStore__saveAccountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_synchronously_syncToCloudKit_performer_completion___block_invoke_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_DEFAULT, "(client) SAVE END", buf, 2u);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v5 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          id v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
          uint64_t v12 = [v11 version];

          long long v13 = +[REMLogStore write];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            uint64_t v23 = v12;
            __int16 v24 = 2112;
            uint64_t v25 = v10;
            _os_log_impl(&dword_1B9AA2000, v13, OS_LOG_TYPE_INFO, "Marking REMReplicaManager as saved {version: %llu, accountID: %@}", buf, 0x16u);
          }

          uint64_t v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:v10];
          [v14 didSaveVersion:v12];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v7);
      id v3 = 0;
    }
  }

  uint64_t v15 = *(id *)(a1 + 48);
  long long v16 = v15;
  os_signpost_id_t v17 = *(void *)(a1 + 64);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9AA2000, v16, OS_SIGNPOST_INTERVAL_END, v17, "REMStore.save", (const char *)&unk_1B9BF4B6D, buf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)fetchShareForListWithID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "listID");
  }
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__1;
  uint64_t v29 = __Block_byref_object_dispose__1;
  id v30 = 0;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__1;
  uint64_t v23 = __Block_byref_object_dispose__1;
  id v24 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __42__REMStore_fetchShareForListWithID_error___block_invoke;
  v16[3] = &unk_1E61DC308;
  id v7 = v6;
  id v17 = v7;
  long long v18 = &v25;
  uint64_t v8 = [(REMStore *)self _xpcSyncStorePerformerWithReason:@"fetchShareForList" errorHandler:v16];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42__REMStore_fetchShareForListWithID_error___block_invoke_114;
  v12[3] = &unk_1E61DC588;
  id v9 = v7;
  id v13 = v9;
  uint64_t v14 = &v25;
  uint64_t v15 = &v19;
  [v8 fetchShareForObjectWithID:v9 completion:v12];
  if (a4) {
    *a4 = (id) v26[5];
  }
  id v10 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v10;
}

void __42__REMStore_fetchShareForListWithID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __42__REMStore_fetchShareForListWithID_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __42__REMStore_fetchShareForListWithID_error___block_invoke_114(void *a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[REMLogStore read];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __42__REMStore_fetchShareForListWithID_error___block_invoke_114_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
  uint64_t v8 = +[REMLogStore read];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = a1[4];
    int v12 = 138412546;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_1B9AA2000, v8, OS_LOG_TYPE_INFO, "Store fetch share successful {list: %@, share: %@}", (uint8_t *)&v12, 0x16u);
  }

  uint64_t v10 = *(void *)(a1[6] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

- (id)createShareForListWithID:(id)a3 appIconData:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "listID");
  }
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__1;
  uint64_t v32 = __Block_byref_object_dispose__1;
  id v33 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__1;
  uint64_t v26 = __Block_byref_object_dispose__1;
  id v27 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __55__REMStore_createShareForListWithID_appIconData_error___block_invoke;
  v19[3] = &unk_1E61DC308;
  id v10 = v8;
  id v20 = v10;
  uint64_t v21 = &v28;
  id v11 = [(REMStore *)self _xpcSyncStorePerformerWithReason:@"createShareForList" errorHandler:v19];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__REMStore_createShareForListWithID_appIconData_error___block_invoke_119;
  v15[3] = &unk_1E61DC588;
  id v12 = v10;
  id v16 = v12;
  id v17 = &v28;
  long long v18 = &v22;
  [v11 createShareForObjectWithID:v12 appIconData:v9 completion:v15];
  if (a5) {
    *a5 = (id) v29[5];
  }
  id v13 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v13;
}

void __55__REMStore_createShareForListWithID_appIconData_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __55__REMStore_createShareForListWithID_appIconData_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __55__REMStore_createShareForListWithID_appIconData_error___block_invoke_119(void *a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[REMLogStore write];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __55__REMStore_createShareForListWithID_appIconData_error___block_invoke_119_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
  }
  id v8 = +[REMLogStore write];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = a1[4];
    int v12 = 138412546;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_1B9AA2000, v8, OS_LOG_TYPE_INFO, "Store create share successful {list: %@, share: %@}", (uint8_t *)&v12, 0x16u);
  }

  uint64_t v10 = *(void *)(a1[6] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
}

- (void)updateShare:(id)a3 accountID:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __51__REMStore_updateShare_accountID_queue_completion___block_invoke;
  v29[3] = &unk_1E61DC448;
  id v30 = v12;
  id v31 = v13;
  id v14 = v13;
  id v15 = v12;
  uint64_t v16 = (void *)MEMORY[0x1BA9DBBC0](v29);
  id v17 = [(REMStore *)self daemonController];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __51__REMStore_updateShare_accountID_queue_completion___block_invoke_3;
  v25[3] = &unk_1E61DC5D8;
  id v26 = v10;
  id v27 = v11;
  id v28 = v16;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __51__REMStore_updateShare_accountID_queue_completion___block_invoke_5;
  v21[3] = &unk_1E61DC600;
  id v22 = v26;
  id v23 = v27;
  id v24 = v28;
  id v18 = v28;
  id v19 = v27;
  id v20 = v26;
  [v17 asyncStorePerformerWithReason:@"updateShare" loadHandler:v25 errorHandler:v21];
}

void __51__REMStore_updateShare_accountID_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__REMStore_updateShare_accountID_queue_completion___block_invoke_2;
  v7[3] = &unk_1E61DC5B0;
  BOOL v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __51__REMStore_updateShare_accountID_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __51__REMStore_updateShare_accountID_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__REMStore_updateShare_accountID_queue_completion___block_invoke_4;
  v5[3] = &unk_1E61DC3F8;
  id v6 = *(id *)(a1 + 48);
  [a2 updateShare:v3 accountID:v4 completion:v5];
}

uint64_t __51__REMStore_updateShare_accountID_queue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__REMStore_updateShare_accountID_queue_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51__REMStore_updateShare_accountID_queue_completion___block_invoke_5_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)stopShare:(id)a3 accountID:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __49__REMStore_stopShare_accountID_queue_completion___block_invoke;
  v29[3] = &unk_1E61DC448;
  id v30 = v12;
  id v31 = v13;
  id v14 = v13;
  id v15 = v12;
  uint64_t v16 = (void *)MEMORY[0x1BA9DBBC0](v29);
  id v17 = [(REMStore *)self daemonController];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __49__REMStore_stopShare_accountID_queue_completion___block_invoke_3;
  v25[3] = &unk_1E61DC5D8;
  id v26 = v10;
  id v27 = v11;
  id v28 = v16;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __49__REMStore_stopShare_accountID_queue_completion___block_invoke_5;
  v21[3] = &unk_1E61DC600;
  id v22 = v26;
  id v23 = v27;
  id v24 = v28;
  id v18 = v28;
  id v19 = v27;
  id v20 = v26;
  [v17 asyncStorePerformerWithReason:@"stopShare" loadHandler:v25 errorHandler:v21];
}

void __49__REMStore_stopShare_accountID_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__REMStore_stopShare_accountID_queue_completion___block_invoke_2;
  v7[3] = &unk_1E61DC5B0;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __49__REMStore_stopShare_accountID_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __49__REMStore_stopShare_accountID_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__REMStore_stopShare_accountID_queue_completion___block_invoke_4;
  v5[3] = &unk_1E61DC3F8;
  id v6 = *(id *)(a1 + 48);
  [a2 stopShare:v3 accountID:v4 completion:v5];
}

uint64_t __49__REMStore_stopShare_accountID_queue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__REMStore_stopShare_accountID_queue_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __49__REMStore_stopShare_accountID_queue_completion___block_invoke_5_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)acceptShareWithMetadata:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __53__REMStore_acceptShareWithMetadata_queue_completion___block_invoke;
  v23[3] = &unk_1E61DC448;
  id v24 = v9;
  id v25 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = (void *)MEMORY[0x1BA9DBBC0](v23);
  id v14 = [(REMStore *)self daemonController];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __53__REMStore_acceptShareWithMetadata_queue_completion___block_invoke_3;
  v20[3] = &unk_1E61DC650;
  id v21 = v8;
  id v22 = v13;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __53__REMStore_acceptShareWithMetadata_queue_completion___block_invoke_5;
  v17[3] = &unk_1E61DC448;
  id v18 = v21;
  id v19 = v22;
  id v15 = v22;
  id v16 = v21;
  [v14 asyncStorePerformerWithReason:@"acceptShare" loadHandler:v20 errorHandler:v17];
}

void __53__REMStore_acceptShareWithMetadata_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__REMStore_acceptShareWithMetadata_queue_completion___block_invoke_2;
  v7[3] = &unk_1E61DC5B0;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __53__REMStore_acceptShareWithMetadata_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __53__REMStore_acceptShareWithMetadata_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__REMStore_acceptShareWithMetadata_queue_completion___block_invoke_4;
  v4[3] = &unk_1E61DC628;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 acceptShareWithMetadata:v3 completion:v4];
}

uint64_t __53__REMStore_acceptShareWithMetadata_queue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__REMStore_acceptShareWithMetadata_queue_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __53__REMStore_acceptShareWithMetadata_queue_completion___block_invoke_5_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)everConnectedToCar
{
  return 1;
}

+ (BOOL)siriShouldRouteIntentsToNewRemindersApp
{
  id v2 = +[REMUserDefaults daemonUserDefaults];
  char v3 = [v2 siriShouldRouteIntentsToNewRemindersApp];

  return v3;
}

- (id)compressedDistributedEvaluationDataWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[REMLogStore read];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1B9AA2000, v7, OS_LOG_TYPE_DEFAULT, "(client) DistributedEvaluation Export START {options: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__1;
  id v25 = __Block_byref_object_dispose__1;
  id v26 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__1;
  id v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__REMStore_compressedDistributedEvaluationDataWithOptions_error___block_invoke;
  v15[3] = &unk_1E61DC1F8;
  void v15[4] = &buf;
  id v8 = [(REMStore *)self _xpcSyncStorePerformerWithReason:@"distributedEvaluation" errorHandler:v15];
  id v9 = v8;
  if (v8)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__REMStore_compressedDistributedEvaluationDataWithOptions_error___block_invoke_134;
    v14[3] = &unk_1E61DC678;
    v14[4] = &v16;
    v14[5] = &buf;
    [v8 compressedDistributedEvaluationDataWithOptions:v6 completion:v14];
  }
  id v10 = +[REMLogStore read];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_1B9AA2000, v10, OS_LOG_TYPE_DEFAULT, "(client) DistributedEvaluation Export END", v13, 2u);
  }

  if (a4) {
    *a4 = *(id *)(*((void *)&buf + 1) + 40);
  }
  id v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&buf, 8);

  return v11;
}

void __65__REMStore_compressedDistributedEvaluationDataWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__REMStore_compressedDistributedEvaluationDataWithOptions_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __65__REMStore_compressedDistributedEvaluationDataWithOptions_error___block_invoke_134(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v8 = +[REMLogStore read];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __65__REMStore_compressedDistributedEvaluationDataWithOptions_error___block_invoke_134_cold_2();
    }
  }
  else if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  else
  {
    id v9 = +[REMLogStore read];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __65__REMStore_compressedDistributedEvaluationDataWithOptions_error___block_invoke_134_cold_1();
    }

    uint64_t v10 = +[REMError internalErrorWithDebugDescription:@"DistributedEvaluation Export produced no result and no error"];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (id)fetchEligibleDefaultListsWithError:(id *)a3
{
  uint64_t v4 = [[REMListsDataView alloc] initWithStore:self];
  uint64_t v5 = [(REMListsDataView *)v4 fetchEligibleDefaultListsWithError:a3];

  return v5;
}

- (id)fetchDefaultListWithError:(id *)a3
{
  uint64_t v4 = [[REMListsDataView alloc] initWithStore:self];
  uint64_t v5 = [(REMListsDataView *)v4 fetchDefaultListWithError:a3];

  return v5;
}

- (id)fetchDefaultListRequiringCloudKitWithError:(id *)a3
{
  uint64_t v4 = [[REMListsDataView alloc] initWithStore:self];
  uint64_t v5 = [(REMListsDataView *)v4 fetchDefaultListRequiringCloudKitWithAccountID:0 error:a3];

  return v5;
}

- (id)fetchDefaultListRequiringCloudKitAccountWithAccountID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [[REMListsDataView alloc] initWithStore:self];
  id v8 = [(REMListsDataView *)v7 fetchDefaultListRequiringCloudKitWithAccountID:v6 error:a4];

  return v8;
}

- (id)fetchDefaultAccountWithError:(id *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = -[REMStore fetchDefaultListWithError:](self, "fetchDefaultListWithError:");
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 account];
    goto LABEL_30;
  }
  [(REMStore *)self fetchAccountsWithError:a3];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v40;
LABEL_5:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v40 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v39 + 1) + 8 * v12);
      id v14 = [v13 accountTypeHost];
      char v15 = [v14 isPrimaryCloudKit];

      if (v15) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v39 objects:v45 count:16];
        if (v10) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v16 = v8;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v36;
LABEL_13:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        id v13 = *(void **)(*((void *)&v35 + 1) + 8 * v20);
        id v21 = [v13 accountTypeHost];
        char v22 = [v21 isCloudBased];

        if (v22) {
          break;
        }
        if (v18 == ++v20)
        {
          uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v44 count:16];
          if (v18) {
            goto LABEL_13;
          }
          goto LABEL_19;
        }
      }
    }
    else
    {
LABEL_19:

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v23 = v16;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v43 count:16];
      if (!v24)
      {
        id v7 = 0;
        goto LABEL_29;
      }
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v32;
LABEL_21:
      uint64_t v27 = 0;
      while (1)
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(v23);
        }
        id v13 = *(void **)(*((void *)&v31 + 1) + 8 * v27);
        id v28 = objc_msgSend(v13, "accountTypeHost", (void)v31);
        char v29 = [v28 isLocal];

        if (v29) {
          break;
        }
        if (v25 == ++v27)
        {
          uint64_t v25 = [v23 countByEnumeratingWithState:&v31 objects:v43 count:16];
          id v7 = 0;
          if (v25) {
            goto LABEL_21;
          }
          goto LABEL_29;
        }
      }
    }
  }
  id v7 = v13;
LABEL_29:

LABEL_30:

  return v7;
}

- (id)_withInProgressSaveRequestContainer:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__1;
  char v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  os_unfair_lock_lock(&self->_lock);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__REMStore__withInProgressSaveRequestContainer___block_invoke;
  v8[3] = &unk_1E61DC6A0;
  uint64_t v10 = &v11;
  id v5 = v4;
  void v8[4] = self;
  id v9 = v5;
  __48__REMStore__withInProgressSaveRequestContainer___block_invoke((uint64_t)v8);
  os_unfair_lock_unlock(&self->_lock);

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __48__REMStore__withInProgressSaveRequestContainer___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "l_inProgressSaveRequestsContainer");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = (*(void (**)(uint64_t, id))(v2 + 16))(v2, v6);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)anchoredBubbleCloudOverridesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(REMStore *)self _xpcSyncStorePerformerWithReason:@"queryAnchoredBubbleCloudOverrides" errorHandler:&__block_literal_global_144];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__REMStore_anchoredBubbleCloudOverridesWithCompletion___block_invoke_145;
  v7[3] = &unk_1E61DC6C8;
  id v8 = v4;
  id v6 = v4;
  [v5 anchoredBubbleEnabledWithCompletion:v7];
}

void __55__REMStore_anchoredBubbleCloudOverridesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[REMLogStore xpc];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __55__REMStore_anchoredBubbleCloudOverridesWithCompletion___block_invoke_cold_1();
  }
}

uint64_t __55__REMStore_anchoredBubbleCloudOverridesWithCompletion___block_invoke_145(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)fetchMinimumSearchTermLengthByBaseLanguageWithError:(id *)a3
{
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__1;
  uint64_t v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__1;
  uint64_t v12 = __Block_byref_object_dispose__1;
  id v13 = 0;
  id v4 = [(REMStore *)self _xpcSyncStorePerformerWithReason:@"fetchMinimumSearchTermLengthByBaseLanguage" errorHandler:&__block_literal_global_151];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__REMStore_fetchMinimumSearchTermLengthByBaseLanguageWithError___block_invoke_152;
  v7[3] = &unk_1E61DC6F0;
  void v7[4] = &v8;
  v7[5] = &v14;
  [v4 fetchMinimumSearchTermLengthByBaseLanguageWithCompletion:v7];
  if (a3) {
    *a3 = (id) v15[5];
  }
  id v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);

  return v5;
}

void __64__REMStore_fetchMinimumSearchTermLengthByBaseLanguageWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[REMLogStore xpc];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __64__REMStore_fetchMinimumSearchTermLengthByBaseLanguageWithError___block_invoke_cold_1();
  }
}

void __64__REMStore_fetchMinimumSearchTermLengthByBaseLanguageWithError___block_invoke_152(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[REMLogStore read];
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __64__REMStore_fetchMinimumSearchTermLengthByBaseLanguageWithError___block_invoke_152_cold_1();
    }

    id v9 = (void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = v6;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_1B9AA2000, v8, OS_LOG_TYPE_INFO, "Fetch minimumSearchTermLengthByBaseLanguage successful {result: %@}", (uint8_t *)&v13, 0xCu);
  }

  if (v5)
  {
    id v9 = (void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v10 = v5;
LABEL_9:
    id v11 = v10;
    uint64_t v12 = *v9;
    uint64_t *v9 = v11;
  }
}

- (_REMInProgressSaveRequestsContainer)l_inProgressSaveRequestsContainer
{
  return self->_l_inProgressSaveRequestsContainer;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setDaemonController:(id)a3
{
}

- (REMStoreContainerToken)storeContainerToken
{
  return self->_storeContainerToken;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (void)setNonUserInteractiveStore:(id)a3
{
}

- (void)acceptCalDAVSharedList:(id)a3 queue:(id)a4 completion:(id)a5
{
}

- (void)rejectCalDAVSharedList:(id)a3 queue:(id)a4 completion:(id)a5
{
}

- (void)_respondToCalDAVSharedList:(id)a3 withResponse:(int64_t)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke;
  v26[3] = &unk_1E61DC448;
  id v27 = v11;
  id v28 = v12;
  id v13 = v12;
  id v14 = v11;
  uint64_t v15 = (void *)MEMORY[0x1BA9DBBC0](v26);
  uint64_t v16 = [(REMStore *)self daemonController];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3;
  v22[3] = &unk_1E61DC718;
  id v23 = v10;
  id v24 = v15;
  int64_t v25 = a4;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3_316;
  v19[3] = &unk_1E61DC448;
  id v20 = v23;
  id v21 = v24;
  id v17 = v24;
  id v18 = v23;
  [v16 asyncStorePerformerWithReason:@"respondToCalDAVSharedList" loadHandler:v22 errorHandler:v19];
}

void __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_2;
  v7[3] = &unk_1E61DC5B0;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id v5 = [*(id *)(a1 + 32) account];
  id v6 = [v5 accountTypeHost];
  char v7 = [v6 isCalDav];

  uint64_t v8 = [*(id *)(a1 + 32) sharingStatus];
  if (v7)
  {
    if (v8 == 3)
    {
      id v9 = [*v4 externalIdentifier];
      id v10 = [*v4 account];
      id v11 = [v10 externalIdentifier];

      if (v9)
      {
        if (v11)
        {
          uint64_t v12 = *(void *)(a1 + 48);
          if (v12 == 2)
          {
            v23[0] = MEMORY[0x1E4F143A8];
            v23[1] = 3221225472;
            v23[2] = __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_2_311;
            v23[3] = &unk_1E61DC3F8;
            id v24 = *(id *)(a1 + 40);
            [v3 rejectCalDAVShareWithCalendarURL:v9 acAccountID:v11 completion:v23];
            id v13 = v24;
          }
          else
          {
            if (v12 != 1)
            {
              [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Implementation error to use unknown CalDAV share response."];
              goto LABEL_25;
            }
            v25[0] = MEMORY[0x1E4F143A8];
            v25[1] = 3221225472;
            v25[2] = __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_310;
            v25[3] = &unk_1E61DC3F8;
            id v26 = *(id *)(a1 + 40);
            [v3 acceptCalDAVShareWithCalendarURL:v9 acAccountID:v11 completion:v25];
            id v13 = v26;
          }

LABEL_25:
          goto LABEL_26;
        }
        id v21 = +[REMLogStore write];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3_cold_2();
        }

        uint64_t v19 = *(void *)(a1 + 40);
        id v20 = @"Could not find the external identifier from the given invitation list.";
      }
      else
      {
        id v18 = +[REMLogStore write];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3_cold_1();
        }

        uint64_t v19 = *(void *)(a1 + 40);
        id v20 = @"Given invitation list has no external identifier.";
      }
      char v22 = +[REMError invalidParameterErrorWithDescription:v20];
      (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v22);

      goto LABEL_25;
    }
    id v17 = +[REMLogStore write];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3_cold_3();
    }

    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = @"Given invitation list isn't a sharing invitation.";
  }
  else
  {
    id v14 = +[REMLogStore write];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3_cold_4();
    }

    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = @"Given invitation list isn't a CalDAV list.";
  }
  id v9 = +[REMError invalidParameterErrorWithDescription:v16];
  (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v9);
LABEL_26:
}

uint64_t __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_310(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_2_311(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3_316(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3_316_cold_1((uint64_t)v3, a1, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)provideChangeTrackingForAccountID:(id)a3 clientName:(id)a4
{
  return [(REMStore *)self provideChangeTrackingForAccountID:a3 clientName:a4 transactionAuthorKeysToExclude:0];
}

- (id)provideChangeTrackingForAccountID:(id)a3 clientName:(id)a4 transactionAuthorKeysToExclude:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    NSLog(&cfstr_SIsUnexpectedl.isa, "accountID");
    if (v9) {
      goto LABEL_3;
    }
LABEL_12:
    NSLog(&cfstr_SIsUnexpectedl.isa, "clientName");
    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_12;
  }
LABEL_3:
  id v11 = [v8 uuid];
  uint64_t v12 = [v11 UUIDString];

  uint64_t v13 = [(REMStore *)self daemonController];
  id v14 = (void *)v13;
  if (v9 && v12 && v13)
  {
    uint64_t v15 = [[_REMChangeTrackingClientID alloc] initWithClientName:v9 accountIdentifier:v12];
    uint64_t v16 = [REMChangeTracking alloc];
    if (v10) {
      uint64_t v17 = [(REMChangeTracking *)v16 initWithClientID:v15 daemonController:v14 transactionAuthorKeysToExclude:v10];
    }
    else {
      uint64_t v17 = [(REMChangeTracking *)v16 initWithClientID:v15 daemonController:v14];
    }
    uint64_t v19 = (void *)v17;
  }
  else
  {
    id v18 = +[REMLogStore read];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[REMStore(ChangeTrackingSupport) provideChangeTrackingForAccountID:clientName:transactionAuthorKeysToExclude:]();
    }

    uint64_t v19 = 0;
  }

  return v19;
}

- (id)fetchListIncludingMarkedForDeleteWithObjectID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "listObjectID");
  }
  char v7 = [[REMListsDataView alloc] initWithStore:self];
  id v8 = [(REMListsDataView *)v7 fetchListIncludingConcealedWithObjectID:v6 includeMarkedForDeletionOnly:1 error:a4];

  return v8;
}

- (id)fetchListIncludingConcealedWithObjectID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "listObjectID");
  }
  char v7 = [[REMListsDataView alloc] initWithStore:self];
  id v8 = [(REMListsDataView *)v7 fetchListIncludingConcealedWithObjectID:v6 includeMarkedForDeletionOnly:0 error:a4];

  return v8;
}

- (id)fetchReminderIncludingConcealedWithObjectID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "reminderObjectID");
  }
  char v7 = [[REMRemindersDataView alloc] initWithStore:self];
  id v8 = +[REMReminderFetchOptions fetchOptionsIncludingConcealed];
  id v9 = [(REMRemindersDataView *)v7 fetchReminderWithObjectID:v6 fetchOptions:v8 error:a4];

  return v9;
}

- (id)fetchRemindersIncludingUnsupportedWithObjectIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = [[REMRemindersDataView alloc] initWithStore:self];
  id v8 = [(REMRemindersDataView *)v7 fetchRemindersIncludingUnsupportedWithObjectIDs:v6 error:a4];

  return v8;
}

- (id)provideAnonymousChangeTrackingWithTransactionAuthorKeysToExclude:(id)a3
{
  id v4 = a3;
  id v5 = [[_REMChangeTrackingClientID alloc] initWithClientName:@"___dummy-client-identifier" accountIdentifier:@"___dummy-account-identifier"];
  id v6 = [(REMStore *)self daemonController];
  if (v6)
  {
    char v7 = [REMChangeTracking alloc];
    if (v4) {
      uint64_t v8 = [(REMChangeTracking *)v7 initWithClientID:v5 daemonController:v6 transactionAuthorKeysToExclude:v4];
    }
    else {
      uint64_t v8 = [(REMChangeTracking *)v7 initWithClientID:v5 daemonController:v6];
    }
    id v10 = (void *)v8;
  }
  else
  {
    id v9 = +[REMLogStore read];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[REMStore(ChangeTrackingProvider_IntegrationTestsOnlyAPIsSupport) provideAnonymousChangeTrackingWithTransactionAuthorKeysToExclude:]();
    }

    id v10 = 0;
  }

  return v10;
}

+ (void)notifyOfInteractionWithPeople:(id)a3
{
  id v3 = a3;
  id v4 = +[REMDispatchQueue storeQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__REMStore_iMessageInteractionSPI__notifyOfInteractionWithPeople___block_invoke;
  block[3] = &unk_1E61DC740;
  id v8 = v3;
  id v5 = v3;
  dispatch_block_t v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(v4, v6);
}

void __66__REMStore_iMessageInteractionSPI__notifyOfInteractionWithPeople___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(REMStore);
  [(REMStore *)v2 notifyOfInteractionWithPeople:*(void *)(a1 + 32) force:0 completion:&__block_literal_global_349];
}

- (void)notifyOfInteractionWithPeople:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (a4
    || +[REMStore _shouldNotifyReminddOfInteractionWithPeople])
  {
    id v10 = +[REMLog alarmEngine];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v20 = v8;
      _os_log_impl(&dword_1B9AA2000, v10, OS_LOG_TYPE_DEFAULT, "_shouldNotifyReminddOfInteractionWithPeople returned YES. Notifying people interaction {people: %@}", buf, 0xCu);
    }

    id v11 = [(REMStore *)self daemonController];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __83__REMStore_iMessageInteractionSPI__notifyOfInteractionWithPeople_force_completion___block_invoke;
    v16[3] = &unk_1E61DC650;
    id v17 = v8;
    id v18 = v9;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83__REMStore_iMessageInteractionSPI__notifyOfInteractionWithPeople_force_completion___block_invoke_353;
    v13[3] = &unk_1E61DC448;
    id v14 = v17;
    id v15 = v18;
    [v11 asyncStorePerformerWithReason:@"notifyOfInteractionWithPeople" loadHandler:v16 errorHandler:v13];
  }
  else
  {
    uint64_t v12 = +[REMLog alarmEngine];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v20 = v8;
      _os_log_impl(&dword_1B9AA2000, v12, OS_LOG_TYPE_INFO, "_shouldNotifyReminddOfInteractionWithPeople returned NO. Skipping notification {people: %@}", buf, 0xCu);
    }

    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

void __83__REMStore_iMessageInteractionSPI__notifyOfInteractionWithPeople_force_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__REMStore_iMessageInteractionSPI__notifyOfInteractionWithPeople_force_completion___block_invoke_2;
  v5[3] = &unk_1E61DC448;
  id v6 = v4;
  id v7 = *(id *)(a1 + 40);
  [a2 notifyOfInteractionWithPeople:v6 completion:v5];
}

void __83__REMStore_iMessageInteractionSPI__notifyOfInteractionWithPeople_force_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = +[REMLog alarmEngine];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __83__REMStore_iMessageInteractionSPI__notifyOfInteractionWithPeople_force_completion___block_invoke_2_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __83__REMStore_iMessageInteractionSPI__notifyOfInteractionWithPeople_force_completion___block_invoke_353(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __83__REMStore_iMessageInteractionSPI__notifyOfInteractionWithPeople_force_completion___block_invoke_353_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (BOOL)_shouldNotifyReminddOfInteractionWithPeople
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = +[REMDispatchQueue storeQueue];
  dispatch_assert_queue_V2(v2);

  int v3 = _shouldNotifyReminddOfInteractionWithPeople___sNotifyToken;
  if (_shouldNotifyReminddOfInteractionWithPeople___sNotifyToken == -1)
  {
    *(_DWORD *)long long buf = -1;
    uint32_t v6 = notify_register_check((const char *)_REMStoreShouldNotifyOfInteractionWithPeopleNotificationName, (int *)buf);
    if (v6)
    {
      int v7 = v6;
      id v4 = +[REMLog alarmEngine];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        +[REMStore(iMessageInteractionSPI) _shouldNotifyReminddOfInteractionWithPeople];
      }
      goto LABEL_11;
    }
    int v3 = *(_DWORD *)buf;
    _shouldNotifyReminddOfInteractionWithPeople___sNotifyTokeuint64_t n = *(_DWORD *)buf;
  }
  if (!notify_is_valid_token(v3))
  {
    id v5 = +[REMLog alarmEngine];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v17) = _shouldNotifyReminddOfInteractionWithPeople___sNotifyToken;
      _os_log_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_DEFAULT, "Failed to register shouldNotifyOfInteractionWithPeople with notify. Returning YES to _shouldNotifyReminddOfInteractionWithPeople {token: %d}", buf, 8u);
    }
    goto LABEL_18;
  }
  checuint64_t k = 0;
  if (notify_check(_shouldNotifyReminddOfInteractionWithPeople___sNotifyToken, &check))
  {
    id v4 = +[REMLog alarmEngine];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[REMStore(iMessageInteractionSPI) _shouldNotifyReminddOfInteractionWithPeople]();
    }
LABEL_11:

    return 1;
  }
  int v8 = check;
  id v9 = +[REMLog alarmEngine];
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B9AA2000, v10, OS_LOG_TYPE_DEFAULT, "shouldNotifyOfInteractionWithPeople did change. Updating cache", buf, 2u);
    }

    uint64_t v14 = 0;
    uint32_t state = notify_get_state(_shouldNotifyReminddOfInteractionWithPeople___sNotifyToken, &v14);
    uint64_t v12 = +[REMLog alarmEngine];
    id v5 = v12;
    if (state)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[REMStore(iMessageInteractionSPI) _shouldNotifyReminddOfInteractionWithPeople]();
      }
LABEL_18:

      return 1;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v17 = v14;
      _os_log_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_DEFAULT, "Successfully notify_get_state updating cache {state: %llu}", buf, 0xCu);
    }

    BOOL result = v14 != 0;
    _shouldNotifyReminddOfInteractionWithPeople___sShouldNotifyRemindd = v14 != 0;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v17) = _shouldNotifyReminddOfInteractionWithPeople___sShouldNotifyRemindd;
      _os_log_impl(&dword_1B9AA2000, v10, OS_LOG_TYPE_INFO, "shouldNotifyOfInteractionWithPeople did not change. Returning cached value {__sShouldNotifyRemindd: %d}", buf, 8u);
    }

    return _shouldNotifyReminddOfInteractionWithPeople___sShouldNotifyRemindd;
  }
  return result;
}

- (BOOL)hasActiveCloudKitAccountForTipKitWithError:(id *)a3
{
  id v4 = [[REMAccountsDataView alloc] initWithStore:self];
  uint64_t v5 = [(REMAccountsDataView *)v4 fetchPrimaryActiveCloudKitAccountREMObjectIDWithError:a3];
  uint32_t v6 = (void *)v5;
  if (a3 && !v5)
  {
    id v7 = *a3;
    int v8 = [v7 domain];
    if ([@"com.apple.reminderkit" isEqual:v8])
    {
      uint64_t v9 = [v7 code];

      if (v9 == -3007) {
        *a3 = 0;
      }
    }
    else
    {
    }
  }

  return v6 != 0;
}

- (BOOL)containsListWithCustomBadgeForTipKitWithError:(id *)a3
{
  id v4 = [[REMTipKitDataView alloc] initWithStore:self];
  uint64_t v5 = [(REMTipKitDataView *)v4 fetchListsWithCustomBadgeCountWithError:a3];
  BOOL v6 = [v5 integerValue] > 0;

  return v6;
}

- (unint64_t)completedRemindersCountForTipKitWithError:(id *)a3
{
  id v4 = [[REMTipKitDataView alloc] initWithStore:self];
  uint64_t v5 = [(REMTipKitDataView *)v4 fetchCompletedRemindersCountWithError:a3];
  unint64_t v6 = [v5 integerValue];

  return v6;
}

- (BOOL)containsCustomSmartListForTipKitWithError:(id *)a3
{
  id v4 = [[REMTipKitDataView alloc] initWithStore:self];
  uint64_t v5 = [(REMTipKitDataView *)v4 fetchCustomSmartListsCountWithError:a3];
  BOOL v6 = [v5 integerValue] > 0;

  return v6;
}

- (BOOL)containsHashtagsForTipKitWithError:(id *)a3
{
  id v4 = [[REMTipKitDataView alloc] initWithStore:self];
  uint64_t v5 = [(REMTipKitDataView *)v4 fetchHashtagsCountWithError:a3];
  BOOL v6 = [v5 integerValue] > 0;

  return v6;
}

- (id)fetchFamilyGroceryListEligibilityForFamilyChecklistWithLocale:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[REMLogStore read];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [v6 localeIdentifier];
    int v16 = 138477827;
    uint64_t v17 = v8;
    _os_log_impl(&dword_1B9AA2000, v7, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI START shared grocery lists eligibility for locale {eligibility:%{private}@}", (uint8_t *)&v16, 0xCu);
  }
  uint64_t v9 = [[REMFamilyChecklistDataView alloc] initWithStore:self];
  id v10 = [(REMFamilyChecklistDataView *)v9 fetchFamilyGroceryListEligibilityForFamilyChecklistWithLocale:v6 error:a4];
  if (a4 && *a4)
  {
    id v11 = +[REMLogStore read];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[REMStore(FamilyChecklist) fetchFamilyGroceryListEligibilityForFamilyChecklistWithLocale:error:]();
    }
  }
  uint64_t v12 = +[REMLogStore read];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    uint64_t v17 = v10;
    _os_log_impl(&dword_1B9AA2000, v12, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI END shared grocery lists eligibility {eligibility:%{public}@}", (uint8_t *)&v16, 0xCu);
  }

  if ([v10 isEligible])
  {
    uint64_t v13 = @"isEligible";
  }
  else
  {
    uint64_t v14 = [v10 ineligibilityReasons];
    if (v14 != 256)
    {
      if (v14 != 16)
      {
        if (v14 != 4) {
          goto LABEL_19;
        }
        [(REMStore *)self postFamilyAnalyticsPayloadWithOperationId:@"eligibleForSharedGroceryList" operationDetail:@"ineligibleCloudKitAccount"];
      }
      [(REMStore *)self postFamilyAnalyticsPayloadWithOperationId:@"eligibleForSharedGroceryList" operationDetail:@"ineligibleGroceryLocale"];
    }
    uint64_t v13 = @"ineligibleCloudKitAccountNotMigrated";
  }
  [(REMStore *)self postFamilyAnalyticsPayloadWithOperationId:@"eligibleForSharedGroceryList" operationDetail:v13];
LABEL_19:

  return v10;
}

- (id)sharedGroceryListForFamilyChecklistWithCommonParticipants:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[REMLogStore read];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v15 = v6;
    _os_log_impl(&dword_1B9AA2000, v7, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI START existing shared grocery lists {commonParticipants: %{public}@}", buf, 0xCu);
  }

  int v8 = [[REMFamilyChecklistDataView alloc] initWithStore:self];
  uint64_t v9 = [(REMFamilyChecklistDataView *)v8 fetchSharedGroceryListsWithCommonSharees:v6 error:a4];
  if (a4 && *a4)
  {
    id v10 = +[REMLogStore read];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[REMStore(FamilyChecklist) sharedGroceryListForFamilyChecklistWithCommonParticipants:error:]();
    }
  }
  id v11 = +[REMLogStore read];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v15 = v9;
    _os_log_impl(&dword_1B9AA2000, v11, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI END existing shared grocery lists {sharedGroceryLists: %{public}@}", buf, 0xCu);
  }

  uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"existingSharedGroceryLists%lu", objc_msgSend(v9, "count"));
  [(REMStore *)self postFamilyAnalyticsPayloadWithOperationId:@"existingSharedGroceryList" operationDetail:v12];

  return v9;
}

- (id)createSharedGroceryListWithError:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[REMLogStore write];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI START create shared grocery list", buf, 2u);
  }

  id v6 = [[REMAccountsDataView alloc] initWithStore:self];
  id v7 = [(REMAccountsDataView *)v6 fetchPrimaryActiveCloudKitAccountWithError:a3];
  if (a3 && *a3)
  {
    int v8 = +[REMLogStore write];
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR)) {
      -[REMStore(FamilyChecklist) createSharedGroceryListWithError:].cold.4();
    }
    uint64_t v9 = 0;
  }
  else
  {
    int v8 = [[REMSaveRequest alloc] initWithStore:self];
    uint64_t v10 = [(REMSaveRequest *)v8 updateAccount:v7];
    id v11 = _REMGetLocalizedString(79);
    long long v37 = (void *)v10;
    uint64_t v12 = [(REMSaveRequest *)v8 addListWithName:v11 toAccountChangeItem:v10];

    uint64_t v13 = [[REMColor alloc] initWithCKSymbolicColorName:@"green" hexString:0];
    [v12 setColor:v13];

    [v12 setBadgeEmblem:@"nature2"];
    uint64_t v14 = [v12 groceryContextChangeItem];
    [v14 setShouldCategorizeGroceryItems:1];
    id v15 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v16 = [v15 localeIdentifier];
    [v14 setGroceryLocaleID:v16];

    [v12 setIsPinned:1];
    [(REMSaveRequest *)v8 saveSynchronouslyWithError:a3];
    if (a3 && *a3)
    {
      uint64_t v17 = +[REMLogStore write];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[REMStore(FamilyChecklist) createSharedGroceryListWithError:]();
      }
      uint64_t v9 = 0;
      uint64_t v18 = v37;
    }
    else
    {
      uint64_t v19 = [v12 objectID];
      uint64_t v17 = [(REMStore *)self createShareForListWithID:v19 appIconData:0 error:a3];

      if (a3 && *a3)
      {
        id v20 = +[REMLogStore write];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[REMStore(FamilyChecklist) createSharedGroceryListWithError:]();
        }
        uint64_t v9 = 0;
        uint64_t v18 = v37;
      }
      else
      {
        long long v33 = v6;
        uint64_t v21 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
        char v22 = [REMFamilyChecklistSharedGroceryList alloc];
        [v12 objectID];
        long long v35 = v21;
        id v23 = v36 = v7;
        uint64_t v9 = [(REMFamilyChecklistSharedGroceryList *)v22 initWithListID:v23 participants:v21];

        id v24 = [v17 URL];
        [(REMFamilyChecklistSharedGroceryList *)v9 setURL:v24];

        id v25 = objc_alloc_init(MEMORY[0x1E4F28D78]);
        id v26 = +[REMCloudContainer newCloudContainerForAccount:v36];
        long long v34 = v26;
        if (v26)
        {
          id v27 = v26;
          objc_msgSend(MEMORY[0x1E4F19E40], "rem_remindersAllowedSharingOptions");
          char v29 = v28 = v25;
          [v28 registerCKShare:v17 container:v27 allowedSharingOptions:v29];

          id v25 = v28;
          [(REMFamilyChecklistSharedGroceryList *)v9 setItemProvider:v28];
        }
        else
        {
          *a3 = +[REMError invalidParameterErrorWithDescription:@"Unable to create CKContainer for created shared grocery list."];
          id v30 = +[REMLogStore write];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            -[REMStore(FamilyChecklist) createSharedGroceryListWithError:]();
          }
        }
        uint64_t v18 = v37;
        id v6 = v33;
        long long v31 = +[REMLogStore write];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543362;
          long long v39 = v9;
          _os_log_impl(&dword_1B9AA2000, v31, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI END create shared grocery list {sharedGroceryList: %{public}@}", buf, 0xCu);
        }

        [(REMStore *)self postFamilyAnalyticsPayloadWithOperationId:@"createdSharedGroceryList" operationDetail:0];
        id v20 = v35;
        id v7 = v36;
      }
    }
  }

  return v9;
}

- (void)addParticipantsToSharedGroceryList:(id)a3 completion:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v36 = a4;
  id v6 = +[REMLog cloudkitCollaboration];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v53 = v5;
    _os_log_impl(&dword_1B9AA2000, v6, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI START add participants to shared grocery list {sharedGroceryList: %{public}@}", buf, 0xCu);
  }

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  int v8 = [v5 participants];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v48 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v14 = [v13 phones];
        id v15 = [v14 firstObject];

        uint64_t v16 = [v13 emails];
        uint64_t v17 = [v16 firstObject];

        if ([v15 length])
        {
          uint64_t v18 = [objc_alloc(MEMORY[0x1E4F1A488]) initWithPhoneNumber:v15];
        }
        else
        {
          if (![v17 length]) {
            goto LABEL_13;
          }
          uint64_t v18 = [objc_alloc(MEMORY[0x1E4F1A488]) initWithEmailAddress:v17];
        }
        uint64_t v19 = (void *)v18;
        [v7 addObject:v18];

LABEL_13:
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v10);
  }

  if ([v7 count])
  {
    id v20 = [v5 listID];
    id v46 = 0;
    uint64_t v21 = [(REMStore *)self fetchShareForListWithID:v20 error:&v46];
    id v22 = v46;

    id v23 = v36;
    if (v22)
    {
      id v24 = +[REMLog cloudkitCollaboration];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[REMStore(FamilyChecklist) addParticipantsToSharedGroceryList:completion:]();
      }

      (*((void (**)(id, void, id))v36 + 2))(v36, 0, v22);
    }
    else
    {
      id v26 = (void *)[objc_alloc(MEMORY[0x1E4F1A0D8]) initWithUserIdentityLookupInfos:v7];
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke;
      v44[3] = &unk_1E61DC768;
      id v27 = v21;
      id v45 = v27;
      [v26 setShareParticipantFetchedBlock:v44];
      id v28 = [[REMAccountsDataView alloc] initWithStore:self];
      id v43 = 0;
      char v29 = [(REMAccountsDataView *)v28 fetchPrimaryActiveCloudKitAccountWithError:&v43];
      id v22 = v43;
      if (v22)
      {
        id v30 = +[REMLog cloudkitCollaboration];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[REMStore(FamilyChecklist) addParticipantsToSharedGroceryList:completion:]();
        }

        (*((void (**)(id, void, id))v36 + 2))(v36, 0, v22);
      }
      else
      {
        long long v34 = v29;
        id v31 = +[REMCloudContainer newCloudContainerForAccount:v29];
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke_409;
        v37[3] = &unk_1E61DC7E0;
        id v42 = v36;
        id v38 = v5;
        id v39 = v27;
        uint64_t v40 = self;
        id v41 = v31;
        id v32 = v31;
        char v29 = v34;
        id v33 = v32;
        [v26 setFetchShareParticipantsCompletionBlock:v37];
        [v33 addOperation:v26];
      }
    }
  }
  else
  {
    id v22 = +[REMError invalidParameterErrorWithDescription:@"No valid participants found for adding to shared grocery list."];
    id v25 = +[REMLog cloudkitCollaboration];
    id v23 = v36;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[REMStore(FamilyChecklist) addParticipantsToSharedGroceryList:completion:]();
    }

    (*((void (**)(id, void, id))v36 + 2))(v36, 0, v22);
  }
}

void __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setPermission:3];
  [*(id *)(a1 + 32) addParticipant:v3];
}

void __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke_409(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[REMLog cloudkitCollaboration];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke_409_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v19 = v6;
      _os_log_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI CloudKit add participants to shared grocery list fetchParticipants succeeded {sharedGroceryList: %{public}@}", buf, 0xCu);
    }

    id v7 = objc_alloc(MEMORY[0x1E4F1A198]);
    uint64_t v17 = *(void *)(a1 + 40);
    int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    uint64_t v9 = (void *)[v7 initWithRecordsToSave:v8 recordIDsToDelete:0];

    [v9 setSavePolicy:0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke_412;
    v13[3] = &unk_1E61DC7B8;
    id v14 = *(id *)(a1 + 32);
    id v16 = *(id *)(a1 + 64);
    int8x16_t v12 = *(int8x16_t *)(a1 + 40);
    id v10 = (id)v12.i64[0];
    int8x16_t v15 = vextq_s8(v12, v12, 8uLL);
    [v9 setModifyRecordsCompletionBlock:v13];
    uint64_t v11 = [*(id *)(a1 + 56) privateCloudDatabase];
    [v11 addOperation:v9];
  }
}

void __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke_412(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = +[REMLog cloudkitCollaboration];
  uint64_t v11 = v10;
  if (!v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v49 = v31;
      _os_log_impl(&dword_1B9AA2000, v11, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI CloudKit add participants to shared grocery list modifyRecords succeeded {sharedGroceryList: %{public}@}", buf, 0xCu);
    }
    goto LABEL_26;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke_412_cold_1();
  }

  int8x16_t v12 = [v9 domain];
  uint64_t v13 = *MEMORY[0x1E4F19C40];
  if (![v12 isEqual:*MEMORY[0x1E4F19C40]] || objc_msgSend(v9, "code") != 2)
  {

    goto LABEL_23;
  }
  id v14 = [v9 userInfo];
  int8x16_t v15 = [v14 objectForKeyedSubscript:@"CKErrorDescription"];
  int v16 = [v15 isEqual:@"Failed to modify some records"];

  if (!v16)
  {
LABEL_23:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_27;
  }
  uint64_t v17 = +[REMLog cloudkitCollaboration];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138543362;
    uint64_t v49 = v18;
    _os_log_impl(&dword_1B9AA2000, v17, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI CloudKit checking 'Partial Failure' modifyRecords error for add participants to shared grocery list {sharedGroceryList: %{public}@}", buf, 0xCu);
  }

  uint64_t v19 = [v9 userInfo];
  uint64_t v20 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v11 = v20;
  uint64_t v21 = [v11 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (!v21) {
    goto LABEL_21;
  }
  uint64_t v22 = v21;
  uint64_t v37 = *(void *)v44;
  id v36 = v7;
  while (2)
  {
    for (uint64_t i = 0; i != v22; ++i)
    {
      if (*(void *)v44 != v37) {
        objc_enumerationMutation(v11);
      }
      id v24 = *(void **)(*((void *)&v43 + 1) + 8 * i);
      id v25 = [MEMORY[0x1E4F1CA98] null];

      if (v24 == v25)
      {
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        goto LABEL_31;
      }
      id v26 = [v11 objectForKeyedSubscript:v24];
      id v27 = [v26 domain];
      if (![v27 isEqual:v13])
      {

LABEL_30:
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

LABEL_31:
        id v7 = v36;
        goto LABEL_27;
      }
      uint64_t v28 = [v26 code];

      if (v28 != 14) {
        goto LABEL_30;
      }
      char v29 = +[REMLog cloudkitCollaboration];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138543362;
        uint64_t v49 = v30;
        _os_log_impl(&dword_1B9AA2000, v29, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI CloudKit hiding 'Server Record Change' error for add participants to shared grocery list {sharedGroceryList: %{public}@}", buf, 0xCu);
      }
    }
    uint64_t v22 = [v11 countByEnumeratingWithState:&v43 objects:v47 count:16];
    id v7 = v36;
    if (v22) {
      continue;
    }
    break;
  }
LABEL_21:

LABEL_26:
  id v32 = *(void **)(a1 + 40);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke_420;
  v38[3] = &unk_1E61DC790;
  id v42 = *(id *)(a1 + 56);
  id v33 = *(id *)(a1 + 32);
  uint64_t v34 = *(void *)(a1 + 40);
  long long v35 = *(void **)(a1 + 48);
  id v39 = v33;
  uint64_t v40 = v34;
  id v41 = v35;
  [v32 triggerCloudKitOnlySyncWithReason:@"FamilyChecklist(CloudKitSync)" discretionary:0 completion:v38];

LABEL_27:
}

void __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke_420(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[REMLog cloudkitCollaboration];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke_420_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v11 = v6;
      _os_log_impl(&dword_1B9AA2000, v5, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI END add participants to shared grocery list {sharedGroceryList: %{public}@}", buf, 0xCu);
    }

    id v7 = NSString;
    id v8 = [*(id *)(a1 + 32) participants];
    id v9 = objc_msgSend(v7, "stringWithFormat:", @"invitedParticipants%lu", objc_msgSend(v8, "count"));

    [*(id *)(a1 + 40) postFamilyAnalyticsPayloadWithOperationId:@"addedParticipantsToSharedGroceryList" operationDetail:v9];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (BOOL)deleteSharedGroceryList:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[REMLogStore write];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138543362;
    id v20 = v6;
    _os_log_impl(&dword_1B9AA2000, v7, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI START delete shared grocery list {sharedGroceryList: %{public}@}", (uint8_t *)&v19, 0xCu);
  }

  id v8 = [[REMListsDataView alloc] initWithStore:self];
  id v9 = [v6 listID];
  id v10 = [(REMListsDataView *)v8 fetchListWithObjectID:v9 error:a4];

  if (!a4 || !*a4)
  {
    uint64_t v11 = [[REMSaveRequest alloc] initWithStore:self];
    uint64_t v13 = [(REMSaveRequest *)v11 updateList:v10];
    id v14 = [v13 groceryContextChangeItem];
    if ([v14 shouldCategorizeGroceryItems])
    {
      [v13 removeFromParent];
      BOOL v12 = [(REMSaveRequest *)v11 saveSynchronouslyWithError:a4];
      if (!a4 || !*a4)
      {
        uint64_t v17 = +[REMLogStore write];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 138543618;
          id v20 = v6;
          __int16 v21 = 1024;
          BOOL v22 = v12;
          _os_log_impl(&dword_1B9AA2000, v17, OS_LOG_TYPE_DEFAULT, "FamilyChecklistSPI END delete shared grocery list {sharedGroceryList: %{public}@, didSave: %i}", (uint8_t *)&v19, 0x12u);
        }

        [(REMStore *)self postFamilyAnalyticsPayloadWithOperationId:@"cancelledSharedGroceryList" operationDetail:0];
        goto LABEL_20;
      }
      int8x16_t v15 = +[REMLogStore write];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[REMStore(FamilyChecklist) deleteSharedGroceryList:error:]();
      }
    }
    else
    {
      int8x16_t v15 = +[REMError invalidParameterErrorWithDescription:@"Shared grocery list is not grocery list type."];
      *a4 = v15;
      int v16 = +[REMLogStore write];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[REMStore(FamilyChecklist) deleteSharedGroceryList:error:]();
      }
    }
    LOBYTE(v12) = 0;
LABEL_20:

    goto LABEL_21;
  }
  uint64_t v11 = +[REMLogStore write];
  if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR)) {
    -[REMStore(FamilyChecklist) deleteSharedGroceryList:error:]();
  }
  LOBYTE(v12) = 0;
LABEL_21:

  return v12;
}

- (void)postFamilyAnalyticsPayloadWithOperationId:(id)a3 operationDetail:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  [v7 setObject:v6 forKeyedSubscript:@"operationId"];

  if (v5) {
    [v7 setObject:v5 forKeyedSubscript:@"operationDetail"];
  }
  id v8 = +[REMLog analytics];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = @"com.apple.reminderkit.familyChecklist";
    __int16 v11 = 2112;
    BOOL v12 = v7;
    _os_log_impl(&dword_1B9AA2000, v8, OS_LOG_TYPE_DEFAULT, "Posting analytics {name: (%@, privacy: .public), payload: (%@, privacy: .public)", (uint8_t *)&v9, 0x16u);
  }

  AnalyticsSendEvent();
}

void __67__REMStore_TrialClient__requestDownloadGroceryModelAssetsFromTrial__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[REMLogStore xpc];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __67__REMStore_TrialClient__requestDownloadGroceryModelAssetsFromTrial__block_invoke_cold_1();
  }
}

- (id)fetchCreatedOrCompletedRemindersCountForAppStoreFromDate:(id)a3 toDate:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    NSLog(&cfstr_SIsUnexpectedl.isa, "fromDate");
    if (v10) {
      goto LABEL_3;
    }
  }
  NSLog(&cfstr_SIsUnexpectedl.isa, "toDate");
LABEL_3:
  __int16 v11 = [[REMAppStoreDataView alloc] initWithStore:self];
  BOOL v12 = [(REMAppStoreDataView *)v11 fetchCreatedOrCompletedRemindersCountFromDate:v8 toDate:v10 error:a5];

  return v12;
}

- (id)fetchListsForEventKitBridgingWithError:(id *)a3
{
  id v4 = [[REMEventKitBridgingDataView alloc] initWithStore:self];
  id v5 = [(REMEventKitBridgingDataView *)v4 fetchListsWithError:a3];

  return v5;
}

- (id)fetchRemindersForEventKitBridgingWithListIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [[REMEventKitBridgingDataView alloc] initWithStore:self];
  id v8 = [(REMEventKitBridgingDataView *)v7 fetchRemindersWithListIDs:v6 error:a4];

  return v8;
}

- (id)fetchIncompleteRemindersForEventKitBridgingWithDueDateFrom:(id)a3 to:(id)a4 withListIDs:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [[REMEventKitBridgingDataView alloc] initWithStore:self];
  id v14 = [(REMEventKitBridgingDataView *)v13 fetchIncompleteRemindersWithDueDateFrom:v12 to:v11 withListIDs:v10 error:a6];

  return v14;
}

- (id)fetchCompletedRemindersForEventKitBridgingWithCompletionDateFrom:(id)a3 to:(id)a4 withListIDs:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [[REMEventKitBridgingDataView alloc] initWithStore:self];
  id v14 = [(REMEventKitBridgingDataView *)v13 fetchCompletedRemindersWithCompletionDateFrom:v12 to:v11 withListIDs:v10 error:a6];

  return v14;
}

- (id)fetchAllRemindersWithExternalIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "externalIdentifier");
  }
  id v7 = [[REMRemindersDataView alloc] initWithStore:self];
  id v8 = [(REMRemindersDataView *)v7 fetchAllRemindersWithExternalIdentifier:v6 error:a4];

  return v8;
}

- (id)fetchRemindersMatchingTitle:(id)a3 dueAfter:(id)a4 dueBefore:(id)a5 isCompleted:(id)a6 hasLocation:(id)a7 location:(id)a8 error:(id *)a9
{
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  __int16 v21 = [[REMSiriSearchLimitedDataView alloc] initWithStore:self];
  BOOL v22 = [(REMSiriSearchLimitedDataView *)v21 fetchRemindersMatchingTitle:v20 dueAfter:v19 dueBefore:v18 isCompleted:v17 hasLocation:v16 location:v15 error:a9];

  return v22;
}

- (id)fetchAccountWithExternalIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "externalIdentifier");
  }
  id v7 = [[REMAccountsDataView alloc] initWithStore:self];
  id v8 = [(REMAccountsDataView *)v7 fetchAccountWithExternalIdentifier:v6 error:a4];

  return v8;
}

- (id)fetchAccountsWithExternalIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "externalIdentifiers");
  }
  id v7 = [[REMAccountsDataView alloc] initWithStore:self];
  id v8 = [(REMAccountsDataView *)v7 fetchAccountsWithExternalIdentifiers:v6 error:a4];

  return v8;
}

- (id)fetchListsIncludingSpecialContainersInAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "account");
  }
  id v7 = [[REMListsDataView alloc] initWithStore:self];
  id v8 = [(REMListsDataView *)v7 fetchListsIncludingSpecialContainersInAccount:v6 error:a4];

  return v8;
}

- (id)fetchListIncludingSpecialContainerWithObjectID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "listObjectID");
  }
  id v7 = [[REMListsDataView alloc] initWithStore:self];
  id v8 = [(REMListsDataView *)v7 fetchListIncludingSpecialContainerWithObjectID:v6 error:a4];

  return v8;
}

- (id)fetchReminderWithExternalIdentifier:(id)a3 inList:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    if (v9)
    {
      id v11 = [v9 fetchReminderWithExternalIdentifier:v8 error:a5];
    }
    else
    {
      id v12 = +[REMLogStore read];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[REMStore(CalendarDataAccess) fetchReminderWithExternalIdentifier:inList:error:]();
      }

      uint64_t v13 = [[REMRemindersDataView alloc] initWithStore:self];
      id v11 = [(REMRemindersDataView *)v13 fetchReminderWithExternalIdentifier:v8 inList:0 error:a5];
    }
  }
  else
  {
    NSLog(&cfstr_SIsUnexpectedl.isa, "externalIdentifier");
    id v11 = 0;
  }

  return v11;
}

- (id)fetchRemindersWithExternalIdentifiers:(id)a3 inList:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    if (v9)
    {
LABEL_3:
      id v11 = [v10 fetchRemindersWithExternalIdentifiers:v8 error:a5];
      goto LABEL_8;
    }
  }
  else
  {
    NSLog(&cfstr_SIsUnexpectedl.isa, "externalIdentifiers");
    if (v10) {
      goto LABEL_3;
    }
  }
  id v12 = +[REMLogStore read];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    -[REMStore(CalendarDataAccess) fetchRemindersWithExternalIdentifiers:inList:error:]();
  }

  uint64_t v13 = [[REMRemindersDataView alloc] initWithStore:self];
  id v11 = [(REMRemindersDataView *)v13 fetchRemindersWithExternalIdentifiers:v8 inList:0 error:a5];

LABEL_8:

  return v11;
}

- (id)fetchReminderWithDACalendarItemUniqueIdentifier:(id)a3 inList:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "daCalendarItemUniqueIdentifier");
  }
  id v10 = [[REMRemindersDataView alloc] initWithStore:self];
  id v11 = [(REMRemindersDataView *)v10 fetchReminderWithDACalendarItemUniqueIdentifier:v8 inList:v9 error:a5];

  return v11;
}

- (id)fetchRemindersWithDACalendarItemUniqueIdentifiers:(id)a3 inList:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "daCalendarItemUniqueIdentifiers");
  }
  id v10 = [[REMRemindersDataView alloc] initWithStore:self];
  id v11 = [(REMRemindersDataView *)v10 fetchRemindersWithDACalendarItemUniqueIdentifiers:v8 inList:v9 error:a5];

  return v11;
}

- (id)MCIsManagedAccountWithObjectID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "accountObjectID");
  }
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__1;
  char v29 = __Block_byref_object_dispose__1;
  id v30 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = __Block_byref_object_copy__1;
  uint64_t v23 = __Block_byref_object_dispose__1;
  id v24 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__REMStore_EventKitCompatibility__MCIsManagedAccountWithObjectID_error___block_invoke;
  v16[3] = &unk_1E61DC308;
  id v7 = v6;
  id v17 = v7;
  id v18 = &v25;
  id v8 = [(REMStore *)self _xpcSyncStorePerformerWithReason:@"MCIsManagedAccountWithObjectID:" errorHandler:v16];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__REMStore_EventKitCompatibility__MCIsManagedAccountWithObjectID_error___block_invoke_492;
  v12[3] = &unk_1E61DC808;
  id v9 = v7;
  id v13 = v9;
  id v14 = &v19;
  id v15 = &v25;
  [v8 MCIsManagedAccountWithObjectID:v9 completion:v12];
  if (a4) {
    *a4 = (id) v26[5];
  }
  id v10 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v10;
}

void __72__REMStore_EventKitCompatibility__MCIsManagedAccountWithObjectID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __72__REMStore_EventKitCompatibility__MCIsManagedAccountWithObjectID_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __72__REMStore_EventKitCompatibility__MCIsManagedAccountWithObjectID_error___block_invoke_492(void *a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[REMLogStore read];
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __72__REMStore_EventKitCompatibility__MCIsManagedAccountWithObjectID_error___block_invoke_492_cold_1();
    }

    id v9 = (void **)(*(void *)(a1[6] + 8) + 40);
    id v10 = v6;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = a1[4];
    int v14 = 138412546;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_1B9AA2000, v8, OS_LOG_TYPE_INFO, "Store perform MCIsManagedAccountWithObjectID successful {account: %@, MCIsManaged: %@}", (uint8_t *)&v14, 0x16u);
  }

  if (v5)
  {
    id v9 = (void **)(*(void *)(a1[5] + 8) + 40);
    id v10 = v5;
LABEL_9:
    id v12 = v10;
    id v13 = *v9;
    void *v9 = v12;
  }
}

+ (BOOL)notificationsEnabled
{
  id v2 = +[REMUserDefaults daemonUserDefaults];
  char v3 = [v2 newAppShouldTakeoverEKReminderNotifications];

  return v3;
}

+ (BOOL)dataaccessDaemonStopSyncingReminders
{
  id v2 = +[REMUserDefaults daemonUserDefaults];
  char v3 = [v2 dataaccessDaemonStopSyncingReminders];

  return v3;
}

+ (BOOL)isEventKitSyncEnabledForReminderKit
{
  id v2 = +[REMLogStore utility];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1B9AA2000, v2, OS_LOG_TYPE_INFO, "EventKitSync: enabled on iOS", v4, 2u);
  }

  return 1;
}

- (id)fetchAssignmentsWithObjectIDs:(id)a3 includeConcealedObjects:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (!v8) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "objectIDs");
  }
  if ([v8 count])
  {
    id v9 = [[REMAssignmentsDataViewInvocation_fetchByObjectID alloc] initWithObjectIDs:v8];
    [(REMAssignmentsDataViewInvocation_fetchByObjectID *)v9 setAllowConcealedObjects:v6];
    id v10 = [(REMStore *)self resultFromPerformingInvocation:v9 error:a5];
    uint64_t v11 = objc_opt_class();
    id v12 = REMDynamicCast(v11, (uint64_t)v10);
    id v13 = [v12 assignments];
  }
  else
  {
    id v13 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v13;
}

- (id)fetchHashtagsWithObjectIDs:(id)a3 includeConcealedObjects:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (!v8) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "objectIDs");
  }
  if ([v8 count])
  {
    id v9 = [[REMHashtagsDataViewInvocation_fetchByObjectID alloc] initWithObjectIDs:v8];
    [(REMHashtagsDataViewInvocation_fetchByObjectID *)v9 setAllowConcealedObjects:v6];
    id v10 = [(REMStore *)self resultFromPerformingInvocation:v9 error:a5];
    uint64_t v11 = objc_opt_class();
    id v12 = REMDynamicCast(v11, (uint64_t)v10);
    id v13 = [v12 hashtags];
  }
  else
  {
    id v13 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v13;
}

- (id)fetchAllListsWithExternalIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "externalIdentifier");
  }
  id v7 = [[REMListsDataView alloc] initWithStore:self];
  id v8 = [(REMListsDataView *)v7 fetchAllListsWithExternalIdentifier:v6 inAccount:0 error:a4];

  return v8;
}

- (void)updateAccountWithAccountID:(id)a3 completion:(id)a4
{
}

- (void)triggerSyncForDataAccessAccountsWithAccountIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(REMStore *)self daemonController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__REMStore_AccountManagement_PrivateSPIs__triggerSyncForDataAccessAccountsWithAccountIDs___block_invoke;
  v7[3] = &unk_1E61DC830;
  id v8 = v4;
  id v6 = v4;
  [v5 asyncSyncInterfacePerformerWithReason:@"triggerSyncForDataAccessAccountsWithAccountIDs" loadHandler:v7 errorHandler:&__block_literal_global_519];
}

void __90__REMStore_AccountManagement_PrivateSPIs__triggerSyncForDataAccessAccountsWithAccountIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1B9AA2000, v4, OS_LOG_TYPE_DEFAULT, "Triggering sync for dataAccess accounts {accountIDs: %{public}@}", (uint8_t *)&v6, 0xCu);
  }

  [v3 syncDataAccessAccountsWithAccountIDs:*(void *)(a1 + 32) bypassThrottler:1 completion:&__block_literal_global_516];
}

void __90__REMStore_AccountManagement_PrivateSPIs__triggerSyncForDataAccessAccountsWithAccountIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[REMLogStore xpc];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __90__REMStore_AccountManagement_PrivateSPIs__triggerSyncForDataAccessAccountsWithAccountIDs___block_invoke_2_cold_1();
  }
}

- (void)triggerCloudKitOnlySyncWithReason:(id)a3 discretionary:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__REMStore_AccountManagement_Internal__triggerCloudKitOnlySyncWithReason_discretionary_completion___block_invoke;
  v10[3] = &unk_1E61DC3F8;
  id v11 = v8;
  id v9 = v8;
  [(REMStore *)self _triggerSyncWithReason:a3 skipDataAccessSync:1 forcingCloudKitReload:0 discretionary:v5 bypassThrottler:1 completion:v10];
}

uint64_t __99__REMStore_AccountManagement_Internal__triggerCloudKitOnlySyncWithReason_discretionary_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateAccountsAndSync:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(REMStore *)self daemonController];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__REMStore_AccountManagement_Internal__updateAccountsAndSync_completion___block_invoke;
  v11[3] = &unk_1E61DC8A8;
  BOOL v13 = a3;
  v11[4] = self;
  id v12 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__REMStore_AccountManagement_Internal__updateAccountsAndSync_completion___block_invoke_2_528;
  v9[3] = &unk_1E61DC3F8;
  id v10 = v12;
  id v8 = v12;
  [v7 asyncStorePerformerWithReason:@"updateAccountsAndSync" loadHandler:v11 errorHandler:v9];
}

void __73__REMStore_AccountManagement_Internal__updateAccountsAndSync_completion___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__REMStore_AccountManagement_Internal__updateAccountsAndSync_completion___block_invoke_2;
  v5[3] = &unk_1E61DC880;
  id v4 = *(id *)(a1 + 40);
  char v7 = *(unsigned char *)(a1 + 48);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [a2 updateAccountsAndFetchMigrationState:1 completion:v5];
}

void __73__REMStore_AccountManagement_Internal__updateAccountsAndSync_completion___block_invoke_2(uint64_t a1, uint64_t a2, char a3, void *a4)
{
  id v7 = a4;
  if (v7)
  {
    id v8 = +[REMLogStore write];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __73__REMStore_AccountManagement_Internal__updateAccountsAndSync_completion___block_invoke_2_cold_1();
    }

    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (*(unsigned char *)(a1 + 48))
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __73__REMStore_AccountManagement_Internal__updateAccountsAndSync_completion___block_invoke_526;
      v11[3] = &unk_1E61DC858;
      id v10 = *(void **)(a1 + 32);
      id v12 = *(id *)(a1 + 40);
      char v13 = a2;
      char v14 = a3;
      [v10 _triggerSyncWithReason:@"UpdateAccounts" skipDataAccessSync:0 forcingCloudKitReload:a2 discretionary:0 bypassThrottler:1 completion:v11];

      goto LABEL_8;
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
LABEL_8:
}

uint64_t __73__REMStore_AccountManagement_Internal__updateAccountsAndSync_completion___block_invoke_526(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41), a2);
}

void __73__REMStore_AccountManagement_Internal__updateAccountsAndSync_completion___block_invoke_2_528(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__REMStore_AccountManagement_Internal__updateAccountsAndSync_completion___block_invoke_2_528_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateAccountWithAccountID:(id)a3 restartDA:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(REMStore *)self daemonController];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__REMStore_AccountManagement_Internal__updateAccountWithAccountID_restartDA_completion___block_invoke;
  v15[3] = &unk_1E61DC8F8;
  BOOL v18 = a4;
  id v16 = v8;
  id v17 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__REMStore_AccountManagement_Internal__updateAccountWithAccountID_restartDA_completion___block_invoke_3;
  v13[3] = &unk_1E61DC248;
  id v14 = v16;
  id v11 = v16;
  id v12 = v9;
  [v10 asyncStorePerformerWithReason:@"updateAccountWithAccountID" loadHandler:v15 errorHandler:v13];
}

void __88__REMStore_AccountManagement_Internal__updateAccountWithAccountID_restartDA_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__REMStore_AccountManagement_Internal__updateAccountWithAccountID_restartDA_completion___block_invoke_2;
  v5[3] = &unk_1E61DC8D0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [a2 updateAccountWithACAccountID:v4 restartDA:v3 completion:v5];
}

uint64_t __88__REMStore_AccountManagement_Internal__updateAccountWithAccountID_restartDA_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__REMStore_AccountManagement_Internal__updateAccountWithAccountID_restartDA_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[REMLogStore xpc];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __88__REMStore_AccountManagement_Internal__updateAccountWithAccountID_restartDA_completion___block_invoke_3_cold_1();
  }
}

- (void)removeOrphanedAccountsWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(REMStore *)self daemonController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__REMStore_AccountManagement_Internal__removeOrphanedAccountsWithCompletion___block_invoke;
  v7[3] = &unk_1E61DC920;
  id v8 = v4;
  id v6 = v4;
  [v5 asyncStorePerformerWithReason:@"removeOrphanedAccountsWithCompletion" loadHandler:v7 errorHandler:&__block_literal_global_536];
}

void __77__REMStore_AccountManagement_Internal__removeOrphanedAccountsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__REMStore_AccountManagement_Internal__removeOrphanedAccountsWithCompletion___block_invoke_2;
  v3[3] = &unk_1E61DC6C8;
  id v4 = *(id *)(a1 + 32);
  [a2 removeOrphanedAccountWithCompletion:v3];
}

uint64_t __77__REMStore_AccountManagement_Internal__removeOrphanedAccountsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__REMStore_AccountManagement_Internal__removeOrphanedAccountsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[REMLogStore xpc];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __77__REMStore_AccountManagement_Internal__removeOrphanedAccountsWithCompletion___block_invoke_3_cold_1();
  }
}

void __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke_6_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestToMergeLocalDataIntoSyncDataWithAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(REMStore *)self daemonController];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __108__REMStore_AccountManagement_Internal__requestToMergeLocalDataIntoSyncDataWithAccountIdentifier_completion___block_invoke;
  v13[3] = &unk_1E61DC650;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __108__REMStore_AccountManagement_Internal__requestToMergeLocalDataIntoSyncDataWithAccountIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E61DC248;
  id v12 = v14;
  id v9 = v14;
  id v10 = v7;
  [v8 asyncStorePerformerWithReason:@"requestToMergeLocalDataIntoSyncData" loadHandler:v13 errorHandler:v11];
}

void __108__REMStore_AccountManagement_Internal__requestToMergeLocalDataIntoSyncDataWithAccountIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __108__REMStore_AccountManagement_Internal__requestToMergeLocalDataIntoSyncDataWithAccountIdentifier_completion___block_invoke_2;
  v4[3] = &unk_1E61DC3F8;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 requestToMergeLocalDataIntoSyncDataWithAccountIdentifier:v3 completion:v4];
}

uint64_t __108__REMStore_AccountManagement_Internal__requestToMergeLocalDataIntoSyncDataWithAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __108__REMStore_AccountManagement_Internal__requestToMergeLocalDataIntoSyncDataWithAccountIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[REMLogStore xpc];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __108__REMStore_AccountManagement_Internal__requestToMergeLocalDataIntoSyncDataWithAccountIdentifier_completion___block_invoke_3_cold_1();
  }
}

- (void)requestToDeleteSyncDataWithAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(REMStore *)self daemonController];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __96__REMStore_AccountManagement_Internal__requestToDeleteSyncDataWithAccountIdentifier_completion___block_invoke;
  v13[3] = &unk_1E61DC650;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __96__REMStore_AccountManagement_Internal__requestToDeleteSyncDataWithAccountIdentifier_completion___block_invoke_3;
  v11[3] = &unk_1E61DC248;
  id v12 = v14;
  id v9 = v14;
  id v10 = v7;
  [v8 asyncStorePerformerWithReason:@"requestToDeleteSyncData" loadHandler:v13 errorHandler:v11];
}

void __96__REMStore_AccountManagement_Internal__requestToDeleteSyncDataWithAccountIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __96__REMStore_AccountManagement_Internal__requestToDeleteSyncDataWithAccountIdentifier_completion___block_invoke_2;
  v4[3] = &unk_1E61DC3F8;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 requestToDeleteSyncDataWithAccountIdentifier:v3 completion:v4];
}

uint64_t __96__REMStore_AccountManagement_Internal__requestToDeleteSyncDataWithAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __96__REMStore_AccountManagement_Internal__requestToDeleteSyncDataWithAccountIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[REMLogStore xpc];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __96__REMStore_AccountManagement_Internal__requestToDeleteSyncDataWithAccountIdentifier_completion___block_invoke_3_cold_1();
  }
}

- (void)requestToDeleteLocalDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(REMStore *)self daemonController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__REMStore_AccountManagement_Internal__requestToDeleteLocalDataWithCompletion___block_invoke;
  v7[3] = &unk_1E61DC920;
  id v8 = v4;
  id v6 = v4;
  [v5 asyncStorePerformerWithReason:@"requestToDeleteLocalData" loadHandler:v7 errorHandler:&__block_literal_global_547];
}

void __79__REMStore_AccountManagement_Internal__requestToDeleteLocalDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__REMStore_AccountManagement_Internal__requestToDeleteLocalDataWithCompletion___block_invoke_2;
  v3[3] = &unk_1E61DC3F8;
  id v4 = *(id *)(a1 + 32);
  [a2 requestToDeleteLocalDataWithCompletion:v3];
}

uint64_t __79__REMStore_AccountManagement_Internal__requestToDeleteLocalDataWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__REMStore_AccountManagement_Internal__requestToDeleteLocalDataWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[REMLogStore xpc];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __79__REMStore_AccountManagement_Internal__requestToDeleteLocalDataWithCompletion___block_invoke_3_cold_1();
  }
}

- (id)fetchTemplateWithObjectID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [[REMTemplatesDataView alloc] initWithStore:self];
  id v8 = [(REMTemplatesDataView *)v7 fetchTemplateWithObjectID:v6 error:a4];

  return v8;
}

- (id)fetchListRepresentationOfTemplateWithObjectID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [[REMListsDataView alloc] initWithStore:self];
  id v8 = [(REMListsDataView *)v7 fetchListRepresentationOfTemplateWithObjectID:v6 error:a4];

  return v8;
}

- (void)addCKShareObserverIfNeededForAccountID:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __77__REMStore_Sharing__addCKShareObserverIfNeededForAccountID_queue_completion___block_invoke;
  v23[3] = &unk_1E61DC448;
  id v24 = v9;
  id v25 = v10;
  id v11 = v10;
  id v12 = v9;
  char v13 = (void *)MEMORY[0x1BA9DBBC0](v23);
  id v14 = [(REMStore *)self daemonController];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __77__REMStore_Sharing__addCKShareObserverIfNeededForAccountID_queue_completion___block_invoke_3;
  v20[3] = &unk_1E61DC650;
  id v21 = v8;
  id v22 = v13;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77__REMStore_Sharing__addCKShareObserverIfNeededForAccountID_queue_completion___block_invoke_5;
  v17[3] = &unk_1E61DC448;
  id v18 = v21;
  id v19 = v22;
  id v15 = v22;
  id v16 = v21;
  [v14 asyncStorePerformerWithReason:@"addCKShareObserverIfNeededForAccountID" loadHandler:v20 errorHandler:v17];
}

void __77__REMStore_Sharing__addCKShareObserverIfNeededForAccountID_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__REMStore_Sharing__addCKShareObserverIfNeededForAccountID_queue_completion___block_invoke_2;
  v7[3] = &unk_1E61DC5B0;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __77__REMStore_Sharing__addCKShareObserverIfNeededForAccountID_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __77__REMStore_Sharing__addCKShareObserverIfNeededForAccountID_queue_completion___block_invoke_3(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__REMStore_Sharing__addCKShareObserverIfNeededForAccountID_queue_completion___block_invoke_4;
  v4[3] = &unk_1E61DC3F8;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 addCKShareObserverIfNeededForAccountID:v3 completion:v4];
}

uint64_t __77__REMStore_Sharing__addCKShareObserverIfNeededForAccountID_queue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__REMStore_Sharing__addCKShareObserverIfNeededForAccountID_queue_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __77__REMStore_Sharing__addCKShareObserverIfNeededForAccountID_queue_completion___block_invoke_5_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)replicaManagerProviderForCalDAVSync
{
  id v2 = [[_REMDACalDAVSyncReplicaManagerProvider alloc] initWithStore:self];

  return v2;
}

void __105__REMStore_ClientConnections__requestToUpdateClientConnectionsAsynchronously_shouldKeepAlive_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __105__REMStore_ClientConnections__requestToUpdateClientConnectionsAsynchronously_shouldKeepAlive_completion___block_invoke_2_cold_1(a1);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __105__REMStore_ClientConnections__requestToUpdateClientConnectionsAsynchronously_shouldKeepAlive_completion___block_invoke_632(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __105__REMStore_ClientConnections__requestToUpdateClientConnectionsAsynchronously_shouldKeepAlive_completion___block_invoke_2_cold_1(a1);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (id)repairPhantomObjectsWithObjectIDs:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[REMLogStore write];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1B9AA2000, v7, OS_LOG_TYPE_DEFAULT, "repairPhantomObjectsWithObjectIDs: Invoked with {objectIDs: %{public}@}", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__1;
  id v25 = __Block_byref_object_dispose__1;
  id v26 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__1;
  id v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__REMStore_PhantomObjectRepairing__repairPhantomObjectsWithObjectIDs_error___block_invoke;
  v13[3] = &unk_1E61DC308;
  id v8 = v6;
  id v14 = v8;
  p_long long buf = &buf;
  id v9 = [(REMStore *)self _xpcSyncStorePerformerWithReason:@"repairPhantomObjectsWithObjectIDs" errorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__REMStore_PhantomObjectRepairing__repairPhantomObjectsWithObjectIDs_error___block_invoke_641;
  v12[3] = &unk_1E61DCA38;
  void v12[4] = &buf;
  void v12[5] = &v16;
  [v9 validatePhantomObjectsWith:v8 shouldRepair:1 completion:v12];
  if (a4) {
    *a4 = *(id *)(*((void *)&buf + 1) + 40);
  }
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&buf, 8);

  return v10;
}

void __76__REMStore_PhantomObjectRepairing__repairPhantomObjectsWithObjectIDs_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[REMLogStore xpc];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__REMStore_PhantomObjectRepairing__repairPhantomObjectsWithObjectIDs_error___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __76__REMStore_PhantomObjectRepairing__repairPhantomObjectsWithObjectIDs_error___block_invoke_641(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[REMLogStore write];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __76__REMStore_PhantomObjectRepairing__repairPhantomObjectsWithObjectIDs_error___block_invoke_641_cold_1((uint64_t)v6, (uint64_t)v5, v7);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  id v8 = +[REMLogStore write];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543362;
    id v12 = v5;
    _os_log_impl(&dword_1B9AA2000, v8, OS_LOG_TYPE_INFO, "repairPhantomObjectsWithObjectIDs successful {result: %{public}@}", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

- (id)debugFetchPhantomListsWithError:(id *)a3
{
  id v4 = [[REMListsDataView alloc] initWithStore:self];
  id v5 = [(REMListsDataView *)v4 debugFetchPhantomListsWithError:a3];

  return v5;
}

- (void)test_setupForManualHashtagLabelRefreshing
{
  id v2 = [(REMStore *)self daemonController];
  id v3 = [v2 syncDebugPerformerWithReason:@"test_setupForManualHashtagLabelRefreshing" errorHandler:&__block_literal_global_651];

  [v3 setupManualHashtagLabelUpdater];
}

void __63__REMStore_UnitTest__test_setupForManualHashtagLabelRefreshing__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[REMLogStore xpc];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__REMStore_nukeDatabase__block_invoke_cold_1();
  }
}

- (void)test_refreshHashtagLabelsImmediately
{
  id v2 = [(REMStore *)self daemonController];
  id v3 = [v2 syncDebugPerformerWithReason:@"test_refreshHashtagLabelsImmediately" errorHandler:&__block_literal_global_656];

  [v3 refreshHashtagLabelsImmediately];
}

void __58__REMStore_UnitTest__test_refreshHashtagLabelsImmediately__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[REMLogStore xpc];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__REMStore_nukeDatabase__block_invoke_cold_1();
  }
}

- (void)test_handleIncompleteTemplateOperationQueueItemsImmediately
{
  id v2 = [(REMStore *)self daemonController];
  id v3 = [v2 syncDebugPerformerWithReason:@"test_handleIncompleteTemplateOperationQueueItemsImmediately" errorHandler:&__block_literal_global_661];

  [v3 handleIncompleteTemplateOperationQueueItemsImmediately];
}

void __81__REMStore_UnitTest__test_handleIncompleteTemplateOperationQueueItemsImmediately__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[REMLogStore xpc];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__REMStore_nukeDatabase__block_invoke_cold_1();
  }
}

- (void)test_handleIncompleteGroceryOperationQueueItemsImmediatelyWithTimeout:(double)a3
{
  id v4 = [(REMStore *)self daemonController];
  id v5 = [v4 syncDebugPerformerWithReason:@"test_handleIncompleteGroceryOperationQueueItemsImmediately" errorHandler:&__block_literal_global_666];

  [v5 handleIncompleteGroceryOperationQueueItemsImmediatelyWithTimeout:a3];
}

void __92__REMStore_UnitTest__test_handleIncompleteGroceryOperationQueueItemsImmediatelyWithTimeout___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[REMLogStore xpc];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__REMStore_nukeDatabase__block_invoke_cold_1();
  }
}

- (id)test_immediatelyCreateOrUpdatePublicLinkOfTemplateWithTemplateObjectID:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(REMStore *)self daemonController];
  int v11 = [v10 syncDebugPerformerWithReason:@"test_immediatelyCreateOrUpdatePublicLinkOfTemplate" errorHandler:&__block_literal_global_671];

  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__1;
  id v26 = __Block_byref_object_dispose__1;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__1;
  id v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __113__REMStore_UnitTest__test_immediatelyCreateOrUpdatePublicLinkOfTemplateWithTemplateObjectID_configuration_error___block_invoke_672;
  v15[3] = &unk_1E61DCA60;
  void v15[4] = &v22;
  void v15[5] = &v16;
  [v11 immediatelyCreateOrUpdatePublicLinkOfTemplateWithTemplateObjectID:v8 configuration:v9 completion:v15];
  if (a5)
  {
    id v12 = (void *)v17[5];
    if (v12) {
      *a5 = v12;
    }
  }
  id v13 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);

  return v13;
}

void __113__REMStore_UnitTest__test_immediatelyCreateOrUpdatePublicLinkOfTemplateWithTemplateObjectID_configuration_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[REMLogStore xpc];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__REMStore_nukeDatabase__block_invoke_cold_1();
  }
}

void __113__REMStore_UnitTest__test_immediatelyCreateOrUpdatePublicLinkOfTemplateWithTemplateObjectID_configuration_error___block_invoke_672(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)test_immediatelyRevokePublicLinkOfTemplateWithTemplateObjectID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(REMStore *)self daemonController];
  id v8 = [v7 syncDebugPerformerWithReason:@"test_immediatelyRevokePublicLinkOfTemplate" errorHandler:&__block_literal_global_678];

  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__1;
  uint64_t v23 = __Block_byref_object_dispose__1;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__1;
  id v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__REMStore_UnitTest__test_immediatelyRevokePublicLinkOfTemplateWithTemplateObjectID_error___block_invoke_679;
  v12[3] = &unk_1E61DCA88;
  void v12[4] = &v19;
  void v12[5] = &v13;
  [v8 immediatelyRevokePublicLinkOfTemplateWithTemplateObjectID:v6 completion:v12];
  if (a4)
  {
    uint64_t v9 = (void *)v14[5];
    if (v9) {
      *a4 = v9;
    }
  }
  id v10 = (id)v20[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v10;
}

void __91__REMStore_UnitTest__test_immediatelyRevokePublicLinkOfTemplateWithTemplateObjectID_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[REMLogStore xpc];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __24__REMStore_nukeDatabase__block_invoke_cold_1();
  }
}

void __91__REMStore_UnitTest__test_immediatelyRevokePublicLinkOfTemplateWithTemplateObjectID_error___block_invoke_679(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)test_revertImageAttachmentsToUnDeduped:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(REMStore *)self daemonController];
  id v8 = [v7 syncDebugPerformerWithReason:@"test_revertImageAttachmentsToUnDeduped" errorHandler:&__block_literal_global_685];

  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__1;
  id v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__REMStore_UnitTest__test_revertImageAttachmentsToUnDeduped_error___block_invoke_686;
  v13[3] = &unk_1E61DC1F8;
  void v13[4] = &v14;
  objc_msgSend(v8, "synchronous_revertImageAttachmentsToUnDeduped:completion:", v6, v13);
  uint64_t v9 = v15;
  if (a4)
  {
    id v10 = (void *)v15[5];
    if (v10)
    {
      *a4 = v10;
      uint64_t v9 = v15;
    }
  }
  BOOL v11 = v9[5] == 0;
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __67__REMStore_UnitTest__test_revertImageAttachmentsToUnDeduped_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[REMLogStore xpc];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __67__REMStore_UnitTest__test_revertImageAttachmentsToUnDeduped_error___block_invoke_cold_1();
  }
}

void __67__REMStore_UnitTest__test_revertImageAttachmentsToUnDeduped_error___block_invoke_686(uint64_t a1, void *a2)
{
}

- (id)fetchListSectionsWithObjectIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "sectionObjectIDs");
  }
  uint64_t v7 = [[REMListSectionsDataView alloc] initWithStore:self];
  id v8 = [(REMListSectionsDataView *)v7 fetchListSectionsWithObjectIDs:v6 error:a4];

  return v8;
}

- (id)fetchListSectionWithObjectID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
  }
  uint64_t v7 = [[REMListSectionsDataView alloc] initWithStore:self];
  id v8 = [(REMListSectionsDataView *)v7 fetchListSectionWithObjectID:v6 error:a4];

  return v8;
}

- (id)fetchListSectionsForListSectionContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "listSectionContext");
  }
  uint64_t v7 = [v6 list];

  if (!v7) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "listSectionContext.list");
  }
  id v8 = [[REMListSectionsDataView alloc] initWithStore:self];
  uint64_t v9 = [v6 list];
  id v10 = [(REMListSectionsDataView *)v8 fetchListSectionsInList:v9 error:a4];

  return v10;
}

- (id)fetchListSectionsForListSectionContextChangeItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 listChangeItem];
  id v8 = [v7 objectID];

  if (!v8) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "listSectionContextChangeItem.listChangeItem.objectID");
  }
  uint64_t v9 = [[REMListSectionsDataView alloc] initWithStore:self];
  id v10 = [v6 listChangeItem];

  BOOL v11 = [v10 objectID];
  id v12 = [(REMListSectionsDataView *)v9 fetchListSectionsWithListObjectID:v11 error:a4];

  return v12;
}

- (id)fetchListSectionsWithListObjectID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "listObjectID");
  }
  uint64_t v7 = [[REMListSectionsDataView alloc] initWithStore:self];
  id v8 = [(REMListSectionsDataView *)v7 fetchListSectionsWithListObjectID:v6 error:a4];

  return v8;
}

- (id)fetchListSectionsCountWithListObjectID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "listObjectID");
  }
  uint64_t v7 = [[REMListSectionsDataView alloc] initWithStore:self];
  id v8 = [(REMListSectionsDataView *)v7 fetchListSectionsCountWithListObjectID:v6 error:a4];

  return v8;
}

- (id)fetchSmartListSectionsWithObjectIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "sectionObjectIDs");
  }
  uint64_t v7 = [[REMSmartListSectionsDataView alloc] initWithStore:self];
  id v8 = [(REMSmartListSectionsDataView *)v7 fetchSmartListSectionsWithObjectIDs:v6 error:a4];

  return v8;
}

- (id)fetchSmartListSectionWithObjectID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
  }
  uint64_t v7 = [[REMSmartListSectionsDataView alloc] initWithStore:self];
  id v8 = [(REMSmartListSectionsDataView *)v7 fetchSmartListSectionWithObjectID:v6 error:a4];

  return v8;
}

- (id)fetchSmartListSectionsForSmartListSectionContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "smartListSectionContext");
  }
  uint64_t v7 = [v6 smartList];

  if (!v7) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "smartListSectionContext.smartList");
  }
  id v8 = [[REMSmartListSectionsDataView alloc] initWithStore:self];
  uint64_t v9 = [v6 smartList];
  id v10 = [(REMSmartListSectionsDataView *)v8 fetchSmartListSectionsInSmartList:v9 error:a4];

  return v10;
}

- (id)fetchTemplateSectionsWithObjectIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "sectionObjectIDs");
  }
  uint64_t v7 = [[REMTemplateSectionsDataView alloc] initWithStore:self];
  id v8 = [(REMTemplateSectionsDataView *)v7 fetchTemplateSectionsWithObjectIDs:v6 error:a4];

  return v8;
}

- (id)fetchTemplateSectionWithObjectID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
  }
  uint64_t v7 = [[REMTemplateSectionsDataView alloc] initWithStore:self];
  id v8 = [(REMTemplateSectionsDataView *)v7 fetchTemplateSectionWithObjectID:v6 error:a4];

  return v8;
}

- (id)fetchTemplateSectionsForTemplateSectionContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!v6) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "templateSectionContext");
  }
  uint64_t v7 = [v6 parentTemplate];

  if (!v7) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "templateSectionContext.parentTemplate");
  }
  id v8 = [[REMTemplateSectionsDataView alloc] initWithStore:self];
  uint64_t v9 = [v6 parentTemplate];
  id v10 = [(REMTemplateSectionsDataView *)v8 fetchTemplateSectionsInTemplate:v9 error:a4];

  return v10;
}

void __50__REMStore_createIsolatedStoreContainerWithError___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "Failed to create isolated store container {error: %@}", v2, v3, v4, v5, v6);
}

void __57__REMStore_destroyIsolatedStoreContainerWithToken_error___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "Failed to destroy isolated store container {error: %@, token: %@}");
}

void __57__REMStore_destroyIsolatedStoreContainerWithToken_error___block_invoke_31_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "XPC error trying to call destroyIsolatedStoreContainerWithToken {xpcError: %@}", v2, v3, v4, v5, v6);
}

void __24__REMStore_nukeDatabase__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "xpc error while using debug performer {error :%@}", v2, v3, v4, v5, v6);
}

void __50__REMStore_fetchReplicaManagerForAccountID_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "XPC error while fetching replica manager {error: %@, account: %@}");
}

void __50__REMStore_fetchReplicaManagerForAccountID_error___block_invoke_69_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "Store replica manager fetch failed {error: %@, account: %@}");
}

void __60__REMStore_fetchReplicaManagersForAccountID_bundleID_error___block_invoke_74_cold_1()
{
  OUTLINED_FUNCTION_25(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_7_0(&dword_1B9AA2000, v0, v1, "Store replica manager fetch failed {error: %@, account: %@, bundleID: %@}");
}

void __238__REMStore_saveSaveRequest_accountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_error___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "XPC error while saving {error: %{public}@, store: %@}");
}

void __53__REMStore_fetchResultByExecutingFetchRequest_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "XPC error while executing fetchRequest {error: %@, fetchRequest: %@}");
}

void __53__REMStore_fetchResultByExecutingFetchRequest_error___block_invoke_87_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __53__REMStore_fetchResultByExecutingFetchRequest_error___block_invoke_87_cold_2()
{
  OUTLINED_FUNCTION_25(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_7_0(&dword_1B9AA2000, v0, v1, "Store failed to execute fetchRequest {error: %@, fetchRequest: %@, store: %@}");
}

void __49__REMStore_resultFromPerformingInvocation_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(v1 + 32) name];
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_4_0(&dword_1B9AA2000, v0, v3, "FETCH END ERROR_XPC {name: %{public}@, error: %{public}@}", v4);
}

void __49__REMStore_resultFromPerformingInvocation_error___block_invoke_92_cold_1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(v1 + 32) name];
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_4_0(&dword_1B9AA2000, v0, v3, "FETCH END ERROR {name: %{public}@, error: %{public}@}", v4);
}

void __78__REMStore_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v1 = [*(id *)(v0 + 32) name];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8(&dword_1B9AA2000, v2, v3, "FETCH END ERROR_XPC {invocationCounter: %ld, name: %{public}@, error: %{public}@}", v4, v5, v6, v7, 2u);
}

void __78__REMStore_resultFromPerformingSwiftInvocation_parametersData_storages_error___block_invoke_97_cold_1()
{
  OUTLINED_FUNCTION_7();
  uint64_t v7 = [*(id *)(v0 + 32) name];
  OUTLINED_FUNCTION_8(&dword_1B9AA2000, v1, v2, "FETCH END ERROR {invocationCounter: %ld, name: %{public}@, error: %@}", v3, v4, v5, v6, 2u);
}

void __43__REMStore_enumerateAllRemindersWithBlock___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a2 localizedDescription];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_0(&dword_1B9AA2000, a3, v5, "Unexpected error when fetching all reminders from list {list: %@, error: %@}", v6);
}

- (void)_enumerateAllListsIncludingGroups:(void *)a1 withBlock:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 localizedDescription];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "Unexpected error when fetching all accounts: %@", v4, 0xCu);
}

void __58__REMStore__xpcSyncStorePerformerWithReason_errorHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "xpc error while using xpcPerformer {error: %{public}@, store: %@}");
}

- (void)_addChangeItemChangedKeys:objectID:toChangedKeysMap:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1B9AA2000, v0, OS_LOG_TYPE_FAULT, "(client) Unexpected duplicate change item on objects with the same objectID {objectID: %{public}@}", v1, 0xCu);
}

- (void)_saveAccountChangeItems:(os_log_t)log listChangeItems:listSectionChangeItems:smartListChangeItems:smartListSectionChangeItems:templateChangeItems:templateSectionChangeItems:reminderChangeItems:author:replicaManagerProvider:synchronously:syncToCloudKit:performer:completion:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_FAULT, "A template should be modified using 'REMTemplateChangeItem' instead of 'REMListChangeItem'", buf, 2u);
}

void __271__REMStore__saveAccountChangeItems_listChangeItems_listSectionChangeItems_smartListChangeItems_smartListSectionChangeItems_templateChangeItems_templateSectionChangeItems_reminderChangeItems_author_replicaManagerProvider_synchronously_syncToCloudKit_performer_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "(client) SAVE FAIL {error: %{public}@}", v2, v3, v4, v5, v6);
}

void __42__REMStore_fetchShareForListWithID_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "XPC error while fetching share for list {error: %@, list: %@}");
}

void __42__REMStore_fetchShareForListWithID_error___block_invoke_114_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "Store fetch share failed {error: %@, account: %@}");
}

void __55__REMStore_createShareForListWithID_appIconData_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "XPC error while creating share for list {error: %@, list: %@}");
}

void __55__REMStore_createShareForListWithID_appIconData_error___block_invoke_119_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "Store create share failed {error: %@, account: %@}");
}

void __51__REMStore_updateShare_accountID_queue_completion___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_25(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7_0(&dword_1B9AA2000, v0, v1, "XPC error while updating share {error: %@, share: %@, accountID: %{public}@}");
}

void __49__REMStore_stopShare_accountID_queue_completion___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_25(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7_0(&dword_1B9AA2000, v0, v1, "XPC error while stopping share {error: %@, share: %@, accountID: %{public}@}");
}

void __53__REMStore_acceptShareWithMetadata_queue_completion___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "XPC error while accepting share {error: %@, metadata: %@}");
}

void __65__REMStore_compressedDistributedEvaluationDataWithOptions_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "XPC error while fetching store performer {error: %{public}@}", v2, v3, v4, v5, v6);
}

void __65__REMStore_compressedDistributedEvaluationDataWithOptions_error___block_invoke_134_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_1B9AA2000, v0, v1, "DistributedEvaluation Export produced no result and no error", v2, v3, v4, v5, v6);
}

void __65__REMStore_compressedDistributedEvaluationDataWithOptions_error___block_invoke_134_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "DistributedEvaluation Export ERROR {error: %{public}@}", v2, v3, v4, v5, v6);
}

void __55__REMStore_anchoredBubbleCloudOverridesWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "XPC error while querying iCloud configuration for Suggested Attributes harvesting parameters {error: %{public}@}", v2, v3, v4, v5, v6);
}

void __64__REMStore_fetchMinimumSearchTermLengthByBaseLanguageWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "XPC error while querying iCloud configuration for minimumSearchTermLengthByBaseLanguage {error: %{public}@}", v2, v3, v4, v5, v6);
}

void __64__REMStore_fetchMinimumSearchTermLengthByBaseLanguageWithError___block_invoke_152_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "Fetch minimumSearchTermLengthByBaseLanguage failed {error: %@}", v2, v3, v4, v5, v6);
}

void __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_24();
  [(id)OUTLINED_FUNCTION_22(v2) objectID];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_21() account];
  uint64_t v4 = [v3 objectID];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0(&dword_1B9AA2000, v0, v5, "Given invitation list has no external identifier {invitationList: %@, account: %@}", v6);
}

void __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_24();
  [(id)OUTLINED_FUNCTION_22(v2) objectID];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_21() account];
  uint64_t v4 = [v3 objectID];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0(&dword_1B9AA2000, v0, v5, "Could not find the external identifier from the given invitation list {invitationList: %@, account: %@}", v6);
}

void __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3_cold_3()
{
  OUTLINED_FUNCTION_24();
  [(id)OUTLINED_FUNCTION_22(v2) objectID];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_21() account];
  uint64_t v4 = [v3 objectID];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0(&dword_1B9AA2000, v0, v5, "Given invitation list isn't a sharing invitation {invitationList: %@, account: %@}", v6);
}

void __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3_cold_4()
{
  OUTLINED_FUNCTION_24();
  [(id)OUTLINED_FUNCTION_22(v2) objectID];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_21() account];
  uint64_t v4 = [v3 objectID];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0(&dword_1B9AA2000, v0, v5, "Given invitation list isn't a CalDAV list {invitationList: %@, account: %@}", v6);
}

void __84__REMStore_CalDAVSharing___respondToCalDAVSharedList_withResponse_queue_completion___block_invoke_3_316_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a2 + 32) objectID];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_0(&dword_1B9AA2000, a3, v5, "XPC error while accepting CalDAV share {error: %@, invitationList: %@}", v6);
}

void __83__REMStore_iMessageInteractionSPI__notifyOfInteractionWithPeople_force_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "Failed to notify of interaction {error: %@, people: %@}");
}

void __83__REMStore_iMessageInteractionSPI__notifyOfInteractionWithPeople_force_completion___block_invoke_353_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "XPC error while notifying of interaction {error: %@, people: %@}");
}

void __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke_409_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "FamilyChecklistSPI CloudKit error fetching participants for shared grocery list %@", v2, v3, v4, v5, v6);
}

void __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke_412_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "FamilyChecklistSPI CloudKit error modifying record to add participants to shared grocery list %@", v2, v3, v4, v5, v6);
}

void __75__REMStore_FamilyChecklist__addParticipantsToSharedGroceryList_completion___block_invoke_420_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "FamilyChecklistSPI error syncing shared grocery list participants %@", v2, v3, v4, v5, v6);
}

void __67__REMStore_TrialClient__requestDownloadGroceryModelAssetsFromTrial__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "XPC error while request downloading grocery model assets from trial {error: %{public}@}", v2, v3, v4, v5, v6);
}

void __72__REMStore_EventKitCompatibility__MCIsManagedAccountWithObjectID_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "XPC error while trying to perform MCIsManagedAccountWithObjectID {error: %@, account: %@}");
}

void __72__REMStore_EventKitCompatibility__MCIsManagedAccountWithObjectID_error___block_invoke_492_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "Store perform MCIsManagedAccountWithObjectID failed {error: %@, account: %@}");
}

void __90__REMStore_AccountManagement_PrivateSPIs__triggerSyncForDataAccessAccountsWithAccountIDs___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "XPC error while syncing {error: %{public}@}", v2, v3, v4, v5, v6);
}

void __73__REMStore_AccountManagement_Internal__updateAccountsAndSync_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "Error updating account. Not Triggering sync {error: %@}", v2, v3, v4, v5, v6);
}

void __73__REMStore_AccountManagement_Internal__updateAccountsAndSync_completion___block_invoke_2_528_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "XPC error while updating accounts {error: %@}", v2, v3, v4, v5, v6);
}

void __88__REMStore_AccountManagement_Internal__updateAccountWithAccountID_restartDA_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "XPC error while updating account {error: %@, accountID: %@}");
}

void __77__REMStore_AccountManagement_Internal__removeOrphanedAccountsWithCompletion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "XPC error while removing orphaned accounts {error: %@}", v2, v3, v4, v5, v6);
}

void __145__REMStore_AccountManagement_Internal___triggerSyncWithReason_skipDataAccessSync_forcingCloudKitReload_discretionary_bypassThrottler_completion___block_invoke_6_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "XPC error while syncing {error: %@}", v2, v3, v4, v5, v6);
}

void __108__REMStore_AccountManagement_Internal__requestToMergeLocalDataIntoSyncDataWithAccountIdentifier_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "XPC error while requesting to initiate merge local data to sync data {accountIdentifier: %@, error: %@}");
}

void __96__REMStore_AccountManagement_Internal__requestToDeleteSyncDataWithAccountIdentifier_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "XPC error while requesting to delete sync data {accountIdentifier: %@, error: %@}");
}

void __79__REMStore_AccountManagement_Internal__requestToDeleteLocalDataWithCompletion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "XPC error while requesting to delete local data {error: %@}", v2, v3, v4, v5, v6);
}

void __77__REMStore_Sharing__addCKShareObserverIfNeededForAccountID_queue_completion___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "XPC error while adding share observer {error: %@, accountID: %{public}@}");
}

void __105__REMStore_ClientConnections__requestToUpdateClientConnectionsAsynchronously_shouldKeepAlive_completion___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_26(), "numberWithBool:");
  uint64_t v4 = [*(id *)(v1 + 3792) numberWithBool:*(unsigned __int8 *)(a1 + 41)];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8(&dword_1B9AA2000, v5, v6, "XPC error while requesting to update client connections {isAsynchronous: %@, shouldKeepAlive: %@, error: %@}", v7, v8, v9, v10, 2u);
}

void __76__REMStore_PhantomObjectRepairing__repairPhantomObjectsWithObjectIDs_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, v0, v1, "XPC error while getting store performer for repairPhantomObjectsWithObjectIDs {error: %@, objectIDs: %{public}@}");
}

void __76__REMStore_PhantomObjectRepairing__repairPhantomObjectsWithObjectIDs_error___block_invoke_641_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_0(&dword_1B9AA2000, a2, a3, "repairPhantomObjectsWithObjectIDs failed {error: %@, phantomObjectIDs: %{public}@}", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __67__REMStore_UnitTest__test_revertImageAttachmentsToUnDeduped_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "xpc error while using debug performer {error: %@}", v2, v3, v4, v5, v6);
}

@end