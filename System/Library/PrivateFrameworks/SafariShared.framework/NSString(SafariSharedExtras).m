@interface NSString(SafariSharedExtras)
+ (__CFString)safari_stringWithJSValue:()SafariSharedExtras context:nullStringPolicy:;
+ (id)safari_detailStringWithTitleString:()SafariSharedExtras prompt:;
+ (id)safari_detailStringWithURLString:()SafariSharedExtras prompt:;
+ (id)safari_stringByBase64EncodingData:()SafariSharedExtras;
+ (id)safari_stringWithUTF8Bytes:()SafariSharedExtras length:;
+ (uint64_t)safari_stringWithJSValue:()SafariSharedExtras context:;
- (BOOL)safari_looksLikeAbsoluteURLString;
- (__CFString)safari_bestKnownLanguageTag;
- (__CFString)safari_bestURLStringForUserTypedString;
- (__CFString)safari_stringByFoldingWideCharactersAndNormalizing;
- (__CFString)safari_urlHashesOfComponents;
- (id)safari_bestLanguageTag;
- (id)safari_bestURLForUserTypedString;
- (id)safari_canonicalURLForFrequentlyVisitedSites;
- (id)safari_containedURLs;
- (id)safari_ensurePathExtension:()SafariSharedExtras;
- (id)safari_lastPathComponentWithoutZipExtension;
- (id)safari_md5Hash;
- (id)safari_scriptIfJavaScriptURLString;
- (id)safari_sha256Hash;
- (id)safari_stringByRedactingStrings:()SafariSharedExtras withReplacement:;
- (id)safari_stringByRemovingDirectionalPrefix;
- (id)safari_stringByRemovingParenthesizedDomain;
- (id)safari_stringByReplacingLastOccurrenceOfWhitespaceWithANonBreakingSpace;
- (id)safari_stringByReplacingMarkupCharactersWithHTMLEntities;
- (id)safari_stringBySubstitutingAmpersandAndAngleBracketsForHTMLEntities;
- (id)safari_stringBySubstitutingHTMLEntitiesForAmpersandAndAngleBrackets;
- (id)safari_stringDecodedFromURLQueryParameter;
- (id)safari_stringEncodedAsURLQueryParameter;
- (id)safari_userVisibleTitleIgnoringFullURLString;
- (id)safari_userVisibleURL;
- (uint64_t)safari_hasDirectionalPrefix;
- (uint64_t)safari_isJavaScriptURLString;
- (uint64_t)safari_isPDFMIMEType;
- (uint64_t)safari_isRightToLeft;
- (uint64_t)safari_isVisualDuplicateOfURLString:()SafariSharedExtras;
- (uint64_t)safari_looksLikeObscuredPassword;
- (uint64_t)safari_rangeOfURLScheme;
- (uint64_t)safari_stringByAddingSoftBreaksBeforePeriods;
- (uint64_t)safari_wordCount;
- (void)safari_enumerateSubdomainRangesInHostUsingBlock:()SafariSharedExtras;
@end

@implementation NSString(SafariSharedExtras)

- (id)safari_md5Hash
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v1 = [a1 dataUsingEncoding:4];
  CC_MD5((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  v2 = objc_msgSend((id)objc_opt_class(), "safari_stringAsHexWithBuffer:length:", md, 16);

  return v2;
}

- (id)safari_sha256Hash
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v1 = [a1 dataUsingEncoding:4];
  CC_SHA256((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  v2 = objc_msgSend((id)objc_opt_class(), "safari_stringAsHexWithBuffer:length:", md, 32);

  return v2;
}

- (uint64_t)safari_stringByAddingSoftBreaksBeforePeriods
{
  return [a1 stringByReplacingOccurrencesOfString:@"." withString:@"​."];
}

+ (__CFString)safari_stringWithJSValue:()SafariSharedExtras context:nullStringPolicy:
{
  if (a5 && (a5 != 1 && (a5 != 2 || JSValueIsUndefined(ctx, value)) || JSValueIsNull(ctx, value)))
  {
    v7 = 0;
  }
  else
  {
    v8 = JSValueToStringCopy(ctx, value, 0);
    v7 = (__CFString *)JSStringCopyCFString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v8);
    if (v8) {
      JSStringRelease(v8);
    }
  }
  return v7;
}

+ (uint64_t)safari_stringWithJSValue:()SafariSharedExtras context:
{
  return objc_msgSend(a1, "safari_stringWithJSValue:context:nullStringPolicy:", a3, a4, 0);
}

- (id)safari_bestURLForUserTypedString
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__28;
  v8 = __Block_byref_object_dispose__28;
  id v9 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__NSString_SafariSharedExtras__safari_bestURLForUserTypedString__block_invoke;
  v3[3] = &unk_1E5C9DD88;
  v3[4] = &v4;
  objc_msgSend(MEMORY[0x1E4F1CB10], "safari_enumeratePossibleURLsForUserTypedString:withBlock:", a1, v3);
  id v1 = objc_msgSend((id)v5[5], "safari_canonicalURL");
  _Block_object_dispose(&v4, 8);

  return v1;
}

