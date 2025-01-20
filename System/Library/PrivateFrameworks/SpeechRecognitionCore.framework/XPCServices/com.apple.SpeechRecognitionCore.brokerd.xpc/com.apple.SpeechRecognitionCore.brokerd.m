CFIndex RXDebugFlagsUpdate()
{
  int AppBooleanValue;
  BOOL v1;
  char v2;
  char AppIntegerValue;
  char v4;
  CFIndex result;
  Boolean keyExistsAndHasValidFormat;

  dword_10001CE10 = CFPreferencesGetAppIntegerValue(@"RXDebugFlag", @"com.apple.SpeechRecognitionCore.speechrecognitiond", 0);
  byte_10001CE14 = CFPreferencesGetAppBooleanValue(@"RXVeryVerbose", @"com.apple.SpeechRecognitionCore.speechrecognitiond", 0) != 0;
  byte_10001CE15 = CFPreferencesGetAppIntegerValue(@"RXDebugAutomationMode", @"com.apple.SpeechRecognitionCore.speechrecognitiond", 0);
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(@"RXDebugAutomationSimulateOpenMic", @"com.apple.SpeechRecognitionCore.speechrecognitiond", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    v1 = AppBooleanValue == 0;
  }
  else {
    v1 = 0;
  }
  v2 = !v1;
  byte_10001CBF0 = v2;
  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(@"RXRecognitionResetTimeInSec", @"com.apple.SpeechRecognitionCore.speechrecognitiond", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    v4 = AppIntegerValue;
  }
  else {
    v4 = 5;
  }
  byte_10001CBF1 = v4;
  result = CFPreferencesGetAppIntegerValue(@"RXDebugAutomationSaveKeywordsAudio", @"com.apple.SpeechRecognitionCore.speechrecognitiond", 0);
  byte_10001CE16 = result != 0;
  return result;
}

uint64_t RXLogServerResults()
{
  return dword_10001CE10 >> 7;
}

uint64_t RXLogServerGrammar()
{
  return BYTE1(dword_10001CE10) & 1;
}

uint64_t RXLogSound()
{
  return (BYTE1(dword_10001CE10) >> 1) & 1;
}

uint64_t RXLogClientUpdates()
{
  return (BYTE1(dword_10001CE10) >> 2) & 1;
}

uint64_t RXLogPerformance()
{
  return (BYTE1(dword_10001CE10) >> 3) & 1;
}

uint64_t RXVeryVerbose()
{
  return byte_10001CE14;
}

BOOL RXAutomationModeSynthesis()
{
  return byte_10001CE15 == 1;
}

BOOL RXAutomationModeResult()
{
  return byte_10001CE15 == 2;
}

BOOL RXAutomationModeFileName()
{
  return byte_10001CE15 == 3;
}

uint64_t RXAutomationSimulateOpenMic()
{
  return byte_10001CBF0;
}

uint64_t RXResetTimeInSec()
{
  return byte_10001CBF1;
}

uint64_t RXAutomationSaveKeywordsAudio()
{
  return byte_10001CE16;
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
  if (qword_10001CE18 != -1) {
    dispatch_once(&qword_10001CE18, &stru_100018738);
  }
  return byte_10001CE17;
}

void sub_100004480(id a1)
{
  byte_10001CE17 = os_variant_has_internal_diagnostics();
}

void reportBacktrace()
{
  uint64_t v15 = 0;
  *(_OWORD *)v13 = 0u;
  memset(v14, 0, sizeof(v14));
  int v0 = backtrace(v13, 33);
  uint64_t v1 = (v0 - 2);
  v2 = backtrace_symbols((void *const *)v14, v1);
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
          if (qword_10001CE38 != -1) {
            dispatch_once(&qword_10001CE38, &stru_1000187B8);
          }
          uint64_t v6 = qword_10001CE30;
          if (!os_log_type_enabled((os_log_t)qword_10001CE30, OS_LOG_TYPE_ERROR)) {
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
          if (qword_10001CE38 != -1) {
            dispatch_once(&qword_10001CE38, &stru_1000187B8);
          }
          uint64_t v11 = qword_10001CE30;
          if (!os_log_type_enabled((os_log_t)qword_10001CE30, OS_LOG_TYPE_ERROR)) {
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
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v9, buf, v10);
      }
    }
    free(v3);
  }
}

uint64_t RXSignpostLog()
{
  if (qword_10001CE28 != -1) {
    dispatch_once(&qword_10001CE28, &stru_100018778);
  }
  return qword_10001CE20;
}

void sub_1000046FC(id a1)
{
  qword_10001CE20 = (uint64_t)os_log_create("com.apple.SpeechRecognitionCore", "SRCSignposts");
}

uint64_t RXOSLog()
{
  if (qword_10001CE38 != -1) {
    dispatch_once(&qword_10001CE38, &stru_1000187B8);
  }
  return qword_10001CE30;
}

void sub_100004770(id a1)
{
  qword_10001CE30 = (uint64_t)os_log_create("com.apple.SpeechRecognitionCore", "SRCLogs");
}

CFMutableStringRef RDLanguageAssets::createLanguageFromLocaleID(CFStringRef theString, const __CFString *a2)
{
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  v4.length = CFStringGetLength(MutableCopy);
  v4.location = 0;
  CFStringFindAndReplace(MutableCopy, @"_", @"-", v4, 0);
  return MutableCopy;
}

CFMutableStringRef RDLanguageAssets::createLocaleIDFromLanguage(CFStringRef theString, const __CFString *a2)
{
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  v4.length = CFStringGetLength(MutableCopy);
  v4.location = 0;
  CFStringFindAndReplace(MutableCopy, @"-", @"_", v4, 0);
  return MutableCopy;
}

const __CFDictionary *RDLanguageAssets::CopyInstallationStatus(RDLanguageAssets *this)
{
  CFDictionaryRef v8 = 0;
  if (qword_10001CE48 != -1) {
    dispatch_once(&qword_10001CE48, &stru_1000187F8);
  }
  CFDictionaryRef v1 = (const __CFDictionary *)[(id)qword_10001CE40 copyInstallationStatusForLangaugesWithError:&v8];
  v2 = RXOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFDictionaryRef v10 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "InstallationStatus resultStatus=%@", buf, 0xCu);
  }
  if (v8)
  {
    v3 = RXOSLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFDictionaryRef v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "InstallationStatus failed with: %@", buf, 0xCu);
    }
  }
  if (!v1) {
    return 0;
  }
  CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v1);
  v5 = (RDLanguageAssets *)RXGetAssetFallbackLocales();
  if (v5) {
    RDLanguageAssets::addAliasLocalesToResultStatus(v5, MutableCopy, v6);
  }
  CFRelease(v1);
  return MutableCopy;
}

void RDLanguageAssets::addAliasLocalesToResultStatus(RDLanguageAssets *this, const __CFDictionary *a2, __CFDictionary *a3)
{
  CFIndex Count = CFDictionaryGetCount(this);
  if (Count >= 1)
  {
    CFIndex v6 = Count;
    uint64_t v7 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
    CFDictionaryGetKeysAndValues(this, v7, 0);
    for (uint64_t i = 0; i != v6; ++i)
    {
      CFMutableStringRef LanguageFromLocaleID = RDLanguageAssets::createLanguageFromLocaleID((CFStringRef)v7[i], v8);
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(this, v7[i]);
      if (Value)
      {
        CFMutableStringRef v13 = RDLanguageAssets::createLanguageFromLocaleID(Value, v12);
        v14 = CFDictionaryGetValue(a2, v13);
        if (v14)
        {
          uint64_t v15 = v14;
          if (!CFDictionaryGetValue(a2, LanguageFromLocaleID)) {
            CFDictionaryAddValue(a2, LanguageFromLocaleID, v15);
          }
        }
        CFRelease(v13);
      }
      CFRelease(LanguageFromLocaleID);
    }
    free(v7);
  }
}

id RDLanguageAssets::InstallAndCopyQuasarModelPathForLanguage(const __CFString *this, const __CFString *a2)
{
  CFMutableStringRef LocaleIDFromLanguage = RDLanguageAssets::createLocaleIDFromLanguage(this, a2);
  uint64_t v4 = RXGetAssetFallbackLocaleIdentifier();
  CFRelease(LocaleIDFromLanguage);
  CFStringRef v10 = 0;
  if (qword_10001CE48 != -1) {
    dispatch_once(&qword_10001CE48, &stru_1000187F8);
  }
  if (v4) {
    CFStringRef v5 = (const __CFString *)v4;
  }
  else {
    CFStringRef v5 = this;
  }
  id v6 = [(id)qword_10001CE40 copyInstalledQuasarModelPathForLanguage:v5 error:&v10];
  uint64_t v7 = RXOSLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    CFStringRef v12 = this;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "InstallAndCopyQuasarModelPathForLanguage language=%@ resultPath=%@", buf, 0x16u);
  }
  if (v10)
  {
    CFStringRef v8 = RXOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "InstallAndCopyQuasarModelPathForLanguage failed with: %@", buf, 0xCu);
    }
  }
  return v6;
}

id RDLanguageAssets::CopyInstalledAssetPathForLanguage(const __CFString *this, const __CFString *a2)
{
  CFMutableStringRef LocaleIDFromLanguage = RDLanguageAssets::createLocaleIDFromLanguage(this, a2);
  CFStringRef v3 = (const __CFString *)RXGetAssetFallbackLocaleIdentifier();
  if (!v3) {
    CFStringRef v3 = LocaleIDFromLanguage;
  }
  CFMutableStringRef LanguageFromLocaleID = RDLanguageAssets::createLanguageFromLocaleID(v3, v4);
  uint64_t v9 = 0;
  if (qword_10001CE48 != -1) {
    dispatch_once(&qword_10001CE48, &stru_1000187F8);
  }
  id v6 = [(id)qword_10001CE40 copyInstalledAssetPathForLangaugeWithError:LanguageFromLocaleID error:&v9];
  if (v9)
  {
    uint64_t v7 = RXOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "CopyAssetPath failed with: %@", buf, 0xCu);
    }
  }
  return v6;
}

id RDLanguageAssets::CopyInstalledAssetSupportedTasksForLanguage(const __CFString *this, const __CFString *a2)
{
  CFMutableStringRef LocaleIDFromLanguage = RDLanguageAssets::createLocaleIDFromLanguage(this, a2);
  CFStringRef v3 = (const __CFString *)RXGetAssetFallbackLocaleIdentifier();
  if (!v3) {
    CFStringRef v3 = LocaleIDFromLanguage;
  }
  CFMutableStringRef LanguageFromLocaleID = RDLanguageAssets::createLanguageFromLocaleID(v3, v4);
  CFStringRef v10 = 0;
  if (qword_10001CE48 != -1) {
    dispatch_once(&qword_10001CE48, &stru_1000187F8);
  }
  id v6 = [(id)qword_10001CE40 copyInstalledAssetSupportedTasksForLangaugeWithError:LanguageFromLocaleID error:&v10];
  if (v10)
  {
    uint64_t v7 = RXOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "CopyAssetSupportedTasks failed with: %@", buf, 0xCu);
    }
  }
  CFStringRef v8 = RXOSLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "RDLanguageAssets: supportedTasks:%@", buf, 0xCu);
  }
  return v6;
}

void RDLanguageAssets::CancelDownloadForLanguage(RDLanguageAssets *this, const __CFString *a2)
{
  CFStringRef v3 = RXOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v7 = this;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CancelDownloadForLanguage language=%@", buf, 0xCu);
  }
  CFStringRef v5 = 0;
  if (qword_10001CE48 != -1) {
    dispatch_once(&qword_10001CE48, &stru_1000187F8);
  }
  [(id)qword_10001CE40 cancelDownloadForLanguage:this error:&v5];
  if (v5)
  {
    CFStringRef v4 = RXOSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "CancelDownloadForLanguage failed with: %@", buf, 0xCu);
    }
  }
}

id RDLanguageAssets::PurgeInstalledQuasarAssets(RDLanguageAssets *this)
{
  CFStringRef v5 = 0;
  if (qword_10001CE48 != -1) {
    dispatch_once(&qword_10001CE48, &stru_1000187F8);
  }
  id v1 = [(id)qword_10001CE40 purgeInstalledAssetsWithError:&v5];
  v2 = RXOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Assets purged %@", buf, 0xCu);
  }
  if (v5)
  {
    CFStringRef v3 = RXOSLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "PurgeInstalledQuasarAssets failed with: %@", buf, 0xCu);
    }
  }
  return [v1 intValue];
}

void RDLanguageAssets::SetPurgeabilityForLanguages(RDLanguageAssets *this, const __CFArray *a2)
{
  CFStringRef v4 = RXOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    CFStringRef v8 = this;
    __int16 v9 = 1024;
    int v10 = (int)a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SetPurgeabilityForLanguages languages=%@%d", buf, 0x12u);
  }
  id v6 = 0;
  if (qword_10001CE48 != -1) {
    dispatch_once(&qword_10001CE48, &stru_1000187F8);
  }
  [(id)qword_10001CE40 setPurgeabilityForLanguages:this withPurgeability:a2 error:&v6];
  if (v6)
  {
    CFStringRef v5 = RXOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "SetPurgeabilityForLanguages failed with: %@", buf, 0xCu);
    }
  }
}

id RDLanguageAssets::RemovePeerForProgressCallback(_xpc_connection_s *a1)
{
  v2 = RXOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = xpc_connection_get_pid(a1);
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Removing Peer %d for callback", (uint8_t *)v4, 8u);
  }
  if (qword_10001CE48 != -1) {
    dispatch_once(&qword_10001CE48, &stru_1000187F8);
  }
  return [(id)qword_10001CE40 removePeerFromCallback:a1];
}

