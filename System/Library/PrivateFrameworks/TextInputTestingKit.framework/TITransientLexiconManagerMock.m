@interface TITransientLexiconManagerMock
+ (id)getEntries:(_LXLexicon *)a3;
+ (id)tokenizeEntity:(id)a3;
- (BOOL)isSupplementalLexiconSearchEnabled;
- (BOOL)searchForWord:(id)a3;
- (BOOL)searchForWordCaseInsensitive:(id)a3;
- (BOOL)searchHelper:(_LXLexicon *)a3 forWord:(__CFString *)a4 caseSensitive:(BOOL)a5;
- (NSArray)observers;
- (TITransientLexiconManagerMock)init;
- (TITransientLexiconManagerMock)initWithTransientData:(id)a3 namedEntities:(id)a4;
- (_LXLexicon)addressBookLexiconForLocale:(const char *)a3;
- (_LXLexicon)appNameLexiconForLocale:(const char *)a3;
- (_LXLexicon)namedEntityLexicon;
- (_LXLexicon)namedEntityLexiconForLocale:(const char *)a3;
- (_LXLexicon)namedEntityPhraseLexicon;
- (_LXLexicon)namedEntityPhraseLexiconForLocale:(const char *)a3;
- (id)addContactObserver:(id)a3;
- (id)ensureSupplementalLexicons;
- (id)supplementalLexicons;
- (int)acceptedCount;
- (int)offeredCount;
- (void)addEntry:(id)a3 toLexicon:(_LXLexicon *)a4;
- (void)dealloc;
- (void)debugLogEntities;
- (void)getOnce:(id)a3;
- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5;
- (void)removeContactObserver:(id)a3;
- (void)setAcceptedCount:(int)a3;
- (void)setNewContactCollection:(id)a3;
- (void)setOfferedCount:(int)a3;
- (void)setSupplementalLexiconSearchEnabled:(BOOL)a3;
@end

@implementation TITransientLexiconManagerMock

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactCollection, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)setSupplementalLexiconSearchEnabled:(BOOL)a3
{
  self->_supplementalLexiconSearchEnabled = a3;
}

- (BOOL)isSupplementalLexiconSearchEnabled
{
  return self->_supplementalLexiconSearchEnabled;
}

- (void)setAcceptedCount:(int)a3
{
  self->_acceptedCount = a3;
}

- (int)acceptedCount
{
  return self->_acceptedCount;
}

- (void)setOfferedCount:(int)a3
{
  self->_offeredCount = a3;
}

- (int)offeredCount
{
  return self->_offeredCount;
}

- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5
{
  if (a4 == 3)
  {
    uint64_t v5 = 60;
  }
  else
  {
    if (a4 != 1) {
      return;
    }
    uint64_t v5 = 64;
  }
  ++*(_DWORD *)((char *)&self->super.isa + v5);
}

