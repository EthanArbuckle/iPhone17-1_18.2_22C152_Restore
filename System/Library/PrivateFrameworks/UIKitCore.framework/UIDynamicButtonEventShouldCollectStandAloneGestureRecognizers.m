@interface UIDynamicButtonEventShouldCollectStandAloneGestureRecognizers
@end

@implementation UIDynamicButtonEventShouldCollectStandAloneGestureRecognizers

uint64_t ___UIDynamicButtonEventShouldCollectStandAloneGestureRecognizers_block_invoke()
{
  uint64_t result = [(id)UIApp isFrontBoard];
  _MergedGlobals_23_4 = result;
  return result;
}

@end