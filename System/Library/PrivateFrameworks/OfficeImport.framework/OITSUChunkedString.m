@interface OITSUChunkedString
- (OITSUChunkedString)init;
- (OITSUChunkedString)initWithChunkLength:(unint64_t)a3;
- (id).cxx_construct;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)appendString:(id)a3;
- (void)compact;
- (void)dealloc;
- (void)deleteCharactersInRange:(_NSRange)a3;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
- (void)insertString:(id)a3 atIndex:(unint64_t)a4;
- (void)p_appendRange:(_NSRange)a3 fromString:(id)a4;
- (void)p_compactChunksInRange:(_NSRange)a3;
- (void)p_deleteCharactersInRange:(_NSRange)a3 chunkIndex:(unint64_t)a4;
- (void)p_insertCharactersInRange:(_NSRange)a3 fromString:(id)a4 atIndex:(unint64_t)a5 chunkIndex:(unint64_t)a6;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
@end

@implementation OITSUChunkedString

- (OITSUChunkedString)initWithChunkLength:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OITSUChunkedString;
  result = [(OITSUChunkedString *)&v5 init];
  if (result) {
    result->_chunkLength = a3;
  }
  return result;
}

- (OITSUChunkedString)init
{
  return [(OITSUChunkedString *)self initWithChunkLength:0x4000];
}

- (void)dealloc
{
  std::vector<std::shared_ptr<TSUStringChunk>>::__clear[abi:ne180100]((uint64_t *)&self->_chunks);
  v3.receiver = self;
  v3.super_class = (Class)OITSUChunkedString;
  [(OITSUChunkedString *)&v3 dealloc];
}

- (unint64_t)length
{
  return self->_length;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  if (self->_length <= a3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF578] format:@"character index out of bounds"];
  }
  p_chunks = &self->_chunks;
  uint64_t v6 = p_chunkIndexForCharacterIndex(a3, p_chunks);
  return *(_WORD *)(*((void *)p_chunks->__begin_ + 2 * v6) + 2 * (a3 - **((void **)p_chunks->__begin_ + 2 * v6)) + 24);
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a4.location + a4.length > self->_length) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF578] format:@"range out of bounds"];
  }
  p_chunks = &self->_chunks;
  uint64_t v9 = p_chunkIndexForCharacterIndex(location, p_chunks);
  if (length)
  {
    uint64_t v10 = 16 * v9;
    do
    {
      v11 = *(void **)((char *)p_chunks->__begin_ + v10);
      NSUInteger v12 = location - *v11;
      if (length >= v11[2] - v12) {
        NSUInteger v13 = v11[2] - v12;
      }
      else {
        NSUInteger v13 = length;
      }
      memmove(a3, (char *)v11 + 2 * v12 + 24, 2 * v13);
      a3 += v13;
      location += v13;
      v10 += 16;
      length -= v13;
    }
    while (length);
  }
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.location + a3.length > self->_length) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF578] format:@"range out of bounds"];
  }
  uint64_t v18 = [a4 length];
  unint64_t v8 = [a4 length];
  NSUInteger v20 = length;
  if (v8 >= length) {
    NSUInteger v9 = length;
  }
  else {
    NSUInteger v9 = v8;
  }
  p_chunks = &self->_chunks;
  uint64_t v11 = p_chunkIndexForCharacterIndex(location, &self->_chunks.__begin_);
  NSUInteger v19 = v9;
  if (v9)
  {
    NSUInteger v12 = location;
    while (1)
    {
      begin = p_chunks->__begin_;
      v14 = (NSUInteger *)*((void *)p_chunks->__begin_ + 2 * v11);
      NSUInteger v15 = *v14;
      v22.NSUInteger length = v14[2];
      v22.NSUInteger location = *v14;
      v23.NSUInteger location = v12;
      v23.NSUInteger length = v9;
      NSRange v16 = NSIntersectionRange(v22, v23);
      objc_msgSend(a4, "getCharacters:range:", begin[2 * v11] + 2 * (v16.location - v15) + 24, v12 - location, v16.length);
      v12 += v16.length;
      v9 -= v16.length;
      if (!v9) {
        break;
      }
      ++v11;
    }
  }
  if ((uint64_t)(v18 - v20) < 1)
  {
    if (((v18 - v20) & 0x8000000000000000) != 0)
    {
      -[OITSUChunkedString p_deleteCharactersInRange:chunkIndex:](self, "p_deleteCharactersInRange:chunkIndex:", v19 + location, v20 - v19, v11);
    }
  }
  else
  {
    NSUInteger v17 = v18 - v19;
    if (v19 + location == self->_length)
    {
      -[OITSUChunkedString p_appendRange:fromString:](self, "p_appendRange:fromString:", v19, v17, a4);
    }
    else
    {
      -[OITSUChunkedString p_insertCharactersInRange:fromString:atIndex:chunkIndex:](self, "p_insertCharactersInRange:fromString:atIndex:chunkIndex:", v19, v17, a4);
    }
  }
}

