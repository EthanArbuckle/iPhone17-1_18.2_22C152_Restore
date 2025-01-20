@interface _UIMotionAttitudeAnalyzer
- (BOOL)_isIdleGivenTimestamp:(double)a3;
- (BOOL)_shouldSuspendApplicationForHysteresisGivenNewViewerOffset:(UIOffset)a3 wasSuspendingApplicationForHysteresis:(BOOL)a4;
- (BOOL)applyHysteresisWithReceivedEventTimestamp:(double)a3 timeSinceLastNewMotionEvent:(double)a4 slowUpdatesEnabled:(BOOL)a5 returningShouldToggleSlowUpdates:(BOOL *)a6 logger:(id)a7;
- (UIOffset)_currentRawOffset:(_GLKQuaternion)a3;
- (_GLKQuaternion)_relativeQuaternion;
- (_UIMotionAttitudeAnalyzer)initWithSettings:(id)a3;
- (double)_directionLockStrength;
- (float)_referenceShiftRadiansPerSecondForAngle:(float)a3;
- (int64_t)_directionLockStatus;
- (void)_createDiagnosticsWindow;
- (void)_createDirectionLockIndicators;
- (void)_createIdleIndicator;
- (void)_resetDirectionalLockWithViewerOffset:(UIOffset)a3;
- (void)_shiftReferenceToYieldRelativeQuaternion:(_GLKQuaternion)a3;
- (void)_showIdleUI:(BOOL)a3;
- (void)_tearDownDiagnosticsWindow;
- (void)_tearDownDirectionLockIndicators;
- (void)_tearDownIdleIndicator;
- (void)_updateAcceleratedOutputRangeFixingOffset:(UIOffset)a3;
- (void)_updateDirectionalLockIndicators;
- (void)_updateIdleStateForRawOffset:(UIOffset)a3 timestamp:(double)a4;
- (void)_updateReferenceAttitude:(_GLKQuaternion)a3 timestamp:(double)a4;
- (void)_updateSettings;
- (void)_updateSmoothedOffsetForRawOffset:(UIOffset)a3;
- (void)dealloc;
- (void)reset;
- (void)resetHysteresis;
- (void)updateHistory;
- (void)updateWithEvent:(id)a3;
@end

@implementation _UIMotionAttitudeAnalyzer

- (void)_updateSettings
{
  v3 = [(_UIMotionAnalyzer *)self settings];
  [v3 inputSmoothingFactor];
  self->_smoothingDegree = v4 * 0.9;

  v5 = [(_UIMotionAnalyzer *)self settings];
  int v6 = [v5 referenceShiftEnabled];

  if (v6)
  {
    v7 = [(_UIMotionAnalyzer *)self settings];
    [v7 referenceShiftSpeed];
    self->_referenceShiftSpeed = v8 * 0.1;

    v9 = [(_UIMotionAnalyzer *)self settings];
    [v9 referenceShiftDistanceDependence];
    self->_distanceMultiplier = v10 * 10.0;
  }
  else
  {
    self->_distanceMultiplier = 0.0;
    self->_referenceShiftSpeed = 0.0;
  }
  v11 = [(_UIMotionAnalyzer *)self settings];
  if (([v11 referenceShiftEnabled] & 1) == 0)
  {

    goto LABEL_9;
  }
  v12 = [(_UIMotionAnalyzer *)self settings];
  int v13 = [v12 jumpEnabled];

  if (!v13)
  {
LABEL_9:
    self->_jumpThreshold = 3.40282347e38;
    goto LABEL_10;
  }
  v14 = [(_UIMotionAnalyzer *)self settings];
  [v14 jumpThreshold];
  self->_jumpThreshold = v15 * 1.57079633 + 1.57079633;

  v16 = [(_UIMotionAnalyzer *)self settings];
  char v17 = [v16 playJumpSound];

  if (v17)
  {
    v18 = +[UIDevice currentDevice];
    [v18 _registerForSystemSounds:self];
    goto LABEL_11;
  }
LABEL_10:
  v18 = +[UIDevice currentDevice];
  [v18 _unregisterForSystemSounds:self];
LABEL_11:

  v19 = [(_UIMotionAnalyzer *)self settings];
  [v19 idleLeeway];
  self->_idleLeeway = v20 * 0.1;

  v21 = [(_UIMotionAnalyzer *)self settings];
  [v21 delayBeforeIdle];
  self->_secondsBeforeIdle = v22 * 1.4 + 0.1;

  v23 = [(_UIMotionAnalyzer *)self settings];
  int v24 = [v23 showIdleIndicator];

  if (v24) {
    [(_UIMotionAttitudeAnalyzer *)self _createIdleIndicator];
  }
  else {
    [(_UIMotionAttitudeAnalyzer *)self _tearDownIdleIndicator];
  }
  v25 = [(_UIMotionAnalyzer *)self settings];
  if ([v25 directionalLockEnabled])
  {
    v26 = [(_UIMotionAnalyzer *)self settings];
    int v27 = [v26 showDirectionalLockIndicators];

    if (v27)
    {
      [(_UIMotionAttitudeAnalyzer *)self _createDirectionLockIndicators];
      return;
    }
  }
  else
  {
  }
  [(_UIMotionAttitudeAnalyzer *)self _tearDownDirectionLockIndicators];
  if ((v24 & 1) == 0)
  {
    [(_UIMotionAttitudeAnalyzer *)self _tearDownDiagnosticsWindow];
  }
}

