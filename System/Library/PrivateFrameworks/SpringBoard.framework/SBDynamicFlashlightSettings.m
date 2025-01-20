@interface SBDynamicFlashlightSettings
+ (id)settingsControllerModule;
- (CGPoint)gestureScaling;
- (SBFFluidBehaviorSettings)springAnimationSettings;
- (double)autoDismissalDelay;
- (double)gestureClampFactor;
- (double)gestureXScaling;
- (double)gestureYScaling;
- (double)heightStretchFactor;
- (double)inertiaFactor;
- (double)minimumHWIntensity;
- (double)minimumIntensity;
- (double)overshootClampFactor;
- (double)persistenceDelay;
- (double)tapMoveThreshold;
- (double)tapTimeThreshold;
- (double)widthStretchFactor;
- (void)setAutoDismissalDelay:(double)a3;
- (void)setDefaultValues;
- (void)setGestureClampFactor:(double)a3;
- (void)setGestureScaling:(CGPoint)a3;
- (void)setGestureXScaling:(double)a3;
- (void)setGestureYScaling:(double)a3;
- (void)setHeightStretchFactor:(double)a3;
- (void)setInertiaFactor:(double)a3;
- (void)setMinimumHWIntensity:(double)a3;
- (void)setMinimumIntensity:(double)a3;
- (void)setOvershootClampFactor:(double)a3;
- (void)setPersistenceDelay:(double)a3;
- (void)setSpringAnimationSettings:(id)a3;
- (void)setTapMoveThreshold:(double)a3;
- (void)setTapTimeThreshold:(double)a3;
- (void)setWidthStretchFactor:(double)a3;
@end

@implementation SBDynamicFlashlightSettings

- (void)setDefaultValues
{
  v4.receiver = self;
  v4.super_class = (Class)SBDynamicFlashlightSettings;
  [(PTSettings *)&v4 setDefaultValues];
  [(SBDynamicFlashlightSettings *)self setMinimumIntensity:0.02];
  [(SBDynamicFlashlightSettings *)self setMinimumHWIntensity:0.02];
  [(SBDynamicFlashlightSettings *)self setGestureXScaling:200.0];
  [(SBDynamicFlashlightSettings *)self setGestureYScaling:400.0];
  [(SBDynamicFlashlightSettings *)self setGestureClampFactor:0.05];
  [(SBDynamicFlashlightSettings *)self setTapMoveThreshold:10.0];
  [(SBDynamicFlashlightSettings *)self setTapTimeThreshold:0.1];
  [(SBFFluidBehaviorSettings *)self->_springAnimationSettings setDefaultValues];
  springAnimationSettings = self->_springAnimationSettings;
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](springAnimationSettings, "setFrameRateRange:highFrameRateReason:", 1114150, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
  [(SBFFluidBehaviorSettings *)self->_springAnimationSettings setDampingRatio:0.983];
  [(SBFFluidBehaviorSettings *)self->_springAnimationSettings setResponse:0.643];
  [(SBFFluidBehaviorSettings *)self->_springAnimationSettings setRetargetImpulse:0.029];
  [(SBFFluidBehaviorSettings *)self->_springAnimationSettings setTrackingDampingRatio:0.739];
  [(SBFFluidBehaviorSettings *)self->_springAnimationSettings setTrackingResponse:0.377];
  [(SBFFluidBehaviorSettings *)self->_springAnimationSettings setTrackingRetargetImpulse:0.029];
  [(SBFFluidBehaviorSettings *)self->_springAnimationSettings setInertialProjectionDeceleration:0.998];
  [(SBDynamicFlashlightSettings *)self setInertiaFactor:0.12];
  [(SBDynamicFlashlightSettings *)self setOvershootClampFactor:0.035];
  [(SBDynamicFlashlightSettings *)self setHeightStretchFactor:0.6];
  [(SBDynamicFlashlightSettings *)self setWidthStretchFactor:0.5];
  [(SBDynamicFlashlightSettings *)self setPersistenceDelay:0.75];
  [(SBDynamicFlashlightSettings *)self setAutoDismissalDelay:2.0];
}

