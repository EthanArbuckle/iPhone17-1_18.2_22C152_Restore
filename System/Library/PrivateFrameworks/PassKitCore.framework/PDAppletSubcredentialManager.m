@interface PDAppletSubcredentialManager
- (BOOL)addPassShare:(id)a3 onCredentialWithIdentifier:(id)a4;
- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3;
- (BOOL)createdSharedSubcredentialWithIdentifier:(id)a3 fromSharingInvitationIdentifier:(id)a4;
- (BOOL)didReceiveSharingInvitationWithIdentifier:(id)a3 fromOriginatorIDSHandle:(id)a4 sharingSessionIdentifier:(id)a5 metadata:(id)a6;
- (BOOL)didUpdateSharingInvitationWithIdentifier:(id)a3 reason:(int64_t)a4;
- (BOOL)handleSharingInvitationRequest:(id)a3;
- (BOOL)interestedInAssertionOfType:(unint64_t)a3;
- (BOOL)removeSharingInvitationReceiptWithIdentifiers:(id)a3 onCredential:(id)a4;
- (BOOL)removeSharingInvitationWithIdentifier:(id)a3;
- (BOOL)sharingInvitationReceiptWasInvalidated:(id)a3 withCredentialIdentifier:(id)a4 error:(id)a5;
- (NSSet)invitations;
- (PDAppletSubcredentialManager)initWithDatabaseManager:(id)a3 cardFileManager:(id)a4 paymentWebServiceCoordinator:(id)a5 daManager:(id)a6 carKeyRequirementsChecker:(id)a7 secureElement:(id)a8 assertionManager:(id)a9 notificationManager:(id)a10;
- (PDAssertionManager)assertionManager;
- (PDCardFileManager)cardFileManager;
- (PDDatabaseManager)databaseManager;
- (PDPaymentWebServiceCoordinator)webServiceCoordinator;
- (PDUserNotificationManager)notificationManager;
- (PKSecureElement)secureElement;
- (id)sharedCredentialManifestForPass:(id)a3;
- (void)_downloadPassAtURL:(id)a3 credentialIdentifier:(id)a4 share:(id)a5;
- (void)_inflateSubcredentialsInDatabaseWithDeviceProperties:(id)a3 withCompletion:(id)a4;
- (void)_ingestSEBlobsForPass:(id)a3;
- (void)_ingestSubcredentialConfigurationsForPass:(id)a3;
- (void)_removeBackgroundRegistrationRequestForCredentials:(id)a3 withPaymentWebService:(id)a4;
- (void)_setRangingSuspensionReason:(unint64_t)a3 forCredential:(id)a4 forPaymentApplication:(id)a5;
- (void)_trackCredential:(id)a3 withRegistrationData:(id)a4 completion:(id)a5;
- (void)_updateSubcredentialsForBTEnabled:(BOOL)a3;
- (void)assertionManager:(id)a3 didInvalidateAssertion:(id)a4;
- (void)bluetoothMonitorerRecievedUpdatedBluetoothState:(int64_t)a3;
- (void)canAcceptInvitation:(id)a3 withCompletion:(id)a4;
- (void)createRegistrationRequestForCredentialWithIdentifier:(id)a3 completion:(id)a4;
- (void)credentialsOnDeviceWithCompletion:(id)a3;
- (void)dealloc;
- (void)declineRelatedSharingInvitationsIfNecessary:(id)a3 withCompletion:(id)a4;
- (void)didUpdateCredential:(id)a3 onPassWithIdentifier:(id)a4;
- (void)didUpdateCredential:(id)a3 onPassWithIdentifier:(id)a4 oldShares:(id)a5;
- (void)handlePaymentApplicationsAddedOrUpdatedOnPass:(id)a3 oldShares:(id)a4;
- (void)invalidateVehicleConnectionSessionForIdentifier:(id)a3;
- (void)passAddedOrUpdated:(id)a3 oldPass:(id)a4 oldShares:(id)a5;
- (void)passWillBeRemoved:(id)a3;
- (void)paymentWebServiceCoordinator:(id)a3 didRegisterCredentialWithIdentifier:(id)a4 response:(id)a5 error:(id)a6;
- (void)rangingDidResumeForTerminalType:(int64_t)a3 forAppletIdentifier:(id)a4 keyIdentifier:(id)a5;
- (void)rangingDidSuspendForTerminalType:(int64_t)a3 withReasons:(unint64_t)a4 forAppletIdentifier:(id)a5 keyIdentifier:(id)a6;
- (void)registerObserver:(id)a3;
- (void)requestBackgroundRegistrationForCredentialWithIdentifier:(id)a3;
- (void)requestRegistrationForCredentialWithIdentifier:(id)a3 completion:(id)a4;
- (void)restoreSubcredentialsInDatabase:(id)a3 withCompletion:(id)a4;
- (void)revokeSubcredentialForIdentifier:(id)a3 withCompletion:(id)a4;
- (void)revokeSubcredentials:(id)a3 withCompletion:(id)a4;
- (void)revokeSubcredentialsForIdentifiers:(id)a3 withCompletion:(id)a4;
- (void)revokeSubcredentialsForReaderIdentifiers:(id)a3 withCompletion:(id)a4;
- (void)sendRKEPassThroughData:(id)a3 forSessionIdentifier:(id)a4 withCompletion:(id)a5;
- (void)sessionDidChangeConnectionStatus:(int64_t)a3;
- (void)sessionDidReceiveData:(id)a3;
- (void)setAssertionManager:(id)a3;
- (void)setCardFileManager:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setNotificationManager:(id)a3;
- (void)setSecureElement:(id)a3;
- (void)setWebServiceCoordinator:(id)a3;
- (void)signData:(id)a3 auth:(id)a4 bundleIdentifier:(id)a5 nonce:(id)a6 credential:(id)a7 completion:(id)a8;
- (void)startVehicleConnectionSessionWithPassUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)trackSharedCredential:(id)a3 withCompletion:(id)a4;
- (void)unregisterObserver:(id)a3;
- (void)updateCredential:(id)a3 forPaymentApplication:(id)a4 rangingSuspensionReasons:(unint64_t)a5;
- (void)updateMetadataOnPassWithIdentifier:(id)a3 credential:(id)a4 completion:(id)a5;
- (void)updateSubcredentialsForBluetoothPowerChange;
@end

@implementation PDAppletSubcredentialManager

- (void)registerObserver:(id)a3
{
  if (a3)
  {
    p_observersLock = &self->_observersLock;
    id v5 = a3;
    os_unfair_lock_lock(p_observersLock);
    [(NSHashTable *)self->_observers addObject:v5];

    os_unfair_lock_unlock(p_observersLock);
  }
}

- (PDAppletSubcredentialManager)initWithDatabaseManager:(id)a3 cardFileManager:(id)a4 paymentWebServiceCoordinator:(id)a5 daManager:(id)a6 carKeyRequirementsChecker:(id)a7 secureElement:(id)a8 assertionManager:(id)a9 notificationManager:(id)a10
{
  id v33 = a3;
  id v32 = a4;
  id v31 = a5;
  id v30 = a6;
  id v29 = a7;
  id v28 = a8;
  id v27 = a9;
  id v17 = a10;
  v36.receiver = self;
  v36.super_class = (Class)PDAppletSubcredentialManager;
  v18 = [(PDAppletSubcredentialManager *)&v36 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_daManager, a6);
    objc_storeStrong((id *)&v19->_carKeyRequirementsChecker, a7);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.passkit.credentialmanager", 0);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v20;

    uint64_t v22 = +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality];
    observers = v19->_observers;
    v19->_observers = (NSHashTable *)v22;

    v19->_observersLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v19->_databaseManager, a3);
    objc_storeStrong((id *)&v19->_cardFileManager, a4);
    objc_storeStrong((id *)&v19->_webServiceCoordinator, a5);
    objc_storeStrong((id *)&v19->_secureElement, a8);
    objc_storeStrong((id *)&v19->_assertionManager, a9);
    objc_storeStrong((id *)&v19->_notificationManager, a10);
    [(PDPaymentWebServiceCoordinator *)v19->_webServiceCoordinator registerObserver:v19];
    [(PDAssertionManager *)v19->_assertionManager registerObserver:v19];
    PDNFSecureXPCRegisterAccessKeyEventObserver(v19);
    v24 = PDUtilityQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001A613C;
    block[3] = &unk_10072E1E8;
    v35 = v19;
    dispatch_block_t v25 = dispatch_block_create(DISPATCH_BLOCK_NO_QOS_CLASS|DISPATCH_BLOCK_DETACHED, block);
    dispatch_async(v24, v25);
  }
  return v19;
}

