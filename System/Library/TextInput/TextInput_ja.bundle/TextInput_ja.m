void ___ZL18pairedPunctuationsv_block_invoke()
{
  void *v0;

  v0 = (void *)pairedPunctuations(void)::__pairedPunctuations;
  pairedPunctuations(void)::__pairedPunctuations = (uint64_t)&unk_26F5E1100;
}

BOOL KeyEqual(const void *a1, const void *a2)
{
  return a1 == a2;
}

void KB::LikelihoodInfo::~LikelihoodInfo(void **this)
{
  if (*((char *)this + 39) < 0) {
    operator delete(this[2]);
  }
}

id GetMultitapSequenceTable(void)
{
  if (GetMultitapSequenceTable(void)::__onceToken != -1) {
    dispatch_once(&GetMultitapSequenceTable(void)::__onceToken, &__block_literal_global_132);
  }
  v0 = (void *)GetMultitapSequenceTable(void)::__multitapMap;
  return v0;
}

void ___ZL24GetMultitapSequenceTablev_block_invoke()
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263EFF9A0] dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v1 = [&unk_26F5E1118 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v14;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v14 != v3) {
          objc_enumerationMutation(&unk_26F5E1118);
        }
        v5 = *(void **)(*((void *)&v13 + 1) + 8 * v4);
        __int16 v12 = 0;
        __int16 v12 = [v5 characterAtIndex:0];
        id v6 = [NSString stringWithCharacters:&v12 length:1];
        v7 = v6;
        if ((unint64_t)[v5 length] >= 2)
        {
          v8 = v6;
          unint64_t v9 = 1;
          do
          {
            __int16 v12 = [v5 characterAtIndex:v9];
            v7 = [NSString stringWithCharacters:&v12 length:1];
            [v0 setObject:v7 forKey:v8];

            ++v9;
            v8 = v7;
          }
          while (v9 < [v5 length]);
        }
        [v0 setObject:v6 forKey:v7];

        ++v4;
      }
      while (v4 != v2);
      uint64_t v2 = [&unk_26F5E1118 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v2);
  }
  uint64_t v10 = [v0 copy];
  v11 = (void *)GetMultitapSequenceTable(void)::__multitapMap;
  GetMultitapSequenceTable(void)::__multitapMap = v10;
}

void _GLOBAL__sub_I_TIKeyboardInputManager_ja_Kana_mm()
{
  v0 = (void *)MEMORY[0x24563C460]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241DFD000);
}

void std::__shared_weak_count::__release_shared[abi:nn180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void _GLOBAL__sub_I_TIKeyboardInputManagerLiveConversion_ja_mm()
{
  v0 = (void *)MEMORY[0x24563C460]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241DFD000);
}

void _GLOBAL__sub_I_TIKeyboardInputManager_ja_Romaji_mm()
{
  v0 = (void *)MEMORY[0x24563C460]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241DFD000);
}

id TITransliterateKanaToRomaji(void *a1)
{
  uint64_t v1 = [a1 stringByReplacingOccurrencesOfString:@"ー" withString:@"\uFFFD"];
  uint64_t v2 = (void *)MecabraReverseConvertedRomajiCreateFromKanaString();
  uint64_t v3 = [v2 stringByReplacingOccurrencesOfString:@"\uFFFD" withString:@"-"];

  return v3;
}

