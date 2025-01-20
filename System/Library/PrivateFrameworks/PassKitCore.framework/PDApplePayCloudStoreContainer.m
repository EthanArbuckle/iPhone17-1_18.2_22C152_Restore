@interface PDApplePayCloudStoreContainer
- (BOOL)_canFormShareFromCloudStoreRecord:(id)a3;
- (BOOL)_canFormShareLockFromCloudStoreRecord:(id)a3;
- (BOOL)_canFormTransactionFromCloudStoreRecord:(id)a3;
- (BOOL)_isAccountEventAssociatedObjectFromRecordType:(id)a3;
- (BOOL)_isAccountEventFromRecordType:(id)a3;
- (BOOL)_isAccountFromRecordType:(id)a3;
- (BOOL)_isCloudStoreZoneThePrimaryZoneForCurrentUser:(id)a3 containerDatabase:(id)a4;
- (BOOL)_isTransactionItemFromRecordType:(id)a3;
- (BOOL)_queue_canInitializeContainer;
- (BOOL)_queue_canInvalidateContainer;
- (BOOL)_queue_canSyncTransactionToCloudKit:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (BOOL)_queue_isRelevantTransactionSourceIdentifier:(id)a3;
- (BOOL)canCoalesceRequest:(id)a3 withNewRequest:(id)a4;
- (BOOL)shouldContinueWithRequest:(id)a3;
- (BOOL)shouldForwardErrorsToRequestCompletionHandlers;
- (BOOL)supportsContainerChangeEventReports;
- (PDApplePayCloudStoreContainer)initWithDataSource:(id)a3 delegate:(id)a4 transactionProcessor:(id)a5 accountManager:(id)a6 paymentWebServiceCoordinator:(id)a7 peerPaymentWebServiceCoordinator:(id)a8 familyCircleManager:(id)a9 spotlightIndexer:(id)a10 notificationStreamManager:(id)a11;
- (id)_accountCreateDateForTranactionSourceIdentifier:(id)a3 passUniqueID:(id)a4;
- (id)_accountZoneNamesForAccount:(id)a3 containerDatabase:(id)a4;
- (id)_accountZoneNamesForAccountSet:(id)a3 containerDatabase:(id)a4;
- (id)_accountZoneNamesForAccountUser:(id)a3 containerDatabase:(id)a4;
- (id)_allPossibleCloudStoreZonesForFetchingWithTransactionSourceIdentifier:(id)a3;
- (id)_cloudStoreSpecificKeysForItem:(id)a3 paymentPass:(id)a4;
- (id)_originDeviceID;
- (id)_originDeviceIDForCloudStoreRecord:(id)a3;
- (id)_parseTransactionRecords:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 updateReasons:(unint64_t)a6;
- (id)_paymentApplicationForPassUniqueIdentifier:(id)a3;
- (id)_peerPaymentZoneNamesForAccount:(id)a3 containerDatabase:(id)a4;
- (id)_queue_additionalTransactionSourceIdentifiersForProvisioningWithZone:(id)a3 transactionSourceIdentifiers:(id)a4;
- (id)_recordTypeForAccountEventRecord:(id)a3;
- (id)_recordsByFromAccountEvent:(id)a3 zone:(id)a4;
- (id)_stripToFirstDash:(id)a3;
- (id)_transactionSourceIdentifierForTransactionCloudStoreRecord:(id)a3 databaseIdentifier:(id)a4;
- (id)_transactionSourceIdentifierForTransactionRecordID:(id)a3 recordType:(id)a4 databaseIdentifier:(id)a5;
- (id)allPossibleZoneNamesForContainerDatabase:(id)a3;
- (id)allPossibleZoneNamesForContainerDatabase:(id)a3 itemType:(unint64_t)a4;
- (id)allPossibleZoneSubscriptionsForContainerDatabase:(id)a3;
- (id)cloudStoreSpecificKeysForItem:(id)a3;
- (id)cloudStoreZonesForItem:(id)a3 action:(unint64_t)a4 inContainerDatabase:(id)a5;
- (id)cloudStoreZonesForItemType:(unint64_t)a3 configuration:(id)a4 action:(unint64_t)a5 inContainerDatabase:(id)a6;
- (id)filterCloudStoreZones:(id)a3 action:(unint64_t)a4 inContainerDatabase:(id)a5;
- (id)identifierFromRecord:(id)a3;
- (id)possibleDatabaseSubscriptionForContainerDatabase:(id)a3;
- (id)primaryRecordTypesForCloudStoreItemType:(unint64_t)a3;
- (id)recordTypeFromRecordName:(id)a3;
- (id)recordTypesForCloudStoreItemType:(unint64_t)a3;
- (id)subscriptionForZone:(id)a3 inContainerDatabase:(id)a4;
- (id)zoneIDForSubscription:(id)a3 inContainerDatabase:(id)a4;
- (void)_addCloudStoreRecordsFromResponse:(id)a3 toTransactionSourceRecords:(id)a4 transactionSourceIdentifiers:(id)a5 passUniqueID:(id)a6;
- (void)_deleteLocalDataFromDeletedRecordsByDatabaseIdentifier:(id)a3;
- (void)_fetchAndStoreAppleCashItemWithRecordType:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 zone:(id)a6 containerDatabase:(id)a7 transactionSourceIdentifiers:(id)a8 accountCreationDate:(id)a9 completion:(id)a10;
- (void)_fetchAndStoreAppleCashRecordsIfNecessaryForPassUniqueID:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 completion:(id)a6;
- (void)_fetchMissingAccountEventsWithRecordParser:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 carriedOverRecordsByDatabaseIdentifier:(id)a6 updateReasons:(unint64_t)a7 completion:(id)a8;
- (void)_fetchMissingTransactionRecordsWithRecordParser:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 completion:(id)a6;
- (void)_fetchTaskOperationWithIdentifier:(id)a3 completedWithError:(id)a4;
- (void)_handleFamilyUpdateNotification:(id)a3;
- (void)_handlePeerPaymentAccountChanged:(id)a3;
- (void)_insertAccountBalanceUpdateNotificationIfNecessaryForAccount:(id)a3 record:(id)a4;
- (void)_parseAccountEventsFromRecordParser:(id)a3 databaseIdentifier:(id)a4 shouldUpdateLocalDatabase:(BOOL)a5 shouldReturn:(BOOL)a6 updateReasons:(unint64_t)a7 completion:(id)a8;
- (void)_parseAccountsFromRecordParser:(id)a3 databaseIdentifier:(id)a4 shouldUpdateLocalDatabase:(BOOL)a5 shouldReturn:(BOOL)a6 completion:(id)a7;
- (void)_processCounterpartImageDataWithRecordParser:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 completion:(id)a6;
- (void)_processRecurringPaymentsWithRecordParser:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 completion:(id)a6;
- (void)_processShareWithRecordParser:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 completion:(id)a6;
- (void)_processZoneShareLockWithRecordParser:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 completion:(id)a6;
- (void)_queue_aliasesForRecipientHandle:(id)a3 zoneName:(id)a4 completion:(id)a5;
- (void)_queue_cloudStoreAccountChanged:(id)a3;
- (void)_queue_cloudStoreZoneInvitationDataForInvitation:(id)a3 toRecipient:(id)a4 completion:(id)a5;
- (void)_queue_createOrRemoveZoneSharesForAccountsIfNecessaryWithCompletion:(id)a3;
- (void)_queue_createOrRemoveZoneSharesForPeerPaymentIfNecessaryWithCompletion:(id)a3;
- (void)_queue_createOrRemoveZoneSharesIfNecessaryWithCompletion:(id)a3;
- (void)_queue_didInvalidateContainer:(BOOL)a3;
- (void)_queue_ensureZoneShareIntegrity;
- (void)_queue_familyMembersByAltDSIDWithCompletion:(id)a3;
- (void)_queue_familyMembersWithCompletion:(id)a3;
- (void)_queue_markAllRunningFetchTasksWithError:(id)a3;
- (void)_queue_performFetchTasksBackgroundActivityForGroupName:(id)a3 suffix:(id)a4 completion:(id)a5;
- (void)_queue_performUnarchivedTransactionsBackgroundActivityForGroupName:(id)a3 suffix:(id)a4 completion:(id)a5;
- (void)_queue_processAccountChangeWithOldAccounts:(id)a3 newAccounts:(id)a4;
- (void)_queue_processPeerPaymentAccountChangeWithOldAccount:(id)a3 newPeerPaymentAccount:(id)a4;
- (void)_queue_processResultWithError:(id)a3 nextExpectedState:(unint64_t)a4 operationGroupNameSuffix:(id)a5 retryCount:(unint64_t)a6 shouldRetry:(BOOL)a7 completion:(id)a8;
- (void)_queue_processSharedAccountCloudStoreChangeWithOldSharedAccountCloudStore:(id)a3 newSharedAccountCloudStore:(id)a4;
- (void)_queue_setContainerState:(unint64_t)a3 operationGroupNameSuffix:(id)a4 retryCount:(unint64_t)a5 completion:(id)a6;
- (void)_queue_updateWithPossibleNewZonesToAdd:(id)a3 orphanedZones:(id)a4 containerDatabase:(id)a5;
- (void)_updateFetchTaskScheduledActivityIfNeccessary;
- (void)_updateUnarchivedTransactionsScheduledActivityIfNeccessary;
- (void)accountManager:(id)a3 accountUsersChanged:(id)a4 oldUsers:(id)a5 accountIdentifier:(id)a6;
- (void)accountManager:(id)a3 didAddAccount:(id)a4;
- (void)accountManager:(id)a3 didRemoveAccount:(id)a4;
- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5;
- (void)accountManager:(id)a3 sharedAccountCloudStoreChangedForAccountIdentifier:(id)a4;
- (void)backgroundModifiedRecordSyncForTranasctionSourceIdentifiers:(id)a3 fromDate:(id)a4 returnRecords:(BOOL)a5 formReport:(BOOL)a6 completion:(id)a7;
- (void)backgroundRecordChangedSyncForTranasctionSourceIdentifiers:(id)a3 completion:(id)a4;
- (void)bootstrapZoneWithName:(id)a3 completion:(id)a4;
- (void)canSyncTransactionFromCloudKitForTransactionSourceIdentifier:(id)a3 completion:(id)a4;
- (void)canSyncTransactionToCloudKit:(id)a3 forTransactionSourceIdentifier:(id)a4 completion:(id)a5;
- (void)coalesceApplePayRequest:(id)a3 withNewApplePayRequest:(id)a4;
- (void)coalesceRequest:(id)a3 withNewRequest:(id)a4;
- (void)containerResetCompletedWithSuccess:(BOOL)a3 error:(id)a4;
- (void)dealloc;
- (void)didUpdateSetupAssistantStateFrom:(unint64_t)a3 toState:(unint64_t)a4;
- (void)fetchAndStoreAccountEventsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)fetchRecordsInAcceptedZoneShare:(id)a3 databaseIdentifier:(id)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8;
- (void)generateRandomTransactionForTransactionSourceIdentifier:(id)a3 completion:(id)a4;
- (void)invalidateCloudStoreIfPossibleWithOperationGroupNameSuffix:(id)a3 clearCache:(BOOL)a4;
- (void)passDidDisappear:(id)a3;
- (void)passProvisioningDidStartForPassUniqueID:(id)a3 transactionSourceIdentifiers:(id)a4 ignoreExistingRecordHash:(BOOL)a5 groupNameSuffix:(id)a6 completion:(id)a7;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)populateEvents:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5;
- (void)processFetchedCloudStoreDataWithModifiedRecordsByDatabaseIdentifier:(id)a3 deletedRecordsByDatabaseIdentifier:(id)a4 carriedOverRecordsByDatabaseIdentifier:(id)a5 conflictingRecordsByDatabaseIdentifier:(id)a6 request:(id)a7 completion:(id)a8;
- (void)requestUpdatesForTransactionSourceIdentifier:(id)a3;
- (void)syncTransactionsToCloudStoreOriginatedOnDevice:(unint64_t)a3;
- (void)uploadCounterpartImageData:(id)a3 completion:(id)a4;
- (void)uploadRecurringPayment:(id)a3 completion:(id)a4;
- (void)uploadTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4 includeServerData:(BOOL)a5 completion:(id)a6;
@end

@implementation PDApplePayCloudStoreContainer

- (PDApplePayCloudStoreContainer)initWithDataSource:(id)a3 delegate:(id)a4 transactionProcessor:(id)a5 accountManager:(id)a6 paymentWebServiceCoordinator:(id)a7 peerPaymentWebServiceCoordinator:(id)a8 familyCircleManager:(id)a9 spotlightIndexer:(id)a10 notificationStreamManager:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v59 = a5;
  id v58 = a6;
  id v57 = a7;
  id v56 = a8;
  id v55 = a9;
  id v54 = a10;
  v60.receiver = self;
  v60.super_class = (Class)PDApplePayCloudStoreContainer;
  v19 = [(PDCloudStoreContainer *)&v60 initWithDataSource:v17 notificationStreamManager:a11];
  if (v19)
  {
    v19->_isInternalBuild = os_variant_has_internal_ui();
    objc_storeWeak((id *)&v19->_applePayContainerDelegate, v18);
    objc_storeStrong((id *)&v19->_transactionProcessor, a5);
    objc_storeStrong((id *)&v19->_accountManager, a6);
    objc_storeStrong((id *)&v19->_peerPaymentWebServiceCoordinator, a8);
    objc_storeStrong((id *)&v19->_familyCircleManager, a9);
    objc_storeStrong((id *)&v19->_spotlightIndexer, a10);
    v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    backgroundTasksBeingRun = v19->_backgroundTasksBeingRun;
    v19->_backgroundTasksBeingRun = v20;

    v22 = [(PDCloudStoreContainer *)v19 dataSource];
    uint64_t v23 = [v22 peerPaymentAccount];
    peerPaymentAccount = v19->_peerPaymentAccount;
    v19->_peerPaymentAccount = (PKPeerPaymentAccount *)v23;

    [(PDAccountManager *)v19->_accountManager registerObserver:v19];
    v25 = [(PDCloudStoreContainer *)v19 dataSource];
    uint64_t v26 = [v25 accounts];
    accounts = v19->_accounts;
    v19->_accounts = (NSSet *)v26;

    objc_storeStrong((id *)&v19->_paymentWebServiceCoordinator, a7);
    v28 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    fetchTasks = v19->_fetchTasks;
    v19->_fetchTasks = v28;

    v19->_fetchTasksLock._os_unfair_lock_opaque = 0;
    v30 = [(PDCloudStoreContainer *)v19 dataSource];
    uint64_t v31 = [v30 sharedAccountCloudStoreByAccountIdentifier];
    sharedAccountCloudStoreByAccountIdentifier = v19->_sharedAccountCloudStoreByAccountIdentifier;
    v19->_sharedAccountCloudStoreByAccountIdentifier = (NSDictionary *)v31;

    v33 = [(PDCloudStoreContainer *)v19 dataSource];
    uint64_t v34 = [v33 accountUsersByAccountIdentifier];
    accountUsersByAccountIdentifier = v19->_accountUsersByAccountIdentifier;
    v19->_accountUsersByAccountIdentifier = (NSDictionary *)v34;

    v36 = PKCurrentCloudStoreApplePayContainerName();
    id v37 = [objc_alloc((Class)CKContainerID) initWithContainerIdentifier:v36 environment:PKApplePayContainerEnvironment()];
    v38 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = CKContainerEnvironmentString();
      *(_DWORD *)buf = 138412546;
      v62 = v36;
      __int16 v63 = 2112;
      v64 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Creating container \"%@\" in environment \"%@\"", buf, 0x16u);
    }
    id v40 = objc_alloc_init((Class)CKContainerOptions);
    [v40 setApplicationBundleIdentifierOverride:PKPassdBundleIdentifier];
    id v41 = [objc_alloc((Class)CKContainer) initWithContainerID:v37 options:v40];
    v42 = (void *)PKCloudStoreApplePayPrototypeContainerName;
    id v43 = v36;
    id v44 = v42;
    if (v43 == v44)
    {
    }
    else
    {
      v45 = v44;
      if (!v43 || !v44)
      {

        v47 = v43;
        goto LABEL_12;
      }
      unsigned int v46 = [v43 isEqualToString:v44];

      if (!v46) {
        goto LABEL_13;
      }
    }
    v47 = [v41 options];
    [v47 setUseZoneWidePCS:1];
LABEL_12:

LABEL_13:
    v48 = [[PDCloudStoreContainerManager alloc] initWithContainer:v41 validScopes:&off_10078C1C8 cacheDataSource:v17 databaseContainerDataSource:v19];
    [(PDCloudStoreContainer *)v19 setContainerManager:v48];
    v49 = +[NSDistributedNotificationCenter defaultCenter];
    [v49 addObserver:v19 selector:"_handlePeerPaymentAccountChanged:" name:PDPeerPaymentServiceAccountChangedDistributedNotification object:0];

    v50 = +[NSDistributedNotificationCenter defaultCenter];
    [v50 addObserver:v19 selector:"_handleFamilyUpdateNotification:" name:FAFamilyUpdateNotification object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v19, (CFNotificationCallback)sub_1000B02DC, @"INFamilyDidChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v52 = [(PDCloudStoreContainer *)v19 workQueue];
    PDScheduledActivityClientRegister();
  }
  return v19;
}

- (void)dealloc
{
  [(PDAccountManager *)self->_accountManager unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PDApplePayCloudStoreContainer;
  [(PDApplePayCloudStoreContainer *)&v3 dealloc];
}

- (void)invalidateCloudStoreIfPossibleWithOperationGroupNameSuffix:(id)a3 clearCache:(BOOL)a4
{
  id v6 = a3;
  v7 = [(PDCloudStoreContainer *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B0468;
  block[3] = &unk_100730438;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (BOOL)shouldForwardErrorsToRequestCompletionHandlers
{
  return 1;
}

- (BOOL)_queue_canInitializeContainer
{
  objc_super v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(PDCloudStoreContainer *)self containerManager];
    v5 = [v4 containerName];
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = (uint64_t)v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Checking if the %@ cloud store can be initalized.", buf, 0xCu);
  }
  if (PKIsMac())
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Device is a Mac, no restrictions when registering for the cloud store", buf, 2u);
    }
    int v6 = 1;
    v7 = v3;
  }
  else
  {
    int IsAvailable = PKSecureElementIsAvailable();
    if (PKIsPhone() & 1) != 0 || (PKIsWatch() & 1) != 0 || (PKIsPad()) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = PKIsVision();
    }
    v25 = self;
    v7 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebService];
    unsigned int v10 = [v7 _needsRegistrationShouldCheckSecureElementOwnership:v9];
    unsigned int v11 = [v7 _canRegisterForPeerPayment];
    int v24 = IsAvailable;
    if (IsAvailable) {
      int v12 = v9 & (v10 ^ 1);
    }
    else {
      int v12 = 0;
    }
    unsigned int v13 = [v7 _supportsAccounts];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      if (v13) {
        CFStringRef v14 = @"YES";
      }
      else {
        CFStringRef v14 = @"NO";
      }
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = (uint64_t)v14;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PDApplePayCloudStoreContainer: Supports accounts %{public}@", buf, 0xCu);
    }
    int v6 = v12 & (v11 | v13);

    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      if (v24) {
        CFStringRef v15 = @"YES";
      }
      else {
        CFStringRef v15 = @"NO";
      }
      if (v9) {
        CFStringRef v16 = @"YES";
      }
      else {
        CFStringRef v16 = @"NO";
      }
      *(_DWORD *)buf = 138544130;
      uint64_t v27 = (uint64_t)v15;
      if (v10) {
        CFStringRef v17 = @"NO";
      }
      else {
        CFStringRef v17 = @"YES";
      }
      __int16 v28 = 2114;
      CFStringRef v29 = v16;
      if (v11) {
        CFStringRef v18 = @"YES";
      }
      else {
        CFStringRef v18 = @"NO";
      }
      __int16 v30 = 2114;
      CFStringRef v31 = v17;
      __int16 v32 = 2114;
      CFStringRef v33 = v18;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Secure element available: %{public}@, is on supported device: %{public}@, is broker registered: %{public}@, can register for peer payment: %{public}@", buf, 0x2Au);
    }

    self = v25;
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v19 = [(PDCloudStoreContainer *)self containerManager];
    uint64_t v20 = [v19 containerName];
    v21 = (void *)v20;
    if (v6) {
      CFStringRef v22 = @"YES";
    }
    else {
      CFStringRef v22 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v27 = v20;
    __int16 v28 = 2114;
    CFStringRef v29 = v22;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Can initalize the %@ cloud store: %{public}@", buf, 0x16u);
  }
  return v6;
}

- (BOOL)_queue_canInvalidateContainer
{
  NSUInteger v3 = [(NSSet *)self->_accounts count];
  v4 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedAccountInformation];
  v5 = [v4 associatedAccounts];
  unint64_t v6 = (unint64_t)[v5 count];

  v7 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedPassUniqueID];
  if (v7)
  {
    NSUInteger v8 = v3 | v6;
    uint64_t v9 = [(PDCloudStoreContainer *)self dataSource];
    unsigned int v10 = [v9 passExistsWithUniqueID:v7];

    BOOL v11 = v8 != 0;
    int v12 = v10 ^ 1;
  }
  else
  {
    BOOL v11 = (v3 | v6) != 0;
    int v12 = 1;
  }
  int v13 = v12 & !v11;
  CFStringRef v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v15 = [(PDCloudStoreContainer *)self containerManager];
    uint64_t v16 = [v15 containerName];
    CFStringRef v17 = (void *)v16;
    CFStringRef v18 = @"NO";
    if (v13) {
      CFStringRef v18 = @"YES";
    }
    int v20 = 138412546;
    uint64_t v21 = v16;
    __int16 v22 = 2112;
    CFStringRef v23 = v18;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Can invalidate cloud store container %@: %@", (uint8_t *)&v20, 0x16u);
  }
  return v13;
}

- (id)cloudStoreSpecificKeysForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v20 = 0;
    goto LABEL_16;
  }
  id v5 = v4;
  unint64_t v6 = [v5 transactionSourceIdentifier];
  v7 = [v5 serviceIdentifier];
  NSUInteger v8 = [v5 accountIdentifier];
  uint64_t v9 = [v5 altDSID];
  unsigned int v10 = [(PDCloudStoreContainer *)self dataSource];
  id v11 = [v10 transactionSourceTypeForTransactionSourceIdentifier:v6];

  int v12 = [(PDCloudStoreContainer *)self dataSource];
  int v13 = [v12 passUniqueIdentifierForTransactionWithServiceIdentifier:v7 transactionSourceIdentifier:v6];

  if (!v13)
  {
    if ((unint64_t)v11 >= 2)
    {
      if (v11 == (id)2)
      {
        uint64_t v21 = [(PDCloudStoreContainer *)self dataSource];
        CFStringRef v17 = [v21 accountUserWithAltDSID:v9 accountIdentifier:v8];

        if (!v17 || [v17 accessLevel] != (id)1)
        {
          int v13 = 0;
          goto LABEL_14;
        }
        CFStringRef v18 = [(PDCloudStoreContainer *)self dataSource];
        uint64_t v19 = [v18 passUniqueIdentifierWithAssociatedAccountIdentifier:v8];
LABEL_12:
        int v13 = (void *)v19;

LABEL_14:
        goto LABEL_15;
      }
      int v13 = 0;
    }
    else
    {
      CFStringRef v14 = [(PDCloudStoreContainer *)self dataSource];
      CFStringRef v15 = [v5 accountIdentifier];
      int v13 = objc_msgSend(v14, "passUniqueIdentifierForTransactionWithServiceIdentifier:accountIdentifier:accountType:", v7, v15, objc_msgSend(v5, "accountType"));

      if (!v13)
      {
        uint64_t v16 = [(PDCloudStoreContainer *)self dataSource];
        CFStringRef v17 = [v16 broadwayOrSurfTransactionSourceIdentifierForAmbiguousServiceIdentifier:v7 transactionAccountIdentifier:0 transactionAccountType:0 transactionAltDSID:0];

        CFStringRef v18 = [(PDCloudStoreContainer *)self dataSource];
        uint64_t v19 = [v18 passUniqueIdentifierForTransactionSourceIdentifier:v17];
        goto LABEL_12;
      }
    }
  }
LABEL_15:
  __int16 v22 = [(PDCloudStoreContainer *)self dataSource];
  CFStringRef v23 = [v22 passWithUniqueIdentifier:v13];

  int v20 = [(PDApplePayCloudStoreContainer *)self _cloudStoreSpecificKeysForItem:v5 paymentPass:v23];

LABEL_16:
  return v20;
}

- (void)_queue_cloudStoreAccountChanged:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received CKAccountChangedNotification in PDApplePayCloudStoreContainer. Fetching latest account information.", buf, 2u);
  }

  if ([(PDCloudStoreContainer *)self cloudContainerSetupInProgress]
    || [(PDCloudStoreContainer *)self accountChangedNotificationReceived])
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "A cloud store initialization is already in progess. This notification will be processed when initialization is done.", buf, 2u);
    }

    [(PDCloudStoreContainer *)self setAccountChangedNotificationReceived:1];
  }
  else
  {
    [(PDCloudStoreContainer *)self setAccountChangedNotificationReceived:1];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000B0DC4;
    v6[3] = &unk_100732CE0;
    v6[4] = self;
    [(PDCloudStoreContainer *)self _queue_cloudStoreAccountInformationWithCompletion:v6];
  }
}

- (void)_queue_setContainerState:(unint64_t)a3 operationGroupNameSuffix:(id)a4 retryCount:(unint64_t)a5 completion:(id)a6
{
  unsigned int v10 = (NSMutableDictionary *)a4;
  id v11 = a6;
  int v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = PDCloudStoreContainerStateToString(a3);
    *(_DWORD *)buf = 138543874;
    v80 = v13;
    __int16 v81 = 2114;
    v82 = v10;
    __int16 v83 = 2048;
    unint64_t v84 = a5;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDApplePayCloudStoreContainer: setContainerState called with state %{public}@, operationGroupNameSuffix: %{public}@, and retry count %lu", buf, 0x20u);
  }
  if ([(PDCloudStoreContainer *)self _queue_ensureContainerState:a3])
  {
    if ((uint64_t)a3 > 3)
    {
      if (a3 == 4)
      {
        v65[0] = _NSConcreteStackBlock;
        v65[1] = 3221225472;
        v65[2] = sub_1000B1A08;
        v65[3] = &unk_100733A48;
        v65[4] = self;
        v66 = v10;
        unint64_t v68 = a5;
        id v67 = v11;
        [(PDCloudStoreContainer *)self _queue_cloudStoreAccountInformationWithCompletion:v65];

        v47 = v66;
LABEL_37:

        goto LABEL_38;
      }
      if (a3 == 15)
      {
        [(PDApplePayCloudStoreContainer *)self _updateFetchTaskScheduledActivityIfNeccessary];
        [(PDApplePayCloudStoreContainer *)self _updateUnarchivedTransactionsScheduledActivityIfNeccessary];
        v63.receiver = self;
        v63.super_class = (Class)PDApplePayCloudStoreContainer;
        [(PDCloudStoreContainer *)&v63 _queue_setContainerState:15 operationGroupNameSuffix:v10 retryCount:a5 completion:v11];
        goto LABEL_38;
      }
    }
    else
    {
      if (a3 - 2 < 2)
      {
        CFStringRef v14 = [(PDCloudStoreContainer *)self operationError];
        CFStringRef v15 = v14;
        if (v14)
        {
          id v16 = v14;
        }
        else
        {
          NSErrorUserInfoKey v74 = NSLocalizedDescriptionKey;
          CFStringRef v75 = @"Detached from container while running operation";
          v48 = +[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
          id v16 = +[NSError errorWithDomain:PKPassKitErrorDomain code:-5001 userInfo:v48];
        }
        [(PDApplePayCloudStoreContainer *)self _queue_markAllRunningFetchTasksWithError:v16];
        os_unfair_lock_lock(&self->_fetchTasksLock);
        [(NSMutableDictionary *)self->_fetchTasks removeAllObjects];
        os_unfair_lock_unlock(&self->_fetchTasksLock);
        peerPaymentAccount = self->_peerPaymentAccount;
        self->_peerPaymentAccount = 0;

        accounts = self->_accounts;
        self->_accounts = 0;

        sharedAccountCloudStoreByAccountIdentifier = self->_sharedAccountCloudStoreByAccountIdentifier;
        self->_sharedAccountCloudStoreByAccountIdentifier = 0;

        accountUsersByAccountIdentifier = self->_accountUsersByAccountIdentifier;
        self->_accountUsersByAccountIdentifier = 0;

        v64.receiver = self;
        v64.super_class = (Class)PDApplePayCloudStoreContainer;
        [(PDCloudStoreContainer *)&v64 _queue_setContainerState:a3 operationGroupNameSuffix:v10 retryCount:a5 completion:v11];

        goto LABEL_38;
      }
      if (a3 == 1)
      {
        oslog = v12;
        unint64_t v59 = a5;
        id v60 = v11;
        CFStringRef v18 = [(PDCloudStoreContainer *)self dataSource];
        uint64_t v19 = [v18 peerPaymentAccount];
        int v20 = self->_peerPaymentAccount;
        self->_peerPaymentAccount = v19;

        uint64_t v21 = [(PDCloudStoreContainer *)self dataSource];
        __int16 v22 = [v21 accounts];
        CFStringRef v23 = self->_accounts;
        self->_accounts = v22;

        int v24 = [(PDCloudStoreContainer *)self dataSource];
        v25 = [v24 sharedAccountCloudStoreByAccountIdentifier];
        uint64_t v26 = self->_sharedAccountCloudStoreByAccountIdentifier;
        self->_sharedAccountCloudStoreByAccountIdentifier = v25;

        uint64_t v27 = [(PDCloudStoreContainer *)self dataSource];
        __int16 v28 = [v27 accountUsersByAccountIdentifier];
        CFStringRef v29 = self->_accountUsersByAccountIdentifier;
        self->_accountUsersByAccountIdentifier = v28;

        __int16 v30 = [(PDCloudStoreContainer *)self dataSource];
        CFStringRef v31 = [v30 allRecordFetchTasks];

        __int16 v32 = self;
        os_unfair_lock_t lock = &self->_fetchTasksLock;
        os_unfair_lock_lock(&self->_fetchTasksLock);
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        obj = v31;
        id v33 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v70 objects:v78 count:16];
        if (v33)
        {
          id v34 = v33;
          uint64_t v35 = *(void *)v71;
          do
          {
            for (i = 0; i != v34; i = (char *)i + 1)
            {
              if (*(void *)v71 != v35) {
                objc_enumerationMutation(obj);
              }
              id v37 = *(void **)(*((void *)&v70 + 1) + 8 * i);
              v39 = [v37 identifier];
              if ([v37 type]) {
                BOOL v40 = v39 == 0;
              }
              else {
                BOOL v40 = 1;
              }
              if (!v40)
              {
                id v41 = objc_alloc_init(PDApplePayCloudStoreRecordFetchOperation);
                [(PDApplePayCloudStoreRecordFetchOperation *)v41 updateTask:v37];
                fetchTasks = v32->_fetchTasks;
                id v43 = [(PDApplePayCloudStoreRecordFetchOperation *)v41 identifier];
                [(NSMutableDictionary *)fetchTasks safelySetObject:v41 forKey:v43];
              }
            }
            id v34 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v70 objects:v78 count:16];
          }
          while (v34);
        }

        os_unfair_lock_unlock(lock);
        id v44 = [(PDCloudStoreContainer *)v32 operationError];
        v45 = v44;
        if (v44)
        {
          id v46 = v44;
        }
        else
        {
          NSErrorUserInfoKey v76 = NSLocalizedDescriptionKey;
          CFStringRef v77 = @"Attaching to container while a while running operation";
          v53 = +[NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
          id v46 = +[NSError errorWithDomain:PKPassKitErrorDomain code:-5001 userInfo:v53];
        }
        id v11 = v60;

        [(PDApplePayCloudStoreContainer *)v32 _queue_markAllRunningFetchTasksWithError:v46];
        os_unfair_lock_lock(lock);
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          id v54 = [(PDCloudStoreContainer *)v32 containerManager];
          id v55 = [v54 containerName];
          id v56 = v32->_fetchTasks;
          *(_DWORD *)buf = 138412546;
          v80 = v55;
          __int16 v81 = 2112;
          v82 = v56;
          _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Previous fetch tasks for container %@ are %@.", buf, 0x16u);
        }
        os_unfair_lock_unlock(lock);
        v69.receiver = v32;
        v69.super_class = (Class)PDApplePayCloudStoreContainer;
        [(PDCloudStoreContainer *)&v69 _queue_setContainerState:1 operationGroupNameSuffix:v10 retryCount:v59 completion:v60];

        v47 = obj;
        goto LABEL_37;
      }
    }
    v62.receiver = self;
    v62.super_class = (Class)PDApplePayCloudStoreContainer;
    [(PDCloudStoreContainer *)&v62 _queue_setContainerState:a3 operationGroupNameSuffix:v10 retryCount:a5 completion:v11];
    goto LABEL_38;
  }
  if (v11)
  {
    CFStringRef v17 = [(PDCloudStoreContainer *)self errorWithCode:-4006 description:@"Invalid cloud store state"];
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v17);
  }