- (void)insertString:(id)a3 atIndex:(unint64_t)a4
{
  if (self->_length < a4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF578] format:@"range out of bounds"];
  }
  if ([a3 length])
  {
    if (self->_length == a4)
    {
      [(OITSUChunkedString *)self appendString:a3];
    }
    else
    {
      uint64_t v7 = p_chunkIndexForCharacterIndex(a4, &self->_chunks.__begin_);
      uint64_t v8 = [a3 length];
      -[OITSUChunkedString p_insertCharactersInRange:fromString:atIndex:chunkIndex:](self, "p_insertCharactersInRange:fromString:atIndex:chunkIndex:", 0, v8, a3, a4, v7);
    }
  }
}

- (void)deleteCharactersInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.location + a3.length > self->_length) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF578] format:@"range out of bounds"];
  }
  if (length)
  {
    uint64_t v6 = p_chunkIndexForCharacterIndex(location, &self->_chunks.__begin_);
    -[OITSUChunkedString p_deleteCharactersInRange:chunkIndex:](self, "p_deleteCharactersInRange:chunkIndex:", location, length, v6);
  }
}

- (void)appendString:(id)a3
{
  uint64_t v5 = [a3 length];
  -[OITSUChunkedString p_appendRange:fromString:](self, "p_appendRange:fromString:", 0, v5, a3);
}

- (void)compact
{
}

- (void).cxx_destruct
{
  p_chunks = &self->_chunks;
  std::vector<std::shared_ptr<TSUStringChunk>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_chunks);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void)p_appendRange:(_NSRange)a3 fromString:(id)a4
{
  if (a3.length)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    p_chunks = &self->_chunks;
    do
    {
      end = p_chunks->__end_;
      if (end == p_chunks->__begin_) {
        goto LABEL_8;
      }
      unint64_t v10 = *(end - 2);
      uint64_t v11 = *(end - 1);
      if (v11)
      {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
        *(void *)&long long v18 = v10;
        *((void *)&v18 + 1) = v11;
      }
      else
      {
        long long v18 = v10;
      }
      uint64_t v12 = *(void *)(v10 + 8);
      uint64_t v13 = *(void *)(v10 + 16);
      uint64_t v14 = v12 - v13;
      if (v12 == v13) {
LABEL_8:
      }
        operator new();
      if (v14 <= 0)
      {
        uint64_t v15 = [NSString stringWithUTF8String:"-[OITSUChunkedString(Private) p_appendRange:fromString:]"];
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUChunkedString.mm"], 330, 0, "should have allocated a chunk with available space at this point");
        +[OITSUAssertionHandler logBacktraceThrottled];
        unint64_t v10 = v18;
      }
      if (length >= v14) {
        NSUInteger v16 = v14;
      }
      else {
        NSUInteger v16 = length;
      }
      objc_msgSend(a4, "getCharacters:range:", v10 + 2 * *(void *)(v10 + 16) + 24, location, v16, v17);
      *(void *)(v18 + 16) += v16;
      self->_length += v16;
      if (*((void *)&v18 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v18 + 1));
      }
      location += v16;
      length -= v16;
    }
    while (length);
  }
}

