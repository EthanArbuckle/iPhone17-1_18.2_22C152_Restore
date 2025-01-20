@interface PAEColorWheelChannelData
+ (BOOL)supportsSecureCoding;
+ (id)channelDataWithRadius:(double)a3 theta:(double)a4 saturation:(double)a5 light:(double)a6;
- (BOOL)isAtDefaults;
- (BOOL)isEqual:(id)a3;
- (PAEColorWheelChannelData)initWithCoder:(id)a3;
- (PAEColorWheelChannelData)initWithRadius:(double)a3 theta:(double)a4 saturation:(double)a5 light:(double)a6;
- (double)light;
- (double)radius;
- (double)saturation;
- (double)theta;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)interpolateBetween:(id)a3 withWeight:(float)a4;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
- (void)setLight:(double)a3;
- (void)setRadius:(double)a3;
- (void)setSaturation:(double)a3;
- (void)setTheta:(double)a3;
@end

@implementation PAEColorWheelChannelData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAEColorWheelChannelData)initWithRadius:(double)a3 theta:(double)a4 saturation:(double)a5 light:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)PAEColorWheelChannelData;
  result = [(PAEColorWheelChannelData *)&v11 init];
  if (result)
  {
    result->_value.r = fmax(a3, 0.0);
    result->_value.t = a4;
    result->_value.sat = fmax(a5, 0.0);
    result->_value.e = a6;
  }
  return result;
}

+ (id)channelDataWithRadius:(double)a3 theta:(double)a4 saturation:(double)a5 light:(double)a6
{
  v6 = (void *)[objc_alloc((Class)a1) initWithRadius:a3 theta:a4 saturation:a5 light:a6];

  return v6;
}

- (void)setRadius:(double)a3
{
  self->_value.r = fmax(a3, 0.0);
}

- (double)radius
{
  return self->_value.r;
}

- (void)setTheta:(double)a3
{
  self->_value.t = a3;
}

- (double)theta
{
  return self->_value.t;
}

- (void)setSaturation:(double)a3
{
  double v3 = 5.0;
  if (a3 <= 5.0) {
    double v3 = a3;
  }
  BOOL v4 = a3 < 0.0;
  double v5 = 0.0;
  if (!v4) {
    double v5 = v3;
  }
  self->_value.sat = v5;
}

- (double)saturation
{
  return self->_value.sat;
}

- (void)setLight:(double)a3
{
  double v3 = 5.5;
  if (a3 <= 5.5) {
    double v3 = a3;
  }
  if (a3 >= -5.5) {
    double v4 = v3;
  }
  else {
    double v4 = -5.5;
  }
  self->_value.e = v4;
}

- (double)light
{
  return self->_value.e;
}

- (BOOL)isAtDefaults
{
  return self->_value.r == 0.0 && self->_value.t == 0.0 && self->_value.sat == 0.5 && self->_value.e == 0.5;
}

