@interface SBSAElementContentTransitionSettings
+ (id)_childSettingsKeyPathsToTitles;
- (SBFFluidBehaviorSettings)customContentBehaviorSettings;
- (SBFFluidBehaviorSettings)sensorObscuringShadowBehaviorSettings;
- (SBFFluidBehaviorSettings)snapshotBehaviorSettings;
- (SBFFluidBehaviorSettings)subcomponentBehaviorSettings;
- (void)setCustomContentBehaviorSettings:(id)a3;
- (void)setSensorObscuringShadowBehaviorSettings:(id)a3;
- (void)setSnapshotBehaviorSettings:(id)a3;
- (void)setSubcomponentBehaviorSettings:(id)a3;
@end

@implementation SBSAElementContentTransitionSettings

+ (id)_childSettingsKeyPathsToTitles
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___SBSAElementContentTransitionSettings;
  v2 = objc_msgSendSuper2(&v5, sel__childSettingsKeyPathsToTitles);
  v3 = (void *)[v2 mutableCopy];

  [v3 setObject:@"Sensor Shadow Behavior Settings" forKeyedSubscript:@"sensorObscuringShadowBehaviorSettings"];
  [v3 setObject:@"Subcomponent Behavior Settings" forKeyedSubscript:@"subcomponentBehaviorSettings"];
  [v3 setObject:@"Custom Content Behavior Settings" forKeyedSubscript:@"customContentBehaviorSettings"];
  [v3 setObject:@"Snapshot Behavior Settings" forKeyedSubscript:@"snapshotBehaviorSettings"];
  return v3;
}

- (SBFFluidBehaviorSettings)sensorObscuringShadowBehaviorSettings
{
  return self->_sensorObscuringShadowBehaviorSettings;
}

- (void)setSensorObscuringShadowBehaviorSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)subcomponentBehaviorSettings
{
  return self->_subcomponentBehaviorSettings;
}

- (void)setSubcomponentBehaviorSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)customContentBehaviorSettings
{
  return self->_customContentBehaviorSettings;
}

- (void)setCustomContentBehaviorSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)snapshotBehaviorSettings
{
  return self->_snapshotBehaviorSettings;
}

- (void)setSnapshotBehaviorSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_customContentBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_subcomponentBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_sensorObscuringShadowBehaviorSettings, 0);
}

@end