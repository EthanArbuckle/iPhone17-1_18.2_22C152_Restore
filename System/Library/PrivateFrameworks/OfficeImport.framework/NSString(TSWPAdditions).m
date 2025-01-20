@interface NSString(TSWPAdditions)
+ (id)tswp_stringForValue:()TSWPAdditions withListNumberFormat:includeFormatting:;
+ (id)tswp_stringForValue:()TSWPAdditions withPageNumberFormat:;
+ (uint64_t)tswp_numberForString:()TSWPAdditions withListNumberFormat:;
+ (uint64_t)tswp_numberForString:()TSWPAdditions withPageNumberFormat:;
+ (uint64_t)tswp_stringForValue:()TSWPAdditions withListNumberFormat:;
- (__CFString)tswp_replaceOccurrencesOfCharactersInSet:()TSWPAdditions minimumConsecutiveLength:replaceString:;
- (__CFString)tswp_stringByNormalizingParagraphBreaks;
- (id)tswp_stringWithoutControlCharacters;
- (uint64_t)tswp_NSDetectorMatchStringIsStrictPhoneNumber;
- (uint64_t)tswp_findIndexOfCharacter:()TSWPAdditions range:;
- (uint64_t)tswp_isLowerCaseFromIndex:()TSWPAdditions;
- (uint64_t)tswp_rangeOfCharactersFromSet:()TSWPAdditions index:;
- (uint64_t)tswp_utf32CharacterAtIndex:()TSWPAdditions;
- (uint64_t)tswp_utf32CharacterAtIndex:()TSWPAdditions planeClassification:;
@end

@implementation NSString(TSWPAdditions)

- (__CFString)tswp_stringByNormalizingParagraphBreaks
{
  v1 = a1;
  uint64_t v2 = [(__CFString *)v1 length];
  v30 = v1;
  uint64_t v33 = 0;
  int64_t v34 = v2;
  CharactersPtr = CFStringGetCharactersPtr(v1);
  if (CharactersPtr) {
    CStringPtr = 0;
  }
  else {
    CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
  }
  v32 = CStringPtr;
  int64_t v35 = 0;
  int64_t v36 = 0;
  if (v2 >= 1)
  {
    uint64_t v4 = 0;
    int64_t v5 = 0;
    v6 = 0;
    v7 = 0;
    int64_t v8 = 0;
    uint64_t v9 = 64;
    while (1)
    {
      if ((unint64_t)v8 >= 3) {
        uint64_t v10 = 3;
      }
      else {
        uint64_t v10 = v8;
      }
      if ((unint64_t)v8 >= 4) {
        uint64_t v11 = 4;
      }
      else {
        uint64_t v11 = v8;
      }
      if (v34 <= v8) {
        goto LABEL_48;
      }
      if (CharactersPtr)
      {
        UniChar v12 = CharactersPtr[v8 + v33];
      }
      else if (v32)
      {
        UniChar v12 = v32[v33 + v8];
      }
      else
      {
        if (v36 <= v8 || v5 > v8)
        {
          uint64_t v13 = -v11;
          uint64_t v14 = v11 + v4;
          uint64_t v15 = v9 - v11;
          int64_t v16 = v8 + v13;
          int64_t v17 = v16 + 64;
          if (v16 + 64 >= v34) {
            int64_t v17 = v34;
          }
          int64_t v35 = v16;
          int64_t v36 = v17;
          v18.location = v16 + v33;
          if (v34 >= v15) {
            uint64_t v19 = v15;
          }
          else {
            uint64_t v19 = v34;
          }
          v18.length = v19 + v14;
          CFStringGetCharacters(v30, v18, buffer);
          int64_t v5 = v35;
        }
        UniChar v12 = buffer[v8 - v5];
      }
      if (v12 == 8233) {
        goto LABEL_33;
      }
      if (v12 == 13) {
        break;
      }
LABEL_48:
      ++v8;
      --v4;
      ++v9;
      if (v8 >= v2)
      {

        goto LABEL_59;
      }
    }
    int64_t v20 = v8 + 1;
    if (v8 + 1 >= v2 || v34 <= v20)
    {
LABEL_33:
      uint64_t v23 = 1;
      if (!v7) {
        goto LABEL_42;
      }
      goto LABEL_34;
    }
    if (CharactersPtr)
    {
      v21 = (UniChar *)&CharactersPtr[v8 + v33];
    }
    else
    {
      if (v32)
      {
        UniChar v22 = v32[v33 + 1 + v8];
LABEL_38:
        if (v22 == 10) {
          uint64_t v23 = 2;
        }
        else {
          uint64_t v23 = 1;
        }
        if (!v7)
        {
LABEL_42:
          v7 = (__CFString *)(id)[(__CFString *)v1 mutableCopyWithZone:0];

          v1 = v7;
          if (!v6)
          {
LABEL_43:
            __int16 v28 = 10;
            v6 = (void *)[[NSString alloc] initWithCharacters:&v28 length:1];
          }
LABEL_44:
          -[__CFString replaceCharactersInRange:withString:](v7, "replaceCharactersInRange:withString:", v8, v23, v6);
          uint64_t v2 = [(__CFString *)v1 length];
          v30 = v1;
          uint64_t v33 = 0;
          int64_t v34 = v2;
          CharactersPtr = CFStringGetCharactersPtr(v1);
          if (CharactersPtr) {
            v24 = 0;
          }
          else {
            v24 = CFStringGetCStringPtr(v1, 0x600u);
          }
          int64_t v5 = 0;
          v32 = v24;
          int64_t v35 = 0;
          int64_t v36 = 0;
          goto LABEL_48;
        }
LABEL_34:
        if (!v6) {
          goto LABEL_43;
        }
        goto LABEL_44;
      }
      if (v36 <= v20 || v5 > v20)
      {
        uint64_t v25 = v8 - v10 + 64;
        if (v25 >= v34) {
          uint64_t v25 = v34;
        }
        int64_t v35 = v8 - v10;
        int64_t v36 = v25;
        if (v34 >= v9 - v10) {
          uint64_t v26 = v9 - v10;
        }
        else {
          uint64_t v26 = v34;
        }
        v38.length = v26 + v10 + v4;
        v38.location = v8 - v10 + v33;
        CFStringGetCharacters(v30, v38, buffer);
        int64_t v5 = v35;
      }
      v21 = &buffer[v8 - v5];
    }
    UniChar v22 = v21[1];
    goto LABEL_38;
  }
LABEL_59:
  return v1;
}

