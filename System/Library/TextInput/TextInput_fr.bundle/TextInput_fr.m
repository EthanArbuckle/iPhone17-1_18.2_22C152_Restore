void KB::LikelihoodInfo::~LikelihoodInfo(void **this)
{
  if (*((char *)this + 39) < 0) {
    operator delete(this[2]);
  }
}

uint64_t TIInputManager::set_input_manager_specialization(TIInputManager *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v3 = a2[1];
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  *((void *)a1 + 68) = v4;
  v5 = (std::__shared_weak_count *)*((void *)a1 + 69);
  *((void *)a1 + 69) = v3;
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v5);
  }
  uint64_t result = *((void *)a1 + 23);
  if (result)
  {
    (*(void (**)(atomic_uint **__return_ptr))(*(void *)result + 168))(&v17);
    uint64_t result = (uint64_t)v17;
    if (v17)
    {
      unsigned int v7 = atomic_load((unsigned int *)v17 + 2);
      if (v7 == 1) {
        (*(void (**)(void))(*(void *)v17 + 40))();
      }
      else {
        atomic_fetch_add(v17 + 2, 0xFFFFFFFF);
      }
      uint64_t v8 = *((void *)a1 + 68);
      v9 = *(unsigned int **)TIInputManager::favonius_layout(a1);
      v16 = v9;
      if (v9) {
        atomic_fetch_add((atomic_uint *volatile)v9, 1u);
      }
      (*(void (**)(atomic_uint **__return_ptr, uint64_t, unsigned int **))(*(void *)v8 + 16))(&v17, v8, &v16);
      if (v16) {
        WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v16);
      }
      (*(void (**)(unsigned int **__return_ptr))(**((void **)a1 + 23) + 168))(&v15);
      v10 = (unsigned int *)v17;
      v17 = 0;
      v14 = v10;
      (*(void (**)(unsigned int *, unsigned int **))(*(void *)v15 + 24))(v15, &v14);
      if (v14)
      {
        unsigned int v11 = atomic_load(v14 + 2);
        if (v11 == 1) {
          (*(void (**)(void))(*(void *)v14 + 8))();
        }
        else {
          atomic_fetch_add((atomic_uint *volatile)v14 + 2, 0xFFFFFFFF);
        }
      }
      if (v15)
      {
        unsigned int v12 = atomic_load(v15 + 2);
        if (v12 == 1) {
          (*(void (**)(void))(*(void *)v15 + 40))();
        }
        else {
          atomic_fetch_add((atomic_uint *volatile)v15 + 2, 0xFFFFFFFF);
        }
      }
      uint64_t result = (uint64_t)v17;
      if (v17)
      {
        unsigned int v13 = atomic_load((unsigned int *)v17 + 2);
        if (v13 == 1) {
          return (*(uint64_t (**)(void))(*(void *)v17 + 8))();
        }
        else {
          atomic_fetch_add(v17 + 2, 0xFFFFFFFF);
        }
      }
    }
  }
  return result;
}

unsigned int *WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(unsigned int *result)
{
  v1 = result;
  unsigned int v2 = atomic_load(result);
  if (v2 == 1)
  {
    KB::String::~String((KB::String *)(result + 52));
    std::__tree<std::__value_type<float,int>,std::__map_value_compare<float,std::__value_type<float,int>,std::less<float>,true>,std::allocator<std::__value_type<float,int>>>::destroy((uint64_t)(v1 + 44), *((void **)v1 + 23));
    std::__tree<std::__value_type<float,int>,std::__map_value_compare<float,std::__value_type<float,int>,std::less<float>,true>,std::allocator<std::__value_type<float,int>>>::destroy((uint64_t)(v1 + 38), *((void **)v1 + 20));
    std::__hash_table<std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::__unordered_map_hasher<KB::ByteString,std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::hash<KB::ByteString>,std::equal_to<KB::ByteString>,true>,std::__unordered_map_equal<KB::ByteString,std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::equal_to<KB::ByteString>,std::hash<KB::ByteString>,true>,std::allocator<std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>>>::~__hash_table((uint64_t)(v1 + 18));
    std::__hash_table<std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>>>::~__hash_table((uint64_t)(v1 + 8));
    uint64_t v3 = (void **)(v1 + 2);
    std::vector<WTF::RefPtr<TI::Favonius::LayoutKey>>::__destroy_vector::operator()[abi:nn180100](&v3);
    return (unsigned int *)MEMORY[0x24563BBC0](v1, 0x10B0C409EA53459);
  }
  else
  {
    atomic_fetch_add((atomic_uint *volatile)result, 0xFFFFFFFF);
  }
  return result;
}