- (void)debugLogEntities
{
  if (self->_namedEntityLexiconRef)
  {
    +[TITransientLexiconManagerMock getEntries:](TITransientLexiconManagerMock, "getEntries:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if ([v5 count])
    {
      v3 = [v5 componentsJoinedByString:@"|"];
      NSLog(&cfstr_NamedEntities.isa, v3);
    }
    else
    {
      NSLog(&cfstr_NamedEntitiesE.isa);
    }
  }
  if (self->_namedEntityPhraseLexiconRef)
  {
    +[TITransientLexiconManagerMock getEntries:](TITransientLexiconManagerMock, "getEntries:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if ([v6 count])
    {
      v4 = [v6 componentsJoinedByString:@"|"];
      NSLog(&cfstr_NamedPhraseEnt.isa, v4);
    }
    else
    {
      NSLog(&cfstr_NamedPhraseEnt_0.isa);
    }
  }
}

- (id)supplementalLexicons
{
  return 0;
}

- (id)ensureSupplementalLexicons
{
  return 0;
}

- (_LXLexicon)appNameLexiconForLocale:(const char *)a3
{
  v63[2] = *MEMORY[0x263EF8340];
  MEMORY[0x2455C23A0](&v61, a3);
  if (std::__hash_table<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>>>::find<KB::String>((void *)self->_appNameLexicons, &v61))
  {
    goto LABEL_91;
  }
  id v5 = v62;
  if (!v62) {
    id v5 = (const char *)v63;
  }
  if ((_WORD)v61) {
    id v6 = v5;
  }
  else {
    id v6 = "";
  }
  v48 = [NSString stringWithUTF8String:v6];
  UIKeyboardStaticUnigramsFile();
  v7 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v60, v7, v8);

  v9 = [MEMORY[0x263F7EA88] inputModeWithIdentifier:v48];
  UIKeyboardDeltaLexiconPathForInputMode();
  v10 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v59, v10, v11);

  MEMORY[0x2455C23B0](v58, &v61);
  MEMORY[0x2455C23B0](v57, v60);
  MEMORY[0x2455C23B0](v56, v59);
  KB::AppTrieLoader::create();
  KB::String::~String((KB::String *)v56);
  KB::String::~String((KB::String *)v57);
  KB::String::~String((KB::String *)v58);
  appNameLexicons = (char *)self->_appNameLexicons;
  MEMORY[0x2455C23B0](&v52, &v61);
  long long v55 = v49;
  if (*((void *)&v49 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v49 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  if (v53) {
    v13 = (KB::String *)v53;
  }
  else {
    v13 = (KB::String *)&v54;
  }
  unsigned int v14 = KB::String::hash(v13, (const char *)(unsigned __int16)v52);
  unint64_t v15 = v14;
  unint64_t v16 = *((void *)appNameLexicons + 1);
  if (v16)
  {
    uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)v16);
    v17.i16[0] = vaddlv_u8(v17);
    unint64_t v18 = v17.u32[0];
    if (v17.u32[0] > 1uLL)
    {
      unint64_t v3 = v14;
      if (v16 <= v14) {
        unint64_t v3 = v14 % v16;
      }
    }
    else
    {
      unint64_t v3 = (v16 - 1) & v14;
    }
    v19 = *(uint64_t ***)(*(void *)appNameLexicons + 8 * v3);
    if (v19)
    {
      v20 = (uint64_t **)*v19;
      if (*v19)
      {
        do
        {
          unint64_t v21 = (unint64_t)v20[1];
          if (v21 == v15)
          {
            if (v20 + 2 == (uint64_t **)&v52
              || (KB::String::equal((KB::String *)(v20 + 2), (const KB::String *)&v52) & 1) != 0)
            {
              goto LABEL_86;
            }
          }
          else
          {
            if (v18 > 1)
            {
              if (v21 >= v16) {
                v21 %= v16;
              }
            }
            else
            {
              v21 &= v16 - 1;
            }
            if (v21 != v3) {
              break;
            }
          }
          v20 = (uint64_t **)*v20;
        }
        while (v20);
      }
    }
  }
  v22 = operator new(0x40uLL);
  v23 = appNameLexicons + 16;
  v50[0] = (uint64_t)v22;
  v50[1] = (uint64_t)(appNameLexicons + 16);
  void *v22 = 0;
  v22[1] = v15;
  MEMORY[0x2455C23B0](v22 + 2, &v52);
  *((_OWORD *)v22 + 3) = v55;
  long long v55 = 0uLL;
  char v51 = 1;
  float v24 = (float)(unint64_t)(*((void *)appNameLexicons + 3) + 1);
  float v25 = *((float *)appNameLexicons + 8);
  if (!v16 || (float)(v25 * (float)v16) < v24)
  {
    BOOL v26 = 1;
    if (v16 >= 3) {
      BOOL v26 = (v16 & (v16 - 1)) != 0;
    }
    unint64_t v27 = v26 | (2 * v16);
    unint64_t v28 = vcvtps_u32_f32(v24 / v25);
    if (v27 <= v28) {
      int8x8_t prime = (int8x8_t)v28;
    }
    else {
      int8x8_t prime = (int8x8_t)v27;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v16 = *((void *)appNameLexicons + 1);
    if (*(void *)&prime > v16) {
      goto LABEL_42;
    }
    if (*(void *)&prime < v16)
    {
      unint64_t v36 = vcvtps_u32_f32((float)*((unint64_t *)appNameLexicons + 3) / *((float *)appNameLexicons + 8));
      if (v16 < 3 || (uint8x8_t v37 = (uint8x8_t)vcnt_s8((int8x8_t)v16), v37.i16[0] = vaddlv_u8(v37), v37.u32[0] > 1uLL))
      {
        unint64_t v36 = std::__next_prime(v36);
      }
      else
      {
        uint64_t v38 = 1 << -(char)__clz(v36 - 1);
        if (v36 >= 2) {
          unint64_t v36 = v38;
        }
      }
      if (*(void *)&prime <= v36) {
        int8x8_t prime = (int8x8_t)v36;
      }
      if (*(void *)&prime >= v16)
      {
        unint64_t v16 = *((void *)appNameLexicons + 1);
      }
      else
      {
        if (prime)
        {
LABEL_42:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          v30 = operator new(8 * *(void *)&prime);
          v31 = *(void **)appNameLexicons;
          *(void *)appNameLexicons = v30;
          if (v31) {
            operator delete(v31);
          }
          uint64_t v32 = 0;
          *((int8x8_t *)appNameLexicons + 1) = prime;
          do
            *(void *)(*(void *)appNameLexicons + 8 * v32++) = 0;
          while (*(void *)&prime != v32);
          v33 = (void *)*v23;
          if (*v23)
          {
            unint64_t v34 = v33[1];
            uint8x8_t v35 = (uint8x8_t)vcnt_s8(prime);
            v35.i16[0] = vaddlv_u8(v35);
            if (v35.u32[0] > 1uLL)
            {
              if (v34 >= *(void *)&prime) {
                v34 %= *(void *)&prime;
              }
            }
            else
            {
              v34 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)appNameLexicons + 8 * v34) = v23;
            v39 = (void *)*v33;
            if (*v33)
            {
              do
              {
                unint64_t v40 = v39[1];
                if (v35.u32[0] > 1uLL)
                {
                  if (v40 >= *(void *)&prime) {
                    v40 %= *(void *)&prime;
                  }
                }
                else
                {
                  v40 &= *(void *)&prime - 1;
                }
                if (v40 != v34)
                {
                  if (!*(void *)(*(void *)appNameLexicons + 8 * v40))
                  {
                    *(void *)(*(void *)appNameLexicons + 8 * v40) = v33;
                    goto LABEL_67;
                  }
                  void *v33 = *v39;
                  void *v39 = **(void **)(*(void *)appNameLexicons + 8 * v40);
                  **(void **)(*(void *)appNameLexicons + 8 * v40) = v39;
                  v39 = v33;
                }
                unint64_t v40 = v34;
LABEL_67:
                v33 = v39;
                v39 = (void *)*v39;
                unint64_t v34 = v40;
              }
              while (v39);
            }
          }
          unint64_t v16 = (unint64_t)prime;
          goto LABEL_71;
        }
        v47 = *(void **)appNameLexicons;
        *(void *)appNameLexicons = 0;
        if (v47) {
          operator delete(v47);
        }
        unint64_t v16 = 0;
        *((void *)appNameLexicons + 1) = 0;
      }
    }
LABEL_71:
    if ((v16 & (v16 - 1)) != 0)
    {
      if (v16 <= v15) {
        unint64_t v3 = v15 % v16;
      }
      else {
        unint64_t v3 = v15;
      }
    }
    else
    {
      unint64_t v3 = (v16 - 1) & v15;
    }
  }
  v41 = *(uint64_t **)(*(void *)appNameLexicons + 8 * v3);
  uint64_t v42 = v50[0];
  if (v41)
  {
    *(void *)v50[0] = *v41;
  }
  else
  {
    *(void *)v50[0] = *((void *)appNameLexicons + 2);
    *((void *)appNameLexicons + 2) = v42;
    *(void *)(*(void *)appNameLexicons + 8 * v3) = v23;
    if (!*(void *)v42) {
      goto LABEL_85;
    }
    unint64_t v43 = *(void *)(*(void *)v42 + 8);
    if ((v16 & (v16 - 1)) != 0)
    {
      if (v43 >= v16) {
        v43 %= v16;
      }
    }
    else
    {
      v43 &= v16 - 1;
    }
    v41 = (uint64_t *)(*(void *)appNameLexicons + 8 * v43);
  }
  uint64_t *v41 = v42;
LABEL_85:
  v50[0] = 0;
  ++*((void *)appNameLexicons + 3);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,void *>>>>::reset[abi:nn180100](v50);
LABEL_86:
  if (*((void *)&v55 + 1)) {
    std::__shared_weak_count::__release_shared[abi:nn180100](*((std::__shared_weak_count **)&v55 + 1));
  }
  KB::String::~String((KB::String *)&v52);
  if (*((void *)&v49 + 1)) {
    std::__shared_weak_count::__release_shared[abi:nn180100](*((std::__shared_weak_count **)&v49 + 1));
  }
  KB::String::~String((KB::String *)v59);
  KB::String::~String((KB::String *)v60);

LABEL_91:
  v44 = std::__hash_table<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>>>::find<KB::String>((void *)self->_appNameLexicons, &v61);
  if (!v44) {
    abort();
  }
  (*(void (**)(char **__return_ptr))(*(void *)v44[6] + 16))(&v52);
  v45 = *(_LXLexicon **)v52;
  if (v53) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v53);
  }
  KB::String::~String((KB::String *)&v61);
  return v45;
}

