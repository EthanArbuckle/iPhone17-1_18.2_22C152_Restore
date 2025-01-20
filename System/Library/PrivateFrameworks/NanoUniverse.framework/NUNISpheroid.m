@interface NUNISpheroid
- (BOOL)isFacing;
- (BOOL)isVisible;
- (CLLocationCoordinate2D)centerCoordinate;
- (CLLocationCoordinate2D)homeCoordinate;
- (NUNIScene)scene;
- (NUNISpheroid)initWithScene:(id)a3 parent:(id)a4 type:(unint64_t)a5;
- (NUNISpheroid)parent;
- (__n128)colorize;
- (__n128)orientation;
- (__n128)position;
- (__n128)setOrientation:(__n128 *)result;
- (const)structure;
- (double)animatedFloatForKey:(uint64_t)a3;
- (double)light;
- (float)angle;
- (float)blend;
- (float)cloudOpacity;
- (float)distance;
- (float)distanceScale;
- (float)equatorRotation;
- (float)opacity;
- (float)radius;
- (float)radiusScale;
- (unint64_t)programType;
- (unint64_t)spriteType;
- (unint64_t)type;
- (void)_updateCamera;
- (void)_updatePositionFromAngle;
- (void)date:(NUNISpheroid *)self toCameraPosition:(SEL)a2 toCameraTarget:(id)a3;
- (void)setAngle:(float)a3;
- (void)setAnimatedFloat:(unint64_t)a3 forKey:;
- (void)setCenterCoordinate:(CLLocationCoordinate2D)a3;
- (void)setCenterCoordinate:(CLLocationCoordinate2D)a3 animated:(BOOL)a4;
- (void)setCloudOpacity:(float)a3;
- (void)setColorize:(NUNISpheroid *)self;
- (void)setDistance:(float)a3;
- (void)setDistanceScale:(float)a3;
- (void)setEquatorRotation:(float)a3;
- (void)setFacing:(BOOL)a3;
- (void)setHomeCoordinate:(CLLocationCoordinate2D)a3;
- (void)setOpacity:(float)a3;
- (void)setRadiusScale:(float)a3;
- (void)setVisible:(BOOL)a3;
- (void)updateSunLocationForDate:(id)a3 lightingPreference:(unint64_t)a4 adjustEarthRotation:(BOOL)a5;
@end

@implementation NUNISpheroid

- (NUNISpheroid)initWithScene:(id)a3 parent:(id)a4 type:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)NUNISpheroid;
  v10 = [(NUNISpheroid *)&v27 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_parent, a4);
    id v12 = objc_storeWeak((id *)&v11->_scene, v8);
    v11->_structure.type = a5;
    *(void *)&v11->_anon_30[88] = 1;
    *(_DWORD *)&v11->_anon_30[56] = 1065353216;
    *(void *)&v11->_anon_30[32] = 0;
    *(void *)&v11->_anon_30[40] = 0;
    v11->_structure.distanceScale = 1.0;
    __asm { FMOV            V0.2S, #1.0 }
    *(void *)&v11->_anon_30[16] = _D0;
    v11->_anon_30[120] = 1;
    *(_OWORD *)v11->_anon_30 = xmmword_21E8F1CC0;
    id v18 = v12;
    uint64_t v19 = [v8 collectionType];

    *(float *)&v11->_anon_30[52] = _NUNISphereoidComputeRadius(a5, v19);
    if (((1 << a5) & 0xFBF3FE) != 0)
    {
      unint64_t v20 = a5;
      if (((1 << a5) & 0xFFC000) != 0)
      {
        unint64_t v20 = a5 - 14;
        *(void *)&v11->_anon_30[88] = 1;
        *(void *)&v11->_anon_30[96] = a5 - 13;
        v11->_anon_30[121] = 1;
        *(_DWORD *)&v11->_anon_30[16] = 0;
      }
      uint64_t v21 = 7;
      if (((1 << a5) & 0x3000) == 0) {
        uint64_t v21 = v20;
      }
      if ((v21 & 0xFFFFFFFFFFFFFFFBLL) != 0)
      {
        float v22 = s_distance[v21];
        if (v19)
        {
          float v23 = (float)(v22 * 10.0) + 3.0;
          float v24 = 48.0;
        }
        else
        {
          float v23 = (float)(v22 * 18.0) + 4.0;
          float v24 = 156.0;
        }
        float v25 = (float)(v23 / v24) * 0.5;
      }
      else
      {
        float v25 = 0.0;
      }
      v11->_structure.distance = v25;
      if ((uint64_t)a5 > 11)
      {
        if (a5 - 12 < 2)
        {
          *(void *)&v11->_anon_30[88] = 1;
          *(void *)&v11->_anon_30[96] = a5 - 1;
        }
      }
      else if (a5)
      {
        if (a5 == 3)
        {
          *(void *)&v11->_anon_30[88] = 0;
        }
        else if (a5 == 4)
        {
          *(void *)&v11->_anon_30[88] = 2;
        }
      }
      else
      {
        *(int64x2_t *)&v11->_anon_30[88] = vdupq_n_s64(1uLL);
        v11->_anon_30[121] = 1;
        v11->_structure.distance = 0.0;
      }
    }
    else
    {
      if (a5 != 11 && a5 != 10) {
        -[NUNISpheroid initWithScene:parent:type:]();
      }
      *(_OWORD *)&v11->_anon_30[64] = xmmword_21E8F1DC0;
      *(_OWORD *)&v11->_anon_30[88] = xmmword_21E8F1DD0;
    }
  }

  return v11;
}

