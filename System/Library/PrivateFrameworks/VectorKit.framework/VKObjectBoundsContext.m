@interface VKObjectBoundsContext
- ($47F18235E17FF75F5C17F39635350F8F)boundingRect;
- (BOOL)isEmpty;
- (VKEdgeInsets)edgePadding;
- (id).cxx_construct;
- (void)addPoints:(const void *)a3;
- (void)setEdgePadding:(VKEdgeInsets)a3;
@end

@implementation VKObjectBoundsContext

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void).cxx_destruct
{
  begin = self->_points.__begin_;
  if (begin)
  {
    self->_points.__end_ = begin;
    operator delete(begin);
  }
}

- (void)setEdgePadding:(VKEdgeInsets)a3
{
  self->_edgePadding = a3;
}

- (VKEdgeInsets)edgePadding
{
  float top = self->_edgePadding.top;
  float left = self->_edgePadding.left;
  float bottom = self->_edgePadding.bottom;
  float right = self->_edgePadding.right;
  result.float right = right;
  result.float bottom = bottom;
  result.float left = left;
  result.float top = top;
  return result;
}

- ($47F18235E17FF75F5C17F39635350F8F)boundingRect
{
  if (![(VKObjectBoundsContext *)self isEmpty])
  {
    begin = self->_points.__begin_;
    end = self->_points.__end_;
    if (begin == (void *)end)
    {
      double v12 = 1.79769313e308;
      double v13 = -1.79769313e308;
      double v10 = 1.79769313e308;
      double v11 = -1.79769313e308;
    }
    else
    {
      unint64_t v9 = end - (unsigned char *)begin - 16;
      if (v9 > 0x2F)
      {
        uint64_t v14 = (v9 >> 4) + 1;
        float64x2_t v15 = (float64x2_t)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        float64x2_t v16 = (float64x2_t)vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
        v17 = (const double *)(begin + 4);
        uint64_t v18 = v14 & 0x1FFFFFFFFFFFFFFCLL;
        float64x2_t v19 = v16;
        float64x2_t v20 = v15;
        float64x2_t v21 = v15;
        float64x2_t v22 = v15;
        float64x2_t v23 = v16;
        float64x2_t v24 = v16;
        do
        {
          v25 = v17 - 4;
          float64x2x2_t v30 = vld2q_f64(v25);
          float64x2x2_t v31 = vld2q_f64(v17);
          float64x2_t v15 = vminnmq_f64(v30.val[0], v15);
          float64x2_t v20 = vminnmq_f64(v31.val[0], v20);
          float64x2_t v23 = vmaxnmq_f64(v23, v30.val[0]);
          float64x2_t v24 = vmaxnmq_f64(v24, v31.val[0]);
          float64x2_t v21 = vminnmq_f64(v30.val[1], v21);
          float64x2_t v22 = vminnmq_f64(v31.val[1], v22);
          float64x2_t v16 = vmaxnmq_f64(v16, v30.val[1]);
          float64x2_t v19 = vmaxnmq_f64(v19, v31.val[1]);
          v17 += 8;
          v18 -= 4;
        }
        while (v18);
        double v13 = vmaxnmvq_f64(vmaxnmq_f64(v23, v24));
        double v12 = vminnmvq_f64(vminnmq_f64(v21, v22));
        double v10 = vminnmvq_f64(vminnmq_f64(v15, v20));
        double v11 = vmaxnmvq_f64(vmaxnmq_f64(v16, v19));
        if (v14 == (v14 & 0x1FFFFFFFFFFFFFFCLL)) {
          goto LABEL_12;
        }
        begin += 2 * (v14 & 0x1FFFFFFFFFFFFFFCLL);
      }
      else
      {
        double v10 = 1.79769313e308;
        double v11 = -1.79769313e308;
        double v12 = 1.79769313e308;
        double v13 = -1.79769313e308;
      }
      do
      {
        double v26 = *(double *)begin;
        double v27 = *((double *)begin + 1);
        begin += 2;
        double v10 = fmin(v26, v10);
        double v13 = fmax(v13, v26);
        double v12 = fmin(v27, v12);
        double v11 = fmax(v11, v27);
      }
      while (begin != (void *)end);
    }
LABEL_12:
    double v28 = *(double *)(MEMORY[0x1E4F63F08] + 16);
    double v29 = *(double *)(MEMORY[0x1E4F63F08] + 24);
    double v3 = v28 * v10;
    double v4 = v29 - v11 * v29;
    double v5 = v28 * (v13 - v10);
    double v6 = v29 * (v11 - v12);
    goto LABEL_13;
  }
  double v3 = *MEMORY[0x1E4F63F00];
  double v4 = *(double *)(MEMORY[0x1E4F63F00] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F63F00] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F63F00] + 24);
