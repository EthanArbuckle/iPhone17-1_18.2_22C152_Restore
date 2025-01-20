@interface PDPassSyncCloudStoreContainer
- (BOOL)_queue_canInitializeContainer;
- (BOOL)canSkipDownloadForReason:(int64_t)a3;
- (BOOL)didEncounterChangeTokenExpiredError:(id)a3;
- (BOOL)ensureSyncPreconditionsAreMet;
- (BOOL)isBusy;
- (BOOL)isDeltaSyncPossible;
- (BOOL)isWalletSyncEnabled;
- (BOOL)shouldForwardErrorsToRequestCompletionHandlers;
- (NSString)identifier;
- (PDCardCloudManagerLocalStore)localStore;
- (PDCloudStoreStateConfiguration)stateConfiguration;
- (PDPassSyncCloudStoreContainer)initWithConfiguration:(id)a3;
- (double)_queue_initializationTimeout;
- (id)allPossibleZoneNamesForContainerDatabase:(id)a3;
- (id)allPossibleZoneSubscriptionsForContainerDatabase:(id)a3;
- (id)allRecordsRequest;
- (id)changesRecordsRequest;
- (id)cloudPassIDForLocalUniqueID:(id)a3 inDatabase:(id)a4;
- (id)cloudStoreZonesForItem:(id)a3 action:(unint64_t)a4 inContainerDatabase:(id)a5;
- (id)cloudStoreZonesForItemType:(unint64_t)a3 configuration:(id)a4 action:(unint64_t)a5 inContainerDatabase:(id)a6;
- (id)identifierFromRecord:(id)a3;
- (id)invalidCloudStoreStateChangeError;
- (id)lastSyncDateDescription;
- (id)passesZone;
- (id)possibleDatabaseSubscriptionForContainerDatabase:(id)a3;
- (id)recordTypeFromRecordName:(id)a3;
- (id)recordTypesForCloudStoreItemType:(unint64_t)a3;
- (id)requestForAllChangedRecordsInZone:(id)a3;
- (id)requestForAllRecordsInZone:(id)a3;
- (id)sanitizeItems:(id)a3;
- (id)stateDescription;
- (id)subscriptionForZone:(id)a3 inContainerDatabase:(id)a4;
- (id)syncTokenDescription;
- (id)zoneIDForSubscription:(id)a3 inContainerDatabase:(id)a4;
- (unint64_t)cloudStoreItemTypeForRecordType:(id)a3;
- (void)_queue_cloudStoreAccountChanged:(id)a3;
- (void)_queue_processResultWithError:(id)a3 nextExpectedState:(unint64_t)a4 operationGroupNameSuffix:(id)a5 retryCount:(unint64_t)a6 shouldRetry:(BOOL)a7 completion:(id)a8;
- (void)_queue_setContainerState:(unint64_t)a3 operationGroupNameSuffix:(id)a4 retryCount:(unint64_t)a5 completion:(id)a6;
- (void)abortDownloadOfCloudDataWithReason:(int64_t)a3;
- (void)advanceToNextState:(unint64_t)a3;
- (void)advanceToNextState:(unint64_t)a3 withError:(id)a4;
- (void)checkAccountState;
- (void)clearChangeHistory;
- (void)clearSyncToken;
- (void)deleteCloudSyncRelatedInformation;
- (void)doDeltaSyncOfZone:(id)a3 andFill:(id)a4 completion:(id)a5;
- (void)doFullSyncOfZone:(id)a3 andFill:(id)a4 completion:(id)a5;
- (void)downloadCloudDataWithReason:(int64_t)a3;
- (void)eraseStateConfiguration;
- (void)fetchDiagnosticInformation:(id)a3;
- (void)fetchDiagnosticSnapshot:(id)a3;
- (void)finishDownloadOfCloudDataWithContents:(id)a3 forReason:(int64_t)a4;
- (void)finishInitialDownloadOfCloudDataWithContents:(id)a3;
- (void)finishInvalidStateChange;
- (void)finishRegularDownloadOfCloudDataWithContents:(id)a3;
- (void)markEndOfDownload:(id)a3;
- (void)moveItemsFromBatchContents:(id)a3 toFinalContents:(id)a4;
- (void)moveItemsFromResponse:(id)a3 duringDeltaSync:(BOOL)a4 orError:(id)a5 toContents:(id)a6;
- (void)onWorkQueue:(id)a3;
- (void)passOnHandlingStateChange;
- (void)performDeletes:(id)a3 completion:(id)a4;
- (void)prepareForDetachment;
- (void)prepareForSetup;
- (void)processChangeHistory;
- (void)processFetchedCloudStoreDataWithModifiedRecordsByDatabaseIdentifier:(id)a3 deletedRecordsByDatabaseIdentifier:(id)a4 carriedOverRecordsByDatabaseIdentifier:(id)a5 conflictingRecordsByDatabaseIdentifier:(id)a6 request:(id)a7 completion:(id)a8;
- (void)processPendingChanges:(id)a3;
- (void)processPendingChangesWithReason:(int64_t)a3;
- (void)reload;
- (void)removeCloudPassesWithLocalUniqueIDs:(id)a3 completion:(id)a4;
- (void)resetContents;
- (void)resetMigration;
- (void)retryExecutingAnyDroppedDownload;
- (void)setLocalStore:(id)a3;
- (void)setStateConfiguration:(id)a3;
- (void)synchronizeWithReason:(int64_t)a3;
- (void)updateCloudCatalog:(id)a3 completion:(id)a4;
- (void)updateCloudPasses:(id)a3 completion:(id)a4;
- (void)updateCloudStoreWithLocalItemsWithConfigurations:(id)a3 groupName:(id)a4 groupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7;
- (void)uploadLocalDataToCloud;
@end

@implementation PDPassSyncCloudStoreContainer

- (PDPassSyncCloudStoreContainer)initWithConfiguration:(id)a3
{
  id v5 = a3;
  [v5 setContainerDatabaseDataSource:self];
  v12.receiver = self;
  v12.super_class = (Class)PDPassSyncCloudStoreContainer;
  v6 = [(PDCloudStoreContainer *)&v12 initWithConfiguration:v5];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = [(PDCloudStoreContainerConfiguration *)v7->_configuration stringPrefixedWithContainerName:@"PDPassSyncCloudStoreContainerLastDownloadDateKey"];
    uint64_t v9 = PKSharedCacheGetDateForKey();
    lastDownloadDate = v7->_lastDownloadDate;
    v7->_lastDownloadDate = (NSDate *)v9;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (NSString)identifier
{
  v2 = [(PDCloudStoreContainer *)self containerManager];
  v3 = [v2 container];
  v4 = [v3 containerIdentifier];

  return (NSString *)v4;
}

- (void)synchronizeWithReason:(int64_t)a3
{
  if (PKCloudKitPassSyncEnabled())
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100095CC4;
    v5[3] = &unk_10072F840;
    v5[4] = self;
    v5[5] = a3;
    [(PDPassSyncCloudStoreContainer *)self onWorkQueue:v5];
  }
}

