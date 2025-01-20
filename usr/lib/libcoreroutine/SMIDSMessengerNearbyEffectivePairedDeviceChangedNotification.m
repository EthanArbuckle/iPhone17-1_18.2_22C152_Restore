@interface SMIDSMessengerNearbyEffectivePairedDeviceChangedNotification
- (IDSDevice)device;
- (SMIDSMessengerNearbyEffectivePairedDeviceChangedNotification)initWithIDSDevice:(id)a3;
@end

@implementation SMIDSMessengerNearbyEffectivePairedDeviceChangedNotification

- (SMIDSMessengerNearbyEffectivePairedDeviceChangedNotification)initWithIDSDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SMIDSMessengerNearbyEffectivePairedDeviceChangedNotification;
  v6 = [(RTNotification *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (IDSDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
}

@end