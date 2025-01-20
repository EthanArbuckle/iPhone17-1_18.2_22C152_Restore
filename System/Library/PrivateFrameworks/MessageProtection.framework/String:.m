@interface String:
- (uint64_t)Swift.AnyObject;
@end

@implementation String:

- (uint64_t)Swift.AnyObject
{
  return swift_release();
}

@end