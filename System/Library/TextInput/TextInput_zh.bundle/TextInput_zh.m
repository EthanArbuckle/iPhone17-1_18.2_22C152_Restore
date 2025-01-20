void KB::LikelihoodInfo::~LikelihoodInfo(void **this)
{
  if (*((char *)this + 39) < 0) {
    operator delete(this[2]);
  }
}

void _GLOBAL__sub_I_TIKeyboardInputManager_zh_SegmentAdjust_mm()
{
  v0 = (void *)MEMORY[0x24563E750]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241E5B000);
}

void _GLOBAL__sub_I_TIKeyboardInputManager_zh_Base_mm()
{
  v0 = (void *)MEMORY[0x24563E750]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241E5B000);
}

void _GLOBAL__sub_I_TIKeyboardInputManager_zh_Toneless_mm()
{
  v0 = (void *)MEMORY[0x24563E750]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241E5B000);
}

void _GLOBAL__sub_I_TIKeyboardInputManagerCangjie_zh_mm()
{
  v0 = (void *)MEMORY[0x24563E750]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241E5B000);
}

void _GLOBAL__sub_I_TIKeyboardInputManager_zh_Pinyin_mm()
{
  v0 = (void *)MEMORY[0x24563E750]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241E5B000);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, v5, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void _GLOBAL__sub_I_TIKeyboardInputManagerLiveConversion_zh_mm()
{
  v0 = (void *)MEMORY[0x24563E750]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241E5B000);
}

void _GLOBAL__sub_I_TIKeyboardInputManager_zh_RetroCorrection_mm()
{
  v0 = (void *)MEMORY[0x24563E750]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241E5B000);
}

void _GLOBAL__sub_I_TIKeyboardInputManager_zh_hant_Zhuyin_mm()
{
  v0 = (void *)MEMORY[0x24563E750]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241E5B000);
}

void _GLOBAL__sub_I_TIKeyboardInputManagerWubixing_zh_mm()
{
  v0 = (void *)MEMORY[0x24563E750]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241E5B000);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void _GLOBAL__sub_I_TIKeyboardInputManager_zh_SegmentPicker_mm()
{
  v0 = (void *)MEMORY[0x24563E750]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241E5B000);
}

void _GLOBAL__sub_I_TIKeyboardInputManagerWubi_zh_mm()
{
  v0 = (void *)MEMORY[0x24563E750]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241E5B000);
}

BOOL TIStringContainsCharacterFromSet(void *a1, uint64_t a2)
{
  return [a1 rangeOfCharacterFromSet:a2] != 0x7FFFFFFFFFFFFFFFLL;
}

void _GLOBAL__sub_I_TIKeyboardInputManager_zh_Candidates_mm()
{
  v0 = (void *)MEMORY[0x24563E750]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241E5B000);
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x270EE52B8](string, range, transform, reverse);
}

uint64_t MecabraCandidateCopySyllableLengthArrayForWordAtIndex()
{
  return MEMORY[0x270F99CF0]();
}

uint64_t MecabraCandidateCopySyllableLengthArrayInAnalysisString()
{
  return MEMORY[0x270F99CF8]();
}

uint64_t MecabraCandidateGetDictionaryReading()
{
  return MEMORY[0x270F99D10]();
}

uint64_t MecabraCandidateGetWordCount()
{
  return MEMORY[0x270F99D28]();
}

uint64_t MecabraCandidateGetWordLengthAtIndex()
{
  return MEMORY[0x270F99D30]();
}

uint64_t MecabraCandidateGetWordReadingLengthAtIndex()
{
  return MEMORY[0x270F99D38]();
}

uint64_t MecabraCandidateWordAtIndexIsFromSystemDictionary()
{
  return MEMORY[0x270F99D70]();
}

uint64_t TICanLogMessageAtLevel()
{
  return MEMORY[0x270F7CCE0]();
}

uint64_t TIInputModeGetComponentsFromIdentifier()
{
  return MEMORY[0x270F7CC08]();
}

uint64_t TIOSLogFacility()
{
  return MEMORY[0x270F7CD18]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t TIInputManager::delete_from_input(TIInputManager *this)
{
  return MEMORY[0x270F7CE18](this);
}

uint64_t TIInputManager::sync_with_input_from_UI(TIInputManager *this)
{
  return MEMORY[0x270F7CE60](this);
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t uscript_getScript()
{
  return MEMORY[0x270F998E8]();
}