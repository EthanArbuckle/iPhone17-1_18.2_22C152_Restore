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
- (void)date:(id)a3 toEquatorRotation:(float *)a4 toAngle:(float *)a5 toLight:toDistance:toRadius:;
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
- (void)updateSunLocationForDate:(id)a3;
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
    *(_OWORD *)v11->_anon_30 = xmmword_1B483DAE0;
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
      *(_OWORD *)&v11->_anon_30[64] = xmmword_1B48559B0;
      *(_OWORD *)&v11->_anon_30[88] = xmmword_1B48559C0;
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
    long long v4 = xmmword_1B48559B0;
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
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  id v8 = a3;
  [(NUNISpheroid *)self date:v8 toEquatorRotation:&v20 toAngle:&v19 toLight:&v17 toDistance:(char *)&v18 + 4 toRadius:&v18];
  *(double *)v9.i64 = NUNIComputeSpheroidParentPosition(self->_parent, v8);
  float32x4_t v15 = v9;

  float32x2_t v10 = vmul_n_f32((float32x2_t)__sincosf_stret(v19), *((float *)&v18 + 1));
  LODWORD(v11) = v10.i32[1];
  *((float *)&v11 + 1) = -v10.f32[0];
  float32x4_t v16 = vaddq_f32(v15, (float32x4_t)v11);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v13 = (float32x2_t *)[WeakRetained structure];

  __n128 v14 = NUNIComputeCameraView(self->_structure.type, *(void *)&vadd_f32(*(float32x2_t *)&self->_anon_30[104], v13[13]), v20);
  *unint64_t v6 = vmlaq_n_f32(v16, vmulq_n_f32(vnegq_f32((float32x4_t)v14), *(float *)&v18), v13[6].f32[0]);
  *float32x2_t v5 = v16;
}

- (void)date:(id)a3 toEquatorRotation:(float *)a4 toAngle:(float *)a5 toLight:toDistance:toRadius:
{
  id v8 = v7;
  float32x4_t v9 = v6;
  float32x2_t v10 = v5;
  id v14 = a3;
  *float32x4_t v9 = 0.0;
  *a5 = 0.0;
  *a4 = 0.0;
  void *v10 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  uint64_t v16 = [WeakRetained collectionType];

  unint64_t type = self->_structure.type;
  *id v8 = _NUNISphereoidComputeRadius(type, v16);
  if (((1 << type) & 0xFBF3FE) != 0)
  {
    unint64_t v18 = type - 14;
    if (((1 << type) & 0xFFC000) == 0) {
      unint64_t v18 = type;
    }
    if (((1 << type) & 0x3000) != 0) {
      uint64_t v19 = 7;
    }
    else {
      uint64_t v19 = v18;
    }
    float v20 = 0.0;
    if (v19)
    {
      uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F64A48]) initWithDate:v14 body:v19];
      [v21 longitude];
      *(float *)&double v22 = v22;
      *a5 = (float)(*(float *)&v22 * 3.1416) / 180.0;

      if ((v19 & 0xFFFFFFFFFFFFFFFBLL) != 0)
      {
        float v23 = s_distance[v19];
        if (v16)
        {
          float v24 = (float)(v23 * 10.0) + 3.0;
          float v25 = 48.0;
        }
        else
        {
          float v24 = (float)(v23 * 18.0) + 4.0;
          float v25 = 156.0;
        }
        float v20 = (float)(v24 / v25) * 0.5;
      }
    }
    *float32x4_t v9 = v20;
    if (type == 3)
    {
      v26 = objc_opt_new();
      double v81 = 0.0;
      double v82 = 0.0;
      double v80 = 0.0;
      [v26 calculateGeocentricDirectionForSunX:&v82 Y:&v81 Z:&v80 date:v14];
      float v27 = v82;
      float v28 = v81;
      float v29 = v80;
      *(float *)&unsigned int v30 = 1.5708 - atan2f(v28, v27);
      void *v10 = __PAIR64__(COERCE_UNSIGNED_INT(acosf(v29)), v30);
    }
    else if (type == 4)
    {
      *a4 = *a5;
    }
    else if (type - 1 <= 8)
    {
      v31 = (double *)((char *)&date_toEquatorRotation_toAngle_toLight_toDistance_toRadius__orientations + 32 * type);
      double v32 = *v31;
      double v33 = v31[1];
      double v34 = v31[2];
      double v35 = v31[3];
      [v14 timeIntervalSince1970];
      float v37 = fmod(v34 + v35 * (v36 / 86400.0 + 2440587.5 + -2451545.0), 360.0);
      *(double *)v38.i64 = UMFloat4x4MakeRotateZ(v37 * -0.017453);
      simd_float4 v74 = v39;
      simd_float4 v77 = v38;
      simd_float4 v68 = v41;
      simd_float4 v71 = v40;
      v38.f32[0] = (90.0 - v33) * -0.0174532924;
      *(double *)v42.i64 = UMFloat4x4MakeRotateX(v38.f32[0]);
      v86.columns[0] = v42;
      v86.columns[1] = v43;
      v86.columns[2] = v44;
      v86.columns[3] = v45;
      v83.columns[1] = v74;
      v83.columns[0] = v77;
      v83.columns[3] = v68;
      v83.columns[2] = v71;
      *(double *)v46.i64 = UMMul(v83, v86);
      simd_float4 v75 = v47;
      simd_float4 v78 = v46;
      simd_float4 v69 = v49;
      simd_float4 v72 = v48;
      v46.f32[0] = (v32 + -90.0) * -0.0174532924;
      *(double *)v50.i64 = UMFloat4x4MakeRotateZ(v46.f32[0]);
      v87.columns[0] = v50;
      v87.columns[1] = v51;
      v87.columns[2] = v52;
      v87.columns[3] = v53;
      v84.columns[1] = v75;
      v84.columns[0] = v78;
      v84.columns[3] = v69;
      v84.columns[2] = v72;
      *(double *)v54.i64 = UMMul(v84, v87);
      simd_float4 v76 = v55;
      simd_float4 v79 = v54;
      simd_float4 v70 = v57;
      simd_float4 v73 = v56;
      *(double *)v58.i64 = UMFloat4x4MakeRotateX(-0.40911);
      v88.columns[0] = v58;
      v88.columns[1] = v59;
      v88.columns[2] = v60;
      v88.columns[3] = v61;
      v85.columns[1] = v76;
      v85.columns[0] = v79;
      v85.columns[3] = v70;
      v85.columns[2] = v73;
      *(double *)v62.i64 = UMMul(v85, v88);
      double v66 = UMMul(v62, v63, v64, v65, (float32x4_t)xmmword_1B48559D0);
      v76.i32[2] = v67;
      v79.f32[0] = atan2f(*((float *)&v66 + 1), *(float *)&v66) + 0.0;
      void *v10 = __PAIR64__(COERCE_UNSIGNED_INT(acosf(v76.f32[2])), v79.u32[0]);
    }
  }
}

