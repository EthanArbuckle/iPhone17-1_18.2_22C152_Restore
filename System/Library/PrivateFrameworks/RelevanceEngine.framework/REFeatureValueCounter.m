@interface REFeatureValueCounter
- (BOOL)readFromURL:(id)a3 error:(id *)a4;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (REFeatureValueCounter)init;
- (id).cxx_construct;
- (id)_createErrorWithCode:(unint64_t)a3 description:(id)a4 underlyingError:(id)a5;
- (unint64_t)count;
- (unint64_t)countForValue:(id)a3;
- (unint64_t)totalCount;
- (unint64_t)trackedValueForValue:(id)a3;
- (void)_updateConfigurationForCount:(unint64_t)a3;
@end

@implementation REFeatureValueCounter

void __43__REFeatureValueCounter_readFromURL_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = +[REFeatureValue featureValueWithDictionary:v6];
    if (v5) {
      [*(id *)(*(void *)(a1 + 32) + 16) replacePointerAtIndex:a3 withPointer:v5];
    }
  }
}

- (BOOL)readFromURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  p_lock = &self->_lock;
  pthread_rwlock_wrlock(&self->_lock);
  v8 = [v6 URLByAppendingPathComponent:@"index.idx"];
  id v28 = 0;
  v9 = [NSString stringWithContentsOfURL:v8 encoding:4 error:&v28];
  id v10 = v28;
  if (v9)
  {
    v22 = v8;
    v23 = &self->_lock;
    v11 = (void *)MEMORY[0x263EFF8F8];
    v12 = [v6 URLByAppendingPathComponent:@"values.dat"];
    id v27 = v10;
    v13 = [v11 dataWithContentsOfURL:v12 options:0 error:&v27];
    id v14 = v27;

    if (!v13)
    {
      if (!a4)
      {
        BOOL v19 = 0;
        goto LABEL_20;
      }
      v15 = [NSString stringWithFormat:@"Unable to read contents of %@.", @"values.dat"];
      [(REFeatureValueCounter *)self _createErrorWithCode:2 description:v15 underlyingError:v14];
      BOOL v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_20:
      id v10 = v14;
      v8 = v22;
      p_lock = v23;
      goto LABEL_21;
    }
    id v26 = v14;
    v15 = [MEMORY[0x263F08900] JSONObjectWithData:v13 options:4 error:&v26];
    id v16 = v26;

    if (v15)
    {
      -[REFeatureValueCounter _updateConfigurationForCount:](self, "_updateConfigurationForCount:", [v15 count]);
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v9 UTF8String]);
      BOOL v17 = REFancyShrinkingDictionary::LoadModel((uint64_t)&self->_indicies, &__p);
      BOOL v18 = v17;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        if (v18) {
          goto LABEL_6;
        }
      }
      else if (v17)
      {
LABEL_6:
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __43__REFeatureValueCounter_readFromURL_error___block_invoke;
        v24[3] = &unk_2644BE0D0;
        v24[4] = self;
        [v15 enumerateObjectsUsingBlock:v24];
        BOOL v19 = 1;
LABEL_18:
        id v14 = v16;
        goto LABEL_19;
      }
      if (a4)
      {
        [(REFeatureValueCounter *)self _createErrorWithCode:6 description:@"Unable to load model." underlyingError:0];
        BOOL v19 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
    }
    else if (a4)
    {
      v20 = [NSString stringWithFormat:@"Unable to serialize content of %@ into JSON.", @"values.dat"];
      *a4 = [(REFeatureValueCounter *)self _createErrorWithCode:5 description:v20 underlyingError:v16];
    }
    BOOL v19 = 0;
    goto LABEL_18;
  }
  if (a4)
  {
    v13 = [NSString stringWithFormat:@"Unable to read contents of %@.", @"index.idx"];
    [(REFeatureValueCounter *)self _createErrorWithCode:2 description:v13 underlyingError:v10];
    BOOL v19 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

    goto LABEL_22;
  }
  BOOL v19 = 0;
