@interface SVXVirtualDeviceFactory
- (id)createWithInstanceContext:(id)a3;
@end

@implementation SVXVirtualDeviceFactory

- (id)createWithInstanceContext:(id)a3
{
  id v3 = a3;
  v4 = [[SVXVirtualDevice alloc] initWithInstanceContext:v3];

  return v4;
}

@end