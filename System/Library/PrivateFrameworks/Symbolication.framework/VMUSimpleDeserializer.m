@interface VMUSimpleDeserializer
- (VMUSimpleDeserializer)initWithData:(id)a3;
- (const)copyDeserializedNullTerminatedBytesWithError:(id *)a3;
- (id).cxx_construct;
- (id)copyDeserializedStringWithError:(id *)a3;
- (id)copyDeserializedStringWithID:(unsigned int)a3 error:(id *)a4;
- (unint64_t)deserialize64WithError:(id *)a3;
- (unsigned)_deserializeValues:(unsigned int)a3 error:(id *)a4;
- (unsigned)deserialize32WithError:(id *)a3;
- (void)skipFields:(unsigned int)a3;
@end

@implementation VMUSimpleDeserializer

- (VMUSimpleDeserializer)initWithData:(id)a3
{
  id v5 = a3;
  v6 = [(VMUSimpleDeserializer *)self init];
  if (v6)
  {
    unint64_t v7 = [v5 length];
    if (v7 > 0xF
      && (objc_storeStrong((id *)&v6->_data, a3),
          v8 = (unsigned int *)[v5 bytes],
          unint64_t v9 = v8[3],
          v7 >= v9)
      && (unsigned int v10 = v8[1], v11 = v8[2], v12 = v11 >= v10, v13 = v11 - v10, v12)
      && v11 <= v9)
    {
      v6->super._intRegCapacity = v13;
      v6->super._stringRegCapacity = v8[3] - v8[2];
      v14 = (char *)v8 + v8[2];
      v6->super._intRegion = (char *)v8 + v8[1];
      v6->super._stringRegion = v14;
    }
    else
    {

      v6 = 0;
    }
  }

  return v6;
}

- (unsigned)deserialize32WithError:(id *)a3
{
  return _nextField((uint64_t)self->super._intRegion, self->super._intRegCapacity, &self->super._cursor, a3);
}

- (unint64_t)deserialize64WithError:(id *)a3
{
  uint64_t Field = _nextField((uint64_t)self->super._intRegion, self->super._intRegCapacity, &self->super._cursor, a3);
  if (a3)
  {
    if (*a3) {
      return 0;
    }
    unsigned int v6 = _nextField((uint64_t)self->super._intRegion, self->super._intRegCapacity, &self->super._cursor, a3);
    if (*a3) {
      return 0;
    }
  }
  else
  {
    unsigned int v6 = _nextField((uint64_t)self->super._intRegion, self->super._intRegCapacity, &self->super._cursor, 0);
  }
  return v6 | (unint64_t)(Field << 32);
}

- (void)skipFields:(unsigned int)a3
{
  self->super._cursor += 4 * a3;
}

- (id)copyDeserializedStringWithID:(unsigned int)a3 error:(id *)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  unsigned int v26 = a3;
  if (a3 == -1) {
    return 0;
  }
  p_stringCache = &self->_stringCache;
  unint64_t v7 = std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::find<unsigned int>(&self->_stringCache.__table_.__bucket_list_.__ptr_.__value_, &v26);
  if (v26 >= self->super._stringRegCapacity)
  {
    unsigned int v10 = serializerLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      _nextField(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    if (a4)
    {
      v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = OOBDOMAIN;
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v28[0] = @"Out-of-bound access.";
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      *a4 = [v18 errorWithDomain:v19 code:1 userInfo:v20];
    }
    return 0;
  }
  if (!v7)
  {
    id v22 = [NSString alloc];
    v23 = (void *)[v22 initWithUTF8String:&self->super._stringRegion[v26]];
    unsigned int v24 = v26;
    id v21 = v23;
    id v25 = v21;
    std::__hash_table<std::__hash_value_type<unsigned int,NSString * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,NSString * {__strong}>>>::__emplace_unique_key_args<unsigned int,std::pair<unsigned int,NSString * {__strong}>>((uint64_t)p_stringCache, &v24, (uint64_t)&v24);

    return v21;
  }
  v8 = (void *)v7[3];

  return v8;
}

- (id)copyDeserializedStringWithError:(id *)a3
{
  uint64_t Field = _nextField((uint64_t)self->super._intRegion, self->super._intRegCapacity, &self->super._cursor, a3);
  if (a3 && *a3) {
    return 0;
  }

  return [(VMUSimpleDeserializer *)self copyDeserializedStringWithID:Field error:a3];
}

- (const)copyDeserializedNullTerminatedBytesWithError:(id *)a3
{
  unsigned int Field = _nextField((uint64_t)self->super._intRegion, self->super._intRegCapacity, &self->super._cursor, a3);
  if (a3)
  {
    if (*a3) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = Field == -1;
    }
    if (!v6) {
      goto LABEL_9;
    }
    return 0;
  }
  if (Field == -1) {
    return 0;
  }
LABEL_9:
  unsigned int stringRegCapacity = self->super._stringRegCapacity;
  size_t v9 = stringRegCapacity - Field;
  if (stringRegCapacity <= Field) {
    -[VMUSimpleDeserializer copyDeserializedNullTerminatedBytesWithError:]();
  }
  unsigned int v10 = &self->super._stringRegion[Field];

  return strndup(v10, v9);
}

- (unsigned)_deserializeValues:(unsigned int)a3 error:(id *)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t cursor = self->super._cursor;
  unint64_t v5 = cursor + 4 * a3;
  if (v5 <= self->super._intRegCapacity)
  {
    v18 = (unsigned int *)&self->super._intRegion[cursor];
    self->super._uint64_t cursor = v5;
  }
  else
  {
    unint64_t v7 = serializerLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      _nextField(v7, v8, v9, v10, v11, v12, v13, v14);
    }

    if (a4)
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = OOBDOMAIN;
      uint64_t v20 = *MEMORY[0x1E4F28568];
      v21[0] = @"Out-of-bound access.";
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      *a4 = [v15 errorWithDomain:v16 code:1 userInfo:v17];
    }
    return 0;
  }
  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);

  std::__hash_table<std::__hash_value_type<unsigned int,NSString * {__strong}>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,NSString * {__strong}>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,NSString * {__strong}>>>::~__hash_table((uint64_t)&self->_stringCache);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((_DWORD *)self + 18) = 1065353216;
  return self;
}

- (void)copyDeserializedNullTerminatedBytesWithError:.cold.1()
{
}

@end