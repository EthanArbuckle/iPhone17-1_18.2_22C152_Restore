@interface NSString(SCRCStringExtras)
- (BOOL)containsAttachmentCharSet;
- (id)contentsOfEmbeddedCommand:()SCRCStringExtras;
- (id)scrStringByTrimmingTrailingNewlines;
- (id)stringByReplacingCharactersInSet:()SCRCStringExtras withString:;
- (id)stringByTrimmingEmptySpaceEdges;
- (id)stringByTrimmingLeadingCharactersInSet:()SCRCStringExtras;
- (id)stringByTrimmingTrailingCharactersInSet:()SCRCStringExtras;
- (id)stringByTruncatingToWordAtIndex:()SCRCStringExtras addElipses:;
- (uint64_t)character32AtIndex:()SCRCStringExtras returningNumberOfComposedChars:;
- (uint64_t)enclosingSentenceRangeForRange:()SCRCStringExtras;
- (uint64_t)fourCharCodeValue;
- (uint64_t)hasMultipleWordsWithLocaleName:()SCRCStringExtras ignorePunctuation:;
- (uint64_t)nextWordFromPosition:()SCRCStringExtras;
- (uint64_t)previousWordFromPosition:()SCRCStringExtras;
- (unint64_t)sentenceBreakInDirection:()SCRCStringExtras fromIndex:skipCurrent:;
- (void)enumerateCharacter32sInRange:()SCRCStringExtras block:;
@end

@implementation NSString(SCRCStringExtras)

- (uint64_t)character32AtIndex:()SCRCStringExtras returningNumberOfComposedChars:
{
  uint64_t v7 = objc_msgSend(a1, "characterAtIndex:");
  uint64_t v8 = [a1 rangeOfComposedCharacterSequenceAtIndex:a3];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  int v12 = v7 & 0xFC00;
  if (v10 == 2 && v8 == a3 && v12 == 55296 && ([a1 characterAtIndex:a3 + 1] & 0xFC00) == 0xDC00)
  {
    int v13 = [a1 characterAtIndex:a3 + 1] + (v7 << 10);
LABEL_12:
    uint64_t v7 = (v13 - 56613888);
    goto LABEL_19;
  }
  if (a3 && v11 == 2)
  {
    if (v9 == a3 - 1 && ([a1 characterAtIndex:v9] & 0xFC00) == 0xD800 && v12 == 56320)
    {
      int v13 = v7 + ([a1 characterAtIndex:v9] << 10);
      goto LABEL_12;
    }
  }
  else if (v11 != 2)
  {
    goto LABEL_19;
  }
  if (v9 == a3)
  {
    uint64_t v7 = [a1 characterAtIndex:a3 + 1] | (v7 << 16);
  }
  else if (a3 && v9 == a3 - 1)
  {
    uint64_t v7 = v7 | ([a1 characterAtIndex:v9] << 16);
  }
LABEL_19:
  if (a4) {
    *a4 = v11;
  }
  return v7;
}

- (id)stringByTruncatingToWordAtIndex:()SCRCStringExtras addElipses:
{
  if ([a1 length] <= (unint64_t)(a3 + 1))
  {
    id v15 = a1;
  }
  else
  {
    uint64_t v7 = [a1 substringToIndex:a3 + 2];
    uint64_t v8 = [v7 rangeOfString:@" " options:4];
    if (v9)
    {
      uint64_t v10 = [v7 substringToIndex:v8];
      uint64_t v11 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      int v12 = [v10 stringByTrimmingCharactersInSet:v11];

      if ([v12 length])
      {
        id v13 = v12;

        uint64_t v7 = v13;
      }
    }
    if (a4)
    {
      id v14 = [NSString stringWithFormat:@"%@%C", v7, 8230];
    }
    else
    {
      id v14 = v7;
    }
    id v15 = v14;
  }
  return v15;
}

- (id)stringByReplacingCharactersInSet:()SCRCStringExtras withString:
{
  id v6 = a3;
  uint64_t v7 = a4;
  if ([a1 rangeOfCharacterFromSet:v6 options:2] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = a1;
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x263F089D8]);
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F08B08]) initWithString:a1];
    if (([v10 isAtEnd] & 1) == 0)
    {
      id v11 = 0;
      if (v7) {
        int v12 = v7;
      }
      else {
        int v12 = &stru_26CC25790;
      }
      while (1)
      {
        id v13 = v11;
        id v16 = v11;
        int v14 = [v10 scanUpToCharactersFromSet:v6 intoString:&v16];
        id v11 = v16;

        if (v14) {
          [v9 appendString:v11];
        }
        if ([v10 isAtEnd]) {
          break;
        }
        [v10 scanCharactersFromSet:v6 intoString:0];
        if ([v10 isAtEnd]) {
          break;
        }
        [v9 appendString:v12];
      }
    }
    id v8 = (id)[v9 copy];
  }
  return v8;
}

