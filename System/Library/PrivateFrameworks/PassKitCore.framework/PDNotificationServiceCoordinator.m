@interface PDNotificationServiceCoordinator
- (BOOL)_processMessageDictionary:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 performTruncation:(BOOL)a6;
- (BOOL)_processTransactionDictionary:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 performTruncation:(BOOL)a6 isInitialUpdate:(BOOL)a7;
- (BOOL)_validateBalanceResult:(id)a3;
- (BOOL)_validatePlanResult:(id)a3;
- (PDNotificationServiceCoordinator)initWithPushNotificationManager:(id)a3 databaseManager:(id)a4 userNotificationManager:(id)a5 paymentTransactionProcessor:(id)a6 paymentWebServiceCoordinator:(id)a7;
- (PDPassTileManager)passTileManager;
- (id)_dictionaryKeyForTask:(id)a3;
- (id)_partnerAccountIdentifierWithPaymentApplication:(id)a3 passUniqueIdentifier:(id)a4;
- (id)_updatePaymentTransaction:(id)a3 withPassUniqueIdentifier:(id)a4 forPaymentApplication:(id)a5 insertionMode:(unint64_t)a6 performTruncation:(BOOL)a7;
- (id)pushNotificationTopics;
- (void)_cancelAllTasksForPaymentApplication:(id)a3 notificationService:(id)a4;
- (void)_clearStoredDataForPassUniqueIdentifier:(id)a3 notificationService:(id)a4;
- (void)_invokeAndClearHandlerForTask:(id)a3 withResult:(BOOL)a4;
- (void)_isMerchantTokenTransaction:(id)a3 forPass:(id)a4 completion:(id)a5;
- (void)_notificationUpdatesTaskSucceeded:(id)a3 withResult:(id)a4;
- (void)_performDeregistrationForPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 notificationService:(id)a5;
- (void)_performRegistrationForPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 notificationService:(id)a5 isInitialRegistration:(BOOL)a6;
- (void)_performRegistrationTaskForPaymentApplication:(id)a3 notificationService:(id)a4 completionTask:(id)a5;
- (void)_recalculatePushTopics;
- (void)_registrationTaskSucceeded:(id)a3 withAuthenticationToken:(id)a4;
- (void)_transactionAuthenticationTaskSucceeded:(id)a3 withResponse:(id)a4;
- (void)_updateRegistrationStatusForPass:(id)a3 notificationService:(id)a4 requestedRegistrationStatus:(unint64_t)a5 refreshRegistrationIfPossible:(BOOL)a6;
- (void)_updateRegistrationStatusForPass:(id)a3 notificationService:(id)a4 requestedRegistrationStatus:(unint64_t)a5 refreshRegistrationIfPossible:(BOOL)a6 requestUpdateWhenAlreadyRegistered:(BOOL)a7;
- (void)applyPushNotificationToken:(id)a3;
- (void)cancelAutoTopUpFromNotificationService:(id)a3 passUniqueIdenitifer:(id)a4 accountIdentifier:(id)a5 balance:(id)a6 completion:(id)a7;
- (void)connect;
- (void)dealloc;
- (void)handleDeletionOfPass:(id)a3 withNotificationService:(id)a4;
- (void)handleInsertionOfPass:(id)a3 withNotificationService:(id)a4;
- (void)handlePostBalanceTaskWithNotificationService:(id)a3 passUniqueIdenitifer:(id)a4 accountIdentifier:(id)a5 transactionSequenceNumber:(id)a6 balance:(id)a7;
- (void)handlePushDisabledForPass:(id)a3 withNotificationService:(id)a4;
- (void)handlePushEnabledForPass:(id)a3 withNotificationService:(id)a4;
- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4;
- (void)handleUpdateOfPass:(id)a3 toPass:(id)a4 oldNotificationService:(id)a5 newNotificationService:(id)a6;
- (void)nukeTasks;
- (void)removeLowBalanceNotificationForBalance:(id)a3 withPassUniqueIdentifier:(id)a4;
- (void)requestUpdatesFromNotificationService:(id)a3 passUniqueIdenitifer:(id)a4;
- (void)requestUpdatesFromNotificationService:(id)a3 passUniqueIdenitifer:(id)a4 forceUpdate:(BOOL)a5;
- (void)sendLowBalanceNotificationForBalance:(id)a3 withReminder:(id)a4 passUniqueIdentifier:(id)a5;
- (void)sendLowBalanceNotificationIfNecessaryForUpdatedBalances:(id)a3 startingBalances:(id)a4 passUniqueIdentifier:(id)a5;
- (void)setPassTileManager:(id)a3;
- (void)submitTransactionAuthenticationResultsData:(id)a3 signature:(id)a4 forPass:(id)a5 transactionServiceIdentifier:(id)a6 notificationService:(id)a7 completion:(id)a8;
- (void)task:(id)a3 encounteredError:(id)a4;
- (void)task:(id)a3 encounteredWarnings:(id)a4;
- (void)task:(id)a3 gotResult:(id)a4;
- (void)task:(id)a3 willRetryAfterMinimumDelay:(double)a4;
- (void)taskFailed:(id)a3;
- (void)taskRequestedReauthentication:(id)a3;
- (void)taskSucceeded:(id)a3;
- (void)updateLowBalanceNotificationForBalance:(id)a3 withPassUniqueIdentifier:(id)a4;
@end

@implementation PDNotificationServiceCoordinator

- (PDNotificationServiceCoordinator)initWithPushNotificationManager:(id)a3 databaseManager:(id)a4 userNotificationManager:(id)a5 paymentTransactionProcessor:(id)a6 paymentWebServiceCoordinator:(id)a7
{
  id v28 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)PDNotificationServiceCoordinator;
  v17 = [(PDNotificationServiceCoordinator *)&v29 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_pushNotificationManager, a3);
    objc_storeStrong((id *)&v18->_databaseManager, a4);
    objc_storeStrong((id *)&v18->_userNotificationManager, a5);
    objc_storeStrong((id *)&v18->_paymentTransactionProcessor, a6);
    objc_storeStrong((id *)&v18->_paymentWebServiceCoordinator, a7);
    v19 = (PKSecureElement *)objc_alloc_init((Class)PKSecureElement);
    secureElement = v18->_secureElement;
    v18->_secureElement = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    taskToHandlerMap = v18->_taskToHandlerMap;
    v18->_taskToHandlerMap = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    taskToResponseMap = v18->_taskToResponseMap;
    v18->_taskToResponseMap = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    taskToErrorMap = v18->_taskToErrorMap;
    v18->_taskToErrorMap = v25;

    [(PDDatabaseManager *)v18->_databaseManager setNotificationServicesDelegate:v18];
  }

  return v18;
}

- (void)dealloc
{
  [(PDPushNotificationManager *)self->_pushNotificationManager unregisterConsumer:self];
  [(PDDatabaseManager *)self->_databaseManager setNotificationServicesDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PDNotificationServiceCoordinator;
  [(PDNotificationServiceCoordinator *)&v3 dealloc];
}

- (void)connect
{
  [(PDPushNotificationManager *)self->_pushNotificationManager registerConsumer:self];
  if (!self->_taskManager)
  {
    objc_super v3 = [[PDNetworkTaskManager alloc] initWithDelegate:self archiveName:@"NotificationServiceTasks"];
    taskManager = self->_taskManager;
    self->_taskManager = v3;
    _objc_release_x1(v3, taskManager);
  }
}

- (void)nukeTasks
{
  objc_super v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removing all notification service tasks", v4, 2u);
  }

  [(PDNetworkTaskManager *)self->_taskManager nukeArchive];
}

- (void)applyPushNotificationToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(PDDatabaseManager *)self->_databaseManager notificationServices];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000A0248;
    v6[3] = &unk_100733200;
    id v7 = v4;
    v8 = self;
    [v5 enumerateObjectsUsingBlock:v6];
  }
}

- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v33 = a4;
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v56 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PDNotificationServiceCoordinator: processing push for topic %@.", buf, 0xCu);
  }

  v8 = +[NSNull null];
  v34 = v6;
  [(PDDatabaseManager *)self->_databaseManager notificationServicesForPushTopic:v6];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v38 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
  if (v38)
  {
    uint64_t v36 = *(void *)v51;
    v37 = v7;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v51 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = v9;
        v10 = *(void **)(*((void *)&v50 + 1) + 8 * v9);
        id v11 = objc_alloc_init((Class)NSMutableSet);
        v12 = [(PDDatabaseManager *)self->_databaseManager passesForNotificationService:v10];
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v13 = [v12 countByEnumeratingWithState:&v46 objects:v61 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v47;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v47 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              if ([v17 passType] == (id)1)
              {
                uint64_t v18 = [v17 partnerAccountIdentifier];
                v19 = (void *)v18;
                if (v18) {
                  v20 = (void *)v18;
                }
                else {
                  v20 = v8;
                }
                [v11 addObject:v20];
              }
              else
              {
                [v11 addObject:v8];
              }
            }
            id v14 = [v12 countByEnumeratingWithState:&v46 objects:v61 count:16];
          }
          while (v14);
        }
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v21 = [v12 count];
          v22 = [v10 serviceURL];
          *(_DWORD *)buf = 134218498;
          id v56 = v21;
          __int16 v57 = 2112;
          v58 = v12;
          __int16 v59 = 2112;
          v60 = v22;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PDNotificationServiceCoordinator: matched %lu passes (%@) for service url %@.", buf, 0x20u);
        }
        v39 = v12;

        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v23 = v11;
        id v24 = [v23 countByEnumeratingWithState:&v42 objects:v54 count:16];
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void *)v43;
          do
          {
            for (j = 0; j != v25; j = (char *)j + 1)
            {
              if (*(void *)v43 != v26) {
                objc_enumerationMutation(v23);
              }
              id v28 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
              if (v28 == v8) {
                id v28 = 0;
              }
              taskManager = self->_taskManager;
              id v30 = v28;
              v31 = +[PDNotificationServiceGetUpdatesTask getUpdatesTaskWithNotificationService:v10 accountIdentifier:v30];
              [(PDNetworkTaskManager *)taskManager performTask:v31];
            }
            id v25 = [v23 countByEnumeratingWithState:&v42 objects:v54 count:16];
          }
          while (v25);
        }

        uint64_t v9 = v41 + 1;
        id v7 = v37;
      }
      while ((id)(v41 + 1) != v38);
      id v38 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
    }
    while (v38);
  }
}

- (id)pushNotificationTopics
{
  if (!self->_pushTopics)
  {
    objc_super v3 = +[NSMutableSet set];
    id v4 = [(PDDatabaseManager *)self->_databaseManager notificationServices];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000A0964;
    v12[3] = &unk_100733200;
    v12[4] = self;
    v5 = v3;
    id v13 = v5;
    [v4 enumerateObjectsUsingBlock:v12];

    pushTopics = self->_pushTopics;
    self->_pushTopics = v5;
    id v7 = v5;
  }
  v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = self->_pushTopics;
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Enabled Notification Services Push Topics: %@", buf, 0xCu);
  }

  v10 = self->_pushTopics;
  return v10;
}

- (void)handlePushEnabledForPass:(id)a3 withNotificationService:(id)a4
{
}

- (void)handlePushDisabledForPass:(id)a3 withNotificationService:(id)a4
{
}

- (void)handleInsertionOfPass:(id)a3 withNotificationService:(id)a4
{
}

- (void)handleDeletionOfPass:(id)a3 withNotificationService:(id)a4
{
}

- (void)handleUpdateOfPass:(id)a3 toPass:(id)a4 oldNotificationService:(id)a5 newNotificationService:(id)a6
{
  id v25 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v11 && ([v11 matchesNotificationService:v12] & 1) == 0) {
    [(PDNotificationServiceCoordinator *)self _updateRegistrationStatusForPass:v25 notificationService:v11 requestedRegistrationStatus:2 refreshRegistrationIfPossible:0];
  }
  if (v12)
  {
    if ([v12 serviceType])
    {
      uint64_t v13 = 0;
    }
    else
    {
      id v14 = [v25 paymentPass];
      HIDWORD(v24) = [v14 supportsDPANNotifications];

      uint64_t v15 = [v25 paymentPass];
      LODWORD(v24) = [v15 supportsFPANNotifications];

      id v16 = [v10 paymentPass];
      LODWORD(v15) = [v16 supportsDPANNotifications];

      v17 = [v10 paymentPass];
      unsigned int v18 = [v17 supportsFPANNotifications];

      v19 = [v25 paymentPass];
      v20 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebService];
      unsigned int v21 = [v19 hasActiveVirtualCardAccordingToWebService:v20];

      v22 = [v10 paymentPass];
      id v23 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebService];
      LODWORD(v14) = [v22 hasActiveVirtualCardAccordingToWebService:v23];

      uint64_t v13 = HIDWORD(v24) ^ v15 | v24 ^ v18 | v14 & ~v21;
    }
    -[PDNotificationServiceCoordinator _updateRegistrationStatusForPass:notificationService:requestedRegistrationStatus:refreshRegistrationIfPossible:](self, "_updateRegistrationStatusForPass:notificationService:requestedRegistrationStatus:refreshRegistrationIfPossible:", v10, v12, 1, v13, v24);
  }
}

- (void)cancelAutoTopUpFromNotificationService:(id)a3 passUniqueIdenitifer:(id)a4 accountIdentifier:(id)a5 balance:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12)
  {
    v17 = [(PDDatabaseManager *)self->_databaseManager primaryPaymentApplicationForPassUniqueIdentifier:v13];
    unsigned int v18 = [v17 dpanIdentifier];
    if (v18)
    {
      unint64_t v19 = -[PDDatabaseManager registrationStatusForNotificationServiceType:passUniqueIdentifier:](self->_databaseManager, "registrationStatusForNotificationServiceType:passUniqueIdentifier:", [v12 serviceType], v13);
      v20 = PKLogFacilityTypeGetObject();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v19 == 1)
      {
        id v33 = v17;
        if (v21)
        {
          *(_DWORD *)buf = 134218754;
          uint64_t v40 = 1;
          __int16 v41 = 2112;
          unint64_t v42 = (unint64_t)v13;
          __int16 v43 = 2112;
          long long v44 = v18;
          __int16 v45 = 2112;
          id v46 = v12;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Registration status: %lu - Perform cancel auto top up task for pass: %@, DPAN ID: %@, and notification service: [%@]", buf, 0x2Au);
        }

        v32 = +[PDNotificationServicePostBalanceTask postBalanceTaskWithNotificationService:v12 dpanIdentifier:v18 accountIdentifier:v14 transactionSequenceNumber:0 autoTopUpDisabled:1 balance:v15];
        v22 = [(PDNotificationServiceCoordinator *)self _dictionaryKeyForTask:v32];
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_1000A0FE4;
        v34[3] = &unk_100733228;
        id v38 = v16;
        v34[4] = self;
        id v35 = v22;
        id v36 = v15;
        id v37 = v13;
        id v23 = v22;
        id v31 = v14;
        uint64_t v24 = objc_retainBlock(v34);
        taskToHandlerMap = self->_taskToHandlerMap;
        uint64_t v26 = v18;
        id v27 = v15;
        id v28 = objc_retainBlock(v24);
        [(NSMutableDictionary *)taskToHandlerMap setObject:v28 forKey:v23];

        id v15 = v27;
        unsigned int v18 = v26;
        [(PDNetworkTaskManager *)self->_taskManager performTask:v32];

        id v14 = v31;
        v17 = v33;
        goto LABEL_15;
      }
      if (v21)
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v40 = (uint64_t)v13;
        __int16 v41 = 2048;
        unint64_t v42 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Cannot perform cancel auto top up task for pass: %@, registration status: %lu", buf, 0x16u);
      }

      if (!v16) {
        goto LABEL_15;
      }
    }
    else
    {
      id v30 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v40 = (uint64_t)v13;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Cannot perform cancel auto top up task for pass: %@, no DPAN Identifier", buf, 0xCu);
      }

      if (!v16) {
        goto LABEL_15;
      }
    }
    (*((void (**)(id, void))v16 + 2))(v16, 0);
