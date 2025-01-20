@interface NSString
+ (id)crl_JSONStringFromString:(id)a3;
+ (id)crl_localizedDisplayNameWithPersonNameComponents:(id)a3;
+ (id)crl_redactedStringWithFormat:(id)a3 arguments:(char *)a4;
+ (id)crl_stringByBase64EncodingBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)crl_stringByBase64EncodingBytes:(const char *)a3 length:(unint64_t)a4 breakLines:(BOOL)a5;
+ (id)crl_stringByHexEncodingData:(id)a3;
+ (id)crl_stringByIndentingString:(id)a3;
+ (id)crl_stringByIndentingString:(id)a3 times:(unint64_t)a4;
+ (id)crl_stringWithFormat:(id)a3 arguments:(char *)a4;
+ (id)crl_stringWithHexFromBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)crl_stringWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
+ (id)crl_stringWithUUID;
+ (id)crl_stringWithXMLString:(const char *)a3;
+ (id)crl_unRedactedStringWithFormat:(id)a3 arguments:(char *)a4;
- (BOOL)crl_containsOnlyCharactersFromSet:(id)a3;
- (BOOL)crl_containsSubstring:(id)a3;
- (BOOL)crl_isCJKString;
- (BOOL)crl_isChildOfPath:(id)a3;
- (BOOL)crl_isDescendantOfPath:(id)a3;
- (BOOL)crl_isEqualToString:(id)a3;
- (_NSRange)crl_range;
- (_NSRange)crl_rangeOfString:(id)a3 options:(unint64_t)a4 updatingSearchRange:(_NSRange *)a5;
- (id)crl_displayNameFromFilename;
- (id)crl_displayNameFromFilenameDeletingPathExtension:(BOOL)a3;
- (id)crl_encodeStringBase64;
- (id)crl_escapeForIcuRegex;
- (id)crl_escapeXML;
- (id)crl_filenameFromDisplayNameWithExtension:(id)a3;
- (id)crl_filenameFromDisplayNameWithExtension:(id)a3 characterLimit:(unint64_t)a4;
- (id)crl_filenameTruncatedToCharacterLimit:(unint64_t)a3;
- (id)crl_firstKey;
- (id)crl_initRedactedWithFormat:(id)a3;
- (id)crl_initRedactedWithFormat:(id)a3 arguments:(char *)a4;
- (id)crl_initUnRedactedWithFormat:(id)a3;
- (id)crl_initUnRedactedWithFormat:(id)a3 arguments:(char *)a4;
- (id)crl_initialsWithLimit:(unint64_t)a3;
- (id)crl_keyPathByAppendingKey:(id)a3;
- (id)crl_keyPathByPrependingKey:(id)a3;
- (id)crl_keyPathByRemovingFirstKey;
- (id)crl_keyPathByRemovingLastKey;
- (id)crl_lastKey;
- (id)crl_middleTruncateToLength:(unint64_t)a3;
- (id)crl_nameByConvertingFirstNameToInitials;
- (id)crl_parseBaseTitleWithLocalizedCopyString:(id)a3 firstCopyFormatString:(id)a4 generalCopyFormatString:(id)a5 outNumber:(unint64_t *)a6;
- (id)crl_pathExceptPrivate;
- (id)crl_regexForTitleParsingWithLocalizedCopyString:(id)a3 isFirstCopyFormatString:(BOOL)a4;
- (id)crl_setOfContainedWordsIncludingPunctuationAndSymbols:(BOOL)a3;
- (id)crl_stringByAppendingSeparator:(id)a3 format:(id)a4;
- (id)crl_stringByApplyingSubstitutions:(id)a3;
- (id)crl_stringByDeletingPathExtensionIfEqualTo:(id)a3;
- (id)crl_stringByExpandingTableFormatting;
- (id)crl_stringByFixingBrokenSurrogatePairs;
- (id)crl_stringByIncrementingCounterAfterDuplicateTitleModifierWithLocalizedCopyString:(id)a3 firstCopyFormatString:(id)a4 generalCopyFormatString:(id)a5 numberFormatter:(id)a6 uniquenessTest:(id)a7;
- (id)crl_stringByIncrementingCounterAfterDuplicateTitleModifierWithUniquenessTest:(id)a3;
- (id)crl_stringByMakingFirstCharacterLowercase;
- (id)crl_stringByMakingFirstCharacterUppercase;
- (id)crl_stringByRemovingCharactersInSet:(id)a3;
- (id)crl_stringByRemovingCharactersInSet:(id)a3 options:(unsigned int)a4;
- (id)crl_stringByReplacingInstancesOfCharactersInSet:(id)a3 withString:(id)a4;
- (id)crl_stringByTrimmingCharactersInSetFromFront:(id)a3;
- (id)crl_stringByUniquingPathInsideDirectory:(id)a3;
- (id)crl_stringByUniquingPathInsideDirectory:(id)a3 withFormat:(id)a4;
- (id)crl_stringQuotedIfContainsCharacterSet:(id)a3;
- (id)crl_stringTrimByLimitingFirstCharacterToSet:(id)a3;
- (id)crl_stringWithNormalizedHyphens;
- (id)crl_stringWithNormalizedHyphensAndQuotationMarks;
- (id)crl_stringWithNormalizedQuotationMarks;
- (id)crl_stringWithPathRelativeTo:(id)a3;
- (id)crl_stringWithPathRelativeTo:(id)a3 allowBacktracking:(BOOL)a4;
- (id)crl_stringWithRealpath;
- (id)crl_stringWithTrimmedWhitespace;
- (id)crl_stringWithoutAttachmentCharacters;
- (id)crl_stringWithoutBidiControls;
- (id)crl_substringWithComposedCharacterSequencesToFileSystemLength:(unint64_t)a3;
- (id)crl_substringWithComposedCharacterSequencesTruncatedToLength:(unint64_t)a3;
- (id)crl_tolerantStringByAppendingPathExtension:(id)a3;
- (id)crl_uncommentedAddress;
- (id)crl_uncommentedAddressRespectingGroups;
- (id)crl_unescapeXML;
- (unint64_t)crl_countInstancesOfString:(id)a3 options:(unint64_t)a4;
- (unint64_t)crl_numberOfKeysInKeyPath;
- (void)crl_appendJSONStringToString:(id)a3;
- (void)crl_enumerateRangesOfCharactersInSet:(id)a3 usingBlock:(id)a4;
@end

