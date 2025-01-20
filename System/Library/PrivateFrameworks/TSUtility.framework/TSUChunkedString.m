@interface TSUChunkedString
- (TSUChunkedString)init;
- (TSUChunkedString)initWithChunkLength:(unint64_t)a3;
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

@implementation TSUChunkedString

- (TSUChunkedString)initWithChunkLength:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSUChunkedString;
  result = [(TSUChunkedString *)&v5 init];
  if (result) {
    result->_chunkLength = a3;
  }
  return result;
}

- (TSUChunkedString)init
{
  return [(TSUChunkedString *)self initWithChunkLength:0x4000];
}

- (void)dealloc
{
  std::vector<std::shared_ptr<TSUStringChunk>>::__clear[abi:ne180100]((uint64_t *)&self->_chunks);
  v3.receiver = self;
  v3.super_class = (Class)TSUChunkedString;
  [(TSUChunkedString *)&v3 dealloc];
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
  uint64_t v17 = [a4 length];
  NSUInteger v8 = length;
  if ([a4 length] < length) {
    NSUInteger v8 = [a4 length];
  }
  NSUInteger v19 = length;
  p_chunks = &self->_chunks;
  uint64_t v10 = p_chunkIndexForCharacterIndex(location, &self->_chunks.__begin_);
  NSUInteger v18 = v8;
  if (v8)
  {
    NSUInteger v11 = location;
    while (1)
    {
      begin = p_chunks->__begin_;
      NSUInteger v13 = (NSUInteger *)*((void *)p_chunks->__begin_ + 2 * v10);
      NSUInteger v14 = *v13;
      v21.NSUInteger length = v13[2];
      v21.NSUInteger location = *v13;
      v22.NSUInteger location = v11;
      v22.NSUInteger length = v8;
      NSRange v15 = NSIntersectionRange(v21, v22);
      objc_msgSend(a4, "getCharacters:range:", begin[2 * v10] + 2 * (v15.location - v14) + 24, v11 - location, v15.length);
      v11 += v15.length;
      v8 -= v15.length;
      if (!v8) {
        break;
      }
      ++v10;
    }
  }
  if ((uint64_t)(v17 - v19) < 1)
  {
    if (((v17 - v19) & 0x8000000000000000) != 0)
    {
      -[TSUChunkedString p_deleteCharactersInRange:chunkIndex:](self, "p_deleteCharactersInRange:chunkIndex:", v18 + location, v19 - v18, v10);
    }
  }
  else
  {
    NSUInteger v16 = v17 - v18;
    if (v18 + location == self->_length)
    {
      -[TSUChunkedString p_appendRange:fromString:](self, "p_appendRange:fromString:", v18, v16, a4);
    }
    else
    {
      -[TSUChunkedString p_insertCharactersInRange:fromString:atIndex:chunkIndex:](self, "p_insertCharactersInRange:fromString:atIndex:chunkIndex:", v18, v16, a4);
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
      [(TSUChunkedString *)self appendString:a3];
    }
    else
    {
      uint64_t v7 = p_chunkIndexForCharacterIndex(a4, &self->_chunks.__begin_);
      uint64_t v8 = [a3 length];
      -[TSUChunkedString p_insertCharactersInRange:fromString:atIndex:chunkIndex:](self, "p_insertCharactersInRange:fromString:atIndex:chunkIndex:", 0, v8, a3, a4, v7);
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
    -[TSUChunkedString p_deleteCharactersInRange:chunkIndex:](self, "p_deleteCharactersInRange:chunkIndex:", location, length, v6);
  }
}

- (void)appendString:(id)a3
{
  uint64_t v5 = [a3 length];
  -[TSUChunkedString p_appendRange:fromString:](self, "p_appendRange:fromString:", 0, v5, a3);
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
        *(void *)&long long v19 = v10;
        *((void *)&v19 + 1) = v11;
      }
      else
      {
        long long v19 = v10;
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
        id v15 = +[TSUAssertionHandler currentHandler];
        uint64_t v16 = [NSString stringWithUTF8String:"-[TSUChunkedString(Private) p_appendRange:fromString:]"];
        objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUChunkedString.mm"), 374, @"should have allocated a chunk with available space at this point");
        unint64_t v10 = v19;
      }
      if (length >= v14) {
        NSUInteger v17 = v14;
      }
      else {
        NSUInteger v17 = length;
      }
      objc_msgSend(a4, "getCharacters:range:", v10 + 2 * *(void *)(v10 + 16) + 24, location, v17, v18);
      *(void *)(v19 + 16) += v17;
      self->_length += v17;
      if (*((void *)&v19 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v19 + 1));
      }
      location += v17;
      length -= v17;
    }
    while (length);
  }
}

