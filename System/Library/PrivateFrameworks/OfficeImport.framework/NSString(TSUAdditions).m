@interface NSString(TSUAdditions)
+ (__CFString)tsu_stringWithUUID;
+ (id)tsu_stringByBase64EncodingBytes:()TSUAdditions length:breakLines:;
+ (id)tsu_stringByHexEncodingData:()TSUAdditions;
+ (id)tsu_stringByIndentingString:()TSUAdditions times:;
+ (id)tsu_stringWithFormat:()TSUAdditions arguments:;
+ (id)tsu_stringWithHexFromBytes:()TSUAdditions length:;
+ (uint64_t)tsu_stringByBase64EncodingBytes:()TSUAdditions length:;
+ (uint64_t)tsu_stringByIndentingString:()TSUAdditions;
+ (uint64_t)tsu_stringWithXMLString:()TSUAdditions;
- (BOOL)tsu_containsOnlyCharactersFromSet:()TSUAdditions;
- (BOOL)tsu_containsSubstring:()TSUAdditions;
- (__CFString)tsu_stringByFixingBrokenSurrogatePairs;
- (__CFString)tsu_stringByTrimmingCharactersInSetFromFront:()TSUAdditions;
- (__CFString)tsu_stringWithPathRelativeTo:()TSUAdditions;
- (__CFString)tsu_stringWithPathRelativeTo:()TSUAdditions allowBacktracking:;
- (id)tsu_escapeForIcuRegex;
- (id)tsu_escapeXML;
- (id)tsu_middleTruncateToLength:()TSUAdditions;
- (id)tsu_setOfContainedWordsIncludingPunctuationAndSymbols:()TSUAdditions;
- (id)tsu_stringByAddingCSVEscapesForLocale:()TSUAdditions;
- (id)tsu_stringByAppendingSeparator:()TSUAdditions format:;
- (id)tsu_stringByExpandingTableFormatting;
- (id)tsu_stringByMakingFirstCharacterLowercase;
- (id)tsu_stringByMakingFirstCharacterUppercase;
- (id)tsu_stringByRemovingCharactersInSet:()TSUAdditions options:;
- (id)tsu_stringByReplacingInstancesOfCharactersInSet:()TSUAdditions withString:;
- (id)tsu_stringByUniquingPathInsideDirectory:()TSUAdditions withFormat:;
- (id)tsu_stringQuotedIfContainsCharacterSet:()TSUAdditions;
- (id)tsu_stringWithNormalizedHyphensAndQuotationMarks;
- (id)tsu_stringWithRealpath;
- (id)tsu_substringWithComposedCharacterSequencesToFileSystemLength:()TSUAdditions;
- (id)tsu_substringWithComposedCharacterSequencesTruncatedToLength:()TSUAdditions;
- (id)tsu_tolerantStringByAppendingPathExtension:()TSUAdditions;
- (id)tsu_unescapeXML;
- (uint64_t)tsu_countInstancesOfString:()TSUAdditions options:;
- (uint64_t)tsu_encodeStringBase64;
- (uint64_t)tsu_isChildOfPath:()TSUAdditions;
- (uint64_t)tsu_isDescendantOfPath:()TSUAdditions;
- (uint64_t)tsu_isEqualToString:()TSUAdditions;
- (uint64_t)tsu_range;
- (uint64_t)tsu_rangeOfString:()TSUAdditions options:updatingSearchRange:;
- (uint64_t)tsu_stringByRemovingCharactersInSet:()TSUAdditions;
- (uint64_t)tsu_stringByUniquingPathInsideDirectory:()TSUAdditions;
- (uint64_t)tsu_stringWithNormalizedHyphens;
- (uint64_t)tsu_stringWithNormalizedQuotationMarks;
- (uint64_t)tsu_stringWithoutAttachmentCharacters;
- (void)tsu_enumerateRangesOfCharactersInSet:()TSUAdditions usingBlock:;
@end

@implementation NSString(TSUAdditions)

