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

uint64_t TIInputManager_vi::TIInputManager_vi(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6 = TIInputManager::TIInputManager();
  *(void *)uint64_t v6 = &unk_26F5E5960;
  *(_DWORD *)(v6 + 716) = a2;
  std::__function::__value_func<KB::String ()(KB::String const&)>::__value_func[abi:nn180100](v6 + 720, a3);
  unsigned int v7 = operator new(0x20uLL);
  v7[1] = 0;
  v7[2] = 0;
  *unsigned int v7 = &unk_26F5E5778;
  v7[3] = &unk_26F5E5930;
  *(void *)(a1 + 752) = v7 + 3;
  *(void *)(a1 + 760) = v7;
  return a1;
}

uint64_t std::__function::__value_func<KB::String ()(KB::String const&)>::__value_func[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void std::__shared_ptr_emplace<KB::CandidateFilter_vi>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5E5778;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<KB::CandidateFilter_vi>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5E5778;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24563E210);
}

uint64_t std::__shared_ptr_emplace<KB::CandidateFilter_vi>::__on_zero_shared(uint64_t a1)
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

void std::__shared_ptr_emplace<KB::InputManagerSpecialization_vi>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5E57B0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<KB::InputManagerSpecialization_vi>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5E57B0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24563E210);
}

uint64_t std::__shared_ptr_emplace<KB::InputManagerSpecialization_vi>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void KB::InputManagerSpecialization_vi::~InputManagerSpecialization_vi(KB::InputManagerSpecialization_vi *this)
{
  KB::InputManagerSpecialization::~InputManagerSpecialization(this);
  JUMPOUT(0x24563E210);
}

