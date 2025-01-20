@interface NRDevice
- (NSString)name;
@end

@implementation NRDevice

- (NSString)name
{
  return (NSString *)[(NRDevice *)self valueForProperty:NRDevicePropertyName];
}

@end