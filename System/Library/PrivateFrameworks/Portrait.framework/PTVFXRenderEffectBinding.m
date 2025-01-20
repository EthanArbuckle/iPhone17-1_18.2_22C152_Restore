@interface PTVFXRenderEffectBinding
+ (void)setRawValue:(id)a3 onBinding:(id)a4;
- (BOOL)active;
- (BOOL)useBackgroundDimming;
- (BOOL)useCircularGradient;
- (NSData)opacityValue;
- (NSMutableArray)opacityBindings;
- (PTVFXRenderEffectBinding)initWithHumanDetections:(id)a3;
- (VFXBinding)backgroundDimmingBinding;
- (VFXBinding)durationBinding;
- (VFXBinding)headPositionBinding;
- (VFXBinding)positionBinding;
- (_TtC3VFX9VFXEffect)effect;
- (double)creationTimeSeconds;
- (double)inverseCameraProjection;
- (float)dimmingFactor;
- (float)duration;
- (float)emitZValue;
- (id)singleDetectionGroupId;
- (int)updateBackgroundDimming:(float)a3;
- (int)updateWithEvent:(id)a3 renderRequest:(id)a4 videoRect:(CGRect)a5 time:(double)a6;
- (uint64_t)screenSpaceToCameraSpace:(float64x2_t)a3 videoRect:(float64_t)a4;
- (unint64_t)effectType;
- (void)forceFadeOut:(double)a3;
- (void)setBackgroundDimmingBinding:(id)a3;
- (void)setCreationTimeSeconds:(double)a3;
- (void)setDuration:(float)a3;
- (void)setDurationBinding:(id)a3;
- (void)setEffect:(id)a3;
- (void)setEffectType:(unint64_t)a3;
- (void)setEmitZValue:(float)a3;
- (void)setHeadPositionBinding:(id)a3;
- (void)setInverseCameraProjection:(__n128)a3;
- (void)setOpacityBindings:(id)a3;
- (void)setOpacityValue:(id)a3;
- (void)setPositionBinding:(id)a3;
- (void)setUseBackgroundDimming:(BOOL)a3;
- (void)setUseCircularGradient:(BOOL)a3;
@end

@implementation PTVFXRenderEffectBinding

- (PTVFXRenderEffectBinding)initWithHumanDetections:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PTVFXRenderEffectBinding;
  v6 = [(PTVFXRenderEffectBinding *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_duration = 7.0;
    v6->_forceFadeOutStart = 3.4028e38;
    v6->_active = 1;
    objc_storeStrong((id *)&v6->_humanDetections, a3);
    uint64_t v8 = [(PTVFXRenderEffectBinding *)v7 singleDetectionGroupId];
    faceDetectionGroupId = v7->_faceDetectionGroupId;
    v7->_faceDetectionGroupId = (NSNumber *)v8;

    v10 = v7;
  }

  return v7;
}

- (id)singleDetectionGroupId
{
  v3 = [(PTHumanDetections *)self->_humanDetections detectionsFiltered];
  v4 = [(PTHumanDetections *)self->_humanDetections faceDetectionsFilteredState:0];
  uint64_t v5 = 0;
  int v6 = 0;
  int v7 = 0;
  uint64_t groupId = 0;
  uint64_t v9 = 0;
  do
  {
    unsigned int v10 = v4[v5];
    if (v10 >= 2)
    {
      if (v10 == 2)
      {
        uint64_t groupId = v3->groupId;
        ++v6;
      }
    }
    else
    {
      uint64_t v9 = v3->groupId;
      ++v7;
    }
    ++v5;
    v3 += 36;
  }
  while (v5 != 4);
  if (v7 == 1 || (v11 = 0, !v7) && (uint64_t v9 = groupId, v6 == 1))
  {
    v11 = [NSNumber numberWithInt:v9];
  }

  return v11;
}

- (uint64_t)screenSpaceToCameraSpace:(float64x2_t)a3 videoRect:(float64_t)a4
{
  if (a5.f64[0] > 0.0 && a6 > 0.0)
  {
    a5.f64[1] = a6;
    a3.f64[1] = a4;
    *(float32x2_t *)&a3.f64[0] = vcvt_f32_f64(a3);
    a2 = vdiv_f32(vsub_f32(a2, *(float32x2_t *)&a3.f64[0]), vcvt_f32_f64(a5));
  }
  LODWORD(a3.f64[0]) = *(_DWORD *)(a1 + 48);
  return +[PTEffectUtil screenSpaceToCameraSpace:zValue:inverseProjection:](PTEffectUtil, "screenSpaceToCameraSpace:zValue:inverseProjection:", *(double *)&a2, a3.f64[0], *(double *)(a1 + 128), *(double *)(a1 + 144), *(double *)(a1 + 160), *(double *)(a1 + 176));
}

