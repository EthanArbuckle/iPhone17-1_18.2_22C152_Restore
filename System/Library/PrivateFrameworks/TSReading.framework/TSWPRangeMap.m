@interface TSWPRangeMap
- (TSWPRangeMap)initWithSubRange:(_NSRange)a3 unmappedIndexes:(const void *)a4 affinity:(int)a5;
- (TSWPRangeMap)initWithSubRange:(_NSRange)a3 unmappedPairIndexes:(const void *)a4;
- (_NSRange)mappedCharRange:(_NSRange)a3;
- (_NSRange)unmappedCharRange:(_NSRange)a3;
- (id).cxx_construct;
- (unint64_t)mappedCharIndex:(unint64_t)a3;
- (unint64_t)p_extendLeftMappedIndex:(unint64_t)a3;
- (unint64_t)p_extendRightMappedIndex:(unint64_t)a3;
- (unint64_t)unmappedCharIndex:(unint64_t)a3;
- (void)adjustByDelta:(int64_t)a3;
@end

@implementation TSWPRangeMap

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  return self;
}

- (_NSRange)mappedCharRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSRange subRange = self->_subRange;
  v12.NSUInteger location = location;
  v12.NSUInteger length = length;
  if (NSIntersectionRange(v12, subRange).length)
  {
    if (location <= self->_subRange.location) {
      NSUInteger v6 = self->_subRange.location;
    }
    else {
      NSUInteger v6 = location;
    }
    NSUInteger v7 = [(TSWPRangeMap *)self p_extendLeftMappedIndex:[(TSWPRangeMap *)self mappedCharIndex:v6]];
    NSUInteger v8 = location + length;
    NSUInteger v9 = self->_subRange.length;
    if (v9 + self->_subRange.location < location + length) {
      NSUInteger v8 = v9 + self->_subRange.location;
    }
    NSUInteger v10 = [(TSWPRangeMap *)self p_extendRightMappedIndex:[(TSWPRangeMap *)self mappedCharIndex:v8 - 1]]- v7+ 1;
  }
  else if (location >= self->_subRange.location)
  {
    NSUInteger v10 = 0;
    NSUInteger v7 = self->_subRange.length + ((self->_mappedIndexes.__end_ - self->_mappedIndexes.__begin_) >> 4);
  }
  else
  {
    NSUInteger v7 = 0;
    NSUInteger v10 = 0;
  }
  NSUInteger v11 = v7;
  result.NSUInteger length = v10;
  result.NSUInteger location = v11;
  return result;
}

- (unint64_t)mappedCharIndex:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPRangeMap mappedCharIndex:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRangeMap.mm"), 102, @"shouldn't be trying to map NSNotFound");
  }
  NSUInteger v7 = a3 - self->_subRange.location;
  if (v7 > self->_subRange.length) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  begin = self->_unmappedIndexes.__begin_;
  end = self->_unmappedIndexes.__end_;
  if (end != begin)
  {
    unint64_t v11 = (end - begin) >> 4;
    end = self->_unmappedIndexes.__begin_;
    do
    {
      unint64_t v12 = v11 >> 1;
      v13 = (unint64_t *)((char *)end + 16 * (v11 >> 1));
      unint64_t v15 = *v13;
      v14 = (_TSWPCharIndexAndAffinity *)(v13 + 2);
      v11 += ~(v11 >> 1);
      if (v15 > a3) {
        unint64_t v11 = v12;
      }
      else {
        end = v14;
      }
    }
    while (v11);
  }
  return v7 + ((end - begin) >> 4);
}

- (unint64_t)p_extendRightMappedIndex:(unint64_t)a3
{
  begin = self->_mappedIndexes.__begin_;
  end = self->_mappedIndexes.__end_;
  unint64_t v5 = a3 + 1;
  if (end != begin)
  {
    unint64_t v6 = (end - begin) >> 4;
    do
    {
      unint64_t v7 = v6 >> 1;
      NSUInteger v8 = (void *)((char *)begin + 16 * (v6 >> 1));
      unint64_t v10 = *v8;
      NSUInteger v9 = (_TSWPCharIndexAndAffinity *)(v8 + 2);
      v6 += ~(v6 >> 1);
      if (v10 < v5) {
        begin = v9;
      }
      else {
        unint64_t v6 = v7;
      }
    }
    while (v6);
  }
  if (begin != end && *(void *)begin == v5 && *((_DWORD *)begin + 2) == 1) {
    ++a3;
  }
  return a3;
}

