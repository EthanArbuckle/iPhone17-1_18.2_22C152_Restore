@interface NSString(TSUAdditions)
+ (__CFString)tsu_stringWithUUID;
+ (id)tsu_stringByIndentingString:()TSUAdditions times:;
+ (id)tsu_stringWithFormat:()TSUAdditions arguments:;
+ (uint64_t)tsu_listSeparator;
+ (uint64_t)tsu_stringByBase64EncodingBytes:()TSUAdditions length:;
+ (uint64_t)tsu_stringByIndentingString:()TSUAdditions;
+ (uint64_t)tsu_stringWithXMLString:()TSUAdditions;
+ (void)tsu_stringByBase64EncodingBytes:()TSUAdditions length:breakLines:;
- (BOOL)tsu_containsOnlyCharactersFromSet:()TSUAdditions;
- (BOOL)tsu_isChildOfPath:()TSUAdditions;
- (__CFString)tsu_stringByFixingBrokenSurrogatePairs;
- (__CFString)tsu_stringWithPathRelativeTo:()TSUAdditions;
- (char)tsu_stringWithRealpath;
- (id)tsu_escapeForIcuRegex;
- (id)tsu_escapeXML;
- (id)tsu_stringByExpandingTableFormatting;
- (id)tsu_stringByMakingFirstCharacterUppercase;
- (id)tsu_stringQuotedIfContainsCharacterSet:()TSUAdditions;
- (id)tsu_unescapeXML;
- (uint64_t)tsu_encodeStringBase64;
- (uint64_t)tsu_isDescendantOfPath:()TSUAdditions;
- (uint64_t)tsu_md5Hash;
- (uint64_t)tsu_stringByAddingCSVEscapes;
- (uint64_t)tsu_stringByAppendingSeparator:()TSUAdditions format:;
- (uint64_t)tsu_stringByRemovingCharactersInSet:()TSUAdditions;
- (uint64_t)tsu_stringByReplacingInstancesOfCharactersInSet:()TSUAdditions withString:;
- (uint64_t)tsu_stringByUniquingPathInsideDirectory:()TSUAdditions;
- (uint64_t)tsu_stringWithPathRelativeTo:()TSUAdditions allowBacktracking:;
- (uint64_t)tsu_substringWithComposedCharacterSequencesToFileSystemLength:()TSUAdditions;
- (uint64_t)tsu_substringWithComposedCharacterSequencesToIndex:()TSUAdditions;
- (uint64_t)tsu_tolerantStringByAppendingPathExtension:()TSUAdditions;
- (void)tsu_stringByRemovingCharactersInSet:()TSUAdditions options:;
- (void)tsu_stringByReplacingCharactersInSet:()TSUAdditions withCharacter:;
- (void)tsu_stringByUniquingPathInsideDirectory:()TSUAdditions withFormat:;
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
  v4 = (void *)[[NSString alloc] initWithFormat:a3 arguments:a4];
  return v4;
}

