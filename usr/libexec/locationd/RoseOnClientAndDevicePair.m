@interface RoseOnClientAndDevicePair
- (CLDurianClientProtocol)client;
- (NSUUID)deviceUUID;
- (void)dealloc;
- (void)setClient:(id)a3;
- (void)setDeviceUUID:(id)a3;
@end

@implementation RoseOnClientAndDevicePair

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)RoseOnClientAndDevicePair;
  [(RoseOnClientAndDevicePair *)&v3 dealloc];
}

- (CLDurianClientProtocol)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSUUID)deviceUUID
{
  return self->_deviceUUID;
}

- (void)setDeviceUUID:(id)a3
{
}

@end