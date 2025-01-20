@interface TITransientLexiconManager
+ (TITransientLexiconManager)sharedInstance;
+ (id)getEntries:(_LXLexicon *)a3;
+ (id)singletonInstance;
+ (void)setSharedTITransientLexiconManager:(id)a3;
- (BOOL)isSupplementalLexiconSearchEnabled;
- (BOOL)searchForWord:(id)a3;
- (BOOL)searchForWordCaseInsensitive:(id)a3;
- (BOOL)searchHelper:(_LXLexicon *)a3 forWord:(__CFString *)a4 caseSensitive:(BOOL)a5;
- (NSXPCConnection)_overridingCurrentConnectionForTesting;
- (TISupplementalLexiconController)ensureSupplementalLexicons;
- (TISupplementalLexiconController)supplementalLexicons;
- (TITransientLexiconManager)init;
- (_LXLexicon)addressBookLexiconForLocale:(const char *)a3;
- (_LXLexicon)appNameLexiconForLocale:(const char *)a3;
- (_LXLexicon)filterLexicon:(_LXLexicon *)a3 againstLocale:(String *)a4;
- (_LXLexicon)filteredLexicon:(_LXLexicon *)a3 fromLexiconCache:(void *)a4 forLocale:(const char *)a5;
- (_LXLexicon)namedEntityLexicon;
- (_LXLexicon)namedEntityLexiconForLocale:(const char *)a3;
- (_LXLexicon)namedEntityPhraseLexicon;
- (_LXLexicon)namedEntityPhraseLexiconForLocale:(const char *)a3;
- (id)_currentConnection;
- (id)addContactObserver:(id)a3;
- (void)_setOverridingCurrentConnectionForTesting:(id)a3;
- (void)dealloc;
- (void)debugLogEntities;
- (void)getOnce:(id)a3;
- (void)loadLexicons;
- (void)namedEntitiesUpdateCallback;
- (void)performMaintenance;
- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5;
- (void)registerNamedEntitiesUpdateCallback;
- (void)releaseCachedNamedEntityLexicons;
- (void)removeContactObserver:(id)a3;
- (void)setSupplementalLexiconSearchEnabled:(BOOL)a3;
- (void)supplementalLexiconControllerProcessDidTerminate:(id)a3;
@end

@implementation TITransientLexiconManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalLexicons, 0);

  objc_storeStrong((id *)&self->_inputContextLexiconManager, 0);
}

- (void)setSupplementalLexiconSearchEnabled:(BOOL)a3
{
  self->_supplementalLexiconSearchEnabled = a3;
}

- (BOOL)isSupplementalLexiconSearchEnabled
{
  return self->_supplementalLexiconSearchEnabled;
}

- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5
{
}

- (void)debugLogEntities
{
  __45__TITransientLexiconManager_debugLogEntities__block_invoke((uint64_t)self->_namedEntityLexiconRef);
  namedEntityPhraseLexiconRef = self->_namedEntityPhraseLexiconRef;

  __45__TITransientLexiconManager_debugLogEntities__block_invoke((uint64_t)namedEntityPhraseLexiconRef);
}

void __45__TITransientLexiconManager_debugLogEntities__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      v2 = TIOSLogFacility();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        v3 = NSString;
        v4 = (void *)LXLexiconCopyName();
        v5 = +[TITransientLexiconManager getEntries:a1];
        v6 = [v5 componentsJoinedByString:@", "];
        v7 = [v3 stringWithFormat:@"%s %@ contains [ %@ ]", "-[TITransientLexiconManager debugLogEntities]_block_invoke", v4, v6];
        *(_DWORD *)buf = 138412290;
        v9 = v7;
        _os_log_debug_impl(&dword_1E3F0E000, v2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

- (_LXLexicon)appNameLexiconForLocale:(const char *)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  KB::String::String((KB::String *)&v20, a3);
  if (!std::__hash_table<std::__hash_value_type<KB::String,unsigned long>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,unsigned long>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,unsigned long>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,unsigned long>>>::find<KB::String>((void *)self->_appNameLexicons, &v20))
  {
    v4 = v21;
    if (!v21) {
      v4 = (const char *)v22;
    }
    if ((_WORD)v20) {
      v5 = v4;
    }
    else {
      v5 = "";
    }
    v6 = [NSString stringWithUTF8String:v5];
    UIKeyboardStaticUnigramsFile(v6);
    v7 = (KB *)objc_claimAutoreleasedReturnValue();
    KB::utf8_string(v7, (uint64_t)v19);

    v8 = +[TIInputMode inputModeWithIdentifier:v6];
    UIKeyboardDeltaLexiconPathForInputMode(v8);
    v9 = (KB *)objc_claimAutoreleasedReturnValue();
    KB::utf8_string(v9, (uint64_t)v18);

    KB::String::String((KB::String *)v17, (const KB::String *)&v20);
    KB::String::String((KB::String *)v16, (const KB::String *)v19);
    KB::String::String((KB::String *)v15, (const KB::String *)v18);
    KB::AppTrieLoader::create();
  }
  uint64_t v10 = std::__hash_table<std::__hash_value_type<KB::String,unsigned long>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,unsigned long>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,unsigned long>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,unsigned long>>>::find<KB::String>((void *)self->_appNameLexicons, &v20);
  if (!v10) {
    abort();
  }
  (*(void (**)(char **__return_ptr))(*(void *)v10[6] + 16))(&v13);
  v11 = *(_LXLexicon **)v13;
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v14);
  }
  if (v21 && BYTE6(v20) == 1) {
    free(v21);
  }
  return v11;
}