- (int)updateWithEvent:(id)a3 renderRequest:(id)a4 videoRect:(CGRect)a5 time:(double)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  if (!self->_active) {
    goto LABEL_37;
  }
  v48 = v13;
  headPositionBinding = self->_headPositionBinding;
  if (self->_faceDetectionGroupId)
  {
    if (headPositionBinding)
    {
      v16 = [(PTHumanDetections *)self->_humanDetections detectionsFiltered];
      v17 = [(PTHumanDetections *)self->_humanDetections faceDetectionsFilteredState:0];
      uint64_t v18 = 0;
      p_uint64_t groupId = (double *)&v16[4].groupId;
      do
      {
        int v20 = *((_DWORD *)p_groupId - 4);
        if (v20 == [(NSNumber *)self->_faceDetectionGroupId intValue] && v17[v18] != 3)
        {
          +[PTVFXRenderEffect transformVideoRectToCropCoordinates:v14 effectRenderRequest:*p_groupId];
          double v50 = *(double *)v21.i64;
          *(float32x2_t *)v21.i8 = vmla_f32(*(float32x2_t *)v21.i8, (float32x2_t)0x3F0000003F000000, (float32x2_t)*(_OWORD *)&vextq_s8(v21, v21, 8uLL));
          *(float *)&v21.i32[1] = 1.0 - *(float *)&v21.i32[1];
          -[PTVFXRenderEffectBinding screenSpaceToCameraSpace:videoRect:](self, "screenSpaceToCameraSpace:videoRect:", *(double *)v21.i64, x, y, width, height);
          float32x4_t v49 = v22;
          -[PTVFXRenderEffectBinding screenSpaceToCameraSpace:videoRect:](self, "screenSpaceToCameraSpace:videoRect:", v50, x, y, width, height);
          float32x4_t v24 = vsubq_f32(v49, v23);
          float32x4_t v25 = vmulq_f32(v24, v24);
          float32x4_t v26 = v49;
          v26.i32[3] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v25, 2), vaddq_f32(v25, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v25.f32, 1))).f32[0]);
          float32x4_t v55 = v26;
          v27 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v55 length:16];
          +[PTVFXRenderEffectBinding setRawValue:v27 onBinding:self->_headPositionBinding];
        }
        p_groupId += 18;
        ++v18;
      }
      while (v18 != 4);
    }
  }
  else if (headPositionBinding)
  {
    float32x4_t v55 = 0uLL;
    v28 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v55 length:16];
    +[PTVFXRenderEffectBinding setRawValue:v28 onBinding:self->_headPositionBinding];
  }
  durationBinding = self->_durationBinding;
  if (durationBinding)
  {
    id v30 = [(VFXBinding *)durationBinding rawValue];
    self->_float duration = *(float *)[v30 bytes];
  }
  id v13 = v48;
  if (v48 && self->_positionBinding)
  {
    [v48 position];
    +[PTVFXRenderEffect transformVideoPositionToCropCoordinates:effectRenderRequest:flipYAxis:](PTVFXRenderEffect, "transformVideoPositionToCropCoordinates:effectRenderRequest:flipYAxis:", v14, 1);
    -[PTVFXRenderEffectBinding screenSpaceToCameraSpace:videoRect:](self, "screenSpaceToCameraSpace:videoRect:");
    float32x4_t v55 = v31;
    v32 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v55 length:16];
    +[PTVFXRenderEffectBinding setRawValue:v32 onBinding:self->_positionBinding];
  }
  double v33 = a6 - self->_creationTimeSeconds;
  float duration = self->_duration;
  self->_active = v33 < duration;
  float v35 = 0.0;
  if (v33 < duration && self->_useBackgroundDimming)
  {
    if (v33 >= 0.660000026)
    {
      float v35 = 1.0;
      if (v33 < (float)(duration + -2.0)) {
        goto LABEL_24;
      }
      double v36 = (duration - v33) * 0.5;
    }
    else
    {
      double v36 = v33 / 0.660000026;
    }
    float v35 = v36;
  }
