@interface SBFloatingSwitcherSettings
+ (id)settingsControllerModule;
- (BOOL)showFloats;
- (MTLumaDodgePillSettings)homeAffordanceSettings;
- (SBFFluidBehaviorSettings)tongueCollapsedToExpandedAnimationSettings;
- (SBFFluidBehaviorSettings)tongueContainerPositionAnimationSettings;
- (SBFFluidBehaviorSettings)tongueContainerTransformAnimationSettings;
- (SBFFluidBehaviorSettings)tongueExpandedToCollapsedAnimationSettings;
- (double)cardSpacing;
- (double)darkeningFadeDistance;
- (double)darkeningMinimumDistanceThreshold;
- (double)dimmingAlpha;
- (double)leadingEdgeRubberbandingRange;
- (double)maximumDarkening;
- (double)opacityFadeDistance;
- (double)opacityMinimumDistanceThreshold;
- (double)overshootPullbackDelayOffscreen;
- (double)overshootPullbackDelayOnscreen;
- (double)perCardAdditionalScaleCoefficient;
- (double)rightEdgePeekDelay;
- (double)rightEdgePeekTimeout;
- (double)scaleCurveExponent;
- (double)switcherCardScale;
- (double)titleAndIconOpacityFadeDistance;
- (double)titleAndIconOpacityMinimumDistanceThreshold;
- (double)titleOpacityFadeDistance;
- (double)titleOpacityMinimumDistanceThreshold;
- (id)archiveValueForKey:(id)a3;
- (void)setCardSpacing:(double)a3;
- (void)setDarkeningFadeDistance:(double)a3;
- (void)setDarkeningMinimumDistanceThreshold:(double)a3;
- (void)setDefaultValues;
- (void)setDimmingAlpha:(double)a3;
- (void)setHomeAffordanceSettings:(id)a3;
- (void)setLeadingEdgeRubberbandingRange:(double)a3;
- (void)setMaximumDarkening:(double)a3;
- (void)setOpacityFadeDistance:(double)a3;
- (void)setOpacityMinimumDistanceThreshold:(double)a3;
- (void)setOvershootPullbackDelayOffscreen:(double)a3;
- (void)setOvershootPullbackDelayOnscreen:(double)a3;
- (void)setPerCardAdditionalScaleCoefficient:(double)a3;
- (void)setRightEdgePeekDelay:(double)a3;
- (void)setRightEdgePeekTimeout:(double)a3;
- (void)setScaleCurveExponent:(double)a3;
- (void)setShowFloats:(BOOL)a3;
- (void)setSwitcherCardScale:(double)a3;
- (void)setTitleAndIconOpacityFadeDistance:(double)a3;
- (void)setTitleAndIconOpacityMinimumDistanceThreshold:(double)a3;
- (void)setTitleOpacityFadeDistance:(double)a3;
- (void)setTitleOpacityMinimumDistanceThreshold:(double)a3;
- (void)setTongueCollapsedToExpandedAnimationSettings:(id)a3;
- (void)setTongueContainerPositionAnimationSettings:(id)a3;
- (void)setTongueContainerTransformAnimationSettings:(id)a3;
- (void)setTongueExpandedToCollapsedAnimationSettings:(id)a3;
@end

@implementation SBFloatingSwitcherSettings