LABEL_15:

    goto LABEL_16;
  }
  objc_super v29 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v40 = (uint64_t)v13;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Cannot perform cancel auto top up task for pass: %@, no notification service", buf, 0xCu);
  }

  if (v16) {
    (*((void (**)(id, void))v16 + 2))(v16, 0);
  }
LABEL_16:
}

- (void)handlePostBalanceTaskWithNotificationService:(id)a3 passUniqueIdenitifer:(id)a4 accountIdentifier:(id)a5 transactionSequenceNumber:(id)a6 balance:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12)
  {
    v17 = [(PDDatabaseManager *)self->_databaseManager primaryPaymentApplicationForPassUniqueIdentifier:v13];
    unsigned int v18 = [v17 dpanIdentifier];
    id v24 = v14;
    if (v18)
    {
      unint64_t v19 = -[PDDatabaseManager registrationStatusForNotificationServiceType:passUniqueIdentifier:](self->_databaseManager, "registrationStatusForNotificationServiceType:passUniqueIdentifier:", [v12 serviceType], v13);
      v20 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219266;
        unint64_t v26 = v19;
        __int16 v27 = 2112;
        id v28 = v13;
        __int16 v29 = 2112;
        id v30 = v18;
        __int16 v31 = 2112;
        id v32 = v15;
        __int16 v33 = 2112;
        id v34 = v16;
        __int16 v35 = 2112;
        id v36 = v12;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Registration status: %lu - Perform post balance task for pass: %@, DPAN ID: %@, transactionSequenceNumber %@, balance, %@, and notification service: [%@]", buf, 0x3Eu);
      }

      BOOL v21 = +[PDNotificationServicePostBalanceTask postBalanceTaskWithNotificationService:v12 dpanIdentifier:v18 accountIdentifier:v14 transactionSequenceNumber:v15 autoTopUpDisabled:0 balance:v16];
      if (v19 == 1)
      {
        [(PDNetworkTaskManager *)self->_taskManager performTask:v21];
      }
      else
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          unint64_t v26 = (unint64_t)v13;
          __int16 v27 = 2112;
          id v28 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Register pass with unique identifier: %@ and post balance completion task: [%@]", buf, 0x16u);
        }

        v22 = [v12 pushToken];

        if (!v22)
        {
          id v23 = [(PDPushNotificationManager *)self->_pushNotificationManager pushToken];
          [v12 setPushToken:v23];

          [(PDDatabaseManager *)self->_databaseManager updateNotificationService:v12];
        }
        [(PDNotificationServiceCoordinator *)self _performRegistrationTaskForPaymentApplication:v17 notificationService:v12 completionTask:v21];
      }
    }
    else
    {
      BOOL v21 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v26 = (unint64_t)v13;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Cannot perform post balance task for pass: %@, no DPAN Identifier", buf, 0xCu);
      }
    }

    id v14 = v24;
  }
  else
  {
    v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v26 = (unint64_t)v13;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Cannot perform post balance task for pass: %@, no notification service", buf, 0xCu);
    }
  }
}

- (void)task:(id)a3 gotResult:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = (void *)PDOSTransactionCreate("PDNotificationServiceCoordinator");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v9 requestedStatus] == (id)1) {
      [(PDNotificationServiceCoordinator *)self _registrationTaskSucceeded:v9 withAuthenticationToken:v6];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(PDNotificationServiceCoordinator *)self _notificationUpdatesTaskSucceeded:v9 withResult:v6];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(PDNotificationServiceCoordinator *)self _transactionAuthenticationTaskSucceeded:v9 withResponse:v6];
      }
    }
  }
}

- (void)task:(id)a3 willRetryAfterMinimumDelay:(double)a4
{
  id v6 = a3;
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2048;
    double v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ will retry after %g seconds", (uint8_t *)&v8, 0x16u);
  }

  [(PDNotificationServiceCoordinator *)self _invokeAndClearHandlerForTask:v6 withResult:0];
}

- (void)taskSucceeded:(id)a3
{
}

- (void)taskFailed:(id)a3
{
}

- (void)task:(id)a3 encounteredError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = PDErrorDescription();
    int v12 = 138412290;
    id v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v12, 0xCu);
  }
  uint64_t v10 = [(PDNotificationServiceCoordinator *)self _dictionaryKeyForTask:v6];
  double v11 = (void *)v10;
  if (v7 && v10) {
    [(NSMutableDictionary *)self->_taskToErrorMap setObject:v7 forKey:v10];
  }
}

- (void)task:(id)a3 encounteredWarnings:(id)a4
{
}

- (void)taskRequestedReauthentication:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v7 = 0;
        goto LABEL_11;
      }
    }
    databaseManager = self->_databaseManager;
    id v6 = [v4 dpanIdentifier];
    id v7 = [(PDDatabaseManager *)databaseManager paymentApplicationWithDPANIdentifier:v6];

    int v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v7 dpanIdentifier];
      int v13 = 138412290;
      id v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Re-Authenticating for dpanIdentifier: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_14;
    }
    uint64_t v10 = self->_databaseManager;
    int v8 = [v4 dpanIdentifier];
    id v7 = [(PDDatabaseManager *)v10 paymentApplicationWithDPANIdentifier:v8];
  }

LABEL_11:
  double v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Re-Authenticating due to Request from Previous Task:%@", (uint8_t *)&v13, 0xCu);
  }

  int v12 = [v4 notificationService];
  [(PDNotificationServiceCoordinator *)self _performRegistrationTaskForPaymentApplication:v7 notificationService:v12 completionTask:v4];

LABEL_14:
}

- (void)requestUpdatesFromNotificationService:(id)a3 passUniqueIdenitifer:(id)a4
{
}

- (void)requestUpdatesFromNotificationService:(id)a3 passUniqueIdenitifer:(id)a4 forceUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v10 = [(PDDatabaseManager *)self->_databaseManager primaryPaymentApplicationForPassUniqueIdentifier:v9];
    double v11 = [v10 dpanIdentifier];
    if ((id)-[PDDatabaseManager registrationStatusForNotificationServiceType:passUniqueIdentifier:](self->_databaseManager, "registrationStatusForNotificationServiceType:passUniqueIdentifier:", [v8 serviceType], v9) == (id)1)
    {
      id v12 = [v8 serviceType];
      int v13 = [(PDDatabaseManager *)self->_databaseManager lastUpdatedDateForNotificationServiceType:v12 passUniqueIdentifier:v9];
      id v14 = v13;
      if (!v13
        || ([v13 timeIntervalSinceNow], fabs(v15) > 86400.0)
        || (PKDisableNotificationPullTimeout() & 1) != 0
        || v5)
      {
        id v16 = [(PDDatabaseManager *)self->_databaseManager lastUpdatedTagForNotificationServiceType:v12 passUniqueIdentifier:v9];
        if (v11)
        {
          id v25 = [(PDNotificationServiceCoordinator *)self _partnerAccountIdentifierWithPaymentApplication:v10 passUniqueIdentifier:v9];
          v17 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebService];
          unsigned int v18 = [v17 context];
          unint64_t v19 = [v18 configuration];

          v20 = +[PDNotificationServiceGetSpecificUpdatesTask getSpecificUpdatesTaskWithNotificationService:dpanIdentifier:credentialType:lastUpdatedTag:accountIdentifier:webServiceConfiguration:](PDNotificationServiceGetSpecificUpdatesTask, "getSpecificUpdatesTaskWithNotificationService:dpanIdentifier:credentialType:lastUpdatedTag:accountIdentifier:webServiceConfiguration:", v8, v11, [v10 paymentNetworkIdentifier], v16, v25, v19);
          [(PDNetworkTaskManager *)self->_taskManager performTask:v20];
        }
      }
    }
    else
    {
      taskManager = self->_taskManager;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1000A1E68;
      v26[3] = &unk_100733290;
      id v22 = v8;
      id v27 = v22;
      id v28 = v11;
      if (![(PDNetworkTaskManager *)taskManager containsTaskPassingTest:v26])
      {
        id v23 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v9];
        id v24 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v30 = v9;
          __int16 v31 = 2112;
          id v32 = v22;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Restarting Registration Task for Pass: %@ Notification Service: [%@]", buf, 0x16u);
        }

        [(PDNotificationServiceCoordinator *)self _updateRegistrationStatusForPass:v23 notificationService:v22 requestedRegistrationStatus:1 refreshRegistrationIfPossible:0];
      }
    }
  }
}