- (id)safari_bestLanguageTag
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F28DF0]);
  v27[0] = *MEMORY[0x1E4F28510];
  uint64_t v3 = v27[0];
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  uint64_t v5 = (void *)[v2 initWithTagSchemes:v4 options:0x20000000];

  uint64_t v6 = objc_msgSend(a1, "safari_stringByTrimmingWhitespace");
  [v5 setString:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  v8 = [v5 string];
  uint64_t v9 = [v8 length];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __54__NSString_SafariSharedExtras__safari_bestLanguageTag__block_invoke;
  v25[3] = &unk_1E5C8E478;
  id v10 = v7;
  id v26 = v10;
  objc_msgSend(v5, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v9, v3, 14, v25);

  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__28;
  v23 = __Block_byref_object_dispose__28;
  id v24 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__NSString_SafariSharedExtras__safari_bestLanguageTag__block_invoke_2;
  v14[3] = &unk_1E5C9DDB0;
  id v11 = v10;
  id v15 = v11;
  v16 = v18;
  v17 = &v19;
  [v11 enumerateObjectsUsingBlock:v14];
  id v12 = (id)v20[5];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v19, 8);

  return v12;
}

- (__CFString)safari_bestKnownLanguageTag
{
  objc_msgSend(a1, "safari_bestLanguageTag");
  id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v2 = v1;
  if (!v1 || [(__CFString *)v1 isEqualToString:@"und"])
  {

    id v2 = @"en";
  }
  return v2;
}

- (__CFString)safari_bestURLStringForUserTypedString
{
  id v1 = objc_msgSend(a1, "safari_bestURLForUserTypedString");
  uint64_t v2 = objc_msgSend(v1, "safari_originalDataAsString");

  if (v2) {
    uint64_t v3 = (__CFString *)v2;
  }
  else {
    uint64_t v3 = &stru_1EFBE3CF8;
  }
  return v3;
}

- (id)safari_userVisibleURL
{
  if (WTF::isUserVisibleURL((WTF *)a1, a2))
  {
    id v3 = a1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithDataAsString:", a1);
    uint64_t v4 = (WTF *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = v4;
    if (v4)
    {
      WTF::userVisibleString(v4, v5);
      id v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v3 = 0;
    }
  }
  return v3;
}

- (BOOL)safari_looksLikeAbsoluteURLString
{
  id v1 = objc_msgSend(a1, "safari_stringByTrimmingWhitespace");
  BOOL v2 = objc_msgSend(v1, "safari_rangeOfURLScheme") != 0x7FFFFFFFFFFFFFFFLL;

  return v2;
}

- (__CFString)safari_stringByFoldingWideCharactersAndNormalizing
{
  id v1 = (__CFString *)[a1 mutableCopy];
  CFStringFold(v1, 0x100uLL, 0);
  CFStringNormalize(v1, kCFStringNormalizationFormC);
  return v1;
}

- (id)safari_stringByReplacingMarkupCharactersWithHTMLEntities
{
  id v1 = (void *)[a1 mutableCopy];
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"&", @"&amp;",
    0,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"<", @"&lt;",
    0,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @">", @"&gt;",
    0,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"\", @"&quot;"",
    0,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"'", @"&#x27;",
    0,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"/", @"&#x2F;",
    0,
    0,
    [v1 length]);
  return v1;
}

