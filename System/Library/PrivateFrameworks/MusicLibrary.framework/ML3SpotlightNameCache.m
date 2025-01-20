@interface ML3SpotlightNameCache
+ (id)copyFromLibrary:(id)a3 cancelHandler:(id)a4;
+ (void)initialize;
- (id).cxx_construct;
- (id)_initWithLibrary:(id)a3 cancelHandler:(id)a4;
- (void)dealloc;
@end

@implementation ML3SpotlightNameCache

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
  next = (void **)self->_map.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4 = (void **)*next;
      if (*((char *)next + 47) < 0) {
        operator delete(next[3]);
      }
      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  value = self->_map.__table_.__bucket_list_.__ptr_.__value_;
  self->_map.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
  {
    operator delete(value);
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ML3SpotlightNameCache;
  [(ML3SpotlightNameCache *)&v2 dealloc];
}

- (id)_initWithLibrary:(id)a3 cancelHandler:(id)a4
{
  id v7 = a3;
  v8 = (uint64_t (**)(void))a4;
  v18.receiver = self;
  v18.super_class = (Class)ML3SpotlightNameCache;
  v9 = [(ML3SpotlightNameCache *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_library, a3);
    library = v10->_library;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__ML3SpotlightNameCache__initWithLibrary_cancelHandler___block_invoke;
    v14[3] = &unk_1E5FB6460;
    v15 = @"SELECT name, name_order FROM sort_map";
    v16 = v10;
    v17 = v8;
    [(ML3MusicLibrary *)library databaseConnectionAllowingWrites:0 withBlock:v14];
  }
  if (v8 && (v8[2](v8) & 1) != 0) {
    v12 = 0;
  }
  else {
    v12 = v10;
  }

  return v12;
}

void __56__ML3SpotlightNameCache__initWithLibrary_cancelHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 executeQuery:*(void *)(a1 + 32)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__ML3SpotlightNameCache__initWithLibrary_cancelHandler___block_invoke_2;
  v4[3] = &unk_1E5FB6438;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 enumerateRowsWithBlock:v4];
}

