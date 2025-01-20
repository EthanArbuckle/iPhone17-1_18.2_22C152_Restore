@interface NSString(TSWPAdditions)
+ (__CFString)stringForValue:()TSWPAdditions withListNumberFormat:includeFormatting:;
+ (uint64_t)stringForValue:()TSWPAdditions withListNumberFormat:;
+ (uint64_t)stringForValue:()TSWPAdditions withPageNumberFormat:;
+ (unint64_t)numberForString:()TSWPAdditions withListNumberFormat:;
+ (unint64_t)numberForString:()TSWPAdditions withPageNumberFormat:;
- (BOOL)isAllWhitespaceInRange:()TSWPAdditions;
- (CFIndex)rangeOfWordAtCharacterIndex:()TSWPAdditions range:includePreviousWord:;
- (__CFString)replaceOccurrencesOfCharactersInSet:()TSWPAdditions minimumConsecutiveLength:replaceString:;
- (__CFString)stringByNormalizingParagraphBreaks;
- (uint64_t)contentsScript;
- (uint64_t)contentsScriptInRange:()TSWPAdditions;
- (uint64_t)findIndexOfCharacter:()TSWPAdditions range:;
- (uint64_t)rangeOfCharactersFromSet:()TSWPAdditions index:;
- (uint64_t)utf32CharacterAtIndex:()TSWPAdditions;
@end

@implementation NSString(TSWPAdditions)

- (__CFString)stringByNormalizingParagraphBreaks
{
  v1 = a1;
  uint64_t v2 = [(__CFString *)a1 length];
  v32 = v1;
  uint64_t v35 = 0;
  uint64_t v36 = v2;
  CharactersPtr = CFStringGetCharactersPtr(v1);
  CStringPtr = 0;
  v33 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
  }
  v34 = CStringPtr;
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  if (v2 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    v7 = 0;
    v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 64;
    while (1)
    {
      uint64_t v11 = (unint64_t)v9 >= 3 ? 3 : v9;
      uint64_t v12 = (unint64_t)v9 >= 4 ? 4 : v9;
      if (v36 > v9)
      {
        if (v33)
        {
          UniChar v13 = v33[v9 + v35];
        }
        else if (v34)
        {
          UniChar v13 = v34[v35 + v9];
        }
        else
        {
          if (v38 <= v9 || v6 > v9)
          {
            uint64_t v14 = -v12;
            uint64_t v15 = v12 + v5;
            uint64_t v16 = v10 - v12;
            uint64_t v17 = v9 + v14;
            uint64_t v18 = v17 + 64;
            if (v17 + 64 >= v36) {
              uint64_t v18 = v36;
            }
            uint64_t v37 = v17;
            uint64_t v38 = v18;
            v19.location = v17 + v35;
            if (v36 >= v16) {
              uint64_t v20 = v16;
            }
            else {
              uint64_t v20 = v36;
            }
            v19.length = v20 + v15;
            CFStringGetCharacters(v32, v19, buffer);
            uint64_t v6 = v37;
          }
          UniChar v13 = buffer[v9 - v6];
        }
        if (v13 == 8233) {
          goto LABEL_32;
        }
        if (v13 == 13) {
          break;
        }
      }
LABEL_37:
      ++v9;
      --v5;
      ++v10;
      if (v9 >= v2) {
        goto LABEL_57;
      }
    }
    uint64_t v21 = v9 + 1;
    if (v9 + 1 >= v2 || v36 <= v21)
    {
LABEL_32:
      uint64_t v24 = 1;
      if (!v8) {
        goto LABEL_45;
      }
      goto LABEL_33;
    }
    if (v33)
    {
      v22 = (UniChar *)&v33[v9 + v35];
    }
    else
    {
      if (v34)
      {
        UniChar v23 = v34[v35 + 1 + v9];
LABEL_41:
        if (v23 == 10) {
          uint64_t v24 = 2;
        }
        else {
          uint64_t v24 = 1;
        }
        if (!v8)
        {
LABEL_45:
          v8 = (__CFString *)(id)[(__CFString *)v1 mutableCopyWithZone:0];
          v1 = v8;
          if (!v7) {
            goto LABEL_46;
          }
          goto LABEL_34;
        }
LABEL_33:
        if (!v7)
        {
LABEL_46:
          __int16 v30 = 10;
          v7 = (void *)[[NSString alloc] initWithCharactersNoCopy:&v30 length:1 freeWhenDone:0];
        }
LABEL_34:
        -[__CFString replaceCharactersInRange:withString:](v8, "replaceCharactersInRange:withString:", v9, v24, v7);
        uint64_t v2 = [(__CFString *)v1 length];
        v32 = v1;
        uint64_t v35 = 0;
        uint64_t v36 = v2;
        v25 = CFStringGetCharactersPtr(v1);
        v26 = 0;
        v33 = v25;
        if (!v25) {
          v26 = CFStringGetCStringPtr(v1, 0x600u);
        }
        uint64_t v6 = 0;
        v34 = v26;
        uint64_t v37 = 0;
        uint64_t v38 = 0;
        goto LABEL_37;
      }
      if (v38 <= v21 || v6 > v21)
      {
        uint64_t v27 = v9 - v11 + 64;
        if (v27 >= v36) {
          uint64_t v27 = v36;
        }
        uint64_t v37 = v9 - v11;
        uint64_t v38 = v27;
        if (v36 >= v10 - v11) {
          uint64_t v28 = v10 - v11;
        }
        else {
          uint64_t v28 = v36;
        }
        v39.length = v28 + v11 + v5;
        v39.location = v9 - v11 + v35;
        CFStringGetCharacters(v32, v39, buffer);
        uint64_t v6 = v37;
      }
      v22 = &buffer[v9 - v6];
    }
    UniChar v23 = v22[1];
    goto LABEL_41;
  }
  v7 = 0;
