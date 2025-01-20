@interface NSString(IC)
+ (BOOL)ic_isCharacterInlineAttachmentPrefix:()IC;
+ (__CFString)ic_ellipsisCharacterString;
+ (__CFString)ic_equalsSignCharacterString;
+ (__CFString)ic_fullWidthEqualsSignCharacterString;
+ (__CFString)ic_hashtagCharacterString;
+ (__CFString)ic_leftToRightCharacterString;
+ (__CFString)ic_mentionCharacterString;
+ (__CFString)ic_rightToLeftCharacterString;
+ (__CFString)ic_shortNameFromGivenName:()IC familyName:;
+ (__CFString)ic_thinSpaceCharacterString;
+ (id)ic_calculateEqualsSignString;
+ (id)ic_calculateGraphExpressionString;
+ (id)ic_newURLForContentID:()IC percentEscaped:;
+ (uint64_t)ic_attachmentCharacterString;
+ (uint64_t)ic_nonDelimeterSet;
- (BOOL)ic_canConvertToTag;
- (BOOL)ic_containsAlphanumericCharacters;
- (BOOL)ic_containsNonWhitespaceAndAttachmentCharacters;
- (BOOL)ic_containsNonWhitespaceCharacters;
- (BOOL)ic_containsWhitespaceCharacters;
- (BOOL)ic_isCaseInsensitiveEqualToString:()IC;
- (BOOL)ic_isLastCharacterInRangeANewlineForRange:()IC;
- (BOOL)ic_range:()IC onlyContainsCharacterSet:;
- (BOOL)ic_rangeIsValid:()IC;
- (NSUInteger)ic_safeCharacterRangeForRange:()IC;
- (__CFString)ic_hashtagDisplayText;
- (__CFString)ic_stringByTrimmingLeadingCharactersInSet:()IC;
- (__CFString)ic_trailingTrimmedString;
- (id)ic_attributedString;
- (id)ic_checkedSubstringWithRange:()IC;
- (id)ic_htmlStringEscapingQuotesAndLineBreaks;
- (id)ic_leadingTrimmedString;
- (id)ic_leftToRightString;
- (id)ic_md5;
- (id)ic_mentionString;
- (id)ic_nilWhenEmpty;
- (id)ic_rightToLeftString;
- (id)ic_sanitizedFilenameString;
- (id)ic_sha256;
- (id)ic_stringByRemovingAttachmentCharacters;
- (id)ic_stringByRemovingLanguageDirectionCharacters;
- (id)ic_stringByRemovingWhitespaceOnlyLines;
- (id)ic_stringByReplacingCharactersInSet:()IC withString:;
- (id)ic_stringByReplacingCharactersInStringMap:()IC;
- (id)ic_stringByReplacingLeadingFullWidthHashSignIfPossible;
- (id)ic_stringByReplacingNewlineCharactersWithWhiteSpace;
- (id)ic_stringWithoutSuffix:()IC;
- (id)ic_substringToIndex:()IC;
- (id)ic_tokenSafeText;
- (id)ic_trimmedString;
- (id)ic_truncatedStringWithMaxLength:()IC truncated:;
- (id)ic_uniqueWordsWithMinLength:()IC;
- (id)ic_withHashtagPrefix;
- (id)ic_withoutHashtagPrefix;
- (uint64_t)ic_containsHashtagPrefix;
- (uint64_t)ic_countOfCharactersInSet:()IC;
- (uint64_t)ic_dataValue;
- (uint64_t)ic_endsWithDelimeter:()IC;
- (uint64_t)ic_isLastCharacterANewline;
- (uint64_t)ic_isNumeric;
- (uint64_t)ic_lengthOfLongestLine;
- (uint64_t)ic_lineRangeIgnoringLineBreakCharactersForIndex:()IC;
- (uint64_t)ic_numberOfLines;
- (uint64_t)ic_paragraphRangeForRange:()IC contentEnd:;
- (uint64_t)ic_range;
- (uint64_t)ic_rangeEncapsulatesWord:()IC;
- (uint64_t)ic_sentenceRangeForRange:()IC;
- (uint64_t)ic_startsWithDelimeter:()IC;
- (uint64_t)ic_stringReplacingUnsafeHTMLCharacters;
- (uint64_t)ic_stringReplacingUnsafeXMLCharacters;
- (uint64_t)ic_substringFromIndex:()IC;
- (uint64_t)ic_substringWithRange:()IC;
- (uint64_t)ic_whitespaceAndNewlineCoalescedString;
- (void)ic_enumerateContentLineRangesInRange:()IC usingBlock:;
- (void)ic_enumerateParagraphsInRange:()IC usingBlock:;
@end

