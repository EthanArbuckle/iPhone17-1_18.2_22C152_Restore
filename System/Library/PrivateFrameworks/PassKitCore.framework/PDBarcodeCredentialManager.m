@interface PDBarcodeCredentialManager
- (PDBarcodeCredentialManager)initWithDatabaseManager:(id)a3 paymentWebServiceCoordinator:(id)a4 pushNotificationManager:(id)a5 barcodeCertManager:(id)a6 auxiliaryCapabilityManager:(id)a7;
- (id)_decryptEncryptedDataObject:(id)a3 keyData:(id)a4 authorization:(id)a5 session:(id)a6 outError:(id *)a7;
- (id)_handleFetchBarcodeResponse:(id)a3 forPass:(id)a4 outStoredBarcodeCount:(unint64_t *)a5;
- (unint64_t)_barcodeCountLowWatermarkForPass:(id)a3;
- (unint64_t)_estimatedNumberOfBarcodesRequiredPerDayForPass:(id)a3;
- (unint64_t)_numberOfBarcodesToFetchForPass:(id)a3 fetchReason:(int64_t)a4;
- (void)_decryptBarcodeCredential:(id)a3 forPass:(id)a4 authorization:(id)a5 sessionExchangeToken:(id)a6 completion:(id)a7;
- (void)_disableCriticalPushReliability;
- (void)_enableCriticalPushReliabilityForBarcodeCredential:(id)a3;
- (void)_fetchBarcodesForPass:(id)a3 fetchReason:(int64_t)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6;
- (void)_performDeviceSignatureWithData:(id)a3 forPass:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6;
- (void)_removeAllKeysAndCertificatesForPass:(id)a3 session:(id)a4;
- (void)_removeCertificateForDeviceAccountIdentifier:(id)a3 withCertificateType:(int64_t)a4;
- (void)_retrieveDecryptedBarcodeCredentialForPass:(id)a3 authorization:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6;
- (void)_scheduleBackgroundFetchForPassUniqueID:(id)a3 withBackgroundFetchType:(int64_t)a4;
- (void)_setupBarcodeFetchScheduleIfNecessaryForPass:(id)a3;
- (void)_signData:(id)a3 withDeviceAccountIdentifier:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6;
- (void)_submitBarcodePaymentEvent:(id)a3 forPass:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6;
- (void)_unscheduleBackgroundFetchForPassUniqueID:(id)a3;
- (void)_updateBackgroundFetchScheduledActivityIfNecessary;
- (void)fetchBarcodesForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5;
- (void)invalidateCertificateOfType:(int64_t)a3 forPassUniqueIdentifier:(id)a4 withCompletion:(id)a5;
- (void)invalidateCertificatesForPassUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)nukeTasks;
- (void)passWillBeRemoved:(id)a3;
- (void)performDeviceSignatureWithData:(id)a3 forPassUniqueIdentifier:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)registeredPassForAuxiliaryCapabilityPass:(id)a3;
- (void)retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:(id)a3 authorization:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6;
- (void)retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:(id)a3 authorization:(id)a4 withCompletion:(id)a5;
- (void)retrievePINEncryptionCertificateForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5;
- (void)retrievePINEncryptionCertificateForPassUniqueIdentifier:(id)a3 withCompletion:(id)a4;
- (void)submitBarcodePaymentEvent:(id)a3 forPassUniqueIdentifier:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6;
- (void)submitBarcodePaymentEvent:(id)a3 forPassUniqueIdentifier:(id)a4 withCompletion:(id)a5;
- (void)task:(id)a3 encounteredError:(id)a4;
- (void)task:(id)a3 encounteredWarnings:(id)a4;
- (void)task:(id)a3 gotResult:(id)a4;
- (void)task:(id)a3 willRetryAfterMinimumDelay:(double)a4;
- (void)taskFailed:(id)a3;
- (void)taskSucceeded:(id)a3;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5;
@end

@implementation PDBarcodeCredentialManager

- (PDBarcodeCredentialManager)initWithDatabaseManager:(id)a3 paymentWebServiceCoordinator:(id)a4 pushNotificationManager:(id)a5 barcodeCertManager:(id)a6 auxiliaryCapabilityManager:(id)a7
{
  id v38 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v39.receiver = self;
  v39.super_class = (Class)PDBarcodeCredentialManager;
  v17 = [(PDBarcodeCredentialManager *)&v39 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_databaseManager, a3);
    objc_storeStrong((id *)&v18->_webServiceCoordinator, a4);
    objc_storeStrong((id *)&v18->_pushNotificationManager, a5);
    objc_storeStrong((id *)&v18->_barcodeCertManager, a6);
    objc_storeStrong((id *)&v18->_auxiliaryCapabilityManager, a7);
    v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    isRegisteringAuxiliaryCapabilityForPass = v18->_isRegisteringAuxiliaryCapabilityForPass;
    v18->_isRegisteringAuxiliaryCapabilityForPass = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    auxiliaryRegisterCompletionHandlersForPass = v18->_auxiliaryRegisterCompletionHandlersForPass;
    v18->_auxiliaryRegisterCompletionHandlersForPass = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    isFetchingBarcodesForPass = v18->_isFetchingBarcodesForPass;
    v18->_isFetchingBarcodesForPass = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    hasPendingHighPriorityFetchForPass = v18->_hasPendingHighPriorityFetchForPass;
    v18->_hasPendingHighPriorityFetchForPass = v25;

    v27 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    fetchBarcodeCompletionHandlersForPass = v18->_fetchBarcodeCompletionHandlersForPass;
    v18->_fetchBarcodeCompletionHandlersForPass = v27;

    v29 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    barcodeDecryptionAuthTokenForPass = v18->_barcodeDecryptionAuthTokenForPass;
    v18->_barcodeDecryptionAuthTokenForPass = v29;

    v31 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    retrieveDecryptedBarcodeCompletionHandlersForPass = v18->_retrieveDecryptedBarcodeCompletionHandlersForPass;
    v18->_retrieveDecryptedBarcodeCompletionHandlersForPass = v31;

    v33 = [[PDNetworkTaskManager alloc] initWithDelegate:v18 archiveName:@"AuxiliaryCapabilityTasks"];
    taskManager = v18->_taskManager;
    v18->_taskManager = v33;

    dispatch_queue_t v35 = dispatch_queue_create("com.apple.passd.auxiliarycapabilitymangager", 0);
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v35;

    PDScheduledActivityClientRegister();
  }

  return v18;
}