- (void)submitTransactionAuthenticationResultsData:(id)a3 signature:(id)a4 forPass:(id)a5 transactionServiceIdentifier:(id)a6 notificationService:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = (void (**)(void, void, void))v19;
  if (v18)
  {
    databaseManager = self->_databaseManager;
    id v22 = [v18 serviceType];
    id v23 = [v16 uniqueID];
    id v24 = [(PDDatabaseManager *)databaseManager registrationStatusForNotificationServiceType:v22 passUniqueIdentifier:v23];

    if (v24 == (id)1)
    {
      id v25 = [v16 deviceAccountIdentifier];
      id v32 = v15;
      id v35 = v14;
      unint64_t v26 = +[PDNotificationServiceTransactionAuthenticationTask transactionAuthenticationTaskWithNotificationService:v18 dpanIdentifier:v25 transactionServiceIdentifier:v17 authenticationResultsData:v14 signature:v15];

      [(PDNotificationServiceCoordinator *)self _dictionaryKeyForTask:v26];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1000A21CC;
      v36[3] = &unk_1007332B8;
      id v37 = (id)objc_claimAutoreleasedReturnValue();
      id v38 = v20;
      v36[4] = self;
      id v27 = v37;
      id v28 = objc_retainBlock(v36);
      taskToHandlerMap = self->_taskToHandlerMap;
      id v30 = objc_retainBlock(v28);
      [(NSMutableDictionary *)taskToHandlerMap setObject:v30 forKey:v27];

      [(PDNetworkTaskManager *)self->_taskManager performTask:v26];
LABEL_9:

      id v15 = v32;
      id v14 = v35;
      goto LABEL_10;
    }
    if (v20)
    {
      id v34 = v15;
      __int16 v31 = PKPassKitErrorDomain;
      NSErrorUserInfoKey v41 = NSDebugDescriptionErrorKey;
      CFStringRef v42 = @"Transaction notification service is not registered.";
      +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1, v34, v14);
      goto LABEL_8;
    }
  }
  else if (v19)
  {
    id v33 = v15;
    __int16 v31 = PKPassKitErrorDomain;
    NSErrorUserInfoKey v39 = NSDebugDescriptionErrorKey;
    CFStringRef v40 = @"No notification service to submit authentication results for.";
    +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1, v33, v14);
    unint64_t v26 = LABEL_8:;
    id v27 = +[NSError errorWithDomain:v31 code:-1 userInfo:v26];
    ((void (**)(void, void, id))v20)[2](v20, 0, v27);
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_updateRegistrationStatusForPass:(id)a3 notificationService:(id)a4 requestedRegistrationStatus:(unint64_t)a5 refreshRegistrationIfPossible:(BOOL)a6
{
}

- (void)_updateRegistrationStatusForPass:(id)a3 notificationService:(id)a4 requestedRegistrationStatus:(unint64_t)a5 refreshRegistrationIfPossible:(BOOL)a6 requestUpdateWhenAlreadyRegistered:(BOOL)a7
{
  BOOL v7 = a7;
  HIDWORD(v37) = a6;
  id v11 = a3;
  id v12 = a4;
  int v13 = [v11 paymentPass];
  CFStringRef v42 = v12;
  id v14 = [v12 serviceType];
  id v15 = [v11 uniqueID];
  id v16 = self;
  id v17 = [(PDDatabaseManager *)self->_databaseManager primaryPaymentApplicationForPassUniqueIdentifier:v15];
  [v17 state];
  int IsPersonalized = PKPaymentApplicationStateIsPersonalized();
  if (PKHandsOnDemoModeEnabled() & 1) != 0 || (PKUIOnlyDemoModeEnabled())
  {
    unint64_t v19 = 2;
  }
  else if (PKStoreDemoModeEnabled())
  {
    unint64_t v19 = 2;
  }
  else
  {
    unint64_t v19 = a5;
  }
  CFStringRef v40 = v17;
  NSErrorUserInfoKey v41 = v13;
  LODWORD(v37) = v7;
  if (v14)
  {
    if (v14 == (id)1)
    {
      unsigned int v20 = v42 != 0;
      int v21 = [(PDDatabaseManager *)v16->_databaseManager settingEnabled:64 forPassWithUniqueIdentifier:v15];
    }
    else
    {
      unsigned int v20 = 0;
      int v21 = 0;
    }
    BOOL v22 = 0;
  }
  else
  {
    if ([v13 supportsDPANNotifications]) {
      unsigned int v20 = 1;
    }
    else {
      unsigned int v20 = [v13 supportsFPANNotifications];
    }
    unsigned int v23 = -[PDDatabaseManager settingEnabled:forPassWithUniqueIdentifier:](v16->_databaseManager, "settingEnabled:forPassWithUniqueIdentifier:", 8, v15, v37);
    id v24 = [v11 paymentPass];
    id v25 = v11;
    unsigned int v26 = [v24 shouldIgnoreTransactionUpdatesSwitch];

    id v27 = [v13 transactionServiceRegistrationURL];
    BOOL v22 = v27 != 0;

    int v21 = v23 | v26;
    id v11 = v25;
  }
  if (IsPersonalized) {
    uint64_t v28 = v19;
  }
  else {
    uint64_t v28 = 2;
  }
  if (((v20 | v22) & v21) != 0) {
    unint64_t v29 = v28;
  }
  else {
    unint64_t v29 = 2;
  }
  unint64_t v30 = -[PDDatabaseManager registrationStatusForNotificationServiceType:passUniqueIdentifier:](v16->_databaseManager, "registrationStatusForNotificationServiceType:passUniqueIdentifier:", objc_msgSend(v42, "serviceType", v37), v15);
  if (v30) {
    unint64_t v31 = v30;
  }
  else {
    unint64_t v31 = 2;
  }
  id v32 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    if (v31 > 2) {
      id v33 = 0;
    }
    else {
      id v33 = off_1007334B8[v31];
    }
    if (v29 > 2) {
      id v34 = 0;
    }
    else {
      id v34 = off_1007334B8[v29];
    }
    *(_DWORD *)buf = 138413058;
    long long v44 = v15;
    __int16 v45 = 2112;
    id v46 = v42;
    __int16 v47 = 2112;
    long long v48 = v33;
    __int16 v49 = 2112;
    long long v50 = v34;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Received registration status update request for Pass with Unique Identifier: %@ with Notification Service: [%@] from: %@ to %@", buf, 0x2Au);
  }

  if (v29 == 2)
  {
    id v36 = v40;
    [(PDNotificationServiceCoordinator *)v16 _cancelAllTasksForPaymentApplication:v40 notificationService:v42];
    if (v31 == 1)
    {
      [(PDNotificationServiceCoordinator *)v16 _performDeregistrationForPassUniqueIdentifier:v15 paymentApplication:v40 notificationService:v42];
      [v40 state];
      if (!PKPaymentApplicationStateIsSuspended()) {
        [(PDNotificationServiceCoordinator *)v16 _clearStoredDataForPassUniqueIdentifier:v15 notificationService:v42];
      }
    }
  }
  else
  {
    BOOL v35 = v29 == 1;
    id v36 = v40;
    if (v35)
    {
      if (v31 == 2 || v39)
      {
        [(PDNotificationServiceCoordinator *)v16 _performRegistrationForPassUniqueIdentifier:v15 paymentApplication:v40 notificationService:v42 isInitialRegistration:v31 == 2];
      }
      else if (v38)
      {
        [(PDNotificationServiceCoordinator *)v16 requestUpdatesFromNotificationService:v42 passUniqueIdenitifer:v15 forceUpdate:1];
      }
    }
  }
}

