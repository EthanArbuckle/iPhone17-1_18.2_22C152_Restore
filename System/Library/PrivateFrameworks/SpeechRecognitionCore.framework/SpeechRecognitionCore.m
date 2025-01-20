void RXCFType::~RXCFType(RXCFType *this)
{
  JUMPOUT(0x230F59F90);
}

uint64_t RXCFCopy(const __CFAllocator *a1, char *a2)
{
  return (*(uint64_t (**)(char *, const __CFAllocator *))(*((void *)a2 + 2) + 16))(a2 + 16, a1);
}

void RXCFFinalize(void *a1)
{
  v1 = (void (***)(void))(a1 + 2);
  v2 = (void (**)(void))(*(uint64_t (**)(char *))(a1[2] + 56))((char *)a1 + 16);
  (**v1)(v1);
  if (v2)
  {
    v2[2](v2);
    _Block_release(v2);
  }
}

uint64_t RXCFEqual(void *a1, const void *a2)
{
  return (*(uint64_t (**)(void))(a1[2] + 24))();
}

uint64_t RXCFHash(void *a1)
{
  return (*(uint64_t (**)(void))(a1[2] + 32))();
}

uint64_t RXCFCopyFormattingDesc(void *a1, const __CFDictionary *a2)
{
  return (*(uint64_t (**)(void))(a1[2] + 40))();
}

uint64_t RXCFCopyDebugDesc(void *a1)
{
  return (*(uint64_t (**)(void))(a1[2] + 48))();
}

uint64_t RXCFType::Copy(RXCFType *this, const __CFAllocator *a2)
{
  return 0;
}

uint64_t RXCFType::Equal(RXCFType *this, const RXCFType *a2)
{
  return 0;
}

uint64_t RXCFType::Hash(RXCFType *this)
{
  return 0;
}

uint64_t RXCFType::CopyFormattingDesc(RXCFType *this, const __CFDictionary *a2)
{
  return 0;
}

uint64_t RXCFType::CopyDebugDesc(RXCFType *this)
{
  return 0;
}

uint64_t RXCFType::WillDestroy(RXCFType *this)
{
  return 0;
}

CFIndex RXDebugFlagsUpdate()
{
  sRXDebug = CFPreferencesGetAppIntegerValue(@"RXDebugFlag", @"com.apple.SpeechRecognitionCore.speechrecognitiond", 0);
  sRXVeryVerbose = CFPreferencesGetAppBooleanValue(@"RXVeryVerbose", @"com.apple.SpeechRecognitionCore.speechrecognitiond", 0) != 0;
  sRXAutomationMode = CFPreferencesGetAppIntegerValue(@"RXDebugAutomationMode", @"com.apple.SpeechRecognitionCore.speechrecognitiond", 0);
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"RXDebugAutomationSimulateOpenMic", @"com.apple.SpeechRecognitionCore.speechrecognitiond", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = AppBooleanValue == 0;
  }
  else {
    BOOL v1 = 0;
  }
  char v2 = !v1;
  sRXAutomationSimulateOpenMic = v2;
  Boolean keyExistsAndHasValidFormat = 0;
  char AppIntegerValue = CFPreferencesGetAppIntegerValue(@"RXRecognitionResetTimeInSec", @"com.apple.SpeechRecognitionCore.speechrecognitiond", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    char v4 = AppIntegerValue;
  }
  else {
    char v4 = 5;
  }
  sResetTimeInSec = v4;
  CFIndex result = CFPreferencesGetAppIntegerValue(@"RXDebugAutomationSaveKeywordsAudio", @"com.apple.SpeechRecognitionCore.speechrecognitiond", 0);
  sRXAutomationSaveKeywordsAudio = result != 0;
  return result;
}

uint64_t RXLogServerResults()
{
  return sRXDebug >> 7;
}

uint64_t RXLogServerGrammar()
{
  return BYTE1(sRXDebug) & 1;
}

uint64_t RXLogSound()
{
  return (BYTE1(sRXDebug) >> 1) & 1;
}

uint64_t RXLogClientUpdates()
{
  return (BYTE1(sRXDebug) >> 2) & 1;
}

uint64_t RXLogPerformance()
{
  return (BYTE1(sRXDebug) >> 3) & 1;
}

uint64_t RXVeryVerbose()
{
  return sRXVeryVerbose;
}

BOOL RXAutomationModeSynthesis()
{
  return sRXAutomationMode == 1;
}

BOOL RXAutomationModeResult()
{
  return sRXAutomationMode == 2;
}

BOOL RXAutomationModeFileName()
{
  return sRXAutomationMode == 3;
}

uint64_t RXAutomationSimulateOpenMic()
{
  return sRXAutomationSimulateOpenMic;
}

uint64_t RXResetTimeInSec()
{
  return sResetTimeInSec;
}

uint64_t RXAutomationSaveKeywordsAudio()
{
  return sRXAutomationSaveKeywordsAudio;
}

void __RXAbort(int a1, uint64_t a2, uint64_t a3, uint64_t a4, CFStringRef format, ...)
{
  va_start(va, format);
  CFStringRef v9 = CFStringCreateWithFormatAndArguments(0, 0, format, va);
  CFStringRef v10 = v9;
  if (a4) {
  else
  }
    CFStringRef v11 = CFStringCreateWithFormat(0, 0, @"%s:%u: %@\n", a2, a3, v9);
  CFStringRef v12 = v11;
  if (v10) {
    CFRelease(v10);
  }
  CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(0, v12, 0x8000100u, 0);
  if (v12) {
    CFRelease(v12);
  }
  if (ExternalRepresentation)
  {
    BytePtr = CFDataGetBytePtr(ExternalRepresentation);
    size_t Length = CFDataGetLength(ExternalRepresentation);
    write(1, BytePtr, Length);
    CFRelease(ExternalRepresentation);
  }
  if (a1) {
    abort();
  }
}

uint64_t RXIsAppleInternal()
{
  if (RXIsAppleInternal::onceToken != -1) {
    dispatch_once(&RXIsAppleInternal::onceToken, &__block_literal_global);
  }
  return RXIsAppleInternal::isAppleInternal;
}

uint64_t __RXIsAppleInternal_block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  RXIsAppleInternal::isAppleInternal = result;
  return result;
}

void reportBacktrace()
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v15 = 0;
  *(_OWORD *)v13 = 0u;
  memset(v14, 0, sizeof(v14));
  int v0 = backtrace(v13, 33);
  uint64_t v1 = (v0 - 2);
  char v2 = backtrace_symbols((void *const *)v14, v1);
  if (v2)
  {
    v3 = v2;
    if (v0 >= 3)
    {
      for (uint64_t i = 0; v1 != i; ++i)
      {
        v5 = v3[i];
        if (v5)
        {
          if (RXOSLog::onceToken != -1) {
            dispatch_once(&RXOSLog::onceToken, &__block_literal_global_32);
          }
          uint64_t v6 = RXOSLog::signpostLog;
          if (!os_log_type_enabled((os_log_t)RXOSLog::signpostLog, OS_LOG_TYPE_ERROR)) {
            continue;
          }
          uint64_t v7 = *((void *)v14 + i);
          *(_DWORD *)buf = 67109634;
          int v17 = i + 1;
          __int16 v18 = 2048;
          uint64_t v19 = v7;
          __int16 v20 = 2080;
          v21 = v5;
          v8 = v6;
          CFStringRef v9 = "BACKTRACE: %-3d %p %s\n";
          uint32_t v10 = 28;
        }
        else
        {
          if (RXOSLog::onceToken != -1) {
            dispatch_once(&RXOSLog::onceToken, &__block_literal_global_32);
          }
          uint64_t v11 = RXOSLog::signpostLog;
          if (!os_log_type_enabled((os_log_t)RXOSLog::signpostLog, OS_LOG_TYPE_ERROR)) {
            continue;
          }
          uint64_t v12 = *((void *)v14 + i);
          *(_DWORD *)buf = 67109376;
          int v17 = i + 1;
          __int16 v18 = 2048;
          uint64_t v19 = v12;
          v8 = v11;
          CFStringRef v9 = "BACKTRACE: %-3d %p\n";
          uint32_t v10 = 18;
        }
        _os_log_impl(&dword_22BF8A000, v8, OS_LOG_TYPE_ERROR, v9, buf, v10);
      }
    }
    free(v3);
  }
}

uint64_t RXSignpostLog()
{
  if (RXSignpostLog::onceToken != -1) {
    dispatch_once(&RXSignpostLog::onceToken, &__block_literal_global_29);
  }
  return RXSignpostLog::signpostLog;
}

os_log_t __RXSignpostLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.SpeechRecognitionCore", "SRCSignposts");
  RXSignpostLog::signpostLog = (uint64_t)result;
  return result;
}

uint64_t RXOSLog()
{
  if (RXOSLog::onceToken != -1) {
    dispatch_once(&RXOSLog::onceToken, &__block_literal_global_32);
  }
  return RXOSLog::signpostLog;
}

os_log_t __RXOSLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.SpeechRecognitionCore", "SRCLogs");
  RXOSLog::signpostLog = (uint64_t)result;
  return result;
}

const char *RXPropertyKeyName(int a1)
{
  if (a1 > 1919770999)
  {
    if (a1 <= 1936028273)
    {
      if (a1 <= 1935766883)
      {
        switch(a1)
        {
          case 1919771000:
            return "kRXRecognizerProperty_MaxResults";
          case 1919841645:
            return "kRXRecognizerProperty_NumberMode";
          case 1920168044:
            return "kRXRecognizerProperty_SpellingMode";
        }
      }
      else if (a1 > 1935832435)
      {
        if (a1 == 1935832436) {
          return "kRXRecognitionSystemProperty_BeginUtteranceCallback";
        }
        if (a1 == 1936027494) {
          return "kRXRecognitionSystemProperty_EndOfFileCallback";
        }
      }
      else
      {
        if (a1 == 1935766884) {
          return "kRXRecognitionSystemProperty_AudioDevice";
        }
        if (a1 == 1935766886) {
          return "kRXRecognitionSystemProperty_AudioFormat";
        }
      }
    }
    else if (a1 > 1936946545)
    {
      if (a1 > 1937006910)
      {
        if (a1 == 1937006911) {
          return "kRXRecognitionSystemProperty_Status";
        }
        if (a1 == 1937077355) {
          return "kRXRecognitionSystemProperty_SupportedTasks";
        }
      }
      else
      {
        if (a1 == 1936946546) {
          return "kRXRecognitionSystemProperty_SourceURL";
        }
        if (a1 == 1937006881) {
          return "kRXRecognitionSystemProperty_StatusBlocking";
        }
      }
    }
    else if (a1 > 1936749166)
    {
      if (a1 == 1936749167) {
        return "kRXRecognitionSystemProperty_FilterProfanity";
      }
      if (a1 == 1936941429) {
        return "kRXRecognitionSystemProperty_SourceAudio";
      }
    }
    else
    {
      if (a1 == 1936028274) {
        return "kRXRecognitionSystemProperty_ServerErrorCallback";
      }
      if (a1 == 1936487278) {
        return "kRXRecognitionSystemProperty_CanListen";
      }
    }
  }
  else if (a1 <= 1819439219)
  {
    if (a1 <= 1818588268)
    {
      switch(a1)
      {
        case 1818326372:
          return "kRXLanguageObjectProperty_Audio";
        case 1818391412:
          return "kRXLanguageObjectProperty_NBest";
        case 1818457208:
          return "kRXLanguageObjectProperty_Context";
      }
    }
    else if (a1 > 1819173228)
    {
      if (a1 == 1819173229) {
        return "kRXLanguageObjectProperty_Name";
      }
      if (a1 == 1819242612) {
        return "kRXLanguageObjectProperty_Optional";
      }
    }
    else
    {
      if (a1 == 1818588269) {
        return "kRXLanguageObjectProperty_EndTime";
      }
      if (a1 == 1818786160) {
        return "kRXLanguageObjectProperty_Hypothesis";
      }
    }
  }
  else if (a1 > 1919118444)
  {
    if (a1 > 1919705452)
    {
      if (a1 == 1919705453) {
        return "kRXRecognizerProperty_LanguageModel";
      }
      if (a1 == 1919710062) {
        return "kRXRecognizerProperty_IsListening";
      }
    }
    else
    {
      if (a1 == 1919118445) {
        return "kRXRecognizerProperty_AllowCloseMatch";
      }
      if (a1 == 1919120244) {
        return "kRXRecognitionSystemProperty_TextToBeRecognized";
      }
    }
  }
  else if (a1 > 1819571825)
  {
    if (a1 == 1819571826) {
      return "kRXLanguageObjectProperty_TextVariants";
    }
    if (a1 == 1819572340) {
      return "kRXLanguageObjectProperty_Text";
    }
  }
  else
  {
    if (a1 == 1819439220) {
      return "kRXLanguageObjectProperty_Repeatable";
    }
    if (a1 == 1819505773) {
      return "kRXLanguageObjectProperty_StartTime";
    }
  }
  os_log_t result = (const char *)&RXPropertyKeyName::sTmpProp;
  byte_268495FA4 = 0;
  return result;
}

void RXObject::RXObject(RXObject *this)
{
  *(void *)this = &unk_26DF656E0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = -1;
  *((void *)this + 4) = 0;
}

void RXObject::~RXObject(RXObject *this, uint64_t a2, RXObject *a3)
{
  *(void *)this = &unk_26DF656E0;
  RXRecognitionSystem::DeadObject(*((void *)this + 2), this, a3);
  RXCFProp<void const*>::~RXCFProp((const void **)this + 4);
  RXCFType::~RXCFType(this);
}

{
  uint64_t vars8;

  RXObject::~RXObject(this, a2, a3);
  JUMPOUT(0x230F59F90);
}

void __clang_call_terminate(void *a1)
{
}

CFTypeRef RXObject::CopyProperty(RXObject *this, int a2)
{
  if (a2 != 1818457208)
  {
    v5 = RXPropertyKeyName(a2);
    CFStringRef v6 = CFCopyDescription((char *)this - 16);
    CFTypeRef v7 = CFAutorelease(v6);
    __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 90, 0, @"Property %s not defined for %@", v5, v7);
    return 0;
  }
  v3 = (const void *)*((void *)this + 4);
  if (!v3) {
    return 0;
  }
  return CFRetain(v3);
}

CFTypeRef RXObject::CopyPropertyWithLocale(RXObject *this, int a2, const __CFLocale *a3)
{
  if (a2 != 1818457208)
  {
    CFStringRef v6 = RXPropertyKeyName(a2);
    CFStringRef v7 = CFCopyDescription((char *)this - 16);
    CFTypeRef v8 = CFAutorelease(v7);
    __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 103, 0, @"Property %s not defined for %@", v6, v8);
    return 0;
  }
  char v4 = (const void *)*((void *)this + 4);
  if (!v4) {
    return 0;
  }
  return CFRetain(v4);
}

void RXObject::SetProperty(RXObject *this, int a2, CFTypeRef cf)
{
  if (a2 == 1818457208)
  {
    char v4 = (CFTypeRef *)((char *)this + 32);
    RXCFProp<void const*>::operator=(v4, cf);
  }
  else
  {
    v5 = RXPropertyKeyName(a2);
    CFStringRef v6 = CFCopyDescription((char *)this - 16);
    CFTypeRef v7 = CFAutorelease(v6);
    __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 120, 0, @"Property %s not defined for %@", v5, v7);
  }
}

CFTypeRef RXCFProp<void const*>::operator=(CFTypeRef *a1, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  if (*a1) {
    CFRelease(*a1);
  }
  *a1 = cf;
  return cf;
}

void RXObject::PropertyReadOnly(RXObject *this, int a2)
{
  CFStringRef v3 = CFCopyDescription((char *)this - 16);
  char v4 = RXPropertyKeyName(a2);
  __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 128, 0, @"Property %s is read only for %@", v4, v3);
  CFRelease(v3);
}

void RXObject::PropertyWriteOnly(RXObject *this, int a2)
{
  CFStringRef v3 = CFCopyDescription((char *)this - 16);
  char v4 = RXPropertyKeyName(a2);
  __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 136, 0, @"Property %s is write only for %@", v4, v3);
  CFRelease(v3);
}

uint64_t RXObject::Smudge(uint64_t this)
{
  *(void *)(this + 24) |= *(void *)(this + 16);
  return this;
}

BOOL RXObject::ShouldSerialize(RXObject *this, RXRecognitionSystem *a2)
{
  uint64_t v3 = 1 << *((_DWORD *)a2 + 10);
  RXRecognitionSystem::ReachableObject((uint64_t **)a2, this);
  uint64_t v4 = *((void *)this + 2);
  if ((v4 & v3) != 0)
  {
    uint64_t v5 = *((void *)this + 3);
  }
  else
  {
    uint64_t v6 = v4 | v3;
    uint64_t v5 = *((void *)this + 3) | v3;
    *((void *)this + 2) = v6;
    *((void *)this + 3) = v5;
  }
  if ((v5 & v3) != 0) {
    *((void *)this + 3) = v5 & ~v3;
  }
  return (v5 & v3) != 0;
}

void RXObject::Serialize(uint64_t a1)
{
  CFStringRef v1 = CFCopyDescription((CFTypeRef)(a1 - 16));
  __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 173, 0, @"Can't serialize %@", v1);
  CFRelease(v1);
}

xpc_object_t RXObject::CreateXPCDesc(RXObject *this, int64_t a2, uint64_t **a3)
{
  RXRecognitionSystem::LiveObject(a3, this);
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v5, kRDKeyObjectType, a2);
  xpc_dictionary_set_uint64(v5, kRDKeyObjectID, (uint64_t)this);
  return v5;
}

uint64_t RXGetSupportedQuasarLocaleIdentifiers()
{
  if (RXGetSupportedQuasarLocaleIdentifiers::onceToken != -1) {
    dispatch_once(&RXGetSupportedQuasarLocaleIdentifiers::onceToken, &__block_literal_global_0);
  }
  return RXGetSupportedQuasarLocaleIdentifiers::supportedQuasarLocaleIdentifiers;
}

void __RXGetSupportedQuasarLocaleIdentifiers_block_invoke()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.SpeechRecognitionCore");
  if (BundleWithIdentifier)
  {
    CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFArrayRef ValueForInfoDictionaryKey = (const __CFArray *)CFBundleGetValueForInfoDictionaryKey(BundleWithIdentifier, @"SupportedQuasarLocaleIdentifiers");
    RXGetSupportedQuasarLocaleIdentifiers::supportedQuasarLocaleIdentifiers = (uint64_t)CFArrayCreateMutableCopy(v1, 0, ValueForInfoDictionaryKey);
    if (!RXGetSupportedQuasarLocaleIdentifiers::supportedQuasarLocaleIdentifiers) {
      __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 198, (uint64_t)"supportedQuasarLocaleIdentifiers", @"Framework Info Dictionary is corrupted");
    }
    CFURLRef v3 = CFURLCreateWithFileSystemPath(v1, @"/System/Library/FeatureFlags/Domain/VoiceControlLocales.plist", kCFURLPOSIXPathStyle, 0);
    if (v3)
    {
      CFURLRef v4 = v3;
      xpc_object_t v5 = CFReadStreamCreateWithFile(v1, v3);
      if (v5)
      {
        uint64_t v6 = v5;
        if (CFReadStreamOpen(v5))
        {
          CFPropertyListRef v7 = CFPropertyListCreateWithStream(v1, v6, 0, 0, 0, 0);
          CFTypeID v8 = CFGetTypeID(v7);
          if (v8 == CFDictionaryGetTypeID())
          {
            CFDictionaryGetCount((CFDictionaryRef)v7);
            operator new[]();
          }
          if (v7) {
            CFRelease(v7);
          }
          CFReadStreamClose(v6);
        }
        CFRelease(v6);
      }
      CFRelease(v4);
    }
  }
}

uint64_t RXGetSupportedNashvilleLocaleIdentifiers()
{
  if (RXGetSupportedNashvilleLocaleIdentifiers::onceToken != -1) {
    dispatch_once(&RXGetSupportedNashvilleLocaleIdentifiers::onceToken, &__block_literal_global_58);
  }
  return RXGetSupportedNashvilleLocaleIdentifiers::supportedNashvilleLocaleIdentifiers;
}

void __RXGetSupportedNashvilleLocaleIdentifiers_block_invoke()
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.SpeechRecognitionCore");
  if (BundleWithIdentifier)
  {
    CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFArrayRef ValueForInfoDictionaryKey = (const __CFArray *)CFBundleGetValueForInfoDictionaryKey(BundleWithIdentifier, @"SupportedNashvilleLocaleIdentifiers");
    CFArrayRef MutableCopy = CFArrayCreateMutableCopy(v1, 0, ValueForInfoDictionaryKey);
    RXGetSupportedNashvilleLocaleIdentifiers::supportedNashvilleLocaleIdentifiers = (uint64_t)MutableCopy;
    if (!MutableCopy)
    {
      __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 247, (uint64_t)"supportedNashvilleLocaleIdentifiers", @"Framework Info Dictionary is corrupted");
      CFArrayRef MutableCopy = (const __CFArray *)RXGetSupportedNashvilleLocaleIdentifiers::supportedNashvilleLocaleIdentifiers;
    }
    CFIndex Count = CFArrayGetCount(MutableCopy);
    if (Count >= 1)
    {
      unint64_t v5 = Count + 1;
      do
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)RXGetSupportedNashvilleLocaleIdentifiers::supportedNashvilleLocaleIdentifiers, v5 - 2);
        if (CFStringCompare(ValueAtIndex, @"ar", 1uLL)) {
          CFStringRef v7 = ValueAtIndex;
        }
        else {
          CFStringRef v7 = @"ar_SA";
        }
        *(_OWORD *)buffer = 0u;
        long long v12 = 0u;
        if (CFStringGetCString(v7, buffer, 32, 0x8000100u) && _os_feature_enabled_impl())
        {
          CFTypeID v8 = RXOSLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            uint32_t v10 = buffer;
            _os_log_impl(&dword_22BF8A000, v8, OS_LOG_TYPE_DEBUG, "Disabling Nashville locale support for Feature Flag %s", buf, 0xCu);
          }
          CFArrayRemoveValueAtIndex((CFMutableArrayRef)RXGetSupportedNashvilleLocaleIdentifiers::supportedNashvilleLocaleIdentifiers, v5 - 2);
        }
        --v5;
      }
      while (v5 > 1);
    }
  }
}

uint64_t RXObjectCopyProperty(RXXPC *a1, int a2)
{
  uint64_t v9 = 0;
  uint32_t v10 = &v9;
  uint64_t v11 = 0x2000000000;
  uint64_t v12 = 0;
  CFURLRef v4 = RXXPC::Queue(a1);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __RXObjectCopyProperty_block_invoke;
  block[3] = &unk_2649047F0;
  block[4] = &v9;
  block[5] = a1;
  int v8 = a2;
  dispatch_sync(v4, block);
  uint64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

void sub_22BF8C51C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__RXObjectCopyProperty_block_invoke(uint64_t a1)
{
  char v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFTypeID v3 = CFGetTypeID(v2);
    CFTypeID TypeID = CFStringGetTypeID();
    CFStringRef v5 = *(const __CFString **)(a1 + 40);
    if (v3 == TypeID)
    {
      int v6 = *(_DWORD *)(a1 + 48);
LABEL_7:
      os_log_t result = (void *)RXCopyLocaleProperty(v5, v6);
      goto LABEL_12;
    }
    CFTypeID v8 = CFGetTypeID(v5);
    CFTypeID v9 = CFLocaleGetTypeID();
    uint64_t v10 = *(void *)(a1 + 40);
    if (v8 == v9)
    {
      int v11 = *(_DWORD *)(a1 + 48);
      CFStringRef v5 = (const __CFString *)MEMORY[0x230F59AB0](v10);
      int v6 = v11;
      goto LABEL_7;
    }
    if (v10) {
      uint64_t v12 = v10 + 16;
    }
    else {
      uint64_t v12 = 0;
    }
    os_log_t result = (void *)(*(uint64_t (**)(uint64_t, void))(*(void *)v12 + 64))(v12, *(unsigned int *)(a1 + 48));
  }
  else
  {
    os_log_t result = RXCopyGlobalProperty((RXXPC *)*(unsigned int *)(a1 + 48));
  }
LABEL_12:
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

CFArrayRef RXCopyGlobalProperty(RXXPC *a1)
{
  if ((int)a1 > 1885957746)
  {
    switch(a1)
    {
      case 0x70696E73:
        int valuePtr = RXXPC::PurgeInstalledAssets(a1);
        return CFNumberCreate(0, kCFNumberIntType, &valuePtr);
      case 0x736E7067:
        byte_268495FA4 = 0;
        __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 333, 0, @"Global property %s is write only", &RXPropertyKeyName::sTmpProp);
        break;
      case 0x73746C69:
        byte_268495FA4 = 0;
        __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 318, 0, @"Global property %s is write only", &RXPropertyKeyName::sTmpProp);
        break;
      default:
LABEL_29:
        int v11 = RXPropertyKeyName((int)a1);
        __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 337, 0, @"Global property %s not defined", v11);
        return 0;
    }
    return 0;
  }
  if (a1 == 1668049262)
  {
    byte_268495FA4 = 0;
    __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 322, 0, @"Global property %s is write only", &RXPropertyKeyName::sTmpProp);
    return 0;
  }
  if (a1 != 1818324583)
  {
    if (a1 == 1819505779)
    {
      return (CFArrayRef)RXXPC::CopyLanguageInstallationStatus(a1);
    }
    goto LABEL_29;
  }
  char v2 = RDCopyNashvilleModelLanguages();
  if (v2)
  {
    CFTypeID v3 = v2;
    CFDictionaryRef v4 = (const __CFDictionary *)RXXPC::CopyLanguageInstallationStatus(v2);
    if (v4)
    {
      CFDictionaryRef v5 = v4;
      CFIndex Count = CFDictionaryGetCount(v4);
      CFStringRef v7 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
      uint64_t v13 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
      v14 = v7;
      CFDictionaryGetKeysAndValues(v5, v7, v13);
      if (RXGetSupportedQuasarLocaleIdentifiers::onceToken != -1) {
        dispatch_once(&RXGetSupportedQuasarLocaleIdentifiers::onceToken, &__block_literal_global_0);
      }
      if (Count >= 1)
      {
        CFArrayRef v8 = (const __CFArray *)RXGetSupportedQuasarLocaleIdentifiers::supportedQuasarLocaleIdentifiers;
        CFTypeID v9 = (CFStringRef *)v13;
        do
        {
          if (CFStringHasPrefix(*v9, @"Version:"))
          {
            CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, (CFStringRef)*v7);
            v18.length = CFStringGetLength(MutableCopy);
            v18.location = 0;
            CFStringFindAndReplace(MutableCopy, @"-", @"_", v18, 0);
            if (v8)
            {
              v17.length = CFArrayGetCount(v8);
              v17.location = 0;
              if (CFArrayContainsValue(v8, v17, MutableCopy)) {
                CFSetAddValue(v3, MutableCopy);
              }
            }
            CFRelease(MutableCopy);
          }
          ++v7;
          ++v9;
          --Count;
        }
        while (Count);
      }
      CFRelease(v5);
      free(v14);
      free(v13);
    }
    CFSetGetCount(v3);
    operator new[]();
  }
  uint64_t v12 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
  return CFArrayCreate(0, 0, 0, v12);
}

const void *RXCopyLocaleProperty(const __CFString *a1, int a2)
{
  if (a2 == 1667326824)
  {
    return RDCopyCacheVersion(a1);
  }
  else
  {
    CFDictionaryRef v4 = RXPropertyKeyName(a2);
    __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 350, 0, @"Per-locale property %s not defined", v4);
    return 0;
  }
}

uint64_t RXObjectCopyPropertyWithLocale(RXXPC *a1, int a2, uint64_t a3)
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000;
  uint64_t v14 = 0;
  int v6 = RXXPC::Queue(a1);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 0x40000000;
  v9[2] = __RXObjectCopyPropertyWithLocale_block_invoke;
  v9[3] = &unk_264904818;
  v9[4] = &v11;
  v9[5] = a1;
  int v10 = a2;
  v9[6] = a3;
  dispatch_sync(v6, v9);
  uint64_t v7 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v7;
}

void sub_22BF8CB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFArrayRef __RXObjectCopyPropertyWithLocale_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFTypeID v3 = CFGetTypeID(v2);
    uint64_t TypeID = RXLanguageObjectGetTypeID();
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      uint64_t v6 = v5 + 16;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(unsigned int *)(a1 + 56);
    if (v3 == TypeID) {
      CFArrayRef result = (CFArrayRef)(*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)v6 + 72))(v6, v7, *(void *)(a1 + 48));
    }
    else {
      CFArrayRef result = (CFArrayRef)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v6 + 64))(v6, v7);
    }
  }
  else
  {
    CFArrayRef result = RXCopyGlobalProperty((RXXPC *)*(unsigned int *)(a1 + 56));
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void RXObjectSetProperty(RXXPC *a1, int a2, uint64_t a3)
{
  uint64_t v6 = RXXPC::Queue(a1);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __RXObjectSetProperty_block_invoke;
  block[3] = &__block_descriptor_tmp_71;
  int v8 = a2;
  block[4] = a1;
  block[5] = a3;
  dispatch_sync(v6, block);
}

void __RXObjectSetProperty_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 32);
  if (!v2)
  {
    int v8 = *(_DWORD *)(a1 + 48);
    CFTypeID v9 = *(__CFString **)(a1 + 40);
    if (v8 <= 1819505778)
    {
      switch(v8)
      {
        case 1667326824:
          if (!v9 || (__CFString *)*MEMORY[0x263EFFB38] == v9)
          {
            RDNukeCache(0);
          }
          return;
        case 1668049262:
          if (v9 && (CFTypeID v19 = CFGetTypeID(v9), v19 == CFStringGetTypeID()))
          {
            RXXPC::CancelInstallationForLanguage(v9, v20);
          }
          else
          {
            byte_268495FA4 = 0;
            __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 420, 0, @"Global property %s wasn't passed CFString argument.", &RXPropertyKeyName::sTmpProp);
          }
          return;
        case 1818324583:
          goto LABEL_17;
      }
    }
    else
    {
      if (v8 <= 1936617574)
      {
        if (v8 != 1819505779)
        {
          if (v8 == 1885957747)
          {
            byte_268495FA4 = 0;
            __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 425, 0, @"Global property %s is read only", &RXPropertyKeyName::sTmpProp);
            return;
          }
          goto LABEL_44;
        }
LABEL_17:
        uint64_t v14 = RXPropertyKeyName(v8);
        __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 404, 0, @"Global property %s is read only", v14);
        return;
      }
      if (v8 == 1936617575)
      {
        if (v9 && (CFTypeID v21 = CFGetTypeID(v9), v21 == CFArrayGetTypeID()))
        {
          RXXPC::SetNonPurgeabilityForLanguages((RXXPC *)v9, v22);
        }
        else
        {
          byte_268495FA4 = 0;
          __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 433, 0, @"Global property %s wasn't passed CFString argument.", &RXPropertyKeyName::sTmpProp);
        }
        return;
      }
      if (v8 == 1937009769)
      {
        if (v9 && (CFTypeID v17 = CFGetTypeID(v9), v17 == CFStringGetTypeID()))
        {
          RXXPC::StartInstallationForLanguage(v9, v18);
        }
        else
        {
          byte_268495FA4 = 0;
          __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 411, 0, @"Global property %s wasn't passed CFString argument.", &RXPropertyKeyName::sTmpProp);
        }
        return;
      }
    }
LABEL_44:
    v23 = RXPropertyKeyName(v8);
    __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 442, 0, @"Global property %s not defined", v23);
    return;
  }
  CFTypeID v3 = CFGetTypeID(v2);
  CFTypeID TypeID = CFStringGetTypeID();
  CFStringRef v5 = *(const __CFString **)(a1 + 32);
  if (v3 == TypeID)
  {
    int v6 = *(_DWORD *)(a1 + 48);
    uint64_t v7 = *(const void **)(a1 + 40);
LABEL_11:
    RXSetLocaleProperty(v5, v6, v7);
    return;
  }
  CFTypeID v10 = CFGetTypeID(v5);
  if (v10 == CFLocaleGetTypeID())
  {
    int v11 = *(_DWORD *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(const void **)(a1 + 40);
    CFStringRef v5 = (const __CFString *)MEMORY[0x230F59AB0](v12);
    int v6 = v11;
    uint64_t v7 = v13;
    goto LABEL_11;
  }
  uint64_t v15 = *(void *)(a1 + 32);
  if (v15) {
    v16 = (RXRecognitionSystem **)(v15 + 16);
  }
  else {
    v16 = 0;
  }
  RXRecognitionSystem::StartChanges(v16[2]);
  (*((void (**)(RXRecognitionSystem **, void, void))*v16 + 10))(v16, *(unsigned int *)(a1 + 48), *(void *)(a1 + 40));
  RXRecognitionSystem::CommitChanges(v16[2]);
}

void sub_22BF8CFF4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  RXTransaction<RXObject>::~RXTransaction((uint64_t)va);
  _Unwind_Resume(a1);
}

void RXSetLocaleProperty(const __CFString *a1, int a2, const void *a3)
{
  if (a2 == 1667326824)
  {
    if (!a3 || (const void *)*MEMORY[0x263EFFB38] == a3)
    {
      RDNukeCache(a1);
    }
  }
  else
  {
    CFTypeID v3 = RXPropertyKeyName(a2);
    __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 456, 0, @"Per-locale property %s not defined", v3);
  }
}