LABEL_57:

  return v1;
}

- (uint64_t)findIndexOfCharacter:()TSWPAdditions range:
{
  v34.NSUInteger length = [(__CFString *)a1 length];
  v33.location = a4;
  v33.NSUInteger length = a5;
  v34.location = 0;
  NSRange v9 = NSIntersectionRange(v33, v34);
  if (!v9.length) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  CFStringRef theString = a1;
  NSRange v30 = v9;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  uint64_t v10 = CharactersPtr ? 0 : CFStringGetCStringPtr(a1, 0x600u);
  uint64_t v31 = 0;
  int64_t v32 = 0;
  v29 = v10;
  if ((uint64_t)v9.length < 1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  for (uint64_t i = 64; ; ++i)
  {
    uint64_t v15 = (unint64_t)v13 >= 4 ? 4 : v13;
    if ((uint64_t)v30.length <= v13)
    {
      UniChar v16 = 0;
    }
    else if (CharactersPtr)
    {
      UniChar v16 = CharactersPtr[v13 + v30.location];
    }
    else if (v29)
    {
      UniChar v16 = v29[v30.location + v13];
    }
    else
    {
      if (v32 <= v13 || v12 > v13)
      {
        uint64_t v18 = -v15;
        uint64_t v19 = v15 + v11;
        uint64_t v20 = i - v15;
        uint64_t v21 = v13 + v18;
        NSUInteger length = v21 + 64;
        if (v21 + 64 >= (uint64_t)v30.length) {
          NSUInteger length = v30.length;
        }
        uint64_t v31 = v21;
        int64_t v32 = length;
        v23.location = v21 + v30.location;
        if ((uint64_t)v30.length >= v20) {
          NSUInteger v24 = v20;
        }
        else {
          NSUInteger v24 = v30.length;
        }
        v23.NSUInteger length = v24 + v19;
        CFStringGetCharacters(theString, v23, buffer);
        uint64_t v12 = v31;
      }
      UniChar v16 = buffer[v13 - v12];
    }
    if (a3 == v16) {
      break;
    }
    ++v13;
    --v11;
    if (v9.length == v13) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v9.location + v13;
}

- (uint64_t)rangeOfCharactersFromSet:()TSWPAdditions index:
{
  unint64_t v7 = [a1 length];
  uint64_t v8 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", a3, 0, a4, v7 - a4);
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = a4 + 1;
    if (a4 + 1 < v7)
    {
      do
      {
        if (!objc_msgSend(a3, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v11))) {
          break;
        }
        ++v10;
        ++v11;
      }
      while (v7 != v11);
    }
  }
  return v8;
}

