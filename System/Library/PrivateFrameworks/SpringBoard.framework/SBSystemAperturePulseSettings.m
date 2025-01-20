@interface SBSystemAperturePulseSettings
+ (id)settingsControllerModule;
- (SBFFluidBehaviorSettings)contractBehaviorSettings;
- (SBFFluidBehaviorSettings)expandBehaviorSettings;
- (double)expandDelay;
- (double)expandDuration;
- (double)expandScale;
- (void)setContractBehaviorSettings:(id)a3;
- (void)setDefaultValues;
- (void)setExpandBehaviorSettings:(id)a3;
- (void)setExpandDelay:(double)a3;
- (void)setExpandDuration:(double)a3;
- (void)setExpandScale:(double)a3;
@end

@implementation SBSystemAperturePulseSettings

- (void)setDefaultValues
{
  [(SBSystemAperturePulseSettings *)self setExpandDelay:0.0];
  [(SBSystemAperturePulseSettings *)self setExpandScale:1.0];
  [(SBSystemAperturePulseSettings *)self setExpandDuration:0.0];
  v3 = [(SBSystemAperturePulseSettings *)self expandBehaviorSettings];
  [v3 setDefaultValues];

  id v4 = [(SBSystemAperturePulseSettings *)self contractBehaviorSettings];
  [v4 setDefaultValues];
}

+ (id)settingsControllerModule
{
  v25[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94168];
  v22 = [MEMORY[0x1E4F94140] rowWithTitle:@"Expand Duration" valueKeyPath:@"expandDuration"];
  v21 = [v22 between:0.0 and:1.0];
  v3 = [v21 precision:3];
  v25[0] = v3;
  id v4 = [MEMORY[0x1E4F94140] rowWithTitle:@"Expand Scale" valueKeyPath:@"expandScale"];
  v5 = [v4 between:0.1 and:2.0];
  v6 = [v5 precision:3];
  v25[1] = v6;
  v7 = [MEMORY[0x1E4F94140] rowWithTitle:@"Expand Delay" valueKeyPath:@"expandDelay"];
  v8 = [v7 between:0.1 and:2.0];
  v9 = [v8 precision:3];
  v25[2] = v9;
  v10 = [MEMORY[0x1E4F94138] rowWithTitle:@"Expand Behavior Settings" childSettingsKeyPath:@"expandBehaviorSettings"];
  v25[3] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
  v12 = [v2 sectionWithRows:v11 title:@"Expand Settings"];

  v13 = (void *)MEMORY[0x1E4F94168];
  v14 = [MEMORY[0x1E4F94138] rowWithTitle:@"Contract Behavior Settings" childSettingsKeyPath:@"contractBehaviorSettings"];
  v24 = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v16 = [v13 sectionWithRows:v15 title:@"Contract Settings"];

  v17 = (void *)MEMORY[0x1E4F94168];
  v23[0] = v12;
  v23[1] = v16;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v19 = [v17 moduleWithTitle:@"Pulse Settings" contents:v18];

  return v19;
}

- (double)expandScale
{
  return self->_expandScale;
}

- (void)setExpandScale:(double)a3
{
  self->_expandScale = a3;
}

- (double)expandDuration
{
  return self->_expandDuration;
}

- (void)setExpandDuration:(double)a3
{
  self->_expandDuration = a3;
}

- (double)expandDelay
{
  return self->_expandDelay;
}

- (void)setExpandDelay:(double)a3
{
  self->_expandDelay = a3;
}

- (SBFFluidBehaviorSettings)expandBehaviorSettings
{
  return self->_expandBehaviorSettings;
}

- (void)setExpandBehaviorSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)contractBehaviorSettings
{
  return self->_contractBehaviorSettings;
}

- (void)setContractBehaviorSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contractBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_expandBehaviorSettings, 0);
}

@end