@implementation NSString

- (id)crl_filenameFromDisplayNameWithExtension:(id)a3
{
  return [(NSString *)self crl_filenameFromDisplayNameWithExtension:a3 characterLimit:255];
}

- (id)crl_filenameFromDisplayNameWithExtension:(id)a3 characterLimit:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(NSString *)self stringByReplacingOccurrencesOfString:@"/" withString:@":"];
  v8 = [v7 crl_tolerantStringByAppendingPathExtension:v6];

  v9 = [v8 crl_filenameTruncatedToCharacterLimit:a4];

  return v9;
}

- (id)crl_filenameTruncatedToCharacterLimit:(unint64_t)a3
{
  v4 = self;
  if (strlen([(NSString *)v4 fileSystemRepresentation]) > a3)
  {
    id v5 = [(NSString *)v4 stringByDeletingPathExtension];
    id v6 = (char *)[v5 length];
    v7 = [(NSString *)v4 substringFromIndex:v6];
    v8 = v6 - 1;
    do
    {
      id v9 = [v5 rangeOfComposedCharacterSequencesForRange:0, v8];
      v11 = [v5 substringWithRange:v9, v10];
      v12 = [v11 stringByAppendingString:v7];

      if (!v8) {
        break;
      }
      id v5 = v12;
      --v8;
    }
    while (strlen((const char *)[v5 fileSystemRepresentation]) > a3);
    v13 = +[NSCharacterSet whitespaceCharacterSet];
    uint64_t v14 = [v12 stringByTrimmingCharactersInSet:v13];

    v4 = (NSString *)v14;
  }

  return v4;
}

- (id)crl_displayNameFromFilename
{
  return [(NSString *)self crl_displayNameFromFilenameDeletingPathExtension:1];
}

- (id)crl_displayNameFromFilenameDeletingPathExtension:(BOOL)a3
{
  if (a3)
  {
    v3 = [(NSString *)self stringByDeletingPathExtension];
  }
  else
  {
    v3 = self;
  }
  v4 = v3;
  id v5 = [(NSString *)v3 stringByReplacingOccurrencesOfString:@":" withString:@"/"];

  return v5;
}

- (id)crl_initialsWithLimit:(unint64_t)a3
{
  if ([(NSString *)self canBeConvertedToEncoding:5])
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v16[3] = 0;
    id v5 = +[NSMutableString string];
    id v6 = +[NSCharacterSet punctuationCharacterSet];
    v7 = [(NSString *)self crl_stringByRemovingCharactersInSet:v6];

    id v8 = [v7 length];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100005B60;
    v12[3] = &unk_100071740;
    id v9 = v5;
    id v13 = v9;
    uint64_t v14 = v16;
    unint64_t v15 = a3;
    [v7 enumerateSubstringsInRange:0 options:v8 usingBlock:v12];
    uint64_t v10 = [v9 uppercaseString];

    _Block_object_dispose(v16, 8);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)crl_nameByConvertingFirstNameToInitials
{
  if ([(NSString *)self canBeConvertedToEncoding:5])
  {
    v3 = +[NSMutableString string];
    NSUInteger v4 = [(NSString *)self length];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100005CE0;
    v8[3] = &unk_100071768;
    id v5 = v3;
    id v9 = v5;
    uint64_t v10 = self;
    -[NSString enumerateSubstringsInRange:options:usingBlock:](self, "enumerateSubstringsInRange:options:usingBlock:", 0, v4, 1027, v8);
    id v6 = (NSString *)v5;
  }
  else
  {
    id v6 = self;
  }

  return v6;
}

+ (id)crl_stringWithUUID
{
  CFUUIDRef v2 = CFUUIDCreate(0);
  if (v2)
  {
    CFUUIDRef v3 = v2;
    NSUInteger v4 = (__CFString *)CFUUIDCreateString(0, v2);
    CFRelease(v3);
  }
  else
  {
    NSUInteger v4 = 0;
  }

  return v4;
}

+ (id)crl_stringWithFormat:(id)a3 arguments:(char *)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSString) initWithFormat:v5 arguments:a4];

  return v6;
}

+ (id)crl_stringByIndentingString:(id)a3 times:(unint64_t)a4
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
        uint64_t v8 = [v7 substringToIndex:[v7 length] - 2];

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

+ (id)crl_stringByIndentingString:(id)a3
{
  return [a1 crl_stringByIndentingString:a3 times:1];
}

- (id)crl_pathExceptPrivate
{
  if ([(NSString *)self rangeOfString:@"/private"])
  {
    NSUInteger v4 = self;
  }
  else
  {
    NSUInteger v4 = [(NSString *)self substringFromIndex:v3];
  }

  return v4;
}

