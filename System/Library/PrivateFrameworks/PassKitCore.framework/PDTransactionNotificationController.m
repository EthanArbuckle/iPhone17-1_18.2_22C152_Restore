@interface PDTransactionNotificationController
- (BOOL)_isValidTimeBetweenCreationAndAcceptForPeerPaymentTransaction:(id)a3 config:(id)a4;
- (BOOL)_shouldCreateMerchantTransactionNotificationForTransaction:(id)a3 config:(id)a4;
- (BOOL)_shouldCreateNotificationForTransactionUpdateReasons:(id)a3 notificationTypeDescription:(id)a4;
- (BOOL)_shouldCreatePromotionRewardNotificationForTransaction:(id)a3 config:(id)a4;
- (BOOL)_shouldDeleteNotificationForTransaction:(id)a3;
- (BOOL)_shouldDisplayNotificationForManuallyAcceptedPeerPaymentTransaction:(id)a3 config:(id)a4;
- (BOOL)_shouldDisplayNotificationForReceivedPeerPaymentTransaction:(id)a3 config:(id)a4;
- (BOOL)_transactionHasBeenUpdatedRecentlyEnoughForNotification:(id)a3;
- (PDTransactionNotificationController)initWithUserNotificationManager:(id)a3 databaseManager:(id)a4 accountManager:(id)a5 peerPaymentWebServiceCoordinator:(id)a6 familyCircleManager:(id)a7;
- (void)_fetchFamilyMemberIfNeccessaryForConfiguration:(id)a3 completion:(id)a4;
- (void)_scheduleOrCancelBalanceReminderNotificationIfNecessaryForPassUniqueIdentifier:(id)a3 config:(id)a4 transaction:(id)a5;
- (void)_scheduleOrCancelReminderNotificationsForPendingTransaction:(id)a3 config:(id)a4;
- (void)_updateFraudNotificationIfNecessaryForTransaction:(id)a3 config:(id)a4;
- (void)_updatePeerPaymentNotificationIfNecessaryForTransaction:(id)a3 existingTransaction:(id)a4 config:(id)a5;
- (void)_updatePromotionRewardNotificationIfNecessaryForTransaction:(id)a3 existingTransaction:(id)a4 config:(id)a5;
- (void)_updateTransactionNotificationIfNecessaryForTransaction:(id)a3 existingTransaction:(id)a4 config:(id)a5;
- (void)paymentTransactionRemoved:(id)a3 transactionSourceIdentifier:(id)a4;
- (void)paymentTransactionUpdated:(id)a3 existingPaymentTransaction:(id)a4 transactionSourceIdentifier:(id)a5;
- (void)transitPropertiesUpdated:(id)a3 forPassUniqueIdentifier:(id)a4;
@end

@implementation PDTransactionNotificationController

- (PDTransactionNotificationController)initWithUserNotificationManager:(id)a3 databaseManager:(id)a4 accountManager:(id)a5 peerPaymentWebServiceCoordinator:(id)a6 familyCircleManager:(id)a7
{
  id v23 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)PDTransactionNotificationController;
  v17 = [(PDTransactionNotificationController *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_userNotificationManager, a3);
    objc_storeStrong((id *)&v18->_databaseManager, a4);
    objc_storeStrong((id *)&v18->_accountManager, a5);
    objc_storeStrong((id *)&v18->_peerPaymentWebServiceCoordinator, a6);
    objc_storeStrong((id *)&v18->_familyCircleManager, a7);
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.passd.PDTransactionNotificationController", v19);
    workQueue = v18->_workQueue;
    v18->_workQueue = (OS_dispatch_queue *)v20;
  }
  return v18;
}

- (void)paymentTransactionUpdated:(id)a3 existingPaymentTransaction:(id)a4 transactionSourceIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002D9A44;
  v15[3] = &unk_100730198;
  id v16 = v8;
  v17 = self;
  id v18 = v10;
  id v19 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(workQueue, v15);
}

- (void)paymentTransactionRemoved:(id)a3 transactionSourceIdentifier:(id)a4
{
  id v5 = a3;
  workQueue = self->_workQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002DA3B8;
  v8[3] = &unk_10072E198;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(workQueue, v8);
}

- (void)transitPropertiesUpdated:(id)a3 forPassUniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002DA4EC;
  block[3] = &unk_10072E238;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)_fetchFamilyMemberIfNeccessaryForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    goto LABEL_12;
  }
  id v8 = [v6 transactionSourceType];
  if (v8 == (id)2)
  {
    id v9 = [v6 accountUser];
  }
  else
  {
    if (v8 != (id)1)
    {
      v11 = 0;
      goto LABEL_8;
    }
    id v9 = [v6 associatedPeerPaymentAccount];
  }
  id v10 = v9;
  v11 = [v9 altDSID];

LABEL_8:
  if ([v11 length])
  {
    familyCircleManager = self->_familyCircleManager;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1002DA844;
    v13[3] = &unk_1007346F0;
    id v14 = v11;
    id v15 = v7;
    [(PDFamilyCircleManager *)familyCircleManager familyMembersWithCachePolicy:0 completion:v13];
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }

