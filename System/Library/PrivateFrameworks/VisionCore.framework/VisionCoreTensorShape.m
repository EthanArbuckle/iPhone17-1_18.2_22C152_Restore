@interface VisionCoreTensorShape
+ (BOOL)supportsSecureCoding;
- (BOOL)getOneDimensionalArrayDimensionIndex:(unint64_t *)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)sizesAsNSNumberArray;
- (VisionCoreTensorShape)initWithBatchNumber:(unint64_t)a3 channels:(unint64_t)a4 height:(unint64_t)a5 width:(unint64_t)a6;
- (VisionCoreTensorShape)initWithCoder:(id)a3;
- (VisionCoreTensorShape)initWithImageChannels:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5;
- (VisionCoreTensorShape)initWithPixelFormatType:(unsigned int)a3 width:(unint64_t)a4 height:(unint64_t)a5;
- (VisionCoreTensorShape)initWithSizes:(const unint64_t *)a3 rank:(unint64_t)a4;
- (const)sizes;
- (id).cxx_construct;
- (id)description;
- (unint64_t)elementCount;
- (unint64_t)hash;
- (unint64_t)rank;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VisionCoreTensorShape

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void).cxx_destruct
{
  begin = self->_sizes.__begin_;
  if (begin)
  {
    self->_sizes.__end_ = begin;
    operator delete(begin);
  }
}

- (VisionCoreTensorShape)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sizes"];
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
    goto LABEL_38;
  }
  unint64_t v13 = v7 >> 2;
  id v32 = v4;
  v33 = self;
  if (v7 >= 4)
  {
    if ((v7 & 0x8000000000000000) != 0) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v7 >> 2);
    v15 = &v14[8 * v16];
  }
  else
  {
    v14 = 0;
    v15 = 0;
  }
  uint64_t v17 = [v6 bytes];
  unint64_t v31 = v8 >> 2;
  if (v8 >= 4)
  {
    uint64_t v18 = v17;
    uint64_t v19 = 0;
    if (v13 <= 1) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = v13;
    }
    v21 = v14;
    do
    {
      uint64_t v22 = bswap32(*(_DWORD *)(v18 + 4 * v19));
      *(_DWORD *)(v18 + 4 * v19) = v22;
      if (v21 >= v15)
      {
        uint64_t v24 = (v21 - v14) >> 3;
        unint64_t v25 = v24 + 1;
        if ((unint64_t)(v24 + 1) >> 61) {
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        }
        if ((v15 - v14) >> 2 > v25) {
          unint64_t v25 = (v15 - v14) >> 2;
        }
        if ((unint64_t)(v15 - v14) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v26 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v26 = v25;
        }
        if (v26) {
          unint64_t v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v26);
        }
        else {
          uint64_t v27 = 0;
        }
        v28 = (char *)(v26 + 8 * v24);
        *(void *)v28 = v22;
        v23 = v28 + 8;
        while (v21 != v14)
        {
          uint64_t v29 = *((void *)v21 - 1);
          v21 -= 8;
          *((void *)v28 - 1) = v29;
          v28 -= 8;
        }
        v15 = (char *)(v26 + 8 * v27);
        if (v14) {
          operator delete(v14);
        }
        v14 = v28;
      }
      else
      {
        *(void *)v21 = v22;
        v23 = v21 + 8;
      }
      ++v19;
      v21 = v23;
    }
    while (v19 != v20);
  }
  id v4 = v32;
  self = [(VisionCoreTensorShape *)v33 initWithSizes:v14 rank:v31];
  if (v14) {
    operator delete(v14);
  }
  v12 = self;
