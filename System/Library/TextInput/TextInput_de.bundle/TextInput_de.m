void KB::LikelihoodInfo::~LikelihoodInfo(void **this)
{
  if (*((char *)this + 39) < 0) {
    operator delete(this[2]);
  }
}

KB::InputManagerSpecialization_de *KB::InputManagerSpecialization_de::InputManagerSpecialization_de(KB::InputManagerSpecialization_de *this, const __CFLocale *a2)
{
  uint64_t v3 = KB::InputManagerSpecialization::InputManagerSpecialization(this, a2);
  *(void *)uint64_t v3 = &unk_26F5DB908;
  *(unsigned char *)(v3 + 16) = 0;
  if (*(void *)(v3 + 8))
  {
    CFStringRef v4 = (const __CFString *)MEMORY[0x24563B2B0]();
    if (v4)
    {
      if (CFEqual(v4, @"de_CH")) {
        *((unsigned char *)this + 16) = 1;
      }
    }
  }
  return this;
}

uint64_t KB::InputManagerSpecialization_de::has_umlaut(KB::InputManagerSpecialization_de *this, const KB::String *a2)
{
  uint64_t v3 = (char *)*((void *)a2 + 1);
  CFStringRef v4 = (char *)a2 + 16;
  if (!v3) {
    uint64_t v3 = (char *)a2 + 16;
  }
  v13 = v3;
  int v5 = *(unsigned __int16 *)a2;
  int v14 = 0;
  int v15 = v5;
  int v16 = 0;
  KB::String::iterator::initialize((KB::String::iterator *)&v13);
  int v6 = *(unsigned __int16 *)a2;
  v7 = (char *)*((void *)a2 + 1);
  if (!v7) {
    v7 = v4;
  }
  v9 = v7;
  int v10 = v6;
  int v11 = v6;
  int v12 = 0;
  KB::String::iterator::initialize((KB::String::iterator *)&v9);
  uint64_t result = 0;
  if (v14 != v10)
  {
    while ((v16 - 196) >= 0x39 || ((0x104000101040001uLL >> (v16 + 60)) & 1) == 0)
    {
      KB::String::iterator::operator++();
      if (v14 == v10) {
        return 0;
      }
    }
    return 1;
  }
  return result;
}

BOOL KB::InputManagerSpecialization_de::get_period_ends_sentence_after_word(KB::InputManagerSpecialization_de *this, const KB::String *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  MEMORY[0x24563B350](v13, 0, "0123456789.", 0, 0);
  KB::String::find_first_not_of(&v11, a2, (const KB::String *)v13);
  int v3 = *(unsigned __int16 *)a2;
  CFStringRef v4 = (char *)*((void *)a2 + 1);
  if (!v4) {
    CFStringRef v4 = (char *)a2 + 16;
  }
  v7 = v4;
  int v8 = v3;
  int v9 = v3;
  int v10 = 0;
  KB::String::iterator::initialize((KB::String::iterator *)&v7);
  BOOL v5 = v12 != v8;
  KB::String::~String((KB::String *)v13);
  return v5;
}

uint64_t KB::String::find_first_not_of(KB::String *this, const KB::String *a2)
{
  CFStringRef v4 = (char *)*((void *)this + 1);
  if (!v4) {
    CFStringRef v4 = (char *)this + 16;
  }
  v7 = v4;
  int v5 = *(unsigned __int16 *)this;
  int v8 = 0;
  int v9 = v5;
  int v10 = 0;
  KB::String::iterator::initialize((KB::String::iterator *)&v7);
  return KB::String::find_first_not_of(this, a2, (const KB::String::iterator *)&v7);
}

uint64_t KB::InputManagerSpecialization_de::get_should_correct_explicitly_shifted_word(KB::InputManagerSpecialization_de *this)
{
  return 0;
}

uint64_t KB::InputManagerSpecialization_de::get_should_promote_case_variants_of_top_candidate(KB::InputManagerSpecialization_de *this)
{
  return 1;
}

uint64_t KB::InputManagerSpecialization_de::do_filter_spellcheck_candidates(uint64_t a1, uint64_t a2)
{
  int v3 = *(void **)a2;
  uint64_t result = *(void *)(a2 + 8);
  if (*(void *)a2 != result)
  {
    if (*v3)
    {
      uint64_t result = KB::InputManagerSpecialization_de::has_umlaut((KB::InputManagerSpecialization_de *)result, (const KB::String *)(v3[1] + 240 * *v3 - 240));
      if (result) {
        return result;
      }
      int v3 = *(void **)a2;
      uint64_t result = *(void *)(a2 + 8);
    }
    while ((void *)result != v3)
      uint64_t result = MEMORY[0x24563B380](result - 1000);
    *(void *)(a2 + 8) = v3;
  }
  return result;
}