- (CFIndex)rangeOfWordAtCharacterIndex:()TSWPAdditions range:includePreviousWord:
{
  CFIndex v11 = *MEMORY[0x263F7C7C8];
  unint64_t v12 = [(__CFString *)a1 length];
  unint64_t v13 = a4 + a5;
  if (a3 < a4 || a3 - a4 >= a5)
  {
    if (v12 >= v13)
    {
      if (v13 == a3) {
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v21 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v22 = [NSString stringWithUTF8String:"-[NSString(TSWPAdditions) rangeOfWordAtCharacterIndex:range:includePreviousWord:]"];
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/NSStringAdditions.mm"), 1067, @"Specified range is out of range of string");
      if (v13 == a3) {
        return v11;
      }
    }
    uint64_t v25 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v26 = [NSString stringWithUTF8String:"-[NSString(TSWPAdditions) rangeOfWordAtCharacterIndex:range:includePreviousWord:]"];
    uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/NSStringAdditions.mm"];
    uint64_t v17 = @"Character index out of range";
    uint64_t v18 = (void *)v25;
    uint64_t v19 = v26;
    uint64_t v20 = 1068;
    goto LABEL_14;
  }
  if (v12 < v13)
  {
    uint64_t v14 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v15 = [NSString stringWithUTF8String:"-[NSString(TSWPAdditions) rangeOfWordAtCharacterIndex:range:includePreviousWord:]"];
    uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/NSStringAdditions.mm"];
    uint64_t v17 = @"Specified range is out of range of string";
    uint64_t v18 = (void *)v14;
    uint64_t v19 = v15;
    uint64_t v20 = 1067;
LABEL_14:
    [v18 handleFailureInFunction:v19 file:v16 lineNumber:v20 description:v17];
    return v11;
  }
LABEL_9:
  if (CFStringGetLength(a1) <= a3)
  {
    int v24 = 0;
  }
  else
  {
    uint64_t CharacterAtIndex = CFStringGetCharacterAtIndex(a1, a3);
    int v24 = 0;
    if (CharacterAtIndex && v13 > a3) {
      int v24 = IsWhitespaceCharacter(CharacterAtIndex) ^ 1;
    }
  }
  if (a6)
  {
    if (a3 > a4)
    {
      uint64_t v28 = CFStringGetCharacterAtIndex(a1, a3 - 1);
      int v29 = IsWhitespaceCharacter(v28);
      v24 |= v29 ^ 1;
      if (!v29) {
        --a3;
      }
    }
  }
  if (v24)
  {
    if (a5)
    {
      v36.CFIndex location = a4;
      v36.CFIndex length = a5;
      NSRange v30 = CFStringTokenizerCreate(0, a1, v36, 4uLL, 0);
      if (v30)
      {
        uint64_t v31 = v30;
        CFStringTokenizerTokenType v32 = CFStringTokenizerGoToTokenAtIndex(v30, a3);
        CFIndex length = 0;
        CFIndex location = -1;
        if (v32 && (v32 & 0x10) == 0)
        {
          CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v31);
          CFIndex length = CurrentTokenRange.length;
          CFIndex location = CurrentTokenRange.location;
        }
        if (location != -1 && length != 0) {
          CFIndex v11 = location;
        }
        CFRelease(v31);
      }
    }
  }
  return v11;
}

- (BOOL)isAllWhitespaceInRange:()TSWPAdditions
{
  v33.NSUInteger length = [(__CFString *)a1 length];
  v31.CFIndex location = a3;
  v31.NSUInteger length = a4;
  v33.CFIndex location = 0;
  NSRange v7 = NSIntersectionRange(v31, v33);
  if (v7.length)
  {
    CFStringRef theString = a1;
    NSRange v28 = v7;
    CharactersPtr = CFStringGetCharactersPtr(a1);
    if (CharactersPtr) {
      CStringPtr = 0;
    }
    else {
      CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
    }
    uint64_t v29 = 0;
    int64_t v30 = 0;
    uint64_t v27 = CStringPtr;
    if ((uint64_t)v7.length < 1)
    {
      return 1;
    }
    else
    {
      uint64_t v10 = 0;
      BOOL v9 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = 64;
      do
      {
        if ((unint64_t)v11 >= 4) {
          uint64_t v13 = 4;
        }
        else {
          uint64_t v13 = v11;
        }
        NSUInteger length = v28.length;
        if ((uint64_t)v28.length <= v11)
        {
          UniChar v15 = 0;
        }
        else if (CharactersPtr)
        {
          UniChar v15 = CharactersPtr[v11 + v28.location];
        }
        else if (v27)
        {
          UniChar v15 = v27[v28.location + v11];
        }
        else
        {
          uint64_t v16 = v29;
          if (v30 <= v11 || v29 > v11)
          {
            uint64_t v18 = -v13;
            uint64_t v19 = v13 + v10;
            uint64_t v20 = v12 - v13;
            uint64_t v21 = v11 + v18;
            NSUInteger v22 = v21 + 64;
            if (v21 + 64 >= (uint64_t)v28.length) {
              NSUInteger v22 = v28.length;
            }
            uint64_t v29 = v21;
            int64_t v30 = v22;
            if ((uint64_t)v28.length >= v20) {
              NSUInteger length = v20;
            }
            v32.NSUInteger length = length + v19;
            v32.CFIndex location = v21 + v28.location;
            CFStringGetCharacters(theString, v32, buffer);
            uint64_t v16 = v29;
          }
          UniChar v15 = buffer[v11 - v16];
        }
        if ((IsWhitespaceCharacter(v15) & 1) == 0) {
          break;
        }
        BOOL v9 = ++v11 >= (int64_t)v7.length;
        --v10;
        ++v12;
      }
      while (v7.length != v11);
    }
  }
  else
  {
    return 0;
  }
  return v9;
}

