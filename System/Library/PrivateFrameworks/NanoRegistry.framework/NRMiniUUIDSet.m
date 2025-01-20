@interface NRMiniUUIDSet
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCapability:(unsigned int)a3;
- (BOOL)hasUUID:(id)a3;
- (NRMiniUUIDSet)initWithCoder:(id)a3;
- (NRMiniUUIDSet)initWithData:(id)a3;
- (NRMiniUUIDSet)initWithUUIDSet:(id)a3;
- (NSData)data;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
@end

@implementation NRMiniUUIDSet

- (NRMiniUUIDSet)initWithUUIDSet:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)NRMiniUUIDSet;
  v5 = [(NRMiniUUIDSet *)&v56 init];
  if (v5)
  {
    std::vector<unsigned int>::size_type v6 = [v4 count];
    if (v6)
    {
      v48 = (char **)(v5 + 8);
      std::vector<unsigned int>::reserve((std::vector<unsigned int> *)(v5 + 8), v6);
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v46 = v4;
      id obj = v4;
      uint64_t v7 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v53;
        uint64_t v47 = *(void *)v53;
        do
        {
          uint64_t v9 = 0;
          uint64_t v49 = v7;
          do
          {
            if (*(void *)v53 != v8) {
              objc_enumerationMutation(obj);
            }
            v10 = *(void **)(*((void *)&v52 + 1) + 8 * v9);
            v57[0] = 0;
            v57[1] = 0;
            objc_msgSend(v10, "getUUIDBytes:", v57, v46);
            int v51 = v57[0];
            v12 = (char *)*((void *)v5 + 1);
            v11 = (char *)*((void *)v5 + 2);
            uint64_t v13 = v11 - v12;
            if (v11 == v12)
            {
              v15 = (char *)*((void *)v5 + 2);
            }
            else
            {
              unint64_t v14 = v13 >> 2;
              v15 = (char *)*((void *)v5 + 1);
              do
              {
                unint64_t v16 = v14 >> 1;
                v17 = (unsigned int *)&v15[4 * (v14 >> 1)];
                unsigned int v19 = *v17;
                v18 = (char *)(v17 + 1);
                v14 += ~(v14 >> 1);
                if (LODWORD(v57[0]) < v19) {
                  unint64_t v14 = v16;
                }
                else {
                  v15 = v18;
                }
              }
              while (v14);
            }
            uint64_t v20 = v15 - v12;
            v21 = &v12[(v15 - v12) & 0xFFFFFFFFFFFFFFFCLL];
            unint64_t v22 = *((void *)v5 + 3);
            if ((unint64_t)v11 >= v22)
            {
              unint64_t v26 = (v13 >> 2) + 1;
              if (v26 >> 62) {
                std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
              }
              if ((uint64_t)(v22 - (void)v12) >> 1 > v26) {
                unint64_t v26 = (uint64_t)(v22 - (void)v12) >> 1;
              }
              if (v22 - (unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v27 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v27 = v26;
              }
              if (v27)
              {
                v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v27);
              }
              else
              {
                v29 = 0;
                uint64_t v28 = 0;
              }
              uint64_t v31 = v20 >> 2;
              v32 = &v29[4 * (v20 >> 2)];
              v33 = &v29[4 * v28];
              if (v20 >> 2 == v28)
              {
                if (v20 < 1)
                {
                  if (v15 == v12) {
                    unint64_t v35 = 1;
                  }
                  else {
                    unint64_t v35 = v20 >> 1;
                  }
                  v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v35);
                  v32 = &v36[v35 & 0xFFFFFFFFFFFFFFFCLL];
                  v33 = &v36[4 * v37];
                  if (v29) {
                    operator delete(v29);
                  }
                }
                else
                {
                  if (v31 >= -1) {
                    unint64_t v34 = v31 + 1;
                  }
                  else {
                    unint64_t v34 = v31 + 2;
                  }
                  v32 -= 4 * (v34 >> 1);
                }
              }
              *(_DWORD *)v32 = v51;
              v38 = v32 + 4;
              v39 = *v48;
              if (*v48 != v21)
              {
                v40 = v21;
                do
                {
                  int v41 = *((_DWORD *)v40 - 1);
                  v40 -= 4;
                  *((_DWORD *)v32 - 1) = v41;
                  v32 -= 4;
                }
                while (v40 != v39);
              }
              v42 = (char *)*((void *)v5 + 2);
              int64_t v43 = v42 - v21;
              if (v42 != v21) {
                memmove(v38, v21, v42 - v21);
              }
              v44 = (void *)*((void *)v5 + 1);
              *((void *)v5 + 1) = v32;
              *((void *)v5 + 2) = &v38[v43];
              *((void *)v5 + 3) = v33;
              uint64_t v7 = v49;
              uint64_t v8 = v47;
              if (v44) {
                operator delete(v44);
              }
            }
            else if (v21 == v11)
            {
              *(_DWORD *)v11 = v57[0];
              *((void *)v5 + 2) = v11 + 4;
            }
            else
            {
              v23 = v11 - 4;
              v24 = (_DWORD *)*((void *)v5 + 2);
              while (v23 < v11)
              {
                int v25 = *(_DWORD *)v23;
                v23 += 4;
                *v24++ = v25;
              }
              *((void *)v5 + 2) = v24;
              if (v11 != v21 + 4) {
                memmove(&v11[-4 * ((v11 - (v21 + 4)) >> 2)], &v12[(v15 - v12) & 0xFFFFFFFFFFFFFFFCLL], v11 - (v21 + 4));
              }
              v30 = &v51;
              if (v21 <= (char *)&v51) {
                v30 = &v51 + (*((void *)v5 + 2) > (unint64_t)&v51);
              }
              *(_DWORD *)v21 = *v30;
            }
            ++v9;
          }
          while (v9 != v7);
          uint64_t v7 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
        }
        while (v7);
      }

      id v4 = v46;
    }
  }

  return (NRMiniUUIDSet *)v5;
}

