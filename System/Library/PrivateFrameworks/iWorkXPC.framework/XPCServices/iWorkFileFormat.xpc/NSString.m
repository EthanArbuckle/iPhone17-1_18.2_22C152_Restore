@interface NSString
+ (id)tsu_JSONStringFromString:(id)a3;
+ (id)tsu_fogFilenameFromShareToken:(id)a3;
+ (id)tsu_fogShareTokenFromFileURL:(id)a3;
+ (id)tsu_localizedDisplayNameWithPersonNameComponents:(id)a3;
+ (id)tsu_redactedStringWithFormat:(id)a3 arguments:(char *)a4;
+ (id)tsu_stringByBase64EncodingBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)tsu_stringByBase64EncodingBytes:(const char *)a3 length:(unint64_t)a4 breakLines:(BOOL)a5;
+ (id)tsu_stringByHexEncodingData:(id)a3;
+ (id)tsu_stringByIndentingString:(id)a3;
+ (id)tsu_stringByIndentingString:(id)a3 times:(unint64_t)a4;
+ (id)tsu_stringWithFormat:(id)a3 arguments:(char *)a4;
+ (id)tsu_stringWithHexFromBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)tsu_stringWithSqlStatement:(sqlite3_stmt *)a3 columnIndex:(int)a4;
+ (id)tsu_stringWithUUID;
+ (id)tsu_stringWithXMLString:(const char *)a3;
+ (id)tsu_unRedactedStringWithFormat:(id)a3 arguments:(char *)a4;
- (BOOL)tsu_bindToSqlStatement:(sqlite3_stmt *)a3 index:(int)a4 error:(id *)a5;
- (BOOL)tsu_conformsToAnyUTI:(id)a3;
- (BOOL)tsu_conformsToUTI:(id)a3;
- (BOOL)tsu_containsOnlyCharactersFromSet:(id)a3;
- (BOOL)tsu_containsSubstring:(id)a3;
- (BOOL)tsu_isCJKString;
- (BOOL)tsu_isChildOfPath:(id)a3;
- (BOOL)tsu_isDescendantOfPath:(id)a3;
- (BOOL)tsu_isDynamic;
- (BOOL)tsu_isEqualToString:(id)a3;
- (BOOL)tsu_isTaggedPointer;
- (BOOL)tsu_pathConformsToUTI:(id)a3;
- (BOOL)tsu_pathExtensionConformsToUTI:(id)a3;
- (NSString)tsu_UTIFilenameExtension;
- (NSString)tsu_UTIMimeType;
- (NSString)tsu_normalizedFilenameExtension;
- (NSString)tsu_pathUTI;
- (_NSRange)tsu_range;
- (_NSRange)tsu_rangeOfString:(id)a3 options:(unint64_t)a4 updatingSearchRange:(_NSRange *)a5;
- (id)tsu_UTTypeCopyPreferredTagWithClass:(id)a3;
- (id)tsu_allFilenameExtensionIdentifiersForTag;
- (id)tsu_encodeStringBase64;
- (id)tsu_escapeForIcuRegex;
- (id)tsu_escapeXML;
- (id)tsu_firstKey;
- (id)tsu_initRedactedWithFormat:(id)a3;
- (id)tsu_initRedactedWithFormat:(id)a3 arguments:(char *)a4;
- (id)tsu_initUnRedactedWithFormat:(id)a3;
- (id)tsu_initUnRedactedWithFormat:(id)a3 arguments:(char *)a4;
- (id)tsu_initWithSqlStatement:(sqlite3_stmt *)a3 columnIndex:(int)a4;
- (id)tsu_keyPathByAppendingKey:(id)a3;
- (id)tsu_keyPathByPrependingKey:(id)a3;
- (id)tsu_keyPathByRemovingFirstKey;
- (id)tsu_keyPathByRemovingLastKey;
- (id)tsu_lastKey;
- (id)tsu_middleTruncateToLength:(unint64_t)a3;
- (id)tsu_parseBaseTitleWithLocalizedCopyString:(id)a3 firstCopyFormatString:(id)a4 generalCopyFormatString:(id)a5 outNumber:(unint64_t *)a6;
- (id)tsu_pathExceptPrivate;
- (id)tsu_preferredIdentifierForTagClass:(id)a3 conformingToUTI:(id)a4;
- (id)tsu_regexForTitleParsingWithLocalizedCopyString:(id)a3 isFirstCopyFormatString:(BOOL)a4;
- (id)tsu_setOfContainedWordsIncludingPunctuationAndSymbols:(BOOL)a3;
- (id)tsu_sha256HexHashString;
- (id)tsu_stringByAddingCSVEscapesForLocale:(id)a3;
- (id)tsu_stringByAppendingSeparator:(id)a3 format:(id)a4;
- (id)tsu_stringByApplyingSubstitutions:(id)a3;
- (id)tsu_stringByDeletingPathExtensionIfEqualTo:(id)a3;
- (id)tsu_stringByExpandingTableFormatting;
- (id)tsu_stringByFixingBrokenSurrogatePairs;
- (id)tsu_stringByIncrementingCounterAfterDuplicateTitleModifierWithLocalizedCopyString:(id)a3 firstCopyFormatString:(id)a4 generalCopyFormatString:(id)a5 numberFormatter:(id)a6 uniquenessTest:(id)a7;
- (id)tsu_stringByIncrementingCounterAfterDuplicateTitleModifierWithUniquenessTest:(id)a3;
- (id)tsu_stringByMakingFirstCharacterLowercase;
- (id)tsu_stringByMakingFirstCharacterUppercase;
- (id)tsu_stringByRemovingCharactersInSet:(id)a3;
- (id)tsu_stringByRemovingCharactersInSet:(id)a3 options:(unsigned int)a4;
- (id)tsu_stringByReplacingInstancesOfCharactersInSet:(id)a3 withString:(id)a4;
- (id)tsu_stringByTrimmingCharactersInSetFromFront:(id)a3;
- (id)tsu_stringByUniquingPathInsideDirectory:(id)a3;
- (id)tsu_stringByUniquingPathInsideDirectory:(id)a3 withFormat:(id)a4;
- (id)tsu_stringQuotedIfContainsCharacterSet:(id)a3;
- (id)tsu_stringTrimByLimitingFirstCharacterToSet:(id)a3;
- (id)tsu_stringWithFirstStrongIsolation;
- (id)tsu_stringWithNormalizedHyphens;
- (id)tsu_stringWithNormalizedHyphensAndQuotationMarks;
- (id)tsu_stringWithNormalizedQuotationMarks;
- (id)tsu_stringWithNormalizedSpaces;
- (id)tsu_stringWithPathRelativeTo:(id)a3;
- (id)tsu_stringWithPathRelativeTo:(id)a3 allowBacktracking:(BOOL)a4;
- (id)tsu_stringWithRealpath;
- (id)tsu_stringWithTrimmedWhitespace;
- (id)tsu_stringWithoutAttachmentCharacters;
- (id)tsu_stringWithoutBidiControls;
- (id)tsu_stringWithoutNonbreakingSpaces;
- (id)tsu_substringByTruncatingToSize:(CGSize)a3 forAttributes:(id)a4;
- (id)tsu_substringWithComposedCharacterSequencesToFileSystemLength:(unint64_t)a3;
- (id)tsu_substringWithComposedCharacterSequencesTruncatedToGlyphCount:(unint64_t)a3;
- (id)tsu_substringWithComposedCharacterSequencesTruncatedToLength:(unint64_t)a3;
- (id)tsu_substringWithTrailingQuoteIfNeededByTruncatingToSize:(CGSize)a3 forAttributes:(id)a4;
- (id)tsu_tolerantStringByAppendingPathExtension:(id)a3;
- (id)tsu_uncommentedAddress;
- (id)tsu_uncommentedAddressRespectingGroups;
- (id)tsu_unescapeXML;
- (int64_t)tsu_compareToVersionString:(id)a3;
- (unint64_t)tsu_countInstancesOfString:(id)a3 options:(unint64_t)a4;
- (unint64_t)tsu_numberOfKeysInKeyPath;
- (void)tsu_appendJSONStringToString:(id)a3;
- (void)tsu_enumerateRangesOfCharactersInSet:(id)a3 usingBlock:(id)a4;
@end

@implementation NSString

+ (id)tsu_stringWithUUID
{
  CFUUIDRef v2 = CFUUIDCreate(0);
  if (v2)
  {
    CFUUIDRef v3 = v2;
    v4 = (__CFString *)CFUUIDCreateString(0, v2);
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)tsu_stringWithFormat:(id)a3 arguments:(char *)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSString) initWithFormat:v5 arguments:a4];

  return v6;
}

+ (id)tsu_stringByIndentingString:(id)a3 times:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [v5 length];
  if (a4 && v6)
  {
    do
    {
      v7 = [v5 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n  "];

      if ([v7 hasSuffix:@"\n  "])
      {
        uint64_t v8 = objc_msgSend(v7, "substringToIndex:", (char *)objc_msgSend(v7, "length") - 2);

        v7 = (void *)v8;
      }
      id v5 = [@"  " stringByAppendingString:v7];

      --a4;
    }
    while (a4);
  }
  id v9 = v5;

  return v9;
}

+ (id)tsu_stringByIndentingString:(id)a3
{
  return _objc_msgSend(a1, "tsu_stringByIndentingString:times:", a3, 1);
}

- (id)tsu_pathExceptPrivate
{
  if ([(NSString *)self rangeOfString:@"/private"])
  {
    v4 = self;
  }
  else
  {
    v4 = [(NSString *)self substringFromIndex:v3];
  }
  return v4;
}