- (id)crl_stringByExpandingTableFormatting
{
  NSUInteger v4 = [(NSString *)self componentsSeparatedByString:@"$"];
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

  uint64_t v14 = [v5 lastObject];
  if ([v14 count] == (id)1)
  {
    unint64_t v15 = [v5 lastObject];
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
    v18 = malloc_type_calloc(8uLL, (size_t)v9, 0xE9192C6EuLL);
    v60 = malloc_type_calloc(8uLL, (size_t)[v5 count], 0x549B2A7CuLL);
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
          v23 = &stru_100073958;
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
                v44 = &stru_100073958;
                if ((unint64_t)[v39 count] > v42)
                {
                  v44 = [v39 objectAtIndexedSubscript:v42];
                }
                v45 = [(__CFString *)v44 componentsSeparatedByString:@"\n"];
                v46 = &stru_100073958;
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

- (id)crl_stringQuotedIfContainsCharacterSet:(id)a3
{
  NSUInteger v4 = self;
  if ([(NSString *)v4 rangeOfCharacterFromSet:a3] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = [(NSString *)v4 mutableCopy];
    [v5 replaceOccurrencesOfString:@"\"" withString:@"\"\"" options:0 range:NSMakeRange(0, [v4 length])];
    [v5 appendString:@"\""];
    [v5 insertString:@"\"" atIndex:0];

    NSUInteger v4 = (NSString *)v5;
  }

  return v4;
}

- (id)crl_stringByAppendingSeparator:(id)a3 format:(id)a4
{
  id v6 = a3;
  id v7 = +[NSString crl_stringWithFormat:a4 arguments:&v11];
  if ([(NSString *)self length])
  {
    uint64_t v8 = [(NSString *)self stringByAppendingFormat:@"%@%@", v6, v7];

    id v7 = (void *)v8;
  }

  return v7;
}

- (id)crl_stringByUniquingPathInsideDirectory:(id)a3
{
  return [(NSString *)self crl_stringByUniquingPathInsideDirectory:a3 withFormat:@"%@-%d%@"];
}

- (id)crl_stringByUniquingPathInsideDirectory:(id)a3 withFormat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_100071788);
    }
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005AED4();
    }
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_1000717A8);
    }
    uint64_t v8 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005AE34(v8);
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(CRLAdditions) crl_stringByUniquingPathInsideDirectory:withFormat:]");
    uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSString_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 268, 0, "invalid nil value for '%{public}s'", "directoryPath");
  }
  uint64_t v11 = self;
  v12 = +[NSFileManager defaultManager];
  id v13 = [v6 stringByAppendingPathComponent:v11];
  unsigned int v14 = [v12 fileExistsAtPath:v13];

  if (v14)
  {
    v16 = [(NSString *)v11 pathExtension];
    context = v15;
    if (v16)
    {
      id v17 = v16;
      if ([(__CFString *)v16 length])
      {
        uint64_t v18 = [@"." stringByAppendingString:v17];

        id v17 = (__CFString *)v18;
      }
    }
    else
    {
      id v17 = &stru_100073958;
    }
    unint64_t v19 = [(NSString *)v11 stringByDeletingPathExtension];
    uint64_t v20 = 2;
    do
    {
      unint64_t v21 = v11;
      uint64_t v22 = (v20 + 1);
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v19, v20, v17);
      uint64_t v11 = (NSString *)objc_claimAutoreleasedReturnValue();

      v23 = [v6 stringByAppendingPathComponent:v11];
      unsigned __int8 v24 = [v12 fileExistsAtPath:v23];

      uint64_t v20 = v22;
    }
    while ((v24 & 1) != 0);
  }

  return v11;
}

- (id)crl_stringByFixingBrokenSurrogatePairs
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
            id v17 = CFStringGetCharactersPtr(v2);
            uint64_t v18 = 0;
            id v29 = v17;
            if (!v17) {
              uint64_t v18 = CFStringGetCStringPtr(v2, 0x600u);
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

- (id)crl_stringByRemovingCharactersInSet:(id)a3 options:(unsigned int)a4
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
      NSUInteger v12 = [(NSString *)v7 length];
      if (v12)
      {
        NSUInteger v13 = v12;
        int64_t v14 = 0;
        uint64_t v15 = a4 & 0xFFFFFFFB;
        NSUInteger v16 = v12;
        do
        {
          id v17 = (char *)-[NSString rangeOfCharacterFromSet:options:range:](v7, "rangeOfCharacterFromSet:options:range:", v6, v15, v14, v16);
          if (v17 == (char *)0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v19 = 0;
          }
          else {
            uint64_t v19 = v18;
          }
          if (v17 == (char *)0x7FFFFFFFFFFFFFFFLL) {
            long long v20 = (char *)v13;
          }
          else {
            long long v20 = v17;
          }
          long long v21 = -[NSString substringWithRange:](v7, "substringWithRange:", v14, v20 - v14);
          [(NSString *)v8 appendString:v21];

          int64_t v14 = &v20[v19];
          NSUInteger v16 = v13 - (void)&v20[v19];
        }
        while ((char *)v13 != &v20[v19]);
      }
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_1000717C8);
    }
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005AF6C();
    }
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_1000717E8);
    }
    int64_t v9 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005AE34(v9);
    }
    UniChar v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(CRLAdditions) crl_stringByRemovingCharactersInSet:options:]");
    int64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSString_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 342, 0, "invalid nil value for '%{public}s'", "charSet");

    int64_t v8 = self;
  }

  return v8;
}

- (id)crl_stringByRemovingCharactersInSet:(id)a3
{
  return [(NSString *)self crl_stringByRemovingCharactersInSet:a3 options:0];
}

- (id)crl_stringByReplacingInstancesOfCharactersInSet:(id)a3 withString:(id)a4
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

- (unint64_t)crl_countInstancesOfString:(id)a3 options:(unint64_t)a4
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

