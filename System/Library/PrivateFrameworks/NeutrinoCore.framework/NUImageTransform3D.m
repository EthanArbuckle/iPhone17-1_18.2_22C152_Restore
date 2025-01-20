@interface NUImageTransform3D
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToGeometryTransform3D:(id)a3;
- (BOOL)isIdentityImageTransform;
- (BOOL)isInverseOf:(id)a3;
- (CGPoint)transformPoint:(CGPoint)a3;
- (NUImageTransform3D)init;
- (NUImageTransform3D)initWithAffineTransform:(CGAffineTransform *)a3;
- (_OWORD)initWithTransform3D:(float64x2_t *)a3;
- (_OWORD)transformMatrix:(_OWORD *)a3@<X8>;
- (id)description;
- (id)inverseTransform;
- (id)transformByRotateX:(double)a3 y:(double)a4 z:(double)a5;
- (id)transformByRotateZ:(double)a3;
- (id)transformByScaleX:(double)a3 scaleY:(double)a4;
- (id)transformByTranslateX:(double)a3 translateY:(double)a4;
- (unint64_t)hash;
- (void)nu_updateDigest:(id)a3;
- (void)transform;
@end

@implementation NUImageTransform3D

- (void)transform
{
}

- (void)nu_updateDigest:(id)a3
{
  id v4 = a3;
  [v4 addCString:"NUImageTransform3D"];
  [v4 addBytes:&self[1] length:128];
}

- (BOOL)isEqualToGeometryTransform3D:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = (float64x2_t *)a3;
  if (!v4)
  {
    v7 = NUAssertLogger_19081();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "other != nil");
      *(_DWORD *)buf = 138543362;
      v41 = v8;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v10 = NUAssertLogger_19081();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        v17 = [v15 callStackSymbols];
        v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v41 = v14;
        __int16 v42 = 2114;
        v43 = v18;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v41 = v13;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUImageTransform3D isEqualToGeometryTransform3D:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUGeometryTransform.m", 460, @"Invalid parameter not satisfying: %s", v19, v20, v21, v22, (uint64_t)"other != nil");
  }
  float64x2_t v35 = *(float64x2_t *)&self[1].super.super.super.isa;
  float64x2_t v38 = *(float64x2_t *)&self[1]._anon_10[32];
  float64x2_t v39 = *(float64x2_t *)self[1]._anon_10;
  float64x2_t v34 = *(float64x2_t *)&self[1]._anon_10[16];
  float64x2_t v37 = *(float64x2_t *)&self[1]._anon_10[64];
  float64x2_t v33 = *(float64x2_t *)&self[1]._anon_10[48];
  float64x2_t v36 = *(float64x2_t *)&self[1]._anon_10[96];
  float64x2_t v31 = v4[11];
  float64x2_t v32 = *(float64x2_t *)&self[1]._anon_10[80];
  float64x2_t v26 = v4[12];
  float64x2_t v27 = v4[10];
  float64x2_t v29 = v4[15];
  float64x2_t v30 = v4[13];
  float64x2_t v28 = v4[17];
  float64x2_t v24 = v4[16];
  float64x2_t v25 = v4[14];

  int64x2_t v5 = (int64x2_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vceqq_f64(v34, v26), (int8x16_t)vceqq_f64(v35, v27)), vandq_s8((int8x16_t)vceqq_f64(v33, v25), (int8x16_t)vceqq_f64(v32, v24))), vandq_s8(vandq_s8((int8x16_t)vceqq_f64(v38, v30), (int8x16_t)vceqq_f64(v39, v31)), vandq_s8((int8x16_t)vceqq_f64(v37, v29), (int8x16_t)vceqq_f64(v36, v28))));
  return vandq_s8((int8x16_t)v5, (int8x16_t)vdupq_laneq_s64(v5, 1)).u64[0] >> 63;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NUImageTransform3D *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(NUImageTransform3D *)self isEqualToGeometryTransform3D:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  int64x2_t v2 = (int64x2_t)vaddq_f64(vmulq_f64(*(float64x2_t *)&self[1].super.super.super.isa, (float64x2_t)xmmword_1A9A72E30), vmulq_f64(*(float64x2_t *)self[1]._anon_10, (float64x2_t)xmmword_1A9A72E20));
  int64x2_t v3 = (int64x2_t)vaddq_f64(vmulq_f64(*(float64x2_t *)&self[1]._anon_10[16], (float64x2_t)xmmword_1A9A72E50), vmulq_f64(*(float64x2_t *)&self[1]._anon_10[32], (float64x2_t)xmmword_1A9A72E40));
  float64x2_t v4 = vaddq_f64((float64x2_t)vzip1q_s64(v2, v3), (float64x2_t)vzip2q_s64(v2, v3));
  int64x2_t v5 = (int64x2_t)vaddq_f64(vmulq_f64(*(float64x2_t *)&self[1]._anon_10[48], (float64x2_t)xmmword_1A9A72E70), vmulq_f64(*(float64x2_t *)&self[1]._anon_10[64], (float64x2_t)xmmword_1A9A72E60));
  int64x2_t v6 = (int64x2_t)vaddq_f64(vmulq_f64(*(float64x2_t *)&self[1]._anon_10[80], (float64x2_t)xmmword_1A9A72E90), vmulq_f64(*(float64x2_t *)&self[1]._anon_10[96], (float64x2_t)xmmword_1A9A72E80));
  float64x2_t v7 = vaddq_f64((float64x2_t)vzip1q_s64(v5, v6), (float64x2_t)vzip2q_s64(v5, v6));
  v8 = [NSNumber numberWithDouble:v4.f64[0] + 0.0 + v4.f64[1] + v7.f64[0] + v7.f64[1]];
  unint64_t v9 = [v8 hash];

  return v9;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"NUImageTransform3D  m11=%f m12=%f m13=%f m14=%f m21=%f m22=%f m23=%f m24=%f m31=%f m32=%f m33=%f m34=%f m41=%f m42=%f m43=%f m44=%f ", self[1].super.super.super.isa, *(void *)self[1]._anon_8, *(void *)self[1]._anon_10, *(void *)&self[1]._anon_10[8], *(void *)&self[1]._anon_10[16], *(void *)&self[1]._anon_10[24], *(void *)&self[1]._anon_10[32], *(void *)&self[1]._anon_10[40], *(void *)&self[1]._anon_10[48], *(void *)&self[1]._anon_10[56], *(void *)&self[1]._anon_10[64], *(void *)&self[1]._anon_10[72], *(void *)&self[1]._anon_10[80], *(void *)&self[1]._anon_10[88], *(void *)&self[1]._anon_10[96], *(void *)&self[1]._anon_10[104]);
}