- (void)setDefaultValues
{
  [(SBFloatingSwitcherSettings *)self setShowFloats:1];
  [(SBFloatingSwitcherSettings *)self setSwitcherCardScale:0.82];
  [(SBFloatingSwitcherSettings *)self setCardSpacing:-24.0];
  [(SBFloatingSwitcherSettings *)self setDimmingAlpha:0.15];
  [(SBFloatingSwitcherSettings *)self setLeadingEdgeRubberbandingRange:100.0];
  [(SBFloatingSwitcherSettings *)self setPerCardAdditionalScaleCoefficient:0.0625];
  [(SBFloatingSwitcherSettings *)self setScaleCurveExponent:1.4];
  [(SBFloatingSwitcherSettings *)self setOpacityMinimumDistanceThreshold:10.0];
  [(SBFloatingSwitcherSettings *)self setOpacityFadeDistance:10.0];
  [(SBFloatingSwitcherSettings *)self setDarkeningMinimumDistanceThreshold:0.0];
  [(SBFloatingSwitcherSettings *)self setDarkeningFadeDistance:150.0];
  [(SBFloatingSwitcherSettings *)self setMaximumDarkening:0.15];
  [(SBFloatingSwitcherSettings *)self setTitleAndIconOpacityMinimumDistanceThreshold:40.0];
  [(SBFloatingSwitcherSettings *)self setTitleAndIconOpacityFadeDistance:40.0];
  [(SBFloatingSwitcherSettings *)self setTitleOpacityMinimumDistanceThreshold:80.0];
  [(SBFloatingSwitcherSettings *)self setTitleOpacityFadeDistance:80.0];
  [(SBFloatingSwitcherSettings *)self setOvershootPullbackDelayOffscreen:0.17];
  [(SBFloatingSwitcherSettings *)self setOvershootPullbackDelayOnscreen:0.12];
  [(SBFloatingSwitcherSettings *)self setRightEdgePeekDelay:0.3];
  [(SBFloatingSwitcherSettings *)self setRightEdgePeekTimeout:1.7];
  v3 = [(SBFloatingSwitcherSettings *)self tongueContainerPositionAnimationSettings];
  [v3 setDefaultCriticallyDampedValues];

  v4 = [(SBFloatingSwitcherSettings *)self tongueContainerPositionAnimationSettings];
  [v4 setResponse:0.25];

  v5 = [(SBFloatingSwitcherSettings *)self tongueContainerPositionAnimationSettings];
  CAFrameRateRange v30 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v5, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v30.minimum, *(double *)&v30.maximum, *(double *)&v30.preferred);

  v6 = [(SBFloatingSwitcherSettings *)self tongueContainerTransformAnimationSettings];
  [v6 setDefaultValues];

  v7 = [(SBFloatingSwitcherSettings *)self tongueContainerTransformAnimationSettings];
  [v7 setDampingRatio:0.7];

  v8 = [(SBFloatingSwitcherSettings *)self tongueContainerTransformAnimationSettings];
  [v8 setResponse:0.725];

  v9 = [(SBFloatingSwitcherSettings *)self tongueContainerTransformAnimationSettings];
  CAFrameRateRange v31 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v9, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v31.minimum, *(double *)&v31.maximum, *(double *)&v31.preferred);

  v10 = [(SBFloatingSwitcherSettings *)self tongueCollapsedToExpandedAnimationSettings];
  [v10 setDefaultValues];

  v11 = [(SBFloatingSwitcherSettings *)self tongueCollapsedToExpandedAnimationSettings];
  [v11 setDampingRatio:0.7];

  v12 = [(SBFloatingSwitcherSettings *)self tongueCollapsedToExpandedAnimationSettings];
  [v12 setResponse:0.725];

  v13 = [(SBFloatingSwitcherSettings *)self tongueCollapsedToExpandedAnimationSettings];
  CAFrameRateRange v32 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v13, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v32.minimum, *(double *)&v32.maximum, *(double *)&v32.preferred);

  v14 = [(SBFloatingSwitcherSettings *)self tongueExpandedToCollapsedAnimationSettings];
  [v14 setDefaultValues];

  v15 = [(SBFloatingSwitcherSettings *)self tongueExpandedToCollapsedAnimationSettings];
  [v15 setDampingRatio:0.88];

  v16 = [(SBFloatingSwitcherSettings *)self tongueExpandedToCollapsedAnimationSettings];
  [v16 setResponse:0.45];

  v17 = [(SBFloatingSwitcherSettings *)self tongueExpandedToCollapsedAnimationSettings];
  CAFrameRateRange v33 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v17, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v33.minimum, *(double *)&v33.maximum, *(double *)&v33.preferred);

  v18 = [(SBFloatingSwitcherSettings *)self homeAffordanceSettings];
  [v18 setDefaultValues];

  SBLayoutDefaultSideLayoutElementWidth();
  double v20 = v19;
  SBLayoutDefaultSideLayoutElementWidth();
  double v22 = v21;
  v23 = [(SBFloatingSwitcherSettings *)self homeAffordanceSettings];
  [v23 setMinWidth:round(v20 * 0.3574)];

  v24 = [(SBFloatingSwitcherSettings *)self homeAffordanceSettings];
  [v24 setMaxWidth:round(v22 * 0.3574)];

  v25 = [(SBFloatingSwitcherSettings *)self homeAffordanceSettings];
  [v25 setHeight:4.5];

  v26 = [(SBFloatingSwitcherSettings *)self homeAffordanceSettings];
  [v26 setEdgeSpacing:7.0];

  v27 = [(SBFloatingSwitcherSettings *)self homeAffordanceSettings];
  [v27 setCornerRadius:3.0];

  id v28 = [(SBFloatingSwitcherSettings *)self homeAffordanceSettings];
  [v28 setCornerMask:1];
}

