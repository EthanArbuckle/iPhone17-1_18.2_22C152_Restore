@interface PKPaymentTransactionToDeleteFromFinance
- (NSString)accountIdentifier;
- (NSString)transactionIdentifier;
- (void)setAccountIdentifier:(id)a3;
- (void)setTransactionIdentifier:(id)a3;
@end

@implementation PKPaymentTransactionToDeleteFromFinance

- (NSString)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (void)setTransactionIdentifier:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
}

@end