- (_LXLexicon)addressBookLexiconForLocale:(const char *)a3
{
  v63[2] = *MEMORY[0x263EF8340];
  MEMORY[0x2455C23A0](&v61, a3);
  if (std::__hash_table<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>>>::find<KB::String>((void *)self->_addressBookLexicons, &v61))
  {
    goto LABEL_91;
  }
  id v5 = v62;
  if (!v62) {
    id v5 = (const char *)v63;
  }
  if ((_WORD)v61) {
    id v6 = v5;
  }
  else {
    id v6 = "";
  }
  v48 = [NSString stringWithUTF8String:v6];
  UIKeyboardStaticUnigramsFile();
  v7 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v60, v7, v8);

  v9 = [MEMORY[0x263F7EA88] inputModeWithIdentifier:v48];
  UIKeyboardDeltaLexiconPathForInputMode();
  v10 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v59, v10, v11);

  MEMORY[0x2455C23B0](v58, &v61);
  MEMORY[0x2455C23B0](v57, v60);
  MEMORY[0x2455C23B0](v56, v59);
  KB::AddressBookTrieLoader::create();
  KB::String::~String((KB::String *)v56);
  KB::String::~String((KB::String *)v57);
  KB::String::~String((KB::String *)v58);
  addressBookLexicons = (char *)self->_addressBookLexicons;
  MEMORY[0x2455C23B0](&v52, &v61);
  long long v55 = v49;
  if (*((void *)&v49 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v49 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  if (v53) {
    v13 = (KB::String *)v53;
  }
  else {
    v13 = (KB::String *)&v54;
  }
  unsigned int v14 = KB::String::hash(v13, (const char *)(unsigned __int16)v52);
  unint64_t v15 = v14;
  unint64_t v16 = *((void *)addressBookLexicons + 1);
  if (v16)
  {
    uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)v16);
    v17.i16[0] = vaddlv_u8(v17);
    unint64_t v18 = v17.u32[0];
    if (v17.u32[0] > 1uLL)
    {
      unint64_t v3 = v14;
      if (v16 <= v14) {
        unint64_t v3 = v14 % v16;
      }
    }
    else
    {
      unint64_t v3 = (v16 - 1) & v14;
    }
    v19 = *(uint64_t ***)(*(void *)addressBookLexicons + 8 * v3);
    if (v19)
    {
      v20 = (uint64_t **)*v19;
      if (*v19)
      {
        do
        {
          unint64_t v21 = (unint64_t)v20[1];
          if (v21 == v15)
          {
            if (v20 + 2 == (uint64_t **)&v52
              || (KB::String::equal((KB::String *)(v20 + 2), (const KB::String *)&v52) & 1) != 0)
            {
              goto LABEL_86;
            }
          }
          else
          {
            if (v18 > 1)
            {
              if (v21 >= v16) {
                v21 %= v16;
              }
            }
            else
            {
              v21 &= v16 - 1;
            }
            if (v21 != v3) {
              break;
            }
          }
          v20 = (uint64_t **)*v20;
        }
        while (v20);
      }
    }
  }
  v22 = operator new(0x40uLL);
  v23 = addressBookLexicons + 16;
  v50[0] = (uint64_t)v22;
  v50[1] = (uint64_t)(addressBookLexicons + 16);
  void *v22 = 0;
  v22[1] = v15;
  MEMORY[0x2455C23B0](v22 + 2, &v52);
  *((_OWORD *)v22 + 3) = v55;
  long long v55 = 0uLL;
  char v51 = 1;
  float v24 = (float)(unint64_t)(*((void *)addressBookLexicons + 3) + 1);
  float v25 = *((float *)addressBookLexicons + 8);
  if (!v16 || (float)(v25 * (float)v16) < v24)
  {
    BOOL v26 = 1;
    if (v16 >= 3) {
      BOOL v26 = (v16 & (v16 - 1)) != 0;
    }
    unint64_t v27 = v26 | (2 * v16);
    unint64_t v28 = vcvtps_u32_f32(v24 / v25);
    if (v27 <= v28) {
      int8x8_t prime = (int8x8_t)v28;
    }
    else {
      int8x8_t prime = (int8x8_t)v27;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v16 = *((void *)addressBookLexicons + 1);
    if (*(void *)&prime > v16) {
      goto LABEL_42;
    }
    if (*(void *)&prime < v16)
    {
      unint64_t v36 = vcvtps_u32_f32((float)*((unint64_t *)addressBookLexicons + 3) / *((float *)addressBookLexicons + 8));
      if (v16 < 3 || (uint8x8_t v37 = (uint8x8_t)vcnt_s8((int8x8_t)v16), v37.i16[0] = vaddlv_u8(v37), v37.u32[0] > 1uLL))
      {
        unint64_t v36 = std::__next_prime(v36);
      }
      else
      {
        uint64_t v38 = 1 << -(char)__clz(v36 - 1);
        if (v36 >= 2) {
          unint64_t v36 = v38;
        }
      }
      if (*(void *)&prime <= v36) {
        int8x8_t prime = (int8x8_t)v36;
      }
      if (*(void *)&prime >= v16)
      {
        unint64_t v16 = *((void *)addressBookLexicons + 1);
      }
      else
      {
        if (prime)
        {
LABEL_42:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          v30 = operator new(8 * *(void *)&prime);
          v31 = *(void **)addressBookLexicons;
          *(void *)addressBookLexicons = v30;
          if (v31) {
            operator delete(v31);
          }
          uint64_t v32 = 0;
          *((int8x8_t *)addressBookLexicons + 1) = prime;
          do
            *(void *)(*(void *)addressBookLexicons + 8 * v32++) = 0;
          while (*(void *)&prime != v32);
          v33 = (void *)*v23;
          if (*v23)
          {
            unint64_t v34 = v33[1];
            uint8x8_t v35 = (uint8x8_t)vcnt_s8(prime);
            v35.i16[0] = vaddlv_u8(v35);
            if (v35.u32[0] > 1uLL)
            {
              if (v34 >= *(void *)&prime) {
                v34 %= *(void *)&prime;
              }
            }
            else
            {
              v34 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)addressBookLexicons + 8 * v34) = v23;
            v39 = (void *)*v33;
            if (*v33)
            {
              do
              {
                unint64_t v40 = v39[1];
                if (v35.u32[0] > 1uLL)
                {
                  if (v40 >= *(void *)&prime) {
                    v40 %= *(void *)&prime;
                  }
                }
                else
                {
                  v40 &= *(void *)&prime - 1;
                }
                if (v40 != v34)
                {
                  if (!*(void *)(*(void *)addressBookLexicons + 8 * v40))
                  {
                    *(void *)(*(void *)addressBookLexicons + 8 * v40) = v33;
                    goto LABEL_67;
                  }
                  void *v33 = *v39;
                  void *v39 = **(void **)(*(void *)addressBookLexicons + 8 * v40);
                  **(void **)(*(void *)addressBookLexicons + 8 * v40) = v39;
                  v39 = v33;
                }
                unint64_t v40 = v34;
LABEL_67:
                v33 = v39;
                v39 = (void *)*v39;
                unint64_t v34 = v40;
              }
              while (v39);
            }
          }
          unint64_t v16 = (unint64_t)prime;
          goto LABEL_71;
        }
        v47 = *(void **)addressBookLexicons;
        *(void *)addressBookLexicons = 0;
        if (v47) {
          operator delete(v47);
        }
        unint64_t v16 = 0;
        *((void *)addressBookLexicons + 1) = 0;
      }
    }
LABEL_71:
    if ((v16 & (v16 - 1)) != 0)
    {
      if (v16 <= v15) {
        unint64_t v3 = v15 % v16;
      }
      else {
        unint64_t v3 = v15;
      }
    }
    else
    {
      unint64_t v3 = (v16 - 1) & v15;
    }
  }
  v41 = *(uint64_t **)(*(void *)addressBookLexicons + 8 * v3);
  uint64_t v42 = v50[0];
  if (v41)
  {
    *(void *)v50[0] = *v41;
  }
  else
  {
    *(void *)v50[0] = *((void *)addressBookLexicons + 2);
    *((void *)addressBookLexicons + 2) = v42;
    *(void *)(*(void *)addressBookLexicons + 8 * v3) = v23;
    if (!*(void *)v42) {
      goto LABEL_85;
    }
    unint64_t v43 = *(void *)(*(void *)v42 + 8);
    if ((v16 & (v16 - 1)) != 0)
    {
      if (v43 >= v16) {
        v43 %= v16;
      }
    }
    else
    {
      v43 &= v16 - 1;
    }
    v41 = (uint64_t *)(*(void *)addressBookLexicons + 8 * v43);
  }
  uint64_t *v41 = v42;
