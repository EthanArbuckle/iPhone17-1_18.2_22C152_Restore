void KB::LikelihoodInfo::~LikelihoodInfo(void **this)
{
  if (*((char *)this + 39) < 0) {
    operator delete(this[2]);
  }
}

uint64_t KB::GurmukhiInputSegmentFilter::allows_composed_substitution(KB::GurmukhiInputSegmentFilter *this, int a2, int a3, int a4)
{
  if (a3 == 2675)
  {
    if ((a2 != 2569 || a4 != 2625) && (a2 != 2570 || a4 != 2626))
    {
      BOOL v4 = a2 == 2579;
      int v5 = 2635;
      return v4 && a4 == v5;
    }
    return 1;
  }
  if (a3 == 2674)
  {
    if ((a2 != 2567 || a4 != 2623) && (a2 != 2568 || a4 != 2624))
    {
      BOOL v4 = a2 == 2575;
      int v5 = 2631;
      return v4 && a4 == v5;
    }
    return 1;
  }
  if (a3 != 2565) {
    return MEMORY[0x270F7D1E8](this);
  }
  if (a2 == 2576 && a4 == 2632 || a2 == 2580 && a4 == 2636) {
    return 1;
  }
  BOOL v4 = a2 == 2566;
  int v5 = 2622;
  return v4 && a4 == v5;
}

BOOL KB::GurmukhiInputSegmentFilter::character_is_letter_modifier(KB::GurmukhiInputSegmentFilter *this, UChar32 c)
{
  BOOL result = 1;
  if (c <= 900)
  {
    if (((c - 168) > 0xC || ((1 << (c + 88)) & 0x1081) == 0) && c != 730 && c != 732) {
      return u_charType(c) == 4;
    }
  }
  else if (((c - 2622) > 0xE || ((1 << (c - 62)) & 0x661F) == 0) && c != 901)
  {
    return u_charType(c) == 4;
  }
  return result;
}

uint64_t KB::GurmukhiInputSegmentFilter::character_is_precomposed_diacritic_letter(KB::GurmukhiInputSegmentFilter *this, uint64_t a2)
{
  if (a2 - 2566) < 0xF && ((0x661Fu >> (a2 - 6))) {
    return 1;
  }
  else {
    return MEMORY[0x270F7D030](a2);
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

void KB::GurmukhiInputSegmentFilter::~GurmukhiInputSegmentFilter(KB::GurmukhiInputSegmentFilter *this)
{
}

void std::__shared_ptr_emplace<KB::InputManagerSpecialization_pa>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5E3F08;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<KB::InputManagerSpecialization_pa>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5E3F08;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24563D2A0);
}

uint64_t std::__shared_ptr_emplace<KB::InputManagerSpecialization_pa>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void KB::InputManagerSpecialization_pa::~InputManagerSpecialization_pa(KB::InputManagerSpecialization_pa *this)
{
  KB::InputManagerSpecialization::~InputManagerSpecialization(this);
  JUMPOUT(0x24563D2A0);
}

void KB::InputManagerSpecialization_pa::create_input_segment_filter()
{
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
    return (unsigned int *)MEMORY[0x24563D2A0](v1, 0x10B0C409EA53459);
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
      JUMPOUT(0x24563D280);
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
        MEMORY[0x24563D280](v3, 0x1000C8077774924);
      }
    }
    KB::String::~String((KB::String *)(v1 + 8));
    JUMPOUT(0x24563D2A0);
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

void std::__shared_weak_count::__release_shared[abi:nn180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void _GLOBAL__sub_I_TIKeyboardInputManager_pa_mm()
{
  v0 = (void *)MEMORY[0x24563D300]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241E3D000);
}

uint64_t TIInputManager::delete_from_input(TIInputManager *this)
{
  return MEMORY[0x270F7CE18](this);
}

uint64_t TIInputManager::delete_suffix_from_input()
{
  return MEMORY[0x270F7CE68]();
}

uint64_t TIInputManager::delete_from_favonius_stroke_history(TIInputManager *this)
{
  return MEMORY[0x270F7CE78](this);
}

uint64_t TIInputManager::TIInputManager()
{
  return MEMORY[0x270F7CEB0]();
}

uint64_t KB::std_string(KB *this, NSString *a2)
{
  return MEMORY[0x270F7CF08](this, a2);
}

uint64_t KB::utf8_string(KB *this, NSString *a2)
{
  return MEMORY[0x270F7CF10](this, a2);
}

uint64_t KB::lower_character(KB *this, uint64_t a2, const __CFLocale *a3)
{
  return MEMORY[0x270F7CF50](this, a2, a3);
}

uint64_t KB::InputManagerSpecialization::InputManagerSpecialization(KB::InputManagerSpecialization *this, const __CFLocale *a2)
{
  return MEMORY[0x270F7D018](this, a2);
}

void KB::InputManagerSpecialization::~InputManagerSpecialization(KB::InputManagerSpecialization *this)
{
}

void KB::String::~String(KB::String *this)
{
}

uint64_t KB::ns_string(KB *this, const KB::String *a2)
{
  return MEMORY[0x270F7D0E0](this, a2);
}

uint64_t TIInputManager::input_stem(TIInputManager *this)
{
  return MEMORY[0x270F7D168](this);
}

uint64_t TIInputManager::input_string(TIInputManager *this)
{
  return MEMORY[0x270F7D178](this);
}

uint64_t TIInputManager::favonius_layout(TIInputManager *this)
{
  return MEMORY[0x270F7D190](this);
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

int8_t u_charType(UChar32 c)
{
  return MEMORY[0x270F994E8](*(void *)&c);
}