@implementation NSString(IC)

- (BOOL)ic_containsNonWhitespaceCharacters
{
  v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v3 = [v2 invertedSet];

  BOOL v4 = [a1 rangeOfCharacterFromSet:v3] != 0x7FFFFFFFFFFFFFFFLL;
  return v4;
}

- (void)ic_enumerateContentLineRangesInRange:()IC usingBlock:
{
  v8 = a5;
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

- (void)ic_enumerateParagraphsInRange:()IC usingBlock:
{
  v8 = a5;
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

- (BOOL)ic_range:()IC onlyContainsCharacterSet:
{
  id v8 = a5;
  v18.location = objc_msgSend(a1, "ic_range");
  v18.length = v9;
  v17.location = a3;
  v17.length = a4;
  NSRange v10 = NSIntersectionRange(v17, v18);
  if (v10.length && v10.location < v10.location + v10.length)
  {
    if (objc_msgSend(v8, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v10.location)))
    {
      NSUInteger v11 = v10.location + 1;
      NSUInteger v12 = v10.length - 1;
      do
      {
        NSUInteger v13 = v11;
        if (!v12) {
          break;
        }
        char v14 = objc_msgSend(v8, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v11));
        NSUInteger v11 = v13 + 1;
        --v12;
      }
      while ((v14 & 1) != 0);
      BOOL v15 = v13 >= v10.location + v10.length;
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

- (uint64_t)ic_range
{
  return 0;
}

- (BOOL)ic_rangeIsValid:()IC
{
  return a3 != 0x7FFFFFFFFFFFFFFFLL && a3 + a4 <= (unint64_t)[a1 length];
}

- (id)ic_nilWhenEmpty
{
  if ([a1 length]) {
    v2 = a1;
  }
  else {
    v2 = 0;
  }
  return v2;
}

+ (uint64_t)ic_attachmentCharacterString
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%C", 65532);
}

+ (__CFString)ic_ellipsisCharacterString
{
  return @"…";
}

+ (__CFString)ic_hashtagCharacterString
{
  return @"#";
}

+ (__CFString)ic_mentionCharacterString
{
  return @"@";
}

+ (__CFString)ic_thinSpaceCharacterString
{
  return @" ";
}

+ (__CFString)ic_equalsSignCharacterString
{
  return @"=";
}

+ (__CFString)ic_fullWidthEqualsSignCharacterString
{
  return @"＝";
}

+ (id)ic_calculateEqualsSignString
{
  v2 = NSString;
  v3 = objc_msgSend(a1, "ic_thinSpaceCharacterString");
  BOOL v4 = objc_msgSend(a1, "ic_equalsSignCharacterString");
  v5 = objc_msgSend(a1, "ic_thinSpaceCharacterString");
  v6 = [v2 stringWithFormat:@"%@%@%@", v3, v4, v5];

  return v6;
}

+ (id)ic_calculateGraphExpressionString
{
  v1 = NSString;
  v2 = objc_msgSend(a1, "ic_calculateEqualsSignString");
  v3 = [v1 stringWithFormat:@"y%@", v2];

  return v3;
}

+ (__CFString)ic_leftToRightCharacterString
{
  return @"\u200E";
}

+ (__CFString)ic_rightToLeftCharacterString
{
  return @"\u200F";
}

- (id)ic_leftToRightString
{
  v2 = NSString;
  v3 = objc_msgSend((id)objc_opt_class(), "ic_leftToRightCharacterString");
  BOOL v4 = [v2 stringWithFormat:@"%@%@", v3, a1];

  return v4;
}

- (id)ic_rightToLeftString
{
  v2 = NSString;
  v3 = objc_msgSend((id)objc_opt_class(), "ic_rightToLeftCharacterString");
  BOOL v4 = [v2 stringWithFormat:@"%@%@", v3, a1];

  return v4;
}

- (id)ic_md5
{
  v1 = objc_msgSend(a1, "ic_dataValue");
  v2 = objc_msgSend(v1, "ic_md5");

  return v2;
}

- (id)ic_sha256
{
  v1 = objc_msgSend(a1, "ic_dataValue");
  v2 = objc_msgSend(v1, "ic_sha256");

  return v2;
}

- (id)ic_htmlStringEscapingQuotesAndLineBreaks
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v1 = a1;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v2 = [&unk_26C144E98 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
          objc_enumerationMutation(&unk_26C144E98);
        }
        v7 = *(void **)(*((void *)&v11 + 1) + 8 * v5);
        id v8 = [v7 objectAtIndexedSubscript:0];
        NSUInteger v9 = [v7 objectAtIndexedSubscript:1];
        id v1 = [v6 stringByReplacingOccurrencesOfString:v8 withString:v9];

        ++v5;
        v6 = v1;
      }
      while (v3 != v5);
      uint64_t v3 = [&unk_26C144E98 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }
  return v1;
}