id TIJapaneseTransliterate(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (!KanaCharacterSet_kanaSet)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x263F089C0], "characterSetWithRange:", 12353, 182);
    v5 = (void *)MEMORY[0x263F08708];
    id v6 = [v4 bitmapRepresentation];
    uint64_t v7 = [v5 characterSetWithBitmapRepresentation:v6];
    v8 = (void *)KanaCharacterSet_kanaSet;
    KanaCharacterSet_kanaSet = v7;
  }
  uint64_t v9 = objc_msgSend(v3, "rangeOfCharacterFromSet:");
  id v10 = v3;
  v11 = v10;
  __int16 v12 = v10;
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_4;
  }
  __int16 v12 = TITransliterateKanaToRomaji(v10);
  long long v16 = v11;
  if (a2 == 4)
  {
LABEL_12:
    id v14 = v16;

    goto LABEL_18;
  }
  if ((a2 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    long long v16 = TransliterateStringWithOption(v11, (const __CFString *)*MEMORY[0x263EFFEF8], 0);

    if (a2 == 2)
    {
      uint64_t v17 = TransliterateStringWithOption(v16, (const __CFString *)*MEMORY[0x263EFFEF0], 0);

      long long v16 = (void *)v17;
    }
    goto LABEL_12;
  }
  uint64_t v18 = TITransliterateKanaToRomaji(v11);

  __int16 v12 = (void *)v18;
LABEL_4:
  if ((unint64_t)(a2 - 2) > 2)
  {
    if ((a2 | 4) == 5)
    {
      TransliterateStringWithOption(v12, (const __CFString *)*MEMORY[0x263EFFEF0], a2 == 1);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    long long v13 = TransliterateStringWithOption(v12, (const __CFString *)*MEMORY[0x263EFFF28], 0);
    id v14 = v13;
    if ((a2 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      long long v15 = TransliterateStringWithOption(v13, (const __CFString *)*MEMORY[0x263EFFEF8], 0);

      if (a2 == 2)
      {
        TransliterateStringWithOption(v15, (const __CFString *)*MEMORY[0x263EFFEF0], 0);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v14 = v15;
      }
    }
  }
LABEL_18:

  return v14;
}

__CFString *TransliterateStringWithOption(void *a1, const __CFString *a2, Boolean a3)
{
  id v5 = a1;
  if (CFStringCompare(a2, (CFStringRef)*MEMORY[0x263EFFF28], 0) || (a3 & 1) != 0)
  {
    v22 = (__CFString *)[v5 mutableCopy];
    range.location = 0;
    range.length = [v5 length];
    CFStringTransform(v22, &range, a2, a3);
    goto LABEL_24;
  }
  id v6 = v5;
  uint64_t v7 = v6;
  if (TransliterateRomajiToKana__DispatchOnceToken != -1)
  {
    dispatch_once(&TransliterateRomajiToKana__DispatchOnceToken, &__block_literal_global_4);
    if (v7) {
      goto LABEL_5;
    }
LABEL_23:
    v22 = 0;
    goto LABEL_24;
  }
  if (!v6) {
    goto LABEL_23;
  }
LABEL_5:
  id v27 = v5;
  uint64_t v8 = [v7 lowercaseStringWithLocale:TransliterateRomajiToKana_japanese];

  v26 = (void *)v8;
  uint64_t v9 = MecabraConvertedKanaCreateFromRomajiString();
  id v10 = (void *)[(id)MecabraConvertedKanaGetKana() copy];
  uint64_t v25 = v9;
  v28 = MecabraConvertedKanaGetAlignment();
  v11 = objc_opt_new();
  if ([v10 length])
  {
    unint64_t v12 = 0;
    uint64_t v13 = 0;
    char v14 = 0;
    uint64_t v15 = 0;
    do
    {
      unint64_t v16 = v12 + 1;
      uint64_t v17 = objc_msgSend(NSNumber, "numberWithInteger:", v12 + 1, v25);
      uint64_t v18 = [v28 objectForKeyedSubscript:v17];

      if (v18)
      {
        uint64_t v19 = [v18 integerValue];
        if (v14)
        {
          v20 = [NSNumber numberWithInteger:v15 + v13 - v19];
          [v11 addObject:v20];

          [v11 addObject:&unk_26F5E10E8];
        }
        else
        {
          v21 = [NSNumber numberWithInteger:v19 - (v15 + v13)];
          [v11 addObject:v21];
        }
        char v14 = 0;
        uint64_t v13 = 0;
        uint64_t v15 = v19;
      }
      else if ([v10 characterAtIndex:v12] == 12387)
      {
        [v11 addObject:&unk_26F5E10D0];
        ++v13;
      }
      else
      {
        char v14 = 1;
      }

      unint64_t v12 = v16;
    }
    while (v16 < [v10 length]);
  }
  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", @"-", @"ー", v25);
  v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if ([(__CFString *)v22 length])
  {
    id v5 = v27;
    if ([(__CFString *)v22 characterAtIndex:[(__CFString *)v22 length] - 1] == 110)
    {
      v23 = [(__CFString *)v22 substringToIndex:[(__CFString *)v22 length] - 1];

      v22 = [v23 stringByAppendingString:@"ん"];
    }
  }
  else
  {
    id v5 = v27;
  }
  MecabraConvertedKanaRelease();

LABEL_24:
  return v22;
}

uint64_t __TransliterateRomajiToKana_block_invoke()
{
  TransliterateRomajiToKana_japanese = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"ja"];
  return MEMORY[0x270F9A758]();
}

void _GLOBAL__sub_I_TIKeyboardInputManagerLiveConversion_ja_Romaji_mm()
{
  v0 = (void *)MEMORY[0x24563C460]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241DFD000);
}