void std::__tree<std::__value_type<float,int>,std::__map_value_compare<float,std::__value_type<float,int>,std::less<float>,true>,std::allocator<std::__value_type<float,int>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<float,int>,std::__map_value_compare<float,std::__value_type<float,int>,std::less<float>,true>,std::allocator<std::__value_type<float,int>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<float,int>,std::__map_value_compare<float,std::__value_type<float,int>,std::less<float>,true>,std::allocator<std::__value_type<float,int>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::__unordered_map_hasher<KB::ByteString,std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::hash<KB::ByteString>,std::equal_to<KB::ByteString>,true>,std::__unordered_map_equal<KB::ByteString,std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::equal_to<KB::ByteString>,std::hash<KB::ByteString>,true>,std::allocator<std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::__unordered_map_hasher<KB::ByteString,std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::hash<KB::ByteString>,std::equal_to<KB::ByteString>,true>,std::__unordered_map_equal<KB::ByteString,std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::equal_to<KB::ByteString>,std::hash<KB::ByteString>,true>,std::allocator<std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>>>::__deallocate_node(a1, *(unsigned __int16 **)(a1 + 16));
  unsigned int v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::__unordered_map_hasher<KB::ByteString,std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::hash<KB::ByteString>,std::equal_to<KB::ByteString>,true>,std::__unordered_map_equal<KB::ByteString,std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::equal_to<KB::ByteString>,std::hash<KB::ByteString>,true>,std::allocator<std::__hash_value_type<KB::ByteString,WTF::RefPtr<TI::Favonius::LayoutKey>>>>::__deallocate_node(uint64_t a1, unsigned __int16 *a2)
{
  if (a2)
  {
    unsigned int v2 = a2;
    do
    {
      uint64_t v3 = *(unsigned __int16 **)v2;
      std::__destroy_at[abi:nn180100]<std::pair<KB::ByteString const,WTF::RefPtr<TI::Favonius::LayoutKey>>,0>(v2 + 8);
      operator delete(v2);
      unsigned int v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__destroy_at[abi:nn180100]<std::pair<KB::ByteString const,WTF::RefPtr<TI::Favonius::LayoutKey>>,0>(unsigned __int16 *a1)
{
  uint64_t result = *((void *)a1 + 2);
  if (result) {
    uint64_t result = WTF::RefCounted<TI::Favonius::Key>::deref(result);
  }
  if (*a1 >= 0xFu)
  {
    uint64_t result = *((void *)a1 + 1);
    if (result)
    {
      JUMPOUT(0x24563BBA0);
    }
  }
  return result;
}

uint64_t WTF::RefCounted<TI::Favonius::Key>::deref(uint64_t result)
{
  uint64_t v1 = result;
  unsigned int v2 = atomic_load((unsigned int *)result);
  if (v2 == 1)
  {
    if (*(unsigned __int16 *)(result + 40) >= 0xFu)
    {
      uint64_t v3 = *(void *)(result + 48);
      if (v3) {
        MEMORY[0x24563BBA0](v3, 0x1000C8077774924);
      }
    }
    KB::String::~String((KB::String *)(v1 + 8));
    JUMPOUT(0x24563BBC0);
  }
  atomic_fetch_add((atomic_uint *volatile)result, 0xFFFFFFFF);
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  unsigned int v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,WTF::RefPtr<TI::Favonius::LayoutKey>>>>::__deallocate_node(int a1, void *__p)
{
  if (__p)
  {
    unsigned int v2 = __p;
    do
    {
      uint64_t v3 = (void *)*v2;
      uint64_t v4 = v2[3];
      if (v4) {
        WTF::RefCounted<TI::Favonius::Key>::deref(v4);
      }
      operator delete(v2);
      unsigned int v2 = v3;
    }
    while (v3);
  }
}

void std::vector<WTF::RefPtr<TI::Favonius::LayoutKey>>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  unsigned int v2 = *a1;
  if (*v2)
  {
    std::vector<WTF::RefPtr<TI::Favonius::LayoutKey>>::__clear[abi:nn180100](v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void *std::vector<WTF::RefPtr<TI::Favonius::LayoutKey>>::__clear[abi:nn180100](void *result)
{
  uint64_t v1 = result;
  uint64_t v2 = *result;
  for (uint64_t i = result[1]; i != v2; i -= 8)
  {
    uint64_t v4 = *(void **)(i - 8);
    uint64_t result = v4;
    if (v4) {
      uint64_t result = (void *)WTF::RefCounted<TI::Favonius::Key>::deref((uint64_t)result);
    }
  }
  v1[1] = v2;
  return result;
}

void std::__shared_ptr_emplace<KB::InputManagerSpecialization_fr>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5DC5C0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<KB::InputManagerSpecialization_fr>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5DC5C0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x24563BBC0);
}

uint64_t std::__shared_ptr_emplace<KB::InputManagerSpecialization_fr>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_weak_count::__release_shared[abi:nn180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void _GLOBAL__sub_I_TIKeyboardFeatureSpecialization_fr_mm()
{
  v0 = (void *)MEMORY[0x24563BC60]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241DF2000);
}

KB::InputManagerSpecialization_fr *KB::InputManagerSpecialization_fr::InputManagerSpecialization_fr(KB::InputManagerSpecialization_fr *this, const __CFLocale *a2, const KB::String *a3)
{
  v5 = (void *)KB::InputManagerSpecialization::InputManagerSpecialization(this, a2);
  void *v5 = &unk_26F5DC5F8;
  MEMORY[0x24563BAD0](v5 + 2, a3);
  return this;
}

{
  void *v5;

  v5 = (void *)KB::InputManagerSpecialization::InputManagerSpecialization(this, a2);
  void *v5 = &unk_26F5DC5F8;
  MEMORY[0x24563BAD0](v5 + 2, a3);
  return this;
}

unsigned int *KB::InputManagerSpecialization_fr::create_input_segment_filter@<X0>(uint64_t a1@<X0>, TI::Favonius::KeyboardLayout **a2@<X1>, void *a3@<X8>)
{
  v6 = (unsigned __int16 *)(a1 + 16);
  int v5 = *(unsigned __int16 *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = a1 + 32;
  if (!v7) {
    uint64_t v7 = a1 + 32;
  }
  uint64_t v18 = v7;
  int v19 = 0;
  int v20 = v5;
  unsigned int v21 = 0;
  KB::String::iterator::initialize((KB::String::iterator *)&v18);
  int v9 = *v6;
  uint64_t v10 = *((void *)v6 + 1);
  if (!v10) {
    uint64_t v10 = v8;
  }
  uint64_t v14 = v10;
  int v15 = v9;
  int v16 = v9;
  int v17 = 0;
  KB::String::iterator::initialize((KB::String::iterator *)&v14);
  while (v19 != v15)
  {
    TI::Favonius::KeyboardLayout::key_for_char(*a2);
    if (v22)
    {
      WTF::RefCounted<TI::Favonius::Key>::deref(v22);
      operator new();
    }
    KB::String::iterator::operator++();
  }
  unsigned int v11 = *a2;
  *a2 = 0;
  unsigned int v13 = (unsigned int *)v11;
  KB::InputManagerSpecialization::create_input_segment_filter(a3);
  uint64_t result = v13;
  if (v13) {
    return WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v13);
  }
  return result;
}

void KB::InputManagerSpecialization::create_input_segment_filter(void *a1@<X8>)
{
  {
    __cxa_atexit((void (*)(void *))WTF::RefPtr<KB::InputSegmentFilter>::~RefPtr, &KB::InputManagerSpecialization::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::filter, &dword_241DF2000);
  }
  if (KB::InputManagerSpecialization::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::once != -1) {
    dispatch_once(&KB::InputManagerSpecialization::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::once, &__block_literal_global_0);
  }
  uint64_t v2 = (atomic_uint *)KB::InputManagerSpecialization::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::filter;
  *a1 = KB::InputManagerSpecialization::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::filter;
  if (v2) {
    atomic_fetch_add(v2 + 2, 1u);
  }
}

void *KB::InputManagerSpecialization_fr::do_create_custom_candidate_filter@<X0>(void *a1@<X8>)
{
  uint64_t result = operator new(0x20uLL);
  result[1] = 0;
  result[2] = 0;
  *uint64_t result = &unk_26F5DC6D8;
  result[3] = &unk_26F5DC710;
  *a1 = result + 3;
  a1[1] = result;
  return result;
}

void KB::InputManagerSpecialization_fr::~InputManagerSpecialization_fr(KB::InputManagerSpecialization_fr *this)
{
  *(void *)this = &unk_26F5DC5F8;
  KB::String::~String((KB::InputManagerSpecialization_fr *)((char *)this + 16));

  KB::InputManagerSpecialization::~InputManagerSpecialization(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_26F5DC5F8;
  KB::String::~String((KB::InputManagerSpecialization_fr *)((char *)this + 16));
  KB::InputManagerSpecialization::~InputManagerSpecialization(this);

  JUMPOUT(0x24563BBC0);
}

uint64_t KB::InputManagerSpecialization::get_does_need_spell_check()
{
  return 0;
}

uint64_t KB::InputManagerSpecialization::get_period_ends_sentence_after_word()
{
  return 1;
}

uint64_t KB::InputManagerSpecialization::get_should_correct_explicitly_shifted_word(KB::InputManagerSpecialization *this)
{
  return 1;
}

uint64_t KB::InputManagerSpecialization::get_should_promote_case_variants_of_top_candidate(KB::InputManagerSpecialization *this)
{
  return 0;
}

uint64_t KB::InputManagerSpecialization::do_capitalize_first_letter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270F7D038](a2, a3);
}

unsigned int **WTF::RefPtr<KB::InputSegmentFilter>::~RefPtr(unsigned int **a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    unsigned int v3 = atomic_load(v2 + 2);
    if (v3 == 1) {
      (*(void (**)(unsigned int *))(*(void *)v2 + 8))(v2);
    }
    else {
      atomic_fetch_add((atomic_uint *volatile)v2 + 2, 0xFFFFFFFF);
    }
  }
  return a1;
}

void ___ZNK2KB26InputManagerSpecialization27create_input_segment_filterEN3WTF10PassRefPtrIN2TI8Favonius14KeyboardLayoutEEE_block_invoke()
{
}

void KB::DefaultInputSegmentFilter::~DefaultInputSegmentFilter(KB::DefaultInputSegmentFilter *this)
{
}

void std::__shared_ptr_emplace<KB::CandidateFilter_fr>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5DC6D8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<KB::CandidateFilter_fr>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5DC6D8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x24563BBC0);
}

