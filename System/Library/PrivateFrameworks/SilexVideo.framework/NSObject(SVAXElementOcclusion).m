@interface NSObject(SVAXElementOcclusion)
- (uint64_t)svax_shouldBeOccluded;
@end

@implementation NSObject(SVAXElementOcclusion)

- (uint64_t)svax_shouldBeOccluded
{
  uint64_t v2 = [a1 accessibilityContainer];
  if (!v2) {
    return 0;
  }
  v3 = (void *)v2;
  while ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v4 = [v3 accessibilityContainer];

    v3 = (void *)v4;
    if (!v4) {
      return 0;
    }
  }
  uint64_t v6 = [v3 shouldOccludeAccessibilityElement:a1];

  return v6;
}

@end