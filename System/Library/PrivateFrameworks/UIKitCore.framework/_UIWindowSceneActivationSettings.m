@interface _UIWindowSceneActivationSettings
+ (id)settingsControllerModule;
- (_UISpringAnimationPrototypeSettings)morph;
- (_UISpringAnimationPrototypeSettings)morphMenuDismissal;
- (_UISpringAnimationPrototypeSettings)pinchInteractiveScale;
- (_UISpringAnimationPrototypeSettings)pinchSettle;
- (_UISpringAnimationPrototypeSettings)pinchShadow;
- (double)pinchActivationScaleThreshold;
- (double)pinchEndPlatterVelocityMultiplier;
- (double)pinchEndingProjectionDuration;
- (double)pinchPlatterMaxShadowIntensity;
- (void)setDefaultValues;
- (void)setMorph:(id)a3;
- (void)setMorphMenuDismissal:(id)a3;
- (void)setPinchActivationScaleThreshold:(double)a3;
- (void)setPinchEndPlatterVelocityMultiplier:(double)a3;
- (void)setPinchEndingProjectionDuration:(double)a3;
- (void)setPinchInteractiveScale:(id)a3;
- (void)setPinchPlatterMaxShadowIntensity:(double)a3;
- (void)setPinchSettle:(id)a3;
- (void)setPinchShadow:(id)a3;
@end

@implementation _UIWindowSceneActivationSettings

- (void)setDefaultValues
{
  v13.receiver = self;
  v13.super_class = (Class)_UIWindowSceneActivationSettings;
  [(PTSettings *)&v13 setDefaultValues];
  [(_UIWindowSceneActivationSettings *)self setPinchActivationScaleThreshold:1.5];
  [(_UIWindowSceneActivationSettings *)self setPinchEndingProjectionDuration:0.15];
  [(_UIWindowSceneActivationSettings *)self setPinchPlatterMaxShadowIntensity:0.5];
  [(_UIWindowSceneActivationSettings *)self setPinchEndPlatterVelocityMultiplier:5.0];
  v3 = [(_UIWindowSceneActivationSettings *)self pinchInteractiveScale];
  [v3 setDampingRatio:0.85];

  v4 = [(_UIWindowSceneActivationSettings *)self pinchInteractiveScale];
  [v4 setResponse:0.25];

  v5 = [(_UIWindowSceneActivationSettings *)self pinchSettle];
  [v5 setDampingRatio:0.85];

  v6 = [(_UIWindowSceneActivationSettings *)self pinchSettle];
  [v6 setResponse:0.45];

  v7 = [(_UIWindowSceneActivationSettings *)self pinchShadow];
  [v7 setDampingRatio:1.0];

  v8 = [(_UIWindowSceneActivationSettings *)self pinchShadow];
  [v8 setResponse:0.4];

  v9 = [(_UIWindowSceneActivationSettings *)self morph];
  [v9 setDampingRatio:1.0];

  v10 = [(_UIWindowSceneActivationSettings *)self morph];
  [v10 setResponse:0.336];

  v11 = [(_UIWindowSceneActivationSettings *)self morphMenuDismissal];
  [v11 setDampingRatio:1.0];

  v12 = [(_UIWindowSceneActivationSettings *)self morphMenuDismissal];
  [v12 setResponse:0.1];
}

