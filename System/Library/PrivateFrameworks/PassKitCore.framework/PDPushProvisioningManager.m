@interface PDPushProvisioningManager
- (BOOL)_companionHasProvisionedPassForCredentialHash:(id)a3;
- (BOOL)_hasProvisionedPassForCredentialHash:(id)a3;
- (BOOL)_isPushProvisioningSupportedForCurrentDeviceRequiresSimultaneousRequestRouting:(BOOL)a3 checkPassCount:(BOOL)a4 passCount:(unint64_t)a5;
- (PDCardFileManager)cardFileManager;
- (PDDatabaseManager)databaseManager;
- (PDDeviceRegistrationServiceCoordinator)deviceRegistrationServiceCoordinator;
- (PDFamilyCircleManager)familyCircleManager;
- (PDNotificationStreamManager)notificationStreamManager;
- (PDPaymentWebServiceCoordinator)webServiceCoordinator;
- (PDPendingProvisioningManager)pendingProvisioningManager;
- (PDPushProvisioningManager)initWithDataBaseManager:(id)a3 cardFileManager:(id)a4 userNotificationManager:(id)a5 paymentWebServiceCoordinator:(id)a6 familyCircleManager:(id)a7 secureElement:(id)a8 assertionManager:(id)a9 deviceRegistrationServiceCoordinator:(id)a10 notificationStreamManager:(id)a11 pendingProvisioningManager:(id)a12;
- (PDUserNotificationManager)userNotificationManager;
- (PKCloudStoreCoordinatorDelegate)cloudStoreCoordinator;
- (PKSecureElement)secureElement;
- (id)_encryptProvisioningTarget:(id)a3 devSigned:(BOOL)a4 certificateChain:(id)a5 error:(id *)a6;
- (void)_handleExpectedPassUpdateForEligibilityResponse:(id)a3 completion:(id)a4;
- (void)_handleUnsupportedDeviceResponse:(id)a3 completion:(id)a4;
- (void)_isPushProvisioningSupportedForConfiguration:(id)a3 completion:(id)a4;
- (void)_prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 determineTargetDevice:(BOOL)a5 completion:(id)a6;
- (void)_queue_checkAvailablePushProvisioningSharingIdentifiersAndProvisionWithCompletion:(id)a3;
- (void)_queue_insertOrUpdatePushProvisioningSharingMetadata:(id)a3;
- (void)_queue_performBackgroundPushProvisioningWithTransaction:(id)a3;
- (void)_webServiceForTargetDevice:(unint64_t)a3 completion:(id)a4;
- (void)configurePushProvisioningConfiguration:(id)a3 completion:(id)a4;
- (void)encryptProvisioningTarget:(id)a3 completion:(id)a4;
- (void)isPushProvisioningSupportedForConfiguration:(id)a3 completion:(id)a4;
- (void)prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 completion:(id)a5;
- (void)provideEncryptedPushProvisioningTarget:(id)a3 sharingInstanceIdentifier:(id)a4 withCompletion:(id)a5;
- (void)provisionAvailablePushProvisioningSharingIdentifiers;
- (void)pushProvisioningNoncesWithCredentialCount:(unint64_t)a3 completion:(id)a4;
- (void)pushProvisioningSharingIdentifiers:(id)a3;
- (void)redeemPaymentShareableCredential:(id)a3 completion:(id)a4;
- (void)redeemPaymentShareableCredential:(id)a3 provisioningRequestForEligibilityResponse:(id)a4 completion:(id)a5;
- (void)redeemProvisioningMetadata:(id)a3 completion:(id)a4;
- (void)redeemProvisioningSharingIdentifier:(id)a3 completion:(id)a4;
- (void)setCardFileManager:(id)a3;
- (void)setCloudStoreCoordinator:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setDeviceRegistrationServiceCoordinator:(id)a3;
- (void)setFamilyCircleManager:(id)a3;
- (void)setNotificationStreamManager:(id)a3;
- (void)setPendingProvisioningManager:(id)a3;
- (void)setSecureElement:(id)a3;
- (void)setUserNotificationManager:(id)a3;
- (void)setWebServiceCoordinator:(id)a3;
- (void)statusForShareableCredentials:(id)a3 completion:(id)a4;
@end