uint64_t std::__shared_ptr_emplace<KB::CandidateFilter_fr>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

uint64_t _GLOBAL__sub_I_TIInputManagerSpecialization_fr_cpp()
{
  return __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241DF2000);
}

const char *KB::CandidateFilter_fr::filter_description(KB::CandidateFilter_fr *this)
{
  return "CandidateFilter_fr";
}

void KB::CandidateFilter_fr::filter_candidates(int a1, uint64_t a2, KB::Candidate *this, uint64_t a4)
{
  int v4 = *((_DWORD *)this + 792);
  if ((v4 - 3) < 4 || v4 == 1)
  {
    uint64_t v8 = (KB::String *)KB::Candidate::string(this);
    int v9 = KB::String::count(v8);
    unsigned int v11 = *(uint64_t **)a2;
    uint64_t v10 = *(uint64_t **)(a2 + 8);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 0x40000000;
    v13[2] = ___ZNK2KB18CandidateFilter_fr17filter_candidatesERNS_19CandidateCollectionERKNS_28CandidateFilterLookupContextERKNS_24CandidateFilterResourcesE_block_invoke;
    v13[3] = &__block_descriptor_tmp_0;
    int v14 = v9;
    v13[4] = a4;
    unsigned int v12 = std::remove_if[abi:nn180100]<std::__wrap_iter<KB::Candidate *>,BOOL({block_pointer})(KB::Candidate const&)>(v11, v10, (uint64_t)v13);
    std::vector<KB::Candidate>::erase(a2, v12, *(long long **)(a2 + 8));
  }
}

