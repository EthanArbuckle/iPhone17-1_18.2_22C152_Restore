@interface SBBannerTransitionSettings
+ (id)settingsControllerModule;
- (SBFFluidBehaviorSettings)customBannerTransitionStylePoof;
- (SBFFluidBehaviorSettings)customBannerTransitionStyleSystemAction;
- (double)poofDismissedBlurRadius;
- (double)poofDismissedScale;
- (double)poofInitialBlurRadius;
- (double)poofInitialScale;
- (void)setCustomBannerTransitionStylePoof:(id)a3;
- (void)setCustomBannerTransitionStyleSystemAction:(id)a3;
- (void)setDefaultValues;
- (void)setPoofDismissedBlurRadius:(double)a3;
- (void)setPoofDismissedScale:(double)a3;
- (void)setPoofInitialBlurRadius:(double)a3;
- (void)setPoofInitialScale:(double)a3;
@end

@implementation SBBannerTransitionSettings

- (void)setDefaultValues
{
  v11.receiver = self;
  v11.super_class = (Class)SBBannerTransitionSettings;
  [(PTSettings *)&v11 setDefaultValues];
  v3 = [(SBBannerTransitionSettings *)self customBannerTransitionStylePoof];
  [v3 setDefaultValues];

  v4 = [(SBBannerTransitionSettings *)self customBannerTransitionStylePoof];
  [v4 setDampingRatio:0.7];

  v5 = [(SBBannerTransitionSettings *)self customBannerTransitionStylePoof];
  [v5 setResponse:0.55];

  v6 = [(SBBannerTransitionSettings *)self customBannerTransitionStylePoof];
  CAFrameRateRange v12 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v6, "setFrameRateRange:highFrameRateReason:", 1114142, *(double *)&v12.minimum, *(double *)&v12.maximum, *(double *)&v12.preferred);

  [(SBBannerTransitionSettings *)self setPoofInitialScale:0.6];
  [(SBBannerTransitionSettings *)self setPoofInitialBlurRadius:90.0];
  [(SBBannerTransitionSettings *)self setPoofDismissedScale:0.6];
  [(SBBannerTransitionSettings *)self setPoofDismissedBlurRadius:90.0];
  v7 = [(SBBannerTransitionSettings *)self customBannerTransitionStyleSystemAction];
  [v7 setDefaultValues];

  v8 = [(SBBannerTransitionSettings *)self customBannerTransitionStyleSystemAction];
  [v8 setDampingRatio:0.7];

  v9 = [(SBBannerTransitionSettings *)self customBannerTransitionStyleSystemAction];
  [v9 setResponse:0.55];

  v10 = [(SBBannerTransitionSettings *)self customBannerTransitionStyleSystemAction];
  CAFrameRateRange v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v10, "setFrameRateRange:highFrameRateReason:", 1114142, *(double *)&v13.minimum, *(double *)&v13.maximum, *(double *)&v13.preferred);
}

+ (id)settingsControllerModule
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94100];
  v3 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v24 = [v2 rowWithTitle:@"Restore Defaults" action:v3];

  v4 = (void *)MEMORY[0x1E4F94168];
  v27[0] = v24;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  v23 = [v4 sectionWithRows:v5];

  v22 = [MEMORY[0x1E4F94138] rowWithTitle:@"Poof Animation Settings" childSettingsKeyPath:@"customBannerTransitionStylePoof"];
  v6 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Poof Initial Scale" valueKeyPath:@"poofInitialScale"];
  v7 = [v6 minValue:0.5 maxValue:1.5];

  v8 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Poof Initial Blur Radius" valueKeyPath:@"poofInitialBlurRadius"];
  v9 = [v8 minValue:0.0 maxValue:150.0];

  v10 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Poof Dismissed Scale" valueKeyPath:@"poofDismissedScale"];
  objc_super v11 = [v10 minValue:0.5 maxValue:1.5];

  CAFrameRateRange v12 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Poof Dismissed Blur Radius" valueKeyPath:@"poofDismissedBlurRadius"];
  CAFrameRateRange v13 = [v12 minValue:0.0 maxValue:150.0];

  v14 = [MEMORY[0x1E4F94138] rowWithTitle:@"Staccato Animation Settings" childSettingsKeyPath:@"customBannerTransitionStyleSystemAction"];
  v15 = (void *)MEMORY[0x1E4F94168];
  v26[0] = v22;
  v26[1] = v7;
  v26[2] = v11;
  v26[3] = v9;
  v26[4] = v13;
  v26[5] = v14;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:6];
  v17 = [v15 sectionWithRows:v16 title:@"Transition Settings"];

  v18 = (void *)MEMORY[0x1E4F94168];
  v25[0] = v23;
  v25[1] = v17;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  v20 = [v18 moduleWithTitle:@"Custom Banner Transitions" contents:v19];

  return v20;
}

- (SBFFluidBehaviorSettings)customBannerTransitionStylePoof
{
  return self->_customBannerTransitionStylePoof;
}

- (void)setCustomBannerTransitionStylePoof:(id)a3
{
}

- (double)poofInitialBlurRadius
{
  return self->_poofInitialBlurRadius;
}

- (void)setPoofInitialBlurRadius:(double)a3
{
  self->_poofInitialBlurRadius = a3;
}

- (double)poofDismissedBlurRadius
{
  return self->_poofDismissedBlurRadius;
}

- (void)setPoofDismissedBlurRadius:(double)a3
{
  self->_poofDismissedBlurRadius = a3;
}

- (double)poofInitialScale
{
  return self->_poofInitialScale;
}

- (void)setPoofInitialScale:(double)a3
{
  self->_poofInitialScale = a3;
}

- (double)poofDismissedScale
{
  return self->_poofDismissedScale;
}

- (void)setPoofDismissedScale:(double)a3
{
  self->_poofDismissedScale = a3;
}

- (SBFFluidBehaviorSettings)customBannerTransitionStyleSystemAction
{
  return self->_customBannerTransitionStyleSystemAction;
}

- (void)setCustomBannerTransitionStyleSystemAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customBannerTransitionStyleSystemAction, 0);
  objc_storeStrong((id *)&self->_customBannerTransitionStylePoof, 0);
}

@end