LABEL_85:
  v50[0] = 0;
  ++*((void *)addressBookLexicons + 3);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,void *>>>>::reset[abi:nn180100](v50);
LABEL_86:
  if (*((void *)&v55 + 1)) {
    std::__shared_weak_count::__release_shared[abi:nn180100](*((std::__shared_weak_count **)&v55 + 1));
  }
  KB::String::~String((KB::String *)&v52);
  if (*((void *)&v49 + 1)) {
    std::__shared_weak_count::__release_shared[abi:nn180100](*((std::__shared_weak_count **)&v49 + 1));
  }
  KB::String::~String((KB::String *)v59);
  KB::String::~String((KB::String *)v60);

LABEL_91:
  v44 = std::__hash_table<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>>>::find<KB::String>((void *)self->_addressBookLexicons, &v61);
  if (!v44) {
    abort();
  }
  (*(void (**)(char **__return_ptr))(*(void *)v44[6] + 16))(&v52);
  v45 = *(_LXLexicon **)v52;
  if (v53) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v53);
  }
  KB::String::~String((KB::String *)&v61);
  return v45;
}

- (_LXLexicon)namedEntityPhraseLexiconForLocale:(const char *)a3
{
  return self->_namedEntityPhraseLexiconRef;
}

- (_LXLexicon)namedEntityLexiconForLocale:(const char *)a3
{
  return self->_namedEntityLexiconRef;
}

