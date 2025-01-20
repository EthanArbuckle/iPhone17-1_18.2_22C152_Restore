@interface PDCloudStoreContainer
- (BOOL)_queue_canInitializeContainer;
- (BOOL)_queue_canInvalidateContainer;
- (BOOL)_queue_ensureContainerState:(unint64_t)a3;
- (BOOL)accountChangedNotificationReceived;
- (BOOL)canCoalesceRequest:(id)a3 withNewRequest:(id)a4;
- (BOOL)cloudContainerSetupInProgress;
- (BOOL)isCloudStoreSetupAssistantComplete;
- (BOOL)isSetup;
- (BOOL)shouldContinueWithRequest:(id)a3;
- (BOOL)shouldForwardErrorsToRequestCompletionHandlers;
- (BOOL)supportsContainerChangeEventReports;
- (NSError)operationError;
- (NSString)description;
- (OS_dispatch_queue)workQueue;
- (PDCloudStoreContainer)initWithConfiguration:(id)a3;
- (PDCloudStoreContainer)initWithDataSource:(id)a3 notificationStreamManager:(id)a4;
- (PDCloudStoreContainerDelegate)delegate;
- (PDCloudStoreContainerManager)containerManager;
- (PDCloudStoreDataSource)dataSource;
- (double)_queue_initializationTimeout;
- (id)_cannotPerformActionErrorWithFailureReason:(id)a3;
- (id)errorWithCode:(int64_t)a3 description:(id)a4;
- (id)filterCloudStoreZones:(id)a3 action:(unint64_t)a4 inContainerDatabase:(id)a5;
- (id)identifierFromRecord:(id)a3;
- (id)recordTypeFromRecordName:(id)a3;
- (id)recordTypesForCloudStoreItemType:(unint64_t)a3;
- (id)reportContainerChangeEvent:(id)a3;
- (id)reportContainerChangeIntervalBeginEventWithType:(unint64_t)a3 stateName:(id)a4 objectNames:(id)a5 changeToken:(id)a6 operationGroupName:(id)a7 operationGroupNameSuffix:(id)a8;
- (id)reportContainerChangeIntervalBeginEventWithType:(unint64_t)a3 stateName:(id)a4 objectNames:(id)a5 operationGroupName:(id)a6 operationGroupNameSuffix:(id)a7;
- (id)setupAssistantNotCompleteError;
- (unint64_t)_setupAssistantState;
- (unint64_t)itemTypeFromRecord:(id)a3;
- (unint64_t)nextExpectedState;
- (void)_cloudStoreContainerCommonInit;
- (void)_deleteAllSubscriptionsWithOperationGroupNameSuffix:(id)a3 completion:(id)a4;
- (void)_deleteAllZonesWithOperationGroupNameSuffix:(id)a3 completion:(id)a4;
- (void)_deleteSubscriptions:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5;
- (void)_deleteZones:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5;
- (void)_deleteZonesAndSubscriptionsWithResetRequest:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5;
- (void)_executeNextResetRequestIfPossible;
- (void)_fetchAllSubscriptionsIfNeccessaryWithOperationGroupNameSuffix:(id)a3 completion:(id)a4;
- (void)_fetchAndSaveRecordZonesWithContainerDatabaseIdentifiers:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5;
- (void)_fetchParticipantWithRecipientHandle:(id)a3 cloudStoreZone:(id)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8;
- (void)_fetchRecordZonesIfNeccessaryWithOperationGroupNameSuffix:(id)a3 completion:(id)a4;
- (void)_fetchRecordsWithQuery:(id)a3 cursor:(id)a4 batchLimit:(int64_t)a5 operationGroupName:(id)a6 operationGroupNameSuffix:(id)a7 qualityOfService:(int64_t)a8 zone:(id)a9 containerDatabase:(id)a10 batchHandler:(id)a11 completion:(id)a12;
- (void)_forceFetchRecordZonesForContainerDatabase:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5;
- (void)_keychainSyncFinishedFired;
- (void)_markEndCloudStoreDatabaseSetupWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_queue_addOperation:(id)a3 forDatabase:(id)a4;
- (void)_queue_aliasesForRecipientHandle:(id)a3 zoneName:(id)a4 completion:(id)a5;
- (void)_queue_attachToContainer;
- (void)_queue_cancelAllOperations;
- (void)_queue_cancelCloudStoreInitializationTimer;
- (void)_queue_cancelOperationsForDatabse:(id)a3 underlyingError:(id)a4;
- (void)_queue_cloudStoreAccountInformationWithCompletion:(id)a3;
- (void)_queue_cloudStoreInitializationTimerFired;
- (void)_queue_cloudStoreZoneInvitationDataForInvitation:(id)a3 toRecipient:(id)a4 completion:(id)a5;
- (void)_queue_createSubscriptionsByDatabaseIdentifier:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5;
- (void)_queue_createZoneAndSubscriptionsByDatabaseIdentifier:(id)a3 groupSuffix:(id)a4 completion:(id)a5;
- (void)_queue_createZonesByDatabaseIdentifier:(id)a3 shouldFetchData:(BOOL)a4 operationGroupNameSuffix:(id)a5 completion:(id)a6;
- (void)_queue_detachFromContainerWithState:(unint64_t)a3;
- (void)_queue_executeNextFecthRequestIfPossible;
- (void)_queue_fetchAllRecordsUsingConfiguration:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 batchHandler:(id)a7 completion:(id)a8;
- (void)_queue_fetchInitialRecordsUsingConfiguration:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 batchHandler:(id)a7 completion:(id)a8;
- (void)_queue_lockShareCreationForRecipientHandle:(id)a3 cloudStoreZone:(id)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8;
- (void)_queue_processOperationError:(id)a3 forZoneID:(id)a4 containerDatabaseIdentifier:(id)a5 operationGroupName:(id)a6 operationGroupNameSuffix:(id)a7 completion:(id)a8;
- (void)_queue_processResultWithError:(id)a3 nextExpectedState:(unint64_t)a4 operationGroupNameSuffix:(id)a5 retryCount:(unint64_t)a6 shouldRetry:(BOOL)a7 completion:(id)a8;
- (void)_queue_retryContainerStateWithError:(id)a3 operationGroupNameSuffix:(id)a4 retryCount:(unint64_t)a5 completion:(id)a6;
- (void)_queue_setContainerState:(unint64_t)a3 operationGroupNameSuffix:(id)a4 retryCount:(unint64_t)a5 completion:(id)a6;
- (void)_queue_startCloudStoreInitializationTimer;
- (void)_recordZonesWithOperationGroupNameSuffix:(id)a3 containerDatabaseIdentifiers:(id)a4 completion:(id)a5;
- (void)_setContainerState:(unint64_t)a3 operationGroupNameSuffix:(id)a4 retryCount:(unint64_t)a5 completion:(id)a6;
- (void)_setupManagerWithConfiguration:(id)a3;
- (void)_shareMetadataWithInvitationTokensByShareURL:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7;
- (void)_subscriptionOperationWithSubscriptionsToSaveByDatabaseIdentifier:(id)a3 subscriptionIDsToDeleteByDatabase:(id)a4 operationGroupNameSuffix:(id)a5 completion:(id)a6;
- (void)_updateFetchNewestChangesFirstFlagForConfiguration:(id)a3 request:(id)a4;
- (void)_updateSetupAssistantStateFrom:(unint64_t)a3 toState:(unint64_t)a4;
- (void)_updateSetupAssistantStateIfNecessary;
- (void)_updateShare:(id)a3 cloudStoreZone:(id)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8;
- (void)_zoneOperationWithZonesToSaveByDatabaseIdentifier:(id)a3 recordZoneIDsToDeleteByDatabaseIdentifier:(id)a4 operationGroupNameSuffix:(id)a5 completion:(id)a6;
- (void)_zoneWideShareForCloudStoreZone:(id)a3 createIfNotExists:(BOOL)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8;
- (void)acceptShareInvitation:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7;
- (void)allItemsOfItemType:(unint64_t)a3 storeLocally:(BOOL)a4 completion:(id)a5;
- (void)applePayContainerItemsFromDate:(id)a3 toDate:(id)a4 completion:(id)a5;
- (void)canInitializeContainerWithCompletion:(id)a3;
- (void)cloudStoreAccountChanged:(id)a3;
- (void)cloudStoreAccountInformationWithCompletion:(id)a3;
- (void)cloudStoreRecordArrayWithConfiguration:(id)a3 completion:(id)a4;
- (void)cloudStoreZoneInvitationDataForInvitation:(id)a3 toRecipient:(id)a4 completion:(id)a5;
- (void)createShareInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 permission:(int64_t)a5 operationGroupName:(id)a6 operationGroupNameSuffix:(id)a7 qualityOfService:(int64_t)a8 completion:(id)a9;
- (void)createZone:(id)a3 completion:(id)a4;
- (void)declineInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8;
- (void)deleteZone:(id)a3 completion:(id)a4;
- (void)didUpdateSetupAssistantStateFrom:(unint64_t)a3 toState:(unint64_t)a4;
- (void)ensureZoneShareIntegrity;
- (void)executeRecordsRequest:(id)a3 completion:(id)a4;
- (void)executeResetRequest:(id)a3 completion:(id)a4;
- (void)fetchItemsWithQueryConfigurations:(id)a3 returnRecords:(BOOL)a4 storeRecords:(BOOL)a5 groupName:(id)a6 groupSuffix:(id)a7 completion:(id)a8;
- (void)fetchRecordsInAcceptedZoneShare:(id)a3 databaseIdentifier:(id)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8;
- (void)fetchRecordsWithQuery:(id)a3 batchLimit:(int64_t)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 zone:(id)a8 containerDatabase:(id)a9 batchHandler:(id)a10 completion:(id)a11;
- (void)fetchRecordsWithRecordIDsByDatabaseIdentifier:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7;
- (void)initialCloudDatabaseSetupWithOperationGroupNameSuffix:(id)a3 completion:(id)a4;
- (void)invalidateCloudStoreIfPossibleWithOperationGroupNameSuffix:(id)a3 clearCache:(BOOL)a4;
- (void)invalidateCloudStoreWithOperationGroupNameSuffix:(id)a3 clearCache:(BOOL)a4 completion:(id)a5;
- (void)invalidateCloudStoreWithOperationGroupNameSuffix:(id)a3 clearCache:(BOOL)a4 resultOfZoneRecreation:(BOOL)a5 completion:(id)a6;
- (void)invalidateCloudStoreWithOperationGroupNameSuffix:(id)a3 clearCache:(BOOL)a4 resultOfZoneRecreation:(BOOL)a5 zoneNames:(id)a6 completion:(id)a7;
- (void)itemOfItemType:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)itemOfItemTypeFromAllZones:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)modifyRecordsOperationWithRecordsToSaveByDatabaseIdentifier:(id)a3 recordIDsToDeleteByDatabaseIdentifier:(id)a4 recordModificationOperationConfiguration:(id)a5 emitErrorIfConflictDetected:(BOOL)a6 isModifyingShare:(BOOL)a7 operationGroupName:(id)a8 operationGroupNameSuffix:(id)a9 qualityOfService:(int64_t)a10 completion:(id)a11;
- (void)processFetchedCloudStoreDataWithModifiedRecordsByDatabaseIdentifier:(id)a3 deletedRecordsByDatabaseIdentifier:(id)a4 carriedOverRecordsByDatabaseIdentifier:(id)a5 conflictingRecordsByDatabaseIdentifier:(id)a6 request:(id)a7 completion:(id)a8;
- (void)removeAllItems:(unint64_t)a3 inZoneName:(id)a4 storeLocally:(BOOL)a5 completion:(id)a6;
- (void)removeItems:(id)a3 groupName:(id)a4 groupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7;
- (void)removeRecordWithRecordName:(id)a3 zoneName:(id)a4 groupName:(id)a5 groupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8;
- (void)removedFromCloudStoreZoneInvitation:(id)a3 fromHandle:(id)a4;
- (void)reportContainerChangeIntervalEndEventWithBeginUniqueIdentifier:(id)a3 error:(id)a4;
- (void)reportContainerChangeSignpostEventType:(unint64_t)a3 stateName:(id)a4 objectNames:(id)a5 changeToken:(id)a6 error:(id)a7 operationGroupName:(id)a8 operationGroupNameSuffix:(id)a9;
- (void)resetContainerWithAdditionalZoneIDsByDatabaseIdentifiers:(id)a3 includedCachedZoneForDatabaseIdentifiers:(id)a4 completion:(id)a5;
- (void)resetContainerWithZoneNames:(id)a3 completion:(id)a4;
- (void)setAccountChangedNotificationReceived:(BOOL)a3;
- (void)setCloudContainerSetupInProgress:(BOOL)a3;
- (void)setContainerManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsSetup:(BOOL)a3;
- (void)setNextExpectedState:(unint64_t)a3;
- (void)setOperationError:(id)a3;
- (void)shareForZoneName:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7;
- (void)updateCloudStoreWithLocalItemsWithConfigurations:(id)a3 groupName:(id)a4 groupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7;
@end

@implementation PDCloudStoreContainer

- (void)_setupManagerWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)CKContainerID);
  v6 = [v4 containerIdentifier];
  id v15 = objc_msgSend(v5, "initWithContainerIdentifier:environment:", v6, objc_msgSend(v4, "environment"));

  id v7 = objc_alloc_init((Class)CKContainerOptions);
  v8 = [v4 applicationBundleIdentifier];
  [v7 setApplicationBundleIdentifierOverride:v8];

  id v9 = [objc_alloc((Class)CKContainer) initWithContainerID:v15 options:v7];
  v10 = [PDCloudStoreContainerManager alloc];
  v11 = [v4 validScopes];
  v12 = [v4 dataSource];
  v13 = [v4 containerDatabaseDataSource];

  v14 = [(PDCloudStoreContainerManager *)v10 initWithContainer:v9 validScopes:v11 cacheDataSource:v12 databaseContainerDataSource:v13];
  [(PDCloudStoreContainer *)self setContainerManager:v14];
}

- (PDCloudStoreContainer)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PDCloudStoreContainer;
  id v5 = [(PDCloudStoreContainer *)&v8 init];
  if (v5)
  {
    v6 = [v4 dataSource];
    objc_storeWeak((id *)&v5->_dataSource, v6);

    [(PDCloudStoreContainer *)v5 _cloudStoreContainerCommonInit];
    [(PDCloudStoreContainer *)v5 _setupManagerWithConfiguration:v4];
  }

  return v5;
}

- (PDCloudStoreContainer)initWithDataSource:(id)a3 notificationStreamManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PDCloudStoreContainer;
  objc_super v8 = [(PDCloudStoreContainer *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeStrong((id *)&v9->_notificationStreamManager, a4);
    [(PDCloudStoreContainer *)v9 _cloudStoreContainerCommonInit];
  }

  return v9;
}

- (void)_cloudStoreContainerCommonInit
{
  attr = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = (OS_dispatch_queue *)dispatch_queue_create("PDCloudStoreContainer", attr);
  workQueue = self->_workQueue;
  self->_workQueue = v3;

  id v5 = (OS_dispatch_queue *)dispatch_queue_create("PDCloudStoreContainer_BackgroundQueue", attr);
  backgroundQueue = self->_backgroundQueue;
  self->_backgroundQueue = v5;

  id v7 = (OS_dispatch_group *)dispatch_group_create();
  batchUpdateGroup = self->_batchUpdateGroup;
  self->_batchUpdateGroup = v7;

  id v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  initializationCompletionHandlers = self->_initializationCompletionHandlers;
  self->_initializationCompletionHandlers = v9;

  objc_super v11 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
  fetchRequests = self->_fetchRequests;
  self->_fetchRequests = v11;

  v13 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
  resetRequests = self->_resetRequests;
  self->_resetRequests = v13;

  self->_lock._os_unfair_lock_opaque = 0;
  if (self->_notificationStreamManager)
  {
    id v15 = [[PDSetupAssistantCompleteMonitor alloc] initWithNotificationStreamManager:self->_notificationStreamManager];
    setupAssistantMonitor = self->_setupAssistantMonitor;
    self->_setupAssistantMonitor = v15;
  }
  v17 = +[NSNotificationCenter defaultCenter];
  [v17 addObserver:self selector:"cloudStoreAccountChanged:" name:CKAccountChangedNotification object:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained cloudStoreContainer:self didChangeContainerState:1];
}

