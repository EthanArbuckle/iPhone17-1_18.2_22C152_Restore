@interface VMUNodeToStringMap
+ (BOOL)supportsSecureCoding;
- (VMUNodeToStringMap)init;
- (VMUNodeToStringMap)initWithCoder:(id)a3;
- (id).cxx_construct;
- (id)description;
- (id)stringForNode:(unsigned int)a3;
- (unsigned)_indexForString:(id)a3;
- (unsigned)count;
- (unsigned)uniquedStringCount;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateHexAddressesInStrings:(id)a3;
- (void)resymbolicateObjectDescriptionStringsWithGraph:(id)a3;
- (void)setString:(id)a3 forNode:(unsigned int)a4;
@end

@implementation VMUNodeToStringMap

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VMUNodeToStringMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)VMUNodeToStringMap;
  v2 = [(VMUNodeToStringMap *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    strings = v2->_strings;
    v2->_strings = v3;
  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [NSNumber numberWithUnsignedInt:1];
  [v4 encodeObject:v5 forKey:@"classVersion"];

  objc_super v6 = objc_opt_new();
  [v6 serialize32:-[VMUNodeToStringMap count](self, "count")];
  p_p1 = &self->_nodeToStringIndexMap.__table_.__p1_;
  while (1)
  {
    p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned int, unsigned int>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned int, unsigned int>, void *>>> *)p_p1->__value_.__next_;
    if (!p_p1) {
      break;
    }
    uint64_t next_high = HIDWORD(p_p1[2].__value_.__next_);
    [v6 serialize32:LODWORD(p_p1[2].__value_.__next_)];
    [v6 serialize32:next_high];
  }
  [v6 serialize32:-[VMUNodeToStringMap uniquedStringCount](self, "uniquedStringCount")];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v9 = self->_strings;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        [v6 serializeString:*(void *)(*((void *)&v14 + 1) + 8 * v12++), (void)v14];
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  v13 = (void *)[v6 copyContiguousData];
  [v4 encodeObject:v13 forKey:@"simpleSerializerData"];
}

- (VMUNodeToStringMap)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(VMUNodeToStringMap *)self init];
  if (!v5) {
    goto LABEL_8;
  }
  objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"classVersion"];
  int v7 = [v6 unsignedIntValue];

  if (v7 == 1)
  {
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"simpleSerializerData"];
    v9 = [[VMUSimpleDeserializer alloc] initWithData:v8];
    id v30 = 0;
    unsigned int v10 = [(VMUSimpleDeserializer *)v9 deserialize32WithError:&v30];
    id v11 = v30;
    if (!v11)
    {
      float v16 = (float)v10;
      std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)&v5->_nodeToStringIndexMap, vcvtps_u32_f32((float)v10 / v5->_nodeToStringIndexMap.__table_.__p3_.__value_));
      if (v10)
      {
        while (1)
        {
          LODWORD(v25) = 0;
          id v29 = 0;
          unsigned int v17 = [(VMUSimpleDeserializer *)v9 deserialize32WithError:&v29];
          id v11 = v29;
          LODWORD(v25) = v17;
          if (v11) {
            break;
          }
          int v28 = 0;
          id v27 = 0;
          int v18 = [(VMUSimpleDeserializer *)v9 deserialize32WithError:&v27];
          id v11 = v27;
          int v28 = v18;
          if (v11) {
            break;
          }
          std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,unsigned int &,unsigned int &>((uint64_t)&v5->_nodeToStringIndexMap, (unsigned int *)&v25, &v25, &v28);
          if (!--v10) {
            goto LABEL_14;
          }
        }
      }
      else
      {
LABEL_14:
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__rehash<true>((uint64_t)&v5->_stringToIndexMap, vcvtps_u32_f32(v16 / v5->_stringToIndexMap.__table_.__p3_.__value_));
        id v26 = 0;
        unsigned int v19 = [(VMUSimpleDeserializer *)v9 deserialize32WithError:&v26];
        id v11 = v26;
        if (!v11)
        {
          uint64_t v20 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v19];
          strings = v5->_strings;
          v5->_strings = (NSMutableArray *)v20;

          int v28 = 0;
          if (!v19)
          {
LABEL_20:
            int v13 = 0;
            uint64_t v12 = 0;
LABEL_6:

            if (v13) {
              goto LABEL_7;
            }
LABEL_8:
            long long v14 = v5;
            goto LABEL_9;
          }
          while (1)
          {
            id v24 = 0;
            v22 = [(VMUSimpleDeserializer *)v9 copyDeserializedStringWithError:&v24];
            id v23 = v24;
            v25 = v22;
            if (v23) {
              break;
            }
            if (!v22)
            {
              v25 = &stru_1EFE27F38;

              v22 = v25;
            }
            [(NSMutableArray *)v5->_strings addObject:v22];
            std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::__emplace_unique_key_args<NSString * {__strong},NSString * {__strong}&,unsigned int &>((uint64_t)&v5->_stringToIndexMap, (id *)&v25, (id *)&v25, &v28);

            if (++v28 >= v19) {
              goto LABEL_20;
            }
          }
          uint64_t v12 = v23;

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
  long long v14 = 0;
LABEL_9:

  return v14;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  for (i = (void **)self->_nodeToStringIndexMap.__table_.__p1_.__value_.__next_; i; i = (void **)*i)
  {
    uint64_t v6 = *((unsigned int *)i + 4);
    uint64_t v5 = *((unsigned int *)i + 5);
    int v7 = [(NSMutableArray *)self->_strings objectAtIndexedSubscript:v5];
    [v3 appendFormat:@"%u  stringID %u %@\n", v6, v5, v7];
  }

  return v3;
}

