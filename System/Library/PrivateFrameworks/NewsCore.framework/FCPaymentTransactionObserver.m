@interface FCPaymentTransactionObserver
- (FCPaymentTransactionObserverDelegate)delegate;
- (void)failedTransaction:(id)a3;
- (void)finishTransaction:(id)a3;
- (void)paymentQueue:(id)a3 updatedTransactions:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation FCPaymentTransactionObserver

- (void)setDelegate:(id)a3
{
}

- (void)paymentQueue:(id)a3 updatedTransactions:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v20;
    *(void *)&long long v9 = 138543618;
    long long v18 = v9;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
        v14 = (void *)FCPurchaseLog;
        if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
        {
          v15 = v14;
          uint64_t v16 = objc_opt_class();
          uint64_t v17 = [v13 transactionState];
          *(_DWORD *)buf = v18;
          uint64_t v24 = v16;
          __int16 v25 = 2048;
          uint64_t v26 = v17;
          _os_log_impl(&dword_1A460D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ transactionState: %lu", buf, 0x16u);
        }
        switch(objc_msgSend(v13, "transactionState", v18))
        {
          case 1:
          case 3:
            [v6 finishTransaction:v13];
            [(FCPaymentTransactionObserver *)self finishTransaction:v13];
            break;
          case 2:
            [v6 finishTransaction:v13];
            goto LABEL_11;
          case 4:
LABEL_11:
            [(FCPaymentTransactionObserver *)self failedTransaction:v13];
            break;
          default:
            break;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v10);
  }
}

- (void)finishTransaction:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = [v4 payment];
    long long v9 = [v8 productIdentifier];
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    v14 = v9;
    _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ finish transaction with product identifier: %lu", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v10 = [(FCPaymentTransactionObserver *)self delegate];
  [v10 paymentTransactionObserver:self didFinishPurchaseTransaction:v4];
}

- (void)failedTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(FCPaymentTransactionObserver *)self delegate];
  [v5 paymentTransactionObserver:self didFailPurchaseTransactionWithTransaction:v4];
}

- (FCPaymentTransactionObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FCPaymentTransactionObserverDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end