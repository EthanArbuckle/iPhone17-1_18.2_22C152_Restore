@interface NSString(WFExtension)
+ (id)WF_stringFromArray:()WFExtension;
+ (uint64_t)WF_ignorableCharacterSet;
- (BOOL)WF_containsString:()WFExtension options:;
- (BOOL)WF_containsWord:()WFExtension;
- (id)WF_fuzzyStringWithWordLength:()WFExtension;
- (uint64_t)WF_containsString:()WFExtension;
- (uint64_t)WF_numericCompare:()WFExtension;
- (uint64_t)WF_rangeOfWord:()WFExtension;
- (uint64_t)WF_stringByConvertingSpacesInHTMLSpaces;
- (uint64_t)WF_stringByEscapingPrintfArguments;
- (uint64_t)WF_stringByProperlyFixingPercentEscapesUsingEncoding:()WFExtension;
- (uint64_t)WF_stringWithMostSignificatDomainPart;
- (uint64_t)_isIPv4DomainAddress;
- (void)WF_stringByRemovingWord:()WFExtension;
- (void)WF_stringByReplacingString:()WFExtension withString:;
@end

@implementation NSString(WFExtension)

+ (uint64_t)WF_ignorableCharacterSet
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t result = ignorableCharacterSet_NSString;
  if (!ignorableCharacterSet_NSString)
  {
    ignorableCharacterSet_NSString = objc_opt_new();
    objc_msgSend((id)ignorableCharacterSet_NSString, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x263F08708], "whitespaceAndNewlineCharacterSet"));
    objc_msgSend((id)ignorableCharacterSet_NSString, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x263F08708], "symbolCharacterSet"));
    objc_msgSend((id)ignorableCharacterSet_NSString, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x263F08708], "characterSetWithCharactersInString:", @".,-_!?*&"));
    v1 = __WFDefaultLog();
    BOOL v2 = os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG);
    uint64_t result = ignorableCharacterSet_NSString;
    if (v2)
    {
      int v3 = 138412290;
      uint64_t v4 = ignorableCharacterSet_NSString;
      _os_log_debug_impl(&dword_217734000, v1, OS_LOG_TYPE_DEBUG, "ignorableCharacterSet_NSString %@", (uint8_t *)&v3, 0xCu);
      return ignorableCharacterSet_NSString;
    }
  }
  return result;
}