+ (__CFString)tsu_stringWithUUID
{
  CFUUIDRef v0 = CFUUIDCreate(0);
  if (v0)
  {
    CFUUIDRef v1 = v0;
    v2 = (__CFString *)CFUUIDCreateString(0, v0);
    CFRelease(v1);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (id)tsu_stringWithFormat:()TSUAdditions arguments:
{
  v5 = (objc_class *)NSString;
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initWithFormat:v6 arguments:a4];

  return v7;
}

+ (id)tsu_stringByIndentingString:()TSUAdditions times:
{
  id v5 = a3;
  uint64_t v6 = [v5 length];
  if (a4 && v6)
  {
    do
    {
      v7 = [v5 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n  "];

      if ([v7 hasSuffix:@"\n  "])
      {
        uint64_t v8 = objc_msgSend(v7, "substringToIndex:", objc_msgSend(v7, "length") - 2);

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

+ (uint64_t)tsu_stringByIndentingString:()TSUAdditions
{
  return objc_msgSend(a1, "tsu_stringByIndentingString:times:", a3, 1);
}

- (id)tsu_stringByExpandingTableFormatting
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x23EC9A170]();
  v3 = [a1 componentsSeparatedByString:@"$"];
  v4 = [MEMORY[0x263EFF980] array];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v64 objects:v69 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v65 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = [*(id *)(*((void *)&v64 + 1) + 8 * i) componentsSeparatedByString:@"|"];
        [v4 addObject:v11];
        unint64_t v12 = [v11 count];
        if ((unint64_t)v8 <= v12) {
          id v8 = (id)v12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v64 objects:v69 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  v13 = [v4 lastObject];
  if ([v13 count] == 1)
  {
    v14 = [v4 lastObject];
    v15 = [v14 objectAtIndexedSubscript:0];
    uint64_t v16 = [v15 length];

    if (!v16) {
      [v4 removeLastObject];
    }
  }
  else
  {
  }
  if (v8)
  {
    id v50 = v5;
    v51 = v2;
    v17 = malloc_type_calloc(8uLL, (size_t)v8, 0x96F136E8uLL);
    v59 = malloc_type_calloc(8uLL, [v4 count], 0xA3BDF298uLL);
    v54 = v4;
    if ([v4 count])
    {
      unint64_t v18 = 0;
      int v19 = 0;
      do
      {
        int v52 = v19;
        [v4 objectAtIndexedSubscript:v18];
        v57 = unint64_t v55 = v18;
        unint64_t v20 = 0;
        unsigned int v21 = 0;
        do
        {
          v22 = &stru_26EBF24D8;
          if ([v57 count] > v20)
          {
            v22 = [v57 objectAtIndexedSubscript:v20];
          }
          v23 = [(__CFString *)v22 componentsSeparatedByString:@"\n"];
          unint64_t v24 = v59[v18];
          unint64_t v25 = [v23 count];
          if (v24 <= v25) {
            unint64_t v26 = v25;
          }
          else {
            unint64_t v26 = v24;
          }
          v59[v18] = v26;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id v27 = v23;
          uint64_t v28 = [v27 countByEnumeratingWithState:&v60 objects:v68 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v61;
            do
            {
              for (uint64_t j = 0; j != v29; ++j)
              {
                if (*(void *)v61 != v30) {
                  objc_enumerationMutation(v27);
                }
                unint64_t v32 = v17[v20];
                unint64_t v33 = [*(id *)(*((void *)&v60 + 1) + 8 * j) length];
                if (v32 <= v33) {
                  unint64_t v34 = v33;
                }
                else {
                  unint64_t v34 = v32;
                }
                v17[v20] = v34;
              }
              uint64_t v29 = [v27 countByEnumeratingWithState:&v60 objects:v68 count:16];
            }
            while (v29);
          }

          unint64_t v20 = ++v21;
          unint64_t v18 = v55;
        }
        while ((unint64_t)v8 > v21);

        unint64_t v18 = (v52 + 1);
        v4 = v54;
        unint64_t v35 = [v54 count];
        int v19 = v52 + 1;
      }
      while (v35 > v18);
    }
    id v8 = objc_alloc_init(MEMORY[0x263F089D8]);
    if ([v4 count])
    {
      unint64_t v36 = 0;
      int v37 = 0;
      do
      {
        int v53 = v37;
        v38 = [v4 objectAtIndexedSubscript:v36];
        if (v59[v36])
        {
          unint64_t v39 = 0;
          int v40 = 0;
          unint64_t v56 = v36;
          do
          {
            int v58 = v40;
            if ([v38 count])
            {
              unint64_t v41 = 0;
              unsigned int v42 = 1;
              do
              {
                v43 = &stru_26EBF24D8;
                if ([v38 count] > v41)
                {
                  v43 = [v38 objectAtIndexedSubscript:v41];
                }
                v44 = [(__CFString *)v43 componentsSeparatedByString:@"\n"];
                v45 = &stru_26EBF24D8;
                if ([v44 count] > v39)
                {
                  v45 = [v44 objectAtIndexedSubscript:v39];
                }
                v46 = [(__CFString *)v45 stringByPaddingToLength:v17[v41] + 1 withString:@" " startingAtIndex:0];
                [v8 appendString:v46];

                unint64_t v41 = v42;
              }
              while ([v38 count] > (unint64_t)v42++);
            }
            [v8 appendString:@"\n"];
            unint64_t v39 = (v58 + 1);
            int v40 = v58 + 1;
          }
          while (v59[v56] > v39);
        }

        unint64_t v36 = (v53 + 1);
        v4 = v54;
        unint64_t v48 = [v54 count];
        int v37 = v53 + 1;
      }
      while (v48 > v36);
    }
    free(v59);
    free(v17);
    id v5 = v50;
    v2 = v51;
  }

  return v8;
}

- (id)tsu_stringQuotedIfContainsCharacterSet:()TSUAdditions
{
  id v4 = a1;
  if ([v4 rangeOfCharacterFromSet:a3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = (void *)[v4 mutableCopy];
    objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"\", @"\"\", 0, 0, objc_msgSend(v4, "length"));
    [v5 appendString:@"\""];
    [v5 insertString:@"\"" atIndex:0];

    id v4 = v5;
  }
  return v4;
}

- (id)tsu_stringByAppendingSeparator:()TSUAdditions format:
{
  id v11 = a3;
  unint64_t v12 = objc_msgSend(NSString, "tsu_stringWithFormat:arguments:", a4, &a9);
  if ([a1 length])
  {
    uint64_t v13 = [a1 stringByAppendingFormat:@"%@%@", v11, v12];

    unint64_t v12 = (void *)v13;
  }

  return v12;
}

- (id)tsu_stringByAddingCSVEscapesForLocale:()TSUAdditions
{
  id v4 = a3;
  id v5 = [v4 localeSpecificStorageForKey:@"stringByAddingCSVEscapes"];
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    uint64_t v7 = (void *)[v6 mutableCopy];

    id v8 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    uint64_t v9 = [v8 invertedSet];
    [v7 formIntersectionWithCharacterSet:v9];

    [v7 addCharactersInString:@"\""];
    v10 = [v4 listSeparator];
    if ([v10 length] != 1)
    {
      id v11 = [NSString stringWithUTF8String:"-[NSString(TSUAdditions) tsu_stringByAddingCSVEscapesForLocale:]"];
      unint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSString_TSUAdditions.m"];
      +[OITSUAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:191 isFatal:0 description:"The list separator is not a 1-char string"];

      +[OITSUAssertionHandler logBacktraceThrottled];
    }
    [v7 addCharactersInString:v10];
    id v5 = (void *)[v7 copy];
    [v4 setLocaleSpecificStorage:v5 forKey:@"stringByAddingCSVEscapes"];
  }
  uint64_t v13 = objc_msgSend(a1, "tsu_stringQuotedIfContainsCharacterSet:", v5);

  return v13;
}

- (uint64_t)tsu_stringByUniquingPathInsideDirectory:()TSUAdditions
{
  return objc_msgSend(a1, "tsu_stringByUniquingPathInsideDirectory:withFormat:", a3, @"%@-%d%@");
}

- (id)tsu_stringByUniquingPathInsideDirectory:()TSUAdditions withFormat:
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v8 = [NSString stringWithUTF8String:"-[NSString(TSUAdditions) tsu_stringByUniquingPathInsideDirectory:withFormat:]"];
    uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSString_TSUAdditions.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 205, 0, "invalid nil value for '%{public}s'", "directoryPath");

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  id v10 = a1;
  id v11 = [MEMORY[0x263F08850] defaultManager];
  unint64_t v12 = [v6 stringByAppendingPathComponent:v10];
  int v13 = [v11 fileExistsAtPath:v12];

  if (v13)
  {
    uint64_t v14 = MEMORY[0x23EC9A170]();
    v15 = [v10 pathExtension];
    context = (void *)v14;
    if (v15)
    {
      uint64_t v16 = v15;
      if ([(__CFString *)v15 length])
      {
        uint64_t v17 = [@"." stringByAppendingString:v16];

        uint64_t v16 = (__CFString *)v17;
      }
    }
    else
    {
      uint64_t v16 = &stru_26EBF24D8;
    }
    unint64_t v18 = [v10 stringByDeletingPathExtension];
    uint64_t v19 = 2;
    do
    {
      unint64_t v20 = v10;
      uint64_t v21 = (v19 + 1);
      objc_msgSend(NSString, "stringWithFormat:", v7, v18, v19, v16);
      id v10 = (id)objc_claimAutoreleasedReturnValue();

      v22 = [v6 stringByAppendingPathComponent:v10];
      char v23 = [v11 fileExistsAtPath:v22];

      uint64_t v19 = v21;
    }
    while ((v23 & 1) != 0);
  }

  return v10;
}

- (__CFString)tsu_stringByFixingBrokenSurrogatePairs
{
  CFUUIDRef v1 = a1;
  uint64_t v2 = [(__CFString *)v1 length];
  CFStringRef theString = v1;
  uint64_t v30 = 0;
  int64_t v31 = v2;
  CharactersPtr = CFStringGetCharactersPtr(v1);
  CStringPtr = 0;
  uint64_t v28 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int64_t v32 = 0;
  int64_t v33 = 0;
  uint64_t v29 = CStringPtr;
  if (v2 >= 1)
  {
    int64_t v5 = 0;
    id v6 = 0;
    int64_t v7 = 0;
    while (1)
    {
      if ((v7 & 0x8000000000000000) == 0)
      {
        int64_t v8 = v31;
        if (v31 > v7)
        {
          if (v28)
          {
            UniChar v9 = v28[v30 + v7];
          }
          else if (v29)
          {
            UniChar v9 = v29[v30 + v7];
          }
          else
          {
            if (v33 <= v7 || v5 > v7)
            {
              int64_t v10 = v7 - 4;
              if ((unint64_t)v7 < 4) {
                int64_t v10 = 0;
              }
              if (v10 + 64 < v31) {
                int64_t v8 = v10 + 64;
              }
              int64_t v32 = v10;
              int64_t v33 = v8;
              v35.location = v30 + v10;
              v35.length = v8 - v10;
              CFStringGetCharacters(theString, v35, (UniChar *)&v19);
              int64_t v5 = v32;
            }
            UniChar v9 = *((_WORD *)&v19 + v7 - v5);
          }
          int v11 = v9 & 0xFC00;
          if (v11 == 56320)
          {
LABEL_37:
            if (!v6)
            {
              id v6 = (__CFString *)(id)-[__CFString mutableCopyWithZone:](v1, "mutableCopyWithZone:", 0, v19, v20, v21, v22, v23, v24, v25, v26);

              CFUUIDRef v1 = v6;
            }
            [(__CFString *)v6 replaceCharactersInRange:v7, 1, @"\uFFFD", v19, v20, v21, v22, v23, v24, v25, v26 withString];
            uint64_t v2 = [(__CFString *)v1 length];
            CFStringRef theString = v1;
            uint64_t v30 = 0;
            int64_t v31 = v2;
            uint64_t v16 = CFStringGetCharactersPtr(v1);
            uint64_t v17 = 0;
            uint64_t v28 = v16;
            if (!v16) {
              uint64_t v17 = CFStringGetCStringPtr(v1, 0x600u);
            }
            int64_t v5 = 0;
            uint64_t v29 = v17;
            int64_t v32 = 0;
            int64_t v33 = 0;
            goto LABEL_42;
          }
          if (v11 == 55296)
          {
            int64_t v12 = v7 + 1;
            if (v7 + 1 >= v2) {
              goto LABEL_37;
            }
            int64_t v13 = v31;
            if (v31 <= v12) {
              goto LABEL_37;
            }
            if (v28)
            {
              UniChar v14 = v28[v30 + v12];
            }
            else if (v29)
            {
              UniChar v14 = v29[v30 + v12];
            }
            else
            {
              if (v33 <= v12 || v5 > v12)
              {
                int64_t v15 = v7 - 3;
                if ((unint64_t)v7 < 3) {
                  int64_t v15 = 0;
                }
                if (v15 + 64 < v31) {
                  int64_t v13 = v15 + 64;
                }
                int64_t v32 = v15;
                int64_t v33 = v13;
                v36.location = v30 + v15;
                v36.length = v13 - v15;
                CFStringGetCharacters(theString, v36, (UniChar *)&v19);
                int64_t v5 = v32;
              }
              UniChar v14 = *((_WORD *)&v19 + v12 - v5);
            }
            if (v14 >> 10 != 55) {
              goto LABEL_37;
            }
            ++v7;
          }
        }
      }
LABEL_42:
      if (++v7 >= v2)
      {

        break;
      }
    }
  }
  return v1;
}

- (id)tsu_stringByRemovingCharactersInSet:()TSUAdditions options:
{
  id v6 = a3;
  if (v6)
  {
    id v7 = a1;
    if ([v7 rangeOfCharacterFromSet:v6] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = v7;
    }
    else
    {
      id v8 = [MEMORY[0x263F089D8] string];
      uint64_t v11 = [v7 length];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = 0;
        uint64_t v14 = a4 & 0xFFFFFFFB;
        uint64_t v15 = v11;
        do
        {
          uint64_t v16 = objc_msgSend(v7, "rangeOfCharacterFromSet:options:range:", v6, v14, v13, v15);
          if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v18 = 0;
          }
          else {
            uint64_t v18 = v17;
          }
          if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v19 = v12;
          }
          else {
            uint64_t v19 = v16;
          }
          long long v20 = objc_msgSend(v7, "substringWithRange:", v13, v19 - v13);
          [v8 appendString:v20];

          uint64_t v13 = v18 + v19;
          uint64_t v15 = v12 - (v18 + v19);
        }
        while (v12 != v18 + v19);
      }
    }
  }
  else
  {
    UniChar v9 = [NSString stringWithUTF8String:"-[NSString(TSUAdditions) tsu_stringByRemovingCharactersInSet:options:]"];
    int64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSString_TSUAdditions.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 283, 0, "invalid nil value for '%{public}s'", "charSet");

    +[OITSUAssertionHandler logBacktraceThrottled];
    id v8 = a1;
  }

  return v8;
}