- (id)tsu_stringByExpandingTableFormatting
{
  v4 = [(NSString *)self componentsSeparatedByString:@"$"];
  id v5 = +[NSMutableArray array];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v65 objects:v70 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v66;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v66 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = [*(id *)(*((void *)&v65 + 1) + 8 * i) componentsSeparatedByString:@"|"];
        [v5 addObject:v12];
        id v13 = [v12 count];
        if (v9 <= v13) {
          id v9 = v13;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v65 objects:v70 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  v14 = [v5 lastObject];
  if ([v14 count] == (id)1)
  {
    v15 = [v5 lastObject];
    v16 = [v15 objectAtIndexedSubscript:0];
    id v17 = [v16 length];

    if (!v17) {
      [v5 removeLastObject];
    }
  }
  else
  {
  }
  if (v9)
  {
    id v51 = v6;
    v52 = v3;
    v18 = malloc_type_calloc(8uLL, (size_t)v9, 0x70F7E92DuLL);
    v60 = malloc_type_calloc(8uLL, (size_t)[v5 count], 0x29950371uLL);
    v55 = v5;
    if ([v5 count])
    {
      unint64_t v19 = 0;
      int v20 = 0;
      do
      {
        int v53 = v20;
        [v5 objectAtIndexedSubscript:v19];
        v58 = unint64_t v56 = v19;
        unint64_t v21 = 0;
        unsigned int v22 = 0;
        do
        {
          v23 = &stru_1001D3790;
          if ((unint64_t)[v58 count] > v21)
          {
            v23 = [v58 objectAtIndexedSubscript:v21];
          }
          v24 = [(__CFString *)v23 componentsSeparatedByString:@"\n"];
          unint64_t v25 = v60[v19];
          id v26 = [v24 count];
          if (v25 <= (unint64_t)v26) {
            unint64_t v27 = (unint64_t)v26;
          }
          else {
            unint64_t v27 = v25;
          }
          v60[v19] = v27;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          id v28 = v24;
          id v29 = [v28 countByEnumeratingWithState:&v61 objects:v69 count:16];
          if (v29)
          {
            id v30 = v29;
            uint64_t v31 = *(void *)v62;
            do
            {
              for (j = 0; j != v30; j = (char *)j + 1)
              {
                if (*(void *)v62 != v31) {
                  objc_enumerationMutation(v28);
                }
                unint64_t v33 = v18[v21];
                id v34 = [*(id *)(*((void *)&v61 + 1) + 8 * (void)j) length];
                if (v33 <= (unint64_t)v34) {
                  unint64_t v35 = (unint64_t)v34;
                }
                else {
                  unint64_t v35 = v33;
                }
                v18[v21] = v35;
              }
              id v30 = [v28 countByEnumeratingWithState:&v61 objects:v69 count:16];
            }
            while (v30);
          }

          unint64_t v21 = ++v22;
          unint64_t v19 = v56;
        }
        while ((unint64_t)v9 > v22);

        unint64_t v19 = (v53 + 1);
        id v5 = v55;
        id v36 = [v55 count];
        int v20 = v53 + 1;
      }
      while ((unint64_t)v36 > v19);
    }
    id v9 = objc_alloc_init((Class)NSMutableString);
    if ([v5 count])
    {
      unint64_t v37 = 0;
      int v38 = 0;
      do
      {
        int v54 = v38;
        v39 = [v5 objectAtIndexedSubscript:v37];
        if (v60[v37])
        {
          unint64_t v40 = 0;
          int v41 = 0;
          unint64_t v57 = v37;
          do
          {
            int v59 = v41;
            if ([v39 count])
            {
              unint64_t v42 = 0;
              unsigned int v43 = 1;
              do
              {
                v44 = &stru_1001D3790;
                if ((unint64_t)[v39 count] > v42)
                {
                  v44 = [v39 objectAtIndexedSubscript:v42];
                }
                v45 = [(__CFString *)v44 componentsSeparatedByString:@"\n"];
                v46 = &stru_1001D3790;
                if ((unint64_t)[v45 count] > v40)
                {
                  v46 = [v45 objectAtIndexedSubscript:v40];
                }
                v47 = [(__CFString *)v46 stringByPaddingToLength:v18[v42] + 1 withString:@" " startingAtIndex:0];
                [v9 appendString:v47];

                unint64_t v42 = v43;
              }
              while ((unint64_t)[v39 count] > v43++);
            }
            [v9 appendString:@"\n"];
            unint64_t v40 = (v59 + 1);
            int v41 = v59 + 1;
          }
          while (v60[v57] > v40);
        }

        unint64_t v37 = (v54 + 1);
        id v5 = v55;
        id v49 = [v55 count];
        int v38 = v54 + 1;
      }
      while ((unint64_t)v49 > v37);
    }
    free(v60);
    free(v18);
    id v6 = v51;
    uint64_t v3 = v52;
  }

  return v9;
}

- (id)tsu_stringQuotedIfContainsCharacterSet:(id)a3
{
  v4 = self;
  if ([(NSString *)v4 rangeOfCharacterFromSet:a3] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = [(NSString *)v4 mutableCopy];
    objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"\", @"\"\", 0, 0, -[NSString length](v4, "length"));
    [v5 appendString:@"\""];
    [v5 insertString:@"\"" atIndex:0];

    v4 = (NSString *)v5;
  }
  return v4;
}

- (id)tsu_stringByAppendingSeparator:(id)a3 format:(id)a4
{
  id v6 = a3;
  id v7 = +[NSString tsu_stringWithFormat:a4 arguments:&v11];
  if ([(NSString *)self length])
  {
    uint64_t v8 = [(NSString *)self stringByAppendingFormat:@"%@%@", v6, v7];

    id v7 = (void *)v8;
  }

  return v7;
}

- (id)tsu_stringByAddingCSVEscapesForLocale:(id)a3
{
  id v4 = a3;
  id v5 = [v4 localeSpecificStorageForKey:@"stringByAddingCSVEscapes"];
  if (!v5)
  {
    id v6 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    id v7 = [v6 mutableCopy];

    uint64_t v8 = +[NSCharacterSet whitespaceCharacterSet];
    id v9 = [v8 invertedSet];
    [v7 formIntersectionWithCharacterSet:v9];

    [v7 addCharactersInString:@"\""];
    uint64_t v10 = [v4 listSeparator];
    if ([v10 length] != (id)1)
    {
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001CBFE8);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_100164988();
      }
      uint64_t v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(TSUAdditions) tsu_stringByAddingCSVEscapesForLocale:]");
      v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSString_TSUAdditions.m"];
      +[TSUAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:203 isFatal:0 description:"The list separator is not a 1-char string"];

      +[TSUAssertionHandler logBacktraceThrottled];
    }
    [v7 addCharactersInString:v10];
    id v5 = [v7 copy];
    [v4 setLocaleSpecificStorage:v5 forKey:@"stringByAddingCSVEscapes"];
  }
  id v13 = [(NSString *)self tsu_stringQuotedIfContainsCharacterSet:v5];

  return v13;
}

- (id)tsu_stringByUniquingPathInsideDirectory:(id)a3
{
  return [(NSString *)self tsu_stringByUniquingPathInsideDirectory:a3 withFormat:@"%@-%d%@"];
}

- (id)tsu_stringByUniquingPathInsideDirectory:(id)a3 withFormat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CC008);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100164A1C();
    }
    uint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(TSUAdditions) tsu_stringByUniquingPathInsideDirectory:withFormat:]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSString_TSUAdditions.m"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 217, 0, "invalid nil value for '%{public}s'", "directoryPath");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  uint64_t v10 = self;
  uint64_t v11 = +[NSFileManager defaultManager];
  v12 = [v6 stringByAppendingPathComponent:v10];
  unsigned int v13 = [v11 fileExistsAtPath:v12];

  if (v13)
  {
    v15 = [(NSString *)v10 pathExtension];
    context = v14;
    if (v15)
    {
      v16 = v15;
      if ([(__CFString *)v15 length])
      {
        uint64_t v17 = [@"." stringByAppendingString:v16];

        v16 = (__CFString *)v17;
      }
    }
    else
    {
      v16 = &stru_1001D3790;
    }
    v18 = [(NSString *)v10 stringByDeletingPathExtension];
    uint64_t v19 = 2;
    do
    {
      int v20 = v10;
      uint64_t v21 = (v19 + 1);
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v18, v19, v16);
      uint64_t v10 = (NSString *)objc_claimAutoreleasedReturnValue();

      unsigned int v22 = [v6 stringByAppendingPathComponent:v10];
      unsigned __int8 v23 = [v11 fileExistsAtPath:v22];

      uint64_t v19 = v21;
    }
    while ((v23 & 1) != 0);
  }

  return v10;
}

- (id)tsu_stringByFixingBrokenSurrogatePairs
{
  CFUUIDRef v2 = self;
  uint64_t v3 = (uint64_t)[(__CFString *)v2 length];
  CFStringRef theString = v2;
  uint64_t v31 = 0;
  int64_t v32 = v3;
  CharactersPtr = CFStringGetCharactersPtr(v2);
  CStringPtr = 0;
  id v29 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v2, 0x600u);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  int64_t v33 = 0;
  int64_t v34 = 0;
  id v30 = CStringPtr;
  if (v3 >= 1)
  {
    int64_t v6 = 0;
    id v7 = 0;
    int64_t v8 = 0;
    while (1)
    {
      if ((v8 & 0x8000000000000000) == 0)
      {
        int64_t v9 = v32;
        if (v32 > v8)
        {
          if (v29)
          {
            UniChar v10 = v29[v31 + v8];
          }
          else if (v30)
          {
            UniChar v10 = v30[v31 + v8];
          }
          else
          {
            if (v34 <= v8 || v6 > v8)
            {
              int64_t v11 = v8 - 4;
              if ((unint64_t)v8 < 4) {
                int64_t v11 = 0;
              }
              if (v11 + 64 < v32) {
                int64_t v9 = v11 + 64;
              }
              int64_t v33 = v11;
              int64_t v34 = v9;
              v36.location = v31 + v11;
              v36.length = v9 - v11;
              CFStringGetCharacters(theString, v36, (UniChar *)&v20);
              int64_t v6 = v33;
            }
            UniChar v10 = *((_WORD *)&v20 + v8 - v6);
          }
          int v12 = v10 & 0xFC00;
          if (v12 == 56320)
          {
LABEL_37:
            if (!v7)
            {
              id v7 = (__CFString *)-[__CFString mutableCopyWithZone:](v2, "mutableCopyWithZone:", 0, v20, v21, v22, v23, v24, v25, v26, v27);

              CFUUIDRef v2 = v7;
            }
            [(__CFString *)v7 replaceCharactersInRange:v8, 1, @"\uFFFD", v20, v21, v22, v23, v24, v25, v26, v27 withString];
            uint64_t v3 = (uint64_t)[(__CFString *)v2 length];
            CFStringRef theString = v2;
            uint64_t v31 = 0;
            int64_t v32 = v3;
            uint64_t v17 = CFStringGetCharactersPtr(v2);
            v18 = 0;
            id v29 = v17;
            if (!v17) {
              v18 = CFStringGetCStringPtr(v2, 0x600u);
            }
            int64_t v6 = 0;
            id v30 = v18;
            int64_t v33 = 0;
            int64_t v34 = 0;
            goto LABEL_42;
          }
          if (v12 == 55296)
          {
            int64_t v13 = v8 + 1;
            if (v8 + 1 >= v3) {
              goto LABEL_37;
            }
            int64_t v14 = v32;
            if (v32 <= v13) {
              goto LABEL_37;
            }
            if (v29)
            {
              UniChar v15 = v29[v31 + v13];
            }
            else if (v30)
            {
              UniChar v15 = v30[v31 + v13];
            }
            else
            {
              if (v34 <= v13 || v6 > v13)
              {
                int64_t v16 = v8 - 3;
                if ((unint64_t)v8 < 3) {
                  int64_t v16 = 0;
                }
                if (v16 + 64 < v32) {
                  int64_t v14 = v16 + 64;
                }
                int64_t v33 = v16;
                int64_t v34 = v14;
                v37.location = v31 + v16;
                v37.length = v14 - v16;
                CFStringGetCharacters(theString, v37, (UniChar *)&v20);
                int64_t v6 = v33;
              }
              UniChar v15 = *((_WORD *)&v20 + v13 - v6);
            }
            if (v15 >> 10 != 55) {
              goto LABEL_37;
            }
            ++v8;
          }
        }
      }
LABEL_42:
      if (++v8 >= v3)
      {

        break;
      }
    }
  }
  return v2;
}

