@interface NUNIScene
- (BOOL)isAnimating:(id)a3 forKeys:(unint64_t)a4;
- (BOOL)isUpdatable;
- (CLLocationCoordinate2D)offsetCoordinate;
- (NSArray)spheroids;
- (NSDate)date;
- (NUNIScene)initWithSphereoids:(unint64_t)a3 currentDateBlock:(id)a4;
- (NUNIScene)initWithSphereoids:(unint64_t)a3 projectionType:(unint64_t)a4 currentDateBlock:(id)a5;
- (NUNISpheroid)focus;
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
- (id)spheroidOfType:(unint64_t)a3;
- (unint64_t)backgroundType;
- (unint64_t)collectionType;
- (unint64_t)projectionType;
- (unint64_t)snap;
- (void)addAnimation:(id)a3;
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
- (void)setOffsetCoordinate:(CLLocationCoordinate2D)a3;
- (void)setSnap:(unint64_t)a3;
- (void)setUpdatable:(BOOL)a3;
- (void)update:(float)a3;
- (void)updateCamera;
- (void)updateFromDateIfNeeded;
- (void)updateSunLocationAnimated:(BOOL)a3;
- (void)updateSunLocationForDate:(id)a3 animated:(BOOL)a4;
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

        *(_OWORD *)&v9->_structure.var0 = xmmword_1B4856020;
        *(_OWORD *)&v9->_structure.var3 = xmmword_1B48559B0;
        *(_OWORD *)&v9->_structure.var5 = xmmword_1B48559E0;
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
  DWORD2(v10) = 0;
  *(void *)&long long v10 = 0;
  DWORD2(v9) = 0;
  *(void *)&long long v9 = 0;
  if (*(void *)&self->_structure.var9 == 24)
  {
    *(float *)&double v2 = self->_structure.var8.var0.var1;
    *(void *)&long long v4 = 0x3F0000003F000000;
    HIDWORD(v4) = 1056964608;
    *((float *)&v4 + 2) = self->_structure.var8.var0.var0 * 0.5;
    long long v9 = xmmword_1B48559B0;
    long long v10 = v4;
    double v5 = 0.0078125;
    double v6 = 0.0000305175853;
  }
  else
  {
    focus = self->_focus;
    id v8 = (*((void (**)(void))self->_currentDateBlock + 2))();
    [(NUNISpheroid *)focus date:v8 toCameraPosition:&v10 toCameraTarget:&v9];

    [(NUNIScene *)self restingCameraRoll];
    *(float *)&double v2 = *(float *)&v4 + self->_structure.var8.var0.var1;
    double v6 = *(double *)&v9;
    *(void *)&long long v4 = v10;
    double v5 = 0.0;
  }
  -[NUNIScene setCamera:target:up:roll:](self, "setCamera:target:up:roll:", *(double *)&v4, v6, v5, v2, v9, v10);
}

- (float)restingCameraRoll
{
  if (*(void *)&self->_structure.var9 == 4
    && ([(NUNIScene *)self spheroidOfType:3],
        double v2 = objc_claimAutoreleasedReturnValue(),
        [v2 homeCoordinate],
        double v4 = v3,
        v2,
        v4 < 0.0))
  {
    return 3.1416;
  }
  else
  {
    return 0.0;
  }
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
      double v4 = (const float *)(a1 + 100);
      goto LABEL_15;
    case 4:
      double v4 = (const float *)(a1 + 140);
      goto LABEL_15;
    case 5:
      double v4 = (const float *)(a1 + 96);
      goto LABEL_15;
    case 6:
      *(void *)&long long v3 = *(void *)(a1 + 144);
      return *(double *)&v3;
    case 7:
      *(void *)&long long v3 = *(void *)(a1 + 152);
      return *(double *)&v3;
    case 8:
      double v4 = (const float *)(a1 + 160);
      goto LABEL_15;
    case 9:
      double v4 = (const float *)(a1 + 164);
      goto LABEL_15;
    case 10:
      double v4 = (const float *)(a1 + 168);
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
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v6 = self->_animations;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        unint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        *(float *)&double v8 = a3;
        if ((objc_msgSend(v12, "update:", v8, (void)v14) & 1) == 0)
        {
          objc_msgSend(v5, "addIndex:", -[NSMutableArray indexOfObject:](self->_animations, "indexOfObject:", v12));
          v13 = [v12 observer];
          [v13 universeAnimationFinished:v12];
        }
      }
      uint64_t v9 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  if ([v5 count]) {
    [(NSMutableArray *)self->_animations removeObjectsAtIndexes:v5];
  }
}