id RDLanguageAssets::AddPeerForProgressCallback(_xpc_connection_s *a1)
{
  v2 = RXOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = xpc_connection_get_pid(a1);
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Adding Peer %d for callback", (uint8_t *)v4, 8u);
  }
  if (qword_10001CE48 != -1) {
    dispatch_once(&qword_10001CE48, &stru_1000187F8);
  }
  return [(id)qword_10001CE40 addPeerForCallback:a1];
}

void sub_10000540C(id a1)
{
  int v1 = _os_feature_enabled_impl();
  v2 = RXOSLog();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (v3)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Using RDAssetManager2", buf, 2u);
    }
    CFStringRef v4 = &off_100018620;
  }
  else
  {
    if (v3)
    {
      *(_WORD *)CFStringRef v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Using original RDAssetManager", v5, 2u);
    }
    CFStringRef v4 = off_100018618;
  }
  qword_10001CE40 = [(__objc2_class *)*v4 sharedInstance];
}

void sub_100005A0C(id a1)
{
  qword_10001CE50 = objc_alloc_init(RDAssetManager);
}

void sub_100005BB4(uint64_t a1)
{
  v2 = RXOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 40)) {
      CFStringRef v3 = @"with";
    }
    else {
      CFStringRef v3 = @"without";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Kicking off catalog download %@ urgency", buf, 0xCu);
  }
  if (([*(id *)(a1 + 32) catalogDownloadInProgress] & 1) == 0)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      CFStringRef v4 = *(double **)(a1 + 32);
LABEL_12:
      [v4 setCatalogDownloadInProgress:1];
      id v7 = RXOSLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Downloading EmbeddedSpeech catalog", buf, 2u);
      }
      id v8 = sub_100005DAC(*(unsigned __int8 *)(a1 + 40));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100005E10;
      v9[3] = &unk_100018868;
      v9[4] = *(void *)(a1 + 32);
      +[MAAsset startCatalogDownload:@"com.apple.MobileAsset.EmbeddedSpeech" options:v8 then:v9];
      return;
    }
    [+[NSDate date] timeIntervalSinceReferenceDate];
    CFStringRef v4 = *(double **)(a1 + 32);
    if (v5 - v4[1] >= 86400.0) {
      goto LABEL_12;
    }
    id v6 = RXOSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Too early since last catalog download. Returning.", buf, 2u);
    }
  }
}

id sub_100005DAC(int a1)
{
  id v2 = objc_alloc_init((Class)MADownloadOptions);
  [v2 setAllowsCellularAccess:0];
  [v2 setDiscretionary:a1 ^ 1u];
  [v2 setRequiresPowerPluggedIn:0];
  return v2;
}

id sub_100005E10(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setCatalogDownloadInProgress:0];
  CFStringRef v4 = RXOSLog();
  double v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 32) _errorStringForDownloadResult:a2];
      *(_DWORD *)buf = 138412290;
      id v27 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "The MobileAsset catalog download failed: error = %@", buf, 0xCu);
    }
    id result = [*(id *)(a1 + 32) sendCallback];
    if (result)
    {
      id v8 = *(void **)(a1 + 32);
      id v9 = [v8 _errorStringForDownloadResult:a2];
      LODWORD(v10) = -1.0;
      LODWORD(v11) = -1.0;
      LODWORD(v12) = -1.0;
      return [v8 _sendDownloadCallbackDictionaryWithLanguage:0 downloadPhase:@"DownloadFailed" timeRemaining:v9 bytesWritten:v10 bytesTotal:v11 error:v12];
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sucessfully downloaded the catalog", buf, 2u);
    }
    [+[NSDate date] timeIntervalSinceReferenceDate];
    *(void *)(*(void *)(a1 + 32) + 8) = v13;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v14 = [*(id *)(a1 + 32) requestedLanguagesForDownload];
    id result = [v14 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (result)
    {
      id v15 = result;
      uint64_t v16 = *(void *)v23;
      do
      {
        int v17 = 0;
        do
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v17);
          uint64_t v19 = *(void *)(a1 + 32);
          __int16 v20 = *(NSObject **)(v19 + 24);
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_100006060;
          v21[3] = &unk_100018840;
          v21[4] = v19;
          v21[5] = v18;
          dispatch_async(v20, v21);
          int v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id result = [v14 countByEnumeratingWithState:&v22 objects:v28 count:16];
        id v15 = result;
      }
      while (result);
    }
  }
  return result;
}

id sub_100006060(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchRemoteAssetForLanguage:*(void *)(a1 + 40)];
}

void sub_100006194(uint64_t a1, uint64_t a2)
{
}

void sub_1000061A4(uint64_t a1)
{
}

id sub_1000061B0(uint64_t a1)
{
  uint64_t v3 = 0;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) queryAndCopyInstallationStatusForLangaugesWithError:&v3];
  id result = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!result || (id result = [result count]) == 0) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v3;
  }
  return result;
}

id sub_1000067F4(void *a1)
{
  CFStringRef v1 = (const __CFString *)[a1 stringByAppendingPathComponent:@"mini.json"];
  if ([+[NSFileManager defaultManager] fileExistsAtPath:v1])
  {
    id v2 = +[NSData dataWithContentsOfFile:v1];
    if (v2)
    {
      uint64_t v16 = 0;
      id v3 = +[NSJSONSerialization JSONObjectWithData:v2 options:0 error:&v16];
      if (!v16)
      {
        uint64_t v13 = v3;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = [v13 objectForKey:@"model-info"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = [v14 objectForKey:@"tasks"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              return [v15 containsObject:@"DictationCC"];
            }
          }
        }
        return 0;
      }
      CFStringRef v4 = RXOSLog();
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      id result = 0;
      if (!v5) {
        return result;
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v18 = v1;
      id v7 = "%@ : not a valid json";
    }
    else
    {
      CFStringRef v4 = RXOSLog();
      BOOL v12 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      id result = 0;
      if (!v12) {
        return result;
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v18 = v1;
      id v7 = "could not read contents from : %@";
    }
    double v10 = v4;
    uint32_t v11 = 12;
  }
  else
  {
    id v8 = RXOSLog();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    id result = 0;
    if (!v9) {
      return result;
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v18 = @"mini.json";
    __int16 v19 = 2112;
    CFStringRef v20 = v1;
    id v7 = "%@ does not exist at: %@ ";
    double v10 = v8;
    uint32_t v11 = 22;
  }
  _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v7, buf, v11);
  return 0;
}

void sub_100006E40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100006E58(uint64_t a1)
{
  uint64_t v3 = 0;
  id result = [*(id *)(a1 + 32) _cancelDownloadForLangaugeWithError:*(void *)(a1 + 40) withError:&v3];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v3;
  return result;
}

void sub_100007390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

NSError *sub_1000073B4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) catalogDownloadInProgress])
  {
    id result = (NSError *)objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "requestedLanguagesForDownload"), "containsObject:", *(void *)(a1 + 40));
    if ((result & 1) == 0)
    {
      uint64_t v3 = RXOSLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v4;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Catalog download is in progress, caching %@", buf, 0xCu);
      }
      objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "requestedLanguagesForDownload"), "addObject:", *(void *)(a1 + 40));
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = 0;
      NSErrorUserInfoKey v5 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v6 = @"Catalog download in progress";
      id result = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"kRXAssetDownloadErrorDomain", 100, +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1]);
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
    }
  }
  else
  {
    *(void *)buf = 0;
    id result = (NSError *)objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "_installedAssetForLanguage:error:", *(void *)(a1 + 40), buf), "_es_quasarModelPath"), "copy");
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = *(void *)buf;
    }
  }
  return result;
}

void sub_1000075E8(int8x16_t *a1, uint64_t a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  int8x16_t v2 = vextq_s8(a1[2], a1[2], 8uLL);
  uint64_t v3 = *(NSObject **)(a1[2].i64[0] + 24);
  _DWORD v4[2] = sub_100007670;
  v4[3] = &unk_100018930;
  int8x16_t v5 = v2;
  uint64_t v6 = a1[3].i64[0];
  uint64_t v7 = a2;
  dispatch_async(v3, v4);
}

void sub_100007670(uint64_t a1)
{
  if (*(void *)(a1 + 56))
  {
    int8x16_t v2 = RXOSLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      id v4 = [*(id *)(a1 + 40) _errorStringForQueryResult:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138412546;
      uint64_t v12 = v3;
      __int16 v13 = 2112;
      id v14 = v4;
      int8x16_t v5 = "Async asset query failed for query=%@, error=%@";
      uint64_t v6 = v2;
      os_log_type_t v7 = OS_LOG_TYPE_ERROR;
      uint32_t v8 = 22;
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v6, v7, v5, buf, v8);
    }
  }
  else
  {
    uint64_t v10 = 0;
    if (!objc_msgSend(*(id *)(a1 + 40), "_installedAssetFromFoundAssets:language:error:", objc_msgSend(*(id *)(a1 + 32), "results"), *(void *)(a1 + 48), &v10))
    {
      uint64_t v9 = RXOSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = v10;
        int8x16_t v5 = "Remote fetch asset fetch got assets but none have been installed yet: %@";
        uint64_t v6 = v9;
        os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
        uint32_t v8 = 12;
        goto LABEL_4;
      }
    }
  }
}

id sub_10000873C(uint64_t a1, void *a2)
{
  unsigned __int8 v4 = [a2 isStalled];
  int8x16_t v5 = RXOSLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v25 = 134218240;
      double v26 = COERCE_DOUBLE([a2 totalWritten]);
      __int16 v27 = 2048;
      id v28 = [a2 totalExpected];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Asset Download Progress stalled at %lld of %lld bytes", (uint8_t *)&v25, 0x16u);
    }
    id result = [*(id *)(a1 + 32) sendCallback];
    if (result)
    {
      uint32_t v8 = *(void **)(a1 + 32);
      id v9 = objc_msgSend(*(id *)(a1 + 40), "_es_language");
      float v10 = (float)(uint64_t)[a2 totalWritten];
      *(float *)&double v11 = (float)(uint64_t)[a2 totalExpected];
      CFStringRef v12 = @"Stalled";
      LODWORD(v13) = -1.0;
      id v14 = v8;
      id v15 = v9;
      *(float *)&double v16 = v10;
      return [v14 _sendDownloadCallbackDictionaryWithLanguage:v15 downloadPhase:v12 timeRemaining:0 bytesWritten:v13 bytesTotal:v16 error:v11];
    }
  }
  else
  {
    if (v6)
    {
      float v17 = (float)(uint64_t)[a2 totalWritten];
      double v18 = (float)(v17 / (float)(uint64_t)[a2 totalExpected]);
      [a2 expectedTimeRemaining];
      int v25 = 134218240;
      double v26 = v18;
      __int16 v27 = 2048;
      id v28 = v19;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Asset Download progress: %.2f percent , ~%.2f seconds remaining", (uint8_t *)&v25, 0x16u);
    }
    id result = [*(id *)(a1 + 32) sendCallback];
    if (result)
    {
      CFStringRef v20 = *(void **)(a1 + 32);
      id v21 = objc_msgSend(*(id *)(a1 + 40), "_es_language");
      [a2 expectedTimeRemaining];
      float v23 = v22;
      float v24 = (float)(uint64_t)[a2 totalWritten];
      *(float *)&double v11 = (float)(uint64_t)[a2 totalExpected];
      CFStringRef v12 = @"Downloading";
      id v14 = v20;
      id v15 = v21;
      *(float *)&double v13 = v23;
      *(float *)&double v16 = v24;
      return [v14 _sendDownloadCallbackDictionaryWithLanguage:v15 downloadPhase:v12 timeRemaining:0 bytesWritten:v13 bytesTotal:v16 error:v11];
    }
  }
  return result;
}

void sub_100008930(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if ([*(id *)(a1 + 32) sendCallback])
    {
      unsigned __int8 v4 = *(void **)(a1 + 32);
      id v5 = objc_msgSend(*(id *)(a1 + 40), "_es_language");
      id v6 = [*(id *)(a1 + 32) _errorStringForDownloadResult:a2];
      LODWORD(v7) = -1.0;
      LODWORD(v8) = -1.0;
      LODWORD(v9) = -1.0;
      [v4 _sendDownloadCallbackDictionaryWithLanguage:v5 downloadPhase:@"DownloadFailed" timeRemaining:v6 bytesWritten:v7 bytesTotal:v8 error:v9];
    }
    float v10 = RXOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [*(id *)(a1 + 32) _errorStringForDownloadResult:a2];
      int v18 = 138412290;
      id v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Asset download failed: %@", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    CFStringRef v12 = RXOSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Asset download successful", (uint8_t *)&v18, 2u);
    }
    if ([*(id *)(a1 + 32) sendCallback])
    {
      double v13 = *(void **)(a1 + 32);
      id v14 = objc_msgSend(*(id *)(a1 + 40), "_es_language");
      LODWORD(v15) = -1.0;
      LODWORD(v16) = -1.0;
      LODWORD(v17) = -1.0;
      [v13 _sendDownloadCallbackDictionaryWithLanguage:v14 downloadPhase:@"Downloaded" timeRemaining:0 bytesWritten:v15 bytesTotal:v16 error:v17];
    }
  }
}

void sub_100008AA8(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v4 = RXOSLog();
  id v5 = v4;
  if (a2)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      return;
    }
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) _errorStringForPurgeResult:a2];
    int v13 = 138412546;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    double v8 = "Failed to purge %@: %@";
    double v9 = v5;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    uint32_t v11 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = 138412290;
    uint64_t v14 = v12;
    double v8 = "Purged %@";
    double v9 = v5;
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    uint32_t v11 = 12;
  }
  _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&v13, v11);
}

