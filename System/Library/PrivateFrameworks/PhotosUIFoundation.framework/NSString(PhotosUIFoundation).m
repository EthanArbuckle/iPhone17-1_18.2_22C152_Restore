@interface NSString(PhotosUIFoundation)
+ (id)_excessiveLineHeightCharacterSet;
- (BOOL)px_hasExcessiveLineHeightCharacters;
- (BOOL)px_hasStringIgnoringCaseAndDiacritics:()PhotosUIFoundation;
- (id)px_integerValues;
- (id)px_stringByAppendingDescriptionDetails:()PhotosUIFoundation;
- (id)px_stringByAppendingDescriptionDetailsWithFormat:()PhotosUIFoundation;
- (id)px_stringByApplyingCapitalization:()PhotosUIFoundation;
- (id)px_stringByDeletingCharactersInSet:()PhotosUIFoundation;
- (id)px_stringByIndentingNewLines;
- (id)px_stringByRepeating:()PhotosUIFoundation;
- (id)px_stringByTruncatingToLength:()PhotosUIFoundation addEllipsis:;
- (uint64_t)px_endsWithFullStopOrEquivalentPunctuationMark;
- (uint64_t)px_firstLetterRange;
- (uint64_t)px_platformAgnosticHash;
- (uint64_t)px_rangeOfPrefixIgnoringCaseAndDiacritics:()PhotosUIFoundation;
- (uint64_t)px_rangeOfSubstringIgnoringCaseAndDiacritics:()PhotosUIFoundation;
- (uint64_t)px_roundedBoundingRectWithSize:()PhotosUIFoundation options:attributes:context:;
@end

@implementation NSString(PhotosUIFoundation)

- (uint64_t)px_firstLetterRange
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3010000000;
  v9 = &unk_259D809E3;
  long long v10 = xmmword_259D747D0;
  uint64_t v2 = [a1 length];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__NSString_PhotosUIFoundation__px_firstLetterRange__block_invoke;
  v5[3] = &unk_26545A9F8;
  v5[4] = a1;
  v5[5] = &v6;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v2, 1027, v5);
  uint64_t v3 = v7[4];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)px_stringByApplyingCapitalization:()PhotosUIFoundation
{
  id v4 = a1;
  v5 = v4;
  if (a3 == 3)
  {
    uint64_t v8 = objc_msgSend(v4, "px_firstLetterRange");
    if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_10;
    }
    uint64_t v10 = v8;
    uint64_t v11 = v9;
    v7 = (void *)[v5 mutableCopy];
    v12 = objc_msgSend(v7, "substringWithRange:", v10, v11);
    v13 = [v12 localizedCapitalizedString];
    objc_msgSend(v7, "replaceCharactersInRange:withString:", v10, v11, v13);
  }
  else
  {
    if (a3 == 2)
    {
      uint64_t v6 = [v4 localizedCapitalizedString];
    }
    else
    {
      if (a3 != 1) {
        goto LABEL_10;
      }
      uint64_t v6 = [v4 localizedUppercaseString];
    }
    v7 = (void *)v6;
  }

  v5 = v7;
LABEL_10:

  return v5;
}

- (uint64_t)px_roundedBoundingRectWithSize:()PhotosUIFoundation options:attributes:context:
{
  return objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:");
}

- (BOOL)px_hasExcessiveLineHeightCharacters
{
  uint64_t v2 = [NSString _excessiveLineHeightCharacterSet];
  BOOL v3 = [a1 rangeOfCharacterFromSet:v2] != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (id)px_stringByAppendingDescriptionDetails:()PhotosUIFoundation
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  uint64_t v6 = [a1 rangeOfString:@">" options:12];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v6 = [v5 length];
  }
  [v5 insertString:v4 atIndex:v6];

  return v5;
}

- (id)px_stringByAppendingDescriptionDetailsWithFormat:()PhotosUIFoundation
{
  uint64_t v10 = (__CFString *)CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, a3, &a9);
  uint64_t v11 = objc_msgSend(a1, "px_stringByAppendingDescriptionDetails:", v10);

  return v11;
}

- (uint64_t)px_endsWithFullStopOrEquivalentPunctuationMark
{
  if (px_endsWithFullStopOrEquivalentPunctuationMark_onceToken != -1) {
    dispatch_once(&px_endsWithFullStopOrEquivalentPunctuationMark_onceToken, &__block_literal_global_41);
  }
  uint64_t result = [a1 length];
  if (result)
  {
    BOOL v3 = (void *)px_endsWithFullStopOrEquivalentPunctuationMark_fullStopPunctuationCharacterSet;
    uint64_t v4 = objc_msgSend(a1, "characterAtIndex:", objc_msgSend(a1, "length") - 1);
    return [v3 characterIsMember:v4];
  }
  return result;
}

