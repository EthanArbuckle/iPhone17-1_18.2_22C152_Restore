@interface NRDiscoveryManager
@end

@implementation NRDiscoveryManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisingServiceNames, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_discoveredDevices, 0);
}

@end