- (id)ic_trimmedString
{
  uint64_t v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  uint64_t v3 = [a1 stringByTrimmingCharactersInSet:v2];

  return v3;
}

- (__CFString)ic_trailingTrimmedString
{
  if ([a1 length])
  {
    uint64_t v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    uint64_t v3 = [a1 length] + 1;
    uint64_t v4 = &stru_26C13B138;
    while (1)
    {
      uint64_t v5 = v3 - 2;
      if (v3 - 2 < 0) {
        break;
      }
      --v3;
      if ((objc_msgSend(v2, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v5)) & 1) == 0)
      {
        uint64_t v4 = [a1 substringToIndex:v3];
        break;
      }
    }
  }
  else
  {
    uint64_t v4 = &stru_26C13B138;
  }
  return v4;
}

- (id)ic_leadingTrimmedString
{
  uint64_t v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  uint64_t v3 = objc_msgSend(a1, "ic_stringByTrimmingLeadingCharactersInSet:", v2);

  return v3;
}

- (uint64_t)ic_whitespaceAndNewlineCoalescedString
{
  if (ic_whitespaceAndNewlineCoalescedString_onceToken != -1) {
    dispatch_once(&ic_whitespaceAndNewlineCoalescedString_onceToken, &__block_literal_global_28);
  }
  uint64_t v2 = (void *)ic_whitespaceAndNewlineCoalescedString_regex;
  uint64_t v3 = [a1 length];
  return objc_msgSend(v2, "stringByReplacingMatchesInString:options:range:withTemplate:", a1, 0, 0, v3, @" ");
}

- (id)ic_sanitizedFilenameString
{
  id v1 = (void *)[a1 copy];
  uint64_t v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  uint64_t v3 = [v1 stringByTrimmingCharactersInSet:v2];

  uint64_t v4 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"."];
  uint64_t v5 = objc_msgSend(v3, "ic_stringByTrimmingLeadingCharactersInSet:", v4);

  v6 = objc_msgSend(MEMORY[0x263F08708], "ic_illegalFilenameCharacterSet");
  v7 = objc_msgSend(v5, "ic_stringByReplacingCharactersInSet:withString:", v6, &stru_26C13B138);

  if ((unint64_t)[v7 length] > 0x80)
  {
    NSUInteger v9 = [v7 pathExtension];
    if ([v9 length])
    {
      NSRange v10 = [v7 stringByDeletingPathExtension];
      long long v11 = objc_msgSend(v10, "ic_substringToIndex:", 126 - objc_msgSend(v9, "length"));

      id v8 = [NSString stringWithFormat:@"%@.%@", v11, v9];
    }
    else
    {
      objc_msgSend(v7, "ic_substringToIndex:", 127);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v8 = v7;
  }

  return v8;
}

- (uint64_t)ic_lineRangeIgnoringLineBreakCharactersForIndex:()IC
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

- (uint64_t)ic_stringReplacingUnsafeHTMLCharacters
{
  return objc_msgSend(a1, "ic_stringByReplacingCharactersInStringMap:", &unk_26C144EB0);
}

- (uint64_t)ic_stringReplacingUnsafeXMLCharacters
{
  return objc_msgSend(a1, "ic_stringByReplacingCharactersInStringMap:", &unk_26C144ED8);
}

- (id)ic_stringByRemovingAttachmentCharacters
{
  uint64_t v2 = objc_msgSend((id)objc_opt_class(), "ic_attachmentCharacterString");
  uint64_t v3 = [a1 stringByReplacingOccurrencesOfString:v2 withString:&stru_26C13B138];

  return v3;
}