- (void)updateSunLocationForDate:(id)a3
{
  if (((1 << LODWORD(self->_structure.type)) & 0xFBF3FE) != 0)
  {
    [(NUNISpheroid *)self date:a3 toEquatorRotation:&self->_structure.equatorRotation toAngle:&self->_structure.angle toLight:&self->_anon_30[80] toDistance:&self->_structure.distance toRadius:&self->_anon_30[52]];
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
      goto LABEL_14;
    case 2:
      long long v3 = *(_OWORD *)(a1 + 48);
      return *(double *)&v3;
    case 3:
      *(void *)&long long v3 = *(void *)(a1 + 128);
      return *(double *)&v3;
    case 4:
      long long v4 = (const float *)(a1 + 24);
      goto LABEL_14;
    case 5:
      long long v4 = (const float *)(a1 + 100);
      goto LABEL_14;
    case 6:
      long long v4 = (const float *)(a1 + 104);
      goto LABEL_14;
    case 7:
      long long v4 = (const float *)(a1 + 32);
      goto LABEL_14;
    case 8:
      long long v4 = (const float *)(a1 + 64);
      goto LABEL_14;
    case 9:
      *(void *)&long long v3 = *(void *)(a1 + 160);
      return *(double *)&v3;
    case 10:
      long long v4 = (const float *)(a1 + 96);
      goto LABEL_14;
    case 11:
      long long v4 = (const float *)(a1 + 68);
LABEL_14:
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
      *(_DWORD *)&self->_anon_30[52] = v3;
      return;
    case 6uLL:
      float v4 = *((float *)&v3 + 1);
      if (*(float *)&v3 > *((float *)&v3 + 1)) {
        float v4 = *(float *)&v3;
      }
      LODWORD(v3) = DWORD2(v3);
      if (v4 > *((float *)&v3 + 2)) {
        *(float *)&long long v3 = v4;
      }
      *(_DWORD *)&self->_anon_30[56] = v3;
      return;
    case 7uLL:
      LODWORD(self->_structure.angle) = v3;
LABEL_4:
      [(NUNISpheroid *)self _updatePositionFromAngle];
      break;
    case 8uLL:
      *(_DWORD *)&self->_anon_30[16] = v3;
      break;
    case 9uLL:
      *(void *)&self->_anon_30[112] = v3;
      [(NUNISpheroid *)self _updateCamera];
      break;
    case 0xAuLL:
      *(_DWORD *)&self->_anon_30[48] = v3;
      break;
    case 0xBuLL:
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
    float32x4_t v9 = [NUNIAnimation alloc];
    *(float *)&unsigned int v10 = longitude;
    *(float *)&unsigned int v11 = latitude;
    id v12 = [(NUNIAnimation *)v9 initWithAnimatable:self value:9 key:COERCE_DOUBLE(__PAIR64__(v11, v10))];
    [v15 addAnimation:v12];
  }
  else
  {
    [WeakRetained removeAllAnimationsFor:self withKeys:512];

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
  BOOL v4 = [WeakRetained focus];
  if (v4 == self)
  {
    id v5 = objc_loadWeakRetained((id *)p_scene);
    char v6 = [v5 isAnimating:v5 forKeys:15];

    if (v6) {
      return;
    }
    __n128 v18 = NUNIComputeCameraView(self->_structure.type, *(void *)&self->_anon_30[112], self->_structure.equatorRotation);
    float v14 = *(float *)&self->_anon_30[52];
    float32x4_t v15 = *(float32x4_t *)&self->_anon_30[64];
    id v7 = objc_loadWeakRetained((id *)p_scene);
    [v7 cameraOrbit];
    *(void *)&double v16 = vmlaq_n_f32(v15, vmulq_n_f32(vnegq_f32((float32x4_t)v18), v14), v8).u64[0];

    float v9 = 0.0;
    if (self->_structure.type == 4)
    {
      id v10 = objc_loadWeakRetained((id *)p_scene);
      unsigned int v11 = [v10 spheroidOfType:3];

      [v11 homeCoordinate];
      *(float *)&double v12 = v12;
      if (*(float *)&v12 >= 0.0) {
        float v9 = 0.0;
      }
      else {
        float v9 = 3.1416;
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)p_scene);
    *(float *)&double v13 = v9;
    [WeakRetained setCamera:v16 target:*(double *)&self->_anon_30[64] up:0.0 roll:v13];
  }
  else
  {
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