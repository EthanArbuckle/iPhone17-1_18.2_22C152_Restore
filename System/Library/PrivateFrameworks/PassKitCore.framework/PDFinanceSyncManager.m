@interface PDFinanceSyncManager
- (BOOL)_canSyncAccountToFinanceKit:(id)a3;
- (BOOL)_canSyncPeerPaymentAccountToFinanceKit:(id)a3;
- (BOOL)_canSyncTransactionToFinanceKit:(id)a3;
- (PDFinanceSyncManager)initWithDatabaseManager:(id)a3;
- (id)_fkAppleAccountFromAccount:(id)a3;
- (id)_fkAppleAccountFromPeerPaymentAccount:(id)a3;
- (void)retryTimerFired;
- (void)setNeedsSync;
- (void)sync;
- (void)syncIfNeeded;
@end

@implementation PDFinanceSyncManager

- (PDFinanceSyncManager)initWithDatabaseManager:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDFinanceSyncManager;
  v6 = [(PDFinanceSyncManager *)&v13 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.passd.pdfinancesyncmanager.work", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_databaseManager, a3);
    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    insertionErrorCounts = v6->_insertionErrorCounts;
    v6->_insertionErrorCounts = v10;

    v6->_errorRetryCount = 0;
  }

  return v6;
}

- (void)setNeedsSync
{
}

- (void)retryTimerFired
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Retry timer fired", v4, 2u);
  }

  atomic_store(0, (unsigned __int8 *)&self->_isBusy);
  [(PDFinanceSyncManager *)self syncIfNeeded];
}

- (void)syncIfNeeded
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_needsSync);
  if (v2)
  {
    char v3 = 0;
    atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_isBusy, (unsigned __int8 *)&v3, 1u);
    if (!v3) {
      [(PDFinanceSyncManager *)self sync];
    }
  }
}

- (void)sync
{
  char v3 = (void *)PDOSTransactionCreate("PDFinanceSyncManager.sync");
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E25B8;
  v6[3] = &unk_10072E198;
  id v7 = v3;
  dispatch_queue_t v8 = self;
  id v5 = v3;
  dispatch_async(queue, v6);
}

- (BOOL)_canSyncAccountToFinanceKit:(id)a3
{
  id v3 = a3;
  v4 = [v3 accountIdentifier];
  if (v4)
  {
    id v5 = [v3 lastUpdated];

    if (v5)
    {
      switch((unint64_t)[v3 type])
      {
        case 0uLL:
        case 2uLL:
        case 3uLL:
          uint64_t v6 = PKLogFacilityTypeGetObject();
          if (!os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_14;
          }
          [v3 type];
          id v7 = PKAccountTypeToString();
          int v24 = 138412546;
          v25 = v4;
          __int16 v26 = 2112;
          v27 = v7;
          dispatch_queue_t v8 = "Not syncing account %@ to FinanceKit since its type (%@) is not supported";
          v9 = v6;
          uint32_t v10 = 22;
          goto LABEL_6;
        case 1uLL:
          v16 = [v3 creditDetails];
          v14 = [v16 currencyCode];

          if (v14)
          {
            v17 = [v3 creditDetails];
            v18 = [v17 accountSummary];
            uint64_t v6 = [v18 currentBalance];

            v19 = [v3 creditDetails];
            v20 = [v19 accountSummary];
            uint64_t v21 = [v20 availableCredit];

            if ([v3 accessLevel] != (id)2 && v6 | v21)
            {
              LOBYTE(v14) = 1;
            }
            else
            {
              v14 = PKLogFacilityTypeGetObject();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                int v24 = 138412290;
                v25 = v4;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Temporarily not syncing account with identifier %@ to FinanceKit because it is a participant account or there is no currentBalance or availableCredit", (uint8_t *)&v24, 0xCu);
              }

              LOBYTE(v14) = 0;
            }

            goto LABEL_15;
          }
          uint64_t v6 = PKLogFacilityTypeGetObject();
          if (!os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_15;
          }
          int v24 = 138412290;
          v25 = v4;
          v11 = "Not syncing account with identifier %@ to FinanceKit because there is no currencyCode set on the account";
          goto LABEL_12;
        case 4uLL:
          v22 = [v3 savingsDetails];
          v14 = [v22 currencyCode];

          if (v14)
          {
            v14 = [v3 savingsDetails];
            v23 = [v14 accountSummary];
            uint64_t v6 = [v23 currentBalance];

            LOBYTE(v14) = v6 != 0;
            if (v6) {
              goto LABEL_15;
            }
            id v7 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            {
              int v24 = 138412290;
              v25 = v4;
              dispatch_queue_t v8 = "Temporarily not syncing account with identifier %@ to FinanceKit because there is no currentBalance";
              v9 = v7;
              uint32_t v10 = 12;
LABEL_6:
              _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v24, v10);
            }

            goto LABEL_14;
          }
          uint64_t v6 = PKLogFacilityTypeGetObject();
          if (!os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_15;
          }
          int v24 = 138412290;
          v25 = v4;
          v11 = "Not syncing account with identifier %@ to FinanceKit because there is no currencyCode set on the account";
          break;
        default:
          LOBYTE(v14) = 0;
          goto LABEL_16;
      }
      goto LABEL_12;
    }
    uint64_t v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      v25 = v4;
      v11 = "Not syncing account with identifier %@ to FinanceKit because there is no lastUpdated set on the account";
