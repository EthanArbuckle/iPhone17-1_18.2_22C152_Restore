BOOL SCRCIsUInt32BitSafe(unint64_t a1)
{
  return a1 < 0xFFFFFFFF;
}

BOOL SCRCIsInt32BitSafe(uint64_t a1)
{
  return a1 != (int)a1;
}

void SCRCArgumentParserRunWithClassName(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = MEMORY[0x21D4A0290](0);
  uint64_t v7 = objc_msgSend(objc_alloc(NSClassFromString((NSString *)objc_msgSend([NSString alloc], "initWithUTF8String:", a3))), "initWithArgc:argv:", a1, a2);
  v8 = (void *)_Parser;
  _Parser = v7;

  if ([(id)_Parser parse])
  {
    MEMORY[0x21D4A0280](v6);
    int v9 = _mainProc();
    v10 = (void *)_Parser;
    _Parser = 0;

    exit(v9);
  }
  v11 = (void *)_Parser;
  _Parser = 0;

  MEMORY[0x21D4A0280](v6);
  exit(1);
}

uint64_t _mainProc()
{
  uint64_t v0 = MEMORY[0x21D4A0290](0);
  MEMORY[0x21D4A0280](v0);
  uint64_t v1 = MEMORY[0x21D4A0290](0);
  uint64_t v2 = [(id)_Parser run];
  MEMORY[0x21D4A0280](v1);
  return v2;
}

void SCRCEnableProcessKeepAlive()
{
  if (vproc_swap_integer()) {
    NSLog(&cfstr_VoiceoverCould.isa);
  }
}

id _SCRCArgumentParserShowHelp()
{
  return (id)[(id)_Parser _displayHelp:0];
}