LABEL_22:

  pthread_rwlock_unlock(p_lock);
  return v19;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)_updateConfigurationForCount:(unint64_t)a3
{
  p_lock = &self->_lock;
  pthread_rwlock_wrlock(&self->_lock);
  if (a3 <= 1)
  {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Count is too low. Must be 2 or greater. Changing to 2 to avoid a crash in production.", v6, v7, v8, v9, v10, v11, (uint64_t)v14.m_mapDocumentFrequency.__table_.__bucket_list_.__ptr_.__value_);
    a3 = 2;
  }
  self->_count = a3 - 1;
  v12 = [MEMORY[0x263F08A88] strongObjectsPointerArray];
  values = self->_values;
  self->_values = v12;

  [(NSPointerArray *)self->_values setCount:a3];
  REFancyShrinkingDictionary::REFancyShrinkingDictionary(&v14, a3 - 1, (unint64_t)(float)((float)(a3 - 1) * 0.8), 1, 0, 1);
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__move_assign((uint64_t)&self->_indicies, (uint64_t *)&v14);
  *(_OWORD *)&self->_indicies.m_maxSize = *(_OWORD *)&v14.m_maxSize;
  *(unint64_t *)((char *)&self->_indicies.m_shrinkSize + 6) = *(unint64_t *)((char *)&v14.m_shrinkSize + 6);
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table((uint64_t)&v14);
  pthread_rwlock_unlock(p_lock);
}

- (REFeatureValueCounter)init
{
  v6.receiver = self;
  v6.super_class = (Class)REFeatureValueCounter;
  v2 = [(REFeatureValueCounter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08A88] strongObjectsPointerArray];
    values = v2->_values;
    v2->_values = (NSPointerArray *)v3;

    [(REFeatureValueCounter *)v2 _updateConfigurationForCount:20];
  }
  return v2;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  pthread_rwlock_rdlock(&self->_lock);
  v22 = [v6 URLByAppendingPathComponent:@"index.idx"];
  MEMORY[0x223C30D40](__sb);
  id v7 = [v22 path];
  [v7 UTF8String];
  std::filebuf::open();

  uint64_t v8 = v30;
  if (v30)
  {
    uint64_t v25 = MEMORY[0x263F8C2F8] + 24;
    v26.__vftable = (std::ios_base_vtbl *)(MEMORY[0x263F8C2F8] + 64);
    std::ios_base::init(&v26, __sb);
    uint64_t v27 = 0;
    int v28 = -1;
    REFancyShrinkingDictionary::SaveModel((uint64_t)&self->_indicies, &v25);
    std::ostream::flush();
    std::ostream::~ostream();
  }
  std::filebuf::close();
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263EFF980] arrayWithCapacity:self->_count];
    if (self->_count)
    {
      unint64_t v10 = 0;
      do
      {
        uint64_t v11 = [(NSPointerArray *)self->_values pointerAtIndex:v10];
        v12 = v11;
        if (v11) {
          [v11 dictionaryEncoding];
        }
        else {
        v13 = [MEMORY[0x263EFF9D0] null];
        }
        [v9 addObject:v13];

        ++v10;
      }
      while (v10 < self->_count);
    }
    id v24 = 0;
    REFancyShrinkingDictionary v14 = [MEMORY[0x263F08900] dataWithJSONObject:v9 options:0 error:&v24];
    id v15 = v24;
    if (v14)
    {
      id v16 = [v6 URLByAppendingPathComponent:@"values.dat"];
      id v23 = v15;
      char v17 = [v14 writeToURL:v16 options:1 error:&v23];
      id v18 = v23;

      if (a4) {
        char v19 = v17;
      }
      else {
        char v19 = 1;
      }
      if ((v19 & 1) == 0)
      {
        v20 = [NSString stringWithFormat:@"Unable to write to %@.", @"values.dat"];
        *a4 = [(REFeatureValueCounter *)self _createErrorWithCode:3 description:v20 underlyingError:v18];

        char v17 = 0;
      }
      id v15 = v18;
    }
    else if (a4)
    {
      [(REFeatureValueCounter *)self _createErrorWithCode:4 description:@"Unable to deserialize JSON content into data." underlyingError:v15];
      char v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v17 = 0;
    }

    goto LABEL_24;
  }
  if (a4)
  {
    uint64_t v9 = [NSString stringWithFormat:@"Unable to open %@.", @"index.idx"];
    [(REFeatureValueCounter *)self _createErrorWithCode:1 description:v9 underlyingError:0];
    char v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

    goto LABEL_25;
  }
  char v17 = 0;
LABEL_25:
  MEMORY[0x223C30D50](__sb);

  pthread_rwlock_unlock(&self->_lock);
  return v17;
}

