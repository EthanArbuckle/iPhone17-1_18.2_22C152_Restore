@interface PDTransitStateFetchRequest
- (BOOL)forceTransactionGeneration;
- (BOOL)isEqual:(id)a3;
- (BOOL)recoverMissingTransactions;
- (NSDate)transactionDate;
- (NSString)passUniqueIdentifier;
- (NSString)paymentApplicationIdentifier;
- (NSString)secureElementIdentifier;
- (PKExpressTransactionState)expressState;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setExpressState:(id)a3;
- (void)setForceTransactionGeneration:(BOOL)a3;
- (void)setPassUniqueIdentifier:(id)a3;
- (void)setPaymentApplicationIdentifier:(id)a3;
- (void)setRecoverMissingTransactions:(BOOL)a3;
- (void)setSecureElementIdentifier:(id)a3;
- (void)setTransactionDate:(id)a3;
@end

@implementation PDTransitStateFetchRequest

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[PDTransitStateFetchRequest allocWithZone:](PDTransitStateFetchRequest, "allocWithZone:") init];
  v6 = (NSString *)[(NSString *)self->_passUniqueIdentifier copyWithZone:a3];
  passUniqueIdentifier = v5->_passUniqueIdentifier;
  v5->_passUniqueIdentifier = v6;

  v8 = (NSString *)[(NSString *)self->_secureElementIdentifier copyWithZone:a3];
  secureElementIdentifier = v5->_secureElementIdentifier;
  v5->_secureElementIdentifier = v8;

  v10 = (NSString *)[(NSString *)self->_paymentApplicationIdentifier copyWithZone:a3];
  paymentApplicationIdentifier = v5->_paymentApplicationIdentifier;
  v5->_paymentApplicationIdentifier = v10;

  v5->_forceTransactionGeneration = self->_forceTransactionGeneration;
  v12 = (NSDate *)[(NSDate *)self->_transactionDate copyWithZone:a3];
  transactionDate = v5->_transactionDate;
  v5->_transactionDate = v12;

  v5->_recoverMissingTransactions = self->_recoverMissingTransactions;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    v5 = v3;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if ((isKindOfClass & 1) != 0 && PKEqualObjects() && PKEqualObjects()) {
    char v7 = PKEqualObjects();
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_passUniqueIdentifier hash];
  unint64_t v4 = [(NSString *)self->_secureElementIdentifier hash] ^ v3;
  return v4 ^ [(NSString *)self->_paymentApplicationIdentifier hash];
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (void)setPassUniqueIdentifier:(id)a3
{
}

- (NSString)secureElementIdentifier
{
  return self->_secureElementIdentifier;
}

- (void)setSecureElementIdentifier:(id)a3
{
}

- (NSString)paymentApplicationIdentifier
{
  return self->_paymentApplicationIdentifier;
}

- (void)setPaymentApplicationIdentifier:(id)a3
{
}

- (PKExpressTransactionState)expressState
{
  return self->_expressState;
}

- (void)setExpressState:(id)a3
{
}

- (BOOL)forceTransactionGeneration
{
  return self->_forceTransactionGeneration;
}

- (void)setForceTransactionGeneration:(BOOL)a3
{
  self->_forceTransactionGeneration = a3;
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
}

- (BOOL)recoverMissingTransactions
{
  return self->_recoverMissingTransactions;
}

- (void)setRecoverMissingTransactions:(BOOL)a3
{
  self->_recoverMissingTransactions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_expressState, 0);
  objc_storeStrong((id *)&self->_paymentApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_secureElementIdentifier, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
}

@end