- (uint64_t)tswp_findIndexOfCharacter:()TSWPAdditions range:
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

- (uint64_t)tswp_rangeOfCharactersFromSet:()TSWPAdditions index:
{
  id v6 = a3;
  unint64_t v7 = [a1 length];
  uint64_t v8 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v6, 0, a4, v7 - a4);
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = a4 + 1;
    if (a4 + 1 < v7)
    {
      do
      {
        if (!objc_msgSend(v6, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v11))) {
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

- (__CFString)tswp_replaceOccurrencesOfCharactersInSet:()TSWPAdditions minimumConsecutiveLength:replaceString:
{
  CFCharacterSetRef v8 = a3;
  id v9 = a5;
  if (!v9)
  {
    uint64_t v10 = [NSString stringWithUTF8String:"-[NSString(TSWPAdditions) tswp_replaceOccurrencesOfCharactersInSet:minimumConsecutiveLength:replaceString:]"];
    uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/TSNSStringAdditions.mm"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 968, 0, "invalid nil value for '%{public}s'", "replaceString");

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  v56 = 0;
  v57 = 0;
  v58 = 0;
  unint64_t v12 = [(__CFString *)a1 length];
  CFStringRef theString = a1;
  range.location = 0;
  range.CFIndex length = v12;
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
  v48 = a1;
  if (v12 && range.length >= 1)
  {
    if (CharactersPtr)
    {
      UniChar v14 = CharactersPtr[range.location];
    }
    else if (CStringPtr)
    {
      UniChar v14 = CStringPtr[range.location];
    }
    else
    {
      if (range.length >= 0x40uLL) {
        v45.CFIndex length = 64;
      }
      else {
        v45.CFIndex length = range.length;
      }
      CFIndex length = v45.length;
      v45.location = range.location;
      CFStringGetCharacters(theString, v45, buffer);
      UniChar v14 = buffer[-v54];
    }
  }
  else
  {
    UniChar v14 = 0;
  }
  BOOL v15 = CFCharacterSetIsCharacterMember(v8, v14) != 0;
  if (v12 < 2 || range.length < 2)
  {
    UniChar v16 = 0;
  }
  else if (CharactersPtr)
  {
    UniChar v16 = CharactersPtr[range.location + 1];
  }
  else if (v52)
  {
    UniChar v16 = v52[range.location + 1];
  }
  else
  {
    if (length < 2 || (uint64_t v46 = v54, v54 >= 2))
    {
      if (range.length >= 0x40uLL) {
        v47.CFIndex length = 64;
      }
      else {
        v47.CFIndex length = range.length;
      }
      uint64_t v54 = 0;
      CFIndex length = v47.length;
      v47.location = range.location;
      CFStringGetCharacters(theString, v47, buffer);
      uint64_t v46 = v54;
    }
    UniChar v16 = buffer[1 - v46];
  }
  int IsCharacterMember = CFCharacterSetIsCharacterMember(v8, v16);
  if (v12)
  {
    unint64_t v18 = 0;
    unint64_t v19 = 0;
    BOOL v20 = IsCharacterMember != 0;
    unint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      if (v15)
      {
        if (v18 < v21) {
          unint64_t v21 = v18;
        }
        ++v19;
        if (!v20)
        {
          if (v19 >= a4)
          {
            UniChar v22 = v57;
            if (v57 >= v58)
            {
              NSUInteger v24 = v56;
              uint64_t v25 = ((char *)v57 - (char *)v56) >> 4;
              unint64_t v26 = v25 + 1;
              if ((unint64_t)(v25 + 1) >> 60) {
                std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v27 = (char *)v58 - (char *)v56;
              if (v58 - v56 > v26) {
                unint64_t v26 = v27 >> 3;
              }
              if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v28 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v28 = v26;
              }
              if (v28)
              {
                v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<TSUStringChunk>>>((uint64_t)&v58, v28);
                NSUInteger v24 = v56;
                UniChar v22 = v57;
              }
              else
              {
                v29 = 0;
              }
              NSRange v30 = (unint64_t *)&v29[16 * v25];
              unint64_t *v30 = v21;
              v30[1] = v19;
              uint64_t v31 = v30;
              if (v22 != v24)
              {
                do
                {
                  *((_OWORD *)v31 - 1) = *((_OWORD *)v22 - 1);
                  v31 -= 2;
                  v22 -= 2;
                }
                while (v22 != v24);
                NSUInteger v24 = v56;
              }
              CFRange v23 = v30 + 2;
              v56 = v31;
              v57 = v30 + 2;
              v58 = (unint64_t *)&v29[16 * v28];
              if (v24) {
                operator delete(v24);
              }
            }
            else
            {
              unint64_t *v57 = v21;
              v22[1] = v19;
              CFRange v23 = v22 + 2;
            }
            unint64_t v19 = 0;
            v57 = v23;
          }
          else
          {
            unint64_t v19 = 0;
          }
          unint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      if (v18 < v12 - 2) {
        break;
      }
      BOOL v37 = 0;
LABEL_51:
      ++v18;
      BOOL v15 = v20;
      BOOL v20 = v37;
      if (v18 == v12) {
        goto LABEL_63;
      }
    }
    int64_t v32 = v18 + 2;
    if ((uint64_t)(v18 + 2) < 0 || (CFIndex v33 = range.length, range.length <= v32))
    {
      UniChar v36 = 0;
    }
    else
    {
      NSRange v34 = (UniChar *)CharactersPtr;
      if (CharactersPtr)
      {
        CFIndex v35 = range.location + v32;
      }
      else
      {
        if (v52)
        {
          UniChar v36 = v52[range.location + v32];
          goto LABEL_50;
        }
        if (length <= v32 || (uint64_t v38 = v54, v54 > v32))
        {
          uint64_t v39 = v18 - 2;
          if ((unint64_t)v32 < 4) {
            uint64_t v39 = 0;
          }
          if (v39 + 64 < range.length) {
            CFIndex v33 = v39 + 64;
          }
          uint64_t v54 = v39;
          CFIndex length = v33;
          v60.location = range.location + v39;
          v60.CFIndex length = v33 - v39;
          CFStringGetCharacters(theString, v60, buffer);
          uint64_t v38 = v54;
        }
        CFIndex v35 = v32 - v38;
        NSRange v34 = buffer;
      }
      UniChar v36 = v34[v35];
    }
LABEL_50:
    BOOL v37 = CFCharacterSetIsCharacterMember(v8, v36) != 0;
    goto LABEL_51;
  }
LABEL_63:
  if (v57 == v56)
  {
    v40 = v48;
  }
  else
  {
    v40 = (__CFString *)[(__CFString *)v48 mutableCopy];
    for (uint64_t i = v57; i != v56; i -= 2)
    {
      uint64_t v42 = *(i - 2);
      uint64_t v43 = *(i - 1);
      -[__CFString replaceCharactersInRange:withString:](v40, "replaceCharactersInRange:withString:", v42, v43, v9);
    }
  }
  if (v56)
  {
    v57 = v56;
    operator delete(v56);
  }

  return v40;
}

+ (uint64_t)tswp_numberForString:()TSWPAdditions withListNumberFormat:
{
  id v5 = a3;
  if ([v5 length])
  {
    id v6 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    unint64_t v7 = [v5 stringByTrimmingCharactersInSet:v6];

    if (!+[NSString(TSWPAdditions) tswp_numberForString:withListNumberFormat:]::sformattingCharacterSet)
    {
      id v8 = objc_alloc_init(MEMORY[0x263F089C0]);
      id v9 = [NSString stringWithCharacters:L".()" length:3];
      [v8 addCharactersInString:v9];

      uint64_t v10 = (void *)+[NSString(TSWPAdditions) tswp_numberForString:withListNumberFormat:]::sformattingCharacterSet;
      +[NSString(TSWPAdditions) tswp_numberForString:withListNumberFormat:]::sformattingCharacterSet = (uint64_t)v8;
    }
    if (a4 >= 3)
    {
      uint64_t v11 = objc_msgSend(v7, "tsu_stringByRemovingCharactersInSet:", +[NSString(TSWPAdditions) tswp_numberForString:withListNumberFormat:]::sformattingCharacterSet);

      unint64_t v7 = (void *)v11;
    }
    if ((unint64_t)[v7 length] >= 0x65)
    {
      uint64_t v13 = objc_msgSend(v7, "substringWithRange:", 0, 100);

      unint64_t v7 = (void *)v13;
    }
    switch(a4)
    {
      case 0uLL:
      case 1uLL:
      case 2uLL:
        goto LABEL_15;
      case 3uLL:
      case 4uLL:
      case 5uLL:
        goto LABEL_15;
      case 6uLL:
      case 7uLL:
      case 8uLL:
        goto LABEL_15;
      case 9uLL:
      case 0xAuLL:
      case 0xBuLL:
        goto LABEL_15;
      case 0xCuLL:
      case 0xDuLL:
      case 0xEuLL:
LABEL_15:
        uint64_t v15 = v14;
        break;
      default:
        int64_t v17 = [NSString stringWithUTF8String:"+[NSString(TSWPAdditions) tswp_numberForString:withListNumberFormat:]"];
        unint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/TSNSStringAdditions.mm"];
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 1087, 0, "Label format (%lu) not recognized.", a4);

        +[OITSUAssertionHandler logBacktraceThrottled];
        uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
        break;
    }
  }
  else
  {
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v15;
}

+ (uint64_t)tswp_numberForString:()TSWPAdditions withPageNumberFormat:
{
  id v5 = a3;
  if ([v5 length])
  {
    id v6 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    unint64_t v7 = [v5 stringByTrimmingCharactersInSet:v6];

    if ((unint64_t)[v7 length] >= 0x65)
    {
      uint64_t v9 = objc_msgSend(v7, "substringWithRange:", 0, 100);

      unint64_t v7 = (void *)v9;
    }
    switch((int)a4)
    {
      case 0:
        goto LABEL_12;
      case 1:
        goto LABEL_12;
      case 2:
        goto LABEL_12;
      case 3:
        goto LABEL_12;
      case 4:
LABEL_12:
        uint64_t v11 = v10;
        break;
      default:
        unint64_t v12 = [NSString stringWithUTF8String:"+[NSString(TSWPAdditions) tswp_numberForString:withPageNumberFormat:]"];
        uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/TSNSStringAdditions.mm"];
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 1128, 0, "Number format (%d) not recognized.", a4);

        +[OITSUAssertionHandler logBacktraceThrottled];
        uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        break;
    }
  }
  else
  {
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v11;
}

+ (uint64_t)tswp_stringForValue:()TSWPAdditions withListNumberFormat:
{
  return objc_msgSend(NSString, "tswp_stringForValue:withListNumberFormat:includeFormatting:", a3, a4, 1);
}

+ (id)tswp_stringForValue:()TSWPAdditions withListNumberFormat:includeFormatting:
{
  switch(a4)
  {
    case 0:
      id v8 = v7 = NSString;
      uint64_t v9 = [v7 stringWithFormat:@"%@.", v8];
      goto LABEL_67;
    case 1:
      id v8 = v10 = NSString;
      uint64_t v9 = [v10 stringWithFormat:@"(%@)", v8];
      goto LABEL_67;
    case 2:
      id v8 = v11 = NSString;
      uint64_t v9 = [v11 stringWithFormat:@"%@"], v8);
      goto LABEL_67;
    case 3:
      id v8 = v12 = NSString;
      uint64_t v9 = [v12 stringWithFormat:@"%@.", v8];
      goto LABEL_67;
    case 4:
      id v8 = v13 = NSString;
      uint64_t v9 = [v13 stringWithFormat:@"(%@)", v8];
      goto LABEL_67;
    case 5:
      id v8 = v14 = NSString;
      uint64_t v9 = [v14 stringWithFormat:@"%@"], v8);
      goto LABEL_67;
    case 6:
      id v8 = v15 = NSString;
      uint64_t v9 = [v15 stringWithFormat:@"%@.", v8];
      goto LABEL_67;
    case 7:
      id v8 = v16 = NSString;
      uint64_t v9 = [v16 stringWithFormat:@"(%@)", v8];
      goto LABEL_67;
    case 8:
      id v8 = v17 = NSString;
      uint64_t v9 = [v17 stringWithFormat:@"%@"], v8);
      goto LABEL_67;
    case 9:
      id v8 = v18 = NSString;
      uint64_t v9 = [v18 stringWithFormat:@"%@.", v8];
      goto LABEL_67;
    case 10:
      id v8 = v19 = NSString;
      uint64_t v9 = [v19 stringWithFormat:@"(%@)", v8];
      goto LABEL_67;
    case 11:
      id v8 = v20 = NSString;
      uint64_t v9 = [v20 stringWithFormat:@"%@"], v8);
      goto LABEL_67;
    case 12:
      id v8 = v21 = NSString;
      uint64_t v9 = [v21 stringWithFormat:@"%@.", v8];
      goto LABEL_67;
    case 13:
      id v8 = v22 = NSString;
      uint64_t v9 = [v22 stringWithFormat:@"(%@)", v8];
      goto LABEL_67;
    case 14:
      id v8 = v23 = NSString;
      uint64_t v9 = [v23 stringWithFormat:@"%@"], v8);
      goto LABEL_67;
    case 15:
      id v8 = v24 = NSString;
      uint64_t v9 = [v24 stringWithFormat:@"%@.", v8];
      goto LABEL_67;
    case 16:
      id v8 = v25 = NSString;
      uint64_t v9 = [v25 stringWithFormat:@"(%@)", v8];
      goto LABEL_67;
    case 17:
      id v8 = v26 = NSString;
      uint64_t v9 = [v26 stringWithFormat:@"%@"], v8);
      goto LABEL_67;
    case 18:
      id v8 = v27 = NSString;
      uint64_t v9 = [v27 stringWithFormat:@"%@.", v8];
      goto LABEL_67;
    case 19:
      id v8 = v28 = NSString;
      uint64_t v9 = [v28 stringWithFormat:@"(%@)", v8];
      goto LABEL_67;
    case 20:
      id v8 = v29 = NSString;
      uint64_t v9 = [v29 stringWithFormat:@"%@"], v8);
      goto LABEL_67;
    case 21:
      id v8 = v30 = NSString;
      uint64_t v9 = [v30 stringWithFormat:@"%@.", v8];
      goto LABEL_67;
    case 22:
      id v8 = v31 = NSString;
      uint64_t v9 = [v31 stringWithFormat:@"(%@)", v8];
      goto LABEL_67;
    case 23:
      id v8 = v32 = NSString;
      uint64_t v9 = [v32 stringWithFormat:@"%@"], v8);
      goto LABEL_67;
    case 24:
      id v8 = v33 = NSString;
      uint64_t v9 = [v33 stringWithFormat:@"%@.", v8];
      goto LABEL_67;
    case 25:
      id v8 = v34 = NSString;
      uint64_t v9 = [v34 stringWithFormat:@"(%@)", v8];
      goto LABEL_67;
    case 26:
      id v8 = v35 = NSString;
      uint64_t v9 = [v35 stringWithFormat:@"%@"], v8);
      goto LABEL_67;
    case 27:
      id v8 = v36 = NSString;
      uint64_t v9 = [v36 stringWithFormat:@"%@.", v8];
      goto LABEL_67;
    case 28:
      id v8 = v37 = NSString;
      uint64_t v9 = [v37 stringWithFormat:@"(%@)", v8];
      goto LABEL_67;
    case 29:
      id v8 = v38 = NSString;
      uint64_t v9 = [v38 stringWithFormat:@"%@"], v8);
      goto LABEL_67;
    case 30:
      id v8 = v39 = NSString;
      uint64_t v9 = [v39 stringWithFormat:@"%@.", v8];
      goto LABEL_67;
    case 31:
      id v8 = v40 = NSString;
      uint64_t v9 = [v40 stringWithFormat:@"(%@)", v8];
      goto LABEL_67;
    case 32:
      id v8 = v41 = NSString;
      uint64_t v9 = [v41 stringWithFormat:@"%@"], v8);
      goto LABEL_67;
    case 33:
      id v8 = v42 = NSString;
      uint64_t v9 = [v42 stringWithFormat:@"%@.", v8];
      goto LABEL_67;
    case 34:
      id v8 = v43 = NSString;
      uint64_t v9 = [v43 stringWithFormat:@"(%@)", v8];
      goto LABEL_67;
    case 35:
      id v8 = v44 = NSString;
      uint64_t v9 = [v44 stringWithFormat:@"%@"], v8);
      goto LABEL_67;
    case 36:
      id v8 = v45 = NSString;
      uint64_t v9 = [v45 stringWithFormat:@"%@.", v8];
      goto LABEL_67;
    case 37:
      id v8 = v46 = NSString;
      uint64_t v9 = [v46 stringWithFormat:@"(%@)", v8];
      goto LABEL_67;
    case 38:
      id v8 = v47 = NSString;
      uint64_t v9 = [v47 stringWithFormat:@"%@"], v8);
      goto LABEL_67;
    case 39:
      id v8 = v48 = NSString;
      uint64_t v9 = [v48 stringWithFormat:@"%@.", v8];
      goto LABEL_67;
    case 40:
      id v8 = v49 = NSString;
      uint64_t v9 = [v49 stringWithFormat:@"(%@)", v8];
      goto LABEL_67;
    case 41:
      id v8 = v50 = NSString;
      uint64_t v9 = [v50 stringWithFormat:@"%@"], v8);
      goto LABEL_67;
    case 42:
      id v8 = v51 = NSString;
      uint64_t v9 = [v51 stringWithFormat:@"%@.", v8];
      goto LABEL_67;
    case 43:
      id v8 = v52 = NSString;
      uint64_t v9 = [v52 stringWithFormat:@"(%@)", v8];
      goto LABEL_67;
    case 44:
      id v8 = v53 = NSString;
      uint64_t v9 = [v53 stringWithFormat:@"%@"], v8);
      goto LABEL_67;
    case 45:
      id v8 = v54 = NSString;
      uint64_t v9 = [v54 stringWithFormat:@"%@.", v8];
      goto LABEL_67;
    case 46:
      id v8 = v55 = NSString;
      uint64_t v9 = [v55 stringWithFormat:@"(%@)", v8];
      goto LABEL_67;
    case 47:
      id v8 = v56 = NSString;
      uint64_t v9 = [v56 stringWithFormat:@"%@"], v8);
      goto LABEL_67;
    case 48:
      id v8 = v57 = NSString;
      uint64_t v9 = [v57 stringWithFormat:@"%@", v8];
      goto LABEL_67;
    case 49:
      id v8 = v58 = NSString;
      uint64_t v9 = [v58 stringWithFormat:@"%@.", v8];
      goto LABEL_67;
    case 50:
      id v8 = v59 = NSString;
      uint64_t v9 = [v59 stringWithFormat:@"(%@)", v8];
      goto LABEL_67;
    case 51:
      id v8 = v60 = NSString;
      uint64_t v9 = [v60 stringWithFormat:@"%@"], v8);
      goto LABEL_67;
    case 52:
      id v8 = v61 = NSString;
      uint64_t v9 = [v61 stringWithFormat:@"%@.", v8];
      goto LABEL_67;
    case 53:
      id v8 = v62 = NSString;
      uint64_t v9 = [v62 stringWithFormat:@"(%@)", v8];
      goto LABEL_67;
    case 54:
      id v8 = v63 = NSString;
      uint64_t v9 = [v63 stringWithFormat:@"%@"], v8);
      goto LABEL_67;
    case 55:
      id v8 = v64 = NSString;
      uint64_t v9 = [v64 stringWithFormat:@"%@.", v8];
      goto LABEL_67;
    case 56:
      id v8 = v65 = NSString;
      uint64_t v9 = [v65 stringWithFormat:@"(%@)", v8];
      goto LABEL_67;
    case 57:
      id v8 = v66 = NSString;
      uint64_t v9 = [v66 stringWithFormat:@"%@"], v8);
      goto LABEL_67;
    case 58:
      id v8 = v67 = NSString;
      uint64_t v9 = [v67 stringWithFormat:@"%@.", v8];
      goto LABEL_67;
    case 59:
      id v8 = v68 = NSString;
      uint64_t v9 = [v68 stringWithFormat:@"(%@)", v8];
      goto LABEL_67;
    case 60:
      id v8 = v69 = NSString;
      uint64_t v9 = [v69 stringWithFormat:@"%@"], v8);
      goto LABEL_67;
    case 61:
      id v8 = v70 = NSString;
      uint64_t v9 = [v70 stringWithFormat:@"%@", v8];
      goto LABEL_67;
    case 62:
      id v8 = v71 = NSString;
      uint64_t v9 = [v71 stringWithFormat:@"%@.", v8];
      goto LABEL_67;
    case 63:
      id v8 = v72 = NSString;
      uint64_t v9 = [v72 stringWithFormat:@"(%@)", v8];
      goto LABEL_67;
    case 64:
      id v8 = v73 = NSString;
      uint64_t v9 = [v73 stringWithFormat:@"%@"], v8);
