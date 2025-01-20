void KB::LikelihoodInfo::~LikelihoodInfo(void **this)
{
  if (*((char *)this + 39) < 0) {
    operator delete(this[2]);
  }
}

void _GLOBAL__sub_I_TIKeyboardInputManager_th_mm()
{
  v0 = (void *)MEMORY[0x24563DBA0]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241E49000);
}

void *TIInputManager_th::create_custom_candidate_filter@<X0>(void *a1@<X8>)
{
  result = operator new(0x20uLL);
  result[1] = 0;
  result[2] = 0;
  void *result = &unk_26F5E4D60;
  result[3] = &unk_26F5E4D98;
  *a1 = result + 3;
  a1[1] = result;
  return result;
}

void TIInputManager_th::~TIInputManager_th(TIInputManager_th *this)
{
  TIInputManager::~TIInputManager(this);

  JUMPOUT(0x24563DB00);
}

void TIInputManager::filter_pre_lookup_input()
{
}

void TIInputManager::internal_string_to_external(unsigned char *a1@<X8>)
{
  *a1 = 0;
  a1[32] = 0;
}

void TIInputManager::external_string_to_internal(unsigned char *a1@<X8>)
{
  *a1 = 0;
  a1[32] = 0;
}

uint64_t TIInputManager::should_exclude_filter_corrections_if_any_candidate_matches_input(TIInputManager *this)
{
  return 0;
}

void std::__shared_ptr_emplace<KB::CandidateFilter_th>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5E4D60;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<KB::CandidateFilter_th>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5E4D60;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x24563DB00);
}

uint64_t std::__shared_ptr_emplace<KB::CandidateFilter_th>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

uint64_t _GLOBAL__sub_I_TIInputManager_th_cpp()
{
  return __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241E49000);
}

void _GLOBAL__sub_I_TIKeyboardInputManagerFavonius_th_mm()
{
  v0 = (void *)MEMORY[0x24563DBA0]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241E49000);
}

uint64_t KB::CandidateFilter_th::num_words_overlapping_input(KB::CandidateFilter_th *this, const KB::Candidate *a2, const KB::Candidate *a3)
{
  v9[4] = *MEMORY[0x263EF8340];
  KB::Candidate::capitalized_string(v9, a3);
  KB::String::String((KB::String *)v8);
  unsigned int v4 = 0;
  do
  {
    uint64_t v5 = v4;
    if (*(void *)a2 <= (unint64_t)v4) {
      break;
    }
    KB::String::append();
    char v6 = KB::String::starts_with();
    unsigned int v4 = v5 + 1;
  }
  while ((v6 & 1) != 0);
  KB::String::~String((KB::String *)v8);
  KB::String::~String((KB::String *)v9);
  return v5;
}

void KB::CandidateFilter_th::remove_duplicate_candidate_with_the_same_surface_form(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v19[4] = *MEMORY[0x263EF8340];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x4002000000;
  v14 = __Block_byref_object_copy_;
  v17 = 0;
  uint64_t v18 = 0;
  v15 = __Block_byref_object_dispose_;
  v16 = &v17;
  std::__tree<KB::String>::destroy((uint64_t)&v16, 0);
  v17 = 0;
  uint64_t v18 = 0;
  v16 = &v17;
  if (*(void *)a2 != *(void *)(a2 + 8))
  {
    char v6 = (uint64_t **)(v12 + 5);
    KB::Candidate::capitalized_string(v19, *(KB::Candidate **)a2);
    std::__tree<KB::String>::__emplace_unique_key_args<KB::String,KB::String>(v6, (uint64_t)v19);
    KB::String::~String((KB::String *)v19);
    v7 = *(uint64_t **)(a2 + 8);
    v8 = (uint64_t *)(*(void *)a2 + 1000);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 0x40000000;
    v10[2] = ___ZNK2KB18CandidateFilter_th53remove_duplicate_candidate_with_the_same_surface_formERNSt3__16vectorINS_9CandidateENS1_9allocatorIS3_EEEERKS3_P10__CFString_block_invoke;
    v10[3] = &unk_2650FDA48;
    v10[4] = &v11;
    v10[5] = a4;
    v9 = std::remove_if[abi:nn180100]<std::__wrap_iter<KB::Candidate *>,BOOL({block_pointer})(KB::Candidate const&)>(v8, v7, (uint64_t)v10);
    std::vector<KB::Candidate>::erase(a2, v9, *(long long **)(a2 + 8));
  }
  _Block_object_dispose(&v11, 8);
  std::__tree<KB::String>::destroy((uint64_t)&v16, v17);
}

