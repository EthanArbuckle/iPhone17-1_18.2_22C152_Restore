@interface ML3SpotlightMatchingNameCache
+ (void)initialize;
+ (void)loadFromLibrary:(id)a3 namesMatchingString:(id)a4 cancelHandler:(id)a5;
- (id).cxx_construct;
- (id)_initWithLibrary:(id)a3 matchString:(id)a4 cancelHandler:(id)a5;
- (void)dealloc;
@end

@implementation ML3SpotlightMatchingNameCache

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_matchString, 0);

  std::__hash_table<unsigned long long,echo_hash_shift<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)&self->_matchingSet);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ML3SpotlightMatchingNameCache;
  [(ML3SpotlightMatchingNameCache *)&v2 dealloc];
}

- (id)_initWithLibrary:(id)a3 matchString:(id)a4 cancelHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (uint64_t (**)(void))a5;
  v22.receiver = self;
  v22.super_class = (Class)ML3SpotlightMatchingNameCache;
  v12 = [(ML3SpotlightMatchingNameCache *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_library, a3);
    objc_storeStrong((id *)&v13->_matchString, a4);
    if ([v10 length])
    {
      library = v13->_library;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __76__ML3SpotlightMatchingNameCache__initWithLibrary_matchString_cancelHandler___block_invoke;
      v17[3] = &unk_1E5FB6488;
      v18 = @"SELECT name_order FROM sort_map WHERE ML3SearchStringMatch(?, name)";
      id v19 = v10;
      v20 = v13;
      v21 = v11;
      [(ML3MusicLibrary *)library databaseConnectionAllowingWrites:0 withBlock:v17];
    }
  }
  if (v11 && (v11[2](v11) & 1) != 0) {
    v15 = 0;
  }
  else {
    v15 = v13;
  }

  return v15;
}

void __76__ML3SpotlightMatchingNameCache__initWithLibrary_matchString_cancelHandler___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v10[0] = *(void *)(a1 + 40);
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v6 = [v3 executeQuery:v4 withParameters:v5];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__ML3SpotlightMatchingNameCache__initWithLibrary_matchString_cancelHandler___block_invoke_2;
  v7[3] = &unk_1E5FB6438;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  [v6 enumerateRowsWithBlock:v7];
}

void __76__ML3SpotlightMatchingNameCache__initWithLibrary_matchString_cancelHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v28 = v7;
  unint64_t v9 = [v7 int64ForColumnIndex:0];
  unint64_t v10 = v9;
  v11 = (uint64_t *)(v8 + 8);
  unint64_t v12 = *(void *)(v8 + 16);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v12) {
        unint64_t v4 = v9 % v12;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v9;
    }
    v14 = *(void **)(*v11 + 8 * v4);
    if (v14)
    {
      for (i = (void *)*v14; i; i = (void *)*i)
      {
        unint64_t v16 = i[1];
        if (v16 == v9)
        {
          if (i[2] == v9) {
            goto LABEL_40;
          }
        }
        else
        {
          if (v13.u32[0] > 1uLL)
          {
            if (v16 >= v12) {
              v16 %= v12;
            }
          }
          else
          {
            v16 &= v12 - 1;
          }
          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }
  v17 = operator new(0x18uLL);
  void *v17 = 0;
  v17[1] = v10;
  v17[2] = v10;
  float v18 = (float)(unint64_t)(*(void *)(v8 + 32) + 1);
  float v19 = *(float *)(v8 + 40);
  if (!v12 || (float)(v19 * (float)v12) < v18)
  {
    BOOL v20 = 1;
    if (v12 >= 3) {
      BOOL v20 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v21 = v20 | (2 * v12);
    unint64_t v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22) {
      size_t v23 = v22;
    }
    else {
      size_t v23 = v21;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(v8 + 8, v23);
    unint64_t v12 = *(void *)(v8 + 16);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v10 >= v12) {
        unint64_t v4 = v10 % v12;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v10;
    }
  }
  uint64_t v24 = *v11;
  v25 = *(void **)(*v11 + 8 * v4);
  if (v25)
  {
    void *v17 = *v25;
LABEL_38:
    void *v25 = v17;
    goto LABEL_39;
  }
  void *v17 = *(void *)(v8 + 24);
  *(void *)(v8 + 24) = v17;
  *(void *)(v24 + 8 * v4) = v8 + 24;
  if (*v17)
  {
    unint64_t v26 = *(void *)(*v17 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v26 >= v12) {
        v26 %= v12;
      }
    }
    else
    {
      v26 &= v12 - 1;
    }
    v25 = (void *)(*v11 + 8 * v26);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(v8 + 32);
LABEL_40:
  uint64_t v27 = *(void *)(a1 + 40);
  if (v27) {
    LOBYTE(v27) = (*(uint64_t (**)(void))(v27 + 16))();
  }
  *a4 = v27;
}

+ (void)loadFromLibrary:(id)a3 namesMatchingString:(id)a4 cancelHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = __nameCacheLoadingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__ML3SpotlightMatchingNameCache_loadFromLibrary_namesMatchingString_cancelHandler___block_invoke;
  block[3] = &unk_1E5FB7BD8;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_sync(v10, block);
}

void __83__ML3SpotlightMatchingNameCache_loadFromLibrary_namesMatchingString_cancelHandler___block_invoke(void *a1)
{
  if (__matchingNameCache
    && *(void *)(__matchingNameCache + 64) == a1[4]
    && ([*(id *)(__matchingNameCache + 48) isEqualToString:a1[5]] & 1) != 0)
  {
    id v2 = 0;
  }
  else
  {
    id v2 = [[ML3SpotlightMatchingNameCache alloc] _initWithLibrary:a1[4] matchString:a1[5] cancelHandler:a1[6]];
  }
  id v3 = __nameCacheAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__ML3SpotlightMatchingNameCache_loadFromLibrary_namesMatchingString_cancelHandler___block_invoke_2;
  block[3] = &unk_1E5FB8298;
  id v6 = v2;
  id v4 = v2;
  dispatch_sync(v3, block);
}

void __83__ML3SpotlightMatchingNameCache_loadFromLibrary_namesMatchingString_cancelHandler___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    objc_storeStrong((id *)&__matchingNameCache, v1);
    ML3SpotlightMatchingNameCacheTimer((ML3SpotlightMatchingNameCache *)__matchingNameCache);
  }
  if (__matchingNameCache) {
    *(unsigned char *)(__matchingNameCache + 56) = 0;
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && __nameCacheOnce != -1)
  {
    dispatch_once(&__nameCacheOnce, &__block_literal_global_19142);
  }
}

@end