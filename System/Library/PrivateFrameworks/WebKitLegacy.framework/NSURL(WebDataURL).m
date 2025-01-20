@interface NSURL(WebDataURL)
+ (uint64_t)_web_uniqueWebDataURL;
@end

@implementation NSURL(WebDataURL)

+ (uint64_t)_web_uniqueWebDataURL
{
  WTF::URL::fakeURLWithRelativePart();
  uint64_t v1 = WTF::URL::operator NSURL *();
  if (!v3) {
    return v1;
  }
  if (*(_DWORD *)v3 != 2)
  {
    *(_DWORD *)v3 -= 2;
    return v1;
  }
  WTF::StringImpl::destroy(v3, v0);
  return v1;
}

@end