@implementation PDPushProvisioningManager

- (PDPushProvisioningManager)initWithDataBaseManager:(id)a3 cardFileManager:(id)a4 userNotificationManager:(id)a5 paymentWebServiceCoordinator:(id)a6 familyCircleManager:(id)a7 secureElement:(id)a8 assertionManager:(id)a9 deviceRegistrationServiceCoordinator:(id)a10 notificationStreamManager:(id)a11 pendingProvisioningManager:(id)a12
{
  id v40 = a3;
  id obj = a4;
  id v39 = a4;
  id v38 = a5;
  id v37 = a6;
  id v36 = a7;
  id v35 = a8;
  id v34 = a9;
  id v33 = a10;
  id v32 = a11;
  id v31 = a12;
  v43.receiver = self;
  v43.super_class = (Class)PDPushProvisioningManager;
  v18 = [(PDPushProvisioningManager *)&v43 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_databaseManager, a3);
    objc_storeStrong((id *)&v19->_cardFileManager, obj);
    objc_storeStrong((id *)&v19->_webServiceCoordinator, a6);
    objc_storeStrong((id *)&v19->_secureElement, a8);
    objc_storeStrong((id *)&v19->_userNotificationManager, a5);
    objc_storeStrong((id *)&v19->_familyCircleManager, a7);
    objc_storeStrong((id *)&v19->_deviceRegistrationServiceCoordinator, a10);
    objc_storeStrong((id *)&v19->_notificationStreamManager, a11);
    objc_storeStrong((id *)&v19->_pendingProvisioningManager, a12);
    objc_storeStrong((id *)&v19->_assertionManager, a9);
    v19->_companionWebServiceLock._os_unfair_lock_opaque = 0;
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.passd.pushprovisioningmanager.work", v20);
    workQueue = v19->_workQueue;
    v19->_workQueue = (OS_dispatch_queue *)v21;

    dispatch_queue_t v23 = dispatch_queue_create("com.apple.passd.pushprovisioningmanager.reply", v20);
    replyQueue = v19->_replyQueue;
    v19->_replyQueue = (OS_dispatch_queue *)v23;

    v25 = v19->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10010CE94;
    block[3] = &unk_10072E1E8;
    v42 = v19;
    v26 = v25;
    dispatch_block_t v27 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, block);
    dispatch_async(v26, v27);
  }
  return v19;
}

- (void)isPushProvisioningSupportedForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10010CF4C;
    v8[3] = &unk_1007376D8;
    v8[4] = self;
    id v9 = v6;
    [(PDPushProvisioningManager *)self _isPushProvisioningSupportedForConfiguration:a3 completion:v8];
  }
}

- (void)_isPushProvisioningSupportedForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 secureElementPassConfiguration];
  id v9 = objc_alloc_init((Class)PKProvisioningRequirementOracle);
  v10 = [v9 requirementsForAddSecureElementPassConfiguration:v8];
  v11 = [v9 recoverableRequirements];
  v12 = [v10 requirementsByRemovingRequirements:v11];

  id v13 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  char v38 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  char v36 = 0;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10010D364;
  v34[3] = &unk_10072E5C0;
  v34[4] = self;
  [v13 addOperation:v34];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10010D444;
  v31[3] = &unk_100730730;
  v31[4] = self;
  id v14 = v12;
  id v32 = v14;
  id v33 = v37;
  [v13 addOperation:v31];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10010D648;
  v25[3] = &unk_1007377A0;
  id v15 = v6;
  id v26 = v15;
  dispatch_block_t v27 = self;
  id v16 = v14;
  id v28 = v16;
  v30 = v35;
  id v17 = v8;
  id v29 = v17;
  [v13 addOperation:v25];
  v18 = +[NSNull null];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10010D9E0;
  v21[3] = &unk_1007377C8;
  dispatch_queue_t v23 = v37;
  v24 = v35;
  id v19 = v7;
  id v22 = v19;
  id v20 = [v13 evaluateWithInput:v18 completion:v21];

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);
}

- (BOOL)_isPushProvisioningSupportedForCurrentDeviceRequiresSimultaneousRequestRouting:(BOOL)a3 checkPassCount:(BOOL)a4 passCount:(unint64_t)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  if (!PKSecureElementIsAvailable())
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = 0;
      v10 = "Push provisioning: Device does not support push provisioning.";
      v11 = (uint8_t *)&v19;
      goto LABEL_10;
    }
