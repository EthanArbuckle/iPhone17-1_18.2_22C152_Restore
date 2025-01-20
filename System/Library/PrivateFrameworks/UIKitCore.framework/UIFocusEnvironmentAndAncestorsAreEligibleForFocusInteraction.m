@interface UIFocusEnvironmentAndAncestorsAreEligibleForFocusInteraction
@end

@implementation UIFocusEnvironmentAndAncestorsAreEligibleForFocusInteraction

uint64_t ___UIFocusEnvironmentAndAncestorsAreEligibleForFocusInteraction_block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = _UIFocusEnvironmentIsEligibleForFocusInteraction(a2);
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

@end