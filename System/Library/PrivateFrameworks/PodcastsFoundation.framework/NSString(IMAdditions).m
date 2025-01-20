@interface NSString(IMAdditions)
+ (double)durationWithHMSString:()IMAdditions;
+ (id)UUID;
+ (id)durationFormatter;
+ (id)stringWithDuration:()IMAdditions;
+ (uint64_t)stringWithBytesize:()IMAdditions;
+ (uint64_t)stringWithBytesize:()IMAdditions countStyle:;
- (BOOL)containsSubstring:()IMAdditions;
- (BOOL)isWhitespace;
- (__CFString)im_stringByMemoryEfficientTrimmingCharactersInSet:()IMAdditions;
- (__CFString)im_uppercaseStringWithLocale:()IMAdditions;
- (__CFString)pf_stringWithPercentEscape;
- (__CFString)stringByRemovingPercentEscapes;
- (id)URLFragmentString;
- (id)dictionaryByDecomposingQueryStringWithURLDecode:()IMAdditions;
- (id)iTunesSortString;
- (id)stringByConvertingControlCharactersToSpace;
- (id)stringByConvertingNewlineCharacterSetToSpace;
- (id)stringByEnclosingInQuotes;
- (id)stringByRemovingEnclosingQuotations;
- (id)stringByRemovingURLFragment;
- (id)stringByStrippingHTML;
- (id)stringByTruncatingToLength:()IMAdditions options:truncationString:;
- (uint64_t)hasHTML;
- (uint64_t)imIsDefaultWritingMode;
- (uint64_t)imIsHorizontalWritingMode;
- (uint64_t)imIsVerticalWritingMode;
- (uint64_t)isNotWhitespace;
- (uint64_t)rangeOfSignificantSubstring;
- (uint64_t)stringByRemovingInsignificantPrefix;
- (uint64_t)tokenCountWithEnumerationOptions:()IMAdditions maxTokenCount:outLimitLength:;
- (unint64_t)unsignedLongLongValue;
@end

@implementation NSString(IMAdditions)

- (uint64_t)hasHTML
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)hasHTML_htmlPatterns;
  if (!hasHTML_htmlPatterns)
  {
    v3 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(<[^>\\n]+>)" options:0 error:0];
    v20[0] = v3;
    v4 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(&#\\d+;)" options:0 error:0];
    v20[1] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    uint64_t v6 = [v5 copy];
    v7 = (void *)hasHTML_htmlPatterns;
    hasHTML_htmlPatterns = v6;

    v2 = (void *)hasHTML_htmlPatterns;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v2;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "firstMatchInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length", (void)v15));

        if (v13)
        {

          return 1;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  if (hasHTML_onceToken != -1) {
    dispatch_once(&hasHTML_onceToken, &__block_literal_global_11);
  }
  return objc_msgSend(a1, "containsMatchIn:", hasHTML_trie, (void)v15);
}

- (__CFString)im_stringByMemoryEfficientTrimmingCharactersInSet:()IMAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 length];
  if (!v5) {
    goto LABEL_17;
  }
  uint64_t v6 = v5;
  unint64_t v7 = 0;
  id v8 = &stru_1F03A51F0;
  while (objc_msgSend(v4, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v7)))
  {
    if (v6 == ++v7) {
      goto LABEL_19;
    }
  }
  if (v6 == v7) {
    goto LABEL_14;
  }
  uint64_t v9 = v6 - 1;
  if (v6 - 1 <= v7)
  {
    unint64_t v10 = 0;
  }
  else
  {
    unint64_t v10 = 0;
    while (objc_msgSend(v4, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v9)))
    {
      ++v10;
      --v9;
      if (~v7 + v6 == v10)
      {
        unint64_t v10 = ~v7 + v6;
        break;
      }
    }
  }
  if (v6 - v10 == v7)
  {
LABEL_14:
    id v8 = &stru_1F03A51F0;
    goto LABEL_19;
  }
  if (v7 | v10)
  {
    objc_msgSend(a1, "substringWithRange:", v7, v6 - v10 - v7);
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_17:
    uint64_t v11 = a1;
  }
  id v8 = v11;
LABEL_19:

  return v8;
}

+ (id)durationFormatter
{
  v0 = [MEMORY[0x1E4F29060] currentThread];
  v1 = [v0 threadDictionary];

  id v2 = [v1 objectForKey:@"kIMDurationNumberFormatterKey"];
  if (!v2)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    v3 = [MEMORY[0x1E4F1CA20] currentLocale];
    [v2 setLocale:v3];

    [v1 setObject:v2 forKey:@"kIMDurationNumberFormatterKey"];
  }

  return v2;
}

