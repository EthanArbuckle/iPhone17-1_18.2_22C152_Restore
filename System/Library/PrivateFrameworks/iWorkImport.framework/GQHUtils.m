@interface GQHUtils
+ (__CFString)createHtmlHrefForLinkUri:(__CFString *)a3 state:(id)a4;
@end

@implementation GQHUtils

+ (__CFString)createHtmlHrefForLinkUri:(__CFString *)a3 state:(id)a4
{
  v5 = a3;
  if (CFStringHasPrefix(a3, @"#"))
  {
    CFIndex Length = CFStringGetLength(v5);
    if (Length >= 2)
    {
      v12.length = Length - 1;
      v12.location = 1;
      CFStringRef v7 = CFStringCreateWithSubstring(0, v5, v12);
      v5 = (__CFString *)CFStringCreateWithFormat(0, 0, @"javascript:location.hash='%@';", v7);
      CFRelease(v7);
      return v5;
    }
  }
  if (!CFStringHasPrefix(v5, @"?"))
  {
    CFRetain(v5);
    return v5;
  }
  uint64_t v8 = (uint64_t)[a4 currentSlide];
  if (CFStringCompare(v5, @"?slide=first", 0))
  {
    if (CFEqual(v5, @"?slide=last")) {
      return @"#slideId_last";
    }
    if (CFStringCompare(v5, @"?slide=+1", 0))
    {
      if (CFStringCompare(v5, @"?slide=-1", 0))
      {
        if (CFStringHasPrefix(v5, @"?id="))
        {
          CFIndex v9 = CFStringGetLength(@"?id=");
          v13.length = CFStringGetLength(v5) - v9;
          v13.location = v9;
          CFStringRef v10 = CFStringCreateWithSubstring(0, v5, v13);
          v5 = (__CFString *)CFStringCreateWithFormat(0, 0, @"#%@", v10);
          CFRelease(v10);
          if (v5) {
            return v5;
          }
        }
      }
      else
      {
        uint64_t v8 = (v8 - 1);
      }
    }
    else
    {
      uint64_t v8 = (v8 + 1);
    }
  }
  else
  {
    uint64_t v8 = 1;
  }
  if (v8 == [a4 currentSlide]) {
    return 0;
  }
  return (__CFString *)CFStringCreateWithFormat(0, 0, @"#slideId_%d", v8);
}

@end