- (void)initialCloudDatabaseSetupWithOperationGroupNameSuffix:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PDCloudStoreContainer *)self isSetup])
  {
    objc_super v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "The cloud store %@ is already setup.", buf, 0xCu);
    }

    if (v7)
    {
      os_unfair_lock_lock(&self->_lock);
      initializationCompletionHandlers = self->_initializationCompletionHandlers;
      id v10 = objc_retainBlock(v7);
      [(NSMutableSet *)initializationCompletionHandlers addObject:v10];

      os_unfair_lock_unlock(&self->_lock);
    }
    [(PDCloudStoreContainer *)self _markEndCloudStoreDatabaseSetupWithSuccess:1 error:0];
  }
  else
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001D3068;
    block[3] = &unk_10072E9D8;
    block[4] = self;
    id v13 = v6;
    id v14 = v7;
    dispatch_async(workQueue, block);
  }
}

- (BOOL)_queue_ensureContainerState:(unint64_t)a3
{
  unint64_t nextExpectedState = self->_nextExpectedState;
  if (nextExpectedState != a3)
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = PDCloudStoreContainerStateToString(a3);
      objc_super v8 = PDCloudStoreContainerStateToString(self->_nextExpectedState);
      int v10 = 138543618;
      objc_super v11 = v7;
      __int16 v12 = 2114;
      id v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PDCloudStoreContainer: Error: Invalid state detected. (Expected: %{public}@, Actual: %{public}@)", (uint8_t *)&v10, 0x16u);
    }
  }
  return nextExpectedState == a3;
}

- (BOOL)isSetup
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isSetup;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setIsSetup:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isSetup = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_queue_canInitializeContainer
{
  return 1;
}

- (void)canInitializeContainerWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    workQueue = self->_workQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001D3CE0;
    v7[3] = &unk_10072E598;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(workQueue, v7);
  }
}

- (BOOL)_queue_canInvalidateContainer
{
  return 0;
}

- (double)_queue_initializationTimeout
{
  return 120.0;
}

- (id)recordTypesForCloudStoreItemType:(unint64_t)a3
{
  if (a3 == 6)
  {
    CKRecordType v5 = CKRecordTypeShare;
    v3 = +[NSArray arrayWithObjects:&v5 count:1];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (unint64_t)itemTypeFromRecord:(id)a3
{
  id v4 = [a3 recordType];
  unint64_t v5 = 0;
  while (1)
  {
    id v6 = [(PDCloudStoreContainer *)self recordTypesForCloudStoreItemType:v5];
    unsigned __int8 v7 = [v6 containsObject:v4];

    if (v7) {
      break;
    }
    if (++v5 == 11)
    {
      unint64_t v5 = 0;
      break;
    }
  }

  return v5;
}

- (id)identifierFromRecord:(id)a3
{
  v3 = [a3 recordID];
  id v4 = [v3 recordName];

  return v4;
}

- (id)recordTypeFromRecordName:(id)a3
{
  v3 = (NSString *)a3;
  id v4 = CKRecordNameZoneWideShare;
  unint64_t v5 = v4;
  if (v4 == v3)
  {

    goto LABEL_7;
  }
  if (v3 && v4)
  {
    unsigned int v6 = [(NSString *)v3 isEqualToString:v4];

    if (!v6) {
      goto LABEL_9;
    }
LABEL_7:
    unsigned __int8 v7 = v5;
    goto LABEL_10;
  }

LABEL_9:
  unsigned __int8 v7 = 0;
LABEL_10:

  return v7;
}

- (id)filterCloudStoreZones:(id)a3 action:(unint64_t)a4 inContainerDatabase:(id)a5
{
  id v5 = a3;
  return v5;
}

- (void)invalidateCloudStoreIfPossibleWithOperationGroupNameSuffix:(id)a3 clearCache:(BOOL)a4
{
}

- (void)invalidateCloudStoreWithOperationGroupNameSuffix:(id)a3 clearCache:(BOOL)a4 completion:(id)a5
{
}

- (void)invalidateCloudStoreWithOperationGroupNameSuffix:(id)a3 clearCache:(BOOL)a4 resultOfZoneRecreation:(BOOL)a5 completion:(id)a6
{
}

- (void)invalidateCloudStoreWithOperationGroupNameSuffix:(id)a3 clearCache:(BOOL)a4 resultOfZoneRecreation:(BOOL)a5 zoneNames:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D409C;
  block[3] = &unk_10073E0F8;
  BOOL v24 = a4;
  BOOL v25 = a5;
  id v20 = v12;
  id v21 = v13;
  v22 = self;
  id v23 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(workQueue, block);
}

- (void)_queue_attachToContainer
{
  [(PDCloudStoreContainer *)self setIsSetup:0];
  operationError = self->_operationError;
  self->_operationError = 0;

  self->_shouldCancelAllTasks = 0;
  [(PDCloudStoreContainerManager *)self->_containerManager createContainerCacheIfNecessary];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained cloudStoreContainer:self didChangeContainerState:1];
}

- (void)_queue_detachFromContainerWithState:(unint64_t)a3
{
  [(PDCloudStoreContainer *)self setIsSetup:0];
  self->_shouldCancelAllTasks = 0;
  self->_shouldInvalidateCloudStore = 0;
  *(_WORD *)&self->_accountChangedNotificationReceived = 0;
  operationError = self->_operationError;
  self->_operationError = 0;

  lastInvalidationDate = self->_lastInvalidationDate;
  self->_lastInvalidationDate = 0;

  [(PDCloudStoreContainer *)self _queue_cancelCloudStoreInitializationTimer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained cloudStoreContainer:self didChangeContainerState:a3];
}

- (void)cloudStoreAccountInformationWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001D4B30;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)_queue_cloudStoreAccountInformationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PDCloudStoreContainerManager *)self->_containerManager container];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001D4BF0;
  v7[3] = &unk_100732EB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 accountInfoWithCompletionHandler:v7];
}

- (void)_setContainerState:(unint64_t)a3 operationGroupNameSuffix:(id)a4 retryCount:(unint64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D4EC0;
  block[3] = &unk_100732BF0;
  void block[4] = self;
  id v16 = v10;
  unint64_t v18 = a3;
  unint64_t v19 = a5;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(workQueue, block);
}

- (void)_queue_setContainerState:(unint64_t)a3 operationGroupNameSuffix:(id)a4 retryCount:(unint64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = (void (**)(id, void, NSError *))a6;
  id v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = PDCloudStoreContainerStateToString(a3);
    *(_DWORD *)buf = 138543874;
    id v57 = v13;
    __int16 v58 = 2114;
    id v59 = v10;
    __int16 v60 = 2048;
    unint64_t v61 = a5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDCloudStoreContainer: setContainerState called with state %{public}@, operationGroupNameSuffix: %{public}@, and retry count %lu", buf, 0x20u);
  }
  if ([(PDCloudStoreContainer *)self _queue_ensureContainerState:a3])
  {
    id v14 = PDCloudStoreContainerStateToUserString(a3);
    [(PDCloudStoreContainer *)self reportContainerChangeSignpostEventType:1 stateName:v14 objectNames:0 changeToken:0 error:0 operationGroupName:0 operationGroupNameSuffix:v10];

    [(PDCloudStoreContainer *)self _updateSetupAssistantStateIfNecessary];
    switch(a3)
    {
      case 1uLL:
        [(PDCloudStoreContainer *)self _queue_attachToContainer];
        self->_unint64_t nextExpectedState = 4;
        [(PDCloudStoreContainer *)self _queue_setContainerState:4 operationGroupNameSuffix:v10 retryCount:a5 completion:v11];
        break;
      case 2uLL:
        operationError = self->_operationError;
        self->_operationError = 0;
        self->_unint64_t nextExpectedState = 1;

        [(PDCloudStoreContainer *)self _queue_detachFromContainerWithState:2];
        if (v11) {
          goto LABEL_14;
        }
        break;
      case 3uLL:
        self->_unint64_t nextExpectedState = 1;
        unint64_t v19 = self->_operationError;
        [(PDCloudStoreContainer *)self _queue_detachFromContainerWithState:2];
        if (v11) {
          v11[2](v11, 0, v19);
        }

        break;
      case 4uLL:
        self->_unint64_t nextExpectedState = 5;
        [(PDCloudStoreContainer *)self _queue_setContainerState:5 operationGroupNameSuffix:v10 retryCount:a5 completion:v11];
        break;
      case 5uLL:
        self->_unint64_t nextExpectedState = 6;
        [(PDCloudStoreContainer *)self _queue_setContainerState:6 operationGroupNameSuffix:v10 retryCount:a5 completion:v11];
        break;
      case 6uLL:
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = sub_1001D5850;
        v52[3] = &unk_10073E120;
        v52[4] = self;
        id v53 = v10;
        unint64_t v55 = a5;
        v54 = v11;
        [(PDCloudStoreContainer *)self _fetchRecordZonesIfNeccessaryWithOperationGroupNameSuffix:v53 completion:v52];

        break;
      case 7uLL:
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_1001D5940;
        v48[3] = &unk_10073E120;
        v48[4] = self;
        id v49 = v10;
        unint64_t v51 = a5;
        v50 = v11;
        [(PDCloudStoreContainer *)self _fetchAllSubscriptionsIfNeccessaryWithOperationGroupNameSuffix:v49 completion:v48];

        break;
      case 8uLL:
        id v20 = [(PDCloudStoreContainerManager *)self->_containerManager zonesThatNeedToBeCreated];
        id v21 = [v20 count];
        BOOL v22 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        if (v21)
        {
          if (v22)
          {
            id v23 = [v20 count];
            BOOL v24 = [(PDCloudStoreContainerManager *)self->_containerManager containerName];
            *(_DWORD *)buf = 134349314;
            id v57 = v23;
            __int16 v58 = 2114;
            id v59 = v24;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "There are %{public}lu zones that need to be created for container %{public}@", buf, 0x16u);
          }
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472;
          v44[2] = sub_1001D5A30;
          v44[3] = &unk_10073E148;
          v44[4] = self;
          id v45 = v10;
          unint64_t v47 = a5;
          v46 = v11;
          [(PDCloudStoreContainer *)self _queue_createZonesByDatabaseIdentifier:v20 shouldFetchData:0 operationGroupNameSuffix:v45 completion:v44];
        }
        else
        {
          if (v22)
          {
            v26 = [(PDCloudStoreContainerManager *)self->_containerManager containerName];
            *(_DWORD *)buf = 138543362;
            id v57 = v26;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "There are no zones that need to be created for container %{public}@", buf, 0xCu);
          }
          [(PDCloudStoreContainer *)self _queue_processResultWithError:0 nextExpectedState:9 operationGroupNameSuffix:v10 retryCount:a5 shouldRetry:1 completion:v11];
        }

        break;
      case 9uLL:
        BOOL v25 = [(PDCloudStoreContainerManager *)self->_containerManager subscriptionsThatNeedToBeCreated];
        if ([v25 count])
        {
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_1001D5B20;
          v40[3] = &unk_10073E148;
          v40[4] = self;
          id v41 = v10;
          unint64_t v43 = a5;
          v42 = v11;
          [(PDCloudStoreContainer *)self _queue_createSubscriptionsByDatabaseIdentifier:v25 operationGroupNameSuffix:v41 completion:v40];
        }
        else
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v27 = [(PDCloudStoreContainerManager *)self->_containerManager containerName];
            *(_DWORD *)buf = 138412290;
            id v57 = v27;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "There are no subscriptions that need to be created for container %@", buf, 0xCu);
          }
          [(PDCloudStoreContainer *)self _queue_processResultWithError:0 nextExpectedState:13 operationGroupNameSuffix:v10 retryCount:a5 shouldRetry:1 completion:v11];
        }

        break;
      case 0xAuLL:
        self->_unint64_t nextExpectedState = 1;
        objc_initWeak((id *)buf, self);
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_1001D5C10;
        v36[3] = &unk_10073E170;
        objc_copyWeak(v39, (id *)buf);
        id v37 = v10;
        v39[1] = (id)a5;
        v38 = v11;
        [(PDCloudStoreContainer *)self _queue_setContainerState:1 operationGroupNameSuffix:v37 retryCount:a5 completion:v36];

        objc_destroyWeak(v39);
        objc_destroyWeak((id *)buf);
        break;
      case 0xBuLL:
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_1001D5CBC;
        v32[3] = &unk_10073E148;
        v32[4] = self;
        id v33 = v10;
        unint64_t v35 = a5;
        v34 = v11;
        [(PDCloudStoreContainer *)self _deleteAllZonesWithOperationGroupNameSuffix:v33 completion:v32];

        break;
      case 0xCuLL:
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_1001D5DAC;
        v28[3] = &unk_10073E148;
        v28[4] = self;
        id v29 = v10;
        unint64_t v31 = a5;
        v30 = v11;
        [(PDCloudStoreContainer *)self _deleteAllSubscriptionsWithOperationGroupNameSuffix:v29 completion:v28];

        break;
      case 0xDuLL:
        self->_unint64_t nextExpectedState = 14;
        [(PDCloudStoreContainer *)self _queue_setContainerState:14 operationGroupNameSuffix:v10 retryCount:a5 completion:v11];
        break;
      case 0xEuLL:
        self->_unint64_t nextExpectedState = 15;
        [(PDCloudStoreContainer *)self _queue_setContainerState:15 operationGroupNameSuffix:v10 retryCount:a5 completion:v11];
        break;
      case 0xFuLL:
        id v16 = self->_operationError;
        self->_operationError = 0;

        if (v11) {
LABEL_14:
        }
          v11[2](v11, 1, 0);
        break;
      default:
        id v17 = self->_operationError;
        self->_operationError = 0;

        if (v11) {
          v11[2](v11, 0, 0);
        }
        break;
    }
  }
  else if (v11)
  {
    id v15 = [(PDCloudStoreContainer *)self errorWithCode:-4006 description:@"Invalid cloud store state"];
    v11[2](v11, 0, v15);
  }
}

- (void)processFetchedCloudStoreDataWithModifiedRecordsByDatabaseIdentifier:(id)a3 deletedRecordsByDatabaseIdentifier:(id)a4 carriedOverRecordsByDatabaseIdentifier:(id)a5 conflictingRecordsByDatabaseIdentifier:(id)a6 request:(id)a7 completion:(id)a8
{
  if (a8) {
    (*((void (**)(id, void, void, void))a8 + 2))(a8, 0, 0, 0);
  }
}

- (void)_queue_processResultWithError:(id)a3 nextExpectedState:(unint64_t)a4 operationGroupNameSuffix:(id)a5 retryCount:(unint64_t)a6 shouldRetry:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v15 = a3;
  id v16 = a5;
  id v17 = a8;
  if (v15) {
    [(PDCloudStoreContainer *)self reportContainerChangeSignpostEventType:3 stateName:0 objectNames:0 changeToken:0 error:v15 operationGroupName:0 operationGroupNameSuffix:v16];
  }
  id v18 = [objc_alloc((Class)PKCloudStoreError) initWithError:v15];
  if ([v18 isUnrecoverableDecryptionError])
  {
    unint64_t v19 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Received an unrecoverable error. Attempting to setup again since the error has been processed.", buf, 2u);
    }

    self->_unint64_t nextExpectedState = 1;
    id v20 = self;
    unint64_t v21 = 1;
    goto LABEL_31;
  }
  if (![v18 isNetworkUnavailable])
  {
    if ([v18 isKeychainSyncingInProgress])
    {
      BOOL v22 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Received keychain sync in process. Will listen for key sync notifications and try to initalize container in the future.", buf, 2u);
      }

      id v23 = +[NSNotificationCenter defaultCenter];
      [v23 addObserver:self selector:"_keychainSyncFinishedFired" name:CKIdentityUpdateNotification object:0];
    }
    else if ([v18 isInitializationTimeOutError])
    {
      BOOL v24 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v18;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Received an initialization time out error %@", buf, 0xCu);
      }

      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Detaching from the cloud store.", buf, 2u);
      }
    }
    else
    {
      if ([v18 isZoneNotFoundError])
      {
        BOOL v25 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v29 = v18;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Received an zone not found. Trying to recreate it now. %@", buf, 0xCu);
        }

        [(PDCloudStoreContainerManager *)self->_containerManager clearCacheInContainer];
        [(PDCloudStoreContainerManager *)self->_containerManager createContainerCacheIfNecessary];
        self->_unint64_t nextExpectedState = 8;
        id v20 = self;
        unint64_t v21 = 8;
        goto LABEL_31;
      }
      if (!v18)
      {
        if (!v15 || (self->_nextExpectedState & 0xFFFFFFFFFFFFFFFELL) != 8)
        {
          self->_unint64_t nextExpectedState = a4;
          id v20 = self;
          unint64_t v21 = a4;
          goto LABEL_31;
        }
        v27 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v29 = v15;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Detaching cloud store because zones or subscriptions were not created %{public}@", buf, 0xCu);
        }

