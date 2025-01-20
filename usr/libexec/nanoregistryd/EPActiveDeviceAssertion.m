@interface EPActiveDeviceAssertion
- (NSUUID)pairingID;
@end

@implementation EPActiveDeviceAssertion

- (NSUUID)pairingID
{
  v2 = [(EPResource *)self resourceManager];
  v3 = [v2 pairingID];

  return (NSUUID *)v3;
}

@end