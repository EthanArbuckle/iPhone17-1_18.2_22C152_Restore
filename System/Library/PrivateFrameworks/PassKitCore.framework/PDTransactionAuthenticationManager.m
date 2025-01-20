@interface PDTransactionAuthenticationManager
- (BOOL)_supportsTransactionAuthenticationNotifications;
- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3;
- (BOOL)interestedInAssertionOfType:(unint64_t)a3;
- (PDTransactionAuthenticationManager)initWithDatabaseManager:(id)a3 auxiliaryCapabilityManager:(id)a4 notificationServiceCoordinator:(id)a5 userNotificationManager:(id)a6 transactionProcessor:(id)a7 assertionManager:(id)a8 pushNotificationManager:(id)a9;
- (id)_transactionAuthenticationResultsDataFromResult:(id)a3 outError:(id *)a4;
- (void)_collectTransactionSignatureForTransaction:(id)a3 completion:(id)a4;
- (void)_collectTransactionSignatureIfNecessaryAndSubmitResultForTransaction:(id)a3 sessionExchangeToken:(id)a4 completion:(id)a5;
- (void)_configureSigningCertificateForPass:(id)a3 withSigningCertificate:(id)a4;
- (void)_disableCriticalPushReliability;
- (void)_enableCriticalPushReliabilityForTransaction:(id)a3;
- (void)_performTransactionSignatureRequestForPass:(id)a3 withTransaction:(id)a4 completion:(id)a5;
- (void)_processLatestTransactionPendingUserNotification;
- (void)_startPaymentInformationEventExtensionForPass:(id)a3 completion:(id)a4;
- (void)_submitAuthenticationResult:(id)a3 forTransaction:(id)a4 pass:(id)a5 retryForInvalidCertificate:(BOOL)a6 sessionExchangeToken:(id)a7 completion:(id)a8;
- (void)_submitAuthenticationResultForTransaction:(id)a3 pass:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6;
- (void)assertionManager:(id)a3 didAcquireAssertion:(id)a4;
- (void)assertionManager:(id)a3 didInvalidateAssertion:(id)a4;
- (void)dealloc;
- (void)markAuthenticationCompleteForTransactionIdentifier:(id)a3 completion:(id)a4;
- (void)processedAuthenticationMechanism:(unint64_t)a3 forTransactionIdentifier:(id)a4 completion:(id)a5;
- (void)submitEncryptedPIN:(id)a3 forTransactionIdentifier:(id)a4 completion:(id)a5;
- (void)submitEncryptedPIN:(id)a3 forTransactionIdentifier:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6;
- (void)submitTransactionSignatureForTransactionIdentifier:(id)a3 sessionExchangeToken:(id)a4 completion:(id)a5;
- (void)submitUserConfirmation:(BOOL)a3 forTransactionIdentifier:(id)a4 completion:(id)a5;
- (void)submitUserConfirmation:(BOOL)a3 forTransactionIdentifier:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5;
- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4;
@end

@implementation PDTransactionAuthenticationManager

- (PDTransactionAuthenticationManager)initWithDatabaseManager:(id)a3 auxiliaryCapabilityManager:(id)a4 notificationServiceCoordinator:(id)a5 userNotificationManager:(id)a6 transactionProcessor:(id)a7 assertionManager:(id)a8 pushNotificationManager:(id)a9
{
  id v30 = a3;
  id v29 = a4;
  id v28 = a5;
  id v27 = a6;
  id v26 = a7;
  id v16 = a8;
  id v17 = a9;
  v31.receiver = self;
  v31.super_class = (Class)PDTransactionAuthenticationManager;
  v18 = [(PDTransactionAuthenticationManager *)&v31 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_databaseManager, a3);
    objc_storeStrong((id *)&v19->_auxiliaryCapabilityManager, a4);
    objc_storeStrong((id *)&v19->_notificationServiceCoordinator, a5);
    objc_storeStrong((id *)&v19->_userNotificationManager, a6);
    objc_storeStrong((id *)&v19->_paymentTransactionProcessor, a7);
    objc_storeStrong((id *)&v19->_assertionManager, a8);
    objc_storeStrong((id *)&v19->_pushNotificationManager, a9);
    v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    signTransactionCompletionsForTransactionIdentifier = v19->_signTransactionCompletionsForTransactionIdentifier;
    v19->_signTransactionCompletionsForTransactionIdentifier = v20;

    v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v23 = dispatch_queue_create("com.apple.passd.transactionauthenticationmanager", v22);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v23;

    if ([(PDTransactionAuthenticationManager *)v19 _supportsTransactionAuthenticationNotifications])
    {
      [(PDAssertionManager *)v19->_assertionManager registerObserver:v19];
    }
  }
  return v19;
}