- (void)fetchBarcodesForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1003A6FD8;
  v15[3] = &unk_100730578;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:(id)a3 authorization:(id)a4 withCompletion:(id)a5
{
}

- (void)retrieveDecryptedBarcodeCredentialForPassUniqueIdentifier:(id)a3 authorization:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, const __CFString *, void *, void))a6;
  if (v13)
  {
    if (PKDisplaysTestBarcodeCredential())
    {
      id v14 = [@"test" dataUsingEncoding:4];
      v13[2](v13, @"test", v14, 0);
    }
    else
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1003A71B0;
      block[3] = &unk_100731F38;
      block[4] = self;
      id v17 = v10;
      id v18 = v11;
      id v19 = v12;
      v20 = v13;
      dispatch_async(queue, block);
    }
  }
}

- (void)retrievePINEncryptionCertificateForPassUniqueIdentifier:(id)a3 withCompletion:(id)a4
{
}

- (void)retrievePINEncryptionCertificateForPassUniqueIdentifier:(id)a3 sessionExchangeToken:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    queue = self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1003A7320;
    v12[3] = &unk_100730C10;
    v12[4] = self;
    id v13 = v8;
    id v15 = v10;
    id v14 = v9;
    dispatch_async(queue, v12);
  }
}

- (void)invalidateCertificateOfType:(int64_t)a3 forPassUniqueIdentifier:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003A7AF4;
  v13[3] = &unk_100731AD8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)invalidateCertificatesForPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003A7C54;
  block[3] = &unk_10072E9D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)performDeviceSignatureWithData:(id)a3 forPassUniqueIdentifier:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003A7E38;
    block[3] = &unk_100731F38;
    block[4] = self;
    id v16 = v11;
    id v17 = v10;
    id v18 = v12;
    id v19 = v13;
    dispatch_async(queue, block);
  }
}

- (void)submitBarcodePaymentEvent:(id)a3 forPassUniqueIdentifier:(id)a4 withCompletion:(id)a5
{
}

- (void)submitBarcodePaymentEvent:(id)a3 forPassUniqueIdentifier:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003A7FC8;
  block[3] = &unk_100731F38;
  block[4] = self;
  id v20 = v11;
  id v21 = v10;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v10;
  id v18 = v11;
  dispatch_async(queue, block);
}