- (_LXLexicon)namedEntityPhraseLexicon
{
  return self->_namedEntityPhraseLexiconRef;
}

- (_LXLexicon)namedEntityLexicon
{
  return self->_namedEntityLexiconRef;
}

- (BOOL)searchForWordCaseInsensitive:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(TITransientLexiconManagerMock *)self searchHelper:[(TITransientLexiconManagerMock *)self namedEntityLexicon] forWord:v4 caseSensitive:0];

  return (char)self;
}

- (BOOL)searchForWord:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(TITransientLexiconManagerMock *)self searchHelper:[(TITransientLexiconManagerMock *)self namedEntityLexicon] forWord:v4 caseSensitive:1];

  return (char)self;
}

- (BOOL)searchHelper:(_LXLexicon *)a3 forWord:(__CFString *)a4 caseSensitive:(BOOL)a5
{
  if (!a3) {
    return 0;
  }
  uint64_t v15 = 0;
  unint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__TITransientLexiconManagerMock_searchHelper_forWord_caseSensitive___block_invoke;
  v13[3] = &unk_26504FA90;
  BOOL v14 = a5;
  v13[4] = &v15;
  v13[5] = a4;
  v7 = v13;
  uint64_t v24 = 0;
  float v25 = &v24;
  uint64_t v26 = 0x2020000000;
  v8 = (void (*)(_LXLexicon *, __CFString *, void *))getLXLexiconEnumerateEntriesForStringSymbolLoc(void)::ptr;
  unint64_t v27 = getLXLexiconEnumerateEntriesForStringSymbolLoc(void)::ptr;
  if (!getLXLexiconEnumerateEntriesForStringSymbolLoc(void)::ptr)
  {
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    unint64_t v21 = ___ZL46getLXLexiconEnumerateEntriesForStringSymbolLocv_block_invoke;
    v22 = &unk_26504FAB8;
    v23 = &v24;
    v9 = (void *)LexiconLibrary();
    v10 = dlsym(v9, "LXLexiconEnumerateEntriesForString");
    *(void *)(v23[1] + 24) = v10;
    getLXLexiconEnumerateEntriesForStringSymbolLoc(void)::ptr = *(_UNKNOWN **)(v23[1] + 24);
    v8 = (void (*)(_LXLexicon *, __CFString *, void *))v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (v8)
  {
    v8(a3, a4, v7);

    BOOL v11 = *((unsigned char *)v16 + 24) != 0;
    _Block_object_dispose(&v15, 8);
    return v11;
  }
  dlerror();
  BOOL result = abort_report_np();
  __break(1u);
  return result;
}

void __68__TITransientLexiconManagerMock_searchHelper_forWord_caseSensitive___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000;
  id v6 = (uint64_t (*)(uint64_t))getLXEntryCopyStringSymbolLoc(void)::ptr;
  v13 = getLXEntryCopyStringSymbolLoc(void)::ptr;
  if (!getLXEntryCopyStringSymbolLoc(void)::ptr)
  {
    v7 = (void *)LexiconLibrary();
    v11[3] = (uint64_t)dlsym(v7, "LXEntryCopyString");
    getLXEntryCopyStringSymbolLoc(void)::ptr = (_UNKNOWN *)v11[3];
    id v6 = (uint64_t (*)(uint64_t))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v6)
  {
    dlerror();
    v9 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v9);
  }
  CFStringRef v8 = (const __CFString *)v6(a2);
  if (CFStringCompare(v8, *(CFStringRef *)(a1 + 40), *(unsigned char *)(a1 + 48) == 0) == kCFCompareEqualTo)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  CFRelease(v8);
}

