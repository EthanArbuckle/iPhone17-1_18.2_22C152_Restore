@interface _UIMotionAnalyzerSettings
- (BOOL)directionalLockEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)jumpEnabled;
- (BOOL)playJumpSound;
- (BOOL)referenceShiftEnabled;
- (BOOL)showDirectionalLockIndicators;
- (BOOL)showIdleIndicator;
- (double)delayBeforeIdle;
- (double)directionalLockSharpness;
- (double)directionalLockStickiness;
- (double)directionalLockThreshold;
- (double)idleLeeway;
- (double)inputSmoothingFactor;
- (double)jumpThreshold;
- (double)referenceShiftDistanceDependence;
- (double)referenceShiftSpeed;
- (unint64_t)hash;
- (void)setDefaultValues;
- (void)setDelayBeforeIdle:(double)a3;
- (void)setDirectionalLockEnabled:(BOOL)a3;
- (void)setDirectionalLockSharpness:(double)a3;
- (void)setDirectionalLockStickiness:(double)a3;
- (void)setDirectionalLockThreshold:(double)a3;
- (void)setIdleLeeway:(double)a3;
- (void)setInputSmoothingFactor:(double)a3;
- (void)setJumpEnabled:(BOOL)a3;
- (void)setJumpThreshold:(double)a3;
- (void)setPlayJumpSound:(BOOL)a3;
- (void)setReferenceShiftDistanceDependence:(double)a3;
- (void)setReferenceShiftEnabled:(BOOL)a3;
- (void)setReferenceShiftSpeed:(double)a3;
- (void)setShowDirectionalLockIndicators:(BOOL)a3;
- (void)setShowIdleIndicator:(BOOL)a3;
@end

@implementation _UIMotionAnalyzerSettings

- (unint64_t)hash
{
  unint64_t v2 = vcvtmd_u64_f64(self->_inputSmoothingFactor * 100.0);
  if (self->_referenceShiftEnabled) {
    uint64_t v3 = 1231;
  }
  else {
    uint64_t v3 = 1237;
  }
  unint64_t v4 = vcvtmd_u64_f64(self->_referenceShiftSpeed * 100.0) - (v3 - v2 + 32 * v2) + 32 * (v3 - v2 + 32 * v2);
  unint64_t v5 = vcvtmd_u64_f64(self->_referenceShiftDistanceDependence * 100.0) - v4 + 32 * v4;
  unint64_t v6 = vcvtmd_u64_f64(self->_idleLeeway * 100.0) - v5 + 32 * v5;
  unint64_t v7 = vcvtmd_u64_f64(self->_delayBeforeIdle * 100.0) - v6 + 32 * v6;
  if (self->_showIdleIndicator) {
    uint64_t v8 = 1231;
  }
  else {
    uint64_t v8 = 1237;
  }
  uint64_t v9 = v8 - v7 + 32 * v7;
  if (self->_jumpEnabled) {
    uint64_t v10 = 1231;
  }
  else {
    uint64_t v10 = 1237;
  }
  unint64_t v11 = vcvtmd_u64_f64(self->_jumpThreshold * 100.0) - (v10 - v9 + 32 * v9) + 32 * (v10 - v9 + 32 * v9);
  if (self->_playJumpSound) {
    uint64_t v12 = 1231;
  }
  else {
    uint64_t v12 = 1237;
  }
  uint64_t v13 = v12 - v11 + 32 * v11;
  if (self->_directionalLockEnabled) {
    uint64_t v14 = 1231;
  }
  else {
    uint64_t v14 = 1237;
  }
  unint64_t v15 = vcvtmd_u64_f64(self->_directionalLockThreshold * 100.0) - (v14 - v13 + 32 * v13) + 32 * (v14 - v13 + 32 * v13);
  unint64_t v16 = vcvtmd_u64_f64(self->_directionalLockStickiness * 100.0) - v15 + 32 * v15;
  unint64_t v17 = vcvtmd_u64_f64(self->_directionalLockSharpness * 100.0) - v16 + 32 * v16;
  if (self->_showDirectionalLockIndicators) {
    uint64_t v18 = 1231;
  }
  else {
    uint64_t v18 = 1237;
  }
  return v18 - v17 + 32 * v17 + 0xDED414BE191DDDFLL;
}

- (double)directionalLockThreshold
{
  return self->_directionalLockThreshold;
}

- (BOOL)directionalLockEnabled
{
  return self->_directionalLockEnabled;
}

- (double)directionalLockStickiness
{
  return self->_directionalLockStickiness;
}

- (double)directionalLockSharpness
{
  return self->_directionalLockSharpness;
}

- (BOOL)referenceShiftEnabled
{
  return self->_referenceShiftEnabled;
}

- (BOOL)showIdleIndicator
{
  return self->_showIdleIndicator;
}

- (BOOL)showDirectionalLockIndicators
{
  return self->_showDirectionalLockIndicators;
}

- (double)referenceShiftSpeed
{
  return self->_referenceShiftSpeed;
}

- (double)referenceShiftDistanceDependence
{
  return self->_referenceShiftDistanceDependence;
}

- (BOOL)playJumpSound
{
  return self->_playJumpSound;
}

- (double)jumpThreshold
{
  return self->_jumpThreshold;
}

- (BOOL)jumpEnabled
{
  return self->_jumpEnabled;
}

- (double)inputSmoothingFactor
{
  return self->_inputSmoothingFactor;
}

- (double)idleLeeway
{
  return self->_idleLeeway;
}

