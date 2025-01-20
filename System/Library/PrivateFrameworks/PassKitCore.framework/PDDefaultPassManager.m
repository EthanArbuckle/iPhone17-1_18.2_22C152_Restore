@interface PDDefaultPassManager
- (PDDefaultPassManager)init;
- (PDDefaultPassManager)initWithDatabaseManager:(id)a3 fieldDetectorManager:(id)a4 remoteInterfacePresenter:(id)a5 assertionManager:(id)a6 delegate:(id)a7;
- (PDDefaultPassManagerDelegate)delegate;
- (id)_queue_identifyDefaultPaymentPassWithCurrentDefaultPaymentPassUniqueIdentifier:(id)a3;
- (id)defaultPaymentPassIdentifier;
- (void)_presentDefaultPaymentPassUpdateNotification:(id)a3;
- (void)clearDefaultPaymentPassIfNeeded;
- (void)setDelegate:(id)a3;
- (void)updateContactlessPassesAvailability;
- (void)updateDefaultPaymentPassIdentifier:(id)a3;
- (void)updateDefaultPaymentPassIfNeeded;
- (void)willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3 completion:(id)a4;
@end

@implementation PDDefaultPassManager

- (PDDefaultPassManager)init
{
  return 0;
}

- (PDDefaultPassManager)initWithDatabaseManager:(id)a3 fieldDetectorManager:(id)a4 remoteInterfacePresenter:(id)a5 assertionManager:(id)a6 delegate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v13)
  {
    v26.receiver = self;
    v26.super_class = (Class)PDDefaultPassManager;
    v18 = [(PDDefaultPassManager *)&v26 init];
    v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_databaseManager, a3);
      objc_storeStrong((id *)&v19->_fieldDetectorManager, a4);
      objc_storeStrong((id *)&v19->_remoteInterfacePresenter, a5);
      objc_storeStrong((id *)&v19->_assertionManager, a6);
      objc_storeWeak((id *)&v19->_delegate, v17);
      *(_WORD *)&v19->_shouldUpdateContactlessPassesAvailibility = 0;
      v19->_contactlessPassesLock._os_unfair_lock_opaque = 0;
      v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v21 = dispatch_queue_create("com.apple.passd.defaultPass.work", v20);
      workQueue = v19->_workQueue;
      v19->_workQueue = (OS_dispatch_queue *)v21;

      dispatch_queue_t v23 = dispatch_queue_create("com.apple.passd.defaultPass.reply", v20);
      replyQueue = v19->_replyQueue;
      v19->_replyQueue = (OS_dispatch_queue *)v23;
    }
  }
  else
  {

    v19 = 0;
  }

  return v19;
}

- (void)updateContactlessPassesAvailability
{
  p_contactlessPassesLock = &self->_contactlessPassesLock;
  os_unfair_lock_lock(&self->_contactlessPassesLock);
  if (self->_isUpdatingContactlessPassesAvailibility)
  {
    self->_shouldUpdateContactlessPassesAvailibility = 1;
    os_unfair_lock_unlock(p_contactlessPassesLock);
  }
  else
  {
    self->_isUpdatingContactlessPassesAvailibility = 1;
    lock = p_contactlessPassesLock;
    os_unfair_lock_unlock(p_contactlessPassesLock);
    while (1)
    {
      v6 = [(PDDatabaseManager *)self->_databaseManager validNFCBarcodePassUniqueIDs];
      v7 = [(PDDatabaseManager *)self->_databaseManager objectSettingsManager];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v8 = v6;
      id v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
      context = v5;
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v27;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v27 != v11) {
              objc_enumerationMutation(v8);
            }
            if ((sub_10001E0A8((uint64_t)v7, *(void **)(*((void *)&v26 + 1) + 8 * i), 0) & 0x10) != 0)
            {
              uint64_t v13 = 1;
              goto LABEL_16;
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
      uint64_t v13 = 0;
LABEL_16:

      BOOL v14 = [(PDDatabaseManager *)self->_databaseManager hasActiveSecureElementPasses];
      unsigned int v15 = [(PDDatabaseManager *)self->_databaseManager hasActiveContactlessSecureElementPasses];
      PDSetContactlessPaymentPassesAvailable();
      int v16 = PDFieldDetectAvailable();
      int v17 = PDContactlessInterfaceAvailable();
      uint64_t v18 = 0x10000;
      if (!v13) {
        uint64_t v18 = 0;
      }
      uint64_t v19 = 256;
      if (!v15) {
        uint64_t v19 = 0;
      }
      unint64_t v20 = v18 | v2 & 0xFFFFFFFFFF000000 | v14;
      unint64_t v2 = v20 | v19;
      PDPassStateSet(v20 | v19);
      int v21 = PDFieldDetectAvailable();
      int v22 = PDContactlessInterfaceAvailable();
      if (v16 != v21) {
        sub_1001A5650((uint64_t)self->_fieldDetectorManager);
      }
      if (v17 != v22) {
        sub_1002068AC((uint64_t)self->_remoteInterfacePresenter);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
        [WeakRetained defaultPassManager:self didUpdateContactlessSecureElementPassesAvailability:v14 barcodePassesAvailable:v13];
      }
      os_unfair_lock_lock(lock);
      self->_isUpdatingContactlessPassesAvailibility = 0;
      if (!self->_shouldUpdateContactlessPassesAvailibility) {
        break;
      }
      self->_shouldUpdateContactlessPassesAvailibility = 0;
      os_unfair_lock_unlock(lock);
    }
    os_unfair_lock_unlock(lock);
  }
}