LABEL_12:
}

- (void)_updateTransactionNotificationIfNecessaryForTransaction:(id)a3 existingTransaction:(id)a4 config:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v8 fullyProcessed] & 1) == 0)
  {
    v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v77 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not creating notification for transaction that is not yet fully processed: %@", buf, 0xCu);
    }
    goto LABEL_73;
  }
  if (PKPaymentTransactionHasAuthenticationRequest())
  {
    v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v8 identifier];
      *(_DWORD *)buf = 138412290;
      v77 = v12;
      id v13 = "Not creating notification for transaction that has authentication request: %@";
LABEL_36:
      v17 = v11;
      uint32_t v18 = 12;
      goto LABEL_37;
    }
    goto LABEL_73;
  }
  if ([v8 transactionType] != (id)15)
  {
    id v14 = [v8 transactionType];
    id v15 = [v10 associatedPeerPaymentAccount];

    if ([v8 isRecurring] && (v14 != (id)6 || !v15))
    {
      v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [v8 identifier];
        *(_DWORD *)buf = 138412290;
        v77 = v12;
        id v13 = "Not creating notification for recurring transaction: %@";
        goto LABEL_36;
      }
      goto LABEL_73;
    }
    id v16 = [v8 transfers];
    v11 = [v16 firstObject];

    if ([v8 featureIdentifier] == (id)1
      && [v8 associatedFeatureIdentifier] == (id)5
      && [v11 type] == (id)2)
    {
      id v12 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
LABEL_72:

        goto LABEL_73;
      }
      *(_WORD *)buf = 0;
      id v13 = "Not creating notification for transfer from cash to savings";
      v17 = v12;
      uint32_t v18 = 2;
LABEL_37:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v13, buf, v18);
      goto LABEL_72;
    }
    id v19 = [v10 paymentPass];
    id v12 = [v19 uniqueID];

    dispatch_queue_t v20 = [v10 paymentApplication];
    v21 = (objc_class *)objc_opt_class();
    id v22 = [v10 transactionSourceType];
    id v23 = [v8 transactionType];
    v69 = [v10 familyMember];
    v70 = v20;
    if (v23 != (id)2)
    {
LABEL_26:
      if (!v22
        && ([(PDDatabaseManager *)self->_databaseManager settingEnabled:128 forPassWithUniqueIdentifier:v12]|| ![(PDDatabaseManager *)self->_databaseManager settingEnabled:8 forPassWithUniqueIdentifier:v12]))
      {
        v38 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v77 = v12;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Not creating notification for transaction since notifications are suppressed for pass: %@", buf, 0xCu);
        }
        goto LABEL_71;
      }
      if ([v8 featureIdentifier] == (id)5)
      {
        v63 = v12;
        v66 = v21;
        v60 = [v8 accountIdentifier];
        id v32 = [v8 transactionType];
        v33 = [v8 transfers];
        v34 = [v33 firstObject];
        v35 = [v34 externalAccount];
        id v36 = [v35 type];

        if (v32 != (id)11 && v36 != (id)5)
        {
          v37 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Not creating notification for transaction since it is not an interest or RDFI transaction", buf, 2u);
          }
          v38 = v60;
          id v12 = v63;
          goto LABEL_33;
        }
        v38 = v60;
        if (v32 == (id)11 && PKHasDisabledInterestPaidNotificationsForAccountIdentifier())
        {
          v37 = PKLogFacilityTypeGetObject();
          id v12 = v63;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v77 = v60;
            v39 = "Not creating notification for transaction since interest notifications are suppressed for account: %@";
LABEL_52:
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, v39, buf, 0xCu);
            goto LABEL_33;
          }
          goto LABEL_33;
        }
        id v12 = v63;
        if (v36 == (id)5 && PKHasDisabledTransactionsNotificationsForAccountIdentifier())
        {
          v37 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v77 = v60;
            v39 = "Not creating notification for transaction since transaction notifications are suppressed for account: %@";
            goto LABEL_52;
          }
LABEL_33:

LABEL_70:
          dispatch_queue_t v20 = v70;