- (void)dealloc
{
  PDNFSecureXPCUnregisterCarKeyEventObserver(self);
  [(PDAssertionManager *)self->_assertionManager unregisterObserver:self];
  [(PDPaymentWebServiceCoordinator *)self->_webServiceCoordinator unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PDAppletSubcredentialManager;
  [(PDAppletSubcredentialManager *)&v3 dealloc];
}

- (id)sharedCredentialManifestForPass:(id)a3
{
  id v4 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = [v4 devicePaymentApplications];
  id v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v30;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = [*(id *)(*((void *)&v29 + 1) + 8 * i) subcredentials];
        id v10 = [v9 count];

        if (v10)
        {

          v11 = [v4 dataAccessor];
          v12 = [(PKSecureElement *)self->_secureElement secureElementIdentifiers];
          id v5 = [v11 remoteAssetManagerForSEIDs:v12];

          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          v13 = [v5 deviceSpecificItems];
          id v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v14)
          {
            id v15 = v14;
            id v24 = v4;
            uint64_t v16 = *(void *)v26;
            uint64_t v17 = PKSharedCredentialsAssetName;
            while (2)
            {
              for (j = 0; j != v15; j = (char *)j + 1)
              {
                if (*(void *)v26 != v16) {
                  objc_enumerationMutation(v13);
                }
                v19 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
                dispatch_queue_t v20 = [v19 localURL];
                v21 = [v20 lastPathComponent];
                unsigned __int8 v22 = [v21 hasPrefix:v17];

                if (v22)
                {
                  id v6 = v19;

                  goto LABEL_20;
                }
              }
              id v15 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
              if (v15) {
                continue;
              }
              break;
            }
            id v6 = 0;
LABEL_20:
            id v4 = v24;
          }
          else
          {
            id v6 = 0;
          }

          goto LABEL_23;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_23:

  return v6;
}

- (void)updateMetadataOnPassWithIdentifier:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  v11 = PKLogFacilityTypeGetObject();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v8 && v9)
  {
    if (v12)
    {
      int v16 = 138412546;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updating credential metadata for pass (%@): %@", (uint8_t *)&v16, 0x16u);
    }

    databaseManager = self->_databaseManager;
    id v14 = +[NSSet setWithObject:v9];
    BOOL v15 = [(PDDatabaseManager *)databaseManager updateAppletSubcredentials:v14];

    [(PDAppletSubcredentialManager *)self didUpdateCredential:v9 onPassWithIdentifier:v8];
    if (!v10) {
      goto LABEL_12;
    }
LABEL_11:
    v10[2](v10, (id)v15);
    goto LABEL_12;
  }
  if (v12)
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Invalid parameters to update credential metadata", (uint8_t *)&v16, 2u);
  }

  if (v10)
  {
    BOOL v15 = 0;
    goto LABEL_11;
  }
LABEL_12:
}

- (void)handlePaymentApplicationsAddedOrUpdatedOnPass:(id)a3 oldShares:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PDAppletSubcredentialManager *)self _ingestSEBlobsForPass:v6];
  [(PDAppletSubcredentialManager *)self _ingestSubcredentialConfigurationsForPass:v6];
  if ([v6 isCarKeyPass])
  {
    v41 = v6;
    v42 = v7;
    [v6 uniqueID];
    v40 = v39 = self;
    id v8 = -[PDDatabaseManager passSharesForPassUniqueIdentifier:](self->_databaseManager, "passSharesForPassUniqueIdentifier:");
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id obj = v8;
    id v10 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v59;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v59 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          BOOL v15 = [v14 credentialShares];
          id v16 = [v15 countByEnumeratingWithState:&v54 objects:v68 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v55;
            do
            {
              for (j = 0; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v55 != v18) {
                  objc_enumerationMutation(v15);
                }
                dispatch_queue_t v20 = *(void **)(*((void *)&v54 + 1) + 8 * (void)j);
                v21 = [v20 identifier];
                [v9 setObject:v20 forKeyedSubscript:v21];
              }
              id v17 = [v15 countByEnumeratingWithState:&v54 objects:v68 count:16];
            }
            while (v17);
          }
        }
        id v11 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
      }
      while (v11);
    }

    id v22 = objc_alloc_init((Class)NSMutableSet);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v43 = v42;
    id v23 = [v43 countByEnumeratingWithState:&v50 objects:v67 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v45 = *(void *)v51;
      do
      {
        for (k = 0; k != v24; k = (char *)k + 1)
        {
          if (*(void *)v51 != v45) {
            objc_enumerationMutation(v43);
          }
          long long v26 = *(void **)(*((void *)&v50 + 1) + 8 * (void)k);
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v27 = [v26 credentialShares];
          id v28 = [v27 countByEnumeratingWithState:&v46 objects:v66 count:16];
          if (v28)
          {
            id v29 = v28;
            uint64_t v30 = *(void *)v47;
            do
            {
              for (m = 0; m != v29; m = (char *)m + 1)
              {
                if (*(void *)v47 != v30) {
                  objc_enumerationMutation(v27);
                }
                long long v32 = *(void **)(*((void *)&v46 + 1) + 8 * (void)m);
                [v32 status];
                if ((PKShareStatusIsPendingVerification() & 1) == 0)
                {
                  id v33 = [v32 identifier];
                  v34 = [v9 objectForKeyedSubscript:v33];

                  if (!v34) {
                    [v22 addObject:v33];
                  }
                }
              }
              id v29 = [v27 countByEnumeratingWithState:&v46 objects:v66 count:16];
            }
            while (v29);
          }
        }
        id v24 = [v43 countByEnumeratingWithState:&v50 objects:v67 count:16];
      }
      while (v24);
    }

    id v6 = v41;
    v35 = [v41 devicePrimaryPaymentApplication];
    objc_super v36 = [v35 subcredentials];
    v37 = [v36 anyObject];

    if (v37 && [v22 count])
    {
      v38 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v63 = v22;
        __int16 v64 = 2112;
        v65 = v40;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Removing %@ credential shares for pass %@", buf, 0x16u);
      }

      [(PKDAManager *)v39->_daManager removeSharedCredentialsWithIdentifiers:v22 credential:v37 completion:0];
    }

    id v7 = v42;
  }
}

