@interface CRLWPRangeArray
+ (CRLWPRangeArray)rangeArrayWithRange:(_NSRange)a3;
+ (id)rangeArray;
- (BOOL)containsCharacterAtIndex:(unint64_t)a3;
- (BOOL)containsCharacterAtIndex:(unint64_t)a3 inclusive:(BOOL)a4;
- (BOOL)containsRange:(_NSRange)a3;
- (BOOL)intersectsRange:(_NSRange)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRangeArray:(id)a3;
- (CRLWPRangeArray)init;
- (CRLWPRangeArray)initWithRange:(_NSRange)a3;
- (CRLWPRangeArray)initWithRangeVector:(const void *)a3;
- (_NSRange)rangeAtIndex:(unint64_t)a3;
- (_NSRange)rangeContainingPosition:(unint64_t)a3;
- (_NSRange)superRange;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)intersection:(_NSRange)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)rangesIntersecting:(_NSRange)a3;
- (unint64_t)hash;
- (unint64_t)indexCount;
- (unint64_t)indexForRange:(_NSRange)a3;
- (unint64_t)p_finish;
- (unint64_t)p_start;
- (unint64_t)rangeCount;
- (void)enumerateRanges:(id)a3;
- (void)enumerateRangesInRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)reverseEnumerateRanges:(id)a3;
@end

@implementation CRLWPRangeArray

+ (id)rangeArray
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

+ (CRLWPRangeArray)rangeArrayWithRange:(_NSRange)a3
{
  id v3 = [objc_alloc((Class)objc_opt_class()) initWithRange:a3.location, a3.length];

  return (CRLWPRangeArray *)v3;
}

- (CRLWPRangeArray)init
{
  v3.receiver = self;
  v3.super_class = (Class)CRLWPRangeArray;
  return [(CRLWPRangeArray *)&v3 init];
}

- (CRLWPRangeArray)initWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v5 = [(CRLWPRangeArray *)self init];
  v6 = v5;
  if (v5)
  {
    value = v5->_rangeVector.__end_cap_.__value_;
    end = v5->_rangeVector.__end_;
    if (end >= value)
    {
      p_begin = (void **)&v5->_rangeVector.__begin_;
      begin = v5->_rangeVector.__begin_;
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
        v16 = (char *)sub_10001EAB0((uint64_t)&v6->_rangeVector.__end_cap_, v15);
        begin = v6->_rangeVector.__begin_;
        end = v6->_rangeVector.__end_;
      }
      else
      {
        v16 = 0;
      }
      v17 = (NSUInteger *)&v16[16 * v12];
      v18 = (_NSRange *)&v16[16 * v15];
      NSUInteger *v17 = location;
      v17[1] = length;
      v9 = (_NSRange *)(v17 + 2);
      if (end != begin)
      {
        do
        {
          *((_NSRange *)v17 - 1) = end[-1];
          v17 -= 2;
          --end;
        }
        while (end != begin);
        begin = (_NSRange *)*p_begin;
      }
      v6->_rangeVector.__begin_ = (_NSRange *)v17;
      v6->_rangeVector.__end_ = v9;
      v6->_rangeVector.__end_cap_.__value_ = v18;
      if (begin) {
        operator delete(begin);
      }
    }
    else
    {
      end->NSUInteger location = location;
      end->NSUInteger length = length;
      v9 = end + 1;
    }
    v6->_rangeVector.__end_ = v9;
  }
  return v6;
}