- (void)updateWithEvent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v31 = v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v4 = v31;
    if (isKindOfClass)
    {
      [v31 attitude];
      v7.f32[0] = *(double *)v7.i64;
      float y = v8;
      float z = v10;
      *(float *)&double v12 = v12;
      LODWORD(self->_absoluteQuaternion.x) = v7.i32[0];
      self->_absoluteQuaternion.float y = y;
      self->_absoluteQuaternion.float z = z;
      self->_absoluteQuaternion.w = *(float *)&v12;
      if (!self->_hasReferenceQuaternion)
      {
        [(_UIMotionAttitudeAnalyzer *)self reset];
        self->_hasReferenceQuaternion = 1;
        v7.i32[0] = LODWORD(self->_absoluteQuaternion.x);
        float y = self->_absoluteQuaternion.y;
        float z = self->_absoluteQuaternion.z;
        *(float *)&double v12 = self->_absoluteQuaternion.w;
      }
      v6.i32[0] = LODWORD(self->_referenceQuaternion.x);
      double v13 = _RelativeQuaternionFromReference(v7, y, z, *(int32x2_t *)&v12, v6, self->_referenceQuaternion.y, self->_referenceQuaternion.z, self->_referenceQuaternion.w);
      int v14 = LODWORD(v13);
      int v16 = v15;
      int v18 = v17;
      int v20 = v19;
      -[_UIMotionAttitudeAnalyzer _currentRawOffset:](self, "_currentRawOffset:");
      double v22 = v21;
      double v24 = v23;
      -[_UIMotionAttitudeAnalyzer _updateSmoothedOffsetForRawOffset:](self, "_updateSmoothedOffsetForRawOffset:");
      [v31 timestamp];
      -[_UIMotionAttitudeAnalyzer _updateIdleStateForRawOffset:timestamp:](self, "_updateIdleStateForRawOffset:timestamp:", v22, v24, v25);
      [v31 timestamp];
      double v27 = v26;
      LODWORD(v26) = v14;
      LODWORD(v28) = v16;
      LODWORD(v29) = v18;
      LODWORD(v30) = v20;
      -[_UIMotionAttitudeAnalyzer _updateReferenceAttitude:timestamp:](self, "_updateReferenceAttitude:timestamp:", v26, v28, v29, v30, v27);
      id v4 = v31;
    }
  }
}

- (BOOL)applyHysteresisWithReceivedEventTimestamp:(double)a3 timeSinceLastNewMotionEvent:(double)a4 slowUpdatesEnabled:(BOOL)a5 returningShouldToggleSlowUpdates:(BOOL *)a6 logger:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  if (!self->_hasHistory)
  {
    BOOL v19 = 0;
    goto LABEL_27;
  }
  double v13 = [(_UIMotionAnalyzer *)self viewerRelativeDevicePose];
  [v13 viewerOffset];
  double v15 = v14;
  double v17 = v16;

  BOOL v18 = v8
     && -[_UIMotionAttitudeAnalyzer _shouldSuspendApplicationForHysteresisGivenNewViewerOffset:wasSuspendingApplicationForHysteresis:](self, "_shouldSuspendApplicationForHysteresisGivenNewViewerOffset:wasSuspendingApplicationForHysteresis:", self->_isApplyingHysteresis, v15, v17);
  double v20 = sqrt((self->_lastAppliedViewerOffset.horizontal - v15) * (self->_lastAppliedViewerOffset.horizontal - v15)+ (self->_lastAppliedViewerOffset.vertical - v17) * (self->_lastAppliedViewerOffset.vertical - v17));
  if (!v18)
  {
    int v21 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_UIMotionEffectAccumulationThreshold, @"UIMotionEffectAccumulationThreshold");
    double v24 = *(double *)&qword_1E8FD5368;
    HIDWORD(v25) = 1066317905;
    if (v21) {
      double v24 = 0.015;
    }
    BOOL v19 = v20 < v24;
    if (self->_isApplyingHysteresis)
    {
      self->_isApplyingHysteresis = 0;
      *(float *)&double v24 = self->_relativeQuaternionOnHysteresisEntry.x;
      *(float *)&double v25 = self->_relativeQuaternionOnHysteresisEntry.y;
      *(float *)&double v22 = self->_relativeQuaternionOnHysteresisEntry.z;
      *(float *)&double v23 = self->_relativeQuaternionOnHysteresisEntry.w;
      if (a6 && v8) {
        *a6 = 1;
      }
    }
    else
    {
      int v26 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257720, @"UIMotionEffectOldEventTimeInterval");
      double v27 = *(double *)&qword_1EB257728;
      if (v26) {
        double v27 = 0.25;
      }
      if (v27 > a4) {
        goto LABEL_21;
      }
      int v28 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257730, @"UIMotionEffectOldEventSuppressionThreshold");
      double v24 = *(double *)&qword_1EB257738;
      HIDWORD(v25) = 1066695393;
      if (v28) {
        double v24 = 0.02;
      }
      if (v20 < v24) {
        goto LABEL_21;
      }
      *(float *)&double v24 = self->_lastAppliedRelativeQuaternion.x;
      *(float *)&double v25 = self->_lastAppliedRelativeQuaternion.y;
      *(float *)&double v22 = self->_lastAppliedRelativeQuaternion.z;
      *(float *)&double v23 = self->_lastAppliedRelativeQuaternion.w;
    }
    -[_UIMotionAttitudeAnalyzer _shiftReferenceToYieldRelativeQuaternion:](self, "_shiftReferenceToYieldRelativeQuaternion:", v24, v25, v22, v23);
    goto LABEL_27;
  }
  BOOL v19 = 1;
  if (!self->_isApplyingHysteresis)
  {
    self->_isApplyingHysteresis = 1;
    self->_relativeQuaternionOnHysteresisEntrfloat y = self->_lastAppliedRelativeQuaternion;
  }