LABEL_38:
}

- (void)_queue_markAllRunningFetchTasksWithError:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_fetchTasksLock);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obj = self->_fetchTasks;
  id v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    id v19 = v4;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v11 = [(NSMutableDictionary *)self->_fetchTasks objectForKeyedSubscript:v9];
        int v12 = [v11 task];
        id v13 = [v12 status];
        if (v13 == (id)4 || v13 == (id)1)
        {
          if (v4)
          {
            id v15 = v4;
          }
          else
          {
            NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
            CFStringRef v25 = @"Unknown error occuring while task was running";
            id v16 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
            id v15 = +[NSError errorWithDomain:PKPassKitErrorDomain code:-1 userInfo:v16];
          }
          [v12 completeTaskWithError:v15];
          CFStringRef v17 = [(PDCloudStoreContainer *)self dataSource];
          [v17 updateRecordFetchTask:v12];

          id v4 = v19;
        }
      }
      id v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_fetchTasksLock);
}

- (BOOL)canCoalesceRequest:(id)a3 withNewRequest:(id)a4
{
  return _[a3 canCoalesceWithRequest:a4];
}

- (void)coalesceRequest:(id)a3 withNewRequest:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(PDApplePayCloudStoreContainer *)self coalesceApplePayRequest:v7 withNewApplePayRequest:v6];
    }
  }
}

- (void)coalesceApplePayRequest:(id)a3 withNewApplePayRequest:(id)a4
{
  id v15 = a3;
  id v5 = a4;
  id v6 = [v15 transactionSourceIdentifiers];
  id v7 = [v5 transactionSourceIdentifiers];
  if ([v6 count] || objc_msgSend(v7, "count"))
  {
    if (v6)
    {
      NSUInteger v8 = [v6 setByAddingObjectsFromSet:v7];
      [v15 setTransactionSourceIdentifiers:v8];
    }
    else
    {
      [v15 setTransactionSourceIdentifiers:v7];
    }
  }
  uint64_t v9 = [v15 ignoreRecordsBeforeDate];
  unsigned int v10 = [v5 ignoreRecordsBeforeDate];
  char v11 = PKEqualObjects();

  if ((v11 & 1) == 0) {
    [v15 setIgnoreRecordsBeforeDate:0];
  }
  int v12 = [v15 ignoreRecordsAfterDate];
  id v13 = [v5 ignoreRecordsAfterDate];
  char v14 = PKEqualObjects();

  if ((v14 & 1) == 0) {
    [v15 setIgnoreRecordsAfterDate:0];
  }
}

- (BOOL)shouldContinueWithRequest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  id v5 = v4;
  id v6 = [v5 transactionSourceIdentifiers];
  id v7 = [v6 count];

  if (!v7)
  {

LABEL_13:
    unsigned __int8 v15 = 1;
    goto LABEL_14;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  NSUInteger v8 = objc_msgSend(v5, "transactionSourceIdentifiers", 0);
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
LABEL_5:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v18 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v12);
      char v14 = [(PDCloudStoreContainer *)self dataSource];
      unsigned __int8 v15 = [v14 transactionSourceExistsWithIdentifier:v13];

      if (v15) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
  else
  {

    unsigned __int8 v15 = 0;
  }
LABEL_14:

  return v15;
}

- (void)_deleteLocalDataFromDeletedRecordsByDatabaseIdentifier:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000B2348;
  v3[3] = &unk_10072F3A0;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

- (void)processFetchedCloudStoreDataWithModifiedRecordsByDatabaseIdentifier:(id)a3 deletedRecordsByDatabaseIdentifier:(id)a4 carriedOverRecordsByDatabaseIdentifier:(id)a5 conflictingRecordsByDatabaseIdentifier:(id)a6 request:(id)a7 completion:(id)a8
{
  id v55 = a3;
  id v14 = a4;
  id v53 = a5;
  id v54 = a6;
  id v15 = a7;
  id v52 = a8;
  [(PDCloudStoreContainer *)self reportContainerChangeIntervalBeginEventWithType:33 stateName:0 objectNames:0 operationGroupName:0 operationGroupNameSuffix:0];
  v51 = v50 = v14;
  [(PDApplePayCloudStoreContainer *)self _deleteLocalDataFromDeletedRecordsByDatabaseIdentifier:v14];
  if (([v15 returnRecords] & 1) != 0 || objc_msgSend(v15, "formReport")) {
    id v16 = objc_alloc_init((Class)PKCloudRecordArray);
  }
  else {
    id v16 = 0;
  }
  if ([v15 returnRecords]) {
    id v17 = objc_alloc_init((Class)PKCloudRecordArray);
  }
  else {
    id v17 = 0;
  }
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x3032000000;
  v74[3] = sub_10002083C;
  v74[4] = sub_100020F10;
  id v75 = 0;
  long long v18 = [v15 groupName];
  long long v19 = (void *)PKCloudStoreOperationGroupInitialDownload;
  id v20 = v18;
  id v21 = v19;
  if (v20 == v21) {
    goto LABEL_25;
  }
  long long v22 = v21;
  if (v20 && v21)
  {
    unsigned __int8 v23 = [v20 isEqualToString:v21];

    if (v23) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  NSErrorUserInfoKey v24 = (void *)PKCloudStoreOperationGroupInitialUpload;
  id v25 = v20;
  id v26 = v24;
  if (v25 == v26) {
    goto LABEL_25;
  }
  uint64_t v27 = v26;
  if (v20 && v26)
  {
    unsigned __int8 v28 = [v25 isEqualToString:v26];

    if (v28) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  CFStringRef v29 = (void *)PKCloudStoreOperationGroupInitialSetup;
  id v30 = v25;
  id v31 = v29;
  if (v30 == v31)
  {
LABEL_25:
  }
  else
  {
    __int16 v32 = v31;
    if (!v20 || !v31)
    {

LABEL_34:
      uint64_t v35 = 0;
      uint64_t v34 = 0;
      goto LABEL_27;
    }
    unsigned __int8 v33 = [v30 isEqualToString:v31];

    if ((v33 & 1) == 0) {
      goto LABEL_34;
    }
  }
LABEL_26:
  uint64_t v34 = 1;
  uint64_t v35 = 4;
LABEL_27:
  if (([v15 useLastChangeToken] & 1) == 0
    && (![v15 requestType]
     || [v15 requestType] == (id)2
     || [v15 requestType] == (id)3))
  {
    v35 |= 0x20uLL;
    v34 |= 2uLL;
  }
  id v36 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_1000B3310;
  v66[3] = &unk_100733C68;
  v66[4] = self;
  id v37 = v15;
  id v67 = v37;
  id v38 = v36;
  id v68 = v38;
  id v39 = v16;
  id v69 = v39;
  uint64_t v72 = v35;
  id v40 = v53;
  uint64_t v73 = v34;
  id v70 = v40;
  long long v71 = v74;
  [v55 enumerateKeysAndObjectsUsingBlock:v66];
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_1000B4FDC;
  v62[3] = &unk_100733C90;
  v62[4] = self;
  id v41 = v37;
  id v63 = v41;
  id v42 = v38;
  id v64 = v42;
  id v43 = v17;
  id v65 = v43;
  [v54 enumerateKeysAndObjectsUsingBlock:v62];
  id v44 = +[NSNull null];
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_1000B524C;
  v56[3] = &unk_100733CB8;
  v56[4] = self;
  id v45 = v51;
  id v57 = v45;
  id v46 = v52;
  id v60 = v46;
  id v47 = v39;
  id v58 = v47;
  v61 = v74;
  id v48 = v43;
  id v59 = v48;
  id v49 = [v42 evaluateWithInput:v44 completion:v56];

  _Block_object_dispose(v74, 8);
}

- (void)_queue_processResultWithError:(id)a3 nextExpectedState:(unint64_t)a4 operationGroupNameSuffix:(id)a5 retryCount:(unint64_t)a6 shouldRetry:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a5;
  id v16 = a8;
  id v17 = [objc_alloc((Class)PKCloudStoreError) initWithError:v14];
  if ([v17 isManateeNotAvailableError])
  {
    long long v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received manatee is not available error. This is most likely do to the fact HSA2 is not enabled. Detaching from container.", buf, 2u);
    }

    PKAnalyticsSendEvent();
    [(PDCloudStoreContainer *)self setNextExpectedState:3];
    [(PDCloudStoreContainer *)self setOperationError:v14];
    [(PDApplePayCloudStoreContainer *)self _queue_setContainerState:3 operationGroupNameSuffix:v15 retryCount:a6 completion:v16];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)PDApplePayCloudStoreContainer;
    [(PDCloudStoreContainer *)&v19 _queue_processResultWithError:v14 nextExpectedState:a4 operationGroupNameSuffix:v15 retryCount:a6 shouldRetry:v9 completion:v16];
  }
}

- (id)recordTypesForCloudStoreItemType:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      v15[0] = PKCloudTransactionRecordType;
      v15[1] = PKCloudTransactionDeviceDataRecordType;
      id v5 = v15;
      uint64_t v6 = 2;
      goto LABEL_9;
    case 5uLL:
      v14[0] = PKCloudAccountEventRecordType;
      v14[1] = PKCloudAccountRewardsRecordType;
      v14[2] = PKCloudCreditAccountStatementRecordType;
      v14[3] = PKCloudAccountServicingRecordType;
      v14[4] = PKCloudAccountPaymentRecordType;
      v14[5] = PKCloudAccountPaymentReminderRecordType;
      v14[6] = PKCloudAccountCreditTermsUpdateRecordType;
      v14[7] = PKCloudAccountPhysicalCardStatusUpdateRecordType;
      v14[8] = PKCloudAccountPhysicalCardShippingUpdateRecordType;
      v14[9] = PKCloudAccountVirtualCardStatusUpdateRecordType;
      v14[10] = PKCloudAccountBillPaymentSelectedSuggestedAmountRecordType;
      v14[11] = PKCloudAccountUserInfoRecordType;
      v14[12] = PKCloudAccountAssistanceProgramRecordType;
      v14[13] = PKCloudAccountTransferRecordType;
      v14[14] = PKCloudAccountHoldRecordType;
      id v5 = v14;
      uint64_t v6 = 15;
      goto LABEL_9;
    case 7uLL:
      uint64_t v13 = PKCloudAccountRecordType;
      id v5 = &v13;
      goto LABEL_8;
    case 8uLL:
      uint64_t v12 = PKCloudShareCreationLockRecordType;
      id v5 = &v12;
      goto LABEL_8;
    case 9uLL:
      uint64_t v11 = PKCloudRecurringPaymentMemoRecordType;
      id v5 = &v11;
      goto LABEL_8;
    case 0xAuLL:
      uint64_t v10 = PKCloudCounterpartImageRecordType;
      id v5 = &v10;
LABEL_8:
      uint64_t v6 = 1;
LABEL_9:
      id v7 = +[NSArray arrayWithObjects:v5 count:v6];
      if (!v7) {
        goto LABEL_10;
      }
      goto LABEL_11;
    default:
LABEL_10:
      v9.receiver = self;
      v9.super_class = (Class)PDApplePayCloudStoreContainer;
      id v7 = [(PDCloudStoreContainer *)&v9 recordTypesForCloudStoreItemType:a3];
LABEL_11:
      return v7;
  }
}

- (id)primaryRecordTypesForCloudStoreItemType:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      v15[0] = PKCloudTransactionRecordType;
      v15[1] = PKCloudTransactionDeviceDataRecordType;
      id v5 = v15;
      uint64_t v6 = 2;
      goto LABEL_9;
    case 5uLL:
      uint64_t v14 = PKCloudAccountEventRecordType;
      id v5 = &v14;
      goto LABEL_8;
    case 7uLL:
      uint64_t v13 = PKCloudAccountRecordType;
      id v5 = &v13;
      goto LABEL_8;
    case 8uLL:
      uint64_t v12 = PKCloudShareCreationLockRecordType;
      id v5 = &v12;
      goto LABEL_8;
    case 9uLL:
      uint64_t v11 = PKCloudRecurringPaymentMemoRecordType;
      id v5 = &v11;
      goto LABEL_8;
    case 0xAuLL:
      uint64_t v10 = PKCloudCounterpartImageRecordType;
      id v5 = &v10;
LABEL_8:
      uint64_t v6 = 1;
LABEL_9:
      id v7 = +[NSArray arrayWithObjects:v5 count:v6];
      if (!v7) {
        goto LABEL_10;
      }
      goto LABEL_11;
    default:
LABEL_10:
      v9.receiver = self;
      v9.super_class = (Class)PDApplePayCloudStoreContainer;
      id v7 = [(PDCloudStoreContainer *)&v9 primaryRecordTypesForCloudStoreItemType:a3];
LABEL_11:
      return v7;
  }
}

- (id)identifierFromRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 recordType];
  uint64_t v6 = [v4 recordID];
  id v7 = [v6 recordName];

  if ([(PDApplePayCloudStoreContainer *)self _isAccountEventFromRecordType:v5]) {
    goto LABEL_2;
  }
  if ([(PDApplePayCloudStoreContainer *)self _isAccountEventAssociatedObjectFromRecordType:v5])
  {
    NSUInteger v8 = objc_msgSend(v4, "pk_referenceForKey:", PKAccountEventReferenceFromAssociatedObject);
    objc_super v9 = [v8 recordID];
    uint64_t v12 = [v9 recordName];
    uint64_t v11 = [(PDApplePayCloudStoreContainer *)self _stripToFirstDash:v12];

LABEL_20:
    id v7 = v12;
LABEL_21:

    id v7 = (void *)v11;
    if (v11) {
      goto LABEL_25;
    }
    goto LABEL_22;
  }
  if ([v5 isEqualToString:PKCloudTransactionDeviceDataRecordType])
  {
    NSUInteger v8 = objc_msgSend(v4, "pk_referenceForKey:", PKPaymentTransactionReferenceFromDeviceData);
    uint64_t v13 = [v8 recordID];
    objc_super v9 = [v13 recordName];

    if (v9)
    {
      id v14 = v9;
      id v15 = v7;
      id v16 = v15;
      if (v14 != v15)
      {
        if (v15)
        {
          unsigned __int8 v17 = [v14 isEqualToString:v15];

          if (v17) {
            goto LABEL_19;
          }
        }
        else
        {
        }
        if ([v16 containsString:v14])
        {
          id v10 = v14;
          objc_super v9 = v10;
          id v7 = v16;
          goto LABEL_3;
        }
        goto LABEL_19;
      }
    }
LABEL_19:
    uint64_t v12 = [v4 recordID];
    long long v18 = [v12 recordName];
    uint64_t v11 = [(PDApplePayCloudStoreContainer *)self _stripToFirstDash:v18];

    goto LABEL_20;
  }
  if ([v5 isEqualToString:PKCloudShareCreationLockRecordType])
  {
LABEL_2:
    NSUInteger v8 = [v4 recordID];
    objc_super v9 = [v8 recordName];
    id v10 = [(PDApplePayCloudStoreContainer *)self _stripToFirstDash:v9];
LABEL_3:
    uint64_t v11 = (uint64_t)v10;
    goto LABEL_21;
  }
  if (v7) {
    goto LABEL_25;
  }
LABEL_22:
  objc_super v19 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = [v4 recordID];
    id v21 = [v20 recordName];
    long long v22 = [v4 recordType];
    int v24 = 138543618;
    id v25 = v21;
    __int16 v26 = 2114;
    uint64_t v27 = v22;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Could not identify %{public}@, type: %{public}@", (uint8_t *)&v24, 0x16u);
  }
LABEL_25:

  return v7;
}

