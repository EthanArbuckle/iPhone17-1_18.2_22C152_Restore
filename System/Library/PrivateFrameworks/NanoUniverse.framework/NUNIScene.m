@interface NUNIScene
- (BOOL)isAnimating:(id)a3 forKeys:(unint64_t)a4;
- (BOOL)isUpdatable;
- (CLLocationCoordinate2D)offsetCoordinate;
- (NSArray)spheroids;
- (NSDate)date;
- (NUNIScene)initWithSphereoids:(unint64_t)a3 currentDateBlock:(id)a4;
- (NUNIScene)initWithSphereoids:(unint64_t)a3 projectionType:(unint64_t)a4 currentDateBlock:(id)a5;
- (NUNISceneObserver)observer;
- (__n128)cameraPosition;
- (__n128)cameraTarget;
- (__n128)cameraUp;
- (const)structure;
- (double)animatedFloatForKey:(uint64_t)a3;
- (double)cameraOffset;
- (float)cameraOrbit;
- (float)cameraRoll;
- (float)locationDotAlpha;
- (float)locationDotMaximumRadius;
- (float)locationDotPulse;
- (float)locationDotPulseOverrideAlpha;
- (float)restingCameraRoll;
- (float)yearsSince1970;
- (id)currentDateBlock;
- (id)packIntoBlob;
- (id)spheroidOfType:(unint64_t)a3;
- (unint64_t)backgroundType;
- (unint64_t)collectionType;
- (unint64_t)projectionType;
- (unint64_t)snap;
- (void)addAnimation:(id)a3;
- (void)removeAllAnimations;
- (void)removeAllAnimationsFor:(id)a3 withKeys:(unint64_t)a4;
- (void)removeAnimation:(id)a3;
- (void)setAnimatedFloat:(unint64_t)a3 forKey:;
- (void)setBackgroundType:(unint64_t)a3;
- (void)setCamera:(float)a3 target:up:roll:;
- (void)setCameraOffset:(NUNIScene *)self;
- (void)setCameraOrbit:(float)a3;
- (void)setCollectionType:(unint64_t)a3;
- (void)setCurrentDateBlock:(id)a3;
- (void)setLocationDotAlpha:(float)a3;
- (void)setLocationDotMaximumRadius:(float)a3;
- (void)setLocationDotPulse:(float)a3;
- (void)setLocationDotPulseOverrideAlpha:(float)a3;
- (void)setObserver:(id)a3;
- (void)setOffsetCoordinate:(CLLocationCoordinate2D)a3;
- (void)setSnap:(unint64_t)a3;
- (void)setUpdatable:(BOOL)a3;
- (void)unpackFromBlob:(id)a3;
- (void)update:(float)a3;
- (void)updateCamera;
- (void)updateFromDateIfNeeded;
- (void)updateSunLocationAnimated:(BOOL)a3 lightingPreference:(unint64_t)a4 adjustEarthRotation:(BOOL)a5;
- (void)updateSunLocationForDate:(id)a3 animated:(BOOL)a4 lightingPreference:(unint64_t)a5 adjustEarthRotation:(BOOL)a6;
@end

@implementation NUNIScene

- (NUNIScene)initWithSphereoids:(unint64_t)a3 currentDateBlock:(id)a4
{
  return [(NUNIScene *)self initWithSphereoids:a3 projectionType:0 currentDateBlock:a4];
}