- (void)passWillBeRemoved:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003A80D8;
  v7[3] = &unk_10072E198;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)nukeTasks
{
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5
{
  id v6 = a4;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003A8324;
  v9[3] = &unk_10072E198;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)_fetchBarcodesForPass:(id)a3 fetchReason:(int64_t)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (PKPassEligibleForBarcodePayment(v10))
  {
    id v13 = [v10 uniqueID];
    if (v12)
    {
      id v14 = [(NSMutableDictionary *)self->_fetchBarcodeCompletionHandlersForPass objectForKey:v13];
      if (!v14)
      {
        id v14 = objc_alloc_init((Class)NSMutableArray);
        [(NSMutableDictionary *)self->_fetchBarcodeCompletionHandlersForPass setObject:v14 forKey:v13];
      }
      id v15 = objc_retainBlock(v12);
      [v14 addObject:v15];
    }
    id v16 = [(NSMutableDictionary *)self->_isFetchingBarcodesForPass objectForKey:v13];
    unsigned int v17 = [v16 BOOLValue];

    if (v17)
    {
      if (a4 == 1) {
        [(NSMutableDictionary *)self->_hasPendingHighPriorityFetchForPass setObject:&__kCFBooleanTrue forKey:v13];
      }
    }
    else
    {
      [(NSMutableDictionary *)self->_isFetchingBarcodesForPass setObject:&__kCFBooleanTrue forKey:v13];
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_1003A894C;
      v52[3] = &unk_10074DA80;
      v52[4] = self;
      id v13 = v13;
      id v53 = v13;
      id v21 = v11;
      id v54 = v21;
      id v22 = v10;
      id v55 = v22;
      id v56 = v12;
      id v23 = objc_retainBlock(v52);
      v24 = [v22 deviceAccountIdentifier];
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_1003A8B84;
      v46[3] = &unk_10074DB48;
      v46[4] = self;
      id v33 = v22;
      id v47 = v33;
      int64_t v51 = a4;
      v34 = v23;
      id v50 = v34;
      id v25 = v24;
      id v48 = v25;
      id v26 = v21;
      id v49 = v26;
      v27 = objc_retainBlock(v46);
      uint64_t v40 = 0;
      v41 = &v40;
      uint64_t v42 = 0x3032000000;
      v43 = sub_100020D0C;
      v44 = sub_100021178;
      v28 = [(PDBarcodeCertificateManager *)self->_barcodeCertManager fetchCertificatesForDeviceAccountIdentifier:v25 withCertificateType:1];
      id v45 = [v28 firstObject];

      if (v41[5])
      {
        ((void (*)(void *))v27[2])(v27);
      }
      else
      {
        if (v26)
        {
          v29 = +[NSError errorWithDomain:PKAuxiliaryCapabilityErrorDomain code:2 userInfo:0];
          ((void (*)(void *, void, void *))v34[2])(v34, 0, v29);
        }
        else
        {
          v30 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            v31 = [v33 uniqueID];
            *(_DWORD *)buf = 138412290;
            v58 = v31;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Reregistering auxiliary registration due to missing certificates at barcode fetch for pass: %@", buf, 0xCu);
          }
          auxiliaryCapabilityManager = self->_auxiliaryCapabilityManager;
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_1003A96DC;
          v35[3] = &unk_10074DB70;
          objc_super v39 = &v40;
          v37 = v34;
          v35[4] = self;
          id v36 = v25;
          id v38 = v27;
          [(PDAuxiliaryCapabilityManager *)auxiliaryCapabilityManager registerAuxiliaryCapabilitiesForPass:v33 force:1 sessionExchangeToken:0 completion:v35];

          v29 = v37;
        }
      }
      _Block_object_dispose(&v40, 8);
    }
    goto LABEL_20;
  }
  if (v12)
  {
    id v18 = [v10 uniqueID];
    id v13 = +[NSString stringWithFormat:@"Pass not eligible for barcode payment: %@", v18];

    NSErrorUserInfoKey v59 = NSDebugDescriptionErrorKey;
    id v60 = v13;
    id v19 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
    id v20 = +[NSError errorWithDomain:PKPassKitErrorDomain code:1 userInfo:v19];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v20);

LABEL_20:
  }
}

- (void)_retrieveDecryptedBarcodeCredentialForPass:(id)a3 authorization:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v30 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = [v10 uniqueID];
    if (!PKPassEligibleForBarcodePayment(v10))
    {
      id v14 = +[NSString stringWithFormat:@"Pass not eligible for barcode payment: %@", v13];
      NSErrorUserInfoKey v50 = NSDebugDescriptionErrorKey;
      int64_t v51 = v14;
      id v15 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      id v16 = +[NSError errorWithDomain:PKPassKitErrorDomain code:1 userInfo:v15];
      (*((void (**)(id, void, void, void *))v12 + 2))(v12, 0, 0, v16);
    }
    [(NSMutableDictionary *)self->_barcodeDecryptionAuthTokenForPass setObject:v11 forKeyedSubscript:v13];
    id v17 = [(NSMutableDictionary *)self->_retrieveDecryptedBarcodeCompletionHandlersForPass objectForKeyedSubscript:v13];
    if (v17)
    {
      id v18 = objc_retainBlock(v12);
      [v17 addObject:v18];
    }
    else
    {
      id v19 = objc_alloc((Class)NSMutableArray);
      id v20 = objc_retainBlock(v12);
      id v17 = objc_msgSend(v19, "initWithObjects:", v20, 0);

      [(NSMutableDictionary *)self->_retrieveDecryptedBarcodeCompletionHandlersForPass setObject:v17 forKeyedSubscript:v13];
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_1003A9D94;
      v48[3] = &unk_10074DBC0;
      v48[4] = self;
      id v21 = v13;
      id v49 = v21;
      id v22 = objc_retainBlock(v48);
      id v23 = [v10 deviceAccountIdentifier];
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_1003A9ECC;
      v42[3] = &unk_10074DC10;
      v42[4] = self;
      id v43 = v21;
      id v24 = v10;
      id v44 = v24;
      id v25 = v30;
      id v45 = v25;
      v28 = v22;
      id v47 = v28;
      id v29 = v23;
      id v46 = v29;
      id v26 = objc_retainBlock(v42);
      uint64_t v36 = 0;
      v37 = &v36;
      uint64_t v38 = 0x3032000000;
      objc_super v39 = sub_100020D0C;
      uint64_t v40 = sub_100021178;
      id v41 = [(PDDatabaseManager *)self->_databaseManager firstValidBarcodeCredentialForDPANIdentifier:v29];
      if (v37[5])
      {
        ((void (*)(void *))v26[2])(v26);
      }
      else
      {
        if (v25)
        {
          v27 = +[NSError errorWithDomain:PKAuxiliaryCapabilityErrorDomain code:3 userInfo:0];
          ((void (*)(void *, void, void, void *))v28[2])(v28, 0, 0, v27);
        }
        else
        {
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_1003AA184;
          v31[3] = &unk_10074DC38;
          dispatch_queue_t v35 = &v36;
          v31[4] = self;
          id v32 = v29;
          id v33 = v26;
          v34 = v28;
          [(PDBarcodeCredentialManager *)self _fetchBarcodesForPass:v24 fetchReason:1 sessionExchangeToken:0 withCompletion:v31];
        }
        [(PDBarcodeCredentialManager *)self _updateBackgroundFetchScheduledActivityIfNecessary];
      }
      _Block_object_dispose(&v36, 8);
    }
  }
}

