@interface NUNIAnimation
- (BOOL)isPaused;
- (BOOL)isRepeat;
- (BOOL)update:(float)a3;
- (NUNIAnimatable)animatable;
- (NUNIAnimation)initWithAnimatable:(NUNIAnimation *)self from:(SEL)a2 to:(id)a3 key:(unint64_t)a4;
- (NUNIAnimation)initWithAnimatable:(id)a3 from:(unint64_t)a4 to:ctrl1:ctrl2:key:;
- (NUNIAnimation)initWithAnimatable:(id)a3 value:(unint64_t)a4 key:;
- (NUNIAnimation)initWithAnimatable:(id)a3 values:count:key:;
- (NUNIAnimationObserver)observer;
- (__n128)from;
- (__n128)to;
- (float)delay;
- (float)duration;
- (float)startTime;
- (unint64_t)function;
- (unint64_t)key;
- (void)apply:(float)a3;
- (void)setAnimatable:(id)a3;
- (void)setDelay:(float)a3;
- (void)setDuration:(float)a3;
- (void)setFrom:(NUNIAnimation *)self;
- (void)setFunction:(unint64_t)a3;
- (void)setKey:(unint64_t)a3;
- (void)setObserver:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setRepeat:(BOOL)a3;
- (void)setStartTime:(float)a3;
- (void)setTo:(NUNIAnimation *)self;
@end

@implementation NUNIAnimation

- (NUNIAnimation)initWithAnimatable:(id)a3 values:count:key:
{
  unint64_t v6 = v5;
  int v7 = v4;
  v8 = v3;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NUNIAnimation;
  v11 = [(NUNIAnimation *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_animatable, v10);
    v12->_key = v6;
    v12->_function = 3;
    *(void *)&v12->_startTime = 0x3F800000BF800000;
    if (v7 >= 76) {
      -[NUNIAnimation initWithAnimatable:values:count:key:]();
    }
    memcpy(v12->_values, v8, 16 * v7);
    v12->_valuesCount = v7;
  }

  return v12;
}

- (NUNIAnimation)initWithAnimatable:(id)a3 from:(unint64_t)a4 to:ctrl1:ctrl2:key:
{
  long long v16 = v6;
  long long v17 = v7;
  long long v14 = v5;
  long long v15 = v4;
  id v10 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NUNIAnimation;
  v11 = [(NUNIAnimation *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_animatable, v10);
    *(_OWORD *)v12->_to = v14;
    *(_OWORD *)v12->_from = v15;
    v12->_key = a4;
    *(_OWORD *)v12->_ctrl1 = v16;
    *(_OWORD *)v12->_ctrl2 = v17;
    v12->_function = 1;
    *(void *)&v12->_startTime = 0x3F800000BF800000;
  }

  return v12;
}

- (NUNIAnimation)initWithAnimatable:(NUNIAnimation *)self from:(SEL)a2 to:(id)a3 key:(unint64_t)a4
{
  return -[NUNIAnimation initWithAnimatable:from:to:ctrl1:ctrl2:key:](self, "initWithAnimatable:from:to:ctrl1:ctrl2:key:", a3, a4);
}

- (NUNIAnimation)initWithAnimatable:(id)a3 value:(unint64_t)a4 key:
{
  id v6 = a3;
  [v6 animatedFloatForKey:a4];
  long long v7 = -[NUNIAnimation initWithAnimatable:from:to:ctrl1:ctrl2:key:](self, "initWithAnimatable:from:to:ctrl1:ctrl2:key:", v6, a4);

  return v7;
}

- (BOOL)update:(float)a3
{
  self->_prevTime = a3;
  float startTime = self->_startTime;
  if (startTime < 0.0)
  {
    float startTime = self->_delay + a3;
    self->_float startTime = startTime;
  }
  if (self->_paused) {
    return 1;
  }
  a3 = fmaxf(a3 - startTime, 0.0) / self->_duration;
  if (a3 <= 1.0)
  {
    BOOL v4 = 1;
  }
  else if (self->_repeat)
  {
    self->_float startTime = -1.0;
    BOOL v4 = 1;
    *(void *)&a3 = 0;
  }
  else
  {
    BOOL v4 = 0;
    a3 = 1.0;
  }
  [(NUNIAnimation *)self apply:*(double *)&a3];
  return v4;
}