void KB::InputManagerSpecialization_vi::create_input_segment_filter(void *a1@<X8>)
{
  {
    __cxa_atexit((void (*)(void *))WTF::RefPtr<KB::InputSegmentFilter>::~RefPtr, &KB::InputManagerSpecialization_vi::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::s_input_segment_filter, &dword_241E52000);
  }
  if (KB::InputManagerSpecialization_vi::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::once != -1) {
    dispatch_once(&KB::InputManagerSpecialization_vi::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::once, &__block_literal_global_0);
  }
  v2 = (atomic_uint *)KB::InputManagerSpecialization_vi::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::s_input_segment_filter;
  *a1 = KB::InputManagerSpecialization_vi::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::s_input_segment_filter;
  if (v2) {
    atomic_fetch_add(v2 + 2, 1u);
  }
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

void *KB::InputManagerSpecialization_vi::do_create_custom_candidate_filter@<X0>(void *a1@<X8>)
{
  uint64_t result = operator new(0x20uLL);
  result[1] = 0;
  result[2] = 0;
  *uint64_t result = &unk_26F5E5778;
  result[3] = &unk_26F5E5930;
  *a1 = result + 3;
  a1[1] = result;
  return result;
}

unsigned int **WTF::RefPtr<KB::InputSegmentFilter>::~RefPtr(unsigned int **a1)
{
  v2 = *a1;
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

void ___ZNK2KB29InputManagerSpecialization_vi27create_input_segment_filterEN3WTF10PassRefPtrIN2TI8Favonius14KeyboardLayoutEEE_block_invoke()
{
}

void KB::NullInputSegmentFilter::~NullInputSegmentFilter(KB::NullInputSegmentFilter *this)
{
}

uint64_t KB::NullInputSegmentFilter::word_is_acceptable_for_input()
{
  return 1;
}

uint64_t KB::NullInputSegmentFilter::letter_combines_with_selective_modifier(KB::NullInputSegmentFilter *this)
{
  return 1;
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
    unsigned int v3 = (void **)(v1 + 2);
    std::vector<WTF::RefPtr<TI::Favonius::LayoutKey>>::__destroy_vector::operator()[abi:nn180100](&v3);
    return (unsigned int *)MEMORY[0x24563E210](v1, 0x10B0C409EA53459);
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
      unsigned int v3 = *(unsigned __int16 **)v2;
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
      JUMPOUT(0x24563E1F0);
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
        MEMORY[0x24563E1F0](v3, 0x1000C8077774924);
      }
    }
    KB::String::~String((KB::String *)(v1 + 8));
    JUMPOUT(0x24563E210);
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

void *std::__function::__value_func<KB::String ()(KB::String const&)>::~__value_func[abi:nn180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void _GLOBAL__sub_I_TIKeyboardInputManager_vi_mm()
{
  v0 = (void *)MEMORY[0x24563E2F0]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241E52000);
}

void **std::vector<KB::String>::~vector[abi:nn180100](void **a1)
{
  uint64_t v3 = a1;
  std::vector<KB::String>::__destroy_vector::operator()[abi:nn180100](&v3);
  return a1;
}

const char *KB::CandidateFilter_vi::filter_description(KB::CandidateFilter_vi *this)
{
  return "CandidateFilter_vi:";
}

uint64_t *KB::CandidateFilter_vi::filter_candidates(uint64_t a1, uint64_t **a2)
{
  uint64_t result = *a2;
  uint64_t v4 = a2[1];
  if (result != v4)
  {
    v5 = std::remove_if[abi:nn180100]<std::__wrap_iter<KB::Candidate *>,BOOL({block_pointer})(KB::Candidate const&)>(result, v4, (uint64_t)&__block_literal_global_1);
    uint64_t v6 = (long long *)a2[1];
    return std::vector<KB::Candidate>::erase((uint64_t)a2, v5, v6);
  }
  return result;
}

uint64_t *std::remove_if[abi:nn180100]<std::__wrap_iter<KB::Candidate *>,BOOL({block_pointer})(KB::Candidate const&)>(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  if (a1 == a2) {
    return a2;
  }
  v5 = a1;
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

uint64_t ___ZNK2KB18CandidateFilter_vi17filter_candidatesERNS_19CandidateCollectionERKNS_28CandidateFilterLookupContextERKNS_24CandidateFilterResourcesE_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = WORDS_TO_FILTER;
  uint64_t v3 = qword_26B041C58;
  if (WORDS_TO_FILTER == qword_26B041C58) {
    return 0;
  }
  do
  {
    MEMORY[0x24563E100](v7, v2);
    uint64_t v5 = KB::String::equal(*(KB::String **)(a2 + 8), (const KB::String *)v7);
    KB::String::~String((KB::String *)v7);
    if (v5) {
      break;
    }
    v2 += 32;
  }
  while (v2 != v3);
  return v5;
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
        uint64_t v7 = MEMORY[0x24563E130](v7 - 1000);
      while (v7 != v6);
    }
    *(void *)(a1 + 8) = v6;
  }
  return a2;
}

void KB::CandidateFilter_vi::~CandidateFilter_vi(KB::CandidateFilter_vi *this)
{
}

void std::vector<KB::String>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    uint64_t v5 = v2;
    if (v4 != v2)
    {
      do
        KB::String::~String((KB::String *)(v4 - 32));
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
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
  v9 = (const void *)a1[122];
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
  uint64_t v3 = result + 2;
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

uint64_t _GLOBAL__sub_I_TICandidateFilter_vi_cpp()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241E52000);
  MEMORY[0x24563E0F0](v2, "ddi");
  WORDS_TO_FILTER = (uint64_t)operator new(0x20uLL);
  qword_26B041C58 = WORDS_TO_FILTER;
  uint64_t v0 = WORDS_TO_FILTER + 32;
  qword_26B041C60 = WORDS_TO_FILTER + 32;
  MEMORY[0x24563E100]();
  qword_26B041C58 = v0;
  KB::String::~String((KB::String *)v2);
  return __cxa_atexit((void (*)(void *))std::vector<KB::String>::~vector[abi:nn180100], &WORDS_TO_FILTER, &dword_241E52000);
}

