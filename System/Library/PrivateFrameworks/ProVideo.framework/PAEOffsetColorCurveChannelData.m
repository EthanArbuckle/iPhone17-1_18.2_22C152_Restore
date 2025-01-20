@interface PAEOffsetColorCurveChannelData
+ (BOOL)supportsSecureCoding;
+ (id)channelDataWithRed:(double)a3 green:(double)a4 blue:(double)a5;
+ (id)channelDataWithRed:(double)a3 green:(double)a4 blue:(double)a5 curve:(const void *)a6;
- (BOOL)conformFromColorCurve:(id)a3;
- (BOOL)isAtDefaults;
- (BOOL)isEqual:(id)a3;
- (PAEOffsetColorCurveChannelData)init;
- (PAEOffsetColorCurveChannelData)initWithCoder:(id)a3;
- (PAEOffsetColorCurveChannelData)initWithRed:(double)a3 green:(double)a4 blue:(double)a5;
- (PAEOffsetColorCurveChannelData)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 curve:(const void *)a6;
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

@implementation PAEOffsetColorCurveChannelData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAEOffsetColorCurveChannelData)init
{
  v3.receiver = self;
  v3.super_class = (Class)PAEOffsetColorCurveChannelData;
  if ([(PAEOffsetColorCurveChannelData *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (PAEOffsetColorCurveChannelData)initWithRed:(double)a3 green:(double)a4 blue:(double)a5
{
  v6.receiver = self;
  v6.super_class = (Class)PAEOffsetColorCurveChannelData;
  if ([(PAEOffsetColorCurveChannelData *)&v6 init]) {
    operator new();
  }
  return 0;
}

+ (id)channelDataWithRed:(double)a3 green:(double)a4 blue:(double)a5
{
  v5 = (void *)[objc_alloc((Class)a1) initWithRed:a3 green:a4 blue:a5];

  return v5;
}

- (PAEOffsetColorCurveChannelData)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 curve:(const void *)a6
{
  v7.receiver = self;
  v7.super_class = (Class)PAEOffsetColorCurveChannelData;
  if ([(PAEOffsetColorCurveChannelData *)&v7 init]) {
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
    *((void *)curve_private + 16) = &unk_1F1094EB8;
    *((void *)curve_private + 20) = &unk_1F1094EF8;
    v5 = (void **)(curve_private + 208);
    std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v5);
    v5 = (void **)(curve_private + 136);
    std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v5);
    *(void *)curve_private = &unk_1F1094EB8;
    *((void *)curve_private + 4) = &unk_1F1094EF8;
    v5 = (void **)(curve_private + 80);
    std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v5);
    v5 = (void **)(curve_private + 8);
    std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v5);
    MEMORY[0x1BA9BFBA0](curve_private, 0x10A0C40A88C75BALL);
  }
  v4.receiver = self;
  v4.super_class = (Class)PAEOffsetColorCurveChannelData;
  [(PAEOffsetColorCurveChannelData *)&v4 dealloc];
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
  if (curve_private[5] == curve_private[21]
    && curve_private[6] == curve_private[22]
    && curve_private[7] == curve_private[23]
    && curve_private[8] == curve_private[24]
    && (uint64_t v4 = *((void *)curve_private + 10),
        uint64_t v3 = *((void *)curve_private + 11),
        objc_super v6 = (char *)(curve_private + 26),
        uint64_t v5 = *((void *)curve_private + 26),
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
  std::vector<cc::point_t<double,false,false>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<cc::point_t<double,false,false> const*>,std::__wrap_iter<cc::point_t<double,false,false> const*>>(v3, v5, *((void *)curve_private + 17), *((void *)curve_private + 18), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)curve_private + 18) - *((void *)curve_private + 17)) >> 3));
  BOOL v11 = (void (***)(void))*((void *)curve_private + 10);
  *(_OWORD *)(curve_private + 40) = *(_OWORD *)(curve_private + 168);
  *(_OWORD *)(curve_private + 56) = *(_OWORD *)(curve_private + 184);
  uint64_t v12 = *((void *)curve_private + 11);
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
    uint64_t v12 = *((void *)curve_private + 10);
  }
  *((void *)curve_private + 11) = v11;
  uint64_t v17 = *((void *)curve_private + 26);
  uint64_t v18 = *((void *)curve_private + 27);

  std::vector<cc::point_t<double,false,false>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<cc::point_t<double,false,false> const*>,std::__wrap_iter<cc::point_t<double,false,false> const*>>((uint64_t *)curve_private + 10, v12, v17, v18, 0xAAAAAAAAAAAAAAABLL * ((v18 - v17) >> 3));
}