- (uint64_t)tsu_stringByRemovingCharactersInSet:()TSUAdditions
{
  return objc_msgSend(a1, "tsu_stringByRemovingCharactersInSet:options:", a3, 0);
}

- (id)tsu_stringByReplacingInstancesOfCharactersInSet:()TSUAdditions withString:
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 rangeOfCharacterFromSet:v6 options:2] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = a1;
  }
  else
  {
    UniChar v9 = objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:", objc_msgSend(a1, "length"));
    int64_t v10 = [MEMORY[0x263F08B08] scannerWithString:a1];
    [v10 setCharactersToBeSkipped:0];
    if (([v10 isAtEnd] & 1) == 0)
    {
      id v11 = 0;
      while (1)
      {
        id v17 = v11;
        int v12 = [v10 scanUpToCharactersFromSet:v6 intoString:&v17];
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

        for (uint64_t i = [v11 length]; i; --i)
          [v9 appendString:v7];
        if ([v10 isAtEnd]) {
          goto LABEL_13;
        }
      }
      id v11 = v13;
LABEL_13:
    }
    id v8 = [NSString stringWithString:v9];
  }
  return v8;
}

- (uint64_t)tsu_countInstancesOfString:()TSUAdditions options:
{
  id v6 = a3;
  uint64_t v7 = [a1 length];
  uint64_t v8 = [v6 length];
  uint64_t v9 = objc_msgSend(a1, "rangeOfString:options:range:", v6, a4, 0, v7);
  uint64_t v10 = 0;
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = 0;
    uint64_t v10 = 0;
    do
    {
      ++v10;
      uint64_t v12 = v9 + v8;
      uint64_t v7 = v7 - (v9 + v8) + v11;
      uint64_t v9 = objc_msgSend(a1, "rangeOfString:options:range:", v6, a4, v9 + v8, v7);
      uint64_t v11 = v12;
    }
    while (v9 != 0x7FFFFFFFFFFFFFFFLL);
  }

  return v10;
}

