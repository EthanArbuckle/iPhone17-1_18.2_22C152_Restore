@interface SBScreenLongevitySettings
+ (id)settingsControllerModule;
- (BOOL)enablement;
- (BOOL)ignoreAutoLockSetToNever;
- (BOOL)noOpButLogOnEnablementUpdate;
- (BOOL)noisyLogging;
- (BOOL)overrideEnablement;
- (double)attentionScoreThreshold;
- (double)dimInterval;
- (double)dimmingAnimationLength;
- (double)faceDetectionScoreThreshold;
- (double)minimalFaceDetectionInterval;
- (double)touchAttentionLostTimeout;
- (double)undimFaceDetectionInterval;
- (double)undimmingAnimationLength;
- (double)waitInterval;
- (void)setAttentionScoreThreshold:(double)a3;
- (void)setDefaultValues;
- (void)setDimInterval:(double)a3;
- (void)setDimmingAnimationLength:(double)a3;
- (void)setEnablement:(BOOL)a3;
- (void)setFaceDetectionScoreThreshold:(double)a3;
- (void)setIgnoreAutoLockSetToNever:(BOOL)a3;
- (void)setMinimalFaceDetectionInterval:(double)a3;
- (void)setNoOpButLogOnEnablementUpdate:(BOOL)a3;
- (void)setNoisyLogging:(BOOL)a3;
- (void)setOverrideEnablement:(BOOL)a3;
- (void)setTouchAttentionLostTimeout:(double)a3;
- (void)setUndimFaceDetectionInterval:(double)a3;
- (void)setUndimmingAnimationLength:(double)a3;
- (void)setWaitInterval:(double)a3;
@end

@implementation SBScreenLongevitySettings

- (void)setDefaultValues
{
  v6.receiver = self;
  v6.super_class = (Class)SBScreenLongevitySettings;
  [(PTSettings *)&v6 setDefaultValues];
  v3 = +[SBDefaults localDefaults];
  v4 = [v3 screenLongevityDefaults];

  self->_ignoreAutoLockSetToNever = 0;
  self->_overrideEnablement = 0;
  self->_enablement = 0;
  [v4 dimInterval];
  self->_dimInterval = v5;
  self->_waitInterval = 60.0;
  self->_minimalFaceDetectionInterval = 4.0;
  self->_undimFaceDetectionInterval = 2.0;
  self->_touchAttentionLostTimeout = 2.0;
  self->_dimmingAnimationLength = 2.0;
  self->_undimmingAnimationLength = 0.5;
  self->_attentionScoreThreshold = 0.0;
  self->_faceDetectionScoreThreshold = 50.0;
  self->_noisyLogging = 0;
  self->_noOpButLogOnEnablementUpdate = 0;
}

+ (id)settingsControllerModule
{
  v65[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94100];
  v3 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v58 = [v2 rowWithTitle:@"Restore Defaults" action:v3];

  v4 = (void *)MEMORY[0x1E4F94168];
  v65[0] = v58;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:1];
  v54 = [v4 sectionWithRows:v5 title:@"Restore"];

  v57 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Ignore Auto Lock Set To Never" valueKeyPath:@"ignoreAutoLockSetToNever"];
  v56 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Override Enablement" valueKeyPath:@"overrideEnablement"];
  v55 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Enablement" valueKeyPath:@"enablement"];
  objc_super v6 = (void *)MEMORY[0x1E4F94168];
  v64[0] = v57;
  v64[1] = v56;
  v64[2] = v55;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:3];
  v53 = [v6 sectionWithRows:v7 title:@"Enablement Overrides"];

  v8 = [MEMORY[0x1E4F94140] rowWithTitle:@"Dim Duration" valueKeyPath:@"dimInterval"];
  v9 = [v8 between:0.0 and:600.0];
  v52 = [v9 precision:1];

  v10 = [MEMORY[0x1E4F94140] rowWithTitle:@"Wait Duration Before Face Detection Kicks In" valueKeyPath:@"waitInterval"];
  v11 = [v10 between:0.0 and:600.0];
  v51 = [v11 precision:1];

  v12 = [MEMORY[0x1E4F94140] rowWithTitle:@"Minimal Face Detection Time Interval" valueKeyPath:@"minimalFaceDetectionInterval"];
  v13 = [v12 between:0.0 and:60.0];
  v50 = [v13 precision:1];

  v14 = [MEMORY[0x1E4F94140] rowWithTitle:@"Undim Face Detection Time Interval" valueKeyPath:@"undimFaceDetectionInterval"];
  v15 = [v14 between:0.0 and:5.0];
  v49 = [v15 precision:1];

  v16 = [MEMORY[0x1E4F94140] rowWithTitle:@"Touch Attention Lost Timeout" valueKeyPath:@"touchAttentionLostTimeout"];
  v17 = [v16 between:0.0 and:60.0];
  v48 = [v17 precision:1];

  v18 = (void *)MEMORY[0x1E4F94168];
  v63[0] = v52;
  v63[1] = v51;
  v63[2] = v50;
  v63[3] = v49;
  v63[4] = v48;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:5];
  v47 = [v18 sectionWithRows:v19 title:@"Timer"];

  v20 = [MEMORY[0x1E4F94140] rowWithTitle:@"Dimming Animation Length" valueKeyPath:@"dimmingAnimationLength"];
  v21 = [v20 between:0.0 and:60.0];
  v46 = [v21 precision:3];

  v22 = [MEMORY[0x1E4F94140] rowWithTitle:@"Undimming Animation Length" valueKeyPath:@"undimmingAnimationLength"];
  v23 = [v22 between:0.0 and:60.0];
  v45 = [v23 precision:3];

  v24 = (void *)MEMORY[0x1E4F94168];
  v62[0] = v46;
  v62[1] = v45;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
  v44 = [v24 sectionWithRows:v25 title:@"Core Brightness"];

  v26 = [MEMORY[0x1E4F94140] rowWithTitle:@"Face Detection Score Threshold" valueKeyPath:@"faceDetectionScoreThreshold"];
  v27 = [v26 between:0.0 and:100.0];
  v43 = [v27 precision:1];

  v28 = [MEMORY[0x1E4F94140] rowWithTitle:@"Attention Score Threshold" valueKeyPath:@"attentionScoreThreshold"];
  v29 = [v28 between:0.0 and:100.0];
  v42 = [v29 precision:1];

  v30 = (void *)MEMORY[0x1E4F94168];
  v61[0] = v42;
  v61[1] = v43;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
  v32 = [v30 sectionWithRows:v31 title:@"Face Detection Score"];

  v33 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Noisy Logging" valueKeyPath:@"noisyLogging"];
  v34 = [MEMORY[0x1E4F941E8] rowWithTitle:@"No Op But Log When Enablement Update" valueKeyPath:@"noOpButLogOnEnablementUpdate"];
  v35 = (void *)MEMORY[0x1E4F94168];
  v60[0] = v33;
  v60[1] = v34;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
  v37 = [v35 sectionWithRows:v36 title:@"Debug"];

  v38 = (void *)MEMORY[0x1E4F94168];
  v59[0] = v54;
  v59[1] = v53;
  v59[2] = v47;
  v59[3] = v44;
  v59[4] = v32;
  v59[5] = v37;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:6];
  v40 = [v38 moduleWithTitle:@"Screen Longevity" contents:v39];

  return v40;
}