- (id)_handleFetchBarcodeResponse:(id)a3 forPass:(id)a4 outStoredBarcodeCount:(unint64_t *)a5
{
  id v8 = a4;
  barcodeCertManager = self->_barcodeCertManager;
  id v10 = a3;
  id v11 = [v8 deviceAccountIdentifier];
  id v12 = [(PDBarcodeCertificateManager *)barcodeCertManager publicKeyHashForCertificateType:1 deviceAccountIdentifier:v11];

  id v13 = [v10 barcodes];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1003AA648;
  v30[3] = &unk_10074DC60;
  id v14 = v12;
  id v31 = v14;
  id v15 = objc_msgSend(v13, "pk_objectsPassingTest:", v30);

  id v16 = [v10 barcodes];

  id v17 = [v16 count];
  id v18 = [v15 count];
  if (v17 != v18)
  {
    id v19 = v18;
    id v20 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v35 = v17;
      __int16 v36 = 2048;
      id v37 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Invalid barcodes in Fetch Barcode response: %lu returned, %lu valid.", buf, 0x16u);
    }
  }
  databaseManager = self->_databaseManager;
  id v22 = [v8 deviceAccountIdentifier];
  LOBYTE(databaseManager) = [(PDDatabaseManager *)databaseManager insertBarcodeCredentials:v15 forDPANIdentifier:v22];

  if (databaseManager)
  {
    if (!a5)
    {
      id v23 = 0;
      goto LABEL_13;
    }
LABEL_11:
    id v28 = [v15 count];
    id v23 = 0;
    goto LABEL_12;
  }
  id v24 = [v15 count];
  id v25 = [v8 uniqueID];
  id v26 = +[NSString stringWithFormat:@"Failed to insert %ld barcode credentials for pass %@", v24, v25];

  NSErrorUserInfoKey v32 = NSDebugDescriptionErrorKey;
  id v33 = v26;
  v27 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  id v23 = +[NSError errorWithDomain:PKPassKitErrorDomain code:-1 userInfo:v27];

  if (!a5) {
    goto LABEL_13;
  }
  if (!v23) {
    goto LABEL_11;
  }
  id v28 = 0;
LABEL_12:
  *a5 = (unint64_t)v28;
LABEL_13:

  return v23;
}