unint64_t RXEngineTypeForLocaleIdentifier(CFStringRef localeIdentifier)
{
  if (!localeIdentifier) {
    return 0;
  }
  CFStringRef CanonicalLocaleIdentifierFromString = CFLocaleCreateCanonicalLocaleIdentifierFromString(0, localeIdentifier);
  if (!CanonicalLocaleIdentifierFromString) {
    return 0;
  }
  CFStringRef v2 = CanonicalLocaleIdentifierFromString;
  CFStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, CanonicalLocaleIdentifierFromString);
  if (MutableCopy)
  {
    CFDictionaryRef v4 = (__CFString *)MutableCopy;
    v8.length = CFStringGetLength(MutableCopy);
    v8.location = 0;
    CFStringFindAndReplace(v4, @"-", @"_", v8, 0);
    if (RXGetSupportedQuasarLocaleIdentifiers::onceToken != -1) {
      dispatch_once(&RXGetSupportedQuasarLocaleIdentifiers::onceToken, &__block_literal_global_0);
    }
    unint64_t v5 = RXGetSupportedQuasarLocaleIdentifiers::supportedQuasarLocaleIdentifiers;
    if (RXGetSupportedQuasarLocaleIdentifiers::supportedQuasarLocaleIdentifiers)
    {
      v7.length = CFArrayGetCount((CFArrayRef)RXGetSupportedQuasarLocaleIdentifiers::supportedQuasarLocaleIdentifiers);
      v7.location = 0;
      unint64_t v5 = CFArrayContainsValue((CFArrayRef)v5, v7, v4) != 0;
    }
    CFRelease(v4);
  }
  else
  {
    unint64_t v5 = 0;
  }
  CFRelease(v2);
  return v5;
}

BOOL RXIsLocaleWithNoSpaceInPostITN(CFStringRef theString)
{
  v7[5] = *(const void **)MEMORY[0x263EF8340];
  v7[0] = @"zh_CN";
  v7[1] = @"zh_HK";
  v7[2] = @"zh_TW";
  v7[3] = @"ja_JP";
  v7[4] = @"yue_CN";
  CFStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  if (!MutableCopy) {
    return 0;
  }
  CFStringRef v2 = (__CFString *)MutableCopy;
  v9.length = CFStringGetLength(MutableCopy);
  v9.location = 0;
  CFStringFindAndReplace(v2, @"-", @"_", v9, 0);
  CFArrayRef v3 = CFArrayCreate(0, v7, 5, MEMORY[0x263EFFF70]);
  if (v3)
  {
    CFArrayRef v4 = v3;
    v8.length = CFArrayGetCount(v3);
    v8.location = 0;
    BOOL v5 = CFArrayContainsValue(v4, v8, v2) != 0;
    CFRelease(v4);
  }
  else
  {
    BOOL v5 = 0;
  }
  CFRelease(v2);
  return v5;
}

BOOL RXIsLocaleWithSpecialHyphenHandling(CFStringRef theString)
{
  values = @"de_DE";
  CFStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  if (!MutableCopy) {
    return 0;
  }
  CFStringRef v2 = (__CFString *)MutableCopy;
  v9.length = CFStringGetLength(MutableCopy);
  v9.location = 0;
  CFStringFindAndReplace(v2, @"-", @"_", v9, 0);
  CFArrayRef v3 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x263EFFF70]);
  if (v3)
  {
    CFArrayRef v4 = v3;
    v8.length = CFArrayGetCount(v3);
    v8.location = 0;
    BOOL v5 = CFArrayContainsValue(v4, v8, v2) != 0;
    CFRelease(v4);
  }
  else
  {
    BOOL v5 = 0;
  }
  CFRelease(v2);
  return v5;
}

BOOL RXIsLocaleSupportingOndeviceSpeechDetection(CFStringRef theString)
{
  values[2] = *(void **)MEMORY[0x263EF8340];
  values[0] = @"en_US";
  values[1] = @"en_CA";
  CFStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  if (!MutableCopy) {
    return 0;
  }
  CFStringRef v2 = (__CFString *)MutableCopy;
  v9.length = CFStringGetLength(MutableCopy);
  v9.location = 0;
  CFStringFindAndReplace(v2, @"-", @"_", v9, 0);
  CFArrayRef v3 = CFArrayCreate(0, (const void **)values, 2, MEMORY[0x263EFFF70]);
  if (v3)
  {
    CFArrayRef v4 = v3;
    v8.length = CFArrayGetCount(v3);
    v8.location = 0;
    BOOL v5 = CFArrayContainsValue(v4, v8, v2) != 0;
    CFRelease(v4);
  }
  else
  {
    BOOL v5 = 0;
  }
  CFRelease(v2);
  return v5;
}

uint64_t RXIsVoiceActionsVisionKWSEnabled()
{
  return _os_feature_enabled_impl();
}

uint64_t RXIsSpeechSPIEnabled()
{
  return _os_feature_enabled_impl();
}

uint64_t RXIsKeywordSpotterEnabled()
{
  return _os_feature_enabled_impl();
}

uint64_t RXIsSpeechDetectorEnabled()
{
  if (_os_feature_enabled_impl()) {
    return 0;
  }
  return _os_feature_enabled_impl();
}

uint64_t RXIsUseIndependentVADEnabled()
{
  return _os_feature_enabled_impl();
}

uint64_t RXIsAudioDonationSupported()
{
  return _os_feature_enabled_impl();
}

BOOL RXIsAudioDonationOptedIn()
{
  return _AXSAudioDonationSiriImprovementEnabled() != 0;
}

BOOL RXIsLocaleSupportingKeywordSpotter(CFStringRef theString)
{
  values[2] = *(void **)MEMORY[0x263EF8340];
  values[0] = @"en_US";
  values[1] = @"en_CA";
  CFStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  if (!MutableCopy) {
    return 0;
  }
  CFStringRef v2 = (__CFString *)MutableCopy;
  v9.length = CFStringGetLength(MutableCopy);
  v9.location = 0;
  CFStringFindAndReplace(v2, @"-", @"_", v9, 0);
  CFArrayRef v3 = CFArrayCreate(0, (const void **)values, 2, MEMORY[0x263EFFF70]);
  if (v3)
  {
    CFArrayRef v4 = v3;
    v8.length = CFArrayGetCount(v3);
    v8.location = 0;
    BOOL v5 = CFArrayContainsValue(v4, v8, v2) != 0;
    CFRelease(v4);
  }
  else
  {
    BOOL v5 = 0;
  }
  CFRelease(v2);
  return v5;
}

__CFDictionary *RXGetAssetFallbackLocales()
{
  int v0 = RXGetAllLocalesProperties();
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (v0)
  {
    CFIndex Count = CFDictionaryGetCount(v0);
    if (Count >= 1)
    {
      CFIndex v3 = Count;
      CFArrayRef v4 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
      CFDictionaryGetKeysAndValues(v0, v4, 0);
      for (uint64_t i = 0; i != v3; ++i)
      {
        CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v0, v4[i]);
        if (Value)
        {
          CFRange v7 = CFDictionaryGetValue(Value, @"AssetFallbackLocaleIdentifier");
          if (v7) {
            CFDictionaryAddValue(Mutable, v4[i], v7);
          }
        }
      }
      free(v4);
    }
  }
  return Mutable;
}

__CFBundle *RXGetAllLocalesProperties(void)
{
  CFArrayRef result = CFBundleGetBundleWithIdentifier(@"com.apple.SpeechRecognitionCore");
  if (result)
  {
    return (__CFBundle *)CFBundleGetValueForInfoDictionaryKey(result, @"LocaleProperties");
  }
  return result;
}

__CFDictionary *RXGetAssetFallbackLocaleIdentifier(const void *a1)
{
  CFArrayRef result = RXGetAssetFallbackLocales();
  if (result)
  {
    return (__CFDictionary *)CFDictionaryGetValue(result, a1);
  }
  return result;
}

__CFArray *RXLocalesSupportingSpellingMode()
{
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  CFAllocatorRef v1 = RXGetAllLocalesProperties();
  if (v1)
  {
    CFDictionaryRef v2 = v1;
    CFIndex Count = CFDictionaryGetCount(v1);
    if (Count >= 1)
    {
      CFIndex v4 = Count;
      BOOL v5 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
      CFDictionaryGetKeysAndValues(v2, v5, 0);
      for (uint64_t i = 0; i != v4; ++i)
      {
        CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v2, v5[i]);
        if (Value)
        {
          CFBooleanRef v8 = (const __CFBoolean *)CFDictionaryGetValue(Value, @"SupportsSpellingMode");
          if (v8)
          {
            if (CFBooleanGetValue(v8)) {
              CFArrayAppendValue(Mutable, v5[i]);
            }
          }
        }
      }
      free(v5);
    }
  }
  return Mutable;
}

const void *RXLocalizedStringForSpacebar(const void *a1)
{
  CFDictionaryRef v2 = RXGetAllLocalesProperties();
  if (!v2) {
    return 0;
  }
  CFDictionaryRef v3 = v2;
  CFIndex Count = CFDictionaryGetCount(v2);
  if (Count < 1)
  {
    CFRange v7 = 0;
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
    CFDictionaryGetKeysAndValues(v3, v5, 0);
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v3, a1);
    if (Value) {
      CFRange v7 = CFDictionaryGetValue(Value, @"LocalizedSpacebar");
    }
    else {
      CFRange v7 = 0;
    }
  }
  free(v5);
  return v7;
}

const void **RXCFProp<void const*>::~RXCFProp(const void **a1)
{
  CFDictionaryRef v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

uint64_t RXTransaction<RXObject>::~RXTransaction(uint64_t a1)
{
  return a1;
}

void RXCFInit_RXRecognitionSystem(char *a1)
{
}

uint64_t RXCFRegister_RXRecognitionSystem(void)
{
  return _CFRuntimeRegisterClass();
}

uint64_t RecognizerStillExists(uint64_t a1)
{
  uint64_t v1 = *(void *)(sSystems + 8) - *(void *)sSystems;
  if (!v1) {
    return 0;
  }
  uint64_t v2 = 0;
  unsigned int v3 = 0;
  unint64_t v4 = v1 >> 3;
  while (1)
  {
    uint64_t v5 = *(void *)(*(void *)sSystems + 8 * v2);
    if (v5)
    {
      int v6 = (void *)(v5 + 104);
      do
      {
        uint64_t v7 = *v6;
        int v6 = (void *)(*v6 + 88);
      }
      while (v7 != a1 && v7 != 0);
      if (v7) {
        break;
      }
    }
    uint64_t v2 = ++v3;
    if (v4 <= v3) {
      return 0;
    }
  }
  return 1;
}

BOOL RXRecognitionSystem::DoesOwnRecognizer(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)(a1 + 104);
  do
  {
    uint64_t v3 = *v2;
    uint64_t v2 = (void *)(*v2 + 88);
  }
  while (v3 != a2 && v3 != 0);
  return v3 != 0;
}

void RXRecognitionSystem::StartChanges(RXRecognitionSystem *this)
{
  if (this)
  {
    unint64_t v1 = (unint64_t)this;
    unsigned int v2 = 0;
    uint64_t v3 = (void *)sSystems;
    do
    {
      unsigned int v4 = v2;
      if (v2 >= (unint64_t)((uint64_t)(v3[1] - *v3) >> 3)) {
        break;
      }
      if ((v1 & (1 << v2)) != 0)
      {
        RXRecognitionSystem::StartChanges(*(RXRecognitionSystem **)(*v3 + 8 * v2));
        v1 &= ~(1 << v4);
        uint64_t v3 = (void *)sSystems;
      }
      unsigned int v2 = v4 + 1;
    }
    while (v1);
  }
}

{
  uint64_t vars8;

  if (!*((_DWORD *)this + 11)) {
    RXXPC::StartChanges(*((void *)this + 11));
  }
  if (++*((_DWORD *)this + 11) >= 0x100u)
  {
    __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXRecognitionSystem.cpp", 476, (uint64_t)"fChangeNesting < 0x100", @"Out of control change nesting");
  }
}

void RXRecognitionSystem::CommitChanges(RXRecognitionSystem *this)
{
  if (this)
  {
    unint64_t v1 = (unint64_t)this;
    unsigned int v2 = 0;
    uint64_t v3 = (void *)sSystems;
    do
    {
      unsigned int v4 = v2;
      if (v2 >= (unint64_t)((uint64_t)(v3[1] - *v3) >> 3)) {
        break;
      }
      if ((v1 & (1 << v2)) != 0)
      {
        RXRecognitionSystem::CommitChanges(*(RXRecognitionSystem **)(*v3 + 8 * v2));
        v1 &= ~(1 << v4);
        uint64_t v3 = (void *)sSystems;
      }
      unsigned int v2 = v4 + 1;
    }
    while (v1);
  }
}

{
  xpc_object_t v2;
  xpc_object_t v3;
  uint64_t v4;
  CFURLRef v5;
  CFStringRef v6;
  void *v7;
  CFDataRef v8;
  const char *v9;
  const UInt8 *BytePtr;
  size_t Length;
  CFStringRef v12;
  char *v13;
  void *v14;
  uint64_t v15;
  xpc_object_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  char *v22;
  unint64_t v23;
  BOOL v24;
  void *v25;
  void *__p;
  unsigned char *v27;
  uint64_t v28;
  void **p_p;
  char *v30;
  char *v31;
  void *v32;
  uint64_t v33;

  if (!*((_DWORD *)this + 11)) {
    __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXRecognitionSystem.cpp", 482, (uint64_t)"fChangeNesting > 0", @"Unbalanced change nesting");
  }
  if (!--*((_DWORD *)this + 11))
  {
    unsigned int v2 = xpc_array_create(0, 0);
    if (*((void *)this + 3))
    {
      uint64_t v3 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v3, kRDKeyObjectType, 0);
      xpc_dictionary_set_uint64(v3, kRDKeyObjectID, (uint64_t)this);
      if (*((unsigned char *)this + 11)) {
        xpc_dictionary_set_BOOL(v3, kRDKeyIsListening, *((unsigned char *)this + 81));
      }
      if (*((void *)this + 32)) {
        unsigned int v4 = (*((void *)this + 31) != 0) | 2;
      }
      else {
        unsigned int v4 = *((void *)this + 31) != 0;
      }
      xpc_dictionary_set_uint64(v3, kRDKeyCallbacks, v4);
      if (*((unsigned char *)this + 80)) {
        xpc_dictionary_set_BOOL(v3, kRDKeyFilterProfanity, 1);
      }
      if (*((unsigned char *)this + 82))
      {
        *((unsigned char *)this + 82) = 0;
        uint64_t v7 = (void *)*((void *)this + 7);
        if (v7)
        {
          RXXPC::SerializeURL((RXXPC *)v3, v7, v5);
        }
        else
        {
          CFBooleanRef v8 = (const __CFData *)*((void *)this + 8);
          if (v8)
          {
            CFRange v9 = kRDKeyAudioData;
            BytePtr = CFDataGetBytePtr(v8);
            size_t Length = CFDataGetLength(*((CFDataRef *)this + 8));
            xpc_dictionary_set_data(v3, v9, BytePtr, Length);
          }
          else
          {
            uint64_t v12 = (const __CFString *)*((void *)this + 9);
            if (v12) {
              RXXPC::SerializeCFString((RXXPC *)v3, kRDKeyTextToBeRecognized, v12, v6);
            }
          }
        }
      }
      xpc_array_append_value(v2, v3);
      xpc_release(v3);
      *((void *)this + 3) = 0;
    }
    std::__tree<RXObject *>::destroy((uint64_t)this + 224, *((void **)this + 29));
    *((void *)this + 28) = (char *)this + 232;
    *((void *)this + 29) = 0;
    *((void *)this + 30) = 0;
    uint64_t v13 = (char *)this + 232;
    uint64_t v14 = (void *)*((void *)this + 13);
    if (v14)
    {
      do
      {
        (*(void (**)(void *, xpc_object_t, RXRecognitionSystem *))(*v14 + 96))(v14, v2, this);
        uint64_t v14 = (void *)v14[11];
      }
      while (v14);
      uint64_t v13 = (char *)*((void *)this + 28);
    }
    __p = 0;
    v27 = 0;
    v28 = 0;
    uint64_t v15 = *((void *)this + 14);
    v32 = (void *)((char *)this + 120);
    v33 = v15;
    v30 = (char *)this + 232;
    v31 = v13;
    p_p = &__p;
    std::__set_difference[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void>,std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long> &,std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long> &,std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long> &,std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long> &,std::back_insert_iterator<std::vector<RXObject *>> &>((uint64_t)&v33, &v32, (uint64_t)&v31, &v30, &p_p);
    std::__tree<RXObject *>::swap((uint64_t *)this + 14, (uint64_t)this + 224);
    std::__tree<RXObject *>::destroy((uint64_t)this + 224, *((void **)this + 29));
    *((void *)this + 29) = 0;
    *((void *)this + 30) = 0;
    *((void *)this + 28) = (char *)this + 232;
    if (v27 == __p)
    {
      v16 = 0;
    }
    else
    {
      v16 = xpc_array_create(0, 0);
      CFTypeID v17 = (v27 - (unsigned char *)__p) >> 3;
      CFStringRef v18 = (char *)this + 144;
      CFTypeID v19 = ~(1 << *((_DWORD *)this + 10));
      while (v17)
      {
        --v17;
        xpc_array_set_uint64(v16, 0xFFFFFFFFFFFFFFFFLL, *((void *)__p + v17));
        pthread_mutex_lock((pthread_mutex_t *)((char *)this + 160));
        CFStringRef v20 = *(void **)v18;
        CFTypeID v21 = *((void *)__p + v17);
        if (!*(void *)v18) {
          goto LABEL_37;
        }
        CFArrayRef v22 = (char *)this + 144;
        do
        {
          v23 = v20[4];
          v24 = v23 >= v21;
          if (v23 >= v21) {
            v25 = v20;
          }
          else {
            v25 = v20 + 1;
          }
          if (v24) {
            CFArrayRef v22 = (char *)v20;
          }
          CFStringRef v20 = (void *)*v25;
        }
        while (*v25);
        if (v22 == v18 || v21 < *((void *)v22 + 4)) {
LABEL_37:
        }
          *(void *)(v21 + 16) &= v19;
        pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 160));
      }
    }
    pthread_mutex_lock((pthread_mutex_t *)((char *)this + 160));
    std::__tree<RXObject *>::destroy((uint64_t)this + 136, *((void **)this + 18));
    *((void *)this + 17) = (char *)this + 144;
    *((void *)this + 18) = 0;
    *((void *)this + 19) = 0;
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 160));
    RXXPC::CommitChanges(*((RXXPC **)this + 11), v2, v16);
    xpc_release(v2);
    if (v16) {
      xpc_release(v16);
    }
    if (__p)
    {
      v27 = __p;
      operator delete(__p);
    }
  }
}

void sub_22BF8E004(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t RXRecognitionSystem::DeadObject(uint64_t this, RXObject *a2, RXObject *a3)
{
  if (this)
  {
    uint64_t v4 = this;
    unsigned int v5 = 0;
    int v6 = (void *)sSystems;
    do
    {
      unsigned int v7 = v5;
      if (v5 >= (unint64_t)((uint64_t)(v6[1] - *v6) >> 3)) {
        break;
      }
      if ((v4 & (1 << v5)) != 0)
      {
        this = RXRecognitionSystem::DeadObject(*(uint64_t ***)(*v6 + 8 * v5), a2);
        v4 &= ~(1 << v7);
        int v6 = (void *)sSystems;
      }
      unsigned int v5 = v7 + 1;
    }
    while (v4);
  }
  return this;
}

uint64_t RXRecognitionSystem::DeadObject(uint64_t **this, RXObject *a2)
{
  unsigned int v5 = a2;
  uint64_t v3 = (pthread_mutex_t *)(this + 20);
  pthread_mutex_lock((pthread_mutex_t *)(this + 20));
  std::__tree<RXObject *>::__emplace_unique_key_args<RXObject *,RXObject * const&>(this + 17, (unint64_t *)&v5, (uint64_t *)&v5);
  return pthread_mutex_unlock(v3);
}

void *RXRecognitionSystem::Callback(RXRecognitionSystem *this, void *a2)
{
  CFArrayRef result = (void *)xpc_dictionary_get_uint64(this, kRDKeyObjectID);
  uint64_t v4 = *(void *)(sSystems + 8) - *(void *)sSystems;
  if (v4)
  {
    uint64_t v5 = 0;
    unint64_t v6 = v4 >> 3;
    unsigned int v7 = 1;
    while (1)
    {
      CFBooleanRef v8 = *(void **)(*(void *)sSystems + 8 * v5);
      if (v8 && result == v8) {
        break;
      }
      uint64_t v5 = v7;
      if (v6 <= v7++) {
        return result;
      }
    }
    uint64_t uint64 = xpc_dictionary_get_uint64(this, kRDKeyCallbacks);
    return RXRecognitionSystem::Callback(v8, uint64, this);
  }
  return result;
}

void *RXRecognitionSystem::Callback(void *this, uint64_t a2, xpc_object_t xdict)
{
  if (a2 == 2)
  {
    this = (void *)this[32];
    if (this)
    {
      unint64_t v6 = (uint64_t (*)(void))this[2];
      return (void *)v6();
    }
  }
  else if (a2 == 1)
  {
    uint64_t v3 = this[31];
    if (v3)
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(xdict, kRDKeyUtteranceID);
      uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);
      return (void *)v5(v3, uint64);
    }
  }
  return this;
}

CFDataRef RXRecognitionSystem::CopyProperty(RXRecognitionSystem *this, int a2)
{
  if (a2 <= 1936946545)
  {
    if (a2 <= 1936487277)
    {
      if (a2 != 1935766884)
      {
        if (a2 == 1935766886)
        {
          return CFDataCreate(0, RXRecognitionSystem::CopyProperty::sClientFormat, 40);
        }
        goto LABEL_32;
      }
      CFDataRef result = *(CFDataRef *)(*((void *)this + 11) + 24);
      goto LABEL_29;
    }
    if (a2 == 1936487278)
    {
      if (*((unsigned char *)this + 81)) {
        unint64_t v6 = (CFDataRef *)MEMORY[0x263EFFB40];
      }
      else {
        unint64_t v6 = (CFDataRef *)MEMORY[0x263EFFB38];
      }
      CFDataRef result = *v6;
LABEL_29:
      return (CFDataRef)CFRetain(result);
    }
    if (a2 == 1936941429)
    {
      CFDataRef result = (CFDataRef)*((void *)this + 8);
      if (!result) {
        return result;
      }
      goto LABEL_29;
    }
LABEL_32:
    return (CFDataRef)RXObject::CopyProperty(this, a2);
  }
  if (a2 <= 1937006910)
  {
    if (a2 == 1936946546)
    {
      CFDataRef result = (CFDataRef)*((void *)this + 7);
      if (!result) {
        return result;
      }
      goto LABEL_29;
    }
    if (a2 != 1937006881) {
      goto LABEL_32;
    }
    RXXPC::WaitForServer(*((RXXPC **)this + 11));
LABEL_21:
    int valuePtr = *(unsigned __int8 *)(*((void *)this + 11) + 1);
    return CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  }
  if (a2 == 1937006911) {
    goto LABEL_21;
  }
  if (a2 != 1937077355) {
    goto LABEL_32;
  }
  RXXPC::WaitForServer(*((RXXPC **)this + 11));
  uint64_t v4 = (RXXPC *)*((void *)this + 11);
  CFStringRef v5 = (const __CFString *)MEMORY[0x230F59AB0](*((void *)this + 6));
  return (CFDataRef)RXXPC::CopyInstalledAssetSupportedTasksForLanguage(v4, v5);
}

void RXRecognitionSystem::SetProperty(CFTypeRef *this, int a2, __CFString *cf)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a2 > 1936487277)
  {
    if (a2 > 1936946545)
    {
      if (a2 == 1937006911 || a2 == 1937006881)
      {
LABEL_20:
        RXObject::PropertyReadOnly((RXObject *)this, a2);
        goto LABEL_39;
      }
      if (a2 != 1936946546) {
        goto LABEL_38;
      }
      RXCFProp<void const*>::operator=(this + 7, cf);
    }
    else
    {
      if (a2 == 1936487278)
      {
        *((unsigned char *)this + 81) = CFBooleanGetValue((CFBooleanRef)cf) != 0;
        goto LABEL_39;
      }
      if (a2 == 1936749167)
      {
        *((unsigned char *)this + 80) = CFBooleanGetValue((CFBooleanRef)cf) != 0;
        goto LABEL_39;
      }
      if (a2 != 1936941429) {
        goto LABEL_38;
      }
      RXCFProp<void const*>::operator=(this + 8, cf);
    }
LABEL_32:
    *((unsigned char *)this + 82) = 1;
    goto LABEL_39;
  }
  if (a2 > 1935832435)
  {
    switch(a2)
    {
      case 1935832436:
        RXBlockProp<void({block_pointer})(unsigned long long)>::operator=(this + 31, cf);
        goto LABEL_39;
      case 1936027494:
        CFStringRef v5 = this + 32;
        goto LABEL_37;
      case 1936028274:
        CFStringRef v5 = this + 33;
LABEL_37:
        RXBlockProp<void({block_pointer})(unsigned long long)>::operator=(v5, cf);
        goto LABEL_39;
    }
LABEL_38:
    RXObject::SetProperty((RXObject *)this, a2, cf);
    goto LABEL_39;
  }
  if (a2 == 1919120244)
  {
    RXCFProp<void const*>::operator=(this + 9, cf);
    if (RXVeryVerbose())
    {
      Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
      if (CFStringGetLength(cf) >= 1)
      {
        CFIndex v7 = 0;
        do
        {
          v16.location = v7;
          v16.length = 1;
          CFStringRef v8 = CFStringCreateWithSubstring(0, cf, v16);
          CFArrayAppendValue(Mutable, v8);
          ++v7;
        }
        while (v7 < CFStringGetLength(cf));
      }
      CFRange v9 = RXOSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = cf;
        _os_log_impl(&dword_22BF8A000, v9, OS_LOG_TYPE_INFO, "input phrase=%@", buf, 0xCu);
      }
      if (CFArrayGetCount(Mutable) >= 1)
      {
        CFIndex v10 = 0;
        do
        {
          int v11 = RXOSLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            CFStringRef ValueAtIndex = (__CFString *)CFArrayGetValueAtIndex(Mutable, v10);
            *(_DWORD *)buf = 138412290;
            uint64_t v14 = ValueAtIndex;
            _os_log_impl(&dword_22BF8A000, v11, OS_LOG_TYPE_INFO, "input phrase tokens=%@", buf, 0xCu);
          }
          ++v10;
        }
        while (CFArrayGetCount(Mutable) > v10);
      }
    }
    goto LABEL_32;
  }
  if (a2 != 1935766884)
  {
    if (a2 != 1935766886) {
      goto LABEL_38;
    }
    goto LABEL_20;
  }
LABEL_39:
  this[3] = (CFTypeRef)-1;
}

void *RXBlockProp<void({block_pointer})(unsigned long long)>::operator=(const void **a1, void *aBlock)
{
  if (aBlock) {
    uint64_t v3 = _Block_copy(aBlock);
  }
  else {
    uint64_t v3 = 0;
  }
  if (*a1) {
    _Block_release(*a1);
  }
  *a1 = v3;
  return v3;
}

BOOL RXRecognitionSystem::Initialize(RXRecognitionSystem *this, const __CFLocale *a2, const __CFLocale *a3)
{
  unint64_t v6 = RXOSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22BF8A000, v6, OS_LOG_TYPE_DEFAULT, "RXRecognitionSystem Initialize", buf, 2u);
  }
  RXCFProp<void const*>::operator=((CFTypeRef *)this + 6, a2);
  *((void *)this + 1) = a3;
  *((unsigned char *)this + 81) = (a3 & 0x1000000) == 0;
  *((unsigned char *)this + 82) = 1;
  *((void *)this + 3) = -1;
  xpc_object_t Instance = RXXPC::CreateInstance(a2, a3);
  *((void *)this + 11) = Instance;
  if (Instance)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 0x40000000;
    aBlock[2] = ___ZN19RXRecognitionSystem10InitializeEPK10__CFLocalem_block_invoke;
    aBlock[3] = &__block_descriptor_tmp_1;
    aBlock[4] = this;
    CFStringRef v8 = _Block_copy(aBlock);
    *((void *)this + 12) = v8;
    RXXPC::AddHandler(*((void *)this + 11), v8);
  }
  return Instance != 0;
}

uint64_t ___ZN19RXRecognitionSystem10InitializeEPK10__CFLocalem_block_invoke(uint64_t result, int a2, uint64_t a3)
{
  if (sSystems)
  {
    uint64_t v3 = *(void *)(sSystems + 8) - *(void *)sSystems;
    if (v3)
    {
      uint64_t v4 = 0;
      uint64_t v5 = *(void *)(result + 32);
      unint64_t v6 = v3 >> 3;
      unsigned int v7 = 1;
      while (*(void *)(*(void *)(*(void *)sSystems + 8 * v4) + 88) != a3)
      {
        uint64_t v4 = v7;
        if (v6 <= v7++) {
          return result;
        }
      }
      if (a2 == 1)
      {
        *(void *)(v5 + 24) = -1;
        *(unsigned char *)(v5 + 82) = 1;
        CFRange v9 = *(void **)(v5 + 104);
        if (v9)
        {
          uint64_t v10 = *MEMORY[0x263EFFB38];
          do
          {
            (*(void (**)(void *, uint64_t, uint64_t))(*v9 + 80))(v9, 1919710062, v10);
            CFRange v9 = (void *)v9[11];
          }
          while (v9);
        }
        int v11 = *(void **)(v5 + 112);
        if (v11 != (void *)(v5 + 120))
        {
          do
          {
            (*(void (**)(void))(*(void *)v11[4] + 88))(v11[4]);
            uint64_t v12 = (void *)v11[1];
            if (v12)
            {
              do
              {
                uint64_t v13 = v12;
                uint64_t v12 = (void *)*v12;
              }
              while (v12);
            }
            else
            {
              do
              {
                uint64_t v13 = (void *)v11[2];
                BOOL v14 = *v13 == (void)v11;
                int v11 = v13;
              }
              while (!v14);
            }
            int v11 = v13;
          }
          while (v13 != (void *)(v5 + 120));
        }
        CFDataRef result = *(void *)(v5 + 264);
        if (result)
        {
          uint64_t v15 = *(uint64_t (**)(void))(result + 16);
          return v15();
        }
      }
    }
  }
  return result;
}

void RXRecognitionSystem::RXRecognitionSystem(RXRecognitionSystem *this)
{
  RXObject::RXObject(this);
  *(void *)uint64_t v2 = &unk_26DF657B0;
  *(_DWORD *)(v2 + 44) = 0;
  *(_OWORD *)(v2 + 48) = 0u;
  *(void *)(v2 + 120) = 0;
  *(void *)(v2 + 112) = v2 + 120;
  *(void *)(v2 + 104) = 0;
  *(void *)(v2 + 128) = 0;
  *(_OWORD *)(v2 + 64) = 0u;
  *(void *)(v2 + 144) = 0;
  *(void *)(v2 + 136) = v2 + 144;
  *(void *)(v2 + 232) = 0;
  *(void *)(v2 + 152) = 0;
  *(void *)(v2 + 224) = v2 + 232;
  *(void *)(v2 + 240) = 0;
  *(void *)(v2 + 248) = 0;
  *(void *)(v2 + 256) = 0;
  *(void *)(v2 + 264) = 0;
  uint64_t v3 = (void **)sSystems;
  if (!sSystems) {
    operator new();
  }
  uint64_t v4 = *(void **)sSystems;
  uint64_t v5 = *(void **)(sSystems + 8);
  unint64_t v6 = v5 - v4;
  if (v5 == v4)
  {
LABEL_8:
    unint64_t v9 = *(void *)(sSystems + 16);
    if ((unint64_t)v5 >= v9)
    {
      if ((v6 + 1) >> 61) {
        std::vector<RXRecognitionSystem *>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v11 = v9 - (void)v4;
      uint64_t v12 = v11 >> 2;
      if (v11 >> 2 <= v6 + 1) {
        uint64_t v12 = v6 + 1;
      }
      if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v13 = v12;
      }
      if (v13) {
        BOOL v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RXRecognitionSystem *>>(sSystems + 16, v13);
      }
      else {
        BOOL v14 = 0;
      }
      uint64_t v15 = &v14[8 * v6];
      CFRange v16 = &v14[8 * v13];
      *(void *)uint64_t v15 = this;
      uint64_t v10 = v15 + 8;
      CFStringRef v18 = (char *)*v3;
      CFTypeID v17 = (char *)v3[1];
      if (v17 != *v3)
      {
        do
        {
          uint64_t v19 = *((void *)v17 - 1);
          v17 -= 8;
          *((void *)v15 - 1) = v19;
          v15 -= 8;
        }
        while (v17 != v18);
        CFTypeID v17 = (char *)*v3;
      }
      void *v3 = v15;
      v3[1] = v10;
      v3[2] = v16;
      if (v17) {
        operator delete(v17);
      }
    }
    else
    {
      void *v5 = this;
      uint64_t v10 = v5 + 1;
    }
    v3[1] = v10;
    unsigned int v8 = ((*(void *)(sSystems + 8) - *(void *)sSystems) >> 3) - 1;
  }
  else
  {
    uint64_t v7 = 0;
    unsigned int v8 = 0;
    while (v4[v7])
    {
      uint64_t v7 = ++v8;
      if (v6 <= v8) {
        goto LABEL_8;
      }
    }
    v4[v7] = this;
  }
  *((_DWORD *)this + 10) = v8;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 160), 0);
  *((void *)this + 2) |= 1 << *((_DWORD *)this + 10);
}

