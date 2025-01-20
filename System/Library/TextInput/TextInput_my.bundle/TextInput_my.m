void KB::LikelihoodInfo::~LikelihoodInfo(void **this)
{
  if (*((char *)this + 39) < 0) {
    operator delete(this[2]);
  }
}

void ___ZL23InternalToExternalRegexv_block_invoke()
{
  id v2 = 0;
  v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(\\x{1031})?([\\x{1000}-\\x{102a}\\x{103f}\\x{104e}\\x{1050}-\\x{1055}])((?:\\x{1039}[\\x{1000}-\\x{101c}\\x{101e}\\x{1020}\\x{1021}\\x{1050}\\x{1051}]){0,2})([\\x{1004}\\x{101b}]\\x{103a}\\x{1039})?(?:\\x{103a}(\\x{103b}?))?([\\x{103b}-\\x{103e}]{0,3})([\\x{102d}-\\x{1030}\\x{1032}\\x{1058}\\x{1059}]{0,2})(\\x{102c}?)" options:0 error:&v2];
  id v1 = v2;
  if (!v1) {
    objc_storeStrong((id *)&InternalToExternalRegex(void)::__regex, v0);
  }
}

void ___ZL23ExternalToInternalRegexv_block_invoke()
{
  id v2 = 0;
  v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(?<!\\x{1039})([\\x{1004}\\x{101b}]\\x{103a}\\x{1039})?[\\x{1000}-\\x{102a}\\x{103f}\\x{104e}\\x{1050}-\\x{1055}](?:\\x{1039}[\\x{1000}-\\x{101c}\\x{101e}\\x{1020}\\x{1021}\\x{1050}\\x{1051}]){0,2}((?:\\x{103b}?\\x{103a})?)[\\x{103b}-\\x{103e}]{0,4}(\\x{1031}?)" options:0 error:&v2];
  id v1 = v2;
  if (!v1) {
    objc_storeStrong((id *)&ExternalToInternalRegex(void)::__regex, v0);
  }
}

void _GLOBAL__sub_I_TIKeyboardInputManager_my_mm()
{
  v0 = (void *)MEMORY[0x24563CFD0]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241E3A000);
}

uint64_t TIInputManager::delete_from_input(TIInputManager *this)
{
  return MEMORY[0x270F7CE18](this);
}

uint64_t TIInputManager::delete_suffix_from_input()
{
  return MEMORY[0x270F7CE68]();
}

uint64_t KB::utf8_string(KB *this, NSString *a2)
{
  return MEMORY[0x270F7CF10](this, a2);
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

void operator delete(void *__p)
{
  while (1)
    ;
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
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

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}