uint64_t KB::InputManagerSpecialization_de::do_apply_custom_conversions(uint64_t result, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(result + 16))
  {
    uint64_t v2 = 0;
    v8[0] = a2;
    v8[1] = a2 + 24;
    v8[2] = a2 + 48;
    v8[3] = a2 + 72;
    do
    {
      int v3 = (KB::Candidate **)v8[v2];
      CFStringRef v4 = *v3;
      int v5 = v3[1];
      while (v4 != v5)
      {
        if (*(void *)v4)
        {
          int v6 = (KB::String *)*((void *)v4 + 1);
          uint64_t v7 = 240 * *(void *)v4;
          do
          {
            MEMORY[0x24563B350](v9, 0, "ss", 0, 0);
            KB::String::replace_char(v6, 223, (const KB::String *)v9);
            KB::String::operator=();
            KB::String::~String((KB::String *)v10);
            KB::String::~String((KB::String *)v9);
            int v6 = (KB::String *)((char *)v6 + 240);
            v7 -= 240;
          }
          while (v7);
        }
        uint64_t result = KB::Candidate::compute_string(v4);
        CFStringRef v4 = (KB::Candidate *)((char *)v4 + 1000);
      }
      ++v2;
    }
    while (v2 != 4);
  }
  return result;
}

void KB::InputManagerSpecialization_de::create_input_segment_filter(uint64_t a1, void *a2)
{
  *a2 = 0;
  operator new();
}

void KB::InputManagerSpecialization_de::~InputManagerSpecialization_de(KB::InputManagerSpecialization_de *this)
{
  KB::InputManagerSpecialization::~InputManagerSpecialization(this);

  JUMPOUT(0x24563B430);
}

uint64_t KB::InputManagerSpecialization::get_does_need_spell_check()
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

void InputSegmentFilter_de::~InputSegmentFilter_de(InputSegmentFilter_de *this)
{
  *(void *)this = MEMORY[0x263F7EBD8] + 16;
  v1 = (unsigned int *)*((void *)this + 2);
  if (v1) {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v1);
  }
}

{
  unsigned int *v1;
  uint64_t vars8;

  *(void *)this = MEMORY[0x263F7EBD8] + 16;
  v1 = (unsigned int *)*((void *)this + 2);
  if (v1) {
    WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v1);
  }

  JUMPOUT(0x24563B430);
}

uint64_t InputSegmentFilter_de::character_is_digraph(InputSegmentFilter_de *this, int a2)
{
  if (a2 - 196) < 0x39 && ((0x104000101040001uLL >> (a2 + 60))) {
    return 1;
  }
  else {
    return MEMORY[0x270F7D1E0](this);
  }
}

uint64_t KB::LayoutBasedInputSegmentFilter::allows_sortkey_equivalent_substitution(KB::LayoutBasedInputSegmentFilter *this)
{
  return 0;
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
    int v3 = (void **)(v1 + 2);
    std::vector<WTF::RefPtr<TI::Favonius::LayoutKey>>::__destroy_vector::operator()[abi:nn180100](&v3);
    return (unsigned int *)MEMORY[0x24563B430](v1, 0x10B0C409EA53459);
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
      int v3 = *(unsigned __int16 **)v2;
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
      JUMPOUT(0x24563B410);
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
        MEMORY[0x24563B410](v3, 0x1000C8077774924);
      }
    }
    KB::String::~String((KB::String *)(v1 + 8));
    JUMPOUT(0x24563B430);
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

uint64_t _GLOBAL__sub_I_TIInputManagerSpecialization_de_cpp()
{
  return __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241DE9000);
}

uint64_t TIInputManager::set_input_manager_specialization(TIInputManager *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v3 = a2[1];
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  *((void *)a1 + 68) = v4;
  int v5 = (std::__shared_weak_count *)*((void *)a1 + 69);
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
      int v9 = *(unsigned int **)TIInputManager::favonius_layout(a1);
      int v16 = v9;
      if (v9) {
        atomic_fetch_add((atomic_uint *volatile)v9, 1u);
      }
      (*(void (**)(atomic_uint **__return_ptr, uint64_t, unsigned int **))(*(void *)v8 + 16))(&v17, v8, &v16);
      if (v16) {
        WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(v16);
      }
      (*(void (**)(unsigned int **__return_ptr))(**((void **)a1 + 23) + 168))(&v15);
      int v10 = (unsigned int *)v17;
      v17 = 0;
      uint64_t v14 = v10;
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

void std::__shared_ptr_emplace<KB::InputManagerSpecialization_de>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5DB9D8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<KB::InputManagerSpecialization_de>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5DB9D8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x24563B430);
}

uint64_t std::__shared_ptr_emplace<KB::InputManagerSpecialization_de>::__on_zero_shared(uint64_t a1)
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

void _GLOBAL__sub_I_TIKeyboardFeatureSpecialization_de_mm()
{
  v0 = (void *)MEMORY[0x24563B490]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241DE9000);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x270EE4AB0](locale);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

uint64_t KB::utf8_string(KB *this, NSString *a2)
{
  return MEMORY[0x270F7CF10](this, a2);
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
  return MEMORY[0x270F7D068]();
}

void KB::String::~String(KB::String *this)
{
}

uint64_t KB::String::operator=()
{
  return MEMORY[0x270F7D0A8]();
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

uint64_t KB::String::replace_char(KB::String *this, uint64_t a2, const KB::String *a3)
{
  return MEMORY[0x270F7D220](this, a2, a3);
}

uint64_t KB::String::find_first_not_of(KB::String *this, const KB::String *a2, const KB::String::iterator *a3)
{
  return MEMORY[0x270F7D228](this, a2, a3);
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