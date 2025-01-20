@interface PKRegion
+ (BOOL)supportsSecureCoding;
+ (id)infiniteRegion;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)isEmpty;
- (BOOL)isEqualToRegion:(id)a3;
- (BOOL)isInfinite;
- (CGPath)path;
- (PKRegion)initWithCoder:(id)a3;
- (PKRegion)initWithPath:(CGPath *)a3;
- (PKRegion)initWithRadius:(float)a3;
- (PKRegion)initWithSize:(CGSize)a3;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)inverseRegion;
- (id)regionByDifferenceFromRegion:(id)a3;
- (id)regionByIntersectionWithRegion:(id)a3;
- (id)regionByUnionWithRegion:(id)a3;
- (void)containsPoints:(const float *)a3 locationStride:(int64_t)a4 results:(char *)a5 resultsStride:(int64_t)a6 count:(int)a7;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKRegion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)infiniteRegion
{
  v2 = (void *)sharedInfiniteRegion;
  if (!sharedInfiniteRegion)
  {
    v3 = objc_alloc_init(PKRegion);
    v4 = (void *)sharedInfiniteRegion;
    sharedInfiniteRegion = (uint64_t)v3;

    v2 = (void *)sharedInfiniteRegion;
    *(_DWORD *)(sharedInfiniteRegion + 8) = 1;
  }

  return v2;
}

- (BOOL)isEqualToRegion:(id)a3
{
  v4 = (PKRegion *)a3;
  v5 = (float32x4_t *)v4;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    if (self->_shape != v4->_shape || self->_isExclusive != v4->_isExclusive) {
      goto LABEL_22;
    }
    BOOL v6 = 0;
    int16x4_t v7 = vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_anon_10[3], *(float32x4_t *)&v4->_anon_10[3])));
    if ((v7.i8[0] & 1) == 0 && (v7.i8[2] & 1) == 0 && (v7.i8[4] & 1) == 0)
    {
      ptr = (CGPathRef *)self->_path.__ptr_;
      v9 = (CGPathRef *)v4->_path.__ptr_;
      if (ptr)
      {
        if (!v9 || !CGPathEqualToPath(*ptr, *v9)) {
          goto LABEL_22;
        }
      }
      else if (v9)
      {
        goto LABEL_22;
      }
      if (self->_shape2 != v5[3].i32[1]) {
        goto LABEL_22;
      }
      BOOL v6 = 0;
      int16x4_t v10 = vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)self->_anon_40, v5[4])));
      if ((v10.i8[0] & 1) == 0 && (v10.i8[2] & 1) == 0 && (v10.i8[4] & 1) == 0)
      {
        v11 = (CGPathRef *)self->_path2.__ptr_;
        v12 = (CGPathRef *)v5[5].i64[0];
        if (v11)
        {
          if (v12 && CGPathEqualToPath(*v11, *v12)) {
            goto LABEL_20;
          }
        }
        else if (!v12)
        {
LABEL_20:
          BOOL v6 = self->_regionOp == v5[3].i32[0];
          goto LABEL_23;
        }
LABEL_22:
        BOOL v6 = 0;
      }
    }
  }
LABEL_23:

  return v6;
}

- (CGPath)path
{
  int shape = self->_shape;
  switch(shape)
  {
    case 2:
      v5 = *(const CGPath **)self->_path.__ptr_;
      if (v5) {
        CGPathRelease(v5);
      }
      long long v6 = *(_OWORD *)&self->_anon_10[3];
      double v7 = (float)-*(float *)&v6;
      LODWORD(v8) = HIDWORD(*(void *)&self->_anon_10[3]);
      double v9 = (float)-v8;
      *(double *)&long long v6 = (float)(*(float *)&v6 + *(float *)&v6);
      double v10 = (float)(v8 + v8);
      result = CGPathCreateWithEllipseInRect(*(CGRect *)(&v6 - 1), 0);
      goto LABEL_11;
    case 3:
      v11 = *(const CGPath **)self->_path.__ptr_;
      if (v11) {
        CGPathRelease(v11);
      }
      long long v12 = *(_OWORD *)&self->_anon_10[3];
      double v13 = (float)-*(float *)&v12;
      LODWORD(v14) = HIDWORD(*(void *)&self->_anon_10[3]);
      double v15 = (float)-v14;
      *(double *)&long long v12 = (float)(*(float *)&v12 + *(float *)&v12);
      double v16 = (float)(v14 + v14);
      result = CGPathCreateWithRect(*(CGRect *)(&v12 - 1), 0);
LABEL_11:
      *(void *)self->_path.__ptr_ = result;
      return result;
    case 4:
      return *(CGPath **)self->_path.__ptr_;
    default:
      return 0;
  }
}