- (id)recordTypeFromRecordName:(id)a3
{
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PDApplePayCloudStoreContainer;
  id v5 = [(PDCloudStoreContainer *)&v50 recordTypeFromRecordName:v4];
  uint64_t v6 = v5;
  if (!v5)
  {
    id v7 = +[PKPaymentTransaction recordNamePrefix];
    unsigned int v8 = [v4 hasPrefix:v7];

    if (v8)
    {
      objc_super v9 = (void **)&PKCloudTransactionDeviceDataRecordType;
    }
    else
    {
      id v10 = +[PKAccountEvent recordNamePrefix];
      unsigned int v11 = [v4 hasPrefix:v10];

      if (v11)
      {
        objc_super v9 = (void **)&PKCloudAccountEventRecordType;
      }
      else
      {
        uint64_t v12 = +[PKAccountRewards recordNamePrefix];
        unsigned int v13 = [v4 hasPrefix:v12];

        if (v13)
        {
          objc_super v9 = (void **)&PKCloudAccountRewardsRecordType;
        }
        else
        {
          id v14 = +[PKCreditAccountStatement recordNamePrefix];
          unsigned int v15 = [v4 hasPrefix:v14];

          if (v15)
          {
            objc_super v9 = (void **)&PKCloudCreditAccountStatementRecordType;
          }
          else
          {
            id v16 = +[PKAccountServicingEvent recordNamePrefix];
            unsigned int v17 = [v4 hasPrefix:v16];

            if (v17)
            {
              objc_super v9 = (void **)&PKCloudAccountServicingRecordType;
            }
            else
            {
              long long v18 = +[PKAccountPayment recordNamePrefix];
              unsigned int v19 = [v4 hasPrefix:v18];

              if (v19)
              {
                objc_super v9 = (void **)&PKCloudAccountPaymentRecordType;
              }
              else
              {
                id v20 = +[PKAccountTransfer recordNamePrefix];
                unsigned int v21 = [v4 hasPrefix:v20];

                if (v21)
                {
                  objc_super v9 = (void **)&PKCloudAccountTransferRecordType;
                }
                else
                {
                  long long v22 = +[PKAccountHold recordNamePrefix];
                  unsigned int v23 = [v4 hasPrefix:v22];

                  if (v23)
                  {
                    objc_super v9 = (void **)&PKCloudAccountHoldRecordType;
                  }
                  else
                  {
                    int v24 = +[PKAccountPaymentReminder recordNamePrefix];
                    unsigned int v25 = [v4 hasPrefix:v24];

                    if (v25)
                    {
                      objc_super v9 = (void **)&PKCloudAccountPaymentReminderRecordType;
                    }
                    else
                    {
                      __int16 v26 = +[PKAccountCreditTermsUpdate recordNamePrefix];
                      unsigned int v27 = [v4 hasPrefix:v26];

                      if (v27)
                      {
                        objc_super v9 = (void **)&PKCloudAccountCreditTermsUpdateRecordType;
                      }
                      else
                      {
                        unsigned __int8 v28 = +[PKAccountPhysicalCardStatusUpdate recordNamePrefix];
                        unsigned int v29 = [v4 hasPrefix:v28];

                        if (v29)
                        {
                          objc_super v9 = (void **)&PKCloudAccountPhysicalCardStatusUpdateRecordType;
                        }
                        else
                        {
                          id v30 = +[PKAccountPhysicalCardShippingUpdate recordNamePrefix];
                          unsigned int v31 = [v4 hasPrefix:v30];

                          if (v31)
                          {
                            objc_super v9 = (void **)&PKCloudAccountPhysicalCardShippingUpdateRecordType;
                          }
                          else
                          {
                            __int16 v32 = +[PKAccountVirtualCardStatusUpdate recordNamePrefix];
                            unsigned int v33 = [v4 hasPrefix:v32];

                            if (v33)
                            {
                              objc_super v9 = (void **)&PKCloudAccountVirtualCardStatusUpdateRecordType;
                            }
                            else
                            {
                              uint64_t v34 = +[PKBillPaymentSelectedSuggestedAmountData recordNamePrefix];
                              unsigned int v35 = [v4 hasPrefix:v34];

                              if (v35)
                              {
                                objc_super v9 = (void **)&PKCloudAccountBillPaymentSelectedSuggestedAmountRecordType;
                              }
                              else
                              {
                                id v36 = +[PKAccountUserInfoUpdate recordNamePrefix];
                                unsigned int v37 = [v4 hasPrefix:v36];

                                if (v37)
                                {
                                  objc_super v9 = (void **)&PKCloudAccountUserInfoRecordType;
                                }
                                else
                                {
                                  id v38 = +[PKAccountAssistanceProgramMessage recordNamePrefix];
                                  unsigned int v39 = [v4 hasPrefix:v38];

                                  if (v39)
                                  {
                                    objc_super v9 = (void **)&PKCloudAccountAssistanceProgramRecordType;
                                  }
                                  else
                                  {
                                    id v40 = +[PKAccount recordNamePrefix];
                                    unsigned int v41 = [v4 hasPrefix:v40];

                                    if (v41)
                                    {
                                      objc_super v9 = (void **)&PKCloudAccountRecordType;
                                    }
                                    else
                                    {
                                      id v42 = +[PKCloudStoreZoneShareLock recordNamePrefix];
                                      unsigned int v43 = [v4 hasPrefix:v42];

                                      if (v43)
                                      {
                                        objc_super v9 = (void **)&PKCloudShareCreationLockRecordType;
                                      }
                                      else
                                      {
                                        id v44 = +[PKPeerPaymentRecurringPayment recordNamePrefix];
                                        unsigned int v45 = [v4 hasPrefix:v44];

                                        if (v45)
                                        {
                                          objc_super v9 = (void **)&PKCloudRecurringPaymentMemoRecordType;
                                        }
                                        else
                                        {
                                          id v46 = +[PKPeerPaymentCounterpartImageData recordNamePrefix];
                                          unsigned int v47 = [v4 hasPrefix:v46];

                                          if (v47) {
                                            objc_super v9 = (void **)&PKCloudCounterpartImageRecordType;
                                          }
                                          else {
                                            objc_super v9 = (void **)&PKCloudTransactionRecordType;
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    uint64_t v6 = *v9;
  }
  id v48 = v6;

  return v48;
}

- (id)_stripToFirstDash:(id)a3
{
  id v3 = [a3 copy];
  id v4 = (char *)[v3 rangeOfString:@"-"];
  if (v4 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", 0, v4 + 1, &stru_10075AAD8);

    id v3 = (id)v5;
  }
  return v3;
}

- (void)_queue_cloudStoreZoneInvitationDataForInvitation:(id)a3 toRecipient:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    unsigned int v11 = [v8 zoneName];
    v36[3] = 0;
    uint64_t v37 = 0;
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x3032000000;
    v34[3] = sub_10002083C;
    v34[4] = sub_100020F10;
    id v35 = 0;
    id v32 = 0;
    id v33 = 0;
    +[PKCloudStoreZone zoneValueForZoneName:v11 outZoneType:&v37 outAccountIdentifier:&v33 altDSID:&v32];
    id v12 = v33;
    id v13 = v32;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000B63A8;
    v25[3] = &unk_100733D08;
    uint64_t v31 = v37;
    v25[4] = self;
    unsigned int v29 = v34;
    id v14 = v9;
    id v26 = v14;
    id v30 = v36;
    id v15 = v12;
    id v27 = v15;
    id v16 = v13;
    id v28 = v16;
    unsigned int v17 = objc_retainBlock(v25);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000B6B68;
    v19[3] = &unk_100733DA8;
    id v22 = v10;
    unsigned int v23 = v34;
    v19[4] = self;
    id v20 = v14;
    id v18 = v11;
    id v21 = v18;
    int v24 = v36;
    ((void (*)(void *, void *))v17[2])(v17, v19);

    _Block_object_dispose(v34, 8);
    _Block_object_dispose(v36, 8);
  }
}

- (void)_queue_aliasesForRecipientHandle:(id)a3 zoneName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = v10;
  if (v10)
  {
    if (v8)
    {
      id v12 = objc_alloc_init((Class)NSMutableSet);
      objc_msgSend(v12, "pk_safelyAddObject:", v8);
      id v23 = 0;
      uint64_t v24 = 0;
      +[PKCloudStoreZone zoneValueForZoneName:v9 outZoneType:&v24 outAccountIdentifier:&v23 altDSID:0];
      id v13 = v23;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000B7728;
      v16[3] = &unk_100733DD0;
      id v17 = v8;
      id v18 = v12;
      uint64_t v22 = v24;
      unsigned int v19 = self;
      id v20 = v13;
      id v21 = v11;
      id v14 = v13;
      id v15 = v12;
      [(PDApplePayCloudStoreContainer *)self _queue_familyMembersWithCompletion:v16];
    }
    else
    {
      (*((void (**)(id, void))v10 + 2))(v10, 0);
    }
  }
}

- (BOOL)supportsContainerChangeEventReports
{
  if (self->_isInternalBuild) {
    return PKDisableContainerChangeEvents() ^ 1;
  }
  else {
    return 0;
  }
}

- (void)didUpdateSetupAssistantStateFrom:(unint64_t)a3 toState:(unint64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PDApplePayCloudStoreContainer;
  -[PDCloudStoreContainer didUpdateSetupAssistantStateFrom:toState:](&v11, "didUpdateSetupAssistantStateFrom:toState:");
  if (a3 != 3 && a4 == 3)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(PDCloudStoreContainer *)self containerManager];
      id v9 = [v8 containerName];
      *(_DWORD *)buf = 138412290;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cloud store setup assistant has completed. Starting initialization now for %@", buf, 0xCu);
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000B7BC4;
    v10[3] = &unk_1007300F8;
    v10[4] = self;
    [(PDCloudStoreContainer *)self initialCloudDatabaseSetupWithOperationGroupNameSuffix:PKCloudStoreOperationGroupSuffixSetupAssistantComplete completion:v10];
  }
}

- (void)requestUpdatesForTransactionSourceIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v75 = self;
    id v67 = v4;
    objc_super v62 = -[PDApplePayCloudStoreContainer _allPossibleCloudStoreZonesForFetchingWithTransactionSourceIdentifier:](self, "_allPossibleCloudStoreZonesForFetchingWithTransactionSourceIdentifier:");
    id v70 = objc_alloc_init((Class)NSMutableSet);
    id v68 = objc_alloc_init((Class)NSMutableDictionary);
    id v69 = objc_alloc_init((Class)NSMutableDictionary);
    os_unfair_lock_t lock = &self->_fetchTasksLock;
    os_unfair_lock_lock(&self->_fetchTasksLock);
    uint64_t v5 = [(NSMutableDictionary *)self->_fetchTasks objectForKeyedSubscript:v67];
    v66 = [(PDApplePayCloudStoreRecordFetchOperation *)v5 task];
    id v6 = [v66 status];
    id v7 = [v66 status];
    id v8 = [(PDCloudStoreContainer *)v75 dataSource];
    id v9 = [v8 transactionSourceTypeForTransactionSourceIdentifier:v67];

    id v71 = v9;
    if (v6 == (id)3 || v5 && v66 && v7 != (id)2) {
      goto LABEL_23;
    }
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v10 = v62;
    id v11 = [v10 countByEnumeratingWithState:&v90 objects:v111 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v91;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v91 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v90 + 1) + 8 * (void)v13);
          id v15 = [(PDCloudStoreContainer *)v75 containerManager];
          id v16 = [v15 fetchTimestampForCloudStoreStore:v14];

          if (v16
            && ([v16 timeIntervalSinceNow], fabs(v17) <= 14400.0)
            && !PKDisableNotificationPullTimeout())
          {
            id v18 = [v14 zoneName];
            [v69 safelySetObject:v16 forKey:v18];
          }
          else
          {
            [v70 addObject:v14];
          }

          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v19 = [v10 countByEnumeratingWithState:&v90 objects:v111 count:16];
        id v11 = v19;
      }
      while (v19);
    }

    id v20 = objc_msgSend(v70, "pk_setByApplyingBlock:", &stru_100733E10);
    [v68 safelySetObject:v20 forKey:@"cloudStoreZonesToFetch"];

    if (![v70 count])
    {
LABEL_23:
      uint64_t v24 = 0;
      id v65 = 0;
    }
    else
    {
      if (!v5) {
        uint64_t v5 = objc_alloc_init(PDApplePayCloudStoreRecordFetchOperation);
      }
      id v65 = [objc_alloc((Class)PKCloudStoreRecordFetchTask) initWithTransactionSourceIdentifier:v67 type:2];
      [v65 queueTask];
      [(PDApplePayCloudStoreRecordFetchOperation *)v5 updateTask:v65];
      fetchTasks = v75->_fetchTasks;
      uint64_t v22 = [(PDApplePayCloudStoreRecordFetchOperation *)v5 identifier];
      [(NSMutableDictionary *)fetchTasks safelySetObject:v5 forKey:v22];

      id v23 = [(PDCloudStoreContainer *)v75 dataSource];
      [v23 updateRecordFetchTask:v65];

      uint64_t v24 = 1;
    }
    id v25 = v6;
    os_unfair_lock_unlock(lock);
    uint64_t v26 = PKCloudStoreOperationGroupSuffixFullFetchBecausePreviousError;
    id v27 = (void *)PKCloudStoreOperationGroupSuffixViewedTransactions;
    uint64_t v61 = PKCloudStoreOperationGroupSuffixViewedTransactions;
    if (v6 == (id)3) {
      id v27 = (void *)PKCloudStoreOperationGroupSuffixFullFetchBecausePreviousError;
    }
    id v74 = v27;
    id v73 = PKCloudStoreOperationGroupUserActionImplicit;
    id v28 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v29 = PKTransactionSourceTypeToString();
      if (v6 == (id)3) {
        CFStringRef v30 = @"YES";
      }
      else {
        CFStringRef v30 = @"NO";
      }
      if (v24) {
        CFStringRef v31 = @"YES";
      }
      else {
        CFStringRef v31 = @"NO";
      }
      id v32 = [v70 count];
      id v33 = [v69 count];
      *(_DWORD *)buf = 138414594;
      *(void *)&uint8_t buf[4] = v67;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v29;
      *(_WORD *)&buf[22] = 2114;
      v99 = (uint64_t (*)(uint64_t, uint64_t))v30;
      *(_WORD *)v100 = 2114;
      *(void *)&v100[2] = v31;
      *(_WORD *)&v100[10] = 2048;
      *(void *)&v100[12] = v32;
      __int16 v101 = 2112;
      id v102 = v70;
      __int16 v103 = 2048;
      id v104 = v33;
      __int16 v105 = 2112;
      id v106 = v69;
      __int16 v107 = 2112;
      v108 = v66;
      __int16 v109 = 2112;
      id v110 = v65;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Requesting updates for transactionSourceIdentifier: %@, type: %{public}@, performFullFetch: %{public}@, performProactiveFetch: %{public}@, %lu cloudStoreZonesToFetch: %@, %lu zonesNotFetching: %@, existingTask: %@, newTask: %@", buf, 0x66u);

      id v25 = v6;
    }
    BOOL v34 = v25 == (id)3;

    [v68 safelySetObject:v65 forKey:@"newTask"];
    [v68 safelySetObject:v66 forKey:@"existingTask"];
    [v68 safelySetObject:v67 forKey:@"transactionSourceIdentifier"];
    id v35 = PKTransactionSourceTypeToString();
    [v68 safelySetObject:v35 forKey:@"transactionSourceType"];

    id v36 = +[NSNumber numberWithBool:v34];
    [v68 safelySetObject:v36 forKey:@"performFullFetch"];

    uint64_t v37 = +[NSNumber numberWithBool:v24];
    [v68 safelySetObject:v37 forKey:@"performProactiveFetch"];

    id v38 = [v68 description];
    v97 = v38;
    unsigned int v39 = +[NSArray arrayWithObjects:&v97 count:1];
    [(PDCloudStoreContainer *)v75 reportContainerChangeSignpostEventType:46 stateName:v67 objectNames:v39 changeToken:0 error:0 operationGroupName:v73 operationGroupNameSuffix:v74];

    if (v34)
    {
      switch((unint64_t)v71)
      {
        case 0uLL:
          id v40 = [(PDCloudStoreContainer *)v75 dataSource];
          id v64 = [v40 passUniqueIdentifierForTransactionSourceIdentifier:v67];
          goto LABEL_50;
        case 1uLL:
          id v52 = [(PDCloudStoreContainer *)v75 dataSource];
          id v40 = [v52 peerPaymentAccountForTransactionSourceIdentifier:v67];

          id v64 = [v40 associatedPassUniqueID];
          goto LABEL_50;
        case 2uLL:
          id v53 = [(PDCloudStoreContainer *)v75 dataSource];
          id v54 = [v53 accountUserWithTransactionSourceIdentifier:v67];
          id v40 = [v54 accountIdentifier];

          id v55 = [(PDCloudStoreContainer *)v75 dataSource];
          id v64 = [v55 passUniqueIdentifierWithAssociatedAccountIdentifier:v40];

          goto LABEL_50;
        case 3uLL:
          id v56 = [(PDCloudStoreContainer *)v75 dataSource];
          id v57 = [v56 accountWithTransactionSourceIdentifier:v67];
          id v40 = [v57 accountIdentifier];

          id v58 = [(PDCloudStoreContainer *)v75 dataSource];
          id v64 = [v58 passUniqueIdentifierWithAssociatedAccountIdentifier:v40];

LABEL_50:
          v51 = v67;
          break;
        default:
          id v64 = 0;
          v51 = v67;
          break;
      }
      v95 = v51;
      PKTransactionSourceTypeToString();
      id v72 = (id)objc_claimAutoreleasedReturnValue();
      id v96 = v72;
      id v59 = +[NSDictionary dictionaryWithObjects:&v96 forKeys:&v95 count:1];
      [(PDApplePayCloudStoreContainer *)v75 passProvisioningDidStartForPassUniqueID:v64 transactionSourceIdentifiers:v59 ignoreExistingRecordHash:0 groupNameSuffix:v26 completion:0];
    }
    else
    {
      if (![v70 count])
      {
LABEL_53:

        id v4 = v67;
        goto LABEL_54;
      }
      os_unfair_lock_lock(lock);
      id v60 = [(NSMutableDictionary *)v75->_fetchTasks objectForKeyedSubscript:v67];

      id v64 = [(PDApplePayCloudStoreRecordFetchOperation *)v60 task];
      [v64 startTask];
      [(PDApplePayCloudStoreRecordFetchOperation *)v60 updateTask:v64];
      unsigned int v41 = [(PDCloudStoreContainer *)v75 dataSource];
      [v41 updateRecordFetchTask:v64];

      os_unfair_lock_unlock(lock);
      id v72 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
      v88[0] = _NSConcreteStackBlock;
      v88[1] = 3221225472;
      v88[2] = sub_1000B8734;
      v88[3] = &unk_100733E60;
      v88[4] = v75;
      v88[5] = v61;
      id v42 = v67;
      id v89 = v42;
      [v72 addOperation:v88];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v99 = sub_10002083C;
      *(void *)v100 = sub_100020F10;
      *(void *)&v100[8] = 0;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      id v43 = v70;
      id v44 = [v43 countByEnumeratingWithState:&v84 objects:v94 count:16];
      if (v44)
      {
        uint64_t v45 = *(void *)v85;
        do
        {
          for (i = 0; i != v44; i = (char *)i + 1)
          {
            if (*(void *)v85 != v45) {
              objc_enumerationMutation(v43);
            }
            uint64_t v47 = *(void *)(*((void *)&v84 + 1) + 8 * i);
            v79[0] = _NSConcreteStackBlock;
            v79[1] = 3221225472;
            v79[2] = sub_1000B88F4;
            v79[3] = &unk_100733EB0;
            v79[4] = v47;
            v79[5] = v75;
            v79[6] = v74;
            id v80 = v42;
            id v48 = v43;
            id v81 = v48;
            id v82 = v73;
            __int16 v83 = buf;
            [v72 addOperation:v79];
          }
          id v44 = [v48 countByEnumeratingWithState:&v84 objects:v94 count:16];
        }
        while (v44);
      }

      id v49 = +[NSNull null];
      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472;
      v76[2] = sub_1000B8C4C;
      v76[3] = &unk_100733F00;
      v76[4] = v75;
      id v77 = v42;
      v78 = buf;
      id v50 = [v72 evaluateWithInput:v49 completion:v76];

      _Block_object_dispose(buf, 8);
      uint64_t v5 = v60;
    }

    goto LABEL_53;
  }
LABEL_54:
}

- (void)backgroundModifiedRecordSyncForTranasctionSourceIdentifiers:(id)a3 fromDate:(id)a4 returnRecords:(BOOL)a5 formReport:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = [(PDCloudStoreContainer *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B8F04;
  block[3] = &unk_100733FC8;
  id v20 = v13;
  id v21 = self;
  BOOL v24 = a5;
  BOOL v25 = a6;
  id v22 = v12;
  id v23 = v14;
  id v16 = v12;
  id v17 = v14;
  id v18 = v13;
  dispatch_async(v15, block);
}

- (void)backgroundRecordChangedSyncForTranasctionSourceIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PDCloudStoreContainer *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B9A34;
  block[3] = &unk_10072E9D8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)passProvisioningDidStartForPassUniqueID:(id)a3 transactionSourceIdentifiers:(id)a4 ignoreExistingRecordHash:(BOOL)a5 groupNameSuffix:(id)a6 completion:(id)a7
{
  BOOL v60 = a5;
  id v68 = a3;
  id v69 = (PDApplePayCloudStoreRecordFetchOperation *)a4;
  id v66 = a6;
  id v67 = (void (**)(id, void))a7;
  objc_super v62 = +[NSDate date];
  id v76 = PKCloudStoreOperationGroupUserActionExplicit;
  id v10 = (void *)PKCloudStoreOperationGroupSuffixPassAdded;
  if (v66) {
    id v10 = v66;
  }
  id v77 = v10;
  id v70 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  uint64_t v138 = 0;
  v139 = (id *)&v138;
  uint64_t v140 = 0x3032000000;
  v141 = sub_10002083C;
  v142 = sub_100020F10;
  id v143 = 0;
  v136[0] = 0;
  v136[1] = v136;
  v136[2] = 0x3032000000;
  v136[3] = sub_10002083C;
  v136[4] = sub_100020F10;
  id v137 = 0;
  os_unfair_lock_lock(&self->_fetchTasksLock);
  id v64 = [(NSMutableDictionary *)self->_fetchTasks copy];
  os_unfair_lock_t lock = &self->_fetchTasksLock;
  os_unfair_lock_unlock(&self->_fetchTasksLock);
  id v11 = &dispatch_get_global_queue_ptr;
  id v74 = objc_alloc_init((Class)NSMutableSet);
  id v65 = objc_alloc_init((Class)NSMutableSet);
  id v63 = objc_alloc_init((Class)NSMutableDictionary);
  id v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v69;
    id v13 = [(PDApplePayCloudStoreRecordFetchOperation *)v69 count];
    CFStringRef v14 = @"NO";
    *(_DWORD *)buf = 138544386;
    __int16 v149 = 2048;
    id v148 = v68;
    if (v60) {
      CFStringRef v14 = @"YES";
    }
    id v150 = v13;
    __int16 v151 = 2112;
    v152 = v69;
    __int16 v153 = 2114;
    id v154 = v77;
    __int16 v155 = 2114;
    CFStringRef v156 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "passProvisioningDidStartForPassUniqueID %{public}@, %lu transactionSourceIdentifiers %@, groupNameSuffix: %{public}@, ignoreExistingRecordHash: %{public}@", buf, 0x34u);
  }
  oslog = v12;

  if (v69)
  {
    [(PDApplePayCloudStoreRecordFetchOperation *)v69 description];
    id v11 = v15 = self;
    v146 = v11;
    id v16 = +[NSArray arrayWithObjects:&v146 count:1];
  }
  else
  {
    id v16 = 0;
    id v15 = self;
  }
  [(PDCloudStoreContainer *)v15 reportContainerChangeSignpostEventType:47 stateName:v68 objectNames:v16 changeToken:0 error:0 operationGroupName:v76 operationGroupNameSuffix:v77];
  if (v69)
  {

    id v15 = self;
  }
  if (![(PDApplePayCloudStoreRecordFetchOperation *)v69 count])
  {
    if (v67) {
      v67[2](v67, 0);
    }
    goto LABEL_67;
  }
  v135[0] = _NSConcreteStackBlock;
  v135[1] = 3221225472;
  v135[2] = sub_1000BB340;
  v135[3] = &unk_100734068;
  v135[4] = v15;
  id v59 = objc_retainBlock(v135);
  group = dispatch_group_create();
  unsigned __int8 v73 = [(PDCloudStoreContainer *)self isCloudStoreSetupAssistantComplete];
  os_unfair_lock_lock(lock);
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  obj = v69;
  id v17 = [(PDApplePayCloudStoreRecordFetchOperation *)obj countByEnumeratingWithState:&v131 objects:v145 count:16];
  if (!v17)
  {

    os_unfair_lock_unlock(lock);
    goto LABEL_63;
  }
  char v71 = 0;
  uint64_t v80 = *(void *)v132;
  do
  {
    id v18 = 0;
    id v82 = v17;
    do
    {
      if (*(void *)v132 != v80) {
        objc_enumerationMutation(obj);
      }
      id v19 = *(void **)(*((void *)&v131 + 1) + 8 * (void)v18);
      id v21 = [(NSMutableDictionary *)self->_fetchTasks objectForKeyedSubscript:v19];
      id v22 = [(PDApplePayCloudStoreRecordFetchOperation *)v21 task];
      BOOL v23 = [v22 status] == (id)1 && objc_msgSend(v22, "type") != (id)2;
      BOOL v24 = [v22 status] == (id)4 && objc_msgSend(v22, "type") != (id)2;
      if (v23 || v24)
      {
        id v25 = objc_alloc_init((Class)NSMutableArray);
        uint64_t v26 = v25;
        if (v23)
        {
          [v25 safelyAddObject:@"runningTask"];
          uint64_t v27 = 49;
        }
        else if (v24)
        {
          [v25 safelyAddObject:@"queuedTask"];
          uint64_t v27 = 50;
        }
        else
        {
          uint64_t v27 = 0;
        }
        BOOL v34 = [(PDApplePayCloudStoreRecordFetchOperation *)v21 description];
        [v26 safelyAddObject:v34];

        if (v23)
        {
          id v35 = oslog;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            id v36 = [(PDApplePayCloudStoreRecordFetchOperation *)obj objectForKeyedSubscript:v19];
            *(_DWORD *)buf = 138412802;
            id v148 = v19;
            __int16 v149 = 2112;
            id v150 = v36;
            __int16 v151 = 2112;
            v152 = v21;
            _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "The transactionSourceIdentifier %@ of type %@ already has a fetch task running. Waiting for it to complete %@", buf, 0x20u);

            goto LABEL_45;
          }
          goto LABEL_46;
        }
        if (v24)
        {
          id v35 = oslog;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v37 = [(PDApplePayCloudStoreRecordFetchOperation *)obj objectForKeyedSubscript:v19];
            *(_DWORD *)buf = 138412802;
            id v148 = v19;
            __int16 v149 = 2112;
            id v150 = v37;
            __int16 v151 = 2112;
            v152 = v21;
            _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "The transactionSourceIdentifier %@ of type %@ is currently queued. Waiting for it to complete %@", buf, 0x20u);

LABEL_45:
            id v35 = oslog;
          }
LABEL_46:
        }
        if (v21)
        {
          v79 = [(PDApplePayCloudStoreRecordFetchOperation *)v21 description];
          v144 = v79;
          v78 = +[NSArray arrayWithObjects:&v144 count:1];
          id v38 = v78;
        }
        else
        {
          id v38 = 0;
        }
        unsigned int v39 = [(PDCloudStoreContainer *)self reportContainerChangeIntervalBeginEventWithType:v27 stateName:v19 objectNames:v38 operationGroupName:v76 operationGroupNameSuffix:v77];
        if (v21)
        {
        }
        id v40 = [(PDApplePayCloudStoreRecordFetchOperation *)v21 identifier];
        objc_msgSend(v74, "pk_safelyAddObject:", v40);

        dispatch_group_enter(group);
        v128[0] = _NSConcreteStackBlock;
        v128[1] = 3221225472;
        v128[2] = sub_1000BB350;
        v128[3] = &unk_100734090;
        v128[4] = self;
        id v33 = v39;
        id v129 = v33;
        v130 = group;
        [(PDApplePayCloudStoreRecordFetchOperation *)v21 addCompletion:v128];

        char v71 = 1;
        id v28 = v22;
LABEL_53:

        goto LABEL_54;
      }
      if ((v73 & 1) == 0)
      {
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v148 = v19;
          _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Cannot fetch records after provisioning for transactionSourceIdentifier %@ since PDCloudStoreContainerSetupAssistantState is not complete", buf, 0xCu);
        }

        uint64_t v26 = [(PDCloudStoreContainer *)self setupAssistantNotCompleteError];
        [(PDCloudStoreContainer *)self reportContainerChangeSignpostEventType:3 stateName:v19 objectNames:0 changeToken:0 error:v26 operationGroupName:v76 operationGroupNameSuffix:v77];
        objc_storeStrong(v139 + 5, v26);
        if (!v21) {
          id v21 = objc_alloc_init(PDApplePayCloudStoreRecordFetchOperation);
        }
        id v28 = [objc_alloc((Class)PKCloudStoreRecordFetchTask) initWithTransactionSourceIdentifier:v19 type:1];

        [v28 startTask];
        [(PDApplePayCloudStoreRecordFetchOperation *)v21 updateTask:v28];
        fetchTasks = self->_fetchTasks;
        id v32 = [(PDApplePayCloudStoreRecordFetchOperation *)v21 identifier];
        [(NSMutableDictionary *)fetchTasks safelySetObject:v21 forKey:v32];

        id v33 = [(PDCloudStoreContainer *)self dataSource];
        [v33 updateRecordFetchTask:v28];
        goto LABEL_53;
      }
      if (!v21) {
        id v21 = objc_alloc_init(PDApplePayCloudStoreRecordFetchOperation);
      }
      id v28 = [objc_alloc((Class)PKCloudStoreRecordFetchTask) initWithTransactionSourceIdentifier:v19 type:1];

      [v28 queueTask];
      [(PDApplePayCloudStoreRecordFetchOperation *)v21 updateTask:v28];
      unsigned int v29 = self->_fetchTasks;
      CFStringRef v30 = [(PDApplePayCloudStoreRecordFetchOperation *)v21 identifier];
      [(NSMutableDictionary *)v29 safelySetObject:v21 forKey:v30];

      uint64_t v26 = [(PDCloudStoreContainer *)self dataSource];
      [v26 updateRecordFetchTask:v28];
LABEL_54:

      id v18 = (char *)v18 + 1;
    }
    while (v82 != v18);
    id v17 = [(PDApplePayCloudStoreRecordFetchOperation *)obj countByEnumeratingWithState:&v131 objects:v145 count:16];
  }
  while (v17);

  os_unfair_lock_unlock(lock);
  if (v71)
  {
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v148 = v74;
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Pass Provisioning fetch waiting for in progress tasks to complete: %@", buf, 0xCu);
    }
  }
LABEL_63:
  v125[0] = _NSConcreteStackBlock;
  v125[1] = 3221225472;
  v125[2] = sub_1000BB394;
  v125[3] = &unk_100731CB8;
  unsigned int v41 = group;
  v126 = v41;
  v127 = self;
  [v70 addOperation:v125];
  v119[0] = _NSConcreteStackBlock;
  v119[1] = 3221225472;
  v119[2] = sub_1000BB484;
  v119[3] = &unk_1007340B8;
  unsigned __int8 v124 = v73;
  v123 = &v138;
  v119[4] = self;
  id v42 = obj;
  v120 = v42;
  id v43 = v74;
  id v121 = v43;
  id v44 = v65;
  id v122 = v44;
  [v70 addOperation:v119];
  PKLogFacilityTypeGetObject();
  uint64_t v45 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v46 = os_signpost_id_make_with_pointer(v45, self);
  if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v47 = v46;
    if (os_signpost_enabled(v45))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v45, OS_SIGNPOST_INTERVAL_BEGIN, v47, "cloudstore:fetchPassRecords", "", buf, 2u);
    }
  }

  v117[0] = _NSConcreteStackBlock;
  v117[1] = 3221225472;
  v117[2] = sub_1000BB754;
  v117[3] = &unk_100733E60;
  v117[4] = self;
  v117[5] = v77;
  id v48 = v42;
  v118 = v48;
  [v70 addOperation:v117];
  v107[0] = _NSConcreteStackBlock;
  v107[1] = 3221225472;
  v107[2] = sub_1000BB9D4;
  v107[3] = &unk_100734108;
  v107[4] = self;
  id v49 = v68;
  id v108 = v49;
  id v50 = v44;
  id v109 = v50;
  id v51 = v63;
  id v110 = v51;
  id v52 = v48;
  v111 = v52;
  id v112 = v64;
  id v113 = v43;
  id v114 = v76;
  v116 = v136;
  id v115 = v77;
  [v70 addOperation:v107];
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472;
  v102[2] = sub_1000BBFB0;
  v102[3] = &unk_100734040;
  v102[4] = self;
  id v53 = v49;
  id v103 = v53;
  id v104 = v76;
  id v105 = v77;
  id v106 = &v138;
  [v70 addOperation:v102];
  v93[0] = _NSConcreteStackBlock;
  v93[1] = 3221225472;
  v93[2] = sub_1000BC11C;
  v93[3] = &unk_1007341F8;
  id v94 = v51;
  v95 = self;
  id v96 = v76;
  id v97 = v77;
  BOOL v101 = v60;
  id v54 = v53;
  id v98 = v54;
  id v55 = v52;
  v99 = v55;
  v100 = &v138;
  [v70 addOperation:v93];
  id v56 = +[NSNull null];
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472;
  v84[2] = sub_1000BCD54;
  v84[3] = &unk_100734248;
  v84[4] = self;
  id v85 = v54;
  long long v86 = v55;
  long long v91 = &v138;
  id v87 = v62;
  long long v92 = v136;
  id v88 = v50;
  id v57 = v59;
  id v89 = v57;
  long long v90 = v67;
  id v58 = [v70 evaluateWithInput:v56 completion:v84];

LABEL_67:
  _Block_object_dispose(v136, 8);

  _Block_object_dispose(&v138, 8);
}

- (void)fetchRecordsInAcceptedZoneShare:(id)a3 databaseIdentifier:(id)a4 operationGroupName:(id)a5 operationGroupNameSuffix:(id)a6 qualityOfService:(int64_t)a7 completion:(id)a8
{
  id v13 = a3;
  id v42 = a4;
  id v44 = a5;
  id v45 = a6;
  id v43 = (void (**)(void))a8;
  CFStringRef v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v13 zoneName];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Fetching records in newly shared zone %{public}@", (uint8_t *)&buf, 0xCu);
  }
  if (v13)
  {
    id v16 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
    group = dispatch_group_create();
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v71 = 0x3032000000;
    id v72 = sub_10002083C;
    unsigned __int8 v73 = sub_100020F10;
    id v74 = 0;
    unsigned __int8 v39 = [(PDCloudStoreContainer *)self isCloudStoreSetupAssistantComplete];
    os_unfair_lock_lock(&self->_fetchTasksLock);
    id v17 = [objc_alloc((Class)PKCloudStoreRecordFetchTask) initWithCloudStoreZone:v13 type:3];
    [v17 queueTask];
    id v18 = [v17 identifier];
    id v19 = [(NSMutableDictionary *)self->_fetchTasks objectForKeyedSubscript:v18];
    id v20 = [(PDApplePayCloudStoreRecordFetchOperation *)v19 task];
    [(NSMutableDictionary *)self->_fetchTasks setObject:v19 forKeyedSubscript:v18];
    id v21 = [v20 status];
    id v22 = v20;
    id v23 = v21;
    id v38 = v22;
    id v24 = [v22 status];
    if (v23 == (id)1 || v24 == (id)4)
    {
      dispatch_group_enter(group);
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472;
      v66[2] = sub_1000BD864;
      v66[3] = &unk_100734270;
      id v67 = group;
      [(PDApplePayCloudStoreRecordFetchOperation *)v19 addCompletion:v66];
      id v25 = v67;
    }
    else if (v39)
    {
      [v17 queueTask];
      [(PDApplePayCloudStoreRecordFetchOperation *)v19 updateTask:v17];
      id v25 = [(PDCloudStoreContainer *)self dataSource];
      [v25 updateRecordFetchTask:v17];
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = [v13 zoneName];
        *(_DWORD *)id v68 = 138412290;
        id v69 = v27;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Cannot accept zone share %@ since the cloud store setup assistant is not complete", v68, 0xCu);
      }
      id v25 = [(PDCloudStoreContainer *)self setupAssistantNotCompleteError];
      id v28 = [v13 zoneName];
      [(PDCloudStoreContainer *)self reportContainerChangeSignpostEventType:3 stateName:v28 objectNames:0 changeToken:0 error:v25 operationGroupName:v44 operationGroupNameSuffix:v45];

      if (!v19) {
        id v19 = objc_alloc_init(PDApplePayCloudStoreRecordFetchOperation);
      }
      [v17 startTask];
      objc_storeStrong((id *)(*((void *)&buf + 1) + 40), v25);
      [(PDApplePayCloudStoreRecordFetchOperation *)v19 updateTask:v17];
      fetchTasks = self->_fetchTasks;
      CFStringRef v30 = [(PDApplePayCloudStoreRecordFetchOperation *)v19 identifier];
      [(NSMutableDictionary *)fetchTasks safelySetObject:v19 forKey:v30];

      CFStringRef v31 = [(PDCloudStoreContainer *)self dataSource];
      [v31 updateRecordFetchTask:v17];
    }
    os_unfair_lock_unlock(&self->_fetchTasksLock);
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_1000BD86C;
    v63[3] = &unk_100731CB8;
    id v32 = group;
    id v64 = v32;
    id v65 = self;
    [v16 addOperation:v63];
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_1000BD95C;
    v58[3] = &unk_100734298;
    unsigned __int8 v62 = v39;
    p_long long buf = &buf;
    v58[4] = self;
    id v33 = v18;
    id v59 = v33;
    id v34 = v13;
    id v60 = v34;
    [v16 addOperation:v58];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1000BDB3C;
    v50[3] = &unk_1007342C0;
    id v51 = v34;
    id v52 = v42;
    id v53 = v44;
    id v56 = &buf;
    int64_t v57 = a7;
    id v54 = v45;
    id v55 = self;
    [v16 addOperation:v50];
    id v35 = +[NSNull null];
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1000BDCB8;
    v46[3] = &unk_1007342E8;
    v46[4] = self;
    id v36 = v33;
    id v47 = v36;
    id v49 = &buf;
    id v48 = v43;
    id v37 = [v16 evaluateWithInput:v35 completion:v46];

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    NSErrorUserInfoKey v75 = NSLocalizedDescriptionKey;
    CFStringRef v76 = @"Error: cannot fetch records from a nil accepted zone share";
    uint64_t v26 = +[NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
    id v16 = +[NSError errorWithDomain:PKPassKitErrorDomain code:-4001 userInfo:v26];

    [(PDCloudStoreContainer *)self reportContainerChangeSignpostEventType:3 stateName:0 objectNames:0 changeToken:0 error:v16 operationGroupName:v44 operationGroupNameSuffix:v45];
    if (v43) {
      v43[2]();
    }
  }
}

- (void)_fetchTaskOperationWithIdentifier:(id)a3 completedWithError:(id)a4
{
  p_fetchTasksLock = &self->_fetchTasksLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_fetchTasksLock);
  id v11 = [(NSMutableDictionary *)self->_fetchTasks objectForKeyedSubscript:v8];

  id v9 = [v11 task];
  [v9 completeTaskWithError:v7];
  id v10 = [(PDCloudStoreContainer *)self dataSource];
  [v10 updateRecordFetchTask:v9];

  os_unfair_lock_unlock(p_fetchTasksLock);
  [v11 callCompletionsWithError:v7 cloudStoreRecords:0];

  [(PDApplePayCloudStoreContainer *)self _updateFetchTaskScheduledActivityIfNeccessary];
}

- (id)_queue_additionalTransactionSourceIdentifiersForProvisioningWithZone:(id)a3 transactionSourceIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    unint64_t v8 = (unint64_t)[v6 zoneType];
    if (v8 >= 9 || ((0x1EDu >> v8) & 1) == 0)
    {
      id v9 = objc_alloc_init((Class)NSMutableDictionary);
      peerPaymentAccount = self->_peerPaymentAccount;
      if (peerPaymentAccount)
      {
        id v11 = v7;
        id v12 = [(PKPeerPaymentAccount *)peerPaymentAccount associatedPassUniqueID];
        id v13 = [(PDCloudStoreContainer *)self dataSource];
        CFStringRef v14 = [v13 passWithUniqueIdentifier:v12];
        id v15 = [v14 paymentPass];

        if (v15)
        {
          id v7 = v11;
          if ([v15 activationState]) {
            BOOL v16 = [v15 activationState] == (id)2;
          }
          else {
            BOOL v16 = 1;
          }
        }
        else
        {
          BOOL v16 = 0;
          id v7 = v11;
        }
        id v18 = [v15 deviceTransactionSourceIdentifiers];
        unsigned int v80 = [v18 isSubsetOfSet:v7];
      }
      else
      {
        unsigned int v80 = 0;
        id v15 = 0;
        BOOL v16 = 0;
      }
      __int16 v83 = v15;
      accountManager = self->_accountManager;
      id v20 = [(NSSet *)self->_accounts allObjects];
      uint64_t v21 = [(PDAccountManager *)accountManager defaultAccountForFeature:2 forAccounts:v20];

      id v22 = (void *)v21;
      if (!v21)
      {
        uint64_t v27 = 0;
        id v82 = 0;
        unsigned int v28 = 0;
        unsigned int v29 = 0;
        goto LABEL_25;
      }
      id v23 = [(PDCloudStoreContainer *)self dataSource];
      id v24 = [(id)v21 associatedPassUniqueID];
      id v25 = [v23 passWithUniqueIdentifier:v24];
      uint64_t v21 = [v25 paymentPass];

      uint64_t v26 = (void *)v21;
      if (v21)
      {
        if ([(id)v21 activationState]) {
          LODWORD(v21) = [(id)v21 activationState] == (id)2;
        }
        else {
          LODWORD(v21) = 1;
        }
      }
      id v82 = v26;
      CFStringRef v30 = [v26 deviceTransactionSourceIdentifiers];
      unsigned int v28 = [v30 isSubsetOfSet:v7];

      CFStringRef v31 = [v22 accountIdentifier];
      if (v31)
      {
        id v32 = [(NSDictionary *)self->_accountUsersByAccountIdentifier objectForKeyedSubscript:v31];
        uint64_t v27 = [v32 coOwnerAccountUser];

        if (v27)
        {
          [v27 transactionSourceIdentifiers];
          unsigned int v78 = v28;
          int v33 = v21;
          BOOL v34 = v16;
          id v35 = v27;
          id v36 = v22;
          v38 = id v37 = v7;
          unsigned int v29 = [v38 isSubsetOfSet:v37];

          id v7 = v37;
          id v22 = v36;
          uint64_t v27 = v35;
          BOOL v16 = v34;
          LODWORD(v21) = v33;
          unsigned int v28 = v78;
LABEL_24:

LABEL_25:
          if ([v6 zoneType] == (id)1)
          {
            int v39 = v21 & v28;
            int v40 = v16 & v80;
            if ((v21 & v28) != 1 || (v40 & 1) == 0)
            {
              if (((v40 | v16 & v39 ^ 1) & 1) == 0)
              {
                id v77 = v7;
                long long v98 = 0u;
                long long v99 = 0u;
                long long v96 = 0u;
                long long v97 = 0u;
                unsigned int v41 = [v83 deviceTransactionSourceIdentifiers];
                id v60 = [v41 countByEnumeratingWithState:&v96 objects:v103 count:16];
                if (v60)
                {
                  id v61 = v60;
                  id v81 = v27;
                  NSErrorUserInfoKey v75 = v22;
                  id v76 = v6;
                  uint64_t v62 = *(void *)v97;
                  do
                  {
                    for (i = 0; i != v61; i = (char *)i + 1)
                    {
                      if (*(void *)v97 != v62) {
                        objc_enumerationMutation(v41);
                      }
                      uint64_t v64 = *(void *)(*((void *)&v96 + 1) + 8 * i);
                      id v65 = [v83 uniqueID];
                      id v66 = +[NSString stringWithFormat:@"paymentApplication, %@, Apple Cash", v65];
                      [v9 safelySetObject:v66 forKey:v64];
                    }
                    id v61 = [v41 countByEnumeratingWithState:&v96 objects:v103 count:16];
                  }
                  while (v61);
                  goto LABEL_66;
                }
LABEL_67:

                id v7 = v77;
                goto LABEL_68;
              }
              if (((v39 | v40 & v21 ^ 1) & 1) == 0)
              {
                id v77 = v7;
                long long v94 = 0u;
                long long v95 = 0u;
                long long v92 = 0u;
                long long v93 = 0u;
                unsigned int v41 = [v82 deviceTransactionSourceIdentifiers];
                id v42 = [v41 countByEnumeratingWithState:&v92 objects:v102 count:16];
                if (v42)
                {
                  id v43 = v42;
                  id v81 = v27;
                  NSErrorUserInfoKey v75 = v22;
                  id v76 = v6;
                  uint64_t v44 = *(void *)v93;
                  do
                  {
                    for (j = 0; j != v43; j = (char *)j + 1)
                    {
                      if (*(void *)v93 != v44) {
                        objc_enumerationMutation(v41);
                      }
                      uint64_t v46 = *(void *)(*((void *)&v92 + 1) + 8 * (void)j);
                      id v47 = [v82 uniqueID];
                      id v48 = +[NSString stringWithFormat:@"paymentApplication, %@, Apple Card", v47];
                      [v9 safelySetObject:v48 forKey:v46];
                    }
                    id v43 = [v41 countByEnumeratingWithState:&v92 objects:v102 count:16];
                  }
                  while (v43);
LABEL_66:
                  id v22 = v75;
                  id v6 = v76;
                  uint64_t v27 = v81;
                  goto LABEL_67;
                }
                goto LABEL_67;
              }
            }
          }
          else if ([v6 zoneType] == (id)4)
          {
            int v49 = v21 & v28 ^ 1;
            int v50 = v29 ^ 1;
            if ((v49 & 1) != 0 || v50)
            {
              if (((v21 & v28 | v50) & 1) == 0)
              {
                id v77 = v7;
                long long v90 = 0u;
                long long v91 = 0u;
                long long v88 = 0u;
                long long v89 = 0u;
                unsigned int v41 = [v82 deviceTransactionSourceIdentifiers];
                id v67 = [v41 countByEnumeratingWithState:&v88 objects:v101 count:16];
                if (v67)
                {
                  id v68 = v67;
                  id v81 = v27;
                  NSErrorUserInfoKey v75 = v22;
                  id v76 = v6;
                  uint64_t v69 = *(void *)v89;
                  do
                  {
                    for (k = 0; k != v68; k = (char *)k + 1)
                    {
                      if (*(void *)v89 != v69) {
                        objc_enumerationMutation(v41);
                      }
                      uint64_t v71 = *(void *)(*((void *)&v88 + 1) + 8 * (void)k);
                      id v72 = [v82 uniqueID];
                      unsigned __int8 v73 = +[NSString stringWithFormat:@"paymentApplication, %@, Apple Card", v72];
                      [v9 safelySetObject:v73 forKey:v71];
                    }
                    id v68 = [v41 countByEnumeratingWithState:&v88 objects:v101 count:16];
                  }
                  while (v68);
                  goto LABEL_66;
                }
                goto LABEL_67;
              }
              if (((v49 | v29) & 1) == 0)
              {
                id v77 = v7;
                long long v86 = 0u;
                long long v87 = 0u;
                long long v84 = 0u;
                long long v85 = 0u;
                unsigned int v41 = [v27 transactionSourceIdentifiers];
                id v51 = [v41 countByEnumeratingWithState:&v84 objects:v100 count:16];
                if (v51)
                {
                  id v52 = v51;
                  NSErrorUserInfoKey v75 = v22;
                  id v76 = v6;
                  uint64_t v79 = *(void *)v85;
                  id v81 = v27;
                  do
                  {
                    for (m = 0; m != v52; m = (char *)m + 1)
                    {
                      if (*(void *)v85 != v79) {
                        objc_enumerationMutation(v41);
                      }
                      uint64_t v54 = *(void *)(*((void *)&v84 + 1) + 8 * (void)m);
                      id v55 = [v81 altDSID];
                      id v56 = [v81 firstName];
                      int64_t v57 = [v81 lastName];
                      id v58 = [v81 appleID];
                      id v59 = +[NSString stringWithFormat:@"accountUser, %@ - %@ - %@ - %@, Apple Card CoOwner", v55, v56, v57, v58];
                      [v9 safelySetObject:v59 forKey:v54];
                    }
                    id v52 = [v41 countByEnumeratingWithState:&v84 objects:v100 count:16];
                  }
                  while (v52);
                  goto LABEL_66;
                }
                goto LABEL_67;
              }
            }
          }
LABEL_68:
          if ([v9 count]) {
            id v17 = [v9 copy];
          }
          else {
            id v17 = 0;
          }

          goto LABEL_72;
        }
      }
      else
      {
        uint64_t v27 = 0;
      }
      unsigned int v29 = 0;
      goto LABEL_24;
    }
  }
  id v17 = 0;
