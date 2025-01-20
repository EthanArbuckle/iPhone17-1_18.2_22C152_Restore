@interface PKLocaleIs24HourMode
@end

@implementation PKLocaleIs24HourMode

CFStringRef __PKLocaleIs24HourMode_block_invoke_2(uint64_t a1)
{
  if (PKLocaleIs24HourMode_todayFormatter)
  {
    char v2 = [*(id *)(a1 + 32) isEqual:CFDateFormatterGetLocale((CFDateFormatterRef)PKLocaleIs24HourMode_todayFormatter)];
    v3 = (__CFDateFormatter *)PKLocaleIs24HourMode_todayFormatter;
    if (v2) {
      goto LABEL_6;
    }
    if (PKLocaleIs24HourMode_todayFormatter) {
      CFRelease((CFTypeRef)PKLocaleIs24HourMode_todayFormatter);
    }
  }
  v3 = CFDateFormatterCreate(0, *(CFLocaleRef *)(a1 + 32), kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);
  PKLocaleIs24HourMode_todayFormatter = (uint64_t)v3;
LABEL_6:
  CFStringRef result = CFDateFormatterGetFormat(v3);
  if (result)
  {
    CFStringRef v5 = result;
    CFStringRef result = (const __CFString *)CFStringFind(result, @"H", 0).location;
    if (result == (const __CFString *)-1)
    {
      CFStringRef result = (const __CFString *)CFStringFind(v5, @"k", 0).location;
      BOOL v6 = result != (const __CFString *)-1;
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  return result;
}

@end