- (id)ic_stringByRemovingLanguageDirectionCharacters
{
  id v1 = NSString;
  id v2 = a1;
  uint64_t v3 = objc_msgSend(v1, "ic_leftToRightCharacterString");
  uint64_t v4 = [v2 stringByReplacingOccurrencesOfString:v3 withString:&stru_26C13B138];

  NSUInteger v5 = objc_msgSend(NSString, "ic_rightToLeftCharacterString");
  v6 = [v4 stringByReplacingOccurrencesOfString:v5 withString:&stru_26C13B138];

  return v6;
}

- (id)ic_stringByRemovingWhitespaceOnlyLines
{
  id v2 = [MEMORY[0x263F08708] newlineCharacterSet];
  uint64_t v3 = [a1 componentsSeparatedByCharactersInSet:v2];

  uint64_t v4 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_127];
  NSUInteger v5 = [v3 filteredArrayUsingPredicate:v4];

  v6 = [v5 componentsJoinedByString:@"\n"];

  return v6;
}

- (uint64_t)ic_isLastCharacterANewline
{
  uint64_t v2 = [a1 length];
  return objc_msgSend(a1, "ic_isLastCharacterInRangeANewlineForRange:", 0, v2);
}

- (BOOL)ic_canConvertToTag
{
  id v1 = [a1 stringByApplyingTransform:*MEMORY[0x263EFF5A0] reverse:0];
  BOOL v2 = 0;
  if ((unint64_t)[v1 length] <= 0x4C)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x263F08708], "ic_hashtagAllowedCharacterSet");
    uint64_t v4 = objc_msgSend((id)objc_opt_class(), "ic_hashtagCharacterString");
    if ([v1 hasPrefix:v4])
    {
      id v5 = [v1 substringFromIndex:1];
    }
    else
    {
      id v5 = v1;
    }
    v6 = v5;

    int v7 = objc_msgSend(v6, "ic_stringByReplacingCharactersInSet:withString:", v3, &stru_26C13B138);
    BOOL v2 = objc_msgSend(v1, "ic_containsHashtagPrefix")
      && [v1 length] != 1
      && [v7 length] == 0;
  }
  return v2;
}

- (uint64_t)ic_numberOfLines
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

- (id)ic_uniqueWordsWithMinLength:()IC
{
  v25[1] = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v6 = objc_alloc(MEMORY[0x263F08948]);
  v25[0] = *MEMORY[0x263F082D8];
  uint64_t v7 = v25[0];
  NSUInteger v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
  NSUInteger v9 = (void *)[v6 initWithTagSchemes:v8 options:0];

  [v9 setString:a1];
  uint64_t v10 = [a1 length];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __44__NSString_IC__ic_uniqueWordsWithMinLength___block_invoke;
  v21[3] = &unk_2640CE380;
  uint64_t v24 = a3;
  id v11 = v5;
  id v22 = v11;
  v23 = a1;
  objc_msgSend(v9, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v10, v7, 6, v21);
  uint64_t v15 = 0;
  NSRange v16 = &v15;
  uint64_t v17 = 0x3032000000;
  NSRange v18 = __Block_byref_object_copy__9;
  v19 = __Block_byref_object_dispose__9;
  id v20 = objc_alloc_init(MEMORY[0x263F089D8]);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __44__NSString_IC__ic_uniqueWordsWithMinLength___block_invoke_133;
  v14[3] = &unk_2640CDA48;
  v14[4] = &v15;
  [v11 enumerateObjectsUsingBlock:v14];
  NSRange v12 = (void *)[(id)v16[5] copy];
  _Block_object_dispose(&v15, 8);

  return v12;
}