- (id)tsu_stringByRemovingCharactersInSet:(id)a3 options:(unsigned int)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = self;
    if ([(NSString *)v7 rangeOfCharacterFromSet:v6] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v8 = v7;
    }
    else
    {
      int64_t v8 = +[NSMutableString string];
      NSUInteger v11 = [(NSString *)v7 length];
      if (v11)
      {
        NSUInteger v12 = v11;
        int64_t v13 = 0;
        uint64_t v14 = a4 & 0xFFFFFFFB;
        NSUInteger v15 = v11;
        do
        {
          int64_t v16 = (char *)-[NSString rangeOfCharacterFromSet:options:range:](v7, "rangeOfCharacterFromSet:options:range:", v6, v14, v13, v15);
          if (v16 == (char *)0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v18 = 0;
          }
          else {
            uint64_t v18 = v17;
          }
          if (v16 == (char *)0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v19 = (char *)v12;
          }
          else {
            uint64_t v19 = v16;
          }
          long long v20 = -[NSString substringWithRange:](v7, "substringWithRange:", v13, v19 - v13);
          [(NSString *)v8 appendString:v20];

          int64_t v13 = &v19[v18];
          NSUInteger v15 = v12 - (void)&v19[v18];
        }
        while ((char *)v12 != &v19[v18]);
      }
    }
  }
  else
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CC028);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100164AB8();
    }
    int64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(TSUAdditions) tsu_stringByRemovingCharactersInSet:options:]");
    UniChar v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSString_TSUAdditions.m"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 313, 0, "invalid nil value for '%{public}s'", "charSet");

    +[TSUAssertionHandler logBacktraceThrottled];
    int64_t v8 = self;
  }

  return v8;
}

- (id)tsu_stringByRemovingCharactersInSet:(id)a3
{
  return [(NSString *)self tsu_stringByRemovingCharactersInSet:a3 options:0];
}

- (id)tsu_stringByReplacingInstancesOfCharactersInSet:(id)a3 withString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NSString *)self rangeOfCharacterFromSet:v6 options:2] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v8 = self;
  }
  else
  {
    int64_t v9 = +[NSMutableString stringWithCapacity:[(NSString *)self length]];
    UniChar v10 = +[NSScanner scannerWithString:self];
    [v10 setCharactersToBeSkipped:0];
    if (([v10 isAtEnd] & 1) == 0)
    {
      id v11 = 0;
      while (1)
      {
        id v17 = v11;
        unsigned int v12 = [v10 scanUpToCharactersFromSet:v6 intoString:&v17];
        id v13 = v17;

        if (v12) {
          [v9 appendString:v13];
        }
        if ([v10 isAtEnd]) {
          break;
        }
        id v16 = v13;
        [v10 scanCharactersFromSet:v6 intoString:&v16];
        id v11 = v16;

        for (i = (char *)[v11 length]; i; --i)
          [v9 appendString:v7];
        if ([v10 isAtEnd]) {
          goto LABEL_13;
        }
      }
      id v11 = v13;
LABEL_13:
    }
    int64_t v8 = +[NSString stringWithString:v9];
  }
  return v8;
}

- (unint64_t)tsu_countInstancesOfString:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  NSUInteger v7 = [(NSString *)self length];
  int64_t v8 = (char *)[v6 length];
  id v9 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", v6, a4, 0, v7);
  unint64_t v10 = 0;
  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = 0;
    unint64_t v10 = 0;
    do
    {
      ++v10;
      unsigned int v12 = &v8[(void)v9];
      NSUInteger v7 = (NSUInteger)&v11[v7 - (unint64_t)&v8[(void)v9]];
      id v9 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", v6, a4, &v8[(void)v9], v7);
      id v11 = v12;
    }
    while (v9 != (id)0x7FFFFFFFFFFFFFFFLL);
  }

  return v10;
}

- (id)tsu_escapeForIcuRegex
{
  if (qword_1001EB8D0 != -1) {
    dispatch_once(&qword_1001EB8D0, &stru_1001CC048);
  }
  uint64_t v3 = self;
  id v4 = [(NSString *)v3 length];
  *(void *)&long long v13 = [(NSString *)v3 rangeOfCharacterFromSet:qword_1001EB8C8];
  if ((void)v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = objc_alloc((Class)NSMutableString);
    NSUInteger v7 = [(NSString *)v3 substringToIndex:(void)v13];
    id v5 = (NSString *)[v6 initWithString:v7];

    if (v4 != (char *)v13)
    {
      do
      {
        [(NSString *)v5 appendFormat:@"\\%C", [(NSString *)v3 characterAtIndex:(void)v13]];
        *(void *)&long long v13 = v13 + 1;
        *((void *)&v13 + 1) = &v4[-v13];
        uint64_t v8 = v13;
        if (v4 != (char *)v13)
        {
          *(void *)&long long v12 = [(NSString *)v3 rangeOfCharacterFromSet:qword_1001EB8C8 options:0 range:(void)v13];
          *((void *)&v12 + 1) = v9;
          long long v13 = v12;
          if ((void)v12 == 0x7FFFFFFFFFFFFFFFLL) {
            long long v13 = (unint64_t)v4;
          }
          if ((void)v13 != v8)
          {
            unint64_t v10 = -[NSString substringWithRange:](v3, "substringWithRange:", v8, (void)v13 - v8);
            [(NSString *)v5 appendString:v10];
          }
        }
      }
      while (*((void *)&v13 + 1));
    }
  }
  return v5;
}

- (BOOL)tsu_isDescendantOfPath:(id)a3
{
  id v4 = a3;
  id v5 = [(NSString *)self pathComponents];
  id v6 = [v4 pathComponents];
  NSUInteger v7 = (char *)[v6 count];
  if (v7)
  {
    do
    {
      uint64_t v8 = v7 - 1;
      uint64_t v9 = [v6 objectAtIndexedSubscript:v7 - 1];
      unsigned int v10 = [v9 isEqualToString:@"/"];

      if (!v10) {
        break;
      }
      --v7;
    }
    while (v8);
  }
  id v11 = (char *)[v5 count];
  unsigned __int8 v12 = v7 <= v11;
  if (v7 - 1 < v11)
  {
    uint64_t v13 = 0;
    unsigned int v14 = 1;
    do
    {
      NSUInteger v15 = [v5 objectAtIndexedSubscript:v13];
      id v16 = [v6 objectAtIndexedSubscript:v13];
      unsigned __int8 v12 = [v15 isEqualToString:v16];

      if ((unint64_t)v7 <= v14) {
        break;
      }
      uint64_t v13 = v14++;
    }
    while ((v12 & 1) != 0);
  }

  return v12;
}

- (BOOL)tsu_isChildOfPath:(id)a3
{
  id v4 = a3;
  id v5 = [(NSString *)self pathComponents];
  id v6 = [v5 mutableCopy];

  NSUInteger v7 = [v4 pathComponents];
  id v8 = [v7 mutableCopy];

  if ((unint64_t)[v6 count] >= 2)
  {
    do
    {
      uint64_t v9 = [v6 lastObject];
      unsigned int v10 = [v9 isEqualToString:@"/"];

      if (!v10) {
        break;
      }
      objc_msgSend(v6, "removeObjectAtIndex:", (char *)objc_msgSend(v6, "count") - 1);
    }
    while ((unint64_t)[v6 count] > 1);
  }
  if ((unint64_t)[v8 count] >= 2)
  {
    do
    {
      id v11 = [v8 lastObject];
      unsigned int v12 = [v11 isEqualToString:@"/"];

      if (!v12) {
        break;
      }
      objc_msgSend(v8, "removeObjectAtIndex:", (char *)objc_msgSend(v8, "count") - 1);
    }
    while ((unint64_t)[v8 count] > 1);
  }
  uint64_t v13 = (char *)[v8 count] + 1;
  unsigned int v14 = (char *)[v6 count];
  unsigned __int8 v15 = v13 == v14;
  id v16 = [v8 count];
  if (v16 && v13 == v14)
  {
    unint64_t v17 = (unint64_t)v16;
    uint64_t v18 = 0;
    unsigned int v19 = 1;
    do
    {
      long long v20 = [v6 objectAtIndexedSubscript:v18];
      long long v21 = [v8 objectAtIndexedSubscript:v18];
      unsigned __int8 v15 = [v20 isEqualToString:v21];

      if (v17 <= v19) {
        break;
      }
      uint64_t v18 = v19++;
    }
    while ((v15 & 1) != 0);
  }

  return v15;
}

- (id)tsu_stringWithRealpath
{
  CFUUIDRef v2 = realpath_DARWIN_EXTSN([(NSString *)self fileSystemRepresentation], 0);
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = +[NSString stringWithCString:v2 encoding:4];
    free(v3);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)tsu_stringWithTrimmedWhitespace
{
  uint64_t v3 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v4 = [(NSString *)self componentsSeparatedByCharactersInSet:v3];
  id v5 = [v4 componentsJoinedByString:@" "];

  id v6 = [v5 stringByTrimmingCharactersInSet:v3];

  return v6;
}

- (id)tsu_substringWithComposedCharacterSequencesTruncatedToLength:(unint64_t)a3
{
  if ([(NSString *)self length] <= a3)
  {
    id v5 = self;
  }
  else
  {
    id v5 = [(NSString *)self substringToIndex:[(NSString *)self rangeOfComposedCharacterSequenceAtIndex:a3]];
  }
  return v5;
}

- (id)tsu_substringWithComposedCharacterSequencesToFileSystemLength:(unint64_t)a3
{
  NSUInteger v5 = [(NSString *)self length];
  NSUInteger v6 = 0;
  if (v5)
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [(NSString *)self rangeOfComposedCharacterSequenceAtIndex:v6];
      uint64_t v10 = v9;
      -[NSString substringWithRange:](self, "substringWithRange:", v8, v9);
      id v11 = objc_claimAutoreleasedReturnValue();
      unsigned int v12 = (const char *)[v11 fileSystemRepresentation];

      v7 += strlen(v12);
      if (v7 > a3) {
        break;
      }
      v6 += v10;
    }
    while (v6 < v5);
  }
  if (v6 == v5)
  {
    uint64_t v13 = self;
  }
  else
  {
    uint64_t v13 = [(NSString *)self substringToIndex:v6];
  }
  return v13;
}

- (id)tsu_substringWithComposedCharacterSequencesTruncatedToGlyphCount:(unint64_t)a3
{
  id v4 = self;
  if ([(NSString *)v4 length] > a3)
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v14[3] = 0;
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3010000000;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    id v11 = &unk_100185BE2;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10007E3A0;
    v7[3] = &unk_1001CC090;
    v7[4] = &v8;
    v7[5] = v14;
    v7[6] = a3;
    -[NSString enumerateSubstringsInRange:options:usingBlock:](v4, "enumerateSubstringsInRange:options:usingBlock:", 0, [(NSString *)v4 length], 2, v7);
    uint64_t v5 = -[NSString substringWithRange:](v4, "substringWithRange:", v9[4], v9[5]);

    _Block_object_dispose(&v8, 8);
    _Block_object_dispose(v14, 8);
    id v4 = (NSString *)v5;
  }
  return v4;
}