LABEL_71:

          goto LABEL_72;
        }

        v21 = v66;
      }
      v38 = [v8 altDSID];
      if (v38)
      {
        v40 = [v8 accountIdentifier];
        id v67 = [(PDDatabaseManager *)self->_databaseManager accountUserWithAltDSID:v38 accountIdentifier:v40];
        if (([v67 isCurrentUser] & 1) == 0)
        {
          v41 = [v67 notificationSettings];
          if (([v41 transactionNotificationsEnabled] & 1) == 0)
          {
            v48 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v77 = v38;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Not creating notification for transaction since notifications not enabled for account user: %@", buf, 0xCu);
            }
            goto LABEL_65;
          }
          v61 = v41;
          uint64_t v42 = [v41 transactionNotificationThreshold];
          uint64_t v43 = [v8 amount];
          v44 = (void *)v43;
          v64 = v42;
          if (v42)
          {
            if (v43)
            {
              v45 = (void *)v43;
              id v46 = [v64 compare:v43];
              v44 = v45;
              if (v46 == (id)1)
              {
                v47 = PKLogFacilityTypeGetObject();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v77 = v38;
                  _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Not creating notification for transaction since amount is less than account user threshold: %@", buf, 0xCu);
                }

                v41 = v61;
                v48 = v64;
LABEL_65:

LABEL_69:
                goto LABEL_70;
              }
            }
          }
        }
      }
      char v68 = [v9 fullyProcessed] ^ 1;
      id v49 = [v21 alloc];
      v50 = v12;
      id v51 = v49;
      v52 = [v10 accountUser];
      v53 = [v10 installmentCriteria];
      id v54 = [v51 initWithPaymentTransaction:v8 forPassUniqueIdentifier:v50 paymentApplication:v70 familyMember:v69 accountUser:v52 installmentCriteria:v53];

      uint64_t v55 = [v54 notificationIdentifier];
      v56 = v38;
      userNotificationManager = self->_userNotificationManager;
      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472;
      v71[2] = sub_1002DB300;
      v71[3] = &unk_100747238;
      v71[4] = self;
      v72 = v8;
      id v73 = v10;
      id v74 = v54;
      char v75 = v68;
      id v58 = v54;
      id v12 = v50;
      id v67 = v58;
      v59 = userNotificationManager;
      v38 = v56;
      v40 = (void *)v55;
      [(PDUserNotificationManager *)v59 userNotificationWithIdentifier:v55 completion:v71];

      goto LABEL_69;
    }
    id v62 = v22;
    unsigned int v24 = [v8 enRoute];
    v21 = (objc_class *)objc_opt_class();
    v25 = [(PDDatabaseManager *)self->_databaseManager transitStateWithPassUniqueIdentifier:v12 paymentApplication:v20];
    v26 = v25;
    if (v25)
    {
      [v25 enrouteTransitTypes];
      v28 = v27 = v12;
      v65 = v21;
      id v29 = [v28 count];

      id v12 = v27;
      dispatch_queue_t v20 = v70;
      BOOL v30 = v29 == 0;
      v21 = v65;
      if (v30) {
        char v31 = 1;
      }
      else {
        char v31 = v24;
      }
      if ((v31 & 1) == 0) {
        goto LABEL_25;
      }
    }
    else if (!v24)
    {
      goto LABEL_25;
    }
    [(PDUserNotificationManager *)self->_userNotificationManager removeUserNotificationsForPassUniqueIdentifier:v12 ofType:6];
LABEL_25:

    id v22 = v62;
    goto LABEL_26;
  }
  v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 identifier];
    *(_DWORD *)buf = 138412290;
    v77 = v12;
    id v13 = "Not creating notification for data release transaction: %@";
    goto LABEL_36;
  }
LABEL_73:
}

- (void)_updateFraudNotificationIfNecessaryForTransaction:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 transactionSourceIdentifier];
  id v9 = (void *)v8;
  if (v6 && v8)
  {
    id v10 = [PDPassPaymentFraudTransactionUserNotification alloc];
    v11 = [v7 passUniqueIdentifier];
    id v12 = [(PDPassPaymentFraudTransactionUserNotification *)v10 initWithPaymentTransaction:v6 forPassUniqueIdentifier:v11];

    userNotificationManager = self->_userNotificationManager;
    id v14 = [(PDUserNotification *)v12 notificationIdentifier];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1002DB7B0;
    v16[3] = &unk_100747260;
    id v17 = v6;
    uint32_t v18 = self;
    id v19 = v12;
    id v15 = v12;
    [(PDUserNotificationManager *)userNotificationManager userNotificationWithIdentifier:v14 completion:v16];
  }
}