void __copy_assignment_8_8_s0_s8(id *a1, uint64_t a2)
{
  objc_storeStrong(a1, *(id *)a2);
  uint64_t v4 = *(void **)(a2 + 8);
  objc_storeStrong(a1 + 1, v4);
}

void ___ZL17notificationQueuev_block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.kbd.NotificationQueue", v2);
  uint64_t v1 = (void *)notificationQueue(void)::notificationQueue;
  notificationQueue(void)::notificationQueue = (uint64_t)v0;
}

void _GLOBAL__sub_I_TIKeyboardInputManager_ja_mm()
{
  dispatch_queue_t v0 = (void *)MEMORY[0x24563C460]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241DFD000);
}

void _GLOBAL__sub_I_TIKeyboardInputManagerLiveConversion_ja_Kana_mm()
{
  dispatch_queue_t v0 = (void *)MEMORY[0x24563C460]();
  __cxa_atexit((void (*)(void *))KB::LikelihoodInfo::~LikelihoodInfo, &KB::k_invalid_likelihood_value, &dword_241DFD000);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x270EE4748](alloc, theString);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x270EE4760](theSet, theChar);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x270EE52B8](string, range, transform, reverse);
}

uint64_t IDXCreateIndexObject()
{
  return MEMORY[0x270F260F0]();
}

uint64_t IDXGetFieldDataPtrs()
{
  return MEMORY[0x270F260F8]();
}

uint64_t IDXGetMatchDataPtr()
{
  return MEMORY[0x270F26100]();
}

uint64_t IDXSetRequestFields()
{
  return MEMORY[0x270F26108]();
}

uint64_t IDXSetSearchString()
{
  return MEMORY[0x270F26110]();
}

uint64_t MecabraCandidateGetSurface()
{
  return MEMORY[0x270F99D18]();
}

uint64_t MecabraConvertedKanaCreateFromRomajiString()
{
  return MEMORY[0x270F99DA0]();
}

uint64_t MecabraConvertedKanaGetAlignment()
{
  return MEMORY[0x270F99DA8]();
}

uint64_t MecabraConvertedKanaGetKana()
{
  return MEMORY[0x270F99DB0]();
}

uint64_t MecabraConvertedKanaRelease()
{
  return MEMORY[0x270F99DB8]();
}

uint64_t MecabraGetNextCandidate()
{
  return MEMORY[0x270F99E00]();
}

uint64_t MecabraReverseConvertedRomajiCreateFromKanaString()
{
  return MEMORY[0x270F99E48]();
}

uint64_t TIBundlePathForInputMode()
{
  return MEMORY[0x270F7CBC0]();
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

uint64_t TIOSLogFacility()
{
  return MEMORY[0x270F7CD18]();
}

uint64_t TIPersonalizationContactOSLogFacility()
{
  return MEMORY[0x270F7CD20]();
}

uint64_t TI_IS_WILDCAT()
{
  return MEMORY[0x270F7CD58]();
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

uint64_t TIInputManager::delete_from_favonius_stroke_history(TIInputManager *this)
{
  return MEMORY[0x270F7CE78](this);
}

uint64_t TIInputManager::initialize_search_if_necessary_from_last_touch(TIInputManager *this)
{
  return MEMORY[0x270F7CE88](this);
}

uint64_t TIInputManager::TIInputManager()
{
  return MEMORY[0x270F7CEB0]();
}

uint64_t KB::std_string(KB *this, NSString *a2)
{
  return MEMORY[0x270F7CF08](this, a2);
}

uint64_t KB::String::iterator::initialize(KB::String::iterator *this)
{
  return MEMORY[0x270F7D058](this);
}

uint64_t TIInputManager::keys_for_input(TIInputManager *this)
{
  return MEMORY[0x270F7D188](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void operator delete(void *__p)
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

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F00](*(void *)&a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x270ED9E58](__x, __y);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}