@interface SBPIPFluidTransitionsSettings
+ (id)settingsControllerModule;
- (SBFFluidBehaviorSettings)sourceClippingFluidBehavior;
- (SBFFluidBehaviorSettings)targetClippingFluidBehavior;
- (void)setDefaultValues;
- (void)setSourceClippingFluidBehavior:(id)a3;
- (void)setTargetClippingFluidBehavior:(id)a3;
@end

@implementation SBPIPFluidTransitionsSettings

- (void)setDefaultValues
{
  v5.receiver = self;
  v5.super_class = (Class)SBPIPFluidTransitionsSettings;
  [(PTSettings *)&v5 setDefaultValues];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  [v3 setName:@"Source clipping behavior"];
  [v3 setBehaviorType:2];
  [v3 setRetargetImpulse:0.0];
  [v3 setTrackingRetargetImpulse:0.0];
  [v3 setDampingRatio:1.0];
  [v3 setResponse:0.336];
  [v3 setTrackingDampingRatio:1.0];
  [v3 setTrackingResponse:0.08];
  [(SBPIPFluidTransitionsSettings *)self setSourceClippingFluidBehavior:v3];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  [v4 setName:@"Target clipping Behavior"];
  [v4 setBehaviorType:2];
  [v4 setRetargetImpulse:0.0];
  [v4 setTrackingRetargetImpulse:0.0];
  [v4 setDampingRatio:1.0];
  [v4 setResponse:0.35];
  [v4 setTrackingDampingRatio:1.0];
  [v4 setTrackingResponse:0.08];
  [(SBPIPFluidTransitionsSettings *)self setTargetClippingFluidBehavior:v4];
}

+ (id)settingsControllerModule
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94168];
  v3 = [MEMORY[0x1E4FA5F08] _moduleWithSectionTitle:@"Source Clipping Behavior"];
  v4 = [v2 submoduleWithModule:v3 childSettingsKeyPath:@"sourceClippingFluidBehavior"];

  objc_super v5 = (void *)MEMORY[0x1E4F94168];
  v6 = [MEMORY[0x1E4FA5F08] _moduleWithSectionTitle:@"Target Clipping Behavior"];
  v7 = [v5 submoduleWithModule:v6 childSettingsKeyPath:@"targetClippingFluidBehavior"];

  v8 = (void *)MEMORY[0x1E4F94100];
  v9 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v10 = [v8 rowWithTitle:@"Restore Defaults" action:v9];

  v11 = (void *)MEMORY[0x1E4F94168];
  v19[0] = v10;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v13 = [v11 sectionWithRows:v12 title:@"Restore Default Values"];

  v14 = (void *)MEMORY[0x1E4F94168];
  v18[0] = v13;
  v18[1] = v4;
  v18[2] = v7;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  v16 = [v14 moduleWithTitle:@"AutoPIP and Fluid Restore" contents:v15];

  return v16;
}

- (SBFFluidBehaviorSettings)sourceClippingFluidBehavior
{
  return self->_sourceClippingFluidBehavior;
}

- (void)setSourceClippingFluidBehavior:(id)a3
{
}

- (SBFFluidBehaviorSettings)targetClippingFluidBehavior
{
  return self->_targetClippingFluidBehavior;
}

- (void)setTargetClippingFluidBehavior:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetClippingFluidBehavior, 0);
  objc_storeStrong((id *)&self->_sourceClippingFluidBehavior, 0);
}

@end