- (_LXLexicon)addressBookLexiconForLocale:(const char *)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  KB::String::String((KB::String *)&v20, a3);
  if (!std::__hash_table<std::__hash_value_type<KB::String,unsigned long>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,unsigned long>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,unsigned long>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,unsigned long>>>::find<KB::String>((void *)self->_addressBookLexicons, &v20))
  {
    v4 = v21;
    if (!v21) {
      v4 = (const char *)v22;
    }
    if ((_WORD)v20) {
      v5 = v4;
    }
    else {
      v5 = "";
    }
    v6 = [NSString stringWithUTF8String:v5];
    UIKeyboardStaticUnigramsFile(v6);
    v7 = (KB *)objc_claimAutoreleasedReturnValue();
    KB::utf8_string(v7, (uint64_t)v19);

    v8 = +[TIInputMode inputModeWithIdentifier:v6];
    UIKeyboardDeltaLexiconPathForInputMode(v8);
    v9 = (KB *)objc_claimAutoreleasedReturnValue();
    KB::utf8_string(v9, (uint64_t)v18);

    KB::String::String((KB::String *)v17, (const KB::String *)&v20);
    KB::String::String((KB::String *)v16, (const KB::String *)v19);
    KB::String::String((KB::String *)v15, (const KB::String *)v18);
    KB::AddressBookTrieLoader::create();
  }
  uint64_t v10 = std::__hash_table<std::__hash_value_type<KB::String,unsigned long>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,unsigned long>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,unsigned long>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,unsigned long>>>::find<KB::String>((void *)self->_addressBookLexicons, &v20);
  if (!v10) {
    abort();
  }
  (*(void (**)(char **__return_ptr))(*(void *)v10[6] + 16))(&v13);
  v11 = *(_LXLexicon **)v13;
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v14);
  }
  if (v21 && BYTE6(v20) == 1) {
    free(v21);
  }
  return v11;
}

- (_LXLexicon)namedEntityPhraseLexiconForLocale:(const char *)a3
{
  return [(TITransientLexiconManager *)self filteredLexicon:self->_namedEntityPhraseLexiconRef fromLexiconCache:self->_namedEntityPhraseLexicons forLocale:a3];
}

- (_LXLexicon)namedEntityLexiconForLocale:(const char *)a3
{
  return [(TITransientLexiconManager *)self filteredLexicon:self->_namedEntityLexiconRef fromLexiconCache:self->_namedEntityLexicons forLocale:a3];
}

- (_LXLexicon)filteredLexicon:(_LXLexicon *)a3 fromLexiconCache:(void *)a4 forLocale:(const char *)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      return 0;
    }
    int v47 = 136315138;
    *(void *)v48 = "-[TITransientLexiconManager filteredLexicon:fromLexiconCache:forLocale:]";
    v9 = MEMORY[0x1E4F14500];
    uint64_t v10 = "%s  Lexicon being asked to filter is null - will return a null reference in return";
