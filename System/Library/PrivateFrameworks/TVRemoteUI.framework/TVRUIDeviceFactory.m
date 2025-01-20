@interface TVRUIDeviceFactory
+ (id)deviceWithIdentifier:(id)a3;
@end

@implementation TVRUIDeviceFactory

+ (id)deviceWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [[TVRUICoreDevice alloc] _initWithDeviceIdentifier:v3];

  return v4;
}

@end