- (BOOL)ic_containsNonWhitespaceAndAttachmentCharacters
{
  uint64_t v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  unint64_t v3 = (void *)[v2 mutableCopy];

  uint64_t v4 = objc_msgSend((id)objc_opt_class(), "ic_attachmentCharacterString");
  [v3 addCharactersInString:v4];

  id v5 = [v3 invertedSet];
  BOOL v6 = [a1 rangeOfCharacterFromSet:v5] != 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

- (BOOL)ic_containsAlphanumericCharacters
{
  uint64_t v2 = [MEMORY[0x263F08708] alphanumericCharacterSet];
  BOOL v3 = [a1 rangeOfCharacterFromSet:v2] != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (BOOL)ic_containsWhitespaceCharacters
{
  uint64_t v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  BOOL v3 = [a1 rangeOfCharacterFromSet:v2] != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (uint64_t)ic_containsHashtagPrefix
{
  uint64_t result = [a1 length];
  if (result)
  {
    int v3 = [a1 characterAtIndex:0];
    return v3 == 35 || v3 == 65283;
  }
  return result;
}

- (uint64_t)ic_isNumeric
{
  uint64_t v2 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
  int v3 = [MEMORY[0x263F08708] characterSetWithCharactersInString:a1];
  uint64_t v4 = [v2 isSupersetOfSet:v3];

  return v4;
}

- (uint64_t)ic_substringFromIndex:()IC
{
  uint64_t v2 = objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:");
  return [a1 substringFromIndex:v2];
}

- (id)ic_substringToIndex:()IC
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
    NSUInteger v9 = [a1 substringToIndex:v7 + v8];
  }
  else
  {
    NSUInteger v9 = (void *)[a1 copy];
  }
  return v9;
}

- (uint64_t)ic_substringWithRange:()IC
{
  uint64_t v3 = objc_msgSend(a1, "rangeOfComposedCharacterSequencesForRange:");
  return objc_msgSend(a1, "substringWithRange:", v3, v2);
}

- (id)ic_checkedSubstringWithRange:()IC
{
  if (objc_msgSend(a1, "ic_rangeIsValid:"))
  {
    uint64_t v7 = objc_msgSend(a1, "ic_substringWithRange:", a3, a4);
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (id)ic_stringByReplacingNewlineCharactersWithWhiteSpace
{
  uint64_t v2 = [MEMORY[0x263F08708] newlineCharacterSet];
  uint64_t v3 = objc_msgSend(a1, "ic_stringByReplacingCharactersInSet:withString:", v2, @" ");

  return v3;
}

- (id)ic_stringByReplacingCharactersInSet:()IC withString:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  uint64_t v9 = [v8 rangeOfCharacterFromSet:v6];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = 0;
  }
  else
  {
    uint64_t v12 = v9;
    uint64_t v13 = v10;
    id v11 = 0;
    do
    {
      if (!v11) {
        id v11 = (void *)[v8 mutableCopy];
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

- (id)ic_stringByReplacingCharactersInStringMap:()IC
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v26 = a1;
  id v5 = objc_alloc_init(MEMORY[0x263F089D8]);
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
        uint64_t v10 = [MEMORY[0x263F08AE8] escapedPatternForString:*(void *)(*((void *)&v38 + 1) + 8 * i)];
        [v5 appendString:v10];

        [v5 appendString:@"|"];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v7);
  }

  if ([v5 length]) {
    objc_msgSend(v5, "replaceCharactersInRange:withString:", objc_msgSend(v5, "length") - 1, 1, &stru_26C13B138);
  }
  [v5 appendString:@""]);
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:v5 options:0 error:0];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__9;
  v36 = __Block_byref_object_dispose__9;
  id v37 = 0;
  uint64_t v11 = [v26 length];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __58__NSString_IC__ic_stringByReplacingCharactersInStringMap___block_invoke;
  v31[3] = &unk_2640CE3A8;
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
          +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[NSString(IC) ic_stringByReplacingCharactersInStringMap:]", 1, 0, @"nil replacement string replacestring map");
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

- (id)ic_stringByReplacingLeadingFullWidthHashSignIfPossible
{
  if (objc_msgSend(a1, "ic_containsHashtagPrefix"))
  {
    uint64_t v2 = [a1 substringToIndex:1];
    uint64_t v3 = [a1 substringFromIndex:1];
    id v4 = [v2 stringByApplyingTransform:*MEMORY[0x263EFF5A0] reverse:0];
    id v5 = [NSString localizedStringWithFormat:@"%@%@", v4, v3];
  }
  else
  {
    id v5 = a1;
  }
  return v5;
}

- (uint64_t)ic_paragraphRangeForRange:()IC contentEnd:
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

- (uint64_t)ic_sentenceRangeForRange:()IC
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3010000000;
  uint64_t v14 = &unk_20C2C2E5B;
  long long v15 = xmmword_20C2B7D00;
  if (objc_msgSend(a1, "ic_rangeIsValid:"))
  {
    uint64_t v7 = [a1 length];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __41__NSString_IC__ic_sentenceRangeForRange___block_invoke;
    v10[3] = &unk_2640CE3D0;
    v10[5] = a3;
    v10[6] = a4;
    v10[4] = &v11;
    objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 4, v10);
  }
  uint64_t v8 = v12[4];
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (uint64_t)ic_lengthOfLongestLine
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __38__NSString_IC__ic_lengthOfLongestLine__block_invoke;
  v3[3] = &unk_2640CDA48;
  v3[4] = &v4;
  [a1 enumerateLinesUsingBlock:v3];
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (BOOL)ic_isLastCharacterInRangeANewlineForRange:()IC
{
  uint64_t v7 = objc_msgSend(a1, "ic_safeCharacterRangeForRange:");
  BOOL v9 = 0;
  if (a3 == v7 && a4 == v8)
  {
    uint64_t v10 = objc_msgSend(a1, "ic_substringWithRange:", v7, v8);
    if ([v10 length]) {
      BOOL v9 = objc_msgSend(v10, "characterAtIndex:", objc_msgSend(v10, "length") - 1) == 10;
    }
    else {
      BOOL v9 = 0;
    }
  }
  return v9;
}

