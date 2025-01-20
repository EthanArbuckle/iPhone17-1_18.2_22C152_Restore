@interface UIEventDeferringBehavioriOSWantsSystemKeyCommandOverlayRules
@end

@implementation UIEventDeferringBehavioriOSWantsSystemKeyCommandOverlayRules

uint64_t ___UIEventDeferringBehavioriOSWantsSystemKeyCommandOverlayRules_block_invoke()
{
  if (_UIApplicationProcessIsSpotlight()) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = _UIApplicationProcessIsOverlayUI();
  }
  _MergedGlobals_1229 = result;
  return result;
}

@end