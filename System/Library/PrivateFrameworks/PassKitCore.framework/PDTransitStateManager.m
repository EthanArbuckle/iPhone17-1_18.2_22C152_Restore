@interface PDTransitStateManager
- (PDTransitStateManager)init;
- (PDTransitStateManager)initWithDatabaseManager:(id)a3 expressPassManager:(id)a4 secureElement:(id)a5 transactionProcessor:(id)a6 paymentWebServiceCoordinator:(id)a7 delegate:(id)a8;
- (PDTransitStateManagerDelegate)delegate;
- (void)_handleTransitRequestsWithSession:(id)a3;
- (void)_ingestAppletStateHistory:(id)a3 withTransactionDate:(id)a4 forceTransactionGeneration:(BOOL)a5 recoverMissingTransactions:(BOOL)a6 forPaymentApplication:(id)a7 withPassUniqueIdentifier:(id)a8 skipQueuedRequestSanitization:(BOOL)a9 expressTransactionState:(id)a10;
- (void)_notifyIssuerAppletStateDirtyWithPassID:(id)a3 forPaymentApplication:(id)a4;
- (void)_performWebRequestToNotifyIssuerAppletDirty;
- (void)_performWebRequestToNotifyIssuerAppletDirtyIfNecessary;
- (void)_queueTransitStateFetchRequest:(id)a3;
- (void)_resolveStationCodesForAppletState:(id)a3 paymentApplication:(id)a4 passUniqueIdentifier:(id)a5;
- (void)_scheduleOneOffActivityRequest;
- (void)_scheduleRepeatingActivityRequest;
- (void)_unscheduleOneOffActivityRequest;
- (void)_unschedulePeriodicActivityRequest;
- (void)dealloc;
- (void)expressPassManager:(id)a3 didFinishExpressTransactionWithState:(id)a4;
- (void)expressPassManager:(id)a3 willProcessPaymentApplicationsUpdateFromPriorPaymentApplications:(id)a4 toPaymentApplications:(id)a5 forPassUniqueIdentifier:(id)a6;
- (void)fetchAndCacheTransitStateForPassUniqueIdentifier:(id)a3 secureElementIdentifier:(id)a4 paymentApplicationIdentifier:(id)a5;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)processTransactionEventWithHistory:(id)a3 transactionDate:(id)a4 forPaymentApplication:(id)a5 withPassUniqueIdentifier:(id)a6 expressTransactionState:(id)a7;
- (void)secureElementDidUpdateAppletStateForApplicationIdentifier:(id)a3 keyIdentifier:(id)a4;
- (void)setDelegate:(id)a3;
- (void)transitAppletStateWithPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 completion:(id)a5;
- (void)updateAllExpressTransitAppletStates;
- (void)updateTransitAppletStateWithHistory:(id)a3 transactionDate:(id)a4 forPaymentApplication:(id)a5 withPassUniqueIdentifier:(id)a6;
@end

@implementation PDTransitStateManager

- (PDTransitStateManager)init
{
  return 0;
}

- (PDTransitStateManager)initWithDatabaseManager:(id)a3 expressPassManager:(id)a4 secureElement:(id)a5 transactionProcessor:(id)a6 paymentWebServiceCoordinator:(id)a7 delegate:(id)a8
{
  id v30 = a3;
  id v29 = a4;
  id v28 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v31.receiver = self;
  v31.super_class = (Class)PDTransitStateManager;
  v18 = [(PDTransitStateManager *)&v31 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_databaseManager, a3);
    objc_storeStrong((id *)&v19->_expressPassManager, a4);
    objc_storeStrong((id *)&v19->_secureElement, a5);
    objc_storeStrong((id *)&v19->_transactionProcessor, a6);
    objc_storeStrong((id *)&v19->_paymentWebServiceCoordinator, a7);
    objc_storeWeak((id *)&v19->_delegate, v17);
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.passd.felicaStateManager", v20);
    accessQueue = v19->_accessQueue;
    v19->_accessQueue = (OS_dispatch_queue *)v21;

    v23 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    transitRequests = v19->_transitRequests;
    v19->_transitRequests = v23;

    v25 = (NSMutableSet *)objc_alloc_init((Class)NSCountedSet);
    appletStateDirtyRequests = v19->_appletStateDirtyRequests;
    v19->_appletStateDirtyRequests = v25;

    v19->_appletStateDirtyLock._os_unfair_lock_opaque = 0;
    v19->_performingAppletDirtyRequests = 0;
    PDNFSecureXPCRegisterSecureElementEventObserver(v19);
    sub_100193A54((uint64_t)v19->_expressPassManager, v19);
    PDScheduledActivityClientRegister();
  }
  return v19;
}