- (NUNIScene)initWithSphereoids:(unint64_t)a3 projectionType:(unint64_t)a4 currentDateBlock:(id)a5
{
  int v6 = a3;
  id v8 = a5;
  v29.receiver = self;
  v29.super_class = (Class)NUNIScene;
  v9 = [(NUNIScene *)&v29 init];
  if (v9)
  {
    unint64_t v27 = a4;
    aBlock = v8;
    uint64_t v10 = objc_opt_new();
    spheroids = v9->_spheroids;
    v9->_spheroids = (NSMutableArray *)v10;

    unint64_t v12 = 0;
    v13 = 0;
    v14 = 0;
    while (((1 << v12) & v6) == 0)
    {
LABEL_13:
      if (++v12 == 24)
      {
        uint64_t v20 = objc_opt_new();
        animations = v9->_animations;
        v9->_animations = (NSMutableArray *)v20;

        *(_OWORD *)&v9->_structure.var0 = xmmword_21E8F2250;
        *(_OWORD *)&v9->_structure.var3 = xmmword_21E8F1DC0;
        *(_OWORD *)&v9->_structure.var5 = xmmword_21E8F1DF0;
        *(void *)&v9->_structure.var11 = 2;
        v9->_structure.var8.var0.var0 = 5.7588;
        v9->_anon_78[16] = 1;
        *(void *)&v9->_anon_78[8] = v27;
        *(_DWORD *)&v9->_anon_78[52] = 1097859072;
        [(NUNIScene *)v9 setSnap:24];
        id v8 = aBlock;
        v22 = _Block_copy(aBlock);
        id currentDateBlock = v9->_currentDateBlock;
        v9->_id currentDateBlock = v22;

        v24 = [(NUNIScene *)v9 date];
        [v24 timeIntervalSince1970];
        *(float *)&double v25 = v25 / 31536000.0;
        *(_DWORD *)&v9->_anon_78[20] = LODWORD(v25);

        goto LABEL_17;
      }
    }
    v15 = 0;
    if (v12 <= 9)
    {
      v16 = v14;
      if (((1 << v12) & 0x3EE) != 0)
      {
LABEL_6:
        v15 = v16;
        goto LABEL_7;
      }
      if (v12 == 4)
      {
        v16 = v13;
        goto LABEL_6;
      }
    }
LABEL_7:
    v17 = [[NUNISpheroid alloc] initWithScene:v9 parent:v15 type:v12];
    [(NSMutableArray *)v9->_spheroids addObject:v17];
    if (v12)
    {
      if (v12 != 3)
      {
LABEL_12:

        goto LABEL_13;
      }
      v18 = v13;
      v13 = v17;
    }
    else
    {
      v18 = v14;
      v14 = v17;
    }
    v19 = v17;

    goto LABEL_12;
  }
LABEL_17:

  return v9;
}

- (void)updateCamera
{
  DWORD2(v12) = 0;
  *(void *)&long long v12 = 0;
  DWORD2(v11) = 0;
  *(void *)&long long v11 = 0;
  if (*(void *)&self->_structure.var9 == 24)
  {
    float var1 = self->_structure.var8.var0.var1;
    *(void *)&long long v5 = 0x3F0000003F000000;
    HIDWORD(v5) = 1056964608;
    *((float *)&v5 + 2) = self->_structure.var8.var0.var0 * 0.5;
    long long v11 = xmmword_21E8F1DC0;
    long long v12 = v5;
    double v6 = 0.0078125;
    double v7 = 0.0000305175853;
  }
  else
  {
    id v8 = -[NUNIScene spheroidOfType:](self, "spheroidOfType:");
    v9 = (*((void (**)(void))self->_currentDateBlock + 2))();
    [v8 date:v9 toCameraPosition:&v12 toCameraTarget:&v11];

    [(NUNIScene *)self restingCameraRoll];
    float var1 = v10 + self->_structure.var8.var0.var1;

    double v7 = *(double *)&v11;
    *(void *)&long long v5 = v12;
    double v6 = 0.0;
  }
  *(float *)&double v2 = var1;
  -[NUNIScene setCamera:target:up:roll:](self, "setCamera:target:up:roll:", *(double *)&v5, v7, v6, v2, v11, v12);
}

- (float)restingCameraRoll
{
  return 0.0;
}

- (double)animatedFloatForKey:(uint64_t)a3
{
  switch(a3)
  {
    case 0:
      long long v3 = *(_OWORD *)(a1 + 48);
      return *(double *)&v3;
    case 1:
      long long v3 = *(_OWORD *)(a1 + 64);
      return *(double *)&v3;
    case 2:
      long long v3 = *(_OWORD *)(a1 + 80);
      return *(double *)&v3;
    case 3:
      v4 = (const float *)(a1 + 100);
      goto LABEL_15;
    case 4:
      v4 = (const float *)(a1 + 140);
      goto LABEL_15;
    case 5:
      v4 = (const float *)(a1 + 96);
      goto LABEL_15;
    case 6:
      *(void *)&long long v3 = *(void *)(a1 + 144);
      return *(double *)&v3;
    case 7:
      *(void *)&long long v3 = *(void *)(a1 + 152);
      return *(double *)&v3;
    case 8:
      v4 = (const float *)(a1 + 160);
      goto LABEL_15;
    case 9:
      v4 = (const float *)(a1 + 164);
      goto LABEL_15;
    case 10:
      v4 = (const float *)(a1 + 168);
LABEL_15:
      *(void *)&long long v3 = vld1q_dup_f32(v4).u64[0];
      break;
    default:
      *(void *)&long long v3 = 0;
      break;
  }
  return *(double *)&v3;
}

