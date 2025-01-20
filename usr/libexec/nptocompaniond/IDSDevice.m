@interface IDSDevice
- (BOOL)isTinkerPaired;
@end

@implementation IDSDevice

- (BOOL)isTinkerPaired
{
  return ((unint64_t)[(IDSDevice *)self relationship] >> 1) & 1;
}

@end