LABEL_21:
  if (a3 > 0.0 && v12 && ![(id)UIApp applicationState]) {
    [v12 recordMotionMagnitude:v20 atTimestamp:a3];
  }
LABEL_27:

  return v19;
}

- (void)_updateSmoothedOffsetForRawOffset:(UIOffset)a3
{
  double vertical = a3.vertical;
  double horizontal = a3.horizontal;
  float32x4_t v6 = [(_UIMotionAnalyzer *)self viewerRelativeDevicePose];
  [v6 viewerOffset];
  double v8 = v7;
  double v10 = v9;

  v11 = [(_UIMotionAnalyzer *)self settings];
  int v12 = [v11 directionalLockEnabled];

  if (v12)
  {
    double v13 = [(_UIMotionAnalyzer *)self settings];
    [v13 directionalLockStickiness];
    double v15 = v14 * 0.05 + 0.95;

    self->_double lockValue = vabdd_f64(v8, horizontal) + v15 * self->_lockValue - vabdd_f64(v10, vertical);
    double v16 = [(_UIMotionAnalyzer *)self settings];
    [v16 directionalLockThreshold];
    double v18 = v17;

    BOOL v19 = [(_UIMotionAnalyzer *)self settings];
    [v19 directionalLockSharpness];
    double v21 = v20;

    double v22 = fmin((fabs(self->_lockValue) - v18) / v18 / (1.0 - v21 + 0.00000011920929), 1.0);
    if (v22 < 0.0) {
      double v22 = 0.0;
    }
    self->_lockStrength = v22;
    double lockValue = self->_lockValue;
    if (lockValue <= v18)
    {
      if (lockValue < -v18) {
        double horizontal = v8 * v22 + horizontal * (1.0 - v22);
      }
    }
    else
    {
      double vertical = v10 * v22 + vertical * (1.0 - v22);
    }
    [(_UIMotionAttitudeAnalyzer *)self _updateDirectionalLockIndicators];
  }
  double smoothingDegree = self->_smoothingDegree;
  double v25 = v8 * smoothingDegree + horizontal * (1.0 - smoothingDegree);
  double v26 = v10 * smoothingDegree + vertical * (1.0 - smoothingDegree);
  double v27 = [(_UIMotionAnalyzer *)self viewerRelativeDevicePose];
  objc_msgSend(v27, "setViewerOffset:", v25, v26);

  -[_UIMotionAttitudeAnalyzer _updateAcceleratedOutputRangeFixingOffset:](self, "_updateAcceleratedOutputRangeFixingOffset:", v25, v26);
}

- (int64_t)_directionLockStatus
{
  v3 = [(_UIMotionAnalyzer *)self settings];
  [v3 directionalLockThreshold];
  double v5 = v4;

  double lockValue = self->_lockValue;
  if (lockValue > v5) {
    return 1;
  }
  else {
    return 2 * (lockValue < -v5);
  }
}

- (void)_updateIdleStateForRawOffset:(UIOffset)a3 timestamp:(double)a4
{
  idleLeewafloat y = self->_idleLeeway;
  if (vabdd_f64(a3.horizontal, self->_idleStartOffset.horizontal) > idleLeeway
    || vabdd_f64(a3.vertical, self->_idleStartOffset.vertical) > idleLeeway)
  {
    self->_idleStartTime = a4;
  }
  self->_idleStartOffset = a3;
  BOOL v6 = [(_UIMotionAttitudeAnalyzer *)self _isIdleGivenTimestamp:a4];
  [(_UIMotionAttitudeAnalyzer *)self _showIdleUI:v6];
}