- (id)transformByRotateX:(double)a3 y:(double)a4 z:(double)a5
{
  int64x2_t v5 = self + 1;
  double v6 = a4 * 3.14159265 / 180.0;
  double v7 = a5 * 3.14159265 / 180.0;
  __double2 v9 = __sincos_stret(a3 * 3.14159265 / 180.0 * 0.5);
  v8.f64[0] = v9.__sinval;
  *(void *)&double v52 = *(_OWORD *)&vmulq_f64(v8, (float64x2_t)0);
  float64x2_t vars0 = vmulq_n_f64((float64x2_t)xmmword_1A9A72CC0, v9.__sinval);
  __double2 v11 = __sincos_stret(v6 * 0.5);
  v10.f64[0] = v11.__sinval;
  *(void *)&v10.f64[0] = *(_OWORD *)&vmulq_f64(v10, (float64x2_t)0);
  v10.f64[1] = v11.__cosval;
  float64x2_t v49 = v10;
  float64x2_t v50 = vmulq_n_f64((float64x2_t)xmmword_1A9A72CB0, v11.__sinval);
  __double2 v29 = __sincos_stret(v7 * 0.5);
  uint64_t v12 = 0;
  float64x2_t v13 = vmulq_n_f64((float64x2_t)0, v29.__sinval);
  float64x2_t v14 = vnegq_f64(v50);
  float64x2_t v15 = (float64x2_t)vextq_s8((int8x16_t)v49, (int8x16_t)vnegq_f64(v49), 8uLL);
  _Q6 = vmlaq_n_f64(vmulq_laneq_f64(v49, vars0, 1), v15, vars0.f64[0]);
  _Q1 = vaddq_f64(vmlaq_n_f64(vmulq_n_f64(v49, v9.__cosval), v15, v52), vmlaq_n_f64(vmulq_laneq_f64(v14, vars0, 1), (float64x2_t)vextq_s8((int8x16_t)v50, (int8x16_t)v14, 8uLL), vars0.f64[0]));
  float64x2_t v18 = vaddq_f64(vmlaq_n_f64(vmulq_n_f64(v50, v9.__cosval), (float64x2_t)vextq_s8((int8x16_t)v14, (int8x16_t)v50, 8uLL), v52), _Q6);
  _Q5 = vnegq_f64(v13);
  float64x2_t v20 = (float64x2_t)vextq_s8((int8x16_t)v29, (int8x16_t)vnegq_f64((float64x2_t)v29), 8uLL);
  float64x2_t v21 = vmlaq_n_f64(vmulq_laneq_f64((float64x2_t)v29, v18, 1), v20, v18.f64[0]);
  _Q3 = vaddq_f64(vmlaq_n_f64(vmulq_laneq_f64(_Q5, v18, 1), (float64x2_t)vextq_s8((int8x16_t)v13, (int8x16_t)_Q5, 8uLL), v18.f64[0]), vmlaq_n_f64(vmulq_laneq_f64((float64x2_t)v29, _Q1, 1), v20, _Q1.f64[0]));
  _Q4 = vaddq_f64(v21, vmlaq_n_f64(vmulq_laneq_f64(v13, _Q1, 1), (float64x2_t)vextq_s8((int8x16_t)_Q5, (int8x16_t)v13, 8uLL), _Q1.f64[0]));
  _Q5.f64[0] = _Q4.f64[1];
  __asm { FMLS            D1, D3, V3.D[0] }
  _D7 = _Q3.f64[1];
  __asm { FMLA            D1, D7, V3.D[1] }
  v29.__sinval = vmlad_n_f64(vmuld_lane_f64(_Q3.f64[0], _Q3, 1), _Q4.f64[1], _Q4.f64[0]);
  v13.f64[0] = v29.__sinval + v29.__sinval;
  v21.f64[0] = vmuld_lane_f64(_Q4.f64[1], _Q3, 1);
  v29.__sinval = vmlad_n_f64(-(_Q4.f64[1] * _Q3.f64[1]), _Q3.f64[0], _Q4.f64[0]);
  v29.__sinval = v29.__sinval + v29.__sinval;
  _Q1.f64[1] = v13.f64[0];
  v13.f64[0] = vmlad_n_f64(-(_Q3.f64[0] * _Q3.f64[1]), _Q4.f64[1], _Q4.f64[0]);
  v13.f64[0] = v13.f64[0] + v13.f64[0];
  __asm
  {
    FMLA            D6, D5, V4.D[1]
    FMLA            D6, D7, V3.D[1]
    FMLS            D6, D4, V4.D[0]
    FMLA            D17, D3, V4.D[1]
  }
  v13.f64[1] = _Q6.f64[0];
  _Q6.f64[0] = -(_Q4.f64[0] * _Q3.f64[1]);
  float64x2_t v31 = (float64x2_t)vzip1q_s64((int64x2_t)_Q4, (int64x2_t)_Q3);
  __asm
  {
    FMLS            D7, D4, V4.D[0]
    FMLS            D7, D5, V4.D[1]
  }
  _Q4.f64[0] = _Q3.f64[0];
  v21.f64[1] = _Q6.f64[0];
  float64x2_t v34 = vmlaq_f64(v21, v31, _Q4);
  float64x2_t v36 = vaddq_f64(v34, v34);
  float64x2_t v35 = (float64x2_t)vzip2q_s64((int64x2_t)v36, (int64x2_t)0);
  v36.f64[1] = 0.0;
  float64x2_t v37 = (float64x2_t)*(unint64_t *)&_Q5.f64[0];
  v37.f64[0] = _D7;
  long long v38 = *(_OWORD *)&v5->_anon_10[64];
  long long v57 = *(_OWORD *)&v5->_anon_10[48];
  long long v58 = v38;
  long long v39 = *(_OWORD *)&v5->_anon_10[96];
  long long v59 = *(_OWORD *)&v5->_anon_10[80];
  long long v60 = v39;
  long long v40 = *(_OWORD *)v5->_anon_10;
  long long v53 = *(_OWORD *)&v5->super.super.super.isa;
  long long v54 = v40;
  long long v41 = *(_OWORD *)&v5->_anon_10[32];
  long long v55 = *(_OWORD *)&v5->_anon_10[16];
  long long v56 = v41;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  float64x2_t v42 = (float64x2_t)vzip1q_s64((int64x2_t)_Q1, (int64x2_t)v13);
  long long v65 = 0u;
  long long v66 = 0u;
  float64x2_t v43 = (float64x2_t)vzip2q_s64((int64x2_t)_Q1, (int64x2_t)v13);
  long long v67 = 0u;
  long long v68 = 0u;
  do
  {
    float64x2_t v45 = *(float64x2_t *)((char *)&v53 + v12);
    float64x2_t v44 = *(float64x2_t *)((char *)&v53 + v12 + 16);
    v46 = (float64x2_t *)((char *)&v61 + v12);
    v29.__cosval = _D17 + _D17;
    float64x2_t *v46 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v42, v45.f64[0]), v43, v45, 1), (float64x2_t)v29, v44.f64[0]), (float64x2_t)0, v44, 1);
    v46[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v36, v45.f64[0]), v35, v45, 1), v37, v44.f64[0]), (float64x2_t)xmmword_1A9A72CB0, v44, 1);
    v12 += 32;
  }
  while (v12 != 128);
  long long v57 = v65;
  long long v58 = v66;
  long long v59 = v67;
  long long v60 = v68;
  long long v53 = v61;
  long long v54 = v62;
  long long v55 = v63;
  long long v56 = v64;
  v47 = [[NUImageTransform3D alloc] initWithTransform3D:&v53];
  return v47;
}

