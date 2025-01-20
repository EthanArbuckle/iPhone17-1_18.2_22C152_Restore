@interface FCMockPaymentTransactionManager
+ (id)mockPaymentTransactionWithFailForProductID:(id)a3 transactionState:(int64_t)a4 transactionError:(id)a5;
+ (id)mockPaymentTransactionWithSuccessForProductID:(id)a3;
- (BOOL)canMakePayments;
- (FCPaymentTransactionManagerDelegate)delegate;
- (NSError)transactionError;
- (NSString)productID;
- (int64_t)transactionState;
- (unint64_t)transactionExpectation;
- (void)setDelegate:(id)a3;
- (void)setProductID:(id)a3;
- (void)setTransactionError:(id)a3;
- (void)setTransactionExpectation:(unint64_t)a3;
- (void)setTransactionState:(int64_t)a3;
- (void)startPurchaseWithTagID:(id)a3 productID:(id)a4 purchaseID:(id)a5 bundleID:(id)a6 appAdamID:(id)a7 storeExternalVersion:(id)a8 price:(id)a9 webAccessOptIn:(BOOL)a10 payment:(id)a11;
@end

@implementation FCMockPaymentTransactionManager

+ (id)mockPaymentTransactionWithSuccessForProductID:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(FCMockPaymentTransactionManager);
  [(FCMockPaymentTransactionManager *)v4 setProductID:v3];

  [(FCMockPaymentTransactionManager *)v4 setTransactionExpectation:0];
  return v4;
}

+ (id)mockPaymentTransactionWithFailForProductID:(id)a3 transactionState:(int64_t)a4 transactionError:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = objc_alloc_init(FCMockPaymentTransactionManager);
  [(FCMockPaymentTransactionManager *)v9 setProductID:v8];

  [(FCMockPaymentTransactionManager *)v9 setTransactionState:a4];
  [(FCMockPaymentTransactionManager *)v9 setTransactionError:v7];

  [(FCMockPaymentTransactionManager *)v9 setTransactionExpectation:1];
  return v9;
}

- (BOOL)canMakePayments
{
  return 1;
}

- (void)startPurchaseWithTagID:(id)a3 productID:(id)a4 purchaseID:(id)a5 bundleID:(id)a6 appAdamID:(id)a7 storeExternalVersion:(id)a8 price:(id)a9 webAccessOptIn:(BOOL)a10 payment:(id)a11
{
  if ([(FCMockPaymentTransactionManager *)self transactionExpectation])
  {
    if ([(FCMockPaymentTransactionManager *)self transactionExpectation] != 1) {
      return;
    }
    v17 = [(FCMockPaymentTransactionManager *)self delegate];
    v12 = [(FCMockPaymentTransactionManager *)self productID];
    int64_t v13 = [(FCMockPaymentTransactionManager *)self transactionState];
    v14 = [(FCMockPaymentTransactionManager *)self transactionError];
    [(FCCompletedPaymentTransaction *)v17 transactionFailedWithProductID:v12 transactionState:v13 transactionError:v14];
  }
  else
  {
    v15 = [FCCompletedPaymentTransaction alloc];
    v16 = [(FCMockPaymentTransactionManager *)self productID];
    v17 = [(FCCompletedPaymentTransaction *)v15 initWithProductID:v16 receipt:0 appleIDAccountDetails:0];

    v12 = [(FCMockPaymentTransactionManager *)self delegate];
    [v12 transactionPurchased:v17];
  }
}

- (FCPaymentTransactionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (FCPaymentTransactionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)productID
{
  return self->_productID;
}

- (void)setProductID:(id)a3
{
}

- (int64_t)transactionState
{
  return self->_transactionState;
}

- (void)setTransactionState:(int64_t)a3
{
  self->_transactionState = a3;
}

- (NSError)transactionError
{
  return self->_transactionError;
}

- (void)setTransactionError:(id)a3
{
}

- (unint64_t)transactionExpectation
{
  return self->_transactionExpectation;
}

- (void)setTransactionExpectation:(unint64_t)a3
{
  self->_transactionExpectation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionError, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end