- (void)_updatePromotionRewardNotificationIfNecessaryForTransaction:(id)a3 existingTransaction:(id)a4 config:(id)a5
{
  uint64_t v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (PKRewardsCenterEnabled())
  {
    if (([v8 fullyProcessed] & 1) == 0)
    {
      id v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v54 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not creating notification for transaction that is not yet fully processed: %@", buf, 0xCu);
      }
      goto LABEL_41;
    }
    v11 = [v10 paymentPass];
    id v12 = [v11 uniqueID];

    id v13 = [v10 paymentApplication];
    id v14 = [v10 transactionSourceType];
    if ([v8 transactionType]
      || [v8 transactionStatus] != (id)1
      || [v8 accountType] != (id)2)
    {
LABEL_40:

LABEL_41:
      goto LABEL_42;
    }
    if (!v14
      && ([(PDDatabaseManager *)self->_databaseManager settingEnabled:128 forPassWithUniqueIdentifier:v12]|| ![(PDDatabaseManager *)self->_databaseManager settingEnabled:8 forPassWithUniqueIdentifier:v12]))
    {
      dispatch_queue_t v20 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v54 = v12;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Not creating notification for transaction since notifications are suppressed for pass: %@", buf, 0xCu);
      }
      goto LABEL_39;
    }
    id v36 = v13;
    v37 = [v8 altDSID];
    if (v37)
    {
      id v15 = PKCurrentUserAltDSID();
      id v16 = v37;
      id v17 = v15;
      if (v16 == v17)
      {
      }
      else
      {
        uint32_t v18 = v17;
        if (!v17)
        {

LABEL_35:
          v34 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v54 = v16;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Not creating promotion reward notification for other account user: %@", buf, 0xCu);
          }
          dispatch_queue_t v20 = v37;
          goto LABEL_38;
        }
        unsigned __int8 v19 = [v16 isEqualToString:v17];

        if ((v19 & 1) == 0) {
          goto LABEL_35;
        }
      }
    }
    v21 = [v8 rewards];
    v38 = +[NSMutableArray array];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v35 = v21;
    id obj = [v21 rewardsItems];
    id v41 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v41)
    {
      uint64_t v40 = *(void *)v49;
LABEL_21:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v49 != v40) {
          objc_enumerationMutation(obj);
        }
        id v23 = *(void **)(*((void *)&v48 + 1) + 8 * v22);
        if ([v23 state] != (id)2) {
          break;
        }
        [v23 type];
        unsigned int v24 = [v23 currencyAmount];
        v25 = [v24 amount];

        if ([v23 eligibleValueUnit] == (id)2)
        {
          v26 = +[NSDecimalNumber zero];
          unsigned __int8 v27 = [v25 isEqualToNumber:v26];

          if ((v27 & 1) == 0) {
            [v38 addObject:v23];
          }
        }

        if (v41 == (id)++v22)
        {
          id v41 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
          if (v41) {
            goto LABEL_21;
          }
          goto LABEL_30;
        }
      }
    }
    else
    {
LABEL_30:

      id v13 = v36;
      if (![v38 count])
      {
LABEL_33:

        dispatch_queue_t v20 = v37;
        v34 = v35;
LABEL_38:

LABEL_39:
        goto LABEL_40;
      }
      BOOL v28 = [v9 transactionStatus] != (id)1;
      char v29 = [v9 fullyProcessed] ^ 1;
      BOOL v30 = [[PDPassPaymentPromotionRewardEarnedUserNotification alloc] initWithPaymentTransaction:v8 forPassUniqueIdentifier:v12 paymentApplication:v36 promotionalRewardItems:v38];
      uint64_t v31 = [(PDUserNotification *)v30 notificationIdentifier];
      userNotificationManager = self->_userNotificationManager;
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_1002DBF08;
      v42[3] = &unk_1007472B0;
      v42[4] = self;
      uint64_t v43 = v8;
      id v44 = v10;
      v45 = v30;
      BOOL v46 = v28;
      char v47 = v29;
      v33 = v30;
      id obj = (id)v31;
      [(PDUserNotificationManager *)userNotificationManager userNotificationWithIdentifier:v31 completion:v42];
    }
    id v13 = v36;
    goto LABEL_33;
  }
LABEL_42:
}