- (id)tsu_substringByTruncatingToSize:(CGSize)a3 forAttributes:(id)a4
{
  CGFloat height = a3.height;
  double width = a3.width;
  id v7 = a4;
  uint64_t v8 = self;
  [(NSString *)v8 sizeWithAttributes:v7];
  if (width <= v9)
  {
    id v11 = SFUMainBundle();
    uint64_t v12 = [v11 localizedStringForKey:@"…" value:&stru_1001D3790 table:@"TSUtility"];

    id v13 = [(NSString *)v8 length];
    uint64_t v32 = 0;
    int64_t v33 = &v32;
    uint64_t v34 = 0x3010000000;
    unint64_t v35 = &unk_100185BE2;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    long long v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    long long v24 = sub_10007E650;
    long long v25 = &unk_1001CC0B8;
    id v29 = &v32;
    unsigned int v14 = v8;
    long long v26 = v14;
    id v15 = v12;
    id v27 = v15;
    id v28 = v7;
    double v30 = width;
    CGFloat v31 = height;
    id v16 = objc_retainBlock(&v22);
    -[NSString enumerateSubstringsInRange:options:usingBlock:](v14, "enumerateSubstringsInRange:options:usingBlock:", 0, v13, 3, v16, v22, v23, v24, v25);
    unint64_t v17 = v33;
    uint64_t v18 = v33[5];
    if (!v18)
    {
      -[NSString enumerateSubstringsInRange:options:usingBlock:](v14, "enumerateSubstringsInRange:options:usingBlock:", 0, v13, 2, v16);
      unint64_t v17 = v33;
      uint64_t v18 = v33[5];
    }
    unsigned int v19 = -[NSString substringWithRange:](v14, "substringWithRange:", v17[4], v18);

    if (([v19 isEqualToString:v14] & 1) == 0)
    {
      uint64_t v20 = [v19 stringByAppendingString:v15];

      unsigned int v19 = (void *)v20;
    }
    uint64_t v10 = v19;

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    uint64_t v10 = v8;
  }

  return v10;
}

- (id)tsu_substringWithTrailingQuoteIfNeededByTruncatingToSize:(CGSize)a3 forAttributes:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = self;
  id v8 = a4;
  double v9 = SFUMainBundle();
  uint64_t v10 = [v9 localizedStringForKey:@"”" value:&stru_1001D3790 table:@"TSUtility"];

  id v11 = [(NSString *)v7 substringFromIndex:(char *)[(NSString *)v7 length] - 1];
  unsigned int v12 = [v11 isEqualToString:v10];
  id v13 = -[NSString tsu_substringByTruncatingToSize:forAttributes:](v7, "tsu_substringByTruncatingToSize:forAttributes:", v8, width, height);

  if (([v13 isEqualToString:v7] & 1) == 0 && v12)
  {
    uint64_t v14 = [v13 stringByAppendingString:v10];

    id v13 = (void *)v14;
  }

  return v13;
}

- (id)tsu_stringWithPathRelativeTo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    NSUInteger v6 = [(NSString *)self stringByStandardizingPath];
    id v7 = [v6 pathComponents];

    id v8 = [v4 stringByStandardizingPath];
    double v9 = [v8 pathComponents];

    uint64_t v10 = (char *)[v7 count];
    id v11 = (char *)[v9 count];
    if (v10 < v11) {
      goto LABEL_10;
    }
    unint64_t v12 = (unint64_t)v11;
    if (!v11) {
      goto LABEL_8;
    }
    long long v22 = v5;
    uint64_t v13 = 0;
    unsigned int v14 = 1;
    do
    {
      id v15 = [v9 objectAtIndexedSubscript:v13];
      id v16 = [v7 objectAtIndexedSubscript:v13];
      unsigned __int8 v17 = [v15 isEqualToString:v16];

      if ((v17 & 1) == 0) {
        break;
      }
      uint64_t v13 = v14;
    }
    while (v12 > v14++);
    uint64_t v5 = v22;
    if (v12 != v13)
    {
LABEL_10:
      unsigned int v19 = 0;
    }
    else
    {
LABEL_8:
      if (v10 == (char *)v12)
      {
        unsigned int v19 = &stru_1001D3790;
      }
      else
      {
        long long v21 = objc_msgSend(v7, "subarrayWithRange:", v12, &v10[-v12]);
        unsigned int v19 = +[NSString pathWithComponents:v21];
      }
    }
  }
  else
  {
    unsigned int v19 = 0;
  }

  return v19;
}

- (id)tsu_stringWithPathRelativeTo:(id)a3 allowBacktracking:(BOOL)a4
{
  id v6 = a3;
  if (a4)
  {
    id v7 = [(NSString *)self stringByStandardizingPath];
    id v8 = [v7 pathComponents];

    double v9 = [v6 stringByStandardizingPath];
    uint64_t v10 = [v9 pathComponents];

    id v11 = (char *)[v8 count];
    unint64_t v12 = (char *)[v10 count];
    uint64_t v13 = v12;
    if (v12 >= v11) {
      unint64_t v14 = (unint64_t)v11;
    }
    else {
      unint64_t v14 = (unint64_t)v12;
    }
    if (v14)
    {
      uint64_t v15 = 0;
      id v16 = 0;
      do
      {
        unsigned __int8 v17 = [v10 objectAtIndexedSubscript:v15];
        uint64_t v18 = [v8 objectAtIndexedSubscript:v15];
        unsigned int v19 = [v17 isEqualToString:v18];

        if (!v19) {
          break;
        }
        uint64_t v15 = ++v16;
      }
      while (v14 > v16);
    }
    else
    {
      id v16 = 0;
    }
    int64_t v21 = v13 - v16;
    if (v13 <= v16)
    {
      uint64_t v23 = &stru_1001D3790;
    }
    else
    {
      long long v22 = &stru_1001D3790;
      do
      {
        uint64_t v23 = [(__CFString *)v22 stringByAppendingPathComponent:@".."];

        long long v22 = v23;
        --v21;
      }
      while (v21);
    }
    if (v16 >= v11)
    {
      uint64_t v20 = v23;
    }
    else
    {
      do
      {
        long long v24 = [v8 objectAtIndexedSubscript:v16];
        uint64_t v20 = [(__CFString *)v23 stringByAppendingPathComponent:v24];

        ++v16;
        uint64_t v23 = v20;
      }
      while (v11 != v16);
    }
  }
  else
  {
    uint64_t v20 = [(NSString *)self tsu_stringWithPathRelativeTo:v6];
  }

  return v20;
}

- (id)tsu_stringByTrimmingCharactersInSetFromFront:(id)a3
{
  p_isa = self;
  id v5 = [(NSString *)p_isa rangeOfCharacterFromSet:a3 options:8];
  id v7 = v6;
  if (v6 == (void *)[(NSString *)p_isa length])
  {
    CFStringRef v8 = &stru_1001D3790;
  }
  else
  {
    if (v5) {
      goto LABEL_6;
    }
    CFStringRef v8 = [(NSString *)p_isa substringFromIndex:v7];
  }

  p_isa = &v8->isa;
LABEL_6:
  return p_isa;
}

+ (id)tsu_stringWithHexFromBytes:(const char *)a3 length:(unint64_t)a4
{
  unint64_t v4 = a4;
  unint64_t v6 = 2 * a4;
  id v7 = malloc_type_malloc(2 * a4, 0x9F79277AuLL);
  if (v4)
  {
    CFStringRef v8 = v7;
    do
    {
      unsigned int v9 = *(unsigned __int8 *)a3++;
      *CFStringRef v8 = a0123456789abcd[(unint64_t)v9 >> 4];
      v8[1] = a0123456789abcd[v9 & 0xF];
      v8 += 2;
      --v4;
    }
    while (v4);
  }
  id v10 = [objc_alloc((Class)NSString) initWithBytesNoCopy:v7 length:v6 encoding:1 freeWhenDone:1];
  return v10;
}

- (BOOL)tsu_isTaggedPointer
{
  if (qword_1001EB8E0 != -1) {
    dispatch_once(&qword_1001EB8E0, &stru_1001CC0D8);
  }
  return objc_opt_class() == qword_1001EB8D8;
}

- (id)tsu_stringByIncrementingCounterAfterDuplicateTitleModifierWithUniquenessTest:(id)a3
{
  id v4 = a3;
  id v5 = SFUMainBundle();
  unint64_t v6 = [v5 localizedStringForKey:@"copy" value:&stru_1001D3790 table:@"TSUtility"];

  id v7 = SFUMainBundle();
  CFStringRef v8 = [v7 localizedStringForKey:@"%1$@ %2$@" value:&stru_1001D3790 table:@"TSUtility"];

  unsigned int v9 = SFUMainBundle();
  id v10 = [v9 localizedStringForKey:@"%1$@ %2$@ %3$@" value:&stru_1001D3790 table:@"TSUtility"];

  id v11 = objc_alloc_init((Class)NSNumberFormatter);
  unint64_t v12 = [(NSString *)self tsu_stringByIncrementingCounterAfterDuplicateTitleModifierWithLocalizedCopyString:v6 firstCopyFormatString:v8 generalCopyFormatString:v10 numberFormatter:v11 uniquenessTest:v4];

  return v12;
}

- (id)tsu_stringByIncrementingCounterAfterDuplicateTitleModifierWithLocalizedCopyString:(id)a3 firstCopyFormatString:(id)a4 generalCopyFormatString:(id)a5 numberFormatter:(id)a6 uniquenessTest:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (unsigned int (**)(id, id))a7;
  uint64_t v32 = 0;
  uint64_t v17 = [(NSString *)self tsu_parseBaseTitleWithLocalizedCopyString:v12 firstCopyFormatString:v13 generalCopyFormatString:v14 outNumber:&v32];
  uint64_t v18 = (void *)v17;
  if (v17)
  {
    v33[0] = @"%1$@";
    v33[1] = @"%2$@";
    double v30 = (void *)v17;
    id v31 = v12;
    v34[0] = v17;
    v34[1] = v12;
    unsigned int v19 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    id v20 = [v19 mutableCopy];

    for (id i = [(NSString *)self copy];
          [(NSString *)self isEqualToString:i] || v16[2](v16, i);
          id i = (id)v28)
    {
      uint64_t v22 = v32;
      uint64_t v23 = ++v32;
      if (v22) {
        long long v24 = v14;
      }
      else {
        long long v24 = v13;
      }
      id v25 = v24;
      long long v26 = +[NSNumber numberWithUnsignedInteger:v23];
      id v27 = [v15 stringFromNumber:v26];
      [v20 setObject:v27 forKeyedSubscript:@"%3$@"];

      uint64_t v28 = objc_msgSend(v25, "tsu_stringByApplyingSubstitutions:", v20);
    }
    uint64_t v18 = v30;
    id v12 = v31;
  }
  else
  {
    id i = [(NSString *)self copy];
  }

  return i;
}

