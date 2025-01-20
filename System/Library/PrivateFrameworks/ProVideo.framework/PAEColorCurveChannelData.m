@interface PAEColorCurveChannelData
+ (BOOL)supportsSecureCoding;
+ (id)channelDataWithRed:(double)a3 green:(double)a4 blue:(double)a5;
+ (id)channelDataWithRed:(double)a3 green:(double)a4 blue:(double)a5 curve:(const void *)a6;
- (BOOL)isAtDefaults;
- (BOOL)isEqual:(id)a3;
- (PAEColorCurveChannelData)init;
- (PAEColorCurveChannelData)initWithCoder:(id)a3;
- (PAEColorCurveChannelData)initWithRed:(double)a3 green:(double)a4 blue:(double)a5;
- (PAEColorCurveChannelData)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 curve:(const void *)a6;
- (double)blue;
- (double)evaluate:(double)a3;
- (double)green;
- (double)red;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)interpolateBetween:(id)a3 withWeight:(float)a4;
- (void)curveRef;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
@end

@implementation PAEColorCurveChannelData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAEColorCurveChannelData)init
{
  v3.receiver = self;
  v3.super_class = (Class)PAEColorCurveChannelData;
  if ([(PAEColorCurveChannelData *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (PAEColorCurveChannelData)initWithRed:(double)a3 green:(double)a4 blue:(double)a5
{
  v6.receiver = self;
  v6.super_class = (Class)PAEColorCurveChannelData;
  if ([(PAEColorCurveChannelData *)&v6 init]) {
    operator new();
  }
  return 0;
}

+ (id)channelDataWithRed:(double)a3 green:(double)a4 blue:(double)a5
{
  v5 = (void *)[objc_alloc((Class)a1) initWithRed:a3 green:a4 blue:a5];

  return v5;
}

- (PAEColorCurveChannelData)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 curve:(const void *)a6
{
  v7.receiver = self;
  v7.super_class = (Class)PAEColorCurveChannelData;
  if ([(PAEColorCurveChannelData *)&v7 init]) {
    operator new();
  }
  return 0;
}

+ (id)channelDataWithRed:(double)a3 green:(double)a4 blue:(double)a5 curve:(const void *)a6
{
  objc_super v6 = (void *)[objc_alloc((Class)a1) initWithRed:a6 green:a3 blue:a4 curve:a5];

  return v6;
}

- (void)dealloc
{
  curve_private = (char *)self->_curve_private;
  if (curve_private)
  {
    *((void *)curve_private + 15) = &unk_1F1093990;
    *((void *)curve_private + 19) = &unk_1F10939D0;
    v5 = (void **)(curve_private + 192);
    std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v5);
    v5 = (void **)(curve_private + 128);
    std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v5);
    *(void *)curve_private = &unk_1F1093990;
    *((void *)curve_private + 4) = &unk_1F10939D0;
    v5 = (void **)(curve_private + 72);
    std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v5);
    v5 = (void **)(curve_private + 8);
    std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v5);
    MEMORY[0x1BA9BFBA0](curve_private, 0x10A0C4009AD4094);
  }
  v4.receiver = self;
  v4.super_class = (Class)PAEColorCurveChannelData;
  [(PAEColorCurveChannelData *)&v4 dealloc];
}

- (void)curveRef
{
  return self->_curve_private;
}

- (double)red
{
  return *((double *)self->_curve_private + 5);
}

- (double)green
{
  return *((double *)self->_curve_private + 6);
}

- (double)blue
{
  return *((double *)self->_curve_private + 7);
}