- (void)_updateReferenceAttitude:(_GLKQuaternion)a3 timestamp:(double)a4
{
  double v8 = v7;
  float v10 = (float)(v4 + (float)((float)(*(float *)&a4 * 0.0) + (float)(v6 * 0.0))) - (float)(v5 * 0.0);
  float v11 = (float)((float)(v5 * 0.0) + (float)((float)(v4 * 0.0) + (float)(v6 * 0.0))) - *(float *)&a4;
  float v12 = (float)((float)(*(float *)&a4 * 0.0) + (float)(v6 + (float)(v5 * 0.0))) - (float)(v4 * 0.0);
  float v13 = (float)((float)((float)(v6 * 0.0) - (float)(*(float *)&a4 * 0.0)) - (float)(v4 * 0.0)) - v5;
  *((float *)&a4 + 1) = v4;
  unint64_t v14 = __PAIR64__(LODWORD(v6), LODWORD(v5));
  float32x4_t v15 = vmulq_f32(*(float32x4_t *)&a4, *(float32x4_t *)&a4);
  v15.i64[0] = vpaddq_f32(v15, v15).u64[0];
  float32x4_t v16 = (float32x4_t)veorq_s8((int8x16_t)vmulq_n_f32(*(float32x4_t *)&a4, 1.0 / vpadd_f32(*(float32x2_t *)v15.f32, *(float32x2_t *)v15.f32).f32[0]), (int8x16_t)xmmword_186B9B120);
  v15.f32[0] = (float)(vmuls_lane_f32(v11, v16, 2) + (float)((float)(v13 * v16.f32[0]) + vmuls_lane_f32(v10, v16, 3)))
             - vmuls_lane_f32(v12, *(float32x2_t *)v16.f32, 1);
  float v17 = (float)((float)(v12 * v16.f32[0])
              + (float)(vmuls_lane_f32(v13, *(float32x2_t *)v16.f32, 1) + vmuls_lane_f32(v11, v16, 3)))
      - vmuls_lane_f32(v10, v16, 2);
  v16.f32[0] = (float)(vmuls_lane_f32(v10, *(float32x2_t *)v16.f32, 1)
                     + (float)(vmuls_lane_f32(v13, v16, 2) + vmuls_lane_f32(v12, v16, 3)))
             - (float)(v11 * v16.f32[0]);
  float v18 = 1.0 / sqrtf((float)(v16.f32[0] * v16.f32[0]) + (float)((float)(v15.f32[0] * v15.f32[0]) + (float)(v17 * v17)));
  float v19 = v15.f32[0] * v18;
  float v20 = v17 * v18;
  float v21 = v16.f32[0] * v18;
  float v22 = acosf(v16.f32[0] * v18);
  float v23 = (float)(v21 * 0.0) - v20;
  float v24 = v19 - (float)(v21 * 0.0);
  float v25 = (float)(v20 * 0.0) - (float)(v19 * 0.0);
  float v26 = sqrtf((float)(v25 * v25) + (float)((float)(v23 * v23) + (float)(v24 * v24)));
  if (v26 <= 0.00000011921)
  {
    if ([(_UIMotionAttitudeAnalyzer *)self _isIdleGivenTimestamp:v8]) {
      self->_referenceQuaternion = self->_absoluteQuaternion;
    }
  }
  else
  {
    float v27 = 1.0 / v26;
    float v28 = v23 * v27;
    float v29 = v24 * v27;
    float v30 = v25 * v27;
    if ([(_UIMotionAttitudeAnalyzer *)self _isIdleGivenTimestamp:v8]
      && self->_jumpThreshold < v22)
    {
      float v31 = v22 + -1.57079633 + v22 + -1.57079633;
      __float2 v32 = __sincosf_stret(v31 * 0.5);
      v33.f32[0] = v32.__sinval * v28;
      v33.f32[1] = v32.__sinval * v29;
      v33.f32[2] = v32.__sinval * v30;
      v33.i32[3] = LODWORD(v32.__cosval);
      float32x4_t v34 = vmulq_f32(v33, v33);
      v34.i64[0] = vpaddq_f32(v34, v34).u64[0];
      float32x4_t v35 = vmulq_n_f32(v33, 1.0 / sqrtf(vpadd_f32(*(float32x2_t *)v34.f32, *(float32x2_t *)v34.f32).f32[0]));
      v36.i32[0] = LODWORD(self->_referenceQuaternion.x);
      v33.i64[0] = *(void *)&self->_referenceQuaternion.q[1];
      float32x4_t v37 = vmulq_n_f32(v35, self->_referenceQuaternion.w);
      float32x4_t v38 = (float32x4_t)vextq_s8(vextq_s8(v36, v36, 4uLL), (int8x16_t)v33, 0xCuLL);
      v38.i32[3] = v38.i32[0];
      float32x4_t v39 = vmulq_f32(v38, (float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v35, 3), (int8x16_t)v35, 4uLL));
      float32x4_t v40 = vaddq_f32(v37, v39);
      float32x4_t v41 = vsubq_f32(v37, v39);
      int32x4_t v42 = vuzp2q_s32((int32x4_t)v33, vzip1q_s32((int32x4_t)v33, (int32x4_t)v33));
      float32x4_t v43 = (float32x4_t)v42;
      v43.i32[1] = v36.i32[0];
      v43.i32[3] = v42.i32[2];
      float32x4_t v44 = v35;
      v44.i32[3] = v35.i32[1];
      float32x4_t v45 = vmulq_f32(v43, v44);
      float32x4_t v46 = vaddq_f32(v40, (float32x4_t)vuzp2q_s32((int32x4_t)vextq_s8((int8x16_t)v45, (int8x16_t)v45, 4uLL), (int32x4_t)v45));
      v46.i32[3] = vsubq_f32(v41, v45).i32[3];
      v41.i64[0] = v33.i64[0];
      v41.i64[1] = __PAIR64__(v33.u32[1], v36.u32[0]);
      v35.i32[3] = v35.i32[2];
      int32x4_t v47 = (int32x4_t)vmulq_f32(v41, v35);
      self->_referenceQuaternion = (_GLKQuaternion)vsubq_f32(v46, (float32x4_t)vzip2q_s32(vzip1q_s32(v47, (int32x4_t)vextq_s8((int8x16_t)v47, (int8x16_t)v47, 0xCuLL)), v47));
      float v22 = v22 - v31;
    }
    double v48 = v22;
    if (v22 >= 1.57079633)
    {
      float v22 = 3.14159265 - v48;
      float v28 = -v28;
      float v29 = -v29;
      float v30 = -v30;
      double v48 = v22;
    }
    double lastUpdate = self->_lastUpdate;
    double v50 = v8 - lastUpdate;
    *(float *)&double lastUpdate = v22;
    [(_UIMotionAttitudeAnalyzer *)self _referenceShiftRadiansPerSecondForAngle:lastUpdate];
    double v52 = v50 * v51;
    if (v52 <= v48)
    {
      float v53 = v52;
      float v54 = v53;
    }
    else
    {
      float v54 = v22;
    }
    __float2 v55 = __sincosf_stret(v54 * 0.5);
    v56.f32[0] = v28 * v55.__sinval;
    v56.f32[1] = v29 * v55.__sinval;
    v56.f32[2] = v30 * v55.__sinval;
    v56.i32[3] = LODWORD(v55.__cosval);
    float32x4_t v57 = vmulq_f32(v56, v56);
    v57.i64[0] = vpaddq_f32(v57, v57).u64[0];
    float32x4_t v58 = vmulq_n_f32(v56, 1.0 / sqrtf(vpadd_f32(*(float32x2_t *)v57.f32, *(float32x2_t *)v57.f32).f32[0]));
    v59.i32[0] = LODWORD(self->_referenceQuaternion.x);
    v56.i64[0] = *(void *)&self->_referenceQuaternion.q[1];
    float32x4_t v60 = vmulq_n_f32(v58, self->_referenceQuaternion.w);
    float32x4_t v61 = (float32x4_t)vextq_s8(vextq_s8(v59, v59, 4uLL), (int8x16_t)v56, 0xCuLL);
    v61.i32[3] = v61.i32[0];
    float32x4_t v62 = vmulq_f32(v61, (float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v58, 3), (int8x16_t)v58, 4uLL));
    int32x4_t v63 = vuzp2q_s32((int32x4_t)v56, vzip1q_s32((int32x4_t)v56, (int32x4_t)v56));
    float32x4_t v64 = (float32x4_t)v63;
    v64.i32[1] = v59.i32[0];
    v64.i32[3] = v63.i32[2];
    float32x4_t v65 = vaddq_f32(v60, v62);
    float32x4_t v66 = vsubq_f32(v60, v62);
    float32x4_t v67 = v58;
    v67.i32[3] = v58.i32[1];
    float32x4_t v68 = vmulq_f32(v64, v67);
    float32x4_t v69 = vaddq_f32(v65, (float32x4_t)vuzp2q_s32((int32x4_t)vextq_s8((int8x16_t)v68, (int8x16_t)v68, 4uLL), (int32x4_t)v68));
    v69.i32[3] = vsubq_f32(v66, v68).i32[3];
    v66.i64[0] = v56.i64[0];
    v66.i64[1] = __PAIR64__(v56.u32[1], v59.u32[0]);
    v58.i32[3] = v58.i32[2];
    int32x4_t v70 = (int32x4_t)vmulq_f32(v66, v58);
    self->_referenceQuaternion = (_GLKQuaternion)vsubq_f32(v69, (float32x4_t)vzip2q_s32(vzip1q_s32(v70, (int32x4_t)vextq_s8((int8x16_t)v70, (int8x16_t)v70, 0xCuLL)), v70));
  }
  self->_double lastUpdate = v8;
}

