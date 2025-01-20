@interface PDServer
- (BOOL)continuityDisabledByUser:(id)a3;
- (BOOL)defaultPassManagerCanUpdateDefaultPass:(id)a3;
- (BOOL)deviceAvailableForContinuityPayments:(id)a3;
- (BOOL)fieldDetectorManagerShouldSuppressFieldEvents:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)resetApplePayWithType:(int64_t)a3 diagnosticReason:(id)a4;
- (BOOL)shouldRecomputeRelevantPassesWithSearchMode:(int64_t)a3;
- (BOOL)shouldWritePass:(id)a3 source:(int64_t)a4 error:(id *)a5;
- (CGImage)thumbnailImageForPassIdentifier:(id)a3 size:(CGSize)a4 manager:(id)a5;
- (PDServer)init;
- (id)createCurrentNotificationRegistrationState;
- (id)defaultPaymentPassForContinuityDiscovery:(id)a3;
- (id)missingRemoteAssetsPersistentStoreItemsWithMaximumDownloadRetriesCount:(unint64_t)a3;
- (id)passUniqueIdentifierforTransactionSourceIdentifier:(id)a3;
- (id)paymentApplicationForDPANIdentifier:(id)a3;
- (id)paymentApplicationForTransactionSource:(id)a3;
- (id)paymentPassesForContinuityDiscovery:(id)a3;
- (id)paymentTransactionForIdentifier:(id)a3;
- (id)storedPasses;
- (id)trueUniqueIDs;
- (id)webServiceConfigurationForContinuityPayments:(id)a3;
- (unint64_t)missingRemoteAssetsPersistentStoreItemsCountWithMaximumDownloadRetriesCount:(unint64_t)a3;
- (void)_updateQuickActions;
- (void)accountForPaymentPass:(id)a3 manager:(id)a4 completion:(id)a5;
- (void)accountManager:(id)a3 didAddAccount:(id)a4;
- (void)accountManager:(id)a3 didAddAccountEvent:(id)a4;
- (void)accountManager:(id)a3 didRemoveAccount:(id)a4;
- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5;
- (void)accountManager:(id)a3 didUpdateAccountEvent:(id)a4;
- (void)applePayCloudStoreContainer:(id)a3 didFinishTransactionFetchForPassUniqueID:(id)a4;
- (void)appletSubcredentialManager:(id)a3 didTerminateProvisioningForCredential:(id)a4;
- (void)appletSubcredentialManager:(id)a3 didUpdateCredential:(id)a4 onPassWithIdentifier:(id)a5 oldShares:(id)a6;
- (void)appletSubcredentialManager:(id)a3 didUpdateRangingSuspensionReasons:(unint64_t)a4 forCredential:(id)a5 forPaymentApplication:(id)a6;
- (void)applicationMessageManager:(id)a3 didUpdateMessages:(id)a4;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)bindingStateChangedForPass:(id)a3;
- (void)cardFileManager:(id)a3 didFailToDecryptRemoteAssets:(id)a4 forPass:(id)a5;
- (void)cardFileManager:(id)a3 didUpdateRemoteAssetsForPassWithUniqueID:(id)a4;
- (void)catalogOfRecordWritten:(id)a3 source:(int64_t)a4;
- (void)checkForTransitNotification;
- (void)dataMigrationRequestedWithPassLibrary:(id)a3 didRestoreFromBackup:(BOOL)a4;
- (void)dealloc;
- (void)defaultDiscoveryManager:(id)a3 completedCTAForItem:(id)a4;
- (void)defaultDiscoveryManager:(id)a3 dialogRequestsChangedForPlacement:(id)a4;
- (void)defaultDiscoveryManager:(id)a3 sendDiscoveryArticleLayoutsUpdated:(id)a4;
- (void)defaultPassManager:(id)a3 didUpdateDefaultPaymentPassWithUniqueIdentifier:(id)a4;
- (void)didAddCredentialInvitation:(id)a3;
- (void)didReceivePromptForVirtualCard:(id)a3 showNotification:(BOOL)a4;
- (void)didReceiveRemotePaymentRequest:(id)a3;
- (void)didReceiveSetupRequest:(id)a3;
- (void)didRemoveTransactionsWithSourceIdentifierMapping:(id)a3;
- (void)didRequestToRegister:(id)a3 fromDestination:(id)a4;
- (void)displayTapToRadarAlertForRequest:(id)a3 completion:(id)a4;
- (void)dynamicStateManager:(id)a3 dynamicStatesDidUpdate:(id)a4;
- (void)expressPassManager:(id)a3 didFinishExpressTransactionWithState:(id)a4;
- (void)expressPassManager:(id)a3 didUpdateExpressPassConfigurations:(id)a4;
- (void)handleContinuityPaymentBulletinActionWithIdentifier:(id)a3 manager:(id)a4;
- (void)handleDatabaseIntegrityProblem;
- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5;
- (void)handlerDetailsForConfiguration:(id)a3 completion:(id)a4;
- (void)inAppPaymentService:(id)a3 registerPaymentListenerEndpoint:(id)a4 forHostIdentifier:(id)a5 processIdentifier:(int)a6 completion:(id)a7;
- (void)inAppPaymentService:(id)a3 retrievePaymentListenerEndpointForHostIdentifier:(id)a4 completion:(id)a5;
- (void)incrementMissingRemoteAssetsPersistentStoreItemDownloadRetriesCountWithUniqueID:(id)a3;
- (void)insertOrReplaceMissingRemoteAssetsPersistentStoreItemWithUniqueID:(id)a3;
- (void)introduceDatabaseIntegrityProblem;
- (void)issueSecureElementPassStateChangeNotificationForNewPasses:(id)a3;
- (void)markPassWithUniqueIdentifiersForDeletion:(id)a3;
- (void)mutateTrueUniqueIDs:(id)a3;
- (void)noteACAccountChanged:(id)a3 handler:(id)a4;
- (void)noteAutomaticallyPresentSettingsChangedForPassWithUniqueIdentifier:(id)a3;
- (void)noteLockScreenSettingsChangedForPassWithUniqueIdentifier:(id)a3;
- (void)notePassWithUniqueID:(id)a3 isRevoked:(BOOL)a4;
- (void)noteSettingsChangedForPassWithUniqueIdentifier:(id)a3 newSettings:(unint64_t)a4;
- (void)nukeStuff;
- (void)passDidUpdateTransactionSourceIdentifierWithPassUniqueIdentifier:(id)a3;
- (void)passTileManager:(id)a3 didUpdateTiles:(id)a4 forPassUniqueID:(id)a5 forContext:(int64_t)a6;
- (void)passUniqueIdentifiersMovedToExpired:(id)a3;
- (void)passWithUniqueIdentifier:(id)a3 didReceiveValueAddedServiceTransaction:(id)a4;
- (void)passWithUniqueIdentifierDidDisappear:(id)a3 forReason:(unint64_t)a4 withDiagnosticReason:(id)a5;
- (void)passWithUniqueIdentifierWillDisappear:(id)a3 forReason:(unint64_t)a4 withDiagnosticReason:(id)a5;
- (void)passWritten:(id)a3 withDaemonData:(id)a4 diff:(id)a5 fromSource:(int64_t)a6;
- (void)paymentPass:(id)a3 didUpdatePaymentApplications:(id)a4 toPaymentApplications:(id)a5;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableDailyCashNotifications:(BOOL)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableMessageService:(BOOL)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableTransactionService:(BOOL)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveMessage:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didRecomputeCategoryVisualizationMagnitudes:(id)a4 withStyle:(int64_t)a5;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didResolvePendingTransitTransactionAmountsWithTransaction:(id)a4 paymentApplication:(id)a5 balance:(id)a6;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalanceWithIdentifier:(id)a5;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalancesFrom:(id)a4 toBalances:(id)a5;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateDefaultPaymentApplication:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateFromTransitProperties:(id)a4 toTransitProperties:(id)a5;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateToPlans:(id)a4;
- (void)paymentTransactionProcessorDidActivate:(id)a3;
- (void)paymentTransactionProcessorDidDeactivate:(id)a3;
- (void)paymentTransactionUpdated:(id)a3 forTransactionSourceIdentifier:(id)a4;
- (void)peerPaymentWebServiceCoordinator:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5;
- (void)peerPaymentWebServiceCoordinatorDidDeleteAccount;
- (void)pendingProvisioningManagerDidFinishProvisioningWithReceipts:(id)a3;
- (void)pendingProvisioningsDidChangeWithPendingProvisionings:(id)a3;
- (void)placemarkFound:(id)a3 forTransaction:(id)a4;
- (void)postUpgradedPassNotificationForMarket:(id)a3 pass:(id)a4;
- (void)postUpgradesAvailableNotificationForMarket:(id)a3 pass:(id)a4;
- (void)prepareForBackupRestoreWithRequiredFileURLs:(id)a3 destinationFileHandles:(id)a4 handler:(id)a5;
- (void)primaryAppleAccountWasAdded:(id)a3;
- (void)primaryAppleAccountWasDeleted:(id)a3;
- (void)primaryAppleAccountWasUpdated:(id)a3 handler:(id)a4;
- (void)readTrueTransactionReceiptUniqueiDs:(id)a3;
- (void)readTrueUniqueIDs:(id)a3;
- (void)recoverPassWithUniqueID:(id)a3;
- (void)registerDatabaseObject:(id)a3;
- (void)relevantPassProviderDidChangeCurrentRelevantPasses:(id)a3;
- (void)removeMissingRemoteAssetsPersistentStoreItemWithUniqueID:(id)a3;
- (void)removePassesOfType:(unint64_t)a3 withDiagnosticReason:(id)a4;
- (void)rescheduleCommutePlanRenewalRemindersForPaymentPassWithUniqueIdentifier:(id)a3;
- (void)secureElementPairingDidChangeForReason:(unint64_t)a3;
- (void)sendDiscoveryEngagementMessagesUpdatedToDefaultDiscoveryManager:(id)a3;
- (void)sharesDidUpdateWithPaymentPassWithUniqueIdentifier:(id)a3;
- (void)supportedPaymentSetupFeatures:(id)a3 completion:(id)a4;
- (void)transactionReceiptFileManager:(id)a3 didDeleteTransactionReceiptWithUniqueID:(id)a4;
- (void)transactionReceiptFileManager:(id)a3 didWriteTransactionReceipt:(id)a4;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5;
- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4;
- (void)transactionSourceIdentifier:(id)a3 willRemoveTransaction:(id)a4;
- (void)updateRequiresMerchantReprocessing:(BOOL)a3 forTransactionWithIdentifier:(id)a4;
- (void)willRemoveTransactionsWithSourceIdentifierMapping:(id)a3;
@end

@implementation PDServer

- (BOOL)fieldDetectorManagerShouldSuppressFieldEvents:(id)a3
{
  unprotectedManagers = self->_unprotectedManagers;
  if (unprotectedManagers) {
    assertionManager = unprotectedManagers->_assertionManager;
  }
  else {
    assertionManager = 0;
  }
  v5 = [(PDAssertionManager *)assertionManager assertionsOfType:3];
  BOOL v6 = [v5 count] != 0;

  return v6;
}

- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5
{
  id v7 = a3;
  v8 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A0D8;
  block[3] = &unk_10072F7D0;
  v12 = self;
  int64_t v13 = a5;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);
}

- (void)readTrueUniqueIDs:(id)a3
{
  if (a3)
  {
    p_installedPassesLock = &self->_installedPassesLock;
    v5 = (void (**)(id, NSMutableSet *))a3;
    os_unfair_lock_lock(p_installedPassesLock);
    v5[2](v5, self->_installedPassUniqueIDs);

    os_unfair_lock_unlock(p_installedPassesLock);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  uint64_t v8 = -1;
  id v9 = (void **)qword_100808938;
  do
  {
    id v11 = *v9;
    v9 += 5;
    id v10 = v11;
  }
  while (v11 != a3 && v8++ != 9);
  if (v10 == a3) {
    unsigned __int8 v13 = v8;
  }
  else {
    unsigned __int8 v13 = 11;
  }
  if (v13 <= 0xAu)
  {
    int v14 = [v6 processIdentifier];
    v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_100514BAC(v14, v15);
    }

    sub_10001135C((uint64_t)self, v14);
    sub_100011448((uint64_t)self, v7, v13);
  }

  return v13 < 0xBu;
}

- (void)registerDatabaseObject:(id)a3
{
}

- (PDServer)init
{
  return 0;
}

- (void)dealloc
{
  [(PKIDSManager *)self->_idsManager removeDelegate:self];
  for (uint64_t i = 0; i != 55; i += 5)
  {
    v4 = (void *)qword_100808938[i];
    qword_100808938[i] = 0;

    v5 = (void *)qword_100808938[i + 4];
    qword_100808938[i + 4] = 0;
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self];

  v8.receiver = self;
  v8.super_class = (Class)PDServer;
  [(PDServer *)&v8 dealloc];
}

- (BOOL)shouldWritePass:(id)a3 source:(int64_t)a4 error:(id *)a5
{
  id v6 = a3;
  if ([v6 passType] || !PKIsManagedAppleID())
  {
    LOBYTE(a5) = 1;
  }
  else
  {
    objc_super v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v6 uniqueID];
      int v12 = 138412290;
      unsigned __int8 v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Managed Apple Account cannot support pass with unique ID: %@", (uint8_t *)&v12, 0xCu);
    }
    if (a5)
    {
      id v10 = PKDisplayableErrorForCommonType();
      id v11 = *a5;
      *a5 = v10;

      LOBYTE(a5) = 0;
    }
  }

  return (char)a5;
}

