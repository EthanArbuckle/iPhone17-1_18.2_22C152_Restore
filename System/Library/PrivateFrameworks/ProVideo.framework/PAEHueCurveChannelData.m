@interface PAEHueCurveChannelData
+ (BOOL)supportsSecureCoding;
+ (id)channelDataWithCurve:(const void *)a3;
- (BOOL)isAtDefaults;
- (BOOL)isEqual:(id)a3;
- (PAEHueCurveChannelData)init;
- (PAEHueCurveChannelData)initWithCoder:(id)a3;
- (PAEHueCurveChannelData)initWithCurve:(const void *)a3;
- (double)evaluate:(double)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)interpolateBetween:(id)a3 withWeight:(float)a4;
- (void)curveRef;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
@end

@implementation PAEHueCurveChannelData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAEHueCurveChannelData)init
{
  v3.receiver = self;
  v3.super_class = (Class)PAEHueCurveChannelData;
  if ([(PAEHueCurveChannelData *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (PAEHueCurveChannelData)initWithCurve:(const void *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PAEHueCurveChannelData;
  if ([(PAEHueCurveChannelData *)&v4 init]) {
    operator new();
  }
  return 0;
}

+ (id)channelDataWithCurve:(const void *)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)a1) initWithCurve:a3];

  return v3;
}

- (void)dealloc
{
  curve_private = (char *)self->_curve_private;
  if (curve_private)
  {
    *((void *)curve_private + 13) = &unk_1F108BF78;
    *((void *)curve_private + 17) = &unk_1F108BFB8;
    v5 = (void **)(curve_private + 160);
    std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v5);
    v5 = (void **)(curve_private + 112);
    std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v5);
    *(void *)curve_private = &unk_1F108BF78;
    *((void *)curve_private + 4) = &unk_1F108BFB8;
    v5 = (void **)(curve_private + 56);
    std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v5);
    v5 = (void **)(curve_private + 8);
    std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v5);
    MEMORY[0x1BA9BFBA0](curve_private, 0x10A0C405284425BLL);
  }
  v4.receiver = self;
  v4.super_class = (Class)PAEHueCurveChannelData;
  [(PAEHueCurveChannelData *)&v4 dealloc];
}

- (void)curveRef
{
  return self->_curve_private;
}

- (BOOL)isAtDefaults
{
  curve_private = (double *)self->_curve_private;
  if (curve_private[5] == curve_private[18]
    && (uint64_t v4 = *((void *)curve_private + 7),
        uint64_t v3 = *((void *)curve_private + 8),
        v6 = (char *)(curve_private + 20),
        uint64_t v5 = *((void *)curve_private + 20),
        v3 - v4 == *((void *)v6 + 1) - v5))
  {
    if (v4 == v3)
    {
      LOBYTE(v11) = 1;
    }
    else
    {
      v7 = (double *)(v5 + 16);
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
  curve_private = self->_curve_private;
  uint64_t v3 = curve_private + 1;
  uint64_t v4 = (void (***)(void))curve_private[1];
  uint64_t v5 = curve_private[2];
  if ((void (***)(void))v5 != v4)
  {
    uint64_t v6 = v5 - 24;
    v7 = (void (***)(void))(v5 - 24);
    uint64_t v8 = (void (***)(void))(v5 - 24);
    do
    {
      BOOL v9 = *v8;
      v8 -= 3;
      (*v9)(v7);
      v6 -= 24;
      BOOL v10 = v7 == v4;
      v7 = v8;
    }
    while (!v10);
    uint64_t v5 = *v3;
  }
  curve_private[2] = v4;
  std::vector<cc::point_t<double,false,false>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<cc::point_t<double,false,false> const*>,std::__wrap_iter<cc::point_t<double,false,false> const*>>(v3, v5, curve_private[14], curve_private[15], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(curve_private[15] - curve_private[14]) >> 3));
  BOOL v11 = (void (***)(void))curve_private[7];
  curve_private[5] = curve_private[18];
  uint64_t v12 = curve_private[8];
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
    uint64_t v12 = curve_private[7];
  }
  curve_private[8] = v11;
  uint64_t v17 = curve_private[20];
  uint64_t v18 = curve_private[21];

  std::vector<cc::point_t<double,false,false>>::__insert_with_size[abi:ne180100]<std::__wrap_iter<cc::point_t<double,false,false> const*>,std::__wrap_iter<cc::point_t<double,false,false> const*>>(curve_private + 7, v12, v17, v18, 0xAAAAAAAAAAAAAAABLL * ((v18 - v17) >> 3));
}