LABEL_12:
      v12 = v6;
      uint32_t v13 = 12;
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      v11 = "Not syncing account to FinanceKit because there is no account identifier set on the account";
      v12 = v6;
      uint32_t v13 = 2;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v24, v13);
    }
  }
LABEL_14:
  LOBYTE(v14) = 0;
LABEL_15:

LABEL_16:
  return (char)v14;
}

- (BOOL)_canSyncPeerPaymentAccountToFinanceKit:(id)a3
{
  id v3 = a3;
  v4 = [v3 identifier];
  if (!v4)
  {
    dispatch_queue_t v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      v9 = "Not syncing peer payment account with nil identifier to FinanceKit";
      uint32_t v10 = v8;
      uint32_t v11 = 2;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v16, v11);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  id v5 = [v3 currentBalance];
  uint64_t v6 = [v5 currency];

  if (v6)
  {
    id v7 = [v3 lastUpdated];

    if (!v7)
    {
      dispatch_queue_t v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        v17 = v4;
        v9 = "Not syncing peer payment account with identifier %@ to FinanceKit because there is no lastUpdated set on the account";
        goto LABEL_13;
      }
      goto LABEL_15;
    }
    if ([v3 stage] == (id)1)
    {
      dispatch_queue_t v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        v17 = v4;
        v9 = "Not syncing peer payment account with identifier %@ to FinanceKit because it is at anonymous stage";
LABEL_13:
        uint32_t v10 = v8;
        uint32_t v11 = 12;
        goto LABEL_14;
      }
LABEL_15:
      LOBYTE(v6) = 0;
      goto LABEL_16;
    }
    uint32_t v13 = [v3 currentBalance];
    dispatch_queue_t v8 = [v13 amount];

    BOOL v14 = [v3 role] == (id)1 || v8 == 0;
    LOBYTE(v6) = !v14;
    if (v14)
    {
      v15 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        v17 = v4;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Temporarily not syncing peer payment account with identifier %@ to FinanceKit because it is a participant account or there is no currentBalance", (uint8_t *)&v16, 0xCu);
      }

      goto LABEL_15;
    }
  }
  else
  {
    dispatch_queue_t v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      v17 = v4;
      v9 = "Not syncing peer payment account with identifier %@ to FinanceKit because there is no currency set on the account";
      goto LABEL_13;
    }
  }
LABEL_16:

  return (char)v6;
}