LABEL_11:

    return 0;
  }
  if (PKIsSRD())
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v18 = 0;
      v10 = "Push provisioning: Device does not support push provisioning - is SRD";
      v11 = (uint8_t *)&v18;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (PKIsBeneficiaryAccount())
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v10 = "Push provisioning: Device does not support push provisioning - is beneficiary account";
      v11 = buf;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v7 && (PKNearFieldSupportsSimultaneousRequestRouting() & 1) == 0)
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    __int16 v16 = 0;
    v10 = "Push provisioning: Device does not support push provisioning - device doesn't support unified access";
    v11 = (uint8_t *)&v16;
    goto LABEL_10;
  }
  if (!v6 || !PKDisableDynamicSEAllocation()) {
    return 1;
  }
  unint64_t v13 = [(PDDatabaseManager *)self->_databaseManager countActiveSecureElementPasses];
  unint64_t v14 = PKMaxPaymentCards();
  BOOL result = 1;
  if (v14 && v13 + a5 > v14)
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    __int16 v15 = 0;
    v10 = "Push provisioning: Device does not support push provisioning - max pass count reached";
    v11 = (uint8_t *)&v15;
    goto LABEL_10;
  }
  return result;
}

- (void)pushProvisioningSharingIdentifiers:(id)a3
{
  id v4 = a3;
  webServiceCoordinator = self->_webServiceCoordinator;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010DE2C;
  v7[3] = &unk_100737818;
  id v8 = v4;
  id v6 = v4;
  [(PDPaymentWebServiceCoordinator *)webServiceCoordinator performHandlerOnSharedWebServiceQueue:v7];
}

- (void)statusForShareableCredentials:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * (void)v12) status];
        if (!PKPushProvisioningSharingStatusIsTerminal())
        {

          webServiceCoordinator = self->_webServiceCoordinator;
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_10010E164;
          v16[3] = &unk_100737868;
          id v17 = v8;
          __int16 v18 = self;
          id v19 = v7;
          [(PDPaymentWebServiceCoordinator *)webServiceCoordinator performHandlerOnSharedWebServiceQueue:v16];

          goto LABEL_13;
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  unint64_t v13 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Already at final state: completing", buf, 2u);
  }

  uint64_t v14 = PKAggregateSharingStatusForShareableCredentials();
  (*((void (**)(id, uint64_t, id, void))v7 + 2))(v7, v14, v8, 0);
LABEL_13:
}

- (void)provideEncryptedPushProvisioningTarget:(id)a3 sharingInstanceIdentifier:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  webServiceCoordinator = self->_webServiceCoordinator;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10010E938;
  v15[3] = &unk_100737868;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(PDPaymentWebServiceCoordinator *)webServiceCoordinator performHandlerOnSharedWebServiceQueue:v15];
}

- (void)pushProvisioningNoncesWithCredentialCount:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  webServiceCoordinator = self->_webServiceCoordinator;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10010EAB4;
  v9[3] = &unk_100737958;
  id v10 = v6;
  unint64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  [(PDPaymentWebServiceCoordinator *)webServiceCoordinator performHandlerOnSharedWebServiceQueue:v9];
}