- (NSUInteger)ic_safeCharacterRangeForRange:()IC
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

- (uint64_t)ic_countOfCharactersInSet:()IC
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

- (__CFString)ic_stringByTrimmingLeadingCharactersInSet:()IC
{
  id v4 = [a3 invertedSet];
  uint64_t v5 = [a1 rangeOfCharacterFromSet:v4];

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = &stru_26C13B138;
  }
  else if (v5)
  {
    objc_msgSend(a1, "ic_substringFromIndex:", v5);
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = a1;
  }
  return v6;
}

- (id)ic_truncatedStringWithMaxLength:()IC truncated:
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
    uint64_t v7 = objc_msgSend(a1, "ic_substringWithRange:", 0, a3);
    uint64_t v8 = [v7 length];
    if (v8 == [a1 length])
    {
      id v9 = v7;
    }
    else
    {
      uint64_t v10 = objc_msgSend(v7, "ic_trailingTrimmedString");
      id v9 = [v10 stringByAppendingString:@"…"];

      if (a4) {
        *a4 = 1;
      }
    }
  }
  return v9;
}

- (id)ic_tokenSafeText
{
  uint64_t v1 = [a1 localizedUppercaseString];
  uint64_t v2 = [v1 stringByApplyingTransform:*MEMORY[0x263EFF5B0] reverse:0];

  return v2;
}

- (id)ic_withHashtagPrefix
{
  uint64_t v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  uint64_t v3 = [a1 stringByTrimmingCharactersInSet:v2];

  id v4 = objc_msgSend((id)objc_opt_class(), "ic_hashtagCharacterString");
  if ([v3 hasPrefix:v4])
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = NSString;
    uint64_t v7 = objc_msgSend((id)objc_opt_class(), "ic_hashtagCharacterString");
    id v5 = [v6 stringWithFormat:@"%@%@", v7, v3];
  }
  return v5;
}

- (id)ic_withoutHashtagPrefix
{
  uint64_t v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  uint64_t v3 = [a1 stringByTrimmingCharactersInSet:v2];

  id v4 = objc_msgSend((id)objc_opt_class(), "ic_hashtagCharacterString");
  if ([v3 hasPrefix:v4])
  {
    id v5 = [v3 substringFromIndex:1];
  }
  else
  {
    id v5 = v3;
  }
  uint64_t v6 = v5;

  return v6;
}

- (__CFString)ic_hashtagDisplayText
{
  uint64_t v2 = (void *)MEMORY[0x263F08708];
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "ic_hashtagCharacterString");
  id v4 = [v2 characterSetWithCharactersInString:v3];

  id v5 = [v4 invertedSet];
  uint64_t v6 = [a1 rangeOfCharacterFromSet:v5];

  if (!v6)
  {
    uint64_t v7 = [a1 copy];
    goto LABEL_5;
  }
  if ((unint64_t)[a1 length] >= 2)
  {
    uint64_t v7 = objc_msgSend(a1, "ic_substringFromIndex:", 1);
LABEL_5:
    uint64_t v8 = (__CFString *)v7;
    goto LABEL_7;
  }
  uint64_t v8 = &stru_26C13B138;
LABEL_7:

  return v8;
}

- (id)ic_stringWithoutSuffix:()IC
{
  id v4 = a3;
  id v5 = (void *)[a1 copy];
  if ([v5 hasSuffix:v4])
  {
    uint64_t v6 = objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - objc_msgSend(v4, "length"));

    id v5 = (void *)v6;
  }

  return v5;
}