void sub_22BF8EC9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  RXBlockProp<void({block_pointer})(void)>::~RXBlockProp((const void **)(v10 + 264));
  RXBlockProp<void({block_pointer})(void)>::~RXBlockProp((const void **)(v10 + 256));
  RXBlockProp<void({block_pointer})(unsigned long long)>::~RXBlockProp(v15);
  std::__tree<RXObject *>::destroy(v14, *(void **)(v10 + 232));
  std::__tree<RXObject *>::destroy(v13, *(void **)(v10 + 144));
  std::__tree<RXObject *>::destroy(v12, *(void **)(v10 + 120));
  RXCFProp<__CFString const*>::~RXCFProp((const void **)(v10 + 72));
  RXCFProp<__CFData const*>::~RXCFProp((const void **)(v10 + 64));
  RXCFProp<__CFURL const*>::~RXCFProp((const void **)(v10 + 56));
  RXCFProp<__CFLocale const*>::~RXCFProp(v11);
  RXObject::~RXObject((RXObject *)v10, v16, v17);
  _Unwind_Resume(a1);
}

void RXRecognitionSystem::~RXRecognitionSystem(const void **this)
{
  *this = &unk_26DF657B0;
  uint64_t v2 = RXXPC::Queue((RXXPC *)this);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN19RXRecognitionSystemD2Ev_block_invoke;
  block[3] = &__block_descriptor_tmp_7;
  block[4] = this;
  dispatch_sync(v2, block);
  RXBlockProp<void({block_pointer})(void)>::~RXBlockProp(this + 33);
  RXBlockProp<void({block_pointer})(void)>::~RXBlockProp(this + 32);
  RXBlockProp<void({block_pointer})(unsigned long long)>::~RXBlockProp(this + 31);
  std::__tree<RXObject *>::destroy((uint64_t)(this + 28), this[29]);
  std::__tree<RXObject *>::destroy((uint64_t)(this + 17), this[18]);
  std::__tree<RXObject *>::destroy((uint64_t)(this + 14), this[15]);
  RXCFProp<__CFString const*>::~RXCFProp(this + 9);
  RXCFProp<__CFData const*>::~RXCFProp(this + 8);
  RXCFProp<__CFURL const*>::~RXCFProp(this + 7);
  RXCFProp<__CFLocale const*>::~RXCFProp(this + 6);
  RXObject::~RXObject((RXObject *)this, v3, v4);
}

{
  uint64_t vars8;

  RXRecognitionSystem::~RXRecognitionSystem(this);
  JUMPOUT(0x230F59F90);
}

RXXPC *___ZN19RXRecognitionSystemD2Ev_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  *(void *)(v1 + 16) = 0;
  *(void *)(*(void *)sSystems + 8 * *(unsigned int *)(v1 + 40)) = 0;
  CFDataRef result = *(RXXPC **)(v1 + 88);
  if (result)
  {
    RXXPC::RemoveHandler((uint64_t)result, *(const void **)(v1 + 96));
    _Block_release(*(const void **)(v1 + 96));
    CFDataRef result = *(RXXPC **)(v1 + 88);
    if (result)
    {
      RXXPC::~RXXPC(result);
      JUMPOUT(0x230F59F90);
    }
  }
  return result;
}

uint64_t RXRecognitionSystem::AddRecognizer(uint64_t result, uint64_t a2)
{
  *(void *)(a2 + 88) = *(void *)(result + 104);
  *(void *)(result + 104) = a2;
  *(void *)(a2 + 16) |= 1 << *(_DWORD *)(result + 40);
  return result;
}

uint64_t RXRecognitionSystem::DelRecognizer(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 104);
  if (v2)
  {
    while (v2 != a2)
    {
      uint64_t v2 = *(void *)(v2 + 88);
      *(void *)(result + 104) = v2;
      if (!v2) {
        return result;
      }
    }
    *(void *)(result + 104) = *(void *)(a2 + 88);
  }
  return result;
}

void RXRecognitionSystem::AddTraining(RXXPC **this, const void *a2, const __CFString *a3)
{
  RXXPC::WaitForServer(this[11]);
  xpc_object_t Message = RXXPC::CreateMessage((RXXPC *)0x68);
  unint64_t v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v6)
  {
    unsigned int v8 = v6;
    xpc_dictionary_set_value(Message, kRDKeyText, v6);
    xpc_release(v8);
  }
  RXXPC::SerializeCFString((RXXPC *)Message, kRDKeyCategory, a3, v7);
  RXXPC::SendMessage(this[11], Message, 0);
  xpc_release(Message);
}

void RXRecognitionSystem::SetSecureFieldFocused(RXXPC **this, BOOL a2)
{
  RXXPC::WaitForServer(this[11]);
  xpc_object_t Message = RXXPC::CreateMessage((RXXPC *)0x70);
  xpc_dictionary_set_BOOL(Message, kRDKeyFocusOnSecureField, a2);
  RXXPC::SendMessage(this[11], Message, 0);
  xpc_release(Message);
}

void RXRecognitionSystem::AddLeadingContext(RXXPC **this, const __CFString *a2)
{
  RXXPC::WaitForServer(this[11]);
  xpc_object_t Message = (RXXPC *)RXXPC::CreateMessage((RXXPC *)0x6A);
  RXXPC::SerializeCFString(Message, kRDKeyText, a2, v5);
  RXXPC::SendMessage(this[11], Message, 0);
  xpc_release(Message);
}

void RXRecognitionSystem::AddOtherContext(RXXPC **this, const __CFArray *a2)
{
  RXXPC::WaitForServer(this[11]);
  xpc_object_t Message = RXXPC::CreateMessage((RXXPC *)0x6B);
  uint64_t v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v4)
  {
    CFStringRef v5 = v4;
    xpc_dictionary_set_value(Message, kRDKeyText, v4);
    xpc_release(v5);
  }
  RXXPC::SendMessage(this[11], Message, 0);
  xpc_release(Message);
}

void RXRecognitionSystem::ResetRecognition(RXXPC **this)
{
  RXXPC::WaitForServer(this[11]);
  xpc_object_t Message = RXXPC::CreateMessage((RXXPC *)0x6C);
  RXXPC::SendMessage(this[11], Message, 0);
  xpc_release(Message);
}

void RXRecognitionSystem::SetResetMode(uint64_t a1, unsigned int a2)
{
  RXXPC::WaitForServer(*(RXXPC **)(a1 + 88));
  xpc_object_t Message = RXXPC::CreateMessage((RXXPC *)0x6D);
  CFStringRef v5 = Message;
  if (a2 <= 3) {
    xpc_dictionary_set_uint64(Message, kRDKeyRecognitionResetMode, a2);
  }
  RXXPC::SendMessage(*(RXXPC **)(a1 + 88), v5, 0);
  xpc_release(v5);
}

void RXRecognitionSystem::SaveUserProfileToFile(RXXPC **this, const __CFString *a2)
{
  if (a2)
  {
    RXXPC::WaitForServer(this[11]);
    xpc_object_t Message = (RXXPC *)RXXPC::CreateMessage((RXXPC *)0x6E);
    RXXPC::SerializeCFString(Message, kRDKeyUserProfileSavePath, a2, v5);
    RXXPC::SendMessage(this[11], Message, 0);
    xpc_release(Message);
  }
}

__CFArray *RXRecognitionSystem::PhoneticNeighborsForText(RXXPC **this, const __CFString *a2)
{
  if (!a2) {
    return 0;
  }
  RXXPC::WaitForServer(this[11]);
  xpc_object_t Message = (RXXPC *)RXXPC::CreateMessage((RXXPC *)0x6F);
  RXXPC::SerializeCFString(Message, kRDKeyText, a2, v5);
  xpc_object_t v6 = RXXPC::SendMessageWithReplySync((pthread_mutex_t *)this[11], Message);
  xpc_release(Message);
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  xpc_object_t value = xpc_dictionary_get_value(v6, kRDKeyText);
  if (xpc_array_get_count(value))
  {
    size_t v9 = 0;
    do
    {
      string = xpc_array_get_string(value, v9);
      CFStringRef v11 = CFStringCreateWithCString(0, string, 0x8000100u);
      CFArrayAppendValue(Mutable, v11);
      CFRelease(v11);
      ++v9;
    }
    while (xpc_array_get_count(value) > v9);
  }
  return Mutable;
}

uint64_t *RXRecognitionSystem::LiveObject(uint64_t **this, RXObject *a2)
{
  uint64_t v3 = a2;
  return std::__tree<RXObject *>::__emplace_unique_key_args<RXObject *,RXObject * const&>(this + 14, (unint64_t *)&v3, (uint64_t *)&v3);
}

uint64_t *RXRecognitionSystem::ReachableObject(uint64_t **this, RXObject *a2)
{
  uint64_t v3 = a2;
  return std::__tree<RXObject *>::__emplace_unique_key_args<RXObject *,RXObject * const&>(this + 28, (unint64_t *)&v3, (uint64_t *)&v3);
}

void RXRecognitionSystem::BrokerEvent(RXRecognitionSystem *this, void *a2)
{
  if (this == (RXRecognitionSystem *)MEMORY[0x263EF86A0])
  {
    uint64_t v13 = sSystems;
    if (sSystems)
    {
      uint64_t v14 = *(void *)sSystems;
      if (*(void *)(sSystems + 8) != *(void *)sSystems)
      {
        uint64_t v15 = 0;
        unsigned int v16 = 0;
        do
        {
          uint64_t v17 = *(void *)(v14 + 8 * v15);
          if (v17)
          {
            uint64_t v18 = *(void *)(v17 + 104);
            if (v18)
            {
              do
              {
                RXRecognizer::BrokerReset(v18);
                uint64_t v18 = *(void *)(v18 + 88);
              }
              while (v18);
              uint64_t v13 = sSystems;
              uint64_t v14 = *(void *)sSystems;
            }
          }
          uint64_t v15 = ++v16;
        }
        while (v16 < (unint64_t)((*(void *)(v13 + 8) - v14) >> 3));
      }
    }
    else
    {
      uint64_t v19 = RXOSLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CFTypeID v21 = 0;
        _os_log_impl(&dword_22BF8A000, v19, OS_LOG_TYPE_ERROR, "BrokerEvent: brokerd connection interrupted and recognition system have not started so not doing anything", v21, 2u);
      }
    }
  }
  else if (MEMORY[0x230F5A450](this, a2) == MEMORY[0x263EF8708])
  {
    int64_t int64 = xpc_dictionary_get_int64(this, kRDKeyMessage);
    if (int64 == 601)
    {
      xpc_retain(this);
      RXXPC::DownloadCallback(this, v20);
      xpc_release(this);
    }
    else if (int64 == 600)
    {
      int64_t v4 = xpc_dictionary_get_int64(this, kRDKeyRecognizerID);
      BOOL v5 = xpc_dictionary_get_BOOL(this, kRDKeyBlocked);
      uint64_t v6 = sSystems;
      uint64_t v7 = *(void *)sSystems;
      if (*(void *)(sSystems + 8) != *(void *)sSystems)
      {
        int v8 = v5;
        uint64_t v9 = 0;
        unsigned int v10 = 0;
        while (1)
        {
          uint64_t v11 = *(void *)(v7 + 8 * v9);
          if (v11)
          {
            uint64_t v12 = *(RXRecognizer **)(v11 + 104);
            if (v12) {
              break;
            }
          }
LABEL_12:
          uint64_t v9 = ++v10;
          if (v10 >= (unint64_t)((*(void *)(v6 + 8) - v7) >> 3)) {
            return;
          }
        }
        while (!RXRecognizer::Choke(v12, v4, v8))
        {
          uint64_t v12 = (RXRecognizer *)*((void *)v12 + 11);
          if (!v12)
          {
            uint64_t v6 = sSystems;
            uint64_t v7 = *(void *)sSystems;
            goto LABEL_12;
          }
        }
      }
    }
  }
}

uint64_t RXRecognitionSystem::BrokerReset(uint64_t this)
{
  for (uint64_t i = *(void *)(this + 104); i; uint64_t i = *(void *)(i + 88))
    this = RXRecognizer::BrokerReset(i);
  return this;
}

BOOL RXRecognitionSystem::ChokeRecognizer(RXRecognitionSystem *this, uint64_t a2, int a3)
{
  uint64_t v3 = (RXRecognizer *)*((void *)this + 13);
  if (!v3) {
    return 0;
  }
  do
  {
    BOOL result = RXRecognizer::Choke(v3, a2, a3);
    if (result) {
      break;
    }
    uint64_t v3 = (RXRecognizer *)*((void *)v3 + 11);
  }
  while (v3);
  return result;
}

uint64_t RXRecognitionSystemGetTypeID()
{
  uint64_t result = gRXCFTypeID_RXRecognitionSystem;
  if (!gRXCFTypeID_RXRecognitionSystem)
  {
    uint64_t result = _CFRuntimeRegisterClass();
    gRXCFTypeID_RXRecognitionSystem = result;
  }
  return result;
}

const void *RXRecognitionSystemCreate(uint64_t a1, const __CFLocale *a2, const __CFLocale *a3)
{
  if (!gRXCFTypeID_RXRecognitionSystem) {
    gRXCFTypeID_RXRecognitionSystem = _CFRuntimeRegisterClass();
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v6 = (const void *)Instance;
  if (Instance && !RXRecognitionSystem::Initialize((RXRecognitionSystem *)(Instance + 16), a2, a3))
  {
    CFRelease(v6);
    return 0;
  }
  return v6;
}

void RXRecognitionSystemAddTraining(uint64_t a1, const void *a2, const __CFString *a3)
{
  if (a1) {
    uint64_t v3 = (RXXPC **)(a1 + 16);
  }
  else {
    uint64_t v3 = 0;
  }
  RXRecognitionSystem::AddTraining(v3, a2, a3);
}

void RXRecognitionSystemSetSecureFieldFocused(uint64_t a1, BOOL a2)
{
  if (a1) {
    uint64_t v2 = (RXXPC **)(a1 + 16);
  }
  else {
    uint64_t v2 = 0;
  }
  RXRecognitionSystem::SetSecureFieldFocused(v2, a2);
}

void RXRecognitionSystemAddLeadingContext(uint64_t a1, const __CFString *a2)
{
  if (a1) {
    uint64_t v2 = (RXXPC **)(a1 + 16);
  }
  else {
    uint64_t v2 = 0;
  }
  RXRecognitionSystem::AddLeadingContext(v2, a2);
}

void RXRecognitionSystemAddOtherContext(uint64_t a1, const __CFArray *a2)
{
  if (a1) {
    uint64_t v2 = (RXXPC **)(a1 + 16);
  }
  else {
    uint64_t v2 = 0;
  }
  RXRecognitionSystem::AddOtherContext(v2, a2);
}

void RXRecognitionSystemReset(uint64_t a1)
{
  if (a1) {
    RXRecognitionSystem::ResetRecognition((RXXPC **)(a1 + 16));
  }
  else {
    RXRecognitionSystem::ResetRecognition(0);
  }
}

void RXRecognitionSystemSetResetMode(uint64_t a1, unsigned int a2)
{
  if (a1) {
    uint64_t v2 = a1 + 16;
  }
  else {
    uint64_t v2 = 0;
  }
  RXRecognitionSystem::SetResetMode(v2, a2);
}

void RXRecognitionSystemSaveUserProfileToFile(uint64_t a1, const __CFString *a2)
{
  if (a1) {
    uint64_t v2 = (RXXPC **)(a1 + 16);
  }
  else {
    uint64_t v2 = 0;
  }
  RXRecognitionSystem::SaveUserProfileToFile(v2, a2);
}

__CFArray *RXRecognitionSystemCopyPhoneticNeighborsForText(uint64_t a1, const __CFString *a2)
{
  if (a1) {
    uint64_t v2 = (RXXPC **)(a1 + 16);
  }
  else {
    uint64_t v2 = 0;
  }
  return RXRecognitionSystem::PhoneticNeighborsForText(v2, a2);
}

void std::vector<RXRecognitionSystem *>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264904690, MEMORY[0x263F8C060]);
}

void sub_22BF8F84C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RXRecognitionSystem *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