- (void)passAddedOrUpdated:(id)a3 oldPass:(id)a4 oldShares:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  [(PDAppletSubcredentialManager *)self handlePaymentApplicationsAddedOrUpdatedOnPass:v8 oldShares:a5];
  if ([v8 isCarKeyPass])
  {
    v40 = self;
    v42 = v8;
    id v10 = objc_alloc_init((Class)NSMutableSet);
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v41 = v9;
    id v11 = [v9 devicePaymentApplications];
    id v12 = [v11 countByEnumeratingWithState:&v60 objects:v67 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v61;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v61 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          id v17 = [v16 subcredentials];
          id v18 = [v17 countByEnumeratingWithState:&v56 objects:v66 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v57;
            do
            {
              for (j = 0; j != v19; j = (char *)j + 1)
              {
                if (*(void *)v57 != v20) {
                  objc_enumerationMutation(v17);
                }
                id v22 = *(void **)(*((void *)&v56 + 1) + 8 * (void)j);
                if ([v22 state] == (id)1)
                {
                  id v23 = [v22 identifier];
                  [v10 addObject:v23];
                }
              }
              id v19 = [v17 countByEnumeratingWithState:&v56 objects:v66 count:16];
            }
            while (v19);
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v60 objects:v67 count:16];
      }
      while (v13);
    }

    v39 = [v42 uniqueID];
    id v24 = objc_alloc_init((Class)NSMutableSet);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v25 = [v42 devicePaymentApplications];
    id v26 = [v25 countByEnumeratingWithState:&v52 objects:v65 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v53;
      do
      {
        for (k = 0; k != v27; k = (char *)k + 1)
        {
          if (*(void *)v53 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void **)(*((void *)&v52 + 1) + 8 * (void)k);
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v31 = objc_msgSend(v30, "subcredentials", v39);
          id v32 = [v31 countByEnumeratingWithState:&v48 objects:v64 count:16];
          if (v32)
          {
            id v33 = v32;
            uint64_t v34 = *(void *)v49;
            do
            {
              for (m = 0; m != v33; m = (char *)m + 1)
              {
                if (*(void *)v49 != v34) {
                  objc_enumerationMutation(v31);
                }
                [v24 addObject:*(void *)(*((void *)&v48 + 1) + 8 * (void)m)];
              }
              id v33 = [v31 countByEnumeratingWithState:&v48 objects:v64 count:16];
            }
            while (v33);
          }
        }
        id v27 = [v25 countByEnumeratingWithState:&v52 objects:v65 count:16];
      }
      while (v27);
    }

    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1001A6EE0;
    v43[3] = &unk_10072FF20;
    id v44 = v24;
    id v45 = v10;
    long long v46 = v40;
    id v47 = v39;
    id v36 = v39;
    id v37 = v10;
    id v38 = v24;
    [(PDAppletSubcredentialManager *)v40 _inflateSubcredentialsInDatabaseWithDeviceProperties:v38 withCompletion:v43];

    id v9 = v41;
    id v8 = v42;
  }
}

- (void)_ingestSEBlobsForPass:(id)a3
{
  id v4 = a3;
  id v5 = [(PKSecureElement *)self->_secureElement secureElementIdentifiers];
  id v6 = [v4 seBlobsForSecureElementIdentifiers:v5];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v6 objectForKey:v11];
        daManager = self->_daManager;
        uint64_t v14 = [v11 identifier];
        id v15 = [(PKDAManager *)daManager storeSEBlobForSubcredentialIdentifier:v14 seBlob:v12];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)_ingestSubcredentialConfigurationsForPass:(id)a3
{
  id v4 = a3;
  id v5 = [(PKSecureElement *)self->_secureElement secureElementIdentifiers];
  id v6 = [v4 subcredentialConfigurationForSecureElementIdentifiers:v5];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        daManager = self->_daManager;
        id v13 = [v6 objectForKey:v11];
        [(PKDAManager *)daManager updateCredentialConfigurationForCredential:v11 configuration:v13 completion:0];
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)revokeSubcredentials:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_daManager)
  {
    uint64_t v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Revoking credentials %@", buf, 0xCu);
    }

    id v10 = (void *)PDOSTransactionCreate("PDAppletSubcredentialManager.revoke");
    daManager = self->_daManager;
    id v12 = [v6 allObjects];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001A7494;
    v14[3] = &unk_1007346F0;
    id v15 = v10;
    id v16 = v8;
    id v13 = v10;
    [(PKDAManager *)daManager deleteCredentials:v12 completion:v14];
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)revokeSubcredentialsForIdentifiers:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  daManager = self->_daManager;
  if (daManager)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001A7588;
    v10[3] = &unk_100736918;
    id v11 = v7;
    [(PKDAManager *)daManager deleteCredentialsForIdentifiers:v6 completion:v10];
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)revokeSubcredentialsForReaderIdentifiers:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  daManager = self->_daManager;
  if (daManager)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001A767C;
    v10[3] = &unk_100736918;
    id v11 = v7;
    [(PKDAManager *)daManager deleteCredentialsForReaderIdentifiers:v6 completion:v10];
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)revokeSubcredentialForIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  daManager = self->_daManager;
  if (daManager)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001A7770;
    v10[3] = &unk_1007378B8;
    id v11 = v7;
    [(PKDAManager *)daManager deleteCredential:v6 completion:v10];
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)canAcceptInvitation:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (v7)
  {
    uint64_t v8 = (uint64_t)[v6 supportedRadioTechnologies];
    if (!v8)
    {
      uint64_t v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v55 = (uint64_t)v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Defaulting to NFC due to missing or invalid radioTechnologies for invitation: %@", buf, 0xCu);
      }

      uint64_t v8 = 1;
    }
    if (PKRadioTechnologyForConfigurationTechnology())
    {
      if ([(PDCarKeyRequirementsChecker *)self->_carKeyRequirementsChecker deviceSupportsCredentials])
      {
        id v10 = [v6 pairedReaderIdentifier];
        if (v10)
        {
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v36 = v10;
          id v11 = [(PDDatabaseManager *)self->_databaseManager passesWithPairedReaderIdentifier:v10];
          id v12 = [v11 countByEnumeratingWithState:&v37 objects:v49 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v38;
            while (2)
            {
              for (i = 0; i != v13; i = (char *)i + 1)
              {
                if (*(void *)v38 != v14) {
                  objc_enumerationMutation(v11);
                }
                id v16 = *(void **)(*((void *)&v37 + 1) + 8 * i);
                long long v17 = [v16 devicePrimaryPaymentApplication];
                id v18 = [v17 state];

                if (v18 != (id)10)
                {
                  uint64_t v24 = PKSubcredentialProvisioningErrorDomain;
                  NSErrorUserInfoKey v47 = NSDebugDescriptionErrorKey;
                  id v25 = objc_alloc((Class)NSString);
                  long long v19 = [v16 uniqueID];
                  id v26 = [v25 initWithFormat:@"Conflicting Pass with ID: %@", v19];
                  id v48 = v26;
                  id v27 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
                  uint64_t v28 = +[NSError errorWithDomain:v24 code:11 userInfo:v27];
                  v7[2](v7, v28);

                  id v10 = v36;
                  goto LABEL_30;
                }
              }
              id v13 = [v11 countByEnumeratingWithState:&v37 objects:v49 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }

          id v10 = v36;
        }
        if (![v6 type])
        {
          uint64_t v31 = [v6 identifier];
          if (v31)
          {
            id v11 = (void *)v31;
            id v32 = [(PDDatabaseManager *)self->_databaseManager invitationWithIdentifier:v31];

            if (!v32)
            {
              uint64_t v33 = PKSubcredentialProvisioningErrorDomain;
              NSErrorUserInfoKey v45 = NSDebugDescriptionErrorKey;
              CFStringRef v46 = @"No invitation with that identifier found";
              long long v19 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
              uint64_t v34 = +[NSError errorWithDomain:v33 code:15 userInfo:v19];
              v7[2](v7, v34);

              goto LABEL_30;
            }
            goto LABEL_20;
          }
          if (!v10)
          {
            uint64_t v35 = PKSubcredentialProvisioningErrorDomain;
            NSErrorUserInfoKey v43 = NSDebugDescriptionErrorKey;
            CFStringRef v44 = @"Invalid invitation: no invite id or reader id";
            id v11 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
            long long v19 = +[NSError errorWithDomain:v35 code:12 userInfo:v11];
LABEL_29:
            v7[2](v7, v19);
LABEL_30:

            goto LABEL_31;
          }
        }
        id v11 = 0;
LABEL_20:
        if ([(PDCarKeyRequirementsChecker *)self->_carKeyRequirementsChecker carAccessFeatureAvailable])
        {
          long long v19 = 0;
        }
        else
        {
          uint64_t v29 = PKSubcredentialProvisioningErrorDomain;
          NSErrorUserInfoKey v41 = NSDebugDescriptionErrorKey;
          CFStringRef v42 = @"Software not supported";
          uint64_t v30 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
          long long v19 = +[NSError errorWithDomain:v29 code:21 userInfo:v30];
        }
        goto LABEL_29;
      }
      uint64_t v21 = PKSubcredentialProvisioningErrorDomain;
      NSErrorUserInfoKey v50 = NSDebugDescriptionErrorKey;
      CFStringRef v51 = @"Hardware not supported";
      id v22 = &v51;
      id v23 = &v50;
    }
    else
    {
      uint64_t v20 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v55 = v8;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Device does not support the radio technologies %lu", buf, 0xCu);
      }

      uint64_t v21 = PKSubcredentialProvisioningErrorDomain;
      NSErrorUserInfoKey v52 = NSDebugDescriptionErrorKey;
      CFStringRef v53 = @"Radio technology not supported";
      id v22 = &v53;
      id v23 = &v52;
    }
    id v10 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v23 count:1];
    id v11 = +[NSError errorWithDomain:v21 code:20 userInfo:v10];
    v7[2](v7, v11);