void _consoleUserChanged()
{
  id v0 = [(id)_Parser appName];
  uint64_t v1 = (const char *)[v0 UTF8String];
  pid_t v2 = getpid();
  syslog(3, "%s[%d]: Stopping because login happened\n", v1, v2);

  *(_OWORD *)&msg.msgh_bits = xmmword_21C035E90;
  *(void *)&msg.msgh_voucher_port = 0x100000000;
  if (mach_msg(&msg, 17, 0x18u, 0, 0, 0, 0) == 268435460) {
    mach_msg_destroy(&msg);
  }
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

id SCRCFileHandleForTempFile(void *a1)
{
  uint64_t v1 = _GetTempFile(a1, 1);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    pid_t v2 = v1;
  }
  else {
    pid_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

id _GetTempFile(void *a1, int a2)
{
  id v3 = a1;
  v4 = NSTemporaryDirectory();
  v5 = [v4 stringByAppendingPathComponent:v3];

  uint64_t v6 = [v5 stringByAppendingString:@"XXXXXX"];

  uint64_t v7 = [v6 length];
  unint64_t v8 = 2 * v7;
  int v9 = malloc_type_malloc(2 * v7, 0x100004077774924uLL);
  if (!v9) {
    goto LABEL_12;
  }
  v10 = v9;
  if ([v6 getFileSystemRepresentation:v9 maxLength:v8]) {
    goto LABEL_8;
  }
  free(v10);
  size_t v11 = v8 >= 0x200 ? 4 * v7 : 1024;
  v12 = malloc_type_malloc(v11, 0x100004077774924uLL);
  if (!v12)
  {
LABEL_12:
    v15 = 0;
    goto LABEL_17;
  }
  v10 = v12;
  [v6 getFileSystemRepresentation:v12 maxLength:v11];
LABEL_8:
  uint64_t v13 = 15;
  while (1)
  {
    uint64_t v14 = mkstemp((char *)v10);
    if (v14 != -1) {
      break;
    }
    if (!--v13)
    {
      v15 = 0;
      goto LABEL_16;
    }
  }
  int v16 = v14;
  if (a2)
  {
    v15 = (void *)[objc_alloc(MEMORY[0x263F08840]) initWithFileDescriptor:v14 closeOnDealloc:1];
  }
  else
  {
    v17 = [MEMORY[0x263F08850] defaultManager];
    v15 = [v17 stringWithFileSystemRepresentation:v10 length:strlen((const char *)v10)];
    close(v16);
  }
LABEL_16:
  free(v10);
LABEL_17:

  return v15;
}

id SCRCPathForTempFile(void *a1)
{
  uint64_t v1 = _GetTempFile(a1, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    pid_t v2 = v1;
  }
  else {
    pid_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

UInt8 *SCRCCopyStringToUChar32Array(const __CFString *a1, unint64_t *a2)
{
  *a2 = 0;
  if (!a1) {
    return 0;
  }
  CFIndex Length = CFStringGetLength(a1);
  if (!Length) {
    return 0;
  }
  CFIndex v5 = Length;
  uint64_t v6 = 4 * Length + 4;
  uint64_t v7 = (UInt8 *)malloc_type_malloc(v6, 0xDFD578FDuLL);
  CFIndex usedBufLen = 0;
  if (v7)
  {
    CFStringEncoding v8 = SCRCUTF32Encoding();
    v12.location = 0;
    v12.length = v5;
    CFStringGetBytes(a1, v12, v8, 0, 0, v7, v6, &usedBufLen);
    unint64_t v9 = (unint64_t)usedBufLen >> 2;
  }
  else
  {
    unint64_t v9 = 0;
  }
  *a2 = v9;
  return v7;
}

__CFString *_CopyUnicodeDescriptionStringForCharacter(UChar32 a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v8 = 0;
  if (u_charName(a1, U_EXTENDED_CHAR_NAME, buffer, 500, (UErrorCode *)&v8) < 1 || v8 != 0) {
    return 0;
  }
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v3 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], buffer, 0x8000100u);
  if (!v3) {
    return 0;
  }
  CFStringRef v4 = v3;
  v11.location = 0;
  v11.length = 1;
  if (CFStringCompareWithOptions(v3, @"<", v11, 0))
  {
    MutableCopy = CFStringCreateMutableCopy(v2, 0, v4);
    CFLocaleRef System = CFLocaleGetSystem();
    CFStringLowercase(MutableCopy, System);
  }
  else
  {
    MutableCopy = 0;
  }
  CFRelease(v4);
  return MutableCopy;
}

UInt8 *SCRCCopyStringToUniCharArray(const __CFString *a1, unint64_t *a2)
{
  *a2 = 0;
  if (!a1) {
    return 0;
  }
  CFIndex Length = CFStringGetLength(a1);
  if (!Length) {
    return 0;
  }
  CFIndex v5 = Length;
  uint64_t v6 = (4 * Length) | 2;
  uint64_t v7 = (UInt8 *)malloc_type_malloc(v6, 0xA346DC12uLL);
  CFIndex usedBufLen = 0;
  if (v7)
  {
    CFStringEncoding v8 = SCRCUTF16Encoding();
    v12.location = 0;
    v12.length = v5;
    CFStringGetBytes(a1, v12, v8, 0, 0, v7, v6, &usedBufLen);
    unint64_t v9 = (unint64_t)usedBufLen >> 1;
  }
  else
  {
    unint64_t v9 = 0;
  }
  *a2 = v9;
  return v7;
}

id SCRCDeepMutableCopyClasses()
{
  id v0 = (void *)_SCRCDeepMutableCopyClassesSet;
  if (!_SCRCDeepMutableCopyClassesSet)
  {
    id v1 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v2 = objc_opt_class();
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_msgSend(v1, "initWithObjects:", v2, v3, objc_opt_class(), 0);
    CFIndex v5 = (void *)_SCRCDeepMutableCopyClassesSet;
    _SCRCDeepMutableCopyClassesSet = v4;

    id v0 = (void *)_SCRCDeepMutableCopyClassesSet;
  }
  return v0;
}

uint64_t SCRCGestureStateToString()
{
  return 0;
}

void sub_21C015CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SCRCLogInitializeWithKeys(void *a1)
{
  _SCRCSetLogKeyArray(a1);
  return _SCRCLogInitializeCommonMasks();
}

void SCRCDebugPrint(void *a1)
{
  id v1 = a1;
  if (SCRCLogVoiceOver_onceToken != -1) {
    dispatch_once(&SCRCLogVoiceOver_onceToken, &__block_literal_global_1);
  }
  uint64_t v2 = SCRCLogVoiceOver_Log;
  if (os_log_type_enabled((os_log_t)SCRCLogVoiceOver_Log, OS_LOG_TYPE_DEBUG)) {
    SCRCDebugPrint_cold_1((uint64_t)v1, v2);
  }
}

void SCRCDebugPrintToFile(void *a1, void *a2)
{
  id v10 = a2;
  id v3 = [a1 stringByExpandingTildeInPath];
  uint64_t v4 = (const char *)[v3 UTF8String];

  CFIndex v5 = fopen(v4, "at");
  if (v5 || (CFIndex v5 = fopen(v4, "wt")) != 0)
  {
    uint64_t v6 = [MEMORY[0x263EFF910] date];
    id v7 = objc_alloc_init(MEMORY[0x263F08790]);
    [v7 setDateFormat:@"MM/dd/yy HH:mm:ss.SSS"];
    CFStringEncoding v8 = [v7 stringFromDate:v6];
    id v9 = (id) [[NSString alloc] initWithFormat:@"[ %@ ] %@", v8, v10];
    fprintf(v5, "%s\n", (const char *)[v9 UTF8String]);
    fclose(v5);
  }
}

uint64_t SCRCAddInformationToCrashTracerLog(void *a1)
{
  uint64_t result = [a1 UTF8String];
  qword_267C73AA0 = result;
  return result;
}

uint64_t __SCRCLogVoiceOver_block_invoke()
{
  SCRCLogVoiceOver_Log = (uint64_t)os_log_create("com.apple.accessibility", "VoiceOver");
  return MEMORY[0x270F9A758]();
}

uint64_t _SCRCSetLogKeyArray(void *a1)
{
  _SCRCLogKeyArray = [a1 copy];
  return MEMORY[0x270F9A758]();
}

uint64_t SCRCLogMaskForKey(void *a1)
{
  id v1 = a1;
  if ([(id)_SCRCLogKeyArray containsObject:v1])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 hasPrefix:@"SCRCLogMask"])
  {
    id v3 = [v1 substringFromIndex:11];
    uint64_t v2 = [(id)_SCRCLogKeyArray containsObject:v3];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t _SCRCLogInitializeCommonMasks()
{
  uint64_t result = [(id)_SCRCLogKeyArray count];
  if (result)
  {
    SCRCLogMaskAppleScript = SCRCLogMaskForKey(@"SCRCLogMaskAppleScript");
    SCRCLogMaskBraille = SCRCLogMaskForKey(@"SCRCLogMaskBraille");
    SCRCLogMaskBrailleAnnounce = SCRCLogMaskForKey(@"SCRCLogMaskBrailleAnnounce");
    SCRCLogMaskBrailleVariant = SCRCLogMaskForKey(@"SCRCLogMaskBrailleVariant");
    SCRCLogMaskBusySignal = SCRCLogMaskForKey(@"SCRCLogMaskBusySignal");
    SCRCLogMaskConfiguration = SCRCLogMaskForKey(@"SCRCLogMaskConfiguration");
    SCRCLogMaskElement = SCRCLogMaskForKey(@"SCRCLogMaskElement");
    SCRCLogMaskElementHistory = SCRCLogMaskForKey(@"SCRCLogMaskElementHistory");
    SCRCLogMaskElementRestoration = SCRCLogMaskForKey(@"SCRCLogMaskElementRestoration");
    SCRCLogMaskError = SCRCLogMaskForKey(@"SCRCLogMaskError");
    SCRCLogMaskEvent = SCRCLogMaskForKey(@"SCRCLogMaskEvent");
    SCRCLogMaskFindText = SCRCLogMaskForKey(@"SCRCLogMaskFindText");
    SCRCLogMaskGuide = SCRCLogMaskForKey(@"SCRCLogMaskGuide");
    SCRCLogMaskHotSpot = SCRCLogMaskForKey(@"SCRCLogMaskHotSpot");
    SCRCLogMaskInvalidElements = SCRCLogMaskForKey(@"SCRCLogMaskInvalidElements");
    SCRCLogMaskKeyboard = SCRCLogMaskForKey(@"SCRCLogMaskKeyboard");
    SCRCLogMaskKeyboardFocus = SCRCLogMaskForKey(@"SCRCLogMaskKeyboardFocus");
    SCRCLogMaskKeyEcho = SCRCLogMaskForKey(@"SCRCLogMaskKeyEcho");
    SCRCLogMaskKeyNames = SCRCLogMaskForKey(@"SCRCLogMaskKeyNames");
    SCRCLogMaskLocalization = SCRCLogMaskForKey(@"SCRCLogMaskLocalization");
    SCRCLogMaskMenu = SCRCLogMaskForKey(@"SCRCLogMaskMenu");
    SCRCLogMaskObserverDispatches = SCRCLogMaskForKey(@"SCRCLogMaskObserverDispatches");
    SCRCLogMaskObserverRegistrations = SCRCLogMaskForKey(@"SCRCLogMaskObserverRegistrations");
    SCRCLogMaskOutput = SCRCLogMaskForKey(@"SCRCLogMaskOutput");
    SCRCLogMaskOutputCompact = SCRCLogMaskForKey(@"SCRCLogMaskOutputCompact");
    SCRCLogMaskOutputCompactWithBraille = SCRCLogMaskForKey(@"SCRCLogMaskOutputCompactWithBraille");
    SCRCLogMaskOutputRequest = SCRCLogMaskForKey(@"SCRCLogMaskOutputRequest");
    SCRCLogMaskSpeechArbitration = SCRCLogMaskForKey(@"SCRCLogMaskSpeechArbitration");
    SCRCLogMaskSpeechMessages = SCRCLogMaskForKey(@"SCRCLogMaskSpeechMessages");
    SCRCLogMaskSpeechSynthesisDaemonStatus = SCRCLogMaskForKey(@"SCRCLogMaskSpeechSynthesisDaemonStatus");
    SCRCLogMaskTextAttributesManager = SCRCLogMaskForKey(@"SCRCLogMaskTextAttributesManager");
    SCRCLogMaskTextDisplay = SCRCLogMaskForKey(@"SCRCLogMaskTextDisplay");
    SCRCLogMaskThread = SCRCLogMaskForKey(@"SCRCLogMaskThread");
    SCRCLogMaskUIElement = SCRCLogMaskForKey(@"SCRCLogMaskUIElement");
    SCRCLogMaskUIElementErrors = SCRCLogMaskForKey(@"SCRCLogMaskUIElementErrors");
    SCRCLogMaskUserDefaults = SCRCLogMaskForKey(@"SCRCLogMaskUserDefaults");
    SCRCLogMaskUserDefaultsSynching = SCRCLogMaskForKey(@"SCRCLogMaskUserDefaultsSynching");
    SCRCLogMaskVoiceOverCursor = SCRCLogMaskForKey(@"SCRCLogMaskVoiceOverCursor");
    SCRCLogMaskWebGroups = SCRCLogMaskForKey(@"SCRCLogMaskWebGroups");
    SCRCLogMaskWebText = SCRCLogMaskForKey(@"SCRCLogMaskWebText");
    SCRCLogMaskWindow = SCRCLogMaskForKey(@"SCRCLogMaskWindow");
    uint64_t result = SCRCLogMaskForKey(@"SCRCLogMaskWorkspace");
    SCRCLogMaskWorkspace = result;
  }
  return result;
}

uint64_t _SCRCMathUpdateAverage(uint64_t result, unsigned int a2, uint64_t a3, double a4)
{
  *(double *)(result + 432) = a4;
  double v4 = *(double *)(result + 416) + a4;
  *(double *)(result + 416) = v4;
  unsigned int v5 = *(_DWORD *)result + 1;
  *(_DWORD *)uint64_t result = v5;
  if (a2 >= 0x32) {
    unsigned int v6 = 50;
  }
  else {
    unsigned int v6 = a2;
  }
  uint64_t v7 = *(int *)(result + 408);
  if (v5 > v6)
  {
    *(double *)(result + 416) = v4 - *(double *)(result + 8 * v7 + 8);
    *(_DWORD *)uint64_t result = v6;
    unsigned int v5 = v6;
  }
  *(double *)(result + 8 * v7 + 8) = a4;
  if (v7 + 1 == v6) {
    int v8 = 0;
  }
  else {
    int v8 = v7 + 1;
  }
  *(_DWORD *)(result + 408) = v8;
  if (a3 == 1)
  {
    if (v8 >= 2) {
      a4 = (float)((int)(a4 + 360.0 + (double)((int)(*(double *)(result + 424) - a4 + 180.0 + 360.0) % 360 - 180) * 0.5)
    }
                 % 360);
  }
  else
  {
    if (a3) {
      return result;
    }
    a4 = *(double *)(result + 416) / (double)v5;
  }
  *(double *)(result + 424) = a4;
  return result;
}

uint64_t SCRCMathUpdateAverage(uint64_t a1, unsigned int a2, double a3)
{
  return _SCRCMathUpdateAverage(a1, a2, 0, a3);
}

uint64_t SCRCMathUpdateAngleAverage(uint64_t a1, unsigned int a2, double a3)
{
  return _SCRCMathUpdateAverage(a1, a2, 1, a3);
}

double SCRCMathGetAverage(uint64_t a1)
{
  return *(double *)(a1 + 424);
}

double SCRCMathClearAverage(uint64_t a1)
{
  *(void *)(a1 + 432) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 400) = 0u;
  *(_OWORD *)(a1 + 416) = 0u;
  *(_OWORD *)(a1 + 368) = 0u;
  *(_OWORD *)(a1 + 384) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

double SCRCMathGetDistanceBetweenPoints(double a1, double a2, double a3, double a4)
{
  return fabs(hypot(a1 - a3, a2 - a4));
}

void SCRCMathGetVectorAndDistanceForPoints(double *a1, long double *a2, double a3, double a4, double a5, double a6)
{
  double v9 = a3 - a5;
  double v10 = vabdd_f64(a3, a5);
  double v11 = vabdd_f64(a4, a6);
  *a2 = hypot(v10, v11);
  if (v9 == 0.0) {
    double v12 = 90.0;
  }
  else {
    double v12 = atan(v11 / v10) * 57.2957795;
  }
  double v13 = a4 - a6;
  if (v9 >= 0.0)
  {
    if (v13 >= 0.0) {
      goto LABEL_11;
    }
    double v12 = 90.0 - v12;
    double v14 = 270.0;
  }
  else if (v13 <= 0.0)
  {
    double v14 = 180.0;
  }
  else
  {
    double v14 = 90.0;
    double v12 = 90.0 - v12;
  }
  double v12 = v12 + v14;
LABEL_11:
  double v15 = *a1;
  double v16 = v12 + floor(*a1 / 360.0) * 360.0;
  *a1 = v16;
  if (v12 <= 270.0)
  {
    if (v12 >= 90.0) {
      return;
    }
    if (v15 <= 180.0 || v15 >= 360.0)
    {
      if (v15 > 0.0) {
        return;
      }
    }
    else
    {
      double v12 = v16 + 360.0;
    }
    goto LABEL_23;
  }
  if (v15 > 0.0 && v15 < 180.0)
  {
    double v12 = v12 + -360.0;
LABEL_23:
    *a1 = v12;
    return;
  }
  if (v15 > 360.0 || v15 == 0.0) {
    goto LABEL_23;
  }
}

BOOL SCRCFloatAlmostEqual(float a1, float a2)
{
  return vabds_f32(a1, a2) <= 0.00000011921;
}

BOOL SCRCDoubleAlmostEqual(double a1, double a2)
{
  return vabdd_f64(a1, a2) <= 2.22044605e-16;
}

BOOL SCRCCGFloatAlmostEqual(double a1, double a2)
{
  return vabdd_f64(a1, a2) <= 2.22044605e-16;
}

uint64_t SCRCIsConsoleSessionEnabled()
{
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x2020000000;
  id v0 = (uint64_t (*)(void))getCGSSessionCopyCurrentSessionPropertiesSymbolLoc_ptr;
  double v12 = getCGSSessionCopyCurrentSessionPropertiesSymbolLoc_ptr;
  if (!getCGSSessionCopyCurrentSessionPropertiesSymbolLoc_ptr)
  {
    id v1 = (void *)CoreGraphicsLibrary();
    v10[3] = (uint64_t)dlsym(v1, "CGSSessionCopyCurrentSessionProperties");
    getCGSSessionCopyCurrentSessionPropertiesSymbolLoc_ptr = (_UNKNOWN *)v10[3];
    id v0 = (uint64_t (*)(void))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v0) {
    SCRCIsConsoleSessionEnabled_cold_1();
  }
  uint64_t v2 = v0();
  if (!v2) {
    return 1;
  }
  CFDictionaryRef v3 = (const __CFDictionary *)v2;
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x2020000000;
  double v4 = (const void **)getkCGSSessionOnConsoleKeySymbolLoc_ptr;
  double v12 = (void *)getkCGSSessionOnConsoleKeySymbolLoc_ptr;
  if (!getkCGSSessionOnConsoleKeySymbolLoc_ptr)
  {
    unsigned int v5 = (void *)CoreGraphicsLibrary();
    v10[3] = (uint64_t)dlsym(v5, "kCGSSessionOnConsoleKey");
    getkCGSSessionOnConsoleKeySymbolLoc_ptr = v10[3];
    double v4 = (const void **)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v4) {
    SCRCIsConsoleSessionEnabled_cold_2();
  }
  CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(v3, *v4);
  if (Value) {
    BOOL v7 = CFBooleanGetValue(Value) != 0;
  }
  else {
    BOOL v7 = 1;
  }
  CFRelease(v3);
  return v7;
}

void sub_21C0250D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getCGSSessionCopyCurrentSessionPropertiesSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreGraphicsLibrary();
  double result = dlsym(v2, "CGSSessionCopyCurrentSessionProperties");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getCGSSessionCopyCurrentSessionPropertiesSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t CoreGraphicsLibrary()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!CoreGraphicsLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = __CoreGraphicsLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_2643D71C0;
    uint64_t v4 = 0;
    CoreGraphicsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = CoreGraphicsLibraryCore_frameworkLibrary;
  if (!CoreGraphicsLibraryCore_frameworkLibrary) {
    CoreGraphicsLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __CoreGraphicsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreGraphicsLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getkCGSSessionOnConsoleKeySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)CoreGraphicsLibrary();
  uint64_t result = dlsym(v2, "kCGSSessionOnConsoleKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCGSSessionOnConsoleKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id SCRCStringForVariableArray(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [MEMORY[0x263F089D8] string];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v5, "length", (void)v13)) {
          [v5 appendString:v3];
        }
        [v5 appendString:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

id SCRCAttributedStringForVariables(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = a2;
  id v12 = a3;
  long long v13 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:&stru_26CC25790];
  if ([v12 length]) {
    [v13 appendAttributedString:v12];
  }
  objc_opt_class();
  v19 = (id *)&a9;
  if (a1 >= 2)
  {
    uint64_t v14 = a1 - 1;
    do
    {
      long long v15 = v19++;
      id v16 = *v15;
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v16 length])
      {
        if ([v13 length])
        {
          v17 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v11];
          [v13 appendAttributedString:v17];
        }
        [v13 appendAttributedString:v16];
      }

      --v14;
    }
    while (v14);
  }

  return v13;
}