+ (id)UUID
{
  v0 = [MEMORY[0x1E4F29128] UUID];
  v1 = [v0 UUIDString];

  return v1;
}

- (id)URLFragmentString
{
  uint64_t v2 = [a1 rangeOfString:@"#"];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    v3 = [a1 substringFromIndex:v2 + 1];
  }
  return v3;
}

- (id)stringByRemovingURLFragment
{
  id v1 = a1;
  uint64_t v2 = [v1 rangeOfString:@"#"];
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v3 = [v1 substringToIndex:v2];

    id v1 = (id)v3;
  }
  return v1;
}

- (id)stringByConvertingControlCharactersToSpace
{
  uint64_t v2 = [MEMORY[0x1E4F28B88] controlCharacterSet];
  uint64_t v3 = [a1 rangeOfCharacterFromSet:v2];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = a1;
  }
  else
  {
    uint64_t v6 = v3;
    uint64_t v7 = v4;
    id v5 = [MEMORY[0x1E4F28E78] stringWithString:a1];
    uint64_t v8 = v6 + v7;
    uint64_t v9 = [v5 length] - (v6 + v7);
    do
    {
      objc_msgSend(v5, "replaceCharactersInRange:withString:", v6, v7, @" ");
      uint64_t v10 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:range:", v2, 0, v8, v9);
      uint64_t v12 = v11 - (v6 + v7) + v10;
      v8 += v12;
      v9 -= v12;
      uint64_t v7 = v11;
      uint64_t v6 = v10;
    }
    while (v10 != 0x7FFFFFFFFFFFFFFFLL);
  }

  return v5;
}

- (id)stringByConvertingNewlineCharacterSetToSpace
{
  uint64_t v2 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  uint64_t v3 = [a1 rangeOfCharacterFromSet:v2];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = a1;
  }
  else
  {
    uint64_t v6 = v3;
    uint64_t v7 = v4;
    id v5 = [MEMORY[0x1E4F28E78] stringWithString:a1];
    uint64_t v8 = v6 + v7;
    uint64_t v9 = [v5 length] - (v6 + v7);
    do
    {
      objc_msgSend(v5, "replaceCharactersInRange:withString:", v6, v7, @" ");
      uint64_t v10 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:range:", v2, 0, v8, v9);
      uint64_t v12 = v11 - (v6 + v7) + v10;
      v8 += v12;
      v9 -= v12;
      uint64_t v7 = v11;
      uint64_t v6 = v10;
    }
    while (v10 != 0x7FFFFFFFFFFFFFFFLL);
  }

  return v5;
}

- (__CFString)pf_stringWithPercentEscape
{
  id v1 = (__CFString *)CFURLCreateStringByAddingPercentEscapes(0, originalString, 0, @"\uFFFC!$&'()+,/:;=?@",
                       0x8000100u);
  return v1;
}

- (__CFString)stringByRemovingPercentEscapes
{
  id v1 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], originalString, &stru_1F03A51F0);
  return v1;
}

- (id)stringByStrippingHTML
{
  if ([a1 length])
  {
    id v2 = a1;
    Memory = htmlReadMemory((const char *)[v2 UTF8String], objc_msgSend(v2, "lengthOfBytesUsingEncoding:", 4), 0, "utf8", 2401);
    uint64_t v4 = [MEMORY[0x1E4F28E78] string];
    appendTextFromNodeRecursively((uint64_t)Memory, v4);
    id v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v6 = [v4 stringByTrimmingCharactersInSet:v5];

    xmlFreeDoc(Memory);
  }
  else
  {
    id v6 = a1;
  }
  return v6;
}