- (void)_updatePeerPaymentNotificationIfNecessaryForTransaction:(id)a3 existingTransaction:(id)a4 config:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 transactionSourceIdentifier];
  id v12 = (void *)v11;
  if (v8 && v11)
  {
    long long v49 = [v10 passUniqueIdentifier];
    long long v48 = [v10 familyMember];
    id v13 = [v10 associatedPeerPaymentAccount];
    BOOL v46 = v13 != 0;

    v45 = self;
    if (v13)
    {
      unsigned int v14 = 0;
    }
    else
    {
      id v15 = [v10 peerPaymentAccount];
      if (v15)
      {
        id v16 = [v10 peerPaymentAccount];
        id v17 = [v16 associatedPassUniqueID];
        unsigned int v14 = [v17 isEqualToString:v49];
      }
      else
      {
        unsigned int v14 = 0;
      }
    }
    uint32_t v18 = [v8 peerPaymentCounterpartHandle];
    unsigned __int8 v19 = [v10 currentUser];
    dispatch_queue_t v20 = [v19 appleID];
    id v21 = v18;
    id v22 = v20;
    id v23 = v22;
    if (v21 == v22)
    {
      unsigned int v24 = 0;
    }
    else
    {
      unsigned int v24 = 1;
      if (v21 && v22) {
        unsigned int v24 = [v21 isEqualToString:v22] ^ 1;
      }
    }

    v25 = [v8 recurringPeerPayment];
    id v26 = [v25 type];

    int v27 = v46;
    if (v14)
    {
      if (![v10 transactionSourceType])
      {
        [(PDTransactionNotificationController *)v45 _scheduleOrCancelBalanceReminderNotificationIfNecessaryForPassUniqueIdentifier:v49 config:v10 transaction:v8];
        if ([v8 transactionType] == (id)3 && objc_msgSend(v8, "peerPaymentType") == (id)2) {
          [(PDTransactionNotificationController *)v45 _scheduleOrCancelReminderNotificationsForPendingTransaction:v8 config:v10];
        }
      }
      int v27 = 1;
    }
    if (v26 == (id)3) {
      int v28 = 1;
    }
    else {
      int v28 = v24;
    }
    if (v28 == 1 && v27)
    {
      unsigned __int8 v29 = [v10 shouldReceiveNotificationsForPeerPaymentNotificationType:1];
      BOOL v30 = [v8 transactionStatusChangedDate];
      uint64_t v31 = v30;
      if (v30 && ([v30 timeIntervalSinceNow], fabs(v32) < 86400.0))
      {
        id v44 = [v8 transactionStatus];
        id v33 = [v9 transactionStatus];
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = sub_1002DC72C;
        v52[3] = &unk_100747328;
        v52[4] = v45;
        id v53 = v8;
        id v34 = v10;
        id v54 = v34;
        BOOL v57 = v46;
        id v47 = v49;
        id v55 = v47;
        id v56 = v48;
        BOOL v58 = v44 != v33;
        unsigned __int8 v59 = v29;
        char v60 = v14;
        v35 = objc_retainBlock(v52);
        id v36 = v35;
        if (v44 == v33)
        {
          ((void (*)(void *))v35[2])(v35);
        }
        else
        {
          v37 = [PDPeerPaymentTransactionReceivedUserNotification alloc];
          v38 = [v34 peerPaymentAccount];
          v39 = [v38 currentBalance];
          uint64_t v40 = [(PDPeerPaymentTransactionReceivedUserNotification *)v37 initWithPassUniqueIdentifier:v47 accountBalance:v39];

          id v41 = [(PDUserNotification *)v40 notificationIdentifier];
          userNotificationManager = v45->_userNotificationManager;
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = sub_1002DD8A4;
          v50[3] = &unk_100746350;
          v50[4] = v45;
          id v51 = v36;
          [(PDUserNotificationManager *)userNotificationManager userNotificationWithIdentifier:v41 completion:v50];
        }
      }
      else
      {
        uint64_t v43 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v62 = v8;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Not creating notification for transaction %@ because transaction status changed more than 1 day ago.", buf, 0xCu);
        }
      }
    }
  }
}

- (BOOL)_shouldDisplayNotificationForManuallyAcceptedPeerPaymentTransaction:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 transactionType] == (id)3
    && [v6 transactionStatus] == (id)1
    && [v6 peerPaymentType] == (id)1
    && [(PDTransactionNotificationController *)self _shouldCreateNotificationForTransactionUpdateReasons:v6 notificationTypeDescription:@"manually accepted peer payment notification"])
  {
    if (([v7 shouldReceiveNotificationsForPeerPaymentNotificationType:1] & 1) == 0)
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [v7 associatedPeerPaymentAccount];
        id v13 = [v12 altDSID];
        int v19 = 138412290;
        dispatch_queue_t v20 = v13;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not displaying notification for approved peer payment transaction since the preference for this associated account altDSID %@ is turned off", (uint8_t *)&v19, 0xCu);
      }
      BOOL v10 = 0;
      goto LABEL_22;
    }
    id v8 = [v6 transactionDate];
    id v9 = [v6 transactionStatusChangedDate];
    if (v9 && v8)
    {
      if ([(PDTransactionNotificationController *)self _isValidTimeBetweenCreationAndAcceptForPeerPaymentTransaction:v6 config:v7])
      {
        BOOL v10 = 1;
LABEL_21:

LABEL_22:
        goto LABEL_11;
      }
      unsigned int v14 = [v6 transactionDate];
      id v15 = [v6 transactionStatusChangedDate];
      [v15 timeIntervalSinceDate:v14];
      id v17 = v16;
      uint32_t v18 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 134218498;
        dispatch_queue_t v20 = v17;
        __int16 v21 = 2112;
        id v22 = v15;
        __int16 v23 = 2112;
        unsigned int v24 = v14;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Not displaying notification for approved peer payment transaction with a status changed date %.1f seconds after creation date. StatusChangedDate: %@ CreationDate: %@", (uint8_t *)&v19, 0x20u);
      }
    }
    else
    {
      unsigned int v14 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412546;
        dispatch_queue_t v20 = v9;
        __int16 v21 = 2112;
        id v22 = v8;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not displaying notification for approved peer payment transaction without a status changed and creation date. StatusChangedDate: %@ CreationDate: %@", (uint8_t *)&v19, 0x16u);
      }
    }

    BOOL v10 = 0;
    goto LABEL_21;
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)_shouldDisplayNotificationForReceivedPeerPaymentTransaction:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v7 transactionSourceType] <= 1
    && [v6 transactionType] == (id)3
    && [v6 transactionStatus] == (id)1
    && [v6 peerPaymentType] == (id)2)
  {
    uint64_t v8 = [v6 recurringPeerPayment];
    if (!v8
      || (id v9 = (void *)v8,
          [v7 associatedPeerPaymentAccount],
          BOOL v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          v10))
    {
      if ([(PDTransactionNotificationController *)self _shouldCreateNotificationForTransactionUpdateReasons:v6 notificationTypeDescription:@"manually accepted peer payment notification"])
      {
        if (([v7 shouldReceiveNotificationsForPeerPaymentNotificationType:1] & 1) == 0)
        {
          uint64_t v11 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = [v7 associatedPeerPaymentAccount];
            id v16 = [v15 altDSID];
            int v22 = 138412290;
            __int16 v23 = v16;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not displaying notification for approved peer payment transaction since the preference for this associated account altDSID %@ is turned off", (uint8_t *)&v22, 0xCu);
          }
          BOOL v13 = 0;
          goto LABEL_25;
        }
        uint64_t v11 = [v6 transactionDate];
        id v12 = [v6 transactionStatusChangedDate];
        if (v12 && v11)
        {
          if ([(PDTransactionNotificationController *)self _isValidTimeBetweenCreationAndAcceptForPeerPaymentTransaction:v6 config:v7])
          {
            BOOL v13 = 1;
LABEL_24:

LABEL_25:
            goto LABEL_14;
          }
          id v17 = [v6 transactionDate];
          uint32_t v18 = [v6 transactionStatusChangedDate];
          [v18 timeIntervalSinceDate:v17];
          dispatch_queue_t v20 = v19;
          __int16 v21 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            int v22 = 134218498;
            __int16 v23 = v20;
            __int16 v24 = 2112;
            v25 = v18;
            __int16 v26 = 2112;
            int v27 = v17;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Not displaying notification for a received peer payment transaction on an associated account with a status changed date %.1f seconds after creation date. StatusChangedDate: %@ CreationDate: %@", (uint8_t *)&v22, 0x20u);
          }
        }
        else
        {
          id v17 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            int v22 = 138412546;
            __int16 v23 = v12;
            __int16 v24 = 2112;
            v25 = v11;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Not displaying notification for a received peer payment transaction on an associated account without a status changed and creation date. StatusChangedDate: %@ CreationDate: %@", (uint8_t *)&v22, 0x16u);
          }
        }

        BOOL v13 = 0;
        goto LABEL_24;
      }
    }
  }
  BOOL v13 = 0;
