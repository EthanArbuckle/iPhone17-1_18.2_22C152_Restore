@interface _UITextSizeCache
- (BOOL)getSize:(CGSize *)a3 baselineInfo:(id *)a4 forTargetSize:(CGSize)a5 isMultiline:(BOOL)a6;
- (id).cxx_construct;
- (id)description;
- (void)addSize:(CGSize)a3 baselineInfo:(id *)a4 forTargetSize:(CGSize)a5;
- (void)removeAllSizes;
@end

@implementation _UITextSizeCache

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (BOOL)getSize:(CGSize *)a3 baselineInfo:(id *)a4 forTargetSize:(CGSize)a5 isMultiline:(BOOL)a6
{
  if (fabs(a5.width) < 0.001) {
    a5.width = 3.40282347e38;
  }
  if (fabs(a5.height) < 0.001) {
    a5.height = 3.40282347e38;
  }
  begin = self->_cache.__begin_;
  end = self->_cache.__end_;
  if (begin == end) {
    return 0;
  }
  while (1)
  {
    double v8 = *(double *)begin;
    if (vabdd_f64(*(double *)begin, a5.width) < 0.001
      || (v8 - a5.width < -0.001 ? (BOOL v9 = a6) : (BOOL v9 = 0),
          !v9 && (double v10 = *((double *)begin + 2), v10 - v8 < -0.001) && v10 - a5.width < 0.001))
    {
      double v11 = *((double *)begin + 1);
      if (vabdd_f64(v11, a5.height) < 0.001) {
        break;
      }
      double v12 = *((double *)begin + 3);
      if (v12 - v11 < -0.001 && v12 - a5.height < 0.001) {
        break;
      }
    }
    begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 120);
    if (begin == end) {
      return 0;
    }
  }
  v14.var2.size = (CGSize)*((_OWORD *)begin + 4);
  *(_OWORD *)&v14.var3 = *((_OWORD *)begin + 5);
  *(_OWORD *)&v14.var4.origin.y = *((_OWORD *)begin + 6);
  v14.var4.size.height = *((CGFloat *)begin + 14);
  *(_OWORD *)&v14.var0 = *((_OWORD *)begin + 2);
  v14.var2.origin = (CGPoint)*((_OWORD *)begin + 3);
  *a3 = *((CGSize *)begin + 1);
  if (a4) {
    *a4 = v14;
  }
  return 1;
}