- (__CFString)replaceOccurrencesOfCharactersInSet:()TSWPAdditions minimumConsecutiveLength:replaceString:
{
  if (!a5)
  {
    BOOL v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[NSString(TSWPAdditions) replaceOccurrencesOfCharactersInSet:minimumConsecutiveLength:replaceString:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/NSStringAdditions.mm"), 1152, @"invalid nil value for '%s'", "replaceString");
  }
  v56 = 0;
  v57 = 0;
  v58 = 0;
  unint64_t v11 = [(__CFString *)a1 length];
  CFStringRef theString = a1;
  range.CFIndex location = 0;
  range.CFIndex length = v11;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  if (CharactersPtr) {
    CStringPtr = 0;
  }
  else {
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  }
  uint64_t v54 = 0;
  CFIndex length = 0;
  v52 = CStringPtr;
  if (v11 && range.length >= 1)
  {
    if (CharactersPtr)
    {
      UniChar v13 = CharactersPtr[range.location];
    }
    else if (CStringPtr)
    {
      UniChar v13 = CStringPtr[range.location];
    }
    else
    {
      if (range.length >= 0x40uLL) {
        v46.CFIndex length = 64;
      }
      else {
        v46.CFIndex length = range.length;
      }
      CFIndex length = v46.length;
      v46.CFIndex location = range.location;
      CFStringGetCharacters(theString, v46, buffer);
      UniChar v13 = buffer[-v54];
    }
  }
  else
  {
    UniChar v13 = 0;
  }
  BOOL v14 = CFCharacterSetIsCharacterMember(a3, v13) != 0;
  if (v11 < 2 || range.length < 2)
  {
    UniChar v15 = 0;
  }
  else if (CharactersPtr)
  {
    UniChar v15 = CharactersPtr[range.location + 1];
  }
  else if (v52)
  {
    UniChar v15 = v52[range.location + 1];
  }
  else
  {
    if (length < 2 || (uint64_t v47 = v54, v54 >= 2))
    {
      if (range.length >= 0x40uLL) {
        v48.CFIndex length = 64;
      }
      else {
        v48.CFIndex length = range.length;
      }
      uint64_t v54 = 0;
      CFIndex length = v48.length;
      v48.CFIndex location = range.location;
      CFStringGetCharacters(theString, v48, buffer);
      uint64_t v47 = v54;
    }
    UniChar v15 = buffer[1 - v47];
  }
  int IsCharacterMember = CFCharacterSetIsCharacterMember(a3, v15);
  if (v11)
  {
    unint64_t v17 = 0;
    unint64_t v18 = 0;
    BOOL v19 = IsCharacterMember != 0;
    unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      if (v14)
      {
        if (v17 < v20) {
          unint64_t v20 = v17;
        }
        ++v18;
        if (!v19)
        {
          if (v18 >= a4)
          {
            uint64_t v21 = v57;
            if (v57 >= v58)
            {
              CFRange v23 = v56;
              uint64_t v24 = ((char *)v57 - (char *)v56) >> 4;
              unint64_t v25 = v24 + 1;
              if ((unint64_t)(v24 + 1) >> 60) {
                abort();
              }
              uint64_t v26 = (char *)v58 - (char *)v56;
              if (v58 - v56 > v25) {
                unint64_t v25 = v26 >> 3;
              }
              if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v27 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v27 = v25;
              }
              if (v27)
              {
                NSRange v28 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)&v58, v27);
                CFRange v23 = v56;
                uint64_t v21 = v57;
              }
              else
              {
                NSRange v28 = 0;
              }
              uint64_t v29 = (unint64_t *)&v28[16 * v24];
              unint64_t *v29 = v20;
              v29[1] = v18;
              int64_t v30 = v29;
              if (v21 != v23)
              {
                do
                {
                  *((_OWORD *)v30 - 1) = *((_OWORD *)v21 - 1);
                  v30 -= 2;
                  v21 -= 2;
                }
                while (v21 != v23);
                CFRange v23 = v56;
              }
              NSUInteger v22 = v29 + 2;
              v56 = v30;
              v57 = v29 + 2;
              v58 = (unint64_t *)&v28[16 * v27];
              if (v23) {
                operator delete(v23);
              }
            }
            else
            {
              unint64_t *v57 = v20;
              v21[1] = v18;
              NSUInteger v22 = v21 + 2;
            }
            unint64_t v18 = 0;
            v57 = v22;
          }
          else
          {
            unint64_t v18 = 0;
          }
          unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      if (v17 < v11 - 2) {
        break;
      }
      BOOL v36 = 0;
LABEL_51:
      ++v17;
      BOOL v14 = v19;
      BOOL v19 = v36;
      if (v17 == v11) {
        goto LABEL_63;
      }
    }
    int64_t v31 = v17 + 2;
    if ((uint64_t)(v17 + 2) < 0 || (CFIndex v32 = range.length, range.length <= v31))
    {
      UniChar v35 = 0;
    }
    else
    {
      NSRange v33 = (UniChar *)CharactersPtr;
      if (CharactersPtr)
      {
        CFIndex v34 = range.location + v31;
      }
      else
      {
        if (v52)
        {
          UniChar v35 = v52[range.location + v31];
          goto LABEL_50;
        }
        if (length <= v31 || (uint64_t v37 = v54, v54 > v31))
        {
          uint64_t v38 = v17 - 2;
          if ((unint64_t)v31 < 4) {
            uint64_t v38 = 0;
          }
          if (v38 + 64 < range.length) {
            CFIndex v32 = v38 + 64;
          }
          uint64_t v54 = v38;
          CFIndex length = v32;
          v59.CFIndex location = range.location + v38;
          v59.CFIndex length = v32 - v38;
          CFStringGetCharacters(theString, v59, buffer);
          uint64_t v37 = v54;
        }
        CFIndex v34 = v31 - v37;
        NSRange v33 = buffer;
      }
      UniChar v35 = v33[v34];
    }
LABEL_50:
    BOOL v36 = CFCharacterSetIsCharacterMember(a3, v35) != 0;
    goto LABEL_51;
  }
