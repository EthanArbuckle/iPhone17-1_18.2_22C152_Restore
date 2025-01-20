@interface PDCloudStoreNotificationCoordinator
- (BOOL)_shouldScheduleInitalCloudStoreContainerSetupBackgroundActivity;
- (BOOL)hasCachedCloudStoreZoneInApplePayContainerForZoneNames:(id)a3;
- (PDApplePayCloudStoreContainer)applePayContainer;
- (PDCloudStoreNotificationCoordinator)initWithPushNotificationManager:(id)a3 sharingIDSManger:(id)a4 databaseManager:(id)a5;
- (PDPassCloudStoreContainer)passContainer;
- (PDPassSyncCloudStoreContainer)passSyncContainer;
- (PDPassSyncCloudStoreContainer)passSyncSecureContainer;
- (double)_nextTimeIntervalForBackgroundInterval:(unint64_t)a3;
- (id)_backgroundActivityNameForBackgroundInterval:(unint64_t)a3;
- (id)_containerForItemType:(unint64_t)a3;
- (id)_containerWithIdentifier:(id)a3;
- (id)_containerWithZoneName:(id)a3 scope:(int64_t)a4;
- (id)_errorWithCode:(int64_t)a3 description:(id)a4;
- (id)changeHistoryForContainerIdentifier:(id)a3;
- (id)passContainerWithName:(id)a3;
- (id)pushNotificationTopics;
- (void)_declineInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 shouldAlertRecipient:(BOOL)a7 completion:(id)a8;
- (void)_executeNextShareInvitationRequestIfPossible;
- (void)_executeShareInvitationRequest:(id)a3;
- (void)_initialCloudDatabaseSetupForContainer:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5;
- (void)_initialCloudDatabaseSetupForContainer:(id)a3 operationGroupNameSuffix:(id)a4 shouldScheduleBackgroundActivity:(BOOL)a5 completion:(id)a6;
- (void)_performCloudStoreContainerInitalizationBackgroundActivityWithCurrentInterval:(unint64_t)a3 nextBackgroundInterval:(unint64_t)a4;
- (void)_performPassChangesBackgroundActivity;
- (void)_performPassSyncBackgroundActivity;
- (void)_performZoneShareIntegrityOperation;
- (void)_processCloudStorePushNotificationForContainer:(id)a3 cloudStoreZone:(id)a4 containerDatabse:(id)a5;
- (void)_recordAggdCloudStoreBackgroundContainerSetupResult:(BOOL)a3 forCurrentBackgroundInterval:(unint64_t)a4;
- (void)_registerForPushNotifications;
- (void)_scheduleCloudStoreContainerSetupBackgroundActivityWithNextInterval:(unint64_t)a3;
- (void)_scheduleFirstCloudStoreContainerSetupBackgroundActivityIfNeccessary;
- (void)_scheduleZoneShareIntegrityActivityForTimeInterval:(double)a3;
- (void)_shareRequest_acceptShareInvitation:(id)a3 qualityOfService:(int64_t)a4 completion:(id)a5;
- (void)_shareRequest_acceptShareInvitationWithRequestAndSendReponse:(id)a3 completion:(id)a4;
- (void)_shareRequest_bootstrapZoneRequest:(id)a3 completion:(id)a4;
- (void)_shareRequest_createShareInvitationForRequest:(id)a3 completion:(id)a4;
- (void)_shareRequest_declineInvitationForRequest:(id)a3 completion:(id)a4;
- (void)_shareRequest_requestKeysForRequest:(id)a3 completion:(id)a4;
- (void)_shareRequest_sendZoneShareInvitationWithRequest:(id)a3 completion:(id)a4;
- (void)_shareRequest_shareForRequest:(id)a3 completion:(id)a4;
- (void)_shareRequest_validateRequestKeysWithRequest:(id)a3 completion:(id)a4;
- (void)_syncTransactionsToCloudStoreOriginatedOnDevice:(unint64_t)a3;
- (void)_unregisterForPushNotifications;
- (void)_unscheduleBackgroundContainerSetupActivities;
- (void)allItemsOfItemType:(unint64_t)a3 storeLocally:(BOOL)a4 completion:(id)a5;
- (void)applePayContainerItemsFromDate:(id)a3 toDate:(id)a4 completion:(id)a5;
- (void)applyPushNotificationToken:(id)a3;
- (void)checkTLKsMissingWithCompletion:(id)a3;
- (void)cloudStoreContainer:(id)a3 createdZoneWithName:(id)a4 forContainerName:(id)a5 scope:(int64_t)a6;
- (void)cloudStoreContainer:(id)a3 didChangeContainerState:(unint64_t)a4;
- (void)cloudStoreContainer:(id)a3 reinitializeContainerAndInvalidateFirst:(BOOL)a4;
- (void)cloudStoreContainer:(id)a3 removeZoneShareInvitationForHandle:(id)a4 zoneName:(id)a5 qualitOfService:(int64_t)a6 completion:(id)a7;
- (void)cloudStoreContainer:(id)a3 requestsSyncTransactionsToCloudStoreOriginatedOnDevice:(unint64_t)a4;
- (void)cloudStoreContainer:(id)a3 requestsZoneShareFromHandle:(id)a4 zoneName:(id)a5 completion:(id)a6;
- (void)cloudStoreContainer:(id)a3 sendZoneShareInvitation:(id)a4 recipientHandle:(id)a5 completion:(id)a6;
- (void)cloudStoreContainer:(id)a3 sendZoneShareInvitationForHandle:(id)a4 zoneName:(id)a5 permission:(int64_t)a6 qualitOfService:(int64_t)a7 completion:(id)a8;
- (void)cloudStoreContainerShouldUnscheduleAllBackgroundActivities:(id)a3;
- (void)cloudStoreRecordArrayWithConfiguration:(id)a3 completion:(id)a4;
- (void)cloudStoreStatusForContainer:(id)a3 completion:(id)a4;
- (void)cloudStoreStatusWithCompletion:(id)a3;
- (void)createInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7;
- (void)createZone:(id)a3 containerName:(id)a4 completion:(id)a5;
- (void)declineInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7;
- (void)deleteZone:(id)a3 containerName:(id)a4 completion:(id)a5;
- (void)diagnosticInfoForContainerWithName:(id)a3 completion:(id)a4;
- (void)diagnosticSnapshotForContainerWithName:(id)a3 completion:(id)a4;
- (void)didReceiveCloudStoreZoneInvitation:(id)a3 invitationError:(id)a4 fromDestination:(id)a5;
- (void)didReceiveCloudStoreZoneInvitationStatus:(int64_t)a3 forInvitation:(id)a4 fromDestination:(id)a5;
- (void)didRequestCloudStoreZoneInvitationData:(id)a3 fromDestination:(id)a4;
- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4;
- (void)itemOfItemType:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)itemOfItemTypeFromAllZones:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)noteAccountAdded;
- (void)noteAccountDeleted;
- (void)noteCloudSyncPassesSwitchChanged;
- (void)performAction:(int64_t)a3 inContainerWithName:(id)a4 completion:(id)a5;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)recreateAllZonesInContainerWithZoneName:(id)a3 completion:(id)a4;
- (void)recreateZones:(id)a3 completion:(id)a4;
- (void)refetchAccountEventsWithUnknownServicingStatusWithCompletion:(id)a3;
- (void)registerObserver:(id)a3;
- (void)removeAllItems:(unint64_t)a3 inZoneName:(id)a4 containerName:(id)a5 storeLocally:(BOOL)a6 completion:(id)a7;
- (void)removeItems:(id)a3 completion:(id)a4;
- (void)removeRecordWithRecordName:(id)a3 zoneName:(id)a4 containerName:(id)a5 completion:(id)a6;
- (void)removedFromCloudStoreZoneInvitation:(id)a3 fromDestination:(id)a4;
- (void)resetApplePayManateeViewWithCompletion:(id)a3;
- (void)resetContainerWithIdentifier:(id)a3 zoneNames:(id)a4 completion:(id)a5;
- (void)schedulePassChangesBackgroundActivity;
- (void)schedulePassSyncBackgroundActivity;
- (void)scheduleTransactionDeviceDataSyncBackgroundActivityOriginatedOnDevice:(unint64_t)a3;
- (void)setApplePayContainer:(id)a3;
- (void)setPassContainer:(id)a3;
- (void)setPassSyncContainer:(id)a3;
- (void)setPassSyncSecureContainer:(id)a3;
- (void)setupCloudDatabaseForContainerName:(id)a3 completion:(id)a4;
- (void)shareForZoneName:(id)a3 containerName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)simulateCloudStorePushForContainerIdentifier:(id)a3 completion:(id)a4;
- (void)unregisterObserver:(id)a3;
- (void)updateCloudStoreWithLocalItemsWithConfigurations:(id)a3 completion:(id)a4;
@end

@implementation PDCloudStoreNotificationCoordinator

- (PDCloudStoreNotificationCoordinator)initWithPushNotificationManager:(id)a3 sharingIDSManger:(id)a4 databaseManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PDCloudStoreNotificationCoordinator;
  v12 = [(PDCloudStoreNotificationCoordinator *)&v24 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_pushNotificationManager, a3);
    objc_storeStrong((id *)&v13->_sharingIDSManger, a4);
    [(PKSharingIDSManager *)v13->_sharingIDSManger addDelegate:v13];
    objc_storeStrong((id *)&v13->_databaseManager, a5);
    v13->_lock._os_unfair_lock_opaque = 0;
    v14 = [@"com.apple.icloud-container." stringByAppendingString:@"com.apple.passd"];
    uint64_t v15 = +[NSSet setWithObject:v14];
    pushTopics = v13->_pushTopics;
    v13->_pushTopics = (NSSet *)v15;

    v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    containers = v13->_containers;
    v13->_containers = v17;

    v19 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    shareRequests = v13->_shareRequests;
    v13->_shareRequests = v19;

    uint64_t v21 = +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality];
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v21;
  }
  return v13;
}