- (id)transformByRotateZ:(double)a3
{
  int64x2_t v3 = self + 1;
  float64x2_t v20 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 48);
  float64x2_t v21 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 16);
  float64x2_t v18 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 112);
  float64x2_t v19 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 64);
  float64x2_t v16 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 96);
  float64x2_t vars0 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 80);
  __double2 v5 = __sincos_stret(a3 * 3.14159265 / 180.0);
  v4.f64[0] = v5.__cosval;
  uint64_t v6 = 0;
  long long v7 = *(_OWORD *)&v3->_anon_10[64];
  long long v26 = *(_OWORD *)&v3->_anon_10[48];
  long long v27 = v7;
  long long v8 = *(_OWORD *)&v3->_anon_10[96];
  long long v28 = *(_OWORD *)&v3->_anon_10[80];
  long long v29 = v8;
  long long v9 = *(_OWORD *)v3->_anon_10;
  long long v22 = *(_OWORD *)&v3->super.super.super.isa;
  long long v23 = v9;
  long long v10 = *(_OWORD *)&v3->_anon_10[32];
  long long v24 = *(_OWORD *)&v3->_anon_10[16];
  long long v25 = v10;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  do
  {
    float64x2_t v12 = *(float64x2_t *)((char *)&v22 + v6);
    float64x2_t v11 = *(float64x2_t *)((char *)&v22 + v6 + 16);
    v4.f64[1] = -v5.__sinval;
    float64x2_t v13 = (float64x2_t *)((char *)&v30 + v6);
    float64x2_t *v13 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v4, v12.f64[0]), (float64x2_t)v5, v12, 1), v19, v11.f64[0]), v16, v11, 1);
    v13[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v21, v12.f64[0]), v20, v12, 1), vars0, v11.f64[0]), v18, v11, 1);
    v6 += 32;
  }
  while (v6 != 128);
  long long v26 = v34;
  long long v27 = v35;
  long long v28 = v36;
  long long v29 = v37;
  long long v22 = v30;
  long long v23 = v31;
  long long v24 = v32;
  long long v25 = v33;
  float64x2_t v14 = [[NUImageTransform3D alloc] initWithTransform3D:&v22];
  return v14;
}

