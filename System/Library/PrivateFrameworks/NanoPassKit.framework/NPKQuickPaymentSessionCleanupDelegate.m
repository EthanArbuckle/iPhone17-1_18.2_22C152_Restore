@interface NPKQuickPaymentSessionCleanupDelegate
- (void)_saveTransactionFromContext:(id)a3;
- (void)paymentSession:(id)a3 didCompleteTransactionForReason:(unint64_t)a4 withTransactionContext:(id)a5 shouldCleanupSession:(BOOL)a6;
@end

@implementation NPKQuickPaymentSessionCleanupDelegate

- (void)paymentSession:(id)a3 didCompleteTransactionForReason:(unint64_t)a4 withTransactionContext:(id)a5 shouldCleanupSession:(BOOL)a6
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a5;
  v9 = pk_Payment_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    v11 = pk_Payment_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v8 transaction];
      v13 = [v8 transitHistory];
      v14 = [v8 paymentPass];
      v15 = [v14 uniqueID];
      v16[0] = 67109890;
      v16[1] = a4;
      __int16 v17 = 2112;
      v18 = v12;
      __int16 v19 = 2112;
      v20 = v13;
      __int16 v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Cleanup delegate got session complete for reason %d with transaction %@ and transit history %@ for unique ID %@", (uint8_t *)v16, 0x26u);
    }
  }
  if (a4 == 3) {
    [(NPKQuickPaymentSessionCleanupDelegate *)self _saveTransactionFromContext:v8];
  }
}

- (void)_saveTransactionFromContext:(id)a3
{
  id v12 = a3;
  id v3 = objc_alloc_init(MEMORY[0x263F5C0A8]);
  v4 = [v12 transaction];

  if (v4)
  {
    v5 = [v12 transaction];
    v6 = [v12 paymentPass];
    v7 = [v6 uniqueID];
    id v8 = [v12 paymentApplication];
    [v3 insertOrUpdatePaymentTransaction:v5 forPassUniqueIdentifier:v7 paymentApplication:v8 completion:0];
  }
  else
  {
    v9 = [v12 transitHistory];

    if (!v9) {
      goto LABEL_6;
    }
    v5 = [v12 transitHistory];
    v6 = [v12 date];
    v7 = [v12 paymentApplication];
    id v8 = [v12 paymentPass];
    BOOL v10 = [v8 uniqueID];
    v11 = [v12 expressState];
    [v3 processTransitTransactionEventWithHistory:v5 transactionDate:v6 forPaymentApplication:v7 withPassUniqueIdentifier:v10 expressTransactionState:v11];
  }
LABEL_6:
}

@end