- (void)processPendingChangesWithReason:(int64_t)a3
{
  if (PKCloudKitPassSyncEnabled())
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100095F74;
    v5[3] = &unk_10072F840;
    v5[4] = self;
    v5[5] = a3;
    [(PDPassSyncCloudStoreContainer *)self onWorkQueue:v5];
  }
}

- (void)reload
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100096354;
  v2[3] = &unk_10072E1E8;
  v2[4] = self;
  [(PDPassSyncCloudStoreContainer *)self onWorkQueue:v2];
}

- (BOOL)ensureSyncPreconditionsAreMet
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
    int v24 = 138543362;
    v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] checking sync preconditions", (uint8_t *)&v24, 0xCu);
  }
  os_unfair_lock_lock(&self->_lock);
  BOOL isDownloading = self->_isDownloading;
  os_unfair_lock_unlock(&self->_lock);
  if (![(PDCloudStoreContainer *)self isSetup]
    && (id)[(PDCloudStoreContainer *)self nextExpectedState] != (id)14)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
      int v24 = 138543362;
      v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] not is set up", (uint8_t *)&v24, 0xCu);
    }
    if ([(PDCloudStoreContainer *)self cloudContainerSetupInProgress])
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v6 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
        int v24 = 138543362;
        v25 = v6;
        v7 = "[PDPassCloudStore(%{public}@)] looks like container is being set up";
        goto LABEL_35;
      }
      goto LABEL_43;
    }
    unsigned __int8 v16 = sub_1000969E4();
    BOOL v17 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    if ((v16 & 1) == 0)
    {
      if (v17)
      {
        v6 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
        int v24 = 138543362;
        v25 = v6;
        v7 = "[PDPassCloudStore(%{public}@)] looks like container is not set up because wallet dataclass is not enabled";
        goto LABEL_35;
      }
      goto LABEL_43;
    }
    if (v17)
    {
      v18 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
      int v24 = 138543362;
      v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] setting up container", (uint8_t *)&v24, 0xCu);
    }
    v19 = [(PDCloudStoreContainer *)self delegate];
    v3 = v19;
    v20 = self;
    uint64_t v21 = 0;
    goto LABEL_42;
  }
  if (![(PDPassSyncCloudStoreContainer *)self isWalletSyncEnabled])
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
      int v24 = 138543362;
      v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] wallet sync was disabled - checking again", (uint8_t *)&v24, 0xCu);
    }
    if ((PKCloudKitPassSyncEnabled() & 1) == 0)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v6 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
        int v24 = 138543362;
        v25 = v6;
        v7 = "[PDPassCloudStore(%{public}@)] sync swich is still disabled";
        goto LABEL_35;
      }
      goto LABEL_43;
    }
    if ((sub_1000969E4() & 1) == 0)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v6 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
        int v24 = 138543362;
        v25 = v6;
        v7 = "[PDPassCloudStore(%{public}@)] wallet dataclass is still disabled ";
        goto LABEL_35;
      }
      goto LABEL_43;
    }
    unsigned int v9 = [(PDCloudStoreContainer *)self cloudContainerSetupInProgress];
    BOOL v10 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v10)
      {
        v6 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
        int v24 = 138543362;
        v25 = v6;
        v7 = "[PDPassCloudStore(%{public}@)] wallet dataclass is now enabled - container already being set up";
        goto LABEL_35;
      }
LABEL_43:

      return 0;
    }
    if (v10)
    {
      v23 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
      int v24 = 138543362;
      v25 = v23;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] wallet dataclass is now enabled - setting up again", (uint8_t *)&v24, 0xCu);
    }
    v19 = [(PDCloudStoreContainer *)self delegate];
    v3 = v19;
    v20 = self;
    uint64_t v21 = 1;
LABEL_42:
    [v19 cloudStoreContainer:v20 reinitializeContainerAndInvalidateFirst:v21];
    goto LABEL_43;
  }
  if (isDownloading)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
      int v24 = 138543362;
      v25 = v6;
      v7 = "[PDPassCloudStore(%{public}@)] downloading data - uploads and more downloads will happen later";
LABEL_35:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v24, 0xCu);

      goto LABEL_43;
    }
    goto LABEL_43;
  }
  BOOL didSuccessfullySyncAtLeastOnce = self->_didSuccessfullySyncAtLeastOnce;
  BOOL v13 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (!didSuccessfullySyncAtLeastOnce)
  {
    if (v13)
    {
      v22 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
      int v24 = 138543362;
      v25 = v22;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] container never synced - tryng to download first", (uint8_t *)&v24, 0xCu);
    }
    [(PDPassSyncCloudStoreContainer *)self downloadCloudDataWithReason:3];
    return 0;
  }
  if (v13)
  {
    v14 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
    int v24 = 138543362;
    v25 = v14;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] sync preconditions are met", (uint8_t *)&v24, 0xCu);
  }
  return 1;
}

- (BOOL)_queue_canInitializeContainer
{
  return [(PDCloudStoreContainerConfiguration *)self->_configuration canInitializeContainer];
}

- (BOOL)shouldForwardErrorsToRequestCompletionHandlers
{
  return 1;
}

- (double)_queue_initializationTimeout
{
  return 300.0;
}

- (void)_queue_setContainerState:(unint64_t)a3 operationGroupNameSuffix:(id)a4 retryCount:(unint64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  objc_super v12 = objc_alloc_init(PDCloudStoreStateConfiguration);
  [(PDCloudStoreStateConfiguration *)v12 setCurrentState:a3];
  [(PDCloudStoreStateConfiguration *)v12 setOperationGroupNameSuffix:v11];

  [(PDCloudStoreStateConfiguration *)v12 setRetryCount:a5];
  [(PDCloudStoreStateConfiguration *)v12 setStateChangeCompletion:v10];

  [(PDPassSyncCloudStoreContainer *)self setStateConfiguration:v12];
  BOOL v13 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
    int v15 = 138543618;
    unsigned __int8 v16 = v14;
    __int16 v17 = 2114;
    v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] state will advance to %{public}@", (uint8_t *)&v15, 0x16u);
  }
  if ([(PDCloudStoreContainer *)self _queue_ensureContainerState:a3])
  {
    switch(a3)
    {
      case 2uLL:
      case 3uLL:
        [(PDPassSyncCloudStoreContainer *)self prepareForDetachment];
        goto LABEL_6;
      case 4uLL:
        [(PDPassSyncCloudStoreContainer *)self checkAccountState];
        break;
      case 5uLL:
        [(PDPassSyncCloudStoreContainer *)self prepareForSetup];
        break;
      case 0xDuLL:
        [(PDPassSyncCloudStoreContainer *)self downloadCloudDataWithReason:0];
        break;
      case 0xEuLL:
        [(PDPassSyncCloudStoreContainer *)self uploadLocalDataToCloud];
        break;
      default:
LABEL_6:
        [(PDPassSyncCloudStoreContainer *)self passOnHandlingStateChange];
        break;
    }
  }
  else
  {
    [(PDPassSyncCloudStoreContainer *)self finishInvalidStateChange];
  }
}

