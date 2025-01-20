@interface NSAttributedString(TSUAdditions)
+ (uint64_t)tsu_carriageReturnAttributedString;
- (id)tsu_stringWithoutAttachments;
- (uint64_t)tsu_RTFDFromRange:()TSUAdditions documentAttributes:;
- (uint64_t)tsu_RTFFromRange:()TSUAdditions documentAttributes:;
- (uint64_t)tsu_nextTableStringFromIndex:()TSUAdditions tableRange:;
- (uint64_t)tsu_numberOfTables;
- (uint64_t)tsu_rangeofNextTableFromIndex:()TSUAdditions;
- (uint64_t)tsu_textTablesInRange:()TSUAdditions;
- (void)tsu_stringByFixingBrokenSurrogatePairs;
@end

@implementation NSAttributedString(TSUAdditions)

- (uint64_t)tsu_RTFFromRange:()TSUAdditions documentAttributes:
{
  v8 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:a5];
  [v8 setObject:*MEMORY[0x263F1C278] forKey:*MEMORY[0x263F1C230]];
  return objc_msgSend(a1, "dataFromRange:documentAttributes:error:", a3, a4, v8, 0);
}

- (uint64_t)tsu_RTFDFromRange:()TSUAdditions documentAttributes:
{
  v8 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:a5];
  [v8 setObject:*MEMORY[0x263F1C270] forKey:*MEMORY[0x263F1C230]];
  return objc_msgSend(a1, "dataFromRange:documentAttributes:error:", a3, a4, v8, 0);
}

- (void)tsu_stringByFixingBrokenSurrogatePairs
{
  v1 = a1;
  CFStringRef v2 = (const __CFString *)[a1 string];
  CFIndex Length = CFStringGetLength(v2);
  CFStringRef theString = v2;
  uint64_t v32 = 0;
  CFIndex v33 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v2);
  CStringPtr = 0;
  v30 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v2, 0x600u);
  }
  int64_t v34 = 0;
  int64_t v35 = 0;
  v31 = CStringPtr;
  if (Length >= 1)
  {
    int64_t v6 = 0;
    id v7 = 0;
    int64_t v8 = 0;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    do
    {
      if ((v8 & 0x8000000000000000) == 0)
      {
        CFIndex v9 = v33;
        if (v33 > v8)
        {
          if (v30)
          {
            UniChar v10 = v30[v32 + v8];
          }
          else if (v31)
          {
            UniChar v10 = v31[v32 + v8];
          }
          else
          {
            if (v35 <= v8 || v6 > v8)
            {
              int64_t v11 = v8 - 4;
              if ((unint64_t)v8 < 4) {
                int64_t v11 = 0;
              }
              if (v11 + 64 < v33) {
                CFIndex v9 = v11 + 64;
              }
              int64_t v34 = v11;
              int64_t v35 = v9;
              v36.location = v32 + v11;
              v36.length = v9 - v11;
              CFStringGetCharacters(theString, v36, (UniChar *)&v21);
              int64_t v6 = v34;
            }
            UniChar v10 = *((_WORD *)&v21 + v8 - v6);
          }
          int v12 = v10 & 0xFC00;
          if (v12 == 56320)
          {
LABEL_37:
            if (!v7)
            {
              id v7 = (id)objc_msgSend(v1, "mutableCopyWithZone:", 0, v21, v22, v23, v24, v25, v26, v27, v28);
              v1 = v7;
            }
            objc_msgSend(v7, "replaceCharactersInRange:withString:", v8, 1, @"\uFFFD", v21, v22, v23, v24, v25, v26, v27, v28);
            CFStringRef v17 = (const __CFString *)[v1 string];
            CFIndex Length = CFStringGetLength(v17);
            CFStringRef theString = v17;
            uint64_t v32 = 0;
            CFIndex v33 = Length;
            v18 = CFStringGetCharactersPtr(v17);
            v19 = 0;
            v30 = v18;
            if (!v18) {
              v19 = CFStringGetCStringPtr(v17, 0x600u);
            }
            int64_t v6 = 0;
            v31 = v19;
            int64_t v34 = 0;
            int64_t v35 = 0;
            goto LABEL_42;
          }
          if (v12 == 55296)
          {
            int64_t v13 = v8 + 1;
            if (v8 + 1 >= Length) {
              goto LABEL_37;
            }
            CFIndex v14 = v33;
            if (v33 <= v13) {
              goto LABEL_37;
            }
            if (v30)
            {
              UniChar v15 = v30[v32 + v13];
            }
            else if (v31)
            {
              UniChar v15 = v31[v32 + v13];
            }
            else
            {
              if (v35 <= v13 || v6 > v13)
              {
                int64_t v16 = v8 - 3;
                if ((unint64_t)v8 < 3) {
                  int64_t v16 = 0;
                }
                if (v16 + 64 < v33) {
                  CFIndex v14 = v16 + 64;
                }
                int64_t v34 = v16;
                int64_t v35 = v14;
                v37.location = v32 + v16;
                v37.length = v14 - v16;
                CFStringGetCharacters(theString, v37, (UniChar *)&v21);
                int64_t v6 = v34;
              }
              UniChar v15 = *((_WORD *)&v21 + v13 - v6);
            }
            if (v15 >> 10 != 55) {
              goto LABEL_37;
            }
            ++v8;
          }
        }
      }
LABEL_42:
      ++v8;
    }
    while (v8 < Length);
  }
  return v1;
}