- (id)scrStringByTrimmingTrailingNewlines
{
  v1 = (void *)[a1 mutableCopy];
  uint64_t v2 = [v1 length];
  v3 = [MEMORY[0x263F08708] newlineCharacterSet];
  if (v2 >= 1)
  {
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = [v1 rangeOfCharacterFromSet:v3 options:4];
      BOOL v7 = v5 == v2 - 1 && v6 == 1;
      int v8 = v7;
      if (v7) {
        objc_msgSend(v1, "replaceCharactersInRange:withString:", v5, v6, &stru_26CC25790);
      }
      uint64_t v9 = [v1 length];
      if (v9 > 0) {
        int v10 = v8;
      }
      else {
        int v10 = 0;
      }
      if (v10 != 1) {
        break;
      }
      uint64_t v2 = v9;
    }
    while (v4++ < 0x64);
  }
  int v12 = (void *)[v1 copy];

  return v12;
}

- (id)stringByTrimmingEmptySpaceEdges
{
  if ([a1 length])
  {
    uint64_t v2 = (__CFString *)[a1 mutableCopy];
    CFStringTrimWhitespace(v2);
    id v3 = (id)[(__CFString *)v2 copy];
  }
  else
  {
    id v3 = a1;
  }
  return v3;
}

- (uint64_t)hasMultipleWordsWithLocaleName:()SCRCStringExtras ignorePunctuation:
{
  if ((unint64_t)[a1 length] > 0x18) {
    return 1;
  }
  id v6 = [a1 stringByTrimmingEmptySpaceEdges];
  BOOL v7 = (const char *)[v6 UTF8String];

  if (!v7) {
    return 0;
  }
  size_t v8 = strlen(v7);
  uint64_t v9 = (UChar *)malloc_type_malloc(2 * v8 + 2, 0x1000040BDFB0063uLL);
  if (!v9) {
    return 0;
  }
  int v10 = v9;
  u_uastrcpy(v9, v7);
  u_strlen(v10);
  uint64_t v11 = 0;
  if (ubrk_open())
  {
    ubrk_first();
    if (ubrk_next() == -1)
    {
      uint64_t v11 = 0;
    }
    else
    {
      int v12 = ubrk_next();
      int v13 = v12;
      int v14 = 1;
      if (a4)
      {
        int v15 = v12 - 1;
        if (v12 >= 1)
        {
          id v16 = [MEMORY[0x263F08708] punctuationCharacterSet];
          int v17 = [v16 characterIsMember:(unsigned __int16)v7[v15]];

          int v14 = v17 ^ 1;
        }
      }
      if (v13 == -1) {
        int v18 = 0;
      }
      else {
        int v18 = a4;
      }
      uint64_t v11 = v18 & v14;
    }
    ubrk_close();
  }
  free(v10);
  return v11;
}

- (uint64_t)enclosingSentenceRangeForRange:()SCRCStringExtras
{
  id v7 = [NSString localizedNameOfStringEncoding:1];
  [v7 UTF8String];

  uint64_t v8 = [a1 length];
  if (SCRCIsInt32BitSafe(v8))
  {
    [MEMORY[0x263EFF940] raise:@"ScreenReaderCore" format:@"64-bit percision error"];
    return 0;
  }
  int v10 = malloc_type_malloc(2 * v8, 0x1000040BDFB0063uLL);
  if (!v10)
  {
    if (SCRCLogMaskError) {
      NSLog(&cfstr_MallocFailed.isa);
    }
    return 0;
  }
  uint64_t v11 = v10;
  [a1 getCharacters:v10];
  if (ubrk_open())
  {
    int v12 = ubrk_first();
    int v13 = ubrk_next();
    unint64_t v14 = a3 + a4;
    unint64_t v15 = v13;
    if (v13 != -1 && v14 > v13)
    {
      do
      {
        if (a3 > v15) {
          int v12 = v13;
        }
        int v13 = ubrk_next();
        if (v13 == -1) {
          break;
        }
        unint64_t v15 = v13;
      }
      while (v14 > v13);
    }
    uint64_t v9 = v12;
    ubrk_close();
  }
  else
  {
    if (SCRCLogMaskError) {
      NSLog(&cfstr_NoSentenceBoun.isa);
    }
    uint64_t v9 = 0;
  }
  free(v11);
  return v9;
}

