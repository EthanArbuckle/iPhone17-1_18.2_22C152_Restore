void KB::LikelihoodInfo::~LikelihoodInfo(void **this)
{
  if (*((char *)this + 39) < 0) {
    operator delete(this[2]);
  }
}

void SetLocaleFromInputMode(void *a1)
{
  id v2 = a1;
  if ((id)__inputMode != v2)
  {
    id v3 = v2;
    objc_storeStrong((id *)&__inputMode, a1);
    id v2 = v3;
  }
}

id GetCurrentLocale()
{
  if (GetCurrentLocale___onceToken != -1) {
    dispatch_once(&GetCurrentLocale___onceToken, &__block_literal_global_141);
  }
  v0 = [(id)__inputMode languageWithRegion];
  v1 = [(id)GetCurrentLocale___localeDictionary objectForKey:v0];
  if (!v1)
  {
    v1 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:v0];
    [(id)GetCurrentLocale___localeDictionary setObject:v1 forKey:v0];
  }

  return v1;
}

uint64_t __GetCurrentLocale_block_invoke()
{
  GetCurrentLocale___localeDictionary = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  return MEMORY[0x270F9A758]();
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

__n128 __Block_byref_object_copy__507(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

unsigned int *WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref(unsigned int *result)
{
  v1 = result;
  unsigned int v2 = atomic_load(result);
  if (v2 == 1)
  {
    KB::String::~String((KB::String *)(result + 52));
    std::__tree<std::__value_type<float,int>,std::__map_value_compare<float,std::__value_type<float,int>,std::less<float>,true>,std::allocator<std::__value_type<float,int>>>::destroy(*((void **)v1 + 23));
    std::__tree<std::__value_type<float,int>,std::__map_value_compare<float,std::__value_type<float,int>,std::less<float>,true>,std::allocator<std::__value_type<float,int>>>::destroy(*((void **)v1 + 20));
    id v3 = (void *)*((void *)v1 + 11);
    while (v3)
    {
      v4 = v3;
      id v3 = (void *)*v3;
      uint64_t v5 = v4[4];
      if (v5) {
        WTF::RefCounted<TI::Favonius::Key>::deref(v5);
      }
      if (*((unsigned __int16 *)v4 + 8) >= 0xFu)
      {
        uint64_t v6 = v4[3];
        if (v6) {
          MEMORY[0x2611ED480](v6, 0x1000C8077774924);
        }
      }
      operator delete(v4);
    }
    v7 = (void *)*((void *)v1 + 9);
    *((void *)v1 + 9) = 0;
    if (v7) {
      operator delete(v7);
    }
    v8 = (void *)*((void *)v1 + 6);
    if (v8)
    {
      do
      {
        v9 = (void *)*v8;
        uint64_t v10 = v8[3];
        if (v10) {
          WTF::RefCounted<TI::Favonius::Key>::deref(v10);
        }
        operator delete(v8);
        v8 = v9;
      }
      while (v9);
    }
    v11 = (void *)*((void *)v1 + 4);
    *((void *)v1 + 4) = 0;
    if (v11) {
      operator delete(v11);
    }
    uint64_t v12 = *((void *)v1 + 1);
    if (v12)
    {
      uint64_t v13 = *((void *)v1 + 2);
      v14 = (void *)*((void *)v1 + 1);
      if (v13 != v12)
      {
        do
        {
          uint64_t v16 = *(void *)(v13 - 8);
          v13 -= 8;
          uint64_t v15 = v16;
          if (v16) {
            WTF::RefCounted<TI::Favonius::Key>::deref(v15);
          }
        }
        while (v13 != v12);
        v14 = (void *)*((void *)v1 + 1);
      }
      *((void *)v1 + 2) = v12;
      operator delete(v14);
    }
    JUMPOUT(0x2611ED4A0);
  }
  atomic_fetch_add((atomic_uint *volatile)result, 0xFFFFFFFF);
  return result;
}

void std::__tree<std::__value_type<float,int>,std::__map_value_compare<float,std::__value_type<float,int>,std::less<float>,true>,std::allocator<std::__value_type<float,int>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<float,int>,std::__map_value_compare<float,std::__value_type<float,int>,std::less<float>,true>,std::allocator<std::__value_type<float,int>>>::destroy(*a1);
    std::__tree<std::__value_type<float,int>,std::__map_value_compare<float,std::__value_type<float,int>,std::less<float>,true>,std::allocator<std::__value_type<float,int>>>::destroy(a1[1]);
    operator delete(a1);
  }
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
        MEMORY[0x2611ED480](v3, 0x1000C8077774924);
      }
    }
    KB::String::~String((KB::String *)(v1 + 8));
    JUMPOUT(0x2611ED4A0);
  }
  atomic_fetch_add((atomic_uint *volatile)result, 0xFFFFFFFF);
  return result;
}