- (void)passWritten:(id)a3 withDaemonData:(id)a4 diff:(id)a5 fromSource:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  CFStringRef v11 = (const __CFString *)a5;
  id v87 = [v9 passType];
  int v12 = [v9 uniqueID];
  if (v87 == (id)1)
  {
    id v13 = [v9 paymentPass];
  }
  else
  {
    id v13 = 0;
  }
  id v99 = 0;
  uint64_t v14 = [(PDDatabaseManager *)self->_databaseManager passSharesForPassUniqueIdentifier:v12];
  v15 = [(PDDatabaseManager *)self->_databaseManager passEntitlementsForPassUniqueIdentifier:v12];
  v89 = [(PDDatabaseManager *)self->_databaseManager auxiliaryItemIdentifiersForPassUniqueIdentifier:v12];
  os_unfair_lock_lock(&self->_installedPassesLock);
  [(NSMutableSet *)self->_installedPassUniqueIDs addObject:v12];
  os_unfair_lock_unlock(&self->_installedPassesLock);
  if ([v9 hasLocationRelevancyInfo]
    && ([v9 isExpired] & 1) == 0)
  {
    v16 = [v9 relevantDates];
    if ([v16 count] && objc_msgSend(v9, "isPastRelevancy"))
    {
    }
    else
    {

      if (a6 == 4) {
        [(PDRelevantPassProvider *)self->_relevantPassProvider requestWhenInUseAuthorizationIfNeeded];
      }
    }
  }
  unsigned int v17 = [(PDDatabaseManager *)self->_databaseManager passExistsWithUniqueID:v12];
  v18 = PKLogFacilityTypeGetObject();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (!v17)
  {
    if (v19)
    {
      *(_DWORD *)buf = 138412546;
      v103 = v12;
      __int16 v104 = 2048;
      int64_t v105 = a6;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "PDServer (pass): inserting pass %@ for %ld.", buf, 0x16u);
    }

    v20 = (__CFString *)v11;
    if (![(PDDatabaseManager *)self->_databaseManager insertPass:v9 withDaemonData:v10 source:a6])
    {
      v21 = (void *)v14;
      goto LABEL_113;
    }
    [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v12];
    v26 = v25 = v12;

    v85 = v25;
    v27 = [(PDDatabaseManager *)self->_databaseManager passAnnotationsForPassUniqueIdentifier:v25];
    id v22 = v87;
    v21 = (void *)v14;
    v83 = v15;
    if (v87 == (id)1)
    {
      if ([v26 passType] == (id)1) {
        v28 = v26;
      }
      else {
        v28 = 0;
      }
    }
    else
    {
      v28 = 0;
    }
    id v31 = v28;

    if (PKCloudKitPassSyncEnabled()) {
      [(PDCloudSyncCoordinator *)self->_cloudSyncCoordiantor passAdded:v26 source:a6];
    }
    if (v26)
    {
      v32 = [(PDPassDynamicStateManager *)self->_dynamicStateManager passDynamicStateForUniqueIdentifier:v85];
      id v33 = [v26 copy];
      if (v33) {
        sub_10003A080((uint64_t)self, v33, v32, a6);
      }

      id v22 = v87;
    }
    if (v22 == (id)1 && v31)
    {
      [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator passAdded:v31];
      [(PDDiscoveryManager *)self->_discoveryManager passAdded:v31];
      [(PDAccountManager *)self->_accountManager passAdded:v31];
      [(PDPaymentOffersManager *)self->_paymentOffersManager passAdded:v31];
      [(PDAccountStatementMetadataProcessor *)self->_accountStatementMetadataProcessor passAdded:v31];
    }
    else if (!v22 && [v26 supportsLifecycleUpdates])
    {
      if (v27)
      {
        [v27 sortingState];
        uint64_t v34 = 1;
      }
      else
      {
        uint64_t v34 = 0;
      }
      [(PDWebServicesCoordinator *)self->_webServicesCoordinator sendPassLifecycleEventForUniqueIdentifier:v85 state:v34];
    }

    id v29 = 0;
    uint64_t v36 = 2;
LABEL_59:
    uint64_t v79 = v36;
    [(PDPassSignalManager *)self->_passSignalManager donateSignalForPass:v26 completion:&stru_10072F108];
    v84 = v29;
    v86 = v21;
    if (!v31)
    {
      uint64_t v41 = 0;
      id v88 = 0;
LABEL_99:
      v65 = v20;
      sub_1003D6060((uint64_t)self->_passTileManager, v26, v10);
      [(PDSpotlightIndexer *)self->_spotlightIndexer passAddedOrUpdated:v26];
      [(PDIssuerBindingManager *)self->_issuerBindingManager passAddedOrUpdated:v26 passAdded:v99 == 0];
      unprotectedManagers = self->_unprotectedManagers;
      uint64_t v67 = v41;
      if (unprotectedManagers) {
        notificationStreamManager = unprotectedManagers->_notificationStreamManager;
      }
      else {
        notificationStreamManager = 0;
      }
      [(PDNotificationStreamManager *)notificationStreamManager recalculateNotificationNames];
      [(PDUserNotificationManager *)self->_userNotificationManager updateWalletBadgeCount];
      [(PDUserNotificationManager *)self->_userNotificationManager updatePassAssetsWithPassUniqueID:v85];
      unsigned int v69 = [(PDDatabaseManager *)self->_databaseManager settingEnabled:128 forPassWithUniqueIdentifier:v85];
      if (v22 == (id)1)
      {
        unsigned int v70 = [(PDDatabaseManager *)self->_databaseManager settingEnabled:8 forPassWithUniqueIdentifier:v85];
        char v71 = 0;
        int v72 = v70 ^ 1;
      }
      else
      {
        unsigned __int8 v73 = +[PKWalletVisibility isWalletVisible];
        int v72 = 0;
        char v71 = v73 ^ 1;
      }
      if (a6 != 2 && ((v69 | v72) & 1) == 0 && (v71 & 1) == 0)
      {
        v74 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v103 = v85;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "PDServer: issuing insert/update user notification for pass %@.", buf, 0xCu);
        }

        v75 = [[PDPassUpdateUserNotification alloc] initWithPassDiff:v65];
        [(PDUserNotification *)v75 setReissueBannerOnUpdate:1];
        [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v75];
      }
      [(PDRelevantPassProvider *)self->_relevantPassProvider recomputeRelevantPassesWithSearchMode:1];
      [(PDDefaultPassManager *)self->_defaultPassManager updateContactlessPassesAvailability];
      if (v22 == (id)1) {
        [(PDDefaultPassManager *)self->_defaultPassManager updateDefaultPaymentPassIfNeeded];
      }
      v91[0] = _NSConcreteStackBlock;
      v91[1] = 3221225472;
      v91[2] = sub_10003A3B4;
      v91[3] = &unk_10072F130;
      id v13 = v31;
      id v92 = v13;
      v93 = self;
      id v95 = v88;
      uint64_t v96 = v67;
      int64_t v97 = a6;
      uint64_t v98 = v79;
      id v9 = v26;
      id v94 = v9;
      sub_100037830(v91);

      v15 = v83;
      int v12 = v85;
      v20 = v65;
      v21 = v86;
      goto LABEL_113;
    }
    uint64_t v37 = [(PKSecureElement *)self->_secureElement secureElementIdentifiers];
    v38 = [v31 primaryPaymentApplicationForSecureElementIdentifiers:v37];
    v39 = [v29 primaryPaymentApplicationForSecureElementIdentifiers:v37];
    if (v38) {
      id v40 = [v38 state];
    }
    else {
      id v40 = 0;
    }
    id v82 = v40;
    v77 = (void *)v37;
    id v78 = v10;
    v76 = v20;
    v80 = v39;
    v42 = v26;
    if (v39) {
      id v88 = [v39 state];
    }
    else {
      id v88 = 0;
    }
    v100[0] = @"primary-payment-method-type";
    v81 = v38;
    v43 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v38 paymentType]);
    v101[0] = v43;
    v100[1] = @"has-transaction-service";
    v44 = [v31 transactionServiceURL];
    v45 = +[NSNumber numberWithBool:v44 != 0];
    v101[1] = v45;
    v100[2] = @"has-message-service";
    v46 = [v31 messageServiceURL];
    v47 = +[NSNumber numberWithBool:v46 != 0];
    v101[2] = v47;
    v48 = +[NSDictionary dictionaryWithObjects:v101 forKeys:v100 count:3];
    PKAnalyticsSendEvent();

    id v49 = v82;
    if (v82 == (id)6 && v88 != (id)6) {
      PKAnalyticsSendEvent();
    }
    v50 = PKLogFacilityTypeGetObject();
    BOOL v51 = os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT);
    v52 = v86;
    if (v82 == v88)
    {
      v53 = v76;
      id v22 = v87;
      v26 = v42;
      if (!v51) {
        goto LABEL_84;
      }
      uint64_t v60 = [v81 stateAsString];
      v55 = (void *)v60;
      CFStringRef v61 = @"none";
      if (v60) {
        CFStringRef v61 = (const __CFString *)v60;
      }
      *(_DWORD *)buf = 138412546;
      v103 = v85;
      __int16 v104 = 2114;
      int64_t v105 = (int64_t)v61;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "PDServer (pass): secure element pass %@ maintained primary application state %{public}@.", buf, 0x16u);
    }
    else
    {
      v53 = v76;
      id v22 = v87;
      v26 = v42;
      if (!v51) {
        goto LABEL_84;
      }
      uint64_t v54 = [v80 stateAsString];
      v55 = (void *)v54;
      if (v54) {
        CFStringRef v56 = (const __CFString *)v54;
      }
      else {
        CFStringRef v56 = @"none";
      }
      uint64_t v57 = [v81 stateAsString];
      v58 = (void *)v57;
      *(_DWORD *)buf = 138412802;
      if (v57) {
        CFStringRef v59 = (const __CFString *)v57;
      }
      else {
        CFStringRef v59 = @"none";
      }
      v52 = v86;
      v103 = v85;
      __int16 v104 = 2114;
      int64_t v105 = (int64_t)v56;
      v26 = v42;
      id v22 = v87;
      __int16 v106 = 2114;
      CFStringRef v107 = v59;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "PDServer (pass): secure element pass %@ updated primary application state: %{public}@ -> %{public}@.", buf, 0x20u);
    }
    id v49 = v82;
LABEL_84:

    if (v49 && v49 != (id)7) {
      PKSetNeedsLostModeExitAuth();
    }
    v62 = +[NSDate date];
    PDSetLastPaymentPassInsertionOrRemovalDate();

    uint64_t v41 = (uint64_t)v82;
    v20 = v53;
    if (v81) {
      uint64_t v41 = (uint64_t)[v31 effectiveContactlessPaymentApplicationState];
    }
    id v10 = v78;
    if (v80) {
      id v88 = [v84 effectiveContactlessPaymentApplicationState];
    }
    [(PDAppletSubcredentialManager *)self->_subcredentialManager passAddedOrUpdated:v31 oldPass:v84 oldShares:v52];
    [(PDDatabaseManager *)self->_databaseManager recomputeBalancesForPaymentPass:v31];
    [(PDDatabaseManager *)self->_databaseManager resolvePendingTransitTransactionAmountsWithPaymentPass:v31];
    [(PDAuxiliaryCapabilityManager *)self->_auxiliaryCapabilityManager passAddedOrUpdated:v31 oldPass:v84];
    [(PDBarcodeCredentialManager *)self->_barcodeCredentialManager passAddedOrUpdated:v31];
    sharingManager = self->_sharingManager;
    if (v84)
    {
      [(PDSharingManager *)sharingManager passUpdated:v31 oldPass:v84 oldShares:v52 oldEntitlements:v83];
      if ([v31 contactlessActivationGroupingType] != (id)2) {
        sub_10018F0C4((uint64_t)self->_expressPassManager, v31);
      }
    }
    else
    {
      [(PDSharingManager *)sharingManager passAdded:v31];
    }
    if (v88 == (id)2 && v41 == 1)
    {
      v64 = objc_alloc_init(PDProvisioningSupportDataManager);
      [(PDProvisioningSupportDataManager *)v64 applyPostPersonalizedSupportDataIfNecessaryToPass:v31];

      uint64_t v41 = 1;
    }
    [(PDAuxiliaryPassInformationManager *)self->_auxPassInformationManager didInsertOrUpdatePass:v31 oldPass:v84 oldAuxiliaryInformationIdentifiers:v89];
    [(PDPassVerificationManager *)self->_passVerificationManager passAddedOrUpdated:v31];

    goto LABEL_99;
  }
  v20 = (__CFString *)v11;
  if (v19)
  {
    *(_DWORD *)buf = 138412802;
    v103 = v12;
    __int16 v104 = 2048;
    int64_t v105 = a6;
    __int16 v106 = 2112;
    CFStringRef v107 = v11;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "PDServer (pass): updating pass %@ for %ld:\n\t%@.", buf, 0x20u);
  }

  v21 = (void *)v14;
  if ([(PDDatabaseManager *)self->_databaseManager updatePass:v9 withDaemonData:v10 oldPass:&v99 fromSource:a6])
  {
    id v22 = v87;
    if (v87 == (id)1)
    {
      id v23 = [v99 passType];
      id v24 = v99;
      if (v23 != (id)1) {
        id v24 = 0;
      }
    }
    else
    {
      id v24 = 0;
    }
    id v29 = v24;
    v85 = v12;
    v26 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v12];

    v83 = v15;
    if (v87 == (id)1)
    {
      if ([v26 passType] == (id)1) {
        v30 = v26;
      }
      else {
        v30 = 0;
      }
    }
    else
    {
      v30 = 0;
    }
    id v31 = v30;

    if (v26)
    {
      id v35 = [v26 copy];
      if (v35) {
        sub_100039CA0((uint64_t)self, v35);
      }
    }
    if (PKCloudKitPassSyncEnabled()) {
      [(PDCloudSyncCoordinator *)self->_cloudSyncCoordiantor passUpdated:v26 source:a6];
    }
    if (sub_100039EFC((uint64_t)self, kTCCServiceCalendar)) {
      PKUpdateCalendarEventsForPass();
    }
    [(PDRelevantPassProvider *)self->_relevantPassProvider passUpdated:v26];
    uint64_t v36 = 1;
    goto LABEL_59;
  }
LABEL_113:
}

- (void)passWithUniqueIdentifierWillDisappear:(id)a3 forReason:(unint64_t)a4 withDiagnosticReason:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v10 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v8];
    if (v10)
    {
      [(PDDatabaseManager *)self->_databaseManager prepareToDeletePassWithUniqueIdentifier:v8];
      [(PDUserNotificationManager *)self->_userNotificationManager removeUserNotificationsForPassUniqueIdentifier:v8];
      [(PDUserNotificationManager *)self->_userNotificationManager removeNotificationAssetsForPassWithUniqueIdentifier:v8];
      if ([v10 passType] == (id)1)
      {
        id v24 = v10;
        id v11 = v10;
        id v25 = v9;
        [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator passWillBeRemoved:v11 withDiagnosticReason:v9];
        [(PDAppletSubcredentialManager *)self->_subcredentialManager passWillBeRemoved:v11];
        [(PDAuxiliaryCapabilityManager *)self->_auxiliaryCapabilityManager passWillBeRemoved:v11];
        [(PDAuxiliaryPassInformationManager *)self->_auxPassInformationManager passWillBeRemoved:v11];
        [(PDSharingManager *)self->_sharingManager passWillBeRemoved:v11];
        [(PDPassVerificationManager *)self->_passVerificationManager passWillBeRemoved:v11];
        [(PDBarcodeCredentialManager *)self->_barcodeCredentialManager passWillBeRemoved:v11];
        [(PDISO18013Manager *)self->_iso18013Manager passWillBeRemoved:v11];
        id v23 = v11;
        int v12 = [v11 devicePaymentApplications];
        id v13 = objc_alloc_init((Class)NSMutableArray);
        id v14 = objc_alloc_init((Class)NSMutableSet);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v15 = v12;
        id v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v17; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v27 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
              [v20 state];
              if (PKPaymentApplicationStateIndicatesAppletPresence())
              {
                v21 = [v20 subcredentials];
                if ([v21 count])
                {
                  [v14 unionSet:v21];
                }
                else
                {
                  id v22 = [v20 applicationIdentifier];
                  [v13 addObject:v22];
                }
              }
            }
            id v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }
          while (v17);
        }

        if ([v13 count]) {
          [(PKSecureElement *)self->_secureElement markAppletsWithIdentifiersForDeletion:v13 completion:0];
        }
        id v9 = v25;
        if ([v14 count]) {
          [(PDAppletSubcredentialManager *)self->_subcredentialManager revokeSubcredentials:v14 withCompletion:0];
        }

        id v10 = v24;
      }
      else
      {
        if (sub_100039EFC((uint64_t)self, kTCCServiceCalendar)) {
          PKRemoveCalendarEventsForPass();
        }
        if (a4 != 1 && a4 != 8 && [v10 supportsLifecycleUpdates]) {
          [(PDWebServicesCoordinator *)self->_webServicesCoordinator sendPassLifecycleEventForUniqueIdentifier:v8 state:2];
        }
      }
    }
  }
}

