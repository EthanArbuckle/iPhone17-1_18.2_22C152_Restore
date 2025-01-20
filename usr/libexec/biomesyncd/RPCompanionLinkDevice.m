@interface RPCompanionLinkDevice
- (NSString)bm_companionLinkDeviceIdentifier;
@end

@implementation RPCompanionLinkDevice

- (NSString)bm_companionLinkDeviceIdentifier
{
  v2 = [(RPCompanionLinkDevice *)self idsDeviceIdentifier];
  id v3 = [v2 copy];

  return (NSString *)v3;
}

@end