+ (id)settingsControllerModule
{
  v35[4] = *MEMORY[0x1E4F143B8];
  id v28 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Sliders/Floats" valueKeyPath:@"showFloats"];
  v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"showFloats == YES"];
  v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"showFloats == NO"];
  v4 = [MEMORY[0x1E4F1CA48] arrayWithObject:v28];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __54__SBFloatingSwitcherSettings_settingsControllerModule__block_invoke;
  v29[3] = &unk_1E6AF8F98;
  id v30 = v2;
  id v31 = v3;
  id v32 = v4;
  id v5 = v4;
  id v27 = v3;
  id v26 = v2;
  v6 = (void (**)(void, void, double, double))MEMORY[0x1D948C7A0](v29);
  ((void (**)(void, __CFString *, double, double))v6)[2](v6, @"switcherCardScale", 0.1, 1.2);
  ((void (**)(void, __CFString *, double, double))v6)[2](v6, @"cardSpacing", -200.0, 200.0);
  ((void (**)(void, __CFString *, double, double))v6)[2](v6, @"dimmingAlpha", 0.0, 1.0);
  ((void (**)(void, __CFString *, double, double))v6)[2](v6, @"leadingEdgeRubberbandingRange", -1000.0, 1000.0);
  ((void (**)(void, __CFString *, double, double))v6)[2](v6, @"perCardAdditionalScaleCoefficient", 0.0, 1.0);
  ((void (**)(void, __CFString *, double, double))v6)[2](v6, @"scaleCurveExponent", 0.1, 10.0);
  ((void (**)(void, __CFString *, double, double))v6)[2](v6, @"opacityMinimumDistanceThreshold", -1000.0, 1000.0);
  ((void (**)(void, __CFString *, double, double))v6)[2](v6, @"opacityFadeDistance", -1000.0, 1000.0);
  ((void (**)(void, __CFString *, double, double))v6)[2](v6, @"darkeningMinimumDistanceThreshold", -1000.0, 1000.0);
  ((void (**)(void, __CFString *, double, double))v6)[2](v6, @"darkeningFadeDistance", -1000.0, 1000.0);
  ((void (**)(void, __CFString *, double, double))v6)[2](v6, @"maximumDarkening", 0.0, 1.0);
  ((void (**)(void, __CFString *, double, double))v6)[2](v6, @"titleAndIconOpacityMinimumDistanceThreshold", -1000.0, 1000.0);
  ((void (**)(void, __CFString *, double, double))v6)[2](v6, @"titleAndIconOpacityFadeDistance", -1000.0, 1000.0);
  ((void (**)(void, __CFString *, double, double))v6)[2](v6, @"titleOpacityMinimumDistanceThreshold", -1000.0, 1000.0);
  ((void (**)(void, __CFString *, double, double))v6)[2](v6, @"titleOpacityFadeDistance", -1000.0, 1000.0);
  ((void (**)(void, __CFString *, double, double))v6)[2](v6, @"overshootPullbackDelayOffscreen", 0.0, 1.0);
  ((void (**)(void, __CFString *, double, double))v6)[2](v6, @"overshootPullbackDelayOnscreen", 0.0, 1.0);
  ((void (**)(void, __CFString *, double, double))v6)[2](v6, @"rightEdgePeekDelay", 0.0, 8.0);
  ((void (**)(void, __CFString *, double, double))v6)[2](v6, @"rightEdgePeekTimeout", 0.0, 8.0);
  v7 = [MEMORY[0x1E4F94138] rowWithTitle:@"Home Affordance" childSettingsKeyPath:@"homeAffordanceSettings"];
  [v5 addObject:v7];

  v8 = [MEMORY[0x1E4F94168] sectionWithRows:v5 title:@"Settings"];
  v9 = (void *)MEMORY[0x1E4F94168];
  v10 = [MEMORY[0x1E4F94138] rowWithTitle:@"Tongue Container Left/Right Position Animation Settings" childSettingsKeyPath:@"tongueContainerPositionAnimationSettings"];
  v35[0] = v10;
  v11 = [MEMORY[0x1E4F94138] rowWithTitle:@"Tongue Container Left/Right Transform Animation Settings" childSettingsKeyPath:@"tongueContainerTransformAnimationSettings"];
  v35[1] = v11;
  v12 = [MEMORY[0x1E4F94138] rowWithTitle:@"Tongue Collapsed → Expanded Animation Settings" childSettingsKeyPath:@"tongueCollapsedToExpandedAnimationSettings"];
  v35[2] = v12;
  v13 = [MEMORY[0x1E4F94138] rowWithTitle:@"Tongue Expanded → Collapsed Animation Settings" childSettingsKeyPath:@"tongueExpandedToCollapsedAnimationSettings"];
  v35[3] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:4];
  v15 = [v9 sectionWithRows:v14 title:@"Tongue"];

  v16 = (void *)MEMORY[0x1E4F94100];
  v17 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v18 = [v16 rowWithTitle:@"Restore Defaults" action:v17];

  double v19 = (void *)MEMORY[0x1E4F94168];
  v34 = v18;
  double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  double v21 = [v19 sectionWithRows:v20];

  double v22 = (void *)MEMORY[0x1E4F94168];
  v33[0] = v8;
  v33[1] = v15;
  v33[2] = v21;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  v24 = [v22 moduleWithTitle:@"Floating Switcher" contents:v23];

  return v24;
}