- (unint64_t)p_extendLeftMappedIndex:(unint64_t)a3
{
  if (a3)
  {
    begin = self->_mappedIndexes.__begin_;
    end = self->_mappedIndexes.__end_;
    unint64_t v5 = a3 - 1;
    if (end != begin)
    {
      unint64_t v6 = (end - begin) >> 4;
      do
      {
        unint64_t v7 = v6 >> 1;
        NSUInteger v8 = (void *)((char *)begin + 16 * (v6 >> 1));
        unint64_t v10 = *v8;
        NSUInteger v9 = (_TSWPCharIndexAndAffinity *)(v8 + 2);
        v6 += ~(v6 >> 1);
        if (v10 < v5) {
          begin = v9;
        }
        else {
          unint64_t v6 = v7;
        }
      }
      while (v6);
    }
    if (begin != end && *(void *)begin == v5 && *((_DWORD *)begin + 2) == 2) {
      --a3;
    }
  }
  return a3;
}

- (_NSRange)unmappedCharRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v6 = -[TSWPRangeMap unmappedCharIndex:](self, "unmappedCharIndex:");
  NSUInteger v7 = v6;
  if (length) {
    unint64_t v8 = [(TSWPRangeMap *)self unmappedCharIndex:length + location - 1] + 1;
  }
  else {
    unint64_t v8 = v6;
  }
  if (v7 <= v8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v7;
  }
  if (v7 >= v8) {
    NSUInteger v10 = v8;
  }
  else {
    NSUInteger v10 = v7;
  }
  NSUInteger v11 = v9 - v10;
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

- (unint64_t)unmappedCharIndex:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPRangeMap unmappedCharIndex:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRangeMap.mm"), 121, @"shouldn't be trying to map NSNotFound");
  }
  begin = self->_mappedIndexes.__begin_;
  end = self->_mappedIndexes.__end_;
  if (end == begin)
  {
    NSUInteger v10 = self->_mappedIndexes.__end_;
  }
  else
  {
    unint64_t v9 = (end - begin) >> 4;
    NSUInteger v10 = self->_mappedIndexes.__begin_;
    do
    {
      unint64_t v11 = v9 >> 1;
      unint64_t v12 = (void *)((char *)v10 + 16 * (v9 >> 1));
      unint64_t v14 = *v12;
      v13 = (_TSWPCharIndexAndAffinity *)(v12 + 2);
      v9 += ~(v9 >> 1);
      if (v14 < v3) {
        NSUInteger v10 = v13;
      }
      else {
        unint64_t v9 = v11;
      }
    }
    while (v9);
  }
  if (end == v10 || *(void *)v10 != v3) {
    return v3 - ((v10 - begin) >> 4) + self->_subRange.location;
  }
  int v15 = *((_DWORD *)v10 + 2);
  if (v15 == 2)
  {
    ++v3;
  }
  else if (v15 == 1)
  {
    --v3;
  }
  else
  {
    v17 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v18 = [NSString stringWithUTF8String:"-[TSWPRangeMap unmappedCharIndex:]"];
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRangeMap.mm"), 140, @"bad affinity");
  }

  return [(TSWPRangeMap *)self unmappedCharIndex:v3];
}