- (BOOL)isInfinite
{
  return self->_shape == 1;
}

- (BOOL)isEmpty
{
  return self->_shape == 0;
}

- (PKRegion)initWithCoder:(id)a3
{
  v40[6] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)PKRegion;
  id v5 = [(PKRegion *)&v38 init];
  if (v5)
  {
    long long v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_type"];
    *((_DWORD *)v5 + 2) = stringToShape(v6);

    *((unsigned char *)v5 + 12) = [v4 decodeBoolForKey:@"_isexclusive"];
    [v4 decodeFloatForKey:@"_halfx"];
    unsigned int v36 = v7;
    [v4 decodeFloatForKey:@"_halfy"];
    unsigned int v34 = v8;
    [v4 decodeFloatForKey:@"_halfz"];
    *(void *)&long long v9 = __PAIR64__(v34, v36);
    *((void *)&v9 + 1) = v10;
    *((_OWORD *)v5 + 1) = v9;
    if ([v4 containsValueForKey:@"_cgpath"])
    {
      v11 = (void *)MEMORY[0x263EFFA08];
      v40[0] = objc_opt_class();
      v40[1] = objc_opt_class();
      v40[2] = objc_opt_class();
      v40[3] = objc_opt_class();
      v40[4] = objc_opt_class();
      v40[5] = objc_opt_class();
      long long v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:6];
      double v13 = [v11 setWithArray:v12];
      float v14 = [v4 decodeObjectOfClasses:v13 forKey:@"_cgpath"];

      double v15 = PKCGPathCreateFromArray(v14, 1);
      double v16 = operator new(0x20uLL);
      v16[1] = 0;
      v16[2] = 0;
      *double v16 = &unk_26C3F41A0;
      v16[3] = v15;
      v17 = (std::__shared_weak_count *)*((void *)v5 + 5);
      *((void *)v5 + 4) = v16 + 3;
      *((void *)v5 + 5) = v16;
      if (v17) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v17);
      }
    }
    id v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_op"];
    v19 = v18;
    if (v18)
    {
      if ([v18 isEqualToString:@"union"])
      {
        int v20 = 1;
      }
      else if ([v19 isEqualToString:@"difference"])
      {
        int v20 = 2;
      }
      else if ([v19 isEqualToString:@"intersection"])
      {
        int v20 = 3;
      }
      else
      {
        int v20 = 0;
      }
    }
    else
    {
      int v20 = 0;
    }

    *((_DWORD *)v5 + 12) = v20;
    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_type2"];
    *((_DWORD *)v5 + 13) = stringToShape(v21);

    [v4 decodeFloatForKey:@"_halfx2"];
    unsigned int v37 = v22;
    [v4 decodeFloatForKey:@"_halfy2"];
    unsigned int v35 = v23;
    [v4 decodeFloatForKey:@"_halfz2"];
    *(void *)&long long v24 = __PAIR64__(v35, v37);
    *((void *)&v24 + 1) = v25;
    *((_OWORD *)v5 + 4) = v24;
    if ([v4 containsValueForKey:@"_cgpath2"])
    {
      v26 = (void *)MEMORY[0x263EFFA08];
      v39[0] = objc_opt_class();
      v39[1] = objc_opt_class();
      v39[2] = objc_opt_class();
      v39[3] = objc_opt_class();
      v39[4] = objc_opt_class();
      v39[5] = objc_opt_class();
      v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:6];
      v28 = [v26 setWithArray:v27];
      v29 = [v4 decodeObjectOfClasses:v28 forKey:@"_cgpath"];
      v30 = PKCGPathCreateFromArray(v29, 1);

      v31 = operator new(0x20uLL);
      v31[1] = 0;
      v31[2] = 0;
      void *v31 = &unk_26C3F41A0;
      v31[3] = v30;
      v32 = (std::__shared_weak_count *)*((void *)v5 + 11);
      *((void *)v5 + 10) = v31 + 3;
      *((void *)v5 + 11) = v31;
      if (v32) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v32);
      }
    }
  }

  return (PKRegion *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t shape = self->_shape;
  if (shape > 5) {
    long long v6 = @"infinite";
  }
  else {
    long long v6 = off_2641AFA20[shape];
  }
  id v21 = v4;
  [v4 encodeObject:v6 forKey:@"_type"];
  [v21 encodeBool:self->_isExclusive forKey:@"_isexclusive"];
  LODWORD(v7) = *(_DWORD *)&self->_anon_10[3];
  [v21 encodeFloat:@"_halfx" forKey:v7];
  LODWORD(v8) = *(_DWORD *)&self->_anon_10[7];
  [v21 encodeFloat:@"_halfy" forKey:v8];
  LODWORD(v9) = *(_DWORD *)&self->_anon_10[11];
  [v21 encodeFloat:@"_halfz" forKey:v9];
  ptr = (const CGPath **)self->_path.__ptr_;
  if (ptr)
  {
    v11 = PKArrayFromCGPath(*ptr, 1);
    [v21 encodeObject:v11 forKey:@"_cgpath"];
  }
  unsigned int v12 = self->_regionOp - 1;
  if (v12 > 2) {
    double v13 = @"no-op";
  }
  else {
    double v13 = off_2641AFA08[v12];
  }
  [v21 encodeObject:v13 forKey:@"_op"];
  uint64_t shape2 = self->_shape2;
  if (shape2 > 5) {
    double v15 = @"infinite";
  }
  else {
    double v15 = off_2641AFA20[shape2];
  }
  [v21 encodeObject:v15 forKey:@"_type2"];
  LODWORD(v16) = *(_DWORD *)self->_anon_40;
  [v21 encodeFloat:@"_halfx2" forKey:v16];
  LODWORD(v17) = *(_DWORD *)&self->_anon_40[4];
  [v21 encodeFloat:@"_halfy2" forKey:v17];
  LODWORD(v18) = *(_DWORD *)&self->_anon_40[8];
  [v21 encodeFloat:@"_halfz2" forKey:v18];
  v19 = (const CGPath **)self->_path2.__ptr_;
  if (v19)
  {
    int v20 = PKArrayFromCGPath(*v19, 1);
    [v21 encodeObject:v20 forKey:@"_cgpath2"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  *(_DWORD *)(v4 + 8) = self->_shape;
  *(unsigned char *)(v4 + 12) = self->_isExclusive;
  *(_OWORD *)(v4 + 16) = *(_OWORD *)&self->_anon_10[3];
  ptr = self->_path.__ptr_;
  cntrl = self->_path.__cntrl_;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  double v8 = *(std::__shared_weak_count **)(v4 + 40);
  *(void *)(v5 + 32) = ptr;
  *(void *)(v5 + 40) = cntrl;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  *(void *)(v5 + 48) = *(void *)&self->_regionOp;
  *(_OWORD *)(v5 + 64) = *(_OWORD *)self->_anon_40;
  unsigned int v10 = self->_path2.__ptr_;
  double v9 = self->_path2.__cntrl_;
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v9 + 1, 1uLL, memory_order_relaxed);
  }
  v11 = *(std::__shared_weak_count **)(v5 + 88);
  *(void *)(v5 + 80) = v10;
  *(void *)(v5 + 88) = v9;
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  return (id)v5;
}

