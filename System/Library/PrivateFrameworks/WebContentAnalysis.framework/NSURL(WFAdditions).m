@interface NSURL(WFAdditions)
- (__CFString)WF_normalizedRelativePath;
- (uint64_t)WF_hostnameIsIPAddress;
@end

@implementation NSURL(WFAdditions)

- (uint64_t)WF_hostnameIsIPAddress
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263F08B08]), "initWithString:", objc_msgSend(a1, "host"));
  id v5 = 0;
  if (objc_msgSend(v2, "scanCharactersFromSet:intoString:", objc_msgSend(MEMORY[0x263F08708], "characterSetWithCharactersInString:", @".0123456789"), &v5))uint64_t v3 = objc_msgSend(v5, "isEqualToString:", objc_msgSend(a1, "host")); {
  else
  }
    uint64_t v3 = 0;

  return v3;
}

- (__CFString)WF_normalizedRelativePath
{
  v1 = (void *)[a1 relativePath];
  if (!v1) {
    return &stru_26C7AC028;
  }
  v2 = (void *)[v1 lowercaseString];
  for (uint64_t i = [v2 length]; i; uint64_t i = objc_msgSend(v2, "length"))
  {
    uint64_t v4 = i - 1;
    if (!objc_msgSend((id)objc_msgSend(v2, "substringFromIndex:", i - 1), "isEqualToString:", @"/")) {
      break;
    }
    v2 = (void *)[v2 substringToIndex:v4];
  }
  return (__CFString *)v2;
}

@end