- (void)setAnimatedFloat:(unint64_t)a3 forKey:
{
  switch(a3)
  {
    case 0uLL:
      *(float32x4_t *)&self->_structure.var0 = _Q0;
      break;
    case 1uLL:
      *(float32x4_t *)&self->_structure.var3 = _Q0;
      break;
    case 2uLL:
      _Q1 = vmulq_f32(_Q0, _Q0);
      _S2 = _Q0.i32[2];
      __asm { FMLA            S1, S2, V0.S[2] }
      _Q1.f32[0] = sqrtf(_Q1.f32[0]);
      *(float32x4_t *)&self->_structure.var5 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
      break;
    case 3uLL:
      LODWORD(self->_structure.var8.var0.var1) = _Q0.i32[0];
      break;
    case 4uLL:
      *(_DWORD *)&self->_anon_78[20] = _Q0.i32[0];
      break;
    case 5uLL:
      LODWORD(self->_structure.var8.var0.var0) = _Q0.i32[0];
      [(NUNIScene *)self updateCamera];
      break;
    case 6uLL:
      *(void *)&self->_anon_78[24] = _Q0.i64[0];
      break;
    case 7uLL:
      *(void *)&self->_anon_78[32] = _Q0.i64[0];
      break;
    case 8uLL:
      *(_DWORD *)&self->_anon_78[40] = _Q0.i32[0];
      break;
    case 9uLL:
      *(_DWORD *)&self->_anon_78[44] = _Q0.i32[0];
      break;
    case 0xAuLL:
      *(_DWORD *)&self->_anon_78[48] = _Q0.i32[0];
      break;
    default:
      return;
  }
}

- (void)update:(float)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v6 = self->_animations;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        *(float *)&double v8 = a3;
        if ((objc_msgSend(v12, "update:", v8, (void)v15) & 1) == 0)
        {
          objc_msgSend(v5, "addIndex:", -[NSMutableArray indexOfObject:](self->_animations, "indexOfObject:", v12));
          v13 = [v12 observer];
          [v13 astronomyAnimationFinished:v12];
        }
      }
      uint64_t v9 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  if ([v5 count])
  {
    [(NSMutableArray *)self->_animations removeObjectsAtIndexes:v5];
    if (![(NSMutableArray *)self->_animations count])
    {
      v14 = [(NUNIScene *)self observer];
      [v14 astronomySceneAnimationFinished:self];
    }
  }
}

- (BOOL)isAnimating:(id)a3 forKeys:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = self->_animations;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        char v13 = objc_msgSend(v12, "key", (void)v17);
        id v14 = [v12 animatable];
        if (v14 == v6)
        {
          BOOL v15 = 1;

          if (((1 << v13) & ~a4) == 0) {
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
  BOOL v15 = 0;
LABEL_12:

  return v15;
}

- (void)addAnimation:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 key];
  id v6 = [v4 animatable];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = self->_animations;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "key", (void)v15) == v5)
        {
          char v13 = [v12 animatable];

          if (v13 == v6)
          {
            id v14 = v12;

            if (v14) {
              [(NUNIScene *)self removeAnimation:v14];
            }
            goto LABEL_13;
          }
        }
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v14 = 0;
LABEL_13:
  -[NSMutableArray addObject:](self->_animations, "addObject:", v4, (void)v15);
}

- (void)removeAllAnimations
{
}

- (void)removeAllAnimationsFor:(id)a3 withKeys:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v16 = self;
  uint64_t v7 = self->_animations;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v7);
        }
        char v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        char v14 = [v13 key];
        id v15 = [v13 animatable];
        if (v15 == v6)
        {

          if (((1 << v14) & ~a4) == 0)
          {
            if (!v10) {
              uint64_t v10 = objc_opt_new();
            }
            objc_msgSend(v10, "addIndex:", -[NSMutableArray indexOfObject:](v16->_animations, "indexOfObject:", v13));
          }
        }
        else
        {
        }
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  if ([v10 count]) {
    [(NSMutableArray *)v16->_animations removeObjectsAtIndexes:v10];
  }
}

- (void)removeAnimation:(id)a3
{
}

