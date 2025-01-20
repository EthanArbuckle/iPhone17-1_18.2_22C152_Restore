@interface NSString(OCStringAdditions)
+ (BOOL)tc_skipString:()OCStringAdditions;
+ (id)tc_mapString:()OCStringAdditions;
- (id)tc_escapedFragment;
- (id)tc_escapedPath;
- (id)tc_initialsFromAuthorName;
- (uint64_t)tc_languageTypeAtIndex:()OCStringAdditions effectiveRange:;
@end

@implementation NSString(OCStringAdditions)

+ (id)tc_mapString:()OCStringAdditions
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  v5 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:v3];
  uint64_t v6 = 0;
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      int v8 = [v3 characterAtIndex:i];
      if (v8 == 13 || v8 == 10) {
        ++v6;
      }
      if (v8 != 13 && v8 != 10) {
        break;
      }
    }
  }
  objc_msgSend(v5, "deleteCharactersInRange:", 0, v6);
  __int16 v11 = 8232;
  v9 = [NSString stringWithCharacters:&v11 length:1];
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", v9, @"\v", 2, 0, objc_msgSend(v5, "length"));

  return v5;
}

+ (BOOL)tc_skipString:()OCStringAdditions
{
  id v3 = a3;
  unint64_t v4 = [v3 length];
  if (v4)
  {
    int v5 = [v3 characterAtIndex:0];
    BOOL v7 = v5 == 13 || v5 == 10;
    if (v7 && v4 >= 2)
    {
      uint64_t v9 = 1;
      while (1)
      {
        unsigned int v10 = [v3 characterAtIndex:v9];
        BOOL v7 = 0;
        if (v10 > 0x20 || ((1 << v10) & 0x100002600) == 0) {
          break;
        }
        if (++v9 >= v4) {
          goto LABEL_17;
        }
      }
    }
  }
  else
  {
LABEL_17:
    BOOL v7 = 1;
  }

  return v7;
}

- (id)tc_initialsFromAuthorName
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v1 = [a1 componentsSeparatedByString:@" "];
  v2 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        BOOL v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v7, "length", (void)v10))
        {
          int v8 = [v7 substringToIndex:1];
          [v2 appendString:v8];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  return v2;
}

- (uint64_t)tc_languageTypeAtIndex:()OCStringAdditions effectiveRange:
{
  BOOL v15 = 0;
  uint64_t v7 = OCLanguageTypeForCharacter(objc_msgSend(a1, "characterAtIndex:"), &v15);
  if (a4)
  {
    *a4 = a3;
    unint64_t v8 = [a1 length];
    unint64_t v9 = a3 + 1;
    if (v9 < v8)
    {
      unint64_t v10 = v8;
      BOOL v11 = v15;
      do
      {
        BOOL v14 = 0;
        uint64_t v12 = OCLanguageTypeForCharacter([a1 characterAtIndex:v9], &v14);
        if (!v14)
        {
          if (v11)
          {
            BOOL v11 = 0;
            uint64_t v7 = v12;
          }
          else
          {
            if (v7 != v12) {
              goto LABEL_11;
            }
            BOOL v11 = 0;
          }
        }
        ++v9;
      }
      while (v10 != v9);
      unint64_t v9 = v10;
    }
LABEL_11:
    a4[1] = v9 - *a4;
  }
  return v7;
}

- (id)tc_escapedPath
{
  v2 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
  id v3 = [a1 stringByAddingPercentEncodingWithAllowedCharacters:v2];

  return v3;
}

- (id)tc_escapedFragment
{
  v2 = [MEMORY[0x263F08708] URLFragmentAllowedCharacterSet];
  id v3 = [a1 stringByAddingPercentEncodingWithAllowedCharacters:v2];

  return v3;
}

@end