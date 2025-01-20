@interface CRLWPMutableDirtyRangeArray
- (void)addChangedRange:(_NSRange)a3 delta:(int64_t)a4;
- (void)addChangedRange:(_NSRange)a3 delta:(int64_t)a4 allowEmpty:(BOOL)a5;
- (void)addRange:(id *)a3;
- (void)addRange:(id *)a3 allowEmpty:(BOOL)a4;
- (void)clear;
- (void)removeRange:(_NSRange)a3;
- (void)subtract:(id)a3;
@end

@implementation CRLWPMutableDirtyRangeArray

- (void)clear
{
  self->super._rangeVector.__end_ = self->super._rangeVector.__begin_;
}

- (void)addRange:(id *)a3 allowEmpty:(BOOL)a4
{
  if (a3->var0.location != 0x7FFFFFFFFFFFFFFFLL && (a4 || a3->var0.length || a3->var1))
  {
    begin = self->super._rangeVector.__begin_;
    end = (char *)self->super._rangeVector.__end_;
    if (begin != ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)end)
    {
      $B04355509C8947C2F6D748FEAD01E047 v54 = *a3;
      NSUInteger length = v54.var0.length;
      NSUInteger location = v54.var0.location;
      unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((end - (char *)begin) >> 3);
      v11 = (NSRange *)begin;
      do
      {
        unint64_t v12 = v10 >> 1;
        v13 = &v11->location + 3 * (v10 >> 1);
        NSUInteger v15 = *v13;
        v14 = (NSRange *)(v13 + 3);
        v10 += ~(v10 >> 1);
        if (v15 < v54.var0.location) {
          v11 = v14;
        }
        else {
          unint64_t v10 = v12;
        }
      }
      while (v10);
      if (end == (char *)v11)
      {
        int v22 = 0;
        v17 = end;
      }
      else
      {
        unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((end - (char *)v11) >> 3);
        v17 = (char *)v11;
        do
        {
          unint64_t v18 = v16 >> 1;
          v19 = (NSUInteger *)&v17[24 * (v16 >> 1)];
          NSUInteger v21 = *v19;
          v20 = (char *)(v19 + 3);
          v16 += ~(v16 >> 1);
          if (v21 < v54.var0.length + v54.var0.location) {
            v17 = v20;
          }
          else {
            unint64_t v16 = v18;
          }
        }
        while (v16);
        if (sub_1002093DC(v54.var0, *v11, 1) == 0x7FFFFFFFFFFFFFFFLL)
        {
          int v22 = 0;
        }
        else
        {
          NSRange v27 = NSUnionRange(v54.var0, *v11);
          NSUInteger location = v27.location;
          NSUInteger length = v27.length;
          int64_t v28 = v11[1].location + v54.var1;
          v54._NSRange var0 = v27;
          v54.var1 = v28;
          int v22 = 1;
        }
      }
      if (v11 == (NSRange *)begin)
      {
        v11 = (NSRange *)begin;
      }
      else
      {
        v55.NSUInteger location = location;
        v55.NSUInteger length = length;
        if (sub_1002093DC(v55, *(NSRange *)((char *)v11 - 24), 1) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v56.NSUInteger location = location;
          v56.NSUInteger length = length;
          NSRange v29 = NSUnionRange(v56, *(NSRange *)((char *)v11 - 24));
          NSUInteger location = v29.location;
          NSUInteger length = v29.length;
          int64_t v30 = v11[-1].length + v54.var1;
          v54._NSRange var0 = v29;
          v54.var1 = v30;
          int v22 = 1;
          v11 = (NSRange *)((char *)v11 - 24);
        }
      }
      uint64_t v32 = v17 == end && v17 != (char *)begin;
      uint64_t v33 = v32 << 63 >> 63;
      v34 = (NSRange *)&v17[24 * ((int)(v32 << 31) >> 31)];
      BOOL v35 = v34 == (NSRange *)end || v34 == v11;
      if (v35 || (v57.NSUInteger location = location, v57.length = length, sub_1002093DC(v57, *v34, 1) == 0x7FFFFFFFFFFFFFFFLL))
      {
        if (!v22) {
          goto LABEL_64;
        }
      }
      else
      {
        NSRange v59 = *v34;
        v34 = (NSRange *)((char *)v34 + 24);
        v58.NSUInteger location = location;
        v58.NSUInteger length = length;
        NSRange v46 = NSUnionRange(v58, v59);
        int64_t v47 = *(void *)&v17[24 * (int)v33 + 16] + v54.var1;
        v54._NSRange var0 = v46;
        v54.var1 = v47;
      }
      if (v11 >= v34)
      {
        if (v34 < v11)
        {
          v52 = self->super._rangeVector.__end_;
          size_t v49 = v52 - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v11;
          if (v52 != ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v11) {
            memmove(v34, v11, v52 - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v11);
          }
          v11 = v34;
          goto LABEL_63;
        }
        if (v11 == (NSRange *)end)
        {
LABEL_65:
          sub_1000837A4((uint64_t)&self->super._rangeVector, end, (unint64_t)&v54);
          return;
        }
        v51 = (NSRange *)((char *)v11 + 24);
        v53 = self->super._rangeVector.__end_;
        size_t v49 = v53 - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v11[1].length;
        if (v53 == ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v11[1].length) {
          goto LABEL_63;
        }
        v50 = v11;
      }
      else
      {
        v48 = self->super._rangeVector.__end_;
        size_t v49 = v48 - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v34;
        if (v48 == ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v34)
        {
LABEL_63:
          self->super._rangeVector.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v11 + v49);
LABEL_64:
          end = (char *)v11;
          goto LABEL_65;
        }
        v50 = v11;
        v51 = v34;
      }
      memmove(v50, v51, v49);
      goto LABEL_63;
    }
    p_end_cap = &self->super._rangeVector.__end_cap_;
    value = self->super._rangeVector.__end_cap_.__value_;
    if (begin >= value)
    {
      unint64_t v36 = 0xAAAAAAAAAAAAAAABLL * ((value - begin) >> 3);
      uint64_t v37 = 2 * v36;
      if (2 * v36 <= 1) {
        uint64_t v37 = 1;
      }
      if (v36 >= 0x555555555555555) {
        unint64_t v38 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v38 = v37;
      }
      v39 = (char *)sub_100046F5C((uint64_t)p_end_cap, v38);
      v41 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v39[24 * v40];
      _NSRange var0 = a3->var0;
      *((void *)v39 + 2) = a3->var1;
      *(_NSRange *)v39 = var0;
      v26 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v39 + 24);
      v44 = self->super._rangeVector.__begin_;
      v43 = self->super._rangeVector.__end_;
      if (v43 != v44)
      {
        do
        {
          long long v45 = *(_OWORD *)((char *)v43 - 24);
          *((void *)v39 - 1) = *((void *)v43 - 1);
          *(_OWORD *)(v39 - 24) = v45;
          v39 -= 24;
          v43 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v43 - 24);
        }
        while (v43 != v44);
        v43 = self->super._rangeVector.__begin_;
      }
      self->super._rangeVector.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v39;
      self->super._rangeVector.__end_ = v26;
      self->super._rangeVector.__end_cap_.__value_ = v41;
      if (v43) {
        operator delete(v43);
      }
    }
    else
    {
      _NSRange v25 = a3->var0;
      *((void *)begin + 2) = a3->var1;
      *(_NSRange *)begin = v25;
      v26 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 24);
    }
    self->super._rangeVector.__end_ = v26;
  }
}