- (void)apply:(float)a3
{
  switch(self->_function)
  {
    case 0uLL:
      goto LABEL_3;
    case 1uLL:
      a3 = (float)(a3 * a3) * (float)((float)(a3 * -2.0) + 3.0);
LABEL_3:
      unint64_t v60 = vmlaq_n_f32(*(float32x4_t *)self->_from, vsubq_f32(*(float32x4_t *)self->_to, *(float32x4_t *)self->_from), a3).u64[0];
      goto LABEL_24;
    case 2uLL:
      unint64_t v60 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(*(float32x4_t *)self->_from, (float)(1.0 - a3) * (float)((float)(1.0 - a3) * (float)(1.0 - a3))), *(float32x4_t *)self->_ctrl1, (float)((float)((float)(1.0 - a3) * (float)(1.0 - a3)) * 3.0) * a3), *(float32x4_t *)self->_ctrl2, (float)(a3 * a3) * (float)((float)(1.0 - a3) * 3.0)), *(float32x4_t *)self->_to, (float)(a3 * a3) * a3).u64[0];
      goto LABEL_24;
    case 3uLL:
      int valuesCount = self->_valuesCount;
      int v6 = valuesCount - 1;
      float v7 = (float)(valuesCount - 1);
      int v8 = valuesCount - 2;
      if ((int)(float)(v7 * a3) < v8) {
        int v8 = (int)(float)(v7 * a3);
      }
      uint64_t v9 = v8 + 1;
      float v10 = (float)v8 / v7;
      float v11 = (float)(int)v9 / v7;
      float v13 = (float)(a3 - v10) / (float)(v11 - v10);
      float v14 = v13 * v13;
      float v15 = v13 * (float)(v13 * v13);
      if (v8 <= 1) {
        int v16 = 1;
      }
      else {
        int v16 = v8;
      }
      int v17 = v16 - 1;
      if (v8 + 2 < v6) {
        int v6 = v8 + 2;
      }
      float v18 = v14 * 3.0;
      float v19 = 1.0 - (float)((float)(v14 * 3.0) - (float)(v15 * 2.0));
      float v20 = v13 + (float)(v15 + (float)(v14 * -2.0));
      float v21 = v15 - v14;
      float32x4_t v22 = *(float32x4_t *)&self->_values[16 * v8];
      float v23 = v18 + (float)(v15 * -2.0);
      float32x4_t v24 = *(float32x4_t *)&self->_values[16 * v9];
      float32x4_t v25 = vsubq_f32(v24, v22);
      float v12 = v11 - v10;
      unint64_t v4 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(vmlaq_n_f32(vmulq_n_f32(v25, (float)(v10 - (float)((float)v17 / v7)) / (float)(v12 + (float)(v10 - (float)((float)v17 / v7)))), vsubq_f32(v22, *(float32x4_t *)&self->_values[16 * v17]), v12 / (float)(v12 + (float)(v10 - (float)((float)v17 / v7)))), v20), v22, v19), vmlaq_n_f32(vmulq_n_f32(vsubq_f32(*(float32x4_t *)&self->_values[16 * v6], v24), v12 / (float)(v12 + (float)((float)((float)v6 / v7) - v11))), v25, (float)((float)((float)v6 / v7) - v11) / (float)(v12 + (float)((float)((float)v6 / v7) - v11))), v21),
             v24,
             v23).u64[0];
      goto LABEL_23;
    case 4uLL:
      float32x4_t v26 = *(float32x4_t *)self->_from;
      float32x4_t v27 = *(float32x4_t *)self->_to;
      float32x4_t v28 = vmulq_f32(v26, v27);
      float32x4_t v29 = (float32x4_t)vextq_s8((int8x16_t)v28, (int8x16_t)v28, 8uLL);
      *(float32x2_t *)v28.f32 = vadd_f32(*(float32x2_t *)v28.f32, *(float32x2_t *)v29.f32);
      v28.f32[0] = vaddv_f32(*(float32x2_t *)v28.f32);
      v29.i64[0] = 0;
      float32x4_t v30 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v28, v29)), 0), (int8x16_t)vnegq_f32(v27), (int8x16_t)v27);
      float v31 = 1.0;
      float32x4_t v61 = v26;
      float v62 = a3;
      float v32 = 1.0 - a3;
      float32x4_t v33 = vsubq_f32(v26, v30);
      int8x16_t v34 = (int8x16_t)vmulq_f32(v33, v33);
      float32x4_t v59 = v30;
      float32x4_t v35 = vaddq_f32(v26, v30);
      int8x16_t v36 = (int8x16_t)vmulq_f32(v35, v35);
      float v37 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v34.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v34, v34, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v36.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v36, v36, 8uLL)))));
      float v38 = v37 + v37;
      BOOL v39 = (float)(v37 + v37) == 0.0;
      float v40 = 1.0;
      if (!v39) {
        float v40 = sinf(v38) / v38;
      }
      uint64_t v41 = LODWORD(v40);
      float32x2_t v42 = vrecpe_f32((float32x2_t)LODWORD(v40));
      float32x2_t v43 = vmul_f32(v42, vrecps_f32((float32x2_t)v41, v42));
      LODWORD(v44) = vmul_f32(v43, vrecps_f32((float32x2_t)v41, v43)).u32[0];
      if ((float)(v32 * v38) != 0.0)
      {
        float v57 = v44;
        v43.f32[0] = sinf(v32 * v38);
        float v44 = v57;
        float v31 = v43.f32[0] / (float)(v32 * v38);
      }
      v43.f32[0] = v32 * (float)(v44 * v31);
      float32x4_t v45 = (float32x4_t)vdupq_lane_s32((int32x2_t)v43, 0);
      float v46 = v62;
      float v47 = v38 * v62;
      float v48 = 1.0;
      if (v47 != 0.0)
      {
        float32x4_t v56 = v45;
        float v58 = v44;
        float v49 = sinf(v47);
        float32x4_t v45 = v56;
        float v44 = v58;
        float v46 = v62;
        float v48 = v49 / v47;
      }
      float32x4_t v50 = vmlaq_f32(vmulq_n_f32(v59, (float)(v44 * v48) * v46), v61, v45);
      int8x16_t v51 = (int8x16_t)vmulq_f32(v50, v50);
      float32x2_t v52 = vadd_f32(*(float32x2_t *)v51.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v51, v51, 8uLL));
      if (vaddv_f32(v52) == 0.0)
      {
        unint64_t v4 = 0;
      }
      else
      {
        unsigned __int32 v53 = vadd_f32(v52, (float32x2_t)vdup_lane_s32((int32x2_t)v52, 1)).u32[0];
        float32x2_t v54 = vrsqrte_f32((float32x2_t)v53);
        float32x2_t v55 = vmul_f32(v54, vrsqrts_f32((float32x2_t)v53, vmul_f32(v54, v54)));
        unint64_t v4 = vmulq_n_f32(v50, vmul_f32(v55, vrsqrts_f32((float32x2_t)v53, vmul_f32(v55, v55))).f32[0]).u64[0];
      }
      goto LABEL_23;
    default:
      unint64_t v4 = 0;