- (double)delayBeforeIdle
{
  return self->_delayBeforeIdle;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)_UIMotionAnalyzerSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(_UIMotionAnalyzerSettings *)self setInputSmoothingFactor:0.0];
  [(_UIMotionAnalyzerSettings *)self setReferenceShiftEnabled:1];
  [(_UIMotionAnalyzerSettings *)self setReferenceShiftSpeed:0.3];
  [(_UIMotionAnalyzerSettings *)self setReferenceShiftDistanceDependence:0.5];
  [(_UIMotionAnalyzerSettings *)self setIdleLeeway:0.1];
  [(_UIMotionAnalyzerSettings *)self setDelayBeforeIdle:0.3];
  [(_UIMotionAnalyzerSettings *)self setShowIdleIndicator:0];
  [(_UIMotionAnalyzerSettings *)self setJumpEnabled:1];
  [(_UIMotionAnalyzerSettings *)self setJumpThreshold:0.5];
  [(_UIMotionAnalyzerSettings *)self setPlayJumpSound:0];
  [(_UIMotionAnalyzerSettings *)self setDirectionalLockEnabled:1];
  [(_UIMotionAnalyzerSettings *)self setDirectionalLockThreshold:0.3];
  [(_UIMotionAnalyzerSettings *)self setDirectionalLockStickiness:0.5];
  [(_UIMotionAnalyzerSettings *)self setDirectionalLockSharpness:0.1];
  [(_UIMotionAnalyzerSettings *)self setShowDirectionalLockIndicators:0];
}

- (void)setShowIdleIndicator:(BOOL)a3
{
  self->_showIdleIndicator = a3;
}

- (void)setShowDirectionalLockIndicators:(BOOL)a3
{
  self->_showDirectionalLockIndicators = a3;
}

- (void)setReferenceShiftSpeed:(double)a3
{
  self->_referenceShiftSpeed = a3;
}

- (void)setReferenceShiftEnabled:(BOOL)a3
{
  self->_referenceShiftEnabled = a3;
}

- (void)setReferenceShiftDistanceDependence:(double)a3
{
  self->_referenceShiftDistanceDependence = a3;
}

- (void)setPlayJumpSound:(BOOL)a3
{
  self->_playJumpSound = a3;
}

- (void)setJumpThreshold:(double)a3
{
  self->_jumpThreshold = a3;
}

- (void)setJumpEnabled:(BOOL)a3
{
  self->_jumpEnabled = a3;
}

- (void)setInputSmoothingFactor:(double)a3
{
  self->_inputSmoothingFactor = a3;
}

- (void)setIdleLeeway:(double)a3
{
  self->_idleLeeway = a3;
}

- (void)setDirectionalLockThreshold:(double)a3
{
  self->_directionalLockThreshold = a3;
}

- (void)setDirectionalLockStickiness:(double)a3
{
  self->_directionalLockStickiness = a3;
}

- (void)setDirectionalLockSharpness:(double)a3
{
  self->_directionalLockSharpness = a3;
}

- (void)setDirectionalLockEnabled:(BOOL)a3
{
  self->_directionalLockEnabled = a3;
}

- (void)setDelayBeforeIdle:(double)a3
{
  self->_delayBeforeIdle = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(_UIMotionAnalyzerSettings *)self inputSmoothingFactor];
    double v7 = v6;
    [v5 inputSmoothingFactor];
    if (v7 != v8) {
      goto LABEL_17;
    }
    int v9 = [(_UIMotionAnalyzerSettings *)self referenceShiftEnabled];
    if (v9 != [v5 referenceShiftEnabled]) {
      goto LABEL_17;
    }
    [(_UIMotionAnalyzerSettings *)self referenceShiftSpeed];
    double v11 = v10;
    [v5 referenceShiftSpeed];
    if (v11 != v12) {
      goto LABEL_17;
    }
    [(_UIMotionAnalyzerSettings *)self referenceShiftDistanceDependence];
    double v14 = v13;
    [v5 referenceShiftDistanceDependence];
    if (v14 != v15) {
      goto LABEL_17;
    }
    [(_UIMotionAnalyzerSettings *)self idleLeeway];
    double v17 = v16;
    [v5 idleLeeway];
    if (v17 != v18) {
      goto LABEL_17;
    }
    [(_UIMotionAnalyzerSettings *)self delayBeforeIdle];
    double v20 = v19;
    [v5 delayBeforeIdle];
    if (v20 != v21) {
      goto LABEL_17;
    }
    int v22 = [(_UIMotionAnalyzerSettings *)self showIdleIndicator];
    if (v22 != [v5 showIdleIndicator]) {
      goto LABEL_17;
    }
    int v23 = [(_UIMotionAnalyzerSettings *)self jumpEnabled];
    if (v23 != [v5 jumpEnabled]) {
      goto LABEL_17;
    }
    [(_UIMotionAnalyzerSettings *)self jumpThreshold];
    double v25 = v24;
    [v5 jumpThreshold];
    if (v25 != v26) {
      goto LABEL_17;
    }
    int v27 = [(_UIMotionAnalyzerSettings *)self playJumpSound];
    if (v27 != [v5 playJumpSound]) {
      goto LABEL_17;
    }
    int v28 = [(_UIMotionAnalyzerSettings *)self directionalLockEnabled];
    if (v28 == [v5 directionalLockEnabled]
      && ([(_UIMotionAnalyzerSettings *)self directionalLockThreshold],
          double v30 = v29,
          [v5 directionalLockThreshold],
          v30 == v31)
      && ([(_UIMotionAnalyzerSettings *)self directionalLockStickiness],
          double v33 = v32,
          [v5 directionalLockStickiness],
          v33 == v34))
    {
      [(_UIMotionAnalyzerSettings *)self directionalLockSharpness];
      double v36 = v35;
      [v5 directionalLockSharpness];
      BOOL v38 = v36 == v37;
    }
    else
    {
LABEL_17:
      BOOL v38 = 0;
    }
  }
  else
  {
    BOOL v38 = 0;
  }

  return v38;
}

@end