- (id)transformByTranslateX:(double)a3 translateY:(double)a4
{
  uint64_t v4 = 0;
  float64x2_t v5 = *(float64x2_t *)MEMORY[0x1E4F14990];
  float64x2_t v9 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 16);
  float64x2_t v6 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 32);
  float64x2_t v12 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 48);
  float64x2_t v8 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 64);
  float64x2_t v7 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 80);
  v9.f64[1] = a3;
  float64x2_t v11 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 96);
  float64x2_t v10 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 112);
  v12.f64[1] = a4;
  long long v13 = *(_OWORD *)self[1]._anon_10;
  long long v19 = *(_OWORD *)&self[1].super.super.super.isa;
  long long vars0 = v13;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  do
  {
    float64x2_t v15 = *(float64x2_t *)((char *)&v19 + v4);
    float64x2_t v14 = *(float64x2_t *)((char *)&v19 + v4 + 16);
    float64x2_t v16 = (float64x2_t *)((char *)&v21 + v4);
    *float64x2_t v16 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v5, v15.f64[0]), v6, v15, 1), v8, v14.f64[0]), v11, v14, 1);
    v16[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v9, v15.f64[0]), v12, v15, 1), v7, v14.f64[0]), v10, v14, 1);
    v4 += 32;
  }
  while (v4 != 128);
  long long v19 = v21;
  long long vars0 = v22;
  v17 = [[NUImageTransform3D alloc] initWithTransform3D:&v19];
  return v17;
}

- (id)transformByScaleX:(double)a3 scaleY:(double)a4
{
  uint64_t v4 = 0;
  float64x2_t v5 = (float64x2_t)*(unint64_t *)&a3;
  v6.f64[0] = 0.0;
  v6.f64[1] = a4;
  long long v7 = *(_OWORD *)self[1]._anon_10;
  long long v13 = *(_OWORD *)&self[1].super.super.super.isa;
  long long vars0 = v7;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  do
  {
    float64x2_t v9 = *(float64x2_t *)((char *)&v13 + v4);
    float64x2_t v8 = *(float64x2_t *)((char *)&v13 + v4 + 16);
    float64x2_t v10 = (float64x2_t *)((char *)&v15 + v4);
    float64x2_t *v10 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v5, v9.f64[0]), v6, v9, 1), (float64x2_t)0, v8.f64[0]), (float64x2_t)0, v8, 1);
    v10[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)0, v9.f64[0]), (float64x2_t)0, v9, 1), (float64x2_t)xmmword_1A9A72CC0, v8.f64[0]), (float64x2_t)xmmword_1A9A72CB0, v8, 1);
    v4 += 32;
  }
  while (v4 != 128);
  long long v13 = v15;
  long long vars0 = v16;
  float64x2_t v11 = [[NUImageTransform3D alloc] initWithTransform3D:&v13];
  return v11;
}

- (_OWORD)transformMatrix:(_OWORD *)a3@<X8>
{
  uint64_t v3 = 0;
  float64x2_t v5 = *a2;
  float64x2_t v4 = a2[1];
  float64x2_t v7 = a2[2];
  float64x2_t v6 = a2[3];
  float64x2_t v9 = a2[4];
  float64x2_t v8 = a2[5];
  float64x2_t v11 = a2[6];
  float64x2_t v10 = a2[7];
  long long v12 = result[15];
  v19[4] = result[14];
  v19[5] = v12;
  long long v13 = result[17];
  v19[6] = result[16];
  v19[7] = v13;
  long long v14 = result[11];
  v19[0] = result[10];
  v19[1] = v14;
  long long v15 = result[13];
  v19[2] = result[12];
  v19[3] = v15;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  a3[5] = 0u;
  a3[6] = 0u;
  a3[7] = 0u;
  do
  {
    float64x2_t v17 = (float64x2_t)v19[v3];
    float64x2_t v16 = (float64x2_t)v19[v3 + 1];
    long long v18 = (float64x2_t *)&a3[v3];
    float64x2_t *v18 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v5, v17.f64[0]), v7, v17, 1), v9, v16.f64[0]), v11, v16, 1);
    v18[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v4, v17.f64[0]), v6, v17, 1), v8, v16.f64[0]), v10, v16, 1);
    v3 += 2;
  }
  while (v3 != 8);
  return result;
}

