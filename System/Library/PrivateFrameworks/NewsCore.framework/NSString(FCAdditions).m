@interface NSString(FCAdditions)
+ (id)fc_hardPaywallArticleIDWithArticleID:()FCAdditions;
+ (id)fc_string:()FCAdditions;
+ (id)stringWithValue:()FCAdditions;
+ (uint64_t)fc_string:()FCAdditions isEqualToString:;
- (BOOL)fc_isValidCloudKitID;
- (BOOL)fc_isValidColorHexString;
- (id)fc_lowercaseTokensWithMinimumLength:()FCAdditions;
- (id)fc_numberFollowingString:()FCAdditions;
- (id)fc_stringByAppendingStringIfNeeded:()FCAdditions;
- (id)fc_stringByMultiplyingStringByCount:()FCAdditions;
- (id)fc_stringByPrefixingLinesWithString:()FCAdditions;
- (id)fc_stringByRemovingPunctuation;
- (id)fc_stringByReplacingOccurrencesOfStrings:()FCAdditions withString:;
- (id)fc_stringByReplacingPrefix:()FCAdditions withString:;
- (id)fc_stringByTrimmingWhiteSpace;
- (id)stringByRemovingCharactersInSet:()FCAdditions;
- (id)tokenizedLowerCaseStringWithMinimumLength:()FCAdditions;
- (uint64_t)fc_isValidArticleID;
- (uint64_t)fc_isValidCloudKitIDWithPrefix:()FCAdditions;
- (uint64_t)fc_isValidHardPaywallArticleID;
- (uint64_t)fc_isValidIssueID;
- (uint64_t)fc_isValidPuzzleID;
- (uint64_t)fc_isValidPuzzleTypeID;
- (uint64_t)fc_isValidSportsEventID;
- (uint64_t)fc_isValidTagID;
- (uint64_t)fc_unsignedLongLongValue;
- (uint64_t)range;
@end

@implementation NSString(FCAdditions)

- (BOOL)fc_isValidColorHexString
{
  if (qword_1EB5D1C38 != -1) {
    dispatch_once(&qword_1EB5D1C38, &__block_literal_global_193);
  }
  return objc_msgSend((id)_MergedGlobals_229, "numberOfMatchesInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length")) == 1;
}

+ (uint64_t)fc_string:()FCAdditions isEqualToString:
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

+ (id)fc_string:()FCAdditions
{
  v3 = a3;
  v4 = objc_opt_new();
  v3[2](v3, v4);

  id v5 = (void *)[v4 copy];
  id v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  uint64_t v8 = v7;

  return v8;
}

- (uint64_t)range
{
  return 0;
}

+ (id)stringWithValue:()FCAdditions
{
  id v3 = a3;
  objc_opt_class();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v4 = v3;
    id v5 = v4;
  }
  else
  {
    objc_opt_class();
    if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    {
      id v6 = v3;
      id v5 = [v6 stringValue];
    }
    else
    {
      id v6 = 0;
      id v5 = 0;
    }

    id v4 = 0;
  }

  return v5;
}

- (id)fc_lowercaseTokensWithMinimumLength:()FCAdditions
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = objc_opt_new();
  unint64_t v6 = [a1 length];
  id v7 = [a1 lowercaseString];
  if (v6 > a3)
  {
    id v23 = v5;
    v18 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v19 = v7;
    [v7 componentsSeparatedByCharactersInSet:v18];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (!v22) {
      goto LABEL_19;
    }
    uint64_t v21 = *(void *)v25;
    uint64_t v8 = MEMORY[0x1E4F14390];
    while (1)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v11 = [v10 length];
        v12 = [MEMORY[0x1E4F28E78] string];
        if (v11)
        {
          unint64_t v13 = 0;
          for (uint64_t j = 0; v11 != j; ++j)
          {
            unsigned int v15 = [v10 characterAtIndex:j];
            if (v15 > 0x7F)
            {
              if (!__maskrune(v15, 0x4000uLL))
              {
LABEL_13:
                objc_msgSend(v12, "appendFormat:", @"%C", objc_msgSend(v10, "characterAtIndex:", j));
                if (v13 >= a3 - 1)
                {
                  v16 = (void *)[v12 copy];
                  [v23 addObject:v16];
                }
                ++v13;
              }
            }
            else if ((*(_DWORD *)(v8 + 4 * v15 + 60) & 0x4000) == 0)
            {
              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (!v22)
      {
LABEL_19:

        id v5 = v23;
        goto LABEL_21;
      }
    }
  }
  [v5 addObject:v7];

LABEL_21:
  return v5;
}

- (id)tokenizedLowerCaseStringWithMinimumLength:()FCAdditions
{
  id v3 = a1;
  if (a1)
  {
    if ([a1 length] <= a3)
    {
      id v3 = (id)[v3 copy];
    }
    else
    {
      id v5 = objc_msgSend(v3, "fc_lowercaseTokensWithMinimumLength:", a3);
      unint64_t v6 = [v5 array];
      id v3 = [v6 componentsJoinedByString:@" "];
    }
  }
  return v3;
}

- (id)fc_stringByTrimmingWhiteSpace
{
  if ([a1 length])
  {
    v2 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    id v3 = [a1 stringByTrimmingCharactersInSet:v2];
  }
  else
  {
    id v3 = (void *)[a1 copy];
  }
  return v3;
}

- (id)fc_stringByRemovingPunctuation
{
  v2 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  id v3 = [a1 stringByRemovingCharactersInSet:v2];

  return v3;
}

- (id)stringByRemovingCharactersInSet:()FCAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 length];
  if (v4 && v5)
  {
    unint64_t v6 = [a1 componentsSeparatedByCharactersInSet:v4];
    id v7 = [v6 componentsJoinedByString:&stru_1EF8299B8];
  }
  else
  {
    id v7 = (void *)[a1 copy];
  }

  return v7;
}