- (void)dealloc
{
  PDNFSecureXPCUnregisterSecureElementEventObserver(self);
  sub_100193AC0((uint64_t)self->_expressPassManager, self);
  v3.receiver = self;
  v3.super_class = (Class)PDTransitStateManager;
  [(PDTransitStateManager *)&v3 dealloc];
}

- (void)fetchAndCacheTransitStateForPassUniqueIdentifier:(id)a3 secureElementIdentifier:(id)a4 paymentApplicationIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)PDOSTransactionCreate("PDTransitStateManager");
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E87F8;
  block[3] = &unk_10072FF48;
  id v18 = v11;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  v22 = self;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  id v16 = v11;
  dispatch_async(accessQueue, block);
}

- (void)_queueTransitStateFetchRequest:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 passUniqueIdentifier];
    v7 = [v4 secureElementIdentifier];
    id v8 = [v4 paymentApplicationIdentifier];
    *(_DWORD *)buf = 138412802;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Adding Transit State Fetch Request\npassId: %@, seid: %@, aid: %@", buf, 0x20u);
  }
  [(NSMutableArray *)self->_transitRequests addObject:v4];
  if (!self->_processingTransitRequests)
  {
    self->_processingTransitRequests = 1;
    objc_initWeak((id *)buf, self);
    id v9 = (void *)PDOSTransactionCreate("PDTransitStateManager.requests");
    secureElement = self->_secureElement;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000E8A78;
    v12[3] = &unk_100735FE8;
    id v11 = v9;
    id v13 = v11;
    objc_copyWeak(&v14, (id *)buf);
    [(PKSecureElement *)secureElement accessPrioritySecureElementManagerSessionWithHandler:v12];
    objc_destroyWeak(&v14);

    objc_destroyWeak((id *)buf);
  }
}

- (void)_handleTransitRequestsWithSession:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating transit applet states for:", buf, 2u);
  }

  id v34 = objc_alloc_init((Class)NSMutableSet);
  id v6 = [(NSMutableArray *)self->_transitRequests copy];
  [(NSMutableArray *)self->_transitRequests removeAllObjects];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v26 = v6;
  id obj = [v6 reverseObjectEnumerator];
  id v7 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v36;
    id v28 = self;
    id v29 = v4;
    oslog = v5;
    uint64_t v31 = *(void *)v36;
    do
    {
      id v10 = 0;
      id v32 = v8;
      do
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v10);
        if (([v34 containsObject:v11] & 1) == 0)
        {
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            v12 = [v11 passUniqueIdentifier];
            id v13 = [v11 paymentApplicationIdentifier];
            *(_DWORD *)buf = 138412546;
            v41 = v12;
            __int16 v42 = 2112;
            v43 = v13;
            _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "\t%@: %@", buf, 0x16u);
          }
          id v14 = [v11 passUniqueIdentifier];
          id v15 = [v11 paymentApplicationIdentifier];
          databaseManager = self->_databaseManager;
          __int16 v17 = [v11 secureElementIdentifier];
          id v18 = [(PDDatabaseManager *)databaseManager paymentApplicationWithPassUniqueIdentifier:v14 secureElementIdentifier:v17 paymentApplicationIdentifier:v15];

          if (v18)
          {
            __int16 v19 = [v4 appletWithIdentifier:v15];
            if (v19)
            {
              id v20 = +[PKContactlessInterfaceSession transitAppletStateFromPaymentSession:v4 forPaymentApplication:v18];
              [v34 addObject:v11];
              if (v20)
              {
                id v21 = [v11 transactionDate];
                unsigned int v30 = [v11 forceTransactionGeneration];
                id v22 = [v11 recoverMissingTransactions];
                v23 = [v11 expressState];
                LOBYTE(v25) = 1;
                [(PDTransitStateManager *)self _ingestAppletStateHistory:v20 withTransactionDate:v21 forceTransactionGeneration:v30 recoverMissingTransactions:v22 forPaymentApplication:v18 withPassUniqueIdentifier:v14 skipQueuedRequestSanitization:v25 expressTransactionState:v23];

                if ([v20 isBlacklisted])
                {
                  v5 = oslog;
                  id v4 = v29;
                  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "\tDeleting applet due to denylisting.", buf, 2u);
                  }

                  v39 = v19;
                  v24 = +[NSArray arrayWithObjects:&v39 count:1];
                  [v29 deleteApplets:v24 queueServerConnection:1];

                  self = v28;
                }
                else
                {
                  self = v28;
                  id v4 = v29;
                  v5 = oslog;
                }
              }
            }
            else
            {
              id v20 = v5;
              if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "\tCould not find applet.", buf, 2u);
                id v20 = v5;
              }
            }
          }
          else
          {
            __int16 v19 = v5;
            if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "\tCould not find payment application.", buf, 2u);
              __int16 v19 = v5;
            }
          }

          uint64_t v9 = v31;
          id v8 = v32;
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v8);
  }
}