- (id)tsu_parseBaseTitleWithLocalizedCopyString:(id)a3 firstCopyFormatString:(id)a4 generalCopyFormatString:(id)a5 outNumber:(unint64_t *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_msgSend(v12, "tsu_regexForTitleParsingWithLocalizedCopyString:isFirstCopyFormatString:", v10, 0);
  if (!v13)
  {
    int64_t v21 = self;
    goto LABEL_23;
  }
  id v14 = objc_msgSend(v13, "firstMatchInString:options:range:", self, 0, 0, -[NSString length](self, "length"));
  if (v14)
  {
    id v15 = [v12 rangeOfString:@"%1$@"];
    id v16 = [v12 rangeOfString:@"%3$@"];
    if (v15 < v16) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = 2;
    }
    if (v15 >= v16) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = 2;
    }
    id v19 = [v14 rangeAtIndex:v17];
    -[NSString substringWithRange:](self, "substringWithRange:", v19, v20);
    int64_t v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v22 = [v14 rangeAtIndex:v18];
    long long v24 = -[NSString substringWithRange:](self, "substringWithRange:", v22, v23);
    unint64_t v25 = (unint64_t)[v24 integerValue];
    goto LABEL_20;
  }
  long long v26 = objc_msgSend(v11, "tsu_regexForTitleParsingWithLocalizedCopyString:isFirstCopyFormatString:", v10, 1);
  if (v26)
  {
    long long v24 = v26;
    uint64_t v32 = objc_msgSend(v26, "firstMatchInString:options:range:", self, 0, 0, -[NSString length](self, "length"));
    if (v32)
    {
      id v27 = [v11 rangeOfString:@"%1$@"];
      unint64_t v25 = 1;
      if (v27 < [v11 rangeOfString:@"%3$@"]) {
        uint64_t v28 = 1;
      }
      else {
        uint64_t v28 = 2;
      }
      id v29 = [v32 rangeAtIndex:v28];
      -[NSString substringWithRange:](self, "substringWithRange:", v29, v30);
      int64_t v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int64_t v21 = (NSString *)[(NSString *)self copy];
      unint64_t v25 = 0;
    }

LABEL_20:
    if (a6) {
      *a6 = v25;
    }
    goto LABEL_22;
  }
  int64_t v21 = self;
LABEL_22:

LABEL_23:
  return v21;
}

- (id)tsu_stringByApplyingSubstitutions:(id)a3
{
  id v4 = a3;
  id v5 = [(NSString *)self mutableCopy];
  unint64_t v6 = objc_opt_new();
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10007F680;
  v25[3] = &unk_1001CC120;
  v25[4] = v5;
  v25[5] = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v25];
  id v7 = [v6 allKeys];
  CFStringRef v8 = [v7 sortedArrayUsingComparator:&stru_1001CC160];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (id i = 0; i != v11; id i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v15 = objc_msgSend(v6, "objectForKeyedSubscript:", v14, (void)v21);
        id v16 = [v14 rangeValue];
        if (v15) {
          BOOL v18 = v16 == (id)0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          BOOL v18 = 1;
        }
        if (!v18) {
          objc_msgSend(v5, "replaceCharactersInRange:withString:", v16, v17, v15);
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v11);
  }

  id v19 = [v5 copy];
  return v19;
}

- (id)tsu_regexForTitleParsingWithLocalizedCopyString:(id)a3 isFirstCopyFormatString:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ((id)[(NSString *)self tsu_countInstancesOfString:@"%1$@" options:0] == (id)1&& (id)[(NSString *)self tsu_countInstancesOfString:@"%2$@" options:0] == (id)1&& (v4|| (id)[(NSString *)self tsu_countInstancesOfString:@"%3$@" options:0] == (id)1))
  {
    id v7 = +[NSRegularExpression escapedPatternForString:self];
    CFStringRef v8 = +[NSRegularExpression escapedPatternForString:@"%1$@"];
    v19[0] = v8;
    v20[0] = @"(.*)";
    id v9 = +[NSRegularExpression escapedPatternForString:@"%2$@"];
    v19[1] = v9;
    v20[1] = v6;
    id v10 = +[NSRegularExpression escapedPatternForString:@"%3$@"];
    v19[2] = v10;
    v20[2] = @"(\\d+)";
    id v11 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];

    uint64_t v12 = objc_msgSend(v7, "tsu_stringByApplyingSubstitutions:", v11);
    id v13 = +[NSRegularExpression regularExpressionWithPattern:v12 options:0 error:0];
  }
  else
  {
    unsigned int v14 = +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CC180);
    }
    id v15 = TSUAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110402;
      unsigned int v22 = v14;
      __int16 v23 = 2082;
      long long v24 = "-[NSString(TSUAdditions) tsu_regexForTitleParsingWithLocalizedCopyString:isFirstCopyFormatString:]";
      __int16 v25 = 2082;
      long long v26 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSString_TSUAdditions.m";
      __int16 v27 = 1024;
      int v28 = 868;
      __int16 v29 = 2114;
      uint64_t v30 = self;
      __int16 v31 = 1024;
      BOOL v32 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Invalid format string: %{public}@, isFirstCopyFormatString: %d", buf, 0x32u);
    }
    id v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(TSUAdditions) tsu_regexForTitleParsingWithLocalizedCopyString:isFirstCopyFormatString:]");
    uint64_t v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSString_TSUAdditions.m"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 868, 0, "Invalid format string: %{public}@, isFirstCopyFormatString: %d", self, v4);

    +[TSUAssertionHandler logBacktraceThrottled];
    id v13 = 0;
  }

  return v13;
}

+ (id)tsu_stringByBase64EncodingBytes:(const char *)a3 length:(unint64_t)a4
{
  return +[NSString tsu_stringByBase64EncodingBytes:a3 length:a4 breakLines:0];
}

+ (id)tsu_stringByBase64EncodingBytes:(const char *)a3 length:(unint64_t)a4 breakLines:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v6 = a4;
  CFStringRef v8 = +[NSMutableString stringWithCapacity:4 * a4 / 3];
  if (v6 < 3)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    id v10 = a3 + 2;
    int v11 = -4;
    unsigned int v12 = 4;
    do
    {
      objc_msgSend(v8, "appendFormat:", @"%c%c%c%c", aAbcdefghijklmn[*(v10 - 2) >> 2], aAbcdefghijklmn[((unint64_t)((*((unsigned __int8 *)v10 - 1) << 8) | (*((unsigned __int8 *)v10 - 2) << 16)) >> 12) & 0x3F], aAbcdefghijklmn[((unint64_t)(*(unsigned __int8 *)v10 | (*((unsigned __int8 *)v10 - 1) << 8)) >> 6) & 0x3F], aAbcdefghijklmn[*v10 & 0x3F]);
      if (v5 && !(v11 + 76 * (v12 / 0x4C))) {
        [v8 appendString:@"\n"];
      }
      v10 += 3;
      v11 -= 4;
      v12 += 4;
      v9 -= 3;
    }
    while (v6 + v9 > 2);
    uint64_t v13 = -v9;
    v6 += v9;
  }
  if (v6 == 1)
  {
    objc_msgSend(v8, "appendFormat:", @"%c%c==", aAbcdefghijklmn[(unint64_t)a3[v13] >> 2], aAbcdefghijklmn[16 * (a3[v13] & 3)], v16);
  }
  else if (v6 == 2)
  {
    unsigned int v14 = &a3[v13];
    objc_msgSend(v8, "appendFormat:", @"%c%c%c=", aAbcdefghijklmn[*v14 >> 2], aAbcdefghijklmn[((unint64_t)((*(unsigned __int8 *)v14 << 16) | (*((unsigned __int8 *)v14 + 1) << 8)) >> 12) & 0x3F], aAbcdefghijklmn[4 * (v14[1] & 0xF)]);
  }
  return v8;
}

- (id)tsu_encodeStringBase64
{
  CFUUIDRef v2 = [(NSString *)self UTF8String];
  size_t v3 = strlen(v2);
  return +[NSString tsu_stringByBase64EncodingBytes:v2 length:v3];
}

- (id)tsu_stringByMakingFirstCharacterLowercase
{
  CFUUIDRef v2 = self;
  if ([(NSString *)v2 length])
  {
    size_t v3 = [(NSString *)v2 substringToIndex:1];
    BOOL v4 = [v3 lowercaseString];
    if (([v3 isEqualToString:v4] & 1) == 0)
    {
      BOOL v5 = [(NSString *)v2 substringFromIndex:1];
      uint64_t v6 = [v4 stringByAppendingString:v5];

      CFUUIDRef v2 = (NSString *)v6;
    }
  }
  return v2;
}

- (id)tsu_stringByMakingFirstCharacterUppercase
{
  id v3 = [(NSString *)self mutableCopy];
  if ([v3 length])
  {
    BOOL v4 = [(NSString *)self substringToIndex:1];
    BOOL v5 = [v4 uppercaseString];
    objc_msgSend(v3, "replaceCharactersInRange:withString:", 0, 1, v5);
  }
  return v3;
}

- (id)tsu_stringTrimByLimitingFirstCharacterToSet:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  if ([(NSString *)v5 length])
  {
    unsigned __int16 v6 = [(NSString *)v5 characterAtIndex:0];
    if ([(NSString *)v5 length])
    {
      while (([v4 characterIsMember:v6] & 1) == 0)
      {
        id v7 = [(NSString *)v5 substringFromIndex:1];

        if ([v7 length]) {
          unsigned __int16 v6 = (unsigned __int16)[v7 characterAtIndex:0];
        }
        BOOL v5 = (NSString *)v7;
        if (![v7 length]) {
          goto LABEL_9;
        }
      }
    }
  }
  id v7 = v5;
LABEL_9:

  return v7;
}

+ (id)tsu_stringWithXMLString:(const char *)a3
{
  return +[NSString stringWithCString:a3 encoding:4];
}

- (id)tsu_escapeXML
{
  id v2 = [(NSString *)self mutableCopy];
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"&", @"&amp;",
    0,
    0,
    [v2 length]);
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"<", @"&lt;",
    0,
    0,
    [v2 length]);
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @">", @"&gt;",
    0,
    0,
    [v2 length]);
  return v2;
}

- (id)tsu_unescapeXML
{
  id v2 = [(NSString *)self mutableCopy];
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"&amp;",
    @"&",
    0,
    0,
    [v2 length]);
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"&lt;",
    @"<",
    0,
    0,
    [v2 length]);
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"&gt;",
    @">",
    0,
    0,
    [v2 length]);
  return v2;
}

- (BOOL)tsu_containsOnlyCharactersFromSet:(id)a3
{
  id v4 = [a3 invertedSet];
  id v5 = [(NSString *)self rangeOfCharacterFromSet:v4];

  return v5 == (id)0x7FFFFFFFFFFFFFFFLL;
}

- (id)tsu_stringByDeletingPathExtensionIfEqualTo:(id)a3
{
  id v4 = a3;
  id v5 = [(NSString *)self pathExtension];
  unsigned __int8 v6 = [v5 isEqualToString:v4];

  if (v6)
  {
    id v7 = [(NSString *)self stringByDeletingPathExtension];
  }
  else
  {
    id v7 = self;
  }
  CFStringRef v8 = v7;

  return v8;
}