LABEL_65:
    _os_log_debug_impl(&dword_1E3F0E000, v9, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v47, 0xCu);
    return 0;
  }
  if (!a5)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      return 0;
    }
    int v47 = 136315138;
    *(void *)v48 = "-[TITransientLexiconManager filteredLexicon:fromLexiconCache:forLocale:]";
    v9 = MEMORY[0x1E4F14500];
    uint64_t v10 = "%s  localeId being asked to filter with is null - will return a null reference in return";
    goto LABEL_65;
  }
  v6 = a3;
  KB::String::String((KB::String *)&v51, a5);
  if (!std::__hash_table<std::__hash_value_type<KB::String,unsigned long>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,unsigned long>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,unsigned long>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,unsigned long>>>::find<KB::String>(a4, &v51))
  {
    v12 = [(TITransientLexiconManager *)self filterLexicon:v6 againstLocale:&v51];
    if (!v12)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        int v47 = 136315138;
        *(void *)v48 = "-[TITransientLexiconManager filteredLexicon:fromLexiconCache:forLocale:]";
        _os_log_debug_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  Failed to filter the named entity lexicon; returning an unfiltered one",
          (uint8_t *)&v47,
          0xCu);
      }
      goto LABEL_6;
    }
    unint64_t v13 = (unint64_t)v12;
    KB::String::String((KB::String *)&v47, (const KB::String *)&v51);
    unint64_t v50 = v13;
    if (*(void *)&v48[4]) {
      v14 = *(KB::String **)&v48[4];
    }
    else {
      v14 = (KB::String *)&v49;
    }
    unsigned int v15 = KB::String::hash(v14, (const char *)(unsigned __int16)v47);
    unint64_t v16 = v15;
    unint64_t v17 = *((void *)a4 + 1);
    if (v17)
    {
      uint8x8_t v18 = (uint8x8_t)vcnt_s8((int8x8_t)v17);
      v18.i16[0] = vaddlv_u8(v18);
      unint64_t v19 = v18.u32[0];
      if (v18.u32[0] > 1uLL)
      {
        unint64_t v13 = v15;
        if (v17 <= v15) {
          unint64_t v13 = v15 % v17;
        }
      }
      else
      {
        unint64_t v13 = (v17 - 1) & v15;
      }
      uint64_t v20 = *(uint64_t ***)(*(void *)a4 + 8 * v13);
      if (v20)
      {
        v21 = (uint64_t **)*v20;
        if (*v20)
        {
          do
          {
            unint64_t v22 = (unint64_t)v21[1];
            if (v22 == v16)
            {
              if (v21 + 2 == (uint64_t **)&v47
                || KB::String::equal((KB::String *)(v21 + 2), (const KB::String *)&v47, 1))
              {
                goto LABEL_96;
              }
            }
            else
            {
              if (v19 > 1)
              {
                if (v22 >= v17) {
                  v22 %= v17;
                }
              }
              else
              {
                v22 &= v17 - 1;
              }
              if (v22 != v13) {
                break;
              }
            }
            v21 = (uint64_t **)*v21;
          }
          while (v21);
        }
      }
    }
    v23 = (char *)a4 + 16;
    v24 = operator new(0x38uLL);
    void *v24 = 0;
    v24[1] = v16;
    KB::String::String((KB::String *)(v24 + 2), (const KB::String *)&v47);
    v24[6] = v50;
    float v25 = (float)(unint64_t)(*((void *)a4 + 3) + 1);
    float v26 = *((float *)a4 + 8);
    if (v17 && (float)(v26 * (float)v17) >= v25)
    {
LABEL_86:
      v42 = *(void **)a4;
      v43 = *(void **)(*(void *)a4 + 8 * v13);
      if (v43)
      {
        void *v24 = *v43;
      }
      else
      {
        void *v24 = *v23;
        void *v23 = v24;
        v42[v13] = v23;
        if (!*v24) {
          goto LABEL_95;
        }
        unint64_t v44 = *(void *)(*v24 + 8);
        if ((v17 & (v17 - 1)) != 0)
        {
          if (v44 >= v17) {
            v44 %= v17;
          }
        }
        else
        {
          v44 &= v17 - 1;
        }
        v43 = (void *)(*(void *)a4 + 8 * v44);
      }
      void *v43 = v24;
LABEL_95:
      ++*((void *)a4 + 3);
LABEL_96:
      if (*(void *)&v48[4]) {
        BOOL v45 = v48[2] == 1;
      }
      else {
        BOOL v45 = 0;
      }
      if (v45) {
        free(*(void **)&v48[4]);
      }
      goto LABEL_4;
    }
    BOOL v27 = 1;
    if (v17 >= 3) {
      BOOL v27 = (v17 & (v17 - 1)) != 0;
    }
    unint64_t v28 = v27 | (2 * v17);
    unint64_t v29 = vcvtps_u32_f32(v25 / v26);
    if (v28 <= v29) {
      int8x8_t prime = (int8x8_t)v29;
    }
    else {
      int8x8_t prime = (int8x8_t)v28;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v17 = *((void *)a4 + 1);
    if (*(void *)&prime > v17) {
      goto LABEL_50;
    }
    if (*(void *)&prime < v17)
    {
      unint64_t v37 = vcvtps_u32_f32((float)*((unint64_t *)a4 + 3) / *((float *)a4 + 8));
      if (v17 < 3 || (uint8x8_t v38 = (uint8x8_t)vcnt_s8((int8x8_t)v17), v38.i16[0] = vaddlv_u8(v38), v38.u32[0] > 1uLL))
      {
        unint64_t v37 = std::__next_prime(v37);
      }
      else
      {
        uint64_t v39 = 1 << -(char)__clz(v37 - 1);
        if (v37 >= 2) {
          unint64_t v37 = v39;
        }
      }
      if (*(void *)&prime <= v37) {
        int8x8_t prime = (int8x8_t)v37;
      }
      if (*(void *)&prime >= v17)
      {
        unint64_t v17 = *((void *)a4 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_50:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          v31 = operator new(8 * *(void *)&prime);
          v32 = *(void **)a4;
          *(void *)a4 = v31;
          if (v32) {
            operator delete(v32);
          }
          uint64_t v33 = 0;
          *((int8x8_t *)a4 + 1) = prime;
          do
            *(void *)(*(void *)a4 + 8 * v33++) = 0;
          while (*(void *)&prime != v33);
          v34 = (void *)*v23;
          if (*v23)
          {
            unint64_t v35 = v34[1];
            uint8x8_t v36 = (uint8x8_t)vcnt_s8(prime);
            v36.i16[0] = vaddlv_u8(v36);
            if (v36.u32[0] > 1uLL)
            {
              if (v35 >= *(void *)&prime) {
                v35 %= *(void *)&prime;
              }
            }
            else
            {
              v35 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)a4 + 8 * v35) = v23;
            v40 = (void *)*v34;
            if (*v34)
            {
              do
              {
                unint64_t v41 = v40[1];
                if (v36.u32[0] > 1uLL)
                {
                  if (v41 >= *(void *)&prime) {
                    v41 %= *(void *)&prime;
                  }
                }
                else
                {
                  v41 &= *(void *)&prime - 1;
                }
                if (v41 != v35)
                {
                  if (!*(void *)(*(void *)a4 + 8 * v41))
                  {
                    *(void *)(*(void *)a4 + 8 * v41) = v34;
                    goto LABEL_77;
                  }
                  void *v34 = *v40;
                  void *v40 = **(void **)(*(void *)a4 + 8 * v41);
                  **(void **)(*(void *)a4 + 8 * v41) = v40;
                  v40 = v34;
                }
                unint64_t v41 = v35;
LABEL_77:
                v34 = v40;
                v40 = (void *)*v40;
                unint64_t v35 = v41;
              }
              while (v40);
            }
          }
          unint64_t v17 = (unint64_t)prime;
          goto LABEL_81;
        }
        v46 = *(void **)a4;
        *(void *)a4 = 0;
        if (v46) {
          operator delete(v46);
        }
        unint64_t v17 = 0;
        *((void *)a4 + 1) = 0;
      }
    }