- (void)passWithUniqueIdentifierDidDisappear:(id)a3 forReason:(unint64_t)a4 withDiagnosticReason:(id)a5
{
  id v7 = a3;
  id v8 = v7;
  if (v7)
  {
    id v21 = v7;
    id v9 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v7];
    if (v9)
    {
      os_unfair_lock_lock(&self->_installedPassesLock);
      [(NSMutableSet *)self->_installedPassUniqueIDs removeObject:v21];
      os_unfair_lock_unlock(&self->_installedPassesLock);
      [(PDDatabaseManager *)self->_databaseManager deletePassWithUniqueIdentifier:v21];
      [(PDPassSignalManager *)self->_passSignalManager removeSignalForPass:v9 completion:&stru_10072F150];
      if ([v9 passType] == (id)1)
      {
        id v10 = [(PDCloudStoreNotificationCoordinator *)self->_cloudStoreCoordinator applePayContainer];
        [v10 passDidDisappear:v9];

        [(PDCloudStoreTransactionSourceController *)self->_cloudStoreTransactionSourceController passDidDisappear:v9];
        id v11 = v9;
        if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 6)
        {
          [(PDDefaultPassManager *)self->_defaultPassManager updateDefaultPaymentPassIfNeeded];
          expressPassManager = self->_expressPassManager;
          id v13 = [v11 devicePaymentApplications];
          id v14 = +[NSSet set];
          id v15 = [v11 uniqueID];
          sub_10018DA14((uint64_t)expressPassManager, v13, v14, v15);
        }
        else if (a4 == 5)
        {
          [(PDDefaultPassManager *)self->_defaultPassManager clearDefaultPaymentPassIfNeeded];
          sub_10018C7FC((uint64_t)self->_expressPassManager);
        }
        [(PDAccountManager *)self->_accountManager passRemoved:v11];
        [(PDAccountStatementMetadataProcessor *)self->_accountStatementMetadataProcessor passRemoved:v11];
        [(PDPaymentOffersManager *)self->_paymentOffersManager passRemoved:v11];
        id v16 = +[NSDate date];
        PDSetLastPaymentPassInsertionOrRemovalDate();

        id v17 = AMPEnrollmentDismissedKeyForPass();
        PKSharedCacheRemoveObjectForKey();

        if ([v11 associatedAccountFeatureIdentifier] == (id)2)
        {
          uint64_t v18 = PDUtilityQueue();
          dispatch_async(v18, &stru_10072F170);
        }
        if ([v11 isCarKeyPass]) {
          PDRegisterCarKeySiriVocabulary(self->_databaseManager, 1);
        }
        sub_100038D54((id *)&self->super.isa);
        [(PDDiscoveryManager *)self->_discoveryManager passRemoved:v11];
      }
      if (PKCloudKitPassSyncEnabled()) {
        [(PDCloudSyncCoordinator *)self->_cloudSyncCoordiantor passDeleted:v9 reason:a4];
      }
      sub_10003B128((uint64_t)self, v9);
      [(PDRelevantPassProvider *)self->_relevantPassProvider recomputeRelevantPassesWithSearchMode:1];
      unprotectedManagers = self->_unprotectedManagers;
      if (unprotectedManagers) {
        notificationStreamManager = unprotectedManagers->_notificationStreamManager;
      }
      else {
        notificationStreamManager = 0;
      }
      [(PDNotificationStreamManager *)notificationStreamManager recalculateNotificationNames];
      [(PDUserNotificationManager *)self->_userNotificationManager updateWalletBadgeCount];
      [(PDSpotlightIndexer *)self->_spotlightIndexer passDidDisappear:v9];
      [(PDDefaultPassManager *)self->_defaultPassManager updateContactlessPassesAvailability];
      [(PDIssuerBindingManager *)self->_issuerBindingManager passRemoved:v9];
      sub_1003D61EC((uint64_t)self->_passTileManager, v9);
      [(PDDevicePasscodeManager *)self->_devicePasscodeManager updateUpgradedPasscodePolicyEnforcementWithCompletion:&stru_10072F1B0];
      [(PDFinanceSyncManager *)self->_financeSyncManager setNeedsSync];
    }

    id v8 = v21;
  }
  _objc_release_x1(v7, v8);
}

- (void)cardFileManager:(id)a3 didUpdateRemoteAssetsForPassWithUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PDServer: received pass with uniqueID:%@ did update remote assets. sending notification", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v7];
  if (v9) {
    sub_100039CA0((uint64_t)self, v9);
  }
}

- (void)catalogOfRecordWritten:(id)a3 source:(int64_t)a4
{
}

- (void)notePassWithUniqueID:(id)a3 isRevoked:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  BOOL v6 = [(PDDatabaseManager *)self->_databaseManager uniqueIDIsRevoked:v10];
  id v7 = v10;
  if (v6 != v4)
  {
    BOOL v8 = v6;
    [(PDDatabaseManager *)self->_databaseManager updateRevocationStatus:v4 forUniqueID:v10];
    id v9 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v10];
    if (v9) {
      sub_100039CA0((uint64_t)self, v9);
    }
    if (v8 && !v4) {
      [(PDCardFileManager *)self->_cardFileManager scheduleImmediateRevocationCheck];
    }

    id v7 = v10;
  }
  _objc_release_x1(v6, v7);
}

- (void)cardFileManager:(id)a3 didFailToDecryptRemoteAssets:(id)a4 forPass:(id)a5
{
  id v8 = a4;
  id v7 = [a5 secureElementPass];
  if (v7) {
    [(PDAuxiliaryCapabilityManager *)self->_auxiliaryCapabilityManager didFailToDecryptRemoteAssets:v8 forPass:v7];
  }
}

- (void)transactionReceiptFileManager:(id)a3 didWriteTransactionReceipt:(id)a4
{
  id v4 = [(PDDatabaseManager *)self->_databaseManager insertOrUpdateTransactionReceipt:a4];
}

- (void)transactionReceiptFileManager:(id)a3 didDeleteTransactionReceiptWithUniqueID:(id)a4
{
}

- (void)noteLockScreenSettingsChangedForPassWithUniqueIdentifier:(id)a3
{
  unprotectedManagers = self->_unprotectedManagers;
  if (unprotectedManagers) {
    notificationStreamManager = unprotectedManagers->_notificationStreamManager;
  }
  else {
    notificationStreamManager = 0;
  }
  id v6 = a3;
  [(PDNotificationStreamManager *)notificationStreamManager recalculateNotificationNames];
  [(PDRelevantPassProvider *)self->_relevantPassProvider recomputeRelevantPassesWithSearchMode:1];
  id v7 = +[NSDistributedNotificationCenter defaultCenter];
  uint64_t v8 = PKPassLockScreenSettingDidChangeNotification;
  uint64_t v10 = PKPassLibraryUniqueIDUserInfoKey;
  id v11 = v6;
  id v9 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];

  [v7 postNotificationName:v8 object:0 userInfo:v9];
}

- (void)noteAutomaticallyPresentSettingsChangedForPassWithUniqueIdentifier:(id)a3
{
  defaultPassManager = self->_defaultPassManager;
  id v4 = a3;
  [(PDDefaultPassManager *)defaultPassManager updateContactlessPassesAvailability];
  v5 = +[NSDistributedNotificationCenter defaultCenter];
  uint64_t v6 = PKPassAutomaticPresentationSettingsDidChangeNotification;
  uint64_t v8 = PKPassLibraryUniqueIDUserInfoKey;
  id v9 = v4;
  id v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  [v5 postNotificationName:v6 object:0 userInfo:v7];
}

- (void)noteSettingsChangedForPassWithUniqueIdentifier:(id)a3 newSettings:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = +[NSDistributedNotificationCenter defaultCenter];
  uint64_t v7 = PKPassSettingsDidChangeNotification;
  v10[0] = PKPassLibraryUniqueIDUserInfoKey;
  v10[1] = PKPassLibrarySettingsUserInfoKey;
  v11[0] = v5;
  uint64_t v8 = +[NSNumber numberWithUnsignedInteger:a4];
  v11[1] = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  [v6 postNotificationName:v7 object:0 userInfo:v9];
}

- (void)handleDatabaseIntegrityProblem
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Database integrity problem found.", buf, 2u);
  }

  BOOL v4 = sub_10003BACC((uint64_t)self);
  BOOL v5 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v5)
    {
      __int16 v9 = 0;
      uint64_t v6 = "Database integrity problem resolved.";
      uint64_t v7 = (uint8_t *)&v9;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else if (v5)
  {
    __int16 v8 = 0;
    uint64_t v6 = "Database integrity resolution interrupted by data migrator.";
    uint64_t v7 = (uint8_t *)&v8;
    goto LABEL_8;
  }
}

- (void)passDidUpdateTransactionSourceIdentifierWithPassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = PDDefaultQueue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003C4DC;
  v7[3] = &unk_10072E198;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)trueUniqueIDs
{
  return self->_installedPassUniqueIDs;
}

- (void)readTrueTransactionReceiptUniqueiDs:(id)a3
{
  if (a3)
  {
    transactionReceiptFileManager = self->_transactionReceiptFileManager;
    id v5 = a3;
    id v6 = [(PDTransactionReceiptFileManager *)transactionReceiptFileManager uniqueIDs];
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }
}

- (void)mutateTrueUniqueIDs:(id)a3
{
  if (a3)
  {
    p_installedPassesLock = &self->_installedPassesLock;
    id v5 = (void (**)(id, NSMutableSet *))a3;
    os_unfair_lock_lock(p_installedPassesLock);
    v5[2](v5, self->_installedPassUniqueIDs);

    os_unfair_lock_unlock(p_installedPassesLock);
  }
}

- (id)storedPasses
{
  return [(PDCardFileManager *)self->_cardFileManager passes];
}

- (void)paymentPass:(id)a3 didUpdatePaymentApplications:(id)a4 toPaymentApplications:(id)a5
{
  id v8 = a3;
  secureElement = self->_secureElement;
  id v10 = a5;
  id v11 = a4;
  [(PKSecureElement *)secureElement secureElementIdentifiers];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10003CC10;
  v47[3] = &unk_10072F1D8;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v48 = v12;
  id v13 = objc_retainBlock(v47);
  id v14 = [v11 objectsPassingTest:v13];

  id v15 = [v10 objectsPassingTest:v13];

  expressPassManager = self->_expressPassManager;
  id v17 = [v8 uniqueID];
  sub_10018DA14((uint64_t)expressPassManager, v14, v15, v17);

  uint64_t v18 = [v8 deviceContactlessPaymentApplications];
  if ((unint64_t)[v18 count] >= 2)
  {
    databaseManager = self->_databaseManager;
    v20 = [v8 uniqueID];
    id v21 = [(PDDatabaseManager *)databaseManager defaultPaymentApplicationForPassUniqueIdentifier:v20];

    if (!v21)
    {
      v39 = v15;
      id v40 = v13;
      id v41 = v12;
      id v22 = [v8 devicePrimaryContactlessPaymentApplication];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      v38 = v18;
      id v23 = v18;
      id v24 = [v23 countByEnumeratingWithState:&v43 objects:v49 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v25; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v44 != v26) {
              objc_enumerationMutation(v23);
            }
            long long v28 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            id v29 = [v28 contactlessPriority];
            if ((uint64_t)v29 > (uint64_t)[v22 contactlessPriority])
            {
              id v30 = v28;

              id v22 = v30;
            }
          }
          id v25 = [v23 countByEnumeratingWithState:&v43 objects:v49 count:16];
        }
        while (v25);
      }

      id v31 = self->_databaseManager;
      v32 = [v8 uniqueID];
      id v33 = [(PDDatabaseManager *)v31 setDefaultPaymentApplication:v22 forPassUniqueIdentifier:v32];

      id v13 = v40;
      id v12 = v41;
      uint64_t v18 = v38;
      id v15 = v39;
    }
  }
  if (![v14 count] && objc_msgSend(v15, "count"))
  {
    cloudStoreTransactionSourceController = self->_cloudStoreTransactionSourceController;
    id v35 = [v15 anyObject];
    [(PDCloudStoreTransactionSourceController *)cloudStoreTransactionSourceController didAddPaymentApplication:v35 forPaymentPass:v8];

    uint64_t v36 = [v8 associatedAccountServiceAccountIdentifier];
    if (v36)
    {
      accountManager = self->_accountManager;
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_10003CC74;
      v42[3] = &unk_10072F200;
      v42[4] = self;
      [(PDAccountManager *)accountManager accountWithIdentifier:v36 completion:v42];
    }
    if ([v8 hasAssociatedPeerPaymentAccount]) {
      PKSharedCacheSetBoolForKey();
    }
  }
  [(PDISO18013Manager *)self->_iso18013Manager handlePaymentPassUpdateFrom:v8 priorPaymentApplications:v14 completion:0];
  [(PDPaymentUserCommunicationManager *)self->_paymentUserCommunicationManager handlePaymentPassDidUpdatePaymentApplications:v8 fromPaymentApplications:v14 withCompletion:0];
  if ([v8 isCarKeyPass]) {
    PDRegisterCarKeySiriVocabulary(self->_databaseManager, 1);
  }
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_10003DF68((uint64_t)self);
  v157[0] = _NSConcreteStackBlock;
  v157[1] = 3221225472;
  v157[2] = sub_10003DFE8;
  v157[3] = &unk_10072F228;
  id v12 = v8;
  id v158 = v12;
  id v13 = v9;
  id v159 = v13;
  [v11 enumerateObjectsUsingBlock:v157];

  id v14 = sub_10003DFF4((uint64_t)self);
  v153[0] = _NSConcreteStackBlock;
  v153[1] = 3221225472;
  v153[2] = sub_10003E074;
  v153[3] = &unk_10072F250;
  id v15 = v12;
  id v154 = v15;
  id v16 = v13;
  id v155 = v16;
  id v17 = v10;
  id v156 = v17;
  [v14 enumerateObjectsUsingBlock:v153];

  [(PDDiscoveryManager *)self->_discoveryManager transactionSourceIdentifier:v15 didReceiveTransaction:v16 oldTransaction:v17];
  [(PDTransactionAuthenticationManager *)self->_transactionAuthenticationManager transactionSourceIdentifier:v15 didReceiveTransaction:v16 oldTransaction:v17];
  [(PDBarcodeCredentialManager *)self->_barcodeCredentialManager transactionSourceIdentifier:v15 didReceiveTransaction:v16 oldTransaction:v17];
  [(PDSpotlightIndexer *)self->_spotlightIndexer transactionSourceIdentifier:v15 didReceiveTransaction:v16 oldTransaction:v17];
  [(PDFinanceSyncManager *)self->_financeSyncManager setNeedsSync];
  [(PDTransactionNotificationController *)self->_transactionNotificationController paymentTransactionUpdated:v16 existingPaymentTransaction:v17 transactionSourceIdentifier:v15];
  sub_10003CC88((uint64_t)self, v16, v15);
  if ([v16 isIssuerInstallmentTransaction]
    && [v16 hasNotificationServiceData])
  {
    PKSharedCacheSetBoolForKey();
  }
  uint64_t v18 = [v16 paymentRewardsRedemption];
  if (v18)
  {
    BOOL v19 = (void *)v18;
    unsigned int v20 = [v16 hasNotificationServiceData];

    if (v20) {
      PKSharedCacheSetBoolForKey();
    }
  }
  unsigned int v21 = [v16 updateReasonIsInitialDownload];
  id v22 = [(PDDatabaseManager *)self->_databaseManager passUniqueIdentifierForTransactionSourceIdentifier:v15];
  if (v22)
  {
    id v23 = [v16 identifier];
    char v24 = v23 ? v21 : 1;

    if ((v24 & 1) == 0)
    {
      id v25 = +[NSDistributedNotificationCenter defaultCenter];
      v170[0] = PKDistributedNotificationTransactionIdentifierKey;
      uint64_t v26 = [v16 identifier];
      v171[0] = v26;
      v171[1] = v22;
      v170[1] = PKDistributedNotificationTransactionPassUniqueIDKey;
      v170[2] = PKDistributedNotificationTransactionSourceTransactionIdentifierKey;
      v171[2] = v15;
      long long v27 = +[NSDictionary dictionaryWithObjects:v171 forKeys:v170 count:3];

      long long v28 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "posting PKDistributedNotificationPaymentTransactionReceived", buf, 2u);
      }

      [v25 postNotificationName:PKDistributedNotificationPaymentTransactionReceived object:0 userInfo:v27];
    }
  }
  unsigned int v139 = v21;
  if (v21) {
    goto LABEL_51;
  }
  if ([v16 deviceScoreIdentifiersRequired]
    && ([v16 deviceScoreIdentifiersSubmitted] & 1) == 0)
  {
    id v29 = [v16 sendDeviceScoreIdentifier];
    if (v29)
    {
    }
    else
    {
      id v30 = [v16 requestDeviceScoreIdentifier];

      if (!v30) {
        goto LABEL_30;
      }
    }
    PKAnalyticsSendEvent();
    id v31 = [v16 serviceIdentifier];
    if ([v31 length]
      && ([(NSMutableSet *)self->_transactionDeviceScoreSubmissionsInProgess containsObject:v31] & 1) == 0)
    {
      id v33 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v163 = (uint64_t)v31;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Submitting device score for transaction with service identifier %@", buf, 0xCu);
      }

      [(NSMutableSet *)self->_transactionDeviceScoreSubmissionsInProgess addObject:v31];
      peerPaymentWebServiceCoordinator = self->_peerPaymentWebServiceCoordinator;
      v149[0] = _NSConcreteStackBlock;
      v149[1] = 3221225472;
      v149[2] = sub_10003E084;
      v149[3] = &unk_10072F278;
      v149[4] = self;
      id v150 = v31;
      id v151 = v16;
      id v152 = v15;
      [(PDPeerPaymentWebServiceCoordinator *)peerPaymentWebServiceCoordinator submitDeviceScoreIdentifiersForTransaction:v151 completion:v149];
    }
    else
    {
      v32 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v163 = (uint64_t)v31;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Not submitting device score for transaction with service identifier %@, because another request is in progress.", buf, 0xCu);
      }
    }
  }