const void **RXCFProp<__CFLocale const*>::~RXCFProp(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **RXCFProp<__CFURL const*>::~RXCFProp(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **RXCFProp<__CFData const*>::~RXCFProp(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **RXCFProp<__CFString const*>::~RXCFProp(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void std::__tree<RXObject *>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<RXObject *>::destroy(a1, *a2);
    std::__tree<RXObject *>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

const void **RXBlockProp<void({block_pointer})(unsigned long long)>::~RXBlockProp(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    _Block_release(v2);
  }
  return a1;
}

const void **RXBlockProp<void({block_pointer})(void)>::~RXBlockProp(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    _Block_release(v2);
  }
  return a1;
}

uint64_t *std::__tree<RXObject *>::__emplace_unique_key_args<RXObject *,RXObject * const&>(uint64_t **a1, unint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = a1 + 1;
  BOOL v5 = a1[1];
  if (v5)
  {
    unint64_t v7 = *a2;
    while (1)
    {
      while (1)
      {
        int v8 = (uint64_t **)v5;
        unint64_t v9 = v5[4];
        if (v7 >= v9) {
          break;
        }
        BOOL v5 = *v8;
        uint64_t v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      BOOL v5 = v8[1];
      if (!v5)
      {
        uint64_t v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    int v8 = a1 + 1;
LABEL_10:
    unsigned int v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = *a3;
    std::__tree<RXObject *>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

uint64_t *std::__tree<RXObject *>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  BOOL v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      int64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            unint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            unint64_t v9 = (uint64_t **)v2[1];
            unsigned int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *unint64_t v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *uint64_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *uint64_t v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void *std::__set_difference[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void>,std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long> &,std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long> &,std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long> &,std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long> &,std::back_insert_iterator<std::vector<RXObject *>> &>(uint64_t a1, void **a2, uint64_t a3, void *a4, void ***a5)
{
  int v8 = *(void **)a1;
  unint64_t v9 = *a2;
  if (*(void **)a1 == *a2)
  {
LABEL_31:
    unint64_t v9 = v8;
    return std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long>,std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long>,std::back_insert_iterator<std::vector<RXObject *>>>((uint64_t)&v27, v8, v9, *a5);
  }
  uint64_t v11 = *(void **)a3;
  if (*(void *)a3 != *a4)
  {
    while (1)
    {
      unint64_t v13 = v8[4];
      unint64_t v14 = v11[4];
      if (v13 >= v14)
      {
        if (v14 >= v13)
        {
          CFTypeID v21 = (void *)v8[1];
          if (v21)
          {
            do
            {
              CFArrayRef v22 = v21;
              CFTypeID v21 = (void *)*v21;
            }
            while (v21);
          }
          else
          {
            do
            {
              CFArrayRef v22 = (void *)v8[2];
              BOOL v18 = *v22 == (void)v8;
              int v8 = v22;
            }
            while (!v18);
          }
          *(void *)a1 = v22;
          v23 = *(void **)a3;
          v24 = *(void **)(*(void *)a3 + 8);
          if (v24)
          {
            do
            {
              v25 = v24;
              v24 = (void *)*v24;
            }
            while (v24);
          }
          else
          {
            do
            {
              v25 = (void *)v23[2];
              BOOL v18 = *v25 == (void)v23;
              v23 = v25;
            }
            while (!v18);
          }
          *(void *)a3 = v25;
        }
        else
        {
          uint64_t v19 = (void *)v11[1];
          if (v19)
          {
            do
            {
              CFStringRef v20 = v19;
              uint64_t v19 = (void *)*v19;
            }
            while (v19);
          }
          else
          {
            do
            {
              CFStringRef v20 = (void *)v11[2];
              BOOL v18 = *v20 == (void)v11;
              uint64_t v11 = v20;
            }
            while (!v18);
          }
          *(void *)a3 = v20;
        }
      }
      else
      {
        std::back_insert_iterator<std::vector<RXObject *>>::operator=[abi:ne180100](a5, v8 + 4);
        uint64_t v15 = *(void **)a1;
        unsigned int v16 = *(void **)(*(void *)a1 + 8);
        if (v16)
        {
          do
          {
            uint64_t v17 = v16;
            unsigned int v16 = (void *)*v16;
          }
          while (v16);
        }
        else
        {
          do
          {
            uint64_t v17 = (void *)v15[2];
            BOOL v18 = *v17 == (void)v15;
            uint64_t v15 = v17;
          }
          while (!v18);
        }
        *(void *)a1 = v17;
      }
      int v8 = *(void **)a1;
      unint64_t v9 = *a2;
      if (*(void **)a1 == *a2) {
        break;
      }
      uint64_t v11 = *(void **)a3;
      if (*(void *)a3 == *a4) {
        return std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long>,std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long>,std::back_insert_iterator<std::vector<RXObject *>>>((uint64_t)&v27, v8, v9, *a5);
      }
    }
    goto LABEL_31;
  }
  return std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long>,std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long>,std::back_insert_iterator<std::vector<RXObject *>>>((uint64_t)&v27, v8, v9, *a5);
}

void ***std::back_insert_iterator<std::vector<RXObject *>>::operator=[abi:ne180100](void ***a1, void *a2)
{
  int64_t v4 = *a1;
  BOOL v5 = (*a1)[1];
  int v6 = *a1;
  unint64_t v9 = (unint64_t)v6[2];
  uint64_t v7 = (uint64_t)(v6 + 2);
  unint64_t v8 = v9;
  if ((unint64_t)v5 >= v9)
  {
    uint64_t v11 = ((char *)v5 - (unsigned char *)*v4) >> 3;
    if ((unint64_t)(v11 + 1) >> 61) {
      std::vector<RXRecognitionSystem *>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v8 - (void)*v4;
    uint64_t v13 = v12 >> 2;
    if (v12 >> 2 <= (unint64_t)(v11 + 1)) {
      uint64_t v13 = v11 + 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    if (v14) {
      uint64_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RXRecognitionSystem *>>(v7, v14);
    }
    else {
      uint64_t v15 = 0;
    }
    unsigned int v16 = &v15[8 * v11];
    uint64_t v17 = &v15[8 * v14];
    *(void *)unsigned int v16 = *a2;
    unsigned int v10 = v16 + 8;
    uint64_t v19 = (char *)*v4;
    BOOL v18 = (char *)v4[1];
    if (v18 != *v4)
    {
      do
      {
        uint64_t v20 = *((void *)v18 - 1);
        v18 -= 8;
        *((void *)v16 - 1) = v20;
        v16 -= 8;
      }
      while (v18 != v19);
      BOOL v18 = (char *)*v4;
    }
    *int64_t v4 = v16;
    v4[1] = v10;
    v4[2] = v17;
    if (v18) {
      operator delete(v18);
    }
  }
  else
  {
    void *v5 = *a2;
    unsigned int v10 = v5 + 1;
  }
  v4[1] = v10;
  return a1;
}

void *std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long>,std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long>,std::back_insert_iterator<std::vector<RXObject *>>>(uint64_t a1, void *a2, void *a3, void **a4)
{
  int64_t v4 = a2;
  unsigned int v10 = a4;
  if (a2 == a3) {
    return a2;
  }
  BOOL v5 = a3;
  do
  {
    std::back_insert_iterator<std::vector<RXObject *>>::operator=[abi:ne180100](&v10, v4 + 4);
    int v6 = (void *)v4[1];
    if (v6)
    {
      do
      {
        uint64_t v7 = v6;
        int v6 = (void *)*v6;
      }
      while (v6);
    }
    else
    {
      do
      {
        uint64_t v7 = (void *)v4[2];
        BOOL v8 = *v7 == (void)v4;
        int64_t v4 = v7;
      }
      while (!v8);
    }
    int64_t v4 = v7;
  }
  while (v7 != v5);
  return v5;
}

uint64_t *std::__tree<RXObject *>::swap(uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *uint64_t result = *(void *)a2;
  *(void *)a2 = v2;
  uint64_t v5 = result[1];
  uint64_t v4 = result[2];
  uint64_t v3 = result + 1;
  *(_OWORD *)(result + 1) = *(_OWORD *)(a2 + 8);
  *(void *)(a2 + 8) = v5;
  *(void *)(a2 + 16) = v4;
  if (result[2]) {
    uint64_t result = (uint64_t *)(*v3 + 16);
  }
  *uint64_t result = (uint64_t)v3;
  int v6 = (void *)(*(void *)(a2 + 8) + 16);
  if (!v4) {
    int v6 = (void *)a2;
  }
  *int v6 = a2 + 8;
  return result;
}

double RXCFInit_RXRecognizer(void *a1)
{
  RXObject::RXObject((RXObject *)(a1 + 2));
  a1[2] = &unk_26DF65840;
  *((_DWORD *)a1 + 14) = 0;
  *((_WORD *)a1 + 30) = 0;
  a1[8] = 1;
  *((_DWORD *)a1 + 18) = 0;
  double result = 0.0;
  *((_OWORD *)a1 + 5) = 0u;
  *((_OWORD *)a1 + 6) = 0u;
  *((_OWORD *)a1 + 7) = 0u;
  a1[16] = -1;
  a1[17] = 0;
  return result;
}

void RXRecognizer::RXRecognizer(RXRecognizer *this)
{
  RXObject::RXObject(this);
  *(void *)uint64_t v1 = &unk_26DF65840;
  *(_DWORD *)(v1 + 40) = 0;
  *(_WORD *)(v1 + 44) = 0;
  *(void *)(v1 + 48) = 1;
  *(_DWORD *)(v1 + 56) = 0;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 80) = 0u;
  *(_OWORD *)(v1 + 96) = 0u;
  *(void *)(v1 + 112) = -1;
  *(void *)(v1 + 120) = 0;
}

uint64_t RXCFRegister_RXRecognizer(void)
{
  return _CFRuntimeRegisterClass();
}

void *RXRecognizer::WillDestroy(RXRecognizer *this)
{
  uint64_t v2 = RXXPC::Queue(this);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN12RXRecognizer11WillDestroyEv_block_invoke;
  block[3] = &__block_descriptor_tmp_2;
  block[4] = this;
  dispatch_sync(v2, block);
  uint64_t v3 = *((void *)this + 2);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  v5[2] = ___ZN12RXRecognizer11WillDestroyEv_block_invoke_2;
  v5[3] = &__block_descriptor_tmp_3;
  v5[4] = v3;
  return _Block_copy(v5);
}

void ___ZN12RXRecognizer11WillDestroyEv_block_invoke(uint64_t a1)
{
}

void ___ZN12RXRecognizer11WillDestroyEv_block_invoke_2(RXXPC *a1)
{
  uint64_t v2 = RXXPC::Queue(a1);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN12RXRecognizer11WillDestroyEv_block_invoke_3;
  block[3] = &__block_descriptor_tmp_2;
  block[4] = *((void *)a1 + 4);
  dispatch_sync(v2, block);
}

void ___ZN12RXRecognizer11WillDestroyEv_block_invoke_3(uint64_t a1)
{
}

CFNumberRef RXRecognizer::CopyProperty(RXRecognizer *this, int a2)
{
  if (a2 > 1919705452)
  {
    if (a2 <= 1919770999)
    {
      if (a2 == 1919705453)
      {
        uint64_t v6 = *((void *)this + 10);
        if (v6) {
          return (CFNumberRef)CFRetain((CFTypeRef)(v6 - 16));
        }
        else {
          return 0;
        }
      }
      if (a2 == 1919710062)
      {
        uint64_t v2 = MEMORY[0x263EFFB40];
        if (!*((unsigned char *)this + 40)) {
          uint64_t v2 = MEMORY[0x263EFFB38];
        }
        return *(CFNumberRef *)v2;
      }
      return (CFNumberRef)RXObject::CopyProperty(this, a2);
    }
    if (a2 == 1919771000) {
      return CFNumberCreate(0, kCFNumberCFIndexType, (char *)this + 48);
    }
    if (a2 != 1919969636) {
      return (CFNumberRef)RXObject::CopyProperty(this, a2);
    }
    uint64_t v4 = (char *)this + 56;
    CFNumberType v5 = kCFNumberSInt32Type;
    return CFNumberCreate(0, v5, v4);
  }
  if (a2 == 1918985076)
  {
    uint64_t v4 = (char *)this + 96;
LABEL_22:
    CFNumberType v5 = kCFNumberSInt64Type;
    return CFNumberCreate(0, v5, v4);
  }
  if (a2 == 1919312491)
  {
    uint64_t v4 = (char *)this + 104;
    goto LABEL_22;
  }
  if (a2 != 1919512166) {
    return (CFNumberRef)RXObject::CopyProperty(this, a2);
  }
  CFNumberRef result = (CFNumberRef)*((void *)this + 15);
  if (result) {
    return (CFNumberRef)CFRetain(result);
  }
  return result;
}

void RXRecognizer::SetProperty(RXRecognizer *this, int a2, const __CFBoolean *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v6 = RXOSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v14) = 67109378;
    HIDWORD(v14) = a2;
    __int16 v15 = 2112;
    CFBooleanRef v16 = a3;
    _os_log_impl(&dword_22BF8A000, v6, OS_LOG_TYPE_DEBUG, "setting recognizer property = %d to %@", (uint8_t *)&v14, 0x12u);
  }
  if (a2 > 1919710061)
  {
    if (a2 <= 1919841644)
    {
      if (a2 == 1919710062)
      {
        int v13 = CFBooleanGetValue(a3) != 0;
        if (*((unsigned __int8 *)this + 40) != v13)
        {
          (*(void (**)(RXRecognizer *))(*(void *)this + 88))(this);
          *((unsigned char *)this + 40) = v13;
        }
      }
      else
      {
        if (a2 != 1919771000) {
          goto LABEL_42;
        }
        uint64_t v14 = 0;
        if (!CFNumberGetValue(a3, kCFNumberCFIndexType, &v14) || (uint64_t v11 = v14, v14 <= 0))
        {
          uint64_t v11 = 1;
          uint64_t v14 = 1;
        }
        if (v11 != *((void *)this + 6))
        {
          (*(void (**)(RXRecognizer *))(*(void *)this + 88))(this);
          *((void *)this + 6) = v14;
        }
      }
    }
    else
    {
      switch(a2)
      {
        case 1919841645:
          int v12 = CFBooleanGetValue(a3) != 0;
          if (*((unsigned __int8 *)this + 43) != v12)
          {
            (*(void (**)(RXRecognizer *))(*(void *)this + 88))(this);
            *((unsigned char *)this + 43) = v12;
          }
          break;
        case 1919969636:
          LODWORD(v14) = 0;
          CFNumberGetValue(a3, kCFNumberSInt32Type, &v14);
          if (v14 != *((_DWORD *)this + 14)) {
            *((_DWORD *)this + 14) = v14;
          }
          break;
        case 1920168044:
          int v9 = CFBooleanGetValue(a3) != 0;
          if (*((unsigned __int8 *)this + 42) != v9)
          {
            (*(void (**)(RXRecognizer *))(*(void *)this + 88))(this);
            *((unsigned char *)this + 42) = v9;
          }
          break;
        default:
          goto LABEL_42;
      }
    }
  }
  else
  {
    if (a2 > 1919312490)
    {
      switch(a2)
      {
        case 1919312491:
          return;
        case 1919512166:
          RXCFProp<void const*>::operator=((CFTypeRef *)this + 15, a3);
          return;
        case 1919705453:
          uint64_t v7 = (char *)a3 + 16;
          if (!a3) {
            uint64_t v7 = 0;
          }
          BOOL v8 = (char *)this + 80;
          if (*((char **)this + 10) != v7)
          {
            if (*((unsigned char *)this + 40) && !*((unsigned char *)this + 44)) {
              (*(void (**)(RXRecognizer *))(*(void *)this + 88))(this);
            }
            RXProp<RXLanguageObject *>::operator=((void *)this + 10, a3);
            if (*(void *)v8) {
              *(void *)(*(void *)v8 + 8) |= 1uLL;
            }
          }
          return;
      }
LABEL_42:
      RXObject::SetProperty(this, a2, a3);
      return;
    }
    if (a2 == 1918985076)
    {
      uint64_t v14 = 0;
      CFNumberGetValue(a3, kCFNumberSInt64Type, &v14);
      if (v14 != *((void *)this + 12)) {
        *((void *)this + 12) = v14;
      }
    }
    else
    {
      if (a2 != 1919118445) {
        goto LABEL_42;
      }
      int v10 = CFBooleanGetValue(a3) != 0;
      if (*((unsigned __int8 *)this + 41) != v10)
      {
        (*(void (**)(RXRecognizer *))(*(void *)this + 88))(this);
        *((unsigned char *)this + 41) = v10;
      }
    }
  }
}

uint64_t RXProp<RXLanguageObject *>::operator=(void *a1, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  if (*a1) {
    CFRelease((CFTypeRef)(*a1 - 16));
  }
  if (cf) {
    uint64_t result = (uint64_t)cf + 16;
  }
  else {
    uint64_t result = 0;
  }
  *a1 = result;
  return result;
}

uint64_t RXRecognizer::ClaimLanguageModel(uint64_t this)
{
  uint64_t v1 = *(void *)(this + 80);
  if (v1) {
    *(void *)(v1 + 8) |= 1uLL;
  }
  return this;
}

uint64_t RXRecognizer::Initialize(void *a1, uint64_t a2, const void *a3, uint64_t a4)
{
  RXProp<RXRecognitionSystem *>::operator=(a1 + 8, a2);
  a1[9] = _Block_copy(a3);
  a1[1] = a4;
  CFRetain((CFTypeRef)(a1[8] - 16));
  uint64_t result = RXRecognitionSystem::AddRecognizer(a1[8], (uint64_t)a1);
  if ((*(unsigned char *)(a1[8] + 8) & 1) == 0)
  {
    uint64_t v8 = a1[13] | 3;
    a1[12] = 1;
    a1[13] = v8;
  }
  return result;
}

uint64_t RXProp<RXRecognitionSystem *>::operator=(void *a1, uint64_t a2)
{
  if (a2) {
    CFRetain((CFTypeRef)(a2 - 16));
  }
  if (*a1) {
    CFRelease((CFTypeRef)(*a1 - 16));
  }
  *a1 = a2;
  return a2;
}

void RXRecognizer::~RXRecognizer(const void **this)
{
  *this = &unk_26DF65840;
  uint64_t v2 = RXXPC::Queue((RXXPC *)this);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN12RXRecognizerD2Ev_block_invoke;
  block[3] = &__block_descriptor_tmp_4;
  block[4] = this;
  dispatch_sync(v2, block);
  _Block_release(this[9]);
  CFRelease((char *)this[8] - 16);
  RXCFProp<__CFDictionary const*>::~RXCFProp(this + 15);
  RXProp<RXLanguageObject *>::~RXProp(this + 10);
  RXProp<RXRecognitionSystem *>::~RXProp(this + 8);
  RXObject::~RXObject((RXObject *)this, v3, v4);
}

{
  uint64_t vars8;

  RXRecognizer::~RXRecognizer(this);
  JUMPOUT(0x230F59F90);
}

uint64_t ___ZN12RXRecognizerD2Ev_block_invoke(uint64_t a1)
{
  return RXRecognitionSystem::DelRecognizer(*(void *)(*(void *)(a1 + 32) + 64), *(void *)(a1 + 32));
}

void RXRecognizer::Serialize(RXRecognizer *this, void *a2, uint64_t **a3)
{
  if (*((unsigned char *)this + 40)) {
    BOOL v6 = *((unsigned char *)this + 44) == 0;
  }
  else {
    BOOL v6 = 0;
  }
  RXRecognitionSystem::ReachableObject(*((uint64_t ***)this + 8), this);
  uint64_t v7 = *((void *)this + 10);
  if (v7)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 0x40000000;
    v9[2] = ___ZN12RXRecognizer9SerializeEPvP19RXRecognitionSystem_block_invoke;
    v9[3] = &__block_descriptor_tmp_6;
    BOOL v10 = v6;
    v9[4] = this;
    v9[5] = a2;
    v9[6] = a3;
    RXLanguageObject::ApplyBlock(v7, (uint64_t)v9, 0x10uLL);
  }
  if (*((void *)this + 3) && (v6 || *((unsigned char *)this + 45)))
  {
    *((void *)this + 3) = 0;
    *((unsigned char *)this + 45) = v6;
    xpc_object_t XPCDesc = RXObject::CreateXPCDesc(this, 1, a3);
    xpc_dictionary_set_BOOL(XPCDesc, kRDKeyIsListening, v6);
    xpc_dictionary_set_uint64(XPCDesc, kRDKeyMaxResults, *((void *)this + 6));
    xpc_dictionary_set_BOOL(XPCDesc, kRDKeyAllowCloseMatch, *((unsigned char *)this + 41));
    xpc_dictionary_set_BOOL(XPCDesc, kRDKeySpellingMode, *((unsigned char *)this + 42));
    xpc_dictionary_set_BOOL(XPCDesc, kRDKeyNumberMode, *((unsigned char *)this + 43));
    if (v6) {
      xpc_dictionary_set_uint64(XPCDesc, kRDKeyLanguageModel, *((void *)this + 10));
    }
    xpc_dictionary_set_BOOL(XPCDesc, kRDKeyUseStreaming, *((_DWORD *)this + 2) & 1);
    xpc_array_append_value(a2, XPCDesc);
    xpc_release(XPCDesc);
  }
}

uint64_t ___ZN12RXRecognizer9SerializeEPvP19RXRecognitionSystem_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = (RXObject *)(a2 + 16);
  }
  else {
    uint64_t v3 = 0;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    (*(void (**)(RXObject *, void, void))(*(void *)v3 + 96))(v3, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    RXRecognitionSystem::ReachableObject(*(uint64_t ***)(v4 + 64), v3);
    *((void *)v3 + 2) |= 1 << *(_DWORD *)(*(void *)(a1 + 48) + 40);
    CFNumberType v5 = (RXObject *)*((void *)v3 + 19);
    if (v5) {
      RXRecognitionSystem::ReachableObject(*(uint64_t ***)(v4 + 64), v5);
    }
  }
  return 0;
}

void RXRecognizer::Recognized(RXRecognizer *this, void *a2)
{
  uint64_t uint64 = xpc_dictionary_get_uint64(this, kRDKeyObjectID);
  if (RecognizerStillExists(uint64))
  {
    xpc_object_t value = xpc_dictionary_get_value(this, kRDKeyLanguageModel);
    unint64_t v8 = 0;
    GetDaemonLMID(value, &v8);
    if (value) {
      BOOL v5 = v8 == *(void *)(uint64 + 80);
    }
    else {
      BOOL v5 = 0;
    }
    if (v5) {
      operator new();
    }
    CFRetain((CFTypeRef)(uint64 - 16));
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZN12RXRecognizer10RecognizedEPv_block_invoke;
    block[3] = &__block_descriptor_tmp_7_0;
    block[4] = uint64;
    void block[5] = 0;
    dispatch_async(global_queue, block);
  }
}

void sub_22BF90DF4(_Unwind_Exception *a1)
{
  MEMORY[0x230F59F90](v1, 0x1020C403ED2C137);
  _Unwind_Resume(a1);
}

void *GetDaemonLMID(void *result, unint64_t *a2)
{
  if (result)
  {
    uint64_t v3 = result;
    if (xpc_dictionary_get_int64(result, kRDKeyObjectType) == 14
      || xpc_dictionary_get_int64(v3, kRDKeyObjectType) == 15)
    {
      uint64_t result = xpc_dictionary_get_value(v3, kRDKeyChildren);
      if (result)
      {
        applier[0] = MEMORY[0x263EF8330];
        applier[1] = 0x40000000;
        applier[2] = ___ZL13GetDaemonLMIDPvRy_block_invoke;
        applier[3] = &__block_descriptor_tmp_10;
        applier[4] = a2;
        return (void *)xpc_array_apply(result, applier);
      }
    }
    else
    {
      uint64_t result = (void *)xpc_dictionary_get_uint64(v3, kRDKeyObjectID);
      *a2 = (unint64_t)result;
    }
  }
  return result;
}

BOOL RXRecognizer::LMStillExists(RXRecognizer *this, uint64_t a2)
{
  return *((void *)this + 10) == a2;
}

RXResultDesc *RXResultDesc::DeleteRef(RXResultDesc *this)
{
  BOOL v3 = __OFSUB__(*(void *)this, 1);
  BOOL v1 = *(void *)this == 1;
  BOOL v2 = --*(void *)this < 0;
  if (v2 ^ v3 | v1)
  {
    RXResultDesc::~RXResultDesc(this);
    JUMPOUT(0x230F59F90);
  }
  return this;
}

void ___ZN12RXRecognizer10RecognizedEPv_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 72);
  if (v2) {
    uint64_t v4 = v2 - 16;
  }
  else {
    uint64_t v4 = 0;
  }
  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    CFRelease((CFTypeRef)(v5 - 16));
  }
  BOOL v6 = (const void *)(*(void *)(a1 + 32) - 16);
  CFRelease(v6);
}

uint64_t RXRecognizer::Recognized(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 72);
  if (a2) {
    uint64_t v3 = a2 - 16;
  }
  else {
    uint64_t v3 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

CFDataRef RXRecognizer::CopyAudio(RXRecognizer *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(pthread_mutex_t **)(*((void *)this + 8) + 88);
  xpc_object_t Message = RXXPC::CreateMessage((RXXPC *)0x66);
  xpc_dictionary_set_uint64(Message, kRDKeyResultID, a2);
  xpc_dictionary_set_uint64(Message, kRDKeyStartTime, a3);
  xpc_dictionary_set_uint64(Message, kRDKeyEndTime, a4);
  xpc_object_t v9 = RXXPC::SendMessageWithReplySync(v7, Message);
  xpc_release(Message);
  CFDataRef value = (const __CFData *)xpc_dictionary_get_value(v9, kRDKeyAudioData);
  CFDataRef v11 = value;
  if (value)
  {
    bytes_ptr = (const UInt8 *)xpc_data_get_bytes_ptr(value);
    size_t length = xpc_data_get_length(v11);
    CFDataRef v11 = CFDataCreate(0, bytes_ptr, length);
  }
  xpc_release(v9);
  return v11;
}

void RXRecognizer::ReleaseResult(RXRecognizer *this, uint64_t a2)
{
  uint64_t v3 = *(RXXPC **)(*((void *)this + 8) + 88);
  xpc_object_t Message = RXXPC::CreateMessage((RXXPC *)0x67);
  xpc_dictionary_set_uint64(Message, kRDKeyResultID, a2);
  RXXPC::SendMessage(v3, Message, 0);
  xpc_release(Message);
}

uint64_t RXRecognizer::BrokerReset(uint64_t this)
{
  *(void *)(this + 112) = -1;
  *(unsigned char *)(this + 44) = 0;
  return this;
}

BOOL RXRecognizer::Choke(RXRecognizer *this, uint64_t a2, int a3)
{
  uint64_t v4 = *((void *)this + 14);
  if (v4 == a2 && *((unsigned __int8 *)this + 44) != a3)
  {
    *((unsigned char *)this + 44) = a3;
    BOOL v6 = RXXPC::Queue(this);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZN12RXRecognizer5ChokeExb_block_invoke;
    block[3] = &__block_descriptor_tmp_8;
    block[4] = this;
    dispatch_async(v6, block);
  }
  return v4 == a2;
}

void ___ZN12RXRecognizer5ChokeExb_block_invoke(uint64_t a1)
{
  BOOL v1 = *(RXRecognitionSystem ***)(a1 + 32);
  RXRecognitionSystem::StartChanges(v1[2]);
  (*((void (**)(RXRecognitionSystem **))*v1 + 11))(v1);
  RXRecognitionSystem::CommitChanges(v1[2]);
}

void sub_22BF91278(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  RXTransaction<RXRecognizer>::~RXTransaction((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t RXRecognizerGetTypeID()
{
  uint64_t result = gRXCFTypeID_RXRecognizer;
  if (!gRXCFTypeID_RXRecognizer)
  {
    uint64_t result = _CFRuntimeRegisterClass();
    gRXCFTypeID_RXRecognizer = result;
  }
  return result;
}

uint64_t RXRecognizerCreate(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4)
{
  if (!gRXCFTypeID_RXRecognizer) {
    gRXCFTypeID_RXRecognizer = _CFRuntimeRegisterClass();
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v8 = Instance;
  if (Instance) {
    xpc_object_t v9 = (void *)(Instance + 16);
  }
  else {
    xpc_object_t v9 = 0;
  }
  if (a2) {
    uint64_t v10 = a2 + 16;
  }
  else {
    uint64_t v10 = 0;
  }
  RXRecognizer::Initialize(v9, v10, a3, a4);
  return v8;
}

void RXRecognizerSetFeedbackText()
{
  int v0 = RXOSLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)BOOL v1 = 0;
    _os_log_impl(&dword_22BF8A000, v0, OS_LOG_TYPE_ERROR, "RXRecognizerSetFeedbackText is only valid for macOS", v1, 2u);
  }
}

uint64_t ___ZL13GetDaemonLMIDPvRy_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a2) {
    GetDaemonLMID(a3, *(unint64_t **)(a1 + 32));
  }
  return 1;
}

void *RXProp<RXRecognitionSystem *>::~RXProp(void *a1)
{
  if (*a1) {
    CFRelease((CFTypeRef)(*a1 - 16));
  }
  return a1;
}

void *RXProp<RXLanguageObject *>::~RXProp(void *a1)
{
  if (*a1) {
    CFRelease((CFTypeRef)(*a1 - 16));
  }
  return a1;
}

const void **RXCFProp<__CFDictionary const*>::~RXCFProp(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

uint64_t RXTransaction<RXRecognizer>::~RXTransaction(uint64_t a1)
{
  return a1;
}

void RXCFInit_RXVocabulary(void *a1)
{
  a1[2] = &unk_26DF658D0;
  a1[7] = 0;
  a1[8] = 0;
}

void RXVocabulary::RXVocabulary(RXVocabulary *this)
{
  RXObject::RXObject(this);
  *BOOL v1 = &unk_26DF658D0;
  v1[5] = 0;
  v1[6] = 0;
}

uint64_t RXCFRegister_RXVocabulary(void)
{
  return _CFRuntimeRegisterClass();
}

CFTypeRef RXVocabulary::Initialize(CFTypeRef *this, const __CFLocale *a2, const __CFURL *a3)
{
  RXCFProp<void const*>::operator=(this + 5, a2);
  CFTypeRef result = RXCFProp<void const*>::operator=(this + 6, a3);
  this[3] = (CFTypeRef)-1;
  return result;
}

void RXVocabulary::~RXVocabulary(const void **this)
{
  *this = &unk_26DF658D0;
  uint64_t v2 = this + 5;
  RXCFProp<__CFURL const*>::~RXCFProp(this + 6);
  RXCFProp<__CFLocale const*>::~RXCFProp(v2);
  RXObject::~RXObject((RXObject *)this, v3, v4);
}

{
  uint64_t vars8;

  RXVocabulary::~RXVocabulary(this);
  JUMPOUT(0x230F59F90);
}

void RXVocabulary::Serialize(RXVocabulary *this, void *a2, uint64_t **a3)
{
  xpc_object_t XPCDesc = (RXXPC *)RXObject::CreateXPCDesc(this, 5, a3);
  uint64_t v7 = XPCDesc;
  uint64_t v8 = (void *)*((void *)this + 6);
  if (v8) {
    RXXPC::SerializeURL(XPCDesc, v8, v6);
  }
  xpc_array_append_value(a2, v7);
  xpc_release(v7);
}

uint64_t RXVocabularyGetTypeID()
{
  uint64_t result = gRXCFTypeID_RXVocabulary;
  if (!gRXCFTypeID_RXVocabulary)
  {
    uint64_t result = _CFRuntimeRegisterClass();
    gRXCFTypeID_RXVocabulary = result;
  }
  return result;
}

uint64_t RXVocabularyCreateWithLocale(uint64_t a1, const void *a2)
{
  if (!gRXCFTypeID_RXVocabulary) {
    gRXCFTypeID_RXVocabulary = _CFRuntimeRegisterClass();
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v4 = Instance;
  if (Instance) {
    uint64_t v5 = Instance + 16;
  }
  else {
    uint64_t v5 = 0;
  }
  RXCFProp<void const*>::operator=((CFTypeRef *)(v5 + 40), a2);
  CFURLRef v6 = *(const void **)(v5 + 48);
  if (v6) {
    CFRelease(v6);
  }
  *(void *)(v5 + 48) = 0;
  *(void *)(v5 + 24) = -1;
  return v4;
}

uint64_t RXVocabularyCreateWithURL(uint64_t a1, const void *a2)
{
  if (!gRXCFTypeID_RXVocabulary) {
    gRXCFTypeID_RXVocabulary = _CFRuntimeRegisterClass();
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v4 = Instance;
  if (Instance) {
    uint64_t v5 = Instance + 16;
  }
  else {
    uint64_t v5 = 0;
  }
  CFURLRef v6 = *(const void **)(v5 + 40);
  if (v6) {
    CFRelease(v6);
  }
  *(void *)(v5 + 40) = 0;
  RXCFProp<void const*>::operator=((CFTypeRef *)(v5 + 48), a2);
  *(void *)(v5 + 24) = -1;
  return v4;
}

double RXCFInit_RXLanguageObject(void *a1)
{
  RXObject::RXObject((RXObject *)(a1 + 2));
  a1[2] = &unk_26DF65960;
  *((_DWORD *)a1 + 14) = 0;
  double result = 0.0;
  *((_OWORD *)a1 + 4) = 0u;
  *((_OWORD *)a1 + 5) = 0u;
  *((_OWORD *)a1 + 6) = 0u;
  *((_OWORD *)a1 + 7) = 0u;
  *((_OWORD *)a1 + 8) = 0u;
  *((_OWORD *)a1 + 9) = 0u;
  *((_OWORD *)a1 + 10) = 0u;
  *((_OWORD *)a1 + 11) = 0u;
  *((_OWORD *)a1 + 12) = 0u;
  *((_OWORD *)a1 + 13) = 0u;
  a1[28] = 0;
  return result;
}

void RXLanguageObject::RXLanguageObject(RXLanguageObject *this)
{
  RXObject::RXObject(this);
  *(void *)uint64_t v1 = &unk_26DF65960;
  *(_DWORD *)(v1 + 40) = 0;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 80) = 0u;
  *(_OWORD *)(v1 + 96) = 0u;
  *(_OWORD *)(v1 + 112) = 0u;
  *(_OWORD *)(v1 + 128) = 0u;
  *(_OWORD *)(v1 + 144) = 0u;
  *(_OWORD *)(v1 + 160) = 0u;
  *(_OWORD *)(v1 + 176) = 0u;
  *(_OWORD *)(v1 + 192) = 0u;
  *(void *)(v1 + 208) = 0;
}

uint64_t RXCFRegister_RXLanguageObject(void)
{
  qword_26B6E3B48 = (uint64_t)RXCFCopyFormattingDesc;
  qword_26B6E3B50 = (uint64_t)RXCFCopyDebugDesc;
  return _CFRuntimeRegisterClass();
}

CFArrayRef RXLanguageObject::CopyProperty(RXLanguageObject *this, int a2)
{
  if ((*((_DWORD *)this + 10) & 0xFFFFFFFE) != 4)
  {
    if (a2 <= 1819242611)
    {
      if (a2 <= 1818457192)
      {
        if (a2 == 1818326372)
        {
          uint64_t v23 = *((void *)this + 23);
          if (v23)
          {
            uint64_t v25 = *(void *)(v23 + 8);
            v24 = *(RXRecognizer **)(v23 + 16);
            uint64_t v26 = *((void *)this + 24);
            uint64_t v27 = *((void *)this + 25);
            return RXRecognizer::CopyAudio(v24, v25, v26, v27);
          }
          return 0;
        }
        if (a2 != 1818453097)
        {
LABEL_74:
          return (CFArrayRef)RXObject::CopyProperty(this, a2);
        }
        return (CFArrayRef)*((void *)this + 12);
      }
      else
      {
        if (a2 != 1818457193)
        {
          if (a2 != 1818588269)
          {
            if (a2 == 1819173229)
            {
              CFBooleanRef v16 = (const void *)*((void *)this + 6);
              if (v16)
              {
LABEL_62:
                return (CFArrayRef)CFRetain(v16);
              }
              return 0;
            }
            goto LABEL_74;
          }
          unint64_t v29 = *((void *)this + 25);
          if (!v29) {
            return 0;
          }
          goto LABEL_67;
        }
        return (CFArrayRef)*((void *)this + 11);
      }
    }
    if (a2 <= 1819505772)
    {
      if (a2 == 1819242612)
      {
        BOOL v18 = (const void **)MEMORY[0x263EFFB40];
        uint64_t v19 = (const void **)MEMORY[0x263EFFB38];
        BOOL v20 = (*((void *)this + 1) & 4) == 0;
      }
      else
      {
        if (a2 != 1819439220) {
          goto LABEL_74;
        }
        BOOL v18 = (const void **)MEMORY[0x263EFFB40];
        uint64_t v19 = (const void **)MEMORY[0x263EFFB38];
        BOOL v20 = (*((void *)this + 1) & 8) == 0;
      }
LABEL_58:
      if (v20) {
        v28 = v19;
      }
      else {
        v28 = v18;
      }
      CFBooleanRef v16 = *v28;
      goto LABEL_62;
    }
    if (a2 != 1819505773)
    {
      if (a2 == 1819571826)
      {
        return RXLanguageObject::CopyTextVariantsWithLocale(this, 0);
      }
      if (a2 == 1819572340)
      {
        return (CFArrayRef)RXLanguageObject::CopyTextWithLocale(this, 0);
      }
      goto LABEL_74;
    }
    unint64_t v29 = *((void *)this + 24);
    if (!v29) {
      return 0;
    }
LABEL_67:
    *(double *)&values = (double)v29 / 1000.0;
    return CFNumberCreate(0, kCFNumberDoubleType, &values);
  }
  if (a2 != 1970563428)
  {
    if (a2 != 1818786160)
    {
      if (a2 == 1818391412)
      {
        uint64_t v3 = 0;
        unint64_t v4 = 0;
        *(double *)&values = 0.0;
        v31 = 0;
        v32 = 0;
        uint64_t v5 = *((void *)this + 20);
        do
        {
          uint64_t v6 = *(void *)(v5 + 8 * v4) - 16;
          if (v3 >= v32)
          {
            uint64_t v7 = ((char *)v3 - (char *)values) >> 3;
            if ((unint64_t)(v7 + 1) >> 61) {
              std::vector<RXRecognitionSystem *>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v8 = ((char *)v32 - (char *)values) >> 2;
            if (v8 <= v7 + 1) {
              unint64_t v8 = v7 + 1;
            }
            if ((unint64_t)((char *)v32 - (char *)values) >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v9 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v9 = v8;
            }
            if (v9) {
              uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RXRecognitionSystem *>>((uint64_t)&v32, v9);
            }
            else {
              uint64_t v10 = 0;
            }
            CFDataRef v11 = (void **)&v10[8 * v7];
            *CFDataRef v11 = (void *)v6;
            uint64_t v3 = (uint64_t *)(v11 + 1);
            int v13 = values;
            int v12 = v31;
            if (v31 != values)
            {
              do
              {
                uint64_t v14 = *--v12;
                *--CFDataRef v11 = v14;
              }
              while (v12 != v13);
              int v12 = values;
            }
            values = v11;
            v31 = (void **)v3;
            v32 = (uint64_t *)&v10[8 * v9];
            if (v12) {
              operator delete(v12);
            }
          }
          else
          {
            *v3++ = v6;
          }
          v31 = (void **)v3;
          ++v4;
          uint64_t v5 = *((void *)this + 20);
        }
        while (v4 < (*((void *)this + 21) - v5) >> 3);
        CFArrayRef v15 = CFArrayCreate(0, (const void **)values, ((char *)v3 - (char *)values) >> 3, MEMORY[0x263EFFF70]);
        if (*(double *)&values != 0.0)
        {
          v31 = values;
          operator delete(values);
        }
        return v15;
      }
      uint64_t v21 = *((void *)this + 20);
      if (v21 != *((void *)this + 21))
      {
        CFArrayRef v22 = *(uint64_t (**)(void))(**(void **)v21 + 64);
        return (CFArrayRef)v22();
      }
      return 0;
    }
    BOOL v18 = (const void **)MEMORY[0x263EFFB40];
    uint64_t v19 = (const void **)MEMORY[0x263EFFB38];
    BOOL v20 = (*((void *)this + 1) & 2) == 0;
    goto LABEL_58;
  }
  return CFNumberCreate(0, kCFNumberSInt64Type, (char *)this + 208);
}

void sub_22BF91D94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

CFMutableStringRef RXLanguageObject::CopyText(RXLanguageObject *this)
{
  return RXLanguageObject::CopyTextWithLocale(this, 0);
}

CFArrayRef RXLanguageObject::CopyTextVariants(RXLanguageObject *this)
{
  return RXLanguageObject::CopyTextVariantsWithLocale(this, 0);
}

CFArrayRef RXLanguageObject::CopyPropertyWithLocale(RXLanguageObject *this, int a2, const __CFLocale *a3)
{
  if (a2 == 1819571826) {
    return RXLanguageObject::CopyTextVariantsWithLocale(this, a3);
  }
  if (a2 == 1819572340) {
    return (CFArrayRef)RXLanguageObject::CopyTextWithLocale(this, a3);
  }
  return (CFArrayRef)(*(uint64_t (**)(void))(*(void *)this + 64))();
}

CFMutableStringRef RXLanguageObject::CopyTextWithLocale(RXLanguageObject *this, const __CFLocale *a2)
{
  int v3 = *((_DWORD *)this + 10);
  if ((v3 - 2) >= 2 && (v3 != 1 || !*((void *)this + 7)))
  {
    CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
    if (a2) {
      CFStringRef v8 = (const __CFString *)MEMORY[0x230F59AB0](a2);
    }
    else {
      CFStringRef v8 = @"en_US";
    }
    BOOL v9 = RXIsLocaleWithNoSpaceInPostITN(v8);
    uint64_t v10 = @" ";
    if (v9)
    {
      uint64_t v10 = &stru_26DF660C0;
      CFDataRef v11 = @"|";
    }
    else
    {
      CFDataRef v11 = @" | ";
    }
    int v12 = *((_DWORD *)this + 10);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 0x40000000;
    v13[2] = ___ZN16RXLanguageObject18CopyTextWithLocaleEPK10__CFLocale_block_invoke;
    v13[3] = &__block_descriptor_tmp_3;
    v13[4] = (char *)this - 16;
    v13[5] = a2;
    if (v12 != 1) {
      uint64_t v10 = v11;
    }
    v13[6] = Mutable;
    v13[7] = v10;
    RXLanguageObject::ApplyBlock((uint64_t)this, (uint64_t)v13, 2uLL);
    return Mutable;
  }
  uint64_t v5 = (const void *)*((void *)this + 7);
  if (!v5) {
    return 0;
  }
  return (CFMutableStringRef)CFRetain(v5);
}

CFArrayRef RXLanguageObject::CopyTextVariantsWithLocale(RXLanguageObject *this, const __CFLocale *a2)
{
  CFArrayRef v3 = (const __CFArray *)*((void *)this + 10);
  if (v3)
  {
LABEL_2:
    return CFArrayCreateCopy(0, v3);
  }
  uint64_t v5 = this;
  while (1)
  {
    unsigned int v6 = *((_DWORD *)v5 + 10);
    if (v6 != 1) {
      break;
    }
    if (*((void *)v5 + 7))
    {
LABEL_17:
      uint64_t v10 = *((void *)v5 + 7);
      BOOL v9 = (const void **)((char *)v5 + 56);
      if (v10)
      {
        CFDataRef v11 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
        values = CFArrayCreate(0, v9, 1, MEMORY[0x263EFFF70]);
        CFArrayRef Mutable = CFArrayCreate(0, (const void **)&values, 1, v11);
        CFRelease(values);
        return Mutable;
      }
      int v13 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
      return CFArrayCreate(0, 0, 0, v13);
    }
    uint64_t v7 = (RXLanguageObject **)*((void *)v5 + 20);
    if (*((void *)v5 + 21) - (void)v7 != 8)
    {
      CFArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
      uint64_t v14 = *((void *)v5 + 20);
      if (*((void *)v5 + 21) == v14) {
        return Mutable;
      }
      unint64_t v15 = 0;
      CFBooleanRef v16 = (const CFArrayCallBacks *)MEMORY[0x263EFFF70];
      while (2)
      {
        CFArrayRef v17 = (const __CFArray *)RXLanguageObject::CopyTextVariantsWithLocale(*(RXLanguageObject **)(v14 + 8 * v15), 0);
        CFIndex Count = CFArrayGetCount(v17);
        CFIndex v19 = CFArrayGetCount(Mutable);
        CFIndex v20 = v19;
        if (v19) {
          CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(Mutable, v19 - 1);
        }
        else {
          CFArrayRef ValueAtIndex = 0;
        }
        if (Count == 1)
        {
          CFArrayRef v22 = (const __CFArray *)CFArrayGetValueAtIndex(v17, 0);
          if (!v20) {
            goto LABEL_41;
          }
        }
        else
        {
          CFArrayRef v22 = 0;
          if (!v20) {
            goto LABEL_41;
          }
        }
        CFIndex v23 = CFArrayGetCount(ValueAtIndex);
        BOOL v24 = Count == 1 && v23 == 1;
        if (v24 && CFArrayGetCount(v22) == 1)
        {
          values = 0;
          CFStringRef v25 = (const __CFString *)CFArrayGetValueAtIndex(ValueAtIndex, 0);
          values = CFStringCreateMutableCopy(0, 0, v25);
          if (a2) {
            CFStringRef v26 = (const __CFString *)MEMORY[0x230F59AB0](a2);
          }
          else {
            CFStringRef v26 = @"en_US";
          }
          if (!RXIsLocaleWithNoSpaceInPostITN(v26)) {
            CFStringAppend((CFMutableStringRef)values, @" ");
          }
          uint64_t v27 = (__CFString *)values;
          CFStringRef v28 = (const __CFString *)CFArrayGetValueAtIndex(v22, 0);
          CFStringAppend(v27, v28);
          CFArrayRef v29 = CFArrayCreate(0, (const void **)&values, 1, v16);
          CFArraySetValueAtIndex(Mutable, v20 - 1, v29);
          CFRelease(v29);
          CFRelease(values);
        }
        else
        {
LABEL_41:
          v42.location = 0;
          v42.size_t length = Count;
          CFArrayAppendArray(Mutable, v17, v42);
        }
        CFRelease(v17);
        ++v15;
        uint64_t v14 = *((void *)v5 + 20);
        if (v15 >= (*((void *)v5 + 21) - v14) >> 3) {
          return Mutable;
        }
        continue;
      }
    }
LABEL_15:
    a2 = 0;
    uint64_t v5 = *v7;
    CFArrayRef v3 = (const __CFArray *)*((void *)*v7 + 10);
    if (v3) {
      goto LABEL_2;
    }
  }
  if (v6 - 2 < 2) {
    goto LABEL_17;
  }
  uint64_t v7 = (RXLanguageObject **)*((void *)v5 + 20);
  if (v6 <= 1 && *((void *)v5 + 21) - (void)v7 == 8) {
    goto LABEL_15;
  }
  if (v6) {
    return 0;
  }
  CFArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  uint64_t v30 = *((void *)v5 + 20);
  if (*((void *)v5 + 21) != v30)
  {
    unint64_t v31 = 0;
    do
    {
      CFArrayRef v32 = (const __CFArray *)RXLanguageObject::CopyTextVariantsWithLocale(*(RXLanguageObject **)(v30 + 8 * v31), 0);
      CFIndex v33 = CFArrayGetCount(v32);
      CFIndex v34 = CFArrayGetCount(Mutable);
      if (v34 >= v33) {
        unint64_t v35 = v33;
      }
      else {
        unint64_t v35 = v34;
      }
      if (v33)
      {
        for (unint64_t i = 0; i != v33; ++i)
        {
          CFArrayRef v37 = (const __CFArray *)CFArrayGetValueAtIndex(v32, i);
          if (i >= v35)
          {
            CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(0, 0, v37);
            CFArrayAppendValue(Mutable, MutableCopy);
            CFRelease(MutableCopy);
          }
          else
          {
            v38 = (__CFArray *)CFArrayGetValueAtIndex(Mutable, i);
            v43.size_t length = CFArrayGetCount(v37);
            v43.location = 0;
            CFArrayAppendArray(v38, v32, v43);
          }
        }
      }
      if (v32) {
        CFRelease(v32);
      }
      ++v31;
      uint64_t v30 = *((void *)v5 + 20);
    }
    while (v31 < (*((void *)v5 + 21) - v30) >> 3);
  }
  return Mutable;
}

void RXLanguageObject::SetProperty(RXLanguageObject *this, int a2, CFTypeRef cf)
{
  int v5 = *((_DWORD *)this + 10);
  if ((v5 & 0xFFFFFFFE) == 4)
  {
    uint64_t v6 = *((void *)this + 20);
    if (v6 != *((void *)this + 21))
    {
      uint64_t v7 = *(void (**)(void))(**(void **)v6 + 80);
      v7();
    }
    return;
  }
  if (a2 <= 1819173228)
  {
    if (a2 != 1818326372)
    {
      if (a2 == 1818453097)
      {
        uint64_t v10 = (CFTypeRef *)((char *)this + 96);
      }
      else
      {
        if (a2 != 1818457193)
        {
LABEL_28:
          RXObject::SetProperty(this, a2, cf);
          return;
        }
        uint64_t v10 = (CFTypeRef *)((char *)this + 88);
      }
      goto LABEL_39;
    }
    RXObject::PropertyReadOnly(this, 1818326372);
  }
  else
  {
    if (a2 <= 1819439219)
    {
      if (a2 != 1819173229)
      {
        if (a2 == 1819242612)
        {
          int v8 = (*((void *)this + 1) & 4) == 0;
          if (CFBooleanGetValue((CFBooleanRef)cf) != v8) {
            return;
          }
          (*(void (**)(RXLanguageObject *))(*(void *)this + 88))(this);
          uint64_t v9 = *((void *)this + 1) ^ 4;
LABEL_35:
          *((void *)this + 1) = v9;
          return;
        }
        goto LABEL_28;
      }
      int v13 = (CFTypeRef *)((char *)this + 48);
      uint64_t v12 = *(void *)this;
      goto LABEL_38;
    }
    if (a2 == 1819439220)
    {
      int v14 = (*((void *)this + 1) & 8) == 0;
      if (CFBooleanGetValue((CFBooleanRef)cf) != v14) {
        return;
      }
      (*(void (**)(RXLanguageObject *))(*(void *)this + 88))(this);
      uint64_t v9 = *((void *)this + 1) ^ 8;
      goto LABEL_35;
    }
    if (a2 != 1819572340) {
      goto LABEL_28;
    }
    if (v5 == 1)
    {
      int v13 = (CFTypeRef *)((char *)this + 56);
      uint64_t v12 = *(void *)this;
LABEL_38:
      (*(void (**)(RXLanguageObject *))(v12 + 88))(this);
      uint64_t v10 = v13;
LABEL_39:
      RXCFProp<void const*>::operator=(v10, cf);
      return;
    }
    if (v5 == 2)
    {
      if (!cf) {
        __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXLanguageObject.cpp", 146, (uint64_t)"value", @"Word cannot have NULL text");
      }
      (*(void (**)(RXLanguageObject *))(*(void *)this + 88))(this);
      RXCFProp<void const*>::operator=((CFTypeRef *)this + 7, cf);
      CFDataRef v11 = (const void *)*((void *)this + 8);
      if (v11) {
        CFRelease(v11);
      }
      *((void *)this + 8) = 0;
    }
    else
    {
      __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXLanguageObject.cpp", 154, 0, @"kRXLanguageObjectProperty_Text is settable only on words or paths");
    }
  }
}

BOOL RXLanguageObject::ApplyBlock(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = a1;
  for (unsigned int i = *(_DWORD *)(a1 + 40); (i & 0xFFFFFFFE) == 4; unsigned int i = *(_DWORD *)(*v7 + 40))
  {
    uint64_t v7 = *(uint64_t **)(v5 + 160);
    if (v7 == *(uint64_t **)(v5 + 168)) {
      return 1;
    }
    uint64_t v5 = *v7;
  }
  if ((a3 & 1) != 0 || i > 1)
  {
    unint64_t v11 = a3 & 0xFFFFFFFFFFFFFFE7;
    uint64_t v12 = v5 - 16;
    return ((*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(a2 + 16))(a2, v12, v11) & 4) == 0;
  }
  char v8 = a3 & 2;
  if ((a3 & 8) == 0)
  {
LABEL_8:
    if ((v8 & 2) != 0) {
      unint64_t v9 = a3 & 0xFFFFFFFFFFFFFFFCLL | 1;
    }
    else {
      unint64_t v9 = a3;
    }
    for (j = *(void **)(v5 + 160); j != *(void **)(v5 + 168); ++j)
    {
      if ((RXLanguageObject::ApplyBlock(*j, a2, v9) & 1) == 0) {
        return 0;
      }
    }
    if ((a3 & 0x10) == 0) {
      return 1;
    }
    uint64_t v12 = v5 - 16;
    unint64_t v11 = a3 & 0xFFFFFFFFFFFFFFF7;
    return ((*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(a2 + 16))(a2, v12, v11) & 4) == 0;
  }
  char v13 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(a2 + 16))(a2, v5 - 16, a3 & 0xFFFFFFFFFFFFFFEFLL);
  if ((v13 & 4) != 0) {
    return 0;
  }
  if ((v13 & 1) == 0)
  {
    v8 |= v13;
    goto LABEL_8;
  }
  return 1;
}

uint64_t ___ZN16RXLanguageObject18CopyTextWithLocaleEPK10__CFLocale_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32) != a2)
  {
    if (a2) {
      uint64_t v3 = a2 + 16;
    }
    else {
      uint64_t v3 = 0;
    }
    CFStringRef v4 = (const __CFString *)(*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)v3 + 72))(v3, 1819572340, *(void *)(a1 + 40));
    if (CFStringGetLength(*(CFStringRef *)(a1 + 48))) {
      CFStringAppend(*(CFMutableStringRef *)(a1 + 48), *(CFStringRef *)(a1 + 56));
    }
    if (v4) {
      CFStringRef v5 = v4;
    }
    else {
      CFStringRef v5 = @"\"\"";
    }
    CFStringAppend(*(CFMutableStringRef *)(a1 + 48), v5);
    if (v4) {
      CFRelease(v4);
    }
  }
  return 0;
}