LABEL_81:
    if ((v17 & (v17 - 1)) != 0)
    {
      if (v17 <= v16) {
        unint64_t v13 = v16 % v17;
      }
      else {
        unint64_t v13 = v16;
      }
    }
    else
    {
      unint64_t v13 = (v17 - 1) & v16;
    }
    goto LABEL_86;
  }
LABEL_4:
  v8 = std::__hash_table<std::__hash_value_type<KB::String,unsigned long>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,unsigned long>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,unsigned long>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,unsigned long>>>::find<KB::String>(a4, &v51);
  if (!v8) {
    abort();
  }
  v6 = (_LXLexicon *)v8[6];
LABEL_6:
  if (v52 && BYTE6(v51) == 1) {
    free(v52);
  }
  return v6;
}

- (_LXLexicon)filterLexicon:(_LXLexicon *)a3 againstLocale:(String *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    uint64_t v5 = LXLexiconCopyName();
    v6 = [NSString stringWithFormat:@"%@_%u", v5, arc4random()];
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F72460], v6);
    v9[7] = 0;
    LXLexiconCreateTransient();
    v8 = (KB::StaticDictionary *)LXLexiconRepositoryAddOrUpdate();
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x3812000000;
    v9[3] = __Block_byref_object_copy__50;
    v9[4] = __Block_byref_object_dispose__51;
    v9[5] = 0;
    KB::StaticDictionary::create(v8);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[TITransientLexiconManager filterLexicon:againstLocale:]";
    _os_log_debug_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  Lexicon being asked to filter is null - will return a null reference in return", buf, 0xCu);
  }
  return 0;
}