void *__Block_byref_object_copy_(void *result, void *a2)
{
  result[5] = a2[5];
  v2 = a2 + 6;
  uint64_t v3 = a2[6];
  result[6] = v3;
  unsigned int v4 = result + 6;
  uint64_t v5 = a2[7];
  result[7] = v5;
  if (v5)
  {
    *(void *)(v3 + 16) = v4;
    a2[5] = v2;
    void *v2 = 0;
    a2[7] = 0;
  }
  else
  {
    result[5] = v4;
  }
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t *std::remove_if[abi:nn180100]<std::__wrap_iter<KB::Candidate *>,BOOL({block_pointer})(KB::Candidate const&)>(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  if (a1 == a2) {
    return a2;
  }
  uint64_t v5 = a1;
  while (((*(uint64_t (**)(uint64_t, uint64_t *))(a3 + 16))(a3, v5) & 1) == 0)
  {
    v5 += 125;
    if (v5 == a2) {
      return a2;
    }
  }
  if (v5 == a2) {
    return a2;
  }
  for (i = (long long *)(v5 + 125); i != (long long *)a2; i = (long long *)((char *)i + 1000))
  {
    if (((*(uint64_t (**)(uint64_t, long long *))(a3 + 16))(a3, i) & 1) == 0)
    {
      KB::Candidate::operator=(v5, i);
      v5 += 125;
    }
  }
  return v5;
}

BOOL ___ZNK2KB18CandidateFilter_th53remove_duplicate_candidate_with_the_same_surface_formERNSt3__16vectorINS_9CandidateENS1_9allocatorIS3_EEEERKS3_P10__CFString_block_invoke(uint64_t a1, KB::Candidate *this)
{
  v15[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8) + 40;
  KB::Candidate::capitalized_string(&v13, this);
  uint64_t v5 = std::__tree<KB::String>::find<KB::String>(v4, (uint64_t)&v13);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8) + 48;
  KB::String::~String((KB::String *)&v13);
  v7 = (uint64_t **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  KB::Candidate::capitalized_string(&v13, this);
  std::__tree<KB::String>::__emplace_unique_key_args<KB::String,KB::String>(v7, (uint64_t)&v13);
  KB::String::~String((KB::String *)&v13);
  if (v6 != v5)
  {
    v8 = *(KB **)(a1 + 40);
    if (v8)
    {
      KB::Candidate::capitalized_string(&v13, this);
      v10 = v14;
      if (!v14) {
        v10 = (const char *)v15;
      }
      if ((_WORD)v13) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = "";
      }
      KB::append_format(v8, (__CFString *)"[%s] removed by %s\n", v9, v11, "remove_duplicate_candidate_with_the_same_surface_form");
      KB::String::~String((KB::String *)&v13);
    }
  }
  return v6 != v5;
}

uint64_t *std::vector<KB::Candidate>::erase(uint64_t a1, uint64_t *a2, long long *a3)
{
  if (a2 != (uint64_t *)a3)
  {
    std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,KB::Candidate *,KB::Candidate *,KB::Candidate *,0>(a3, *(long long **)(a1 + 8), a2);
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)(a1 + 8);
    if (v7 != v5)
    {
      do
        uint64_t v7 = MEMORY[0x24563DA60](v7 - 1000);
      while (v7 != v6);
    }
    *(void *)(a1 + 8) = v6;
  }
  return a2;
}

uint64_t *KB::CandidateFilter_th::remove_low_word_score_candidate(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)a2;
  uint64_t v5 = *(uint64_t **)(a2 + 8);
  if ((uint64_t *)v6 != v5)
  {
    int v7 = *(_DWORD *)(v6 + 752);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 0x40000000;
    v9[2] = ___ZNK2KB18CandidateFilter_th31remove_low_word_score_candidateERNSt3__16vectorINS_9CandidateENS1_9allocatorIS3_EEEERKS3_P10__CFString_block_invoke;
    v9[3] = &__block_descriptor_tmp_4;
    v9[4] = result;
    uint64_t v9[5] = a3;
    int v10 = v7;
    v9[6] = a4;
    v8 = std::remove_if[abi:nn180100]<std::__wrap_iter<KB::Candidate *>,BOOL({block_pointer})(KB::Candidate const&)>((uint64_t *)(v6 + 1000), v5, (uint64_t)v9);
    return std::vector<KB::Candidate>::erase(a2, v8, *(long long **)(a2 + 8));
  }
  return result;
}