uint64_t ___ZL44GetDirectlyCommittedNumbersAndPunctuationSetv_block_invoke()
{
  GetDirectlyCommittedNumbersAndPunctuationSet(void)::__directNumbersAndPunctuationSet = ;
  return MEMORY[0x270F9A758]();
}

uint64_t ___ZL54GetInputsPreventingAcceptCurrentCandidateIfSelectedSetv_block_invoke()
{
  GetInputsPreventingAcceptCurrentCandidateIfSelectedSet(void)::__inputsPreventingAcceptCurrentCandidateIfSelectedSet = [objc_alloc(MEMORY[0x263F7E520]) initWithCharactersInString:@"选"];
  return MEMORY[0x270F9A758]();
}

void ___ZL56TIGetHandwritingMultipleCharacterRecognitionEnabledValuev_block_invoke()
{
  id v0 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  [v0 _configureKey:@"HandwritingMultipleCharacterRecognitionEnabled" domain:@"com.apple.keyboard" defaultValue:MEMORY[0x263EFFA88]];
}

id handwritingResponseKitBackgroundQueue(void)
{
  if (handwritingResponseKitBackgroundQueue(void)::onceToken != -1) {
    dispatch_once(&handwritingResponseKitBackgroundQueue(void)::onceToken, &__block_literal_global_783);
  }
  id v0 = (void *)handwritingResponseKitBackgroundQueue(void)::_instance;
  return v0;
}

void ___Z37handwritingResponseKitBackgroundQueuev_block_invoke()
{
  unsigned int v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.TextInput.ResponseKit.handwritingResponseKitBackgroundQueue", v2);
  uint64_t v1 = (void *)handwritingResponseKitBackgroundQueue(void)::_instance;
  handwritingResponseKitBackgroundQueue(void)::_instance = (uint64_t)v0;
}

uint64_t __Block_byref_object_copy__787(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__788(uint64_t a1)
{
}

id GetCacheKey(NSString *a1, MCKeyboardInput *a2, int a3, uint64_t a4, int a5, int a6, uint64_t a7)
{
  uint64_t v13 = a1;
  v14 = a2;
  if (!v14)
  {
    uint64_t v15 = v13;
    goto LABEL_5;
  }
  if ([(MCKeyboardInput *)v14 hasKindOf:objc_opt_class()])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%lud", v14);
    uint64_t v15 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    uint64_t v16 = (__CFString *)v15;
    goto LABEL_8;
  }
  uint64_t v16 = [(MCKeyboardInput *)v14 asSearchString];
  if (![(__CFString *)v16 length])
  {
    uint64_t v17 = [(MCKeyboardInput *)v14 asInlineText];

    uint64_t v16 = (__CFString *)v17;
  }
LABEL_8:
  if (v16) {
    v18 = v16;
  }
  else {
    v18 = &stru_270B867F0;
  }
  v19 = @"-0";
  if (a3) {
    v20 = @"-1";
  }
  else {
    v20 = @"-0";
  }
  if (a5) {
    v21 = @"-1";
  }
  else {
    v21 = @"-0";
  }
  if (a6) {
    v19 = @"-1";
  }
  v22 = [(__CFString *)v18 stringByAppendingFormat:@"%@%lud%@%@%lud", v20, a4, v21, v19, a7];

  return v22;
}

void _GLOBAL__sub_I_TIKeyboardInputManagerChinese_mm()
{
  dispatch_queue_t v0 = (void *)MEMORY[0x2611ED640]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_25EC0A000);
}

void _GLOBAL__sub_I_TIKeyboardInputManagerWubi_mm()
{
  dispatch_queue_t v0 = (void *)MEMORY[0x2611ED640]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_25EC0A000);
}

void _GLOBAL__sub_I_TIKeyboardInputManagerPinyin_mm()
{
  dispatch_queue_t v0 = (void *)MEMORY[0x2611ED640]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_25EC0A000);
}

void _GLOBAL__sub_I_TIWordSearchCangjie_mm()
{
  dispatch_queue_t v0 = (void *)MEMORY[0x2611ED640]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_25EC0A000);
}

void _GLOBAL__sub_I_TIKeyboardInputManagerShapeBased_mm()
{
  dispatch_queue_t v0 = (void *)MEMORY[0x2611ED640]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_25EC0A000);
}