- (BOOL)_canSyncTransactionToFinanceKit:(id)a3
{
  id v3 = a3;
  v4 = [v3 identifier];
  if (!v4)
  {
    dispatch_queue_t v8 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    uint32_t v10 = [v3 identifier];
    int v17 = 138412290;
    v18 = v10;
    uint32_t v11 = "Not syncing transaction with identifier %@ to FinanceKit because there is no identifier set on the transaction";
    v12 = v8;
    uint32_t v13 = 12;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, v13);

    goto LABEL_18;
  }
  id v5 = [v3 accountIdentifier];

  if (!v5)
  {
    dispatch_queue_t v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      v18 = v4;
      v9 = "Not syncing transaction with identifier %@ to FinanceKit because there is no account identifier set on the transaction";
      goto LABEL_17;
    }
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v6 = [v3 currencyCode];

  if (!v6)
  {
    dispatch_queue_t v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      v18 = v4;
      v9 = "Not syncing transaction with identifier %@ to FinanceKit because there is no currencyCode set on the transaction";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  id v7 = [v3 transactionDate];

  if (!v7)
  {
    dispatch_queue_t v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      v18 = v4;
      v9 = "Not syncing transaction with identifier %@ to FinanceKit because there is no transactionDate set on the transaction";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if ([v3 transactionType] == (id)14)
  {
    dispatch_queue_t v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      v18 = v4;
      v9 = "Not syncing transaction with identifier %@ to FinanceKit because its type is PKPaymentTransactionTypeInstallmentPlan";
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v17, 0xCu);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  int v16 = (char *)[v3 accountType];
  if ((unint64_t)(v16 - 1) < 3)
  {
    BOOL v14 = 1;
    goto LABEL_20;
  }
  if (v16 == (char *)4 || !v16)
  {
    dispatch_queue_t v8 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    [v3 accountType];
    uint32_t v10 = PKPaymentTransactionAccountTypeToString();
    int v17 = 138412546;
    v18 = v4;
    __int16 v19 = 2112;
    v20 = v10;
    uint32_t v11 = "Not syncing transaction with identifier %@ to FinanceKit because the account type is unknown %@";
    v12 = v8;
    uint32_t v13 = 22;
    goto LABEL_10;
  }
LABEL_19:
  BOOL v14 = 0;
LABEL_20:

  return v14;
}

- (id)_fkAppleAccountFromAccount:(id)a3
{
  id v3 = a3;
  v4 = [v3 accountIdentifier];
  id v5 = [v3 lastUpdated];
  unint64_t v6 = (unint64_t)[v3 state] - 3;
  if (v6 > 2) {
    id v40 = 0;
  }
  else {
    id v40 = (id)qword_1005B31E8[v6];
  }
  id v7 = [v3 type];
  if (v7 == (id)4)
  {
    v30 = [v3 savingsDetails];
    v31 = [v30 accountSummary];
    v29 = [v31 currentBalance];

    v32 = [v3 savingsDetails];
    v33 = [v32 accountSummary];
    v42 = [v33 currentBalance];

    v34 = [v3 savingsDetails];
    v39 = [v34 currencyCode];

    __int16 v19 = PKLocalizedFeatureString();
    v28 = 0;
    v18 = 0;
    v22 = 0;
    v27 = 0;
    uint64_t v35 = 2;
  }
  else
  {
    if (v7 == (id)1)
    {
      dispatch_queue_t v8 = [v3 creditDetails];
      v9 = [v8 totalBalance];
      uint64_t v37 = [v9 amount];

      uint32_t v10 = [v3 creditDetails];
      uint32_t v11 = [v10 accountSummary];
      uint64_t v12 = [v11 remainingMinimumPayment];

      uint32_t v13 = [v3 creditDetails];
      BOOL v14 = [v13 accountSummary];
      v42 = [v14 availableCredit];

      v15 = [v3 creditDetails];
      v39 = [v15 currencyCode];

      int v16 = [v3 creditDetails];
      int v17 = [v16 accountSummary];
      v18 = [v17 paymentDueDate];

      [v3 feature];
      __int16 v19 = PKLocalizedFeatureString();
      v20 = [v3 creditDetails];
      uint64_t v21 = [v20 accountSummary];
      v22 = [v21 creditLimit];

      v23 = [v3 creditDetails];
      [v23 accountSummary];
      int v24 = v5;
      __int16 v26 = v25 = v4;
      v27 = [v26 pastDueAmount];

      v4 = v25;
      id v5 = v24;
      v28 = (void *)v12;
      v29 = (void *)v37;

      uint64_t v38 = 0;
      goto LABEL_10;
    }
    v42 = 0;
    v28 = 0;
    v39 = 0;
    v18 = 0;
    v29 = 0;
    __int16 v19 = 0;
    v22 = 0;
    v27 = 0;
    uint64_t v35 = -1;
  }
  uint64_t v38 = v35;
LABEL_10:
  id v41 = [objc_alloc(off_100805638()) initWithAccountIdentifier:v4 currentBalance:v29 totalBalance:v42 currency:v39 status:v40 type:v38 creditLimit:v22 minimumDueAmount:v28 nextPaymentDueDate:v18 lastUpdated:v5 displayName:v19 openingDate:0 overduePaymentAmount:v27];

  return v41;
}

- (id)_fkAppleAccountFromPeerPaymentAccount:(id)a3
{
  id v3 = a3;
  v4 = [v3 identifier];
  id v5 = [v3 currentBalance];
  unint64_t v6 = [v5 amount];

  id v7 = v6;
  dispatch_queue_t v8 = [v3 currentBalance];
  v9 = [v8 currency];

  uint32_t v10 = [v3 lastUpdated];
  uint32_t v11 = PKLocalizedPeerPaymentString(@"APPLE_CASH");
  id v12 = [v3 state];

  if (v12 == (id)4) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = 2 * (v12 == (id)3);
  }
  id v14 = [objc_alloc(off_100805638()) initWithAccountIdentifier:v4 currentBalance:v7 totalBalance:v7 currency:v9 status:v13 type:1 creditLimit:0 minimumDueAmount:0 nextPaymentDueDate:0 lastUpdated:v10 displayName:v11 openingDate:0 overduePaymentAmount:0];

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_insertionErrorCounts, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end