- (void)updateDefaultPaymentPassIfNeeded
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003D458C;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)clearDefaultPaymentPassIfNeeded
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003D496C;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)updateDefaultPaymentPassIdentifier:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003D4B24;
  v7[3] = &unk_10072E198;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (id)defaultPaymentPassIdentifier
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100020D4C;
  id v10 = sub_100021198;
  id v11 = 0;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003D4DB4;
  block[3] = &unk_10073A648;
  block[4] = &v6;
  dispatch_sync(workQueue, block);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)willPassWithUniqueIdentifierAutomaticallyBecomeDefault:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    if (v6)
    {
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1003D4F2C;
      block[3] = &unk_10072E9D8;
      block[4] = self;
      id v15 = v6;
      id v16 = v8;
      dispatch_async(workQueue, block);

      id v10 = v15;
    }
    else
    {
      replyQueue = self->_replyQueue;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1003D5030;
      v12[3] = &unk_10072F788;
      id v13 = v7;
      dispatch_async(replyQueue, v12);
      id v10 = v13;
    }
  }
}

- (void)_presentDefaultPaymentPassUpdateNotification:(id)a3
{
  id v4 = a3;
  if ((PKStoreDemoModeEnabled() & 1) == 0
    && (PKUIOnlyDemoModeEnabled() & 1) == 0
    && (PKHandsOnDemoModeEnabled() & 1) == 0)
  {
    v5 = [(PDAssertionManager *)self->_assertionManager assertionsOfType:4];
    id v6 = [v5 count];

    if (v6)
    {
      id v7 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [v4 uniqueID];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Supressing default pass change notification for pass: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      dispatch_time_t v9 = dispatch_time(0, 1000000000);
      id v10 = dispatch_get_global_queue(0, 0);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1003D5234;
      v12[3] = &unk_10072E1E8;
      id v13 = v4;
      id v11 = v12;
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      id v15 = sub_1003D5B08;
      id v16 = &unk_10072F788;
      id v17 = v11;
      dispatch_after(v9, v10, &buf);

      id v7 = v13;
    }
  }
}

