@interface PKPaymentAuthorizationSuccessStateParam
+ (id)paramWithPeerPaymentTransactionMetadata:(id)a3;
- (PKPeerPaymentTransactionMetadata)peerPaymentTransactionMetadata;
- (id)description;
- (void)setPeerPaymentTransactionMetadata:(id)a3;
@end

@implementation PKPaymentAuthorizationSuccessStateParam

+ (id)paramWithPeerPaymentTransactionMetadata:(id)a3
{
  id v4 = a3;
  v5 = [a1 param];
  [v5 setPeerPaymentTransactionMetadata:v4];

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; setPeerPaymentTransactionMetadata: %@>",
               objc_opt_class(),
               self,
               self->_peerPaymentTransactionMetadata);
}

- (PKPeerPaymentTransactionMetadata)peerPaymentTransactionMetadata
{
  return self->_peerPaymentTransactionMetadata;
}

- (void)setPeerPaymentTransactionMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

@end