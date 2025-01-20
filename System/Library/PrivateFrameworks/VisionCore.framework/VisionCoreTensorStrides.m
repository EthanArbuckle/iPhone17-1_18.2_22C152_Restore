@interface VisionCoreTensorStrides
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (VisionCoreTensorStrides)initWithByteOffsets:(const int64_t *)a3 rank:(unint64_t)a4;
- (VisionCoreTensorStrides)initWithCoder:(id)a3;
- (VisionCoreTensorStrides)initWithShape:(id)a3 dataType:(unint64_t)a4;
- (const)byteOffsets;
- (id).cxx_construct;
- (id)description;
- (id)shapeForPackedElementsOfType:(unint64_t)a3 error:(id *)a4;
- (unint64_t)hash;
- (unint64_t)rank;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VisionCoreTensorStrides

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void).cxx_destruct
{
  begin = self->_byteOffsets.__begin_;
  if (begin)
  {
    self->_byteOffsets.__end_ = begin;
    operator delete(begin);
  }
}

- (VisionCoreTensorStrides)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"offsets"];
  v6 = v5;
  if (!v5) {
    goto LABEL_7;
  }
  unint64_t v7 = [v5 length];
  unint64_t v8 = v7;
  if (v7) {
    BOOL v9 = (v7 & 3) == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9)
  {
    v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Illegal sizes data length of %lu", v7);
    v11 = [MEMORY[0x263F087E8] VisionCoreErrorForCorruptedResourceWithLocalizedDescription:v10];
    [v4 failWithError:v11];

LABEL_7:
    v12 = 0;
    goto LABEL_35;
  }
  unint64_t v13 = v7 >> 2;
  __p = 0;
  v35 = 0;
  unint64_t v36 = 0;
  std::vector<long>::reserve(&__p, v7 >> 2);
  uint64_t v14 = [v6 bytes];
  v15 = (char *)__p;
  if (v8 >= 4)
  {
    uint64_t v16 = v14;
    id v32 = v4;
    v33 = self;
    uint64_t v17 = 0;
    unint64_t v31 = v13;
    if (v13 <= 1) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = v13;
    }
    v20 = v35;
    unint64_t v19 = v36;
    do
    {
      signed int v21 = bswap32(*(_DWORD *)(v16 + 4 * v17));
      uint64_t v22 = v21;
      if ((unint64_t)v20 >= v19)
      {
        uint64_t v23 = (v20 - v15) >> 3;
        unint64_t v24 = v23 + 1;
        if ((unint64_t)(v23 + 1) >> 61)
        {
          __p = v15;
          v35 = v20;
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        if ((uint64_t)(v19 - (void)v15) >> 2 > v24) {
          unint64_t v24 = (uint64_t)(v19 - (void)v15) >> 2;
        }
        if (v19 - (unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v25 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v25 = v24;
        }
        if (v25) {
          unint64_t v25 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v25);
        }
        else {
          uint64_t v26 = 0;
        }
        v27 = (char *)(v25 + 8 * v23);
        *(void *)v27 = v22;
        v28 = v27 + 8;
        while (v20 != v15)
        {
          uint64_t v29 = *((void *)v20 - 1);
          v20 -= 8;
          *((void *)v27 - 1) = v29;
          v27 -= 8;
        }
        unint64_t v19 = v25 + 8 * v26;
        if (v15) {
          operator delete(v15);
        }
        v15 = v27;
        v20 = v28;
      }
      else
      {
        *(void *)v20 = v21;
        v20 += 8;
      }
      ++v17;
    }
    while (v17 != v18);
    v35 = v20;
    unint64_t v36 = v19;
    __p = v15;
    id v4 = v32;
    self = v33;
    unint64_t v13 = v31;
  }
  self = [(VisionCoreTensorStrides *)self initWithByteOffsets:v15 rank:v13];
  if (__p) {
    operator delete(__p);
  }
  v12 = self;