LABEL_67:
      v74 = (void *)v9;

      goto LABEL_68;
      uint64_t v77 = case 66:;
      goto LABEL_77;
      uint64_t v77 = case 67:;
LABEL_77:
      v74 = (void *)v77;
LABEL_68:
      if ((a5 & 1) == 0)
      {
        if (+[NSString(TSWPAdditions) tswp_stringForValue:withListNumberFormat:includeFormatting:]::s_predicate != -1) {
          dispatch_once(&+[NSString(TSWPAdditions) tswp_stringForValue:withListNumberFormat:includeFormatting:]::s_predicate, &__block_literal_global_40);
        }
        uint64_t v75 = objc_msgSend(v74, "tsu_stringByRemovingCharactersInSet:", +[NSString(TSWPAdditions) tswp_stringForValue:withListNumberFormat:includeFormatting:]::_formattingCharacterSet);

        v74 = (void *)v75;
      }
      return v74;
    default:
      v78 = [NSString stringWithUTF8String:"+[NSString(TSWPAdditions) tswp_stringForValue:withListNumberFormat:includeFormatting:]"];
      v79 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/TSNSStringAdditions.mm"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v78, v79, 1346, 1, "Label format (%lu) invalid for numeric list.", a4);

      TSUCrash((uint64_t)"Label format (%lu) invalid for numeric list.", v80, v81, v82, v83, v84, v85, v86, a4);
  }
}