- (void)_performRegistrationForPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 notificationService:(id)a5 isInitialRegistration:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412546;
    id v24 = v10;
    __int16 v25 = 2112;
    id v26 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Attempting to register Pass with Unique Identifier: %@ with Notification Service: [%@]", (uint8_t *)&v23, 0x16u);
  }

  id v14 = -[PDDatabaseManager lastUpdatedTagForNotificationServiceType:passUniqueIdentifier:](self->_databaseManager, "lastUpdatedTagForNotificationServiceType:passUniqueIdentifier:", [v12 serviceType], v10);
  id v15 = [v12 pushToken];

  if (!v15)
  {
    id v16 = [(PDPushNotificationManager *)self->_pushNotificationManager pushToken];
    [v12 setPushToken:v16];

    [(PDDatabaseManager *)self->_databaseManager updateNotificationService:v12];
  }
  id v17 = [(PDNotificationServiceCoordinator *)self _partnerAccountIdentifierWithPaymentApplication:v11 passUniqueIdentifier:v10];
  id v18 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebService];
  unint64_t v19 = [v18 context];
  unsigned int v20 = [v19 configuration];

  int v21 = [v11 dpanIdentifier];
  BOOL v22 = +[PDNotificationServiceGetSpecificUpdatesTask getSpecificUpdatesTaskWithNotificationService:dpanIdentifier:credentialType:lastUpdatedTag:accountIdentifier:webServiceConfiguration:](PDNotificationServiceGetSpecificUpdatesTask, "getSpecificUpdatesTaskWithNotificationService:dpanIdentifier:credentialType:lastUpdatedTag:accountIdentifier:webServiceConfiguration:", v12, v21, [v11 paymentNetworkIdentifier], v14, v17, v20);

  [v22 setInitialUpdatesTask:v6];
  [(PDNotificationServiceCoordinator *)self _performRegistrationTaskForPaymentApplication:v11 notificationService:v12 completionTask:v22];
}

- (void)_performRegistrationTaskForPaymentApplication:(id)a3 notificationService:(id)a4 completionTask:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 pushToken];
  id v12 = PKAccountHash();
  id v33 = [v12 hexEncoding];

  if (v11 && v33)
  {
    id v32 = +[NSMutableDictionary dictionary];
    [v32 setObject:v11 forKey:@"pushToken"];
    [v32 setObject:v33 forKey:@"accountHash"];
    uint64_t v46 = 0;
    __int16 v47 = &v46;
    uint64_t v48 = 0x3032000000;
    __int16 v49 = sub_1000207DC;
    long long v50 = sub_100020EE0;
    id v13 = v8;
    id v51 = v13;
    if (!v13)
    {
      id v14 = [(PDDatabaseManager *)self->_databaseManager paymentApplicationsForNotificationService:v9];
      +[NSMutableArray array];
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_1000A2D94;
      v43[3] = &unk_100733308;
      v43[4] = self;
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      id v44 = v15;
      __int16 v45 = &v46;
      [v14 enumerateObjectsUsingBlock:v43];
      if ([v15 count]) {
        [v32 setObject:v15 forKey:@"dpanIdentifiers"];
      }
    }
    if ([v13 supportsPartnerSpecificIdentifier])
    {
      id v16 = [(PDDatabaseManager *)self->_databaseManager passWithPaymentApplication:v47[5]];
      id v17 = [v16 paymentPass];
      id v18 = [v17 partnerAccountIdentifier];

      if (v18) {
        [v32 setObject:v18 forKey:@"accountIdentifier"];
      }
    }
    unint64_t v19 = +[NSJSONSerialization dataWithJSONObject:v32 options:0 error:0];
    unsigned int v20 = [v19 SHA256Hash];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000A2F2C;
    v37[3] = &unk_100733330;
    id v31 = v19;
    id v38 = v31;
    id v39 = v13;
    id v40 = v9;
    id v41 = v10;
    CFStringRef v42 = self;
    int v21 = objc_retainBlock(v37);
    BOOL v22 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v53 = v32;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Signing Registration Data: %@", buf, 0xCu);
    }

    id v23 = v9;
    id v24 = v11;
    id v25 = v10;
    id v26 = v8;
    secureElement = self->_secureElement;
    uint64_t v28 = v47[5];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000A32A0;
    v34[3] = &unk_100733358;
    v34[4] = self;
    id v29 = v20;
    id v35 = v29;
    unint64_t v30 = v21;
    id v36 = v30;
    [(PKSecureElement *)secureElement signChallenge:v29 forPaymentApplication:v28 withCompletion:v34];

    id v8 = v26;
    id v10 = v25;
    id v11 = v24;
    id v9 = v23;

    _Block_object_dispose(&v46, 8);
  }
}

- (void)_performDeregistrationForPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 notificationService:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempting to de-register Pass with Unique Identifier: %@ with Notification Service: [%@]", (uint8_t *)&v14, 0x16u);
  }

  id v12 = [v9 dpanIdentifier];
  id v13 = +[PDNotificationServiceSpecificRegistrationTask deregisterTaskWithNotificationService:v10 dpanIdentifier:v12];

  [(PDNetworkTaskManager *)self->_taskManager performTask:v13];
  -[PDDatabaseManager updateRegistrationStatus:forNotificationServiceType:passUniqueIdentifier:](self->_databaseManager, "updateRegistrationStatus:forNotificationServiceType:passUniqueIdentifier:", 2, [v10 serviceType], v8);
  if (![(PDDatabaseManager *)self->_databaseManager notificationServiceIsEnabledForAnyPasses:v10])
  {
    [(PDDatabaseManager *)self->_databaseManager updateAuthenticationToken:0 forNotificationService:v10];
    [v10 setAuthenticationToken:0];
  }
  [(PDNotificationServiceCoordinator *)self _recalculatePushTopics];
}

- (void)_clearStoredDataForPassUniqueIdentifier:(id)a3 notificationService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Clearing stored state for Pass with Unique Identifier: %@ with Notification Service: [%@]", (uint8_t *)&v13, 0x16u);
  }

  id v9 = [v7 serviceType];
  [(PDDatabaseManager *)self->_databaseManager updateLastUpdatedDate:0 forNotificationServiceType:v9 passUniqueIdentifier:v6];
  [(PDDatabaseManager *)self->_databaseManager updateLastUpdatedTag:0 forNotificationServiceType:v9 passUniqueIdentifier:v6];
  if (![(PDDatabaseManager *)self->_databaseManager notificationServiceIsEnabledForAnyPasses:v7])
  {
    [v7 setLastUpdatedTag:0];
    [v7 setLastUpdatedDate:0];
    [(PDDatabaseManager *)self->_databaseManager updateNotificationService:v7];
  }
  if (v9)
  {
    [(PDDatabaseManager *)self->_databaseManager deleteAllMessagesFromPaymentPassWithUniqueIdentifier:v6];
  }
  else
  {
    [(PDUserNotificationManager *)self->_userNotificationManager removeUserNotificationsForPassUniqueIdentifier:v6 ofType:4];
    id v10 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v6];
    id v11 = [v10 paymentPass];
    id v12 = [v11 deviceTransactionSourceIdentifiers];

    [(PDDatabaseManager *)self->_databaseManager deleteAllTransactionsFromTransactionSourceIdentifiers:v12];
  }
}

