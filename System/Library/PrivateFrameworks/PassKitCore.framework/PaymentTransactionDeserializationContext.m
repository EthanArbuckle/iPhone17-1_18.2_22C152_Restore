@interface PaymentTransactionDeserializationContext
- (PaymentTransactionDeserializationContext)init;
- (void)dealloc;
@end

@implementation PaymentTransactionDeserializationContext

- (PaymentTransactionDeserializationContext)init
{
  return 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PaymentTransactionDeserializationContext;
  [(PaymentTransactionDeserializationContext *)&v2 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brandsToBind, 0);
  objc_storeStrong((id *)&self->_merchantsToBind, 0);
  objc_storeStrong((id *)&self->_sourcesToBind, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_transactionPIDs, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_authenticationContextKeys, 0);
  objc_storeStrong((id *)&self->_foreignExchangeKeys, 0);
  objc_storeStrong((id *)&self->_merchantKeys, 0);
  objc_storeStrong((id *)&self->_transactionKeys, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_authenticationContextSetters, 0);
  objc_storeStrong((id *)&self->_foreignExchangeSetters, 0);
  objc_storeStrong((id *)&self->_merchantSetters, 0);
  objc_storeStrong((id *)&self->_transactionSetters, 0);
  objc_storeStrong((id *)&self->_paymentApplicationTransactionSourceIdentifiers, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

@end