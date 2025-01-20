@interface NSObject:
- (uint64_t)Swift.AnyObject;
@end

@implementation NSObject:

- (uint64_t)Swift.AnyObject
{
  return swift_release();
}

@end