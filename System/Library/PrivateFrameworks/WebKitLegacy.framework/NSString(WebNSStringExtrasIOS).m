@interface NSString(WebNSStringExtrasIOS)
- (uint64_t)_web_bestURLForUserTypedString;
- (uint64_t)_web_possibleURLPrefixesForUserTypedString;
- (uint64_t)_web_possibleURLsForUserTypedString;
- (void)_web_possibleURLsForForUserTypedString:()WebNSStringExtrasIOS;
@end

@implementation NSString(WebNSStringExtrasIOS)

- (void)_web_possibleURLsForForUserTypedString:()WebNSStringExtrasIOS
{
  v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  v6 = (__CFString *)[MEMORY[0x1E4F28E78] stringWithString:a1];
  CFStringTrimWhitespace(v6);
  v19.length = [(__CFString *)v6 length];
  v19.location = 0;
  CFStringFindAndReplace(v6, @"\n", &stru_1F3C7DA90, v19, 0);
  v20.length = [(__CFString *)v6 length];
  v20.location = 0;
  CFStringFindAndReplace(v6, @"\r", &stru_1F3C7DA90, v20, 0);
  if (![(__CFString *)v6 length]) {
    return v5;
  }
  if ([(__CFString *)v6 characterAtIndex:0] != 47
    && [(__CFString *)v6 characterAtIndex:0] != 126)
  {
    unint64_t v9 = [(__CFString *)v6 rangeOfString:@":"];
    unint64_t v10 = [(__CFString *)v6 rangeOfString:@"/"];
    unint64_t v11 = [(__CFString *)v6 rangeOfString:@"."];
    unint64_t v12 = [(__CFString *)v6 rangeOfString:@"@"];
    if (v9 != 0x7FFFFFFFFFFFFFFFLL
      && (v10 == 0x7FFFFFFFFFFFFFFFLL || v10 >= v9)
      && (([(__CFString *)v6 _web_hasCaseInsensitivePrefix:@"http:"] & 1) != 0
       || ([(__CFString *)v6 _web_hasCaseInsensitivePrefix:@"https:"] & 1) != 0
       || ([(__CFString *)v6 _web_hasCaseInsensitivePrefix:@"file:"] & 1) != 0
       || ([(__CFString *)v6 _web_hasCaseInsensitivePrefix:@"ftp:"] & 1) != 0
       || ([(__CFString *)v6 _web_hasCaseInsensitivePrefix:@"javascript:"] & 1) != 0
       || ([(__CFString *)v6 _web_hasCaseInsensitivePrefix:@"about:"] & 1) != 0
       || ([(__CFString *)v6 _web_hasCaseInsensitivePrefix:@"radar:"] & 1) != 0
       || ([(__CFString *)v6 _web_hasCaseInsensitivePrefix:@"rdar:"] & 1) != 0
       || [(__CFString *)v6 length] <= v9 + 1
       || -[__CFString characterAtIndex:](v6, "characterAtIndex:") - 58 <= 0xFFFFFFF5))
    {
      goto LABEL_15;
    }
    if (!objc_msgSend((id)-[__CFString lowercaseString](v6, "lowercaseString"), "hasPrefix:", @"www."))
    {
      if (objc_msgSend((id)-[__CFString lowercaseString](v6, "lowercaseString"), "hasPrefix:", @"ftp."))
      {
        v13 = @"ftp://";
        goto LABEL_14;
      }
      if (v12 == 0x7FFFFFFFFFFFFFFFLL || v12 >= v10)
      {
        if (v11 != 0x7FFFFFFFFFFFFFFFLL && v11 < v10)
        {
          [(__CFString *)v6 insertString:@"http://" atIndex:0];
          uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CB10], "_webkit_URLWithUserTypedString:", v6);
          if (v15) {
            [v5 addObject:v15];
          }
LABEL_35:
          [(__CFString *)v6 insertString:@"www." atIndex:7];
          v14 = (void *)MEMORY[0x1E4F1CB10];
LABEL_16:
          uint64_t v7 = objc_msgSend(v14, "_webkit_URLWithUserTypedString:", v6);
          if (!v7) {
            return v5;
          }
          goto LABEL_5;
        }
        if ((objc_msgSend((id)-[__CFString lowercaseString](v6, "lowercaseString"), "isEqualToString:", @"localhost") & 1) == 0&& !objc_msgSend((id)-[__CFString lowercaseString](v6, "lowercaseString"), "hasPrefix:", @"localhost/"))
        {
          [(__CFString *)v6 insertString:@"http://" atIndex:0];
          uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CB10], "_webkit_URLWithUserTypedString:", v6);
          if (v16) {
            [v5 addObject:v16];
          }
          uint64_t v17 = [(__CFString *)v6 rangeOfString:@":", 2, 5, [(__CFString *)v6 length] - 5 options range];
          if (v17 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
              LODWORD(v17) = [(__CFString *)v6 length];
            }
            else {
              LODWORD(v17) = v10 + 7;
            }
          }
          uint64_t v18 = v17;
          if (!a3 || v17 != [(__CFString *)v6 length]) {
            [(__CFString *)v6 insertString:@".com" atIndex:v18];
          }
          goto LABEL_35;
        }
      }
    }
    v13 = @"http://";
LABEL_14:
    [(__CFString *)v6 insertString:v13 atIndex:0];
LABEL_15:
    v14 = (void *)MEMORY[0x1E4F1CB10];
    goto LABEL_16;
  }
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", -[__CFString _web_stringByExpandingTildeInPath](v6, "_web_stringByExpandingTildeInPath"));
  if (v7) {
LABEL_5:
  }
    [v5 addObject:v7];
  return v5;
}

- (uint64_t)_web_possibleURLPrefixesForUserTypedString
{
  return objc_msgSend(a1, "_web_possibleURLsForForUserTypedString:", 1);
}

- (uint64_t)_web_possibleURLsForUserTypedString
{
  return objc_msgSend(a1, "_web_possibleURLsForForUserTypedString:", 0);
}

- (uint64_t)_web_bestURLForUserTypedString
{
  v1 = objc_msgSend(a1, "_web_possibleURLsForUserTypedString");
  uint64_t result = [v1 count];
  if (result)
  {
    v3 = (void *)[v1 objectAtIndex:0];
    return objc_msgSend(v3, "_webkit_canonicalize");
  }
  return result;
}

@end