- (id)crl_escapeForIcuRegex
{
  if (qword_10007DB48 != -1) {
    dispatch_once(&qword_10007DB48, &stru_100071808);
  }
  uint64_t v3 = self;
  NSUInteger v4 = [(NSString *)v3 length];
  *(void *)&long long v13 = [(NSString *)v3 rangeOfCharacterFromSet:qword_10007DB40];
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
          *(void *)&long long v12 = [(NSString *)v3 rangeOfCharacterFromSet:qword_10007DB40 options:0 range:(void)v13];
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

- (BOOL)crl_isDescendantOfPath:(id)a3
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
      uint64_t v15 = [v5 objectAtIndexedSubscript:v13];
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

- (BOOL)crl_isChildOfPath:(id)a3
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
      [v6 removeObjectAtIndex:[v6 count] - 1];
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
      [v8 removeObjectAtIndex:[v8 count] - 1];
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

- (id)crl_stringWithRealpath
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

- (id)crl_stringWithTrimmedWhitespace
{
  uint64_t v3 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v4 = [(NSString *)self componentsSeparatedByCharactersInSet:v3];
  id v5 = [v4 componentsJoinedByString:@" "];

  id v6 = [v5 stringByTrimmingCharactersInSet:v3];

  return v6;
}

- (id)crl_substringWithComposedCharacterSequencesTruncatedToLength:(unint64_t)a3
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

- (id)crl_substringWithComposedCharacterSequencesToFileSystemLength:(unint64_t)a3
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

- (id)crl_stringWithPathRelativeTo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    NSUInteger v6 = [(NSString *)self stringByStandardizingPath];
    unint64_t v7 = [v6 pathComponents];

    id v8 = [v4 stringByStandardizingPath];
    uint64_t v9 = [v8 pathComponents];

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
      unsigned __int8 v15 = [v9 objectAtIndexedSubscript:v13];
      id v16 = [v7 objectAtIndexedSubscript:v13];
      unsigned __int8 v17 = [v15 isEqualToString:v16];

      if ((v17 & 1) == 0) {
        break;
      }
      uint64_t v13 = v14;
    }
    while (v12 > v14++);
    NSUInteger v5 = v22;
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
        unsigned int v19 = &stru_100073958;
      }
      else
      {
        long long v21 = [v7 subarrayWithRange:v12, &v10[-v12]];
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

- (id)crl_stringWithPathRelativeTo:(id)a3 allowBacktracking:(BOOL)a4
{
  id v6 = a3;
  if (a4)
  {
    unint64_t v7 = [(NSString *)self stringByStandardizingPath];
    id v8 = [v7 pathComponents];

    uint64_t v9 = [v6 stringByStandardizingPath];
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
      long long v23 = &stru_100073958;
    }
    else
    {
      long long v22 = &stru_100073958;
      do
      {
        long long v23 = [(__CFString *)v22 stringByAppendingPathComponent:@".."];

        long long v22 = v23;
        --v21;
      }
      while (v21);
    }
    if (v16 >= v11)
    {
      long long v20 = v23;
    }
    else
    {
      do
      {
        long long v24 = [v8 objectAtIndexedSubscript:v16];
        long long v20 = [(__CFString *)v23 stringByAppendingPathComponent:v24];

        ++v16;
        long long v23 = v20;
      }
      while (v11 != v16);
    }
  }
  else
  {
    long long v20 = [(NSString *)self crl_stringWithPathRelativeTo:v6];
  }

  return v20;
}

- (id)crl_stringByTrimmingCharactersInSetFromFront:(id)a3
{
  p_isa = self;
  id v5 = [(NSString *)p_isa rangeOfCharacterFromSet:a3 options:8];
  unint64_t v7 = v6;
  if (v6 == (void *)[(NSString *)p_isa length])
  {
    CFStringRef v8 = &stru_100073958;
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

+ (id)crl_stringWithHexFromBytes:(const char *)a3 length:(unint64_t)a4
{
  unint64_t v4 = a4;
  unint64_t v6 = 2 * a4;
  unint64_t v7 = malloc_type_malloc(2 * a4, 0x7BD5F295uLL);
  if (v4)
  {
    CFStringRef v8 = v7;
    do
    {
      unsigned int v9 = *(unsigned __int8 *)a3++;
      unsigned char *v8 = a0123456789abcd[(unint64_t)v9 >> 4];
      v8[1] = a0123456789abcd[v9 & 0xF];
      v8 += 2;
      --v4;
    }
    while (v4);
  }
  id v10 = [objc_alloc((Class)NSString) initWithBytesNoCopy:v7 length:v6 encoding:1 freeWhenDone:1];

  return v10;
}

+ (id)crl_stringByBase64EncodingBytes:(const char *)a3 length:(unint64_t)a4
{
  return +[NSString crl_stringByBase64EncodingBytes:a3 length:a4 breakLines:0];
}

+ (id)crl_stringByBase64EncodingBytes:(const char *)a3 length:(unint64_t)a4 breakLines:(BOOL)a5
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
      [v8 appendFormat:@"%c%c%c%c", aAbcdefghijklmn[*(v10 - 2) >> 2], aAbcdefghijklmn[((unint64_t)((*((unsigned __int8 *)v10 - 1) << 8) | (*((unsigned __int8 *)v10 - 2) << 16)) >> 12) & 0x3F], aAbcdefghijklmn[((unint64_t)(*(unsigned __int8 *)v10 | (*((unsigned __int8 *)v10 - 1) << 8)) >> 6) & 0x3F], aAbcdefghijklmn[*v10 & 0x3F]];
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
    [v8 appendFormat:@"%c%c==", aAbcdefghijklmn[(unint64_t)a3[v13] >> 2], aAbcdefghijklmn[16 * (a3[v13] & 3)], v16];
  }
  else if (v6 == 2)
  {
    unint64_t v14 = &a3[v13];
    [v8 appendFormat:@"%c%c%c=", aAbcdefghijklmn[*v14 >> 2], aAbcdefghijklmn[((unint64_t)((*(unsigned __int8 *)v14 << 16) | (*((unsigned __int8 *)v14 + 1) << 8)) >> 12) & 0x3F], aAbcdefghijklmn[4 * (v14[1] & 0xF)]];
  }

  return v8;
}