- (BOOL)_isIdleGivenTimestamp:(double)a3
{
  return a3 - self->_idleStartTime > self->_secondsBeforeIdle;
}

- (void)_updateDirectionalLockIndicators
{
  int64_t v3 = [(_UIMotionAttitudeAnalyzer *)self _directionLockStatus];
  if (v3 == 2)
  {
    [(UIView *)self->_verticalLockIndicator setHidden:0];
    verticalLockIndicator = self->_verticalLockIndicator;
    float v7 = self->_lockStrength * 25.0;
    double v8 = ceilf(v7);
    [(UIView *)verticalLockIndicator bounds];
    -[UIView setBounds:](verticalLockIndicator, "setBounds:", 0.0, 0.0, v8);
    float v5 = &OBJC_IVAR____UIMotionAttitudeAnalyzer__horizontalLockIndicator;
  }
  else if (v3 == 1)
  {
    [(UIView *)self->_horizontalLockIndicator setHidden:0];
    horizontalLockIndicator = self->_horizontalLockIndicator;
    [(UIView *)horizontalLockIndicator bounds];
    -[UIView setBounds:](horizontalLockIndicator, "setBounds:", 0.0, 0.0);
    float v5 = &OBJC_IVAR____UIMotionAttitudeAnalyzer__verticalLockIndicator;
  }
  else
  {
    float v5 = &OBJC_IVAR____UIMotionAttitudeAnalyzer__verticalLockIndicator;
    [(UIView *)self->_horizontalLockIndicator setHidden:1];
  }
  double v9 = *(Class *)((char *)&self->super.super.isa + *v5);
  [v9 setHidden:1];
}

- (void)_updateAcceleratedOutputRangeFixingOffset:(UIOffset)a3
{
  double vertical = a3.vertical;
  double horizontal = a3.horizontal;
  int64_t v6 = [(_UIMotionAttitudeAnalyzer *)self _directionLockStatus];
  if (v6 == 2)
  {
    double v9 = 0.0;
    double v8 = 1.0;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DAD8];
    if (v6 == 1) {
      double v8 = 0.0;
    }
    else {
      double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
    if (v6 == 1) {
      double v9 = 1.0;
    }
    else {
      double v9 = *MEMORY[0x1E4F1DAD8];
    }
  }
  id v10 = [(_UIMotionAnalyzer *)self viewerRelativeDevicePose];
  objc_msgSend(v10, "_setAcceleration:fixingOutputForViewerOffset:", v9, v8, horizontal, vertical);
}

- (void)_showIdleUI:(BOOL)a3
{
}