- (id)tsu_escapeForIcuRegex
{
  if (tsu_escapeForIcuRegex_icuRegexCharSetToken != -1) {
    dispatch_once(&tsu_escapeForIcuRegex_icuRegexCharSetToken, &__block_literal_global_6);
  }
  id v2 = a1;
  uint64_t v3 = [v2 length];
  *(void *)&long long v12 = [v2 rangeOfCharacterFromSet:tsu_escapeForIcuRegex_icuRegexCharSet];
  if ((void)v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = v2;
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x263F089D8]);
    id v6 = [v2 substringToIndex:(void)v12];
    id v4 = (void *)[v5 initWithString:v6];

    if (v3 != (void)v12)
    {
      do
      {
        objc_msgSend(v4, "appendFormat:", @"\\%C", objc_msgSend(v2, "characterAtIndex:", (void)v12));
        *(void *)&long long v12 = v12 + 1;
        *((void *)&v12 + 1) = v3 - v12;
        uint64_t v7 = v12;
        if (v3 != (void)v12)
        {
          *(void *)&long long v11 = [v2 rangeOfCharacterFromSet:tsu_escapeForIcuRegex_icuRegexCharSet options:0 range:(void)v12];
          *((void *)&v11 + 1) = v8;
          long long v12 = v11;
          if ((void)v11 == 0x7FFFFFFFFFFFFFFFLL) {
            long long v12 = (unint64_t)v3;
          }
          if ((void)v12 != v7)
          {
            uint64_t v9 = objc_msgSend(v2, "substringWithRange:", v7, (void)v12 - v7);
            [v4 appendString:v9];
          }
        }
      }
      while (*((void *)&v12 + 1));
    }
  }
  return v4;
}