- (void)p_insertCharactersInRange:(_NSRange)a3 fromString:(id)a4 atIndex:(unint64_t)a5 chunkIndex:(unint64_t)a6
{
  unint64_t v6 = a6;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v10 = self;
  p_chunks = &self->_chunks;
  begin = self->_chunks.__begin_;
  if (self->_chunks.__end_ == begin) {
    operator new();
  }
  long long v13 = begin[a6];
  uint64_t v14 = *((void *)&begin[a6] + 1);
  if (v14)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v14 + 8), 1uLL, memory_order_relaxed);
    long long v83 = v13;
    id v15 = (void *)v13;
    if (!(void)v13) {
      goto LABEL_6;
    }
  }
  else
  {
    long long v83 = v13;
    id v15 = (void *)v13;
    if (!(void)v13)
    {
LABEL_6:
      id v16 = +[TSUAssertionHandler currentHandler];
      uint64_t v17 = [NSString stringWithUTF8String:"-[TSUChunkedString(Private) p_insertCharactersInRange:fromString:atIndex:chunkIndex:]"];
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUChunkedString.mm"), 405, @"invalid nil value for '%s'", "chunk.get()");
      id v15 = (void *)v83;
    }
  }
  unint64_t v18 = v15[2];
  if (v15[1] - v18 < length)
  {
    unint64_t v19 = v6;
    NSUInteger v79 = location;
    unint64_t v82 = a5;
    float v20 = (float)(v18 + length);
    if (vcvtps_u32_f32(v20 / (float)v10->_chunkLength) != 1) {
      operator new();
    }
    v78 = v10;
    long long v21 = *((_OWORD *)p_chunks->__begin_ + v6);
    uint64_t v22 = *((void *)p_chunks->__begin_ + 2 * v6 + 1);
    if (v22) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v22 + 8), 1uLL, memory_order_relaxed);
    }
    unint64_t v23 = vcvtps_u32_f32(v20 / (float)1uLL);
    v24 = (std::__shared_weak_count *)*((void *)&v83 + 1);
    long long v84 = v21;
    if (v24)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v24);
      v25 = (void *)v84;
    }
    else
    {
      v25 = (void *)v21;
    }
    NSUInteger v80 = length;
    unint64_t v30 = v82 - *v25;
    unint64_t v31 = v30 - v23;
    if (v30 <= v23)
    {
      int v36 = 0;
      unint64_t v31 = v82 - *v25;
      unint64_t v32 = v6;
    }
    else
    {
      unint64_t v32 = v6 + 1;
      uint64_t v33 = (uint64_t)p_chunks->__begin_ + 16 * v6 + 16;
      v34 = *(void **)v33;
      v35 = *(std::__shared_weak_count **)(v33 + 8);
      if (v35) {
        atomic_fetch_add_explicit(&v35->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      memmove(v34 + 3, (char *)v25 + 2 * v23 + 24, 2 * v31);
      v34[2] += v31;
      int v36 = v23 - v30;
      void *v34 = *v25 + (int)v23 - (int)v30 + v25[2];
      if (v35)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v35);
        v25 = (void *)v84;
      }
      unint64_t v6 = v19;
    }
    unint64_t v37 = v25[2];
    unint64_t v38 = v37 - v30;
    if (v37 <= v30)
    {
      unint64_t v38 = 0;
      v41 = 0;
    }
    else
    {
      v39 = (char *)malloc_type_malloc(2 * v38, 0x1000040BDFB0063uLL);
      v40 = (const void *)(v84 + 2 * v30 + 24);
      v41 = v39;
      memmove(v39, v40, 2 * v38);
      v36 -= v38;
      uint64_t v42 = (uint64_t)p_chunks->__begin_ + 16 * v6;
      v44 = *(void **)(v42 + 16);
      v43 = *(std::__shared_weak_count **)(v42 + 24);
      if (v43)
      {
        atomic_fetch_add_explicit(&v43->__shared_owners_, 1uLL, memory_order_relaxed);
        *v44 -= v38;
        std::__shared_weak_count::__release_shared[abi:ne180100](v43);
      }
      else
      {
        *v44 -= v38;
      }
    }
    *(void *)(v84 + 16) += v36;
    long long v45 = *((_OWORD *)p_chunks->__begin_ + v32);
    uint64_t v46 = *((void *)p_chunks->__begin_ + 2 * v32 + 1);
    if (v46) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v46 + 8), 1uLL, memory_order_relaxed);
    }
    v47 = (std::__shared_weak_count *)*((void *)&v84 + 1);
    long long v83 = v45;
    v77 = v41;
    if (v47)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v47);
      v48 = (uint64_t *)v83;
    }
    else
    {
      v48 = (uint64_t *)v45;
    }
    uint64_t v49 = *v48;
    unint64_t v50 = v80;
    NSUInteger v51 = v79 - v82;
    while (1)
    {
      long long v52 = *((_OWORD *)p_chunks->__begin_ + v32);
      uint64_t v53 = *((void *)p_chunks->__begin_ + 2 * v32 + 1);
      if (v53) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v53 + 8), 1uLL, memory_order_relaxed);
      }
      v54 = (std::__shared_weak_count *)*((void *)&v83 + 1);
      long long v83 = v52;
      if (v54)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v54);
        uint64_t v55 = v83;
      }
      else
      {
        uint64_t v55 = v52;
      }
      unint64_t v56 = v23 - *(void *)(v55 + 16);
      if (v56)
      {
        unint64_t v58 = v50 >= v56 ? v23 - *(void *)(v55 + 16) : v50;
        objc_msgSend(a4, "getCharacters:range:", v55 + 2 * v31 + 24, v51 + v82, v58);
        *(void *)long long v83 = v49;
        unint64_t v57 = *(void *)(v83 + 16) + v58;
        *(void *)(v83 + 16) = v57;
        v82 += v58;
        v50 -= v58;
      }
      else
      {
        unint64_t v57 = v23;
      }
      unint64_t v31 = 0;
      v49 += v57;
      if (!v50) {
        break;
      }
      ++v32;
    }
    if (!v41) {
      goto LABEL_75;
    }
    long long v59 = *((_OWORD *)p_chunks->__begin_ + v32);
    uint64_t v60 = *((void *)p_chunks->__begin_ + 2 * v32 + 1);
    if (v60) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v60 + 8), 1uLL, memory_order_relaxed);
    }
    v61 = (std::__shared_weak_count *)*((void *)&v83 + 1);
    long long v83 = v59;
    if (v61)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v61);
      v62 = (uint64_t *)v83;
      if (!v38) {
        goto LABEL_74;
      }
    }
    else
    {
      v62 = (uint64_t *)v59;
      if (!v38)
      {
LABEL_74:
        free(v77);
LABEL_75:
        unint64_t v6 = v32;
        NSUInteger length = v80;
        unint64_t v10 = v78;
        goto LABEL_76;
      }
    }
    uint64_t v63 = *v62;
    uint64_t v64 = v62[2] + *v62;
    uint64_t v65 = v64;
    while (1)
    {
      long long v66 = *((_OWORD *)p_chunks->__begin_ + v32);
      uint64_t v67 = *((void *)p_chunks->__begin_ + 2 * v32 + 1);
      if (v67) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v67 + 8), 1uLL, memory_order_relaxed);
      }
      v68 = (std::__shared_weak_count *)*((void *)&v83 + 1);
      long long v83 = v66;
      if (v68)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v68);
        uint64_t v69 = v83;
      }
      else
      {
        uint64_t v69 = v66;
      }
      uint64_t v70 = *(void *)(v69 + 16);
      if (v23 == v70)
      {
        unint64_t v71 = v23;
      }
      else
      {
        unint64_t v72 = v38 >= v23 - v70 ? v23 - v70 : v38;
        memcpy((void *)(v69 + 2 * v70 + 24), &v77[2 * (v65 - v64)], 2 * v72);
        *(void *)long long v83 = v63;
        unint64_t v71 = *(void *)(v83 + 16) + v72;
        *(void *)(v83 + 16) = v71;
        v65 += v72;
        v38 -= v72;
      }
      v63 += v71;
      if (!v38) {
        break;
      }
      ++v32;
    }
    goto LABEL_74;
  }
  unint64_t v26 = a5 - *v15;
  BOOL v27 = v18 > v26;
  unint64_t v28 = v18 - v26;
  if (v27 && length != 0)
  {
    memmove((char *)v15 + 2 * v26 + 2 * length + 24, (char *)v15 + 2 * v26 + 24, 2 * v28);
    id v15 = (void *)v83;
  }
  objc_msgSend(a4, "getCharacters:range:", (char *)v15 + 2 * v26 + 24, location, length);
  *(void *)(v83 + 16) += length;