- (UIOffset)_currentRawOffset:(_GLKQuaternion)a3
{
  float v7 = (float)(v5 * 0.0) + (float)(v6 * 0.0);
  v3.f32[1] = v4;
  v3.i64[1] = __PAIR64__(LODWORD(v6), LODWORD(v5));
  float32x4_t v8 = vmulq_f32(v3, v3);
  v8.i64[0] = vpaddq_f32(v8, v8).u64[0];
  float32x4_t v9 = (float32x4_t)veorq_s8((int8x16_t)vmulq_n_f32(v3, 1.0 / vpadd_f32(*(float32x2_t *)v8.f32, *(float32x2_t *)v8.f32).f32[0]), (int8x16_t)xmmword_186B9B120);
  float v10 = (float)(vmuls_lane_f32((float)((float)(v4 * 0.0) + (float)((float)(v3.f32[0] * 0.0) + (float)(v6 * 0.0))) - v5, *(float32x2_t *)v9.f32, 1)+ (float)(vmuls_lane_f32((float)((float)((float)(v6 * 0.0) - (float)(v3.f32[0] * 0.0)) - v4) - (float)(v5 * 0.0), v9, 2)+ vmuls_lane_f32((float)(v3.f32[0] + v7) - (float)(v4 * 0.0), v9, 3)))- (float)((float)((float)((float)(v5 * 0.0) + (float)(v6 + (float)(v4 * 0.0))) - (float)(v3.f32[0] * 0.0))* v9.f32[0]);
  double v11 = acosf((float)(vmuls_lane_f32((float)((float)(v4 * 0.0) + (float)(v6 + (float)(v3.f32[0] * 0.0))) - (float)(v5 * 0.0), *(float32x2_t *)v9.f32, 1)+ (float)(vmuls_lane_f32((float)((float)((float)(v6 * 0.0) - v3.f32[0]) - (float)(v4 * 0.0)) - (float)(v5 * 0.0), v9, 2)+ vmuls_lane_f32((float)((float)(v3.f32[0] * 0.0) + v7) - v4, v9, 3)))- (float)((float)((float)(v5 + (float)((float)(v4 * 0.0) + (float)(v6 * 0.0))) - (float)(v3.f32[0] * 0.0))* v9.f32[0]))/ 1.57079633+ -1.0;
  double v12 = -(acosf(v10) / 1.57079633 + -1.0);
  double v13 = v11;
  result.double vertical = v12;
  result.double horizontal = v13;
  return result;
}

- (float)_referenceShiftRadiansPerSecondForAngle:(float)a3
{
  float v3 = a3 / 3.14159265;
  return self->_referenceShiftSpeed + self->_referenceShiftSpeed * self->_distanceMultiplier * v3;
}

- (void)dealloc
{
  float v3 = [(_UIMotionAnalyzer *)self settings];
  [v3 removeKeyObserver:self];

  [(_UIMotionAttitudeAnalyzer *)self _tearDownDiagnosticsWindow];
  [(_UIMotionAttitudeAnalyzer *)self _tearDownDirectionLockIndicators];
  [(_UIMotionAttitudeAnalyzer *)self _tearDownIdleIndicator];
  float v4 = +[UIDevice currentDevice];
  [v4 _unregisterForSystemSounds:self];

  v5.receiver = self;
  v5.super_class = (Class)_UIMotionAttitudeAnalyzer;
  [(_UIMotionAttitudeAnalyzer *)&v5 dealloc];
}

- (void)_tearDownIdleIndicator
{
  [(UIView *)self->_idleIndicator removeFromSuperview];
  idleIndicator = self->_idleIndicator;
  self->_idleIndicator = 0;
}

- (void)_tearDownDirectionLockIndicators
{
  [(UIView *)self->_horizontalLockIndicator removeFromSuperview];
  horizontalLockIndicator = self->_horizontalLockIndicator;
  self->_horizontalLockIndicator = 0;

  [(UIView *)self->_verticalLockIndicator removeFromSuperview];
  verticalLockIndicator = self->_verticalLockIndicator;
  self->_verticalLockIndicator = 0;
}

- (void)_tearDownDiagnosticsWindow
{
  [(UIWindow *)self->_diagnosticsWindow setHidden:1];
  diagnosticsWindow = self->_diagnosticsWindow;
  self->_diagnosticsWindow = 0;
}

- (void)resetHysteresis
{
  if (self->_hasHistory) {
    self->_isApplyingHysteresis = 0;
  }
}

- (void)updateHistory
{
  if (!self->_hasHistory)
  {
    self->_hasHistorfloat y = 1;
    self->_isApplyingHysteresis = 0;
    self->_relativeQuaternionOnHysteresisEntrfloat y = (_GLKQuaternion)xmmword_186B975F0;
  }
  p_lastAppliedViewerOffset = &self->_lastAppliedViewerOffset;
  float v4 = [(_UIMotionAnalyzer *)self viewerRelativeDevicePose];
  [v4 viewerOffset];
  p_lastAppliedViewerOffset->double horizontal = v5;
  self->_lastAppliedViewerOffset.double vertical = v6;

  [(_UIMotionAttitudeAnalyzer *)self _relativeQuaternion];
  self->_lastAppliedRelativeQuaternion.x = v7;
  self->_lastAppliedRelativeQuaternion.float y = v8;
  self->_lastAppliedRelativeQuaternion.float z = v9;
  self->_lastAppliedRelativeQuaternion.w = v10;
}

- (_GLKQuaternion)_relativeQuaternion
{
  v2.i32[0] = LODWORD(self->_absoluteQuaternion.x);
  v3.i32[0] = LODWORD(self->_absoluteQuaternion.w);
  v4.i32[0] = LODWORD(self->_referenceQuaternion.x);
  _RelativeQuaternionFromReference(v2, self->_absoluteQuaternion.y, self->_absoluteQuaternion.z, v3, v4, self->_referenceQuaternion.y, self->_referenceQuaternion.z, self->_referenceQuaternion.w);
  *(void *)&result.q[2] = v6;
  *(void *)&result.x = v5;
  return result;
}

- (void)reset
{
  self->_referenceQuaternion = self->_absoluteQuaternion;
  -[_UIMotionAttitudeAnalyzer _resetDirectionalLockWithViewerOffset:](self, "_resetDirectionalLockWithViewerOffset:", 0.0, 0.0);
  int32x2_t v3 = [(_UIMotionAnalyzer *)self viewerRelativeDevicePose];
  [v3 _reset];

  self->_idleStartTime = 1.79769313e308;
}

