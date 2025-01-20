uint64_t REFeatureValueHashForTaggedPointer(unint64_t a1)
{
  uint64_t v2;
  void *v3;
  unint64_t v4;
  uint64_t i;
  void *v6;
  void v7[2];
  uint64_t vars8;

  v7[1] = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  if (a1)
  {
    switch((a1 >> 1) & 3)
    {
      case 1u:
        v2 = a1 >> 3;
        break;
      case 2u:
        v3 = [NSNumber numberWithDouble:COERCE_DOUBLE(a1 & 0xFFFFFFFFFFFFFFF8)];
        goto LABEL_16;
      case 3u:
        v4 = a1 >> 3;
        v7[0] = 0;
        for (i = 6; i != -1; --i)
        {
          *((unsigned char *)v7 + i) = v4;
          v4 >>= 8;
        }
        v3 = [NSString stringWithUTF8String:v7];
LABEL_16:
        v6 = v3;
        v2 = objc_msgSend(v3, "hash", v7[0]);

        break;
      default:
        if (a1 >= 8) {
          v2 = 3269800123;
        }
        else {
          v2 = 842849807;
        }
        break;
    }
    return v2;
  }
  return [(id)a1 hash];
}

void __RELogForDomain_block_invoke()
{
  id v6 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:22];
  for (uint64_t i = 0; i != 22; ++i)
  {
    v1 = RELogNameForDomain(i);
    os_log_t v2 = os_log_create("com.apple.RelevanceEngine", v1);
    v3 = [NSNumber numberWithUnsignedInteger:i];
    [v6 setObject:v2 forKeyedSubscript:v3];
  }
  uint64_t v4 = [v6 copy];
  v5 = (void *)RELogForDomain_LogForDomains;
  RELogForDomain_LogForDomains = v4;
}

const char *RELogNameForDomain(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x14) {
    return "default";
  }
  else {
    return off_2644BF600[a1 - 1];
  }
}

id RELogForDomain(uint64_t a1)
{
  if (RELogForDomain_onceToken != -1) {
    dispatch_once(&RELogForDomain_onceToken, &__block_literal_global_51);
  }
  os_log_t v2 = (void *)RELogForDomain_LogForDomains;
  v3 = [NSNumber numberWithUnsignedInteger:a1];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

void REOptimizeFeatureSetGraph(void *a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v1 = a1;
  os_log_t v2 = [MEMORY[0x263EFF9C0] set];
  v15 = v1;
  v3 = [v1 allFeatures];
  uint64_t v4 = (void *)[v3 mutableCopy];
  while (1)
  {

    if (![v4 count]) {
      break;
    }
    v3 = [v4 lastObject];
    [v4 removeLastObject];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = [v3 _dependentFeatures];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(id *)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v11 = [v2 member:v10];
          v12 = (void *)v11;
          if (v11) {
            BOOL v13 = v11 == (void)v10;
          }
          else {
            BOOL v13 = 1;
          }
          if (v13)
          {
            if (!v11)
            {
              [v4 addObject:v10];
              [v2 addObject:v10];
            }
          }
          else
          {
            [v3 _replaceDependentFeature:v10 withFeature:v11];
            id v14 = v12;

            id v10 = v14;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
  }
}

void sub_21E6EA724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id RERootFeatureSetForFeatures(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if ([v1 count])
  {
    if ([v1 count] == 1)
    {
      os_log_t v2 = [v1 allFeatures];
      v3 = [v2 firstObject];
      uint64_t v4 = [v3 _rootFeatures];
    }
    else
    {
      os_log_t v2 = +[REFeatureSet featureSet];
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v5 = v1;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(v5);
            }
            id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "_rootFeatures", (void)v12);
            [v2 unionFeatureSet:v10];
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v7);
      }

      uint64_t v4 = (void *)[v2 copy];
    }
  }
  else
  {
    uint64_t v4 = +[REFeatureSet featureSet];
  }

  return v4;
}

uint64_t ReadStreamToCharacter(void *a1, uint64_t a2, unsigned __int8 a3, unint64_t a4)
{
  uint64_t result = 0;
  if ((*((unsigned char *)a1 + *(void *)(*a1 - 24) + 32) & 2) == 0)
  {
    std::string::size_type v8 = 0;
    int v9 = a3;
    while (1)
    {
      id v10 = (void *)std::istream::read();
      if ((*((unsigned char *)v10 + *(void *)(*v10 - 24) + 32) & 5) != 0) {
        return 0;
      }
      if (!v9) {
        break;
      }
      std::string::value_type __s = 0;
      if (v8 < a4) {
        goto LABEL_9;
      }
      std::string::size_type v11 = *(unsigned __int8 *)(a2 + 23);
      if ((v11 & 0x80u) != 0) {
        std::string::size_type v11 = *(void *)(a2 + 8);
      }
      if (v11 <= v8) {
        std::string::append((std::string *)a2, &__s, 1uLL);
      }
      else {
LABEL_9:
      }
        *std::string::at((std::string *)a2, v8) = 0;
      ++v8;
      if ((*((unsigned char *)a1 + *(void *)(*a1 - 24) + 32) & 2) != 0) {
        return 0;
      }
    }
    std::string::value_type v13 = 0;
    if (v8 < a4) {
      goto LABEL_17;
    }
    unint64_t v12 = *(unsigned __int8 *)(a2 + 23);
    if ((v12 & 0x80u) != 0) {
      unint64_t v12 = *(void *)(a2 + 8);
    }
    if (v12 <= v8) {
      std::string::append((std::string *)a2, &v13, 1uLL);
    }
    else {
LABEL_17:
    }
      *std::string::at((std::string *)a2, v8) = 0;
    return 1;
  }
  return result;
}

void sub_21E6EE97C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 248));
  _Unwind_Resume(a1);
}

id REFeatureValueForTaggedPointer(unint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (a1)
    {
      switch((a1 >> 1) & 3)
      {
        case 1u:
          id v1 = +[REFeatureValue featureValueWithInt64:a1 >> 3];
          goto LABEL_4;
        case 2u:
          id v1 = +[REFeatureValue featureValueWithDouble:COERCE_DOUBLE(a1 & 0xFFFFFFFFFFFFFFF8)];
          goto LABEL_4;
        case 3u:
          unint64_t v4 = a1 >> 3;
          uint64_t v7 = 0;
          for (uint64_t i = 6; i != -1; --i)
          {
            *((unsigned char *)&v7 + i) = v4;
            v4 >>= 8;
          }
          uint64_t v6 = [NSString stringWithUTF8String:&v7];
          uint64_t v2 = +[REFeatureValue featureValueWithString:](REFeatureValue, "featureValueWithString:", v6, v7, v8);

          break;
        default:
          id v1 = +[REFeatureValue featureValueWithBool:a1 > 7];
          goto LABEL_4;
      }
    }
    else
    {
      id v1 = (id)a1;
LABEL_4:
      uint64_t v2 = v1;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

CFTypeRef RERetainFeatureValueTaggedPointer(CFTypeRef cf)
{
  if (cf)
  {
    if ((cf & 1) == 0) {
      return CFRetain(cf);
    }
  }
  return cf;
}

id REIntrinsicFeatureSet()
{
  if (REIntrinsicFeatureSet_onceToken != -1) {
    dispatch_once(&REIntrinsicFeatureSet_onceToken, &__block_literal_global_22);
  }
  v0 = (void *)REIntrinsicFeatureSet_IntrinsicFeatures;
  return v0;
}

void sub_21E6F1100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *> *>>(void *a1, uint64_t *a2, uint64_t *a3)
{
  unint64_t v4 = a2;
  uint64_t v6 = a1[1];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
      *(void *)(*a1 + 8 * i) = 0;
    uint64_t v8 = (void **)a1[2];
    a1[2] = 0;
    a1[3] = 0;
    if (v8) {
      BOOL v9 = a2 == a3;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      id v10 = v8;
    }
    else
    {
      do
      {
        std::string::operator=((std::string *)(v8 + 2), (const std::string *)(v4 + 2));
        *((_WORD *)v8 + 20) = *((_WORD *)v4 + 20);
        id v10 = (void **)*v8;
        std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__node_insert_multi(a1, v8);
        unint64_t v4 = (uint64_t *)*v4;
        if (v10) {
          BOOL v11 = v4 == a3;
        }
        else {
          BOOL v11 = 1;
        }
        uint64_t v8 = v10;
      }
      while (!v11);
    }
    std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__deallocate_node((int)a1, v10);
  }
  while (v4 != a3)
  {
    std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__emplace_multi<std::pair<std::string const,unsigned short> const&>(a1, (uint64_t)(v4 + 2));
    unint64_t v4 = (uint64_t *)*v4;
  }
}

void sub_21E6F17D0(void *a1)
{
  __cxa_begin_catch(a1);
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__deallocate_node(v1, v2);
  __cxa_rethrow();
}

void sub_21E6F17EC(_Unwind_Exception *a1)
{
}

void *std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__emplace_multi<std::pair<std::string const,unsigned short> const&>(void *a1, uint64_t a2)
{
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__construct_node<std::pair<std::string const,unsigned short> const&>((uint64_t)a1, a2, (uint64_t)&v4);
  return std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__node_insert_multi(a1, v4);
}

void sub_21E6F183C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__node_insert_multi(void *a1, void *a2)
{
  unint64_t v4 = (unsigned __int8 *)(a2 + 2);
  unint64_t v5 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)(a2 + 2));
  a2[1] = v5;
  inserted = std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__node_insert_multi_prepare((uint64_t)a1, v5, v4);
  std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__node_insert_multi_perform(a1, a2, inserted);
  return a2;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__node_insert_multi_prepare(uint64_t a1, unint64_t a2, unsigned __int8 *a3)
{
  uint64_t v6 = a1 + 32;
  float v7 = *(float *)(a1 + 32);
  unint64_t v8 = *(void *)(a1 + 8);
  float v9 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  if (!v8 || (float)(v7 * (float)v8) < v9)
  {
    BOOL v10 = 1;
    if (v8 >= 3) {
      BOOL v10 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v11 = v10 | (2 * v8);
    unint64_t v12 = vcvtps_u32_f32(v9 / v7);
    if (v11 <= v12) {
      size_t v13 = v12;
    }
    else {
      size_t v13 = v11;
    }
    std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__rehash<false>(a1, v13);
    unint64_t v8 = *(void *)(a1 + 8);
  }
  uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
  v14.i16[0] = vaddlv_u8(v14);
  unint64_t v15 = v14.u32[0];
  if (v14.u32[0] > 1uLL)
  {
    unint64_t v16 = a2;
    if (v8 <= a2) {
      unint64_t v16 = a2 % v8;
    }
  }
  else
  {
    unint64_t v16 = (v8 - 1) & a2;
  }
  uint64_t v17 = *(unsigned __int8 **)(*(void *)a1 + 8 * v16);
  if (v17)
  {
    long long v18 = *(unsigned __int8 **)v17;
    if (*(void *)v17)
    {
      int v19 = 0;
      do
      {
        unint64_t v20 = *((void *)v18 + 1);
        if (v15 > 1)
        {
          unint64_t v21 = *((void *)v18 + 1);
          if (v20 >= v8) {
            unint64_t v21 = v20 % v8;
          }
        }
        else
        {
          unint64_t v21 = v20 & (v8 - 1);
        }
        if (v21 != v16) {
          break;
        }
        int v22 = v20 == a2 ? std::equal_to<std::string>::operator()[abi:ne180100](v6, v18 + 16, a3) : 0;
        if (v19 & (v22 ^ 1)) {
          break;
        }
        v19 |= v22;
        uint64_t v17 = *(unsigned __int8 **)v17;
        long long v18 = *(unsigned __int8 **)v17;
      }
      while (*(void *)v17);
    }
  }
  return v17;
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__rehash<false>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__do_rehash<false>(a1, prime);
    }
  }
}

unint64_t std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__construct_node<std::pair<std::string const,unsigned short> const&>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = a1 + 16;
  uint64_t v7 = (char *)operator new(0x30uLL);
  unint64_t v8 = v7;
  *(void *)(a3 + 8) = v6;
  *(void *)a3 = v7;
  *(unsigned char *)(a3 + 16) = 0;
  float v9 = v7 + 16;
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(v7 + 16), *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *float v9 = *(_OWORD *)a2;
    *((void *)v7 + 4) = *(void *)(a2 + 16);
  }
  *((_WORD *)v8 + 20) = *(_WORD *)(a2 + 24);
  *(unsigned char *)(a3 + 16) = 1;
  unint64_t result = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)v9);
  *((void *)v8 + 1) = result;
  return result;
}

void sub_21E6F1BD0(_Unwind_Exception *a1)
{
  *uint64_t v2 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *>>>::operator()[abi:ne180100](v3, v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__do_rehash<false>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(unsigned __int8 ***)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = (unint64_t)v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      unint64_t v10 = v9.u32[0];
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      unint64_t v12 = *v7;
      if (*v7)
      {
        unint64_t v18 = v9.u32[0];
        do
        {
          unint64_t v13 = *((void *)v12 + 1);
          if (v10 > 1)
          {
            if (v13 >= a2) {
              v13 %= a2;
            }
          }
          else
          {
            v13 &= a2 - 1;
          }
          if (v13 == v8)
          {
            uint64_t v7 = (unsigned __int8 **)v12;
          }
          else if (*(void *)(*(void *)a1 + 8 * v13))
          {
            uint8x8_t v14 = *(unsigned __int8 **)v12;
            if (*(void *)v12)
            {
              unint64_t v15 = v12;
              while (1)
              {
                int v16 = std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, v12 + 16, v14 + 16);
                uint64_t v17 = *(unsigned __int8 **)v15;
                if (!v16) {
                  break;
                }
                uint8x8_t v14 = *(unsigned __int8 **)v17;
                unint64_t v15 = *(unsigned __int8 **)v15;
                if (!*(void *)v17) {
                  goto LABEL_32;
                }
              }
              uint8x8_t v14 = *(unsigned __int8 **)v15;
              uint64_t v17 = v15;
LABEL_32:
              unint64_t v10 = v18;
            }
            else
            {
              uint64_t v17 = v12;
            }
            *uint64_t v7 = v14;
            *(void *)uint64_t v17 = **(void **)(*(void *)a1 + 8 * v13);
            **(void **)(*(void *)a1 + 8 * v13) = v12;
          }
          else
          {
            *(void *)(*(void *)a1 + 8 * v13) = v7;
            uint64_t v7 = (unsigned __int8 **)v12;
            unint64_t v8 = v13;
          }
          unint64_t v12 = *v7;
        }
        while (*v7);
      }
    }
  }
  else
  {
    unint64_t v11 = *(void **)a1;
    *(void *)a1 = 0;
    if (v11) {
      operator delete(v11);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<unsigned long long,Gaussian>,void *> *>>(void *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = a1[1];
  if (!v6) {
    goto LABEL_9;
  }
  for (uint64_t i = 0; i != v6; *(void *)(*a1 + 8 * i++) = 0)
    ;
  unint64_t v8 = (uint64_t *)a1[2];
  a1[2] = 0;
  a1[3] = 0;
  if (v8)
  {
    while (a2 != a3)
    {
      unint64_t v9 = a2[2];
      v8[2] = v9;
      *(_OWORD *)(v8 + 3) = *(_OWORD *)(a2 + 3);
      unint64_t v10 = (uint64_t *)*v8;
      unint64_t v11 = v9 ^ HIDWORD(v9);
      v8[1] = v11;
      inserted = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__node_insert_multi_prepare((uint64_t)a1, v11, v8 + 2);
      std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__node_insert_multi_perform(a1, v8, inserted);
      a2 = (uint64_t *)*a2;
      unint64_t v8 = v10;
      if (!v10) {
        goto LABEL_9;
      }
    }
    do
    {
      unint64_t v13 = (uint64_t *)*v8;
      operator delete(v8);
      unint64_t v8 = v13;
    }
    while (v13);
  }
  else
  {
LABEL_9:
    while (a2 != a3)
    {
      std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__emplace_multi<std::pair<unsigned long long const,Gaussian> const&>(a1, (uint64_t)(a2 + 2));
      a2 = (uint64_t *)*a2;
    }
  }
}

void sub_21E6F1EA0(void *a1)
{
  __cxa_begin_catch(a1);
  do
  {
    uint64_t v2 = (void *)*v1;
    operator delete(v1);
    int v1 = v2;
  }
  while (v2);
  __cxa_rethrow();
}

void sub_21E6F1EC0(_Unwind_Exception *a1)
{
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__emplace_multi<std::pair<unsigned long long const,Gaussian> const&>(void *a1, uint64_t a2)
{
  int8x8_t v4 = operator new(0x28uLL);
  *((_OWORD *)v4 + 1) = *(_OWORD *)a2;
  v4[4] = *(void *)(a2 + 16);
  unint64_t v5 = v4[2] ^ HIDWORD(v4[2]);
  *int8x8_t v4 = 0;
  v4[1] = v5;
  inserted = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__node_insert_multi_prepare((uint64_t)a1, v5, v4 + 2);
  std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__node_insert_multi_perform(a1, v4, inserted);
  return v4;
}

void sub_21E6F1F48(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__node_insert_multi_perform(void *result, void *a2, void *a3)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(void *)(*result + 8 * v4) = result + 2;
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
LABEL_18:
    *(void *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }
  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
    if (v6 != v4) {
      goto LABEL_18;
    }
  }
LABEL_19:
  ++result[3];
  return result;
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__node_insert_multi_prepare(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v6 = *(void *)(a1 + 8);
  float v7 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    uint64_t v9 = 2 * v6;
    BOOL v10 = v6 < 3 || (v6 & (v6 - 1)) != 0;
    size_t v11 = v10 | v9;
    unint64_t v12 = vcvtps_u32_f32(v7 / v8);
    if (v11 <= v12) {
      size_t v13 = v12;
    }
    else {
      size_t v13 = v11;
    }
    std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__rehash<false>(a1, v13);
    unint64_t v6 = *(void *)(a1 + 8);
  }
  uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    unint64_t v15 = a2;
    if (v6 <= a2) {
      unint64_t v15 = a2 % v6;
    }
  }
  else
  {
    unint64_t v15 = (v6 - 1) & a2;
  }
  int v16 = *(void **)(*(void *)a1 + 8 * v15);
  if (!v16) {
    return 0;
  }
  int v17 = 0;
  do
  {
    unint64_t result = v16;
    int v16 = (void *)*v16;
    if (!v16) {
      break;
    }
    unint64_t v19 = v16[1];
    if (v14.u32[0] > 1uLL)
    {
      unint64_t v20 = v16[1];
      if (v19 >= v6) {
        unint64_t v20 = v19 % v6;
      }
    }
    else
    {
      unint64_t v20 = v19 & (v6 - 1);
    }
    if (v20 != v15) {
      break;
    }
    BOOL v21 = v19 == a2 && v16[2] == *a3;
    int v22 = v17 & !v21;
    v17 |= v21;
  }
  while (v22 != 1);
  return result;
}

void std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__rehash<false>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__do_rehash<false>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__do_rehash<false>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      for (uint64_t i = (void *)*v7; *v7; uint64_t i = (void *)*v7)
      {
        unint64_t v12 = i[1];
        if (v9.u32[0] > 1uLL)
        {
          if (v12 >= a2) {
            v12 %= a2;
          }
        }
        else
        {
          v12 &= a2 - 1;
        }
        if (v12 == v8)
        {
          uint64_t v7 = i;
        }
        else
        {
          size_t v13 = i;
          if (*(void *)(*(void *)a1 + 8 * v12))
          {
            do
            {
              uint8x8_t v14 = v13;
              size_t v13 = (void *)*v13;
            }
            while (v13 && i[2] == v13[2]);
            *uint64_t v7 = v13;
            *uint8x8_t v14 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = i;
          }
          else
          {
            *(void *)(*(void *)a1 + 8 * v12) = v7;
            uint64_t v7 = i;
            unint64_t v8 = v12;
          }
        }
      }
    }
  }
  else
  {
    BOOL v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

BOOL REFancyShrinkingDictionary::LoadModel(uint64_t a1, const std::string *a2)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](v40, a2, 24);
  __p = 0;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  int v36 = 0;
  long long v33 = 0u;
  long long v34 = 0u;
  int v35 = 1065353216;
  std::ios_base::getloc((const std::ios_base *)((char *)v40 + *(void *)(v40[0] - 24)));
  int8x8_t v3 = std::locale::use_facet((const std::locale *)&v32, MEMORY[0x263F8C108]);
  unsigned __int8 v4 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v3->__vftable[2].~facet_0)(v3, 10);
  std::locale::~locale((std::locale *)&v32);
  unint64_t v5 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v40, (uint64_t)&__p, v4);
  if ((*((unsigned char *)v5 + *(void *)(*v5 - 24) + 32) & 5) != 0) {
    goto LABEL_2;
  }
  if ((SHIBYTE(v39) & 0x80000000) == 0)
  {
    if (SHIBYTE(v39) == 24)
    {
      p_p = (uint64_t *)&__p;
      goto LABEL_11;
    }
LABEL_18:
    BOOL v14 = 0;
    goto LABEL_40;
  }
  if (v38 != 24) {
    goto LABEL_18;
  }
  p_p = (uint64_t *)__p;
LABEL_11:
  uint64_t v9 = *p_p;
  uint64_t v10 = p_p[1];
  uint64_t v11 = p_p[2];
  if (v9 != 0x72685379636E6146 || v10 != 0x6944676E696B6E69 || v11 != 0x7972616E6F697463) {
    goto LABEL_18;
  }
LABEL_2:
  memset(&v32, 0, sizeof(v32));
  uint64_t KeyValueInt = REFancyShrinkingDictionary::getKeyValueInt((uint64_t)v5, v40, &v32, &v36);
  if (KeyValueInt)
  {
    if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
    {
      if (v32.__r_.__value_.__l.__size_ != 12) {
        goto LABEL_37;
      }
      uint64_t v7 = (std::string *)v32.__r_.__value_.__r.__words[0];
    }
    else
    {
      if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) != 12) {
        goto LABEL_37;
      }
      uint64_t v7 = &v32;
    }
    std::string::size_type v15 = v7->__r_.__value_.__r.__words[0];
    int v16 = v7->__r_.__value_.__r.__words[1];
    if (v15 != 0x7265566C65646F4DLL || v16 != 1852795251) {
      goto LABEL_37;
    }
    if (v36 != *(_DWORD *)(a1 + 56)) {
      goto LABEL_37;
    }
    int v31 = 0;
    if ((REFancyShrinkingDictionary::getKeyValueInt(KeyValueInt, v40, &v32, &v31) & 1) == 0) {
      goto LABEL_37;
    }
    if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
    {
      if (v32.__r_.__value_.__l.__size_ != 11) {
        goto LABEL_37;
      }
      unint64_t v18 = (std::string *)v32.__r_.__value_.__r.__words[0];
    }
    else
    {
      if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) != 11) {
        goto LABEL_37;
      }
      unint64_t v18 = &v32;
    }
    std::string::size_type v19 = v18->__r_.__value_.__r.__words[0];
    uint64_t v20 = *(std::string::size_type *)((char *)v18->__r_.__value_.__r.__words + 3);
    if (v19 == 0x6F43736E656B6F54 && v20 == 0x746E756F43736E65)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)v40 + *(void *)(v40[0] - 24)));
      v24 = std::locale::use_facet(&v43, MEMORY[0x263F8C108]);
      unsigned __int8 v25 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v24->__vftable[2].~facet_0)(v24, 10);
      std::locale::~locale(&v43);
      uint64_t v26 = (uint64_t)std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v40, (uint64_t)&__p, v25);
      if ((*(unsigned char *)(v26 + *(void *)(*(void *)v26 - 24) + 32) & 5) != 0
        || (uint64_t v26 = std::operator!=[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&__p, "Tokens"),
            (v26 & 1) == 0))
      {
        int v30 = 0;
        unint64_t v27 = v31;
        if (v31)
        {
          BOOL v14 = 0;
          uint64_t v28 = 0;
          while ((REFancyShrinkingDictionary::getKeyValueInt(v26, v40, &v32, &v30) & 1) != 0)
          {
            __int16 v29 = v30;
            v43.__locale_ = (std::locale::__imp *)&v32;
            uint64_t v26 = (uint64_t)std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v33, (unsigned __int8 *)&v32, (uint64_t)&std::piecewise_construct, (long long **)&v43);
            *(_WORD *)(v26 + 40) = v29;
            BOOL v14 = ++v28 >= v27;
            if (v27 == v28) {
              goto LABEL_51;
            }
          }
        }
        else
        {
LABEL_51:
          if (&v33 != (long long *)a1)
          {
            *(_DWORD *)(a1 + 32) = v35;
            std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *> *>>((void *)a1, (uint64_t *)v34, 0);
          }
          BOOL v14 = 1;
        }
        goto LABEL_38;
      }
    }
  }
LABEL_37:
  BOOL v14 = 0;
LABEL_38:
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v32.__r_.__value_.__l.__data_);
  }
LABEL_40:
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table((uint64_t)&v33);
  if (SHIBYTE(v39) < 0) {
    operator delete(__p);
  }
  v40[0] = *MEMORY[0x263F8C2B8];
  uint64_t v22 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(uint64_t *)((char *)v40 + *(void *)(v40[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v40[2] = v22;
  v40[3] = MEMORY[0x263F8C318] + 16;
  if (v41 < 0) {
    operator delete((void *)v40[11]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x223C30EA0](&v42);
  return v14;
}

void sub_21E6F2900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,char a28)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table((uint64_t)&a16);
  if (a27 < 0) {
    operator delete(a22);
  }
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a28);
  _Unwind_Resume(a1);
}

uint64_t REFancyShrinkingDictionary::getKeyValueInt(uint64_t a1, void *a2, std::string *a3, int *a4)
{
  memset(&__str, 0, sizeof(__str));
  uint64_t v7 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, (uint64_t)&__str, 9u);
  if ((*((unsigned char *)v7 + *(void *)(*v7 - 24) + 32) & 5) != 0
    || (std::string::operator=(a3, &__str),
        unint64_t v8 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, (uint64_t)&__str, 0xAu),
        (*((unsigned char *)v8 + *(void *)(*v8 - 24) + 32) & 5) != 0))
  {
    uint64_t v9 = 0;
  }
  else
  {
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_str = &__str;
    }
    else {
      p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
    }
    *a4 = atoi((const char *)p_str);
    uint64_t v9 = 1;
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  return v9;
}

void sub_21E6F2A68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  unint64_t v8 = (void *)(a1 + 24);
  unint64_t v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }
    BOOL v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    BOOL v19 = 1;
    if (v11 >= 3) {
      BOOL v19 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v11);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__rehash<true>(a1, v22);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    *(void *)v26[0] = *v23;
    void *v23 = v26[0];
  }
  else
  {
    *(void *)v26[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v26[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v26[0])
    {
      unint64_t v24 = *(void *)(*(void *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11) {
          v24 %= v11;
        }
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v24) = v26[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v26[0];
  ++*v8;
  return i;
}

void sub_21E6F2CF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **__p, uint64_t a13)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *>>>::operator()[abi:ne180100]((uint64_t)&a13, __p);
  }
  _Unwind_Resume(exception_object);
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      size_t v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64;
      }
      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  uint64_t v8 = (char *)operator new(0x30uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)uint64_t v8 = 0;
  *((void *)v8 + 1) = a2;
  uint64_t v9 = (std::string *)(v8 + 16);
  uint64_t v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((void *)v10 + 1));
  }
  else
  {
    long long v11 = *v10;
    *((void *)v8 + 4) = *((void *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  *((_WORD *)v8 + 20) = 0;
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_21E6F30EC(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

uint64_t BayesianModel::LoadModel(uint64_t a1, const std::string *a2, int a3)
{
  pthread_rwlock_wrlock((pthread_rwlock_t *)a1);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](v82, a2, 24);
  v79 = 0;
  uint64_t v80 = 0;
  uint64_t v81 = 0;
  int v78 = 1;
  int v77 = 0;
  unint64_t v75 = 0;
  unint64_t v76 = 0;
  uint64_t v73 = 0x3FF0000000000000;
  uint64_t v74 = 0;
  uint64_t v72 = 0x3FF0000000000000;
  long long v70 = 0u;
  long long v69 = 0u;
  int v71 = 1065353216;
  std::ios_base::getloc((const std::ios_base *)((char *)v82 + *(void *)(v82[0] - 24)));
  uint64_t v6 = std::locale::use_facet(&v67, MEMORY[0x263F8C108]);
  LOBYTE(a2) = ((uint64_t (*)(const std::locale::facet *, uint64_t))v6->__vftable[2].~facet_0)(v6, 10);
  std::locale::~locale(&v67);
  uint64_t v7 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v82, (uint64_t)&v79, a2);
  if ((*((unsigned char *)v7 + *(void *)(*v7 - 24) + 32) & 5) == 0)
  {
    if (SHIBYTE(v81) < 0)
    {
      if (v80 != 15) {
        goto LABEL_90;
      }
      unint64_t v16 = (uint64_t *)v79;
    }
    else
    {
      if (SHIBYTE(v81) != 15) {
        goto LABEL_90;
      }
      unint64_t v16 = (uint64_t *)&v79;
    }
    uint64_t v17 = *v16;
    uint64_t v18 = *(uint64_t *)((char *)v16 + 7);
    if (v17 != 0x6665446C65646F4DLL || v18 != 0x6E6F6974696E6966) {
      goto LABEL_90;
    }
  }
  uint64_t v8 = std::string::basic_string[abi:ne180100]<0>(&v67, "ModelVersion");
  if (BayesianModel::GetKeyValueInt((uint64_t)v8, v82, (unsigned __int8 *)&v67, &v77))
  {
    uint64_t v9 = std::string::basic_string[abi:ne180100]<0>(__endptr, "FeaturesCount");
    if (BayesianModel::GetKeyValueInt((uint64_t)v9, v82, (unsigned __int8 *)__endptr, &v78))
    {
      uint64_t v10 = std::string::basic_string[abi:ne180100]<0>(v63, "TotalTrue");
      if (BayesianModel::GetKeyValueUInt64((uint64_t)v10, v82, (unsigned __int8 *)v63, &v76))
      {
        long long v11 = std::string::basic_string[abi:ne180100]<0>(v61, "TotalExamples");
        if (BayesianModel::GetKeyValueUInt64((uint64_t)v11, v82, (unsigned __int8 *)v61, &v75))
        {
          unint64_t v12 = std::string::basic_string[abi:ne180100]<0>(v59, "SumPredictions");
          if (BayesianModel::GetKeyValueDouble((uint64_t)v12, v82, (unsigned __int8 *)v59, (double *)&v74))
          {
            unint64_t v13 = std::string::basic_string[abi:ne180100]<0>(v57, "LogScore");
            if (BayesianModel::GetKeyValueDouble((uint64_t)v13, v82, (unsigned __int8 *)v57, (double *)&v73))
            {
              unint64_t v14 = std::string::basic_string[abi:ne180100]<0>(__p, "NormalizedLogScore");
              char KeyValueDouble = BayesianModel::GetKeyValueDouble((uint64_t)v14, v82, (unsigned __int8 *)__p, (double *)&v72);
              if (v56 < 0) {
                operator delete(__p[0]);
              }
            }
            else
            {
              char KeyValueDouble = 0;
            }
            if (v58 < 0) {
              operator delete(v57[0]);
            }
          }
          else
          {
            char KeyValueDouble = 0;
          }
          if (v60 < 0) {
            operator delete(v59[0]);
          }
        }
        else
        {
          char KeyValueDouble = 0;
        }
        if (v62 < 0) {
          operator delete(v61[0]);
        }
      }
      else
      {
        char KeyValueDouble = 0;
      }
      if (v64 < 0) {
        operator delete(v63[0]);
      }
    }
    else
    {
      char KeyValueDouble = 0;
    }
    if (v66 < 0) {
      operator delete(__endptr[0]);
    }
  }
  else
  {
    char KeyValueDouble = 0;
  }
  if (SHIBYTE(v68) < 0) {
    operator delete(v67.__locale_);
  }
  uint64_t v20 = -80;
  do
  {
    uint64_t v21 = std::string::basic_string[abi:ne180100]<0>(&v67, "CalibrationTrue");
    BayesianModel::GetKeyValueUInt64((uint64_t)v21, v82, (unsigned __int8 *)&v67, (unint64_t *)(a1 + v20 + 384));
    if (SHIBYTE(v68) < 0) {
      operator delete(v67.__locale_);
    }
    size_t v22 = std::string::basic_string[abi:ne180100]<0>(&v67, "CalibrationCount");
    BayesianModel::GetKeyValueUInt64((uint64_t)v22, v82, (unsigned __int8 *)&v67, (unint64_t *)(a1 + v20 + 464));
    if (SHIBYTE(v68) < 0) {
      operator delete(v67.__locale_);
    }
    v20 += 8;
  }
  while (v20);
  if ((KeyValueDouble & 1) == 0) {
    goto LABEL_90;
  }
  if (a3)
  {
    int v23 = v78;
    if (*(_DWORD *)(a1 + 240) < v78) {
      goto LABEL_90;
    }
  }
  else
  {
    if (v77 != *(_DWORD *)(a1 + 296)) {
      goto LABEL_90;
    }
    int v23 = v78;
    if (v78 != *(_DWORD *)(a1 + 240)) {
      goto LABEL_90;
    }
  }
  std::ios_base::getloc((const std::ios_base *)((char *)v82 + *(void *)(v82[0] - 24)));
  unint64_t v24 = std::locale::use_facet(&v67, MEMORY[0x263F8C108]);
  unsigned __int8 v25 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v24->__vftable[2].~facet_0)(v24, 10);
  std::locale::~locale(&v67);
  uint64_t v26 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v82, (uint64_t)&v79, v25);
  if ((*((unsigned char *)v26 + *(void *)(*v26 - 24) + 32) & 5) == 0)
  {
    if (SHIBYTE(v81) < 0)
    {
      if (v80 != 8) {
        goto LABEL_90;
      }
      v52 = v79;
    }
    else
    {
      if (SHIBYTE(v81) != 8) {
        goto LABEL_90;
      }
      v52 = &v79;
    }
    if (*v52 == 0x7365727574616546) {
      goto LABEL_52;
    }
LABEL_90:
    uint64_t v51 = 0;
    goto LABEL_91;
  }
LABEL_52:
  v63[0] = 0;
  uint64_t v27 = (std::locale::__imp *)operator new(0x28uLL);
  v67.__locale_ = v27;
  long long v68 = xmmword_21E7E9E20;
  *(void *)&long long v28 = 0x2020202020202020;
  *((void *)&v28 + 1) = 0x2020202020202020;
  *(_OWORD *)uint64_t v27 = v28;
  *((_OWORD *)v27 + 1) = v28;
  *((unsigned char *)v27 + 32) = 0;
  uint64_t v29 = 128;
  for (uint64_t i = 32; ; uint64_t i = v68)
  {
    unint64_t v31 = (v29 & 0x80u) == 0 ? v29 : i;
    if (!ReadStreamToCharacter(v82, (uint64_t)&v67, 9u, v31)) {
      break;
    }
    __endptr[0] = 0;
    uint64_t v32 = v68 >= 0 ? (const char *)&v67 : (const char *)v67.__locale_;
    v63[0] = (void *)strtoull(v32, __endptr, 16);
    if (!ReadStreamToCharacter(v82, (uint64_t)&v67, 9u, v31)) {
      break;
    }
    uint64_t v33 = v68 >= 0 ? (const char *)&v67 : (const char *)v67.__locale_;
    double v34 = atof(v33);
    if ((ReadStreamToCharacter(v82, (uint64_t)&v67, 0xAu, v31) & 1) == 0) {
      break;
    }
    char v35 = HIBYTE(v68);
    if (v68 >= 0) {
      locale = (const char *)&v67;
    }
    else {
      locale = (const char *)v67.__locale_;
    }
    double v37 = atof(locale);
    if ((*(void *)&v34 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
      || (double v38 = v37, (*(void *)&v37 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000))
    {
      uint64_t v51 = 0;
      if ((v35 & 0x80) == 0) {
        goto LABEL_91;
      }
      goto LABEL_86;
    }
    __endptr[0] = (char *)v63;
    unint64_t v39 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&v69, v63, (uint64_t)&std::piecewise_construct, (void **)__endptr);
    *((double *)v39 + 3) = v38;
    *((double *)v39 + 4) = v34;
    uint64_t v29 = HIBYTE(v68);
  }
  if (a3 && v23 < *(_DWORD *)(a1 + 240))
  {
    v61[0] = (void *)0xFF00000000000000;
    __endptr[0] = (char *)v61;
    unint64_t v40 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&v69, v61, (uint64_t)&std::piecewise_construct, (void **)__endptr);
    int v41 = *(_DWORD *)(a1 + 240);
    uint64_t v42 = *((void *)v40 + 3);
    double v43 = *((double *)v40 + 4);
    for (j = (double *)v70; j; j = *(double **)j)
    {
      double v45 = j[3];
      if (1.0 / v45 < 1.0)
      {
        double v46 = 1.0 / (1.0 / v45 + (1.0 - 1.0 / v45) * 0.2);
        double v47 = v46 * (j[4] / v45);
        j[3] = v46;
        j[4] = v47;
      }
    }
    __endptr[0] = (char *)v61;
    v48 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&v69, v61, (uint64_t)&std::piecewise_construct, (void **)__endptr);
    *((void *)v48 + 3) = v42;
    *((double *)v48 + 4) = v43 / sqrt((double)v23 + (double)v23) * sqrt((double)v41 + (double)v41);
  }
  unint64_t v49 = v75;
  *(void *)(a1 + 248) = v76;
  *(void *)(a1 + 256) = v49;
  uint64_t v50 = v73;
  *(void *)(a1 + 264) = v74;
  *(void *)(a1 + 272) = v50;
  *(void *)(a1 + 280) = v72;
  if ((long long *)(a1 + 200) != &v69)
  {
    *(_DWORD *)(a1 + 232) = v71;
    std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<unsigned long long,Gaussian>,void *> *>>((void *)(a1 + 200), (uint64_t *)v70, 0);
  }
  *(_DWORD *)(a1 + 296) = v77;
  uint64_t v51 = 1;
  if ((HIBYTE(v68) & 0x80) != 0) {
LABEL_86:
  }
    operator delete(v67.__locale_);
LABEL_91:
  std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::~__hash_table((uint64_t)&v69);
  if (SHIBYTE(v81) < 0) {
    operator delete(v79);
  }
  v82[0] = *MEMORY[0x263F8C2B8];
  uint64_t v53 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(uint64_t *)((char *)v82 + *(void *)(v82[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v82[2] = v53;
  v82[3] = MEMORY[0x263F8C318] + 16;
  if (v83 < 0) {
    operator delete((void *)v82[11]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x223C30EA0](&v84);
  pthread_rwlock_unlock((pthread_rwlock_t *)a1);
  return v51;
}

void sub_21E6F399C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,void *a40,uint64_t a41,int a42,__int16 a43,char a44,char a45,void *a46,uint64_t a47,int a48,__int16 a49,char a50,char a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  if (a33 < 0) {
    operator delete(a28);
  }
  if (a39 < 0) {
    operator delete(a34);
  }
  if (a45 < 0) {
    operator delete(a40);
  }
  if (a51 < 0) {
    operator delete(a46);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::~__hash_table((uint64_t)&a52);
  if (a69 < 0) {
    operator delete(a64);
  }
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a70);
  pthread_rwlock_unlock(v70);
  _Unwind_Resume(a1);
}

char *std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(uint64_t a1, void *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = *a2 ^ HIDWORD(*a2);
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2 ^ HIDWORD(*a2);
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    uint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      long long v11 = (char *)*v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = *((void *)v11 + 1);
          if (v12 == v7)
          {
            if (*((void *)v11 + 2) == *a2) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          long long v11 = *(char **)v11;
        }
        while (v11);
      }
    }
  }
  long long v11 = (char *)operator new(0x28uLL);
  *(void *)long long v11 = 0;
  *((void *)v11 + 1) = v7;
  *((void *)v11 + 2) = **a4;
  *(_OWORD *)(v11 + 24) = xmmword_21E7E9E10;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__rehash<true>(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v19 = *(void *)a1;
  uint64_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    *(void *)long long v11 = *v20;
LABEL_38:
    *uint64_t v20 = v11;
    goto LABEL_39;
  }
  *(void *)long long v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*(void *)v11)
  {
    unint64_t v21 = *(void *)(*(void *)v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }
    else
    {
      v21 &= v8 - 1;
    }
    uint64_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_21E6F3D00(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

uint64_t BayesianModel::GetKeyValueUInt64(uint64_t a1, void *a2, unsigned __int8 *a3, unint64_t *a4)
{
  __p = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v7 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, (uint64_t)&__p, 9u);
  if ((*((unsigned char *)v7 + *(void *)(*v7 - 24) + 32) & 5) != 0) {
    goto LABEL_18;
  }
  uint64_t v8 = a3[23];
  if ((v8 & 0x80u) == 0) {
    uint64_t v9 = a3[23];
  }
  else {
    uint64_t v9 = *((void *)a3 + 1);
  }
  uint64_t v10 = HIBYTE(v19);
  if (v19 < 0) {
    uint64_t v10 = v18;
  }
  if (v9 != v10) {
    goto LABEL_18;
  }
  if (v19 >= 0) {
    p_p = (unsigned __int8 *)&__p;
  }
  else {
    p_p = (unsigned __int8 *)__p;
  }
  if ((v8 & 0x80) != 0)
  {
    if (memcmp(*(const void **)a3, p_p, *((void *)a3 + 1))) {
      goto LABEL_18;
    }
  }
  else if (a3[23])
  {
    while (*a3 == *p_p)
    {
      ++a3;
      ++p_p;
      if (!--v8) {
        goto LABEL_17;
      }
    }
    goto LABEL_18;
  }
LABEL_17:
  unint64_t v12 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, (uint64_t)&__p, 0xAu);
  if ((*((unsigned char *)v12 + *(void *)(*v12 - 24) + 32) & 5) == 0)
  {
    unint64_t v16 = 0;
    if (v19 >= 0) {
      BOOL v15 = (const char *)&__p;
    }
    else {
      BOOL v15 = (const char *)__p;
    }
    *a4 = strtoull(v15, &v16, 10);
    uint64_t v13 = 1;
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v13 = 0;
LABEL_19:
  if (SHIBYTE(v19) < 0) {
    operator delete(__p);
  }
  return v13;
}

void sub_21E6F3F38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, uint64_t a2, unsigned __int8 a3)
{
  MEMORY[0x223C30D70](&v11, a1, 1);
  if (!v11) {
    return a1;
  }
  if (*(char *)(a2 + 23) < 0)
  {
    **(unsigned char **)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 23) = 0;
  }
  uint64_t v6 = 0;
  while (1)
  {
    uint64_t v7 = *(void **)((char *)a1 + *(void *)(*a1 - 24) + 40);
    uint64_t v8 = (unsigned char *)v7[3];
    if (v8 != (unsigned char *)v7[4])
    {
      v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }
    LODWORD(v7) = (*(uint64_t (**)(void *))(*v7 + 80))(v7);
    if (v7 == -1) {
      break;
    }
LABEL_9:
    if (v7 == a3)
    {
      int v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    --v6;
    if (*(char *)(a2 + 23) < 0 && *(void *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      int v9 = 4;
      goto LABEL_17;
    }
  }
  if (v6) {
    int v9 = 2;
  }
  else {
    int v9 = 6;
  }
LABEL_17:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | v9);
  return a1;
}

void sub_21E6F40B4(void *a1)
{
  __cxa_begin_catch(a1);
  uint64_t v2 = *v1;
  *(_DWORD *)((char *)v1 + *(void *)(*v1 - 24) + 32) |= 1u;
  if ((*((unsigned char *)v1 + *(void *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x21E6F4074);
  }
  __cxa_rethrow();
}

void sub_21E6F4130(_Unwind_Exception *a1)
{
}

void std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      char v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *uint64_t v7 = *v11;
            *char v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            char v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          char v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    uint64_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

uint64_t BayesianModel::GetKeyValueDouble(uint64_t a1, void *a2, unsigned __int8 *a3, double *a4)
{
  __p = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v7 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, (uint64_t)&__p, 9u);
  if ((*((unsigned char *)v7 + *(void *)(*v7 - 24) + 32) & 5) != 0) {
    goto LABEL_18;
  }
  uint64_t v8 = a3[23];
  if ((v8 & 0x80u) == 0) {
    uint64_t v9 = a3[23];
  }
  else {
    uint64_t v9 = *((void *)a3 + 1);
  }
  uint64_t v10 = HIBYTE(v18);
  if (v18 < 0) {
    uint64_t v10 = v17;
  }
  if (v9 != v10) {
    goto LABEL_18;
  }
  if (v18 >= 0) {
    p_p = (unsigned __int8 *)&__p;
  }
  else {
    p_p = (unsigned __int8 *)__p;
  }
  if ((v8 & 0x80) != 0)
  {
    if (memcmp(*(const void **)a3, p_p, *((void *)a3 + 1))) {
      goto LABEL_18;
    }
  }
  else if (a3[23])
  {
    while (*a3 == *p_p)
    {
      ++a3;
      ++p_p;
      if (!--v8) {
        goto LABEL_17;
      }
    }
    goto LABEL_18;
  }
LABEL_17:
  unint64_t v12 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, (uint64_t)&__p, 0xAu);
  if ((*((unsigned char *)v12 + *(void *)(*v12 - 24) + 32) & 5) == 0)
  {
    if (v18 >= 0) {
      BOOL v15 = (const char *)&__p;
    }
    else {
      BOOL v15 = (const char *)__p;
    }
    *a4 = atof(v15);
    uint64_t v13 = 1;
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v13 = 0;
LABEL_19:
  if (SHIBYTE(v18) < 0) {
    operator delete(__p);
  }
  return v13;
}

void sub_21E6F44F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t BayesianModel::GetKeyValueInt(uint64_t a1, void *a2, unsigned __int8 *a3, int *a4)
{
  __p = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v7 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, (uint64_t)&__p, 9u);
  if ((*((unsigned char *)v7 + *(void *)(*v7 - 24) + 32) & 5) != 0) {
    goto LABEL_18;
  }
  uint64_t v8 = a3[23];
  if ((v8 & 0x80u) == 0) {
    uint64_t v9 = a3[23];
  }
  else {
    uint64_t v9 = *((void *)a3 + 1);
  }
  uint64_t v10 = HIBYTE(v18);
  if (v18 < 0) {
    uint64_t v10 = v17;
  }
  if (v9 != v10) {
    goto LABEL_18;
  }
  if (v18 >= 0) {
    p_p = (unsigned __int8 *)&__p;
  }
  else {
    p_p = (unsigned __int8 *)__p;
  }
  if ((v8 & 0x80) != 0)
  {
    if (memcmp(*(const void **)a3, p_p, *((void *)a3 + 1))) {
      goto LABEL_18;
    }
  }
  else if (a3[23])
  {
    while (*a3 == *p_p)
    {
      ++a3;
      ++p_p;
      if (!--v8) {
        goto LABEL_17;
      }
    }
    goto LABEL_18;
  }
LABEL_17:
  unint64_t v12 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, (uint64_t)&__p, 0xAu);
  if ((*((unsigned char *)v12 + *(void *)(*v12 - 24) + 32) & 5) == 0)
  {
    if (v18 >= 0) {
      BOOL v15 = (const char *)&__p;
    }
    else {
      BOOL v15 = (const char *)__p;
    }
    *a4 = atoi(v15);
    uint64_t v13 = 1;
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v13 = 0;
LABEL_19:
  if (SHIBYTE(v18) < 0) {
    operator delete(__p);
  }
  return v13;
}

void sub_21E6F4674(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_21E6F7C10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL BayesianModel::InitializeFeatures(BayesianModel *this, int a2, int a3, double a4, unint64_t a5, double a6)
{
  pthread_rwlock_wrlock(&this->m_rwlock);
  this->int m_nFeaturesCount = a3 + 1;
  if (a3 <= 249)
  {
    *(_OWORD *)&this->m_nTotalTrue = 0u;
    this->m_nNumberOfTraining = 0;
    *(_OWORD *)&this->m_dSumPredictions = 0u;
    this->m_dNormalizedLogScore = 0.0;
    *(_OWORD *)this->m_nCalibrationCurveTrue = 0u;
    *(_OWORD *)&this->m_nCalibrationCurveTrue[2] = 0u;
    *(_OWORD *)&this->m_nCalibrationCurveTrue[4] = 0u;
    *(_OWORD *)&this->m_nCalibrationCurveTrue[6] = 0u;
    *(_OWORD *)&this->m_nCalibrationCurveTrue[8] = 0u;
    *(_OWORD *)this->m_nCalibrationCurveCount = 0u;
    *(_OWORD *)&this->m_nCalibrationCurveCount[2] = 0u;
    *(_OWORD *)&this->m_nCalibrationCurveCount[4] = 0u;
    *(_OWORD *)&this->m_nCalibrationCurveCount[6] = 0u;
    this->m_nModelVersion = a2;
    *(_OWORD *)&this->m_nCalibrationCurveCount[8] = 0u;
    std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::clear(&this->m_features.__table_.__bucket_list_.__ptr_.__value_);
    this->m_maxFeatureCoordinates = a5;
    this->m_dEpsilon = a6;
    StdNormal_Inv(a4);
    double v13 = v12;
    int m_nFeaturesCount = this->m_nFeaturesCount;
    unint64_t v17 = 0xFF00000000000000;
    uint64_t v18 = &v17;
    BOOL v15 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&this->m_features, &v17, (uint64_t)&std::piecewise_construct, &v18);
    *((void *)v15 + 3) = 0x3FF0000000000000;
    *((double *)v15 + 4) = v13 * sqrt((double)m_nFeaturesCount + (double)m_nFeaturesCount);
  }
  pthread_rwlock_unlock(&this->m_rwlock);
  return a3 < 250;
}

void sub_21E6F7D4C(_Unwind_Exception *a1)
{
  pthread_rwlock_unlock(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::clear(void *result)
{
  if (result[3])
  {
    int v1 = result;
    unint64_t result = (void *)result[2];
    if (result)
    {
      do
      {
        uint64_t v2 = (void *)*result;
        operator delete(result);
        unint64_t result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    uint64_t v3 = v1[1];
    if (v3)
    {
      for (uint64_t i = 0; i != v3; ++i)
        *(void *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

void StdNormal_Inv(double a1)
{
  BOOL v1 = a1 >= 0.0 && a1 <= 1.0;
  if (v1 && a1 != 0.0 && a1 != 1.0)
  {
    if (1.0 - a1 >= a1) {
      double v2 = a1;
    }
    else {
      double v2 = 1.0 - a1;
    }
    if (v2 <= 0.02425)
    {
      double v6 = sqrt(log(v2) * -2.0);
      double v5 = (((((v6 * -0.007784894 + -0.322396458) * v6 + -2.40075828) * v6 + -2.54973254) * v6 + 4.37466414) * v6
          + 2.93816398)
         / ((((v6 * 0.00778469571 + 0.322467129) * v6 + 2.44513414) * v6 + 3.75440866) * v6 + 1.0);
    }
    else
    {
      double v3 = v2 + -0.5;
      double v4 = v3 * v3;
      double v5 = v3
         * (((((v3 * v3 * -39.6968303 + 220.946098) * (v3 * v3) + -275.92851) * (v3 * v3) + 138.357752) * (v3 * v3)
           + -30.6647981)
          * (v3
           * v3)
          + 2.50662828)
         / (((((v4 * -54.4760988 + 161.585837) * v4 + -155.69898) * v4 + 66.8013119) * v4 + -13.2806816) * v4 + 1.0);
    }
    StdNormal_Cdf(v5);
    exp(v5 * v5 * 0.5);
  }
}

void StdNormal_Cdf(double a1)
{
  if ((*(void *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000)
  {
    double v1 = fabs(a1);
    if (v1 > 0.662912607) {
      exp(-(v1 * v1) * 0.5);
    }
  }
}

void sub_21E6F8FF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)RETransformerInvocation;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_21E6F9090(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<unsigned long>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }
  else
  {
    std::vector<unsigned long>::__append((char **)a1, a2 - v2);
  }
}

void std::vector<unsigned long>::__append(char **a1, unint64_t a2)
{
  double v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  double v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = *a1;
    uint64_t v9 = v7 - *a1;
    unint64_t v10 = a2 + (v9 >> 3);
    if (v10 >> 61) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v9 >> 3;
    uint64_t v12 = v5 - v8;
    if (v12 >> 2 > v10) {
      unint64_t v10 = v12 >> 2;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      float v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>(v4, v13);
      uint64_t v8 = *a1;
      uint64_t v7 = a1[1];
    }
    else
    {
      float v14 = 0;
    }
    BOOL v15 = &v14[8 * v11];
    unint64_t v16 = &v14[8 * v13];
    bzero(v15, 8 * a2);
    unint64_t v17 = &v15[8 * a2];
    while (v7 != v8)
    {
      uint64_t v18 = *((void *)v7 - 1);
      v7 -= 8;
      *((void *)v15 - 1) = v18;
      v15 -= 8;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void sub_21E6F92EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t REInvertRelation(uint64_t a1)
{
  if ((unint64_t)(a1 + 2) > 6) {
    return 4;
  }
  else {
    return qword_21E7E9F98[a1 + 2];
  }
}

void REEnsureFeatureWithType(void *a1, unint64_t a2)
{
  id v3 = a1;
  id v19 = v3;
  if (!v3)
  {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Feature must be non-nil", v4, v5, v6, v7, v8, v9, v17);
    id v3 = 0;
  }
  if ([v3 featureType] != a2)
  {
    unint64_t v10 = (void *)*MEMORY[0x263EFF4A0];
    uint64_t v18 = REStringFromFeatureType(a2);
    RERaiseInternalException(v10, @"Feature (%@) must be a %@ feature", v11, v12, v13, v14, v15, v16, (uint64_t)v19);
  }
}

void REEnsureMatchingFeatureTypes(void *a1, void *a2)
{
  id v19 = a1;
  id v9 = a2;
  unint64_t v10 = v19;
  if (v19)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Feature must be non-nil", v3, v4, v5, v6, v7, v8, v18);
    unint64_t v10 = 0;
    if (v9) {
      goto LABEL_3;
    }
  }
  RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Feature must be non-nil", v3, v4, v5, v6, v7, v8, v18);
  unint64_t v10 = v19;
LABEL_3:
  uint64_t v11 = [v10 featureType];
  if (v11 != [v9 featureType]) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Feature (%@) must match feature type of %@", v12, v13, v14, v15, v16, v17, (uint64_t)v19);
  }
}

void REReleaseFeatureValueTaggedPointer(CFTypeRef cf)
{
  if (cf)
  {
    if ((cf & 1) == 0) {
      CFRelease(cf);
    }
  }
}

uint64_t RECreateIntegerFeatureValueTaggedPointer(uint64_t a1)
{
  id v1 = +[REFeatureValue featureValueWithInt64:a1];
  unint64_t v2 = v1;
  if (v1)
  {
    switch([v1 type])
    {
      case 0:
        if ([v2 BOOLValue]) {
          uint64_t v3 = 9;
        }
        else {
          uint64_t v3 = 1;
        }
        break;
      case 1:
        unint64_t v4 = [v2 int64Value];
        if (v4 >> 61) {
          goto LABEL_22;
        }
        uint64_t v3 = (8 * v4) | 3;
        break;
      case 2:
        [v2 doubleValue];
        if (((*(void *)&v5 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE
          || vabdd_f64(COERCE_DOUBLE(*(void *)&v5 & 0xFFFFFFFFFFFFFFF8), v5) >= *(double *)&REFloatingPointTaggedPointerPrecision)
        {
          goto LABEL_22;
        }
        uint64_t v3 = *(void *)&v5 & 0xFFFFFFFFFFFFFFF8 | 5;
        break;
      case 3:
        uint64_t v6 = [v2 stringValue];
        if (!_RECanEncodeStringValue(v6))
        {

          goto LABEL_22;
        }
        id v7 = v6;
        unint64_t v8 = [v7 length];
        unint64_t v9 = 0;
        if (!v8) {
          goto LABEL_17;
        }
        for (uint64_t i = 0; i != v8; v9 = (char)[v7 characterAtIndex:i++] | (v9 << 8))
          ;
        if (v8 < 7)
        {
LABEL_17:
          unint64_t v11 = v8 - 7;
          do
            v9 <<= 8;
          while (!__CFADD__(v11++, 1));
        }

        uint64_t v3 = (8 * v9) | 7;
        break;
      default:
LABEL_22:
        uint64_t v3 = v2;
        break;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t REFeatureValueTypeForTaggedPointer(unint64_t a1)
{
  if (a1) {
    return (a1 >> 1) & 3;
  }
  else {
    return [(id)a1 type];
  }
}

uint64_t RECreateFeatureValueTaggedPointer(void *a1)
{
  id v1 = a1;
  unint64_t v2 = v1;
  if (v1)
  {
    switch([v1 type])
    {
      case 0:
        if ([v2 BOOLValue]) {
          uint64_t v3 = 9;
        }
        else {
          uint64_t v3 = 1;
        }
        break;
      case 1:
        unint64_t v4 = [v2 int64Value];
        if (v4 >> 61) {
          goto LABEL_22;
        }
        uint64_t v3 = (8 * v4) | 3;
        break;
      case 2:
        [v2 doubleValue];
        if (((*(void *)&v5 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE
          || vabdd_f64(COERCE_DOUBLE(*(void *)&v5 & 0xFFFFFFFFFFFFFFF8), v5) >= *(double *)&REFloatingPointTaggedPointerPrecision)
        {
          goto LABEL_22;
        }
        uint64_t v3 = *(void *)&v5 & 0xFFFFFFFFFFFFFFF8 | 5;
        break;
      case 3:
        uint64_t v6 = [v2 stringValue];
        if (!_RECanEncodeStringValue(v6))
        {

          goto LABEL_22;
        }
        id v7 = v6;
        unint64_t v8 = [v7 length];
        unint64_t v9 = 0;
        if (!v8) {
          goto LABEL_17;
        }
        for (uint64_t i = 0; i != v8; v9 = (char)[v7 characterAtIndex:i++] | (v9 << 8))
          ;
        if (v8 < 7)
        {
LABEL_17:
          unint64_t v11 = v8 - 7;
          do
            v9 <<= 8;
          while (!__CFADD__(v11++, 1));
        }

        uint64_t v3 = (8 * v9) | 7;
        break;
      default:
LABEL_22:
        uint64_t v3 = v2;
        break;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t RECreateDoubleFeatureValueTaggedPointer()
{
  +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  id v1 = v0;
  if (v0)
  {
    switch([v0 type])
    {
      case 0:
        if ([v1 BOOLValue]) {
          uint64_t v2 = 9;
        }
        else {
          uint64_t v2 = 1;
        }
        break;
      case 1:
        unint64_t v3 = [v1 int64Value];
        if (v3 >> 61) {
          goto LABEL_22;
        }
        uint64_t v2 = (8 * v3) | 3;
        break;
      case 2:
        [v1 doubleValue];
        if (((*(void *)&v4 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE
          || vabdd_f64(COERCE_DOUBLE(*(void *)&v4 & 0xFFFFFFFFFFFFFFF8), v4) >= *(double *)&REFloatingPointTaggedPointerPrecision)
        {
          goto LABEL_22;
        }
        uint64_t v2 = *(void *)&v4 & 0xFFFFFFFFFFFFFFF8 | 5;
        break;
      case 3:
        double v5 = [v1 stringValue];
        if (!_RECanEncodeStringValue(v5))
        {

          goto LABEL_22;
        }
        id v6 = v5;
        unint64_t v7 = [v6 length];
        unint64_t v8 = 0;
        if (!v7) {
          goto LABEL_17;
        }
        for (uint64_t i = 0; i != v7; v8 = (char)[v6 characterAtIndex:i++] | (v8 << 8))
          ;
        if (v7 < 7)
        {
LABEL_17:
          unint64_t v10 = v7 - 7;
          do
            v8 <<= 8;
          while (!__CFADD__(v10++, 1));
        }

        uint64_t v2 = (8 * v8) | 7;
        break;
      default:
LABEL_22:
        uint64_t v2 = v1;
        break;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

BOOL _RECanEncodeStringValue(void *a1)
{
  id v1 = a1;
  if (![v1 canBeConvertedToEncoding:1]) {
    goto LABEL_9;
  }
  unint64_t v2 = [v1 length];
  if (v2 > 7) {
    goto LABEL_9;
  }
  unint64_t v3 = v2;
  if (!v2)
  {
    BOOL v7 = 1;
    goto LABEL_10;
  }
  if ([v1 characterAtIndex:0] <= 0x7F)
  {
    uint64_t v4 = 1;
    do
    {
      unint64_t v5 = v4;
      if (v3 == v4) {
        break;
      }
      unsigned int v6 = [v1 characterAtIndex:v4];
      uint64_t v4 = v5 + 1;
    }
    while (v6 < 0x80);
    BOOL v7 = v5 >= v3;
  }
  else
  {
LABEL_9:
    BOOL v7 = 0;
  }
LABEL_10:

  return v7;
}

uint64_t REIntegerValueForTaggedPointer(unint64_t a1)
{
  if ((a1 & 1) == 0) {
    return [(id)a1 int64Value];
  }
  if ((a1 & 6) == 2) {
    return a1 >> 3;
  }
  return 0;
}

__CFString *RESignificantTimeChangeNotification()
{
  id v0 = +[_RESignificantTimeChangeNotifier sharedInstance];
  return @"RESignificantTimeChangeNotification";
}

BOOL RESubclassOverridesMethod(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = [a2 instanceMethodForSelector:a3];
  uint64_t v7 = [v5 methodForSelector:a3];

  if (v7) {
    BOOL v8 = v7 == v6;
  }
  else {
    BOOL v8 = 1;
  }
  return !v8;
}

void sub_21E6FE32C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, id *a10, id *a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a38, 8);
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(a10);
  objc_destroyWeak(&a64);
  _Unwind_Resume(a1);
}

void sub_21E6FF3E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 152));
  _Unwind_Resume(a1);
}

void sub_21E6FFAFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52)
{
}

void sub_21E6FFE90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void REExtractRules(void *a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v8 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    uint64_t v28 = *MEMORY[0x263EFF498];
    unint64_t v11 = 0x2644BB000uLL;
    do
    {
      uint64_t v12 = 0;
      uint64_t v27 = v9;
      do
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8 * v12);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = v7;
LABEL_10:
          [v14 addObject:v13];
          goto LABEL_11;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = v6;
          goto LABEL_10;
        }
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        uint64_t v16 = (void *)MEMORY[0x263EFF940];
        if (isKindOfClass)
        {
          [MEMORY[0x263EFF940] raise:v28, @"Rule %@ cannot be used. Only filtering and ranking rules are allowed to be used by a section", v13 format];
        }
        else
        {
          uint64_t v17 = (objc_class *)objc_opt_class();
          uint64_t v18 = NSStringFromClass(v17);
          id v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          uint64_t v20 = v10;
          unint64_t v21 = v11;
          id v22 = v7;
          id v23 = v5;
          unsigned __int8 v25 = v24 = v6;
          [v16 raise:v28, @"Unexpected rule %@. Use %@ or %@ instead.", v13, v18, v25 format];

          id v6 = v24;
          id v5 = v23;
          id v7 = v22;
          unint64_t v11 = v21;
          uint64_t v10 = v20;
          uint64_t v9 = v27;
        }
LABEL_11:
        ++v12;
      }
      while (v9 != v12);
      uint64_t v26 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
      uint64_t v9 = v26;
    }
    while (v26);
  }
}

void sub_21E700BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void BayesianModel::~BayesianModel(BayesianModel *this)
{
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::~__hash_table(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      operator delete(v2);
      unint64_t v2 = v3;
    }
    while (v3);
  }
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void BayesianModel::BayesianModel(BayesianModel *this)
{
  this->m_features.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&this->m_features.__table_.__p1_.__value_.__next_ = 0u;
  this->m_features.__table_.__p3_.__value_ = 1.0;
  this->m_empty = (Gaussian)xmmword_21E7E9E10;
  this->int m_nFeaturesCount = 0;
  this->m_nNumberOfTraining = 0;
  *(_OWORD *)&this->m_nTotalTrue = 0u;
  this->m_dNormalizedLogScore = 0.0;
  *(_OWORD *)&this->m_dSumPredictions = 0u;
  *(_OWORD *)this->m_nCalibrationCurveTrue = 0u;
  *(_OWORD *)&this->m_nCalibrationCurveTrue[2] = 0u;
  *(_OWORD *)&this->m_nCalibrationCurveTrue[4] = 0u;
  *(_OWORD *)&this->m_nCalibrationCurveTrue[6] = 0u;
  *(_OWORD *)&this->m_nCalibrationCurveTrue[8] = 0u;
  *(_OWORD *)this->m_nCalibrationCurveCount = 0u;
  *(_OWORD *)&this->m_nCalibrationCurveCount[2] = 0u;
  *(_OWORD *)&this->m_nCalibrationCurveCount[4] = 0u;
  *(_OWORD *)&this->m_nCalibrationCurveCount[6] = 0u;
  *(_OWORD *)&this->m_nCalibrationCurveCount[8] = 0u;
  pthread_rwlock_init(&this->m_rwlock, 0);
}

void sub_21E701698(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

dispatch_queue_t _RECreateSharedQueueAttr(void *a1, void *a2)
{
  uint64_t v3 = _RECreateSharedQueueAttr_onceToken;
  uint64_t v4 = a2;
  id v5 = a1;
  if (v3 != -1) {
    dispatch_once(&_RECreateSharedQueueAttr_onceToken, &__block_literal_global_6);
  }
  id v6 = dispatch_queue_attr_make_with_autorelease_frequency(v4, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

  id v7 = [@"com.apple.RelevanceEngine." stringByAppendingString:v5];

  id v8 = v7;
  uint64_t v9 = (const char *)[v8 UTF8String];
  dispatch_queue_t v10 = dispatch_queue_create_with_target_V2(v9, v6, (dispatch_queue_t)_RECreateSharedQueueAttr_SharedQueue);

  return v10;
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  unint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__deallocate_node(int a1, void **__p)
{
  if (__p)
  {
    unint64_t v2 = __p;
    do
    {
      uint64_t v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      unint64_t v2 = v3;
    }
    while (v3);
  }
}

uint64_t NaturalLanguageLibrary()
{
  uint64_t v0 = NaturalLanguageLibraryCore();
  if (!v0)
  {
    unint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t NaturalLanguageLibraryCore()
{
  if (!NaturalLanguageLibraryCore_frameworkLibrary) {
    NaturalLanguageLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return NaturalLanguageLibraryCore_frameworkLibrary;
}

void sub_21E703DB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

id soft__REEngineDefaults()
{
  if (RelevanceEngineLibraryCore_0())
  {
    uint64_t v4 = 0;
    id v5 = &v4;
    uint64_t v6 = 0x2050000000;
    uint64_t v0 = (void *)get_REEngineDefaultsClass_softClass;
    uint64_t v7 = get_REEngineDefaultsClass_softClass;
    if (!get_REEngineDefaultsClass_softClass)
    {
      v3[0] = MEMORY[0x263EF8330];
      v3[1] = 3221225472;
      v3[2] = __get_REEngineDefaultsClass_block_invoke;
      v3[3] = &unk_2644BC768;
      v3[4] = &v4;
      __get_REEngineDefaultsClass_block_invoke((uint64_t)v3);
      uint64_t v0 = (void *)v5[3];
    }
    id v1 = v0;
    _Block_object_dispose(&v4, 8);
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

void sub_21E704050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id soft__REEngineDefaults_0()
{
  if (RelevanceEngineLibraryCore_1())
  {
    uint64_t v4 = 0;
    id v5 = &v4;
    uint64_t v6 = 0x2050000000;
    uint64_t v0 = (void *)get_REEngineDefaultsClass_softClass_0;
    uint64_t v7 = get_REEngineDefaultsClass_softClass_0;
    if (!get_REEngineDefaultsClass_softClass_0)
    {
      v3[0] = MEMORY[0x263EF8330];
      v3[1] = 3221225472;
      v3[2] = __get_REEngineDefaultsClass_block_invoke_0;
      v3[3] = &unk_2644BC768;
      v3[4] = &v4;
      __get_REEngineDefaultsClass_block_invoke_0((uint64_t)v3);
      uint64_t v0 = (void *)v5[3];
    }
    id v1 = v0;
    _Block_object_dispose(&v4, 8);
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

void sub_21E704148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id soft__REEngineDefaults_1()
{
  if (RelevanceEngineLibraryCore_2())
  {
    uint64_t v4 = 0;
    id v5 = &v4;
    uint64_t v6 = 0x2050000000;
    uint64_t v0 = (void *)get_REEngineDefaultsClass_softClass_1;
    uint64_t v7 = get_REEngineDefaultsClass_softClass_1;
    if (!get_REEngineDefaultsClass_softClass_1)
    {
      v3[0] = MEMORY[0x263EF8330];
      v3[1] = 3221225472;
      v3[2] = __get_REEngineDefaultsClass_block_invoke_1;
      v3[3] = &unk_2644BC768;
      v3[4] = &v4;
      __get_REEngineDefaultsClass_block_invoke_1((uint64_t)v3);
      uint64_t v0 = (void *)v5[3];
    }
    id v1 = v0;
    _Block_object_dispose(&v4, 8);
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

void sub_21E704240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id soft__REEngineDefaults_2()
{
  if (RelevanceEngineLibraryCore_4())
  {
    uint64_t v4 = 0;
    id v5 = &v4;
    uint64_t v6 = 0x2050000000;
    uint64_t v0 = (void *)get_REEngineDefaultsClass_softClass_3;
    uint64_t v7 = get_REEngineDefaultsClass_softClass_3;
    if (!get_REEngineDefaultsClass_softClass_3)
    {
      v3[0] = MEMORY[0x263EF8330];
      v3[1] = 3221225472;
      v3[2] = __get_REEngineDefaultsClass_block_invoke_3;
      v3[3] = &unk_2644BC768;
      v3[4] = &v4;
      __get_REEngineDefaultsClass_block_invoke_3((uint64_t)v3);
      uint64_t v0 = (void *)v5[3];
    }
    id v1 = v0;
    _Block_object_dispose(&v4, 8);
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

void sub_21E704338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t RelevanceEngineLibraryCore()
{
  if (!RelevanceEngineLibraryCore_frameworkLibrary) {
    RelevanceEngineLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return RelevanceEngineLibraryCore_frameworkLibrary;
}

uint64_t RelevanceEngineLibraryCore_0()
{
  if (!RelevanceEngineLibraryCore_frameworkLibrary_0) {
    RelevanceEngineLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  return RelevanceEngineLibraryCore_frameworkLibrary_0;
}

uint64_t RelevanceEngineLibraryCore_1()
{
  if (!RelevanceEngineLibraryCore_frameworkLibrary_1) {
    RelevanceEngineLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  return RelevanceEngineLibraryCore_frameworkLibrary_1;
}

uint64_t RelevanceEngineLibraryCore_2()
{
  if (!RelevanceEngineLibraryCore_frameworkLibrary_2) {
    RelevanceEngineLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  return RelevanceEngineLibraryCore_frameworkLibrary_2;
}

uint64_t RelevanceEngineLibraryCore_3()
{
  if (!RelevanceEngineLibraryCore_frameworkLibrary_3) {
    RelevanceEngineLibraryCore_frameworkLibrary_3 = _sl_dlopen();
  }
  return RelevanceEngineLibraryCore_frameworkLibrary_3;
}

uint64_t RelevanceEngineLibraryCore_4()
{
  if (!RelevanceEngineLibraryCore_frameworkLibrary_4) {
    RelevanceEngineLibraryCore_frameworkLibrary_4 = _sl_dlopen();
  }
  return RelevanceEngineLibraryCore_frameworkLibrary_4;
}

uint64_t *std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t *a1, const std::string *a2, int a3)
{
  uint64_t v6 = MEMORY[0x263F8C328] + 104;
  a1[16] = MEMORY[0x263F8C328] + 104;
  uint64_t v7 = a1 + 2;
  uint64_t v8 = MEMORY[0x263F8C328] + 64;
  a1[2] = MEMORY[0x263F8C328] + 64;
  uint64_t v9 = (uint64_t)(a1 + 3);
  dispatch_queue_t v10 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v11 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v12 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *a1 = v12;
  *(uint64_t *)((char *)a1 + *(void *)(v12 - 24)) = v11;
  a1[1] = 0;
  uint64_t v13 = (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24));
  std::ios_base::init(v13, a1 + 3);
  uint64_t v14 = MEMORY[0x263F8C328] + 24;
  v13[1].__vftable = 0;
  v13[1].__fmtflags_ = -1;
  uint64_t v15 = v10[5];
  uint64_t v16 = v10[4];
  a1[2] = v16;
  *(void *)((char *)v7 + *(void *)(v16 - 24)) = v15;
  uint64_t v17 = v10[1];
  *a1 = v17;
  *(uint64_t *)((char *)a1 + *(void *)(v17 - 24)) = v10[6];
  *a1 = v14;
  a1[16] = v6;
  a1[2] = v8;
  std::stringbuf::basic_stringbuf[abi:ne180100](v9, a2, a3);
  return a1;
}

void sub_21E704ECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

uint64_t std::stringbuf::basic_stringbuf[abi:ne180100](uint64_t a1, const std::string *a2, int a3)
{
  uint64_t v6 = std::streambuf::basic_streambuf();
  *(void *)uint64_t v6 = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_DWORD *)(v6 + 96) = a3;
  std::string::operator=((std::string *)(v6 + 64), a2);
  std::stringbuf::__init_buf_ptrs[abi:ne180100](a1);
  return a1;
}

void sub_21E704F70(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 87) < 0) {
    operator delete(*v2);
  }
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

void std::stringbuf::__init_buf_ptrs[abi:ne180100](uint64_t a1)
{
  *(void *)(a1 + 88) = 0;
  unint64_t v2 = (std::string *)(a1 + 64);
  char v3 = *(unsigned char *)(a1 + 87);
  if (v3 < 0)
  {
    uint64_t v4 = *(std::string **)(a1 + 64);
    unint64_t v5 = *(void *)(a1 + 72);
  }
  else
  {
    uint64_t v4 = v2;
    unint64_t v5 = *(unsigned __int8 *)(a1 + 87);
  }
  int v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 8) != 0)
  {
    *(void *)(a1 + 88) = (char *)v4 + v5;
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = (char *)v4 + v5;
  }
  if ((v6 & 0x10) != 0)
  {
    *(void *)(a1 + 88) = (char *)v4 + v5;
    std::string::size_type v7 = v3 < 0 ? (*(void *)(a1 + 80) & 0x7FFFFFFFFFFFFFFFLL) - 1 : 22;
    std::string::resize(v2, v7, 0);
    uint64_t v8 = *(char *)(a1 + 87) < 0 ? *(void *)(a1 + 72) : *(unsigned __int8 *)(a1 + 87);
    *(void *)(a1 + 40) = v4;
    *(void *)(a1 + 48) = v4;
    *(void *)(a1 + 56) = (char *)v4 + v8;
    if ((*(unsigned char *)(a1 + 96) & 3) != 0)
    {
      if (v5 >> 31)
      {
        uint64_t v9 = ((v5 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        unint64_t v10 = 0x7FFFFFFF * ((v9 + ((v5 - 0x80000000 - v9) >> 1)) >> 30);
        uint64_t v4 = (std::string *)((char *)v4 + v10 + 0x7FFFFFFF);
        unint64_t v5 = v5 - v10 - 0x7FFFFFFF;
        *(void *)(a1 + 48) = v4;
      }
      if (v5) {
        *(void *)(a1 + 48) = (char *)v4 + v5;
      }
    }
  }
}

id getNLTagSchemeLemma()
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getNLTagSchemeLemmaSymbolLoc_ptr;
  uint64_t v8 = getNLTagSchemeLemmaSymbolLoc_ptr;
  if (!getNLTagSchemeLemmaSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)NaturalLanguageLibrary();
    v6[3] = (uint64_t)dlsym(v1, "NLTagSchemeLemma");
    getNLTagSchemeLemmaSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[RELemmaEnumerator init]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  unint64_t v2 = *v0;
  return v2;
}

Class __getNLTaggerClass_block_invoke(uint64_t a1)
{
  NaturalLanguageLibrary();
  Class result = objc_getClass("NLTagger");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getNLTaggerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getNLTaggerClass_block_invoke_cold_1();
    return (Class)___Z18re_tokenize_stringRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPNS_6vectorIS5_NS3_IS5_EEEE_block_invoke();
  }
  return result;
}

uint64_t ___Z18re_tokenize_stringRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPNS_6vectorIS5_NS3_IS5_EEEE_block_invoke()
{
  pthread_rwlock_init(&re_tokenize_string(std::string const&,std::vector<std::string> *)::m_rwlock, 0);
  re_tokenize_string(std::string const&,std::vector<std::string> *)::Enumerator = objc_alloc_init(RELemmaEnumerator);
  return MEMORY[0x270F9A758]();
}

void __RETokenizeString_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
  uint64_t v1 = (void *)RETokenizeString::TokenizedStringCache;
  RETokenizeString::TokenizedStringCache = v0;

  RETokenizeString::CacheLock = 0;
}

void __REIntrinsicFeatureSet_block_invoke()
{
  id v5 = +[REFeatureSet featureSet];
  uint64_t v0 = +[REFeature forcedFeature];
  [v5 addFeature:v0];

  uint64_t v1 = +[REFeature groupFeature];
  [v5 addFeature:v1];

  unint64_t v2 = +[REFeature relevanceThresholdFeature];
  [v5 addFeature:v2];

  uint64_t v3 = [v5 copy];
  uint64_t v4 = (void *)REIntrinsicFeatureSet_IntrinsicFeatures;
  REIntrinsicFeatureSet_IntrinsicFeatures = v3;
}

void __REGetDisableMLModel_block_invoke_2()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v6 = 0;
  if (RelevanceEngineLibraryCore_4())
  {
    uint64_t v0 = [soft__REEngineDefaults_2() globalDefaults];
  }
  else
  {
    uint64_t v0 = 0;
  }
  unsigned int v1 = [v0 _BOOLValueForKey:@"DisableMLModel" set:&v6];
  if (v6) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  uint64_t v3 = RELogForDomain(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [NSNumber numberWithBool:v2];
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_21E6E6000, v3, OS_LOG_TYPE_DEFAULT, "Prefs reading value for key DisableMLModel: %@", buf, 0xCu);
  }
  if (v6) {
    char v5 = v2;
  }
  else {
    char v5 = 0;
  }
  REGetDisableMLModel__REValueDisableMLModel = v5;
}

void __REGetDisableAllModelPredictions_block_invoke_2()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v6 = 0;
  if (RelevanceEngineLibraryCore_4())
  {
    uint64_t v0 = [soft__REEngineDefaults_2() globalDefaults];
  }
  else
  {
    uint64_t v0 = 0;
  }
  unsigned int v1 = [v0 _BOOLValueForKey:@"DisableAllModelPredictions" set:&v6];
  if (v6) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  uint64_t v3 = RELogForDomain(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [NSNumber numberWithBool:v2];
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_21E6E6000, v3, OS_LOG_TYPE_DEFAULT, "Prefs reading value for key DisableAllModelPredictions: %@", buf, 0xCu);
  }
  if (v6) {
    char v5 = v2;
  }
  else {
    char v5 = 0;
  }
  REGetDisableAllModelPredictions__REValueDisableAllModelPredictions = v5;
}

uint64_t __REGetDisableAllModelPredictions_block_invoke()
{
  uint64_t result = _REGetIsInternalBuild();
  _isInternalDevice_12 = result;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
}

void __Block_byref_object_dispose__19(uint64_t a1)
{
}

void __Block_byref_object_dispose__20(uint64_t a1)
{
}

void __Block_byref_object_dispose__21(uint64_t a1)
{
}

void __Block_byref_object_dispose__22(uint64_t a1)
{
}

void __Block_byref_object_dispose__23(uint64_t a1)
{
}

void __Block_byref_object_dispose__24(uint64_t a1)
{
}

void __Block_byref_object_dispose__25(uint64_t a1)
{
}

void __Block_byref_object_dispose__26(uint64_t a1)
{
}

void __Block_byref_object_dispose__27(uint64_t a1)
{
}

void __Block_byref_object_dispose__28(uint64_t a1)
{
}

void __Block_byref_object_dispose__29(uint64_t a1)
{
}

void __Block_byref_object_dispose__30(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_copy__9(uint64_t a1, uint64_t a2)
{
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_copy__18(uint64_t a1, uint64_t a2)
{
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__22(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__24(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__25(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__26(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_copy__27(uint64_t a1, uint64_t a2)
{
}

uint64_t __Block_byref_object_copy__28(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__29(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__30(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x223C31700](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_21E706258(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

BOOL std::operator!=[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (*((char *)a1 + 23) < 0)
  {
    if (v4 == a1[1])
    {
      if (v4 == -1) {
        goto LABEL_10;
      }
      a1 = (void *)*a1;
      return memcmp(a1, __s, v4) != 0;
    }
  }
  else if (v4 == *((unsigned __int8 *)a1 + 23))
  {
    if (v4 == -1) {
LABEL_10:
    }
      std::string::__throw_out_of_range[abi:ne180100]();
    return memcmp(a1, __s, v4) != 0;
  }
  return 1;
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::clear(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__move_assign(uint64_t a1, uint64_t *a2)
{
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::clear(a1);
  uint64_t v4 = *a2;
  *a2 = 0;
  char v5 = *(void **)a1;
  *(void *)a1 = v4;
  if (v5) {
    operator delete(v5);
  }
  uint64_t v8 = a2[2];
  uint64_t v7 = a2 + 2;
  uint64_t v6 = v8;
  uint64_t v9 = *(v7 - 1);
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 8) = v9;
  *(v7 - 1) = 0;
  uint64_t v10 = v7[1];
  *(void *)(a1 + 24) = v10;
  *(_DWORD *)(a1 + 32) = *((_DWORD *)v7 + 4);
  if (v10)
  {
    unint64_t v11 = *(void *)(v6 + 8);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        v11 %= v12;
      }
    }
    else
    {
      v11 &= v12 - 1;
    }
    *(void *)(*(void *)a1 + 8 * v11) = a1 + 16;
    *uint64_t v7 = 0;
    v7[1] = 0;
  }
}

void REFancyShrinkingDictionary::REFancyShrinkingDictionary(REFancyShrinkingDictionary *this, unint64_t a2, unint64_t a3, int a4, BOOL a5, BOOL a6)
{
  this->m_mapDocumentFrequency.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&this->m_mapDocumentFrequency.__table_.__p1_.__value_.__next_ = 0u;
  this->m_mapDocumentFrequency.__table_.__p3_.__value_ = 1.0;
  this->m_maxSize = a2;
  this->m_shrinkSize = a3;
  this->m_nVersion = a4;
  this->m_trimTop = a5;
  this->m_shinksOnTotalCount = a6;
}

{
  this->m_mapDocumentFrequency.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&this->m_mapDocumentFrequency.__table_.__p1_.__value_.__next_ = 0u;
  this->m_mapDocumentFrequency.__table_.__p3_.__value_ = 1.0;
  this->m_maxSize = a2;
  this->m_shrinkSize = a3;
  this->m_nVersion = a4;
  this->m_trimTop = a5;
  this->m_shinksOnTotalCount = a6;
}

uint64_t re_tokenize_string(uint64_t *a1, uint64_t *a2)
{
  v42[2] = *MEMORY[0x263EF8340];
  if (!a2) {
    return 0;
  }
  if (re_tokenize_string(std::string const&,std::vector<std::string> *)::onceToken != -1) {
    dispatch_once(&re_tokenize_string(std::string const&,std::vector<std::string> *)::onceToken, &__block_literal_global_2);
  }
  if (!re_tokenize_string(std::string const&,std::vector<std::string> *)::Enumerator) {
    return 0;
  }
  pthread_rwlock_wrlock(&re_tokenize_string(std::string const&,std::vector<std::string> *)::m_rwlock);
  if (*((char *)a1 + 23) >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = (uint64_t *)*a1;
  }
  char v5 = [NSString stringWithUTF8String:v4];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = ___Z18re_tokenize_stringRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPNS_6vectorIS5_NS3_IS5_EEEE_block_invoke_2;
  v40[3] = &__block_descriptor_40_e18_v16__0__NSString_8l;
  v40[4] = a2;
  uint64_t v6 = [(id)re_tokenize_string(std::string const&,std::vector<std::string> *)::Enumerator enumerateLemmasInString:v5 withBlock:v40];
  uint64_t v7 = v6;
  if (v6)
  {
    unsigned int v35 = v6;
    uint64_t v36 = v5;
    uint64_t v9 = *a2;
    uint64_t v8 = a2[1];
    std::string::basic_string[abi:ne180100]<0>(__p, " ");
    unint64_t v10 = (v8 - v9) / 24;
    if (v10 >= 2)
    {
      uint64_t v11 = 0;
      for (unint64_t i = 1; i != v10; ++i)
      {
        if (0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3) <= i - 1) {
          std::vector<std::string>::__throw_out_of_range[abi:ne180100]();
        }
        std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)(*a2 + v11), (const void **)__p, (uint64_t)&v37);
        if (0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3) <= i) {
          std::vector<std::string>::__throw_out_of_range[abi:ne180100]();
        }
        uint64_t v13 = *a2 + v11;
        uint64_t v16 = *(const std::string::value_type **)(v13 + 24);
        uint64_t v14 = v13 + 24;
        uint64_t v15 = v16;
        int v17 = *(char *)(v14 + 23);
        if (v17 >= 0) {
          uint64_t v18 = (const std::string::value_type *)v14;
        }
        else {
          uint64_t v18 = v15;
        }
        if (v17 >= 0) {
          std::string::size_type v19 = *(unsigned __int8 *)(v14 + 23);
        }
        else {
          std::string::size_type v19 = *(void *)(v14 + 8);
        }
        uint64_t v20 = std::string::append(&v37, v18, v19);
        std::string::size_type v21 = v20->__r_.__value_.__r.__words[0];
        v42[0] = v20->__r_.__value_.__l.__size_;
        *(void *)((char *)v42 + 7) = *(std::string::size_type *)((char *)&v20->__r_.__value_.__r.__words[1] + 7);
        char v22 = HIBYTE(v20->__r_.__value_.__r.__words[2]);
        v20->__r_.__value_.__l.__size_ = 0;
        v20->__r_.__value_.__r.__words[2] = 0;
        v20->__r_.__value_.__r.__words[0] = 0;
        unint64_t v23 = a2[1];
        unint64_t v24 = a2[2];
        if (v23 >= v24)
        {
          unint64_t v27 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v23 - *a2) >> 3);
          unint64_t v28 = v27 + 1;
          if (v27 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v29 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v24 - *a2) >> 3);
          if (2 * v29 > v28) {
            unint64_t v28 = 2 * v29;
          }
          if (v29 >= 0x555555555555555) {
            unint64_t v30 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v30 = v28;
          }
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a2 + 2);
          if (v30) {
            long long v31 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)(a2 + 2), v30);
          }
          else {
            long long v31 = 0;
          }
          long long v32 = v31 + v27;
          __v.__first_ = v31;
          __v.__begin_ = v32;
          __v.__end_cap_.__value_ = &v31[v30];
          std::string::size_type v33 = v42[0];
          v32->__r_.__value_.__r.__words[0] = v21;
          v32->__r_.__value_.__l.__size_ = v33;
          *(std::string::size_type *)((char *)&v32->__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)v42 + 7);
          *((unsigned char *)&v32->__r_.__value_.__s + 23) = v22;
          __v.__end_ = v32 + 1;
          std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a2, &__v);
          unint64_t v26 = a2[1];
          std::__split_buffer<std::string>::~__split_buffer(&__v);
        }
        else
        {
          uint64_t v25 = v42[0];
          *(void *)unint64_t v23 = v21;
          *(void *)(v23 + 8) = v25;
          *(void *)(v23 + 15) = *(void *)((char *)v42 + 7);
          *(unsigned char *)(v23 + 23) = v22;
          unint64_t v26 = v23 + 24;
          a2[1] = v23 + 24;
        }
        a2[1] = v26;
        if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v37.__r_.__value_.__l.__data_);
        }
        v11 += 24;
      }
    }
    if (v39 < 0) {
      operator delete(__p[0]);
    }
    char v5 = v36;
    uint64_t v7 = v35;
  }

  pthread_rwlock_unlock(&re_tokenize_string(std::string const&,std::vector<std::string> *)::m_rwlock);
  return v7;
}

void sub_21E70847C(_Unwind_Exception *a1, uint64_t a2, void *__p, uint64_t a4, int a5, __int16 a6, char a7, char a8, void *a9, void *a10, int __pa, __int16 __p_4, char __p_6, char __p_7, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, std::__split_buffer<std::string> *a20)
{
  pthread_rwlock_unlock(&re_tokenize_string(std::string const&,std::vector<std::string> *)::m_rwlock);
  _Unwind_Resume(a1);
}

uint64_t _REGetIsInternalBuild()
{
  if (_REGetIsInternalBuild_onceToken != -1) {
    dispatch_once(&_REGetIsInternalBuild_onceToken, &__block_literal_global_43);
  }
  return _REGetIsInternalBuild_internal;
}

uint64_t RETrainingSimulationMachServiceForProcessName(__CFString *a1)
{
  unsigned int v1 = &stru_26CFA57D0;
  if (a1) {
    unsigned int v1 = a1;
  }
  return [NSString stringWithFormat:@"com.apple.%@.RelevanceEngine.TrainingSimulation", v1];
}

id RETokenizeString(void *a1)
{
  id v1 = a1;
  if (RETokenizeString::onceToken != -1) {
    dispatch_once(&RETokenizeString::onceToken, &__block_literal_global_5);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&RETokenizeString::CacheLock);
  uint64_t v2 = [(id)RETokenizeString::TokenizedStringCache objectForKey:v1];
  os_unfair_lock_unlock((os_unfair_lock_t)&RETokenizeString::CacheLock);
  if (!v2)
  {
    id v3 = v1;
    uint64_t v4 = v3;
    if (v3)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v3 UTF8String]);
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      if (re_tokenize_string((uint64_t *)__p, &v11))
      {
        char v5 = [MEMORY[0x263EFF980] arrayWithCapacity:0xAAAAAAAAAAAAAAABLL * ((v12 - v11) >> 3)];
        if (v12 != v11)
        {
          uint64_t v6 = 0;
          unint64_t v7 = 0;
          do
          {
            uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:");
            [v5 addObject:v8];

            ++v7;
            v6 += 24;
          }
          while (v7 < 0xAAAAAAAAAAAAAAABLL * ((v12 - v11) >> 3));
        }
        uint64_t v2 = (void *)[v5 copy];
      }
      else
      {
        uint64_t v2 = (void *)MEMORY[0x263EFFA68];
      }
      uint64_t v16 = (void **)&v11;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v16);
      if (v15 < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      uint64_t v2 = (void *)MEMORY[0x263EFFA68];
    }

    os_unfair_lock_lock((os_unfair_lock_t)&RETokenizeString::CacheLock);
    [(id)RETokenizeString::TokenizedStringCache setObject:v2 forKey:v4];
    os_unfair_lock_unlock((os_unfair_lock_t)&RETokenizeString::CacheLock);
  }
  id v9 = v2;

  return v9;
}

void sub_21E7087D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char *a19)
{
  a19 = &a10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  if (a18 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

BOOL REDeviceUnlockedSinceBoot()
{
  if (_RERegisterForLockedStatusChangeIfNecessary_onceToken != -1) {
    dispatch_once(&_RERegisterForLockedStatusChangeIfNecessary_onceToken, &__block_literal_global_103);
  }
  return MKBGetDeviceLockState() == 3 || MKBDeviceUnlockedSinceBoot() == 1;
}

dispatch_queue_t RECreateSharedQueue(void *a1)
{
  return _RECreateSharedQueueAttr(a1, 0);
}

uint64_t RECreateBooleanFeatureValueTaggedPointer(int a1)
{
  if (a1) {
    return 9;
  }
  else {
    return 1;
  }
}

BOOL REBundleConfiguraitonSupportsElementGroups(void *a1)
{
  uint64_t v1 = [a1 methodForSelector:sel_elementGroupWithIdentifier_];
  return v1 != +[REBundleConfiguration instanceMethodForSelector:sel_elementGroupWithIdentifier_];
}

void sub_21E708ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E70B608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21E70B738(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E70BA28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E70BC88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E70C1E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, pthread_rwlock_t *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  pthread_rwlock_unlock(a11);
  _Unwind_Resume(a1);
}

void sub_21E70C3A0(_Unwind_Exception *a1)
{
  pthread_rwlock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_21E70D510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

id REValidateObjectOfClass(void *a1)
{
  id v1 = a1;
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id REValidateObjectOfClasses(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a1;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = REValidateObjectOfClass(v3);
        if (v9)
        {
          unint64_t v10 = (void *)v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  unint64_t v10 = 0;
LABEL_11:

  return v10;
}

float RERelevanceScaleForPriority(unint64_t a1)
{
  float result = 1.0;
  if (a1 <= 3) {
    return flt_21E7E9CC0[a1];
  }
  return result;
}

double REPercentThroughRange(double a1, double a2, double a3)
{
  double result = fmin((a1 - a2) / (a3 - a2), 1.0);
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

double REValueThroughRange(double a1, double a2, double a3)
{
  return a2 + (a3 - a2) * a1;
}

uint64_t REScheduledUpdateSortedByDate(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 updateDate];
  uint64_t v5 = [v3 updateDate];

  uint64_t v6 = [v4 compare:v5];
  return v6;
}

void sub_21E715224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E716484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t __NaturalLanguageLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NaturalLanguageLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getNLTagSchemeLanguageSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)NaturalLanguageLibrary();
  uint64_t result = dlsym(v2, "NLTagSchemeLanguage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNLTagSchemeLanguageSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getNLTagSchemeLemmaSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)NaturalLanguageLibrary();
  uint64_t result = dlsym(v2, "NLTagSchemeLemma");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNLTagSchemeLemmaSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void ___Z18re_tokenize_stringRKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPNS_6vectorIS5_NS3_IS5_EEEE_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = v3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v5 UTF8String]);
  unint64_t v6 = *(void *)(v4 + 16);
  unint64_t v7 = *(void *)(v4 + 8);
  if (v7 >= v6)
  {
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - *(void *)v4) >> 3);
    unint64_t v10 = v9 + 1;
    if (v9 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6 - *(void *)v4) >> 3);
    if (2 * v11 > v10) {
      unint64_t v10 = 2 * v11;
    }
    if (v11 >= 0x555555555555555) {
      unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v12 = v10;
    }
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)(v4 + 16);
    if (v12) {
      long long v13 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v4 + 16, v12);
    }
    else {
      long long v13 = 0;
    }
    long long v14 = v13 + v9;
    __v.__first_ = v13;
    __v.__begin_ = v14;
    __v.__end_cap_.__value_ = &v13[v12];
    long long v15 = *(_OWORD *)__p;
    v14->__r_.__value_.__r.__words[2] = v19;
    *(_OWORD *)&v14->__r_.__value_.__l.__data_ = v15;
    __p[1] = 0;
    std::string::size_type v19 = 0;
    __p[0] = 0;
    __v.__end_ = v14 + 1;
    std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)v4, &__v);
    uint64_t v16 = *(void *)(v4 + 8);
    std::__split_buffer<std::string>::~__split_buffer(&__v);
    int v17 = SHIBYTE(v19);
    *(void *)(v4 + 8) = v16;
    if (v17 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    long long v8 = *(_OWORD *)__p;
    *(void *)(v7 + 16) = v19;
    *(_OWORD *)unint64_t v7 = v8;
    *(void *)(v4 + 8) = v7 + 24;
  }
}

void sub_21E716A84(_Unwind_Exception *__p, uint64_t a2, int a3, __int16 a4, char a5, char a6, std::__split_buffer<std::string> *a7, uint64_t a8, void *__pa, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a15);
  if (a14 < 0) {
    operator delete(__pa);
  }

  _Unwind_Resume(__p);
}

uint64_t std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>@<X0>(const void **a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
{
  if (*((char *)a1 + 23) >= 0) {
    size_t v5 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v5 = (size_t)a1[1];
  }
  if (*((char *)a2 + 23) >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  uint64_t result = std::string::basic_string[abi:ne180100](a3, v6 + v5);
  if (*(char *)(result + 23) >= 0) {
    long long v8 = (char *)result;
  }
  else {
    long long v8 = *(char **)result;
  }
  if (v5)
  {
    if (*((char *)a1 + 23) >= 0) {
      unint64_t v9 = a1;
    }
    else {
      unint64_t v9 = *a1;
    }
    uint64_t result = (uint64_t)memmove(v8, v9, v5);
  }
  unint64_t v10 = &v8[v5];
  if (v6)
  {
    if (*((char *)a2 + 23) >= 0) {
      unint64_t v11 = a2;
    }
    else {
      unint64_t v11 = *a2;
    }
    uint64_t result = (uint64_t)memmove(v10, v11, v6);
  }
  v10[v6] = 0;
  return result;
}

void RETokenizeStringPrewarm()
{
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[&stru_26CFA57D0 UTF8String]);
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  if (re_tokenize_string((uint64_t *)__p, &v5))
  {
    uint64_t v0 = [MEMORY[0x263EFF980] arrayWithCapacity:0xAAAAAAAAAAAAAAABLL * ((v6 - v5) >> 3)];
    if (v6 != v5)
    {
      uint64_t v1 = 0;
      unint64_t v2 = 0;
      do
      {
        id v3 = objc_msgSend(NSString, "stringWithUTF8String:");
        [v0 addObject:v3];

        ++v2;
        v1 += 24;
      }
      while (v2 < 0xAAAAAAAAAAAAAAABLL * ((v6 - v5) >> 3));
    }
    uint64_t v4 = (void *)[v0 copy];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x263EFFA68];
  }
  unint64_t v10 = (void **)&v5;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v10);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
}

void sub_21E716CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char *a19)
{
  a19 = &a10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void std::vector<std::string>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2644BC2C8, MEMORY[0x263F8C060]);
}

void sub_21E716E54(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      *(void *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::vector<std::string>::__throw_out_of_range[abi:ne180100]()
{
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2644BC2D0, MEMORY[0x263F8C068]);
}

void sub_21E717140(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    uint64_t v6 = operator new(v4 + 1);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000;
    *(void *)a1 = v6;
  }
  else
  {
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 23) = a2;
  }
  return a1;
}

float REPercentBetweenDates(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a2;
  id v5 = a1;
  uint64_t v6 = [v3 currentCalendar];
  uint64_t v7 = [v6 dateByAddingUnit:16 value:-1 toDate:v4 options:0];

  [v7 timeIntervalSinceReferenceDate];
  double v9 = v8;
  [v4 timeIntervalSinceReferenceDate];
  double v11 = v10;

  [v5 timeIntervalSinceReferenceDate];
  double v13 = v12;

  float v14 = (v13 - v9) / (v11 - v9);
  float v15 = expf(v14) * 0.367879441;
  double v16 = fmin(v15, 1.0);
  if (v16 < 0.0) {
    double v16 = 0.0;
  }
  float v17 = v16;

  return v17;
}

id REDateFromPercentFromDate(void *a1, float a2)
{
  id v3 = a1;
  id v4 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v5 = [v4 dateByAddingUnit:16 value:-1 toDate:v3 options:0];

  if (a2 <= 0.001)
  {
    id v11 = v5;
  }
  else
  {
    double v6 = fmin((float)(logf(a2) + 1.0), 1.0);
    if (v6 < 0.0) {
      double v6 = 0.0;
    }
    float v7 = v6;
    [v5 timeIntervalSinceReferenceDate];
    double v9 = v8;
    [v3 timeIntervalSinceReferenceDate];
    objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:", REValueThroughRange(v7, v9, v10));
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v12 = v11;

  return v12;
}

void sub_21E71A9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E71AD6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v15);
  _Unwind_Resume(a1);
}

__CFString *REStringForUpdateType(unint64_t a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return off_2644BCA08[a1];
  }
}

void sub_21E71CE94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E71D300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

id RECreateSharedQueueWithQOS(void *a1, dispatch_qos_class_t a2)
{
  id v3 = dispatch_queue_attr_make_with_qos_class(0, a2, 0);
  id v4 = _RECreateSharedQueueAttr(a1, v3);

  return v4;
}

void sub_21E71EE20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E71F320(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21E71F614(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21E71F95C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21E71FCE8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21E72004C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21E72027C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E720A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E720DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E720FC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t REUpNextUnmodifiedDateBySettingHour()
{
  return [MEMORY[0x263EFF910] date];
}

void REEnumerateContentAttributesOfElement(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  float v7 = a3;
  if (v7)
  {
    char v22 = 0;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v17 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          float v14 = [v6 content];
          float v15 = [v14 objectForKey:v13];

          if (objc_opt_respondsToSelector())
          {
            double v16 = [v15 contentEncodedString];
            if (v16)
            {
              v7[2](v7, v16, &v22);
              if (v22)
              {

                goto LABEL_15;
              }
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    id v5 = v17;
  }
}

void sub_21E725A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E726D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48)
{
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_6(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

id _REIconDescriptionForDevice(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v4 = 2 * (a2 == 1);
  if (a1) {
    uint64_t v4 = 0;
  }
  if (a1 == 1) {
    uint64_t v5 = 2 * (a2 == 1);
  }
  else {
    uint64_t v5 = v4;
  }
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2050000000;
  id v6 = (void *)getISImageDescriptorClass_softClass;
  uint64_t v22 = getISImageDescriptorClass_softClass;
  if (!getISImageDescriptorClass_softClass)
  {
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    double v16 = __getISImageDescriptorClass_block_invoke;
    id v17 = &unk_2644BC768;
    long long v18 = &v19;
    __getISImageDescriptorClass_block_invoke((uint64_t)&v14);
    id v6 = (void *)v20[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v19, 8);
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  id v8 = (void *)getkISImageDescriptorHomeScreenSymbolLoc_ptr;
  uint64_t v22 = getkISImageDescriptorHomeScreenSymbolLoc_ptr;
  if (!getkISImageDescriptorHomeScreenSymbolLoc_ptr)
  {
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    double v16 = __getkISImageDescriptorHomeScreenSymbolLoc_block_invoke;
    id v17 = &unk_2644BC768;
    long long v18 = &v19;
    uint64_t v9 = (void *)IconServicesLibrary();
    uint64_t v10 = dlsym(v9, "kISImageDescriptorHomeScreen");
    *(void *)(v18[1] + 24) = v10;
    getkISImageDescriptorHomeScreenSymbolLoc_ptr = *(void *)(v18[1] + 24);
    id v8 = (void *)v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v8)
  {
    uint64_t v13 = (_Unwind_Exception *)-[RELemmaEnumerator init]();
    _Block_object_dispose(&v19, 8);
    _Unwind_Resume(v13);
  }
  uint64_t v11 = [v7 imageDescriptorNamed:*v8];
  [v11 setScale:a3];
  [v11 setShape:v5];
  return v11;
}

uint64_t _REIconVariantForDevice(uint64_t result, uint64_t a2, float a3)
{
  if (result == 1)
  {
    if (a2) {
      return 42;
    }
  }
  else
  {
    if (result) {
      return result;
    }
    if (a2)
    {
      if (a3 < 3.0) {
        return 47;
      }
      else {
        return 48;
      }
    }
  }
  if (a3 < 3.0) {
    unsigned int v4 = 15;
  }
  else {
    unsigned int v4 = 32;
  }
  if (a3 >= 2.0) {
    return v4;
  }
  else {
    return 0;
  }
}

void sub_21E72902C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E7292B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getISImageDescriptorClass_block_invoke(uint64_t a1)
{
  IconServicesLibrary();
  Class result = objc_getClass("ISImageDescriptor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getISImageDescriptorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getISImageDescriptorClass_block_invoke_cold_1();
    return (Class)IconServicesLibrary();
  }
  return result;
}

uint64_t IconServicesLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!IconServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __IconServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_2644BD288;
    uint64_t v5 = 0;
    IconServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = IconServicesLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!IconServicesLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __IconServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IconServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getkISImageDescriptorHomeScreenSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)IconServicesLibrary();
  uint64_t result = dlsym(v2, "kISImageDescriptorHomeScreen");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkISImageDescriptorHomeScreenSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __RelevanceEngineUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  RelevanceEngineUILibraryCore_frameworkLibrary = result;
  return result;
}

Class __getNanoResourceGrabberClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!NanoResourceGrabberLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __NanoResourceGrabberLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2644BD2B8;
    uint64_t v6 = 0;
    NanoResourceGrabberLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!NanoResourceGrabberLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("NanoResourceGrabber");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getNanoResourceGrabberClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getNanoResourceGrabberClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __NanoResourceGrabberLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoResourceGrabberLibraryCore_frameworkLibrary = result;
  return result;
}

REHTMLDataElement *__getISIconClass_block_invoke(uint64_t a1)
{
  IconServicesLibrary();
  uint64_t result = (REHTMLDataElement *)objc_getClass("ISIcon");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getISIconClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v3 = (REHTMLDataElement *)__getISIconClass_block_invoke_cold_1();
    return [(REHTMLDataElement *)v3 initWithData:v5];
  }
  return result;
}

void sub_21E729E9C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_21E72A610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E72B590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

BOOL REIsPreprocessStartCharacter(int a1)
{
  return a1 == 64;
}

uint64_t REIsAlphaCharacter(int a1)
{
  return ((a1 - 65) < 0x3A) & (0x3FFFFFF03FFFFFFuLL >> (a1 - 65));
}

uint64_t REIsIdentifierStartCharacter(int a1)
{
  if (a1 == 95) {
    return 1;
  }
  else {
    return ((a1 - 65) < 0x3A) & (0x3FFFFFF03FFFFFFuLL >> (a1 - 65));
  }
}

BOOL REIsIdentifierCharacter(int a1)
{
  if (a1 - 65) < 0x3A && ((0x3FFFFFF43FFFFFFuLL >> (a1 - 65))) {
    return 1;
  }
  return a1 == 45 || (a1 - 48) < 0xA;
}

BOOL REIsNumericCharacter(int a1)
{
  return (a1 - 48) < 0xA;
}

uint64_t REIsOperatorCharacter(uint64_t a1)
{
  if (RELoadOperatorCharacterMap_onceToken != -1) {
    dispatch_once(&RELoadOperatorCharacterMap_onceToken, &__block_literal_global_13);
  }
  uint64_t v2 = (void *)REOperatorCharacterSet;
  return [v2 characterIsMember:a1];
}

void __RELoadOperatorCharacterMap_block_invoke()
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(&unk_26CFCD698, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v1 = [&unk_26CFCD698 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v22 != v3) {
          objc_enumerationMutation(&unk_26CFCD698);
        }
        id v5 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v6 = REDescriptionForTokenType([v5 unsignedIntegerValue]);
        [v0 setObject:v5 forKeyedSubscript:v6];
      }
      uint64_t v2 = [&unk_26CFCD698 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v2);
  }
  uint64_t v7 = [v0 copy];
  id v8 = (void *)REOperatorTokenMap;
  REOperatorTokenMap = v7;

  uint64_t v9 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = (id)REOperatorTokenMap;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(v9, "addCharactersInString:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  uint64_t v15 = [v9 copy];
  double v16 = (void *)REOperatorCharacterSet;
  REOperatorCharacterSet = v15;
}

void __REKeywordTokenForString_block_invoke()
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(&unk_26CFCD6B0, "count"));
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v1 = [&unk_26CFCD6B0 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v10 != v3) {
          objc_enumerationMutation(&unk_26CFCD6B0);
        }
        id v5 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v6 = REDescriptionForTokenType([v5 unsignedIntegerValue]);
        [v0 setObject:v5 forKeyedSubscript:v6];
      }
      uint64_t v2 = [&unk_26CFCD6B0 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v2);
  }
  uint64_t v7 = [v0 copy];
  id v8 = (void *)REKeywordTokenForString_KeywordTokenMap;
  REKeywordTokenForString_KeywordTokenMap = v7;
}

void __RELoadControlCharacterMap_block_invoke()
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(&unk_26CFCD6C8, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v1 = [&unk_26CFCD6C8 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v22 != v3) {
          objc_enumerationMutation(&unk_26CFCD6C8);
        }
        id v5 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v6 = REDescriptionForTokenType([v5 unsignedIntegerValue]);
        [v0 setObject:v5 forKeyedSubscript:v6];
      }
      uint64_t v2 = [&unk_26CFCD6C8 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v2);
  }
  uint64_t v7 = [v0 copy];
  id v8 = (void *)REControlTokenMap;
  REControlTokenMap = v7;

  long long v9 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = (id)REControlTokenMap;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(v9, "addCharactersInString:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  uint64_t v15 = [v9 copy];
  double v16 = (void *)REControlCharacterSet;
  REControlCharacterSet = v15;
}

__CFString *REStringForPeriodOfDay(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_2644BD6B8[a1];
  }
}

id REDateIntervalUnion(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v3)
  {
    if (v4)
    {
      uint64_t v6 = [v3 startDate];
      uint64_t v7 = [v5 startDate];
      id v8 = [v6 earlierDate:v7];

      long long v9 = [v3 endDate];
      id v10 = [v5 endDate];
      uint64_t v11 = [v9 laterDate:v10];

      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v8 endDate:v11];
      goto LABEL_7;
    }
    id v13 = v3;
  }
  else
  {
    id v13 = v4;
  }
  uint64_t v12 = v13;
LABEL_7:

  return v12;
}

id REDateIntervalMidpoint(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 startDate];
  [v1 duration];
  double v4 = v3;

  id v5 = [v2 dateByAddingTimeInterval:v4 * 0.5];

  return v5;
}

id REUpNextDuplicateIntervalsByAddingUnit(void *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v24 = a1;
  unint64_t v26 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v23 = a4;
  if (a4)
  {
    uint64_t v25 = 0;
    do
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v7 = v24;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v27 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v30 != v27) {
              objc_enumerationMutation(v7);
            }
            uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            uint64_t v12 = [v11 endDate];
            id v13 = [v7 firstObject];
            uint64_t v14 = [v13 startDate];
            uint64_t v15 = [v6 components:a2 fromDate:v12 toDate:v14 options:0];

            uint64_t v16 = [v15 valueForComponent:a2];
            if (v16 >= 0) {
              unint64_t v17 = v16;
            }
            else {
              unint64_t v17 = -v16;
            }
            if (v17 < a3)
            {
              long long v18 = [v11 startDate];
              long long v19 = [v6 dateByAddingUnit:a2 value:v25 * a3 toDate:v18 options:0];

              id v20 = objc_alloc(MEMORY[0x263F08798]);
              [v11 duration];
              long long v21 = objc_msgSend(v20, "initWithStartDate:duration:", v19);
              [v26 addObject:v21];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v9);
      }

      ++v25;
    }
    while (v25 != v23);
  }
  [v26 sortUsingComparator:&__block_literal_global_15];

  return v26;
}

uint64_t __REUpNextDuplicateIntervalsByAddingUnit_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t REIndexOfDateInPeriodsOfDay(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = [_REPeriodOfDay alloc];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v4 duration:0.0];

  id v7 = [(_REPeriodOfDay *)v5 initWithInterval:v6 periodOfDay:2];
  uint64_t v8 = objc_msgSend(v3, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, objc_msgSend(v3, "count"), 256, &__block_literal_global_50);

  return v8;
}

uint64_t __REIndexOfDateInPeriodsOfDay_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 interval];
  id v7 = [v5 interval];
  char v8 = [v6 intersectsDateInterval:v7];

  if (v8)
  {
    uint64_t v9 = 0;
  }
  else
  {
    id v10 = [v4 interval];
    uint64_t v11 = [v5 interval];
    uint64_t v9 = [v10 compare:v11];
  }
  return v9;
}

void sub_21E730A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_21E7320A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21E7322A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21E7325F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E732CB8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

id get_CDContextQueriesClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)get_CDContextQueriesClass_softClass;
  uint64_t v7 = get_CDContextQueriesClass_softClass;
  if (!get_CDContextQueriesClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __get_CDContextQueriesClass_block_invoke;
    v3[3] = &unk_2644BC768;
    v3[4] = &v4;
    __get_CDContextQueriesClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E732F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_CDContextualPredicateClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)get_CDContextualPredicateClass_softClass;
  uint64_t v7 = get_CDContextualPredicateClass_softClass;
  if (!get_CDContextualPredicateClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __get_CDContextualPredicateClass_block_invoke;
    v3[3] = &unk_2644BC768;
    v3[4] = &v4;
    __get_CDContextualPredicateClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E733058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_CDMDCSContextualPredicateClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)get_CDMDCSContextualPredicateClass_softClass;
  uint64_t v7 = get_CDMDCSContextualPredicateClass_softClass;
  if (!get_CDMDCSContextualPredicateClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __get_CDMDCSContextualPredicateClass_block_invoke;
    v3[3] = &unk_2644BC768;
    v3[4] = &v4;
    __get_CDMDCSContextualPredicateClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E73313C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_CDContextualChangeRegistrationClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)get_CDContextualChangeRegistrationClass_softClass;
  uint64_t v7 = get_CDContextualChangeRegistrationClass_softClass;
  if (!get_CDContextualChangeRegistrationClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __get_CDContextualChangeRegistrationClass_block_invoke;
    v3[3] = &unk_2644BC768;
    v3[4] = &v4;
    __get_CDContextualChangeRegistrationClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E7339D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E733F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_21E734B4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t CoreDuetContextLibraryCore()
{
  if (!CoreDuetContextLibraryCore_frameworkLibrary) {
    CoreDuetContextLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return CoreDuetContextLibraryCore_frameworkLibrary;
}

uint64_t __CoreDuetContextLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreDuetContextLibraryCore_frameworkLibrary = result;
  return result;
}

void CoreDuetContextLibrary()
{
  if (!CoreDuetContextLibraryCore())
  {
    uint64_t v0 = (void *)abort_report_np();
    free(v0);
  }
}

void sub_21E73573C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_21E7359EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E736138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  _Block_object_dispose((const void *)(v16 - 80), 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getHKUnitClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getHKUnitClass_softClass;
  uint64_t v7 = getHKUnitClass_softClass;
  if (!getHKUnitClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getHKUnitClass_block_invoke;
    v3[3] = &unk_2644BC768;
    v3[4] = &v4;
    __getHKUnitClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E736BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t HealthKitLibraryCore()
{
  if (!HealthKitLibraryCore_frameworkLibrary) {
    HealthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return HealthKitLibraryCore_frameworkLibrary;
}

uint64_t __HealthKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  HealthKitLibraryCore_frameworkLibrary = result;
  return result;
}

void HealthKitLibrary()
{
  if (!HealthKitLibraryCore())
  {
    uint64_t v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getHKUnitClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary();
  Class result = objc_getClass("HKUnit");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKUnitClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v3 = (void *)__getHKUnitClass_block_invoke_cold_1();
    return (Class)+[REWorkoutRelevanceProvider relevanceSimulatorID];
  }
  return result;
}

void sub_21E73799C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E7394FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_21E739BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  _Block_object_dispose((const void *)(v28 - 112), 8);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E73A0B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21E73A1C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21E73A504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E73AC00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t HealthKitLibraryCore_0()
{
  if (!HealthKitLibraryCore_frameworkLibrary_0) {
    HealthKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  return HealthKitLibraryCore_frameworkLibrary_0;
}

uint64_t __HealthKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  HealthKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getkHKHealthDaemonActiveWorkoutServersDidUpdateNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HealthKitLibrary_0();
  uint64_t result = dlsym(v2, "kHKHealthDaemonActiveWorkoutServersDidUpdateNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkHKHealthDaemonActiveWorkoutServersDidUpdateNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                       + 24);
  return result;
}

uint64_t HealthKitLibrary_0()
{
  uint64_t v0 = HealthKitLibraryCore_0();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getHKObserverQueryClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary_0();
  Class result = objc_getClass("HKObserverQuery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKObserverQueryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKObserverQueryClass_block_invoke_cold_1();
    return (Class)__getHKSampleTypeClass_block_invoke(v3);
  }
  return result;
}

Class __getHKSampleTypeClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary_0();
  Class result = objc_getClass("HKSampleType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKSampleTypeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKSampleTypeClass_block_invoke_cold_1();
    return (Class)__getHKQueryClass_block_invoke(v3);
  }
  return result;
}

Class __getHKQueryClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary_0();
  Class result = objc_getClass("HKQuery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKQueryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKQueryClass_block_invoke_cold_1();
    return (Class)__getHKSourceClass_block_invoke(v3);
  }
  return result;
}

Class __getHKSourceClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary_0();
  Class result = objc_getClass("HKSource");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKSourceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKSourceClass_block_invoke_cold_1();
    return (Class)__getHKSampleSortIdentifierStartDateSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getHKSampleSortIdentifierStartDateSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)HealthKitLibrary_0();
  Class result = dlsym(v2, "HKSampleSortIdentifierStartDate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHKSampleSortIdentifierStartDateSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getHKSampleQueryClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary_0();
  Class result = objc_getClass("HKSampleQuery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKSampleQueryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getHKSampleQueryClass_block_invoke_cold_1();
    return (Class)__getHKObjectTypeClass_block_invoke(v3);
  }
  return result;
}

Class __getHKObjectTypeClass_block_invoke(uint64_t a1)
{
  HealthKitLibrary_0();
  Class result = objc_getClass("HKObjectType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKObjectTypeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (REHealthStore *)__getHKObjectTypeClass_block_invoke_cold_1();
    return (Class)[(REHealthStore *)v3 _init];
  }
  return result;
}

id getHKHealthStoreClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getHKHealthStoreClass_softClass;
  uint64_t v7 = getHKHealthStoreClass_softClass;
  if (!getHKHealthStoreClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getHKHealthStoreClass_block_invoke;
    v3[3] = &unk_2644BC768;
    v3[4] = &v4;
    __getHKHealthStoreClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E73B7A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t HealthKitLibraryCore_1()
{
  if (!HealthKitLibraryCore_frameworkLibrary_1) {
    HealthKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  return HealthKitLibraryCore_frameworkLibrary_1;
}

uint64_t __HealthKitLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  HealthKitLibraryCore_frameworkLibrary_1 = result;
  return result;
}

uint64_t FitnessUILibraryCore()
{
  if (!FitnessUILibraryCore_frameworkLibrary) {
    FitnessUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return FitnessUILibraryCore_frameworkLibrary;
}

uint64_t __FitnessUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FitnessUILibraryCore_frameworkLibrary = result;
  return result;
}

Class __getHKHealthStoreClass_block_invoke(uint64_t a1)
{
  if (!HealthKitLibraryCore_1())
  {
    uint64_t v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("HKHealthStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHKHealthStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v4 = (void *)__getHKHealthStoreClass_block_invoke_cold_1();
    return (Class)+[_RETrueConstantCondition sharedInstance];
  }
  return result;
}

void sub_21E73CA10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *REDescriptionForTokenType(unint64_t a1)
{
  if (a1 > 0x2D) {
    return 0;
  }
  else {
    return off_2644BDC60[a1];
  }
}

unint64_t REIntegerGCD(unint64_t a1, unint64_t a2)
{
  if (!a2) {
    return a1;
  }
  do
  {
    unint64_t v2 = a2;
    a2 = a1 % a2;
    a1 = v2;
  }
  while (a2);
  return v2;
}

void sub_21E73E0D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v21 - 96), 8);
  _Unwind_Resume(a1);
}

__CFString *REStringForDailyRoutineType(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_2644BDE90[a1];
  }
}

uint64_t REDailyRoutineTypeFromString(void *a1)
{
  id v1 = [a1 lowercaseString];
  if ([v1 isEqualToString:@"morning"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"evening"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_21E73F3B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E73F7AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E73FB40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E73FD50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E743C28(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_21E744C38(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

id getBMItemTypeClass()
{
  uint64_t v4 = 0;
  SEL v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getBMItemTypeClass_softClass;
  uint64_t v7 = getBMItemTypeClass_softClass;
  if (!getBMItemTypeClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getBMItemTypeClass_block_invoke;
    v3[3] = &unk_2644BC768;
    v3[4] = &v4;
    __getBMItemTypeClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E7452D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBMItemClass()
{
  uint64_t v4 = 0;
  SEL v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getBMItemClass_softClass;
  uint64_t v7 = getBMItemClass_softClass;
  if (!getBMItemClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getBMItemClass_block_invoke;
    v3[3] = &unk_2644BC768;
    v3[4] = &v4;
    __getBMItemClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E7455D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E745D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBMRetrievalFilterClass()
{
  uint64_t v4 = 0;
  SEL v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getBMRetrievalFilterClass_softClass;
  uint64_t v7 = getBMRetrievalFilterClass_softClass;
  if (!getBMRetrievalFilterClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getBMRetrievalFilterClass_block_invoke;
    v3[3] = &unk_2644BC768;
    v3[4] = &v4;
    __getBMRetrievalFilterClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E745E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t BehaviorMinerLibraryCore()
{
  if (!BehaviorMinerLibraryCore_frameworkLibrary) {
    BehaviorMinerLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return BehaviorMinerLibraryCore_frameworkLibrary;
}

uint64_t __BehaviorMinerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BehaviorMinerLibraryCore_frameworkLibrary = result;
  return result;
}

void __getBMBehaviorRetrieverClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("BMBehaviorRetriever");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBMBehaviorRetrieverClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getBMBehaviorRetrieverClass_block_invoke_cold_1();
    BehaviorMinerLibrary();
  }
}

void BehaviorMinerLibrary()
{
  if (!BehaviorMinerLibraryCore())
  {
    uint64_t v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getBMItemTypeClass_block_invoke(uint64_t a1)
{
  BehaviorMinerLibrary();
  Class result = objc_getClass("BMItemType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBMItemTypeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getBMItemTypeClass_block_invoke_cold_1();
    return (Class)__getBMItemClass_block_invoke(v3);
  }
  return result;
}

Class __getBMItemClass_block_invoke(uint64_t a1)
{
  BehaviorMinerLibrary();
  Class result = objc_getClass("BMItem");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBMItemClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getBMItemClass_block_invoke_cold_1();
    return (Class)__getBMRetrievalFilterClass_block_invoke(v3);
  }
  return result;
}

Class __getBMRetrievalFilterClass_block_invoke(uint64_t a1)
{
  BehaviorMinerLibrary();
  Class result = objc_getClass("BMRetrievalFilter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBMRetrievalFilterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getBMRetrievalFilterClass_block_invoke_cold_1();
    return (Class)__getBMBehaviorStorageClass_block_invoke(v3);
  }
  return result;
}

Class __getBMBehaviorStorageClass_block_invoke(uint64_t a1)
{
  BehaviorMinerLibrary();
  Class result = objc_getClass("BMBehaviorStorage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBMBehaviorStorageClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getBMBehaviorStorageClass_block_invoke_cold_1();
    return (Class)BayesianModel::SuperHasher::operator()(v3, v4);
  }
  return result;
}

unint64_t BayesianModel::SuperHasher::operator()(uint64_t a1, unint64_t a2)
{
  return a2 ^ HIDWORD(a2);
}

BOOL BayesianModel::SuperHasher::operator()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a2 == a3;
}

uint64_t BayesianModel::SaveModel(uint64_t a1, void *a2, int a3)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  pthread_rwlock_rdlock((pthread_rwlock_t *)a1);
  *(void *)((char *)a2 + *(void *)(*a2 - 24) + 16) = 15;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"ModelDefinition\n", 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"ModelVersion\t", 13);
  uint64_t v6 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"FeaturesCount\t", 14);
  uint64_t v7 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"TotalTrue\t", 10);
  char v8 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"TotalExamples\t", 14);
  uint64_t v9 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"SumPredictions\t", 15);
  id v10 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"LogScore\t", 9);
  uint64_t v11 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"NormalizedLogScore\t", 19);
  uint64_t v12 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"\n", 1);
  if (a3)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"\n", 1);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"NegativeEntropy\t", 16);
    id v13 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)"\n", 1);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"NormalizedEntropy\t", 18);
    double v14 = *(double *)(a1 + 280);
    if (v14 != 0.0 && v14 < -1000000.0)
    {
      *(void *)(a1 + 272) = 0;
      *(void *)(a1 + 280) = 0;
    }
    uint64_t v15 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"\n", 1);
  }
  for (uint64_t i = 0; i != 80; i += 8)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"CalibrationTrue\t", 16);
    unint64_t v17 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)"\n", 1);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"CalibrationCount\t", 17);
    long long v18 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"\n", 1);
    if (a3)
    {
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"CalibrationValue\t", 17);
      long long v19 = (void *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)"\n\n", 2);
    }
  }
  *(_OWORD *)std::string __str = 0u;
  long long v39 = 0u;
  *(_OWORD *)std::string::value_type __s = 0u;
  long long v37 = 0u;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"Features\n", 9);
  if (a3)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"\n\n\n", 3);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"FeatureID_Value\tFeatureID\tFeatureValue\tPrecisionMean\tPrecision\tMean\tVariance\n", 77);
  }
  for (uint64_t j = *(void **)(a1 + 216); j; uint64_t j = (void *)*j)
  {
    uint64_t v21 = j[2];
    snprintf(__str, 0x1FuLL, "%016llX", v21);
    if (a3)
    {
      snprintf(__s, 0x1FuLL, "%016llX", v21 & 0xFFFFFFFFFFFFFFLL);
      long long v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"0x", 2);
      size_t v23 = strlen(__str);
      id v24 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)__str, v23);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)"\t", 1);
      uint64_t v25 = (void *)std::ostream::operator<<();
      unint64_t v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v25, (uint64_t)"\t0x", 3);
      size_t v27 = strlen(__s);
      uint64_t v28 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)__s, v27);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v28, (uint64_t)"\t", 1);
      long long v29 = (void *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v29, (uint64_t)"\t", 1);
      long long v30 = (void *)std::ostream::operator<<();
    }
    else
    {
      uint64_t v33 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"0x", 2);
      size_t v34 = strlen(__str);
      long long v30 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v33, (uint64_t)__str, v34);
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v30, (uint64_t)"\t", 1);
    long long v31 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)"\t", 1);
    long long v32 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)"\n", 1);
  }
  return pthread_rwlock_unlock((pthread_rwlock_t *)a1);
}

void sub_21E74684C(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

double BayesianModel::getAverageNegativeEntropy(BayesianModel *this)
{
  unint64_t m_nTotalExamples = this->m_nTotalExamples;
  if (m_nTotalExamples) {
    return this->m_dLogScore / (double)m_nTotalExamples;
  }
  else {
    return 0.0;
  }
}

BayesianModel *BayesianModel::getAverageNormalizedEntropy(BayesianModel *this)
{
  double m_dNormalizedLogScore = this->m_dNormalizedLogScore;
  if (m_dNormalizedLogScore != 0.0 && m_dNormalizedLogScore < -1000000.0)
  {
    this->m_dLogScore = 0.0;
    this->double m_dNormalizedLogScore = 0.0;
  }
  return this;
}

uint64_t BayesianModel::CaptureDebugTable(uint64_t a1, uint64_t *a2)
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  pthread_rwlock_rdlock((pthread_rwlock_t *)a1);
  uint64_t v4 = *a2;
  SEL v5 = (std::string *)a2[1];
  while (v5 != (std::string *)v4)
  {
    __v.__first_ = --v5;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  }
  a2[1] = v4;
  memset(&v108, 0, sizeof(v108));
  std::string::basic_string[abi:ne180100]<0>(__str, "FeatureID_Value");
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v108.__end_cap_;
  uint64_t v6 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v108.__end_cap_, 1uLL);
  __v.__first_ = v6;
  __v.__begin_ = v6;
  __v.__end_cap_.__value_ = &v6[v7];
  long long v8 = *(_OWORD *)__str;
  v6->__r_.__value_.__r.__words[2] = v114;
  *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v8;
  *(void *)&long long v114 = 0;
  memset(__str, 0, sizeof(__str));
  __v.__end_ = v6 + 1;
  std::vector<std::string>::__swap_out_circular_buffer(&v108, &__v);
  end = v108.__end_;
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  v108.__end_ = end;
  if (SBYTE7(v114) < 0) {
    operator delete(*(void **)__str);
  }
  std::string::basic_string[abi:ne180100]<0>(__str, "FeatureID");
  std::vector<std::string>::pointer v10 = v108.__end_;
  if (v108.__end_ >= v108.__end_cap_.__value_)
  {
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)v108.__end_ - (char *)v108.__begin_) >> 3);
    unint64_t v13 = v12 + 1;
    if (v12 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    if (0x5555555555555556 * (((char *)v108.__end_cap_.__value_ - (char *)v108.__begin_) >> 3) > v13) {
      unint64_t v13 = 0x5555555555555556 * (((char *)v108.__end_cap_.__value_ - (char *)v108.__begin_) >> 3);
    }
    if (0xAAAAAAAAAAAAAAABLL * (((char *)v108.__end_cap_.__value_ - (char *)v108.__begin_) >> 3) >= 0x555555555555555) {
      unint64_t v14 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v14 = v13;
    }
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v108.__end_cap_;
    if (v14) {
      uint64_t v15 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v108.__end_cap_, v14);
    }
    else {
      uint64_t v15 = 0;
    }
    uint64_t v16 = v15 + v12;
    __v.__first_ = v15;
    __v.__begin_ = v16;
    __v.__end_cap_.__value_ = &v15[v14];
    long long v17 = *(_OWORD *)__str;
    v16->__r_.__value_.__r.__words[2] = v114;
    *(_OWORD *)&v16->__r_.__value_.__l.__data_ = v17;
    *(void *)&long long v114 = 0;
    memset(__str, 0, sizeof(__str));
    __v.__end_ = v16 + 1;
    std::vector<std::string>::__swap_out_circular_buffer(&v108, &__v);
    long long v18 = v108.__end_;
    std::__split_buffer<std::string>::~__split_buffer(&__v);
    v108.__end_ = v18;
    if (SBYTE7(v114) < 0) {
      operator delete(*(void **)__str);
    }
  }
  else
  {
    long long v11 = *(_OWORD *)__str;
    v108.__end_->__r_.__value_.__r.__words[2] = v114;
    *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
    v108.__end_ = v10 + 1;
  }
  std::string::basic_string[abi:ne180100]<0>(__str, "FeatureValue");
  std::vector<std::string>::pointer v19 = v108.__end_;
  if (v108.__end_ >= v108.__end_cap_.__value_)
  {
    unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * (((char *)v108.__end_ - (char *)v108.__begin_) >> 3);
    unint64_t v22 = v21 + 1;
    if (v21 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    if (0x5555555555555556 * (((char *)v108.__end_cap_.__value_ - (char *)v108.__begin_) >> 3) > v22) {
      unint64_t v22 = 0x5555555555555556 * (((char *)v108.__end_cap_.__value_ - (char *)v108.__begin_) >> 3);
    }
    if (0xAAAAAAAAAAAAAAABLL * (((char *)v108.__end_cap_.__value_ - (char *)v108.__begin_) >> 3) >= 0x555555555555555) {
      unint64_t v23 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v23 = v22;
    }
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v108.__end_cap_;
    if (v23) {
      id v24 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v108.__end_cap_, v23);
    }
    else {
      id v24 = 0;
    }
    uint64_t v25 = v24 + v21;
    __v.__first_ = v24;
    __v.__begin_ = v25;
    __v.__end_cap_.__value_ = &v24[v23];
    long long v26 = *(_OWORD *)__str;
    v25->__r_.__value_.__r.__words[2] = v114;
    *(_OWORD *)&v25->__r_.__value_.__l.__data_ = v26;
    *(void *)&long long v114 = 0;
    memset(__str, 0, sizeof(__str));
    __v.__end_ = v25 + 1;
    std::vector<std::string>::__swap_out_circular_buffer(&v108, &__v);
    size_t v27 = v108.__end_;
    std::__split_buffer<std::string>::~__split_buffer(&__v);
    v108.__end_ = v27;
    if (SBYTE7(v114) < 0) {
      operator delete(*(void **)__str);
    }
  }
  else
  {
    long long v20 = *(_OWORD *)__str;
    v108.__end_->__r_.__value_.__r.__words[2] = v114;
    *(_OWORD *)&v19->__r_.__value_.__l.__data_ = v20;
    v108.__end_ = v19 + 1;
  }
  std::string::basic_string[abi:ne180100]<0>(__str, "Mean");
  std::vector<std::string>::pointer v28 = v108.__end_;
  if (v108.__end_ >= v108.__end_cap_.__value_)
  {
    unint64_t v30 = 0xAAAAAAAAAAAAAAABLL * (((char *)v108.__end_ - (char *)v108.__begin_) >> 3);
    unint64_t v31 = v30 + 1;
    if (v30 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    if (0x5555555555555556 * (((char *)v108.__end_cap_.__value_ - (char *)v108.__begin_) >> 3) > v31) {
      unint64_t v31 = 0x5555555555555556 * (((char *)v108.__end_cap_.__value_ - (char *)v108.__begin_) >> 3);
    }
    if (0xAAAAAAAAAAAAAAABLL * (((char *)v108.__end_cap_.__value_ - (char *)v108.__begin_) >> 3) >= 0x555555555555555) {
      unint64_t v32 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v32 = v31;
    }
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v108.__end_cap_;
    if (v32) {
      uint64_t v33 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v108.__end_cap_, v32);
    }
    else {
      uint64_t v33 = 0;
    }
    size_t v34 = v33 + v30;
    __v.__first_ = v33;
    __v.__begin_ = v34;
    __v.__end_cap_.__value_ = &v33[v32];
    long long v35 = *(_OWORD *)__str;
    v34->__r_.__value_.__r.__words[2] = v114;
    *(_OWORD *)&v34->__r_.__value_.__l.__data_ = v35;
    *(void *)&long long v114 = 0;
    memset(__str, 0, sizeof(__str));
    __v.__end_ = v34 + 1;
    std::vector<std::string>::__swap_out_circular_buffer(&v108, &__v);
    uint64_t v36 = v108.__end_;
    std::__split_buffer<std::string>::~__split_buffer(&__v);
    v108.__end_ = v36;
    if (SBYTE7(v114) < 0) {
      operator delete(*(void **)__str);
    }
  }
  else
  {
    long long v29 = *(_OWORD *)__str;
    v108.__end_->__r_.__value_.__r.__words[2] = v114;
    *(_OWORD *)&v28->__r_.__value_.__l.__data_ = v29;
    v108.__end_ = v28 + 1;
  }
  std::string::basic_string[abi:ne180100]<0>(__str, "Variance");
  std::vector<std::string>::pointer v37 = v108.__end_;
  if (v108.__end_ >= v108.__end_cap_.__value_)
  {
    unint64_t v39 = 0xAAAAAAAAAAAAAAABLL * (((char *)v108.__end_ - (char *)v108.__begin_) >> 3);
    unint64_t v40 = v39 + 1;
    if (v39 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    if (0x5555555555555556 * (((char *)v108.__end_cap_.__value_ - (char *)v108.__begin_) >> 3) > v40) {
      unint64_t v40 = 0x5555555555555556 * (((char *)v108.__end_cap_.__value_ - (char *)v108.__begin_) >> 3);
    }
    if (0xAAAAAAAAAAAAAAABLL * (((char *)v108.__end_cap_.__value_ - (char *)v108.__begin_) >> 3) >= 0x555555555555555) {
      unint64_t v41 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v41 = v40;
    }
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v108.__end_cap_;
    if (v41) {
      uint64_t v42 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v108.__end_cap_, v41);
    }
    else {
      uint64_t v42 = 0;
    }
    double v43 = v42 + v39;
    __v.__first_ = v42;
    __v.__begin_ = v43;
    __v.__end_cap_.__value_ = &v42[v41];
    long long v44 = *(_OWORD *)__str;
    v43->__r_.__value_.__r.__words[2] = v114;
    *(_OWORD *)&v43->__r_.__value_.__l.__data_ = v44;
    *(void *)&long long v114 = 0;
    memset(__str, 0, sizeof(__str));
    __v.__end_ = v43 + 1;
    std::vector<std::string>::__swap_out_circular_buffer(&v108, &__v);
    double v45 = v108.__end_;
    std::__split_buffer<std::string>::~__split_buffer(&__v);
    v108.__end_ = v45;
    if (SBYTE7(v114) < 0) {
      operator delete(*(void **)__str);
    }
  }
  else
  {
    long long v38 = *(_OWORD *)__str;
    v108.__end_->__r_.__value_.__r.__words[2] = v114;
    *(_OWORD *)&v37->__r_.__value_.__l.__data_ = v38;
    v108.__end_ = v37 + 1;
  }
  unint64_t v46 = a2[1];
  if (v46 >= a2[2])
  {
    uint64_t v47 = std::vector<std::vector<std::string>>::__push_back_slow_path<std::vector<std::string> const&>(a2, (long long **)&v108);
  }
  else
  {
    std::vector<std::vector<std::string>>::__construct_one_at_end[abi:ne180100]<std::vector<std::string> const&>((uint64_t)a2, (long long **)&v108);
    uint64_t v47 = v46 + 24;
  }
  a2[1] = v47;
  *(_OWORD *)std::string __str = 0u;
  long long v114 = 0u;
  *(_OWORD *)std::string::value_type __s = 0u;
  long long v112 = 0u;
  for (uint64_t i = *(double **)(a1 + 216); i; uint64_t i = *(double **)i)
  {
    unint64_t v49 = *((void *)i + 2);
    snprintf(__str, 0x1FuLL, "%016llX", v49);
    double v50 = i[3];
    double v51 = i[4];
    snprintf(__s, 0x1FuLL, "%016llX", v49 & 0xFFFFFFFFFFFFFFLL);
    memset(&v107, 0, sizeof(v107));
    std::string::basic_string[abi:ne180100]<0>(&v106, "0x");
    v52 = std::string::append(&v106, __str);
    uint64_t v53 = (char *)v52->__r_.__value_.__r.__words[0];
    v110[0] = v52->__r_.__value_.__l.__size_;
    *(void *)((char *)v110 + 7) = *(std::string::size_type *)((char *)&v52->__r_.__value_.__r.__words[1] + 7);
    char v54 = HIBYTE(v52->__r_.__value_.__r.__words[2]);
    v52->__r_.__value_.__l.__size_ = 0;
    v52->__r_.__value_.__r.__words[2] = 0;
    v52->__r_.__value_.__r.__words[0] = 0;
    std::vector<std::string>::pointer v55 = v107.__end_;
    if (v107.__end_ >= v107.__end_cap_.__value_)
    {
      unint64_t v58 = 0xAAAAAAAAAAAAAAABLL * (((char *)v107.__end_ - (char *)v107.__begin_) >> 3);
      unint64_t v59 = v58 + 1;
      if (v58 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3) > v59) {
        unint64_t v59 = 0x5555555555555556 * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3) >= 0x555555555555555) {
        unint64_t v60 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v60 = v59;
      }
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v107.__end_cap_;
      if (v60) {
        v61 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v107.__end_cap_, v60);
      }
      else {
        v61 = 0;
      }
      char v62 = v61 + v58;
      __v.__first_ = v61;
      __v.__begin_ = v62;
      __v.__end_cap_.__value_ = &v61[v60];
      std::string::size_type v63 = v110[0];
      v62->__r_.__value_.__r.__words[0] = (std::string::size_type)v53;
      v62->__r_.__value_.__l.__size_ = v63;
      *(std::string::size_type *)((char *)&v62->__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)v110 + 7);
      *((unsigned char *)&v62->__r_.__value_.__s + 23) = v54;
      __v.__end_ = v62 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v107, &__v);
      v57 = v107.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
    }
    else
    {
      std::string::size_type v56 = v110[0];
      v107.__end_->__r_.__value_.__l.__data_ = v53;
      v55->__r_.__value_.__l.__size_ = v56;
      *(std::string::size_type *)((char *)&v55->__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)v110 + 7);
      *((unsigned char *)&v55->__r_.__value_.__s + 23) = v54;
      v57 = v55 + 1;
    }
    v107.__end_ = v57;
    if (SHIBYTE(v106.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v106.__r_.__value_.__l.__data_);
    }
    std::to_string(&v106, HIBYTE(v49));
    std::vector<std::string>::pointer v64 = v107.__end_;
    if (v107.__end_ >= v107.__end_cap_.__value_)
    {
      unint64_t v66 = 0xAAAAAAAAAAAAAAABLL * (((char *)v107.__end_ - (char *)v107.__begin_) >> 3);
      unint64_t v67 = v66 + 1;
      if (v66 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3) > v67) {
        unint64_t v67 = 0x5555555555555556 * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3) >= 0x555555555555555) {
        unint64_t v68 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v68 = v67;
      }
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v107.__end_cap_;
      if (v68) {
        long long v69 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v107.__end_cap_, v68);
      }
      else {
        long long v69 = 0;
      }
      long long v70 = v69 + v66;
      __v.__first_ = v69;
      __v.__begin_ = v70;
      __v.__end_cap_.__value_ = &v69[v68];
      long long v71 = *(_OWORD *)&v106.__r_.__value_.__l.__data_;
      v70->__r_.__value_.__r.__words[2] = v106.__r_.__value_.__r.__words[2];
      *(_OWORD *)&v70->__r_.__value_.__l.__data_ = v71;
      memset(&v106, 0, sizeof(v106));
      __v.__end_ = v70 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v107, &__v);
      uint64_t v72 = v107.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v107.__end_ = v72;
      if (SHIBYTE(v106.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v106.__r_.__value_.__l.__data_);
      }
    }
    else
    {
      long long v65 = *(_OWORD *)&v106.__r_.__value_.__l.__data_;
      v107.__end_->__r_.__value_.__r.__words[2] = v106.__r_.__value_.__r.__words[2];
      *(_OWORD *)&v64->__r_.__value_.__l.__data_ = v65;
      v107.__end_ = v64 + 1;
    }
    std::string::basic_string[abi:ne180100]<0>(&v106, "0x");
    uint64_t v73 = std::string::append(&v106, __s);
    uint64_t v74 = (char *)v73->__r_.__value_.__r.__words[0];
    v110[0] = v73->__r_.__value_.__l.__size_;
    *(void *)((char *)v110 + 7) = *(std::string::size_type *)((char *)&v73->__r_.__value_.__r.__words[1] + 7);
    char v75 = HIBYTE(v73->__r_.__value_.__r.__words[2]);
    v73->__r_.__value_.__l.__size_ = 0;
    v73->__r_.__value_.__r.__words[2] = 0;
    v73->__r_.__value_.__r.__words[0] = 0;
    std::vector<std::string>::pointer v76 = v107.__end_;
    if (v107.__end_ >= v107.__end_cap_.__value_)
    {
      unint64_t v79 = 0xAAAAAAAAAAAAAAABLL * (((char *)v107.__end_ - (char *)v107.__begin_) >> 3);
      unint64_t v80 = v79 + 1;
      if (v79 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3) > v80) {
        unint64_t v80 = 0x5555555555555556 * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3) >= 0x555555555555555) {
        unint64_t v81 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v81 = v80;
      }
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v107.__end_cap_;
      if (v81) {
        v82 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v107.__end_cap_, v81);
      }
      else {
        v82 = 0;
      }
      char v83 = v82 + v79;
      __v.__first_ = v82;
      __v.__begin_ = v83;
      __v.__end_cap_.__value_ = &v82[v81];
      std::string::size_type v84 = v110[0];
      v83->__r_.__value_.__r.__words[0] = (std::string::size_type)v74;
      v83->__r_.__value_.__l.__size_ = v84;
      *(std::string::size_type *)((char *)&v83->__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)v110 + 7);
      *((unsigned char *)&v83->__r_.__value_.__s + 23) = v75;
      __v.__end_ = v83 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v107, &__v);
      int v78 = v107.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
    }
    else
    {
      std::string::size_type v77 = v110[0];
      v107.__end_->__r_.__value_.__l.__data_ = v74;
      v76->__r_.__value_.__l.__size_ = v77;
      *(std::string::size_type *)((char *)&v76->__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)v110 + 7);
      *((unsigned char *)&v76->__r_.__value_.__s + 23) = v75;
      int v78 = v76 + 1;
    }
    v107.__end_ = v78;
    if (SHIBYTE(v106.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v106.__r_.__value_.__l.__data_);
    }
    std::to_string(&v106, v51 / v50);
    std::vector<std::string>::pointer v85 = v107.__end_;
    if (v107.__end_ >= v107.__end_cap_.__value_)
    {
      unint64_t v87 = 0xAAAAAAAAAAAAAAABLL * (((char *)v107.__end_ - (char *)v107.__begin_) >> 3);
      unint64_t v88 = v87 + 1;
      if (v87 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3) > v88) {
        unint64_t v88 = 0x5555555555555556 * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3) >= 0x555555555555555) {
        unint64_t v89 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v89 = v88;
      }
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v107.__end_cap_;
      if (v89) {
        v90 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v107.__end_cap_, v89);
      }
      else {
        v90 = 0;
      }
      v91 = v90 + v87;
      __v.__first_ = v90;
      __v.__begin_ = v91;
      __v.__end_cap_.__value_ = &v90[v89];
      long long v92 = *(_OWORD *)&v106.__r_.__value_.__l.__data_;
      v91->__r_.__value_.__r.__words[2] = v106.__r_.__value_.__r.__words[2];
      *(_OWORD *)&v91->__r_.__value_.__l.__data_ = v92;
      memset(&v106, 0, sizeof(v106));
      __v.__end_ = v91 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v107, &__v);
      v93 = v107.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v107.__end_ = v93;
      if (SHIBYTE(v106.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v106.__r_.__value_.__l.__data_);
      }
    }
    else
    {
      long long v86 = *(_OWORD *)&v106.__r_.__value_.__l.__data_;
      v107.__end_->__r_.__value_.__r.__words[2] = v106.__r_.__value_.__r.__words[2];
      *(_OWORD *)&v85->__r_.__value_.__l.__data_ = v86;
      v107.__end_ = v85 + 1;
    }
    std::to_string(&v106, 1.0 / v50);
    std::vector<std::string>::pointer v94 = v107.__end_;
    if (v107.__end_ >= v107.__end_cap_.__value_)
    {
      unint64_t v96 = 0xAAAAAAAAAAAAAAABLL * (((char *)v107.__end_ - (char *)v107.__begin_) >> 3);
      unint64_t v97 = v96 + 1;
      if (v96 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3) > v97) {
        unint64_t v97 = 0x5555555555555556 * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v107.__end_cap_.__value_ - (char *)v107.__begin_) >> 3) >= 0x555555555555555) {
        unint64_t v98 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v98 = v97;
      }
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v107.__end_cap_;
      if (v98) {
        v99 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v107.__end_cap_, v98);
      }
      else {
        v99 = 0;
      }
      v100 = v99 + v96;
      __v.__first_ = v99;
      __v.__begin_ = v100;
      __v.__end_cap_.__value_ = &v99[v98];
      long long v101 = *(_OWORD *)&v106.__r_.__value_.__l.__data_;
      v100->__r_.__value_.__r.__words[2] = v106.__r_.__value_.__r.__words[2];
      *(_OWORD *)&v100->__r_.__value_.__l.__data_ = v101;
      memset(&v106, 0, sizeof(v106));
      __v.__end_ = v100 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v107, &__v);
      v102 = v107.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v107.__end_ = v102;
      if (SHIBYTE(v106.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v106.__r_.__value_.__l.__data_);
      }
    }
    else
    {
      long long v95 = *(_OWORD *)&v106.__r_.__value_.__l.__data_;
      v107.__end_->__r_.__value_.__r.__words[2] = v106.__r_.__value_.__r.__words[2];
      *(_OWORD *)&v94->__r_.__value_.__l.__data_ = v95;
      v107.__end_ = v94 + 1;
    }
    unint64_t v103 = a2[1];
    if (v103 >= a2[2])
    {
      uint64_t v104 = std::vector<std::vector<std::string>>::__push_back_slow_path<std::vector<std::string> const&>(a2, (long long **)&v107);
    }
    else
    {
      std::vector<std::vector<std::string>>::__construct_one_at_end[abi:ne180100]<std::vector<std::string> const&>((uint64_t)a2, (long long **)&v107);
      uint64_t v104 = v103 + 24;
    }
    a2[1] = v104;
    __v.__first_ = (std::__split_buffer<std::string>::pointer)&v107;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  }
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v108;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  return pthread_rwlock_unlock((pthread_rwlock_t *)a1);
}

void sub_21E747510(_Unwind_Exception *a1, uint64_t a2, void *__p, uint64_t a4, int a5, __int16 a6, char a7, char a8, char a9, uint64_t a10, void *__pa, char a12, uint64_t a13, uint64_t a14, std::__split_buffer<std::string> *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a20);
  if (*(char *)(v21 - 137) < 0) {
    operator delete(*(void **)(v21 - 160));
  }
  *(void *)(v21 - 160) = &a17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v21 - 160));
  pthread_rwlock_unlock(v20);
  _Unwind_Resume(a1);
}

BOOL GaussianValueIsValid(double a1)
{
  return (*(void *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000;
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B8];
  uint64_t v3 = *MEMORY[0x263F8C2B8];
  *(void *)a1 = *MEMORY[0x263F8C2B8];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x223C30EA0](a1 + 128);
  return a1;
}

BOOL BayesianModel::Train(BayesianModel *a1, uint64_t *a2, int a3)
{
  uint64_t v3 = (a2[1] - *a2) >> 3;
  uint64_t v4 = a1->m_nFeaturesCount - 1;
  if (v3 == v4)
  {
    pthread_rwlock_wrlock(&a1->m_rwlock);
    double v51 = 0;
    v52 = 0;
    uint64_t v53 = 0;
    __p = 0;
    unint64_t v49 = 0;
    uint64_t v50 = 0;
    BayesianModel::GetGaussiansAndBias2((uint64_t)a1, a2, (uint64_t)&v51, (uint64_t)&__p);
    ++a1->m_nNumberOfTraining;
    double v46 = 0.0;
    double __C = 0.0;
    vDSP_sveD((const double *)v51, 1, &__C, ((char *)v52 - (unsigned char *)v51) >> 3);
    vDSP_sveD((const double *)__p, 1, &v46, (v49 - (unsigned char *)__p) >> 3);
    double v8 = v46 + (double)a1->m_nFeaturesCount;
    double v9 = sqrt(v8);
    double v10 = 1.0 / v9;
    if (a3) {
      double v11 = 1.0;
    }
    else {
      double v11 = -1.0;
    }
    double v12 = v11 * __C * v10;
    StdNormal_Cdf(v12);
    double v15 = -v12;
    if (v14 >= 1.0e-300) {
      double v15 = exp(v12 * v15 * 0.5) / 2.50662827 / v14;
    }
    BayesianModel::w(v13, v10 * (v11 * __C));
    double v17 = v16;
    StdNormal_Cdf(__C / sqrt(v46 + (double)a1->m_nFeaturesCount));
    int v19 = (int)fmin(v18 * 10.0, 9.0);
    ++a1->m_nCalibrationCurveCount[v19];
    uint64_t v20 = a1->m_nTotalExamples + 1;
    a1->unint64_t m_nTotalExamples = v20;
    a1->m_dSumPredictions = v18 + a1->m_dSumPredictions;
    if (a3)
    {
      uint64_t v21 = v19;
      uint64_t v22 = a1->m_nTotalTrue + 1;
      a1->m_nTotalTrue = v22;
      a1->m_dLogScore = log(v18) + a1->m_dLogScore;
      a1->double m_dNormalizedLogScore = a1->m_dNormalizedLogScore
                                + log((double)(unint64_t)v22 / (double)(unint64_t)v20);
      ++a1->m_nCalibrationCurveTrue[v21];
    }
    else
    {
      a1->m_dLogScore = log(1.0 - v18) + a1->m_dLogScore;
      a1->double m_dNormalizedLogScore = a1->m_dNormalizedLogScore
                                + log(1.0 - (double)a1->m_nTotalTrue / (double)(unint64_t)v20);
    }
    double v23 = v11 * v15 / v9;
    uint64_t v24 = *a2;
    double v25 = v17 / v8;
    if (a2[1] != *a2)
    {
      uint64_t v26 = 0;
      unint64_t v27 = 0;
      do
      {
        double v28 = *(double *)((char *)v51 + v26);
        double v29 = *(double *)((char *)__p + v26);
        double m_dEpsilon = a1->m_dEpsilon;
        unint64_t v31 = (double *)std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>(&a1->m_features.__table_.__bucket_list_.__ptr_.__value_, (void *)(v24 + v26));
        if (!v31)
        {
          char v54 = (unint64_t *)(*a2 + v26);
          unint64_t v31 = (double *)std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&a1->m_features, v54, (uint64_t)&std::piecewise_construct, &v54);
        }
        double v32 = v29 * (1.0 - v29 * v25);
        double v33 = v32 / (1.0 - m_dEpsilon + m_dEpsilon * v32);
        v31[3] = 1.0 / v33;
        v31[4] = v33 * ((v28 + v29 * v23) * (1.0 - m_dEpsilon) / v32) * (1.0 / v33);
        ++v27;
        uint64_t v24 = *a2;
        v26 += 8;
      }
      while (v27 < (a2[1] - *a2) >> 3);
    }
    unint64_t v45 = 0xFF00000000000000;
    double v34 = *(v52 - 1);
    double v35 = *(double *)((char *)__p + (char *)v52 - (unsigned char *)v51 - 8);
    double v36 = a1->m_dEpsilon;
    std::vector<std::string>::pointer v37 = (double *)std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>(&a1->m_features.__table_.__bucket_list_.__ptr_.__value_, &v45);
    if (!v37)
    {
      char v54 = &v45;
      std::vector<std::string>::pointer v37 = (double *)std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t)&a1->m_features, &v45, (uint64_t)&std::piecewise_construct, &v54);
    }
    double v38 = v35 * (1.0 - v35 * v25);
    double v39 = v38 / (1.0 - v36 + v36 * v38);
    v37[3] = 1.0 / v39;
    v37[4] = v39 * ((v34 + v35 * v23) * (1.0 - v36) / v38) * (1.0 / v39);
    if (a1->m_features.__table_.__p2_.__value_ > a1->m_maxFeatureCoordinates)
    {
      unsigned int v40 = 0;
      double v41 = 0.95;
      double v42 = 0.005;
      do
      {
        BayesianModel::PruneByMean(a1, v42);
        BayesianModel::PruneByVariance(a1, v41);
        double v42 = v42 + 0.005;
        double v41 = v41 + -0.05;
      }
      while ((double)a1->m_maxFeatureCoordinates * 0.9 < (double)a1->m_features.__table_.__p2_.__value_ && v40++ < 9);
    }
    if (__p)
    {
      unint64_t v49 = __p;
      operator delete(__p);
    }
    if (v51)
    {
      v52 = (double *)v51;
      operator delete(v51);
    }
    pthread_rwlock_unlock(&a1->m_rwlock);
  }
  return v3 == v4;
}

void sub_21E747BF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  if (a16) {
    operator delete(a16);
  }
  pthread_rwlock_unlock(v17);
  _Unwind_Resume(a1);
}

void BayesianModel::GetGaussiansAndBias2(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  std::vector<double>::reserve((void **)a3, ((a2[1] - *a2) >> 3) + 1);
  std::vector<double>::reserve((void **)a4, ((a2[1] - *a2) >> 3) + 1);
  uint64_t v7 = *a2;
  if (a2[1] != *a2)
  {
    unint64_t v8 = 0;
    do
    {
      unint64_t v64 = *(void *)(v7 + 8 * v8);
      double v9 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>((void *)(a1 + 200), &v64);
      if (v9) {
        double v10 = (double *)(v9 + 3);
      }
      else {
        double v10 = (double *)(a1 + 480);
      }
      double v12 = *(double **)(a3 + 8);
      unint64_t v11 = *(void *)(a3 + 16);
      double v13 = v10[1] / *v10;
      if ((unint64_t)v12 >= v11)
      {
        double v15 = *(double **)a3;
        uint64_t v16 = ((uint64_t)v12 - *(void *)a3) >> 3;
        unint64_t v17 = v16 + 1;
        if ((unint64_t)(v16 + 1) >> 61) {
          goto LABEL_75;
        }
        uint64_t v18 = v11 - (void)v15;
        if (v18 >> 2 > v17) {
          unint64_t v17 = v18 >> 2;
        }
        if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v19 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v19 = v17;
        }
        if (v19)
        {
          uint64_t v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>(a3 + 16, v19);
          double v15 = *(double **)a3;
          double v12 = *(double **)(a3 + 8);
        }
        else
        {
          uint64_t v20 = 0;
        }
        uint64_t v21 = (double *)&v20[8 * v16];
        *uint64_t v21 = v13;
        double v14 = v21 + 1;
        while (v12 != v15)
        {
          uint64_t v22 = *((void *)v12-- - 1);
          *((void *)v21-- - 1) = v22;
        }
        *(void *)a3 = v21;
        *(void *)(a3 + 8) = v14;
        *(void *)(a3 + 16) = &v20[8 * v19];
        if (v15) {
          operator delete(v15);
        }
      }
      else
      {
        double *v12 = v13;
        double v14 = v12 + 1;
      }
      *(void *)(a3 + 8) = v14;
      uint64_t v24 = *(double **)(a4 + 8);
      unint64_t v23 = *(void *)(a4 + 16);
      double v25 = 1.0 / *v10;
      if ((unint64_t)v24 >= v23)
      {
        unint64_t v27 = *(double **)a4;
        uint64_t v28 = ((uint64_t)v24 - *(void *)a4) >> 3;
        unint64_t v29 = v28 + 1;
        if ((unint64_t)(v28 + 1) >> 61) {
          goto LABEL_76;
        }
        uint64_t v30 = v23 - (void)v27;
        if (v30 >> 2 > v29) {
          unint64_t v29 = v30 >> 2;
        }
        if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v31 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v31 = v29;
        }
        if (v31)
        {
          double v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>(a4 + 16, v31);
          unint64_t v27 = *(double **)a4;
          uint64_t v24 = *(double **)(a4 + 8);
        }
        else
        {
          double v32 = 0;
        }
        double v33 = (double *)&v32[8 * v28];
        *double v33 = v25;
        uint64_t v26 = v33 + 1;
        while (v24 != v27)
        {
          uint64_t v34 = *((void *)v24-- - 1);
          *((void *)v33-- - 1) = v34;
        }
        *(void *)a4 = v33;
        *(void *)(a4 + 8) = v26;
        *(void *)(a4 + 16) = &v32[8 * v31];
        if (v27) {
          operator delete(v27);
        }
      }
      else
      {
        double *v24 = v25;
        uint64_t v26 = v24 + 1;
      }
      *(void *)(a4 + 8) = v26;
      ++v8;
      uint64_t v7 = *a2;
    }
    while (v8 < (a2[1] - *a2) >> 3);
  }
  unint64_t v64 = 0xFF00000000000000;
  double v35 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>((void *)(a1 + 200), &v64);
  if (v35) {
    double v36 = (double *)(v35 + 3);
  }
  else {
    double v36 = (double *)(a1 + 480);
  }
  unint64_t v37 = *(void *)(a3 + 16);
  double v38 = *(double **)(a3 + 8);
  double v39 = v36[1] / *v36;
  if ((unint64_t)v38 >= v37)
  {
    double v41 = *(double **)a3;
    uint64_t v42 = ((uint64_t)v38 - *(void *)a3) >> 3;
    unint64_t v43 = v42 + 1;
    if ((unint64_t)(v42 + 1) >> 61) {
LABEL_75:
    }
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    uint64_t v44 = v37 - (void)v41;
    if (v44 >> 2 > v43) {
      unint64_t v43 = v44 >> 2;
    }
    if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v45 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v45 = v43;
    }
    if (v45)
    {
      double v46 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>(a3 + 16, v45);
      double v41 = *(double **)a3;
      double v38 = *(double **)(a3 + 8);
    }
    else
    {
      double v46 = 0;
    }
    uint64_t v47 = (double *)&v46[8 * v42];
    v48 = &v46[8 * v45];
    *uint64_t v47 = v39;
    unsigned int v40 = v47 + 1;
    while (v38 != v41)
    {
      uint64_t v49 = *((void *)v38-- - 1);
      *((void *)v47-- - 1) = v49;
    }
    *(void *)a3 = v47;
    *(void *)(a3 + 8) = v40;
    *(void *)(a3 + 16) = v48;
    if (v41) {
      operator delete(v41);
    }
  }
  else
  {
    *double v38 = v39;
    unsigned int v40 = v38 + 1;
  }
  *(void *)(a3 + 8) = v40;
  unint64_t v50 = *(void *)(a4 + 16);
  double v51 = *(double **)(a4 + 8);
  double v52 = 1.0 / *v36;
  if ((unint64_t)v51 >= v50)
  {
    char v54 = *(double **)a4;
    uint64_t v55 = ((uint64_t)v51 - *(void *)a4) >> 3;
    unint64_t v56 = v55 + 1;
    if ((unint64_t)(v55 + 1) >> 61) {
LABEL_76:
    }
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    uint64_t v57 = v50 - (void)v54;
    if (v57 >> 2 > v56) {
      unint64_t v56 = v57 >> 2;
    }
    if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v58 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v58 = v56;
    }
    if (v58)
    {
      unint64_t v59 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>(a4 + 16, v58);
      char v54 = *(double **)a4;
      double v51 = *(double **)(a4 + 8);
    }
    else
    {
      unint64_t v59 = 0;
    }
    unint64_t v60 = (double *)&v59[8 * v55];
    v61 = &v59[8 * v58];
    *unint64_t v60 = v52;
    uint64_t v53 = v60 + 1;
    while (v51 != v54)
    {
      uint64_t v62 = *((void *)v51-- - 1);
      *((void *)v60-- - 1) = v62;
    }
    *(void *)a4 = v60;
    *(void *)(a4 + 8) = v53;
    *(void *)(a4 + 16) = v61;
    if (v54) {
      operator delete(v54);
    }
  }
  else
  {
    *double v51 = v52;
    uint64_t v53 = v51 + 1;
  }
  *(void *)(a4 + 8) = v53;
}

void BayesianModel::v(BayesianModel *this, double a2)
{
  StdNormal_Cdf(a2);
  if (v3 >= 1.0e-300) {
    exp(-a2 * a2 * 0.5);
  }
}

void BayesianModel::w(BayesianModel *this, double a2)
{
  StdNormal_Cdf(a2);
  if (v3 >= 1.0e-300) {
    exp(-a2 * a2 * 0.5);
  }
}

uint64_t BayesianModel::PruneByMean(BayesianModel *this, double a2)
{
  pthread_rwlock_wrlock(&this->m_rwlock);
  __p = 0;
  unint64_t v19 = 0;
  uint64_t v20 = 0;
  next = (double *)this->m_features.__table_.__p1_.__value_.__next_;
  if (next)
  {
    SEL v5 = 0;
    do
    {
      if (fabs(next[4] / next[3]) < a2)
      {
        if (v5 >= v20)
        {
          uint64_t v7 = (char *)__p;
          uint64_t v8 = (v5 - (unsigned char *)__p) >> 3;
          unint64_t v9 = v8 + 1;
          if ((unint64_t)(v8 + 1) >> 61) {
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v10 = v20 - (unsigned char *)__p;
          if ((v20 - (unsigned char *)__p) >> 2 > v9) {
            unint64_t v9 = v10 >> 2;
          }
          if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v11 = v9;
          }
          if (v11)
          {
            double v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&v20, v11);
            uint64_t v7 = (char *)__p;
            SEL v5 = v19;
          }
          else
          {
            double v12 = 0;
          }
          double v13 = &v12[8 * v8];
          *(double *)double v13 = next[2];
          uint64_t v6 = v13 + 8;
          while (v5 != v7)
          {
            uint64_t v14 = *((void *)v5 - 1);
            v5 -= 8;
            *((void *)v13 - 1) = v14;
            v13 -= 8;
          }
          __p = v13;
          unint64_t v19 = v6;
          uint64_t v20 = &v12[8 * v11];
          if (v7) {
            operator delete(v7);
          }
        }
        else
        {
          *(double *)SEL v5 = next[2];
          uint64_t v6 = v5 + 8;
        }
        unint64_t v19 = v6;
        SEL v5 = v6;
      }
      next = *(double **)next;
    }
    while (next);
    double v15 = (char *)__p;
    if (__p != v5)
    {
      do
      {
        uint64_t v17 = *(void *)v15;
        std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__erase_unique<unsigned long long>(&this->m_features.__table_.__bucket_list_.__ptr_.__value_, &v17);
        v15 += 8;
      }
      while (v15 != v5);
      SEL v5 = (char *)__p;
    }
    if (v5)
    {
      unint64_t v19 = v5;
      operator delete(v5);
    }
  }
  return pthread_rwlock_unlock(&this->m_rwlock);
}

void sub_21E74829C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  pthread_rwlock_unlock(v11);
  _Unwind_Resume(a1);
}

uint64_t BayesianModel::PruneByVariance(BayesianModel *this, double a2)
{
  pthread_rwlock_wrlock(&this->m_rwlock);
  __p = 0;
  unint64_t v19 = 0;
  uint64_t v20 = 0;
  next = (double *)this->m_features.__table_.__p1_.__value_.__next_;
  if (next)
  {
    SEL v5 = 0;
    do
    {
      if (1.0 / next[3] >= a2)
      {
        if (v5 >= v20)
        {
          uint64_t v7 = (char *)__p;
          uint64_t v8 = (v5 - (unsigned char *)__p) >> 3;
          unint64_t v9 = v8 + 1;
          if ((unint64_t)(v8 + 1) >> 61) {
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v10 = v20 - (unsigned char *)__p;
          if ((v20 - (unsigned char *)__p) >> 2 > v9) {
            unint64_t v9 = v10 >> 2;
          }
          if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v11 = v9;
          }
          if (v11)
          {
            double v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&v20, v11);
            uint64_t v7 = (char *)__p;
            SEL v5 = v19;
          }
          else
          {
            double v12 = 0;
          }
          double v13 = &v12[8 * v8];
          *(double *)double v13 = next[2];
          uint64_t v6 = v13 + 8;
          while (v5 != v7)
          {
            uint64_t v14 = *((void *)v5 - 1);
            v5 -= 8;
            *((void *)v13 - 1) = v14;
            v13 -= 8;
          }
          __p = v13;
          unint64_t v19 = v6;
          uint64_t v20 = &v12[8 * v11];
          if (v7) {
            operator delete(v7);
          }
        }
        else
        {
          *(double *)SEL v5 = next[2];
          uint64_t v6 = v5 + 8;
        }
        unint64_t v19 = v6;
        SEL v5 = v6;
      }
      next = *(double **)next;
    }
    while (next);
    double v15 = (char *)__p;
    if (__p != v5)
    {
      do
      {
        uint64_t v17 = *(void *)v15;
        std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__erase_unique<unsigned long long>(&this->m_features.__table_.__bucket_list_.__ptr_.__value_, &v17);
        v15 += 8;
      }
      while (v15 != v5);
      SEL v5 = (char *)__p;
    }
    if (v5)
    {
      unint64_t v19 = v5;
      operator delete(v5);
    }
  }
  return pthread_rwlock_unlock(&this->m_rwlock);
}

void sub_21E748460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  pthread_rwlock_unlock(v11);
  _Unwind_Resume(a1);
}

uint64_t BayesianModel::Predict@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  pthread_rwlock_rdlock((pthread_rwlock_t *)a1);
  if (*(int *)(a1 + 240) - 1 == (a2[1] - *a2) >> 3)
  {
    double v25 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    __p = 0;
    unint64_t v23 = 0;
    uint64_t v24 = 0;
    BayesianModel::GetGaussiansAndBias2(a1, a2, (uint64_t)&v25, (uint64_t)&__p);
    double v20 = 0.0;
    double __C = 0.0;
    vDSP_sveD((const double *)v25, 1, &__C, (v26 - (unsigned char *)v25) >> 3);
    vDSP_sveD((const double *)__p, 1, &v20, (v23 - (unsigned char *)__p) >> 3);
    int v8 = *(_DWORD *)(a1 + 240);
    double v9 = v20;
    StdNormal_Inv((a4 + 1.0) * 0.5);
    StdNormal_Cdf(1.0 / sqrt((double)v8) * (__C - v10 * sqrt(v9)));
    *(void *)(a3 + 24) = v11;
    StdNormal_Cdf(__C / sqrt(v20 + (double)*(int *)(a1 + 240)));
    *(void *)(a3 + 16) = v12;
    double v13 = v20;
    *(double *)a3 = __C;
    *(double *)(a3 + 8) = v13;
    *(unsigned char *)(a3 + 32) = 1;
    if (__p)
    {
      unint64_t v23 = __p;
      operator delete(__p);
    }
    if (v25)
    {
      uint64_t v26 = v25;
      operator delete(v25);
    }
  }
  else
  {
    __asm { FMOV            V1.2D, #0.5 }
    *(_OWORD *)a3 = xmmword_21E7E9E30;
    *(_OWORD *)(a3 + 16) = _Q1;
    *(unsigned char *)(a3 + 32) = 0;
  }
  return pthread_rwlock_unlock((pthread_rwlock_t *)a1);
}

void sub_21E748600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, void *a14, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }
  if (a14) {
    operator delete(a14);
  }
  pthread_rwlock_unlock(v15);
  _Unwind_Resume(a1);
}

BOOL BayesianModel::Absorb(BayesianModel *this, const BayesianModel *a2)
{
  int m_nFeaturesCount = this->m_nFeaturesCount;
  int v3 = a2->m_nFeaturesCount;
  if (m_nFeaturesCount == v3)
  {
    pthread_rwlock_wrlock(&this->m_rwlock);
    pthread_rwlock_rdlock(&a2->m_rwlock);
    if (this != a2)
    {
      this->m_features.__table_.__p3_.__value_ = a2->m_features.__table_.__p3_.__value_;
      std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<unsigned long long,Gaussian>,void *> *>>(&this->m_features.__table_.__bucket_list_.__ptr_.__value_, (uint64_t *)a2->m_features.__table_.__p1_.__value_.__next_, 0);
    }
    pthread_rwlock_unlock(&a2->m_rwlock);
    pthread_rwlock_unlock(&this->m_rwlock);
  }
  return m_nFeaturesCount == v3;
}

void sub_21E7486C8(_Unwind_Exception *a1)
{
  pthread_rwlock_unlock(v2);
  pthread_rwlock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t BayesianModel::IncreaseVariance(BayesianModel *this, double a2)
{
  pthread_rwlock_wrlock(&this->m_rwlock);
  for (uint64_t i = (double *)this->m_features.__table_.__p1_.__value_.__next_; i; uint64_t i = *(double **)i)
  {
    double v5 = i[3];
    if (1.0 / v5 < 1.0)
    {
      double v6 = 1.0 / (1.0 / v5 + (1.0 - 1.0 / v5) * a2);
      double v7 = v6 * (i[4] / v5);
      i[3] = v6;
      i[4] = v7;
    }
  }
  return pthread_rwlock_unlock(&this->m_rwlock);
}

void BayesianModel::GetSums(uint64_t a1, uint64_t a2, double *a3, double *a4)
{
  *a3 = 0.0;
  *a4 = 0.0;
  uint64_t v4 = *(double **)a2;
  uint64_t v5 = *(void *)(a2 + 8) - *(void *)a2;
  if (v5)
  {
    unint64_t v6 = v5 >> 4;
    if (v6 <= 1) {
      unint64_t v6 = 1;
    }
    do
    {
      *a3 = *a3 + v4[1] / *v4;
      double v7 = *v4;
      v4 += 2;
      *a4 = *a4 + 1.0 / v7;
      --v6;
    }
    while (v6);
  }
}

void BayesianModel::GetGaussiansAndBias(uint64_t a1, uint64_t *a2, char **a3)
{
  std::vector<Gaussian>::reserve((void **)a3, ((a2[1] - *a2) >> 3) + 1);
  uint64_t v5 = *a2;
  if (a2[1] != *a2)
  {
    unint64_t v6 = 0;
    do
    {
      unint64_t v36 = *(void *)(v5 + 8 * v6);
      double v7 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>((void *)(a1 + 200), &v36);
      if (v7) {
        int v8 = v7 + 3;
      }
      else {
        int v8 = (_OWORD *)(a1 + 480);
      }
      double v10 = a3[1];
      unint64_t v9 = (unint64_t)a3[2];
      if ((unint64_t)v10 >= v9)
      {
        uint64_t v12 = (v10 - *a3) >> 4;
        unint64_t v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 60) {
          goto LABEL_43;
        }
        uint64_t v14 = v9 - (void)*a3;
        if (v14 >> 3 > v13) {
          unint64_t v13 = v14 >> 3;
        }
        if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v15 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v15 = v13;
        }
        if (v15) {
          uint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Gaussian>>((uint64_t)(a3 + 2), v15);
        }
        else {
          uint64_t v16 = 0;
        }
        uint64_t v17 = &v16[16 * v12];
        *(_OWORD *)uint64_t v17 = *v8;
        unint64_t v19 = *a3;
        uint64_t v18 = a3[1];
        double v20 = v17;
        if (v18 != *a3)
        {
          do
          {
            *((_OWORD *)v20 - 1) = *((_OWORD *)v18 - 1);
            v20 -= 16;
            v18 -= 16;
          }
          while (v18 != v19);
          uint64_t v18 = *a3;
        }
        uint64_t v11 = v17 + 16;
        *a3 = v20;
        a3[1] = v17 + 16;
        a3[2] = &v16[16 * v15];
        if (v18) {
          operator delete(v18);
        }
      }
      else
      {
        *(_OWORD *)double v10 = *v8;
        uint64_t v11 = v10 + 16;
      }
      a3[1] = v11;
      ++v6;
      uint64_t v5 = *a2;
    }
    while (v6 < (a2[1] - *a2) >> 3);
  }
  unint64_t v36 = 0xFF00000000000000;
  uint64_t v21 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>((void *)(a1 + 200), &v36);
  if (v21) {
    uint64_t v22 = v21 + 3;
  }
  else {
    uint64_t v22 = (_OWORD *)(a1 + 480);
  }
  unint64_t v23 = (unint64_t)a3[2];
  uint64_t v24 = a3[1];
  if ((unint64_t)v24 >= v23)
  {
    uint64_t v26 = (v24 - *a3) >> 4;
    unint64_t v27 = v26 + 1;
    if ((unint64_t)(v26 + 1) >> 60) {
LABEL_43:
    }
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    uint64_t v28 = v23 - (void)*a3;
    if (v28 >> 3 > v27) {
      unint64_t v27 = v28 >> 3;
    }
    if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v29 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v29 = v27;
    }
    if (v29) {
      uint64_t v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Gaussian>>((uint64_t)(a3 + 2), v29);
    }
    else {
      uint64_t v30 = 0;
    }
    unint64_t v31 = &v30[16 * v26];
    double v32 = &v30[16 * v29];
    *(_OWORD *)unint64_t v31 = *v22;
    double v25 = v31 + 16;
    uint64_t v34 = *a3;
    double v33 = a3[1];
    if (v33 != *a3)
    {
      do
      {
        *((_OWORD *)v31 - 1) = *((_OWORD *)v33 - 1);
        v31 -= 16;
        v33 -= 16;
      }
      while (v33 != v34);
      double v33 = *a3;
    }
    *a3 = v31;
    a3[1] = v25;
    a3[2] = v32;
    if (v33) {
      operator delete(v33);
    }
  }
  else
  {
    *(_OWORD *)uint64_t v24 = *v22;
    double v25 = v24 + 16;
  }
  a3[1] = v25;
}

void std::vector<Gaussian>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 4)
  {
    if (a2 >> 60) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    unint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Gaussian>>(v3, a2);
    double v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF0];
    unint64_t v9 = &v6[16 * v8];
    uint64_t v11 = (char *)*a1;
    double v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *((_OWORD *)v12 - 1) = *((_OWORD *)v10 - 1);
        v12 -= 16;
        v10 -= 16;
      }
      while (v10 != v11);
      double v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

Gaussian *BayesianModel::GetGaussian(BayesianModel *this, uint64_t a2)
{
  uint64_t v5 = a2;
  uint64_t v3 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>(&this->m_features.__table_.__bucket_list_.__ptr_.__value_, &v5);
  if (v3) {
    return (Gaussian *)(v3 + 3);
  }
  else {
    return &this->m_empty;
  }
}

{
  void *v3;
  uint64_t v5;

  uint64_t v5 = a2;
  uint64_t v3 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>(&this->m_features.__table_.__bucket_list_.__ptr_.__value_, &v5);
  if (v3) {
    return (Gaussian *)(v3 + 3);
  }
  else {
    return &this->m_empty;
  }
}

Gaussian *BayesianModel::GetGaussian(BayesianModel *this, unsigned __int8 a2, uint64_t a3)
{
  unint64_t v6 = a3 & 0xFFFFFFFFFFFFFFLL | ((unint64_t)a2 << 56);
  uint64_t v4 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>(&this->m_features.__table_.__bucket_list_.__ptr_.__value_, &v6);
  if (v4) {
    return (Gaussian *)(v4 + 3);
  }
  else {
    return &this->m_empty;
  }
}

void std::vector<double>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    unint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>(v3, a2);
    double v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    unint64_t v9 = &v6[8 * v8];
    double v10 = (char *)*a1;
    uint64_t v11 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v11 != *a1)
    {
      uint64_t v12 = v7;
      do
      {
        uint64_t v13 = *((void *)v11 - 1);
        v11 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

uint64_t BayesianModel::GetFeaturesCount(BayesianModel *this)
{
  return this->m_nFeaturesCount;
}

double BayesianModel::getAverageProbability(BayesianModel *this)
{
  return (double)this->m_nTotalTrue / (double)this->m_nTotalExamples;
}

double BayesianModel::getAveragePrediction(BayesianModel *this)
{
  return this->m_dSumPredictions / (double)this->m_nTotalExamples;
}

double BayesianModel::getMean(BayesianModel *this, unsigned __int8 a2, uint64_t a3)
{
  unint64_t v7 = a3 & 0xFFFFFFFFFFFFFFLL | ((unint64_t)a2 << 56);
  uint64_t v4 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>(&this->m_features.__table_.__bucket_list_.__ptr_.__value_, &v7);
  p_m_empty = (Gaussian *)(v4 + 3);
  if (!v4) {
    p_m_empty = &this->m_empty;
  }
  return p_m_empty->m_dPredicionMean / p_m_empty->m_dPrecision;
}

double BayesianModel::getVariance(BayesianModel *this, unsigned __int8 a2, uint64_t a3)
{
  unint64_t v7 = a3 & 0xFFFFFFFFFFFFFFLL | ((unint64_t)a2 << 56);
  uint64_t v4 = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>(&this->m_features.__table_.__bucket_list_.__ptr_.__value_, &v7);
  p_m_empty = (Gaussian *)(v4 + 3);
  if (!v4) {
    p_m_empty = &this->m_empty;
  }
  return 1.0 / p_m_empty->m_dPrecision;
}

double BayesianModel::getCalibration(BayesianModel *this, unsigned int a2)
{
  double result = 0.0;
  if (a2 <= 9)
  {
    unint64_t v3 = this->m_nCalibrationCurveCount[a2];
    if (v3) {
      return (double)this->m_nCalibrationCurveTrue[a2] / (double)v3;
    }
  }
  return result;
}

double BayesianModel::getCalibrationCount(BayesianModel *this, unsigned int a2)
{
  double result = 0.0;
  if (a2 <= 9) {
    return (double)this->m_nCalibrationCurveCount[a2];
  }
  return result;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x223C30D90](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      double v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x223C30DA0](v13);
  return a1;
}

void sub_21E748EE0(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x223C30DA0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x21E748EC0);
}

void sub_21E748F34(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      uint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_21E7490B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

std::string *std::vector<std::vector<std::string>>::__construct_one_at_end[abi:ne180100]<std::vector<std::string> const&>(uint64_t a1, long long **a2)
{
  unint64_t v3 = *(std::string **)(a1 + 8);
  v3->__r_.__value_.__r.__words[0] = 0;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  double result = std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(v3, *a2, a2[1], 0xAAAAAAAAAAAAAAABLL * (((char *)a2[1] - (char *)*a2) >> 3));
  *(void *)(a1 + 8) = v3 + 1;
  return result;
}

void sub_21E749128(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<std::string>>::__push_back_slow_path<std::vector<std::string> const&>(uint64_t *a1, long long **a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v17 = a1 + 2;
  if (v9) {
    double v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  }
  else {
    double v10 = 0;
  }
  uint64_t v11 = (std::string *)&v10[24 * v4];
  v14[0] = v10;
  v14[1] = v11;
  uint64_t v15 = v11;
  uint64_t v16 = &v10[24 * v9];
  v11->__r_.__value_.__r.__words[0] = 0;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(v11, *a2, a2[1], 0xAAAAAAAAAAAAAAABLL * (((char *)a2[1] - (char *)*a2) >> 3));
  ++v15;
  std::vector<std::vector<std::string>>::__swap_out_circular_buffer(a1, v14);
  uint64_t v12 = a1[1];
  std::__split_buffer<std::vector<std::string>>::~__split_buffer(v14);
  return v12;
}

void sub_21E749240(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::vector<std::string>>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

std::string *std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(std::string *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<std::string>::__vallocate[abi:ne180100](result, a4);
    double result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_21E7492BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::string>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  double result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(uint64_t a1, long long *a2, long long *a3, std::string *this)
{
  uint64_t v4 = this;
  uint64_t v11 = this;
  uint64_t v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((void *)v6 + 1));
        uint64_t v4 = v12;
      }
      else
      {
        long long v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      uint64_t v6 = (long long *)((char *)v6 + 24);
      uint64_t v12 = ++v4;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_21E7493DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  unint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    unint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    unint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0) {
      operator delete(*(void **)(v1 - 24));
    }
    v1 -= 24;
  }
}

uint64_t std::vector<std::vector<std::string>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<std::string>>,std::reverse_iterator<std::vector<std::string>*>,std::reverse_iterator<std::vector<std::string>*>,std::reverse_iterator<std::vector<std::string>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<std::string>>,std::reverse_iterator<std::vector<std::string>*>,std::reverse_iterator<std::vector<std::string>*>,std::reverse_iterator<std::vector<std::string>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      long long v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(void *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 24;
      *((void *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::string>>,std::reverse_iterator<std::vector<std::string>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::string>>,std::reverse_iterator<std::vector<std::string>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::string>>,std::reverse_iterator<std::vector<std::string>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::string>>,std::reverse_iterator<std::vector<std::string>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void ***)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void ***)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = v1;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v3);
    v1 += 3;
  }
}

void **std::__split_buffer<std::vector<std::string>>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<std::vector<std::string>>::clear[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v2; uint64_t i = *(void *)(a1 + 16))
  {
    uint64_t v4 = (void **)(i - 24);
    *(void *)(a1 + 16) = v4;
    uint64_t v5 = v4;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v5);
  }
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>(void *a1, void *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2 ^ HIDWORD(*a2);
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2 ^ HIDWORD(*a2);
    if (v3 >= *(void *)&v2) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  uint64_t v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  uint64_t result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == *a2) {
          return result;
        }
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(void *)&v2) {
            v8 %= *(void *)&v2;
          }
        }
        else
        {
          v8 &= *(void *)&v2 - 1;
        }
        if (v8 != v5) {
          return 0;
        }
      }
      uint64_t result = (void *)*result;
    }
    while (result);
  }
  return result;
}

{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  void *v6;
  void *result;
  unint64_t v8;

  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2 ^ HIDWORD(*a2);
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2 ^ HIDWORD(*a2);
    if (v3 >= *(void *)&v2) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  uint64_t v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  uint64_t result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v3 == v8)
      {
        if (result[2] == *a2) {
          return result;
        }
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(void *)&v2) {
            v8 %= *(void *)&v2;
          }
        }
        else
        {
          v8 &= *(void *)&v2 - 1;
        }
        if (v8 != v5) {
          return 0;
        }
      }
      uint64_t result = (void *)*result;
    }
    while (result);
  }
  return result;
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::__erase_unique<unsigned long long>(void *a1, void *a2)
{
  uint64_t result = std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::find<unsigned long long>(a1, a2);
  if (result)
  {
    std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::erase(a1, result);
    return (uint64_t *)1;
  }
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::erase(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::remove(a1, a2, (uint64_t)&__p);
  unint64_t v3 = __p;
  __p = 0;
  if (v3) {
    operator delete(v3);
  }
  return v2;
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::remove@<X0>(void *result@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  uint64_t v6 = *(void **)(*result + 8 * v4);
  do
  {
    size_t v7 = v6;
    uint64_t v6 = (void *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2) {
    goto LABEL_18;
  }
  unint64_t v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(void *)&v3) {
      v8 %= *(void *)&v3;
    }
  }
  else
  {
    v8 &= *(void *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v9 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(void *)&v3) {
        v9 %= *(void *)&v3;
      }
    }
    else
    {
      v9 &= *(void *)&v3 - 1;
    }
    if (v9 != v4) {
LABEL_19:
    }
      *(void *)(*result + 8 * v4) = 0;
  }
  uint64_t v10 = *a2;
  if (*a2)
  {
    unint64_t v11 = *(void *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(void *)&v3) {
        v11 %= *(void *)&v3;
      }
    }
    else
    {
      v11 &= *(void *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(void *)(*result + 8 * v11) = v7;
      uint64_t v10 = *a2;
    }
  }
  *size_t v7 = v10;
  *a2 = 0;
  --result[3];
  *(void *)a3 = a2;
  *(void *)(a3 + 8) = result + 2;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Gaussian>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

void sub_21E74A02C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21E74A44C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  a12 = (void **)&a9;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a12);

  _Unwind_Resume(a1);
}

void sub_21E74A5DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E74A78C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  std::ostream::~ostream();
  std::stringbuf::~stringbuf(v15 - 136);
  _Unwind_Resume(a1);
}

uint64_t std::stringbuf::~stringbuf(uint64_t a1)
{
  *(void *)a1 = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 87) < 0) {
    operator delete(*(void **)(a1 + 64));
  }
  return std::streambuf::~streambuf();
}

void sub_21E74A98C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  std::ostream::~ostream();
  std::stringbuf::~stringbuf(v15 - 136);
  _Unwind_Resume(a1);
}

std::vector<std::string> *__cdecl std::vector<std::string>::vector(std::vector<std::string> *this, std::vector<std::string>::size_type __n)
{
  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<std::string>::__vallocate[abi:ne180100](this, __n);
    std::vector<std::string>::pointer end = this->__end_;
    size_t v5 = 24 * ((24 * __n - 24) / 0x18) + 24;
    bzero(end, v5);
    this->__end_ = (std::vector<std::string>::pointer)((char *)end + v5);
  }
  return this;
}

void sub_21E74AAF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_21E74D714(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E74DAB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, pthread_rwlock_t *a10, void *a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  MEMORY[0x223C30D50](&a34);
  pthread_rwlock_unlock(a10);

  _Unwind_Resume(a1);
}

void sub_21E74DDF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  pthread_rwlock_unlock(v25);

  _Unwind_Resume(a1);
}

void sub_21E74DFC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  pthread_rwlock_unlock(v16);

  _Unwind_Resume(a1);
}

void sub_21E74E078(_Unwind_Exception *a1)
{
  pthread_rwlock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_21E74E160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9) {
    uint64_t v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  std::__split_buffer<std::string>::pointer end = v10 + v4;
  __v.__first_ = v10;
  __v.__begin_ = end;
  __v.__end_ = end;
  __v.__end_cap_.__value_ = &v10[v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(end, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    std::__split_buffer<std::string>::pointer end = __v.__end_;
  }
  else
  {
    long long v12 = *a2;
    end->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v12;
  }
  __v.__end_ = end + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  uint64_t v13 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v13;
}

void sub_21E74E318(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void RERelevanceEngineDisplayDebugProbabilitiesDidUpdate()
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v0 = +[RESingleton sharedInstance];
  uint64_t v1 = [v0 availableEngines];

  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v7 = [v6 coordinator];
        unint64_t v8 = [v7 elementRelevanceEngine];
        [v8 refreshContent];

        unint64_t v9 = +[RESingleton sharedInstance];
        [v9 reloadDataSourceForEngine:v6];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
}

void sub_21E74F8BC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 232), 8);
  _Unwind_Resume(a1);
}

void REHandlePredictedActionsUpdated(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = (id)[objc_alloc(MEMORY[0x263F089F8]) initWithName:a3 object:a4 userInfo:a5];
  [a2 _requestPredictions:v6];
}

void sub_21E752394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id soft_RESignificantLocationUpdateNotification()
{
  id v0 = (id)RelevanceEngineLibraryCore();
  if (v0)
  {
    uint64_t v5 = 0;
    id v6 = &v5;
    uint64_t v7 = 0x2020000000;
    uint64_t v1 = (id *)getRESignificantLocationUpdateNotificationSymbolLoc_ptr;
    uint64_t v8 = getRESignificantLocationUpdateNotificationSymbolLoc_ptr;
    if (!getRESignificantLocationUpdateNotificationSymbolLoc_ptr)
    {
      v4[0] = MEMORY[0x263EF8330];
      v4[1] = 3221225472;
      v4[2] = __getRESignificantLocationUpdateNotificationSymbolLoc_block_invoke;
      v4[3] = &unk_2644BC768;
      v4[4] = &v5;
      __getRESignificantLocationUpdateNotificationSymbolLoc_block_invoke((uint64_t)v4);
      uint64_t v1 = (id *)v6[3];
    }
    _Block_object_dispose(&v5, 8);
    if (!v1)
    {
      uint64_t v3 = (_Unwind_Exception *)-[RELemmaEnumerator init]();
      _Block_object_dispose(&v5, 8);
      _Unwind_Resume(v3);
    }
    id v0 = *v1;
  }
  return v0;
}

void sub_21E752AA8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21E7531B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_21E753B0C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

uint64_t __RelevanceEngineLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  RelevanceEngineLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getRESignificantLocationUpdateNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)RelevanceEngineLibraryCore();
  if (!v2)
  {
    uint64_t v4 = (void *)abort_report_np();
    free(v4);
  }
  uint64_t result = dlsym(v2, "RESignificantLocationUpdateNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getRESignificantLocationUpdateNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t RECrossFeatureValues(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = 0;
  unint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __RECrossFeatureValues_block_invoke;
  v6[3] = &unk_2644BE388;
  v6[5] = &v8;
  v6[6] = a1;
  v6[4] = v7;
  [v3 enumerateObjectsWithOptions:2 usingBlock:v6];
  uint64_t v4 = v9[3];
  _Block_object_dispose(v7, 8);
  _Block_object_dispose(&v8, 8);

  return v4;
}

void sub_21E754C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void __RECrossFeatureValues_block_invoke(void *a1, void *a2, uint64_t a3)
{
  unint64_t v5 = [a2 integerValue];
  unint64_t v6 = *(void *)(a1[6] + 8 * a3);
  if (REFeatureValueTypeForTaggedPointer(v6) == 1)
  {
    uint64_t v7 = REIntegerValueForTaggedPointer(v6);
  }
  else
  {
    uint64_t v8 = REFeatureValueForTaggedPointer(v6);
    uint64_t v7 = [v8 _integralFeatureValue];
  }
  uint64_t v9 = ~(-1 << v5);
  if (v5 > 0x3F) {
    uint64_t v9 = -1;
  }
  *(void *)(*(void *)(a1[5] + 8) + 24) |= (v7 & v9) << *(void *)(*(void *)(a1[4] + 8) + 24);
  *(void *)(*(void *)(a1[4] + 8) + 24) += v5;
}

id RELogFileBaseDirectory()
{
  if (RELogFileBaseDirectory_onceToken != -1) {
    dispatch_once(&RELogFileBaseDirectory_onceToken, &__block_literal_global_24);
  }
  if (RELogFileBaseDirectory_ValidDirectory)
  {
    id v0 = (id)RELogFileBaseDirectory_BaseDirectory;
  }
  else
  {
    NSTemporaryDirectory();
    id v0 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v0;
}

void __RELogFileBaseDirectory_block_invoke()
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int IsRelevanced = REProcessIsRelevanced();
  uint64_t v1 = NSHomeDirectory();
  uint64_t v2 = v1;
  if (IsRelevanced) {
    id v3 = @"Library/Logs/CrashReporter/";
  }
  else {
    id v3 = @"Library/Logs/CrashReporter/DiagnosticLogs/RelevanceEngine/";
  }
  uint64_t v4 = [v1 stringByAppendingPathComponent:v3];
  unint64_t v5 = (void *)RELogFileBaseDirectory_BaseDirectory;
  RELogFileBaseDirectory_BaseDirectory = v4;

  unint64_t v6 = [MEMORY[0x263F08850] defaultManager];
  char v7 = [v6 fileExistsAtPath:RELogFileBaseDirectory_BaseDirectory];

  if (v7)
  {
    RELogFileBaseDirectory_ValidDirectory = 1;
  }
  else
  {
    uint64_t v8 = [NSURL fileURLWithPath:RELogFileBaseDirectory_BaseDirectory];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      getpid();
      id v10 = v9;
      uint64_t v16 = [v10 fileSystemRepresentation];
      int v11 = sandbox_check();

      if (!v11)
      {
        long long v12 = objc_msgSend(MEMORY[0x263F08850], "defaultManager", v16);
        id v17 = 0;
        char v13 = [v12 createDirectoryAtPath:RELogFileBaseDirectory_BaseDirectory withIntermediateDirectories:1 attributes:0 error:&v17];
        id v14 = v17;
        RELogFileBaseDirectory_ValidDirectory = v13;

        uint64_t v15 = RELogForDomain(5);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v19 = v14;
          _os_log_impl(&dword_21E6E6000, v15, OS_LOG_TYPE_DEFAULT, "Unable to write file %@", buf, 0xCu);
        }
      }
    }
  }
}

id RENewLogFileNameForTask(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v3 = [v2 processName];

  uint64_t v4 = [MEMORY[0x263EFF8F0] currentCalendar];
  unint64_t v5 = [MEMORY[0x263EFF910] date];
  unint64_t v6 = [v4 components:252 fromDate:v5];

  long long v12 = (void *)v3;
  char v7 = [NSString stringWithFormat:@"RelevanceEngine-%@-", v3];
  if (v1)
  {
    uint64_t v8 = [v1 stringByAppendingString:@"-"];
  }
  else
  {
    uint64_t v8 = &stru_26CFA57D0;
  }
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%04ld-%02ld-%02ld-%02ld%02ld%02ld", objc_msgSend(v6, "year"), objc_msgSend(v6, "month"), objc_msgSend(v6, "day"), objc_msgSend(v6, "hour"), objc_msgSend(v6, "minute"), objc_msgSend(v6, "second"));
  id v10 = [NSString stringWithFormat:@"%@%@%@.logs", v7, v8, v9];

  return v10;
}

id RENewLogFilePathForTask(void *a1)
{
  id v1 = a1;
  uint64_t v2 = RELogFileBaseDirectory();
  uint64_t v3 = RENewLogFileNameForTask(v1);

  uint64_t v4 = [v2 stringByAppendingPathComponent:v3];

  return v4;
}

void REStoreLogFileForTask(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  unint64_t v5 = RENewLogFilePathForTask(v3);
  id v9 = 0;
  char v6 = [v4 writeToFile:v5 atomically:1 encoding:4 error:&v9];

  id v7 = v9;
  if ((v6 & 1) == 0)
  {
    uint64_t v8 = RELogForDomain(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      REStoreLogFileForTask_cold_1((uint64_t)v3, (uint64_t)v7, v8);
    }
  }
}

void sub_21E756048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E756274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E756464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E756C88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E756DC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E757C14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
}

void sub_21E758284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v11);
  _Unwind_Resume(a1);
}

void sub_21E759A4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_21E75A028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _REPurgeIntentsImageCaches__49165157(int a1)
{
  if (a1) {
    dispatch_sync(MEMORY[0x263EF83A0], &__block_literal_global_26);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_26);
  }
}

void sub_21E75A4D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E75AA24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_DKSystemEventStreamsClass()
{
  uint64_t v4 = 0;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)get_DKSystemEventStreamsClass_softClass;
  uint64_t v7 = get_DKSystemEventStreamsClass_softClass;
  if (!get_DKSystemEventStreamsClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __get_DKSystemEventStreamsClass_block_invoke;
    v3[3] = &unk_2644BC768;
    v3[4] = &v4;
    __get_DKSystemEventStreamsClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E75B1DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_DKKnowledgeStorageDidInsertEventsNotification()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  id v0 = (void **)get_DKKnowledgeStorageDidInsertEventsNotificationSymbolLoc_ptr;
  uint64_t v8 = get_DKKnowledgeStorageDidInsertEventsNotificationSymbolLoc_ptr;
  if (!get_DKKnowledgeStorageDidInsertEventsNotificationSymbolLoc_ptr)
  {
    id v1 = (void *)CoreDuetLibrary();
    v6[3] = (uint64_t)dlsym(v1, "_DKKnowledgeStorageDidInsertEventsNotification");
    get_DKKnowledgeStorageDidInsertEventsNotificationSymbolLoc_ptr = v6[3];
    id v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[RELemmaEnumerator init]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;
  return v2;
}

id get_DKKnowledgeStorageDidTombstoneEventsNotification()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  id v0 = (void **)get_DKKnowledgeStorageDidTombstoneEventsNotificationSymbolLoc_ptr;
  uint64_t v8 = get_DKKnowledgeStorageDidTombstoneEventsNotificationSymbolLoc_ptr;
  if (!get_DKKnowledgeStorageDidTombstoneEventsNotificationSymbolLoc_ptr)
  {
    id v1 = (void *)CoreDuetLibrary();
    v6[3] = (uint64_t)dlsym(v1, "_DKKnowledgeStorageDidTombstoneEventsNotification");
    get_DKKnowledgeStorageDidTombstoneEventsNotificationSymbolLoc_ptr = v6[3];
    id v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[RELemmaEnumerator init]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t v2 = *v0;
  return v2;
}

BOOL isFutureDate(void *a1)
{
  if (!a1) {
    return 0;
  }
  id v1 = (void *)MEMORY[0x263EFF910];
  id v2 = a1;
  uint64_t v3 = [v1 date];
  uint64_t v4 = [v2 compare:v3];

  BOOL v5 = v4 == 1;
  return v5;
}

void sub_21E75B9EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21E75BFA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21E75C488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21E75C900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t CoreDuetLibraryCore()
{
  if (!CoreDuetLibraryCore_frameworkLibrary) {
    CoreDuetLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return CoreDuetLibraryCore_frameworkLibrary;
}

uint64_t __CoreDuetLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreDuetLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t CoreDuetLibrary()
{
  uint64_t v0 = CoreDuetLibraryCore();
  if (!v0)
  {
    id v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_1_3(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_21E75DBE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *REDisplayStringForPropertyName(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    if (REDisplayStringForPropertyName_onceToken != -1) {
      dispatch_once(&REDisplayStringForPropertyName_onceToken, &__block_literal_global_27);
    }
    id v2 = objc_msgSend((id)REDisplayStringForPropertyName_CamelCaseRegex, "stringByReplacingMatchesInString:options:range:withTemplate:", v1, 0, 0, objc_msgSend(v1, "length"), @"$1 $2");
    uint64_t v3 = [v2 localizedCapitalizedString];
  }
  else
  {
    uint64_t v3 = &stru_26CFA57D0;
  }

  return v3;
}

uint64_t __REDisplayStringForPropertyName_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"([a-z])([A-Z])" options:0 error:0];
  uint64_t v1 = REDisplayStringForPropertyName_CamelCaseRegex;
  REDisplayStringForPropertyName_CamelCaseRegex = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_21E75FA64(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Unwind_Resume(a1);
}

void sub_21E76283C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_21E7640F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

__CFString *REDescriptionStringFromRelevanceBehavior(uint64_t a1)
{
  uint64_t v1 = @"min";
  if (a1) {
    uint64_t v1 = 0;
  }
  if (a1 == 1) {
    return @"max";
  }
  else {
    return v1;
  }
}

uint64_t RETrainingSimulationIsCurrentlyActive()
{
  if (_fetchedInternalBuildOnceToken_1 != -1) {
    dispatch_once(&_fetchedInternalBuildOnceToken_1, &__block_literal_global_30);
  }
  if (!_isInternalDevice_1) {
    return 0;
  }
  uint64_t v0 = +[RESingleton sharedInstance];
  uint64_t v1 = [v0 isActivelyTraining];

  return v1;
}

uint64_t __RETrainingSimulationIsCurrentlyActive_block_invoke()
{
  uint64_t result = _REGetIsInternalBuild();
  _isInternalDevice_1 = result;
  return result;
}

void sub_21E7676EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E767AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E767D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t UIKitLibraryCore()
{
  if (!UIKitLibraryCore_frameworkLibrary) {
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return UIKitLibraryCore_frameworkLibrary;
}

uint64_t __UIKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UIKitLibraryCore_frameworkLibrary = result;
  return result;
}

RESectionPath *__getUIWindowClass_block_invoke(uint64_t a1)
{
  if (!UIKitLibraryCore())
  {
    uint64_t v3 = (void *)abort_report_np();
    free(v3);
  }
  uint64_t result = (RESectionPath *)objc_getClass("UIWindow");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getUIWindowClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v4 = __getUIWindowClass_block_invoke_cold_1();
    return +[RESectionPath sectionPathWithSectionName:v6 element:v7];
  }
  return result;
}

id REStringForSectionPath(void *a1)
{
  uint64_t v1 = NSString;
  id v2 = a1;
  uint64_t v3 = [v2 sectionName];
  uint64_t v4 = [v2 element];

  SEL v5 = [v1 stringWithFormat:@"%@ - %lu", v3, v4];

  return v5;
}

void sub_21E7692EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const void *kTaggedFeatureCFRetain(uint64_t a1, const void *a2)
{
  return a2;
}

void kTaggedFeatureCFRelease(uint64_t a1, const void *a2)
{
}

uint64_t kTaggedFeatureCFEqual(unint64_t a1, unint64_t a2)
{
  if (a1 == a2) {
    return 1;
  }
  uint64_t v4 = REFeatureValueTypeForTaggedPointer(a1);
  if (v4 != REFeatureValueTypeForTaggedPointer(a2)) {
    return 0;
  }
  SEL v5 = REFeatureValueForTaggedPointer(a1);
  id v6 = REFeatureValueForTaggedPointer(a2);
  uint64_t v7 = [v5 isEqual:v6];

  return v7;
}

uint64_t kTaggedFeatureCFDescription(unint64_t a1)
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t kTaggedFeatureCFApplier(uint64_t a1, unsigned char *a2)
{
  if (a2)
  {
    if (!a2[8]) {
      return (*(uint64_t (**)(void))(*(void *)a2 + 16))();
    }
  }
  return result;
}

void sub_21E76B0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

id REBundleConfiguraitonFromBundle(void *a1)
{
  id v1 = a1;
  id v2 = (void *)[v1 principalClass];
  if (v2)
  {
    if ([v2 isSubclassOfClass:objc_opt_class()])
    {
      uint64_t v3 = objc_opt_new();
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v4 = RELogForDomain(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __53__REDirectoryClassLoader__enumerateClassesWithBlock___block_invoke_cold_1((uint64_t)v1, v4);
    }
  }
  uint64_t v3 = 0;
LABEL_8:

  return v3;
}

id REScriptParseOptionsValues(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  [v3 push];
  SEL v5 = [v3 currentToken];
  uint64_t v6 = [v5 type];

  if (v6 != 32)
  {
LABEL_12:
    [v3 consume];
    int v11 = (void *)[v4 copy];
    goto LABEL_15;
  }
  [v3 next];
  if (!REExpectTokenTypeInBuffer(v3, 6uLL, a2))
  {
LABEL_10:
    if (!REExpectTokenTypeInBuffer(v3, 0x21uLL, a2))
    {
      [v3 pop];
      goto LABEL_14;
    }
    [v3 next];
    goto LABEL_12;
  }
  while (1)
  {
    id v7 = [v3 currentToken];
    [v3 next];
    uint64_t v8 = [v3 currentToken];
    uint64_t v9 = [v8 type];

    uint64_t v10 = v7;
    if (v9 != 29) {
      goto LABEL_6;
    }
    [v3 next];
    if (!REExpectTokenTypeInBuffer(v3, 6uLL, a2)) {
      break;
    }
    uint64_t v10 = [v3 currentToken];

    [v3 next];
LABEL_6:
    [v4 setObject:v10 forKeyedSubscript:v7];
    if (!REExpectTokenTypeInBuffer(v3, 0x1BuLL, a2))
    {

      goto LABEL_10;
    }
    [v3 next];

    if (!REExpectTokenTypeInBuffer(v3, 6uLL, a2)) {
      goto LABEL_10;
    }
  }
  [v3 pop];

LABEL_14:
  int v11 = 0;
LABEL_15:

  return v11;
}

void sub_21E76D1EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21E76D79C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, __CFString *a12, uint64_t a13)
{
  if (a2 == 1)
  {
    id v16 = objc_begin_catch(exception_object);
    if (v15)
    {
      uint64_t v17 = NSString;
      uint64_t v18 = [v13 name];
      uint64_t v22 = [v16 description];
      id v19 = [v17 stringWithFormat:@"Unable to transformer %@: %@"];

      a12 = @"REErrorTokenKey";
      uint64_t v20 = [v14 token];
      a13 = (uint64_t)v20;
      uint64_t v21 = [NSDictionary dictionaryWithObjects:&a13 forKeys:&a12 count:1];
      RECreateErrorWithCodeMessageAndUseInfo(211, v19, v21);
      void *v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_end_catch();
    JUMPOUT(0x21E76D744);
  }
  _Unwind_Resume(exception_object);
}

uint64_t REPropertyIsInternalAttribute(void *a1, const char *a2)
{
  return [a1 hasPrefix:@"$attrib-"];
}

id REPropertyNameFromInternalAttribute(void *a1)
{
  id v1 = a1;
  id v2 = [v1 substringFromIndex:objc_msgSend(@"$attrib-", "length")];

  return v2;
}

uint64_t REInternalProperty(uint64_t a1)
{
  return [@"$attrib-" stringByAppendingString:a1];
}

uint64_t REEncodeIdentificationProperites()
{
  return [MEMORY[0x263EFFA08] setWithArray:&unk_26CFCD740];
}

id REUpNextSiriServerInterface()
{
  if (REUpNextSiriServerInterface_onceToken != -1) {
    dispatch_once(&REUpNextSiriServerInterface_onceToken, &__block_literal_global_34);
  }
  uint64_t v0 = (void *)REUpNextSiriServerInterface_interface;
  return v0;
}

uint64_t __REUpNextSiriServerInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CFD3E80];
  uint64_t v1 = REUpNextSiriServerInterface_interface;
  REUpNextSiriServerInterface_interface = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id REUpNextSiriClientInterface()
{
  if (REUpNextSiriClientInterface_onceToken != -1) {
    dispatch_once(&REUpNextSiriClientInterface_onceToken, &__block_literal_global_46);
  }
  uint64_t v0 = (void *)REUpNextSiriClientInterface_interface;
  return v0;
}

uint64_t __REUpNextSiriClientInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CFF2E48];
  uint64_t v1 = REUpNextSiriClientInterface_interface;
  REUpNextSiriClientInterface_interface = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_21E7708B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E770D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E770F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E7710B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCSLPRFDefaultAppDataProviderClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!CarouselPreferenceServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __CarouselPreferenceServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_2644BEEA0;
    uint64_t v6 = 0;
    CarouselPreferenceServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!CarouselPreferenceServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CSLPRFDefaultAppDataProvider");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getCSLPRFDefaultAppDataProviderClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCSLPRFDefaultAppDataProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CarouselPreferenceServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CarouselPreferenceServicesLibraryCore_frameworkLibrary = result;
  return result;
}

__CFString *RERelationDescription(uint64_t a1)
{
  if ((unint64_t)(a1 + 2) > 6) {
    return 0;
  }
  else {
    return off_2644BEF08[a1 + 2];
  }
}

__CFString *REStringFromFeatureType(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_2644BEF40[a1];
  }
}

void sub_21E774BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E775188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getMPAVRoutingControllerActiveSystemRouteDidChangeNotification()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v0 = (void **)getMPAVRoutingControllerActiveSystemRouteDidChangeNotificationSymbolLoc_ptr;
  uint64_t v8 = getMPAVRoutingControllerActiveSystemRouteDidChangeNotificationSymbolLoc_ptr;
  if (!getMPAVRoutingControllerActiveSystemRouteDidChangeNotificationSymbolLoc_ptr)
  {
    uint64_t v1 = (void *)MediaPlayerLibrary();
    v6[3] = (uint64_t)dlsym(v1, "MPAVRoutingControllerActiveSystemRouteDidChangeNotification");
    getMPAVRoutingControllerActiveSystemRouteDidChangeNotificationSymbolLoc_ptr = v6[3];
    uint64_t v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)-[RELemmaEnumerator init]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  id v2 = *v0;
  return v2;
}

void sub_21E775AB8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21E775D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMPRequestResponseControllerClass_block_invoke(uint64_t a1)
{
  MediaPlayerLibrary();
  Class result = objc_getClass("MPRequestResponseController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMPRequestResponseControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getMPRequestResponseControllerClass_block_invoke_cold_1();
    return (Class)MediaPlayerLibrary();
  }
  return result;
}

uint64_t MediaPlayerLibrary()
{
  uint64_t v0 = MediaPlayerLibraryCore();
  if (!v0)
  {
    id v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t MediaPlayerLibraryCore()
{
  if (!MediaPlayerLibraryCore_frameworkLibrary) {
    MediaPlayerLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return MediaPlayerLibraryCore_frameworkLibrary;
}

uint64_t __MediaPlayerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaPlayerLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getMPAVRoutingControllerActiveSystemRouteDidChangeNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)MediaPlayerLibrary();
  uint64_t result = dlsym(v2, "MPAVRoutingControllerActiveSystemRouteDidChangeNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMPAVRoutingControllerActiveSystemRouteDidChangeNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                          + 24);
  return result;
}

void __getMPAVRoutingControllerClass_block_invoke(uint64_t a1)
{
  MediaPlayerLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MPAVRoutingController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMPAVRoutingControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = __getMPAVRoutingControllerClass_block_invoke_cold_1();
    __getMPCPlayerRequestClass_block_invoke(v2);
  }
}

void __getMPCPlayerRequestClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MPCPlayerRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMPCPlayerRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getMPCPlayerRequestClass_block_invoke_cold_1();
    MediaPlaybackCoreLibrary();
  }
}

void MediaPlaybackCoreLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!MediaPlaybackCoreLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __MediaPlaybackCoreLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_2644BEF98;
    uint64_t v3 = 0;
    MediaPlaybackCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!MediaPlaybackCoreLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __MediaPlaybackCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaPlaybackCoreLibraryCore_frameworkLibrary = result;
  return result;
}

void __getMPCPlayerPathClass_block_invoke(uint64_t a1)
{
  MediaPlaybackCoreLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MPCPlayerPath");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getMPCPlayerPathClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    long long v2 = (REDataSourceCatalog *)__getMPCPlayerPathClass_block_invoke_cold_1();
    [(REDataSourceCatalog *)v2 dealloc];
  }
}

uint64_t REApplicationIsRestricted(void *a1)
{
  id v1 = a1;
  long long v2 = +[REApplicationCache sharedInstance];
  uint64_t v3 = [v2 applicationIsRestricted:v1];

  return v3;
}

uint64_t REApplicationIsRemoved(void *a1)
{
  id v1 = a1;
  long long v2 = +[REApplicationCache sharedInstance];
  uint64_t v3 = [v2 applicationIsRemoved:v1];

  return v3;
}

uint64_t REApplicationIsRemote(void *a1)
{
  id v1 = a1;
  long long v2 = +[REApplicationCache sharedInstance];
  uint64_t v3 = [v2 applicationIsRemote:v1];

  return v3;
}

id RELocalApplicationIdentifierForRemoteApplication(void *a1)
{
  id v1 = a1;
  long long v2 = +[REApplicationCache sharedInstance];
  uint64_t v3 = [v2 localApplicationForRemoteApplication:v1];

  return v3;
}

id RERemoteApplicationIdentifierForLocalApplication(void *a1)
{
  id v1 = a1;
  long long v2 = +[REApplicationCache sharedInstance];
  uint64_t v3 = [v2 remoteApplicationForLocalApplication:v1];

  return v3;
}

id REWatchKitExtensionForApplicationIdentifier(void *a1)
{
  id v1 = a1;
  long long v2 = +[REApplicationCache sharedInstance];
  uint64_t v3 = [v2 watchKitExtensionForApplication:v1];

  return v3;
}

uint64_t REApplicationGetType(void *a1)
{
  id v1 = a1;
  long long v2 = +[REApplicationCache sharedInstance];
  uint64_t v3 = [v2 typeForApplication:v1];

  return v3;
}

id REApplicationCachePrewarm()
{
  return +[REApplicationCache sharedInstance];
}

void normal_erf(double a1)
{
  if ((*(void *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000)
  {
    double v1 = fabs(a1);
    if (v1 > 0.662912607) {
      exp(-(v1 * v1) * 0.5);
    }
  }
}

double scaled_box_muller(double a1, double a2, double a3)
{
  do
  {
    int v6 = rand();
    double v7 = ((double)v6 + (double)v6) / 2147483650.0 + -1.0;
    int v8 = rand();
    double v9 = ((double)v8 + (double)v8) / 2147483650.0 + -1.0;
    double v10 = v9 * v9;
    double v11 = v10 + v7 * v7;
  }
  while (v11 == 0.0 || v11 > 1.0);
  return a1 + v7 * sqrt(log(v10 + v7 * v7) * -2.0 / v11) * a3 * sqrt(a2);
}

void sub_21E778670(_Unwind_Exception *exception_object)
{
}

void sub_21E7786A0(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  sub_21E778670(a1);
}

id RESharedSerialDispatchQueue()
{
  if (RESharedSerialDispatchQueue_onceToken != -1) {
    dispatch_once(&RESharedSerialDispatchQueue_onceToken, &__block_literal_global_42);
  }
  uint64_t v0 = (void *)RESharedSerialDispatchQueue_queue;
  return v0;
}

void __RESharedSerialDispatchQueue_block_invoke()
{
  long long v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.relevanceengine.shared.utility.dispatch-queue", v2);
  double v1 = (void *)RESharedSerialDispatchQueue_queue;
  RESharedSerialDispatchQueue_queue = (uint64_t)v0;
}

BOOL REDeviceIsLocked()
{
  if (_RERegisterForLockedStatusChangeIfNecessary_onceToken != -1) {
    dispatch_once(&_RERegisterForLockedStatusChangeIfNecessary_onceToken, &__block_literal_global_103);
  }
  int v0 = MKBGetDeviceLockState();
  if (v0) {
    BOOL v1 = v0 == 3;
  }
  else {
    BOOL v1 = 1;
  }
  return !v1;
}

uint64_t _significantTimeChangeForScheduler(uint64_t a1, void *a2)
{
  return [a2 schedule];
}

void _REClearSupergreenUsedQuery()
{
  os_unfair_lock_lock((os_unfair_lock_t)&lastQueryLock);
  int v0 = (void *)lastQueryDate;
  lastQueryDate = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&lastQueryLock);
}

uint64_t _REIsSupergreenUsedInLastInterval(double a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)&lastQueryLock);
  if (!_REIsSupergreenUsedInLastInterval_lastInUseCache)
  {
    uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v3 = (void *)_REIsSupergreenUsedInLastInterval_lastInUseCache;
    _REIsSupergreenUsedInLastInterval_lastInUseCache = v2;
  }
  if (!lastQueryDate || ([(id)lastQueryDate timeIntervalSinceNow], fabs(v4) > 3600.0))
  {
    uint64_t v5 = [MEMORY[0x263EFF910] date];
    int v6 = (void *)lastQueryDate;
    lastQueryDate = v5;

    double v7 = (void *)_REIsSupergreenUsedInLastInterval_lastInUseDate;
    _REIsSupergreenUsedInLastInterval_lastInUseDate = 0;

    int v8 = @"com.apple.RelevanceEngine";
    double v9 = @"SupergreenLastInUseDate";
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    double v10 = objc_msgSend(MEMORY[0x263F57730], "sharedInstance", 0);
    double v11 = [v10 getAllDevices];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:v8 pairedDevice:*(void *)(*((void *)&v27 + 1) + 8 * i)];
          uint64_t v17 = [v16 objectForKey:v9];
          uint64_t v18 = v17;
          if (v17 && (!_REIsSupergreenUsedInLastInterval_lastInUseDate || objc_msgSend(v17, "compare:") == 1)) {
            objc_storeStrong((id *)&_REIsSupergreenUsedInLastInterval_lastInUseDate, v18);
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v13);
    }

    [(id)_REIsSupergreenUsedInLastInterval_lastInUseCache removeAllObjects];
  }
  id v19 = [NSNumber numberWithDouble:a1];
  uint64_t v20 = [(id)_REIsSupergreenUsedInLastInterval_lastInUseCache objectForKeyedSubscript:v19];

  if (v20)
  {
    uint64_t v21 = [(id)_REIsSupergreenUsedInLastInterval_lastInUseCache objectForKeyedSubscript:v19];
    uint64_t v22 = [v21 BOOLValue];
  }
  else
  {
    if (_REIsSupergreenUsedInLastInterval_lastInUseDate)
    {
      [(id)_REIsSupergreenUsedInLastInterval_lastInUseDate timeIntervalSinceNow];
      uint64_t v22 = v23 >= 0.0 || -v23 < a1;
      uint64_t v24 = RELogForDomain(0);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        double v25 = @"NO";
        if (v22) {
          double v25 = @"YES";
        }
        *(_DWORD *)buf = 134218242;
        double v32 = a1;
        __int16 v33 = 2112;
        uint64_t v34 = v25;
        _os_log_impl(&dword_21E6E6000, v24, OS_LOG_TYPE_DEFAULT, "_REIsSupergreenUsedInLastInterval(%f): %@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v24 = RELogForDomain(0);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v32 = a1;
        _os_log_impl(&dword_21E6E6000, v24, OS_LOG_TYPE_DEFAULT, "_REIsSupergreenUsedInLastInterval(%f): NO (no date pref)", buf, 0xCu);
      }
      uint64_t v22 = 0;
    }

    uint64_t v21 = [NSNumber numberWithBool:v22];
    [(id)_REIsSupergreenUsedInLastInterval_lastInUseCache setObject:v21 forKeyedSubscript:v19];
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&lastQueryLock);
  return v22;
}

uint64_t REIsSupergreenUsedInLastSevenDays()
{
  return _REIsSupergreenUsedInLastInterval(648000.0);
}

uint64_t REIsSupergreenUsedInLastOneDay()
{
  return _REIsSupergreenUsedInLastInterval(129600.0);
}

float RESupergreenSuggestedImageDonationWidth()
{
  return 68.0;
}

uint64_t REProcessIsRelevanced()
{
  if (REProcessIsRelevanced_onceToken != -1) {
    dispatch_once(&REProcessIsRelevanced_onceToken, &__block_literal_global_59);
  }
  return REProcessIsRelevanced_IsRelevanced;
}

void __REProcessIsRelevanced_block_invoke()
{
  int v0 = [MEMORY[0x263F01890] bundleRecordForCurrentProcess];

  if (!v0)
  {
    BOOL v1 = SecTaskCreateFromSelf(0);
    if (v1)
    {
      uint64_t v2 = v1;
      CFErrorRef error = 0;
      uint64_t v3 = (void *)SecTaskCopyValueForEntitlement(v1, @"application-identifier", &error);
      double v4 = v3;
      if (v3)
      {
        REProcessIsRelevanced_int IsRelevanced = [v3 isEqualToString:@"com.apple.relevanceengine.relevanced"];
      }
      else
      {
        int v6 = RELogForDomain(0);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          __REProcessIsRelevanced_block_invoke_cold_2((uint64_t *)&error, v6);
        }
      }
      CFRelease(v2);
    }
    else
    {
      uint64_t v5 = RELogForDomain(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __REProcessIsRelevanced_block_invoke_cold_1(v5);
      }
    }
  }
}

id REBuildVersion()
{
  if (REBuildVersion_onceToken != -1) {
    dispatch_once(&REBuildVersion_onceToken, &__block_literal_global_62);
  }
  int v0 = (void *)REBuildVersion_BuildVersion;
  return v0;
}

uint64_t __REBuildVersion_block_invoke()
{
  uint64_t v0 = MGGetStringAnswer();
  uint64_t v1 = REBuildVersion_BuildVersion;
  REBuildVersion_BuildVersion = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id REUpNextDemoUserDefaults()
{
  if (REUpNextDemoUserDefaults_onceToken != -1) {
    dispatch_once(&REUpNextDemoUserDefaults_onceToken, &__block_literal_global_67);
  }
  uint64_t v0 = (void *)REUpNextDemoUserDefaults_defaults;
  return v0;
}

uint64_t __REUpNextDemoUserDefaults_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.NanoTimeKit.face"];
  uint64_t v1 = REUpNextDemoUserDefaults_defaults;
  REUpNextDemoUserDefaults_defaults = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void RERaiseInternalException(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  double v10 = (objc_class *)NSString;
  id v11 = a2;
  id v12 = a1;
  uint64_t v13 = (void *)[[v10 alloc] initWithFormat:v11 arguments:&a9];

  uint64_t v14 = RELogForDomain(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    RERaiseInternalException_cold_1(v13);
  }

  RESubmitError(v12, v13);
}

void _REGenerateSimulatedCrash(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a1;
  id v11 = a2;
  id v12 = (void *)[[NSString alloc] initWithFormat:v11 arguments:&a9];
  uint64_t v13 = RELogForDomain(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    _REGenerateSimulatedCrash_cold_2(v12);
  }

  uint64_t v14 = getpid();
  id v15 = v12;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  id v16 = (void (*)(uint64_t, uint64_t, id))getSimulateCrashSymbolLoc_ptr;
  uint64_t v22 = getSimulateCrashSymbolLoc_ptr;
  if (!getSimulateCrashSymbolLoc_ptr)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __getSimulateCrashSymbolLoc_block_invoke;
    v18[3] = &unk_2644BC768;
    v18[4] = &v19;
    __getSimulateCrashSymbolLoc_block_invoke((uint64_t)v18);
    id v16 = (void (*)(uint64_t, uint64_t, id))v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v16)
  {
    uint64_t v17 = (_Unwind_Exception *)-[RELemmaEnumerator init]();
    _Block_object_dispose(&v19, 8);
    _Unwind_Resume(v17);
  }
  v16(v14, 195936478, v15);
}

uint64_t REIsCurrentLocaleCJK()
{
  if (REIsCurrentLocaleCJK_onceToken != -1) {
    dispatch_once(&REIsCurrentLocaleCJK_onceToken, &__block_literal_global_74);
  }
  uint64_t v0 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v1 = [v0 objectForKey:*MEMORY[0x263EFF508]];

  uint64_t v2 = [(id)REIsCurrentLocaleCJK__cjkSet containsObject:v1];
  return v2;
}

uint64_t __REIsCurrentLocaleCJK_block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"zh", @"ja", @"ko", 0);
  uint64_t v1 = REIsCurrentLocaleCJK__cjkSet;
  REIsCurrentLocaleCJK__cjkSet = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t REShowRecentDeveloperDonations()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (REShowRecentDeveloperDonations_onceToken != -1) {
    dispatch_once(&REShowRecentDeveloperDonations_onceToken, &__block_literal_global_87_0);
  }
  [(id)REShowRecentDeveloperDonations_defaultAccessLock lock];
  if ((REShowRecentDeveloperDonations___needsUpdate & 1) == 0)
  {
    REShowRecentDeveloperDonations___flag = CFPreferencesGetAppBooleanValue(@"displayRecentDonations", @"com.apple.duetexpertd", 0) != 0;
    uint64_t v0 = RELogForDomain(0);
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      if (REShowRecentDeveloperDonations___flag) {
        uint64_t v1 = @"YES";
      }
      else {
        uint64_t v1 = @"NO";
      }
      int v3 = 138412290;
      double v4 = v1;
      _os_log_impl(&dword_21E6E6000, v0, OS_LOG_TYPE_DEFAULT, "Is the Display Recent Donations switch on? : %@", (uint8_t *)&v3, 0xCu);
    }

    REShowRecentDeveloperDonations___needsUpdate = 1;
  }
  [(id)REShowRecentDeveloperDonations_defaultAccessLock unlock];
  return REShowRecentDeveloperDonations___flag;
}

uint64_t __REShowRecentDeveloperDonations_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08958]);
  uint64_t v1 = (void *)REShowRecentDeveloperDonations_defaultAccessLock;
  REShowRecentDeveloperDonations_defaultAccessLock = (uint64_t)v0;

  uint64_t v2 = MEMORY[0x263EF83A0];
  return notify_register_dispatch("com.apple.duetexpertd.defaultsChanged", (int *)&REShowRecentDeveloperDonations_notifyToken, v2, &__block_literal_global_92);
}

void __REShowRecentDeveloperDonations_block_invoke_2()
{
  [(id)REShowRecentDeveloperDonations_defaultAccessLock lock];
  REShowRecentDeveloperDonations___needsUpdate = 0;
  [(id)REShowRecentDeveloperDonations_defaultAccessLock unlock];
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"REShowRecentDeveloperDonationsChangedNotification" object:0];
}

id REBundle()
{
  if (REBundle_onceToken != -1) {
    dispatch_once(&REBundle_onceToken, &__block_literal_global_100_0);
  }
  id v0 = (void *)REBundle_Bundle;
  return v0;
}

uint64_t __REBundle_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v1 = REBundle_Bundle;
  REBundle_Bundle = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void *__getSimulateCrashSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!CrashReporterSupportLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __CrashReporterSupportLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_2644BF0F0;
    uint64_t v7 = 0;
    CrashReporterSupportLibraryCore_frameworkLibrary = _sl_dlopen();
    int v3 = (void *)v5[0];
    uint64_t v2 = (void *)CrashReporterSupportLibraryCore_frameworkLibrary;
    if (CrashReporterSupportLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      int v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)CrashReporterSupportLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "SimulateCrash");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSimulateCrashSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CrashReporterSupportLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CrashReporterSupportLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_21E77D33C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E77E05C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCSLPRFDefaultAppDataProviderClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!CarouselPreferenceServicesLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __CarouselPreferenceServicesLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_2644BF2E8;
    uint64_t v6 = 0;
    CarouselPreferenceServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!CarouselPreferenceServicesLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CSLPRFDefaultAppDataProvider");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getCSLPRFDefaultAppDataProviderClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCSLPRFDefaultAppDataProviderClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CarouselPreferenceServicesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  CarouselPreferenceServicesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

uint64_t Int64_SafeTimeIntervalToNSEC(double a1)
{
  if (a1 <= 9223372040.0) {
    return (uint64_t)(a1 * 1000000000.0);
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

unint64_t UInt64_SafeTimeIntervalToNSEC(double a1)
{
  if (a1 > 1.84467441e10) {
    return -1;
  }
  else {
    return (unint64_t)(a1 * 1000000000.0);
  }
}

void sub_21E77EBCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E7809C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __REGetShowAllElements_block_invoke()
{
  uint64_t result = _REGetIsInternalBuild();
  _isInternalDevice_3 = result;
  return result;
}

void __RE_Cached_updateValue__ShowAllElements()
{
  os_unfair_lock_lock((os_unfair_lock_t)&__RE_Cached_lock__ShowAllElements);
  __RE_Cached_hasValue__ShowAllElements = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&__RE_Cached_lock__ShowAllElements);
  RERelevanceEngineDisplayDebugProbabilitiesDidUpdate();
}

uint64_t __RelevanceEngineLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  RelevanceEngineLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_21E784658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id REStartOfDayForDate(void *a1)
{
  if (a1)
  {
    uint64_t v1 = (void *)MEMORY[0x263EFF8F0];
    id v2 = a1;
    int v3 = [v1 currentCalendar];
    double v4 = [v3 startOfDayForDate:v2];
  }
  else
  {
    double v4 = 0;
  }
  return v4;
}

id REStartOfNextDayForDate(void *a1)
{
  if (a1)
  {
    uint64_t v1 = (void *)MEMORY[0x263EFF8F0];
    id v2 = a1;
    int v3 = [v1 currentCalendar];
    double v4 = [v3 dateByAddingUnit:16 value:1 toDate:v2 options:0];

    long long v5 = [v3 startOfDayForDate:v4];
  }
  else
  {
    long long v5 = 0;
  }
  return v5;
}

id REEndOfDayForDate(void *a1)
{
  if (a1)
  {
    uint64_t v1 = (void *)MEMORY[0x263EFF8F0];
    id v2 = a1;
    int v3 = [v1 currentCalendar];
    double v4 = [v3 components:30 fromDate:v2];

    [v4 setHour:23];
    [v4 setMinute:59];
    [v4 setSecond:59];
    [v4 setNanosecond:99999999];
    long long v5 = [v3 dateFromComponents:v4];
  }
  else
  {
    long long v5 = 0;
  }
  return v5;
}

id RERoundDateDownToNearestMinute(void *a1)
{
  if (a1)
  {
    uint64_t v1 = (void *)MEMORY[0x263EFF8F0];
    id v2 = a1;
    int v3 = [v1 currentCalendar];
    double v4 = [v3 components:126 fromDate:v2];

    long long v5 = [v3 dateFromComponents:v4];
  }
  else
  {
    long long v5 = 0;
  }
  return v5;
}

id REEndOfDayAfterNumberOfDaysForDate(void *a1, uint64_t a2)
{
  if (a1)
  {
    int v3 = (void *)MEMORY[0x263EFF8F0];
    id v4 = a1;
    long long v5 = [v3 currentCalendar];
    uint64_t v6 = objc_opt_new();
    [v6 setDay:a2];
    uint64_t v7 = [v5 dateByAddingComponents:v6 toDate:v4 options:0];

    uint64_t v8 = REEndOfDayForDate(v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

id REDemoPivotDate()
{
  uint64_t v0 = [MEMORY[0x263EFF910] date];
  uint64_t v1 = REStartOfDayForDate(v0);
  id v2 = [v1 dateByAddingTimeInterval:64800.0];

  return v2;
}

id REDemoDateForIdentifier(void *a1, uint64_t a2)
{
  uint64_t v3 = REDemoDateForIdentifier_onceToken;
  id v4 = a1;
  if (v3 != -1) {
    dispatch_once(&REDemoDateForIdentifier_onceToken, &__block_literal_global_48);
  }
  uint64_t v5 = [(id)REDemoDateForIdentifier_defaults integerForKey:v4];

  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = a2;
  }
  uint64_t v7 = REDemoPivotDate();
  uint64_t v8 = [v7 dateByAddingTimeInterval:(double)v6 * 60.0];

  return v8;
}

uint64_t __REDemoDateForIdentifier_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.NanoTimeKit.face"];
  uint64_t v1 = REDemoDateForIdentifier_defaults;
  REDemoDateForIdentifier_defaults = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

REForcedRelevanceProvider *REAbsoluteRelevanceProviderForDate(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x263EFF910] date];
  id v3 = objc_alloc(MEMORY[0x263F08798]);
  id v4 = REStartOfDayForDate(v2);
  uint64_t v5 = REEndOfDayForDate(v2);
  uint64_t v6 = (void *)[v3 initWithStartDate:v4 endDate:v5];

  if ([v6 containsDate:v1])
  {
    uint64_t v7 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v8 = [v7 components:96 fromDate:v1];
    float v9 = (float)[v8 minute];
    float v10 = 1.0 - ((v9 + (float)[v8 hour] * 60.0) / 1440.0 * 0.9 + 0.1);
    id v11 = [REForcedRelevanceProvider alloc];
    *(float *)&double v12 = v10;
    uint64_t v13 = [(REForcedRelevanceProvider *)v11 initWithForcedRelevance:v12];
  }
  else
  {
    uint64_t v13 = [[REForcedRelevanceProvider alloc] initWithForcedRelevance:0.0];
  }

  return v13;
}

id REDemoElementsFromElements(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = __REDemoElementsFromElements_block_invoke(v4, *(void **)(*((void *)&v11 + 1) + 8 * v7));
        if (v8) {
          objc_msgSend(v2, "addObject:", v8, (void)v11);
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v5 = v4;
    }
    while (v4);
  }

  float v9 = (void *)[v2 copy];
  return v9;
}

REElement *__REDemoElementsFromElements_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = a2;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = objc_msgSend(v2, "relevanceProviders", 0);
  id v4 = (id)[v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  uint64_t v8 = [v4 interval];
  float v9 = [v8 startDate];

  if (v9)
  {
    float v10 = REAbsoluteRelevanceProviderForDate(v9);
    long long v11 = [REElement alloc];
    long long v12 = [v2 identifier];
    long long v13 = [v2 content];
    long long v14 = [v2 action];
    uint64_t v22 = v10;
    id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
    uint64_t v16 = -[REElement initWithIdentifier:content:action:relevanceProviders:privacyBehavior:](v11, "initWithIdentifier:content:action:relevanceProviders:privacyBehavior:", v12, v13, v14, v15, [v2 privacyBehavior]);
  }
  else
  {
    uint64_t v16 = (REElement *)v2;
  }

  return v16;
}

id REDateByRemovingSubseconds(void *a1)
{
  if (a1)
  {
    [a1 timeIntervalSinceReferenceDate];
    a1 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:floor(v2)];
    uint64_t v1 = vars8;
  }
  return a1;
}

uint64_t REDateOccursToday(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263EFF910];
  id v2 = a1;
  id v3 = [v1 date];
  id v4 = objc_alloc(MEMORY[0x263F08798]);
  uint64_t v5 = REStartOfDayForDate(v3);
  uint64_t v6 = REEndOfDayForDate(v3);
  uint64_t v7 = (void *)[v4 initWithStartDate:v5 endDate:v6];

  uint64_t v8 = [v7 containsDate:v2];
  return v8;
}

void sub_21E785D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCLKDateTextProviderClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCLKDateTextProviderClass_softClass;
  uint64_t v7 = getCLKDateTextProviderClass_softClass;
  if (!getCLKDateTextProviderClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCLKDateTextProviderClass_block_invoke;
    v3[3] = &unk_2644BC768;
    v3[4] = &v4;
    __getCLKDateTextProviderClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E786248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCLKRelativeDateTextProviderClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCLKRelativeDateTextProviderClass_softClass;
  uint64_t v7 = getCLKRelativeDateTextProviderClass_softClass;
  if (!getCLKRelativeDateTextProviderClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCLKRelativeDateTextProviderClass_block_invoke;
    v3[3] = &unk_2644BC768;
    v3[4] = &v4;
    __getCLKRelativeDateTextProviderClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E78632C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCLKSimpleTextProviderClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCLKSimpleTextProviderClass_softClass;
  uint64_t v7 = getCLKSimpleTextProviderClass_softClass;
  if (!getCLKSimpleTextProviderClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCLKSimpleTextProviderClass_block_invoke;
    v3[3] = &unk_2644BC768;
    v3[4] = &v4;
    __getCLKSimpleTextProviderClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E786410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCLKTimeIntervalTextProviderClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCLKTimeIntervalTextProviderClass_softClass;
  uint64_t v7 = getCLKTimeIntervalTextProviderClass_softClass;
  if (!getCLKTimeIntervalTextProviderClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCLKTimeIntervalTextProviderClass_block_invoke;
    v3[3] = &unk_2644BC768;
    v3[4] = &v4;
    __getCLKTimeIntervalTextProviderClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E7864F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCLKTimeTextProviderClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCLKTimeTextProviderClass_softClass;
  uint64_t v7 = getCLKTimeTextProviderClass_softClass;
  if (!getCLKTimeTextProviderClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCLKTimeTextProviderClass_block_invoke;
    v3[3] = &unk_2644BC768;
    v3[4] = &v4;
    __getCLKTimeTextProviderClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E7865D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCLKTextProviderClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CLKTextProvider");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCLKTextProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCLKTextProviderClass_block_invoke_cold_1();
    ClockKitLibrary();
  }
}

void ClockKitLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!ClockKitLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __ClockKitLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_2644BF4F0;
    uint64_t v3 = 0;
    ClockKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!ClockKitLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __ClockKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ClockKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCLKDateTextProviderClass_block_invoke(uint64_t a1)
{
  ClockKitLibrary();
  Class result = objc_getClass("CLKDateTextProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCLKDateTextProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getCLKDateTextProviderClass_block_invoke_cold_1();
    return (Class)__getCLKRelativeDateTextProviderClass_block_invoke(v3);
  }
  return result;
}

Class __getCLKRelativeDateTextProviderClass_block_invoke(uint64_t a1)
{
  ClockKitLibrary();
  Class result = objc_getClass("CLKRelativeDateTextProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCLKRelativeDateTextProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getCLKRelativeDateTextProviderClass_block_invoke_cold_1();
    return (Class)__getCLKSimpleTextProviderClass_block_invoke(v3);
  }
  return result;
}

Class __getCLKSimpleTextProviderClass_block_invoke(uint64_t a1)
{
  ClockKitLibrary();
  Class result = objc_getClass("CLKSimpleTextProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCLKSimpleTextProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getCLKSimpleTextProviderClass_block_invoke_cold_1();
    return (Class)__getCLKTimeIntervalTextProviderClass_block_invoke(v3);
  }
  return result;
}

Class __getCLKTimeIntervalTextProviderClass_block_invoke(uint64_t a1)
{
  ClockKitLibrary();
  Class result = objc_getClass("CLKTimeIntervalTextProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCLKTimeIntervalTextProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getCLKTimeIntervalTextProviderClass_block_invoke_cold_1();
    return (Class)__getCLKTimeTextProviderClass_block_invoke(v3);
  }
  return result;
}

Class __getCLKTimeTextProviderClass_block_invoke(uint64_t a1)
{
  ClockKitLibrary();
  Class result = objc_getClass("CLKTimeTextProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCLKTimeTextProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getCLKTimeTextProviderClass_block_invoke_cold_1();
    return (Class)OUTLINED_FUNCTION_0_3(v3);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return NSRequestConcreteImplementation();
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return objc_opt_class();
}

id REElementsLoggableString(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v1 = a1;
  long long v2 = [MEMORY[0x263EFF980] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "identifier", (void)v11);
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  float v9 = REElementsIdsLoggableString(v2);

  return v9;
}

id REElementsIdsLoggableString(void *a1)
{
  id v1 = a1;
  long long v2 = [MEMORY[0x263F089D8] string];
  [v2 appendString:@"["];
  if ([v1 count])
  {
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = [v1 objectAtIndex:v3];
      [v2 appendString:v4];

      if (++v3 < [v1 count]) {
        [v2 appendString:@", "];
      }
    }
    while (v3 < [v1 count]);
  }
  [v2 appendString:@"]"];

  return v2;
}

void sub_21E78B348(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21E78C934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __REGetDisplayDebugProbabilities_block_invoke()
{
  uint64_t result = _REGetIsInternalBuild();
  _isInternalDevice_6 = result;
  return result;
}

uint64_t __RE_Cached_Get__DisplayDebugProbabilities(void *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v1 = a1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ____RE_Cached_Get__DisplayDebugProbabilities_block_invoke;
  block[3] = &unk_2644BC660;
  id v2 = v1;
  id v19 = v2;
  if (__RE_Cached_Get__DisplayDebugProbabilities_onceToken != -1) {
    dispatch_once(&__RE_Cached_Get__DisplayDebugProbabilities_onceToken, block);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&__RE_Cached_lock__DisplayDebugProbabilities);
  if ((__RE_Cached_hasValue__DisplayDebugProbabilities & 1) == 0)
  {
    char v17 = 0;
    id v3 = v2;
    if (!v3) {
      goto LABEL_30;
    }
    if (RelevanceEngineLibraryCore_1()
      && ([soft__REEngineDefaults_0() defaultsForEngine:v3],
          (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v5 = v4;
      unsigned int v6 = [v4 _BOOLValueForKey:@"DisplayDebugProbabilities" set:&v17];
      if (v17) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
      uint64_t v8 = RELogForDomain(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        float v9 = [NSNumber numberWithBool:v7];
        *(_DWORD *)buf = 138412290;
        long long v21 = v9;
        _os_log_impl(&dword_21E6E6000, v8, OS_LOG_TYPE_DEFAULT, "Prefs reading value for key DisplayDebugProbabilities: %@", buf, 0xCu);
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
    if (!v17)
    {
LABEL_30:
      if (RelevanceEngineLibraryCore_1())
      {
        float v10 = [soft__REEngineDefaults_0() globalDefaults];
      }
      else
      {
        float v10 = 0;
      }
      unsigned int v11 = [v10 _BOOLValueForKey:@"DisplayDebugProbabilities" set:&v17];
      if (v17) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
      long long v13 = RELogForDomain(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        long long v14 = [NSNumber numberWithBool:v12];
        *(_DWORD *)buf = 138412290;
        long long v21 = v14;
        _os_log_impl(&dword_21E6E6000, v13, OS_LOG_TYPE_DEFAULT, "Prefs reading value for key DisplayDebugProbabilities: %@", buf, 0xCu);
      }
      if (v17) {
        LOBYTE(v7) = v12;
      }
      else {
        LOBYTE(v7) = 0;
      }
    }

    __RE_Cached__DisplayDebugProbabilities = v7;
    __RE_Cached_hasValue__DisplayDebugProbabilities = 1;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__RE_Cached_lock__DisplayDebugProbabilities);
  uint64_t v15 = __RE_Cached__DisplayDebugProbabilities;

  return v15;
}

void __RE_Cached_updateValue__DisplayDebugProbabilities()
{
  os_unfair_lock_lock((os_unfair_lock_t)&__RE_Cached_lock__DisplayDebugProbabilities);
  __RE_Cached_hasValue__DisplayDebugProbabilities = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&__RE_Cached_lock__DisplayDebugProbabilities);
  RERelevanceEngineDisplayDebugProbabilitiesDidUpdate();
}

uint64_t __RelevanceEngineLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  RelevanceEngineLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

id REParametersForIntent(void *a1)
{
  v27[16] = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    id v3 = [v1 _parameterCombinations];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      uint64_t v5 = [v2 _validParameterCombinations];
      unsigned int v6 = [v5 allKeys];

      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __REParameterComplexitiyComparator_block_invoke;
      v27[3] = &__block_descriptor_40_e11_q24__0_8_16l;
      v27[4] = 1;
      uint64_t v7 = (void *)MEMORY[0x223C31700](v27);
      uint64_t v8 = [v6 sortedArrayUsingComparator:v7];

      float v9 = [v8 firstObject];

      id v10 = v2;
      id v11 = v9;
      uint64_t v12 = v11;
      if (v11)
      {
        long long v13 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v14 = v12;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v24 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v23 + 1) + 8 * i);
              long long v20 = objc_msgSend(v10, "valueForKey:", v19, (void)v23);
              [v13 setObject:v20 forKeyedSubscript:v19];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
          }
          while (v16);
        }

        long long v21 = (void *)[v13 copy];
      }
      else
      {
        long long v21 = 0;
      }
    }
    else
    {
      long long v21 = (void *)MEMORY[0x263EFFA78];
    }
  }
  else
  {
    long long v21 = 0;
  }

  return v21;
}

id RESimplifiedParametersForIntent(void *a1)
{
  v49[16] = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = v1;
  if (!v1)
  {
    uint64_t v19 = 0;
    goto LABEL_34;
  }
  id v3 = [v1 _parameterCombinations];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    uint64_t v19 = (void *)MEMORY[0x263EFFA78];
    goto LABEL_34;
  }
  id v5 = v2;
  uint64_t v42 = 0;
  unint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  unint64_t v45 = __Block_byref_object_copy__22;
  double v46 = __Block_byref_object_dispose__22;
  id v47 = 0;
  unsigned int v6 = [v5 _parameterCombinations];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __REPrimaryParameterCombinationFromIntent_block_invoke;
  v41[3] = &unk_2644BF998;
  v41[4] = &v42;
  [v6 enumerateKeysAndObjectsUsingBlock:v41];
  if (v43[5])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = (void *)[(id)v43[5] mutableCopy];
      uint64_t v8 = NSStringFromSelector(sel_resumePlayback);
      [v7 removeObject:v8];

      uint64_t v9 = [v7 copy];
      id v10 = (void *)v43[5];
      v43[5] = v9;
    }
    id v11 = [MEMORY[0x263EFF980] array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v12 = objc_msgSend(v5, "_validParameterCombinations", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v49 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          if ([v16 isSubsetOfSet:v43[5]]) {
            [v11 addObject:v16];
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v49 count:16];
      }
      while (v13);
    }

    if ([v11 count])
    {
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __REParameterComplexitiyComparator_block_invoke;
      v48[3] = &__block_descriptor_40_e11_q24__0_8_16l;
      v48[4] = 1;
      uint64_t v17 = (void *)MEMORY[0x223C31700](v48);
      [v11 sortUsingComparator:v17];

      long long v18 = [v11 firstObject];
    }
    else
    {
      long long v18 = 0;
    }
  }
  else
  {
    long long v18 = 0;
  }

  _Block_object_dispose(&v42, 8);
  if (v18)
  {
    id v20 = v5;
    id v21 = v18;
LABEL_25:
    long long v29 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v21, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v30 = v21;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v37 objects:v49 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v38 != v32) {
            objc_enumerationMutation(v30);
          }
          uint64_t v34 = *(void *)(*((void *)&v37 + 1) + 8 * j);
          double v35 = [v5 valueForKey:v34];
          [v29 setObject:v35 forKeyedSubscript:v34];
        }
        uint64_t v31 = [v30 countByEnumeratingWithState:&v37 objects:v49 count:16];
      }
      while (v31);
    }

    uint64_t v19 = (void *)[v29 copy];
    goto LABEL_33;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  long long v23 = [v5 _validParameterCombinations];
  long long v24 = [v23 allKeys];

  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __REParameterComplexitiyComparator_block_invoke;
  v49[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v49[4] = (isKindOfClass & 1) == 0;
  long long v25 = (void *)MEMORY[0x223C31700](v49);
  long long v26 = [v24 sortedArrayUsingComparator:v25];

  long long v27 = [v26 firstObject];

  id v28 = v5;
  id v21 = v27;
  if (v21) {
    goto LABEL_25;
  }
  uint64_t v19 = 0;
LABEL_33:

LABEL_34:
  return v19;
}

void sub_21E78F30C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id REIntentBySimplifyingParametersForIntent(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    id v3 = RESimplifiedParametersForIntent(v1);
    if (v3)
    {
      uint64_t v4 = [v2 _keyImage];
      id v5 = [v2 _emptyCopy];

      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __REIntentBySimplifyingParametersForIntent_block_invoke;
      v8[3] = &unk_2644BC4E8;
      id v2 = v5;
      id v9 = v2;
      [v3 enumerateKeysAndObjectsUsingBlock:v8];
      if (v4)
      {
        unsigned int v6 = [v2 _keyImage];

        if (!v6) {
          [v2 _setDefaultImage:v4];
        }
      }
    }
    id v2 = v2;
  }
  return v2;
}

uint64_t __REIntentBySimplifyingParametersForIntent_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forKey:a2];
}

id RERelevanceProviderForRelevanceProviders(void *a1, void *a2)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v52 = a2;
  if ([v3 count])
  {
    id v53 = [MEMORY[0x263EFF980] array];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v51 = v3;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v54 objects:v60 count:16];
    if (!v5) {
      goto LABEL_61;
    }
    uint64_t v6 = v5;
    char v7 = 0;
    char v8 = 0;
    uint64_t v9 = *(void *)v55;
    while (1)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v55 != v9) {
          objc_enumerationMutation(v4);
        }
        id v11 = *(void **)(*((void *)&v54 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v8)
          {
            char v8 = 1;
            goto LABEL_35;
          }
          uint64_t v12 = [v11 startDate];
          uint64_t v13 = [v11 endDate];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = REEndOfDayForDate(v13);
            uint64_t v16 = [v14 earlierDate:v15];

            [(REDateRelevanceProvider *)v16 timeIntervalSinceDate:v12];
            if (v17 >= 0.0) {
              double v18 = v17;
            }
            else {
              double v18 = 0.0;
            }
            uint64_t v19 = [REDateRelevanceProvider alloc];
            id v20 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v12 duration:v18];
            if (v18 <= 900.0)
            {
              long long v26 = [(REDateRelevanceProvider *)v19 initWithEventInterval:v20];
              [v53 addObject:v26];
            }
            else
            {
              id v21 = [(REDailyRoutineRelevanceProvider *)v12 dateByAddingTimeInterval:900.0];
              uint64_t v22 = [(REDateRelevanceProvider *)v19 initWithEventInterval:v20 becomesIrrelevantDate:v21];
              [v53 addObject:v22];
            }
          }
          else
          {
            uint64_t v16 = [[REDateRelevanceProvider alloc] initWithEventDate:v12];
            [v53 addObject:v16];
          }

          char v8 = 1;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v7)
            {
              char v7 = 1;
              goto LABEL_35;
            }
            uint64_t v12 = [v11 region];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && (([(REDailyRoutineRelevanceProvider *)v12 notifyOnExit] & 1) != 0
               || [(REDailyRoutineRelevanceProvider *)v12 notifyOnEntry])
              && ([(REDailyRoutineRelevanceProvider *)v12 radius], v25 >= 0.0))
            {
              if (v25 > 10000.0)
              {
                id v27 = objc_alloc(MEMORY[0x263F00A28]);
                [(REDailyRoutineRelevanceProvider *)v12 center];
                double v29 = v28;
                double v31 = v30;
                uint64_t v32 = [(REDailyRoutineRelevanceProvider *)v12 identifier];
                __int16 v33 = (REDailyRoutineRelevanceProvider *)objc_msgSend(v27, "initWithCenter:radius:identifier:", v32, v29, v31, 10000.0);

                [(REDailyRoutineRelevanceProvider *)v33 setGeoReferenceFrame:[(REDailyRoutineRelevanceProvider *)v33 geoReferenceFrame]];
                uint64_t v12 = v33;
              }
              if ([(REDailyRoutineRelevanceProvider *)v12 notifyOnEntry]
                && [(REDailyRoutineRelevanceProvider *)v12 notifyOnExit])
              {
                id v34 = objc_alloc(MEMORY[0x263F00A50]);
                [(REDailyRoutineRelevanceProvider *)v12 center];
                double v36 = v35;
                double v38 = v37;
                long long v39 = [MEMORY[0x263EFF910] date];
                long long v40 = (REGeofenceRelevanceProvider *)objc_msgSend(v34, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:referenceFrame:", v39, -[REDailyRoutineRelevanceProvider geoReferenceFrame](v12, "geoReferenceFrame"), v36, v38, 0.0, 0.0, -1.0);

                double v41 = [RELocationRelevanceProvider alloc];
                [(REDailyRoutineRelevanceProvider *)v12 radius];
                uint64_t v42 = -[RELocationRelevanceProvider initWithLocation:radius:](v41, "initWithLocation:radius:", v40);
                unint64_t v43 = [(RELocationRelevanceProvider *)v42 providerWithBundleIdentifier:v52];

                [v53 addObject:v43];
              }
              else
              {
                long long v40 = [[REGeofenceRelevanceProvider alloc] initWithRegion:v12 bundleIdentifier:v52];
                [v53 addObject:v40];
              }

              char v7 = 1;
            }
            else
            {
              char v7 = 0;
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v23 = [v11 situation];
              uint64_t v24 = 4;
              switch(v23)
              {
                case 0:
                case 1:
                  uint64_t v12 = [[REDailyRoutineRelevanceProvider alloc] initWithDailyRoutineType:v23];
                  if (v8) {
                    goto LABEL_58;
                  }
                  [v53 addObject:v12];
                  char v8 = 1;
                  break;
                case 2:
                  uint64_t v24 = 1;
                  goto LABEL_50;
                case 3:
                  uint64_t v24 = 2;
                  goto LABEL_50;
                case 4:
                  uint64_t v24 = 3;
                  goto LABEL_50;
                case 5:
LABEL_50:
                  uint64_t v44 = [[RELocationRelevanceProvider alloc] initWithLocationType:v24];
                  uint64_t v12 = (REDailyRoutineRelevanceProvider *)v44;
                  if (v7) {
                    goto LABEL_58;
                  }
                  uint64_t v45 = [(RELocationRelevanceProvider *)v44 providerWithBundleIdentifier:v52];

                  [v53 addObject:v45];
                  char v7 = 1;
                  uint64_t v12 = (REDailyRoutineRelevanceProvider *)v45;
                  break;
                case 6:
                  double v46 = [REBluetoothDeviceRelevanceProvider alloc];
                  uint64_t v47 = 0;
                  goto LABEL_54;
                case 7:
                  double v46 = [REBluetoothDeviceRelevanceProvider alloc];
                  uint64_t v47 = 1;
LABEL_54:
                  v48 = [(REBluetoothDeviceRelevanceProvider *)v46 initWithConnectionToCar:1 connectionToSpeaker:v47];
                  goto LABEL_57;
                case 8:
                  v48 = [[REWorkoutRelevanceProvider alloc] initWithState:1];
                  goto LABEL_57;
                case 9:
                  v48 = [[REActivityRelevanceProvider alloc] initWithActiveEnergyState:0 exerciseTimeState:0 standHourState:0];
LABEL_57:
                  uint64_t v12 = (REDailyRoutineRelevanceProvider *)v48;
LABEL_58:
                  if (!v12) {
                    goto LABEL_35;
                  }
                  [v53 addObject:v12];
                  break;
                default:
                  RELogForDomain(0);
                  uint64_t v12 = (REDailyRoutineRelevanceProvider *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(&v12->super.super, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 134217984;
                    uint64_t v59 = v23;
                    _os_log_impl(&dword_21E6E6000, &v12->super.super, OS_LOG_TYPE_DEFAULT, "Unknown INDailyRoutineSituation: %ld", buf, 0xCu);
                  }
                  break;
              }
            }
            else
            {
              RELogForDomain(0);
              uint64_t v12 = (REDailyRoutineRelevanceProvider *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(&v12->super.super, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v59 = (uint64_t)v11;
                _os_log_impl(&dword_21E6E6000, &v12->super.super, OS_LOG_TYPE_DEFAULT, "Unknown relevance provider type: %@", buf, 0xCu);
              }
            }
          }
        }

LABEL_35:
        ++v10;
      }
      while (v6 != v10);
      uint64_t v49 = [v4 countByEnumeratingWithState:&v54 objects:v60 count:16];
      uint64_t v6 = v49;
      if (!v49)
      {
LABEL_61:

        id v3 = v51;
        goto LABEL_63;
      }
    }
  }
  id v53 = (id)MEMORY[0x263EFFA68];
LABEL_63:

  return v53;
}

id __REParameterComplexitiyComparator_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10 == 1)
  {
    id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    uint64_t v12 = NSNumber;
    uint64_t v13 = v7;
    goto LABEL_5;
  }
  if (!v10)
  {
    id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    uint64_t v12 = NSNumber;
    uint64_t v13 = v9;
LABEL_5:
    uint64_t v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
    id v6 = (id)[v11 compare:v14];
  }
  return v6;
}

void __REPrimaryParameterCombinationFromIntent_block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 isPrimary])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

void _HTTPConnectionInvalidated(void *a1)
{
  id v1 = [a1 weakObjectValue];
  [v1 invalidated];
}

void _HTTPConnectionRecievedError(void *a1, uint64_t a2)
{
  id v3 = [a1 weakObjectValue];
  [v3 didRecieveError:a2];
}

void _HTTPConnectionDidReceiveRequest(void *a1, uint64_t a2)
{
  id v3 = [a1 weakObjectValue];
  [v3 didRecieveRequest:a2];
}

void _HTTPConnectionDidSendResponse(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = [a1 weakObjectValue];
  [v4 didCompleteResponse:a3 error:0];
}

void _HTTPConnectionFailedToSendResponse(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = [a1 weakObjectValue];
  id v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFF488] code:100 userInfo:0];
  [v5 didCompleteResponse:a3 error:v4];
}

void sub_21E7906F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E790B1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E790FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E7911E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E7913F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21E791680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21E7918C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21E791B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21E791E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21E79211C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_5(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t REHashDataUInt8(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v2 = 0;
  if (a2)
  {
    uint64_t v3 = 8 * a2 - 8;
    do
    {
      v2 ^= HashingValuesTable[*(unsigned __int8 *)(a1 - 1 + a2)] >> (v3 & 0x38);
      v3 -= 8;
      --a2;
    }
    while (a2);
  }
  return v2;
}

uint64_t REHashDataUInt16(uint64_t a1, uint64_t a2)
{
  unsigned __int16 v2 = 0;
  if (a2)
  {
    uint64_t v3 = 16 * a2 - 16;
    do
    {
      v2 ^= HashingValuesTable[*(unsigned __int8 *)(a1 - 1 + a2)] >> (v3 & 0x30);
      v3 -= 16;
      --a2;
    }
    while (a2);
  }
  return v2;
}

uint64_t REHashDataUInt32(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v2 = result;
  LODWORD(result) = 0;
  uint64_t v3 = 32 * a2 - 32;
  uint64_t v4 = v2 - 1;
  do
  {
    uint64_t result = result ^ (HashingValuesTable[*(unsigned __int8 *)(v4 + a2)] >> (v3 & 0x20));
    v3 -= 32;
    --a2;
  }
  while (a2);
  return result;
}

uint64_t REHashDataUInt64(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = a1 - 1;
  do
    result ^= HashingValuesTable[*(unsigned __int8 *)(v4 + a2--)];
  while (a2);
  return result;
}

uint64_t REHashData(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = a1 - 1;
  do
    result ^= HashingValuesTable[*(unsigned __int8 *)(v4 + a2--)];
  while (a2);
  return result;
}

uint64_t REHashString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 UTF8String];
  uint64_t v3 = [v1 length];
  uint64_t v4 = 0;
  if (v3)
  {
    uint64_t v5 = 32 * v3 - 32;
    do
    {
      uint64_t v4 = v4 ^ (HashingValuesTable[*(unsigned __int8 *)(v2 - 1 + v3)] >> (v5 & 0x20));
      v5 -= 32;
      --v3;
    }
    while (v3);
  }

  return v4;
}

void sub_21E792CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a42, 8);
  _Block_object_dispose((const void *)(v42 - 232), 8);
  _Unwind_Resume(a1);
}

void sub_21E792FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21E793210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E793338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E793458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E793578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E793698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E793F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

BOOL REConfigureTrainingSimulationExportedObjectClass(objc_class *a1)
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v2, sel__re_swizzled_relevanceEngine_createElementFromDescription_completion_);
  Implementation = method_getImplementation(InstanceMethod);
  IMP MethodImplementation = class_getMethodImplementation(a1, sel_relevanceEngine_createElementFromDescription_completion_);
  TypeEncoding = method_getTypeEncoding(InstanceMethod);
  if (MethodImplementation) {
    class_replaceMethod(a1, sel_relevanceEngine_createElementFromDescription_completion_, Implementation, TypeEncoding);
  }
  else {
    class_addMethod(a1, sel_relevanceEngine_createElementFromDescription_completion_, Implementation, TypeEncoding);
  }
  id v7 = (objc_class *)objc_opt_class();
  id v8 = class_getInstanceMethod(v7, sel__re_swizzled_relevanceEngine_performCommand_withOptions_completion_);
  uint64_t v9 = method_getImplementation(v8);
  IMP v10 = class_getMethodImplementation(a1, sel_relevanceEngine_performCommand_withOptions_completion_);
  uint64_t v11 = method_getTypeEncoding(v8);
  if (v10) {
    class_replaceMethod(a1, sel_relevanceEngine_performCommand_withOptions_completion_, v9, v11);
  }
  else {
    class_addMethod(a1, sel_relevanceEngine_performCommand_withOptions_completion_, v9, v11);
  }
  uint64_t v12 = (objc_class *)objc_opt_class();
  uint64_t v13 = class_getInstanceMethod(v12, sel__re_swizzled_availableRelevanceEngines_);
  uint64_t v14 = method_getImplementation(v13);
  IMP v15 = class_getMethodImplementation(a1, sel_availableRelevanceEngines_);
  uint64_t v16 = method_getTypeEncoding(v13);
  if (v15) {
    class_replaceMethod(a1, sel_availableRelevanceEngines_, v14, v16);
  }
  else {
    class_addMethod(a1, sel_availableRelevanceEngines_, v14, v16);
  }
  double v17 = (objc_class *)objc_opt_class();
  double v18 = class_getInstanceMethod(v17, sel__re_swizzled_fetchAllElementIdentifiersInRelevanceEngine_completion_);
  uint64_t v19 = method_getImplementation(v18);
  IMP v20 = class_getMethodImplementation(a1, sel_fetchAllElementIdentifiersInRelevanceEngine_completion_);
  id v21 = method_getTypeEncoding(v18);
  if (v20) {
    class_replaceMethod(a1, sel_fetchAllElementIdentifiersInRelevanceEngine_completion_, v19, v21);
  }
  else {
    class_addMethod(a1, sel_fetchAllElementIdentifiersInRelevanceEngine_completion_, v19, v21);
  }
  uint64_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = class_getInstanceMethod(v22, sel__re_swizzled_fetchAllElementsInRelevanceEngine_completion_);
  uint64_t v24 = method_getImplementation(v23);
  IMP v25 = class_getMethodImplementation(a1, sel_fetchAllElementsInRelevanceEngine_completion_);
  long long v26 = method_getTypeEncoding(v23);
  if (v25) {
    class_replaceMethod(a1, sel_fetchAllElementsInRelevanceEngine_completion_, v24, v26);
  }
  else {
    class_addMethod(a1, sel_fetchAllElementsInRelevanceEngine_completion_, v24, v26);
  }
  id v27 = (objc_class *)objc_opt_class();
  double v28 = class_getInstanceMethod(v27, sel__re_swizzled_gatherDiagnosticLogsForRelevanceEngine_completion_);
  double v29 = method_getImplementation(v28);
  IMP v30 = class_getMethodImplementation(a1, sel_gatherDiagnosticLogsForRelevanceEngine_completion_);
  double v31 = method_getTypeEncoding(v28);
  if (v30) {
    class_replaceMethod(a1, sel_gatherDiagnosticLogsForRelevanceEngine_completion_, v29, v31);
  }
  else {
    class_addMethod(a1, sel_gatherDiagnosticLogsForRelevanceEngine_completion_, v29, v31);
  }
  uint64_t v32 = (objc_class *)objc_opt_class();
  __int16 v33 = class_getInstanceMethod(v32, sel__re_swizzled_relevanceEngine_runActionOfElementWithDescription1_completion_);
  id v34 = method_getImplementation(v33);
  IMP v35 = class_getMethodImplementation(a1, sel_relevanceEngine_runActionOfElementWithDescription1_completion_);
  double v36 = method_getTypeEncoding(v33);
  if (v35) {
    class_replaceMethod(a1, sel_relevanceEngine_runActionOfElementWithDescription1_completion_, v34, v36);
  }
  else {
    class_addMethod(a1, sel_relevanceEngine_runActionOfElementWithDescription1_completion_, v34, v36);
  }
  double v37 = (objc_class *)objc_opt_class();
  double v38 = class_getInstanceMethod(v37, sel__re_swizzled_relevanceEngine_encodedObjectAtPath_completion_);
  long long v39 = method_getImplementation(v38);
  IMP v40 = class_getMethodImplementation(a1, sel_relevanceEngine_encodedObjectAtPath_completion_);
  double v41 = method_getTypeEncoding(v38);
  if (v40) {
    class_replaceMethod(a1, sel_relevanceEngine_encodedObjectAtPath_completion_, v39, v41);
  }
  else {
    class_addMethod(a1, sel_relevanceEngine_encodedObjectAtPath_completion_, v39, v41);
  }
  uint64_t v42 = (objc_class *)objc_opt_class();
  unint64_t v43 = class_getInstanceMethod(v42, sel__re_runAfterEngineIsLoaded_);
  uint64_t v44 = method_getImplementation(v43);
  uint64_t v45 = method_getTypeEncoding(v43);
  return class_addMethod(a1, sel__re_runAfterEngineIsLoaded_, v44, v45);
}

void REExportRelevanceEngineService(void *a1)
{
  id v3 = a1;
  if (v3)
  {
    if (REExportRelevanceEngineService_onceToken != -1) {
      dispatch_once(&REExportRelevanceEngineService_onceToken, &__block_literal_global_44);
    }
    os_unfair_lock_lock((os_unfair_lock_t)&REExportRelevanceEngineService_SimulationProxiesLock);
    id v1 = [(id)SimulationProxies objectForKeyedSubscript:v3];

    if (!v1)
    {
      uint64_t v2 = [[_RETrainingProxy alloc] initWithServiceName:v3];
      [(id)SimulationProxies setObject:v2 forKeyedSubscript:v3];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&REExportRelevanceEngineService_SimulationProxiesLock);
  }
}

uint64_t __REExportRelevanceEngineService_block_invoke()
{
  REExportRelevanceEngineService_SimulationProxiesLock = 0;
  uint64_t v0 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v1 = SimulationProxies;
  SimulationProxies = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_21E79CEDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __REScriptProcessorCache_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v1 = REScriptProcessorCache_Cache;
  REScriptProcessorCache_Cache = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t RERemoteTrainingMachServiceForProcessName(__CFString *a1)
{
  uint64_t v1 = &stru_26CFA57D0;
  if (a1) {
    uint64_t v1 = a1;
  }
  return [NSString stringWithFormat:@"com.apple.%@.RelevanceEngine.RemoteTraining", v1];
}

id RERemoteTrainingServerInterface()
{
  if (RERemoteTrainingServerInterface_onceToken != -1) {
    dispatch_once(&RERemoteTrainingServerInterface_onceToken, &__block_literal_global_60);
  }
  uint64_t v0 = (void *)RERemoteTrainingServerInterface_ServerInterface;
  return v0;
}

void __RERemoteTrainingServerInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CFD70C8];
  uint64_t v1 = (void *)RERemoteTrainingServerInterface_ServerInterface;
  RERemoteTrainingServerInterface_ServerInterface = v0;

  uint64_t v2 = (void *)RERemoteTrainingServerInterface_ServerInterface;
  id v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_performTrainingWithElements_events_interactions_completion_ argumentIndex:0 ofReply:0];

  id v6 = (void *)RERemoteTrainingServerInterface_ServerInterface;
  id v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v6 setClasses:v9 forSelector:sel_performTrainingWithElements_events_interactions_completion_ argumentIndex:1 ofReply:0];

  IMP v10 = (void *)RERemoteTrainingServerInterface_ServerInterface;
  uint64_t v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  [v10 setClasses:v13 forSelector:sel_performTrainingWithElements_events_interactions_completion_ argumentIndex:2 ofReply:0];

  uint64_t v14 = (void *)RERemoteTrainingServerInterface_ServerInterface;
  IMP v15 = (void *)MEMORY[0x263EFFA08];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, v17, v18, objc_opt_class(), 0);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  [v14 setClasses:v19 forSelector:sel_updateRemoteAttribute_forKey_completion_ argumentIndex:0 ofReply:0];
}

id RERemoteTrainingClientInterface()
{
  if (RERemoteTrainingClientInterface_onceToken != -1) {
    dispatch_once(&RERemoteTrainingClientInterface_onceToken, &__block_literal_global_60_1);
  }
  uint64_t v0 = (void *)RERemoteTrainingClientInterface_ClientInterface;
  return v0;
}

uint64_t __RERemoteTrainingClientInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CFF2EA8];
  uint64_t v1 = RERemoteTrainingClientInterface_ClientInterface;
  RERemoteTrainingClientInterface_ClientInterface = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_21E79D9B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E79E084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E79E350(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

id getBluetoothManagerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getBluetoothManagerClass_softClass;
  uint64_t v7 = getBluetoothManagerClass_softClass;
  if (!getBluetoothManagerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getBluetoothManagerClass_block_invoke;
    v3[3] = &unk_2644BC768;
    v3[4] = &v4;
    __getBluetoothManagerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E79E730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t BluetoothManagerLibraryCore()
{
  if (!BluetoothManagerLibraryCore_frameworkLibrary) {
    BluetoothManagerLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return BluetoothManagerLibraryCore_frameworkLibrary;
}

uint64_t __BluetoothManagerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BluetoothManagerLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getBluetoothManagerClass_block_invoke(uint64_t a1)
{
  BluetoothManagerLibrary();
  Class result = objc_getClass("BluetoothManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getBluetoothManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getBluetoothManagerClass_block_invoke_cold_1();
    return (Class)BluetoothManagerLibrary();
  }
  return result;
}

uint64_t BluetoothManagerLibrary()
{
  uint64_t v0 = BluetoothManagerLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *__getBluetoothAvailabilityChangedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)BluetoothManagerLibrary();
  Class result = dlsym(v2, "BluetoothAvailabilityChangedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBluetoothAvailabilityChangedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getBluetoothPowerChangedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)BluetoothManagerLibrary();
  Class result = dlsym(v2, "BluetoothPowerChangedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBluetoothPowerChangedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getBluetoothDeviceRemovedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)BluetoothManagerLibrary();
  Class result = dlsym(v2, "BluetoothDeviceRemovedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBluetoothDeviceRemovedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getBluetoothDeviceUnpairedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)BluetoothManagerLibrary();
  Class result = dlsym(v2, "BluetoothDeviceUnpairedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBluetoothDeviceUnpairedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getBluetoothDeviceConnectSuccessNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)BluetoothManagerLibrary();
  Class result = dlsym(v2, "BluetoothDeviceConnectSuccessNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBluetoothDeviceConnectSuccessNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getBluetoothDeviceConnectFailedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)BluetoothManagerLibrary();
  Class result = dlsym(v2, "BluetoothDeviceConnectFailedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBluetoothDeviceConnectFailedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getBluetoothDeviceDisconnectSuccessNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)BluetoothManagerLibrary();
  Class result = dlsym(v2, "BluetoothDeviceDisconnectSuccessNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBluetoothDeviceDisconnectSuccessNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

void *__getBluetoothDeviceDisconnectFailedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)BluetoothManagerLibrary();
  Class result = dlsym(v2, "BluetoothDeviceDisconnectFailedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBluetoothDeviceDisconnectFailedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

void *__getBluetoothConnectionStatusChangedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)BluetoothManagerLibrary();
  Class result = dlsym(v2, "BluetoothConnectionStatusChangedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBluetoothConnectionStatusChangedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

void *__getBluetoothPairedStatusChangedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)BluetoothManagerLibrary();
  Class result = dlsym(v2, "BluetoothPairedStatusChangedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBluetoothPairedStatusChangedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id RECreateErrorWithCode(uint64_t a1)
{
  return RECreateErrorWithCodeMessageAndUseInfo(a1, 0, 0);
}

id RECreateErrorWithCodeMessageAndUseInfo(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (REInitializeDefaultErrorCodeMessages_onceToken != -1) {
    dispatch_once(&REInitializeDefaultErrorCodeMessages_onceToken, &__block_literal_global_63);
  }
  if (!v6) {
    id v6 = (id)MEMORY[0x263EFFA78];
  }
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = (void *)REDefaultErrorCodeMessages;
    uint64_t v9 = [NSNumber numberWithInteger:a1];
    id v7 = [v8 objectForKeyedSubscript:v9];

    if (!v7) {
      goto LABEL_10;
    }
  }
  uint64_t v10 = *MEMORY[0x263F08320];
  uint64_t v11 = [v6 objectForKeyedSubscript:*MEMORY[0x263F08320]];

  if (!v11)
  {
    uint64_t v12 = (void *)[v6 mutableCopy];
    [v12 setObject:v7 forKeyedSubscript:v10];
    uint64_t v13 = [v12 copy];

    id v6 = (id)v13;
  }
LABEL_10:
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.RelevanceEngine.error" code:a1 userInfo:v6];

  return v14;
}

id RECreateErrorWithCodeAndMessage(uint64_t a1, void *a2)
{
  return RECreateErrorWithCodeMessageAndUseInfo(a1, a2, 0);
}

id RECreateErrorWithCodeAndUseInfo(uint64_t a1, void *a2)
{
  return RECreateErrorWithCodeMessageAndUseInfo(a1, 0, a2);
}

void __REInitializeDefaultErrorCodeMessages_block_invoke()
{
  v3[18] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26CFCD3C8;
  v2[1] = &unk_26CFCD3E0;
  v3[0] = @"No Relevance engine with provided name";
  v3[1] = @"Unable to create element from description";
  v2[2] = &unk_26CFCD3F8;
  v2[3] = &unk_26CFCD410;
  v3[2] = @"Unable to perform command";
  v3[3] = @"Unable to find current training context";
  v2[4] = &unk_26CFCD428;
  v2[5] = &unk_26CFCD440;
  v3[4] = @"Unable to run action";
  void v3[5] = @"Unable to find element";
  v2[6] = &unk_26CFCD458;
  v2[7] = &unk_26CFCD470;
  void v3[6] = @"Multiline comment is missing closing \"*/\"";
  v3[7] = @"String is missing closing quotation mark";
  v2[8] = &unk_26CFCD488;
  v2[9] = &unk_26CFCD4A0;
  v3[8] = @"Invalid operator";
  v3[9] = @"Invalid token";
  v2[10] = &unk_26CFCD4B8;
  v2[11] = &unk_26CFCD4D0;
  v3[10] = @"Unexpected token";
  v3[11] = @"Token missing. EOF.";
  v2[12] = &unk_26CFCD4E8;
  v2[13] = &unk_26CFCD500;
  v3[12] = @"Symbol already defined.";
  v3[13] = @"Symbol not defined.";
  v2[14] = &unk_26CFCD518;
  v2[15] = &unk_26CFCD530;
  v3[14] = @"Symbol already has value.";
  v3[15] = @"Unepxcted expression.";
  v2[16] = &unk_26CFCD548;
  v2[17] = &unk_26CFCD560;
  v3[16] = @"Undefined value.";
  v3[17] = @"Argument to function is unexpected";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:18];
  id v1 = (void *)REDefaultErrorCodeMessages;
  REDefaultErrorCodeMessages = v0;
}

void REEnsureCondition(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (!a1) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Condition must be non-nil", a3, a4, a5, a6, a7, a8, a9);
  }
}

__CFString *REStringFromRankingOrder(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 2) {
    return 0;
  }
  else {
    return off_2644BFDC0[a1 + 1];
  }
}

void sub_21E7A0448(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21E7A0684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void REHTMLElementAccessLock(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    os_unfair_lock_lock((os_unfair_lock_t)&REHTMLElementLock);
    v1[2](v1);

    os_unfair_lock_unlock((os_unfair_lock_t)&REHTMLElementLock);
  }
}

void sub_21E7A2988(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21E7A35BC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21E7A38D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_DKEventQueryClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)get_DKEventQueryClass_softClass;
  uint64_t v7 = get_DKEventQueryClass_softClass;
  if (!get_DKEventQueryClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __get_DKEventQueryClass_block_invoke;
    v3[3] = &unk_2644BC768;
    v3[4] = &v4;
    __get_DKEventQueryClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E7A39C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_DKQueryClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)get_DKQueryClass_softClass;
  uint64_t v7 = get_DKQueryClass_softClass;
  if (!get_DKQueryClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __get_DKQueryClass_block_invoke;
    v3[3] = &unk_2644BC768;
    v3[4] = &v4;
    __get_DKQueryClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E7A3AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_DKPredictionQueryClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)get_DKPredictionQueryClass_softClass;
  uint64_t v7 = get_DKPredictionQueryClass_softClass;
  if (!get_DKPredictionQueryClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __get_DKPredictionQueryClass_block_invoke;
    v3[3] = &unk_2644BC768;
    v3[4] = &v4;
    __get_DKPredictionQueryClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E7A3B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_DKSystemEventStreamsClass_0()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)get_DKSystemEventStreamsClass_softClass_0;
  uint64_t v7 = get_DKSystemEventStreamsClass_softClass_0;
  if (!get_DKSystemEventStreamsClass_softClass_0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __get_DKSystemEventStreamsClass_block_invoke_0;
    v3[3] = &unk_2644BC768;
    v3[4] = &v4;
    __get_DKSystemEventStreamsClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E7A3C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E7A3DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E7A40EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_21E7A44B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E7A4E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_DKTombstoneMetadataKeyClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)get_DKTombstoneMetadataKeyClass_softClass;
  uint64_t v7 = get_DKTombstoneMetadataKeyClass_softClass;
  if (!get_DKTombstoneMetadataKeyClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __get_DKTombstoneMetadataKeyClass_block_invoke;
    v3[3] = &unk_2644BC768;
    v3[4] = &v4;
    __get_DKTombstoneMetadataKeyClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E7A5864(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E7A5D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CoreDuetLibraryCore_0()
{
  if (!CoreDuetLibraryCore_frameworkLibrary_0) {
    CoreDuetLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  return CoreDuetLibraryCore_frameworkLibrary_0;
}

uint64_t __CoreDuetLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  CoreDuetLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void CoreDuetLibrary_0()
{
  if (!CoreDuetLibraryCore_0())
  {
    uint64_t v0 = (void *)abort_report_np();
    free(v0);
  }
}

BOOL RERelevanceEqualToRelevance(float a1, float a2)
{
  return vabds_f32(a1, a2) < 0.00000011921;
}

id RETrainingSimulationServerInterface()
{
  if (RETrainingSimulationServerInterface_onceToken != -1) {
    dispatch_once(&RETrainingSimulationServerInterface_onceToken, &__block_literal_global_66);
  }
  uint64_t v0 = (void *)RETrainingSimulationServerInterface_ServerInterface;
  return v0;
}

uint64_t __RETrainingSimulationServerInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CFD2330];
  id v1 = (void *)RETrainingSimulationServerInterface_ServerInterface;
  RETrainingSimulationServerInterface_ServerInterface = v0;

  uint64_t v2 = RETrainingSimulationServerInterface_ServerInterface;
  return REConfigureTrainingSimulationServerXPCInterface(v2);
}

id RETrainingSimulationClientInterface()
{
  if (RETrainingSimulationClientInterface_onceToken != -1) {
    dispatch_once(&RETrainingSimulationClientInterface_onceToken, &__block_literal_global_66);
  }
  uint64_t v0 = (void *)RETrainingSimulationClientInterface_ClientInterface;
  return v0;
}

uint64_t __RETrainingSimulationClientInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CFE2440];
  uint64_t v1 = RETrainingSimulationClientInterface_ClientInterface;
  RETrainingSimulationClientInterface_ClientInterface = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

float REDeviceScreenScale()
{
  if (REDeviceScreenScale_onceToken != -1) {
    dispatch_once(&REDeviceScreenScale_onceToken, &__block_literal_global_67);
  }
  return *(float *)&REDeviceScreenScale_ScreenScale;
}

void __REDeviceScreenScale_block_invoke()
{
  id v1 = (id)MGCopyAnswer();
  [v1 floatValue];
  REDeviceScreenScale_ScreenScale = v0;
}

uint64_t REDonatedActionFilteredCacheReset(uint64_t a1, void *a2)
{
  return [a2 reset];
}

void sub_21E7AA368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void REContentFeatureExtractor::REContentFeatureExtractor(REContentFeatureExtractor *this)
{
}

void sub_21E7AB2F4(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table(v2);
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void REContentFeatureExtractor::~REContentFeatureExtractor(REContentFeatureExtractor *this)
{
}

uint64_t REContentFeatureExtractor::pushToTFIDF(uint64_t a1, long long **a2, int a3)
{
  uint64_t v3 = 264;
  if (a3) {
    uint64_t v3 = 200;
  }
  return REFancyShrinkingDictionary::pushToIDF(a1 + v3, a2);
}

uint64_t REContentFeatureExtractor::train(pthread_rwlock_t *a1, long long **a2, int a3)
{
  pthread_rwlock_wrlock(a1);
  uint64_t v6 = 264;
  if (a3) {
    uint64_t v6 = 200;
  }
  REFancyShrinkingDictionary::pushToIDF((uint64_t)a1 + v6, a2);
  pthread_rwlock_unlock(a1);
  return 1;
}

void sub_21E7AB3D4(_Unwind_Exception *a1)
{
  pthread_rwlock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t REContentFeatureExtractor::predict@<X0>(uint64_t a1@<X0>, unsigned __int8 **a2@<X1>, uint64_t a3@<X8>)
{
  pthread_rwlock_rdlock((pthread_rwlock_t *)a1);
  *(unsigned char *)a3 = 0;
  *(void *)(a3 + 32) = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(_DWORD *)(a3 + 24) = 0;
  *(void *)(a3 + 4pthread_rwlock_init(&this->m_rwlock, 0) = 0;
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  if (*a2 == v7)
  {
    double v9 = 0.0;
    double v12 = 0.0;
    double v11 = 0.0;
    uint64_t v18 = *a2;
    double v10 = 0.0;
  }
  else
  {
    int v8 = 0;
    double v9 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
    double v12 = 0.0;
    do
    {
      TokenCount = REFancyShrinkingDictionary::getTokenCount((void *)(a1 + 200), v6);
      uint64_t v14 = REFancyShrinkingDictionary::getTokenCount((void *)(a1 + 264), v6);
      double v15 = (double)(unint64_t)TokenCount + (double)(unint64_t)v14;
      double v16 = (double)(unint64_t)TokenCount / v15;
      double v17 = (double)(unint64_t)v14 / v15;
      if (!((unint64_t)TokenCount | (unint64_t)v14))
      {
        double v16 = 0.0;
        double v17 = 0.0;
      }
      double v10 = v16 + v10;
      double v11 = v17 + v11;
      *(double *)(a3 + 8) = v11;
      *(double *)(a3 + 16) = v10;
      if ((unint64_t)TokenCount | (unint64_t)v14)
      {
        if (TokenCount)
        {
          double v12 = v12 + 1.0;
          *(double *)(a3 + 32) = v12;
        }
        if (v14)
        {
          double v9 = v9 + 1.0;
          *(double *)(a3 + 4pthread_rwlock_init(&this->m_rwlock, 0) = v9;
        }
      }
      else
      {
        *(_DWORD *)(a3 + 24) = ++v8;
      }
      v6 += 24;
    }
    while (v6 != v7);
    uint64_t v6 = *a2;
    uint64_t v18 = a2[1];
  }
  double v19 = (double)(0xAAAAAAAAAAAAAAABLL * ((v18 - v6) >> 3));
  *(double *)(a3 + 8) = v11 / v19;
  *(double *)(a3 + 16) = v10 / v19;
  *(double *)(a3 + 32) = v12 / v19;
  *(double *)(a3 + 4pthread_rwlock_init(&this->m_rwlock, 0) = v9 / v19;
  *(unsigned char *)a3 = 1;
  return pthread_rwlock_unlock((pthread_rwlock_t *)a1);
}

void sub_21E7AB578(_Unwind_Exception *a1)
{
  pthread_rwlock_unlock(v1);
  _Unwind_Resume(a1);
}

void *REContentFeatureExtractor::SavePositiveModel(uint64_t a1, void *a2)
{
  return REFancyShrinkingDictionary::SaveModel(a1 + 200, a2);
}

BOOL REContentFeatureExtractor::LoadPositiveModel(uint64_t a1, const std::string *a2)
{
  return REFancyShrinkingDictionary::LoadModel(a1 + 200, a2);
}

void *REContentFeatureExtractor::SaveNegativeModel(uint64_t a1, void *a2)
{
  return REFancyShrinkingDictionary::SaveModel(a1 + 264, a2);
}

BOOL REContentFeatureExtractor::LoadNegativeModel(uint64_t a1, const std::string *a2)
{
  return REFancyShrinkingDictionary::LoadModel(a1 + 264, a2);
}

uint64_t __REGetShowAllElements_block_invoke_0()
{
  uint64_t result = _REGetIsInternalBuild();
  _isInternalDevice_9 = result;
  return result;
}

void __RE_Cached_updateValue__ShowAllElements_0()
{
  os_unfair_lock_lock(&__RE_Cached_lock__ShowAllElements_0);
  __RE_Cached_hasValue__ShowAllElements_0 = 0;
  os_unfair_lock_unlock(&__RE_Cached_lock__ShowAllElements_0);
  RERelevanceEngineDisplayDebugProbabilitiesDidUpdate();
}

uint64_t __RelevanceEngineLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  RelevanceEngineLibraryCore_frameworkLibrary_2 = result;
  return result;
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id REPipedLocationReceiverInterface()
{
  if (REPipedLocationReceiverInterface_onceToken != -1) {
    dispatch_once(&REPipedLocationReceiverInterface_onceToken, &__block_literal_global_70);
  }
  int v0 = (void *)REPipedLocationReceiverInterface_interface;
  return v0;
}

void __REPipedLocationReceiverInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CFE5908];
  uint64_t v1 = (void *)REPipedLocationReceiverInterface_interface;
  REPipedLocationReceiverInterface_interface = v0;

  id v2 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [(id)REPipedLocationReceiverInterface_interface setClasses:v2 forSelector:sel_updateLocation_ argumentIndex:0 ofReply:0];
}

id REPipedLocationDonorInterface()
{
  if (REPipedLocationDonorInterface_onceToken != -1) {
    dispatch_once(&REPipedLocationDonorInterface_onceToken, &__block_literal_global_48_0);
  }
  uint64_t v0 = (void *)REPipedLocationDonorInterface_interface;
  return v0;
}

uint64_t __REPipedLocationDonorInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CFDAB80];
  uint64_t v1 = REPipedLocationDonorInterface_interface;
  REPipedLocationDonorInterface_interface = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

__CFString *REDiffOperationTypeDescription(unint64_t a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return off_2644C0160[a1];
  }
}

id REValidatedFeatureOptionsDictionary(void *a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = v3;
  uint64_t v21 = [v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (!v21)
  {

LABEL_21:
    id v17 = v4;
    id v13 = 0;
    goto LABEL_22;
  }
  IMP v20 = a2;
  uint64_t v22 = *(void *)v24;
  double v19 = @"REErrorTokenKey";
  while (2)
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v24 != v22) {
        objc_enumerationMutation(v5);
      }
      uint64_t v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      int v8 = objc_msgSend(v7, "value", v19);
      uint64_t v9 = [&unk_26CFCD8B8 objectForKeyedSubscript:v8];
      if (!v9)
      {
        id v27 = v19;
        double v28 = v7;
        uint64_t v10 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        RECreateErrorWithCodeAndUseInfo(204, v10);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v10 = (void *)v9;
      double v11 = [v5 objectForKeyedSubscript:v7];
      if (([v7 isEqual:v11] & 1) == 0)
      {
        double v31 = v19;
        uint64_t v32 = v11;
        uint64_t v14 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        double v15 = @"Unexpect value for specified feature type";
        uint64_t v16 = 204;
LABEL_16:
        RECreateErrorWithCodeMessageAndUseInfo(v16, v15, v14);
        id v13 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
      }
      double v12 = [v4 objectForKeyedSubscript:@"REScriptSymbolFeatureTypeKey"];

      if (v12)
      {
        double v29 = v19;
        IMP v30 = v7;
        uint64_t v14 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        double v15 = @"Redefintion of feature type";
        uint64_t v16 = 206;
        goto LABEL_16;
      }
      [v4 setObject:v10 forKeyedSubscript:@"REScriptSymbolFeatureTypeKey"];
    }
    uint64_t v21 = [v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
    if (v21) {
      continue;
    }
    break;
  }
  id v13 = 0;
LABEL_18:

  if (!v13) {
    goto LABEL_21;
  }
  if (v20)
  {
    id v13 = v13;
    id v17 = 0;
    *IMP v20 = v13;
  }
  else
  {
    id v17 = 0;
  }
LABEL_22:

  return v17;
}

__CFString *REStringFromDonationType(unint64_t a1)
{
  if (a1 > 2) {
    return &stru_26CFA57D0;
  }
  else {
    return *(&off_2644C01C0 + a1);
  }
}

id RERelevanceProvidersForDonatedAction(void *a1, int a2)
{
  v27[5] = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = +[REFeature isSiriActionFeature];
  id v5 = +[REFeatureValue featureValueWithBool:1];
  uint64_t v6 = +[RERelevanceProvider customRelevanceProviderForFeature:v4 withValue:v5];
  uint64_t v7 = (void *)v6;
  if (a2)
  {
    v27[0] = v6;
    long long v23 = +[REFeature itemIdentifierFeature];
    uint64_t v22 = +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", [v3 trainingActionIdentifier]);
    uint64_t v21 = +[RERelevanceProvider customRelevanceProviderForFeature:v23 withValue:v22];
    v27[1] = v21;
    IMP v20 = +[REFeature coreBehaviorShortcutTypeFeature];
    double v19 = +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", [v3 filteredShortcutType]);
    uint64_t v18 = +[RERelevanceProvider customRelevanceProviderForFeature:v20 withValue:v19];
    v27[2] = v18;
    id v17 = +[REFeature coreBehaviorEventIdentifierHashFeature];
    long long v24 = v5;
    [v3 eventLevelIdentifier];
    int v8 = v25 = v4;
    uint64_t v9 = +[REFeatureValue featureValueWithString:v8];
    uint64_t v10 = +[RERelevanceProvider customRelevanceProviderForFeature:v17 withValue:v9];
    v27[3] = v10;
    double v11 = +[REFeature coreBehaviorAppIdentifierHashFeature];
    double v12 = [v3 appLevelIdentifier];
    id v13 = +[REFeatureValue featureValueWithString:v12];
    uint64_t v14 = +[RERelevanceProvider customRelevanceProviderForFeature:v11 withValue:v13];
    v27[4] = v14;
    double v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:5];

    id v5 = v24;
    uint64_t v4 = v25;
  }
  else
  {
    uint64_t v26 = v6;
    double v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
  }

  return v15;
}

void REEnumerateTrainingStateForDate(void *a1, void *a2)
{
  id v20 = a1;
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x223C31460]();
    id v5 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v6 = [v5 components:124 fromDate:v20];
    uint64_t v7 = [v5 rangeOfUnit:32 inUnit:16 forDate:v20];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = v7;
      unint64_t v11 = v8;
      uint64_t v12 = [v6 day];
      id v13 = objc_alloc(MEMORY[0x263F08798]);
      uint64_t v14 = REStartOfDayForDate(v20);
      double v15 = REEndOfDayForDate(v20);
      uint64_t v16 = (void *)[v13 initWithStartDate:v14 endDate:v15];

      for (unint64_t i = v10 + arc4random_uniform(2u); i <= v11; i += 2)
      {
        if (v12 != i)
        {
          [v6 setHour:i];
          uint64_t v18 = [v5 dateFromComponents:v6];
          if ([v16 containsDate:v18]) {
            v3[2](v3, 0, v18);
          }
        }
      }
      uint64_t v19 = 4;
      do
      {
        v3[2](v3, 1, v20);
        --v19;
      }
      while (v19);
    }
  }
}

id get_DKSystemEventStreamsClass_1()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)get_DKSystemEventStreamsClass_softClass_1;
  uint64_t v7 = get_DKSystemEventStreamsClass_softClass_1;
  if (!get_DKSystemEventStreamsClass_softClass_1)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __get_DKSystemEventStreamsClass_block_invoke_1;
    v3[3] = &unk_2644BC768;
    v3[4] = &v4;
    __get_DKSystemEventStreamsClass_block_invoke_1((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E7B0BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E7B10D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_DKApplicationActivityMetadataKeyClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)get_DKApplicationActivityMetadataKeyClass_softClass;
  uint64_t v7 = get_DKApplicationActivityMetadataKeyClass_softClass;
  if (!get_DKApplicationActivityMetadataKeyClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __get_DKApplicationActivityMetadataKeyClass_block_invoke;
    v3[3] = &unk_2644BC768;
    v3[4] = &v4;
    __get_DKApplicationActivityMetadataKeyClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E7B14C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CoreDuetLibraryCore_1()
{
  if (!CoreDuetLibraryCore_frameworkLibrary_1) {
    CoreDuetLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  return CoreDuetLibraryCore_frameworkLibrary_1;
}

uint64_t __CoreDuetLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  CoreDuetLibraryCore_frameworkLibrary_1 = result;
  return result;
}

void CoreDuetLibrary_1()
{
  if (!CoreDuetLibraryCore_1())
  {
    uint64_t v0 = (void *)abort_report_np();
    free(v0);
  }
}

id REUpNextDemoDateFormatter()
{
  if (REUpNextDemoDateFormatter_onceToken != -1) {
    dispatch_once(&REUpNextDemoDateFormatter_onceToken, &__block_literal_global_76);
  }
  uint64_t v0 = (void *)REUpNextDemoDateFormatter_dateFormatter;
  return v0;
}

uint64_t __REUpNextDemoDateFormatter_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  id v1 = (void *)REUpNextDemoDateFormatter_dateFormatter;
  REUpNextDemoDateFormatter_dateFormatter = (uint64_t)v0;

  id v2 = (void *)REUpNextDemoDateFormatter_dateFormatter;
  return [v2 setDateFormat:@"HH:mm"];
}

uint64_t REUpNextDemoActivityAlwaysShow()
{
  return 0;
}

uint64_t REUpNextDemoActivityShowInEvening()
{
  return 0;
}

uint64_t REUpNextDemoActivityDate()
{
  return 0;
}

uint64_t REUpNextDemoCommuteDate()
{
  return 0;
}

uint64_t REUpNextDemoCommuteTitle()
{
  return 0;
}

uint64_t REUpNextDemoCommuteDescription1()
{
  return 0;
}

uint64_t REUpNextDemoCommuteDescription2()
{
  return 0;
}

uint64_t REUpNextDemoPhotosUseFavoritesAlbum()
{
  return 0;
}

uint64_t REUpNextDemoPhotosMemoryTitle()
{
  return 0;
}

uint64_t REUpNextDemoPhotosMemorySubtitle()
{
  return 0;
}

uint64_t REUpNextDemoIgnoreHomeChanges()
{
  return 0;
}

uint64_t REUpNextDemoSuppressThumbnails()
{
  return 0;
}

BOOL REUpNextDemoAlwaysShowRoutines()
{
  if (_fetchedInternalBuildOnceToken_10 != -1) {
    dispatch_once(&_fetchedInternalBuildOnceToken_10, &__block_literal_global_3_0);
  }
  if (!_isInternalDevice_10) {
    return 0;
  }
  if (REGetAlwaysShowRoutines_onceToken != -1) {
    dispatch_once(&REGetAlwaysShowRoutines_onceToken, &__block_literal_global_5_1);
  }
  return REGetAlwaysShowRoutines__REValueAlwaysShowRoutines != 0;
}

uint64_t REUpNextDemoShiftTopItems()
{
  return 0;
}

uint64_t REUpNextDemoPhotoPreloadCount()
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t REUpNextDemoWalletIgnoreDate()
{
  return 0;
}

uint64_t REUpNextDemoPreWarmIdentifiers()
{
  return 0;
}

uint64_t REUpNextDemoHomeAlwaysShow()
{
  return 0;
}

uint64_t REUpNextDemoWeatherShowInMorning()
{
  return 0;
}

uint64_t REUpNextDemoWeatherHideWeatherConditions()
{
  return 0;
}

double REUpNextDemoTimeoutDuration()
{
  return 0.0;
}

uint64_t REUpNextDemoShowAllSnippets()
{
  return 0;
}

uint64_t REUpNextDemoAlwaysShowSnippets()
{
  return 0;
}

uint64_t REUpNextDemoEnableCommuteDataSource()
{
  return 0;
}

uint64_t __REGetAlwaysShowRoutines_block_invoke()
{
  uint64_t result = _REGetIsInternalBuild();
  _isInternalDevice_10 = result;
  return result;
}

void __REGetAlwaysShowRoutines_block_invoke_2()
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  char v9 = 0;
  if (RelevanceEngineLibraryCore_3())
  {
    id v0 = (id)RelevanceEngineLibraryCore_3();
    if (v0)
    {
      uint64_t v10 = 0;
      unint64_t v11 = &v10;
      uint64_t v12 = 0x2050000000;
      id v1 = (void *)get_REEngineDefaultsClass_softClass_2;
      uint64_t v13 = get_REEngineDefaultsClass_softClass_2;
      if (!get_REEngineDefaultsClass_softClass_2)
      {
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        double v15 = __get_REEngineDefaultsClass_block_invoke_2;
        uint64_t v16 = &unk_2644BC768;
        id v17 = &v10;
        __get_REEngineDefaultsClass_block_invoke_2((uint64_t)&buf);
        id v1 = (void *)v11[3];
      }
      id v2 = v1;
      _Block_object_dispose(&v10, 8);
      id v0 = v2;
    }
    id v3 = [v0 globalDefaults];
  }
  else
  {
    id v3 = 0;
  }
  unsigned int v4 = [v3 _BOOLValueForKey:@"AlwaysShowRoutines" set:&v9];
  if (v9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = RELogForDomain(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [NSNumber numberWithBool:v5];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_21E6E6000, v6, OS_LOG_TYPE_DEFAULT, "Prefs reading value for key AlwaysShowRoutines: %@", (uint8_t *)&buf, 0xCu);
  }
  if (v9) {
    char v8 = v5;
  }
  else {
    char v8 = 0;
  }
  REGetAlwaysShowRoutines__REValueAlwaysShowRoutines = v8;
}

void sub_21E7B3A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __RelevanceEngineLibraryCore_block_invoke_3()
{
  uint64_t result = _sl_dlopen();
  RelevanceEngineLibraryCore_frameworkLibrary_3 = result;
  return result;
}

id RESampleFeature()
{
  if (RESampleFeature_onceToken != -1) {
    dispatch_once(&RESampleFeature_onceToken, &__block_literal_global_77);
  }
  id v0 = (void *)RESampleFeature_Feature;
  return v0;
}

uint64_t __RESampleFeature_block_invoke()
{
  uint64_t v0 = +[REFeature featureWithName:@"SamplePosition" featureType:2];
  uint64_t v1 = RESampleFeature_Feature;
  RESampleFeature_Feature = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id RESampleRelevanceProviderForPosition(float a1)
{
  id v2 = RESampleFeature();
  id v3 = +[REFeatureValue featureValueWithDouble:a1];
  unsigned int v4 = +[RERelevanceProvider customRelevanceProviderForFeature:v2 withValue:v3];

  return v4;
}

void REPriorityQueueReleaseWithAllocator(int a1, CFTypeRef cf)
{
}

uint64_t REPriorityQueueCopyDescription(void *a1)
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t REPriorityQueueCompare(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (uint64_t (**)(void, void, void))MEMORY[0x223C31700](a3);
  uint64_t v6 = v5[2](v5, a1, a2);
  if (v6 == -1) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v6 == 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v7;
  }

  return v8;
}

void sub_21E7B3DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void REPriorityQueueApply(uint64_t a1, uint64_t a2)
{
  id v3 = (void (**)(void, void))MEMORY[0x223C31700](a2);
  if (v3)
  {
    id v4 = v3;
    v3[2](v3, a1);
    id v3 = (void (**)(void, void))v4;
  }
}

void sub_21E7B440C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id REPredictionServerInterface()
{
  if (REPredictionServerInterface_onceToken != -1) {
    dispatch_once(&REPredictionServerInterface_onceToken, &__block_literal_global_79);
  }
  uint64_t v0 = (void *)REPredictionServerInterface_interface;
  return v0;
}

void __REPredictionServerInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CFF2F08];
  uint64_t v1 = (void *)REPredictionServerInterface_interface;
  REPredictionServerInterface_interface = v0;

  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [(id)REPredictionServerInterface_interface setClasses:v11 forSelector:sel_requestPredictedActionsWithCompletion_ argumentIndex:0 ofReply:1];
  uint64_t v7 = (void *)REPredictionServerInterface_interface;
  uint64_t v8 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v7 setClasses:v8 forSelector:sel_fetchFirstPerformedActionDate_ argumentIndex:0 ofReply:1];

  char v9 = (void *)REPredictionServerInterface_interface;
  uint64_t v10 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v9 setClasses:v10 forSelector:sel_fetchPerformedTodayCountForActionWithBundleIdentifer_actionIdentifier_completion_ argumentIndex:0 ofReply:0];
}

id REPredictionClientInterface()
{
  if (REPredictionClientInterface_onceToken != -1) {
    dispatch_once(&REPredictionClientInterface_onceToken, &__block_literal_global_61_0);
  }
  uint64_t v0 = (void *)REPredictionClientInterface_interface;
  return v0;
}

uint64_t __REPredictionClientInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CFF2F68];
  uint64_t v1 = REPredictionClientInterface_interface;
  REPredictionClientInterface_interface = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_21E7B4F5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E7B5148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E7B57F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E7B859C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __REElementComparatorInverter_block_invoke(uint64_t a1)
{
  uint64_t v1 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v1 == 1) {
    return -1;
  }
  else {
    return v1 == -1;
  }
}

void dispatch_metrics(void *a1)
{
  uint64_t v1 = dispatch_metrics(void({block_pointer})(void),BOOL)::onceToken;
  id v2 = a1;
  id v4 = v2;
  if (v1 == -1)
  {
    uint64_t v3 = v2;
  }
  else
  {
    dispatch_once(&dispatch_metrics(void({block_pointer})(void),BOOL)::onceToken, &__block_literal_global_81);
    uint64_t v3 = v4;
  }
  dispatch_async((dispatch_queue_t)dispatch_metrics(void({block_pointer})(void),BOOL)::queue, v3);
}

uint64_t ___Z16dispatch_metricsU13block_pointerFvvEb_block_invoke()
{
  uint64_t v0 = RECreateSharedQueueWithQOS(@"com.apple.RelevanceEngine.Metrics", QOS_CLASS_BACKGROUND);
  uint64_t v1 = dispatch_metrics(void({block_pointer})(void),BOOL)::queue;
  dispatch_metrics(void({block_pointer})(void),BOOL)::queue = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void RESubmitRelevantShortcut(void *a1)
{
  id v1 = a1;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __RESubmitRelevantShortcut_block_invoke;
  v3[3] = &unk_2644C04D0;
  id v4 = v1;
  id v2 = v1;
  dispatch_metrics(v3);
}

void __RESubmitRelevantShortcut_block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) generateMetrics];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v4 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  else {
    uint64_t v6 = @"unknown";
  }
  uint64_t v7 = v6;

  [v3 setObject:v7 forKeyedSubscript:@"bundleID"];
  int v8 = [*(id *)(a1 + 32) isLocalDonation];
  char v9 = RELocal;
  if (!v8) {
    char v9 = RERemote;
  }
  uint64_t v22 = *v9;
  objc_msgSend(v3, "setObject:forKeyedSubscript:");
  uint64_t v10 = [v2 objectForKeyedSubscript:@"shortcutType"];
  id v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = (__CFString *)v10;
  }
  else {
    uint64_t v12 = @"unknown";
  }
  uint64_t v13 = v12;

  long long v23 = v13;
  [v3 setObject:v13 forKeyedSubscript:@"shortcutType"];
  uint64_t v14 = [v2 objectForKeyedSubscript:@"intentType"];
  if (v14) {
    [v3 setObject:v14 forKeyedSubscript:@"intentType"];
  }
  long long v24 = [v2 objectForKeyedSubscript:@"imageSource"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:");
  long long v25 = [v2 objectForKeyedSubscript:@"subtitleSource"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:");
  [v2 objectForKeyedSubscript:@"relevanceProvider"];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        IMP v30 = @"relevanceProvider";
        uint64_t v31 = v19;
        id v20 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        AnalyticsSendEvent();
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v16);
  }

  uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
  [v3 setObject:v21 forKeyedSubscript:@"relevanceProviderCount"];
  AnalyticsSendEvent();
}

void sub_21E7B93A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void RESubmitShortcutExecution(void *a1)
{
  id v1 = a1;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __RESubmitShortcutExecution_block_invoke;
  v3[3] = &unk_2644C04D0;
  id v4 = v1;
  id v2 = v1;
  dispatch_metrics(v3);
}

uint64_t __RESubmitShortcutExecution_block_invoke()
{
  return AnalyticsSendEvent();
}

void RESubmitError(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (v3)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __RESubmitError_block_invoke;
    v6[3] = &unk_2644C04F8;
    id v7 = v4;
    id v8 = v3;
    dispatch_metrics(v6);
  }
}

void __RESubmitError_block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x263EF8340];
  id v2 = *(__CFString **)(a1 + 32);
  if (!v2) {
    id v2 = @"unknown";
  }
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = @"error";
  v6[1] = v4;
  v7[0] = v4;
  v7[1] = v3;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  AnalyticsSendEvent();
}

void sub_21E7B96A0(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

id REAnalyticsValue(double a1)
{
  id v3 = objc_msgSend(NSNumber, "numberWithDouble:", a1, v1);
  return v3;
}

void RESubmitBayesianModelTrained(BayesianModel *a1, void *a2, void *a3)
{
  v54[7] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v44 = v6;
    if (objc_opt_respondsToSelector())
    {
      char v7 = [v5 ignoreValidMetricCheck];
      if (a1->m_dNormalizedLogScore >= -20.0)
      {
        if (v7)
        {
          id v8 = RELogForDomain(18);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_21E6E6000, v8, OS_LOG_TYPE_DEFAULT, "Normally, we would ignore RESubmitBayesianModelTrained because metrics aren't valid; however, the client h"
              "as indicated we should proceed.",
              buf,
              2u);
          }

          goto LABEL_9;
        }
LABEL_10:
        IMP v30 = RELogForDomain(18);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_21E6E6000, v30, OS_LOG_TYPE_DEFAULT, "Ignore RESubmitBayesianModelTrained because metrics aren't valid.", buf, 2u);
        }
        goto LABEL_12;
      }
    }
    else if (a1->m_dNormalizedLogScore >= -20.0)
    {
      goto LABEL_10;
    }
LABEL_9:
    v53[0] = @"averagePrediction";
    double AveragePrediction = BayesianModel::getAveragePrediction(a1);
    uint64_t v10 = REAnalyticsValue(AveragePrediction);
    v54[0] = v10;
    v53[1] = @"averageActionProbability";
    double AverageProbability = BayesianModel::getAverageProbability(a1);
    uint64_t v12 = REAnalyticsValue(AverageProbability);
    v54[1] = v12;
    v53[2] = @"negativeEntropy";
    double AverageNegativeEntropy = BayesianModel::getAverageNegativeEntropy(a1);
    uint64_t v14 = REAnalyticsValue(AverageNegativeEntropy);
    v54[2] = v14;
    v53[3] = @"normalizedEntropy";
    BayesianModel::getAverageNormalizedEntropy(a1);
    uint64_t v16 = REAnalyticsValue(v15);
    v54[3] = v16;
    v53[4] = @"trueEvents";
    uint64_t v17 = [NSNumber numberWithUnsignedLongLong:a1->m_nTotalTrue];
    v54[4] = v17;
    v53[5] = @"falseEvents";
    uint64_t v18 = [NSNumber numberWithUnsignedLongLong:a1->m_nTotalExamples - a1->m_nTotalTrue];
    v54[5] = v18;
    v53[6] = @"totalEvents";
    uint64_t v19 = [NSNumber numberWithUnsignedLongLong:a1->m_nTotalExamples];
    v54[6] = v19;
    uint64_t v42 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:7];

    v51[0] = @"calibrationCurve1";
    unint64_t v43 = objc_msgSend(NSNumber, "numberWithDouble:", BayesianModel::getCalibration(a1, 0));
    v52[0] = v43;
    v51[1] = @"calibrationCurve2";
    double v41 = objc_msgSend(NSNumber, "numberWithDouble:", BayesianModel::getCalibration(a1, 1u));
    v52[1] = v41;
    v51[2] = @"calibrationCurve3";
    IMP v40 = objc_msgSend(NSNumber, "numberWithDouble:", BayesianModel::getCalibration(a1, 2u));
    v52[2] = v40;
    v51[3] = @"calibrationCurve4";
    long long v39 = objc_msgSend(NSNumber, "numberWithDouble:", BayesianModel::getCalibration(a1, 3u));
    v52[3] = v39;
    v51[4] = @"calibrationCurve5";
    double v38 = objc_msgSend(NSNumber, "numberWithDouble:", BayesianModel::getCalibration(a1, 4u));
    v52[4] = v38;
    v51[5] = @"calibrationCurve6";
    double v37 = objc_msgSend(NSNumber, "numberWithDouble:", BayesianModel::getCalibration(a1, 5u));
    v52[5] = v37;
    v51[6] = @"calibrationCurve7";
    double v36 = objc_msgSend(NSNumber, "numberWithDouble:", BayesianModel::getCalibration(a1, 6u));
    v52[6] = v36;
    v51[7] = @"calibrationCurve8";
    IMP v35 = objc_msgSend(NSNumber, "numberWithDouble:", BayesianModel::getCalibration(a1, 7u));
    v52[7] = v35;
    v51[8] = @"calibrationCurve9";
    uint64_t v34 = objc_msgSend(NSNumber, "numberWithDouble:", BayesianModel::getCalibration(a1, 8u));
    v52[8] = v34;
    v51[9] = @"calibrationCurve10";
    uint64_t v33 = objc_msgSend(NSNumber, "numberWithDouble:", BayesianModel::getCalibration(a1, 9u));
    v52[9] = v33;
    v51[10] = @"calibrationCount1";
    uint64_t v32 = objc_msgSend(NSNumber, "numberWithDouble:", BayesianModel::getCalibrationCount(a1, 0));
    v52[10] = v32;
    v51[11] = @"calibrationCount2";
    uint64_t v31 = objc_msgSend(NSNumber, "numberWithDouble:", BayesianModel::getCalibrationCount(a1, 1u));
    v52[11] = v31;
    v51[12] = @"calibrationCount3";
    id v20 = objc_msgSend(NSNumber, "numberWithDouble:", BayesianModel::getCalibrationCount(a1, 2u));
    v52[12] = v20;
    v51[13] = @"calibrationCount4";
    uint64_t v21 = objc_msgSend(NSNumber, "numberWithDouble:", BayesianModel::getCalibrationCount(a1, 3u));
    v52[13] = v21;
    v51[14] = @"calibrationCount5";
    uint64_t v22 = objc_msgSend(NSNumber, "numberWithDouble:", BayesianModel::getCalibrationCount(a1, 4u));
    v52[14] = v22;
    v51[15] = @"calibrationCount6";
    long long v23 = objc_msgSend(NSNumber, "numberWithDouble:", BayesianModel::getCalibrationCount(a1, 5u));
    v52[15] = v23;
    v51[16] = @"calibrationCount7";
    long long v24 = objc_msgSend(NSNumber, "numberWithDouble:", BayesianModel::getCalibrationCount(a1, 6u));
    v52[16] = v24;
    v51[17] = @"calibrationCount8";
    long long v25 = objc_msgSend(NSNumber, "numberWithDouble:", BayesianModel::getCalibrationCount(a1, 7u));
    v52[17] = v25;
    v51[18] = @"calibrationCount9";
    long long v26 = objc_msgSend(NSNumber, "numberWithDouble:", BayesianModel::getCalibrationCount(a1, 8u));
    v52[18] = v26;
    v51[19] = @"calibrationCount10";
    long long v27 = objc_msgSend(NSNumber, "numberWithDouble:", BayesianModel::getCalibrationCount(a1, 9u));
    v52[19] = v27;
    long long v28 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:20];

    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = ___Z28RESubmitBayesianModelTrainedR13BayesianModelPU43objcproto32RERelevanceEngineMetricsRecorder11objc_objectP8NSString_block_invoke;
    v45[3] = &unk_2644C0520;
    id v46 = v5;
    id v47 = v42;
    id v48 = v44;
    id v49 = v28;
    id v29 = v28;
    IMP v30 = v42;
    dispatch_metrics(v45);

LABEL_12:
    id v6 = v44;
  }
}

void sub_21E7B9F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24)
{
  _Unwind_Resume(a1);
}

void ___Z28RESubmitBayesianModelTrainedR13BayesianModelPU43objcproto32RERelevanceEngineMetricsRecorder11objc_objectP8NSString_block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) recordTrainingMetrics:*(void *)(a1 + 40) forInteraction:*(void *)(a1 + 48)];
  }
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) recordCallibrationCurveMetrics:*(void *)(a1 + 56) forInteraction:*(void *)(a1 + 48)];
  }
  uint64_t v2 = RELogForDomain(18);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_21E6E6000, v2, OS_LOG_TYPE_DEFAULT, "submitted bayesian model training", v3, 2u);
  }
}

void RESubmitBayesianModelPredicted(uint64_t a1, void *a2, void *a3)
{
  v18[4] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v17[0] = @"probability";
    char v7 = REAnalyticsValue(*(double *)(a1 + 16));
    v18[0] = v7;
    v17[1] = @"variance";
    id v8 = REAnalyticsValue(*(double *)(a1 + 8));
    v18[1] = v8;
    v17[2] = @"pessimisticEstimate";
    char v9 = REAnalyticsValue(*(double *)(a1 + 24));
    v18[2] = v9;
    v17[3] = @"success";
    uint64_t v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
    v18[3] = v10;
    id v11 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = ___Z30RESubmitBayesianModelPredictedR10PredictionPU43objcproto32RERelevanceEngineMetricsRecorder11objc_objectP8NSString_block_invoke;
    v13[3] = &unk_2644C0548;
    id v14 = v5;
    id v15 = v11;
    id v16 = v6;
    id v12 = v11;
    dispatch_metrics(v13);
  }
}

void sub_21E7BA3A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___Z30RESubmitBayesianModelPredictedR10PredictionPU43objcproto32RERelevanceEngineMetricsRecorder11objc_objectP8NSString_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) recordPredictionMetrics:*(void *)(a1 + 40) forInteraction:*(void *)(a1 + 48)];
}

void REClearMetrics(void)
{
  uint64_t v0 = [(id)REStoredMetrics objectForKeyedSubscript:@"tappedSources"];
  [v0 removeAllObjects];

  uint64_t v1 = [(id)REStoredMetrics objectForKeyedSubscript:@"addedSources"];
  [v1 removeAllObjects];

  uint64_t v2 = [(id)REStoredMetrics objectForKeyedSubscript:@"viewedSources"];
  [v2 removeAllObjects];

  REMaxElementCount = 0;
}

void sub_21E7BA498(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void REBeginObservingMetrics()
{
}

void __REBeginObservingMetrics_block_invoke()
{
  if ((REMetricsEnabled & 1) == 0)
  {
    uint64_t v0 = RELogForDomain(18);
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v2 = 0;
      _os_log_impl(&dword_21E6E6000, v0, OS_LOG_TYPE_DEFAULT, "begin observing metrics", v2, 2u);
    }

    uint64_t v1 = dispatch_get_global_queue(17, 0);
    notify_register_dispatch("com.apple.coreanalytics.dailylogging", &_RECoreAnalyticsNotifyToken, v1, &__block_literal_global_20_0);

    REMetricsEnabled = 1;
    REClearMetrics();
  }
}

void sub_21E7BA57C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __REBeginObservingMetrics_block_invoke_17()
{
}

void REEndObservingMetrics()
{
}

void __REEndObservingMetrics_block_invoke()
{
  if (REMetricsEnabled == 1)
  {
    notify_cancel(_RECoreAnalyticsNotifyToken);
    REMetricsEnabled = 0;
    REClearMetrics();
  }
}

void REAddedElementFromDataSource(void *a1)
{
  id v1 = a1;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __REAddedElementFromDataSource_block_invoke;
  v3[3] = &unk_2644C04D0;
  id v4 = v1;
  id v2 = v1;
  dispatch_metrics(v3);
}

void __REAddedElementFromDataSource_block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  char v7 = @"addedSources";
  id v2 = v1;
  if (v2)
  {
    id v3 = (void *)REStoredMetrics;
    if (!REStoredMetrics)
    {
      uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
      id v5 = (void *)REStoredMetrics;
      REStoredMetrics = v4;

      id v3 = (void *)REStoredMetrics;
    }
    id v6 = [v3 objectForKeyedSubscript:v7];
    if (!v6)
    {
      id v6 = [MEMORY[0x263EFF9C0] set];
      objc_msgSend((id)REStoredMetrics, "setObject:forKeyedSubscript:");
    }
    [v6 addObject:v2];
  }
}

void sub_21E7BA770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void REViewedElementFromDataSource(void *a1)
{
  id v1 = a1;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __REViewedElementFromDataSource_block_invoke;
  v3[3] = &unk_2644C04D0;
  id v4 = v1;
  id v2 = v1;
  dispatch_metrics(v3);
}

void __REViewedElementFromDataSource_block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  char v7 = @"viewedSources";
  id v2 = v1;
  if (v2)
  {
    id v3 = (void *)REStoredMetrics;
    if (!REStoredMetrics)
    {
      uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
      id v5 = (void *)REStoredMetrics;
      REStoredMetrics = v4;

      id v3 = (void *)REStoredMetrics;
    }
    id v6 = [v3 objectForKeyedSubscript:v7];
    if (!v6)
    {
      id v6 = [MEMORY[0x263EFF9C0] set];
      objc_msgSend((id)REStoredMetrics, "setObject:forKeyedSubscript:");
    }
    [v6 addObject:v2];
  }
}

void sub_21E7BA904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void RETappedElementFromDataSource(void *a1)
{
  id v1 = a1;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __RETappedElementFromDataSource_block_invoke;
  v3[3] = &unk_2644C04D0;
  id v4 = v1;
  id v2 = v1;
  dispatch_metrics(v3);
}

void __RETappedElementFromDataSource_block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  char v7 = @"tappedSources";
  id v2 = v1;
  if (v2)
  {
    id v3 = (void *)REStoredMetrics;
    if (!REStoredMetrics)
    {
      uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
      id v5 = (void *)REStoredMetrics;
      REStoredMetrics = v4;

      id v3 = (void *)REStoredMetrics;
    }
    id v6 = [v3 objectForKeyedSubscript:v7];
    if (!v6)
    {
      id v6 = [MEMORY[0x263EFF9C0] set];
      objc_msgSend((id)REStoredMetrics, "setObject:forKeyedSubscript:");
    }
    [v6 addObject:v2];
  }
}

void sub_21E7BAA98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void RESetNumberOfElements(uint64_t a1)
{
  v1[0] = MEMORY[0x263EF8330];
  v1[1] = 3221225472;
  v1[2] = __RESetNumberOfElements_block_invoke;
  v1[3] = &__block_descriptor_40_e5_v8__0l;
  v1[4] = a1;
  dispatch_metrics(v1);
}

uint64_t __RESetNumberOfElements_block_invoke(uint64_t result)
{
  uint64_t v1 = REMaxElementCount;
  if ((unint64_t)REMaxElementCount <= *(void *)(result + 32)) {
    uint64_t v1 = *(void *)(result + 32);
  }
  REMaxElementCount = v1;
  return result;
}

void sub_21E7BAC00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21E7BAD40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21E7BADE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ___ZL15RESubmitMetricsv_block_invoke()
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = RELogForDomain(18);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_21E6E6000, v0, OS_LOG_TYPE_DEFAULT, "daily core analytics callback", v8, 2u);
  }

  if (REMetricsEnabled == 1)
  {
    ___ZL15RESubmitMetricsv_block_invoke_88(v1, @"com.apple.NanoTimeKit.UpNextTappedSources", @"tappedSources");
    ___ZL15RESubmitMetricsv_block_invoke_88(v2, @"com.apple.NanoTimeKit.UpNextAddedSources", @"addedSources");
    ___ZL15RESubmitMetricsv_block_invoke_88(v3, @"com.apple.NanoTimeKit.UpNextViewedSources", @"viewedSources");
    char v9 = @"elementsCount";
    uint64_t v4 = [NSNumber numberWithUnsignedInteger:REMaxElementCount];
    v10[0] = v4;
    id v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    AnalyticsSendEvent();

    REClearMetrics();
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 postNotificationName:@"REDidCollectMetrics" object:0];

    char v7 = RELogForDomain(18);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_21E6E6000, v7, OS_LOG_TYPE_DEFAULT, "submitted daily core analytics metrics", v8, 2u);
    }
  }
}

void sub_21E7BAFD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL15RESubmitMetricsv_block_invoke_88(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  id v6 = [(id)REStoredMetrics objectForKeyedSubscript:v5];
  uint64_t v7 = [v6 allObjects];
  id v8 = (void *)v7;
  char v9 = (void *)MEMORY[0x263EFFA68];
  if (v7) {
    char v9 = (void *)v7;
  }
  id v10 = v9;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * v14);
        id v21 = v5;
        uint64_t v22 = v15;
        id v16 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1, (void)v17);
        AnalyticsSendEvent();

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v12);
  }
}

void sub_21E7BB18C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *REStringFromDeviceMotion(unint64_t a1)
{
  if (a1 > 8) {
    return 0;
  }
  else {
    return off_2644C05B0[a1];
  }
}

id getCMMotionActivityManagerClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCMMotionActivityManagerClass_softClass;
  uint64_t v7 = getCMMotionActivityManagerClass_softClass;
  if (!getCMMotionActivityManagerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCMMotionActivityManagerClass_block_invoke;
    v3[3] = &unk_2644BC768;
    void v3[4] = &v4;
    __getCMMotionActivityManagerClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E7BB56C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E7BB814(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

uint64_t CoreMotionLibraryCore()
{
  if (!CoreMotionLibraryCore_frameworkLibrary) {
    CoreMotionLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return CoreMotionLibraryCore_frameworkLibrary;
}

uint64_t __CoreMotionLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreMotionLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCMMotionActivityManagerClass_block_invoke(uint64_t a1)
{
  if (!CoreMotionLibraryCore())
  {
    uint64_t v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("CMMotionActivityManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCMMotionActivityManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v4 = (_REHasFeatureRuleCondition *)__getCMMotionActivityManagerClass_block_invoke_cold_1();
    return (Class)[(_REHasFeatureRuleCondition *)v4 _acceptsFeatureMap:v6 predictionSet:v7 explanation:v8];
  }
  return result;
}

uint64_t REFancyShrinkingDictionary::pushToIDF(uint64_t a1, long long **a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  if (*a2 != v4)
  {
    do
    {
      double v41 = (std::string *)v3;
      SEL v5 = std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, (unsigned __int8 *)v3, (uint64_t)&std::piecewise_construct, (long long **)&v41);
      ++*((_WORD *)v5 + 20);
      uint64_t v3 = (long long *)((char *)v3 + 24);
    }
    while (v3 != v4);
  }
  if (!*(unsigned char *)(a1 + 61))
  {
    if (*(void *)(a1 + 24) > *(void *)(a1 + 40))
    {
      double v41 = 0;
      uint64_t v42 = 0;
      unint64_t v43 = 0;
      __p = 0;
      long long v39 = 0;
      IMP v40 = 0;
      for (uint64_t i = *(uint64_t **)(a1 + 16); i; uint64_t i = (uint64_t *)*i)
      {
        uint64_t v15 = (long long *)(i + 2);
        id v16 = v42;
        if ((unint64_t)v42 >= v43)
        {
          long long v18 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v41, v15);
        }
        else
        {
          if (*((char *)i + 39) < 0)
          {
            std::string::__init_copy_ctor_external(v42, (const std::string::value_type *)i[2], i[3]);
          }
          else
          {
            long long v17 = *v15;
            v42->__r_.__value_.__r.__words[2] = i[4];
            *(_OWORD *)&v16->__r_.__value_.__l.__data_ = v17;
          }
          long long v18 = v16 + 1;
        }
        uint64_t v42 = v18;
        long long v19 = v39;
        if (v39 >= v40)
        {
          id v21 = (char *)__p;
          uint64_t v22 = v39 - (unsigned char *)__p;
          if (v39 - (unsigned char *)__p <= -3) {
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v23 = v22 >> 1;
          if (v40 - (unsigned char *)__p <= (unint64_t)((v22 >> 1) + 1)) {
            uint64_t v24 = v23 + 1;
          }
          else {
            uint64_t v24 = v40 - (unsigned char *)__p;
          }
          if ((unint64_t)(v40 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFFELL) {
            uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v25 = v24;
          }
          if (v25)
          {
            long long v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&v40, v25);
            id v21 = (char *)__p;
            long long v19 = v39;
          }
          else
          {
            long long v26 = 0;
          }
          long long v27 = &v26[2 * v23];
          *(_WORD *)long long v27 = *((_WORD *)i + 20);
          long long v20 = v27 + 2;
          while (v19 != v21)
          {
            __int16 v28 = *((_WORD *)v19 - 1);
            v19 -= 2;
            *((_WORD *)v27 - 1) = v28;
            v27 -= 2;
          }
          __p = v27;
          long long v39 = v20;
          IMP v40 = &v26[2 * v25];
          if (v21) {
            operator delete(v21);
          }
        }
        else
        {
          *(_WORD *)long long v39 = *((_WORD *)i + 20);
          long long v20 = v19 + 2;
        }
        long long v39 = v20;
      }
      std::__sort<std::__less<unsigned short,unsigned short> &,unsigned short *>();
      IMP v30 = (char *)__p;
      uint64_t v31 = (long long *)v41;
      uint64_t v32 = v42;
      if (v41 == v42) {
        goto LABEL_60;
      }
      unint64_t v33 = *(void *)(a1 + 40);
      unsigned int v34 = *((unsigned __int16 *)__p + v33 - *(void *)(a1 + 48));
      unsigned int v35 = *((unsigned __int16 *)__p + (unint64_t)((double)v33 * 0.9));
      do
      {
        id v44 = v31;
        unsigned int v36 = *((unsigned __int16 *)std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, (unsigned __int8 *)v31, (uint64_t)&std::piecewise_construct, &v44)+ 20);
        if (v36 > v34 && (v36 < v35 || !*(unsigned char *)(a1 + 60) || v35 == v34))
        {
          id v44 = v31;
          double v37 = std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, (unsigned __int8 *)v31, (uint64_t)&std::piecewise_construct, &v44);
          *((_WORD *)v37 + 20) >>= 1;
        }
        else
        {
          std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__erase_unique<std::string>((void *)a1, (unsigned __int8 *)v31);
        }
        uint64_t v31 = (long long *)((char *)v31 + 24);
      }
      while (v31 != (long long *)v32);
      IMP v30 = (char *)__p;
      if (__p)
      {
LABEL_60:
        long long v39 = v30;
        operator delete(v30);
      }
      goto LABEL_61;
    }
    return 0;
  }
  id v6 = *(uint64_t **)(a1 + 16);
  if (!v6) {
    return 0;
  }
  unint64_t v7 = 0;
  id v8 = *(uint64_t ***)(a1 + 16);
  do
  {
    v7 += *((unsigned __int16 *)v8 + 20);
    id v8 = (uint64_t **)*v8;
  }
  while (v8);
  if (v7 <= *(void *)(a1 + 40)) {
    return 0;
  }
  char v9 = 0;
  double v41 = 0;
  uint64_t v42 = 0;
  unint64_t v43 = 0;
  do
  {
    id v10 = (long long *)(v6 + 2);
    if ((unint64_t)v9 >= v43)
    {
      char v9 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v41, v10);
    }
    else
    {
      if (*((char *)v6 + 39) < 0)
      {
        std::string::__init_copy_ctor_external(v9, (const std::string::value_type *)v6[2], v6[3]);
      }
      else
      {
        long long v11 = *v10;
        v9->__r_.__value_.__r.__words[2] = v6[4];
        *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
      }
      ++v9;
    }
    uint64_t v42 = v9;
    id v6 = (uint64_t *)*v6;
  }
  while (v6);
  uint64_t v12 = (long long *)v41;
  if (v41 != v9)
  {
    do
    {
      id v44 = v12;
      unsigned int v13 = *((unsigned __int16 *)std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, (unsigned __int8 *)v12, (uint64_t)&std::piecewise_construct, &v44)+ 20);
      if (v13 > 1)
      {
        id v44 = v12;
        *((_WORD *)std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, (unsigned __int8 *)v12, (uint64_t)&std::piecewise_construct, &v44)+ 2pthread_rwlock_init(&this->m_rwlock, 0) = v13 >> 1;
      }
      else
      {
        std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__erase_unique<std::string>((void *)a1, (unsigned __int8 *)v12);
      }
      uint64_t v12 = (long long *)((char *)v12 + 24);
    }
    while (v12 != (long long *)v9);
  }
LABEL_61:
  __p = &v41;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  return 1;
}

void sub_21E7BCAB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, char *__p, char *a10, uint64_t a11, char a12, uint64_t a13)
{
  if (__p)
  {
    a10 = __p;
    operator delete(__p);
  }
  __p = &a12;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

uint64_t REFancyShrinkingDictionary::totalTermCount(REFancyShrinkingDictionary *this)
{
  next = (void **)this->m_mapDocumentFrequency.__table_.__p1_.__value_.__next_;
  if (!next) {
    return 0;
  }
  uint64_t result = 0;
  do
  {
    result += *((unsigned __int16 *)next + 20);
    next = (void **)*next;
  }
  while (next);
  return result;
}

unsigned __int8 *REFancyShrinkingDictionary::getTokenCount(void *a1, unsigned __int8 *a2)
{
  uint64_t result = std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::find<std::string>(a1, a2);
  if (result) {
    return (unsigned __int8 *)*((unsigned __int16 *)result + 20);
  }
  return result;
}

void *REFancyShrinkingDictionary::SaveModel(uint64_t a1, void *a2)
{
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"FancyShrinkingDictionary\n", 25);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"ModelVersion\t", 13);
  uint64_t v4 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)"\n", 1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"TokensCount\t", 12);
  SEL v5 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)"\n", 1);
  uint64_t result = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"Tokens\n", 7);
  for (uint64_t i = *(uint64_t ***)(a1 + 16); i; uint64_t i = (uint64_t **)*i)
  {
    int v8 = *((char *)i + 39);
    if (v8 >= 0) {
      uint64_t v9 = (uint64_t)(i + 2);
    }
    else {
      uint64_t v9 = (uint64_t)i[2];
    }
    if (v8 >= 0) {
      uint64_t v10 = *((unsigned __int8 *)i + 39);
    }
    else {
      uint64_t v10 = (uint64_t)i[3];
    }
    long long v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, v9, v10);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"\t", 1);
    uint64_t v12 = (void *)std::ostream::operator<<();
    uint64_t result = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"\n", 1);
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273 * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127 * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(void *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2[23];
  if ((v4 & 0x80u) == 0) {
    uint64_t v5 = a2[23];
  }
  else {
    uint64_t v5 = *((void *)a2 + 1);
  }
  uint64_t v6 = a3[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v5 != v6) {
    return 0;
  }
  if (v7 < 0) {
    uint64_t v3 = *(unsigned __int8 **)a3;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*(const void **)a2, v3, *((void *)a2 + 1)) == 0;
  }
  if (!a2[23]) {
    return 1;
  }
  uint64_t v8 = v4 - 1;
  do
  {
    int v10 = *a2++;
    int v9 = v10;
    int v12 = *v3++;
    int v11 = v12;
    BOOL v14 = v8-- != 0;
    uint64_t result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 39) < 0) {
      operator delete(__p[2]);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t *std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__erase_unique<std::string>(void *a1, unsigned __int8 *a2)
{
  uint64_t result = (uint64_t *)std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::find<std::string>(a1, a2);
  if (result)
  {
    std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::erase(a1, result);
    return (uint64_t *)1;
  }
  return result;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::find<std::string>(void *a1, unsigned __int8 *a2)
{
  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  int v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  int v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v13 == v6)
      {
        if (std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }
        else
        {
          v13 &= *(void *)&v5 - 1;
        }
        if (v13 != v9) {
          return 0;
        }
      }
      int v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  int v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  int v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v6 == v13)
      {
        if (std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }
        else
        {
          v13 &= *(void *)&v5 - 1;
        }
        if (v13 != v9) {
          return 0;
        }
      }
      int v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::erase(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  std::__hash_table<std::__hash_value_type<unsigned long long,Gaussian>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,Gaussian>,BayesianModel::SuperHasher,BayesianModel::SuperHasher,true>,std::allocator<std::__hash_value_type<unsigned long long,Gaussian>>>::remove(a1, a2, (uint64_t)&__p);
  uint64_t v3 = (void **)__p;
  __p = 0;
  if (v3) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *>>>::operator()[abi:ne180100]((uint64_t)&v6, v3);
  }
  return v2;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(2 * a2);
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
}

__CFString *REValueDescriptionStringFromFeatureValue(void *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    switch([v1 type])
    {
      case 0:
        int v3 = [v2 BOOLValue];
        unint64_t v4 = @"NO";
        if (v3) {
          unint64_t v4 = @"YES";
        }
        int8x8_t v5 = v4;
        goto LABEL_12;
      case 1:
        objc_msgSend(NSString, "stringWithFormat:", @"%llu", objc_msgSend(v2, "int64Value"));
        goto LABEL_10;
      case 2:
        uint8x8_t v7 = NSString;
        [v2 doubleValue];
        objc_msgSend(v7, "stringWithFormat:", @"%f", v8);
LABEL_10:
        int8x8_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 3:
        int8x8_t v5 = [v2 stringValue];
LABEL_12:
        uint64_t v6 = v5;
        break;
      case 4:
        unint64_t v9 = [MEMORY[0x263EFF980] array];
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        int v10 = [v2 setValue];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v20 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = REValueDescriptionStringFromFeatureValue(*(void *)(*((void *)&v19 + 1) + 8 * i));
              [v9 addObject:v15];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v12);
        }

        id v16 = NSString;
        long long v17 = [v9 componentsJoinedByString:@", "];
        uint64_t v6 = [v16 stringWithFormat:@"{%@}", v17];

        break;
      default:
        uint64_t v6 = 0;
        break;
    }
  }
  else
  {
    uint64_t v6 = @"(Null)";
  }

  return v6;
}

uint64_t REValidFeatureValueTypeForFeatureType(unint64_t a1, uint64_t a2)
{
  if (a1 >= 5) {
    LOBYTE(v2) = 1;
  }
  else {
    unsigned int v2 = (6u >> a1) & 1;
  }
  BOOL v3 = a1 - 5 < 0xFFFFFFFFFFFFFFFDLL;
  if (a2) {
    BOOL v3 = v2;
  }
  if (a2 == 1) {
    BOOL v3 = a1 != 2;
  }
  if (a2 != 2) {
    LOBYTE(v2) = v3;
  }
  return v2 & 1;
}

uint64_t REBooleanValueForTaggedPointer(unint64_t a1)
{
  if ((a1 & 1) == 0) {
    return [(id)a1 BOOLValue];
  }
  return (a1 & 6) == 0 && a1 > 7;
}

double REDoubleValueForTaggedPointer(void *a1, const char *a2)
{
  if (a1)
  {
    double result = 0.0;
    if ((a1 & 6) == 4) {
      *(void *)&double result = (unint64_t)a1 & 0xFFFFFFFFFFFFFFF8;
    }
  }
  else
  {
    [a1 doubleValue];
  }
  return result;
}

__CFString *REStringValueForTaggedPointer(unint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  if (a1)
  {
    if ((~(_BYTE)a1 & 6) != 0)
    {
      id v1 = &stru_26CFA57D0;
    }
    else
    {
      unint64_t v2 = a1 >> 3;
      v5[0] = 0;
      for (uint64_t i = 6; i != -1; --i)
      {
        *((unsigned char *)v5 + i) = v2;
        v2 >>= 8;
      }
      id v1 = [NSString stringWithUTF8String:v5];
    }
  }
  else
  {
    id v1 = [(id)a1 stringValue];
  }
  return v1;
}

id RESetValueForTaggedPointer(void *a1)
{
  if (a1) {
    [MEMORY[0x263EFFA08] set];
  }
  else {
  id v1 = [a1 setValue];
  }
  return v1;
}

id REDescriptionForTaggedPointer(unint64_t a1)
{
  id v1 = REFeatureValueForTaggedPointer(a1);
  unint64_t v2 = REValueDescriptionStringFromFeatureValue(v1);

  return v2;
}

void sub_21E7BFFEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E7C1B6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *REExtractUserActivity(void *a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v1 = a1;
  unint64_t v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 activityType];
    unint64_t v4 = (void *)v3;
    int8x8_t v5 = &stru_26CFA57D0;
    if (v3) {
      int8x8_t v5 = (__CFString *)v3;
    }
    uint64_t v6 = v5;

    uint8x8_t v7 = [v2 userInfo];
    if (v7)
    {
      uint64_t v8 = [v2 requiredUserInfoKeys];
      unint64_t v9 = [v8 allObjects];
      int v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        id v11 = [v7 allKeys];
      }
      uint64_t v12 = v11;

      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = 0;
        uint64_t v17 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v27 != v17) {
              objc_enumerationMutation(v13);
            }
            long long v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            uint64_t v20 = objc_msgSend(v19, "re_actionIdentifierHashValue");
            long long v21 = [v7 objectForKeyedSubscript:v19];
            uint64_t v22 = objc_msgSend(v21, "re_actionIdentifierHashValue") + v20;

            v16 ^= v22;
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v15);
      }
      else
      {
        uint64_t v16 = 0;
      }

      uint64_t v23 = [NSNumber numberWithUnsignedLongLong:v16];
      uint64_t v24 = [(__CFString *)v6 stringByAppendingFormat:@"&userInfoHash=%@", v23];

      uint64_t v6 = (__CFString *)v24;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void _HTTPServerInvalidated(void *a1)
{
  id v1 = [a1 weakObjectValue];
  [v1 invalidated];
}

void _HTTPServerRecievedError(void *a1, uint64_t a2)
{
  id v3 = [a1 weakObjectValue];
  [v3 didRecievedError:a2];
}

void _HTTPServerDidOpenConnection(void *a1, uint64_t a2)
{
  id v3 = [a1 weakObjectValue];
  [v3 didOpenConnection:a2];
}

void _HTTPServerDidCloseConnection(void *a1, uint64_t a2)
{
  id v3 = [a1 weakObjectValue];
  [v3 didCloseConnection:a2];
}

void sub_21E7C2D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t RELocationPredictorUserLocationFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"RELocationOfInterestHome"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"RELocationOfInterestWork"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"RELocationOfInterestGym"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"RELocationOfInterestSchool"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = -1;
  }

  return v2;
}

void sub_21E7C32E0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_21E7C3BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

uint64_t CoreRoutineLibraryCore()
{
  if (!CoreRoutineLibraryCore_frameworkLibrary) {
    CoreRoutineLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return CoreRoutineLibraryCore_frameworkLibrary;
}

uint64_t __CoreRoutineLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreRoutineLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getRTRoutineManagerClass_block_invoke(uint64_t a1)
{
  if (!CoreRoutineLibraryCore())
  {
    id v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("RTRoutineManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getRTRoutineManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    unint64_t v4 = (void *)__getRTRoutineManagerClass_block_invoke_cold_1();
    return (Class)REDescriptionForExportedObject(v4);
  }
  return result;
}

id REDescriptionForExportedObject(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[RESingleton sharedInstance];
  int v3 = [v2 exportedInterfaceClass:objc_opt_class()];

  if (v3)
  {
    unint64_t v4 = [(REExportedValueEncoder *)[RELogExportedValueEncoder alloc] initWithOptions:2];
    int8x8_t v5 = +[REExportedValue exportedValueForObject:v1];
    uint64_t v6 = [(REExportedValueEncoder *)v4 dataFromExportedValue:v5];

    if (v6) {
      uint8x8_t v7 = (__CFString *)[[NSString alloc] initWithData:v6 encoding:4];
    }
    else {
      uint8x8_t v7 = 0;
    }
  }
  else
  {
    uint8x8_t v7 = 0;
  }
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = &stru_26CFA57D0;
  }
  unint64_t v9 = [NSString stringWithFormat:@"<%@: %p> %@", objc_opt_class(), v1, v8];

  return v9;
}

id REVerboseDescriptionForExportedObject(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[RESingleton sharedInstance];
  int v3 = [v2 exportedInterfaceClass:objc_opt_class()];

  if (v3)
  {
    unint64_t v4 = [(REExportedValueEncoder *)[RELogExportedValueEncoder alloc] initWithOptions:5];
    int8x8_t v5 = +[REExportedValue exportedValueForObject:v1];
    uint64_t v6 = [(REExportedValueEncoder *)v4 dataFromExportedValue:v5];

    if (v6) {
      uint8x8_t v7 = (__CFString *)[[NSString alloc] initWithData:v6 encoding:4];
    }
    else {
      uint8x8_t v7 = 0;
    }
  }
  else
  {
    uint8x8_t v7 = 0;
  }
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = &stru_26CFA57D0;
  }
  unint64_t v9 = [NSString stringWithFormat:@"<%@: %p> %@", objc_opt_class(), v1, v8];

  return v9;
}

id RELogHeader(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 length];
  uint64_t v3 = v2 + 4;
  unint64_t v4 = [MEMORY[0x263F089D8] stringWithCapacity:3 * v2 + 21];
  [v4 appendString:@"*"];
  if (v3)
  {
    uint64_t v5 = v3;
    do
    {
      [v4 appendString:@"-"];
      --v5;
    }
    while (v5);
    [v4 appendString:@"*\n"];
    [v4 appendString:@"|  "];
    [v4 appendString:v1];
    [v4 appendString:@"  |\n"];
    [v4 appendString:@"*"];
    do
    {
      [v4 appendString:@"-"];
      --v3;
    }
    while (v3);
  }
  else
  {
    [v4 appendString:@"*\n"];
    [v4 appendString:@"|  "];
    [v4 appendString:v1];
    [v4 appendString:@"  |\n"];
    [v4 appendString:@"*"];
  }
  [v4 appendString:@"*\n\n"];
  uint64_t v6 = (void *)[v4 copy];

  return v6;
}

void RelevanceEngineUILibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!RelevanceEngineUILibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __RelevanceEngineUILibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    void v1[5] = v1;
    long long v2 = xmmword_2644C08B0;
    uint64_t v3 = 0;
    RelevanceEngineUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!RelevanceEngineUILibraryCore_frameworkLibrary_0)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

void sub_21E7C69D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __RelevanceEngineUILibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  RelevanceEngineUILibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getCLKImageProviderClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!ClockKitLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __ClockKitLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_2644C08C8;
    uint64_t v6 = 0;
    ClockKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!ClockKitLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CLKImageProvider");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)__getCLKImageProviderClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCLKImageProviderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ClockKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  ClockKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

__CFString *REStringForLocationType(unint64_t a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return off_2644C0908[a1];
  }
}

uint64_t REMLExplanationsEnabled()
{
  if (_fetchedInternalBuildOnceToken_11 != -1) {
    dispatch_once(&_fetchedInternalBuildOnceToken_11, &__block_literal_global_85);
  }
  if (!_isInternalDevice_11) {
    return 0;
  }
  uint64_t v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"REUserDefaultMLExplanationsEnabled"];

  return v1;
}

uint64_t __REMLExplanationsEnabled_block_invoke()
{
  uint64_t result = _REGetIsInternalBuild();
  _isInternalDevice_11 = result;
  return result;
}

void sub_21E7CB710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E7CB940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose((const void *)(v10 - 80), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E7CBB60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PersonalizationPortraitLibraryCore()
{
  if (!PersonalizationPortraitLibraryCore_frameworkLibrary) {
    PersonalizationPortraitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return PersonalizationPortraitLibraryCore_frameworkLibrary;
}

uint64_t __PersonalizationPortraitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PersonalizationPortraitLibraryCore_frameworkLibrary = result;
  return result;
}

void __getPPNamedEntityStoreClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("PPNamedEntityStore");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPPNamedEntityStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPPNamedEntityStoreClass_block_invoke_cold_1();
    PersonalizationPortraitLibrary();
  }
}

void PersonalizationPortraitLibrary()
{
  if (!PersonalizationPortraitLibraryCore())
  {
    uint64_t v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getPPNamedEntityQueryClass_block_invoke(uint64_t a1)
{
  PersonalizationPortraitLibrary();
  Class result = objc_getClass("PPNamedEntityQuery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getPPNamedEntityQueryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)__getPPNamedEntityQueryClass_block_invoke_cold_1();
    return (Class)+[REScriptASTDeclarationNode parseBuffer:v5 error:v6];
  }
  return result;
}

BOOL REExpectTokenType(void *a1, unint64_t a2, void *a3)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v5 = a1;
  uint64_t v6 = [v5 type];
  uint64_t v7 = v6;
  if (a3 && v6 != a2)
  {
    uint64_t v8 = NSString;
    unint64_t v9 = [v5 value];
    uint64_t v10 = REDescriptionForTokenType(a2);
    id v11 = [v8 stringWithFormat:@"Unexpected token \"%@\" found. Expecting '%@' token.", v9, v10];

    uint64_t v14 = @"REErrorTokenKey";
    v15[0] = v5;
    uint64_t v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    RECreateErrorWithCodeMessageAndUseInfo(204, v11, v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7 == a2;
}

BOOL REExpectTokenTypeInBuffer(void *a1, unint64_t a2, void *a3)
{
  id v5 = a1;
  if ([v5 isEmpty])
  {
    if (!a3)
    {
      BOOL v9 = 0;
      goto LABEL_7;
    }
    uint64_t v6 = NSString;
    uint64_t v7 = REDescriptionForTokenType(a2);
    uint64_t v8 = [v6 stringWithFormat:@"Expecting '%@' token but reached end of file", v7];

    RECreateErrorWithCodeAndMessage(205, v8);
    BOOL v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = [v5 currentToken];
    BOOL v9 = REExpectTokenType(v8, a2, a3);
  }

LABEL_7:
  return v9;
}

unint64_t REEncodeFeatureValuePair(unsigned __int8 a1, uint64_t a2)
{
  return a2 & 0xFFFFFFFFFFFFFFLL | ((unint64_t)a1 << 56);
}

id REStringArrayFromVector(uint64_t **a1)
{
  long long v2 = [MEMORY[0x263EFF980] arrayWithCapacity:0xAAAAAAAAAAAAAAABLL * (a1[1] - *a1)];
  for (uint64_t i = *a1; i != a1[1]; i += 3)
  {
    SEL v4 = i;
    if (*((char *)i + 23) < 0) {
      SEL v4 = (uint64_t *)*i;
    }
    id v5 = [NSString stringWithUTF8String:v4];
    [v2 addObject:v5];
  }
  uint64_t v6 = (void *)[v2 copy];

  return v6;
}

void sub_21E7CCB4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_21E7CCCA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_21E7CD110(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38)
{
  if (__p) {
    operator delete(__p);
  }
  if (a21) {
    operator delete(a21);
  }
  if (a27) {
    operator delete(a27);
  }
  if (a30) {
    operator delete(a30);
  }

  unint64_t v43 = *(void **)(v41 - 120);
  if (v43)
  {
    *(void *)(v41 - 112) = v43;
    operator delete(v43);
  }

  _Unwind_Resume(a1);
}

void sub_21E7CD31C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *__copy_helper_block_ea8_40c39_ZTSNSt3__16vectorIyNS_9allocatorIyEEEE(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 4pthread_rwlock_init(&this->m_rwlock, 0) = 0;
  *(void *)(a1 + 48) = 0;
  long long v2 = (void *)(a1 + 40);
  v2[2] = 0;
  return std::vector<unsigned long long>::__init_with_size[abi:ne180100]<unsigned long long *,unsigned long long *>(v2, *(const void **)(a2 + 40), *(void *)(a2 + 48), (uint64_t)(*(void *)(a2 + 48) - *(void *)(a2 + 40)) >> 3);
}

void __destroy_helper_block_ea8_40c39_ZTSNSt3__16vectorIyNS_9allocatorIyEEEE(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(void *)(a1 + 48) = v2;
    operator delete(v2);
  }
}

void sub_21E7CD41C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t BayesianModel::AccessGaussiansAndBias(pthread_rwlock_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return pthread_rwlock_unlock(a1);
}

void sub_21E7CD494(_Unwind_Exception *a1)
{
  pthread_rwlock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_21E7CD550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *__copy_helper_block_ea8_48c39_ZTSNSt3__16vectorIdNS_9allocatorIdEEEE72c39_ZTSNSt3__16vectorIdNS_9allocatorIdEEEE(void *a1, uint64_t a2)
{
  a1[6] = 0;
  a1[7] = 0;
  a1[8] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a1 + 6, *(const void **)(a2 + 48), *(void *)(a2 + 56), (uint64_t)(*(void *)(a2 + 56) - *(void *)(a2 + 48)) >> 3);
  a1[9] = 0;
  a1[10] = 0;
  a1[11] = 0;
  return std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a1 + 9, *(const void **)(a2 + 72), *(void *)(a2 + 80), (uint64_t)(*(void *)(a2 + 80) - *(void *)(a2 + 72)) >> 3);
}

void sub_21E7CD5DC(_Unwind_Exception *exception_object)
{
  SEL v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 56) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_ea8_48c39_ZTSNSt3__16vectorIdNS_9allocatorIdEEEE72c39_ZTSNSt3__16vectorIdNS_9allocatorIdEEEE(void *a1)
{
  long long v2 = (void *)a1[9];
  if (v2)
  {
    a1[10] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[6];
  if (v3)
  {
    a1[7] = v3;
    operator delete(v3);
  }
}

void sub_21E7CD7EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21E7CD8B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

unint64_t BayesianModel::getNumberOfCoordinates(BayesianModel *this)
{
  pthread_rwlock_rdlock(&this->m_rwlock);
  unint64_t value = this->m_features.__table_.__p2_.__value_;
  pthread_rwlock_unlock(&this->m_rwlock);
  return value;
}

void sub_21E7CDC60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_21E7CDD94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12)
{
  uint64_t v14 = v13;

  a12 = (void **)&a9;
  std::vector<std::vector<std::string>>::__destroy_vector::operator()[abi:ne180100](&a12);
  _Unwind_Resume(a1);
}

void *std::vector<unsigned long long>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned long long>::__vallocate[abi:ne180100](a1, a2);
    SEL v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_21E7CDE34(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned long long>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  Class result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *std::vector<unsigned long long>::__init_with_size[abi:ne180100]<unsigned long long *,unsigned long long *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    Class result = std::vector<unsigned long long>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      Class result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21E7CDEF4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    Class result = std::vector<unsigned long long>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      Class result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21E7CDF70(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<std::vector<std::string>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  long long v2 = (void **)**a1;
  if (v2)
  {
    uint64_t v4 = (void **)v1[1];
    id v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 3;
        uint64_t v6 = v4;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v6);
      }
      while (v4 != v2);
      id v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t __RelevanceEngineLibraryCore_block_invoke_4()
{
  uint64_t result = _sl_dlopen();
  RelevanceEngineLibraryCore_frameworkLibrary_4 = result;
  return result;
}

uint64_t __REGetDisableMLModel_block_invoke()
{
  uint64_t result = _REGetIsInternalBuild();
  _isInternalDevice_12 = result;
  return result;
}

void sub_21E7CF378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_DKApplicationActivityMetadataKeyClass_0()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)get_DKApplicationActivityMetadataKeyClass_softClass_0;
  uint64_t v7 = get_DKApplicationActivityMetadataKeyClass_softClass_0;
  if (!get_DKApplicationActivityMetadataKeyClass_softClass_0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __get_DKApplicationActivityMetadataKeyClass_block_invoke_0;
    v3[3] = &unk_2644BC768;
    void v3[4] = &v4;
    __get_DKApplicationActivityMetadataKeyClass_block_invoke_0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E7CF728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E7CFB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CoreDuetLibraryCore_2()
{
  if (!CoreDuetLibraryCore_frameworkLibrary_2) {
    CoreDuetLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  return CoreDuetLibraryCore_frameworkLibrary_2;
}

uint64_t __CoreDuetLibraryCore_block_invoke_2()
{
  uint64_t result = _sl_dlopen();
  CoreDuetLibraryCore_frameworkLibrary_2 = result;
  return result;
}

void CoreDuetLibrary_2()
{
  if (!CoreDuetLibraryCore_2())
  {
    uint64_t v0 = (void *)abort_report_np();
    free(v0);
  }
}

void OUTLINED_FUNCTION_1_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3_1(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return *(void *)(v0 + 32);
}

void OUTLINED_FUNCTION_6_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t RECompareFeatureValues(unint64_t a1, void *a2)
{
  unint64_t v3 = a1;
  uint64_t v4 = REFeatureValueTypeForTaggedPointer(a1);
  uint64_t v6 = REFeatureValueTypeForTaggedPointer((unint64_t)a2);
  switch(v4)
  {
    case 0:
      unsigned int v7 = REBooleanValueForTaggedPointer(v3);
      unsigned int v8 = v7;
      switch(v6)
      {
        case 0:
          int v9 = REBooleanValueForTaggedPointer((unint64_t)a2);
          char v10 = v8 & (v9 ^ 1);
          uint64_t v11 = v9 & ~v8;
          goto LABEL_65;
        case 1:
          unint64_t v49 = REIntegerValueForTaggedPointer((unint64_t)a2);
          if (v49 <= v8) {
            uint64_t v50 = 0;
          }
          else {
            uint64_t v50 = -1;
          }
          if (v49 >= v8) {
            return v50;
          }
          else {
            return 1;
          }
        case 2:
          double v41 = (double)v7;
LABEL_60:
          double v51 = REDoubleValueForTaggedPointer(a2, v5);
          if (v51 < v41) {
            return 1;
          }
          if (v51 > v41) {
            return -1;
          }
          return 0;
        case 3:
          id v52 = REStringValueForTaggedPointer((unint64_t)a2);
          int v53 = [v52 BOOLValue];

          char v10 = v8 & (v53 ^ 1);
          uint64_t v11 = v53 & ~v8;
LABEL_65:
          uint64_t v54 = v11 << 63 >> 63;
          if (v10) {
            return 1;
          }
          else {
            return v54;
          }
        case 4:
LABEL_17:
          uint64_t v20 = RESetValueForTaggedPointer(a2);
          uint64_t v23 = [v20 anyObject];
          uint64_t v24 = (const void *)RECreateFeatureValueTaggedPointer(v23);

          unint64_t v25 = v3;
          goto LABEL_20;
        default:
          goto LABEL_4;
      }
    case 1:
LABEL_6:
      uint64_t v15 = REIntegerValueForTaggedPointer(v3);
      unint64_t v16 = v15;
      switch(v6)
      {
        case 0:
          unsigned int v17 = REBooleanValueForTaggedPointer((unint64_t)a2);
          if (v16 >= v17) {
            uint64_t v18 = 0;
          }
          else {
            uint64_t v18 = -1;
          }
          if (v16 <= v17) {
            return v18;
          }
          else {
            return 1;
          }
        case 1:
          unint64_t v38 = REIntegerValueForTaggedPointer((unint64_t)a2);
          BOOL v39 = v16 >= v38;
          BOOL v40 = v16 > v38;
          goto LABEL_36;
        case 2:
          double v41 = (double)(unint64_t)v15;
          goto LABEL_60;
        case 3:
          uint64_t v42 = REStringValueForTaggedPointer((unint64_t)a2);
          unint64_t v43 = [v42 longLongValue];

          BOOL v39 = v16 >= v43;
          BOOL v40 = v16 > v43;
LABEL_36:
          if (v39) {
            uint64_t v44 = 0;
          }
          else {
            uint64_t v44 = -1;
          }
          if (v40) {
            unint64_t v3 = 1;
          }
          else {
            unint64_t v3 = v44;
          }
          break;
        case 4:
          goto LABEL_17;
        default:
          goto LABEL_13;
      }
      return v3;
    case 2:
LABEL_4:
      double v13 = REDoubleValueForTaggedPointer((void *)v3, v5);
      switch(v6)
      {
        case 0:
          double v14 = (double)REBooleanValueForTaggedPointer((unint64_t)a2);
          goto LABEL_43;
        case 1:
          double v14 = (double)(unint64_t)REIntegerValueForTaggedPointer((unint64_t)a2);
LABEL_43:
          if (v13 > v14) {
            return 1;
          }
          if (v13 < v14) {
            return -1;
          }
          return 0;
        case 2:
          double v45 = REDoubleValueForTaggedPointer(a2, v12);
          goto LABEL_48;
        case 3:
          id v46 = REStringValueForTaggedPointer((unint64_t)a2);
          [v46 doubleValue];
          double v45 = v47;

LABEL_48:
          uint64_t v48 = -1;
          if (v13 >= v45) {
            uint64_t v48 = 0;
          }
          if (v13 <= v45) {
            return v48;
          }
          else {
            return 1;
          }
        case 4:
          goto LABEL_17;
        default:
          goto LABEL_6;
      }
    case 3:
LABEL_13:
      long long v19 = REStringValueForTaggedPointer(v3);
      uint64_t v20 = v19;
      switch(v6)
      {
        case 0:
          int v21 = [v19 BOOLValue];
          int v22 = REBooleanValueForTaggedPointer((unint64_t)a2);
          if (!v21 || v22) {
            unint64_t v3 = (uint64_t)((unint64_t)(v22 & ~v21) << 63) >> 63;
          }
          else {
            unint64_t v3 = 1;
          }
          goto LABEL_31;
        case 1:
          unint64_t v27 = [v19 longLongValue];
          unint64_t v28 = REIntegerValueForTaggedPointer((unint64_t)a2);
          if (v27 >= v28) {
            uint64_t v29 = 0;
          }
          else {
            uint64_t v29 = -1;
          }
          if (v27 <= v28) {
            unint64_t v3 = v29;
          }
          else {
            unint64_t v3 = 1;
          }
          goto LABEL_31;
        case 2:
          [v19 doubleValue];
          double v31 = v30;
          double v33 = REDoubleValueForTaggedPointer(a2, v32);
          uint64_t v55 = -1;
          if (v31 >= v33) {
            uint64_t v55 = 0;
          }
          if (v31 <= v33) {
            unint64_t v3 = v55;
          }
          else {
            unint64_t v3 = 1;
          }
          goto LABEL_31;
        case 3:
          unsigned int v34 = REStringValueForTaggedPointer((unint64_t)a2);
          unint64_t v3 = [v20 localizedCompare:v34];
          goto LABEL_30;
        case 4:
          unsigned int v34 = RESetValueForTaggedPointer(a2);
          unsigned int v35 = [v34 anyObject];
          unsigned int v36 = (const void *)RECreateFeatureValueTaggedPointer(v35);

          unint64_t v3 = RECompareFeatureValues(v3, v36);
          REReleaseFeatureValueTaggedPointer(v36);
LABEL_30:

          break;
        default:

          goto LABEL_19;
      }
      goto LABEL_31;
    case 4:
LABEL_19:
      uint64_t v20 = RESetValueForTaggedPointer((void *)v3);
      long long v26 = [v20 anyObject];
      uint64_t v24 = (const void *)RECreateFeatureValueTaggedPointer(v26);

      unint64_t v25 = (unint64_t)a2;
LABEL_20:
      unint64_t v3 = RECompareFeatureValues(v25, v24);
      REReleaseFeatureValueTaggedPointer(v24);
LABEL_31:

      break;
    default:
      return v3;
  }
  return v3;
}

void REEnsureFeature(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (!a1) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Feature must be non-nil", a3, a4, a5, a6, a7, a8, a9);
  }
}

uint64_t sub_21E7D0AC8()
{
  uint64_t v0 = sub_21E7D9BD0();
  __swift_allocate_value_buffer(v0, qword_267D45070);
  __swift_project_value_buffer(v0, (uint64_t)qword_267D45070);
  return sub_21E7D9BC0();
}

uint64_t sub_21E7D0B44()
{
  if (qword_267D45058 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_21E7D9BD0();
  return __swift_project_value_buffer(v0, (uint64_t)qword_267D45070);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_21E7D0C50@<X0>(uint64_t a1@<X8>)
{
  return sub_21E7D1050(&OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_wakeupTime, a1);
}

uint64_t sub_21E7D0C5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D44548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_21E7D0D14(uint64_t a1)
{
  return sub_21E7D11F8(a1, &OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_wakeupTime);
}

uint64_t sub_21E7D0D20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D44548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E7D0D88(void **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x60))();
}

uint64_t sub_21E7D0DDC(uint64_t a1, void **a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D44548);
  MEMORY[0x270FA5388]();
  id v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E7D0C5C(a1, (uint64_t)v5);
  return (*(uint64_t (**)(char *))((*MEMORY[0x263F8EED0] & **a2) + 0x68))(v5);
}

uint64_t (*sub_21E7D0E9C())()
{
  return j__swift_endAccess;
}

id sub_21E7D0F08(uint64_t a1, uint64_t a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D44548);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = a1 + *a3;
  swift_beginAccess();
  sub_21E7D0C5C(v7, (uint64_t)v6);
  uint64_t v8 = sub_21E7D9B40();
  uint64_t v9 = *(void *)(v8 - 8);
  char v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    char v10 = (void *)sub_21E7D9B10();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  return v10;
}

uint64_t sub_21E7D1044@<X0>(uint64_t a1@<X8>)
{
  return sub_21E7D1050(&OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_bedtime, a1);
}

uint64_t sub_21E7D1050@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *a1;
  swift_beginAccess();
  return sub_21E7D0C5C(v4, a2);
}

void sub_21E7D10AC(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D44548);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_21E7D9B30();
    uint64_t v9 = sub_21E7D9B40();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = sub_21E7D9B40();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  uint64_t v11 = (uint64_t)a1 + *a4;
  swift_beginAccess();
  id v12 = a1;
  sub_21E7D0D20((uint64_t)v8, v11);
  swift_endAccess();
}

uint64_t sub_21E7D11EC(uint64_t a1)
{
  return sub_21E7D11F8(a1, &OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_bedtime);
}

uint64_t sub_21E7D11F8(uint64_t a1, void *a2)
{
  uint64_t v4 = v2 + *a2;
  swift_beginAccess();
  sub_21E7D0D20(a1, v4);
  return swift_endAccess();
}

uint64_t sub_21E7D1250(void **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x78))();
}

uint64_t sub_21E7D12A4(uint64_t a1, void **a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D44548);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21E7D0C5C(a1, (uint64_t)v5);
  return (*(uint64_t (**)(char *))((*MEMORY[0x263F8EED0] & **a2) + 0x80))(v5);
}

uint64_t (*sub_21E7D1364())()
{
  return j_j__swift_endAccess;
}

id sub_21E7D13C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = (char *)objc_allocWithZone(v3);
  uint64_t v7 = (uint64_t)&v6[OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_wakeupTime];
  uint64_t v8 = sub_21E7D9B40();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
  v9(v7, 1, 1, v8);
  uint64_t v10 = (uint64_t)&v6[OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_bedtime];
  v9((uint64_t)&v6[OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_bedtime], 1, 1, v8);
  swift_beginAccess();
  uint64_t v11 = v6;
  sub_21E7D151C(a1, v7);
  swift_endAccess();
  swift_beginAccess();
  sub_21E7D151C(a2, v10);
  swift_endAccess();

  v14.receiver = v11;
  v14.super_class = v3;
  id v12 = objc_msgSendSuper2(&v14, sel_init);
  sub_21E7D1584(a2);
  sub_21E7D1584(a1);
  return v12;
}

uint64_t sub_21E7D151C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D44548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E7D1584(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D44548);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for RESleepScheduleEntry()
{
  uint64_t result = qword_267D45060;
  if (!qword_267D45060) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id RESleepScheduleEntry.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void RESleepScheduleEntry.init()()
{
}

id RESleepScheduleEntry.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RESleepScheduleEntry();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21E7D1B5C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_21E7D1C30(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_21E7D4404((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_21E7D4404((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0(v12);
  return v7;
}

uint64_t sub_21E7D1C30(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_21E7D9C50();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_21E7D1DEC(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_21E7D9C90();
  if (!v8)
  {
    sub_21E7D9CA0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_21E7D9CC0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_21E7D1DEC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_21E7D1E84(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_21E7D2064(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_21E7D2064(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21E7D1E84(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_21E7D1FFC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_21E7D9C70();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_21E7D9CA0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_21E7D9C00();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_21E7D9CC0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_21E7D9CA0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_21E7D1FFC(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D44560);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21E7D2064(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D44560);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_21E7D9CC0();
  __break(1u);
  return result;
}

uint64_t sub_21E7D21B4(uint64_t a1)
{
  uint64_t v2 = sub_21E7D9B80();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  double v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267D44588);
    uint64_t v9 = sub_21E7D9C60();
    uint64_t v10 = 0;
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    unsigned int v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    double v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_21E7D450C(&qword_267D44590, MEMORY[0x263F07908]);
      uint64_t v16 = sub_21E7D9BE0();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_21E7D450C(&qword_267D44598, MEMORY[0x263F07908]);
          char v23 = sub_21E7D9BF0();
          uint64_t v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        unint64_t v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return v9;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

void sub_21E7D24CC(char *a1, void *a2)
{
  id v143 = a2;
  v139 = a1;
  uint64_t v129 = sub_21E7D9BD0();
  v134 = *(void (***)(char *, uint64_t))(v129 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v129);
  v127 = (char *)v106 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  v128 = (char *)v106 - v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D44568);
  MEMORY[0x270FA5388](v5 - 8);
  v121 = (char *)v106 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_21E7D9B80();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v7);
  v138 = (char *)v106 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v141 = sub_21E7D9B00();
  uint64_t v111 = *(void *)(v141 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v141);
  v142 = (char *)v106 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v120 = (char *)v106 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v125 = (char *)v106 - v16;
  MEMORY[0x270FA5388](v15);
  v140 = (char *)v106 - v17;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D44548);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  uint64_t v109 = (uint64_t)v106 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v122 = (uint64_t)v106 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  unint64_t v25 = (char *)v106 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)v106 - v26;
  uint64_t v28 = sub_21E7D9B50();
  uint64_t v29 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  double v31 = (char *)v106 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = sub_21E7D9BA0();
  uint64_t v110 = *(void *)(v124 - 8);
  MEMORY[0x270FA5388](v124);
  uint64_t v33 = (char *)v106 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v29 + 104))(v31, *MEMORY[0x263F07740], v28);
  sub_21E7D9B60();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v28);
  uint64_t v34 = sub_21E7D9B40();
  uint64_t v35 = *(void *)(v34 - 8);
  uint64_t v36 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v35 + 56);
  uint64_t v37 = v35 + 56;
  v126 = v27;
  v36(v27, 1, 1, v34);
  v123 = v25;
  uint64_t v108 = v34;
  std::vector<std::string> v107 = v36;
  v106[1] = v37;
  v36(v25, 1, 1, v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267D44570);
  uint64_t v38 = *(void *)(v8 + 72);
  unint64_t v39 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = xmmword_21E7EABA0;
  unint64_t v41 = v40 + v39;
  uint64_t v42 = *(void (**)(unint64_t, void, uint64_t))(v9 + 104);
  v42(v41, *MEMORY[0x263F078A0], v7);
  v42(v41 + v38, *MEMORY[0x263F078A8], v7);
  v42(v41 + 2 * v38, *MEMORY[0x263F07870], v7);
  sub_21E7D21B4(v40);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_21E7D9B70();
  swift_bridgeObjectRelease();
  unint64_t v43 = v138;
  v42((unint64_t)v138, *MEMORY[0x263F078E8], v7);
  v139 = v33;
  sub_21E7D9B90();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v43, v7);
  HKSPDayForNSGregorianCalendarDay();
  uint64_t v44 = HKSPWeekdaysFromDay();
  id v45 = objc_msgSend(v143, sel_occurrences);
  sub_21E7D4464();
  unint64_t v46 = sub_21E7D9C10();

  if (v46 >> 62)
  {
LABEL_25:
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_21E7D9CB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v48 = *(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v49 = v125;
  if (v48)
  {
    if (v48 >= 1)
    {
      uint64_t v50 = 0;
      unint64_t v51 = v46 & 0xC000000000000001;
      v119 = (void (**)(uint64_t, unint64_t))(v111 + 16);
      v137 = (void (**)(char *, void, uint64_t, uint64_t))(v110 + 56);
      v138 = (char *)(v110 + 16);
      v135 = (void (**)(char *, uint64_t, uint64_t))(v134 + 2);
      v136 = (void (**)(uint64_t, unint64_t))(v111 + 8);
      ++v134;
      long long v114 = &v145;
      id v52 = &selRef_enumerateValuesForKey_usingBlock_;
      *(void *)&long long v47 = 136315138;
      long long v113 = v47;
      uint64_t v112 = MEMORY[0x263F8EE58] + 8;
      uint64_t v117 = v44;
      unint64_t v116 = v46;
      uint64_t v115 = v48;
      unint64_t v118 = v46 & 0xC000000000000001;
      while (1)
      {
        if (v51) {
          id v53 = (id)MEMORY[0x223C30650](v50, v46);
        }
        else {
          id v53 = *(id *)(v46 + 8 * v50 + 32);
        }
        uint64_t v54 = v53;
        if ((v44 & ~(unint64_t)[v53 v52[283]]) != 0)
        {
        }
        else
        {
          uint64_t v130 = v50;
          v133 = *v119;
          unint64_t v46 = v141;
          ((void (*)(char *, char *, uint64_t))v133)(v49, v140, v141);
          v132 = *(void (**)(char *, uint64_t))v138;
          uint64_t v55 = v121;
          id v143 = v54;
          uint64_t v56 = v124;
          ((void (*)(char *, char *, uint64_t))v132)(v121, v139, v124);
          v131 = *v137;
          v131(v55, 0, 1, v56);
          swift_beginAccess();
          sub_21E7D9AF0();
          swift_endAccess();
          id v57 = objc_msgSend(v143, sel_wakeUpComponents);
          uint64_t v44 = (uint64_t)v120;
          sub_21E7D9A70();

          sub_21E7D9AB0();
          unint64_t v58 = *v136;
          (*v136)(v44, v46);
          swift_beginAccess();
          sub_21E7D9AC0();
          swift_endAccess();
          id v59 = objc_msgSend(v143, sel_wakeUpComponents);
          sub_21E7D9A70();

          sub_21E7D9AD0();
          v58(v44, v46);
          swift_beginAccess();
          sub_21E7D9AE0();
          swift_endAccess();
          ((void (*)(char *, char *, unint64_t))v133)(v142, v140, v46);
          ((void (*)(char *, char *, uint64_t))v132)(v55, v139, v56);
          id v60 = v143;
          v131(v55, 0, 1, v56);
          swift_beginAccess();
          sub_21E7D9AF0();
          swift_endAccess();
          id v61 = objc_msgSend(v60, sel_bedtimeComponents);
          sub_21E7D9A70();

          sub_21E7D9AB0();
          v58(v44, v46);
          swift_beginAccess();
          sub_21E7D9AC0();
          swift_endAccess();
          id v62 = objc_msgSend(v60, sel_bedtimeComponents);
          sub_21E7D9A70();

          sub_21E7D9AD0();
          v133 = v58;
          v58(v44, v46);
          swift_beginAccess();
          sub_21E7D9AE0();
          swift_endAccess();
          swift_beginAccess();
          uint64_t v63 = sub_21E7D9A80();
          char v65 = v64;
          swift_endAccess();
          unint64_t v66 = v128;
          uint64_t v67 = v129;
          if ((v65 & 1) == 0 && objc_msgSend(v60, sel_crossesDayBoundary))
          {
            if (__OFSUB__(v63, 1))
            {
              __break(1u);
              goto LABEL_25;
            }
            swift_beginAccess();
            sub_21E7D9A90();
            swift_endAccess();
          }
          uint64_t v68 = sub_21E7D0B44();
          long long v69 = *v135;
          (*v135)(v66, v68, v67);
          uint64_t v70 = v67;
          long long v71 = sub_21E7D9BB0();
          os_log_type_t v72 = sub_21E7D9C20();
          if (os_log_type_enabled(v71, v72))
          {
            uint64_t v73 = v69;
            uint64_t v74 = (uint8_t *)swift_slowAlloc();
            uint64_t v75 = swift_slowAlloc();
            uint64_t v146 = v75;
            *(_DWORD *)uint64_t v74 = v113;
            sub_21E7D450C(&qword_267D44580, MEMORY[0x263F063B0]);
            uint64_t v76 = sub_21E7D9CD0();
            uint64_t v144 = sub_21E7D1B5C(v76, v77, &v146);
            sub_21E7D9C40();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_21E6E6000, v71, v72, "The bedtime(startDate) is %s", v74, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x223C31B10](v75, -1, -1);
            int v78 = v74;
            long long v69 = v73;
            MEMORY[0x223C31B10](v78, -1, -1);

            unint64_t v79 = *v134;
            (*v134)(v128, v70);
          }
          else
          {

            unint64_t v79 = *v134;
            (*v134)(v66, v70);
          }
          uint64_t v80 = v70;
          uint64_t v50 = v130;
          unint64_t v81 = v127;
          v69(v127, v68, v80);
          v82 = sub_21E7D9BB0();
          os_log_type_t v83 = sub_21E7D9C20();
          if (os_log_type_enabled(v82, v83))
          {
            std::string::size_type v84 = (uint8_t *)swift_slowAlloc();
            uint64_t v85 = swift_slowAlloc();
            uint64_t v146 = v85;
            v132 = v79;
            *(_DWORD *)std::string::size_type v84 = v113;
            sub_21E7D450C(&qword_267D44580, MEMORY[0x263F063B0]);
            long long v86 = v125;
            uint64_t v87 = v141;
            uint64_t v88 = sub_21E7D9CD0();
            uint64_t v144 = sub_21E7D1B5C(v88, v89, &v146);
            uint64_t v90 = v87;
            sub_21E7D9C40();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_21E6E6000, v82, v83, "The wakeup(endDate) time is %s", v84, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x223C31B10](v85, -1, -1);
            MEMORY[0x223C31B10](v84, -1, -1);

            v132(v127, v129);
          }
          else
          {

            v79(v81, v80);
            uint64_t v90 = v141;
            long long v86 = v125;
          }
          uint64_t v44 = v117;
          unint64_t v46 = v116;
          uint64_t v48 = v115;
          v91 = v133;
          uint64_t v92 = v122;
          sub_21E7D9AA0();
          uint64_t v93 = (uint64_t)v126;
          sub_21E7D1584((uint64_t)v126);
          sub_21E7D44A4(v92, v93);
          std::vector<std::string>::pointer v94 = v142;
          sub_21E7D9AA0();

          uint64_t v95 = (uint64_t)v123;
          sub_21E7D1584((uint64_t)v123);
          sub_21E7D44A4(v92, v95);
          v91((uint64_t)v94, v90);
          v91((uint64_t)v86, v90);
          unint64_t v49 = v86;
          unint64_t v51 = v118;
          id v52 = &selRef_enumerateValuesForKey_usingBlock_;
        }
        if (v48 == ++v50) {
          goto LABEL_23;
        }
      }
    }
    __break(1u);
  }
  else
  {
LABEL_23:
    swift_bridgeObjectRelease();
    uint64_t v96 = v122;
    sub_21E7D0C5C((uint64_t)v126, v122);
    uint64_t v97 = (uint64_t)v123;
    uint64_t v98 = v109;
    sub_21E7D0C5C((uint64_t)v123, v109);
    v99 = (objc_class *)type metadata accessor for RESleepScheduleEntry();
    v100 = (char *)objc_allocWithZone(v99);
    uint64_t v101 = (uint64_t)&v100[OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_wakeupTime];
    uint64_t v102 = v108;
    unint64_t v103 = v107;
    v107(&v100[OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_wakeupTime], 1, 1, v108);
    uint64_t v104 = (uint64_t)&v100[OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_bedtime];
    v103(&v100[OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_bedtime], 1, 1, v102);
    swift_beginAccess();
    v105 = v100;
    sub_21E7D151C(v96, v101);
    swift_endAccess();
    swift_beginAccess();
    sub_21E7D151C(v98, v104);
    swift_endAccess();

    v145.receiver = v105;
    v145.super_class = v99;
    objc_msgSendSuper2(&v145, sel_init);
    sub_21E7D1584(v98);
    sub_21E7D1584(v96);
    (*(void (**)(char *, uint64_t))(v111 + 8))(v140, v141);
    sub_21E7D1584(v97);
    sub_21E7D1584((uint64_t)v126);
    (*(void (**)(char *, uint64_t))(v110 + 8))(v139, v124);
  }
}

id _s15RelevanceEngine20RESleepScheduleEntryC05sleepE8ForDates7current4next8scheduleAC10Foundation4DateV_AJSo09HKSPSleepD0CtFZ_0(char *a1, char *a2, void *a3)
{
  v119 = a3;
  uint64_t v102 = a2;
  uint64_t v108 = a1;
  uint64_t v3 = sub_21E7D9B40();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  v100 = (char *)v94 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  unint64_t v103 = (char *)v94 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v110 = (char *)v94 - v9;
  uint64_t v10 = sub_21E7D9BD0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v112 = v10;
  uint64_t v113 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v101 = (char *)v94 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v99 = (char *)v94 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v111 = (char *)v94 - v16;
  uint64_t v17 = sub_21E7D9B50();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)v94 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = sub_21E7D9BA0();
  uint64_t v117 = *(void *)(v109 - 8);
  MEMORY[0x270FA5388](v109);
  uint64_t v22 = (char *)v94 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D44548);
  uint64_t v24 = MEMORY[0x270FA5388](v23 - 8);
  v105 = (char *)v94 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v104 = (void (*)(char *, char *, uint64_t))((char *)v94 - v27);
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  uint64_t v107 = (uint64_t)v94 - v29;
  uint64_t v30 = MEMORY[0x270FA5388](v28);
  uint64_t v32 = (char *)v94 - v31;
  uint64_t v33 = MEMORY[0x270FA5388](v30);
  uint64_t v35 = (char *)v94 - v34;
  MEMORY[0x270FA5388](v33);
  uint64_t v106 = v4;
  uint64_t v36 = *(void (**)(void))(v4 + 56);
  uint64_t v114 = (uint64_t)v94 - v37;
  v36();
  uint64_t v38 = (uint64_t)v35;
  uint64_t v118 = v3;
  uint64_t v39 = v3;
  uint64_t v40 = v119;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v36)(v35, 1, 1, v39);
  (*(void (**)(char *, void, uint64_t))(v18 + 104))(v20, *MEMORY[0x263F07740], v17);
  unint64_t v116 = v22;
  sub_21E7D9B60();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  unsigned int v41 = objc_msgSend(v40, sel_isEnabled);
  uint64_t v115 = v35;
  if (v41)
  {
    v105 = v32;
    uint64_t v42 = sub_21E7D0B44();
    uint64_t v43 = v113;
    uint64_t v44 = *(void (**)(char *, uint64_t, uint64_t))(v113 + 16);
    uint64_t v96 = v42;
    uint64_t v98 = v113 + 16;
    uint64_t v97 = v44;
    ((void (*)(char *))v44)(v111);
    uint64_t v45 = v106;
    unint64_t v46 = v108;
    uint64_t v47 = v118;
    uint64_t v104 = *(void (**)(char *, char *, uint64_t))(v106 + 16);
    v104(v110, v108, v118);
    uint64_t v48 = sub_21E7D9BB0();
    os_log_type_t v49 = sub_21E7D9C20();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      uint64_t v95 = swift_slowAlloc();
      v122[0] = v95;
      *(_DWORD *)uint64_t v50 = 136315138;
      v94[1] = v50 + 4;
      sub_21E7D450C(&qword_267D44558, MEMORY[0x263F07490]);
      uint64_t v51 = v45;
      id v52 = v110;
      uint64_t v53 = sub_21E7D9CD0();
      uint64_t v120 = sub_21E7D1B5C(v53, v54, v122);
      unint64_t v46 = v108;
      sub_21E7D9C40();
      swift_bridgeObjectRelease();
      uint64_t v55 = v52;
      uint64_t v45 = v51;
      uint64_t v110 = *(char **)(v51 + 8);
      ((void (*)(char *, uint64_t))v110)(v55, v47);
      _os_log_impl(&dword_21E6E6000, v48, v49, "Obtaining the schedule for %s", v50, 0xCu);
      uint64_t v56 = v95;
      swift_arrayDestroy();
      MEMORY[0x223C31B10](v56, -1, -1);
      MEMORY[0x223C31B10](v50, -1, -1);
    }
    else
    {
      long long v71 = v110;
      uint64_t v110 = *(char **)(v45 + 8);
      ((void (*)(char *, uint64_t))v110)(v71, v47);
    }

    os_log_type_t v72 = v111;
    uint64_t v73 = v112;
    uint64_t v111 = *(char **)(v43 + 8);
    ((void (*)(char *, uint64_t))v111)(v72, v112);
    uint64_t v74 = v103;
    uint64_t v75 = v119;
    uint64_t v76 = (uint64_t)v105;
    v104(v103, v46, v47);
    sub_21E7D24CC(v46, v75);
    id v66 = v77;
    (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v77) + 0x60))();
    uint64_t v78 = v107;
    sub_21E7D0C5C(v76, v107);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48))(v78, 1, v47) == 1)
    {
      sub_21E7D1584(v78);
    }
    else
    {
      unint64_t v79 = v100;
      (*(void (**)(char *, uint64_t, uint64_t))(v45 + 32))(v100, v78, v47);
      if (sub_21E7D9B20())
      {
        uint64_t v80 = v99;
        v97(v99, v96, v73);
        unint64_t v81 = sub_21E7D9BB0();
        os_log_type_t v82 = sub_21E7D9C20();
        if (os_log_type_enabled(v81, v82))
        {
          os_log_type_t v83 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)os_log_type_t v83 = 0;
          _os_log_impl(&dword_21E6E6000, v81, v82, "Gettng the bedtime for currentDate", v83, 2u);
          std::string::size_type v84 = v83;
          uint64_t v80 = v99;
          MEMORY[0x223C31B10](v84, -1, -1);
        }

        ((void (*)(char *, uint64_t))v111)(v80, v73);
        uint64_t v85 = (void (*)(char *, uint64_t))v110;
        ((void (*)(char *, uint64_t))v110)(v79, v47);
        sub_21E7D1584(v76);
        v85(v74, v47);
        uint64_t v67 = v109;
        goto LABEL_16;
      }
      ((void (*)(char *, uint64_t))v110)(v79, v47);
    }
    uint64_t v67 = v109;
    long long v86 = v101;
    v97(v101, v96, v73);
    uint64_t v87 = sub_21E7D9BB0();
    os_log_type_t v88 = sub_21E7D9C20();
    if (os_log_type_enabled(v87, v88))
    {
      unint64_t v89 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v89 = 0;
      _os_log_impl(&dword_21E6E6000, v87, v88, "Now is after currentDate's wakeupTime. gettng the bedtime for nextOccurrence", v89, 2u);
      uint64_t v90 = v89;
      uint64_t v75 = v119;
      MEMORY[0x223C31B10](v90, -1, -1);
    }

    ((void (*)(char *, uint64_t))v111)(v86, v73);
    sub_21E7D24CC(v102, v75);
    uint64_t v92 = v91;

    sub_21E7D1584((uint64_t)v105);
    ((void (*)(char *, uint64_t))v110)(v74, v47);
    id v66 = v92;
LABEL_16:
    uint64_t v68 = v116;
    uint64_t v69 = v117;
    uint64_t v57 = v114;
    uint64_t v70 = (uint64_t)v115;
    goto LABEL_17;
  }
  uint64_t v57 = v114;
  unint64_t v58 = v104;
  sub_21E7D0C5C(v114, (uint64_t)v104);
  uint64_t v59 = (uint64_t)v105;
  sub_21E7D0C5C(v38, (uint64_t)v105);
  id v60 = (objc_class *)type metadata accessor for RESleepScheduleEntry();
  id v61 = (char *)objc_allocWithZone(v60);
  uint64_t v62 = (uint64_t)&v61[OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_wakeupTime];
  uint64_t v63 = v118;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v36)(&v61[OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_wakeupTime], 1, 1, v118);
  uint64_t v64 = (uint64_t)&v61[OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_bedtime];
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v36)(&v61[OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_bedtime], 1, 1, v63);
  swift_beginAccess();
  char v65 = v61;
  sub_21E7D151C((uint64_t)v58, v62);
  swift_endAccess();
  swift_beginAccess();
  sub_21E7D151C(v59, v64);
  swift_endAccess();

  v121.receiver = v65;
  v121.super_class = v60;
  id v66 = objc_msgSendSuper2(&v121, sel_init);
  sub_21E7D1584(v59);
  sub_21E7D1584((uint64_t)v58);
  uint64_t v67 = v109;
  uint64_t v68 = v116;
  uint64_t v69 = v117;
  uint64_t v70 = (uint64_t)v115;
LABEL_17:
  (*(void (**)(char *, uint64_t))(v69 + 8))(v68, v67);
  sub_21E7D1584(v70);
  sub_21E7D1584(v57);
  return v66;
}

uint64_t sub_21E7D4174()
{
  return type metadata accessor for RESleepScheduleEntry();
}

void sub_21E7D417C()
{
  sub_21E7D435C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for RESleepScheduleEntry(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RESleepScheduleEntry);
}

uint64_t dispatch thunk of RESleepScheduleEntry.wakeupTime.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of RESleepScheduleEntry.wakeupTime.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of RESleepScheduleEntry.wakeupTime.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of RESleepScheduleEntry.bedtime.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of RESleepScheduleEntry.bedtime.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of RESleepScheduleEntry.bedtime.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

void sub_21E7D435C()
{
  if (!qword_267D44550)
  {
    sub_21E7D9B40();
    unint64_t v0 = sub_21E7D9C30();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267D44550);
    }
  }
}

uint64_t __swift_destroy_boxed_opaque_existential_0(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return MEMORY[0x270FA0520](*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_21E7D4404(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_21E7D4464()
{
  unint64_t result = qword_267D44578;
  if (!qword_267D44578)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267D44578);
  }
  return result;
}

uint64_t sub_21E7D44A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267D44548);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21E7D450C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __getNLTaggerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[REFeatureMap(REFeatureProvider) featureValueForName:](v0);
}

uint64_t __getISImageDescriptorClass_block_invoke_cold_1()
{
  return __getNanoResourceGrabberClass_block_invoke_cold_1();
}

uint64_t __getNanoResourceGrabberClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getISIconClass_block_invoke_cold_1(v0);
}

uint64_t __getISIconClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __43__REUpNextSiriServer__accessRemoteClients___block_invoke_2_cold_1(v0);
}

uint64_t __getHKUnitClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __54__REActiveWorkoutPredictor__queue_fetchWorkoutHistory__block_invoke_cold_1(v0);
}

uint64_t __getHKObserverQueryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKSampleTypeClass_block_invoke_cold_1(v0);
}

uint64_t __getHKSampleTypeClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKQueryClass_block_invoke_cold_1(v0);
}

uint64_t __getHKQueryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKSourceClass_block_invoke_cold_1(v0);
}

uint64_t __getHKSourceClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKSampleQueryClass_block_invoke_cold_1(v0);
}

uint64_t __getHKSampleQueryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKObjectTypeClass_block_invoke_cold_1(v0);
}

uint64_t __getHKObjectTypeClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKHealthStoreClass_block_invoke_cold_1(v0);
}

uint64_t __getHKHealthStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[REDailyRoutinePredictor _queue_didBeginMorningRoutine](v0);
}

uint64_t __getBMBehaviorRetrieverClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getBMItemTypeClass_block_invoke_cold_1(v0);
}

uint64_t __getBMItemTypeClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getBMItemClass_block_invoke_cold_1(v0);
}

uint64_t __getBMItemClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getBMRetrievalFilterClass_block_invoke_cold_1(v0);
}

uint64_t __getBMRetrievalFilterClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getBMBehaviorStorageClass_block_invoke_cold_1(v0);
}

void __getBMBehaviorStorageClass_block_invoke_cold_1()
{
}

void REStoreLogFileForTask_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21E6E6000, log, OS_LOG_TYPE_ERROR, "Unable to store logs for task %@ %@", (uint8_t *)&v3, 0x16u);
}

id __getUIWindowClass_block_invoke_cold_1()
{
  uint64_t v0 = (REImage *)abort_report_np();
  return [(REImage *)v0 copyWithZone:v2];
}

uint64_t __getCSLPRFDefaultAppDataProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getMPRequestResponseControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getMPRequestResponseControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getMPAVRoutingControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getMPAVRoutingControllerClass_block_invoke_cold_1()
{
  return __getMPCPlayerRequestClass_block_invoke_cold_1();
}

uint64_t __getMPCPlayerRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getMPCPlayerPathClass_block_invoke_cold_1(v0);
}

uint64_t __getMPCPlayerPathClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __REProcessIsRelevanced_block_invoke_cold_1(v0);
}

void __REProcessIsRelevanced_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)SEL v1 = 0;
  _os_log_error_impl(&dword_21E6E6000, log, OS_LOG_TYPE_ERROR, "Unable to get SecTaskCreateFromSelf()", v1, 2u);
}

void __REProcessIsRelevanced_block_invoke_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "Unable to get process identifier: %@", (uint8_t *)&v3, 0xCu);
}

void RERaiseInternalException_cold_1(void *a1)
{
  [a1 UTF8String];
  OUTLINED_FUNCTION_5(&dword_21E6E6000, v1, v2, "Internal exception: %s", v3, v4, v5, v6, 2u);
}

void _REGenerateSimulatedCrash_cold_2(void *a1)
{
  [a1 UTF8String];
  OUTLINED_FUNCTION_5(&dword_21E6E6000, v1, v2, "Simulated exception: %s", v3, v4, v5, v6, 2u);
}

uint64_t __getCLKTextProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCLKDateTextProviderClass_block_invoke_cold_1(v0);
}

uint64_t __getCLKDateTextProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCLKRelativeDateTextProviderClass_block_invoke_cold_1(v0);
}

uint64_t __getCLKRelativeDateTextProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCLKSimpleTextProviderClass_block_invoke_cold_1(v0);
}

uint64_t __getCLKSimpleTextProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCLKTimeIntervalTextProviderClass_block_invoke_cold_1(v0);
}

uint64_t __getCLKTimeIntervalTextProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCLKTimeTextProviderClass_block_invoke_cold_1(v0);
}

uint64_t __getCLKTimeTextProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[RELiveElementCoordinator _queue_addElement:toSection:](v0);
}

uint64_t __getBluetoothManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __59__REElement_initWithDictionary_relevanceProviderGenerator___block_invoke_cold_1(v0);
}

uint64_t __getCMMotionActivityManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[REHTTPServer invalidated](v0);
}

uint64_t __getRTRoutineManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCLKImageProviderClass_block_invoke_cold_1(v0);
}

uint64_t __getCLKImageProviderClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[REPortraitPredictor update](v0);
}

uint64_t __getPPNamedEntityStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getPPNamedEntityQueryClass_block_invoke_cold_1(v0);
}

uint64_t __getPPNamedEntityQueryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[REBayesianMLModel _trainWithFeatures:positiveEvent:](v0);
}

uint64_t sub_21E7D9A70()
{
  return MEMORY[0x270EEE760]();
}

uint64_t sub_21E7D9A80()
{
  return MEMORY[0x270EEE768]();
}

uint64_t sub_21E7D9A90()
{
  return MEMORY[0x270EEE780]();
}

uint64_t sub_21E7D9AA0()
{
  return MEMORY[0x270EEE7B0]();
}

uint64_t sub_21E7D9AB0()
{
  return MEMORY[0x270EEE7B8]();
}

uint64_t sub_21E7D9AC0()
{
  return MEMORY[0x270EEE7C8]();
}

uint64_t sub_21E7D9AD0()
{
  return MEMORY[0x270EEE828]();
}

uint64_t sub_21E7D9AE0()
{
  return MEMORY[0x270EEE838]();
}

uint64_t sub_21E7D9AF0()
{
  return MEMORY[0x270EEE8B0]();
}

uint64_t sub_21E7D9B00()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_21E7D9B10()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_21E7D9B20()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_21E7D9B30()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_21E7D9B40()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_21E7D9B50()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_21E7D9B60()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_21E7D9B70()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_21E7D9B80()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_21E7D9B90()
{
  return MEMORY[0x270EF1430]();
}

uint64_t sub_21E7D9BA0()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_21E7D9BB0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_21E7D9BC0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_21E7D9BD0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_21E7D9BE0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_21E7D9BF0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_21E7D9C00()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_21E7D9C10()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_21E7D9C20()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_21E7D9C30()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_21E7D9C40()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_21E7D9C50()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_21E7D9C60()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_21E7D9C70()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_21E7D9C80()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_21E7D9C90()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_21E7D9CA0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_21E7D9CB0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_21E7D9CC0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_21E7D9CD0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

void CFBagAddValue(CFMutableBagRef theBag, const void *value)
{
}

void CFBagApplyFunction(CFBagRef theBag, CFBagApplierFunction applier, void *context)
{
}

Boolean CFBagContainsValue(CFBagRef theBag, const void *value)
{
  return MEMORY[0x270EE4458](theBag, value);
}

CFMutableBagRef CFBagCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFBagCallBacks *callBacks)
{
  return (CFMutableBagRef)MEMORY[0x270EE4468](allocator, capacity, callBacks);
}

CFMutableBagRef CFBagCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFBagRef theBag)
{
  return (CFMutableBagRef)MEMORY[0x270EE4470](allocator, capacity, theBag);
}

CFIndex CFBagGetCount(CFBagRef theBag)
{
  return MEMORY[0x270EE4478](theBag);
}

CFIndex CFBagGetCountOfValue(CFBagRef theBag, const void *value)
{
  return MEMORY[0x270EE4480](theBag, value);
}

void CFBagRemoveValue(CFMutableBagRef theBag, const void *value)
{
}

void CFBinaryHeapAddValue(CFBinaryHeapRef heap, const void *value)
{
}

void CFBinaryHeapApplyFunction(CFBinaryHeapRef heap, CFBinaryHeapApplierFunction applier, void *context)
{
}

Boolean CFBinaryHeapContainsValue(CFBinaryHeapRef heap, const void *value)
{
  return MEMORY[0x270EE44B0](heap, value);
}

CFBinaryHeapRef CFBinaryHeapCreate(CFAllocatorRef allocator, CFIndex capacity, const CFBinaryHeapCallBacks *callBacks, const CFBinaryHeapCompareContext *compareContext)
{
  return (CFBinaryHeapRef)MEMORY[0x270EE44B8](allocator, capacity, callBacks, compareContext);
}

CFIndex CFBinaryHeapGetCount(CFBinaryHeapRef heap)
{
  return MEMORY[0x270EE44C0](heap);
}

const void *__cdecl CFBinaryHeapGetMinimum(CFBinaryHeapRef heap)
{
  return (const void *)MEMORY[0x270EE44C8](heap);
}

void CFBinaryHeapRemoveAllValues(CFBinaryHeapRef heap)
{
}

void CFBinaryHeapRemoveMinimumValue(CFBinaryHeapRef heap)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x270EE4788](cf);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFDictionaryRef CFHTTPMessageCopyAllHeaderFields(CFHTTPMessageRef message)
{
  return (CFDictionaryRef)MEMORY[0x270EE2858](message);
}

CFDataRef CFHTTPMessageCopyBody(CFHTTPMessageRef message)
{
  return (CFDataRef)MEMORY[0x270EE2860](message);
}

CFStringRef CFHTTPMessageCopyHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField)
{
  return (CFStringRef)MEMORY[0x270EE2868](message, headerField);
}

void CFHTTPMessageSetBody(CFHTTPMessageRef message, CFDataRef bodyData)
{
}

void CFHTTPMessageSetHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField, CFStringRef value)
{
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x270EE4A48](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x270EE62D0](data);
}

CGImageRef CGImageCreateCopy(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6740](image);
}

CGImageRef CGImageCreateWithPNGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6770](source, decode, shouldInterpolate, *(void *)&intent);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

void CGImageRelease(CGImageRef image)
{
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x270EE7460]((__n128)coord, *(__n128 *)&coord.longitude);
}

uint64_t HKSPDayForNSGregorianCalendarDay()
{
  return MEMORY[0x270F72FD0]();
}

uint64_t HKSPWeekdaysFromDay()
{
  return MEMORY[0x270F73140]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE20]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x270EE5598](typePtr, sizep, alignp);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x270EF2BB8]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x270EF2C18](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFHTTPServerConnectionIsValid()
{
  return MEMORY[0x270EE29D0]();
}

uint64_t _CFHTTPServerConnectionSetClient()
{
  return MEMORY[0x270EE29D8]();
}

uint64_t _CFHTTPServerConnectionSetDispatchQueue()
{
  return MEMORY[0x270EE29E0]();
}

uint64_t _CFHTTPServerCopyProperty()
{
  return MEMORY[0x270EE29E8]();
}

uint64_t _CFHTTPServerCreateService()
{
  return MEMORY[0x270EE29F8]();
}

uint64_t _CFHTTPServerIsValid()
{
  return MEMORY[0x270EE2A08]();
}

uint64_t _CFHTTPServerRequestCopyBodyStream()
{
  return MEMORY[0x270EE2A10]();
}

uint64_t _CFHTTPServerRequestCopyProperty()
{
  return MEMORY[0x270EE2A18]();
}

uint64_t _CFHTTPServerRequestCreateResponseMessage()
{
  return MEMORY[0x270EE2A20]();
}

uint64_t _CFHTTPServerResponseCreateWithData()
{
  return MEMORY[0x270EE2A30]();
}

uint64_t _CFHTTPServerResponseSetClient()
{
  return MEMORY[0x270EE2A40]();
}

uint64_t _CFHTTPServerSetDispatchQueue()
{
  return MEMORY[0x270EE2A48]();
}

uint64_t _LSCopyAdvertisementStringForTeamIdentifierAndActivityType()
{
  return MEMORY[0x270EE85A0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string::reference std::string::at(std::string *this, std::string::size_type __n)
{
  return (std::string::reference)MEMORY[0x270F98478](this, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x270F98638]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x270F98640]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x270F98650]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x270F98658]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x270F98678]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x270F986B0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98768]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F98790]();
}

{
  return MEMORY[0x270F987A0]();
}

{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987C0]();
}

{
  return MEMORY[0x270F987D0]();
}

{
  return MEMORY[0x270F987E0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

uint64_t std::__sort<std::__less<unsigned short,unsigned short> &,unsigned short *>()
{
  return MEMORY[0x270F98C00]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x270F98DF8](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

double atof(const char *a1)
{
  MEMORY[0x270ED86E0](a1);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x270F9A400](cls, name, imp, types);
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x270F9A420](cls, protocol);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x270F9A438](cls, outCount);
}

Protocol **__cdecl class_copyProtocolList(Class cls, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x270F9A440](cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A450](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A460](cls, name);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x270F9A478](cls, name);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return (IMP)MEMORY[0x270F9A4A8](cls, name, imp, types);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9280](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x270ED9320](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x270ED9470](queue);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x270ED95B8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x270EDA0B0](__x);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x270F9A4F0](m);
}

unsigned int method_getNumberOfArguments(Method m)
{
  return MEMORY[0x270F9A500](m);
}

void method_getReturnType(Method m, char *dst, size_t dst_len)
{
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x270F9A510](m);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x270EDA750](*(void *)&val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL object_isClass(id obj)
{
  return MEMORY[0x270F9AA68](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x270EDAAF0]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x270EDAB08]();
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x270F9AA98](property);
}

BOOL protocol_conformsToProtocol(Protocol *proto, Protocol *other)
{
  return MEMORY[0x270F9AAA8](proto, other);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x270F9AAB0](p, isRequiredMethod, isInstanceMethod, outCount);
}

objc_property_t *__cdecl protocol_copyPropertyList(Protocol *proto, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x270F9AAB8](proto, outCount);
}

Protocol **__cdecl protocol_copyProtocolList(Protocol *proto, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x270F9AAC0](proto, outCount);
}

BOOL protocol_isEqual(Protocol *proto, Protocol *other)
{
  return MEMORY[0x270F9AAD8](proto, other);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFC8](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x270EDAFD0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFD8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF0](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF8](a1);
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

uint64_t sandbox_check()
{
  return MEMORY[0x270EDB290]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB718](__str, __endptr, *(void *)&__base);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

void vDSP_sveD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x270EDBCE8](activity, state);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}