id SCRCStringForVariables(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = a2;
  id v12 = a3;
  long long v13 = [MEMORY[0x263F089D8] string];
  if ([v12 length]) {
    [v13 appendString:v12];
  }
  objc_opt_class();
  uint64_t v18 = (id *)&a9;
  if (a1 >= 2)
  {
    uint64_t v14 = a1 - 1;
    do
    {
      long long v15 = v18++;
      id v16 = *v15;
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v16 length])
      {
        if ([v13 length]) {
          [v13 appendString:v11];
        }
        [v13 appendString:v16];
      }

      --v14;
    }
    while (v14);
  }

  return v13;
}

uint64_t SCRCUTF32Encoding()
{
  return 469762304;
}

uint64_t SCRCUTF16Encoding()
{
  return 335544576;
}

CFIndex _findMatchingParen(CFStringRef theString, uint64_t a2, CFIndex idx, CFIndex a4)
{
  if (idx < a4)
  {
    CFIndex v5 = idx;
    while (1)
    {
      int CharacterAtIndex = CFStringGetCharacterAtIndex(theString, v5);
      if (CharacterAtIndex == 41) {
        break;
      }
      if (CharacterAtIndex == 40)
      {
        uint64_t v9 = 1;
LABEL_10:
        a2 += v9;
      }
      if (++v5 >= a4) {
        return -1;
      }
    }
    if (a2 == 1) {
      return v5;
    }
    uint64_t v9 = -1;
    goto LABEL_10;
  }
  return -1;
}