- (void)setupCloudDatabaseForContainerName:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(PDCloudStoreNotificationCoordinator *)self _containerWithIdentifier:a3];
  [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v7 operationGroupNameSuffix:0 completion:v6];
}

- (void)_initialCloudDatabaseSetupForContainer:(id)a3 operationGroupNameSuffix:(id)a4 completion:(id)a5
{
}

- (void)_initialCloudDatabaseSetupForContainer:(id)a3 operationGroupNameSuffix:(id)a4 shouldScheduleBackgroundActivity:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = (void (**)(void, void, void))v12;
  if (v10)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1003C604C;
    v15[3] = &unk_10074EB20;
    v15[4] = self;
    id v16 = v10;
    BOOL v18 = a5;
    v17 = v13;
    [v16 initialCloudDatabaseSetupWithOperationGroupNameSuffix:v11 completion:v15];
  }
  else if (v12)
  {
    v14 = [(PDCloudStoreNotificationCoordinator *)self _errorWithCode:-4009 description:@"Cannot initialize a nil container"];
    ((void (**)(void, void, void *))v13)[2](v13, 0, v14);
  }
}

- (void)setPassContainer:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_passContainer) {
    -[NSMutableArray removeObject:](self->_containers, "removeObject:");
  }
  objc_storeStrong((id *)&self->_passContainer, a3);
  [(PDCloudStoreContainer *)self->_passContainer setDelegate:self];
  [(NSMutableArray *)self->_containers safelyAddObject:self->_passContainer];
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "A new pass container was set. Trying to initialize it now...", v7, 2u);
    }

    [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v5 operationGroupNameSuffix:PKCloudStoreOperationGroupSuffixPKPassdStartup completion:&stru_10074EB40];
  }
}

- (PDPassCloudStoreContainer)passContainer
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_passContainer;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPassSyncContainer:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_passSyncContainer) {
    -[NSMutableArray removeObjectIdenticalTo:](self->_containers, "removeObjectIdenticalTo:");
  }
  objc_storeStrong((id *)&self->_passSyncContainer, a3);
  [(PDCloudStoreContainer *)self->_passSyncContainer setDelegate:self];
  [(NSMutableArray *)self->_containers safelyAddObject:self->_passSyncContainer];
  os_unfair_lock_unlock(&self->_lock);
  id v5 = v6;
  if (v6)
  {
    [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v6 operationGroupNameSuffix:PKCloudStoreOperationGroupSuffixPKPassdStartup completion:&stru_10074EB60];
    id v5 = v6;
  }
}

- (PDPassSyncCloudStoreContainer)passSyncContainer
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_passSyncContainer;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setPassSyncSecureContainer:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_passSyncSecureContainer) {
    -[NSMutableArray removeObjectIdenticalTo:](self->_containers, "removeObjectIdenticalTo:");
  }
  objc_storeStrong((id *)&self->_passSyncSecureContainer, a3);
  [(PDCloudStoreContainer *)self->_passSyncSecureContainer setDelegate:self];
  [(NSMutableArray *)self->_containers safelyAddObject:self->_passSyncSecureContainer];
  os_unfair_lock_unlock(&self->_lock);
  passSyncSecureContainer = self->_passSyncSecureContainer;
  if (passSyncSecureContainer) {
    [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:passSyncSecureContainer operationGroupNameSuffix:PKCloudStoreOperationGroupSuffixPKPassdStartup completion:&stru_10074EB80];
  }
}

- (PDPassSyncCloudStoreContainer)passSyncSecureContainer
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_passSyncSecureContainer;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setApplePayContainer:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_applePayContainer) {
    -[NSMutableArray removeObject:](self->_containers, "removeObject:");
  }
  objc_storeStrong((id *)&self->_applePayContainer, a3);
  [(PDCloudStoreContainer *)self->_applePayContainer setDelegate:self];
  [(NSMutableArray *)self->_containers safelyAddObject:self->_applePayContainer];
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "A new apple pay container was set. Trying to initialize it now...", v7, 2u);
    }

    [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v5 operationGroupNameSuffix:PKCloudStoreOperationGroupSuffixPKPassdStartup completion:&stru_10074EBA0];
  }
}

- (PDApplePayCloudStoreContainer)applePayContainer
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_applePayContainer;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)cloudStoreStatusForContainer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PDCloudStoreNotificationCoordinator *)self _containerWithIdentifier:v6];
  id v9 = v8;
  if (v8)
  {
    unsigned __int8 v10 = [v8 isSetup];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1003C6B24;
    v13[3] = &unk_10074EBC8;
    id v14 = v7;
    unsigned __int8 v15 = v10;
    [v9 cloudStoreAccountInformationWithCompletion:v13];
  }
  else if (v7)
  {
    id v11 = +[NSString stringWithFormat:@"There is no container associated with container identifier %@", v6];
    id v12 = [(PDCloudStoreNotificationCoordinator *)self _errorWithCode:-4009 description:v11];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v12);
  }
}

- (void)cloudStoreStatusWithCompletion:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(NSMutableArray *)self->_containers firstObject];
  os_unfair_lock_unlock(&self->_lock);
  if (v4)
  {
    id v5 = [v4 containerManager];
    id v6 = [v5 containerName];
    [(PDCloudStoreNotificationCoordinator *)self cloudStoreStatusForContainer:v6 completion:v7];
  }
  else
  {
    if (!v7) {
      goto LABEL_6;
    }
    id v5 = [(PDCloudStoreNotificationCoordinator *)self _errorWithCode:-4009 description:@"There are not containers to check the cloud status for"];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v5);
  }

LABEL_6:
}

- (void)updateCloudStoreWithLocalItemsWithConfigurations:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v8 = [v6 anyObject];
    id v9 = [v8 item];
    id v10 = [v9 itemType];

    [(PDCloudStoreNotificationCoordinator *)self _containerForItemType:v10];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1003C6E00;
    v12[3] = &unk_10073C000;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = v6;
    id v15 = v7;
    id v11 = v13;
    [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v11 operationGroupNameSuffix:0 completion:v12];
  }
  else if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)removeItems:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v8 = [v6 firstObject];
    id v9 = [v8 itemType];

    [(PDCloudStoreNotificationCoordinator *)self _containerForItemType:v9];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1003C70CC;
    v11[3] = &unk_10073C000;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = v6;
    id v14 = v7;
    id v10 = v12;
    [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v10 operationGroupNameSuffix:0 completion:v11];
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)removeRecordWithRecordName:(id)a3 zoneName:(id)a4 containerName:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  [(PDCloudStoreNotificationCoordinator *)self _containerWithIdentifier:a5];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1003C734C;
  v17[3] = &unk_100730550;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = v18;
  [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v16 operationGroupNameSuffix:0 completion:v17];
}

- (void)allItemsOfItemType:(unint64_t)a3 storeLocally:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  [(PDCloudStoreNotificationCoordinator *)self _containerForItemType:a3];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003C75AC;
  v11[3] = &unk_10074EBF0;
  id v13 = v8;
  unint64_t v14 = a3;
  BOOL v15 = a4;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v8;
  id v10 = v12;
  [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v10 operationGroupNameSuffix:0 completion:v11];
}

- (void)applePayContainerItemsFromDate:(id)a3 toDate:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(PDCloudStoreNotificationCoordinator *)self _containerForItemType:1];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1003C7748;
  v15[3] = &unk_100730550;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v16;
  [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v14 operationGroupNameSuffix:0 completion:v15];
}

- (void)resetContainerWithIdentifier:(id)a3 zoneNames:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PDCloudStoreNotificationCoordinator *)self _containerWithIdentifier:v8];
  if (v11)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1003C7908;
    v14[3] = &unk_10072E570;
    id v15 = v10;
    [v11 resetContainerWithZoneNames:v9 completion:v14];
  }
  else if (v10)
  {
    id v12 = +[NSString stringWithFormat:@"There is no container associated with container identifier %@", v8];
    id v13 = [(PDCloudStoreNotificationCoordinator *)self _errorWithCode:-4009 description:v12];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v13);
  }
}

- (void)simulateCloudStorePushForContainerIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  [(PDCloudStoreNotificationCoordinator *)self _containerWithIdentifier:a3];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003C7A58;
  v9[3] = &unk_1007305A0;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v8 operationGroupNameSuffix:0 completion:v9];
}

- (void)itemOfItemTypeFromAllZones:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  [(PDCloudStoreNotificationCoordinator *)self _containerForItemType:a3];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1003C7D4C;
  v15[3] = &unk_10074EC18;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v10;
  unint64_t v19 = a3;
  int64_t v20 = a5;
  id v18 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v16;
  [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v14 operationGroupNameSuffix:0 completion:v15];
}

- (void)deleteZone:(id)a3 containerName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(PDCloudStoreNotificationCoordinator *)self _containerWithIdentifier:a4];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003C7FBC;
  v13[3] = &unk_10073C000;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v14;
  [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v12 operationGroupNameSuffix:0 completion:v13];
}

- (void)createZone:(id)a3 containerName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(PDCloudStoreNotificationCoordinator *)self _containerWithIdentifier:a4];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003C8208;
  v13[3] = &unk_10073C000;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v14;
  [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v12 operationGroupNameSuffix:0 completion:v13];
}

- (void)removeAllItems:(unint64_t)a3 inZoneName:(id)a4 containerName:(id)a5 storeLocally:(BOOL)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  [(PDCloudStoreNotificationCoordinator *)self _containerWithIdentifier:a5];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1003C8468;
  v17[3] = &unk_10074EC68;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v12;
  BOOL v22 = a6;
  id v20 = v13;
  unint64_t v21 = a3;
  id v14 = v13;
  id v15 = v12;
  id v16 = v18;
  [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v16 operationGroupNameSuffix:0 completion:v17];
}

- (void)cloudStoreRecordArrayWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[PDCloudStoreNotificationCoordinator _containerForItemType:](self, "_containerForItemType:", [v6 itemType]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003C86DC;
  v11[3] = &unk_10073C000;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = v12;
  [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v10 operationGroupNameSuffix:0 completion:v11];
}

