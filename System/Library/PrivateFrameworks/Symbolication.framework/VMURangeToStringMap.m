@interface VMURangeToStringMap
+ (BOOL)supportsSecureCoding;
- (VMURangeToStringMap)init;
- (VMURangeToStringMap)initWithCoder:(id)a3;
- (_VMURange)rangeContainingAddress:(unint64_t)a3;
- (_VMURange)rangeForString:(id)a3 startingAtAddress:(unint64_t)a4;
- (id).cxx_construct;
- (id)description;
- (id)stringForAddress:(unint64_t)a3;
- (id)stringForIndex:(unsigned int)a3;
- (unsigned)count;
- (unsigned)indexForString:(id)a3 insertIfMissing:(BOOL)a4;
- (unsigned)uniquedStringCount;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateHexAddressesInStrings:(id)a3;
- (void)enumerateRanges:(id)a3;
- (void)resymbolicateStringsWithSymbolicator:(_CSTypeRef)a3;
- (void)setString:(id)a3 forRange:(_VMURange)a4;
- (void)sort;
@end

@implementation VMURangeToStringMap

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VMURangeToStringMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)VMURangeToStringMap;
  v2 = [(VMURangeToStringMap *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    strings = v2->_strings;
    v2->_strings = v3;

    v2->_sorted = 1;
  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [NSNumber numberWithUnsignedInt:1];
  [v4 encodeObject:v5 forKey:@"classVersion"];

  objc_super v6 = objc_opt_new();
  [v6 serialize32:-[VMURangeToStringMap count](self, "count")];
  begin = self->_rangeAndStringVector.__begin_;
  end = self->_rangeAndStringVector.__end_;
  while (begin != end)
  {
    uint64_t v9 = *((void *)begin + 1);
    uint64_t v10 = *((unsigned int *)begin + 4);
    [v6 serialize64:*(void *)begin];
    [v6 serialize64:v9];
    [v6 serialize32:v10];
    begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 24);
  }
  [v6 serialize32:-[VMURangeToStringMap uniquedStringCount](self, "uniquedStringCount")];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v11 = self->_strings;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v11);
        }
        [v6 serializeString:*(void *)(*((void *)&v16 + 1) + 8 * v14++), (void)v16];
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  v15 = (void *)[v6 copyContiguousData];
  [v4 encodeObject:v15 forKey:@"simpleSerializerData"];
}