- (id)px_integerValues
{
  v1 = [a1 componentsSeparatedByString:@","];
  uint64_t v2 = PXMap(v1, &__block_literal_global_3832);

  return v2;
}

- (id)px_stringByIndentingNewLines
{
  uint64_t v2 = (void *)[a1 mutableCopy];
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"\n", @"\n\t", 2, 0, objc_msgSend(a1, "length"));

  return v2;
}

- (uint64_t)px_platformAgnosticHash
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 length];
  uint64_t v3 = v2;
  uint64_t v4 = v9;
  if (v2 >= 97)
  {
    objc_msgSend(a1, "getCharacters:range:", v9, 0, 32);
    objc_msgSend(a1, "getCharacters:range:", &v10, ((unint64_t)v2 >> 1) - 16, 32);
    objc_msgSend(a1, "getCharacters:range:", &v11, v2 - 32, 32);
    v5 = (unsigned __int16 *)&v12;
    uint64_t v6 = (unsigned __int16 *)&v12;
LABEL_5:
    uint64_t v4 = v9;
    do
    {
      uint64_t v3 = 67503105 * v3 + 16974593 * *v4 + 66049 * v4[1] + 257 * v4[2] + v4[3];
      v4 += 4;
    }
    while (v4 < v6);
    goto LABEL_9;
  }
  objc_msgSend(a1, "getCharacters:range:", v9, 0, v2);
  v5 = &v9[v2];
  if ((uint64_t)(v2 & 0xFFFFFFFFFFFFFFFCLL) >= 1)
  {
    uint64_t v6 = &v9[v2 & 0xFFFFFFFFFFFFFFFCLL];
    goto LABEL_5;
  }
LABEL_9:
  while (v4 < v5)
  {
    unsigned int v7 = *v4++;
    uint64_t v3 = 257 * v3 + v7;
  }
  return (v3 << (v2 & 0x1F)) + v3;
}

- (id)px_stringByRepeating:()PhotosUIFoundation
{
  v5 = [MEMORY[0x263F089D8] string];
  if (a3 >= 1)
  {
    do
    {
      [v5 appendString:a1];
      --a3;
    }
    while (a3);
  }

  return v5;
}

- (id)px_stringByDeletingCharactersInSet:()PhotosUIFoundation
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"NSString+PhotosUIFoundation.m", 74, @"Invalid parameter not satisfying: %@", @"characterSet" object file lineNumber description];
  }
  uint64_t v6 = (void *)[a1 mutableCopy];
  uint64_t v7 = [v6 rangeOfCharacterFromSet:v5];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (uint64_t i = v7; i != 0x7FFFFFFFFFFFFFFFLL; uint64_t i = [v6 rangeOfCharacterFromSet:v5])
      objc_msgSend(v6, "deleteCharactersInRange:", i, v8);
  }
  uint64_t v10 = (void *)[v6 copy];

  return v10;
}

- (BOOL)px_hasStringIgnoringCaseAndDiacritics:()PhotosUIFoundation
{
  return objc_msgSend(a1, "px_rangeOfSubstringIgnoringCaseAndDiacritics:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)px_rangeOfSubstringIgnoringCaseAndDiacritics:()PhotosUIFoundation
{
  return [a1 rangeOfString:a3 options:129];
}

- (uint64_t)px_rangeOfPrefixIgnoringCaseAndDiacritics:()PhotosUIFoundation
{
  return [a1 rangeOfString:a3 options:137];
}

- (id)px_stringByTruncatingToLength:()PhotosUIFoundation addEllipsis:
{
  id v6 = a1;
  if ([v6 length] > a3)
  {
    uint64_t v7 = [v6 substringToIndex:a3];
    uint64_t v8 = (void *)[v7 mutableCopy];

    if (a4) {
      objc_msgSend(v8, "replaceCharactersInRange:withString:", a3 - 1, 1, @"…");
    }
    uint64_t v9 = [v8 copy];

    id v6 = (id)v9;
  }

  return v6;
}

+ (id)_excessiveLineHeightCharacterSet
{
  if (_excessiveLineHeightCharacterSet_onceToken != -1) {
    dispatch_once(&_excessiveLineHeightCharacterSet_onceToken, &__block_literal_global_49);
  }
  v0 = (void *)_excessiveLineHeightCharacterSet_excessiveLineHeightCharacterSet;

  return v0;
}

@end