- (id)crl_encodeStringBase64
{
  CFUUIDRef v2 = [(NSString *)self UTF8String];
  size_t v3 = strlen(v2);

  return +[NSString crl_stringByBase64EncodingBytes:v2 length:v3];
}

- (id)crl_stringByMakingFirstCharacterLowercase
{
  CFUUIDRef v2 = self;
  if ([(NSString *)v2 length])
  {
    size_t v3 = [(NSString *)v2 substringToIndex:1];
    unint64_t v4 = [v3 lowercaseString];
    if (([v3 isEqualToString:v4] & 1) == 0)
    {
      BOOL v5 = [(NSString *)v2 substringFromIndex:1];
      uint64_t v6 = [v4 stringByAppendingString:v5];

      CFUUIDRef v2 = (NSString *)v6;
    }
  }

  return v2;
}

- (id)crl_stringByMakingFirstCharacterUppercase
{
  id v3 = [(NSString *)self mutableCopy];
  if ([v3 length])
  {
    unint64_t v4 = [(NSString *)self substringToIndex:1];
    BOOL v5 = [v4 uppercaseString];
    [v3 replaceCharactersInRange:0, 1, v5];
  }

  return v3;
}

- (id)crl_stringTrimByLimitingFirstCharacterToSet:(id)a3
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
        unint64_t v7 = [(NSString *)v5 substringFromIndex:1];

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
  unint64_t v7 = v5;
LABEL_9:

  return v7;
}

+ (id)crl_stringWithXMLString:(const char *)a3
{
  return +[NSString stringWithCString:a3 encoding:4];
}

- (id)crl_escapeXML
{
  id v2 = [(NSString *)self mutableCopy];
  [v2 replaceOccurrencesOfString:@"&" withString:@"&amp;" options:range:];
    0,
    0,
    [v2 length]);
  [v2 replaceOccurrencesOfString:@"<" withString:@"&lt;" options:0 range:];
    0,
    0,
    [v2 length]);
  [v2 replaceOccurrencesOfString:@">" withString:@"&gt;" options:0 range:];
    0,
    0,
    [v2 length]);

  return v2;
}

- (id)crl_unescapeXML
{
  id v2 = [(NSString *)self mutableCopy];
  [v2 replaceOccurrencesOfString:@"&amp;" withString:@"" options:range:];
    @"&",
    0,
    0,
    [v2 length]);
  [v2 replaceOccurrencesOfString:@"&lt;" withString:@"" options:range:];
    @"<",
    0,
    0,
    [v2 length]);
  [v2 replaceOccurrencesOfString:@"&gt;" withString:@"" options:0 range:];
    @">",
    0,
    0,
    [v2 length]);

  return v2;
}

- (BOOL)crl_containsOnlyCharactersFromSet:(id)a3
{
  id v4 = [a3 invertedSet];
  id v5 = [(NSString *)self rangeOfCharacterFromSet:v4];

  return v5 == (id)0x7FFFFFFFFFFFFFFFLL;
}

- (id)crl_stringByDeletingPathExtensionIfEqualTo:(id)a3
{
  id v4 = a3;
  id v5 = [(NSString *)self pathExtension];
  unsigned __int8 v6 = [v5 isEqualToString:v4];

  if (v6)
  {
    unint64_t v7 = [(NSString *)self stringByDeletingPathExtension];
  }
  else
  {
    unint64_t v7 = self;
  }
  CFStringRef v8 = v7;

  return v8;
}

- (id)crl_tolerantStringByAppendingPathExtension:(id)a3
{
  id v4 = a3;
  if ([(NSString *)self isEqualToString:&stru_100073958]
    || [v4 isEqualToString:&stru_100073958])
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

+ (id)crl_stringByHexEncodingData:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableString string];
  id v5 = v3;
  unsigned __int8 v6 = (unsigned __int8 *)[v5 bytes];
  unint64_t v7 = (char *)[v5 length];
  if (v7)
  {
    CFStringRef v8 = v7;
    do
    {
      unsigned int v9 = *v6++;
      [v4 appendFormat:@"%02x" v9];
      --v8;
    }
    while (v8);
  }
  id v10 = [v4 copy];

  return v10;
}

- (_NSRange)crl_rangeOfString:(id)a3 options:(unint64_t)a4 updatingSearchRange:(_NSRange *)a5
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
      *a5 = (_NSRange)NSInvalidRange;
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

- (_NSRange)crl_range
{
  NSUInteger v2 = [(NSString *)self length];
  NSUInteger v3 = 0;
  result.NSUInteger length = v2;
  result.NSUInteger location = v3;
  return result;
}

- (void)crl_enumerateRangesOfCharactersInSet:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  unint64_t v7 = (void (**)(id, unsigned char *, int64_t, char *))a4;
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