- (void)_decryptBarcodeCredential:(id)a3 forPass:(id)a4 authorization:(id)a5 sessionExchangeToken:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v16)
  {
    barcodeCertManager = self->_barcodeCertManager;
    id v18 = [v13 deviceAccountIdentifier];
    id v19 = [(PDBarcodeCertificateManager *)barcodeCertManager fetchKeyDataForDeviceAccountIdentifier:v18 withCertificateType:1];

    if (v19)
    {
      if (v15)
      {
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_1003AA9C8;
        v28[3] = &unk_10074DC88;
        v28[4] = self;
        id v29 = v12;
        id v30 = v19;
        id v31 = v14;
        id v32 = v16;
        +[PKSecureElement accessSecureElementManagerSessionWithSessionExchangeToken:v15 handler:v28];

LABEL_8:
        goto LABEL_9;
      }
      id v25 = [v12 value];
      id v27 = 0;
      id v21 = [(PDBarcodeCredentialManager *)self _decryptEncryptedDataObject:v25 keyData:v19 authorization:v14 session:0 outError:&v27];
      id v26 = v27;

      (*((void (**)(id, void *, id))v16 + 2))(v16, v21, v26);
    }
    else
    {
      id v20 = [v13 uniqueID];
      id v21 = +[NSString stringWithFormat:@"Failed to retrieve key data to decrypt barcode for pass: %@", v20];

      uint64_t v22 = PKAuxiliaryCapabilityErrorDomain;
      NSErrorUserInfoKey v33 = NSDebugDescriptionErrorKey;
      v34 = v21;
      id v23 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      id v24 = +[NSError errorWithDomain:v22 code:1 userInfo:v23];
      (*((void (**)(id, void, void *))v16 + 2))(v16, 0, v24);
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (unint64_t)_numberOfBarcodesToFetchForPass:(id)a3 fetchReason:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if ((unint64_t)(a4 - 1) < 2)
  {
    unint64_t v10 = vcvtpd_u64_f64((double)[(PDBarcodeCredentialManager *)self _estimatedNumberOfBarcodesRequiredPerDayForPass:v6]* 1.25);
    if (v10 <= 2) {
      unint64_t v9 = 2;
    }
    else {
      unint64_t v9 = v10;
    }
  }
  else if (a4 == 3)
  {
    unint64_t v9 = vcvtpd_u64_f64((double)[(PDBarcodeCredentialManager *)self _estimatedNumberOfBarcodesRequiredPerDayForPass:v6]* 1.25);
  }
  else if (a4)
  {
    unint64_t v9 = 0;
  }
  else
  {
    id v8 = [v6 barcodeSettings];
    unint64_t v9 = (unint64_t)[v8 initialBarcodeFetchCount];
  }
  return v9;
}

- (unint64_t)_barcodeCountLowWatermarkForPass:(id)a3
{
  return vcvtpd_u64_f64((double)[(PDBarcodeCredentialManager *)self _estimatedNumberOfBarcodesRequiredPerDayForPass:a3]* 0.25);
}

- (unint64_t)_estimatedNumberOfBarcodesRequiredPerDayForPass:(id)a3
{
  id v4 = a3;
  v5 = [v4 ingestedDate];
  id v6 = [v4 deviceAccountIdentifier];
  [v5 timeIntervalSinceNow];
  if (fabs(v7) >= 86400.0)
  {
    unint64_t v10 = +[NSDate dateWithTimeIntervalSinceNow:-1296000.0];
    id v8 = [v5 laterDate:v10];

    double v11 = (double)[(PDDatabaseManager *)self->_databaseManager numberOfBarcodeCredentialsDisplayedAfterDate:v8 forDPANIdentifier:v6];
    [v8 timeIntervalSinceNow];
    double v13 = ceil(v11 / fabs(v12) * 86400.0);
    databaseManager = self->_databaseManager;
    id v15 = +[NSDate dateWithTimeIntervalSinceNow:-86400.0];
    unint64_t v16 = [(PDDatabaseManager *)databaseManager numberOfBarcodeCredentialsDisplayedAfterDate:v15 forDPANIdentifier:v6];

    double v17 = (double)v16;
    if (v13 > (double)v16) {
      double v17 = v13;
    }
    unint64_t v9 = (unint64_t)v17;
  }
  else
  {
    id v8 = [v4 barcodeSettings];
    unint64_t v9 = (unint64_t)[v8 initialBarcodeFetchCount];
  }

  if (v9 >= 0x64) {
    unint64_t v9 = 100;
  }

  return v9;
}

- (void)_enableCriticalPushReliabilityForBarcodeCredential:(id)a3
{
  id v4 = [a3 identifier];
  if (v4)
  {
    criticalPushReliabilityTimer = self->_criticalPushReliabilityTimer;
    if (criticalPushReliabilityTimer)
    {
      dispatch_source_cancel(criticalPushReliabilityTimer);
      id v6 = self->_criticalPushReliabilityTimer;
      self->_criticalPushReliabilityTimer = 0;
    }
    double v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    id v8 = self->_criticalPushReliabilityTimer;
    self->_criticalPushReliabilityTimer = v7;

    unint64_t v9 = self->_criticalPushReliabilityTimer;
    dispatch_time_t v10 = dispatch_time(0, 30000000000);
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    double v11 = self->_criticalPushReliabilityTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1003AAF24;
    handler[3] = &unk_10072E1E8;
    handler[4] = self;
    dispatch_source_set_event_handler(v11, handler);
    if (!self->_criticalPushReliabilityEnabled)
    {
      [(PDPushNotificationManager *)self->_pushNotificationManager enableCriticalReliability];
      self->_criticalPushReliabilityEnabled = 1;
    }
    objc_storeStrong((id *)&self->_pushPendingBarcodeIdentifier, v4);
    dispatch_resume((dispatch_object_t)self->_criticalPushReliabilityTimer);
  }
}

- (void)_disableCriticalPushReliability
{
  criticalPushReliabilityTimer = self->_criticalPushReliabilityTimer;
  if (criticalPushReliabilityTimer)
  {
    dispatch_source_cancel(criticalPushReliabilityTimer);
    id v4 = self->_criticalPushReliabilityTimer;
    self->_criticalPushReliabilityTimer = 0;
  }
  if (self->_criticalPushReliabilityEnabled)
  {
    [(PDPushNotificationManager *)self->_pushNotificationManager disableCriticalReliability];
    self->_criticalPushReliabilityEnabled = 0;
  }
  pushPendingBarcodeIdentifier = self->_pushPendingBarcodeIdentifier;
  self->_pushPendingBarcodeIdentifier = 0;
}

- (void)_submitBarcodePaymentEvent:(id)a3 forPass:(id)a4 sessionExchangeToken:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  double v13 = (void (**)(void))a6;
  unsigned __int8 v14 = [v11 supportsBarcodePayment];
  if (v10 && (v14 & 1) != 0)
  {
    uint64_t v15 = [v11 deviceAccountIdentifier];
    id v28 = [v11 uniqueID];
    id v16 = objc_alloc_init((Class)LAContext);
    id v29 = v16;
    id v26 = (void *)v15;
    if ([v16 canEvaluatePolicy:1 error:0])
    {
      double v17 = [v16 evaluatedPolicyDomainState];
      id v18 = self;
      if (v17)
      {
        id v19 = [(PDDatabaseManager *)self->_databaseManager evaluatedPolicyDomainStateForDPANIdentifier:v15];
        unsigned int v20 = [v17 isEqualToData:v19] ^ 1;
        if (v19) {
          uint64_t v21 = v20;
        }
        else {
          uint64_t v21 = 0;
        }

        goto LABEL_15;
      }
    }
    else
    {
      id v18 = self;
      double v17 = 0;
    }
    uint64_t v21 = 0;
    LOBYTE(v20) = 0;
LABEL_15:
    [v10 setBiometricsChanged:v21];
    [v10 data];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1003AB284;
    v30[3] = &unk_10074DCB0;
    id v31 = v28;
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    id v33 = v10;
    id v34 = v11;
    id v35 = v18;
    char v39 = v20;
    id v36 = v17;
    id v37 = v26;
    uint64_t v38 = v13;
    id v27 = v26;
    id v23 = v17;
    id v24 = v32;
    id v25 = v28;
    [(PDBarcodeCredentialManager *)v18 _performDeviceSignatureWithData:v24 forPass:v34 sessionExchangeToken:v12 completion:v30];

    goto LABEL_16;
  }
  uint64_t v22 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Not submitting barcode event due to empty event data or ineligible pass.", buf, 2u);
  }

  if (v13) {
    v13[2](v13);
  }