uint64_t *std::remove_if[abi:nn180100]<std::__wrap_iter<KB::Candidate *>,BOOL({block_pointer})(KB::Candidate const&)>(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  if (a1 == a2) {
    return a2;
  }
  int v5 = a1;
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
  for (uint64_t i = (long long *)(v5 + 125); i != (long long *)a2; uint64_t i = (long long *)((char *)i + 1000))
  {
    if (((*(uint64_t (**)(uint64_t, long long *))(a3 + 16))(a3, i) & 1) == 0)
    {
      KB::Candidate::operator=(v5, i);
      v5 += 125;
    }
  }
  return v5;
}

BOOL ___ZNK2KB18CandidateFilter_fr17filter_candidatesERNS_19CandidateCollectionERKNS_28CandidateFilterLookupContextERKNS_24CandidateFilterResourcesE_block_invoke(uint64_t a1, KB::Candidate *this)
{
  v14[2] = *MEMORY[0x263EF8340];
  int v4 = (KB::String *)KB::Candidate::string(this);
  unsigned int v5 = KB::String::count(v4);
  unsigned int v6 = *(_DWORD *)(a1 + 40);
  if (v5 > v6 && KB::CandidateFilterResources::debug_stream(*(KB::CandidateFilterResources **)(a1 + 32)))
  {
    uint64_t v7 = (KB *)KB::CandidateFilterResources::debug_stream(*(KB::CandidateFilterResources **)(a1 + 32));
    KB::Candidate::capitalized_string(&v12, this);
    int v9 = v13;
    if (!v13) {
      int v9 = (const char *)v14;
    }
    if ((_WORD)v12) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = "";
    }
    KB::append_format(v7, (__CFString *)"[%s] removed by %s\n", v8, v10, "virtual void KB::CandidateFilter_fr::filter_candidates(CandidateCollection &, const CandidateFilterLookupContext &, const CandidateFilterResources &) const_block_invoke");
    KB::String::~String((KB::String *)&v12);
  }
  return v5 > v6;
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
        uint64_t v7 = MEMORY[0x24563BB00](v7 - 1000);
      while (v7 != v6);
    }
    *(void *)(a1 + 8) = v6;
  }
  return a2;
}

