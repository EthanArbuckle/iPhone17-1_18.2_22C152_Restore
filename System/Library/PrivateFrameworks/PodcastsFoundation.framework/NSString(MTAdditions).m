@interface NSString(MTAdditions)
+ (id)stringWithDuration:()MTAdditions unitsStyle:includeTimeRemainingPhrase:;
+ (uint64_t)mt_isEnglish;
+ (uint64_t)mt_isJapanese;
+ (uint64_t)prettyShortStringWithDuration:()MTAdditions;
+ (uint64_t)prettyShortStringWithDuration:()MTAdditions abbreviated:;
+ (uint64_t)prettyShortStringWithDuration:()MTAdditions includeTimeRemainingPhrase:;
+ (uint64_t)prettyShortStringWithDuration:()MTAdditions includeTimeRemainingPhrase:abbreviated:;
- (BOOL)containsStringInsensitive:()MTAdditions;
- (BOOL)isNotEmpty;
- (__CFString)stringByRemovingNewlineCharacters;
- (id)cleanedTitleStringWithPrefix:()MTAdditions;
- (id)pf_localizedStringByFoldingWithOptions:()MTAdditions;
- (id)stringBySmartlyStrippingHTML;
- (id)words;
@end

@implementation NSString(MTAdditions)

+ (uint64_t)prettyShortStringWithDuration:()MTAdditions includeTimeRemainingPhrase:abbreviated:
{
  if (a4) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  return objc_msgSend(a1, "stringWithDuration:unitsStyle:includeTimeRemainingPhrase:", v5, a3);
}

+ (id)stringWithDuration:()MTAdditions unitsStyle:includeTimeRemainingPhrase:
{
  BOOL v8 = a2 >= 0.0 && a2 < 1.0;
  uint64_t v9 = (uint64_t)a2;
  if (v8) {
    uint64_t v9 = 1;
  }
  uint64_t v10 = v9 / 60 % 60;
  if (v9 % 60 > 29)
  {
    uint64_t v11 = v10 + 1;
    BOOL v12 = v10 == -1;
    uint64_t v13 = 60 * v11 + 3600 * (v9 / 3600);
    uint64_t v14 = 96;
    if ((unint64_t)(v9 + 3599) > 0x1C1E || !v12) {
      goto LABEL_16;
    }
LABEL_26:
    v22 = 0;
    goto LABEL_27;
  }
  uint64_t v14 = 96;
  if ((unint64_t)(v9 + 3599) <= 0x1C1E && !v10)
  {
    if (v9 % 60 < 1) {
      goto LABEL_26;
    }
    uint64_t v14 = 224;
  }
  uint64_t v13 = v9;
LABEL_16:
  if (stringWithDuration_unitsStyle_includeTimeRemainingPhrase__onceToken != -1) {
    dispatch_once(&stringWithDuration_unitsStyle_includeTimeRemainingPhrase__onceToken, &__block_literal_global_5);
  }
  id v15 = (id)stringWithDuration_unitsStyle_includeTimeRemainingPhrase__formatters;
  objc_sync_enter(v15);
  v16 = (void *)stringWithDuration_unitsStyle_includeTimeRemainingPhrase__formatters;
  v17 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
  id v18 = [v16 objectForKeyedSubscript:v17];

  if (!v18)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F28C00]);
    [v18 setUnitsStyle:a4];
    [v18 setMaximumUnitCount:2];
    v19 = (void *)stringWithDuration_unitsStyle_includeTimeRemainingPhrase__formatters;
    v20 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
    [v19 setObject:v18 forKeyedSubscript:v20];
  }
  objc_sync_exit(v15);

  id v21 = v18;
  objc_sync_enter(v21);
  [v21 setAllowedUnits:v14];
  [v21 setIncludesTimeRemainingPhrase:a5];
  v22 = [v21 stringFromTimeInterval:(double)v13];
  objc_sync_exit(v21);

  if (a4 == 2)
  {
    uint64_t v23 = [v22 stringByReplacingOccurrencesOfString:@"," withString:&stru_1F03A51F0];

    v22 = (void *)v23;
  }
  if (a5 && objc_msgSend(a1, "mt_isEnglish"))
  {
    uint64_t v24 = [v22 stringByReplacingOccurrencesOfString:@"remaining" withString:@"left"];

    v22 = (void *)v24;
  }

LABEL_27:
  return v22;
}

- (id)cleanedTitleStringWithPrefix:()MTAdditions
{
  id v4 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__6;
  v25 = __Block_byref_object_dispose__6;
  id v5 = a1;
  id v26 = v5;
  if (v4)
  {
    v6 = v5;
    unint64_t v7 = [v5 length];
    if (v7 > [v4 length])
    {
      BOOL v8 = [v4 words];
      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x2020000000;
      v20[3] = 0;
      v19[0] = 0;
      v19[1] = v19;
      v19[2] = 0x3010000000;
      v19[4] = 0;
      v19[5] = 0;
      v19[3] = "";
      uint64_t v9 = [v6 length];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __54__NSString_MTAdditions__cleanedTitleStringWithPrefix___block_invoke;
      v13[3] = &unk_1E5E61C10;
      id v10 = v8;
      v16 = v20;
      v17 = &v21;
      id v14 = v10;
      id v15 = v6;
      id v18 = v19;
      objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 1027, v13);

      _Block_object_dispose(v19, 8);
      _Block_object_dispose(v20, 8);
    }
  }
  id v11 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v11;
}