LABEL_31:
  }
}

- (void)credentialsOnDeviceWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  daManager = self->_daManager;
  if (daManager)
  {
    id v6 = v4;
    -[PKDAManager listCredentialsWithCompletion:](daManager, "listCredentialsWithCompletion:");
  }
  else
  {
    if (!v4) {
      goto LABEL_6;
    }
    id v6 = v4;
    v4[2](v4, 0);
  }
  id v4 = v6;
LABEL_6:
}

- (void)requestRegistrationForCredentialWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempting to register credential: %@", buf, 0xCu);
  }

  uint64_t v9 = (void *)PDOSTransactionCreate("PDAppletSubcredentialManager.credential.register");
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1001A809C;
  v31[3] = &unk_10073C5D8;
  id v10 = v7;
  id v32 = v10;
  id v11 = objc_retainBlock(v31);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1001A80BC;
  v26[3] = &unk_10073C6A0;
  id v12 = v9;
  id v27 = v12;
  objc_copyWeak(&v30, &location);
  id v13 = v11;
  id v29 = v13;
  id v14 = v6;
  id v28 = v14;
  id v15 = objc_retainBlock(v26);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001A8744;
  v20[3] = &unk_10073C718;
  objc_copyWeak(&v25, &location);
  id v16 = v12;
  id v21 = v16;
  id v17 = v10;
  id v23 = v17;
  id v18 = v14;
  id v22 = v18;
  long long v19 = v15;
  id v24 = v19;
  [(PDAppletSubcredentialManager *)self createRegistrationRequestForCredentialWithIdentifier:v18 completion:v20];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v30);

  objc_destroyWeak(&location);
}

- (void)requestBackgroundRegistrationForCredentialWithIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001A8D0C;
  v5[3] = &unk_10073C740;
  objc_copyWeak(&v6, &location);
  [(PDAppletSubcredentialManager *)self createRegistrationRequestForCredentialWithIdentifier:v4 completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)passWillBeRemoved:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [v4 devicePaymentApplications];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) subcredentials];
        if ([v11 count])
        {
          if (v8) {
            [v8 unionSet:v11];
          }
          else {
            id v8 = [v11 mutableCopy];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  if ([v8 count])
  {
    webServiceCoordinator = self->_webServiceCoordinator;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001A8F30;
    v13[3] = &unk_10072F658;
    v13[4] = self;
    id v14 = v8;
    [(PDPaymentWebServiceCoordinator *)webServiceCoordinator performHandlerOnSharedWebServiceQueue:v13];
  }
}

- (void)restoreSubcredentialsInDatabase:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Restoring credentials in database: %@", buf, 0xCu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001A9064;
  v8[3] = &unk_10072E4F8;
  id v9 = v5;
  id v7 = v5;
  [(PDAppletSubcredentialManager *)self _inflateSubcredentialsInDatabaseWithDeviceProperties:v7 withCompletion:v8];
}

- (void)_inflateSubcredentialsInDatabaseWithDeviceProperties:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001A9228;
    v8[3] = &unk_1007368F0;
    id v9 = v6;
    id v10 = self;
    id v11 = v7;
    [(PDAppletSubcredentialManager *)self credentialsOnDeviceWithCompletion:v8];
  }
  else if (v7)
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
}

- (BOOL)addPassShare:(id)a3 onCredentialWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Adding share %@ on credential: %@", (uint8_t *)&v12, 0x16u);
  }

  id v9 = [(PDDatabaseManager *)self->_databaseManager passUniqueIdentifierWithCredentialIdentifier:v7];
  [(PDDatabaseManager *)self->_databaseManager addPassShare:v6 forPassUniqueIdentifier:v9];
  id v10 = [(PDDatabaseManager *)self->_databaseManager appletSubcredentialWithIdentifier:v7];
  [(PDAppletSubcredentialManager *)self didUpdateCredential:v10 onPassWithIdentifier:v9];

  return 1;
}

- (BOOL)sharingInvitationReceiptWasInvalidated:(id)a3 withCredentialIdentifier:(id)a4 error:(id)a5
{
  id v8 = a3;
  unint64_t v9 = (unint64_t)a4;
  unint64_t v10 = (unint64_t)a5;
  id v11 = (void *)v10;
  if (v8)
  {
    if (v9 | v10)
    {
      if (!v9 || v10)
      {
        id v15 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138412546;
          id v19 = v8;
          __int16 v20 = 2112;
          id v21 = v11;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Sharing invite (%@) failed or was declined: %@", (uint8_t *)&v18, 0x16u);
        }

        long long v16 = +[NSSet setWithObject:v8];
        BOOL v12 = [(PDAppletSubcredentialManager *)self removeSharingInvitationReceiptWithIdentifiers:v16 onCredential:v9];
      }
      else
      {
        BOOL v12 = [(PDAppletSubcredentialManager *)self createdSharedSubcredentialWithIdentifier:v9 fromSharingInvitationIdentifier:v8];
      }
    }
    else
    {
      __int16 v14 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
      }

      BOOL v12 = 1;
    }
  }
  else
  {
    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Invalidated recipient with no identifier.", (uint8_t *)&v18, 2u);
    }

    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)removeSharingInvitationReceiptWithIdentifiers:(id)a3 onCredential:(id)a4
{
  id v6 = a3;
  id v21 = a4;
  id v7 = -[PDDatabaseManager appletSubcredentialForSharedCredentialWithIdentifier:](self->_databaseManager, "appletSubcredentialForSharedCredentialWithIdentifier:");
  id v8 = [v7 identifier];
  unint64_t v9 = [(PDDatabaseManager *)self->_databaseManager passUniqueIdentifierWithCredentialIdentifier:v8];
  unint64_t v10 = [(PDDatabaseManager *)self->_databaseManager passSharesForPassUniqueIdentifier:v9];
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  databaseManager = self->_databaseManager;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1001A9AC8;
  v22[3] = &unk_10073A580;
  id v12 = v6;
  id v23 = v12;
  id v24 = self;
  id v25 = &v26;
  [(PDDatabaseManager *)databaseManager performTransactionWithBlock:v22];
  id v13 = [v12 count];
  __int16 v14 = (void *)v27[3];
  id v15 = PKLogFacilityTypeGetObject();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v9 && v7 && v14)
  {
    if (v16)
    {
      long long v17 = [v7 identifier];
      *(_DWORD *)buf = 134218754;
      uint64_t v31 = v14;
      __int16 v32 = 2048;
      id v33 = v13;
      __int16 v34 = 2112;
      id v35 = v17;
      __int16 v36 = 2112;
      id v37 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Removed %ld/%ld sharing invitation receipts from credential (%@): %@", buf, 0x2Au);
    }
    [(PDAppletSubcredentialManager *)self didUpdateCredential:v7 onPassWithIdentifier:v9 oldShares:v10];
  }
  else
  {
    if (v16)
    {
      int v18 = [v7 identifier];
      *(_DWORD *)buf = 138412546;
      uint64_t v31 = v18;
      __int16 v32 = 2112;
      id v33 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to remove sharing invitation receipts from credential (%@): %@", buf, 0x16u);
    }
  }
  BOOL v19 = v27[3] == (void)v13;

  _Block_object_dispose(&v26, 8);
  return v19;
}

