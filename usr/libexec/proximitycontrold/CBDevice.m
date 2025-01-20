@interface CBDevice
- (BOOL)supportsR1;
@end

@implementation CBDevice

- (BOOL)supportsR1
{
  return ([(CBDevice *)self nearbyInfoFlags] >> 1) & 1;
}

@end