LABEL_76:
  unint64_t v73 = ((char *)p_chunks->__end_ - (char *)p_chunks->__begin_) >> 4;
  if (v73 > v6 + 1)
  {
    unint64_t v74 = ~v6 + v73;
    v75 = (void **)((char *)p_chunks->__begin_ + 16 * v6 + 16);
    do
    {
      v76 = *v75;
      v75 += 2;
      *v76 += length;
      --v74;
    }
    while (v74);
  }
  v10->_length += length;
  if (*((void *)&v83 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v83 + 1));
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
      uint64_t v12 = *v10;
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
        uint64_t v12 = *v10;
        NSUInteger v13 = **v10;
        NSUInteger v14 = (*v10)[2];
      }
      *uint64_t v12 = v13 - v7;
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
        unint64_t v19 = v18;
        end = (char *)p_chunks->__end_;
        if (end != v18)
        {
          do
          {
            long long v21 = (std::__shared_weak_count *)*((void *)end - 1);
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
    v24 = (void **)((char *)self->_chunks.__begin_ + 16 * a4);
    do
    {
      v25 = *v24;
      v24 += 2;
      *v25 -= v7;
      --v23;
    }
    while (v23);
  }
  self->_length -= v7;
  if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
    -[TSUChunkedString p_compactChunksInRange:](self, "p_compactChunksInRange:");
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
      uint64_t v12 = *(void **)v10;
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
      v40 = v16;
      unint64_t v38 = v11;
      unint64_t v33 = vcvtps_u32_f32((float)v3 / v8);
      NSUInteger v34 = a3.location + a3.length;
      if (v18 < v3)
      {
        unint64_t v19 = (char *)v12 + 2 * v13 + 24;
        float v20 = (char *)(v17 + 3);
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
              uint64_t v12 = *(void **)v26;
              char v27 = *(std::__shared_weak_count **)(v26 + 8);
              if (v27) {
                atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
              }
              if (v38) {
                std::__shared_weak_count::__release_shared[abi:ne180100](v38);
              }
              *uint64_t v12 = v18 + v36;
              unint64_t v19 = (char *)(v12 + 3);
              unint64_t v38 = v27;
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
              float v20 = (char *)(v17 + 3);
              v40 = v29;
            }
            if (v17 == v12)
            {
              uint64_t v30 = v12[2];
              memmove(v12 + 3, v20, 2 * v30);
              ++v14;
              unint64_t v31 = (char *)p_chunks->__begin_ + 16 * v14;
              NSUInteger v17 = (void *)*v31;
              unint64_t v32 = (std::__shared_weak_count *)v31[1];
              if (v32) {
                atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
              }
              if (v40) {
                std::__shared_weak_count::__release_shared[abi:ne180100](v40);
              }
              v18 += v30;
              float v20 = (char *)(v17 + 3);
              v40 = v32;
              unint64_t v19 = (char *)v12 + 2 * v30 + 24;
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