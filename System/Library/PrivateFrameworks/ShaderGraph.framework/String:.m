@interface String:
- (uint64_t)InputSpec;
@end

@implementation String:

- (uint64_t)InputSpec
{
  return swift_release();
}

@end