- (VMURangeToStringMap)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(VMURangeToStringMap *)self init];
  objc_super v6 = v5;
  if (!v5) {
    goto LABEL_8;
  }
  v5->_sorted = 0;
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"classVersion"];
  int v8 = [v7 unsignedIntValue];

  if (v8 == 1)
  {
    v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"simpleSerializerData"];
    uint64_t v9 = [[VMUSimpleDeserializer alloc] initWithData:v39];
    id v47 = 0;
    unsigned int v10 = [(VMUSimpleDeserializer *)v9 deserialize32WithError:&v47];
    id v11 = v47;
    if (!v11)
    {
      if (v10)
      {
        int v16 = 0;
        p_begin = (void **)&v6->_rangeAndStringVector.__begin_;
        uint64_t p_end_cap = (uint64_t)&v6->_rangeAndStringVector.__end_cap_;
        while (1)
        {
          id v46 = 0;
          uint64_t v18 = -[VMUSimpleDeserializer deserialize64WithError:](v9, "deserialize64WithError:", &v46, p_end_cap);
          id v11 = v46;
          if (v11) {
            break;
          }
          id v45 = 0;
          uint64_t v19 = [(VMUSimpleDeserializer *)v9 deserialize64WithError:&v45];
          id v11 = v45;
          if (v11) {
            break;
          }
          id v44 = 0;
          unsigned int v20 = [(VMUSimpleDeserializer *)v9 deserialize32WithError:&v44];
          id v11 = v44;
          if (v11) {
            break;
          }
          end = (char *)v6->_rangeAndStringVector.__end_;
          value = v6->_rangeAndStringVector.__end_cap_.__value_;
          if (end >= (char *)value)
          {
            begin = (char *)*p_begin;
            unint64_t v25 = 0xAAAAAAAAAAAAAAABLL * ((end - (unsigned char *)*p_begin) >> 3);
            unint64_t v26 = v25 + 1;
            if (v25 + 1 > 0xAAAAAAAAAAAAAAALL) {
              std::vector<_CSTypeRef>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v27 = 0xAAAAAAAAAAAAAAABLL * ((value - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)begin) >> 3);
            if (2 * v27 > v26) {
              unint64_t v26 = 2 * v27;
            }
            if (v27 >= 0x555555555555555) {
              unint64_t v28 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v28 = v26;
            }
            if (v28)
            {
              v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAndString>>(p_end_cap, v28);
              begin = (char *)v6->_rangeAndStringVector.__begin_;
              end = (char *)v6->_rangeAndStringVector.__end_;
            }
            else
            {
              v29 = 0;
            }
            v30 = &v29[24 * v25];
            *(void *)v30 = v18;
            *((void *)v30 + 1) = v19;
            *((_DWORD *)v30 + 4) = v20;
            v31 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v30;
            if (end != begin)
            {
              do
              {
                long long v32 = *(_OWORD *)(end - 24);
                *((void *)v31 - 1) = *((void *)end - 1);
                *(_OWORD *)((char *)v31 - 24) = v32;
                v31 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v31 - 24);
                end -= 24;
              }
              while (end != begin);
              begin = (char *)*p_begin;
            }
            v23 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v30 + 24);
            v6->_rangeAndStringVector.__begin_ = v31;
            v6->_rangeAndStringVector.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v30 + 24);
            v6->_rangeAndStringVector.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v29[24 * v28];
            if (begin) {
              operator delete(begin);
            }
          }
          else
          {
            *(void *)end = v18;
            *((void *)end + 1) = v19;
            v23 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(end + 24);
            *((_DWORD *)end + 4) = v20;
          }
          v6->_rangeAndStringVector.__end_ = v23;
          if (++v16 == v10) {
            goto LABEL_32;
          }
        }
      }
      else
      {
LABEL_32:
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)&v6->_stringToIndexMap, vcvtps_u32_f32((float)v10 / v6->_stringToIndexMap.__table_.__p3_.__value_));
        id v43 = 0;
        unsigned int v33 = [(VMUSimpleDeserializer *)v9 deserialize32WithError:&v43];
        id v11 = v43;
        if (!v11)
        {
          uint64_t v34 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v33];
          strings = v6->_strings;
          v6->_strings = (NSMutableArray *)v34;

          int v42 = 0;
          if (!v33)
          {
LABEL_36:
            int v13 = 0;
            uint64_t v12 = 0;
LABEL_6:

            if (v13) {
              goto LABEL_7;
            }
LABEL_8:
            uint64_t v14 = v6;
            goto LABEL_9;
          }
          while (1)
          {
            id v40 = 0;
            id v36 = [(VMUSimpleDeserializer *)v9 copyDeserializedStringWithError:&v40];
            id v37 = v40;
            id v41 = v36;
            if (v37) {
              break;
            }
            [(NSMutableArray *)v6->_strings addObject:v36];
            std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::__emplace_unique_key_args<NSString * {__strong},NSString * {__strong}&,unsigned int &>((uint64_t)&v6->_stringToIndexMap, &v41, &v41, &v42);

            if (++v42 >= v33) {
              goto LABEL_36;
            }
          }
          uint64_t v12 = v37;

LABEL_5:
          int v13 = 1;
          goto LABEL_6;
        }
      }
    }
    uint64_t v12 = v11;
    goto LABEL_5;
  }
LABEL_7:
  uint64_t v14 = 0;
LABEL_9:

  return v14;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  for (i = self->_rangeAndStringVector.__begin_;
        i != self->_rangeAndStringVector.__end_;
        i = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)i + 24))
  {
    uint64_t v5 = *(void *)i;
    uint64_t v6 = *((void *)i + 1);
    uint64_t v7 = *((unsigned int *)i + 4);
    int v8 = [(NSMutableArray *)self->_strings objectAtIndexedSubscript:v7];
    [v3 appendFormat:@"%#llx-%#llx[%llu] stringID %u %@\n", v5, v6 + v5, v6, v7, v8];
  }

  return v3;
}

- (unsigned)count
{
  return -1431655765
       * ((unint64_t)(self->_rangeAndStringVector.__end_ - self->_rangeAndStringVector.__begin_) >> 3);
}

- (unsigned)uniquedStringCount
{
  return [(NSMutableArray *)self->_strings count];
}

- (void)sort
{
  if (!self->_sorted)
  {
    begin = self->_rangeAndStringVector.__begin_;
    end = self->_rangeAndStringVector.__end_;
    unint64_t v6 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3));
    int v8 = (uint64_t (*)(long long *, long long *))CompareRangeAndString;
    if (end == begin) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = v6;
    }
    std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(RangeAndString const&,RangeAndString const&),RangeAndString*,false>((uint64_t)begin, (__n128 *)end, &v8, v7, 1, v2);
    self->_sorted = 1;
  }
}