- (unsigned)count
{
  return self->_nodeToStringIndexMap.__table_.__p2_.__value_;
}

- (unsigned)uniquedStringCount
{
  return [(NSMutableArray *)self->_strings count];
}

- (unsigned)_indexForString:(id)a3
{
  id v10 = a3;
  p_stringToIndexMap = &self->_stringToIndexMap;
  uint64_t v5 = std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::find<NSString * {__strong}>(&self->_stringToIndexMap.__table_.__bucket_list_.__ptr_.__value_, &v10);
  if (v5)
  {
    uint64_t v6 = (unsigned int *)(v5 + 3);
  }
  else
  {
    [(NSMutableArray *)self->_strings addObject:v10];
    int v9 = [(NSMutableArray *)self->_strings count] - 1;
    uint64_t v6 = (unsigned int *)&v9;
    std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::__emplace_unique_key_args<NSString * {__strong},NSString * {__strong}&,unsigned int &>((uint64_t)p_stringToIndexMap, &v10, &v10, &v9);
  }
  unsigned int v7 = *v6;

  return v7;
}

- (void)setString:(id)a3 forNode:(unsigned int)a4
{
  id v6 = a3;
  unsigned int v8 = a4;
  if (v6)
  {
    unsigned int v7 = [(VMUNodeToStringMap *)self _indexForString:v6];
    std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,unsigned int &,unsigned int &>((uint64_t)&self->_nodeToStringIndexMap, &v8, &v8, (int *)&v7);
  }
}

- (id)stringForNode:(unsigned int)a3
{
  unsigned int v8 = a3;
  p_nodeToStringIndexMap = &self->_nodeToStringIndexMap;
  uint64_t v5 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::find<unsigned int>(&self->_nodeToStringIndexMap.__table_.__bucket_list_.__ptr_.__value_, &v8);
  if (v5)
  {
    id v6 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::find<unsigned int>(p_nodeToStringIndexMap, &v8);
    if (!v6) {
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    }
    uint64_t v5 = [(NSMutableArray *)self->_strings objectAtIndexedSubscript:*((unsigned int *)v6 + 5)];
  }

  return v5;
}

- (void)resymbolicateObjectDescriptionStringsWithGraph:(id)a3
{
  id v4 = a3;
  int v13 = self;
  LODWORD(self) = [(NSMutableArray *)self->_strings count];
  uint64_t v5 = malloc_type_calloc(1uLL, ((self + 7) >> 3) + 4, 0xFF42C4F3uLL);
  _DWORD *v5 = self;
  id v6 = [v4 symbolStore];
  [v6 symbolicator];

  next = (void **)v13->_nodeToStringIndexMap.__table_.__p1_.__value_.__next_;
  if (next)
  {
    while (1)
    {
      uint64_t v8 = *((unsigned int *)next + 4);
      unint64_t v9 = *((unsigned int *)next + 5);
      if (*v5 <= v9) {
        goto LABEL_5;
      }
      uint64_t v10 = (v9 >> 3) + 4;
      int v11 = *((unsigned __int8 *)v5 + v10);
      int v12 = 1 << (v9 & 7);
      if ((v12 & v11) == 0) {
        break;
      }
LABEL_7:
      next = (void **)*next;
      if (!next) {
        goto LABEL_8;
      }
    }
    *((unsigned char *)v5 + v10) = v11 | v12;
LABEL_5:
    if (v4) {
      [v4 nodeDetails:v8];
    }
    goto LABEL_7;
  }
LABEL_8:
  free(v5);
}

- (void)enumerateHexAddressesInStrings:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t))a3;
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
        uint64_t v10 = [v9 rangeOfString:@" " options:4];
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          int v11 = [v9 substringFromIndex:v10 + 1];
          if (checkStringIsValidHexAddress(v11))
          {
            uint64_t v12 = strtoll((const char *)[v11 UTF8String], 0, 16);
            v4[2](v4, v12);
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
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)&self->_nodeToStringIndexMap);
  std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::~__hash_table((uint64_t)&self->_stringToIndexMap);

  objc_storeStrong((id *)&self->_strings, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  return self;
}

@end