LABEL_72:

  return v17;
}

- (void)_fetchAndStoreAppleCashRecordsIfNecessaryForPassUniqueID:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  CFStringRef v14 = [(PDCloudStoreContainer *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BE71C;
  block[3] = &unk_100734360;
  void block[4] = self;
  id v20 = v10;
  id v22 = v12;
  id v23 = v13;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  id v18 = v10;
  dispatch_async(v14, block);
}

- (void)_fetchAndStoreAppleCashItemWithRecordType:(id)a3 operationGroupName:(id)a4 operationGroupNameSuffix:(id)a5 zone:(id)a6 containerDatabase:(id)a7 transactionSourceIdentifiers:(id)a8 accountCreationDate:(id)a9 completion:(id)a10
{
  id v15 = a8;
  id v27 = a10;
  id v26 = a9;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = +[NSPredicate predicateWithValue:1];
  id v22 = [objc_alloc((Class)CKQuery) initWithRecordType:v20 predicate:v21];

  id v23 = [(PDCloudStoreRecordsRequest *)[PDApplePayCloudStoreRecordsRequest alloc] initWithRequestType:4 storeChanges:1 returnRecords:0 qualityOfService:17 groupName:v19 groupNameSuffix:v18];
  [(PDCloudStoreRecordsRequest *)v23 setCkQuery:v22];
  [(PDCloudStoreRecordsRequest *)v23 setCloudStoreZone:v17];

  [(PDCloudStoreRecordsRequest *)v23 setContainerDatabase:v16];
  [(PDApplePayCloudStoreRecordsRequest *)v23 setTransactionSourceIdentifiers:v15];
  [(PDCloudStoreRecordsRequest *)v23 setIgnoreRecordsBeforeDate:v26];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000BF5E8;
  v29[3] = &unk_100732D58;
  id v30 = v15;
  CFStringRef v31 = self;
  id v32 = v27;
  id v24 = v27;
  id v25 = v15;
  [(PDCloudStoreContainer *)self executeRecordsRequest:v23 completion:v29];
}

- (void)_addCloudStoreRecordsFromResponse:(id)a3 toTransactionSourceRecords:(id)a4 transactionSourceIdentifiers:(id)a5 passUniqueID:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [a3 cloudStoreRecords];
  CFStringRef v14 = [v13 allObjectsByDatabaseIdentifier];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000BF854;
  v18[3] = &unk_100734388;
  v18[4] = self;
  id v19 = v11;
  id v20 = v10;
  id v21 = v12;
  id v15 = v12;
  id v16 = v10;
  id v17 = v11;
  [v14 enumerateKeysAndObjectsUsingBlock:v18];
}

- (void)canSyncTransactionFromCloudKitForTransactionSourceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    unint64_t v8 = [(PDCloudStoreContainer *)self workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BFC04;
    block[3] = &unk_100731830;
    id v11 = v7;
    void block[4] = self;
    id v10 = v6;
    dispatch_async(v8, block);
  }
}

- (void)canSyncTransactionToCloudKit:(id)a3 forTransactionSourceIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = [(PDCloudStoreContainer *)self workQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000BFD50;
    v12[3] = &unk_100731F10;
    id v15 = v10;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    dispatch_async(v11, v12);
  }
}

- (BOOL)_queue_canSyncTransactionToCloudKit:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 hasBackingData]
    && ([v6 serviceIdentifier],
        id v8 = objc_claimAutoreleasedReturnValue(),
        id v9 = [v8 length],
        v8,
        v9)
    && [(PDApplePayCloudStoreContainer *)self _queue_isRelevantTransactionSourceIdentifier:v7])
  {
    id v10 = [(PDCloudStoreContainer *)self dataSource];
    id v11 = [v6 serviceIdentifier];
    id v12 = [v10 transactionArchiveForTransactionWithServiceIdentifier:v11 transactionSourceIdentifier:v7];

    unsigned int v13 = [v12 allArchiveLocationsWithType:0 areArchived:1];
    if (!v12)
    {
      id v14 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v6 serviceIdentifier];
        int v24 = 138412802;
        id v25 = v6;
        __int16 v26 = 2114;
        id v27 = v15;
        __int16 v28 = 2112;
        id v29 = v7;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Error: there is no archive defined for transaction %@ (service id %{public}@) with transactionSourceIdentifier %@", (uint8_t *)&v24, 0x20u);
      }
    }
    if (v12) {
      int v16 = v13 ^ 1;
    }
    else {
      int v16 = 1;
    }
    if (((v13 ^ 1) & 1) == 0)
    {
      id v17 = [(PDCloudStoreContainer *)self containerManager];
      id v18 = [v17 cloudStoreZonesByDatabaseIdentifierForItem:v6 action:1];

      if ([v18 count])
      {
        id v19 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = [v6 serviceIdentifier];
          id v21 = [v18 count];
          int v24 = 138413058;
          id v25 = v6;
          __int16 v26 = 2114;
          id v27 = v20;
          __int16 v28 = 2048;
          id v29 = v21;
          __int16 v30 = 2112;
          CFStringRef v31 = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Allowing transaction %@ (service id %{public}@) to sync to cloud store since there are %lu zones associated with that transaction %@", (uint8_t *)&v24, 0x2Au);
        }
        int v16 = 1;
      }
    }
    BOOL v22 = v16 != 0;
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (void)passDidDisappear:(id)a3
{
  id v4 = [a3 paymentPass];
  uint64_t v5 = [v4 deviceTransactionSourceIdentifiers];
  id v6 = [v5 allObjects];

  os_unfair_lock_lock(&self->_fetchTasksLock);
  [(NSMutableDictionary *)self->_fetchTasks removeObjectsForKeys:v6];
  os_unfair_lock_unlock(&self->_fetchTasksLock);
}

- (void)syncTransactionsToCloudStoreOriginatedOnDevice:(unint64_t)a3
{
  id v4 = [(PDCloudStoreContainer *)self dataSource];
  [v4 syncTransactionsToCloudStoreOriginatedOnDevice:a3];
}

- (void)bootstrapZoneWithName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PDCloudStoreContainer *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C01FC;
  block[3] = &unk_10072E9D8;
  id v12 = v6;
  unsigned int v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)generateRandomTransactionForTransactionSourceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PDCloudStoreContainer *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C04E8;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)uploadTransaction:(id)a3 forTransactionSourceIdentifier:(id)a4 includeServerData:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(PDCloudStoreContainer *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C0698;
  block[3] = &unk_10072E3F0;
  void block[4] = self;
  id v18 = v10;
  BOOL v21 = a5;
  id v19 = v11;
  id v20 = v12;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  dispatch_async(v13, block);
}

- (void)uploadRecurringPayment:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PDCloudStoreContainer *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C0FA0;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)uploadCounterpartImageData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PDCloudStoreContainer *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C1604;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)populateEvents:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PDCloudStoreContainer *)self workQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  void v15[2] = sub_1000C1C90;
  v15[3] = &unk_100731EC0;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)_handlePeerPaymentAccountChanged:(id)a3
{
  id v4 = [(PDCloudStoreContainer *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C2364;
  block[3] = &unk_10072E1E8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)accountManager:(id)a3 didAddAccount:(id)a4
{
  id v5 = a4;
  id v6 = [(PDCloudStoreContainer *)self workQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C24E8;
  v8[3] = &unk_10072E198;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)accountManager:(id)a3 didRemoveAccount:(id)a4
{
  id v5 = a4;
  id v6 = [(PDCloudStoreContainer *)self workQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C26BC;
  v8[3] = &unk_10072E198;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(PDCloudStoreContainer *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C28B4;
  block[3] = &unk_10072E238;
  id v13 = v7;
  id v14 = v8;
  id v15 = self;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

- (void)accountManager:(id)a3 sharedAccountCloudStoreChangedForAccountIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(PDCloudStoreContainer *)self workQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C2A94;
  v8[3] = &unk_10072E198;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)accountManager:(id)a3 accountUsersChanged:(id)a4 oldUsers:(id)a5 accountIdentifier:(id)a6
{
  id v7 = a6;
  id v8 = [(PDCloudStoreContainer *)self workQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000C2C7C;
  v10[3] = &unk_10072E198;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, v10);
}

- (id)allPossibleZoneNamesForContainerDatabase:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  id v6 = [v4 scope];
  if (v6 == (id)3)
  {
    if (![(PKPeerPaymentAccount *)self->_peerPaymentAccount role])
    {
      id v8 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedAccountInformation];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000C2F18;
      v11[3] = &unk_100734478;
      id v12 = v5;
      id v13 = self;
      id v14 = v4;
      [v8 enumerateAssociatedAccountsUsingBlock:v11];
    }
  }
  else
  {
    if (v6 != (id)2) {
      goto LABEL_7;
    }
    id v7 = [(PDApplePayCloudStoreContainer *)self _peerPaymentZoneNamesForAccount:self->_peerPaymentAccount containerDatabase:v4];
    [v5 unionSet:v7];
  }
  id v9 = [(PDApplePayCloudStoreContainer *)self _accountZoneNamesForAccountSet:self->_accounts containerDatabase:v4];
  [v5 unionSet:v9];

LABEL_7:
  return v5;
}

- (id)allPossibleZoneNamesForContainerDatabase:(id)a3 itemType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableSet);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v19 = v6;
  id v8 = [(PDApplePayCloudStoreContainer *)self allPossibleZoneNamesForContainerDatabase:v6];
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    unint64_t v12 = a4 - 1;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v13);
        unint64_t v20 = 0;
        +[PKCloudStoreZone zoneValueForZoneName:v14 outZoneType:&v20 outAccountIdentifier:0 altDSID:0];
        switch(v12)
        {
          case 0uLL:
            if (v20 - 1 < 8) {
              goto LABEL_8;
            }
            break;
          case 4uLL:
            if (v20 <= 8 && ((1 << v20) & 0x176) != 0) {
              goto LABEL_8;
            }
            break;
          case 5uLL:
            if (v20 - 3 < 4) {
              goto LABEL_8;
            }
            break;
          case 6uLL:
            if (v20 == 7) {
              goto LABEL_8;
            }
            break;
          case 7uLL:
            goto LABEL_8;
          case 8uLL:
          case 9uLL:
            if (v20 == 1) {
LABEL_8:
            }
              [v7 addObject:v14];
            break;
          default:
            break;
        }
        id v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      id v16 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      id v10 = v16;
    }
    while (v16);
  }

  id v17 = [v7 copy];
  return v17;
}

- (id)allPossibleZoneSubscriptionsForContainerDatabase:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  if ([v4 scope] == (id)2)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = -[PDApplePayCloudStoreContainer allPossibleZoneNamesForContainerDatabase:](self, "allPossibleZoneNamesForContainerDatabase:", v4, 0);
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [v4 zoneForZoneName:*(void *)(*((void *)&v15 + 1) + 8 * i)];
          unint64_t v12 = [(PDApplePayCloudStoreContainer *)self subscriptionForZone:v11 inContainerDatabase:v4];
          if (v12) {
            [v5 addObject:v12];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
  id v13 = [v5 copy];

  return v13;
}

- (id)possibleDatabaseSubscriptionForContainerDatabase:(id)a3
{
  id v4 = a3;
  if ([v4 scope] == (id)3)
  {
    id v5 = [(PDCloudStoreContainer *)self containerManager];
    id v6 = [v5 containerName];
    id v7 = [v4 identifier];
    id v8 = +[NSString stringWithFormat:@"%@%@%@%@%@", v6, @"-", v7, @"-", @"database-subscription"];

    id v9 = [objc_alloc((Class)CKDatabaseSubscription) initWithSubscriptionID:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)subscriptionForZone:(id)a3 inContainerDatabase:(id)a4
{
  id v5 = a3;
  if ([a4 scope] != (id)2)
  {
    id v13 = 0;
    goto LABEL_16;
  }
  id v6 = [v5 zoneID];
  id v7 = [v6 zoneName];

  id v8 = (void *)PKCloudStoreTransactionsZoneName;
  id v9 = v7;
  id v10 = v8;
  if (v9 == v10)
  {

    goto LABEL_9;
  }
  uint64_t v11 = v10;
  if (v9 && v10)
  {
    unsigned __int8 v12 = [v9 isEqualToString:v10];

    if ((v12 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    uint64_t v14 = @"PDCloudStoreManagerTransactionZoneSubscriptionID";
    goto LABEL_12;
  }

LABEL_11:
  uint64_t v14 = +[NSString stringWithFormat:@"%@%@%@", v9, @"-", @"subscription"];
LABEL_12:
  id v13 = 0;
  if (v5 && v14)
  {
    id v15 = objc_alloc((Class)CKRecordZoneSubscription);
    long long v16 = [v5 zoneID];
    id v13 = [v15 initWithZoneID:v16 subscriptionID:v14];
  }
LABEL_16:

  return v13;
}

- (id)zoneIDForSubscription:(id)a3 inContainerDatabase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 scope] != (id)2)
  {
    uint64_t v11 = 0;
    goto LABEL_13;
  }
  id v7 = [v5 subscriptionID];
  id v8 = v7;
  if (v7 == @"PDCloudStoreManagerTransactionZoneSubscriptionID"
    || v7
    && (unsigned int v9 = [(__CFString *)v7 isEqualToString:@"PDCloudStoreManagerTransactionZoneSubscriptionID"], v8, v9))
  {
    id v10 = PKCloudStoreTransactionsZoneName;
  }
  else
  {
    unsigned __int8 v12 = (char *)[(__CFString *)v8 rangeOfString:@"subscription"] - 1;
    if (v12 >= [(__CFString *)v8 length])
    {
LABEL_11:
      uint64_t v11 = 0;
      goto LABEL_12;
    }
    id v10 = [(__CFString *)v8 substringToIndex:v12];
  }
  id v13 = v10;
  if (!v10) {
    goto LABEL_11;
  }
  uint64_t v14 = [v6 zoneForZoneName:v10];
  uint64_t v11 = [v14 zoneID];

LABEL_12:
LABEL_13:

  return v11;
}

- (id)cloudStoreZonesForItem:(id)a3 action:(unint64_t)a4 inContainerDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = 0;
  switch((unint64_t)[v8 itemType])
  {
    case 1uLL:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v8;
        id v104 = [v13 serviceIdentifier];
      }
      else
      {
        id v13 = 0;
        id v104 = 0;
      }
      long long v21 = [v13 accountIdentifier];
      id v22 = [v13 accountType];
      id v23 = [v13 transactionSourceIdentifier];
      if (v21)
      {
        if (v22) {
          uint64_t v24 = (uint64_t)v22;
        }
        else {
          uint64_t v24 = 2;
        }
      }
      else
      {
        int v33 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v115 = v8;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Assuming the item is for the peer payment account since the account identifier wasnt defined %@", buf, 0xCu);
        }

        long long v21 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount identifier];
        uint64_t v24 = 1;
      }
      id v109 = self;
      uint64_t v96 = v24;
      if (v23) {
        goto LABEL_82;
      }
      if ((unint64_t)(v24 - 2) < 3)
      {
        long long v112 = 0u;
        long long v113 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        obja = self->_accounts;
        id v23 = [(NSSet *)obja countByEnumeratingWithState:&v110 objects:v122 count:16];
        if (!v23) {
          goto LABEL_81;
        }
        id v99 = v13;
        unint64_t v107 = a4;
        uint64_t v52 = *(void *)v111;
        while (1)
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v111 != v52) {
              objc_enumerationMutation(obja);
            }
            uint64_t v54 = *(void **)(*((void *)&v110 + 1) + 8 * i);
            id v55 = [v54 accountIdentifier];
            id v56 = v21;
            int64_t v57 = v56;
            if (v55 == v56)
            {
              id v58 = v21;

LABEL_65:
              id v37 = [v54 associatedPassUniqueID];
              if (v37)
              {
                id v63 = [(PDCloudStoreContainer *)v109 dataSource];
                uint64_t v64 = [v63 transactionSourceIdentifiersForPassUniqueIdentifier:v37];
                id v23 = [v64 anyObject];

                a4 = v107;
                id v13 = v99;
                long long v21 = v58;
                self = v109;
                goto LABEL_78;
              }
              id v13 = v99;
              a4 = v107;
              long long v21 = v58;
              if (v96 == 3)
              {
                self = v109;
                id v63 = [(PDCloudStoreContainer *)v109 dataSource];
                id v23 = [v63 transactionSourceIdentifierForAccountIdentifier:v57];
LABEL_78:
              }
              else
              {
                id v23 = 0;
                self = v109;
              }
              uint64_t v24 = v96;
              goto LABEL_80;
            }
            id v58 = v21;
            if (v21 && v55)
            {
              unsigned int v59 = [v55 isEqualToString:v56];

              if (v59) {
                goto LABEL_65;
              }
            }
            else
            {
            }
            long long v21 = v58;
            self = v109;
          }
          id v23 = [(NSSet *)obja countByEnumeratingWithState:&v110 objects:v122 count:16];
          if (!v23)
          {
            a4 = v107;
            uint64_t v24 = v96;
            id v13 = v99;
            goto LABEL_81;
          }
        }
      }
      if (v24 != 1)
      {
        id v23 = 0;
        goto LABEL_82;
      }
      uint64_t v34 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount peerPaymentAccountWithIdentifier:v21];
      peerPaymentAccount = self->_peerPaymentAccount;
      id v36 = [(PDCloudStoreContainer *)self dataSource];
      obja = (NSSet *)v34;
      if ((PKPeerPaymentAccount *)v34 == peerPaymentAccount)
      {
        long long v88 = v36;
        long long v89 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedPassUniqueID];
        id v37 = v88;
        long long v90 = [v88 transactionSourceIdentifiersForPassUniqueIdentifier:v89];
        id v23 = [v90 anyObject];

        uint64_t v24 = v96;
      }
      else
      {
        id v37 = v36;
        id v23 = [v36 transactionSourceIdentifierForPeerPaymentAccountIdentifier:v21];
      }
LABEL_80:

LABEL_81:
LABEL_82:
      id v68 = [v13 altDSID];
      id v69 = v23;
      id v70 = objc_msgSend(objc_alloc((Class)PKCloudStoreZoneQueryConfiguration), "initWithItemType:recordName:", objc_msgSend(v8, "itemType"), v104);
      [v70 setAccountIdentifier:v21];
      [v70 setAccountType:v24];
      v100 = v69;
      [v70 setTransactionSourceIdentifier:v69];
      id objb = v68;
      [v70 setAltDSID:v68];
      -[PDApplePayCloudStoreContainer cloudStoreZonesForItemType:configuration:action:inContainerDatabase:](self, "cloudStoreZonesForItemType:configuration:action:inContainerDatabase:", [v8 itemType], v70, a4, v9);
      id v10 = v71 = v24;
      if ([v10 count]) {
        goto LABEL_101;
      }
      if ((unint64_t)(v71 - 2) >= 3)
      {
        if (v71 != 1) {
          goto LABEL_101;
        }
        id v74 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount peerPaymentAccountWithIdentifier:v21];
        if (!v74) {
          goto LABEL_99;
        }
        long long v95 = v74;
        uint64_t v78 = [(PDApplePayCloudStoreContainer *)self _peerPaymentZoneNamesForAccount:v74 containerDatabase:v9];
LABEL_98:
        uint64_t v79 = (void *)v78;
        unsigned int v80 = [(PDCloudStoreContainer *)self containerManager];
        uint64_t v93 = [v80 cloudStoreZonesFromZoneNames:v79 inContainerDatabase:v9];

        id v10 = (void *)v93;
        id v74 = v95;
LABEL_99:
        id v68 = objb;
        goto LABEL_100;
      }
      id v72 = [(PDCloudStoreContainer *)self dataSource];
      unsigned __int8 v73 = [v72 accountWithIdentifier:v21];

      id v74 = v73;
      long long v95 = v73;
      if (![v73 isSharedAccount]) {
        goto LABEL_92;
      }
      id v68 = objb;
      if (v21 && objb)
      {
        NSErrorUserInfoKey v75 = [(PDCloudStoreContainer *)self dataSource];
        id v76 = [v75 accountUserWithAltDSID:objb accountIdentifier:v21];

        if (v76)
        {
          id v77 = [(PDApplePayCloudStoreContainer *)self _accountZoneNamesForAccountUser:v76 containerDatabase:v9];
          long long v91 = [(PDCloudStoreContainer *)self containerManager];
          uint64_t v92 = [v91 cloudStoreZonesFromZoneNames:v77 inContainerDatabase:v9];

          id v10 = (void *)v92;
        }
        id v74 = v95;

LABEL_92:
        id v68 = objb;
      }
      if (![v10 count] && v74)
      {
        uint64_t v78 = [(PDApplePayCloudStoreContainer *)self _accountZoneNamesForAccount:v74 containerDatabase:v9];
        goto LABEL_98;
      }
LABEL_100:

LABEL_101:
      if (![v10 count])
      {
        id v81 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          [v9 identifier];
          __int16 v83 = v82 = a4;
          PKPaymentTransactionAccountTypeToString();
          v85 = long long v84 = v21;
          *(_DWORD *)long long buf = 138413058;
          id v115 = v83;
          __int16 v116 = 2112;
          v117 = v84;
          __int16 v118 = 2112;
          v119 = v85;
          __int16 v120 = 2112;
          id v121 = v13;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "No cloud store zones for transaction in container scope %@ with account identifier %@, accountType %@, %@", buf, 0x2Au);

          long long v21 = v84;
          self = v109;

          a4 = v82;
        }

        id v68 = objb;
      }

      goto LABEL_106;
    case 5uLL:
      objc_opt_class();
      unint64_t v106 = a4;
      if (objc_opt_isKindOfClass()) {
        id v14 = v8;
      }
      else {
        id v14 = 0;
      }
      uint64_t v25 = [v14 identifier];
      __int16 v26 = [v14 accountIdentifier];
      id obj = v14;
      id v27 = [v14 altDSID];
      id v108 = (void *)v25;
      id v28 = objc_msgSend(objc_alloc((Class)PKCloudStoreZoneQueryConfiguration), "initWithItemType:recordName:", objc_msgSend(v8, "itemType"), v25);
      [v28 setAccountIdentifier:v26];
      id v29 = [(PDCloudStoreContainer *)self dataSource];
      __int16 v30 = [v29 accountWithIdentifier:v26];

      id v105 = v30;
      id v31 = [v30 type];
      if (v31 == (id)1)
      {
        uint64_t v32 = 2;
      }
      else if (v31 == (id)3)
      {
        uint64_t v32 = 4;
      }
      else
      {
        if (v31 != (id)4) {
          goto LABEL_36;
        }
        uint64_t v32 = 3;
      }
      [v28 setAccountType:v32];
LABEL_36:
      [v28 setAltDSID:v27];
      if (v27 && !PKAltDSIDIsCurrentUser())
      {
        int v39 = [(PDCloudStoreContainer *)self dataSource];
        id v43 = [v39 transactionSourceIdentifierForAccountUserAltDSID:v27 accountIdentifier:v26];
      }
      else
      {
        id v38 = [(PDCloudStoreContainer *)self dataSource];
        int v39 = [v38 passUniqueIdentifierWithAssociatedAccountIdentifier:v26];

        int v40 = [(PDCloudStoreContainer *)self dataSource];
        unsigned int v41 = [v40 transactionSourceIdentifiersForPassUniqueIdentifier:v39];
        uint64_t v42 = [v41 anyObject];

        id v43 = (void *)v42;
      }

      [v28 setTransactionSourceIdentifier:v43];
      id v10 = -[PDApplePayCloudStoreContainer cloudStoreZonesForItemType:configuration:action:inContainerDatabase:](self, "cloudStoreZonesForItemType:configuration:action:inContainerDatabase:", [v8 itemType], v28, v106, v9);
      if ([v10 count]) {
        goto LABEL_70;
      }
      long long v98 = v43;
      uint64_t v44 = [(PDCloudStoreContainer *)self dataSource];
      id v45 = [v44 accountWithIdentifier:v26];

      unsigned int v46 = [v45 isSharedAccount];
      if (v27 && v46 && v26)
      {
        id v47 = [(PDCloudStoreContainer *)self dataSource];
        id v48 = [v47 accountUserWithAltDSID:v27 accountIdentifier:v26];

        if (!v48)
        {
          id v43 = v98;
          goto LABEL_68;
        }
        long long v94 = v48;
        long long v97 = v45;
        int v49 = [(PDApplePayCloudStoreContainer *)self _accountZoneNamesForAccountUser:v48 containerDatabase:v9];
        int v50 = [(PDCloudStoreContainer *)self containerManager];
        uint64_t v51 = [v50 cloudStoreZonesFromZoneNames:v49 inContainerDatabase:v9];

        id v10 = v50;
        id v43 = v98;
LABEL_63:

        id v10 = (void *)v51;
        id v48 = v94;
        id v45 = v97;
LABEL_68:

        goto LABEL_69;
      }
      if (![v10 count])
      {
        id v43 = v98;
        if (!v45) {
          goto LABEL_69;
        }
        long long v97 = v45;
        uint64_t v60 = [(PDApplePayCloudStoreContainer *)self _accountZoneNamesForAccount:v45 containerDatabase:v9];
        id v61 = [(PDCloudStoreContainer *)self containerManager];
        long long v94 = (void *)v60;
        uint64_t v62 = v60;
        int v49 = v61;
        uint64_t v51 = [v61 cloudStoreZonesFromZoneNames:v62 inContainerDatabase:v9];
        goto LABEL_63;
      }
      id v43 = v98;
LABEL_69:

LABEL_70:
      if (![v10 count])
      {
        id v65 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        {
          [v9 identifier];
          id v67 = v66 = v43;
          *(_DWORD *)long long buf = 138412546;
          id v115 = v8;
          __int16 v116 = 2112;
          v117 = v67;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Could not find cloud store zones for account event %@ in container database %@", buf, 0x16u);

          id v43 = v66;
        }
      }
      a4 = v106;
LABEL_106:
      long long v86 = [(PDApplePayCloudStoreContainer *)self filterCloudStoreZones:v10 action:a4 inContainerDatabase:v9];

      return v86;
    case 7uLL:
      uint64_t v12 = [(PDApplePayCloudStoreContainer *)self _accountZoneNamesForAccount:v8 containerDatabase:v9];
      goto LABEL_9;
    case 8uLL:
      id v17 = v8;
      long long v18 = [v17 zoneName];
      if (v18)
      {
        id v19 = [(PDCloudStoreContainer *)self containerManager];
        unint64_t v20 = +[NSSet setWithObject:v18];
        id v10 = [v19 cloudStoreZonesFromZoneNames:v20 inContainerDatabase:v9];
      }
      else
      {
        id v10 = 0;
      }

      goto LABEL_106;
    case 9uLL:
    case 0xAuLL:
      uint64_t v11 = self->_peerPaymentAccount;
      if (v11)
      {
        uint64_t v12 = [(PDApplePayCloudStoreContainer *)self _peerPaymentZoneNamesForAccount:v11 containerDatabase:v9];
LABEL_9:
        id v15 = (void *)v12;
        long long v16 = [(PDCloudStoreContainer *)self containerManager];
        id v10 = [v16 cloudStoreZonesFromZoneNames:v15 inContainerDatabase:v9];
      }
      else
      {
        id v10 = 0;
      }
      goto LABEL_106;
    default:
      goto LABEL_106;
  }
}

- (id)filterCloudStoreZones:(id)a3 action:(unint64_t)a4 inContainerDatabase:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  id v27 = objc_alloc_init((Class)NSMutableSet);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v32;
    *(void *)&long long v10 = 138412802;
    long long v26 = v10;
LABEL_3:
    uint64_t v13 = 0;
    while (2)
    {
      if (*(void *)v32 != v12) {
        objc_enumerationMutation(v8);
      }
      id v14 = *(void **)(*((void *)&v31 + 1) + 8 * v13);
      id v15 = objc_msgSend(v14, "zoneName", v26);
      switch((unint64_t)[v14 zoneType])
      {
        case 0uLL:
          goto LABEL_22;
        case 1uLL:
        case 2uLL:
        case 7uLL:
        case 8uLL:
          if (((unint64_t)[v7 scope] | 2) != 3) {
            goto LABEL_26;
          }
          goto LABEL_22;
        case 3uLL:
          id v20 = [v7 scope];
          if (v20 != (id)1 && (v20 != (id)3 || a4 > 3 || a4 == 2)) {
            goto LABEL_26;
          }
          goto LABEL_22;
        case 5uLL:
        case 6uLL:
          id v29 = 0;
          id v30 = 0;
          +[PKCloudStoreZone zoneValueForZoneName:v15 outZoneType:0 outAccountIdentifier:&v30 altDSID:&v29];
          id v16 = v30;
          id v17 = v29;
          long long v18 = (char *)[v7 scope];
          if ((unint64_t)(v18 - 2) >= 2)
          {
            if (v18 != (char *)1) {
              goto LABEL_25;
            }
LABEL_21:

            goto LABEL_22;
          }
          if (!a4) {
            goto LABEL_21;
          }
          if (a4 != 3 || [v7 scope] == (id)2)
          {
LABEL_25:

LABEL_26:
            [v27 addObject:v14];
            goto LABEL_27;
          }
          char v19 = PKAltDSIDIsCurrentUser();

          if (v19) {
            goto LABEL_26;
          }
LABEL_22:
          long long v21 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            id v22 = PDCloudStoreZoneActionToString(a4);
            id v23 = [v7 identifier];
            *(_DWORD *)long long buf = v26;
            id v36 = v14;
            __int16 v37 = 2112;
            id v38 = v22;
            __int16 v39 = 2112;
            int v40 = v23;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Filtering zone %@ for action \"%@\" in container %@", buf, 0x20u);
          }
LABEL_27:

          if (v11 != (id)++v13) {
            continue;
          }
          id v11 = [v8 countByEnumeratingWithState:&v31 objects:v41 count:16];
          if (!v11) {
            goto LABEL_29;
          }
          goto LABEL_3;
        default:
          goto LABEL_26;
      }
    }
  }
LABEL_29:

  id v24 = [v27 copy];
  return v24;
}

