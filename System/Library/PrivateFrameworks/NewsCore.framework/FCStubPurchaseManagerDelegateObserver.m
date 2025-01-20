@interface FCStubPurchaseManagerDelegateObserver
- (id)failedBlock;
- (id)failedWithInvalidReceiptBlock;
- (id)successBlock;
- (void)purchaseFailedForInvalidPurchaseReceiptWithProductID:(id)a3 ongoingPurchaseEntry:(id)a4;
- (void)purchaseFailedWithProductID:(id)a3 transactionState:(int64_t)a4 transactionError:(id)a5 ongoingPurchaseEntry:(id)a6;
- (void)purchaseSuccessWithProductID:(id)a3 transaction:(id)a4 chargeCurrencyCode:(id)a5 ongoingPurchaseEntry:(id)a6;
- (void)setFailedBlock:(id)a3;
- (void)setFailedWithInvalidReceiptBlock:(id)a3;
- (void)setSuccessBlock:(id)a3;
@end

@implementation FCStubPurchaseManagerDelegateObserver

- (void)purchaseFailedWithProductID:(id)a3 transactionState:(int64_t)a4 transactionError:(id)a5 ongoingPurchaseEntry:(id)a6
{
  id v14 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = [(FCStubPurchaseManagerDelegateObserver *)self failedBlock];

  if (v12)
  {
    v13 = [(FCStubPurchaseManagerDelegateObserver *)self failedBlock];
    ((void (**)(void, id, int64_t, id, id))v13)[2](v13, v14, a4, v10, v11);
  }
}

- (void)purchaseFailedForInvalidPurchaseReceiptWithProductID:(id)a3 ongoingPurchaseEntry:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(FCStubPurchaseManagerDelegateObserver *)self failedWithInvalidReceiptBlock];

  if (v7)
  {
    v8 = [(FCStubPurchaseManagerDelegateObserver *)self failedWithInvalidReceiptBlock];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
}

- (void)purchaseSuccessWithProductID:(id)a3 transaction:(id)a4 chargeCurrencyCode:(id)a5 ongoingPurchaseEntry:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [(FCStubPurchaseManagerDelegateObserver *)self successBlock];

  if (v13)
  {
    id v14 = [(FCStubPurchaseManagerDelegateObserver *)self successBlock];
    v15 = [v10 receipt];
    ((void (**)(void, id, void *, id, id))v14)[2](v14, v16, v15, v11, v12);
  }
}

- (id)successBlock
{
  return self->_successBlock;
}

- (void)setSuccessBlock:(id)a3
{
}

- (id)failedBlock
{
  return self->_failedBlock;
}

- (void)setFailedBlock:(id)a3
{
}

- (id)failedWithInvalidReceiptBlock
{
  return self->_failedWithInvalidReceiptBlock;
}

- (void)setFailedWithInvalidReceiptBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_failedWithInvalidReceiptBlock, 0);
  objc_storeStrong(&self->_failedBlock, 0);
  objc_storeStrong(&self->_successBlock, 0);
}

@end