- (id)tsu_tolerantStringByAppendingPathExtension:(id)a3
{
  id v4 = a3;
  if ([(NSString *)self isEqualToString:&stru_1001D3790]
    || [v4 isEqualToString:&stru_1001D3790])
  {
    id v5 = self;
LABEL_4:
    unsigned __int8 v6 = v5;
    goto LABEL_5;
  }
  if ([(NSString *)self isEqualToString:@"\\\\""])
  {
    CFStringRef v8 = [@"\\"" stringByAppendingPathExtension:v4];
    uint64_t v9 = [@"\\"" stringByAppendingString:v8];
  }
  else
  {
    if (![(NSString *)self length] || [(NSString *)self characterAtIndex:0] != 126)
    {
      id v5 = [(NSString *)self stringByAppendingPathExtension:v4];
      goto LABEL_4;
    }
    id v10 = [@"X" stringByAppendingString:self];
    CFStringRef v8 = [v10 stringByAppendingPathExtension:v4];

    uint64_t v9 = [v8 substringFromIndex:1];
  }
  unsigned __int8 v6 = (void *)v9;

LABEL_5:
  return v6;
}

+ (id)tsu_stringByHexEncodingData:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableString string];
  id v5 = v3;
  unsigned __int8 v6 = (unsigned __int8 *)[v5 bytes];
  id v7 = (char *)[v5 length];
  if (v7)
  {
    CFStringRef v8 = v7;
    do
    {
      unsigned int v9 = *v6++;
      objc_msgSend(v4, "appendFormat:", @"%02x", v9);
      --v8;
    }
    while (v8);
  }
  id v10 = [v4 copy];

  return v10;
}

- (_NSRange)tsu_rangeOfString:(id)a3 options:(unint64_t)a4 updatingSearchRange:(_NSRange *)a5
{
  id v8 = a3;
  unsigned int v9 = v8;
  if (a5)
  {
    NSUInteger location = a5->location;
    NSUInteger length = a5->length;
    id v12 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", v8, a4, a5->location, length);
    id v14 = v12;
    NSUInteger v15 = v13;
    if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      *a5 = (_NSRange)TSUInvalidRange;
    }
    else if ((a4 & 4) != 0)
    {
      a5->NSUInteger location = location;
      a5->NSUInteger length = (NSUInteger)v12 - location;
    }
    else
    {
      a5->NSUInteger location = (NSUInteger)v12 + v13;
      a5->NSUInteger length = length + location - ((void)v12 + v13);
    }
  }
  else
  {
    id v14 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", v8, a4, 0, [v8 length]);
    NSUInteger v15 = v16;
  }

  NSUInteger v17 = (NSUInteger)v14;
  NSUInteger v18 = v15;
  result.NSUInteger length = v18;
  result.NSUInteger location = v17;
  return result;
}

- (_NSRange)tsu_range
{
  NSUInteger v2 = [(NSString *)self length];
  NSUInteger v3 = 0;
  result.NSUInteger length = v2;
  result.NSUInteger location = v3;
  return result;
}

- (void)tsu_enumerateRangesOfCharactersInSet:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, unsigned char *, int64_t, char *))a4;
  id v8 = [objc_alloc((Class)NSScanner) initWithString:self];
  [v8 setCaseSensitive:1];
  [v8 setCharactersToBeSkipped:0];
  if (([v8 isAtEnd] & 1) == 0)
  {
    do
    {
      unsigned int v9 = [v8 scanLocation];
      if ([v8 scanCharactersFromSet:v6 intoString:0])
      {
        id v10 = [v8 scanLocation];
        char v11 = 0;
        v7[2](v7, v9, v10 - v9, &v11);
        if (v11) {
          break;
        }
      }
      if (([v8 isAtEnd] & 1) == 0) {
        [v8 scanUpToCharactersFromSet:v6 intoString:0];
      }
    }
    while (![v8 isAtEnd]);
  }
}

- (BOOL)tsu_containsSubstring:(id)a3
{
  return [(NSString *)self rangeOfString:a3] != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (id)tsu_setOfContainedWordsIncludingPunctuationAndSymbols:(BOOL)a3
{
  BOOL v3 = a3;
  id v30 = +[NSMutableSet set];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100080890;
  v37[3] = &unk_1001CC1A0;
  BOOL v35 = v3;
  BOOL v38 = v3;
  id v5 = objc_retainBlock(v37);
  uint64_t v36 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  CFIndex v6 = [(NSString *)self length];
  CFLocaleRef v7 = CFLocaleCopyCurrent();
  v40.CFIndex location = 0;
  CFIndex v31 = v6;
  v40.CFIndex length = v6;
  id v8 = CFStringTokenizerCreate(kCFAllocatorDefault, (CFStringRef)self, v40, 4uLL, v7);
  CFRelease(v7);
  CFStringTokenizerTokenType v9 = CFStringTokenizerGoToTokenAtIndex(v8, 0);
  LODWORD(v10) = v9;
  if (!v9) {
    ((void (*)(void *, __CFStringTokenizer *))v5[2])(v5, v8);
  }
  CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v8);
  if (CurrentTokenRange.location != -1)
  {
    CFIndex location = CurrentTokenRange.location;
    CFIndex length = CurrentTokenRange.length;
    CFIndex v14 = 0;
    CFIndex v15 = CurrentTokenRange.length;
    uint64_t v34 = self;
    do
    {
      if (location >= v14) {
        CFIndex v16 = v14;
      }
      else {
        CFIndex v16 = location;
      }
      CFIndex v32 = v16;
      CFIndex v33 = length;
      uint64_t v17 = ((uint64_t (*)(void *, __CFStringTokenizer *))v5[2])(v5, v8);
      CFRange v18 = CFStringTokenizerGetCurrentTokenRange(v8);
      CFIndex v19 = v18.location;
      CFIndex length = v18.length;
      if (v35)
      {
        while (1)
        {
          int v20 = v10;
          uint64_t v10 = v17;
          if (((v20 | v17) & 0x20) != 0)
          {
            if ((v17 & 0x10) == 0) {
              goto LABEL_20;
            }
          }
          else if ((v17 & 0x10) != 0 && length == 1)
          {
            if (objc_msgSend(v36, "characterIsMember:", -[NSString characterAtIndex:](self, "characterAtIndex:", v19)))
            {
              uint64_t v28 = 1;
              goto LABEL_21;
            }
          }
          else if (!v17 || (v17 & 0x10) != 0)
          {
            goto LABEL_20;
          }
          uint64_t v17 = ((uint64_t (*)(void *, __CFStringTokenizer *))v5[2])(v5, v8);
          CFRange v21 = CFStringTokenizerGetCurrentTokenRange(v8);
          CFIndex v19 = v21.location;
          CFIndex length = v21.length;
        }
      }
      uint64_t v10 = v17;
LABEL_20:
      uint64_t v28 = length;
LABEL_21:
      CFIndex v22 = location + v15;
      if (location + v15 <= v31) {
        CFIndex v22 = v31;
      }
      if (v19 > v31 || v10 == 0) {
        CFIndex v14 = v22;
      }
      else {
        CFIndex v14 = v19;
      }
      if (v35) {
        CFIndex v24 = v32;
      }
      else {
        CFIndex v24 = location;
      }
      if (v35) {
        CFIndex v25 = v14 - v32;
      }
      else {
        CFIndex v25 = v33;
      }
      long long v26 = -[NSString substringWithRange:](v34, "substringWithRange:", v24, v25, v30);
      __int16 v27 = [v26 stringByTrimmingCharactersInSet:v36];

      if ([v27 length]) {
        [v30 addObject:v27];
      }

      CFIndex location = v19;
      CFIndex v15 = v28;
      self = v34;
    }
    while (v19 != -1);
  }
  if (v8) {
    CFRelease(v8);
  }

  return v30;
}

- (id)tsu_stringWithoutAttachmentCharacters
{
  if (qword_1001EB8F0 != -1) {
    dispatch_once(&qword_1001EB8F0, &stru_1001CC1C0);
  }
  uint64_t v3 = qword_1001EB8E8;
  return [(NSString *)self stringByReplacingOccurrencesOfString:v3 withString:&stru_1001D3790];
}

- (id)tsu_middleTruncateToLength:(unint64_t)a3
{
  id v4 = self;
  if ([(NSString *)v4 length] > a3)
  {
    unint64_t v5 = (a3 >> 1) - 1;
    id v6 = -[NSString rangeOfComposedCharacterSequencesForRange:](v4, "rangeOfComposedCharacterSequencesForRange:", 0, v5);
    id v8 = -[NSString substringWithRange:](v4, "substringWithRange:", v6, v7);
    id v9 = -[NSString rangeOfComposedCharacterSequencesForRange:](v4, "rangeOfComposedCharacterSequencesForRange:", (char *)[(NSString *)v4 length] - v5, v5);
    char v11 = -[NSString substringWithRange:](v4, "substringWithRange:", v9, v10);
    id v12 = SFUMainBundle();
    NSUInteger v13 = [v12 localizedStringForKey:@"%1$@…%2$@" value:&stru_1001D3790 table:@"TSUtility"];

    uint64_t v14 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v8, v11);

    id v4 = (NSString *)v14;
  }
  return v4;
}

- (BOOL)tsu_isEqualToString:(id)a3
{
  if (a3) {
    return -[NSString isEqualToString:](self, "isEqualToString:");
  }
  else {
    return 0;
  }
}

- (id)tsu_stringWithNormalizedHyphensAndQuotationMarks
{
  NSUInteger v2 = [(NSString *)self tsu_stringWithNormalizedHyphens];
  uint64_t v3 = objc_msgSend(v2, "tsu_stringWithNormalizedQuotationMarks");

  return v3;
}

- (id)tsu_stringWithNormalizedHyphens
{
  if (qword_1001EB8F8 != -1) {
    dispatch_once(&qword_1001EB8F8, &stru_1001CC1E0);
  }
  uint64_t v3 = qword_1001EB900;
  return [(NSString *)self tsu_stringByReplacingInstancesOfCharactersInSet:v3 withString:@"-"];
}

- (id)tsu_stringWithNormalizedQuotationMarks
{
  if (qword_1001EB908 != -1) {
    dispatch_once(&qword_1001EB908, &stru_1001CC200);
  }
  uint64_t v3 = qword_1001EB910;
  return [(NSString *)self tsu_stringByReplacingInstancesOfCharactersInSet:v3 withString:@"'"];
}

- (id)tsu_stringWithoutBidiControls
{
  uint64_t v3 = +[NSCharacterSet characterSetWithCharactersInString:@"\u200E\u200F\u202A\u202B\u202C\u202D\u202E⁦⁧⁨⁩"];
  id v4 = [(NSString *)self tsu_stringByReplacingInstancesOfCharactersInSet:v3 withString:&stru_1001D3790];

  return v4;
}

- (id)tsu_stringWithFirstStrongIsolation
{
  return +[NSString stringWithFormat:@"⁨%@⁩", self];
}

+ (id)tsu_JSONStringFromString:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = +[NSMutableString string];
    objc_msgSend(v3, "tsu_appendJSONStringToString:", v4);
  }
  else
  {
    id v4 = @"null";
  }
  return v4;
}