- (NSArray)observers
{
  return (NSArray *)self->_observers;
}

- (void)getOnce:(id)a3
{
}

- (void)removeContactObserver:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  observers = obj->_observers;
  id v6 = (void *)MEMORY[0x2455C2CF0](v4);

  [(NSMutableArray *)observers removeObjectIdenticalTo:v6];
  objc_sync_exit(obj);
}

- (void)setNewContactCollection:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_contactCollection, a3);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = self->_observers;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)addContactObserver:(id)a3
{
  id v4 = a3;
  id v5 = (void (**)(void, void))[v4 copy];
  id v6 = self;
  objc_sync_enter(v6);
  observers = v6->_observers;
  uint64_t v8 = (void *)MEMORY[0x2455C2CF0](v5);
  [(NSMutableArray *)observers addObject:v8];

  objc_sync_exit(v6);
  ((void (**)(void, NSDictionary *))v5)[2](v5, v6->_contactCollection);
  uint64_t v9 = (void *)MEMORY[0x2455C2CF0](v5);

  return v9;
}

- (void)dealloc
{
  namedEntityPhraseLexiconRef = self->_namedEntityPhraseLexiconRef;
  if (namedEntityPhraseLexiconRef) {
    CFRelease(namedEntityPhraseLexiconRef);
  }
  namedEntityLexiconRef = self->_namedEntityLexiconRef;
  if (namedEntityLexiconRef) {
    CFRelease(namedEntityLexiconRef);
  }
  addressBookLexicons = (void **)self->_addressBookLexicons;
  if (addressBookLexicons)
  {
    id v6 = addressBookLexicons[2];
    if (v6)
    {
      do
      {
        uint64_t v7 = (void *)*v6;
        std::pair<KB::String const,std::shared_ptr<KB::AppTrieLoader>>::~pair((KB::String *)(v6 + 2));
        operator delete(v6);
        id v6 = v7;
      }
      while (v7);
    }
    uint64_t v8 = *addressBookLexicons;
    char *addressBookLexicons = 0;
    if (v8) {
      operator delete(v8);
    }
    MEMORY[0x2455C26F0](addressBookLexicons, 0x10A0C408EF24B1CLL);
  }
  appNameLexicons = (void **)self->_appNameLexicons;
  if (appNameLexicons)
  {
    long long v10 = appNameLexicons[2];
    if (v10)
    {
      do
      {
        long long v11 = (void *)*v10;
        std::pair<KB::String const,std::shared_ptr<KB::AppTrieLoader>>::~pair((KB::String *)(v10 + 2));
        operator delete(v10);
        long long v10 = v11;
      }
      while (v11);
    }
    long long v12 = *appNameLexicons;
    char *appNameLexicons = 0;
    if (v12) {
      operator delete(v12);
    }
    MEMORY[0x2455C26F0](appNameLexicons, 0x10A0C408EF24B1CLL);
  }
  v13.receiver = self;
  v13.super_class = (Class)TITransientLexiconManagerMock;
  [(TITransientLexiconManagerMock *)&v13 dealloc];
}