uint64_t ___ZNK2KB18CandidateFilter_th31remove_low_word_score_candidateERNSt3__16vectorINS_9CandidateENS1_9allocatorIS3_EEEERKS3_P10__CFString_block_invoke(uint64_t a1, float *a2)
{
  v12[2] = *MEMORY[0x263EF8340];
  int v4 = *(_DWORD *)a2;
  if ((int)(v4
           - KB::CandidateFilter_th::num_words_overlapping_input((KB::CandidateFilter_th *)a1, (const KB::Candidate *)a2, *(const KB::Candidate **)(a1 + 40))) <= 2&& (float)(*(float *)(a1 + 56) - a2[188]) <= 8.0)
  {
    return 0;
  }
  uint64_t v5 = *(KB **)(a1 + 48);
  if (v5)
  {
    KB::Candidate::capitalized_string(&v10, (KB::Candidate *)a2);
    int v7 = v11;
    if (!v11) {
      int v7 = (const char *)v12;
    }
    if ((_WORD)v10) {
      v8 = v7;
    }
    else {
      v8 = "";
    }
    KB::append_format(v5, (__CFString *)"[%s] removed by %s\n", v6, v8, "remove_low_word_score_candidate");
    KB::String::~String((KB::String *)&v10);
  }
  return 1;
}

void KB::CandidateFilter_th::remove_candidate_having_more_words(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(uint64_t **)a2;
  uint64_t v5 = *(uint64_t **)(a2 + 8);
  if (v6 != v5)
  {
    uint64_t v7 = *v6;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 0x40000000;
    v9[2] = ___ZNK2KB18CandidateFilter_th34remove_candidate_having_more_wordsERNSt3__16vectorINS_9CandidateENS1_9allocatorIS3_EEEERKS3_P10__CFString_block_invoke;
    v9[3] = &__block_descriptor_tmp_6;
    int v10 = v7;
    v9[4] = a4;
    v8 = std::remove_if[abi:nn180100]<std::__wrap_iter<KB::Candidate *>,BOOL({block_pointer})(KB::Candidate const&)>(v6 + 125, v5, (uint64_t)v9);
    std::vector<KB::Candidate>::erase(a2, v8, *(long long **)(a2 + 8));
  }
}

BOOL ___ZNK2KB18CandidateFilter_th34remove_candidate_having_more_wordsERNSt3__16vectorINS_9CandidateENS1_9allocatorIS3_EEEERKS3_P10__CFString_block_invoke(uint64_t a1, KB::Candidate *this)
{
  v11[2] = *MEMORY[0x263EF8340];
  unint64_t v2 = *(int *)(a1 + 40);
  unint64_t v3 = *(void *)this;
  if (*(void *)this > v2)
  {
    int v4 = *(KB **)(a1 + 32);
    if (v4)
    {
      KB::Candidate::capitalized_string(&v9, this);
      uint64_t v6 = v10;
      if (!v10) {
        uint64_t v6 = (const char *)v11;
      }
      if ((_WORD)v9) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = "";
      }
      KB::append_format(v4, (__CFString *)"[%s] removed by %s\n", v5, v7, "remove_candidate_having_more_words");
      KB::String::~String((KB::String *)&v9);
    }
  }
  return v3 > v2;
}

const char *KB::CandidateFilter_th::filter_description(KB::CandidateFilter_th *this)
{
  return "CandidateFilter_th:";
}

void KB::CandidateFilter_th::filter_candidates(uint64_t *a1, uint64_t a2, uint64_t a3, KB::CandidateFilterResources *this)
{
  uint64_t v8 = KB::CandidateFilterResources::debug_stream(this);
  KB::CandidateFilter_th::remove_duplicate_candidate_with_the_same_surface_form(v8, a2, v9, v8);
  uint64_t v10 = KB::CandidateFilterResources::debug_stream(this);
  KB::CandidateFilter_th::remove_low_word_score_candidate(a1, a2, a3, v10);
  uint64_t v11 = KB::CandidateFilterResources::debug_stream(this);

  KB::CandidateFilter_th::remove_candidate_having_more_words(v11, a2, v12, v11);
}

