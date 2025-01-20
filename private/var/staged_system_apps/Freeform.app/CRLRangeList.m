@interface CRLRangeList
+ (id)stringValueForRangeVector:(const void *)a3;
- (CRLRangeList)initWithRange:(_NSRange)a3;
- (CRLRangeList)initWithRangeList:(id)a3;
- (CRLRangeList)initWithRangeVector:(const void *)a3;
- (CRLRangeList)initWithRangeVectorMove:(void *)a3;
- (CRLRangeList)initWithString:(id)a3;
- (_NSRange)rangeAtIndex:(unint64_t)a3;
- (const)rangeVector;
- (id).cxx_construct;
- (id)stringValue;
- (unint64_t)count;
- (void)addRange:(_NSRange)a3;
- (void)consolidate;
- (void)insertRange:(_NSRange)a3 atIndex:(unint64_t)a4;
- (void)removeRangeAtIndex:(unint64_t)a3;
- (void)replaceWithRange:(_NSRange)a3 atIndex:(unint64_t)a4;
- (void)reverse;
@end

@implementation CRLRangeList

- (CRLRangeList)initWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v5 = [(CRLRangeList *)self init];
  v6 = v5;
  if (v5)
  {
    sub_10001DF00((uint64_t)&v5->mRangeList, 1uLL);
    begin = v6->mRangeList.__begin_;
    begin->NSUInteger location = location;
    begin->NSUInteger length = length;
  }
  return v6;
}

- (CRLRangeList)initWithRangeList:(id)a3
{
  id v4 = a3;
  v5 = [(CRLRangeList *)self init];
  if (v5)
  {
    sub_10001DF00((uint64_t)&v5->mRangeList, (unint64_t)[v4 count]);
    uint64_t v6 = 0;
    for (unint64_t i = 0; i < (unint64_t)[v4 count]; ++i)
    {
      id v8 = [v4 rangeAtIndex:i];
      v9 = &v5->mRangeList.__begin_[v6];
      v9->NSUInteger location = (NSUInteger)v8;
      v9->NSUInteger length = v10;
      ++v6;
    }
  }

  return v5;
}

- (CRLRangeList)initWithString:(id)a3
{
  id v4 = a3;
  v5 = [(CRLRangeList *)self init];
  uint64_t v6 = v5;
  if (v4 && v5 && (unint64_t)[v4 length] >= 3)
  {
    unint64_t v7 = 0;
    unint64_t v8 = 0;
    p_begin = (void **)&v6->mRangeList.__begin_;
    while (v8 < (unint64_t)[v4 length])
    {
      unsigned int v10 = [v4 characterAtIndex:v8];
      unint64_t v11 = v8;
      if (v10 != 123)
      {
        if ([v4 characterAtIndex:v8] == 125)
        {
          [v4 substringWithRange:v7, v8 - v7 + 1];
          v12 = (NSString *)objc_claimAutoreleasedReturnValue();
          NSRange v13 = NSRangeFromString(v12);
          end = v6->mRangeList.__end_;
          value = v6->mRangeList.__end_cap_.__value_;
          if (end >= value)
          {
            begin = (NSRange *)*p_begin;
            uint64_t v18 = ((char *)end - (unsigned char *)*p_begin) >> 4;
            unint64_t v19 = v18 + 1;
            if ((unint64_t)(v18 + 1) >> 60) {
              sub_100004E40();
            }
            uint64_t v20 = (char *)value - (char *)begin;
            if (v20 >> 3 > v19) {
              unint64_t v19 = v20 >> 3;
            }
            if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v21 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v21 = v19;
            }
            if (v21)
            {
              v22 = (char *)sub_10001EAB0((uint64_t)&v6->mRangeList.__end_cap_, v21);
              begin = v6->mRangeList.__begin_;
              end = v6->mRangeList.__end_;
            }
            else
            {
              v22 = 0;
            }
            v23 = (NSRange *)&v22[16 * v18];
            NSRange *v23 = v13;
            v24 = v23;
            if (end != begin)
            {
              do
              {
                v24[-1] = end[-1];
                --v24;
                --end;
              }
              while (end != begin);
              begin = (NSRange *)*p_begin;
            }
            v16 = v23 + 1;
            v6->mRangeList.__begin_ = v24;
            v6->mRangeList.__end_ = v23 + 1;
            v6->mRangeList.__end_cap_.__value_ = (_NSRange *)&v22[16 * v21];
            if (begin) {
              operator delete(begin);
            }
          }
          else
          {
            NSRange *end = v13;
            v16 = end + 1;
          }
          v6->mRangeList.__end_ = v16;
        }
        unint64_t v11 = v7;
      }
      ++v8;
      unint64_t v7 = v11;
    }
  }

  return v6;
}