- (void)p_insertCharactersInRange:(_NSRange)a3 fromString:(id)a4 atIndex:(unint64_t)a5 chunkIndex:(unint64_t)a6
{
  unint64_t v6 = a6;
  NSUInteger location = a3.location;
  NSUInteger length = a3.length;
  NSUInteger v9 = self;
  p_chunks = &self->_chunks;
  begin = self->_chunks.__begin_;
  if (self->_chunks.__end_ == begin) {
    operator new();
  }
  long long v12 = begin[a6];
  uint64_t v13 = *((void *)&begin[a6] + 1);
  if (v13)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v13 + 8), 1uLL, memory_order_relaxed);
    long long v81 = v12;
    uint64_t v14 = (void *)v12;
    if (!(void)v12) {
      goto LABEL_6;
    }
  }
  else
  {
    long long v81 = v12;
    uint64_t v14 = (void *)v12;
    if (!(void)v12)
    {
LABEL_6:
      uint64_t v15 = [NSString stringWithUTF8String:"-[OITSUChunkedString(Private) p_insertCharactersInRange:fromString:atIndex:chunkIndex:]"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUChunkedString.mm"], 357, 0, "invalid nil value for '%{public}s'", "chunk");
      +[OITSUAssertionHandler logBacktraceThrottled];
      uint64_t v14 = (void *)v81;
    }
  }
  unint64_t v16 = v14[2];
  if (v14[1] - v16 < length)
  {
    unint64_t v17 = v6;
    unint64_t v80 = a5;
    float v18 = (float)(v16 + length);
    if (vcvtps_u32_f32(v18 / (float)v9->_chunkLength) != 1) {
      operator new();
    }
    v76 = v9;
    long long v19 = *((_OWORD *)p_chunks->__begin_ + v6);
    uint64_t v20 = *((void *)p_chunks->__begin_ + 2 * v6 + 1);
    if (v20) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v20 + 8), 1uLL, memory_order_relaxed);
    }
    unint64_t v21 = vcvtps_u32_f32(v18 / (float)1uLL);
    NSRange v22 = (std::__shared_weak_count *)*((void *)&v81 + 1);
    long long v82 = v19;
    if (v22)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v22);
      NSRange v23 = (void *)v82;
    }
    else
    {
      NSRange v23 = (void *)v19;
    }
    NSUInteger v77 = length;
    unint64_t v28 = a5 - *v23;
    unint64_t v29 = v28 - v21;
    if (v28 <= v21)
    {
      int v34 = 0;
      unint64_t v29 = v80 - *v23;
      unint64_t v30 = v6;
    }
    else
    {
      unint64_t v30 = v6 + 1;
      uint64_t v31 = (uint64_t)p_chunks->__begin_ + 16 * v6 + 16;
      v32 = *(void **)v31;
      v33 = *(std::__shared_weak_count **)(v31 + 8);
      if (v33) {
        atomic_fetch_add_explicit(&v33->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      memmove(v32 + 3, (char *)v23 + 2 * v21 + 24, 2 * v29);
      v32[2] += v29;
      int v34 = v21 - v28;
      void *v32 = *v23 + (int)v21 - (int)v28 + v23[2];
      if (v33)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v33);
        NSRange v23 = (void *)v82;
      }
      unint64_t v6 = v17;
    }
    unint64_t v35 = v23[2];
    unint64_t v36 = v35 - v28;
    if (v35 <= v28)
    {
      unint64_t v36 = 0;
      v39 = 0;
    }
    else
    {
      v37 = (char *)malloc_type_malloc(2 * v36, 0x1000040BDFB0063uLL);
      v38 = (const void *)(v82 + 2 * v28 + 24);
      v39 = v37;
      memmove(v37, v38, 2 * v36);
      v34 -= v36;
      uint64_t v40 = (uint64_t)p_chunks->__begin_ + 16 * v6;
      v42 = *(void **)(v40 + 16);
      v41 = *(std::__shared_weak_count **)(v40 + 24);
      if (v41)
      {
        atomic_fetch_add_explicit(&v41->__shared_owners_, 1uLL, memory_order_relaxed);
        *v42 -= v36;
        std::__shared_weak_count::__release_shared[abi:ne180100](v41);
      }
      else
      {
        *v42 -= v36;
      }
    }
    *(void *)(v82 + 16) += v34;
    long long v43 = *((_OWORD *)p_chunks->__begin_ + v30);
    uint64_t v44 = *((void *)p_chunks->__begin_ + 2 * v30 + 1);
    if (v44) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v44 + 8), 1uLL, memory_order_relaxed);
    }
    v45 = (std::__shared_weak_count *)*((void *)&v82 + 1);
    long long v81 = v43;
    v75 = v39;
    if (v45)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v45);
      v46 = (uint64_t *)v81;
    }
    else
    {
      v46 = (uint64_t *)v43;
    }
    uint64_t v47 = *v46;
    unint64_t v48 = v77;
    NSUInteger v49 = location - v80;
    while (1)
    {
      long long v50 = *((_OWORD *)p_chunks->__begin_ + v30);
      uint64_t v51 = *((void *)p_chunks->__begin_ + 2 * v30 + 1);
      if (v51) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v51 + 8), 1uLL, memory_order_relaxed);
      }
      v52 = (std::__shared_weak_count *)*((void *)&v81 + 1);
      long long v81 = v50;
      if (v52)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v52);
        uint64_t v53 = v81;
      }
      else
      {
        uint64_t v53 = v50;
      }
      unint64_t v54 = v21 - *(void *)(v53 + 16);
      if (v54)
      {
        unint64_t v56 = v48 >= v54 ? v21 - *(void *)(v53 + 16) : v48;
        objc_msgSend(a4, "getCharacters:range:", v53 + 2 * v29 + 24, v49 + v80, v56);
        *(void *)long long v81 = v47;
        unint64_t v55 = *(void *)(v81 + 16) + v56;
        *(void *)(v81 + 16) = v55;
        v80 += v56;
        v48 -= v56;
      }
      else
      {
        unint64_t v55 = v21;
      }
      unint64_t v29 = 0;
      v47 += v55;
      if (!v48) {
        break;
      }
      ++v30;
    }
    if (!v39) {
      goto LABEL_75;
    }
    long long v57 = *((_OWORD *)p_chunks->__begin_ + v30);
    uint64_t v58 = *((void *)p_chunks->__begin_ + 2 * v30 + 1);
    if (v58) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v58 + 8), 1uLL, memory_order_relaxed);
    }
    v59 = (std::__shared_weak_count *)*((void *)&v81 + 1);
    long long v81 = v57;
    if (v59)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v59);
      v60 = (uint64_t *)v81;
      if (!v36) {
        goto LABEL_74;
      }
    }
    else
    {
      v60 = (uint64_t *)v57;
      if (!v36)
      {
LABEL_74:
        free(v75);
LABEL_75:
        unint64_t v6 = v30;
        NSUInteger v9 = v76;
        NSUInteger length = v77;
        goto LABEL_76;
      }
    }
    uint64_t v61 = *v60;
    uint64_t v62 = v60[2] + *v60;
    uint64_t v63 = v62;
    while (1)
    {
      long long v64 = *((_OWORD *)p_chunks->__begin_ + v30);
      uint64_t v65 = *((void *)p_chunks->__begin_ + 2 * v30 + 1);
      if (v65) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v65 + 8), 1uLL, memory_order_relaxed);
      }
      v66 = (std::__shared_weak_count *)*((void *)&v81 + 1);
      long long v81 = v64;
      if (v66)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v66);
        uint64_t v67 = v81;
      }
      else
      {
        uint64_t v67 = v64;
      }
      uint64_t v68 = *(void *)(v67 + 16);
      if (v21 == v68)
      {
        unint64_t v69 = v21;
      }
      else
      {
        unint64_t v70 = v36 >= v21 - v68 ? v21 - v68 : v36;
        memcpy((void *)(v67 + 2 * v68 + 24), &v75[2 * (v63 - v62)], 2 * v70);
        *(void *)long long v81 = v61;
        unint64_t v69 = *(void *)(v81 + 16) + v70;
        *(void *)(v81 + 16) = v69;
        v63 += v70;
        v36 -= v70;
      }
      v61 += v69;
      if (!v36) {
        break;
      }
      ++v30;
    }
    goto LABEL_74;
  }
  unint64_t v24 = a5 - *v14;
  BOOL v25 = v16 > v24;
  unint64_t v26 = v16 - v24;
  if (v25 && length != 0)
  {
    memmove((char *)v14 + 2 * v24 + 2 * length + 24, (char *)v14 + 2 * v24 + 24, 2 * v26);
    uint64_t v14 = (void *)v81;
  }
  objc_msgSend(a4, "getCharacters:range:", (char *)v14 + 2 * v24 + 24, location, length);
  *(void *)(v81 + 16) += length;
