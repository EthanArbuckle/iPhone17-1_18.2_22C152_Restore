@interface UIView(SBUISystemAperture)
- (double)SBUISA_maximumAccessoryViewWidth;
- (uint64_t)SBUISA_layoutMode;
- (uint64_t)SBUISA_systemApertureObstructedAreaLayoutGuide;
@end

@implementation UIView(SBUISystemAperture)

- (uint64_t)SBUISA_layoutMode
{
  v1 = [a1 systemApertureHostedElementContext];
  uint64_t v2 = [v1 layoutMode];

  return v2;
}

- (uint64_t)SBUISA_systemApertureObstructedAreaLayoutGuide
{
  return objc_msgSend(a1, "SBUISA_systemApertureLayoutGuideWithIdentifier:", @"SBUISystemApertureObstructedAreaLayoutGuideIdentifier");
}

- (double)SBUISA_maximumAccessoryViewWidth
{
  v0 = +[SBUISystemApertureLayoutMetrics sharedInstanceForEmbeddedDisplay];
  [v0 maximumLeadingTrailingViewSize];
  double v2 = v1;

  return v2;
}

@end