LABEL_35:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  begin = self->_byteOffsets.__begin_;
  end = self->_byteOffsets.__end_;
  uint64_t v6 = (char *)end - (char *)begin;
  id v7 = objc_retainAutorelease((id)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:((char *)end - (char *)begin) >> 1]);
  unint64_t v8 = (_DWORD *)[v7 mutableBytes];
  if (end != begin)
  {
    uint64_t v9 = v6 >> 3;
    v10 = self->_byteOffsets.__begin_;
    if ((unint64_t)(v6 >> 3) <= 1) {
      uint64_t v9 = 1;
    }
    do
    {
      unsigned int v11 = *(_DWORD *)v10++;
      *v8++ = bswap32(v11);
      --v9;
    }
    while (v9);
  }
  [v12 encodeObject:v7 forKey:@"offsets"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendString:@"["];
  unint64_t v4 = [(VisionCoreTensorStrides *)self rank];
  if (v4)
  {
    v5 = [(VisionCoreTensorStrides *)self byteOffsets];
    do
    {
      int64_t v6 = *v5++;
      objc_msgSend(v3, "appendFormat:", @" %ld", v6);
      --v4;
    }
    while (v4);
  }
  [v3 appendString:@" ]"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (VisionCoreTensorStrides *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v8 = (objc_opt_isKindOfClass() & 1) != 0
      && (begin = self->_byteOffsets.__begin_,
          int64_t v6 = (char *)((char *)self->_byteOffsets.__end_ - (char *)begin),
          id v7 = v4->_byteOffsets.__begin_,
          v6 == (char *)((char *)v4->_byteOffsets.__end_ - (char *)v7))
      && memcmp(begin, v7, (size_t)v6) == 0;
  }

  return v8;
}

- (unint64_t)hash
{
  begin = self->_byteOffsets.__begin_;
  end = self->_byteOffsets.__end_;
  if (begin == end) {
    return 0;
  }
  unint64_t result = 0;
  do
  {
    uint64_t v5 = *begin++;
    result ^= v5;
  }
  while (begin != end);
  return result;
}

- (const)byteOffsets
{
  return self->_byteOffsets.__begin_;
}

- (unint64_t)rank
{
  return self->_byteOffsets.__end_ - self->_byteOffsets.__begin_;
}

