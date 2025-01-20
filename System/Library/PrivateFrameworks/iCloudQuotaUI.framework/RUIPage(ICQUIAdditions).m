@interface RUIPage(ICQUIAdditions)
- (uint64_t)canBeShownFromSuspendedState;
@end

@implementation RUIPage(ICQUIAdditions)

- (uint64_t)canBeShownFromSuspendedState
{
  return 1;
}

@end