void RXLanguageObject::~RXLanguageObject(RXLanguageObject *this)
{
  *(void *)this = &unk_26DF65960;
  uint64_t v3 = (void *)*((void *)this + 20);
  for (unsigned int i = (void *)*((void *)this + 21); v3 != i; unsigned int i = (void *)*((void *)this + 21))
    CFRelease((CFTypeRef)(*v3++ - 16));
  CFStringRef v4 = (RXResultDesc *)*((void *)this + 23);
  if (v4) {
    RXResultDesc::DeleteRef(v4);
  }
  CFStringRef v5 = (void *)*((void *)this + 20);
  if (v5)
  {
    *((void *)this + 21) = v5;
    operator delete(v5);
  }
  RXProp<RXVocabulary *>::~RXProp((void *)this + 19);
  uint64_t v6 = (void *)*((void *)this + 16);
  if (v6)
  {
    *((void *)this + 17) = v6;
    operator delete(v6);
  }
  uint64_t v7 = (void *)*((void *)this + 13);
  if (v7)
  {
    *((void *)this + 14) = v7;
    operator delete(v7);
  }
  RXCFProp<__CFString const*>::~RXCFProp((const void **)this + 12);
  RXCFProp<__CFString const*>::~RXCFProp((const void **)this + 11);
  RXCFProp<__CFArray const*>::~RXCFProp((const void **)this + 10);
  RXCFProp<__CFURL const*>::~RXCFProp((const void **)this + 9);
  RXCFProp<__CFString const*>::~RXCFProp((const void **)this + 8);
  RXCFProp<__CFString const*>::~RXCFProp((const void **)this + 7);
  RXCFProp<__CFString const*>::~RXCFProp((const void **)this + 6);
  RXObject::~RXObject(this, v8, v9);
}

{
  uint64_t vars8;

  RXLanguageObject::~RXLanguageObject(this);
  JUMPOUT(0x230F59F90);
}

CFTypeRef RXLanguageObject::InitializeModel(RXLanguageObject *this, const __CFString *a2, const __CFURL *a3, const void *a4)
{
  *((_DWORD *)this + 10) = 0;
  RXCFProp<void const*>::operator=((CFTypeRef *)this + 6, a2);
  RXCFProp<void const*>::operator=((CFTypeRef *)this + 9, a3);
  return RXCFProp<void const*>::operator=((CFTypeRef *)this + 4, a4);
}

CFTypeRef RXLanguageObject::InitializePath(RXLanguageObject *this, const __CFString *a2, const void *a3)
{
  *((_DWORD *)this + 10) = 1;
  RXCFProp<void const*>::operator=((CFTypeRef *)this + 6, a2);
  return RXCFProp<void const*>::operator=((CFTypeRef *)this + 4, a3);
}

CFTypeRef RXLanguageObject::InitializeWord(RXLanguageObject *this, RXVocabulary *a2, const __CFString *a3, const void *a4)
{
  *((_DWORD *)this + 10) = 2;
  RXProp<RXRecognitionSystem *>::operator=((void *)this + 19, (uint64_t)a2);
  RXCFProp<void const*>::operator=((CFTypeRef *)this + 7, a3);
  return RXCFProp<void const*>::operator=((CFTypeRef *)this + 4, a4);
}

CFTypeRef RXLanguageObject::InitializeAdLib(RXLanguageObject *this, const __CFString *a2, RXVocabulary *a3, const void *a4)
{
  *((_DWORD *)this + 10) = 3;
  RXProp<RXRecognitionSystem *>::operator=((void *)this + 19, (uint64_t)a3);
  CFTypeRef result = RXCFProp<void const*>::operator=((CFTypeRef *)this + 4, a4);
  *((void *)this + 1) |= 8uLL;
  return result;
}

uint64_t RXLanguageObject::GetCount(RXLanguageObject *this)
{
  while (1)
  {
    unsigned int v1 = *((_DWORD *)this + 10);
    if ((v1 & 0xFFFFFFFE) != 4) {
      break;
    }
    uint64_t v2 = (RXLanguageObject **)*((void *)this + 20);
    if (v2 == *((RXLanguageObject ***)this + 21)) {
      return -1;
    }
    this = *v2;
  }
  if (v1 <= 1) {
    return (uint64_t)(*((void *)this + 21) - *((void *)this + 20)) >> 3;
  }
  return -1;
}

void RXLanguageObject::AddObject(RXLanguageObject *this, RXLanguageObject *a2)
{
  uint64_t v3 = this;
  for (unsigned int i = *((_DWORD *)this + 10); (i & 0xFFFFFFFE) == 4; unsigned int i = *((_DWORD *)*v5 + 10))
  {
    CFStringRef v5 = (RXLanguageObject **)*((void *)v3 + 20);
    if (v5 == *((RXLanguageObject ***)v3 + 21)) {
      return;
    }
    uint64_t v3 = *v5;
  }
  if (i >= 2) {
    __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXLanguageObject.cpp", 489, (uint64_t)"CanBeParent()", &stru_26DF660C0);
  }
  CFRetain((char *)a2 - 16);
  (*(void (**)(RXLanguageObject *))(*(void *)v3 + 88))(v3);
  unint64_t v6 = *((void *)v3 + 22);
  uint64_t v7 = (void *)*((void *)v3 + 21);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = *((void *)v3 + 20);
    uint64_t v10 = ((uint64_t)v7 - v9) >> 3;
    if ((unint64_t)(v10 + 1) >> 61) {
      std::vector<RXRecognitionSystem *>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v6 - v9;
    uint64_t v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1)) {
      uint64_t v12 = v10 + 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    if (v13) {
      int v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RXRecognitionSystem *>>((uint64_t)v3 + 176, v13);
    }
    else {
      int v14 = 0;
    }
    unint64_t v15 = &v14[8 * v10];
    CFBooleanRef v16 = &v14[8 * v13];
    *(void *)unint64_t v15 = a2;
    uint64_t v8 = v15 + 8;
    BOOL v18 = (char *)*((void *)v3 + 20);
    CFArrayRef v17 = (char *)*((void *)v3 + 21);
    if (v17 != v18)
    {
      do
      {
        uint64_t v19 = *((void *)v17 - 1);
        v17 -= 8;
        *((void *)v15 - 1) = v19;
        v15 -= 8;
      }
      while (v17 != v18);
      CFArrayRef v17 = (char *)*((void *)v3 + 20);
    }
    *((void *)v3 + 20) = v15;
    *((void *)v3 + 21) = v8;
    *((void *)v3 + 22) = v16;
    if (v17) {
      operator delete(v17);
    }
  }
  else
  {
    *uint64_t v7 = a2;
    uint64_t v8 = v7 + 1;
  }
  *((void *)v3 + 21) = v8;
}

uint64_t RXLanguageObject::GetObject(RXLanguageObject *this, unint64_t a2)
{
  uint64_t v3 = this;
  if ((*((_DWORD *)this + 10) & 0xFFFFFFFE) == 4)
  {
    do
    {
      CFStringRef v4 = (RXLanguageObject **)*((void *)v3 + 20);
      if (v4 == *((RXLanguageObject ***)v3 + 21))
      {
        __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXLanguageObject.cpp", 500, (uint64_t)"!fChildren.empty()", &stru_26DF660C0);
        CFStringRef v4 = (RXLanguageObject **)*((void *)v3 + 20);
      }
      uint64_t v3 = *v4;
    }
    while ((*((_DWORD *)*v4 + 10) & 0xFFFFFFFE) == 4);
  }
  if ((a2 & 0x8000000000000000) != 0 || (uint64_t v5 = *((void *)v3 + 20), a2 >= (*((void *)v3 + 21) - v5) >> 3))
  {
    __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXLanguageObject.cpp", 504, (uint64_t)"at >= 0 && at < fChildren.size()", &stru_26DF660C0);
    uint64_t v5 = *((void *)v3 + 20);
  }
  return *(void *)(v5 + 8 * a2);
}

void RXLanguageObject::SetObject(RXLanguageObject *this, unint64_t a2, RXLanguageObject *a3)
{
  uint64_t v5 = this;
  if ((*((_DWORD *)this + 10) & 0xFFFFFFFE) == 4)
  {
    do
    {
      unint64_t v6 = (RXLanguageObject **)*((void *)v5 + 20);
      if (v6 == *((RXLanguageObject ***)v5 + 21))
      {
        __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXLanguageObject.cpp", 514, (uint64_t)"!fChildren.empty()", &stru_26DF660C0);
        unint64_t v6 = (RXLanguageObject **)*((void *)v5 + 20);
      }
      uint64_t v5 = *v6;
    }
    while ((*((_DWORD *)*v6 + 10) & 0xFFFFFFFE) == 4);
  }
  if ((a2 & 0x8000000000000000) != 0 || a2 >= (uint64_t)(*((void *)v5 + 21) - *((void *)v5 + 20)) >> 3) {
    __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXLanguageObject.cpp", 520, (uint64_t)"at >= 0 && at < fChildren.size()", &stru_26DF660C0);
  }
  (*(void (**)(RXLanguageObject *))(*(void *)v5 + 88))(v5);
  CFRetain((char *)a3 - 16);
  CFIndex v7 = CFGetRetainCount((CFTypeRef)(*(void *)(*((void *)v5 + 20) + 8 * a2) - 16));
  uint64_t v8 = *(void *)(*((void *)v5 + 20) + 8 * a2);
  if (v7 > 1) {
    *(void *)(v8 + 16) &= ~*((void *)v5 + 2);
  }
  CFRelease((CFTypeRef)(v8 - 16));
  *(void *)(*((void *)v5 + 20) + 8 * a2) = a3;
}

void RXLanguageObject::RemoveObject(RXLanguageObject *this, unint64_t a2)
{
  uint64_t v3 = this;
  if ((*((_DWORD *)this + 10) & 0xFFFFFFFE) == 4)
  {
    do
    {
      CFStringRef v4 = (RXLanguageObject **)*((void *)v3 + 20);
      if (v4 == *((RXLanguageObject ***)v3 + 21))
      {
        __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXLanguageObject.cpp", 539, (uint64_t)"!fChildren.empty()", &stru_26DF660C0);
        CFStringRef v4 = (RXLanguageObject **)*((void *)v3 + 20);
      }
      uint64_t v3 = *v4;
    }
    while ((*((_DWORD *)*v4 + 10) & 0xFFFFFFFE) == 4);
  }
  if ((a2 & 0x8000000000000000) != 0 || a2 >= (uint64_t)(*((void *)v3 + 21) - *((void *)v3 + 20)) >> 3) {
    __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXLanguageObject.cpp", 545, (uint64_t)"at >= 0 && at < fChildren.size()", &stru_26DF660C0);
  }
  (*(void (**)(RXLanguageObject *))(*(void *)v3 + 88))(v3);
  CFIndex v5 = CFGetRetainCount((CFTypeRef)(*(void *)(*((void *)v3 + 20) + 8 * a2) - 16));
  uint64_t v6 = *(void *)(*((void *)v3 + 20) + 8 * a2);
  if (v5 > 1) {
    *(void *)(v6 + 16) &= ~*((void *)v3 + 2);
  }
  CFRelease((CFTypeRef)(v6 - 16));
  uint64_t v7 = *((void *)v3 + 21);
  uint64_t v8 = *((void *)v3 + 20) + 8 * a2;
  uint64_t v9 = v7 - (v8 + 8);
  if (v7 != v8 + 8) {
    memmove((void *)v8, (const void *)(v8 + 8), v7 - (v8 + 8));
  }
  *((void *)v3 + 21) = v8 + v9;
}

void RXLanguageObject::Serialize(RXLanguageObject *this, void *a2, RXRecognitionSystem *a3)
{
  if (RXObject::ShouldSerialize(this, a3))
  {
    xpc_object_t XPCDesc = (RXXPC *)RXObject::CreateXPCDesc(this, *((int *)this + 10) + 10, (uint64_t **)a3);
    uint64_t v8 = XPCDesc;
    uint64_t v9 = *((void *)this + 1);
    if ((v9 & 0xC) != 0) {
      xpc_dictionary_set_uint64(XPCDesc, kRDKeyOptions, v9);
    }
    if (*((void *)this + 7))
    {
      RXLanguageObject::NormalizeText(this, *((const __CFLocale **)a3 + 6));
      RXXPC::SerializeCFString(v8, kRDKeyText, *((CFStringRef *)this + 8), v10);
    }
    CFStringRef v11 = (const __CFString *)*((void *)this + 12);
    if (v11) {
      RXXPC::SerializeCFString(v8, kRDKeyCommandID, v11, v7);
    }
    CFStringRef v12 = (const __CFString *)*((void *)this + 11);
    if (v12) {
      RXXPC::SerializeCFString(v8, kRDKeyCategoryID, v12, v7);
    }
    unint64_t v13 = (void *)*((void *)this + 9);
    if (v13) {
      RXXPC::SerializeURL(v8, v13, (const __CFURL *)v12);
    }
    uint64_t v14 = *((void *)this + 19);
    if (v14)
    {
      xpc_dictionary_set_uint64(v8, kRDKeyVocabulary, v14);
      RXRecognitionSystem::ReachableObject((uint64_t **)a3, *((RXObject **)this + 19));
    }
    if (*((_DWORD *)this + 10) <= 1u)
    {
      xpc_object_t v15 = xpc_array_create(0, 0);
      uint64_t v16 = *((void *)this + 20);
      if (*((void *)this + 21) != v16)
      {
        unint64_t v17 = 0;
        do
        {
          xpc_array_set_uint64(v15, 0xFFFFFFFFFFFFFFFFLL, *(void *)(v16 + 8 * v17++));
          uint64_t v16 = *((void *)this + 20);
        }
        while (v17 < (*((void *)this + 21) - v16) >> 3);
      }
      xpc_dictionary_set_value(v8, kRDKeyChildren, v15);
      xpc_release(v15);
    }
    if (*((unsigned char *)this + 8)) {
      xpc_dictionary_set_BOOL(v8, kRDKeyTopLevelLM, 1);
    }
    xpc_array_append_value(a2, v8);
    xpc_release(v8);
  }
}

void RXLanguageObject::NormalizeText(RXLanguageObject *this, const __CFLocale *a2)
{
  CFStringRef v3 = (const __CFString *)*((void *)this + 7);
  if (v3)
  {
    CFStringRef v4 = (CFTypeRef *)((char *)this + 64);
    if (!*((void *)this + 8))
    {
      CFIndex Length = CFStringGetLength(v3);
      CFStringRef v7 = (const __CFString *)*((void *)this + 7);
      CFStringRef theString = v7;
      uint64_t v35 = 0;
      CFIndex v36 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v7);
      CStringPtr = 0;
      CFIndex v33 = CharactersPtr;
      if (!CharactersPtr) {
        CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
      }
      int64_t v37 = 0;
      int64_t v38 = 0;
      CFIndex v34 = CStringPtr;
      if (Length < 1)
      {
        uint64_t v12 = 0;
        uint64_t v13 = 0;
      }
      else
      {
        uint64_t v10 = 0;
        int64_t v11 = 0;
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        uint64_t v14 = 64;
        do
        {
          if ((unint64_t)v11 >= 4) {
            uint64_t v15 = 4;
          }
          else {
            uint64_t v15 = v11;
          }
          CFIndex v16 = v36;
          if (v36 <= v11)
          {
            UniChar v17 = 0;
          }
          else if (v33)
          {
            UniChar v17 = v33[v11 + v35];
          }
          else if (v34)
          {
            UniChar v17 = v34[v35 + v11];
          }
          else
          {
            int64_t v20 = v37;
            if (v38 <= v11 || v37 > v11)
            {
              uint64_t v22 = -v15;
              uint64_t v23 = v15 + v10;
              uint64_t v24 = v14 - v15;
              int64_t v25 = v11 + v22;
              CFIndex v26 = v25 + 64;
              if (v25 + 64 >= v36) {
                CFIndex v26 = v36;
              }
              int64_t v37 = v25;
              int64_t v38 = v26;
              if (v36 >= v24) {
                CFIndex v16 = v24;
              }
              v39.size_t length = v16 + v23;
              v39.location = v25 + v35;
              CFStringGetCharacters(theString, v39, buffer);
              int64_t v20 = v37;
            }
            UniChar v17 = buffer[v11 - v20];
          }
          switch(u_charType(v17))
          {
            case 1:
            case 3:
              if (v12) {
                BOOL v18 = v13 == 0;
              }
              else {
                BOOL v18 = 0;
              }
              if (v18) {
                uint64_t v19 = 2;
              }
              else {
                uint64_t v19 = 1;
              }
              v13 += v19;
              break;
            case 2:
              ++v12;
              break;
            case 9:
              CFMutableArrayRef MutableCopy = CFStringCreateMutableCopy(0, 0, *((CFStringRef *)this + 7));
              goto LABEL_48;
            default:
              break;
          }
          if (++v11 >= Length) {
            break;
          }
          --v10;
          ++v14;
        }
        while (v13 < 2);
        if (v13 >= 1)
        {
          uint64_t v27 = (const void *)*((void *)this + 7);
          CFStringRef v28 = (CFTypeRef *)((char *)this + 64);
LABEL_44:
          RXCFProp<void const*>::operator=(v28, v27);
          return;
        }
      }
      if (!v13 && v12 != 1)
      {
        CFStringRef v28 = (CFTypeRef *)((char *)this + 64);
        uint64_t v27 = (const void *)*((void *)this + 7);
        goto LABEL_44;
      }
      CFArrayRef v29 = CFStringCreateMutableCopy(0, 0, *((CFStringRef *)this + 7));
      CFMutableArrayRef MutableCopy = v29;
      if (v13) {
        CFStringLowercase(v29, a2);
      }
      else {
LABEL_48:
      }
        CFStringUppercase(MutableCopy, a2);
      RXCFProp<void const*>::operator=(v4, MutableCopy);
      CFRelease(MutableCopy);
    }
  }
}