- (void)itemOfItemType:(unint64_t)a3 recordName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  [(PDCloudStoreNotificationCoordinator *)self _containerForItemType:a3];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1003C8948;
  v15[3] = &unk_10074EC18;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v10;
  unint64_t v19 = a3;
  int64_t v20 = a5;
  id v18 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v16;
  [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v14 operationGroupNameSuffix:0 completion:v15];
}

- (void)_executeShareInvitationRequest:(id)a3
{
  v4 = (NSMutableOrderedSet *)a3;
  p_super = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "Share invitation request incoming %@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = self->_shareRequests;
  id v7 = [(NSMutableOrderedSet *)v6 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v11, "coalesceWithRequest:", v4, (void)v12))
        {
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v17 = v4;
            __int16 v18 = 2112;
            unint64_t v19 = v11;
            _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "Share invitation request coalesced %@ onto existing request %@", buf, 0x16u);
          }

          p_super = &v4->super.super;
          goto LABEL_18;
        }
      }
      id v8 = [(NSMutableOrderedSet *)v6 countByEnumeratingWithState:&v12 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  if (v4)
  {
    [(NSMutableOrderedSet *)self->_shareRequests addObject:v4];
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "Share invitation request queued %@", buf, 0xCu);
    }
    id v6 = v4;
LABEL_18:
  }
  os_unfair_lock_unlock(&self->_lock);
  [(PDCloudStoreNotificationCoordinator *)self _executeNextShareInvitationRequestIfPossible];
}

- (void)_executeNextShareInvitationRequestIfPossible
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_currentShareRequest)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v4 = [(NSMutableOrderedSet *)self->_shareRequests firstObject];
    currentShareRequest = self->_currentShareRequest;
    self->_currentShareRequest = v4;

    id v6 = self->_currentShareRequest;
    if (v6)
    {
      [(NSMutableOrderedSet *)self->_shareRequests removeObjectAtIndex:0];
      id v6 = self->_currentShareRequest;
    }
    id v7 = v6;
    os_unfair_lock_unlock(p_lock);
    if (v7)
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Starting share invitation request %@", buf, 0xCu);
      }

      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1003C9228;
      v28[3] = &unk_10074ECB8;
      uint64_t v9 = v7;
      v29 = v9;
      v30 = self;
      id v10 = objc_retainBlock(v28);
      switch([(PDCloudStoreShareInvitationRequest *)v9 type])
      {
        case 0uLL:
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = sub_1003C9290;
          v26[3] = &unk_10072E570;
          id v11 = (id *)&v27;
          v27 = v10;
          [(PDCloudStoreNotificationCoordinator *)self _shareRequest_acceptShareInvitationWithRequestAndSendReponse:v9 completion:v26];
          goto LABEL_19;
        case 1uLL:
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_1003C9318;
          v24[3] = &unk_10072E570;
          id v11 = (id *)&v25;
          v25 = v10;
          [(PDCloudStoreNotificationCoordinator *)self _shareRequest_validateRequestKeysWithRequest:v9 completion:v24];
          goto LABEL_19;
        case 2uLL:
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_1003C93A0;
          v22[3] = &unk_100733D30;
          id v11 = (id *)&v23;
          v23 = v10;
          [(PDCloudStoreNotificationCoordinator *)self _shareRequest_createShareInvitationForRequest:v9 completion:v22];
          goto LABEL_19;
        case 3uLL:
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_1003C9450;
          v20[3] = &unk_100733D30;
          id v11 = (id *)&v21;
          unint64_t v21 = v10;
          [(PDCloudStoreNotificationCoordinator *)self _shareRequest_sendZoneShareInvitationWithRequest:v9 completion:v20];
          goto LABEL_19;
        case 4uLL:
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_1003C94D8;
          v18[3] = &unk_10074ECE0;
          id v11 = (id *)&v19;
          unint64_t v19 = v10;
          [(PDCloudStoreNotificationCoordinator *)self _shareRequest_declineInvitationForRequest:v9 completion:v18];
          goto LABEL_19;
        case 5uLL:
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_1003C9570;
          v16[3] = &unk_100732C40;
          id v11 = (id *)&v17;
          id v17 = v10;
          [(PDCloudStoreNotificationCoordinator *)self _shareRequest_shareForRequest:v9 completion:v16];
          goto LABEL_19;
        case 6uLL:
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_1003C960C;
          v14[3] = &unk_10072E570;
          id v11 = (id *)&v15;
          long long v15 = v10;
          [(PDCloudStoreNotificationCoordinator *)self _shareRequest_requestKeysForRequest:v9 completion:v14];
          goto LABEL_19;
        case 7uLL:
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472;
          v12[2] = sub_1003C9694;
          v12[3] = &unk_10072E570;
          id v11 = (id *)&v13;
          long long v13 = v10;
          [(PDCloudStoreNotificationCoordinator *)self _shareRequest_bootstrapZoneRequest:v9 completion:v12];
LABEL_19:

          break;
        default:
          break;
      }
    }
  }
}

- (void)_shareRequest_acceptShareInvitationWithRequestAndSendReponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 invitation];
  id v9 = [v6 qualityOfService];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003C9820;
  v13[3] = &unk_100730550;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  [(PDCloudStoreNotificationCoordinator *)self _shareRequest_acceptShareInvitation:v12 qualityOfService:v9 completion:v13];
}

- (void)_shareRequest_acceptShareInvitation:(id)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 containerIdentifier];
  id v11 = [(PDCloudStoreNotificationCoordinator *)self _containerWithIdentifier:v10];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1003C9C88;
  v15[3] = &unk_100736EA0;
  id v16 = v11;
  id v17 = v8;
  id v18 = v9;
  int64_t v19 = a4;
  id v12 = v9;
  id v13 = v8;
  id v14 = v11;
  [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v14 operationGroupNameSuffix:0 completion:v15];
}

- (void)_shareRequest_validateRequestKeysWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 invitation];
  id v9 = [v7 recipientHandle];

  id v10 = [v8 containerIdentifier];
  id v11 = [(PDCloudStoreNotificationCoordinator *)self _containerWithIdentifier:v10];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1003C9F50;
  v16[3] = &unk_10074ED58;
  int64_t v20 = self;
  id v21 = v6;
  id v17 = v8;
  id v18 = v11;
  id v19 = v9;
  id v12 = v9;
  id v13 = v11;
  id v14 = v6;
  id v15 = v8;
  [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v13 operationGroupNameSuffix:0 completion:v16];
}

- (void)_shareRequest_createShareInvitationForRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 containerName];
  id v9 = [v7 zoneName];
  id v10 = [v7 handle];
  id v11 = [v7 qualityOfService];
  id v12 = [v7 permission];
  id v13 = [(PDCloudStoreNotificationCoordinator *)self _containerWithIdentifier:v8];
  id v14 = [v7 suffix];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1003CA554;
  v19[3] = &unk_10074ED80;
  id v20 = v13;
  id v21 = v10;
  id v24 = v12;
  id v25 = v11;
  id v22 = v9;
  id v23 = v6;
  id v15 = v6;
  id v16 = v9;
  id v17 = v10;
  id v18 = v13;
  [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v18 operationGroupNameSuffix:v14 completion:v19];
}

- (void)_shareRequest_sendZoneShareInvitationWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 invitation];
  id v9 = [v7 recipientHandle];

  if (v8)
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v9;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Alerting %@ via IDS that they have been added to a zone share invitation %@", buf, 0x16u);
    }

    sharingIDSManger = self->_sharingIDSManger;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1003CA830;
    v12[3] = &unk_100731538;
    id v14 = v6;
    id v13 = v8;
    [(PKSharingIDSManager *)sharingIDSManger sendCloudStoreZoneInvitation:v13 forHandle:v9 invitationError:0 completion:v12];
  }
  else if (v6)
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)declineInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003CA9D4;
  v13[3] = &unk_10074ECE0;
  id v14 = a7;
  id v12 = v14;
  [(PDCloudStoreNotificationCoordinator *)self _declineInvitationForRecipientHandle:a3 zoneName:a4 containerName:a5 qualityOfService:a6 shouldAlertRecipient:1 completion:v13];
}

- (void)createInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(PDCloudStoreNotificationCoordinator *)self _containerWithIdentifier:a5];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1003CAAEC;
  v17[3] = &unk_10072E570;
  id v18 = v12;
  id v16 = v12;
  [(PDCloudStoreNotificationCoordinator *)self cloudStoreContainer:v15 sendZoneShareInvitationForHandle:v14 zoneName:v13 permission:3 qualitOfService:a6 completion:v17];
}

- (void)_declineInvitationForRecipientHandle:(id)a3 zoneName:(id)a4 containerName:(id)a5 qualityOfService:(int64_t)a6 shouldAlertRecipient:(BOOL)a7 completion:(id)a8
{
  BOOL v8 = a7;
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [PDCloudStoreShareInvitationRequestDeclineRequest alloc];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1003CAC9C;
  v21[3] = &unk_10074EDA8;
  id v22 = v14;
  id v19 = v14;
  id v20 = [(PDCloudStoreShareInvitationRequestDeclineRequest *)v18 initWithHandle:v17 zoneName:v16 containerName:v15 completion:v21];

  [(PDCloudStoreShareInvitationRequestDeclineRequest *)v20 setShouldAlertRecipient:v8];
  [(PDCloudStoreShareInvitationRequest *)v20 setQualityOfService:a6];
  [(PDCloudStoreNotificationCoordinator *)self _executeShareInvitationRequest:v20];
}