LABEL_30:
  id v35 = [v16 transactionType];
  uint64_t v36 = [v16 transactionDate];
  [v36 timeIntervalSinceNow];
  double v38 = v37;

  if (!v35 && fabs(v38) <= 259200.0)
  {
    if (v17)
    {
      v39 = [v16 merchant];
      id v40 = [v39 category];
      [v17 merchant];
      v42 = id v41 = v16;
      BOOL v43 = v40 != [v42 category];

      id v16 = v41;
    }
    else
    {
      BOOL v43 = 1;
    }
    [(PDDatabaseManager *)self->_databaseManager recomputeCategoryVisualizationMagnitudesForPassUniqueID:v22 withStyle:v43];
  }
  if (PKRewardsCenterEnabled() && [v16 accountType] == (id)2)
  {
    id v44 = [v17 transactionType];
    id v45 = [v16 transactionStatus];
    id v46 = [v17 transactionStatus];
    unsigned int v47 = [v16 impactsPromotionProgress];
    unint64_t v48 = [(PDDatabaseManager *)self->_databaseManager transactionSourceTypeForTransactionSourceIdentifier:v15];
    if (v48)
    {
      if (v48 != 2) {
        goto LABEL_51;
      }
      unsigned int v133 = v47;
      id v49 = v46;
      id v50 = v45;
      [v16 altDSID];
      id v132 = v44;
      v52 = id v51 = v16;
      int v53 = PKAltDSIDIsCurrentUser();

      id v16 = v51;
      id v44 = v132;
    }
    else
    {
      unsigned int v133 = v47;
      id v49 = v46;
      id v50 = v45;
      int v53 = 1;
    }
    BOOL v55 = v35 != v44 || v50 != v49;
    if ((v133 & v53) == 1 && v55)
    {
      accountManager = self->_accountManager;
      uint64_t v57 = [v16 accountIdentifier];
      [(PDAccountManager *)accountManager updateAccountPromotionsForAccountWithIdentifier:v57 observeCooldownPeriod:1 completion:&stru_10072F2B8];
    }
  }
LABEL_51:
  id v58 = [v16 transactionType];
  if (v58 == (id)14)
  {
    if ([v16 suppressBehavior] != (id)1)
    {
      v63 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        v64 = [v16 serviceIdentifier];
        *(_DWORD *)buf = 138412290;
        uint64_t v163 = (uint64_t)v64;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Suppressing installment plan transaction for identifier: %@", buf, 0xCu);
      }
      uint64_t v65 = [(PDDatabaseManager *)self->_databaseManager updateSuppressBehavior:1 forPaymentTransaction:v16 sourceIdentifier:v15];

      id v16 = (id)v65;
    }
    goto LABEL_79;
  }
  unint64_t v59 = (unint64_t)v58;
  if (v58 != (id)8)
  {
    id v66 = [v16 transactionStatus];
    uint64_t v67 = [v16 accountIdentifier];
    if (v67)
    {
      v68 = v16;
      unsigned int v69 = [v16 hasNotificationServiceData];
      unsigned int v70 = 0;
      if (v69 && v66 == (id)8)
      {
        char v71 = [v68 amount];
        if (v71)
        {
          v134 = v71;
          int v72 = [v68 amount];
          unsigned __int8 v73 = +[NSDecimalNumber zero];
          unsigned int v70 = [v72 isEqualToNumber:v73];

          char v71 = v134;
        }
        else
        {
          unsigned int v70 = 1;
        }
      }
    }
    else
    {
      v68 = v16;
      unsigned int v70 = 0;
    }

    int v74 = v70 | PKPaymentTransactionHasAuthenticationRequest();
    id v16 = v68;
    id v75 = [v68 suppressBehavior];
    if (v74 != 1 || v75 == (id)1)
    {
      if (v75 == (id)1) {
        char v80 = v74;
      }
      else {
        char v80 = 1;
      }
      if (v80 & 1) != 0 || (sub_10003E788((id *)&self->super.isa, v15, v68))
      {
LABEL_78:
        if (v59 > 1) {
          goto LABEL_101;
        }
LABEL_79:
        databaseManager = self->_databaseManager;
        id v82 = [v16 serviceIdentifier];
        id v62 = [(PDDatabaseManager *)databaseManager redemptionAccountEventWithTransactionIdentifier:v82];

        if ([v62 type] == (id)1)
        {
          v83 = [v62 items];
          v84 = [v83 anyObject];

          if (v84)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v85 = v16;
              v86 = [v84 status];
              if (v86 == @"success"
                || (id v87 = v86) != 0
                && (unsigned int v88 = [(__CFString *)v86 isEqualToString:@"success"],
                    v87,
                    v87,
                    v88))
              {
                id v89 = [v84 type];
                id v16 = v85;
                if ([v85 redemptionType] != v89)
                {
                  v90 = PKLogFacilityTypeGetObject();
                  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                  {
                    [v62 type];
                    v135 = PKAccountEventTypeToString();
                    uint64_t v91 = [v85 serviceIdentifier];
                    *(_DWORD *)buf = 138412546;
                    uint64_t v163 = (uint64_t)v135;
                    __int16 v164 = 2112;
                    uint64_t v165 = v91;
                    id v92 = (void *)v91;
                    _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "Updating redemption type: %@ for transaction %@", buf, 0x16u);
                  }
                  v93 = v85;
                  id v137 = v15;
                  uint64_t v94 = [(PDDatabaseManager *)self->_databaseManager updateRedemptionType:v89 forPaymentTransaction:v85 sourceIdentifier:v15];

                  id v95 = [v84 identifier];
                  uint64_t v96 = [(PDDatabaseManager *)self->_databaseManager transactionWithReferenceIdentifier:v95];
                  BOOL v97 = os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT);
                  if (v96)
                  {
                    if (v97)
                    {
                      *(_DWORD *)buf = 138412290;
                      uint64_t v163 = (uint64_t)v95;
                      _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "Suppressing disbursement with identifier %@", buf, 0xCu);
                    }

                    uint64_t v98 = self->_databaseManager;
                    v90 = [v96 transactionSourceIdentifier];
                    id v99 = [(PDDatabaseManager *)v98 updateSuppressBehavior:1 forPaymentTransaction:v96 sourceIdentifier:v90];
                  }
                  else if (v97)
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v163 = (uint64_t)v95;
                    _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "No transaction to suppress with identifier %@", buf, 0xCu);
                  }

                  id v16 = (id)v94;
                  id v15 = v137;
                }
              }
              else
              {
                id v16 = v85;
              }
            }
          }
        }
        goto LABEL_100;
      }
      v76 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        v100 = [v68 serviceIdentifier];
        *(_DWORD *)buf = 138412290;
        uint64_t v163 = (uint64_t)v100;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Unsuppressing transaction for identifier: %@", buf, 0xCu);
      }
      uint64_t v78 = 2;
    }
    else
    {
      v76 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        v77 = [v68 serviceIdentifier];
        *(_DWORD *)buf = 138412290;
        uint64_t v163 = (uint64_t)v77;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Suppressing transaction for identifier: %@", buf, 0xCu);
      }
      uint64_t v78 = 1;
    }

    uint64_t v79 = [(PDDatabaseManager *)self->_databaseManager updateSuppressBehavior:v78 forPaymentTransaction:v68 sourceIdentifier:v15];

    id v16 = (id)v79;
    goto LABEL_78;
  }
  if ([v16 suppressBehavior] != (id)1)
  {
    uint64_t v60 = [v16 referenceIdentifier];
    CFStringRef v61 = self->_accountManager;
    v145[0] = _NSConcreteStackBlock;
    v145[1] = 3221225472;
    v145[2] = sub_10003E2C8;
    v145[3] = &unk_10072F2E0;
    v145[4] = self;
    id v146 = v60;
    id v16 = v16;
    id v147 = v16;
    id v148 = v15;
    id v62 = v60;
    [(PDAccountManager *)v61 eventWithIdentifier:v62 completion:v145];

LABEL_100:
  }