- (void)addRange:(id *)a3
{
  $B04355509C8947C2F6D748FEAD01E047 v3 = *a3;
  [(CRLWPMutableDirtyRangeArray *)self addRange:&v3 allowEmpty:0];
}

- (void)removeRange:(_NSRange)a3
{
  begin = self->super._rangeVector.__begin_;
  end = self->super._rangeVector.__end_;
  p_rangeVector = &self->super._rangeVector;
  if (end == begin)
  {
    NSUInteger v14 = a3.location + a3.length;
    NSUInteger v15 = begin;
LABEL_27:
    int v22 = begin;
    goto LABEL_37;
  }
  unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
  unint64_t v8 = v7;
  v9 = (char *)begin;
  do
  {
    unint64_t v10 = v8 >> 1;
    v11 = (NSUInteger *)&v9[24 * (v8 >> 1)];
    NSUInteger v13 = *v11;
    unint64_t v12 = (char *)(v11 + 3);
    v8 += ~(v8 >> 1);
    if (v13 > a3.location) {
      unint64_t v8 = v10;
    }
    else {
      v9 = v12;
    }
  }
  while (v8);
  NSUInteger v14 = a3.location + a3.length;
  NSUInteger v15 = begin;
  do
  {
    unint64_t v16 = v7 >> 1;
    v17 = (NSUInteger *)((char *)v15 + 24 * (v7 >> 1));
    NSUInteger v19 = *v17;
    unint64_t v18 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v17 + 3);
    v7 += ~(v7 >> 1);
    if (v19 < v14) {
      NSUInteger v15 = v18;
    }
    else {
      unint64_t v7 = v16;
    }
  }
  while (v7);
  if (v9 == (char *)begin) {
    goto LABEL_27;
  }
  unint64_t v20 = *((void *)v9 - 3);
  NSUInteger v21 = *((void *)v9 - 2);
  int v22 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v9 - 24);
  NSUInteger v23 = a3.location - v20;
  if (a3.location < v20 || v23 >= v21)
  {
    if (v20 - a3.location < a3.length && v20 >= a3.location) {
      NSRange v27 = v9 - 24;
    }
    else {
      NSRange v27 = v9;
    }
    if (v21) {
      int v22 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v9;
    }
    else {
      int v22 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v27;
    }
  }
  else
  {
    if (a3.location != v20)
    {
      *((void *)v9 - 2) = v23;
      int v22 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v9;
    }
    if (v14 >= v20 && v14 - v20 < v21)
    {
      NSUInteger v24 = v21 + v20;
      if (v14 <= v21 + v20) {
        NSUInteger v25 = v21 + v20;
      }
      else {
        NSUInteger v25 = a3.location + a3.length;
      }
      if (v14 < v21 + v20) {
        NSUInteger v24 = a3.location + a3.length;
      }
      v40[0] = v24;
      v40[1] = v25 - v24;
      v40[2] = 0;
      if (a3.location == v20)
      {
        *(void *)int v22 = v24;
        *((void *)v22 + 1) = v25 - v24;
      }
      else
      {
        sub_1000837A4((uint64_t)p_rangeVector, v9, (unint64_t)v40);
      }
      return;
    }
  }