- (void)dealloc
{
  if ([(PDTransactionAuthenticationManager *)self _supportsTransactionAuthenticationNotifications])
  {
    [(PDAssertionManager *)self->_assertionManager unregisterObserver:self];
  }
  v3.receiver = self;
  v3.super_class = (Class)PDTransactionAuthenticationManager;
  [(PDTransactionAuthenticationManager *)&v3 dealloc];
}

- (void)processedAuthenticationMechanism:(unint64_t)a3 forTransactionIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003AE6B0;
  v13[3] = &unk_100731AD8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)markAuthenticationCompleteForTransactionIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003AE7D8;
  block[3] = &unk_10072E9D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)submitUserConfirmation:(BOOL)a3 forTransactionIdentifier:(id)a4 completion:(id)a5
{
}

- (void)submitUserConfirmation:(BOOL)a3 forTransactionIdentifier:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003AE93C;
  block[3] = &unk_10072E3F0;
  block[4] = self;
  id v18 = v10;
  BOOL v21 = a3;
  id v19 = v11;
  id v20 = v12;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  dispatch_async(queue, block);
}

- (void)submitEncryptedPIN:(id)a3 forTransactionIdentifier:(id)a4 completion:(id)a5
{
}

- (void)submitEncryptedPIN:(id)a3 forTransactionIdentifier:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void (**)(void, void, void))v13;
  if (v10)
  {
    id v15 = [v10 asWebServiceDictionary];
    id v24 = 0;
    id v16 = +[NSJSONSerialization dataWithJSONObject:v15 options:0 error:&v24];
    id v17 = v24;

    if (v17)
    {
      if (v14) {
        ((void (**)(void, void, id))v14)[2](v14, 0, v17);
      }
    }
    else
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1003AED98;
      block[3] = &unk_100731F38;
      block[4] = self;
      id v16 = v16;
      id v20 = v16;
      id v21 = v11;
      id v22 = v12;
      dispatch_queue_t v23 = v14;
      dispatch_async(queue, block);
    }
    goto LABEL_9;
  }
  if (v13)
  {
    NSErrorUserInfoKey v25 = NSDebugDescriptionErrorKey;
    CFStringRef v26 = @"Encrypted PIN is nil.";
    id v17 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v16 = +[NSError errorWithDomain:PKPassKitErrorDomain code:1 userInfo:v17];
    ((void (**)(void, void, id))v14)[2](v14, 0, v16);
LABEL_9:
  }
}