- (double)evaluate:(double)a3
{
  double v4 = a3;
  (*(void (**)(void *, double *))(*(void *)self->_curve_private + 24))(self->_curve_private, &v4);
  return result;
}

- (BOOL)conformFromColorCurve:(id)a3
{
  double v4 = [(PAEOffsetColorCurveChannelData *)self curveRef];
  uint64_t v5 = [a3 curveRef];
  uint64_t v6 = (void (***)(void))*((void *)v4 + 1);
  uint64_t v7 = *((void *)v4 + 2);
  if ((void (***)(void))v7 != v6)
  {
    uint64_t v8 = v7 - 24;
    BOOL v9 = (void (***)(void))(v7 - 24);
    BOOL v10 = (void (***)(void))(v7 - 24);
    do
    {
      BOOL v11 = *v10;
      v10 -= 3;
      (*v11)(v9);
      v8 -= 24;
      BOOL v43 = v9 == v6;
      BOOL v9 = v10;
    }
    while (!v43);
    uint64_t v7 = *((void *)v4 + 1);
  }
  *((void *)v4 + 2) = v6;
  std::vector<cc::point_t<double,false,false>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<cc::point_t<double,false,false> const*>,std::__wrap_iter<cc::point_t<double,false,false> const*>>((uint64_t *)v4 + 1, v7, *(void *)(v5 + 8), *(void *)(v5 + 16), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v5 + 16) - *(void *)(v5 + 8)) >> 3));
  *(_OWORD *)(v4 + 40) = *(_OWORD *)(v5 + 40);
  *((void *)v4 + 7) = *(void *)(v5 + 56);
  *((void *)v4 + 8) = 0;
  uint64_t v12 = *((void *)v4 + 1);
  uint64_t v13 = *((void *)v4 + 2);
  unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((v13 - v12) >> 3);
  if (v14 <= 1)
  {
    std::vector<cc::point_t<double,false,false>>::resize((uint64_t *)v4 + 10, 4uLL);
    uint64_t v12 = *((void *)v4 + 1);
    uint64_t v13 = *((void *)v4 + 2);
    goto LABEL_59;
  }
  if (v14 <= 0x5555555555555554)
  {
    uint64_t v15 = v13 - 24;
    if (v13 - 24 == v12) {
      unint64_t v16 = v13 - 24;
    }
    else {
      unint64_t v16 = v13 - 48;
    }
    uint64_t v17 = v4 + 80;
    std::vector<cc::point_t<double,false,false>>::resize((uint64_t *)v4 + 10, ((v13 - v12) >> 3) - 2);
    uint64_t v12 = *((void *)v4 + 1);
    if (v12 != v15)
    {
      uint64_t v18 = 0;
      uint64_t v19 = *v17;
      unint64_t v20 = *((void *)v4 + 1);
      while (1)
      {
        float64x2_t v55 = *(float64x2_t *)(v20 + 32);
        int8x16_t v21 = (int8x16_t)vsubq_f64(v55, *(float64x2_t *)(v20 + 8));
        double v22 = *(double *)vbslq_s8((int8x16_t)vcltzq_f64((float64x2_t)v21), (int8x16_t)vnegq_f64((float64x2_t)v21), v21).i64;
        if (v22 < 0.0) {
          double v22 = -v22;
        }
        v23.f64[0] = v22 * 0.3334;
        *(_OWORD *)(v19 + v18 + 8) = *(_OWORD *)(v20 + 8);
        if (!v18) {
          break;
        }
        double v54 = *(double *)(v20 - 16);
        double v24 = *(double *)(v20 - 8);
        double v25 = -(v55.f64[0] - v54);
        if (v55.f64[0] - v54 >= 0.0) {
          double v25 = v55.f64[0] - v54;
        }
        double v26 = (v55.f64[1] - v24) / (v55.f64[0] - v54);
        if (v25 < 0.00000011920929) {
          double v26 = 0.0;
        }
        double v27 = *(double *)(v20 + 16);
        int v28 = v24 - v27 >= 0.0;
        int v29 = v55.f64[1] - v27 < 0.0;
        if (v29 != v28) {
          double v26 = 0.0;
        }
        double v30 = v23.f64[0] * v26 + *(double *)(v20 + 16);
        v31 = (float64x2_t *)(v19 + v18);
        v31[2].f64[0] = v23.f64[0] + *(double *)(v20 + 8);
        v31[2].f64[1] = v30;
        if (v29 != v28) {
          v31[-1].f64[1] = v30;
        }
        if (v20 < v16) {
          goto LABEL_28;
        }
        float64x2_t v32 = v55;
        float64x2_t v33 = v31[2];
LABEL_31:
        float64x2_t v34 = vsubq_f64(v32, v33);
        double v35 = -v34.f64[0];
        if (v34.f64[0] >= 0.0) {
          double v35 = v34.f64[0];
        }
        *(void *)&double v36 = *(_OWORD *)&vdivq_f64((float64x2_t)vdupq_laneq_s64((int64x2_t)v34, 1), v34);
        if (v35 < 0.00000011920929) {
          double v36 = 0.0;
        }
        double v37 = v55.f64[1] - v23.f64[0] * v36;
        v38 = (float64x2_t *)(v19 + v18);
        v38[3].f64[1] = v55.f64[0] - v23.f64[0];
        v38[4].f64[0] = v37;
        if (!v18)
        {
          double v39 = v38[3].f64[1] - *(double *)(v20 + 8);
          double v40 = v37 - *(double *)(v20 + 16);
          double v41 = -v39;
          if (v39 >= 0.0) {
            double v41 = v38[3].f64[1] - *(double *)(v20 + 8);
          }
          double v42 = v40 / v39;
          if (v41 < 0.00000011920929) {
            double v42 = 0.0;
          }
          v23.f64[1] = v23.f64[0] * v42;
          v38[2] = vaddq_f64(v23, *(float64x2_t *)(v19 + 8));
        }
        v20 += 24;
        v18 += 72;
        if (v20 == v15) {
          goto LABEL_42;
        }
      }
      if (v20 >= v16) {
        float64x2_t v32 = v55;
      }
      else {
LABEL_28:
      }
        float64x2_t v32 = *(float64x2_t *)(v20 + 56);
      float64x2_t v33 = *(float64x2_t *)(v20 + 8);
      goto LABEL_31;
    }
LABEL_42:
    *(_OWORD *)(*((void *)v4 + 11) - 16) = *(_OWORD *)(v13 - 16);
    uint64_t v13 = *((void *)v4 + 2);
    BOOL v43 = 0xAAAAAAAAAAAAAAABLL * ((v13 - v12) >> 3) < 3 || v12 == v15;
    if (!v43)
    {
      uint64_t v44 = 0;
      v45 = (double *)(*v17 + 64);
      do
      {
        int8x16_t v46 = (int8x16_t)vsubq_f64(*(float64x2_t *)(v12 + v44 + 32), *(float64x2_t *)(v12 + v44 + 8));
        int8x16_t v47 = vbslq_s8((int8x16_t)vcltzq_f64((float64x2_t)v46), (int8x16_t)vnegq_f64((float64x2_t)v46), v46);
        double v48 = 1.0;
        if (*(double *)&v47.i64[1] > 0.00000011920929)
        {
          double v48 = 0.0;
          if (*(double *)v47.i64 > 0.00000011920929)
          {
            double v49 = *(double *)&v47.i64[1] / *(double *)v47.i64 * -3.0 + 1.0;
            if (v49 >= 0.0)
            {
              double v48 = 1.0;
              if (v49 <= 1.0) {
                double v48 = v49;
              }
            }
          }
        }
        double v50 = v48 * *(v45 - 6);
        double v51 = 1.0 - v48;
        *(v45 - 3) = v50 + (1.0 - v48) * *(v45 - 3);
        double v52 = v48 * v45[3];
        double *v45 = v52 + v51 * *v45;
        if (v12 + v44 != v16) {
          v45[6] = v52 + v51 * v45[6];
        }
        if (v44) {
          *(v45 - 9) = v50 + v51 * *(v45 - 9);
        }
        v44 += 24;
        v45 += 9;
      }
      while (v12 + v44 != v15);
    }
  }
