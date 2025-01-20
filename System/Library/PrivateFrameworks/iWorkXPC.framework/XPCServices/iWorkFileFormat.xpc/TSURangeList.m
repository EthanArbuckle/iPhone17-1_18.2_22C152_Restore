@interface TSURangeList
+ (id)stringValueForRangeVector:(const void *)a3;
- (TSURangeList)initWithRange:(_NSRange)a3;
- (TSURangeList)initWithRangeList:(id)a3;
- (TSURangeList)initWithRangeVector:(const void *)a3;
- (TSURangeList)initWithRangeVectorMove:(void *)a3;
- (TSURangeList)initWithString:(id)a3;
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

@implementation TSURangeList

- (TSURangeList)initWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v5 = [(TSURangeList *)self init];
  v6 = v5;
  if (v5)
  {
    sub_100078538((uint64_t)&v5->mRangeList, 1uLL);
    begin = v6->mRangeList.__begin_;
    begin->NSUInteger location = location;
    begin->NSUInteger length = length;
  }
  return v6;
}

- (TSURangeList)initWithRangeList:(id)a3
{
  v4 = [(TSURangeList *)self init];
  v5 = v4;
  if (v4)
  {
    p_mRangeList = &v4->mRangeList;
    sub_100078538((uint64_t)&v4->mRangeList, (unint64_t)[a3 count]);
    if ([a3 count])
    {
      uint64_t v7 = 0;
      unint64_t v8 = 0;
      do
      {
        id v9 = [a3 rangeAtIndex:v8];
        v10 = &p_mRangeList->__begin_[v7];
        v10->NSUInteger location = (NSUInteger)v9;
        v10->NSUInteger length = v11;
        ++v8;
        ++v7;
      }
      while (v8 < (unint64_t)[a3 count]);
    }
  }
  return v5;
}

- (TSURangeList)initWithString:(id)a3
{
  v4 = [(TSURangeList *)self init];
  v5 = v4;
  if (a3 && v4 && (unint64_t)[a3 length] >= 3 && objc_msgSend(a3, "length"))
  {
    unint64_t v6 = 0;
    unint64_t v7 = 0;
    p_begin = (void **)&v5->mRangeList.__begin_;
    do
    {
      unint64_t v9 = v7;
      if ([a3 characterAtIndex:v7] != 123)
      {
        if ([a3 characterAtIndex:v7] == 125)
        {
          NSRange v10 = NSRangeFromString((NSString *)objc_msgSend(a3, "substringWithRange:", v6, v7 - v6 + 1));
          end = v5->mRangeList.__end_;
          value = v5->mRangeList.__end_cap_.__value_;
          if (end >= value)
          {
            begin = (NSRange *)*p_begin;
            uint64_t v15 = ((char *)end - (unsigned char *)*p_begin) >> 4;
            unint64_t v16 = v15 + 1;
            if ((unint64_t)(v15 + 1) >> 60) {
              sub_100078F84();
            }
            uint64_t v17 = (char *)value - (char *)begin;
            if (v17 >> 3 > v16) {
              unint64_t v16 = v17 >> 3;
            }
            if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v18 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v18 = v16;
            }
            if (v18)
            {
              v19 = (char *)sub_10007902C((uint64_t)&v5->mRangeList.__end_cap_, v18);
              begin = v5->mRangeList.__begin_;
              end = v5->mRangeList.__end_;
            }
            else
            {
              v19 = 0;
            }
            v20 = (NSRange *)&v19[16 * v15];
            NSRange *v20 = v10;
            v21 = v20;
            if (end != begin)
            {
              do
              {
                v21[-1] = end[-1];
                --v21;
                --end;
              }
              while (end != begin);
              begin = (NSRange *)*p_begin;
            }
            v13 = v20 + 1;
            v5->mRangeList.__begin_ = v21;
            v5->mRangeList.__end_ = v20 + 1;
            v5->mRangeList.__end_cap_.__value_ = (_NSRange *)&v19[16 * v18];
            if (begin) {
              operator delete(begin);
            }
          }
          else
          {
            NSRange *end = v10;
            v13 = end + 1;
          }
          v5->mRangeList.__end_ = v13;
        }
        unint64_t v9 = v6;
      }
      ++v7;
      unint64_t v6 = v9;
    }
    while (v7 < (unint64_t)[a3 length]);
  }
  return v5;
}

- (TSURangeList)initWithRangeVector:(const void *)a3
{
  v4 = [(TSURangeList *)self init];
  v5 = v4;
  if (v4)
  {
    p_mRangeList = (char *)&v4->mRangeList;
    if (&v5->mRangeList != a3) {
      sub_100079098(p_mRangeList, *(char **)a3, *((void *)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4);
    }
  }
  return v5;
}

- (TSURangeList)initWithRangeVectorMove:(void *)a3
{
  v4 = [(TSURangeList *)self init];
  v5 = v4;
  if (v4)
  {
    p_mRangeList = (char *)&v4->mRangeList;
    if (&v5->mRangeList != a3) {
      sub_100079098(p_mRangeList, *(char **)a3, *((void *)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4);
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
      sub_100078F84();
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
      unint64_t v16 = (char *)sub_10007902C((uint64_t)p_end_cap, v15);
      begin = self->mRangeList.__begin_;
      end = self->mRangeList.__end_;
    }
    else
    {
      unint64_t v16 = 0;
    }
    uint64_t v17 = (_NSRange *)&v16[16 * v12];
    unint64_t v18 = (_NSRange *)&v16[16 * v15];
    v17->NSUInteger location = location;
    v17->NSUInteger length = length;
    unint64_t v9 = v17 + 1;
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
    unint64_t v9 = end + 1;
  }
  self->mRangeList.__end_ = v9;
}

- (void)insertRange:(_NSRange)a3 atIndex:(unint64_t)a4
{
  _NSRange v4 = a3;
  sub_100078994((uint64_t)&self->mRangeList, (char *)&self->mRangeList.__begin_[a4], (char *)&v4);
}

- (void)removeRangeAtIndex:(unint64_t)a3
{
  begin = self->mRangeList.__begin_;
  end = self->mRangeList.__end_;
  unint64_t v6 = &begin[a3];
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
  if (v5 <= a4) {
    objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", @"IndexOutOfBound", +[NSString stringWithFormat:@"Getting object at %lu from an array with size %lu", a3.length, a4, v5], 0));
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
    unint64_t v6 = begin + 1;
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
  if (v4 <= a3) {
    objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", @"IndexOutOfBound", +[NSString stringWithFormat:@"Getting object at %lu from an array with size %lu", a3, v4], 0));
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
  return +[TSURangeList stringValueForRangeVector:&self->mRangeList];
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
        [(NSMutableString *)v4 appendString:@","];
        uint64_t v5 = *(void *)a3;
      }
      [(NSMutableString *)v4 appendString:NSStringFromRange(*(NSRange *)(v5 + v6))];
      ++v7;
      uint64_t v5 = *(void *)a3;
      v6 += 16;
    }
    while (v7 < (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4);
  }
  [(NSMutableString *)v4 appendString:@"]"];
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