- (NSDate)date
{
  return (NSDate *)(*((uint64_t (**)(void))self->_currentDateBlock + 2))();
}

- (void)updateSunLocationAnimated:(BOOL)a3 lightingPreference:(unint64_t)a4 adjustEarthRotation:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = a3;
  id v9 = [(NUNIScene *)self date];
  [(NUNIScene *)self updateSunLocationForDate:v9 animated:v7 lightingPreference:a4 adjustEarthRotation:v5];
}

- (void)updateSunLocationForDate:(id)a3 animated:(BOOL)a4 lightingPreference:(unint64_t)a5 adjustEarthRotation:(BOOL)a6
{
  BOOL v63 = a6;
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v8 = a3;
  self->_isUpdateNeeded = 0;
  [v8 timeIntervalSince1970];
  v10.i32[1] = 1098781496;
  *(float *)v10.i32 = v9 / 31536000.0;
  if (a4)
  {
    if (*(float *)&self->_anon_78[20] != *(float *)v10.i32)
    {
      int32x2_t v69 = v10;
      uint64_t v11 = [NUNIAnimation alloc];
      long long v12 = (const float *)&self->_anon_78[20];
      *(void *)&double v13 = vld1q_dup_f32(v12).u64[0];
      char v14 = [(NUNIAnimation *)v11 initWithAnimatable:self from:4 to:v13 key:*(double *)vdupq_lane_s32(v69, 0).i64];
      [(NUNIScene *)self addAnimation:v14];
    }
  }
  else
  {
    float v70 = v9 / 31536000.0;
    [(NUNIScene *)self removeAllAnimationsFor:self withKeys:16];
    *(float *)&self->_anon_78[20] = v70;
  }
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  obj = self->_spheroids;
  uint64_t v15 = [(NSMutableArray *)obj countByEnumeratingWithState:&v76 objects:v80 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v77;
    float32x2_t v18 = (float32x2_t)vdup_n_s32(0x40C90FDBu);
    float32x2_t v19 = (float32x2_t)vdup_n_s32(0xC0C90FDB);
    float32x2_t v20 = (float32x2_t)vdup_n_s32(0x40490FDBu);
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v77 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        if (a4)
        {
          uint64_t v23 = [*(id *)(*((void *)&v76 + 1) + 8 * i) structure];
          *(float *)v24.i32 = *(float *)(v23 + 16) + (float)(floorf(*(float *)(v23 + 16) / 6.2832) * -6.2832);
          int32x2_t v64 = v24;
          *(float *)v24.i32 = *(float *)(v23 + 20) + (float)(floorf(*(float *)(v23 + 20) / 6.2832) * -6.2832);
          int32x2_t v71 = v24;
          float32x2_t v25 = *(float32x2_t *)(v23 + 112);
          float32x2_t v26 = vrndm_f32(vdiv_f32(v25, v18));
          float32x2_t v27 = vmla_f32(v25, v19, v26);
          v26.i32[0] = *(_DWORD *)(v23 + 8);
          int32x2_t v65 = (int32x2_t)v26;
          v26.i32[0] = *(_DWORD *)(v23 + 84);
          int32x2_t v66 = (int32x2_t)v26;
          double v67 = *(double *)&v27;
          uint64_t v74 = 0;
          unint64_t v75 = 0;
          float32x2_t v73 = 0;
          NUNIComputeSpheroidTransformParameters(v22, v8, (float *)&v75, (float *)&v75 + 1, &v73, (float *)&v74 + 1, (float *)&v74, v63);
          float v28 = *((float *)&v75 + 1) + (float)(floorf(*((float *)&v75 + 1) / 6.2832) * -6.2832);
          float v29 = vabds_f32(v28, *(float *)v64.i32);
          if (v28 <= *(float *)v64.i32) {
            float v30 = 6.2832;
          }
          else {
            float v30 = -6.2832;
          }
          if (v29 <= 3.1416) {
            float v31 = -0.0;
          }
          else {
            float v31 = v30;
          }
          float v32 = v28 + v31;
          float v33 = *(float *)&v75 + (float)(floorf(*(float *)&v75 / 6.2832) * -6.2832);
          float v34 = vabds_f32(v33, *(float *)v71.i32);
          if (v33 <= *(float *)v71.i32) {
            float v35 = 6.2832;
          }
          else {
            float v35 = -6.2832;
          }
          if (v34 <= 3.1416) {
            float v36 = -0.0;
          }
          else {
            float v36 = v35;
          }
          float v37 = v33 + v36;
          unint64_t v75 = __PAIR64__(LODWORD(v32), LODWORD(v37));
          float32x2_t v38 = vmla_f32(v73, v19, vrndm_f32(vdiv_f32(v73, v18)));
          float32x2_t v73 = vadd_f32(v38, (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(vabd_f32(v38, *(float32x2_t *)&v67), v20), vbsl_s8((int8x8_t)vcgt_f32(v38, *(float32x2_t *)&v67), (int8x8_t)v19, (int8x8_t)v18), (int8x8_t)0x8000000080000000));
          if (*(float *)v64.i32 != v32)
          {
            v39 = [NUNIAnimation alloc];
            v40 = (const float *)&v75 + 1;
            *(void *)&double v41 = vld1q_dup_f32(v40).u64[0];
            v42 = [(NUNIAnimation *)v39 initWithAnimatable:v22 from:8 to:*(double *)vdupq_lane_s32(v64, 0).i64 key:v41];
            [(NUNIScene *)self addAnimation:v42];

            LODWORD(v37) = v75;
          }
          if (*(float *)v71.i32 != v37)
          {
            v43 = [NUNIAnimation alloc];
            v44 = (const float *)&v75;
            *(void *)&double v45 = vld1q_dup_f32(v44).u64[0];
            v46 = [(NUNIAnimation *)v43 initWithAnimatable:v22 from:1 to:*(double *)vdupq_lane_s32(v71, 0).i64 key:v45];
            [(NUNIScene *)self addAnimation:v46];
          }
          int8x8_t v47 = vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&v67, v73));
          if (v47.i8[0] & 1) != 0 || (v47.i8[4])
          {
            v48 = [NUNIAnimation alloc];
            v49 = [(NUNIAnimation *)v48 initWithAnimatable:v22 from:3 to:v67 key:*(double *)&v73];
            [(NUNIScene *)self addAnimation:v49];
          }
          if (*(float *)v65.i32 != *((float *)&v74 + 1))
          {
            v50 = [NUNIAnimation alloc];
            v51 = (const float *)&v74 + 1;
            *(void *)&double v52 = vld1q_dup_f32(v51).u64[0];
            v53 = [(NUNIAnimation *)v50 initWithAnimatable:v22 from:4 to:*(double *)vdupq_lane_s32(v65, 0).i64 key:v52];
            [(NUNIScene *)self addAnimation:v53];
          }
          if (*(float *)v66.i32 != *(float *)&v74)
          {
            v54 = [NUNIAnimation alloc];
            v55 = (const float *)&v74;
            *(void *)&double v56 = vld1q_dup_f32(v55).u64[0];
            v57 = [(NUNIAnimation *)v54 initWithAnimatable:v22 from:6 to:*(double *)vdupq_lane_s32(v66, 0).i64 key:v56];
            [(NUNIScene *)self addAnimation:v57];
          }
          if (((1 << *(_DWORD *)v23) & 0x3E6) != 0)
          {
            double v72 = *(double *)(v23 + 144);
            uint64_t v58 = NUNIComputeSpheroidIdealHomeCoordinate(a5, v73.f32[0], *(float *)&v75);
            float v59 = *(float *)&v58;
            double v68 = *(double *)&v58;
            objc_msgSend(v22, "setHomeCoordinate:", *((float *)&v58 + 1), *(float *)&v58);
            if (*(float *)&v72 != v59
              || (vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&v72, *(float32x2_t *)&v68)).i32[1] & 1) != 0)
            {
              v60 = [[NUNIAnimation alloc] initWithAnimatable:v22 from:10 to:v72 key:v68];
              [(NUNIScene *)self addAnimation:v60];
            }
          }
        }
        else
        {
          [(NUNIScene *)self removeAllAnimationsFor:*(void *)(*((void *)&v76 + 1) + 8 * i) withKeys:282];
          [v22 updateSunLocationForDate:v8 lightingPreference:a5 adjustEarthRotation:v63];
        }
      }
      uint64_t v16 = [(NSMutableArray *)obj countByEnumeratingWithState:&v76 objects:v80 count:16];
    }
    while (v16);
  }
}