- (void)_updatePositionFromAngle
{
  parent = self->_parent;
  if (parent) {
    [(NUNISpheroid *)parent position];
  }
  else {
    long long v4 = xmmword_21E8F1DC0;
  }
  float32x4_t v7 = (float32x4_t)v4;
  float32x2_t v5 = vmul_n_f32((float32x2_t)__sincosf_stret(self->_structure.angle), self->_structure.distance * self->_structure.distanceScale);
  LODWORD(v6) = v5.i32[1];
  *((float *)&v6 + 1) = -v5.f32[0];
  *(float32x4_t *)&self->_anon_30[64] = vaddq_f32(v7, (float32x4_t)v6);
  [(NUNISpheroid *)self _updateCamera];
}

- (void)date:(NUNISpheroid *)self toCameraPosition:(SEL)a2 toCameraTarget:(id)a3
{
  float32x2_t v5 = v4;
  unint64_t v6 = v3;
  float v20 = 0.0;
  float v19 = 0.0;
  uint64_t v18 = 0;
  id v8 = a3;
  NUNIComputeSpheroidTransformParameters(self, v8, &v20, &v19, &v17, (float *)&v18 + 1, (float *)&v18, 1);
  NUNIComputeSpheroidParentPosition(self->_parent, v8);
  float32x4_t v15 = v9;

  float32x2_t v10 = vmul_n_f32((float32x2_t)__sincosf_stret(v19), *((float *)&v18 + 1) * self->_structure.distanceScale);
  LODWORD(v11) = v10.i32[1];
  *((float *)&v11 + 1) = -v10.f32[0];
  float32x4_t v16 = vaddq_f32(v15, (float32x4_t)v11);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v13 = (float32x2_t *)[WeakRetained structure];

  __n128 v14 = NUNIComputeCameraView(self->_structure.type, *(void *)&vadd_f32(*(float32x2_t *)&self->_anon_30[112], v13[13]), v20);
  *unint64_t v6 = vmlaq_n_f32(v16, vmulq_n_f32(vnegq_f32((float32x4_t)v14), *(float *)&v18), v13[6].f32[0]);
  *float32x2_t v5 = v16;
}

- (void)updateSunLocationForDate:(id)a3 lightingPreference:(unint64_t)a4 adjustEarthRotation:(BOOL)a5
{
  int v5 = 1 << LODWORD(self->_structure.type);
  if ((v5 & 0xFBF3FE) != 0)
  {
    NUNIComputeSpheroidTransformParameters(self, a3, &self->_structure.equatorRotation, &self->_structure.angle, (float32x2_t *)&self->_anon_30[80], &self->_structure.distance, (float *)&self->_anon_30[52], a5);
    if ((v5 & 0x3E6) != 0)
    {
      uint64_t v8 = *(void *)&self->_anon_30[80];
      float v9 = *(float *)&v8 + self->_structure.equatorRotation;
      if (a4 == 1 || !a4 && (*(float *)&v8 > 1.5708 || *(float *)&v8 < -1.5708)) {
        float v10 = 216.0;
      }
      else {
        float v10 = 144.0;
      }
      uint64_t v11 = COERCE_UNSIGNED_INT((float)(v10 + (float)(v9 * -57.296))+ (float)(floorf((float)(v10 + (float)(v9 * -57.296)) / 360.0) * -360.0)) | 0x41A0000000000000;
      *(void *)&self->_anon_30[104] = v11;
      *(void *)&self->_anon_30[112] = v11;
    }
    [(NUNISpheroid *)self _updatePositionFromAngle];
  }
}