- (uint64_t)tswp_NSDetectorMatchStringIsStrictPhoneNumber
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08708] letterCharacterSet];
  uint64_t v3 = [a1 rangeOfCharacterFromSet:v2];

  if (v3 != 0x7FFFFFFFFFFFFFFFLL) {
    return 1;
  }
  uint64_t v4 = [MEMORY[0x263F08708] punctuationCharacterSet];
  uint64_t v5 = [a1 rangeOfCharacterFromSet:v4];

  if (v5 != 0x7FFFFFFFFFFFFFFFLL
    || [a1 length] && !u_charDigitValue(objc_msgSend(a1, "tswp_utf32CharacterAtIndex:", 0)))
  {
    return 1;
  }
  id v6 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  unint64_t v7 = [a1 componentsSeparatedByCharactersInSet:v6];

  if ((unint64_t)[v7 count] < 2)
  {
    uint64_t v14 = 0;
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ((unint64_t)objc_msgSend(v13, "length", (void)v16) > 3)
          {
            uint64_t v14 = 1;
            goto LABEL_22;
          }
          if ((unint64_t)[v13 length] <= 2)
          {
            uint64_t v14 = 1;
            if (v10) {
              goto LABEL_22;
            }
            uint64_t v10 = 1;
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    uint64_t v14 = 0;
LABEL_22:
  }
  return v14;
}