LABEL_30:
        self->_unint64_t nextExpectedState = 3;
        objc_storeStrong((id *)&self->_operationError, a3);
        id v20 = self;
        unint64_t v21 = 3;
LABEL_31:
        [(PDCloudStoreContainer *)v20 _queue_setContainerState:v21 operationGroupNameSuffix:v16 retryCount:a6 completion:v17];
        goto LABEL_32;
      }
      v26 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v18;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Detaching cloud store with unknown error %@", buf, 0xCu);
      }

      [v18 isPCSError];
    }
LABEL_29:
    PKAnalyticsSendEvent();
    goto LABEL_30;
  }
  if (!v9) {
    goto LABEL_29;
  }
  [(PDCloudStoreContainer *)self _queue_retryContainerStateWithError:v18 operationGroupNameSuffix:v16 retryCount:a6 completion:v17];
LABEL_32:
}

- (void)_updateSetupAssistantStateIfNecessary
{
  if (self->_setupAssistantMonitor)
  {
    if (![(PDCloudStoreContainer *)self _setupAssistantState])
    {
      [(PDCloudStoreContainer *)self _updateSetupAssistantStateFrom:0 toState:2];
      setupAssistantMonitor = self->_setupAssistantMonitor;
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      v4[2] = sub_1001D640C;
      v4[3] = &unk_10072E1E8;
      v4[4] = self;
      [(PDSetupAssistantCompleteMonitor *)setupAssistantMonitor waitForSetupAssistantCompletion:v4];
    }
  }
  else
  {
    [(PDCloudStoreContainer *)self _updateSetupAssistantStateFrom:0 toState:1];
  }
}

- (void)_updateSetupAssistantStateFrom:(unint64_t)a3 toState:(unint64_t)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_setupAssistantState = a4;
  os_unfair_lock_unlock(p_lock);
  [(PDCloudStoreContainer *)self didUpdateSetupAssistantStateFrom:a3 toState:a4];
}

- (unint64_t)_setupAssistantState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t setupAssistantState = self->_setupAssistantState;
  os_unfair_lock_unlock(p_lock);
  return setupAssistantState;
}

- (BOOL)isCloudStoreSetupAssistantComplete
{
  return 1;
}

- (void)didUpdateSetupAssistantStateFrom:(unint64_t)a3 toState:(unint64_t)a4
{
  if (a4 != 1)
  {
    v23[0] = @"fromState";
    unint64_t v5 = a3 - 1;
    id v6 = @"unknown";
    CFStringRef v7 = @"unknown";
    if (a3 - 1 <= 2) {
      CFStringRef v7 = off_10073FC70[v5];
    }
    if (a4 == 2) {
      id v6 = @"waitingForCompletion";
    }
    if (a4 == 3) {
      id v6 = @"complete";
    }
    v24[0] = v7;
    v24[1] = v6;
    v23[1] = @"toState";
    v23[2] = @"container";
    id v8 = v6;
    uint64_t v9 = [(id)objc_opt_class() description];
    id v10 = (void *)v9;
    CFStringRef v11 = &stru_10075AAD8;
    if (v9) {
      CFStringRef v11 = (const __CFString *)v9;
    }
    v24[2] = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];

    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (v5 > 2) {
        CFStringRef v14 = @"unknown";
      }
      else {
        CFStringRef v14 = off_10073FC70[v5];
      }
      id v15 = [(id)objc_opt_class() description];
      *(_DWORD *)buf = 138543874;
      CFStringRef v18 = v14;
      __int16 v19 = 2114;
      id v20 = v8;
      __int16 v21 = 2112;
      BOOL v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Did update PDCloudStoreContainerSetupAssistantState from %{public}@ to %{public}@ for container %@", buf, 0x20u);
    }
    id v16 = [v12 description];
    [(PDCloudStoreContainer *)self reportContainerChangeSignpostEventType:54 stateName:v16 objectNames:0 changeToken:0 error:0 operationGroupName:0 operationGroupNameSuffix:0];
  }
}

- (void)cloudStoreAccountChanged:(id)a3
{
  id v4 = a3;
  unint64_t v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received CKAccountChangedNotification.", buf, 2u);
  }

  workQueue = self->_workQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001D6904;
  v8[3] = &unk_10072E198;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(workQueue, v8);
}

- (void)_keychainSyncFinishedFired
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D69E4;
  block[3] = &unk_10072E1E8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_queue_createZoneAndSubscriptionsByDatabaseIdentifier:(id)a3 groupSuffix:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CFStringRef v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received call to create zones and subcriptions: %@", buf, 0xCu);
  }

  if ([v8 count])
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001D6F60;
    v12[3] = &unk_10073E1E8;
    v12[4] = self;
    id v13 = v8;
    id v15 = v10;
    id v14 = v9;
    [(PDCloudStoreContainer *)self _queue_createZonesByDatabaseIdentifier:v13 shouldFetchData:0 operationGroupNameSuffix:v14 completion:v12];
  }
  else if (v10)
  {
    (*((void (**)(id, uint64_t, void))v10 + 2))(v10, 1, 0);
  }
}

- (void)updateCloudStoreWithLocalItemsWithConfigurations:(id)a3 groupName:(id)a4 groupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  workQueue = self->_workQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001D74E0;
  v21[3] = &unk_10073E288;
  v21[4] = self;
  id v22 = v12;
  id v25 = v15;
  int64_t v26 = a6;
  id v23 = v13;
  id v24 = v14;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  id v20 = v15;
  dispatch_async(workQueue, v21);
}

- (void)_queue_createZonesByDatabaseIdentifier:(id)a3 shouldFetchData:(BOOL)a4 operationGroupNameSuffix:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v10 count];
  id v14 = PKLogFacilityTypeGetObject();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      CFStringRef v16 = @"NO";
      if (v8) {
        CFStringRef v16 = @"YES";
      }
      *(_DWORD *)buf = 138543618;
      id v22 = v10;
      __int16 v23 = 2114;
      CFStringRef v24 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Creating record zones %{public}@. Should fetch data %{public}@.", buf, 0x16u);
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001D85D4;
    v17[3] = &unk_10073E2B0;
    v17[4] = self;
    id v18 = v10;
    BOOL v20 = v8;
    id v19 = v12;
    [(PDCloudStoreContainer *)self _zoneOperationWithZonesToSaveByDatabaseIdentifier:v18 recordZoneIDsToDeleteByDatabaseIdentifier:0 operationGroupNameSuffix:v11 completion:v17];
  }
  else
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No zones to save.", buf, 2u);
    }

    if (v12) {
      (*((void (**)(id, id, void))v12 + 2))(v12, v10, 0);
    }
  }
}

- (void)_queue_createSubscriptionsByDatabaseIdentifier:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 count];
  id v12 = PKLogFacilityTypeGetObject();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Creating subscriptions %@", buf, 0xCu);
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001D8D24;
    v14[3] = &unk_10073E2D8;
    v14[4] = self;
    id v15 = v10;
    [(PDCloudStoreContainer *)self _subscriptionOperationWithSubscriptionsToSaveByDatabaseIdentifier:v8 subscriptionIDsToDeleteByDatabase:0 operationGroupNameSuffix:v9 completion:v14];
  }
  else
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No subscriptions to save.", buf, 2u);
    }

    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
}

- (void)executeRecordsRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Records request incoming %@", buf, 0xCu);
  }

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D90DC;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(workQueue, block);
}

