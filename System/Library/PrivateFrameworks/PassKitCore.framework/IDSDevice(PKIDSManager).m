@interface IDSDevice(PKIDSManager)
- (BOOL)pk_isValidHandoffDevice;
- (id)pk_idsDestination;
- (uint64_t)pk_isApplePayCapable;
@end

@implementation IDSDevice(PKIDSManager)

- (id)pk_idsDestination
{
  v2 = (void *)IDSCopyIDForDevice();
  v3 = [a1 name];
  v4 = +[PKIDSDestination destinationWithDeviceIdentifier:v2 name:v3];

  return v4;
}

- (uint64_t)pk_isApplePayCapable
{
  v2 = [a1 nsuuid];
  if (v2) {
    uint64_t v3 = objc_msgSend(a1, "pk_isValidHandoffDevice");
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)pk_isValidHandoffDevice
{
  if (![a1 supportsApplePay]) {
    return 0;
  }
  v2 = [[PKRemoteDevice alloc] initWithIDSDevice:a1];
  BOOL v3 = (unint64_t)[(PKRemoteDevice *)v2 type] < 2;

  return v3;
}

@end