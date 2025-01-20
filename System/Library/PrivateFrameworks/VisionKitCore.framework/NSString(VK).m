@interface NSString(VK)
+ (uint64_t)vk_NSAttachmentCharacterString;
- (BOOL)vk_containsAlphanumericCharacters;
- (BOOL)vk_containsNonWhitespaceAndAttachmentCharacters;
- (BOOL)vk_containsNonWhitespaceCharacters;
- (BOOL)vk_isLastCharacterInRangeANewlineForRange:()VK;
- (BOOL)vk_rangeIsValid:()VK;
- (NSUInteger)vk_safeCharacterRangeForRange:()VK;
- (__CFString)vk_checkedSubstringWithRange:()VK;
- (__CFString)vk_checkedSubstringWithVKRange:()VK;
- (__CFString)vk_stringByTrimmingLeadingCharactersInSet:()VK;
- (__CFString)vk_substringWithRange:()VK;
- (__CFString)vk_substringWithVKRange:()VK;
- (__CFString)vk_trailingTrimmedString;
- (id)vk_hexCodes;
- (id)vk_htmlStringEscapingQuotesAndLineBreaks;
- (id)vk_leadingTrimmedString;
- (id)vk_md5;
- (id)vk_rangesOfMatchesForString:()VK;
- (id)vk_sanitizedFilenameString;
- (id)vk_stringByRemovingAttachmentCharacters;
- (id)vk_stringByReplacingCharactersInSet:()VK withString:;
- (id)vk_stringByReplacingCharactersInStringMap:()VK;
- (id)vk_stringByReplacingNewlineCharactersWithWhiteSpace;
- (id)vk_substringToIndex:()VK;
- (id)vk_trimmedString;
- (id)vk_truncatedStringWithMaxLength:()VK truncated:;
- (id)vk_uniqueWordsWithMinLength:()VK;
- (uint64_t)vk_countOfCharactersInSet:()VK;
- (uint64_t)vk_isLastCharacterANewline;
- (uint64_t)vk_lengthOfLongestLine;
- (uint64_t)vk_lineRangeIgnoringLineBreakCharactersForIndex:()VK;
- (uint64_t)vk_numberOfLines;
- (uint64_t)vk_paragraphRangeForRange:()VK contentEnd:;
- (uint64_t)vk_range;
- (uint64_t)vk_stringReplacingUnsafeHTMLCharacters;
- (uint64_t)vk_stringReplacingUnsafeXMLCharacters;
- (uint64_t)vk_substringFromIndex:()VK;
- (uint64_t)vk_whitespaceAndNewlineCoalescedString;
- (uint64_t)vk_wordCount;
- (void)vk_enumerateContentLineRangesInRange:()VK usingBlock:;
- (void)vk_enumerateParagraphsInRange:()VK usingBlock:;
@end

@implementation NSString(VK)

- (uint64_t)vk_range
{
  return 0;
}

- (id)vk_hexCodes
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ([a1 length])
  {
    unint64_t v3 = 0;
    uint64_t v4 = *MEMORY[0x1E4F1C4E8];
    do
    {
      unsigned int v5 = [a1 characterAtIndex:v3];
      v6 = objc_msgSend(a1, "vk_substringWithRange:", v3, 1);
      v7 = [v6 stringByApplyingTransform:v4 reverse:0];
      [v2 appendFormat:@"%lu: U+%04x %@\n", v3, v5, v7];

      ++v3;
    }
    while (v3 < [a1 length]);
  }
  v8 = (void *)[v2 copy];

  return v8;
}

+ (uint64_t)vk_NSAttachmentCharacterString
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%C", 65532);
}

- (id)vk_md5
{
  v1 = [a1 dataUsingEncoding:4];
  id v2 = objc_msgSend(v1, "vk_md5");

  return v2;
}

- (id)vk_htmlStringEscapingQuotesAndLineBreaks
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v2 = [&unk_1F357DF40 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v12;
    do
    {
      uint64_t v5 = 0;
      v6 = v1;
      do
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(&unk_1F357DF40);
        }
        v7 = *(void **)(*((void *)&v11 + 1) + 8 * v5);
        v8 = [v7 objectAtIndexedSubscript:0];
        v9 = [v7 objectAtIndexedSubscript:1];
        id v1 = [v6 stringByReplacingOccurrencesOfString:v8 withString:v9];

        ++v5;
        v6 = v1;
      }
      while (v3 != v5);
      uint64_t v3 = [&unk_1F357DF40 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }
  return v1;
}

