@interface SBFTodayGestureSettings
+ (id)settingsControllerModule;
- (BOOL)scaleAnimationSettingsWithGestureVelocity;
- (SBFFluidBehaviorSettings)overlayBackdropSettings;
- (SBFFluidBehaviorSettings)overlayPositionSettings;
- (double)dampingRatioAtMaximumVelocity;
- (double)dampingRatioAtMinimumVelocity;
- (double)interactiveSideSpringFriction;
- (double)interactiveSideSpringTension;
- (double)maximumVelocity;
- (double)minimumVelocity;
- (double)responseAtMaximumVelocity;
- (double)responseAtMinimumVelocity;
- (double)sideSpringFriction;
- (double)sideSpringTension;
- (void)setDampingRatioAtMaximumVelocity:(double)a3;
- (void)setDampingRatioAtMinimumVelocity:(double)a3;
- (void)setDefaultValues;
- (void)setInteractiveSideSpringFriction:(double)a3;
- (void)setInteractiveSideSpringTension:(double)a3;
- (void)setMaximumVelocity:(double)a3;
- (void)setMinimumVelocity:(double)a3;
- (void)setOverlayBackdropSettings:(id)a3;
- (void)setOverlayPositionSettings:(id)a3;
- (void)setResponseAtMaximumVelocity:(double)a3;
- (void)setResponseAtMinimumVelocity:(double)a3;
- (void)setScaleAnimationSettingsWithGestureVelocity:(BOOL)a3;
- (void)setSideSpringFriction:(double)a3;
- (void)setSideSpringTension:(double)a3;
@end

@implementation SBFTodayGestureSettings

- (void)setDefaultValues
{
  v14.receiver = self;
  v14.super_class = (Class)SBFTodayGestureSettings;
  [(PTSettings *)&v14 setDefaultValues];
  [(SBFTodayGestureSettings *)self setSideSpringTension:195.0];
  [(SBFTodayGestureSettings *)self setSideSpringFriction:24.0];
  [(SBFTodayGestureSettings *)self setInteractiveSideSpringTension:1754.6];
  [(SBFTodayGestureSettings *)self setInteractiveSideSpringFriction:72.0];
  v3 = [(SBFTodayGestureSettings *)self overlayPositionSettings];
  [v3 setDefaultValues];

  v4 = [(SBFTodayGestureSettings *)self overlayPositionSettings];
  [v4 setDampingRatio:1.0];

  v5 = [(SBFTodayGestureSettings *)self overlayPositionSettings];
  [v5 setResponse:0.3];

  v6 = [(SBFTodayGestureSettings *)self overlayPositionSettings];
  [v6 setRetargetImpulse:0.018];

  v7 = [(SBFTodayGestureSettings *)self overlayPositionSettings];
  [v7 setTrackingDampingRatio:1.0];

  v8 = [(SBFTodayGestureSettings *)self overlayPositionSettings];
  [v8 setTrackingResponse:0.0];

  v9 = [(SBFTodayGestureSettings *)self overlayPositionSettings];
  CAFrameRateRange v15 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v9, "setFrameRateRange:highFrameRateReason:", 1114122, *(double *)&v15.minimum, *(double *)&v15.maximum, *(double *)&v15.preferred);

  v10 = [(SBFTodayGestureSettings *)self overlayBackdropSettings];
  [v10 setDefaultValues];

  v11 = [(SBFTodayGestureSettings *)self overlayBackdropSettings];
  [v11 setDampingRatio:1.0];

  v12 = [(SBFTodayGestureSettings *)self overlayBackdropSettings];
  [v12 setResponse:0.3];

  v13 = [(SBFTodayGestureSettings *)self overlayBackdropSettings];
  [v13 setRetargetImpulse:0.018];

  [(SBFTodayGestureSettings *)self setScaleAnimationSettingsWithGestureVelocity:1];
  [(SBFTodayGestureSettings *)self setMinimumVelocity:1000.0];
  [(SBFTodayGestureSettings *)self setMaximumVelocity:5000.0];
  [(SBFTodayGestureSettings *)self setDampingRatioAtMinimumVelocity:1.0];
  [(SBFTodayGestureSettings *)self setDampingRatioAtMaximumVelocity:0.9];
  [(SBFTodayGestureSettings *)self setResponseAtMinimumVelocity:0.3];
  [(SBFTodayGestureSettings *)self setResponseAtMaximumVelocity:0.42];
}