LABEL_101:
  uint64_t v101 = [v16 associatedReceiptUniqueID];
  if (v101)
  {
    v102 = (void *)v101;
    v103 = [v16 receiptProviderURL];

    if (v103)
    {
      __int16 v104 = v16;
      if (v17 && [v17 transactionStatus] != (id)1)
      {
        id v105 = v17;
        BOOL v106 = [v104 transactionStatus] == (id)1;
      }
      else
      {
        id v105 = v17;
        BOOL v106 = 0;
      }
      CFStringRef v107 = self->_databaseManager;
      v108 = [v104 associatedReceiptUniqueID];
      v109 = [(PDDatabaseManager *)v107 transactionReceiptWithUniqueID:v108];

      if (v109) {
        int v110 = v106;
      }
      else {
        int v110 = 1;
      }
      v111 = PKLogFacilityTypeGetObject();
      BOOL v112 = os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT);
      if ((v139 & 1) != 0 || !v110)
      {
        if (v112)
        {
          uint64_t v114 = [v104 serviceIdentifier];
          v115 = (void *)v114;
          CFStringRef v116 = @"NO";
          if (v139) {
            CFStringRef v117 = @"YES";
          }
          else {
            CFStringRef v117 = @"NO";
          }
          *(_DWORD *)buf = 138413058;
          uint64_t v163 = v114;
          if (v109) {
            CFStringRef v118 = @"YES";
          }
          else {
            CFStringRef v118 = @"NO";
          }
          uint64_t v165 = (uint64_t)v117;
          __int16 v164 = 2112;
          __int16 v166 = 2112;
          if (v106) {
            CFStringRef v116 = @"YES";
          }
          CFStringRef v167 = v118;
          __int16 v168 = 2112;
          CFStringRef v169 = v116;
          _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "Not downloading receipt for transaction %@, isInitialDownload: %@, existingReceipt: %@, transactionCleared: %@", buf, 0x2Au);
        }
      }
      else
      {
        if (v112)
        {
          v113 = [v104 serviceIdentifier];
          *(_DWORD *)buf = 138412290;
          uint64_t v163 = (uint64_t)v113;
          _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "Downloading receipt for transaction with identifier %@", buf, 0xCu);
        }
        [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator downloadReceiptForTransaction:v104];
      }
      id v17 = v105;

      id v16 = v104;
    }
  }
  sub_10003E8F4((uint64_t)self, v15, v16);
  if (!v17)
  {
    v119 = [v16 transactionDate];
    if (v119)
    {
      uint64_t v120 = [(PDDatabaseManager *)self->_databaseManager paymentApplicationForTransactionSourceIdentifier:v15];
      id v138 = v15;
      id v136 = v16;
      v140 = (void *)v120;
      if (v120)
      {
        uint64_t v161 = v120;
        v121 = +[NSArray arrayWithObjects:&v161 count:1];
      }
      else
      {
        v122 = [(PDDatabaseManager *)self->_databaseManager paymentApplicationsForPassUniqueIdentifier:v22];
        v121 = [v122 allObjects];
      }
      long long v143 = 0u;
      long long v144 = 0u;
      long long v141 = 0u;
      long long v142 = 0u;
      id v123 = v121;
      id v124 = [v123 countByEnumeratingWithState:&v141 objects:v160 count:16];
      if (v124)
      {
        id v125 = v124;
        uint64_t v126 = *(void *)v142;
        do
        {
          for (uint64_t i = 0; i != v125; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v142 != v126) {
              objc_enumerationMutation(v123);
            }
            v128 = *(void **)(*((void *)&v141 + 1) + 8 * i);
            id v129 = objc_alloc((Class)PKPaymentApplicationUsageSummary);
            v130 = [v128 applicationIdentifier];
            id v131 = [v129 initWithPassUniqueIdentifier:v22 paymentApplicationIdentifier:v130 lastUsedTransaction:v119];

            [(PDDatabaseManager *)self->_databaseManager insertPaymentApplicationUsageSummary:v131];
          }
          id v125 = [v123 countByEnumeratingWithState:&v141 objects:v160 count:16];
        }
        while (v125);
      }

      id v17 = 0;
      id v15 = v138;
      id v16 = v136;
    }
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didRecomputeCategoryVisualizationMagnitudes:(id)a4 withStyle:(int64_t)a5
{
  id v7 = a3;
  id v8 = sub_10003DF68((uint64_t)self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_10003EC50;
  v10[3] = &unk_10072F308;
  id v11 = v7;
  int64_t v12 = a5;
  id v9 = v7;
  [v8 enumerateObjectsUsingBlock:v10];
}

- (void)didAddCredentialInvitation:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003DF68((uint64_t)self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003ED08;
  v7[3] = &unk_10072F330;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

- (void)appletSubcredentialManager:(id)a3 didUpdateCredential:(id)a4 onPassWithIdentifier:(id)a5 oldShares:(id)a6
{
  id v11 = a6;
  id v8 = a5;
  [(PDServer *)self sharesDidUpdateWithPaymentPassWithUniqueIdentifier:v8];
  id v9 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v8];

  id v10 = [v9 secureElementPass];

  if (v10)
  {
    [(PDPendingProvisioningManager *)self->_pendingProvisioningManager passAddedOrUpdated:v10];
    if (v11) {
      [(PDSharingManager *)self->_sharingManager passUpdated:v10 oldShares:v11];
    }
  }
}

- (void)appletSubcredentialManager:(id)a3 didUpdateRangingSuspensionReasons:(unint64_t)a4 forCredential:(id)a5 forPaymentApplication:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = sub_10003DF68((uint64_t)self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003EEAC;
  v14[3] = &unk_10072F358;
  id v15 = v9;
  id v16 = v10;
  unint64_t v17 = a4;
  id v12 = v10;
  id v13 = v9;
  [v11 enumerateObjectsUsingBlock:v14];
}

- (void)appletSubcredentialManager:(id)a3 didTerminateProvisioningForCredential:(id)a4
{
  sharingManager = self->_sharingManager;
  objc_msgSend(a4, "identifier", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(PDSharingManager *)sharingManager didReceiveActivationCodeFailureForCredentialIdentifier:v5 attemptsRemaining:0 completion:&stru_10072F378];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableDailyCashNotifications:(BOOL)a4
{
  accountManager = self->_accountManager;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003EF9C;
  v5[3] = &unk_10072F200;
  v5[4] = self;
  [(PDAccountManager *)accountManager defaultAccountForFeature:2 completion:v5];
}

- (void)transactionSourceIdentifier:(id)a3 willRemoveTransaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 associatedReceiptUniqueID];
  if (v8)
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v7 serviceIdentifier];
      int v11 = 138412290;
      id v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Deleting receipt for transaction %@ since transaction is being removed from the database", (uint8_t *)&v11, 0xCu);
    }
    [(PDTransactionReceiptFileManager *)self->_transactionReceiptFileManager deleteTransactionReceiptWithUniqueID:v8];
  }
  [(PDTransactionNotificationController *)self->_transactionNotificationController paymentTransactionRemoved:v7 transactionSourceIdentifier:v6];
}

- (void)willRemoveTransactionsWithSourceIdentifierMapping:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003F2FC;
  v3[3] = &unk_10072F3A0;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_10003F05C((uint64_t)self, v7, v6);
  id v8 = sub_10003DF68((uint64_t)self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_10003F500;
  v11[3] = &unk_10072F228;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enumerateObjectsUsingBlock:v11];

  sub_10003F50C((id *)&self->super.isa, v10, v9);
}

- (void)didRemoveTransactionsWithSourceIdentifierMapping:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003DF68((uint64_t)self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003F75C;
  v8[3] = &unk_10072F330;
  id v9 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v8];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003F768;
  v7[3] = &unk_10072F3A0;
  void v7[4] = self;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10003DF68((uint64_t)self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_10003F94C;
  v11[3] = &unk_10072F228;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enumerateObjectsUsingBlock:v11];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalancesFrom:(id)a4 toBalances:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = sub_10003DF68((uint64_t)self);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10003FBA4;
  v29[3] = &unk_10072F228;
  id v12 = v8;
  id v30 = v12;
  id v13 = v10;
  id v31 = v13;
  [v11 enumerateObjectsUsingBlock:v29];
  if (v9)
  {
    id v23 = v13;
    char v24 = v11;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v14 = v13;
    id v15 = [v14 countByEnumeratingWithState:&v25 objects:v32 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          BOOL v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          unsigned int v20 = objc_msgSend(v19, "identifiers", v23, v24, (void)v25);
          unsigned int v21 = [v9 objectForKeyedSubscript:v20];

          if (v21) {
            sub_10003FC20((uint64_t)self, v12, v21, v19);
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v25 objects:v32 count:16];
      }
      while (v16);
    }

    id v13 = v23;
    int v11 = v24;
  }
  if (v12)
  {
    sub_1003D911C((uint64_t)self->_balanceManager, v12);
    [(PDPassDynamicStateManager *)self->_dynamicStateManager setDidUpdateDynamicStateForPassUniqueID:v12];
    id v22 = +[NSDistributedNotificationCenter defaultCenter];
    [v22 postNotificationName:PKDistributedNotificationBalanceUpdateReceivedForPass object:v12 userInfo:0];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateToPlans:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10003DF68((uint64_t)self);
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_10003FE2C;
  id v15 = &unk_10072F228;
  id v9 = v6;
  id v16 = v9;
  id v10 = v7;
  id v17 = v10;
  [v8 enumerateObjectsUsingBlock:&v12];

  if (v9)
  {
    int v11 = +[NSDistributedNotificationCenter defaultCenter];
    [v11 postNotificationName:PKDistributedNotificationPlanUpdateReceivedForPass object:v9 userInfo:0];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalanceWithIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = sub_10003DF68((uint64_t)self);
  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  BOOL v19 = sub_10003FFE4;
  unsigned int v20 = &unk_10072F3C8;
  id v12 = v8;
  id v21 = v12;
  id v13 = v9;
  id v22 = v13;
  id v14 = v10;
  id v23 = v14;
  [v11 enumerateObjectsUsingBlock:&v17];

  if (v12)
  {
    id v15 = +[NSDistributedNotificationCenter defaultCenter];
    v24[0] = PKDistributedNotificationBalanceReminderUpdateBalanceIdentifierKey;
    v24[1] = PKDistributedNotificationBalanceReminderUpdatePassUniqueIDKey;
    v25[0] = v14;
    v25[1] = v12;
    id v16 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    [v15 postNotificationName:PKDistributedNotificationBalanceReminderUpdateReceived object:0 userInfo:v16];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didResolvePendingTransitTransactionAmountsWithTransaction:(id)a4 paymentApplication:(id)a5 balance:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = [[PDPassTransitTransactionUserNotification alloc] initWithPaymentTransaction:v13 forPassUniqueIdentifier:v10 paymentApplication:v12 balance:v11];

  id v15 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Inserting PDPassTransitTransactionUserNotification for pass with unique identifier: %@, having resolved pending transit transaction amounts", (uint8_t *)&v16, 0xCu);
  }

  [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v14];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableTransactionService:(BOOL)a4
{
  id v6 = a3;
  id v7 = sub_10003DF68((uint64_t)self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100040A28;
  v9[3] = &unk_10072F418;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:v9];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableMessageService:(BOOL)a4
{
  id v6 = a3;
  id v7 = sub_10003DF68((uint64_t)self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100040AF4;
  v9[3] = &unk_10072F418;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:v9];
}

- (void)passWithUniqueIdentifier:(id)a3 didReceiveValueAddedServiceTransaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10003DF68((uint64_t)self);
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_100040C90;
  uint64_t v18 = &unk_10072F228;
  id v9 = v6;
  id v19 = v9;
  id v10 = v7;
  id v20 = v10;
  [v8 enumerateObjectsUsingBlock:&v15];

  BOOL v11 = objc_msgSend(v10, "identifier", v15, v16, v17, v18);

  if (v11)
  {
    id v12 = +[NSDistributedNotificationCenter defaultCenter];
    id v13 = +[NSMutableDictionary dictionary];
    id v14 = [v10 identifier];
    [v13 setObject:v14 forKey:PKDistributedNotificationTransactionIdentifierKey];

    if (v9) {
      [v13 setObject:v9 forKey:PKDistributedNotificationTransactionPassUniqueIDKey];
    }
    [v12 postNotificationName:PKDistributedNotificationValueAddedServiceTransactionReceived object:0 userInfo:v13];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateFromTransitProperties:(id)a4 toTransitProperties:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = sub_10003DF68((uint64_t)self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100040E48;
  v18[3] = &unk_10072F228;
  id v10 = v7;
  id v19 = v10;
  id v11 = v8;
  id v20 = v11;
  [v9 enumerateObjectsUsingBlock:v18];

  if (v10)
  {
    id v12 = +[NSDistributedNotificationCenter defaultCenter];
    [v12 postNotificationName:PKDistributedNotificationTransitPropertiesUpdatedForPass object:v10 userInfo:0];
  }
  [(PDTransactionNotificationController *)self->_transactionNotificationController transitPropertiesUpdated:v11 forPassUniqueIdentifier:v10];
  id v13 = [v11 enrouteTransitTypes];
  id v14 = [v13 lastObject];
  id v15 = [v14 integerValue];

  userNotificationManager = self->_userNotificationManager;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100040E54;
  v17[3] = &unk_10072F440;
  v17[4] = self;
  v17[5] = v15;
  [(PDUserNotificationManager *)userNotificationManager userNotificationsForPassUniqueIdentifier:v10 ofType:6 completion:v17];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateDefaultPaymentApplication:(id)a4
{
  id v4 = a3;
  id v5 = +[NSDistributedNotificationCenter defaultCenter];
  [v5 postNotificationName:PKDistributedNotificationDefaultPaymentApplicationChangedForPass object:v4 userInfo:0];
}

- (void)passUniqueIdentifiersMovedToExpired:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v10 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v9];
        if ([v10 supportsLifecycleUpdates]) {
          [(PDWebServicesCoordinator *)self->_webServicesCoordinator sendPassLifecycleEventForUniqueIdentifier:v9 state:1];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)removePassesOfType:(unint64_t)a3 withDiagnosticReason:(id)a4
{
  id v6 = a4;
  if (a3 == 1)
  {
    uint64_t v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PDServer: removing all secure element passes...", buf, 2u);
    }
    uint64_t v9 = 5;
    goto LABEL_13;
  }
  if (a3)
  {
    if (a3 != -1) {
      goto LABEL_38;
    }
    uint64_t v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v8 = "PDServer: removing all passes...";
LABEL_11:
      uint64_t v9 = 2;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v8 = "PDServer: removing all barcode passes...";
      goto LABEL_11;
    }
  }
  uint64_t v9 = 2;
LABEL_13:

  int v10 = atomic_load(&self->_initializationState);
  if (v10 == 1)
  {
    if (a3 + 1 >= 2)
    {
      if (a3 == 1) {
        sub_1000415B4((uint64_t)self, 1, v6, 0, v9);
      }
    }
    else
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v12 = [(PDDatabaseManager *)self->_databaseManager passUniqueIDsOfType:0];
      id v13 = [v12 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v29 != v15) {
              objc_enumerationMutation(v12);
            }
            [(PDCardFileManager *)self->_cardFileManager deleteCardWithUniqueID:*(void *)(*((void *)&v28 + 1) + 8 * i) forReason:v9 withDiagnosticReason:v6];
          }
          id v14 = [v12 countByEnumeratingWithState:&v28 objects:v34 count:16];
        }
        while (v14);
      }

      if (a3 == 1 || a3 == -1)
      {
        sub_1000415B4((uint64_t)self, 1, v6, 0, v9);
        if (a3 == -1)
        {
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          uint64_t v18 = [(PDDatabaseManager *)self->_databaseManager passUniqueIDs];
          id v19 = [v18 countByEnumeratingWithState:&v24 objects:v33 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v25;
            do
            {
              for (j = 0; j != v20; j = (char *)j + 1)
              {
                if (*(void *)v25 != v21) {
                  objc_enumerationMutation(v18);
                }
                [(PDCardFileManager *)self->_cardFileManager deleteCardWithUniqueID:*(void *)(*((void *)&v24 + 1) + 8 * (void)j) forReason:v9 withDiagnosticReason:v6];
              }
              id v20 = [v18 countByEnumeratingWithState:&v24 objects:v33 count:16];
            }
            while (v20);
          }
        }
      }
    }
  }
  else
  {
    id v23 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "PDServer: passd is not active - ignoring pass removal request.", buf, 2u);
    }
  }
LABEL_38:
}

- (void)recoverPassWithUniqueID:(id)a3
{
  id v11 = a3;
  id v5 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v11];
  if (v5)
  {
    id v6 = [(PDDatabaseManager *)self->_databaseManager passAnnotationsForPassUniqueIdentifier:v11];
    uint64_t v7 = v6;
    if (v6 && [v6 sortingState] == (id)1)
    {
      [(PDDatabaseManager *)self->_databaseManager updatePassAnnotationsForPassWithUniqueIdentifier:v11 withSortingState:2];
      dynamicStateManager = self->_dynamicStateManager;
      uint64_t v9 = [v5 uniqueID];
      int v10 = [(PDPassDynamicStateManager *)dynamicStateManager passDynamicStateForUniqueIdentifier:v9];

      sub_100041A78((uint64_t)self, v5, v10);
      if ([v5 supportsLifecycleUpdates]) {
        [(PDWebServicesCoordinator *)self->_webServicesCoordinator sendPassLifecycleEventForUniqueIdentifier:v11 state:0];
      }
    }
  }
}