- (BOOL)createdSharedSubcredentialWithIdentifier:(id)a3 fromSharingInvitationIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PDDatabaseManager *)self->_databaseManager appletSubcredentialForSharedCredentialWithIdentifier:v7];
  databaseManager = self->_databaseManager;
  unint64_t v10 = [v8 identifier];
  id v11 = [(PDDatabaseManager *)databaseManager passUniqueIdentifierFromAppletSubcredentialIdentifier:v10];

  id v12 = [(PDDatabaseManager *)self->_databaseManager passSharesForPassUniqueIdentifier:v11];
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_10002094C;
  __int16 v36 = sub_100020F98;
  id v37 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_10002094C;
  id v30 = sub_100020F98;
  id v31 = 0;
  id v13 = self->_databaseManager;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001A9F90;
  v21[3] = &unk_10073C768;
  id v24 = &v26;
  v21[4] = self;
  id v14 = v7;
  id v22 = v14;
  id v15 = v6;
  id v23 = v15;
  id v25 = &v32;
  [(PDDatabaseManager *)v13 performTransactionWithBlock:v21];
  BOOL v16 = (void *)v27[5];
  long long v17 = PKLogFacilityTypeGetObject();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      *(_DWORD *)buf = 138412546;
      id v39 = v15;
      __int16 v40 = 2112;
      id v41 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "RecipientKeyID %@ accepted invite. Share: %@", buf, 0x16u);
    }

    [(PDAppletSubcredentialManager *)self didUpdateCredential:v33[5] onPassWithIdentifier:v11 oldShares:v12];
  }
  else
  {
    if (v18)
    {
      *(_DWORD *)buf = 138412546;
      id v39 = v14;
      __int16 v40 = 2112;
      id v41 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Failed to create shared credential from invitationID %@ and ReceiptKeyID %@", buf, 0x16u);
    }
  }
  BOOL v19 = v27[5] != 0;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v19;
}

- (void)trackSharedCredential:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  if (PKV2SharingFlowEnabled())
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }

    v7[2](v7, 1);
    goto LABEL_29;
  }
  if (v6)
  {
    unint64_t v9 = [v6 identifier];
    unint64_t v10 = [(PDDatabaseManager *)self->_databaseManager passUniqueIdentifierFromAppletSubcredentialIdentifier:v9];
    id v11 = [(PDDatabaseManager *)self->_databaseManager passSharesForSubcredentialIdentifier:v9];
    id v12 = [v11 firstObject];

    if (v10)
    {
LABEL_20:
      BOOL v18 = [v6 trackingRequest];
      if (v18)
      {
        BOOL v19 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v30 = v9;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Tracking shared credential: %@", buf, 0xCu);
        }

        [(PDAppletSubcredentialManager *)self _trackCredential:v6 withRegistrationData:v18 completion:v7];
      }
      else
      {
        objc_initWeak(&location, self);
        __int16 v20 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v30 = v9;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Unable to track shared credential (%@) - missing tracking request", buf, 0xCu);
        }

        id v21 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v6, 0);
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_1001AA590;
        v25[3] = &unk_10073C7B8;
        objc_copyWeak(&v27, &location);
        uint64_t v26 = v7;
        [(PDAppletSubcredentialManager *)self revokeSubcredentials:v21 withCompletion:v25];

        os_unfair_lock_lock(&self->_observersLock);
        id v22 = [(NSHashTable *)self->_observers allObjects];
        os_unfair_lock_unlock(&self->_observersLock);
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_1001AA704;
        v23[3] = &unk_10073C7E0;
        v23[4] = self;
        id v24 = v6;
        [v22 enumerateObjectsUsingBlock:v23];

        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
      }

LABEL_28:
      goto LABEL_29;
    }
    if (v12 && ([v12 status], PKShareStatusIsPendingVerification()))
    {
      id v13 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:

        goto LABEL_20;
      }
      *(_DWORD *)buf = 138412290;
      id v30 = v9;
      id v14 = "Tracking credential with active share: %@";
    }
    else
    {
      BOOL v16 = [(PDAssertionManager *)self->_assertionManager assertionsOfType:1];

      id v13 = PKLogFacilityTypeGetObject();
      BOOL v17 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (!v16)
      {
        if (v17)
        {
          *(_DWORD *)buf = 138412290;
          id v30 = v9;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Failed to track unknown pass with credential identifier: %@", buf, 0xCu);
        }

        if (v7) {
          v7[2](v7, 0);
        }
        goto LABEL_28;
      }
      if (!v17) {
        goto LABEL_19;
      }
      *(_DWORD *)buf = 138412290;
      id v30 = v9;
      id v14 = "Tracking credential with no associated pass due to provisioning assertion: %@";
    }
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
    goto LABEL_19;
  }
  id v15 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Missing shared credential to track", buf, 2u);
  }

  if (v7) {
    v7[2](v7, 0);
  }
LABEL_29:
}

- (NSSet)invitations
{
  return (NSSet *)[(PDDatabaseManager *)self->_databaseManager invitations];
}

- (BOOL)didReceiveSharingInvitationWithIdentifier:(id)a3 fromOriginatorIDSHandle:(id)a4 sharingSessionIdentifier:(id)a5 metadata:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = [objc_alloc((Class)PKAppletSubcredentialSharingInvitation) initWithIdentifier:v10 sharingSessionIdentifier:v12 originatorIDSHandle:v13 invitationData:v11];

  id v15 = PKLogFacilityTypeGetObject();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (!v14)
  {
    if (v16)
    {
      int v20 = 138412290;
      id v21 = v10;
      BOOL v18 = "Received invialid sharing invitation with identifier: %@";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v20, 0xCu);
    }
LABEL_11:

    BOOL v17 = 0;
    goto LABEL_12;
  }
  if (v16)
  {
    int v20 = 138412290;
    id v21 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Received sharing invitation %@", (uint8_t *)&v20, 0xCu);
  }

  if (![(PDDatabaseManager *)self->_databaseManager addSharingInvitation:v14])
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v10;
      BOOL v18 = "Failed to add sharing invitation %@ to database";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  BOOL v17 = 1;
LABEL_12:

  return v17;
}

- (BOOL)removeSharingInvitationWithIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PDDatabaseManager *)self->_databaseManager deleteInvitationWithIdentifier:v4];
  id v6 = PKLogFacilityTypeGetObject();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v10 = 138412290;
      id v11 = v4;
      id v8 = "Removed sharing invitation %@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0xCu);
    }
  }
  else if (v7)
  {
    int v10 = 138412290;
    id v11 = v4;
    id v8 = "Unable to remove sharing invitation %@";
    goto LABEL_6;
  }

  return v5;
}

- (BOOL)didUpdateSharingInvitationWithIdentifier:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = PKSharingInvitationUpdateReasonToString();
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sharing invitation (%@) was update with reason: %@", (uint8_t *)&v11, 0x16u);
  }
  if ((unint64_t)a4 > 1) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = [(PDAppletSubcredentialManager *)self removeSharingInvitationWithIdentifier:v6];
  }

  return v9;
}

- (void)declineRelatedSharingInvitationsIfNecessary:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Declining invitations related to: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001AACC8;
  v11[3] = &unk_10073C880;
  objc_copyWeak(&v14, (id *)buf);
  id v9 = v7;
  id v13 = v9;
  id v10 = v6;
  id v12 = v10;
  [(PDAppletSubcredentialManager *)self canAcceptInvitation:v10 withCompletion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (BOOL)handleSharingInvitationRequest:(id)a3
{
  id v39 = a3;
  objc_super v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v54 = v39;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received sharing invitation request: %@", buf, 0xCu);
  }
  oslog = v3;

  long long v38 = [v39 credentialIdentifier];
  uint64_t v4 = [v39 sharedCredentialIdentifier];
  BOOL v5 = (void *)v4;
  if (v38 && v4)
  {
    if ([v39 deviceType])
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v6 = "Dropping sharing invitation request for unsupported device type.";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
    id v9 = [(PDDatabaseManager *)self->_databaseManager appletSubcredentialWithIdentifier:v38];
    uint64_t v32 = v9;
    if (v9)
    {
      if ([v9 canShare])
      {
        databaseManager = self->_databaseManager;
        int v11 = [v32 identifier];
        uint64_t v31 = [(PDDatabaseManager *)databaseManager passUniqueIdentifierWithCredentialIdentifier:v11];

        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id obj = [(PDDatabaseManager *)self->_databaseManager passSharesForPassUniqueIdentifier:v31];
        id v12 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
        if (!v12)
        {
LABEL_32:

          id v21 = oslog;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v54 = v39;
            _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "No known associated share found for invitation request: %@", buf, 0xCu);
          }
          goto LABEL_44;
        }
        uint64_t v35 = *(void *)v50;
LABEL_17:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v50 != v35) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v49 + 1) + 8 * v13);
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v15 = objc_msgSend(v14, "credentialShares", v31);
          id v16 = [v15 countByEnumeratingWithState:&v45 objects:v57 count:16];
          if (v16) {
            break;
          }