- (id)fc_stringByReplacingPrefix:()FCAdditions withString:
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:options:range:", v7, v6, 0, 0, objc_msgSend(v7, "length"));

  return v8;
}

- (id)fc_stringByMultiplyingStringByCount:()FCAdditions
{
  for (uint64_t i = objc_opt_new(); a3; --a3)
    [i appendString:a1];
  return i;
}

- (id)fc_stringByReplacingOccurrencesOfStrings:()FCAdditions withString:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[a1 mutableCopy];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", *(void *)(*((void *)&v15 + 1) + 8 * i), v7, 0, 0, objc_msgSend(v8, "length", (void)v15));
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)fc_stringByPrefixingLinesWithString:()FCAdditions
{
  id v4 = NSString;
  id v5 = a3;
  id v6 = [v4 stringWithFormat:@"\n%@", v5];
  id v7 = [a1 stringByReplacingOccurrencesOfString:@"\n" withString:v6];
  uint64_t v8 = [NSString stringWithFormat:@"%@%@", v5, v7];

  return v8;
}

- (id)fc_stringByAppendingStringIfNeeded:()FCAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "string");
    *(_DWORD *)buf = 136315906;
    unint64_t v13 = "-[NSString(FCAdditions) fc_stringByAppendingStringIfNeeded:]";
    __int16 v14 = 2080;
    long long v15 = "NSString+FCAdditions.m";
    __int16 v16 = 1024;
    int v17 = 198;
    __int16 v18 = 2114;
    v19 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  unint64_t v5 = [a1 length];
  if (v5 >= [v4 length]
    && (objc_msgSend(a1, "substringFromIndex:", objc_msgSend(a1, "length") - objc_msgSend(v4, "length")),
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToString:v4],
        v6,
        v7))
  {
    uint64_t v8 = [a1 copy];
  }
  else
  {
    uint64_t v8 = [a1 stringByAppendingString:v4];
  }
  id v9 = (void *)v8;

  return v9;
}

- (id)fc_numberFollowingString:()FCAdditions
{
  id v4 = [NSString stringWithFormat:@"%@(\\d*)", a3];
  unint64_t v5 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v4 options:1 error:0];
  id v6 = objc_msgSend(v5, "firstMatchInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));
  if ([v6 numberOfRanges])
  {
    uint64_t v7 = [v6 rangeAtIndex:1];
    id v9 = objc_msgSend(a1, "substringWithRange:", v7, v8);
    id v10 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v10 setNumberStyle:1];
    uint64_t v11 = [v10 numberFromString:v9];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)fc_isValidCloudKitID
{
  return [a1 length] == 23;
}

- (uint64_t)fc_isValidCloudKitIDWithPrefix:()FCAdditions
{
  id v4 = a3;
  if (objc_msgSend(a1, "fc_isValidCloudKitID")) {
    uint64_t v5 = [a1 hasPrefix:v4];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)fc_isValidArticleID
{
  return objc_msgSend(a1, "fc_isValidCloudKitIDWithPrefix:", @"A");
}

- (uint64_t)fc_isValidIssueID
{
  return objc_msgSend(a1, "fc_isValidCloudKitIDWithPrefix:", @"I");
}

- (uint64_t)fc_isValidHardPaywallArticleID
{
  return objc_msgSend(a1, "fc_isValidCloudKitIDWithPrefix:", @"P");
}

- (uint64_t)fc_isValidTagID
{
  return objc_msgSend(a1, "fc_isValidCloudKitIDWithPrefix:", @"T");
}

- (uint64_t)fc_isValidPuzzleID
{
  return objc_msgSend(a1, "fc_isValidCloudKitIDWithPrefix:", @"J");
}

- (uint64_t)fc_isValidPuzzleTypeID
{
  return objc_msgSend(a1, "fc_isValidCloudKitIDWithPrefix:", @"Z");
}

- (uint64_t)fc_isValidSportsEventID
{
  return objc_msgSend(a1, "fc_isValidCloudKitIDWithPrefix:", @"V");
}

+ (id)fc_hardPaywallArticleIDWithArticleID:()FCAdditions
{
  id v3 = [a3 substringFromIndex:1];
  id v4 = objc_msgSend(v3, "nf_stringByReversingString");
  uint64_t v5 = [NSString stringWithFormat:@"P%@", v4];

  return v5;
}

- (uint64_t)fc_unsignedLongLongValue
{
  v2 = objc_opt_new();
  id v3 = [v2 numberFromString:a1];
  uint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

@end