LABEL_63:
  if (v57 == v56)
  {
    v43 = a1;
  }
  else
  {
    CFRange v39 = (void *)[(__CFString *)a1 mutableCopy];
    for (uint64_t i = v57; i != v56; i -= 2)
    {
      uint64_t v41 = *(i - 2);
      uint64_t v42 = *(i - 1);
      objc_msgSend(v39, "replaceCharactersInRange:withString:", v41, v42, a5);
    }
    v43 = v39;
  }
  v44 = v43;
  if (v56)
  {
    v57 = v56;
    operator delete(v56);
  }
  return v44;
}

+ (unint64_t)numberForString:()TSWPAdditions withListNumberFormat:
{
  if (![a3 length]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v6 = objc_msgSend(a3, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x263F08708], "whitespaceCharacterSet"));
  id v7 = (id)+[NSString(TSWPAdditions) numberForString:withListNumberFormat:]::sformattingCharacterSet;
  if (!+[NSString(TSWPAdditions) numberForString:withListNumberFormat:]::sformattingCharacterSet)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F089C0]);
    objc_msgSend(v7, "addCharactersInString:", objc_msgSend(NSString, "stringWithCharacters:length:", +[NSString(TSWPAdditions) numberForString:withListNumberFormat:]::sFormattingChars, 3));
    +[NSString(TSWPAdditions) numberForString:withListNumberFormat:]::sformattingCharacterSet = (uint64_t)v7;
  }
  if ((int)a4 >= 3) {
    uint64_t v6 = objc_msgSend(v6, "tsu_stringByRemovingCharactersInSet:", v7);
  }
  if ((unint64_t)[v6 length] >= 0x65) {
    uint64_t v6 = objc_msgSend(v6, "substringWithRange:", 0, 100);
  }
  switch((int)a4)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      uint64_t v10 = (_anonymous_namespace_ *)v6;
      goto LABEL_15;
    case 6:
    case 7:
    case 8:
      uint64_t v10 = (_anonymous_namespace_ *)[v6 uppercaseString];
LABEL_15:
    case 9:
    case 10:
    case 11:
      unint64_t v11 = (_anonymous_namespace_ *)v6;
      goto LABEL_19;
    case 12:
    case 13:
    case 14:
      unint64_t v11 = (_anonymous_namespace_ *)[v6 uppercaseString];
LABEL_19:
      break;
    default:
      uint64_t v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v13 = [NSString stringWithUTF8String:"+[NSString(TSWPAdditions) numberForString:withListNumberFormat:]"];
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/NSStringAdditions.mm"), 1288, @"Label format (%d) not recognized.", a4);
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

+ (unint64_t)numberForString:()TSWPAdditions withPageNumberFormat:
{
  if (![a3 length]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v6 = objc_msgSend(a3, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x263F08708], "whitespaceCharacterSet"));
  if ((unint64_t)[v6 length] >= 0x65) {
    uint64_t v6 = objc_msgSend(v6, "substringWithRange:", 0, 100);
  }
  switch((int)a4)
  {
    case 0:
    case 1:
      unint64_t v11 = (_anonymous_namespace_ *)v6;
      goto LABEL_12;
    case 2:
      unint64_t v11 = (_anonymous_namespace_ *)[v6 uppercaseString];
LABEL_12:
    case 3:
      uint64_t v12 = (_anonymous_namespace_ *)v6;
      goto LABEL_17;
    case 4:
      uint64_t v12 = (_anonymous_namespace_ *)[v6 uppercaseString];
LABEL_17:
      break;
    default:
      BOOL v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"+[NSString(TSWPAdditions) numberForString:withPageNumberFormat:]"];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/NSStringAdditions.mm"), 1332, @"Number format (%d) not recognized.", a4);
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