- (void)tsu_appendJSONStringToString:(id)a3
{
  id v4 = a3;
  if (qword_1001EB920 != -1) {
    dispatch_once(&qword_1001EB920, &stru_1001CC220);
  }
  [v4 appendString:@"\""];
  if ([(NSString *)self rangeOfCharacterFromSet:qword_1001EB918] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v5 = [(NSString *)self length];
    id v6 = (unsigned __int16 *)malloc_type_malloc(2 * v5, 0x1000040BDFB0063uLL);
    [(NSString *)self getCharacters:v6];
    if (!v5)
    {
LABEL_30:
      free(v6);
      goto LABEL_31;
    }
    uint64_t v7 = v6;
    while (1)
    {
      int v9 = *v7++;
      uint64_t v8 = v9;
      __int16 v13 = v9;
      if (v9 <= 33)
      {
        switch((int)v8)
        {
          case 8:
            uint64_t v10 = v4;
            CFStringRef v11 = @"\\b";
            goto LABEL_23;
          case 9:
            uint64_t v10 = v4;
            CFStringRef v11 = @"\\t";
            goto LABEL_23;
          case 10:
            uint64_t v10 = v4;
            CFStringRef v11 = @"\\n";
            goto LABEL_23;
          case 12:
            uint64_t v10 = v4;
            CFStringRef v11 = @"\\f";
            goto LABEL_23;
          case 13:
            uint64_t v10 = v4;
            CFStringRef v11 = @"\\r";
            goto LABEL_23;
          default:
            goto LABEL_26;
        }
      }
      if ((int)v8 > 8231)
      {
        if (v8 == 8232)
        {
          uint64_t v10 = v4;
          CFStringRef v11 = @"\\u2028";
        }
        else
        {
          if (v8 != 8233)
          {
LABEL_26:
            if (v8 < 0x20) {
              +[NSString stringWithFormat:@"\\u%.4x", v8];
            }
            else {
            id v12 = +[NSString stringWithCharacters:&v13 length:1];
            }
            [v4 appendString:v12];

            goto LABEL_24;
          }
          uint64_t v10 = v4;
          CFStringRef v11 = @"\\u2029";
        }
      }
      else if (v8 == 34)
      {
        uint64_t v10 = v4;
        CFStringRef v11 = @"\\\"";
      }
      else
      {
        if (v8 != 92) {
          goto LABEL_26;
        }
        uint64_t v10 = v4;
        CFStringRef v11 = @"\\\\"";
      }
LABEL_23:
      [v10 appendString:v11];
LABEL_24:
      if (!--v5) {
        goto LABEL_30;
      }
    }
  }
  [v4 appendString:self];
LABEL_31:
  [v4 appendString:@"\""];
}

- (id)tsu_stringWithoutNonbreakingSpaces
{
  id v3 = +[NSCharacterSet characterSetWithCharactersInString:@" "];
  id v4 = [(NSString *)self tsu_stringByReplacingInstancesOfCharactersInSet:v3 withString:@" "];

  return v4;
}

- (id)tsu_stringWithNormalizedSpaces
{
  id v3 = +[NSCharacterSet whitespaceCharacterSet];
  id v4 = [(NSString *)self tsu_stringWithoutNonbreakingSpaces];
  NSUInteger v5 = objc_msgSend(v4, "tsu_stringByReplacingInstancesOfCharactersInSet:withString:", v3, @" ");

  return v5;
}

- (id)tsu_uncommentedAddress
{
  unint64_t v3 = [(NSString *)self length];
  id v4 = (char *)NSZoneMalloc(0, 2 * v3 + 2);
  NSUInteger v5 = v4;
  id v6 = v4;
  if (v3)
  {
    unint64_t v7 = 0;
    int v8 = 0;
    char v9 = 0;
    char v19 = 0;
    char v20 = 1;
    id v6 = v4;
    do
    {
      unsigned int v10 = [(NSString *)self characterAtIndex:v7];
      unsigned int v11 = v10;
      if (v10 == 92)
      {
        if (v7 + 1 >= v3)
        {
          if ((v9 & 1) == 0)
          {
            if (v8 < 1) {
              goto LABEL_18;
            }
LABEL_15:
            char v9 = 0;
            v8 -= v10 == 41;
            goto LABEL_24;
          }
LABEL_10:
          *(_WORD *)id v6 = v10;
          v6 += 2;
          v9 &= v10 != 34;
          goto LABEL_24;
        }
        *(_WORD *)id v6 = 92;
        *((_WORD *)v6 + 1) = [(NSString *)self characterAtIndex:v7 + 1];
        v6 += 4;
        ++v7;
      }
      else
      {
        if (v9) {
          goto LABEL_10;
        }
        if (v10 == 40)
        {
          char v9 = 0;
          ++v8;
        }
        else
        {
          if (v8 > 0) {
            goto LABEL_15;
          }
          if (v10 != 60)
          {
            if ((v19 & (v10 == 62)) != 0) {
              break;
            }
            if (v10 > 0x7F)
            {
              if (__maskrune(v10, 0x4000uLL))
              {
LABEL_19:
                char v9 = 0;
                if ((v20 & 1) == 0)
                {
                  *(_WORD *)id v6 = 32;
                  v6 += 2;
                }
                char v20 = 1;
                goto LABEL_24;
              }
            }
            else
            {
LABEL_18:
              if ((_DefaultRuneLocale.__runetype[v10] & 0x4000) != 0) {
                goto LABEL_19;
              }
            }
            char v20 = 0;
            *(_WORD *)id v6 = v11;
            v6 += 2;
            v9 |= v11 == 34;
            goto LABEL_24;
          }
          char v9 = 0;
          char v19 = 1;
          id v6 = v5;
        }
      }
LABEL_24:
      ++v7;
    }
    while (v7 < v3);
  }
  uint64_t v12 = v6 - v5;
  do
  {
    __int16 v13 = v6;
    uint64_t v14 = v12;
    if (v6 <= v5) {
      break;
    }
    v6 -= 2;
    unint64_t v15 = *((unsigned __int16 *)v13 - 1);
    __uint32_t v16 = v15 > 0x7F ? __maskrune(v15, 0x4000uLL) : _DefaultRuneLocale.__runetype[v15] & 0x4000;
    uint64_t v12 = v14 - 2;
  }
  while (v16);
  *(_WORD *)__int16 v13 = 0;
  id v17 = [objc_alloc((Class)NSString) initWithCharacters:v5 length:v14 >> 1];
  NSZoneFree(0, v5);
  return v17;
}

- (id)tsu_uncommentedAddressRespectingGroups
{
  id v3 = [(NSString *)self rangeOfString:@"@"];
  id v4 = [(NSString *)self rangeOfString:@"<"];
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL && v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = self;
  }
  else
  {
    id v6 = [(NSString *)self tsu_uncommentedAddress];
  }
  return v6;
}

- (BOOL)tsu_isCJKString
{
  if (![(NSString *)self length]) {
    return 0;
  }
  id v3 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v4 = [(NSString *)self stringByTrimmingCharactersInSet:v3];

  id v5 = [v4 length];
  if (!v5)
  {

    return 0;
  }
  id v6 = v5;
  __chkstk_darwin();
  int v8 = (char *)&v18 - ((v7 + 17) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v4, "getCharacters:range:", v8, 0, v6);
  BOOL v9 = 0;
  for (i = 0; (id)i != v6; BOOL v9 = i >= (unint64_t)v6)
  {
    unsigned int v11 = *(unsigned __int16 *)&v8[2 * i];
    int16x8_t v12 = vdupq_n_s16(v11);
    int16x4_t v13 = (int16x4_t)vand_s8(*(int8x8_t *)v12.i8, (int8x8_t)0xFFF0FFC0FF00FF80);
    char v14 = vmaxv_u8((uint8x8_t)vmovn_s16((int16x8_t)vcgtq_u16((uint16x8_t)xmmword_10017F7A0, (uint16x8_t)vaddq_s16(v12, (int16x8_t)xmmword_10017F790)))) | vmaxv_u16((uint16x4_t)vceq_s16(v13, (int16x4_t)0x3190300011002E80));
    BOOL v16 = (unsigned __int16)v11 >> 5 == 397 || (v13.i16[1] & 0xFF00) == 12800;
    if (!(v14 & 1 | ((unsigned __int16)(v11 + 464) < 0x20u || v16)) && v13.u16[1] != 13056) {
      break;
    }
    ++i;
  }

  return v9;
}

+ (id)tsu_localizedDisplayNameWithPersonNameComponents:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v4 = 0;
    goto LABEL_20;
  }
  id v4 = +[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:v3 style:0 options:0];
  if (v4) {
    goto LABEL_20;
  }
  if (TSUDefaultCat_init_token != -1) {
    dispatch_once(&TSUDefaultCat_init_token, &stru_1001CC240);
  }
  id v5 = TSUDefaultCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_100164C84(v5);
  }
  id v6 = [v3 givenName];
  id v7 = [v6 length];
  int v8 = [v3 familyName];
  id v9 = [v8 length];
  if (v7 && v9)
  {
    if ((objc_msgSend(v6, "tsu_isCJKString") & 1) != 0
      || objc_msgSend(v8, "tsu_isCJKString"))
    {
      id v10 = [v8 stringByAppendingString:v6];
    }
    else
    {
      id v10 = +[NSString stringWithFormat:@"%@ %@", v6, v8];
    }
  }
  else if (v7)
  {
    id v10 = v6;
  }
  else
  {
    if (!v9)
    {
      id v4 = 0;
      goto LABEL_19;
    }
    id v10 = v8;
  }
  id v4 = v10;
LABEL_19:

LABEL_20:
  return v4;
}

- (id)tsu_sha256HexHashString
{
  NSUInteger v2 = +[SFUCryptoUtils sha256HashFromString:self];
  [v2 getBytes:v8 length:32];
  id v3 = (char *)malloc_type_malloc(0x41uLL, 0x769D2E00uLL);
  uint64_t v4 = 0;
  id v5 = v3;
  do
  {
    snprintf(v5, 3uLL, "%02x", v8[v4++]);
    v5 += 2;
  }
  while (v4 != 32);
  v3[64] = 0;
  id v6 = +[NSString stringWithUTF8String:v3];
  free(v3);

  return v6;
}

- (int64_t)tsu_compareToVersionString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_1000819F0(self);
  uint64_t v6 = sub_1000819F0(v4);
  id v7 = (void *)v6;
  if (v5 | v6)
  {
    if (v5 || !v6)
    {
      if (!v5 || v6)
      {
        uint64_t v10 = 0;
        while (1)
        {
          unsigned int v11 = [(id)v5 objectAtIndexedSubscript:v10];
          int16x8_t v12 = [v7 objectAtIndexedSubscript:v10];
          int64_t v8 = (int64_t)[v11 compare:v12];

          if (v8) {
            break;
          }
          if (++v10 == 3) {
            goto LABEL_2;
          }
        }
      }
      else
      {
        int64_t v8 = 1;
      }
    }
    else
    {
      int64_t v8 = -1;
    }
  }
  else
  {
LABEL_2:
    int64_t v8 = 0;
  }

  return v8;
}

- (id)tsu_keyPathByRemovingLastKey
{
  id v3 = [(NSString *)self rangeOfString:@"." options:6];
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = &stru_1001D3790;
  }
  else
  {
    id v4 = [(NSString *)self substringToIndex:v3];
  }
  return v4;
}

