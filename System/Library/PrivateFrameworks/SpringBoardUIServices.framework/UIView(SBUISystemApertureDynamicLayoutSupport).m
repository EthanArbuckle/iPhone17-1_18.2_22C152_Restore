@interface UIView(SBUISystemApertureDynamicLayoutSupport)
- (double)SBUISA_standardInteritemPadding;
- (uint64_t)SBUISA_systemApertureCustomControlsContentLayoutGuide;
- (uint64_t)SBUISA_systemApertureLeadingConcentricContentLayoutGuide;
- (uint64_t)SBUISA_systemApertureLegibleContentLayoutMarginsGuide;
- (uint64_t)SBUISA_systemApertureTrailingConcentricContentLayoutGuide;
@end

@implementation UIView(SBUISystemApertureDynamicLayoutSupport)

- (uint64_t)SBUISA_systemApertureLeadingConcentricContentLayoutGuide
{
  return objc_msgSend(a1, "SBUISA_systemApertureLayoutGuideWithIdentifier:", @"SBUISystemApertureLeadingConcentricContentLayoutGuideIdentifier");
}

- (uint64_t)SBUISA_systemApertureTrailingConcentricContentLayoutGuide
{
  return objc_msgSend(a1, "SBUISA_systemApertureLayoutGuideWithIdentifier:", @"SBUISystemApertureTrailingConcentricContentLayoutGuideIdentifier");
}

- (uint64_t)SBUISA_systemApertureCustomControlsContentLayoutGuide
{
  return objc_msgSend(a1, "SBUISA_systemApertureLayoutGuideWithIdentifier:", @"SBUISystemApertureCustomControlsContentLayoutGuideIdentifier");
}

- (uint64_t)SBUISA_systemApertureLegibleContentLayoutMarginsGuide
{
  return objc_msgSend(a1, "SBUISA_systemApertureLayoutGuideWithIdentifier:", @"SBUISystemApertureLegibleContentLayoutMarginsGuideIdentifier");
}

- (double)SBUISA_standardInteritemPadding
{
  uint64_t v1 = objc_msgSend(a1, "SBUISA_layoutMode");
  double result = 11.0;
  if ((unint64_t)(v1 + 1) < 5) {
    return 5.5;
  }
  return result;
}

@end