void __57__TITransientLexiconManager_filterLexicon_againstLocale___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  CFStringRef v2 = (const __CFString *)LXEntryCopyString();
  v3 = *(KB::StaticDictionary **)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
  KB::utf8_string(v2, (uint64_t)&v6);
  BOOL v4 = KB::StaticDictionary::contains(v3, (const KB::String *)&v6, 0, 0.0);
  if (v7) {
    BOOL v5 = BYTE6(v6) == 1;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    free(v7);
    if (v4)
    {
LABEL_6:
      if (!v2) {
        return;
      }
      goto LABEL_7;
    }
  }
  else if (v4)
  {
    goto LABEL_6;
  }
  uint64_t v6 = 0;
  LXEntryGetTimestamp();
  LXLexiconAddWithCreationTime();
  LXLexiconIncrementUsageCount();
  if (!v2) {
    return;
  }
LABEL_7:
  CFRelease(v2);
}

- (_LXLexicon)namedEntityPhraseLexicon
{
  return self->_namedEntityPhraseLexiconRef;
}

- (_LXLexicon)namedEntityLexicon
{
  return self->_namedEntityLexiconRef;
}

- (void)getOnce:(id)a3
{
  BOOL v4 = (void (**)(id, void))a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  unint64_t v16 = __Block_byref_object_copy__4162;
  unint64_t v17 = __Block_byref_object_dispose__4163;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__TITransientLexiconManager_getOnce___block_invoke;
  v10[3] = &unk_1E6E2A750;
  uint64_t v12 = &v13;
  uint64_t v6 = v5;
  v11 = v6;
  v7 = [(TITransientLexiconManager *)self addContactObserver:v10];
  dispatch_time_t v8 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v6, v8))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_ICPredictionManager quickTypePredictionWithTrigger timeout", v9, 2u);
    }
    [(TITransientLexiconManager *)self removeContactObserver:v7];
  }
  else
  {
    [(TITransientLexiconManager *)self removeContactObserver:v7];
    v4[2](v4, v14[5]);
  }

  _Block_object_dispose(&v13, 8);
}

intptr_t __37__TITransientLexiconManager_getOnce___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

- (BOOL)searchForWordCaseInsensitive:(id)a3
{
  id v4 = a3;
  if (!self->_supplementalLexiconSearchEnabled) {
    goto LABEL_5;
  }
  dispatch_semaphore_t v5 = [(TITransientLexiconManager *)self supplementalLexicons];
  uint64_t v6 = [v5 activeWordLexicon];

  if (!v6) {
    goto LABEL_5;
  }
  v7 = [(TITransientLexiconManager *)self supplementalLexicons];
  BOOL v8 = -[TITransientLexiconManager searchHelper:forWord:caseSensitive:](self, "searchHelper:forWord:caseSensitive:", [v7 activeWordLexicon], v4, 0);

  if (v8) {
    BOOL v9 = 1;
  }
  else {
LABEL_5:
  }
    BOOL v9 = [(TITransientLexiconManager *)self searchHelper:[(TITransientLexiconManager *)self namedEntityLexicon] forWord:v4 caseSensitive:0];

  return v9;
}