+ (uint64_t)stringForValue:()TSWPAdditions withListNumberFormat:
{
  return [NSString stringForValue:a3 withListNumberFormat:a4 includeFormatting:1];
}

+ (__CFString)stringForValue:()TSWPAdditions withListNumberFormat:includeFormatting:
{
  switch((int)a4)
  {
    case 0:
      id v7 = NSString;
      goto LABEL_77;
    case 1:
      BOOL v9 = NSString;
      goto LABEL_80;
    case 2:
      unint64_t v11 = NSString;
      goto LABEL_83;
    case 3:
      id v7 = NSString;
      goto LABEL_77;
    case 4:
      BOOL v9 = NSString;
      goto LABEL_80;
    case 5:
      unint64_t v11 = NSString;
      goto LABEL_83;
    case 6:
      id v7 = NSString;
      goto LABEL_15;
    case 7:
      BOOL v9 = NSString;
      goto LABEL_17;
    case 8:
      unint64_t v11 = NSString;
      goto LABEL_19;
    case 9:
      id v7 = NSString;
      unint64_t v17 = this;
      unint64_t v18 = 26;
      goto LABEL_76;
    case 10:
      BOOL v9 = NSString;
      unint64_t v20 = this;
      unint64_t v21 = 26;
      goto LABEL_79;
    case 11:
      unint64_t v11 = NSString;
      CFRange v23 = this;
      unint64_t v24 = 26;
      goto LABEL_82;
    case 12:
      id v7 = NSString;
LABEL_15:
      uint64_t v8 = [v13 lowercaseString];
      goto LABEL_77;
    case 13:
      BOOL v9 = NSString;
LABEL_17:
      uint64_t v10 = [v14 lowercaseString];
      goto LABEL_80;
    case 14:
      unint64_t v11 = NSString;
LABEL_19:
      uint64_t v12 = [v15 lowercaseString];
      goto LABEL_83;
    case 15:
      id v7 = NSString;
      unint64_t v25 = this;
      unsigned int v26 = 0;
      goto LABEL_51;
    case 16:
      BOOL v9 = NSString;
      unint64_t v27 = this;
      unsigned int v28 = 0;
      goto LABEL_53;
    case 17:
      unint64_t v11 = NSString;
      uint64_t v29 = this;
      unsigned int v30 = 0;
      goto LABEL_55;
    case 18:
      id v7 = NSString;
      CFIndex v32 = this;
      unint64_t v33 = 46;
      goto LABEL_57;
    case 19:
      BOOL v9 = NSString;
      UniChar v35 = this;
      unint64_t v36 = 46;
      goto LABEL_60;
    case 20:
      unint64_t v11 = NSString;
      uint64_t v38 = this;
      unint64_t v39 = 46;
      goto LABEL_63;
    case 21:
      id v7 = NSString;
      CFIndex v32 = this;
      unint64_t v33 = 46;
      goto LABEL_33;
    case 22:
      BOOL v9 = NSString;
      UniChar v35 = this;
      unint64_t v36 = 46;
      goto LABEL_35;
    case 23:
      unint64_t v11 = NSString;
      uint64_t v38 = this;
      unint64_t v39 = 46;
      goto LABEL_37;
    case 24:
      id v7 = NSString;
      CFIndex v32 = this;
      unint64_t v33 = 47;
      goto LABEL_57;
    case 25:
      BOOL v9 = NSString;
      UniChar v35 = this;
      unint64_t v36 = 47;
      goto LABEL_60;
    case 26:
      unint64_t v11 = NSString;
      uint64_t v38 = this;
      unint64_t v39 = 47;
      goto LABEL_63;
    case 27:
      id v7 = NSString;
      CFIndex v32 = this;
      unint64_t v33 = 47;
LABEL_33:
      int v40 = 1;
      goto LABEL_58;
    case 28:
      BOOL v9 = NSString;
      UniChar v35 = this;
      unint64_t v36 = 47;
LABEL_35:
      int v41 = 1;
      goto LABEL_61;
    case 29:
      unint64_t v11 = NSString;
      uint64_t v38 = this;
      unint64_t v39 = 47;
LABEL_37:
      int v42 = 1;
      goto LABEL_64;
    case 30:
      id v7 = NSString;
      unint64_t v25 = this;
      unsigned int v26 = 1;
      goto LABEL_51;
    case 31:
      BOOL v9 = NSString;
      unint64_t v27 = this;
      unsigned int v28 = 1;
      goto LABEL_53;
    case 32:
      unint64_t v11 = NSString;
      uint64_t v29 = this;
      unsigned int v30 = 1;
      goto LABEL_55;
    case 33:
      id v7 = NSString;
      unint64_t v25 = this;
      unsigned int v26 = 2;
      goto LABEL_51;
    case 34:
      BOOL v9 = NSString;
      unint64_t v27 = this;
      unsigned int v28 = 2;
      goto LABEL_53;
    case 35:
      unint64_t v11 = NSString;
      uint64_t v29 = this;
      unsigned int v30 = 2;
      goto LABEL_55;
    case 36:
      id v7 = NSString;
      unint64_t v25 = this;
      unsigned int v26 = 3;
      goto LABEL_51;
    case 37:
      BOOL v9 = NSString;
      unint64_t v27 = this;
      unsigned int v28 = 3;
      goto LABEL_53;
    case 38:
      unint64_t v11 = NSString;
      uint64_t v29 = this;
      unsigned int v30 = 3;
      goto LABEL_55;
    case 39:
      id v7 = NSString;
      unint64_t v25 = this;
      unsigned int v26 = 4;
      goto LABEL_51;
    case 40:
      BOOL v9 = NSString;
      unint64_t v27 = this;
      unsigned int v28 = 4;
      goto LABEL_53;
    case 41:
      unint64_t v11 = NSString;
      uint64_t v29 = this;
      unsigned int v30 = 4;
      goto LABEL_55;
    case 42:
      id v7 = NSString;
      unint64_t v25 = this;
      unsigned int v26 = 5;
LABEL_51:
      goto LABEL_77;
    case 43:
      BOOL v9 = NSString;
      unint64_t v27 = this;
      unsigned int v28 = 5;
LABEL_53:
      goto LABEL_80;
    case 44:
      unint64_t v11 = NSString;
      uint64_t v29 = this;
      unsigned int v30 = 5;
LABEL_55:
      goto LABEL_83;
    case 45:
      id v7 = NSString;
      CFIndex v32 = this;
      unint64_t v33 = 14;
LABEL_57:
      int v40 = 0;
LABEL_58:
      goto LABEL_77;
    case 46:
      BOOL v9 = NSString;
      UniChar v35 = this;
      unint64_t v36 = 14;
LABEL_60:
      int v41 = 0;
LABEL_61:
      goto LABEL_80;
    case 47:
      unint64_t v11 = NSString;
      uint64_t v38 = this;
      unint64_t v39 = 14;
LABEL_63:
      int v42 = 0;
LABEL_64:
      goto LABEL_83;
    case 48:
      v43 = NSString;
      goto LABEL_87;
    case 49:
      id v7 = NSString;
      goto LABEL_77;
    case 50:
      BOOL v9 = NSString;
      goto LABEL_80;
    case 51:
      unint64_t v11 = NSString;
      goto LABEL_83;
    case 52:
      id v7 = NSString;
      unint64_t v17 = this;
      unint64_t v18 = 29;
      goto LABEL_76;
    case 53:
      BOOL v9 = NSString;
      unint64_t v20 = this;
      unint64_t v21 = 29;
      goto LABEL_79;
    case 54:
      unint64_t v11 = NSString;
      CFRange v23 = this;
      unint64_t v24 = 29;
      goto LABEL_82;
    case 55:
      id v7 = NSString;
      goto LABEL_77;
    case 56:
      BOOL v9 = NSString;
      goto LABEL_80;
    case 57:
      unint64_t v11 = NSString;
      goto LABEL_83;
    case 58:
      id v7 = NSString;
      unint64_t v17 = this;
      unint64_t v18 = 22;
LABEL_76:
LABEL_77:
      v45 = (__CFString *)[v7 stringWithFormat:@"%@.", v8];
      goto LABEL_84;
    case 59:
      BOOL v9 = NSString;
      unint64_t v20 = this;
      unint64_t v21 = 22;
LABEL_79:
LABEL_80:
      v45 = (__CFString *)[v9 stringWithFormat:@"(%@)", v10];
      goto LABEL_84;
    case 60:
      unint64_t v11 = NSString;
      CFRange v23 = this;
      unint64_t v24 = 22;
LABEL_82:
LABEL_83:
      v45 = (__CFString *)[v11 stringWithFormat:@"%@"], v12);
      goto LABEL_84;
    case 61:
      v43 = NSString;
LABEL_87:
      v45 = (__CFString *)[v43 stringWithFormat:@"%@", v44];
      goto LABEL_84;
    case 63:
      goto LABEL_84;
    case 64:
LABEL_84:
      CFRange v46 = v45;
      if (a5) {
        return v46;
      }
      goto LABEL_89;
    default:
      CFRange v48 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", this);
      uint64_t v49 = [NSString stringWithUTF8String:"+[NSString(TSWPAdditions) stringForValue:withListNumberFormat:includeFormatting:]"];
      objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/NSStringAdditions.mm"), 1543, @"Label format (%d) invalid for numeric list.", a4);
      CFRange v46 = &stru_26D688A48;
      if (a5) {
        return v46;
      }
LABEL_89:
      if (+[NSString(TSWPAdditions) stringForValue:withListNumberFormat:includeFormatting:]::s_predicate != -1) {
        dispatch_once(&+[NSString(TSWPAdditions) stringForValue:withListNumberFormat:includeFormatting:]::s_predicate, &__block_literal_global_73);
      }
      uint64_t v50 = +[NSString(TSWPAdditions) stringForValue:withListNumberFormat:includeFormatting:]::_formattingCharacterSet;
      return (__CFString *)[(__CFString *)v46 tsu_stringByRemovingCharactersInSet:v50];
  }
}