- (id)vk_trimmedString
{
  uint64_t v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v3 = [a1 stringByTrimmingCharactersInSet:v2];

  return v3;
}

- (__CFString)vk_trailingTrimmedString
{
  if ([a1 length])
  {
    uint64_t v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v3 = [a1 length] + 1;
    uint64_t v4 = &stru_1F35566F8;
    while (v3 - 2 >= 1)
    {
      --v3;
      if ((objc_msgSend(v2, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:")) & 1) == 0)
      {
        uint64_t v4 = [a1 substringToIndex:v3];
        break;
      }
    }
  }
  else
  {
    uint64_t v4 = &stru_1F35566F8;
  }
  return v4;
}

- (id)vk_leadingTrimmedString
{
  uint64_t v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v3 = objc_msgSend(a1, "vk_stringByTrimmingLeadingCharactersInSet:", v2);

  return v3;
}

- (uint64_t)vk_whitespaceAndNewlineCoalescedString
{
  if (vk_whitespaceAndNewlineCoalescedString_onceToken != -1) {
    dispatch_once(&vk_whitespaceAndNewlineCoalescedString_onceToken, &__block_literal_global_30);
  }
  uint64_t v2 = (void *)vk_whitespaceAndNewlineCoalescedString_regex;
  uint64_t v3 = [a1 length];
  return objc_msgSend(v2, "stringByReplacingMatchesInString:options:range:withTemplate:", a1, 0, 0, v3, @" ");
}

- (id)vk_sanitizedFilenameString
{
  id v1 = a1;
  if ([v1 length])
  {
    if ((unint64_t)[v1 length] >= 0x81)
    {
      uint64_t v2 = objc_msgSend(v1, "vk_substringToIndex:", 128);

      id v1 = (id)v2;
    }
    uint64_t v3 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"///\\?%*|\"<>:"];
    uint64_t v4 = objc_msgSend(v1, "vk_stringByReplacingCharactersInSet:withString:", v3, &stru_1F35566F8);

    uint64_t v5 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"."];
    v6 = (void *)[v5 mutableCopy];

    v7 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    [v6 formUnionWithCharacterSet:v7];

    id v1 = [v4 stringByTrimmingCharactersInSet:v6];
  }
  v8 = [v1 lastPathComponent];

  return v8;
}

- (BOOL)vk_rangeIsValid:()VK
{
  return a3 != 0x7FFFFFFFFFFFFFFFLL && a3 + a4 <= (unint64_t)[a1 length];
}

- (uint64_t)vk_lineRangeIgnoringLineBreakCharactersForIndex:()VK
{
  uint64_t location = objc_msgSend(a1, "lineRangeForRange:", a3, 0);
  NSUInteger length = v5;
  int v7 = [@"\u2028" characterAtIndex:0];
  NSUInteger v8 = location - 1;
  if (location - 1 >= 1)
  {
    do
    {
      if ([a1 characterAtIndex:v8] != v7) {
        break;
      }
      v16.uint64_t location = objc_msgSend(a1, "lineRangeForRange:", v8, 0);
      v16.NSUInteger length = v9;
      v14.uint64_t location = location;
      v14.NSUInteger length = length;
      NSRange v10 = NSUnionRange(v14, v16);
      uint64_t location = v10.location;
      NSUInteger length = v10.length;
      NSUInteger v8 = v10.location - 1;
    }
    while ((int64_t)(v10.location - 1) > 0);
  }
  for (NSUInteger i = location + length;
        (uint64_t)(i - 1) >= 0
     && i < [a1 length]
     && [a1 characterAtIndex:i - 1] == v7;
        NSUInteger i = v12.location + v12.length)
  {
    v15.uint64_t location = objc_msgSend(a1, "lineRangeForRange:", i, 0);
    v17.uint64_t location = location;
    v17.NSUInteger length = length;
    NSRange v12 = NSUnionRange(v15, v17);
    uint64_t location = v12.location;
    NSUInteger length = v12.length;
  }
  return location;
}

- (uint64_t)vk_stringReplacingUnsafeHTMLCharacters
{
  return objc_msgSend(a1, "vk_stringByReplacingCharactersInStringMap:", &unk_1F357DF70);
}

- (uint64_t)vk_stringReplacingUnsafeXMLCharacters
{
  return objc_msgSend(a1, "vk_stringByReplacingCharactersInStringMap:", &unk_1F357DF98);
}

- (id)vk_stringByRemovingAttachmentCharacters
{
  uint64_t v2 = objc_msgSend((id)objc_opt_class(), "vk_NSAttachmentCharacterString");
  uint64_t v3 = [a1 stringByReplacingOccurrencesOfString:v2 withString:&stru_1F35566F8];

  return v3;
}

- (uint64_t)vk_isLastCharacterANewline
{
  uint64_t v2 = [a1 length];
  return objc_msgSend(a1, "vk_isLastCharacterInRangeANewlineForRange:", 0, v2);
}

- (uint64_t)vk_numberOfLines
{
  uint64_t v2 = [a1 length];
  if (!v2) {
    return 0;
  }
  unint64_t v3 = v2;
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  do
  {
    uint64_t v6 = objc_msgSend(a1, "lineRangeForRange:", v5, 0);
    uint64_t v5 = v6 + v7;
    ++v4;
  }
  while (v6 + v7 < v3);
  return v4;
}

- (uint64_t)vk_wordCount
{
  uint64_t v7 = 0;
  NSUInteger v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v2 = objc_msgSend(a1, "vk_range");
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__NSString_VK__vk_wordCount__block_invoke;
  v6[3] = &unk_1E6BF34D0;
  v6[4] = &v7;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", v2, v3, 1539, v6);
  uint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)vk_uniqueWordsWithMinLength:()VK
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v6 = objc_alloc(MEMORY[0x1E4F28DF0]);
  v25[0] = *MEMORY[0x1E4F28540];
  uint64_t v7 = v25[0];
  NSUInteger v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  uint64_t v9 = (void *)[v6 initWithTagSchemes:v8 options:0];

  [v9 setString:a1];
  uint64_t v10 = [a1 length];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __44__NSString_VK__vk_uniqueWordsWithMinLength___block_invoke;
  v21[3] = &unk_1E6BF34F8;
  uint64_t v24 = a3;
  id v11 = v5;
  id v22 = v11;
  v23 = a1;
  objc_msgSend(v9, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v10, v7, 6, v21);
  uint64_t v15 = 0;
  NSRange v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__14;
  v19 = __Block_byref_object_dispose__14;
  id v20 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __44__NSString_VK__vk_uniqueWordsWithMinLength___block_invoke_135;
  v14[3] = &unk_1E6BF3520;
  v14[4] = &v15;
  [v11 enumerateObjectsUsingBlock:v14];
  NSRange v12 = (void *)[(id)v16[5] copy];
  _Block_object_dispose(&v15, 8);

  return v12;
}