- (void)processTransactionEventWithHistory:(id)a3 transactionDate:(id)a4 forPaymentApplication:(id)a5 withPassUniqueIdentifier:(id)a6 expressTransactionState:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  __int16 v17 = (void *)PDOSTransactionCreate("PDTransitStateManager");
  if (!v13)
  {
    id v13 = +[NSDate date];
  }
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E9370;
  block[3] = &unk_10072FF98;
  id v26 = v17;
  id v27 = v12;
  id v28 = self;
  id v29 = v13;
  id v30 = v14;
  id v31 = v15;
  id v32 = v16;
  id v19 = v16;
  id v20 = v15;
  id v21 = v14;
  id v22 = v13;
  id v23 = v12;
  id v24 = v17;
  dispatch_async(accessQueue, block);
}

- (void)updateTransitAppletStateWithHistory:(id)a3 transactionDate:(id)a4 forPaymentApplication:(id)a5 withPassUniqueIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)PDOSTransactionCreate("PDTransitStateManager");
  accessQueue = self->_accessQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000E95C4;
  v21[3] = &unk_100736010;
  id v22 = v14;
  id v23 = self;
  id v24 = v10;
  id v25 = v11;
  id v26 = v12;
  id v27 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  id v20 = v14;
  dispatch_async(accessQueue, v21);
}

- (void)_ingestAppletStateHistory:(id)a3 withTransactionDate:(id)a4 forceTransactionGeneration:(BOOL)a5 recoverMissingTransactions:(BOOL)a6 forPaymentApplication:(id)a7 withPassUniqueIdentifier:(id)a8 skipQueuedRequestSanitization:(BOOL)a9 expressTransactionState:(id)a10
{
  BOOL v37 = a6;
  BOOL v12 = a5;
  id v40 = a3;
  id v39 = a4;
  id v15 = a7;
  id v16 = a8;
  id v17 = a10;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (v12)
  {
    unsigned int v18 = [v15 isParsedTransitApplication];
    uint64_t v19 = 1;
    if (v17 && v18) {
      uint64_t v19 = (uint64_t)[v17 transacted];
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1000E9A98;
  v46[3] = &unk_100736038;
  v46[4] = self;
  id v20 = v16;
  id v47 = v20;
  id v21 = v15;
  id v48 = v21;
  [(PDTransitStateManager *)self transitAppletStateWithPassUniqueIdentifier:v20 paymentApplication:v21 completion:v46];
  id v22 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v20];
  id v23 = [v22 paymentPass];

  long long v38 = v17;
  if (v23)
  {
    if ([v23 isStoredValuePass])
    {
      id v24 = PKPaymentPassBalanceLabelDictionary(v23);
      id v25 = PKPaymentPassUnitDictionary(v23);
      id v26 = PKPaymentPassPlanLabelDictionary(v23);
      goto LABEL_13;
    }
  }
  else
  {
    id v27 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v50 = v20;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Error no pass in database for pass unique ID: %@", buf, 0xCu);
    }
  }
  id v26 = 0;
  id v25 = 0;
  id v24 = 0;
LABEL_13:
  databaseManager = self->_databaseManager;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1000E9AE8;
  v43[3] = &unk_100736060;
  v43[4] = self;
  id v29 = v21;
  id v44 = v29;
  id v30 = v20;
  id v45 = v30;
  [(PDDatabaseManager *)databaseManager updateTransitAppletStateWithHistory:v40 transactionDate:v39 forPaymentApplication:v29 withPassUniqueIdentifier:v30 forceTransactionGeneration:v19 recoverMissingTransactions:v37 balanceLabelDictionary:v24 unitDictionary:v25 planLabelDictionary:v26 completion:v43];
  if (!a9)
  {
    id v31 = objc_alloc_init(PDTransitStateFetchRequest);
    [(PDTransitStateFetchRequest *)v31 setPassUniqueIdentifier:v30];
    id v32 = [v29 secureElementIdentifier];
    [(PDTransitStateFetchRequest *)v31 setSecureElementIdentifier:v32];

    v33 = [v29 applicationIdentifier];
    [(PDTransitStateFetchRequest *)v31 setPaymentApplicationIdentifier:v33];

    transitRequests = self->_transitRequests;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1000E9CF8;
    v41[3] = &unk_100736088;
    long long v35 = v31;
    __int16 v42 = v35;
    long long v36 = [(NSMutableArray *)transitRequests indexesOfObjectsPassingTest:v41];
    if ([v36 count]) {
      [(NSMutableArray *)self->_transitRequests removeObjectsAtIndexes:v36];
    }
  }
}