NSNumber *sub_100008BC0(void *a1, uint64_t a2)
{
  id v4 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.EmbeddedSpeech"];
  id v5 = [v4 queryMetaDataSync];
  if (v5)
  {
    id v6 = v5;
    id v7 = RXOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      id v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "MobileAsset is sad: %ld", buf, 0xCu);
    }
    if (a1)
    {
      CFStringRef v22 = @"MAQueryResult";
      float v23 = +[NSNumber numberWithInteger:v6];
      *a1 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"kRXAssetDownloadErrorDomain", 101, +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1]);
    }

    return 0;
  }
  else
  {
    id v9 = [v4 results];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v18;
      uint64_t v14 = ASAttributeUnarchivedSize;
      do
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v9);
          }
          id v16 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v16, "_es_isInstalled"))
          {
            buf[0] = 0;
            (*(void (**)(uint64_t, void *, uint8_t *))(a2 + 16))(a2, v16, buf);
            if (buf[0]) {
              return +[NSNumber numberWithLongLong:v12];
            }
            v12 += (uint64_t)objc_msgSend(objc_msgSend(objc_msgSend(v16, "attributes"), "objectForKey:", v14), "longLongValue");
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
    else
    {
      uint64_t v12 = 0;
    }
    return +[NSNumber numberWithLongLong:v12];
  }
}

void sub_100008EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100008F0C(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = RXOSLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = a2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Purging asset for CacheDelete: %@", buf, 0xCu);
  }
  id v7 = [a2 purgeSync];
  if (v7)
  {
    id v11 = +[NSNumber numberWithInteger:v7, @"MAPurgeResult"];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"kRXAssetDownloadErrorDomain", 102, +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1]);
    double v8 = RXOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Purging failed: %@", buf, 0xCu);
    }
    *a3 = 1;
  }
}

void sub_1000090E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009150(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000091B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000096D4(_Unwind_Exception *exception_object)
{
}

void sub_100009944(id a1)
{
  qword_10001CE60 = objc_alloc_init(RDAssetManager2);
}

void sub_10000A1A8(uint64_t a1, uint64_t a2)
{
}

void sub_10000A1B8(uint64_t a1)
{
}

id sub_10000A1C4(uint64_t a1)
{
  uint64_t v3 = 0;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _queryAndCopyInstallationStatusForLanguagesWithError:&v3];
  id result = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!result || (id result = [result count]) == 0) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v3;
  }
  return result;
}

void sub_10000A870(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10000A8C0(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  uint64_t v3 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v3);
}

id sub_10000ACE4(uint64_t a1)
{
  uint64_t v3 = 0;
  id result = [*(id *)(a1 + 32) _cancelDownloadForLanguageWithError:*(void *)(a1 + 40) withError:&v3];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v3;
  return result;
}

void sub_10000B154(uint64_t a1)
{
  uint64_t v5 = 0;
  +[SFSpeechAssetManager setAssetsPurgeability:*(unsigned __int8 *)(a1 + 56) forLanguages:*(void *)(a1 + 32) error:&v5];
  int8x16_t v2 = RXOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 138412802;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "setPurgeabilityForLanguages, languages=%@  purgeability= %d error=%@", buf, 0x1Cu);
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v5;
}

void sub_10000B47C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

id sub_10000B4A0(uint64_t a1)
{
  uint64_t v3 = 0;
  id result = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "_installedAssetForLanguage:error:", *(void *)(a1 + 40), &v3), "copy");
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = v3;
  }
  return result;
}

void sub_10000B91C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10000B944(void *a1, void *a2, uint64_t a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = a3;
  if (!a3) {
    *(void *)(*(void *)(a1[6] + 8) + 40) = a2;
  }
  int v4 = a1[4];
  return dispatch_semaphore_signal(v4);
}

__n128 sub_10000BDC8(uint64_t a1, uint64_t a2, char a3)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  long long v3 = *(_OWORD *)(a1 + 32);
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[2] = sub_10000BE60;
  v6[3] = &unk_100018DC0;
  long long v7 = v3;
  int v10 = *(_DWORD *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = a2;
  int v11 = *(_DWORD *)(a1 + 60);
  char v12 = a3;
  dispatch_async(v4, v6);
  return result;
}

void sub_10000BE60(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _isActiveDownloadForLanguage:*(void *)(a1 + 40) downloadId:*(unsigned int *)(a1 + 64)])
  {
    float v2 = fmin((double)*(unint64_t *)(a1 + 56) / 100.0, 1.0);
    [+[NSDate date] timeIntervalSinceDate:*(void *)(a1 + 48)];
    float v4 = -1.0;
    if (v2 > 0.0)
    {
      if (v3 < 0.0) {
        double v3 = 0.0;
      }
      float v5 = v3;
      float v4 = (1.0 - v2) * v5 / v2;
    }
    float v6 = *(float *)(a1 + 68) * v2;
    long long v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 72))
    {
      [v7 _stalledDownloadForLanguage:v8];
      uint64_t v9 = RXOSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        double v10 = (float)(v6 / *(float *)(a1 + 68));
        int v11 = *(_DWORD *)(a1 + 64);
        id v12 = [*(id *)(a1 + 32) _downloadStatusDescription];
        int v26 = 134218754;
        *(double *)__int16 v27 = v10;
        *(_WORD *)&v27[8] = 2048;
        *(double *)&v27[10] = v4;
        __int16 v28 = 1024;
        int v29 = v11;
        __int16 v30 = 2112;
        id v31 = v12;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Asset Download Progress stalled at : %.2f ratio , ~%.2f seconds remaining, downloadId=%d, %@", (uint8_t *)&v26, 0x26u);
      }
      if ([*(id *)(a1 + 32) _sendCallback])
      {
        id v16 = *(void **)(a1 + 32);
        uint64_t v17 = *(void *)(a1 + 40);
        LODWORD(v15) = *(_DWORD *)(a1 + 68);
        CFStringRef v18 = @"Stalled";
        LODWORD(v13) = -1.0;
LABEL_19:
        *(float *)&double v14 = v6;
        [v16 _sendDownloadCallbackDictionaryWithLanguage:v17 downloadPhase:v18 timeRemaining:0 bytesWritten:v13 bytesTotal:v14 error:v15];
      }
    }
    else
    {
      if ([v7 _isDownloadingStalledForLanguage:v8]) {
        [*(id *)(a1 + 32) _resumeStalledDownloadForLanguage:*(void *)(a1 + 40)];
      }
      CFStringRef v22 = RXOSLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        double v23 = (float)(v6 / *(float *)(a1 + 68));
        int v24 = *(_DWORD *)(a1 + 64);
        id v25 = [*(id *)(a1 + 32) _downloadStatusDescription];
        int v26 = 134218754;
        *(double *)__int16 v27 = v23;
        *(_WORD *)&v27[8] = 2048;
        *(double *)&v27[10] = v4;
        __int16 v28 = 1024;
        int v29 = v24;
        __int16 v30 = 2112;
        id v31 = v25;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Asset Download progress: %.2f ratio , ~%.2f seconds remaining, downloadId=%d, %@", (uint8_t *)&v26, 0x26u);
      }
      if ([*(id *)(a1 + 32) _sendCallback])
      {
        id v16 = *(void **)(a1 + 32);
        uint64_t v17 = *(void *)(a1 + 40);
        LODWORD(v15) = *(_DWORD *)(a1 + 68);
        CFStringRef v18 = @"Downloading";
        *(float *)&double v13 = v4;
        goto LABEL_19;
      }
    }
  }
  else
  {
    long long v19 = RXOSLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = *(_DWORD *)(a1 + 64);
      id v21 = [*(id *)(a1 + 32) _downloadStatusDescription];
      int v26 = 67109378;
      *(_DWORD *)__int16 v27 = v20;
      *(_WORD *)&v27[4] = 2112;
      *(void *)&v27[6] = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Ignoring non-active asset download progress downloadId=%d, %@", (uint8_t *)&v26, 0x12u);
    }
  }
}

__n128 sub_10000C134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  long long v3 = *(_OWORD *)(a1 + 32);
  float v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[2] = sub_10000C1C4;
  block[3] = &unk_100018E10;
  long long v7 = v3;
  int v10 = *(_DWORD *)(a1 + 48);
  uint64_t v8 = a3;
  uint64_t v9 = a2;
  int v11 = *(_DWORD *)(a1 + 52);
  dispatch_async(v4, block);
  return result;
}

void sub_10000C1C4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _isActiveDownloadForLanguage:*(void *)(a1 + 40) downloadId:*(unsigned int *)(a1 + 64)])
  {
    [*(id *)(a1 + 32) _endAllDownloadsForLanguage:*(void *)(a1 + 40)];
    float v2 = *(NSError **)(a1 + 48);
    if ([*(id *)(a1 + 56) length]) {
      unsigned int v3 = sub_10000CBAC(*(void **)(a1 + 56), 0, @"DictationCC");
    }
    else {
      unsigned int v3 = 0;
    }
    if ([*(id *)(a1 + 56) length] && (v3 & 1) == 0)
    {
      NSErrorUserInfoKey v33 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v34 = @"Asset is incompatible";
      float v2 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"kRXAssetDownloadErrorDomain", 101, +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1]);
    }
    long long v7 = RXOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 56);
      int v9 = *(_DWORD *)(a1 + 64);
      id v10 = [*(id *)(a1 + 32) _downloadStatusDescription];
      int v25 = 138413314;
      *(void *)int v26 = v8;
      *(_WORD *)&v26[8] = 2112;
      *(void *)&v26[10] = v2;
      __int16 v27 = 1024;
      unsigned int v28 = v3;
      __int16 v29 = 1024;
      int v30 = v9;
      __int16 v31 = 2112;
      id v32 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Asset downloaded, assetPath=%@, error=%@, isCompatibleAsset=%d, downloadId=%d, %@", (uint8_t *)&v25, 0x2Cu);
    }
    int v11 = RXOSLog();
    id v12 = v11;
    if (v3)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Asset download successful", (uint8_t *)&v25, 2u);
      }
      int v13 = *(_DWORD *)(a1 + 68);
      if ([*(id *)(a1 + 32) _sendCallback])
      {
        LODWORD(v15) = *(_DWORD *)(a1 + 68);
        LODWORD(v14) = v13;
        [*(id *)(a1 + 32) _sendDownloadCallbackDictionaryWithLanguage:*(void *)(a1 + 40) downloadPhase:@"Downloading" timeRemaining:0 bytesWritten:0.0 bytesTotal:v14 error:v15];
        id v16 = *(void **)(a1 + 32);
        uint64_t v17 = *(void *)(a1 + 40);
        LODWORD(v18) = *(_DWORD *)(a1 + 68);
        CFStringRef v19 = @"Downloaded";
        double v20 = 0.0;
        LODWORD(v21) = v13;
        id v22 = 0;
LABEL_21:
        [v16 _sendDownloadCallbackDictionaryWithLanguage:v17 downloadPhase:v19 timeRemaining:v22 bytesWritten:v20 bytesTotal:v21 error:v18];
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v25) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Asset download failed", (uint8_t *)&v25, 2u);
      }
      if ([*(id *)(a1 + 32) _sendCallback])
      {
        int v24 = *(void **)(a1 + 32);
        uint64_t v23 = *(void *)(a1 + 40);
        id v22 = [(NSError *)v2 description];
        CFStringRef v19 = @"DownloadFailed";
        LODWORD(v20) = -1.0;
        LODWORD(v21) = -1.0;
        LODWORD(v18) = -1.0;
        id v16 = v24;
        uint64_t v17 = v23;
        goto LABEL_21;
      }
    }
  }
  else
  {
    float v4 = RXOSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(_DWORD *)(a1 + 64);
      id v6 = [*(id *)(a1 + 32) _downloadStatusDescription];
      int v25 = 67109378;
      *(_DWORD *)int v26 = v5;
      *(_WORD *)&v26[4] = 2112;
      *(void *)&v26[6] = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Ignoring non-active asset download downloadId=%d, %@", (uint8_t *)&v25, 0x12u);
    }
  }
}