- (void)noteACAccountChanged:(id)a3 handler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  switch((unint64_t)[v6 operation])
  {
    case 0uLL:
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "passd was asked to respond to account change that is unsupported.", buf, 2u);
      }

      if (v7) {
        v7[2](v7);
      }
      break;
    case 1uLL:
      id v14 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "passd was asked to respond to account addition.", buf, 2u);
      }

      uint64_t v15 = PDDefaultQueue();
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100042004;
      v22[3] = &unk_10072E9D8;
      v22[4] = self;
      id v23 = v6;
      long long v24 = v7;
      dispatch_async(v15, v22);

      id v11 = v23;
      goto LABEL_15;
    case 2uLL:
      uint64_t v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "passd was asked to respond to account update.", buf, 2u);
      }

      int v10 = PDDefaultQueue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000420A4;
      block[3] = &unk_10072E9D8;
      void block[4] = self;
      id v20 = v6;
      uint64_t v21 = v7;
      dispatch_async(v10, block);

      id v11 = v20;
      goto LABEL_15;
    case 3uLL:
      long long v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "passd was asked to respond to account deletetion.", buf, 2u);
      }

      id v13 = PDDefaultQueue();
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100042144;
      v16[3] = &unk_10072E9D8;
      v16[4] = self;
      id v17 = v6;
      uint64_t v18 = v7;
      dispatch_async(v13, v16);

      id v11 = v17;
LABEL_15:

      break;
    default:
      break;
  }
}

- (void)primaryAppleAccountWasAdded:(id)a3
{
}

- (void)primaryAppleAccountWasUpdated:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v6 = (void (**)(void))a4;
  PKDisableCloudKitEnvironmentChangeHandling();
  if ([v7 didEnablementOfUbiquityDataclassChange]) {
    [(PDCardFileManager *)self->_cardFileManager restartUbiquity];
  }
  if ([v7 didEnablementOfWalletDataclassChange])
  {
    [(PDCloudStoreNotificationCoordinator *)self->_cloudStoreCoordinator noteCloudSyncPassesSwitchChanged];
    +[PKWalletVisibility updateWalletVisibility];
  }
  if ([v7 didAccountManagedStateChange]) {
    +[PKWalletVisibility updateWalletVisibility];
  }
  [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator noteAccountChanged];
  if (v6) {
    v6[2](v6);
  }
}

- (void)primaryAppleAccountWasDeleted:(id)a3
{
}

- (void)prepareForBackupRestoreWithRequiredFileURLs:(id)a3 destinationFileHandles:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(void))a5;
  id v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Starting backup of preferences file", buf, 2u);
  }

  PDWritePassdPreferencesToSafeHaven();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Finished backup of preferences file", buf, 2u);
  }

  databaseManager = self->_databaseManager;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100042C8C;
  v15[3] = &unk_10072E198;
  id v16 = v8;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  [(PDDatabaseManager *)databaseManager accessDatabaseUsingBlock:v15];
  if (v10) {
    v10[2](v10);
  }
}

- (void)nukeStuff
{
  [(PDWebServicesCoordinator *)self->_webServicesCoordinator nukeTasks];
  [(PDNotificationServiceCoordinator *)self->_notificationServicesCoordinator nukeTasks];
  barcodeCredentialManager = self->_barcodeCredentialManager;
  [(PDBarcodeCredentialManager *)barcodeCredentialManager nukeTasks];
}

- (void)dataMigrationRequestedWithPassLibrary:(id)a3 didRestoreFromBackup:(BOOL)a4
{
  double Current = CFAbsoluteTimeGetCurrent();
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100514C28();
  }

  atomic_store(1u, &self->_migrationState);
  id v8 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000433A8;
  block[3] = &unk_10072E120;
  void block[4] = self;
  BOOL v17 = a4;
  *(double *)&void block[5] = Current;
  dispatch_sync(v8, block);

  if (atomic_exchange((atomic_uchar *volatile)&self->_migrationState, 0) == 2)
  {
    id v9 = (void *)PDOSTransactionCreate("PDServer");
    int v10 = PDDefaultQueue();
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100044774;
    v13[3] = &unk_10072E198;
    id v14 = v9;
    uint64_t v15 = self;
    id v11 = v9;
    dispatch_async(v10, v13);
  }
  [(PDPassSignalManager *)self->_passSignalManager donateAllPassSignalsIfNeccessaryWithCompletion:&stru_10072F5A0];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime v12 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134217984;
    double v19 = v12 - Current;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Migration finished in %0.3fs.", buf, 0xCu);
  }
}

- (void)introduceDatabaseIntegrityProblem
{
  if ([(PDDatabaseManager *)self->_databaseManager numberOfRealPasses] >= 4)
  {
    do
    {
      if (!arc4random_uniform(2u)) {
        break;
      }
      [(PDDatabaseManager *)self->_databaseManager introduceMissingUniqueID];
    }
    while ([(PDDatabaseManager *)self->_databaseManager numberOfRealPasses] > 3);
  }
  while (arc4random_uniform(2u))
    [(PDDatabaseManager *)self->_databaseManager introduceExtraneousUniqueID];
  while (arc4random_uniform(2u))
    [(PDDatabaseManager *)self->_databaseManager introduceDuplicateUniqueID];
  exit(0);
}

- (void)issueSecureElementPassStateChangeNotificationForNewPasses:(id)a3
{
  id v4 = objc_msgSend(a3, "pk_objectsPassingTest:", &stru_10072F608);
  id v5 = [v4 count];
  if (v5)
  {
    if (v5 == (id)1)
    {
      id v6 = [v4 objectAtIndexedSubscript:0];
      paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100045138;
      v14[3] = &unk_10072F658;
      void v14[4] = self;
      id v15 = v6;
      id v8 = v6;
      [(PDPaymentWebServiceCoordinator *)paymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:v14];
    }
    else
    {
      expressPassManager = self->_expressPassManager;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      void v10[2] = sub_100045284;
      v10[3] = &unk_10072F6C0;
      CFAbsoluteTime v12 = self;
      id v13 = v5;
      id v11 = v4;
      sub_10018E790((uint64_t)expressPassManager, v10);
      id v8 = v11;
    }
  }
}

- (void)rescheduleCommutePlanRenewalRemindersForPaymentPassWithUniqueIdentifier:(id)a3
{
  id v4 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:a3];
  id v5 = [v4 paymentPass];

  sub_10003A660((uint64_t)self, v5);
}

- (void)checkForTransitNotification
{
}

- (void)postUpgradedPassNotificationForMarket:(id)a3 pass:(id)a4
{
}

- (void)postUpgradesAvailableNotificationForMarket:(id)a3 pass:(id)a4
{
}

- (void)didRequestToRegister:(id)a3 fromDestination:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSString stringWithFormat:@"request to register device over IDS"];
  deviceRegistrationServiceCoordinator = self->_deviceRegistrationServiceCoordinator;
  id v10 = [v7 registerBroker];
  id v11 = [v7 registerPeerPayment];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100045608;
  v13[3] = &unk_10072E440;
  id v14 = v6;
  id v15 = self;
  id v12 = v6;
  [(PDDeviceRegistrationServiceCoordinator *)deviceRegistrationServiceCoordinator performDeviceRegistrationForReason:v8 brokerURL:0 action:1 forceApplePayRegister:v10 forcePeerPaymentRegister:v11 completion:v13];
}

- (void)handlerDetailsForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Getting current user and handle user info for configuration %@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v9 = [v6 handle];
  id v10 = (void *)v9;
  if (v7)
  {
    if (v6 && v9)
    {
      id v11 = [v6 sharingGroup];
      if (v11 == (id)1)
      {
        char v12 = 0;
        goto LABEL_12;
      }
      if (v11 == (id)2)
      {
        char v12 = 1;
LABEL_12:
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v41 = 0x3032000000;
        v42 = sub_10002073C;
        BOOL v43 = sub_100020E90;
        id v44 = 0;
        v38[0] = 0;
        v38[1] = v38;
        v38[2] = 0x3032000000;
        v38[3] = sub_10002073C;
        v38[4] = sub_100020E90;
        id v39 = 0;
        v36[0] = 0;
        v36[1] = v36;
        v36[2] = 0x3032000000;
        v36[3] = sub_10002073C;
        v36[4] = sub_100020E90;
        id v37 = 0;
        v34[0] = 0;
        v34[1] = v34;
        v34[2] = 0x3032000000;
        v34[3] = sub_10002073C;
        v34[4] = sub_100020E90;
        id v35 = 0;
        id v13 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_100045CB4;
        v30[3] = &unk_10072E638;
        v30[4] = self;
        id v14 = v10;
        id v31 = v14;
        v32 = v38;
        p_long long buf = &buf;
        [v13 addOperation:v30];

        if (v12)
        {
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_100045F9C;
          v23[3] = &unk_10072F738;
          long long v27 = v38;
          id v24 = v6;
          long long v25 = self;
          id v26 = v14;
          long long v28 = v34;
          long long v29 = v36;
          [v13 addOperation:v23];
        }
        id v15 = +[NSNull null];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10004623C;
        v17[3] = &unk_10072F760;
        double v19 = &buf;
        id v20 = v36;
        uint64_t v21 = v38;
        id v22 = v34;
        id v18 = v7;
        id v16 = [v13 evaluateWithInput:v15 completion:v17];

        _Block_object_dispose(v34, 8);
        _Block_object_dispose(v36, 8);

        _Block_object_dispose(v38, 8);
        _Block_object_dispose(&buf, 8);

        goto LABEL_16;
      }
    }
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
LABEL_16:
}

- (id)paymentApplicationForTransactionSource:(id)a3
{
  return [(PDDatabaseManager *)self->_databaseManager paymentApplicationForTransactionSourceIdentifier:a3];
}

- (id)passUniqueIdentifierforTransactionSourceIdentifier:(id)a3
{
  return [(PDDatabaseManager *)self->_databaseManager passUniqueIdentifierForTransactionSourceIdentifier:a3];
}

- (id)paymentApplicationForDPANIdentifier:(id)a3
{
  return [(PDDatabaseManager *)self->_databaseManager paymentApplicationWithDPANIdentifier:a3];
}

- (id)paymentTransactionForIdentifier:(id)a3
{
  return [(PDDatabaseManager *)self->_databaseManager paymentTransactionForIdentifier:a3];
}

- (void)updateRequiresMerchantReprocessing:(BOOL)a3 forTransactionWithIdentifier:(id)a4
{
}

- (BOOL)shouldRecomputeRelevantPassesWithSearchMode:(int64_t)a3
{
  unprotectedManagers = self->_unprotectedManagers;
  if (unprotectedManagers) {
    unprotectedManagers = (PDServerUnprotectedManagers *)unprotectedManagers->_fieldDetectorManager;
  }
  id v5 = unprotectedManagers;
  id v6 = sub_1001A57C8(v5);
  if (v6)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    id v8 = self->_unprotectedManagers;
    if (v8) {
      remoteInterfacePresenter = (os_unfair_lock_s *)v8->_remoteInterfacePresenter;
    }
    else {
      remoteInterfacePresenter = 0;
    }
    int v7 = sub_1002064CC(remoteInterfacePresenter, 0) ^ 1;
  }

  return v7;
}

- (void)relevantPassProviderDidChangeCurrentRelevantPasses:(id)a3
{
  id v4 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046494;
  block[3] = &unk_10072E1E8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)inAppPaymentService:(id)a3 registerPaymentListenerEndpoint:(id)a4 forHostIdentifier:(id)a5 processIdentifier:(int)a6 completion:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  paymentHostEndpointRegistry = self->_paymentHostEndpointRegistry;
  if (!v13)
  {
    id v19 = [(PKPaymentHostEndpointRegistry *)paymentHostEndpointRegistry takeListenerEndpointForHostIdentifier:v14];
    if (!v15) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  [(PKPaymentHostEndpointRegistry *)paymentHostEndpointRegistry addListenerEndpoint:v13 forHostIdentifier:v14 processIdentifier:v8];
  BOOL v17 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v23 = v13;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "registerPaymentListenerEndpoint saved listenerEndpoint: %@", buf, 0xCu);
  }

  if (v15)
  {
LABEL_5:
    id v18 = PDDefaultQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000466E0;
    block[3] = &unk_10072F788;
    id v21 = v15;
    dispatch_async(v18, block);
  }
LABEL_6:
}

- (void)inAppPaymentService:(id)a3 retrievePaymentListenerEndpointForHostIdentifier:(id)a4 completion:(id)a5
{
  id v7 = a5;
  uint64_t v8 = [(PKPaymentHostEndpointRegistry *)self->_paymentHostEndpointRegistry takeListenerEndpointForHostIdentifier:a4];
  uint64_t v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "takeListenerEndpointForHostIdentifier returns listenerEndpoint: %@", buf, 0xCu);
  }

  if (v7)
  {
    id v10 = PDDefaultQueue();
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    void v11[2] = sub_100046850;
    v11[3] = &unk_10072E598;
    id v13 = v7;
    id v12 = v8;
    dispatch_async(v10, v11);
  }
}

- (void)handleContinuityPaymentBulletinActionWithIdentifier:(id)a3 manager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received continuity notification", v12, 2u);
  }

  uint64_t v9 = [(PKIDSManager *)self->_idsManager requestForIdentifier:v6];
  if (v6)
  {
    unprotectedManagers = self->_unprotectedManagers;
    if (unprotectedManagers) {
      uint64_t remoteInterfacePresenter = (uint64_t)unprotectedManagers->_remoteInterfacePresenter;
    }
    else {
      uint64_t remoteInterfacePresenter = 0;
    }
    sub_10020A624(remoteInterfacePresenter, v9, &stru_10072F7A8);
  }
}

- (id)createCurrentNotificationRegistrationState
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  id v4 = objc_alloc_init((Class)NSMutableSet);
  if (!atomic_load(&self->_fileProtectionState)) {
    [v3 addObject:PDDarwinNotificationMobileKeyBagFirstUnlock];
  }
  if (!atomic_load(&self->_iCloudRestoreState)) {
    [v3 addObject:off_100803F88()];
  }
  if (![v3 count])
  {
    if (PKSecureElementIsAvailable())
    {
      [v3 addObject:PDDarwinNotificationEventPasswordChanged];
      [v3 addObject:PKDarwinNotificationEventDeveloperImageMounted];
      [v3 addObject:PKDarwinNotificationEventDidEnterField];
      if (+[PKSecureElement isInFailForward]) {
        [v3 addObject:off_100803F90()];
      }
      if ([(PDDatabaseManager *)self->_databaseManager passExistsWithPassType:1])
      {
        [v3 addObject:PKDarwinNotificationEventLostModeStateChanged];
        [v3 addObject:PDDarwinNotificationEventBluetoothPowerChanged];
      }
    }
    [v3 addObject:PDDarwinNotificationEventAppProtectionChanged];
  }
  if ([v3 count] || objc_msgSend(v4, "count"))
  {
    id v7 = objc_alloc_init(PDNotificationStreamRegistrationState);
    [(PDNotificationStreamRegistrationState *)v7 setNotificationNames:v3 forStream:0];
    [(PDNotificationStreamRegistrationState *)v7 setNotificationNames:v4 forStream:1];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)paymentTransactionUpdated:(id)a3 forTransactionSourceIdentifier:(id)a4
{
  id v8 = a4;
  id v6 = -[PDDatabaseManager insertOrUpdatePaymentTransaction:withTransactionSourceIdentifier:insertionMode:performTruncation:insertedTransaction:](self->_databaseManager, "insertOrUpdatePaymentTransaction:withTransactionSourceIdentifier:insertionMode:performTruncation:insertedTransaction:", a3);
  unsigned __int8 v7 = [v6 updateReasonIsInitialDownload];
  if ([v6 fullyProcessed] && (v7 & 1) == 0) {
    [(PDAccountNotificationController *)self->_accountNotificationController paymentTransactionUpdated:v6 forTransactionSourceIdentifier:v8];
  }
  if ((v7 & 1) == 0) {
    [(PDServer *)self _updateQuickActions];
  }
}