- (BOOL)vk_containsNonWhitespaceCharacters
{
  uint64_t v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v3 = [v2 invertedSet];

  BOOL v4 = [a1 rangeOfCharacterFromSet:v3] != 0x7FFFFFFFFFFFFFFFLL;
  return v4;
}

- (BOOL)vk_containsNonWhitespaceAndAttachmentCharacters
{
  uint64_t v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v3 = (void *)[v2 mutableCopy];

  BOOL v4 = objc_msgSend((id)objc_opt_class(), "vk_NSAttachmentCharacterString");
  [v3 addCharactersInString:v4];

  id v5 = [v3 invertedSet];
  BOOL v6 = [a1 rangeOfCharacterFromSet:v5] != 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

- (BOOL)vk_containsAlphanumericCharacters
{
  uint64_t v2 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  BOOL v3 = [a1 rangeOfCharacterFromSet:v2] != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (void)vk_enumerateParagraphsInRange:()VK usingBlock:
{
  NSUInteger v8 = a5;
  unint64_t v9 = a3 + a4;
  unint64_t v10 = [a1 length];
  if (v9 >= v10) {
    unint64_t v9 = v10;
  }
  char v14 = 0;
  do
  {
    if (a3 >= v9) {
      break;
    }
    unint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v11 = 0;
    objc_msgSend(a1, "getParagraphStart:end:contentsEnd:forRange:", &v13, &v12, &v11, a3, 0);
    v8[2](v8, v13, v12, v11, &v14);
    a3 = v12;
  }
  while (!v14);
}

- (void)vk_enumerateContentLineRangesInRange:()VK usingBlock:
{
  NSUInteger v8 = a5;
  unint64_t v9 = a3 + a4;
  unint64_t v10 = [a1 length];
  unint64_t v14 = 0;
  unint64_t v15 = a3;
  if (v9 >= v10) {
    unint64_t v9 = v10;
  }
  uint64_t v13 = 0;
  char v12 = 0;
  do
  {
    objc_msgSend(a1, "getLineStart:end:contentsEnd:forRange:", &v15, &v14, &v13, a3, 0);
    v8[2](v8, v15, v13 - v15, &v12);
    a3 = v14;
    unint64_t v15 = v14;
  }
  while (v14 < v9 && v12 == 0);
}

- (uint64_t)vk_substringFromIndex:()VK
{
  uint64_t v2 = objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:");
  return [a1 substringFromIndex:v2];
}

- (id)vk_substringToIndex:()VK
{
  if ([a1 length])
  {
    uint64_t v5 = [a1 length];
    if (v5 - 1 >= a3) {
      unint64_t v6 = a3;
    }
    else {
      unint64_t v6 = v5 - 1;
    }
    uint64_t v7 = [a1 rangeOfComposedCharacterSequenceAtIndex:v6];
    unint64_t v9 = [a1 substringToIndex:v7 + v8];
  }
  else
  {
    unint64_t v9 = (void *)[a1 copy];
  }
  return v9;
}

- (__CFString)vk_substringWithRange:()VK
{
  uint64_t v7 = objc_msgSend(a1, "vk_range");
  uint64_t v9 = VKMClampRange(a3, a4, v7, v8);
  if (v10)
  {
    uint64_t v11 = objc_msgSend(a1, "rangeOfComposedCharacterSequencesForRange:", v9, v10);
    objc_msgSend(a1, "substringWithRange:", v11, v12);
    uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v13 = &stru_1F35566F8;
  }
  return v13;
}

- (__CFString)vk_substringWithVKRange:()VK
{
  id v4 = a3;
  if ([v4 isEmpty])
  {
    uint64_t v5 = &stru_1F35566F8;
  }
  else if ([v4 containsMultipleRanges])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    uint64_t v7 = [v4 rangeArray];
    uint64_t v8 = [v7 count];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __40__NSString_VK__vk_substringWithVKRange___block_invoke;
    v13[3] = &unk_1E6BF3548;
    id v14 = v6;
    unint64_t v15 = a1;
    uint64_t v16 = v8;
    id v9 = v6;
    [v7 enumerateObjectsUsingBlock:v13];
    uint64_t v5 = (__CFString *)[v9 copy];
  }
  else
  {
    uint64_t v10 = [v4 nsRange];
    objc_msgSend(a1, "vk_substringWithRange:", v10, v11);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (__CFString)vk_checkedSubstringWithRange:()VK
{
  if (objc_msgSend(a1, "vk_rangeIsValid:"))
  {
    objc_msgSend(a1, "vk_substringWithRange:", a3, a4);
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v7 = &stru_1F35566F8;
  }
  return v7;
}

- (__CFString)vk_checkedSubstringWithVKRange:()VK
{
  id v4 = a3;
  uint64_t v5 = [v4 nsRange];
  if (objc_msgSend(a1, "vk_rangeIsValid:", v5, v6))
  {
    objc_msgSend(a1, "vk_substringWithVKRange:", v4);
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v7 = &stru_1F35566F8;
  }

  return v7;
}

- (id)vk_stringByReplacingNewlineCharactersWithWhiteSpace
{
  uint64_t v2 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  BOOL v3 = objc_msgSend(a1, "vk_stringByReplacingCharactersInSet:withString:", v2, @" ");

  return v3;
}

- (id)vk_stringByReplacingCharactersInSet:()VK withString:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  uint64_t v9 = [v8 rangeOfCharacterFromSet:v6];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v12 = v9;
    uint64_t v13 = v10;
    uint64_t v11 = 0;
    do
    {
      if (!v11) {
        uint64_t v11 = (void *)[v8 mutableCopy];
      }
      objc_msgSend(v11, "replaceCharactersInRange:withString:", v12, v13, v7);
      uint64_t v12 = objc_msgSend(v11, "rangeOfCharacterFromSet:options:range:", v6, 2, v12, objc_msgSend(v11, "length") - v12);
      uint64_t v13 = v14;
    }
    while (v12 != 0x7FFFFFFFFFFFFFFFLL);
    if (v11)
    {
      uint64_t v15 = [v11 copy];

      id v8 = (id)v15;
    }
  }

  return v8;
}

- (id)vk_stringByReplacingCharactersInStringMap:()VK
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v26 = a1;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v5, "appendString:", @"(");
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v25 = v4;
  id v6 = [v4 allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = [MEMORY[0x1E4F28FD8] escapedPatternForString:*(void *)(*((void *)&v38 + 1) + 8 * i)];
        [v5 appendString:v10];

        [v5 appendString:@"|"];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v7);
  }

  if ([v5 length]) {
    objc_msgSend(v5, "replaceCharactersInRange:withString:", objc_msgSend(v5, "length") - 1, 1, &stru_1F35566F8);
  }
  [v5 appendString:@""]);
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:v5 options:0 error:0];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__14;
  v36 = __Block_byref_object_dispose__14;
  id v37 = 0;
  uint64_t v11 = [v26 length];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __58__NSString_VK__vk_stringByReplacingCharactersInStringMap___block_invoke;
  v31[3] = &unk_1E6BF3570;
  v31[4] = &v32;
  objc_msgSend(v24, "enumerateMatchesInString:options:range:usingBlock:", v26, 0, 0, v11, v31);
  if ([(id)v33[5] count]) {
    uint64_t v12 = (void *)[v26 mutableCopy];
  }
  else {
    uint64_t v12 = 0;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v13 = [(id)v33[5] reverseObjectEnumerator];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = [*(id *)(*((void *)&v27 + 1) + 8 * j) rangeValue];
        uint64_t v19 = v18;
        id v20 = objc_msgSend(v26, "substringWithRange:", v17, v18);
        v21 = [v25 objectForKeyedSubscript:v20];
        if (v21) {
          objc_msgSend(v12, "replaceCharactersInRange:withString:", v17, v19, v21);
        }
        else {
          +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[NSString(VK) vk_stringByReplacingCharactersInStringMap:]", 0, 0, @"nil replacement string replacestring map");
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v42 count:16];
    }
    while (v14);
  }

  if (v12)
  {
    uint64_t v22 = [v12 copy];

    id v26 = (id)v22;
  }

  _Block_object_dispose(&v32, 8);
  return v26;
}