- (void)_shareRequest_declineInvitationForRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [v7 containerName];
  id v9 = [v7 zoneName];
  id v10 = [v7 handle];
  unsigned __int8 v11 = [v7 shouldAlertRecipient];
  id v12 = [v7 qualityOfService];

  [(PDCloudStoreNotificationCoordinator *)self _containerWithIdentifier:v8];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1003CAED0;
  v18[3] = &unk_10074EDF8;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v20 = v10;
  id v24 = v6;
  id v25 = v12;
  unsigned __int8 v26 = v11;
  id v21 = v9;
  id v22 = v8;
  id v23 = self;
  id v13 = v6;
  id v14 = v8;
  id v15 = v9;
  id v16 = v10;
  id v17 = v19;
  [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v17 operationGroupNameSuffix:0 completion:v18];
}

- (void)shareForZoneName:(id)a3 containerName:(id)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [PDCloudStoreShareInvitationRequestGetShare alloc];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1003CB43C;
  v16[3] = &unk_10074EDA8;
  id v17 = v10;
  id v14 = v10;
  id v15 = [(PDCloudStoreShareInvitationRequestGetShare *)v13 initWithZoneName:v12 containerName:v11 completion:v16];

  [(PDCloudStoreShareInvitationRequest *)v15 setQualityOfService:a5];
  [(PDCloudStoreNotificationCoordinator *)self _executeShareInvitationRequest:v15];
}

- (void)diagnosticInfoForContainerWithName:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(PDCloudStoreNotificationCoordinator *)self passContainerWithName:a3];
  if (v7)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1003CB5D4;
    v9[3] = &unk_10074EE20;
    id v10 = v6;
    [v7 fetchDiagnosticInformation:v9];
  }
  else
  {
    BOOL v8 = +[PKCloudStoreContainerDiagnostics turnedOff];
    (*((void (**)(id, void *, void))v6 + 2))(v6, v8, 0);
  }
}

- (void)diagnosticSnapshotForContainerWithName:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(PDCloudStoreNotificationCoordinator *)self passContainerWithName:a3];
  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1003CB6C0;
    v8[3] = &unk_10074EE48;
    id v9 = v6;
    [v7 fetchDiagnosticSnapshot:v8];
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)performAction:(int64_t)a3 inContainerWithName:(id)a4 completion:(id)a5
{
  BOOL v8 = (void (**)(id, void))a5;
  id v9 = [(PDCloudStoreNotificationCoordinator *)self passContainerWithName:a4];
  id v10 = v9;
  if (v9)
  {
    switch(a3)
    {
      case 1:
        [v9 clearSyncToken];
        break;
      case 2:
        [v9 synchronizeWithReason:1];
        break;
      case 3:
        [v9 resetMigration];
        break;
      case 4:
        [v9 clearChangeHistory];
        break;
      case 5:
        [v9 processChangeHistory];
        break;
      case 6:
        [v9 resetContents];
        break;
      case 7:
        uint64_t v11 = PKCloudStoreOperationGroupInitialSetup;
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_1003CB850;
        v12[3] = &unk_100732CB8;
        void v12[4] = self;
        id v13 = v9;
        [v13 invalidateCloudStoreWithOperationGroupNameSuffix:v11 clearCache:0 completion:v12];

        break;
      default:
        break;
    }
  }
  v8[2](v8, 0);
}

- (id)passContainerWithName:(id)a3
{
  id v4 = a3;
  id v5 = (void *)PKCloudStorePassesSyncContainerName;
  id v6 = v4;
  id v7 = v5;
  if (v7 == v6)
  {

    goto LABEL_7;
  }
  BOOL v8 = v7;
  if (!v6 || !v7)
  {

    goto LABEL_9;
  }
  unsigned int v9 = [v6 isEqualToString:v7];

  if (v9)
  {
LABEL_7:
    uint64_t v10 = [(PDCloudStoreNotificationCoordinator *)self passSyncContainer];
LABEL_16:
    id v16 = (void *)v10;
    goto LABEL_19;
  }
LABEL_9:
  uint64_t v11 = (void *)PKCloudStorePassesSyncSecureContainerName;
  id v12 = v6;
  id v13 = v11;
  if (v13 == v12)
  {

LABEL_15:
    uint64_t v10 = [(PDCloudStoreNotificationCoordinator *)self passSyncSecureContainer];
    goto LABEL_16;
  }
  id v14 = v13;
  if (v6 && v13)
  {
    unsigned int v15 = [v12 isEqualToString:v13];

    if (!v15) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }

LABEL_18:
  id v16 = 0;
LABEL_19:

  return v16;
}

- (void)_shareRequest_shareForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 containerName];
  unsigned int v9 = [v6 zoneName];
  [(PDCloudStoreNotificationCoordinator *)self _containerWithIdentifier:v8];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1003CBADC;
  v14[3] = &unk_100730550;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v9;
  id v17 = v6;
  id v18 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v9;
  id v13 = v15;
  [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v13 operationGroupNameSuffix:0 completion:v14];
}

- (void)_shareRequest_requestKeysForRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [v7 recipientHandle];
  unsigned int v9 = [v7 invitation];

  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requesting zone share data from handle %@, %@", buf, 0x16u);
  }

  sharingIDSManger = self->_sharingIDSManger;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003CBDF4;
  v13[3] = &unk_1007378B8;
  id v14 = v6;
  id v12 = v6;
  [(PKSharingIDSManager *)sharingIDSManger requestCloudStoreZoneInvitationData:v9 forHandle:v8 completion:v13];
}

- (void)_shareRequest_bootstrapZoneRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [v7 zoneName];
  unsigned int v9 = [v7 containerName];

  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    id v14 = v8;
    __int16 v15 = 2114;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Bootstrapping zone %{public}@ in container %{public}@", (uint8_t *)&v13, 0x16u);
  }

  id v11 = [(PDCloudStoreNotificationCoordinator *)self _containerWithIdentifier:v9];
  id v12 = [(PDCloudStoreNotificationCoordinator *)self applePayContainer];

  if (v11 == v12) {
    [v11 bootstrapZoneWithName:v8 completion:v6];
  }
  else {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)recreateAllZonesInContainerWithZoneName:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(PDCloudStoreNotificationCoordinator *)self _containerWithZoneName:a3 scope:2];
  BOOL v8 = v7;
  if (v7)
  {
    unsigned int v9 = [v7 containerManager];
    id v10 = [v9 containerName];

    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Recreating zones in container %{public}@", buf, 0xCu);
    }

    uint64_t v12 = PKCloudStoreOperationGroupSuffixServerPush;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1003CC168;
    v15[3] = &unk_100730550;
    id v16 = v10;
    __int16 v17 = self;
    id v18 = v8;
    id v19 = v6;
    id v13 = v10;
    [v18 invalidateCloudStoreWithOperationGroupNameSuffix:v12 clearCache:1 resultOfZoneRecreation:1 completion:v15];
  }
  else if (v6)
  {
    id v14 = [(PDCloudStoreNotificationCoordinator *)self _errorWithCode:-4009 description:@"Cannot initialize a nil container"];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v14);
  }
}

- (void)recreateZones:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 firstObject];
  unsigned int v9 = [(PDCloudStoreNotificationCoordinator *)self _containerWithZoneName:v8 scope:2];

  if (v9)
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Recreating zones %{public}@", buf, 0xCu);
    }

    uint64_t v11 = PKCloudStoreOperationGroupSuffixServerPush;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1003CC640;
    v13[3] = &unk_100730550;
    id v14 = v6;
    __int16 v15 = self;
    id v16 = v9;
    id v17 = v7;
    [v16 invalidateCloudStoreWithOperationGroupNameSuffix:v11 clearCache:1 resultOfZoneRecreation:1 zoneNames:v14 completion:v13];
  }
  else if (v7)
  {
    uint64_t v12 = [(PDCloudStoreNotificationCoordinator *)self _errorWithCode:-4009 description:@"Cannot initialize a nil container"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

- (void)cloudStoreContainer:(id)a3 createdZoneWithName:(id)a4 forContainerName:(id)a5 scope:(int64_t)a6
{
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v11 = [(NSHashTable *)self->_observers allObjects];
  os_unfair_lock_unlock(&self->_lock);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1003CCA54;
  v14[3] = &unk_10074EEB8;
  void v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  int64_t v17 = a6;
  id v12 = v10;
  id v13 = v9;
  [v11 enumerateObjectsUsingBlock:v14];
}

- (void)cloudStoreContainer:(id)a3 didChangeContainerState:(unint64_t)a4
{
  id v6 = a3;
  if (a4 - 2 >= 2)
  {
    if (a4 != 1) {
      goto LABEL_6;
    }
    id v7 = v6;
    [(PDCloudStoreNotificationCoordinator *)self _registerForPushNotifications];
  }
  else
  {
    id v7 = v6;
    [(PDCloudStoreNotificationCoordinator *)self _unregisterForPushNotifications];
  }
  id v6 = v7;
LABEL_6:
}

- (void)cloudStoreContainerShouldUnscheduleAllBackgroundActivities:(id)a3
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "cloudStoreManagerShouldUnscheduleAllBackgroundActivities delegate called", v5, 2u);
  }

  [(PDCloudStoreNotificationCoordinator *)self _unscheduleBackgroundContainerSetupActivities];
}

- (void)cloudStoreContainer:(id)a3 sendZoneShareInvitationForHandle:(id)a4 zoneName:(id)a5 permission:(int64_t)a6 qualitOfService:(int64_t)a7 completion:(id)a8
{
  id v14 = a4;
  id v15 = a8;
  id v16 = a5;
  int64_t v17 = [a3 containerManager];
  id v18 = [v17 containerName];

  id v19 = [PDCloudStoreShareInvitationCreateKeysRequest alloc];
  id v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  id v25 = sub_1003CCCA8;
  unsigned __int8 v26 = &unk_10074EEE0;
  id v29 = v15;
  int64_t v30 = a7;
  id v27 = v14;
  v28 = self;
  id v20 = v14;
  id v21 = v15;
  id v22 = [(PDCloudStoreShareInvitationCreateKeysRequest *)v19 initWithHandle:v20 permission:a6 zoneName:v16 containerName:v18 completion:&v23];

  -[PDCloudStoreShareInvitationRequest setQualityOfService:](v22, "setQualityOfService:", a7, v23, v24, v25, v26);
  [(PDCloudStoreNotificationCoordinator *)self _executeShareInvitationRequest:v22];
}