LABEL_37:
  if (v15 != end)
  {
    NSUInteger v28 = *((void *)v15 + 1);
    if (v14 > *(void *)v15 && v14 - *(void *)v15 < v28)
    {
      NSUInteger v30 = v28 + *(void *)v15;
      if (v14 <= v30) {
        NSUInteger v31 = v28 + *(void *)v15;
      }
      else {
        NSUInteger v31 = v14;
      }
      if (v14 < v30) {
        NSUInteger v30 = v14;
      }
      *(void *)NSUInteger v15 = v30;
      *((void *)v15 + 1) = v31 - v30;
    }
  }
  if (v22 != v15)
  {
    if (v15 != begin)
    {
      NSUInteger v32 = *((void *)v15 - 3);
      NSUInteger v33 = *((void *)v15 - 2);
      begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v15 - 24);
      if (v14 < v32 || v14 - v32 >= v33)
      {
        begin = v15;
      }
      else
      {
        NSUInteger v35 = v33 + v32;
        if (v14 <= v35) {
          NSUInteger v36 = v35;
        }
        else {
          NSUInteger v36 = v14;
        }
        if (v14 >= v35) {
          NSUInteger v14 = v35;
        }
        *((void *)v15 - 3) = v14;
        *((void *)v15 - 2) = v36 - v14;
      }
    }
    if (v22 != begin)
    {
      if (v22 >= begin)
      {
        int64_t v39 = end - v22;
        if (end != v22) {
          memmove(begin, v22, end - v22);
        }
        unint64_t v38 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + v39);
      }
      else
      {
        int64_t v37 = end - begin;
        if (end != begin) {
          memmove(v22, begin, end - begin);
        }
        unint64_t v38 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v22 + v37);
      }
      self->super._rangeVector.__end_ = v38;
    }
  }
}