- (double)animatedFloatForKey:(uint64_t)a3
{
  switch(a3)
  {
    case 0:
      long long v3 = *(_OWORD *)(a1 + 112);
      return *(double *)&v3;
    case 1:
      long long v4 = (const float *)(a1 + 36);
      goto LABEL_16;
    case 2:
      long long v3 = *(_OWORD *)(a1 + 48);
      return *(double *)&v3;
    case 3:
      *(void *)&long long v3 = *(void *)(a1 + 128);
      return *(double *)&v3;
    case 4:
      long long v4 = (const float *)(a1 + 24);
      goto LABEL_16;
    case 5:
      long long v4 = (const float *)(a1 + 28);
      goto LABEL_16;
    case 6:
      long long v4 = (const float *)(a1 + 100);
      goto LABEL_16;
    case 7:
      long long v4 = (const float *)(a1 + 104);
      goto LABEL_16;
    case 8:
      long long v4 = (const float *)(a1 + 32);
      goto LABEL_16;
    case 9:
      long long v4 = (const float *)(a1 + 64);
      goto LABEL_16;
    case 10:
      *(void *)&long long v3 = *(void *)(a1 + 160);
      return *(double *)&v3;
    case 11:
      long long v4 = (const float *)(a1 + 96);
      goto LABEL_16;
    case 12:
      long long v4 = (const float *)(a1 + 68);
LABEL_16:
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
      *(_OWORD *)&self->_anon_30[64] = v3;
      return;
    case 1uLL:
      LODWORD(self->_structure.equatorRotation) = v3;
      goto LABEL_4;
    case 2uLL:
      *(_OWORD *)self->_anon_30 = v3;
      return;
    case 3uLL:
      *(void *)&self->_anon_30[80] = v3;
      return;
    case 4uLL:
      LODWORD(self->_structure.distance) = v3;
      goto LABEL_4;
    case 5uLL:
      LODWORD(self->_structure.distanceScale) = v3;
      return;
    case 6uLL:
      *(_DWORD *)&self->_anon_30[52] = v3;
      return;
    case 7uLL:
      *(_DWORD *)&self->_anon_30[56] = v3;
      return;
    case 8uLL:
      LODWORD(self->_structure.angle) = v3;
LABEL_4:
      [(NUNISpheroid *)self _updatePositionFromAngle];
      break;
    case 9uLL:
      *(_DWORD *)&self->_anon_30[16] = v3;
      break;
    case 0xAuLL:
      *(void *)&self->_anon_30[112] = v3;
      [(NUNISpheroid *)self _updateCamera];
      break;
    case 0xBuLL:
      *(_DWORD *)&self->_anon_30[48] = v3;
      break;
    case 0xCuLL:
      *(_DWORD *)&self->_anon_30[20] = v3;
      break;
    default:
      return;
  }
}

- (void)setCenterCoordinate:(CLLocationCoordinate2D)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  id v15 = WeakRetained;
  if (v4)
  {
    float v9 = [NUNIAnimation alloc];
    *(float *)&unsigned int v10 = longitude;
    *(float *)&unsigned int v11 = latitude;
    id v12 = [(NUNIAnimation *)v9 initWithAnimatable:self value:10 key:COERCE_DOUBLE(__PAIR64__(v11, v10))];
    [v15 addAnimation:v12];
  }
  else
  {
    [WeakRetained removeAllAnimationsFor:self withKeys:1024];

    float v13 = longitude;
    float v14 = latitude;
    *(float *)&self->_anon_30[112] = v13;
    *(float *)&self->_anon_30[116] = v14;
    [(NUNISpheroid *)self _updateCamera];
  }
}

