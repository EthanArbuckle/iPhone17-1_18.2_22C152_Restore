@interface UISTransform3DGrader
- (UISTransform3DGrader)init;
- (_UISTransform3DGrade)_gradeTransform3D:(SEL)a3;
- (id).cxx_construct;
- (unint64_t)gradeStartTransform3D:(CATransform3D *)a3 endTransform3D:(CATransform3D *)a4;
- (unint64_t)gradeTransform3D:(CATransform3D *)a3;
- (void)allowHorizontalFlip:(BOOL)a3;
- (void)allowRotations:(const double *)a3 count:(unint64_t)a4;
- (void)allowRotations:(const double *)a3 count:(unint64_t)a4 lowerMultiplier:(double)a5 lowerConstant:(double)a6 upperMultiplier:(double)a7 upperConstant:(double)a8;
- (void)allowScales:(const double *)a3 count:(unint64_t)a4;
- (void)allowScales:(const double *)a3 count:(unint64_t)a4 lowerMultiplier:(double)a5 lowerConstant:(double)a6 upperMultiplier:(double)a7 upperConstant:(double)a8;
- (void)allowShear:(double)a3;
- (void)allowShift:(double)a3;
- (void)allowTranslation:(double)a3;
- (void)allowVerticalFlip:(BOOL)a3;
@end

@implementation UISTransform3DGrader

- (UISTransform3DGrader)init
{
  v7.receiver = self;
  v7.super_class = (Class)UISTransform3DGrader;
  v2 = [(UISTransform3DGrader *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v6 = 0;
    -[UISTransform3DGrader allowRotations:count:](v2, "allowRotations:count:", &v6, 1, 0x3FF0000000000000);
    [(UISTransform3DGrader *)v3 allowScales:&v5 count:1];
    *(_OWORD *)&v3->_allowedShear = xmmword_191AE27F0;
    *(void *)&v3->_allowedShift = 10;
    *(_WORD *)&v3->_allowHorizontalFlip = 0;
  }
  return v3;
}

- (void)allowRotations:(const double *)a3 count:(unint64_t)a4
{
}

- (void)allowRotations:(const double *)a3 count:(unint64_t)a4 lowerMultiplier:(double)a5 lowerConstant:(double)a6 upperMultiplier:(double)a7 upperConstant:(double)a8
{
  begin = self->_allowedRotations.__begin_;
  self->_allowedRotations.__end_ = begin;
  if (a4)
  {
    for (uint64_t i = 0; i != a4; ++i)
    {
      double v17 = a3[i];
      int64_t v18 = (COERCE__INT64(v17 * a5 + a6) >> 63) & 0x7FFFFFFFFFFFFFFFLL ^ COERCE_UNSIGNED_INT64(v17 * a5 + a6);
      BOOL v19 = v18 < 10;
      int64_t v20 = v18 - 10;
      if (v19) {
        uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v21 = 0;
      }
      uint64_t v22 = v21 ^ v20;
      value = self->_allowedRotations.__end_cap_.__value_;
      if (begin >= value)
      {
        v25 = self->_allowedRotations.__begin_;
        uint64_t v26 = begin - v25;
        unint64_t v27 = v26 + 1;
        if ((unint64_t)(v26 + 1) >> 61) {
          goto LABEL_43;
        }
        uint64_t v28 = (char *)value - (char *)v25;
        if (v28 >> 2 > v27) {
          unint64_t v27 = v28 >> 2;
        }
        if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v29 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v29 = v27;
        }
        if (v29)
        {
          unint64_t v29 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<double>>(v29);
          v25 = self->_allowedRotations.__begin_;
          begin = self->_allowedRotations.__end_;
        }
        else
        {
          uint64_t v30 = 0;
        }
        v31 = (double *)(v29 + 8 * v26);
        *(void *)v31 = v22;
        end = v31 + 1;
        while (begin != v25)
        {
          uint64_t v32 = *((void *)begin-- - 1);
          *((void *)v31-- - 1) = v32;
        }
        value = (double *)(v29 + 8 * v30);
        self->_allowedRotations.__begin_ = v31;
        self->_allowedRotations.__end_ = end;
        self->_allowedRotations.__end_cap_.__value_ = value;
        if (v25)
        {
          operator delete(v25);
          value = self->_allowedRotations.__end_cap_.__value_;
        }
      }
      else
      {
        *(void *)begin = v22;
        end = begin + 1;
      }
      self->_allowedRotations.__end_ = end;
      int64_t v33 = (COERCE__INT64(v17 * a7 + a8) >> 63) & 0x7FFFFFFFFFFFFFFFLL ^ COERCE_UNSIGNED_INT64(v17 * a7 + a8);
      int64_t v34 = v33 + 10;
      if (v33 >= -10) {
        uint64_t v35 = 0;
      }
      else {
        uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
      }
      uint64_t v36 = v35 ^ v34;
      if (end >= value)
      {
        v37 = self->_allowedRotations.__begin_;
        uint64_t v38 = end - v37;
        unint64_t v39 = v38 + 1;
        if ((unint64_t)(v38 + 1) >> 61) {
LABEL_43:
        }
          abort();
        uint64_t v40 = (char *)value - (char *)v37;
        if (v40 >> 2 > v39) {
          unint64_t v39 = v40 >> 2;
        }
        if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v41 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v41 = v39;
        }
        if (v41)
        {
          unint64_t v41 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<double>>(v41);
          v37 = self->_allowedRotations.__begin_;
          end = self->_allowedRotations.__end_;
        }
        else
        {
          uint64_t v42 = 0;
        }
        v43 = (double *)(v41 + 8 * v38);
        *(void *)v43 = v36;
        begin = v43 + 1;
        while (end != v37)
        {
          uint64_t v44 = *((void *)end-- - 1);
          *((void *)v43-- - 1) = v44;
        }
        self->_allowedRotations.__begin_ = v43;
        self->_allowedRotations.__end_ = begin;
        self->_allowedRotations.__end_cap_.__value_ = (double *)(v41 + 8 * v42);
        if (v37) {
          operator delete(v37);
        }
      }
      else
      {
        *(void *)end = v36;
        begin = end + 1;
      }
      self->_allowedRotations.__end_ = begin;
    }
  }
}