uint64_t RXLanguageObject::CreateFromSerialized(RXLanguageObject *this, void *a2, RXResultDesc *a3)
{
  if (!gRXCFTypeID_RXLanguageObject)
  {
    qword_26B6E3B48 = (uint64_t)RXCFCopyFormattingDesc;
    qword_26B6E3B50 = (uint64_t)RXCFCopyDebugDesc;
    gRXCFTypeID_RXLanguageObject = _CFRuntimeRegisterClass();
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (Instance) {
    uint64_t v6 = Instance + 16;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2)
  {
    ++*a2;
    *(void *)(v6 + 184) = a2;
  }
  v58 = a2;
  if (xpc_dictionary_get_int64(this, kRDKeyObjectType) == 14)
  {
    *(_DWORD *)(v6 + 40) = 4;
    if (xpc_dictionary_get_BOOL(this, kRDKeyIsHypothesis)) {
      *(void *)(v6 + 8) |= 2uLL;
    }
  }
  else if (xpc_dictionary_get_int64(this, kRDKeyObjectType) == 15)
  {
    *(_DWORD *)(v6 + 40) = 5;
  }
  else
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(this, kRDKeyObjectID);
    *(_DWORD *)(v6 + 40) = *(_DWORD *)(uint64 + 40);
    RXCFProp<void const*>::operator=((CFTypeRef *)(v6 + 32), *(CFTypeRef *)(uint64 + 32));
    RXCFProp<void const*>::operator=((CFTypeRef *)(v6 + 48), *(CFTypeRef *)(uint64 + 48));
    RXCFProp<void const*>::operator=((CFTypeRef *)(v6 + 56), *(CFTypeRef *)(uint64 + 56));
    RXCFProp<void const*>::operator=((CFTypeRef *)(v6 + 72), *(CFTypeRef *)(uint64 + 72));
    RXProp<RXRecognitionSystem *>::operator=((void *)(v6 + 152), *(void *)(uint64 + 152));
    xpc_object_t value = xpc_dictionary_get_value(this, kRDKeyText);
    if (value)
    {
      string_ptr = xpc_string_get_string_ptr(value);
      CFStringRef v10 = CFStringCreateWithCString(0, string_ptr, 0x8000100u);
      RXCFProp<void const*>::operator=((CFTypeRef *)(v6 + 56), v10);
      if (v10) {
        CFRelease(v10);
      }
    }
    int64_t v11 = (void **)(v6 + 104);
    *(void *)(v6 + 112) = *(void *)(v6 + 104);
    v59 = (void **)(v6 + 128);
    *(void *)(v6 + 136) = *(void *)(v6 + 128);
    xpc_object_t v12 = xpc_dictionary_get_value(this, kRDKeyTextVariants);
    if (v12)
    {
      uint64_t v13 = v12;
      size_t v14 = 0;
      __p = 0;
      v62 = 0;
      v63 = 0;
      while (v14 < xpc_array_get_count(v13))
      {
        xpc_object_t v15 = xpc_array_get_value(v13, v14);
        xpc_dictionary_get_value(v15, kRDKeyText);
        uint64_t v16 = _CFXPCCreateCFObjectFromXPCObject();
        uint64_t v17 = v16;
        BOOL v18 = v62;
        if (v62 >= v63)
        {
          uint64_t v20 = ((char *)v62 - (unsigned char *)__p) >> 3;
          if ((unint64_t)(v20 + 1) >> 61) {
            std::vector<RXRecognitionSystem *>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v21 = ((char *)v63 - (unsigned char *)__p) >> 2;
          if (v21 <= v20 + 1) {
            unint64_t v21 = v20 + 1;
          }
          if ((unint64_t)((char *)v63 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v22 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v22 = v21;
          }
          if (v22) {
            uint64_t v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RXRecognitionSystem *>>((uint64_t)&v63, v22);
          }
          else {
            uint64_t v23 = 0;
          }
          uint64_t v24 = (uint64_t *)&v23[8 * v20];
          uint64_t *v24 = v17;
          uint64_t v19 = v24 + 1;
          CFIndex v26 = (char *)__p;
          int64_t v25 = (char *)v62;
          if (v62 != __p)
          {
            do
            {
              uint64_t v27 = *((void *)v25 - 1);
              v25 -= 8;
              *--uint64_t v24 = v27;
            }
            while (v25 != v26);
            int64_t v25 = (char *)__p;
          }
          __p = v24;
          v62 = v19;
          v63 = (uint64_t *)&v23[8 * v22];
          if (v25) {
            operator delete(v25);
          }
        }
        else
        {
          uint64_t *v62 = v16;
          uint64_t v19 = v18 + 1;
        }
        v62 = v19;
        uint64_t v28 = xpc_dictionary_get_uint64(v15, kRDKeyStartTime);
        uint64_t v29 = v28;
        unint64_t v31 = *(char **)(v6 + 112);
        unint64_t v30 = *(void *)(v6 + 120);
        if ((unint64_t)v31 >= v30)
        {
          CFIndex v33 = (char *)*v11;
          uint64_t v34 = (v31 - (unsigned char *)*v11) >> 3;
          unint64_t v35 = v34 + 1;
          if ((unint64_t)(v34 + 1) >> 61) {
            std::vector<RXRecognitionSystem *>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v36 = v30 - (void)v33;
          if (v36 >> 2 > v35) {
            unint64_t v35 = v36 >> 2;
          }
          if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v37 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v37 = v35;
          }
          if (v37)
          {
            int64_t v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RXRecognitionSystem *>>(v6 + 120, v37);
            CFIndex v33 = *(char **)(v6 + 104);
            unint64_t v31 = *(char **)(v6 + 112);
          }
          else
          {
            int64_t v38 = 0;
          }
          CFRange v39 = (uint64_t *)&v38[8 * v34];
          *CFRange v39 = v29;
          CFArrayRef v32 = v39 + 1;
          while (v31 != v33)
          {
            uint64_t v40 = *((void *)v31 - 1);
            v31 -= 8;
            *--CFRange v39 = v40;
          }
          *(void *)(v6 + 104) = v39;
          *(void *)(v6 + 112) = v32;
          *(void *)(v6 + 120) = &v38[8 * v37];
          if (v33) {
            operator delete(v33);
          }
        }
        else
        {
          *(void *)unint64_t v31 = v28;
          CFArrayRef v32 = v31 + 8;
        }
        *(void *)(v6 + 112) = v32;
        uint64_t v41 = xpc_dictionary_get_uint64(v15, kRDKeyEndTime);
        uint64_t v42 = v41;
        v44 = *(char **)(v6 + 136);
        unint64_t v43 = *(void *)(v6 + 144);
        if ((unint64_t)v44 >= v43)
        {
          v46 = (char *)*v59;
          uint64_t v47 = (v44 - (unsigned char *)*v59) >> 3;
          unint64_t v48 = v47 + 1;
          if ((unint64_t)(v47 + 1) >> 61) {
            std::vector<RXRecognitionSystem *>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v49 = v43 - (void)v46;
          if (v49 >> 2 > v48) {
            unint64_t v48 = v49 >> 2;
          }
          if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v50 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v50 = v48;
          }
          if (v50)
          {
            v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RXRecognitionSystem *>>(v6 + 144, v50);
            v46 = *(char **)(v6 + 128);
            v44 = *(char **)(v6 + 136);
          }
          else
          {
            v51 = 0;
          }
          v52 = (uint64_t *)&v51[8 * v47];
          uint64_t *v52 = v42;
          v45 = v52 + 1;
          while (v44 != v46)
          {
            uint64_t v53 = *((void *)v44 - 1);
            v44 -= 8;
            *--v52 = v53;
          }
          *(void *)(v6 + 128) = v52;
          *(void *)(v6 + 136) = v45;
          *(void *)(v6 + 144) = &v51[8 * v50];
          if (v46) {
            operator delete(v46);
          }
        }
        else
        {
          *(void *)v44 = v41;
          v45 = v44 + 8;
        }
        *(void *)(v6 + 136) = v45;
        ++v14;
      }
      CFArrayRef v54 = CFArrayCreate(0, (const void **)__p, ((char *)v62 - (unsigned char *)__p) >> 3, MEMORY[0x263EFFF70]);
      for (unsigned int i = (CFTypeRef *)__p; i != (CFTypeRef *)v62; ++i)
        CFRelease(*i);
      RXCFProp<void const*>::operator=((CFTypeRef *)(v6 + 80), v54);
      CFRelease(v54);
      if (__p)
      {
        v62 = (uint64_t *)__p;
        operator delete(__p);
      }
    }
  }
  *(void *)(v6 + 192) = xpc_dictionary_get_uint64(this, kRDKeyStartTime);
  *(void *)(v6 + 200) = xpc_dictionary_get_uint64(this, kRDKeyEndTime);
  *(void *)(v6 + 208) = xpc_dictionary_get_uint64(this, kRDKeyUtteranceID);
  xpc_object_t v56 = xpc_dictionary_get_value(this, kRDKeyChildren);
  if (v56)
  {
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 0x40000000;
    applier[2] = ___ZN16RXLanguageObject20CreateFromSerializedEPvP12RXResultDesc_block_invoke;
    applier[3] = &__block_descriptor_tmp_30_0;
    applier[4] = v6;
    void applier[5] = v58;
    xpc_array_apply(v56, applier);
  }
  return v6;
}

void sub_22BF93A7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN16RXLanguageObject20CreateFromSerializedEPvP12RXResultDesc_block_invoke(uint64_t a1, int a2, RXLanguageObject *this)
{
  CFStringRef v3 = *(void **)(a1 + 32);
  uint64_t v4 = RXLanguageObject::CreateFromSerialized(this, *(void **)(a1 + 40), this);
  CFIndex v5 = (uint64_t *)v3[21];
  unint64_t v6 = v3[22];
  if ((unint64_t)v5 >= v6)
  {
    uint64_t v8 = v3[20];
    uint64_t v9 = ((uint64_t)v5 - v8) >> 3;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<RXRecognitionSystem *>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v6 - v8;
    uint64_t v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1)) {
      uint64_t v11 = v9 + 1;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    if (v12) {
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RXRecognitionSystem *>>((uint64_t)(v3 + 22), v12);
    }
    else {
      uint64_t v13 = 0;
    }
    size_t v14 = (uint64_t *)&v13[8 * v9];
    xpc_object_t v15 = &v13[8 * v12];
    *size_t v14 = v4;
    CFStringRef v7 = v14 + 1;
    uint64_t v17 = (char *)v3[20];
    uint64_t v16 = (char *)v3[21];
    if (v16 != v17)
    {
      do
      {
        uint64_t v18 = *((void *)v16 - 1);
        v16 -= 8;
        *--size_t v14 = v18;
      }
      while (v16 != v17);
      uint64_t v16 = (char *)v3[20];
    }
    v3[20] = v14;
    v3[21] = v7;
    v3[22] = v15;
    if (v16) {
      operator delete(v16);
    }
  }
  else
  {
    uint64_t *v5 = v4;
    CFStringRef v7 = v5 + 1;
  }
  v3[21] = v7;
  return 1;
}

__CFString *RXLanguageObject::CopyFormattingDesc(RXLanguageObject *this, const __CFDictionary *a2)
{
  uint64_t v2 = (const void *)*((void *)this + 7);
  if (v2) {
    return (__CFString *)CFRetain(v2);
  }
  else {
    return &stru_26DF660C0;
  }
}

CFStringRef RXLanguageObject::CopyDebugDesc(CFArrayRef *this)
{
  if (!this[10] && this[21] == this[20])
  {
    CFStringRef v3 = &stru_26DF660C0;
  }
  else
  {
    UniChar v28 = 10;
    UniChar chars = 123;
    UniChar v26 = 125;
    CFMutableArrayRef MutableCopy = CFStringCreateMutableCopy(0, 0, @"\n  ");
    CFStringRef v3 = MutableCopy;
    if (this[10])
    {
      CFStringAppend(MutableCopy, @"{ ");
      if (CFArrayGetCount(this[10]) >= 1)
      {
        CFIndex v4 = 0;
        do
        {
          CFArrayRef ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(this[10], v4);
          if (v4) {
            CFStringAppend(v3, @"  ");
          }
          if (CFArrayGetCount(ValueAtIndex) != 1) {
            CFStringAppendCharacters(v3, &chars, 1);
          }
          if (CFArrayGetCount(ValueAtIndex) >= 1)
          {
            CFIndex v6 = 0;
            do
            {
              if (v6) {
                CFStringRef v7 = @", ";
              }
              else {
                CFStringRef v7 = &stru_26DF660C0;
              }
              uint64_t v8 = CFArrayGetValueAtIndex(ValueAtIndex, v6);
              CFStringAppendFormat(v3, 0, @"%@\"%@\"", v7, v8);
              ++v6;
            }
            while (v6 < CFArrayGetCount(ValueAtIndex));
          }
          if (CFArrayGetCount(ValueAtIndex) != 1) {
            CFStringAppendCharacters(v3, &v26, 1);
          }
          CFStringAppendFormat(v3, 0, @" (%llu:%llu)\n", *((void *)this[13] + v4), *((void *)this[16] + v4));
          ++v4;
        }
        while (v4 < CFArrayGetCount(this[10]));
      }
      CFStringAppendCharacters(v3, &v26, 1);
      CFStringAppendCharacters(v3, &v28, 1);
    }
    CFArrayRef v9 = this[20];
    if (this[21] != v9)
    {
      unint64_t v10 = 0;
      do
      {
        CFStringRef v11 = (const __CFString *)(*(uint64_t (**)(void))(**((void **)v9 + v10) + 48))(*((void *)v9 + v10));
        CFStringAppend(v3, v11);
        CFStringAppendCharacters(v3, &v28, 1);
        CFRelease(v11);
        ++v10;
        CFArrayRef v9 = this[20];
      }
      while (v10 < (this[21] - v9) >> 3);
    }
    v29.size_t length = CFStringGetLength(v3) - 2;
    v29.location = 1;
    CFStringFindAndReplace(v3, @"\n", @"\n  ", v29, 0);
  }
  unint64_t v12 = (__CFString *)this[6];
  uint64_t v13 = (__CFString *)this[7];
  BOOL v14 = v13 == 0;
  xpc_object_t v15 = "";
  uint64_t v16 = "\" ";
  if (!v13)
  {
    uint64_t v13 = &stru_26DF660C0;
    uint64_t v16 = "";
  }
  uint64_t v17 = "\"";
  if (v14) {
    uint64_t v17 = "";
  }
  BOOL v18 = v12 == 0;
  if (!v12) {
    unint64_t v12 = &stru_26DF660C0;
  }
  uint64_t v19 = (__CFString *)this[4];
  uint64_t v20 = "] ";
  if (v18) {
    uint64_t v20 = "";
  }
  unint64_t v21 = "[";
  if (v18) {
    unint64_t v21 = "";
  }
  BOOL v22 = v19 == 0;
  if (!v19) {
    uint64_t v19 = &stru_26DF660C0;
  }
  uint64_t v23 = " [";
  if (v22) {
    uint64_t v23 = "";
  }
  else {
    xpc_object_t v15 = "]";
  }
  CFStringRef v24 = CFStringCreateWithFormat(0, 0, @"<%@ %p %s%@%s%s%@%s(%llu:%llu) <%llu> %s%@%s%@>", sRXTypeNames[*((unsigned int *)this + 10)], this - 2, v21, v12, v20, v17, v13, v16, *((_OWORD *)this + 12), this[26], v23, v19, v15, v3);
  CFRelease(v3);
  return v24;
}

uint64_t RXLanguageObjectGetTypeID()
{
  uint64_t result = gRXCFTypeID_RXLanguageObject;
  if (!gRXCFTypeID_RXLanguageObject)
  {
    qword_26B6E3B48 = (uint64_t)RXCFCopyFormattingDesc;
    qword_26B6E3B50 = (uint64_t)RXCFCopyDebugDesc;
    uint64_t result = _CFRuntimeRegisterClass();
    gRXCFTypeID_RXLanguageObject = result;
  }
  return result;
}

uint64_t RXLanguageModelCreate(uint64_t a1, const void *a2, const void *a3)
{
  if (!gRXCFTypeID_RXLanguageObject)
  {
    qword_26B6E3B48 = (uint64_t)RXCFCopyFormattingDesc;
    qword_26B6E3B50 = (uint64_t)RXCFCopyDebugDesc;
    gRXCFTypeID_RXLanguageObject = _CFRuntimeRegisterClass();
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v6 = Instance;
  if (Instance) {
    uint64_t v7 = Instance + 16;
  }
  else {
    uint64_t v7 = 0;
  }
  *(_DWORD *)(v7 + 40) = 0;
  RXCFProp<void const*>::operator=((CFTypeRef *)(v7 + 48), a2);
  uint64_t v8 = *(const void **)(v7 + 72);
  if (v8) {
    CFRelease(v8);
  }
  *(void *)(v7 + 72) = 0;
  RXCFProp<void const*>::operator=((CFTypeRef *)(v7 + 32), a3);
  return v6;
}

uint64_t RXLanguageModelCreateWithURL(uint64_t a1, const __CFURL *a2, const void *a3)
{
  if (!gRXCFTypeID_RXLanguageObject)
  {
    qword_26B6E3B48 = (uint64_t)RXCFCopyFormattingDesc;
    qword_26B6E3B50 = (uint64_t)RXCFCopyDebugDesc;
    gRXCFTypeID_RXLanguageObject = _CFRuntimeRegisterClass();
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  CFStringRef PathComponent = CFURLCopyLastPathComponent(a2);
  CFStringRef v7 = CFURLCopyPathExtension(a2);
  if (v7)
  {
    CFStringRef v8 = v7;
    CFIndex Length = CFStringGetLength(PathComponent);
    v13.size_t length = Length + ~CFStringGetLength(v8);
    v13.location = 0;
    CFStringRef v10 = CFStringCreateWithSubstring(0, PathComponent, v13);
    CFRelease(PathComponent);
    CFRelease(v8);
    CFStringRef PathComponent = v10;
  }
  if (Instance) {
    uint64_t v11 = Instance + 16;
  }
  else {
    uint64_t v11 = 0;
  }
  *(_DWORD *)(v11 + 40) = 0;
  RXCFProp<void const*>::operator=((CFTypeRef *)(v11 + 48), PathComponent);
  RXCFProp<void const*>::operator=((CFTypeRef *)(v11 + 72), a2);
  RXCFProp<void const*>::operator=((CFTypeRef *)(v11 + 32), a3);
  CFRelease(PathComponent);
  return Instance;
}

uint64_t RXPathCreate(uint64_t a1, const void *a2, const void *a3)
{
  if (!gRXCFTypeID_RXLanguageObject)
  {
    qword_26B6E3B48 = (uint64_t)RXCFCopyFormattingDesc;
    qword_26B6E3B50 = (uint64_t)RXCFCopyDebugDesc;
    gRXCFTypeID_RXLanguageObject = _CFRuntimeRegisterClass();
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v6 = Instance;
  if (Instance) {
    uint64_t v7 = Instance + 16;
  }
  else {
    uint64_t v7 = 0;
  }
  *(_DWORD *)(v7 + 40) = 1;
  RXCFProp<void const*>::operator=((CFTypeRef *)(v7 + 48), a2);
  RXCFProp<void const*>::operator=((CFTypeRef *)(v7 + 32), a3);
  return v6;
}

uint64_t RXWordCreate(uint64_t a1, uint64_t a2, const void *a3, const void *a4)
{
  if (!gRXCFTypeID_RXLanguageObject)
  {
    qword_26B6E3B48 = (uint64_t)RXCFCopyFormattingDesc;
    qword_26B6E3B50 = (uint64_t)RXCFCopyDebugDesc;
    gRXCFTypeID_RXLanguageObject = _CFRuntimeRegisterClass();
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v8 = Instance;
  if (Instance) {
    uint64_t v9 = Instance + 16;
  }
  else {
    uint64_t v9 = 0;
  }
  if (a2) {
    uint64_t v10 = a2 + 16;
  }
  else {
    uint64_t v10 = 0;
  }
  *(_DWORD *)(v9 + 40) = 2;
  RXProp<RXRecognitionSystem *>::operator=((void *)(v9 + 152), v10);
  RXCFProp<void const*>::operator=((CFTypeRef *)(v9 + 56), a3);
  RXCFProp<void const*>::operator=((CFTypeRef *)(v9 + 32), a4);
  return v8;
}

uint64_t RXAdLibCreate(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  if (!gRXCFTypeID_RXLanguageObject)
  {
    qword_26B6E3B48 = (uint64_t)RXCFCopyFormattingDesc;
    qword_26B6E3B50 = (uint64_t)RXCFCopyDebugDesc;
    gRXCFTypeID_RXLanguageObject = _CFRuntimeRegisterClass();
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v7 = Instance;
  if (Instance) {
    uint64_t v8 = Instance + 16;
  }
  else {
    uint64_t v8 = 0;
  }
  if (a3) {
    uint64_t v9 = a3 + 16;
  }
  else {
    uint64_t v9 = 0;
  }
  *(_DWORD *)(v8 + 40) = 3;
  RXProp<RXRecognitionSystem *>::operator=((void *)(v8 + 152), v9);
  RXCFProp<void const*>::operator=((CFTypeRef *)(v8 + 32), a4);
  *(void *)(v8 + 8) |= 8uLL;
  return v7;
}

uint64_t RXLanguageModelWriteToURL()
{
  return 0;
}

uint64_t RXLanguageObjectGetType(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return (*(_DWORD *)(v1 + 40) + 1);
}

uint64_t RXLanguageObjectGetCount(RXXPC *a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  uint64_t v9 = 0;
  uint64_t v2 = RXXPC::Queue(a1);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  v5[2] = __RXLanguageObjectGetCount_block_invoke;
  v5[3] = &unk_264904A08;
  v5[4] = &v6;
  void v5[5] = a1;
  dispatch_sync(v2, v5);
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void sub_22BF944B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __RXLanguageObjectGetCount_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    uint64_t v3 = (RXLanguageObject *)(v2 + 16);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t result = RXLanguageObject::GetCount(v3);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void RXLanguageObjectAddObject(RXXPC *a1, uint64_t a2)
{
  CFIndex v4 = RXXPC::Queue(a1);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  v5[2] = __RXLanguageObjectAddObject_block_invoke;
  v5[3] = &__block_descriptor_tmp_67;
  v5[4] = a1;
  void v5[5] = a2;
  dispatch_sync(v4, v5);
}

void __RXLanguageObjectAddObject_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = (RXRecognitionSystem **)(v2 + 16);
  }
  else {
    uint64_t v3 = 0;
  }
  RXRecognitionSystem::StartChanges(v3[2]);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    CFIndex v5 = (RXLanguageObject *)(v4 + 16);
  }
  else {
    CFIndex v5 = 0;
  }
  RXLanguageObject::AddObject((RXLanguageObject *)v3, v5);
  RXRecognitionSystem::CommitChanges(v3[2]);
}

void sub_22BF945F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  RXTransaction<RXLanguageObject>::~RXTransaction((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t RXLanguageObjectGetObjectAtIndex(RXXPC *a1, uint64_t a2)
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000;
  uint64_t v11 = 0;
  uint64_t v4 = RXXPC::Queue(a1);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __RXLanguageObjectGetObjectAtIndex_block_invoke;
  block[3] = &unk_264904A50;
  void block[5] = a2;
  void block[6] = a1;
  block[4] = &v8;
  dispatch_sync(v4, block);
  uint64_t v5 = v9[3] - 16;
  _Block_object_dispose(&v8, 8);
  return v5;
}

void sub_22BF946C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __RXLanguageObjectGetObjectAtIndex_block_invoke(void *a1)
{
  unint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  if (v2 || (v3 ? (uint64_t v4 = (RXLanguageObject *)(v3 + 16)) : (uint64_t v4 = 0), (result = RXLanguageObject::GetCount(v4)) != 0))
  {
    if (v3) {
      uint64_t v6 = (RXLanguageObject *)(v3 + 16);
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t result = RXLanguageObject::GetObject(v6, v2);
  }
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  return result;
}

void RXLanguageObjectSetObjectAtIndex(RXXPC *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = RXXPC::Queue(a1);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __RXLanguageObjectSetObjectAtIndex_block_invoke;
  block[3] = &__block_descriptor_tmp_69_0;
  block[4] = a1;
  void block[5] = a2;
  void block[6] = a3;
  dispatch_sync(v6, block);
}

void __RXLanguageObjectSetObjectAtIndex_block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    uint64_t v3 = (RXRecognitionSystem **)(v2 + 16);
  }
  else {
    uint64_t v3 = 0;
  }
  RXRecognitionSystem::StartChanges(v3[2]);
  uint64_t v4 = a1[6];
  if (v4) {
    uint64_t v5 = (RXLanguageObject *)(v4 + 16);
  }
  else {
    uint64_t v5 = 0;
  }
  RXLanguageObject::SetObject((RXLanguageObject *)v3, a1[5], v5);
  RXRecognitionSystem::CommitChanges(v3[2]);
}

void sub_22BF94838(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  RXTransaction<RXLanguageObject>::~RXTransaction((uint64_t)va);
  _Unwind_Resume(a1);
}

void RXLanguageObjectRemoveObjectAtIndex(RXXPC *a1, uint64_t a2)
{
  uint64_t v4 = RXXPC::Queue(a1);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  v5[2] = __RXLanguageObjectRemoveObjectAtIndex_block_invoke;
  v5[3] = &__block_descriptor_tmp_70_0;
  v5[4] = a1;
  void v5[5] = a2;
  dispatch_sync(v4, v5);
}

void __RXLanguageObjectRemoveObjectAtIndex_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = (RXRecognitionSystem **)(v2 + 16);
  }
  else {
    uint64_t v3 = 0;
  }
  RXRecognitionSystem::StartChanges(v3[2]);
  RXLanguageObject::RemoveObject((RXLanguageObject *)v3, *(void *)(a1 + 40));
  RXRecognitionSystem::CommitChanges(v3[2]);
}

void sub_22BF94928(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  RXTransaction<RXLanguageObject>::~RXTransaction((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL RXLanguageObjectApplyBlock(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a1) {
    uint64_t v3 = a1 + 16;
  }
  else {
    uint64_t v3 = 0;
  }
  return RXLanguageObject::ApplyBlock(v3, a2, a3);
}

CFMutableStringRef RXReplaceHyphensWithSpace(__CFString *a1, _DWORD *a2)
{
  CFMutableStringRef MutableCopy = a1;
  v9[5] = *MEMORY[0x263EF8340];
  if (a1 && a2)
  {
    MEMORY[0x270FA5388]();
    v9[0] = @"-";
    v9[1] = @"­";
    v9[2] = @"‐";
    v9[3] = @"‑";
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFIndex Length = CFStringGetLength(MutableCopy);
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(v4, Length, MutableCopy);
    for (uint64_t i = 0; i != 4; ++i)
    {
      CFStringRef v7 = (const __CFString *)v9[i];
      v10.size_t length = CFStringGetLength(MutableCopy);
      v10.location = 0;
      *a2 += CFStringFindAndReplace(MutableCopy, v7, @" ", v10, 0);
    }
  }
  return MutableCopy;
}

void RXLanguageObjectAddPhrase(uint64_t a1, RXXPC *a2, uint64_t a3, const __CFString *a4, const __CFLocale *a5)
{
  CFRange v10 = (RXXPC *)RXPathCreate(0, 0, 0);
  RXObjectSetProperty(v10, 1819572340, (uint64_t)a4);
  CFStringRef v11 = (const __CFString *)MEMORY[0x230F59AB0](a5);
  if (RXIsLocaleWithNoSpaceInPostITN(v11)) {
    CFRange v13 = RXLanguageObjectCharacterTokenize(a4, v12);
  }
  else {
    CFRange v13 = RXLanguageObjectCFTokenizerTokenize(a4, a5);
  }
  CFArrayRef v14 = v13;
  CFIndex Count = CFArrayGetCount(v13);
  if (Count >= 1)
  {
    CFIndex v16 = Count;
    for (CFIndex i = 0; i != v16; ++i)
    {
      CFArrayRef ValueAtIndex = CFArrayGetValueAtIndex(v14, i);
      uint64_t v19 = (const void *)RXWordCreate(a1, a3, ValueAtIndex, 0);
      RXLanguageObjectAddObject(v10, (uint64_t)v19);
      CFRelease(v19);
    }
  }
  CFRelease(v14);
  RXLanguageObjectAddObject(a2, (uint64_t)v10);
  CFRelease(v10);
}

__CFArray *RXLanguageObjectCharacterTokenize(const __CFString *a1, const __CFLocale *a2)
{
  CFArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  CreateCppStringFromCFString(a1, &__p);
  if ((char)v13 < 0)
  {
    p_p = (unsigned __int8 *)__p;
    uint64_t v5 = v12;
    if (v12) {
      goto LABEL_5;
    }
  }
  else
  {
    if (!v13) {
      goto LABEL_14;
    }
    p_p = (unsigned __int8 *)&__p;
    uint64_t v5 = v13;
LABEL_5:
    while (((char)*p_p & 0x80000000) == 0 && (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * *p_p + 60) & 0x400) != 0)
    {
      ++p_p;
      if (!--v5)
      {
        if ((v13 & 0x80) != 0) {
          operator delete(__p);
        }
        CFArrayAppendValue(Mutable, a1);
        return Mutable;
      }
    }
    if ((v13 & 0x80) == 0) {
      goto LABEL_14;
    }
    p_p = (unsigned __int8 *)__p;
  }
  operator delete(p_p);
LABEL_14:
  if (CFStringGetLength(a1) >= 1)
  {
    CFIndex v6 = 0;
    do
    {
      if (RXGetLegitimateCharacters(void)::sInitCharSet != -1) {
        dispatch_once(&RXGetLegitimateCharacters(void)::sInitCharSet, &__block_literal_global_1);
      }
      CFCharacterSetRef v7 = (const __CFCharacterSet *)RXGetLegitimateCharacters(void)::sLegitChars;
      UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(a1, v6);
      if (CFCharacterSetIsCharacterMember(v7, CharacterAtIndex))
      {
        v14.location = v6;
        v14.size_t length = 1;
        CFStringRef v9 = CFStringCreateWithSubstring(0, a1, v14);
        CFArrayAppendValue(Mutable, v9);
      }
      ++v6;
    }
    while (v6 < CFStringGetLength(a1));
  }
  return Mutable;
}

__CFArray *RXLanguageObjectCFTokenizerTokenize(const __CFString *a1, const __CFLocale *a2)
{
  CFArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  CFIndex Length = CFStringGetLength(a1);
  if (RXLanguageObjectCFTokenizerTokenize(__CFString const*,__CFLocale const*)::onceToken != -1) {
    dispatch_once(&RXLanguageObjectCFTokenizerTokenize(__CFString const*,__CFLocale const*)::onceToken, &__block_literal_global_106);
  }
  pthread_mutex_lock(&RXLanguageObjectCFTokenizerTokenize(__CFString const*,__CFLocale const*)::sMutexAroundSharedCFStringTokenizer);
  if (WordBoundaryUnitStringTokenizerForLocale(__CFLocale const*)::onceToken != -1) {
    dispatch_once(&WordBoundaryUnitStringTokenizerForLocale(__CFLocale const*)::onceToken, &__block_literal_global_109);
  }
  CFIndex v6 = (const void *)MEMORY[0x230F59AB0](a2);
  CFDictionaryRef Value = (void *)CFDictionaryGetValue((CFDictionaryRef)WordBoundaryUnitStringTokenizerForLocale(__CFLocale const*)::sStringTokenizerForLocaleIdentifierTable, v6);
  if (!Value)
  {
    v18.location = 0;
    v18.size_t length = 0;
    CFDictionaryRef Value = CFStringTokenizerCreate(0, &stru_26DF660C0, v18, 4uLL, a2);
    if (Value)
    {
      CFDictionaryAddValue((CFMutableDictionaryRef)WordBoundaryUnitStringTokenizerForLocale(__CFLocale const*)::sStringTokenizerForLocaleIdentifierTable, v6, Value);
      CFRelease(Value);
    }
  }
  v19.location = 0;
  v19.size_t length = Length;
  CFStringTokenizerSetString((CFStringTokenizerRef)Value, a1, v19);
  while (CFStringTokenizerAdvanceToNextToken((CFStringTokenizerRef)Value))
  {
    CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange((CFStringTokenizerRef)Value);
    CFIndex v9 = CurrentTokenRange.length;
    if (RXGetLegitimateCharacters(void)::sInitCharSet != -1) {
      dispatch_once(&RXGetLegitimateCharacters(void)::sInitCharSet, &__block_literal_global_1);
    }
    if (CFStringFindCharacterFromSet(a1, (CFCharacterSetRef)RXGetLegitimateCharacters(void)::sLegitChars, CurrentTokenRange, 0, &v17))
    {
      CFIndex v10 = CurrentTokenRange.length + CurrentTokenRange.location;
LABEL_13:
      if (v10 < Length - 1)
      {
        if (RXGetLegitimateCharacters(void)::sInitCharSet != -1) {
          dispatch_once(&RXGetLegitimateCharacters(void)::sInitCharSet, &__block_literal_global_1);
        }
        CFCharacterSetRef v11 = (const __CFCharacterSet *)RXGetLegitimateCharacters(void)::sLegitChars;
        UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(a1, v10 + 1);
        if (CFCharacterSetIsCharacterMember(v11, CharacterAtIndex))
        {
          int v13 = CFStringGetCharacterAtIndex(a1, v10);
          if ((v13 - 8208) < 2 || v13 == 173 || v13 == 45)
          {
            while (CFStringTokenizerAdvanceToNextToken((CFStringTokenizerRef)Value))
            {
              CFRange v14 = CFStringTokenizerGetCurrentTokenRange((CFStringTokenizerRef)Value);
              if (v14.location > v10)
              {
                CFIndex v9 = v14.length - CurrentTokenRange.location + v14.location;
                CFIndex v10 = v14.length + v14.location;
                goto LABEL_13;
              }
            }
          }
        }
      }
      v20.location = CurrentTokenRange.location;
      v20.size_t length = v9;
      CFStringRef v15 = CFStringCreateWithSubstring(0, a1, v20);
      CFArrayAppendValue(Mutable, v15);
      CFRelease(v15);
    }
  }
  pthread_mutex_unlock(&RXLanguageObjectCFTokenizerTokenize(__CFString const*,__CFLocale const*)::sMutexAroundSharedCFStringTokenizer);
  return Mutable;
}

void RXLanguageObjectAddPhraseAndAlternatives(uint64_t a1, RXXPC *a2, uint64_t a3, __CFString *a4, const __CFLocale *a5)
{
  CFIndex v10 = (RXXPC *)RXPathCreate(0, 0, 0);
  RXObjectSetProperty(v10, 1819572340, (uint64_t)a4);
  CFStringRef v11 = (const __CFString *)MEMORY[0x230F59AB0](a5);
  if (RXIsLocaleWithSpecialHyphenHandling(v11))
  {
    int v24 = 0;
    CFMutableStringRef v12 = RXReplaceHyphensWithSpace(a4, &v24);
    if (v24 >= 1)
    {
      CFMutableStringRef v13 = v12;
      CFRange v14 = (void *)RXLanguageModelCreate(0, 0, 0);
      RXLanguageObjectAddPhraseAndAlternatives(a1, v14, a3, v13, a5);
      RXLanguageObjectAddObject(a2, (uint64_t)v14);
      CFRelease(v14);
      a2 = (RXXPC *)v14;
    }
  }
  CFStringRef v15 = (const __CFString *)MEMORY[0x230F59AB0](a5);
  if (RXIsLocaleWithNoSpaceInPostITN(v15)) {
    CFRange v17 = RXLanguageObjectCharacterTokenize(a4, v16);
  }
  else {
    CFRange v17 = RXLanguageObjectCFTokenizerTokenize(a4, a5);
  }
  CFArrayRef v18 = v17;
  CFIndex Count = CFArrayGetCount(v17);
  if (Count >= 1)
  {
    CFIndex v20 = Count;
    for (CFIndex i = 0; i != v20; ++i)
    {
      CFArrayRef ValueAtIndex = CFArrayGetValueAtIndex(v18, i);
      uint64_t v23 = (const void *)RXWordCreate(a1, a3, ValueAtIndex, 0);
      RXLanguageObjectAddObject(v10, (uint64_t)v23);
      CFRelease(v23);
    }
  }
  CFRelease(v18);
  RXLanguageObjectAddObject(a2, (uint64_t)v10);
  CFRelease(v10);
}

void RXResultDesc::RXResultDesc(RXResultDesc *this, RXRecognizer *a2, uint64_t a3)
{
  *(void *)this = 1;
  *((void *)this + 1) = a3;
  *((void *)this + 2) = a2;
  CFRetain((char *)a2 - 16);
}

void RXResultDesc::~RXResultDesc(RXResultDesc *this)
{
}

void *CreateCppStringFromCFString@<X0>(const __CFString *a1@<X0>, void *a2@<X8>)
{
  v9[1] = *MEMORY[0x263EF8340];
  if (a1)
  {
    CFIndex Length = CFStringGetLength(a1);
    CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
    MEMORY[0x270FA5388]();
    CFIndex v6 = (char *)v9 - v5;
    CFStringGetCString(a1, (char *)v9 - v5, v7, 0x8000100u);
    return std::string::basic_string[abi:ne180100]<0>(a2, v6);
  }
  else
  {
    return std::string::basic_string[abi:ne180100]<0>(a2, 0);
  }
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    CFIndex v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    CFIndex v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void ___ZL25RXGetLegitimateCharactersv_block_invoke()
{
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  CFMutableStringRef MutableCopy = CFCharacterSetCreateMutableCopy(0, Predefined);
  CFCharacterSetRef v2 = CFCharacterSetGetPredefined(kCFCharacterSetPunctuation);
  CFCharacterSetUnion(MutableCopy, v2);
  CFCharacterSetInvert(MutableCopy);
  CFCharacterSetAddCharactersInString(MutableCopy, @"&");
  RXGetLegitimateCharacters(void)::sLegitChars = (uint64_t)MutableCopy;
}

uint64_t ___ZL35RXLanguageObjectCFTokenizerTokenizePK10__CFStringPK10__CFLocale_block_invoke()
{
  return pthread_mutex_init(&RXLanguageObjectCFTokenizerTokenize(__CFString const*,__CFLocale const*)::sMutexAroundSharedCFStringTokenizer, 0);
}

CFMutableDictionaryRef ___ZL40WordBoundaryUnitStringTokenizerForLocalePK10__CFLocale_block_invoke()
{
  CFMutableDictionaryRef result = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  WordBoundaryUnitStringTokenizerForLocale(__CFLocale const*)::sStringTokenizerForLocaleIdentifierTable = (uint64_t)result;
  return result;
}

const void **RXCFProp<__CFArray const*>::~RXCFProp(const void **a1)
{
  CFCharacterSetRef v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *RXProp<RXVocabulary *>::~RXProp(void *a1)
{
  if (*a1) {
    CFRelease((CFTypeRef)(*a1 - 16));
  }
  return a1;
}

uint64_t RXTransaction<RXLanguageObject>::~RXTransaction(uint64_t a1)
{
  return a1;
}

xpc_object_t RXXPC::CreateInstance(RXXPC *this, const __CFLocale *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = (__CFString *)MEMORY[0x230F59AB0]();
  size_t v4 = RXOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    CFMutableStringRef v13 = v3;
    _os_log_impl(&dword_22BF8A000, v4, OS_LOG_TYPE_DEFAULT, "RXXPC creating instance for locale = %{public}@", (uint8_t *)&v12, 0xCu);
  }
  if (RXEngineTypeForLocaleIdentifier(v3) != 1)
  {
    if (!RDCopyBestNashvilleLocaleIdentifier(v3)) {
      goto LABEL_6;
    }
LABEL_9:
    operator new();
  }
  if (RXXPC::RDIsQuasarModelLanguageInstalledForLocaleIdentifier((RXXPC *)v3, v5) && v3) {
    goto LABEL_9;
  }
LABEL_6:
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v6, kRDKeyMessage, 502);
  uint64_t v7 = kRDKeyLocale;
  CFStringRef v8 = (const __CFString *)MEMORY[0x230F59AB0](this);
  RXXPC::SerializeCFString((RXXPC *)v6, v7, v8, v9);
  xpc_object_t v10 = RXXPC::SendBrokerMessageWithReplySync((RXXPC *)v6, (void *)1);
  xpc_release(v6);
  if (v10)
  {
    xpc_release(v10);
    return 0;
  }
  return v10;
}

void sub_22BF9567C(_Unwind_Exception *a1)
{
  MEMORY[0x230F59F90](v1, 0x1060C40C4633D05);
  _Unwind_Resume(a1);
}

BOOL RXXPC::RDIsQuasarModelLanguageInstalledForLocaleIdentifier(RXXPC *this, const __CFString *a2)
{
  CFDictionaryRef v3 = (const __CFDictionary *)RXXPC::CopyLanguageInstallationStatus(this);
  if (!v3)
  {
LABEL_8:
    CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
    CFStringAppend(Mutable, @"/System/Library/Speech/Recognizers/SpeechRecognitionCoreLanguages/");
    CFStringAppend(Mutable, (CFStringRef)this);
    CFStringAppend(Mutable, @".SpeechRecognition");
    if (!Mutable) {
      return 0;
    }
    CFURLRef v10 = CFURLCreateWithFileSystemPath(0, Mutable, kCFURLPOSIXPathStyle, 1u);
    if (v10)
    {
      CFURLRef v11 = v10;
      int v12 = CFBundleCreate(0, v10);
      if (v12)
      {
        CFMutableStringRef v13 = v12;
        CFDictionaryRef ValueForInfoDictionaryKey = (const __CFDictionary *)CFBundleGetValueForInfoDictionaryKey(v12, @"RXConfig");
        if (ValueForInfoDictionaryKey) {
          BOOL v15 = CFDictionaryContainsKey(ValueForInfoDictionaryKey, @"QuasarConfig") != 0;
        }
        else {
          BOOL v15 = 0;
        }
        CFRelease(v13);
      }
      else
      {
        BOOL v15 = 0;
      }
      CFRelease(v11);
    }
    else
    {
      BOOL v15 = 0;
    }
    CFRelease(Mutable);
    return v15;
  }
  CFDictionaryRef v4 = v3;
  CFIndex Count = CFDictionaryGetCount(v3);
  xpc_object_t v6 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
  uint64_t v7 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
  CFDictionaryGetKeysAndValues(v4, v6, v7);
  if (Count < 1)
  {
LABEL_7:
    CFRelease(v4);
    free(v6);
    free(v7);
    goto LABEL_8;
  }
  uint64_t v8 = 0;
  while (!RDDoLocaleIdentifiersMatch((CFLocaleIdentifier)this, (const __CFString *)v6[v8])
       || !CFStringHasPrefix((CFStringRef)v7[v8], @"Version:"))
  {
    if (Count == ++v8) {
      goto LABEL_7;
    }
  }
  CFRelease(v4);
  free(v6);
  free(v7);
  return 1;
}

xpc_object_t RXXPC::CreateMessage(RXXPC *this)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, kRDKeyMessage, (int64_t)this);
  return v2;
}

void RXXPC::SerializeCFString(RXXPC *this, const char *a2, CFStringRef theString, const __CFString *a4)
{
  if (theString)
  {
    CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
    if (!CStringPtr)
    {
      CFIndex Length = CFStringGetLength(theString);
      CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
      operator new[]();
    }
    xpc_dictionary_set_string(this, a2, CStringPtr);
  }
}

xpc_object_t RXXPC::SendBrokerMessageWithReplySync(RXXPC *this, void *a2)
{
  int v2 = (int)a2;
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (RXXPC::SendBrokerMessageWithReplySync(void *,BOOL)::sRXXBrokerInit != -1) {
    dispatch_once(&RXXPC::SendBrokerMessageWithReplySync(void *,BOOL)::sRXXBrokerInit, &__block_literal_global_13);
  }
  CFDictionaryRef v4 = (void *)MEMORY[0x230F5A360](this);
  if (RXLogClientUpdates())
  {
    CFStringRef v5 = RXOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      CFURLRef v11 = v4;
      _os_log_impl(&dword_22BF8A000, v5, OS_LOG_TYPE_INFO, "Broker <- %s", (uint8_t *)&v10, 0xCu);
    }
  }
  free(v4);
  if (v2)
  {
    xpc_object_t v6 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)RXXPC::SendBrokerMessageWithReplySync(void *,BOOL)::sRXXBrokerConn, this);
    uint64_t v7 = (void *)MEMORY[0x230F5A360]();
    if (RXLogClientUpdates())
    {
      uint64_t v8 = RXOSLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v10 = 136315138;
        CFURLRef v11 = v7;
        _os_log_impl(&dword_22BF8A000, v8, OS_LOG_TYPE_INFO, "Broker -> %s", (uint8_t *)&v10, 0xCu);
      }
    }
    free(v7);
  }
  else
  {
    xpc_connection_send_message((xpc_connection_t)RXXPC::SendBrokerMessageWithReplySync(void *,BOOL)::sRXXBrokerConn, this);
    return 0;
  }
  return v6;
}