- (NRMiniUUIDSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  std::vector<unsigned int>::size_type v6 = [(NRMiniUUIDSet *)self initWithData:v5];

  return v6;
}

- (NRMiniUUIDSet)initWithData:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NRMiniUUIDSet;
  v5 = [(NRMiniUUIDSet *)&v25 init];
  if (v5 && (unint64_t)[v4 length] >= 4)
  {
    std::vector<unsigned int>::size_type v6 = (unint64_t)[v4 length] >> 2;
    std::vector<unsigned int>::reserve((std::vector<unsigned int> *)(v5 + 8), v6);
    uint64_t v7 = *((void *)v5 + 1);
    uint64_t v8 = *((void *)v5 + 2);
    unint64_t v9 = (v8 - v7) >> 2;
    if (v6 <= v9)
    {
      if (v6 >= v9)
      {
LABEL_19:
        memcpy(*((void **)v5 + 1), (const void *)[v4 bytes], *((void *)v5 + 3) - *((void *)v5 + 1));
        goto LABEL_20;
      }
      std::vector<unsigned int>::size_type v23 = v7 + 4 * v6;
    }
    else
    {
      std::vector<unsigned int>::size_type v10 = v6 - v9;
      uint64_t v11 = *((void *)v5 + 3);
      if (v6 - v9 > (v11 - v8) >> 2)
      {
        uint64_t v12 = v11 - v7;
        uint64_t v13 = v12 >> 1;
        if (v12 >> 1 <= v6) {
          uint64_t v13 = v6;
        }
        if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v14 = v13;
        }
        v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v14);
        unint64_t v16 = (char *)*((void *)v5 + 1);
        v17 = (char *)*((void *)v5 + 2);
        v18 = &v15[4 * v9];
        uint64_t v20 = &v15[4 * v19];
        bzero(v18, 4 * v10);
        v21 = &v18[4 * v10];
        while (v17 != v16)
        {
          int v22 = *((_DWORD *)v17 - 1);
          v17 -= 4;
          *((_DWORD *)v18 - 1) = v22;
          v18 -= 4;
        }
        *((void *)v5 + 1) = v18;
        *((void *)v5 + 2) = v21;
        *((void *)v5 + 3) = v20;
        if (v16) {
          operator delete(v16);
        }
        goto LABEL_19;
      }
      bzero(*((void **)v5 + 2), 4 * v10);
      std::vector<unsigned int>::size_type v23 = v8 + 4 * v10;
    }
    *((void *)v5 + 2) = v23;
    goto LABEL_19;
  }