void KB::CandidateFilter_th::~CandidateFilter_th(KB::CandidateFilter_th *this)
{
}

uint64_t *KB::Candidate::operator=(uint64_t *a1, long long *a2)
{
  uint64_t v4 = *a1;
  *a1 = *(void *)a2;
  *(void *)a2 = v4;
  WTF::VectorBuffer<KB::Word,3ul>::swap(a1 + 1, (void *)a2 + 1);
  long long v5 = *(long long *)((char *)a2 + 744);
  long long v6 = *(long long *)((char *)a2 + 760);
  a1[97] = *((void *)a2 + 97);
  *(_OWORD *)(a1 + 93) = v5;
  *(_OWORD *)(a1 + 95) = v6;
  KB::LanguageModelContext::operator=((uint64_t)(a1 + 98), a2 + 49);
  KB::String::operator=();
  uint64_t v7 = (void **)(a1 + 115);
  if (*((char *)a1 + 943) < 0) {
    operator delete(*v7);
  }
  long long v8 = *(long long *)((char *)a2 + 920);
  a1[117] = *((void *)a2 + 117);
  *(_OWORD *)uint64_t v7 = v8;
  *((unsigned char *)a2 + 943) = 0;
  *((unsigned char *)a2 + 920) = 0;
  KB::ByteString::operator=();
  *((_OWORD *)a1 + 60) = a2[60];
  uint64_t v9 = (const void *)a1[122];
  if (v9) {
    CFRelease(v9);
  }
  a1[122] = 0;
  uint64_t v10 = *((void *)a2 + 122);
  *((void *)a2 + 122) = 0;
  a1[122] = v10;
  uint64_t v11 = (const void *)a1[123];
  if (v11) {
    CFRelease(v11);
  }
  a1[123] = 0;
  uint64_t v12 = *((void *)a2 + 123);
  *((void *)a2 + 123) = 0;
  a1[123] = v12;
  *((_DWORD *)a1 + 248) = *((_DWORD *)a2 + 248);
  return a1;
}

uint64_t KB::LanguageModelContext::operator=(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  long long v5 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v4;
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v5);
  }
  std::vector<TITokenID>::__move_assign(a1 + 16, (__n128 *)a2 + 1);
  long long v6 = *(long long *)((char *)a2 + 40);
  *(void *)(a1 + 56) = *((void *)a2 + 7);
  *(_OWORD *)(a1 + 40) = v6;
  language_modeling::v1::LinguisticContext::operator=();
  language_modeling::v1::LinguisticContext::operator=();
  std::vector<std::string>::__vdeallocate((std::vector<std::string> *)(a1 + 80));
  *(_OWORD *)(a1 + 80) = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *((void *)a2 + 10) = 0;
  *((void *)a2 + 11) = 0;
  *((void *)a2 + 12) = 0;
  return a1;
}

void *WTF::VectorBuffer<KB::Word,3ul>::swap(void *result, void *a2)
{
  unint64_t v3 = result + 2;
  unint64_t v2 = (void *)*result;
  long long v4 = a2 + 2;
  long long v5 = (void *)*a2;
  if ((void *)*result == result + 2)
  {
    if (v5 == v4)
    {
      for (uint64_t i = 0; i != 720; ++i)
      {
        char v11 = *((unsigned char *)v2 + i);
        *((unsigned char *)v2 + i) = *((unsigned char *)v4 + i);
        *((unsigned char *)v4 + i) = v11;
      }
    }
    else
    {
      uint64_t v6 = 0;
      void *result = v5;
      *a2 = v4;
      do
      {
        char v7 = *((unsigned char *)v2 + v6);
        *((unsigned char *)v2 + v6) = *((unsigned char *)v4 + v6);
        *((unsigned char *)v4 + v6++) = v7;
      }
      while (v6 != 720);
    }
  }
  else if (v5 == v4)
  {
    uint64_t v8 = 0;
    *a2 = v2;
    void *result = v3;
    do
    {
      char v9 = *((unsigned char *)v3 + v8);
      *((unsigned char *)v3 + v8) = *((unsigned char *)v5 + v8);
      *((unsigned char *)v5 + v8++) = v9;
    }
    while (v8 != 720);
  }
  else
  {
    void *result = v5;
    *a2 = v2;
  }
  uint64_t v12 = result[1];
  result[1] = a2[1];
  a2[1] = v12;
  return result;
}