- (void)_queue_processResultWithError:(id)a3 nextExpectedState:(unint64_t)a4 operationGroupNameSuffix:(id)a5 retryCount:(unint64_t)a6 shouldRetry:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a5;
  id v16 = a8;
  id v17 = [objc_alloc((Class)PKCloudStoreError) initWithError:v14];
  if (([v17 isUnrecoverableDecryptionError] & 1) != 0
    || [v17 isZoneNotFoundError])
  {
    v18 = [(PDPassSyncCloudStoreContainer *)self localStore];
    [v18 resetMigration];
  }
  v19.receiver = self;
  v19.super_class = (Class)PDPassSyncCloudStoreContainer;
  [(PDCloudStoreContainer *)&v19 _queue_processResultWithError:v14 nextExpectedState:a4 operationGroupNameSuffix:v15 retryCount:a6 shouldRetry:v9 completion:v16];
}

- (void)finishInvalidStateChange
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
    id v5 = [(PDPassSyncCloudStoreContainer *)self stateConfiguration];
    int v9 = 138543618;
    id v10 = v4;
    __int16 v11 = 2114;
    objc_super v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] encountered invalid state configuration %{public}@", (uint8_t *)&v9, 0x16u);
  }
  v6 = [(PDPassSyncCloudStoreContainer *)self stateConfiguration];
  v7 = [v6 stateChangeCompletion];

  if (v7)
  {
    v8 = [(PDPassSyncCloudStoreContainer *)self invalidCloudStoreStateChangeError];
    ((void (**)(void, void, void *))v7)[2](v7, 0, v8);
  }
  [(PDPassSyncCloudStoreContainer *)self eraseStateConfiguration];
}

- (id)invalidCloudStoreStateChangeError
{
  return [(PDCloudStoreContainer *)self errorWithCode:-4006 description:@"Invalid cloud store state"];
}

- (void)eraseStateConfiguration
{
}

- (void)advanceToNextState:(unint64_t)a3
{
  id v8 = [(PDPassSyncCloudStoreContainer *)self stateConfiguration];
  [(PDPassSyncCloudStoreContainer *)self eraseStateConfiguration];
  [(PDCloudStoreContainer *)self setNextExpectedState:a3];
  id v5 = [v8 operationGroupNameSuffix];
  id v6 = [v8 retryCount];
  v7 = [v8 stateChangeCompletion];
  [(PDPassSyncCloudStoreContainer *)self _queue_setContainerState:a3 operationGroupNameSuffix:v5 retryCount:v6 completion:v7];
}

- (void)advanceToNextState:(unint64_t)a3 withError:(id)a4
{
  id v6 = a4;
  id v10 = [(PDPassSyncCloudStoreContainer *)self stateConfiguration];
  [(PDPassSyncCloudStoreContainer *)self eraseStateConfiguration];
  [(PDCloudStoreContainer *)self setNextExpectedState:a3];
  v7 = [v10 operationGroupNameSuffix];
  id v8 = [v10 retryCount];
  int v9 = [v10 stateChangeCompletion];
  [(PDPassSyncCloudStoreContainer *)self _queue_processResultWithError:v6 nextExpectedState:a3 operationGroupNameSuffix:v7 retryCount:v8 shouldRetry:0 completion:v9];
}

- (void)passOnHandlingStateChange
{
  v3 = [(PDPassSyncCloudStoreContainer *)self stateConfiguration];
  [(PDPassSyncCloudStoreContainer *)self eraseStateConfiguration];
  id v4 = [v3 currentState];
  id v5 = [v3 operationGroupNameSuffix];
  id v6 = [v3 retryCount];
  v7 = [v3 stateChangeCompletion];
  v8.receiver = self;
  v8.super_class = (Class)PDPassSyncCloudStoreContainer;
  [(PDCloudStoreContainer *)&v8 _queue_setContainerState:v4 operationGroupNameSuffix:v5 retryCount:v6 completion:v7];
}

- (void)checkAccountState
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100097198;
  v2[3] = &unk_100732CE0;
  v2[4] = self;
  [(PDCloudStoreContainer *)self _queue_cloudStoreAccountInformationWithCompletion:v2];
}

- (void)prepareForSetup
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
    int v13 = 138543362;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] will prepare for setup", (uint8_t *)&v13, 0xCu);
  }
  if (PKIsCloudKitEnvironmentChangeHandlingDisabled())
  {
    id v5 = [(PDCloudStoreContainer *)self errorWithCode:-4008 description:@"CK environment change handling disabled"];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  self->_isWalletDataclassEnabledOnPrimaryAppleAccount = sub_1000969E4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
    v7 = +[NSNumber numberWithBool:self->_isWalletDataclassEnabledOnPrimaryAppleAccount];
    int v13 = 138543618;
    id v14 = v6;
    __int16 v15 = 2114;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] wallet dataclass enbabled: %{public}@", (uint8_t *)&v13, 0x16u);
  }
  if (!self->_isWalletDataclassEnabledOnPrimaryAppleAccount)
  {
    id v5 = [(PDCloudStoreContainer *)self errorWithCode:-4008 description:@"Wallet dataclass disabled"];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
LABEL_17:
      objc_super v12 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
      int v13 = 138543618;
      id v14 = v12;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] error preparing for setup: %{public}@", (uint8_t *)&v13, 0x16u);
    }
LABEL_18:

    [(PDCloudStoreContainer *)self setOperationError:v5];
    [(PDPassSyncCloudStoreContainer *)self advanceToNextState:3];

    return;
  }
  if (!self->_isReadOnly)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v8 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
      int v9 = [(PDCloudStoreContainer *)self dataSource];
      int v13 = 138543618;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] asking %@ to preapre for syncing", (uint8_t *)&v13, 0x16u);
    }
    id v10 = [(PDPassSyncCloudStoreContainer *)self localStore];
    objc_msgSend(v10, "preapareForSyncingAndRegisterChanges:", -[PDPassSyncCloudStoreContainer isDeltaSyncPossible](self, "isDeltaSyncPossible"));
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
    int v13 = 138543362;
    id v14 = v11;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] did preapare for setup, advancing", (uint8_t *)&v13, 0xCu);
  }
  [(PDPassSyncCloudStoreContainer *)self passOnHandlingStateChange];
}