- (CRLWPRangeArray)initWithRangeVector:(const void *)a3
{
  v4 = [(CRLWPRangeArray *)self init];
  v5 = v4;
  if (v4)
  {
    p_rangeVector = (char *)&v4->_rangeVector;
    if (&v5->_rangeVector != a3) {
      sub_10001EAE8(p_rangeVector, *(char **)a3, *((void *)a3 + 1), (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4);
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CRLWPRangeArray alloc];

  return [(CRLWPRangeArray *)v4 initWithRangeVector:&self->_rangeVector];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [CRLWPMutableRangeArray alloc];

  return [(CRLWPRangeArray *)v4 initWithRangeVector:&self->_rangeVector];
}

- (BOOL)isEqualToRangeArray:(id)a3
{
  v4 = a3;
  if (v4
    && (begin = self->_rangeVector.__begin_,
        end = self->_rangeVector.__end_,
        v7 = (int64x2_t *)v4[1],
        (char *)end - (char *)begin == v4[2] - (void)v7))
  {
    if (end == begin)
    {
      char v14 = 1;
    }
    else
    {
      unint64_t v8 = end - begin;
      if (v8 <= 1) {
        unint64_t v8 = 1;
      }
      unint64_t v9 = v8 - 1;
      do
      {
        int64x2_t v10 = *(int64x2_t *)begin++;
        int64x2_t v11 = v10;
        int64x2_t v12 = *v7++;
        int32x2_t v13 = vmovn_s64(vceqq_s64(v11, v12));
        char v14 = v13.i8[0] & v13.i8[4];
        BOOL v16 = v9-- != 0;
      }
      while ((v13.i8[0] & v13.i8[4] & 1) != 0 && v16);
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14 & 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CRLWPRangeArray *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    v6 = sub_1002469D0(v5, v4);
    if (v6) {
      BOOL v7 = [(CRLWPRangeArray *)self isEqualToRangeArray:v6];
    }
    else {
      BOOL v7 = 0;
    }
  }
  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = sub_1000C8048(0, 0);
  begin = self->_rangeVector.__begin_;
  if (self->_rangeVector.__end_ != begin)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      uint64_t v3 = sub_1000C8080((char *)&begin[v5], 16, v3);
      ++v6;
      begin = self->_rangeVector.__begin_;
      ++v5;
    }
    while (v6 < self->_rangeVector.__end_ - begin);
  }
  return v3;
}

- (unint64_t)rangeCount
{
  return self->_rangeVector.__end_ - self->_rangeVector.__begin_;
}

- (_NSRange)superRange
{
  unint64_t v3 = [(CRLWPRangeArray *)self p_start];
  NSUInteger v4 = [(CRLWPRangeArray *)self p_finish];
  if (v3 <= v4) {
    NSUInteger v5 = v4;
  }
  else {
    NSUInteger v5 = v3;
  }
  if (v3 < v4) {
    NSUInteger v4 = v3;
  }
  NSUInteger v6 = v5 - v4;
  result.NSUInteger length = v6;
  result.NSUInteger location = v4;
  return result;
}

- (_NSRange)rangeAtIndex:(unint64_t)a3
{
  unint64_t v3 = &self->_rangeVector.__begin_[a3];
  NSUInteger location = v3->location;
  NSUInteger length = v3->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)enumerateRanges:(id)a3
{
  NSUInteger v4 = (void (**)(id, NSUInteger, NSUInteger, uint64_t, unsigned char *))a3;
  char v9 = 0;
  uint64_t v5 = [(CRLWPRangeArray *)self rangeCount];
  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 1;
    do
    {
      v4[2](v4, self->_rangeVector.__begin_[v6].location, self->_rangeVector.__begin_[v6].length, v7 - 1, &v9);
      if (v9) {
        BOOL v8 = 0;
      }
      else {
        BOOL v8 = v7 < v5;
      }
      ++v7;
      ++v6;
    }
    while (v8);
  }
}

- (void)reverseEnumerateRanges:(id)a3
{
  NSUInteger v4 = (void (**)(id, NSUInteger, NSUInteger))a3;
  unint64_t v5 = [(CRLWPRangeArray *)self rangeCount];
  unint64_t v6 = v5;
  for (unint64_t i = v5 - 1; (i & 0x8000000000000000) == 0; unint64_t i = v9)
  {
    BOOL v8 = &self->_rangeVector.__begin_[v6--];
    unint64_t v9 = i - 1;
    v4[2](v4, v8[-1].location, v8[-1].length);
  }
}

- (void)enumerateRangesInRange:(_NSRange)a3 usingBlock:(id)a4
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100484830;
  v6[3] = &unk_1014FCFE0;
  _NSRange v9 = a3;
  id v7 = a4;
  BOOL v8 = v10;
  id v5 = v7;
  [(CRLWPRangeArray *)self enumerateRanges:v6];

  _Block_object_dispose(v10, 8);
}

- (unint64_t)indexCount
{
  begin = self->_rangeVector.__begin_;
  end = self->_rangeVector.__end_;
  if (begin == end) {
    return 0;
  }
  unint64_t result = 0;
  do
  {
    result += begin->length;
    ++begin;
  }
  while (begin != end);
  return result;
}

- (BOOL)containsCharacterAtIndex:(unint64_t)a3
{
  return [(CRLWPRangeArray *)self containsCharacterAtIndex:a3 inclusive:0];
}

- (BOOL)containsCharacterAtIndex:(unint64_t)a3 inclusive:(BOOL)a4
{
  begin = self->_rangeVector.__begin_;
  uint64_t v5 = (char *)self->_rangeVector.__end_ - (char *)begin;
  if (!v5) {
    return 0;
  }
  unint64_t v6 = v5 >> 4;
  id v7 = self->_rangeVector.__begin_;
  do
  {
    unint64_t v8 = v6 >> 1;
    _NSRange v9 = &v7[v6 >> 1];
    unint64_t location = v9->location;
    int64x2_t v10 = v9 + 1;
    v6 += ~(v6 >> 1);
    if (location > a3) {
      unint64_t v6 = v8;
    }
    else {
      id v7 = v10;
    }
  }
  while (v6);
  if (v7 == begin) {
    return 0;
  }
  unint64_t v12 = v7[-1].location;
  NSUInteger length = v7[-1].length;
  if (a3 >= v12 && a3 - v12 < length) {
    return 1;
  }
  BOOL result = 0;
  if (a4 && length + v12 == a3) {
    return 1;
  }
  return result;
}

- (BOOL)containsRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = -[CRLWPRangeArray rangeContainingPosition:](self, "rangeContainingPosition:");
  BOOL v7 = (unint64_t)v5 + v6 >= location + length;
  if ((unint64_t)v5 > location) {
    BOOL v7 = 0;
  }
  return v5 != (id)0x7FFFFFFFFFFFFFFFLL && v7;
}