- (id)spheroidOfType:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_spheroids;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "type", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)updateFromDateIfNeeded
{
  if (self->_isUpdateNeeded)
  {
    if (self->_anon_78[16])
    {
      [(NUNIScene *)self updateSunLocationAnimated:0 lightingPreference:1 adjustEarthRotation:1];
      self->_isUpdateNeeded = 0;
    }
  }
}

- (void)setCamera:(float)a3 target:up:roll:
{
  float v6 = v5;
  long long v9 = v3;
  long long v10 = v4;
  __n128 v11 = *(__n128 *)&a3;
  id v8 = NUNILoggingObjectForDomain(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[NUNIScene setCamera:target:up:roll:](v8, v11);
  }

  *(__n128 *)&self->_structure.var0 = v11;
  *(_OWORD *)&self->_structure.var3 = v9;
  *(_OWORD *)&self->_structure.var5 = v10;
  self->_structure.var8.var0.float var1 = v6;
}

- (__n128)cameraPosition
{
  return a1[3];
}

- (__n128)cameraTarget
{
  return a1[4];
}

- (__n128)cameraUp
{
  return a1[5];
}

- (float)cameraRoll
{
  return self->_structure.var8.var0.var1;
}

- (unint64_t)projectionType
{
  return *(void *)&self->_anon_78[8];
}