- (id)cloudStoreZonesForItemType:(unint64_t)a3 configuration:(id)a4 action:(unint64_t)a5 inContainerDatabase:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [v10 recordName];
  uint64_t v13 = (void *)v12;
  id v14 = 0;
  switch(a3)
  {
    case 1uLL:
      if (v12)
      {
        id v17 = +[PKPaymentTransaction recordNamePrefix];
        uint64_t v18 = [v13 stringByReplacingOccurrencesOfString:v17 withString:&stru_10075AAD8];

        char v19 = [v10 transactionSourceIdentifier];
        if (!v19)
        {
          id v20 = [(PDCloudStoreContainer *)self dataSource];
          long long v21 = [v10 accountIdentifier];
          char v19 = objc_msgSend(v20, "transactionSourceIdentifierForTransactionWithServiceIdentifier:accountIdentifier:accountType:", v18, v21, objc_msgSend(v10, "accountType"));

          if (!v19)
          {
            id v22 = [(PDCloudStoreContainer *)self dataSource];
            id v23 = [v10 altDSID];
            id v24 = [v10 accountIdentifier];
            char v19 = [v22 transactionSourceIdentifierForAccountUserAltDSID:v23 accountIdentifier:v24];
          }
        }
        uint64_t v25 = [(PDCloudStoreContainer *)self dataSource];
        id v26 = [v25 transactionSourceTypeForTransactionSourceIdentifier:v19];

        switch((unint64_t)v26)
        {
          case 0uLL:
            unint64_t v139 = a5;
            id v27 = [(PDCloudStoreContainer *)self dataSource];
            id v28 = [v27 passUniqueIdentifierForTransactionSourceIdentifier:v19];

            uint64_t v135 = v18;
            id v137 = v19;
            if (v28) {
              goto LABEL_66;
            }
            *(void *)long long buf = 0;
            id v29 = [(PDCloudStoreContainer *)self dataSource];
            id v148 = 0;
            id v149 = 0;
            id v30 = [v29 broadwayOrSurfTransactionSourceIdentifierForAmbiguousServiceIdentifier:v18 transactionAccountIdentifier:&v149 transactionAccountType:buf transactionAltDSID:&v148];
            id v31 = v149;
            id v32 = v148;

            if (v30)
            {
              [(PDCloudStoreContainer *)self dataSource];
              id obja = v32;
              long long v34 = v33 = v31;
              id v28 = [v34 passUniqueIdentifierForTransactionSourceIdentifier:v30];

              id v31 = v33;
              id v32 = obja;
              [v10 setAccountIdentifier:v31];
              [v10 setAccountType:*(void *)buf];
              [v10 setAltDSID:obja];
            }
            else
            {
              id v28 = 0;
            }

            if (v28)
            {
LABEL_66:
              long long v85 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedPassUniqueID];
              id v86 = v28;
              id v87 = v85;
              if (v86 == v87)
              {
              }
              else
              {
                long long v88 = v87;
                if (!v87)
                {

                  goto LABEL_74;
                }
                unsigned int v89 = [v86 isEqualToString:v87];

                if (!v89)
                {
LABEL_74:
                  uint64_t v92 = [v10 accountIdentifier];
                  uint64_t v93 = [v10 altDSID];
                  long long v94 = v93;
                  if (v93)
                  {
                    id v95 = v93;
                  }
                  else
                  {
                    PKCurrentUserAltDSID();
                    id v95 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  long long v91 = v95;

                  accounts = self->_accounts;
                  v146[0] = _NSConcreteStackBlock;
                  v146[1] = 3221225472;
                  v146[2] = sub_1000C5580;
                  v146[3] = &unk_1007344A0;
                  id v90 = v92;
                  id v147 = v90;
                  long long v97 = [(NSSet *)accounts pk_anyObjectPassingTest:v146];
                  long long v132 = v97;
                  if ([v97 isSharedAccount] && v90 && v91)
                  {
                    id v129 = v90;
                    long long v98 = [(PDCloudStoreContainer *)self dataSource];
                    id v99 = [v98 transactionArchiveForTransactionWithServiceIdentifier:v18 transactionSourceIdentifier:v137];

                    id obj = v99;
                    v100 = [(NSSet *)v99 locations];
                    objc_msgSend(v100, "pk_setByApplyingBlock:", &stru_1007344E0);
                    id v101 = (id)objc_claimAutoreleasedReturnValue();

                    id v102 = [(PDCloudStoreContainer *)self containerManager];
                    id v14 = [v102 cloudStoreZonesFromZoneNames:v101 inContainerDatabase:v11];

                    if (![v14 count])
                    {
                      id v103 = [(PDCloudStoreContainer *)self dataSource];
                      id v104 = [v103 accountUserWithAltDSID:v91 accountIdentifier:v129];

                      if (v104)
                      {
                        v130 = v104;
                        id v105 = [(PDApplePayCloudStoreContainer *)self _accountZoneNamesForAccountUser:v104 containerDatabase:v11];
                        unint64_t v106 = [(PDCloudStoreContainer *)self containerManager];
                        uint64_t v126 = [v106 cloudStoreZonesFromZoneNames:v105 inContainerDatabase:v11];

                        id v104 = v130;
                        id v14 = (void *)v126;
                      }
                    }
LABEL_104:
                    id v90 = v129;
                  }
                  else
                  {
                    id v107 = [0 count];
                    if (!v97 || v107)
                    {
                      id v14 = 0;
                      a5 = v139;
                      if ([0 count]) {
                        goto LABEL_107;
                      }
                      long long v144 = 0u;
                      long long v145 = 0u;
                      long long v142 = 0u;
                      long long v143 = 0u;
                      id obj = self->_accounts;
                      id v131 = [(NSSet *)obj countByEnumeratingWithState:&v142 objects:v159 count:16];
                      if (v131)
                      {
                        id v128 = v86;
                        id v129 = v90;
                        uint64_t v127 = *(void *)v143;
                        while (2)
                        {
                          for (i = 0; i != v131; i = (char *)i + 1)
                          {
                            if (*(void *)v143 != v127) {
                              objc_enumerationMutation(obj);
                            }
                            long long v113 = *(void **)(*((void *)&v142 + 1) + 8 * i);
                            id v114 = [v113 associatedPassUniqueID];
                            id v115 = v86;
                            id v116 = v114;
                            if (v115 == v116)
                            {

LABEL_103:
                              v119 = [(PDApplePayCloudStoreContainer *)self _accountZoneNamesForAccount:v113 containerDatabase:v11];
                              id v101 = [v119 mutableCopy];

                              __int16 v120 = [v10 zoneName];
                              objc_msgSend(v101, "pk_safelyAddObject:", v120);

                              id v121 = [(PDCloudStoreContainer *)self containerManager];
                              id v14 = [v121 cloudStoreZonesFromZoneNames:v101 inContainerDatabase:v11];

                              id v86 = v128;
                              goto LABEL_104;
                            }
                            v117 = v116;
                            if (v86 && v116)
                            {
                              unsigned int v118 = [v115 isEqualToString:v116];

                              if (v118) {
                                goto LABEL_103;
                              }
                            }
                            else
                            {
                            }
                            id v86 = v128;
                          }
                          id v131 = [(NSSet *)obj countByEnumeratingWithState:&v142 objects:v159 count:16];
                          if (v131) {
                            continue;
                          }
                          break;
                        }
                        id v14 = 0;
                        a5 = v139;
                        id v90 = v129;
                      }
                      else
                      {
                        id v14 = 0;
                      }
LABEL_106:

LABEL_107:
LABEL_108:

                      uint64_t v18 = v135;
                      char v19 = v137;
LABEL_109:
                      if (![v14 count])
                      {
                        id v122 = PKLogFacilityTypeGetObject();
                        if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
                        {
                          v123 = PKCloudStoreItemTypeToString();
                          [v11 identifier];
                          unsigned __int8 v124 = v141 = a5;
                          v125 = PKTransactionSourceTypeToString();
                          *(_DWORD *)long long buf = 138544386;
                          *(void *)&uint8_t buf[4] = v123;
                          __int16 v151 = 2114;
                          uint64_t v152 = v18;
                          __int16 v153 = 2112;
                          id v154 = v124;
                          __int16 v155 = 2112;
                          CFStringRef v156 = v19;
                          __int16 v157 = 2114;
                          v158 = v125;
                          _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_DEFAULT, "No zones for itemType %{public}@, recordName %{public}@, containerDatabaseScope %@, transactionSourceIdentifier %@, transactionSourceType %{public}@", buf, 0x34u);

                          a5 = v141;
                        }
                      }
                      uint64_t v13 = (void *)v18;
                      goto LABEL_38;
                    }
                    [(PDApplePayCloudStoreContainer *)self _accountZoneNamesForAccount:v97 containerDatabase:v11];
                    id v109 = v108 = v90;
                    long long v110 = (NSSet *)[v109 mutableCopy];

                    long long v111 = [v10 zoneName];
                    [(NSSet *)v110 pk_safelyAddObject:v111];

                    id v90 = v108;
                    id v101 = [(PDCloudStoreContainer *)self containerManager];
                    id obj = v110;
                    id v14 = [v101 cloudStoreZonesFromZoneNames:v110 inContainerDatabase:v11];
                  }

                  a5 = v139;
                  goto LABEL_106;
                }
              }
              id v90 = [(PDApplePayCloudStoreContainer *)self _peerPaymentZoneNamesForAccount:self->_peerPaymentAccount containerDatabase:v11];
              long long v91 = [(PDCloudStoreContainer *)self containerManager];
              id v14 = [v91 cloudStoreZonesFromZoneNames:v90 inContainerDatabase:v11];
              a5 = v139;
              goto LABEL_108;
            }
            id v86 = 0;
            goto LABEL_74;
          case 1uLL:
            NSErrorUserInfoKey v75 = [(PDCloudStoreContainer *)self dataSource];
            id v76 = [v75 peerPaymentAccountForTransactionSourceIdentifier:v19];

            if (!v76) {
              goto LABEL_62;
            }
            uint64_t v77 = [(PDApplePayCloudStoreContainer *)self _peerPaymentZoneNamesForAccount:v76 containerDatabase:v11];
            goto LABEL_61;
          case 2uLL:
            uint64_t v78 = [(PDCloudStoreContainer *)self dataSource];
            id v76 = [v78 accountUserWithTransactionSourceIdentifier:v19];

            if (!v76) {
              goto LABEL_62;
            }
            uint64_t v77 = [(PDApplePayCloudStoreContainer *)self _accountZoneNamesForAccountUser:v76 containerDatabase:v11];
            goto LABEL_61;
          case 3uLL:
            uint64_t v79 = [(PDCloudStoreContainer *)self dataSource];
            id v76 = [v79 accountWithTransactionSourceIdentifier:v19];

            if (v76)
            {
              uint64_t v77 = [(PDApplePayCloudStoreContainer *)self _accountZoneNamesForAccount:v76 containerDatabase:v11];
LABEL_61:
              unsigned int v80 = (void *)v77;
              [(PDCloudStoreContainer *)self containerManager];
              id v81 = v19;
              uint64_t v82 = v18;
              v84 = unint64_t v83 = a5;
              id v14 = [v84 cloudStoreZonesFromZoneNames:v80 inContainerDatabase:v11];

              a5 = v83;
              uint64_t v18 = v82;
              char v19 = v81;
            }
            else
            {
LABEL_62:
              id v14 = 0;
            }

            goto LABEL_109;
          default:
            id v14 = 0;
            goto LABEL_109;
        }
      }
      unsigned int v46 = self;
      id v47 = v11;
      uint64_t v48 = 1;
LABEL_26:
      uint64_t v16 = [(PDApplePayCloudStoreContainer *)v46 allPossibleZoneNamesForContainerDatabase:v47 itemType:v48];
LABEL_27:
      int v49 = (void *)v16;
      int v50 = [(PDCloudStoreContainer *)self containerManager];
      id v14 = [v50 cloudStoreZonesFromZoneNames:v49 inContainerDatabase:v11];

LABEL_37:
LABEL_38:
      id v63 = [(PDApplePayCloudStoreContainer *)self filterCloudStoreZones:v14 action:a5 inContainerDatabase:v11];

      return v63;
    case 5uLL:
      if (!v12)
      {
        unsigned int v46 = self;
        id v47 = v11;
        uint64_t v48 = 5;
        goto LABEL_26;
      }
      uint64_t v35 = +[PKAccountEvent eventIdentifierFromRecordName:v12];
      id v36 = [(PDCloudStoreContainer *)self dataSource];
      uint64_t v138 = (void *)v35;
      __int16 v37 = [v36 accountEventWithIdentifier:v35];

      id v38 = [v37 accountIdentifier];
      __int16 v39 = v38;
      if (v38)
      {
        id v40 = v38;
      }
      else
      {
        id v40 = [v10 accountIdentifier];
      }
      id v56 = v40;
      unint64_t v140 = a5;

      int64_t v57 = [v37 altDSID];
      id v58 = v57;
      v136 = v37;
      if (v57)
      {
        id v59 = v57;
      }
      else
      {
        id v59 = [v10 altDSID];
      }
      id v65 = v59;

      id v66 = [(PDCloudStoreContainer *)self dataSource];
      id v67 = [v66 accountWithIdentifier:v56];

      if ([v67 isSharedAccount] && v56 && v65)
      {
        id v68 = [(PDCloudStoreContainer *)self dataSource];
        id v69 = [v68 accountUserWithAltDSID:v65 accountIdentifier:v56];

        id v70 = [(PDApplePayCloudStoreContainer *)self _accountZoneNamesForAccountUser:v69 containerDatabase:v11];
        id v71 = [v70 mutableCopy];

        id v72 = [v10 zoneName];
        objc_msgSend(v71, "pk_safelyAddObject:", v72);
      }
      else
      {
        id v71 = 0;
        if ([0 count] || !v67)
        {
LABEL_50:
          if ([v71 count])
          {
            id v74 = [(PDCloudStoreContainer *)self containerManager];
            id v14 = [v74 cloudStoreZonesFromZoneNames:v71 inContainerDatabase:v11];
          }
          else
          {
            id v14 = 0;
          }

          a5 = v140;
          goto LABEL_38;
        }
        unsigned __int8 v73 = [(PDApplePayCloudStoreContainer *)self _accountZoneNamesForAccount:v67 containerDatabase:v11];
        id v71 = [v73 mutableCopy];

        id v69 = [v10 zoneName];
        objc_msgSend(v71, "pk_safelyAddObject:", v69);
      }

      goto LABEL_50;
    case 7uLL:
      if (!v12)
      {
        uint64_t v51 = [(PDApplePayCloudStoreContainer *)self allPossibleZoneNamesForContainerDatabase:v11 itemType:7];
        uint64_t v52 = [(PDCloudStoreContainer *)self containerManager];
        id v53 = [v52 cloudStoreZonesFromZoneNames:v51 inContainerDatabase:v11];

LABEL_29:
        uint64_t v54 = [(PDApplePayCloudStoreContainer *)self allPossibleZoneNamesForContainerDatabase:v11 itemType:a3];
        id v55 = [(PDCloudStoreContainer *)self containerManager];
        id v14 = [v55 cloudStoreZonesFromZoneNames:v54 inContainerDatabase:v11];

        uint64_t v13 = 0;
        goto LABEL_38;
      }
      unsigned int v41 = +[PKAccount accountIdentifierFromRecordName:v12];
      uint64_t v42 = [(PDCloudStoreContainer *)self dataSource];
      id v43 = [v42 accountWithIdentifier:v41];

      uint64_t v44 = 0;
      if (![0 count] && v43)
      {
        uint64_t v44 = [(PDApplePayCloudStoreContainer *)self _accountZoneNamesForAccount:v43 containerDatabase:v11];
      }
      if ([v44 count])
      {
        id v45 = [(PDCloudStoreContainer *)self containerManager];
        id v14 = [v45 cloudStoreZonesFromZoneNames:v44 inContainerDatabase:v11];
      }
      else
      {
        id v14 = 0;
      }

LABEL_35:
      int v49 = +[PKCloudStoreZoneShareLock zoneNameFromRecordName:v13];
      if (v49)
      {
        uint64_t v60 = [(PDCloudStoreContainer *)self containerManager];
        id v61 = +[NSSet setWithObject:v49];
        uint64_t v62 = [v60 cloudStoreZonesFromZoneNames:v61 inContainerDatabase:v11];

        id v14 = (void *)v62;
      }
      goto LABEL_37;
    case 8uLL:
      if (!v12) {
        goto LABEL_29;
      }
      id v14 = 0;
      goto LABEL_35;
    case 9uLL:
    case 0xAuLL:
      peerPaymentAccount = self->_peerPaymentAccount;
      if (peerPaymentAccount)
      {
        uint64_t v16 = [(PDApplePayCloudStoreContainer *)self _peerPaymentZoneNamesForAccount:peerPaymentAccount containerDatabase:v11];
        goto LABEL_27;
      }
      id v14 = 0;
      goto LABEL_38;
    default:
      goto LABEL_38;
  }
}

- (void)_queue_processPeerPaymentAccountChangeWithOldAccount:(id)a3 newPeerPaymentAccount:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PDCloudStoreContainer *)self containerManager];
  id v13 = [v8 databaseForScope:2];

  id v9 = [(PDApplePayCloudStoreContainer *)self _peerPaymentZoneNamesForAccount:v6 containerDatabase:v13];

  id v10 = [(PDApplePayCloudStoreContainer *)self _peerPaymentZoneNamesForAccount:v7 containerDatabase:v13];

  id v11 = [v10 mutableCopy];
  [v11 minusSet:v9];
  uint64_t v12 = [(PDApplePayCloudStoreContainer *)self _accountZoneNamesForAccountSet:self->_accounts containerDatabase:v13];
  [v11 minusSet:v12];
  [(PDApplePayCloudStoreContainer *)self _queue_updateWithPossibleNewZonesToAdd:v9 orphanedZones:v11 containerDatabase:v13];
}

- (void)_queue_processAccountChangeWithOldAccounts:(id)a3 newAccounts:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PDCloudStoreContainer *)self containerManager];
  id v13 = [v8 databaseForScope:2];

  id v9 = [(PDApplePayCloudStoreContainer *)self _accountZoneNamesForAccountSet:v6 containerDatabase:v13];

  id v10 = [(PDApplePayCloudStoreContainer *)self _accountZoneNamesForAccountSet:v7 containerDatabase:v13];

  id v11 = [v10 mutableCopy];
  [v11 minusSet:v9];
  uint64_t v12 = [(PDApplePayCloudStoreContainer *)self _peerPaymentZoneNamesForAccount:self->_peerPaymentAccount containerDatabase:v13];
  [v11 minusSet:v12];
  [(PDApplePayCloudStoreContainer *)self _queue_updateWithPossibleNewZonesToAdd:v9 orphanedZones:v11 containerDatabase:v13];
}

- (void)_queue_processSharedAccountCloudStoreChangeWithOldSharedAccountCloudStore:(id)a3 newSharedAccountCloudStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PDCloudStoreContainer *)self containerManager];
  id v9 = [v8 databaseForScope:2];

  id v10 = [v7 sharedAccountCloudStoreZonesWithAccess:1];
  id v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Old shared account cloud store %@: ", (uint8_t *)&v13, 0xCu);
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "New shared account cloud store %@: ", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v12 = objc_msgSend(v10, "pk_setByApplyingBlock:", &stru_100734520);
  [(PDApplePayCloudStoreContainer *)self _queue_updateWithPossibleNewZonesToAdd:v12 orphanedZones:0 containerDatabase:v9];
}

- (void)_queue_updateWithPossibleNewZonesToAdd:(id)a3 orphanedZones:(id)a4 containerDatabase:(id)a5
{
  id v8 = a3;
  id v38 = a4;
  id v9 = a5;
  id v10 = [(PDCloudStoreContainer *)self containerManager];
  uint64_t v11 = [v10 containerName];

  uint64_t v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218498;
    id v56 = [v8 count];
    __int16 v57 = 2112;
    id v58 = v8;
    __int16 v59 = 2114;
    uint64_t v60 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%lu possible new zones to add for %@ container: %{public}@", buf, 0x20u);
  }
  __int16 v39 = (void *)v11;
  oslog = v12;

  id v13 = [objc_alloc((Class)NSMutableSet) initWithSet:v8];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v14 = v8;
  id v15 = [v14 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v48;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v48 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        id v20 = [(PDCloudStoreContainer *)self containerManager];
        long long v21 = [v20 cloudStoreZoneForZoneName:v19 inContainerDatabase:v9];

        if (v21) {
          [v13 removeObject:v19];
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v47 objects:v54 count:16];
    }
    while (v16);
  }

  id v22 = v39;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = [v13 count];
    *(_DWORD *)long long buf = 134218498;
    id v56 = v23;
    __int16 v57 = 2112;
    id v58 = v13;
    __int16 v59 = 2112;
    uint64_t v60 = (uint64_t)v39;
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%lu new zones that need to be created %@ for container: %@", buf, 0x20u);
  }

  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = [v38 count];
    *(_DWORD *)long long buf = 134218498;
    id v56 = v24;
    __int16 v57 = 2112;
    id v58 = v38;
    __int16 v59 = 2112;
    uint64_t v60 = (uint64_t)v39;
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%lu zones that are orphaned from all accounts %@ for container: %@", buf, 0x20u);
  }

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1000C5F34;
  v46[3] = &unk_10072E1E8;
  v46[4] = self;
  uint64_t v25 = objc_retainBlock(v46);
  if ([v13 count])
  {
    os_log_t osloga = v25;
    id v26 = objc_alloc_init((Class)NSMutableSet);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v27 = v13;
    id v28 = [v27 countByEnumeratingWithState:&v42 objects:v53 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v43;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v43 != v30) {
            objc_enumerationMutation(v27);
          }
          id v32 = [v9 zoneForZoneName:*(void *)(*((void *)&v42 + 1) + 8 * (void)j)];
          [v26 addObject:v32];
        }
        id v29 = [v27 countByEnumeratingWithState:&v42 objects:v53 count:16];
      }
      while (v29);
    }

    id v33 = [v9 identifier];
    uint64_t v51 = v33;
    id v52 = v26;
    long long v34 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    uint64_t v35 = PKCloudStoreOperationGroupSuffixAccountModified;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000C5F70;
    v40[3] = &unk_1007305A0;
    v40[4] = self;
    uint64_t v25 = osloga;
    unsigned int v41 = osloga;
    [(PDCloudStoreContainer *)self _queue_createZoneAndSubscriptionsByDatabaseIdentifier:v34 groupSuffix:v35 completion:v40];

    id v22 = v39;
  }
  else if ([(PDApplePayCloudStoreContainer *)self _queue_canInvalidateContainer])
  {
    [(PDApplePayCloudStoreContainer *)self invalidateCloudStoreIfPossibleWithOperationGroupNameSuffix:PKCloudStoreOperationGroupSuffixPKAccountRemoved clearCache:1];
  }
  else
  {
    ((void (*))v25[2].isa)(v25);
  }
}

- (id)_peerPaymentZoneNamesForAccount:(id)a3 containerDatabase:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableSet);
  id v8 = [v6 cloudStoreZoneNames];

  unint64_t v9 = (unint64_t)[v5 scope];
  if ((v9 & 0xFFFFFFFFFFFFFFFELL) == 2 && [v8 count])
  {
    id v10 = [v8 anyObject];
    [v7 addObject:v10];
  }
  id v11 = [v7 copy];

  return v11;
}

- (id)_accountZoneNamesForAccountSet:(id)a3 containerDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableSet);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = -[PDApplePayCloudStoreContainer _accountZoneNamesForAccount:containerDatabase:](self, "_accountZoneNamesForAccount:containerDatabase:", *(void *)(*((void *)&v17 + 1) + 8 * i), v7, (void)v17);
        [v8 unionSet:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  id v15 = [v8 copy];
  return v15;
}

- (id)_accountZoneNamesForAccountUser:(id)a3 containerDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accountIdentifier];
  if (v8)
  {
    id v9 = (char *)[v7 scope];
    if ((unint64_t)(v9 - 1) > 2) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = qword_1005B31D0[(void)(v9 - 1)];
    }
    id v13 = [(NSDictionary *)self->_sharedAccountCloudStoreByAccountIdentifier objectForKey:v8];
    id v14 = [(NSDictionary *)self->_accountUsersByAccountIdentifier objectForKeyedSubscript:v8];
    id v15 = [v13 primaryZoneForAccountUser:v6 inAccountUserCollection:v14 access:v10];
    id v16 = v15;
    if (v15)
    {
      long long v17 = [v15 zoneName];
      uint64_t v12 = +[NSSet setWithObject:v17];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Error: an account identifier is not defined for account user %@", (uint8_t *)&v19, 0xCu);
    }

    uint64_t v12 = 0;
  }

  return v12;
}

- (id)_accountZoneNamesForAccount:(id)a3 containerDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableSet);
  if ([v6 isSharedAccount])
  {
    accountUsersByAccountIdentifier = self->_accountUsersByAccountIdentifier;
    uint64_t v10 = [v6 accountIdentifier];
    id v11 = [(NSDictionary *)accountUsersByAccountIdentifier objectForKey:v10];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v12 = objc_msgSend(v11, "accountUsers", 0);
    id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = [(PDApplePayCloudStoreContainer *)self _accountZoneNamesForAccountUser:*(void *)(*((void *)&v22 + 1) + 8 * i) containerDatabase:v7];
          if ([v17 count]) {
            [v8 unionSet:v17];
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v14);
    }
  }
  else if ([v7 scope] == (id)2)
  {
    long long v18 = [v6 cloudStoreZoneNames];
    if ([v18 count])
    {
      if ([v6 feature] == (id)4)
      {
        [v8 addObjectsFromArray:v18];
      }
      else
      {
        int v19 = [v18 firstObject];
        [v8 addObject:v19];
      }
    }
  }
  id v20 = [v8 copy];

  return v20;
}

- (void)_queue_ensureZoneShareIntegrity
{
  if (self->_ensuringZoneShareIntegrityInProgress)
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "A zone share integrity operation is already in progress.", buf, 2u);
    }
  }
  else
  {
    self->_ensuringZoneShareIntegrityInProgress = 1;
    [(PDCloudStoreContainer *)self reportContainerChangeIntervalBeginEventWithType:40 stateName:0 objectNames:0 operationGroupName:0 operationGroupNameSuffix:0];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000C676C;
    v4[3] = &unk_10072E198;
    v4[4] = self;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v2 = v5;
    [(PDApplePayCloudStoreContainer *)self _queue_createOrRemoveZoneSharesIfNecessaryWithCompletion:v4];
  }
}

- (void)_queue_createOrRemoveZoneSharesForPeerPaymentIfNecessaryWithCompletion:(id)a3
{
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000C6B60;
  v20[3] = &unk_10072F788;
  id v4 = a3;
  id v21 = v4;
  id v5 = objc_retainBlock(v20);
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting zone share integrity check for peer payment.", buf, 2u);
  }

  id v7 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount cloudStoreZoneNames];
  id v8 = [(PDCloudStoreContainer *)self containerManager];
  id v9 = [(PDCloudStoreContainer *)self containerManager];
  uint64_t v10 = [v9 databaseForScope:2];
  id v11 = [v8 cloudStoreZonesFromZoneNames:v7 inContainerDatabase:v10];

  if ([v11 count])
  {
    uint64_t v12 = +[NSPredicate predicateWithFormat:@"zoneName BEGINSWITH %@", PKApplePayContainerCashZoneNamePrefix];
    id v13 = [v11 filteredSetUsingPredicate:v12];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting zone share integrity operation", buf, 2u);
    }

    id v14 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount role];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    void v15[2] = sub_1000C6BE4;
    v15[3] = &unk_1007345E8;
    id v11 = v13;
    id v19 = v14;
    id v16 = v11;
    long long v17 = self;
    long long v18 = v5;
    [(PDApplePayCloudStoreContainer *)self _queue_familyMembersWithCompletion:v15];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      long long v23 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "There are no cached cloud store zones for zone names in private database %@", buf, 0xCu);
    }

    ((void (*)(void *))v5[2])(v5);
  }
}

- (void)_queue_createOrRemoveZoneSharesForAccountsIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sharedAccountCloudStoreByAccountIdentifier = self->_sharedAccountCloudStoreByAccountIdentifier;
    accountUsersByAccountIdentifier = self->_accountUsersByAccountIdentifier;
    *(_DWORD *)long long buf = 138412546;
    long long v22 = sharedAccountCloudStoreByAccountIdentifier;
    __int16 v23 = 2112;
    long long v24 = accountUsersByAccountIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting zone share integrity check for accounts.\nsharedAccountCloudStore => %@\nusers=> %@", buf, 0x16u);
  }

  id v8 = [(PDCloudStoreContainer *)self containerManager];
  id v9 = [v8 databaseForScope:2];

  uint64_t v10 = [(PDCloudStoreContainer *)self containerManager];
  id v11 = [v10 databaseForScope:3];

  PKCurrentUserAltDSID();
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000C7DB4;
  v16[3] = &unk_100734660;
  void v16[4] = self;
  id v17 = v9;
  id v18 = v11;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v20 = v4;
  id v12 = v4;
  id v13 = v19;
  id v14 = v11;
  id v15 = v9;
  [(PDApplePayCloudStoreContainer *)self _queue_familyMembersByAltDSIDWithCompletion:v16];
}

- (void)_queue_createOrRemoveZoneSharesIfNecessaryWithCompletion:(id)a3
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000C903C;
  v14[3] = &unk_10072F788;
  id v15 = a3;
  id v4 = v15;
  id v5 = objc_retainBlock(v14);
  id v6 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000C90C0;
  v13[3] = &unk_10072E5C0;
  v13[4] = self;
  [v6 addOperation:v13];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000C919C;
  v12[3] = &unk_10072E5C0;
  v12[4] = self;
  [v6 addOperation:v12];
  id v7 = +[NSNull null];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000C9278;
  v10[3] = &unk_100734688;
  id v11 = v5;
  id v8 = v5;
  id v9 = [v6 evaluateWithInput:v7 completion:v10];
}

- (id)_allPossibleCloudStoreZonesForFetchingWithTransactionSourceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PDCloudStoreContainer *)self dataSource];
  v100 = v4;
  id v6 = [v5 transactionSourceTypeForTransactionSourceIdentifier:v4];

  id v7 = objc_alloc_init((Class)NSMutableSet);
  switch((unint64_t)v6)
  {
    case 0uLL:
      id v8 = [(PDCloudStoreContainer *)self dataSource];
      id v9 = [v8 passUniqueIdentifierForTransactionSourceIdentifier:v100];

      peerPaymentAccount = self->_peerPaymentAccount;
      if (peerPaymentAccount)
      {
        id v11 = [(PKPeerPaymentAccount *)peerPaymentAccount associatedPassUniqueID];
        id v12 = v9;
        id v13 = v11;
        id v14 = v13;
        if (v12 == v13)
        {
          unsigned int v15 = 1;
        }
        else
        {
          unsigned int v15 = 0;
          if (v12 && v13) {
            unsigned int v15 = [v12 isEqualToString:v13];
          }
        }
      }
      else
      {
        unsigned int v15 = 0;
      }
      id v61 = [(PDCloudStoreContainer *)self dataSource];
      uint64_t v62 = [v61 associatedAccountIdentifierForPassWithUniqueIdentifier:v9];

      id obj = v62;
      id v63 = [v62 length];
      if (v15)
      {
        uint64_t v64 = [(PDCloudStoreContainer *)self containerManager];
        id v19 = [v64 databaseForScope:2];

        long long v142 = 0u;
        long long v143 = 0u;
        long long v140 = 0u;
        long long v141 = 0u;
        id v103 = [(PDApplePayCloudStoreContainer *)self _peerPaymentZoneNamesForAccount:self->_peerPaymentAccount containerDatabase:v19];
        id v65 = [v103 countByEnumeratingWithState:&v140 objects:v151 count:16];
        if (v65)
        {
          id v66 = v65;
          uint64_t v67 = *(void *)v141;
          do
          {
            for (i = 0; i != v66; i = (char *)i + 1)
            {
              if (*(void *)v141 != v67) {
                objc_enumerationMutation(v103);
              }
              uint64_t v69 = *(void *)(*((void *)&v140 + 1) + 8 * i);
              id v70 = [(PDCloudStoreContainer *)self containerManager];
              id v71 = [v70 cloudStoreZoneForZoneName:v69 inContainerDatabase:v19];

              if (v71) {
                [v7 addObject:v71];
              }
            }
            id v66 = [v103 countByEnumeratingWithState:&v140 objects:v151 count:16];
          }
          while (v66);
        }
      }
      else
      {
        if (!v63) {
          goto LABEL_94;
        }
        long long v111 = v9;
        id v72 = [(PDCloudStoreContainer *)self dataSource];
        uint64_t v94 = [v72 accountWithIdentifier:v62];

        PKCurrentUserAltDSID();
        id v103 = (id)objc_claimAutoreleasedReturnValue();
        long long v136 = 0u;
        long long v137 = 0u;
        long long v138 = 0u;
        long long v139 = 0u;
        unsigned __int8 v73 = [(PDCloudStoreContainer *)self containerManager];
        id v74 = [v73 validDatabases];

        id v95 = v74;
        id v99 = [v74 countByEnumeratingWithState:&v136 objects:v150 count:16];
        if (v99)
        {
          uint64_t v96 = *(void *)v137;
          do
          {
            for (j = 0; j != v99; j = (char *)j + 1)
            {
              if (*(void *)v137 != v96) {
                objc_enumerationMutation(v95);
              }
              id v76 = *(void **)(*((void *)&v136 + 1) + 8 * (void)j);
              uint64_t v77 = [(PDCloudStoreContainer *)self dataSource];
              uint64_t v78 = [v77 accountUserWithAltDSID:v103 accountIdentifier:obj];

              id v108 = (void *)v78;
              if (v78)
              {
                uint64_t v79 = (char *)[v76 scope];
                if ((unint64_t)(v79 - 1) > 2) {
                  uint64_t v80 = 0;
                }
                else {
                  uint64_t v80 = qword_1005B31D0[(void)(v79 - 1)];
                }
                uint64_t v82 = [(NSDictionary *)self->_sharedAccountCloudStoreByAccountIdentifier objectForKey:obj];
                unint64_t v83 = [v82 allPossibleZonesForAccountUser:v78 access:v80];
                long long v84 = objc_msgSend(v83, "pk_arrayByApplyingBlock:", &stru_1007346A8);
                id v81 = +[NSSet setWithArray:v84];
              }
              else
              {
                id v81 = [(PDApplePayCloudStoreContainer *)self _accountZoneNamesForAccount:v94 containerDatabase:v76];
              }
              long long v134 = 0u;
              long long v135 = 0u;
              long long v132 = 0u;
              long long v133 = 0u;
              id v85 = v81;
              id v86 = [v85 countByEnumeratingWithState:&v132 objects:v149 count:16];
              if (v86)
              {
                id v87 = v86;
                uint64_t v88 = *(void *)v133;
                do
                {
                  for (k = 0; k != v87; k = (char *)k + 1)
                  {
                    if (*(void *)v133 != v88) {
                      objc_enumerationMutation(v85);
                    }
                    uint64_t v90 = *(void *)(*((void *)&v132 + 1) + 8 * (void)k);
                    long long v91 = [(PDCloudStoreContainer *)self containerManager];
                    uint64_t v92 = [v91 cloudStoreZoneForZoneName:v90 inContainerDatabase:v76];

                    if (v92) {
                      [v7 addObject:v92];
                    }
                  }
                  id v87 = [v85 countByEnumeratingWithState:&v132 objects:v149 count:16];
                }
                while (v87);
              }
            }
            id v99 = [v95 countByEnumeratingWithState:&v136 objects:v150 count:16];
          }
          while (v99);
        }

        id v9 = v111;
        id v19 = (void *)v94;
      }

      goto LABEL_93;
    case 1uLL:
      id v16 = [(PDCloudStoreContainer *)self containerManager];
      id v9 = [v16 databaseForScope:3];

      id v17 = [(PDCloudStoreContainer *)self dataSource];
      uint64_t v18 = [v17 peerPaymentAccountForTransactionSourceIdentifier:v100];

      long long v130 = 0u;
      long long v131 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      id obj = (id)v18;
      id v19 = [(PDApplePayCloudStoreContainer *)self _peerPaymentZoneNamesForAccount:v18 containerDatabase:v9];
      id v20 = [v19 countByEnumeratingWithState:&v128 objects:v148 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v129;
        do
        {
          for (m = 0; m != v21; m = (char *)m + 1)
          {
            if (*(void *)v129 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v128 + 1) + 8 * (void)m);
            long long v25 = [(PDCloudStoreContainer *)self containerManager];
            id v26 = [v25 cloudStoreZoneForZoneName:v24 inContainerDatabase:v9];

            if (v26) {
              [v7 addObject:v26];
            }
          }
          id v21 = [v19 countByEnumeratingWithState:&v128 objects:v148 count:16];
        }
        while (v21);
      }