- (double)evaluate:(double)a3
{
  double v4 = a3;
  (*(void (**)(void *, double *))(*(void *)self->_curve_private + 24))(self->_curve_private, &v4);
  return result;
}

- (PAEHueCurveChannelData)initWithCoder:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)PAEHueCurveChannelData;
  if ([(PAEHueCurveChannelData *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  curve_private = (double *)self->_curve_private;
  if (curve_private[5] != 0.0) {
    objc_msgSend(a3, "encodeDouble:forKey:", @"offset");
  }
  id v6 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)curve_private + 2) - *((void *)curve_private + 1)) >> 3)];
  for (uint64_t i = *((void *)curve_private + 1); i != *((void *)curve_private + 2); i += 24)
    objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", *(double *)(i + 8), *(double *)(i + 16)));
  [a3 encodeObject:v6 forKey:@"points"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  curve_private = self->_curve_private;
  id v4 = objc_alloc((Class)objc_opt_class());

  return (id)[v4 initWithCurve:curve_private];
}

- (id)description
{
  curve_private = self->_curve_private;
  id v4 = NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = (void *)[v4 stringWithFormat:@"<%@: %p> offset=%.3f, pts={\n", NSStringFromClass(v5), self, curve_private[5]];
  for (uint64_t i = curve_private[1]; i != curve_private[2]; i += 24)
    id v6 = (void *)[v6 stringByAppendingFormat:@"  %.3f, %.3f\n", *(void *)(i + 8), *(void *)(i + 16)];

  return (id)[v6 stringByAppendingString:@"}"];
}