- (BOOL)isAtDefaults
{
  curve_private = (double *)self->_curve_private;
  if (curve_private[5] == curve_private[20]
    && curve_private[6] == curve_private[21]
    && curve_private[7] == curve_private[22]
    && (uint64_t v4 = *((void *)curve_private + 9),
        uint64_t v3 = *((void *)curve_private + 10),
        objc_super v6 = (char *)(curve_private + 24),
        uint64_t v5 = *((void *)curve_private + 24),
        v3 - v4 == *((void *)v6 + 1) - v5))
  {
    if (v4 == v3)
    {
      LOBYTE(v11) = 1;
    }
    else
    {
      objc_super v7 = (double *)(v5 + 16);
      uint64_t v8 = v4 + 24;
      do
      {
        BOOL v9 = *(double *)(v8 - 16) == *(v7 - 1);
        double v10 = *v7;
        v7 += 3;
        BOOL v11 = *(double *)(v8 - 8) == v10 && v9;
        BOOL v12 = !v11 || v8 == v3;
        v8 += 24;
      }
      while (!v12);
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }
  return v11;
}

- (void)reset
{
  curve_private = (char *)self->_curve_private;
  uint64_t v3 = (uint64_t *)(curve_private + 8);
  uint64_t v4 = (void (***)(void))*((void *)curve_private + 1);
  uint64_t v5 = *((void *)curve_private + 2);
  if ((void (***)(void))v5 != v4)
  {
    uint64_t v6 = v5 - 24;
    objc_super v7 = (void (***)(void))(v5 - 24);
    uint64_t v8 = (void (***)(void))(v5 - 24);
    do
    {
      BOOL v9 = *v8;
      v8 -= 3;
      (*v9)(v7);
      v6 -= 24;
      BOOL v10 = v7 == v4;
      objc_super v7 = v8;
    }
    while (!v10);
    uint64_t v5 = *v3;
  }
  *((void *)curve_private + 2) = v4;
  std::vector<cc::point_t<double,false,false>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<cc::point_t<double,false,false> const*>,std::__wrap_iter<cc::point_t<double,false,false> const*>>(v3, v5, *((void *)curve_private + 16), *((void *)curve_private + 17), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)curve_private + 17) - *((void *)curve_private + 16)) >> 3));
  BOOL v11 = (void (***)(void))*((void *)curve_private + 9);
  *(_OWORD *)(curve_private + 40) = *((_OWORD *)curve_private + 10);
  *((void *)curve_private + 7) = *((void *)curve_private + 22);
  uint64_t v12 = *((void *)curve_private + 10);
  if ((void (***)(void))v12 != v11)
  {
    uint64_t v13 = v12 - 24;
    v14 = (void (***)(void))(v12 - 24);
    v15 = (void (***)(void))(v12 - 24);
    do
    {
      v16 = *v15;
      v15 -= 3;
      (*v16)(v14);
      v13 -= 24;
      BOOL v10 = v14 == v11;
      v14 = v15;
    }
    while (!v10);
    uint64_t v12 = *((void *)curve_private + 9);
  }
  *((void *)curve_private + 10) = v11;
  uint64_t v17 = *((void *)curve_private + 24);
  uint64_t v18 = *((void *)curve_private + 25);

  std::vector<cc::point_t<double,false,false>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<cc::point_t<double,false,false> const*>,std::__wrap_iter<cc::point_t<double,false,false> const*>>((uint64_t *)curve_private + 9, v12, v17, v18, 0xAAAAAAAAAAAAAAABLL * ((v18 - v17) >> 3));
}

- (double)evaluate:(double)a3
{
  double v4 = a3;
  (*(void (**)(void *, double *))(*(void *)self->_curve_private + 24))(self->_curve_private, &v4);
  return result;
}