- (void)_registrationTaskSucceeded:(id)a3 withAuthenticationToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 notificationService];
  [v8 setAuthenticationToken:v7];

  [(PDDatabaseManager *)self->_databaseManager updateNotificationService:v8];
  id v9 = [v6 completionTask];

  if (v9)
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v6 completionTask];
      *(_DWORD *)buf = 138412290;
      BOOL v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Performing Completion Task After Successful Registration: %@", buf, 0xCu);
    }
    id v12 = PDDefaultQueue();
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000A3914;
    v19[3] = &unk_10072E198;
    v19[4] = self;
    id v20 = v6;
    dispatch_async(v12, v19);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v13 = [v6 dpanIdentifier];
    id v14 = [(PDDatabaseManager *)self->_databaseManager paymentApplicationWithDPANIdentifier:v13];
    __int16 v15 = [(PDDatabaseManager *)self->_databaseManager passWithPaymentApplication:v14];
    databaseManager = self->_databaseManager;
    id v17 = [v8 serviceType];
    id v18 = [v15 uniqueID];
    [(PDDatabaseManager *)databaseManager updateRegistrationStatus:1 forNotificationServiceType:v17 passUniqueIdentifier:v18];

    [(PDNotificationServiceCoordinator *)self _recalculatePushTopics];
  }
}

- (void)_notificationUpdatesTaskSucceeded:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v9 = [v6 notificationService];
  id v10 = [v9 serviceType];
  id v11 = [v7 lastUpdatedTag];
  v64 = v9;
  id v65 = objc_alloc_init((Class)NSCountedSet);
  if (isKindOfClass)
  {
    id v61 = v7;
    id v12 = v6;
    int v13 = [v12 dpanIdentifier];
    v63 = [(PDDatabaseManager *)self->_databaseManager paymentApplicationWithDPANIdentifier:v13];
    uint64_t v14 = -[PDDatabaseManager passUniqueIdentifierWithPaymentApplication:](self->_databaseManager, "passUniqueIdentifierWithPaymentApplication:");
    __int16 v15 = v11;
    databaseManager = self->_databaseManager;
    id v17 = (void *)v14;
    id v18 = +[NSDate date];
    unint64_t v19 = databaseManager;
    id v11 = v15;
    [(PDDatabaseManager *)v19 updateLastUpdatedDate:v18 forNotificationServiceType:v10 passUniqueIdentifier:v17];

    if (v15) {
      [(PDDatabaseManager *)self->_databaseManager updateLastUpdatedTag:v15 forNotificationServiceType:v10 passUniqueIdentifier:v17];
    }

    id v9 = v64;
    id v7 = v61;
    if (!v61) {
      goto LABEL_42;
    }
LABEL_9:
    id v56 = v11;
    BOOL v22 = [v7 authenticationToken];
    v62 = [v7 appLaunchToken];
    v60 = [v7 balances];
    __int16 v59 = [v7 plans];
    id v23 = [v7 notifications];
    if ([v22 length])
    {
      [v9 setAuthenticationToken:v22];
      [(PDDatabaseManager *)self->_databaseManager updateAuthenticationToken:v22 forNotificationService:v9];
    }
    v55 = v22;
    char v24 = isKindOfClass & 1;
    if ([v62 length]) {
      [(PDDatabaseManager *)self->_databaseManager updateAppLaunchToken:v62 forNotificationService:v9];
    }
    if (v10)
    {
      if (v10 != (id)1) {
        goto LABEL_19;
      }
      CFStringRef v25 = @"messageDate";
    }
    else
    {
      CFStringRef v25 = @"transactionDate";
    }
    uint64_t v26 = +[NSSortDescriptor sortDescriptorWithKey:v25 ascending:0];
    if (v26)
    {
      long long v53 = (void *)v26;
      uint64_t v89 = v26;
      id v27 = +[NSArray arrayWithObjects:&v89 count:1];
      uint64_t v28 = [v23 sortedArrayUsingDescriptors:v27];

      id v23 = (void *)v28;
LABEL_20:
      v81[0] = _NSConcreteStackBlock;
      v81[1] = 3221225472;
      v81[2] = sub_1000A40FC;
      v81[3] = &unk_100733380;
      v81[4] = self;
      id v58 = v10;
      id v85 = v10;
      id v82 = v65;
      char v86 = v24;
      id v83 = v23;
      id v57 = v6;
      id v84 = v6;
      id v54 = v83;
      [v83 enumerateObjectsUsingBlock:v81];
      id v29 = &dispatch_get_global_queue_ptr;
      if ([v60 count])
      {
        unint64_t v30 = v17;
        +[NSMutableDictionary dictionary];
        v79[0] = _NSConcreteStackBlock;
        v79[1] = 3221225472;
        v79[2] = sub_1000A4374;
        v79[3] = &unk_1007333A8;
        v79[4] = self;
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        id v80 = v31;
        [v60 enumerateObjectsUsingBlock:v79];
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        id v32 = v31;
        id v33 = [v32 countByEnumeratingWithState:&v75 objects:v88 count:16];
        if (v33)
        {
          id v34 = v33;
          uint64_t v35 = *(void *)v76;
          do
          {
            for (i = 0; i != v34; i = (char *)i + 1)
            {
              if (*(void *)v76 != v35) {
                objc_enumerationMutation(v32);
              }
              uint64_t v37 = *(void *)(*((void *)&v75 + 1) + 8 * i);
              id v38 = [(PDDatabaseManager *)self->_databaseManager paymentBalancesForPassUniqueIdentifier:v37];
              id v39 = [v32 objectForKeyedSubscript:v37];
              [(PDNotificationServiceCoordinator *)self sendLowBalanceNotificationIfNecessaryForUpdatedBalances:v39 startingBalances:v38 passUniqueIdentifier:v37];
              [(PDDatabaseManager *)self->_databaseManager updatePaymentBalances:v39 forPassUniqueIdentifier:v37];
            }
            id v34 = [v32 countByEnumeratingWithState:&v75 objects:v88 count:16];
          }
          while (v34);
        }

        id v29 = &dispatch_get_global_queue_ptr;
      }
      else
      {
        unint64_t v30 = v17;
        if (v17 && !v58) {
          [(PDDatabaseManager *)self->_databaseManager updatePaymentBalances:&__NSArray0__struct forPassUniqueIdentifier:v17];
        }
      }
      id v40 = objc_alloc_init((Class)v29[504]);
      v73[0] = _NSConcreteStackBlock;
      v73[1] = 3221225472;
      v73[2] = sub_1000A4610;
      v73[3] = &unk_1007333A8;
      v73[4] = self;
      id v41 = v40;
      id v74 = v41;
      [v59 enumerateObjectsUsingBlock:v73];
      long long v72 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v69 = 0u;
      id v42 = v41;
      id v43 = [v42 countByEnumeratingWithState:&v69 objects:v87 count:16];
      if (v43)
      {
        id v44 = v43;
        uint64_t v45 = *(void *)v70;
        do
        {
          for (j = 0; j != v44; j = (char *)j + 1)
          {
            if (*(void *)v70 != v45) {
              objc_enumerationMutation(v42);
            }
            uint64_t v47 = *(void *)(*((void *)&v69 + 1) + 8 * (void)j);
            uint64_t v48 = self->_databaseManager;
            __int16 v49 = [v42 objectForKeyedSubscript:v47];
            [(PDDatabaseManager *)v48 updatePaymentPlans:v49 forPassUniqueIdentifier:v47];
          }
          id v44 = [v42 countByEnumeratingWithState:&v69 objects:v87 count:16];
        }
        while (v44);
      }

      if (!v58)
      {
        id v50 = objc_alloc_init((Class)NSMutableDictionary);
        id v51 = [v7 tileConfigurations];
        v67[0] = _NSConcreteStackBlock;
        v67[1] = 3221225472;
        v67[2] = sub_1000A47BC;
        v67[3] = &unk_1007333A8;
        v67[4] = self;
        id v68 = v50;
        id v52 = v50;
        [v51 enumerateObjectsUsingBlock:v67];

        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472;
        v66[2] = sub_1000A49E0;
        v66[3] = &unk_1007333F8;
        v66[4] = self;
        [v52 enumerateKeysAndObjectsUsingBlock:v66];
      }
      id v11 = v56;
      id v6 = v57;
      id v9 = v64;
      id v17 = v30;
      goto LABEL_42;
    }
LABEL_19:
    long long v53 = 0;
    goto LABEL_20;
  }
  id v20 = self->_databaseManager;
  int v21 = +[NSDate date];
  [(PDDatabaseManager *)v20 updateLastUpdatedDate:v21 forNotificationService:v9];

  if (v11) {
    [(PDDatabaseManager *)self->_databaseManager updateLastUpdatedTag:v11 forNotificationService:v9];
  }
  id v17 = 0;
  v63 = 0;
  if (v7) {
    goto LABEL_9;
  }
