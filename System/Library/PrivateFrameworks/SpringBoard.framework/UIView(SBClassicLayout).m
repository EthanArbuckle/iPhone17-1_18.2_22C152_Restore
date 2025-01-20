@interface UIView(SBClassicLayout)
- (uint64_t)sbClassicLayout_applyTransformsForClassicPresentationInLayoutSpaceForInterfaceOrientation:()SBClassicLayout withInheritedScaleFromContainer:applyInheritedScaleToTranslationAndCorners:allowStatusBarToOverlap:useDeviceCornerRadius:;
- (uint64_t)sbClassicLayout_applyTransformsForClassicPresentationInReferenceSpaceForInterfaceOrientation:()SBClassicLayout allowStatusBarToOverlap:useDeviceCornerRadius:;
- (void)_sbClassicLayout_applyTransformsForClassicPresentationInReferenceSpace:()SBClassicLayout forInterfaceOrientation:withInheritedScaleFromContainer:applyInheritedScaleToTranslationAndCorners:allowStatusBarToOverlap:useDeviceCornerRadius:;
@end

@implementation UIView(SBClassicLayout)

- (uint64_t)sbClassicLayout_applyTransformsForClassicPresentationInReferenceSpaceForInterfaceOrientation:()SBClassicLayout allowStatusBarToOverlap:useDeviceCornerRadius:
{
  return objc_msgSend(a1, "_sbClassicLayout_applyTransformsForClassicPresentationInReferenceSpace:forInterfaceOrientation:withInheritedScaleFromContainer:applyInheritedScaleToTranslationAndCorners:allowStatusBarToOverlap:useDeviceCornerRadius:", 1, a3, 0, a4, a5, 1.0);
}

- (uint64_t)sbClassicLayout_applyTransformsForClassicPresentationInLayoutSpaceForInterfaceOrientation:()SBClassicLayout withInheritedScaleFromContainer:applyInheritedScaleToTranslationAndCorners:allowStatusBarToOverlap:useDeviceCornerRadius:
{
  return objc_msgSend(a1, "_sbClassicLayout_applyTransformsForClassicPresentationInReferenceSpace:forInterfaceOrientation:withInheritedScaleFromContainer:applyInheritedScaleToTranslationAndCorners:allowStatusBarToOverlap:useDeviceCornerRadius:", 0, a3, a4, a5, a6);
}

- (void)_sbClassicLayout_applyTransformsForClassicPresentationInReferenceSpace:()SBClassicLayout forInterfaceOrientation:withInheritedScaleFromContainer:applyInheritedScaleToTranslationAndCorners:allowStatusBarToOverlap:useDeviceCornerRadius:
{
  uint64_t v15 = SBFEffectiveHomeButtonType();
  if (a5 && v15 == 2)
  {
    id v27 = [a1 layer];
    v16 = [a1 _screen];
    [v27 bounds];
    double v18 = v17;
    double v20 = v19;
    [v16 _referenceBounds];
    double v22 = v21;
    double v24 = v23;
    if ((unint64_t)(a5 - 5) < 0xFFFFFFFFFFFFFFFELL) {
      int v25 = 1;
    }
    else {
      int v25 = a4;
    }
    if (v25) {
      double v26 = v20;
    }
    else {
      double v26 = v18;
    }
    if (!v25) {
      double v18 = v20;
    }
    [v27 setMasksToBounds:1];
    [v27 setMaskedCorners:15];
    SBClassicUtilitiesInsetAndTranslateLayerForPresentationWithHomeAffordance(v27, v16, a4, a5, a6, a7, a8, v22, v24, v18, v26, a2);
  }
}

@end