- (BOOL)isAnimating:(id)a3 forKeys:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
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
        unint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
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
  uint64_t v20 = *MEMORY[0x1E4F143B8];
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
        unint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
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

- (void)removeAllAnimationsFor:(id)a3 withKeys:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
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
  id v5 = a3;
  id v4 = [v5 observer];
  [v4 universeAnimationRemoved:v5];

  [(NSMutableArray *)self->_animations removeObject:v5];
}

- (NSDate)date
{
  return (NSDate *)(*((uint64_t (**)(void))self->_currentDateBlock + 2))();
}

- (void)updateSunLocationAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NUNIScene *)self date];
  [(NUNIScene *)self updateSunLocationForDate:v5 animated:v3];
}

- (void)updateSunLocationForDate:(id)a3 animated:(BOOL)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  self->_isUpdateNeeded = 0;
  [v6 timeIntervalSince1970];
  v8.i32[1] = 1098781496;
  *(float *)v8.i32 = v7 / 31536000.0;
  if (a4)
  {
    if (*(float *)&self->_anon_78[20] != *(float *)v8.i32)
    {
      int32x2_t v64 = v8;
      uint64_t v9 = [NUNIAnimation alloc];
      uint64_t v10 = (const float *)&self->_anon_78[20];
      *(void *)&double v11 = vld1q_dup_f32(v10).u64[0];
      unint64_t v12 = [(NUNIAnimation *)v9 initWithAnimatable:self from:4 to:v11 key:*(double *)vdupq_lane_s32(v64, 0).i64];
      [(NUNIScene *)self addAnimation:v12];
    }
  }
  else
  {
    float v65 = v7 / 31536000.0;
    [(NUNIScene *)self removeAllAnimationsFor:self withKeys:16];
    *(float *)&self->_anon_78[20] = v65;
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  char v13 = self->_spheroids;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v70 objects:v74 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v71;
    float32x2_t v17 = (float32x2_t)vdup_n_s32(0x40C90FDBu);
    float32x2_t v18 = (float32x2_t)vdup_n_s32(0xC0C90FDB);
    float32x2_t v19 = (float32x2_t)vdup_n_s32(0x40490FDBu);
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v71 != v16) {
          objc_enumerationMutation(v13);
        }
        v21 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        if (a4)
        {
          [*(id *)(*((void *)&v70 + 1) + 8 * i) angle];
          *(float *)v23.i32 = v22 + (float)(floorf(v22 / 6.2832) * -6.2832);
          int32x2_t v60 = v23;
          [v21 equatorRotation];
          *(float *)v25.i32 = v24 + (float)(floorf(v24 / 6.2832) * -6.2832);
          int32x2_t v66 = v25;
          [v21 light];
          float32x2_t v63 = vmla_f32(v26, v18, vrndm_f32(vdiv_f32(v26, v17)));
          [v21 distance];
          int32x2_t v61 = v27;
          [v21 radius];
          int32x2_t v62 = v28;
          uint64_t v68 = 0;
          unint64_t v69 = 0;
          float32x2_t v67 = 0;
          [v21 date:v6 toEquatorRotation:&v69 toAngle:(char *)&v69 + 4 toLight:&v67 toDistance:(char *)&v68 + 4 toRadius:&v68];
          float v29 = *((float *)&v69 + 1) + (float)(floorf(*((float *)&v69 + 1) / 6.2832) * -6.2832);
          float v30 = vabds_f32(v29, *(float *)v60.i32);
          if (v29 <= *(float *)v60.i32) {
            float v31 = 6.2832;
          }
          else {
            float v31 = -6.2832;
          }
          if (v30 <= 3.1416) {
            float v32 = -0.0;
          }
          else {
            float v32 = v31;
          }
          float v33 = v29 + v32;
          float v34 = *(float *)&v69 + (float)(floorf(*(float *)&v69 / 6.2832) * -6.2832);
          float v35 = vabds_f32(v34, *(float *)v66.i32);
          if (v34 <= *(float *)v66.i32) {
            float v36 = 6.2832;
          }
          else {
            float v36 = -6.2832;
          }
          if (v35 <= 3.1416) {
            float v37 = -0.0;
          }
          else {
            float v37 = v36;
          }
          float v38 = v34 + v37;
          unint64_t v69 = __PAIR64__(LODWORD(v33), LODWORD(v38));
          float32x2_t v39 = vmla_f32(v67, v18, vrndm_f32(vdiv_f32(v67, v17)));
          float32x2_t v67 = vadd_f32(v39, (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(vabd_f32(v39, v63), v19), vbsl_s8((int8x8_t)vcgt_f32(v39, v63), (int8x8_t)v18, (int8x8_t)v17), (int8x8_t)0x8000000080000000));
          if (*(float *)v60.i32 != v33)
          {
            v40 = [NUNIAnimation alloc];
            v41 = (const float *)&v69 + 1;
            *(void *)&double v42 = vld1q_dup_f32(v41).u64[0];
            v43 = [(NUNIAnimation *)v40 initWithAnimatable:v21 from:7 to:*(double *)vdupq_lane_s32(v60, 0).i64 key:v42];
            [(NUNIScene *)self addAnimation:v43];

            LODWORD(v38) = v69;
          }
          if (*(float *)v66.i32 != v38)
          {
            v44 = [NUNIAnimation alloc];
            v45 = (const float *)&v69;
            *(void *)&double v46 = vld1q_dup_f32(v45).u64[0];
            v47 = [(NUNIAnimation *)v44 initWithAnimatable:v21 from:1 to:*(double *)vdupq_lane_s32(v66, 0).i64 key:v46];
            [(NUNIScene *)self addAnimation:v47];
          }
          double v48 = COERCE_DOUBLE(vmvn_s8((int8x8_t)vceq_f32(v63, v67)));
          if (LOBYTE(v48) & 1) != 0 || (BYTE4(v48))
          {
            v49 = [NUNIAnimation alloc];
            v50 = [(NUNIAnimation *)v49 initWithAnimatable:v21 from:3 to:*(double *)&v63 key:*(double *)&v67];
            [(NUNIScene *)self addAnimation:v50];
          }
          if (*(float *)v61.i32 != *((float *)&v68 + 1))
          {
            v51 = [NUNIAnimation alloc];
            v52 = (const float *)&v68 + 1;
            *(void *)&double v53 = vld1q_dup_f32(v52).u64[0];
            v54 = [(NUNIAnimation *)v51 initWithAnimatable:v21 from:4 to:*(double *)vdupq_lane_s32(v61, 0).i64 key:v53];
            [(NUNIScene *)self addAnimation:v54];
          }
          LODWORD(v48) = v68;
          double v55 = *(double *)&v62;
          if (*(float *)v62.i32 != *(float *)&v68)
          {
            v56 = [NUNIAnimation alloc];
            v57 = (const float *)&v68;
            *(void *)&double v58 = vld1q_dup_f32(v57).u64[0];
            v59 = [(NUNIAnimation *)v56 initWithAnimatable:v21 from:5 to:*(double *)vdupq_lane_s32(v62, 0).i64 key:v58];
            [(NUNIScene *)self addAnimation:v59];
          }
        }
        else
        {
          [(NUNIScene *)self removeAllAnimationsFor:*(void *)(*((void *)&v70 + 1) + 8 * i) withKeys:154];
          [v21 updateSunLocationForDate:v6];
        }
      }
      uint64_t v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v70, v74, 16, v48, v55);
    }
    while (v15);
  }
}

- (id)spheroidOfType:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
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
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
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
      [(NUNIScene *)self updateSunLocationAnimated:0];
      self->_isUpdateNeeded = 0;
    }
  }
}

- (void)setCamera:(float)a3 target:up:roll:
{
  *(_OWORD *)&self->_structure.var0 = *(_OWORD *)&a3;
  *(_OWORD *)&self->_structure.var3 = v3;
  *(_OWORD *)&self->_structure.var5 = v4;
  self->_structure.var8.var0.var1 = v5;
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
    if (a3 == 24)
    {
      focus = self->_focus;
      self->_focus = 0;
    }
    else
    {
      -[NUNIScene spheroidOfType:](self, "spheroidOfType:");
      float v5 = (NUNISpheroid *)objc_claimAutoreleasedReturnValue();
      focus = self->_focus;
      self->_focus = v5;
    }

    [(NUNIScene *)self updateCamera];
  }
}

- (NUNISpheroid)focus
{
  return self->_focus;
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
  objc_storeStrong((id *)&self->_focus, 0);
  objc_storeStrong(&self->_currentDateBlock, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong((id *)&self->_spheroids, 0);
}

@end