- (void)downloadCloudDataWithReason:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    CFStringRef v5 = @"unkown reason";
  }
  else {
    CFStringRef v5 = off_100732FC8[a3];
  }
  os_unfair_lock_lock(&self->_lock);
  BOOL isDownloading = self->_isDownloading;
  os_unfair_lock_unlock(&self->_lock);
  if (![(PDPassSyncCloudStoreContainer *)self isWalletSyncEnabled])
  {
    int v9 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
LABEL_12:

      [(PDPassSyncCloudStoreContainer *)self abortDownloadOfCloudDataWithReason:a3];
      return;
    }
    id v10 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
    BOOL isWalletDataclassEnabledOnPrimaryAppleAccount = self->_isWalletDataclassEnabledOnPrimaryAppleAccount;
    *(_DWORD *)buf = 138543874;
    v26 = v10;
    __int16 v27 = 1026;
    *(_DWORD *)v28 = isWalletDataclassEnabledOnPrimaryAppleAccount;
    *(_WORD *)&v28[4] = 1026;
    *(_DWORD *)&v28[6] = PKCloudKitPassSyncEnabled();
    objc_super v12 = "[PDPassCloudStore(%{public}@)] wallet sync is disabled (%{public}d, %{public}d)";
    int v13 = v9;
    uint32_t v14 = 24;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);

    goto LABEL_12;
  }
  if (isDownloading)
  {
    v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v8 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
      *(_DWORD *)buf = 138543618;
      v26 = v8;
      __int16 v27 = 2114;
      *(void *)v28 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] download of cloud data already in progress dropping: %{public}@", buf, 0x16u);
    }
    os_unfair_lock_lock(&self->_lock);
    self->_didDropDownload = 1;
    os_unfair_lock_unlock(&self->_lock);
    return;
  }
  if ([(PDPassSyncCloudStoreContainer *)self canSkipDownloadForReason:a3])
  {
    int v9 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    id v10 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
    *(_DWORD *)buf = 138543618;
    v26 = v10;
    __int16 v27 = 2114;
    *(void *)v28 = v5;
    objc_super v12 = "[PDPassCloudStore(%{public}@)] skipping download of cloud data: %{public}@";
    int v13 = v9;
    uint32_t v14 = 22;
    goto LABEL_11;
  }
  __int16 v15 = objc_alloc_init(PDPassCloudStoreContainerContent);
  id v16 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
    *(_DWORD *)buf = 138543618;
    v26 = v17;
    __int16 v27 = 2114;
    *(void *)v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] starting of download of cloud data because of: %{public}@", buf, 0x16u);
  }
  os_unfair_lock_lock(&self->_lock);
  self->_BOOL isDownloading = 1;
  os_unfair_lock_unlock(&self->_lock);
  unsigned int v18 = [(PDPassSyncCloudStoreContainer *)self isDeltaSyncPossible];
  objc_super v19 = [(PDPassSyncCloudStoreContainer *)self passesZone];
  if (v18)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100097D70;
    v23[3] = &unk_10072F7D0;
    v20 = (id *)v24;
    v23[4] = self;
    v24[0] = v15;
    v24[1] = a3;
    [(PDPassSyncCloudStoreContainer *)self doDeltaSyncOfZone:v19 andFill:v15 completion:v23];
  }
  else
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100097DB4;
    v21[3] = &unk_10072F7D0;
    v20 = (id *)v22;
    v21[4] = self;
    v22[0] = v15;
    v22[1] = a3;
    [(PDPassSyncCloudStoreContainer *)self doFullSyncOfZone:v19 andFill:v15 completion:v21];
  }
}

- (BOOL)isWalletSyncEnabled
{
  if (self->_isWalletDataclassEnabledOnPrimaryAppleAccount) {
    return PKCloudKitPassSyncEnabled();
  }
  else {
    return 0;
  }
}

- (BOOL)canSkipDownloadForReason:(int64_t)a3
{
  if (!self->_isReadOnly)
  {
    if (a3)
    {
      PKLogFacilityTypeGetObject();
      id v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_DEFAULT))
      {
        v7 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
        int v15 = 138543362;
        id v16 = v7;
        objc_super v8 = "[PDPassCloudStore(%{public}@)] cannot skip download because it not is initial";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, &v4->super, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, 0xCu);
      }
    }
    else if ([(PDPassSyncCloudStoreContainer *)self isDeltaSyncPossible])
    {
      os_unfair_lock_lock(&self->_lock);
      id v4 = self->_lastDownloadDate;
      os_unfair_lock_unlock(&self->_lock);
      if (v4)
      {
        int v9 = +[NSDate date];
        [v9 timeIntervalSinceDate:v4];
        double v11 = v10;

        BOOL v6 = v11 < 10800.0;
        goto LABEL_15;
      }
      int v13 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint32_t v14 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
        int v15 = 138543362;
        id v16 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] cannot skip download because we've never synced", (uint8_t *)&v15, 0xCu);
      }
    }
    else
    {
      PKLogFacilityTypeGetObject();
      id v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_DEFAULT))
      {
        v7 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
        int v15 = 138543362;
        id v16 = v7;
        objc_super v8 = "[PDPassCloudStore(%{public}@)] cannot skip download because full sync is needed";
        goto LABEL_13;
      }
    }
    BOOL v6 = 0;
    goto LABEL_15;
  }
  PKLogFacilityTypeGetObject();
  id v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
    int v15 = 138543362;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, &v4->super, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] can skip download because readOnly flag is set", (uint8_t *)&v15, 0xCu);
  }
  BOOL v6 = 1;
LABEL_15:

  return v6;
}

- (BOOL)isDeltaSyncPossible
{
  v3 = [(PDCloudStoreContainer *)self containerManager];
  id v4 = [(PDPassSyncCloudStoreContainer *)self passesZone];
  unsigned __int8 v5 = [v3 didFinishInitialSyncForCloudStoreZone:v4];

  return v5;
}

- (void)markEndOfDownload:(id)a3
{
  id v4 = a3;
  id obj = +[NSDate date];
  unsigned __int8 v5 = [v4 errorEncounered];

  os_unfair_lock_lock(&self->_lock);
  self->_BOOL isDownloading = 0;
  p_lastDownloadDate = &self->_lastDownloadDate;
  if (v5)
  {
    objc_storeStrong((id *)p_lastDownloadDate, *p_lastDownloadDate);
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)p_lastDownloadDate, obj);
    os_unfair_lock_unlock(&self->_lock);
    v7 = [(PDCloudStoreContainerConfiguration *)self->_configuration stringPrefixedWithContainerName:@"PDPassSyncCloudStoreContainerLastDownloadDateKey"];
    PKSharedCacheSetObjectForKey();
  }
}

- (void)prepareForDetachment
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
    int v6 = 138543362;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] clearing state caused by detachment", (uint8_t *)&v6, 0xCu);
  }
  downloadedContents = self->_downloadedContents;
  self->_downloadedContents = 0;

  self->_BOOL didSuccessfullySyncAtLeastOnce = 0;
  os_unfair_lock_lock(&self->_lock);
  self->_didDropDownload = 0;
  self->_BOOL isDownloading = 0;
  os_unfair_lock_unlock(&self->_lock);
  self->_BOOL isWalletDataclassEnabledOnPrimaryAppleAccount = 0;
  self->_isReadOnly = 0;
  [(PDCloudStoreContainer *)self setAccountChangedNotificationReceived:0];
}