- (void)configurePushProvisioningConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v24 = a4;
  id v7 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = sub_10002088C;
  v53[4] = sub_100020F38;
  id v54 = 0;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10010F358;
  v52[3] = &unk_100730D50;
  v52[4] = self;
  v52[5] = v53;
  [v7 addOperation:v52];
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  char v51 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  char v49 = 0;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10010F558;
  v43[3] = &unk_100731970;
  id v8 = self;
  v43[4] = self;
  id v9 = v6;
  id v44 = v9;
  v45 = v50;
  v46 = v48;
  v47 = v53;
  [v7 addOperation:v43];
  id v10 = [v9 shareablePassConfiguration];
  v25 = v7;
  long long v22 = v10;
  if (v10) {
    BOOL v11 = objc_msgSend(v10, "primaryAction", v10, v24) == (id)1;
  }
  else {
    BOOL v11 = 0;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v12 = objc_msgSend(v9, "metadataProviders", v22);
  id v13 = [v12 countByEnumeratingWithState:&v39 objects:v55 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v40;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v40 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = [*(id *)(*((void *)&v39 + 1) + 8 * i) provisioningTarget];
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_10010F77C;
        v31[3] = &unk_100737A48;
        BOOL v38 = v11;
        id v35 = v50;
        char v36 = v48;
        id v17 = v16;
        id v32 = v17;
        id v33 = v8;
        id v37 = v53;
        id v34 = v9;
        [v25 addOperation:v31];
      }
      id v13 = [v12 countByEnumeratingWithState:&v39 objects:v55 count:16];
    }
    while (v13);
  }

  id v18 = +[NSNull null];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10010FD3C;
  v26[3] = &unk_100737A98;
  id v19 = v9;
  v30 = v53;
  id v27 = v19;
  id v28 = v8;
  id v20 = v24;
  id v29 = v20;
  id v21 = [v25 evaluateWithInput:v18 completion:v26];

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v50, 8);
  _Block_object_dispose(v53, 8);
}

- (void)_queue_insertOrUpdatePushProvisioningSharingMetadata:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(PDDatabaseManager *)self->_databaseManager insertOrUpdatePushProvisioningSharingMetadata:*(void *)(*((void *)&v10 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)provisionAvailablePushProvisioningSharingIdentifiers
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Push provisioning: provisioning pending sharing instance identifiers", buf, 2u);
  }

  id v4 = (void *)PDOSTransactionCreate("PDPushProvisioningManager");
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10011009C;
  v7[3] = &unk_10072E198;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)_queue_performBackgroundPushProvisioningWithTransaction:(id)a3
{
  id v4 = a3;
  if (self->_isUpdatingPushProvisioningSharingIdentifier)
  {
    self->_didDeferUpdatingSharingIdentifiers = 1;
  }
  else
  {
    self->_isUpdatingPushProvisioningSharingIdentifier = 1;
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Push provisioning: Performing background push provisioning", buf, 2u);
    }

    if (!v4) {
      id v4 = (id)PDOSTransactionCreate("PDPushProvisioningManager.updating_sharing_identifier");
    }
    long long v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    long long v13 = sub_100110254;
    uint64_t v14 = &unk_100737AC0;
    __int16 v15 = self;
    id v4 = v4;
    id v16 = v4;
    id v6 = objc_retainBlock(&v11);
    id v7 = objc_alloc((Class)NSMutableSet);
    id v8 = -[PDDatabaseManager pushProvisioningSharingMetadataWithStatus:](self->_databaseManager, "pushProvisioningSharingMetadataWithStatus:", 1, v11, v12, v13, v14, v15);
    id v9 = (NSMutableSet *)[v7 initWithSet:v8];
    availableSharingMetaData = self->_availableSharingMetaData;
    self->_availableSharingMetaData = v9;

    if (self->_shouldFetchSharingIdentifiersFromServer
      || [(NSMutableSet *)self->_availableSharingMetaData count])
    {
      [(PDPushProvisioningManager *)self _queue_checkAvailablePushProvisioningSharingIdentifiersAndProvisionWithCompletion:v6];
    }
    else
    {
      ((void (*)(void ***, uint64_t))v6[2])(v6, 1);
    }
  }
}

- (void)_queue_checkAvailablePushProvisioningSharingIdentifiersAndProvisionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Push provisioning: using new provisioning coordinatoor", buf, 2u);
  }

  BOOL shouldFetchSharingIdentifiersFromServer = self->_shouldFetchSharingIdentifiersFromServer;
  self->_BOOL shouldFetchSharingIdentifiersFromServer = 0;
  if (shouldFetchSharingIdentifiersFromServer)
  {
    id v7 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
    *(void *)buf = 0;
    id v16 = buf;
    uint64_t v17 = 0x3032000000;
    id v18 = sub_10002088C;
    id v19 = sub_100020F38;
    id v20 = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001105C8;
    v14[3] = &unk_10072E5C0;
    v14[4] = self;
    [v7 addOperation:v14];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10011077C;
    v13[3] = &unk_100730D50;
    v13[4] = self;
    v13[5] = buf;
    [v7 addOperation:v13];
    id v8 = +[NSNull null];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100110C18;
    v10[3] = &unk_100737BB0;
    v10[4] = self;
    uint64_t v12 = buf;
    id v11 = v4;
    id v9 = [v7 evaluateWithInput:v8 completion:v10];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Push provisioning: skipping check because pending push provisioning credentials are handled by the pending provisioning manager", buf, 2u);
    }

    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