+ (id)tsu_stringByIndentingString:()TSUAdditions times:
{
  v5 = a3;
  uint64_t v6 = [a3 length];
  if (a4 && v6)
  {
    do
    {
      v7 = (void *)[v5 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n  "];
      if ([v7 hasSuffix:@"\n  "]) {
        v7 = objc_msgSend(v7, "substringToIndex:", objc_msgSend(v7, "length") - 2);
      }
      id result = (id)[@"  " stringByAppendingString:v7];
      v5 = result;
      --a4;
    }
    while (a4);
  }
  else
  {
    id v9 = v5;
    return v9;
  }
  return result;
}

+ (uint64_t)tsu_stringByIndentingString:()TSUAdditions
{
  return objc_msgSend(a1, "tsu_stringByIndentingString:times:", a3, 1);
}

- (id)tsu_stringByExpandingTableFormatting
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F086B0]);
  v3 = (void *)[a1 componentsSeparatedByString:@"$"];
  v4 = (void *)[MEMORY[0x263EFF980] array];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v60 != v8) {
          objc_enumerationMutation(v3);
        }
        v10 = (void *)[*(id *)(*((void *)&v59 + 1) + 8 * i) componentsSeparatedByString:@"|"];
        [v4 addObject:v10];
        if ((unint64_t)v7 <= [v10 count]) {
          id v7 = (id)[v10 count];
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v59 objects:v64 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }
  if (objc_msgSend((id)objc_msgSend(v4, "lastObject"), "count") == 1
    && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "lastObject"), "objectAtIndex:", 0), "length"))
  {
    [v4 removeLastObject];
  }
  if (v7)
  {
    id v46 = v2;
    v11 = malloc_type_calloc(8uLL, (size_t)v7, 0x9436C304uLL);
    v12 = malloc_type_calloc(8uLL, [v4 count], 0x8C5163FFuLL);
    v49 = v4;
    v54 = v12;
    if ([v4 count])
    {
      unint64_t v13 = 0;
      int v14 = 0;
      unint64_t v50 = (unint64_t)v7;
      do
      {
        int v47 = v14;
        v52 = objc_msgSend(v4, "objectAtIndex:", v13, v46);
        unint64_t v15 = 0;
        unsigned int v16 = 0;
        do
        {
          unint64_t v17 = [v52 count];
          v18 = &stru_26D4F03D0;
          if (v17 > v15) {
            v18 = (__CFString *)[v52 objectAtIndex:v15];
          }
          v19 = (void *)[(__CFString *)v18 componentsSeparatedByString:@"\n"];
          unint64_t v20 = v12[v13];
          if (v20 <= [v19 count]) {
            uint64_t v21 = [v19 count];
          }
          else {
            uint64_t v21 = v12[v13];
          }
          v12[v13] = v21;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          uint64_t v22 = [v19 countByEnumeratingWithState:&v55 objects:v63 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v56;
            do
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v56 != v24) {
                  objc_enumerationMutation(v19);
                }
                v26 = *(void **)(*((void *)&v55 + 1) + 8 * j);
                unint64_t v27 = v11[v15];
                if (v27 <= [v26 length]) {
                  uint64_t v28 = [v26 length];
                }
                else {
                  uint64_t v28 = v11[v15];
                }
                v11[v15] = v28;
              }
              uint64_t v23 = [v19 countByEnumeratingWithState:&v55 objects:v63 count:16];
            }
            while (v23);
          }
          unint64_t v15 = ++v16;
          v12 = v54;
        }
        while (v50 > v16);
        unint64_t v13 = (v47 + 1);
        v4 = v49;
        unint64_t v29 = [v49 count];
        int v14 = v47 + 1;
      }
      while (v29 > v13);
    }
    id v7 = objc_alloc_init(MEMORY[0x263F089D8]);
    if ([v4 count])
    {
      unint64_t v30 = 0;
      int v31 = 0;
      do
      {
        int v48 = v31;
        uint64_t v32 = objc_msgSend(v4, "objectAtIndex:", v30, v46);
        if (v12[v30])
        {
          v33 = (void *)v32;
          unint64_t v34 = 0;
          int v35 = 0;
          unint64_t v51 = v30;
          do
          {
            int v53 = v35;
            if ([v33 count])
            {
              unint64_t v36 = 0;
              unsigned int v37 = 1;
              do
              {
                unint64_t v38 = [v33 count];
                v39 = &stru_26D4F03D0;
                if (v38 > v36) {
                  v39 = (__CFString *)[v33 objectAtIndex:v36];
                }
                v40 = (void *)[(__CFString *)v39 componentsSeparatedByString:@"\n"];
                unint64_t v41 = [v40 count];
                v42 = &stru_26D4F03D0;
                if (v41 > v34) {
                  v42 = (__CFString *)[v40 objectAtIndex:v34];
                }
                objc_msgSend(v7, "appendString:", -[__CFString stringByPaddingToLength:withString:startingAtIndex:](v42, "stringByPaddingToLength:withString:startingAtIndex:", v11[v36] + 1, @" ", 0));
                unint64_t v36 = v37;
              }
              while ([v33 count] > (unint64_t)v37++);
            }
            [v7 appendString:@"\n"];
            unint64_t v34 = (v53 + 1);
            v12 = v54;
            int v35 = v53 + 1;
          }
          while (v54[v51] > v34);
        }
        unint64_t v30 = (v48 + 1);
        v4 = v49;
        unint64_t v44 = [v49 count];
        int v31 = v48 + 1;
      }
      while (v44 > v30);
    }
    free(v12);
    free(v11);
    id v2 = v46;
  }
  objc_msgSend(v2, "drain", v46);
  return v7;
}