- (PAEColorCurveChannelData)initWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)PAEColorCurveChannelData;
  if ([(PAEColorCurveChannelData *)&v5 init])
  {
    [a3 decodeDoubleForKey:@"defaultRed"];
    [a3 decodeDoubleForKey:@"defaultGreen"];
    [a3 decodeDoubleForKey:@"defaultBlue"];
    operator new();
  }
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  curve_private = (double *)self->_curve_private;
  if (curve_private[5] != 0.0) {
    objc_msgSend(a3, "encodeDouble:forKey:", @"red");
  }
  if (curve_private[6] != 0.0) {
    objc_msgSend(a3, "encodeDouble:forKey:", @"green");
  }
  if (curve_private[7] != 0.0) {
    objc_msgSend(a3, "encodeDouble:forKey:", @"blue");
  }
  if (curve_private[20] != 0.0) {
    objc_msgSend(a3, "encodeDouble:forKey:", @"defaultRed");
  }
  if (curve_private[21] != 0.0) {
    objc_msgSend(a3, "encodeDouble:forKey:", @"defaultGreen");
  }
  if (curve_private[22] != 0.0) {
    objc_msgSend(a3, "encodeDouble:forKey:", @"defaultBlue");
  }
  id v6 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)curve_private + 2) - *((void *)curve_private + 1)) >> 3)];
  for (uint64_t i = *((void *)curve_private + 1); i != *((void *)curve_private + 2); i += 24)
    objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", *(double *)(i + 8), *(double *)(i + 16)));
  [a3 encodeObject:v6 forKey:@"points"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  curve_private = (double *)self->_curve_private;
  id v4 = objc_alloc((Class)objc_opt_class());
  double v5 = curve_private[20];
  double v6 = curve_private[21];
  double v7 = curve_private[22];

  return (id)[v4 initWithRed:curve_private green:v5 blue:v6 curve:v7];
}

- (id)description
{
  curve_private = self->_curve_private;
  id v4 = NSString;
  double v5 = (objc_class *)objc_opt_class();
  double v6 = (void *)[v4 stringWithFormat:@"<%@: %p> red=%.3f, green=%.3f, blue=%.3f, pts={\n", NSStringFromClass(v5), self, curve_private[5], curve_private[6], curve_private[7]];
  for (uint64_t i = curve_private[1]; i != curve_private[2]; i += 24)
    double v6 = (void *)[v6 stringByAppendingFormat:@"  %.3f, %.3f\n", *(void *)(i + 8), *(void *)(i + 16)];

  return (id)[v6 stringByAppendingString:@"}"];
}