+ (id)tswp_stringForValue:()TSWPAdditions withPageNumberFormat:
{
  switch(a4)
  {
      uint64_t v5 = case 0:;
      goto LABEL_11;
      uint64_t v5 = case 1:;
      goto LABEL_11;
      uint64_t v5 = case 2:;
      goto LABEL_11;
      uint64_t v5 = case 3:;
      goto LABEL_11;
      uint64_t v5 = case 4:;
      goto LABEL_11;
      uint64_t v5 = case 5:;
LABEL_11:
      break;
    default:
      uint64_t v5 = 0;
      break;
  }
  return v5;
}

- (uint64_t)tswp_utf32CharacterAtIndex:()TSWPAdditions
{
  unint64_t v5 = [a1 length];
  if (v5 <= a3)
  {
    uint64_t v9 = [NSString stringWithUTF8String:"-[NSString(TSWPAdditions) tswp_utf32CharacterAtIndex:]"];
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/TSNSStringAdditions.mm"];
    +[OITSUAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:1493 isFatal:0 description:"index out of bounds"];

    +[OITSUAssertionHandler logBacktraceThrottled];
    return 0;
  }
  else
  {
    unint64_t v6 = v5;
    uint64_t v7 = [a1 characterAtIndex:a3];
    if ((v7 & 0xFC00) == 0xDC00)
    {
      if (a3) {
        uint64_t v8 = [a1 characterAtIndex:a3 - 1];
      }
      else {
        uint64_t v8 = 0;
      }
      if (a3 + 1 >= [a1 length]) {
        uint64_t v12 = 0;
      }
      else {
        uint64_t v12 = [a1 characterAtIndex:a3 + 1];
      }
      NSUInteger v13 = [a1 rangeOfComposedCharacterSequenceAtIndex:a3];
      NSUInteger v15 = v14;
      long long v16 = [NSString stringWithUTF8String:"-[NSString(TSWPAdditions) tswp_utf32CharacterAtIndex:]"];
      long long v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/TSNSStringAdditions.mm"];
      v37.location = v13;
      v37.CFIndex length = v15;
      long long v18 = NSStringFromRange(v37);
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 1502, 1, "index inside surrogate pair. characters:U+%04x U+%04x U+%04x, sequence range: %{public}@", v8, v7, v12, v18);

      v38.location = v13;
      v38.CFIndex length = v15;
      NSStringFromRange(v38);
      objc_claimAutoreleasedReturnValue();
      TSUCrash((uint64_t)"index inside surrogate pair. characters:U+%04x U+%04x U+%04x, sequence range: %{public}@", v19, v20, v21, v22, v23, v24, v25, v8);
    }
    if (a3 + 1 < v6 && (v7 & 0xFC00) == 0xD800)
    {
      int v11 = objc_msgSend(a1, "characterAtIndex:");
      if ((v11 & 0xFC00) != 0xDC00)
      {
        unint64_t v26 = [NSString stringWithUTF8String:"-[NSString(TSWPAdditions) tswp_utf32CharacterAtIndex:]"];
        uint64_t v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/TSNSStringAdditions.mm"];
        +[OITSUAssertionHandler handleFailureInFunction:v26 file:v27 lineNumber:1508 isFatal:1 description:"invalid surrogate pair"];

        TSUCrash((uint64_t)"invalid surrogate pair", v28, v29, v30, v31, v32, v33, v34, v36);
      }
      return (v11 + (v7 << 10) - 56613888);
    }
  }
  return v7;
}

