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

void std::__shared_ptr_emplace<KB::InputManagerSpecialization_el>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5DBC28;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<KB::InputManagerSpecialization_el>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5DBC28;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x24563B690);
}

uint64_t std::__shared_ptr_emplace<KB::InputManagerSpecialization_el>::__on_zero_shared(uint64_t a1)
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
    return (unsigned int *)MEMORY[0x24563B690](v1, 0x10B0C409EA53459);
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
      JUMPOUT(0x24563B670);
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
        MEMORY[0x24563B670](v3, 0x1000C8077774924);
      }
    }
    KB::String::~String((KB::String *)(v1 + 8));
    JUMPOUT(0x24563B690);
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

void _GLOBAL__sub_I_TIKeyboardFeatureSpecialization_el_mm()
{
  v0 = (void *)MEMORY[0x24563B720]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241DEB000);
}

void *KB::InputManagerSpecialization_el::InputManagerSpecialization_el(KB::InputManagerSpecialization_el *this, const __CFLocale *a2)
{
  uint64_t result = (void *)KB::InputManagerSpecialization::InputManagerSpecialization(this, a2);
  *uint64_t result = &unk_26F5DBC60;
  return result;
}

{
  void *result;

  uint64_t result = (void *)KB::InputManagerSpecialization::InputManagerSpecialization(this, a2);
  *uint64_t result = &unk_26F5DBC60;
  return result;
}

void KB::InputManagerSpecialization_el::do_apply_custom_conversions(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  v23[2] = *MEMORY[0x263EF8340];
  v19[0] = a2;
  v19[1] = a2 + 24;
  v19[2] = a2 + 48;
  v19[3] = a2 + 72;
  do
  {
    uint64_t v3 = (KB::Candidate **)v19[v2];
    uint64_t v4 = *v3;
    v5 = v3[1];
    while (v4 != v5)
    {
      if (*(void *)v4)
      {
        v6 = (KB::Word *)*((void *)v4 + 1);
        unsigned int v7 = (KB::Word *)((char *)v6 + 240 * *(void *)v4);
        do
        {
          KB::Word::capitalized_string(&v21, v6);
          if (KB::count_uppercase_letters() >= 2)
          {
            KB::upper_string();
            int v8 = KB::String::equal((KB::String *)&v21, (const KB::String *)v20);
            KB::String::~String((KB::String *)v20);
            if (v8)
            {
              KB::String::String((KB::String *)v20);
              v9 = v22;
              if (!v22) {
                v9 = v23;
              }
              v15 = v9;
              int v16 = 0;
              int v17 = (unsigned __int16)v21;
              int v18 = 0;
              KB::String::iterator::initialize((KB::String::iterator *)&v15);
              while (1)
              {
                v10 = v22;
                if (!v22) {
                  v10 = v23;
                }
                unsigned int v11 = v10;
                int v12 = (unsigned __int16)v21;
                int v13 = (unsigned __int16)v21;
                int v14 = 0;
                KB::String::iterator::initialize((KB::String::iterator *)&v11);
                if (v16 == v12) {
                  break;
                }
                LODWORD(v11) = 0;
                strip_greek_accent();
                KB::String::append((KB::String *)v20);
                KB::String::iterator::operator++();
              }
              KB::String::operator=();
              KB::String::~String((KB::String *)v20);
            }
          }
          KB::String::~String((KB::String *)&v21);
          v6 = (KB::Word *)((char *)v6 + 240);
        }
        while (v6 != v7);
      }
      KB::Candidate::compute_string(v4);
      uint64_t v4 = (KB::Candidate *)((char *)v4 + 1000);
    }
    ++v2;
  }
  while (v2 != 4);
}

void KB::InputManagerSpecialization_el::~InputManagerSpecialization_el(KB::InputManagerSpecialization_el *this)
{
  KB::InputManagerSpecialization::~InputManagerSpecialization(this);

  JUMPOUT(0x24563B690);
}

void KB::InputManagerSpecialization::create_input_segment_filter(void *a1@<X8>)
{
  {
    __cxa_atexit((void (*)(void *))WTF::RefPtr<KB::InputSegmentFilter>::~RefPtr, &KB::InputManagerSpecialization::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::filter, &dword_241DEB000);
  }
  if (KB::InputManagerSpecialization::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::once != -1) {
    dispatch_once(&KB::InputManagerSpecialization::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::once, &__block_literal_global);
  }
  uint64_t v2 = (atomic_uint *)KB::InputManagerSpecialization::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::filter;
  *a1 = KB::InputManagerSpecialization::create_input_segment_filter(WTF::PassRefPtr<TI::Favonius::KeyboardLayout>)const::filter;
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

void KB::InputManagerSpecialization::do_create_custom_candidate_filter(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
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

uint64_t _GLOBAL__sub_I_TIInputManagerSpecialization_el_cpp()
{
  return __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241DEB000);
}

uint64_t KB::utf8_string(KB *this, NSString *a2)
{
  return MEMORY[0x270F7CF10](this, a2);
}

uint64_t KB::upper_string()
{
  return MEMORY[0x270F7CF20]();
}

uint64_t KB::compose_diacritics()
{
  return MEMORY[0x270F7CF80]();
}

uint64_t KB::decompose_diacritics()
{
  return MEMORY[0x270F7CFC0]();
}

uint64_t KB::count_uppercase_letters()
{
  return MEMORY[0x270F7CFF8]();
}

uint64_t KB::InputManagerSpecialization::InputManagerSpecialization(KB::InputManagerSpecialization *this, const __CFLocale *a2)
{
  return MEMORY[0x270F7D018](this, a2);
}

void KB::InputManagerSpecialization::~InputManagerSpecialization(KB::InputManagerSpecialization *this)
{
}

uint64_t KB::String::append(KB::String *this)
{
  return MEMORY[0x270F7D050](this);
}

uint64_t KB::String::iterator::initialize(KB::String::iterator *this)
{
  return MEMORY[0x270F7D058](this);
}

uint64_t KB::String::iterator::operator++()
{
  return MEMORY[0x270F7D060]();
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
  return MEMORY[0x270F7D0A8]();
}

uint64_t KB::ns_string(KB *this, const KB::String *a2)
{
  return MEMORY[0x270F7D0E0](this, a2);
}

uint64_t TIInputManager::favonius_layout(TIInputManager *this)
{
  return MEMORY[0x270F7D190](this);
}

uint64_t KB::Word::capitalized_string(KB::Word *this)
{
  return MEMORY[0x270F7D210](this);
}

uint64_t KB::String::equal(KB::String *this, const KB::String *a2)
{
  return MEMORY[0x270F7D238](this, a2);
}

uint64_t KB::String::iterator::operator-()
{
  return MEMORY[0x270F7D240]();
}

uint64_t KB::String::iterator::operator+()
{
  return MEMORY[0x270F7D248]();
}

uint64_t KB::Candidate::compute_string(KB::Candidate *this)
{
  return MEMORY[0x270F7D258](this);
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

uint64_t strip_greek_accent()
{
  return MEMORY[0x270F7CCD8]();
}

int8_t u_charType(UChar32 c)
{
  return MEMORY[0x270F994E8](*(void *)&c);
}