- (id)interpolateBetween:(id)a3 withWeight:(float)a4
{
  curve_private = (char *)self->_curve_private;
  double v6 = *((double *)curve_private + 7);
  float64x2_t v82 = *(float64x2_t *)(curve_private + 40);
  uint64_t v7 = [a3 curveRef];
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  float64x2_t v10 = *(float64x2_t *)(v7 + 40);
  double v11 = *(double *)(v7 + 56);
  uint64_t v85 = 0;
  uint64_t v86 = 0;
  v83 = &unk_1F1093990;
  unint64_t v84 = 0;
  v87 = &unk_1F10939D0;
  __asm { FMOV            V0.2D, #1.0 }
  float64x2_t v88 = _Q0;
  uint64_t v91 = 0;
  uint64_t v92 = 0;
  double v89 = 1.0;
  v90 = &unk_1F1093A40;
  uint64_t v93 = 0;
  v94 = &unk_1F1093A68;
  v95 = cc::curve::aspline::bezier_t<double,false>::evalNonPeriodic;
  uint64_t v96 = 0;
  uint64_t v17 = *((void *)curve_private + 1);
  uint64_t v16 = *((void *)curve_private + 2);
  uint64_t v18 = *(void *)(v7 + 8);
  if (v16 - v17 == *(void *)(v7 + 16) - v18)
  {
    v100 = (void **)&unk_1F108BF48;
    if (v17 == v16)
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
    }
    else
    {
      float64x2_t v81 = v10;
      v19 = (float64x2_t *)(v18 + 8);
      do
      {
        float64x2_t v101 = vaddq_f64(vmulq_n_f64(*v19, a4), vmulq_n_f64(*(float64x2_t *)(v17 + 8), (float)(1.0 - a4)));
        std::vector<cc::point_t<double,false,false>>::push_back[abi:ne180100]((uint64_t *)&v84, (uint64_t)&v100);
        v17 += 24;
        v19 = (float64x2_t *)((char *)v19 + 24);
      }
      while (v17 != *((void *)curve_private + 2));
      uint64_t v8 = v84;
      uint64_t v9 = v85;
      float64x2_t v10 = v81;
    }
  }
  double v20 = (float)(1.0 - a4);
  float64x2_t v88 = vaddq_f64(vmulq_n_f64(v82, v20), vmulq_n_f64(v10, a4));
  double v89 = v6 * v20 + v11 * a4;
  unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * ((v9 - v8) >> 3);
  if (v21 <= 1)
  {
    std::vector<cc::point_t<double,false,false>>::resize(&v91, 4uLL);
    goto LABEL_82;
  }
  if (v21 > 0x5555555555555554) {
    goto LABEL_82;
  }
  uint64_t v22 = v9 - 24;
  if (v9 - 24 == v8) {
    unint64_t v23 = v9 - 24;
  }
  else {
    unint64_t v23 = v9 - 48;
  }
  float64x2_t v101 = 0uLL;
  v100 = (void **)&unk_1F108BF48;
  std::vector<cc::point_t<double,false,false>>::resize(&v91, ((v9 - v8) >> 3) - 2);
  uint64_t v24 = v84;
  if (v84 != v22)
  {
    uint64_t v25 = 0;
    uint64_t v26 = v91;
    unint64_t v27 = v84;
    while (1)
    {
      v98 = &unk_1F108BF48;
      float64x2_t v99 = *(float64x2_t *)(v27 + 32);
      int8x16_t v28 = (int8x16_t)vsubq_f64(v99, *(float64x2_t *)(v27 + 8));
      float64x2_t v29 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64((float64x2_t)v28), (int8x16_t)vnegq_f64((float64x2_t)v28), v28);
      float64x2_t v101 = v29;
      if (v29.f64[0] < 0.0) {
        v29.f64[0] = -v29.f64[0];
      }
      v29.f64[0] = v29.f64[0] * 0.3334;
      uint64_t v30 = v26 + v25;
      *(_OWORD *)(v26 + v25 + 8) = *(_OWORD *)(v27 + 8);
      if (!v25) {
        break;
      }
      double v31 = v99.f64[0] - *(double *)(v27 - 16);
      double v32 = -v31;
      if (v31 >= 0.0) {
        double v32 = v99.f64[0] - *(double *)(v27 - 16);
      }
      double v33 = (v99.f64[1] - *(double *)(v27 - 8)) / v31;
      if (v32 < 0.00000011920929) {
        double v33 = 0.0;
      }
      v101.f64[1] = v33;
      v101.f64[0] = 1.0;
      float64_t v34 = v29.f64[0] * v33 + *(double *)(v27 + 16);
      *(double *)(v30 + 32) = v29.f64[0] + *(double *)(v27 + 8);
      *(float64_t *)(v30 + 40) = v34;
      if (v27 < v23) {
        goto LABEL_25;
      }
      float64x2_t v35 = v99;
      float64x2_t v97 = v99;
      float64x2_t v36 = *(float64x2_t *)(v30 + 32);
LABEL_28:
      float64x2_t v37 = vsubq_f64(v35, v36);
      double v38 = -v37.f64[0];
      if (v37.f64[0] >= 0.0) {
        double v38 = v37.f64[0];
      }
      *(void *)&double v39 = *(_OWORD *)&vdivq_f64((float64x2_t)vdupq_laneq_s64((int64x2_t)v37, 1), v37);
      if (v38 < 0.00000011920929) {
        double v39 = 0.0;
      }
      v101.f64[1] = v39;
      v101.f64[0] = 1.0;
      double v40 = v99.f64[1] - v29.f64[0] * v39;
      v41 = (float64x2_t *)(v26 + v25);
      v41[3].f64[1] = v99.f64[0] - v29.f64[0];
      v41[4].f64[0] = v40;
      if (!v25)
      {
        double v42 = v41[3].f64[1] - *(double *)(v27 + 8);
        double v43 = v40 - *(double *)(v27 + 16);
        double v44 = -v42;
        if (v42 >= 0.0) {
          double v44 = v41[3].f64[1] - *(double *)(v27 + 8);
        }
        double v45 = v43 / v42;
        if (v44 < 0.00000011920929) {
          double v45 = 0.0;
        }
        v101.f64[1] = v45;
        v101.f64[0] = 1.0;
        v97.f64[0] = v29.f64[0];
        v97.f64[1] = v29.f64[0] * v45;
        v29.f64[1] = v29.f64[0] * v45;
        v41[2] = vaddq_f64(v29, *(float64x2_t *)(v30 + 8));
      }
      v27 += 24;
      v25 += 72;
      if (v27 == v22) {
        goto LABEL_39;
      }
    }
    if (v27 >= v23) {
      float64x2_t v35 = v99;
    }
    else {
LABEL_25:
    }
      float64x2_t v35 = *(float64x2_t *)(v27 + 56);
    float64x2_t v36 = *(float64x2_t *)(v27 + 8);
    goto LABEL_28;
  }
