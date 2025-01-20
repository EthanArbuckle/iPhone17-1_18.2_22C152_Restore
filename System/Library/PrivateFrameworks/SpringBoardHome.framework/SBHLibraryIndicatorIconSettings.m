@interface SBHLibraryIndicatorIconSettings
+ (id)settingsControllerModule;
- (SBFFluidBehaviorSettings)pod1AnimationSettings;
- (SBFFluidBehaviorSettings)pod2AnimationSettings;
- (SBFFluidBehaviorSettings)pod3AnimationSettings;
- (double)pod1Scale;
- (double)pod2Scale;
- (double)pod3Scale;
- (void)setDefaultValues;
- (void)setPod1AnimationSettings:(id)a3;
- (void)setPod1Scale:(double)a3;
- (void)setPod2AnimationSettings:(id)a3;
- (void)setPod2Scale:(double)a3;
- (void)setPod3AnimationSettings:(id)a3;
- (void)setPod3Scale:(double)a3;
@end

@implementation SBHLibraryIndicatorIconSettings

- (void)setDefaultValues
{
  v6.receiver = self;
  v6.super_class = (Class)SBHLibraryIndicatorIconSettings;
  [(PTSettings *)&v6 setDefaultValues];
  [(SBHLibraryIndicatorIconSettings *)self setPod1Scale:0.93];
  [(SBHLibraryIndicatorIconSettings *)self setPod2Scale:0.9075];
  [(SBHLibraryIndicatorIconSettings *)self setPod3Scale:0.87];
  v3 = [(SBHLibraryIndicatorIconSettings *)self pod1AnimationSettings];
  [v3 setDefaultValues];
  [v3 setBehaviorType:1];
  [v3 setDampingRatio:0.4];
  [v3 setResponse:0.5];
  v4 = [(SBHLibraryIndicatorIconSettings *)self pod2AnimationSettings];
  [v4 setDefaultValues];
  [v4 setBehaviorType:1];
  [v4 setDampingRatio:0.6];
  [v4 setResponse:0.4];
  v5 = [(SBHLibraryIndicatorIconSettings *)self pod3AnimationSettings];
  [v5 setDefaultValues];
  [v5 setBehaviorType:1];
  [v5 setDampingRatio:0.8];
  [v5 setResponse:0.3];
}

+ (id)settingsControllerModule
{
  v33[3] = *MEMORY[0x1E4F143B8];
  v28 = (void *)MEMORY[0x1E4F94160];
  v2 = [MEMORY[0x1E4F94148] rowWithTitle:@"Pod 1 Scale" valueKeyPath:@"pod1Scale"];
  v3 = [v2 between:0.0 and:1.0];
  v4 = [v3 precision:4];
  v33[0] = v4;
  v5 = [MEMORY[0x1E4F94148] rowWithTitle:@"Pod 2 Scale" valueKeyPath:@"pod2Scale"];
  objc_super v6 = [v5 between:0.0 and:1.0];
  v7 = [v6 precision:4];
  v33[1] = v7;
  v8 = [MEMORY[0x1E4F94148] rowWithTitle:@"Pod 3 Scale" valueKeyPath:@"pod3Scale"];
  v9 = [v8 between:0.0 and:1.0];
  v10 = [v9 precision:4];
  v33[2] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
  v29 = [v28 sectionWithRows:v11 title:@"Pod Scale Settings"];

  v12 = (void *)MEMORY[0x1E4F94160];
  v13 = [MEMORY[0x1E4F94130] rowWithTitle:@"Pod 1 Animation Settings" childSettingsKeyPath:@"pod1AnimationSettings"];
  v32[0] = v13;
  v14 = [MEMORY[0x1E4F94130] rowWithTitle:@"Pod 2 Animation Settings" childSettingsKeyPath:@"pod2AnimationSettings"];
  v32[1] = v14;
  v15 = [MEMORY[0x1E4F94130] rowWithTitle:@"Pod 3 Animation Settings" childSettingsKeyPath:@"pod3AnimationSettings"];
  v32[2] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
  v17 = [v12 sectionWithRows:v16 title:@"Pod Scale Animation Settings"];

  v18 = (void *)MEMORY[0x1E4F94160];
  v19 = (void *)MEMORY[0x1E4F940F8];
  v20 = [MEMORY[0x1E4F94170] action];
  v21 = [v19 rowWithTitle:@"Restore Defaults" action:v20];
  v31 = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v23 = [v18 sectionWithRows:v22];

  v24 = (void *)MEMORY[0x1E4F94160];
  v30[0] = v29;
  v30[1] = v17;
  v30[2] = v23;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
  v26 = [v24 moduleWithTitle:0 contents:v25];

  return v26;
}

- (double)pod1Scale
{
  return self->_pod1Scale;
}

- (void)setPod1Scale:(double)a3
{
  self->_pod1Scale = a3;
}

- (double)pod2Scale
{
  return self->_pod2Scale;
}

- (void)setPod2Scale:(double)a3
{
  self->_pod2Scale = a3;
}

- (double)pod3Scale
{
  return self->_pod3Scale;
}

- (void)setPod3Scale:(double)a3
{
  self->_pod3Scale = a3;
}

- (SBFFluidBehaviorSettings)pod1AnimationSettings
{
  return self->_pod1AnimationSettings;
}

- (void)setPod1AnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)pod2AnimationSettings
{
  return self->_pod2AnimationSettings;
}

- (void)setPod2AnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)pod3AnimationSettings
{
  return self->_pod3AnimationSettings;
}

- (void)setPod3AnimationSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pod3AnimationSettings, 0);
  objc_storeStrong((id *)&self->_pod2AnimationSettings, 0);
  objc_storeStrong((id *)&self->_pod1AnimationSettings, 0);
}

@end