- (CGPoint)gestureScaling
{
  double gestureXScaling = self->_gestureXScaling;
  double gestureYScaling = self->_gestureYScaling;
  result.y = gestureYScaling;
  result.x = gestureXScaling;
  return result;
}

- (void)setGestureScaling:(CGPoint)a3
{
  *(CGPoint *)&self->_double gestureXScaling = a3;
}

+ (id)settingsControllerModule
{
  v59[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94168];
  v3 = [MEMORY[0x1E4F94140] rowWithTitle:@"Min Intensity" valueKeyPath:@"minimumIntensity"];
  objc_super v4 = [v3 between:0.0 and:0.25];
  v59[0] = v4;
  CAFrameRateRange v5 = [MEMORY[0x1E4F94140] rowWithTitle:@"Min HW Intensity" valueKeyPath:@"minimumHWIntensity"];
  v6 = [v5 between:0.0 and:0.25];
  v59[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
  v52 = [v2 sectionWithRows:v7 title:@"Intensity Response"];

  v8 = (void *)MEMORY[0x1E4F94168];
  v9 = [MEMORY[0x1E4FA5F08] _moduleWithSectionTitle:@"Animations"];
  v51 = [v8 submoduleWithModule:v9 childSettingsKeyPath:@"springAnimationSettings"];

  v10 = (void *)MEMORY[0x1E4F94168];
  v11 = [MEMORY[0x1E4F94140] rowWithTitle:@"Inertia Factor" valueKeyPath:@"inertiaFactor"];
  v12 = [v11 between:0.0 and:0.25];
  v58 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
  v50 = [v10 sectionWithRows:v13 title:@"More Animations"];

  v14 = (void *)MEMORY[0x1E4F94168];
  v15 = [MEMORY[0x1E4F94140] rowWithTitle:@"Overshoot Clamp %" valueKeyPath:@"overshootClampFactor"];
  v16 = [v15 between:0.0 and:0.1];
  v57[0] = v16;
  v17 = [MEMORY[0x1E4F94140] rowWithTitle:@"Width Stretch" valueKeyPath:@"widthStretchFactor"];
  v18 = [v17 between:0.0 and:1.0];
  v57[1] = v18;
  v19 = [MEMORY[0x1E4F94140] rowWithTitle:@"Height Stretch" valueKeyPath:@"heightStretchFactor"];
  v20 = [v19 between:0.0 and:1.0];
  v57[2] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:3];
  v49 = [v14 sectionWithRows:v21 title:@"Jindo Dynamics"];

  v22 = (void *)MEMORY[0x1E4F94168];
  v23 = [MEMORY[0x1E4F94140] rowWithTitle:@"Persistence Delay" valueKeyPath:@"persistenceDelay"];
  v24 = [v23 between:0.0 and:3.0];
  v56[0] = v24;
  v25 = [MEMORY[0x1E4F94140] rowWithTitle:@"Auto-Dismissal Delay" valueKeyPath:@"autoDismissalDelay"];
  v26 = [v25 between:0.0 and:4.0];
  v56[1] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
  v48 = [v22 sectionWithRows:v27 title:@"Timing"];

  v28 = (void *)MEMORY[0x1E4F94168];
  v47 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Gesture X Scaling" valueKeyPath:@"gestureXScaling"];
  v46 = [v47 minValue:100.0 maxValue:500.0];
  v55[0] = v46;
  v29 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Gesture Y Scaling" valueKeyPath:@"gestureYScaling"];
  v30 = [v29 minValue:100.0 maxValue:500.0];
  v55[1] = v30;
  v31 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Clamp %" valueKeyPath:@"gestureClampFactor"];
  v32 = [v31 minValue:0.0 maxValue:1.0];
  v55[2] = v32;
  v33 = [MEMORY[0x1E4F94140] rowWithTitle:@"Tap Time Limit" valueKeyPath:@"tapTimeThreshold"];
  v34 = [v33 between:0.001 and:0.25];
  v55[3] = v34;
  v35 = [MEMORY[0x1E4F94140] rowWithTitle:@"Tap Move Limit" valueKeyPath:@"tapMoveThreshold"];
  v36 = [v35 between:0.0 and:40.0];
  v55[4] = v36;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:5];
  v45 = [v28 sectionWithRows:v37 title:@"Gestures"];

  v38 = [MEMORY[0x1E4F94100] restoreDefaultSettingsButton];
  v39 = (void *)MEMORY[0x1E4F94168];
  v54 = v38;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
  v41 = [v39 sectionWithRows:v40];

  v53[0] = v52;
  v53[1] = v51;
  v53[2] = v50;
  v53[3] = v49;
  v53[4] = v45;
  v53[5] = v48;
  v53[6] = v41;
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:7];
  v43 = [MEMORY[0x1E4F94168] moduleWithTitle:@"Dynamic Flashlight" contents:v42];

  return v43;
}