void _GLOBAL__sub_I_TIKeyboardInputManagerCangjie_mm()
{
  dispatch_queue_t v0 = (void *)MEMORY[0x2611ED640]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_25EC0A000);
}

void _GLOBAL__sub_I_TIKeyboardHandwritingSpecialization_mm()
{
  dispatch_queue_t v0 = (void *)MEMORY[0x2611ED640]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_25EC0A000);
}

void _GLOBAL__sub_I_TIKeyboardInputManagerChinesePhonetic_mm()
{
  dispatch_queue_t v0 = (void *)MEMORY[0x2611ED640]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_25EC0A000);
}

void _GLOBAL__sub_I_TIKeyboardInputManagerWubixing_mm()
{
  dispatch_queue_t v0 = (void *)MEMORY[0x2611ED640]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_25EC0A000);
}

void _GLOBAL__sub_I_TIInputManagerHandwriting_mm()
{
  dispatch_queue_t v0 = (void *)MEMORY[0x2611ED640]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_25EC0A000);
}

void _GLOBAL__sub_I_TIWordSearchChinesePhonetic_mm()
{
  dispatch_queue_t v0 = (void *)MEMORY[0x2611ED640]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_25EC0A000);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x270EE5068](*(void *)&encoding);
}

uint64_t MecabraAcceptCandidate()
{
  return MEMORY[0x270F99CD8]();
}

uint64_t MecabraAnalyzeStringWithContext()
{
  return MEMORY[0x270F99CE8]();
}

uint64_t MecabraCandidateCopySyllableLengthArrayInAnalysisString()
{
  return MEMORY[0x270F99CF8]();
}

uint64_t MecabraCandidateGetAttributes()
{
  return MEMORY[0x270F99D08]();
}

uint64_t MecabraCandidateGetSurface()
{
  return MEMORY[0x270F99D18]();
}

uint64_t MecabraCandidateGetType()
{
  return MEMORY[0x270F99D20]();
}

uint64_t MecabraCandidateGetWubixingType()
{
  return MEMORY[0x270F99D40]();
}

uint64_t MecabraCandidateIsBilingualCandidate()
{
  return MEMORY[0x270F99D48]();
}

uint64_t MecabraCandidateIsFuzzyMatchCandidate()
{
  return MEMORY[0x270F99D50]();
}

uint64_t MecabraCandidateIsPredictionCandidate()
{
  return MEMORY[0x270F99D58]();
}

uint64_t MecabraCandidateRelease()
{
  return MEMORY[0x270F99D60]();
}

uint64_t MecabraCandidateSetDisplayString()
{
  return MEMORY[0x270F99D68]();
}

uint64_t MecabraCangjieCodeIsValid()
{
  return MEMORY[0x270F99D78]();
}

uint64_t MecabraContextAddCandidate()
{
  return MEMORY[0x270F99D80]();
}

uint64_t MecabraContextCreateMutable()
{
  return MEMORY[0x270F99D90]();
}

uint64_t MecabraCopyEmojiCharacterArrayForString()
{
  return MEMORY[0x270F99DC0]();
}

uint64_t MecabraCreateCandidateFromContextString()
{
  return MEMORY[0x270F99DC8]();
}

uint64_t MecabraCreateHandwritingCandidate()
{
  return MEMORY[0x270F99DD0]();
}

uint64_t MecabraCreatePinyinSyllableArray()
{
  return MEMORY[0x270F99DD8]();
}

uint64_t MecabraCreateSyllableSequences()
{
  return MEMORY[0x270F99DE0]();
}

uint64_t MecabraFlushDynamicData()
{
  return MEMORY[0x270F99DF0]();
}

uint64_t MecabraGetDebuggingLog()
{
  return MEMORY[0x270F99DF8]();
}

uint64_t MecabraGetNextCandidate()
{
  return MEMORY[0x270F99E00]();
}

uint64_t MecabraInputKeyPropertiesCreateASCIIFromInputKeyString()
{
  return MEMORY[0x270F99E08]();
}

uint64_t MecabraInputKeyPropertiesCreateInputKeyFromASCIIString()
{
  return MEMORY[0x270F99E10]();
}

uint64_t MecabraInputKeyPropertiesGetInputKeys()
{
  return MEMORY[0x270F99E18]();
}

uint64_t MecabraPredictionAcceptCandidate()
{
  return MEMORY[0x270F99E20]();
}

uint64_t MecabraPredictionAnalyzeWithContext()
{
  return MEMORY[0x270F99E28]();
}