- (id)tsu_stringQuotedIfContainsCharacterSet:()TSUAdditions
{
  CFUUIDRef v1 = a1;
  if (objc_msgSend(a1, "rangeOfCharacterFromSet:") != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v2 = (id)[v1 mutableCopy];
    objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"\", @"\"\", 0, 0, objc_msgSend(v1, "length"));
    [v2 appendString:@"\""];
    [v2 insertString:@"\"" atIndex:0];
    return v2;
  }
  return v1;
}

+ (uint64_t)tsu_listSeparator
{
  uint64_t result = tsu_listSeparator_listSeparator;
  if (!tsu_listSeparator_listSeparator)
  {
    CFLocaleRef v1 = CFLocaleCopyCurrent();
    Value = (void *)CFLocaleGetValue(v1, (CFLocaleKey)*MEMORY[0x263EFFCD0]);
    v3 = @";";
    if (([Value isEqualToString:@","] & 1) == 0
      && ![Value isEqualToString:@"٫"])
    {
      v3 = @",";
    }
    tsu_listSeparator_listSeparator = (uint64_t)v3;
    CFRelease(v1);
    return tsu_listSeparator_listSeparator;
  }
  return result;
}

- (uint64_t)tsu_stringByAppendingSeparator:()TSUAdditions format:
{
  uint64_t v11 = objc_msgSend(NSString, "tsu_stringWithFormat:arguments:", a4, &a9);
  if ([a1 length]) {
    return [a1 stringByAppendingFormat:@"%@%@", a3, v11];
  }
  return v11;
}

- (uint64_t)tsu_stringByAddingCSVEscapes
{
  if (!tsu_stringByAddingCSVEscapes_characterSet)
  {
    id v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08708], "whitespaceAndNewlineCharacterSet"), "mutableCopy");
    objc_msgSend(v2, "formIntersectionWithCharacterSet:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F08708], "whitespaceCharacterSet"), "invertedSet"));
    [v2 addCharactersInString:@"\""];
    v3 = objc_msgSend((id)objc_opt_class(), "tsu_listSeparator");
    if ([v3 length] != 1)
    {
      id v4 = +[TSUAssertionHandler currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"-[NSString(TSUAdditions) tsu_stringByAddingCSVEscapes]"];
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSString_TSUAdditions.m"), 225, @"The list separator is not a 1-char string");
    }
    [v2 addCharactersInString:v3];
    tsu_stringByAddingCSVEscapes_characterSet = [v2 copy];
  }
  return objc_msgSend(a1, "tsu_stringQuotedIfContainsCharacterSet:");
}

- (uint64_t)tsu_stringByUniquingPathInsideDirectory:()TSUAdditions
{
  return objc_msgSend(a1, "tsu_stringByUniquingPathInsideDirectory:withFormat:", a3, @"%@-%d%@");
}