LABEL_28:

LABEL_30:
          if ((id)++v13 == v12)
          {
            id v12 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
            if (!v12) {
              goto LABEL_32;
            }
            goto LABEL_17;
          }
        }
        uint64_t v17 = *(void *)v46;
LABEL_22:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v46 != v17) {
            objc_enumerationMutation(v15);
          }
          BOOL v19 = [*(id *)(*((void *)&v45 + 1) + 8 * v18) identifier];
          char v20 = PKEqualObjects();

          if (v20) {
            break;
          }
          if (v16 == (id)++v18)
          {
            id v16 = [v15 countByEnumeratingWithState:&v45 objects:v57 count:16];
            if (v16) {
              goto LABEL_22;
            }
            goto LABEL_28;
          }
        }
        id v21 = v14;

        if (!v21) {
          goto LABEL_30;
        }

        [v21 status];
        if (PKShareStatusIsTerminal())
        {
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            long long v54 = v21;
            __int16 v55 = 2112;
            long long v56 = v39;
            _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Invalid state on associated shared credential (%@) for invitation request: %@", buf, 0x16u);
          }

LABEL_44:
          BOOL v7 = 0;
LABEL_55:

          objc_super v3 = v31;
          goto LABEL_56;
        }
        id v23 = [(PDCardFileManager *)self->_cardFileManager objectWithUniqueID:v31];
        id v24 = [v23 paymentPass];

        id v25 = [v21 sharedEntitlements];
        uint64_t v26 = [v25 firstObject];
        __int16 v36 = [v26 entitlementIdentifier];

        id v27 = [(PDDatabaseManager *)self->_databaseManager passEntitlementForIdentifier:v36 passIdentifier:v31];
        uint64_t v28 = +[PKAppletSubcredentialSharingInvitation invitationFromShare:v21 entitlement:v27 withCredential:v32 pass:v24];
        [v28 setForWatch:[v39 deviceType] == 0];
        uint64_t v29 = [v39 sharingSessionIdentifier];
        [v28 setSharingSessionIdentifier:v29];

        if (v28)
        {
          if (self->_daManager)
          {
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              long long v54 = v39;
              __int16 v55 = 2112;
              long long v56 = v28;
              _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Sharing invitation request (%@) to be fufilled with invite: %@", buf, 0x16u);
            }

            objc_initWeak((id *)buf, self);
            daManager = self->_daManager;
            v40[0] = _NSConcreteStackBlock;
            v40[1] = 3221225472;
            v40[2] = sub_1001ABB88;
            v40[3] = &unk_10073C8A8;
            objc_copyWeak(&v44, (id *)buf);
            id v41 = v21;
            CFStringRef v42 = v39;
            id v43 = v38;
            [(PKDAManager *)daManager sendSharingInvitation:v28 forInvitationRequest:v42 completion:v40];

            objc_destroyWeak(&v44);
            objc_destroyWeak((id *)buf);
            BOOL v7 = 1;
            goto LABEL_54;
          }
        }
        else
        {
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v54 = v21;
            _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Unable to create invite from existing share: %@", buf, 0xCu);
          }
        }
        BOOL v7 = 0;
LABEL_54:

        goto LABEL_55;
      }
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v54 = v39;
        id v22 = "Credential on sharing invitation request no longer can be shared: %@";
        goto LABEL_38;
      }
    }
    else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v54 = v39;
      id v22 = "Unknown credential on sharing invitation request: %@";
LABEL_38:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);
    }
    BOOL v7 = 0;
LABEL_56:

    objc_super v3 = v32;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v6 = "Dropping malformed sharing invitation request.";
    goto LABEL_10;
  }
LABEL_11:
  BOOL v7 = 0;
LABEL_12:

  return v7;
}

- (void)signData:(id)a3 auth:(id)a4 bundleIdentifier:(id)a5 nonce:(id)a6 credential:(id)a7 completion:(id)a8
{
}

- (void)startVehicleConnectionSessionWithPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void))a4;
  if (self->_activeVehicleConnectionSession)
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Requesting to start vehicle connection session with one already active.", buf, 2u);
    }

    goto LABEL_7;
  }
  if (![(PDAssertionManager *)self->_assertionManager hasAssertionsOfType:8])
  {
LABEL_7:
    v7[2](v7, 0);
    goto LABEL_8;
  }
  id v9 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v6];
  id v10 = [v9 secureElementPass];

  int v11 = [[PDVehicleConnectionSession alloc] initForSecureElementPass:v10 delegate:self];
  activeVehicleConnectionSession = self->_activeVehicleConnectionSession;
  self->_activeVehicleConnectionSession = v11;
  uint64_t v13 = v11;

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001ABF08;
  v14[3] = &unk_1007323E0;
  id v15 = v7;
  [(PDVehicleConnectionSession *)v13 startSessionWithCompletion:v14];

LABEL_8:
}

- (void)invalidateVehicleConnectionSessionForIdentifier:(id)a3
{
  activeVehicleConnectionSession = self->_activeVehicleConnectionSession;
  id v5 = a3;
  id v6 = [(PDVehicleConnectionSession *)activeVehicleConnectionSession sessionIdentifier];
  unsigned int v7 = [v6 isEqualToString:v5];

  if (v7)
  {
    [(PDVehicleConnectionSession *)self->_activeVehicleConnectionSession endSession];
    id v8 = self->_activeVehicleConnectionSession;
    self->_activeVehicleConnectionSession = 0;
  }
}

- (void)sendRKEPassThroughData:(id)a3 forSessionIdentifier:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, id, id))a5;
  activeVehicleConnectionSession = self->_activeVehicleConnectionSession;
  id v11 = a4;
  id v12 = [(PDVehicleConnectionSession *)activeVehicleConnectionSession sessionIdentifier];
  unsigned int v13 = [v12 isEqualToString:v11];

  if (v13)
  {
    id v14 = self->_activeVehicleConnectionSession;
    id v20 = 0;
    BOOL v15 = [(PDVehicleConnectionSession *)v14 sendData:v8 error:&v20];
    id v16 = v20;
    uint64_t v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [v16 description];
      *(_DWORD *)buf = 67109378;
      BOOL v22 = v15;
      __int16 v23 = 2112;
      id v24 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Passthrough message finished, %d, %@", buf, 0x12u);
    }
    if (v9) {
      v9[2](v9, (id)v15, v16);
    }
  }
  else if (v9)
  {
    BOOL v19 = +[NSError errorWithDomain:PKPassKitErrorDomain code:2 userInfo:0];
    v9[2](v9, 0, v19);
  }
}

- (void)unregisterObserver:(id)a3
{
  if (a3)
  {
    p_observersLock = &self->_observersLock;
    id v5 = a3;
    os_unfair_lock_lock(p_observersLock);
    [(NSHashTable *)self->_observers removeObject:v5];

    os_unfair_lock_unlock(p_observersLock);
  }
}

- (void)sessionDidChangeConnectionStatus:(int64_t)a3
{
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  id v6 = [(NSHashTable *)self->_observers allObjects];
  os_unfair_lock_unlock(p_observersLock);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001AC278;
  v7[3] = &unk_10073C8C8;
  v7[4] = a3;
  [v6 enumerateObjectsUsingBlock:v7];
}

- (void)sessionDidReceiveData:(id)a3
{
  id v4 = a3;
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  id v6 = [(NSHashTable *)self->_observers allObjects];
  os_unfair_lock_unlock(p_observersLock);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001AC3A0;
  v8[3] = &unk_10073C8F0;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:v8];
}

- (void)createRegistrationRequestForCredentialWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PDDatabaseManager *)self->_databaseManager appletSubcredentialWithIdentifier:v6];
  id v9 = PKLogFacilityTypeGetObject();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Creating background request to register credential: %@", buf, 0xCu);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001AC5AC;
    v11[3] = &unk_100737110;
    id v12 = v6;
    unsigned int v13 = self;
    id v14 = v8;
    id v15 = v7;
    [(PDAppletSubcredentialManager *)self credentialsOnDeviceWithCompletion:v11];

    id v9 = v12;
  }
  else if (v10)
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to register unknown credential: %@", buf, 0xCu);
  }
}

- (void)_trackCredential:(id)a3 withRegistrationData:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  webServiceCoordinator = self->_webServiceCoordinator;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001ACB00;
  v15[3] = &unk_10073C918;
  id v16 = v8;
  id v17 = v9;
  uint64_t v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(PDPaymentWebServiceCoordinator *)webServiceCoordinator performHandlerOnSharedWebServiceQueue:v15];
}

- (void)_removeBackgroundRegistrationRequestForCredentials:(id)a3 withPaymentWebService:(id)a4
{
  id v21 = a3;
  id v5 = a4;
  id v6 = [v5 backgroundContext];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = [v6 remainingTasks];
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (!v8) {
    goto LABEL_22;
  }
  id v9 = v8;
  char v20 = 0;
  uint64_t v10 = *(void *)v24;
  BOOL v22 = v7;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v24 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = [v12 unsignedIntegerValue];
        id v14 = [v6 backgroundDownloadRecordForTaskIdentifier:v13];
        if ([v14 taskType] == (id)5)
        {
          id v15 = [v14 credentialIdentifier];
          if (v15)
          {
            id v16 = [objc_alloc((Class)PKAppletSubcredential) initWithIdentifier:v15];
            id v17 = [v21 member:v16];

            if (v17)
            {
              uint64_t v18 = PKLogFacilityTypeGetObject();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v28 = v15;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Removing background registration request for credential with identifier: %@", buf, 0xCu);
              }

              [v6 removeBackgroundDownloadRecordForTaskIdentifier:v13];
              char v20 = 1;
            }
          }
          else
          {
            id v19 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Found background credential registration request with no identifier!", buf, 2u);
            }
          }
          id v7 = v22;
        }
      }
    }
    id v9 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
  }
  while (v9);

  if (v20)
  {
    id v7 = [v5 archiver];
    [v7 archiveBackgroundContext:v6];
LABEL_22:
  }
}

- (void)updateCredential:(id)a3 forPaymentApplication:(id)a4 rangingSuspensionReasons:(unint64_t)a5
{
}

- (void)didUpdateCredential:(id)a3 onPassWithIdentifier:(id)a4
{
}

- (void)didUpdateCredential:(id)a3 onPassWithIdentifier:(id)a4 oldShares:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && v9)
  {
    os_unfair_lock_lock(&self->_observersLock);
    id v11 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(&self->_observersLock);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001AD020;
    v12[3] = &unk_10073C940;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    [v11 enumerateObjectsUsingBlock:v12];
  }
}

- (void)_downloadPassAtURL:(id)a3 credentialIdentifier:(id)a4 share:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v28 = (void *)PDOSTransactionCreate("PDAppletSubcredentialManager.pass.download");
  id v11 = [(PDDatabaseManager *)self->_databaseManager passUniqueIdentifierWithCredentialIdentifier:v9];
  id v12 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v11];
  id v13 = [v12 secureElementPass];

  unsigned int v14 = [(PDAssertionManager *)self->_assertionManager hasAssertionsOfType:1];
  if (v10)
  {
    id v15 = [v10 activationOptions];
    unsigned int v16 = [v15 containsPinCode];
  }
  else
  {
    unsigned int v16 = 0;
  }
  if (v13) {
    unsigned int v17 = 0;
  }
  else {
    unsigned int v17 = v16;
  }
  if (v14) {
    unsigned int v18 = 0;
  }
  else {
    unsigned int v18 = v17;
  }
  id v19 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v20 = @"No";
    if (v14) {
      CFStringRef v21 = @"Yes";
    }
    else {
      CFStringRef v21 = @"No";
    }
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v9;
    if (v16) {
      CFStringRef v22 = @"Yes";
    }
    else {
      CFStringRef v22 = @"No";
    }
    *(void *)&buf[14] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(_WORD *)&buf[22] = 2112;
    if (v18) {
      CFStringRef v20 = @"Yes";
    }
    long long v51 = (uint64_t (*)(uint64_t, uint64_t))v22;
    LOWORD(v52) = 2112;
    *(void *)((char *)&v52 + 2) = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Downloading pass after credential (%@) registration. Has provisioning assertion?: %@. isBackgroundProvisioning?: %@. Enable Express?: %@", buf, 0x2Au);
  }

  id v23 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  long long v51 = sub_10002094C;
  *(void *)&long long v52 = sub_100020F98;
  *((void *)&v52 + 1) = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = sub_10002094C;
  v48[4] = sub_100020F98;
  id v49 = 0;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1001AD664;
  v46[3] = &unk_10073C968;
  char v47 = v18;
  v46[4] = self;
  v46[5] = v48;
  [v23 addOperation:v46];
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = sub_10002094C;
  v44[4] = sub_100020F98;
  id v45 = 0;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1001AD82C;
  v41[3] = &unk_100730730;
  v41[4] = self;
  id v24 = v8;
  id v42 = v24;
  id v43 = v44;
  [v23 addOperation:v41];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1001ADA9C;
  v40[3] = &unk_100736BF8;
  void v40[4] = self;
  v40[5] = v44;
  v40[6] = buf;
  [v23 addOperation:v40];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1001ADC44;
  v39[3] = &unk_100730D50;
  v39[4] = self;
  v39[5] = v44;
  [v23 addOperation:v39];
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  char v38 = 0;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1001ADD7C;
  v35[3] = &unk_10073CA30;
  char v36 = v18;
  v35[4] = self;
  v35[5] = v44;
  v35[6] = v37;
  [v23 addOperation:v35];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1001AE15C;
  v34[3] = &unk_10073CA58;
  v34[5] = v37;
  v34[6] = v44;
  v34[4] = self;
  [v23 addOperation:v34];
  long long v25 = +[NSNull null];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1001AE2A4;
  v29[3] = &unk_10073CA80;
  id v26 = v28;
  id v30 = v26;
  uint64_t v31 = self;
  uint64_t v32 = v48;
  id v33 = buf;
  id v27 = [v23 evaluateWithInput:v25 completion:v29];

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v44, 8);

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(buf, 8);
}