- (void)_queue_executeNextFecthRequestIfPossible
{
  if (!self->_currentRequest)
  {
    p_fetchRequests = &self->_fetchRequests;
    v3 = [(NSMutableOrderedSet *)self->_fetchRequests firstObject];
    currentRequest = self->_currentRequest;
    self->_currentRequest = v3;

    [(NSMutableOrderedSet *)*p_fetchRequests removeObject:self->_currentRequest];
    unint64_t v5 = self->_currentRequest;
    if (v5)
    {
      id v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Records request starting %@", (uint8_t *)&buf, 0xCu);
      }

      v100 = [(PDCloudStoreRecordsRequest *)self->_currentRequest groupName];
      v99 = [(PDCloudStoreRecordsRequest *)self->_currentRequest groupNameSuffix];
      int64_t v106 = [(PDCloudStoreRecordsRequest *)self->_currentRequest qualityOfService];
      id v7 = PDCloudStoreRecordsRequestTypeToString([(PDCloudStoreRecordsRequest *)self->_currentRequest requestType]);
      id v8 = [(PDCloudStoreContainer *)self reportContainerChangeIntervalBeginEventWithType:13 stateName:v7 objectNames:0 operationGroupName:v100 operationGroupNameSuffix:v99];

      v177[0] = _NSConcreteStackBlock;
      v177[1] = 3221225472;
      v177[2] = sub_1001DA854;
      v177[3] = &unk_10073E328;
      v177[4] = self;
      id v97 = v8;
      id v178 = v97;
      v98 = objc_retainBlock(v177);
      [(PDCloudStoreContainer *)self _updateSetupAssistantStateIfNecessary];
      switch([(PDCloudStoreRecordsRequest *)self->_currentRequest requestType])
      {
        case 0uLL:
          if ([(PDCloudStoreContainer *)self isCloudStoreSetupAssistantComplete])
          {
            id v33 = objc_alloc_init((Class)PKCloudRecordArray);
            id v34 = objc_alloc_init((Class)NSMutableDictionary);
            unint64_t v35 = [(PDCloudStoreRecordsRequest *)self->_currentRequest cloudStoreZone];
            v36 = [(PDCloudStoreRecordsRequest *)self->_currentRequest containerDatabase];
            if (v35)
            {
              uint64_t v37 = [(PDCloudStoreContainerManager *)self->_containerManager databaseForCloudStoreZone:v35];

              v36 = (void *)v37;
            }
            v38 = objc_alloc_init(PDCloudStoreTokenRecordFetchConfiguration);
            [(PDCloudStoreTokenRecordFetchConfiguration *)v38 setShouldSaveToken:[(PDCloudStoreRecordsRequest *)self->_currentRequest shouldSaveToken]];
            [(PDCloudStoreTokenRecordFetchConfiguration *)v38 setUseStoredChangeToken:[(PDCloudStoreRecordsRequest *)self->_currentRequest useLastChangeToken]];
            v39 = [[PDCloudStoreTokenRecordFetchCloudStoreZoneAndChangeToken alloc] initWithCloudStoreZone:v35];
            v40 = +[NSSet setWithObject:v39];
            [(PDCloudStoreTokenRecordFetchConfiguration *)v38 setCloudStoreZonesAndChangeTokens:v40];

            [(PDCloudStoreTokenRecordFetchConfiguration *)v38 setContainerDatabase:v36];
            id v41 = [(PDCloudStoreRecordsRequest *)self->_currentRequest ignoreRecordsBeforeDate];
            [(PDCloudStoreTokenRecordFetchConfiguration *)v38 setIgnoreRecordsBeforeDate:v41];

            v42 = [(PDCloudStoreRecordsRequest *)self->_currentRequest ignoreRecordsAfterDate];
            [(PDCloudStoreTokenRecordFetchConfiguration *)v38 setIgnoreRecordsAfterDate:v42];

            [(PDCloudStoreTokenRecordFetchConfiguration *)v38 setIgnoreChangesMadeByThisDevice:[(PDCloudStoreRecordsRequest *)self->_currentRequest ignoreChangesMadeByThisDevice]];
            *(void *)&long long buf = 0;
            *((void *)&buf + 1) = &buf;
            uint64_t v182 = 0x3032000000;
            v183 = sub_1000209BC;
            v184 = sub_100020FD0;
            id v185 = 0;
            v173[0] = _NSConcreteStackBlock;
            v173[1] = 3221225472;
            v173[2] = sub_1001DA994;
            v173[3] = &unk_10073E378;
            v173[4] = self;
            p_long long buf = &buf;
            id v174 = v33;
            id v175 = v34;
            v169[0] = _NSConcreteStackBlock;
            v169[1] = 3221225472;
            v169[2] = sub_1001DAD24;
            v169[3] = &unk_10073E3A0;
            v169[4] = self;
            id v43 = v174;
            id v170 = v43;
            id v44 = v175;
            id v171 = v44;
            v172 = v98;
            [(PDCloudStoreContainer *)self _queue_fetchAllRecordsUsingConfiguration:v38 operationGroupName:v100 operationGroupNameSuffix:v99 qualityOfService:v106 batchHandler:v173 completion:v169];

            _Block_object_dispose(&buf, 8);
          }
          else
          {
            if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
            {
              v85 = self->_currentRequest;
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v85;
              _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not performing request since the PDCloudStoreContainerSetupAssistantState is not complete %@", (uint8_t *)&buf, 0xCu);
            }

            v86 = [(PDCloudStoreContainer *)self setupAssistantNotCompleteError];
            ((void (*)(void *, void, void *))v98[2])(v98, 0, v86);
          }
          break;
        case 1uLL:
          id v45 = [(PDCloudStoreRecordsRequest *)self->_currentRequest cloudStoreZone];
          v46 = [(PDCloudStoreRecordsRequest *)self->_currentRequest containerDatabase];
          if (v45)
          {
            uint64_t v47 = [(PDCloudStoreContainerManager *)self->_containerManager databaseForCloudStoreZone:v45];

            v46 = (void *)v47;
          }
          v48 = objc_alloc_init(PDCloudStoreTokenRecordFetchConfiguration);
          [(PDCloudStoreTokenRecordFetchConfiguration *)v48 setShouldSaveToken:[(PDCloudStoreRecordsRequest *)self->_currentRequest shouldSaveToken]];
          [(PDCloudStoreTokenRecordFetchConfiguration *)v48 setUseStoredChangeToken:[(PDCloudStoreRecordsRequest *)self->_currentRequest useLastChangeToken]];
          id v49 = [[PDCloudStoreTokenRecordFetchCloudStoreZoneAndChangeToken alloc] initWithCloudStoreZone:v45];
          v50 = +[NSSet setWithObject:v49];
          [(PDCloudStoreTokenRecordFetchConfiguration *)v48 setCloudStoreZonesAndChangeTokens:v50];

          [(PDCloudStoreTokenRecordFetchConfiguration *)v48 setContainerDatabase:v46];
          [(PDCloudStoreTokenRecordFetchConfiguration *)v48 setBatchLimit:[(PDCloudStoreRecordsRequest *)self->_currentRequest batchLimit]];
          unint64_t v51 = [(PDCloudStoreRecordsRequest *)self->_currentRequest batchHandler];
          v52 = v51;
          if (v51)
          {
            v167[0] = _NSConcreteStackBlock;
            v167[1] = 3221225472;
            v167[2] = sub_1001DAE44;
            v167[3] = &unk_10073E3F0;
            v167[4] = self;
            id v168 = v51;
            v165[0] = _NSConcreteStackBlock;
            v165[1] = 3221225472;
            v165[2] = sub_1001DAFFC;
            v165[3] = &unk_10073D508;
            v165[4] = self;
            v166 = v98;
            [(PDCloudStoreContainer *)self _queue_fetchInitialRecordsUsingConfiguration:v48 operationGroupName:v100 operationGroupNameSuffix:v99 qualityOfService:v106 batchHandler:v167 completion:v165];
          }
          else
          {
            v88 = [(PDCloudStoreContainer *)self description];
            v89 = +[NSString stringWithFormat:@"No hander provider %@", v88];
            v90 = [(PDCloudStoreContainer *)self errorWithCode:-4004 description:v89];

            ((void (*)(void *, void, void *))v98[2])(v98, 0, v90);
          }

          break;
        case 2uLL:
        case 3uLL:
          v96 = [(PDCloudStoreRecordsRequest *)self->_currentRequest ignoreRecordsBeforeDate];
          if (v96)
          {
            id v9 = +[NSPredicate predicateWithFormat:@"creationDate > %@", v96];
            if ((id)[(PDCloudStoreRecordsRequest *)self->_currentRequest requestType] == (id)3)
            {
              uint64_t v10 = +[NSPredicate predicateWithFormat:@"modificationDate >= %@", v96];

              id v9 = (void *)v10;
            }
            containerManager = self->_containerManager;
            id v12 = [(PDCloudStoreRecordsRequest *)self->_currentRequest cloudStoreZone];
            id v13 = [(PDCloudStoreContainerManager *)containerManager databaseForCloudStoreZone:v12];

            id v14 = [(PDCloudStoreRecordsRequest *)self->_currentRequest batchHandler];
            if (v14 || ![(PDCloudStoreRecordsRequest *)self->_currentRequest returnRecords])
            {
              id v16 = 0;
              id v15 = 0;
            }
            else
            {
              id v15 = objc_alloc_init(PDCloudStoreRecordsResponse);
              id v16 = objc_alloc_init((Class)PKCloudRecordArray);
            }
            v162[0] = _NSConcreteStackBlock;
            v162[1] = 3221225472;
            v162[2] = sub_1001DB0F8;
            v162[3] = &unk_10073E418;
            id v17 = v16;
            id v163 = v17;
            id v91 = v14;
            id v164 = v91;
            id v18 = objc_retainBlock(v162);
            id v103 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
            v152[0] = _NSConcreteStackBlock;
            v152[1] = 3221225472;
            v152[2] = sub_1001DB210;
            v152[3] = &unk_10073E490;
            id v102 = v9;
            id v153 = v102;
            v154 = self;
            id v19 = v100;
            id v155 = v19;
            id v20 = v99;
            id v156 = v20;
            int64_t v161 = v106;
            id v101 = v13;
            id v157 = v101;
            v92 = v18;
            id v160 = v92;
            v95 = v15;
            v158 = v95;
            id v94 = v17;
            id v159 = v94;
            [v103 addOperation:v152];
            id v21 = objc_alloc_init((Class)NSMutableDictionary);
            v180[0] = PKCloudAccountEventRecordType;
            v180[1] = PKCloudAccountRewardsRecordType;
            v180[2] = PKCloudCreditAccountStatementRecordType;
            v180[3] = PKCloudAccountPaymentRecordType;
            v180[4] = PKCloudAccountServicingRecordType;
            v180[5] = PKCloudAccountTransferRecordType;
            v180[6] = PKCloudAccountHoldRecordType;
            +[NSArray arrayWithObjects:v180 count:7];
            long long v150 = 0u;
            long long v151 = 0u;
            long long v148 = 0u;
            long long v149 = 0u;
            id v22 = (id)objc_claimAutoreleasedReturnValue();
            id v23 = [v22 countByEnumeratingWithState:&v148 objects:v179 count:16];
            if (v23)
            {
              uint64_t v24 = *(void *)v149;
              do
              {
                for (i = 0; i != v23; i = (char *)i + 1)
                {
                  if (*(void *)v149 != v24) {
                    objc_enumerationMutation(v22);
                  }
                  uint64_t v26 = *(void *)(*((void *)&v148 + 1) + 8 * i);
                  v140[0] = _NSConcreteStackBlock;
                  v140[1] = 3221225472;
                  v140[2] = sub_1001DB608;
                  v140[3] = &unk_10073E4E0;
                  v140[4] = v26;
                  id v141 = v102;
                  v142 = self;
                  id v143 = v19;
                  id v144 = v20;
                  int64_t v147 = v106;
                  id v145 = v101;
                  id v146 = v21;
                  [v103 addOperation:v140];
                }
                id v23 = [v22 countByEnumeratingWithState:&v148 objects:v179 count:16];
              }
              while (v23);
            }

            v136[0] = _NSConcreteStackBlock;
            v136[1] = 3221225472;
            v136[2] = sub_1001DB9F0;
            v136[3] = &unk_100730C60;
            v136[4] = self;
            id v137 = v21;
            v27 = v95;
            v138 = v27;
            id v28 = v94;
            id v139 = v28;
            id v29 = v21;
            [v103 addOperation:v136];

            v30 = +[NSNull null];
            v133[0] = _NSConcreteStackBlock;
            v133[1] = 3221225472;
            v133[2] = sub_1001DBBE4;
            v133[3] = &unk_1007347D0;
            v133[4] = self;
            v135 = v98;
            v134 = v27;
            unint64_t v31 = v27;
            id v32 = [v103 evaluateWithInput:v30 completion:v133];
          }
          else
          {
            id v102 = [(PDCloudStoreContainer *)self errorWithCode:-4004 description:@"Cannot perform cloud kit request since ignoreRecordsBeforeDate is nil"];
            ((void (*)(void *, void, id))v98[2])(v98, 0, v102);
          }

          break;
        case 4uLL:
          id v53 = [(PDCloudStoreRecordsRequest *)self->_currentRequest batchHandler];
          if (v53 || ![(PDCloudStoreRecordsRequest *)self->_currentRequest returnRecords])
          {
            v54 = 0;
            id v55 = 0;
          }
          else
          {
            v54 = objc_alloc_init(PDCloudStoreRecordsResponse);
            id v55 = objc_alloc_init((Class)PKCloudRecordArray);
          }
          v69 = self->_containerManager;
          v70 = [(PDCloudStoreRecordsRequest *)self->_currentRequest cloudStoreZone];
          v105 = [(PDCloudStoreContainerManager *)v69 databaseForCloudStoreZone:v70];

          v71 = [(PDCloudStoreRecordsRequest *)self->_currentRequest ckQuery];
          int64_t v72 = [(PDCloudStoreRecordsRequest *)self->_currentRequest batchLimit];
          v73 = [(PDCloudStoreRecordsRequest *)self->_currentRequest cloudStoreZone];
          v74 = [v73 recordZone];
          v130[0] = _NSConcreteStackBlock;
          v130[1] = 3221225472;
          v130[2] = sub_1001DBCD4;
          v130[3] = &unk_10073E570;
          v130[4] = self;
          id v131 = v55;
          id v132 = v53;
          v126[0] = _NSConcreteStackBlock;
          v126[1] = 3221225472;
          v126[2] = sub_1001DC0B4;
          v126[3] = &unk_10073E3A0;
          v126[4] = self;
          v127 = v54;
          id v128 = v131;
          v129 = v98;
          id v75 = v131;
          v76 = v54;
          id v77 = v53;
          [(PDCloudStoreContainer *)self fetchRecordsWithQuery:v71 batchLimit:v72 operationGroupName:v100 operationGroupNameSuffix:v99 qualityOfService:v106 zone:v74 containerDatabase:v105 batchHandler:v130 completion:v126];

          break;
        case 5uLL:
          unint64_t v61 = [(PDCloudStoreRecordsRequest *)self->_currentRequest recordIDsByDatabaseIdentifier];
          v122[0] = _NSConcreteStackBlock;
          v122[1] = 3221225472;
          v122[2] = sub_1001DC7EC;
          v122[3] = &unk_10073E650;
          v122[4] = self;
          v123 = v98;
          [(PDCloudStoreContainer *)self fetchRecordsWithRecordIDsByDatabaseIdentifier:v61 operationGroupName:v100 operationGroupNameSuffix:v99 qualityOfService:v106 completion:v122];

          break;
        case 6uLL:
          v62 = [(PDCloudStoreRecordsRequest *)self->_currentRequest recordsToSaveByDatabaseIdentifier];
          v63 = [(PDCloudStoreRecordsRequest *)self->_currentRequest recordIDsByDatabaseIdentifier];
          v64 = [(PDCloudStoreRecordsRequest *)self->_currentRequest recordModificationOperationConfiguration];
          BOOL v65 = [(PDCloudStoreRecordsRequest *)self->_currentRequest detectConflicts];
          BOOL v66 = [(PDCloudStoreRecordsRequest *)self->_currentRequest isModifyingShare];
          v124[0] = _NSConcreteStackBlock;
          v124[1] = 3221225472;
          v124[2] = sub_1001DC1A8;
          v124[3] = &unk_10073E5E0;
          v124[4] = self;
          v125 = v98;
          [(PDCloudStoreContainer *)self modifyRecordsOperationWithRecordsToSaveByDatabaseIdentifier:v62 recordIDsToDeleteByDatabaseIdentifier:v63 recordModificationOperationConfiguration:v64 emitErrorIfConflictDetected:v65 isModifyingShare:v66 operationGroupName:v100 operationGroupNameSuffix:v99 qualityOfService:v106 completion:v124];

          break;
        case 7uLL:
          v56 = self->_containerManager;
          id v57 = [(PDCloudStoreRecordsRequest *)self->_currentRequest cloudStoreZone];
          v104 = [(PDCloudStoreContainerManager *)v56 databaseForCloudStoreZone:v57];

          __int16 v58 = [(PDCloudStoreRecordsRequest *)self->_currentRequest batchHandler];
          if (v58 || ![(PDCloudStoreRecordsRequest *)self->_currentRequest returnRecords])
          {
            id v59 = 0;
            id v60 = 0;
          }
          else
          {
            id v59 = objc_alloc_init(PDCloudStoreRecordsResponse);
            id v60 = objc_alloc_init((Class)PKCloudRecordArray);
          }
          v78 = [(PDCloudStoreRecordsRequest *)self->_currentRequest ckQuery];
          int64_t v79 = [(PDCloudStoreRecordsRequest *)self->_currentRequest batchLimit];
          v80 = [(PDCloudStoreRecordsRequest *)self->_currentRequest cloudStoreZone];
          v81 = [v80 recordZone];
          v119[0] = _NSConcreteStackBlock;
          v119[1] = 3221225472;
          v119[2] = sub_1001DCBF4;
          v119[3] = &unk_10073E570;
          v119[4] = self;
          id v120 = v60;
          id v121 = v58;
          v114[0] = _NSConcreteStackBlock;
          v114[1] = 3221225472;
          v114[2] = sub_1001DD02C;
          v114[3] = &unk_10073E3A0;
          v115 = v59;
          id v116 = v120;
          v117 = self;
          v118 = v98;
          id v82 = v120;
          v83 = v59;
          id v84 = v58;
          [(PDCloudStoreContainer *)self fetchRecordsWithQuery:v78 batchLimit:v79 operationGroupName:v100 operationGroupNameSuffix:v99 qualityOfService:v106 zone:v81 containerDatabase:v104 batchHandler:v119 completion:v114];

          break;
        case 8uLL:
          v67 = [(PDCloudStoreRecordsRequest *)self->_currentRequest recordName];
          if (v67)
          {
            v68 = [(PDCloudStoreContainerManager *)self->_containerManager validDatabaseIdentifiers];
            v108[0] = _NSConcreteStackBlock;
            v108[1] = 3221225472;
            v108[2] = sub_1001DD120;
            v108[3] = &unk_10073E6C8;
            v108[4] = self;
            v112 = v98;
            id v109 = v67;
            id v110 = v100;
            id v111 = v99;
            int64_t v113 = v106;
            [(PDCloudStoreContainer *)self _recordZonesWithOperationGroupNameSuffix:v111 containerDatabaseIdentifiers:v68 completion:v108];
          }
          else
          {
            if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
            {
              v87 = self->_currentRequest;
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v87;
              _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No recordName defined for request %@", (uint8_t *)&buf, 0xCu);
            }

            ((void (*)(void *, void, void))v98[2])(v98, 0, 0);
          }

          break;
        default:
          break;
      }
    }
  }
}

- (BOOL)canCoalesceRequest:(id)a3 withNewRequest:(id)a4
{
  return 0;
}

- (BOOL)shouldContinueWithRequest:(id)a3
{
  return 1;
}

- (BOOL)shouldForwardErrorsToRequestCompletionHandlers
{
  return 0;
}

- (void)_queue_fetchInitialRecordsUsingConfiguration:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 batchHandler:(id)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = (void (**)(id, void *))a8;
  unint64_t nextExpectedState = self->_nextExpectedState;
  BOOL v19 = nextExpectedState > 0xF || ((1 << nextExpectedState) & 0xA100) == 0;
  id v63 = v13;
  if (v19)
  {
    v52 = PDCloudStoreContainerStateToString(nextExpectedState);
    v46 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Cannot peform %s: when the container is in state: %@", "-[PDCloudStoreContainer _queue_fetchInitialRecordsUsingConfiguration:operationGroupName:operationGroupNameSuffix:qualityOfService:batchHandler:completion:]", v52);

    id v53 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v98 = v46;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    id v20 = v63;
    if (!v17) {
      goto LABEL_41;
    }
LABEL_34:
    v50 = [(PDCloudStoreContainer *)self _cannotPerformActionErrorWithFailureReason:v46];
    v17[2](v17, v50);
LABEL_40:

    goto LABEL_41;
  }
  id v20 = v13;
  if (([v13 hasCloudStoreZones] & 1) == 0
    && ([v13 hasContainerDatabase] & 1) == 0)
  {
    id v21 = [(PDCloudStoreContainer *)self containerManager];
    id v22 = [v21 databaseForScope:2];

    [v13 setContainerDatabase:v22];
    id v23 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v98 = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "There is no cloud store zone or database defined for fetch changes request. Assuming request is for private database. %@", buf, 0xCu);
    }
  }
  if ([v13 hasCloudStoreZones]
    && ([v13 hasContainerDatabase] & 1) != 0)
  {
    id v55 = v17;
    v56 = v16;
    uint64_t v24 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138413058;
      id v98 = v13;
      __int16 v99 = 2112;
      id v100 = v14;
      __int16 v101 = 2112;
      id v102 = v15;
      __int16 v103 = 2048;
      int64_t v104 = a6;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Fetching records, using configuration: %@ group %@, suffix %@, QoS: %ld", buf, 0x2Au);
    }
    id v57 = v15;
    __int16 v58 = v14;

    unsigned __int8 v54 = [v13 shouldSaveToken];
    unsigned int v69 = [v13 useStoredChangeToken];
    id v60 = [v13 containerDatabase];
    id v59 = [v60 identifier];
    id v25 = +[NSMutableDictionary dictionary];
    id v71 = objc_alloc_init((Class)NSMutableArray);
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id obj = [v13 cloudStoreZonesAndChangeTokens];
    id v26 = [obj countByEnumeratingWithState:&v92 objects:v96 count:16];
    v62 = v25;
    if (v26)
    {
      id v27 = v26;
      uint64_t v67 = *(void *)v93;
      uint64_t v65 = PKCloudStoreOperationGroupInitialDownload;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v93 != v67) {
            objc_enumerationMutation(obj);
          }
          id v29 = [*(id *)(*((void *)&v92 + 1) + 8 * i) cloudStoreZone];
          v30 = [v29 recordZone];
          unint64_t v31 = [v30 zoneID];

          id v32 = [(PDCloudStoreContainerManager *)self->_containerManager changeTokenForCloudStoreStore:v29];
          id v33 = objc_alloc_init((Class)CKFetchRecordZoneChangesConfiguration);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            id v34 = [v32 data];
            unint64_t v35 = [v29 zoneName];
            *(_DWORD *)long long buf = 138543618;
            id v98 = v34;
            __int16 v99 = 2114;
            id v100 = v35;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Using server change token %{public}@ for zone %{public}@", buf, 0x16u);

            id v20 = v63;
            id v25 = v62;
          }

          [(PDCloudStoreRecordsRequest *)self->_currentRequest setQualityOfService:9];
          [(PDCloudStoreRecordsRequest *)self->_currentRequest setGroupName:v65];
          if (v69) {
            [v33 setPreviousServerChangeToken:v32];
          }
          objc_msgSend(v33, "setResultsLimit:", objc_msgSend(v20, "batchLimit"));
          [(PDCloudStoreContainer *)self _updateFetchNewestChangesFirstFlagForConfiguration:v33 request:self->_currentRequest];
          [v25 setObject:v33 forKey:v31];
          [v71 addObject:v31];
        }
        id v27 = [obj countByEnumeratingWithState:&v92 objects:v96 count:16];
      }
      while (v27);
    }

    if ([v71 count])
    {
      id v36 = [objc_alloc((Class)CKFetchRecordZoneChangesOperation) initWithRecordZoneIDs:v71 configurationsByRecordZoneID:v25];
      id v68 = objc_alloc_init((Class)CKOperationConfiguration);
      uint64_t v37 = [(PDCloudStoreContainerManager *)self->_containerManager container];
      [v68 setContainer:v37];

      [v68 setDiscretionaryNetworkBehavior:0];
      [v68 setAutomaticallyRetryNetworkFailures:0];
      [v36 setConfiguration:v68];
      v38 = [v60 database];
      [v36 setDatabase:v38];

      id v15 = v57;
      v39 = +[CKOperationGroup pk_operationGroupWithName:PKCloudStoreOperationGroupInitialDownload suffix:v57];
      [v36 setGroup:v39];

      [v36 setQualityOfService:9];
      [v36 setFetchAllChanges:0];
      v90[0] = _NSConcreteStackBlock;
      v90[1] = 3221225472;
      v90[2] = sub_1001DE1F4;
      v90[3] = &unk_10073E6F0;
      id v40 = objc_alloc_init((Class)NSMutableSet);
      id v91 = v40;
      [v36 setRecordWasChangedBlock:v90];
      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472;
      v77[2] = sub_1001DE3EC;
      v77[3] = &unk_10073E790;
      id v78 = v40;
      int64_t v79 = self;
      unsigned __int8 v88 = v54;
      id v41 = v59;
      id v80 = v41;
      id v66 = v60;
      id v81 = v66;
      char v89 = v69;
      id v82 = v20;
      id v14 = v58;
      id v42 = v58;
      id v83 = v42;
      id v43 = v57;
      id v84 = v43;
      int64_t v87 = a6;
      id v16 = v56;
      id v85 = v56;
      id v44 = v55;
      v86 = v44;
      id v70 = v40;
      [v36 setRecordZoneFetchCompletionBlock:v77];
      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472;
      v72[2] = sub_1001DEDD8;
      v72[3] = &unk_10073E7B8;
      v72[4] = self;
      id v45 = v41;
      v46 = v60;
      id v73 = v45;
      id v47 = v42;
      id v20 = v63;
      id v74 = v47;
      id v75 = v43;
      v48 = v44;
      id v17 = v55;
      v76 = v48;
      [v36 setFetchRecordZoneChangesCompletionBlock:v72];
      id v49 = [v66 database];
      [(PDCloudStoreContainer *)self _queue_addOperation:v36 forDatabase:v49];

      id v25 = v62;
      v50 = v59;
    }
    else
    {
      id v15 = v57;
      id v14 = v58;
      id v17 = v55;
      v46 = v60;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Error: No recordZoneIDs to fetch", buf, 2u);
      }

      id v16 = v56;
      v50 = v59;
      if (v55) {
        v55[2](v55, 0);
      }
    }

    goto LABEL_40;
  }
  v46 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Cannot peform %s: when there is no zone or database defined (%id, %id)", "-[PDCloudStoreContainer _queue_fetchInitialRecordsUsingConfiguration:operationGroupName:operationGroupNameSuffix:qualityOfService:batchHandler:completion:]", [v13 hasCloudStoreZones], objc_msgSend(v13, "hasContainerDatabase"));
  unint64_t v51 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v98 = v46;
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  if (v17) {
    goto LABEL_34;
  }