- (void)tsu_stringByUniquingPathInsideDirectory:()TSUAdditions withFormat:
{
  if (!a3)
  {
    id v7 = +[TSUAssertionHandler currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[NSString(TSUAdditions) tsu_stringByUniquingPathInsideDirectory:withFormat:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSString_TSUAdditions.m"), 240, @"invalid nil value for '%s'", "directoryPath");
  }
  id v9 = (void *)[MEMORY[0x263F08850] defaultManager];
  if (objc_msgSend(v9, "fileExistsAtPath:", objc_msgSend(a3, "stringByAppendingPathComponent:", a1)))
  {
    v10 = objc_opt_new();
    uint64_t v11 = (__CFString *)[a1 pathExtension];
    if (v11)
    {
      v12 = v11;
      if ([(__CFString *)v11 length]) {
        v12 = (__CFString *)[@"." stringByAppendingString:v12];
      }
    }
    else
    {
      v12 = &stru_26D4F03D0;
    }
    uint64_t v13 = [a1 stringByDeletingPathExtension];
    uint64_t v14 = 2;
    do
    {
      uint64_t v15 = (v14 + 1);
      a1 = objc_msgSend(NSString, "stringWithFormat:", a4, v13, v14, v12);
      char v16 = objc_msgSend(v9, "fileExistsAtPath:", objc_msgSend(a3, "stringByAppendingPathComponent:", a1));
      uint64_t v14 = v15;
    }
    while ((v16 & 1) != 0);
    id v17 = a1;
    [v10 drain];
    id v18 = a1;
  }
  return a1;
}

- (__CFString)tsu_stringByFixingBrokenSurrogatePairs
{
  CFLocaleRef v1 = a1;
  uint64_t v2 = [(__CFString *)a1 length];
  CFStringRef theString = v1;
  uint64_t v30 = 0;
  int64_t v31 = v2;
  CharactersPtr = CFStringGetCharactersPtr(v1);
  CStringPtr = 0;
  uint64_t v28 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
  }
  int64_t v32 = 0;
  int64_t v33 = 0;
  unint64_t v29 = CStringPtr;
  if (v2 >= 1)
  {
    int64_t v5 = 0;
    uint64_t v6 = 0;
    int64_t v7 = 0;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    do
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
              v34.location = v30 + v10;
              v34.length = v8 - v10;
              CFStringGetCharacters(theString, v34, (UniChar *)&v19);
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
              uint64_t v6 = (__CFString *)(id)-[__CFString mutableCopyWithZone:](v1, "mutableCopyWithZone:", 0, v19, v20, v21, v22, v23, v24, v25, v26);
              CFLocaleRef v1 = v6;
            }
            [(__CFString *)v6 replaceCharactersInRange:v7, 1, @"\uFFFD", v19, v20, v21, v22, v23, v24, v25, v26 withString];
            uint64_t v2 = [(__CFString *)v1 length];
            CFStringRef theString = v1;
            uint64_t v30 = 0;
            int64_t v31 = v2;
            char v16 = CFStringGetCharactersPtr(v1);
            id v17 = 0;
            uint64_t v28 = v16;
            if (!v16) {
              id v17 = CFStringGetCStringPtr(v1, 0x600u);
            }
            int64_t v5 = 0;
            unint64_t v29 = v17;
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
                v35.location = v30 + v15;
                v35.length = v13 - v15;
                CFStringGetCharacters(theString, v35, (UniChar *)&v19);
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
      ++v7;
    }
    while (v7 < v2);
  }
  return v1;
}

- (uint64_t)tsu_md5Hash
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  CFLocaleRef v1 = (void *)[a1 dataUsingEncoding:2483028224];
  memset(&c, 0, sizeof(c));
  CC_MD5_Init(&c);
  unint64_t v2 = [v1 length];
  uint64_t v3 = [v1 bytes];
  if (v2)
  {
    id v4 = (char *)v3;
    do
    {
      if (v2 >= 0xFFFFFFFF) {
        uint64_t v5 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v5 = v2;
      }
      CC_MD5_Update(&c, v4, v5);
      v4 += v5;
      v2 -= v5;
    }
    while (v2);
  }
  CC_MD5_Final(md, &c);
  return objc_msgSend(NSString, "stringWithFormat:", @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", md[0], md[1], md[2], md[3], md[4], md[5], md[6], md[7], md[8], md[9], md[10], md[11], md[12], md[13], md[14], md[15]);
}