- (void)paymentWebServiceCoordinator:(id)a3 didRegisterCredentialWithIdentifier:(id)a4 response:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unsigned int v14 = v13;
  if (!v12 || v13)
  {
    id v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)char v38 = v11;
      *(_WORD *)&v38[8] = 2112;
      *(void *)&v38[10] = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to register credential (%@) with error: %@", buf, 0x16u);
    }
  }
  else
  {
    id v15 = [(PDDatabaseManager *)self->_databaseManager appletSubcredentialWithIdentifier:v11];
    unsigned int v16 = [(PDDatabaseManager *)self->_databaseManager passSharesForSubcredentialIdentifier:v11];
    unsigned int v17 = [v16 firstObject];

    if (v17 && !v15) {
      id v15 = [objc_alloc((Class)PKAppletSubcredential) initWithIdentifier:v11];
    }
    unsigned int v18 = [v12 passURL];
    id v19 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [v17 identifier];
      CFStringRef v21 = v18;
      CFStringRef v22 = (void *)v20;
      CFStringRef v23 = @"Yes";
      *(_DWORD *)buf = 138412802;
      *(void *)char v38 = v11;
      *(_WORD *)&v38[8] = 2112;
      if (!v21) {
        CFStringRef v23 = @"No";
      }
      *(void *)&v38[10] = v20;
      __int16 v39 = 2112;
      CFStringRef v40 = v23;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Received credential (%@) registration response. Share: %@ hasPassURL: %@", buf, 0x20u);

      unsigned int v18 = v21;
    }

    if (v15)
    {
      id v33 = v18;
      id v24 = [v12 credentialAttestation];
      if (v24)
      {
        uint64_t v31 = v17;
        id v32 = v10;
        long long v25 = (void *)PDOSTransactionCreate("PDAppletSubcredentialManager.register");
        id v26 = [v12 vehicleMobilizationEncryptedContainer];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v27 = [v15 isOnlineImmobilizerToken];
          CFStringRef v28 = @"Yes";
          if (!v26) {
            CFStringRef v28 = @"No";
          }
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)char v38 = v27;
          *(_WORD *)&v38[4] = 2112;
          *(void *)&v38[6] = v28;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Credential isOnlineImmobilizerToken (%d). Has encryptedContainer: %@", buf, 0x12u);
        }

        daManager = self->_daManager;
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_1001AE838;
        v34[3] = &unk_100737AC0;
        id v35 = v25;
        id v36 = v11;
        id v30 = v25;
        [(PKDAManager *)daManager updateTrackingAttestation:v24 forCredential:v15 encryptedContainer:v26 completion:v34];

        unsigned int v17 = v31;
        id v10 = v32;
      }
      else
      {
        id v26 = v19;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)char v38 = v11;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Credential (%@) registration response missing attestation", buf, 0xCu);
          id v26 = v19;
        }
      }

      unsigned int v18 = v33;
      if (v33)
      {
        [(PDAppletSubcredentialManager *)self _downloadPassAtURL:v33 credentialIdentifier:v11 share:v17];
      }
      else
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)char v38 = v11;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No pass to download after credential (%@) registration!", buf, 0xCu);
        }
      }
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)char v38 = v11;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Unable to register credential (%@): credential no longer exists", buf, 0xCu);
      }
      id v24 = v19;
    }
  }
}

- (void)updateSubcredentialsForBluetoothPowerChange
{
  BOOL v3 = [(PDCarKeyRequirementsChecker *)self->_carKeyRequirementsChecker deviceSupportsCredentials]&& [(PKBluetoothMonitorer *)self->_bluetoothMonitorer state] == (id)5;
  [(PDAppletSubcredentialManager *)self _updateSubcredentialsForBTEnabled:v3];
}

- (void)_updateSubcredentialsForBTEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  [(PDDatabaseManager *)self->_databaseManager passUniqueIDs];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v37;
    if (v3) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = 64;
    }
    uint64_t v25 = *(void *)v37;
    do
    {
      id v9 = 0;
      id v26 = v6;
      do
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v36 + 1) + 8 * (void)v9);
        id v12 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v10];
        id v13 = [v12 secureElementPass];
        unsigned int v14 = v13;
        if (v13 && ([v13 supportedRadioTechnologies] & 2) != 0)
        {
          uint64_t v29 = v12;
          id v30 = v11;
          uint64_t v31 = v9;
          CFStringRef v28 = v14;
          id v15 = [v14 devicePrimaryPaymentApplication];
          unsigned int v16 = [v15 subcredentials];
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id v17 = [v16 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v33;
            do
            {
              for (i = 0; i != v18; i = (char *)i + 1)
              {
                if (*(void *)v33 != v19) {
                  objc_enumerationMutation(v16);
                }
                CFStringRef v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                if (([v21 supportedRadioTechnologies] & 2) != 0)
                {
                  databaseManager = self->_databaseManager;
                  CFStringRef v23 = [v15 applicationIdentifier];
                  unint64_t v24 = [(PDDatabaseManager *)databaseManager rangingSuspensionReasonForAppletSubcredential:v21 forPaymentApplicationID:v23];

                  [(PDAppletSubcredentialManager *)self _setRangingSuspensionReason:v24 & 0xFFFFFFFFFFFFFFBFLL | v8 forCredential:v21 forPaymentApplication:v15];
                }
              }
              id v18 = [v16 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }
            while (v18);
          }

          uint64_t v7 = v25;
          id v6 = v26;
          id v11 = v30;
          id v9 = v31;
          unsigned int v14 = v28;
          id v12 = v29;
        }

        id v9 = (char *)v9 + 1;
      }
      while (v9 != v6);
      id v6 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v6);
  }
}

- (void)bluetoothMonitorerRecievedUpdatedBluetoothState:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) <= 3) {
    [(PDAppletSubcredentialManager *)self _updateSubcredentialsForBTEnabled:(((_BYTE)a3 - 2) & 0xF) == 3];
  }
}

- (void)rangingDidResumeForTerminalType:(int64_t)a3 forAppletIdentifier:(id)a4 keyIdentifier:(id)a5
{
  id v6 = a5;
  uint64_t v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Ranging resumed for credential (%@)", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v8 = [(PDDatabaseManager *)self->_databaseManager passUniqueIdentifierWithCredentialIdentifier:v6];
  id v9 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v8];
  uint64_t v10 = [v9 secureElementPass];

  id v11 = [v10 devicePrimaryPaymentApplication];
  id v12 = [v11 subcredentials];
  id v13 = [v12 anyObject];

  [(PDAppletSubcredentialManager *)self _setRangingSuspensionReason:0 forCredential:v13 forPaymentApplication:v11];
}

- (void)rangingDidSuspendForTerminalType:(int64_t)a3 withReasons:(unint64_t)a4 forAppletIdentifier:(id)a5 keyIdentifier:(id)a6
{
  id v8 = a6;
  id v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v8;
    __int16 v18 = 2048;
    unint64_t v19 = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Ranging suspended for credential (%@) for reasons (%lu)", (uint8_t *)&v16, 0x16u);
  }

  uint64_t v10 = [(PDDatabaseManager *)self->_databaseManager passUniqueIdentifierWithCredentialIdentifier:v8];
  id v11 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v10];
  id v12 = [v11 secureElementPass];

  id v13 = [v12 devicePrimaryPaymentApplication];
  int v14 = [v13 subcredentials];
  id v15 = [v14 anyObject];

  [(PDAppletSubcredentialManager *)self _setRangingSuspensionReason:a4 forCredential:v15 forPaymentApplication:v13];
}

- (void)_setRangingSuspensionReason:(unint64_t)a3 forCredential:(id)a4 forPaymentApplication:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v9 applicationIdentifier];
  databaseManager = self->_databaseManager;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001AEFB0;
  v15[3] = &unk_1007361E8;
  void v15[4] = self;
  id v16 = v8;
  id v18 = v9;
  unint64_t v19 = a3;
  id v17 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  [(PDDatabaseManager *)databaseManager performTransactionWithBlock:v15];
}

- (BOOL)interestedInAssertionOfType:(unint64_t)a3
{
  return a3 == 8;
}

- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3
{
  return a3 != 8 || self->_activeVehicleConnectionSession == 0;
}

- (void)assertionManager:(id)a3 didInvalidateAssertion:(id)a4
{
  if (objc_msgSend(a4, "type", a3) == (id)8)
  {
    [(PDVehicleConnectionSession *)self->_activeVehicleConnectionSession endSession];
    activeVehicleConnectionSession = self->_activeVehicleConnectionSession;
    self->_activeVehicleConnectionSession = 0;
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

- (PDAssertionManager)assertionManager
{
  return self->_assertionManager;
}

- (void)setAssertionManager:(id)a3
{
}

- (PDPaymentWebServiceCoordinator)webServiceCoordinator
{
  return self->_webServiceCoordinator;
}

- (void)setWebServiceCoordinator:(id)a3
{
}

- (PDUserNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (void)setNotificationManager:(id)a3
{
}

- (PKSecureElement)secureElement
{
  return self->_secureElement;
}

- (void)setSecureElement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_webServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_cardFileManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_activeVehicleConnectionSession, 0);
  objc_storeStrong((id *)&self->_bluetoothMonitorer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_carKeyRequirementsChecker, 0);
  objc_storeStrong((id *)&self->_daManager, 0);
}

@end