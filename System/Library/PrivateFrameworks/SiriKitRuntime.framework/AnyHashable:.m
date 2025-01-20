@interface AnyHashable:
- (uint64_t)Any;
@end

@implementation AnyHashable:

- (uint64_t)Any
{
  if (result != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

@end