- (double)minimumIntensity
{
  return self->_minimumIntensity;
}

- (void)setMinimumIntensity:(double)a3
{
  self->_minimumIntensity = a3;
}

- (double)minimumHWIntensity
{
  return self->_minimumHWIntensity;
}

- (void)setMinimumHWIntensity:(double)a3
{
  self->_minimumHWIntensity = a3;
}

- (double)gestureXScaling
{
  return self->_gestureXScaling;
}

- (void)setGestureXScaling:(double)a3
{
  self->_double gestureXScaling = a3;
}

- (double)gestureYScaling
{
  return self->_gestureYScaling;
}

- (void)setGestureYScaling:(double)a3
{
  self->_double gestureYScaling = a3;
}

- (double)gestureClampFactor
{
  return self->_gestureClampFactor;
}

- (void)setGestureClampFactor:(double)a3
{
  self->_gestureClampFactor = a3;
}

- (double)tapMoveThreshold
{
  return self->_tapMoveThreshold;
}

- (void)setTapMoveThreshold:(double)a3
{
  self->_tapMoveThreshold = a3;
}

- (double)tapTimeThreshold
{
  return self->_tapTimeThreshold;
}

- (void)setTapTimeThreshold:(double)a3
{
  self->_tapTimeThreshold = a3;
}

- (SBFFluidBehaviorSettings)springAnimationSettings
{
  return self->_springAnimationSettings;
}

- (void)setSpringAnimationSettings:(id)a3
{
}

- (double)inertiaFactor
{
  return self->_inertiaFactor;
}

- (void)setInertiaFactor:(double)a3
{
  self->_inertiaFactor = a3;
}

- (double)overshootClampFactor
{
  return self->_overshootClampFactor;
}

- (void)setOvershootClampFactor:(double)a3
{
  self->_overshootClampFactor = a3;
}

- (double)heightStretchFactor
{
  return self->_heightStretchFactor;
}

- (void)setHeightStretchFactor:(double)a3
{
  self->_heightStretchFactor = a3;
}

- (double)widthStretchFactor
{
  return self->_widthStretchFactor;
}

- (void)setWidthStretchFactor:(double)a3
{
  self->_widthStretchFactor = a3;
}

- (double)persistenceDelay
{
  return self->_persistenceDelay;
}

- (void)setPersistenceDelay:(double)a3
{
  self->_persistenceDelay = a3;
}

- (double)autoDismissalDelay
{
  return self->_autoDismissalDelay;
}

- (void)setAutoDismissalDelay:(double)a3
{
  self->_autoDismissalDelay = a3;
}

- (void).cxx_destruct
{
}

@end