@interface SDNearbyPeerPaymentReceiverCoordinator
+ (BOOL)nearbyReceiverIsEligible;
+ (id)verifyReceiverEligibility;
- (PKNearbyPeerPaymentReceiverCoordinator)coordinator;
- (SDNearbyPeerPaymentReceiverCoordinator)initWithSenderMetadata:(id)a3;
- (void)nearbyReceiverRequiresConfirmationWithContactID:(id)a3 completion:(id)a4;
- (void)recipientMetadataWithContactID:(id)a3 completion:(id)a4;
- (void)setCoordinator:(id)a3;
@end

@implementation SDNearbyPeerPaymentReceiverCoordinator

+ (id)verifyReceiverEligibility
{
  if ([a1 nearbyReceiverIsEligible]) {
    id v2 = 0;
  }
  else {
    id v2 = [objc_alloc((Class)NSError) initWithDomain:@"NearbyPeerPaymentError" code:1 userInfo:0];
  }

  return v2;
}

+ (BOOL)nearbyReceiverIsEligible
{
  id v2 = sub_1000F1484();

  return [v2 nearbyReceiverIsEligible];
}

- (SDNearbyPeerPaymentReceiverCoordinator)initWithSenderMetadata:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SDNearbyPeerPaymentReceiverCoordinator;
  v5 = [(SDNearbyPeerPaymentReceiverCoordinator *)&v9 init];
  if (v5)
  {
    v6 = (PKNearbyPeerPaymentReceiverCoordinator *)[objc_alloc((Class)sub_1000F1484()) initWithSenderMetadata:v4];
    coordinator = v5->_coordinator;
    v5->_coordinator = v6;
  }
  return v5;
}

- (void)recipientMetadataWithContactID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SDNearbyPeerPaymentReceiverCoordinator *)self coordinator];
  [v8 recipientMetadataWithContactID:v7 completion:v6];
}

- (void)nearbyReceiverRequiresConfirmationWithContactID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SDNearbyPeerPaymentReceiverCoordinator *)self coordinator];
  [v8 nearbyReceiverRequiresConfirmationWithContactID:v7 completionHandler:v6];
}

- (PKNearbyPeerPaymentReceiverCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end