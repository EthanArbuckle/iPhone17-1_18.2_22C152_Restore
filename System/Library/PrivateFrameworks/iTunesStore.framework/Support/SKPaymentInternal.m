@interface SKPaymentInternal
- (SKPaymentInternal)init;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation SKPaymentInternal

- (SKPaymentInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKPaymentInternal;
  result = [(SKPaymentInternal *)&v3 init];
  if (result)
  {
    result->_quantity = 1;
    result->_simulatesAskToBuyInSandbox = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(SKPaymentInternal);
  v6 = (NSString *)[(NSString *)self->_applicationUsername copyWithZone:a3];
  applicationUsername = v5->_applicationUsername;
  v5->_applicationUsername = v6;

  v8 = (NSString *)[(NSString *)self->_partnerIdentifier copyWithZone:a3];
  partnerIdentifier = v5->_partnerIdentifier;
  v5->_partnerIdentifier = v8;

  v10 = (NSString *)[(NSString *)self->_partnerTransactionIdentifier copyWithZone:a3];
  partnerTransactionIdentifier = v5->_partnerTransactionIdentifier;
  v5->_partnerTransactionIdentifier = v10;

  v12 = (NSString *)[(NSString *)self->_productIdentifier copyWithZone:a3];
  productIdentifier = v5->_productIdentifier;
  v5->_productIdentifier = v12;

  v5->_quantity = self->_quantity;
  v14 = (NSData *)[(NSData *)self->_requestData copyWithZone:a3];
  requestData = v5->_requestData;
  v5->_requestData = v14;

  v16 = (NSDictionary *)[(NSDictionary *)self->_requestParameters copyWithZone:a3];
  requestParameters = v5->_requestParameters;
  v5->_requestParameters = v16;

  v5->_simulatesAskToBuyInSandbox = self->_simulatesAskToBuyInSandbox;
  v5->_isStoreOriginated = self->_isStoreOriginated;
  objc_storeStrong((id *)&v5->_paymentDiscount, self->_paymentDiscount);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentDiscount, 0);
  objc_storeStrong((id *)&self->_requestParameters, 0);
  objc_storeStrong((id *)&self->_requestData, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_partnerTransactionIdentifier, 0);
  objc_storeStrong((id *)&self->_partnerIdentifier, 0);

  objc_storeStrong((id *)&self->_applicationUsername, 0);
}

@end