LABEL_14:

  return v13;
}

- (BOOL)_isValidTimeBetweenCreationAndAcceptForPeerPaymentTransaction:(id)a3 config:(id)a4
{
  id v5 = a3;
  id v6 = [a4 transactionSourceType];
  double v7 = 0.0;
  if ((unint64_t)v6 <= 3 && v6 != (id)1)
  {
    if ([v5 peerPaymentType] == (id)2) {
      double v7 = 0.0;
    }
    else {
      double v7 = 10.0;
    }
  }
  uint64_t v8 = [v5 transactionDate];
  id v9 = [v5 transactionStatusChangedDate];
  [v9 timeIntervalSinceDate:v8];
  BOOL v11 = v10 >= v7;

  return v11;
}

- (void)_scheduleOrCancelBalanceReminderNotificationIfNecessaryForPassUniqueIdentifier:(id)a3 config:(id)a4 transaction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 transactionType];
  id v12 = v11;
  BOOL v13 = 1;
  if (v11 && v11 != (id)5) {
    BOOL v13 = v11 == (id)3 && [v10 peerPaymentType] == (id)1;
  }
  unsigned int v14 = [v9 peerPaymentAccount];
  if ([v14 isAccountStateDirty])
  {
    BOOL v15 = 0;
  }
  else
  {
    id v16 = [v9 peerPaymentAccount];
    id v17 = [v16 lastUpdated];
    [v17 timeIntervalSinceNow];
    BOOL v15 = v18 > -60.0;
  }
  char v19 = PKShouldSuppressPeerPaymentBalanceReminder();
  if (v12 != (id)3 || (v19 & 1) != 0)
  {
    if (!v13) {
      goto LABEL_23;
    }
  }
  else
  {
    id v20 = [v10 peerPaymentType];
    if (!v13)
    {
      if (v20 == (id)2 && v15)
      {
        int v22 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Scheduling/updating peer payment balance reminder", buf, 2u);
        }

        __int16 v23 = [v9 peerPaymentAccount];
        __int16 v24 = [v23 currentBalance];

        userNotificationManager = self->_userNotificationManager;
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_1002DE244;
        v28[3] = &unk_100733420;
        id v29 = v24;
        BOOL v30 = self;
        id v31 = v8;
        id v26 = v24;
        [(PDUserNotificationManager *)userNotificationManager userNotificationsForPassUniqueIdentifier:v31 ofType:14 completion:v28];
      }
      goto LABEL_23;
    }
  }
  int v27 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Removing and suppressing future peer payment balance reminders", buf, 2u);
  }

  PKSetShouldSuppressPeerPaymentBalanceReminder();
  [(PDUserNotificationManager *)self->_userNotificationManager removeUserNotificationsForPassUniqueIdentifier:v8 ofType:14];