- (void)paymentTransactionProcessorDidActivate:(id)a3
{
  p_transactionProcesssorActiveLock = &self->_transactionProcesssorActiveLock;
  os_unfair_lock_lock(&self->_transactionProcesssorActiveLock);
  if (!self->_transactionProcesssorOSTransaction)
  {
    id v5 = (OS_os_transaction *)PDOSTransactionCreate("PDServer.transaction_processor.active");
    transactionProcesssorOSTransaction = self->_transactionProcesssorOSTransaction;
    self->_transactionProcesssorOSTransaction = v5;
  }
  os_unfair_lock_unlock(p_transactionProcesssorActiveLock);
}

- (void)paymentTransactionProcessorDidDeactivate:(id)a3
{
  p_transactionProcesssorActiveLock = &self->_transactionProcesssorActiveLock;
  os_unfair_lock_lock(&self->_transactionProcesssorActiveLock);
  transactionProcesssorOSTransaction = self->_transactionProcesssorOSTransaction;
  self->_transactionProcesssorOSTransaction = 0;

  os_unfair_lock_unlock(p_transactionProcesssorActiveLock);
}

- (void)placemarkFound:(id)a3 forTransaction:(id)a4
{
  spotlightIndexer = self->_spotlightIndexer;
  if (spotlightIndexer) {
    [(PDSpotlightIndexer *)spotlightIndexer placemarkFound:a3 forTransaction:a4];
  }
}

- (id)paymentPassesForContinuityDiscovery:(id)a3
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received request for payment passes", v8, 2u);
  }

  id v5 = [(PDDatabaseManager *)self->_databaseManager passesOfType:1];
  id v6 = [v5 allObjects];

  return v6;
}

- (id)defaultPaymentPassForContinuityDiscovery:(id)a3
{
  databaseManager = self->_databaseManager;
  id v5 = PDDefaultPaymentPassUniqueIdentifier();
  uint64_t v6 = [(PDDatabaseManager *)databaseManager passWithUniqueIdentifier:v5];
  unsigned __int8 v7 = [(id)v6 paymentPass];

  id v8 = [v7 devicePrimaryInAppPaymentApplication];
  LOBYTE(v6) = [v8 supportsInAppPayment];

  if ((v6 & 1) == 0)
  {
    uint64_t v9 = self->_databaseManager;
    id v10 = +[PKPaymentRequest availableNetworks];
    id v11 = +[NSSet setWithArray:v10];
    id v12 = [(PDDatabaseManager *)v9 passesForInAppPaymentOnNetworks:v11 issuerCountryCodes:0 paymentApplicationStates:0 paymentRequestType:0 isMultiTokensRequest:0 webService:0];

    id v13 = +[NSSortDescriptor sortDescriptorWithKey:@"ingestedDate" ascending:1];
    id v19 = v13;
    id v14 = +[NSArray arrayWithObjects:&v19 count:1];
    id v15 = [v12 sortedArrayUsingDescriptors:v14];
    id v16 = +[NSSet setWithArray:v15];

    if ([v16 count])
    {
      uint64_t v17 = [v16 anyObject];
    }
    else
    {
      uint64_t v17 = 0;
    }

    unsigned __int8 v7 = (void *)v17;
  }
  return v7;
}

- (void)accountForPaymentPass:(id)a3 manager:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 hasAssociatedPeerPaymentAccount])
  {
    peerPaymentWebServiceCoordinator = self->_peerPaymentWebServiceCoordinator;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    void v10[2] = sub_100047368;
    v10[3] = &unk_10072F7F8;
    id v11 = v7;
    id v12 = v8;
    [(PDPeerPaymentWebServiceCoordinator *)peerPaymentWebServiceCoordinator accountWithPreventingServerFetch:0 completion:v10];
  }
  else
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

- (void)supportedPaymentSetupFeatures:(id)a3 completion:(id)a4
{
  id v9 = a3;
  uint64_t v6 = (void (**)(id, void))a4;
  if (v6)
  {
    paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
    if (paymentWebServiceCoordinator)
    {
      id v8 = [(PDPaymentWebServiceCoordinator *)paymentWebServiceCoordinator paymentSetupFeaturesCoordinator];
      [v8 staticPaymentSetupFeaturesForSourceApplicationID:PKPassdBundleIdentifier blockServerFetch:0 completion:v6];
    }
    else
    {
      v6[2](v6, 0);
    }
  }
}

- (BOOL)continuityDisabledByUser:(id)a3
{
  return _PKHandoffPaymentsDisabled(self, a2, a3);
}

- (BOOL)deviceAvailableForContinuityPayments:(id)a3
{
  id v4 = a3;
  unprotectedManagers = self->_unprotectedManagers;
  if (unprotectedManagers && (uint64_t v6 = unprotectedManagers->_remoteInterfacePresenter) != 0)
  {
    id v7 = v6;
    LOBYTE(v8) = sub_100208170((BOOL)v6, 3uLL, 0) || sub_100208170((BOOL)v7, 8uLL, 0);
  }
  else
  {
    id v7 = 0;
    unsigned int v8 = +[PKSecureElement isInFailForward] ^ 1;
  }

  return v8;
}

- (id)webServiceConfigurationForContinuityPayments:(id)a3
{
  id v3 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebServiceContext];
  id v4 = [v3 configuration];

  return v4;
}

- (CGImage)thumbnailImageForPassIdentifier:(id)a3 size:(CGSize)a4 manager:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = a5;
  id v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received request for thumbnail image for pass: %@", (uint8_t *)&v18, 0xCu);
  }

  id v12 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v9];
  if (v12)
  {
    id v13 = +[PKImageResizingConstraints constraintsWithAspectFillToSize:](PKImageResizingConstraints, "constraintsWithAspectFillToSize:", width, height);
    [v13 setOutputScale:1.0];
    id v14 = [v12 frontFaceImage];
    id v15 = [v14 resizedImageWithConstraints:v13];
    id v16 = CGImageRetain((CGImageRef)[v15 imageRef]);

    if (v16) {
      id v16 = CFAutorelease(v16);
    }
  }
  else
  {
    id v16 = 0;
  }

  return (CGImage *)v16;
}

- (void)didReceiveRemotePaymentRequest:(id)a3
{
  if (a3)
  {
    unprotectedManagers = self->_unprotectedManagers;
    if (unprotectedManagers) {
      uint64_t remoteInterfacePresenter = (uint64_t)unprotectedManagers->_remoteInterfacePresenter;
    }
    else {
      uint64_t remoteInterfacePresenter = 0;
    }
    sub_10020A624(remoteInterfacePresenter, a3, &stru_10072F818);
  }
}

- (void)didReceiveSetupRequest:(id)a3
{
  unprotectedManagers = self->_unprotectedManagers;
  if (unprotectedManagers) {
    uint64_t remoteInterfacePresenter = (uint64_t)unprotectedManagers->_remoteInterfacePresenter;
  }
  else {
    uint64_t remoteInterfacePresenter = 0;
  }
  sub_10020CC28(remoteInterfacePresenter, a3);
}

- (void)didReceivePromptForVirtualCard:(id)a3 showNotification:(BOOL)a4
{
}

- (void)markPassWithUniqueIdentifiersForDeletion:(id)a3
{
  id v4 = a3;
  id v5 = PDDefaultQueue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000478DC;
  v7[3] = &unk_10072E198;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)secureElementPairingDidChangeForReason:(unint64_t)a3
{
  id v5 = PDDefaultQueue();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100047A80;
  v6[3] = &unk_10072F840;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)expressPassManager:(id)a3 didUpdateExpressPassConfigurations:(id)a4
{
  id v5 = a4;
  id v6 = PDDefaultQueue();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100047B44;
  v8[3] = &unk_10072E198;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)expressPassManager:(id)a3 didFinishExpressTransactionWithState:(id)a4
{
  id v5 = a4;
  id v10 = [v5 passUniqueIdentifier];
  id v6 = [v5 applicationIdentifier];

  if (v10 && v6)
  {
    id v7 = objc_alloc((Class)PKPaymentApplicationUsageSummary);
    id v8 = +[NSDate now];
    id v9 = [v7 initWithPassUniqueIdentifier:v10 paymentApplicationIdentifier:v6 lastUsed:v8];

    [(PDDatabaseManager *)self->_databaseManager insertPaymentApplicationUsageSummary:v9];
  }
}

- (void)defaultPassManager:(id)a3 didUpdateDefaultPaymentPassWithUniqueIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = sub_10003DF68((uint64_t)self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100047D20;
  v8[3] = &unk_10072F330;
  id v9 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v8];

  [(PDTransitNotificationService *)self->_transitNotificationService updateRegistrationForTriggerEvents];
}

- (BOOL)defaultPassManagerCanUpdateDefaultPass:(id)a3
{
  id v4 = PKPendingProvisioningBackgroundProvisioningInBuddyTypes();
  LOBYTE(self) = ![(PDPendingProvisioningManager *)self->_pendingProvisioningManager hasPendingProvisioningsOfTypes:v4];

  return (char)self;
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = PKServiceBundleIdentifier;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v9) bundleIdentifier];
        unsigned int v11 = [v10 isEqualToString:v8];

        if (v11)
        {
          PKSetLastBackupPassbookWasDeleted();
          deviceRegistrationServiceCoordinator = self->_deviceRegistrationServiceCoordinator;
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          v13[2] = sub_100047F18;
          v13[3] = &unk_10072F888;
          void v13[4] = self;
          [(PDDeviceRegistrationServiceCoordinator *)deviceRegistrationServiceCoordinator performDeviceRegistrationForReason:@"passbook installed" brokerURL:0 action:0 forceApplePayRegister:0 forcePeerPaymentRegister:0 completion:v13];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    uint64_t v8 = PKServiceBundleIdentifier;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) bundleIdentifier];
        unsigned int v11 = [v10 isEqualToString:v8];

        if (v11) {
          sub_100046B50((id *)&self->super.isa);
        }
        id v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)defaultDiscoveryManager:(id)a3 sendDiscoveryArticleLayoutsUpdated:(id)a4
{
  id v5 = a4;
  id v6 = sub_100048314((uint64_t)self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100048394;
  v8[3] = &unk_10072F8D0;
  id v9 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v8];
}

- (void)defaultDiscoveryManager:(id)a3 completedCTAForItem:(id)a4
{
  id v5 = a4;
  id v6 = sub_100048314((uint64_t)self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004844C;
  v8[3] = &unk_10072F8D0;
  id v9 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v8];
}

- (void)defaultDiscoveryManager:(id)a3 dialogRequestsChangedForPlacement:(id)a4
{
  id v5 = a4;
  id v6 = sub_100048314((uint64_t)self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100048504;
  v8[3] = &unk_10072F8D0;
  id v9 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v8];
}

- (void)sendDiscoveryEngagementMessagesUpdatedToDefaultDiscoveryManager:(id)a3
{
  sub_100048314((uint64_t)self);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 enumerateObjectsUsingBlock:&stru_10072F910];
}

- (void)applePayCloudStoreContainer:(id)a3 didFinishTransactionFetchForPassUniqueID:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    [(PDServer *)self _updateQuickActions];
    id v6 = +[NSDistributedNotificationCenter defaultCenter];
    uint64_t v8 = PKDistributedNotificationTransactionPassUniqueIDKey;
    id v9 = v5;
    id v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    [v6 postNotificationName:PKDistributedNotificationTransactionsFetchCompleted object:0 userInfo:v7];
    [(PDDatabaseManager *)self->_databaseManager recomputeCategoryVisualizationMagnitudesForPassUniqueID:v5 withStyle:0];
    [(PDSpotlightIndexer *)self->_spotlightIndexer transactionFetchCompletedForPassUniqueID:v5];
  }
}

- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  sub_10003C6EC(self, v9, v8);
  [(PDSpotlightIndexer *)self->_spotlightIndexer accountManager:v10 didUpdateAccount:v9 oldAccount:v8];

  financeSyncManager = self->_financeSyncManager;
  [(PDFinanceSyncManager *)financeSyncManager setNeedsSync];
}

- (void)accountManager:(id)a3 didAddAccount:(id)a4
{
  id v7 = a4;
  id v6 = a3;
  sub_10003C6EC(self, v7, 0);
  [(PDSpotlightIndexer *)self->_spotlightIndexer accountManager:v6 didAddAccount:v7];

  [(PDFinanceSyncManager *)self->_financeSyncManager setNeedsSync];
  [(PDBankCredentialMigrator *)self->_bankCredentialMigrator accountAdded:v7];
}

- (void)accountManager:(id)a3 didRemoveAccount:(id)a4
{
  [(PDSpotlightIndexer *)self->_spotlightIndexer accountManager:a3 didRemoveAccount:a4];
  financeSyncManager = self->_financeSyncManager;
  [(PDFinanceSyncManager *)financeSyncManager setNeedsSync];
}

- (void)accountManager:(id)a3 didAddAccountEvent:(id)a4
{
}

- (void)accountManager:(id)a3 didUpdateAccountEvent:(id)a4
{
}

- (void)peerPaymentWebServiceCoordinator:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5
{
  [(PDSpotlightIndexer *)self->_spotlightIndexer peerPaymentAccountDidUpdate:a4];
  financeSyncManager = self->_financeSyncManager;
  [(PDFinanceSyncManager *)financeSyncManager setNeedsSync];
}

- (void)peerPaymentWebServiceCoordinatorDidDeleteAccount
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PDServer: executing peerPaymentWebServiceCoordinatorDidDeleteAccount", v4, 2u);
  }

  [(PDFinanceSyncManager *)self->_financeSyncManager setNeedsSync];
}

- (void)incrementMissingRemoteAssetsPersistentStoreItemDownloadRetriesCountWithUniqueID:(id)a3
{
}

- (void)insertOrReplaceMissingRemoteAssetsPersistentStoreItemWithUniqueID:(id)a3
{
}

- (unint64_t)missingRemoteAssetsPersistentStoreItemsCountWithMaximumDownloadRetriesCount:(unint64_t)a3
{
  return [(PDDatabaseManager *)self->_databaseManager missingRemoteAssetsPersistentStoreItemsCountWithMaximumDownloadRetriesCount:a3];
}

- (id)missingRemoteAssetsPersistentStoreItemsWithMaximumDownloadRetriesCount:(unint64_t)a3
{
  return [(PDDatabaseManager *)self->_databaseManager missingRemoteAssetsPersistentStoreItemsWithMaximumDownloadRetriesCount:a3];
}

- (void)removeMissingRemoteAssetsPersistentStoreItemWithUniqueID:(id)a3
{
}