- (BOOL)crl_containsSubstring:(id)a3
{
  return [(NSString *)self rangeOfString:a3] != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (id)crl_setOfContainedWordsIncludingPunctuationAndSymbols:(BOOL)a3
{
  BOOL v3 = a3;
  id v30 = +[NSMutableSet set];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100008DD0;
  v37[3] = &unk_100071868;
  BOOL v35 = v3;
  BOOL v38 = v3;
  id v5 = objc_retainBlock(v37);
  CFRange v36 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
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
    int64_t v34 = self;
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
      long long v27 = [v26 stringByTrimmingCharactersInSet:v36];

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

- (id)crl_stringWithoutAttachmentCharacters
{
  if (qword_10007DB58 != -1) {
    dispatch_once(&qword_10007DB58, &stru_100071888);
  }
  uint64_t v3 = qword_10007DB50;

  return [(NSString *)self stringByReplacingOccurrencesOfString:v3 withString:&stru_100073958];
}

- (id)crl_middleTruncateToLength:(unint64_t)a3
{
  id v4 = self;
  if ([(NSString *)v4 length] <= a3)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = (NSString *)[(NSString *)v4 mutableCopy];
    do
      [(NSString *)v5 replaceCharactersInRange:([(NSString *)v5 length] >> 1) - 1, 3, @"…" withString];
    while ([(NSString *)v5 length] > a3);
  }

  return v5;
}

- (BOOL)crl_isEqualToString:(id)a3
{
  if (a3) {
    return -[NSString isEqualToString:](self, "isEqualToString:");
  }
  else {
    return 0;
  }
}

- (id)crl_stringWithNormalizedHyphensAndQuotationMarks
{
  NSUInteger v2 = [(NSString *)self crl_stringWithNormalizedHyphens];
  uint64_t v3 = [v2 crl_stringWithNormalizedQuotationMarks];

  return v3;
}

- (id)crl_stringWithNormalizedHyphens
{
  if (qword_10007DB60 != -1) {
    dispatch_once(&qword_10007DB60, &stru_1000718A8);
  }
  uint64_t v3 = qword_10007DB68;

  return [(NSString *)self crl_stringByReplacingInstancesOfCharactersInSet:v3 withString:@"-"];
}

- (id)crl_stringWithNormalizedQuotationMarks
{
  if (qword_10007DB70 != -1) {
    dispatch_once(&qword_10007DB70, &stru_1000718C8);
  }
  uint64_t v3 = qword_10007DB78;

  return [(NSString *)self crl_stringByReplacingInstancesOfCharactersInSet:v3 withString:@"'"];
}

- (id)crl_stringWithoutBidiControls
{
  uint64_t v3 = +[NSCharacterSet characterSetWithCharactersInString:@"\u200E\u200F\u202A\u202B\u202C\u202D\u202E⁦⁧⁨⁩"];
  id v4 = [(NSString *)self crl_stringByReplacingInstancesOfCharactersInSet:v3 withString:&stru_100073958];

  return v4;
}

- (id)crl_stringByIncrementingCounterAfterDuplicateTitleModifierWithUniquenessTest:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle mainBundle];
  CFIndex v6 = [v5 localizedStringForKey:@"copy" value:0 table:0];

  CFLocaleRef v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"%1$@ %2$@" value:0 table:0];

  CFStringTokenizerTokenType v9 = +[NSBundle mainBundle];
  uint64_t v10 = [v9 localizedStringForKey:@"%1$@ %2$@ %3$@" value:0 table:0];

  id v11 = objc_alloc_init((Class)NSNumberFormatter);
  id v12 = [(NSString *)self crl_stringByIncrementingCounterAfterDuplicateTitleModifierWithLocalizedCopyString:v6 firstCopyFormatString:v8 generalCopyFormatString:v10 numberFormatter:v11 uniquenessTest:v4];

  return v12;
}

- (id)crl_stringByIncrementingCounterAfterDuplicateTitleModifierWithLocalizedCopyString:(id)a3 firstCopyFormatString:(id)a4 generalCopyFormatString:(id)a5 numberFormatter:(id)a6 uniquenessTest:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  CFIndex v16 = (uint64_t (**)(id, id))a7;
  uint64_t v32 = 0;
  uint64_t v17 = [(NSString *)self crl_parseBaseTitleWithLocalizedCopyString:v12 firstCopyFormatString:v13 generalCopyFormatString:v14 outNumber:&v32];
  CFRange v18 = (void *)v17;
  if (v17)
  {
    v33[0] = @"%1$@";
    v33[1] = @"%2$@";
    id v30 = (void *)v17;
    id v31 = v12;
    v34[0] = v17;
    v34[1] = v12;
    CFIndex v19 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    id v20 = [v19 mutableCopy];

    for (id i = [(NSString *)self copy];
          [(NSString *)self isEqualToString:i] || (v16[2](v16, i) & 1) == 0;
          id i = (id)v28)
    {
      uint64_t v22 = v32;
      uint64_t v23 = ++v32;
      if (v22) {
        CFIndex v24 = v14;
      }
      else {
        CFIndex v24 = v13;
      }
      id v25 = v24;
      long long v26 = +[NSNumber numberWithUnsignedInteger:v23];
      long long v27 = [v15 stringFromNumber:v26];
      [v20 setObject:v27 forKeyedSubscript:@"%3$@"];

      uint64_t v28 = [v25 crl_stringByApplyingSubstitutions:v20];
    }
    CFRange v18 = v30;
    id v12 = v31;
  }
  else
  {
    id i = [(NSString *)self copy];
  }

  return i;
}

- (id)crl_regexForTitleParsingWithLocalizedCopyString:(id)a3 isFirstCopyFormatString:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ((id)[(NSString *)self crl_countInstancesOfString:@"%1$@" options:0] == (id)1&& (id)[(NSString *)self crl_countInstancesOfString:@"%2$@" options:0] == (id)1&& (v4|| (id)[(NSString *)self crl_countInstancesOfString:@"%3$@" options:0] == (id)1))
  {
    CFLocaleRef v7 = +[NSRegularExpression escapedPatternForString:self];
    id v8 = +[NSRegularExpression escapedPatternForString:@"%1$@"];
    v18[0] = v8;
    v19[0] = @"(.*)";
    CFStringTokenizerTokenType v9 = +[NSRegularExpression escapedPatternForString:@"%2$@"];
    v18[1] = v9;
    v19[1] = v6;
    uint64_t v10 = +[NSRegularExpression escapedPatternForString:@"%3$@"];
    v18[2] = v10;
    v19[2] = @"(\\d+)";
    id v11 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];

    id v12 = [v7 crl_stringByApplyingSubstitutions:v11];
    id v13 = +[NSRegularExpression regularExpressionWithPattern:v12 options:0 error:0];
  }
  else
  {
    unsigned int v14 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_1000718E8);
    }
    id v15 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110402;
      unsigned int v21 = v14;
      __int16 v22 = 2082;
      uint64_t v23 = "-[NSString(CRLAdditions) crl_regexForTitleParsingWithLocalizedCopyString:isFirstCopyFormatString:]";
      __int16 v24 = 2082;
      id v25 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSString_CRLAdditions.m";
      __int16 v26 = 1024;
      int v27 = 1137;
      __int16 v28 = 2114;
      id v29 = self;
      __int16 v30 = 1024;
      BOOL v31 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Invalid format string: %{public}@, isFirstCopyFormatString: %d", buf, 0x32u);
    }
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_100071908);
    }
    CFIndex v16 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005AE34(v16);
    }
    CFLocaleRef v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(CRLAdditions) crl_regexForTitleParsingWithLocalizedCopyString:isFirstCopyFormatString:]");
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSString_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v11, 1137, 0, "Invalid format string: %{public}@, isFirstCopyFormatString: %d", self, v4);
    id v13 = 0;
  }

  return v13;
}