- (BOOL)containsSubstring:()IMAdditions
{
  return [a1 rangeOfString:a3 options:2] != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isWhitespace
{
  id v2 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  uint64_t v3 = [a1 stringByTrimmingCharactersInSet:v2];
  BOOL v4 = [v3 length] == 0;

  return v4;
}

- (uint64_t)isNotWhitespace
{
  return [a1 isWhitespace] ^ 1;
}

- (id)iTunesSortString
{
  id v1 = (void *)[a1 copyWithoutInsignificantPrefixAndCharacters];
  return v1;
}

+ (id)stringWithDuration:()IMAdditions
{
  int v2 = (int)a2;
  uint64_t v3 = ((int)a2 / 60 % 60);
  BOOL v4 = [a1 durationFormatter];
  [v4 setMinimumIntegerDigits:1];
  id v5 = [MEMORY[0x1E4F28ED0] numberWithInt:(v2 / 3600)];
  id v6 = [v4 stringFromNumber:v5];

  if (v2 < 3600)
  {
    v13 = [MEMORY[0x1E4F28ED0] numberWithInt:v3];
    uint64_t v8 = [v4 stringFromNumber:v13];

    [v4 setMaximumIntegerDigits:2];
    [v4 setMinimumIntegerDigits:2];
    v14 = [MEMORY[0x1E4F28ED0] numberWithInt:(v2 % 60)];
    uint64_t v10 = [v4 stringFromNumber:v14];

    long long v15 = [MEMORY[0x1E4F28B50] podcastsFoundationBundle];
    uint64_t v12 = [v15 localizedStringForKey:@"DURATION_FORMAT_MINUTES" value:&stru_1F03A51F0 table:0];

    [NSString stringWithValidatedFormat:v12, @"%@ %@", 0, v8, v10, v18 validFormatSpecifiers error];
  }
  else
  {
    [v4 setMaximumIntegerDigits:2];
    [v4 setMinimumIntegerDigits:2];
    uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithInt:v3];
    uint64_t v8 = [v4 stringFromNumber:v7];

    uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithInt:(v2 % 60)];
    uint64_t v10 = [v4 stringFromNumber:v9];

    uint64_t v11 = [MEMORY[0x1E4F28B50] podcastsFoundationBundle];
    uint64_t v12 = [v11 localizedStringForKey:@"DURATION_FORMAT_HOURS" value:&stru_1F03A51F0 table:0];

    [NSString stringWithValidatedFormat:v12, @"%@ %@ %@", 0, v6, v8, v10 validFormatSpecifiers error];
  long long v16 = };

  return v16;
}

+ (double)durationWithHMSString:()IMAdditions
{
  uint64_t v3 = [a3 componentsSeparatedByString:@":"];
  double v4 = 0.0;
  if ([v3 count])
  {
    id v5 = objc_msgSend(v3, "objectAtIndex:", objc_msgSend(v3, "count") - 1);
    int v6 = [v5 intValue];

    if ((unint64_t)[v3 count] < 2)
    {
      int v8 = 0;
    }
    else
    {
      uint64_t v7 = objc_msgSend(v3, "objectAtIndex:", objc_msgSend(v3, "count") - 2);
      int v8 = [v7 intValue];

      if ((unint64_t)[v3 count] >= 3)
      {
        uint64_t v9 = objc_msgSend(v3, "objectAtIndex:", objc_msgSend(v3, "count") - 3);
        int v10 = [v9 intValue];

        double v4 = (double)v10 * 60.0;
      }
    }
  }
  else
  {
    int v8 = 0;
    int v6 = 0;
  }

  return (double)(60 * v8) + v4 * 60.0 + (double)v6;
}

+ (uint64_t)stringWithBytesize:()IMAdditions
{
  return [a1 stringWithBytesize:a3 countStyle:2];
}

+ (uint64_t)stringWithBytesize:()IMAdditions countStyle:
{
  return objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:");
}

- (id)dictionaryByDecomposingQueryStringWithURLDecode:()IMAdditions
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  int v6 = [a1 componentsSeparatedByString:@"&"];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    int v10 = @"=";
    do
    {
      uint64_t v11 = 0;
      uint64_t v22 = v8;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = [*(id *)(*((void *)&v23 + 1) + 8 * v11) componentsSeparatedByString:v10];
        if ([v12 count] == 2)
        {
          v13 = [v12 objectAtIndex:0];
          v14 = [v12 objectAtIndex:1];
          if (a3)
          {
            [v13 stringByRemovingPercentEncoding];
            uint64_t v15 = v9;
            long long v16 = v10;
            long long v17 = v6;
            uint64_t v18 = a3;
            uint64_t v20 = v19 = v5;

            v13 = (void *)v20;
            id v5 = v19;
            a3 = v18;
            int v6 = v17;
            int v10 = v16;
            uint64_t v9 = v15;
            uint64_t v8 = v22;
          }
          [v5 setObject:v14 forKey:v13];
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  return v5;
}

- (uint64_t)rangeOfSignificantSubstring
{
  int v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"an", @"a", @"the", 0);
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  char v12 = 0;
  uint64_t v3 = [a1 length];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__NSString_IMAdditions__rangeOfSignificantSubstring__block_invoke;
  v7[3] = &unk_1E5E62A00;
  uint64_t v9 = &v13;
  int v10 = v11;
  id v4 = v2;
  id v8 = v4;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v3, 3, v7);
  uint64_t v5 = v14[3];
  [a1 length];

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);

  return v5;
}