- (void)cloudStoreContainer:(id)a3 sendZoneShareInvitation:(id)a4 recipientHandle:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Request to send zone share invitation %@ to %@", buf, 0x16u);
  }

  id v13 = [PDCloudStoreShareInvitationSendKeysRequest alloc];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1003CD018;
  v16[3] = &unk_10074EDA8;
  id v17 = v11;
  id v14 = v11;
  id v15 = [(PDCloudStoreShareInvitationSendKeysRequest *)v13 initWithInvitation:v9 recipientHandle:v10 completion:v16];
  [(PDCloudStoreNotificationCoordinator *)self _executeShareInvitationRequest:v15];
}

- (void)cloudStoreContainer:(id)a3 removeZoneShareInvitationForHandle:(id)a4 zoneName:(id)a5 qualitOfService:(int64_t)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [PDCloudStoreShareInvitationRequestDeclineRequest alloc];
  id v17 = [v15 containerManager];

  id v18 = [v17 containerName];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1003CD1FC;
  v21[3] = &unk_10074EDA8;
  id v22 = v12;
  id v19 = v12;
  __int16 v20 = [(PDCloudStoreShareInvitationRequestDeclineRequest *)v16 initWithHandle:v14 zoneName:v13 containerName:v18 completion:v21];

  [(PDCloudStoreShareInvitationRequest *)v20 setQualityOfService:a6];
  [(PDCloudStoreNotificationCoordinator *)self _executeShareInvitationRequest:v20];
}

- (void)cloudStoreContainer:(id)a3 requestsZoneShareFromHandle:(id)a4 zoneName:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init((Class)PKCloudStoreZoneInvitation);
  [v14 setZoneName:v11];

  id v15 = [v13 containerManager];

  id v16 = [v15 containerName];
  [v14 setContainerIdentifier:v16];

  id v17 = [PDCloudStoreShareInvitationRequestKeys alloc];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1003CD3F4;
  v20[3] = &unk_10074EDA8;
  id v21 = v10;
  id v18 = v10;
  id v19 = [(PDCloudStoreShareInvitationRequestKeys *)v17 initWithInvitation:v14 recipientHandle:v12 completion:v20];

  [(PDCloudStoreNotificationCoordinator *)self _executeShareInvitationRequest:v19];
}

- (void)cloudStoreContainer:(id)a3 requestsSyncTransactionsToCloudStoreOriginatedOnDevice:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(PDCloudStoreNotificationCoordinator *)self applePayContainer];

  if (v7 == v6)
  {
    BOOL v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v9 = @"ANY";
      if (a4 == 2) {
        CFStringRef v9 = @"NO";
      }
      if (a4 == 1) {
        CFStringRef v9 = @"YES";
      }
      int v10 = 138543362;
      CFStringRef v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "A call to schedule a background task to sync transaction to cloud stor originated on device %{public}@", (uint8_t *)&v10, 0xCu);
    }

    [(PDCloudStoreNotificationCoordinator *)self scheduleTransactionDeviceDataSyncBackgroundActivityOriginatedOnDevice:a4];
  }
}

- (void)cloudStoreContainer:(id)a3 reinitializeContainerAndInvalidateFirst:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  uint64_t v8 = PKCloudStoreOperationGroupInitialSetup;
  if (v4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1003CD670;
    v9[3] = &unk_100732CB8;
    void v9[4] = self;
    id v10 = v6;
    [v10 invalidateCloudStoreWithOperationGroupNameSuffix:v8 clearCache:0 completion:v9];
  }
  else
  {
    [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v6 operationGroupNameSuffix:PKCloudStoreOperationGroupInitialSetup completion:&stru_10074EF20];
  }
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock(&self->_lock);
    if (![(NSHashTable *)self->_observers containsObject:v5]) {
      [(NSHashTable *)self->_observers addObject:v5];
    }
    os_unfair_lock_unlock(&self->_lock);
    id v4 = v5;
  }
}

- (void)unregisterObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)didReceiveCloudStoreZoneInvitation:(id)a3 invitationError:(id)a4 fromDestination:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  id v12 = [v8 description];
  [v11 safelyAddObject:v12];

  id v13 = [v10 description];
  [v11 safelyAddObject:v13];

  id v14 = [v8 containerIdentifier];
  id v15 = [(PDCloudStoreNotificationCoordinator *)self _containerWithIdentifier:v14];

  if ([v11 count])
  {
    id v16 = [v11 copy];
    [v15 reportContainerChangeSignpostEventType:43 stateName:0 objectNames:v16 changeToken:0 error:v9 operationGroupName:0 operationGroupNameSuffix:0];
  }
  else
  {
    [v15 reportContainerChangeSignpostEventType:43 stateName:0 objectNames:0 changeToken:0 error:v9 operationGroupName:0 operationGroupNameSuffix:0];
  }
  id v17 = PKLogFacilityTypeGetObject();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v18)
    {
      *(_DWORD *)buf = 138412546;
      id v32 = v8;
      __int16 v33 = 2112;
      id v34 = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Cannot accept invitation from IDS %@ with error %@", buf, 0x16u);
    }

    id v19 = (PDCloudStoreShareInvitationAcceptKeysRequest *)[objc_alloc((Class)PKCloudStoreError) initWithError:v9];
    if ([(PDCloudStoreShareInvitationAcceptKeysRequest *)v19 isParticipantMayNeedVerificationError])
    {
      __int16 v20 = [v8 containerIdentifier];
      v28 = [(PDCloudStoreNotificationCoordinator *)self _containerWithIdentifier:v20];

      id v21 = [PDCloudStoreShareBootstrapZoneRequest alloc];
      uint64_t v22 = PKCloudStoreTransactionsZoneName;
      [v28 containerManager];
      id v29 = v15;
      uint64_t v24 = v23 = v10;
      [v24 containerName];
      v26 = id v25 = self;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1003CDAEC;
      v30[3] = &unk_10074EF48;
      v30[4] = v25;
      id v27 = [(PDCloudStoreShareBootstrapZoneRequest *)v21 initWithZoneName:v22 containerName:v26 completion:v30];

      id v10 = v23;
      id v15 = v29;
      [(PDCloudStoreNotificationCoordinator *)v25 _executeShareInvitationRequest:v27];
    }
  }
  else
  {
    if (v18)
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Attemping to accept invitation from IDS %@", buf, 0xCu);
    }

    id v19 = [[PDCloudStoreShareInvitationAcceptKeysRequest alloc] initWithInvitation:v8 fromDestination:v10 completion:0];
    [(PDCloudStoreNotificationCoordinator *)self _executeShareInvitationRequest:v19];
  }
}

- (void)didRequestCloudStoreZoneInvitationData:(id)a3 fromDestination:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Checking if zone share invitation %@ can be shared to %@", buf, 0x16u);
  }

  id v9 = objc_alloc_init((Class)NSMutableArray);
  id v10 = [v6 description];
  [v9 safelyAddObject:v10];

  id v11 = [v7 description];
  [v9 safelyAddObject:v11];

  id v12 = [v6 containerIdentifier];
  id v13 = [(PDCloudStoreNotificationCoordinator *)self _containerWithIdentifier:v12];

  if ([v9 count])
  {
    id v14 = [v9 copy];
    [v13 reportContainerChangeSignpostEventType:44 stateName:0 objectNames:v14 changeToken:0 error:0 operationGroupName:0 operationGroupNameSuffix:0];
  }
  else
  {
    [v13 reportContainerChangeSignpostEventType:44 stateName:0 objectNames:0 changeToken:0 error:0 operationGroupName:0 operationGroupNameSuffix:0];
  }
  id v15 = [v7 idsDestination];
  id v16 = [v15 name];

  id v17 = [[PDCloudStoreShareInvitationValidateRequestKeys alloc] initWithInvitation:v6 recipientHandle:v16 completion:0];
  [(PDCloudStoreNotificationCoordinator *)self _executeShareInvitationRequest:v17];
}

- (void)removedFromCloudStoreZoneInvitation:(id)a3 fromDestination:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v6;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removed from cloud store zone with invitiation %@ from destination %@", buf, 0x16u);
  }

  id v9 = [v6 containerIdentifier];
  id v10 = [(PDCloudStoreNotificationCoordinator *)self _containerWithIdentifier:v9];

  id v11 = objc_alloc_init((Class)NSMutableArray);
  id v12 = [v6 description];
  [v11 safelyAddObject:v12];

  id v13 = [v7 description];
  [v11 safelyAddObject:v13];

  if ([v11 count])
  {
    id v14 = [v11 copy];
    [v10 reportContainerChangeSignpostEventType:42 stateName:0 objectNames:v14 changeToken:0 error:0 operationGroupName:0 operationGroupNameSuffix:0];
  }
  else
  {
    [v10 reportContainerChangeSignpostEventType:42 stateName:0 objectNames:0 changeToken:0 error:0 operationGroupName:0 operationGroupNameSuffix:0];
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1003CDFB4;
  v18[3] = &unk_100730410;
  id v19 = v7;
  id v20 = v10;
  id v21 = v6;
  id v15 = v6;
  id v16 = v10;
  id v17 = v7;
  [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v16 operationGroupNameSuffix:0 completion:v18];
}