- (id)safari_stringByReplacingLastOccurrenceOfWhitespaceWithANonBreakingSpace
{
  BOOL v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v3 = [a1 rangeOfCharacterFromSet:v2 options:4];
  uint64_t v5 = v4;

  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = a1;
  }
  else
  {
    objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:", v3, v5, @"&nbsp;");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)safari_stringEncodedAsURLQueryParameter
{
  BOOL v2 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"ABCDEFGHIJLKMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.!~*'()"];
  uint64_t v3 = [a1 stringByAddingPercentEncodingWithAllowedCharacters:v2];
  uint64_t v4 = [v3 stringByReplacingOccurrencesOfString:@"%20" withString:@"+"];

  return v4;
}

- (id)safari_stringDecodedFromURLQueryParameter
{
  id v1 = [a1 stringByReplacingOccurrencesOfString:@"+" withString:@" "];
  BOOL v2 = [v1 stringByRemovingPercentEncoding];

  return v2;
}

- (id)safari_stringByRemovingDirectionalPrefix
{
  if (objc_msgSend(a1, "safari_hasDirectionalPrefix"))
  {
    id v2 = [a1 substringFromIndex:1];
  }
  else
  {
    id v2 = a1;
  }
  return v2;
}

- (uint64_t)safari_hasDirectionalPrefix
{
  id v2 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 8206);
  uint64_t v3 = [a1 hasPrefix:v2];

  return v3;
}

+ (id)safari_stringWithUTF8Bytes:()SafariSharedExtras length:
{
  uint64_t v4 = (void *)[[NSString alloc] initWithBytes:a3 length:a4 encoding:4];
  return v4;
}

- (id)safari_stringBySubstitutingAmpersandAndAngleBracketsForHTMLEntities
{
  id v2 = (void *)[a1 mutableCopy];
  int v3 = objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"&lt;",
         @"<",
         0,
         0,
         [v2 length]);
  int v4 = objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"&gt;",
         @">",
         0,
         0,
         [v2 length]);
  if (!(v4
       + v3
       + objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"&amp;",
                         @"&",
                         0,
                         0,
                         [v2 length])))
  {
    id v5 = a1;

    id v2 = v5;
  }
  return v2;
}

- (id)safari_stringBySubstitutingHTMLEntitiesForAmpersandAndAngleBrackets
{
  id v2 = (void *)[a1 mutableCopy];
  uint64_t v3 = objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"&", @"&amp;",
         0,
         0,
         [v2 length]);
  uint64_t v4 = objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"<", @"&lt;",
         0,
         0,
         [v2 length]);
  if (!(v4
       + v3
       + objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @">", @"&gt;",
           0,
           0,
           [v2 length])))
  {
    id v5 = a1;

    id v2 = v5;
  }
  return v2;
}

- (uint64_t)safari_isRightToLeft
{
  v0 = (const void *)CTLineCreateWithString();
  uint64_t IsRightToLeft = CTLineIsRightToLeft();
  CFRelease(v0);
  return IsRightToLeft;
}

- (uint64_t)safari_isJavaScriptURLString
{
  return objc_msgSend(a1, "safari_hasCaseInsensitivePrefix:", @"javascript:");
}