- (void)submitTransactionSignatureForTransactionIdentifier:(id)a3 sessionExchangeToken:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1003AEF04;
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

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5
{
  id v6 = a4;
  if (([v6 updateReasonIsInitialDownload] & 1) == 0)
  {
    id v7 = [v6 authenticationContext];
    unint64_t v8 = (unint64_t)[v7 requestedAuthenticationMechanisms];
    unint64_t v9 = (unint64_t)[v7 processedAuthenticationMechanisms];
    id v10 = [v6 identifier];
    id v11 = [v6 transactionStatus];
    unint64_t v12 = v8 & ~v9;
    BOOL v19 = v11 == 0;
    char IsValid = PKTransactionAuthenticationMechanismIsValid();
    unsigned __int8 v14 = [v7 complete];
    unsigned __int8 v15 = [(PDTransactionAuthenticationManager *)self _supportsTransactionAuthenticationNotifications];
    char v16 = 0;
    if (!v11 && v12) {
      char v16 = IsValid & (v14 ^ 1);
    }
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003AF0F4;
    block[3] = &unk_10074DE00;
    char v25 = v16;
    unint64_t v23 = v12;
    block[4] = self;
    id v21 = v6;
    id v22 = v10;
    unsigned __int8 v26 = v15;
    unint64_t v24 = v8;
    BOOL v27 = v19;
    BOOL v28 = v12 != 0;
    char v29 = IsValid;
    unsigned __int8 v30 = v14;
    id v18 = v10;
    dispatch_async(queue, block);
  }
}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  id v6 = a4;
  if ([(PDTransactionAuthenticationManager *)self _supportsTransactionAuthenticationNotifications])
  {
    v5 = +[PDPassPaymentTransactionAuthenticationUserNotification notificationIdentifierForTransactionIdentifier:v6];
    [(PDUserNotificationManager *)self->_userNotificationManager removeUserNotificationWithIdentifier:v5];
  }
}

- (void)_enableCriticalPushReliabilityForTransaction:(id)a3
{
  v4 = [a3 identifier];
  if (v4)
  {
    criticalPushReliabilityTimer = self->_criticalPushReliabilityTimer;
    if (criticalPushReliabilityTimer)
    {
      dispatch_source_cancel(criticalPushReliabilityTimer);
      id v6 = self->_criticalPushReliabilityTimer;
      self->_criticalPushReliabilityTimer = 0;
    }
    id v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    unint64_t v8 = self->_criticalPushReliabilityTimer;
    self->_criticalPushReliabilityTimer = v7;

    unint64_t v9 = self->_criticalPushReliabilityTimer;
    dispatch_time_t v10 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    id v11 = self->_criticalPushReliabilityTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1003AF4C4;
    handler[3] = &unk_10072E1E8;
    handler[4] = self;
    dispatch_source_set_event_handler(v11, handler);
    if (!self->_criticalPushReliabilityEnabled)
    {
      [(PDPushNotificationManager *)self->_pushNotificationManager enableCriticalReliability];
      self->_criticalPushReliabilityEnabled = 1;
    }
    objc_storeStrong((id *)&self->_pushPendingTransactionIdentifier, v4);
    dispatch_resume((dispatch_object_t)self->_criticalPushReliabilityTimer);
  }
}

- (void)_disableCriticalPushReliability
{
  criticalPushReliabilityTimer = self->_criticalPushReliabilityTimer;
  if (criticalPushReliabilityTimer)
  {
    dispatch_source_cancel(criticalPushReliabilityTimer);
    v4 = self->_criticalPushReliabilityTimer;
    self->_criticalPushReliabilityTimer = 0;
  }
  if (self->_criticalPushReliabilityEnabled)
  {
    [(PDPushNotificationManager *)self->_pushNotificationManager disableCriticalReliability];
    self->_criticalPushReliabilityEnabled = 0;
  }
  pushPendingTransactionIdentifier = self->_pushPendingTransactionIdentifier;
  self->_pushPendingTransactionIdentifier = 0;
}