void std::__shared_weak_count::__release_shared[abi:nn180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

__n128 std::vector<TITokenID>::__move_assign(uint64_t a1, __n128 *a2)
{
  long long v4 = *(void **)a1;
  if (v4)
  {
    *(void *)(a1 + 8) = v4;
    operator delete(v4);
    *(void *)a1 = 0;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
  }
  __n128 result = *a2;
  *(__n128 *)a1 = *a2;
  *(void *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  return result;
}

void std::vector<std::string>::__vdeallocate(std::vector<std::string> *this)
{
  if (this->__begin_)
  {
    std::vector<std::string>::__clear[abi:nn180100]((uint64_t *)this);
    operator delete(this->__begin_);
    this->__begin_ = 0;
    this->__end_ = 0;
    this->__end_cap_.__value_ = 0;
  }
}

void std::vector<std::string>::__clear[abi:nn180100](uint64_t *a1)
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

long long *std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,KB::Candidate *,KB::Candidate *,KB::Candidate *,0>(long long *a1, long long *a2, uint64_t *a3)
{
  long long v4 = a1;
  if (a1 != a2)
  {
    do
    {
      KB::Candidate::operator=(a3, v4);
      long long v4 = (long long *)((char *)v4 + 1000);
      a3 += 125;
    }
    while (v4 != a2);
    return a2;
  }
  return v4;
}

void std::__tree<KB::String>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<KB::String>::destroy(a1, *a2);
    std::__tree<KB::String>::destroy(a1, a2[1]);
    KB::String::~String((KB::String *)(a2 + 4));
    operator delete(a2);
  }
}

uint64_t *std::__tree<KB::String>::__emplace_unique_key_args<KB::String,KB::String>(uint64_t **a1, uint64_t a2)
{
  unint64_t v3 = (uint64_t **)std::__tree<KB::String>::__find_equal<KB::String>((uint64_t)a1, &v9, a2);
  long long v4 = *v3;
  if (!*v3)
  {
    long long v5 = v3;
    long long v4 = (uint64_t *)operator new(0x40uLL);
    v7[1] = (uint64_t)(a1 + 1);
    KB::String::String();
    char v8 = 1;
    std::__tree<KB::String>::__insert_node_at(a1, v9, v5, v4);
    v7[0] = 0;
    std::unique_ptr<std::__tree_node<KB::String,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<KB::String,void *>>>>::reset[abi:nn180100](v7, 0);
  }
  return v4;
}

void *std::__tree<KB::String>::__find_equal<KB::String>(uint64_t a1, void *a2, uint64_t a3)
{
  long long v5 = (void *)(a1 + 8);
  long long v4 = *(void **)(a1 + 8);
  if (v4)
  {
    if (*(void *)(a3 + 8)) {
      uint64_t v6 = *(const char **)(a3 + 8);
    }
    else {
      uint64_t v6 = (const char *)(a3 + 16);
    }
    do
    {
      while (1)
      {
        char v7 = v4;
        char v8 = (void *)v4[5];
        uint64_t v9 = (const char *)(v8 ? v8 : v7 + 6);
        if ((strcmp(v6, v9) & 0x80000000) == 0) {
          break;
        }
        long long v4 = (void *)*v7;
        long long v5 = v7;
        if (!*v7) {
          goto LABEL_15;
        }
      }
      if ((strcmp(v9, v6) & 0x80000000) == 0) {
        break;
      }
      long long v5 = v7 + 1;
      long long v4 = (void *)v7[1];
    }
    while (v4);
  }
  else
  {
    char v7 = (void *)(a1 + 8);
  }
LABEL_15:
  *a2 = v7;
  return v5;
}

uint64_t *std::__tree<KB::String>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  long long v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  __n128 result = std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      unint64_t v3 = (uint64_t *)v2[2];
      long long v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), long long v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            uint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            uint64_t v9 = (uint64_t **)v2[1];
            uint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              unint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            const char *v9 = v2;
            v2[2] = (uint64_t)v9;
            unint64_t v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *unint64_t v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), long long v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            unint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          unint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *long long v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::unique_ptr<std::__tree_node<KB::String,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<KB::String,void *>>>>::reset[abi:nn180100](uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    if (*((unsigned char *)a1 + 16)) {
      KB::String::~String((KB::String *)(v2 + 32));
    }
    operator delete((void *)v2);
  }
}