- (float)yearsSince1970
{
  return *(float *)&self->_anon_78[20];
}

- (const)structure
{
  return &self->_structure;
}

- (float)cameraOrbit
{
  return self->_structure.var8.var0.var0;
}

- (unint64_t)snap
{
  return *(void *)&self->_structure.var9;
}

- (unint64_t)backgroundType
{
  return *(void *)&self->_structure.var11;
}

- (unint64_t)collectionType
{
  return *(void *)self->_anon_78;
}

- (double)cameraOffset
{
  return *(double *)(a1 + 144);
}

- (CLLocationCoordinate2D)offsetCoordinate
{
  double v2 = *(float *)&self->_anon_78[36];
  double v3 = *(float *)&self->_anon_78[32];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (float)locationDotAlpha
{
  return *(float *)&self->_anon_78[40];
}

- (float)locationDotPulse
{
  return *(float *)&self->_anon_78[44];
}

- (float)locationDotPulseOverrideAlpha
{
  return *(float *)&self->_anon_78[48];
}

- (float)locationDotMaximumRadius
{
  return *(float *)&self->_anon_78[52];
}

- (BOOL)isUpdatable
{
  return self->_anon_78[16];
}

- (void)setCameraOrbit:(float)a3
{
  self->_structure.var8.var0.var0 = a3;
}

- (void)setBackgroundType:(unint64_t)a3
{
  *(void *)&self->_structure.var11 = a3;
}

- (void)setCollectionType:(unint64_t)a3
{
  *(void *)self->_anon_78 = a3;
}

- (void)setCameraOffset:(NUNIScene *)self
{
  *(void *)&self->_anon_78[24] = v2;
}

- (void)setOffsetCoordinate:(CLLocationCoordinate2D)a3
{
  float longitude = a3.longitude;
  float latitude = a3.latitude;
  *(float *)&self->_anon_78[32] = longitude;
  *(float *)&self->_anon_78[36] = latitude;
}

- (void)setLocationDotAlpha:(float)a3
{
  *(float *)&self->_anon_78[40] = a3;
}

- (void)setLocationDotPulse:(float)a3
{
  *(float *)&self->_anon_78[44] = a3;
}

- (void)setLocationDotPulseOverrideAlpha:(float)a3
{
  *(float *)&self->_anon_78[48] = a3;
}

- (void)setLocationDotMaximumRadius:(float)a3
{
  *(float *)&self->_anon_78[52] = a3;
}

- (void)setUpdatable:(BOOL)a3
{
  self->_anon_78[16] = a3;
}

- (void)setSnap:(unint64_t)a3
{
  if (*(void *)&self->_structure.var9 != a3)
  {
    *(void *)&self->_structure.var9 = a3;
    [(NUNIScene *)self updateCamera];
  }
}

- (id)packIntoBlob
{
  double v3 = self->_spheroids;
  uint64_t v4 = [(NSMutableArray *)v3 count];
  id v5 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:160 * v4 + 144];
  uint64_t v6 = [v5 mutableBytes];
  uint64_t v7 = [(NUNIScene *)self structure];
  long long v8 = *(_OWORD *)&v7->var0;
  long long v9 = *(_OWORD *)&v7->var3;
  long long v10 = *(_OWORD *)&v7->var8.var0.var0;
  *(_OWORD *)(v6 + 32) = *(_OWORD *)&v7->var5;
  *(_OWORD *)(v6 + 48) = v10;
  *(_OWORD *)uint64_t v6 = v8;
  *(_OWORD *)(v6 + 16) = v9;
  long long v11 = *(_OWORD *)&v7->var11;
  long long v12 = *(_OWORD *)&v7[1].var2;
  long long v13 = *(_OWORD *)&v7[1].var6;
  *(_OWORD *)(v6 + 96) = *(_OWORD *)&v7[1].var4;
  *(_OWORD *)(v6 + 112) = v13;
  *(_OWORD *)(v6 + 64) = v11;
  *(_OWORD *)(v6 + 80) = v12;
  *(_DWORD *)(v6 + 128) = v4;
  if (v4)
  {
    uint64_t v14 = 0;
    long long v15 = (_OWORD *)(v6 + 144);
    do
    {
      uint64_t v16 = [(NSMutableArray *)v3 objectAtIndex:v14];
      uint64_t v17 = (_OWORD *)[v16 structure];
      long long v18 = v17[1];
      _OWORD *v15 = *v17;
      v15[1] = v18;
      long long v19 = v17[5];
      long long v21 = v17[2];
      long long v20 = v17[3];
      v15[4] = v17[4];
      v15[5] = v19;
      v15[2] = v21;
      v15[3] = v20;
      long long v22 = v17[9];
      long long v24 = v17[6];
      long long v23 = v17[7];
      v15[8] = v17[8];
      v15[9] = v22;
      v15[6] = v24;
      v15[7] = v23;

      ++v14;
      v15 += 10;
    }
    while (v4 != v14);
  }

  return v5;
}