- (uint64_t)contentsScript
{
  uint64_t v2 = [a1 length];

  return objc_msgSend(a1, "contentsScriptInRange:", 0, v2);
}

- (uint64_t)contentsScriptInRange:()TSWPAdditions
{
  if (!a4 || a3 >= [(__CFString *)a1 length]) {
    return 0;
  }
  uint64_t v7 = TSWPScriptForCharacter([(__CFString *)a1 characterAtIndex:a3]);
  if (v7)
  {
    CFStringRef theString = a1;
    unint64_t v26 = a3 + 1;
    uint64_t v27 = a4 - 1;
    CharactersPtr = CFStringGetCharactersPtr(a1);
    if (CharactersPtr) {
      CStringPtr = 0;
    }
    else {
      CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
    }
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    uint64_t v12 = 64;
    unint64_t v25 = CStringPtr;
    while (1)
    {
      uint64_t v13 = (unint64_t)v11 >= 4 ? 4 : v11;
      uint64_t v14 = v27;
      if (v27 <= v11) {
        break;
      }
      if (CharactersPtr)
      {
        UniChar v15 = CharactersPtr[v11 + v26];
      }
      else if (v25)
      {
        UniChar v15 = v25[v26 + v11];
      }
      else
      {
        uint64_t v16 = v28;
        if (v29 <= v11 || v28 > v11)
        {
          uint64_t v18 = v11 - v13;
          uint64_t v19 = v13 + v10;
          uint64_t v20 = v12 - v13;
          uint64_t v21 = v18 + 64;
          if (v18 + 64 >= v27) {
            uint64_t v21 = v27;
          }
          uint64_t v28 = v18;
          uint64_t v29 = v21;
          if (v27 >= v20) {
            uint64_t v14 = v20;
          }
          v30.CFIndex length = v14 + v19;
          v30.CFIndex location = v26 + v18;
          CFStringGetCharacters(theString, v30, buffer);
          uint64_t v16 = v28;
        }
        UniChar v15 = buffer[v11 - v16];
      }
      if (!v15) {
        break;
      }
      ++v11;
      --v10;
      ++v12;
      if (TSWPScriptForCharacter(v15) != v7) {
        return 1;
      }
    }
  }
  return v7;
}