- (void)abortDownloadOfCloudDataWithReason:(int64_t)a3
{
  if (!a3)
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v5 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
      *(_DWORD *)buf = 138543362;
      objc_super v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] aborting initial download of cloud data gracefully", buf, 0xCu);
    }
    self->_BOOL didSuccessfullySyncAtLeastOnce = 1;
    [(PDPassSyncCloudStoreContainer *)self advanceToNextState:15 withError:0];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000984A4;
    v6[3] = &unk_1007300F8;
    v6[4] = self;
    [(PDPassSyncCloudStoreContainer *)self processPendingChanges:v6];
  }
}

- (void)doDeltaSyncOfZone:(id)a3 andFill:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v12 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
    *(_DWORD *)buf = 138543362;
    v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] will attempt to download records (delta-sync)", buf, 0xCu);
  }
  int v13 = [(PDPassSyncCloudStoreContainer *)self requestForAllChangedRecordsInZone:v8];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100098760;
  v17[3] = &unk_100732D08;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  [(PDCloudStoreContainer *)self executeRecordsRequest:v13 completion:v17];
}

- (void)doFullSyncOfZone:(id)a3 andFill:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v12 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
    *(_DWORD *)buf = 138543362;
    v26 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] will attempt to download records (full-sync)", buf, 0xCu);
  }
  int v13 = [(PDCloudStoreContainer *)self containerManager];
  id v14 = [v13 changeTokenForCloudStoreStore:v8];

  if (!v14)
  {
    id v15 = [(PDPassSyncCloudStoreContainer *)self localStore];
    [v15 prepareToSaveRemoteData];
  }
  id v16 = [(PDPassSyncCloudStoreContainer *)self requestForAllRecordsInZone:v8];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100098B98;
  v23[3] = &unk_100732D30;
  v23[4] = self;
  id v17 = v9;
  id v24 = v17;
  [v16 setBatchHandler:v23];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100098D50;
  v20[3] = &unk_100732D58;
  v20[4] = self;
  id v21 = v17;
  id v22 = v10;
  id v18 = v10;
  id v19 = v17;
  [(PDCloudStoreContainer *)self executeRecordsRequest:v16 completion:v20];
}

- (void)finishDownloadOfCloudDataWithContents:(id)a3 forReason:(int64_t)a4
{
  if (a4) {
    [(PDPassSyncCloudStoreContainer *)self finishRegularDownloadOfCloudDataWithContents:a3];
  }
  else {
    [(PDPassSyncCloudStoreContainer *)self finishInitialDownloadOfCloudDataWithContents:a3];
  }
}

- (void)finishInitialDownloadOfCloudDataWithContents:(id)a3
{
  id v5 = a3;
  int v6 = [v5 errorEncounered];

  v7 = PKLogFacilityTypeGetObject();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      id v9 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
      id v10 = [v5 errorEncounered];
      int v15 = 138543618;
      id v16 = v9;
      __int16 v17 = 2114;
      id v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] error initially downloading cloud data: %{public}@", (uint8_t *)&v15, 0x16u);
    }
    double v11 = [v5 errorEncounered];
    objc_super v12 = self;
    uint64_t v13 = 3;
  }
  else
  {
    if (v8)
    {
      id v14 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
      int v15 = 138543362;
      id v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] initial download of cloud data did finish", (uint8_t *)&v15, 0xCu);
    }
    self->_BOOL didSuccessfullySyncAtLeastOnce = 1;
    objc_storeStrong((id *)&self->_downloadedContents, a3);
    double v11 = [v5 errorEncounered];
    objc_super v12 = self;
    uint64_t v13 = 14;
  }
  [(PDPassSyncCloudStoreContainer *)v12 advanceToNextState:v13 withError:v11];
}

- (void)finishRegularDownloadOfCloudDataWithContents:(id)a3
{
  id v4 = a3;
  id v5 = [v4 errorEncounered];

  if (v5)
  {
    int v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
      BOOL v8 = [v4 errorEncounered];
      *(_DWORD *)buf = 138543618;
      __int16 v17 = v7;
      __int16 v18 = 2114;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] error downloading cloud data: %{public}@", buf, 0x16u);
    }
LABEL_11:

    goto LABEL_12;
  }
  self->_BOOL didSuccessfullySyncAtLeastOnce = 1;
  id v9 = [v4 typeOfSyncPerformed];
  id v10 = PKLogFacilityTypeGetObject();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (v11)
    {
      uint64_t v13 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
      *(_DWORD *)buf = 138543362;
      __int16 v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] will upload local data after download (full-sync)", buf, 0xCu);
    }
    int v6 = [(PDPassSyncCloudStoreContainer *)self localStore];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100099328;
    v15[3] = &unk_1007300F8;
    v15[4] = self;
    [v6 saveLocalDataInContainer:v4 completion:v15];
    goto LABEL_11;
  }
  if (v11)
  {
    objc_super v12 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
    *(_DWORD *)buf = 138543362;
    __int16 v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] will upload local data after download (delta-sync)", buf, 0xCu);
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000994BC;
  v14[3] = &unk_1007300F8;
  v14[4] = self;
  [(PDPassSyncCloudStoreContainer *)self processPendingChanges:v14];
LABEL_12:
}

- (void)uploadLocalDataToCloud
{
  v3 = self->_downloadedContents;
  id v4 = v3;
  if (v3)
  {
    int64_t v5 = [(PDPassCloudStoreContainerContent *)v3 typeOfSyncPerformed];
    int v6 = PKLogFacilityTypeGetObject();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        BOOL v8 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
        *(_DWORD *)buf = 138543362;
        __int16 v17 = v8;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] will upload local data after download (delta-sync)", buf, 0xCu);
      }
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100099AD8;
      v14[3] = &unk_1007300F8;
      v14[4] = self;
      [(PDPassSyncCloudStoreContainer *)self processPendingChanges:v14];
    }
    else
    {
      if (v7)
      {
        BOOL v11 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
        *(_DWORD *)buf = 138543362;
        __int16 v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] will upload local data after download (full-sync)", buf, 0xCu);
      }
      objc_super v12 = [(PDPassSyncCloudStoreContainer *)self localStore];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100099934;
      v15[3] = &unk_1007300F8;
      v15[4] = self;
      [v12 saveLocalDataInContainer:v4 completion:v15];
    }
    downloadedContents = self->_downloadedContents;
    self->_downloadedContents = 0;
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
      *(_DWORD *)buf = 138543362;
      __int16 v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] did not find contents to use, advancing.", buf, 0xCu);
    }
    [(PDPassSyncCloudStoreContainer *)self advanceToNextState:15 withError:0];
  }
}

- (void)processPendingChanges:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  if (self->_isReadOnly)
  {
    int64_t v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] won't process pending changes because container is readonly", (uint8_t *)&v8, 0xCu);
    }
    if (v4) {
      v4[2](v4, 1, 0);
    }
  }
  else
  {
    BOOL v7 = [(PDPassSyncCloudStoreContainer *)self localStore];
    [v7 processPendingChanges:v4];
  }
}

