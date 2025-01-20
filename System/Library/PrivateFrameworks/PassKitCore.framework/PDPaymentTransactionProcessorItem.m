@interface PDPaymentTransactionProcessorItem
- (BOOL)foundOptimalLocation;
- (BOOL)isClearingAttempt;
- (BOOL)useBackgroundLocation;
- (NSString)transactionSourceIdentifier;
- (PDPaymentTransactionProcessorItem)init;
- (PKPaymentTransaction)paymentTransaction;
- (void)setFoundOptimalLocation:(BOOL)a3;
- (void)setIsClearingAttempt:(BOOL)a3;
- (void)setPaymentTransaction:(id)a3;
- (void)setTransactionSourceIdentifier:(id)a3;
- (void)setUseBackgroundLocation:(BOOL)a3;
@end

@implementation PDPaymentTransactionProcessorItem

- (PDPaymentTransactionProcessorItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDPaymentTransactionProcessorItem;
  result = [(PDPaymentTransactionProcessorItem *)&v3 init];
  if (result) {
    result->_transactionLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (PKPaymentTransaction)paymentTransaction
{
  p_transactionLock = &self->_transactionLock;
  os_unfair_lock_lock(&self->_transactionLock);
  v4 = self->_paymentTransaction;
  os_unfair_lock_unlock(p_transactionLock);
  return v4;
}

- (void)setPaymentTransaction:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_transactionLock);
  paymentTransaction = self->_paymentTransaction;
  if (paymentTransaction)
  {
    objc_msgSend(v4, "addUpdateReasons:", -[PKPaymentTransaction updateReasons](paymentTransaction, "updateReasons"));
    v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = self->_paymentTransaction;
      int v9 = 138412546;
      v10 = v7;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating transaction on pending transaction processor item from: %@ to: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  v8 = self->_paymentTransaction;
  self->_paymentTransaction = (PKPaymentTransaction *)v4;

  os_unfair_lock_unlock(&self->_transactionLock);
}

- (NSString)transactionSourceIdentifier
{
  return self->_transactionSourceIdentifier;
}

- (void)setTransactionSourceIdentifier:(id)a3
{
}

- (BOOL)foundOptimalLocation
{
  return self->_foundOptimalLocation;
}

- (void)setFoundOptimalLocation:(BOOL)a3
{
  self->_foundOptimalLocation = a3;
}

- (BOOL)useBackgroundLocation
{
  return self->_useBackgroundLocation;
}

- (void)setUseBackgroundLocation:(BOOL)a3
{
  self->_useBackgroundLocation = a3;
}

- (BOOL)isClearingAttempt
{
  return self->_isClearingAttempt;
}

- (void)setIsClearingAttempt:(BOOL)a3
{
  self->_isClearingAttempt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentTransaction, 0);
}

@end