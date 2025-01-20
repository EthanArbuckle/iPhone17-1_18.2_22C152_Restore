uint64_t CFPhoneNumberCreate()
{
  return _CFPhoneNumberCreate();
}

uint64_t CFPhoneNumberCreateString()
{
  return _CFPhoneNumberCreateString();
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return _CFStringCreateWithCStringNoCopy(alloc, cStr, encoding, contentsDeallocator);
}

uint64_t PNCopyBestGuessCountryCodeForNumber()
{
  return _PNCopyBestGuessCountryCodeForNumber();
}

uint64_t PNCopyBestGuessNormalizedNumberForCountry()
{
  return _PNCopyBestGuessNormalizedNumberForCountry();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}