- (id)tsu_keyPathByRemovingFirstKey
{
  id v3 = (char *)[(NSString *)self rangeOfString:@"." options:2];
  if (v3 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = &stru_1001D3790;
  }
  else
  {
    id v4 = [(NSString *)self substringFromIndex:v3 + 1];
  }
  return v4;
}

- (id)tsu_keyPathByPrependingKey:(id)a3
{
  id v4 = a3;
  if ([(NSString *)self length])
  {
    if ([v4 length])
    {
      uint64_t v5 = +[NSString stringWithFormat:@"%@.%@", v4, self];
      goto LABEL_7;
    }
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = (NSString *)v4;
  }
  uint64_t v5 = +[NSString stringWithString:v6];
LABEL_7:
  id v7 = (void *)v5;

  return v7;
}

- (id)tsu_keyPathByAppendingKey:(id)a3
{
  id v4 = a3;
  if ([(NSString *)self length])
  {
    if ([v4 length])
    {
      uint64_t v5 = +[NSString stringWithFormat:@"%@.%@", self, v4];
      goto LABEL_7;
    }
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = (NSString *)v4;
  }
  uint64_t v5 = +[NSString stringWithString:v6];
LABEL_7:
  id v7 = (void *)v5;

  return v7;
}

- (id)tsu_firstKey
{
  NSUInteger v2 = self;
  id v3 = [(NSString *)v2 rangeOfString:@"." options:2];
  if (v3 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = [(NSString *)v2 substringToIndex:v3];

    NSUInteger v2 = (NSString *)v4;
  }
  return v2;
}

- (id)tsu_lastKey
{
  NSUInteger v2 = self;
  id v3 = (char *)[(NSString *)v2 rangeOfString:@"." options:6];
  if (v3 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = [(NSString *)v2 substringFromIndex:v3 + 1];

    NSUInteger v2 = (NSString *)v4;
  }
  return v2;
}

- (unint64_t)tsu_numberOfKeysInKeyPath
{
  NSUInteger v3 = [(NSString *)self length];
  uint64_t v4 = 0;
  unint64_t v5 = 0;
  NSUInteger v6 = v3;
  do
  {
    id v7 = (char *)[(NSString *)self rangeOfString:@".", 2, v4, v6 options range];
    ++v5;
    uint64_t v4 = &v7[v8];
    NSUInteger v6 = v3 - (void)&v7[v8];
  }
  while (&v7[v8] != (char *)0x7FFFFFFFFFFFFFFFLL);
  return v5;
}

+ (id)tsu_fogShareTokenFromFileURL:(id)a3
{
  id v3 = a3;
  if ([v3 isFileURL])
  {
    uint64_t v4 = [v3 lastPathComponent];
    unint64_t v5 = [v4 dataUsingEncoding:4];
    NSUInteger v6 = objc_msgSend(v5, "tsu_encodeToHexidecimalString");
    v10[0] = @"fog";
    v10[1] = v6;
    id v7 = +[NSArray arrayWithObjects:v10 count:2];
    uint64_t v8 = [v7 componentsJoinedByString:@":"];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)tsu_fogFilenameFromShareToken:(id)a3
{
  if (a3)
  {
    id v3 = [a3 componentsSeparatedByString:@":"];
    uint64_t v4 = [v3 firstObject];
    if ([v4 isEqualToString:@"fog"] && objc_msgSend(v3, "count") == (id)2)
    {
      unint64_t v5 = [v3 objectAtIndexedSubscript:1];
      NSUInteger v6 = +[NSData tsu_decodeFromHexidecimalString:v5];
      id v7 = [objc_alloc((Class)NSString) initWithData:v6 encoding:4];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)tsu_initRedactedWithFormat:(id)a3 arguments:(char *)a4
{
  id v5 = [a3 mutableCopy];
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"%s", @"<REDACT %s REDACT>", 0, 0, objc_msgSend(v5, "length"));
  [v5 replaceOccurrencesOfString:@"%@", @"<REDACT %@ REDACT>", 0, 0, objc_msgSend(v5, "length") withString options range];
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"%{public}", @"%", 0, 0, objc_msgSend(v5, "length"));
  id v6 = [objc_alloc((Class)NSString) initWithFormat:v5 arguments:a4];
  if (qword_1001EB930 != -1) {
    dispatch_once(&qword_1001EB930, &stru_1001CC260);
  }
  id v7 = objc_msgSend((id)qword_1001EB928, "stringByReplacingMatchesInString:options:range:withTemplate:", v6, 0, 0, objc_msgSend(v6, "length"), @"<redacted>");

  return v7;
}

- (id)tsu_initUnRedactedWithFormat:(id)a3 arguments:(char *)a4
{
  id v5 = [a3 mutableCopy];
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"%{public}", @"%", 0, 0, objc_msgSend(v5, "length"));
  id v6 = [(NSString *)self initWithFormat:v5 arguments:a4];

  return v6;
}

- (id)tsu_initRedactedWithFormat:(id)a3
{
  return -[NSString tsu_initRedactedWithFormat:arguments:](self, "tsu_initRedactedWithFormat:arguments:", a3, &v4, &v4, &v4);
}

- (id)tsu_initUnRedactedWithFormat:(id)a3
{
  return -[NSString tsu_initUnRedactedWithFormat:arguments:](self, "tsu_initUnRedactedWithFormat:arguments:", a3, &v4, &v4, &v4);
}

+ (id)tsu_redactedStringWithFormat:(id)a3 arguments:(char *)a4
{
  id v5 = a3;
  id v6 = objc_msgSend(objc_alloc((Class)NSString), "tsu_initRedactedWithFormat:arguments:", v5, a4);

  return v6;
}

+ (id)tsu_unRedactedStringWithFormat:(id)a3 arguments:(char *)a4
{
  id v5 = a3;
  id v6 = objc_msgSend(objc_alloc((Class)NSString), "tsu_initUnRedactedWithFormat:arguments:", v5, a4);

  return v6;
}

- (id)tsu_initWithSqlStatement:(sqlite3_stmt *)a3 columnIndex:(int)a4
{
  if (sqlite3_column_type(a3, a4) == 5)
  {

    return 0;
  }
  else
  {
    uint64_t v8 = sqlite3_column_text(a3, a4);
    return [(NSString *)self initWithUTF8String:v8];
  }
}

- (BOOL)tsu_bindToSqlStatement:(sqlite3_stmt *)a3 index:(int)a4 error:(id *)a5
{
  NSUInteger v9 = [(NSString *)self lengthOfBytesUsingEncoding:4];
  if (HIDWORD(v9)) {
    return 0;
  }
  if (sqlite3_bind_text(a3, a4, [(NSString *)self UTF8String], v9, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001CD130);
    }
    unsigned int v11 = TSUDefaultCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR))
    {
      sub_100166A24(v11);
      if (!a5) {
        return 0;
      }
    }
    else if (!a5)
    {
      return 0;
    }
    if (!*a5)
    {
      id v12 = +[NSError tsu_errorWithCode:0 userInfo:0];
      BOOL result = 0;
      *a5 = v12;
      return result;
    }
    return 0;
  }
  return 1;
}

+ (id)tsu_stringWithSqlStatement:(sqlite3_stmt *)a3 columnIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id result = (id)sqlite3_column_text(a3, a4);
  if (result)
  {
    id v7 = objc_msgSend(objc_alloc((Class)NSString), "tsu_initWithSqlStatement:columnIndex:", a3, v4);
    return v7;
  }
  return result;
}

- (BOOL)tsu_conformsToUTI:(id)a3
{
  return a3 && UTTypeConformsTo((CFStringRef)self, (CFStringRef)a3) != 0;
}

- (BOOL)tsu_conformsToAnyUTI:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (unint64_t i = 0; i != v6; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (-[NSString tsu_conformsToUTI:](self, "tsu_conformsToUTI:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (NSString)tsu_UTIFilenameExtension
{
  return (NSString *)[(NSString *)self tsu_UTTypeCopyPreferredTagWithClass:UTTagClassFilenameExtension];
}

- (NSString)tsu_UTIMimeType
{
  return (NSString *)[(NSString *)self tsu_UTTypeCopyPreferredTagWithClass:UTTagClassMIMEType];
}

- (NSString)tsu_pathUTI
{
  id v3 = [(NSString *)self pathExtension];
  if (!v3)
  {
LABEL_10:
    BOOL v9 = 0;
    goto LABEL_11;
  }
  if (![(NSString *)self isAbsolutePath])
  {
    uint64_t v8 = UTTagClassFilenameExtension;
    goto LABEL_8;
  }
  char v11 = 1;
  id v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [v4 fileExistsAtPath:self isDirectory:&v11];
  id v6 = (id *)&UTTypeData;
  if ((v5 & (v11 == 0)) == 0) {
    id v6 = (id *)&UTTypeDirectory;
  }
  uint64_t v7 = [*v6 identifier];

  uint64_t v8 = UTTagClassFilenameExtension;
  BOOL v9 = objc_msgSend(v3, "tsu_preferredIdentifierForTagClass:conformingToUTI:", UTTagClassFilenameExtension, v7);
  if (objc_msgSend(v9, "tsu_isDynamic"))
  {

LABEL_8:
    BOOL v9 = objc_msgSend(v3, "tsu_preferredIdentifierForTagClass:conformingToUTI:", v8, 0);
    if (!objc_msgSend(v9, "tsu_isDynamic")) {
      goto LABEL_11;
    }

    goto LABEL_10;
  }

  if (!v9) {
    goto LABEL_8;
  }
LABEL_11:

  return (NSString *)v9;
}

- (NSString)tsu_normalizedFilenameExtension
{
  NSUInteger v2 = [(NSString *)self tsu_pathUTI];
  id v3 = objc_msgSend(v2, "tsu_UTIFilenameExtension");

  return (NSString *)v3;
}

- (BOOL)tsu_pathConformsToUTI:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(NSString *)self pathExtension];
  unsigned __int8 v6 = objc_msgSend(v5, "tsu_pathExtensionConformsToUTI:", v4);

  return v6;
}

- (BOOL)tsu_pathExtensionConformsToUTI:(id)a3
{
  id v4 = a3;
  [(NSString *)self tsu_allFilenameExtensionIdentifiersForTag];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (unint64_t i = 0; i != v6; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        BOOL v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v9, "tsu_isDynamic", (void)v11) & 1) == 0
          && (objc_msgSend(v9, "tsu_conformsToUTI:", v4) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_12;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v6;
}

- (BOOL)tsu_isDynamic
{
  return UTTypeIsDynamic((CFStringRef)self) != 0;
}

- (id)tsu_preferredIdentifierForTagClass:(id)a3 conformingToUTI:(id)a4
{
  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)a3, (CFStringRef)self, (CFStringRef)a4);
  return PreferredIdentifierForTag;
}

- (id)tsu_UTTypeCopyPreferredTagWithClass:(id)a3
{
  id v3 = (__CFString *)UTTypeCopyPreferredTagWithClass((CFStringRef)self, (CFStringRef)a3);
  return v3;
}

- (id)tsu_allFilenameExtensionIdentifiersForTag
{
  CFArrayRef AllIdentifiersForTag = UTTypeCreateAllIdentifiersForTag((CFStringRef)UTTagClassFilenameExtension, (CFStringRef)self, 0);
  return AllIdentifiersForTag;
}

@end