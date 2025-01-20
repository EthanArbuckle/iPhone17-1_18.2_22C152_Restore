@interface String:
- (uint64_t)Any;
@end

@implementation String:

- (uint64_t)Any
{
  return swift_release();
}

@end