- (uint64_t)stringByRemovingInsignificantPrefix
{
  uint64_t v3 = [a1 rangeOfSignificantSubstring];
  return objc_msgSend(a1, "substringWithRange:", v3, v2);
}

- (uint64_t)tokenCountWithEnumerationOptions:()IMAdditions maxTokenCount:outLimitLength:
{
  if (a5) {
    *a5 = [a1 length];
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v9 = [a1 length];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__NSString_IMAdditions__tokenCountWithEnumerationOptions_maxTokenCount_outLimitLength___block_invoke;
  v12[3] = &unk_1E5E62A28;
  v12[4] = &v13;
  v12[5] = a4;
  v12[6] = a5;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, a3, v12);
  uint64_t v10 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (id)stringByTruncatingToLength:()IMAdditions options:truncationString:
{
  id v8 = a5;
  if ([a1 length] <= a3)
  {
    id v13 = a1;
  }
  else
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    uint64_t v9 = [a1 length];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __77__NSString_IMAdditions__stringByTruncatingToLength_options_truncationString___block_invoke;
    v16[3] = &unk_1E5E62A50;
    unint64_t v19 = a3;
    id v10 = v8;
    id v17 = v10;
    uint64_t v18 = &v20;
    objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, a4, v16);
    unint64_t v11 = v21[3];
    if (!v11)
    {
      v21[3] = a3;
      unint64_t v11 = a3;
    }
    char v12 = [a1 substringToIndex:v11];
    id v13 = v12;
    if (v10)
    {
      uint64_t v14 = [v12 stringByAppendingString:v10];

      id v13 = (id)v14;
    }

    _Block_object_dispose(&v20, 8);
  }

  return v13;
}

- (id)stringByEnclosingInQuotes
{
  id v1 = [a1 stringByRemovingEnclosingQuotations];
  uint64_t v2 = NSString;
  uint64_t v3 = [MEMORY[0x1E4F28B50] mainBundle];
  id v4 = [v3 localizedStringForKey:@"Quoted_Text_Format" value:@"“%@”" table:0];
  uint64_t v5 = objc_msgSend(v2, "stringWithFormat:", v4, v1);

  return v5;
}

- (__CFString)im_uppercaseStringWithLocale:()IMAdditions
{
  CFLocaleRef v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [a1 uppercaseStringWithLocale:v4];
  }
  else
  {
    uint64_t v5 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:a1];
    CFStringUppercase(v5, v4);
  }

  return v5;
}

- (id)stringByRemovingEnclosingQuotations
{
  id v1 = a1;
  uint64_t v2 = (void *)MEMORY[0x1E4F28B88];
  uint64_t v3 = [MEMORY[0x1E4F28B50] mainBundle];
  CFLocaleRef v4 = [v3 localizedStringForKey:@"Quotes_Character_Set" value:@"\"“'‘’”" table:0];
  uint64_t v5 = [v2 characterSetWithCharactersInString:v4];

  uint64_t v6 = objc_msgSend(v1, "rangeOfCharacterFromSet:options:range:", v5, 0, 0, 1);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = objc_msgSend(v1, "stringByReplacingCharactersInRange:withString:", v6, v7, &stru_1F03A51F0);

    id v1 = (id)v8;
  }
  if ((unint64_t)[v1 length] >= 2)
  {
    uint64_t v9 = objc_msgSend(v1, "rangeOfCharacterFromSet:options:range:", v5, 0, objc_msgSend(v1, "length") - 1, 1);
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = objc_msgSend(v1, "stringByReplacingCharactersInRange:withString:", v9, v10, &stru_1F03A51F0);

      id v1 = (id)v11;
    }
  }

  return v1;
}

- (unint64_t)unsignedLongLongValue
{
  id v1 = (const char *)[a1 UTF8String];
  return strtoull(v1, 0, 0);
}

- (uint64_t)imIsDefaultWritingMode
{
  if ([a1 imIsVerticalWritingMode]) {
    return 0;
  }
  else {
    return [a1 imIsHorizontalWritingMode] ^ 1;
  }
}

- (uint64_t)imIsHorizontalWritingMode
{
  return [a1 isEqualToString:@"horizontal"];
}

- (uint64_t)imIsVerticalWritingMode
{
  return [a1 isEqualToString:@"vertical"];
}

@end