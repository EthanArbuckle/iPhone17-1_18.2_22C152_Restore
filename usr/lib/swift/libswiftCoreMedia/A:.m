@interface A:
- (uint64_t)B;
@end

@implementation A:

- (uint64_t)B
{
  if (a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

@end