LABEL_20:

  return (NRMiniUUIDSet *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  begin = self->_miniUUIDs.__begin_;
  if (self->_miniUUIDs.__end_ != begin)
  {
    id v7 = v4;
    std::vector<unsigned int>::size_type v6 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:begin length:(char *)self->_miniUUIDs.__end_cap_.__value_ - (char *)begin];
    [v7 encodeObject:v6 forKey:@"data"];

    id v4 = v7;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(NRMiniUUIDSet);
  v5 = v4;
  if (v4 != self)
  {
    p_miniUUIDs = &v4->_miniUUIDs;
    begin = (char *)v4->_miniUUIDs.__begin_;
    uint64_t v8 = self->_miniUUIDs.__begin_;
    end = self->_miniUUIDs.__end_;
    int64_t v10 = (char *)end - (char *)v8;
    unint64_t v11 = end - v8;
    uint64_t value = (uint64_t)v4->_miniUUIDs.__end_cap_.__value_;
    if (v11 <= (value - (uint64_t)begin) >> 2)
    {
      p_end = (void **)&v4->_miniUUIDs.__end_;
      v21 = v4->_miniUUIDs.__end_;
      unint64_t v22 = ((char *)v21 - begin) >> 2;
      if (v22 >= v11)
      {
        if (end != v8) {
          memmove(v4->_miniUUIDs.__begin_, v8, (char *)end - (char *)v8);
        }
        goto LABEL_23;
      }
      std::vector<unsigned int>::size_type v23 = &v8[v22];
      if (v21 != (unsigned int *)begin)
      {
        memmove(v4->_miniUUIDs.__begin_, v8, (char *)v21 - begin);
        begin = (char *)*p_end;
      }
      v18 = begin;
      if (v23 != end)
      {
        v18 = begin;
        v24 = begin;
        do
        {
          int v25 = *v23++;
          *(_DWORD *)v24 = v25;
          v24 += 4;
          v18 += 4;
        }
        while (v23 != end);
      }
    }
    else
    {
      if (begin)
      {
        v4->_miniUUIDs.__end_ = (unsigned int *)begin;
        operator delete(begin);
        uint64_t value = 0;
        p_miniUUIDs->__begin_ = 0;
        v5->_miniUUIDs.__end_ = 0;
        v5->_miniUUIDs.__end_cap_.__value_ = 0;
      }
      if (v10 < 0) {
        goto LABEL_27;
      }
      uint64_t v13 = value >> 1;
      if (value >> 1 <= v11) {
        uint64_t v13 = end - v8;
      }
      unint64_t v14 = (unint64_t)value >= 0x7FFFFFFFFFFFFFFCLL ? 0x3FFFFFFFFFFFFFFFLL : v13;
      if (v14 >> 62) {
LABEL_27:
      }
        std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v14);
      begin = v15;
      v5->_miniUUIDs.__begin_ = (unsigned int *)v15;
      p_end = (void **)&v5->_miniUUIDs.__end_;
      v5->_miniUUIDs.__end_cap_.__value_ = (unsigned int *)&v15[4 * v17];
      v18 = v15;
      if (v8 != end)
      {
        v18 = v15;
        uint64_t v19 = v15;
        do
        {
          int v20 = *v8++;
          *v19++ = v20;
          v18 += 4;
        }
        while (v8 != end);
      }
    }
    int64_t v10 = v18 - begin;
LABEL_23:
    *p_end = &begin[v10];
  }
  return v5;
}

- (BOOL)hasUUID:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14[0] = 0;
  v14[1] = 0;
  [v4 getUUIDBytes:v14];
  begin = self->_miniUUIDs.__begin_;
  end = self->_miniUUIDs.__end_;
  if (end == begin) {
    goto LABEL_9;
  }
  unint64_t v7 = end - begin;
  do
  {
    unint64_t v8 = v7 >> 1;
    unint64_t v9 = &begin[v7 >> 1];
    unsigned int v11 = *v9;
    int64_t v10 = v9 + 1;
    v7 += ~(v7 >> 1);
    if (v11 < LODWORD(v14[0])) {
      begin = v10;
    }
    else {
      unint64_t v7 = v8;
    }
  }
  while (v7);
  if (begin == end) {
LABEL_9:
  }
    BOOL v12 = 0;
  else {
    BOOL v12 = LODWORD(v14[0]) >= *begin;
  }

  return v12;
}

- (BOOL)hasCapability:(unsigned int)a3
{
  begin = self->_miniUUIDs.__begin_;
  end = self->_miniUUIDs.__end_;
  if (end == begin) {
    return 0;
  }
  unint64_t v5 = end - begin;
  do
  {
    unint64_t v6 = v5 >> 1;
    unint64_t v7 = &begin[v5 >> 1];
    unsigned int v9 = *v7;
    unint64_t v8 = v7 + 1;
    v5 += ~(v5 >> 1);
    if (v9 < a3) {
      begin = v8;
    }
    else {
      unint64_t v5 = v6;
    }
  }
  while (v5);
  return begin != end && *begin <= a3;
}

- (NSData)data
{
  return (NSData *)[MEMORY[0x1E4F1C9B8] dataWithBytes:self->_miniUUIDs.__begin_ length:(char *)self->_miniUUIDs.__end_cap_.__value_ - (char *)self->_miniUUIDs.__begin_];
}

- (id)description
{
  v3 = (void *)[@"Mini Capabilities: " mutableCopy];
  begin = self->_miniUUIDs.__begin_;
  if (self->_miniUUIDs.__end_ != begin)
  {
    unint64_t v5 = 0;
    do
    {
      if (v5)
      {
        [v3 appendString:@", "];
        begin = self->_miniUUIDs.__begin_;
      }
      objc_msgSend(v3, "appendFormat:", @"%X-", bswap32(begin[v5++]));
      begin = self->_miniUUIDs.__begin_;
    }
    while (v5 < self->_miniUUIDs.__end_ - begin);
  }

  return v3;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  begin = self->_miniUUIDs.__begin_;
  if (begin)
  {
    self->_miniUUIDs.__end_ = begin;
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