- (id)interpolateBetween:(id)a3 withWeight:(float)a4
{
  id v6 = [(PAEHueCurveChannelData *)self curveRef];
  double v7 = v6[5];
  uint64_t v8 = [a3 curveRef];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  double v12 = *(double *)(v8 + 40);
  uint64_t v77 = 0;
  uint64_t v78 = 0;
  v75 = &unk_1F108BF78;
  uint64_t v76 = 0;
  v79 = &unk_1F108BFB8;
  double v80 = 0.0;
  uint64_t v83 = 0;
  uint64_t v84 = 0;
  v81 = &unk_1F108C0A0;
  uint64_t v82 = 0;
  v85 = &unk_1F108C0C8;
  v86 = cc::curve::aspline::bezier_t<double,true>::evalPeriodic;
  uint64_t v87 = 0;
  uint64_t v14 = *((void *)v6 + 1);
  uint64_t v13 = *((void *)v6 + 2);
  uint64_t v15 = *(void *)(v8 + 8);
  if (v13 - v14 == *(void *)(v8 + 16) - v15)
  {
    v93 = (void **)&unk_1F108BF48;
    if (v14 == v13)
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
    }
    else
    {
      *(double *)&long long v9 = a4;
      long long v74 = v9;
      *(double *)&long long v9 = (float)(1.0 - a4);
      long long v73 = v9;
      v16 = (float64x2_t *)(v15 + 8);
      do
      {
        float64x2_t v94 = vaddq_f64(vmulq_n_f64(*v16, *(double *)&v74), vmulq_n_f64(*(float64x2_t *)(v14 + 8), *(double *)&v73));
        std::vector<cc::point_t<double,false,false>>::push_back[abi:ne180100](&v76, (uint64_t)&v93);
        v14 += 24;
        v16 = (float64x2_t *)((char *)v16 + 24);
      }
      while (v14 != *((void *)v6 + 2));
      uint64_t v10 = v76;
      uint64_t v11 = v77;
    }
  }
  double v80 = v7 * (float)(1.0 - a4) + v12 * a4;
  uint64_t v17 = v11 - v10;
  unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * ((v11 - v10) >> 3);
  if (v18 <= 1)
  {
    std::vector<cc::point_t<double,false,false>>::resize(&v82, 4uLL);
    if (v76 == v77) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = *(void *)(v76 + 16);
    }
    v54 = (void *)v82;
    *(void *)(v82 + 8) = 0;
    v54[2] = v19;
    v54[4] = 0x3FD5566CF41F212DLL;
    v54[5] = v19;
    v54[7] = 0x3FE554C985F06F6ALL;
    v54[8] = v19;
    v54[10] = 0x3FF0000000000000;
    v54[11] = v19;
    goto LABEL_78;
  }
  if (v18 > 0x5555555555555554) {
    goto LABEL_78;
  }
  if (v11 == v10) {
    uint64_t v20 = 0;
  }
  else {
    uint64_t v20 = -1;
  }
  float64x2_t v94 = 0uLL;
  v93 = (void **)&unk_1F108BF48;
  std::vector<cc::point_t<double,false,false>>::resize(&v82, ((v11 - v10) >> 3) + 1);
  uint64_t v21 = v11 + 24 * v20;
  if (v76 != v11)
  {
    uint64_t v22 = 0;
    uint64_t v23 = v76 + 48;
    uint64_t v24 = v82 + 32;
    while (1)
    {
      uint64_t v25 = v23 - 48;
      uint64_t v26 = v23 - 24;
      uint64_t v27 = v76;
      v91 = &unk_1F108BF48;
      if (v23 - 48 == v21) {
        uint64_t v28 = v76;
      }
      else {
        uint64_t v28 = v23 - 24;
      }
      float64x2_t v29 = *(float64x2_t *)(v28 + 8);
      float64x2_t v92 = v29;
      if (v23 - 48 == v21)
      {
        double v30 = v29.f64[0] + 1.0;
        v92.f64[0] = v29.f64[0] + 1.0;
      }
      else
      {
        double v30 = v29.f64[0];
      }
      v29.f64[0] = v30;
      int8x16_t v31 = (int8x16_t)vsubq_f64(v29, *(float64x2_t *)(v23 - 40));
      float64x2_t v32 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64((float64x2_t)v31), (int8x16_t)vnegq_f64((float64x2_t)v31), v31);
      float64x2_t v94 = v32;
      if (v32.f64[0] < 0.0) {
        v32.f64[0] = -v32.f64[0];
      }
      *(_OWORD *)(v24 - 24) = *(_OWORD *)(v23 - 40);
      uint64_t v33 = v23 - 72;
      v88 = &unk_1F108BF48;
      if (v25 == v27) {
        uint64_t v33 = v11 + 24 * v20;
      }
      double v35 = *(double *)(v33 + 8);
      double v34 = *(double *)(v33 + 16);
      double v90 = v34;
      if (v25 == v27)
      {
        double v35 = v35 + -1.0;
        double v89 = v35;
      }
      double v36 = v92.f64[0] - v35;
      double v37 = -v36;
      if (v36 >= 0.0) {
        double v37 = v36;
      }
      double v38 = (v92.f64[1] - v34) / v36;
      if (v37 < 0.00000011920929) {
        double v38 = 0.0;
      }
      v94.f64[1] = v38;
      v94.f64[0] = 1.0;
      double v39 = *(double *)(v23 - 32);
      int v40 = v34 - v39 >= 0.0;
      int v41 = v92.f64[1] - v39 < 0.0;
      if (v41 != v40)
      {
        v94.f64[1] = 0.0;
        double v38 = 0.0;
      }
      v32.f64[0] = v32.f64[0] * 0.3334;
      int v42 = v41 ^ v40;
      double v43 = v32.f64[0] * v38 + *(double *)(v23 - 32);
      *(double *)uint64_t v24 = v32.f64[0] + *(double *)(v23 - 40);
      *(double *)(v24 + 8) = v43;
      if (v22-- == 0) {
        int v42 = 0;
      }
      if (v42 == 1) {
        *(double *)(v24 - 40) = v43;
      }
      if (v25 == v21) {
        goto LABEL_43;
      }
      if (v17 != 48) {
        break;
      }
      v88 = &unk_1F108BF48;
      double v45 = *(double *)(v23 - 40);
      double v46 = *(double *)(v23 - 32);
LABEL_46:
      double v45 = v45 + 1.0;
LABEL_47:
      double v49 = v45 - *(double *)(v23 - 40);
      double v50 = v46 - *(double *)(v23 - 32);
      double v51 = -v49;
      if (v49 >= 0.0) {
        double v51 = v49;
      }
      double v52 = v50 / v49;
      if (v51 < 0.00000011920929) {
        double v52 = 0.0;
      }
      v94.f64[1] = v52;
      v94.f64[0] = 1.0;
      v32.f64[1] = v32.f64[0] * v52;
      *(float64x2_t *)(v24 + 24) = vsubq_f64(v92, v32);
      v23 += 24;
      v24 += 72;
      if (v26 == v11)
      {
        uint64_t v53 = v76;
        goto LABEL_56;
      }
    }
    if (v25 == v21 - 24)
    {
LABEL_43:
      BOOL v47 = v25 != v21;
      uint64_t v48 = v27 + 24 * (v25 == v21);
    }
    else
    {
      BOOL v47 = 0;
      uint64_t v48 = v23;
    }
    double v45 = *(double *)(v48 + 8);
    double v46 = *(double *)(v48 + 16);
    if (!v47 && v25 != v21) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
  uint64_t v53 = v11;