LABEL_24:
  self->_dimmingFactor = v35;
  double forceFadeOutStart = self->_forceFadeOutStart;
  if (forceFadeOutStart < a6)
  {
    float v38 = a6 - forceFadeOutStart + a6 - forceFadeOutStart;
    if (v38 <= 1.0)
    {
      float v39 = 1.0 - v38;
      v55.f32[0] = v39;
      if (v35 >= v39) {
        float v35 = v39;
      }
    }
    else
    {
      self->_active = 0;
      v55.i32[0] = 0;
      float v35 = 0.0;
    }
    self->_dimmingFactor = v35;
    v40 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v55 length:4];
    opacityValue = self->_opacityValue;
    self->_opacityValue = v40;

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v42 = self->_opacityBindings;
    uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v52 != v45) {
            objc_enumerationMutation(v42);
          }
          [*(id *)(*((void *)&v51 + 1) + 8 * i) setRawValue:self->_opacityValue];
        }
        uint64_t v44 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v44);
    }
  }
LABEL_37:

  return 0;
}

- (int)updateBackgroundDimming:(float)a3
{
  float v6 = a3;
  if (self->_backgroundDimmingBinding)
  {
    v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v6 length:4];
    +[PTVFXRenderEffectBinding setRawValue:v4 onBinding:self->_backgroundDimmingBinding];
  }
  return 0;
}

- (void)forceFadeOut:(double)a3
{
  float v3 = a3;
  self->_double forceFadeOutStart = v3;
}

+ (void)setRawValue:(id)a3 onBinding:(id)a4
{
}

- (float)dimmingFactor
{
  return self->_dimmingFactor;
}

- (BOOL)active
{
  return self->_active;
}

- (_TtC3VFX9VFXEffect)effect
{
  return self->_effect;
}

- (void)setEffect:(id)a3
{
}

- (VFXBinding)positionBinding
{
  return self->_positionBinding;
}

- (void)setPositionBinding:(id)a3
{
}

- (VFXBinding)headPositionBinding
{
  return self->_headPositionBinding;
}

- (void)setHeadPositionBinding:(id)a3
{
}

- (VFXBinding)backgroundDimmingBinding
{
  return self->_backgroundDimmingBinding;
}

- (void)setBackgroundDimmingBinding:(id)a3
{
}

- (NSMutableArray)opacityBindings
{
  return self->_opacityBindings;
}

- (void)setOpacityBindings:(id)a3
{
}

- (NSData)opacityValue
{
  return self->_opacityValue;
}

- (void)setOpacityValue:(id)a3
{
}

- (BOOL)useBackgroundDimming
{
  return self->_useBackgroundDimming;
}

- (void)setUseBackgroundDimming:(BOOL)a3
{
  self->_useBackgroundDimming = a3;
}

- (float)duration
{
  return self->_duration;
}

- (void)setDuration:(float)a3
{
  self->_float duration = a3;
}

- (VFXBinding)durationBinding
{
  return self->_durationBinding;
}

- (void)setDurationBinding:(id)a3
{
}

- (double)creationTimeSeconds
{
  return self->_creationTimeSeconds;
}

- (void)setCreationTimeSeconds:(double)a3
{
  self->_creationTimeSeconds = a3;
}

- (unint64_t)effectType
{
  return self->_effectType;
}

- (void)setEffectType:(unint64_t)a3
{
  self->_effectType = a3;
}

- (float)emitZValue
{
  return self->_emitZValue;
}

- (void)setEmitZValue:(float)a3
{
  self->_emitZValue = a3;
}

- (double)inverseCameraProjection
{
  objc_copyStruct(&v2, (const void *)(a1 + 128), 64, 1, 0);
  return *(double *)&v2;
}

- (void)setInverseCameraProjection:(__n128)a3
{
  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  v5[3] = a5;
  objc_copyStruct((void *)(a1 + 128), v5, 64, 1, 0);
}

- (BOOL)useCircularGradient
{
  return self->_useCircularGradient;
}

- (void)setUseCircularGradient:(BOOL)a3
{
  self->_useCircularGradient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationBinding, 0);
  objc_storeStrong((id *)&self->_opacityValue, 0);
  objc_storeStrong((id *)&self->_opacityBindings, 0);
  objc_storeStrong((id *)&self->_backgroundDimmingBinding, 0);
  objc_storeStrong((id *)&self->_headPositionBinding, 0);
  objc_storeStrong((id *)&self->_positionBinding, 0);
  objc_storeStrong((id *)&self->_effect, 0);
  objc_storeStrong((id *)&self->_faceDetectionGroupId, 0);

  objc_storeStrong((id *)&self->_humanDetections, 0);
}

@end