- (BOOL)ignoreAutoLockSetToNever
{
  return self->_ignoreAutoLockSetToNever;
}

- (void)setIgnoreAutoLockSetToNever:(BOOL)a3
{
  self->_ignoreAutoLockSetToNever = a3;
}

- (BOOL)overrideEnablement
{
  return self->_overrideEnablement;
}

- (void)setOverrideEnablement:(BOOL)a3
{
  self->_overrideEnablement = a3;
}

- (BOOL)enablement
{
  return self->_enablement;
}

- (void)setEnablement:(BOOL)a3
{
  self->_enablement = a3;
}

- (double)dimInterval
{
  return self->_dimInterval;
}

- (void)setDimInterval:(double)a3
{
  self->_dimInterval = a3;
}

- (double)waitInterval
{
  return self->_waitInterval;
}

- (void)setWaitInterval:(double)a3
{
  self->_waitInterval = a3;
}

- (double)minimalFaceDetectionInterval
{
  return self->_minimalFaceDetectionInterval;
}

- (void)setMinimalFaceDetectionInterval:(double)a3
{
  self->_minimalFaceDetectionInterval = a3;
}

- (double)undimFaceDetectionInterval
{
  return self->_undimFaceDetectionInterval;
}

- (void)setUndimFaceDetectionInterval:(double)a3
{
  self->_undimFaceDetectionInterval = a3;
}

- (double)touchAttentionLostTimeout
{
  return self->_touchAttentionLostTimeout;
}

- (void)setTouchAttentionLostTimeout:(double)a3
{
  self->_touchAttentionLostTimeout = a3;
}

- (double)dimmingAnimationLength
{
  return self->_dimmingAnimationLength;
}

- (void)setDimmingAnimationLength:(double)a3
{
  self->_dimmingAnimationLength = a3;
}

- (double)undimmingAnimationLength
{
  return self->_undimmingAnimationLength;
}

- (void)setUndimmingAnimationLength:(double)a3
{
  self->_undimmingAnimationLength = a3;
}

- (double)attentionScoreThreshold
{
  return self->_attentionScoreThreshold;
}

- (void)setAttentionScoreThreshold:(double)a3
{
  self->_attentionScoreThreshold = a3;
}

- (double)faceDetectionScoreThreshold
{
  return self->_faceDetectionScoreThreshold;
}

- (void)setFaceDetectionScoreThreshold:(double)a3
{
  self->_faceDetectionScoreThreshold = a3;
}

- (BOOL)noisyLogging
{
  return self->_noisyLogging;
}

- (void)setNoisyLogging:(BOOL)a3
{
  self->_noisyLogging = a3;
}

- (BOOL)noOpButLogOnEnablementUpdate
{
  return self->_noOpButLogOnEnablementUpdate;
}

- (void)setNoOpButLogOnEnablementUpdate:(BOOL)a3
{
  self->_noOpButLogOnEnablementUpdate = a3;
}

@end