void TIInputManager_vi::create_quality_filter(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  std::vector<KB::FilterFlag>::vector(__p, a2);
  TIInputManager::create_quality_filter();
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  int64x2_t v16 = 0uLL;
  v17[0] = 0;
  v23 = v17;
  long long v5 = std::__allocate_at_least[abi:nn180100]<std::allocator<std::shared_ptr<KB::CandidateFilter>>>((uint64_t)v17, 1uLL);
  void *v5 = __p[3];
  char v7 = v19;
  v5[1] = v19;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v8 = (void *)v16.i64[1];
  char v9 = (void *)v16.i64[0];
  if (v16.i64[1] == v16.i64[0])
  {
    int64x2_t v12 = vdupq_n_s64(v16.u64[1]);
    uint64_t v10 = v5;
  }
  else
  {
    uint64_t v10 = v5;
    do
    {
      long long v11 = *((_OWORD *)v8 - 1);
      v8 -= 2;
      *((_OWORD *)v10 - 1) = v11;
      v10 -= 2;
      *uint64_t v8 = 0;
      v8[1] = 0;
    }
    while (v8 != v9);
    int64x2_t v12 = v16;
  }
  unsigned int v13 = (char *)(v5 + 2);
  v16.i64[0] = (uint64_t)v10;
  int64x2_t v21 = v12;
  uint64_t v14 = v17[0];
  v17[0] = &v5[2 * v6];
  uint64_t v22 = v14;
  v20 = (int64x2_t *)v12.i64[0];
  std::__split_buffer<std::shared_ptr<KB::CandidateFilter>>::~__split_buffer((void **)&v20);
  v16.i64[1] = (uint64_t)v13;
  std::vector<std::shared_ptr<KB::CandidateFilter>>::push_back[abi:nn180100]((char **)&v16, (long long *)(a1 + 752));
  v15 = operator new(0x38uLL);
  v15[1] = 0;
  v15[2] = 0;
  void *v15 = &unk_26F5E59D0;
  *a3 = KB::CompositeCandidateFilter::CompositeCandidateFilter();
  a3[1] = (uint64_t)v15;
  v20 = &v16;
  std::vector<std::shared_ptr<KB::CandidateFilter>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v20);
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v19);
  }
}

void **std::vector<std::shared_ptr<KB::CandidateFilter>>::push_back[abi:nn180100](char **a1, long long *a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  __n128 result = (void **)(a1 + 2);
  unint64_t v5 = v6;
  char v7 = (char *)*(result - 1);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v10 = (v7 - *a1) >> 4;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60) {
      abort();
    }
    uint64_t v12 = v5 - (void)*a1;
    if (v12 >> 3 > v11) {
      unint64_t v11 = v12 >> 3;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    v27 = result;
    uint64_t v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::shared_ptr<KB::CandidateFilter>>>((uint64_t)result, v13);
    int64x2_t v16 = &v14[16 * v10];
    long long v17 = *a2;
    *(_OWORD *)int64x2_t v16 = *a2;
    if (*((void *)&v17 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v17 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    v19 = *a1;
    v18 = a1[1];
    if (v18 == *a1)
    {
      int64x2_t v22 = vdupq_n_s64((unint64_t)v18);
      v20 = &v14[16 * v10];
    }
    else
    {
      v20 = &v14[16 * v10];
      do
      {
        long long v21 = *((_OWORD *)v18 - 1);
        v18 -= 16;
        *((_OWORD *)v20 - 1) = v21;
        v20 -= 16;
        *(void *)v18 = 0;
        *((void *)v18 + 1) = 0;
      }
      while (v18 != v19);
      int64x2_t v22 = *(int64x2_t *)a1;
    }
    char v9 = v16 + 16;
    *a1 = v20;
    a1[1] = v16 + 16;
    int64x2_t v25 = v22;
    v23 = a1[2];
    a1[2] = &v14[16 * v15];
    v26 = v23;
    uint64_t v24 = v22.i64[0];
    __n128 result = std::__split_buffer<std::shared_ptr<KB::CandidateFilter>>::~__split_buffer((void **)&v24);
  }
  else
  {
    *(void *)char v7 = *(void *)a2;
    uint64_t v8 = *((void *)a2 + 1);
    *((void *)v7 + 1) = v8;
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
    char v9 = v7 + 16;
  }
  a1[1] = v9;
  return result;
}

void TIInputManager_vi::filter_pre_lookup_input(TIInputManager_vi *this@<X0>, const KB::String *a2@<X1>, const KB::String *a3@<X8>)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  MEMORY[0x24563E100](a3, a2);
  int v5 = *((_DWORD *)this + 179);
  if (v5 == 3)
  {
    TIInputManager_vi::viqr_filter_pre_lookup_input(a3, (uint64_t)v6);
  }
  else
  {
    if (v5 != 2) {
      return;
    }
    TIInputManager_vi::vni_filter_pre_lookup_input(a3, (uint64_t)v6);
  }
  KB::String::operator=();
  KB::String::~String((KB::String *)v6);
}

