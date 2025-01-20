@interface SBSAInterfaceElementTransitionSettings
+ (id)_childSettingsKeyPathsToTitles;
- (SBFFluidBehaviorSettings)alphaBehaviorSettings;
- (SBFFluidBehaviorSettings)backgroundColorBehaviorSettings;
- (SBFFluidBehaviorSettings)boundsBehaviorSettings;
- (SBFFluidBehaviorSettings)centerBehaviorSettings;
- (SBFFluidBehaviorSettings)cornerRadiusBehaviorSettings;
- (void)setAlphaBehaviorSettings:(id)a3;
- (void)setBackgroundColorBehaviorSettings:(id)a3;
- (void)setBoundsBehaviorSettings:(id)a3;
- (void)setCenterBehaviorSettings:(id)a3;
- (void)setCornerRadiusBehaviorSettings:(id)a3;
@end

@implementation SBSAInterfaceElementTransitionSettings

- (SBFFluidBehaviorSettings)centerBehaviorSettings
{
  return self->_centerBehaviorSettings;
}

- (SBFFluidBehaviorSettings)alphaBehaviorSettings
{
  return self->_alphaBehaviorSettings;
}

- (SBFFluidBehaviorSettings)boundsBehaviorSettings
{
  return self->_boundsBehaviorSettings;
}

+ (id)_childSettingsKeyPathsToTitles
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___SBSAInterfaceElementTransitionSettings;
  v2 = objc_msgSendSuper2(&v5, sel__childSettingsKeyPathsToTitles);
  v3 = (void *)[v2 mutableCopy];

  [v3 setObject:@"Center Behavior Settings" forKeyedSubscript:@"centerBehaviorSettings"];
  [v3 setObject:@"Bounds Behavior Settings" forKeyedSubscript:@"boundsBehaviorSettings"];
  [v3 setObject:@"Corner Radius Behavior Settings" forKeyedSubscript:@"cornerRadiusBehaviorSettings"];
  [v3 setObject:@"Alpha Behavior Settings" forKeyedSubscript:@"alphaBehaviorSettings"];
  [v3 setObject:@"Background Color Behavior Settings" forKeyedSubscript:@"backgroundColorBehaviorSettings"];
  return v3;
}

- (void)setCenterBehaviorSettings:(id)a3
{
}

- (void)setBoundsBehaviorSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)cornerRadiusBehaviorSettings
{
  return self->_cornerRadiusBehaviorSettings;
}

- (void)setCornerRadiusBehaviorSettings:(id)a3
{
}

- (void)setAlphaBehaviorSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)backgroundColorBehaviorSettings
{
  return self->_backgroundColorBehaviorSettings;
}

- (void)setBackgroundColorBehaviorSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColorBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_alphaBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_cornerRadiusBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_boundsBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_centerBehaviorSettings, 0);
}

@end