uint64_t std::__tree<KB::String>::find<KB::String>(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 8;
  uint64_t v4 = std::__tree<KB::String>::__lower_bound<KB::String>(a1, a2, *(void *)(a1 + 8), a1 + 8);
  if (v3 == v4) {
    return v3;
  }
  uint64_t v5 = v4;
  int v6 = *(void *)(a2 + 8) ? *(const char **)(a2 + 8) : (const char *)(a2 + 16);
  uint64_t v7 = *(void *)(v5 + 40) ? *(const char **)(v5 + 40) : (const char *)(v5 + 48);
  if (strcmp(v6, v7) < 0) {
    return v3;
  }
  return v5;
}

uint64_t std::__tree<KB::String>::__lower_bound<KB::String>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t v5 = a3;
    if (*(void *)(a2 + 8)) {
      int v6 = *(const char **)(a2 + 8);
    }
    else {
      int v6 = (const char *)(a2 + 16);
    }
    do
    {
      if (*(void *)(v5 + 40)) {
        uint64_t v7 = *(const char **)(v5 + 40);
      }
      else {
        uint64_t v7 = (const char *)(v5 + 48);
      }
      int v8 = strcmp(v7, v6);
      uint64_t v9 = (uint64_t *)(v5 + 8);
      if (v8 >= 0)
      {
        uint64_t v9 = (uint64_t *)v5;
        a4 = v5;
      }
      uint64_t v5 = *v9;
    }
    while (*v9);
  }
  return a4;
}

uint64_t _GLOBAL__sub_I_TICandidateFilter_th_cpp()
{
  return __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241E49000);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MecabraCandidateGetAnalysisString()
{
  return MEMORY[0x270F99D00]();
}

uint64_t MecabraCandidateGetWordCount()
{
  return MEMORY[0x270F99D28]();
}

uint64_t TICanLogMessageAtLevel()
{
  return MEMORY[0x270F7CCE0]();
}

uint64_t TIOSLogFacility()
{
  return MEMORY[0x270F7CD18]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t TIInputManager::set_search_algorithm()
{
  return MEMORY[0x270F7CE28]();
}

uint64_t TIInputManager::TIInputManager()
{
  return MEMORY[0x270F7CEB8]();
}

void TIInputManager::~TIInputManager(TIInputManager *this)
{
}

uint64_t language_modeling::v1::LinguisticContext::operator=()
{
  return MEMORY[0x270F46CD0]();
}

uint64_t KB::ByteString::operator=()
{
  return MEMORY[0x270F7CEF8]();
}

uint64_t KB::std_string(KB *this, NSString *a2)
{
  return MEMORY[0x270F7CF08](this, a2);
}

uint64_t KB::append_format(KB *this, __CFString *a2, const char *a3, ...)
{
  return MEMORY[0x270F7CF40](this, a2, a3);
}

uint64_t KB::String::append()
{
  return MEMORY[0x270F7D048]();
}

uint64_t KB::String::String()
{
  return MEMORY[0x270F7D070]();
}

{
  return MEMORY[0x270F7D080]();
}

uint64_t KB::String::String(KB::String *this)
{
  return MEMORY[0x270F7D090](this);
}

void KB::String::~String(KB::String *this)
{
}

uint64_t KB::String::operator=()
{
  return MEMORY[0x270F7D0A0]();
}

void KB::Candidate::~Candidate(KB::Candidate *this)
{
}

uint64_t KB::ns_string(KB *this, const KB::String *a2)
{
  return MEMORY[0x270F7D0E0](this, a2);
}

uint64_t TIInputManager::LockedInput::locked_length(TIInputManager::LockedInput *this)
{
  return MEMORY[0x270F7D170](this);
}

uint64_t TIInputManager::input_substring(TIInputManager *this)
{
  return MEMORY[0x270F7D198](this);
}

uint64_t KB::CandidateFilterResources::debug_stream(KB::CandidateFilterResources *this)
{
  return MEMORY[0x270F7D200](this);
}

uint64_t KB::String::starts_with()
{
  return MEMORY[0x270F7D218]();
}

uint64_t KB::Candidate::capitalized_string(KB::Candidate *this)
{
  return MEMORY[0x270F7D260](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}