- (void)encryptProvisioningTarget:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100110D80;
  v7[3] = &unk_100737BD8;
  id v8 = a4;
  id v6 = v8;
  [(PDPushProvisioningManager *)self _prepareProvisioningTarget:a3 checkFamilyCircle:0 determineTargetDevice:0 completion:v7];
}

- (void)prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 completion:(id)a5
{
}

- (void)_prepareProvisioningTarget:(id)a3 checkFamilyCircle:(BOOL)a4 determineTargetDevice:(BOOL)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = [v9 targetDevice];
  id v12 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  void v48[3] = sub_10002088C;
  v48[4] = sub_100020F38;
  id v49 = 0;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1001111FC;
  v47[3] = &unk_10072E5C0;
  v47[4] = self;
  [v12 addOperation:v47];
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  char v46 = 0;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1001112DC;
  v41[3] = &unk_100737C50;
  BOOL v44 = a4;
  v41[4] = self;
  id v13 = v9;
  id v42 = v13;
  objc_super v43 = v45;
  [v12 addOperation:v41];
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = sub_10002088C;
  v39[4] = sub_100020F38;
  id v40 = 0;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100111934;
  v38[3] = &unk_100737CA0;
  v38[5] = v39;
  v38[6] = v11;
  v38[4] = self;
  [v12 addOperation:v38];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100111A9C;
  v34[3] = &unk_100736BF8;
  id v14 = v13;
  id v35 = v14;
  char v36 = v39;
  id v37 = v48;
  [v12 addOperation:v34];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = sub_10002088C;
  v32[4] = sub_100020F38;
  id v33 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100111D10;
  v25[3] = &unk_100737CF0;
  id v27 = v39;
  id v28 = v32;
  void v25[4] = self;
  id v15 = v14;
  id v26 = v15;
  id v31 = v11;
  id v29 = v48;
  v30 = v45;
  [v12 addOperation:v25];
  id v16 = +[NSNull null];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100112030;
  v19[3] = &unk_100737D40;
  id v24 = v11;
  id v21 = v48;
  id v17 = v10;
  v19[4] = self;
  id v20 = v17;
  long long v22 = v32;
  long long v23 = v45;
  id v18 = [v12 evaluateWithInput:v16 completion:v19];

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v39, 8);

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(v48, 8);
}

- (id)_encryptProvisioningTarget:(id)a3 devSigned:(BOOL)a4 certificateChain:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a5;
  PKPaymentCreateAndValidateTrustWithCerts();
  if (a6)
  {
    *a6 = +[NSError errorWithDomain:PKEncryptionErrorDomain code:1 userInfo:0];
  }

  return 0;
}

- (void)redeemPaymentShareableCredential:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 encryptedProvisioningTarget];
  id v9 = [v8 targetDevice];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001125A0;
  v12[3] = &unk_100737D90;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  [(PDPushProvisioningManager *)self _webServiceForTargetDevice:v9 completion:v12];
}

- (void)redeemProvisioningSharingIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Push provisioning starting redeem with sharingIdentifier: %@", buf, 0xCu);
  }

  id v9 = [objc_alloc((Class)PKPaymentShareableCredential) initWithProvisioningSharingIdentifier:v6 isBackgroundProvisioning:1];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100112A54;
  v11[3] = &unk_100737DB8;
  id v12 = v7;
  id v10 = v7;
  [(PDPushProvisioningManager *)self redeemPaymentShareableCredential:v9 completion:v11];
}