LABEL_59:
  while (v12 != v13)
  {
    *(double *)(v12 + 16) = *(double *)(v12 + 16) - *(double *)(v12 + 8);
    v12 += 24;
  }
  return 1;
}

- (PAEOffsetColorCurveChannelData)initWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)PAEOffsetColorCurveChannelData;
  if ([(PAEOffsetColorCurveChannelData *)&v5 init])
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
  if (curve_private[21] != 0.0) {
    objc_msgSend(a3, "encodeDouble:forKey:", @"defaultRed");
  }
  if (curve_private[22] != 0.0) {
    objc_msgSend(a3, "encodeDouble:forKey:", @"defaultGreen");
  }
  if (curve_private[23] != 0.0) {
    objc_msgSend(a3, "encodeDouble:forKey:", @"defaultBlue");
  }
  if (curve_private[8] != 0.0) {
    objc_msgSend(a3, "encodeDouble:forKey:", @"offset");
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
  double v5 = curve_private[21];
  double v6 = curve_private[22];
  double v7 = curve_private[23];

  return (id)[v4 initWithRed:curve_private green:v5 blue:v6 curve:v7];
}

- (id)description
{
  curve_private = self->_curve_private;
  id v4 = NSString;
  double v5 = (objc_class *)objc_opt_class();
  double v6 = (void *)[v4 stringWithFormat:@"<%@: %p>  red=%.3f, green=%.3f, blue=%.3f, offset=%.3f, pts={\n", NSStringFromClass(v5), self, curve_private[5], curve_private[6], curve_private[7], curve_private[8]];
  for (uint64_t i = curve_private[1]; i != curve_private[2]; i += 24)
    double v6 = (void *)[v6 stringByAppendingFormat:@"  %.3f, %.3f\n", *(void *)(i + 8), *(void *)(i + 16)];

  return (id)[v6 stringByAppendingString:@"}"];
}