+ (id)settingsControllerModule
{
  v31[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v28 = [MEMORY[0x1E4F94148] rowWithTitle:@"Activation Scale Threshold" valueKeyPath:@"pinchActivationScaleThreshold"];
  v27 = [v28 between:0.0 and:5.0];
  v26 = [v27 precision:2];
  v31[0] = v26;
  v25 = [MEMORY[0x1E4F94148] rowWithTitle:@"End Projection Duration" valueKeyPath:@"pinchEndingProjectionDuration"];
  v24 = [v25 between:0.0 and:1.0];
  v23 = [v24 precision:2];
  v31[1] = v23;
  v22 = [MEMORY[0x1E4F94148] rowWithTitle:@"Platter Shadow Intensity" valueKeyPath:@"pinchPlatterMaxShadowIntensity"];
  v21 = [v22 between:0.0 and:1.0];
  v20 = [v21 precision:2];
  v31[2] = v20;
  v3 = [MEMORY[0x1E4F94148] rowWithTitle:@"Ending Animation Platter Position Velocity Multiplier" valueKeyPath:@"pinchEndPlatterVelocityMultiplier"];
  v4 = [v3 between:0.0 and:100.0];
  v5 = [v4 precision:2];
  v31[3] = v5;
  v6 = [MEMORY[0x1E4F94130] rowWithTitle:@"Interactive Scale Animation" childSettingsKeyPath:@"pinchInteractiveScale"];
  v31[4] = v6;
  v7 = [MEMORY[0x1E4F94130] rowWithTitle:@"Scale Settle Animation" childSettingsKeyPath:@"pinchSettle"];
  v31[5] = v7;
  v8 = [MEMORY[0x1E4F94130] rowWithTitle:@"Shadow Animation" childSettingsKeyPath:@"pinchShadow"];
  v31[6] = v8;
  v9 = [MEMORY[0x1E4F94130] rowWithTitle:@"Center Window Morph Animation" childSettingsKeyPath:@"morph"];
  v31[7] = v9;
  v10 = [MEMORY[0x1E4F94130] rowWithTitle:@"Morph Menu Dismissal Animation" childSettingsKeyPath:@"morphMenuDismissal"];
  v31[8] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:9];
  v12 = [v2 sectionWithRows:v11 title:@"In-App Pinch Interaction"];

  objc_super v13 = (void *)MEMORY[0x1E4F94160];
  v30[0] = v12;
  v14 = [MEMORY[0x1E4F940F8] restoreDefaultSettingsButton];
  v29 = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  v16 = [v13 sectionWithRows:v15];
  v30[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  v18 = [v13 moduleWithTitle:0 contents:v17];

  return v18;
}

- (double)pinchActivationScaleThreshold
{
  return self->_pinchActivationScaleThreshold;
}

- (void)setPinchActivationScaleThreshold:(double)a3
{
  self->_pinchActivationScaleThreshold = a3;
}

- (double)pinchEndingProjectionDuration
{
  return self->_pinchEndingProjectionDuration;
}

- (void)setPinchEndingProjectionDuration:(double)a3
{
  self->_pinchEndingProjectionDuration = a3;
}

- (double)pinchPlatterMaxShadowIntensity
{
  return self->_pinchPlatterMaxShadowIntensity;
}

- (void)setPinchPlatterMaxShadowIntensity:(double)a3
{
  self->_pinchPlatterMaxShadowIntensity = a3;
}

- (double)pinchEndPlatterVelocityMultiplier
{
  return self->_pinchEndPlatterVelocityMultiplier;
}

- (void)setPinchEndPlatterVelocityMultiplier:(double)a3
{
  self->_pinchEndPlatterVelocityMultiplier = a3;
}

- (_UISpringAnimationPrototypeSettings)pinchInteractiveScale
{
  return self->_pinchInteractiveScale;
}

- (void)setPinchInteractiveScale:(id)a3
{
}

- (_UISpringAnimationPrototypeSettings)pinchSettle
{
  return self->_pinchSettle;
}

- (void)setPinchSettle:(id)a3
{
}

- (_UISpringAnimationPrototypeSettings)pinchShadow
{
  return self->_pinchShadow;
}

- (void)setPinchShadow:(id)a3
{
}

- (_UISpringAnimationPrototypeSettings)morph
{
  return self->_morph;
}

- (void)setMorph:(id)a3
{
}

- (_UISpringAnimationPrototypeSettings)morphMenuDismissal
{
  return self->_morphMenuDismissal;
}

- (void)setMorphMenuDismissal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_morphMenuDismissal, 0);
  objc_storeStrong((id *)&self->_morph, 0);
  objc_storeStrong((id *)&self->_pinchShadow, 0);
  objc_storeStrong((id *)&self->_pinchSettle, 0);
  objc_storeStrong((id *)&self->_pinchInteractiveScale, 0);
}

@end