LABEL_16:
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PDBarcodeCredentialManager: perform scheduled activity with activityIdentifier: %@", buf, 0xCu);
  }

  databaseManager = self->_databaseManager;
  id v10 = +[NSDate dateWithTimeIntervalSinceNow:600.0];
  id v11 = [(PDDatabaseManager *)databaseManager passesWithNextBackgroundFetchDateBeforeDate:v10];

  if ([v11 count])
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1003AB5A8;
    v12[3] = &unk_10074DD00;
    v12[4] = self;
    [v11 enumerateObjectsUsingBlock:v12];
  }
  else
  {
    [(PDBarcodeCredentialManager *)self _updateBackgroundFetchScheduledActivityIfNecessary];
  }
}

- (void)_setupBarcodeFetchScheduleIfNecessaryForPass:(id)a3
{
  id v4 = a3;
  v5 = [v4 uniqueID];
  if (PKPassEligibleForBarcodePayment(v4))
  {
    databaseManager = self->_databaseManager;
    uint64_t v8 = 0;
    if (![(PDDatabaseManager *)databaseManager hasBarcodeBackgroundFetchRecordForPassUniqueIdentifier:v5 nextBackgroundFetchDate:&v8])
    {
      [(PDBarcodeCredentialManager *)self _fetchBarcodesForPass:v4 fetchReason:0 sessionExchangeToken:0 withCompletion:&stru_10074DD40];
      uint64_t v7 = 1;
      goto LABEL_6;
    }
    if (!v8)
    {
      [(PDBarcodeCredentialManager *)self _fetchBarcodesForPass:v4 fetchReason:3 sessionExchangeToken:0 withCompletion:&stru_10074DD60];
      uint64_t v7 = 0;
LABEL_6:
      [(PDBarcodeCredentialManager *)self _scheduleBackgroundFetchForPassUniqueID:v5 withBackgroundFetchType:v7];
    }
  }
}

- (void)_scheduleBackgroundFetchForPassUniqueID:(id)a3 withBackgroundFetchType:(int64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 0:
      double v7 = 82800.0;
      goto LABEL_7;
    case 1:
      double v7 = (double)(arc4random() % 0x14370 + 1);
      goto LABEL_7;
    case 2:
      unint64_t v9 = +[NSDate dateWithTimeIntervalSinceNow:3600.0];
      uint64_t v8 = 1;
      break;
    case 3:
      double v7 = 60.0;
LABEL_7:
      unint64_t v9 = +[NSDate dateWithTimeIntervalSinceNow:v7];
      uint64_t v8 = 0;
      break;
    default:
      uint64_t v8 = 0;
      unint64_t v9 = 0;
      break;
  }
  [(PDDatabaseManager *)self->_databaseManager updateNextBarcodeBackgroundFetchDate:v9 withRetryLevel:v8 forPassUniqueIdentifier:v6];
  [(PDBarcodeCredentialManager *)self _updateBackgroundFetchScheduledActivityIfNecessary];
  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    [v9 timeIntervalSinceNow];
    int v12 = 134218498;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2048;
    int64_t v17 = a4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Background fetch scheduled %lf seconds later for pass: %@, background fetch type: %ld", (uint8_t *)&v12, 0x20u);
  }
}

- (void)_unscheduleBackgroundFetchForPassUniqueID:(id)a3
{
  id v4 = a3;
  [(PDDatabaseManager *)self->_databaseManager updateNextBarcodeBackgroundFetchDate:0 withRetryLevel:0 forPassUniqueIdentifier:v4];
  [(PDBarcodeCredentialManager *)self _updateBackgroundFetchScheduledActivityIfNecessary];
  v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unscheduling background barcode fetch for pass: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_updateBackgroundFetchScheduledActivityIfNecessary
{
  v2 = [(PDDatabaseManager *)self->_databaseManager nextBarcodeBackgroundFetchDate];
  v3 = PKLogFacilityTypeGetObject();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      [v2 timeIntervalSinceNow];
      int v7 = 134217984;
      uint64_t v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Scheduling next barcode background fetch %lf seconds from now", (uint8_t *)&v7, 0xCu);
    }

    int v6 = +[PDScheduledActivityCriteria priorityActivityCriteriaWithStartDate:v2];
    [v6 setRequireNetworkConnectivity:1];
    PDScheduledActivityRegister();
  }
  else
  {
    if (v4)
    {
      LOWORD(v7) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unscheduling barcode background fetch", (uint8_t *)&v7, 2u);
    }

    PDScheduledActivityRemove();
  }
}