LABEL_39:
  *(_OWORD *)(v92 - 16) = *(_OWORD *)(v9 - 16);
  if (0xAAAAAAAAAAAAAAABLL * ((v85 - v24) >> 3) >= 3 && v24 != v22)
  {
    uint64_t v47 = 0;
    v48 = (double *)(v91 + 64);
    do
    {
      v98 = &unk_1F108BF48;
      float64x2_t v99 = *(float64x2_t *)(v24 + v47 + 32);
      int8x16_t v49 = (int8x16_t)vsubq_f64(v99, *(float64x2_t *)(v24 + v47 + 8));
      int8x16_t v50 = vbslq_s8((int8x16_t)vcltzq_f64((float64x2_t)v49), (int8x16_t)vnegq_f64((float64x2_t)v49), v49);
      float64x2_t v101 = (float64x2_t)v50;
      double v51 = 1.0;
      if (*(double *)&v50.i64[1] > 0.00000011920929)
      {
        double v51 = 0.0;
        if (*(double *)v50.i64 > 0.00000011920929)
        {
          double v52 = *(double *)&v50.i64[1] / *(double *)v50.i64 * -3.0 + 1.0;
          if (v52 >= 0.0)
          {
            double v51 = 1.0;
            if (v52 <= 1.0) {
              double v51 = v52;
            }
          }
        }
      }
      double v53 = v51 * *(v48 - 6);
      double v54 = 1.0 - v51;
      *(v48 - 3) = v53 + (1.0 - v51) * *(v48 - 3);
      double v55 = v51 * v48[3];
      double *v48 = v55 + v54 * *v48;
      if (v24 + v47 != v23) {
        v48[6] = v55 + v54 * v48[6];
      }
      if (v47) {
        *(v48 - 9) = v53 + v54 * *(v48 - 9);
      }
      v47 += 24;
      v48 += 9;
    }
    while (v24 + v47 != v22);
    uint64_t v56 = 0;
    v57 = (double *)(v91 + 56);
    do
    {
      unint64_t v58 = v24 + v56;
      v98 = &unk_1F108BF48;
      float64x2_t v59 = *(float64x2_t *)(v24 + v56 + 32);
      float64x2_t v99 = v59;
      int8x16_t v60 = (int8x16_t)vsubq_f64(v59, *(float64x2_t *)(v24 + v56 + 8));
      int8x16_t v61 = vbslq_s8((int8x16_t)vcltzq_f64((float64x2_t)v60), (int8x16_t)vnegq_f64((float64x2_t)v60), v60);
      float64x2_t v101 = (float64x2_t)v61;
      double v62 = 1.0;
      if (*(double *)v61.i64 > 0.00000011920929)
      {
        double v62 = 0.0;
        if (*(double *)&v61.i64[1] > 0.00000011920929) {
          double v62 = *(double *)v61.i64 / *(double *)&v61.i64[1] * -3.0 + 1.0;
        }
      }
      double v63 = v62 * 0.25;
      if (v62 * 0.25 <= 1.0) {
        double v64 = v62 * 0.25;
      }
      else {
        double v64 = 1.0;
      }
      if (v63 >= 0.0) {
        double v65 = v64;
      }
      else {
        double v65 = 0.0;
      }
      double v66 = *(v57 - 6) * v65;
      double v67 = 1.0 - v65;
      *(v57 - 3) = v66 + *(v57 - 3) * (1.0 - v65);
      double v68 = v65 * v57[3];
      double *v57 = v68 + (1.0 - v65) * *v57;
      if (v58 < v23) {
        v57[6] = v68 + v67 * v57[6];
      }
      if (v56) {
        *(v57 - 9) = v66 + v67 * *(v57 - 9);
      }
      if (v59.f64[1] < *(double *)(v58 + 16))
      {
        if (v58 < v23)
        {
          double v69 = v57[4];
          double v70 = v57[1];
          double v71 = v69 - v70;
          if (v69 - v70 < 0.0) {
            double v71 = -(v69 - v70);
          }
          v57[1] = v67 * v70 + v65 * (v69 + v71);
          double v72 = v57[7];
          double v73 = v69 - v72;
          if (v69 - v72 > 0.0) {
            double v73 = -(v69 - v72);
          }
          v57[7] = v67 * v72 + v65 * (v69 + v73);
        }
        if (v56)
        {
          double v74 = *(v57 - 5);
          double v75 = *(v57 - 8);
          double v76 = v74 - v75;
          if (v74 - v75 < 0.0) {
            double v76 = -(v74 - v75);
          }
          *(v57 - 8) = v67 * v75 + v65 * (v74 + v76);
          double v77 = *(v57 - 2);
          double v78 = v74 - v77;
          if (v74 - v77 > 0.0) {
            double v78 = -(v74 - v77);
          }
          *(v57 - 2) = v67 * v77 + v65 * (v74 + v78);
        }
      }
      v56 += 24;
      v57 += 9;
    }
    while (v24 + v56 != v22);
  }