- (CGPoint)transformPoint:(CGPoint)a3
{
  int64x2_t v4 = *(int64x2_t *)&self[1].super.super.super.isa;
  int64x2_t v3 = *(int64x2_t *)self[1]._anon_10;
  int64x2_t v5 = *(int64x2_t *)&self[1]._anon_10[16];
  int64x2_t v6 = *(int64x2_t *)&self[1]._anon_10[32];
  float64x2_t v7 = (const double *)&self[1]._anon_10[48];
  float64x2x4_t v28 = vld4q_f64(v7);
  float64x2_t v8 = (float64x2_t)vzip1q_s64(v4, v5);
  float64x2_t v9 = (float64x2_t)vzip2q_s64(v4, v5);
  float64x2_t v10 = (float64x2_t)vzip1q_s64(v3, v6);
  float64x2_t v11 = (float64x2_t)vzip2q_s64(v3, v6);
  float64x2_t v12 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a3.y, 0);
  if (self->_inverseProjection)
  {
    float64x2_t v13 = vmlaq_f64(vmulq_n_f64(v8, a3.x), v12, v9);
    float64x2_t v14 = vmlaq_f64(vmulq_n_f64(v28.val[0], a3.x), v12, v28.val[1]);
    float64x2_t v15 = (float64x2_t)vdupq_n_s64(0xC08F400000000000);
    float64x2_t v16 = vmlaq_f64(v14, v15, v28.val[2]);
    float64x2_t v17 = vaddq_f64(v11, vmlaq_f64(v13, v15, v10));
    float64x2_t v18 = vaddq_f64(v28.val[3], v16);
    float64x2_t v19 = (float64x2_t)vdupq_n_s64(0x408F400000000000uLL);
    float64x2_t v20 = vaddq_f64(v28.val[3], vmlaq_f64(v14, v19, v28.val[2]));
    double v21 = v18.f64[0] / (v20.f64[0] - v18.f64[0]);
    int64x2_t v22 = (int64x2_t)vmlsq_lane_f64(v18, vsubq_f64(v20, v18), v21, 0);
    float64x2_t v23 = vmlsq_lane_f64(v17, vsubq_f64(vaddq_f64(v11, vmlaq_f64(v13, v19, v10)), v17), v21, 0);
  }
  else
  {
    float64x2_t v24 = vmlaq_f64(vmlaq_f64(vmulq_n_f64(v8, a3.x), v12, v9), (float64x2_t)0, v10);
    int64x2_t v22 = (int64x2_t)vaddq_f64(v28.val[3], vmlaq_f64(vmlaq_f64(vmulq_n_f64(v28.val[0], a3.x), v12, v28.val[1]), (float64x2_t)0, v28.val[2]));
    float64x2_t v23 = vaddq_f64(v11, v24);
  }
  float64x2_t v25 = vdivq_f64(v23, (float64x2_t)vdupq_laneq_s64(v22, 1));
  double v26 = v25.f64[1];
  result.x = v25.f64[0];
  result.y = v26;
  return result;
}

- (id)inverseTransform
{
  int64x2_t v3 = [NUImageTransform3D alloc];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F14990] + 80);
  v22[4] = *(_OWORD *)(MEMORY[0x1E4F14990] + 64);
  v22[5] = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F14990] + 112);
  v22[6] = *(_OWORD *)(MEMORY[0x1E4F14990] + 96);
  v22[7] = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F14990] + 16);
  v22[0] = *MEMORY[0x1E4F14990];
  v22[1] = v6;
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F14990] + 48);
  v22[2] = *(_OWORD *)(MEMORY[0x1E4F14990] + 32);
  v22[3] = v7;
  uint64_t v8 = [(NUImageTransform3D *)v3 initWithTransform3D:v22];
  long long v9 = *(_OWORD *)&self->_anon_10[48];
  long long v11 = *(_OWORD *)self->_anon_10;
  long long v10 = *(_OWORD *)&self->_anon_10[16];
  *(_OWORD *)(v8 + 192) = *(_OWORD *)&self->_anon_10[32];
  *(_OWORD *)(v8 + 208) = v9;
  *(_OWORD *)(v8 + 160) = v11;
  *(_OWORD *)(v8 + 176) = v10;
  long long v12 = *(_OWORD *)&self->_anon_10[112];
  long long v14 = *(_OWORD *)&self->_anon_10[64];
  long long v13 = *(_OWORD *)&self->_anon_10[80];
  *(_OWORD *)(v8 + 256) = *(_OWORD *)&self->_anon_10[96];
  *(_OWORD *)(v8 + 272) = v12;
  *(_OWORD *)(v8 + 224) = v14;
  *(_OWORD *)(v8 + 240) = v13;
  long long v15 = *(_OWORD *)&self[1]._anon_10[32];
  long long v17 = *(_OWORD *)&self[1].super.super.super.isa;
  long long v16 = *(_OWORD *)self[1]._anon_10;
  *(_OWORD *)(v8 + 48) = *(_OWORD *)&self[1]._anon_10[16];
  *(_OWORD *)(v8 + 64) = v15;
  *(_OWORD *)(v8 + 16) = v17;
  *(_OWORD *)(v8 + 32) = v16;
  long long v18 = *(_OWORD *)&self[1]._anon_10[96];
  long long v20 = *(_OWORD *)&self[1]._anon_10[48];
  long long v19 = *(_OWORD *)&self[1]._anon_10[64];
  *(_OWORD *)(v8 + 112) = *(_OWORD *)&self[1]._anon_10[80];
  *(_OWORD *)(v8 + 128) = v18;
  *(_OWORD *)(v8 + 80) = v20;
  *(_OWORD *)(v8 + 96) = v19;
  *(unsigned char *)(v8 + 144) ^= 1u;

  return (id)v8;
}