- (void)allowScales:(const double *)a3 count:(unint64_t)a4
{
}

- (void)allowScales:(const double *)a3 count:(unint64_t)a4 lowerMultiplier:(double)a5 lowerConstant:(double)a6 upperMultiplier:(double)a7 upperConstant:(double)a8
{
  begin = self->_allowedScales.__begin_;
  self->_allowedScales.__end_ = begin;
  if (a4)
  {
    for (uint64_t i = 0; i != a4; ++i)
    {
      double v17 = a3[i];
      int64_t v18 = (COERCE__INT64(v17 * a5 + a6) >> 63) & 0x7FFFFFFFFFFFFFFFLL ^ COERCE_UNSIGNED_INT64(v17 * a5 + a6);
      BOOL v19 = v18 < 10;
      int64_t v20 = v18 - 10;
      if (v19) {
        uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v21 = 0;
      }
      uint64_t v22 = v21 ^ v20;
      value = self->_allowedScales.__end_cap_.__value_;
      if (begin >= value)
      {
        v25 = self->_allowedScales.__begin_;
        uint64_t v26 = begin - v25;
        unint64_t v27 = v26 + 1;
        if ((unint64_t)(v26 + 1) >> 61) {
          goto LABEL_43;
        }
        uint64_t v28 = (char *)value - (char *)v25;
        if (v28 >> 2 > v27) {
          unint64_t v27 = v28 >> 2;
        }
        if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v29 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v29 = v27;
        }
        if (v29)
        {
          unint64_t v29 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<double>>(v29);
          v25 = self->_allowedScales.__begin_;
          begin = self->_allowedScales.__end_;
        }
        else
        {
          uint64_t v30 = 0;
        }
        v31 = (double *)(v29 + 8 * v26);
        *(void *)v31 = v22;
        end = v31 + 1;
        while (begin != v25)
        {
          uint64_t v32 = *((void *)begin-- - 1);
          *((void *)v31-- - 1) = v32;
        }
        value = (double *)(v29 + 8 * v30);
        self->_allowedScales.__begin_ = v31;
        self->_allowedScales.__end_ = end;
        self->_allowedScales.__end_cap_.__value_ = value;
        if (v25)
        {
          operator delete(v25);
          value = self->_allowedScales.__end_cap_.__value_;
        }
      }
      else
      {
        *(void *)begin = v22;
        end = begin + 1;
      }
      self->_allowedScales.__end_ = end;
      int64_t v33 = (COERCE__INT64(v17 * a7 + a8) >> 63) & 0x7FFFFFFFFFFFFFFFLL ^ COERCE_UNSIGNED_INT64(v17 * a7 + a8);
      int64_t v34 = v33 + 10;
      if (v33 >= -10) {
        uint64_t v35 = 0;
      }
      else {
        uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
      }
      uint64_t v36 = v35 ^ v34;
      if (end >= value)
      {
        v37 = self->_allowedScales.__begin_;
        uint64_t v38 = end - v37;
        unint64_t v39 = v38 + 1;
        if ((unint64_t)(v38 + 1) >> 61) {
LABEL_43:
        }
          abort();
        uint64_t v40 = (char *)value - (char *)v37;
        if (v40 >> 2 > v39) {
          unint64_t v39 = v40 >> 2;
        }
        if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v41 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v41 = v39;
        }
        if (v41)
        {
          unint64_t v41 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<double>>(v41);
          v37 = self->_allowedScales.__begin_;
          end = self->_allowedScales.__end_;
        }
        else
        {
          uint64_t v42 = 0;
        }
        v43 = (double *)(v41 + 8 * v38);
        *(void *)v43 = v36;
        begin = v43 + 1;
        while (end != v37)
        {
          uint64_t v44 = *((void *)end-- - 1);
          *((void *)v43-- - 1) = v44;
        }
        self->_allowedScales.__begin_ = v43;
        self->_allowedScales.__end_ = begin;
        self->_allowedScales.__end_cap_.__value_ = (double *)(v41 + 8 * v42);
        if (v37) {
          operator delete(v37);
        }
      }
      else
      {
        *(void *)end = v36;
        begin = end + 1;
      }
      self->_allowedScales.__end_ = begin;
    }
  }
}