- (uint64_t)tswp_utf32CharacterAtIndex:()TSWPAdditions planeClassification:
{
  uint64_t v7 = [a1 length];
  uint64_t v8 = [a1 characterAtIndex:a3];
  if ((v8 & 0xFC00) == 0xD800)
  {
    if (a4) {
      *a4 = 1;
    }
    if (v7 - 1 == a3)
    {
      int v11 = [NSString stringWithUTF8String:"-[NSString(TSWPAdditions) tswp_utf32CharacterAtIndex:planeClassification:]"];
      uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/TSNSStringAdditions.mm"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 1548, 0, "Invalid surrogate pair (single code point=0x%x, index=%lu)", v8, a3);
    }
    else
    {
      int v13 = [a1 characterAtIndex:a3 + 1];
      if ((v13 & 0xFC00) == 0xDC00)
      {
        int v10 = v13 + (v8 << 10);
        return (v10 - 56613888);
      }
      int v11 = [NSString stringWithUTF8String:"-[NSString(TSWPAdditions) tswp_utf32CharacterAtIndex:planeClassification:]"];
      uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/TSNSStringAdditions.mm"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 1556, 0, "Invalid surrogate pair (single code point=0x%x, index=%lu)", v8, a3);
    }
    goto LABEL_20;
  }
  if ((v8 & 0xFC00) == 0xDC00)
  {
    if (a4) {
      *a4 = 2;
    }
    if (!a3)
    {
      NSUInteger v14 = [NSString stringWithUTF8String:"-[NSString(TSWPAdditions) tswp_utf32CharacterAtIndex:planeClassification:]"];
      NSUInteger v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/TSNSStringAdditions.mm"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 1529, 0, "Invalid surrogate pair (single code point=0x%x, index=%lu)", v8, 0);

LABEL_21:
      +[OITSUAssertionHandler logBacktraceThrottled];
      return v8;
    }
    int v9 = [a1 characterAtIndex:a3 - 1];
    if ((v9 & 0xFC00) == 0xD800)
    {
      int v10 = v8 + (v9 << 10);
      return (v10 - 56613888);
    }
    int v11 = [NSString stringWithUTF8String:"-[NSString(TSWPAdditions) tswp_utf32CharacterAtIndex:planeClassification:]"];
    uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/TSNSStringAdditions.mm"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 1537, 0, "Invalid surrogate pair (single code point=0x%x, index=%lu)", v8, a3);
LABEL_20:

    goto LABEL_21;
  }
  if (a4) {
    *a4 = 0;
  }
  return v8;
}

- (uint64_t)tswp_isLowerCaseFromIndex:()TSWPAdditions
{
  unint64_t v5 = [a1 length];
  uint64_t v6 = v5 - a3;
  if (v5 <= a3)
  {
    int v9 = [NSString stringWithUTF8String:"-[NSString(TSWPAdditions) tswp_isLowerCaseFromIndex:]"];
    int v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/TSNSStringAdditions.mm"];
    +[OITSUAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:1570 isFatal:0 description:"index is out of bounds"];

    +[OITSUAssertionHandler logBacktraceThrottled];
    return 1;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F08708] uppercaseLetterCharacterSet];
    BOOL v8 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v7, 2, a3, v6) == 0x7FFFFFFFFFFFFFFFLL;
  }
  return v8;
}

- (id)tswp_stringWithoutControlCharacters
{
  v1 = (void *)[a1 mutableCopy];
  uint64_t v2 = [MEMORY[0x263F08708] controlCharacterSet];
  while (1)
  {
    uint64_t v4 = [v1 rangeOfCharacterFromSet:v2];
    if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    objc_msgSend(v1, "deleteCharactersInRange:", v4, v3);
  }
  unint64_t v5 = (void *)[v1 copy];

  return v5;
}

@end