LABEL_41:
}

- (void)_queue_fetchAllRecordsUsingConfiguration:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 batchHandler:(id)a7 completion:(id)a8
{
  id v13 = a3;
  id v88 = a4;
  char v89 = (uint64_t (*)(uint64_t, uint64_t))a5;
  id v87 = a7;
  id v91 = a8;
  unint64_t nextExpectedState = self->_nextExpectedState;
  if (nextExpectedState > 0xF || ((1 << nextExpectedState) & 0xA100) == 0)
  {
    v30 = PDCloudStoreContainerStateToString(nextExpectedState);
    long long v92 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Cannot peform %s: when the container is in state: %@", "-[PDCloudStoreContainer _queue_fetchAllRecordsUsingConfiguration:operationGroupName:operationGroupNameSuffix:qualityOfService:batchHandler:completion:]", v30);

    unint64_t v31 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v92;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    if (v91) {
      goto LABEL_25;
    }
  }
  else
  {
    if (([v13 hasCloudStoreZones] & 1) == 0
      && ([v13 hasContainerDatabase] & 1) == 0)
    {
      id v16 = [(PDCloudStoreContainer *)self containerManager];
      id v17 = [v16 databaseForScope:2];

      [v13 setContainerDatabase:v17];
      id v18 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "There is no cloud store zone or database defined for fetch changes request. Assuming request is for private database. %@", buf, 0xCu);
      }
    }
    if ([v13 hasContainerDatabase])
    {
      BOOL v19 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138413058;
        *(void *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v88;
        *(_WORD *)&buf[22] = 2114;
        v165 = v89;
        LOWORD(v166) = 2048;
        *(void *)((char *)&v166 + 2) = a6;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Fetching records, using configuration: %@ group %{public}@, suffix %{public}@, QoS: %ld", buf, 0x2Au);
      }
      oslog = v19;

      unsigned __int8 v75 = [v13 shouldSaveToken];
      unsigned __int8 v80 = [v13 useStoredChangeToken];
      unsigned __int8 v20 = [v13 ignoreChangesMadeByThisDevice];
      long long v92 = [v13 containerDatabase];
      id v85 = [v92 identifier];
      id v21 = +[NSMutableDictionary dictionary];
      id v22 = objc_alloc_init((Class)NSMutableArray);
      uint64_t v154 = 0;
      id v155 = &v154;
      uint64_t v156 = 0x2020000000;
      int64_t v157 = a6;
      *(void *)long long buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v165 = sub_1000209BC;
      *(void *)&long long v166 = sub_100020FD0;
      id v74 = v88;
      *((void *)&v166 + 1) = v74;
      id v23 = objc_alloc_init((Class)NSMutableDictionary);
      v146[0] = _NSConcreteStackBlock;
      v146[1] = 3221225472;
      v146[2] = sub_1001DFF7C;
      v146[3] = &unk_10073E7E0;
      unsigned __int8 v152 = v80;
      v146[4] = self;
      long long v150 = &v154;
      long long v151 = buf;
      unsigned __int8 v153 = v20;
      id v79 = v21;
      id v147 = v79;
      id v82 = v22;
      id v148 = v82;
      id v78 = v23;
      id v149 = v78;
      uint64_t v24 = objc_retainBlock(v146);
      if ([v13 hasCloudStoreZones])
      {
        long long v140 = 0u;
        long long v141 = 0u;
        long long v138 = 0u;
        long long v139 = 0u;
        id v25 = [v13 cloudStoreZonesAndChangeTokens];
        id v26 = [v25 countByEnumeratingWithState:&v138 objects:v162 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v139;
          do
          {
            for (i = 0; i != v26; i = (char *)i + 1)
            {
              if (*(void *)v139 != v27) {
                objc_enumerationMutation(v25);
              }
              ((void (*)(void *, void))v24[2])(v24, *(void *)(*((void *)&v138 + 1) + 8 * i));
            }
            id v26 = [v25 countByEnumeratingWithState:&v138 objects:v162 count:16];
          }
          while (v26);
        }
      }
      else
      {
        id v25 = objc_alloc_init((Class)NSMutableSet);
        long long v144 = 0u;
        long long v145 = 0u;
        long long v142 = 0u;
        long long v143 = 0u;
        id v32 = [(PDCloudStoreContainerManager *)self->_containerManager cloudStoreZonesInContainerDatabase:v92];
        id v33 = [v32 countByEnumeratingWithState:&v142 objects:v163 count:16];
        if (v33)
        {
          uint64_t v34 = *(void *)v143;
          do
          {
            for (j = 0; j != v33; j = (char *)j + 1)
            {
              if (*(void *)v143 != v34) {
                objc_enumerationMutation(v32);
              }
              id v36 = [[PDCloudStoreTokenRecordFetchCloudStoreZoneAndChangeToken alloc] initWithCloudStoreZone:*(void *)(*((void *)&v142 + 1) + 8 * (void)j)];
              ((void (*)(void *, PDCloudStoreTokenRecordFetchCloudStoreZoneAndChangeToken *))v24[2])(v24, v36);
              [v25 addObject:v36];
            }
            id v33 = [v32 countByEnumeratingWithState:&v142 objects:v163 count:16];
          }
          while (v33);
        }

        id v37 = [v25 copy];
        [v13 setCloudStoreZonesAndChangeTokens:v37];

        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          currentRequest = self->_currentRequest;
          *(_DWORD *)v158 = 138412546;
          *(void *)&v158[4] = v25;
          *(_WORD *)&v158[12] = 2112;
          *(void *)&v158[14] = currentRequest;
          _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Applying cloud store zones to fetch request %@, %@", v158, 0x16u);
        }
      }
      if ([v82 count])
      {
        id v39 = [objc_alloc((Class)CKFetchRecordZoneChangesOperation) initWithRecordZoneIDs:v82 configurationsByRecordZoneID:v79];
        id v40 = +[CKOperationGroup pk_operationGroupWithName:*(void *)(*(void *)&buf[8] + 40) suffix:v89];
        [v39 setGroup:v40];

        [v39 setFetchAllChanges:0];
        [v39 setQualityOfService:v155[3]];
        id v41 = objc_alloc_init((Class)CKOperationConfiguration);
        id v42 = [(PDCloudStoreContainerManager *)self->_containerManager container];
        [v41 setContainer:v42];
        os_log_t osloga = v41;

        [v41 setDiscretionaryNetworkBehavior:0];
        [v39 setConfiguration:v41];
        id v43 = [v92 database];
        [v39 setDatabase:v43];

        id v44 = objc_alloc_init((Class)NSMutableSet);
        id v45 = objc_alloc_init((Class)NSMutableSet);
        *(void *)v158 = 0;
        *(void *)&v158[8] = v158;
        *(void *)&v158[16] = 0x3032000000;
        id v159 = sub_1000209BC;
        id v160 = sub_100020FD0;
        id v161 = objc_alloc_init((Class)NSMutableSet);
        v137[0] = 0;
        v137[1] = v137;
        v137[2] = 0x2020000000;
        v137[3] = 0;
        v135[0] = 0;
        v135[1] = v135;
        v135[2] = 0x2020000000;
        char v136 = 0;
        v46 = [v13 ignoreRecordsBeforeDate];
        id v47 = [v13 ignoreRecordsAfterDate];
        v130[0] = _NSConcreteStackBlock;
        v130[1] = 3221225472;
        v130[2] = sub_1001E0310;
        v130[3] = &unk_10073E808;
        v130[4] = self;
        id v48 = v92;
        id v131 = v48;
        id v49 = v46;
        id v132 = v49;
        id v50 = v47;
        id v133 = v50;
        id v51 = v44;
        id v134 = v51;
        [v39 setRecordChangedBlock:v130];
        v127[0] = _NSConcreteStackBlock;
        v127[1] = 3221225472;
        v127[2] = sub_1001E076C;
        v127[3] = &unk_10073E830;
        v127[4] = self;
        id v52 = v48;
        id v128 = v52;
        id v53 = v45;
        id v129 = v53;
        [v39 setRecordWithIDWasDeletedBlock:v127];
        int64_t v72 = v53;
        id v73 = v51;
        id v70 = v49;
        id v71 = v50;
        PKLogFacilityTypeGetObject();
        unsigned __int8 v54 = (id)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v55 = os_signpost_id_make_with_pointer(v54, self);
        if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v56 = v55;
          if (os_signpost_enabled(v54))
          {
            *(_WORD *)v126 = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v54, OS_SIGNPOST_INTERVAL_BEGIN, v56, "cloudstore:fetchRecordChangesBlock", "", v126, 2u);
          }
        }

        v112[0] = _NSConcreteStackBlock;
        v112[1] = 3221225472;
        v112[2] = sub_1001E0A18;
        v112[3] = &unk_10073E880;
        id v120 = v135;
        id v121 = v137;
        v112[4] = self;
        v122 = v158;
        unsigned __int8 v124 = v75;
        unsigned __int8 v125 = v80;
        id v57 = v52;
        id v113 = v57;
        id v114 = v13;
        id v58 = v74;
        id v115 = v58;
        id v59 = v89;
        id v116 = v59;
        int64_t v123 = a6;
        id v60 = v87;
        id v118 = v60;
        id v119 = v91;
        id v61 = v78;
        id v117 = v61;
        v62 = objc_retainBlock(v112);
        v99[0] = _NSConcreteStackBlock;
        v99[1] = 3221225472;
        v99[2] = sub_1001E1094;
        v99[3] = &unk_10073E980;
        v99[4] = self;
        id v100 = v61;
        id v63 = v57;
        id v101 = v63;
        id v109 = v137;
        id v81 = v73;
        id v102 = v81;
        id v64 = v58;
        id v103 = v64;
        uint64_t v65 = v59;
        int64_t v104 = v65;
        id v84 = v72;
        id v105 = v84;
        id v107 = v60;
        id v66 = v85;
        id v106 = v66;
        id v110 = v158;
        unsigned __int8 v111 = v75;
        uint64_t v67 = v62;
        id v108 = v67;
        [v39 setRecordZoneFetchCompletionBlock:v99];
        v93[0] = _NSConcreteStackBlock;
        v93[1] = 3221225472;
        v93[2] = sub_1001E1CB4;
        v93[3] = &unk_10073E9D0;
        v93[4] = self;
        id v98 = v135;
        id v94 = v66;
        id v95 = v64;
        v96 = v65;
        id v68 = v67;
        id v97 = v68;
        [v39 setFetchRecordZoneChangesCompletionBlock:v93];
        unsigned int v69 = [v63 database];
        [(PDCloudStoreContainer *)self _queue_addOperation:v39 forDatabase:v69];

        _Block_object_dispose(v135, 8);
        _Block_object_dispose(v137, 8);
        _Block_object_dispose(v158, 8);
      }
      else
      {
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v158 = 0;
          _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Error: No recordZoneIDs to fetch", v158, 2u);
        }

        if (v91) {
          (*((void (**)(id, void))v91 + 2))(v91, 0);
        }
      }

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v154, 8);

      goto LABEL_50;
    }
    long long v92 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Cannot peform %s: when there is no zone or database defined", "-[PDCloudStoreContainer _queue_fetchAllRecordsUsingConfiguration:operationGroupName:operationGroupNameSuffix:qualityOfService:batchHandler:completion:]");
    id v29 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v92;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    if (v91)
    {
LABEL_25:
      v86 = [(PDCloudStoreContainer *)self _cannotPerformActionErrorWithFailureReason:v92];
      (*((void (**)(id, void *))v91 + 2))(v91, v86);
    }
  }
LABEL_50:
}

- (void)_updateFetchNewestChangesFirstFlagForConfiguration:(id)a3 request:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 requestType];
  unsigned int v8 = [v6 useLastChangeToken];

  id v9 = [v5 previousServerChangeToken];

  unsigned int v10 = v8 ^ 1;
  if (!v9) {
    unsigned int v10 = 1;
  }
  if (v7) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v10;
  }
  id v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v13 = @"NO";
    if (v11) {
      CFStringRef v14 = @"YES";
    }
    else {
      CFStringRef v14 = @"NO";
    }
    if (v7) {
      CFStringRef v15 = @"NO";
    }
    else {
      CFStringRef v15 = @"YES";
    }
    int v17 = 138544130;
    CFStringRef v18 = v14;
    if (v8) {
      CFStringRef v16 = @"NO";
    }
    else {
      CFStringRef v16 = @"YES";
    }
    __int16 v19 = 2114;
    CFStringRef v20 = v15;
    __int16 v21 = 2114;
    CFStringRef v22 = v16;
    if (!v9) {
      CFStringRef v13 = @"YES";
    }
    __int16 v23 = 2114;
    CFStringRef v24 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Setting fetchNewestChangesFirst to %{public}@, isTokenRequest: %{public}@, ignoreLastChangeToken: %{public}@, missingChangeToken: %{public}@", (uint8_t *)&v17, 0x2Au);
  }

  [v5 setFetchNewestChangesFirst:v11];
}

