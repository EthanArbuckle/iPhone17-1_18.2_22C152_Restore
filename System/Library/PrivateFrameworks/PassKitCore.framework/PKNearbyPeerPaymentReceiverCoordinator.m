@interface PKNearbyPeerPaymentReceiverCoordinator
+ (BOOL)nearbyReceiverIsEligible;
- (PKNearbyPeerPaymentReceiverCoordinator)initWithSenderMetadata:(id)a3;
- (void)nearbyReceiverRequiresConfirmationWithContactID:(id)a3 completionHandler:(id)a4;
- (void)recipientMetadataWithAppearanceData:(id)a3 nonce:(id)a4 completion:(id)a5;
- (void)recipientMetadataWithContactID:(id)a3 completion:(id)a4;
- (void)validateTransactionWithResult:(id)a3 completion:(id)a4;
@end

@implementation PKNearbyPeerPaymentReceiverCoordinator

- (PKNearbyPeerPaymentReceiverCoordinator)initWithSenderMetadata:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKNearbyPeerPaymentReceiverCoordinator;
  v5 = [(PKNearbyPeerPaymentReceiverCoordinator *)&v9 init];
  if (v5)
  {
    v6 = [[_PKNearbyPeerPaymentReceiverCoordinator alloc] initWithSenderMetadata:v4];
    internalCoordinator = v5->_internalCoordinator;
    v5->_internalCoordinator = v6;
  }
  return v5;
}

+ (BOOL)nearbyReceiverIsEligible
{
  return +[_PKNearbyPeerPaymentReceiverCoordinator nearbyReceiverIsEligible];
}

- (void)nearbyReceiverRequiresConfirmationWithContactID:(id)a3 completionHandler:(id)a4
{
}

- (void)recipientMetadataWithContactID:(id)a3 completion:(id)a4
{
}

- (void)recipientMetadataWithAppearanceData:(id)a3 nonce:(id)a4 completion:(id)a5
{
}

- (void)validateTransactionWithResult:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
}

@end