LABEL_23:
}

- (void)_scheduleOrCancelReminderNotificationsForPendingTransaction:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 passUniqueIdentifier];
  id v9 = [v7 familyMember];

  id v10 = [[PDPeerPaymentTransactionReminderUserNotification alloc] initWithPaymentTransaction:v6 forPassUniqueIdentifier:v8 familyMember:v9 reminderPeriod:0];
  id v11 = [[PDPeerPaymentTransactionReminderUserNotification alloc] initWithPaymentTransaction:v6 forPassUniqueIdentifier:v8 familyMember:v9 reminderPeriod:1];
  id v12 = [(PDUserNotification *)v10 date];
  [v12 timeIntervalSinceNow];
  double v14 = v13;

  BOOL v15 = [(PDUserNotification *)v11 date];
  [v15 timeIntervalSinceNow];
  double v17 = v16;

  if ([v6 peerPaymentStatus])
  {
    [(PDUserNotificationManager *)self->_userNotificationManager removeUserNotification:v10];
    [(PDUserNotificationManager *)self->_userNotificationManager removeUserNotification:v11];
  }
  else
  {
    if (v14 >= 0.0 || [v6 isRecurring] && v17 >= 0.0)
    {
      double v18 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412290;
        id v21 = v6;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Adding user notification reminder for pending transaction %@", (uint8_t *)&v20, 0xCu);
      }

      [(PDUserNotification *)v10 setReissueBannerOnUpdate:0];
      [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v10];
    }
    if (v17 >= 0.0)
    {
      char v19 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412290;
        id v21 = v6;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Adding user notification reminder for pending transaction %@", (uint8_t *)&v20, 0xCu);
      }

      [(PDUserNotification *)v11 setReissueBannerOnUpdate:0];
      [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v11];
    }
  }
}

- (BOOL)_transactionHasBeenUpdatedRecentlyEnoughForNotification:(id)a3
{
  id v3 = a3;
  v4 = [v3 transactionStatusChangedDate];
  if (!v4)
  {
    v4 = [v3 transactionDate];
    if (!v4)
    {
      id v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        id v10 = v3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not creating merchant transaction notification for transaction %@ because it does not have a transactionDate.", (uint8_t *)&v9, 0xCu);
      }
      v4 = 0;
      goto LABEL_10;
    }
  }
  [v4 timeIntervalSinceNow];
  if (fabs(v5) > 86400.0)
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not creating merchant transaction notification for transaction %@ because it has been more than 1 day since the transaction changed.", (uint8_t *)&v9, 0xCu);
    }
LABEL_10:

    BOOL v7 = 0;
    goto LABEL_11;
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)_shouldCreateMerchantTransactionNotificationForTransaction:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 paymentPass];
  if ([v6 suppressNotifications])
  {
    int v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      id v10 = "Not creating merchant transaction notification for transaction that requested suppress notifications";
      id v11 = v9;
      uint32_t v12 = 2;
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v22, v12);
    }
LABEL_26:

    goto LABEL_27;
  }
  if ([v6 transactionType] == (id)3)
  {
    int v9 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    int v22 = 138412290;
    id v23 = v6;
    id v10 = "Not creating merchant transaction notification for peer payment transaction %@.";
LABEL_24:
    id v11 = v9;
    uint32_t v12 = 12;
    goto LABEL_25;
  }
  if (([v7 shouldReceiveNotificationsForPeerPaymentNotificationType:1] & 1) == 0)
  {
    int v9 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    int v22 = 138412290;
    id v23 = v6;
    id v10 = "Not creating merchant transaction notification for a purchase performed on an associated peer payment transaction %@.";
    goto LABEL_24;
  }
  if ([v6 transactionType] == (id)10)
  {
    int v9 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    int v22 = 138412290;
    id v23 = v6;
    id v10 = "Not creating transaction notification for bill payment transaction %@.";
    goto LABEL_24;
  }
  if ([v6 transactionType] == (id)14)
  {
    int v9 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    int v22 = 138412290;
    id v23 = v6;
    id v10 = "Not creating transaction notification for installment plan transaction %@.";
    goto LABEL_24;
  }
  uint64_t v13 = [v8 associatedAccountServiceAccountIdentifier];
  if (v13)
  {
    double v14 = (void *)v13;
    uint64_t v15 = [v6 amount];
    if (v15)
    {
      double v16 = (void *)v15;
      double v17 = [v6 amount];
      double v18 = +[NSDecimalNumber zero];
      unsigned int v19 = [v17 isEqualToNumber:v18];

      if (!v19) {
        goto LABEL_19;
      }
    }
    else
    {
    }
    int v9 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    int v22 = 138412290;
    id v23 = v6;
    id v10 = "Not creating merchant transaction notification for zero dollar amount transaction %@.";
    goto LABEL_24;
  }