- (id)shapeForPackedElementsOfType:(unint64_t)a3 error:(id *)a4
{
  if (!((unsigned __int16)a3 >> 3))
  {
    if (a4)
    {
      id v24 = [NSString alloc];
      unint64_t v25 = NSStringFromVisionCoreTensorDataType(a3);
      uint64_t v26 = (void *)[v24 initWithFormat:@"unknown element type %@", v25];

      v27 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidArgumentWithLocalizedDescription:v26];
LABEL_29:
      *a4 = v27;
    }
LABEL_30:
    v30 = 0;
    goto LABEL_34;
  }
  begin = self->_byteOffsets.__begin_;
  uint64_t v8 = self->_byteOffsets.__end_ - begin - 1;
  if (begin[v8] != (unsigned __int16)a3 >> 3)
  {
    if (a4)
    {
      id v28 = [NSString alloc];
      uint64_t v29 = NSStringFromVisionCoreTensorDataType(a3);
      uint64_t v26 = (void *)[v28 initWithFormat:@"%@ is not packed into %@ elements", self, v29];

      v27 = [MEMORY[0x263F087E8] VisionCoreErrorForFailedOperationWithLocalizedDescription:v26];
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  uint64_t v9 = (uint64_t *)operator new(8uLL);
  v10 = v9;
  *uint64_t v9 = 1;
  unsigned int v11 = v9 + 1;
  if (v8)
  {
    v35 = a4;
    uint64_t v12 = 0;
    unint64_t v13 = v9 + 1;
    while (1)
    {
      uint64_t v14 = self->_byteOffsets.__begin_;
      int64_t v15 = v14[v12++];
      uint64_t v16 = v15 / v14[v12];
      if (v16 <= 0) {
        break;
      }
      if (v11 >= v13)
      {
        uint64_t v18 = v11 - v10;
        unint64_t v19 = v18 + 1;
        if ((unint64_t)(v18 + 1) >> 61) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        if (((char *)v13 - (char *)v10) >> 2 > v19) {
          unint64_t v19 = ((char *)v13 - (char *)v10) >> 2;
        }
        if ((unint64_t)((char *)v13 - (char *)v10) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v20 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v20 = v19;
        }
        if (v20) {
          unint64_t v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v20);
        }
        else {
          uint64_t v21 = 0;
        }
        uint64_t v22 = (uint64_t *)(v20 + 8 * v18);
        *uint64_t v22 = v16;
        uint64_t v17 = v22 + 1;
        while (v11 != v10)
        {
          uint64_t v23 = *--v11;
          *--uint64_t v22 = v23;
        }
        unint64_t v13 = (uint64_t *)(v20 + 8 * v21);
        if (v10) {
          operator delete(v10);
        }
        v10 = v22;
      }
      else
      {
        uint64_t *v11 = v16;
        uint64_t v17 = v11 + 1;
      }
      unsigned int v11 = v17;
      if (v12 == v8) {
        goto LABEL_32;
      }
    }
    if (v35)
    {
      id v32 = [NSString alloc];
      v33 = NSStringFromVisionCoreTensorDataType(a3);
      v34 = (void *)[v32 initWithFormat:@"%@ is not packed into %@ elements", self, v33];

      id *v35 = [MEMORY[0x263F087E8] VisionCoreErrorForFailedOperationWithLocalizedDescription:v34];
    }
    v30 = 0;
    if (!v10) {
      goto LABEL_34;
    }
LABEL_33:
    operator delete(v10);
    goto LABEL_34;
  }
  uint64_t v17 = v9 + 1;
LABEL_32:
  v30 = [[VisionCoreTensorShape alloc] initWithSizes:v10 rank:v17 - v10];
  if (v10) {
    goto LABEL_33;
  }
LABEL_34:
  return v30;
}