- (TITransientLexiconManagerMock)initWithTransientData:(id)a3 namedEntities:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v32 = a3;
  id v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)TITransientLexiconManagerMock;
  uint64_t v8 = [(TITransientLexiconManagerMock *)&v43 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_contactCollection, a3);
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    id v12 = getkLXLexiconNameKey();
    CFDictionaryAddValue(Mutable, v12, @"InputContext-NamedEntityWords");
    id v13 = getkLXLexiconLocaleKey();
    CFDictionaryAddValue(Mutable, v13, @"en_US");
    uint64_t v42 = 0;
    v9->_namedEntityLexiconRef = (_LXLexicon *)__LXLexiconCreateTransient(Mutable, &v42);
    CFRelease(Mutable);
    BOOL v14 = v42;
    if (v42)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v47 = "-[TITransientLexiconManagerMock initWithTransientData:namedEntities:]";
        __int16 v48 = 2112;
        long long v49 = v14;
        _os_log_impl(&dword_23EFD2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s  Error: Unable to create transient mutable lexicon for named entities: %@", buf, 0x16u);
        BOOL v14 = v42;
      }
      CFRelease(v14);
    }
    uint64_t v15 = CFDictionaryCreateMutable(v10, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    id v16 = getkLXLexiconNameKey();
    CFDictionaryAddValue(v15, v16, @"InputContext-NamedEntityPhrases");
    id v17 = getkLXLexiconLocaleKey();
    CFDictionaryAddValue(v15, v17, @"en_US");
    v41 = 0;
    v9->_namedEntityPhraseLexiconRef = (_LXLexicon *)__LXLexiconCreateTransient(v15, &v41);
    CFRelease(v15);
    char v18 = v41;
    if (v41)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v47 = "-[TITransientLexiconManagerMock initWithTransientData:namedEntities:]";
        __int16 v48 = 2112;
        long long v49 = v18;
        _os_log_impl(&dword_23EFD2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s  Error: Unable to create transient mutable lexicon for named entity phrases: %@", buf, 0x16u);
        char v18 = v41;
      }
      CFRelease(v18);
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v19 = v7;
    uint64_t v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v45, 16, v32);
    if (v20)
    {
      uint64_t v21 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v38 != v21) {
            objc_enumerationMutation(v19);
          }
          uint64_t v23 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v24 = +[TITransientLexiconManagerMock tokenizeEntity:v23];
          if ((unint64_t)[v24 count] >= 2) {
            [(TITransientLexiconManagerMock *)v9 addEntry:v23 toLexicon:v9->_namedEntityPhraseLexiconRef];
          }
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v25 = v24;
          uint64_t v26 = [v25 countByEnumeratingWithState:&v33 objects:v44 count:16];
          if (v26)
          {
            uint64_t v27 = *(void *)v34;
            do
            {
              for (uint64_t j = 0; j != v26; ++j)
              {
                if (*(void *)v34 != v27) {
                  objc_enumerationMutation(v25);
                }
                [(TITransientLexiconManagerMock *)v9 addEntry:*(void *)(*((void *)&v33 + 1) + 8 * j) toLexicon:v9->_namedEntityLexiconRef];
              }
              uint64_t v26 = [v25 countByEnumeratingWithState:&v33 objects:v44 count:16];
            }
            while (v26);
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v20);
    }

    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    observers = v9->_observers;
    v9->_observers = v29;

    operator new();
  }

  return 0;
}