LABEL_42:
}

- (void)_transactionAuthenticationTaskSucceeded:(id)a3 withResponse:(id)a4
{
  if (a4)
  {
    taskToResponseMap = self->_taskToResponseMap;
    id v7 = a4;
    id v8 = [(PDNotificationServiceCoordinator *)self _dictionaryKeyForTask:a3];
    [(NSMutableDictionary *)taskToResponseMap setObject:v7 forKey:v8];
  }
}

- (void)sendLowBalanceNotificationIfNecessaryForUpdatedBalances:(id)a3 startingBalances:(id)a4 passUniqueIdentifier:(id)a5
{
  id v8 = a3;
  id v39 = a4;
  id v9 = a5;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v10 = [v8 countByEnumeratingWithState:&v46 objects:v57 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v47;
    *(void *)&long long v11 = 138412802;
    long long v34 = v11;
    uint64_t v35 = self;
    id v36 = v8;
    uint64_t v37 = *(void *)v47;
    id v38 = v9;
    do
    {
      uint64_t v14 = 0;
      id v40 = v12;
      do
      {
        if (*(void *)v47 != v13) {
          objc_enumerationMutation(v8);
        }
        id v41 = *(void **)(*((void *)&v46 + 1) + 8 * (void)v14);
        __int16 v15 = objc_msgSend(v41, "identifiers", v34);
        id v16 = [v15 anyObject];

        id v17 = [(PDDatabaseManager *)self->_databaseManager balanceReminderThresholdForBalanceIdentifier:v16 withPassUniqueIdentifier:v9];
        id v18 = v17;
        if (v17 && [v17 isEnabled])
        {
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          id v19 = v39;
          id v20 = [v19 countByEnumeratingWithState:&v42 objects:v56 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v43;
LABEL_10:
            uint64_t v23 = 0;
            while (1)
            {
              if (*(void *)v43 != v22) {
                objc_enumerationMutation(v19);
              }
              char v24 = *(void **)(*((void *)&v42 + 1) + 8 * v23);
              CFStringRef v25 = [v24 identifiers];
              unsigned __int8 v26 = [v25 containsObject:v16];

              if (v26) {
                break;
              }
              if (v21 == (id)++v23)
              {
                id v21 = [v19 countByEnumeratingWithState:&v42 objects:v56 count:16];
                if (v21) {
                  goto LABEL_10;
                }
                id v27 = v19;
                self = v35;
                id v8 = v36;
                id v9 = v38;
                goto LABEL_27;
              }
            }
            id v27 = v24;

            self = v35;
            id v8 = v36;
            uint64_t v13 = v37;
            id v9 = v38;
            id v12 = v40;
            if (!v27) {
              goto LABEL_29;
            }
            uint64_t v28 = [v18 threshold];
            id v29 = [v41 value];
            id v30 = [v29 compare:v28];
            id v31 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v34;
              id v51 = v18;
              __int16 v52 = 2112;
              long long v53 = v29;
              __int16 v54 = 2112;
              id v55 = v27;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "PDNotificationServiceCoordiantor: lowBalance threshold: %@, updatedBalance: %@, oldBalance: %@", buf, 0x20u);
            }

            if (v30 == (id)-1)
            {
              id v32 = [v27 value];
              id v33 = [v32 compare:v28];

              if (v33 == (id)-1)
              {
                id v9 = v38;
                [(PDNotificationServiceCoordinator *)v35 updateLowBalanceNotificationForBalance:v41 withPassUniqueIdentifier:v38];
              }
              else
              {
                id v9 = v38;
                [(PDNotificationServiceCoordinator *)v35 sendLowBalanceNotificationForBalance:v41 withReminder:v18 passUniqueIdentifier:v38];
              }
            }
            else
            {
              id v9 = v38;
              [(PDNotificationServiceCoordinator *)v35 removeLowBalanceNotificationForBalance:v41 withPassUniqueIdentifier:v38];
            }

LABEL_27:
            uint64_t v13 = v37;
          }
          else
          {
            id v27 = v19;
          }

          id v12 = v40;
        }
LABEL_29:

        uint64_t v14 = (char *)v14 + 1;
      }
      while (v14 != v12);
      id v12 = [v8 countByEnumeratingWithState:&v46 objects:v57 count:16];
    }
    while (v12);
  }
}

- (void)sendLowBalanceNotificationForBalance:(id)a3 withReminder:(id)a4 passUniqueIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  long long v11 = [v10 currencyCode];
  id v12 = [PDPassLowBalanceReminderUserNotification alloc];
  uint64_t v13 = [v10 value];
  id v14 = [v10 exponent];
  __int16 v15 = [v9 threshold];

  id v16 = [v10 identifiers];

  id v17 = [v16 anyObject];
  id v18 = [(PDPassLowBalanceReminderUserNotification *)v12 initWithCurrentBalance:v13 balanceCurrency:v11 exponent:v14 reminderAmount:v15 reminderCurrency:v11 passUniqueIdentifier:v8 balanceIdentifier:v17];

  [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v18];
  id v19 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v18;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "PDNotificationServiceCoordiantor: send lowBalance notification %@ for pass %@", buf, 0x16u);
  }
}

- (void)updateLowBalanceNotificationForBalance:(id)a3 withPassUniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifiers];
  id v9 = [v8 anyObject];

  userNotificationManager = self->_userNotificationManager;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000A52DC;
  v14[3] = &unk_10072F3F0;
  id v15 = v9;
  id v16 = v6;
  id v17 = self;
  id v18 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v9;
  [(PDUserNotificationManager *)userNotificationManager userNotificationsForPassUniqueIdentifier:v11 ofType:7 completion:v14];
}

- (void)removeLowBalanceNotificationForBalance:(id)a3 withPassUniqueIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [a3 identifiers];
  id v8 = [v7 anyObject];

  userNotificationManager = self->_userNotificationManager;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000A55B0;
  v12[3] = &unk_100733420;
  id v13 = v8;
  id v14 = self;
  id v15 = v6;
  id v10 = v6;
  id v11 = v8;
  [(PDUserNotificationManager *)userNotificationManager userNotificationsForPassUniqueIdentifier:v10 ofType:7 completion:v12];
}

- (BOOL)_validateBalanceResult:(id)a3
{
  id v3 = a3;
  id v4 = [v3 identifiers];

  if (!v4)
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      id v9 = "Balance missing identifier";
      id v10 = (uint8_t *)&v15;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
LABEL_10:
    BOOL v7 = 0;
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = [v3 value];

  if (!v5)
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v9 = "Balance missing value";
      id v10 = buf;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  id v6 = [v3 lastUpdateDate];

  if (!v6)
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Balance missing lastUpdate, synthesizing", v13, 2u);
    }

    id v8 = +[NSDate date];
    [v3 setLastUpdateDate:v8];
    BOOL v7 = 1;
    goto LABEL_11;
  }
  BOOL v7 = 1;
