void KB::LikelihoodInfo::~LikelihoodInfo(void **this)
{
  if (*((char *)this + 39) < 0) {
    operator delete(this[2]);
  }
}

void *TIInputManager_hi::create_custom_candidate_filter@<X0>(void *a1@<X8>)
{
  result = operator new(0x20uLL);
  result[1] = 0;
  result[2] = 0;
  void *result = &unk_26F5DCC60;
  result[3] = MEMORY[0x263F7EBC0] + 16;
  *a1 = result + 3;
  a1[1] = result;
  return result;
}

void TIInputManager_hi::~TIInputManager_hi(TIInputManager_hi *this)
{
  TIInputManager::~TIInputManager(this);
  JUMPOUT(0x24563BEF0);
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

void std::__shared_ptr_emplace<KB::CandidateFilter_Indic>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5DCC60;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<KB::CandidateFilter_Indic>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5DCC60;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24563BEF0);
}

uint64_t std::__shared_ptr_emplace<KB::CandidateFilter_Indic>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

uint64_t _GLOBAL__sub_I_TIInputManager_hi_cpp()
{
  return __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241DF9000);
}

void TIInputManager::~TIInputManager(TIInputManager *this)
{
}

uint64_t KB::String::String()
{
  return MEMORY[0x270F7D080]();
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