- (unint64_t)trackedValueForValue:(id)a3
{
  id v4 = a3;
  pthread_rwlock_wrlock(&self->_lock);
  if (!self->_count) {
    goto LABEL_19;
  }
  unint64_t v5 = 0;
  uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    uint64_t v7 = [(NSPointerArray *)self->_values pointerAtIndex:v5];
    uint64_t v8 = (void *)v7;
    if (v6 == 0x7FFFFFFFFFFFFFFFLL && v7 == 0) {
      uint64_t v10 = v5;
    }
    else {
      uint64_t v10 = v6;
    }
    if (v7)
    {
      if ([v4 isEqual:v7])
      {

        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v6 = v10;
    }

    ++v5;
  }
  while (v5 < self->_count);
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:
  if (v5 != 0x7FFFFFFFFFFFFFFFLL || v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_20;
    }
LABEL_19:
    unint64_t v5 = self->_count + 1;
    goto LABEL_20;
  }
  [(NSPointerArray *)self->_values replacePointerAtIndex:v6 withPointer:v4];
  unint64_t v5 = v6;
LABEL_20:
  uint64_t v11 = [NSNumber numberWithInteger:v5];
  id v12 = [v11 stringValue];
  std::string::basic_string[abi:ne180100]<0>(v22, (char *)[v12 UTF8String]);

  char v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v20 = std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v19, (long long *)v22);
  if (REFancyShrinkingDictionary::pushToIDF((uint64_t)&self->_indicies, &v19) && self->_count)
  {
    unint64_t v13 = 0;
    do
    {
      if ([(NSPointerArray *)self->_values pointerAtIndex:v13])
      {
        REFancyShrinkingDictionary v14 = [NSNumber numberWithUnsignedInteger:v13];
        id v15 = [v14 stringValue];
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v15 UTF8String]);

        if (!REFancyShrinkingDictionary::getTokenCount(&self->_indicies.m_mapDocumentFrequency.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)__p))[(NSPointerArray *)self->_values replacePointerAtIndex:v13 withPointer:0]; {
        if (v18 < 0)
        }
          operator delete(__p[0]);
      }
      ++v13;
    }
    while (v13 < self->_count);
  }
  __p[0] = &v19;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  if (v23 < 0) {
    operator delete(v22[0]);
  }
  pthread_rwlock_unlock(&self->_lock);

  return v5;
}

- (unint64_t)countForValue:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  pthread_rwlock_rdlock(&self->_lock);
  if (!self->_count) {
    goto LABEL_8;
  }
  uint64_t v6 = 0;
  while (1)
  {
    uint64_t v7 = [(NSPointerArray *)self->_values pointerAtIndex:v6];
    if (v7)
    {
      if ([v4 isEqual:v7]) {
        break;
      }
    }

    if (++v6 >= self->_count) {
      goto LABEL_8;
    }
  }

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = [NSNumber numberWithInteger:v6];
    id v11 = [v10 stringValue];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v11 UTF8String]);

    TokenCount = REFancyShrinkingDictionary::getTokenCount(&self->_indicies.m_mapDocumentFrequency.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int8 *)__p);
    if (v13 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
LABEL_8:
    TokenCount = 0;
  }
  pthread_rwlock_unlock(p_lock);

  return (unint64_t)TokenCount;
}

- (unint64_t)totalCount
{
  p_lock = &self->_lock;
  pthread_rwlock_rdlock(&self->_lock);
  unint64_t v4 = REFancyShrinkingDictionary::totalTermCount(&self->_indicies);
  pthread_rwlock_unlock(p_lock);
  return v4;
}

- (id)_createErrorWithCode:(unint64_t)a3 description:(id)a4 underlyingError:(id)a5
{
  id v7 = a5;
  uint64_t v8 = [MEMORY[0x263EFF9A0] dictionaryWithObject:a4 forKey:*MEMORY[0x263F08320]];
  uint64_t v9 = v8;
  if (v7) {
    [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x263F08608]];
  }
  uint64_t v10 = (void *)MEMORY[0x263F087E8];
  id v11 = (void *)[v9 copy];
  id v12 = [v10 errorWithDomain:@"REFeatureValueCounterError" code:a3 userInfo:v11];

  return v12;
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table((uint64_t)&self->_indicies);
  objc_storeStrong((id *)&self->_values, 0);
}

- (id).cxx_construct
{
  return self;
}

@end