- (VisionCoreTensorStrides)initWithShape:(id)a3 dataType:(unint64_t)a4
{
  unsigned __int16 v4 = a4;
  id v36 = a3;
  v39.receiver = self;
  v39.super_class = (Class)VisionCoreTensorStrides;
  int64_t v6 = [(VisionCoreTensorStrides *)&v39 init];
  if (v6)
  {
    unint64_t v7 = [v36 rank];
    p_byteOffsets = &v6->_byteOffsets;
    std::vector<long>::reserve((void **)&v6->_byteOffsets.__begin_, v7);
    uint64_t v8 = [v36 sizes];
    if (v7)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      int64_t v11 = v4 >> 3;
      uint64_t v12 = 1;
      unint64_t v37 = v7;
      while (1)
      {
        v11 *= v12;
        uint64_t v12 = *(void *)(v9 + 8 * v10);
        begin = v6->_byteOffsets.__begin_;
        end = v6->_byteOffsets.__end_;
        value = v6->_byteOffsets.__end_cap_.__value_;
        if (end >= value) {
          break;
        }
        if (begin == end)
        {
          int64_t *begin = v11;
          v6->_byteOffsets.__end_ = begin + 1;
        }
        else
        {
          uint64_t v16 = end - 1;
          uint64_t v17 = v6->_byteOffsets.__end_;
          while (v16 < end)
          {
            int64_t v18 = *v16++;
            *v17++ = v18;
          }
          v6->_byteOffsets.__end_ = v17;
          if (end != begin + 1) {
            memmove(&end[-(end - (begin + 1))], begin, (char *)end - (char *)(begin + 1));
          }
          int64_t *begin = v11;
        }
LABEL_33:
        if (++v10 == v7) {
          goto LABEL_34;
        }
      }
      unint64_t v19 = end - begin + 1;
      if (v19 >> 61) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v20 = (char *)value - (char *)begin;
      if (v20 >> 2 > v19) {
        unint64_t v19 = v20 >> 2;
      }
      if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v21 = v19;
      }
      if (v21)
      {
        uint64_t v22 = (int64_t *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v21);
        id v24 = v22;
        if (v23)
        {
          unint64_t v25 = &v22[v23];
LABEL_26:
          *id v24 = v11;
          id v28 = (char *)(v24 + 1);
          uint64_t v29 = p_byteOffsets->__begin_;
          if (p_byteOffsets->__begin_ != begin)
          {
            v30 = begin;
            do
            {
              int64_t v31 = *--v30;
              *--id v24 = v31;
            }
            while (v30 != v29);
          }
          id v32 = v6->_byteOffsets.__end_;
          int64_t v33 = (char *)v32 - (char *)begin;
          if (v32 != begin) {
            memmove(v28, begin, (char *)v32 - (char *)begin);
          }
          v34 = v6->_byteOffsets.__begin_;
          v6->_byteOffsets.__begin_ = v24;
          v6->_byteOffsets.__end_ = (int64_t *)&v28[v33];
          v6->_byteOffsets.__end_cap_.__value_ = v25;
          unint64_t v7 = v37;
          if (v34) {
            operator delete(v34);
          }
          goto LABEL_33;
        }
      }
      else
      {
        id v24 = 0;
      }
      uint64_t v26 = (int64_t *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(1uLL);
      unint64_t v25 = &v26[v27];
      if (v24) {
        operator delete(v24);
      }
      id v24 = v26;
      goto LABEL_26;
    }
  }
LABEL_34:

  return v6;
}

- (VisionCoreTensorStrides)initWithByteOffsets:(const int64_t *)a3 rank:(unint64_t)a4
{
  v22.receiver = self;
  v22.super_class = (Class)VisionCoreTensorStrides;
  int64_t v6 = [(VisionCoreTensorStrides *)&v22 init];
  unint64_t v7 = v6;
  if (v6)
  {
    p_begin = (void **)&v6->_byteOffsets.__begin_;
    std::vector<long>::reserve((void **)&v6->_byteOffsets.__begin_, a4);
    if (a4)
    {
      uint64_t v9 = 0;
      end = v7->_byteOffsets.__end_;
      do
      {
        value = v7->_byteOffsets.__end_cap_.__value_;
        if (end >= value)
        {
          begin = (int64_t *)*p_begin;
          uint64_t v14 = ((char *)end - (unsigned char *)*p_begin) >> 3;
          unint64_t v15 = v14 + 1;
          if ((unint64_t)(v14 + 1) >> 61) {
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v16 = (char *)value - (char *)begin;
          if (v16 >> 2 > v15) {
            unint64_t v15 = v16 >> 2;
          }
          if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v17 = v15;
          }
          if (v17)
          {
            unint64_t v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v17);
            begin = v7->_byteOffsets.__begin_;
            end = v7->_byteOffsets.__end_;
          }
          else
          {
            uint64_t v18 = 0;
          }
          unint64_t v19 = (int64_t *)(v17 + 8 * v14);
          *unint64_t v19 = a3[v9];
          uint64_t v12 = v19 + 1;
          while (end != begin)
          {
            int64_t v20 = *--end;
            *--unint64_t v19 = v20;
          }
          v7->_byteOffsets.__begin_ = v19;
          v7->_byteOffsets.__end_ = v12;
          v7->_byteOffsets.__end_cap_.__value_ = (int64_t *)(v17 + 8 * v18);
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          int64_t *end = a3[v9];
          uint64_t v12 = end + 1;
        }
        v7->_byteOffsets.__end_ = v12;
        ++v9;
        end = v12;
      }
      while (v9 != a4);
    }
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end