- (id)crl_parseBaseTitleWithLocalizedCopyString:(id)a3 firstCopyFormatString:(id)a4 generalCopyFormatString:(id)a5 outNumber:(unint64_t *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 crl_regexForTitleParsingWithLocalizedCopyString:v10 isFirstCopyFormatString:0];
  if (!v13)
  {
    unsigned int v21 = self;
    goto LABEL_23;
  }
  unsigned int v14 = [v13 firstMatchInString:self options:0 range:[NSString length]];
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
    unsigned int v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v22 = [v14 rangeAtIndex:v18];
    __int16 v24 = -[NSString substringWithRange:](self, "substringWithRange:", v22, v23);
    unint64_t v25 = (unint64_t)[v24 integerValue];
    goto LABEL_20;
  }
  __int16 v26 = [v11 crl_regexForTitleParsingWithLocalizedCopyString:v10 isFirstCopyFormatString:1];
  if (v26)
  {
    __int16 v24 = v26;
    uint64_t v32 = [v26 firstMatchInString:self options:0 range:[NSString length]];
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
      unsigned int v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned int v21 = (NSString *)[(NSString *)self copy];
      unint64_t v25 = 0;
    }

LABEL_20:
    if (a6) {
      *a6 = v25;
    }
    goto LABEL_22;
  }
  unsigned int v21 = self;
LABEL_22:

LABEL_23:

  return v21;
}

- (id)crl_stringByApplyingSubstitutions:(id)a3
{
  id v4 = a3;
  id v5 = [(NSString *)self mutableCopy];
  id v6 = objc_opt_new();
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100009D40;
  v25[3] = &unk_100071930;
  v25[4] = v5;
  v25[5] = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v25];
  CFLocaleRef v7 = [v6 allKeys];
  id v8 = [v7 sortedArrayUsingComparator:&stru_100071970];

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
        unsigned int v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v15 = [v6 objectForKeyedSubscript:v14];
        id v16 = [v14 rangeValue];
        if (v15) {
          BOOL v18 = v16 == (id)0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          BOOL v18 = 1;
        }
        if (!v18) {
          [v5 replaceCharactersInRange:v16 withString:v17];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v11);
  }

  id v19 = [v5 copy];

  return v19;
}

+ (id)crl_JSONStringFromString:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = +[NSMutableString string];
    [v3 crl_appendJSONStringToString:v4];
  }
  else
  {
    id v4 = @"null";
  }

  return v4;
}

- (void)crl_appendJSONStringToString:(id)a3
{
  id v4 = a3;
  if (qword_10007DB88 != -1) {
    dispatch_once(&qword_10007DB88, &stru_100071990);
  }
  [v4 appendString:@"\""];
  if ([(NSString *)self rangeOfCharacterFromSet:qword_10007DB80] != (id)0x7FFFFFFFFFFFFFFFLL)
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
    CFLocaleRef v7 = v6;
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
            id v10 = v4;
            CFStringRef v11 = @"\\b";
            goto LABEL_23;
          case 9:
            id v10 = v4;
            CFStringRef v11 = @"\\t";
            goto LABEL_23;
          case 10:
            id v10 = v4;
            CFStringRef v11 = @"\\n";
            goto LABEL_23;
          case 12:
            id v10 = v4;
            CFStringRef v11 = @"\\f";
            goto LABEL_23;
          case 13:
            id v10 = v4;
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
          id v10 = v4;
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
            uint64_t v12 = +[NSString stringWithCharacters:&v13 length:1];
            }
            [v4 appendString:v12];

            goto LABEL_24;
          }
          id v10 = v4;
          CFStringRef v11 = @"\\u2029";
        }
      }
      else if (v8 == 34)
      {
        id v10 = v4;
        CFStringRef v11 = @"\\\"";
      }
      else
      {
        if (v8 != 92) {
          goto LABEL_26;
        }
        id v10 = v4;
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

+ (id)crl_stringWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v8 = +[NSString objectWithItemProviderData:a3 typeIdentifier:v7 error:a5];
  if (!v8)
  {
    int v9 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_1000719B0);
    }
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005B09C((uint64_t)v7, v9);
    }
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_1000719D0);
    }
    id v10 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005AE34(v10);
    }
    CFStringRef v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSString(CRLAdditions) crl_stringWithItemProviderData:typeIdentifier:error:]");
    uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSString_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11, v12, 1331, 0, "Unable to make a string out of data with UTI %@", v7 file lineNumber isFatal description];
  }

  return v8;
}

- (id)crl_uncommentedAddress
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

- (id)crl_uncommentedAddressRespectingGroups
{
  id v3 = [(NSString *)self rangeOfString:@"@"];
  id v4 = [(NSString *)self rangeOfString:@"<"];
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL && v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = self;
  }
  else
  {
    id v6 = [(NSString *)self crl_uncommentedAddress];
  }

  return v6;
}

