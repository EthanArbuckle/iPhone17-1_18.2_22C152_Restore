@interface TUIMutableAnchorSet
- (double)translationOffset;
- (id)copyWithZone:(_NSZone *)a3;
- (void)appendLogicalScrollAnchor:(id)a3 withOffset:(double)a4;
- (void)appendScrollAnchor:(double)a3;
- (void)appendTriggerAnchorWithOffset:(double)a3 trigger:(id)a4 axis:(unint64_t)a5;
- (void)finalizeWithContentsScale:(double)a3;
- (void)setTranslationOffset:(double)a3;
@end

@implementation TUIMutableAnchorSet

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [TUIAnchorSet alloc];

  return [(TUIAnchorSet *)v4 initWithAnchorSet:self];
}

- (void)finalizeWithContentsScale:(double)a3
{
  begin = (uint64_t *)self->super._verticalTriggerAnchors.__begin_;
  end = (uint64_t *)self->super._verticalTriggerAnchors.__end_;
  unint64_t v7 = 126 - 2 * __clz(((char *)end - (char *)begin) >> 4);
  if (end == begin) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v7;
  }
  sub_141C00(begin, end, v8, 1);
  v9 = (uint64_t *)self->super._horizontalTriggerAnchors.__begin_;
  v10 = (uint64_t *)self->super._horizontalTriggerAnchors.__end_;
  unint64_t v11 = 126 - 2 * __clz(((char *)v10 - (char *)v9) >> 4);
  if (v10 == v9) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = v11;
  }
  sub_14284C(v9, v10, v12, 1);
  v13 = (double *)self->super._logicalScrollAnchors.__begin_;
  if (v13 == self->super._logicalScrollAnchors.__end_)
  {
    v14 = (uint64_t *)self->super._logicalScrollAnchors.__begin_;
  }
  else
  {
    do
    {
      double *v13 = TUIFloatRoundedForScale(*v13, a3);
      v13 += 2;
    }
    while (v13 != self->super._logicalScrollAnchors.__end_);
    v14 = (uint64_t *)self->super._logicalScrollAnchors.__begin_;
  }
  unint64_t v15 = 126 - 2 * __clz(((char *)v13 - (char *)v14) >> 4);
  if (v13 == (double *)v14) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = v15;
  }
  sub_1432CC(v14, (uint64_t *)v13, v16, 1);
  std::__sort<std::__less<double,double> &,double *>();
}