- (unint64_t)sentenceBreakInDirection:()SCRCStringExtras fromIndex:skipCurrent:
{
  int v27 = 0;
  id v9 = [NSString localizedNameOfStringEncoding:4];
  [v9 UTF8String];

  unint64_t v10 = [a1 length];
  if (SCRCIsInt32BitSafe(v10))
  {
    [MEMORY[0x263EFF940] raise:@"ScreenReaderCore" format:@"64-bit percision error"];
  }
  else if (v10 > a4)
  {
    unint64_t v26 = v10 - a4;
    uint64_t v11 = SCRCCopyStringToUniCharArray((const __CFString *)[a1 substringFromIndex:a4], &v26);
    if (v11)
    {
      int v12 = v11;
      if (ubrk_open() && v27 <= 0)
      {
        if (a3)
        {
          int v13 = ubrk_first();
          int v14 = ubrk_next();
          if (v14 == -1)
          {
            unint64_t v18 = 0;
          }
          else
          {
            int v15 = v14;
            if (a5)
            {
              unsigned int v16 = ubrk_next();
              unint64_t v17 = v15;
              if (v26 < v16) {
                unint64_t v17 = a4;
              }
              if (v16 == -1) {
                unint64_t v18 = v15;
              }
              else {
                unint64_t v18 = v17;
              }
            }
            else
            {
              unint64_t v18 = v13;
            }
          }
        }
        else
        {
          int v20 = ubrk_last();
          int v21 = ubrk_previous();
          int v22 = v21;
          if (a5)
          {
            int v23 = v20 - v21;
            if (v26 != v20 - v21)
            {
              if (v23 < 0) {
                int v23 = v21 - v20;
              }
              if (v23 <= 3) {
                ubrk_previous();
              }
              int v24 = ubrk_previous();
              if (v24 == -1) {
                int v25 = 0;
              }
              else {
                int v25 = v24;
              }
              int v22 = v25;
            }
          }
          unint64_t v18 = v22;
        }
        ubrk_close();
      }
      else
      {
        if (SCRCLogMaskError) {
          NSLog(&cfstr_NoSentenceBoun.isa);
        }
        unint64_t v18 = a4;
      }
      a4 += v18;
      free(v12);
    }
  }
  return a4;
}

- (uint64_t)fourCharCodeValue
{
  if ([a1 length] != 4) {
    return 0;
  }
  uint64_t v2 = 0;
  LODWORD(v3) = 0;
  int v4 = 24;
  do
  {
    uint64_t v3 = ([a1 characterAtIndex:v2++] << v4) + (int)v3;
    v4 -= 8;
  }
  while (v2 != 4);
  return v3;
}

- (id)contentsOfEmbeddedCommand:()SCRCStringExtras
{
  id v21 = a3;
  int v4 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"@%@("), v21;
  CFIndex Length = CFStringGetLength(v4);
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  CFIndex v7 = CFStringGetLength(a1);
  result.CFIndex location = 0;
  result.length = 0;
  if (v7 >= 1)
  {
    CFIndex v8 = v7;
    CFIndex v9 = 0;
    do
    {
      v25.length = v8 - v9;
      v25.CFIndex location = v9;
      if (CFStringFindWithOptions(a1, v4, v25, 1uLL, &result) != 1) {
        break;
      }
      CFIndex location = result.location;
      if (result.location
        && (v26.CFIndex location = result.location - 1,
            v26.length = 1,
            int v11 = CFStringFindWithOptions(a1, @"\\"", v26, 1uLL, 0),
            CFIndex location = result.location,
            v11))
      {
        CFIndex v9 = result.length + result.location;
      }
      else
      {
        CFIndex v12 = result.length + location;
        CFIndex MatchingParen = _findMatchingParen(a1, 1, result.length + location, v8);
        if (MatchingParen == -1) {
          break;
        }
        CFIndex v14 = MatchingParen;
        CFIndex v15 = MatchingParen - v12;
        v27.CFIndex location = v12;
        v27.length = MatchingParen - v12;
        CFStringRef v16 = CFStringCreateWithSubstring(0, a1, v27);
        if (v16)
        {
          CFStringRef v17 = v16;
          [v5 addObject:v16];
          unint64_t v18 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithRange:", v12 - Length, Length + 1 + v15);
          [v6 addObject:v18];

          CFIndex v9 = v14 + 1;
          CFRelease(v17);
        }
      }
    }
    while (v9 < v8);
  }
  v19 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v5, @"commands", v6, @"ranges", 0);

  return v19;
}