LABEL_82:
  v79 = +[PAEColorCurveChannelData channelDataWithRed:green:blue:curve:](PAEColorCurveChannelData, "channelDataWithRed:green:blue:curve:", &v83, *((double *)curve_private + 20), *((double *)curve_private + 21), *((double *)curve_private + 22), *(_OWORD *)&v81);
  v83 = &unk_1F1093990;
  v87 = &unk_1F10939D0;
  v100 = (void **)&v91;
  std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v100);
  v100 = (void **)&v84;
  std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v100);
  return v79;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = [(PAEColorCurveChannelData *)self curveRef];
  double v5 = v4[5];
  double v6 = v4[6];
  double v7 = v4[7];
  uint64_t v8 = [a3 curveRef];
  BOOL v10 = v5 == *(double *)(v8 + 40) && v6 == *(double *)(v8 + 48) && v7 == *(double *)(v8 + 56);
  if (v10
    && (uint64_t v12 = *((void *)v4 + 1),
        uint64_t v11 = *((void *)v4 + 2),
        uint64_t v13 = *(void *)(v8 + 8),
        v11 - v12 == *(void *)(v8 + 16) - v13))
  {
    if (v12 == v11)
    {
      LOBYTE(v18) = 1;
    }
    else
    {
      uint64_t v14 = v12 + 24;
      v15 = (double *)(v13 + 16);
      do
      {
        BOOL v16 = *(double *)(v14 - 16) == *(v15 - 1);
        double v17 = *v15;
        v15 += 3;
        BOOL v18 = *(double *)(v14 - 8) == v17 && v16;
        BOOL v19 = !v18 || v14 == v11;
        v14 += 24;
      }
      while (!v19);
    }
  }
  else
  {
    LOBYTE(v18) = 0;
  }
  return v18;
}

@end