- (unsigned)indexForString:(id)a3 insertIfMissing:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  if (!v10) {
    return -1;
  }
  unint64_t v6 = std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::find<NSString * {__strong}>(&self->_stringToIndexMap.__table_.__bucket_list_.__ptr_.__value_, &v10);
  if (v6)
  {
    unsigned int v7 = *((_DWORD *)v6 + 6);
  }
  else if (v4)
  {
    [(NSMutableArray *)self->_strings addObject:v10];
    unsigned int v9 = [(NSMutableArray *)self->_strings count] - 1;
    std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::__emplace_unique_key_args<NSString * {__strong},NSString * {__strong}&,unsigned int &>((uint64_t)&self->_stringToIndexMap, &v10, &v10, &v9);
    unsigned int v7 = v9;
  }
  else
  {
    unsigned int v7 = -1;
  }

  return v7;
}

- (void)setString:(id)a3 forRange:(_VMURange)a4
{
  unint64_t length = a4.length;
  unint64_t location = a4.location;
  id v7 = a3;
  if (v7)
  {
    id v23 = v7;
    unsigned int v8 = [(VMURangeToStringMap *)self indexForString:v7 insertIfMissing:1];
    if (self->_sorted
      && [(VMURangeToStringMap *)self count]
      && location < *((void *)self->_rangeAndStringVector.__end_ - 2)
                  + *((void *)self->_rangeAndStringVector.__end_ - 3))
    {
      self->_sorted = 0;
    }
    value = self->_rangeAndStringVector.__end_cap_.__value_;
    end = self->_rangeAndStringVector.__end_;
    if (end >= value)
    {
      begin = self->_rangeAndStringVector.__begin_;
      unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      unint64_t v14 = v13 + 1;
      if (v13 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<_CSTypeRef>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((value - begin) >> 3);
      if (2 * v15 > v14) {
        unint64_t v14 = 2 * v15;
      }
      if (v15 >= 0x555555555555555) {
        unint64_t v16 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v16 = v14;
      }
      if (v16) {
        long long v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RangeAndString>>((uint64_t)&self->_rangeAndStringVector.__end_cap_, v16);
      }
      else {
        long long v17 = 0;
      }
      uint64_t v18 = &v17[24 * v13];
      uint64_t v19 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v17[24 * v16];
      *(void *)uint64_t v18 = location;
      *((void *)v18 + 1) = length;
      *((_DWORD *)v18 + 4) = v8;
      *((_DWORD *)v18 + 5) = 0;
      id v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v18 + 24);
      uint64_t v21 = self->_rangeAndStringVector.__begin_;
      unsigned int v20 = self->_rangeAndStringVector.__end_;
      if (v20 != v21)
      {
        do
        {
          long long v22 = *(_OWORD *)((char *)v20 - 24);
          *((void *)v18 - 1) = *((void *)v20 - 1);
          *(_OWORD *)(v18 - 24) = v22;
          v18 -= 24;
          unsigned int v20 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v20 - 24);
        }
        while (v20 != v21);
        unsigned int v20 = self->_rangeAndStringVector.__begin_;
      }
      self->_rangeAndStringVector.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v18;
      self->_rangeAndStringVector.__end_ = v11;
      self->_rangeAndStringVector.__end_cap_.__value_ = v19;
      if (v20) {
        operator delete(v20);
      }
    }
    else
    {
      *(void *)end = location;
      *((void *)end + 1) = length;
      id v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 24);
      *((_DWORD *)end + 4) = v8;
      *((_DWORD *)end + 5) = 0;
    }
    self->_rangeAndStringVector.__end_ = v11;
    id v7 = v23;
  }
}

- (id)stringForAddress:(unint64_t)a3
{
  if (!self->_sorted) {
    [(VMURangeToStringMap *)self sort];
  }
  begin = self->_rangeAndStringVector.__begin_;
  uint64_t v6 = self->_rangeAndStringVector.__end_ - begin;
  if (!v6) {
    goto LABEL_12;
  }
  unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 3);
  unsigned int v8 = self->_rangeAndStringVector.__begin_;
  do
  {
    unint64_t v9 = v7 >> 1;
    id v10 = (unint64_t *)((char *)v8 + 24 * (v7 >> 1));
    unint64_t v12 = *v10;
    id v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v10 + 3);
    v7 += ~(v7 >> 1);
    if (v12 > a3) {
      unint64_t v7 = v9;
    }
    else {
      unsigned int v8 = v11;
    }
  }
  while (v7);
  if (v8 == begin || a3 - *((void *)v8 - 3) >= *((void *)v8 - 2))
  {
LABEL_12:
    unint64_t v13 = 0;
  }
  else
  {
    unint64_t v13 = [(NSMutableArray *)self->_strings objectAtIndexedSubscript:*((unsigned int *)v8 - 2)];
  }

  return v13;
}