void KB::CandidateFilter_fr::~CandidateFilter_fr(KB::CandidateFilter_fr *this)
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
  int v9 = (const void *)a1[122];
  if (v9) {
    CFRelease(v9);
  }
  a1[122] = 0;
  uint64_t v10 = *((void *)a2 + 122);
  *((void *)a2 + 122) = 0;
  a1[122] = v10;
  unsigned int v11 = (const void *)a1[123];
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
  unsigned int v3 = result + 2;
  uint64_t v2 = (void *)*result;
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
      *uint64_t result = v5;
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
    *uint64_t result = v3;
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
    *uint64_t result = v5;
    *a2 = v2;
  }
  uint64_t v12 = result[1];
  result[1] = a2[1];
  a2[1] = v12;
  return result;
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

uint64_t _GLOBAL__sub_I_TICandidateFilter_fr_cpp()
{
  return __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241DF2000);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t TILexiconIDForLocaleIdentifier()
{
  return MEMORY[0x270F7CCF8]();
}

uint64_t TIInputManager::set_word_medial_punctuation_predicate()
{
  return MEMORY[0x270F7CE80]();
}

uint64_t TIInputManager::TIInputManager()
{
  return MEMORY[0x270F7CEB0]();
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

uint64_t KB::utf8_string(KB *this, NSString *a2)
{
  return MEMORY[0x270F7CF10](this, a2);
}

uint64_t KB::append_format(KB *this, __CFString *a2, const char *a3, ...)
{
  return MEMORY[0x270F7CF40](this, a2, a3);
}

uint64_t KB::compose_diacritics()
{
  return MEMORY[0x270F7CF80]();
}

uint64_t KB::decompose_diacritics()
{
  return MEMORY[0x270F7CFC0]();
}

uint64_t KB::InputManagerSpecialization::InputManagerSpecialization(KB::InputManagerSpecialization *this, const __CFLocale *a2)
{
  return MEMORY[0x270F7D018](this, a2);
}

void KB::InputManagerSpecialization::~InputManagerSpecialization(KB::InputManagerSpecialization *this)
{
}

uint64_t KB::character_is_word_medial_punctuation(KB *this)
{
  return MEMORY[0x270F7D028](this);
}

uint64_t KB::String::iterator::initialize(KB::String::iterator *this)
{
  return MEMORY[0x270F7D058](this);
}

uint64_t KB::String::iterator::operator++()
{
  return MEMORY[0x270F7D060]();
}

uint64_t KB::String::String()
{
  return MEMORY[0x270F7D080]();
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

uint64_t TIInputManager::favonius_layout(TIInputManager *this)
{
  return MEMORY[0x270F7D190](this);
}

uint64_t KB::CandidateFilterResources::debug_stream(KB::CandidateFilterResources *this)
{
  return MEMORY[0x270F7D200](this);
}

uint64_t KB::String::count(KB::String *this)
{
  return MEMORY[0x270F7D230](this);
}

uint64_t KB::Candidate::capitalized_string(KB::Candidate *this)
{
  return MEMORY[0x270F7D260](this);
}

uint64_t KB::Candidate::string(KB::Candidate *this)
{
  return MEMORY[0x270F7D278](this);
}

uint64_t TI::Favonius::KeyboardLayout::key_for_char(TI::Favonius::KeyboardLayout *this)
{
  return MEMORY[0x270F7D290](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void operator delete[]()
{
  while (1)
    ;
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

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}