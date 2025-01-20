@interface NSUserDefaults(WebNSUserDefaultsExtras)
+ (__CFString)_webkit_preferredLanguageCode;
@end

@implementation NSUserDefaults(WebNSUserDefaultsExtras)

+ (__CFString)_webkit_preferredLanguageCode
{
  WTF::defaultLanguage();
  if (!v3) {
    return &stru_1F3C7DA90;
  }
  uint64_t v1 = WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v3 == 2)
  {
    WTF::StringImpl::destroy(v3, v0);
    return (__CFString *)v1;
  }
  else
  {
    *(_DWORD *)v3 -= 2;
    return (__CFString *)v1;
  }
}

@end