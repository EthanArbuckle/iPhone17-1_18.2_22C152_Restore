@interface PRWiFiManagerAgent
- (PRWiFiDeviceCapabilities)deviceCapabilities;
@end

@implementation PRWiFiManagerAgent

- (PRWiFiDeviceCapabilities)deviceCapabilities
{
  return (PRWiFiDeviceCapabilities)sub_10001D658();
}

@end