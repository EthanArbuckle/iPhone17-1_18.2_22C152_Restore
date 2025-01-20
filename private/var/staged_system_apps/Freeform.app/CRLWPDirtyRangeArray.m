@interface CRLWPDirtyRangeArray
- ($B04355509C8947C2F6D748FEAD01E047)dirtyRangeAtIndex:(SEL)a3;
- (BOOL)isEmpty;
- (BOOL)isEqualToDirtyRangeArray:(id)a3;
- (CRLWPDirtyRangeArray)init;
- (CRLWPDirtyRangeArray)initWithDirtyRange:(id *)a3;
- (CRLWPDirtyRangeArray)initWithRangeVector:(const void *)a3;
- (_NSRange)superRange;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dirtyRangesIntersecting:(_NSRange)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)delta;
- (unint64_t)count;
- (unint64_t)indexForRange:(_NSRange)a3;
@end

@implementation CRLWPDirtyRangeArray

- (CRLWPDirtyRangeArray)init
{
  v3.receiver = self;
  v3.super_class = (Class)CRLWPDirtyRangeArray;
  return [(CRLWPDirtyRangeArray *)&v3 init];
}

- (CRLWPDirtyRangeArray)initWithDirtyRange:(id *)a3
{
  v4 = [(CRLWPDirtyRangeArray *)self init];
  v5 = v4;
  if (v4)
  {
    uint64_t p_end_cap = (uint64_t)&v4->_rangeVector.__end_cap_;
    value = v5->_rangeVector.__end_cap_.__value_;
    end = v5->_rangeVector.__end_;
    if (end >= value)
    {
      begin = v5->_rangeVector.__begin_;
      unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      unint64_t v13 = v12 + 1;
      if (v12 + 1 > 0xAAAAAAAAAAAAAAALL) {
        sub_100004E40();
      }
      unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((value - begin) >> 3);
      if (2 * v14 > v13) {
        unint64_t v13 = 2 * v14;
      }
      if (v14 >= 0x555555555555555) {
        unint64_t v15 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v15 = v13;
      }
      if (v15) {
        v16 = (char *)sub_100046F5C(p_end_cap, v15);
      }
      else {
        v16 = 0;
      }
      v17 = &v16[24 * v12];
      v18 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v16[24 * v15];
      _NSRange var0 = a3->var0;
      *((void *)v17 + 2) = a3->var1;
      *(_NSRange *)v17 = var0;
      v10 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v17 + 24);
      v21 = v5->_rangeVector.__begin_;
      v20 = v5->_rangeVector.__end_;
      if (v20 != v21)
      {
        do
        {
          long long v22 = *(_OWORD *)((char *)v20 - 24);
          *((void *)v17 - 1) = *((void *)v20 - 1);
          *(_OWORD *)(v17 - 24) = v22;
          v17 -= 24;
          v20 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v20 - 24);
        }
        while (v20 != v21);
        v20 = v5->_rangeVector.__begin_;
      }
      v5->_rangeVector.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v17;
      v5->_rangeVector.__end_ = v10;
      v5->_rangeVector.__end_cap_.__value_ = v18;
      if (v20) {
        operator delete(v20);
      }
    }
    else
    {
      _NSRange v9 = a3->var0;
      *((void *)end + 2) = a3->var1;
      *(_NSRange *)end = v9;
      v10 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 24);
    }
    v5->_rangeVector.__end_ = v10;
  }
  return v5;
}

