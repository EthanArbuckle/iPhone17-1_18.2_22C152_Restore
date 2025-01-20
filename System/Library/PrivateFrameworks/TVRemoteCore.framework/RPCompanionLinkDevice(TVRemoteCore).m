@interface RPCompanionLinkDevice(TVRemoteCore)
- (uint64_t)isEqualToRPDevice:()TVRemoteCore;
@end

@implementation RPCompanionLinkDevice(TVRemoteCore)

- (uint64_t)isEqualToRPDevice:()TVRemoteCore
{
  id v4 = a3;
  uint64_t v5 = [a1 idsDeviceIdentifier];
  if (v5
    && (v6 = (void *)v5,
        [v4 idsDeviceIdentifier],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    v8 = [a1 idsDeviceIdentifier];
    uint64_t v9 = [v4 idsDeviceIdentifier];
  }
  else
  {
    v8 = [a1 identifier];
    uint64_t v9 = [v4 identifier];
  }
  v10 = (void *)v9;
  id v11 = v8;
  id v12 = v10;
  v13 = v12;
  if (v11 == v12)
  {
    uint64_t v14 = 1;
  }
  else if ((v11 == 0) == (v12 != 0))
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = [v11 isEqual:v12];
  }

  return v14;
}

@end