- (void)unpackFromBlob:(id)a3
{
  id v4 = a3;
  id v5 = self->_spheroids;
  uint64_t v6 = [(NSMutableArray *)v5 count];
  id v25 = v4;
  uint64_t v7 = (long long *)[v25 bytes];
  long long v8 = v7[3];
  long long v10 = *v7;
  long long v9 = v7[1];
  *(_OWORD *)&self->_structure.var5 = v7[2];
  *(_OWORD *)&self->_structure.var8.var0.var0 = v8;
  *(_OWORD *)&self->_structure.var0 = v10;
  *(_OWORD *)&self->_structure.var3 = v9;
  long long v11 = v7[7];
  long long v13 = v7[4];
  long long v12 = v7[5];
  *(_OWORD *)&self->_anon_78[24] = v7[6];
  *(_OWORD *)&self->_anon_78[40] = v11;
  *(_OWORD *)&self->_structure.var11 = v13;
  *(_OWORD *)&self->_anon_78[8] = v12;
  if (v6)
  {
    uint64_t v14 = 0;
    long long v15 = v7 + 9;
    do
    {
      uint64_t v16 = [(NSMutableArray *)v5 objectAtIndex:v14];
      uint64_t v17 = (_OWORD *)[v16 structure];
      long long v18 = v15[1];
      _OWORD *v17 = *v15;
      v17[1] = v18;
      long long v19 = v15[5];
      long long v21 = v15[2];
      long long v20 = v15[3];
      v17[4] = v15[4];
      v17[5] = v19;
      v17[2] = v21;
      v17[3] = v20;
      long long v22 = v15[9];
      long long v24 = v15[6];
      long long v23 = v15[7];
      v17[8] = v15[8];
      v17[9] = v22;
      v17[6] = v24;
      v17[7] = v23;

      ++v14;
      v15 += 10;
    }
    while (v6 != v14);
  }
}

- (NUNISceneObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (NUNISceneObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (NSArray)spheroids
{
  return &self->_spheroids->super;
}

- (id)currentDateBlock
{
  return self->_currentDateBlock;
}

- (void)setCurrentDateBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong(&self->_currentDateBlock, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong((id *)&self->_spheroids, 0);
}

- (void)setCamera:(os_log_t)log target:(__n128)a2 up:roll:.cold.1(os_log_t log, __n128 a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 134218496;
  double v3 = a2.n128_f32[0];
  __int16 v4 = 2048;
  double v5 = a2.n128_f32[1];
  __int16 v6 = 2048;
  double v7 = a2.n128_f32[2];
  _os_log_debug_impl(&dword_21E8AA000, log, OS_LOG_TYPE_DEBUG, "Camera position %f, %f, %f", (uint8_t *)&v2, 0x20u);
}

@end