void sub_21C0276C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C027948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *SCRCFormattedString(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a1;
  id v11 = a2;
  v18[1] = &a9;
  id v12 = [NSString alloc];
  long long v13 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  v18[0] = 0;
  uint64_t v14 = (void *)[v12 initWithValidatedFormat:v10 validFormatSpecifiers:v11 locale:v13 arguments:&a9 error:v18];
  id v15 = v18[0];

  if (v15)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      SCRCFormattedString_cold_1((uint64_t)v15, (uint64_t)v10, (uint64_t)v11);
    }
    id v16 = &stru_26CC25790;
  }
  else
  {
    id v16 = v14;
  }

  return v16;
}

void _handlerMainThread(uint64_t a1, void *a2)
{
  MEMORY[0x21D4A0290](0);
  [a2 _dispatchMainThread];
  JUMPOUT(0x21D4A0280);
}

void *_timerRetain(void *cf)
{
  if (cf) {
    CFRetain(cf);
  }
  [cf _createdTimer];
  return cf;
}

void _timerRelease(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

void _handlerSCRCThread(uint64_t a1, void *a2)
{
  MEMORY[0x21D4A0290](0);
  [a2 _dispatchSCRCThread];
  JUMPOUT(0x21D4A0280);
}

void _handler(uint64_t a1, void *a2)
{
  MEMORY[0x21D4A0290](0);
  [a2 _dispatch];
  JUMPOUT(0x21D4A0280);
}

void sub_21C02A4E4(_Unwind_Exception *a1)
{
}

void sub_21C02A504(void *a1)
{
}

void sub_21C02AA18()
{
}

void sub_21C02AA78()
{
}

void _handler_0(void *a1)
{
  MEMORY[0x21D4A0290](0);
  [a1 _processQueue];
  JUMPOUT(0x21D4A0280);
}

void sub_21C02B654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

id SCRCPerformSelector(void *a1, const char *a2)
{
  if (a2)
  {
    id v3 = [a1 a2];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

void *___appendInfoToRecentTaskBuffer_block_invoke()
{
  uint64_t result = malloc_type_calloc(1uLL, 0x267uLL, 0xDACF183CuLL);
  qmemcpy(result, "Recent tasks -\n", 15);
  _appendInfoToRecentTaskBuffer__recentTaskBuffer = (uint64_t)result + 15;
  return result;
}

id SCRCLinkRelationshipStringForType(void *a1)
{
  uint64_t v1 = SCRCLinkRelationshipStringForType_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&SCRCLinkRelationshipStringForType_onceToken, &__block_literal_global_9);
  }
  id v3 = [(id)SCRCLinkRelationshipStringForType_map objectForKeyedSubscript:v2];

  return v3;
}

void __SCRCLinkRelationshipStringForType_block_invoke()
{
  v24[21] = *MEMORY[0x263EF8340];
  v23[0] = @"ar";
  v22 = [MEMORY[0x263F086E0] localizedCoreStringForKey:@"link.rel.augmentedreality"];
  v24[0] = v22;
  v23[1] = @"archives";
  v21 = [MEMORY[0x263F086E0] localizedCoreStringForKey:@"link.rel.archives"];
  v24[1] = v21;
  v23[2] = @"author";
  v20 = [MEMORY[0x263F086E0] localizedCoreStringForKey:@"link.rel.author"];
  v24[2] = v20;
  v23[3] = @"bookmark";
  v19 = [MEMORY[0x263F086E0] localizedCoreStringForKey:@"link.rel.bookmark"];
  v24[3] = v19;
  v23[4] = @"canonical";
  uint64_t v18 = [MEMORY[0x263F086E0] localizedCoreStringForKey:@"link.rel.canonical"];
  v24[4] = v18;
  v23[5] = @"chapter";
  v17 = [MEMORY[0x263F086E0] localizedCoreStringForKey:@"link.rel.chapter"];
  v24[5] = v17;
  v23[6] = @"contents";
  id v16 = [MEMORY[0x263F086E0] localizedCoreStringForKey:@"link.rel.contents"];
  v24[6] = v16;
  v23[7] = @"first";
  id v15 = [MEMORY[0x263F086E0] localizedCoreStringForKey:@"link.rel.first"];
  v24[7] = v15;
  v23[8] = @"glossary";
  uint64_t v14 = [MEMORY[0x263F086E0] localizedCoreStringForKey:@"link.rel.glossary"];
  v24[8] = v14;
  v23[9] = @"help";
  long long v13 = [MEMORY[0x263F086E0] localizedCoreStringForKey:@"link.rel.help"];
  v24[9] = v13;
  v23[10] = @"index";
  id v12 = [MEMORY[0x263F086E0] localizedCoreStringForKey:@"link.rel.index"];
  v24[10] = v12;
  v23[11] = @"license";
  uint64_t v0 = [MEMORY[0x263F086E0] localizedCoreStringForKey:@"link.rel.license"];
  v24[11] = v0;
  v23[12] = @"next";
  uint64_t v1 = [MEMORY[0x263F086E0] localizedCoreStringForKey:@"link.rel.next"];
  v24[12] = v1;
  v23[13] = @"prev";
  id v2 = [MEMORY[0x263F086E0] localizedCoreStringForKey:@"link.rel.previous"];
  v24[13] = v2;
  v23[14] = @"search";
  id v3 = [MEMORY[0x263F086E0] localizedCoreStringForKey:@"link.rel.search"];
  v24[14] = v3;
  v23[15] = @"section";
  id v4 = [MEMORY[0x263F086E0] localizedCoreStringForKey:@"link.rel.section"];
  v24[15] = v4;
  v23[16] = @"sidebar";
  CFIndex v5 = [MEMORY[0x263F086E0] localizedCoreStringForKey:@"link.rel.sidebar"];
  v24[16] = v5;
  v23[17] = @"start";
  id v6 = [MEMORY[0x263F086E0] localizedCoreStringForKey:@"link.rel.start"];
  v24[17] = v6;
  v23[18] = @"subsection";
  uint64_t v7 = [MEMORY[0x263F086E0] localizedCoreStringForKey:@"link.rel.subsection"];
  v24[18] = v7;
  v23[19] = @"toc";
  uint64_t v8 = [MEMORY[0x263F086E0] localizedCoreStringForKey:@"link.rel.toc"];
  v24[19] = v8;
  v23[20] = @"up";
  uint64_t v9 = [MEMORY[0x263F086E0] localizedCoreStringForKey:@"link.rel.up"];
  v24[20] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:21];
  id v11 = (void *)SCRCLinkRelationshipStringForType_map;
  SCRCLinkRelationshipStringForType_map = v10;
}