- (void)didReceiveCloudStoreZoneInvitationStatus:(int64_t)a3 forInvitation:(id)a4 fromDestination:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = PKCloudStoreZoneInvitationStatusToString();
    *(_DWORD *)buf = 138543874;
    id v32 = v11;
    __int16 v33 = 2112;
    id v34 = v8;
    __int16 v35 = 2112;
    id v36 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received cloud store zone share invitation status %{public}@ from invitation %@ from destination %@", buf, 0x20u);
  }
  id v12 = [v8 containerIdentifier];
  id v13 = [(PDCloudStoreNotificationCoordinator *)self _containerWithIdentifier:v12];

  id v14 = objc_alloc_init((Class)NSMutableArray);
  id v15 = [v8 description];
  [v14 safelyAddObject:v15];

  id v16 = [v9 description];
  [v14 safelyAddObject:v16];

  id v17 = PKCloudStoreZoneInvitationStatusToString();
  if ([v14 count])
  {
    id v18 = [v14 copy];
    [v13 reportContainerChangeSignpostEventType:41 stateName:v17 objectNames:v18 changeToken:0 error:0 operationGroupName:0 operationGroupNameSuffix:0];
  }
  else
  {
    [v13 reportContainerChangeSignpostEventType:41 stateName:v17 objectNames:0 changeToken:0 error:0 operationGroupName:0 operationGroupNameSuffix:0];
  }

  if (a3 == 3)
  {
    id v19 = [v9 idsDestination];
    id v20 = [v19 name];

    id v21 = [v8 zoneName];
    uint64_t v22 = [v8 containerIdentifier];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v32 = v20;
      __int16 v33 = 2112;
      id v34 = v21;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "The cloud store share invitation failed and %@ is asking us to removing them and re-add them to the share for zone %@. This means they have probably lost the keys and cannot accept the share.", buf, 0x16u);
    }

    [(PDCloudStoreNotificationCoordinator *)self _containerWithIdentifier:v22];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1003CE394;
    v26[3] = &unk_10074EF70;
    void v26[4] = self;
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    id v28 = v20;
    id v29 = v21;
    id v30 = v8;
    id v23 = v21;
    id v24 = v20;
    id v25 = v27;
    [(PDCloudStoreNotificationCoordinator *)self _declineInvitationForRecipientHandle:v24 zoneName:v23 containerName:v22 qualityOfService:17 shouldAlertRecipient:0 completion:v26];
  }
}

- (void)checkTLKsMissingWithCompletion:(id)a3
{
  id v3 = a3;
  id v11 = 0;
  id v4 = +[CKKSControl controlObject:&v11];
  id v5 = v11;
  if (!v5)
  {
    uint64_t v8 = PKCloudKitApplePayView;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1003CE6BC;
    v9[3] = &unk_1007304D8;
    id v10 = v3;
    [v4 rpcTLKMissing:v8 reply:v9];
    id v7 = v10;
    goto LABEL_7;
  }
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Could not check missing TLKs issue because of CKKSControl error: %@", buf, 0xCu);
  }

  if (v3)
  {
    id v7 = CKXPCSuitableError();
    (*((void (**)(id, void, void *))v3 + 2))(v3, 0, v7);
LABEL_7:
  }
}

- (void)resetApplePayManateeViewWithCompletion:(id)a3
{
  id v3 = a3;
  id v12 = 0;
  id v4 = +[CKKSControl controlObject:&v12];
  id v5 = v12;
  id v6 = PKLogFacilityTypeGetObject();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting TLKs reset...", buf, 2u);
    }

    uint64_t v9 = PKCloudKitApplePayView;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1003CE968;
    v10[3] = &unk_1007378B8;
    id v11 = v3;
    [v4 rpcResetCloudKit:v9 reason:@"tlk-missing-wallet" reply:v10];
    uint64_t v8 = v11;
    goto LABEL_9;
  }
  if (v7)
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Could not reset apple pay manatee view because of CKKSControl error: %@", buf, 0xCu);
  }

  if (v3)
  {
    uint64_t v8 = CKXPCSuitableError();
    (*((void (**)(id, void, void *))v3 + 2))(v3, 0, v8);
LABEL_9:
  }
}

- (void)noteAccountAdded
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PDCloudStoreNotificationCoordinator: the primary Apple Account has been set. Forcing container reinitialization.", buf, 2u);
  }

  id v4 = [(PDCloudStoreNotificationCoordinator *)self passSyncContainer];
  if (v4)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up PDPassSyncCloudStoreContainer standard again.", v9, 2u);
    }

    [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v4 operationGroupNameSuffix:PKCloudStoreOperationGroupSuffixPKICloudAccountSignIn completion:&stru_10074EF90];
  }
  id v5 = [(PDCloudStoreNotificationCoordinator *)self passSyncSecureContainer];
  if (v5)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up PDPassSyncCloudStoreContainer secure again.", v8, 2u);
    }

    [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v5 operationGroupNameSuffix:PKCloudStoreOperationGroupSuffixPKICloudAccountSignIn completion:&stru_10074EFB0];
  }
  id v6 = [(PDCloudStoreNotificationCoordinator *)self passContainer];
  if (v6)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up PDPassCloudStoreContainer again.", v7, 2u);
    }

    [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v6 operationGroupNameSuffix:PKCloudStoreOperationGroupSuffixPKICloudAccountSignIn completion:&stru_10074EFD0];
  }
}

- (void)noteCloudSyncPassesSwitchChanged
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PDCloudStoreNotificationCoordinator: The primary Apple Account has changed. Forcing container reload.", buf, 2u);
  }

  id v4 = [(PDCloudStoreNotificationCoordinator *)self passSyncContainer];
  if (v4)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reloading standard PDPassSyncCloudStoreContainer.", v7, 2u);
    }

    [v4 reload];
  }
  id v5 = [(PDCloudStoreNotificationCoordinator *)self passSyncSecureContainer];
  if (v5)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reloading secure PDPassSyncCloudStoreContainer.", v6, 2u);
    }

    [v5 reload];
  }
}

- (void)noteAccountDeleted
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PDCloudStoreNotificationCoordinator: The primary Apple Account has been deleted.", buf, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_containers;
  id v5 = self->_applePayContainer;
  currentShareRequest = self->_currentShareRequest;
  self->_currentShareRequest = 0;

  [(NSMutableOrderedSet *)self->_shareRequests removeAllObjects];
  os_unfair_lock_unlock(&self->_lock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v7 = v4;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    uint64_t v11 = PKCloudStoreOperationGroupSuffixPKICloudAccountSignOut;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(PDApplePayCloudStoreContainer **)(*((void *)&v14 + 1) + 8 * (void)v12);
        if (v13 != v5) {
          -[PDCloudStoreContainer invalidateCloudStoreWithOperationGroupNameSuffix:clearCache:completion:](v13, "invalidateCloudStoreWithOperationGroupNameSuffix:clearCache:completion:", v11, 1, 0, (void)v14);
        }
        id v12 = (char *)v12 + 1;
      }
      while (v9 != v12);
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v32 = 138412290;
    id v33 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Background cloud store setup activity fired with identifier %@.", (uint8_t *)&v32, 0xCu);
  }

  id v9 = (__CFString *)v6;
  uint64_t v10 = v9;
  if (v9 == @"ContainerSetupShortInterval") {
    goto LABEL_6;
  }
  if (v9)
  {
    unsigned int v11 = [(__CFString *)v9 isEqualToString:@"ContainerSetupShortInterval"];

    if (v11)
    {
LABEL_6:
      id v12 = self;
      uint64_t v13 = 0;
      uint64_t v14 = 1;
LABEL_14:
      [(PDCloudStoreNotificationCoordinator *)v12 _performCloudStoreContainerInitalizationBackgroundActivityWithCurrentInterval:v13 nextBackgroundInterval:v14];
      goto LABEL_22;
    }
    long long v15 = v10;
    if (v15 == @"ContainerSetupMediumInterval"
      || (long long v16 = v15,
          unsigned int v17 = [(__CFString *)v15 isEqualToString:@"ContainerSetupMediumInterval"], v16, v17))
    {
      id v12 = self;
      uint64_t v13 = 1;
LABEL_13:
      uint64_t v14 = 2;
      goto LABEL_14;
    }
    id v18 = v16;
    if (v18 == @"ContainerSetupLongInterval"
      || (id v19 = v18,
          unsigned int v20 = [(__CFString *)v18 isEqualToString:@"ContainerSetupLongInterval"], v19, v20))
    {
      id v12 = self;
      uint64_t v13 = 2;
      goto LABEL_13;
    }
  }
  if ([(__CFString *)v10 isEqualToString:@"PDCloudStoreSyncTransactionDeviceDataActivityIDThisDevice"])
  {
    id v21 = self;
    uint64_t v22 = 1;
LABEL_21:
    [(PDCloudStoreNotificationCoordinator *)v21 _syncTransactionsToCloudStoreOriginatedOnDevice:v22];
    goto LABEL_22;
  }
  if ([(__CFString *)v10 isEqualToString:@"PDCloudStoreSyncTransactionDeviceDataActivityIDAny"])
  {
    id v21 = self;
    uint64_t v22 = 0;
    goto LABEL_21;
  }
  if ([(__CFString *)v10 isEqualToString:@"PDCloudStoreSyncTransactionDeviceDataActivityIDNotThisDevice"])
  {
    id v21 = self;
    uint64_t v22 = 2;
    goto LABEL_21;
  }
  id v23 = v10;
  if (v23 == @"PDPassSyncActivityIdentifier") {
    goto LABEL_26;
  }
  if (!v10) {
    goto LABEL_22;
  }
  id v24 = v23;
  unsigned int v25 = [(__CFString *)v23 isEqualToString:@"PDPassSyncActivityIdentifier"];

  if (v25)
  {
LABEL_26:
    [(PDCloudStoreNotificationCoordinator *)self _performPassSyncBackgroundActivity];
    goto LABEL_22;
  }
  unsigned __int8 v26 = v24;
  if (v26 == @"PDPassChangesActivityIdentifier"
    || (id v27 = v26,
        unsigned int v28 = [(__CFString *)v26 isEqualToString:@"PDPassChangesActivityIdentifier"], v27, v28))
  {
    [(PDCloudStoreNotificationCoordinator *)self _performPassChangesBackgroundActivity];
  }
  else
  {
    id v29 = v27;
    if (v29 == @"PDCloudStoreZoneShareIntegrityActivityID"
      || (id v30 = v29,
          unsigned int v31 = [(__CFString *)v29 isEqualToString:@"PDCloudStoreZoneShareIntegrityActivityID"], v30, v31))
    {
      [(PDCloudStoreNotificationCoordinator *)self _performZoneShareIntegrityOperation];
    }
  }
