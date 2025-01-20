id GetLocalizedString(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t vars8;

  v2 = GetBundle();
  v3 = (void *)v2;
  v4 = 0;
  if (a1 && v2)
  {
    v5 = [NSString stringWithUTF8String:a1];
    v4 = [v3 localizedStringForKey:v5 value:0 table:0];
  }
  return v4;
}

id GetBundle()
{
  if (GetBundle_onceToken != -1) {
    dispatch_once(&GetBundle_onceToken, &__block_literal_global_647);
  }
  v0 = (void *)GetBundle_bundle;
  return v0;
}

double RoundFloatToPixels(double a1)
{
  double v2 = *(double *)&_ScreenScale_scale;
  if (*(double *)&_ScreenScale_scale == 0.0)
  {
    v3 = objc_msgSend(MEMORY[0x263F1C920], "mainScreen", *(double *)&_ScreenScale_scale);
    [v3 scale];
    _ScreenScale_scale = v4;

    double v2 = *(double *)&_ScreenScale_scale;
  }
  return round(v2 * a1) / v2;
}

__CFString *escapedStringFromURL(void *a1)
{
  v1 = [a1 absoluteString];
  double v2 = (__CFString *)CFURLCreateStringByAddingPercentEscapes(0, v1, &stru_26F2A9070, @"/:?&=", 0x8000100u);

  return v2;
}

uint64_t __GetBundle_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F086E0]) initWithPath:@"/System/Library/PrivateFrameworks/WebSheet.framework"];
  uint64_t v1 = GetBundle_bundle;
  GetBundle_bundle = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE53D0](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(void *)&encoding);
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE54D8](flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, timeout);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t CPGetDeviceRegionCode()
{
  return MEMORY[0x270F0CD50]();
}

void NSLog(NSString *format, ...)
{
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t SecTrustCopyInfo()
{
  return MEMORY[0x270EFDD18]();
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x270EFDD60](trust, error);
}

OSStatus SecTrustGetTrustResult(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x270EFDD80](trust, result);
}

uint64_t WebThreadCallDelegate()
{
  return MEMORY[0x270F857E0]();
}

uint64_t WebThreadIsCurrent()
{
  return MEMORY[0x270F857E8]();
}

uint64_t WebThreadLock()
{
  return MEMORY[0x270F857F0]();
}

uint64_t WebThreadMakeNSInvocation()
{
  return MEMORY[0x270F857F8]();
}

uint64_t _CFURLResponseGetSSLCertificateContext()
{
  return MEMORY[0x270EE2AB0]();
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}