- (id)requestForAllRecordsInZone:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PDPassSyncCloudStoreContainer *)self allRecordsRequest];
  [v5 setUseLastChangeToken:1];
  [v5 setShouldSaveToken:1];
  [v5 setStoreChangesInDatabase:0];
  [v5 setIgnoreChangesMadeByThisDevice:0];
  [v5 setBatchLimit:25];
  [v5 setCloudStoreZone:v4];

  int v6 = [(PDCloudStoreContainer *)self containerManager];
  BOOL v7 = [v6 databaseForScope:2];
  [v5 setContainerDatabase:v7];

  return v5;
}

- (id)requestForAllChangedRecordsInZone:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PDPassSyncCloudStoreContainer *)self changesRecordsRequest];
  [v5 setUseLastChangeToken:1];
  [v5 setShouldSaveToken:1];
  [v5 setStoreChangesInDatabase:1];
  [v5 setIgnoreChangesMadeByThisDevice:1];
  [v5 setBatchLimit:25];
  [v5 setCloudStoreZone:v4];

  int v6 = [(PDCloudStoreContainer *)self containerManager];
  BOOL v7 = [v6 databaseForScope:2];
  [v5 setContainerDatabase:v7];

  return v5;
}

- (id)allRecordsRequest
{
  v2 = [PDCloudStoreRecordsRequest alloc];
  v3 = [(PDCloudStoreRecordsRequest *)v2 initWithRequestType:1 storeChanges:0 returnRecords:1 qualityOfService:17 groupName:PKCloudStoreOperationGroupInitialDownload groupNameSuffix:PKCloudStoreOperationGroupSuffixPKPassdStartup];
  return v3;
}

- (id)changesRecordsRequest
{
  v2 = [PDCloudStoreRecordsRequest alloc];
  v3 = [(PDCloudStoreRecordsRequest *)v2 initWithRequestType:0 storeChanges:1 returnRecords:1 qualityOfService:17 groupName:PKCloudStoreOperationGroupInitialDownload groupNameSuffix:PKCloudStoreOperationGroupSuffixPKPassdStartup];
  return v3;
}

- (BOOL)didEncounterChangeTokenExpiredError:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  id v4 = [objc_alloc((Class)PKCloudStoreError) initWithError:v3];

  LOBYTE(v3) = [v4 isChangeTokenExpired];
  return (char)v3;
}

- (void)moveItemsFromResponse:(id)a3 duringDeltaSync:(BOOL)a4 orError:(id)a5 toContents:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  [v12 noteTypeOfSyncPerformed:v8];
  if (v11)
  {
    [v12 noteEnounteredError:v11];
  }
  else
  {
    v25 = self;
    id v24 = v10;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v13 = [v10 cloudStoreRecords];
    id v14 = [v13 allItems];

    id v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v12 appendPass:v19];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v20 = (objc_class *)objc_opt_class();
              id v21 = NSStringFromClass(v20);
              id v22 = PKLogFacilityTypeGetObject();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                v23 = [(PDCloudStoreContainerConfiguration *)v25->_configuration logDescription];
                *(_DWORD *)buf = 138543618;
                v31 = v23;
                __int16 v32 = 2114;
                v33 = v21;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] skipping item we can't handle %{public}@", buf, 0x16u);
              }
            }
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v16);
    }

    id v11 = 0;
    id v10 = v24;
  }
}

- (void)moveItemsFromBatchContents:(id)a3 toFinalContents:(id)a4
{
  id v5 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v6 = objc_msgSend(a3, "cloudPasses", 0);
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
        [v5 appendPassID:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10)];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)retryExecutingAnyDroppedDownload
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10009A470;
  v2[3] = &unk_10072E1E8;
  v2[4] = self;
  [(PDPassSyncCloudStoreContainer *)self onWorkQueue:v2];
}

- (void)onWorkQueue:(id)a3
{
  id v4 = a3;
  id v5 = [(PDCloudStoreContainer *)self workQueue];
  dispatch_async(v5, v4);
}

- (void)processFetchedCloudStoreDataWithModifiedRecordsByDatabaseIdentifier:(id)a3 deletedRecordsByDatabaseIdentifier:(id)a4 carriedOverRecordsByDatabaseIdentifier:(id)a5 conflictingRecordsByDatabaseIdentifier:(id)a6 request:(id)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = (void (**)(id, void *, void, void *))a8;
  id v17 = a7;
  PDCloudStoreRecordsRequestTypeToString((uint64_t)[v17 requestType]);
  __int16 v32 = v31 = v13;
  __int16 v18 = [v13 objectForKeyedSubscript:@"Private"];
  id v19 = [v18 count];

  id v20 = [v14 objectForKeyedSubscript:@"Private"];
  id v21 = [v20 count];

  id v22 = [v15 objectForKeyedSubscript:@"Private"];
  id v23 = [v22 count];

  id v24 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
    *(_DWORD *)buf = 138544386;
    v34 = v25;
    __int16 v35 = 2050;
    id v36 = v19;
    __int16 v37 = 2050;
    id v38 = v21;
    __int16 v39 = 2050;
    id v40 = v23;
    __int16 v41 = 2114;
    v42 = v32;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] received a batch of updates:%{public}lu deletes:%{public}lu and conflicts:%{public}lu from request %{public}@", buf, 0x34u);
  }
  long long v26 = [(PDPassSyncCloudStoreContainer *)self localStore];
  long long v27 = [v26 reflectRemoteUpdates:v31 perRequest:v17];

  long long v28 = [(PDPassSyncCloudStoreContainer *)self localStore];
  [v28 reflectRemoteDeletes:v14 perRequest:v17];

  long long v29 = [(PDPassSyncCloudStoreContainer *)self localStore];
  v30 = [v29 convertConflicts:v15];

  if (v16) {
    v16[2](v16, v27, 0, v30);
  }
}

- (void)updateCloudPasses:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009A91C;
  v8[3] = &unk_1007315D8;
  id v9 = a3;
  id v10 = a4;
  v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  [(PDPassSyncCloudStoreContainer *)self onWorkQueue:v8];
}

- (void)removeCloudPassesWithLocalUniqueIDs:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009AD84;
  v8[3] = &unk_1007315D8;
  id v9 = a3;
  id v10 = a4;
  v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  [(PDPassSyncCloudStoreContainer *)self onWorkQueue:v8];
}

- (id)cloudPassIDForLocalUniqueID:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    id v8 = [(PDPassSyncCloudStoreContainer *)self cloudStoreZonesForItemType:2 configuration:0 action:3 inContainerDatabase:v7];
    id v9 = +[PKPass recordNameForUniqueID:v6];
    id v10 = [v8 anyObject];
    long long v11 = [v10 recordZone];
    long long v12 = [v11 zoneID];

    if (v9 && v12)
    {
      id v13 = [objc_alloc((Class)CKRecordID) initWithRecordName:v9 zoneID:v12];
    }
    else
    {
      id v15 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
        int v18 = 138543362;
        id v19 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] could not generate cloud pass ID", (uint8_t *)&v18, 0xCu);
      }
      id v13 = 0;
    }
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
      int v18 = 138543362;
      id v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] could not generate cloud pass ID given no local ID", (uint8_t *)&v18, 0xCu);
    }
    id v13 = 0;
  }

  return v13;
}

