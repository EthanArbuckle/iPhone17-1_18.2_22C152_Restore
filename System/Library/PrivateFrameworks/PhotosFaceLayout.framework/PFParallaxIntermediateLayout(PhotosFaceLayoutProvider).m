@interface PFParallaxIntermediateLayout(PhotosFaceLayoutProvider)
- (uint64_t)initWithVisibleRect:()PhotosFaceLayoutProvider cropScore:layoutScore:;
@end

@implementation PFParallaxIntermediateLayout(PhotosFaceLayoutProvider)

- (uint64_t)initWithVisibleRect:()PhotosFaceLayoutProvider cropScore:layoutScore:
{
  return objc_msgSend(a1, "initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:cropScore:layoutScore:timeBottomOverlap:timeTopOverlap:unsafeAreaOverlap:uninflatedUnsafeAreaOverlap:hasTopEdgeContact:", 0, 0, 0, 0, 0, 0, a2, a3, a4, a5, a2, a3, a4, a5, *(void *)&a6, *(void *)&a7,
           0,
           0,
           0,
           0);
}

@end