- (_VMURange)rangeContainingAddress:(unint64_t)a3
{
  if (!self->_sorted) {
    [(VMURangeToStringMap *)self sort];
  }
  begin = self->_rangeAndStringVector.__begin_;
  uint64_t v6 = self->_rangeAndStringVector.__end_ - begin;
  if (!v6) {
    goto LABEL_11;
  }
  unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 3);
  unsigned int v8 = self->_rangeAndStringVector.__begin_;
  do
  {
    unint64_t v9 = v7 >> 1;
    id v10 = (unint64_t *)((char *)v8 + 24 * (v7 >> 1));
    unint64_t v12 = *v10;
    id v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v10 + 3);
    v7 += ~(v7 >> 1);
    if (v12 > a3) {
      unint64_t v7 = v9;
    }
    else {
      unsigned int v8 = v11;
    }
  }
  while (v7);
  if (v8 == begin || (uint64_t v13 = *((void *)v8 - 3), v14 = *((void *)v8 - 2), a3 - v13 >= v14))
  {
LABEL_11:
    unint64_t v14 = 0;
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  result.unint64_t length = v14;
  result.unint64_t location = v13;
  return result;
}

- (_VMURange)rangeForString:(id)a3 startingAtAddress:(unint64_t)a4
{
  id v6 = a3;
  unsigned int v7 = [(VMURangeToStringMap *)self indexForString:v6 insertIfMissing:0];
  if (v7 != -1)
  {
    if (!self->_sorted) {
      [(VMURangeToStringMap *)self sort];
    }
    begin = self->_rangeAndStringVector.__begin_;
    end = self->_rangeAndStringVector.__end_;
    if (end != begin)
    {
      unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      do
      {
        unint64_t v11 = v10 >> 1;
        unint64_t v12 = (unint64_t *)((char *)begin + 24 * (v10 >> 1));
        unint64_t v14 = *v12;
        uint64_t v13 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v12 + 3);
        v10 += ~(v10 >> 1);
        if (v14 > a4) {
          unint64_t v10 = v11;
        }
        else {
          begin = v13;
        }
      }
      while (v10);
    }
    while (begin != end)
    {
      if (*((_DWORD *)begin + 4) == v7)
      {
        uint64_t v16 = *(void *)begin;
        unint64_t v15 = *((void *)begin + 1);
        goto LABEL_15;
      }
      begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 24);
    }
  }
  unint64_t v15 = 0;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:

  unint64_t v17 = v16;
  unint64_t v18 = v15;
  result.unint64_t length = v18;
  result.unint64_t location = v17;
  return result;
}

- (id)stringForIndex:(unsigned int)a3
{
  return (id)[(NSMutableArray *)self->_strings objectAtIndexedSubscript:a3];
}

- (void)resymbolicateStringsWithSymbolicator:(_CSTypeRef)a3
{
  uint64_t v4 = [(NSMutableArray *)self->_strings count];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      unsigned int v7 = [(NSMutableArray *)self->_strings objectAtIndexedSubscript:i];
      if ([v7 hasPrefix:@"0x"])
      {
        uint64_t v8 = [v7 rangeOfString:@" "];
        unint64_t v9 = [v7 substringToIndex:v8];
        if (checkStringIsValidHexAddress(v9))
        {
          strtoll((const char *)[v9 UTF8String], 0, 16);
          CSSymbolicatorGetSymbolWithAddressAtTime();
          if ((CSIsNull() & 1) == 0 && (CSSymbolIsUnnamed() & 1) == 0)
          {
            unint64_t v10 = [NSString stringWithUTF8String:CSSymbolGetName()];
            unint64_t v11 = [v7 stringByReplacingCharactersInRange:v8 withString:v10];

            [(NSMutableArray *)self->_strings setObject:v11 atIndexedSubscript:i];
          }
        }
      }
    }
  }
}

- (void)enumerateRanges:(id)a3
{
  id v6 = a3;
  begin = self->_rangeAndStringVector.__begin_;
  for (uint64_t i = self->_rangeAndStringVector.__end_;
        begin != i;
        begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 24))
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, *(void *)begin, *((void *)begin + 1));
  }
}

- (void)enumerateHexAddressesInStrings:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, uint64_t))a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_strings;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        unint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 hasPrefix:@"0x" v13])
        {
          uint64_t v10 = [v9 rangeOfString:@" "];
          if (v10 != 0x7FFFFFFFFFFFFFFFLL)
          {
            unint64_t v11 = [v9 substringToIndex:v10];
            if (checkStringIsValidHexAddress(v11))
            {
              uint64_t v12 = strtoll((const char *)[v11 UTF8String], 0, 16);
              v4[2](v4, v12);
            }
          }
        }
      }
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  begin = self->_rangeAndStringVector.__begin_;
  if (begin)
  {
    self->_rangeAndStringVector.__end_ = begin;
    operator delete(begin);
  }
  std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::~__hash_table((uint64_t)&self->_stringToIndexMap);

  objc_storeStrong((id *)&self->_strings, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 7) = 0;
  return self;
}

@end