- (void)sharesDidUpdateWithPaymentPassWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003DF68((uint64_t)self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000489A8;
  v9[3] = &unk_10072F330;
  id v6 = v4;
  id v10 = v6;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v6];
  if (v7) {
    sub_100039CA0((uint64_t)self, v7);
  }
  if (v6)
  {
    id v8 = +[NSDistributedNotificationCenter defaultCenter];
    [v8 postNotificationName:PKDistributedNotificationCredentialUpdateReceivedForPass object:v6 userInfo:0];
  }
}

- (void)displayTapToRadarAlertForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = [v6 reason];
  if (os_variant_has_internal_ui()) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (v7) {
      v7[2](v7, 0);
    }
  }
  else
  {
    id v10 = [(PDDatabaseManager *)self->_databaseManager tapToRadarPromptWithReason:v8];
    unsigned int v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v27 = v8;
      __int16 v28 = 2112;
      id v29 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Last tap to radar prompt for reason \"%@\": %@", buf, 0x16u);
    }

    long long v13 = [v10 lastPromptDate];
    long long v14 = +[NSDate date];
    long long v15 = v14;
    if (v13 && ([v14 timeIntervalSinceDate:v13], v16 <= 86400.0))
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        id v27 = v13;
        __int16 v28 = 2112;
        id v29 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not presenting tap to radar prompt since it was displayed less than 30 minutes ago, %@. %@", buf, 0x16u);
      }

      if (v7) {
        v7[2](v7, 0);
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v27 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Presenting tap to radar request alert: %@", buf, 0xCu);
      }

      [(PDDatabaseManager *)self->_databaseManager noteTapToRadarPromptedForReason:v8 lastPromptDate:v15];
      id v17 = objc_alloc_init((Class)NSMutableDictionary);
      uint64_t v18 = [v6 alertHeader];
      id v19 = (void *)v18;
      if (v18) {
        CFStringRef v20 = (const __CFString *)v18;
      }
      else {
        CFStringRef v20 = @"Wallet Problem Detected";
      }
      [v17 setObject:v20 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];

      id v21 = [v6 alertMessage];
      if (v21)
      {
        [v17 setObject:v21 forKeyedSubscript:kCFUserNotificationAlertMessageKey];
      }
      else
      {
        id v22 = +[NSString stringWithFormat:@"A problem has been detected with Wallet:\n\"%@\"", v8];
        [v17 setObject:v22 forKeyedSubscript:kCFUserNotificationAlertMessageKey];
      }
      [v17 setObject:@"File a radar" forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];
      [v17 setObject:@"Not now" forKeyedSubscript:kCFUserNotificationOtherButtonTitleKey];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100048DA4;
      v23[3] = &unk_10072F938;
      id v24 = v6;
      id v25 = v8;
      +[PKUserNotificationAgent presentNotificationWithParameters:v17 responseHandler:v23];
      if (v7) {
        v7[2](v7, 1);
      }
    }
  }
}

- (void)applicationMessageManager:(id)a3 didUpdateMessages:(id)a4
{
  id v5 = a4;
  id v6 = sub_10003DF68((uint64_t)self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004901C;
  v8[3] = &unk_10072F330;
  id v9 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v8];

  [(PDUserNotificationManager *)self->_userNotificationManager updateWalletBadgeCount];
}

- (void)passTileManager:(id)a3 didUpdateTiles:(id)a4 forPassUniqueID:(id)a5 forContext:(int64_t)a6
{
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = sub_10003DF68((uint64_t)self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100049104;
  v14[3] = &unk_10072F358;
  id v15 = v10;
  id v16 = v9;
  int64_t v17 = a6;
  id v12 = v9;
  id v13 = v10;
  [v11 enumerateObjectsUsingBlock:v14];
}

- (void)dynamicStateManager:(id)a3 dynamicStatesDidUpdate:(id)a4
{
  id v5 = a4;
  id v6 = PDDefaultQueue();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000491C4;
  v8[3] = &unk_10072E198;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)bindingStateChangedForPass:(id)a3
{
  id v4 = [a3 copy];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    sub_100039CA0((uint64_t)self, v4);
    id v5 = v6;
  }
  _objc_release_x1(v4, v5);
}

- (BOOL)resetApplePayWithType:(int64_t)a3 diagnosticReason:(id)a4
{
  if (self) {
    LOBYTE(self) = sub_1000415B4((uint64_t)self, a3, a4, 1, 5);
  }
  return (char)self;
}

- (void)_updateQuickActions
{
  id v39 = objc_alloc_init((Class)SBSApplicationShortcutService);
  id v3 = +[NSMutableArray array];
  id v4 = [(PDRelevantPassProvider *)self->_relevantPassProvider currentRelevantPassInfo];
  id v5 = [v4 firstObject];

  if (v5)
  {
    id v6 = [v4 firstObject];
    id v7 = [v6 objectForKeyedSubscript:PKPassLibraryRelevantInfoUniqueID];

    id v8 = PKLocalizedString(@"ORB_RELEVANT_PASS");
    id v9 = sub_10004A490((uint64_t)self, v7, v8);

    [v3 addObject:v9];
  }
  id v10 = PDDefaultPaymentPassUniqueIdentifier();
  if (v10)
  {
    unsigned int v11 = PKLocalizedString(@"ORB_DEFAULT_CARD");
    id v12 = sub_10004A490((uint64_t)self, v10, v11);

    [v3 addObject:v12];
  }
  id v13 = [(PDDatabaseManager *)self->_databaseManager passUniqueIdentifierForMostRecentVisibleTransaction];
  if (v13)
  {
    id v14 = objc_alloc_init((Class)SBSApplicationShortcutItem);
    id v15 = [objc_alloc((Class)SBSApplicationShortcutSystemIcon) initWithSystemImageName:@"checkmark.circle"];
    [v14 setIcon:v15];

    [v14 setType:PKQuickActionLastTransactionAction];
    id v16 = PKLocalizedString(@"ORB_LAST_TRANSACTION");
    [v14 setLocalizedTitle:v16];

    uint64_t v40 = PKQuickActionPassUniqueIDKKey;
    uint64_t v41 = v13;
    int64_t v17 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    [v14 setUserInfo:v17];

    [v3 addObject:v14];
  }
  double v38 = v4;
  uint64_t v18 = [(PDDatabaseManager *)self->_databaseManager peerPaymentAccount];
  databaseManager = self->_databaseManager;
  CFStringRef v20 = [v18 associatedPassUniqueID];
  id v21 = [(PDDatabaseManager *)databaseManager passWithUniqueIdentifier:v20];
  id v22 = [v21 secureElementPass];

  id v23 = [v22 devicePrimaryPaymentApplication];
  id v24 = v23;
  if (v23) {
    BOOL v25 = [v23 state] != (id)1;
  }
  else {
    BOOL v25 = 1;
  }
  int v26 = PKCashDeviceTapEnabled();
  if (v18 && v26 && !v25 && [v18 supportsDeviceTap])
  {
    id v27 = objc_alloc_init((Class)SBSApplicationShortcutItem);
    id v28 = [objc_alloc((Class)SBSApplicationShortcutSystemPrivateIcon) initWithSystemImageName:@"apple.cash.tap"];
    [v27 setIcon:v28];

    [v27 setType:PKQuickActionNearbyPeerPayment];
    id v29 = PKLocalizedNearbyPeerPaymentString(@"ORB_NEARBY_PEER_PAYMENT");
    [v27 setLocalizedTitle:v29];

    [v3 addObject:v27];
  }
  if (PKSecureElementIsAvailable())
  {
    long long v30 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebService];
    id v31 = [v30 paymentSetupSupportedInRegion];

    if (v31 == (id)1)
    {
      v32 = [(PDDatabaseManager *)self->_databaseManager passesOfType:1];
      if (![v32 count]
        || [v32 count] == (id)1
        && ([v32 anyObject],
            id v33 = objc_claimAutoreleasedReturnValue(),
            id v34 = [v33 activationState],
            v33,
            v34 == (id)4))
      {
        id v35 = objc_alloc_init((Class)SBSApplicationShortcutItem);
        id v36 = [objc_alloc((Class)SBSApplicationShortcutSystemIcon) initWithSystemImageName:@"plus"];
        [v35 setIcon:v36];
        id v37 = PKLocalizedString(@"ORB_ADD_CARD");
        [v35 setLocalizedTitle:v37];

        [v35 setType:PKQuickActionAddCardAction];
        [v3 addObject:v35];
      }
    }
  }
  [v39 updateDynamicApplicationShortcutItems:v3 forBundleIdentifier:PKServiceBundleIdentifier];
  [v39 invalidate];
}

- (void)pendingProvisioningsDidChangeWithPendingProvisionings:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003DF68((uint64_t)self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004BF54;
  v7[3] = &unk_10072F330;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

- (void)pendingProvisioningManagerDidFinishProvisioningWithReceipts:(id)a3
{
  id v4 = a3;
  id v19 = self;
  [(PDDefaultPassManager *)self->_defaultPassManager updateDefaultPaymentPassIfNeeded];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v21;
    id v9 = (void *)PKPassLibraryPendingProvisioningFinishedNotification;
    id v10 = (void *)PKPassLibraryPendingProvisioningFinishedReceiptKey;
    *(void *)&long long v6 = 138412290;
    long long v17 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v13 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0, v17);
        if (v13)
        {
          id v14 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_string(v14, "Name", (const char *)[v9 UTF8String]);
          id v15 = (const char *)[v10 UTF8String];
          id v16 = v13;
          xpc_dictionary_set_data(v14, v15, [v16 bytes], (size_t)objc_msgSend(v16, "length"));
          [(PDXPCEventPublisher *)v19->_passKitEventPublisher sendEvent:v14 completion:0];
        }
        else
        {
          id v14 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = v17;
            uint64_t v25 = v12;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Failed to archive pending provisioning receipt: %@", buf, 0xCu);
          }
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unprotectedManagers, 0);
  objc_storeStrong((id *)&self->_transactionProcesssorOSTransaction, 0);
  objc_storeStrong((id *)&self->_passSignalManager, 0);
  objc_storeStrong((id *)&self->_appProtectionManager, 0);
  objc_storeStrong((id *)&self->_bankCredentialMigrator, 0);
  objc_storeStrong((id *)&self->_passVerificationManager, 0);
  objc_storeStrong((id *)&self->_financeSyncManager, 0);
  objc_storeStrong((id *)&self->_provisioningRequirementsChecker, 0);
  objc_storeStrong((id *)&self->_passLiveRenderManager, 0);
  objc_storeStrong((id *)&self->_dynamicStateManager, 0);
  objc_storeStrong((id *)&self->_issuerBindingManager, 0);
  objc_storeStrong((id *)&self->_financeKitPaymentTransactionProcessor, 0);
  objc_storeStrong((id *)&self->_bankConnectPushNotificationsHandler, 0);
  objc_storeStrong((id *)&self->_financeKitMessageProvider, 0);
  objc_storeStrong((id *)&self->_paymentUserCommunicationManager, 0);
  objc_storeStrong((id *)&self->_applicationMessageManager, 0);
  objc_storeStrong((id *)&self->_passKitEventPublisher, 0);
  objc_storeStrong((id *)&self->_transactionDeviceScoreSubmissionsInProgess, 0);
  objc_storeStrong((id *)&self->_accountStatementMetadataProcessor, 0);
  objc_storeStrong((id *)&self->_auxPassInformationManager, 0);
  objc_storeStrong((id *)&self->_pendingProvisioningManager, 0);
  objc_storeStrong((id *)&self->_sharingManager, 0);
  objc_storeStrong((id *)&self->_balanceManager, 0);
  objc_storeStrong((id *)&self->_vehicleFunctionsManager, 0);
  objc_storeStrong((id *)&self->_passTileManager, 0);
  objc_storeStrong((id *)&self->_transactionNotificationController, 0);
  objc_storeStrong((id *)&self->_familyMemberManager, 0);
  objc_storeStrong((id *)&self->_transactionReceiptFileManager, 0);
  objc_storeStrong((id *)&self->_payLaterMerchantProcessor, 0);
  objc_storeStrong((id *)&self->_mapsBrandAndMerchantUpdater, 0);
  objc_storeStrong((id *)&self->_merchantProcessingService, 0);
  objc_storeStrong((id *)&self->_transitUpgradeController, 0);
  objc_storeStrong((id *)&self->_passUpgradeController, 0);
  objc_storeStrong((id *)&self->_transitNotificationService, 0);
  objc_storeStrong((id *)&self->_devicePasscodeManager, 0);
  objc_storeStrong((id *)&self->_defaultPassManager, 0);
  objc_storeStrong((id *)&self->_spotlightIndexer, 0);
  objc_storeStrong((id *)&self->_transitStateManager, 0);
  objc_storeStrong((id *)&self->_expressPassManager, 0);
  objc_storeStrong((id *)&self->_relevantPassProvider, 0);
  objc_storeStrong((id *)&self->_sharingIDSManager, 0);
  objc_storeStrong((id *)&self->_idsManager, 0);
  objc_storeStrong((id *)&self->_usageNotificationServer, 0);
  objc_storeStrong((id *)&self->_catalogOfRecord, 0);
  objc_storeStrong((id *)&self->_webServicesCoordinator, 0);
  objc_storeStrong((id *)&self->_paymentHostEndpointRegistry, 0);
  objc_storeStrong((id *)&self->_deviceRegistrationServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_cloudStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_cloudStoreTransactionSourceController, 0);
  objc_storeStrong((id *)&self->_auxiliaryCapabilityManager, 0);
  objc_storeStrong((id *)&self->_transactionAuthenticationManager, 0);
  objc_storeStrong((id *)&self->_barcodeCredentialManager, 0);
  objc_storeStrong((id *)&self->_pushProvisioningManager, 0);
  objc_storeStrong((id *)&self->_iso18013Manager, 0);
  objc_storeStrong((id *)&self->_carKeyRequirementsChecker, 0);
  objc_storeStrong((id *)&self->_nfcInitiatedPairingManager, 0);
  objc_storeStrong((id *)&self->_subcredentialManager, 0);
  objc_storeStrong((id *)&self->_paymentOffersManager, 0);
  objc_storeStrong((id *)&self->_deviceEnvironmentStore, 0);
  objc_storeStrong((id *)&self->_ruleManager, 0);
  objc_storeStrong((id *)&self->_discoveryManager, 0);
  objc_storeStrong((id *)&self->_applyNotificationController, 0);
  objc_storeStrong((id *)&self->_accountAdStatusChangesObserver, 0);
  objc_storeStrong((id *)&self->_accountNotificationController, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_applyManager, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccountManager, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_paymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_notificationServicesCoordinator, 0);
  objc_storeStrong((id *)&self->_paymentTransactionProcessor, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_pushNotificationManager, 0);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_cloudSyncCoordiantor, 0);
  objc_storeStrong((id *)&self->_cardFileManager, 0);
  objc_storeStrong((id *)&self->_installedPassUniqueIDs, 0);
}

@end