- (void)tsu_stringByRemovingCharactersInSet:()TSUAdditions options:
{
  id v4 = a1;
  if (a3)
  {
    if (objc_msgSend(a1, "rangeOfCharacterFromSet:") != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v7 = (void *)[MEMORY[0x263F089D8] string];
      uint64_t v8 = [v4 length];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = 0;
        uint64_t v11 = a4 & 0xFFFFFFFB;
        uint64_t v12 = v8;
        do
        {
          uint64_t v13 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", a3, v11, v10, v12);
          if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v15 = 0;
          }
          else {
            uint64_t v15 = v14;
          }
          if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v16 = v9;
          }
          else {
            uint64_t v16 = v13;
          }
          objc_msgSend(v7, "appendString:", objc_msgSend(v4, "substringWithRange:", v10, v16 - v10));
          uint64_t v10 = v15 + v16;
          uint64_t v12 = v9 - (v15 + v16);
        }
        while (v9 != v15 + v16);
      }
      return v7;
    }
  }
  else
  {
    id v17 = +[TSUAssertionHandler currentHandler];
    uint64_t v18 = [NSString stringWithUTF8String:"-[NSString(TSUAdditions) tsu_stringByRemovingCharactersInSet:options:]"];
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSString_TSUAdditions.m"), 369, @"invalid nil value for '%s'", "charSet");
  }
  return v4;
}

- (uint64_t)tsu_stringByRemovingCharactersInSet:()TSUAdditions
{
  return objc_msgSend(a1, "tsu_stringByRemovingCharactersInSet:options:", a3, 0);
}

- (void)tsu_stringByReplacingCharactersInSet:()TSUAdditions withCharacter:
{
  __int16 v14 = a4;
  if (a3)
  {
    uint64_t v6 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", a3, 4, 0, objc_msgSend(a1, "length"));
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_3:

      goto LABEL_5;
    }
    uint64_t v11 = v6;
    uint64_t v12 = v7;
    uint64_t v9 = 0;
    uint64_t v8 = 0;
    while (1)
    {
      if (v9)
      {
        if (!v8) {
          goto LABEL_14;
        }
      }
      else
      {
        uint64_t v9 = (void *)[MEMORY[0x263F089D8] stringWithString:a1];
        if (!v8) {
LABEL_14:
        }
          uint64_t v8 = (void *)[[NSString alloc] initWithCharacters:&v14 length:1];
      }
      objc_msgSend(v9, "replaceCharactersInRange:withString:", v11, v12, v8);
      uint64_t v11 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", a3, 4, 0, v11);
      uint64_t v12 = v13;
      if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_3;
      }
    }
  }
  uint64_t v9 = 0;
LABEL_5:
  if (v9) {
    return v9;
  }
  else {
    return a1;
  }
}

- (uint64_t)tsu_stringByReplacingInstancesOfCharactersInSet:()TSUAdditions withString:
{
  uint64_t v6 = a1;
  if ([a1 rangeOfCharacterFromSet:a3 options:2] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x263F089D8], "stringWithCapacity:", objc_msgSend(v6, "length"));
    uint64_t v8 = (void *)[MEMORY[0x263F08B08] scannerWithString:v6];
    [v8 setCharactersToBeSkipped:0];
    id v11 = 0;
    while (([v8 isAtEnd] & 1) == 0)
    {
      if ([v8 scanUpToCharactersFromSet:a3 intoString:&v11]) {
        [v7 appendString:v11];
      }
      if ([v8 isAtEnd]) {
        break;
      }
      [v8 scanCharactersFromSet:a3 intoString:&v11];
      for (uint64_t i = [v11 length]; i; --i)
        [v7 appendString:a4];
    }
    return [NSString stringWithString:v7];
  }
  return (uint64_t)v6;
}

