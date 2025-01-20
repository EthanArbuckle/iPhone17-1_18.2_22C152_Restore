@interface PDPeerPaymentAccountManager
- (PDPeerPaymentAccountManager)initWithDatabaseManager:(id)a3 cloudStoreNotificationCoordinator:(id)a4 transactionProcessor:(id)a5;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_handlePeerPaymentPendingRequestsChanged;
- (void)_handleRecurringPaymentsChanged;
- (void)deleteAllRecurringPaymentsWithCompletion:(id)a3;
- (void)deletePeerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:(id)a3;
- (void)deletePeerPaymentPendingRequestsForRequestTokens:(id)a3 completion:(id)a4;
- (void)deleteRecurringPaymentsForIdentifiers:(id)a3 completion:(id)a4;
- (void)hasRecurringPayments:(id)a3;
- (void)insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier:(id)a3 memo:(id)a4 counterpartAppearanceData:(id)a5 completion:(id)a6;
- (void)insertOrUpdatePeerPaymentPendingRequests:(id)a3 completion:(id)a4;
- (void)insertOrUpdateRecurringPayments:(id)a3 completion:(id)a4;
- (void)peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:(id)a3;
- (void)peerPaymentPendingRequestsForRequestTokens:(id)a3 completion:(id)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateAutoReloadAmount:(id)a3 threshold:(id)a4 identifier:(id)a5 completion:(id)a6;
- (void)updateRecurringPaymentMemo:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)updateRecurringPaymentStatus:(unint64_t)a3 identifier:(id)a4 completion:(id)a5;
@end

@implementation PDPeerPaymentAccountManager

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    [(NSHashTable *)self->_observers addObject:v4];
    os_unfair_lock_unlock(&self->_lockObservers);
  }
}

- (PDPeerPaymentAccountManager)initWithDatabaseManager:(id)a3 cloudStoreNotificationCoordinator:(id)a4 transactionProcessor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PDPeerPaymentAccountManager;
  v12 = [(PDPeerPaymentAccountManager *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_databaseManager, a3);
    objc_storeStrong((id *)&v13->_cloudStoreCoordinator, a4);
    objc_storeStrong((id *)&v13->_transactionProcessor, a5);
    uint64_t v14 = +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality];
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v14;

    v13->_lockObservers._os_unfair_lock_opaque = 0;
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.passd.peerpaymentaccountmanager.reply", v16);
    replyQueue = v13->_replyQueue;
    v13->_replyQueue = (OS_dispatch_queue *)v17;
  }
  return v13;
}

- (void)peerPaymentPendingRequestsForRequestTokens:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  replyQueue = self->_replyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002113D8;
  block[3] = &unk_1007315D8;
  v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(replyQueue, block);
}

- (void)peerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:(id)a3
{
  id v4 = a3;
  replyQueue = self->_replyQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100211514;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(replyQueue, v7);
}

- (void)insertOrUpdatePeerPaymentPendingRequests:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  replyQueue = self->_replyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100211640;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(replyQueue, block);
}

- (void)deletePeerPaymentPendingRequestsForRequestTokens:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  replyQueue = self->_replyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100211764;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(replyQueue, block);
}

- (void)deletePeerPaymentPendingRequestsForPeerPaymentAccountWithCompletion:(id)a3
{
  id v4 = a3;
  replyQueue = self->_replyQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10021185C;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(replyQueue, v7);
}

- (void)_handlePeerPaymentPendingRequestsChanged
{
}

- (void)updateAutoReloadAmount:(id)a3 threshold:(id)a4 identifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v34 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v11 length])
  {
    id v32 = v10;
    v33 = v12;
    [(PDDatabaseManager *)self->_databaseManager peerPaymentRecurringPayments];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = [v13 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v39;
LABEL_4:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v38 + 1) + 8 * v17);
        id v19 = [v18 identifier];
        id v20 = v11;
        v21 = v20;
        if (v19 == v20) {
          break;
        }
        if (v11 && v19)
        {
          unsigned __int8 v22 = [v19 isEqualToString:v20];

          if (v22) {
            goto LABEL_21;
          }
        }
        else
        {
        }
        if (v15 == (id)++v17)
        {
          id v15 = [v13 countByEnumeratingWithState:&v38 objects:v44 count:16];
          if (v15) {
            goto LABEL_4;
          }
          goto LABEL_15;
        }
      }

LABEL_21:
      id v25 = v18;

      id v10 = v32;
      if (v25) {
        goto LABEL_23;
      }
    }
    else
    {
LABEL_15:

      id v10 = v32;
    }
    id v25 = objc_alloc_init((Class)PKPeerPaymentRecurringPayment);
    [v25 setIdentifier:v11];
    [v25 setType:3];
    [v25 setStatus:1];
    [v25 setActions:2];
    v26 = [v10 currency];
    [v25 setCurrency:v26];