- (void)allowShear:(double)a3
{
  uint64_t v3 = (*(uint64_t *)&a3 >> 63) & 0x7FFFFFFFFFFFFFFFLL ^ *(void *)&a3;
  uint64_t v4 = v3 + 0x3D00000000000000;
  BOOL v5 = v3 < (uint64_t)0xC300000000000000;
  uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (!v5) {
    uint64_t v6 = 0;
  }
  *(void *)&self->_allowedShear = v6 ^ v4;
}

- (void)allowTranslation:(double)a3
{
  uint64_t v3 = (*(uint64_t *)&a3 >> 63) & 0x7FFFFFFFFFFFFFFFLL ^ *(void *)&a3;
  uint64_t v4 = v3 + 10;
  BOOL v5 = v3 < -10;
  uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (!v5) {
    uint64_t v6 = 0;
  }
  *(void *)&self->_allowedTranslation = v6 ^ v4;
}

- (void)allowShift:(double)a3
{
  uint64_t v3 = (*(uint64_t *)&a3 >> 63) & 0x7FFFFFFFFFFFFFFFLL ^ *(void *)&a3;
  uint64_t v4 = v3 + 10;
  BOOL v5 = v3 < -10;
  uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (!v5) {
    uint64_t v6 = 0;
  }
  *(void *)&self->_allowedShift = v6 ^ v4;
}

- (void)allowHorizontalFlip:(BOOL)a3
{
  self->_allowHorizontalFlip = a3;
}

- (void)allowVerticalFlip:(BOOL)a3
{
  self->_allowVerticalFlip = a3;
}