- (uint64_t)vk_paragraphRangeForRange:()VK contentEnd:
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v7 = 0;
  objc_msgSend(a1, "getParagraphStart:end:contentsEnd:forRange:", &v9, &v8, &v7, a3, a4);
  if (a5) {
    *a5 = v7;
  }
  return v9;
}

- (uint64_t)vk_lengthOfLongestLine
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__NSString_VK__vk_lengthOfLongestLine__block_invoke;
  v3[3] = &unk_1E6BF3520;
  v3[4] = &v4;
  [a1 enumerateLinesUsingBlock:v3];
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (BOOL)vk_isLastCharacterInRangeANewlineForRange:()VK
{
  uint64_t v7 = objc_msgSend(a1, "vk_safeCharacterRangeForRange:");
  BOOL v9 = 0;
  if (a3 == v7 && a4 == v8)
  {
    uint64_t v10 = objc_msgSend(a1, "vk_substringWithRange:", v7, v8);
    if ([v10 length]) {
      BOOL v9 = objc_msgSend(v10, "characterAtIndex:", objc_msgSend(v10, "length") - 1) == 10;
    }
    else {
      BOOL v9 = 0;
    }
  }
  return v9;
}

- (NSUInteger)vk_safeCharacterRangeForRange:()VK
{
  NSUInteger v6 = [a1 length];
  if (v6 == a3) {
    return a3;
  }
  v7.NSUInteger length = v6;
  if (v6 < a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v9.uint64_t location = a3;
  v9.NSUInteger length = a4;
  v7.uint64_t location = 0;
  return NSIntersectionRange(v9, v7).location;
}

- (uint64_t)vk_countOfCharactersInSet:()VK
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v4, 0, 0, objc_msgSend(a1, "length"));
  uint64_t v6 = 0;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v5;
    uint64_t v6 = 0;
    do
    {
      ++v6;
      uint64_t v7 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v4, 0, v7 + 1, objc_msgSend(a1, "length") + ~v7);
    }
    while (v7 != 0x7FFFFFFFFFFFFFFFLL);
  }

  return v6;
}