- (void)performDeletes:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = PKCloudStoreOperationGroupUserActionExplicit;
  uint64_t v8 = PKCloudStoreOperationGroupSuffixPassRemoved;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10009B518;
  v10[3] = &unk_100732E50;
  id v11 = v6;
  id v9 = v6;
  [(PDCloudStoreContainer *)self modifyRecordsOperationWithRecordsToSaveByDatabaseIdentifier:0 recordIDsToDeleteByDatabaseIdentifier:a3 recordModificationOperationConfiguration:0 emitErrorIfConflictDetected:0 isModifyingShare:0 operationGroupName:v7 operationGroupNameSuffix:v8 qualityOfService:17 completion:v10];
}

- (void)updateCloudCatalog:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009B814;
  v8[3] = &unk_1007315D8;
  id v9 = a3;
  id v10 = a4;
  v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  [(PDPassSyncCloudStoreContainer *)self onWorkQueue:v8];
}

- (void)deleteCloudSyncRelatedInformation
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10009BC64;
  v2[3] = &unk_10072E1E8;
  v2[4] = self;
  [(PDPassSyncCloudStoreContainer *)self onWorkQueue:v2];
}

- (BOOL)isBusy
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = [(PDCloudStoreContainer *)self nextExpectedState];
  BOOL isDownloading = self->_isDownloading;
  os_unfair_lock_unlock(p_lock);
  if (v4 == 1) {
    return 0;
  }
  return isDownloading || v4 != 15;
}

- (void)_queue_cloudStoreAccountChanged:(id)a3
{
  if (PKIsCloudKitEnvironmentChangeHandlingDisabled())
  {
    unint64_t v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
      *(_DWORD *)buf = 138543362;
      id v11 = v5;
      id v6 = "[PDPassCloudStore(%{public}@)] CKAccountChangedNotification disabled";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if ([(PDCloudStoreContainer *)self cloudContainerSetupInProgress]
    || [(PDCloudStoreContainer *)self accountChangedNotificationReceived])
  {
    unint64_t v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
      *(_DWORD *)buf = 138543362;
      id v11 = v5;
      id v6 = "[PDPassCloudStore(%{public}@)] CKAccountChangedNotification ignored";
      goto LABEL_8;
    }
LABEL_9:

    return;
  }
  [(PDCloudStoreContainer *)self setAccountChangedNotificationReceived:1];
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(PDCloudStoreContainerConfiguration *)self->_configuration logDescription];
    *(_DWORD *)buf = 138543362;
    id v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[PDPassCloudStore(%{public}@)] received CKAccountChangedNotification", buf, 0xCu);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10009BF94;
  v9[3] = &unk_100732CE0;
  v9[4] = self;
  [(PDCloudStoreContainer *)self _queue_cloudStoreAccountInformationWithCompletion:v9];
}

- (void)updateCloudStoreWithLocalItemsWithConfigurations:(id)a3 groupName:(id)a4 groupNameSuffix:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = [(PDPassSyncCloudStoreContainer *)self sanitizeItems:a3];
  v16.receiver = self;
  v16.super_class = (Class)PDPassSyncCloudStoreContainer;
  [(PDCloudStoreContainer *)&v16 updateCloudStoreWithLocalItemsWithConfigurations:v15 groupName:v14 groupNameSuffix:v13 qualityOfService:a6 completion:v12];
}

- (id)sanitizeItems:(id)a3
{
  return objc_msgSend(a3, "pk_setByApplyingBlock:", &stru_100732E90);
}

- (id)recordTypesForCloudStoreItemType:(unint64_t)a3
{
  if (a3 == 3)
  {
    uint64_t v6 = PKCloudPassCatalogRecordType;
    id v3 = &v6;
    goto LABEL_5;
  }
  if (a3 == 2)
  {
    uint64_t v7 = PKCloudPassRecordType;
    id v3 = &v7;
LABEL_5:
    unint64_t v4 = +[NSArray arrayWithObjects:v3 count:1];
    goto LABEL_7;
  }
  unint64_t v4 = 0;
LABEL_7:
  return v4;
}

- (unint64_t)cloudStoreItemTypeForRecordType:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (void *)PKCloudPassRecordType;
  id v5 = v3;
  id v6 = v4;
  if (v6 == v5)
  {

    goto LABEL_7;
  }
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    unsigned __int8 v8 = [v5 isEqualToString:v6];

    if ((v8 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_7:
    unint64_t v9 = 2;
    goto LABEL_18;
  }

LABEL_9:
  id v10 = (void *)PKCloudPassCatalogRecordType;
  id v11 = v5;
  id v12 = v10;
  if (v12 == v11)
  {
  }
  else
  {
    id v13 = v12;
    if (!v5 || !v12)
    {

LABEL_17:
      unint64_t v9 = 0;
      goto LABEL_18;
    }
    unsigned int v14 = [v11 isEqualToString:v12];

    if (!v14) {
      goto LABEL_17;
    }
  }
  unint64_t v9 = 3;
LABEL_18:

  return v9;
}

- (id)identifierFromRecord:(id)a3
{
  id v3 = [a3 recordID];
  unint64_t v4 = [v3 recordName];

  id v5 = (char *)[v4 rangeOfString:@"-"];
  if (v5 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", 0, v5 + 1, &stru_10075AAD8);

    unint64_t v4 = (void *)v6;
  }
  return v4;
}

- (id)recordTypeFromRecordName:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PDPassSyncCloudStoreContainer;
  id v5 = [(PDCloudStoreContainer *)&v14 recordTypeFromRecordName:v4];
  uint64_t v6 = v5;
  if (v5) {
    goto LABEL_7;
  }
  uint64_t v7 = +[PKPass recordNamePrefix];
  unsigned int v8 = [v4 hasPrefix:v7];

  if (v8)
  {
    unint64_t v9 = (void **)&PKCloudPassRecordType;
LABEL_6:
    uint64_t v6 = *v9;
LABEL_7:
    id v12 = v6;
    goto LABEL_8;
  }
  id v10 = +[PKCatalog recordNamePrefix];
  unsigned int v11 = [v4 hasPrefix:v10];

  if (v11)
  {
    unint64_t v9 = (void **)&PKCloudPassCatalogRecordType;
    goto LABEL_6;
  }
  id v12 = 0;
LABEL_8:

  return v12;
}