void TIInputManager_vi::vni_filter_pre_lookup_input(const KB::String *a1@<X1>, uint64_t a2@<X8>)
{
  long long v4 = (char *)*((void *)a1 + 1);
  if (!v4) {
    long long v4 = (char *)a1 + 16;
  }
  if (*(_WORD *)a1) {
    int v5 = v4;
  }
  else {
    int v5 = (char *)&unk_241E57FFD;
  }
  std::string::basic_string[abi:nn180100]<0>(__p, v5);
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = v20;
  if ((v20 & 0x80u) == 0) {
    unint64_t v11 = __p;
  }
  else {
    unint64_t v11 = (void **)__p[0];
  }
  if ((v20 & 0x80) != 0) {
    goto LABEL_11;
  }
LABEL_10:
  for (uint64_t i = (void **)((char *)__p + v10); v11 != i; uint64_t i = (void **)((char *)__p[0] + (unint64_t)__p[1]))
  {
    int v13 = *(char *)v11;
    if (v13 > 84)
    {
      if (v13 > 100)
      {
        switch(v13)
        {
          case 'e':
LABEL_26:
            uint64_t v6 = 101;
            break;
          case 'o':
LABEL_27:
            uint64_t v6 = 111;
LABEL_28:
            uint64_t v7 = 119;
            break;
          case 'u':
            goto LABEL_28;
        }
      }
      else
      {
        switch(v13)
        {
          case 'U':
            goto LABEL_28;
          case 'a':
LABEL_25:
            uint64_t v6 = 97;
            uint64_t v8 = 119;
            break;
          case 'd':
LABEL_20:
            uint64_t v9 = 100;
            break;
        }
      }
    }
    else
    {
      int v14 = v13 - 49;
      uint64_t v15 = 0;
      LOBYTE(v13) = 115;
      uint64_t v16 = v7;
      uint64_t v17 = v8;
      uint64_t v18 = v9;
      switch(v14)
      {
        case 0:
          goto LABEL_36;
        case 1:
          LOBYTE(v13) = 102;
          goto LABEL_36;
        case 2:
          LOBYTE(v13) = 114;
          goto LABEL_36;
        case 3:
          LOBYTE(v13) = 120;
          goto LABEL_36;
        case 4:
          LOBYTE(v13) = 106;
          goto LABEL_36;
        case 5:
          goto LABEL_35;
        case 6:
          uint64_t v16 = 0;
          uint64_t v15 = v6;
          uint64_t v17 = v8;
          uint64_t v18 = v9;
          LODWORD(v6) = v7;
          goto LABEL_35;
        case 7:
          uint64_t v17 = 0;
          uint64_t v15 = v6;
          uint64_t v16 = v7;
          uint64_t v18 = v9;
          LODWORD(v6) = v8;
          goto LABEL_35;
        case 8:
          uint64_t v18 = 0;
          uint64_t v15 = v6;
          uint64_t v16 = v7;
          uint64_t v17 = v8;
          LODWORD(v6) = v9;
LABEL_35:
          int v13 = v6;
          uint64_t v9 = v18;
          uint64_t v8 = v17;
          uint64_t v7 = v16;
          uint64_t v6 = v15;
          if (v13)
          {
LABEL_36:
            *(unsigned char *)unint64_t v11 = v13;
            uint64_t v10 = v20;
          }
          break;
        case 16:
          goto LABEL_25;
        case 19:
          goto LABEL_20;
        case 20:
          goto LABEL_26;
        case 30:
          goto LABEL_27;
        default:
          break;
      }
    }
    unint64_t v11 = (void **)((char *)v11 + 1);
    if ((v10 & 0x80) == 0) {
      goto LABEL_10;
    }
LABEL_11:
    ;
  }
  MEMORY[0x24563E0F0](a2);
  if ((char)v20 < 0) {
    operator delete(__p[0]);
  }
}

