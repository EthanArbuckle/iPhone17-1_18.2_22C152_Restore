@interface String
- (uint64_t):(uint64_t)a1 .Iterator._Variant(uint64_t a1);
@end

@implementation String

- (uint64_t):(uint64_t)a1 .Iterator._Variant(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

@end