- (void)task:(id)a3 gotResult:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Barcode event task %@, got response: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)task:(id)a3 willRetryAfterMinimumDelay:(double)a4
{
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = a3;
    __int16 v9 = 2048;
    double v10 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Barcode service task %@ will retry after %lf seconds", (uint8_t *)&v7, 0x16u);
  }
}

- (void)taskSucceeded:(id)a3
{
  BOOL v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Barcode service task %@ succeeded", (uint8_t *)&v5, 0xCu);
  }
}

- (void)taskFailed:(id)a3
{
  BOOL v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Barcode service task %@ failed", (uint8_t *)&v5, 0xCu);
  }
}

- (void)task:(id)a3 encounteredError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    __int16 v9 = [v8 passUniqueIdentifier];
    double v10 = [v7 domain];
    unsigned int v11 = [v10 isEqualToString:@"PDTaskErrorDomain"];

    if (v11)
    {
      if ([v7 code] == (id)40601)
      {
        [v8 setSignature:0];
        queue = self->_queue;
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_1003AC2B0;
        v14[3] = &unk_100730198;
        v14[4] = self;
        id v15 = v9;
        id v16 = v8;
        id v17 = v16;
        dispatch_async(queue, v14);
      }
      else
      {
        uint64_t v13 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v19 = v8;
          __int16 v20 = 2112;
          uint64_t v21 = v9;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Barcode event task %@ for pass %@, encountered unknown error.", buf, 0x16u);
        }
      }
    }
  }
}

- (void)task:(id)a3 encounteredWarnings:(id)a4
{
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = a3;
    __int16 v9 = 2112;
    id v10 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Barcode service task %@, encountered encountered warnings %@.", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_removeCertificateForDeviceAccountIdentifier:(id)a3 withCertificateType:(int64_t)a4
{
  id v6 = a3;
  -[PDBarcodeCertificateManager removeCertificateForDeviceAccountIdentifier:withCertificateType:](self->_barcodeCertManager, "removeCertificateForDeviceAccountIdentifier:withCertificateType:");
  if (a4 == 1) {
    [(PDDatabaseManager *)self->_databaseManager removeAllBarcodeCredentialValuesForDPANIdentifier:v6];
  }
}

- (void)_removeAllKeysAndCertificatesForPass:(id)a3 session:(id)a4
{
  id v6 = a4;
  id v7 = [a3 deviceAccountIdentifier];
  [(PDBarcodeCertificateManager *)self->_barcodeCertManager removeKeysAndCertificatesForDeviceAccountIdentifier:v7 withCertificateType:0 session:v6];
  [(PDBarcodeCertificateManager *)self->_barcodeCertManager removeKeysAndCertificatesForDeviceAccountIdentifier:v7 withCertificateType:1 session:v6];
  [(PDBarcodeCertificateManager *)self->_barcodeCertManager removeKeysAndCertificatesForDeviceAccountIdentifier:v7 withCertificateType:2 session:v6];
  [(PDBarcodeCertificateManager *)self->_barcodeCertManager removeKeysAndCertificatesForDeviceAccountIdentifier:v7 withCertificateType:3 session:v6];
}

- (id)_decryptEncryptedDataObject:(id)a3 keyData:(id)a4 authorization:(id)a5 session:(id)a6 outError:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v14)
  {
    id v15 = +[PKSecureElement primarySecureElementIdentifier];
    id v16 = [v11 ephemeralPublicKey];
    id v17 = SESKeyExchangeWithSession();
    id v18 = 0;
  }
  else
  {
    id v15 = [v11 ephemeralPublicKey];
    id v17 = SESKeyExchange();
    id v18 = 0;
  }
  id v32 = v13;

  if (v18)
  {
    id v19 = 0;
  }
  else
  {
    id v19 = SESKeyPublicKey();
    id v18 = 0;
    if (!v18) {
      goto LABEL_12;
    }
  }
  __int16 v20 = a7;
  uint64_t v21 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v18;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "SESKeyExchange / SESKeyPublicKey failed with error: %@", buf, 0xCu);
  }

  uint64_t v22 = PKDecryptionErrorDomain;
  NSErrorUserInfoKey v33 = NSDebugDescriptionErrorKey;
  CFStringRef v34 = @"Key exchange failed";
  id v23 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1, v32);
  id v24 = +[NSError errorWithDomain:v22 code:1 userInfo:v23];

  if (v24)
  {
    id v25 = 0;
    goto LABEL_13;
  }
  a7 = v20;
LABEL_12:
  __int16 v20 = a7;
  id v26 = objc_msgSend(v11, "ephemeralPublicKey", v32);
  id v27 = [v26 mutableCopy];

  [v27 appendData:v19];
  id v28 = [v27 copy];
  id v25 = PKECCV3PerformKDF();
  id v24 = 0;

  if (v24)
  {
LABEL_13:
    id v29 = 0;
    if (!v20) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  id v31 = [v11 data];
  id v29 = PKECCV3DecryptDataWithDerivedSharedSecret();
  id v24 = 0;

  if (v20) {
LABEL_14:
  }
    *__int16 v20 = v24;
LABEL_15:

  return v29;
}

