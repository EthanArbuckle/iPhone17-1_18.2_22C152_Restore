@interface MRAVEndpoint
- (BOOL)hasASmartDevice;
- (BOOL)isRemoteEndpoint;
- (BOOL)shouldDonate;
- (MRDSystemEndpointControllerHelperEndpointInfo)endpointInfo;
@end

@implementation MRAVEndpoint

- (BOOL)hasASmartDevice
{
  v2 = [(MRAVEndpoint *)self outputDevices];
  unsigned __int8 v3 = objc_msgSend(v2, "mr_any:", &stru_10041D770);

  return v3;
}

- (BOOL)isRemoteEndpoint
{
  v2 = [(MRAVEndpoint *)self origin];
  char v3 = [v2 isLocallyHosted] ^ 1;

  return v3;
}

- (MRDSystemEndpointControllerHelperEndpointInfo)endpointInfo
{
  v5 = [MRDSystemEndpointControllerHelperEndpointInfo alloc];
  v6 = [(MRAVEndpoint *)self outputDevices];
  v7 = [v6 firstObject];
  v8 = [v7 parentGroupIdentifier];
  v9 = v8;
  if (!v8)
  {
    v2 = [(MRAVEndpoint *)self outputDevices];
    char v3 = [v2 firstObject];
    v9 = [v3 groupID];
  }
  v10 = [(MRAVEndpoint *)self designatedGroupLeader];
  v11 = -[MRDSystemEndpointControllerHelperEndpointInfo initWithParentGroupID:isAirplayActive:](v5, "initWithParentGroupID:isAirplayActive:", v9, [v10 isAirPlayReceiverSessionActive]);

  if (!v8)
  {
  }

  return v11;
}

- (BOOL)shouldDonate
{
  if (![(MRAVEndpoint *)self isLocalEndpoint]) {
    return 1;
  }
  char v3 = [(MRAVEndpoint *)self outputDevices];
  v4 = [v3 firstObject];
  BOOL v5 = [v4 deviceType] != 4;

  return v5;
}

@end