- (id)safari_scriptIfJavaScriptURLString
{
  if (objc_msgSend(a1, "safari_isJavaScriptURLString"))
  {
    id v2 = [a1 substringFromIndex:11];
    uint64_t v3 = [v2 stringByRemovingPercentEncoding];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (void)safari_enumerateSubdomainRangesInHostUsingBlock:()SafariSharedExtras
{
  uint64_t v4 = a3;
  char v12 = 0;
  uint64_t v5 = [a1 length];
  uint64_t v6 = 0;
  uint64_t v7 = v5;
  while (1)
  {
    uint64_t v8 = objc_msgSend(a1, "rangeOfString:options:range:", @".", 0, v6, v7);
    uint64_t v10 = v9;
    if (!v9) {
      break;
    }
    uint64_t v11 = v8;
    v4[2](v4, v6, v8 - v6, &v12);
    uint64_t v6 = v11 + v10;
    uint64_t v7 = v5 - (v11 + v10);
    if (v12) {
      goto LABEL_6;
    }
  }
  v4[2](v4, v6, v7, &v12);
LABEL_6:
}

- (id)safari_canonicalURLForFrequentlyVisitedSites
{
  id v1 = (void *)MEMORY[0x1E4F1CB10];
  id v2 = objc_msgSend(a1, "safari_canonicalURLStringForFrequentlyVisitedSites");
  uint64_t v3 = objc_msgSend(v1, "safari_URLWithDataAsString:", v2);

  return v3;
}

- (uint64_t)safari_isVisualDuplicateOfURLString:()SafariSharedExtras
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [a1 lowercaseString];
    uint64_t v6 = canonicalize(v5);
    uint64_t v7 = [v4 lowercaseString];
    uint64_t v8 = canonicalize(v7);
    uint64_t v9 = [v6 isEqualToString:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)safari_stringByBase64EncodingData:()SafariSharedExtras
{
  uint64_t v3 = [a3 base64EncodedStringWithOptions:0];
  return v3;
}

- (__CFString)safari_urlHashesOfComponents
{
  if (-[NSString(SafariSharedExtras) safari_urlHashesOfComponents]::onceToken != -1) {
    dispatch_once(&-[NSString(SafariSharedExtras) safari_urlHashesOfComponents]::onceToken, &__block_literal_global_79);
  }
  id v2 = [MEMORY[0x1E4F29088] componentsWithString:a1];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    id v4 = [v2 host];
    uint64_t v5 = __60__NSString_SafariSharedExtras__safari_urlHashesOfComponents__block_invoke_2((uint64_t)v4, v4);
    [v3 addObject:v5];

    uint64_t v6 = [v2 path];
    uint64_t v7 = __60__NSString_SafariSharedExtras__safari_urlHashesOfComponents__block_invoke_2((uint64_t)v6, v6);
    [v3 addObject:v7];

    uint64_t v8 = [v2 query];
    uint64_t v9 = __60__NSString_SafariSharedExtras__safari_urlHashesOfComponents__block_invoke_2((uint64_t)v8, v8);
    [v3 addObject:v9];

    uint64_t v10 = [v3 componentsJoinedByString:@"|"];
  }
  else
  {
    uint64_t v10 = &stru_1EFBE3CF8;
  }

  return v10;
}

- (uint64_t)safari_isPDFMIMEType
{
  if ((objc_msgSend(a1, "safari_isCaseInsensitiveEqualToString:", @"application/pdf") & 1) != 0
    || (objc_msgSend(a1, "safari_isCaseInsensitiveEqualToString:", @"application/postscript") & 1) != 0)
  {
    return 1;
  }
  return objc_msgSend(a1, "safari_isCaseInsensitiveEqualToString:", @"text/pdf");
}

- (id)safari_lastPathComponentWithoutZipExtension
{
  id v1 = [a1 lastPathComponent];
  id v2 = [v1 pathExtension];
  uint64_t v3 = [v2 lowercaseString];
  char v4 = [v3 isEqualToString:@"zip"];

  if (v4)
  {
    uint64_t v5 = [v1 stringByDeletingPathExtension];
    uint64_t v6 = [v5 pathExtension];
    int v7 = [v6 isEqualToString:&stru_1EFBE3CF8];
    if (v7) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = v1;
    }
    if (v7) {
      uint64_t v9 = v5;
    }
    else {
      uint64_t v9 = 0;
    }
    if (!v7) {
      id v1 = v5;
    }
  }
  return v1;
}

- (id)safari_ensurePathExtension:()SafariSharedExtras
{
  id v4 = a3;
  if ([v4 length] && objc_msgSend(a1, "length"))
  {
    uint64_t v5 = [a1 pathExtension];
    uint64_t v6 = v5;
    if (v5 && ![v5 compare:v4 options:1])
    {
      id v7 = a1;
    }
    else
    {
      id v7 = [a1 stringByAppendingPathExtension:v4];
    }
    id v8 = v7;
  }
  else
  {
    id v8 = a1;
  }

  return v8;
}

- (id)safari_containedURLs
{
  id v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v3 = [a1 componentsSeparatedByCharactersInSet:v2];

  id v4 = objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_111);

  return v4;
}