- (void)_performDeviceSignatureWithData:(id)a3 forPass:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    id v14 = [v11 deviceAccountIdentifier];
    id v15 = [v11 uniqueID];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1003ACD9C;
    v18[3] = &unk_10074DDD8;
    v18[4] = self;
    id v19 = v14;
    id v20 = v12;
    id v21 = v15;
    id v22 = v11;
    id v23 = v10;
    id v24 = v13;
    id v16 = v15;
    id v17 = v14;
    [(PDBarcodeCredentialManager *)self _signData:v23 withDeviceAccountIdentifier:v17 sessionExchangeToken:v20 completion:v18];
  }
}

- (void)_signData:(id)a3 withDeviceAccountIdentifier:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  if (v13)
  {
    if (v10)
    {
      id v14 = [(PDBarcodeCertificateManager *)self->_barcodeCertManager fetchKeyDataForDeviceAccountIdentifier:v11 withCertificateType:0];
      id v15 = [(PDBarcodeCertificateManager *)self->_barcodeCertManager fetchCertificatesForDeviceAccountIdentifier:v11 withCertificateType:0];
      id v16 = v15;
      if (v14 && [v15 count])
      {
        CFErrorRef error = 0;
        SecAccessControlRef v17 = SecAccessControlCreateWithFlags(kCFAllocatorDefault, kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly, 0x40000000uLL, &error);
        SecAccessControlRef v18 = v17;
        id v19 = error;
        if (error)
        {
          if (v17)
          {
            CFRelease(v17);
            id v19 = error;
          }
          v13[2](v13, 0, v19);
        }
        else
        {
          CFStringRef v45 = @"osgn";
          id v46 = &__kCFBooleanTrue;
          id v19 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
          SecAccessControlSetConstraints();
          id v43 = &off_10078B8C8;
          CFStringRef v44 = @"Sign digest";
          uint64_t v24 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
          id v41 = 0;
          id v33 = objc_alloc_init((Class)LAContext);
          CFStringRef v34 = (void *)v24;
          id v25 = [v33 evaluateAccessControl:v18 operation:3 options:v24 error:&v41];
          id v26 = v41;
          if (v18) {
            CFRelease(v18);
          }
          if (v26)
          {
            v13[2](v13, 0, v26);
            id v27 = v33;
          }
          else
          {
            if (v12)
            {
              v35[0] = _NSConcreteStackBlock;
              v35[1] = 3221225472;
              v35[2] = sub_1003AD554;
              v35[3] = &unk_10074DC88;
              id v36 = v14;
              id v37 = v10;
              id v27 = v33;
              id v38 = v33;
              char v39 = self;
              uint64_t v40 = v13;
              +[PKSecureElement accessSecureElementManagerSessionWithSessionExchangeToken:v12 handler:v35];

              id v28 = v36;
            }
            else
            {
              id v31 = [v10 SHA256Hash];
              id v27 = v33;
              id v29 = [v33 externalizedContext];
              uint64_t v32 = SESKeySignPrecomputedDigest();
              id v30 = 0;

              v13[2](v13, v32, v30);
              id v28 = (void *)v32;
            }
          }
        }
      }
      else
      {
        uint64_t v20 = PKAuxiliaryCapabilityErrorDomain;
        NSErrorUserInfoKey v47 = NSDebugDescriptionErrorKey;
        CFStringRef v48 = @"Key data not found to sign the payload";
        id v21 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
        id v22 = +[NSError errorWithDomain:v20 code:1 userInfo:v21];
        v13[2](v13, 0, v22);
      }
    }
    else
    {
      uint64_t v23 = PKAuxiliaryCapabilityErrorDomain;
      NSErrorUserInfoKey v49 = NSDebugDescriptionErrorKey;
      CFStringRef v50 = @"No data to sign";
      id v14 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      id v16 = +[NSError errorWithDomain:v23 code:-1 userInfo:v14];
      v13[2](v13, 0, v16);
    }
  }
}

- (void)registeredPassForAuxiliaryCapabilityPass:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003AD80C;
  v7[3] = &unk_10072E198;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retrieveDecryptedBarcodeCompletionHandlersForPass, 0);
  objc_storeStrong((id *)&self->_barcodeDecryptionAuthTokenForPass, 0);
  objc_storeStrong((id *)&self->_fetchBarcodeCompletionHandlersForPass, 0);
  objc_storeStrong((id *)&self->_hasPendingHighPriorityFetchForPass, 0);
  objc_storeStrong((id *)&self->_isFetchingBarcodesForPass, 0);
  objc_storeStrong((id *)&self->_auxiliaryRegisterCompletionHandlersForPass, 0);
  objc_storeStrong((id *)&self->_isRegisteringAuxiliaryCapabilityForPass, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pushPendingBarcodeIdentifier, 0);
  objc_storeStrong((id *)&self->_criticalPushReliabilityTimer, 0);
  objc_storeStrong((id *)&self->_auxiliaryCapabilityManager, 0);
  objc_storeStrong((id *)&self->_barcodeCertManager, 0);
  objc_storeStrong((id *)&self->_taskManager, 0);
  objc_storeStrong((id *)&self->_pushNotificationManager, 0);
  objc_storeStrong((id *)&self->_webServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end