- (id)allPossibleZoneNamesForContainerDatabase:(id)a3
{
  if ([a3 scope] == (id)2)
  {
    id v3 = +[NSSet setWithObject:PKCloudStorePassesZoneName];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)allPossibleZoneSubscriptionsForContainerDatabase:(id)a3
{
  id v4 = a3;
  if ([v4 scope] == (id)2)
  {
    id v5 = [v4 zoneForZoneName:PKCloudStorePassesZoneName];
    uint64_t v6 = [(PDPassSyncCloudStoreContainer *)self subscriptionForZone:v5 inContainerDatabase:v4];

    if (v6) {
      +[NSSet setWithObject:v6];
    }
    else {
    uint64_t v7 = +[NSSet set];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)possibleDatabaseSubscriptionForContainerDatabase:(id)a3
{
  return 0;
}

- (id)subscriptionForZone:(id)a3 inContainerDatabase:(id)a4
{
  id v5 = a3;
  if ([a4 scope] != (id)2) {
    goto LABEL_6;
  }
  uint64_t v6 = [v5 zoneID];
  uint64_t v7 = [v6 zoneName];
  unsigned int v8 = (void *)PKCloudStorePassesZoneName;
  id v9 = v7;
  id v10 = v8;
  if (v9 == v10)
  {
  }
  else
  {
    unsigned int v11 = v10;
    if (!v9 || !v10)
    {

      id v13 = 0;
      goto LABEL_10;
    }
    unsigned __int8 v12 = [v9 isEqualToString:v10];

    if ((v12 & 1) == 0)
    {
LABEL_6:
      id v13 = 0;
      goto LABEL_11;
    }
  }
  id v14 = objc_alloc((Class)CKRecordZoneSubscription);
  uint64_t v6 = [v5 zoneID];
  id v13 = [v14 initWithZoneID:v6 subscriptionID:PKCloudStorePassesZoneSubscriptionID];
LABEL_10:

LABEL_11:
  return v13;
}

- (id)zoneIDForSubscription:(id)a3 inContainerDatabase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 scope] != (id)2) {
    goto LABEL_6;
  }
  uint64_t v7 = [v5 subscriptionID];
  unsigned int v8 = (void *)PKCloudStorePassesZoneSubscriptionID;
  id v9 = v7;
  id v10 = v8;
  if (v9 == v10)
  {
  }
  else
  {
    unsigned int v11 = v10;
    if (!v9 || !v10)
    {

      id v13 = 0;
      goto LABEL_10;
    }
    unsigned int v12 = [v9 isEqualToString:v10];

    if (!v12)
    {
LABEL_6:
      id v13 = 0;
      goto LABEL_11;
    }
  }
  id v9 = [v6 zoneForZoneName:PKCloudStorePassesZoneName];
  id v13 = [v9 zoneID];
LABEL_10:

LABEL_11:
  return v13;
}

- (id)cloudStoreZonesForItem:(id)a3 action:(unint64_t)a4 inContainerDatabase:(id)a5
{
  id v8 = a5;
  id v9 = -[PDPassSyncCloudStoreContainer cloudStoreZonesForItemType:configuration:action:inContainerDatabase:](self, "cloudStoreZonesForItemType:configuration:action:inContainerDatabase:", [a3 itemType], 0, a4, v8);

  return v9;
}

- (id)cloudStoreZonesForItemType:(unint64_t)a3 configuration:(id)a4 action:(unint64_t)a5 inContainerDatabase:(id)a6
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    id v7 = a6;
    id v8 = [(PDCloudStoreContainer *)self containerManager];
    id v9 = [v8 cloudStoreZoneForZoneName:PKCloudStorePassesZoneName inContainerDatabase:v7];

    if (v9)
    {
      id v10 = +[NSSet setWithObject:v9];
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

- (id)passesZone
{
  id v3 = [(PDCloudStoreContainer *)self containerManager];
  id v4 = [v3 databaseForScope:2];

  id v5 = [(PDCloudStoreContainer *)self containerManager];
  id v6 = [v5 cloudStoreZoneForZoneName:PKCloudStorePassesZoneName inContainerDatabase:v4];

  return v6;
}

- (void)fetchDiagnosticInformation:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009CEA4;
  v4[3] = &unk_10072FDC8;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(PDPassSyncCloudStoreContainer *)v5 onWorkQueue:v4];
}

- (void)clearSyncToken
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10009D0FC;
  v2[3] = &unk_10072E1E8;
  v2[4] = self;
  [(PDPassSyncCloudStoreContainer *)self onWorkQueue:v2];
}

- (void)resetMigration
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10009D2E8;
  v2[3] = &unk_10072E1E8;
  v2[4] = self;
  [(PDPassSyncCloudStoreContainer *)self onWorkQueue:v2];
}

- (void)clearChangeHistory
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10009D408;
  v2[3] = &unk_10072E1E8;
  v2[4] = self;
  [(PDPassSyncCloudStoreContainer *)self onWorkQueue:v2];
}

- (void)processChangeHistory
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10009D4B8;
  v2[3] = &unk_10072E1E8;
  v2[4] = self;
  [(PDPassSyncCloudStoreContainer *)self onWorkQueue:v2];
}

- (void)resetContents
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10009D530;
  v2[3] = &unk_10072E1E8;
  v2[4] = self;
  [(PDPassSyncCloudStoreContainer *)self onWorkQueue:v2];
}

- (id)stateDescription
{
  uint64_t v2 = [(PDCloudStoreContainer *)self nextExpectedState];
  return (id)PDCloudStoreContainerStateToUserString(v2);
}

- (id)lastSyncDateDescription
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_lastDownloadDate;
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    id v5 = objc_alloc_init((Class)NSDateFormatter);
    [v5 setDateStyle:1];
    [v5 setTimeStyle:1];
    id v6 = [v5 stringFromDate:v4];
  }
  else
  {
    id v6 = @"N/A";
  }

  return v6;
}

- (id)syncTokenDescription
{
  id v3 = [(PDCloudStoreContainer *)self containerManager];
  id v4 = [(PDPassSyncCloudStoreContainer *)self passesZone];
  id v5 = [v3 changeTokenForCloudStoreStore:v4];

  id v6 = [v5 data];
  id v7 = [v6 length];

  if (v7)
  {
    id v8 = [v5 data];
    id v9 = [v8 hexEncoding];

    if ((unint64_t)[v9 length] > 0x15)
    {
      unsigned int v11 = [v9 substringToIndex:11];
      unsigned int v12 = objc_msgSend(v9, "substringFromIndex:", (char *)objc_msgSend(v9, "length") - 11);
      id v10 = +[NSString stringWithFormat:@"%@..%@", v11, v12];
    }
    else
    {
      id v10 = v9;
    }
  }
  else
  {
    id v10 = @"N/A";
  }

  return v10;
}

- (void)fetchDiagnosticSnapshot:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009D8C0;
  v4[3] = &unk_10072FDC8;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(PDPassSyncCloudStoreContainer *)v5 onWorkQueue:v4];
}

- (PDCardCloudManagerLocalStore)localStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localStore);
  return (PDCardCloudManagerLocalStore *)WeakRetained;
}

- (void)setLocalStore:(id)a3
{
}

- (PDCloudStoreStateConfiguration)stateConfiguration
{
  return self->_stateConfiguration;
}

- (void)setStateConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateConfiguration, 0);
  objc_destroyWeak((id *)&self->_localStore);
  objc_storeStrong((id *)&self->_lastDownloadDate, 0);
  objc_storeStrong((id *)&self->_downloadedContents, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end