void sub_10000C524(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000C594(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000C5F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000CB18(_Unwind_Exception *exception_object)
{
}

id sub_10000CBAC(void *a1, void *a2, uint64_t a3)
{
  if (![a1 length])
  {
    int v13 = RXOSLog();
    id result = (id)os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_WORD *)buf = 0;
    id v12 = "empty quasarModelPath";
    double v14 = v13;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    uint32_t v16 = 2;
    goto LABEL_14;
  }
  CFStringRef v6 = (const __CFString *)[a1 stringByAppendingPathComponent:@"mini.json"];
  if (![+[NSFileManager defaultManager] fileExistsAtPath:v6])
  {
    uint64_t v17 = RXOSLog();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    id result = 0;
    if (!v18) {
      return result;
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v34 = @"mini.json";
    __int16 v35 = 2112;
    CFStringRef v36 = v6;
    id v12 = "%@ does not exist at: %@ ";
    double v14 = v17;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    uint32_t v16 = 22;
    goto LABEL_14;
  }
  long long v7 = +[NSData dataWithContentsOfFile:v6];
  if (!v7)
  {
    int v9 = RXOSLog();
    BOOL v19 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    id result = 0;
    if (!v19) {
      return result;
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v34 = v6;
    id v12 = "could not read contents from : %@";
    goto LABEL_13;
  }
  uint64_t v32 = 0;
  id v8 = +[NSJSONSerialization JSONObjectWithData:v7 options:0 error:&v32];
  if (v32)
  {
    int v9 = RXOSLog();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    id result = 0;
    if (!v10) {
      return result;
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v34 = v6;
    id v12 = "%@ : not a valid json";
LABEL_13:
    double v14 = v9;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    uint32_t v16 = 12;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v14, v15, v12, buf, v16);
    return 0;
  }
  double v20 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_msgSend(+[_EARSpeechRecognizer minimumSupportedConfigurationVersion](_EARSpeechRecognizer, "minimumSupportedConfigurationVersion"), "floatValue");
  float v22 = v21;
  objc_msgSend(+[_EARSpeechRecognizer maximumSupportedConfigurationVersion](_EARSpeechRecognizer, "maximumSupportedConfigurationVersion"), "floatValue");
  float v24 = v23;
  id v25 = [v20 objectForKey:@"version-major"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  [v25 floatValue];
  if (v26 < v22) {
    return 0;
  }
  [v25 floatValue];
  if (v27 > v24) {
    return 0;
  }
  id v28 = [v20 objectForKey:@"model-info"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v29 = [v28 objectForKey:@"version"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (a2)
  {
    if (isKindOfClass) {
      *a2 = v29;
    }
  }
  id v31 = [v28 objectForKey:@"tasks"];
  id result = [v29 length];
  if (result)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return [v31 containsObject:a3];
    }
    return 0;
  }
  return result;
}

uint64_t sub_10000CF00(uint64_t a1)
{
  return a1;
}

uint64_t RDMinions::Unlock(uint64_t a1, unint64_t a2)
{
  unint64_t v7 = a2;
  pthread_mutex_lock(&stru_10001CE88);
  uint64_t v3 = sub_1000103BC(a1 + 144, &v7);
  uint64_t v4 = sub_1000103BC(a1 + 120, &v7);
  if (*(void *)(a1 + 168) == v7)
  {
    *(void *)(a1 + 168) = 0;
    goto LABEL_5;
  }
  if (v4 | v3)
  {
LABEL_5:
    pthread_cond_broadcast(&stru_10001CEC8);
    uint64_t v5 = 1;
    goto LABEL_6;
  }
  uint64_t v5 = 0;
LABEL_6:
  pthread_mutex_unlock(&stru_10001CE88);
  return v5;
}

void RDMinions::LockReader(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v9 = a2;
  sub_100010438((uint64_t **)(a1 + 120), (unint64_t *)&v9, &v9);
  xpc_retain(a3);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D07C;
  block[3] = &unk_100018930;
  void block[4] = v9;
  block[5] = a3;
  block[6] = a4;
  block[7] = a1;
  dispatch_async(global_queue, block);
}

void sub_10000D07C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  char v9 = 1;
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  do
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000D208;
    v3[3] = &unk_100018E60;
    v3[4] = *(void *)(a1 + 32);
    v3[5] = &v4;
    v3[6] = v8;
    v3[7] = v2;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v3);
    if (*((unsigned char *)v5 + 24)) {
      break;
    }
    pthread_mutex_lock(&stru_10001CE88);
    pthread_cond_wait(&stru_10001CEC8, &stru_10001CE88);
    pthread_mutex_unlock(&stru_10001CE88);
  }
  while (!*((unsigned char *)v5 + 24));
  _Block_object_dispose(&v4, 8);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 48));
  xpc_release(*(xpc_object_t *)(a1 + 40));
  xpc_release(*(xpc_object_t *)(a1 + 48));
  _Block_object_dispose(v8, 8);
}

void sub_10000D1DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D208(unint64_t *a1)
{
  unint64_t v2 = a1[7];
  uint64_t v3 = *(void **)(v2 + 128);
  if (!v3)
  {
LABEL_7:
    uint64_t v6 = RXOSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "daemon died while waiting for read lock", buf, 2u);
    }
    goto LABEL_9;
  }
  unint64_t v4 = a1[4];
  while (1)
  {
    unint64_t v5 = v3[4];
    if (v4 >= v5) {
      break;
    }
LABEL_6:
    uint64_t v3 = (void *)*v3;
    if (!v3) {
      goto LABEL_7;
    }
  }
  if (v5 < v4)
  {
    ++v3;
    goto LABEL_6;
  }
  if (!*(void *)(v2 + 168))
  {
    sub_1000103BC(v2 + 120, a1 + 4);
    sub_100010438((uint64_t **)(v2 + 144), a1 + 4, (uint64_t *)a1 + 4);
LABEL_9:
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    return;
  }
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    char v7 = RXOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "daemon waiting for read lock", (uint8_t *)v8, 2u);
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
}

void RDMinions::LockWriter(uint64_t a1, void *a2, uint64_t a3)
{
  xpc_object_t v7 = a2;
  sub_100010438((uint64_t **)(a1 + 120), (unint64_t *)&v7, (uint64_t *)&v7);
  xpc_retain(v7);
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000D3E8;
  v6[3] = &unk_100018E88;
  v6[5] = a3;
  v6[6] = a1;
  void v6[4] = v7;
  dispatch_async(global_queue, v6);
}

void sub_10000D3E8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  char v9 = 1;
  uint64_t v4 = 0;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  do
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000D574;
    v3[3] = &unk_100018E60;
    v3[4] = *(void *)(a1 + 32);
    v3[5] = &v4;
    v3[6] = v8;
    v3[7] = v2;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v3);
    if (*((unsigned char *)v5 + 24)) {
      break;
    }
    pthread_mutex_lock(&stru_10001CE88);
    pthread_cond_wait(&stru_10001CEC8, &stru_10001CE88);
    pthread_mutex_unlock(&stru_10001CE88);
  }
  while (!*((unsigned char *)v5 + 24));
  _Block_object_dispose(&v4, 8);
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 40));
  _Block_object_dispose(v8, 8);
}

void sub_10000D548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D574(void *a1)
{
  uint64_t v2 = (void *)a1[7];
  uint64_t v3 = a1 + 4;
  uint64_t v4 = (void *)v2[16];
  if (!v4)
  {
LABEL_7:
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    unint64_t v7 = v2[21];
    goto LABEL_8;
  }
  unint64_t v5 = *v3;
  while (1)
  {
    unint64_t v6 = v4[4];
    if (v5 >= v6) {
      break;
    }
LABEL_6:
    uint64_t v4 = (void *)*v4;
    if (!v4) {
      goto LABEL_7;
    }
  }
  if (v6 < v5)
  {
    ++v4;
    goto LABEL_6;
  }
  unint64_t v7 = v2[21];
  if (!v7)
  {
    v2[21] = v5;
    unint64_t v7 = v5;
  }
LABEL_8:
  if (v7 == *v3 && !v2[20])
  {
    sub_1000103BC((uint64_t)(v2 + 15), v3);
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
  else if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24) && *(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    id v8 = RXOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      pid_t pid = xpc_connection_get_pid((xpc_connection_t)*v3);
      uint64_t v10 = v2[20];
      v11[0] = 67109376;
      v11[1] = pid;
      __int16 v12 = 1024;
      int v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "daemon(%d) waiting for write lock (%u readers)", (uint8_t *)v11, 0xEu);
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
}

void RDMinions::EventHandler(uint64_t a1, _xpc_connection_s *a2, xpc_object_t object)
{
  id v28 = a2;
  xpc_type_t type = xpc_get_type(object);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    BOOL v9 = object == &_xpc_error_connection_invalid || object == &_xpc_error_connection_interrupted;
    if (v9)
    {
      uint64_t v10 = RXOSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        pid_t pid = xpc_connection_get_pid(a2);
        __int16 v12 = "INTERRUPTED";
        if (object == &_xpc_error_connection_invalid) {
          __int16 v12 = "INVALID";
        }
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = pid;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "daemon(%d) XPC_ERROR_CONNECTION_%s", buf, 0x12u);
      }
      int v13 = *(const void ***)(a1 + 24);
      if (v13 == (const void **)(a1 + 32))
      {
LABEL_25:
        int v16 = 0;
      }
      else
      {
        while (v13[8] != a2)
        {
          double v14 = (const void **)v13[1];
          if (v14)
          {
            do
            {
              os_log_type_t v15 = (const void ***)v14;
              double v14 = (const void **)*v14;
            }
            while (v14);
          }
          else
          {
            do
            {
              os_log_type_t v15 = (const void ***)v13[2];
              BOOL v9 = *v15 == v13;
              int v13 = (const void **)v15;
            }
            while (!v9);
          }
          int v13 = (const void **)v15;
          if (v15 == (const void ***)(a1 + 32)) {
            goto LABEL_25;
          }
        }
        sub_1000104F4((uint64_t **)(a1 + 24), v13 + 4);
        int v16 = 1;
      }
      if (sub_1000103BC(a1 + 48, (unint64_t *)&v28)) {
        int v17 = 1;
      }
      else {
        int v17 = v16;
      }
      sub_1000103BC(a1 + 72, (unint64_t *)&v28);
      if ((v17 & 1) != 0 || RDMinions::Unlock(a1, (unint64_t)v28))
      {
        BOOL v18 = RXOSLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          BOOL v19 = "starting";
          if (v17) {
            BOOL v19 = "busy";
          }
          double v20 = (const char *)a1;
          if (*(char *)(a1 + 23) < 0) {
            double v20 = *(const char **)a1;
          }
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = v19;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = v20;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "daemon died while %s; rebuilding cache for %s",
            buf,
            0x16u);
        }
        float v21 = (const char *)a1;
        if (*(char *)(a1 + 23) < 0) {
          float v21 = *(const char **)a1;
        }
        CFStringRef v22 = CFStringCreateWithCStringNoCopy(0, v21, 0x8000100u, kCFAllocatorNull);
        RDNukeCache(v22);
        CFRelease(v22);
      }
      uint64_t v23 = qword_10001CE70;
      if ((uint64_t *)qword_10001CE70 != &qword_10001CE78)
      {
        do
        {
          context = xpc_connection_get_context(*(xpc_connection_t *)(v23 + 32));
          sub_1000103BC((uint64_t)context, (unint64_t *)&v28);
          id v25 = *(uint64_t **)(v23 + 8);
          if (v25)
          {
            do
            {
              float v26 = v25;
              id v25 = (uint64_t *)*v25;
            }
            while (v25);
          }
          else
          {
            do
            {
              float v26 = *(uint64_t **)(v23 + 16);
              BOOL v9 = *v26 == v23;
              uint64_t v23 = (uint64_t)v26;
            }
            while (!v9);
          }
          uint64_t v23 = (uint64_t)v26;
        }
        while (v26 != &qword_10001CE78);
      }
      float v27 = (uint64_t **)(a1 + 96);
      *(void *)buf = &v28;

      sub_1000103BC((uint64_t)v27, (unint64_t *)&v28);
    }
  }
  else
  {
    if (type != (xpc_type_t)&_xpc_type_dictionary) {
      sub_100011FF4();
    }
    int64_t int64 = xpc_dictionary_get_int64(object, kRDKeyMessage);
    if (int64 == 401)
    {
      RDMinions::Unlock(a1, (unint64_t)a2);
    }
    else if (int64 == 400)
    {
      xpc_object_t reply = xpc_dictionary_create_reply(object);
      xpc_dictionary_set_int64(reply, kRDKeyMessage, 301);
      RDMinions::LockWriter(a1, a2, (uint64_t)reply);
    }
  }
}

xpc_connection_t RDMinions::Summon(RDMinions *this)
{
  xpc_connection_t connection = 0;
  if (*((void *)this + 11))
  {
    xpc_connection_t connection = *(xpc_connection_t *)(*((void *)this + 9) + 32);
    sub_1000103BC((uint64_t)this + 72, (unint64_t *)&connection);
    uint64_t v2 = RXOSLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      pid_t pid = xpc_connection_get_pid(connection);
      *(_DWORD *)uuid_t out = 67109120;
      *(_DWORD *)&out[4] = pid;
      uint64_t v4 = "minion(%d) recycled.";
      unint64_t v5 = out;
      unint64_t v6 = v2;
      os_log_type_t v7 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v6, v7, v4, v5, 8u);
    }
  }
  else
  {
    memset(out, 0, sizeof(out));
    uuid_generate(out);
    id v8 = xpc_connection_create("com.apple.SpeechRecognitionCore.speechrecognitiond", (dispatch_queue_t)&_dispatch_main_q);
    xpc_connection_t connection = v8;
    if (v8)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000DD50;
      v15[3] = &unk_100018EB0;
      v15[4] = v8;
      v15[5] = this;
      xpc_connection_set_event_handler(v8, v15);
      xpc_connection_set_instance();
      xpc_connection_resume(connection);
      xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v9, kRDKeyMessage, 300);
      xpc_connection_send_message(connection, v9);
      xpc_release(v9);
      uint64_t v10 = os_transaction_create();
      *(void *)buf = &connection;
      sub_10000FF04((uint64_t **)this + 12, (unint64_t *)&connection, (uint64_t)&unk_1000142C0, (uint64_t **)buf)[5] = v10;
    }
    else
    {
      int v11 = RXOSLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = out;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unable to create new minion instance %s", buf, 0xCu);
      }
    }
    __int16 v12 = RXOSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      pid_t v13 = xpc_connection_get_pid(connection);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v13;
      uint64_t v4 = "minion(%d) created.";
      unint64_t v5 = buf;
      unint64_t v6 = v12;
      os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_10;
    }
  }
  return connection;
}

void sub_10000DD50(uint64_t a1, xpc_object_t object)
{
}

uint64_t sub_10000DD60(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000DD90(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + 8) = v2;
    operator delete(v2);
  }
  return a1;
}

void RDRecognizers::RDRecognizers(RDRecognizers *this)
{
  *((void *)this + 4) = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = 0;
  *((_DWORD *)this + 6) = 0;
  *(void *)out_token = 0;
  notify_register_dispatch("com.apple.sessionagent.screenIsLocked", &out_token[1], (dispatch_queue_t)&_dispatch_main_q, &stru_100018EF0);
  notify_register_dispatch("com.apple.sessionagent.screenIsUnlocked", out_token, (dispatch_queue_t)&_dispatch_main_q, &stru_100018F10);
}