- (void)addEntry:(id)a3 toLexicon:(_LXLexicon *)a4
{
  id v5 = a3;
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x2020000000;
  id v6 = (void (*)(_LXLexicon *, id, void))getLXLexiconAddSymbolLoc(void)::ptr;
  id v13 = getLXLexiconAddSymbolLoc(void)::ptr;
  if (!getLXLexiconAddSymbolLoc(void)::ptr)
  {
    id v7 = (void *)LexiconLibrary();
    v11[3] = (uint64_t)dlsym(v7, "LXLexiconAdd");
    getLXLexiconAddSymbolLoc(void)::ptr = (_UNKNOWN *)v11[3];
    id v6 = (void (*)(_LXLexicon *, id, void))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v6) {
    goto LABEL_8;
  }
  v6(a4, v5, 0);
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v8 = (void (*)(_LXLexicon *, id, uint64_t))getLXLexiconIncrementUsageCountSymbolLoc(void)::ptr;
  id v13 = getLXLexiconIncrementUsageCountSymbolLoc(void)::ptr;
  if (!getLXLexiconIncrementUsageCountSymbolLoc(void)::ptr)
  {
    uint64_t v9 = (void *)LexiconLibrary();
    v11[3] = (uint64_t)dlsym(v9, "LXLexiconIncrementUsageCount");
    getLXLexiconIncrementUsageCountSymbolLoc(void)::ptr = (_UNKNOWN *)v11[3];
    uint64_t v8 = (void (*)(_LXLexicon *, id, uint64_t))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (v8)
  {
    v8(a4, v5, 1);
  }
  else
  {
LABEL_8:
    dlerror();
    abort_report_np();
    __break(1u);
  }
}

- (TITransientLexiconManagerMock)init
{
  v4.receiver = self;
  v4.super_class = (Class)TITransientLexiconManagerMock;
  v2 = [(TITransientLexiconManagerMock *)&v4 init];
  if (v2)
  {
    v2->_namedEntityLexiconRef = 0;
    v2->_namedEntityPhraseLexiconRef = 0;
    operator new();
  }

  return 0;
}

+ (id)getEntries:(_LXLexicon *)a3
{
  return (id)objc_msgSend(MEMORY[0x263EFF980], "array", a3);
}

+ (id)tokenizeEntity:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_super v4 = [MEMORY[0x263EFF980] array];
  id v5 = [v3 stringByAppendingString:@" "];

  uint64_t v6 = [v5 length];
  uint64_t v7 = [v5 length];
  MEMORY[0x270FA5388]();
  v13[0] = [v5 length];
  objc_msgSend(v5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", (char *)v11 - ((4 * v6 + 15) & 0xFFFFFFFFFFFFFFF0), 4 * v6, v13, 4, 0, 0, v7, 0);
  CFLocaleRef v8 = CFLocaleCreate(0, @"en_US");
  LMStreamTokenizerCreate();
  v11[1] = MEMORY[0x263EF8330];
  v11[2] = 3221225472;
  v11[3] = __48__TITransientLexiconManagerMock_tokenizeEntity___block_invoke;
  v11[4] = &unk_26504FA68;
  id v9 = v4;
  id v12 = v9;
  LMStreamTokenizerPushBytes();
  LMStreamTokenizerRelease();
  CFRelease(v8);

  return v9;
}

void __48__TITransientLexiconManagerMock_tokenizeEntity___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if ((a4 - 500) <= 0xFFFFFE0C)
  {
    id v5 = (void *)[[NSString alloc] initWithBytes:a2 length:a3 encoding:4];
    uint64_t v6 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    id v7 = [v5 stringByTrimmingCharactersInSet:v6];

    objc_msgSend(*(id *)(a1 + 32), "addObject:");
  }
}

@end