- (void)_resetDirectionalLockWithViewerOffset:(UIOffset)a3
{
  double vertical = a3.vertical;
  double horizontal = a3.horizontal;
  self->_double lockValue = 0.0;
  self->_lockStrength = 0.0;
  id v5 = [(_UIMotionAnalyzer *)self viewerRelativeDevicePose];
  objc_msgSend(v5, "_setAcceleration:fixingOutputForViewerOffset:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), horizontal, vertical);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalLockIndicator, 0);
  objc_storeStrong((id *)&self->_horizontalLockIndicator, 0);
  objc_storeStrong((id *)&self->_idleIndicator, 0);
  objc_storeStrong((id *)&self->_diagnosticsWindow, 0);
}

- (_UIMotionAttitudeAnalyzer)initWithSettings:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIMotionAttitudeAnalyzer;
  int32x2_t v3 = [(_UIMotionAnalyzer *)&v7 initWithSettings:a3];
  if (v3)
  {
    v3->_double lastUpdate = CFAbsoluteTimeGetCurrent();
    v3->_absoluteQuaternion = (_GLKQuaternion)xmmword_186B975F0;
    float32x4_t v4 = [(_UIMotionAnalyzer *)v3 settings];
    [v4 addKeyObserver:v3];

    [(_UIMotionAttitudeAnalyzer *)v3 _updateSettings];
    id v5 = v3;
  }

  return v3;
}

- (void)_shiftReferenceToYieldRelativeQuaternion:(_GLKQuaternion)a3
{
  double v30 = v6;
  double v31 = *(double *)v5.i64;
  double v32 = v4;
  double v33 = v3;
  v8.i64[0] = __PAIR64__(LODWORD(v4), LODWORD(v3));
  v8.i64[1] = __PAIR64__(LODWORD(v6), v5.u32[0]);
  float32x4_t v9 = vmulq_f32(v8, v8);
  v9.i64[0] = vpaddq_f32(v9, v9).u64[0];
  int8x16_t v10 = (int8x16_t)vmulq_n_f32(v8, 1.0 / vpadd_f32(*(float32x2_t *)v9.f32, *(float32x2_t *)v9.f32).f32[0]);
  int8x16_t v11 = (int8x16_t)xmmword_186B9B120;
  float32x4_t v12 = (float32x4_t)veorq_s8(v10, (int8x16_t)xmmword_186B9B120);
  v11.i32[0] = LODWORD(self->_absoluteQuaternion.x);
  v5.i64[0] = *(void *)&self->_absoluteQuaternion.q[1];
  float32x4_t v13 = vmulq_n_f32(v12, self->_absoluteQuaternion.w);
  float32x4_t v14 = (float32x4_t)vextq_s8(vextq_s8(v11, v11, 4uLL), (int8x16_t)v5, 0xCuLL);
  v14.i32[3] = v14.i32[0];
  float32x4_t v15 = vmulq_f32(v14, (float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v12, 3), (int8x16_t)v12, 4uLL));
  float32x4_t v16 = vaddq_f32(v13, v15);
  float32x4_t v17 = vsubq_f32(v13, v15);
  int32x4_t v18 = vuzp2q_s32(v5, vzip1q_s32(v5, v5));
  float32x4_t v19 = (float32x4_t)v18;
  v19.i32[1] = v11.i32[0];
  v19.i32[3] = v18.i32[2];
  float32x4_t v20 = v12;
  v20.i32[3] = v12.i32[1];
  float32x4_t v21 = vmulq_f32(v19, v20);
  float32x4_t v22 = vaddq_f32(v16, (float32x4_t)vuzp2q_s32((int32x4_t)vextq_s8((int8x16_t)v21, (int8x16_t)v21, 4uLL), (int32x4_t)v21));
  v22.i32[3] = vsubq_f32(v17, v21).i32[3];
  v17.i64[0] = v5.i64[0];
  v17.i64[1] = __PAIR64__(v5.u32[1], v11.u32[0]);
  v12.i32[3] = v12.i32[2];
  int32x4_t v23 = (int32x4_t)vmulq_f32(v17, v12);
  self->_referenceQuaternion = (_GLKQuaternion)vsubq_f32(v22, (float32x4_t)vzip2q_s32(vzip1q_s32(v23, (int32x4_t)vextq_s8((int8x16_t)v23, (int8x16_t)v23, 0xCuLL)), v23));
  float v24 = [(_UIMotionAnalyzer *)self viewerRelativeDevicePose];
  [v24 viewerOffset];
  -[_UIMotionAttitudeAnalyzer _resetDirectionalLockWithViewerOffset:](self, "_resetDirectionalLockWithViewerOffset:");

  -[_UIMotionAttitudeAnalyzer _currentRawOffset:](self, "_currentRawOffset:", v33, v32, v31, v30);
  double v26 = v25;
  double v28 = v27;
  float v29 = [(_UIMotionAnalyzer *)self viewerRelativeDevicePose];
  objc_msgSend(v29, "setViewerOffset:", v26, v28);

  float32x4_t v34 = [(_UIMotionAnalyzer *)self viewerRelativeDevicePose];
  [v34 viewerOffset];
  -[_UIMotionAttitudeAnalyzer _updateSmoothedOffsetForRawOffset:](self, "_updateSmoothedOffsetForRawOffset:");
}

- (double)_directionLockStrength
{
  return self->_lockStrength;
}