- (void)addChangedRange:(_NSRange)a3 delta:(int64_t)a4 allowEmpty:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  begin = self->super._rangeVector.__begin_;
  end = self->super._rangeVector.__end_;
  NSUInteger v35 = objc_opt_new();
  int64_t v12 = end - begin;
  NSUInteger range2 = length;
  if (end == begin)
  {
    char v32 = 0;
  }
  else
  {
    char v32 = 0;
    uint64_t v13 = v12 / 24;
    NSUInteger v14 = location + length;
    uint64_t v15 = 24 * (v12 / 24) - 8;
    uint64_t v16 = -24 * (v12 / 24);
    NSUInteger v34 = location + length;
    do
    {
      v17 = self->super._rangeVector.__begin_;
      unint64_t v18 = (unint64_t *)((char *)v17 + v15 - 16);
      unint64_t v19 = *v18;
      unint64_t v20 = *(void *)((char *)v17 + v15 - 8);
      if (v20 + *v18 < location) {
        break;
      }
      uint64_t v21 = *(void *)((char *)v17 + v15);
      if (v19 <= v14 - a4)
      {
        if (a4 < 0 && v20 <= -a4)
        {
          int v22 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v17 + v15 + 8);
          NSUInteger v23 = self->super._rangeVector.__end_;
          uint64_t v24 = v16 + v23 - v17;
          if (v22 != v23)
          {
            memmove(v18, v22, v16 + v23 - v17);
            NSUInteger v14 = v34;
          }
          self->super._rangeVector.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v17
                                                                                + 24 * (v24 / 24)
                                                                                + v15
                                                                                - 16);
          a4 += v21;
        }
        else
        {
          v41.NSUInteger length = v20 + a4;
          v41.NSUInteger location = *(void *)((char *)v17 + v15 - 16);
          v42.NSUInteger location = location;
          v42.NSUInteger length = range2;
          NSRange v39 = NSUnionRange(v41, v42);
          uint64_t v40 = v21 + a4;
          [v35 addRange:&v39 allowEmpty:v5];
          v26 = self->super._rangeVector.__begin_;
          NSUInteger v25 = self->super._rangeVector.__end_;
          NSRange v27 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v26 + v15 + 8);
          uint64_t v28 = v16 + v25 - v26;
          if (v27 != v25) {
            memmove((char *)v26 + v15 - 16, v27, v16 + v25 - v26);
          }
          a4 = 0;
          self->super._rangeVector.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v26
                                                                                + 24 * (v28 / 24)
                                                                                + v15
                                                                                - 16);
          char v32 = 1;
          NSUInteger v14 = v34;
        }
      }
      else
      {
        *unint64_t v18 = v19 + a4;
        *(void *)((char *)v17 + v15) = v21;
      }
      v16 += 24;
      v15 -= 24;
      --v13;
    }
    while (v13);
  }
  NSRange v29 = (long long *)v35[1];
  for (i = (long long *)v35[2]; v29 != i; NSRange v29 = (long long *)((char *)v29 + 24))
  {
    long long v31 = *v29;
    uint64_t v38 = *((void *)v29 + 2);
    long long v37 = v31;
    [(CRLWPMutableDirtyRangeArray *)self addRange:&v37 allowEmpty:v5];
  }
  if ((v32 & 1) == 0)
  {
    v36[0] = location;
    v36[1] = range2;
    v36[2] = a4;
    [(CRLWPMutableDirtyRangeArray *)self addRange:v36 allowEmpty:v5];
  }
}

- (void)addChangedRange:(_NSRange)a3 delta:(int64_t)a4
{
}

- (void)subtract:(id)a3
{
  uint64_t v15 = a3;
  if (self->super._rangeVector.__end_ != self->super._rangeVector.__begin_)
  {
    v4 = (char *)[v15 count];
    if (v4)
    {
      uint64_t v5 = 0;
      do
      {
        v6 = (uint64_t *)(v15[1] + v5);
        unint64_t v7 = -[CRLWPDirtyRangeArray indexForRange:](self, "indexForRange:", *v6, v6[1]);
        unint64_t v8 = [(CRLWPDirtyRangeArray *)self count];
        uint64_t v9 = *v6;
        uint64_t v10 = v6[1];
        if (v7 < v8
          && ((v11 = (void *)((char *)self->super._rangeVector.__begin_ + 24 * v7), v9 == *v11)
            ? (BOOL v12 = v10 == v11[1])
            : (BOOL v12 = 0),
              v12))
        {
          end = self->super._rangeVector.__end_;
          int64_t v14 = end - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v11 + 3);
          if (end != ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v11 + 3)) {
            memmove(v11, v11 + 3, end - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v11 + 3));
          }
          self->super._rangeVector.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v11 + v14);
        }
        else
        {
          -[CRLWPMutableDirtyRangeArray removeRange:](self, "removeRange:", v9, v10);
        }
        v5 += 24;
        --v4;
      }
      while (v4);
    }
  }
}

@end