- (void)_collectTransactionSignatureForTransaction:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (v6)
  {
    unint64_t v8 = [v6 identifier];
    uint64_t v9 = [(NSMutableDictionary *)self->_signTransactionCompletionsForTransactionIdentifier objectForKey:v8];
    id v10 = (id)v9;
    if (!v9)
    {
      id v10 = objc_alloc_init((Class)NSMutableArray);
      [(NSMutableDictionary *)self->_signTransactionCompletionsForTransactionIdentifier setObject:v10 forKey:v8];
    }
    id v11 = objc_retainBlock(v7);
    [v10 safelyAddObject:v11];

    if (!v9)
    {
      databaseManager = self->_databaseManager;
      id v13 = [v6 transactionSourceIdentifier];
      unsigned __int8 v14 = [(PDDatabaseManager *)databaseManager passUniqueIdentifierForTransactionSourceIdentifier:v13];

      unsigned __int8 v15 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v14];
      char v16 = [v15 paymentPass];

      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1003AF788;
      v19[3] = &unk_10074DE68;
      id v20 = v16;
      id v21 = v6;
      id v22 = self;
      id v23 = v8;
      id v17 = v16;
      [(PDTransactionAuthenticationManager *)self _performTransactionSignatureRequestForPass:v17 withTransaction:v21 completion:v19];
    }
  }
  else
  {
    id v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No transaction to perform signature with", buf, 2u);
    }

    if (v7) {
      v7[2](v7);
    }
  }
}

- (void)_performTransactionSignatureRequestForPass:(id)a3 withTransaction:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1003AF9F0;
    v12[3] = &unk_10074DF08;
    v12[4] = self;
    id v15 = v10;
    id v13 = v8;
    id v14 = v9;
    [(PDTransactionAuthenticationManager *)self _startPaymentInformationEventExtensionForPass:v13 completion:v12];
  }
}

- (void)_startPaymentInformationEventExtensionForPass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [v6 associatedApplicationIdentifiers];
    id v9 = [v8 count];

    if (v9)
    {
      id v10 = +[PKExtensionProvider providerForExtensionPoint:PKExtensionPaymentInformationEventExtensionPointName];
      id v11 = [v6 associatedApplicationIdentifiers];
      unint64_t v12 = [v11 allObjects];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1003B040C;
      v14[3] = &unk_10072DFD8;
      v14[4] = self;
      id v15 = v7;
      [v10 extensionsWithContainingApplicationIdentifiers:v12 completion:v14];
    }
    else
    {
      NSErrorUserInfoKey v16 = NSDebugDescriptionErrorKey;
      CFStringRef v17 = @"No associated application for pass";
      id v10 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      id v13 = +[NSError errorWithDomain:PKPassKitErrorDomain code:1 userInfo:v10];
      (*((void (**)(id, void, void *, void))v7 + 2))(v7, 0, v13, 0);
    }
  }
}

- (BOOL)interestedInAssertionOfType:(unint64_t)a3
{
  return a3 == 4;
}

- (BOOL)allowAcquisitionOfAssertionOfType:(unint64_t)a3
{
  return 1;
}