- (void)redeemProvisioningMetadata:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Push provisioning starting redeem with metadata: %@", buf, 0xCu);
  }

  id v9 = objc_alloc((Class)PKPaymentShareableCredential);
  id v10 = [v6 sharingInstanceIdentifier];
  id v11 = [v9 initWithProvisioningSharingIdentifier:v10 isBackgroundProvisioning:1];

  objc_msgSend(v11, "setSource:", objc_msgSend(v6, "source"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100112BFC;
  v13[3] = &unk_100737DB8;
  id v14 = v7;
  id v12 = v7;
  [(PDPushProvisioningManager *)self redeemPaymentShareableCredential:v11 completion:v13];
}

- (void)redeemPaymentShareableCredential:(id)a3 provisioningRequestForEligibilityResponse:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v25 = a4;
  id v9 = a5;
  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Push provisioning starting redeeme with credential: %@", (uint8_t *)&buf, 0xCu);
  }

  objc_initWeak(&location, self);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v43 = 0x3032000000;
  BOOL v44 = sub_10002088C;
  v45 = sub_100020F38;
  id v11 = +[NSUUID UUID];
  id v46 = [v11 UUIDString];

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100112FE0;
  v39[3] = &unk_100737DE0;
  objc_copyWeak(&v40, &location);
  v39[4] = &buf;
  id v12 = objc_retainBlock(v39);
  id v13 = (void *)PDOSTransactionCreate("PDPushProvisioningManager");
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100113064;
  void v35[3] = &unk_100737E08;
  id v14 = v9;
  id v37 = v14;
  id v15 = v12;
  id v38 = v15;
  id v16 = v13;
  id v36 = v16;
  id v17 = objc_retainBlock(v35);
  assertionManager = self->_assertionManager;
  uint64_t v19 = *(void *)(*((void *)&buf + 1) + 40);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1001130B4;
  v26[3] = &unk_100737EA8;
  id v20 = v8;
  p_long long buf = &buf;
  id v27 = v20;
  id v28 = self;
  id v21 = v17;
  id v29 = v21;
  objc_copyWeak(&v34, &location);
  id v22 = v14;
  id v30 = v22;
  long long v23 = v15;
  id v31 = v23;
  id v24 = v25;
  id v32 = v24;
  [(PDAssertionManager *)assertionManager acquireAssertionOfType:1 withIdentifier:v19 reason:@"Push provisioning request" handler:v26];

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v40);
  _Block_object_dispose(&buf, 8);

  objc_destroyWeak(&location);
}

- (void)_handleUnsupportedDeviceResponse:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 eligibilityStatus];
  if (v7 == (id)4)
  {
    NSErrorUserInfoKey v22 = NSDebugDescriptionErrorKey;
    CFStringRef v23 = @"Newer OS version required";
    id v9 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    id v10 = PKAddSecureElementPassErrorDomain;
    uint64_t v11 = 6;
    goto LABEL_5;
  }
  int v8 = (int)v7;
  if (v7 == (id)5)
  {
    NSErrorUserInfoKey v24 = NSDebugDescriptionErrorKey;
    CFStringRef v25 = @"Hardware not supported";
    id v9 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v10 = PKAddSecureElementPassErrorDomain;
    uint64_t v11 = 4;
LABEL_5:
    id v12 = +[NSError errorWithDomain:v10 code:v11 userInfo:v9];

    goto LABEL_9;
  }
  id v13 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    int v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Error: Unsupported eligibility status: %ul", buf, 8u);
  }

  id v12 = +[NSError errorWithDomain:PKAddSecureElementPassErrorDomain code:0 userInfo:0];
LABEL_9:
  replyQueue = self->_replyQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100113BB8;
  v17[3] = &unk_10072E598;
  id v18 = v12;
  id v19 = v6;
  id v15 = v12;
  id v16 = v6;
  dispatch_async(replyQueue, v17);
}

- (void)_handleExpectedPassUpdateForEligibilityResponse:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Push provisioning: Received pass update eligibility status, waiting for pass update", buf, 2u);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100113DF4;
  v18[3] = &unk_100737ED0;
  v18[4] = self;
  id v9 = v7;
  id v19 = v9;
  id v10 = objc_retainBlock(v18);
  uint64_t v11 = [v6 dpanIdentifier];
  id v12 = v11;
  if (v11)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100113F8C;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v16 = v11;
    id v17 = v10;
    dispatch_async(workQueue, block);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Push provisioning: Missing DPAN identifier, unable to wait for pass update.", buf, 2u);
    }

    id v14 = +[NSError errorWithDomain:PKAddSecureElementPassErrorDomain code:2 userInfo:0];
    ((void (*)(void *, void, void *))v10[2])(v10, 0, v14);
  }
}