- (id)interpolateBetween:(id)a3 withWeight:(float)a4
{
  curve_private = (double *)self->_curve_private;
  double v7 = [(PAEOffsetColorCurveChannelData *)self curveRef];
  double v8 = *((double *)v7 + 8);
  uint64_t v9 = [a3 curveRef];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  double v12 = *(double *)(v9 + 64);
  uint64_t v70 = 0;
  uint64_t v71 = 0;
  v68 = &unk_1F1094EB8;
  unint64_t v69 = 0;
  v72 = &unk_1F1094EF8;
  __asm { FMOV            V1.2D, #0.5 }
  float64x2_t v73 = _Q1;
  long long v74 = xmmword_1B7E73B80;
  uint64_t v77 = 0;
  uint64_t v78 = 0;
  v75 = &unk_1F1093A40;
  uint64_t v76 = 0;
  v79 = &unk_1F1093A68;
  v80 = cc::curve::aspline::bezier_t<double,false>::evalNonPeriodic;
  uint64_t v81 = 0;
  double v17 = *((double *)v7 + 7);
  float64x2_t v18 = *(float64x2_t *)(v7 + 40);
  float64x2_t v19 = *(float64x2_t *)(v9 + 40);
  double v20 = *(double *)(v9 + 56);
  uint64_t v22 = *((void *)v7 + 1);
  uint64_t v21 = *((void *)v7 + 2);
  uint64_t v23 = *(void *)(v9 + 8);
  if (v21 - v22 == *(void *)(v9 + 16) - v23)
  {
    v86 = (void **)&unk_1F108BF48;
    if (v22 == v21)
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
    }
    else
    {
      float64x2_t v66 = v19;
      float64x2_t v67 = v18;
      double v24 = (float64x2_t *)(v23 + 8);
      do
      {
        float64x2_t v87 = vaddq_f64(vmulq_n_f64(*v24, a4), vmulq_n_f64(*(float64x2_t *)(v22 + 8), (float)(1.0 - a4)));
        std::vector<cc::point_t<double,false,false>>::push_back[abi:ne180100]((uint64_t *)&v69, (uint64_t)&v86);
        v22 += 24;
        double v24 = (float64x2_t *)((char *)v24 + 24);
      }
      while (v22 != *((void *)v7 + 2));
      uint64_t v10 = v69;
      uint64_t v11 = v70;
      float64x2_t v19 = v66;
      float64x2_t v18 = v67;
    }
  }
  double v25 = (float)(1.0 - a4);
  float64x2_t v73 = vaddq_f64(vmulq_n_f64(v18, v25), vmulq_n_f64(v19, a4));
  *(double *)&long long v74 = v17 * v25 + v20 * a4;
  *((double *)&v74 + 1) = v8 * v25 + v12 * a4;
  unint64_t v26 = 0xAAAAAAAAAAAAAAABLL * ((v11 - v10) >> 3);
  if (v26 <= 1)
  {
    std::vector<cc::point_t<double,false,false>>::resize(&v76, 4uLL);
    goto LABEL_58;
  }
  if (v26 > 0x5555555555555554) {
    goto LABEL_58;
  }
  uint64_t v27 = v11 - 24;
  if (v11 - 24 == v10) {
    unint64_t v28 = v11 - 24;
  }
  else {
    unint64_t v28 = v11 - 48;
  }
  float64x2_t v87 = 0uLL;
  v86 = (void **)&unk_1F108BF48;
  std::vector<cc::point_t<double,false,false>>::resize(&v76, ((v11 - v10) >> 3) - 2);
  uint64_t v29 = v69;
  if (v69 != v27)
  {
    uint64_t v30 = 0;
    uint64_t v31 = v76;
    unint64_t v32 = v69;
    while (1)
    {
      v84 = &unk_1F108BF48;
      float64x2_t v85 = *(float64x2_t *)(v32 + 32);
      int8x16_t v33 = (int8x16_t)vsubq_f64(v85, *(float64x2_t *)(v32 + 8));
      float64x2_t v34 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64((float64x2_t)v33), (int8x16_t)vnegq_f64((float64x2_t)v33), v33);
      float64x2_t v87 = v34;
      if (v34.f64[0] < 0.0) {
        v34.f64[0] = -v34.f64[0];
      }
      v34.f64[0] = v34.f64[0] * 0.3334;
      *(_OWORD *)(v31 + v30 + 8) = *(_OWORD *)(v32 + 8);
      if (!v30) {
        break;
      }
      v82 = &unk_1F108BF48;
      v83.f64[0] = *(float64_t *)(v32 - 16);
      double v35 = *(double *)(v32 - 8);
      v83.f64[1] = v35;
      double v36 = -(v85.f64[0] - v83.f64[0]);
      if (v85.f64[0] - v83.f64[0] >= 0.0) {
        double v36 = v85.f64[0] - v83.f64[0];
      }
      double v37 = (v85.f64[1] - v35) / (v85.f64[0] - v83.f64[0]);
      if (v36 < 0.00000011920929) {
        double v37 = 0.0;
      }
      v87.f64[1] = v37;
      v87.f64[0] = 1.0;
      double v38 = *(double *)(v32 + 16);
      int v39 = v35 - v38 >= 0.0;
      int v40 = v85.f64[1] - v38 < 0.0;
      if (v40 != v39)
      {
        v87.f64[1] = 0.0;
        double v37 = 0.0;
      }
      double v41 = v34.f64[0] * v37 + *(double *)(v32 + 16);
      double v42 = (float64x2_t *)(v31 + v30);
      v42[2].f64[0] = v34.f64[0] + *(double *)(v32 + 8);
      v42[2].f64[1] = v41;
      if (v40 != v39) {
        v42[-1].f64[1] = v41;
      }
      if (v32 < v28) {
        goto LABEL_29;
      }
      float64x2_t v43 = v85;
      float64x2_t v83 = v85;
      float64x2_t v44 = v42[2];
LABEL_32:
      float64x2_t v45 = vsubq_f64(v43, v44);
      double v46 = -v45.f64[0];
      if (v45.f64[0] >= 0.0) {
        double v46 = v45.f64[0];
      }
      *(void *)&double v47 = *(_OWORD *)&vdivq_f64((float64x2_t)vdupq_laneq_s64((int64x2_t)v45, 1), v45);
      if (v46 < 0.00000011920929) {
        double v47 = 0.0;
      }
      v87.f64[1] = v47;
      v87.f64[0] = 1.0;
      double v48 = v85.f64[1] - v34.f64[0] * v47;
      double v49 = (float64x2_t *)(v31 + v30);
      v49[3].f64[1] = v85.f64[0] - v34.f64[0];
      v49[4].f64[0] = v48;
      if (!v30)
      {
        double v50 = v49[3].f64[1] - *(double *)(v32 + 8);
        double v51 = v48 - *(double *)(v32 + 16);
        double v52 = -v50;
        if (v50 >= 0.0) {
          double v52 = v49[3].f64[1] - *(double *)(v32 + 8);
        }
        double v53 = v51 / v50;
        if (v52 < 0.00000011920929) {
          double v53 = 0.0;
        }
        v87.f64[1] = v53;
        v87.f64[0] = 1.0;
        v83.f64[0] = v34.f64[0];
        v83.f64[1] = v34.f64[0] * v53;
        v34.f64[1] = v34.f64[0] * v53;
        v49[2] = vaddq_f64(v34, *(float64x2_t *)(v31 + 8));
      }
      v32 += 24;
      v30 += 72;
      if (v32 == v27) {
        goto LABEL_43;
      }
    }
    if (v32 >= v28) {
      float64x2_t v43 = v85;
    }
    else {
LABEL_29:
    }
      float64x2_t v43 = *(float64x2_t *)(v32 + 56);
    float64x2_t v44 = *(float64x2_t *)(v32 + 8);
    goto LABEL_32;
  }
