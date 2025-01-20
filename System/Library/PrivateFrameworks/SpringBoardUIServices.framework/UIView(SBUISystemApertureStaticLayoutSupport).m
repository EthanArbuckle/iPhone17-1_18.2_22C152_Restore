@interface UIView(SBUISystemApertureStaticLayoutSupport)
- (uint64_t)SBUISA_systemApertureLeadingViewLayoutGuide;
- (uint64_t)SBUISA_systemApertureMinimalViewLayoutGuide;
- (uint64_t)SBUISA_systemApertureTrailingViewLayoutGuide;
@end

@implementation UIView(SBUISystemApertureStaticLayoutSupport)

- (uint64_t)SBUISA_systemApertureLeadingViewLayoutGuide
{
  return objc_msgSend(a1, "SBUISA_systemApertureLayoutGuideWithIdentifier:", @"SBUISystemApertureLeadingAreaLayoutGuideIdentifier");
}

- (uint64_t)SBUISA_systemApertureTrailingViewLayoutGuide
{
  return objc_msgSend(a1, "SBUISA_systemApertureLayoutGuideWithIdentifier:", @"SBUISystemApertureTrailingAreaLayoutGuideIdentifier");
}

- (uint64_t)SBUISA_systemApertureMinimalViewLayoutGuide
{
  return objc_msgSend(a1, "SBUISA_systemApertureLayoutGuideWithIdentifier:", @"SBUISystemApertureMinimalAreaLayoutGuideIdentifier");
}

@end