- (void)transitAppletStateWithPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    accessQueue = self->_accessQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000E9DF4;
    v12[3] = &unk_100730578;
    void v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    dispatch_async(accessQueue, v12);
  }
}

- (void)_resolveStationCodesForAppletState:(id)a3 paymentApplication:(id)a4 passUniqueIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)NSMutableSet);
  objc_msgSend(@"0000", "pk_decodeHexadecimal");
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000EA24C;
  v38[3] = &unk_1007360B0;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v39 = v12;
  id v13 = v11;
  id v40 = v13;
  id v14 = objc_retainBlock(v38);
  id v15 = [v10 felicaState];

  if (v15)
  {
    id v16 = [v15 greenCarOriginStationCode];
    ((void (*)(void *, void *))v14[2])(v14, v16);

    id v17 = [v15 greenCarDestinationStationCode];
    ((void (*)(void *, void *))v14[2])(v14, v17);

    unsigned int v18 = [v15 shinkansenOriginStationCode];
    ((void (*)(void *, void *))v14[2])(v14, v18);

    uint64_t v19 = [v15 shinkansenDestinationStationCode];
    ((void (*)(void *, void *))v14[2])(v14, v19);

    id v20 = [v15 shinkansenSecondaryOriginStationCode];
    ((void (*)(void *, void *))v14[2])(v14, v20);

    id v21 = [v15 shinkansenSecondaryDestinationStationCode];
    ((void (*)(void *, void *))v14[2])(v14, v21);

    id v22 = [v13 count];
    if (v22)
    {
      id v23 = v22;
      id v31 = self;
      id v24 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = [v8 applicationIdentifier];
        *(_DWORD *)buf = 138412290;
        __int16 v42 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Processing Felica Applet State For Stations: %@", buf, 0xCu);
      }
      id v26 = objc_alloc_init(off_100805640());
      id v27 = [v13 allObjects];
      [v26 setStationCodes:v27];

      id v28 = [v8 stationCodeProvider];
      [v26 setSourceIdentifier:v28];

      id v29 = objc_alloc_init(off_100805648());
      [v29 _setExternalTransitLookupParameters:v26];
      id v30 = [objc_alloc(off_100805650()) initWithRequest:v29];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1000EA2B8;
      v32[3] = &unk_1007360D8;
      id v37 = v23;
      id v33 = v8;
      id v34 = v31;
      id v35 = v9;
      id v36 = v13;
      [v30 startWithCompletionHandler:v32];
    }
    else
    {
      [(PDDatabaseManager *)self->_databaseManager updateTransitAppletStateWithStationNames:0 forPaymentApplication:v8 withPassUniqueIdentifier:v9];
    }
  }
}