- (void).cxx_destruct
{
  begin = self->_mappedIndexes.__begin_;
  if (begin)
  {
    self->_mappedIndexes.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_unmappedIndexes.__begin_;
  if (v4)
  {
    self->_unmappedIndexes.__end_ = v4;
    operator delete(v4);
  }
}

- (TSWPRangeMap)initWithSubRange:(_NSRange)a3 unmappedPairIndexes:(const void *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v7 = -[TSWPRangeMap initWithSubRange:unmappedIndexes:affinity:](self, "initWithSubRange:unmappedIndexes:affinity:", a3.location, a3.length, a4, 0);
  unint64_t v8 = v7;
  if (v7)
  {
    v7->_subRange.NSUInteger location = location;
    v7->_subRange.NSUInteger length = length;
    uint64_t v9 = *((void *)a4 + 1) - *(void *)a4;
    uint64_t v10 = v9 >> 3;
    if ((v9 & 8) != 0)
    {
      unint64_t v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"-[TSWPRangeMap initWithSubRange:unmappedPairIndexes:]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRangeMap.mm"), 43, @"expected an even number of indexes");
    }
    begin = v8->_unmappedIndexes.__begin_;
    end = v8->_unmappedIndexes.__end_;
    if (v10 != (end - begin) >> 4 || v10 != (v8->_mappedIndexes.__end_ - v8->_mappedIndexes.__begin_) >> 4)
    {
      int v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v16 = [NSString stringWithUTF8String:"-[TSWPRangeMap initWithSubRange:unmappedPairIndexes:]"];
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRangeMap.mm"), 45, @"index vector size is wrong");
      begin = v8->_unmappedIndexes.__begin_;
      end = v8->_unmappedIndexes.__end_;
    }
    if (end != begin)
    {
      uint64_t v17 = 0;
      unint64_t v18 = 0;
      do
      {
        unint64_t v19 = *(void *)(*(void *)a4 + 8 * v18);
        NSUInteger v20 = v8->_subRange.location;
        NSUInteger v21 = v8->_subRange.length;
        BOOL v22 = v19 - v20 < v21 && v19 >= v20;
        NSUInteger v23 = v21 + v20;
        if (!v22 && v19 != v23)
        {
          v25 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v26 = [NSString stringWithUTF8String:"-[TSWPRangeMap initWithSubRange:unmappedPairIndexes:]"];
          objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRangeMap.mm"), 50, @"index is out of bounds");
          begin = v8->_unmappedIndexes.__begin_;
          end = v8->_unmappedIndexes.__end_;
        }
        v27 = (char *)begin + v17;
        *((_DWORD *)v27 + 2) = 2;
        *((_DWORD *)v27 + 6) = 1;
        v28 = (char *)v8->_mappedIndexes.__begin_ + v17;
        *((_DWORD *)v28 + 2) = 2;
        *((_DWORD *)v28 + 6) = 1;
        v18 += 2;
        v17 += 32;
      }
      while (v18 < (end - begin) >> 4);
    }
  }
  return v8;
}