void TIInputManager_vi::viqr_filter_pre_lookup_input(const KB::String *a1@<X1>, uint64_t a2@<X8>)
{
  long long v4 = (char *)*((void *)a1 + 1);
  if (!v4) {
    long long v4 = (char *)a1 + 16;
  }
  if (*(_WORD *)a1) {
    int v5 = v4;
  }
  else {
    int v5 = (char *)&unk_241E57FFD;
  }
  std::string::basic_string[abi:nn180100]<0>(__p, v5);
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = v18;
  if ((v18 & 0x80u) == 0) {
    uint64_t v10 = __p;
  }
  else {
    uint64_t v10 = (void **)__p[0];
  }
  if ((v18 & 0x80) != 0) {
    goto LABEL_11;
  }
LABEL_10:
  for (uint64_t i = (void **)((char *)__p + v9); v10 != i; uint64_t i = (void **)((char *)__p[0] + (unint64_t)__p[1]))
  {
    int v12 = *(char *)v10;
    if (v12 > 84)
    {
      if (v12 > 110)
      {
        if (v12 == 111) {
          goto LABEL_32;
        }
        if (v12 == 117) {
          goto LABEL_35;
        }
        if (v12 != 126) {
          goto LABEL_40;
        }
        LOBYTE(v12) = 120;
        goto LABEL_39;
      }
      switch(*(unsigned char *)v10)
      {
        case '^':
          uint64_t v15 = 0;
          uint64_t v14 = v6;
          uint64_t v16 = v8;
          LODWORD(v6) = v7;
LABEL_20:
          int v12 = v6;
          uint64_t v8 = v16;
          uint64_t v7 = v15;
          uint64_t v6 = v14;
          if (v12) {
            goto LABEL_39;
          }
          break;
        case '_':
        case 'b':
        case 'c':
        case 'd':
          break;
          LOBYTE(v12) = 102;
          goto LABEL_39;
        case 'a':
          goto LABEL_25;
        case 'e':
          goto LABEL_33;
        default:
          if (v12 == 85) {
            goto LABEL_35;
          }
          break;
      }
    }
    else if (v12 > 62)
    {
      if (v12 > 68)
      {
        if (v12 == 69)
        {
LABEL_33:
          uint64_t v7 = 101;
          goto LABEL_40;
        }
        if (v12 != 79) {
          goto LABEL_40;
        }
LABEL_32:
        uint64_t v7 = 111;
LABEL_35:
        uint64_t v8 = 119;
        goto LABEL_40;
      }
      if (v12 == 63)
      {
        LOBYTE(v12) = 114;
LABEL_39:
        *(unsigned char *)uint64_t v10 = v12;
        uint64_t v9 = v18;
        goto LABEL_40;
      }
      if (v12 == 65)
      {
LABEL_25:
        uint64_t v6 = 119;
        uint64_t v7 = 97;
      }
    }
    else
    {
      int v13 = v12 - 39;
      uint64_t v14 = 0;
      LOBYTE(v12) = 115;
      uint64_t v15 = v7;
      uint64_t v16 = v8;
      switch(v13)
      {
        case 0:
          goto LABEL_39;
        case 1:
          goto LABEL_20;
        case 4:
          uint64_t v16 = 0;
          uint64_t v14 = v6;
          uint64_t v15 = v7;
          LODWORD(v6) = v8;
          goto LABEL_20;
        case 7:
          LOBYTE(v12) = 106;
          goto LABEL_39;
        default:
          break;
      }
    }
LABEL_40:
    uint64_t v10 = (void **)((char *)v10 + 1);
    if ((v9 & 0x80) == 0) {
      goto LABEL_10;
    }
LABEL_11:
    ;
  }
  MEMORY[0x24563E0F0](a2);
  if ((char)v18 < 0) {
    operator delete(__p[0]);
  }
}