void sub_10000DE44(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

unint64_t RDRecognizers::UpdateRecognizer(char **a1, _xpc_connection_s *a2, xpc_object_t xdict)
{
  unint64_t int64 = xpc_dictionary_get_int64(xdict, kRDKeyRecognizerID);
  xpc_object_t value = xpc_dictionary_get_value(xdict, kRDKeyWantFeedback);
  if (value)
  {
    os_log_type_t v15 = value;
    if ((int64 & 0x8000000000000000) != 0 || (int v16 = *a1, int64 >= 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 3)))
    {
      int v17 = a1[4];
      if (v17)
      {
        a1[4] = v17 - 1;
        int v16 = *a1;
        uint64_t v18 = 40 * int64 + 40;
        do
        {
          ++int64;
          uint64_t v19 = *(void *)&v16[v18];
          v18 += 40;
        }
        while (v19);
      }
      else
      {
        CFStringRef v22 = a1[1];
        unint64_t int64 = (v22 - *a1) / 40;
        uint64_t v23 = a1[2];
        if (v22 >= v23)
        {
          if (int64 + 1 > 0x666666666666666) {
            sub_10001066C();
          }
          unint64_t v25 = 0xCCCCCCCCCCCCCCCDLL * ((v23 - *a1) >> 3);
          uint64_t v26 = 2 * v25;
          if (2 * v25 <= int64 + 1) {
            uint64_t v26 = int64 + 1;
          }
          if (v25 >= 0x333333333333333) {
            unint64_t v27 = 0x666666666666666;
          }
          else {
            unint64_t v27 = v26;
          }
          if (v27) {
            id v28 = (char *)sub_100010684((uint64_t)(a1 + 2), v27);
          }
          else {
            id v28 = 0;
          }
          id v29 = &v28[40 * int64];
          int v30 = &v28[40 * v27];
          *((void *)v29 + 4) = 0;
          float v24 = v29 + 40;
          uint64_t v32 = *a1;
          id v31 = a1[1];
          if (v31 != *a1)
          {
            do
            {
              long long v33 = *(_OWORD *)(v31 - 40);
              long long v34 = *(_OWORD *)(v31 - 24);
              *((void *)v29 - 1) = *((void *)v31 - 1);
              *(_OWORD *)(v29 - 24) = v34;
              *(_OWORD *)(v29 - 40) = v33;
              v29 -= 40;
              v31 -= 40;
            }
            while (v31 != v32);
            id v31 = *a1;
          }
          *a1 = v29;
          a1[1] = v24;
          a1[2] = v30;
          if (v31) {
            operator delete(v31);
          }
        }
        else
        {
          *((void *)v22 + 4) = 0;
          float v24 = v22 + 40;
        }
        a1[1] = v24;
        int v16 = *a1;
      }
      int v35 = *((_DWORD *)a1 + 6);
      *((_DWORD *)a1 + 6) = v35 + 1;
      *(_DWORD *)&v16[40 * int64 + 16] = v35;
    }
    CFStringRef v36 = &v16[40 * int64];
    *(void *)CFStringRef v36 = a2;
    *((void *)v36 + 1) = xpc_dictionary_get_uint64(xdict, kRDKeyActivityMode);
    v36[20] = xpc_BOOL_get_value(v15);
    v36[22] = 0;
    int v37 = xpc_dictionary_get_int64(xdict, kRDKeyClientPID);
    *((_DWORD *)v36 + 6) = v37;
    v38 = (pid_t *)(v36 + 24);
    if (!v37) {
      pid_t *v38 = xpc_connection_get_pid(a2);
    }
    xpc_object_t v39 = xpc_dictionary_get_value(xdict, kRDKeyCommandInfo);
    if (v39)
    {
      v40 = v39;
      v41 = &v16[40 * int64];
      v44 = (const void *)*((void *)v41 + 4);
      v43 = (uint64_t *)(v41 + 32);
      v42 = v44;
      if (v44) {
        CFRelease(v42);
      }
      if (xpc_get_type(v40) == (xpc_type_t)&_xpc_type_array) {
        uint64_t *v43 = _CFXPCCreateCFObjectFromXPCObject();
      }
      else {
        uint64_t *v43 = 0;
      }
    }
  }
  else if ((int64 & 0x8000000000000000) != 0 || int64 >= 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 3))
  {
    sub_10000E16C(0, v8, v9, v10, v11, v12, v13, v14, int64);
    return -1;
  }
  else
  {
    double v20 = &(*a1)[40 * int64];
    float v21 = (const void *)*((void *)v20 + 4);
    if (v21)
    {
      CFRelease(v21);
      *((void *)v20 + 4) = 0;
    }
    *(void *)double v20 = 0;
    ++a1[4];
  }
  return int64;
}

void sub_10000E16C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFStringRef v9 = CFStringCreateWithFormatAndArguments(0, 0, @"Received invalid recognizer ID in UpdateRecognizer %lld", &a9);
  CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(0, v9, 0x8000100u, 0);
  CFRelease(v9);
  uint64_t v11 = RXOSLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 68157954;
    int Length = CFDataGetLength(ExternalRepresentation);
    __int16 v14 = 2080;
    BytePtr = CFDataGetBytePtr(ExternalRepresentation);
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%.*s", buf, 0x12u);
  }
  CFRelease(ExternalRepresentation);
}

void RDRecognizers::RemovePeer(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(a1 + 8);
  if (*(void **)a1 != v3)
  {
    do
    {
      if (*v2 == a2)
      {
        unint64_t v6 = (const void *)v2[4];
        if (v6)
        {
          CFRelease(v6);
          v2[4] = 0;
        }
        void *v2 = 0;
        ++*(void *)(a1 + 32);
      }
      v2 += 5;
    }
    while (v2 != v3);
  }
}

int main(int argc, const char **argv, const char **envp)
{
}

void sub_10000E330(_xpc_connection_s *a1)
{
  uint64_t v1 = a1;
  xpc_connection_set_target_queue(a1, (dispatch_queue_t)&_dispatch_main_q);
  operator new();
}

void sub_10000E40C(uint64_t a1, xpc_object_t object)
{
  uint64_t v3 = *(_xpc_connection_s **)(a1 + 32);
  v94 = v3;
  xpc_type_t type = xpc_get_type(object);
  if (type != (xpc_type_t)&_xpc_type_error)
  {
    if (type != (xpc_type_t)&_xpc_type_dictionary) {
      sub_1000120A4();
    }
    unint64_t int64 = (RDLanguageAssets *)xpc_dictionary_get_int64(object, kRDKeyMessage);
    switch((unint64_t)int64)
    {
      case 0x1F4uLL:
        xpc_object_t reply = xpc_dictionary_create_reply(object);
        os_log_type_t v7 = kRDKeyRecognizerID;
        int64_t updated = RDRecognizers::UpdateRecognizer((char **)&unk_10001CEF8, v3, object);
        xpc_object_t v9 = reply;
        uint64_t v10 = v7;
        goto LABEL_72;
      case 0x1F5uLL:
        xpc_object_t reply = xpc_dictionary_create_reply(object);
        goto LABEL_79;
      case 0x1F6uLL:
        xpc_object_t reply = xpc_dictionary_create_reply(object);
        xpc_dictionary_get_value(object, kRDKeyLocale);
        v45 = (const void *)_CFXPCCreateCFObjectFromXPCObject();
        if (!v45) {
          goto LABEL_79;
        }
        goto LABEL_78;
      case 0x1F7uLL:
        xpc_object_t reply = xpc_dictionary_create_reply(object);
        uunint64_t int64 = (_xpc_connection_s *)xpc_dictionary_get_uint64(object, kRDKeyObjectID);
        context = xpc_connection_get_context(v3);
        v48 = (void *)context[1];
        if (v48)
        {
          v49 = context + 1;
          do
          {
            unint64_t v50 = v48[4];
            BOOL v51 = v50 >= (unint64_t)uint64;
            if (v50 >= (unint64_t)uint64) {
              v52 = v48;
            }
            else {
              v52 = v48 + 1;
            }
            if (v51) {
              v49 = v48;
            }
            v48 = (void *)*v52;
          }
          while (*v52);
          if (v49 != context + 1 && v49[4] <= (unint64_t)uint64)
          {
            uint64_t v53 = v49[5] - 1;
            v49[5] = v53;
            if (!v53)
            {
              sub_10000FFC4((uint64_t **)context, v49);
              operator delete(v49);
            }
            sub_10000F324(uint64);
          }
        }
        goto LABEL_79;
      case 0x1F8uLL:
        CFDictionaryRef v38 = RDLanguageAssets::CopyInstallationStatus(int64);
        xpc_object_t reply = xpc_dictionary_create_reply(object);
        if (!v38) {
          goto LABEL_79;
        }
        xpc_object_t v39 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        v40 = &kRDKeyAssetStatus;
        goto LABEL_75;
      case 0x1F9uLL:
        string = xpc_dictionary_get_string(object, kRDKeyLocale);
        CFStringRef v57 = CFStringCreateWithCStringNoCopy(0, string, 0x8000100u, kCFAllocatorNull);
        id v59 = RDLanguageAssets::InstallAndCopyQuasarModelPathForLanguage(v57, v58);
        if (v59) {
          goto LABEL_86;
        }
        return;
      case 0x1FAuLL:
        signed int v60 = RDLanguageAssets::PurgeInstalledQuasarAssets(int64);
        xpc_object_t v9 = xpc_dictionary_create_reply(object);
        xpc_object_t reply = v9;
        uint64_t v10 = kRDKeyPurgeStatus;
        int64_t updated = v60;
LABEL_72:
        xpc_dictionary_set_int64(v9, v10, updated);
        goto LABEL_79;
      case 0x1FBuLL:
        if (xpc_dictionary_get_BOOL(object, kRDKeyDownloadProgress))
        {
          RDLanguageAssets::AddPeerForProgressCallback(v3);
          byte_10001CF20 = 1;
        }
        else
        {
          RDLanguageAssets::RemovePeerForProgressCallback(v3);
        }
        return;
      case 0x1FCuLL:
        v65 = xpc_dictionary_get_string(object, kRDKeyLocale);
        v66 = (RDLanguageAssets *)CFStringCreateWithCStringNoCopy(0, v65, 0x8000100u, kCFAllocatorNull);
        RDLanguageAssets::CancelDownloadForLanguage(v66, v67);
        return;
      case 0x1FDuLL:
        v41 = xpc_dictionary_get_string(object, kRDKeyLocale);
        CFStringRef v42 = CFStringCreateWithCStringNoCopy(0, v41, 0x8000100u, kCFAllocatorNull);
        CFDictionaryRef v44 = (const __CFDictionary *)RDLanguageAssets::CopyInstalledAssetPathForLanguage(v42, v43);
        if (!v44) {
          return;
        }
        CFDictionaryRef v38 = v44;
        xpc_object_t reply = xpc_dictionary_create_reply(object);
        xpc_object_t v39 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        v40 = &kRDKeyInstalledAssetPath;
        goto LABEL_75;
      case 0x1FEuLL:
        v61 = xpc_dictionary_get_string(object, kRDKeyLocale);
        CFStringRef v62 = CFStringCreateWithCStringNoCopy(0, v61, 0x8000100u, kCFAllocatorNull);
        CFDictionaryRef v64 = (const __CFDictionary *)RDLanguageAssets::CopyInstalledAssetSupportedTasksForLanguage(v62, v63);
        if (!v64) {
          return;
        }
        CFDictionaryRef v38 = v64;
        xpc_object_t reply = xpc_dictionary_create_reply(object);
        xpc_object_t v39 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        v40 = &kRDKeyInstalledAssetSupportedTasks;
LABEL_75:
        xpc_dictionary_set_value(reply, *v40, v39);
        if (v39) {
          CFRelease(v39);
        }
        v45 = v38;
LABEL_78:
        CFRelease(v45);
        goto LABEL_79;
      case 0x1FFuLL:
        xpc_object_t array = xpc_dictionary_get_array(object, kRDKeyLocales);
        Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
        count = (RDLanguageAssets *)xpc_array_get_count(array);
        if (count)
        {
          for (size_t i = 0; i < (unint64_t)count; ++i)
          {
            int v30 = xpc_array_get_string(array, i);
            CFStringRef v31 = CFStringCreateWithCStringNoCopy(0, v30, 0x8000100u, kCFAllocatorNull);
            CFDictionaryRef MutableCopy = CFStringCreateMutableCopy(0, 0, v31);
            v97.length = CFStringGetLength(v31);
            v97.location = 0;
            CFStringFindAndReplace(MutableCopy, @"_", @"-", v97, 0);
            if (RXEngineTypeForLocaleIdentifier() == 1) {
              CFArrayAppendValue(Mutable, MutableCopy);
            }
            CFRelease(MutableCopy);
            long long v33 = CFStringCreateMutableCopy(0, 0, v31);
            v98.length = CFStringGetLength(v31);
            v98.location = 0;
            CFStringFindAndReplace(v33, @"-", @"_", v98, 0);
            CFRelease(v31);
            CFStringRef v34 = (const __CFString *)RXGetAssetFallbackLocaleIdentifier();
            CFRelease(v33);
            if (v34)
            {
              int v35 = CFStringCreateMutableCopy(0, 0, v34);
              v99.length = CFStringGetLength(v34);
              v99.location = 0;
              CFStringFindAndReplace(v35, @"_", @"-", v99, 0);
              if (RXEngineTypeForLocaleIdentifier() == 1) {
                CFArrayAppendValue(Mutable, v35);
              }
              CFRelease(v35);
            }
            count = (RDLanguageAssets *)xpc_array_get_count(array);
          }
        }
        CFDictionaryRef v36 = RDLanguageAssets::CopyInstallationStatus(count);
        CFTypeID v37 = CFGetTypeID(v36);
        if (v37 == CFDictionaryGetTypeID())
        {
          CFDictionaryGetCount(v36);
          operator new[]();
        }
        RDLanguageAssets::SetPurgeabilityForLanguages(Mutable, 0);
        CFRelease(Mutable);
        id v59 = v36;
LABEL_86:
        CFRelease(v59);
        return;
      default:
        float v24 = int64;
        if (int64 != (RDLanguageAssets *)101)
        {
          if (int64 == (RDLanguageAssets *)999) {
            sub_100012020(v3);
          }
          unint64_t v25 = RXOSLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&uint8_t buf[4] = xpc_connection_get_pid(v3);
            *(_WORD *)&buf[8] = 2048;
            *(void *)&buf[10] = v24;
            double v20 = "peer(%d) unknown or unimplemented message %lld";
            float v21 = v25;
            os_log_type_t v22 = OS_LOG_TYPE_ERROR;
            uint32_t v23 = 18;
            goto LABEL_31;
          }
          return;
        }
        xpc_object_t reply = xpc_dictionary_create_reply(object);
        v54 = (char *)xpc_dictionary_get_string(object, kRDKeyLocale);
        sub_10000F5E0(&v93, v54);
        if ((xpc_dictionary_get_uint64(object, kRDKeyOptions) & 0x400000) != 0)
        {
          v55 = ".q";
        }
        else
        {
          if ((xpc_dictionary_get_uint64(object, kRDKeyOptions) & 0x800000) == 0) {
            goto LABEL_94;
          }
          v55 = ".n";
        }
        std::string::append(&v93, v55);
LABEL_94:
        if ((v93.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          v68 = &v93;
        }
        else {
          v68 = (std::string *)v93.__r_.__value_.__r.__words[0];
        }
        sub_10000F5E0(buf, (char *)v68);
        __p[0] = buf;
        v69 = sub_10000F770((uint64_t **)&sMinions, (const void **)buf, (uint64_t)&unk_1000142C0, (_OWORD **)__p);
        if ((buf[23] & 0x80000000) != 0) {
          operator delete(*(void **)buf);
        }
        uint64_t v70 = (uint64_t)v69 + 56;
        xpc_connection_t connection = 0;
        if (*((char *)v69 + 79) < 0)
        {
          if (*((void *)v69 + 8)) {
            goto LABEL_104;
          }
        }
        else if (*((unsigned char *)v69 + 79))
        {
          goto LABEL_104;
        }
        v71 = xpc_dictionary_get_string(object, kRDKeyLocale);
        std::string::assign((std::string *)((char *)v69 + 56), v71);
LABEL_104:
        if (!xpc_dictionary_get_BOOL(object, kRDKeyLiveAudio))
        {
          xpc_connection_t connection = RDMinions::Summon((RDMinions *)((char *)v69 + 56));
          if (!connection) {
            goto LABEL_127;
          }
          if ((xpc_dictionary_get_uint64(object, kRDKeyOptions) & 2) == 0) {
            sub_100010438((uint64_t **)v69 + 13, (unint64_t *)&connection, (uint64_t *)&connection);
          }
          v82 = RXOSLog();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = connection;
            _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "Summoning new batch minion %p", buf, 0xCu);
          }
LABEL_125:
          if (connection)
          {
            xpc_endpoint_t v87 = xpc_endpoint_create(connection);
            xpc_dictionary_set_int64(reply, kRDKeyMessage, 201);
            xpc_dictionary_set_value(reply, kRDKeyConnection, v87);
            xpc_dictionary_set_uint64(reply, kRDKeyObjectID, (uint64_t)connection);
            xpc_release(v87);
            v88 = (uint64_t **)xpc_connection_get_context(v3);
            *(void *)buf = &connection;
            v89 = sub_10000FF04(v88, (unint64_t *)&connection, (uint64_t)&unk_1000142C0, (uint64_t **)buf);
            ++v89[5];
            RDMinions::LockReader(v70, (uint64_t)connection, v3, (uint64_t)reply);
            xpc_object_t reply = 0;
          }
LABEL_127:
          if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v93.__r_.__value_.__l.__data_);
          }