- (BOOL)containsStringInsensitive:()MTAdditions
{
  return [a1 rangeOfString:a3 options:1] != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)words
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [a1 length];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__NSString_MTAdditions__words__block_invoke;
  v6[3] = &unk_1E5E61C38;
  id v4 = v2;
  id v7 = v4;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v3, 1027, v6);

  return v4;
}

+ (uint64_t)prettyShortStringWithDuration:()MTAdditions
{
  return objc_msgSend(a1, "prettyShortStringWithDuration:abbreviated:", 0);
}

+ (uint64_t)prettyShortStringWithDuration:()MTAdditions abbreviated:
{
  return objc_msgSend(a1, "prettyShortStringWithDuration:includeTimeRemainingPhrase:abbreviated:", 0, a3);
}

+ (uint64_t)prettyShortStringWithDuration:()MTAdditions includeTimeRemainingPhrase:
{
  return objc_msgSend(a1, "prettyShortStringWithDuration:includeTimeRemainingPhrase:abbreviated:", a3, 0);
}

+ (uint64_t)mt_isEnglish
{
  if (mt_isEnglish_onceToken != -1) {
    dispatch_once(&mt_isEnglish_onceToken, &__block_literal_global_23);
  }
  return mt_isEnglish_isEnglish;
}

+ (uint64_t)mt_isJapanese
{
  if (mt_isJapanese_onceToken != -1) {
    dispatch_once(&mt_isJapanese_onceToken, &__block_literal_global_29);
  }
  return mt_isJapanese_isJapanese;
}

- (BOOL)isNotEmpty
{
  return [a1 length] != 0;
}

- (__CFString)stringByRemovingNewlineCharacters
{
  v23[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    uint64_t v3 = [a1 componentsSeparatedByCharactersInSet:v2];

    uint64_t v4 = [v3 count];
    if (v4 == 1)
    {
      id v5 = [v3 objectAtIndex:0];
    }
    else
    {
      uint64_t v6 = v4;
      id v7 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      BOOL v8 = [v3 objectAtIndex:0];
      uint64_t v9 = [(__CFString *)v8 length];
      id v10 = &stru_1F03A51F0;
      uint64_t v21 = v8;
      if (v9) {
        id v10 = v8;
      }
      id v5 = v10;
      for (uint64_t i = 1; i != v6; ++i)
      {
        BOOL v12 = objc_msgSend(v3, "objectAtIndex:", i, v21);
        if (-[__CFString length](v5, "length") && [v12 length])
        {
          uint64_t v13 = [(__CFString *)v5 characterAtIndex:[(__CFString *)v5 length] - 1];
          uint64_t v14 = [v12 characterAtIndex:0];
          if ([v7 characterIsMember:v13]
            && [v7 characterIsMember:v14])
          {
            uint64_t v15 = [(__CFString *)v5 stringByTrimmingCharactersInSet:v7];
            v16 = [v12 stringByTrimmingCharactersInSet:v7];
            v23[0] = v15;
            v23[1] = v16;
            v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
            uint64_t v18 = [v17 componentsJoinedByString:@" "];

            id v5 = (__CFString *)v15;
          }
          else if (([v7 characterIsMember:v13] & 1) != 0 {
                 || ([v7 characterIsMember:v14] & 1) != 0)
          }
          {
            uint64_t v18 = [(__CFString *)v5 stringByAppendingString:v12];
          }
          else
          {
            v22[0] = v5;
            v22[1] = v12;
            v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
            uint64_t v18 = [(__CFString *)v19 componentsJoinedByString:@" "];

            id v5 = v19;
          }

          id v5 = (__CFString *)v18;
        }
      }
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)stringBySmartlyStrippingHTML
{
  v1 = [a1 stringByRemovingNewlineCharacters];
  v2 = [v1 stringByReplacingOccurrencesOfString:@"<br>" withString:@"\n<br>"];

  uint64_t v3 = [v2 stringByReplacingOccurrencesOfString:@"<br/>" withString:@"\n"];

  uint64_t v4 = [v3 stringByReplacingOccurrencesOfString:@"<p>" withString:@"\n\n<p>"];

  id v5 = [v4 stringByStrippingHTML];

  return v5;
}

- (id)pf_localizedStringByFoldingWithOptions:()MTAdditions
{
  id v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v6 = [a1 stringByFoldingWithOptions:a3 locale:v5];

  return v6;
}

@end