@interface NUNIAnimation
+ (void)generateSlerpKeys:(id)a1 times:(SEL)a2 count:from:to:;
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
      unint64_t v33 = vmlaq_n_f32(*(float32x4_t *)self->_from, vsubq_f32(*(float32x4_t *)self->_to, *(float32x4_t *)self->_from), a3).u64[0];
      goto LABEL_16;
    case 1uLL:
      unint64_t v33 = vmlaq_n_f32(*(float32x4_t *)self->_from, vsubq_f32(*(float32x4_t *)self->_to, *(float32x4_t *)self->_from), (float)(a3 * a3) * (float)((float)(a3 * -2.0) + 3.0)).u64[0];
      goto LABEL_16;
    case 2uLL:
      float v6 = 1.0 - a3;
      unint64_t v33 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(*(float32x4_t *)self->_from, v6 * (float)(v6 * v6)), *(float32x4_t *)self->_ctrl1, (float)((float)(v6 * v6) * 3.0) * a3), *(float32x4_t *)self->_ctrl2, (float)(a3 * a3) * (float)(v6 * 3.0)), *(float32x4_t *)self->_to, (float)(a3 * a3) * a3).u64[0];
      goto LABEL_16;
    case 3uLL:
      int valuesCount = self->_valuesCount;
      int v8 = valuesCount - 1;
      float v9 = (float)(valuesCount - 1);
      int v10 = valuesCount - 2;
      if ((int)(float)(v9 * a3) < v10) {
        int v10 = (int)(float)(v9 * a3);
      }
      uint64_t v11 = v10 + 1;
      float v12 = (float)v10 / v9;
      float v13 = (float)(int)v11 / v9;
      float v15 = (float)(a3 - v12) / (float)(v13 - v12);
      float v16 = v15 * v15;
      float v17 = v15 * (float)(v15 * v15);
      if (v10 <= 1) {
        int v18 = 1;
      }
      else {
        int v18 = v10;
      }
      int v19 = v18 - 1;
      if (v10 + 2 < v8) {
        int v8 = v10 + 2;
      }
      float v20 = v16 * 3.0;
      float v21 = 1.0 - (float)((float)(v16 * 3.0) - (float)(v17 * 2.0));
      float v22 = v15 + (float)(v17 + (float)(v16 * -2.0));
      float v23 = v17 - v16;
      float32x4_t v24 = *(float32x4_t *)&self->_values[16 * v10];
      float v25 = v20 + (float)(v17 * -2.0);
      float32x4_t v26 = *(float32x4_t *)&self->_values[16 * v11];
      float32x4_t v27 = vsubq_f32(v26, v24);
      float v14 = v13 - v12;
      unint64_t v5 = vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(vmlaq_n_f32(vmulq_n_f32(v27, (float)(v12 - (float)((float)v19 / v9)) / (float)(v14 + (float)(v12 - (float)((float)v19 / v9)))), vsubq_f32(v24, *(float32x4_t *)&self->_values[16 * v19]), v14 / (float)(v14 + (float)(v12 - (float)((float)v19 / v9)))), v22), v24, v21), vmlaq_n_f32(vmulq_n_f32(vsubq_f32(*(float32x4_t *)&self->_values[16 * v8], v26), v14 / (float)(v14 + (float)((float)((float)v8 / v9) - v13))), v27, (float)((float)((float)v8 / v9) - v13) / (float)(v14 + (float)((float)((float)v8 / v9) - v13))), v23),
             v26,
             v25).u64[0];
      goto LABEL_15;
    case 4uLL:
      float32x4_t v28 = *(float32x4_t *)self->_from;
      float32x4_t v29 = *(float32x4_t *)self->_to;
      float32x4_t v30 = vmulq_f32(v28, v29);
      float32x4_t v31 = (float32x4_t)vextq_s8((int8x16_t)v30, (int8x16_t)v30, 8uLL);
      *(float32x2_t *)v30.f32 = vadd_f32(*(float32x2_t *)v30.f32, *(float32x2_t *)v31.f32);
      v30.f32[0] = vaddv_f32(*(float32x2_t *)v30.f32);
      v31.i64[0] = 0;
      _simd_slerp_internal(v28, (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v30, v31)), 0), (int8x16_t)vnegq_f32(v29), (int8x16_t)v29), a3);
      goto LABEL_15;
    default:
      unint64_t v5 = 0;
LABEL_15:
      unint64_t v33 = v5;
LABEL_16:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_animatable);
      [WeakRetained setAnimatedFloat:self->_key forKey:*(double *)&v33];

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

+ (void)generateSlerpKeys:(id)a1 times:(SEL)a2 count:from:to:
{
  float32x4_t v15 = v5;
  if (v4 >= 1)
  {
    long long v7 = v3;
    int v8 = v2;
    float32x4_t v9 = vmulq_f32(v5, v6);
    float32x4_t v10 = (float32x4_t)vextq_s8((int8x16_t)v9, (int8x16_t)v9, 8uLL);
    *(float32x2_t *)v9.f32 = vadd_f32(*(float32x2_t *)v9.f32, *(float32x2_t *)v10.f32);
    v9.f32[0] = vaddv_f32(*(float32x2_t *)v9.f32);
    v10.i64[0] = 0;
    float32x4_t v14 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v9, v10)), 0), (int8x16_t)vnegq_f32(v6), (int8x16_t)v6);
    uint64_t v11 = v4;
    do
    {
      float v12 = *v7++;
      _simd_slerp_internal(v15, v14, v12);
      *v8++ = v13;
      --v11;
    }
    while (v11);
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