uint64_t MecabraPredictionGetNextCandidate()
{
  return MEMORY[0x270F99E30]();
}

uint64_t MecabraPreheatResources()
{
  return MEMORY[0x270F99E38]();
}

uint64_t MecabraSetAssetDataItemsForType()
{
  return MEMORY[0x270F99E58]();
}

uint64_t MecabraSetFuzzyPinyinPairs()
{
  return MEMORY[0x270F99E60]();
}

uint64_t MecabraSetWubixingStandard()
{
  return MEMORY[0x270F99E68]();
}

uint64_t MecabraSyllablesCreateWithString()
{
  return MEMORY[0x270F99E70]();
}

uint64_t MecabraSyllablesGetSyllableAtIndex()
{
  return MEMORY[0x270F99E78]();
}

uint64_t MecabraSyllablesGetSyllableCount()
{
  return MEMORY[0x270F99E80]();
}

uint64_t MecabraSyllablesRelease()
{
  return MEMORY[0x270F99E88]();
}

uint64_t MecabraWordPropertiesCreate()
{
  return MEMORY[0x270F99E90]();
}

uint64_t MecabraWordPropertiesGetProperty()
{
  return MEMORY[0x270F99E98]();
}

uint64_t MecabraWordPropertiesGetSortedRadicalList()
{
  return MEMORY[0x270F99EA0]();
}

uint64_t MecabraWordPropertiesRelease()
{
  return MEMORY[0x270F99EA8]();
}

void NSLog(NSString *format, ...)
{
}

uint64_t TICanLogMessageAtLevel()
{
  return MEMORY[0x270F7CCE0]();
}

uint64_t TICreateNameReadingPairsFromContactCollection()
{
  return MEMORY[0x270F7CCE8]();
}

uint64_t TIDispatchAsync()
{
  return MEMORY[0x270F7CBD8]();
}

uint64_t TIInputModeGetBaseLanguage()
{
  return MEMORY[0x270F7CC00]();
}

uint64_t TIInputModeGetVariant()
{
  return MEMORY[0x270F7CC58]();
}

uint64_t TIOSLogFacility()
{
  return MEMORY[0x270F7CD18]();
}

uint64_t TIPersonalizationContactOSLogFacility()
{
  return MEMORY[0x270F7CD20]();
}

uint64_t TIStatisticDistributionPushValue()
{
  return MEMORY[0x270F7CC78]();
}

uint64_t TIStatisticGetKeyForCandidateAccepted()
{
  return MEMORY[0x270F7CC88]();
}

uint64_t TIStatisticScalarDecrement()
{
  return MEMORY[0x270F7CC98]();
}

uint64_t TIStatisticScalarIncrement()
{
  return MEMORY[0x270F7CCA0]();
}

uint64_t TI_DIALECT_LM_PATH()
{
  return MEMORY[0x270F7CD38]();
}

uint64_t TI_GET_SCALED_POINT()
{
  return MEMORY[0x270F7CD40]();
}

uint64_t TI_IS_INTERNAL_INSTALL()
{
  return MEMORY[0x270F7CD48]();
}

uint64_t TI_IS_USING_CUSTOM_DIALECT_LM()
{
  return MEMORY[0x270F7CD50]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _TIQueueBackground()
{
  return MEMORY[0x270F7CCC0]();
}

uint64_t asMCNearbyKeys()
{
  return MEMORY[0x270F7CDF0]();
}

uint64_t TIInputManager::set_input_index(TIInputManager *this)
{
  return MEMORY[0x270F7CE08](this);
}

uint64_t TIInputManager::delete_from_input(TIInputManager *this)
{
  return MEMORY[0x270F7CE18](this);
}

uint64_t TIInputManager::set_locale_identifier()
{
  return MEMORY[0x270F7CE40]();
}

uint64_t TIInputManager::add_input()
{
  return MEMORY[0x270F7CE98]();
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

uint64_t KB::utf8_substring(KB *this, NSString *a2, _NSRange a3)
{
  return MEMORY[0x270F7CF48](this, a2, a3.location, a3.length);
}

uint64_t KB::String::String(KB::String *this, const char *a2)
{
  return MEMORY[0x270F7D078](this, a2);
}

void KB::String::~String(KB::String *this)
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

uint64_t TIInputManager::keys_for_input(TIInputManager *this)
{
  return MEMORY[0x270F7D188](this);
}

uint64_t KB::String::equal(KB::String *this, const KB::String *a2)
{
  return MEMORY[0x270F7D238](this, a2);
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

uint64_t kac_get_log()
{
  return MEMORY[0x270F7CCD0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}