LABEL_93:

      goto LABEL_94;
    case 2uLL:
      long long v126 = 0u;
      long long v127 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      id v27 = [(PDCloudStoreContainer *)self containerManager];
      id v9 = [v27 validDatabases];

      id v101 = [v9 countByEnumeratingWithState:&v124 objects:v147 count:16];
      if (v101)
      {
        uint64_t v97 = *(void *)v125;
        id v109 = v9;
        do
        {
          for (n = 0; n != v101; n = (char *)n + 1)
          {
            if (*(void *)v125 != v97) {
              objc_enumerationMutation(v9);
            }
            id v29 = *(void **)(*((void *)&v124 + 1) + 8 * (void)n);
            uint64_t v30 = [(PDCloudStoreContainer *)self dataSource];
            id v31 = [v30 accountUserWithTransactionSourceIdentifier:v100];

            id v32 = (char *)[v29 scope];
            if ((unint64_t)(v32 - 1) > 2) {
              uint64_t v33 = 0;
            }
            else {
              uint64_t v33 = qword_1005B31D0[(void)(v32 - 1)];
            }
            sharedAccountCloudStoreByAccountIdentifier = self->_sharedAccountCloudStoreByAccountIdentifier;
            uint64_t v35 = [v31 accountIdentifier];
            id v36 = [(NSDictionary *)sharedAccountCloudStoreByAccountIdentifier objectForKey:v35];

            id obja = v36;
            unint64_t v106 = v31;
            __int16 v37 = [v36 allPossibleZonesForAccountUser:v31 access:v33];
            id v38 = objc_msgSend(v37, "pk_arrayByApplyingBlock:", &stru_1007346C8);
            __int16 v39 = +[NSSet setWithArray:v38];

            long long v122 = 0u;
            long long v123 = 0u;
            long long v120 = 0u;
            long long v121 = 0u;
            id v40 = v39;
            id v41 = [v40 countByEnumeratingWithState:&v120 objects:v146 count:16];
            if (v41)
            {
              id v42 = v41;
              uint64_t v43 = *(void *)v121;
              do
              {
                for (ii = 0; ii != v42; ii = (char *)ii + 1)
                {
                  if (*(void *)v121 != v43) {
                    objc_enumerationMutation(v40);
                  }
                  uint64_t v45 = *(void *)(*((void *)&v120 + 1) + 8 * (void)ii);
                  unsigned int v46 = [(PDCloudStoreContainer *)self containerManager];
                  long long v47 = [v46 cloudStoreZoneForZoneName:v45 inContainerDatabase:v29];

                  if (v47) {
                    [v7 addObject:v47];
                  }
                }
                id v42 = [v40 countByEnumeratingWithState:&v120 objects:v146 count:16];
              }
              while (v42);
            }

            id v9 = v109;
          }
          id v101 = [v109 countByEnumeratingWithState:&v124 objects:v147 count:16];
        }
        while (v101);
      }
      goto LABEL_95;
    case 3uLL:
      long long v48 = [(PDCloudStoreContainer *)self dataSource];
      id v9 = [v48 accountWithTransactionSourceIdentifier:v100];

      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      long long v49 = [(PDCloudStoreContainer *)self containerManager];
      long long v50 = [v49 validDatabases];

      id obj = v50;
      id v102 = [v50 countByEnumeratingWithState:&v116 objects:v145 count:16];
      if (v102)
      {
        uint64_t v98 = *(void *)v117;
        long long v110 = v9;
        do
        {
          uint64_t v51 = 0;
          do
          {
            if (*(void *)v117 != v98) {
              objc_enumerationMutation(obj);
            }
            uint64_t v107 = v51;
            uint64_t v52 = *(void *)(*((void *)&v116 + 1) + 8 * v51);
            id v53 = [(PDApplePayCloudStoreContainer *)self _accountZoneNamesForAccount:v9 containerDatabase:v52];
            long long v112 = 0u;
            long long v113 = 0u;
            long long v114 = 0u;
            long long v115 = 0u;
            id v54 = [v53 countByEnumeratingWithState:&v112 objects:v144 count:16];
            if (v54)
            {
              id v55 = v54;
              uint64_t v56 = *(void *)v113;
              do
              {
                for (jj = 0; jj != v55; jj = (char *)jj + 1)
                {
                  if (*(void *)v113 != v56) {
                    objc_enumerationMutation(v53);
                  }
                  uint64_t v58 = *(void *)(*((void *)&v112 + 1) + 8 * (void)jj);
                  __int16 v59 = [(PDCloudStoreContainer *)self containerManager];
                  uint64_t v60 = [v59 cloudStoreZoneForZoneName:v58 inContainerDatabase:v52];

                  if (v60) {
                    [v7 addObject:v60];
                  }
                }
                id v55 = [v53 countByEnumeratingWithState:&v112 objects:v144 count:16];
              }
              while (v55);
            }

            id v9 = v110;
            uint64_t v51 = v107 + 1;
          }
          while ((id)(v107 + 1) != v102);
          id v102 = [obj countByEnumeratingWithState:&v116 objects:v145 count:16];
        }
        while (v102);
      }
LABEL_94:

LABEL_95:
      break;
    default:
      break;
  }

  return v7;
}

- (void)_handleFamilyUpdateNotification:(id)a3
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FAFamilyUpdateNotification fired", buf, 2u);
  }

  id v5 = [(PDCloudStoreContainer *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C9E08;
  block[3] = &unk_10072E1E8;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (void)_queue_familyMembersWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    familyCircleManager = self->_familyCircleManager;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000C9EC4;
    v7[3] = &unk_1007346F0;
    v7[4] = self;
    id v8 = v4;
    [(PDFamilyCircleManager *)familyCircleManager familyMembersWithCachePolicy:0 completion:v7];
  }
}

- (void)_queue_familyMembersByAltDSIDWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    familyCircleManager = self->_familyCircleManager;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000CA050;
    v7[3] = &unk_1007346F0;
    v7[4] = self;
    id v8 = v4;
    [(PDFamilyCircleManager *)familyCircleManager familyMembersWithCachePolicy:0 completion:v7];
  }
}

- (void)_updateUnarchivedTransactionsScheduledActivityIfNeccessary
{
  id v3 = PKCloudStoreOperationGroupSuffixFetchTaskBackgroundActivity;
  if ((PDScheduledActivityExists() & 1) == 0)
  {
    if ([(PDCloudStoreContainer *)self isCloudStoreSetupAssistantComplete])
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_1000CA3F0;
      v5[3] = &unk_100732CB8;
      v5[4] = self;
      v5[5] = v3;
      [(PDCloudStoreContainer *)self initialCloudDatabaseSetupWithOperationGroupNameSuffix:v3 completion:v5];
    }
    else
    {
      id v4 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        CFStringRef v7 = @"ApplePayCloudStoreUnarchivedTask";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Not scheduling %{public}@ since PDCloudStoreContainerSetupAssistantState is not complete", buf, 0xCu);
      }
    }
  }
}

- (void)_updateFetchTaskScheduledActivityIfNeccessary
{
  id v3 = PKCloudStoreOperationGroupSuffixFetchTaskBackgroundActivity;
  if ([(PDCloudStoreContainer *)self isCloudStoreSetupAssistantComplete])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000CA7F0;
    v5[3] = &unk_100732CB8;
    v5[4] = self;
    v5[5] = v3;
    [(PDCloudStoreContainer *)self initialCloudDatabaseSetupWithOperationGroupNameSuffix:v3 completion:v5];
  }
  else
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      CFStringRef v7 = @"ApplePayCloudStorePerformFetchTasks";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Not scheduling %{public}@ since PDCloudStoreContainerSetupAssistantState is not complete", buf, 0xCu);
    }
  }
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKCloudStoreOperationGroupScheduledActivity;
  id v9 = PKCloudStoreOperationGroupSuffixFetchTaskBackgroundActivity;
  uint64_t v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PDApplePayCloudStoreContainer starting activity: %{public}@", buf, 0xCu);
  }

  id v11 = [(NSMutableDictionary *)self->_backgroundTasksBeingRun objectForKeyedSubscript:v6];
  unsigned int v12 = [v11 BOOLValue];

  if ([(PDCloudStoreContainer *)self isCloudStoreSetupAssistantComplete])
  {
    if (!v12)
    {
      [(NSMutableDictionary *)self->_backgroundTasksBeingRun setObject:&__kCFBooleanTrue forKeyedSubscript:v6];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000CB14C;
      v14[3] = &unk_10072F278;
      void v14[4] = self;
      id v15 = v6;
      id v16 = v8;
      id v17 = v9;
      [(PDCloudStoreContainer *)self initialCloudDatabaseSetupWithOperationGroupNameSuffix:v9 completion:v14];

      goto LABEL_12;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v19 = v6;
      id v13 = "PDApplePayCloudStoreContainer not running %{public}@ since one is already in progress";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v19 = v6;
    id v13 = "PDApplePayCloudStoreContainer not running %{public}@ since setup assistant is not complete";
    goto LABEL_9;
  }

LABEL_12:
}

- (void)_queue_performFetchTasksBackgroundActivityForGroupName:(id)a3 suffix:(id)a4 completion:(id)a5
{
  id v104 = a3;
  id v127 = a4;
  id v103 = (void (**)(void))a5;
  id v8 = (__CFString *)objc_alloc_init((Class)NSMutableDictionary);
  long long v111 = (__CFString *)objc_alloc_init((Class)NSMutableDictionary);
  long long v112 = (__CFString *)objc_alloc_init((Class)NSMutableSet);
  long long v118 = (__CFString *)objc_alloc_init((Class)NSMutableSet);
  os_unfair_lock_t lock = &self->_fetchTasksLock;
  os_unfair_lock_lock(&self->_fetchTasksLock);
  uint64_t v9 = +[NSDate date];
  long long v120 = (__CFString *)objc_alloc_init((Class)NSMutableArray);
  long long v123 = (__CFString *)objc_alloc_init((Class)NSMutableArray);
  long long v116 = (__CFString *)objc_alloc_init((Class)NSMutableArray);
  uint64_t v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    fetchTasks = self->_fetchTasks;
    *(_DWORD *)long long buf = 138543618;
    CFStringRef v157 = @"ApplePayCloudStorePerformFetchTasks";
    __int16 v158 = 2112;
    v159 = fetchTasks;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Current cloud store fetch tasks for acivity %{public}@: %@", buf, 0x16u);
  }
  oslog = v10;

  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  id obj = self->_fetchTasks;
  id v128 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v147 objects:v168 count:16];
  long long v130 = self;
  long long v119 = (void *)v9;
  if (v128)
  {
    uint64_t v124 = *(void *)v148;
    do
    {
      unsigned int v12 = 0;
      do
      {
        if (*(void *)v148 != v124) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v147 + 1) + 8 * (void)v12);
        id v15 = [(NSMutableDictionary *)self->_fetchTasks objectForKeyedSubscript:v13];
        id v16 = [v15 task];
        id v17 = [v16 nextPossibleFetchDate];
        if (!v13 || [v16 status] != (id)3 || v17 && objc_msgSend(v17, "compare:", v9) == (id)1)
        {
          [(__CFString *)v123 safelyAddObject:v16];
          goto LABEL_13;
        }
        [(__CFString *)v120 safelyAddObject:v16];
        id v18 = [v16 type];
        if (v18 == (id)3)
        {
          [(__CFString *)v118 pk_safelyAddObject:v13];
          goto LABEL_13;
        }
        if (v18 == (id)2)
        {
          uint64_t v35 = [(PDCloudStoreContainer *)self dataSource];
          unsigned __int8 v36 = [v35 transactionSourceExistsWithIdentifier:v13];

          if (v36)
          {
            [(__CFString *)v112 pk_safelyAddObject:v13];
          }
          else
          {
            [(__CFString *)v116 safelyAddObject:v16];
            [(__CFString *)v120 removeObject:v16];
          }
        }
        else
        {
          if (v18 != (id)1) {
            goto LABEL_13;
          }
          id v19 = [(PDCloudStoreContainer *)self dataSource];
          id v20 = self;
          unsigned __int8 v21 = [v19 transactionSourceExistsWithIdentifier:v13];

          if ((v21 & 1) == 0)
          {
            [(__CFString *)v116 safelyAddObject:v16];
            [(__CFString *)v120 removeObject:v16];
            self = v20;
            uint64_t v9 = (uint64_t)v119;
            goto LABEL_13;
          }
          uint64_t v22 = [(PDCloudStoreContainer *)v20 dataSource];
          id v23 = [v22 transactionSourceTypeForTransactionSourceIdentifier:v13];

          self = v20;
          uint64_t v9 = (uint64_t)v119;
          switch((unint64_t)v23)
          {
            case 0uLL:
              uint64_t v24 = [(PDCloudStoreContainer *)self dataSource];
              uint64_t v25 = [v24 passUniqueIdentifierForTransactionSourceIdentifier:v13];

              id v26 = [(PDCloudStoreContainer *)self dataSource];
              long long v117 = (void *)v25;
              id v27 = [v26 passWithUniqueIdentifier:v25];
              id v28 = [v27 paymentPass];

              id v29 = v28;
              if (!v28)
              {
                self = v130;
                uint64_t v9 = (uint64_t)v119;
                goto LABEL_43;
              }
              unsigned __int8 v30 = [v28 hasAssociatedPeerPaymentAccount];
              CFStringRef v31 = @"Apple Cash";
              self = v130;
              uint64_t v9 = (uint64_t)v119;
              if ((v30 & 1) == 0)
              {
                id v108 = v29;
                if (![v29 associatedAccountFeatureIdentifier])
                {
                  id v32 = [(PDCloudStoreContainer *)v130 dataSource];
                  uint64_t v33 = [v32 associatedAccountIdentifierForPassWithUniqueIdentifier:v117];

                  long long v114 = [(PDCloudStoreContainer *)v130 dataSource];
                  long long v34 = [v114 accountWithIdentifier:v33];
                  [v34 feature];

                  self = v130;
                }
                PKFeatureIdentifierToString();
                CFStringRef v31 = (const __CFString *)objc_claimAutoreleasedReturnValue();
                id v29 = v108;
                uint64_t v9 = (uint64_t)v119;
              }
              long long v115 = (void *)v31;
              long long v113 = +[NSString stringWithFormat:@"paymentApplication, %@, %@", v117, v31];
              -[__CFString safelySetObject:forKey:](v8, "safelySetObject:forKey:");
              goto LABEL_42;
            case 1uLL:
              __int16 v37 = [(PDCloudStoreContainer *)self dataSource];
              id v38 = [v37 peerPaymentAccount];
              long long v117 = [v38 associatedPassUniqueID];

              self = v130;
              __int16 v39 = [(PDCloudStoreContainer *)v130 dataSource];
              id v40 = [v39 peerPaymentAccountForTransactionSourceIdentifier:v13];

              uint64_t v41 = [v40 identifier];
              long long v113 = [v40 altDSID];
              long long v115 = (void *)v41;
              id v42 = +[NSString stringWithFormat:@"Peer Payment Associated Account: %@, %@", v41, v113];
              [(__CFString *)v8 safelySetObject:v42 forKey:v13];

              id v29 = v40;
              uint64_t v9 = (uint64_t)v119;
              goto LABEL_42;
            case 2uLL:
              uint64_t v43 = [(PDCloudStoreContainer *)self dataSource];
              id v109 = [v43 accountUserWithTransactionSourceIdentifier:v13];

              uint64_t v44 = [v109 accountIdentifier];
              uint64_t v45 = [(PDCloudStoreContainer *)self dataSource];
              long long v115 = (void *)v44;
              long long v117 = [v45 passUniqueIdentifierWithAssociatedAccountIdentifier:v44];

              long long v113 = [v109 altDSID];
              uint64_t v107 = [v109 firstName];
              unint64_t v106 = [v109 lastName];
              id v105 = [v109 appleID];
              unsigned int v46 = +[NSString stringWithFormat:@"accountUser, %@ - %@ - %@ - %@", v113, v107, v106, v105];
              [(__CFString *)v8 safelySetObject:v46 forKey:v13];

              id v29 = v109;
              uint64_t v9 = (uint64_t)v119;

              self = v130;
              goto LABEL_42;
            case 3uLL:
              long long v47 = [(PDCloudStoreContainer *)self dataSource];
              long long v48 = [v47 accountWithTransactionSourceIdentifier:v13];

              long long v110 = v48;
              long long v115 = [v48 accountIdentifier];
              long long v49 = [(PDCloudStoreContainer *)self dataSource];
              long long v50 = [v49 passUniqueIdentifierForTransactionSourceIdentifier:v13];

              if (!v50)
              {
                if ([v110 feature] == (id)5)
                {
                  accountManager = self->_accountManager;
                  uint64_t v52 = [(NSSet *)self->_accounts allObjects];
                  id v53 = [(PDAccountManager *)accountManager defaultAccountForFeature:2 forAccounts:v52];
                  long long v50 = [v53 associatedPassUniqueID];

                  if (!v50
                    || ([(PDCloudStoreContainer *)v130 dataSource],
                        id v54 = objc_claimAutoreleasedReturnValue(),
                        unsigned __int8 v55 = [v54 passExistsWithUniqueID:v50],
                        v54,
                        (v55 & 1) == 0))
                  {

                    long long v50 = @"<savings-account>";
                  }
                  self = v130;
                }
                else
                {
                  long long v50 = 0;
                }
              }
              long long v117 = v50;
              [v110 feature];
              long long v113 = PKFeatureIdentifierToString();
              uint64_t v56 = +[NSString stringWithFormat:@"account, %@, %@", v113, v115];
              [(__CFString *)v8 safelySetObject:v56 forKey:v13];

              uint64_t v9 = (uint64_t)v119;
              id v29 = v110;
LABEL_42:

LABEL_43:
              if (!v117) {
                goto LABEL_13;
              }
              __int16 v57 = -[__CFString objectForKeyedSubscript:](v111, "objectForKeyedSubscript:");
              uint64_t v58 = v57;
              if (v57) {
                id v59 = v57;
              }
              else {
                id v59 = objc_alloc_init((Class)NSMutableSet);
              }
              uint64_t v60 = v59;

              [(__CFString *)v111 setObject:v60 forKeyedSubscript:v117];
              objc_msgSend(v60, "pk_safelyAddObject:", v13);

              break;
            default:
              goto LABEL_13;
          }
        }
        self = v130;
LABEL_13:

        unsigned int v12 = (char *)v12 + 1;
      }
      while (v128 != v12);
      id v61 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v147 objects:v168 count:16];
      id v128 = v61;
    }
    while (v61);
  }

  os_unfair_lock_unlock(lock);
  v166[0] = @"activityIdentifier";
  v166[1] = @"processingTasks";
  CFStringRef v62 = &stru_10075AAD8;
  CFStringRef v63 = v120;
  if (!v120) {
    CFStringRef v63 = &stru_10075AAD8;
  }
  v167[0] = @"ApplePayCloudStorePerformFetchTasks";
  v167[1] = v63;
  CFStringRef v64 = v123;
  if (!v123) {
    CFStringRef v64 = &stru_10075AAD8;
  }
  v166[2] = @"skippingTasks";
  v166[3] = @"transactionSourceIdentifiersToDescription";
  if (v8) {
    CFStringRef v65 = v8;
  }
  else {
    CFStringRef v65 = &stru_10075AAD8;
  }
  v167[2] = v64;
  v167[3] = v65;
  id v66 = v111;
  if (v111) {
    CFStringRef v67 = v111;
  }
  else {
    CFStringRef v67 = &stru_10075AAD8;
  }
  v166[4] = @"passUniqueIDToTransactionSourceIdentifier";
  v166[5] = @"proactiveFetchTransactionSourceIdentifiers";
  CFStringRef v68 = v112;
  if (!v112) {
    CFStringRef v68 = &stru_10075AAD8;
  }
  v167[4] = v67;
  v167[5] = v68;
  v166[6] = @"sharedZonesToFetchRecords";
  v166[7] = @"removalTasks";
  if (v118) {
    CFStringRef v69 = v118;
  }
  else {
    CFStringRef v69 = &stru_10075AAD8;
  }
  if (v116) {
    CFStringRef v62 = v116;
  }
  v167[6] = v69;
  v167[7] = v62;
  id v70 = +[NSDictionary dictionaryWithObjects:v167 forKeys:v166 count:8];
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138413314;
    CFStringRef v157 = v120;
    __int16 v158 = 2112;
    v159 = (NSMutableDictionary *)v123;
    __int16 v160 = 2112;
    v161 = v116;
    __int16 v162 = 2114;
    CFStringRef v163 = @"ApplePayCloudStorePerformFetchTasks";
    __int16 v164 = 2112;
    v165 = v70;
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Processing fetch tasks %@, skipping fetch tasks %@, removing fetch tasks %@, for scheduled activity %{public}@. %@", buf, 0x34u);
  }

  id obja = v70;
  id v71 = [v70 description];
  __int16 v155 = v71;
  id v72 = +[NSArray arrayWithObjects:&v155 count:1];
  unsigned __int8 v73 = v104;
  [(PDCloudStoreContainer *)self reportContainerChangeSignpostEventType:55 stateName:@"ApplePayCloudStorePerformFetchTasks" objectNames:v72 changeToken:0 error:0 operationGroupName:v104 operationGroupNameSuffix:v127];

  [(PDApplePayCloudStoreContainer *)self _queue_ensureZoneShareIntegrity];
  if ([(__CFString *)v116 count])
  {
    id v74 = [(PDCloudStoreContainer *)self dataSource];
    [v74 removeRecordFetchTasks:v116];
  }
  if ([(__CFString *)v118 count])
  {
    NSErrorUserInfoKey v75 = [(PDCloudStoreContainer *)self containerManager];
    id v76 = [v75 databaseForScope:3];

    long long v145 = 0u;
    long long v146 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    uint64_t v77 = v118;
    id v78 = [(__CFString *)v77 countByEnumeratingWithState:&v143 objects:v154 count:16];
    if (v78)
    {
      id v79 = v78;
      uint64_t v80 = *(void *)v144;
      do
      {
        for (i = 0; i != v79; i = (char *)i + 1)
        {
          if (*(void *)v144 != v80) {
            objc_enumerationMutation(v77);
          }
          uint64_t v82 = *(void *)(*((void *)&v143 + 1) + 8 * i);
          unint64_t v83 = [(PDCloudStoreContainer *)v130 containerManager];
          long long v84 = [v83 cloudStoreZoneForZoneName:v82 inContainerDatabase:v76];

          id v85 = [v76 identifier];
          [(PDApplePayCloudStoreContainer *)v130 fetchRecordsInAcceptedZoneShare:v84 databaseIdentifier:v85 operationGroupName:v104 operationGroupNameSuffix:v127 qualityOfService:17 completion:0];
        }
        id v79 = [(__CFString *)v77 countByEnumeratingWithState:&v143 objects:v154 count:16];
      }
      while (v79);
    }

    id v66 = v111;
    self = v130;
  }
  if ([(__CFString *)v66 count])
  {
    long long v141 = 0u;
    long long v142 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    long long v129 = v111;
    id v126 = [(__CFString *)v129 countByEnumeratingWithState:&v139 objects:v153 count:16];
    if (v126)
    {
      uint64_t v125 = *(void *)v140;
      do
      {
        for (j = 0; j != v126; j = (char *)j + 1)
        {
          if (*(void *)v140 != v125) {
            objc_enumerationMutation(v129);
          }
          uint64_t v87 = *(void *)(*((void *)&v139 + 1) + 8 * (void)j);
          id v88 = objc_alloc_init((Class)NSMutableDictionary);
          unsigned int v89 = [(__CFString *)v129 objectForKeyedSubscript:v87];
          long long v135 = 0u;
          long long v136 = 0u;
          long long v137 = 0u;
          long long v138 = 0u;
          id v90 = [v89 countByEnumeratingWithState:&v135 objects:v152 count:16];
          if (v90)
          {
            id v91 = v90;
            uint64_t v92 = *(void *)v136;
            do
            {
              for (k = 0; k != v91; k = (char *)k + 1)
              {
                if (*(void *)v136 != v92) {
                  objc_enumerationMutation(v89);
                }
                uint64_t v94 = *(void *)(*((void *)&v135 + 1) + 8 * (void)k);
                id v95 = [(__CFString *)v8 objectForKeyedSubscript:v94];
                [v88 safelySetObject:v95 forKey:v94];
              }
              id v91 = [v89 countByEnumeratingWithState:&v135 objects:v152 count:16];
            }
            while (v91);
          }
          if ([v88 count]) {
            [(PDApplePayCloudStoreContainer *)v130 passProvisioningDidStartForPassUniqueID:v87 transactionSourceIdentifiers:v88 ignoreExistingRecordHash:0 groupNameSuffix:v127 completion:0];
          }
        }
        id v126 = [(__CFString *)v129 countByEnumeratingWithState:&v139 objects:v153 count:16];
      }
      while (v126);
    }

    unsigned __int8 v73 = v104;
    self = v130;
  }
  if ([(__CFString *)v112 count])
  {
    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    uint64_t v96 = v112;
    id v97 = [(__CFString *)v96 countByEnumeratingWithState:&v131 objects:v151 count:16];
    if (v97)
    {
      id v98 = v97;
      uint64_t v99 = *(void *)v132;
      do
      {
        for (m = 0; m != v98; m = (char *)m + 1)
        {
          if (*(void *)v132 != v99) {
            objc_enumerationMutation(v96);
          }
          [(PDApplePayCloudStoreContainer *)self requestUpdatesForTransactionSourceIdentifier:*(void *)(*((void *)&v131 + 1) + 8 * (void)m)];
        }
        id v98 = [(__CFString *)v96 countByEnumeratingWithState:&v131 objects:v151 count:16];
      }
      while (v98);
    }
  }
  [(PDApplePayCloudStoreContainer *)self _updateFetchTaskScheduledActivityIfNeccessary];
  if (v103) {
    v103[2](v103);
  }
}

- (void)_queue_performUnarchivedTransactionsBackgroundActivityForGroupName:(id)a3 suffix:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PDCloudStoreContainer *)self dataSource];
  unsigned int v12 = [v11 transactionArchivesWithType:0 isArchived:0];
  uint64_t v13 = [v12 allObjects];

  id v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134349056;
    id v44 = [v13 count];
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Uploading %{public}lu unarchived transactions", buf, 0xCu);
  }

  id v15 = objc_msgSend(v13, "pk_createArrayBySafelyApplyingBlock:", &stru_100734730);
  v41[0] = @"archivesThatNeedSyncingCount";
  id v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v13 count]);
  v41[1] = @"serviceIdentifiersToUpload";
  v42[0] = v16;
  uint64_t v17 = [v15 description];
  id v18 = (void *)v17;
  CFStringRef v19 = &stru_10075AAD8;
  if (v17) {
    CFStringRef v19 = (const __CFString *)v17;
  }
  v42[1] = v19;
  id v20 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];

  unsigned __int8 v21 = [v20 description];
  id v40 = v21;
  uint64_t v22 = +[NSArray arrayWithObjects:&v40 count:1];
  [(PDCloudStoreContainer *)self reportContainerChangeSignpostEventType:55 stateName:@"ApplePayCloudStoreUnarchivedTask" objectNames:v22 changeToken:0 error:0 operationGroupName:v10 operationGroupNameSuffix:v9];

  id v23 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  [v13 count];
  uint64_t v33 = _NSConcreteStackBlock;
  uint64_t v34 = 3221225472;
  uint64_t v35 = sub_1000CC66C;
  unsigned __int8 v36 = &unk_1007347A8;
  id v37 = v13;
  id v38 = v23;
  __int16 v39 = self;
  id v24 = v23;
  PKRangeEnumeratePartitions();
  uint64_t v25 = +[NSNull null];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000CD1B4;
  v29[3] = &unk_1007347D0;
  CFStringRef v31 = self;
  id v32 = v8;
  id v30 = v37;
  id v26 = v8;
  id v27 = v37;
  id v28 = [v24 evaluateWithInput:v25 completion:v29];
}

- (BOOL)_queue_isRelevantTransactionSourceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PDCloudStoreContainer *)self dataSource];
  id v6 = [v5 transactionSourceTypeForTransactionSourceIdentifier:v4];

  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(PDCloudStoreContainer *)self containerManager];
    id v9 = [v8 containerName];
    int v22 = 138412546;
    id v23 = v4;
    __int16 v24 = 2112;
    uint64_t v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Checking if %@ is relevant transaction source identifiers for %@", (uint8_t *)&v22, 0x16u);
  }
  switch((unint64_t)v6)
  {
    case 0uLL:
      id v10 = [(PDCloudStoreContainer *)self dataSource];
      id v11 = [v10 passUniqueIdentifierForTransactionSourceIdentifier:v4];

      peerPaymentAccount = self->_peerPaymentAccount;
      if (!peerPaymentAccount) {
        goto LABEL_25;
      }
      id v13 = [(PKPeerPaymentAccount *)peerPaymentAccount associatedPassUniqueID];
      id v14 = v11;
      id v15 = v14;
      if (v13 == v14)
      {

        goto LABEL_21;
      }
      if (v14 && v13)
      {
        unsigned int v16 = [v13 isEqualToString:v14];

        if (!v16) {
          goto LABEL_25;
        }
LABEL_21:
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = 138412290;
          id v23 = v4;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ is relevant because it is the peer payment pass", (uint8_t *)&v22, 0xCu);
        }
        LOBYTE(self) = 1;
        goto LABEL_30;
      }

