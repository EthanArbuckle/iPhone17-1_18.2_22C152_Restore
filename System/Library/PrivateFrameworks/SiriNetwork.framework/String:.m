@interface String:
- (uint64_t)UInt64;
@end

@implementation String:

- (uint64_t)UInt64
{
  return swift_release();
}

@end