- (BOOL)searchForWord:(id)a3
{
  id v4 = a3;
  if (!self->_supplementalLexiconSearchEnabled) {
    goto LABEL_4;
  }
  dispatch_semaphore_t v5 = [(TITransientLexiconManager *)self supplementalLexicons];
  uint64_t v6 = [v5 activeWordLexicon];

  if (!v6
    || ([(TITransientLexiconManager *)self supplementalLexicons],
        v7 = objc_claimAutoreleasedReturnValue(),
        BOOL v8 = 1,
        BOOL v9 = -[TITransientLexiconManager searchHelper:forWord:caseSensitive:](self, "searchHelper:forWord:caseSensitive:", [v7 activeWordLexicon], v4, 1), v7, !v9))
  {
LABEL_4:
    BOOL v8 = [(TITransientLexiconManager *)self searchHelper:[(TITransientLexiconManager *)self namedEntityLexicon] forWord:v4 caseSensitive:1];
  }

  return v8;
}

- (BOOL)searchHelper:(_LXLexicon *)a3 forWord:(__CFString *)a4 caseSensitive:(BOOL)a5
{
  if (!a3) {
    return 0;
  }
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  LXLexiconEnumerateEntriesForString();
  BOOL v5 = *((unsigned char *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v5;
}

void __64__TITransientLexiconManager_searchHelper_forWord_caseSensitive___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  CFStringRef v5 = (const __CFString *)LXEntryCopyString();
  if (CFStringCompare(v5, *(CFStringRef *)(a1 + 40), *(unsigned char *)(a1 + 48) == 0) == kCFCompareEqualTo)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }

  CFRelease(v5);
}

- (void)removeContactObserver:(id)a3
{
}

- (id)addContactObserver:(id)a3
{
  id v4 = a3;
  [(TITransientLexiconManager *)self loadLexicons];
  CFStringRef v5 = [(_ICLexiconManaging *)self->_inputContextLexiconManager addContactObserver:v4];

  return v5;
}

- (void)supplementalLexiconControllerProcessDidTerminate:(id)a3
{
  id v4 = TISupplementalLexiconOSLogFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_INFO, "Process terminated -- removing supplemental lexicon controller", v6, 2u);
  }

  supplementalLexicons = self->_supplementalLexicons;
  self->_supplementalLexicons = 0;
}

- (void)performMaintenance
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    BOOL v8 = "-[TITransientLexiconManager performMaintenance]";
    _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Performing maintenance in Transient Lexicon Manager", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v3 = [MEMORY[0x1E4F6F4C0] lexiconManager];
  inputContextLexiconManager = self->_inputContextLexiconManager;
  self->_inputContextLexiconManager = v3;

  [(TITransientLexiconManager *)self registerNamedEntitiesUpdateCallback];
  namedEntityLexiconRef = self->_namedEntityLexiconRef;
  if (namedEntityLexiconRef)
  {
    CFRelease(namedEntityLexiconRef);
    self->_namedEntityLexiconRef = 0;
  }
  namedEntityPhraseLexiconRef = self->_namedEntityPhraseLexiconRef;
  if (namedEntityPhraseLexiconRef)
  {
    CFRelease(namedEntityPhraseLexiconRef);
    self->_namedEntityPhraseLexiconRef = 0;
  }
  self->_lexiconsLoaded = 0;
  [(TITransientLexiconManager *)self loadLexicons];
  [(TITransientLexiconManager *)self namedEntitiesUpdateCallback];
}

- (void)loadLexicons
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->_lexiconsLoaded)
  {
    uint64_t v3 = [(_ICLexiconManaging *)self->_inputContextLexiconManager loadLexicons];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          BOOL v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v8 typeFlags])
          {
            char v9 = [v8 typeFlags];
            char v10 = (objc_class *)CFRetain((CFTypeRef)[v8 getLexiconImplementation]);
            if ((v9 & 4) != 0) {
              uint64_t v11 = 16;
            }
            else {
              uint64_t v11 = 8;
            }
            *(Class *)((char *)&self->super.isa + v11) = v10;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
    self->_lexiconsLoaded = 1;
  }
}

- (void)namedEntitiesUpdateCallback
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    uint64_t v3 = "-[TITransientLexiconManager namedEntitiesUpdateCallback]";
    _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Received a named entities update callback, rebuilding the cached lexicons", (uint8_t *)&v2, 0xCu);
  }
  operator new();
}

