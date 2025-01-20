@interface String:
- (uint64_t)String;
@end

@implementation String:

- (uint64_t)String
{
  return swift_release();
}

@end