void __56__ML3SpotlightNameCache__initWithLibrary_cancelHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v9 = a3;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v8 cStringForColumnIndex:0]);
  unint64_t v10 = [v8 int64ForColumnIndex:1];
  std::string::size_type v11 = v10;
  uint64_t v12 = *(void *)(a1 + 32);
  unint64_t v13 = *(void *)(v12 + 16);
  if (v13)
  {
    uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v13);
    v14.i16[0] = vaddlv_u8(v14);
    if (v14.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v13) {
        unint64_t v4 = v10 % v13;
      }
    }
    else
    {
      unint64_t v4 = (v13 - 1) & v10;
    }
    v15 = *(std::string ***)(*(void *)(v12 + 8) + 8 * v4);
    if (v15)
    {
      for (i = *v15; i; i = (std::string *)i->__r_.__value_.__r.__words[0])
      {
        std::string::size_type size = i->__r_.__value_.__l.__size_;
        if (size == v10)
        {
          if (i->__r_.__value_.__r.__words[2] == v10) {
            goto LABEL_74;
          }
        }
        else
        {
          if (v14.u32[0] > 1uLL)
          {
            if (size >= v13) {
              size %= v13;
            }
          }
          else
          {
            size &= v13 - 1;
          }
          if (size != v4) {
            break;
          }
        }
      }
    }
  }
  i = (std::string *)operator new(0x30uLL);
  objc_super v18 = (std::string **)(v12 + 24);
  i->__r_.__value_.__r.__words[0] = 0;
  i->__r_.__value_.__l.__size_ = v11;
  i->__r_.__value_.__r.__words[2] = v11;
  i[1].__r_.__value_.__r.__words[0] = 0;
  i[1].__r_.__value_.__l.__size_ = 0;
  i[1].__r_.__value_.__r.__words[2] = 0;
  float v19 = (float)(unint64_t)(*(void *)(v12 + 32) + 1);
  float v20 = *(float *)(v12 + 40);
  if (!v13 || (float)(v20 * (float)v13) < v19)
  {
    BOOL v21 = 1;
    if (v13 >= 3) {
      BOOL v21 = (v13 & (v13 - 1)) != 0;
    }
    unint64_t v22 = v21 | (2 * v13);
    unint64_t v23 = vcvtps_u32_f32(v19 / v20);
    if (v22 <= v23) {
      int8x8_t prime = (int8x8_t)v23;
    }
    else {
      int8x8_t prime = (int8x8_t)v22;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v13 = *(void *)(v12 + 16);
    if (*(void *)&prime > v13) {
      goto LABEL_30;
    }
    if (*(void *)&prime < v13)
    {
      unint64_t v31 = vcvtps_u32_f32((float)*(unint64_t *)(v12 + 32) / *(float *)(v12 + 40));
      if (v13 < 3 || (uint8x8_t v32 = (uint8x8_t)vcnt_s8((int8x8_t)v13), v32.i16[0] = vaddlv_u8(v32), v32.u32[0] > 1uLL))
      {
        unint64_t v31 = std::__next_prime(v31);
      }
      else
      {
        uint64_t v33 = 1 << -(char)__clz(v31 - 1);
        if (v31 >= 2) {
          unint64_t v31 = v33;
        }
      }
      if (*(void *)&prime <= v31) {
        int8x8_t prime = (int8x8_t)v31;
      }
      if (*(void *)&prime >= v13)
      {
        unint64_t v13 = *(void *)(v12 + 16);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v25 = operator new(8 * *(void *)&prime);
          v26 = *(void **)(v12 + 8);
          *(void *)(v12 + 8) = v25;
          if (v26) {
            operator delete(v26);
          }
          uint64_t v27 = 0;
          *(int8x8_t *)(v12 + 16) = prime;
          do
            *(void *)(*(void *)(v12 + 8) + 8 * v27++) = 0;
          while (*(void *)&prime != v27);
          v28 = *v18;
          if (*v18)
          {
            std::string::size_type v29 = v28->__r_.__value_.__l.__size_;
            uint8x8_t v30 = (uint8x8_t)vcnt_s8(prime);
            v30.i16[0] = vaddlv_u8(v30);
            if (v30.u32[0] > 1uLL)
            {
              if (v29 >= *(void *)&prime) {
                v29 %= *(void *)&prime;
              }
            }
            else
            {
              v29 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)(v12 + 8) + 8 * v29) = v18;
            v34 = (std::string *)v28->__r_.__value_.__r.__words[0];
            if (v28->__r_.__value_.__r.__words[0])
            {
              do
              {
                unint64_t v35 = v34->__r_.__value_.__l.__size_;
                if (v30.u32[0] > 1uLL)
                {
                  if (v35 >= *(void *)&prime) {
                    v35 %= *(void *)&prime;
                  }
                }
                else
                {
                  v35 &= *(void *)&prime - 1;
                }
                if (v35 != v29)
                {
                  uint64_t v36 = *(void *)(v12 + 8);
                  if (!*(void *)(v36 + 8 * v35))
                  {
                    *(void *)(v36 + 8 * v35) = v28;
                    goto LABEL_55;
                  }
                  v28->__r_.__value_.__r.__words[0] = v34->__r_.__value_.__r.__words[0];
                  v34->__r_.__value_.__r.__words[0] = **(void **)(*(void *)(v12 + 8) + 8 * v35);
                  **(void **)(*(void *)(v12 + 8) + 8 * v35) = v34;
                  v34 = v28;
                }
                unint64_t v35 = v29;
LABEL_55:
                v28 = v34;
                v34 = (std::string *)v34->__r_.__value_.__r.__words[0];
                std::string::size_type v29 = v35;
              }
              while (v34);
            }
          }
          unint64_t v13 = (unint64_t)prime;
          goto LABEL_59;
        }
        v41 = *(void **)(v12 + 8);
        *(void *)(v12 + 8) = 0;
        if (v41) {
          operator delete(v41);
        }
        unint64_t v13 = 0;
        *(void *)(v12 + 16) = 0;
      }
    }