uint64_t RXXPC::Queue(RXXPC *this)
{
  if (RXXPC::Queue(void)::sRXXGlobalQueueInit != -1) {
    dispatch_once(&RXXPC::Queue(void)::sRXXGlobalQueueInit, &__block_literal_global_2);
  }
  return RXXPC::Queue(void)::sRXXGlobalQueue;
}

dispatch_queue_t ___ZN5RXXPC5QueueEv_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("RXXPCGlobal", 0);
  RXXPC::Queue(void)::sRXXGlobalQueue = (uint64_t)result;
  return result;
}

void RXXPC::RXXPC(RXXPC *this, const __CFString *a2, uint64_t a3)
{
  *(unsigned char *)this = (a3 & 3) == 0;
  *(_WORD *)((char *)this + 1) = 0;
  *((unsigned char *)this + 3) = 0;
  *((void *)this + 1) = a3;
  *((void *)this + 2) = a2;
  *((void *)this + 7) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  if (pthread_mutex_init((pthread_mutex_t *)this + 2, 0)) {
    __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXXPC.cpp", 81, (uint64_t)"err == 0", @"Could not initialize the server mutex");
  }
  if (pthread_cond_init((pthread_cond_t *)this + 4, 0)) {
    __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXXPC.cpp", 84, (uint64_t)"err == 0", @"Could not initialize the server condition variable");
  }
  if (pthread_mutex_init((pthread_mutex_t *)this + 1, 0)) {
    __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXXPC.cpp", 87, (uint64_t)"err == 0", @"Could not initialize the content mutex");
  }
  *((void *)this + 6) = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
}

void RXXPC::SetAudioDevice(RXXPC *this, AudioObjectID inObjectID)
{
  AudioObjectID v2 = inObjectID;
  uint64_t v15 = *MEMORY[0x263EF8340];
  AudioObjectID outData = inObjectID;
  if (inObjectID)
  {
LABEL_2:
    UInt32 ioDataSize = 8;
    CFStringRef v9 = 0;
    *(void *)&inAddress.mSelector = *(void *)" diubolg";
    inAddress.mElement = 0;
    if (AudioObjectGetPropertyData(v2, &inAddress, 0, 0, &ioDataSize, &v9))
    {
      CFDictionaryRef v4 = RXOSLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        AudioObjectID v14 = outData;
        CFStringRef v5 = "Unable to obtain device UID for audio input device %d\n";
        xpc_object_t v6 = v4;
        uint32_t v7 = 8;
LABEL_8:
        _os_log_impl(&dword_22BF8A000, v6, OS_LOG_TYPE_ERROR, v5, buf, v7);
        return;
      }
    }
    else
    {
      RXXPC::SetAudioDevice(this, v9);
    }
    return;
  }
  LODWORD(v9) = 4;
  *(void *)&inAddress.mSelector = *(void *)" nIdbolg";
  inAddress.mElement = 0;
  if (!AudioObjectGetPropertyData(1u, &inAddress, 0, 0, (UInt32 *)&v9, &outData))
  {
    AudioObjectID v2 = outData;
    goto LABEL_2;
  }
  uint64_t v8 = RXOSLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    CFStringRef v5 = "Unable to obtain default input device\n";
    xpc_object_t v6 = v8;
    uint32_t v7 = 2;
    goto LABEL_8;
  }
}

void RXXPC::SetAudioDevice(RXXPC *this, const __CFString *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  CFDictionaryRef v4 = RXOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    CFStringRef v7 = a2;
    _os_log_impl(&dword_22BF8A000, v4, OS_LOG_TYPE_DEFAULT, "RXXPC SetAudioDevice = %{public}@", (uint8_t *)&v6, 0xCu);
  }
  if (a2) {
    CFRetain(a2);
  }
  CFStringRef v5 = (const void *)*((void *)this + 3);
  if (v5) {
    CFRelease(v5);
  }
  *((void *)this + 3) = a2;
}

void RXXPC::SetAudioDevice(RXXPC *this, const __CFString *cf)
{
  CFTypeID v4 = CFGetTypeID(cf);
  if (v4 == CFStringGetTypeID())
  {
    RXXPC::SetAudioDevice(this, cf);
  }
  else
  {
    CFTypeID v5 = CFGetTypeID(cf);
    if (v5 == CFNumberGetTypeID())
    {
      uint64_t valuePtr = 0;
      if (CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt64Type, &valuePtr)) {
        RXXPC::SetAudioDevice(this, valuePtr);
      }
    }
  }
}

void ___ZN5RXXPC30SendBrokerMessageWithReplySyncEPvb_block_invoke()
{
  global_queue = dispatch_get_global_queue(0, 0);
  RXXPC::SendBrokerMessageWithReplySync(void *,BOOL)::sRXXBrokerConn = (uint64_t)xpc_connection_create("com.apple.SpeechRecognitionCore.brokerd", global_queue);
  xpc_connection_set_event_handler((xpc_connection_t)RXXPC::SendBrokerMessageWithReplySync(void *,BOOL)::sRXXBrokerConn, &__block_literal_global_18);
  uint64_t v1 = (_xpc_connection_s *)RXXPC::SendBrokerMessageWithReplySync(void *,BOOL)::sRXXBrokerConn;
  xpc_connection_resume(v1);
}

void ___ZN5RXXPC30SendBrokerMessageWithReplySyncEPvb_block_invoke_2(uint64_t a1, RXRecognitionSystem *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  CFDictionaryRef v3 = (void *)MEMORY[0x230F5A360](a2);
  if (RXLogClientUpdates())
  {
    CFTypeID v4 = RXOSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      CFStringRef v7 = v3;
      _os_log_impl(&dword_22BF8A000, v4, OS_LOG_TYPE_INFO, "Broker -> %s", (uint8_t *)&v6, 0xCu);
    }
  }
  free(v3);
  RXRecognitionSystem::BrokerEvent(a2, v5);
}

void RXXPC::EstablishConnection(RXXPC *this)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  AudioObjectID v2 = RXOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22BF8A000, v2, OS_LOG_TYPE_DEFAULT, "RXXPC EstablishConnection", buf, 2u);
  }
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, kRDKeyMessage, 101);
  xpc_dictionary_set_uint64(v3, kRDKeyObjectID, (uint64_t)this);
  xpc_dictionary_set_BOOL(v3, kRDKeyLiveAudio, *(unsigned char *)this);
  if (*(unsigned char *)this && *((void *)this + 3))
  {
    CFTypeID v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(v3, kRDKeyAudioDevice, v5);
    xpc_release(v5);
  }
  RXXPC::SerializeCFString((RXXPC *)v3, kRDKeyLocale, *((CFStringRef *)this + 2), v4);
  xpc_dictionary_set_uint64(v3, kRDKeyOptions, *((void *)this + 1));
  xpc_object_t v6 = RXXPC::SendBrokerMessageWithReplySync((RXXPC *)v3, (void *)1);
  uint64_t v7 = MEMORY[0x230F5A450]();
  uint64_t v8 = MEMORY[0x263EF8708];
  if (v7 == MEMORY[0x263EF8708])
  {
    while (1)
    {
      connection = xpc_dictionary_create_connection(v6, kRDKeyConnection);
      *((void *)this + 5) = xpc_dictionary_get_uint64(v6, kRDKeyObjectID);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 0x40000000;
      handler[2] = ___ZN5RXXPC19EstablishConnectionEv_block_invoke;
      handler[3] = &__block_descriptor_tmp_19;
      handler[4] = this;
      xpc_connection_set_event_handler(connection, handler);
      xpc_release(v6);
      xpc_connection_resume(connection);
      xpc_object_t v6 = xpc_connection_send_message_with_reply_sync(connection, v3);
      if (MEMORY[0x230F5A450]() == v8) {
        break;
      }
      xpc_object_t v6 = RXXPC::SendBrokerMessageWithReplySync((RXXPC *)v3, (void *)1);
      if (MEMORY[0x230F5A450]() != v8) {
        goto LABEL_10;
      }
    }
    int v10 = RXOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      CFURLRef v11 = "broker connection to daemon succedded";
      goto LABEL_12;
    }
  }
  else
  {
    connection = 0;
LABEL_10:
    int v10 = RXOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      CFURLRef v11 = "broker connection to daemon failed";
LABEL_12:
      _os_log_impl(&dword_22BF8A000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
    }
  }
  if (MEMORY[0x230F5A450](v6) == v8)
  {
    uint64_t v12 = (void *)MEMORY[0x230F5A360](v3);
    CFMutableStringRef v13 = (void *)MEMORY[0x230F5A360](v6);
    AudioObjectID v14 = RXOSLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      CFRange v19 = v12;
      __int16 v20 = 2080;
      unint64_t v21 = v13;
      _os_log_impl(&dword_22BF8A000, v14, OS_LOG_TYPE_INFO, "Hello %s -> %s\n", buf, 0x16u);
    }
    free(v12);
    free(v13);
    pthread_mutex_lock((pthread_mutex_t *)this + 1);
    if (*((unsigned char *)this + 2))
    {
      xpc_connection_cancel(connection);
      xpc_release(connection);
    }
    else
    {
      *((void *)this + 4) = connection;
    }
    pthread_mutex_unlock((pthread_mutex_t *)this + 1);
    xpc_release(v6);
    RXDebugFlagsUpdate();
    if (RXLogClientUpdates())
    {
      xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v15, kRDKeyMessage, 911);
      RXXPC::SendMessage(this, v15, 0);
      xpc_release(v15);
    }
    xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v16, kRDKeyMessage, 105);
    RXXPC::SendMessage(this, v16, 1);
    xpc_release(v16);
  }
  else
  {
    pthread_mutex_lock((pthread_mutex_t *)this + 1);
    *((void *)this + 4) = 0;
    *((unsigned char *)this + 2) = 1;
    pthread_mutex_unlock((pthread_mutex_t *)this + 1);
  }
  xpc_release(v3);
}

void ___ZN5RXXPC19EstablishConnectionEv_block_invoke(uint64_t a1, void *a2)
{
}

void RXXPC::ClientEvent(RXXPC *this, void *a2)
{
  uint64_t v4 = MEMORY[0x230F5A450](a2);
  if (v4 != MEMORY[0x263EF8720])
  {
    if (v4 != MEMORY[0x263EF8708]) {
      RXXPC::ClientEvent();
    }
    int64_t int64 = xpc_dictionary_get_int64(a2, kRDKeyMessage);
    if (int64 > 204)
    {
      if (int64 == 205)
      {
        xpc_retain(a2);
        if (RXXPC::Queue(void)::sRXXGlobalQueueInit != -1) {
          dispatch_once(&RXXPC::Queue(void)::sRXXGlobalQueueInit, &__block_literal_global_2);
        }
        global_queue = RXXPC::Queue(void)::sRXXGlobalQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 0x40000000;
        block[2] = ___ZN5RXXPC11ClientEventEPv_block_invoke_5;
        block[3] = &__block_descriptor_tmp_34;
        block[4] = a2;
        uint64_t v7 = block;
      }
      else
      {
        if (int64 != 601) {
          return;
        }
        xpc_retain(a2);
        if (RXXPC::Queue(void)::sRXXGlobalQueueInit != -1) {
          dispatch_once(&RXXPC::Queue(void)::sRXXGlobalQueueInit, &__block_literal_global_2);
        }
        global_queue = RXXPC::Queue(void)::sRXXGlobalQueue;
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 0x40000000;
        v10[2] = ___ZN5RXXPC11ClientEventEPv_block_invoke_6;
        v10[3] = &__block_descriptor_tmp_35;
        v10[4] = a2;
        uint64_t v7 = v10;
      }
    }
    else if (int64 == 200)
    {
      xpc_retain(a2);
      if (RXXPC::Queue(void)::sRXXGlobalQueueInit != -1) {
        dispatch_once(&RXXPC::Queue(void)::sRXXGlobalQueueInit, &__block_literal_global_2);
      }
      global_queue = RXXPC::Queue(void)::sRXXGlobalQueue;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 0x40000000;
      v12[2] = ___ZN5RXXPC11ClientEventEPv_block_invoke_4;
      v12[3] = &__block_descriptor_tmp_33;
      v12[4] = a2;
      uint64_t v7 = v12;
    }
    else
    {
      if (int64 != 204) {
        return;
      }
      global_queue = dispatch_get_global_queue(2, 0);
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 0x40000000;
      v13[2] = ___ZN5RXXPC11ClientEventEPv_block_invoke_3;
      v13[3] = &__block_descriptor_tmp_32;
      v13[4] = this;
      uint64_t v7 = v13;
    }
    goto LABEL_25;
  }
  if (a2 == (void *)MEMORY[0x263EF86A8])
  {
    uint64_t v8 = (_xpc_connection_s *)*((void *)this + 4);
    CFStringRef v9 = "client received XPC_ERROR_CONNECTION_INVALID";
  }
  else
  {
    if (a2 != (void *)MEMORY[0x263EF86C0])
    {
      if (a2 != (void *)MEMORY[0x263EF86A0]) {
        return;
      }
      ___ZN5RXXPC11ClientEventEPv_block_invoke(v4, (uint64_t)"client received XPC_ERROR_CONNECTION_INTERRUPTED", *((_xpc_connection_s **)this + 4));
      pthread_mutex_lock((pthread_mutex_t *)this + 1);
      if (*((void *)this + 4)) {
        *((unsigned char *)this + 3) = 1;
      }
      pthread_mutex_unlock((pthread_mutex_t *)this + 1);
      global_queue = dispatch_get_global_queue(2, 0);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 0x40000000;
      v14[2] = ___ZN5RXXPC11ClientEventEPv_block_invoke_27;
      v14[3] = &__block_descriptor_tmp_29;
      v14[4] = this;
      uint64_t v7 = v14;
LABEL_25:
      dispatch_async(global_queue, v7);
      return;
    }
    uint64_t v8 = (_xpc_connection_s *)*((void *)this + 4);
    CFStringRef v9 = "client received XPC_ERROR_TERMINATION_IMMINENT";
  }
  ___ZN5RXXPC11ClientEventEPv_block_invoke(v4, (uint64_t)v9, v8);
}

uint64_t RXXPC::SendMessage(RXXPC *this, void *a2, int a3)
{
  xpc_object_t v6 = (pthread_mutex_t *)((char *)this + 64);
  pthread_mutex_lock((pthread_mutex_t *)this + 1);
  uint64_t v7 = (_xpc_connection_s *)*((void *)this + 4);
  if (a3)
  {
    if (v7 && !*((unsigned char *)this + 3))
    {
      global_queue = dispatch_get_global_queue(0, 0);
      xpc_connection_send_message_with_reply(v7, a2, global_queue, &__block_literal_global_38);
    }
  }
  else if (v7 && !*((unsigned char *)this + 3))
  {
    xpc_connection_send_message(*((xpc_connection_t *)this + 4), a2);
  }
  return pthread_mutex_unlock(v6);
}

void ___ZN5RXXPC11ClientEventEPv_block_invoke(uint64_t a1, uint64_t a2, _xpc_connection_s *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    CFMutableStringRef v13 = RXOSLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v14 = 136315138;
    uint64_t v15 = a2;
    int v10 = "%s (connection: NULL)";
LABEL_10:
    CFURLRef v11 = v13;
    uint32_t v12 = 12;
LABEL_11:
    _os_log_impl(&dword_22BF8A000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v14, v12);
    return;
  }
  uint64_t v5 = MEMORY[0x230F5A450](a3);
  if (!v5)
  {
    CFMutableStringRef v13 = RXOSLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v14 = 136315138;
    uint64_t v15 = a2;
    int v10 = "%s (connection: Unexpected type UNKNOWN";
    goto LABEL_10;
  }
  xpc_object_t v6 = (const _xpc_type_s *)v5;
  uint64_t v7 = (const _xpc_type_s *)MEMORY[0x263EF86F0];
  uint64_t v8 = RXOSLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v6 != v7)
  {
    if (!v9) {
      return;
    }
    int v14 = 136315394;
    uint64_t v15 = a2;
    __int16 v16 = 2080;
    name = xpc_type_get_name(v6);
    int v10 = "%s (connection: Unexpected type %s";
    CFURLRef v11 = v8;
    uint32_t v12 = 22;
    goto LABEL_11;
  }
  if (v9)
  {
    int v14 = 136315394;
    uint64_t v15 = a2;
    __int16 v16 = 1024;
    LODWORD(name) = xpc_connection_get_pid(a3);
    int v10 = "%s (connection:  pid = %d)";
    CFURLRef v11 = v8;
    uint32_t v12 = 18;
    goto LABEL_11;
  }
}

void ___ZN5RXXPC11ClientEventEPv_block_invoke_27(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  pthread_mutex_lock((pthread_mutex_t *)(v1 + 128));
  pthread_mutex_lock((pthread_mutex_t *)(v1 + 64));
  AudioObjectID v2 = *(_xpc_connection_s **)(v1 + 32);
  if (v2)
  {
    xpc_connection_cancel(v2);
    xpc_release(*(xpc_object_t *)(v1 + 32));
    *(void *)(v1 + 32) = 0;
    *(unsigned char *)(v1 + 3) = 0;
    *(_WORD *)(v1 + 1) = 256;
    pthread_mutex_unlock((pthread_mutex_t *)(v1 + 64));
    pthread_cond_broadcast((pthread_cond_t *)(v1 + 192));
    pthread_mutex_unlock((pthread_mutex_t *)(v1 + 128));
    if (RXXPC::Queue(void)::sRXXGlobalQueueInit != -1) {
      dispatch_once(&RXXPC::Queue(void)::sRXXGlobalQueueInit, &__block_literal_global_2);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZN5RXXPC11ClientEventEPv_block_invoke_2;
    block[3] = &__block_descriptor_tmp_28;
    block[4] = v1;
    dispatch_async((dispatch_queue_t)RXXPC::Queue(void)::sRXXGlobalQueue, block);
  }
  else
  {
    *(unsigned char *)(v1 + 1) = 0;
    pthread_mutex_unlock((pthread_mutex_t *)(v1 + 64));
    pthread_cond_broadcast((pthread_cond_t *)(v1 + 192));
    pthread_mutex_unlock((pthread_mutex_t *)(v1 + 128));
  }
}

uint64_t ___ZN5RXXPC11ClientEventEPv_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  pthread_mutex_lock((pthread_mutex_t *)(v1 + 64));
  CFArrayRef v2 = *(const __CFArray **)(v1 + 48);
  if (v2)
  {
    CFIndex Count = CFArrayGetCount(v2);
    if (Count >= 1)
    {
      CFIndex v4 = Count;
      for (CFIndex i = 0; i != v4; ++i)
      {
        CFArrayRef ValueAtIndex = (void (**)(const void *, uint64_t, void))CFArrayGetValueAtIndex(*(CFArrayRef *)(v1 + 48), i);
        ValueAtIndex[2](ValueAtIndex, 1, v1);
      }
    }
  }
  return pthread_mutex_unlock((pthread_mutex_t *)(v1 + 64));
}

uint64_t ___ZN5RXXPC11ClientEventEPv_block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  pthread_mutex_lock((pthread_mutex_t *)(v1 + 128));
  *(unsigned char *)(v1 + 1) = 1;
  pthread_cond_broadcast((pthread_cond_t *)(v1 + 192));
  return pthread_mutex_unlock((pthread_mutex_t *)(v1 + 128));
}

void ___ZN5RXXPC11ClientEventEPv_block_invoke_4(uint64_t a1)
{
  xpc_object_t value = (RXRecognizer *)xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), kRDKeyRecognizer);
  RXRecognizer::Recognized(value, v3);
  CFIndex v4 = *(void **)(a1 + 32);
  xpc_release(v4);
}

void ___ZN5RXXPC11ClientEventEPv_block_invoke_5(uint64_t a1, void *a2)
{
  RXRecognitionSystem::Callback(*(RXRecognitionSystem **)(a1 + 32), a2);
  xpc_object_t v3 = *(void **)(a1 + 32);
  xpc_release(v3);
}

void ___ZN5RXXPC11ClientEventEPv_block_invoke_6(uint64_t a1, void *a2)
{
  RXXPC::DownloadCallback(*(RXXPC **)(a1 + 32), a2);
  xpc_object_t v3 = *(void **)(a1 + 32);
  xpc_release(v3);
}

void RXXPC::DownloadCallback(RXXPC *this, void *a2)
{
  if (xpc_dictionary_get_value(this, kRDKeyDownloadStatus))
  {
    if (MEMORY[0x230F5A450]() == MEMORY[0x263EF8708])
    {
      uint64_t v2 = _CFXPCCreateCFObjectFromXPCObject();
      if (v2)
      {
        xpc_object_t v3 = (const void *)v2;
        (*(void (**)(uint64_t, uint64_t))(RXXPC::sDownloadCB + 16))(RXXPC::sDownloadCB, v2);
        CFRelease(v3);
      }
    }
  }
}

BOOL RXXPC::WaitForServer(RXXPC *this)
{
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 128);
  pthread_mutex_lock((pthread_mutex_t *)this + 2);
  pthread_mutex_lock((pthread_mutex_t *)this + 1);
  if (*((unsigned char *)this + 3))
  {
    pthread_mutex_unlock((pthread_mutex_t *)this + 1);
  }
  else
  {
    uint64_t v3 = *((void *)this + 4);
    *((unsigned char *)this + 2) = 0;
    pthread_mutex_unlock((pthread_mutex_t *)this + 1);
    if (!v3) {
      RXXPC::EstablishConnection(this);
    }
    if (*((unsigned char *)this + 1))
    {
LABEL_6:
      if (!*((unsigned char *)this + 2))
      {
LABEL_13:
        BOOL v4 = *((unsigned char *)this + 3) == 0;
        goto LABEL_8;
      }
    }
    else
    {
      while (!*((unsigned char *)this + 2))
      {
        if (*((unsigned char *)this + 3)) {
          goto LABEL_13;
        }
        pthread_cond_wait((pthread_cond_t *)this + 4, v2);
        if (*((unsigned char *)this + 1)) {
          goto LABEL_6;
        }
      }
    }
  }
  BOOL v4 = 0;
LABEL_8:
  pthread_mutex_unlock(v2);
  return v4;
}

void RXXPC::~RXXPC(RXXPC *this)
{
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 64);
  pthread_mutex_lock((pthread_mutex_t *)this + 1);
  if (*((void *)this + 4))
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v3, kRDKeyMessage, 503);
    xpc_dictionary_set_uint64(v3, kRDKeyObjectID, *((void *)this + 5));
    xpc_object_t v4 = RXXPC::SendBrokerMessageWithReplySync((RXXPC *)v3, (void *)1);
    xpc_release(v3);
    xpc_release(v4);
    xpc_connection_cancel(*((xpc_connection_t *)this + 4));
    xpc_release(*((xpc_object_t *)this + 4));
    *((void *)this + 4) = 0;
  }
  uint64_t v5 = (const void *)*((void *)this + 6);
  if (v5)
  {
    CFRelease(v5);
    *((void *)this + 6) = 0;
  }
  pthread_mutex_unlock(v2);
  CFRelease(*((CFTypeRef *)this + 2));
  xpc_object_t v6 = (const void *)*((void *)this + 3);
  if (v6) {
    CFRelease(v6);
  }
}

uint64_t RXXPC::StartChanges(uint64_t this)
{
  return this;
}

void RXXPC::CommitChanges(RXXPC *this, void *a2, void *a3)
{
  if (RXXPC::WaitForServer(this))
  {
    BOOL v6 = a3 && xpc_array_get_count(a3) != 0;
    if (xpc_array_get_count(a2) || v6)
    {
      xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v7, kRDKeyMessage, 100);
      xpc_dictionary_set_uint64(v7, kRDKeyEpoch, *((void *)this + 7));
      if (xpc_array_get_count(a2)) {
        xpc_dictionary_set_value(v7, kRDKeyObjects, a2);
      }
      if (v6) {
        xpc_dictionary_set_value(v7, kRDKeyDead, a3);
      }
      RXXPC::SendMessage(this, v7, 0);
      xpc_release(v7);
    }
  }
}

xpc_object_t RXXPC::SendMessageWithReplySync(pthread_mutex_t *this, void *a2)
{
  xpc_object_t v4 = this + 1;
  pthread_mutex_lock(this + 1);
  uint64_t v5 = *(_xpc_connection_s **)&this->__opaque[24];
  if (v5 && !BYTE3(this->__sig)) {
    xpc_object_t v6 = xpc_connection_send_message_with_reply_sync(v5, a2);
  }
  else {
    xpc_object_t v6 = 0;
  }
  pthread_mutex_unlock(v4);
  return v6;
}

uint64_t RXXPC::AddHandler(uint64_t a1, const void *a2)
{
  xpc_object_t v4 = (pthread_mutex_t *)(a1 + 64);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 64));
  uint64_t v5 = *(__CFArray **)(a1 + 48);
  if (v5) {
    CFArrayAppendValue(v5, a2);
  }
  return pthread_mutex_unlock(v4);
}

uint64_t RXXPC::RemoveHandler(uint64_t a1, const void *a2)
{
  xpc_object_t v4 = (pthread_mutex_t *)(a1 + 64);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 64));
  CFArrayRef v5 = *(const __CFArray **)(a1 + 48);
  if (v5)
  {
    v9.size_t length = CFArrayGetCount(v5);
    v9.location = 0;
    FirstIndexOfCFDictionaryRef Value = CFArrayGetFirstIndexOfValue(*(CFArrayRef *)(a1 + 48), v9, a2);
    if (FirstIndexOfValue != -1) {
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 48), FirstIndexOfValue);
    }
  }
  return pthread_mutex_unlock(v4);
}

void RXXPC::SerializeCFArray(RXXPC *this, const char *a2, const __CFArray *a3, const __CFArray *a4)
{
  if (a3)
  {
    xpc_object_t empty = xpc_array_create_empty();
    if (CFArrayGetCount(a3) >= 1)
    {
      CFIndex v8 = 0;
      do
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a3, v8);
        if (ValueAtIndex)
        {
          CFStringRef v10 = ValueAtIndex;
          CStringPtr = CFStringGetCStringPtr(ValueAtIndex, 0x8000100u);
          if (!CStringPtr)
          {
            CFIndex Length = CFStringGetLength(v10);
            CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
            operator new[]();
          }
          xpc_object_t v13 = xpc_string_create(CStringPtr);
          xpc_array_append_value(empty, v13);
        }
        ++v8;
      }
      while (CFArrayGetCount(a3) > v8);
    }
    xpc_dictionary_set_value(this, a2, empty);
  }
}

void RXXPC::SerializeURL(RXXPC *this, void *a2, const __CFURL *a3)
{
  CFDataRef v4 = (const __CFData *)MEMORY[0x230F59DF0](0, a2, 0, 0, 0, 0);
  if (v4)
  {
    CFDataRef v5 = v4;
    xpc_object_t v6 = kRDKeyURL;
    BytePtr = CFDataGetBytePtr(v4);
    size_t Length = CFDataGetLength(v5);
    xpc_dictionary_set_data(this, v6, BytePtr, Length);
    CFRelease(v5);
  }
}

uint64_t RXXPC::CopyLanguageInstallationStatus(RXXPC *this)
{
  xpc_object_t v1 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v1, kRDKeyMessage, 504);
  xpc_object_t v2 = RXXPC::SendBrokerMessageWithReplySync((RXXPC *)v1, (void *)1);
  xpc_release(v1);
  if (!v2) {
    return 0;
  }
  if (MEMORY[0x230F5A450](v2) == MEMORY[0x263EF8708] && xpc_dictionary_get_value(v2, kRDKeyAssetStatus)) {
    uint64_t v3 = _CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    uint64_t v3 = 0;
  }
  xpc_release(v2);
  return v3;
}

void RXXPC::StartInstallationForLanguage(const __CFString *this, const __CFString *a2)
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, kRDKeyMessage, 505);
  RXXPC::SerializeCFString((RXXPC *)v3, kRDKeyLocale, this, v4);
  xpc_object_t v5 = RXXPC::SendBrokerMessageWithReplySync((RXXPC *)v3, (void *)1);
  xpc_release(v3);
  if (v5)
  {
    xpc_release(v5);
  }
}

void RXXPC::SetNonPurgeabilityForLanguages(RXXPC *this, const __CFArray *a2)
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, kRDKeyMessage, 511);
  RXXPC::SerializeCFArray((RXXPC *)v3, kRDKeyLocales, this, v4);
  xpc_object_t v5 = RXXPC::SendBrokerMessageWithReplySync((RXXPC *)v3, (void *)1);
  xpc_release(v3);
  if (v5)
  {
    xpc_release(v5);
  }
}

uint64_t RXXPC::CopyInstalledAssetPathForLanguage(const __CFString *this, const __CFString *a2)
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, kRDKeyMessage, 509);
  RXXPC::SerializeCFString((RXXPC *)v3, kRDKeyLocale, this, v4);
  xpc_object_t v5 = RXXPC::SendBrokerMessageWithReplySync((RXXPC *)v3, (void *)1);
  xpc_release(v3);
  if (!v5) {
    return 0;
  }
  if (MEMORY[0x230F5A450](v5) == MEMORY[0x263EF8708])
  {
    xpc_dictionary_get_value(v5, kRDKeyInstalledAssetPath);
    uint64_t v6 = _CFXPCCreateCFObjectFromXPCObject();
  }
  else
  {
    uint64_t v6 = 0;
  }
  xpc_release(v5);
  return v6;
}

uint64_t RXXPC::CopyInstalledAssetSupportedTasksForLanguage(RXXPC *this, const __CFString *a2)
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, kRDKeyMessage, 510);
  RXXPC::SerializeCFString((RXXPC *)v3, kRDKeyLocale, a2, v4);
  xpc_object_t v5 = RXXPC::SendBrokerMessageWithReplySync((RXXPC *)v3, (void *)1);
  xpc_release(v3);
  if (!v5) {
    return 0;
  }
  if (MEMORY[0x230F5A450](v5) == MEMORY[0x263EF8708])
  {
    xpc_dictionary_get_value(v5, kRDKeyInstalledAssetSupportedTasks);
    uint64_t v6 = _CFXPCCreateCFObjectFromXPCObject();
  }
  else
  {
    uint64_t v6 = 0;
  }
  xpc_release(v5);
  return v6;
}

void RXXPC::CancelInstallationForLanguage(const __CFString *this, const __CFString *a2)
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, kRDKeyMessage, 508);
  RXXPC::SerializeCFString((RXXPC *)v3, kRDKeyLocale, this, v4);
  RXXPC::SendBrokerMessageWithReplySync((RXXPC *)v3, (void *)1);
  xpc_release(v3);
}

int64_t RXXPC::PurgeInstalledAssets(RXXPC *this)
{
  xpc_object_t v1 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v1, kRDKeyMessage, 506);
  xpc_object_t v2 = RXXPC::SendBrokerMessageWithReplySync((RXXPC *)v1, (void *)1);
  xpc_release(v1);
  if (!v2) {
    return 0;
  }
  if (MEMORY[0x230F5A450](v2) == MEMORY[0x263EF8738]) {
    int64_t int64 = xpc_dictionary_get_int64(v2, kRDKeyAssetStatus);
  }
  else {
    int64_t int64 = 0;
  }
  xpc_release(v2);
  return int64;
}

void RXXPC::SetDownloadCallback(const void *a1)
{
  RXXPC::sDownloadCB = (uint64_t)_Block_copy(a1);
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, kRDKeyMessage, 507);
  xpc_dictionary_set_BOOL(v2, kRDKeyDownloadProgress, a1 != 0);
  RXXPC::SendBrokerMessageWithReplySync((RXXPC *)v2, 0);
  xpc_release(v2);
}

CFStringRef RDCopyModelPath(void)
{
  CFArrayRef v0 = (const __CFArray *)CFCopySearchPathForDirectoriesInDomains();
  CFURLRef ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v0, 0);
  CFStringRef v2 = CFURLCopyFileSystemPath(ValueAtIndex, kCFURLPOSIXPathStyle);
  CFStringRef v3 = CFStringCreateWithFormat(0, 0, @"%@/Speech/Recognizers/SpeechRecognitionCoreLanguages", v2);
  CFRelease(v2);
  CFRelease(v0);
  return v3;
}

CFURLRef RDCopyCacheURL(void)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  CFArrayRef v0 = (const __CFArray *)CFCopySearchPathForDirectoriesInDomains();
  CFURLRef ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v0, 0);
  CFURLRef v2 = CFURLCreateCopyAppendingPathComponent(0, ValueAtIndex, @"com.apple.SpeechRecognitionCore", 1u);
  CFRelease(v0);
  CFStringRef v3 = CFURLCopyPath(v2);
  if (v3)
  {
    CFStringRef v4 = v3;
    CFStringGetCString(v3, buffer, 2000, 0x8000100u);
    xpc_object_t v5 = opendir(buffer);
    if (v5)
    {
      closedir(v5);
    }
    else if (mkdir(buffer, 0x1EDu))
    {
      xpc_object_t v7 = RXOSLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = 138412290;
        CFURLRef v9 = v2;
        _os_log_impl(&dword_22BF8A000, v7, OS_LOG_TYPE_ERROR, "Error creating %@", (uint8_t *)&v8, 0xCu);
      }
    }
    CFRelease(v4);
  }
  return v2;
}