- (void)assertionManager:(id)a3 didAcquireAssertion:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003B09C8;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)assertionManager:(id)a3 didInvalidateAssertion:(id)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003B0A4C;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_processLatestTransactionPendingUserNotification
{
  if (self->_userNotificationSuppressed) {
    return;
  }
  if (self->_resultSubmissionInProgress) {
    return;
  }
  latestTransactionPendingUserNotification = self->_latestTransactionPendingUserNotification;
  if (!latestTransactionPendingUserNotification) {
    return;
  }
  id v16 = [(PKPaymentTransaction *)latestTransactionPendingUserNotification identifier];
  v5 = -[PDDatabaseManager transactionWithTransactionIdentifier:](self->_databaseManager, "transactionWithTransactionIdentifier:");
  id v6 = [v5 authenticationContext];
  unint64_t v7 = (unint64_t)[v6 requestedAuthenticationMechanisms];
  if (![v5 transactionStatus]
    && PKTransactionAuthenticationMechanismIsValid()
    && ([v6 complete] & 1) == 0)
  {
    id v8 = [(PDDatabaseManager *)self->_databaseManager transactionAuthenticationResultForTransactionIdentifier:v16];
    unint64_t v9 = v7 & ~(unint64_t)[v6 processedAuthenticationMechanisms];
    if (v9)
    {
      id v10 = [v8 encryptedPIN];
      if (!v10) {
        goto LABEL_15;
      }
      v2 = v10;
      if ((v9 & 4) != 0) {
        goto LABEL_20;
      }
    }
    else if ((v9 & 4) != 0)
    {
LABEL_20:
      id v14 = [v8 userConfirmation];
      if (v14) {
        int v15 = (v9 >> 3) & 1;
      }
      else {
        int v15 = 1;
      }

      if (v9)
      {

        if ((v15 & 1) == 0) {
          goto LABEL_16;
        }
      }
      else if (!v15)
      {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
    if ((v9 & 8) == 0)
    {
LABEL_16:

      goto LABEL_17;
    }
LABEL_15:
    id v11 = [(PDDatabaseManager *)self->_databaseManager passUniqueIdentifierForTransactionWithIdentifier:v16];
    unint64_t v12 = [[PDPassPaymentTransactionAuthenticationUserNotification alloc] initWithPaymentTransaction:v5 forPassUniqueIdentifier:v11];
    [(PDUserNotification *)v12 setSuppressionBehavior:1];
    [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v12];
    [(PDDatabaseManager *)self->_databaseManager addProcessedAuthenticationMechanisms:v9 forTransactionIdentifier:v16];
    id v13 = self->_latestTransactionPendingUserNotification;
    self->_latestTransactionPendingUserNotification = 0;

    goto LABEL_16;
  }
LABEL_17:
}

- (BOOL)_supportsTransactionAuthenticationNotifications
{
  return 0;
}

- (void)_collectTransactionSignatureIfNecessaryAndSubmitResultForTransaction:(id)a3 sessionExchangeToken:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(void, void, void))v10;
  if (v8)
  {
    self->_resultSubmissionInProgress = 1;
    databaseManager = self->_databaseManager;
    id v13 = [v8 identifier];
    id v14 = [(PDDatabaseManager *)databaseManager transactionAuthenticationResultForTransactionIdentifier:v13];

    int v15 = self->_databaseManager;
    id v16 = [v8 transactionSourceIdentifier];
    CFStringRef v17 = [(PDDatabaseManager *)v15 passUniqueIdentifierForTransactionSourceIdentifier:v16];

    id v18 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v17];
    BOOL v19 = [v18 paymentPass];

    if ([v14 hasDataForAllRequestedAuthenticationMechanisms])
    {
      [(PDTransactionAuthenticationManager *)self _submitAuthenticationResultForTransaction:v8 pass:v19 sessionExchangeToken:v9 completion:v11];
    }
    else if (PKPaymentTransactionShouldAuthenticateForMechanism())
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1003B0F64;
      v22[3] = &unk_100731F38;
      v22[4] = self;
      id v23 = v8;
      id v24 = v19;
      id v25 = v9;
      unsigned __int8 v26 = v11;
      [(PDTransactionAuthenticationManager *)self _collectTransactionSignatureForTransaction:v23 completion:v22];
    }
    else
    {
      id v20 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = [v8 authenticationContext];
        *(_DWORD *)buf = 138412546;
        BOOL v28 = v14;
        __int16 v29 = 2112;
        unsigned __int8 v30 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Transaction authentication does not have results for all requested mechanisms. Not submitting authentication results %@ with context %@.", buf, 0x16u);
      }
      self->_resultSubmissionInProgress = 0;
      if (v11) {
        ((void (**)(void, id, void))v11)[2](v11, v8, 0);
      }
    }

    goto LABEL_13;
  }
  if (v10)
  {
    NSErrorUserInfoKey v31 = NSDebugDescriptionErrorKey;
    CFStringRef v32 = @"No transaction to submit transaction authentication result for.";
    id v14 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    CFStringRef v17 = +[NSError errorWithDomain:PKPassKitErrorDomain code:1 userInfo:v14];
    ((void (**)(void, void, void *))v11)[2](v11, 0, v17);
LABEL_13:
  }
}

