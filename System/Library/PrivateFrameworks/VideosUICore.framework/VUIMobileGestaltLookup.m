@interface VUIMobileGestaltLookup
+ (BOOL)BOOLValueForKey:(__CFString *)a3;
+ (id)stringValueForKey:(__CFString *)a3;
@end

@implementation VUIMobileGestaltLookup

+ (id)stringValueForKey:(__CFString *)a3
{
  if (a3 && (v3 = (const void *)MGCopyAnswer()) != 0)
  {
    v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFStringGetTypeID())
    {
      v6 = [NSString stringWithString:v4];
    }
    else
    {
      v6 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (BOOL)BOOLValueForKey:(__CFString *)a3
{
  if (!a3) {
    return 0;
  }
  CFBooleanRef v3 = (const __CFBoolean *)MGCopyAnswer();
  if (!v3) {
    return 0;
  }
  CFBooleanRef v4 = v3;
  CFTypeID v5 = CFGetTypeID(v3);
  BOOL v6 = v5 == CFBooleanGetTypeID() && CFBooleanGetValue(v4) != 0;
  CFRelease(v4);
  return v6;
}

@end