- (void)_queue_processOperationError:(id)a3 forZoneID:(id)a4 containerDatabaseIdentifier:(id)a5 operationGroupName:(id)a6 operationGroupNameSuffix:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v50 = a4;
  id v15 = a5;
  id v47 = a6;
  id v48 = a7;
  id v16 = a8;
  int v17 = v16;
  id v51 = v15;
  if (v14)
  {
    v46 = (void (**)(void, void, void))v16;
    if (v15)
    {
      CFStringRef v18 = [(PDCloudStoreContainerManager *)self->_containerManager databaseForScope:2];
      __int16 v19 = [v18 identifier];
      id v20 = v15;
      id v21 = v19;
      CFStringRef v22 = v21;
      if (v21 == v20)
      {
        unsigned int v43 = 1;
      }
      else if (v21)
      {
        unsigned int v43 = [v20 isEqualToString:v21];
      }
      else
      {
        unsigned int v43 = 0;
      }

      CFStringRef v24 = [(PDCloudStoreContainerManager *)self->_containerManager databaseForScope:3];
      id v25 = [v24 identifier];
      id v26 = v20;
      id v27 = v25;
      id v28 = v27;
      if (v27 == v26)
      {
        unsigned int v42 = 1;
      }
      else if (v27)
      {
        unsigned int v42 = [v26 isEqualToString:v27];
      }
      else
      {
        unsigned int v42 = 0;
      }

      id v49 = [objc_alloc((Class)PKCloudStoreError) initWithError:v14];
      id v29 = [v49 allZoneIDs];
      id v30 = [v29 mutableCopy];

      if (v50) {
        [v30 addObject:v50];
      }
      id v44 = v30;
      if (([v49 isPartialErrorWithUnkownItems] & 1) == 0) {
        [(PDCloudStoreContainer *)self reportContainerChangeSignpostEventType:3 stateName:0 objectNames:0 changeToken:0 error:v14 operationGroupName:v47 operationGroupNameSuffix:v48];
      }
      unint64_t v31 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138413058;
        *(void *)&uint8_t buf[4] = v49;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v50;
        *(_WORD *)&buf[22] = 2114;
        id v87 = (uint64_t (*)(uint64_t, uint64_t))v30;
        LOWORD(v88) = 2112;
        *(void *)((char *)&v88 + 2) = v26;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Processing operation error %@ for zoneID %{public}@, all error zoneIDs %{public}@ and database identifier %@", buf, 0x2Au);
      }

      id v45 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
      *(void *)long long buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      id v87 = sub_1000209BC;
      *(void *)&long long v88 = sub_100020FD0;
      *((void *)&v88 + 1) = 0;
      if ([v49 isChangeTokenExpired])
      {
        id v32 = [v49 userInfo];
        id v33 = [v32 objectForKey:CKPartialErrorsByItemIDKey];

        v79[0] = _NSConcreteStackBlock;
        v79[1] = 3221225472;
        v79[2] = sub_1001E29B0;
        v79[3] = &unk_10073E9F8;
        v79[4] = self;
        id v80 = v26;
        [v33 enumerateKeysAndObjectsUsingBlock:v79];
      }
      else if ([v49 isZoneNotFoundError])
      {
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id v82 = 138543618;
          id v83 = v30;
          __int16 v84 = 2114;
          id v85 = v26;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "ZoneIDs with zone not found errors in database %{public}@, %{public}@", v82, 0x16u);
        }

        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        id v36 = v30;
        id v37 = [v36 countByEnumeratingWithState:&v75 objects:v81 count:16];
        if (v37)
        {
          uint64_t v38 = *(void *)v76;
          do
          {
            for (i = 0; i != v37; i = (char *)i + 1)
            {
              if (*(void *)v76 != v38) {
                objc_enumerationMutation(v36);
              }
              containerManager = self->_containerManager;
              id v41 = +[NSSet setWithObject:*(void *)(*((void *)&v75 + 1) + 8 * i)];
              [(PDCloudStoreContainerManager *)containerManager containerDatabaseIdentifier:v26 didRemoveZoneIDs:v41];
            }
            id v37 = [v36 countByEnumeratingWithState:&v75 objects:v81 count:16];
          }
          while (v37);
        }

        if (v43)
        {
          v70[0] = _NSConcreteStackBlock;
          v70[1] = 3221225472;
          v70[2] = sub_1001E2AD4;
          v70[3] = &unk_100738AA0;
          id v71 = v36;
          id v72 = v26;
          id v73 = self;
          id v74 = buf;
          [v45 addOperation:v70];

          id v33 = v71;
        }
        else
        {
          if (!v42) {
            goto LABEL_28;
          }
          v66[0] = _NSConcreteStackBlock;
          v66[1] = 3221225472;
          v66[2] = sub_1001E2D68;
          v66[3] = &unk_100733E60;
          id v67 = v36;
          id v68 = v26;
          unsigned int v69 = self;
          [v45 addOperation:v66];

          id v33 = v67;
        }
      }
      else
      {
        if (![v49 isUnrecoverableDecryptionError]) {
          goto LABEL_28;
        }
        PKAnalyticsSendEvent();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id v82 = 138412546;
          id v83 = v30;
          __int16 v84 = 2112;
          id v85 = v26;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "ZoneIDs with unrecoverable errors in database %@, %@", v82, 0x16u);
        }

        if (v43)
        {
          v61[0] = _NSConcreteStackBlock;
          v61[1] = 3221225472;
          v61[2] = sub_1001E2E64;
          v61[3] = &unk_100738AA0;
          id v62 = v30;
          id v63 = self;
          id v64 = v26;
          uint64_t v65 = buf;
          [v45 addOperation:v61];

          id v33 = v62;
        }
        else
        {
          if (!v42) {
            goto LABEL_28;
          }
          v56[0] = _NSConcreteStackBlock;
          v56[1] = 3221225472;
          v56[2] = sub_1001E30E8;
          v56[3] = &unk_100738AA0;
          id v57 = v30;
          id v58 = self;
          id v59 = v26;
          id v60 = buf;
          [v45 addOperation:v56];

          id v33 = v57;
        }
      }

LABEL_28:
      uint64_t v34 = +[NSNull null];
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_1001E350C;
      v52[3] = &unk_10073EA48;
      os_signpost_id_t v55 = buf;
      v52[4] = self;
      id v53 = v14;
      unsigned __int8 v54 = v46;
      id v35 = [v45 evaluateWithInput:v34 completion:v52];

      _Block_object_dispose(buf, 8);
      goto LABEL_29;
    }
    __int16 v23 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Cannot process operaiton error %@ with a nil database identifier", buf, 0xCu);
    }

    int v17 = v46;
    if (v46)
    {
      v46[2](v46, 0, 0);
LABEL_29:
      int v17 = v46;
    }
  }
  else if (v16)
  {
    (*((void (**)(id, uint64_t, void))v16 + 2))(v16, 1, 0);
  }
}

- (void)fetchRecordsWithRecordIDsByDatabaseIdentifier:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v26 = v12;
    __int16 v27 = 2114;
    id v28 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Fetching records with recordIDs: %@, suffix %{public}@", buf, 0x16u);
  }

  if ([v12 count])
  {
    workQueue = self->_workQueue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1001E3788;
    v18[3] = &unk_100732C68;
    id v19 = v12;
    id v20 = v13;
    int64_t v24 = a6;
    id v21 = v14;
    CFStringRef v22 = self;
    id v23 = v15;
    dispatch_async(workQueue, v18);
  }
  else if (v15)
  {
    (*((void (**)(id, void, void))v15 + 2))(v15, 0, 0);
  }
}

- (void)allItemsOfItemType:(unint64_t)a3 storeLocally:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  workQueue = self->_workQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001E478C;
  v11[3] = &unk_100731600;
  v11[4] = self;
  id v12 = v8;
  unint64_t v13 = a3;
  BOOL v14 = a4;
  id v10 = v8;
  dispatch_async(workQueue, v11);
}

- (void)applePayContainerItemsFromDate:(id)a3 toDate:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001E5344;
  v15[3] = &unk_100731EC0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(workQueue, v15);
}

- (void)removeAllItems:(unint64_t)a3 inZoneName:(id)a4 storeLocally:(BOOL)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E5E84;
  block[3] = &unk_10073EC68;
  id v17 = v11;
  unint64_t v18 = a3;
  void block[4] = self;
  id v16 = v10;
  BOOL v19 = a5;
  id v13 = v10;
  id v14 = v11;
  dispatch_async(workQueue, block);
}

- (void)itemOfItemTypeFromAllZones:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E6D00;
  block[3] = &unk_10073EC90;
  void block[4] = self;
  id v16 = v10;
  id v17 = v11;
  unint64_t v18 = a3;
  int64_t v19 = a5;
  id v13 = v10;
  id v14 = v11;
  dispatch_async(workQueue, block);
}

- (void)cloudStoreRecordArrayWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    id v12 = v6;
    id v9 = +[NSArray arrayWithObjects:&v12 count:1];
    [(PDCloudStoreContainer *)self fetchItemsWithQueryConfigurations:v9 returnRecords:1 storeRecords:0 groupName:PKCloudStoreOperationGroupUserActionImplicit groupSuffix:0 completion:v8];
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "There is no query configuration defined", v11, 2u);
    }

    id v9 = [(PDCloudStoreContainer *)self errorWithCode:-4010 description:@"There is no query configuration defined"];
    ((void (**)(void, void, void *))v8)[2](v8, 0, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)fetchItemsWithQueryConfigurations:(id)a3 returnRecords:(BOOL)a4 storeRecords:(BOOL)a5 groupName:(id)a6 groupSuffix:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  workQueue = self->_workQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001E72CC;
  void v23[3] = &unk_10073ECB8;
  id v26 = v16;
  id v27 = v17;
  v23[4] = self;
  id v24 = v14;
  BOOL v28 = a5;
  BOOL v29 = a4;
  id v25 = v15;
  id v19 = v16;
  id v20 = v15;
  id v21 = v14;
  id v22 = v17;
  dispatch_async(workQueue, v23);
}

- (void)itemOfItemType:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E7A58;
  block[3] = &unk_10073EC90;
  void block[4] = self;
  id v16 = v10;
  id v17 = v11;
  unint64_t v18 = a3;
  int64_t v19 = a5;
  id v13 = v10;
  id v14 = v11;
  dispatch_async(workQueue, block);
}

- (void)removeItems:(id)a3 groupName:(id)a4 groupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  workQueue = self->_workQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001E8234;
  v21[3] = &unk_10073E288;
  v21[4] = self;
  id v22 = v12;
  id v25 = v15;
  int64_t v26 = a6;
  id v23 = v13;
  id v24 = v14;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  id v20 = v15;
  dispatch_async(workQueue, v21);
}

- (void)removeRecordWithRecordName:(id)a3 zoneName:(id)a4 groupName:(id)a5 groupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v47 = a5;
  id v16 = a6;
  id v17 = a8;
  unint64_t nextExpectedState = self->_nextExpectedState;
  if (nextExpectedState == 15)
  {
    id v19 = [(PDCloudStoreContainerManager *)self->_containerManager databaseForScope:2];
    id v20 = [v19 zoneForZoneName:v15];
    id v21 = [v20 zoneID];

    uint64_t v22 = [(PDCloudStoreContainerManager *)self->_containerManager cloudStoreZoneForZoneID:v21 inContainerDatabase:v19];
    if (v22)
    {
      id v23 = (void *)v22;
      id v45 = (void (**)(void, void))v17;
      id v24 = v19;
    }
    else
    {
      id v24 = [(PDCloudStoreContainerManager *)self->_containerManager databaseForScope:3];

      uint64_t v27 = [(PDCloudStoreContainerManager *)self->_containerManager cloudStoreZoneForZoneID:v21 inContainerDatabase:v24];
      if (!v27)
      {
        v46 = +[NSString stringWithFormat:@"A zone does not exist with name %@", v15];
        unsigned int v42 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v54 = v46;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }

        if (!v17) {
          goto LABEL_19;
        }
        id v41 = [(PDCloudStoreContainer *)self _cannotPerformActionErrorWithFailureReason:v46];
        (*((void (**)(id, void *))v17 + 2))(v17, v41);
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      id v23 = (void *)v27;
      id v45 = (void (**)(void, void))v17;
    }
    BOOL v28 = v23;
    BOOL v29 = +[NSSet setWithObject:v23];
    id v30 = [(PDCloudStoreContainer *)self filterCloudStoreZones:v29 action:3 inContainerDatabase:v24];

    id v44 = v30;
    v46 = v28;
    if ([v30 count])
    {
      id v31 = objc_alloc((Class)CKRecordID);
      [v28 recordZone];
      id v33 = v32 = v14;
      [v33 zoneID];
      v34 = id v43 = v15;
      id v35 = [v31 initWithRecordName:v32 zoneID:v34];

      id v36 = [[PDCloudStoreRecordsRequest alloc] initWithRequestType:6 storeChanges:0 returnRecords:0 qualityOfService:a7 groupName:v47 groupNameSuffix:v16];
      id v37 = [v24 identifier];
      id v51 = v37;
      uint64_t v38 = +[NSSet setWithObject:v35];
      id v52 = v38;
      id v39 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      [(PDCloudStoreRecordsRequest *)v36 setRecordIDsByDatabaseIdentifier:v39];

      id v15 = v43;
      id v14 = v32;
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_1001E9054;
      v48[3] = &unk_10073ECE0;
      id v49 = v32;
      id v17 = v45;
      id v50 = v45;
      [(PDCloudStoreContainer *)self executeRecordsRequest:v36 completion:v48];
    }
    else
    {
      id v40 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v54 = v15;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "You do not have permission to remove items from zone %@", buf, 0xCu);
      }

      id v17 = v45;
      if (!v45) {
        goto LABEL_17;
      }
      id v35 = +[NSString stringWithFormat:@"You do not have permission to remove items from zone %@", v15];
      id v36 = [(PDCloudStoreContainer *)self errorWithCode:-4004 description:v35];
      ((void (**)(void, PDCloudStoreRecordsRequest *))v45)[2](v45, v36);
    }

LABEL_17:
    id v41 = v44;
    goto LABEL_18;
  }
  id v25 = PDCloudStoreContainerStateToString(nextExpectedState);
  id v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Cannot peform %s: when the container is in state: %@", "-[PDCloudStoreContainer removeRecordWithRecordName:zoneName:groupName:groupNameSuffix:qualityOfService:completion:]", v25);

  int64_t v26 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v54 = v24;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  if (v17)
  {
    id v21 = [(PDCloudStoreContainer *)self _cannotPerformActionErrorWithFailureReason:v24];
    (*((void (**)(id, void *))v17 + 2))(v17, v21);
LABEL_20:
  }
}

- (void)resetContainerWithZoneNames:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E924C;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)resetContainerWithAdditionalZoneIDsByDatabaseIdentifiers:(id)a3 includedCachedZoneForDatabaseIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(PDCloudStoreContainer *)self willResetContainerWithAdditionalZoneIDsByDatabaseIdentifiers:v10 includedCachedZoneForDatabaseIdentifiers:v9];
  id v11 = [[PDCloudStoreResetRequest alloc] initWithCompletion:v8];

  [(PDCloudStoreResetRequest *)v11 setIncludeCachedZonesForDatabaseIdentifiers:v9];
  [(PDCloudStoreResetRequest *)v11 setAdditionalZoneIDsByDatabaseIdentifier:v10];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001E9560;
  v12[3] = &unk_1007300F8;
  v12[4] = self;
  [(PDCloudStoreContainer *)self executeResetRequest:v11 completion:v12];
}

- (void)executeResetRequest:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Container reset request incoming %@", buf, 0xCu);
  }

  workQueue = self->_workQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001E9698;
  v9[3] = &unk_10072E198;
  id v10 = v5;
  id v11 = self;
  id v8 = v5;
  dispatch_async(workQueue, v9);
}

- (void)_executeNextResetRequestIfPossible
{
  if (!self->_currentResetRequest)
  {
    v3 = [(NSMutableOrderedSet *)self->_resetRequests firstObject];
    currentResetRequest = self->_currentResetRequest;
    self->_currentResetRequest = v3;

    if (self->_currentResetRequest)
    {
      [(NSMutableOrderedSet *)self->_resetRequests removeObjectAtIndex:0];
      id v5 = self->_currentResetRequest;
      if (v5)
      {
        id v6 = v5;
        id v7 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v13 = v6;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Container reset request starting %@", buf, 0xCu);
        }

        uint64_t v8 = PKCloudStoreOperationGroupSuffixUnrecoverableError;
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_1001E9A04;
        v10[3] = &unk_10073CFE0;
        v10[4] = self;
        id v11 = v6;
        id v9 = v6;
        [(PDCloudStoreContainer *)self _deleteZonesAndSubscriptionsWithResetRequest:v9 operationGroupNameSuffix:v8 completion:v10];
      }
    }
  }
}

- (void)deleteZone:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v28 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Deleteing zone: %@", buf, 0xCu);
    }

    id v10 = [(PDCloudStoreContainerManager *)self->_containerManager databaseForScope:2];
    id v11 = [v10 identifier];
    id v12 = [v10 zoneForZoneName:v6];
    id v13 = v12;
    if (v10 && v12)
    {
      id v25 = v11;
      id v14 = [v12 zoneID];
      id v15 = +[NSSet setWithObject:v14];
      int64_t v26 = v15;
      id v16 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      uint64_t v17 = PKCloudStoreOperationGroupSuffixPassutil;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1001E9ED8;
      v20[3] = &unk_10073ED28;
      id v21 = v11;
      id v22 = v13;
      id v23 = self;
      id v24 = v8;
      [(PDCloudStoreContainer *)self _zoneOperationWithZonesToSaveByDatabaseIdentifier:0 recordZoneIDsToDeleteByDatabaseIdentifier:v16 operationGroupNameSuffix:v17 completion:v20];

      id v18 = v21;
    }
    else
    {
      if (!v8)
      {
LABEL_12:

        goto LABEL_13;
      }
      id v18 = [(PDCloudStoreContainer *)self errorWithCode:-4000 description:@"Cannot remove a nil zone or nil database container"];
      ((void (**)(void, void, void *))v8)[2](v8, 0, v18);
    }

    goto LABEL_12;
  }
  if (v7)
  {
    id v19 = [(PDCloudStoreContainer *)self errorWithCode:-4000 description:@"Cannot remove a zone with a nil zone name"];
    ((void (**)(void, void, void *))v8)[2](v8, 0, v19);
  }