- (id)tsu_escapeForIcuRegex
{
  if (!tsu_escapeForIcuRegex_icuRegexCharSet)
  {
    objc_sync_enter(obj);
    if (!tsu_escapeForIcuRegex_icuRegexCharSet)
    {
      id v2 = (id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"*?+[(){}^$|\\./"];
      __dmb(0xBu);
      tsu_escapeForIcuRegex_icuRegexCharSet = (uint64_t)v2;
      if (!v2)
      {
        id v3 = +[TSUAssertionHandler currentHandler];
        uint64_t v4 = [NSString stringWithUTF8String:"-[NSString(TSUAdditions) tsu_escapeForIcuRegex]"];
        objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSString_TSUAdditions.m"), 483, @"Couldn't initialize lazy variable %s", "icuRegexCharSet");
      }
    }
    objc_sync_exit(obj);
  }
  uint64_t v5 = [obj length];
  *(void *)&long long v11 = [obj rangeOfCharacterFromSet:tsu_escapeForIcuRegex_icuRegexCharSet];
  if ((void)v11 == 0x7FFFFFFFFFFFFFFFLL) {
    return obj;
  }
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", objc_msgSend(obj, "substringToIndex:", (void)v11));
  if (v5 != (void)v11)
  {
    do
    {
      objc_msgSend(v7, "appendFormat:", @"\\%C", objc_msgSend(obj, "characterAtIndex:", (void)v11));
      *(void *)&long long v11 = v11 + 1;
      *((void *)&v11 + 1) = v5 - v11;
      uint64_t v8 = v11;
      if (v5 != (void)v11)
      {
        *(void *)&long long v10 = [obj rangeOfCharacterFromSet:tsu_escapeForIcuRegex_icuRegexCharSet options:0 range:(void)v11];
        *((void *)&v10 + 1) = v9;
        long long v11 = v10;
        if ((void)v10 == 0x7FFFFFFFFFFFFFFFLL) {
          long long v11 = (unint64_t)v5;
        }
        if ((void)v11 != v8) {
          objc_msgSend(v7, "appendString:", objc_msgSend(obj, "substringWithRange:", v8, (void)v11 - v8));
        }
      }
    }
    while (*((void *)&v11 + 1));
  }
  return v7;
}

- (uint64_t)tsu_isDescendantOfPath:()TSUAdditions
{
  uint64_t v4 = (void *)[a1 pathComponents];
  uint64_t v5 = (void *)[a3 pathComponents];
  uint64_t v6 = [v5 count];
  do
  {
    unint64_t v7 = v6;
    if (!v6) {
      break;
    }
    --v6;
  }
  while ((objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", v7 - 1), "isEqualToString:", @"/") & 1) != 0);
  unint64_t v8 = [v4 count];
  uint64_t result = v7 <= v8;
  if (v7 - 1 < v8)
  {
    uint64_t v10 = 0;
    unsigned int v11 = 1;
    do
    {
      uint64_t result = objc_msgSend((id)objc_msgSend(v4, "objectAtIndex:", v10), "isEqualToString:", objc_msgSend(v5, "objectAtIndex:", v10));
      if (v7 <= v11) {
        break;
      }
      uint64_t v10 = v11++;
    }
    while ((result & 1) != 0);
  }
  return result;
}

- (BOOL)tsu_isChildOfPath:()TSUAdditions
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "pathComponents"), "mutableCopy");
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "pathComponents"), "mutableCopy");
  if ((unint64_t)[v4 count] >= 2)
  {
    do
    {
      if (!objc_msgSend((id)objc_msgSend(v4, "lastObject"), "isEqualToString:", @"/")) {
        break;
      }
      objc_msgSend(v4, "removeObjectAtIndex:", objc_msgSend(v4, "count") - 1);
    }
    while ((unint64_t)[v4 count] > 1);
  }
  if ((unint64_t)[v5 count] >= 2)
  {
    do
    {
      if (!objc_msgSend((id)objc_msgSend(v5, "lastObject"), "isEqualToString:", @"/")) {
        break;
      }
      objc_msgSend(v5, "removeObjectAtIndex:", objc_msgSend(v5, "count") - 1);
    }
    while ((unint64_t)[v5 count] > 1);
  }
  uint64_t v6 = [v5 count] + 1;
  uint64_t v7 = [v4 count];
  BOOL v8 = v6 == v7;
  uint64_t v9 = [v5 count];
  if (v9 && v6 == v7)
  {
    unint64_t v10 = v9;
    uint64_t v11 = 0;
    unsigned int v12 = 1;
    do
    {
      uint64_t v13 = objc_msgSend((id)objc_msgSend(v4, "objectAtIndex:", v11), "isEqualToString:", objc_msgSend(v5, "objectAtIndex:", v11));
      BOOL v8 = v13;
      if (v10 <= v12) {
        break;
      }
      uint64_t v11 = v12++;
    }
    while ((v13 & 1) != 0);
  }

  return v8;
}