uint64_t TIInputManager_vi::should_accept_candidate_for_mixed_case_input(uint64_t a1, KB::Candidate *this, KB::Word *a3, uint64_t a4)
{
  v10[4] = *MEMORY[0x263EF8340];
  if (KB::Candidate::has_from_supplemental_lexicon(this))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 224) + 8) + 72;
    return MEMORY[0x270F7D1D8](v7, a3, a4);
  }
  else
  {
    KB::Word::capitalized_string(v10, a3);
    uint64_t v8 = KB::String::starts_with();
    KB::String::~String((KB::String *)v10);
    return v8;
  }
}

void TIInputManager_vi::~TIInputManager_vi(TIInputManager_vi *this)
{
  TIInputManager_vi::~TIInputManager_vi(this);
  JUMPOUT(0x24563E210);
}

{
  std::__shared_weak_count *v2;
  uint64_t vars8;

  *(void *)this = &unk_26F5E5960;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 95);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v2);
  }
  std::__function::__value_func<KB::String ()(KB::String const&)>::~__value_func[abi:nn180100]((void *)this + 90);
  MEMORY[0x270F7CEC0](this);
}

void TIInputManager_vi::internal_string_to_external(TIInputManager_vi *this@<X0>, unsigned char *a2@<X8>)
{
  v5[4] = *MEMORY[0x263EF8340];
  uint64_t v4 = *((void *)this + 93);
  if (v4)
  {
    (*(void (**)(void *__return_ptr))(*(void *)v4 + 48))(v5);
    KB::String::String();
    a2[32] = 1;
    KB::String::~String((KB::String *)v5);
  }
  else
  {
    *a2 = 0;
    a2[32] = 0;
  }
}

void TIInputManager::external_string_to_internal(unsigned char *a1@<X8>)
{
  *a1 = 0;
  a1[32] = 0;
}

uint64_t TIInputManager_vi::should_exclude_filter_corrections_if_any_candidate_matches_input(TIInputManager_vi *this)
{
  return 1;
}

void *std::vector<KB::FilterFlag>::vector(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v4 = *(const void **)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  int64_t v5 = v3 - *(void *)a2;
  if (v3 != *(void *)a2)
  {
    std::vector<KB::FilterFlag>::__vallocate[abi:nn180100](a1, v5 >> 3);
    uint64_t v6 = (char *)a1[1];
    memmove(v6, v4, v5);
    a1[1] = &v6[v5];
  }
  return a1;
}

char *std::vector<KB::FilterFlag>::__vallocate[abi:nn180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    abort();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<KB::FilterFlag>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<KB::FilterFlag>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<std::shared_ptr<KB::CandidateFilter>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(16 * a2);
}

void **std::__split_buffer<std::shared_ptr<KB::CandidateFilter>>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<std::shared_ptr<KB::CandidateFilter>>::clear[abi:nn180100](uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v1 = *(void *)(a1 + 16);
  while (v1 != v2)
  {
    *(void *)(a1 + 16) = v1 - 16;
    uint64_t v4 = *(std::__shared_weak_count **)(v1 - 8);
    if (v4)
    {
      std::__shared_weak_count::__release_shared[abi:nn180100](v4);
      uint64_t v1 = *(void *)(a1 + 16);
    }
    else
    {
      v1 -= 16;
    }
  }
}

void std::__shared_ptr_emplace<KB::CompositeCandidateFilter>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5E59D0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<KB::CompositeCandidateFilter>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5E59D0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24563E210);
}

uint64_t std::__shared_ptr_emplace<KB::CompositeCandidateFilter>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::vector<std::shared_ptr<KB::CandidateFilter>>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::shared_ptr<KB::CandidateFilter>>::__clear[abi:nn180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::shared_ptr<KB::CandidateFilter>>::__clear[abi:nn180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 16)
  {
    uint64_t v4 = *(std::__shared_weak_count **)(i - 8);
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v4);
    }
  }
  a1[1] = v2;
}