+ (BOOL)ic_isCharacterInlineAttachmentPrefix:()IC
{
  return a3 == 35 || a3 == 64;
}

- (id)ic_mentionString
{
  uint64_t v2 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  uint64_t v3 = [a1 stringByTrimmingCharactersInSet:v2];

  id v4 = objc_msgSend((id)objc_opt_class(), "ic_mentionCharacterString");
  int v5 = [v3 hasPrefix:v4];

  if (v5)
  {
    id v6 = v3;
  }
  else
  {
    uint64_t v7 = NSString;
    uint64_t v8 = objc_msgSend((id)objc_opt_class(), "ic_mentionCharacterString");
    id v6 = [v7 localizedStringWithFormat:@"%@%@", v8, v3];
  }
  return v6;
}

+ (id)ic_newURLForContentID:()IC percentEscaped:
{
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    long long v15 = 0;
    goto LABEL_14;
  }
  uint64_t v7 = [v5 rangeOfString:@"<"];
  uint64_t v9 = v8;
  unint64_t v10 = [v6 rangeOfString:@">"];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL || v10 == 0x7FFFFFFFFFFFFFFFLL || v10 <= v7 + v9)
  {
    id v11 = v6;
  }
  else
  {
    objc_msgSend(v6, "substringWithRange:", v7 + v9, v10 - (v7 + v9));
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v12 = v11;
  if (!a4)
  {
    NSRange v16 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
    id v13 = [v12 stringByAddingPercentEncodingWithAllowedCharacters:v16];

    if (v13) {
      goto LABEL_9;
    }
LABEL_12:
    long long v15 = 0;
    goto LABEL_13;
  }
  id v13 = v11;
  if (!v13) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v14 = (void *)[[NSString alloc] initWithFormat:@"cid:%@", v13];
  long long v15 = (void *)[objc_alloc(NSURL) initWithString:v14];

LABEL_13:
LABEL_14:

  return v15;
}

- (uint64_t)ic_dataValue
{
  return [a1 dataUsingEncoding:4];
}

+ (__CFString)ic_shortNameFromGivenName:()IC familyName:
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] || objc_msgSend(v6, "length"))
  {
    id v7 = objc_alloc_init(MEMORY[0x263F08A68]);
    if ([v5 length]) {
      [v7 setGivenName:v5];
    }
    if ([v6 length]) {
      [v7 setFamilyName:v6];
    }
    uint64_t v8 = [MEMORY[0x263F08A78] localizedStringFromPersonNameComponents:v7 style:1 options:0];
    objc_msgSend(v8, "ic_trimmedString");
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = &stru_26C13B138;
  }

  return v9;
}

- (BOOL)ic_isCaseInsensitiveEqualToString:()IC
{
  return objc_msgSend(a1, "caseInsensitiveCompare:") == 0;
}

+ (uint64_t)ic_nonDelimeterSet
{
  return objc_msgSend(MEMORY[0x263F08708], "ic_hashtagAllowedCharacterSet");
}

- (uint64_t)ic_startsWithDelimeter:()IC
{
  if (!a3) {
    return 1;
  }
  uint64_t v3 = [a1 characterAtIndex:a3 - 1];
  id v4 = objc_msgSend(NSString, "ic_nonDelimeterSet");
  uint64_t v5 = [v4 characterIsMember:v3] ^ 1;

  return v5;
}

- (uint64_t)ic_endsWithDelimeter:()IC
{
  unint64_t v5 = a3 + a4;
  unint64_t v6 = [a1 length];
  if (v5 >= v6) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = v5;
  }
  if (v7 == [a1 length]) {
    return 1;
  }
  uint64_t v9 = [a1 characterAtIndex:v5];
  unint64_t v10 = objc_msgSend(NSString, "ic_nonDelimeterSet");
  uint64_t v8 = [v10 characterIsMember:v9] ^ 1;

  return v8;
}

- (uint64_t)ic_rangeEncapsulatesWord:()IC
{
  uint64_t result = objc_msgSend(a1, "ic_startsWithDelimeter:");
  if (result)
  {
    return objc_msgSend(a1, "ic_endsWithDelimeter:", a3, a4);
  }
  return result;
}

- (id)ic_attributedString
{
  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:a1];
  return v1;
}

@end