LABEL_79:
          if (reply)
          {
            xpc_connection_send_message(v3, reply);
            xpc_release(reply);
          }
          return;
        }
        v72 = xpc_dictionary_get_string(object, kRDKeyAudioDevice);
        if (v72) {
          v73 = (char *)v72;
        }
        else {
          v73 = "?";
        }
        sub_10000F5E0(__p, v73);
        *(void *)buf = __p;
        v74 = sub_10000FCC4((uint64_t **)v69 + 10, (const void **)__p, (uint64_t)&unk_1000142C0, (long long **)buf);
        if (v74[8])
        {
          v75 = RXOSLog();
          if (!os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_123;
          }
          v76 = (_xpc_connection_s *)v74[8];
          pid_t pid = xpc_connection_get_pid(v76);
          v78 = __p;
          if (v91 < 0) {
            v78 = (void **)__p[0];
          }
          *(_DWORD *)buf = 134218498;
          *(void *)&uint8_t buf[4] = v76;
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(_DWORD *)&buf[14] = pid;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = v78;
          v79 = "Using existing live minion %p[%d] for audio device %s";
          v80 = v75;
          uint32_t v81 = 28;
        }
        else
        {
          v74[8] = (uint64_t)RDMinions::Summon((RDMinions *)((char *)v69 + 56));
          v83 = RXOSLog();
          if (!os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_123;
          }
          uint64_t v84 = v74[8];
          v85 = __p;
          if (v91 < 0) {
            v85 = (void **)__p[0];
          }
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = v84;
          *(_WORD *)&unsigned char buf[12] = 2080;
          *(void *)&buf[14] = v85;
          v79 = "Summoning new live minion %p for audio device %s";
          v80 = v83;
          uint32_t v81 = 22;
        }
        _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, v79, buf, v81);
LABEL_123:
        uint64_t v86 = v74[7];
        xpc_connection_t connection = (xpc_connection_t)v74[8];
        v74[7] = v86 + 1;
        if (v91 < 0) {
          operator delete(__p[0]);
        }
        goto LABEL_125;
    }
  }
  BOOL v11 = object == &_xpc_error_connection_invalid || object == &_xpc_error_connection_interrupted;
  if (v11)
  {
    uint64_t v12 = RXOSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      pid_t v13 = xpc_connection_get_pid(v3);
      __int16 v14 = "INTERRUPTED";
      if (object == &_xpc_error_connection_invalid) {
        __int16 v14 = "INVALID";
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "peer(%d) XPC_ERROR_CONNECTION_%s", buf, 0x12u);
    }
    os_log_type_t v15 = (void **)xpc_connection_get_context(v3);
    int v16 = *v15;
    if (*v15 != v15 + 1)
    {
      do
      {
        sub_10000F324((_xpc_connection_s *)v16[4]);
        int v17 = (void *)v16[1];
        if (v17)
        {
          do
          {
            uint64_t v18 = v17;
            int v17 = (void *)*v17;
          }
          while (v17);
        }
        else
        {
          do
          {
            uint64_t v18 = (void *)v16[2];
            BOOL v11 = *v18 == (void)v16;
            int v16 = v18;
          }
          while (!v11);
        }
        int v16 = v18;
      }
      while (v18 != v15 + 1);
    }
    RDRecognizers::RemovePeer((uint64_t)&unk_10001CEF8, (uint64_t)v3);
    if (byte_10001CF20) {
      RDLanguageAssets::RemovePeerForProgressCallback(v3);
    }
    sub_1000103BC((uint64_t)&qword_10001CE70, (unint64_t *)&v94);
    sub_10000F58C((uint64_t)v15, v15[1]);
    operator delete();
  }
  if (object == &_xpc_error_termination_imminent)
  {
    uint64_t v19 = RXOSLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = xpc_connection_get_pid(v3);
      double v20 = "peer(%d) XPC_ERROR_TERMINATION_IMMINENT";
      float v21 = v19;
      os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
      uint32_t v23 = 8;
LABEL_31:
      _os_log_impl((void *)&_mh_execute_header, v21, v22, v20, buf, v23);
    }
  }
}

void sub_10000F27C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a22 < 0) {
    operator delete(a17);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000F324(_xpc_connection_s *a1)
{
  xpc_connection_t connection = a1;
  uint64_t v2 = RXOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v19[0] = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Releasing minion %p\n", buf, 0xCu);
  }
  uint64_t v3 = sMinions;
  if ((uint64_t *)sMinions != &qword_10001CF30)
  {
    while (1)
    {
      uint64_t v4 = *(const void ***)(v3 + 80);
      if (v4 != (const void **)(v3 + 88))
      {
        while (v4[8] != connection)
        {
          unint64_t v5 = (const void **)v4[1];
          if (v5)
          {
            do
            {
              unint64_t v6 = (const void ***)v5;
              unint64_t v5 = (const void **)*v5;
            }
            while (v5);
          }
          else
          {
            do
            {
              unint64_t v6 = (const void ***)v4[2];
              BOOL v7 = *v6 == v4;
              uint64_t v4 = (const void **)v6;
            }
            while (!v7);
          }
          uint64_t v4 = (const void **)v6;
          if (v6 == (const void ***)(v3 + 88)) {
            goto LABEL_12;
          }
        }
        uint64_t v10 = (uint64_t)v4[7] - 1;
        v4[7] = (const void *)v10;
        if (!v10)
        {
          sub_1000104F4((uint64_t **)(v3 + 80), v4 + 4);
          sub_100010438((uint64_t **)(v3 + 128), (unint64_t *)&connection, (uint64_t *)&connection);
          BOOL v11 = RXOSLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            pid_t pid = xpc_connection_get_pid(connection);
            pid_t v13 = (void *)(v3 + 32);
            if (*(char *)(v3 + 55) < 0) {
              pid_t v13 = (void *)*v13;
            }
            *(_DWORD *)buf = 67109378;
            LODWORD(v19[0]) = pid;
            WORD2(v19[0]) = 2080;
            *(void *)((char *)v19 + 6) = v13;
            __int16 v14 = "daemon(%d) [%s] is now idle (was live).";
            goto LABEL_25;
          }
        }
        return;
      }
LABEL_12:
      if (sub_1000103BC(v3 + 104, (unint64_t *)&connection)) {
        break;
      }
      uint64_t v8 = *(uint64_t **)(v3 + 8);
      if (v8)
      {
        do
        {
          xpc_object_t v9 = v8;
          uint64_t v8 = (uint64_t *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          xpc_object_t v9 = *(uint64_t **)(v3 + 16);
          BOOL v7 = *v9 == v3;
          uint64_t v3 = (uint64_t)v9;
        }
        while (!v7);
      }
      uint64_t v3 = (uint64_t)v9;
      if (v9 == &qword_10001CF30) {
        return;
      }
    }
    sub_100010438((uint64_t **)(v3 + 128), (unint64_t *)&connection, (uint64_t *)&connection);
    BOOL v11 = RXOSLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      pid_t v15 = xpc_connection_get_pid(connection);
      int v16 = (void *)(v3 + 32);
      if (*(char *)(v3 + 55) < 0) {
        int v16 = (void *)*v16;
      }
      *(_DWORD *)buf = 67109378;
      LODWORD(v19[0]) = v15;
      WORD2(v19[0]) = 2080;
      *(void *)((char *)v19 + 6) = v16;
      __int16 v14 = "daemon(%d) [%s] is now idle (was batch).";
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v14, buf, 0x12u);
    }
  }
}

void sub_10000F58C(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_10000F58C(a1, *a2);
    sub_10000F58C(a1, a2[1]);
    operator delete(a2);
  }
}