- (id)_queue_identifyDefaultPaymentPassWithCurrentDefaultPaymentPassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v4];
  id v6 = [v5 paymentPass];

  id v7 = [(PDDatabaseManager *)self->_databaseManager peerPaymentAccount];
  uint64_t v8 = [v7 associatedPassUniqueID];

  if (v6)
  {
    dispatch_time_t v9 = [(PDDatabaseManager *)self->_databaseManager primaryPaymentApplicationForPassUniqueIdentifier:v4];
    id v10 = [v9 state];
    PDUserSpecifiedDefaultPaymentPassUniqueIdentifier();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v8 && ([v8 isEqualToString:v11] & 1) == 0) {
      unsigned int v12 = [v8 isEqualToString:v4];
    }
    else {
      unsigned int v12 = 0;
    }
    if ([v6 isTransitPass]
      && [v9 paymentNetworkIdentifier] == (id)113)
    {
      unsigned int v13 = [v4 isEqualToString:v11] ^ 1;
      if (!v12) {
        goto LABEL_11;
      }
    }
    else
    {
      unsigned int v13 = 0;
      if (!v12)
      {
LABEL_11:
        if (!v13)
        {
          if ([v6 supportsDefaultCardSelection])
          {
            [v6 effectiveContactlessPaymentApplicationState];
            if (PKPaymentApplicationStateIsPersonalized()
              || PKPaymentApplicationStateIsSuspended()
              || v10 == (id)2)
            {
              v33 = PKLogFacilityTypeGetObject();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Default card is valid. No need to update.", buf, 2u);
              }

              id v21 = v6;
              goto LABEL_42;
            }
            BOOL v14 = PKLogFacilityTypeGetObject();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_18;
            }
            *(_WORD *)long long buf = 0;
            id v15 = "Default card payment application is not personalized and it's not suspended or personalizing, attempti"
                  "ng to update with another card if possible";
          }
          else
          {
            BOOL v14 = PKLogFacilityTypeGetObject();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_18;
            }
            *(_WORD *)long long buf = 0;
            id v15 = "Default card does not support default card selection, attempting to update with another card if possible";
          }
          goto LABEL_17;
        }
        BOOL v14 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          id v15 = "Transit only card found as automatic default card, attempting to update with another card if possible";
LABEL_17:
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
          goto LABEL_18;
        }
        goto LABEL_18;
      }
    }
    BOOL v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      id v15 = "Apple Cash found as automatic default card, attempting to update with another card if possible";
      goto LABEL_17;
    }
LABEL_18:

    goto LABEL_19;
  }
  dispatch_time_t v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No default card, attempting to find a card if possible", buf, 2u);
  }
LABEL_19:
  v35 = v6;
  id v36 = v4;

  v34 = [(PDDatabaseManager *)self->_databaseManager paymentPassesEligibleForDefaultCardSelection];
  id v16 = [v34 allObjects];
  id v17 = [v16 sortedArrayUsingComparator:&stru_10074F248];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v11 = v17;
  id v18 = [v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v18)
  {
    id v19 = v18;
    id v20 = 0;
    id v21 = 0;
    uint64_t v22 = *(void *)v38;
LABEL_21:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v38 != v22) {
        objc_enumerationMutation(v11);
      }
      v24 = *(void **)(*((void *)&v37 + 1) + 8 * v23);
      if (v8
        && ([*(id *)(*((void *)&v37 + 1) + 8 * v23) uniqueID],
            v25 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v26 = [v25 isEqualToString:v8],
            v25,
            (v26 & 1) != 0))
      {
        long long v27 = v20;
        id v20 = v24;
      }
      else
      {
        if (![v24 isTransitPass]
          || ([v24 devicePrimaryPaymentApplication],
              long long v28 = objc_claimAutoreleasedReturnValue(),
              id v29 = [v28 paymentNetworkIdentifier],
              v28,
              v29 != (id)113))
        {
          id v31 = v24;

          id v6 = v35;
          id v4 = v36;
          dispatch_time_t v9 = v34;
          if (v31) {
            goto LABEL_41;
          }
          if (!v20) {
            goto LABEL_42;
          }
LABEL_40:
          id v20 = v20;
          id v31 = v20;
LABEL_41:

          id v21 = v31;
          goto LABEL_42;
        }
        if (v21) {
          v24 = v21;
        }
        long long v27 = v21;
        id v21 = v24;
      }
      id v30 = v24;

      if (v19 == (id)++v23)
      {
        id v19 = [v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
        if (v19) {
          goto LABEL_21;
        }
        goto LABEL_39;
      }
    }
  }
  id v20 = 0;
  id v21 = 0;
LABEL_39:

  id v6 = v35;
  id v4 = v36;
  dispatch_time_t v9 = v34;
  if (v20) {
    goto LABEL_40;
  }
LABEL_42:

  return v21;
}

- (PDDefaultPassManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PDDefaultPassManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_remoteInterfacePresenter, 0);
  objc_storeStrong((id *)&self->_fieldDetectorManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end