LABEL_76:
  unint64_t v71 = ((char *)p_chunks->__end_ - (char *)p_chunks->__begin_) >> 4;
  if (v71 > v6 + 1)
  {
    unint64_t v72 = ~v6 + v71;
    v73 = (void **)((char *)p_chunks->__begin_ + 16 * v6 + 16);
    do
    {
      v74 = *v73;
      v73 += 2;
      *v74 += length;
      --v72;
    }
    while (v72);
  }
  v9->_length += length;
  if (*((void *)&v81 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v81 + 1));
  }
}

- (void)p_deleteCharactersInRange:(_NSRange)a3 chunkIndex:(unint64_t)a4
{
  if (a3.length)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    uint64_t v7 = 0;
    unint64_t v26 = self;
    p_chunks = &self->_chunks;
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      unint64_t v10 = (NSUInteger **)((char *)p_chunks->__begin_ + 16 * a4);
      v28.NSUInteger location = **v10;
      v28.NSUInteger length = (*v10)[2];
      v29.NSUInteger location = location;
      v29.NSUInteger length = length;
      NSRange v11 = NSIntersectionRange(v28, v29);
      long long v12 = *v10;
      NSUInteger v13 = **v10;
      NSUInteger v14 = (*v10)[2];
      NSUInteger v15 = v11.location - v13 + v11.length;
      if (v11.length) {
        BOOL v16 = v14 > v15;
      }
      else {
        BOOL v16 = 0;
      }
      if (v16)
      {
        memmove((char *)v12 + 2 * (v11.location - v13) + 24, (char *)v12 + 2 * v15 + 24, 2 * (v14 - v15));
        long long v12 = *v10;
        NSUInteger v13 = **v10;
        NSUInteger v14 = (*v10)[2];
      }
      *long long v12 = v13 - v7;
      NSUInteger v17 = v14 - v11.length;
      v12[2] = v17;
      if (v17)
      {
        if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v9 = a4;
        }
        ++a4;
      }
      else
      {
        std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::shared_ptr<TSUStringChunk> *,std::shared_ptr<TSUStringChunk> *,std::shared_ptr<TSUStringChunk> *>((uint64_t)&v27, (long long *)p_chunks->__begin_ + a4 + 1, (long long *)p_chunks->__end_, (uint64_t)p_chunks->__begin_ + 16 * a4);
        long long v19 = v18;
        end = (char *)p_chunks->__end_;
        if (end != v18)
        {
          do
          {
            unint64_t v21 = (std::__shared_weak_count *)*((void *)end - 1);
            if (v21) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v21);
            }
            end -= 16;
          }
          while (end != v19);
        }
        p_chunks->__end_ = v19;
      }
      location += v11.length;
      v7 += v11.length;
      length -= v11.length;
    }
    while (length);
    self = v26;
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v22 = ((char *)self->_chunks.__end_ - (char *)self->_chunks.__begin_) >> 4;
  unint64_t v23 = v22 - a4;
  if (v22 > a4)
  {
    unint64_t v24 = (void **)((char *)self->_chunks.__begin_ + 16 * a4);
    do
    {
      BOOL v25 = *v24;
      v24 += 2;
      *v25 -= v7;
      --v23;
    }
    while (v23);
  }
  self->_length -= v7;
  if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
    -[OITSUChunkedString p_compactChunksInRange:](self, "p_compactChunksInRange:");
  }
}