+ (id)settingsControllerModule
{
  v47[4] = *MEMORY[0x1E4F143B8];
  v40 = [MEMORY[0x1E4F94140] rowWithTitle:@"Tension" valueKeyPath:@"sideSpringTension"];
  v39 = [MEMORY[0x1E4F94140] rowWithTitle:@"Friction" valueKeyPath:@"sideSpringFriction"];
  v38 = [MEMORY[0x1E4F94140] rowWithTitle:@"Interactive Tension" valueKeyPath:@"interactiveSideSpringTension"];
  v37 = [MEMORY[0x1E4F94140] rowWithTitle:@"Interactive Friction" valueKeyPath:@"interactiveSideSpringFriction"];
  v2 = (void *)MEMORY[0x1E4F94168];
  v47[0] = v40;
  v47[1] = v39;
  v47[2] = v38;
  v47[3] = v37;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:4];
  v36 = [v2 sectionWithRows:v3 title:@"Sidebar"];

  v43 = [MEMORY[0x1E4F94138] rowWithTitle:@"Position Settings" childSettingsKeyPath:@"overlayPositionSettings"];
  v42 = [MEMORY[0x1E4F94138] rowWithTitle:@"Backdrop Settings" childSettingsKeyPath:@"overlayBackdropSettings"];
  v35 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Scale Animation Settings with Gesture Velocity" valueKeyPath:@"scaleAnimationSettingsWithGestureVelocity"];
  v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == YES", @"scaleAnimationSettingsWithGestureVelocity");
  v5 = [MEMORY[0x1E4F94140] rowWithTitle:@"minimumVelocity" valueKeyPath:@"minimumVelocity"];
  v6 = [v5 between:0.0 and:50000.0];
  v41 = [v6 condition:v4];

  v7 = [MEMORY[0x1E4F94140] rowWithTitle:@"maximumVelocity" valueKeyPath:@"maximumVelocity"];
  v8 = [v7 between:0.0 and:50000.0];
  v34 = [v8 condition:v4];

  v9 = [MEMORY[0x1E4F94140] rowWithTitle:@"dampingRatioAtMinimumVelocity" valueKeyPath:@"dampingRatioAtMinimumVelocity"];
  v10 = [v9 between:0.0 and:50000.0];
  v33 = [v10 condition:v4];

  v11 = [MEMORY[0x1E4F94140] rowWithTitle:@"dampingRatioAtMaximumVelocity" valueKeyPath:@"dampingRatioAtMaximumVelocity"];
  v12 = [v11 between:0.0 and:50000.0];
  v32 = [v12 condition:v4];

  v13 = [MEMORY[0x1E4F94140] rowWithTitle:@"responseAtMinimumVelocity" valueKeyPath:@"responseAtMinimumVelocity"];
  objc_super v14 = [v13 between:0.0 and:50000.0];
  v31 = [v14 condition:v4];

  CAFrameRateRange v15 = [MEMORY[0x1E4F94140] rowWithTitle:@"responseAtMaximumVelocity" valueKeyPath:@"responseAtMaximumVelocity"];
  v16 = [v15 between:0.0 and:50000.0];
  v17 = [v16 condition:v4];

  v18 = (void *)MEMORY[0x1E4F94168];
  v46[0] = v43;
  v46[1] = v42;
  v46[2] = v35;
  v46[3] = v41;
  v46[4] = v34;
  v46[5] = v33;
  v46[6] = v32;
  v46[7] = v31;
  v46[8] = v17;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:9];
  v20 = [v18 sectionWithRows:v19 title:@"Overlay"];

  v21 = (void *)MEMORY[0x1E4F94168];
  v22 = (void *)MEMORY[0x1E4F94100];
  v23 = [MEMORY[0x1E4F94178] action];
  v24 = [v22 rowWithTitle:@"Restore Defaults" action:v23];
  v45 = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
  v26 = [v21 sectionWithRows:v25];

  v27 = (void *)MEMORY[0x1E4F94168];
  v44[0] = v26;
  v44[1] = v36;
  v44[2] = v20;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
  v29 = [v27 moduleWithTitle:@"Home Scroll" contents:v28];

  return v29;
}

- (double)sideSpringTension
{
  return self->_sideSpringTension;
}

- (void)setSideSpringTension:(double)a3
{
  self->_sideSpringTension = a3;
}

- (double)sideSpringFriction
{
  return self->_sideSpringFriction;
}

- (void)setSideSpringFriction:(double)a3
{
  self->_sideSpringFriction = a3;
}

- (double)interactiveSideSpringTension
{
  return self->_interactiveSideSpringTension;
}

- (void)setInteractiveSideSpringTension:(double)a3
{
  self->_interactiveSideSpringTension = a3;
}

- (double)interactiveSideSpringFriction
{
  return self->_interactiveSideSpringFriction;
}

- (void)setInteractiveSideSpringFriction:(double)a3
{
  self->_interactiveSideSpringFriction = a3;
}

- (SBFFluidBehaviorSettings)overlayPositionSettings
{
  return self->_overlayPositionSettings;
}

- (void)setOverlayPositionSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)overlayBackdropSettings
{
  return self->_overlayBackdropSettings;
}

- (void)setOverlayBackdropSettings:(id)a3
{
}

- (BOOL)scaleAnimationSettingsWithGestureVelocity
{
  return self->_scaleAnimationSettingsWithGestureVelocity;
}

- (void)setScaleAnimationSettingsWithGestureVelocity:(BOOL)a3
{
  self->_scaleAnimationSettingsWithGestureVelocity = a3;
}

- (double)minimumVelocity
{
  return self->_minimumVelocity;
}

- (void)setMinimumVelocity:(double)a3
{
  self->_minimumVelocity = a3;
}

- (double)maximumVelocity
{
  return self->_maximumVelocity;
}

- (void)setMaximumVelocity:(double)a3
{
  self->_maximumVelocity = a3;
}

- (double)dampingRatioAtMinimumVelocity
{
  return self->_dampingRatioAtMinimumVelocity;
}

- (void)setDampingRatioAtMinimumVelocity:(double)a3
{
  self->_dampingRatioAtMinimumVelocity = a3;
}

- (double)dampingRatioAtMaximumVelocity
{
  return self->_dampingRatioAtMaximumVelocity;
}

- (void)setDampingRatioAtMaximumVelocity:(double)a3
{
  self->_dampingRatioAtMaximumVelocity = a3;
}

- (double)responseAtMinimumVelocity
{
  return self->_responseAtMinimumVelocity;
}

- (void)setResponseAtMinimumVelocity:(double)a3
{
  self->_responseAtMinimumVelocity = a3;
}

- (double)responseAtMaximumVelocity
{
  return self->_responseAtMaximumVelocity;
}

- (void)setResponseAtMaximumVelocity:(double)a3
{
  self->_responseAtMaximumVelocity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayBackdropSettings, 0);
  objc_storeStrong((id *)&self->_overlayPositionSettings, 0);
}

@end