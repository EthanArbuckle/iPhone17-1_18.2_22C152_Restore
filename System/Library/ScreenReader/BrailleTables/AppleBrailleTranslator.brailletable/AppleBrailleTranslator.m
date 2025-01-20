void sub_5ED4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id sub_5EFC()
{
  if (qword_C9F0 != -1) {
    dispatch_once(&qword_C9F0, &stru_8240);
  }
  v0 = (void *)qword_C9E8;

  return v0;
}

void sub_5F50(id a1)
{
  qword_C9E8 = (uint64_t)os_log_create("com.apple.Accessibility", "BRLTranslation.Apple");

  _objc_release_x1();
}

id sub_5F94()
{
  if (qword_CA00 != -1) {
    dispatch_once(&qword_CA00, &stru_8260);
  }
  v0 = (void *)qword_C9F8;

  return v0;
}

void sub_5FE8(id a1)
{
  qword_C9F8 = (uint64_t)os_log_create("com.apple.Accessibility", "BRLTranslation.AppleFormat");

  _objc_release_x1();
}

void sub_602C()
{
  sub_5EF0();
  sub_5ED4(&dword_0, v0, v1, "Failed to read BrailleToRomaji.plist", v2, v3, v4, v5, v6);
}

void sub_6060()
{
  sub_5EF0();
  sub_5ED4(&dword_0, v0, v1, "Failed to read BrailleToNumber.plist", v2, v3, v4, v5, v6);
}

void sub_6094()
{
  sub_5EF0();
  sub_5ED4(&dword_0, v0, v1, "Failed to read BrailleToKana.plist", v2, v3, v4, v5, v6);
}

void sub_60C8()
{
  sub_5EF0();
  sub_5ED4(&dword_0, v0, v1, "Failed to read romajiToBraille.plist", v2, v3, v4, v5, v6);
}

void sub_60FC()
{
  sub_5EF0();
  sub_5ED4(&dword_0, v0, v1, "Failed to read numberToBraille.plist", v2, v3, v4, v5, v6);
}

void sub_6130()
{
  sub_5EF0();
  sub_5ED4(&dword_0, v0, v1, "Failed to read kanaToBraille.plist", v2, v3, v4, v5, v6);
}

void sub_6164()
{
  sub_5EF0();
  sub_5ED4(&dword_0, v0, v1, "Failed to read kataToHira.plist", v2, v3, v4, v5, v6);
}

void sub_6198()
{
  sub_5EF0();
  sub_5ED4(&dword_0, v0, v1, "Failed to read JapaneseNumeralReadings.plist", v2, v3, v4, v5, v6);
}

void sub_61CC()
{
  sub_5EF0();
  sub_5ED4(&dword_0, v0, v1, "Failed to read JapaneseNormalization.plist", v2, v3, v4, v5, v6);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return _CFLocaleCreate(allocator, localeIdentifier);
}

void CFRelease(CFTypeRef cf)
{
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return _CFStringTokenizerAdvanceToNextToken(tokenizer);
}

CFTypeRef CFStringTokenizerCopyCurrentTokenAttribute(CFStringTokenizerRef tokenizer, CFOptionFlags attribute)
{
  return _CFStringTokenizerCopyCurrentTokenAttribute(tokenizer, attribute);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return _CFStringTokenizerCreate(alloc, string, range, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFRange CurrentTokenRange = _CFStringTokenizerGetCurrentTokenRange(tokenizer);
  CFIndex length = CurrentTokenRange.length;
  CFIndex location = CurrentTokenRange.location;
  result.CFIndex length = length;
  result.CFIndex location = location;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
}

uint64_t _CFStringTokenizerGetCurrentTokenPartOfSpeech()
{
  return __CFStringTokenizerGetCurrentTokenPartOfSpeech();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 decimalDigitCharacterSet];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 newlineCharacterSet];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}