- (_NSRange)rangeContainingPosition:(unint64_t)a3
{
  NSUInteger v4 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v5 = 0;
  begin = self->_rangeVector.__begin_;
  uint64_t v7 = (char *)self->_rangeVector.__end_ - (char *)begin;
  if (v7)
  {
    unint64_t v8 = v7 >> 4;
    _NSRange v9 = begin;
    do
    {
      unint64_t v10 = v8 >> 1;
      p_unint64_t location = &v9[v8 >> 1].location;
      unint64_t v13 = *p_location;
      unint64_t v12 = (_NSRange *)(p_location + 2);
      v8 += ~(v8 >> 1);
      if (v13 > a3) {
        unint64_t v8 = v10;
      }
      else {
        _NSRange v9 = v12;
      }
    }
    while (v8);
    if (v9 != begin)
    {
      unint64_t location = v9[-1].location;
      NSUInteger length = v9[-1].length;
      if (a3 >= location && a3 - location < length)
      {
        NSUInteger v4 = location;
        NSUInteger v5 = length;
      }
    }
  }
  result.NSUInteger length = v5;
  result.unint64_t location = v4;
  return result;
}

- (BOOL)intersectsRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  begin = self->_rangeVector.__begin_;
  end = self->_rangeVector.__end_;
  if (end == begin)
  {
    unint64_t v8 = self->_rangeVector.__begin_;
  }
  else
  {
    unint64_t v7 = end - begin;
    unint64_t v8 = self->_rangeVector.__begin_;
    do
    {
      unint64_t v9 = v7 >> 1;
      p_NSUInteger location = &v8[v7 >> 1].location;
      NSUInteger v12 = *p_location;
      char v11 = (_NSRange *)(p_location + 2);
      v7 += ~(v7 >> 1);
      if (a3.location < v12) {
        unint64_t v7 = v9;
      }
      else {
        unint64_t v8 = v11;
      }
    }
    while (v7);
  }
  if (v8 != end && NSIntersectionRange(a3, *v8).length) {
    return 1;
  }
  if (v8 == begin) {
    return 0;
  }
  v14.NSUInteger location = location;
  v14.NSUInteger length = length;
  return NSIntersectionRange(v14, *(v8 - 16)).length != 0;
}

- (unint64_t)indexForRange:(_NSRange)a3
{
  begin = self->_rangeVector.__begin_;
  end = self->_rangeVector.__end_;
  if (end == begin)
  {
    uint64_t v6 = self->_rangeVector.__begin_;
  }
  else
  {
    unint64_t v5 = end - begin;
    uint64_t v6 = self->_rangeVector.__begin_;
    do
    {
      unint64_t v7 = v5 >> 1;
      unint64_t v8 = &v6[v5 >> 1];
      NSUInteger location = v8->location;
      unint64_t v9 = v8 + 1;
      v5 += ~(v5 >> 1);
      if (location < a3.location) {
        uint64_t v6 = v9;
      }
      else {
        unint64_t v5 = v7;
      }
    }
    while (v5);
  }
  if (v6 == end)
  {
    uint64_t v6 = self->_rangeVector.__end_;
  }
  else if (v6->location == a3.location)
  {
    v6 += a3.length < v6->length;
  }
  return v6 - begin;
}

- (id)intersection:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v6 = objc_opt_new();
  begin = self->_rangeVector.__begin_;
  end = self->_rangeVector.__end_;
  if (begin != end)
  {
    do
    {
      NSUInteger v9 = begin->location;
      NSUInteger v10 = begin->length;
      v15.NSUInteger location = location;
      v15.NSUInteger length = length;
      v16.NSUInteger location = begin->location;
      v16.NSUInteger length = v10;
      NSRange v11 = NSIntersectionRange(v15, v16);
      if (v11.length) {
        [v6 addRange:v11.location, v11.length];
      }
      ++begin;
    }
    while (location + length >= v10 + v9 && begin != end);
  }

  return v6;
}

- (id)rangesIntersecting:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v6 = objc_opt_new();
  begin = self->_rangeVector.__begin_;
  end = self->_rangeVector.__end_;
  if (begin != end)
  {
    do
    {
      NSUInteger v9 = begin->location;
      NSUInteger v10 = begin->length;
      v14.NSUInteger location = location;
      v14.NSUInteger length = length;
      v15.NSUInteger location = begin->location;
      v15.NSUInteger length = v10;
      if (NSIntersectionRange(v14, v15).length) {
        [v6 addRange:v9, v10];
      }
      ++begin;
    }
    while (location + length >= v10 + v9 && begin != end);
  }

  return v6;
}

- (unint64_t)p_start
{
  unint64_t result = [(CRLWPRangeArray *)self rangeCount];
  if (result) {
    return self->_rangeVector.__begin_->location;
  }
  return result;
}

- (unint64_t)p_finish
{
  unint64_t result = [(CRLWPRangeArray *)self rangeCount];
  if (result) {
    return self->_rangeVector.__end_[-1].length + self->_rangeVector.__end_[-1].location;
  }
  return result;
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