LABEL_38:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  begin = self->_sizes.__begin_;
  end = self->_sizes.__end_;
  uint64_t v6 = (char *)end - (char *)begin;
  id v7 = objc_retainAutorelease((id)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:((char *)end - (char *)begin) >> 1]);
  unint64_t v8 = (_DWORD *)[v7 mutableBytes];
  if (end != begin)
  {
    uint64_t v9 = v6 >> 3;
    v10 = self->_sizes.__begin_;
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
  [v12 encodeObject:v7 forKey:@"sizes"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendString:@"["];
  unint64_t v4 = [(VisionCoreTensorShape *)self rank];
  if (v4)
  {
    v5 = [(VisionCoreTensorShape *)self sizes];
    do
    {
      unint64_t v6 = *v5++;
      objc_msgSend(v3, "appendFormat:", @" %lu", v6);
      --v4;
    }
    while (v4);
  }
  [v3 appendString:@" ]"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (VisionCoreTensorShape *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v8 = (objc_opt_isKindOfClass() & 1) != 0
      && (begin = self->_sizes.__begin_,
          unint64_t v6 = (char *)((char *)self->_sizes.__end_ - (char *)begin),
          id v7 = v4->_sizes.__begin_,
          v6 == (char *)((char *)v4->_sizes.__end_ - (char *)v7))
      && memcmp(begin, v7, (size_t)v6) == 0;
  }

  return v8;
}

- (unint64_t)hash
{
  begin = self->_sizes.__begin_;
  end = self->_sizes.__end_;
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

- (BOOL)getOneDimensionalArrayDimensionIndex:(unint64_t *)a3 error:(id *)a4
{
  unint64_t v7 = [(VisionCoreTensorShape *)self rank];
  BOOL v8 = self;
  uint64_t v9 = [(VisionCoreTensorShape *)v8 sizes];
  if (v7)
  {
    unint64_t v10 = 0;
    unint64_t v11 = 0;
    char v12 = 0;
    unint64_t v14 = *v9;
    unint64_t v13 = v9 + 1;
    BOOL v15 = v14 != 1;
    while (1)
    {
      if (v15) {
        unint64_t v11 = v10;
      }
      if (v7 - 1 == v10) {
        break;
      }
      v12 |= v15;
      uint64_t v16 = v13[v10++];
      BOOL v17 = v16 == 1;
      BOOL v15 = v16 != 1;
      if (!v17 && (v12 & 1) != 0)
      {
        BOOL v18 = v10 >= v7;
        if (a4)
        {
          uint64_t v19 = (void *)[[NSString alloc] initWithFormat:@"%@ has multiple dimensions", v8];
          *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForInvalidOperationWithLocalizedDescription:v19];
        }
        return v18;
      }
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  if (a3) {
    *a3 = v11;
  }
  return 1;
}

- (NSArray)sizesAsNSNumberArray
{
  unint64_t v3 = [(VisionCoreTensorShape *)self rank];
  unint64_t v4 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v3];
  uint64_t v5 = [(VisionCoreTensorShape *)self sizes];
  if (v3)
  {
    unint64_t v6 = v5;
    do
    {
      uint64_t v7 = *v6++;
      BOOL v8 = [NSNumber numberWithUnsignedLong:v7];
      [v4 addObject:v8];

      --v3;
    }
    while (v3);
  }
  return (NSArray *)v4;
}

- (VisionCoreTensorShape)initWithPixelFormatType:(unsigned int)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  return [(VisionCoreTensorShape *)self initWithImageChannels:1 width:a4 height:a5];
}

- (VisionCoreTensorShape)initWithImageChannels:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  v51.receiver = self;
  v51.super_class = (Class)VisionCoreTensorShape;
  BOOL v8 = [(VisionCoreTensorShape *)&v51 init];
  uint64_t v9 = v8;
  if (v8)
  {
    end = v8->_sizes.__end_;
    value = v8->_sizes.__end_cap_.__value_;
    if (end >= value)
    {
      begin = v8->_sizes.__begin_;
      uint64_t v14 = end - begin;
      unint64_t v15 = v14 + 1;
      if ((unint64_t)(v14 + 1) >> 61) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v16 = (char *)value - (char *)begin;
      if (v16 >> 2 > v15) {
        unint64_t v15 = v16 >> 2;
      }
      BOOL v17 = (unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8;
      unint64_t v18 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v17) {
        unint64_t v18 = v15;
      }
      if (v18)
      {
        unint64_t v18 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v18);
        begin = v9->_sizes.__begin_;
        end = v9->_sizes.__end_;
      }
      else
      {
        uint64_t v19 = 0;
      }
      uint64_t v20 = (unint64_t *)(v18 + 8 * v14);
      value = (unint64_t *)(v18 + 8 * v19);
      *uint64_t v20 = 1;
      char v12 = v20 + 1;
      while (end != begin)
      {
        unint64_t v21 = *--end;
        *--uint64_t v20 = v21;
      }
      v9->_sizes.__begin_ = v20;
      v9->_sizes.__end_ = v12;
      v9->_sizes.__end_cap_.__value_ = value;
      if (begin)
      {
        operator delete(begin);
        value = v9->_sizes.__end_cap_.__value_;
      }
    }
    else
    {
      unint64_t *end = 1;
      char v12 = end + 1;
    }
    v9->_sizes.__end_ = v12;
    if (v12 >= value)
    {
      v23 = v9->_sizes.__begin_;
      uint64_t v24 = v12 - v23;
      unint64_t v25 = v24 + 1;
      if ((unint64_t)(v24 + 1) >> 61) {
        goto LABEL_64;
      }
      uint64_t v26 = (char *)value - (char *)v23;
      if (v26 >> 2 > v25) {
        unint64_t v25 = v26 >> 2;
      }
      BOOL v17 = (unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8;
      unint64_t v27 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v17) {
        unint64_t v27 = v25;
      }
      if (v27)
      {
        unint64_t v27 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v27);
        v23 = v9->_sizes.__begin_;
        char v12 = v9->_sizes.__end_;
      }
      else
      {
        uint64_t v28 = 0;
      }
      uint64_t v29 = (unint64_t *)(v27 + 8 * v24);
      value = (unint64_t *)(v27 + 8 * v28);
      *uint64_t v29 = a3;
      uint64_t v22 = v29 + 1;
      while (v12 != v23)
      {
        unint64_t v30 = *--v12;
        *--uint64_t v29 = v30;
      }
      v9->_sizes.__begin_ = v29;
      v9->_sizes.__end_ = v22;
      v9->_sizes.__end_cap_.__value_ = value;
      if (v23)
      {
        operator delete(v23);
        value = v9->_sizes.__end_cap_.__value_;
      }
    }
    else
    {
      unint64_t *v12 = a3;
      uint64_t v22 = v12 + 1;
    }
    v9->_sizes.__end_ = v22;
    if (v22 >= value)
    {
      id v32 = v9->_sizes.__begin_;
      uint64_t v33 = v22 - v32;
      unint64_t v34 = v33 + 1;
      if ((unint64_t)(v33 + 1) >> 61) {
        goto LABEL_64;
      }
      uint64_t v35 = (char *)value - (char *)v32;
      if (v35 >> 2 > v34) {
        unint64_t v34 = v35 >> 2;
      }
      BOOL v17 = (unint64_t)v35 >= 0x7FFFFFFFFFFFFFF8;
      unint64_t v36 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v17) {
        unint64_t v36 = v34;
      }
      if (v36)
      {
        unint64_t v36 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v36);
        id v32 = v9->_sizes.__begin_;
        uint64_t v22 = v9->_sizes.__end_;
      }
      else
      {
        uint64_t v37 = 0;
      }
      v38 = (unint64_t *)(v36 + 8 * v33);
      value = (unint64_t *)(v36 + 8 * v37);
      unint64_t *v38 = a5;
      unint64_t v31 = v38 + 1;
      while (v22 != v32)
      {
        unint64_t v39 = *--v22;
        *--v38 = v39;
      }
      v9->_sizes.__begin_ = v38;
      v9->_sizes.__end_ = v31;
      v9->_sizes.__end_cap_.__value_ = value;
      if (v32)
      {
        operator delete(v32);
        value = v9->_sizes.__end_cap_.__value_;
      }
    }
    else
    {
      *uint64_t v22 = a5;
      unint64_t v31 = v22 + 1;
    }
    v9->_sizes.__end_ = v31;
    if (v31 < value)
    {
      *unint64_t v31 = a4;
      v40 = v31 + 1;
LABEL_62:
      v9->_sizes.__end_ = v40;
      return v9;
    }
    v41 = v9->_sizes.__begin_;
    uint64_t v42 = v31 - v41;
    unint64_t v43 = v42 + 1;
    if (!((unint64_t)(v42 + 1) >> 61))
    {
      uint64_t v44 = (char *)value - (char *)v41;
      if (v44 >> 2 > v43) {
        unint64_t v43 = v44 >> 2;
      }
      BOOL v17 = (unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8;
      unint64_t v45 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v17) {
        unint64_t v45 = v43;
      }
      if (v45)
      {
        unint64_t v45 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v45);
        v41 = v9->_sizes.__begin_;
        unint64_t v31 = v9->_sizes.__end_;
      }
      else
      {
        uint64_t v46 = 0;
      }
      v47 = (unint64_t *)(v45 + 8 * v42);
      v48 = (unint64_t *)(v45 + 8 * v46);
      unint64_t *v47 = a4;
      v40 = v47 + 1;
      while (v31 != v41)
      {
        unint64_t v49 = *--v31;
        *--v47 = v49;
      }
      v9->_sizes.__begin_ = v47;
      v9->_sizes.__end_ = v40;
      v9->_sizes.__end_cap_.__value_ = v48;
      if (v41) {
        operator delete(v41);
      }
      goto LABEL_62;
    }
