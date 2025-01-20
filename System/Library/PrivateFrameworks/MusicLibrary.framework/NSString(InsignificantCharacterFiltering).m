@interface NSString(InsignificantCharacterFiltering)
- (CFIndex)_rangeWithoutInsignificantPrefix:()InsignificantCharacterFiltering andCharacters:;
- (CFStringRef)_copyWithoutInsignificantPrefix:()InsignificantCharacterFiltering andCharacters:;
- (id)MLSortString;
- (id)MLSortStringWithPrefix;
- (uint64_t)copyWithoutInsignificantCharacters;
- (uint64_t)copyWithoutInsignificantPrefixAndCharacters;
@end

@implementation NSString(InsignificantCharacterFiltering)

- (id)MLSortStringWithPrefix
{
  v2 = (void *)[a1 copyWithoutInsignificantCharacters];
  if ([v2 isEqualToString:a1]) {
    id v3 = 0;
  }
  else {
    id v3 = v2;
  }

  return v3;
}

- (id)MLSortString
{
  v2 = (void *)[a1 copyWithoutInsignificantPrefixAndCharacters];
  if ([v2 isEqualToString:a1]) {
    id v3 = 0;
  }
  else {
    id v3 = v2;
  }

  return v3;
}

- (uint64_t)copyWithoutInsignificantCharacters
{
  return [a1 _copyWithoutInsignificantPrefix:0 andCharacters:1];
}

- (uint64_t)copyWithoutInsignificantPrefixAndCharacters
{
  return [a1 _copyWithoutInsignificantPrefix:1 andCharacters:1];
}

- (CFStringRef)_copyWithoutInsignificantPrefix:()InsignificantCharacterFiltering andCharacters:
{
  uint64_t v1 = -[__CFString _rangeWithoutInsignificantPrefix:andCharacters:](a1, "_rangeWithoutInsignificantPrefix:andCharacters:");
  if (!v2
    || (CFIndex v3 = v1, v4 = v2, !v1) && v2 == CFStringGetLength(a1)
    || (v8.location = v3, v8.length = v4, (CFStringRef result = CFStringCreateWithSubstring(0, a1, v8)) == 0))
  {
    return a1;
  }
  return result;
}

- (CFIndex)_rangeWithoutInsignificantPrefix:()InsignificantCharacterFiltering andCharacters:
{
  CFIndex Length = CFStringGetLength(a1);
  unint64_t v8 = Length;
  if (!a3)
  {
    CFIndex v15 = 0;
    CFIndex v16 = Length;
    if (!a4) {
      return v15;
    }
    goto LABEL_15;
  }
  if (IgnorableArticles_onceToken != -1) {
    dispatch_once(&IgnorableArticles_onceToken, &__block_literal_global_115);
  }
  CFArrayRef v9 = (const __CFArray *)(id)IgnorableArticles_articles;
  CFIndex Count = CFArrayGetCount(v9);
  if (Count < 1)
  {
LABEL_10:
    CFIndex v15 = 0;
    CFIndex v16 = v8;
  }
  else
  {
    CFIndex v11 = Count;
    CFIndex v12 = 0;
    while (1)
    {
      CFArrayGetValueAtIndex(v9, v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      unint64_t v14 = CFStringGetLength(v13);
      if (v8 >= v14)
      {
        v27.length = v14;
        v26.location = 0;
        v26.length = 0;
        v27.location = 0;
        if (CFStringFindWithOptions(a1, v13, v27, 9uLL, &v26))
        {
          if (!v26.location) {
            break;
          }
        }
      }

      if (v11 == ++v12) {
        goto LABEL_10;
      }
    }
    CFIndex v15 = v26.length;
    CFIndex v16 = v8 - v26.length;
  }
  if (a4)
  {
LABEL_15:
    v17 = (void *)ValidFirstCharacterSet_chars;
    if (!ValidFirstCharacterSet_chars)
    {
      v18 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
      uint64_t v19 = [v18 mutableCopy];
      v20 = (void *)ValidFirstCharacterSet_chars;
      ValidFirstCharacterSet_chars = v19;

      [(id)ValidFirstCharacterSet_chars removeCharactersInString:@" "];
      v17 = (void *)ValidFirstCharacterSet_chars;
    }
    CFCharacterSetRef v21 = v17;
    if (v16)
    {
      UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(a1, v15);
      if (CFCharacterSetIsCharacterMember(v21, CharacterAtIndex))
      {
        uint64_t v23 = 1;
        uint64_t v24 = v15;
      }
      else
      {
        uint64_t v24 = -[__CFString rangeOfCharacterFromSet:options:range:](a1, "rangeOfCharacterFromSet:options:range:", v21, 0, v15, v16);
      }
      if (v24 != 0x7FFFFFFFFFFFFFFFLL && v23 != 0) {
        CFIndex v15 = v24;
      }
    }
  }
  return v15;
}

@end