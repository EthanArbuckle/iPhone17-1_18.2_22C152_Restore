@interface SBSearchBackdropView(SBSpotlightBackgroundWeighting)
- (uint64_t)setSpotlightBackgroundWeighting:()SBSpotlightBackgroundWeighting;
- (uint64_t)spotlightBackgroundWeighting;
@end

@implementation SBSearchBackdropView(SBSpotlightBackgroundWeighting)

- (uint64_t)spotlightBackgroundWeighting
{
  return [a1 isTransitioningToBlurred];
}

- (uint64_t)setSpotlightBackgroundWeighting:()SBSpotlightBackgroundWeighting
{
  int v4 = [a1 isTransitioningToBlurred];
  double v5 = 1.0 - a2;
  if (v4) {
    double v5 = a2;
  }
  return [a1 setTransitionProgress:v5];
}

@end