LABEL_23:
    v27 = [v10 amount];
    [v25 setAmount:v27];

    v24 = v34;
    v28 = [v34 amount];
    [v25 setThreshold:v28];

    databaseManager = self->_databaseManager;
    id v43 = v25;
    v30 = +[NSArray arrayWithObjects:&v43 count:1];
    [(PDDatabaseManager *)databaseManager insertOrUpdatePeerPaymentRecurringPayments:v30];

    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100211CAC;
    block[3] = &unk_1007315D8;
    void block[4] = self;
    id v12 = v33;
    id v37 = v33;
    id v36 = v11;
    dispatch_async(replyQueue, block);
  }
  else
  {
    v23 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Missing identifier while updating auto reload, ignoring.", buf, 2u);
    }

    v24 = v34;
    if (v12) {
      (*((void (**)(id, void))v12 + 2))(v12, 0);
    }
  }
}

- (void)deleteRecurringPaymentsForIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  replyQueue = self->_replyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100211DF4;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(replyQueue, block);
}

- (void)deleteAllRecurringPaymentsWithCompletion:(id)a3
{
  id v4 = a3;
  replyQueue = self->_replyQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100211EEC;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(replyQueue, v7);
}

- (void)insertOrUpdateRecurringPayments:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  replyQueue = self->_replyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100212010;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(replyQueue, block);
}

- (void)updateRecurringPaymentMemo:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = [v8 emoji];
  if ([v11 length])
  {
  }
  else
  {
    id v12 = [v8 text];
    id v13 = [v12 length];

    if (!v13)
    {
      v24 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_33;
      }
      *(_DWORD *)buf = 138412290;
      id v53 = v9;
      id v25 = "Memo is empty for recurring payment identifier: %@, ignoring.";
      v26 = v24;
      uint32_t v27 = 12;
LABEL_32:
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
LABEL_33:

      if (v10) {
        v10[2](v10, 0);
      }
      goto LABEL_35;
    }
  }
  if (![v9 length])
  {
    v24 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    *(_WORD *)buf = 0;
    id v25 = "Missing identifier while updating memo, ignoring.";
    v26 = v24;
    uint32_t v27 = 2;
    goto LABEL_32;
  }
  id v37 = v10;
  id v38 = v8;
  [(PDDatabaseManager *)self->_databaseManager peerPaymentRecurringPayments];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = [v14 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v46;
LABEL_7:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v46 != v17) {
        objc_enumerationMutation(v14);
      }
      id v19 = *(void **)(*((void *)&v45 + 1) + 8 * v18);
      id v20 = [v19 identifier];
      id v21 = v9;
      unsigned __int8 v22 = v21;
      if (v20 == v21) {
        break;
      }
      if (v9 && v20)
      {
        unsigned __int8 v23 = [v20 isEqualToString:v21];

        if (v23) {
          goto LABEL_22;
        }
      }
      else
      {
      }
      if (v16 == (id)++v18)
      {
        id v16 = [v14 countByEnumeratingWithState:&v45 objects:v51 count:16];
        if (v16) {
          goto LABEL_7;
        }
        goto LABEL_18;
      }
    }

LABEL_22:
    id v8 = v38;
    [v19 setMemo:v38];
    id v28 = v19;
    databaseManager = self->_databaseManager;
    id v50 = v28;
    v30 = +[NSArray arrayWithObjects:&v50 count:1];
    [(PDDatabaseManager *)databaseManager insertOrUpdatePeerPaymentRecurringPayments:v30];

    if (!v28) {
      goto LABEL_24;
    }
    v31 = PKLogFacilityTypeGetObject();
    id v10 = v37;
  }
  else
  {
LABEL_18:

    id v8 = v38;
LABEL_24:
    v31 = PKLogFacilityTypeGetObject();
    id v10 = v37;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v53 = v9;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Inserting memo for recurring payment which did not exist on device with identifier %@", buf, 0xCu);
    }

    id v28 = objc_alloc_init((Class)PKPeerPaymentRecurringPayment);
    [v28 setIdentifier:v9];
    [v28 setMemo:v8];
    id v32 = self->_databaseManager;
    id v49 = v28;
    v33 = +[NSArray arrayWithObjects:&v49 count:1];
    [(PDDatabaseManager *)v32 insertOrUpdatePeerPaymentRecurringPayments:v33];
  }
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v53 = v9;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Uploading memo for recurring payment %@", buf, 0xCu);
  }

  id v34 = [(PDCloudStoreNotificationCoordinator *)self->_cloudStoreCoordinator applePayContainer];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100212580;
  v43[3] = &unk_100734270;
  id v44 = v9;
  [v34 uploadRecurringPayment:v28 completion:v43];

  replyQueue = self->_replyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100212644;
  block[3] = &unk_100731830;
  long long v41 = self;
  v42 = v10;
  id v40 = v28;
  id v36 = v28;
  dispatch_async(replyQueue, block);