- (void)addSize:(CGSize)a3 baselineInfo:(id *)a4 forTargetSize:(CGSize)a5
{
  begin = self->_cache.__begin_;
  end = self->_cache.__end_;
  if (0xEEEEEEEEEEEEEEEFLL * ((end - begin) >> 3) >= 7)
  {
    self->_cache.__end_ = begin;
    end = begin;
  }
  if (fabs(a5.width) < 0.001) {
    a5.width = 3.40282347e38;
  }
  if (fabs(a5.height) < 0.001) {
    a5.CGFloat height = 3.40282347e38;
  }
  CGSize v71 = a5;
  CGSize v72 = a3;
  if (a4)
  {
    long long v8 = *(_OWORD *)&a4->var3;
    CGSize size = a4->var2.size;
    long long v76 = v8;
    long long v77 = *(_OWORD *)&a4->var4.origin.y;
    CGFloat height = a4->var4.size.height;
    CGPoint origin = a4->var2.origin;
    long long v73 = *(_OWORD *)&a4->var0;
    CGPoint v74 = origin;
  }
  else
  {
    CGFloat height = 0.0;
    long long v76 = 0u;
    long long v77 = 0u;
    CGPoint v74 = (CGPoint)0;
    CGSize size = (CGSize)0;
    long long v73 = 0u;
  }
  uint64_t v10 = end - begin;
  if (end == begin)
  {
    double v12 = begin;
  }
  else
  {
    unint64_t v11 = 0xEEEEEEEEEEEEEEEFLL * (v10 >> 3);
    double v12 = begin;
    do
    {
      unint64_t v13 = v11 >> 1;
      $00731F7035C2E13BA23DAA730FFC2B6B v14 = (double *)((char *)v12 + 120 * (v11 >> 1));
      double v15 = *v14 - a5.width;
      if (v15 < -0.001 || fabs(v15) < 0.001 && v14[1] - a5.height < -0.001)
      {
        double v12 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v14 + 15);
        unint64_t v13 = v11 + ~v13;
      }
      unint64_t v11 = v13;
    }
    while (v13);
  }
  uint64_t v16 = (v12 - begin) / 120;
  v17 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 120 * v16);
  value = self->_cache.__end_cap_.__value_;
  if (end >= value)
  {
    unint64_t v35 = 0xEEEEEEEEEEEEEEEFLL * (v10 >> 3) + 1;
    if (v35 > 0x222222222222222) {
      abort();
    }
    unint64_t v36 = 0xEEEEEEEEEEEEEEEFLL * ((value - begin) >> 3);
    if (2 * v36 > v35) {
      unint64_t v35 = 2 * v36;
    }
    if (v36 >= 0x111111111111111) {
      unint64_t v37 = 0x222222222222222;
    }
    else {
      unint64_t v37 = v35;
    }
    if (v37)
    {
      v39 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<ui_size_cache_value>>(v37);
    }
    else
    {
      v39 = 0;
      uint64_t v38 = 0;
    }
    v46 = &v39[120 * v16];
    v47 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v39[120 * v38];
    if (v16 == v38)
    {
      if (v12 - begin < 1)
      {
        if (begin == v12) {
          unint64_t v49 = 1;
        }
        else {
          unint64_t v49 = 2 * v16;
        }
        v50 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<ui_size_cache_value>>(v49);
        v46 = &v50[120 * (v49 >> 2)];
        v47 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v50[120 * v51];
        if (v39) {
          operator delete(v39);
        }
      }
      else
      {
        uint64_t v48 = v16 + 2;
        if (v16 >= -1) {
          uint64_t v48 = v16 + 1;
        }
        v46 -= 120 * (v48 >> 1);
      }
    }
    CGSize v52 = v71;
    CGSize v53 = v72;
    CGPoint v54 = v74;
    *((_OWORD *)v46 + 2) = v73;
    *((CGPoint *)v46 + 3) = v54;
    *(CGSize *)v46 = v52;
    *((CGSize *)v46 + 1) = v53;
    CGSize v55 = size;
    long long v56 = v76;
    long long v57 = v77;
    *((CGFloat *)v46 + 14) = height;
    *((_OWORD *)v46 + 5) = v56;
    *((_OWORD *)v46 + 6) = v57;
    *((CGSize *)v46 + 4) = v55;
    v58 = self->_cache.__begin_;
    v59 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v46;
    if (v58 != v17)
    {
      v60 = v17;
      v61 = v46;
      do
      {
        long long v62 = *(_OWORD *)((char *)v60 - 120);
        long long v63 = *(_OWORD *)((char *)v60 - 104);
        long long v64 = *(_OWORD *)((char *)v60 - 88);
        *(_OWORD *)(v61 - 72) = *(_OWORD *)((char *)v60 - 72);
        *(_OWORD *)(v61 - 88) = v64;
        *(_OWORD *)(v61 - 104) = v63;
        *(_OWORD *)(v61 - 120) = v62;
        long long v65 = *(_OWORD *)((char *)v60 - 56);
        long long v66 = *(_OWORD *)((char *)v60 - 40);
        long long v67 = *(_OWORD *)((char *)v60 - 24);
        v59 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v61 - 120);
        *((void *)v61 - 1) = *((void *)v60 - 1);
        *(_OWORD *)(v61 - 24) = v67;
        *(_OWORD *)(v61 - 40) = v66;
        *(_OWORD *)(v61 - 56) = v65;
        v60 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v60 - 120);
        v61 -= 120;
      }
      while (v60 != v58);
    }
    v68 = self->_cache.__end_;
    int64_t v69 = v68 - v17;
    if (v68 != v17) {
      memmove(v46 + 120, v17, v68 - v17);
    }
    v70 = self->_cache.__begin_;
    self->_cache.__begin_ = v59;
    self->_cache.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v46[v69 + 120];
    self->_cache.__end_cap_.__value_ = v47;
    if (v70)
    {
      operator delete(v70);
    }
  }
  else if (v17 == end)
  {
    CGSize v40 = v71;
    CGSize v41 = v72;
    CGPoint v42 = v74;
    *((_OWORD *)end + 2) = v73;
    *((CGPoint *)end + 3) = v42;
    *(CGSize *)end = v40;
    *((CGSize *)end + 1) = v41;
    CGSize v43 = size;
    long long v44 = v76;
    long long v45 = v77;
    *((CGFloat *)end + 14) = height;
    *((_OWORD *)end + 5) = v44;
    *((_OWORD *)end + 6) = v45;
    *((CGSize *)end + 4) = v43;
    self->_cache.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 120);
  }
  else
  {
    v19 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v17 + 120);
    v20 = (char *)end - 120;
    v21 = end;
    if ((unint64_t)end >= 0x78)
    {
      v21 = end;
      do
      {
        long long v22 = *(_OWORD *)v20;
        long long v23 = *((_OWORD *)v20 + 1);
        long long v24 = *((_OWORD *)v20 + 3);
        *((_OWORD *)v21 + 2) = *((_OWORD *)v20 + 2);
        *((_OWORD *)v21 + 3) = v24;
        *(_OWORD *)v21 = v22;
        *((_OWORD *)v21 + 1) = v23;
        long long v25 = *((_OWORD *)v20 + 4);
        long long v26 = *((_OWORD *)v20 + 5);
        long long v27 = *((_OWORD *)v20 + 6);
        *((void *)v21 + 14) = *((void *)v20 + 14);
        *((_OWORD *)v21 + 5) = v26;
        *((_OWORD *)v21 + 6) = v27;
        *((_OWORD *)v21 + 4) = v25;
        v20 += 120;
        v21 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v21 + 120);
      }
      while (v20 < (char *)end);
    }
    self->_cache.__end_ = v21;
    if (end != v19) {
      memmove((char *)v17 + 120, (char *)begin + 120 * v16, end - v19);
    }
    v28 = &v71;
    if (v17 <= ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v71) {
      v28 = (CGSize *)((char *)&v71 + 120 * (self->_cache.__end_ > ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v71));
    }
    CGSize v29 = *v28;
    CGSize v30 = v28[1];
    CGSize v31 = v28[3];
    *((CGSize *)v17 + 2) = v28[2];
    *((CGSize *)v17 + 3) = v31;
    *(CGSize *)v17 = v29;
    *((CGSize *)v17 + 1) = v30;
    CGSize v32 = v28[4];
    CGSize v33 = v28[5];
    CGSize v34 = v28[6];
    *((void *)v17 + 14) = *(void *)&v28[7].width;
    *((CGSize *)v17 + 5) = v33;
    *((CGSize *)v17 + 6) = v34;
    *((CGSize *)v17 + 4) = v32;
  }
}