+ (id)WF_stringFromArray:()WFExtension
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a3);
        }
        [v4 appendFormat:@"%@\n", *(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v4;
}

- (uint64_t)WF_containsString:()WFExtension
{
  return objc_msgSend(a1, "WF_containsString:options:", a3, 2);
}

- (BOOL)WF_containsString:()WFExtension options:
{
  return objc_msgSend(a1, "rangeOfString:options:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)WF_containsWord:()WFExtension
{
  return objc_msgSend(a1, "WF_rangeOfWord:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)WF_rangeOfWord:()WFExtension
{
  unint64_t v5 = [a3 length];
  unint64_t v6 = [a1 length];
  unint64_t v7 = [a1 length];
  unint64_t v8 = 0;
  while (1)
  {
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (v7 < v5) {
      break;
    }
    uint64_t v10 = objc_msgSend(a1, "rangeOfString:options:range:", a3, 1, v8, v7);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    uint64_t v12 = v10;
    unint64_t v8 = v10 + v5;
    if (v10) {
      uint64_t v13 = v10 - 1;
    }
    else {
      uint64_t v13 = 0;
    }
    if (v10) {
      uint64_t v14 = v11 + 1;
    }
    else {
      uint64_t v14 = v11;
    }
    unint64_t v7 = v6 - v8;
    if (v6 <= v8) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = v14 + 1;
    }
    v16 = objc_msgSend(a1, "substringWithRange:", v13, v15);
    if (!objc_msgSend((id)objc_msgSend(v16, "stringByTrimmingCharactersInSet:", objc_msgSend(NSString, "WF_ignorableCharacterSet")), "caseInsensitiveCompare:", a3))return v12; {
  }
    }
  return v9;
}

- (void)WF_stringByRemovingWord:()WFExtension
{
  uint64_t v4 = a1;
  uint64_t v5 = objc_msgSend(a1, "WF_rangeOfWord:");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (uint64_t i = v5; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = objc_msgSend(v4, "WF_rangeOfWord:", a3))
    {
      uint64_t v8 = i + v6;
      uint64_t v9 = [v4 length] - (i + v6);
      uint64_t v4 = (void *)[NSString stringWithFormat:@"%@%@", objc_msgSend(v4, "substringWithRange:", 0, i), objc_msgSend(v4, "substringWithRange:", v8, v9)];
    }
  }
  return v4;
}

- (uint64_t)WF_stringByEscapingPrintfArguments
{
  return objc_msgSend(a1, "WF_stringByReplacingString:withString:", @"%", @"%%");
}

- (void)WF_stringByReplacingString:()WFExtension withString:
{
  unint64_t v7 = (void *)[MEMORY[0x263F089D8] stringWithString:&stru_26C7AC028];
  uint64_t v8 = (void *)[a1 componentsSeparatedByString:a3];
  uint64_t v9 = [v8 count];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = v9 - 1;
    do
    {
      objc_msgSend(v7, "appendString:", objc_msgSend(v8, "objectAtIndex:", v11));
      if (v12 != v11) {
        [v7 appendString:a4];
      }
      ++v11;
    }
    while (v10 != v11);
  }
  return v7;
}

- (uint64_t)WF_stringByConvertingSpacesInHTMLSpaces
{
  return objc_msgSend(a1, "WF_stringByReplacingString:withString:", @" ", @"&nbsp;");
}

- (id)WF_fuzzyStringWithWordLength:()WFExtension
{
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = 0;
  uint64_t v7 = [a1 length] - a3 + 1;
  do
  {
    objc_msgSend(v5, "appendString:", objc_msgSend(a1, "substringWithRange:", v6, a3));
    [v5 appendString:@" "];
    ++v6;
  }
  while (v7 != v6);
  return v5;
}

- (uint64_t)WF_numericCompare:()WFExtension
{
  uint64_t v5 = [a1 length];
  return objc_msgSend(a1, "compare:options:range:", a3, 64, 0, v5);
}

- (uint64_t)WF_stringByProperlyFixingPercentEscapesUsingEncoding:()WFExtension
{
  BOOL v2 = (void *)[a1 stringByReplacingPercentEscapesUsingEncoding:4];
  if (!v2) {
    BOOL v2 = a1;
  }
  return [v2 stringByAddingPercentEscapesUsingEncoding:4];
}

- (uint64_t)_isIPv4DomainAddress
{
  BOOL v2 = (void *)[objc_alloc(MEMORY[0x263F08B08]) initWithString:a1];
  id v5 = 0;
  if (objc_msgSend(v2, "scanCharactersFromSet:intoString:", objc_msgSend(MEMORY[0x263F08708], "characterSetWithCharactersInString:", @".0123456789"), &v5))uint64_t v3 = objc_msgSend(v5, "isEqualToString:", a1); {
  else
  }
    uint64_t v3 = 0;

  return v3;
}

- (uint64_t)WF_stringWithMostSignificatDomainPart
{
  BOOL v2 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", objc_msgSend(a1, "componentsSeparatedByString:", @"."));
  if (unint64_t)[v2 count] < 3 || (objc_msgSend(a1, "_isIPv4DomainAddress")) {
    return (uint64_t)a1;
  }
  uint64_t v4 = [v2 lastObject];
  [v2 removeLastObject];
  uint64_t v5 = [v2 lastObject];
  return [NSString stringWithFormat:@"%@.%@", v5, v4];
}

@end