void SCRCDebugPrint_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21C00A000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

void SCRCIsConsoleSessionEnabled_cold_1()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"CFDictionaryRef soft_CGSSessionCopyCurrentSessionProperties(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SCRCSessionUtilities.m", 16, @"%s", dlerror());

  __break(1u);
}

void SCRCIsConsoleSessionEnabled_cold_2()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"CFStringRef getkCGSSessionOnConsoleKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SCRCSessionUtilities.m", 14, @"%s", dlerror());

  __break(1u);
}

void CoreGraphicsLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *CoreGraphicsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SCRCSessionUtilities.m", 13, @"%s", *a1);

  __break(1u);
}

void SCRCFormattedString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 138412802;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  __int16 v7 = 2112;
  uint64_t v8 = a3;
  _os_log_fault_impl(&dword_21C00A000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Error creating string: %@ [%@/%@]", (uint8_t *)&v3, 0x20u);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE42E8](theArray, range.location, range.length, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE4338](theArray, range.location, range.length, value);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
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

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x270EE4AC0]();
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

CFAbsoluteTime CFRunLoopGetNextTimerFireDate(CFRunLoopRef rl, CFRunLoopMode mode)
{
  MEMORY[0x270EE4E70](rl, mode);
  return result;
}

uint64_t CFRunLoopRunSpecific()
{
  return MEMORY[0x270EE4ED8]();
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4EE0](allocator, order, context);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x270EE4F00](allocator, flags, order, callout, context, fireDate, interval);
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
}