- (void)removeAllSizes
{
  self->_cache.__end_ = self->_cache.__begin_;
}

- (void).cxx_destruct
{
  begin = self->_cache.__begin_;
  if (begin)
  {
    self->_cache.__end_ = begin;
    operator delete(begin);
  }
}

- (id)description
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0xEEEEEEEEEEEEEEEFLL * ((self->_cache.__end_ - self->_cache.__begin_) >> 3)];
  begin = self->_cache.__begin_;
  for (i = self->_cache.__end_; begin != i; begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 120))
  {
    v6 = NSString;
    v7 = NSStringFromCGSize(*(CGSize *)begin);
    long long v8 = NSStringFromCGSize(*((CGSize *)begin + 1));
    BOOL v9 = [v6 stringWithFormat:@"%@ : %@", v7, v8];
    [v3 addObject:v9];
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F28E78];
  unint64_t v11 = (objc_class *)objc_opt_class();
  double v12 = NSStringFromClass(v11);
  $00731F7035C2E13BA23DAA730FFC2B6B v14 = self->_cache.__begin_;
  end = self->_cache.__end_;
  double v15 = [v3 componentsJoinedByString:@", "];
  uint64_t v16 = [v10 stringWithFormat:@"<%@ %p: [%lu] { %@ }>", v12, self, 0xEEEEEEEEEEEEEEEFLL * ((end - v14) >> 3), v15];

  return v16;
}

@end