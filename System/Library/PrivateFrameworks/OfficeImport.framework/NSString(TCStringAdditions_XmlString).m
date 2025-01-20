@interface NSString(TCStringAdditions_XmlString)
+ (id)tc_stringWithXmlString:()TCStringAdditions_XmlString;
- (id)tc_componentsSeparatedByWhitespace;
- (id)tc_stringByRemovingInvalidXmlChars;
- (uint64_t)tc_initFromXmlNode:()TCStringAdditions_XmlString ns:attributeName:;
- (uint64_t)tc_initFromXmlNode:()TCStringAdditions_XmlString nsWithFallbackNs:attributeName:;
- (uint64_t)tc_initWithContentOfXmlNode:()TCStringAdditions_XmlString;
- (uint64_t)tc_initWithValueOfXmlAttribute:()TCStringAdditions_XmlString;
- (uint64_t)tc_isEqualToXmlString:()TCStringAdditions_XmlString;
- (uint64_t)tc_xmlString;
@end

@implementation NSString(TCStringAdditions_XmlString)

+ (id)tc_stringWithXmlString:()TCStringAdditions_XmlString
{
  v3 = objc_msgSend([a1 alloc], "tc_initWithXmlString:", a3);
  return v3;
}

- (uint64_t)tc_xmlString
{
  id v1 = a1;
  return [v1 UTF8String];
}

- (uint64_t)tc_initWithValueOfXmlAttribute:()TCStringAdditions_XmlString
{
  uint64_t v4 = *(void *)(a3 + 24);
  if (!v4 || *(void *)(v4 + 48) || (*(_DWORD *)(v4 + 8) - 3) > 1)
  {
    int v5 = 1;
    String = xmlNodeListGetString(*(xmlDocPtr *)(a3 + 64), (const xmlNode *)v4, 1);
  }
  else
  {
    int v5 = 0;
    String = *(xmlChar **)(v4 + 80);
  }
  id v7 = a1;
  v8 = v7;
  if (String)
  {
    uint64_t v9 = objc_msgSend(v7, "tc_initWithXmlString:", String);

    if (v5) {
      ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(String);
    }
  }
  else
  {
    uint64_t v9 = [v7 init];
  }
  return v9;
}

- (uint64_t)tc_initWithContentOfXmlNode:()TCStringAdditions_XmlString
{
  Content = xmlNodeGetContent(cur);
  id v5 = a1;
  v6 = v5;
  if (Content)
  {
    uint64_t v7 = objc_msgSend(v5, "tc_initWithXmlString:", Content);

    ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(Content);
  }
  else
  {
    uint64_t v7 = [v5 init];
  }
  return v7;
}

- (uint64_t)tc_initFromXmlNode:()TCStringAdditions_XmlString ns:attributeName:
{
  NsProp = xmlGetNsProp(node, name, nameSpace);
  if (NsProp)
  {
    id v7 = a1;
    uint64_t v8 = objc_msgSend(v7, "tc_initWithXmlString:", NsProp);

    ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(NsProp);
  }
  else
  {

    return 0;
  }
  return v8;
}

- (uint64_t)tc_initFromXmlNode:()TCStringAdditions_XmlString nsWithFallbackNs:attributeName:
{
  id v8 = a4;
  id v9 = a1;
  uint64_t v10 = objc_msgSend(v9, "tc_initFromXmlNode:ns:attributeName:", a3, objc_msgSend(v8, "uri"), a5);

  if (!v10)
  {
    v11 = [v8 fallbackNamespace];

    if (v11)
    {
      v12 = [v8 fallbackNamespace];
      uint64_t v10 = objc_msgSend(0, "tc_initFromXmlNode:nsWithFallbackNs:attributeName:", a3, v12, a5);
    }
    else
    {
      uint64_t v10 = 0;
    }
  }

  return v10;
}

- (id)tc_componentsSeparatedByWhitespace
{
  v2 = [MEMORY[0x263EFF980] array];
  unint64_t v3 = [a1 length];
  uint64_t v4 = MEMORY[0x263EF8318];
  unint64_t v5 = 0;
  if (!v3) {
    goto LABEL_10;
  }
  do
  {
    unsigned int v6 = [a1 characterAtIndex:v5];
    if (v6 <= 0x7F)
    {
      if ((*(_DWORD *)(v4 + 4 * v6 + 60) & 0x4000) == 0) {
        goto LABEL_8;
      }
    }
    else if (!__maskrune(v6, 0x4000uLL))
    {
      goto LABEL_8;
    }
    ++v5;
  }
  while (v3 != v5);
  unint64_t v5 = v3;
LABEL_8:
  if (v5) {
    [v2 addObject:&stru_26EBF24D8];
  }
LABEL_10:
  while (v5 < v3)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = v7;
      if (v5 + v7 + 1 >= v3) {
        break;
      }
      unsigned int v9 = objc_msgSend(a1, "characterAtIndex:");
      int v10 = v9 <= 0x7F ? *(_DWORD *)(v4 + 4 * v9 + 60) & 0x4000 : __maskrune(v9, 0x4000uLL);
      uint64_t v7 = v8 + 1;
    }
    while (!v10);
    v11 = objc_msgSend(a1, "substringWithRange:", v5, v8 + 1);
    [v2 addObject:v11];

    v5 += v8 + 2;
    if (v5 < v3)
    {
      do
      {
        unsigned int v12 = [a1 characterAtIndex:v5];
        if (v12 <= 0x7F)
        {
          if ((*(_DWORD *)(v4 + 4 * v12 + 60) & 0x4000) == 0) {
            goto LABEL_10;
          }
        }
        else if (!__maskrune(v12, 0x4000uLL))
        {
          goto LABEL_10;
        }
        ++v5;
      }
      while (v5 < v3);
      goto LABEL_25;
    }
  }
  if (v5 != v3) {
    goto LABEL_26;
  }
LABEL_25:
  [v2 addObject:&stru_26EBF24D8];
LABEL_26:
  return v2;
}

- (uint64_t)tc_isEqualToXmlString:()TCStringAdditions_XmlString
{
  v2 = objc_msgSend(NSString, "stringWithUTF8String:");
  uint64_t v3 = [a1 isEqualToString:v2];

  return v3;
}

- (id)tc_stringByRemovingInvalidXmlChars
{
  v2 = TCInvalidXmlCharacterSet();
  id v3 = a1;
  if ([v3 rangeOfCharacterFromSet:v2] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = [v3 componentsSeparatedByCharactersInSet:v2];
    uint64_t v5 = [v4 componentsJoinedByString:&stru_26EBF24D8];

    id v3 = (id)v5;
  }
  unsigned int v6 = objc_msgSend(v3, "tsu_stringByFixingBrokenSurrogatePairs");

  return v6;
}

@end