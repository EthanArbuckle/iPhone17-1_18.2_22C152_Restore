@interface CBDevice
- (BOOL)needsSetup;
- (NSUUID)deviceIdentifier;
- (NSUUID)pairingAgentDeviceIdentifier;
- (char)channel;
- (unsigned)deviceActionType;
@end

@implementation CBDevice

- (NSUUID)deviceIdentifier
{
  v3 = [(CBDevice *)self identifier];
  if (v3)
  {
    id v4 = objc_alloc((Class)NSUUID);
    v5 = [(CBDevice *)self identifier];
    id v6 = [v4 initWithUUIDString:v5];
  }
  else
  {
    id v6 = 0;
  }

  return (NSUUID *)v6;
}

- (NSUUID)pairingAgentDeviceIdentifier
{
  v3 = [(CBDevice *)self identifier];
  if (v3)
  {
    id v4 = objc_alloc((Class)NSUUID);
    v5 = [(CBDevice *)self identifier];
    id v6 = [v4 initWithUUIDString:v5];
  }
  else
  {
    id v6 = 0;
  }

  return (NSUUID *)v6;
}

- (char)channel
{
  return [(CBDevice *)self bleChannel];
}

- (unsigned)deviceActionType
{
  return [(CBDevice *)self nearbyActionType];
}

- (BOOL)needsSetup
{
  return 0;
}

@end