LABEL_22:
}

- (void)_performCloudStoreContainerInitalizationBackgroundActivityWithCurrentInterval:(unint64_t)a3 nextBackgroundInterval:(unint64_t)a4
{
  id v7 = [(PDCloudStoreNotificationCoordinator *)self applePayContainer];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003CF4E8;
  v8[3] = &unk_10074EFF8;
  void v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v7 operationGroupNameSuffix:0 shouldScheduleBackgroundActivity:0 completion:v8];
}

- (void)scheduleTransactionDeviceDataSyncBackgroundActivityOriginatedOnDevice:(unint64_t)a3
{
  id v4 = @"PDCloudStoreSyncTransactionDeviceDataActivityIDAny";
  if (a3 == 2) {
    id v4 = @"PDCloudStoreSyncTransactionDeviceDataActivityIDNotThisDevice";
  }
  if (a3 == 1) {
    id v4 = @"PDCloudStoreSyncTransactionDeviceDataActivityIDThisDevice";
  }
  id v5 = v4;
  if ((PDScheduledActivityExists() & 1) == 0)
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v7 = @"ANY";
      if (a3 == 2) {
        CFStringRef v7 = @"NO";
      }
      if (a3 == 1) {
        CFStringRef v7 = @"YES";
      }
      int v10 = 138412290;
      CFStringRef v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Scheduling background task to sync transaction device data to cloud store originating from device %@.", (uint8_t *)&v10, 0xCu);
    }

    id v8 = PDDefaultQueue();
    PDScheduledActivityClientRegister();

    id v9 = +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:0];
    [v9 setRequireNetworkConnectivity:1];
    [v9 setRequireMainsPower:1];
    [v9 setRepeating:0];
    PDScheduledActivityRegister();
  }
}

- (void)_syncTransactionsToCloudStoreOriginatedOnDevice:(unint64_t)a3
{
  id v5 = [(PDCloudStoreNotificationCoordinator *)self applePayContainer];
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"ANY";
    if (a3 == 2) {
      CFStringRef v7 = @"NO";
    }
    if (a3 == 1) {
      CFStringRef v7 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "syncOriginatingTransactionsToCloudStore called originating from device %@.", buf, 0xCu);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003CF844;
  v9[3] = &unk_10074F020;
  id v10 = v5;
  unint64_t v11 = a3;
  id v8 = v5;
  [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v8 operationGroupNameSuffix:0 completion:v9];
}

- (void)schedulePassSyncBackgroundActivity
{
  if (PKCloudKitPassSyncEnabled())
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Scheduling background task to sync passes transaction", v5, 2u);
    }

    id v3 = PDDefaultQueue();
    PDScheduledActivityClientRegister();

    id v4 = +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:0];
    [v4 setRequireNetworkConnectivity:1];
    [v4 setRequireMainsPower:0];
    [v4 setRepeating:1];
    [v4 setRepeatInterval:43200.0];
    PDScheduledActivityRegister();
  }
}

- (void)schedulePassChangesBackgroundActivity
{
  if (PKCloudKitPassSyncEnabled())
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Scheduling background task to process changes", v5, 2u);
    }

    id v3 = PDDefaultQueue();
    PDScheduledActivityClientRegister();

    id v4 = +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:0];
    [v4 setRequireNetworkConnectivity:1];
    [v4 setRequireMainsPower:0];
    [v4 setRepeating:1];
    [v4 setRepeatInterval:2700.0];
    PDScheduledActivityRegister();
  }
}

- (void)_performPassSyncBackgroundActivity
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Performing scheduled background pass sync", v6, 2u);
  }

  id v4 = [(PDCloudStoreNotificationCoordinator *)self passSyncContainer];
  [v4 synchronizeWithReason:1];

  id v5 = [(PDCloudStoreNotificationCoordinator *)self passSyncSecureContainer];
  [v5 synchronizeWithReason:1];
}

- (void)_performPassChangesBackgroundActivity
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Performing scheduled background pass changes processing", v6, 2u);
  }

  id v4 = [(PDCloudStoreNotificationCoordinator *)self passSyncContainer];
  [v4 processPendingChangesWithReason:1];

  id v5 = [(PDCloudStoreNotificationCoordinator *)self passSyncSecureContainer];
  [v5 processPendingChangesWithReason:1];
}

- (void)refetchAccountEventsWithUnknownServicingStatusWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PDDatabaseManager *)self->_databaseManager identifiersForAccountServicingEventsWithStatus:0];
    id v6 = [(PDCloudStoreNotificationCoordinator *)self applePayContainer];
    uint64_t v7 = PKCloudStoreOperationGroupSuffixAccountServicingEventProcessing;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1003CFDA0;
    v9[3] = &unk_100736340;
    id v10 = v5;
    id v11 = v4;
    void v9[4] = self;
    id v8 = v5;
    [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v6 operationGroupNameSuffix:v7 completion:v9];
  }
}

- (void)_scheduleZoneShareIntegrityActivityForTimeInterval:(double)a3
{
  if (a3 >= 0.0)
  {
    if (PDScheduledActivityExists()) {
      PDScheduledActivityRemove();
    }
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      double v10 = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Scheduling a timer to check the zone share integrity in %f seconds.", (uint8_t *)&v9, 0xCu);
    }

    if (a3 == 0.0)
    {
      id v6 = 0;
    }
    else
    {
      id v5 = +[NSDate date];
      id v6 = [v5 dateByAddingTimeInterval:a3];
    }
    uint64_t v7 = PDDefaultQueue();
    PDScheduledActivityClientRegister();

    id v8 = +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:v6];
    [v8 setRepeating:0];
    PDScheduledActivityRegister();
  }
}

- (void)_performZoneShareIntegrityOperation
{
  id v3 = [(PDCloudStoreNotificationCoordinator *)self applePayContainer];
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Zone share integrity activity did fire", buf, 2u);
  }

  applePayContainer = self->_applePayContainer;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003D026C;
  v7[3] = &unk_100732CB8;
  id v8 = v3;
  int v9 = self;
  id v6 = v3;
  [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:applePayContainer operationGroupNameSuffix:0 completion:v7];
}

- (void)_scheduleCloudStoreContainerSetupBackgroundActivityWithNextInterval:(unint64_t)a3
{
  id v5 = -[PDCloudStoreNotificationCoordinator _backgroundActivityNameForBackgroundInterval:](self, "_backgroundActivityNameForBackgroundInterval:");
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Scheduling cloud store setup background activity with activity name \"%@\".", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v7 = PDDefaultQueue();
  PDScheduledActivityClientRegister();

  id v8 = +[NSDate date];
  [(PDCloudStoreNotificationCoordinator *)self _nextTimeIntervalForBackgroundInterval:a3];
  int v9 = objc_msgSend(v8, "dateByAddingTimeInterval:");

  double v10 = +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:v9];
  [v10 setRepeating:0];
  [v10 setRequireNetworkConnectivity:1];
  [v10 setRequireMainsPower:a3 == 2];
  PDScheduledActivityRegister();
}

- (double)_nextTimeIntervalForBackgroundInterval:(unint64_t)a3
{
  if (a3 == 2)
  {
    BOOL v4 = PKForceCloudStoreInitializationFailure() == 0;
    double result = 86400.0;
    double v5 = 300.0;
  }
  else if (a3 == 1)
  {
    BOOL v4 = PKForceCloudStoreInitializationFailure() == 0;
    double result = 3600.0;
    double v5 = 180.0;
  }
  else
  {
    double result = 0.0;
    if (a3) {
      return result;
    }
    BOOL v4 = PKForceCloudStoreInitializationFailure() == 0;
    double result = 300.0;
    double v5 = 60.0;
  }
  if (!v4) {
    return v5;
  }
  return result;
}

- (id)_backgroundActivityNameForBackgroundInterval:(unint64_t)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return *(&off_10074F090 + a3);
  }
}

- (void)_recordAggdCloudStoreBackgroundContainerSetupResult:(BOOL)a3 forCurrentBackgroundInterval:(unint64_t)a4
{
  if (a4 == 2)
  {
    CFStringRef v8 = @"success";
    BOOL v4 = +[NSNumber numberWithBool:a3];
    int v9 = v4;
    double v5 = &v9;
    id v6 = &v8;
  }
  else if (a4 == 1)
  {
    CFStringRef v10 = @"success";
    BOOL v4 = +[NSNumber numberWithBool:a3];
    int v11 = v4;
    double v5 = &v11;
    id v6 = &v10;
  }
  else
  {
    if (a4) {
      return;
    }
    CFStringRef v12 = @"success";
    BOOL v4 = +[NSNumber numberWithBool:a3];
    CFStringRef v13 = v4;
    double v5 = &v13;
    id v6 = &v12;
  }
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v6 count:1];
  PKAnalyticsSendEvent();
}

- (void)_scheduleFirstCloudStoreContainerSetupBackgroundActivityIfNeccessary
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Trying to schedule a background task to setup transaction container again...", buf, 2u);
  }

  if ([(PDCloudStoreNotificationCoordinator *)self _shouldScheduleInitalCloudStoreContainerSetupBackgroundActivity])
  {
    [(PDCloudStoreNotificationCoordinator *)self _scheduleCloudStoreContainerSetupBackgroundActivityWithNextInterval:0];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "A cloud store background task is already scheduled.", v4, 2u);
    }
  }
}

- (BOOL)_shouldScheduleInitalCloudStoreContainerSetupBackgroundActivity
{
  if (PDScheduledActivityExists() & 1) != 0 || (PDScheduledActivityExists()) {
    return 0;
  }
  else {
    return PDScheduledActivityExists() ^ 1;
  }
}