LABEL_64:
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  }
  return v9;
}

- (VisionCoreTensorShape)initWithBatchNumber:(unint64_t)a3 channels:(unint64_t)a4 height:(unint64_t)a5 width:(unint64_t)a6
{
  v53.receiver = self;
  v53.super_class = (Class)VisionCoreTensorShape;
  unint64_t v10 = [(VisionCoreTensorShape *)&v53 init];
  unint64_t v11 = v10;
  if (v10)
  {
    end = v10->_sizes.__end_;
    value = v10->_sizes.__end_cap_.__value_;
    if (end >= value)
    {
      begin = v10->_sizes.__begin_;
      uint64_t v16 = end - begin;
      unint64_t v17 = v16 + 1;
      if ((unint64_t)(v16 + 1) >> 61) {
        goto LABEL_64;
      }
      uint64_t v18 = (char *)value - (char *)begin;
      if (v18 >> 2 > v17) {
        unint64_t v17 = v18 >> 2;
      }
      BOOL v19 = (unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8;
      unint64_t v20 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v19) {
        unint64_t v20 = v17;
      }
      if (v20)
      {
        unint64_t v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v20);
        begin = v11->_sizes.__begin_;
        end = v11->_sizes.__end_;
      }
      else
      {
        uint64_t v21 = 0;
      }
      uint64_t v22 = (unint64_t *)(v20 + 8 * v16);
      value = (unint64_t *)(v20 + 8 * v21);
      *uint64_t v22 = a3;
      uint64_t v14 = v22 + 1;
      while (end != begin)
      {
        unint64_t v23 = *--end;
        *--uint64_t v22 = v23;
      }
      v11->_sizes.__begin_ = v22;
      v11->_sizes.__end_ = v14;
      v11->_sizes.__end_cap_.__value_ = value;
      if (begin)
      {
        operator delete(begin);
        value = v11->_sizes.__end_cap_.__value_;
      }
    }
    else
    {
      unint64_t *end = a3;
      uint64_t v14 = end + 1;
    }
    v11->_sizes.__end_ = v14;
    if (v14 >= value)
    {
      unint64_t v25 = v11->_sizes.__begin_;
      uint64_t v26 = v14 - v25;
      unint64_t v27 = v26 + 1;
      if ((unint64_t)(v26 + 1) >> 61) {
        goto LABEL_64;
      }
      uint64_t v28 = (char *)value - (char *)v25;
      if (v28 >> 2 > v27) {
        unint64_t v27 = v28 >> 2;
      }
      BOOL v19 = (unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8;
      unint64_t v29 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v19) {
        unint64_t v29 = v27;
      }
      if (v29)
      {
        unint64_t v29 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v29);
        unint64_t v25 = v11->_sizes.__begin_;
        uint64_t v14 = v11->_sizes.__end_;
      }
      else
      {
        uint64_t v30 = 0;
      }
      unint64_t v31 = (unint64_t *)(v29 + 8 * v26);
      value = (unint64_t *)(v29 + 8 * v30);
      *unint64_t v31 = a4;
      uint64_t v24 = v31 + 1;
      while (v14 != v25)
      {
        unint64_t v32 = *--v14;
        *--unint64_t v31 = v32;
      }
      v11->_sizes.__begin_ = v31;
      v11->_sizes.__end_ = v24;
      v11->_sizes.__end_cap_.__value_ = value;
      if (v25)
      {
        operator delete(v25);
        value = v11->_sizes.__end_cap_.__value_;
      }
    }
    else
    {
      unint64_t *v14 = a4;
      uint64_t v24 = v14 + 1;
    }
    v11->_sizes.__end_ = v24;
    if (v24 >= value)
    {
      unint64_t v34 = v11->_sizes.__begin_;
      uint64_t v35 = v24 - v34;
      unint64_t v36 = v35 + 1;
      if ((unint64_t)(v35 + 1) >> 61) {
        goto LABEL_64;
      }
      uint64_t v37 = (char *)value - (char *)v34;
      if (v37 >> 2 > v36) {
        unint64_t v36 = v37 >> 2;
      }
      BOOL v19 = (unint64_t)v37 >= 0x7FFFFFFFFFFFFFF8;
      unint64_t v38 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v19) {
        unint64_t v38 = v36;
      }
      if (v38)
      {
        unint64_t v38 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v38);
        unint64_t v34 = v11->_sizes.__begin_;
        uint64_t v24 = v11->_sizes.__end_;
      }
      else
      {
        uint64_t v39 = 0;
      }
      v40 = (unint64_t *)(v38 + 8 * v35);
      value = (unint64_t *)(v38 + 8 * v39);
      unint64_t *v40 = a5;
      uint64_t v33 = v40 + 1;
      while (v24 != v34)
      {
        unint64_t v41 = *--v24;
        *--v40 = v41;
      }
      v11->_sizes.__begin_ = v40;
      v11->_sizes.__end_ = v33;
      v11->_sizes.__end_cap_.__value_ = value;
      if (v34)
      {
        operator delete(v34);
        value = v11->_sizes.__end_cap_.__value_;
      }
    }
    else
    {
      *uint64_t v24 = a5;
      uint64_t v33 = v24 + 1;
    }
    v11->_sizes.__end_ = v33;
    if (v33 < value)
    {
      unint64_t *v33 = a6;
      uint64_t v42 = v33 + 1;
LABEL_62:
      v11->_sizes.__end_ = v42;
      return v11;
    }
    unint64_t v43 = v11->_sizes.__begin_;
    uint64_t v44 = v33 - v43;
    unint64_t v45 = v44 + 1;
    if (!((unint64_t)(v44 + 1) >> 61))
    {
      uint64_t v46 = (char *)value - (char *)v43;
      if (v46 >> 2 > v45) {
        unint64_t v45 = v46 >> 2;
      }
      BOOL v19 = (unint64_t)v46 >= 0x7FFFFFFFFFFFFFF8;
      unint64_t v47 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v19) {
        unint64_t v47 = v45;
      }
      if (v47)
      {
        unint64_t v47 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v47);
        unint64_t v43 = v11->_sizes.__begin_;
        uint64_t v33 = v11->_sizes.__end_;
      }
      else
      {
        uint64_t v48 = 0;
      }
      unint64_t v49 = (unint64_t *)(v47 + 8 * v44);
      v50 = (unint64_t *)(v47 + 8 * v48);
      *unint64_t v49 = a6;
      uint64_t v42 = v49 + 1;
      while (v33 != v43)
      {
        unint64_t v51 = *--v33;
        *--unint64_t v49 = v51;
      }
      v11->_sizes.__begin_ = v49;
      v11->_sizes.__end_ = v42;
      v11->_sizes.__end_cap_.__value_ = v50;
      if (v43) {
        operator delete(v43);
      }
      goto LABEL_62;
    }