- (BOOL)_hasProvisionedPassForCredentialHash:(id)a3
{
  v3 = [(PDDatabaseManager *)self->_databaseManager passWithProvisioningCredentialHash:a3];
  id v4 = [v3 secureElementPass];

  if (v4) {
    BOOL v5 = [v4 passActivationState] != (id)4;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_companionHasProvisionedPassForCredentialHash:(id)a3
{
  id v3 = a3;
  id v4 = +[PKPassLibrary sharedInstanceWithRemoteLibrary];
  BOOL v5 = [v4 _remoteLibrary];

  id v6 = [v5 passesOfType:1];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100114260;
  v10[3] = &unk_100737EF8;
  id v11 = v3;
  id v7 = v3;
  unsigned __int8 v8 = objc_msgSend(v6, "pk_containsObjectPassingTest:", v10);

  return v8;
}

- (void)_webServiceForTargetDevice:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void (**)(void, void, void))v6;
  if (a3 == 2)
  {
    os_unfair_lock_lock(&self->_companionWebServiceLock);
    companionWebServiceProvider = self->_companionWebServiceProvider;
    if (!companionWebServiceProvider)
    {
      id v9 = (NPKSharedWebServiceProvider *)objc_alloc_init(off_1008058A0());
      id v10 = self->_companionWebServiceProvider;
      self->_companionWebServiceProvider = v9;

      [(NPKSharedWebServiceProvider *)self->_companionWebServiceProvider loadWebService];
      companionWebServiceProvider = self->_companionWebServiceProvider;
      ++self->_companionWebServiceUseCounter;
    }
    id v11 = [(NPKSharedWebServiceProvider *)companionWebServiceProvider webService];
    os_unfair_lock_unlock(&self->_companionWebServiceLock);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001144A0;
    v15[3] = &unk_10072E1E8;
    void v15[4] = self;
    ((void (**)(void, void *, void *))v7)[2](v7, v11, v15);
  }
  else
  {
    webServiceCoordinator = self->_webServiceCoordinator;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10011450C;
    v13[3] = &unk_100737818;
    id v14 = v6;
    [(PDPaymentWebServiceCoordinator *)webServiceCoordinator performHandlerOnSharedWebServiceQueue:v13];
    id v11 = v14;
  }
}

- (PDDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
}

- (PDCardFileManager)cardFileManager
{
  return self->_cardFileManager;
}

- (void)setCardFileManager:(id)a3
{
}

- (PDPaymentWebServiceCoordinator)webServiceCoordinator
{
  return self->_webServiceCoordinator;
}

- (void)setWebServiceCoordinator:(id)a3
{
}

- (PKSecureElement)secureElement
{
  return self->_secureElement;
}

- (void)setSecureElement:(id)a3
{
}

- (PDUserNotificationManager)userNotificationManager
{
  return self->_userNotificationManager;
}

- (void)setUserNotificationManager:(id)a3
{
}

- (PDFamilyCircleManager)familyCircleManager
{
  return self->_familyCircleManager;
}

- (void)setFamilyCircleManager:(id)a3
{
}

- (PKCloudStoreCoordinatorDelegate)cloudStoreCoordinator
{
  return self->_cloudStoreCoordinator;
}

- (void)setCloudStoreCoordinator:(id)a3
{
}

- (PDDeviceRegistrationServiceCoordinator)deviceRegistrationServiceCoordinator
{
  return self->_deviceRegistrationServiceCoordinator;
}

- (void)setDeviceRegistrationServiceCoordinator:(id)a3
{
}

- (PDNotificationStreamManager)notificationStreamManager
{
  return self->_notificationStreamManager;
}

- (void)setNotificationStreamManager:(id)a3
{
}

- (PDPendingProvisioningManager)pendingProvisioningManager
{
  return self->_pendingProvisioningManager;
}

- (void)setPendingProvisioningManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingProvisioningManager, 0);
  objc_storeStrong((id *)&self->_notificationStreamManager, 0);
  objc_storeStrong((id *)&self->_deviceRegistrationServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_cloudStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_familyCircleManager, 0);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_webServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_cardFileManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_companionWebServiceProvider, 0);
  objc_storeStrong((id *)&self->_availableSharingMetaData, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
}

@end