- (PKRegion)initWithRadius:(float)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKRegion;
  uint64_t v4 = [(PKRegion *)&v7 init];
  if (v4)
  {
    *(float *)v5.i32 = PKGet_INV_PTM_RATIO() * a3;
    v4->_uint64_t shape = 2;
    *(int32x4_t *)&v4->_anon_10[3] = vdupq_lane_s32(v5, 0);
    v4->_regionOp = 0;
  }
  return v4;
}

- (PKRegion)initWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v21.receiver = self;
  v21.super_class = (Class)PKRegion;
  v3 = [(PKRegion *)&v21 init];
  uint64_t v4 = v3;
  if (v3)
  {
    v3->_uint64_t shape = 3;
    float v5 = PKGet_INV_PTM_RATIO();
    float v6 = PKGet_INV_PTM_RATIO();
    *(float *)&unsigned int v7 = width * v5;
    *(float *)&unsigned int v8 = height * v6;
    *(_OWORD *)&v4->_anon_10[3] = __PAIR64__(v8, v7);
    if (PKGetLinkedOnOrAfter(720896))
    {
      float v18 = PKGet_INV_PTM_RATIO();
      float v9 = PKGet_INV_PTM_RATIO();
      v10.f64[0] = width;
      v10.f64[1] = height;
      __asm { FMOV            V1.2D, #0.5 }
      float64x2_t v16 = vmulq_f64(vmulq_f64(v10, _Q1), vcvtq_f64_f32((float32x2_t)__PAIR64__(LODWORD(v9), LODWORD(v18))));
      *(float32x2_t *)&v16.f64[0] = vcvt_f32_f64(v16);
      *(float64x2_t *)&v4->_anon_10[3] = v16;
    }
    v4->_regionOp = 0;
  }
  return v4;
}