- (void)appendScrollAnchor:(double)a3
{
  [(TUIAnchorSet *)self offset];
  double v6 = a3 - v5 + self->_translationOffset;
  end = self->super._scrollAnchors.__end_;
  value = self->super._scrollAnchors.__end_cap_.__value_;
  if (end >= value)
  {
    begin = self->super._scrollAnchors.__begin_;
    uint64_t v11 = end - begin;
    if ((unint64_t)(v11 + 1) >> 61) {
      sub_4484();
    }
    unint64_t v12 = (char *)value - (char *)begin;
    unint64_t v13 = ((char *)value - (char *)begin) >> 2;
    if (v13 <= v11 + 1) {
      unint64_t v13 = v11 + 1;
    }
    if (v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    if (v14)
    {
      unint64_t v15 = (char *)sub_39FA0((uint64_t)&self->super._scrollAnchors.__end_cap_, v14);
      begin = self->super._scrollAnchors.__begin_;
      end = self->super._scrollAnchors.__end_;
    }
    else
    {
      unint64_t v15 = 0;
    }
    uint64_t v16 = (double *)&v15[8 * v11];
    v17 = (double *)&v15[8 * v14];
    *uint64_t v16 = v6;
    v9 = v16 + 1;
    while (end != begin)
    {
      uint64_t v18 = *((void *)end-- - 1);
      *((void *)v16-- - 1) = v18;
    }
    self->super._scrollAnchors.__begin_ = v16;
    self->super._scrollAnchors.__end_ = v9;
    self->super._scrollAnchors.__end_cap_.__value_ = v17;
    if (begin) {
      operator delete(begin);
    }
  }
  else
  {
    double *end = v6;
    v9 = end + 1;
  }
  self->super._scrollAnchors.__end_ = v9;
}

- (void)appendTriggerAnchorWithOffset:(double)a3 trigger:(id)a4 axis:(unint64_t)a5
{
  id v8 = a4;
  double v9 = self->_translationOffset + a3;
  id v10 = v8;
  if (a5 == 2)
  {
    value = (char *)self->super._verticalTriggerAnchors.__end_cap_.__value_;
    end = (char *)self->super._verticalTriggerAnchors.__end_;
    if (end >= value)
    {
      begin = self->super._verticalTriggerAnchors.__begin_;
      uint64_t v18 = (end - begin) >> 4;
      if ((unint64_t)(v18 + 1) >> 60) {
        sub_4484();
      }
      unint64_t v19 = value - begin;
      unint64_t v20 = (value - begin) >> 3;
      if (v20 <= v18 + 1) {
        unint64_t v20 = v18 + 1;
      }
      if (v19 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v21 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v21 = v20;
      }
      p_end_cap = &self->super._verticalTriggerAnchors.__end_cap_;
      v22 = (char *)sub_21C3C((uint64_t)&self->super._verticalTriggerAnchors.__end_cap_, v21);
      v24 = &v22[16 * v18];
      *(double *)v24 = v9;
      *((void *)v24 + 1) = v10;
      v26 = (char *)self->super._verticalTriggerAnchors.__begin_;
      v25 = (char *)self->super._verticalTriggerAnchors.__end_;
      v27 = v24;
      if (v25 != v26)
      {
        v28 = (char *)self->super._verticalTriggerAnchors.__end_;
        do
        {
          uint64_t v29 = *((void *)v28 - 2);
          v28 -= 16;
          *((void *)v27 - 2) = v29;
          v27 -= 16;
          uint64_t v30 = *((void *)v28 + 1);
          *((void *)v28 + 1) = 0;
          *((void *)v27 + 1) = v30;
        }
        while (v28 != v26);
      }
      unint64_t v13 = v24 + 16;
      self->super._verticalTriggerAnchors.__begin_ = v27;
      self->super._verticalTriggerAnchors.__end_ = v24 + 16;
      v31 = self->super._verticalTriggerAnchors.__end_cap_.__value_;
      self->super._verticalTriggerAnchors.__end_cap_.__value_ = &v22[16 * v23];
      v49 = v25;
      v50 = v31;
      v47 = v26;
      v48 = v26;
      sub_143D4C((uint64_t)&v47);
    }
    else
    {
      *(double *)end = v9;
      *((void *)end + 1) = v10;
      unint64_t v13 = end + 16;
    }
    self->super._verticalTriggerAnchors.__end_ = v13;
  }
  else
  {
    unint64_t v14 = (char *)self->super._horizontalTriggerAnchors.__end_cap_.__value_;
    unint64_t v15 = (char *)self->super._horizontalTriggerAnchors.__end_;
    if (v15 >= v14)
    {
      v32 = self->super._horizontalTriggerAnchors.__begin_;
      uint64_t v33 = (v15 - v32) >> 4;
      if ((unint64_t)(v33 + 1) >> 60) {
        sub_4484();
      }
      unint64_t v34 = v14 - v32;
      unint64_t v35 = (v14 - v32) >> 3;
      if (v35 <= v33 + 1) {
        unint64_t v35 = v33 + 1;
      }
      if (v34 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v36 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v36 = v35;
      }
      p_end_cap = &self->super._horizontalTriggerAnchors.__end_cap_;
      v37 = (char *)sub_21C3C((uint64_t)&self->super._horizontalTriggerAnchors.__end_cap_, v36);
      v39 = &v37[16 * v33];
      *(double *)v39 = v9;
      *((void *)v39 + 1) = v10;
      v41 = (char *)self->super._horizontalTriggerAnchors.__begin_;
      v40 = (char *)self->super._horizontalTriggerAnchors.__end_;
      v42 = v39;
      if (v40 != v41)
      {
        v43 = (char *)self->super._horizontalTriggerAnchors.__end_;
        do
        {
          uint64_t v44 = *((void *)v43 - 2);
          v43 -= 16;
          *((void *)v42 - 2) = v44;
          v42 -= 16;
          uint64_t v45 = *((void *)v43 + 1);
          *((void *)v43 + 1) = 0;
          *((void *)v42 + 1) = v45;
        }
        while (v43 != v41);
      }
      uint64_t v16 = v39 + 16;
      self->super._horizontalTriggerAnchors.__begin_ = v42;
      self->super._horizontalTriggerAnchors.__end_ = v39 + 16;
      v46 = self->super._horizontalTriggerAnchors.__end_cap_.__value_;
      self->super._horizontalTriggerAnchors.__end_cap_.__value_ = &v37[16 * v38];
      v49 = v40;
      v50 = v46;
      v47 = v41;
      v48 = v41;
      sub_143D4C((uint64_t)&v47);
    }
    else
    {
      *(double *)unint64_t v15 = v9;
      *((void *)v15 + 1) = v10;
      uint64_t v16 = v15 + 16;
    }
    self->super._horizontalTriggerAnchors.__end_ = v16;
  }
}

- (void)appendLogicalScrollAnchor:(id)a3 withOffset:(double)a4
{
  id v6 = a3;
  double v7 = self->_translationOffset + a4;
  id v8 = v6;
  value = (char *)self->super._logicalScrollAnchors.__end_cap_.__value_;
  end = (char *)self->super._logicalScrollAnchors.__end_;
  if (end >= value)
  {
    begin = self->super._logicalScrollAnchors.__begin_;
    uint64_t v13 = (end - begin) >> 4;
    if ((unint64_t)(v13 + 1) >> 60) {
      sub_4484();
    }
    unint64_t v14 = value - begin;
    unint64_t v15 = (value - begin) >> 3;
    if (v15 <= v13 + 1) {
      unint64_t v15 = v13 + 1;
    }
    if (v14 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v16 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v15;
    }
    v27[4] = &self->super._logicalScrollAnchors.__end_cap_;
    v17 = (char *)sub_21C3C((uint64_t)&self->super._logicalScrollAnchors.__end_cap_, v16);
    unint64_t v19 = &v17[16 * v13];
    *(double *)unint64_t v19 = v7;
    *((void *)v19 + 1) = v8;
    unint64_t v21 = (char *)self->super._logicalScrollAnchors.__begin_;
    unint64_t v20 = (char *)self->super._logicalScrollAnchors.__end_;
    v22 = v19;
    if (v20 != v21)
    {
      uint64_t v23 = (char *)self->super._logicalScrollAnchors.__end_;
      do
      {
        uint64_t v24 = *((void *)v23 - 2);
        v23 -= 16;
        *((void *)v22 - 2) = v24;
        v22 -= 16;
        uint64_t v25 = *((void *)v23 + 1);
        *((void *)v23 + 1) = 0;
        *((void *)v22 + 1) = v25;
      }
      while (v23 != v21);
    }
    uint64_t v11 = v19 + 16;
    self->super._logicalScrollAnchors.__begin_ = v22;
    self->super._logicalScrollAnchors.__end_ = v19 + 16;
    v26 = self->super._logicalScrollAnchors.__end_cap_.__value_;
    self->super._logicalScrollAnchors.__end_cap_.__value_ = &v17[16 * v18];
    v27[2] = v20;
    v27[3] = v26;
    v27[0] = v21;
    v27[1] = v21;
    sub_143D4C((uint64_t)v27);
  }
  else
  {
    *(double *)end = v7;
    *((void *)end + 1) = v8;
    uint64_t v11 = end + 16;
  }
  self->super._logicalScrollAnchors.__end_ = v11;
}

- (double)translationOffset
{
  return self->_translationOffset;
}

- (void)setTranslationOffset:(double)a3
{
  self->_translationOffset = a3;
}

@end