LABEL_25:
      CFStringRef v19 = [(PDCloudStoreContainer *)self dataSource];
      id v20 = [v19 associatedAccountIdentifierForPassWithUniqueIdentifier:v11];

      if (!v20)
      {
        LOBYTE(self) = 0;
        goto LABEL_32;
      }
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      int v22 = 138412290;
      id v23 = v4;
      uint64_t v17 = "%@ is relevant because it has an associated account";
LABEL_28:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v22, 0xCu);
LABEL_29:
      LOBYTE(self) = 1;
      id v15 = v11;
LABEL_30:

LABEL_31:
      id v11 = v15;
LABEL_32:

LABEL_33:
      return (char)self;
    case 1uLL:
      self = [(PDCloudStoreContainer *)self dataSource];
      id v11 = [(PDApplePayCloudStoreContainer *)self peerPaymentAccountForTransactionSourceIdentifier:v4];

      LOBYTE(self) = v11 != 0;
      if (!v11) {
        goto LABEL_32;
      }
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      int v22 = 138412290;
      id v23 = v4;
      uint64_t v17 = "%@ is relevant because it has an associated peer payment account";
      goto LABEL_28;
    case 2uLL:
      self = [(PDCloudStoreContainer *)self dataSource];
      id v11 = [(PDApplePayCloudStoreContainer *)self accountUserWithTransactionSourceIdentifier:v4];

      LOBYTE(self) = v11 != 0;
      if (!v11) {
        goto LABEL_32;
      }
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      int v22 = 138412290;
      id v23 = v4;
      uint64_t v17 = "%@ is relevant because it is an account user";
      goto LABEL_28;
    case 3uLL:
      id v18 = [(PDCloudStoreContainer *)self dataSource];
      id v15 = [v18 accountWithTransactionSourceIdentifier:v4];

      LODWORD(self) = [v15 supportsStandaloneTransactions];
      if (!self) {
        goto LABEL_31;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        id v23 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ is relevant because it has a matching account", (uint8_t *)&v22, 0xCu);
      }
      goto LABEL_30;
    default:
      LOBYTE(self) = 0;
      goto LABEL_33;
  }
}

- (id)_accountCreateDateForTranactionSourceIdentifier:(id)a3 passUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PDCloudStoreContainer *)self dataSource];
  id v9 = [v8 transactionSourceTypeForTransactionSourceIdentifier:v6];

  switch((unint64_t)v9)
  {
    case 0uLL:
      id v10 = [(PDCloudStoreContainer *)self dataSource];
      id v11 = [v10 passUniqueIdentifierForTransactionSourceIdentifier:v6];

      if (v11) {
        unsigned int v12 = v11;
      }
      else {
        unsigned int v12 = v7;
      }
      id v13 = v12;

      id v14 = [(PDCloudStoreContainer *)self dataSource];
      id v15 = [v14 associatedAccountIdentifierForPassWithUniqueIdentifier:v13];

      unsigned int v16 = 0;
      if (v6 && !v15)
      {
        uint64_t v17 = [(PDCloudStoreContainer *)self dataSource];
        id v18 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedPassUniqueID];
        CFStringRef v19 = [v17 transactionSourceIdentifiersForPassUniqueIdentifier:v18];
        unsigned int v20 = [v19 containsObject:v6];

        if (v20)
        {
          unsigned int v16 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount createdDate];
        }
        else
        {
          unsigned int v16 = 0;
        }
      }
      goto LABEL_13;
    case 1uLL:
      unsigned int v16 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount createdDate];
      id v15 = 0;
      break;
    case 2uLL:
      id v11 = [(PDCloudStoreContainer *)self dataSource];
      unsigned __int8 v21 = [v11 accountUserWithTransactionSourceIdentifier:v6];
      goto LABEL_12;
    case 3uLL:
      id v11 = [(PDCloudStoreContainer *)self dataSource];
      unsigned __int8 v21 = [v11 accountWithTransactionSourceIdentifier:v6];
LABEL_12:
      int v22 = v21;
      id v15 = [v21 accountIdentifier];

      unsigned int v16 = 0;
      id v13 = v7;
LABEL_13:

      if (v15)
      {
        id v23 = [(PDCloudStoreContainer *)self dataSource];
        __int16 v24 = [v23 accountWithIdentifier:v15];
        uint64_t v25 = [v24 createdDate];

        id v7 = v13;
        unsigned int v16 = (void *)v25;
      }
      else
      {
        id v7 = v13;
      }
      break;
    default:
      id v15 = 0;
      unsigned int v16 = 0;
      break;
  }

  return v16;
}

- (id)_paymentApplicationForPassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PDCloudStoreContainer *)self dataSource];
  id v6 = [v5 paymentApplicationsForPassUniqueIdentifier:v4];

  if ([v6 count] == (id)1)
  {
    id v7 = [v6 anyObject];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_cloudStoreSpecificKeysForItem:(id)a3 paymentPass:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  if (!v5) {
    goto LABEL_19;
  }
  id v7 = [v5 serialNumber];
  id v8 = [v5 passTypeIdentifier];
  id v9 = [v5 primaryAccountIdentifier];
  id v10 = [v5 devicePrimaryPaymentApplication];
  id v11 = [v10 dpanIdentifier];

  unsigned int v12 = [(PDApplePayCloudStoreContainer *)self _originDeviceID];
  if ([v5 hasAssociatedPeerPaymentAccount])
  {
    id v13 = [(PDCloudStoreContainer *)self dataSource];
    id v14 = [v5 deviceTransactionSourceIdentifiers];
    [v14 anyObject];
    id v27 = v12;
    id v15 = v11;
    unsigned int v16 = v9;
    uint64_t v17 = v8;
    v19 = id v18 = v7;
    unsigned int v20 = [v13 peerPaymentAccountForTransactionSourceIdentifier:v19];

    id v7 = v18;
    id v8 = v17;
    id v9 = v16;
    id v11 = v15;
    unsigned int v12 = v27;

    unsigned __int8 v21 = [v20 identifier];
  }
  else
  {
    unsigned __int8 v21 = [v5 associatedAccountServiceAccountIdentifier];
    [v5 associatedAccountFeatureIdentifier];
  }
  if ([v21 length])
  {
    int v22 = &PKCloudTransactionAccountIdentifierKey;
    id v23 = v21;
  }
  else
  {
    if ([v7 length]) {
      [v6 setObject:v7 forKey:PKCloudTransactionPassSerialNumberKey];
    }
    if (![v8 length]) {
      goto LABEL_12;
    }
    int v22 = &PKCloudTransactionPassTypeIdentifierKey;
    id v23 = v8;
  }
  [v6 setObject:v23 forKey:*v22];
LABEL_12:
  if ([v9 length]) {
    [v6 setObject:v9 forKey:PKCloudTransactionFPANIdentifierKey];
  }
  if ([v11 length]) {
    [v6 setObject:v11 forKey:PKCloudTransactionDPANIdentifierKey];
  }
  if (v12) {
    [v6 setObject:v12 forKey:PKCloudTransactionOriginDeviceIDKey];
  }
  __int16 v24 = PKPaymentTransactionAccountTypeToString();
  [v6 setObject:v24 forKey:PKCloudTransactionAccountTypeKey];

  [v6 setObject:&off_10078AAD0 forKey:PKCloudTransactionCloudVersionKey];
LABEL_19:
  id v25 = [v6 copy];

  return v25;
}

- (id)_originDeviceID
{
  return +[PKSecureElement primarySecureElementIdentifier];
}

- (BOOL)_isTransactionItemFromRecordType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:PKCloudTransactionRecordType]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 isEqualToString:PKCloudTransactionDeviceDataRecordType];
  }

  return v4;
}

- (void)containerResetCompletedWithSuccess:(BOOL)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = [(PDCloudStoreContainer *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CDDD8;
  block[3] = &unk_100730438;
  BOOL v12 = a3;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)_queue_didInvalidateContainer:(BOOL)a3
{
  if (a3)
  {
    unsigned __int8 v4 = [(PDCloudStoreContainer *)self dataSource];
    id v5 = [(PDCloudStoreContainer *)self dataSource];
    id v6 = [v5 allRecordFetchTasks];
    [v4 removeRecordFetchTasks:v6];

    id v7 = [(PDCloudStoreContainer *)self dataSource];
    id v8 = [v7 allRecordFetchTasks];

    os_unfair_lock_lock(&self->_fetchTasksLock);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          unsigned int v16 = [v14 identifier];
          if ([v14 type]) {
            BOOL v17 = v16 == 0;
          }
          else {
            BOOL v17 = 1;
          }
          if (!v17)
          {
            id v18 = objc_alloc_init(PDApplePayCloudStoreRecordFetchOperation);
            [(PDApplePayCloudStoreRecordFetchOperation *)v18 updateTask:v14];
            fetchTasks = self->_fetchTasks;
            unsigned int v20 = [(PDApplePayCloudStoreRecordFetchOperation *)v18 identifier];
            [(NSMutableDictionary *)fetchTasks safelySetObject:v18 forKey:v20];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    os_unfair_lock_unlock(&self->_fetchTasksLock);
  }
}

- (BOOL)_isCloudStoreZoneThePrimaryZoneForCurrentUser:(id)a3 containerDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v32 = 0;
  unint64_t v8 = (unint64_t)[v7 scope];
  id v9 = [v6 zoneName];
  id v30 = 0;
  id v31 = 0;
  +[PKCloudStoreZone zoneValueForZoneName:v9 outZoneType:&v32 outAccountIdentifier:&v31 altDSID:&v30];
  id v10 = v31;
  id v11 = v30;
  switch(v32)
  {
    case 1:
    case 7:
    case 8:
      LOBYTE(v12) = [v7 scope] == (id)2;
      goto LABEL_34;
    case 2:
      if (v8 != 2) {
        goto LABEL_26;
      }
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id obj = self->_accounts;
      id v12 = [(NSSet *)obj countByEnumeratingWithState:&v26 objects:v33 count:16];
      if (!v12) {
        goto LABEL_31;
      }
      id v24 = v11;
      uint64_t v13 = *(void *)v27;
LABEL_8:
      id v14 = 0;
      break;
    case 3:
      if (v8 != 2) {
        goto LABEL_26;
      }
      id v20 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount identifier];
      id v21 = v10;
      long long v22 = v21;
      if (v20 == v21)
      {
        LOBYTE(v12) = 1;
      }
      else
      {
        LOBYTE(v12) = 0;
        if (v21 && v20) {
          LOBYTE(v12) = [v20 isEqualToString:v21];
        }
      }

      goto LABEL_34;
    case 4:
      LOBYTE(v12) = 1;
      goto LABEL_34;
    case 5:
    case 6:
      if ((v8 & 0xFFFFFFFFFFFFFFFELL) != 2) {
        goto LABEL_26;
      }
      LOBYTE(v12) = PKAltDSIDIsCurrentUser();
      goto LABEL_34;
    default:
LABEL_26:
      LOBYTE(v12) = 0;
      goto LABEL_34;
  }
  do
  {
    if (*(void *)v27 != v13) {
      objc_enumerationMutation(obj);
    }
    id v15 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v14);
    if ((objc_msgSend(v15, "isSharedAccount", v24) & 1) == 0)
    {
      id v16 = [v15 accountIdentifier];
      id v17 = v10;
      id v18 = v17;
      if (v16 == v17)
      {

LABEL_29:
        LOBYTE(v12) = 1;
        goto LABEL_30;
      }
      if (v10 && v16)
      {
        unsigned __int8 v19 = [v16 isEqualToString:v17];

        if (v19) {
          goto LABEL_29;
        }
      }
      else
      {
      }
    }
    id v14 = (char *)v14 + 1;
  }
  while (v12 != v14);
  id v12 = [(NSSet *)obj countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v12) {
    goto LABEL_8;
  }
LABEL_30:
  id v11 = v24;
LABEL_31:

LABEL_34:
  return (char)v12;
}

- (id)_parseTransactionRecords:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 updateReasons:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init((Class)PKCloudRecordArray);
  id v14 = objc_alloc_init((Class)NSMutableSet);
  id v15 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Parsing all fetched records.", buf, 2u);
  }

  PKLogFacilityTypeGetObject();
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, self);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v18 = v17;
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v18, "cloudstore:processTransactions", "", buf, 2u);
    }
  }

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000CEA40;
  v34[3] = &unk_100734820;
  v34[4] = self;
  id v19 = v12;
  id v35 = v19;
  id v20 = v11;
  id v36 = v20;
  unint64_t v39 = a6;
  id v21 = v13;
  id v37 = v21;
  id v22 = v14;
  id v38 = v22;
  [v10 enumerateKeysAndObjectsForItemType:1 usingBlock:v34];
  long long v23 = v16;
  os_signpost_id_t v24 = os_signpost_id_make_with_pointer(v23, self);
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v25 = v24;
    if (os_signpost_enabled(v23))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, v25, "cloudstore:processTransactions", "", buf, 2u);
    }
  }

  if ([v22 count])
  {
    long long v27 = [v22 allObjects];
    id v28 = objc_msgSend(v27, "pk_createArrayBySafelyApplyingBlock:", &stru_100734860);

    [(PDCloudStoreContainer *)self reportContainerChangeSignpostEventType:35 stateName:0 objectNames:v28 changeToken:0 error:0 operationGroupName:0 operationGroupNameSuffix:0];
    transactionProcessor = self->_transactionProcessor;
    id v30 = [v22 copy];
    [(PDPaymentTransactionProcessor *)transactionProcessor processPaymentTransactionConfigurations:v30];
  }
  id v31 = v38;
  id v32 = v21;

  return v32;
}

- (BOOL)_canFormShareFromCloudStoreRecord:(id)a3
{
  id v3 = [a3 recordsWithRecordType:CKRecordTypeShare];
  unsigned __int8 v4 = [v3 firstObject];

  return v4 != 0;
}

- (BOOL)_canFormShareLockFromCloudStoreRecord:(id)a3
{
  id v3 = [a3 recordsWithRecordType:PKCloudShareCreationLockRecordType];
  unsigned __int8 v4 = [v3 firstObject];

  return v4 != 0;
}

- (BOOL)_canFormTransactionFromCloudStoreRecord:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 recordsWithRecordType:PKCloudTransactionRecordType];
  id v5 = [v4 firstObject];

  id v6 = [v5 encryptedValues];
  id v7 = [v6 objectForKey:PKCloudTransactionCloudVersionKey];

  if (v5)
  {
    if (!v7 || [v7 integerValue] == (id)1)
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v7;
      id v10 = "Ignoring transaction record with unsupported transaction version %@";
      id v11 = v9;
      uint32_t v12 = 12;
      goto LABEL_9;
    }
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      id v10 = "Missing transaction record.";
      id v11 = v9;
      uint32_t v12 = 2;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
    }
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cannot form local transaction for cloudStoreRecord %@", (uint8_t *)&v14, 0xCu);
  }

  BOOL v8 = 0;
LABEL_13:

  return v8;
}

- (void)_processShareWithRecordParser:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_1000D09E8;
  v60[3] = &unk_100733C40;
  v60[4] = self;
  id v14 = objc_alloc_init((Class)NSMutableSet);
  id v61 = v14;
  [v13 enumerateKeysAndObjectsForItemType:6 usingBlock:v60];

  if ([v14 count])
  {
    id v38 = v12;
    id v15 = v10;
    if ([v10 returnRecords]) {
      id v36 = objc_alloc_init((Class)PKCloudRecordArray);
    }
    else {
      id v36 = 0;
    }
    id v17 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
    id v18 = objc_alloc_init((Class)NSMutableSet);
    id v19 = objc_alloc_init((Class)NSMutableSet);
    id v20 = objc_alloc_init((Class)NSMutableSet);
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_1000D0B24;
    v55[3] = &unk_100730C60;
    id v56 = v14;
    id v21 = v19;
    id v57 = v21;
    id v22 = v20;
    id v58 = v22;
    id v23 = v18;
    id v59 = v23;
    [v17 addOperation:v55];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1000D0E0C;
    v48[3] = &unk_1007348D8;
    id v49 = v21;
    id v50 = v22;
    uint64_t v51 = self;
    id v24 = v11;
    id v25 = v11;
    id v52 = v25;
    id v37 = v15;
    id v26 = v15;
    id v53 = v26;
    id v27 = v23;
    id v54 = v27;
    id v28 = v22;
    id v29 = v21;
    [v17 addOperation:v48];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    void v42[2] = sub_1000D1A40;
    v42[3] = &unk_100733B00;
    id v43 = v27;
    id v30 = v36;
    id v44 = v30;
    id v31 = v25;
    id v11 = v24;
    id v45 = v31;
    id v46 = v26;
    long long v47 = self;
    id v32 = v27;
    [v17 addOperation:v42];
    uint64_t v33 = +[NSNull null];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000D1E0C;
    v39[3] = &unk_1007341D0;
    id v16 = v38;
    id v40 = v30;
    id v41 = v38;
    id v34 = v30;
    id v35 = [v17 evaluateWithInput:v33 completion:v39];

    id v10 = v37;
  }
  else
  {
    (*((void (**)(id, void))v12 + 2))(v12, 0);
    id v16 = v12;
  }
}

- (void)_processZoneShareLockWithRecordParser:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = (void (**)(id, id))a6;
  if ([a4 returnRecords]) {
    id v12 = objc_alloc_init((Class)PKCloudRecordArray);
  }
  else {
    id v12 = 0;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  void v15[2] = sub_1000D1F3C;
  v15[3] = &unk_100733C40;
  id v13 = v12;
  id v16 = v13;
  id v17 = v10;
  id v14 = v10;
  [v9 enumerateKeysAndObjectsForItemType:8 usingBlock:v15];
  if (v11) {
    v11[2](v11, v13);
  }
}

- (void)_processRecurringPaymentsWithRecordParser:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, id))a6;
  if ([a4 returnRecords]) {
    id v13 = objc_alloc_init((Class)PKCloudRecordArray);
  }
  else {
    id v13 = 0;
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000D2210;
  v16[3] = &unk_100734928;
  void v16[4] = self;
  id v14 = v13;
  id v17 = v14;
  id v18 = v11;
  id v15 = v11;
  [v10 enumerateKeysAndObjectsForItemType:9 usingBlock:v16];
  if (v12) {
    v12[2](v12, v14);
  }
}

- (void)_processCounterpartImageDataWithRecordParser:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, id))a6;
  if ([a4 returnRecords]) {
    id v13 = objc_alloc_init((Class)PKCloudRecordArray);
  }
  else {
    id v13 = 0;
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000D26EC;
  v16[3] = &unk_100734928;
  void v16[4] = self;
  id v14 = v13;
  id v17 = v14;
  id v18 = v11;
  id v15 = v11;
  [v10 enumerateKeysAndObjectsForItemType:10 usingBlock:v16];
  if (v12) {
    v12[2](v12, v14);
  }
}

- (void)_fetchMissingTransactionRecordsWithRecordParser:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(PDCloudStoreContainer *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D2BA4;
  block[3] = &unk_100731F38;
  id v20 = v10;
  id v21 = self;
  id v22 = v12;
  id v23 = v11;
  id v24 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v12;
  id v18 = v10;
  dispatch_async(v14, block);
}

- (id)_transactionSourceIdentifierForTransactionRecordID:(id)a3 recordType:(id)a4 databaseIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(PDApplePayCloudStoreContainer *)self _isTransactionItemFromRecordType:v9])
  {
    id v23 = 0;
    goto LABEL_121;
  }
  id v11 = [v8 zoneID];
  id v12 = [v11 zoneName];
  id v13 = [v8 recordName];
  id v14 = +[PKPaymentTransaction recordNamePrefix];
  if ([v13 hasPrefix:v14])
  {
    uint64_t v15 = objc_msgSend(v13, "substringFromIndex:", objc_msgSend(v14, "length"));

    id v13 = (void *)v15;
  }
  uint64_t v16 = PKApplePayContainerCashZoneNamePrefix;
  long long v149 = v10;
  if ([v12 hasPrefix:PKApplePayContainerCashZoneNamePrefix])
  {
    long long v147 = v11;
    id v17 = [v12 stringByReplacingOccurrencesOfString:v16 withString:&stru_10075AAD8];
    id v18 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount identifier];
    id v19 = v17;
    id v20 = v18;
    if (v19 == v20)
    {
    }
    else
    {
      id v21 = v20;
      if (!v19 || !v20)
      {

        goto LABEL_27;
      }
      unsigned int v22 = [v19 isEqualToString:v20];

      if (!v22)
      {
LABEL_27:
        id v41 = [(PDCloudStoreContainer *)self dataSource];
        id v40 = [v41 transactionSourceIdentifierForPeerPaymentAccountIdentifier:v19];

        if (v40) {
          goto LABEL_92;
        }
        id v144 = v8;
        long long v136 = v12;
        id v42 = [(PDCloudStoreContainer *)self containerManager];
        id v43 = [v42 databaseIdentifierForScope:2];
        id v44 = v149;
        id v45 = v43;
        if (v45 == v44)
        {
        }
        else
        {
          id v46 = v45;
          if (!v44 || !v45)
          {

            goto LABEL_56;
          }
          unsigned __int8 v47 = [v44 isEqualToString:v45];

          if ((v47 & 1) == 0)
          {
LABEL_56:
            uint64_t v152 = self;
            id v71 = [(PDCloudStoreContainer *)self containerManager];
            id v72 = [v71 databaseIdentifierForScope:3];
            id v73 = v44;
            id v74 = v72;
            if (v74 == v73)
            {
            }
            else
            {
              NSErrorUserInfoKey v75 = v74;
              if (!v44 || !v74)
              {

LABEL_88:
                id v40 = 0;
                id v12 = v136;
                id v8 = v144;
                self = v152;
                goto LABEL_92;
              }
              unsigned __int8 v76 = [v73 isEqualToString:v74];

              if ((v76 & 1) == 0) {
                goto LABEL_88;
              }
            }
            self = v152;
            uint64_t v77 = [(PKPeerPaymentAccount *)v152->_peerPaymentAccount associatedAccountInformation];
            id v78 = [v77 associatedAccounts];
            id v79 = [v78 count];

            if (v79 == (id)1)
            {
              uint64_t v80 = [(PKPeerPaymentAccount *)v152->_peerPaymentAccount associatedAccountInformation];
              id v81 = [v80 associatedAccounts];
              uint64_t v82 = [v81 anyObject];
              id v40 = [v82 transactionSourceIdentifier];

              id v12 = v136;
              id v8 = v144;
            }
            else
            {
              id v101 = PKLogFacilityTypeGetObject();
              id v8 = v144;
              if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138412546;
                id v167 = v144;
                __int16 v168 = 2112;
                id v169 = v73;
                _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "Cannot get transaction source identifier for recordID %@ in database %@", buf, 0x16u);
              }

              id v40 = 0;
              id v12 = v136;
              self = v152;
            }
LABEL_92:

            id v11 = v147;
            if (!v40) {
              goto LABEL_109;
            }
            goto LABEL_120;
          }
        }
        CFStringRef v68 = [(PDCloudStoreContainer *)self dataSource];
        CFStringRef v69 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedPassUniqueID];
        id v70 = [v68 transactionSourceIdentifiersForPassUniqueIdentifier:v69];
        id v40 = [v70 anyObject];

        id v12 = v136;
        id v8 = v144;
        goto LABEL_92;
      }
    }
    id v34 = [(PDCloudStoreContainer *)self dataSource];
    [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedPassUniqueID];
    __int16 v151 = self;
    v36 = id v35 = v8;
    [v34 transactionSourceIdentifiersForPassUniqueIdentifier:v36];
    id v37 = v14;
    v39 = id v38 = v12;
    id v40 = [v39 anyObject];

    id v12 = v38;
    id v14 = v37;

    id v8 = v35;
    self = v151;

    if (v40) {
      goto LABEL_92;
    }
    goto LABEL_27;
  }
  long long v145 = v14;
  long long v150 = self;
  if (![v12 hasPrefix:PKApplePayContainerCardZoneNamePrefix])
  {
    id v29 = (void *)PKCloudStoreTransactionsZoneName;
    id v30 = v12;
    id v31 = v29;
    if (v30 == v31)
    {

      id v14 = v145;
    }
    else
    {
      id v32 = v31;
      id v14 = v145;
      if (!v30 || !v31)
      {

LABEL_49:
        uint64_t v62 = PKApplePayContainerSavingsZoneNamePrefix;
        if (![v30 hasPrefix:PKApplePayContainerSavingsZoneNamePrefix]) {
          goto LABEL_109;
        }
        CFStringRef v63 = [v30 stringByReplacingOccurrencesOfString:v62 withString:&stru_10075AAD8];
        if ([v63 length])
        {
          CFStringRef v64 = [(PDCloudStoreContainer *)self dataSource];
          id v40 = [v64 transactionSourceIdentifierForAccountIdentifier:v63];
        }
        else
        {
          id v40 = 0;
        }

        if (!v40) {
          goto LABEL_109;
        }
        goto LABEL_120;
      }
      unsigned int v33 = [v30 isEqualToString:v31];

      if (!v33) {
        goto LABEL_49;
      }
    }
    id v61 = [(PDCloudStoreContainer *)self dataSource];
    id v40 = [v61 broadwayOrSurfTransactionSourceIdentifierForAmbiguousServiceIdentifier:v13 transactionAccountIdentifier:0 transactionAccountType:0 transactionAltDSID:0];

    if (!v40) {
      goto LABEL_109;
    }
    goto LABEL_120;
  }
  id v143 = v8;
  id v24 = [v11 ownerName];
  int v25 = PKEqualObjects();

  id v162 = 0;
  uint64_t v163 = 2;
  id v161 = 0;
  +[PKCloudStoreZone zoneValueForZoneName:v12 outZoneType:&v163 outAccountIdentifier:&v162 altDSID:&v161];
  id v26 = v162;
  id v135 = v161;
  long long v146 = v26;
  if (!v26)
  {
    long long v131 = 0;
    id v8 = v143;
LABEL_34:
    id v28 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v167 = v8;
      __int16 v168 = 2112;
      id v169 = v11;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Cannot find the shared account cloud store zone for record %@ in zone %@", buf, 0x16u);
    }

    long long v134 = 0;
    goto LABEL_37;
  }
  if (v25) {
    uint64_t v27 = 1;
  }
  else {
    uint64_t v27 = 2;
  }
  long long v131 = [(NSDictionary *)self->_sharedAccountCloudStoreByAccountIdentifier objectForKey:v26];
  [v131 sharedAccountZoneWithName:v12 access:v27];
  v134 = id v8 = v143;
  if (!v134) {
    goto LABEL_34;
  }
  id v28 = PKLogFacilityTypeGetObject();
LABEL_37:
  log = v28;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    long long v48 = CKDatabaseScopeString();
    id v49 = PKCloudStoreZoneTypeToString();
    *(_DWORD *)long long buf = 138544386;
    id v167 = v48;
    __int16 v168 = 2112;
    id v169 = v134;
    __int16 v170 = 2112;
    id v171 = v26;
    __int16 v172 = 2112;
    id v173 = v135;
    __int16 v174 = 2114;
    v175 = v49;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "The card record came from the database scope %{public}@ and the users current zone access is %@. The accountIdentifierFromZoneName %@, altDSIDFromZoneName %@, zoneTypeFromZoneName %{public}@", buf, 0x34u);

    id v28 = log;
  }

  if ((unint64_t)(v163 - 5) < 2)
  {
    id v60 = v135;
    goto LABEL_100;
  }
  if (v163 == 2)
  {
    id v126 = v13;
    CFStringRef v65 = [(PDCloudStoreContainer *)self dataSource];
    os_log_t loga = [v65 accountWithIdentifier:v146];

    id v66 = [(PDCloudStoreContainer *)self dataSource];
    id v58 = [loga associatedPassUniqueID];
    uint64_t v125 = v66;
    CFStringRef v67 = [v66 transactionSourceIdentifiersForPassUniqueIdentifier:v58];
    id v40 = [v67 anyObject];

    os_log_t v59 = loga;
    long long v132 = 0;
    goto LABEL_99;
  }
  if (v163 != 4) {
    goto LABEL_103;
  }
  id v50 = [(PDCloudStoreContainer *)self dataSource];
  uint64_t v51 = [v50 accountWithIdentifier:v26];

  id v52 = [(PDCloudStoreContainer *)self dataSource];
  id v53 = v51;
  id v54 = [v51 associatedPassUniqueID];
  unsigned __int8 v55 = [v52 transactionSourceIdentifiersForPassUniqueIdentifier:v54];
  id v56 = [v55 anyObject];

  id v57 = [(PDCloudStoreContainer *)self dataSource];
  id v126 = v13;
  id v58 = [v57 transactionWithServiceIdentifier:v13 transactionSourceIdentifier:v56];

  if (v58)
  {
    id v40 = v56;
    long long v132 = PKCurrentUserAltDSID();
    uint64_t v125 = v40;
    id v28 = log;
    os_log_t v59 = v53;
    id v8 = v143;
    id v14 = v145;
    goto LABEL_99;
  }
  uint64_t v125 = v56;
  unint64_t v83 = [(PDCloudStoreContainer *)self dataSource];
  long long v84 = [v83 accountUsersForAccountWithIdentifier:v146];

  long long v159 = 0u;
  long long v160 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  id obj = v84;
  id v128 = [obj countByEnumeratingWithState:&v157 objects:v165 count:16];
  if (!v128)
  {
    long long v132 = 0;
    id v40 = 0;
    id v8 = v143;
    id v28 = log;
    os_log_t v59 = v53;
    goto LABEL_98;
  }
  long long v132 = 0;
  uint64_t v127 = *(void *)v158;
  id v8 = v143;
  id v142 = v9;
  long long v148 = v11;
  long long v137 = v12;
  while (2)
  {
    uint64_t v85 = 0;
    do
    {
      if (*(void *)v158 != v127) {
        objc_enumerationMutation(obj);
      }
      uint64_t v130 = v85;
      id v86 = *(void **)(*((void *)&v157 + 1) + 8 * v85);
      uint64_t v87 = [(PDCloudStoreContainer *)v150 dataSource];
      id v88 = [v86 altDSID];
      unsigned int v89 = [v87 primaryTransactionSourceIdentifierForAccountUserAltDSID:v88 accountIdentifier:v146];

      id v90 = [(PDCloudStoreContainer *)v150 dataSource];
      id v91 = [v90 transactionWithServiceIdentifier:v126 transactionSourceIdentifier:v89];

      if (v91)
      {
        id v40 = v89;
        uint64_t v100 = [v86 altDSID];

        id v28 = log;
        os_log_t v59 = v53;
LABEL_97:

        long long v132 = (void *)v100;
        id v9 = v142;
        self = v150;
        goto LABEL_98;
      }
      long long v129 = v89;
      long long v155 = 0u;
      long long v156 = 0u;
      long long v153 = 0u;
      long long v154 = 0u;
      uint64_t v92 = [v86 transactionSourceIdentifiers];
      id v93 = [v92 countByEnumeratingWithState:&v153 objects:v164 count:16];
      os_log_t v59 = v53;
      if (v93)
      {
        id v94 = v93;
        uint64_t v95 = *(void *)v154;
LABEL_75:
        uint64_t v96 = 0;
        while (1)
        {
          if (*(void *)v154 != v95) {
            objc_enumerationMutation(v92);
          }
          id v97 = *(void **)(*((void *)&v153 + 1) + 8 * v96);
          id v98 = [(PDCloudStoreContainer *)v150 dataSource];
          uint64_t v99 = [v98 transactionWithServiceIdentifier:v126 transactionSourceIdentifier:v97];

          if (v99) {
            break;
          }
          if (v94 == (id)++v96)
          {
            os_log_t v59 = v53;
            id v94 = [v92 countByEnumeratingWithState:&v153 objects:v164 count:16];
            id v12 = v137;
            if (v94) {
              goto LABEL_75;
            }
            goto LABEL_81;
          }
        }
        id v40 = v97;
        uint64_t v100 = [v86 altDSID];

        os_log_t v59 = v53;
        if (!v40)
        {
          long long v132 = (void *)v100;
          id v8 = v143;
          id v11 = v148;
          id v12 = v137;
          goto LABEL_84;
        }
        id v8 = v143;
        id v11 = v148;
        id v12 = v137;
        id v28 = log;
        unsigned int v89 = v129;
        goto LABEL_97;
      }
LABEL_81:

      id v8 = v143;
      id v11 = v148;
LABEL_84:
      id v28 = log;

      uint64_t v85 = v130 + 1;
      id v9 = v142;
    }
    while ((id)(v130 + 1) != v128);
    id v40 = 0;
    self = v150;
    id v128 = [obj countByEnumeratingWithState:&v157 objects:v165 count:16];
    if (v128) {
      continue;
    }
    break;
  }