LABEL_19:
  if (![(PDTransactionNotificationController *)self _transactionHasBeenUpdatedRecentlyEnoughForNotification:v6])
  {
LABEL_27:
    BOOL v20 = 0;
    goto LABEL_28;
  }
  BOOL v20 = [(PDTransactionNotificationController *)self _shouldCreateNotificationForTransactionUpdateReasons:v6 notificationTypeDescription:@"merchant transaction notification"];
LABEL_28:

  return v20;
}

- (BOOL)_shouldDeleteNotificationForTransaction:(id)a3
{
  id v3 = a3;
  if ([v3 transactionType] == (id)8)
  {
    if ([v3 suppressBehavior] == (id)1) {
      goto LABEL_6;
    }
    v4 = [v3 redemptionEvent];

    if (v4) {
      goto LABEL_6;
    }
  }
  uint64_t v5 = [v3 accountIdentifier];
  if (!v5) {
    goto LABEL_7;
  }
  id v6 = (void *)v5;
  id v7 = [v3 unansweredQuestions];
  id v8 = [v7 count];

  if (v8)
  {
LABEL_6:
    unsigned __int8 v9 = 1;
  }
  else
  {
LABEL_7:
    id v10 = [v3 accountIdentifier];
    if (v10)
    {
      id v11 = [v3 amount];
      if (v11)
      {
        uint32_t v12 = [v3 amount];
        uint64_t v13 = +[NSDecimalNumber zero];
        unsigned __int8 v9 = [v12 isEqualToNumber:v13];
      }
      else
      {
        unsigned __int8 v9 = 1;
      }
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  return v9;
}

- (BOOL)_shouldCreateNotificationForTransactionUpdateReasons:(id)a3 notificationTypeDescription:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned __int16 v7 = (unsigned __int16)[v5 updateReasons];
  if ((v7 & 0xCD8) == 0)
  {
    unsigned __int8 v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v5 updateReasonsDescription];
      int v14 = 138543874;
      id v15 = v6;
      __int16 v16 = 2114;
      double v17 = v10;
      __int16 v18 = 2112;
      id v19 = v5;
      id v11 = "Not creating %{public}@ for transaction that did not have a relevant update reason set. Update Reasons: %{pu"
            "blic}@. Transaction: %@";
      goto LABEL_14;
    }
LABEL_15:

    BOOL v12 = 0;
    goto LABEL_16;
  }
  unsigned __int16 v8 = v7;
  if ([v5 updateReasonIsInitialDownload])
  {
    unsigned __int8 v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v5 updateReasonsDescription];
      int v14 = 138543874;
      id v15 = v6;
      __int16 v16 = 2114;
      double v17 = v10;
      __int16 v18 = 2112;
      id v19 = v5;
      id v11 = "Not creating %{public}@ for transaction that was part of the initial cloudkit sync. Update Reasons: %{public"
            "}@. Transaction: %@";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, 0x20u);

      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if ((v8 & 0x1000) != 0)
  {
    unsigned __int8 v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v5 updateReasonsDescription];
      int v14 = 138543874;
      id v15 = v6;
      __int16 v16 = 2114;
      double v17 = v10;
      __int16 v18 = 2112;
      id v19 = v5;
      id v11 = "Not creating %{public}@ for transaction that was part of initial notification service update. Update Reasons"
            ": %{public}@. Transaction: %@";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if ((v8 & 0x4000) != 0)
  {
    unsigned __int8 v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v5 updateReasonsDescription];
      int v14 = 138543874;
      id v15 = v6;
      __int16 v16 = 2114;
      double v17 = v10;
      __int16 v18 = 2112;
      id v19 = v5;
      id v11 = "Not creating %{public}@ for transaction that was reprocessed for merchant cleanup. Update Reasons: %{public}"
            "@. Transaction: %@";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  BOOL v12 = 1;
LABEL_16:

  return v12;
}

- (BOOL)_shouldCreatePromotionRewardNotificationForTransaction:(id)a3 config:(id)a4
{
  id v5 = a3;
  if ([v5 suppressNotifications])
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      unsigned __int16 v7 = "Not creating merchant transaction notification for transaction that requested suppress notifications";
      unsigned __int16 v8 = v6;
      uint32_t v9 = 2;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, v9);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ([v5 transactionType])
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v5;
      unsigned __int16 v7 = "Not creating promotion notification for non-purchase transaction %@.";
      unsigned __int16 v8 = v6;
      uint32_t v9 = 12;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if ([(PDTransactionNotificationController *)self _transactionHasBeenUpdatedRecentlyEnoughForNotification:v5])
  {
    BOOL v10 = [(PDTransactionNotificationController *)self _shouldCreateNotificationForTransactionUpdateReasons:v5 notificationTypeDescription:@"merchant transaction notification"];
    goto LABEL_10;
  }
LABEL_9:
  BOOL v10 = 0;
LABEL_10:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_familyCircleManager, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
}

@end