- (void)_submitAuthenticationResultForTransaction:(id)a3 pass:(id)a4 sessionExchangeToken:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  id v23 = sub_1003B12F4;
  id v24 = &unk_10074DF58;
  id v25 = self;
  id v13 = a6;
  id v26 = v13;
  id v14 = objc_retainBlock(&v21);
  if (v10 && v11)
  {
    int v15 = objc_msgSend(v10, "authenticationContext", v21, v22, v23, v24, v25);
    id v16 = [v10 identifier];
    if ([v10 transactionStatus])
    {
      CFStringRef v17 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        [v10 transactionStatus];
        id v18 = PKPaymentTransactionStatusToString();
        *(_DWORD *)buf = 138412290;
        BOOL v28 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Transaction is not pending (%@). Not submitting authentication results.", buf, 0xCu);
      }
LABEL_11:

      ((void (*)(void ***, id, void))v14[2])(v14, v10, 0);
      goto LABEL_12;
    }
    if (![v15 requestedAuthenticationMechanisms]
      || [v15 requestedAuthenticationMechanisms] == (id)8)
    {
      CFStringRef v17 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Transaction does not have mechanisms needing submission. Not submitting authentication results.", buf, 2u);
      }
      goto LABEL_11;
    }
    BOOL v19 = [(PDDatabaseManager *)self->_databaseManager transactionAuthenticationResultForTransactionIdentifier:v16];
    if ([v19 hasDataForAllRequestedAuthenticationMechanisms])
    {
      [(PDTransactionAuthenticationManager *)self _submitAuthenticationResult:v19 forTransaction:v10 pass:v11 retryForInvalidCertificate:1 sessionExchangeToken:v12 completion:v14];
    }
    else
    {
      id v20 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        BOOL v28 = v19;
        __int16 v29 = 2112;
        unsigned __int8 v30 = v15;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Transaction authentication does not have results for all requested mechanisms. Not submitting authentication results %@ with context %@.", buf, 0x16u);
      }

      ((void (*)(void ***, id, void))v14[2])(v14, v10, 0);
    }
  }
  else
  {
    NSErrorUserInfoKey v31 = NSDebugDescriptionErrorKey;
    CFStringRef v32 = @"No pass or transction to submit authentication result for";
    int v15 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1, v21, v22, v23, v24, v25);
    id v16 = +[NSError errorWithDomain:PKPassKitErrorDomain code:1 userInfo:v15];
    ((void (*)(void ***, void, void *))v14[2])(v14, 0, v16);
  }
LABEL_12:
}

- (void)_submitAuthenticationResult:(id)a3 forTransaction:(id)a4 pass:(id)a5 retryForInvalidCertificate:(BOOL)a6 sessionExchangeToken:(id)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  CFStringRef v17 = (void (**)(id, void, id))a8;
  id v18 = [v15 uniqueID];
  uint64_t v19 = [v14 identifier];
  id v20 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v50 = v18;
    __int16 v51 = 2112;
    uint64_t v52 = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Submitting transaction authentication result for pass %@, transaction %@", buf, 0x16u);
  }
  v36 = (void *)v19;

  id v48 = 0;
  id v21 = [(PDTransactionAuthenticationManager *)self _transactionAuthenticationResultsDataFromResult:v13 outError:&v48];
  id v22 = v48;
  if (v22)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v50 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Failed to create transaction authentication data with error: %@. Not submitting authentication results.", buf, 0xCu);
    }

    if (v17) {
      v17[2](v17, 0, v22);
    }
  }
  else
  {
    CFStringRef v32 = [(PDDatabaseManager *)self->_databaseManager notificationServiceOfType:0 forPassWithUniqueIdentifier:v18];
    auxiliaryCapabilityManager = self->_auxiliaryCapabilityManager;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1003B16A8;
    v37[3] = &unk_10074E020;
    v37[4] = self;
    v46 = v17;
    id v38 = v21;
    id v39 = v15;
    id v40 = v14;
    id v41 = v32;
    id v42 = v36;
    id v43 = v18;
    BOOL v47 = a6;
    id v23 = v16;
    id v24 = v17;
    id v25 = v18;
    id v26 = v16;
    id v27 = v15;
    id v28 = v14;
    __int16 v29 = v13;
    id v30 = v23;
    id v44 = v23;
    id v45 = v29;
    id v35 = v32;
    id v31 = v30;
    id v13 = v29;
    id v14 = v28;
    id v15 = v27;
    id v16 = v26;
    id v18 = v25;
    CFStringRef v17 = v24;
    [(PDBarcodeCredentialManager *)auxiliaryCapabilityManager performDeviceSignatureWithData:v38 forPassUniqueIdentifier:v43 sessionExchangeToken:v31 withCompletion:v37];
  }
}