- (CRLRangeList)initWithRangeVector:(const void *)a3
{
  id v4 = [(CRLRangeList *)self init];
  v5 = v4;
  if (v4)
  {
    p_mRangeList = (char *)&v4->mRangeList;
    if (&v5->mRangeList != a3) {
      sub_10001EAE8(p_mRangeList, *(char **)a3, *((void *)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4);
    }
  }
  return v5;
}

- (CRLRangeList)initWithRangeVectorMove:(void *)a3
{
  id v4 = [(CRLRangeList *)self init];
  v5 = v4;
  if (v4)
  {
    p_mRangeList = (char *)&v4->mRangeList;
    if (&v5->mRangeList != a3) {
      sub_10001EAE8(p_mRangeList, *(char **)a3, *((void *)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4);
    }
  }
  return v5;
}

- (const)rangeVector
{
  return &self->mRangeList;
}

- (unint64_t)count
{
  return self->mRangeList.__end_ - self->mRangeList.__begin_;
}

- (void)addRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  p_end_cap = &self->mRangeList.__end_cap_;
  value = self->mRangeList.__end_cap_.__value_;
  end = self->mRangeList.__end_;
  if (end >= value)
  {
    p_mRangeList = &self->mRangeList;
    begin = self->mRangeList.__begin_;
    uint64_t v12 = end - begin;
    unint64_t v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 60) {
      sub_100004E40();
    }
    uint64_t v14 = (char *)value - (char *)begin;
    if (v14 >> 3 > v13) {
      unint64_t v13 = v14 >> 3;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v15 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v13;
    }
    if (v15)
    {
      v16 = (char *)sub_10001EAB0((uint64_t)p_end_cap, v15);
      begin = self->mRangeList.__begin_;
      end = self->mRangeList.__end_;
    }
    else
    {
      v16 = 0;
    }
    v17 = (_NSRange *)&v16[16 * v12];
    uint64_t v18 = (_NSRange *)&v16[16 * v15];
    v17->NSUInteger location = location;
    v17->NSUInteger length = length;
    v9 = v17 + 1;
    if (end != begin)
    {
      do
      {
        v17[-1] = end[-1];
        --v17;
        --end;
      }
      while (end != begin);
      begin = p_mRangeList->__begin_;
    }
    self->mRangeList.__begin_ = v17;
    self->mRangeList.__end_ = v9;
    self->mRangeList.__end_cap_.__value_ = v18;
    if (begin) {
      operator delete(begin);
    }
  }
  else
  {
    _NSRange *end = a3;
    v9 = end + 1;
  }
  self->mRangeList.__end_ = v9;
}

- (void)insertRange:(_NSRange)a3 atIndex:(unint64_t)a4
{
  _NSRange v4 = a3;
  sub_10001E428((uint64_t)&self->mRangeList, (char *)&self->mRangeList.__begin_[a4], (char *)&v4);
}

- (void)removeRangeAtIndex:(unint64_t)a3
{
  begin = self->mRangeList.__begin_;
  end = self->mRangeList.__end_;
  uint64_t v6 = &begin[a3];
  unint64_t v7 = (char *)((char *)end - (char *)&v6[1]);
  if (end != &v6[1]) {
    memmove(&begin[a3], &v6[1], (char *)end - (char *)&v6[1]);
  }
  self->mRangeList.__end_ = (_NSRange *)&v7[(void)v6];
}

- (void)replaceWithRange:(_NSRange)a3 atIndex:(unint64_t)a4
{
  begin = self->mRangeList.__begin_;
  unint64_t v5 = self->mRangeList.__end_ - begin;
  if (v5 <= a4)
  {
    uint64_t v6 = +[NSString stringWithFormat:@"Getting object at %lu from an array with size %lu", a3.length, a4, v5];
    id v7 = +[NSException exceptionWithName:@"IndexOutOfBound" reason:v6 userInfo:0];

    objc_exception_throw(v7);
  }
  begin[a4] = a3;
}

- (void)reverse
{
  begin = self->mRangeList.__begin_;
  end = self->mRangeList.__end_;
  _NSRange v4 = end - 1;
  if (begin != end && v4 > begin)
  {
    uint64_t v6 = begin + 1;
    do
    {
      _NSRange v7 = v6[-1];
      v6[-1] = *v4;
      *v4-- = v7;
    }
    while (v6++ < v4);
  }
}

- (_NSRange)rangeAtIndex:(unint64_t)a3
{
  begin = self->mRangeList.__begin_;
  unint64_t v4 = self->mRangeList.__end_ - begin;
  if (v4 <= a3)
  {
    unint64_t v8 = +[NSString stringWithFormat:@"Getting object at %lu from an array with size %lu", a3, v4];
    id v9 = +[NSException exceptionWithName:@"IndexOutOfBound" reason:v8 userInfo:0];

    objc_exception_throw(v9);
  }
  p_NSUInteger location = &begin[a3].location;
  NSUInteger v6 = *p_location;
  NSUInteger v7 = p_location[1];
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (void)consolidate
{
}

- (id)stringValue
{
  return +[CRLRangeList stringValueForRangeVector:&self->mRangeList];
}

+ (id)stringValueForRangeVector:(const void *)a3
{
  unint64_t v4 = +[NSMutableString stringWithString:@"["];
  uint64_t v5 = *(void *)a3;
  if (*((void *)a3 + 1) != *(void *)a3)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      if (v7)
      {
        [v4 appendString:@","];
        uint64_t v5 = *(void *)a3;
      }
      unint64_t v8 = NSStringFromRange(*(NSRange *)(v5 + v6));
      [v4 appendString:v8];

      ++v7;
      uint64_t v5 = *(void *)a3;
      v6 += 16;
    }
    while (v7 < (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4);
  }
  [v4 appendString:@"]"];

  return v4;
}

- (void).cxx_destruct
{
  begin = self->mRangeList.__begin_;
  if (begin)
  {
    self->mRangeList.__end_ = begin;
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