- (PKRegion)initWithPath:(CGPath *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PKRegion;
  uint64_t v4 = [(PKRegion *)&v13 init];
  float v5 = v4;
  if (v4)
  {
    v4->_uint64_t shape = 4;
    memset(&v12, 0, sizeof(v12));
    float v6 = PKGet_INV_PTM_RATIO();
    float v7 = PKGet_INV_PTM_RATIO();
    CGAffineTransformMakeScale(&v12, v6, v7);
    uint64_t v8 = MEMORY[0x21668C740](a3, &v12);
    float v9 = operator new(0x20uLL);
    v9[1] = 0;
    v9[2] = 0;
    void *v9 = &unk_26C3F41A0;
    v9[3] = v8;
    cntrl = (std::__shared_weak_count *)v5->_path.__cntrl_;
    v5->_path.__ptr_ = (PKCPathHolder *)(v9 + 3);
    v5->_path.__cntrl_ = (__shared_weak_count *)v9;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
    v5->_regionOp = 0;
  }
  return v5;
}

- (id)inverseRegion
{
  v3 = (unsigned char *)[(PKRegion *)self copy];
  v3[12] = !self->_isExclusive;

  return v3;
}

- (id)regionByUnionWithRegion:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = [(PKRegion *)self copy];
  uint64_t v6 = v5;
  *(_DWORD *)(v5 + 52) = v4[2];
  *(_OWORD *)(v5 + 64) = *((_OWORD *)v4 + 1);
  uint64_t v8 = *((void *)v4 + 4);
  uint64_t v7 = *((void *)v4 + 5);
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  float v9 = *(std::__shared_weak_count **)(v5 + 88);
  *(void *)(v6 + 80) = v8;
  *(void *)(v6 + 88) = v7;
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  if (*((unsigned char *)v4 + 12)) {
    int v10 = 2;
  }
  else {
    int v10 = 1;
  }
  *(_DWORD *)(v6 + 48) = v10;

  return (id)v6;
}

- (id)regionByDifferenceFromRegion:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = [(PKRegion *)self copy];
  uint64_t v6 = v5;
  *(_DWORD *)(v5 + 52) = v4[2];
  *(_OWORD *)(v5 + 64) = *((_OWORD *)v4 + 1);
  uint64_t v8 = *((void *)v4 + 4);
  uint64_t v7 = *((void *)v4 + 5);
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  float v9 = *(std::__shared_weak_count **)(v5 + 88);
  *(void *)(v6 + 80) = v8;
  *(void *)(v6 + 88) = v7;
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  if (*((unsigned char *)v4 + 12)) {
    int v10 = 1;
  }
  else {
    int v10 = 2;
  }
  *(_DWORD *)(v6 + 48) = v10;

  return (id)v6;
}