- (TSWPRangeMap)initWithSubRange:(_NSRange)a3 unmappedIndexes:(const void *)a4 affinity:(int)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v52.receiver = self;
  v52.super_class = (Class)TSWPRangeMap;
  uint64_t v9 = [(TSWPRangeMap *)&v52 init];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_subRange.NSUInteger location = location;
    v9->_subRange.NSUInteger length = length;
    uint64_t v12 = *(void *)a4;
    uint64_t v11 = *((void *)a4 + 1);
    unint64_t v13 = (v11 - *(void *)a4) >> 3;
    p_unmappedIndexes = &v9->_unmappedIndexes;
    std::vector<_TSWPCharIndexAndAffinity>::reserve((void **)&v9->_unmappedIndexes.__begin_, v13);
    p_mappedIndexes = &v10->_mappedIndexes;
    std::vector<_TSWPCharIndexAndAffinity>::reserve((void **)&v10->_mappedIndexes.__begin_, v13);
    if (v11 != v12)
    {
      uint64_t v15 = 0;
      if (v13 <= 1) {
        uint64_t v16 = 1;
      }
      else {
        uint64_t v16 = v13;
      }
      do
      {
        unint64_t v17 = *(void *)(*(void *)a4 + 8 * v15);
        NSUInteger v18 = v10->_subRange.location;
        NSUInteger v19 = v10->_subRange.length;
        BOOL v20 = v17 - v18 < v19 && v17 >= v18;
        NSUInteger v21 = v19 + v18;
        if (!v20 && v17 != v21)
        {
          NSUInteger v23 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v24 = [NSString stringWithUTF8String:"-[TSWPRangeMap initWithSubRange:unmappedIndexes:affinity:]"];
          objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRangeMap.mm"), 81, @"index is out of bounds");
        }
        end = v10->_unmappedIndexes.__end_;
        value = v10->_unmappedIndexes.__end_cap_.__value_;
        if (end >= value)
        {
          uint64_t v28 = (end - p_unmappedIndexes->__begin_) >> 4;
          unint64_t v29 = v28 + 1;
          if ((unint64_t)(v28 + 1) >> 60) {
            goto LABEL_48;
          }
          uint64_t v30 = value - p_unmappedIndexes->__begin_;
          if (v30 >> 3 > v29) {
            unint64_t v29 = v30 >> 3;
          }
          if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v31 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v31 = v29;
          }
          if (v31) {
            v32 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)&v10->_unmappedIndexes.__end_cap_, v31);
          }
          else {
            v32 = 0;
          }
          v33 = &v32[16 * v28];
          *(void *)v33 = v17;
          *((_DWORD *)v33 + 2) = a5;
          *((_DWORD *)v33 + 3) = 0;
          begin = v10->_unmappedIndexes.__begin_;
          v34 = v10->_unmappedIndexes.__end_;
          v36 = (_TSWPCharIndexAndAffinity *)v33;
          if (v34 != begin)
          {
            do
            {
              *((_OWORD *)v36 - 1) = *((_OWORD *)v34 - 1);
              v36 = (_TSWPCharIndexAndAffinity *)((char *)v36 - 16);
              v34 = (_TSWPCharIndexAndAffinity *)((char *)v34 - 16);
            }
            while (v34 != begin);
            v34 = p_unmappedIndexes->__begin_;
          }
          v27 = (_TSWPCharIndexAndAffinity *)(v33 + 16);
          v10->_unmappedIndexes.__begin_ = v36;
          v10->_unmappedIndexes.__end_ = (_TSWPCharIndexAndAffinity *)(v33 + 16);
          v10->_unmappedIndexes.__end_cap_.__value_ = (_TSWPCharIndexAndAffinity *)&v32[16 * v31];
          if (v34) {
            operator delete(v34);
          }
        }
        else
        {
          *(void *)end = v17;
          v27 = (_TSWPCharIndexAndAffinity *)((char *)end + 16);
          *((_DWORD *)end + 2) = a5;
          *((_DWORD *)end + 3) = 0;
        }
        v10->_unmappedIndexes.__end_ = v27;
        NSUInteger v37 = v17 - v10->_subRange.location + v15;
        v38 = v10->_mappedIndexes.__end_;
        v39 = v10->_mappedIndexes.__end_cap_.__value_;
        if (v38 >= v39)
        {
          uint64_t v41 = (v38 - p_mappedIndexes->__begin_) >> 4;
          unint64_t v42 = v41 + 1;
          if ((unint64_t)(v41 + 1) >> 60) {
LABEL_48:
          }
            abort();
          uint64_t v43 = v39 - p_mappedIndexes->__begin_;
          if (v43 >> 3 > v42) {
            unint64_t v42 = v43 >> 3;
          }
          if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v44 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v44 = v42;
          }
          if (v44) {
            v45 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)&v10->_mappedIndexes.__end_cap_, v44);
          }
          else {
            v45 = 0;
          }
          v46 = &v45[16 * v41];
          *(void *)v46 = v37;
          *((_DWORD *)v46 + 2) = a5;
          *((_DWORD *)v46 + 3) = 0;
          v48 = v10->_mappedIndexes.__begin_;
          v47 = v10->_mappedIndexes.__end_;
          v49 = (_TSWPCharIndexAndAffinity *)v46;
          if (v47 != v48)
          {
            do
            {
              *((_OWORD *)v49 - 1) = *((_OWORD *)v47 - 1);
              v49 = (_TSWPCharIndexAndAffinity *)((char *)v49 - 16);
              v47 = (_TSWPCharIndexAndAffinity *)((char *)v47 - 16);
            }
            while (v47 != v48);
            v47 = p_mappedIndexes->__begin_;
          }
          v40 = (_TSWPCharIndexAndAffinity *)(v46 + 16);
          v10->_mappedIndexes.__begin_ = v49;
          v10->_mappedIndexes.__end_ = (_TSWPCharIndexAndAffinity *)(v46 + 16);
          v10->_mappedIndexes.__end_cap_.__value_ = (_TSWPCharIndexAndAffinity *)&v45[16 * v44];
          if (v47) {
            operator delete(v47);
          }
        }
        else
        {
          *(void *)v38 = v37;
          v40 = (_TSWPCharIndexAndAffinity *)((char *)v38 + 16);
          *((_DWORD *)v38 + 2) = a5;
          *((_DWORD *)v38 + 3) = 0;
        }
        v10->_mappedIndexes.__end_ = v40;
        ++v15;
      }
      while (v15 != v16);
    }
  }
  return v10;
}

- (void)adjustByDelta:(int64_t)a3
{
  self->_subRange.location += a3;
  begin = self->_unmappedIndexes.__begin_;
  end = self->_unmappedIndexes.__end_;
  while (begin != end)
  {
    *(void *)begin += a3;
    begin = (_TSWPCharIndexAndAffinity *)((char *)begin + 16);
  }
}

@end