LABEL_13:
}

- (void)createZone:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EA448;
  block[3] = &unk_10072E9D8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)ensureZoneShareIntegrity
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EA6D0;
  block[3] = &unk_10072E1E8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)acceptShareInvitation:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  workQueue = self->_workQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001EA7FC;
  v21[3] = &unk_10073E288;
  id v22 = v12;
  id v23 = self;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  int64_t v27 = a6;
  id v17 = v14;
  id v18 = v13;
  id v19 = v15;
  id v20 = v12;
  dispatch_async(workQueue, v21);
}

- (void)fetchRecordsInAcceptedZoneShare:(id)a3 databaseIdentifier:(id)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = [v14 zoneName];
    *(_DWORD *)long long buf = 138412290;
    id v31 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Fetching records in newly shared zone %@", buf, 0xCu);
  }
  id v21 = [(PDCloudStoreContainer *)self containerManager];
  id v22 = [v21 databaseForIdentifier:v15];

  id v23 = [[PDCloudStoreRecordsRequest alloc] initWithRequestType:0 storeChanges:1 returnRecords:0 qualityOfService:a7 groupName:v16 groupNameSuffix:v17];
  [(PDCloudStoreRecordsRequest *)v23 setCloudStoreZone:v14];
  [(PDCloudStoreRecordsRequest *)v23 setUseLastChangeToken:0];
  [(PDCloudStoreRecordsRequest *)v23 setShouldSaveToken:1];
  [(PDCloudStoreRecordsRequest *)v23 setContainerDatabase:v22];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1001EB7AC;
  v26[3] = &unk_10073EE18;
  id v28 = self;
  id v29 = v18;
  id v27 = v14;
  id v24 = v14;
  id v25 = v18;
  [(PDCloudStoreContainer *)self executeRecordsRequest:v23 completion:v26];
}

- (void)declineInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EB968;
  block[3] = &unk_10073EEB8;
  void block[4] = self;
  id v26 = v15;
  id v27 = v14;
  id v28 = v16;
  id v29 = v17;
  id v30 = v18;
  int64_t v31 = a7;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v14;
  id v24 = v15;
  dispatch_async(workQueue, block);
}

- (void)shareForZoneName:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  workQueue = self->_workQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001EC3B4;
  v21[3] = &unk_10073EF08;
  void v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  int64_t v26 = a6;
  id v17 = v14;
  id v18 = v13;
  id v19 = v15;
  id v20 = v12;
  dispatch_async(workQueue, v21);
}

- (void)createShareInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 permission:(int64_t)a5 operationGroupName:(id)a6 operationGroupNameSuffix:(id)a7 qualityOfService:(int64_t)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  workQueue = self->_workQueue;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1001EC930;
  v26[3] = &unk_10073F368;
  void v26[4] = self;
  id v27 = v16;
  id v28 = v15;
  id v29 = v18;
  id v30 = v17;
  id v31 = v19;
  int64_t v32 = a5;
  int64_t v33 = a8;
  id v21 = v17;
  id v22 = v18;
  id v23 = v15;
  id v24 = v19;
  id v25 = v16;
  dispatch_async(workQueue, v26);
}

- (void)_queue_lockShareCreationForRecipientHandle:(id)a3 cloudStoreZone:(id)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if (!v15)
  {
    id v37 = +[NSString stringWithFormat:@"A cloud store zone is not defined"];
    id v39 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)long long buf = 138412290;
    id v65 = v37;
    goto LABEL_10;
  }
  if ([v15 scope] == (id)2)
  {
    id v41 = v17;
    id v42 = v14;
    id v19 = v16;
    id v20 = objc_alloc((Class)PKCloudStoreZoneShareLock);
    id v21 = [v15 zoneName];
    id v22 = +[NSDate date];
    id v23 = +[PKSecureElement primarySecureElementIdentifier];
    id v24 = PKDeviceName();
    id v25 = [v20 initWithZoneName:v21 creationDate:v22 originDeviceIdentifier:v23 originDeviceName:v24];

    int64_t v26 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v65 = v42;
      __int16 v66 = 2112;
      id v67 = v15;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Checking if share lock can be created for %@, %@", buf, 0x16u);
    }

    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_1001EFDCC;
    v60[3] = &unk_10073F390;
    id v27 = v25;
    id v61 = v27;
    id v62 = self;
    id v63 = v18;
    id v28 = objc_retainBlock(v60);
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_1001EFF5C;
    v54[3] = &unk_10073F3B8;
    id v55 = v15;
    os_signpost_id_t v56 = self;
    id v40 = v19;
    id v29 = v19;
    id v57 = v29;
    id v30 = v41;
    id v58 = v30;
    int64_t v59 = a7;
    id v31 = objc_retainBlock(v54);
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1001F01A4;
    v48[3] = &unk_10073F408;
    void v48[4] = self;
    id v49 = v29;
    id v52 = v31;
    int64_t v53 = a7;
    id v50 = v30;
    id v32 = v27;
    id v51 = v32;
    int64_t v33 = v31;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1001F0310;
    v43[3] = &unk_10073F458;
    v46 = objc_retainBlock(v48);
    id v47 = v28;
    id v44 = v32;
    id v45 = self;
    uint64_t v34 = (void (*)(void *, id, void *))v33[2];
    id v35 = v28;
    id v36 = v46;
    id v37 = v32;
    v34(v33, v37, v43);
    id v17 = v41;

    id v16 = v40;
    uint64_t v38 = v61;
    id v14 = v42;
    goto LABEL_13;
  }
  id v37 = +[NSString stringWithFormat:@"Cannot create a share lock for a shared zone %@", v15];
  id v39 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v65 = v37;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
LABEL_11:

  if (v18)
  {
    uint64_t v38 = [(PDCloudStoreContainer *)self _cannotPerformActionErrorWithFailureReason:v37];
    (*((void (**)(id, void, void *))v18 + 2))(v18, 0, v38);
LABEL_13:
  }
}

- (void)cloudStoreZoneInvitationDataForInvitation:(id)a3 toRecipient:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001F09DC;
  v15[3] = &unk_100730578;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(workQueue, v15);
}

- (void)_queue_cloudStoreZoneInvitationDataForInvitation:(id)a3 toRecipient:(id)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id, void, void, void))a5 + 2))(a5, 0, 0, 0);
  }
}

- (void)_queue_aliasesForRecipientHandle:(id)a3 zoneName:(id)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
}

- (void)removedFromCloudStoreZoneInvitation:(id)a3 fromHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412546;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempting to remove the cached cloud store zone in response to a zone share removal. %@ From Handle %@", (uint8_t *)&v18, 0x16u);
  }

  id v9 = [(PDCloudStoreContainerManager *)self->_containerManager databaseForScope:3];
  containerManager = self->_containerManager;
  id v11 = [v6 zoneName];
  id v12 = [(PDCloudStoreContainerManager *)containerManager cloudStoreZoneForZoneName:v11 inContainerDatabase:v9];

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Zone being shared that will be removed %@", (uint8_t *)&v18, 0xCu);
  }

  if (v12)
  {
    id v13 = self->_containerManager;
    id v14 = [v9 identifier];
    id v15 = [v12 recordZone];
    id v16 = [v15 zoneID];
    id v17 = +[NSSet setWithObject:v16];
    [(PDCloudStoreContainerManager *)v13 containerDatabaseIdentifier:v14 didRemoveZoneIDs:v17];
  }
}

- (void)_updateShare:(id)a3 cloudStoreZone:(id)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if (!v15)
  {
    id v22 = +[NSString stringWithFormat:@"A cloud store zone is not defined"];
    id v23 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)long long buf = 138412290;
    id v47 = v22;
    goto LABEL_9;
  }
  if (v14)
  {
    id v19 = [v14 debugDescription];
    if (v19)
    {
      __int16 v20 = [v14 debugDescription];
      id v45 = v20;
      uint64_t v21 = +[NSArray arrayWithObjects:&v45 count:1];
    }
    else
    {
      uint64_t v21 = 0;
    }
    id v36 = (void *)v21;

    id v25 = [v15 zoneName];
    id v35 = [(PDCloudStoreContainer *)self reportContainerChangeIntervalBeginEventWithType:27 stateName:v25 objectNames:v21 operationGroupName:v16 operationGroupNameSuffix:v17];

    id v24 = [(PDCloudStoreContainerManager *)self->_containerManager databaseForScope:2];
    int64_t v26 = [[PDCloudStoreRecordsRequest alloc] initWithRequestType:6 storeChanges:1 returnRecords:1 qualityOfService:a7 groupName:v16 groupNameSuffix:v17];
    [(PDCloudStoreRecordsRequest *)v26 setIsModifyingShare:1];
    [v24 identifier];
    id v27 = self;
    id v29 = v28 = v16;
    id v43 = v29;
    +[NSSet setWithObject:v14];
    id v31 = v30 = v17;
    id v44 = v31;
    +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    v32 = id v37 = v15;
    [(PDCloudStoreRecordsRequest *)v26 setRecordsToSaveByDatabaseIdentifier:v32];

    id v17 = v30;
    id v16 = v28;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1001F0FEC;
    v38[3] = &unk_100732D08;
    id v39 = v14;
    id v40 = v27;
    id v41 = v35;
    id v42 = v18;
    id v33 = v35;
    uint64_t v34 = v27;
    id v22 = v36;
    [(PDCloudStoreContainer *)v34 executeRecordsRequest:v26 completion:v38];

    id v15 = v37;
    goto LABEL_14;
  }
  id v22 = +[NSString stringWithFormat:@"A share is not defined."];
  id v23 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v47 = v22;
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
LABEL_10:

  if (v18)
  {
    id v24 = [(PDCloudStoreContainer *)self _cannotPerformActionErrorWithFailureReason:v22];
    (*((void (**)(id, void, void *))v18 + 2))(v18, 0, v24);
LABEL_14:
  }
}

- (void)_shareMetadataWithInvitationTokensByShareURL:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  workQueue = self->_workQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001F133C;
  v21[3] = &unk_100732C68;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = self;
  id v26 = v15;
  int64_t v27 = a6;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(workQueue, v21);
}

- (void)_fetchParticipantWithRecipientHandle:(id)a3 cloudStoreZone:(id)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F19F4;
  block[3] = &unk_10073F510;
  id v26 = v15;
  int64_t v27 = self;
  id v28 = v14;
  id v29 = v16;
  id v30 = v17;
  id v31 = v18;
  int64_t v32 = a7;
  id v20 = v17;
  id v21 = v16;
  id v22 = v14;
  id v23 = v18;
  id v24 = v15;
  dispatch_async(workQueue, block);
}

- (void)_zoneWideShareForCloudStoreZone:(id)a3 createIfNotExists:(BOOL)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F215C;
  block[3] = &unk_10073F5D8;
  id v24 = v14;
  id v25 = self;
  id v26 = v15;
  id v27 = v16;
  id v28 = v17;
  int64_t v29 = a7;
  BOOL v30 = a4;
  id v19 = v16;
  id v20 = v15;
  id v21 = v17;
  id v22 = v14;
  dispatch_async(workQueue, block);
}

- (BOOL)supportsContainerChangeEventReports
{
  return 0;
}

- (id)reportContainerChangeIntervalBeginEventWithType:(unint64_t)a3 stateName:(id)a4 objectNames:(id)a5 operationGroupName:(id)a6 operationGroupNameSuffix:(id)a7
{
  return [(PDCloudStoreContainer *)self reportContainerChangeIntervalBeginEventWithType:a3 stateName:a4 objectNames:a5 changeToken:0 operationGroupName:a6 operationGroupNameSuffix:a7];
}

- (id)reportContainerChangeIntervalBeginEventWithType:(unint64_t)a3 stateName:(id)a4 objectNames:(id)a5 changeToken:(id)a6 operationGroupName:(id)a7 operationGroupNameSuffix:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = [(PDCloudStoreContainer *)self containerManager];
  id v20 = [v19 containerName];

  id v21 = +[PKCloudStoreContainerChangeEvent intervalBeginEventWithType:a3 containerIdentifier:v20 stateName:v18 objectNames:v17 error:0 changeToken:v16 operationGroupName:v15 operationGroupNameSuffix:v14];

  id v22 = [(PDCloudStoreContainer *)self reportContainerChangeEvent:v21];

  return v22;
}

- (void)reportContainerChangeIntervalEndEventWithBeginUniqueIdentifier:(id)a3 error:(id)a4
{
  id v6 = +[PKCloudStoreContainerChangeEvent intervalEndEventWithBeginUniqueIdentifier:a3 error:a4];
  id v5 = [(PDCloudStoreContainer *)self reportContainerChangeEvent:v6];
}

- (void)reportContainerChangeSignpostEventType:(unint64_t)a3 stateName:(id)a4 objectNames:(id)a5 changeToken:(id)a6 error:(id)a7 operationGroupName:(id)a8 operationGroupNameSuffix:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = [(PDCloudStoreContainer *)self containerManager];
  id v25 = [v22 containerName];

  id v23 = +[PKCloudStoreContainerChangeEvent signpostEventWithType:a3 containerIdentifier:v25 stateName:v21 objectNames:v20 error:v18 changeToken:v19 operationGroupName:v17 operationGroupNameSuffix:v16];

  id v24 = [(PDCloudStoreContainer *)self reportContainerChangeEvent:v23];
}

- (id)reportContainerChangeEvent:(id)a3
{
  id v4 = a3;
  if (v4 && [(PDCloudStoreContainer *)self supportsContainerChangeEventReports])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    [WeakRetained addCloudStoreContainerChangeEvent:v4];

    id v6 = [v4 identifier];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)modifyRecordsOperationWithRecordsToSaveByDatabaseIdentifier:(id)a3 recordIDsToDeleteByDatabaseIdentifier:(id)a4 recordModificationOperationConfiguration:(id)a5 emitErrorIfConflictDetected:(BOOL)a6 isModifyingShare:(BOOL)a7 operationGroupName:(id)a8 operationGroupNameSuffix:(id)a9 qualityOfService:(int64_t)a10 completion:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  id v20 = a9;
  id v21 = a11;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F302C;
  block[3] = &unk_10073F7A8;
  id v31 = v16;
  id v32 = v17;
  id v33 = self;
  id v34 = v19;
  id v35 = v20;
  id v36 = v18;
  BOOL v39 = a6;
  BOOL v40 = a7;
  id v37 = v21;
  int64_t v38 = a10;
  id v23 = v21;
  id v24 = v18;
  id v25 = v20;
  id v26 = v19;
  id v27 = v17;
  id v28 = v16;
  dispatch_async(workQueue, block);
}

- (void)fetchRecordsWithQuery:(id)a3 batchLimit:(int64_t)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 zone:(id)a8 containerDatabase:(id)a9 batchHandler:(id)a10 completion:(id)a11
{
}

- (void)_fetchRecordsWithQuery:(id)a3 cursor:(id)a4 batchLimit:(int64_t)a5 operationGroupName:(id)a6 operationGroupNameSuffix:(id)a7 qualityOfService:(int64_t)a8 zone:(id)a9 containerDatabase:(id)a10 batchHandler:(id)a11 completion:(id)a12
{
  id v17 = a3;
  id v32 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  if (v22)
  {
    if (v20)
    {
      id v24 = v17;
      if (v21)
      {
        queue = self->_workQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1001F5274;
        block[3] = &unk_10073F870;
        int64_t v43 = a5;
        id v34 = v18;
        int64_t v44 = a8;
        id v35 = v20;
        id v25 = v32;
        id v36 = v32;
        id v37 = v17;
        id v41 = v23;
        int64_t v38 = self;
        id v39 = v19;
        id v40 = v21;
        id v42 = v22;
        dispatch_async(queue, block);

        goto LABEL_17;
      }
      id v27 = +[NSString stringWithFormat:@"No database defined for query request with zone %@. Not preforming query.", v20];
      id v28 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      *(_DWORD *)long long buf = 138412290;
      v46 = v27;
    }
    else
    {
      id v24 = v17;
      id v27 = +[NSString stringWithFormat:@"No zone for query reques %@. Not preforming query.", v17];
      id v28 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

        if (v23)
        {
          int64_t v29 = [(PDCloudStoreContainer *)self _cannotPerformActionErrorWithFailureReason:v27];
          (*((void (**)(id, void *))v23 + 2))(v23, v29);
        }
        id v25 = v32;
        goto LABEL_17;
      }
      *(_DWORD *)long long buf = 138412290;
      v46 = v27;
    }
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    goto LABEL_14;
  }
  id v26 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "No batch handler defined for query request. Not preforming query.", buf, 2u);
  }

  id v24 = v17;
  id v25 = v32;
  if (v23) {
    (*((void (**)(id, void))v23 + 2))(v23, 0);
  }