LABEL_23:
      unint64_t v60 = v4;
LABEL_24:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_animatable);
      [WeakRetained setAnimatedFloat:self->_key forKey:*(double *)&v60];

      return;
  }
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    float prevTime = self->_prevTime;
    if (a3) {
      self->_pauseTime = prevTime;
    }
    else {
      self->_float startTime = prevTime - (float)(self->_pauseTime - self->_startTime);
    }
  }
}

- (float)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(float)a3
{
  self->_float startTime = a3;
}

- (float)duration
{
  return self->_duration;
}

- (void)setDuration:(float)a3
{
  self->_duration = a3;
}

- (float)delay
{
  return self->_delay;
}

- (void)setDelay:(float)a3
{
  self->_delay = a3;
}

- (__n128)from
{
  return a1[82];
}

- (void)setFrom:(NUNIAnimation *)self
{
  *(_OWORD *)self->_from = v2;
}

- (__n128)to
{
  return a1[83];
}

- (void)setTo:(NUNIAnimation *)self
{
  *(_OWORD *)self->_to = v2;
}

- (BOOL)isRepeat
{
  return self->_repeat;
}

- (void)setRepeat:(BOOL)a3
{
  self->_repeat = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (unint64_t)function
{
  return self->_function;
}

- (void)setFunction:(unint64_t)a3
{
  self->_function = a3;
}

- (unint64_t)key
{
  return self->_key;
}

- (void)setKey:(unint64_t)a3
{
  self->_key = a3;
}

- (NUNIAnimatable)animatable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animatable);
  return (NUNIAnimatable *)WeakRetained;
}

- (void)setAnimatable:(id)a3
{
}

- (NUNIAnimationObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (NUNIAnimationObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_destroyWeak((id *)&self->_animatable);
}

- (void)initWithAnimatable:values:count:key:.cold.1()
{
}

@end