- (void)_updateCamera
{
  p_scene = &self->_scene;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  uint64_t v4 = [WeakRetained snap];
  if (v4 == [(NUNISpheroid *)self type])
  {
    id v5 = objc_loadWeakRetained((id *)p_scene);
    char v6 = [v5 isAnimating:v5 forKeys:15];

    if (v6) {
      return;
    }
    id v7 = objc_loadWeakRetained((id *)p_scene);
    uint64_t v8 = (float32x2_t *)[v7 structure];

    __n128 v18 = NUNIComputeCameraView(self->_structure.type, *(void *)&vadd_f32(*(float32x2_t *)&self->_anon_30[112], v8[13]), self->_structure.equatorRotation);
    float v15 = *(float *)&self->_anon_30[52];
    float32x4_t v16 = *(float32x4_t *)&self->_anon_30[64];
    id v9 = objc_loadWeakRetained((id *)p_scene);
    [v9 cameraOrbit];
    v16.i64[0] = vmlaq_n_f32(v16, vmulq_n_f32(vnegq_f32((float32x4_t)v18), v15), v10).u64[0];

    id v11 = objc_loadWeakRetained((id *)p_scene);
    [v11 cameraRoll];
    int v13 = v12;

    id WeakRetained = objc_loadWeakRetained((id *)p_scene);
    LODWORD(v14) = v13;
    [WeakRetained setCamera:*(double *)v16.i64 target:*(double *)&self->_anon_30[64] up:0.0 roll:v14];
  }
}

- (unint64_t)type
{
  return self->_structure.type;
}

- (float)blend
{
  return *(float *)&self->_anon_30[48];
}

- (float)radius
{
  return *(float *)&self->_anon_30[52];
}

- (__n128)position
{
  return a1[7];
}

- (double)light
{
  return *(double *)(a1 + 128);
}

- (unint64_t)programType
{
  return *(void *)&self->_anon_30[88];
}

- (unint64_t)spriteType
{
  return *(void *)&self->_anon_30[96];
}

- (const)structure
{
  return &self->_structure;
}

- (float)distance
{
  return self->_structure.distance;
}

- (float)distanceScale
{
  return self->_structure.distanceScale;
}

- (float)angle
{
  return self->_structure.angle;
}

- (float)equatorRotation
{
  return self->_structure.equatorRotation;
}

- (float)opacity
{
  return *(float *)&self->_anon_30[16];
}

- (float)cloudOpacity
{
  return *(float *)&self->_anon_30[20];
}

- (float)radiusScale
{
  return *(float *)&self->_anon_30[56];
}

- (__n128)colorize
{
  return a1[5];
}

- (__n128)orientation
{
  return a1[3];
}

- (CLLocationCoordinate2D)homeCoordinate
{
  double v2 = *(float *)&self->_anon_30[108];
  double v3 = *(float *)&self->_anon_30[104];
  result.double longitude = v3;
  result.double latitude = v2;
  return result;
}

- (CLLocationCoordinate2D)centerCoordinate
{
  double v2 = *(float *)&self->_anon_30[116];
  double v3 = *(float *)&self->_anon_30[112];
  result.double longitude = v3;
  result.double latitude = v2;
  return result;
}

- (BOOL)isVisible
{
  return self->_anon_30[120];
}

- (BOOL)isFacing
{
  return self->_anon_30[121];
}

- (void)setDistance:(float)a3
{
  self->_structure.distance = a3;
}

- (void)setAngle:(float)a3
{
  self->_structure.angle = a3;
}

- (void)setEquatorRotation:(float)a3
{
  self->_structure.equatorRotation = a3;
}

- (void)setOpacity:(float)a3
{
  *(float *)&self->_anon_30[16] = a3;
}

- (void)setCloudOpacity:(float)a3
{
  *(float *)&self->_anon_30[20] = a3;
}

- (void)setRadiusScale:(float)a3
{
  *(float *)&self->_anon_30[56] = a3;
}

- (void)setColorize:(NUNISpheroid *)self
{
  *(_OWORD *)&self->_anon_30[32] = v2;
}

- (__n128)setOrientation:(__n128 *)result
{
  result[3] = a2;
  return result;
}

- (void)setHomeCoordinate:(CLLocationCoordinate2D)a3
{
  float longitude = a3.longitude;
  float latitude = a3.latitude;
  *(float *)&self->_anon_30[104] = longitude;
  *(float *)&self->_anon_30[108] = latitude;
}

- (void)setVisible:(BOOL)a3
{
  self->_anon_30[120] = a3;
}

- (void)setFacing:(BOOL)a3
{
  self->_anon_30[121] = a3;
}

- (void)setDistanceScale:(float)a3
{
  self->_structure.distanceScale = a3;
  [(NUNISpheroid *)self _updatePositionFromAngle];
}

- (void)setCenterCoordinate:(CLLocationCoordinate2D)a3
{
}

- (NUNIScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (NUNIScene *)WeakRetained;
}

- (NUNISpheroid)parent
{
  return self->_parent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent, 0);
  objc_destroyWeak((id *)&self->_scene);
}

- (void)initWithScene:parent:type:.cold.1()
{
}

@end