- (BOOL)isInverseOf:(id)a3
{
  float64x2_t v3 = (float64x2_t)vdupq_n_s64(0x3EE4F8B588E368F1uLL);
  int64x2_t v4 = (int64x2_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)&self[1]._anon_10[16], *((float64x2_t *)a3 + 3))), (int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)&self[1].super.super.super.isa, *((float64x2_t *)a3 + 1)))), vandq_s8((int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)&self[1]._anon_10[48], *((float64x2_t *)a3 + 5))), (int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)&self[1]._anon_10[80], *((float64x2_t *)a3 + 7))))), vandq_s8(vandq_s8((int8x16_t)vcgeq_f64(v3,
                                     vabdq_f64(*(float64x2_t *)&self[1]._anon_10[32], *((float64x2_t *)a3 + 4))),
                        (int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)self[1]._anon_10, *((float64x2_t *)a3 + 2)))),
                      vandq_s8((int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)&self[1]._anon_10[64], *((float64x2_t *)a3 + 6))), (int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)&self[1]._anon_10[96], *((float64x2_t *)a3 + 8))))));
  if ((vandq_s8((int8x16_t)v4, (int8x16_t)vdupq_laneq_s64(v4, 1)).u64[0] & 0x8000000000000000) != 0)
  {
    int64x2_t v6 = (int64x2_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)&self->_anon_10[32], *((float64x2_t *)a3 + 12))), (int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)self->_anon_10, *((float64x2_t *)a3 + 10)))), vandq_s8((int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)&self->_anon_10[64], *((float64x2_t *)a3 + 14))), (int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)&self->_anon_10[96], *((float64x2_t *)a3 + 16))))), vandq_s8(vandq_s8((int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)&self->_anon_10[48], *((float64x2_t *)a3 + 13))), (int8x16_t)vcgeq_f64(
                                       v3,
                                       vabdq_f64(*(float64x2_t *)&self->_anon_10[16], *((float64x2_t *)a3 + 11)))),
                        vandq_s8((int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)&self->_anon_10[80], *((float64x2_t *)a3 + 15))), (int8x16_t)vcgeq_f64(v3, vabdq_f64(*(float64x2_t *)&self->_anon_10[112], *((float64x2_t *)a3 + 17))))));
    return vandq_s8((int8x16_t)v6, (int8x16_t)vdupq_laneq_s64(v6, 1)).u64[0] >> 63;
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)isIdentityImageTransform
{
  int64x2_t v2 = (int64x2_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self[1]._anon_10[16], *(float64x2_t *)(MEMORY[0x1E4F14990] + 32)), (int8x16_t)vceqq_f64(*(float64x2_t *)&self[1].super.super.super.isa, *MEMORY[0x1E4F14990])), vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self[1]._anon_10[48], *(float64x2_t *)(MEMORY[0x1E4F14990] + 64)), (int8x16_t)vceqq_f64(*(float64x2_t *)&self[1]._anon_10[80], *(float64x2_t *)(MEMORY[0x1E4F14990] + 96)))), vandq_s8(vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self[1]._anon_10[32], *(float64x2_t *)(MEMORY[0x1E4F14990] + 48)), (int8x16_t)vceqq_f64(
                                     *(float64x2_t *)self[1]._anon_10,
                                     *(float64x2_t *)(MEMORY[0x1E4F14990] + 16))),
                      vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self[1]._anon_10[64], *(float64x2_t *)(MEMORY[0x1E4F14990] + 80)), (int8x16_t)vceqq_f64(*(float64x2_t *)&self[1]._anon_10[96], *(float64x2_t *)(MEMORY[0x1E4F14990] + 112)))));
  return vandq_s8((int8x16_t)v2, (int8x16_t)vdupq_laneq_s64(v2, 1)).u64[0] >> 63;
}