- (BOOL)containsAttachmentCharSet
{
  if (!containsAttachmentCharSet_ReservedCharSet)
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x263F08708], "characterSetWithRange:", 65532, 2);
    uint64_t v3 = (void *)containsAttachmentCharSet_ReservedCharSet;
    containsAttachmentCharSet_ReservedCharSet = v2;
  }
  objc_msgSend(a1, "rangeOfCharacterFromSet:");
  return v4 != 0;
}

- (uint64_t)nextWordFromPosition:()SCRCStringExtras
{
  uint64_t v5 = [a1 length];
  uint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if ((a3 & 0x8000000000000000) == 0 && v5 > a3)
  {
    if (v5 - 1 != a3)
    {
      CFIndex v7 = [MEMORY[0x263F08708] wordBreakCharacterSet];
      while (objc_msgSend(v7, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", a3)))
      {
        if (v5 == ++a3)
        {
          a3 = v5;
          goto LABEL_11;
        }
      }
      uint64_t v8 = a3;
      if (a3 < v5)
      {
        do
        {
          if (objc_msgSend(v7, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v8))) {
            break;
          }
          ++v8;
        }
        while (v5 != v8);
      }
LABEL_11:
    }
    return a3;
  }
  return result;
}

- (uint64_t)previousWordFromPosition:()SCRCStringExtras
{
  uint64_t v5 = [a1 length];
  if (a3 < 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v5 <= a3)
  {
    a3 = v5 - 1;
LABEL_7:
    CFIndex v7 = [MEMORY[0x263F08708] wordBreakCharacterSet];
    if (a3 < 1)
    {
      uint64_t v9 = a3;
      if (a3 < 0)
      {
LABEL_19:
        uint64_t v6 = v9 + 1;

        return v6;
      }
LABEL_13:
      a3 = 0;
    }
    else
    {
      while (objc_msgSend(v7, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", a3)))
      {
        BOOL v8 = a3-- <= 1;
        if (v8) {
          goto LABEL_13;
        }
      }
    }
    uint64_t v9 = a3;
    while ((objc_msgSend(v7, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v9)) & 1) == 0)
    {
      BOOL v8 = v9-- <= 0;
      if (v8)
      {
        uint64_t v9 = -1;
        goto LABEL_19;
      }
    }
    goto LABEL_19;
  }
  if (a3) {
    goto LABEL_7;
  }
  return 0;
}

- (id)stringByTrimmingLeadingCharactersInSet:()SCRCStringExtras
{
  id v4 = a3;
  for (unint64_t i = 0; i < [a1 length]; ++i)
  {
    if (!objc_msgSend(v4, "longCharacterIsMember:", objc_msgSend(a1, "character32AtIndex:returningNumberOfComposedChars:", i, 0)))break; {
  }
    }
  uint64_t v6 = [a1 substringFromIndex:i];

  return v6;
}

- (id)stringByTrimmingTrailingCharactersInSet:()SCRCStringExtras
{
  id v4 = a3;
  uint64_t v5 = [a1 length];
  do
  {
    uint64_t v6 = v5;
    if (!v5) {
      break;
    }
    --v5;
  }
  while ((objc_msgSend(v4, "longCharacterIsMember:", objc_msgSend(a1, "character32AtIndex:returningNumberOfComposedChars:", v6 - 1, 0)) & 1) != 0);
  CFIndex v7 = [a1 substringToIndex:v6];

  return v7;
}

- (void)enumerateCharacter32sInRange:()SCRCStringExtras block:
{
  BOOL v8 = a5;
  if (a3 >= [a1 length] || (NSUInteger v9 = a3 + a4, a3 + a4 > objc_msgSend(a1, "length")))
  {
    CFIndex v12 = (void *)MEMORY[0x263EFF940];
    int v13 = NSString;
    v19.CFIndex location = a3;
    v19.length = a4;
    CFIndex v14 = NSStringFromRange(v19);
    CFIndex v15 = [v13 stringWithFormat:@"The range, %@, extends beyond the bounds of the receiver: %lu", v14, objc_msgSend(a1, "length")];
    id v16 = [v12 exceptionWithName:@"SCRCInvalidRangeException" reason:v15 userInfo:0];

    objc_exception_throw(v16);
  }
  char v18 = 0;
  if (a3 < v9)
  {
    do
    {
      uint64_t v17 = 1;
      uint64_t v10 = [a1 character32AtIndex:a3 returningNumberOfComposedChars:&v17];
      v8[2](v8, v10, a3, v17, &v18);
      a3 += v17;
      if (v18) {
        BOOL v11 = 1;
      }
      else {
        BOOL v11 = a3 >= v9;
      }
    }
    while (!v11);
  }
}

@end