- (CRLWPDirtyRangeArray)initWithRangeVector:(const void *)a3
{
  v4 = [(CRLWPDirtyRangeArray *)self init];
  v5 = v4;
  if (v4)
  {
    p_rangeVector = (char *)&v4->_rangeVector;
    if (&v5->_rangeVector != a3) {
      sub_100084064(p_rangeVector, *(char **)a3, *((void *)a3 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3));
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CRLWPDirtyRangeArray alloc];

  return [(CRLWPDirtyRangeArray *)v4 initWithRangeVector:&self->_rangeVector];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [CRLWPMutableDirtyRangeArray alloc];

  return [(CRLWPDirtyRangeArray *)v4 initWithRangeVector:&self->_rangeVector];
}

- (BOOL)isEmpty
{
  return self->_rangeVector.__begin_ == self->_rangeVector.__end_;
}

- (unint64_t)count
{
  return 0xAAAAAAAAAAAAAAABLL * ((self->_rangeVector.__end_ - self->_rangeVector.__begin_) >> 3);
}

- ($B04355509C8947C2F6D748FEAD01E047)dirtyRangeAtIndex:(SEL)a3
{
  *retstr = *($B04355509C8947C2F6D748FEAD01E047 *)(self->var0.length + 24 * a4);
  return self;
}

- (BOOL)isEqualToDirtyRangeArray:(id)a3
{
  v4 = a3;
  begin = self->_rangeVector.__begin_;
  end = self->_rangeVector.__end_;
  v7 = (void *)v4[1];
  if (end - begin == v4[2] - (void)v7)
  {
    if (begin == end)
    {
      LOBYTE(v10) = 1;
    }
    else
    {
      do
      {
        BOOL v10 = *(void *)begin == *v7 && *((void *)begin + 1) == v7[1] && *((void *)begin + 2) == v7[2];
        begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 24);
        v7 += 3;
      }
      while (v10 && begin != end);
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (_NSRange)superRange
{
  if ([(CRLWPDirtyRangeArray *)self isEmpty])
  {
    NSUInteger v3 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v4 = 0;
  }
  else
  {
    unint64_t v5 = *(void *)self->_rangeVector.__begin_;
    unint64_t v6 = *((void *)self->_rangeVector.__end_ - 2) + *((void *)self->_rangeVector.__end_ - 3);
    if (v5 <= v6) {
      uint64_t v7 = *((void *)self->_rangeVector.__end_ - 2) + *((void *)self->_rangeVector.__end_ - 3);
    }
    else {
      uint64_t v7 = *(void *)self->_rangeVector.__begin_;
    }
    if (v5 >= v6) {
      NSUInteger v3 = *((void *)self->_rangeVector.__end_ - 2) + *((void *)self->_rangeVector.__end_ - 3);
    }
    else {
      NSUInteger v3 = *(void *)self->_rangeVector.__begin_;
    }
    NSUInteger v4 = v7 - v3;
  }
  result.length = v4;
  result.location = v3;
  return result;
}

- (int64_t)delta
{
  begin = self->_rangeVector.__begin_;
  end = self->_rangeVector.__end_;
  if (begin == end) {
    return 0;
  }
  int64_t result = 0;
  do
  {
    result += *((void *)begin + 2);
    begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 24);
  }
  while (begin != end);
  return result;
}

- (unint64_t)indexForRange:(_NSRange)a3
{
  begin = self->_rangeVector.__begin_;
  end = self->_rangeVector.__end_;
  if (end == begin)
  {
    unint64_t v6 = self->_rangeVector.__begin_;
  }
  else
  {
    unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
    unint64_t v6 = self->_rangeVector.__begin_;
    do
    {
      unint64_t v7 = v5 >> 1;
      v8 = (NSUInteger *)((char *)v6 + 24 * (v5 >> 1));
      NSUInteger v10 = *v8;
      _NSRange v9 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v8 + 3);
      v5 += ~(v5 >> 1);
      if (v10 < a3.location) {
        unint64_t v6 = v9;
      }
      else {
        unint64_t v5 = v7;
      }
    }
    while (v5);
  }
  if (v6 == end)
  {
    unint64_t v6 = self->_rangeVector.__end_;
  }
  else if (*(void *)v6 == a3.location)
  {
    unint64_t v6 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v6 + 24 * (a3.length < *((void *)v6 + 1)));
  }
  return 0xAAAAAAAAAAAAAAABLL * ((v6 - begin) >> 3);
}

- (id)dirtyRangesIntersecting:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v6 = objc_opt_new();
  begin = self->_rangeVector.__begin_;
  end = self->_rangeVector.__end_;
  if (begin != end)
  {
    _NSRange v9 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 24);
    do
    {
      v20.NSUInteger location = location;
      v20.NSUInteger length = length;
      if (!NSIntersectionRange(v20, *(NSRange *)(v9 - 24)).length)
      {
        NSUInteger v11 = *((void *)v9 - 3);
        uint64_t v12 = *((void *)v9 - 2);
        if (v12) {
          goto LABEL_12;
        }
        if (v11 < location || v11 - location >= length)
        {
          uint64_t v12 = 0;
          goto LABEL_12;
        }
      }
      long long v10 = *(_OWORD *)((char *)v9 - 24);
      uint64_t v18 = *((void *)v9 - 1);
      long long v17 = v10;
      [v6 addRange:&v17 allowEmpty:1];
      NSUInteger v11 = *((void *)v9 - 3);
      uint64_t v12 = *((void *)v9 - 2);
LABEL_12:
      BOOL v14 = location + length < v12 + v11 || v9 == end;
      _NSRange v9 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v9 + 24);
    }
    while (!v14);
  }
  id v15 = [v6 copy];

  return v15;
}

- (void).cxx_destruct
{
  begin = self->_rangeVector.__begin_;
  if (begin)
  {
    self->_rangeVector.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end