- (void)registerNamedEntitiesUpdateCallback
{
  objc_initWeak(&location, self);
  if (objc_opt_respondsToSelector())
  {
    inputContextLexiconManager = self->_inputContextLexiconManager;
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    int v7 = __64__TITransientLexiconManager_registerNamedEntitiesUpdateCallback__block_invoke;
    BOOL v8 = &unk_1E6E2BB98;
    objc_copyWeak(&v9, &location);
    uint64_t v4 = _Block_copy(&v5);
    -[_ICLexiconManaging performSelector:withObject:](inputContextLexiconManager, "performSelector:withObject:", sel_addNamedEntitiesUpdateObserver_, v4, v5, v6, v7, v8);

    objc_destroyWeak(&v9);
  }
  objc_destroyWeak(&location);
}

void __64__TITransientLexiconManager_registerNamedEntitiesUpdateCallback__block_invoke(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 32));
  TIDispatchAsync();
  objc_destroyWeak(&v1);
}

void __64__TITransientLexiconManager_registerNamedEntitiesUpdateCallback__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained namedEntitiesUpdateCallback];
    id WeakRetained = v2;
  }
}

- (TISupplementalLexiconController)supplementalLexicons
{
  return self->_supplementalLexicons;
}

- (TISupplementalLexiconController)ensureSupplementalLexicons
{
  uint64_t v3 = [(TITransientLexiconManager *)self supplementalLexicons];
  if (!v3)
  {
    uint64_t v4 = [TISupplementalLexiconController alloc];
    uint64_t v5 = [(TITransientLexiconManager *)self _currentConnection];
    uint64_t v3 = [(TISupplementalLexiconController *)v4 initWithConnection:v5];

    [(TISupplementalLexiconController *)v3 setDelegate:self];
    objc_storeStrong((id *)&self->_supplementalLexicons, v3);
  }
  uint64_t v6 = v3;

  return v6;
}

- (id)_currentConnection
{
  if (__overridingCurrentConnectionForTesting)
  {
    id v2 = (id)__overridingCurrentConnectionForTesting;
  }
  else
  {
    id v2 = [MEMORY[0x1E4F29268] currentConnection];
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  namedEntityPhraseLexiconRef = self->_namedEntityPhraseLexiconRef;
  if (namedEntityPhraseLexiconRef) {
    CFRelease(namedEntityPhraseLexiconRef);
  }
  namedEntityLexiconRef = self->_namedEntityLexiconRef;
  if (namedEntityLexiconRef) {
    CFRelease(namedEntityLexiconRef);
  }
  [(TITransientLexiconManager *)self releaseCachedNamedEntityLexicons];
  addressBookLexicons = (void **)self->_addressBookLexicons;
  if (addressBookLexicons)
  {
    int v7 = addressBookLexicons[2];
    if (v7)
    {
      do
      {
        BOOL v8 = (void *)*v7;
        std::__destroy_at[abi:nn180100]<std::pair<KB::String const,std::shared_ptr<KB::AppTrieLoader>>,0>((uint64_t)(v7 + 2));
        operator delete(v7);
        int v7 = v8;
      }
      while (v8);
    }
    id v9 = *addressBookLexicons;
    *addressBookLexicons = 0;
    if (v9) {
      operator delete(v9);
    }
    MEMORY[0x1E4E7BC20](addressBookLexicons, 0x10A0C408EF24B1CLL);
  }
  appNameLexicons = (void **)self->_appNameLexicons;
  if (appNameLexicons)
  {
    uint64_t v11 = appNameLexicons[2];
    if (v11)
    {
      do
      {
        long long v12 = (void *)*v11;
        std::__destroy_at[abi:nn180100]<std::pair<KB::String const,std::shared_ptr<KB::AppTrieLoader>>,0>((uint64_t)(v11 + 2));
        operator delete(v11);
        uint64_t v11 = v12;
      }
      while (v12);
    }
    long long v13 = *appNameLexicons;
    *appNameLexicons = 0;
    if (v13) {
      operator delete(v13);
    }
    MEMORY[0x1E4E7BC20](appNameLexicons, 0x10A0C408EF24B1CLL);
  }
  v14.receiver = self;
  v14.super_class = (Class)TITransientLexiconManager;
  [(TITransientLexiconManager *)&v14 dealloc];
}

- (void)releaseCachedNamedEntityLexicons
{
  namedEntityLexicons = self->_namedEntityLexicons;
  if (namedEntityLexicons)
  {
    uint64_t v4 = (void *)namedEntityLexicons[2];
    if (!v4) {
      goto LABEL_7;
    }
    do
    {
      uint64_t v5 = (const void *)v4[6];
      if (v5) {
        CFRelease(v5);
      }
      uint64_t v4 = (void *)*v4;
    }
    while (v4);
    namedEntityLexicons = self->_namedEntityLexicons;
    if (namedEntityLexicons)
    {
LABEL_7:
      uint64_t v6 = std::__hash_table<std::__hash_value_type<KB::String,_LXLexicon const*>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,_LXLexicon const*>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,_LXLexicon const*>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,_LXLexicon const*>>>::~__hash_table((uint64_t)namedEntityLexicons);
      MEMORY[0x1E4E7BC20](v6, 0x10A0C408EF24B1CLL);
    }
  }
  namedEntityPhraseLexicons = self->_namedEntityPhraseLexicons;
  if (namedEntityPhraseLexicons)
  {
    BOOL v8 = (void *)namedEntityPhraseLexicons[2];
    if (!v8) {
      goto LABEL_14;
    }
    do
    {
      id v9 = (const void *)v8[6];
      if (v9) {
        CFRelease(v9);
      }
      BOOL v8 = (void *)*v8;
    }
    while (v8);
    namedEntityPhraseLexicons = self->_namedEntityPhraseLexicons;
    if (namedEntityPhraseLexicons)
    {
LABEL_14:
      std::__hash_table<std::__hash_value_type<KB::String,_LXLexicon const*>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,_LXLexicon const*>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,_LXLexicon const*>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,_LXLexicon const*>>>::~__hash_table((uint64_t)namedEntityPhraseLexicons);
      JUMPOUT(0x1E4E7BC20);
    }
  }
}

- (TITransientLexiconManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)TITransientLexiconManager;
  id v2 = [(TITransientLexiconManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F6F4C0] lexiconManager];
    inputContextLexiconManager = v2->_inputContextLexiconManager;
    v2->_inputContextLexiconManager = (_ICLexiconManaging *)v3;

    [(TITransientLexiconManager *)v2 registerNamedEntitiesUpdateCallback];
    v2->_supplementalLexiconSearchEnabled = 1;
    [(TITransientLexiconManager *)v2 loadLexicons];
    operator new();
  }

  return 0;
}