+ (uint64_t)stringForValue:()TSWPAdditions withPageNumberFormat:
{
  switch(a4)
  {
    case 0:
      break;
    case 1:
      break;
    case 2:
      goto LABEL_14;
    case 3:
      break;
    case 4:
LABEL_14:
      uint64_t result = [v5 lowercaseString];
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

- (uint64_t)utf32CharacterAtIndex:()TSWPAdditions
{
  unint64_t v5 = [a1 length];
  if (v5 <= a3)
  {
    UniChar v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"-[NSString(TSWPAdditions) utf32CharacterAtIndex:]"];
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/NSStringAdditions.mm"), 1643, @"index out of bounds");
    return 0;
  }
  unint64_t v6 = v5;
  uint64_t v7 = [a1 characterAtIndex:a3];
  if ((v7 & 0xFC00) == 0xDC00)
  {
    uint64_t v8 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[NSString(TSWPAdditions) utf32CharacterAtIndex:]"];
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/NSStringAdditions.mm"];
    uint64_t v11 = @"index inside surrogate pair";
    uint64_t v12 = (void *)v8;
    uint64_t v13 = v9;
    uint64_t v14 = 1648;
LABEL_4:
    [v12 handleFailureInFunction:v13 file:v10 lineNumber:v14 description:v11];
    return v7;
  }
  if (a3 + 1 < v6 && (v7 & 0xFC00) == 0xD800)
  {
    int v18 = objc_msgSend(a1, "characterAtIndex:");
    if ((v18 & 0xFC00) == 0xDC00) {
      return (v18 + (v7 << 10) - 56613888);
    }
    uint64_t v19 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v20 = [NSString stringWithUTF8String:"-[NSString(TSWPAdditions) utf32CharacterAtIndex:]"];
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/NSStringAdditions.mm"];
    uint64_t v11 = @"invalid surrogate pair";
    uint64_t v12 = (void *)v19;
    uint64_t v13 = v20;
    uint64_t v14 = 1653;
    goto LABEL_4;
  }
  return v7;
}

@end