- (__CFString)vk_stringByTrimmingLeadingCharactersInSet:()VK
{
  id v4 = [a3 invertedSet];
  uint64_t v5 = [a1 rangeOfCharacterFromSet:v4];

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = &stru_1F35566F8;
  }
  else if (v5)
  {
    objc_msgSend(a1, "vk_substringFromIndex:", v5);
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = a1;
  }
  return v6;
}

- (id)vk_truncatedStringWithMaxLength:()VK truncated:
{
  if (a4) {
    *a4 = 0;
  }
  if ([a1 length] <= a3)
  {
    id v9 = a1;
  }
  else
  {
    uint64_t v7 = objc_msgSend(a1, "vk_substringWithRange:", 0, a3);
    uint64_t v8 = [v7 length];
    if (v8 == [a1 length])
    {
      id v9 = v7;
    }
    else
    {
      uint64_t v10 = objc_msgSend(v7, "vk_trailingTrimmedString");
      id v9 = [v10 stringByAppendingString:@"…"];

      if (a4) {
        *a4 = 1;
      }
    }
  }
  return v9;
}

- (id)vk_rangesOfMatchesForString:()VK
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v4 length])
  {
    id v44 = v4;
    id v6 = v4;
    id v7 = a1;
    uint64_t v8 = [v6 length];
    uint64_t v9 = *MEMORY[0x1E4F28540];
    id v50 = 0;
    v48 = v6;
    id v10 = (id)objc_msgSend(v6, "linguisticTagsInRange:scheme:options:orthography:tokenRanges:", 0, v8, v9, 6, 0, &v50);
    id v11 = v50;
    id v49 = 0;
    v47 = v7;
    id v12 = (id)objc_msgSend(v7, "linguisticTagsInRange:scheme:options:orthography:tokenRanges:", 0, objc_msgSend(v7, "length"), v9, 6, 0, &v49);
    id v13 = v49;
    if ([v13 count])
    {
      unint64_t v14 = 0;
      id v45 = v11;
      id v46 = v5;
      do
      {
        if (![v11 count]) {
          break;
        }
        uint64_t v15 = [v13 objectAtIndex:v14];
        uint64_t v16 = [v15 rangeValue];
        unint64_t v18 = v17;

        unint64_t v19 = 0;
        uint64_t v20 = 0;
        do
        {
          if (v20 && v20 + v14 < [v13 count])
          {
            v21 = [v13 objectAtIndex:v20 + v14];
            uint64_t v16 = [v21 rangeValue];
            unint64_t v18 = v22;
          }
          v23 = [v11 objectAtIndex:v19];
          uint64_t v24 = [v23 rangeValue];
          unint64_t v26 = v25;

          if (v26 <= v18)
          {
            long long v28 = objc_msgSend(v48, "substringWithRange:", v24, v26);
            if (objc_msgSend(v47, "rangeOfString:options:range:", v28, 137, v16, v18) != 0x7FFFFFFFFFFFFFFFLL)
            {
              if (v20 || (unint64_t v30 = v29, v29 == v18) || [v11 count] == 1 || v30 >= 2) {
                ++v20;
              }
              else {
                uint64_t v20 = 0;
              }
            }
            p_superclass = &OBJC_METACLASS___VKCRemoveBackgroundResult.superclass;
          }
          else
          {
            p_superclass = (__objc2_class **)(&OBJC_METACLASS___VKCRemoveBackgroundResult + 8);
          }
          ++v19;
        }
        while (v19 < [v11 count] && v20 + v14 < objc_msgSend(v13, "count"));
        if (v20)
        {
          uint64_t v31 = v20;
          unint64_t v32 = v14;
          id v5 = v46;
          v33 = p_superclass;
          if (v14 < v20 + v14)
          {
            do
            {
              uint64_t v34 = [v13 objectAtIndex:v32];
              uint64_t v35 = [v34 rangeValue];
              v36 = v5;
              uint64_t v38 = v37;

              id v39 = objc_alloc((Class)(v33 + 209));
              uint64_t v40 = v38;
              id v5 = v36;
              long long v41 = objc_msgSend(v39, "initWithRange:", v35, v40);
              [v36 addObject:v41];

              ++v32;
              --v31;
            }
            while (v31);
          }
          unint64_t v14 = v14 + v20 - 1;
          id v11 = v45;
        }
        else
        {
          id v5 = v46;
        }
        ++v14;
      }
      while (v14 < [v13 count]);
    }
    id v42 = (id)[v5 copy];

    id v4 = v44;
  }
  else
  {
    id v42 = v5;
  }

  return v42;
}

@end