- (uint64_t)tsu_isDescendantOfPath:()TSUAdditions
{
  id v4 = a3;
  id v5 = [a1 pathComponents];
  id v6 = [v4 pathComponents];
  unint64_t v7 = [v6 count];
  if (v7)
  {
    do
    {
      unint64_t v8 = v7 - 1;
      uint64_t v9 = [v6 objectAtIndexedSubscript:v7 - 1];
      int v10 = [v9 isEqualToString:@"/"];

      if (!v10) {
        break;
      }
      --v7;
    }
    while (v8);
  }
  unint64_t v11 = [v5 count];
  uint64_t v12 = v7 <= v11;
  if (v7 - 1 < v11)
  {
    uint64_t v13 = 0;
    unsigned int v14 = 1;
    do
    {
      uint64_t v15 = [v5 objectAtIndexedSubscript:v13];
      id v16 = [v6 objectAtIndexedSubscript:v13];
      uint64_t v12 = [v15 isEqualToString:v16];

      if (v7 <= v14) {
        break;
      }
      uint64_t v13 = v14++;
    }
    while ((v12 & 1) != 0);
  }

  return v12;
}

- (uint64_t)tsu_isChildOfPath:()TSUAdditions
{
  id v4 = a3;
  id v5 = [a1 pathComponents];
  id v6 = (void *)[v5 mutableCopy];

  unint64_t v7 = [v4 pathComponents];
  unint64_t v8 = (void *)[v7 mutableCopy];

  if ((unint64_t)[v6 count] >= 2)
  {
    do
    {
      uint64_t v9 = [v6 lastObject];
      int v10 = [v9 isEqualToString:@"/"];

      if (!v10) {
        break;
      }
      objc_msgSend(v6, "removeObjectAtIndex:", objc_msgSend(v6, "count") - 1);
    }
    while ((unint64_t)[v6 count] > 1);
  }
  if ((unint64_t)[v8 count] >= 2)
  {
    do
    {
      unint64_t v11 = [v8 lastObject];
      int v12 = [v11 isEqualToString:@"/"];

      if (!v12) {
        break;
      }
      objc_msgSend(v8, "removeObjectAtIndex:", objc_msgSend(v8, "count") - 1);
    }
    while ((unint64_t)[v8 count] > 1);
  }
  uint64_t v13 = [v8 count] + 1;
  uint64_t v14 = [v6 count];
  uint64_t v15 = v13 == v14;
  uint64_t v16 = [v8 count];
  if (v16 && v13 == v14)
  {
    unint64_t v17 = v16;
    uint64_t v18 = 0;
    unsigned int v19 = 1;
    do
    {
      long long v20 = [v6 objectAtIndexedSubscript:v18];
      long long v21 = [v8 objectAtIndexedSubscript:v18];
      uint64_t v15 = [v20 isEqualToString:v21];

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
  CFUUIDRef v1 = realpath_DARWIN_EXTSN((const char *)[a1 fileSystemRepresentation], 0);
  if (v1)
  {
    id v2 = v1;
    uint64_t v3 = [NSString stringWithCString:v1 encoding:4];
    free(v2);
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (id)tsu_substringWithComposedCharacterSequencesTruncatedToLength:()TSUAdditions
{
  if ([a1 length] <= a3)
  {
    id v5 = a1;
  }
  else
  {
    objc_msgSend(a1, "substringToIndex:", objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:", a3));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)tsu_substringWithComposedCharacterSequencesToFileSystemLength:()TSUAdditions
{
  unint64_t v5 = [a1 length];
  unint64_t v6 = 0;
  if (v5)
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = [a1 rangeOfComposedCharacterSequenceAtIndex:v6];
      uint64_t v10 = v9;
      objc_msgSend(a1, "substringWithRange:", v8, v9);
      id v11 = objc_claimAutoreleasedReturnValue();
      int v12 = (const char *)[v11 fileSystemRepresentation];

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
    id v13 = a1;
  }
  else
  {
    id v13 = [a1 substringToIndex:v6];
  }
  return v13;
}

- (__CFString)tsu_stringWithPathRelativeTo:()TSUAdditions
{
  id v4 = a3;
  if (v4)
  {
    unint64_t v5 = (void *)MEMORY[0x23EC9A170]();
    unint64_t v6 = [a1 stringByStandardizingPath];
    unint64_t v7 = [v6 pathComponents];

    uint64_t v8 = [v4 stringByStandardizingPath];
    uint64_t v9 = [v8 pathComponents];

    unint64_t v10 = [v7 count];
    unint64_t v11 = [v9 count];
    if (v10 < v11) {
      goto LABEL_10;
    }
    unint64_t v12 = v11;
    if (!v11) {
      goto LABEL_8;
    }
    long long v22 = v5;
    uint64_t v13 = 0;
    unsigned int v14 = 1;
    do
    {
      uint64_t v15 = [v9 objectAtIndexedSubscript:v13];
      uint64_t v16 = [v7 objectAtIndexedSubscript:v13];
      char v17 = [v15 isEqualToString:v16];

      if ((v17 & 1) == 0) {
        break;
      }
      uint64_t v13 = v14;
    }
    while (v12 > v14++);
    unint64_t v5 = v22;
    if (v12 != v13)
    {
LABEL_10:
      unsigned int v19 = 0;
    }
    else
    {
LABEL_8:
      if (v10 == v12)
      {
        unsigned int v19 = &stru_26EBF24D8;
      }
      else
      {
        long long v21 = objc_msgSend(v7, "subarrayWithRange:", v12, v10 - v12);
        unsigned int v19 = [NSString pathWithComponents:v21];
      }
    }
  }
  else
  {
    unsigned int v19 = 0;
  }

  return v19;
}

- (__CFString)tsu_stringWithPathRelativeTo:()TSUAdditions allowBacktracking:
{
  id v6 = a3;
  if (a4)
  {
    unint64_t v7 = [a1 stringByStandardizingPath];
    uint64_t v8 = [v7 pathComponents];

    uint64_t v9 = [v6 stringByStandardizingPath];
    unint64_t v10 = [v9 pathComponents];

    unint64_t v11 = [v8 count];
    unint64_t v12 = [v10 count];
    unint64_t v13 = v12;
    if (v12 >= v11) {
      unint64_t v14 = v11;
    }
    else {
      unint64_t v14 = v12;
    }
    if (v14)
    {
      uint64_t v15 = 0;
      unint64_t v16 = 0;
      do
      {
        char v17 = [v10 objectAtIndexedSubscript:v15];
        uint64_t v18 = [v8 objectAtIndexedSubscript:v15];
        int v19 = [v17 isEqualToString:v18];

        if (!v19) {
          break;
        }
        uint64_t v15 = ++v16;
      }
      while (v14 > v16);
    }
    else
    {
      unint64_t v16 = 0;
    }
    unint64_t v21 = v13 - v16;
    if (v13 <= v16)
    {
      long long v23 = &stru_26EBF24D8;
    }
    else
    {
      long long v22 = &stru_26EBF24D8;
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
    objc_msgSend(a1, "tsu_stringWithPathRelativeTo:", v6);
    long long v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (__CFString)tsu_stringByTrimmingCharactersInSetFromFront:()TSUAdditions
{
  id v4 = a1;
  uint64_t v5 = [(__CFString *)v4 rangeOfCharacterFromSet:a3 options:8];
  uint64_t v7 = v6;
  if (v6 == [(__CFString *)v4 length])
  {
    uint64_t v8 = &stru_26EBF24D8;
  }
  else
  {
    if (v5) {
      goto LABEL_6;
    }
    uint64_t v8 = [(__CFString *)v4 substringFromIndex:v7];
  }

  id v4 = v8;
LABEL_6:
  return v4;
}

+ (id)tsu_stringWithHexFromBytes:()TSUAdditions length:
{
  uint64_t v4 = a4;
  uint64_t v6 = 2 * a4;
  uint64_t v7 = malloc_type_malloc(2 * a4, 0x99C091F4uLL);
  if (v4)
  {
    uint64_t v8 = v7;
    do
    {
      unsigned int v9 = *a3++;
      *uint64_t v8 = a0123456789abcd[(unint64_t)v9 >> 4];
      v8[1] = a0123456789abcd[v9 & 0xF];
      v8 += 2;
      --v4;
    }
    while (v4);
  }
  unint64_t v10 = (void *)[[NSString alloc] initWithBytesNoCopy:v7 length:v6 encoding:1 freeWhenDone:1];
  return v10;
}

+ (uint64_t)tsu_stringByBase64EncodingBytes:()TSUAdditions length:
{
  return objc_msgSend(NSString, "tsu_stringByBase64EncodingBytes:length:breakLines:", a3, a4, 0);
}

+ (id)tsu_stringByBase64EncodingBytes:()TSUAdditions length:breakLines:
{
  unint64_t v6 = a4;
  uint64_t v8 = [MEMORY[0x263F089D8] stringWithCapacity:4 * a4 / 3];
  if (v6 < 3)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    unint64_t v10 = (unsigned char *)(a3 + 2);
    int v11 = -4;
    unsigned int v12 = 4;
    do
    {
      objc_msgSend(v8, "appendFormat:", @"%c%c%c%c", Base64Alphabet[*(v10 - 2) >> 2], Base64Alphabet[((unint64_t)((*(v10 - 1) << 8) | (*(v10 - 2) << 16)) >> 12) & 0x3F], Base64Alphabet[((unint64_t)(*v10 | (*(v10 - 1) << 8)) >> 6) & 0x3F], Base64Alphabet[*v10 & 0x3F]);
      if (a5 && !(v11 + 76 * (v12 / 0x4C))) {
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
    objc_msgSend(v8, "appendFormat:", @"%c%c==", Base64Alphabet[(unint64_t)*(unsigned __int8 *)(a3 + v13) >> 2], Base64Alphabet[16 * (*(unsigned char *)(a3 + v13) & 3)], v16);
  }
  else if (v6 == 2)
  {
    unint64_t v14 = (unsigned __int8 *)(a3 + v13);
    objc_msgSend(v8, "appendFormat:", @"%c%c%c=", Base64Alphabet[*v14 >> 2], Base64Alphabet[((unint64_t)((*v14 << 16) | (v14[1] << 8)) >> 12) & 0x3F], Base64Alphabet[4 * (v14[1] & 0xF)]);
  }
  return v8;
}

- (uint64_t)tsu_encodeStringBase64
{
  CFUUIDRef v1 = (const char *)[a1 UTF8String];
  size_t v2 = strlen(v1);
  uint64_t v3 = NSString;
  return objc_msgSend(v3, "tsu_stringByBase64EncodingBytes:length:", v1, v2);
}

- (id)tsu_stringByMakingFirstCharacterLowercase
{
  id v1 = a1;
  if ([v1 length])
  {
    size_t v2 = [v1 substringToIndex:1];
    uint64_t v3 = [v2 lowercaseString];
    if (([v2 isEqualToString:v3] & 1) == 0)
    {
      uint64_t v4 = [v1 substringFromIndex:1];
      uint64_t v5 = [v3 stringByAppendingString:v4];

      id v1 = (id)v5;
    }
  }
  return v1;
}

- (id)tsu_stringByMakingFirstCharacterUppercase
{
  size_t v2 = (void *)[a1 mutableCopy];
  if ([v2 length])
  {
    uint64_t v3 = [a1 substringToIndex:1];
    uint64_t v4 = [v3 uppercaseString];
    objc_msgSend(v2, "replaceCharactersInRange:withString:", 0, 1, v4);
  }
  return v2;
}

+ (uint64_t)tsu_stringWithXMLString:()TSUAdditions
{
  return [NSString stringWithCString:a3 encoding:4];
}

- (id)tsu_escapeXML
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
  return v1;
}

- (id)tsu_unescapeXML
{
  id v1 = (void *)[a1 mutableCopy];
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"&amp;",
    @"&",
    0,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"&lt;",
    @"<",
    0,
    0,
    [v1 length]);
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"&gt;",
    @">",
    0,
    0,
    [v1 length]);
  return v1;
}

- (BOOL)tsu_containsOnlyCharactersFromSet:()TSUAdditions
{
  uint64_t v4 = [a3 invertedSet];
  uint64_t v5 = [a1 rangeOfCharacterFromSet:v4];

  return v5 == 0x7FFFFFFFFFFFFFFFLL;
}

- (id)tsu_tolerantStringByAppendingPathExtension:()TSUAdditions
{
  id v4 = a3;
  if (([a1 isEqualToString:&stru_26EBF24D8] & 1) != 0
    || [v4 isEqualToString:&stru_26EBF24D8])
  {
    id v5 = a1;
LABEL_4:
    unint64_t v6 = v5;
    goto LABEL_5;
  }
  if ([a1 isEqualToString:@"\\\\""])
  {
    uint64_t v8 = [@"\\"" stringByAppendingPathExtension:v4];
    uint64_t v9 = [@"\\"" stringByAppendingString:v8];
  }
  else
  {
    if (![a1 length] || objc_msgSend(a1, "characterAtIndex:", 0) != 126)
    {
      id v5 = [a1 stringByAppendingPathExtension:v4];
      goto LABEL_4;
    }
    unint64_t v10 = [@"X" stringByAppendingString:a1];
    uint64_t v8 = [v10 stringByAppendingPathExtension:v4];

    uint64_t v9 = [v8 substringFromIndex:1];
  }
  unint64_t v6 = (void *)v9;

LABEL_5:
  return v6;
}

+ (id)tsu_stringByHexEncodingData:()TSUAdditions
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F089D8] string];
  id v5 = v3;
  unint64_t v6 = (unsigned __int8 *)[v5 bytes];
  uint64_t v7 = [v5 length];
  if (v7)
  {
    uint64_t v8 = v7;
    do
    {
      unsigned int v9 = *v6++;
      objc_msgSend(v4, "appendFormat:", @"%02x", v9);
      --v8;
    }
    while (v8);
  }
  unint64_t v10 = (void *)[v4 copy];

  return v10;
}

- (uint64_t)tsu_rangeOfString:()TSUAdditions options:updatingSearchRange:
{
  id v8 = a3;
  unsigned int v9 = v8;
  if (a5)
  {
    uint64_t v10 = *a5;
    uint64_t v11 = a5[1];
    uint64_t v12 = objc_msgSend(a1, "rangeOfString:options:range:", v8, a4, *a5, v11);
    uint64_t v14 = v12;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(_OWORD *)a5 = NSInvalidRange;
    }
    else if ((a4 & 4) != 0)
    {
      *a5 = v10;
      a5[1] = v12 - v10;
    }
    else
    {
      *a5 = v12 + v13;
      a5[1] = v11 + v10 - (v12 + v13);
    }
  }
  else
  {
    uint64_t v14 = objc_msgSend(a1, "rangeOfString:options:range:", v8, a4, 0, objc_msgSend(v8, "length"));
  }

  return v14;
}

- (uint64_t)tsu_range
{
  return 0;
}

- (void)tsu_enumerateRangesOfCharactersInSet:()TSUAdditions usingBlock:
{
  id v6 = a3;
  uint64_t v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x263F08B08]) initWithString:a1];
  [v8 setCaseSensitive:1];
  [v8 setCharactersToBeSkipped:0];
  if (([v8 isAtEnd] & 1) == 0)
  {
    do
    {
      uint64_t v9 = [v8 scanLocation];
      if ([v8 scanCharactersFromSet:v6 intoString:0])
      {
        uint64_t v10 = [v8 scanLocation];
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

- (BOOL)tsu_containsSubstring:()TSUAdditions
{
  return objc_msgSend(a1, "rangeOfString:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)tsu_setOfContainedWordsIncludingPunctuationAndSymbols:()TSUAdditions
{
  id v30 = [MEMORY[0x263EFF9C0] set];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__NSString_TSUAdditions__tsu_setOfContainedWordsIncludingPunctuationAndSymbols___block_invoke;
  aBlock[3] = &__block_descriptor_33_e30_Q16__0____CFStringTokenizer__8l;
  int v35 = a3;
  char v38 = a3;
  id v5 = (void (**)(void *, __CFStringTokenizer *))_Block_copy(aBlock);
  CFRange v36 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  CFIndex v6 = [(__CFString *)a1 length];
  CFLocaleRef v7 = CFLocaleCopyCurrent();
  v40.CFIndex location = 0;
  CFIndex v31 = v6;
  v40.CFIndex length = v6;
  id v8 = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a1, v40, 4uLL, v7);
  CFRelease(v7);
  CFStringTokenizerTokenType v9 = CFStringTokenizerGoToTokenAtIndex(v8, 0);
  LODWORD(v10) = v9;
  if (!v9) {
    v5[2](v5, v8);
  }
  CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v8);
  if (CurrentTokenRange.location != -1)
  {
    CFIndex location = CurrentTokenRange.location;
    CFIndex length = CurrentTokenRange.length;
    CFIndex v14 = 0;
    CFIndex v15 = CurrentTokenRange.length;
    unint64_t v34 = a1;
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
            if (objc_msgSend(v36, "characterIsMember:", -[__CFString characterAtIndex:](a1, "characterAtIndex:", v19)))
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
      long long v26 = -[__CFString substringWithRange:](v34, "substringWithRange:", v24, v25, v30);
      id v27 = [v26 stringByTrimmingCharactersInSet:v36];

      if ([v27 length]) {
        [v30 addObject:v27];
      }

      CFIndex location = v19;
      CFIndex v15 = v28;
      a1 = v34;
    }
    while (v19 != -1);
  }
  if (v8) {
    CFRelease(v8);
  }

  return v30;
}

- (uint64_t)tsu_stringWithoutAttachmentCharacters
{
  if (tsu_stringWithoutAttachmentCharacters_onceToken != -1) {
    dispatch_once(&tsu_stringWithoutAttachmentCharacters_onceToken, &__block_literal_global_108_0);
  }
  uint64_t v2 = tsu_stringWithoutAttachmentCharacters_sAttachmentCharacter;
  return [a1 stringByReplacingOccurrencesOfString:v2 withString:&stru_26EBF24D8];
}

- (id)tsu_middleTruncateToLength:()TSUAdditions
{
  id v4 = a1;
  if ([v4 length] <= a3)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = (void *)[v4 mutableCopy];
    do
      objc_msgSend(v5, "replaceCharactersInRange:withString:", ((unint64_t)objc_msgSend(v5, "length") >> 1) - 1, 3, @"…");
    while ([v5 length] > a3);
  }
  return v5;
}

- (uint64_t)tsu_isEqualToString:()TSUAdditions
{
  if (a3) {
    return objc_msgSend(a1, "isEqualToString:");
  }
  else {
    return 0;
  }
}

- (id)tsu_stringWithNormalizedHyphensAndQuotationMarks
{
  id v1 = objc_msgSend(a1, "tsu_stringWithNormalizedHyphens");
  uint64_t v2 = objc_msgSend(v1, "tsu_stringWithNormalizedQuotationMarks");

  return v2;
}

- (uint64_t)tsu_stringWithNormalizedHyphens
{
  if (tsu_stringWithNormalizedHyphens_onceToken != -1) {
    dispatch_once(&tsu_stringWithNormalizedHyphens_onceToken, &__block_literal_global_113_0);
  }
  uint64_t v2 = tsu_stringWithNormalizedHyphens_hyphenSet;
  return objc_msgSend(a1, "tsu_stringByReplacingInstancesOfCharactersInSet:withString:", v2, @"-");
}

- (uint64_t)tsu_stringWithNormalizedQuotationMarks
{
  if (tsu_stringWithNormalizedQuotationMarks_onceToken != -1) {
    dispatch_once(&tsu_stringWithNormalizedQuotationMarks_onceToken, &__block_literal_global_121);
  }
  uint64_t v2 = tsu_stringWithNormalizedQuotationMarks_quotationSet;
  return objc_msgSend(a1, "tsu_stringByReplacingInstancesOfCharactersInSet:withString:", v2, @"'");
}

@end