- (id)tsu_stringWithoutAttachments
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F089B8]) initWithAttributedString:a1];
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v3 = [a1 length];
  if (v3)
  {
    unint64_t v4 = v3;
    unsigned int v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = *MEMORY[0x263F1C208];
    do
    {
      uint64_t v8 = [a1 attribute:v7 atIndex:v6 effectiveRange:&v12];
      uint64_t v10 = v12;
      uint64_t v9 = v13;
      if (v8)
      {
        objc_msgSend(v2, "deleteCharactersInRange:", v12 - v5, v13);
        v5 += v13;
      }
      uint64_t v6 = v9 + v10;
    }
    while (v9 + v10 < v4);
  }
  return v2;
}

- (uint64_t)tsu_nextTableStringFromIndex:()TSUAdditions tableRange:
{
  unint64_t v6 = [a1 length];
  if (a4)
  {
    uint64_t v7 = v6 - a3;
    if (v6 < a3) {
      uint64_t v7 = 0;
    }
    *a4 = a3;
    a4[1] = v7;
  }
  return 0;
}

- (uint64_t)tsu_rangeofNextTableFromIndex:()TSUAdditions
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)tsu_numberOfTables
{
  if (![a1 length]) {
    return 0;
  }
  uint64_t v2 = [a1 length];
  if (!v2) {
    return 0;
  }
  unint64_t v3 = v2;
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  do
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    if (objc_msgSend(a1, "tsu_nextTableStringFromIndex:tableRange:", v5, &v7)) {
      ++v4;
    }
    uint64_t v5 = v8 + v7;
  }
  while (v8 + v7 < v3);
  return v4;
}

- (uint64_t)tsu_textTablesInRange:()TSUAdditions
{
  return [MEMORY[0x263EFF980] array];
}

+ (uint64_t)tsu_carriageReturnAttributedString
{
  uint64_t result = tsu_carriageReturnAttributedString_sCarriageReturnAttributedString;
  if (!tsu_carriageReturnAttributedString_sCarriageReturnAttributedString)
  {
    __int16 v2 = 13;
    v1 = (void *)[[NSString alloc] initWithCharacters:&v2 length:1];
    tsu_carriageReturnAttributedString_sCarriageReturnAttributedString = [objc_alloc(MEMORY[0x263F086A0]) initWithString:v1];

    return tsu_carriageReturnAttributedString_sCarriageReturnAttributedString;
  }
  return result;
}

@end