- (id)_transactionAuthenticationResultsDataFromResult:(id)a3 outError:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  unint64_t v7 = [v5 authenticationContext];
  unsigned __int8 v8 = [v7 requestedAuthenticationMechanisms];

  id v9 = [v5 encryptedPIN];
  id v10 = [v9 base64EncodedStringWithOptions:0];

  if (v10 && (v8 & 1) != 0)
  {
    v30[0] = @"authenticationMechanism";
    v30[1] = @"authenticationData";
    v31[0] = PKTransactionAuthenticationMechanismPaymentPINInputKey;
    v31[1] = v10;
    id v11 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
    [v6 addObject:v11];
  }
  id v12 = [v5 userConfirmation];
  id v13 = [v12 base64EncodedStringWithOptions:0];

  if (v13 && (v8 & 4) != 0)
  {
    v28[0] = @"authenticationMechanism";
    v28[1] = @"authenticationData";
    v29[0] = PKTransactionAuthenticationMechanismUserConfirmationKey;
    v29[1] = v13;
    id v14 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
    [v6 addObject:v14];
  }
  if ((v8 & 2) != 0)
  {
    id v16 = [v5 transactionDetailsSignature];
    CFStringRef v17 = v16;
    if (v16) {
      id v18 = v16;
    }
    else {
      id v18 = objc_alloc_init((Class)NSData);
    }
    uint64_t v19 = v18;

    id v15 = [v19 base64EncodedStringWithOptions:0];

    if (v15)
    {
      v26[0] = @"authenticationMechanism";
      v26[1] = @"authenticationData";
      v27[0] = PKTransactionAuthenticationMechanismTransactionDetailsSignatureKey;
      v27[1] = v15;
      id v20 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
      [v6 addObject:v20];
    }
  }
  else
  {
    id v15 = v13;
  }
  id v21 = [v6 copy];
  id v25 = 0;
  id v22 = +[NSJSONSerialization dataWithJSONObject:v21 options:0 error:&v25];
  id v23 = v25;

  if (a4) {
    *a4 = v23;
  }

  return v22;
}

- (void)_configureSigningCertificateForPass:(id)a3 withSigningCertificate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [v6 uniqueID];
  id v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Configuring signing certificate for pass %@", buf, 0xCu);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003B2570;
  v13[3] = &unk_10074E048;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  [(PDTransactionAuthenticationManager *)self _startPaymentInformationEventExtensionForPass:v11 completion:v13];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_signTransactionCompletionsForTransactionIdentifier, 0);
  objc_storeStrong((id *)&self->_latestTransactionPendingUserNotification, 0);
  objc_storeStrong((id *)&self->_pushPendingTransactionIdentifier, 0);
  objc_storeStrong((id *)&self->_criticalPushReliabilityTimer, 0);
  objc_storeStrong((id *)&self->_pushNotificationManager, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_paymentTransactionProcessor, 0);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
  objc_storeStrong((id *)&self->_notificationServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_auxiliaryCapabilityManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end