- (void)secureElementDidUpdateAppletStateForApplicationIdentifier:(id)a3 keyIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v6;
      __int16 v23 = 2112;
      id v24 = v7;
      id v10 = "Handle SE Event From TSM for application identifier: %@ key identifier: %@.";
      id v11 = v8;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    }
  }
  else if (v9)
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v6;
    id v10 = "Handle SE Event From TSM for application identifier: %@.";
    id v11 = v8;
    uint32_t v12 = 12;
    goto LABEL_6;
  }

  id v13 = (void *)PDOSTransactionCreate("PDTransitStateManager");
  id v14 = PDDefaultQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EA6C0;
  block[3] = &unk_10072E238;
  id v18 = v13;
  uint64_t v19 = self;
  id v20 = v6;
  id v15 = v6;
  id v16 = v13;
  dispatch_async(v14, block);
}

- (void)updateAllExpressTransitAppletStates
{
  objc_super v3 = (void *)PDOSTransactionCreate("PDTransitStateManager");
  expressPassManager = self->_expressPassManager;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000EA9A0;
  v6[3] = &unk_10072FC70;
  id v7 = v3;
  id v8 = self;
  id v5 = v3;
  sub_10018E790((uint64_t)expressPassManager, v6);
}

- (void)expressPassManager:(id)a3 willProcessPaymentApplicationsUpdateFromPriorPaymentApplications:(id)a4 toPaymentApplications:(id)a5 forPassUniqueIdentifier:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint32_t v12 = (void *)PDOSTransactionCreate("PDTransitStateManager");
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EAEE8;
  block[3] = &unk_10072FF48;
  id v19 = v12;
  id v20 = v9;
  id v21 = v10;
  id v22 = v11;
  __int16 v23 = self;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  id v17 = v12;
  dispatch_async(accessQueue, block);
}

- (void)expressPassManager:(id)a3 didFinishExpressTransactionWithState:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 passUniqueIdentifier];
    id v8 = [v6 applicationIdentifier];
    if ([v6 status] != (id)2 && !objc_msgSend(v6, "isIgnorable") && v7 && v8)
    {
      id v9 = (void *)PDOSTransactionCreate("PDTransitStateManager");
      accessQueue = self->_accessQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000EB3C8;
      block[3] = &unk_10072FF48;
      id v13 = v9;
      id v14 = self;
      id v15 = v7;
      id v16 = v8;
      id v17 = v6;
      id v11 = v9;
      dispatch_async(accessQueue, block);
    }
  }
}

- (void)_notifyIssuerAppletStateDirtyWithPassID:(id)a3 forPaymentApplication:(id)a4
{
  p_appletStateDirtyLock = &self->_appletStateDirtyLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_appletStateDirtyLock);
  id v9 = [objc_alloc((Class)PKTransitAppletStateDirty) initWithPassUniqueIdentifier:v8 paymentApplication:v7];

  id v10 = [(PDDatabaseManager *)self->_databaseManager insertOrUpdateAppletStateDirtyForTransitAppletStateDirty:v9];

  [(NSMutableSet *)self->_appletStateDirtyRequests addObject:v10];
  [(PDTransitStateManager *)self _scheduleOneOffActivityRequest];
  os_unfair_lock_unlock(p_appletStateDirtyLock);
  [(PDTransitStateManager *)self _performWebRequestToNotifyIssuerAppletDirtyIfNecessary];
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  p_appletStateDirtyLock = &self->_appletStateDirtyLock;
  os_unfair_lock_lock(&self->_appletStateDirtyLock);
  id v8 = [(PDDatabaseManager *)self->_databaseManager retrieveDirtyAppletStates];
  appletStateDirtyRequests = self->_appletStateDirtyRequests;
  id v7 = [v8 allObjects];
  [(NSMutableSet *)appletStateDirtyRequests addObjectsFromArray:v7];

  os_unfair_lock_unlock(p_appletStateDirtyLock);
  [(PDTransitStateManager *)self _performWebRequestToNotifyIssuerAppletDirtyIfNecessary];
}