- (_UISTransform3DGrade)_gradeTransform3D:(SEL)a3
{
  if ((*(void *)&a4->m11 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(void *)&a4->m12 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(void *)&a4->m13 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(void *)&a4->m14 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(void *)&a4->m21 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(void *)&a4->m22 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(void *)&a4->m23 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(void *)&a4->m24 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(void *)&a4->m31 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(void *)&a4->m32 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(void *)&a4->m33 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(void *)&a4->m34 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(void *)&a4->m41 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(void *)&a4->m42 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(void *)&a4->m43 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*(void *)&a4->m44 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    retstr->var0 = 1;
    retstr->var1 = (CGVector)vdupq_n_s64(0x7FF8000000000000uLL);
    return self;
  }
  v49 = self;
  long long v4 = *(_OWORD *)&a4->m33;
  v53[4] = *(_OWORD *)&a4->m31;
  v53[5] = v4;
  long long v5 = *(_OWORD *)&a4->m43;
  v53[6] = *(_OWORD *)&a4->m41;
  v53[7] = v5;
  long long v6 = *(_OWORD *)&a4->m13;
  v53[0] = *(_OWORD *)&a4->m11;
  v53[1] = v6;
  long long v7 = *(_OWORD *)&a4->m23;
  v53[2] = *(_OWORD *)&a4->m21;
  v53[3] = v7;
  self = (_UISTransform3DGrade *)MEMORY[0x192FE0B30](v53, a3);
  if (self)
  {
    memset(&v52, 0, sizeof(v52));
    long long v8 = *(_OWORD *)&a4->m33;
    *(_OWORD *)&v50.m31 = *(_OWORD *)&a4->m31;
    *(_OWORD *)&v50.m33 = v8;
    long long v9 = *(_OWORD *)&a4->m43;
    *(_OWORD *)&v50.m41 = *(_OWORD *)&a4->m41;
    *(_OWORD *)&v50.m43 = v9;
    long long v10 = *(_OWORD *)&a4->m13;
    *(_OWORD *)&v50.m11 = *(_OWORD *)&a4->m11;
    *(_OWORD *)&v50.m13 = v10;
    long long v11 = *(_OWORD *)&a4->m23;
    *(_OWORD *)&v50.m21 = *(_OWORD *)&a4->m21;
    *(_OWORD *)&v50.m23 = v11;
    CATransform3DGetAffineTransform(&transform, &v50);
    CGAffineTransformDecompose(&v52, &transform);
    CGFloat dx = v49->var1.dx;
    CGFloat dy = v49->var1.dy;
    if (*(void *)&dy != *(void *)&dx)
    {
      unint64_t v14 = (uint64_t)(*(void *)&dy - *(void *)&dx) >> 3;
      CGFloat dy = v49->var1.dx;
      do
      {
        unint64_t v15 = v14 >> 1;
        v16 = (double *)(*(void *)&dy + 8 * (v14 >> 1));
        double v18 = *v16;
        double v17 = v16 + 1;
        v14 += ~(v14 >> 1);
        if (v18 < v52.rotation) {
          CGFloat dy = *(double *)&v17;
        }
        else {
          unint64_t v14 = v15;
        }
      }
      while (v14);
    }
    BOOL v19 = (((uint64_t)(*(void *)&dy - *(void *)&dx) >> 3) & 0x8000000000000001) != 1;
    double width = v52.scale.width;
    double height = v52.scale.height;
    double v22 = fabs(v52.scale.width);
    if (LOBYTE(v49[3].var1.dx)) {
      double width = v22;
    }
    double v23 = fabs(v52.scale.height);
    if (BYTE1(v49[3].var1.dx)) {
      double height = v23;
    }
    double v45 = height;
    double v47 = width;
    BOOL v24 = _UISNearlyEqual(width, height);
    uint64_t v25 = (4 * v19) | 8;
    if (v24) {
      uint64_t v25 = 4 * v19;
    }
    CGFloat v26 = v49[1].var1.dx;
    CGFloat v27 = v49[1].var1.dy;
    unint64_t v28 = (uint64_t)(*(void *)&v27 - *(void *)&v26) >> 3;
    if (*(void *)&v27 == *(void *)&v26)
    {
      if ((v28 & 0x8000000000000001) != 1) {
        goto LABEL_47;
      }
    }
    else
    {
      CGFloat v29 = v49[1].var1.dx;
      unint64_t v30 = v28;
      do
      {
        unint64_t v31 = v30 >> 1;
        uint64_t v32 = (double *)(*(void *)&v29 + 8 * (v30 >> 1));
        double v34 = *v32;
        int64_t v33 = v32 + 1;
        v30 += ~(v30 >> 1);
        if (v34 < v47) {
          CGFloat v29 = *(double *)&v33;
        }
        else {
          unint64_t v30 = v31;
        }
      }
      while (v30);
      if ((((uint64_t)(*(void *)&v29 - *(void *)&v26) >> 3) & 0x8000000000000001) != 1) {
        goto LABEL_47;
      }
      CGFloat v27 = v49[1].var1.dx;
      do
      {
        unint64_t v35 = v28 >> 1;
        uint64_t v36 = (double *)(*(void *)&v27 + 8 * (v28 >> 1));
        double v38 = *v36;
        v37 = v36 + 1;
        v28 += ~(v28 >> 1);
        if (v38 < v45) {
          CGFloat v27 = *(double *)&v37;
        }
        else {
          unint64_t v28 = v35;
        }
      }
      while (v28);
    }
    if ((((uint64_t)(*(void *)&v27 - *(void *)&v26) >> 3) & 0x8000000000000001) == 1)
    {
LABEL_48:
      double v41 = v49[2].var1.dy;
      if (v49[2].var1.dx >= fabs(v52.horizontalShear)) {
        uint64_t v42 = v25;
      }
      else {
        uint64_t v42 = v25 | 0x20;
      }
      long double v43 = hypot(v52.translation.dx, v52.translation.dy);
      unint64_t v44 = v42 | 0x40;
      if (v41 >= v43) {
        unint64_t v44 = v42;
      }
      unint64_t v39 = retstr;
      retstr->var0 = v44;
      CGVector translation = v52.translation;
      goto LABEL_54;
    }
LABEL_47:
    v25 |= 0x10uLL;
    goto LABEL_48;
  }
  unint64_t v39 = retstr;
  retstr->var0 = 2;
  CGVector translation = (CGVector)vdupq_n_s64(0x7FF8000000000000uLL);
LABEL_54:
  v39->var1 = translation;
  return self;
}

- (unint64_t)gradeTransform3D:(CATransform3D *)a3
{
  long long v3 = *(_OWORD *)&a3->m33;
  v8[4] = *(_OWORD *)&a3->m31;
  v8[5] = v3;
  long long v4 = *(_OWORD *)&a3->m43;
  v8[6] = *(_OWORD *)&a3->m41;
  v8[7] = v4;
  long long v5 = *(_OWORD *)&a3->m13;
  v8[0] = *(_OWORD *)&a3->m11;
  v8[1] = v5;
  long long v6 = *(_OWORD *)&a3->m23;
  v8[2] = *(_OWORD *)&a3->m21;
  v8[3] = v6;
  [(UISTransform3DGrader *)self _gradeTransform3D:v8];
  return v9;
}

- (unint64_t)gradeStartTransform3D:(CATransform3D *)a3 endTransform3D:(CATransform3D *)a4
{
  uint64_t v22 = 0;
  double v23 = 0.0;
  double v24 = 0.0;
  long long v6 = *(_OWORD *)&a3->m33;
  v21[4] = *(_OWORD *)&a3->m31;
  v21[5] = v6;
  long long v7 = *(_OWORD *)&a3->m43;
  v21[6] = *(_OWORD *)&a3->m41;
  v21[7] = v7;
  long long v8 = *(_OWORD *)&a3->m13;
  v21[0] = *(_OWORD *)&a3->m11;
  v21[1] = v8;
  long long v9 = *(_OWORD *)&a3->m23;
  v21[2] = *(_OWORD *)&a3->m21;
  v21[3] = v9;
  [(UISTransform3DGrader *)self _gradeTransform3D:v21];
  uint64_t v18 = 0;
  double v19 = 0.0;
  double v20 = 0.0;
  long long v10 = *(_OWORD *)&a4->m33;
  v17[4] = *(_OWORD *)&a4->m31;
  v17[5] = v10;
  long long v11 = *(_OWORD *)&a4->m43;
  v17[6] = *(_OWORD *)&a4->m41;
  v17[7] = v11;
  long long v12 = *(_OWORD *)&a4->m13;
  v17[0] = *(_OWORD *)&a4->m11;
  v17[1] = v12;
  long long v13 = *(_OWORD *)&a4->m23;
  v17[2] = *(_OWORD *)&a4->m21;
  v17[3] = v13;
  [(UISTransform3DGrader *)self _gradeTransform3D:v17];
  double allowedShift = self->_allowedShift;
  long double v15 = hypot(v23 - v19, v24 - v20);
  return v18 | v22 | ((unint64_t)(allowedShift < v15) << 7);
}

- (void).cxx_destruct
{
  begin = self->_allowedScales.__begin_;
  if (begin)
  {
    self->_allowedScales.__end_ = begin;
    operator delete(begin);
  }
  long long v4 = self->_allowedRotations.__begin_;
  if (v4)
  {
    self->_allowedRotations.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end