void CFRunLoopTimerSetNextFireDate(CFRunLoopTimerRef timer, CFAbsoluteTime fireDate)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5058](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
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

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x270EE5160](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x270EE5190](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFRange CFStringGetRangeOfComposedCharactersAtIndex(CFStringRef theString, CFIndex theIndex)
{
  CFIndex v2 = MEMORY[0x270EE5200](theString, theIndex);
  result.length = v3;
  result.location = v2;
  return result;
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextRelease(CGContextRef c)
{
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x270EE7268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSPopAutoreleasePool()
{
  return MEMORY[0x270EF2B90]();
}

uint64_t NSPushAutoreleasePool()
{
  return MEMORY[0x270EF2BA0]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x270EF2BB8]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x270EF2C30]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x270F05508](allocator, name, callout, context);
}

CFRunLoopSourceRef SCDynamicStoreCreateRunLoopSource(CFAllocatorRef allocator, SCDynamicStoreRef store, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270F05510](allocator, store, order);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x270F05560](store, keys, patterns);
}

int SCError(void)
{
  return MEMORY[0x270F05570]();
}

const char *__cdecl SCErrorString(int status)
{
  return (const char *)MEMORY[0x270F05578](*(void *)&status);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

double __exp10(double a1)
{
  MEMORY[0x270ED7DC8](a1);
  return result;
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

long double atan(long double __x)
{
  MEMORY[0x270ED86A0](__x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x270F9A480](cls);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x270ED9E58](__x, __y);
  return result;
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x270EDA190](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

int mkstemp(char *a1)
{
  return MEMORY[0x270EDA560](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return MEMORY[0x270EDAEE8](a1, a2, a3);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return MEMORY[0x270EDB040](a1, *(void *)&a2, a3);
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x270F9AAE0](sel);
}

void srand(unsigned int a1)
{
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

void syslog(int a1, const char *a2, ...)
{
}

int32_t u_charName(UChar32 code, UCharNameChoice nameChoice, char *buffer, int32_t bufferLength, UErrorCode *pErrorCode)
{
  return MEMORY[0x270F994E0](*(void *)&code, *(void *)&nameChoice, buffer, *(void *)&bufferLength, pErrorCode);
}

int32_t u_strlen(const UChar *s)
{
  return MEMORY[0x270F995C0](s);
}

UChar *__cdecl u_uastrcpy(UChar *dst, const char *src)
{
  return (UChar *)MEMORY[0x270F995E8](dst, src);
}

uint64_t ubrk_close()
{
  return MEMORY[0x270F99610]();
}

uint64_t ubrk_first()
{
  return MEMORY[0x270F99620]();
}

uint64_t ubrk_last()
{
  return MEMORY[0x270F99640]();
}

uint64_t ubrk_next()
{
  return MEMORY[0x270F99648]();
}

uint64_t ubrk_open()
{
  return MEMORY[0x270F99650]();
}

uint64_t ubrk_previous()
{
  return MEMORY[0x270F99660]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

uint64_t vproc_swap_integer()
{
  return MEMORY[0x270EDBB08]();
}