- (void)p_compactChunksInRange:(_NSRange)a3
{
  if (a3.length)
  {
    if (a3.location >= a3.location + a3.length)
    {
      unint64_t v3 = 0;
    }
    else
    {
      unint64_t v3 = 0;
      v4 = (uint64_t *)((char *)self->_chunks.__begin_ + 16 * a3.location);
      NSUInteger length = a3.length;
      do
      {
        uint64_t v6 = *v4;
        v4 += 2;
        v3 += *(void *)(v6 + 16);
        --length;
      }
      while (length);
    }
    unint64_t chunkLength = self->_chunkLength;
    if (v3 + (chunkLength >> 2) - 1 < chunkLength * (a3.length - 1))
    {
      float v8 = (float)chunkLength;
      begin = (char *)self->_chunks.__begin_;
      unint64_t v10 = &begin[16 * a3.location];
      long long v12 = *(void **)v10;
      NSRange v11 = (std::__shared_weak_count *)*((void *)v10 + 1);
      p_chunks = &self->_chunks;
      if (v11)
      {
        atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
        begin = (char *)self->_chunks.__begin_;
      }
      uint64_t v13 = v12[2];
      NSUInteger location = a3.location;
      NSUInteger v14 = a3.location + 1;
      NSUInteger v15 = &begin[16 * a3.location + 16];
      NSUInteger v17 = *(void **)v15;
      BOOL v16 = (std::__shared_weak_count *)*((void *)v15 + 1);
      if (v16) {
        atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      unint64_t v18 = v12[2];
      uint64_t v40 = v16;
      v38 = v11;
      unint64_t v33 = vcvtps_u32_f32((float)v3 / v8);
      NSUInteger v34 = a3.location + a3.length;
      if (v18 < v3)
      {
        long long v19 = (char *)v12 + 2 * v13 + 24;
        uint64_t v20 = (char *)(v17 + 3);
        uint64_t v36 = *v12;
        NSUInteger v37 = a3.location;
        do
        {
          uint64_t v21 = v12[1];
          uint64_t v22 = v12[2];
          unint64_t v23 = v21 - v22;
          unint64_t v24 = v17[2];
          if (v24 >= v21 - v22) {
            uint64_t v25 = v21 - v22;
          }
          else {
            uint64_t v25 = v17[2];
          }
          if (v25)
          {
            memmove(v19, v20, 2 * v25);
            v19 += 2 * v25;
            v20 += 2 * v25;
            v12[2] += v25;
            v17[2] -= v25;
            v18 += v25;
          }
          if (v18 < v3)
          {
            if (v12[1] == v12[2])
            {
              ++v37;
              uint64_t v26 = (uint64_t)p_chunks->__begin_ + 16 * v37;
              long long v12 = *(void **)v26;
              char v27 = *(std::__shared_weak_count **)(v26 + 8);
              if (v27) {
                atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
              }
              if (v38) {
                std::__shared_weak_count::__release_shared[abi:ne180100](v38);
              }
              *long long v12 = v18 + v36;
              long long v19 = (char *)(v12 + 3);
              v38 = v27;
            }
            if (v24 <= v23)
            {
              ++v14;
              NSRange v28 = (char *)p_chunks->__begin_ + 16 * v14;
              NSUInteger v17 = (void *)*v28;
              NSRange v29 = (std::__shared_weak_count *)v28[1];
              if (v29) {
                atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
              }
              if (v40) {
                std::__shared_weak_count::__release_shared[abi:ne180100](v40);
              }
              uint64_t v20 = (char *)(v17 + 3);
              uint64_t v40 = v29;
            }
            if (v17 == v12)
            {
              uint64_t v30 = v12[2];
              memmove(v12 + 3, v20, 2 * v30);
              ++v14;
              uint64_t v31 = (char *)p_chunks->__begin_ + 16 * v14;
              NSUInteger v17 = (void *)*v31;
              v32 = (std::__shared_weak_count *)v31[1];
              if (v32) {
                atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
              }
              if (v40) {
                std::__shared_weak_count::__release_shared[abi:ne180100](v40);
              }
              v18 += v30;
              uint64_t v20 = (char *)(v17 + 3);
              uint64_t v40 = v32;
              long long v19 = (char *)v12 + 2 * v30 + 24;
            }
          }
        }
        while (v18 < v3);
      }
      std::vector<std::shared_ptr<TSUStringChunk>>::erase((uint64_t)p_chunks, (uint64_t)p_chunks->__begin_ + 16 * location + 16 * v33, (long long *)p_chunks->__begin_ + v34);
      if (v40) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v40);
      }
      if (v38)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v38);
      }
    }
  }
}

@end