- (void)_unscheduleBackgroundContainerSetupActivities
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Unscheduling cloud store setup activity.", v3, 2u);
  }

  PDScheduledActivityRemove();
  PDScheduledActivityRemove();
  PDScheduledActivityRemove();
}

- (id)pushNotificationTopics
{
  return self->_pushTopics;
}

- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received message from push topic: %@", buf, 0xCu);
  }

  int v9 = +[CKNotification notificationFromRemoteNotificationDictionary:v7];
  id v10 = [v9 notificationType];
  int v11 = [v9 containerIdentifier];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CloudKit push for container %@", buf, 0xCu);
  }

  switch((unint64_t)v10)
  {
    case 1uLL:
    case 3uLL:
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        id v28 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unexpected CloudKit push notification type %ld", buf, 0xCu);
      }
      CFStringRef v12 = v8;
      goto LABEL_33;
    case 2uLL:
      long long v15 = v9;
      long long v16 = [v15 recordZoneID];
      CFStringRef v12 = [v16 zoneName];

      uint64_t v14 = (uint64_t)[v15 databaseScope];
      CFStringRef v13 = CKDatabaseScopeString();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v28 = v12;
        __int16 v29 = 2114;
        id v30 = v13;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CloudKit push notification for record zone named \"%@\" scope: %{public}@", buf, 0x16u);
      }

      goto LABEL_16;
    case 4uLL:
      uint64_t v14 = (uint64_t)[v9 databaseScope];
      CFStringRef v13 = CKDatabaseScopeString();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v28 = v13;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CloudKit push notification for database scope \"%{public}@\"", buf, 0xCu);
      }
      CFStringRef v12 = 0;
      long long v15 = v8;
LABEL_16:

      goto LABEL_17;
    default:
      CFStringRef v13 = 0;
      CFStringRef v12 = 0;
      uint64_t v14 = 2;
LABEL_17:
      unsigned int v17 = [(PDCloudStoreNotificationCoordinator *)self _containerWithIdentifier:v11];
      id v18 = v17;
      if (v17)
      {
        unsigned __int8 v26 = v13;
        id v19 = [v17 containerManager];
        unsigned int v20 = [v19 databaseForScope:v14];

        if (!v20)
        {
          CFStringRef v13 = v26;
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v28 = v12;
            __int16 v29 = 2114;
            id v30 = v26;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "There is no database associated with zone %@ in scope %{public}@", buf, 0x16u);
          }
          goto LABEL_31;
        }
        id v25 = v7;
        id v21 = self;
        if (v12)
        {
          [v18 containerManager];
          v23 = id v22 = v6;
          uint64_t v24 = [v23 cloudStoreZoneForZoneName:v12 inContainerDatabase:v20];

          id v6 = v22;
          if (!v24)
          {
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v28 = v12;
              __int16 v29 = 2112;
              id v30 = v20;
              _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "There is no cloud store zone associated with zone %@ in database %@", buf, 0x16u);
            }
            goto LABEL_30;
          }
        }
        else
        {
          uint64_t v24 = 0;
        }
        -[PDCloudStoreNotificationCoordinator _processCloudStorePushNotificationForContainer:cloudStoreZone:containerDatabse:](v21, "_processCloudStorePushNotificationForContainer:cloudStoreZone:containerDatabse:", v18, v24, v20, v25);
        CFStringRef v8 = v24;
LABEL_30:
        id v7 = v25;
        CFStringRef v13 = v26;
LABEL_31:

        goto LABEL_32;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v12;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "There is no container associated with zone: %@", buf, 0xCu);
      }
      unsigned int v20 = v8;
LABEL_32:

LABEL_33:
      return;
  }
}

- (void)_processCloudStorePushNotificationForContainer:(id)a3 cloudStoreZone:(id)a4 containerDatabse:(id)a5
{
  id v8 = a3;
  unint64_t v9 = (unint64_t)a4;
  unint64_t v10 = (unint64_t)a5;
  [(id)v10 scope];
  int v11 = CKDatabaseScopeString();
  CFStringRef v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v13 = [(id)v9 zoneName];
    *(_DWORD *)buf = 138543618;
    id v29 = v13;
    __int16 v30 = 2114;
    unsigned int v31 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Beginning to process push for zone: %{public}@ in scope: %{public}@", buf, 0x16u);
  }
  uint64_t v14 = [v8 containerManager];
  long long v15 = [v14 allPossibleZoneIDsByDatabaseIdentifier];

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    long long v16 = [v8 containerManager];
    unsigned int v17 = [v16 containerName];
    *(_DWORD *)buf = 138412802;
    id v29 = v17;
    __int16 v30 = 2114;
    unsigned int v31 = v11;
    __int16 v32 = 2112;
    id v33 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "All possible zones for container \"%@\" in scope \"%{public}@\": %@", buf, 0x20u);
  }
  BOOL v18 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v9 | v10)
  {
    if (v18)
    {
      id v19 = [(id)v9 zoneName];
      *(_DWORD *)buf = 138412802;
      id v29 = v8;
      __int16 v30 = 2114;
      unsigned int v31 = v19;
      __int16 v32 = 2114;
      id v33 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Fetching changed records from CloudKit for container %@, zone name %{public}@, scope %{public}@", buf, 0x20u);
    }
    unsigned int v20 = [(id)v9 zoneName];
    if (v20)
    {
      id v21 = [(id)v9 zoneName];
      id v27 = v21;
      CFStringRef v12 = +[NSArray arrayWithObjects:&v27 count:1];
    }
    else
    {
      CFStringRef v12 = 0;
    }

    [v8 reportContainerChangeSignpostEventType:14 stateName:0 objectNames:v12 changeToken:0 error:0 operationGroupName:PKCloudStoreOperationGroupPushTriggered operationGroupNameSuffix:PKCloudStoreOperationGroupSuffixServerPush];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1003D1118;
    v22[3] = &unk_10072F278;
    id v23 = v8;
    uint64_t v24 = self;
    id v25 = (id)v9;
    id v26 = (id)v10;
    [(PDCloudStoreNotificationCoordinator *)self _initialCloudDatabaseSetupForContainer:v23 operationGroupNameSuffix:0 completion:v22];
  }
  else if (v18)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Either a cloud store zone or container database in order to process cloud store push. Bailing out.", buf, 2u);
  }
}

- (void)applyPushNotificationToken:(id)a3
{
  BOOL v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received push token %@", (uint8_t *)&v5, 0xCu);
  }
}

- (id)_containerWithZoneName:(id)a3 scope:(int64_t)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  __int16 v30 = sub_100020D3C;
  unsigned int v31 = sub_100021190;
  id v32 = 0;
  os_unfair_lock_lock(&self->_lock);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obj = self->_containers;
  id v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v24;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        unint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        int v11 = [v10 containerManager];
        CFStringRef v12 = [v11 databaseForScope:a4];

        CFStringRef v13 = [v10 containerManager];
        uint64_t v14 = [v13 allPossibleZoneIDsInContainerDatabase:v12];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1003D177C;
        v19[3] = &unk_10074F070;
        id v15 = v6;
        id v21 = v10;
        id v22 = &v27;
        id v20 = v15;
        [v14 enumerateObjectsUsingBlock:v19];
      }
      id v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_lock);
  id v16 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v16;
}

- (id)_containerWithIdentifier:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = self->_containers;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v7) {
    goto LABEL_17;
  }
  uint64_t v8 = *(void *)v19;
  while (2)
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v6);
      }
      unint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      int v11 = objc_msgSend(v10, "containerManager", (void)v18);
      CFStringRef v12 = [v11 containerName];

      id v13 = v4;
      id v14 = v12;
      if (v14 == v13)
      {

        goto LABEL_16;
      }
      id v15 = v14;
      if (v4 && v14)
      {
        id v16 = [v13 caseInsensitiveCompare:v14];

        if (!v16)
        {
          id v13 = v15;
LABEL_16:
          id v7 = v10;

          goto LABEL_17;
        }
      }
      else
      {
      }
    }
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_17:

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)_errorWithCode:(int64_t)a3 description:(id)a4
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

- (id)_containerForItemType:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (a3 - 1 > 9) {
    id v6 = 0;
  }
  else {
    id v6 = *(id *)((char *)&self->super.isa + qword_1005B3A00[a3 - 1]);
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)_registerForPushNotifications
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering for CloudKit push notifications", v4, 2u);
  }

  [(PDPushNotificationManager *)self->_pushNotificationManager registerConsumer:self];
  [(PDPushNotificationManager *)self->_pushNotificationManager recalculatePushTopics];
}

- (void)_unregisterForPushNotifications
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_containers;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) isSetup])
        {

          os_unfair_lock_unlock(p_lock);
          return;
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  os_unfair_lock_unlock(p_lock);
  unint64_t v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unregistering for CloudKit push notifications", v10, 2u);
  }

  [(PDPushNotificationManager *)self->_pushNotificationManager unregisterConsumer:self];
  [(PDPushNotificationManager *)self->_pushNotificationManager recalculatePushTopics];
}

- (BOOL)hasCachedCloudStoreZoneInApplePayContainerForZoneNames:(id)a3
{
  id v4 = a3;
  id v5 = [(PDCloudStoreContainer *)self->_applePayContainer containerManager];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(v5, "cloudStoreZoneExistsForZoneName:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

- (id)changeHistoryForContainerIdentifier:(id)a3
{
  return [(PDDatabaseManager *)self->_databaseManager cloudStoreContainerChangeEventsForContainerIdentifier:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareRequests, 0);
  objc_storeStrong((id *)&self->_currentShareRequest, 0);
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_pushTopics, 0);
  objc_storeStrong((id *)&self->_applePayContainer, 0);
  objc_storeStrong((id *)&self->_passSyncSecureContainer, 0);
  objc_storeStrong((id *)&self->_passSyncContainer, 0);
  objc_storeStrong((id *)&self->_passContainer, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_sharingIDSManger, 0);
  objc_storeStrong((id *)&self->_pushNotificationManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end