LABEL_43:
  *(_OWORD *)(v77 - 16) = *(_OWORD *)(v11 - 16);
  if (0xAAAAAAAAAAAAAAABLL * ((v70 - v29) >> 3) >= 3 && v29 != v27)
  {
    uint64_t v55 = 0;
    v56 = (double *)(v76 + 64);
    do
    {
      v84 = &unk_1F108BF48;
      float64x2_t v85 = *(float64x2_t *)(v29 + v55 + 32);
      int8x16_t v57 = (int8x16_t)vsubq_f64(v85, *(float64x2_t *)(v29 + v55 + 8));
      int8x16_t v58 = vbslq_s8((int8x16_t)vcltzq_f64((float64x2_t)v57), (int8x16_t)vnegq_f64((float64x2_t)v57), v57);
      float64x2_t v87 = (float64x2_t)v58;
      double v59 = 1.0;
      if (*(double *)&v58.i64[1] > 0.00000011920929)
      {
        double v59 = 0.0;
        if (*(double *)v58.i64 > 0.00000011920929)
        {
          double v60 = *(double *)&v58.i64[1] / *(double *)v58.i64 * -3.0 + 1.0;
          if (v60 >= 0.0)
          {
            double v59 = 1.0;
            if (v60 <= 1.0) {
              double v59 = v60;
            }
          }
        }
      }
      double v61 = v59 * *(v56 - 6);
      double v62 = 1.0 - v59;
      *(v56 - 3) = v61 + (1.0 - v59) * *(v56 - 3);
      double v63 = v59 * v56[3];
      double *v56 = v63 + v62 * *v56;
      if (v29 + v55 != v28) {
        v56[6] = v63 + v62 * v56[6];
      }
      if (v55) {
        *(v56 - 9) = v61 + v62 * *(v56 - 9);
      }
      v55 += 24;
      v56 += 9;
    }
    while (v29 + v55 != v27);
  }