+ (id)getEntries:(_LXLexicon *)a3
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  RootCursor = (const void *)LXLexiconCreateRootCursor();
  id v6 = v3;
  LXCursorEnumerateEntriesRecursively();
  CFRelease(RootCursor);

  return v6;
}

void __40__TITransientLexiconManager_getEntries___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = (id)LXEntryCopyString();
  [v1 addObject:v2];
}

+ (id)singletonInstance
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (+[TITransientLexiconManager singletonInstance]::onceToken != -1) {
      dispatch_once(&+[TITransientLexiconManager singletonInstance]::onceToken, &__block_literal_global_4184);
    }
  }
  else if (+[TITransientLexiconManager singletonInstance]::onceToken != -1)
  {
    TIDispatchSync();
  }
  id v2 = (void *)+[TITransientLexiconManager singletonInstance]::singletonInstance;

  return v2;
}

void __46__TITransientLexiconManager_singletonInstance__block_invoke_2(uint64_t a1)
{
  if (+[TITransientLexiconManager singletonInstance]::onceToken != -1) {
    dispatch_once(&+[TITransientLexiconManager singletonInstance]::onceToken, *(dispatch_block_t *)(a1 + 32));
  }
}

uint64_t __46__TITransientLexiconManager_singletonInstance__block_invoke()
{
  +[TITransientLexiconManager singletonInstance]::singletonInstance = objc_alloc_init(TITransientLexiconManager);

  return MEMORY[0x1F41817F8]();
}

+ (TITransientLexiconManager)sharedInstance
{
  if (__testingInstance)
  {
    id v2 = (id)__testingInstance;
  }
  else
  {
    id v2 = +[TITransientLexiconManager singletonInstance];
  }

  return (TITransientLexiconManager *)v2;
}

- (void)_setOverridingCurrentConnectionForTesting:(id)a3
{
}

- (NSXPCConnection)_overridingCurrentConnectionForTesting
{
  return (NSXPCConnection *)(id)__overridingCurrentConnectionForTesting;
}

+ (void)setSharedTITransientLexiconManager:(id)a3
{
  id v4 = a3;
  if ((id)__testingInstance != v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)&__testingInstance, a3);
    id v4 = v5;
  }
}

@end