- (id)regionByIntersectionWithRegion:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = [(PKRegion *)self copy];
  uint64_t v6 = v5;
  *(_DWORD *)(v5 + 52) = v4[2];
  *(_OWORD *)(v5 + 64) = *((_OWORD *)v4 + 1);
  uint64_t v8 = *((void *)v4 + 4);
  uint64_t v7 = *((void *)v4 + 5);
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  float v9 = *(std::__shared_weak_count **)(v5 + 88);
  *(void *)(v6 + 80) = v8;
  *(void *)(v6 + 88) = v7;
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  *(_DWORD *)(v6 + 48) = 3;

  return (id)v6;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int v6 = 1;
  switch(self->_shape)
  {
    case 0:
      int v6 = !self->_isExclusive;
      break;
    case 1:
      break;
    case 2:
      long long v7 = *(_OWORD *)&self->_anon_10[3];
      LODWORD(v8) = HIDWORD(*(void *)&self->_anon_10[3]);
      float v9 = 0.0;
      float v10 = 0.0;
      if (*(float *)&v7 > 0.0) {
        float v10 = x / *(float *)&v7;
      }
      if (v8 > 0.0) {
        float v9 = y / v8;
      }
      int v6 = (float)((float)(v9 * v9) + (float)(v10 * v10)) <= 1.0;
      break;
    case 3:
      float v11 = a3.x;
      float v12 = a3.y;
      BOOL v13 = fabsf(v12) < COERCE_FLOAT(HIDWORD(*(void *)&self->_anon_10[3]));
      int v6 = fabsf(v11) < COERCE_FLOAT(*(_OWORD *)&self->_anon_10[3]) && v13;
      break;
    case 4:
      ptr = (CGPathRef *)self->_path.__ptr_;
      if (!ptr) {
        goto LABEL_13;
      }
      int v6 = CGPathContainsPoint(*ptr, 0, a3, 1);
      break;
    default:
LABEL_13:
      int v6 = 0;
      break;
  }
  int isExclusive = self->_isExclusive;
  BOOL result = isExclusive != v6;
  int regionOp = self->_regionOp;
  if (isExclusive != v6 && regionOp == 2)
  {
    switch(self->_shape2)
    {
      case 1:
        goto LABEL_65;
      case 2:
        long long v24 = *(_OWORD *)self->_anon_40;
        LODWORD(v25) = HIDWORD(*(void *)self->_anon_40);
        float v26 = 0.0;
        float v27 = 0.0;
        if (*(float *)&v24 > 0.0) {
          float v27 = x / *(float *)&v24;
        }
        if (v25 > 0.0) {
          float v26 = y / v25;
        }
        return (float)((float)(v26 * v26) + (float)(v27 * v27)) > 1.0;
      case 3:
        float v33 = x;
        float v34 = fabsf(v33);
        long long v35 = *(_OWORD *)self->_anon_40;
        if (v34 >= *(float *)&v35) {
          goto LABEL_57;
        }
        float v36 = y;
        if (fabsf(v36) >= *((float *)&v35 + 1)) {
          goto LABEL_57;
        }
LABEL_65:
        BOOL result = 0;
        break;
      case 4:
        unsigned int v37 = (CGPathRef *)self->_path2.__ptr_;
        if (!v37) {
          goto LABEL_57;
        }
        v52.double x = x;
        v52.double y = y;
        BOOL result = !CGPathContainsPoint(*v37, 0, v52, 1);
        break;
      default:
LABEL_57:
        BOOL result = 1;
        break;
    }
  }
  else if (regionOp == 1)
  {
    switch(self->_shape2)
    {
      case 1:
        goto LABEL_57;
      case 2:
        long long v19 = *(_OWORD *)self->_anon_40;
        LODWORD(v20) = HIDWORD(*(void *)self->_anon_40);
        float v21 = 0.0;
        float v22 = 0.0;
        if (*(float *)&v19 > 0.0) {
          float v22 = x / *(float *)&v19;
        }
        if (v20 > 0.0) {
          float v21 = y / v20;
        }
        BOOL result = (float)((float)(v21 * v21) + (float)(v22 * v22)) <= 1.0 || isExclusive != v6;
        break;
      case 3:
        float v38 = x;
        float v39 = y;
        float v40 = fabsf(v39);
        if (fabsf(v38) < COERCE_FLOAT(*(_OWORD *)self->_anon_40)
          && v40 < COERCE_FLOAT(HIDWORD(*(void *)self->_anon_40)))
        {
          goto LABEL_57;
        }
        break;
      case 4:
        v42 = (CGPathRef *)self->_path2.__ptr_;
        if (v42)
        {
          v53.double x = x;
          v53.double y = y;
          BOOL result = CGPathContainsPoint(*v42, 0, v53, 1);
          if (isExclusive != v6) {
            BOOL result = 1;
          }
        }
        break;
      default:
        return result;
    }
  }
  else if (isExclusive != v6 && regionOp == 3)
  {
    BOOL result = 1;
    switch(self->_shape2)
    {
      case 0:
        goto LABEL_65;
      case 2:
        long long v29 = *(_OWORD *)self->_anon_40;
        LODWORD(v30) = HIDWORD(*(void *)self->_anon_40);
        float v31 = 0.0;
        float v32 = 0.0;
        if (*(float *)&v29 > 0.0) {
          float v32 = x / *(float *)&v29;
        }
        if (v30 > 0.0) {
          float v31 = y / v30;
        }
        BOOL result = (float)((float)(v31 * v31) + (float)(v32 * v32)) <= 1.0;
        break;
      case 3:
        float v43 = x;
        float v44 = y;
        float v45 = fabsf(v44);
        if (fabsf(v43) > COERCE_FLOAT(*(_OWORD *)self->_anon_40)
          || v45 > COERCE_FLOAT(HIDWORD(*(void *)self->_anon_40)))
        {
          goto LABEL_65;
        }
        break;
      case 4:
        v47 = self->_path2.__ptr_;
        if (v47)
        {
          v48 = *(const CGPath **)v47;
          double v49 = x;
          double v50 = y;
          BOOL result = CGPathContainsPoint(v48, 0, *(CGPoint *)&v49, 1);
        }
        break;
      default:
        return result;
    }
  }
  return result;
}

