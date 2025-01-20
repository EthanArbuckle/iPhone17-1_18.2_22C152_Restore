void KB::LikelihoodInfo::~LikelihoodInfo(void **this)
{
  if (*((char *)this + 39) < 0) {
    operator delete(this[2]);
  }
}

void _GLOBAL__sub_I_TIKeyboardInputManager_si_mm()
{
  v0 = (void *)MEMORY[0x24563D4A0]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241E41000);
}

uint64_t TIInputManager::delete_from_input(TIInputManager *this)
{
  return MEMORY[0x270F7CE18](this);
}

uint64_t TIInputManager::add_input()
{
  return MEMORY[0x270F7CE98]();
}

uint64_t KB::String::String(KB::String *this)
{
  return MEMORY[0x270F7D088](this);
}

void KB::String::~String(KB::String *this)
{
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