void __54__SBFloatingSwitcherSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  id v7 = a2;
  v8 = objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:options:range:", @"([a-z])([A-Z])", @"$1 $2", 1024, 0, objc_msgSend(v7, "length"));
  id v15 = [v8 capitalizedString];

  v9 = [MEMORY[0x1E4F94140] rowWithTitle:v15 valueKeyPath:v7];
  v10 = [v9 between:a3 and:a4];
  v11 = [v10 condition:*(void *)(a1 + 32)];

  v12 = [MEMORY[0x1E4F941E0] rowWithTitle:v15 valueKeyPath:v7];

  v13 = [v12 minValue:a3 maxValue:a4];
  v14 = [v13 condition:*(void *)(a1 + 40)];

  [*(id *)(a1 + 48) addObject:v11];
  [*(id *)(a1 + 48) addObject:v14];
}

- (id)archiveValueForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"showFloats"])
  {
    id v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFloatingSwitcherSettings;
    id v5 = [(PTSettings *)&v7 archiveValueForKey:v4];
  }

  return v5;
}

- (double)switcherCardScale
{
  return self->_switcherCardScale;
}

- (void)setSwitcherCardScale:(double)a3
{
  self->_switcherCardScale = a3;
}

- (double)cardSpacing
{
  return self->_cardSpacing;
}

- (void)setCardSpacing:(double)a3
{
  self->_cardSpacing = a3;
}

- (double)dimmingAlpha
{
  return self->_dimmingAlpha;
}

- (void)setDimmingAlpha:(double)a3
{
  self->_dimmingAlpha = a3;
}

- (double)leadingEdgeRubberbandingRange
{
  return self->_leadingEdgeRubberbandingRange;
}

- (void)setLeadingEdgeRubberbandingRange:(double)a3
{
  self->_leadingEdgeRubberbandingRange = a3;
}

- (double)perCardAdditionalScaleCoefficient
{
  return self->_perCardAdditionalScaleCoefficient;
}

- (void)setPerCardAdditionalScaleCoefficient:(double)a3
{
  self->_perCardAdditionalScaleCoefficient = a3;
}

- (double)scaleCurveExponent
{
  return self->_scaleCurveExponent;
}

- (void)setScaleCurveExponent:(double)a3
{
  self->_scaleCurveExponent = a3;
}

- (double)opacityMinimumDistanceThreshold
{
  return self->_opacityMinimumDistanceThreshold;
}

- (void)setOpacityMinimumDistanceThreshold:(double)a3
{
  self->_opacityMinimumDistanceThreshold = a3;
}

- (double)opacityFadeDistance
{
  return self->_opacityFadeDistance;
}

- (void)setOpacityFadeDistance:(double)a3
{
  self->_opacityFadeDistance = a3;
}

- (double)darkeningMinimumDistanceThreshold
{
  return self->_darkeningMinimumDistanceThreshold;
}