- (BOOL)_shouldSuspendApplicationForHysteresisGivenNewViewerOffset:(UIOffset)a3 wasSuspendingApplicationForHysteresis:(BOOL)a4
{
  double vertical = a3.vertical;
  double horizontal = a3.horizontal;
  double v6 = self->_lastAppliedViewerOffset.horizontal * self->_lastAppliedViewerOffset.horizontal
     + self->_lastAppliedViewerOffset.vertical * self->_lastAppliedViewerOffset.vertical;
  if (a4)
  {
    int v7 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257710, @"UIMotionEffectHysteresisExitThreshold");
    uint64_t v8 = qword_1EB257718;
    BOOL v9 = v7 == 0;
    double v10 = 0.0075;
  }
  else
  {
    int v11 = _UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_21, @"UIMotionEffectHysteresisEntranceThreshold");
    uint64_t v8 = qword_1EB257708;
    BOOL v9 = v11 == 0;
    double v10 = 0.006;
  }
  if (!v9) {
    *(double *)&uint64_t v8 = v10;
  }
  return v6 < *(double *)&v8 && horizontal * horizontal + vertical * vertical < *(double *)&v8;
}

- (void)_createIdleIndicator
{
  [(_UIMotionAttitudeAnalyzer *)self _createDiagnosticsWindow];
  if (!self->_idleIndicator)
  {
    [(UIView *)self->_diagnosticsWindow bounds];
    int32x4_t v5 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v3 + -80.0, v4 + -60.0, 60.0, 40.0);
    idleIndicator = self->_idleIndicator;
    self->_idleIndicator = v5;

    int v7 = self->_idleIndicator;
    uint64_t v8 = +[UIColor redColor];
    [(UIView *)v7 setBackgroundColor:v8];

    [(UIView *)self->_idleIndicator setAlpha:0.7];
    BOOL v9 = self->_idleIndicator;
    double v10 = [off_1E52D39B8 boldSystemFontOfSize:18.0];
    [(UILabel *)v9 setFont:v10];

    int v11 = self->_idleIndicator;
    float32x4_t v12 = +[UIColor whiteColor];
    [(UILabel *)v11 setTextColor:v12];

    [(UILabel *)self->_idleIndicator setTextAlignment:1];
    [(UILabel *)self->_idleIndicator setText:@"Idle"];
    float32x4_t v13 = [(UIView *)self->_idleIndicator layer];
    id v14 = +[UIColor whiteColor];
    objc_msgSend(v13, "setBorderColor:", objc_msgSend(v14, "CGColor"));

    float32x4_t v15 = [(UIView *)self->_idleIndicator layer];
    [v15 setBorderWidth:2.0];

    float32x4_t v16 = [(UIView *)self->_idleIndicator layer];
    [v16 setCornerRadius:10.0];

    [(UIView *)self->_diagnosticsWindow addSubview:self->_idleIndicator];
    float32x4_t v17 = self->_idleIndicator;
    [(UIView *)v17 setHidden:1];
  }
}

- (void)_createDirectionLockIndicators
{
  [(_UIMotionAttitudeAnalyzer *)self _createDiagnosticsWindow];
  if (!self->_horizontalLockIndicator)
  {
    [(UIView *)self->_diagnosticsWindow bounds];
    double v4 = v3;
    int32x4_t v5 = [UIView alloc];
    [(UIView *)self->_diagnosticsWindow bounds];
    uint64_t v8 = -[UIView initWithFrame:](v5, "initWithFrame:", 0.0, round(v7 + (v6 + -10.0) * 0.5), v4, 10.0);
    horizontalLockIndicator = self->_horizontalLockIndicator;
    self->_horizontalLockIndicator = v8;

    double v10 = self->_horizontalLockIndicator;
    int v11 = +[UIColor redColor];
    [(UIView *)v10 setBackgroundColor:v11];

    [(UIView *)self->_horizontalLockIndicator setAlpha:0.5];
    [(UIView *)self->_diagnosticsWindow addSubview:self->_horizontalLockIndicator];
    [(UIView *)self->_horizontalLockIndicator setHidden:1];
  }
  if (!self->_verticalLockIndicator)
  {
    [(UIView *)self->_diagnosticsWindow bounds];
    double v13 = v12;
    id v14 = [UIView alloc];
    [(UIView *)self->_diagnosticsWindow bounds];
    float32x4_t v17 = -[UIView initWithFrame:](v14, "initWithFrame:", round(v16 + (v15 + -10.0) * 0.5), 0.0, 10.0, v13);
    verticalLockIndicator = self->_verticalLockIndicator;
    self->_verticalLockIndicator = v17;

    float32x4_t v19 = self->_verticalLockIndicator;
    float32x4_t v20 = +[UIColor redColor];
    [(UIView *)v19 setBackgroundColor:v20];

    [(UIView *)self->_verticalLockIndicator setAlpha:0.5];
    [(UIView *)self->_diagnosticsWindow addSubview:self->_verticalLockIndicator];
    float32x4_t v21 = self->_verticalLockIndicator;
    [(UIView *)v21 setHidden:1];
  }
}

- (void)_createDiagnosticsWindow
{
  if (!self->_diagnosticsWindow)
  {
    double v3 = [UIWindow alloc];
    double v4 = +[UIScreen mainScreen];
    [v4 bounds];
    int32x4_t v5 = -[UIWindow initWithFrame:](v3, "initWithFrame:");
    diagnosticsWindow = self->_diagnosticsWindow;
    self->_diagnosticsWindow = v5;

    [(UIWindow *)self->_diagnosticsWindow setWindowLevel:1051.0];
    [(UIView *)self->_diagnosticsWindow setUserInteractionEnabled:0];
    double v7 = self->_diagnosticsWindow;
    [(UIWindow *)v7 setHidden:0];
  }
}

@end