LABEL_64:
    std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
  }
  return v11;
}

- (VisionCoreTensorShape)initWithSizes:(const unint64_t *)a3 rank:(unint64_t)a4
{
  v22.receiver = self;
  v22.super_class = (Class)VisionCoreTensorShape;
  unint64_t v6 = [(VisionCoreTensorShape *)&v22 init];
  uint64_t v7 = v6;
  if (v6) {
    BOOL v8 = a4 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    uint64_t v9 = 0;
    end = v6->_sizes.__end_;
    do
    {
      value = v7->_sizes.__end_cap_.__value_;
      if (end >= value)
      {
        begin = v7->_sizes.__begin_;
        uint64_t v14 = end - begin;
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
          begin = v7->_sizes.__begin_;
          end = v7->_sizes.__end_;
        }
        else
        {
          uint64_t v18 = 0;
        }
        BOOL v19 = (unint64_t *)(v17 + 8 * v14);
        *BOOL v19 = a3[v9];
        char v12 = v19 + 1;
        while (end != begin)
        {
          unint64_t v20 = *--end;
          *--BOOL v19 = v20;
        }
        v7->_sizes.__begin_ = v19;
        v7->_sizes.__end_ = v12;
        v7->_sizes.__end_cap_.__value_ = (unint64_t *)(v17 + 8 * v18);
        if (begin) {
          operator delete(begin);
        }
      }
      else
      {
        unint64_t *end = a3[v9];
        char v12 = end + 1;
      }
      v7->_sizes.__end_ = v12;
      ++v9;
      end = v12;
    }
    while (v9 != a4);
  }
  return v7;
}

- (unint64_t)elementCount
{
  begin = self->_sizes.__begin_;
  end = self->_sizes.__end_;
  if (begin == end) {
    return 0;
  }
  int v4 = 1;
  do
  {
    int v5 = *(_DWORD *)begin++;
    v4 *= v5;
  }
  while (begin != end);
  return v4;
}

- (const)sizes
{
  return self->_sizes.__begin_;
}

- (unint64_t)rank
{
  return self->_sizes.__end_ - self->_sizes.__begin_;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end