CFDictionaryRef RDCopyInfoDict(CFURLRef url)
{
  CFURLRef v1 = CFURLCreateCopyAppendingPathComponent(0, url, @"Info.plist", 0);
  return RDCopyInfoDictWithInfoURL(v1);
}

CFDictionaryRef RDCopyInfoDictWithInfoURL(CFURLRef fileURL)
{
  if (!fileURL) {
    return 0;
  }
  CFURLRef v2 = CFReadStreamCreateWithFile(0, fileURL);
  if (v2)
  {
    CFStringRef v3 = v2;
    CFReadStreamOpen(v2);
    CFErrorRef error = 0;
    CFDictionaryRef v4 = (const __CFDictionary *)CFPropertyListCreateWithStream(0, v3, 0, 0, 0, &error);
    CFDictionaryRef v5 = v4;
    if (v4)
    {
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v4, @"CFBundleShortVersionString");
      if (CFStringGetCharacterAtIndex(Value, 0) <= 0x31u)
      {
        CFRelease(v5);
        CFDictionaryRef v5 = 0;
      }
    }
    CFReadStreamClose(v3);
    CFRelease(v3);
  }
  else
  {
    CFDictionaryRef v5 = 0;
  }
  CFRelease(fileURL);
  return v5;
}

const void *RDCopyCacheVersion(const __CFString *a1)
{
  CFURLRef v1 = RDCopyLanguageCacheURL(a1);
  if (v1)
  {
    CFURLRef v2 = v1;
    CFURLRef v3 = CFURLCreateCopyAppendingPathComponent(0, v1, @"Info.plist", 0);
    CFDictionaryRef v4 = RDCopyInfoDictWithInfoURL(v3);
    if (v4)
    {
      CFDictionaryRef v5 = v4;
      CFStringRef Value = CFDictionaryGetValue(v4, @"CFBundleShortVersionString");
      if (Value)
      {
        xpc_object_t v7 = Value;
        CFRetain(Value);
        CFRelease(v5);
LABEL_15:
        CFRelease(v2);
        return v7;
      }
      CFRelease(v5);
    }
    RDURL::RDURL((RDURL *)__p, v2, 0);
    if (v11 >= 0) {
      int v8 = __p;
    }
    else {
      int v8 = (void **)__p[0];
    }
    if (stat((const char *)v8, &v12)) {
      xpc_object_t v7 = 0;
    }
    else {
      xpc_object_t v7 = (const void *)*MEMORY[0x263EFFB40];
    }
    if (v11 < 0) {
      operator delete(__p[0]);
    }
    goto LABEL_15;
  }
  return 0;
}

void sub_22BF97D94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

CFURLRef RDCopyLanguageCacheURL(const __CFString *a1)
{
  CFStringRef v1 = RDCopyBestNashvilleLocaleIdentifier(a1);
  if (!v1) {
    return 0;
  }
  CFStringRef v2 = v1;
  CFURLRef v3 = RDCopyCacheURL();
  if (v3)
  {
    CFURLRef v4 = v3;
    CFURLRef v5 = CFURLCreateCopyAppendingPathComponent(0, v3, @"Users", 1u);
    if (v5)
    {
      CFURLRef v6 = v5;
      CFURLRef v7 = CFURLCreateCopyAppendingPathComponent(0, v5, v2, 1u);
      CFRelease(v6);
    }
    else
    {
      CFURLRef v7 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    CFURLRef v7 = 0;
  }
  CFRelease(v2);
  return v7;
}

void RDNukeCache(const __CFString *a1)
{
  if (a1)
  {
    CFURLRef v1 = RDCopyLanguageCacheURL(a1);
    if (!v1) {
      return;
    }
    RDURL::RDURL((RDURL *)__p, v1, 1);
    if (v5 >= 0) {
      CFStringRef v2 = __p;
    }
    else {
      CFStringRef v2 = (void **)__p[0];
    }
  }
  else
  {
    CFURLRef v3 = RDCopyCacheURL();
    if (!v3) {
      return;
    }
    RDURL::RDURL((RDURL *)__p, v3, 1);
    if (v5 >= 0) {
      CFStringRef v2 = __p;
    }
    else {
      CFStringRef v2 = (void **)__p[0];
    }
  }
  removefile((const char *)v2, 0, 1u);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
}

void sub_22BF97F08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

__CFSet *RDCopyNashvilleModelLanguages(void)
{
  CFStringRef v0 = RDCopyModelPath();
  RDString::RDString((RDString *)v22, v0, 1);
  if ((v23 & 0x80u) == 0) {
    CFURLRef v1 = v22;
  }
  else {
    CFURLRef v1 = (void **)v22[0];
  }
  CFStringRef v2 = opendir((const char *)v1);
  CFMutableSetRef Mutable = CFSetCreateMutable(0, 0, MEMORY[0x263EFFFA0]);
  CFURLRef v4 = Mutable;
  if (v2) {
    BOOL v5 = Mutable == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    while (1)
    {
      while (1)
      {
        do
        {
          CFURLRef v6 = readdir(v2);
          if (!v6)
          {
            closedir(v2);
            goto LABEL_30;
          }
          d_name = v6->d_name;
          int v8 = strstr(v6->d_name, ".SpeechRecognition");
        }
        while (!v8);
        CFURLRef v9 = v8;
        if ((v23 & 0x80u) == 0) {
          size_t v10 = v23;
        }
        else {
          size_t v10 = (size_t)v22[1];
        }
        std::string::basic_string[abi:ne180100]((uint64_t)&v20, v10 + 1);
        if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          char v11 = &v20;
        }
        else {
          char v11 = (std::string *)v20.__r_.__value_.__r.__words[0];
        }
        if (v10)
        {
          if ((v23 & 0x80u) == 0) {
            stat v12 = v22;
          }
          else {
            stat v12 = (void **)v22[0];
          }
          memmove(v11, v12, v10);
        }
        *(_WORD *)((char *)&v11->__r_.__value_.__l.__data_ + v10) = 47;
        xpc_object_t v13 = std::string::append(&v20, d_name);
        long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
        __p.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v14;
        v13->__r_.__value_.__l.__size_ = 0;
        v13->__r_.__value_.__r.__words[2] = 0;
        v13->__r_.__value_.__r.__words[0] = 0;
        BOOL v15 = CheckLocale(&__p);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
          break;
        }
        if (v15) {
          goto LABEL_27;
        }
      }
      operator delete(v20.__r_.__value_.__l.__data_);
      if (v15)
      {
LABEL_27:
        CFStringRef v16 = CFStringCreateWithBytes(0, (const UInt8 *)d_name, v9 - d_name, 0x8000100u, 0);
        CFSetAddValue(v4, v16);
        CFRelease(v16);
        CFRange v17 = strchr(d_name, 95);
        if (v17)
        {
          CFStringRef v18 = CFStringCreateWithBytes(0, (const UInt8 *)d_name, v17 - d_name, 0x8000100u, 0);
          CFSetAddValue(v4, v18);
          CFRelease(v18);
        }
      }
    }
  }
LABEL_30:
  if ((char)v23 < 0) {
    operator delete(v22[0]);
  }
  return v4;
}

void sub_22BF98144(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL CheckLocale(std::string *a1)
{
  CFURLRef v1 = a1;
  std::string::append(a1, "/Contents/Info.plist");
  CFStringRef v2 = (const char *)v1;
  if (SHIBYTE(v1->__r_.__value_.__r.__words[2]) < 0) {
    CFStringRef v2 = (const char *)v1->__r_.__value_.__r.__words[0];
  }
  if (stat(v2, &v9)) {
    return 0;
  }
  if (SHIBYTE(v1->__r_.__value_.__r.__words[2]) < 0) {
    CFURLRef v1 = (std::string *)v1->__r_.__value_.__r.__words[0];
  }
  CFStringRef v4 = CFStringCreateWithCStringNoCopy(0, (const char *)v1, 0x8000100u, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  if (!v4) {
    return 0;
  }
  CFStringRef v5 = v4;
  CFURLRef v6 = CFURLCreateWithFileSystemPath(0, v4, kCFURLPOSIXPathStyle, 0);
  CFDictionaryRef v7 = RDCopyInfoDictWithInfoURL(v6);
  BOOL v3 = v7 != 0;
  if (v7) {
    CFRelease(v7);
  }
  CFRelease(v5);
  return v3;
}

CFStringRef RDCopyBestNashvilleLocaleIdentifier(CFStringRef theString)
{
  RDString::RDString((RDString *)&v66, theString, 0);
  std::string v67 = v66;
  memset(&v66, 0, sizeof(v66));
  CFStringRef v1 = RDCopyModelPath();
  if (!v1)
  {
    std::string::basic_string[abi:ne180100]<0>(&cStr, "");
    goto LABEL_169;
  }
  RDString::RDString((RDString *)v80, v1, 1);
  std::string::push_back(v2, 47);
  std::string::basic_string[abi:ne180100]<0>(&v77, ".SpeechRecognition");
  std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v80, (const void **)&v67.__r_.__value_.__l.__data_, (uint64_t)&v75);
  if ((v79 & 0x80u) == 0) {
    BOOL v3 = (const std::string::value_type *)&v77;
  }
  else {
    BOOL v3 = (const std::string::value_type *)v77;
  }
  if ((v79 & 0x80u) == 0) {
    std::string::size_type v4 = v79;
  }
  else {
    std::string::size_type v4 = v78;
  }
  CFStringRef v5 = std::string::append(&v75, v3, v4);
  long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
  v76.__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v76.__r_.__value_.__l.__data_ = v6;
  v5->__r_.__value_.__l.__size_ = 0;
  v5->__r_.__value_.__r.__words[2] = 0;
  v5->__r_.__value_.__r.__words[0] = 0;
  BOOL v7 = CheckLocale(&v76);
  if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v76.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v75.__r_.__value_.__l.__data_);
    if (v7) {
      goto LABEL_59;
    }
  }
  else if (v7)
  {
    goto LABEL_59;
  }
  std::string::size_type v8 = std::string::find(&v67, 46, 0);
  if (v8 != -1)
  {
    stat v9 = (char *)&v67 + HIBYTE(v67.__r_.__value_.__r.__words[2]);
    if ((v67.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    {
      size_t v10 = &v67;
    }
    else
    {
      stat v9 = (char *)(v67.__r_.__value_.__r.__words[0] + v67.__r_.__value_.__l.__size_);
      size_t v10 = (std::string *)v67.__r_.__value_.__r.__words[0];
    }
    std::string::erase(&v67, v8, v9 - ((char *)v10 + v8));
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v80, (const void **)&v67.__r_.__value_.__l.__data_, (uint64_t)&v74);
    if ((v79 & 0x80u) == 0) {
      char v11 = (const std::string::value_type *)&v77;
    }
    else {
      char v11 = (const std::string::value_type *)v77;
    }
    if ((v79 & 0x80u) == 0) {
      std::string::size_type v12 = v79;
    }
    else {
      std::string::size_type v12 = v78;
    }
    xpc_object_t v13 = std::string::append(&v74, v11, v12);
    long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    v75.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v75.__r_.__value_.__l.__data_ = v14;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v13->__r_.__value_.__r.__words[0] = 0;
    BOOL v15 = CheckLocale(&v75);
    if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v75.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v74.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v74.__r_.__value_.__l.__data_);
      if (v15) {
        goto LABEL_59;
      }
    }
    else if (v15)
    {
      goto LABEL_59;
    }
  }
  if ((v67.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    CFStringRef v16 = &v67;
  }
  else {
    CFStringRef v16 = (std::string *)v67.__r_.__value_.__r.__words[0];
  }
  if ((v67.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v67.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v67.__r_.__value_.__l.__size_;
  }
  if (size)
  {
    CFStringRef v18 = (unsigned __int8 *)v16 + size;
    CFRange v19 = v16;
LABEL_39:
    uint64_t v20 = 0;
    while (v19->__r_.__value_.__s.__data_[0] != asc_22BF9B1A9[v20])
    {
      if (++v20 == 2)
      {
        CFRange v19 = (std::string *)((char *)v19 + 1);
        if (v19 == (std::string *)v18) {
          goto LABEL_60;
        }
        goto LABEL_39;
      }
    }
    if (v19 != (std::string *)v18 && (char *)v19 - (char *)v16 != -1)
    {
      unint64_t v21 = (char *)&v67 + HIBYTE(v67.__r_.__value_.__r.__words[2]);
      if ((v67.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        unint64_t v21 = (char *)(v67.__r_.__value_.__r.__words[0] + v67.__r_.__value_.__l.__size_);
      }
      std::string::erase(&v67, (char *)v19 - (char *)v16, v21 - (char *)v19);
      std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v80, (const void **)&v67.__r_.__value_.__l.__data_, (uint64_t)&v73);
      if ((v79 & 0x80u) == 0) {
        uint64_t v22 = (const std::string::value_type *)&v77;
      }
      else {
        uint64_t v22 = (const std::string::value_type *)v77;
      }
      if ((v79 & 0x80u) == 0) {
        std::string::size_type v23 = v79;
      }
      else {
        std::string::size_type v23 = v78;
      }
      int v24 = std::string::append(&v73, v22, v23);
      long long v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
      v74.__r_.__value_.__r.__words[2] = v24->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v74.__r_.__value_.__l.__data_ = v25;
      v24->__r_.__value_.__l.__size_ = 0;
      v24->__r_.__value_.__r.__words[2] = 0;
      v24->__r_.__value_.__r.__words[0] = 0;
      BOOL v26 = CheckLocale(&v74);
      if (SHIBYTE(v74.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v74.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v73.__r_.__value_.__l.__data_);
      }
      if (v26)
      {
LABEL_59:
        std::string cStr = v67;
        memset(&v67, 0, sizeof(v67));
        goto LABEL_165;
      }
    }
  }
LABEL_60:
  std::string::basic_string[abi:ne180100]<0>(&v73, "");
  if ((SHIBYTE(v67.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) != 2) {
      goto LABEL_76;
    }
    if (LOWORD(v67.__r_.__value_.__l.__data_) != 28261)
    {
      if (LOWORD(v67.__r_.__value_.__l.__data_) != 29286)
      {
        if (LOWORD(v67.__r_.__value_.__l.__data_) != 29541)
        {
          uint64_t v27 = &v67;
          goto LABEL_70;
        }
LABEL_74:
        UniChar v28 = "es_US";
        goto LABEL_75;
      }
LABEL_73:
      UniChar v28 = "fr_FR";
      goto LABEL_75;
    }
LABEL_72:
    UniChar v28 = "en_US";
    goto LABEL_75;
  }
  if (v67.__r_.__value_.__l.__size_ != 2) {
    goto LABEL_76;
  }
  uint64_t v27 = (std::string *)v67.__r_.__value_.__r.__words[0];
  switch(*(_WORD *)v67.__r_.__value_.__l.__data_)
  {
    case 0x6E65:
      goto LABEL_72;
    case 0x7266:
      goto LABEL_73;
    case 0x7365:
      goto LABEL_74;
  }
LABEL_70:
  if (LOWORD(v27->__r_.__value_.__l.__data_) == 25956)
  {
    UniChar v28 = "de_DE";
LABEL_75:
    MEMORY[0x230F59F20](&v73, v28);
  }
LABEL_76:
  std::string::size_type v29 = HIBYTE(v73.__r_.__value_.__r.__words[2]);
  if ((v73.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v29 = v73.__r_.__value_.__l.__size_;
  }
  if (v29)
  {
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v80, (const void **)&v73.__r_.__value_.__l.__data_, (uint64_t)&__s1);
    if ((v79 & 0x80u) == 0) {
      unint64_t v30 = (const std::string::value_type *)&v77;
    }
    else {
      unint64_t v30 = (const std::string::value_type *)v77;
    }
    if ((v79 & 0x80u) == 0) {
      std::string::size_type v31 = v79;
    }
    else {
      std::string::size_type v31 = v78;
    }
    CFArrayRef v32 = std::string::append(&__s1, v30, v31);
    long long v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
    __p.__r_.__value_.__r.__words[2] = v32->__r_.__value_.__r.__words[2];
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v33;
    v32->__r_.__value_.__l.__size_ = 0;
    v32->__r_.__value_.__r.__words[2] = 0;
    v32->__r_.__value_.__r.__words[0] = 0;
    BOOL v34 = CheckLocale(&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(__s1.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__s1.__r_.__value_.__l.__data_);
      if (v34) {
        goto LABEL_89;
      }
    }
    else if (v34)
    {
LABEL_89:
      std::string cStr = v73;
      memset(&v73, 0, sizeof(v73));
      goto LABEL_163;
    }
  }
  if ((v81 & 0x80u) == 0) {
    unint64_t v35 = (const char *)v80;
  }
  else {
    unint64_t v35 = (const char *)v80[0];
  }
  uint64_t v36 = opendir(v35);
  if (!v36)
  {
LABEL_162:
    std::string::basic_string[abi:ne180100]<0>(&cStr, "");
    goto LABEL_163;
  }
  while (1)
  {
    unint64_t v37 = readdir(v36);
    if (!v37)
    {
      closedir(v36);
      goto LABEL_162;
    }
    d_name = v37->d_name;
    std::string::basic_string[abi:ne180100]<0>(&__s1, v37->d_name);
    int64_t v39 = HIBYTE(__s1.__r_.__value_.__r.__words[2]);
    int v40 = SHIBYTE(__s1.__r_.__value_.__r.__words[2]);
    p_s1 = (std::string *)__s1.__r_.__value_.__r.__words[0];
    uint64_t v42 = (__s1.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &__s1
        : (std::string *)__s1.__r_.__value_.__r.__words[0];
    unint64_t v43 = (v79 & 0x80u) == 0 ? (void **)&v77 : v77;
    int64_t v44 = (v79 & 0x80u) == 0 ? v79 : v78;
    if (!v44) {
      goto LABEL_140;
    }
    if ((__s1.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      int64_t v39 = __s1.__r_.__value_.__l.__size_;
    }
    if (v39 >= v44)
    {
      v45 = (char *)v42 + v39;
      int v46 = *(char *)v43;
      uint64_t v47 = v42;
      while (1)
      {
        int64_t v48 = v39 - v44;
        if (v48 == -1) {
          goto LABEL_159;
        }
        uint64_t v49 = (char *)memchr(v47, v46, v48 + 1);
        if (!v49) {
          goto LABEL_159;
        }
        unint64_t v50 = v49;
        if (!memcmp(v49, v43, v44)) {
          break;
        }
        uint64_t v47 = (std::string *)(v50 + 1);
        int64_t v39 = v45 - (v50 + 1);
        if (v39 < v44) {
          goto LABEL_159;
        }
      }
      if (v50 != v45 && v50 - (char *)v42 != -1)
      {
LABEL_140:
        std::string::size_type v51 = (v67.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
            ? HIBYTE(v67.__r_.__value_.__r.__words[2])
            : v67.__r_.__value_.__l.__size_;
        if (v40 < 0)
        {
          if (v51 == -1) {
LABEL_186:
          }
            std::string::__throw_out_of_range[abi:ne180100]();
          unint64_t v52 = __s1.__r_.__value_.__l.__size_ >= 2 ? 2 : __s1.__r_.__value_.__l.__size_;
        }
        else
        {
          if (v51 == -1) {
            goto LABEL_186;
          }
          unint64_t v52 = (v40 & 0xFE) != 0 ? 2 : v40;
          p_s1 = &__s1;
        }
        uint64_t v53 = (v67.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
            ? &v67
            : (std::string *)v67.__r_.__value_.__r.__words[0];
        size_t v54 = v52 >= v51 ? v51 : v52;
        if (!memcmp(p_s1, v53, v54) && v52 == v51) {
          break;
        }
      }
    }
LABEL_159:
    if ((v40 & 0x80) != 0) {
      operator delete(__s1.__r_.__value_.__l.__data_);
    }
  }
  if ((v81 & 0x80u) == 0) {
    size_t v56 = v81;
  }
  else {
    size_t v56 = (size_t)v80[1];
  }
  std::string::basic_string[abi:ne180100]((uint64_t)&v69, v56 + 1);
  if ((v69.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v57 = &v69;
  }
  else {
    v57 = (std::string *)v69.__r_.__value_.__r.__words[0];
  }
  if (v56)
  {
    if ((v81 & 0x80u) == 0) {
      v58 = v80;
    }
    else {
      v58 = (const void **)v80[0];
    }
    memmove(v57, v58, v56);
  }
  *(_WORD *)((char *)&v57->__r_.__value_.__l.__data_ + v++*(void *)(this + 56) = 47;
  v59 = std::string::append(&v69, d_name);
  long long v60 = *(_OWORD *)&v59->__r_.__value_.__l.__data_;
  v70.__r_.__value_.__r.__words[2] = v59->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v70.__r_.__value_.__l.__data_ = v60;
  v59->__r_.__value_.__l.__size_ = 0;
  v59->__r_.__value_.__r.__words[2] = 0;
  v59->__r_.__value_.__r.__words[0] = 0;
  BOOL v61 = CheckLocale(&v70);
  if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v70.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v69.__r_.__value_.__l.__data_);
  }
  if (!v61)
  {
    LOBYTE(v40) = *((unsigned char *)&__s1.__r_.__value_.__s + 23);
    goto LABEL_159;
  }
  closedir(v36);
  std::string::size_type v65 = std::string::find[abi:ne180100]((uint64_t *)&__s1, (char *)&v77, 0);
  std::string::basic_string(&cStr, &__s1, 0, v65, (std::allocator<char> *)&v69);
  if (SHIBYTE(__s1.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s1.__r_.__value_.__l.__data_);
  }
LABEL_163:
  if (SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v73.__r_.__value_.__l.__data_);
  }
LABEL_165:
  if ((char)v79 < 0) {
    operator delete(v77);
  }
  if ((char)v81 < 0) {
    operator delete((void *)v80[0]);
  }
LABEL_169:
  if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v67.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v66.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(cStr.__r_.__value_.__r.__words[2]) < 0)
  {
    if (cStr.__r_.__value_.__l.__size_)
    {
      p_std::string cStr = (std::string *)cStr.__r_.__value_.__r.__words[0];
LABEL_178:
      CFStringRef v63 = CFStringCreateWithCString(0, (const char *)p_cStr, 0x8000100u);
      if ((SHIBYTE(cStr.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        return v63;
      }
    }
    else
    {
      CFStringRef v63 = 0;
    }
    operator delete(cStr.__r_.__value_.__l.__data_);
    return v63;
  }
  if (*((unsigned char *)&cStr.__r_.__value_.__s + 23))
  {
    p_std::string cStr = &cStr;
    goto LABEL_178;
  }
  return 0;
}

void sub_22BF98A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,uint64_t a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43,void *__p,uint64_t a45,int a46,__int16 a47,char a48,char a49)
{
  if (a49 < 0) {
    operator delete(__p);
  }
  if (a43 < 0) {
    operator delete(a38);
  }
  if (*(char *)(v49 - 129) < 0) {
    operator delete(*(void **)(v49 - 152));
  }
  if (*(char *)(v49 - 105) < 0) {
    operator delete(*(void **)(v49 - 128));
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(a1);
}

uint64_t RDDoLocaleIdentifiersMatch(CFLocaleIdentifier localeIdentifier, const __CFString *a2)
{
  CFLocaleRef v3 = CFLocaleCreate(0, localeIdentifier);
  CFLocaleRef v4 = CFLocaleCreate(0, a2);
  if (v3)
  {
    CFLocaleRef v5 = v4;
    if (!v4)
    {
      uint64_t v14 = 0;
      goto LABEL_12;
    }
    CFStringRef v6 = (const __CFString *)*MEMORY[0x263EFFCF0];
    CFStringRef Value = (const __CFString *)CFLocaleGetValue(v3, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
    CFStringRef v8 = (const __CFString *)*MEMORY[0x263EFFCB0];
    CFStringRef v9 = (const __CFString *)CFLocaleGetValue(v3, (CFLocaleKey)*MEMORY[0x263EFFCB0]);
    CFStringRef v10 = (const __CFString *)CFLocaleGetValue(v5, v6);
    CFStringRef v11 = (const __CFString *)CFLocaleGetValue(v5, v8);
    if (Value) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12) {
      goto LABEL_8;
    }
    CFStringRef v13 = v11;
    if (CFStringCompare(Value, v10, 0)) {
      goto LABEL_8;
    }
    if (v9) {
      BOOL v16 = v13 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    if (v16)
    {
      if (!((unint64_t)v9 | (unint64_t)v13)) {
        goto LABEL_22;
      }
    }
    else if (CFEqual(v9, v13))
    {
LABEL_22:
      uint64_t v14 = 1;
      goto LABEL_9;
    }
LABEL_8:
    uint64_t v14 = 0;
LABEL_9:
    CFRelease(v5);
LABEL_12:
    CFRelease(v3);
    return v14;
  }
  return 0;
}

void RDString::RDString(RDString *this, CFStringRef theString, int a3)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  if (theString)
  {
    if (CFStringGetCStringPtr(theString, 0x8000100u))
    {
      MEMORY[0x230F59F20](this);
    }
    else
    {
      CFIndex Length = CFStringGetLength(theString);
      CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
      std::string::resize((std::string *)this, MaximumSizeForEncoding + 2, 0);
      CFStringRef v8 = (char *)this;
      if (*((char *)this + 23) < 0) {
        CFStringRef v8 = *(char **)this;
      }
      CFStringGetCString(theString, v8, MaximumSizeForEncoding + 1, 0x8000100u);
      CFStringRef v9 = (const char *)this;
      if (*((char *)this + 23) < 0) {
        CFStringRef v9 = *(const char **)this;
      }
      size_t v10 = strlen(v9);
      std::string::resize((std::string *)this, v10, 0);
    }
    if (a3) {
      CFRelease(theString);
    }
  }
}

void sub_22BF98E14(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void RDInt::RDInt(RDInt *this, CFNumberRef number, int a3)
{
  if (number)
  {
    CFNumberGetValue(number, kCFNumberIntType, this);
    if (a3) {
      CFRelease(number);
    }
  }
  else
  {
    *(_DWORD *)this = 0;
  }
}

void RDURL::RDURL(RDURL *this, CFURLRef anURL, int a3)
{
  if (anURL)
  {
    CFStringRef v6 = CFURLCopyFileSystemPath(anURL, kCFURLPOSIXPathStyle);
    RDString::RDString(this, v6, 1);
    if (a3) {
      CFRelease(anURL);
    }
  }
  else
  {
    *(void *)this = 0;
    *((void *)this + 1) = 0;
    *((void *)this + 2) = 0;
  }
}

void sub_22BF98F04(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

std::string *RDURL::DirName(std::string *this)
{
  dispatch_queue_t result = (std::string *)std::string::rfind(this, 47, 0xFFFFFFFFFFFFFFFFLL);
  if (result != (std::string *)-1)
  {
    return std::string::erase(this, (std::string::size_type)result, 0xFFFFFFFFFFFFFFFFLL);
  }
  return result;
}

uint64_t std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>@<X0>(const void **a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
{
  if (*((char *)a1 + 23) >= 0) {
    size_t v5 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v5 = (size_t)a1[1];
  }
  if (*((char *)a2 + 23) >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  uint64_t result = std::string::basic_string[abi:ne180100](a3, v6 + v5);
  if (*(char *)(result + 23) >= 0) {
    CFStringRef v8 = (char *)result;
  }
  else {
    CFStringRef v8 = *(char **)result;
  }
  if (v5)
  {
    if (*((char *)a1 + 23) >= 0) {
      CFStringRef v9 = a1;
    }
    else {
      CFStringRef v9 = *a1;
    }
    uint64_t result = (uint64_t)memmove(v8, v9, v5);
  }
  size_t v10 = &v8[v5];
  if (v6)
  {
    if (*((char *)a2 + 23) >= 0) {
      CFStringRef v11 = a2;
    }
    else {
      CFStringRef v11 = *a2;
    }
    uint64_t result = (uint64_t)memmove(v10, v11, v6);
  }
  v10[v6] = 0;
  return result;
}

uint64_t std::string::find[abi:ne180100](uint64_t *a1, char *a2, unint64_t a3)
{
  uint64_t v3 = (uint64_t)a1;
  if (*((char *)a1 + 23) < 0)
  {
    uint64_t v3 = *a1;
    unint64_t v4 = a1[1];
  }
  else
  {
    unint64_t v4 = *((unsigned __int8 *)a1 + 23);
  }
  int v5 = a2[23];
  if (v5 >= 0) {
    size_t v6 = a2;
  }
  else {
    size_t v6 = *(char **)a2;
  }
  if (v5 >= 0) {
    int64_t v7 = a2[23];
  }
  else {
    int64_t v7 = *((void *)a2 + 1);
  }
  if (v4 < a3) {
    return -1;
  }
  if (v7)
  {
    CFStringRef v8 = (void *)(v3 + a3);
    CFStringRef v9 = (char *)(v3 + v4);
    int64_t v10 = v4 - a3;
    if (v10 >= v7)
    {
      int v13 = *v6;
      do
      {
        uint64_t v14 = v10 - v7;
        if (v14 == -1) {
          break;
        }
        BOOL v15 = (char *)memchr(v8, v13, v14 + 1);
        if (!v15) {
          break;
        }
        CFStringRef v11 = v15;
        if (!memcmp(v15, v6, v7)) {
          goto LABEL_15;
        }
        CFStringRef v8 = v11 + 1;
        int64_t v10 = v9 - (v11 + 1);
      }
      while (v10 >= v7);
    }
    CFStringRef v11 = v9;
LABEL_15:
    if (v11 == v9) {
      return -1;
    }
    else {
      return (uint64_t)&v11[-v3];
    }
  }
  return a3;
}

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    size_t v6 = operator new(v4 + 1);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000;
    *(void *)a1 = v6;
  }
  else
  {
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 23) = a2;
  }
  return a1;
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264904698, MEMORY[0x263F8C068]);
}

void sub_22BF9920C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

void RXXPC::ClientEvent()
{
  __assert_rtn("ClientEvent", "RXXPC.cpp", 350, "type == XPC_TYPE_DICTIONARY");
}

OSStatus AudioObjectGetPropertyData(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, UInt32 inQualifierDataSize, const void *inQualifierData, UInt32 *ioDataSize, void *outData)
{
  return MEMORY[0x270EE4128](*(void *)&inObjectID, inAddress, *(void *)&inQualifierDataSize, inQualifierData, ioDataSize, outData);
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE42E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x270EE42F8](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4310](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE4338](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x270EE45B8](allocator, bundleURL);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x270EE45C8](bundleID);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EE4610](bundle, key);
}

void CFCharacterSetAddCharactersInString(CFMutableCharacterSetRef theSet, CFStringRef theString)
{
}

CFMutableCharacterSetRef CFCharacterSetCreateMutableCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFMutableCharacterSetRef)MEMORY[0x270EE4738](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x270EE4750](theSetIdentifier);
}

void CFCharacterSetInvert(CFMutableCharacterSetRef theSet)
{
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x270EE4760](theSet, theChar);
}

void CFCharacterSetUnion(CFMutableCharacterSetRef theSet, CFCharacterSetRef theOtherSet)
{
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x270EE4788](cf);
}

uint64_t CFCopySearchPathForDirectoriesInDomains()
{
  return MEMORY[0x270EE47A0]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x270EE4A20](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x270EE4A80](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLocaleIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x270EE4A90](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x270EE4AB0](locale);
}

CFTypeID CFLocaleGetTypeID(void)
{
  return MEMORY[0x270EE4AC8]();
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x270EE4AD0](locale, key);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D48](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x270EE4D90](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x270EE4DB8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x270EE4F70](theSet);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x270EE50A0](alloc, theString, *(void *)&encoding, lossByte);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE50F0](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x270EE5118](alloc, formatOptions, format, arguments);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5150](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x270EE5158](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x270EE5190](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x270EE51A0](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x270EE5228](theString, prefix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x270EE5278](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x270EE5290](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x270EE52A0](tokenizer);
  result.size_t length = v2;
  result.location = v1;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
}

void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x270EE5328](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x270EE5338](url);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5348](anURL);
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x270EE5350](url);
}

CFDataRef CFURLCreateBookmarkData(CFAllocatorRef allocator, CFURLRef url, CFURLBookmarkCreationOptions options, CFArrayRef resourcePropertiesToInclude, CFURLRef relativeToURL, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE5388](allocator, url, options, resourcePropertiesToInclude, relativeToURL, error);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE5390](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

uint64_t _AXSAudioDonationSiriImprovementEnabled()
{
  return MEMORY[0x270F905E8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x270EE5798]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x270EE57A8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x270F98238](this, __c, __pos);
}

std::string::size_type std::string::rfind(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x270F98240](this, __c, __pos);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F98480](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x270F98548](this, __str, __pos, __n, __a);
}

void std::terminate(void)
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

void operator new[]()
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x270ED8718](a1, *(void *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x270ED8730](a1, *(void *)&a2);
}

int closedir(DIR *a1)
{
  return MEMORY[0x270ED8F30](a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x270EDA858](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE50](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x270EDAE60](a1, a2);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x270EDB128](a1);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x270EDB1F0](path, state, *(void *)&flags);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

int8_t u_charType(UChar32 c)
{
  return MEMORY[0x270F994E8](*(void *)&c);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDBD18](objects, count);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDBD20]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x270EDBD70](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDBD88](xarray, index);
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x270EDBE40](name, targetq);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x270EDBEA0](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x270EDBFA8](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x270EDBFB8](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_connection_t xpc_dictionary_create_connection(xpc_object_t xdict, const char *key)
{
  return (xpc_connection_t)MEMORY[0x270EDC010](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDC2B8](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}