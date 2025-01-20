@interface OITSURangeList
- (OITSURangeList)initWithRange:(_NSRange)a3;
- (OITSURangeList)initWithRangeList:(id)a3;
- (OITSURangeList)initWithString:(id)a3;
- (_NSRange)rangeAtIndex:(unint64_t)a3;
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

@implementation OITSURangeList

- (OITSURangeList)initWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v5 = [(OITSURangeList *)self init];
  v6 = v5;
  if (v5)
  {
    std::vector<_NSRange>::resize((uint64_t)&v5->mRangeList, 1uLL);
    begin = v6->mRangeList.__begin_;
    begin->NSUInteger location = location;
    begin->NSUInteger length = length;
  }
  return v6;
}

- (OITSURangeList)initWithRangeList:(id)a3
{
  v4 = [(OITSURangeList *)self init];
  v5 = v4;
  if (v4)
  {
    p_mRangeList = &v4->mRangeList;
    std::vector<_NSRange>::resize((uint64_t)&v4->mRangeList, [a3 count]);
    if ([a3 count])
    {
      uint64_t v7 = 0;
      unint64_t v8 = 0;
      do
      {
        uint64_t v9 = [a3 rangeAtIndex:v8];
        v10 = (uint64_t *)&p_mRangeList->__begin_[v7];
        uint64_t *v10 = v9;
        v10[1] = v11;
        ++v8;
        ++v7;
      }
      while (v8 < [a3 count]);
    }
  }
  return v5;
}

- (OITSURangeList)initWithString:(id)a3
{
  v4 = [(OITSURangeList *)self init];
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
              std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
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
              v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<TSUStringChunk>>>((uint64_t)&v5->mRangeList.__end_cap_, v18);
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
    while (v7 < [a3 length]);
  }
  return v5;
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
      std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
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
      unint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<TSUStringChunk>>>((uint64_t)p_end_cap, v15);
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
  std::vector<_NSRange>::insert((uint64_t)&self->mRangeList, (char *)&self->mRangeList.__begin_[a4], (char *)&v4);
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
    objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:@"IndexOutOfBound", objc_msgSend(NSString, "stringWithFormat:", @"Getting object at %lu from an array with size %lu", a3.length, a4, v5), 0 reason userInfo]);
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
    objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:@"IndexOutOfBound", objc_msgSend(NSString, "stringWithFormat:", @"Getting object at %lu from an array with size %lu", a3, v4), 0 reason userInfo]);
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
  p_mRangeList = &self->mRangeList;
  begin = (char *)self->mRangeList.__begin_;
  end = (char *)p_mRangeList->__end_;
  if ((unint64_t)(end - begin) < 0x11) {
    return;
  }
  v25 = p_sortFunction;
  unint64_t v6 = 126 - 2 * __clz((end - begin) >> 4);
  if (end == begin) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v6;
  }
  std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(_NSRange,_NSRange),_NSRange*,false>(begin, end, (uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))&v25, v7, 1);
  unint64_t v9 = self->mRangeList.__begin_;
  unint64_t v8 = self->mRangeList.__end_;
  BOOL v10 = v8 != v9;
  unint64_t v11 = 0;
  if ((unint64_t)((char *)v8 - (char *)v9) >= 0x11 && v8 != v9)
  {
    unint64_t v13 = v8 - v9;
    NSUInteger location = v9->location;
    unint64_t v15 = 1;
    while (2)
    {
      if (v13 <= v15 + 1) {
        uint64_t v16 = v15 + 1;
      }
      else {
        uint64_t v16 = v8 - v9;
      }
      p_NSUInteger length = &v9[v15].length;
      while (1)
      {
        NSUInteger v18 = *(p_length - 1);
        if (location != v18) {
          break;
        }
        ++v15;
        p_length += 2;
        if (v16 == v15)
        {
          if (v11 >= v13) {
            return;
          }
          goto LABEL_28;
        }
      }
      v19 = &v9[v11];
      NSUInteger v21 = v19->location;
      NSUInteger length = v19->length;
      NSUInteger v22 = *p_length;
      if (length + v21 >= v18)
      {
        NSUInteger v23 = v22 + v18;
        if (length + v21 >= v23)
        {
LABEL_24:
          ++v15;
          BOOL v10 = v11 < v13;
          if (v15 < v13)
          {
            NSUInteger location = v18;
            if (v11 < v13) {
              continue;
            }
          }
          goto LABEL_10;
        }
        NSUInteger v22 = v23 - v21;
      }
      else
      {
        v9[++v11].NSUInteger location = v18;
      }
      break;
    }
    v9[v11].NSUInteger length = v22;
    goto LABEL_24;
  }
LABEL_10:
  if (v10)
  {
LABEL_28:
    v24 = &v9[v11 + 1];
    if (v24 != v8) {
      self->mRangeList.__end_ = v24;
    }
  }
}

- (id)stringValue
{
  v3 = (void *)[MEMORY[0x263F089D8] stringWithString:@"["];
  if ([(OITSURangeList *)self count])
  {
    uint64_t v4 = 0;
    unsigned int v5 = 1;
    do
    {
      if (v5 != 1) {
        [v3 appendString:@","];
      }
      v8.NSUInteger location = [(OITSURangeList *)self rangeAtIndex:v4];
      [v3 appendString:NSStringFromRange(v8)];
      uint64_t v4 = v5;
    }
    while ([(OITSURangeList *)self count] > v5++);
  }
  [v3 appendString:@"]"];
  return v3;
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