LABEL_35:
}

- (void)updateRecurringPaymentStatus:(unint64_t)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  if (!a3)
  {
    id v21 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 138412290;
    id v41 = v8;
    unsigned __int8 v22 = "Unknown status for recurring payment identifier: %@, ignoring.";
    unsigned __int8 v23 = v21;
    uint32_t v24 = 12;
    goto LABEL_21;
  }
  if (![v8 length])
  {
    id v21 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    unsigned __int8 v22 = "Missing identifier while updating status, ignoring.";
    unsigned __int8 v23 = v21;
    uint32_t v24 = 2;
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
LABEL_22:

    if (v9) {
      v9[2](v9, 0);
    }
    goto LABEL_28;
  }
  [(PDDatabaseManager *)self->_databaseManager peerPaymentRecurringPayments];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v11)
  {
    id v12 = v11;
    v29 = self;
    v30 = v9;
    uint64_t v13 = *(void *)v35;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        objc_msgSend(v15, "identifier", v29);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        id v17 = v8;
        uint64_t v18 = v17;
        if (v16 == v17)
        {

LABEL_25:
          [v15 setStatus:a3];
          id v20 = v15;
          self = v29;
          databaseManager = v29->_databaseManager;
          id v38 = v20;
          v26 = +[NSArray arrayWithObjects:&v38 count:1];
          [(PDDatabaseManager *)databaseManager insertOrUpdatePeerPaymentRecurringPayments:v26];

          id v9 = v30;
          goto LABEL_27;
        }
        if (v8 && v16)
        {
          unsigned int v19 = [v16 isEqualToString:v17];

          if (v19) {
            goto LABEL_25;
          }
        }
        else
        {
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v12) {
        continue;
      }
      break;
    }
    id v20 = 0;
    self = v29;
    id v9 = v30;
  }
  else
  {
    id v20 = 0;
  }
LABEL_27:

  replyQueue = self->_replyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002129C4;
  block[3] = &unk_10072E598;
  id v32 = v20;
  v33 = v9;
  id v28 = v20;
  dispatch_async(replyQueue, block);

LABEL_28:
}

- (void)hasRecurringPayments:(id)a3
{
  id v4 = a3;
  [(PDDatabaseManager *)self->_databaseManager peerPaymentRecurringPayments];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v9 type] == (id)3
          || [v9 type] == (id)1 && (objc_msgSend(v9, "sentByMe") & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_13;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  replyQueue = self->_replyQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100212B90;
  v12[3] = &unk_10073B5A0;
  id v13 = v4;
  char v14 = (char)v6;
  id v11 = v4;
  dispatch_async(replyQueue, v12);
}

- (void)_handleRecurringPaymentsChanged
{
}

- (void)insertOrUpdateDeviceOriginatedNearbyPeerPaymentTransactionWithIdentifier:(id)a3 memo:(id)a4 counterpartAppearanceData:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v12)
  {
    id v14 = [objc_alloc((Class)PKPeerPaymentCounterpartImageData) initWithAppearanceData:v12];
    long long v15 = [v14 identifier];
    long long v16 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v26 = v14;
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "NearbyPeerPayment: Inserting counterpart image data: %@, for transaction identifier: %@", buf, 0x16u);
    }

    [(PDDatabaseManager *)self->_databaseManager insertOrUpdatePeerPaymentCounterpartImageData:v14];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "NearbyPeerPayment: Uploading counterpart image data with identifier %@ to CloudKit", buf, 0xCu);
    }

    long long v17 = [(PDCloudStoreNotificationCoordinator *)self->_cloudStoreCoordinator applePayContainer];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100212EF8;
    v23[3] = &unk_100734270;
    id v18 = v15;
    id v24 = v18;
    [v17 uploadCounterpartImageData:v14 completion:v23];
  }
  else
  {
    long long v16 = PKLogFacilityTypeGetObject();
    id v18 = 0;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "NearbyPeerPayment: inserting device originated transaction with identifier: %@, counterpartImageDataIdentifier: %@", buf, 0x16u);
  }

  databaseManager = self->_databaseManager;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100212FBC;
  v21[3] = &unk_100740758;
  v21[4] = self;
  id v22 = v13;
  id v20 = v13;
  [(PDDatabaseManager *)databaseManager insertOrUpdateDeviceOriginatedNearbyPeerPaymentMemo:v11 counterpartImageDataIdentifier:v18 forTransactionWithServiceIdentifier:v10 completion:v21];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    [(NSHashTable *)self->_observers removeObject:v4];
    os_unfair_lock_unlock(&self->_lockObservers);
  }
}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    id v5 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(&self->_lockObservers);
    replyQueue = self->_replyQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100213210;
    v8[3] = &unk_10072FDC8;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async(replyQueue, v8);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_transactionProcessor, 0);
  objc_storeStrong((id *)&self->_cloudStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end