- (void)setDarkeningMinimumDistanceThreshold:(double)a3
{
  self->_darkeningMinimumDistanceThreshold = a3;
}

- (double)darkeningFadeDistance
{
  return self->_darkeningFadeDistance;
}

- (void)setDarkeningFadeDistance:(double)a3
{
  self->_darkeningFadeDistance = a3;
}

- (double)maximumDarkening
{
  return self->_maximumDarkening;
}

- (void)setMaximumDarkening:(double)a3
{
  self->_maximumDarkening = a3;
}

- (double)titleAndIconOpacityMinimumDistanceThreshold
{
  return self->_titleAndIconOpacityMinimumDistanceThreshold;
}

- (void)setTitleAndIconOpacityMinimumDistanceThreshold:(double)a3
{
  self->_titleAndIconOpacityMinimumDistanceThreshold = a3;
}

- (double)titleAndIconOpacityFadeDistance
{
  return self->_titleAndIconOpacityFadeDistance;
}

- (void)setTitleAndIconOpacityFadeDistance:(double)a3
{
  self->_titleAndIconOpacityFadeDistance = a3;
}

- (double)titleOpacityMinimumDistanceThreshold
{
  return self->_titleOpacityMinimumDistanceThreshold;
}

- (void)setTitleOpacityMinimumDistanceThreshold:(double)a3
{
  self->_titleOpacityMinimumDistanceThreshold = a3;
}

- (double)titleOpacityFadeDistance
{
  return self->_titleOpacityFadeDistance;
}

- (void)setTitleOpacityFadeDistance:(double)a3
{
  self->_titleOpacityFadeDistance = a3;
}

- (double)overshootPullbackDelayOffscreen
{
  return self->_overshootPullbackDelayOffscreen;
}

- (void)setOvershootPullbackDelayOffscreen:(double)a3
{
  self->_overshootPullbackDelayOffscreen = a3;
}

- (double)overshootPullbackDelayOnscreen
{
  return self->_overshootPullbackDelayOnscreen;
}

- (void)setOvershootPullbackDelayOnscreen:(double)a3
{
  self->_overshootPullbackDelayOnscreen = a3;
}

- (double)rightEdgePeekDelay
{
  return self->_rightEdgePeekDelay;
}

- (void)setRightEdgePeekDelay:(double)a3
{
  self->_rightEdgePeekDelay = a3;
}

- (double)rightEdgePeekTimeout
{
  return self->_rightEdgePeekTimeout;
}

- (void)setRightEdgePeekTimeout:(double)a3
{
  self->_rightEdgePeekTimeout = a3;
}

- (SBFFluidBehaviorSettings)tongueContainerPositionAnimationSettings
{
  return (SBFFluidBehaviorSettings *)objc_getProperty(self, a2, 208, 1);
}

- (void)setTongueContainerPositionAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)tongueContainerTransformAnimationSettings
{
  return (SBFFluidBehaviorSettings *)objc_getProperty(self, a2, 216, 1);
}

- (void)setTongueContainerTransformAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)tongueCollapsedToExpandedAnimationSettings
{
  return (SBFFluidBehaviorSettings *)objc_getProperty(self, a2, 224, 1);
}

- (void)setTongueCollapsedToExpandedAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)tongueExpandedToCollapsedAnimationSettings
{
  return (SBFFluidBehaviorSettings *)objc_getProperty(self, a2, 232, 1);
}

- (void)setTongueExpandedToCollapsedAnimationSettings:(id)a3
{
}

- (MTLumaDodgePillSettings)homeAffordanceSettings
{
  return (MTLumaDodgePillSettings *)objc_getProperty(self, a2, 240, 1);
}

- (void)setHomeAffordanceSettings:(id)a3
{
}

- (BOOL)showFloats
{
  return self->_showFloats;
}

- (void)setShowFloats:(BOOL)a3
{
  self->_showFloats = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAffordanceSettings, 0);
  objc_storeStrong((id *)&self->_tongueExpandedToCollapsedAnimationSettings, 0);
  objc_storeStrong((id *)&self->_tongueCollapsedToExpandedAnimationSettings, 0);
  objc_storeStrong((id *)&self->_tongueContainerTransformAnimationSettings, 0);
  objc_storeStrong((id *)&self->_tongueContainerPositionAnimationSettings, 0);
}

@end