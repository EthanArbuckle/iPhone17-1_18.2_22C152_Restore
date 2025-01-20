@interface NSString(SCRCComposedCharacterStringExtras)
- (BOOL)scrc_containsNumberOfGlyphs:()SCRCComposedCharacterStringExtras;
- (BOOL)scrc_containsOnlyOneGlyph;
- (CFMutableStringRef)scrc_decodeUnicodeForKVO;
- (SCRCComposedCharEnumerator)scrc_composedCharacterEnumerator;
- (SCRCComposedCharacter)scrc_composedCharacterAtIndex:()SCRCComposedCharacterStringExtras;
- (__CFString)scrc_encodeUnicodeForKVO;
- (uint64_t)_countNumberOfGlyphs:()SCRCComposedCharacterStringExtras;
- (uint64_t)scrc_countNumberOfGlyphs;
@end

@implementation NSString(SCRCComposedCharacterStringExtras)

- (SCRCComposedCharacter)scrc_composedCharacterAtIndex:()SCRCComposedCharacterStringExtras
{
  if (CFStringGetLength(a1) <= a3)
  {
    v6 = 0;
  }
  else
  {
    CFRange RangeOfComposedCharactersAtIndex = CFStringGetRangeOfComposedCharactersAtIndex(a1, a3);
    if (RangeOfComposedCharactersAtIndex.length == 1)
    {
      v6 = [[SCRCComposedCharacter alloc] initWithCharacter:CFStringGetCharacterAtIndex(a1, a3)];
    }
    else
    {
      CFStringRef v7 = CFStringCreateWithSubstring(0, a1, RangeOfComposedCharactersAtIndex);
      v6 = [[SCRCComposedCharacter alloc] _initWithComposedCharacter:v7];
      if (v7) {
        CFRelease(v7);
      }
    }
  }
  return v6;
}

- (BOOL)scrc_containsOnlyOneGlyph
{
  CFIndex Length = CFStringGetLength(a1);
  return Length >= 1 && Length == CFStringGetRangeOfComposedCharactersAtIndex(a1, 0).length;
}

- (uint64_t)scrc_countNumberOfGlyphs
{
  return [a1 _countNumberOfGlyphs:5];
}

- (uint64_t)_countNumberOfGlyphs:()SCRCComposedCharacterStringExtras
{
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v6 = 0;
  unsigned int v7 = 0;
  do
  {
    unsigned int v8 = v7;
    if (v6 >= Length) {
      break;
    }
    if (v7 >= a3) {
      break;
    }
    CFRange RangeOfComposedCharactersAtIndex = CFStringGetRangeOfComposedCharactersAtIndex(a1, v6);
    unsigned int v7 = v8 + 1;
    CFIndex v6 = RangeOfComposedCharactersAtIndex.location + RangeOfComposedCharactersAtIndex.length;
  }
  while (RangeOfComposedCharactersAtIndex.length);
  return v8;
}

- (BOOL)scrc_containsNumberOfGlyphs:()SCRCComposedCharacterStringExtras
{
  return a3 <= 5 && [a1 _countNumberOfGlyphs:(a3 + 1)] == a3;
}

- (__CFString)scrc_encodeUnicodeForKVO
{
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  Mutable = CFStringCreateMutable(0, 0);
  CFStringNormalize(MutableCopy, kCFStringNormalizationFormD);
  unint64_t v10 = 0;
  v3 = SCRCCopyStringToUniCharArray(MutableCopy, &v10);
  CFStringRef v4 = CFStringCreateWithFormat(0, 0, @"%%0%lux", 4);
  unint64_t v5 = v10;
  if (v10)
  {
    uint64_t v6 = 0;
    unsigned int v7 = 1;
    do
    {
      CFStringAppendFormat(Mutable, 0, v4, *(unsigned __int16 *)&v3[2 * v6]);
      uint64_t v6 = v7;
    }
    while (v5 > v7++);
  }
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
  if (v4) {
    CFRelease(v4);
  }
  free(v3);
  return Mutable;
}

- (CFMutableStringRef)scrc_decodeUnicodeForKVO
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  CFIndex Length = CFStringGetLength(a1);
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  if ((Length & 3) != 0)
  {
LABEL_2:
    if (Mutable)
    {
      CFRelease(Mutable);
      CFMutableStringRef Mutable = 0;
    }
  }
  else if (Length >= 1)
  {
    for (CFIndex i = 0; i < Length; i += 4)
    {
      v13.location = i;
      v13.length = 4;
      CFStringGetCharacters(a1, v13, buffer);
      uint64_t v5 = 0;
      unsigned __int16 v6 = 0;
      do
      {
        int v7 = buffer[v5];
        __int16 v8 = v7 - 48;
        if ((v7 - 48) >= 0xA)
        {
          if ((v7 - 97) > 5 && (v7 - 65) > 5) {
            goto LABEL_2;
          }
          __int16 v8 = v7 - 87;
        }
        ++v5;
        unsigned __int16 v6 = v8 | (16 * v6);
      }
      while (v5 != 4);
      CFStringAppendFormat(Mutable, 0, @"%C", v6);
    }
  }
  return Mutable;
}

- (SCRCComposedCharEnumerator)scrc_composedCharacterEnumerator
{
  v1 = (__CFString *)[a1 mutableCopy];
  CFStringNormalize(v1, kCFStringNormalizationFormD);
  v2 = [[SCRCComposedCharEnumerator alloc] initWithString:v1];

  return v2;
}

@end