LABEL_58:
  v64 = +[PAEOffsetColorCurveChannelData channelDataWithRed:green:blue:curve:](PAEOffsetColorCurveChannelData, "channelDataWithRed:green:blue:curve:", &v68, curve_private[21], curve_private[22], curve_private[23], *(_OWORD *)&v66, *(_OWORD *)&v67);
  v68 = &unk_1F1094EB8;
  v72 = &unk_1F1094EF8;
  v86 = (void **)&v76;
  std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v86);
  v86 = (void **)&v69;
  std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v86);
  return v64;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = [(PAEOffsetColorCurveChannelData *)self curveRef];
  double v5 = v4[8];
  uint64_t v6 = [a3 curveRef];
  if (v5 == *(double *)(v6 + 64)
    && (uint64_t v8 = *((void *)v4 + 1),
        uint64_t v7 = *((void *)v4 + 2),
        uint64_t v9 = *(void *)(v6 + 8),
        v7 - v8 == *(void *)(v6 + 16) - v9))
  {
    if (v8 == v7)
    {
      LOBYTE(v14) = 1;
    }
    else
    {
      uint64_t v10 = v8 + 24;
      uint64_t v11 = (double *)(v9 + 16);
      do
      {
        BOOL v12 = *(double *)(v10 - 16) == *(v11 - 1);
        double v13 = *v11;
        v11 += 3;
        BOOL v14 = *(double *)(v10 - 8) == v13 && v12;
        BOOL v15 = !v14 || v10 == v7;
        v10 += 24;
      }
      while (!v15);
    }
  }
  else
  {
    LOBYTE(v14) = 0;
  }
  return v14;
}

@end