LABEL_13:
  result.var1.var1 = v6;
  result.var1.var0 = v5;
  result.var0.var1 = v4;
  result.var0.var0 = v3;
  return result;
}

- (BOOL)isEmpty
{
  return self->_points.__begin_ == self->_points.__end_;
}

- (void)addPoints:(const void *)a3
{
  double v4 = *(long long **)a3;
  double v3 = (long long *)*((void *)a3 + 1);
  uint64_t v5 = (uint64_t)v3 - *(void *)a3;
  if (v5 < 1) {
    return;
  }
  uint64_t v7 = v5 >> 4;
  begin = self->_points.__begin_;
  end = (long long *)self->_points.__end_;
  unint64_t v10 = (char *)end - begin;
  uint64_t v11 = ((char *)end - begin) >> 4;
  double v12 = (long long *)&begin[((char *)end - begin) & 0xFFFFFFFFFFFFFFF0];
  value = self->_points.__end_cap_.__value_;
  if (v7 <= (value - (unsigned char *)end) >> 4)
  {
    uint64_t v18 = end - v12;
    if (v18 >= v7)
    {
      float64x2_t v19 = &v4[v7];
      float64x2_t v21 = self->_points.__end_;
    }
    else
    {
      float64x2_t v19 = &v4[v18];
      if (v19 == v3)
      {
        float64x2_t v21 = self->_points.__end_;
      }
      else
      {
        float64x2_t v20 = v19;
        float64x2_t v21 = self->_points.__end_;
        do
        {
          long long v22 = *v20++;
          *v21++ = v22;
        }
        while (v20 != v3);
      }
      self->_points.__end_ = v21;
      if ((char *)end - (char *)v12 < 1) {
        return;
      }
    }
    v32 = (char *)&v12[v7];
    v33 = &v21[-v7];
    v34 = v21;
    if (v33 < end)
    {
      v35 = &v21[-v7];
      v34 = v21;
      do
      {
        long long v36 = *v35++;
        *v34++ = v36;
      }
      while (v35 < end);
    }
    self->_points.__end_ = v34;
    if (v21 != (_OWORD *)v32)
    {
      int64_t v37 = (char *)v21 - v32;
      unint64_t v38 = (char *)v21 - v32 - 16;
      if (v38 < 0xD0
        || (_OWORD *)((char *)v21 - (v37 & 0xFFFFFFFFFFFFFFF0)) < v33
        && &begin[v37 + (v10 & 0xFFFFFFFFFFFFFFF0) - (v37 & 0xFFFFFFFFFFFFFFF0)] < (unsigned char *)v21)
      {
        v39 = v21;
        goto LABEL_41;
      }
      uint64_t v52 = (v38 >> 4) + 1;
      v39 = &v21[-(v52 & 0x1FFFFFFFFFFFFFFCLL)];
      v53 = (const double *)(v33 - 2);
      v54 = (double *)(v21 - 2);
      uint64_t v55 = v52 & 0x1FFFFFFFFFFFFFFCLL;
      do
      {
        float64x2x2_t v59 = vld2q_f64(v53);
        v56 = v53 - 4;
        float64x2x2_t v60 = vld2q_f64(v56);
        vst2q_f64(v54, v59);
        v57 = v54 - 4;
        vst2q_f64(v57, v60);
        v54 -= 8;
        v53 -= 8;
        v55 -= 4;
      }
      while (v55);
      if (v52 != (v52 & 0x1FFFFFFFFFFFFFFCLL))
      {
        v33 -= v52 & 0x1FFFFFFFFFFFFFFCLL;
LABEL_41:
        v40 = (void *)v39 - 1;
        do
        {
          uint64_t v41 = *((void *)v33-- - 2);
          *(v40 - 1) = v41;
          void *v40 = *((void *)v33 + 1);
          v40 -= 2;
        }
        while (v33 != v12);
      }
    }
    if (v19 == v4) {
      return;
    }
    unint64_t v42 = (char *)v19 - (char *)v4 - 16;
    if (v42 >= 0xD0
      && (v12 >= (long long *)((char *)v4 + (v42 & 0xFFFFFFFFFFFFFFF0) + 16)
       || &begin[(v10 & 0xFFFFFFFFFFFFFFF0) + 16 + (v42 & 0xFFFFFFFFFFFFFFF0)] <= (unsigned char *)v4))
    {
      uint64_t v43 = (v42 >> 4) + 1;
      uint64_t v44 = 16 * (v43 & 0x1FFFFFFFFFFFFFFCLL);
      double v12 = (long long *)((char *)v12 + v44);
      v45 = v4 + 2;
      v46 = &begin[16 * v11 + 32];
      uint64_t v47 = v43 & 0x1FFFFFFFFFFFFFFCLL;
      do
      {
        long long v49 = *(v45 - 2);
        long long v48 = *(v45 - 1);
        long long v51 = *v45;
        long long v50 = v45[1];
        v45 += 4;
        *(v46 - 2) = v49;
        *(v46 - 1) = v48;
        _OWORD *v46 = v51;
        v46[1] = v50;
        v46 += 4;
        v47 -= 4;
      }
      while (v47);
      if (v43 == (v43 & 0x1FFFFFFFFFFFFFFCLL)) {
        return;
      }
      double v4 = (long long *)((char *)v4 + v44);
    }
    do
    {
      *(void *)double v12 = *(void *)v4;
      *((void *)v12++ + 1) = *((void *)v4++ + 1);
    }
    while (v4 != v19);
    return;
  }
  unint64_t v14 = v11 + v7;
  if ((unint64_t)(v11 + v7) >> 60) {
    abort();
  }
  uint64_t v15 = value - begin;
  if (v15 >> 3 > v14) {
    unint64_t v14 = v15 >> 3;
  }
  if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v16 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v16 = v14;
  }
  if (v16)
  {
    if (v16 >> 60) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    v17 = (char *)operator new(16 * v16);
  }
  else
  {
    v17 = 0;
  }
  float64x2_t v23 = &v17[16 * v11];
  uint64_t v24 = 16 * v7;
  v25 = &v23[16 * v7];
  double v26 = v23;
  do
  {
    long long v27 = *v4++;
    *(_OWORD *)double v26 = v27;
    v26 += 16;
    v24 -= 16;
  }
  while (v24);
  if (v10 >= 0x10)
  {
    uint64_t v28 = 16 * v11;
    do
    {
      *(_OWORD *)&v17[v28 - 16] = *(_OWORD *)&begin[v28 - 16];
      v28 -= 16;
    }
    while (v28);
    float64x2_t v23 = v17;
    end = (long long *)self->_points.__end_;
  }
  for (i = &v17[16 * v16]; v12 != end; v25 += 16)
  {
    long long v30 = *v12++;
    *(_OWORD *)v25 = v30;
  }
  float64x2x2_t v31 = self->_points.__begin_;
  self->_points.__begin_ = v23;
  self->_points.__end_ = v25;
  self->_points.__end_cap_.__value_ = i;
  if (v31)
  {
    operator delete(v31);
  }
}

@end