LABEL_98:

  id v14 = v145;
  id v58 = 0;
LABEL_99:

  id v13 = v126;
  id v60 = v132;
  if (!v40)
  {
LABEL_100:
    if (v60)
    {
      id v102 = v60;
      int v103 = PKAltDSIDIsCurrentUser();
      id v104 = [(PDCloudStoreContainer *)self dataSource];
      id v105 = v104;
      if (v103)
      {
        os_log_t logb = [v104 accountWithIdentifier:v146];

        unint64_t v106 = [(PDCloudStoreContainer *)self dataSource];
        [logb associatedPassUniqueID];
        uint64_t v107 = v14;
        id v109 = v108 = v8;
        [v106 transactionSourceIdentifiersForPassUniqueIdentifier:v109];
        v111 = long long v110 = v12;
        [v111 anyObject];
        long long v133 = v102;
        id v40 = (id)objc_claimAutoreleasedReturnValue();

        id v12 = v110;
        id v8 = v108;
        id v14 = v107;
        self = v150;

        id v105 = logb;
        id v60 = v133;
      }
      else
      {
        [v104 transactionSourceIdentifierForAccountUserAltDSID:v102 accountIdentifier:v146];
        id v60 = v102;
        id v40 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_107;
    }
LABEL_103:
    long long v138 = v12;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v167 = v8;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "There is no altDSID defined for record %@", buf, 0xCu);
    }

    long long v112 = [(PDCloudStoreContainer *)self dataSource];
    id v105 = [v112 accountWithIdentifier:v146];

    long long v113 = [(PDCloudStoreContainer *)self dataSource];
    [v105 associatedPassUniqueID];
    v115 = id v114 = v8;
    long long v116 = [v113 transactionSourceIdentifiersForPassUniqueIdentifier:v115];
    id v40 = [v116 anyObject];

    id v8 = v114;
    self = v150;

    id v60 = 0;
    id v12 = v138;
    id v14 = v145;
LABEL_107:
  }
  if (!v40)
  {
LABEL_109:
    long long v117 = [(PDCloudStoreContainer *)self dataSource];
    long long v118 = [v117 transactionsWithServiceIdentifier:v13];

    if ([v118 count] == (id)1)
    {
      long long v119 = [v118 anyObject];
      id v40 = [v119 transactionSourceIdentifier];

      if (!v40) {
        goto LABEL_117;
      }
    }
    else
    {
      if ((unint64_t)[v118 count] >= 2)
      {
        long long v120 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
        {
          id v121 = [v118 count];
          *(_DWORD *)long long buf = 138543874;
          id v167 = v13;
          __int16 v168 = 2048;
          id v169 = v121;
          __int16 v170 = 2112;
          id v171 = v118;
          _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEFAULT, "There is more than one transaction with the service identifier %{public}@. We have enough information to determine which one out of %lu %@", buf, 0x20u);
        }
      }
LABEL_117:
      long long v122 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        id v167 = v8;
        __int16 v168 = 2114;
        id v169 = v9;
        _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_DEFAULT, "Could not find a transactionSourceIdentifier for record %@ and recordType %{public}@", buf, 0x16u);
      }

      id v40 = 0;
    }
  }
LABEL_120:
  id v23 = v40;

  id v10 = v149;
LABEL_121:

  return v23;
}

- (id)_transactionSourceIdentifierForTransactionCloudStoreRecord:(id)a3 databaseIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 recordsWithRecordType:PKCloudTransactionRecordType];
  id v9 = [v8 firstObject];

  id v10 = objc_msgSend(v9, "pk_encryptedStringForKey:", PKCloudTransactionFPANIdentifierKey);
  uint64_t v11 = objc_msgSend(v9, "pk_encryptedStringForKey:", PKCloudTransactionPassSerialNumberKey);
  uint64_t v12 = objc_msgSend(v9, "pk_encryptedStringForKey:", PKCloudTransactionPassTypeIdentifierKey);
  id v13 = objc_msgSend(v9, "pk_encryptedStringForKey:", PKCloudTransactionAccountIdentifierKey);
  os_log_t v59 = objc_msgSend(v9, "pk_encryptedStringForKey:", PKCloudTransactionAltDSIDKey);
  if (!v13)
  {
    id v13 = objc_msgSend(v9, "pk_encryptedStringForKey:", PKCloudTransactionPeerPaymentAccountIdentifierKey);
  }
  id v14 = objc_msgSend(v9, "pk_stringForKey:", PKCloudTransactionAccountTypeKey);
  uint64_t v56 = PKPaymentTransactionAccountTypeFromString();

  if (v11) {
    BOOL v15 = v12 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  id v57 = (void *)v12;
  id v58 = (void *)v11;
  if (v15)
  {
    if (!v10)
    {
      id v21 = 0;
      goto LABEL_11;
    }
    uint64_t v16 = [(PDCloudStoreContainer *)self dataSource];
    id v17 = [v16 passUniqueIdentifierWithPrimaryAccountIdentifier:v10];
  }
  else
  {
    id v17 = PKGeneratePassUniqueID();
  }
  id v18 = self;
  id v19 = [(PDCloudStoreContainer *)self dataSource];
  id v20 = [v19 transactionSourceIdentifiersForPassUniqueIdentifier:v17];
  id v21 = [v20 anyObject];

  self = v18;
  if (v21) {
    goto LABEL_51;
  }
LABEL_11:
  if (!v13) {
    goto LABEL_51;
  }
  if ((unint64_t)(v56 - 2) >= 3)
  {
    if (v56 == 1)
    {
      id v54 = v7;
      id v32 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount peerPaymentAccountWithIdentifier:v13];
      [v32 associatedPassUniqueID];
      id v34 = v38 = self;
      unint64_t v39 = [(PDCloudStoreContainer *)v38 dataSource];
      id v40 = [v39 transactionSourceIdentifiersForPassUniqueIdentifier:v34];
      id v21 = [v40 anyObject];

      unsigned __int8 v55 = v38;
      if (v21
        || ([(PDCloudStoreContainer *)v38 dataSource],
            id v41 = objc_claimAutoreleasedReturnValue(),
            [v41 transactionSourceIdentifierForPeerPaymentAccountIdentifier:v13],
            id v21 = objc_claimAutoreleasedReturnValue(),
            v41,
            v21))
      {
        id v7 = v54;
      }
      else
      {
        id v42 = PKLogFacilityTypeGetObject();
        id v7 = v54;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          CFStringRef v65 = v13;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "No transaction source identifiers peer payment account id %@", buf, 0xCu);
        }

        id v21 = 0;
      }
      goto LABEL_49;
    }
    if (v56) {
      goto LABEL_53;
    }
  }
  id v52 = v10;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  unsigned __int8 v55 = self;
  unsigned int v22 = self->_accounts;
  id v23 = [(NSSet *)v22 countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v61;
    id v51 = v6;
    id v53 = v7;
    while (2)
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v61 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        objc_msgSend(v27, "accountIdentifier", v51);
        id v28 = (id)objc_claimAutoreleasedReturnValue();
        id v29 = v13;
        id v30 = v29;
        if (v28 == v29)
        {

LABEL_30:
          id v32 = v27;
          id v6 = v51;
          id v7 = v53;
          goto LABEL_32;
        }
        if (v28)
        {
          unsigned int v31 = [v28 isEqualToString:v29];

          if (v31) {
            goto LABEL_30;
          }
        }
        else
        {
        }
      }
      id v24 = [(NSSet *)v22 countByEnumeratingWithState:&v60 objects:v68 count:16];
      id v32 = 0;
      id v6 = v51;
      id v7 = v53;
      if (v24) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v32 = 0;
  }
LABEL_32:

  if (!v59 || PKAltDSIDIsCurrentUser())
  {
    unsigned int v33 = [(PDCloudStoreContainer *)v55 dataSource];
    id v34 = [v33 passUniqueIdentifierWithAssociatedAccountIdentifier:v13];

    id v35 = [(PDCloudStoreContainer *)v55 dataSource];
    id v36 = v35;
    id v10 = v52;
    if (v34 || v56 != 3)
    {
      id v37 = [v35 transactionSourceIdentifiersForPassUniqueIdentifier:v34];
      id v21 = [v37 anyObject];
    }
    else
    {
      id v21 = [v35 transactionSourceIdentifierForAccountIdentifier:v13];
    }

    goto LABEL_49;
  }
  id v10 = v52;
  self = v55;
  if ([v32 isSharedAccount] && (PKAltDSIDIsCurrentUser() & 1) == 0)
  {
    id v34 = [(PDCloudStoreContainer *)v55 dataSource];
    id v21 = [v34 transactionSourceIdentifierForAccountUserAltDSID:v59 accountIdentifier:v13];
LABEL_49:

    self = v55;
    goto LABEL_50;
  }
  id v21 = 0;
LABEL_50:

LABEL_51:
  if (v21)
  {
    id v43 = v9;
    goto LABEL_58;
  }
LABEL_53:
  id v44 = [v6 records];
  id v43 = [v44 firstObject];

  id v45 = [v43 recordID];
  id v46 = [v43 recordType];
  id v21 = [(PDApplePayCloudStoreContainer *)self _transactionSourceIdentifierForTransactionRecordID:v45 recordType:v46 databaseIdentifier:v7];

  if (!v21 && v43)
  {
    unsigned __int8 v47 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      long long v48 = [v43 recordID];
      id v49 = [v48 recordName];
      *(_DWORD *)long long buf = 138412546;
      CFStringRef v65 = v49;
      __int16 v66 = 2112;
      CFStringRef v67 = v13;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Transaction source identifiers not found on device for record %@, accountIdentifier %@", buf, 0x16u);
    }
    id v21 = 0;
  }
LABEL_58:

  return v21;
}

- (id)_originDeviceIDForCloudStoreRecord:(id)a3
{
  id v3 = [a3 recordsWithRecordType:PKCloudTransactionDeviceDataRecordType];
  unsigned __int8 v4 = [v3 firstObject];

  id v5 = objc_msgSend(v4, "pk_encryptedStringForKey:", PKCloudTransactionOriginDeviceIDKey);

  return v5;
}

- (BOOL)_isAccountEventFromRecordType:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)PKCloudAccountEventRecordType;
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v6 == v5)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    unsigned __int8 v8 = 0;
    if (v5 && v6) {
      unsigned __int8 v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (BOOL)_isAccountEventAssociatedObjectFromRecordType:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)PKCloudAccountRewardsRecordType;
  id v5 = v3;
  id v6 = v4;
  if (v6 == v5)
  {
    unsigned __int8 v9 = 1;
    id v10 = v5;
LABEL_85:

    goto LABEL_86;
  }
  id v7 = v6;
  if (v5 && v6)
  {
    unsigned __int8 v8 = [v5 isEqualToString:v6];

    if (v8) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  uint64_t v11 = (void *)PKCloudCreditAccountStatementRecordType;
  id v10 = v5;
  id v12 = v11;
  if (v12 == v10) {
    goto LABEL_84;
  }
  id v13 = v12;
  if (v5 && v12)
  {
    unsigned __int8 v14 = [v10 isEqualToString:v12];

    if (v14) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  BOOL v15 = (void *)PKCloudAccountServicingRecordType;
  id v10 = v10;
  id v16 = v15;
  if (v16 == v10) {
    goto LABEL_84;
  }
  id v17 = v16;
  if (v5 && v16)
  {
    unsigned __int8 v18 = [v10 isEqualToString:v16];

    if (v18) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  id v19 = (void *)PKCloudAccountPaymentRecordType;
  id v10 = v10;
  id v20 = v19;
  if (v20 == v10) {
    goto LABEL_84;
  }
  id v21 = v20;
  if (v5 && v20)
  {
    unsigned __int8 v22 = [v10 isEqualToString:v20];

    if (v22) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  id v23 = (void *)PKCloudAccountTransferRecordType;
  id v10 = v10;
  id v24 = v23;
  if (v24 == v10) {
    goto LABEL_84;
  }
  uint64_t v25 = v24;
  if (v5 && v24)
  {
    unsigned __int8 v26 = [v10 isEqualToString:v24];

    if (v26) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  uint64_t v27 = (void *)PKCloudAccountHoldRecordType;
  id v10 = v10;
  id v28 = v27;
  if (v28 == v10) {
    goto LABEL_84;
  }
  id v29 = v28;
  if (v5 && v28)
  {
    unsigned __int8 v30 = [v10 isEqualToString:v28];

    if (v30) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  unsigned int v31 = (void *)PKCloudAccountCreditTermsUpdateRecordType;
  id v10 = v10;
  id v32 = v31;
  if (v32 == v10) {
    goto LABEL_84;
  }
  unsigned int v33 = v32;
  if (v5 && v32)
  {
    unsigned __int8 v34 = [v10 isEqualToString:v32];

    if (v34) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  id v35 = (void *)PKCloudAccountPaymentReminderRecordType;
  id v10 = v10;
  id v36 = v35;
  if (v36 == v10) {
    goto LABEL_84;
  }
  id v37 = v36;
  if (v5 && v36)
  {
    unsigned __int8 v38 = [v10 isEqualToString:v36];

    if (v38) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  unint64_t v39 = (void *)PKCloudAccountPhysicalCardStatusUpdateRecordType;
  id v10 = v10;
  id v40 = v39;
  if (v40 == v10) {
    goto LABEL_84;
  }
  id v41 = v40;
  if (v5 && v40)
  {
    unsigned __int8 v42 = [v10 isEqualToString:v40];

    if (v42) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  id v43 = (void *)PKCloudAccountPhysicalCardShippingUpdateRecordType;
  id v10 = v10;
  id v44 = v43;
  if (v44 == v10) {
    goto LABEL_84;
  }
  id v45 = v44;
  if (v5 && v44)
  {
    unsigned __int8 v46 = [v10 isEqualToString:v44];

    if (v46) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  unsigned __int8 v47 = (void *)PKCloudAccountVirtualCardStatusUpdateRecordType;
  id v10 = v10;
  id v48 = v47;
  if (v48 == v10) {
    goto LABEL_84;
  }
  id v49 = v48;
  if (v5 && v48)
  {
    unsigned __int8 v50 = [v10 isEqualToString:v48];

    if (v50) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  id v51 = (void *)PKCloudAccountBillPaymentSelectedSuggestedAmountRecordType;
  id v10 = v10;
  id v52 = v51;
  if (v52 == v10) {
    goto LABEL_84;
  }
  id v53 = v52;
  if (v5 && v52)
  {
    unsigned __int8 v54 = [v10 isEqualToString:v52];

    if (v54) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  unsigned __int8 v55 = (void *)PKCloudAccountUserInfoRecordType;
  id v10 = v10;
  id v56 = v55;
  if (v56 == v10)
  {
LABEL_84:
    unsigned __int8 v9 = 1;
    goto LABEL_85;
  }
  id v57 = v56;
  if (!v5 || !v56)
  {

LABEL_80:
    os_log_t v59 = (void *)PKCloudAccountAssistanceProgramRecordType;
    id v60 = v10;
    id v61 = v59;
    id v10 = v61;
    if (v61 != v60)
    {
      unsigned __int8 v9 = 0;
      if (v5 && v61) {
        unsigned __int8 v9 = [v60 isEqualToString:v61];
      }
      goto LABEL_85;
    }
    goto LABEL_84;
  }
  unsigned __int8 v58 = [v10 isEqualToString:v56];

  if ((v58 & 1) == 0) {
    goto LABEL_80;
  }
LABEL_78:
  unsigned __int8 v9 = 1;
LABEL_86:

  return v9;
}

- (id)_recordTypeForAccountEventRecord:(id)a3
{
  id v3 = (char *)+[PKAccountEvent accountEventTypeFromRecord:a3];
  if ((unint64_t)(v3 - 1) > 0x19) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)*(&off_100734BE0 + (void)(v3 - 1));
  }
  return v4;
}

- (void)fetchAndStoreAccountEventsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(PDCloudStoreContainer *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D5754;
  block[3] = &unk_10072E9D8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_fetchMissingAccountEventsWithRecordParser:(id)a3 request:(id)a4 databaseIdentifier:(id)a5 carriedOverRecordsByDatabaseIdentifier:(id)a6 updateReasons:(unint64_t)a7 completion:(id)a8
{
  id v94 = a3;
  id v12 = a4;
  id v102 = a5;
  id v97 = a6;
  id v84 = a8;
  id v93 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  id v100 = objc_alloc_init((Class)NSMutableSet);
  id v13 = objc_alloc_init((Class)NSMutableArray);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = [v12 transactionSourceIdentifiers];
  }
  else
  {
    id v14 = 0;
  }
  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  id v15 = v14;
  id v16 = [v15 countByEnumeratingWithState:&v137 objects:v143 count:16];
  id v87 = v15;
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v138;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v138 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v137 + 1) + 8 * i);
        id v21 = [(PDCloudStoreContainer *)self dataSource];
        id v22 = [v21 transactionSourceTypeForTransactionSourceIdentifier:v20];

        if (v22 == (id)3)
        {
          id v24 = [(PDCloudStoreContainer *)self dataSource];
          uint64_t v27 = [v24 accountWithTransactionSourceIdentifier:v20];
LABEL_15:
          uint64_t v25 = v27;
          uint64_t v26 = [v27 accountIdentifier];
LABEL_16:
          id v28 = (void *)v26;

          goto LABEL_18;
        }
        if (v22 == (id)2)
        {
          id v24 = [(PDCloudStoreContainer *)self dataSource];
          uint64_t v27 = [v24 accountUserWithTransactionSourceIdentifier:v20];
          goto LABEL_15;
        }
        if (!v22)
        {
          id v23 = [(PDCloudStoreContainer *)self dataSource];
          id v24 = [v23 passUniqueIdentifierForTransactionSourceIdentifier:v20];

          id v15 = v87;
          uint64_t v25 = [(PDCloudStoreContainer *)self dataSource];
          uint64_t v26 = [v25 associatedAccountIdentifierForPassWithUniqueIdentifier:v24];
          goto LABEL_16;
        }
        id v28 = 0;
LABEL_18:
        [v13 safelyAddObject:v28];
      }
      id v17 = [v15 countByEnumeratingWithState:&v137 objects:v143 count:16];
    }
    while (v17);
  }

  id v29 = objc_alloc_init((Class)NSMutableSet);
  id v30 = objc_alloc_init((Class)NSMutableDictionary);
  id v31 = objc_alloc_init((Class)NSMutableSet);
  v128[0] = _NSConcreteStackBlock;
  v128[1] = 3221225472;
  v128[2] = sub_1000D67CC;
  v128[3] = &unk_100734A68;
  id v32 = self;
  v128[4] = self;
  id v82 = v13;
  id v129 = v82;
  id v33 = v97;
  id v130 = v33;
  id v95 = v102;
  id v131 = v95;
  id v34 = v31;
  id v132 = v34;
  id v96 = v12;
  id v133 = v96;
  id v86 = v30;
  id v134 = v86;
  id v35 = v100;
  id v135 = v35;
  id v85 = v29;
  id v136 = v85;
  id v36 = v94;
  [v94 enumerateKeysAndObjectsForItemType:5 usingBlock:v128];
  id v81 = v34;
  [v94 addRecords:v34];
  id v91 = objc_alloc_init((Class)NSMutableSet);
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  id v37 = v35;
  id v38 = [v37 countByEnumeratingWithState:&v124 objects:v142 count:16];
  unint64_t v39 = v93;
  if (v38)
  {
    id v40 = v38;
    uint64_t v41 = *(void *)v125;
    do
    {
      for (j = 0; j != v40; j = (char *)j + 1)
      {
        if (*(void *)v125 != v41) {
          objc_enumerationMutation(v37);
        }
        id v43 = [(PDApplePayCloudStoreContainer *)self identifierFromRecord:*(void *)(*((void *)&v124 + 1) + 8 * (void)j)];
        [v91 addObject:v43];
      }
      id v40 = [v37 countByEnumeratingWithState:&v124 objects:v142 count:16];
    }
    while (v40);
  }
  uint64_t v80 = v37;

  [v94 removeIdentifiers:v91 itemType:5];
  PKLogFacilityTypeGetObject();
  id v44 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v45 = os_signpost_id_make_with_pointer(v44, self);
  if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v46 = v45;
    if (os_signpost_enabled(v44))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_INTERVAL_BEGIN, v46, "cloudstore:fetchMissingAccountEventRecords", "", buf, 2u);
    }
  }

  unsigned __int8 v47 = v85;
  id v48 = v95;
  id v49 = v96;
  if ([v85 count])
  {
    v118[0] = _NSConcreteStackBlock;
    v118[1] = 3221225472;
    v118[2] = sub_1000D7260;
    v118[3] = &unk_100733B00;
    v118[4] = self;
    id v119 = v95;
    id v120 = v85;
    id v121 = v96;
    id v122 = v94;
    [v93 addOperation:v118];
  }
  unsigned __int8 v50 = v86;
  if ([v86 count])
  {
    id v79 = v33;
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    id obj = v86;
    id v89 = [obj countByEnumeratingWithState:&v114 objects:v141 count:16];
    if (v89)
    {
      uint64_t v88 = *(void *)v115;
      id v51 = NSNumber_ptr;
      id v52 = &dispatch_get_global_queue_ptr;
      id v53 = &dispatch_get_global_queue_ptr;
      do
      {
        uint64_t v54 = 0;
        do
        {
          if (*(void *)v115 != v88) {
            objc_enumerationMutation(obj);
          }
          uint64_t v92 = v54;
          uint64_t v55 = *(void *)(*((void *)&v114 + 1) + 8 * v54);
          id v56 = [obj objectForKey:v55];
          id v57 = (char *)[v56 count];
          if (v57)
          {
            unint64_t v58 = 0;
            id v98 = v57;
            do
            {
              if ((unint64_t)&v57[-v58] >= 5) {
                uint64_t v59 = 5;
              }
              else {
                uint64_t v59 = (uint64_t)&v57[-v58];
              }
              uint64_t v103 = v59;
              id v60 = [v56 subarrayWithRange:v58];
              id v101 = [v51[4] predicateWithFormat:@"accountEventReference IN %@", v60];
              id v61 = [objc_alloc((Class)v52[424]) initWithRecordType:v55 predicate:v101];
              long long v62 = v56;
              uint64_t v63 = v55;
              CFStringRef v64 = v53;
              id v65 = objc_alloc((Class)v53[428]);
              __int16 v66 = [v60 firstObject];
              CFStringRef v67 = [v66 recordID];
              CFStringRef v68 = [v67 zoneID];
              id v69 = [v65 initWithZoneID:v68];

              id v36 = v94;
              v108[0] = _NSConcreteStackBlock;
              v108[1] = 3221225472;
              v108[2] = sub_1000D74A8;
              v108[3] = &unk_1007348D8;
              v108[4] = self;
              id v109 = v61;
              id v110 = v96;
              id v111 = v69;
              id v112 = v95;
              id v113 = v94;
              id v70 = v69;
              id v53 = v64;
              uint64_t v55 = v63;
              id v56 = v62;
              id v71 = v70;
              id v72 = v61;
              unint64_t v39 = v93;
              id v73 = v72;
              [v93 addOperation:v108];

              id v52 = &dispatch_get_global_queue_ptr;
              id v51 = NSNumber_ptr;

              id v57 = v98;
              v58 += v103;
            }
            while (v58 < (unint64_t)v98);
          }

          uint64_t v54 = v92 + 1;
        }
        while ((id)(v92 + 1) != v89);
        id v89 = [obj countByEnumeratingWithState:&v114 objects:v141 count:16];
      }
      while (v89);
    }

    id v32 = self;
    unsigned __int8 v50 = v86;
    id v15 = v87;
    id v33 = v79;
    id v48 = v95;
    id v49 = v96;
    unsigned __int8 v47 = v85;
  }

  id v74 = +[NSNull null];
  v104[0] = _NSConcreteStackBlock;
  v104[1] = 3221225472;
  v104[2] = sub_1000D7734;
  v104[3] = &unk_100731E20;
  v104[4] = v32;
  id v105 = v80;
  id v106 = v48;
  id v107 = v84;
  id v75 = v48;
  id v76 = v80;
  id v77 = v84;
  id v78 = [v39 evaluateWithInput:v74 completion:v104];
}

- (id)_recordsByFromAccountEvent:(id)a3 zone:(id)a4
{
  id v5 = a3;
  id v6 = [a4 zoneID];
  id v7 = objc_alloc((Class)CKRecordID);
  unsigned __int8 v8 = [v5 recordName];
  id v9 = [v7 initWithRecordName:v8 zoneID:v6];

  id v10 = objc_alloc((Class)CKRecord);
  id v11 = [v10 initWithRecordType:PKCloudAccountEventRecordType recordID:v9];
  id v12 = objc_alloc((Class)PKCloudStoreRecord);
  id v18 = v11;
  id v13 = +[NSArray arrayWithObjects:&v18 count:1];
  id v14 = [v12 initWithRecords:v13];

  [v5 encodeWithCloudStoreCoder:v14 codingType:2];
  id v15 = [v14 records];
  id v16 = +[NSSet setWithArray:v15];

  return v16;
}

- (void)_parseAccountEventsFromRecordParser:(id)a3 databaseIdentifier:(id)a4 shouldUpdateLocalDatabase:(BOOL)a5 shouldReturn:(BOOL)a6 updateReasons:(unint64_t)a7 completion:(id)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v33 = a3;
  id v14 = a4;
  id v15 = a8;
  if (!v11)
  {
    id v16 = 0;
    if (!v10) {
      goto LABEL_3;
    }
LABEL_5:
    id v17 = objc_alloc_init((Class)PKCloudRecordArray);
    goto LABEL_6;
  }
  id v16 = objc_alloc_init((Class)NSMutableSet);
  if (v10) {
    goto LABEL_5;
  }
LABEL_3:
  id v17 = 0;
LABEL_6:
  id v18 = PKCurrentUserAltDSID();
  PKLogFacilityTypeGetObject();
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v20 = os_signpost_id_make_with_pointer(v19, self);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v21 = v20;
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, v21, "cloudstore:processAccountEvents", "", buf, 2u);
    }
  }

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000D7D5C;
  v37[3] = &unk_100734AE0;
  id v22 = v18;
  id v38 = v22;
  id v23 = v16;
  id v39 = v23;
  unint64_t v42 = a7;
  id v24 = v17;
  id v40 = v24;
  id v25 = v14;
  id v41 = v25;
  [v33 enumerateKeysAndObjectsForItemType:5 usingBlock:v37];
  uint64_t v26 = v19;
  os_signpost_id_t v27 = os_signpost_id_make_with_pointer(v26, self);
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v28 = v27;
    if (os_signpost_enabled(v26))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, v28, "cloudstore:processAccountEvents", "", buf, 2u);
    }
  }

  if (v11)
  {
    if ([v23 count])
    {
      id v30 = [v23 allObjects];
      id v31 = objc_msgSend(v30, "pk_createArrayBySafelyApplyingBlock:", &stru_100734B20);

      [(PDCloudStoreContainer *)self reportContainerChangeSignpostEventType:36 stateName:0 objectNames:v31 changeToken:0 error:0 operationGroupName:0 operationGroupNameSuffix:0];
    }
    accountManager = self->_accountManager;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000D802C;
    v34[3] = &unk_10072E598;
    id v36 = v15;
    id v35 = v24;
    [(PDAccountManager *)accountManager insertEvents:v23 completion:v34];
  }
  else if (v15)
  {
    (*((void (**)(id, id))v15 + 2))(v15, v24);
  }
}

- (BOOL)_isAccountFromRecordType:(id)a3
{
  id v3 = a3;
  id v4 = (void *)PKCloudAccountRecordType;
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v6 == v5)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    unsigned __int8 v8 = 0;
    if (v5 && v6) {
      unsigned __int8 v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (void)_parseAccountsFromRecordParser:(id)a3 databaseIdentifier:(id)a4 shouldUpdateLocalDatabase:(BOOL)a5 shouldReturn:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (!v9)
  {
    id v15 = 0;
    if (!v8) {
      goto LABEL_3;
    }
LABEL_5:
    id v16 = objc_alloc_init((Class)PKCloudRecordArray);
    goto LABEL_6;
  }
  id v15 = objc_alloc_init((Class)NSMutableSet);
  if (v8) {
    goto LABEL_5;
  }
LABEL_3:
  id v16 = 0;
LABEL_6:
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000D8308;
  v32[3] = &unk_100734B98;
  dispatch_group_t v33 = dispatch_group_create();
  id v34 = self;
  id v17 = v15;
  id v35 = v17;
  id v18 = v16;
  id v36 = v18;
  id v37 = v13;
  id v19 = v13;
  os_signpost_id_t v20 = v33;
  [v12 enumerateKeysAndObjectsForItemType:7 usingBlock:v32];
  objc_initWeak(&location, self);
  os_signpost_id_t v21 = dispatch_get_global_queue(2, 0);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000D86DC;
  v25[3] = &unk_100734BC0;
  BOOL v30 = v9;
  objc_copyWeak(&v29, &location);
  id v27 = v18;
  id v28 = v14;
  id v26 = v17;
  id v22 = v18;
  id v23 = v14;
  id v24 = v17;
  dispatch_group_notify(v20, v21, v25);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (void)_insertAccountBalanceUpdateNotificationIfNecessaryForAccount:(id)a3 record:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(PDCloudStoreContainer *)self dataSource];
  uint64_t v9 = [v6 associatedPassUniqueID];
  BOOL v10 = [v8 passWithUniqueIdentifier:v9];
  BOOL v11 = [v10 paymentPass];

  LOBYTE(v9) = [v11 settings];
  id v12 = [v6 cloudStoreZoneNames];
  unsigned __int8 v13 = [v12 containsObject:PKCloudStoreAppleBalanceTransactionsZoneName];

  if ((v9 & 8) != 0 && (v13 & 1) == 0)
  {
    id v14 = [v7 recordsWithRecordType:PKCloudAccountRecordType];
    id v15 = [v14 firstObject];

    id v16 = [v15 pk_encryptedStringForKey:PKCloudAccountBalanceUpdateReasonKey];
    id v17 = (void *)PKCloudAccountBalanceUpdateInStoreTopUpReason;
    id v18 = v16;
    id v19 = v17;
    if (v18 == v19) {
      goto LABEL_16;
    }
    os_signpost_id_t v20 = v19;
    if (v18 && v19)
    {
      unsigned __int8 v21 = [v18 isEqualToString:v19];

      if (v21) {
        goto LABEL_17;
      }
    }
    else
    {
    }
    id v22 = (void *)PKCloudAccountBalanceUpdateInWalletTopUpReason;
    id v23 = v18;
    id v24 = v22;
    if (v23 == v24)
    {
LABEL_16:
    }
    else
    {
      id v25 = v24;
      if (!v18 || !v24)
      {

        goto LABEL_25;
      }
      unsigned __int8 v26 = [v23 isEqualToString:v24];

      if ((v26 & 1) == 0)
      {
LABEL_25:
        id v27 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v35 = v23;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Error: attempted to insert balance update notification for unsupported update reason %@", buf, 0xCu);
        }
        goto LABEL_22;
      }
    }
LABEL_17:
    id v27 = [v15 pk_encryptedObjectForKey:PKCloudAccountBalanceUpdateAmountKey ofClass:objc_opt_class()];
    if (v27)
    {
      id v28 = [v6 appleBalanceDetails];
      id v29 = [v28 currencyCode];

      [v27 decimalValue];
      BOOL v30 = +[NSDecimalNumber decimalNumberWithDecimal:v33];
      id v31 = PKCurrencyAmountMake();

      [(PDAccountManager *)self->_accountManager insertAccountBalanceUpdateNotificationForAccount:v6 updateAmount:v31];
    }
    else
    {
      id v29 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        id v32 = [v7 description];
        *(_DWORD *)long long buf = 138412290;
        id v35 = v32;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Error: missing balance update amount for balance update notification for account record %@", buf, 0xCu);
      }
    }

LABEL_22:
    goto LABEL_23;
  }
  id v15 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Not inserting account balance update notification: balance update notifications disabled", buf, 2u);
  }
LABEL_23:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountUsersByAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedAccountCloudStoreByAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_spotlightIndexer, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_familyCircleManager, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_paymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_transactionProcessor, 0);
  objc_storeStrong((id *)&self->_fetchTasks, 0);
  objc_destroyWeak((id *)&self->_applePayContainerDelegate);
  objc_storeStrong((id *)&self->_backgroundTasksBeingRun, 0);
}

@end