LABEL_12:

  return v7;
}

- (BOOL)_validatePlanResult:(id)a3
{
  id v3 = a3;
  id v4 = [v3 identifier];

  if (!v4)
  {
    BOOL v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Plan missing identifier", buf, 2u);
    }
    goto LABEL_8;
  }
  BOOL v5 = [v3 lastUpdateDate];

  if (!v5)
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Plan missing lastUpdate, synthesizing", v9, 2u);
    }

    BOOL v7 = +[NSDate date];
    [v3 setLastUpdateDate:v7];
LABEL_8:
  }
  return v4 != 0;
}

- (void)_isMerchantTokenTransaction:(id)a3 forPass:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = +[PKPassLibrary sharedInstance];
  id v12 = [v8 panIdentifier];
  id v13 = [v11 passWithFPANIdentifier:v12];

  id v14 = [v8 panIdentifier];
  __int16 v15 = [v11 passWithDPANIdentifier:v14];

  uint64_t v16 = [v8 panIdentifier];
  id v17 = (void *)v16;
  if (v13 || v15 || !v16)
  {
    v10[2](v10, &__kCFBooleanFalse);
  }
  else
  {
    id v18 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebService];
    id v19 = objc_alloc_init((Class)PKRetrieveMerchantTokensRequest);
    [v19 setPass:v9];
    [v19 setMerchantTokenId:v17];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000A5BBC;
    v20[3] = &unk_100733448;
    __int16 v22 = v10;
    id v21 = v8;
    [v18 retrieveMerchantTokensWithRequest:v19 completion:v20];
  }
}

- (id)_updatePaymentTransaction:(id)a3 withPassUniqueIdentifier:(id)a4 forPaymentApplication:(id)a5 insertionMode:(unint64_t)a6 performTruncation:(BOOL)a7
{
  id v8 = [(PDDatabaseManager *)self->_databaseManager insertOrUpdatePaymentTransaction:a3 withPassUniqueIdentifier:a4 paymentApplication:a5 insertionMode:a6 performTruncation:a7 insertedTransaction:0];
  paymentTransactionProcessor = self->_paymentTransactionProcessor;
  id v10 = [v8 transactionSourceIdentifier];
  [(PDPaymentTransactionProcessor *)paymentTransactionProcessor processPaymentTransaction:v8 forTransactionSourceIdentifier:v10];

  return v8;
}

- (BOOL)_processTransactionDictionary:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 performTruncation:(BOOL)a6 isInitialUpdate:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v30 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v11)
  {
    id v14 = [v11 PKNumberForKey:@"invalidated"];
    __int16 v15 = [v11 PKStringForKey:@"completion"];
    if (v14 && ([v14 BOOLValue] & 1) != 0)
    {
      uint64_t v16 = 2;
    }
    else if (v15)
    {
      if ([v15 BOOLValue]) {
        uint64_t v16 = 3;
      }
      else {
        uint64_t v16 = 0;
      }
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v17 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v12];
  id v18 = [v17 paymentPass];

  uint64_t v19 = PKPaymentPassUnitDictionary(v18);
  id v20 = PKPaymentPassBalanceLabelDictionary(v18);
  id v21 = PKPaymentPassPlanLabelDictionary(v18);
  id v29 = (void *)v19;
  __int16 v22 = +[PKPaymentTransaction paymentTransactionWithSource:0 dictionary:v11 unitDictionary:v19 balanceLabelDictionary:v20 planLabelDictionary:v21 hasNotificationServiceData:1];
  [v22 addUpdateReasons:64];
  if (v7) {
    [v22 addUpdateReasons:4096];
  }
  [(PDNotificationServiceCoordinator *)self _updatePaymentTransaction:v22 withPassUniqueIdentifier:v12 forPaymentApplication:v13 insertionMode:v16 performTruncation:v30];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000A6108;
  v31[3] = &unk_100733470;
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  id v33 = self;
  id v34 = v12;
  id v35 = v13;
  uint64_t v36 = v16;
  BOOL v37 = v30;
  id v23 = v13;
  id v24 = v12;
  id v25 = v32;
  [(PDNotificationServiceCoordinator *)self _isMerchantTokenTransaction:v25 forPass:v18 completion:v31];
  if (v25) {
    BOOL v26 = v16 == 0;
  }
  else {
    BOOL v26 = 0;
  }
  BOOL v27 = v26;

  return v27;
}

- (BOOL)_processMessageDictionary:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 performTruncation:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = +[PKPaymentMessage paymentMessageWithDictionary:a3];
  id v13 = [(PDDatabaseManager *)self->_databaseManager insertOrUpdatePaymentMessage:v12 forPassUniqueIdentifier:v11 paymentApplication:v10 performTruncation:v6];

  return v13 != 0;
}

- (void)_cancelAllTasksForPaymentApplication:(id)a3 notificationService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PDDatabaseManager *)self->_databaseManager paymentApplicationsForNotificationService:v7];
  id v9 = objc_msgSend(v8, "pk_setByRemovingObject:", v6);
  BOOL v10 = [v9 count] != 0;

  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  taskManager = self->_taskManager;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000A63DC;
  v15[3] = &unk_100733498;
  id v12 = v7;
  id v16 = v12;
  BOOL v19 = v10;
  id v13 = v6;
  id v17 = v13;
  id v18 = &v20;
  [(PDNetworkTaskManager *)taskManager cancelTasksPassingTest:v15];
  if (*((unsigned char *)v21 + 24))
  {
    id v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v13;
      __int16 v26 = 2112;
      id v27 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Cancelled All Tasks for Payment Application: [%@], Notification Service: [%@]", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v20, 8);
}

- (void)_recalculatePushTopics
{
  pushTopics = self->_pushTopics;
  self->_pushTopics = 0;

  pushNotificationManager = self->_pushNotificationManager;
  [(PDPushNotificationManager *)pushNotificationManager recalculatePushTopics];
}

- (void)_invokeAndClearHandlerForTask:(id)a3 withResult:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = [(PDNotificationServiceCoordinator *)self _dictionaryKeyForTask:a3];
  uint64_t v6 = -[NSMutableDictionary objectForKey:](self->_taskToHandlerMap, "objectForKey:");
  id v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v4);
  }
  [(NSMutableDictionary *)self->_taskToHandlerMap removeObjectForKey:v8];
  [(NSMutableDictionary *)self->_taskToResponseMap removeObjectForKey:v8];
  [(NSMutableDictionary *)self->_taskToErrorMap removeObjectForKey:v8];
}

- (id)_dictionaryKeyForTask:(id)a3
{
  return +[NSValue valueWithPointer:a3];
}

- (id)_partnerAccountIdentifierWithPaymentApplication:(id)a3 passUniqueIdentifier:(id)a4
{
  id v6 = a4;
  if ([a3 supportsPartnerSpecificIdentifier])
  {
    id v7 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v6];
    id v8 = [v7 paymentPass];
    id v9 = [v8 partnerAccountIdentifier];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (PDPassTileManager)passTileManager
{
  return self->_passTileManager;
}

- (void)setPassTileManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passTileManager, 0);
  objc_storeStrong((id *)&self->_taskToErrorMap, 0);
  objc_storeStrong((id *)&self->_taskToResponseMap, 0);
  objc_storeStrong((id *)&self->_taskToHandlerMap, 0);
  objc_storeStrong((id *)&self->_paymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_taskManager, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_pushNotificationManager, 0);
  objc_storeStrong((id *)&self->_paymentTransactionProcessor, 0);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_pushTopics, 0);
}

@end