LABEL_59:
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v11 >= v13) {
        unint64_t v4 = v11 % v13;
      }
      else {
        unint64_t v4 = v11;
      }
    }
    else
    {
      unint64_t v4 = (v13 - 1) & v11;
    }
  }
  uint64_t v37 = *(void *)(v12 + 8);
  v38 = *(std::string ***)(v37 + 8 * v4);
  if (v38)
  {
    i->__r_.__value_.__r.__words[0] = (std::string::size_type)*v38;
LABEL_72:
    *v38 = i;
    goto LABEL_73;
  }
  i->__r_.__value_.__r.__words[0] = (std::string::size_type)*v18;
  *objc_super v18 = i;
  *(void *)(v37 + 8 * v4) = v18;
  if (i->__r_.__value_.__r.__words[0])
  {
    unint64_t v39 = *(void *)(i->__r_.__value_.__r.__words[0] + 8);
    if ((v13 & (v13 - 1)) != 0)
    {
      if (v39 >= v13) {
        v39 %= v13;
      }
    }
    else
    {
      v39 &= v13 - 1;
    }
    v38 = (std::string **)(*(void *)(v12 + 8) + 8 * v39);
    goto LABEL_72;
  }
LABEL_73:
  ++*(void *)(v12 + 32);
LABEL_74:
  std::string::operator=(i + 1, &__str);
  uint64_t v40 = *(void *)(a1 + 40);
  if (v40) {
    LOBYTE(v40) = (*(uint64_t (**)(void))(v40 + 16))();
  }
  *a4 = v40;
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
}

+ (id)copyFromLibrary:(id)a3 cancelHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (__nameCacheOnce != -1) {
    dispatch_once(&__nameCacheOnce, &__block_literal_global_19142);
  }
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  float v19 = __Block_byref_object_copy__19143;
  float v20 = __Block_byref_object_dispose__19144;
  id v21 = 0;
  id v7 = __nameCacheLoadingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__ML3SpotlightNameCache_copyFromLibrary_cancelHandler___block_invoke;
  block[3] = &unk_1E5FB6410;
  id v13 = v5;
  id v14 = v6;
  v15 = &v16;
  id v8 = v6;
  id v9 = v5;
  dispatch_sync(v7, block);
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __55__ML3SpotlightNameCache_copyFromLibrary_cancelHandler___block_invoke(void *a1)
{
  if (__nameCache && *(void *)(__nameCache + 56) == a1[4]) {
    id v2 = 0;
  }
  else {
    id v2 = [[ML3SpotlightNameCache alloc] _initWithLibrary:a1[4] cancelHandler:a1[5]];
  }
  v3 = __nameCacheAccessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__ML3SpotlightNameCache_copyFromLibrary_cancelHandler___block_invoke_2;
  v6[3] = &unk_1E5FB8360;
  uint64_t v4 = a1[6];
  id v7 = v2;
  uint64_t v8 = v4;
  id v5 = v2;
  dispatch_sync(v3, v6);
}

void __55__ML3SpotlightNameCache_copyFromLibrary_cancelHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_storeStrong((id *)&__nameCache, v2);
    ML3SpotlightNameCacheTimer();
  }
  v3 = (void *)__nameCache;
  if (__nameCache) {
    *(unsigned char *)(__nameCache + 48) = 0;
  }
  uint64_t v4 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v4, v3);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && __nameCacheOnce != -1)
  {
    dispatch_once(&__nameCacheOnce, &__block_literal_global_19142);
  }
}

@end