LABEL_17:
}

- (void)_subscriptionOperationWithSubscriptionsToSaveByDatabaseIdentifier:(id)a3 subscriptionIDsToDeleteByDatabase:(id)a4 operationGroupNameSuffix:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 allKeys];
  id v15 = +[NSMutableSet setWithArray:v14];

  id v16 = [v11 allKeys];
  id v17 = +[NSSet setWithArray:v16];
  [v15 unionSet:v17];

  workQueue = self->_workQueue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1001F6434;
  void v24[3] = &unk_10072FEA8;
  id v25 = v15;
  id v26 = v10;
  id v27 = v11;
  id v28 = v12;
  int64_t v29 = self;
  id v30 = v13;
  id v19 = v13;
  id v20 = v12;
  id v21 = v11;
  id v22 = v10;
  id v23 = v15;
  dispatch_async(workQueue, v24);
}

- (void)_deleteZonesAndSubscriptionsWithResetRequest:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v25 = a4;
  id v26 = a5;
  id v8 = objc_alloc((Class)NSMutableDictionary);
  id v28 = v7;
  id v9 = [v7 additionalZoneIDsByDatabaseIdentifier];
  id v29 = [v8 initWithDictionary:v9];

  id v10 = [v7 includeCachedZonesForDatabaseIdentifiers];
  id v11 = [v10 count];
  id v12 = PKLogFacilityTypeGetObject();
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Including cached cloud store zones in database identifier %@ for deletion.", (uint8_t *)&buf, 0xCu);
    }

    id v14 = [(PDCloudStoreContainerManager *)self->_containerManager allPossibleZoneIDsByDatabaseIdentifier];
    id v15 = objc_alloc_init((Class)NSMutableDictionary);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v16 = v10;
    id v17 = [v16 countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v36;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v36 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          id v21 = [v14 objectForKey:v20];
          if ([v21 count]) {
            [v15 setObject:v21 forKey:v20];
          }
        }
        id v17 = [v16 countByEnumeratingWithState:&v35 objects:v44 count:16];
      }
      while (v17);
    }

    [v29 addEntriesFromDictionary:v15];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v29;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Deleteing zones and subscriptions for zoneIDs %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v40 = 0x3032000000;
  id v41 = sub_1000209BC;
  id v42 = sub_100020FD0;
  id v43 = 0;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1001F7368;
  v30[3] = &unk_10073F978;
  p_long long buf = &buf;
  v30[4] = self;
  id v22 = v29;
  id v31 = v22;
  id v23 = v25;
  id v32 = v23;
  id v24 = v26;
  id v33 = v24;
  [(PDCloudStoreContainer *)self _deleteZones:v22 operationGroupNameSuffix:v23 completion:v30];

  _Block_object_dispose(&buf, 8);
}

- (void)_deleteAllZonesWithOperationGroupNameSuffix:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PDCloudStoreContainerManager *)self->_containerManager allPossibleZoneIDsByDatabaseIdentifier];
  if (![v8 count])
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "There are no zones to delete.", v10, 2u);
    }

    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
  [(PDCloudStoreContainer *)self _deleteZones:v8 operationGroupNameSuffix:v6 completion:v7];
}

- (void)_deleteZones:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Deleting zones %@", buf, 0xCu);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001F771C;
  v13[3] = &unk_10073E2D8;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [(PDCloudStoreContainer *)self _zoneOperationWithZonesToSaveByDatabaseIdentifier:0 recordZoneIDsToDeleteByDatabaseIdentifier:v8 operationGroupNameSuffix:v9 completion:v13];
}

- (void)_deleteAllSubscriptionsWithOperationGroupNameSuffix:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PDCloudStoreContainerManager *)self->_containerManager allPossibleSubscriptionIdentifiersByDatabaseIdentifier];
  if ([v8 count])
  {
    [(PDCloudStoreContainer *)self _deleteSubscriptions:v8 operationGroupNameSuffix:v6 completion:v7];
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No zone subscriptions to delete.", v10, 2u);
    }

    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

- (void)_deleteSubscriptions:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001F7B44;
  v8[3] = &unk_10073E2D8;
  id v9 = self;
  id v10 = a5;
  id v7 = v10;
  [(PDCloudStoreContainer *)v9 _subscriptionOperationWithSubscriptionsToSaveByDatabaseIdentifier:0 subscriptionIDsToDeleteByDatabase:a3 operationGroupNameSuffix:a4 completion:v8];
}

- (void)_zoneOperationWithZonesToSaveByDatabaseIdentifier:(id)a3 recordZoneIDsToDeleteByDatabaseIdentifier:(id)a4 operationGroupNameSuffix:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 allKeys];
  id v15 = +[NSMutableSet setWithArray:v14];

  id v16 = [v11 allKeys];
  id v17 = +[NSSet setWithArray:v16];
  [v15 unionSet:v17];

  workQueue = self->_workQueue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1001F7F78;
  void v24[3] = &unk_10072FEA8;
  id v25 = v15;
  id v26 = v10;
  id v27 = v11;
  id v28 = self;
  id v29 = v12;
  id v30 = v13;
  id v19 = v13;
  id v20 = v12;
  id v21 = v11;
  id v22 = v10;
  id v23 = v15;
  dispatch_async(workQueue, v24);
}

- (void)_forceFetchRecordZonesForContainerDatabase:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  if (v8)
  {
    id v11 = [v8 identifier];
    id v12 = +[NSSet setWithObject:v11];
    [(PDCloudStoreContainer *)self _fetchAndSaveRecordZonesWithContainerDatabaseIdentifiers:v12 operationGroupNameSuffix:v9 completion:v10];
  }
  else
  {
    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Not fetching zones since container database is not defined.", v14, 2u);
    }

    if (v10) {
      v10[2](v10, 0);
    }
  }
}

- (void)_fetchRecordZonesIfNeccessaryWithOperationGroupNameSuffix:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = [(PDCloudStoreContainerManager *)self->_containerManager zonesThatNeedToBeCreated];
  if ([v8 count])
  {
    id v9 = [v8 allKeys];
    id v10 = +[NSSet setWithArray:v9];
    [(PDCloudStoreContainer *)self _fetchAndSaveRecordZonesWithContainerDatabaseIdentifiers:v10 operationGroupNameSuffix:v6 completion:v7];
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not fetching zones since all zones are cached.", v12, 2u);
    }

    if (v7) {
      v7[2](v7, 0);
    }
  }
}

- (void)_fetchAndSaveRecordZonesWithContainerDatabaseIdentifiers:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = sub_1000209BC;
  v17[4] = sub_100020FD0;
  id v18 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001F90AC;
  v13[3] = &unk_10073FA70;
  v13[4] = self;
  id v16 = v17;
  id v11 = v9;
  id v14 = v11;
  id v12 = v10;
  id v15 = v12;
  [(PDCloudStoreContainer *)self _recordZonesWithOperationGroupNameSuffix:v11 containerDatabaseIdentifiers:v8 completion:v13];

  _Block_object_dispose(v17, 8);
}

- (void)_recordZonesWithOperationGroupNameSuffix:(id)a3 containerDatabaseIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001F9518;
  v15[3] = &unk_100730578;
  id v16 = v9;
  id v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(workQueue, v15);
}

- (void)_fetchAllSubscriptionsIfNeccessaryWithOperationGroupNameSuffix:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PDCloudStoreContainerManager *)self->_containerManager subscriptionsThatNeedToBeCreated];
  if ([v8 count])
  {
    workQueue = self->_workQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001FA15C;
    v11[3] = &unk_100730578;
    id v12 = v8;
    id v13 = self;
    id v14 = v6;
    id v15 = v7;
    dispatch_async(workQueue, v11);
  }
  else
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Not fetching subscriptions since all subscriptions are cached.", buf, 2u);
    }

    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (void)_queue_retryContainerStateWithError:(id)a3 operationGroupNameSuffix:(id)a4 retryCount:(unint64_t)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (a5)
  {
    id v14 = [v11 userInfo];
    id v15 = [v14 objectForKey:CKErrorRetryAfterKey];
    [v15 doubleValue];
    double v17 = v16;

    if (v17 <= 0.0) {
      double v17 = pow(1.5, (double)(4 - a5));
    }
    id v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = PDCloudStoreContainerStateToString(self->_nextExpectedState);
      *(_DWORD *)long long buf = 138543618;
      id v28 = v19;
      __int16 v29 = 2048;
      double v30 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Retrying state %{public}@ with retry interval: %f", buf, 0x16u);
    }
    dispatch_time_t v20 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
    workQueue = self->_workQueue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1001FAAD0;
    void v23[3] = &unk_100731AD8;
    v23[4] = self;
    id v24 = v12;
    unint64_t v26 = a5;
    id v25 = v13;
    dispatch_after(v20, workQueue, v23);
  }
  else
  {
    id v22 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Exhausted all retry attempts.", buf, 2u);
    }

    objc_storeStrong((id *)&self->_operationError, a3);
    self->_unint64_t nextExpectedState = 3;
    [(PDCloudStoreContainer *)self _queue_setContainerState:3 operationGroupNameSuffix:v12 retryCount:0 completion:v13];
  }
}

- (void)_queue_cancelOperationsForDatabse:(id)a3 underlyingError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 operationQueue];
  id v8 = [v7 operations];
  id v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    [v5 databaseScope];
    id v10 = CKDatabaseScopeString();
    *(_DWORD *)long long buf = 138543618;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Canceling all cloud store operations in database %{public}@, %@.", buf, 0x16u);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v15);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v16 cancelWithUnderlyingError:v6];
        }
        else {
          objc_msgSend(v16, "cancel", (void)v17);
        }
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (void)_queue_cancelAllOperations
{
  self->_shouldCancelAllTasks = 1;
  [(PDCloudStoreContainer *)self _queue_initializationTimeout];
  id v4 = +[NSString stringWithFormat:@"Cloud store initialization has timed out. Current timeout is %f seconds. Container: %@", v3, self];
  id v5 = [(PDCloudStoreContainer *)self errorWithCode:-4007 description:v4];

  [(PDCloudStoreContainer *)self reportContainerChangeSignpostEventType:22 stateName:0 objectNames:0 changeToken:0 error:v5 operationGroupName:0 operationGroupNameSuffix:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(PDCloudStoreContainerManager *)self->_containerManager validDatabases];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(PDCloudStoreContainer **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v21 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Invalidating database %@", buf, 0xCu);
        }

        id v13 = [(PDCloudStoreContainer *)v11 database];
        [(PDCloudStoreContainer *)self _queue_cancelOperationsForDatabse:v13 underlyingError:v5];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v8);
  }

  uint64_t v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v21 = self;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Invalidating cloud store because of operation timeout %@", buf, 0xCu);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001FAF7C;
  v15[3] = &unk_1007300F8;
  void v15[4] = self;
  [(PDCloudStoreContainer *)self invalidateCloudStoreWithOperationGroupNameSuffix:0 clearCache:0 completion:v15];
}

- (void)_queue_addOperation:(id)a3 forDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Adding CKDatabaseOperation %@", (uint8_t *)&v11, 0xCu);
      }

      [v7 addOperation:v6];
    }
  }
  else
  {
    uint64_t v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error: No database defined for operation %@", (uint8_t *)&v11, 0xCu);
    }
  }
  if (self->_shouldCancelAllTasks)
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Trying to add an operation after the initialization has timed out. Canceling now...", (uint8_t *)&v11, 2u);
    }

    [(PDCloudStoreContainer *)self _queue_cancelAllOperations];
  }
}

- (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  v9[0] = NSLocalizedDescriptionKey;
  v9[1] = NSLocalizedFailureReasonErrorKey;
  v10[0] = a4;
  v10[1] = a4;
  id v5 = a4;
  id v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v7 = +[NSError errorWithDomain:PKPassKitErrorDomain code:a3 userInfo:v6];

  return v7;
}

- (id)setupAssistantNotCompleteError
{
  unint64_t v3 = [(PDCloudStoreContainer *)self _setupAssistantState] - 1;
  if (v3 > 2) {
    CFStringRef v4 = @"unknown";
  }
  else {
    CFStringRef v4 = off_10073FC70[v3];
  }
  id v5 = +[NSString stringWithFormat:@"Cannot perform cloud store fetch task since the setup assistant state is %@", v4];
  id v6 = [(PDCloudStoreContainer *)self errorWithCode:-4016 description:v5];

  return v6;
}

- (void)_queue_startCloudStoreInitializationTimer
{
  [(PDCloudStoreContainer *)self _queue_cancelCloudStoreInitializationTimer];
  [(PDCloudStoreContainer *)self _queue_initializationTimeout];
  double v4 = v3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    double v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting cloud store initialization background activity with timeout of %f seconds.", buf, 0xCu);
  }

  id v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_workQueue);
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = v6;

  id v8 = self->_timeoutTimer;
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  id v10 = self->_timeoutTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1001FB4E8;
  handler[3] = &unk_10072E1E8;
  handler[4] = self;
  dispatch_source_set_event_handler(v10, handler);
  dispatch_resume((dispatch_object_t)self->_timeoutTimer);
}

- (void)_queue_cancelCloudStoreInitializationTimer
{
  if (self->_timeoutTimer)
  {
    double v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating cloud store initialization timer.", v5, 2u);
    }

    dispatch_source_cancel((dispatch_source_t)self->_timeoutTimer);
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
}

- (void)_queue_cloudStoreInitializationTimerFired
{
  double v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cloud store initialization timeout background activity did fire.", v4, 2u);
  }

  [(PDCloudStoreContainer *)self _queue_cancelCloudStoreInitializationTimer];
  [(PDCloudStoreContainer *)self _queue_cancelAllOperations];
}

- (NSString)description
{
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<%@: %p; ",
    objc_opt_class(),
  double v3 = self);
  double v4 = [(PDCloudStoreContainerManager *)self->_containerManager containerName];
  [v3 appendFormat:@"containerName: '%@'; ", v4];

  id v5 = [(PDCloudStoreContainerManager *)self->_containerManager validDatabases];
  [v3 appendFormat:@"databases: '%@'; ", v5];

  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (id)_cannotPerformActionErrorWithFailureReason:(id)a3
{
  v7[0] = NSLocalizedDescriptionKey;
  v7[1] = NSLocalizedFailureReasonErrorKey;
  v8[0] = @"Cannot perform action on CloudKit container when it is not setup.";
  v8[1] = a3;
  id v3 = a3;
  double v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  id v5 = +[NSError errorWithDomain:PKPassKitErrorDomain code:-4004 userInfo:v4];

  return v5;
}

- (void)_markEndCloudStoreDatabaseSetupWithSuccess:(BOOL)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Calling all initialization completion handlers.", buf, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  id v8 = [(NSMutableSet *)self->_initializationCompletionHandlers allObjects];
  id v9 = [v8 copy];

  [(NSMutableSet *)self->_initializationCompletionHandlers removeAllObjects];
  self->_isSetup = a3;
  os_unfair_lock_unlock(&self->_lock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * (void)v14) + 16))(*(void *)(*((void *)&v15 + 1) + 8 * (void)v14));
        uint64_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v12);
  }
}

- (PDCloudStoreContainerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PDCloudStoreContainerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PDCloudStoreDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (PDCloudStoreDataSource *)WeakRetained;
}

- (PDCloudStoreContainerManager)containerManager
{
  return self->_containerManager;
}

- (void)setContainerManager:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSError)operationError
{
  return self->_operationError;
}

- (void)setOperationError:(id)a3
{
}

- (unint64_t)nextExpectedState
{
  return self->_nextExpectedState;
}

- (void)setNextExpectedState:(unint64_t)a3
{
  self->_unint64_t nextExpectedState = a3;
}

- (BOOL)accountChangedNotificationReceived
{
  return self->_accountChangedNotificationReceived;
}

- (void)setAccountChangedNotificationReceived:(BOOL)a3
{
  self->_accountChangedNotificationReceived = a3;
}

- (BOOL)cloudContainerSetupInProgress
{
  return self->_cloudContainerSetupInProgress;
}

- (void)setCloudContainerSetupInProgress:(BOOL)a3
{
  self->_cloudContainerSetupInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationError, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_containerManager, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentResetRequest, 0);
  objc_storeStrong((id *)&self->_resetRequests, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_fetchRequests, 0);
  objc_storeStrong((id *)&self->_notificationStreamManager, 0);
  objc_storeStrong((id *)&self->_setupAssistantMonitor, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_lastInvalidationDate, 0);
  objc_storeStrong((id *)&self->_batchUpdateGroup, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_initializationCompletionHandlers, 0);
}

@end