- (BOOL)crl_isCJKString
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
  [v4 getCharacters:v8 range:0 v6];
  BOOL v9 = 0;
  for (i = 0; (id)i != v6; BOOL v9 = i >= (unint64_t)v6)
  {
    unsigned int v11 = *(unsigned __int16 *)&v8[2 * i];
    int16x8_t v12 = vdupq_n_s16(v11);
    int16x4_t v13 = (int16x4_t)vand_s8(*(int8x8_t *)v12.i8, (int8x8_t)0xFFF0FFC0FF00FF80);
    char v14 = vmaxv_u8((uint8x8_t)vmovn_s16((int16x8_t)vcgtq_u16((uint16x8_t)xmmword_1000609C0, (uint16x8_t)vaddq_s16(v12, (int16x8_t)xmmword_1000609B0)))) | vmaxv_u16((uint16x4_t)vceq_s16(v13, (int16x4_t)0x3190300011002E80));
    BOOL v16 = (unsigned __int16)v11 >> 5 == 397 || (v13.i16[1] & 0xFF00) == 12800;
    if (!(v14 & 1 | ((unsigned __int16)(v11 + 464) < 0x20u || v16)) && v13.u16[1] != 13056) {
      break;
    }
    ++i;
  }

  return v9;
}

+ (id)crl_localizedDisplayNameWithPersonNameComponents:(id)a3
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
  if (CRLDefaultCat_init_token != -1) {
    dispatch_once(&CRLDefaultCat_init_token, &stru_1000719F0);
  }
  id v5 = CRLDefaultCat_log_t;
  if (os_log_type_enabled((os_log_t)CRLDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_10005B154(v5);
  }
  id v6 = [v3 givenName];
  id v7 = [v6 length];
  int v8 = [v3 familyName];
  id v9 = [v8 length];
  if (v7 && v9)
  {
    if ((objc_msgSend(v6, "crl_isCJKString") & 1) != 0
      || objc_msgSend(v8, "crl_isCJKString"))
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

- (id)crl_keyPathByRemovingLastKey
{
  id v3 = [(NSString *)self rangeOfString:@"." options:6];
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = &stru_100073958;
  }
  else
  {
    id v4 = [(NSString *)self substringToIndex:v3];
  }

  return v4;
}

- (id)crl_keyPathByRemovingFirstKey
{
  id v3 = (char *)[(NSString *)self rangeOfString:@"." options:2];
  if (v3 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = &stru_100073958;
  }
  else
  {
    id v4 = [(NSString *)self substringFromIndex:v3 + 1];
  }

  return v4;
}

- (id)crl_keyPathByPrependingKey:(id)a3
{
  id v4 = a3;
  if ([(NSString *)self length])
  {
    if ([v4 length])
    {
      uint64_t v5 = +[NSString stringWithFormat:@"%@.%@", v4, self];
      goto LABEL_7;
    }
    id v6 = self;
  }
  else
  {
    id v6 = (NSString *)v4;
  }
  uint64_t v5 = +[NSString stringWithString:v6];
LABEL_7:
  id v7 = (void *)v5;

  return v7;
}

- (id)crl_keyPathByAppendingKey:(id)a3
{
  id v4 = a3;
  if ([(NSString *)self length])
  {
    if ([v4 length])
    {
      uint64_t v5 = +[NSString stringWithFormat:@"%@.%@", self, v4];
      goto LABEL_7;
    }
    id v6 = self;
  }
  else
  {
    id v6 = (NSString *)v4;
  }
  uint64_t v5 = +[NSString stringWithString:v6];
LABEL_7:
  id v7 = (void *)v5;

  return v7;
}

- (id)crl_firstKey
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

- (id)crl_lastKey
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

- (unint64_t)crl_numberOfKeysInKeyPath
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

- (id)crl_initRedactedWithFormat:(id)a3 arguments:(char *)a4
{
  id v5 = [a3 mutableCopy];
  [v5 replaceOccurrencesOfString:@"%s" withString:@"<REDACT %s REDACT>" options:0 range:[v5 length]];
  [v5 replaceOccurrencesOfString:@"%@" withString:@"<REDACT %@ REDACT>" options range];
  [v5 replaceOccurrencesOfString:@"%{public}" withString:@"%" options:0 range:NSMakeRange(0, [v5 length])];
  id v6 = [objc_alloc((Class)NSString) initWithFormat:v5 arguments:a4];
  if (qword_10007DB98 != -1) {
    dispatch_once(&qword_10007DB98, &stru_100071A10);
  }
  id v7 = [qword_10007DB90 stringByReplacingMatchesInString:v6 options:0 range:[v6 length] withTemplate:@"<redacted>"];

  return v7;
}

- (id)crl_initUnRedactedWithFormat:(id)a3 arguments:(char *)a4
{
  id v5 = [a3 mutableCopy];
  [v5 replaceOccurrencesOfString:@"%{public}" withString:@"%" options:0 range:[v5 length]];
  id v6 = [(NSString *)self initWithFormat:v5 arguments:a4];

  return v6;
}

- (id)crl_initRedactedWithFormat:(id)a3
{
  return -[NSString crl_initRedactedWithFormat:arguments:](self, "crl_initRedactedWithFormat:arguments:", a3, &v4, &v4, &v4);
}

- (id)crl_initUnRedactedWithFormat:(id)a3
{
  return -[NSString crl_initUnRedactedWithFormat:arguments:](self, "crl_initUnRedactedWithFormat:arguments:", a3, &v4, &v4, &v4);
}

+ (id)crl_redactedStringWithFormat:(id)a3 arguments:(char *)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSString) crl_initRedactedWithFormat:v5 arguments:a4];

  return v6;
}

+ (id)crl_unRedactedStringWithFormat:(id)a3 arguments:(char *)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSString) crl_initUnRedactedWithFormat:v5 arguments:a4];

  return v6;
}

@end