- (void)reset
{
  self->_value.r = 0.0;
  self->_value.t = 0.0;
  __asm { FMOV            V0.2D, #0.5 }
  *(_OWORD *)&self->_value.sat = _Q0;
}

- (PAEColorWheelChannelData)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PAEColorWheelChannelData;
  double v4 = [(PAEColorWheelChannelData *)&v10 init];
  if (v4)
  {
    [a3 decodeDoubleForKey:@"radius"];
    v4->_value.r = v5;
    [a3 decodeDoubleForKey:@"theta"];
    v4->_value.t = v6;
    [a3 decodeDoubleForKey:@"saturation"];
    v4->_value.sat = v7;
    [a3 decodeDoubleForKey:@"light"];
    v4->_value.e = v8;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [(PAEColorWheelChannelData *)self radius];
  if (v5 != 0.0) {
    objc_msgSend(a3, "encodeDouble:forKey:", @"radius");
  }
  [(PAEColorWheelChannelData *)self theta];
  if (v6 != 0.0) {
    objc_msgSend(a3, "encodeDouble:forKey:", @"theta");
  }
  [(PAEColorWheelChannelData *)self saturation];
  if (v7 != 0.0) {
    objc_msgSend(a3, "encodeDouble:forKey:", @"saturation");
  }
  [(PAEColorWheelChannelData *)self light];
  if (v8 != 0.0)
  {
    objc_msgSend(a3, "encodeDouble:forKey:", @"light");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    long long v5 = *(_OWORD *)&self->_value.r;
    *(_OWORD *)((char *)result + 24) = *(_OWORD *)&self->_value.sat;
    *(_OWORD *)((char *)result + 8) = v5;
  }
  return result;
}

- (id)description
{
  double v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  long long v5 = NSStringFromClass(v4);
  [(PAEColorWheelChannelData *)self radius];
  uint64_t v7 = v6;
  [(PAEColorWheelChannelData *)self theta];
  uint64_t v9 = v8;
  [(PAEColorWheelChannelData *)self saturation];
  uint64_t v11 = v10;
  [(PAEColorWheelChannelData *)self light];
  return (id)[v3 stringWithFormat:@"<%@: %p> radius=%f, theta=%f, saturation=%f, light=%f", v5, self, v7, v9, v11, v12];
}

- (id)interpolateBetween:(id)a3 withWeight:(float)a4
{
  [(PAEColorWheelChannelData *)self saturation];
  double v7 = v6;
  [(PAEColorWheelChannelData *)self light];
  double v9 = v8;
  [(PAEColorWheelChannelData *)self radius];
  double v84 = v10;
  [(PAEColorWheelChannelData *)self theta];
  double v12 = v11;
  [a3 saturation];
  double v14 = v13;
  [a3 light];
  double v16 = v15;
  [a3 radius];
  double v83 = v17;
  [a3 theta];
  float v19 = v12 * 0.159154943;
  v20.i64[0] = __PAIR64__(1.0, LODWORD(v19));
  v20.i64[1] = COERCE_UNSIGNED_INT(0.5);
  if (v19 <= 1.0)
  {
    if (v19 >= 0.0) {
      goto LABEL_6;
    }
    float v21 = (float)(v19 + (float)(int)(float)-v19) + 1.0;
  }
  else
  {
    float v21 = v19 - (float)(int)v19;
  }
  *(float *)v20.i32 = v21;
LABEL_6:
  v22.f32[0] = a4;
  if (*(float *)v20.i32 <= 1.0)
  {
    if (*(float *)v20.i32 >= 0.0) {
      float v23 = *(float *)v20.i32;
    }
    else {
      float v23 = (float)(*(float *)v20.i32 + (float)(int)(float)-*(float *)v20.i32) + 1.0;
    }
  }
  else
  {
    float v23 = *(float *)v20.i32 - (float)(int)*(float *)v20.i32;
  }
  float v24 = (1.0 + 1.0) * 0.5;
  if (1.0 >= 0.00000011921)
  {
    double v26 = v23 * 6.0;
    int v27 = (int)v26;
    float v28 = 0.5 + 0.5 - v24;
    double v29 = (v26 - floor(v26)) * (float)(v24 - v28);
    float v30 = v29 + v28;
    double v31 = v24 - v29;
    float v32 = v31;
    switch(v27)
    {
      case 1:
        v25.i32[3] = 0;
        *(float *)v25.i32 = v31;
        *(float *)&v25.i32[1] = (1.0 + 1.0) * 0.5;
        goto LABEL_16;
      case 2:
        v25.i64[0] = __PAIR64__(LODWORD(v24), LODWORD(v28));
        v25.i64[1] = LODWORD(v30);
        break;
      case 3:
        v25.i32[3] = 0;
        v25.i64[0] = __PAIR64__(LODWORD(v32), LODWORD(v28));
        goto LABEL_20;
      case 4:
        v25.i32[3] = 0;
        v25.i64[0] = __PAIR64__(LODWORD(v28), LODWORD(v30));
LABEL_20:
        *(float *)&v25.i32[2] = (1.0 + 1.0) * 0.5;
        break;
      case 5:
        v25.i64[0] = __PAIR64__(LODWORD(v28), LODWORD(v24));
        v25.i64[1] = LODWORD(v32);
        break;
      default:
        v25.i32[3] = 0;
        v25.i64[0] = __PAIR64__(LODWORD(v30), LODWORD(v24));
LABEL_16:
        *(float *)&v25.i32[2] = 0.5 + 0.5 - v24;
        break;
    }
  }
  else
  {
    int8x16_t v25 = (int8x16_t)vdupq_laneq_s32(v20, 2);
    v25.i32[3] = 0;
  }
  float v33 = v18 * 0.159154943;
  v34.i64[0] = __PAIR64__(1.0, LODWORD(v33));
  v34.i64[1] = COERCE_UNSIGNED_INT(0.5);
  if (v33 <= 1.0)
  {
    if (v33 >= 0.0) {
      goto LABEL_27;
    }
    float v35 = (float)(v33 + (float)(int)(float)-v33) + 1.0;
  }
  else
  {
    float v35 = v33 - (float)(int)v33;
  }
  *(float *)v34.i32 = v35;
LABEL_27:
  if (*(float *)v34.i32 <= 1.0)
  {
    if (*(float *)v34.i32 >= 0.0) {
      float v36 = *(float *)v34.i32;
    }
    else {
      float v36 = (float)(*(float *)v34.i32 + (float)(int)(float)-*(float *)v34.i32) + 1.0;
    }
  }
  else
  {
    float v36 = *(float *)v34.i32 - (float)(int)*(float *)v34.i32;
  }
  v22.f32[1] = 1.0 - a4;
  int8x16_t v37 = (int8x16_t)vcvtq_f64_f32(v22);
  float v38 = (1.0 + 1.0) * 0.5;
  if (1.0 >= 0.00000011921)
  {
    double v40 = v36 * 6.0;
    int v41 = (int)v40;
    float v42 = 0.5 + 0.5 - v38;
    double v43 = (v40 - floor(v40)) * (float)(v38 - v42);
    float v44 = v43 + v42;
    double v45 = v38 - v43;
    float v46 = v45;
    switch(v41)
    {
      case 1:
        v39.i32[3] = 0;
        *(float *)v39.i32 = v45;
        *(float *)&v39.i32[1] = (1.0 + 1.0) * 0.5;
        goto LABEL_37;
      case 2:
        v39.i64[0] = __PAIR64__(LODWORD(v38), LODWORD(v42));
        v39.i64[1] = LODWORD(v44);
        break;
      case 3:
        v39.i32[3] = 0;
        v39.i64[0] = __PAIR64__(LODWORD(v46), LODWORD(v42));
        goto LABEL_41;
      case 4:
        v39.i32[3] = 0;
        v39.i64[0] = __PAIR64__(LODWORD(v42), LODWORD(v44));
LABEL_41:
        *(float *)&v39.i32[2] = (1.0 + 1.0) * 0.5;
        break;
      case 5:
        v39.i64[0] = __PAIR64__(LODWORD(v42), LODWORD(v38));
        v39.i64[1] = LODWORD(v46);
        break;
      default:
        v39.i32[3] = 0;
        v39.i64[0] = __PAIR64__(LODWORD(v44), LODWORD(v38));
LABEL_37:
        *(float *)&v39.i32[2] = 0.5 + 0.5 - v38;
        break;
    }
  }
  else
  {
    int8x16_t v39 = (int8x16_t)vdupq_laneq_s32(v34, 2);
    v39.i32[3] = 0;
  }
  v47.f64[0] = v83;
  v47.f64[1] = v84;
  __asm { FMOV            V4.2D, #1.0 }
  float64x2_t v52 = vsubq_f64(_Q4, v47);
  float v53 = 0.0;
  int8x16_t v54 = (int8x16_t)vmulq_f64(v52, (float64x2_t)0);
  float v55 = *(double *)&v54.i64[1] + v84 * *(float *)v25.i32;
  float v56 = *(double *)v54.i64 + v83 * *(float *)v39.i32;
  float v57 = vmuld_lane_f64(v55, (float64x2_t)v37, 1) + v56 * *(double *)v37.i64;
  float32x2_t v58 = vcvt_f32_f64(vaddq_f64(vmulq_f64((float64x2_t)v37, vcvtq_f64_f32(vcvt_f32_f64(vaddq_f64((float64x2_t)v54, vmulq_f64(v47, vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)v39.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v25, v25, 8uLL), 4uLL))))))), vmulq_f64((float64x2_t)vextq_s8(v37, v37, 8uLL), vcvtq_f64_f32(vcvt_f32_f64(vaddq_f64((float64x2_t)vextq_s8(v54, v54, 8uLL),
                    vmulq_f64((float64x2_t)vextq_s8((int8x16_t)v47, (int8x16_t)v47, 8uLL), vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)v25.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v39, v39, 8uLL), 4uLL)))))))));
  float v59 = v58.f32[1];
  if (v58.f32[0] >= v58.f32[1]) {
    float v60 = v58.f32[1];
  }
  else {
    float v60 = v58.f32[0];
  }
  if (v58.f32[0] <= v58.f32[1]) {
    float v61 = v58.f32[1];
  }
  else {
    float v61 = v58.f32[0];
  }
  if (v60 <= v57) {
    float v62 = v60;
  }
  else {
    float v62 = v57;
  }
  if (v61 >= v57) {
    float v63 = v61;
  }
  else {
    float v63 = v57;
  }
  float v64 = v63 - v62;
  double v65 = -(float)(v63 - v62);
  if ((float)(v63 - v62) >= 0.0) {
    double v65 = (float)(v63 - v62);
  }
  if (v65 < 0.00000011920929)
  {
    double v66 = v62;
    goto LABEL_83;
  }
  double v66 = v62;
  float v67 = v57 - v63;
  if ((float)(v57 - v63) < 0.0) {
    float v67 = -(float)(v57 - v63);
  }
  if (v67 >= 0.00000011921)
  {
    float v72 = v58.f32[0] - v63;
    if ((float)(v58.f32[0] - v63) < 0.0) {
      float v72 = -(float)(v58.f32[0] - v63);
    }
    float v73 = v57 - v62;
    if ((float)(v57 - v62) < 0.0) {
      float v73 = -(float)(v57 - v62);
    }
    double v74 = (float)((float)(v63 - v57) / v64);
    double v70 = (float)((float)(v63 - v58.f32[0]) / v64) + 3.0;
    if (v73 >= 0.00000011921) {
      double v70 = 5.0 - v74;
    }
    float v75 = v59 - v62;
    if (v75 < 0.0) {
      float v75 = -v75;
    }
    double v71 = 3.0 - (float)((float)(v63 - v59) / v64);
    if (v75 < 0.00000011921) {
      double v71 = v74 + 1.0;
    }
    _NF = v72 < 0.00000011921;
  }
  else
  {
    float v68 = v58.f32[0] - v62;
    if (v68 < 0.0) {
      float v68 = -v68;
    }
    _NF = v68 < 0.00000011921;
    double v70 = 1.0 - (float)((float)(v63 - v58.f32[0]) / v64);
    double v71 = (float)((float)(v63 - v59) / v64) + 5.0;
  }
  if (!_NF) {
    double v71 = v70;
  }
  float v76 = v71;
  float v77 = v76 / 6.0;
  float v53 = v77;
  if (v77 <= 1.0)
  {
    if (v77 >= 0.0) {
      goto LABEL_83;
    }
    float v78 = (float)(v77 + (float)(int)(float)-v77) + 1.0;
  }
  else
  {
    float v78 = v77 - (float)(int)v77;
  }
  float v53 = v78;
LABEL_83:
  float v79 = v53 * 3.14159265 + v53 * 3.14159265;
  double v80 = v79;

  return +[PAEColorWheelChannelData channelDataWithRadius:v63 - v66 theta:v80 saturation:v7 * *(double *)&v37.i64[1] + v14 * *(double *)v37.i64 light:v9 * *(double *)&v37.i64[1] + v16 * *(double *)v37.i64];
}

- (BOOL)isEqual:(id)a3
{
  [(PAEColorWheelChannelData *)self saturation];
  double v6 = v5;
  [a3 saturation];
  if (v6 != v7) {
    return 0;
  }
  [(PAEColorWheelChannelData *)self light];
  double v9 = v8;
  [a3 light];
  if (v9 != v10) {
    return 0;
  }
  [(PAEColorWheelChannelData *)self radius];
  double v12 = v11;
  [a3 radius];
  if (v12 != v13) {
    return 0;
  }
  [(PAEColorWheelChannelData *)self theta];
  double v16 = v15;
  [a3 theta];
  return v16 == v17;
}

@end