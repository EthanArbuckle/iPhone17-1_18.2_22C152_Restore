@interface SBHIconAnimationSettings
+ (id)settingsControllerModule;
- (SBFAnimationSettings)centralAnimationSettings;
- (void)setCentralAnimationSettings:(id)a3;
- (void)setDefaultValues;
@end

@implementation SBHIconAnimationSettings

- (void)setDefaultValues
{
  v3 = [(SBHIconAnimationSettings *)self centralAnimationSettings];
  [v3 setAnimationType:1];

  v4 = [(SBHIconAnimationSettings *)self centralAnimationSettings];
  [v4 setMass:2.0];

  v5 = [(SBHIconAnimationSettings *)self centralAnimationSettings];
  [v5 setStiffness:700.0];

  v6 = [(SBHIconAnimationSettings *)self centralAnimationSettings];
  [v6 setDamping:600.0];

  v7 = [(SBHIconAnimationSettings *)self centralAnimationSettings];
  [v7 setCurve:393216];

  v8 = [(SBHIconAnimationSettings *)self centralAnimationSettings];
  v9 = [v8 controlPoint1Settings];
  objc_msgSend(v9, "setPointValue:", 0.3825, 0.091);

  v10 = [(SBHIconAnimationSettings *)self centralAnimationSettings];
  v11 = [v10 controlPoint2Settings];
  objc_msgSend(v11, "setPointValue:", 0.98, 0.785);

  id v12 = [(SBHIconAnimationSettings *)self centralAnimationSettings];
  CAFrameRateRange v14 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v12, "setFrameRateRange:highFrameRateReason:", 1114123, *(double *)&v14.minimum, *(double *)&v14.maximum, *(double *)&v14.preferred);
}

+ (id)settingsControllerModule
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v3 = [MEMORY[0x1E4FA5E80] _moduleWithSectionTitle:@"Icon Animation" delay:0 frameRate:1];
  v4 = [v2 submoduleWithModule:v3 childSettingsKeyPath:@"centralAnimationSettings"];

  v5 = (void *)MEMORY[0x1E4F94160];
  v9[0] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v7 = [v5 moduleWithTitle:0 contents:v6];

  return v7;
}

- (SBFAnimationSettings)centralAnimationSettings
{
  return self->_centralAnimationSettings;
}

- (void)setCentralAnimationSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end