- (uint64_t)safari_looksLikeObscuredPassword
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![a1 length]) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(MEMORY[0x1E4F28B88], "safari_obscuredPasswordCharacterSets", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = [a1 stringByTrimmingCharactersInSet:*(void *)(*((void *)&v10 + 1) + 8 * v5)];
        BOOL v7 = [v6 length] == 0;

        if (v7)
        {
          uint64_t v8 = 1;
          goto LABEL_12;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 0;
LABEL_12:

  return v8;
}

- (id)safari_stringByRemovingParenthesizedDomain
{
  if (([a1 hasSuffix:@""]) & 1) != 0 {
    && (uint64_t v2 = objc_msgSend(a1, "rangeOfString:options:", @"("), 4, v2 != 0x7FFFFFFFFFFFFFFFLL))
  }
  {
    uint64_t v4 = [a1 substringToIndex:v2];
    uint64_t v5 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    id v3 = [v4 stringByTrimmingCharactersInSet:v5];
  }
  else
  {
    id v3 = a1;
  }
  return v3;
}

- (id)safari_userVisibleTitleIgnoringFullURLString
{
  uint64_t v2 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v3 = [a1 stringByTrimmingCharactersInSet:v2];

  if ([v3 length])
  {
    uint64_t v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
    uint64_t v5 = [v4 scheme];
    uint64_t v6 = [v5 length];

    if (v6) {
      BOOL v7 = 0;
    }
    else {
      BOOL v7 = v3;
    }
    if (!v6) {
      id v3 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (uint64_t)safari_rangeOfURLScheme
{
  uint64_t v2 = [a1 rangeOfString:@":"];
  if (v2) {
    BOOL v3 = v2 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v5 = v2;
  {
    uint64_t v6 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+-."];
    -[NSString(SafariSharedExtras) safari_rangeOfURLScheme]::inverseSchemeCharacterSet = [v6 invertedSet];
  }
  if (objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", -[NSString(SafariSharedExtras) safari_rangeOfURLScheme]::inverseSchemeCharacterSet, 0, 0, v5) != 0x7FFFFFFFFFFFFFFFLL)return 0x7FFFFFFFFFFFFFFFLL; {
  else
  }
    return 0;
}

+ (id)safari_detailStringWithURLString:()SafariSharedExtras prompt:
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    if ([v5 length])
    {
      BOOL v7 = [NSString stringWithFormat:@"%@ · %@", v5, v6];
    }
    else
    {
      BOOL v7 = v6;
      id v6 = 0;
    }
  }
  else
  {
    BOOL v7 = v5;
    id v5 = 0;
  }

  return v7;
}

+ (id)safari_detailStringWithTitleString:()SafariSharedExtras prompt:
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    if ([v5 length])
    {
      BOOL v7 = [NSString stringWithFormat:@"%@ %@", v5, v6];
    }
    else
    {
      BOOL v7 = v6;
      id v6 = 0;
    }
  }
  else
  {
    BOOL v7 = v5;
    id v5 = 0;
  }

  return v7;
}

- (id)safari_stringByRedactingStrings:()SafariSharedExtras withReplacement:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v24 = a4;
  BOOL v7 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSet", v6);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v13 = [a1 length];
        uint64_t v14 = 0;
        do
        {
          uint64_t v16 = objc_msgSend(a1, "rangeOfString:options:range:", v12, 385, v14, v13);
          if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
            break;
          }
          uint64_t v17 = v15;
          objc_msgSend(v7, "addIndexesInRange:", v16, v15);
          uint64_t v18 = [a1 length];
          uint64_t v14 = v16 + v17;
          uint64_t v13 = v18 - (v16 + v17);
        }
        while (v18 != v16 + v17);
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v9);
  }

  uint64_t v19 = (void *)[a1 mutableCopy];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __80__NSString_SafariSharedExtras__safari_stringByRedactingStrings_withReplacement___block_invoke;
  v25[3] = &unk_1E5C9DDF8;
  id v20 = v19;
  id v26 = v20;
  id v21 = v24;
  id v27 = v21;
  [v7 enumerateRangesWithOptions:2 usingBlock:v25];
  v22 = (void *)[v20 copy];

  return v22;
}

- (uint64_t)safari_wordCount
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  uint64_t v2 = [a1 length];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__NSString_SafariSharedExtras__safari_wordCount__block_invoke;
  v5[3] = &unk_1E5C9DE20;
  v5[4] = &v6;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v2, 3, v5);
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

@end