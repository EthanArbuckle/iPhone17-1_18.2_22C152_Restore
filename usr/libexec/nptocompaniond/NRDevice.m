@interface NRDevice
+ (id)npto_photosGIFSupportCapability;
+ (id)npto_photosSyncV2Capability;
@end

@implementation NRDevice

+ (id)npto_photosSyncV2Capability
{
  id v2 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"EF9E8C3A-6B59-47E0-BA2F-212213F1A30D"];

  return v2;
}

+ (id)npto_photosGIFSupportCapability
{
  id v2 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"EC26A7BC-7571-457B-9DEF-6CB5CF3AB850"];

  return v2;
}

@end