- (NUImageTransform3D)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_19038);
  }
  float64x2_t v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    int64x2_t v4 = NSString;
    BOOL v5 = v3;
    int64x2_t v6 = (objc_class *)objc_opt_class();
    long long v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromSelector(a2);
    long long v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    long long v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_19038);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_19038);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    long long v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    long long v12 = (void *)MEMORY[0x1E4F29060];
    long long v13 = v11;
    long long v14 = [v12 callStackSymbols];
    long long v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    long long v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  long long v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  long long v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  long long v13 = v16;
  long long v20 = [v18 callStackSymbols];
  double v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  long long v29 = specific;
  __int16 v30 = 2114;
  long long v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  int64x2_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUImageTransform3D init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUGeometryTransform.m", 296, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

- (_OWORD)initWithTransform3D:(float64x2_t *)a3
{
  a53 = *MEMORY[0x1E4F143B8];
  float64x2_t v127 = a3[1];
  float64x2_t v128 = *a3;
  float64x2_t v125 = a3[3];
  float64x2_t v126 = a3[2];
  float64x2_t v123 = a3[5];
  float64x2_t v124 = a3[4];
  float64x2_t v121 = a3[7];
  float64x2_t v122 = a3[6];
  long long v54 = (long long *)MEMORY[0x1E4F14990];
  float64x2_t v119 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 16);
  float64x2_t v120 = *(float64x2_t *)MEMORY[0x1E4F14990];
  float64x2_t v117 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 48);
  float64x2_t v118 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 32);
  float64x2_t v115 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 80);
  float64x2_t vars0 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 64);
  float64x2_t v113 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 112);
  float64x2_t v114 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 96);
  a41.receiver = a1;
  a41.super_class = (Class)NUImageTransform3D;
  long long v55 = [(NUImageTransform3D *)&a41 init];
  long long v56 = v55;
  if (v55)
  {
    int64x2_t v57 = (int64x2_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vceqq_f64(v126, v118), (int8x16_t)vceqq_f64(v128, v120)), vandq_s8((int8x16_t)vceqq_f64(v124, vars0), (int8x16_t)vceqq_f64(v122, v114))), vandq_s8(vandq_s8((int8x16_t)vceqq_f64(v125, v117), (int8x16_t)vceqq_f64(v127, v119)), vandq_s8((int8x16_t)vceqq_f64(v123, v115), (int8x16_t)vceqq_f64(v121, v113))));
    float64x2_t v58 = a3[3];
    float64x2_t v60 = *a3;
    float64x2_t v59 = a3[1];
    *((float64x2_t *)v55 + 12) = a3[2];
    *((float64x2_t *)v55 + 13) = v58;
    *((float64x2_t *)v55 + 10) = v60;
    *((float64x2_t *)v55 + 11) = v59;
    float64x2_t v61 = a3[7];
    float64x2_t v63 = a3[4];
    float64x2_t v62 = a3[5];
    *((float64x2_t *)v55 + 16) = a3[6];
    *((float64x2_t *)v55 + 17) = v61;
    *((float64x2_t *)v55 + 14) = v63;
    *((float64x2_t *)v55 + 15) = v62;
    long long v64 = v55 + 16;
    if ((vandq_s8((int8x16_t)v57, (int8x16_t)vdupq_laneq_s64(v57, 1)).u64[0] & 0x8000000000000000) != 0)
    {
      long long v90 = *v54;
      long long v91 = v54[1];
      long long v92 = v54[3];
      *((_OWORD *)v55 + 3) = v54[2];
      *((_OWORD *)v55 + 4) = v92;
      *long long v64 = v90;
      *((_OWORD *)v55 + 2) = v91;
      long long v93 = v54[4];
      long long v94 = v54[5];
      long long v95 = v54[7];
      *((_OWORD *)v55 + 7) = v54[6];
      *((_OWORD *)v55 + 8) = v95;
      *((_OWORD *)v55 + 5) = v93;
      *((_OWORD *)v55 + 6) = v94;
    }
    else
    {
      float64x2_t v65 = a3[5];
      a46 = a3[4];
      a47 = v65;
      float64x2_t v66 = a3[7];
      a48 = a3[6];
      a49 = v66;
      float64x2_t v67 = a3[1];
      buf = *a3;
      a43 = v67;
      float64x2_t v68 = a3[3];
      a44 = a3[2];
      a45 = v68;
      __invert_d4();
      v56[3] = a35;
      v56[4] = a36;
      *long long v64 = a33;
      v56[2] = a34;
      v56[7] = a39;
      v56[8] = a40;
      v56[5] = a37;
      v56[6] = a38;
      float64x2x2_t v129 = vld2q_f64(a3->f64);
      float64x2_t v69 = a3[2];
      float64x2_t v70 = a3[3];
      float64x2_t v71 = a3[4];
      float64x2_t v72 = a3[5];
      float64x2_t v73 = a3[6];
      float64x2_t v74 = a3[7];
      float64x2_t v75 = (float64x2_t)vextq_s8((int8x16_t)v70, (int8x16_t)v69, 8uLL);
      float64x2_t v76 = (float64x2_t)vextq_s8((int8x16_t)v69, (int8x16_t)v70, 8uLL);
      float64x2_t v77 = (float64x2_t)vextq_s8((int8x16_t)v74, (int8x16_t)v73, 8uLL);
      float64x2_t v78 = (float64x2_t)vextq_s8((int8x16_t)v73, (int8x16_t)v74, 8uLL);
      float64x2_t v79 = (float64x2_t)vextq_s8((int8x16_t)v72, (int8x16_t)v71, 8uLL);
      float64x2_t v80 = (float64x2_t)vextq_s8((int8x16_t)v71, (int8x16_t)v72, 8uLL);
      float64x2_t v81 = vnegq_f64(v80);
      float64x2_t v82 = vnegq_f64(v79);
      int64x2_t v83 = (int64x2_t)vmlaq_f64(vmlaq_f64(vmulq_f64(v69, vmlaq_f64(vmulq_f64(v78, v82), v77, v80)), vmlaq_f64(vmulq_f64(v73, v81), v78, v71), v75), vmlaq_f64(vmulq_f64(v77, vnegq_f64(v71)), v73, v79), v76);
      int64x2_t v84 = (int64x2_t)vmlaq_f64(vmlaq_f64(vmulq_f64(v70, vmlaq_f64(vmulq_f64(v77, v81), v78, v79)), vmlaq_f64(vmulq_f64(v74, v82), v77, v72), v76), vmlaq_f64(vmulq_f64(v78, vnegq_f64(v72)), v74, v80), v75);
      if (vaddvq_f64(vsubq_f64(vmulq_f64(v129.val[0], (float64x2_t)vzip1q_s64(v84, v83)), vmulq_f64(v129.val[1], (float64x2_t)vzip2q_s64(v84, v83)))) == 0.0)
      {
        if (_NULogOnceToken != -1) {
          dispatch_once(&_NULogOnceToken, &__block_literal_global_19038);
        }
        v85 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
        {
          v86 = NSString;
          v87 = v85;
          v88 = [v86 stringWithFormat:@"Supplied transform is not invertible"];
          LODWORD(buf.f64[0]) = 138543362;
          *(void *)((char *)buf.f64 + 4) = v88;
          _os_log_impl(&dword_1A9892000, v87, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", (uint8_t *)&buf, 0xCu);

          uint64_t v89 = _NULogOnceToken;
          if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
          {
            if (v89 != -1) {
              dispatch_once(&_NULogOnceToken, &__block_literal_global_19038);
            }
LABEL_12:
            v96 = (void *)_NUAssertLogger;
            if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
            {
              specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
              v102 = (void *)MEMORY[0x1E4F29060];
              id v103 = specific;
              v104 = v96;
              v105 = [v102 callStackSymbols];
              v106 = [v105 componentsJoinedByString:@"\n"];
              LODWORD(buf.f64[0]) = 138543618;
              *(void *)((char *)buf.f64 + 4) = specific;
              WORD2(buf.f64[1]) = 2114;
              *(void *)((char *)&buf.f64[1] + 6) = v106;
              _os_log_error_impl(&dword_1A9892000, v104, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

LABEL_20:
              goto LABEL_17;
            }
            goto LABEL_17;
          }
          if (v89 != -1) {
            dispatch_once(&_NULogOnceToken, &__block_literal_global_19038);
          }
        }
        else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
        {
          goto LABEL_12;
        }
        v107 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          v109 = (void *)MEMORY[0x1E4F29060];
          v104 = v107;
          v110 = [v109 callStackSymbols];
          v111 = [v110 componentsJoinedByString:@"\n"];
          LODWORD(buf.f64[0]) = 138543362;
          *(void *)((char *)buf.f64 + 4) = v111;
          _os_log_error_impl(&dword_1A9892000, v104, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

          goto LABEL_20;
        }
LABEL_17:
        _NUAssertContinueHandler((uint64_t)"-[NUImageTransform3D initWithTransform3D:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Geometry/transforms/NUGeometryTransform.m", 287, @"Supplied transform is not invertible", v97, v98, v99, v100, v112);
      }
    }
  }
  return v56;
}

- (NUImageTransform3D)initWithAffineTransform:(CGAffineTransform *)a3
{
  *(CGFloat *)&long long v3 = a3->a;
  *(CGFloat *)&long long v4 = a3->b;
  *((void *)&v3 + 1) = *(void *)&a3->c;
  *(void *)&long long v5 = 0;
  *(void *)&long long v6 = 0;
  *((void *)&v6 + 1) = *(void *)&a3->tx;
  *((void *)&v4 + 1) = *(void *)&a3->d;
  *((void *)&v5 + 1) = *(void *)&a3->ty;
  v10[0] = v3;
  v10[1] = v6;
  v10[2] = v4;
  v10[3] = v5;
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F14990] + 80);
  v10[4] = *(_OWORD *)(MEMORY[0x1E4F14990] + 64);
  v10[5] = v7;
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F14990] + 112);
  v10[6] = *(_OWORD *)(MEMORY[0x1E4F14990] + 96);
  v10[7] = v8;
  return [(NUImageTransform3D *)self initWithTransform3D:v10];
}

@end