- (void)_scheduleOneOffActivityRequest
{
  if ((PDScheduledActivityExists() & 1) == 0)
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Scheduling one off scheduleOneOffActivityRequest Activity for notification of applet state dirty", v5, 2u);
    }

    objc_super v3 = +[NSDate dateWithTimeIntervalSinceNow:300.0];
    id v4 = +[PDScheduledActivityCriteria priorityActivityCriteriaWithStartDate:v3];
    [v4 setRequireNetworkConnectivity:1];
    PDScheduledActivityRegister();
  }
}

- (void)_scheduleRepeatingActivityRequest
{
  if ((PDScheduledActivityExists() & 1) == 0)
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Scheduling repeating scheduleOneOffActivityRequest Activity for notification of applet state dirty", v5, 2u);
    }

    objc_super v3 = +[NSDate dateWithTimeIntervalSinceNow:3600.0];
    id v4 = +[PDScheduledActivityCriteria priorityActivityCriteriaWithStartDate:v3];
    [v4 setRequireNetworkConnectivity:1];
    [v4 setRepeating:1];
    [v4 setRepeatInterval:86400.0];
    PDScheduledActivityRegister();
  }
}

- (void)_unscheduleOneOffActivityRequest
{
  if (PDScheduledActivityExists())
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Unscheduling one off scheduleOneOffActivityRequest Activity for notification of applet state dirty", v3, 2u);
    }

    PDScheduledActivityRemove();
  }
}

- (void)_unschedulePeriodicActivityRequest
{
  if (PDScheduledActivityExists())
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Scheduling repeating scheduleOneOffActivityRequest Activity for notification of applet state dirty", v3, 2u);
    }

    PDScheduledActivityRemove();
  }
}

- (void)_performWebRequestToNotifyIssuerAppletDirtyIfNecessary
{
  p_appletStateDirtyLock = &self->_appletStateDirtyLock;
  os_unfair_lock_lock(&self->_appletStateDirtyLock);
  if (self->_performingAppletDirtyRequests)
  {
    os_unfair_lock_unlock(p_appletStateDirtyLock);
  }
  else
  {
    self->_performingAppletDirtyRequests = 1;
    os_unfair_lock_unlock(p_appletStateDirtyLock);
    [(PDTransitStateManager *)self _performWebRequestToNotifyIssuerAppletDirty];
  }
}

- (void)_performWebRequestToNotifyIssuerAppletDirty
{
  p_appletStateDirtyLock = &self->_appletStateDirtyLock;
  os_unfair_lock_lock(&self->_appletStateDirtyLock);
  id v4 = [(NSMutableSet *)self->_appletStateDirtyRequests anyObject];
  if (v4)
  {
    self->_performingAppletDirtyRequests = 1;
    [(NSMutableSet *)self->_appletStateDirtyRequests removeObject:v4];
    os_unfair_lock_unlock(p_appletStateDirtyLock);
    id v5 = [v4 passUniqueIdentifier];
    id v6 = [v4 dpanIdentifier];
    id v7 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v5];
    id v8 = [v7 serialNumber];
    id v9 = [objc_alloc((Class)PKPaymentNotifyIssuerAppletDirtyRequest) initWithPassSerialNumber:v8 deviceAccountIdentifier:v6];
    objc_initWeak(&location, self);
    paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000EBC7C;
    v12[3] = &unk_100736178;
    id v11 = v9;
    id v13 = v11;
    objc_copyWeak(&v15, &location);
    id v14 = v4;
    [(PDPaymentWebServiceCoordinator *)paymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    self->_performingAppletDirtyRequests = 0;
    if ([(PDDatabaseManager *)self->_databaseManager dirtyAppletStateCount] < 1)
    {
      [(PDTransitStateManager *)self _unscheduleOneOffActivityRequest];
      [(PDTransitStateManager *)self _unschedulePeriodicActivityRequest];
    }
    else
    {
      [(PDTransitStateManager *)self _scheduleRepeatingActivityRequest];
    }
    os_unfair_lock_unlock(p_appletStateDirtyLock);
  }
}

- (PDTransitStateManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PDTransitStateManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appletStateDirtyRequests, 0);
  objc_storeStrong((id *)&self->_transitRequests, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_paymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_transactionProcessor, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_expressPassManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end