- (char)tsu_stringWithRealpath
{
  uint64_t result = realpath_DARWIN_EXTSN((const char *)[a1 fileSystemRepresentation], 0);
  if (result)
  {
    id v2 = result;
    uint64_t v3 = [NSString stringWithCString:result encoding:4];
    free(v2);
    return (char *)v3;
  }
  return result;
}

- (uint64_t)tsu_substringWithComposedCharacterSequencesToIndex:()TSUAdditions
{
  unint64_t v5 = [a1 length];
  unint64_t v6 = 0;
  do
  {
    unint64_t v7 = v6;
    if (v6 >= v5) {
      break;
    }
    [a1 rangeOfComposedCharacterSequenceAtIndex:v6];
    unint64_t v6 = v8 + v7;
  }
  while (v8 + v7 <= a3);
  uint64_t result = (uint64_t)a1;
  if (v7 != v5)
  {
    return [a1 substringToIndex:v7];
  }
  return result;
}

- (uint64_t)tsu_substringWithComposedCharacterSequencesToFileSystemLength:()TSUAdditions
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
      v7 += strlen((const char *)objc_msgSend((id)objc_msgSend(a1, "substringWithRange:", v8, v9), "fileSystemRepresentation"));
      if (v7 > a3) {
        break;
      }
      v6 += v10;
    }
    while (v6 < v5);
  }
  uint64_t result = (uint64_t)a1;
  if (v6 != v5)
  {
    return [a1 substringToIndex:v6];
  }
  return result;
}

- (__CFString)tsu_stringWithPathRelativeTo:()TSUAdditions
{
  if (!a3) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x263F086B0]);
  unint64_t v6 = objc_msgSend((id)objc_msgSend(a1, "stringByStandardizingPath"), "pathComponents");
  unint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "stringByStandardizingPath"), "pathComponents");
  unint64_t v8 = [v6 count];
  unint64_t v9 = [v7 count];
  if (v8 < v9) {
    goto LABEL_10;
  }
  unint64_t v10 = v9;
  if (!v9) {
    goto LABEL_8;
  }
  uint64_t v11 = 0;
  unsigned int v12 = 1;
  do
  {
    if ((objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", v11), "isEqualToString:", objc_msgSend(v6, "objectAtIndex:", v11)) & 1) == 0)break; {
    uint64_t v11 = v12;
    }
  }
  while (v10 > v12++);
  if (v10 != v11)
  {
LABEL_10:
    __int16 v14 = 0;
  }
  else
  {
LABEL_8:
    if (v8 == v10)
    {
      __int16 v14 = &stru_26D4F03D0;
    }
    else
    {
      uint64_t v18 = objc_msgSend(v6, "subarrayWithRange:", v10, v8 - v10);
      __int16 v14 = (__CFString *)[NSString pathWithComponents:v18];
    }
  }
  uint64_t v15 = v14;
  [v5 drain];
  uint64_t v16 = v14;
  return v14;
}