void *sub_10000F5E0(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_10000F694();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    unint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    unint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_10000F694()
{
}

void sub_10000F6AC(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10000F708(exception, a1);
}

void sub_10000F6F4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_10000F708(std::logic_error *a1, const char *a2)
{
  id result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_10000F73C()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

_OWORD *sub_10000F770(uint64_t **a1, const void **a2, uint64_t a3, _OWORD **a4)
{
  unint64_t v6 = (void **)sub_10000F880((uint64_t)a1, &v14, a2);
  uint64_t v7 = *v6;
  if (!*v6)
  {
    uint64_t v8 = (uint64_t **)v6;
    uint64_t v7 = operator new(0xE8uLL);
    v12[1] = a1 + 1;
    xpc_object_t v9 = *a4;
    uint64_t v10 = *((void *)*a4 + 2);
    v7[2] = **a4;
    *((void *)v7 + 6) = v10;
    v9[1] = 0;
    v9[2] = 0;
    *xpc_object_t v9 = 0;
    *((void *)v7 + 7) = 0;
    *((void *)v7 + 8) = 0;
    *((void *)v7 + 11) = 0;
    *((void *)v7 + 9) = 0;
    *((void *)v7 + 1pthread_cond_init(&stru_10001CEC8, 0) = (char *)v7 + 88;
    *((void *)v7 + 14) = 0;
    *((void *)v7 + 12) = 0;
    *((void *)v7 + 13) = v7 + 7;
    *((void *)v7 + 17) = 0;
    *((void *)v7 + 2pthread_cond_init(&stru_10001CEC8, 0) = 0;
    *((void *)v7 + 15) = 0;
    *((void *)v7 + 16) = (char *)v7 + 136;
    *((void *)v7 + 18) = 0;
    *((void *)v7 + 19) = v7 + 10;
    *((void *)v7 + 23) = 0;
    *((void *)v7 + 21) = 0;
    *((void *)v7 + 22) = (char *)v7 + 184;
    *((void *)v7 + 26) = 0;
    *((void *)v7 + 24) = 0;
    *((void *)v7 + 25) = v7 + 13;
    *((void *)v7 + 27) = 0;
    *((void *)v7 + 28) = 0;
    char v13 = 1;
    sub_10000F920(a1, v14, v8, (uint64_t *)v7);
    v12[0] = 0;
    sub_10000FB7C((uint64_t)v12, 0);
  }
  return v7;
}

void *sub_10000F880(uint64_t a1, void *a2, const void **a3)
{
  size_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        uint64_t v8 = (void *)v4;
        xpc_object_t v9 = (const void **)(v4 + 32);
        if (!sub_10000F978(v7, a3, (const void **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v8;
        size_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!sub_10000F978(v7, v9, a3)) {
        break;
      }
      size_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    uint64_t v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

uint64_t *sub_10000F920(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  size_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  id result = sub_10000F9E4(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

BOOL sub_10000F978(uint64_t a1, const void **a2, const void **a3)
{
  int v3 = *((char *)a3 + 23);
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  if (v4 >= 0) {
    unint64_t v6 = a2;
  }
  else {
    unint64_t v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = *a3;
  }
  if (v7 >= v5) {
    size_t v9 = v5;
  }
  else {
    size_t v9 = v7;
  }
  int v10 = memcmp(v6, v8, v9);
  if (v10) {
    return v10 < 0;
  }
  else {
    return v5 < v7;
  }
}

uint64_t *sub_10000F9E4(uint64_t *result, uint64_t *a2)
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
      int v3 = (uint64_t *)v2[2];
      int v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            size_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            size_t v9 = (uint64_t **)v2[1];
            int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              int v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *size_t v9 = v2;
            v2[2] = (uint64_t)v9;
            int v3 = v9[2];
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
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            int v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          int v3 = (uint64_t *)a2[2];
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
        uint64_t *v2 = (uint64_t)v3;
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

void sub_10000FB7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      sub_10000FBD4((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

uint64_t sub_10000FBD4(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_10000FC60(uint64_t a1, char *a2)
{
  if (a2)
  {
    sub_10000FC60(a1, *(void *)a2);
    sub_10000FC60(a1, *((void *)a2 + 1));
    if (a2[55] < 0) {
      operator delete(*((void **)a2 + 4));
    }
    operator delete(a2);
  }
}

uint64_t *sub_10000FCC4(uint64_t **a1, const void **a2, uint64_t a3, long long **a4)
{
  int v6 = (uint64_t **)sub_10000F880((uint64_t)a1, &v9, a2);
  id result = *v6;
  if (!*v6)
  {
    sub_10000FD5C((uint64_t)a1, a4, (uint64_t)&v8);
    sub_10000F920(a1, v9, v6, v8);
    return v8;
  }
  return result;
}

unsigned char *sub_10000FD5C@<X0>(uint64_t a1@<X0>, long long **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  int v6 = operator new(0x48uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  id result = v6 + 4;
  int v8 = *a2;
  if (*((char *)*a2 + 23) < 0)
  {
    id result = sub_10000FE04(result, *(void **)v8, *((void *)v8 + 1));
  }
  else
  {
    long long v9 = *v8;
    v6[6] = *((void *)v8 + 2);
    *(_OWORD *)id result = v9;
  }
  void v6[7] = 0;
  v6[8] = 0;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_10000FDE8(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  sub_10000FEA4(v3, v2);
  _Unwind_Resume(a1);
}

void *sub_10000FE04(unsigned char *__dst, void *__src, unint64_t a3)
{
  uint64_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_10000F694();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    int v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    void *v5 = v8;
    uint64_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

void sub_10000FEA4(uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 55) < 0) {
      operator delete(__p[4]);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t *sub_10000FF04(uint64_t **a1, unint64_t *a2, uint64_t a3, uint64_t **a4)
{
  uint64_t v7 = a1 + 1;
  uint64_t v6 = a1[1];
  if (v6)
  {
    unint64_t v8 = *a2;
    while (1)
    {
      while (1)
      {
        long long v9 = (uint64_t **)v6;
        unint64_t v10 = v6[4];
        if (v8 >= v10) {
          break;
        }
        uint64_t v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      uint64_t v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    long long v9 = a1 + 1;
LABEL_10:
    uint64_t v11 = (uint64_t *)operator new(0x30uLL);
    v11[4] = **a4;
    v11[5] = 0;
    sub_10000F920(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

uint64_t *sub_10000FFC4(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      uint64_t v3 = v2;
      uint64_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    int v4 = a2;
    do
    {
      uint64_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      int v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  uint64_t v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  sub_100010038(v6, a2);
  return v3;
}

uint64_t *sub_100010038(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2;
  if (*a2)
  {
    int v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      uint64_t v3 = a2;
      goto LABEL_7;
    }
    do
    {
      uint64_t v3 = v4;
      int v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  uint64_t v6 = (uint64_t **)v3[2];
  uint64_t v7 = *v6;
  if (*v6 == v3)
  {
    *uint64_t v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      uint64_t v7 = 0;
      id result = (uint64_t *)v2;
    }
    else
    {
      uint64_t v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    uint64_t *v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      id result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      uint64_t v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      *uint64_t v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        id result = v7;
      }
      uint64_t v7 = *(uint64_t **)(*v7 + 8);
    }
    pid_t v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      int v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        *uint64_t v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        int v16 = v7;
      }
      else
      {
        pid_t v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      float v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      *float v24 = v23;
      goto LABEL_72;
    }
    int v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    int v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      int v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    uint64_t v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      id result = v7;
    }
    uint64_t v7 = *(uint64_t **)v12;
  }
  uint64_t v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  double v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    int v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    double v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    *double v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    uint64_t v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  float v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

uint64_t sub_1000103BC(uint64_t a1, unint64_t *a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (!v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  int v4 = (uint64_t *)(a1 + 8);
  do
  {
    unint64_t v5 = v2[4];
    BOOL v6 = v5 >= v3;
    if (v5 >= v3) {
      uint64_t v7 = v2;
    }
    else {
      uint64_t v7 = v2 + 1;
    }
    if (v6) {
      int v4 = v2;
    }
    uint64_t v2 = (void *)*v7;
  }
  while (*v7);
  if (v4 == (uint64_t *)(a1 + 8) || v3 < v4[4]) {
    return 0;
  }
  sub_10000FFC4((uint64_t **)a1, v4);
  operator delete(v4);
  return 1;
}

uint64_t *sub_100010438(uint64_t **a1, unint64_t *a2, uint64_t *a3)
{
  BOOL v6 = a1 + 1;
  unint64_t v5 = a1[1];
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
        unint64_t v5 = *v8;
        BOOL v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      unint64_t v5 = v8[1];
      if (!v5)
      {
        BOOL v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    int v8 = a1 + 1;
LABEL_10:
    uint64_t v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = *a3;
    sub_10000F920(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

uint64_t sub_1000104F4(uint64_t **a1, const void **a2)
{
  uint64_t v3 = sub_10001053C((uint64_t)a1, a2);
  if (a1 + 1 == (uint64_t **)v3) {
    return 0;
  }
  sub_1000105CC(a1, v3);
  return 1;
}

uint64_t sub_10001053C(uint64_t a1, const void **a2)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = a1 + 16;
  uint64_t v6 = a1 + 8;
  do
  {
    BOOL v7 = sub_10000F978(v5, (const void **)(v3 + 32), a2);
    int v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      int v8 = (uint64_t *)v3;
      uint64_t v6 = v3;
    }
    uint64_t v3 = *v8;
  }
  while (*v8);
  if (v6 == v2 || sub_10000F978(v5, a2, (const void **)(v6 + 32))) {
    return v2;
  }
  return v6;
}

uint64_t *sub_1000105CC(uint64_t **a1, uint64_t a2)
{
  uint64_t v3 = sub_10000FFC4(a1, (uint64_t *)a2);
  if (*(char *)(a2 + 55) < 0) {
    operator delete(*(void **)(a2 + 32));
  }
  operator delete((void *)a2);
  return v3;
}

void sub_100010610(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_100010610(a1, *a2);
    sub_100010610(a1, a2[1]);
    sub_10000FBD4((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void sub_10001066C()
{
}

void *sub_100010684(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    sub_10000F73C();
  }
  return operator new(40 * a2);
}

uint64_t sub_1000106CC()
{
  qword_10001CE80 = 0;
  qword_10001CE78 = 0;
  qword_10001CE70 = (uint64_t)&qword_10001CE78;
  __cxa_atexit((void (*)(void *))sub_10000CF00, &qword_10001CE70, (void *)&_mh_execute_header);
  qword_10001CF38 = 0;
  qword_10001CF30 = 0;
  sMinions = (uint64_t)&qword_10001CF30;
  __cxa_atexit((void (*)(void *))sub_10000DD60, &sMinions, (void *)&_mh_execute_header);
  RDRecognizers::RDRecognizers((RDRecognizers *)&unk_10001CEF8);
  return __cxa_atexit((void (*)(void *))sub_10000DD90, &unk_10001CEF8, (void *)&_mh_execute_header);
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
  CFArrayRef v0 = (const __CFArray *)CFCopySearchPathForDirectoriesInDomains();
  CFURLRef ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v0, 0);
  CFURLRef v2 = CFURLCreateCopyAppendingPathComponent(0, ValueAtIndex, @"com.apple.SpeechRecognitionCore", 1u);
  CFRelease(v0);
  CFStringRef v3 = CFURLCopyPath(v2);
  if (v3)
  {
    CFStringRef v4 = v3;
    CFStringGetCString(v3, buffer, 2000, 0x8000100u);
    uint64_t v5 = opendir(buffer);
    if (v5)
    {
      closedir(v5);
    }
    else if (mkdir(buffer, 0x1EDu))
    {
      BOOL v7 = RXOSLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = 138412290;
        CFURLRef v9 = v2;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error creating %@", (uint8_t *)&v8, 0xCu);
      }
    }
    CFRelease(v4);
  }
  return v2;
}

CFDictionaryRef RDCopyInfoDict(CFURLRef url)
{
  CFURLRef v1 = CFURLCreateCopyAppendingPathComponent(0, url, @"Info.plist", 0);
  return sub_10001097C(v1);
}

CFDictionaryRef sub_10001097C(CFURLRef fileURL)
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

CFBooleanRef RDCopyCacheVersion(const __CFString *a1)
{
  CFURLRef v1 = sub_100010B50(a1);
  if (v1)
  {
    CFURLRef v2 = v1;
    CFURLRef v3 = CFURLCreateCopyAppendingPathComponent(0, v1, @"Info.plist", 0);
    CFDictionaryRef v4 = sub_10001097C(v3);
    if (v4)
    {
      CFDictionaryRef v5 = v4;
      CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(v4, @"CFBundleShortVersionString");
      if (Value)
      {
        CFBooleanRef v7 = Value;
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
      CFBooleanRef v7 = 0;
    }
    else {
      CFBooleanRef v7 = kCFBooleanTrue;
    }
    if (v11 < 0) {
      operator delete(__p[0]);
    }
    goto LABEL_15;
  }
  return 0;
}

void sub_100010B34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

CFURLRef sub_100010B50(const __CFString *a1)
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
    CFURLRef v1 = sub_100010B50(a1);
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

void sub_100010CA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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
  CFMutableSetRef Mutable = CFSetCreateMutable(0, 0, &kCFTypeSetCallBacks);
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
        sub_100011EC4((uint64_t)&v20, v10 + 1);
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
        *(_WORD *)((char *)&v11->__r_.__value_.__l.__data_ + v1pthread_cond_init(&stru_10001CEC8, 0) = 47;
        uint64_t v13 = std::string::append(&v20, d_name);
        long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
        __p.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v14;
        v13->__r_.__value_.__l.__size_ = 0;
        v13->__r_.__value_.__r.__words[2] = 0;
        v13->__r_.__value_.__r.__words[0] = 0;
        BOOL v15 = sub_100010F44(&__p);
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
        int v17 = strchr(d_name, 95);
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

void sub_100010EE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_100010F44(std::string *a1)
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
  CFStringRef v4 = CFStringCreateWithCStringNoCopy(0, (const char *)v1, 0x8000100u, kCFAllocatorNull);
  if (!v4) {
    return 0;
  }
  CFStringRef v5 = v4;
  CFURLRef v6 = CFURLCreateWithFileSystemPath(0, v4, kCFURLPOSIXPathStyle, 0);
  CFDictionaryRef v7 = sub_10001097C(v6);
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
    sub_10000F5E0(&cStr, "");
    goto LABEL_169;
  }
  RDString::RDString((RDString *)v80, v1, 1);
  std::string::push_back(v2, 47);
  sub_10000F5E0(&v77, ".SpeechRecognition");
  sub_100011D1C(v80, (const void **)&v67.__r_.__value_.__l.__data_, (uint64_t)&v75);
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
  BOOL v7 = sub_100010F44(&v76);
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
    sub_100011D1C(v80, (const void **)&v67.__r_.__value_.__l.__data_, (uint64_t)&v74);
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
    uint64_t v13 = std::string::append(&v74, v11, v12);
    long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    v75.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v75.__r_.__value_.__l.__data_ = v14;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v13->__r_.__value_.__r.__words[0] = 0;
    BOOL v15 = sub_100010F44(&v75);
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
    uint64_t v19 = v16;
LABEL_39:
    uint64_t v20 = 0;
    while (v19->__r_.__value_.__s.__data_[0] != asc_1000150EF[v20])
    {
      if (++v20 == 2)
      {
        uint64_t v19 = (std::string *)((char *)v19 + 1);
        if (v19 == (std::string *)v18) {
          goto LABEL_60;
        }
        goto LABEL_39;
      }
    }
    if (v19 != (std::string *)v18 && (char *)v19 - (char *)v16 != -1)
    {
      BOOL v21 = (char *)&v67 + HIBYTE(v67.__r_.__value_.__r.__words[2]);
      if ((v67.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        BOOL v21 = (char *)(v67.__r_.__value_.__r.__words[0] + v67.__r_.__value_.__l.__size_);
      }
      std::string::erase(&v67, (char *)v19 - (char *)v16, v21 - (char *)v19);
      sub_100011D1C(v80, (const void **)&v67.__r_.__value_.__l.__data_, (uint64_t)&v73);
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
      float v24 = std::string::append(&v73, v22, v23);
      long long v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
      v74.__r_.__value_.__r.__words[2] = v24->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v74.__r_.__value_.__l.__data_ = v25;
      v24->__r_.__value_.__l.__size_ = 0;
      v24->__r_.__value_.__r.__words[2] = 0;
      v24->__r_.__value_.__r.__words[0] = 0;
      BOOL v26 = sub_100010F44(&v74);
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
  sub_10000F5E0(&v73, "");
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
        id v28 = "es_US";
        goto LABEL_75;
      }
LABEL_73:
      id v28 = "fr_FR";
      goto LABEL_75;
    }
LABEL_72:
    id v28 = "en_US";
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
    id v28 = "de_DE";
LABEL_75:
    std::string::assign(&v73, v28);
  }
LABEL_76:
  std::string::size_type v29 = HIBYTE(v73.__r_.__value_.__r.__words[2]);
  if ((v73.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v29 = v73.__r_.__value_.__l.__size_;
  }
  if (v29)
  {
    sub_100011D1C(v80, (const void **)&v73.__r_.__value_.__l.__data_, (uint64_t)&__s1);
    if ((v79 & 0x80u) == 0) {
      int v30 = (const std::string::value_type *)&v77;
    }
    else {
      int v30 = (const std::string::value_type *)v77;
    }
    if ((v79 & 0x80u) == 0) {
      std::string::size_type v31 = v79;
    }
    else {
      std::string::size_type v31 = v78;
    }
    uint64_t v32 = std::string::append(&__s1, v30, v31);
    long long v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
    __p.__r_.__value_.__r.__words[2] = v32->__r_.__value_.__r.__words[2];
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v33;
    v32->__r_.__value_.__l.__size_ = 0;
    v32->__r_.__value_.__r.__words[2] = 0;
    v32->__r_.__value_.__r.__words[0] = 0;
    BOOL v34 = sub_100010F44(&__p);
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
    int v35 = (const char *)v80;
  }
  else {
    int v35 = (const char *)v80[0];
  }
  CFDictionaryRef v36 = opendir(v35);
  if (!v36)
  {
LABEL_162:
    sub_10000F5E0(&cStr, "");
    goto LABEL_163;
  }
  while (1)
  {
    CFTypeID v37 = readdir(v36);
    if (!v37)
    {
      closedir(v36);
      goto LABEL_162;
    }
    d_name = v37->d_name;
    sub_10000F5E0(&__s1, v37->d_name);
    int64_t v39 = HIBYTE(__s1.__r_.__value_.__r.__words[2]);
    int v40 = SHIBYTE(__s1.__r_.__value_.__r.__words[2]);
    p_s1 = (std::string *)__s1.__r_.__value_.__r.__words[0];
    CFStringRef v42 = (__s1.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &__s1
        : (std::string *)__s1.__r_.__value_.__r.__words[0];
    CFStringRef v43 = (v79 & 0x80u) == 0 ? (void **)&v77 : v77;
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
      v47 = v42;
      while (1)
      {
        int64_t v48 = v39 - v44;
        if (v48 == -1) {
          goto LABEL_159;
        }
        v49 = (char *)memchr(v47, v46, v48 + 1);
        if (!v49) {
          goto LABEL_159;
        }
        unint64_t v50 = v49;
        if (!memcmp(v49, v43, v44)) {
          break;
        }
        v47 = (std::string *)(v50 + 1);
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
            sub_100011F4C();
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
  sub_100011EC4((uint64_t)&v69, v56 + 1);
  if ((v69.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    CFStringRef v57 = &v69;
  }
  else {
    CFStringRef v57 = (std::string *)v69.__r_.__value_.__r.__words[0];
  }
  if (v56)
  {
    if ((v81 & 0x80u) == 0) {
      CFStringRef v58 = v80;
    }
    else {
      CFStringRef v58 = (const void **)v80[0];
    }
    memmove(v57, v58, v56);
  }
  *(_WORD *)((char *)&v57->__r_.__value_.__l.__data_ + v56) = 47;
  id v59 = std::string::append(&v69, d_name);
  long long v60 = *(_OWORD *)&v59->__r_.__value_.__l.__data_;
  v70.__r_.__value_.__r.__words[2] = v59->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v70.__r_.__value_.__l.__data_ = v60;
  v59->__r_.__value_.__l.__size_ = 0;
  v59->__r_.__value_.__r.__words[2] = 0;
  v59->__r_.__value_.__r.__words[0] = 0;
  BOOL v61 = sub_100010F44(&v70);
  if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v70.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v69.__r_.__value_.__l.__data_);
  }
  if (!v61)
  {
    LOBYTE(v4pthread_cond_init(&stru_10001CEC8, 0) = *((unsigned char *)&__s1.__r_.__value_.__s + 23);
    goto LABEL_159;
  }
  closedir(v36);
  std::string::size_type v65 = sub_100011DE8((uint64_t *)&__s1, (char *)&v77, 0);
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

void sub_10001181C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,uint64_t a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43,void *__p,uint64_t a45,int a46,__int16 a47,char a48,char a49)
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
      uint64_t v12 = 0;
      goto LABEL_12;
    }
    CFStringRef Value = (const __CFString *)CFLocaleGetValue(v3, kCFLocaleLanguageCode);
    CFStringRef v7 = (const __CFString *)CFLocaleGetValue(v3, kCFLocaleCountryCode);
    CFStringRef v8 = (const __CFString *)CFLocaleGetValue(v5, kCFLocaleLanguageCode);
    CFStringRef v9 = (const __CFString *)CFLocaleGetValue(v5, kCFLocaleCountryCode);
    if (Value) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10) {
      goto LABEL_8;
    }
    CFStringRef v11 = v9;
    if (CFStringCompare(Value, v8, 0)) {
      goto LABEL_8;
    }
    if (v7) {
      BOOL v14 = v11 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (v14)
    {
      if (!((unint64_t)v7 | (unint64_t)v11)) {
        goto LABEL_22;
      }
    }
    else if (CFEqual(v7, v11))
    {
LABEL_22:
      uint64_t v12 = 1;
      goto LABEL_9;
    }
LABEL_8:
    uint64_t v12 = 0;
LABEL_9:
    CFRelease(v5);
LABEL_12:
    CFRelease(v3);
    return v12;
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
    CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
    if (CStringPtr)
    {
      std::string::assign((std::string *)this, CStringPtr);
    }
    else
    {
      CFIndex Length = CFStringGetLength(theString);
      CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
      std::string::resize((std::string *)this, MaximumSizeForEncoding + 2, 0);
      CFStringRef v9 = (char *)this;
      if (*((char *)this + 23) < 0) {
        CFStringRef v9 = *(char **)this;
      }
      CFStringGetCString(theString, v9, MaximumSizeForEncoding + 1, 0x8000100u);
      BOOL v10 = (const char *)this;
      if (*((char *)this + 23) < 0) {
        BOOL v10 = *(const char **)this;
      }
      size_t v11 = strlen(v10);
      std::string::resize((std::string *)this, v11, 0);
    }
    if (a3) {
      CFRelease(theString);
    }
  }
}

void sub_100011BB4(_Unwind_Exception *exception_object)
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

void sub_100011CA4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

std::string *RDURL::DirName(std::string *this)
{
  id result = (std::string *)std::string::rfind(this, 47, 0xFFFFFFFFFFFFFFFFLL);
  if (result != (std::string *)-1)
  {
    return std::string::erase(this, (std::string::size_type)result, 0xFFFFFFFFFFFFFFFFLL);
  }
  return result;
}

uint64_t sub_100011D1C@<X0>(const void **a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t result = sub_100011EC4(a3, v6 + v5);
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
  BOOL v10 = &v8[v5];
  if (v6)
  {
    if (*((char *)a2 + 23) >= 0) {
      size_t v11 = a2;
    }
    else {
      size_t v11 = *a2;
    }
    uint64_t result = (uint64_t)memmove(v10, v11, v6);
  }
  v10[v6] = 0;
  return result;
}

uint64_t sub_100011DE8(uint64_t *a1, char *a2, unint64_t a3)
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
        size_t v11 = v15;
        if (!memcmp(v15, v6, v7)) {
          goto LABEL_15;
        }
        CFStringRef v8 = v11 + 1;
        int64_t v10 = v9 - (v11 + 1);
      }
      while (v10 >= v7);
    }
    size_t v11 = v9;
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

uint64_t sub_100011EC4(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    sub_10000F694();
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

void sub_100011F4C()
{
}

void sub_100011F64(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100011FC0(exception, a1);
}

void sub_100011FAC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100011FC0(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_100011FF4()
{
  __assert_rtn("EventHandler", "RDBroker.mm", 265, "type == XPC_TYPE_DICTIONARY");
}

void sub_100012020(_xpc_connection_s *a1)
{
  CFStringRef v2 = RXOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = xpc_connection_get_pid(a1);
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "peer(%d) killed me (the bastard!)", (uint8_t *)v3, 8u);
  }
  abort();
}

void sub_1000120A4()
{
  __assert_rtn("brokerd_peer_event_handler", "RDBroker.mm", 761, "type == XPC_TYPE_DICTIONARY");
}

uint64_t AFDeviceHighestLanguageModelCapabilityIdentifier()
{
  return _AFDeviceHighestLanguageModelCapabilityIdentifier();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayContainsValue(theArray, range, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

uint64_t CFCopySearchPathForDirectoriesInDomains()
{
  return _CFCopySearchPathForDirectoriesInDomains();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return _CFLocaleCreate(allocator, localeIdentifier);
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return _CFLocaleGetValue(locale, key);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithStream(allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return _CFReadStreamCreateWithFile(alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return _CFReadStreamOpen(stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return _CFSetCreateMutable(allocator, capacity, callBacks);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return _CFStringCreateExternalRepresentation(alloc, theString, encoding, lossByte);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return _CFStringCreateMutableCopy(alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return _CFStringCreateWithCStringNoCopy(alloc, cStr, encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return _CFStringCreateWithFormatAndArguments(alloc, formatOptions, format, arguments);
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return _CFStringFindAndReplace(theString, stringToFind, replacementString, rangeToSearch, compareOptions);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return _CFStringGetCharacterAtIndex(theString, idx);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return _CFURLCopyFileSystemPath(anURL, pathStyle);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return _CFURLCopyPath(anURL);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return _CFURLCreateCopyAppendingPathComponent(allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

uint64_t RXEngineTypeForLocaleIdentifier()
{
  return _RXEngineTypeForLocaleIdentifier();
}

uint64_t RXGetAssetFallbackLocaleIdentifier()
{
  return _RXGetAssetFallbackLocaleIdentifier();
}

uint64_t RXGetAssetFallbackLocales()
{
  return _RXGetAssetFallbackLocales();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return std::string::find(this, __c, __pos);
}

std::string::size_type std::string::rfind(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return std::string::rfind(this, __c, __pos);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return std::string::erase(this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return std::string::append(this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return std::string::assign(this, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return std::string::basic_string(this, __str, __pos, __n, __a);
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
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int backtrace(void **a1, int a2)
{
  return _backtrace(a1, a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return _backtrace_symbols(a1, a2);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return _pthread_cond_broadcast(a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return _pthread_cond_init(a1, a2);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return _pthread_cond_wait(a1, a2);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

dirent *__cdecl readdir(DIR *a1)
{
  return _readdir(a1);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return _removefile(path, state, flags);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

void uuid_generate(uuid_t out)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_string(xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return _xpc_connection_create(name, targetq);
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return _xpc_connection_get_context(connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

uint64_t xpc_connection_set_instance()
{
  return _xpc_connection_set_instance();
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_array(xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return _xpc_endpoint_create(connection);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_main(xpc_connection_handler_t handler)
{
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

uint64_t xpc_track_activity()
{
  return _xpc_track_activity();
}

id objc_msgSend__downloadStatusDescription(void *a1, const char *a2, ...)
{
  return [a1 _downloadStatusDescription];
}

id objc_msgSend__languagesWithDownloadAttempts(void *a1, const char *a2, ...)
{
  return [a1 _languagesWithDownloadAttempts];
}

id objc_msgSend__sendCallback(void *a1, const char *a2, ...)
{
  return [a1 _sendCallback];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_cancelDownloadSync(void *a1, const char *a2, ...)
{
  return [a1 cancelDownloadSync];
}

id objc_msgSend_catalogDownloadInProgress(void *a1, const char *a2, ...)
{
  return [a1 catalogDownloadInProgress];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_expectedTimeRemaining(void *a1, const char *a2, ...)
{
  return [a1 expectedTimeRemaining];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_getLocalUrl(void *a1, const char *a2, ...)
{
  return [a1 getLocalUrl];
}

id objc_msgSend_installedLanguages(void *a1, const char *a2, ...)
{
  return [a1 installedLanguages];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isStalled(void *a1, const char *a2, ...)
{
  return [a1 isStalled];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_maximumSupportedConfigurationVersion(void *a1, const char *a2, ...)
{
  return [a1 maximumSupportedConfigurationVersion];
}

id objc_msgSend_minimumSupportedConfigurationVersion(void *a1, const char *a2, ...)
{
  return [a1 minimumSupportedConfigurationVersion];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_peersRequestingDownloadProgress(void *a1, const char *a2, ...)
{
  return [a1 peersRequestingDownloadProgress];
}

id objc_msgSend_purgeSync(void *a1, const char *a2, ...)
{
  return [a1 purgeSync];
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return [a1 queryMetaDataSync];
}

id objc_msgSend_refreshState(void *a1, const char *a2, ...)
{
  return [a1 refreshState];
}

id objc_msgSend_requestedLanguagesForDownload(void *a1, const char *a2, ...)
{
  return [a1 requestedLanguagesForDownload];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_sendCallback(void *a1, const char *a2, ...)
{
  return [a1 sendCallback];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_totalExpected(void *a1, const char *a2, ...)
{
  return [a1 totalExpected];
}

id objc_msgSend_totalWritten(void *a1, const char *a2, ...)
{
  return [a1 totalWritten];
}