LABEL_56:
  uint64_t v55 = v83;
  uint64_t v56 = *(void *)(v53 + 16);
  *(double *)(v83 - 16) = *(double *)(v53 + 8) + 1.0;
  *(void *)(v55 - 8) = v56;
  if (0xAAAAAAAAAAAAAAABLL * ((v77 - v53) >> 3) >= 3 && v53 != v11)
  {
    uint64_t v57 = 0;
    v58 = (double *)(v82 + 64);
    do
    {
      v91 = &unk_1F108BF48;
      if (v53 + v57 == v21) {
        uint64_t v59 = v53;
      }
      else {
        uint64_t v59 = v53 + v57 + 24;
      }
      double v61 = *(double *)(v59 + 8);
      double v60 = *(double *)(v59 + 16);
      v92.f64[0] = v61;
      v92.f64[1] = v60;
      if (v53 + v57 == v21)
      {
        double v61 = v61 + 1.0;
        v92.f64[0] = v61;
      }
      double v62 = v61 - *(double *)(v53 + v57 + 8);
      if (v62 < 0.0) {
        double v62 = -v62;
      }
      v94.f64[0] = v62;
      double v63 = v60 - *(double *)(v53 + v57 + 16);
      double v64 = -v63;
      if (v63 >= 0.0) {
        double v64 = v63;
      }
      v94.f64[1] = v64;
      double v65 = 1.0;
      if (v64 > 0.00000011920929)
      {
        double v65 = 0.0;
        if (v62 > 0.00000011920929)
        {
          double v66 = v64 / v62 * -3.0 + 1.0;
          if (v66 >= 0.0)
          {
            double v65 = 1.0;
            if (v66 <= 1.0) {
              double v65 = v66;
            }
          }
        }
      }
      double v67 = v65 * *(v58 - 6);
      double v68 = 1.0 - v65;
      *(v58 - 3) = v67 + (1.0 - v65) * *(v58 - 3);
      double v69 = v65 * v58[3];
      double *v58 = v69 + v68 * *v58;
      if (v53 + v57 != v21) {
        v58[6] = v69 + v68 * v58[6];
      }
      uint64_t v70 = v53 + v57;
      if (v53 + v57 != v53) {
        *(v58 - 9) = v67 + v68 * *(v58 - 9);
      }
      v57 += 24;
      v58 += 9;
    }
    while (v70 + 24 != v11);
  }
LABEL_78:
  v71 = +[PAEHueCurveChannelData channelDataWithCurve:](PAEHueCurveChannelData, "channelDataWithCurve:", &v75, v73, v74);
  v75 = &unk_1F108BF78;
  v79 = &unk_1F108BFB8;
  v93 = (void **)&v82;
  std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v93);
  v93 = (void **)&v76;
  std::vector<cc::point_t<double,false,false>>::__destroy_vector::operator()[abi:ne180100](&v93);
  return v71;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = [(PAEHueCurveChannelData *)self curveRef];
  double v5 = v4[5];
  uint64_t v6 = [a3 curveRef];
  if (v5 == *(double *)(v6 + 40)
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