- (uint64_t)tsu_stringWithPathRelativeTo:()TSUAdditions allowBacktracking:
{
  if (a4)
  {
    id v5 = objc_msgSend((id)objc_msgSend(a1, "stringByStandardizingPath"), "pathComponents");
    unint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "stringByStandardizingPath"), "pathComponents");
    unint64_t v7 = [v5 count];
    unint64_t v8 = [v6 count];
    unint64_t v9 = v8;
    unint64_t v10 = 0;
    if (v8 >= v7) {
      unint64_t v11 = v7;
    }
    else {
      unint64_t v11 = v8;
    }
    if (v11)
    {
      while (objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", v10), "isEqualToString:", objc_msgSend(v5, "objectAtIndex:", v10)))
      {
        if (v11 == ++v10)
        {
          unint64_t v10 = v11;
          break;
        }
      }
    }
    unint64_t v12 = v9 - v10;
    if (v9 <= v10)
    {
      uint64_t v13 = &stru_26D4F03D0;
    }
    else
    {
      uint64_t v13 = &stru_26D4F03D0;
      do
      {
        uint64_t v13 = (__CFString *)[(__CFString *)v13 stringByAppendingPathComponent:@".."];
        --v12;
      }
      while (v12);
    }
    if (v10 < v7)
    {
      do
        uint64_t v13 = (__CFString *)-[__CFString stringByAppendingPathComponent:](v13, "stringByAppendingPathComponent:", [v5 objectAtIndex:v10++]);
      while (v7 != v10);
    }
    return (uint64_t)v13;
  }
  else
  {
    return objc_msgSend(a1, "tsu_stringWithPathRelativeTo:");
  }
}

+ (uint64_t)tsu_stringByBase64EncodingBytes:()TSUAdditions length:
{
  return objc_msgSend(NSString, "tsu_stringByBase64EncodingBytes:length:breakLines:", a3, a4, 0);
}

+ (void)tsu_stringByBase64EncodingBytes:()TSUAdditions length:breakLines:
{
  unint64_t v6 = a4;
  unint64_t v8 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:4 * a4 / 3];
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
    __int16 v14 = (unsigned __int8 *)(a3 + v13);
    objc_msgSend(v8, "appendFormat:", @"%c%c%c=", Base64Alphabet[*v14 >> 2], Base64Alphabet[((unint64_t)((*v14 << 16) | (v14[1] << 8)) >> 12) & 0x3F], Base64Alphabet[4 * (v14[1] & 0xF)]);
  }
  return v8;
}

- (uint64_t)tsu_encodeStringBase64
{
  CFLocaleRef v1 = (const char *)[a1 UTF8String];
  size_t v2 = strlen(v1);
  uint64_t v3 = NSString;
  return objc_msgSend(v3, "tsu_stringByBase64EncodingBytes:length:", v1, v2);
}

- (id)tsu_stringByMakingFirstCharacterUppercase
{
  size_t v2 = (void *)[a1 mutableCopy];
  if ([v2 length]) {
    objc_msgSend(v2, "replaceCharactersInRange:withString:", 0, 1, objc_msgSend((id)objc_msgSend(a1, "substringToIndex:", 1), "uppercaseString"));
  }
  return v2;
}

+ (uint64_t)tsu_stringWithXMLString:()TSUAdditions
{
  return [NSString stringWithCString:a3 encoding:4];
}

- (id)tsu_escapeXML
{
  id v1 = (id)[a1 mutableCopy];
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
  id v1 = (id)[a1 mutableCopy];
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
  return objc_msgSend(a1, "rangeOfCharacterFromSet:", objc_msgSend(a3, "invertedSet")) == 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)tsu_tolerantStringByAppendingPathExtension:()TSUAdditions
{
  if (([a1 isEqualToString:&stru_26D4F03D0] & 1) != 0
    || ([a3 isEqualToString:&stru_26D4F03D0] & 1) != 0)
  {
    return (uint64_t)a1;
  }
  if ([a1 isEqualToString:@"\\\\""])
  {
    uint64_t v6 = [@"\\"" stringByAppendingPathExtension:a3];
    return [@"\\"" stringByAppendingString:v6];
  }
  else if ([a1 length] && objc_msgSend(a1, "characterAtIndex:", 0) == 126)
  {
    unint64_t v7 = objc_msgSend((id)objc_msgSend(@"X", "stringByAppendingString:", a1), "stringByAppendingPathExtension:", a3);
    return [v7 substringFromIndex:1];
  }
  else
  {
    return [a1 stringByAppendingPathExtension:a3];
  }
}

@end