void *std::string::basic_string[abi:nn180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
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

uint64_t _GLOBAL__sub_I_TIInputManager_vi_cpp()
{
  return __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241E52000);
}

void CFRelease(CFTypeRef cf)
{
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
}

void NSLog(NSString *format, ...)
{
}

uint64_t TIBundleForInputMode()
{
  return MEMORY[0x270F7CBB8]();
}

uint64_t TILexiconIDForLocaleIdentifier()
{
  return MEMORY[0x270F7CCF8]();
}

uint64_t UnikeyCleanup()
{
  return MEMORY[0x270F7CDB0]();
}

uint64_t UnikeyFilter()
{
  return MEMORY[0x270F7CDB8]();
}

uint64_t UnikeyGetOptions()
{
  return MEMORY[0x270F7CDC0]();
}

uint64_t UnikeyResetBuf()
{
  return MEMORY[0x270F7CDC8]();
}

uint64_t UnikeySetCapsState()
{
  return MEMORY[0x270F7CDD0]();
}

uint64_t UnikeySetInputMethod()
{
  return MEMORY[0x270F7CDD8]();
}

uint64_t UnikeySetOptions()
{
  return MEMORY[0x270F7CDE0]();
}

uint64_t UnikeySetup()
{
  return MEMORY[0x270F7CDE8]();
}

uint64_t TIInputManager::delete_from_input(TIInputManager *this)
{
  return MEMORY[0x270F7CE18](this);
}

uint64_t TIInputManager::delete_from_favonius_stroke_history(TIInputManager *this)
{
  return MEMORY[0x270F7CE78](this);
}

uint64_t TIInputManager::add_input()
{
  return MEMORY[0x270F7CE98]();
}

uint64_t TIInputManager::TIInputManager()
{
  return MEMORY[0x270F7CEB8]();
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

uint64_t KB::CompositeCandidateFilter::CompositeCandidateFilter()
{
  return MEMORY[0x270F7D000]();
}

uint64_t KB::InputManagerSpecialization::InputManagerSpecialization(KB::InputManagerSpecialization *this, const __CFLocale *a2)
{
  return MEMORY[0x270F7D018](this, a2);
}

void KB::InputManagerSpecialization::~InputManagerSpecialization(KB::InputManagerSpecialization *this)
{
}

uint64_t KB::String::String()
{
  return MEMORY[0x270F7D070]();
}

uint64_t KB::String::String(KB::String *this, const char *a2)
{
  return MEMORY[0x270F7D078](this, a2);
}

uint64_t KB::String::String(KB::String *this, const KB::String *a2)
{
  return MEMORY[0x270F7D080](this, a2);
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

uint64_t TIInputManager::input_string(TIInputManager *this)
{
  return MEMORY[0x270F7D178](this);
}

uint64_t TIInputManager::favonius_layout(TIInputManager *this)
{
  return MEMORY[0x270F7D190](this);
}

uint64_t TIInputManager::create_quality_filter()
{
  return MEMORY[0x270F7D1A0]();
}

uint64_t KB::Word::capitalized_string(KB::Word *this)
{
  return MEMORY[0x270F7D210](this);
}

uint64_t KB::String::starts_with()
{
  return MEMORY[0x270F7D218]();
}

uint64_t KB::String::equal(KB::String *this, const KB::String *a2)
{
  return MEMORY[0x270F7D238](this, a2);
}

uint64_t KB::Candidate::has_from_supplemental_lexicon(KB::Candidate *this)
{
  return MEMORY[0x270F7D270](this);
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

void abort(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

const char *__cdecl u_errorName(UErrorCode code)
{
  return (const char *)MEMORY[0x270F994F8](*(void *)&code);
}

uint64_t utrans_close()
{
  return MEMORY[0x270F99A20]();
}

uint64_t utrans_openU()
{
  return MEMORY[0x270F99A28]();
}

uint64_t utrans_transUChars()
{
  return MEMORY[0x270F99A38]();
}