- (void)containsPoints:(const float *)a3 locationStride:(int64_t)a4 results:(char *)a5 resultsStride:(int64_t)a6 count:(int)a7
{
  if ([(PKRegion *)self isMemberOfClass:objc_opt_class()])
  {
    if (a7 >= 1)
    {
      BOOL v13 = (float *)(a3 + 1);
      do
      {
        float v14 = *(v13 - 1);
        float v15 = *v13;
        BOOL v16 = 1;
        switch(self->_shape)
        {
          case 1:
            break;
          case 2:
            float v17 = *(float *)&self->_anon_10[3];
            float v18 = *(float *)&self->_anon_10[7];
            float v19 = v14 / v17;
            if (v17 <= 0.0) {
              float v19 = 0.0;
            }
            float v20 = v15 / v18;
            if (v18 <= 0.0) {
              float v20 = 0.0;
            }
            float v21 = *(float *)&self->_anon_10[11];
            if (v21 <= 0.0) {
              float v22 = 0.0;
            }
            else {
              float v22 = 0.0 / v21;
            }
            BOOL v16 = (float)((float)((float)(v20 * v20) + (float)(v19 * v19)) + (float)(v22 * v22)) <= 1.0;
            break;
          case 3:
            float v23 = fabsf(v14);
            long long v24 = *(_OWORD *)&self->_anon_10[3];
            float v25 = fabsf(v15);
            if (v23 >= *(float *)&v24 || v25 >= COERCE_FLOAT(HIDWORD(*(void *)&self->_anon_10[3]))) {
              goto LABEL_21;
            }
            BOOL v16 = *((float *)&v24 + 2) > 0.0;
            break;
          case 4:
            ptr = (CGPathRef *)self->_path.__ptr_;
            if (!ptr) {
              goto LABEL_21;
            }
            v29.double x = v14;
            v29.double y = v15;
            BOOL v16 = CGPathContainsPoint(*ptr, 0, v29, 1);
            break;
          default:
LABEL_21:
            BOOL v16 = 0;
            break;
        }
        *a5 = self->_isExclusive != v16;
        a5 += a6;
        BOOL v13 = (float *)((char *)v13 + a4);
        --a7;
      }
      while (a7);
    }
  }
  else if (a7 >= 1)
  {
    v28 = (float *)(a3 + 1);
    do
    {
      *a5 = -[PKRegion containsPoint:](self, "containsPoint:", *(v28 - 1), *v28);
      a5 += a6;
      v28 = (float *)((char *)v28 + a4);
      --a7;
    }
    while (a7);
  }
}

- (void).cxx_destruct
{
  cntrl = self->_path2.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  uint64_t v4 = self->_path.__cntrl_;
  if (v4)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  return self;
}

@end