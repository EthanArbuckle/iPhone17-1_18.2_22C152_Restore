uint64_t attributeDictionaryIsEqual(id a1, id a2)
{
  BOOL v4;
  id v5;
  id v6;
  uint64_t vars8;

  if (a1) {
    v4 = object_getClass(a1) == (Class)attributeDictionaryClass;
  }
  else {
    v4 = 0;
  }
  if (a1 == a2) {
    return 1;
  }
  if (v4) {
    v5 = a1;
  }
  else {
    v5 = a2;
  }
  if (v4) {
    v6 = a2;
  }
  else {
    v6 = a1;
  }

  return [v5 isEqualToDictionary:v6];
}

void sub_18E4EB6B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t attributeDictionaryHash(char *a1)
{
  values[100] = *(void **)MEMORY[0x1E4F143B8];
  for (char i = attributeDictionaryHash_preTigerHash; ; attributeDictionaryHash_preTigerHash = i)
  {
    if (i == 1)
    {
      uint64_t v8 = [a1 count];
      uint64_t v9 = objc_msgSend((id)objc_msgSend(a1, "objectForKey:", @"NSFont"), "hash") + v8;
      uint64_t v10 = objc_msgSend((id)objc_msgSend(a1, "objectForKey:", @"NSParagraphStyle"), "hash");
      return v9 + v10 + objc_msgSend((id)objc_msgSend(a1, "objectForKey:", @"NSColor"), "hash");
    }
    if (!i) {
      break;
    }
    char i = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSPreTigerAttributedStringHash");
  }
  if (a1
    && ((Class Class = object_getClass(a1), Class != (Class)attributeDictionaryClass)
      ? (BOOL v4 = Class == (Class)tempAttributeDictionaryClass)
      : (BOOL v4 = 1),
        v4))
  {
    if (!*((void *)a1 + 1)) {
      return 0;
    }
    unint64_t v5 = 0;
    uint64_t v6 = 0;
    v7 = (id *)(a1 + 16);
    do
    {
      v6 += [v7[2] hash];
      ++v5;
      v7 += 3;
    }
    while (v5 < *((void *)a1 + 1));
  }
  else
  {
    CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)a1);
    uint64_t v12 = Count;
    if (Count <= 100)
    {
      CFDictionaryGetKeysAndValues((CFDictionaryRef)a1, 0, (const void **)values);
      if (v12 >= 1)
      {
        uint64_t v6 = 0;
        v13 = values;
        do
        {
          v14 = *v13++;
          v6 += [v14 hash];
          --v12;
        }
        while (v12);
        return v6;
      }
      return 0;
    }
    v15 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    CFDictionaryGetKeysAndValues((CFDictionaryRef)a1, 0, v15);
    uint64_t v16 = 0;
    uint64_t v6 = 0;
    do
      v6 += [(id)v15[v16++] hash];
    while (v12 != v16);
    free(v15);
  }
  return v6;
}

uint64_t __CTFontGetExtraData(const __CTFont *a1)
{
  uint64_t ClientObject = CTFontGetClientObject();
  if (!ClientObject)
  {
    v3 = -[__NSFontExtraData initWithFont:]([__NSFontExtraData alloc], a1);
    os_unfair_lock_lock((os_unfair_lock_t)&__CTFontExtraDataLock);
    uint64_t ClientObject = CTFontGetClientObject();
    if (!ClientObject)
    {
      CTFontSetClientObject();
      uint64_t ClientObject = (uint64_t)v3;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&__CTFontExtraDataLock);
  }
  return ClientObject;
}

void sub_18E4EC428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v35 - 200), 8);
  _Block_object_dispose((const void *)(v35 - 168), 8);
  _Unwind_Resume(a1);
}

double _flushFactorFromAlignment(unint64_t a1, NSWritingDirection IsRightToLeft, uint64_t a3, int a4, int a5)
{
  if (a1 > 1)
  {
    uint64_t v6 = 2;
    if (a1 == 2) {
      uint64_t v6 = 3;
    }
    if (!a5) {
      uint64_t v6 = a1;
    }
  }
  else
  {
    if (IsRightToLeft == NSWritingDirectionNatural)
    {
      if (a4) {
        IsRightToLeft = (unint64_t)CTLineIsRightToLeft();
      }
      else {
        IsRightToLeft = +[NSParagraphStyle defaultWritingDirectionForLanguage:0];
      }
    }
    uint64_t v6 = 2;
    if (IsRightToLeft == NSWritingDirectionRightToLeft) {
      uint64_t v7 = 3;
    }
    else {
      uint64_t v7 = 2;
    }
    if (IsRightToLeft != NSWritingDirectionRightToLeft) {
      uint64_t v6 = 3;
    }
    if (a1 != 1) {
      uint64_t v6 = v7;
    }
  }
  double result = 0.0;
  if (v6 == 3) {
    double result = 1.0;
  }
  if (v6 == 4) {
    return 0.5;
  }
  return result;
}

NSTextAlignment NSTextAlignmentFromCTTextAlignment(CTTextAlignment ctTextAlignment)
{
  NSTextAlignment v1 = (unint64_t)ctTextAlignment;
  if (ctTextAlignment == kCTTextAlignmentRight) {
    NSTextAlignment v1 = NSTextAlignmentRight;
  }
  if (ctTextAlignment == kCTTextAlignmentCenter) {
    return 1;
  }
  else {
    return v1;
  }
}

CTTextAlignment NSTextAlignmentToCTTextAlignment(NSTextAlignment nsTextAlignment)
{
  if (nsTextAlignment == NSTextAlignmentCenter) {
    CTTextAlignment v1 = kCTTextAlignmentCenter;
  }
  else {
    CTTextAlignment v1 = nsTextAlignment;
  }
  if (nsTextAlignment == NSTextAlignmentRight) {
    return 1;
  }
  else {
    return v1;
  }
}

uint64_t NSDefaultFont()
{
  if (NSDefaultFont_onceToken != -1) {
    dispatch_once(&NSDefaultFont_onceToken, &__block_literal_global_15);
  }
  return NSDefaultFont__defaultFont;
}

uint64_t initUIGraphicsGetCurrentContext()
{
  v0 = (void *)__NSGetFrameworkReference(0, 0);
  CTTextAlignment v1 = (uint64_t (*)())dlsym(v0, "UIGraphicsGetCurrentContext");
  softLinkUIGraphicsGetCurrentContext[0] = v1;
  if (!v1) {
    initUIGraphicsGetCurrentContext_cold_1();
  }

  return v1();
}

uint64_t initUIGraphicsGetCurrentContext_0()
{
  v0 = (void *)__NSGetFrameworkReference(0, 0);
  CTTextAlignment v1 = (uint64_t (*)())dlsym(v0, "UIGraphicsGetCurrentContext");
  softLinkUIGraphicsGetCurrentContext_0 = v1;
  if (!v1) {
    initUIGraphicsGetCurrentContext_cold_1_0();
  }

  return v1();
}

uint64_t __attributedStringAtKeyframe_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

void sub_18E4F0E38(_Unwind_Exception *a1)
{
}

uint64_t __NSUltraFastLineBreakFinder(CFStringRef theString, uint64_t a2, unsigned char *a3, unsigned char *a4)
{
  if (__NSUltraFastLineBreakFinder_once != -1) {
    dispatch_once(&__NSUltraFastLineBreakFinder_once, &__block_literal_global_22);
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v40 = 0u;
  CFStringRef theStringa = theString;
  uint64_t v50 = 0;
  int64_t v51 = a2;
  CharactersPtr = CFStringGetCharactersPtr(theString);
  CStringPtr = 0;
  v48 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(theString, 0x600u);
  }
  int64_t v52 = 0;
  int64_t v53 = 0;
  v49 = CStringPtr;
  if (a2 < 1)
  {
    char v14 = 0;
    int64_t v13 = 0;
    char v17 = 1;
    if (a3) {
      goto LABEL_72;
    }
    goto LABEL_73;
  }
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  int64_t v12 = 0;
  int64_t v13 = 0;
  char v14 = 0;
  uint64_t v15 = 64;
  p_cache = (void **)(UICTFont + 16);
  char v17 = 1;
  do
  {
    if ((unint64_t)v13 >= 4) {
      uint64_t v18 = 4;
    }
    else {
      uint64_t v18 = v13;
    }
    if (v51 <= v13)
    {
      UniChar v19 = 0;
      unsigned int v20 = 0;
LABEL_43:
      if (a3) {
        BOOL v31 = v19 == 9;
      }
      else {
        BOOL v31 = 0;
      }
      char v32 = !v31;
      v17 &= v32;
      goto LABEL_50;
    }
    if (v48)
    {
      UniChar v19 = v48[v13 + v50];
    }
    else if (v49)
    {
      UniChar v19 = v49[v50 + v13];
    }
    else
    {
      if (v53 <= v13 || v12 > v13)
      {
        uint64_t v22 = -v18;
        uint64_t v23 = v18 + v10;
        uint64_t v24 = v15 - v18;
        int64_t v25 = v13 + v22;
        int64_t v26 = v25 + 64;
        if (v25 + 64 >= v51) {
          int64_t v26 = v51;
        }
        int64_t v52 = v25;
        int64_t v53 = v26;
        v27.location = v25 + v50;
        if (v51 >= v24) {
          uint64_t v28 = v24;
        }
        else {
          uint64_t v28 = v51;
        }
        v27.length = v28 + v23;
        CFStringGetCharacters(theStringa, v27, buffer);
        p_cache = UICTFont.cache;
        uint64_t v11 = v52;
      }
      UniChar v19 = buffer[v13 - v11];
      int64_t v12 = v11;
    }
    unsigned int v20 = v19;
    if ((v19 & 0xFF70) == 0)
    {
      BOOL v30 = v19 > 0xDu || ((1 << v19) & 0x3400) == 0;
      if (!v30 || v19 == 133) {
        goto LABEL_71;
      }
      goto LABEL_43;
    }
    if (v19 >= 0x100u)
    {
      if ((unsigned __int16)(v19 & 0xFFFE) >> 1 == 4116 && (v19 & 0xFF00) == 0x2000) {
        goto LABEL_71;
      }
      if (((a3 != 0) & v17) == 1)
      {
        v29 = (unsigned __int8 *)p_cache[285];
        if (v29 && ((v29[(unint64_t)v19 >> 3] >> (v19 & 7)) & 1) != 0
          || __NSUltraFastLineBreakFinder_punctuationBMP
          && ((*(unsigned __int8 *)(__NSUltraFastLineBreakFinder_punctuationBMP + ((unint64_t)v19 >> 3)) >> (v19 & 7)) & 1) != 0)
        {
          char v17 = 1;
        }
        else if (__NSUltraFastLineBreakFinder_alphaNumericBMP {
               && (int v34 = 1 << (v19 & 7),
        }
                   (v34 & *(unsigned char *)(__NSUltraFastLineBreakFinder_alphaNumericBMP
                                                    + ((unint64_t)v19 >> 3))) != 0)
               && (!__NSUltraFastLineBreakFinder_nonBaseBMP
                || (v34 & *(unsigned char *)(__NSUltraFastLineBreakFinder_nonBaseBMP
                                                    + ((unint64_t)v19 >> 3))) == 0))
        {
          BOOL v35 = (unsigned __int16)((unsigned __int16)(v19 - 1424) >> 4) > 0x176u
             && (unsigned __int16)(v19 + 23344) > 0x72Fu;
          int v36 = v19 >> 7;
          char v17 = v35 && v36 != 431;
        }
        else
        {
          char v17 = 0;
        }
      }
    }
LABEL_50:
    if (__NSUltraFastLineBreakFinder_strongRightBMP) {
      int v33 = (*(unsigned __int8 *)(__NSUltraFastLineBreakFinder_strongRightBMP + ((unint64_t)v20 >> 3)) >> (v20 & 7)) & 1;
    }
    else {
      LOBYTE(v33) = 0;
    }
    v14 |= v33;
    ++v13;
    --v10;
    ++v15;
  }
  while (a2 != v13);
  int64_t v13 = a2;
LABEL_71:
  if (a3) {
LABEL_72:
  }
    *a3 = v17 & 1;
LABEL_73:
  if (a4) {
    *a4 = v14 & 1;
  }
  return v13;
}

uint64_t __NSCoreTypesetterTruncateLine(uint64_t a1, CTLineRef *a2, void *a3, uint64_t a4, unsigned int a5, double *a6, double *a7, double a8)
{
  CTLineRef v15 = *a2;
  double TypographicBounds = *a6;
  if (a4 == 4) {
    uint64_t v17 = a5;
  }
  else {
    uint64_t v17 = 0;
  }
  if (v17 == 1)
  {
    CTLineGetStringRange(*a2);
    uint64_t HyphenatedLineWithOffset = CTLineCreateHyphenatedLineWithOffset();
    if (HyphenatedLineWithOffset)
    {
      UniChar v19 = (const __CTLine *)HyphenatedLineWithOffset;
      CFRelease(v15);
      double TypographicBounds = CTLineGetTypographicBounds(v19, 0, 0, 0);
      *a2 = v19;
      *a6 = TypographicBounds;
      CTLineRef v15 = v19;
    }
  }
  if ((unint64_t)(a4 - 3) > 2) {
    return v17;
  }
  BOOL v20 = a8 <= 0.0 || v15 == 0;
  BOOL v21 = v20 || TypographicBounds <= a8;
  if (v21 || CTLineGetGlyphCount(v15) < 2) {
    return v17;
  }
  if (a3)
  {
    if ([a3 allowsDefaultTighteningForTruncation])
    {
      int v22 = 1;
      goto LABEL_24;
    }
    [a3 tighteningFactorForTruncation];
  }
  else
  {
    if ([+[NSParagraphStyle defaultParagraphStyle] allowsDefaultTighteningForTruncation])
    {
      int v22 = 1;
      goto LABEL_24;
    }
    [+[NSParagraphStyle defaultParagraphStyle] tighteningFactorForTruncation];
  }
  int v22 = 0;
  if ((v23 + 1.0) * a8 >= TypographicBounds)
  {
LABEL_24:
    JustifiedLineWithOptions = (const __CTLine *)CTLineCreateJustifiedLineWithOptions();
    if (JustifiedLineWithOptions)
    {
      TruncatedLineWithTokenHandler = JustifiedLineWithOptions;
      double v26 = CTLineGetTypographicBounds(JustifiedLineWithOptions, 0, 0, 0);
      if (v26 - CTLineGetTrailingWhitespaceWidth(TruncatedLineWithTokenHandler) <= a8)
      {
LABEL_37:
        CFRelease(v15);
        double v29 = CTLineGetTypographicBounds(TruncatedLineWithTokenHandler, 0, 0, 0);
        double TrailingWhitespaceWidth = CTLineGetTrailingWhitespaceWidth(TruncatedLineWithTokenHandler);
        *a2 = TruncatedLineWithTokenHandler;
        *a6 = v29 - TrailingWhitespaceWidth;
        *a7 = TrailingWhitespaceWidth;
        return v17;
      }
      CFRelease(TruncatedLineWithTokenHandler);
    }
  }
  char v32 = *(void **)(a1 + 40);
  CFTypeRef v27 = CFRetain(v15);
  uint64_t v44 = 0;
  long long v45 = &v44;
  uint64_t v46 = 0x3010000000;
  v47 = "";
  long long v48 = xmmword_18E5F72A0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3810000000;
  long long v40 = "a";
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  uint64_t v33 = 0;
  int v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 1;
  if (v22 && (uint64_t v28 = (const void *)CTLineCreateJustifiedLineWithOptions()) != 0) {
    CFRelease(v27);
  }
  else {
    uint64_t v28 = v27;
  }
  TruncatedLineWithTokenHandler = (const __CTLine *)CTLineCreateTruncatedLineWithTokenHandler();
  if (TruncatedLineWithTokenHandler && v32 && v45[4] != 0x7FFFFFFFFFFFFFFFLL && v45[5])
  {
    objc_msgSend(v32, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:"));
    uint64_t v17 = 1;
  }
  __NSCoreTypesetterTruncationTokenContextDeallocate((uint64_t)(v38 + 4));
  *((unsigned char *)v34 + 24) = 0;
  CFRelease(v28);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v44, 8);
  if (TruncatedLineWithTokenHandler) {
    goto LABEL_37;
  }
  return v17;
}

void sub_18E4F2080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t rangeOfParagraphSeparatorAtIndex(unint64_t a1, UniChar *buffer, uint64_t a3)
{
  if (a3 < a1)
  {
    uint64_t v4 = a3 + 1;
    if (a3 >= -1 && v4 < a1)
    {
      uint64_t v6 = *((void *)buffer + 20);
      if (v6 > v4)
      {
        uint64_t v7 = *((void *)buffer + 17);
        if (v7)
        {
          UniChar v8 = *(_WORD *)(v7 + 2 * (*((void *)buffer + 19) + v4));
        }
        else
        {
          uint64_t v9 = *((void *)buffer + 18);
          if (v9)
          {
            UniChar v8 = *(char *)(v9 + *((void *)buffer + 19) + v4);
          }
          else
          {
            if (*((void *)buffer + 22) <= v4 || (uint64_t v10 = *((void *)buffer + 21), v10 > v4))
            {
              uint64_t v11 = a3 - 3;
              if ((unint64_t)a3 < 3) {
                uint64_t v11 = 0;
              }
              if (v11 + 64 < v6) {
                uint64_t v6 = v11 + 64;
              }
              *((void *)buffer + 21) = v11;
              *((void *)buffer + 22) = v6;
              CFStringRef v12 = (const __CFString *)*((void *)buffer + 16);
              v17.location = *((void *)buffer + 19) + v11;
              v17.length = v6 - v11;
              CFStringGetCharacters(v12, v17, buffer);
              uint64_t v10 = *((void *)buffer + 21);
            }
            UniChar v8 = buffer[v4 - v10];
          }
        }
        if (v8 == 10)
        {
          uint64_t v13 = *((void *)buffer + 20);
          if (v13 > a3 && !*((void *)buffer + 17) && !*((void *)buffer + 18))
          {
            if (*((void *)buffer + 22) <= a3 || (uint64_t v14 = *((void *)buffer + 21), v14 > a3))
            {
              uint64_t v15 = a3 - 4;
              if ((unint64_t)a3 < 4) {
                uint64_t v15 = 0;
              }
              if (v15 + 64 < v13) {
                uint64_t v13 = v15 + 64;
              }
              *((void *)buffer + 21) = v15;
              *((void *)buffer + 22) = v13;
              v18.location = *((void *)buffer + 19) + v15;
              v18.length = v13 - v15;
              CFStringGetCharacters(*((CFStringRef *)buffer + 16), v18, buffer);
            }
          }
        }
      }
    }
  }
  return a3;
}

double __NSCoreTypesetterAdjustLineHeightAndBaselineForTextAttachments(const __CTLine *a1, double *a2, double *a3)
{
  CFArrayRef GlyphRuns = CTLineGetGlyphRuns(a1);
  CFIndex Count = CFArrayGetCount(GlyphRuns);
  double v7 = *a3;
  double v8 = *a3 - *a2;
  if (Count >= 1)
  {
    CFIndex v9 = Count;
    CFIndex v10 = 0;
    int v11 = 0;
    CFStringRef v12 = (const void *)*MEMORY[0x1E4F247B0];
    uint64_t v13 = (const void *)*MEMORY[0x1E4F243C0];
    do
    {
      ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, v10);
      if (CTRunGetStringRange(ValueAtIndex).length == 1)
      {
        CFDictionaryRef Attributes = CTRunGetAttributes(ValueAtIndex);
        if (CFDictionaryGetValue(Attributes, v12) || CFDictionaryGetValue(Attributes, v13))
        {
          double v18 = 0.0;
          CGFloat ascent = 0.0;
          v20.location = 0;
          v20.length = 0;
          CTRunGetTypographicBounds(ValueAtIndex, v20, &ascent, &v18, 0);
          BOOL v16 = v8 > -v18;
          if (v8 > -v18) {
            double v8 = -v18;
          }
          if (ascent > v7)
          {
            double v7 = ascent;
            BOOL v16 = 1;
          }
          v11 |= v16;
        }
      }
      ++v10;
    }
    while (v9 != v10);
  }
  *a3 = v7;
  double result = v7 - v8;
  *a2 = v7 - v8;
  return result;
}

void __NSCoreTypesetterTruncationTokenContextDeallocate(uint64_t a1)
{
  v2 = *(const void **)(a1 + 16);
  if (v2)
  {
    CFRelease(v2);
  }
}

double __NSStringDrawingEngine(__CFString *a1, void *a2, uint64_t a3, unsigned int a4, void *a5, void *a6, unsigned char *a7, CGFloat a8, CGFloat a9, CGFloat a10, CGFloat a11, double a12)
{
  uint64_t v13 = a5;
  if (!a5)
  {
    if (__NSSharedStringDrawingContext_onceToken != -1) {
      dispatch_once(&__NSSharedStringDrawingContext_onceToken, &__block_literal_global_378);
    }
    uint64_t v13 = (void *)__NSSharedStringDrawingContext_sharedStringDrawingContext;
  }
  uint64_t v149 = [v13 applicationFrameworkContext];
  CFStringRef v20 = a1;
  if (a2)
  {
    if (a1)
    {
LABEL_7:
      CFIndex Length = CFStringGetLength(v20);
      goto LABEL_10;
    }
  }
  else
  {
    CFStringRef v20 = (const __CFString *)[(__CFString *)a1 string];
    if (v20) {
      goto LABEL_7;
    }
  }
  CFIndex Length = 0;
LABEL_10:
  int v22 = [v13 wantsMultilineDeviceMetrics];
  if (__NSStringDrawingEngine_onceToken != -1) {
    dispatch_once(&__NSStringDrawingEngine_onceToken, &__block_literal_global_348);
  }
  unint64_t v150 = a3 & 0x800;
  uint64_t v23 = [v13 activeRenderers];
  uint64_t v24 = __NSStringDrawingDefaultRendererConfiguration;
  if (v23) {
    uint64_t v24 = v23;
  }
  unint64_t v25 = 2;
  if (v22) {
    uint64_t v24 = 2;
  }
  unint64_t v26 = v24 & 0xFFFFFFFFFFFFFFFCLL;
  if (!v22) {
    unint64_t v25 = v24 & 0xFFFFFFFFFFFFFFFCLL;
  }
  if ((a3 & 8) != 0) {
    uint64_t v24 = v25;
  }
  char v141 = v22;
  if ((a3 & 0x100) != 0)
  {
    if (__NSStringDrawingEngine_onceToken_357 != -1) {
      dispatch_once(&__NSStringDrawingEngine_onceToken_357, &__block_literal_global_359);
    }
    double v27 = *(double *)&__NSStringDrawingEngine__factor;
  }
  else
  {
    double v27 = 0.0;
    unint64_t v26 = v24;
  }
  uint64_t v28 = (double *)MEMORY[0x1E4F28AD8];
  if ((a3 & 0x800) != 0) {
    uint64_t v29 = 8;
  }
  else {
    uint64_t v29 = v26;
  }
  if (v13)
  {
    [v13 setActualScaleFactor:1.0];
    [v13 setBaselineOffset:0.0];
    [v13 setFirstBaselineOffset:0.0];
  }
  double v30 = *v28;
  double v31 = v28[1];
  uint64_t v146 = a3 & 2;
  double v33 = v28[2];
  double v32 = v28[3];
  if (Length < 1)
  {
    if (a6) {
      BOOL v40 = v13 == 0;
    }
    else {
      BOOL v40 = 0;
    }
    int v41 = !v40;
    if ((a3 & 8) == 0 && v41)
    {
      uint64_t v42 = [a2 objectForKeyedSubscript:@"NSParagraphStyle"];
      double v164 = 0.0;
      double v172 = 0.0;
      +[NSCoreTypesetter _lineMetricsForAttributes:typesetterBehavior:usesFontLeading:applySpacings:usesSystemFontLeading:usesNegativeFontLeading:layoutOrientation:lineHeight:baselineOffset:spacing:](NSCoreTypesetter, "_lineMetricsForAttributes:typesetterBehavior:usesFontLeading:applySpacings:usesSystemFontLeading:usesNegativeFontLeading:layoutOrientation:lineHeight:baselineOffset:spacing:", a2, [NSString typesetterBehavior], v146 != 0, v42 != 0, 0, 0, 0, &v164, &v172, 0);
      double v30 = *MEMORY[0x1E4F28AD0];
      double v43 = v164;
      double v44 = (a3 & 1) != 0 ? *(double *)(MEMORY[0x1E4F28AD0] + 8) : v172 - v164;
      if (v13)
      {
        [v13 setNumberOfLineFragments:0];
        objc_msgSend(v13, "setTotalBounds:", v30, v44, 0.0, v43);
        if ([v13 wantsBaselineOffset])
        {
          [v13 setBaselineOffset:v172];
          [v13 setFirstBaselineOffset:v172];
        }
      }
    }
    return v30;
  }
  unint64_t v179 = 0;
  CFIndex v180 = Length;
  if (!a2) {
    a2 = (void *)[(__CFString *)a1 attributesAtIndex:0 effectiveRange:&v179];
  }
  if ([a2 objectForKey:@"NSTextAnimation"])
  {
    uint64_t v34 = softLinkSwiftUITextAnimationProviderClass();
    if (v34)
    {
      uint64_t v35 = (void *)v34;
      if (objc_opt_respondsToSelector())
      {
        objc_msgSend(v35, "drawStaticString:withAttributes:options:inRect:withPadding:forceClipping:cgContext:stringDrawingContext:", a1, a2, a3, a4, objc_msgSend(a6, "CGContext"), v13, a8, a9, a10, a11, a12);
        return v36;
      }
    }
  }
  v142 = a6;
  uint64_t v37 = (NSParagraphStyle *)[a2 objectForKey:@"NSParagraphStyle"];
  v38 = v37;
  if (a4) {
    uint64_t v39 = 2;
  }
  else {
    uint64_t v39 = [(NSParagraphStyle *)v37 lineBreakMode];
  }
  int v144 = ((a3 & 0x20) != 0) & a3;
  char v178 = 0;
  char v143 = [v13 drawsDebugBaselines];
  if ((a3 & 0x100000) == 0 && v149 != 2)
  {
    BOOL v46 = [v13 maximumNumberOfLines] == 1 && v39 < 2;
    if ((a3 & 1) != 0 && !v46) {
      goto LABEL_65;
    }
LABEL_72:
    if (v39 <= 2) {
      uint64_t v39 = 2;
    }
    uint64_t v50 = __NSUltraFastLineBreakFinder(v20, Length, 0, &v178);
    if (!v50)
    {
      if (v13)
      {
        [v13 setNumberOfLineFragments:0];
        objc_msgSend(v13, "setTotalBounds:", v30, v31, v33, v32);
      }
      return v30;
    }
    uint64_t v47 = v50;
    v134 = v38;
    BOOL v49 = 0;
    int v48 = 1;
    a11 = 0.0;
    goto LABEL_76;
  }
  if ((a3 & 1) == 0) {
    goto LABEL_72;
  }
LABEL_65:
  v134 = v38;
  if ([v13 wrapsForTruncationMode] && v39 >= 2)
  {
    if ([v13 maximumNumberOfLines] != 1) {
      uint64_t v39 = 0;
    }
    int v144 = 1;
  }
  uint64_t v47 = __NSUltraFastLineBreakFinder(v20, Length, 0, &v178);
  int v48 = 0;
  BOOL v49 = v47 == 0;
LABEL_76:
  unint64_t v139 = a3 & 0x200;
  uint64_t v140 = (uint64_t)v20;
  double v137 = a8;
  unint64_t v138 = a3 & 0x400;
  if (v47 < Length) {
    double v27 = 0.0;
  }
  if (v143)
  {
    double v135 = v30;
    int64_t v51 = 0;
LABEL_80:
    int64_t v52 = v142;
    unint64_t v53 = v146;
LABEL_148:
    double v84 = a10;
    double v172 = 0.0;
    v173 = &v172;
    uint64_t v174 = 0x3052000000;
    v175 = __Block_byref_object_copy__10;
    v176 = __Block_byref_object_dispose__10;
    uint64_t v177 = 0;
    double v85 = a11;
    if ((v48 | v144 ^ 1) == 1)
    {
      if (__NSSharedStringDrawingContext_onceToken != -1) {
        dispatch_once(&__NSSharedStringDrawingContext_onceToken, &__block_literal_global_378);
      }
      if (v13 == (void *)__NSSharedStringDrawingContext_sharedStringDrawingContext)
      {
        double v85 = 9000000.0;
      }
      else if ([v13 maximumNumberOfLines] == 1)
      {
        double v85 = 9000000.0;
      }
      else
      {
        double v85 = a11;
      }
    }
    CGFloat v86 = a11;
    double v87 = v27;
    double v88 = 10000000.0;
    if (v84 > 0.0) {
      double v88 = v84;
    }
    if (a4) {
      double v89 = 40000.0;
    }
    else {
      double v89 = v88;
    }
    double v164 = 0.0;
    v165 = &v164;
    uint64_t v166 = 0x4010000000;
    v167 = "";
    double v168 = v135;
    double v169 = v31;
    double v170 = v33;
    double v171 = v32;
    [NSString setUsesFontLeading:v53 != 0];
    [NSString setUsesScreenFonts:0];
    v154[0] = MEMORY[0x1E4F143A8];
    v154[1] = 3221225472;
    v154[2] = ____NSStringDrawingEngine_block_invoke_374;
    v154[3] = &unk_1E55C7598;
    char v155 = v48;
    v154[10] = v140;
    v154[11] = v47;
    v154[12] = Length;
    v154[4] = a1;
    v154[5] = a2;
    *(double *)&v154[13] = v89;
    *(double *)&v154[14] = v85;
    char v156 = v144;
    *(double *)&v154[15] = v87;
    char v157 = v143;
    char v158 = v139 >> 9;
    char v159 = v138 >> 10;
    char v160 = v150 >> 11;
    char v161 = v53 >> 1;
    v154[6] = v13;
    v154[7] = v52;
    BOOL v162 = v149 == 2;
    v154[16] = v149;
    v154[17] = v51;
    *(double *)&v154[18] = v137;
    *(CGFloat *)&v154[19] = a9;
    *(double *)&v154[20] = v84;
    *(CGFloat *)&v154[21] = v86;
    char v163 = a4;
    *(double *)&v154[22] = a12;
    v154[8] = &v172;
    v154[9] = &v164;
    v154[23] = a7;
    +[NSStringDrawingTextStorage performLayoutOperation:v154];

    double v30 = v165[4];
    _Block_object_dispose(&v164, 8);
    _Block_object_dispose(&v172, 8);
    return v30;
  }
  int64_t v51 = 0;
  if ((v49 & ~v48) != 0) {
    v29 &= ~2uLL;
  }
  if ((v29 & 3) == 0 || v27 != 0.0)
  {
LABEL_102:
    double v135 = v30;
    if ([a2 objectForKey:*MEMORY[0x1E4F24368]]) {
      __UIFoundationWriteLog((uint64_t)"StringDrawing", OS_LOG_TYPE_ERROR, (uint64_t)"Can't draw encapsulation for string \"%@\" because it was disqualified from Core Text rendering paths!", v61, v62, v63, v64, v65, v140);
    }
    uint64_t v66 = [NSString typesetterBehavior];
    if (v47 == Length) {
      int v67 = 1;
    }
    else {
      int v67 = v48;
    }
    if ((v29 & 4) == 0 || !v67) {
      goto LABEL_80;
    }
    uint64_t v133 = v66;
    BOOL v69 = a10 > 0.0 && v39 < 2;
    BOOL v131 = v69;
    unint64_t v53 = a3 & 2;
    if (!v69) {
      goto LABEL_122;
    }
    int v70 = v48;
    if (!a2) {
      goto LABEL_120;
    }
    v71 = (void *)[a2 objectForKey:@"NSFont"];
    if (objc_msgSend((id)objc_msgSend(a2, "objectForKey:", @"CTVerticalForms"), "BOOLValue")) {
      v71 = (void *)[v71 verticalFont];
    }
    if (!v71) {
LABEL_120:
    }
      v71 = NSDefaultFont();
    [v71 advancementForGlyph:0];
    int v48 = v70;
    if (v72 * (double)Length <= a10 * 0.899999976)
    {
LABEL_122:
      if ((v144 & [v13 wrapsForTruncationMode] & 1) == 0)
      {
        if ((__CFString *)v140 == a1)
        {
          if (!+[NSSingleLineTypesetter _validateAttributes:a2 measuringOnly:v142 == 0])goto LABEL_147; {
          uint64_t v78 = (uint64_t)a1;
          }
          if (v47 < Length) {
            uint64_t v78 = [(__CFString *)a1 substringToIndex:v47];
          }
          if (a4) {
            double v79 = 40000.0;
          }
          else {
            double v79 = a10;
          }
          v77 = (void *)__NSCreateRenderingContextForString(v78, (uint64_t)a2, v133, v139 != 0, v138 != 0, v178, v27, v79);
        }
        else
        {
          while (1)
          {
            BOOL v73 = +[NSSingleLineTypesetter _validateAttributes:a2 measuringOnly:v142 == 0];
            unint64_t v74 = v179;
            if (!v73) {
              break;
            }
            unint64_t v74 = v180 + v179;
            unint64_t v179 = v74;
            if (v74 >= v47) {
              break;
            }
            a2 = (void *)-[__CFString attributesAtIndex:effectiveRange:](a1, "attributesAtIndex:effectiveRange:");
            if (!a2)
            {
              unint64_t v74 = v179;
              break;
            }
          }
          if (v74 < v47) {
            goto LABEL_147;
          }
          uint64_t v75 = (uint64_t)a1;
          if (v47 < Length) {
            uint64_t v75 = -[__CFString attributedSubstringFromRange:](a1, "attributedSubstringFromRange:", 0, v47);
          }
          if (a4) {
            double v76 = 40000.0;
          }
          else {
            double v76 = a10;
          }
          v77 = (void *)__NSCreateRenderingContextForAttributedString(v75, v133, v139 != 0, v138 != 0, v178, v27, v76);
        }
        v80 = v77;
        if (v77)
        {
          [v77 lineFragmentWidth];
          double v82 = v81;
          [v80 setApplicationFrameworkContext:v149];
          BOOL v83 = v131;
          if (v82 <= a10) {
            BOOL v83 = 0;
          }
          if (v83)
          {

            goto LABEL_147;
          }
          int v91 = v82 > a10 && a10 > 0.0;
          if (a4)
          {
            double v153 = v82;
            int v92 = v48;
            double v30 = v135;
            if (a10 > 0.0)
            {
              uint64_t v93 = [v80 resolvedTextAlignment];
              uint64_t v94 = [v80 resolvedBaseWritingDirection];
              [v80 elasticWidth];
              double v96 = v95;
              if (v93 == 1)
              {
                double v151 = (v95 - v153 + 40000.0) * 0.5;
                int v105 = [v80 isRTL];
                double v106 = 0.0;
                if (v105) {
                  double v107 = v96;
                }
                else {
                  double v107 = 0.0;
                }
                if (v91)
                {
                  double v108 = v107 - v151;
                  if (v94 == 1)
                  {
                    v181.origin.x = a8;
                    v181.origin.y = a9;
                    v181.size.width = a10;
                    v181.size.height = a11;
                    double v106 = v153 - CGRectGetWidth(v181);
                  }
                  double v104 = v108 - v106;
                }
                else
                {
                  double v104 = (a10 - v153) * 0.5 - v151 + v107;
                }
              }
              else
              {
                if (v93 != 2)
                {
                  if (v93 != 3) {
                    goto LABEL_195;
                  }
                  NSWritingDirection v97 = v94;
                  if ((a3 & 0x200) == 0)
                  {
                    v98 = v134;
                    if (!v134) {
                      v98 = +[NSParagraphStyle defaultParagraphStyle];
                    }
                    NSWritingDirection v97 = [(NSParagraphStyle *)v98 baseWritingDirection];
                    if (v97 == NSWritingDirectionNatural) {
                      NSWritingDirection v97 = +[NSParagraphStyle defaultWritingDirectionForLanguage:0];
                    }
                  }
                  if (v97 != NSWritingDirectionRightToLeft) {
                    goto LABEL_195;
                  }
                }
                int v99 = [v80 isRTL];
                double v100 = 0.0;
                if (!v99) {
                  double v100 = v96;
                }
                double v101 = v153 - v100;
                double v102 = 40000.0 - v101;
                if (v94) {
                  int v103 = 0;
                }
                else {
                  int v103 = v91;
                }
                if (v103 == 1) {
                  double v104 = -v102;
                }
                else {
                  double v104 = a10 - v101 - v102;
                }
              }
              double v137 = a8 + floor(v104);
            }
          }
          else
          {
            int v92 = v48;
            double v30 = v135;
          }
LABEL_195:
          if (v142) {
            int v109 = [v142 isFlipped] ^ 1;
          }
          else {
            int v109 = 0;
          }
          double v110 = a9;
          if ((v92 & 1) == 0)
          {
            double v164 = 0.0;
            [v80 sizeWithBehavior:v133 usesFontLeading:v146 != 0 baselineDelta:&v164];
            BOOL v112 = a11 > 0.0;
            if (v111 <= a11) {
              BOOL v112 = 0;
            }
            v91 |= v112;
            if (v109)
            {
              if (a11 > 0.0) {
                double v113 = a11;
              }
              else {
                double v113 = v111;
              }
              double v114 = v113 - v164;
            }
            else
            {
              double v114 = v164;
            }
            double v110 = a9 + v114;
          }
          uint64_t v115 = [v142 CGContext];
          if (!v115) {
            goto LABEL_222;
          }
          v116 = (CGContext *)v115;
          if (v91)
          {
            if (a11 <= 0.0) {
              int v117 = 1;
            }
            else {
              int v117 = v92;
            }
            if (v117 == 1)
            {
              double v164 = 0.0;
              double v172 = 0.0;
              [v80 getMaximumAscender:&v164 minimumDescender:&v172];
              double v118 = -v164;
              if (v109) {
                double v118 = v172;
              }
              a9 = a9 + v118;
              a11 = v164 - v172;
            }
            CGContextSaveGState(v116);
            v182.origin.x = a8 - a12;
            v182.origin.y = a9;
            v182.size.width = a10 + a12 * 2.0;
            v182.size.height = a11;
            CGContextClipToRect(v116, v182);
            v119 = v116;
          }
          else
          {
            v119 = 0;
          }
          objc_msgSend(v80, "setCuiCatalog:", objc_msgSend(v13, "cuiCatalog"));
          objc_msgSend(v80, "setCuiStyleEffects:", objc_msgSend(v13, "cuiStyleEffects"));
          objc_msgSend(v80, "_setUsesSimpleTextEffects:", objc_msgSend(v13, "usesSimpleTextEffects"));
          objc_msgSend(v80, "drawAtPoint:inContext:", v116, v137, v110);
          if (v91) {
            CGContextRestoreGState(v119);
          }
          if (v13)
          {
LABEL_222:
            if ((a3 & 8) != 0) {
              char v120 = v141;
            }
            else {
              char v120 = 1;
            }
            if (v120)
            {
              double v164 = 0.0;
              double v30 = *MEMORY[0x1E4F28AD0];
              double v121 = *(double *)(MEMORY[0x1E4F28AD0] + 8);
              [v80 sizeWithBehavior:v133 usesFontLeading:v146 != 0 baselineDelta:&v164];
              double v124 = v123;
              double v125 = v122;
              double v126 = v164;
              if (v92) {
                double v121 = v164 - v122;
              }
            }
            else
            {
              [v80 imageBounds];
              double v30 = v128;
              double v126 = v127;
              double v124 = v129;
              double v125 = v130;
              if (v92) {
                double v121 = v127;
              }
              else {
                double v121 = 0.0;
              }
            }
            if (v13)
            {
              [v13 setNumberOfLineFragments:1];
              objc_msgSend(v13, "setTotalBounds:", v30, v121, v124, v125);
              if ([v13 wantsBaselineOffset])
              {
                [v13 setBaselineOffset:v126];
                [v13 setFirstBaselineOffset:v126];
              }
            }
          }

          return v30;
        }
      }
    }
LABEL_147:
    int64_t v52 = v142;
    goto LABEL_148;
  }
  int v132 = v48;
  uint64_t v136 = [v13 activeRenderers];
  [v13 setActiveRenderers:v29];
  int v54 = [MEMORY[0x1E4F29060] isMainThread];
  if (!v54
    || (v55 = (NSCoreTypesetter *)__NSStringDrawingEngine_mainThreadCoreTypesetter,
        __NSStringDrawingEngine_mainThreadCoreTypesetter = 0,
        !v55))
  {
    v55 = objc_alloc_init(NSCoreTypesetter);
  }
  v165 = 0;
  uint64_t v166 = 0;
  *(void *)&double v164 = 255;
  -[NSCoreTypesetter setTextContainerSize:](v55, "setTextContainerSize:", a10, a11);
  [(NSTypesetter *)v55 setLineFragmentPadding:a12];
  [(NSCoreTypesetter *)v55 setEnforcesMinimumTextLineFragment:1];
  [(NSTypesetter *)v55 setApplicationFrameworkContext:v149];
  -[NSCoreTypesetter _stringDrawingCoreTextEngineWithOriginalString:rect:padding:graphicsContext:forceClipping:attributes:stringDrawingOptions:drawingContext:stringDrawingInterface:](v55, "_stringDrawingCoreTextEngineWithOriginalString:rect:padding:graphicsContext:forceClipping:attributes:stringDrawingOptions:drawingContext:stringDrawingInterface:", a1, v142, a4, a2, a3, v13, a8, a9, a10, a11, a12, &v164);
  double v30 = v56;
  double v31 = v57;
  double v33 = v58;
  double v32 = v59;
  objc_msgSend(v13, "setHasTruncatedRanges:", -[NSArray count](-[NSCoreTypesetter truncatedRanges](v55, "truncatedRanges"), "count") != 0);
  if (__NSStringDrawingEngine_mainThreadCoreTypesetter) {
    int v60 = 0;
  }
  else {
    int v60 = v54;
  }
  if (v60 == 1) {
    __NSStringDrawingEngine_mainThreadCoreTypesetter = (uint64_t)v55;
  }
  else {

  }
  [v13 setActiveRenderers:v136];
  if (a7) {
    *a7 = BYTE1(v166);
  }
  if ((_BYTE)v166 || LOBYTE(v164) == 255)
  {
    int64_t v51 = v165;
    int v48 = v132;
    goto LABEL_102;
  }
  return v30;
}

void sub_18E4F41A0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Unwind_Resume(a1);
}

double __NSTextAttachmentLayoutInfoGetAscent(void *a1)
{
  [a1 _queryLayout];
  uint64_t v2 = a1[9];
  uint64_t v3 = a1[10];
  uint64_t v4 = a1[11];
  uint64_t v5 = a1[12];

  return CGRectGetMaxY(*(CGRect *)&v2);
}

CGFloat __NSTextAttachmentLayoutInfoGetDescent(uint64_t a1)
{
  return -CGRectGetMinY(*(CGRect *)(a1 + 72));
}

double __NSTextAttachmentLayoutInfoGetWidth(void *a1)
{
  objc_msgSend(a1, "_queryLayoutWithHorizontalOffset:");
  uint64_t v2 = a1[9];
  uint64_t v3 = a1[10];
  uint64_t v4 = a1[11];
  uint64_t v5 = a1[12];

  return CGRectGetWidth(*(CGRect *)&v2);
}

void sub_18E4F57D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _NSDisposeBreakIterator(unint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (v5)
  {
    uint64_t v6 = defaultBreakLanguage();
    if ((id)v6 == v5)
    {
    }
    else
    {
      double v7 = (void *)v6;
      double v8 = defaultBreakLanguage();
      int v9 = [v8 isEqualToString:v5];

      if (!v9) {
        goto LABEL_7;
      }
    }
  }
  ubrk_setText();
  uint64_t v10 = 0;
  atomic_compare_exchange_strong_explicit(&__NSDefaultBreakers[a3], (unint64_t *)&v10, a1, memory_order_relaxed, memory_order_relaxed);
  if (v10) {
LABEL_7:
  }
    ubrk_close();
}

uint64_t _NSTextScalingTypeForCurrentEnvironment()
{
  return 1;
}

void sub_18E4F7120(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E4F7910(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E4F79B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E4F7A28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

char *__NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation(void *a1, void *a2)
{
  if (!a1[31]) {
    goto LABEL_12;
  }
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "textContentManager"), "documentRange");
  size_t v5 = a1[31];
  uint64_t v6 = (char *)a1[28];
  TextContainerEntryAtIndex = (char *)a1[29];
  double v8 = &v6[72 * v5];
  if (!TextContainerEntryAtIndex
    || TextContainerEntryAtIndex < v6
    || TextContainerEntryAtIndex >= v8
    || (int v9 = (void *)*((void *)TextContainerEntryAtIndex + 2)) == 0)
  {
LABEL_11:
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = ____NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation_block_invoke;
    v12[3] = &unk_1E55C6548;
    v12[4] = v4;
    v12[5] = v8;
    TextContainerEntryAtIndex = (char *)bsearch_b(a2, v6, v5, 0x48uLL, v12);
    if (TextContainerEntryAtIndex)
    {
LABEL_13:
      a1[29] = TextContainerEntryAtIndex;
      return TextContainerEntryAtIndex;
    }
LABEL_12:
    TextContainerEntryAtIndex = (char *)__NSTextLayoutManagerGetTextContainerEntryAtIndex(a1, 0x7FFFFFFFFFFFFFFFuLL, 1);
    goto LABEL_13;
  }
  if (([v9 containsLocation:a2] & 1) == 0)
  {
    if (objc_msgSend(a2, "compare:", objc_msgSend(*((id *)TextContainerEntryAtIndex + 2), "location")) == -1)
    {
      uint64_t v10 = (TextContainerEntryAtIndex - v6) >> 3;
    }
    else
    {
      uint64_t v6 = TextContainerEntryAtIndex + 72;
      uint64_t v10 = (v8 - (TextContainerEntryAtIndex + 72)) >> 3;
    }
    size_t v5 = 0x8E38E38E38E38E39 * v10;
    goto LABEL_11;
  }
  return TextContainerEntryAtIndex;
}

void *__NSTextLayoutManagerGetTextContainerEntryAtIndex(void *a1, unint64_t a2, int a3)
{
  if (a1[31] <= a2)
  {
    uint64_t v6 = a1[19];
    if (v6) {
      double result = a1 + 19;
    }
    else {
      double result = 0;
    }
    if (a3 && !v6)
    {
      objc_msgSend(a1, "_addTextContainerForLocation:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "textContentManager"), "documentRange"), "location"));
      if (a1[19]) {
        return a1 + 19;
      }
      else {
        return 0;
      }
    }
  }
  else
  {
    uint64_t v4 = a1[28];
    if ((a3 & (v4 == 0)) != 0) {
      return 0;
    }
    else {
      return (void *)(v4 + 72 * a2);
    }
  }
  return result;
}

void sub_18E4F8CD4(_Unwind_Exception *a1)
{
  objc_end_catch();
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E4F8D4C(void *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x18E4F8C50);
  }
  JUMPOUT(0x18E4F8D1CLL);
}

uint64_t __NSValidateCoreTextAttributes(CFDictionaryRef theDict, int a2, BOOL *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  double v43 = a3;
  if (__NSValidateCoreTextAttributes_invalidKeysOnce != -1) {
    dispatch_once(&__NSValidateCoreTextAttributes_invalidKeysOnce, &__block_literal_global_271);
  }
  CFIndex Count = CFDictionaryGetCount(theDict);
  MEMORY[0x1F4188790](Count, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17);
  unint64_t v18 = (8 * Count + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v19 = (const void **)((char *)&v42 - v18);
  if ((unint64_t)(8 * Count) >= 0x200) {
    size_t v20 = 512;
  }
  else {
    size_t v20 = 8 * Count;
  }
  bzero((char *)&v42 - v18, v20);
  MEMORY[0x1F4188790](v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33);
  uint64_t v34 = (id *)((char *)&v42 - v18);
  bzero(v34, v20);
  CFDictionaryGetKeysAndValues(theDict, v19, (const void **)v34);
  int v48 = dyld_program_sdk_at_least();
  if (Count < 1)
  {
    id v45 = 0;
    id v46 = 0;
    BOOL v35 = 1;
LABEL_28:
    if (v43) {
      *double v43 = v35;
    }
    id v40 = v45;
    id v41 = v46;
    if ((!v46 || !v45 || objc_msgSend(v46, "isEqual:"))
      && (unint64_t)objc_msgSend(v41, "renderingMode", v40) < 2)
    {
      return 1;
    }
  }
  else
  {
    id v45 = 0;
    id v46 = 0;
    uint64_t v47 = @"NSFont";
    BOOL v35 = 1;
    double v44 = @"NSOriginalFont";
    while (!CFSetContainsValue((CFSetRef)__NSValidateCoreTextAttributes_disallowedKeysForMeasurement, *v19))
    {
      if (v35)
      {
        int v36 = CFSetContainsValue((CFSetRef)__NSValidateCoreTextAttributes_disallowedKeysForDrawing, *v19);
        BOOL v35 = v36 == 0;
        if (v36 && (a2 & 1) == 0) {
          return 0;
        }
      }
      else
      {
        BOOL v35 = 0;
        uint64_t result = 0;
        if (!a2) {
          return result;
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v48) {
          return 0;
        }
        v38 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
        [v38 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "_Bool __NSValidateCoreTextAttributes(NSDictionary *, BOOL, NSTextApplicationFrameworkContext, BOOL *)"), @"NSCoreTypesetter.m", 1834, @"Expected NSString type for attribute key, got %@ instead", objc_opt_class() file lineNumber description];
      }
      if ([(id)*v19 isEqualToString:@"NSParagraphStyle"])
      {
        id v39 = *v34;
        if (objc_msgSend((id)objc_msgSend(*v34, "textBlocks"), "count")
          || objc_msgSend((id)objc_msgSend(v39, "textLists"), "count"))
        {
          return 0;
        }
      }
      else if ([(id)*v19 isEqualToString:v47])
      {
        id v46 = *v34;
      }
      else if ([(id)*v19 isEqualToString:v44])
      {
        id v45 = *v34;
      }
      ++v34;
      ++v19;
      if (!--Count) {
        goto LABEL_28;
      }
    }
  }
  return 0;
}

void sub_18E4F9AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __NSTextContentStorageFlushUncachedTextElements(NSUInteger a1, uint64_t a2, char a3)
{
  uint64_t v3 = *(void *)(a2 + 536);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  char v7 = *(unsigned char *)(a2 + 576);
  char v8 = *(unsigned char *)(a2 + 577);
  if (a3)
  {
    if (!*(unsigned char *)(a2 + 576)) {
      goto LABEL_10;
    }
LABEL_8:
    uint64_t v9 = a2 + 24;
    goto LABEL_11;
  }
  if (*(unsigned char *)(a2 + 576))
  {
    if (v3 > 63) {
      goto LABEL_8;
    }
    return 0;
  }
  if ((v3 & 0x8000000000000000) == 0) {
    return 0;
  }
LABEL_10:
  uint64_t v9 = a2 + 8 * v3 + 32;
  uint64_t v3 = 63 - v3;
LABEL_11:
  uint64_t v10 = (int64x2_t *)(a2 + 536);
  if (v3 >= 1)
  {
    unint64_t v11 = *(void *)(a2 + 544);
    unint64_t v12 = *(void *)(a1 + 104);
    BOOL v13 = v11 < v12 || v11 - v12 >= *(void *)(a1 + 112);
    char v39 = *(unsigned char *)(a2 + 576);
    if (!v13)
    {
      BOOL v35 = (int64x2_t *)(a2 + 536);
      char v36 = *(unsigned char *)(a2 + 577);
      uint64_t v38 = *(void *)(a2 + 552);
      __n128 v41 = 0uLL;
      __n128 v16 = *(void **)(a1 + 88);
      _NSBlockNumberForIndex(v16, v11, &v41);
      uint64_t v18 = 0;
      if (v16[11] <= v17) {
        uint64_t v18 = v16[4] - v16[3];
      }
      uint64_t v19 = *(void *)(v16[7] + (v16[2] + 8) * (v18 + v17) + 8);
      size_t v20 = (objc_class *)objc_opt_class();
      uint64_t v21 = NSStringFromClass(v20);
      uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = ____NSTextContentStorageCacheElementIndexRange_block_invoke;
      v47[3] = &__block_descriptor_48_e18___NSString_16__0_8l;
      v47[4] = v11;
      v47[5] = v38;
      _UIFoundationAssert((void *)a1, v21, v19 == 0x7FFFFFFFFFFFFFFFLL, v47);
      if (v19 != 0x7FFFFFFFFFFFFFFFLL)
      {
        char v8 = v36;
        uint64_t v10 = v35;
LABEL_39:
        char v7 = v39;
        goto LABEL_40;
      }
      unint64_t v23 = v41.n128_u64[0];
      if (v41.n128_u64[0])
      {
        do
        {
          v41.n128_u64[0] = v23 - 1;
          uint64_t v24 = *(void **)(a1 + 88);
          _NSBlockNumberForIndex(v24, v23 - 1, &v41);
          if (v24[11] <= v25) {
            uint64_t v26 = v24[4] - v24[3];
          }
          else {
            uint64_t v26 = 0;
          }
          uint64_t v22 = *(void *)(v24[7] + (v24[2] + 8) * (v26 + v25) + 8);
          unint64_t v23 = v41.n128_u64[0];
        }
        while (v22 == 0x7FFFFFFFFFFFFFFFLL && v41.n128_u64[0] != 0);
      }
      uint64_t v28 = (objc_class *)objc_opt_class();
      __n128 v29 = NSStringFromClass(v28);
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = ____NSTextContentStorageCacheElementIndexRange_block_invoke_2;
      v46[3] = &__block_descriptor_48_e18___NSString_16__0_8l;
      v46[4] = v11;
      v46[5] = v38;
      _UIFoundationAssert((void *)a1, v29, v22 != 0x7FFFFFFFFFFFFFFFLL, v46);
      NSUInteger v15 = v22 + 1;
      unint64_t v12 = v38 + v11;
      uint64_t v37 = *(void *)(a1 + 104) - (v38 + v11) + *(void *)(a1 + 112);
      char v8 = v36;
      uint64_t v10 = v35;
LABEL_36:
      [*(id *)(a1 + 96) insertElements:0 count:v3 atIndex:v15];
      v41.n128_u64[0] = MEMORY[0x1E4F143A8];
      v41.n128_u64[1] = 3221225472;
      uint64_t v42 = ____NSTextContentStorageCacheElementIndexRange_block_invoke_3;
      double v43 = &__block_descriptor_48_e24_v32__0__8__NSRange_QQ_16l;
      uint64_t v44 = v9;
      NSUInteger v45 = v15;
      __NSTextContentStorageEnumerateCachedElementsInElementIndexRange(a1, v15, v3, (uint64_t)&v41);
      __n128 v30 = (id *)v9;
      unint64_t v31 = [*(id *)(a1 + 88) count];
      unint64_t v32 = objc_msgSend((id)objc_msgSend((id)a1, "attributedString"), "length");
      v40[0] = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      v40[1] = xmmword_18E5F73B0;
      if (v32 > v31) {
        objc_msgSend(*(id *)(a1 + 88), "insertElement:range:coalesceRuns:", v40, v31, v32 - v31, 1);
      }
      __NSTextContentStorageUpdateElementIndexRangeForRange(a1, v30, v3, v15, v12, v37, v3);
      __NSTextContentStorageUpdateCachedRange(a1);
      goto LABEL_39;
    }
    if (v11 >= v12)
    {
      uint64_t v14 = [*(id *)(a1 + 96) count];
      if (v14)
      {
        NSUInteger v15 = v14;
        uint64_t v37 = 0;
        unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_36;
      }
      unint64_t v12 = *(void *)(a1 + 104);
    }
    NSUInteger v15 = 0;
    uint64_t v37 = *(void *)(a1 + 112);
    goto LABEL_36;
  }
LABEL_40:
  uint64_t v33 = [(id)a1 maximumNumberOfUncachedElements];
  if (v33) {
    uint64_t v34 = v33;
  }
  else {
    uint64_t v34 = -1;
  }
  *(void *)a2 = 0;
  *(void *)(a2 + _Block_object_dispose(&STACK[0x768], 8) = 0x7FFFFFFFFFFFFFFFLL;
  bzero((void *)(a2 + 16), 0x208uLL);
  *uint64_t v10 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  *(void *)(a2 + 552) = 0;
  *(void *)(a2 + 560) = v34;
  *(void *)(a2 + 56_Block_object_dispose(&STACK[0x768], 8) = 0x7FFFFFFFFFFFFFFFLL;
  *(unsigned char *)(a2 + 576) = v7;
  *(unsigned char *)(a2 + 577) = v8;
  *(_DWORD *)(a2 + 57_Block_object_dispose(&STACK[0x768], 8) = 0;
  *(_WORD *)(a2 + 582) = 0;
  return 1;
}

void sub_18E4FA0C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__n128 _NSBlockNumberForIndex(void *a1, unint64_t a2, __n128 *a3)
{
  unint64_t v6 = a1[1];
  if (v6 <= a2) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C4A8], @"*** NSRunStorage, _NSBlockNumberForIndex(): index (%lu) beyond array bounds (%lu)", a2, v6 format];
  }
  uint64_t v8 = a1[8];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v9 = 0;
    uint64_t v8 = a1[3];
    goto LABEL_5;
  }
  unint64_t v23 = a1[9];
  uint64_t v22 = (__n128 *)(a1 + 9);
  if (a2 < v23 || a2 - v23 >= a1[10])
  {
    if (a2 < v23)
    {
      unint64_t v9 = 0;
    }
    else
    {
      unint64_t v9 = v8 + 1;
      uint64_t v25 = a1[3];
      if (v8 == v25 - 2)
      {
        unint64_t v26 = a1[1];
      }
      else
      {
        unint64_t v27 = v8 + 2;
        if (a1[11] <= (unint64_t)(v8 + 2)) {
          uint64_t v28 = a1[4] - v25;
        }
        else {
          uint64_t v28 = 0;
        }
        unint64_t v26 = *(void *)(a1[7] + (a1[2] + 8) * (v28 + v27));
        if (v27 >= a1[5]) {
          v26 += a1[6];
        }
      }
      if (v26 > a2) {
        goto LABEL_45;
      }
      unint64_t v9 = v8 + 2;
      uint64_t v8 = a1[3];
    }
LABEL_5:
    unint64_t v10 = v8 - 1;
    if (v9 < v8 - 1)
    {
      uint64_t v11 = a1[7];
      unint64_t v12 = a1[11];
      uint64_t v13 = a1[2] + 8;
      unint64_t v14 = a1[5];
      do
      {
        unint64_t v15 = v9 + ((v10 - v9) >> 1);
        if (v12 <= v15) {
          uint64_t v16 = a1[4] - a1[3];
        }
        else {
          uint64_t v16 = 0;
        }
        unint64_t v17 = *(void *)(v11 + v13 * (v16 + v15));
        if (v15 >= v14) {
          v17 += a1[6];
        }
        if (v17 <= a2)
        {
          uint64_t v18 = a1[3];
          if (v15 == v18 - 1)
          {
            unint64_t v19 = a1[1];
          }
          else
          {
            unint64_t v20 = v15 + 1;
            if (v12 <= v15 + 1) {
              uint64_t v21 = a1[4] - v18;
            }
            else {
              uint64_t v21 = 0;
            }
            unint64_t v19 = *(void *)(v11 + (v21 + v20) * v13);
            if (v20 >= v14) {
              v19 += a1[6];
            }
          }
          if (v19 > a2) {
            unint64_t v9 = v15;
          }
          else {
            unint64_t v9 = v15 + 1;
          }
          if (v19 > a2) {
            unint64_t v10 = v15;
          }
        }
        else
        {
          unint64_t v10 = v15 - 1;
        }
      }
      while (v9 < v10);
      goto LABEL_46;
    }
LABEL_45:
    uint64_t v11 = a1[7];
    unint64_t v12 = a1[11];
LABEL_46:
    unint64_t v29 = v9;
    a1[8] = v9;
    if (v12 <= v9) {
      uint64_t v30 = a1[4] - a1[3];
    }
    else {
      uint64_t v30 = 0;
    }
    uint64_t v31 = a1[2] + 8;
    uint64_t v32 = *(void *)(v11 + v31 * (v30 + v29));
    a1[9] = v32;
    uint64_t v33 = (__n128 *)(a1 + 9);
    unint64_t v34 = a1[5];
    if (v29 >= v34)
    {
      v32 += a1[6];
      a1[9] = v32;
    }
    uint64_t v35 = a1[3];
    if (v29 == v35 - 1)
    {
      uint64_t v36 = a1[1];
    }
    else
    {
      unint64_t v37 = v29 + 1;
      if (v12 <= v29 + 1) {
        uint64_t v38 = a1[4] - v35;
      }
      else {
        uint64_t v38 = 0;
      }
      uint64_t v36 = *(void *)(v11 + (v38 + v37) * v31);
      if (v37 >= v34) {
        v36 += a1[6];
      }
    }
    a1[10] = v36 - v32;
    if (a3)
    {
      __n128 result = *v33;
      *a3 = *v33;
    }
    return result;
  }
  if (a3)
  {
    __n128 result = *v22;
    *a3 = *v22;
  }
  return result;
}

void sub_18E4FA580(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __NSTextLayoutManagerFillSoftInvalidationToLocation(uint64_t a1, void *a2, double a3)
{
  uint64_t v47 = 0;
  int v48 = &v47;
  uint64_t v49 = 0x3052000000;
  uint64_t v50 = __Block_byref_object_copy__2;
  int64_t v51 = __Block_byref_object_dispose__2;
  uint64_t v52 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  objc_sync_enter((id)a1);
  id v6 = *(id *)(a1 + 256);
  char v7 = v6;
  if (v6 && (!a2 || [v6 compare:a2] == -1))
  {
    TextContainerEntryAndIndexForLocation = __NSTextLayoutManagerGetTextContainerEntryAndIndexForLocation((void *)a1, v7);
    uint64_t v9 = (uint64_t)TextContainerEntryAndIndexForLocation;
    if (TextContainerEntryAndIndexForLocation) {
      unint64_t v10 = *((void *)TextContainerEntryAndIndexForLocation + 7);
    }
    else {
      unint64_t v10 = 0;
    }
    uint64_t v36 = objc_msgSend((id)objc_msgSend((id)a1, "textContentManager"), "documentRange");
    if (v9)
    {
      do
      {
        if (a2 && [v7 compare:a2] != -1) {
          break;
        }
        uint64_t v11 = *(void **)(v9 + 16);
        if (a1 + 152 == v9 || v11 == 0) {
          uint64_t v11 = v36;
        }
        uint64_t v13 = v11;
        uint64_t v14 = objc_msgSend(-[NSTextRange location](v13, "location"), "compare:", v7);
        if (a2) {
          uint64_t v15 = objc_msgSend(a2, "compare:", -[NSTextRange endLocation](v13, "endLocation"));
        }
        else {
          uint64_t v15 = 0;
        }
        uint64_t v39 = 0;
        id v40 = (double *)&v39;
        uint64_t v41 = 0x2020000000;
        uint64_t v42 = 0;
        uint64_t v16 = *(void *)(v9 + 8);
        if (!v16) {
          uint64_t v16 = [v36 location];
        }
        v48[5] = v16;
        if (v14 == -1 || v15 == -1)
        {
          id v18 = v7;
          if (v14 != -1) {
            id v18 = [(NSTextRange *)v13 location];
          }
          uint64_t v19 = (uint64_t)a2;
          if (v15 != -1) {
            uint64_t v19 = [(NSTextRange *)v13 endLocation];
          }
          if ([v18 compare:v19] != -1)
          {
            ++v10;
            unint64_t v20 = *(void *)(a1 + 248);
            uint64_t v21 = *(void *)(a1 + 152);
            if (v21) {
              unint64_t v22 = v20 + 1;
            }
            else {
              unint64_t v22 = *(void *)(a1 + 248);
            }
            if (v10 >= v22)
            {
              uint64_t v9 = 0;
            }
            else if (v20 <= v10)
            {
              if (v21) {
                uint64_t v9 = a1 + 152;
              }
              else {
                uint64_t v9 = 0;
              }
            }
            else
            {
              uint64_t v9 = *(void *)(a1 + 224) + 72 * v10;
            }

            goto LABEL_66;
          }
          unint64_t v23 = [[NSTextRange alloc] initWithLocation:v18 endLocation:v19];

          if (v14 == -1)
          {
            uint64_t v24 = [*(id *)(v9 + 16) location];
            if (!v24) {
              uint64_t v24 = [v36 location];
            }
            uint64_t v25 = [(NSTextRange *)v23 location];
            v38[0] = MEMORY[0x1E4F143A8];
            v38[1] = 3221225472;
            v38[2] = ____NSTextLayoutManagerFillSoftInvalidationToLocation_block_invoke;
            v38[3] = &unk_1E55C64B0;
            v38[4] = v24;
            v38[5] = &v39;
            v38[6] = &v47;
            [*(id *)(a1 + 80) enumerateTextLayoutFragmentFromLocation:v25 options:1 usingBlock:v38];
          }
        }
        else
        {
          unint64_t v23 = v13;
        }
        if (v40[3] < a3)
        {
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = ____NSTextLayoutManagerFillSoftInvalidationToLocation_block_invoke_2;
          v37[3] = &unk_1E55C64D8;
          *(double *)&v37[8] = a3;
          v37[4] = a1;
          v37[5] = &v39;
          v37[6] = &v47;
          v37[7] = &v43;
          if (objc_msgSend(-[NSTextRange endLocation](v23, "endLocation"), "isEqual:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "textContentManager"), "documentRange"), "endLocation")))objc_msgSend(*(id *)(a1 + 80), "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", -[NSTextRange location](v23, "location"), 2, v37); {
          else
          }
            [*(id *)(a1 + 80) enumerateTextLayoutFragmentInTextRange:v23 options:2 usingBlock:v37];
        }
        if (*((unsigned char *)v44 + 24))
        {
          if ([*(id *)(v9 + 16) isNotEmpty])
          {
            unint64_t v26 = objc_msgSend(*(id *)(a1 + 80), "textLayoutFragmentForTextLocation:allowsTrailingEdge:", objc_msgSend(*(id *)(v9 + 16), "endLocation"), 1);
            if (v26)
            {
              [v26 layoutFragmentFrame];
              CGFloat MaxY = CGRectGetMaxY(v53);
              *(void *)(v9 + 32) = 0;
              *(CGFloat *)(v9 + 4_Block_object_dispose(&STACK[0x768], 8) = MaxY;
            }
          }
        }
        uint64_t v28 = [*(id *)(v9 + 16) endLocation];
        ++v10;
        unint64_t v29 = *(void *)(a1 + 248);
        uint64_t v30 = *(void *)(a1 + 152);
        if (v30) {
          unint64_t v31 = v29 + 1;
        }
        else {
          unint64_t v31 = *(void *)(a1 + 248);
        }
        if (v10 < v31)
        {
          if (v29 <= v10)
          {
            uint64_t v9 = a1 + 152;
            if (v30) {
              goto LABEL_58;
            }
          }
          else
          {
            uint64_t v32 = *(void *)(a1 + 224);
            if (v32)
            {
              uint64_t v9 = v32 + 72 * v10;
LABEL_58:
              id v33 = (id)v48[5];
              goto LABEL_60;
            }
          }
        }
        if (!v28)
        {
          uint64_t v9 = 0;
          id v33 = 0;
          goto LABEL_60;
        }
        uint64_t v9 = 0;
        id v33 = 0;
        if ([(id)v48[5] compare:v28] == -1) {
          goto LABEL_58;
        }
LABEL_60:

        char v7 = v33;
LABEL_66:
        _Block_object_dispose(&v39, 8);
      }
      while (v9 && v7);
    }
    if (([v7 isEqual:*(void *)(a1 + 256)] & 1) == 0) {
      [(id)a1 _setSoftInvalidationLocation:v7 onlyIfUpstream:0];
    }
  }

  objc_sync_exit((id)a1);
  if (*((unsigned char *)v44 + 24)) {
    uint64_t v34 = v48[5];
  }
  else {
    uint64_t v34 = 0;
  }
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  return v34;
}

void sub_18E4FAD7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  objc_sync_exit(v34);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v35 - 168), 8);
  _Unwind_Resume(a1);
}

uint64_t __NSTextContentStorageQueryDocumentLocationDeltaForLocation(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 128);
  if (!v3) {
    return 0;
  }
  unint64_t v5 = *(void *)(a1 + 120);
  if (v3 + v5 <= a2) {
    return *(void *)(a1 + 136);
  }
  if (v5 > a2) {
    return 0;
  }
  if (!a3 || (uint64_t result = *(void *)(a3 + 568), result == 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t result = 0;
    unint64_t v11 = a2;
    uint64_t v12 = 0;
    if (v5 < a2)
    {
      for (uint64_t i = a2 - 1; ; --i)
      {
        uint64_t v9 = [*(id *)(a1 + 88) elementAtIndex:i effectiveRange:&v11];
        if (v9)
        {
          uint64_t v10 = *(void *)(v9 + 8);
          if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
            break;
          }
        }
        if (v11 <= *(void *)(a1 + 120)) {
          return 0;
        }
      }
      uint64_t result = *(void *)(v9 + 16) + v10 - (v11 + v12);
      if (a3) {
        *(void *)(a3 + 56_Block_object_dispose(&STACK[0x768], 8) = result;
      }
    }
  }
  return result;
}

__n128 UINibDecoderDecodeObjectForValue(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a3 == 10)
  {
    uint64_t v4 = *(unsigned int *)(*(void *)(a1 + 72) + *(unsigned int *)(a2 + 4));
    if (v4 < *(_DWORD *)(a1 + 108) && !*(void *)(*(void *)(a1 + 144) + 8 * v4))
    {
      uint64_t v5 = *(void *)(a1 + 152);
      if (v5) {
        unsigned int v6 = *(_DWORD *)(v5 + 4 * v4);
      }
      else {
        unsigned int v6 = *(unsigned __int8 *)(*(void *)(a1 + 160) + v4);
      }
      uint64_t v7 = v6;
      if (!*(void *)(*(void *)(a1 + 32) + 8 * v6))
      {
        if (objc_opt_respondsToSelector()) {
          *(void *)(*(void *)(a1 + 32) + 8 * v7) = [*(id *)(a1 + 216) nibDecoder:a1 cannotDecodeObjectOfClassName:*(void *)(*(void *)(a1 + 40) + 8 * v7)];
        }
        if (!*(void *)(*(void *)(a1 + 32) + 8 * v7)) {
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F28498], @"Could not instantiate class named %1$@ because no class named %1$@ was found; the class needs to be defined in source code or linked in from a library (ensure the class is part of the correct target)",
        }
            *(void *)(*(void *)(a1 + 40) + 8 * v7));
      }
      __n128 v28 = *(__n128 *)(a1 + 184);
      uint64_t v29 = *(void *)(a1 + 200);
      *(void *)(a1 + 192) = 0;
      *(void *)(a1 + 200) = 0;
      *(void *)(a1 + 184) = 0;
      *(void *)(a1 + 184) = v4;
      uint64_t v8 = *(objc_class **)(*(void *)(a1 + 32) + 8 * v7);
      uint64_t v9 = *(void *)(a1 + 48);
      if (!*(_DWORD *)(v9 + 8 * v4 + 4)
        || *(void *)(a1 + 176) != *(_DWORD *)(*(void *)(a1 + 56) + 8 * *(unsigned int *)(v9 + 8 * v4)))
      {
        *(void *)(*(void *)(a1 + 144) + 8 * v4) = objc_allocWithZone(v8);
        uint64_t v16 = [*(id *)(*(void *)(a1 + 144) + 8 * v4) initWithCoder:a1];
        uint64_t v17 = v16;
        if (*(unsigned char *)(a1 + 204))
        {
          uint64_t v18 = *(void *)(*(void *)(a1 + 144) + 8 * v4);
          if (v18 != v16) {
            [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"This coder is expecting the replaced object %p to be returned from %@.initWithCoder instead of <%@: %p>", v18, v8, objc_opt_class(), v16 format];
          }
        }
        *(void *)(*(void *)(a1 + 144) + 8 * v4) = v17;
        *(void *)(*(void *)(a1 + 144) + 8 * v4) = [*(id *)(*(void *)(a1 + 144) + 8 * v4) awakeAfterUsingCoder:a1];
        if (objc_opt_respondsToSelector()) {
          [*(id *)(a1 + 216) nibDecoder:a1 didDecodeObject:*(void *)(*(void *)(a1 + 144) + 8 * v4)];
        }
        goto LABEL_39;
      }
      if (![(objc_class *)v8 isSubclassOfClass:*(void *)(a1 + 8)])
      {
        if ([(objc_class *)v8 isSubclassOfClass:*(void *)(a1 + 24)])
        {
          *(void *)(*(void *)(a1 + 144) + 8 * v4) = objc_allocWithZone(v8);
          uint64_t v19 = UINibDecoderDecodeDictionary((void *)a1, *(void **)(*(void *)(a1 + 144) + 8 * v4));
        }
        else
        {
          if (![(objc_class *)v8 isSubclassOfClass:*(void *)(a1 + 16)])
          {
            [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"Unkown special cased class %@", v8 format];
            goto LABEL_39;
          }
          *(void *)(*(void *)(a1 + 144) + 8 * v4) = objc_allocWithZone(v8);
          uint64_t v19 = UINibDecoderDecodeSet((void *)a1, *(void **)(*(void *)(a1 + 144) + 8 * v4));
        }
        uint64_t v20 = v19;
LABEL_38:
        *(void *)(*(void *)(a1 + 144) + 8 * v4) = v20;
LABEL_39:
        __n128 result = v28;
        *(__n128 *)(a1 + 184) = v28;
        *(void *)(a1 + 200) = v29;
        return result;
      }
      *(void *)(*(void *)(a1 + 144) + 8 * v4) = objc_allocWithZone(v8);
      uint64_t v10 = (int *)(*(void *)(a1 + 48) + 8 * *(void *)(a1 + 184));
      uint64_t v11 = v10[1];
      if (!v11) {
        __assert_rtn("UINibDecoderDecodeArray", "UINibDecoder.m", 608, "count >= 1 && \"It isn't possible to get here with count == 0.\"");
      }
      uint64_t v12 = *(void **)(*(void *)(a1 + 144) + 8 * v4);
      int v13 = *v10;
      uint64_t v14 = (v11 - 1);
      if (v14 < 0x21)
      {
        uint64_t v15 = v30;
        if (v11 < 2) {
          goto LABEL_35;
        }
      }
      else
      {
        uint64_t v15 = malloc_type_malloc(8 * v14, 0x80040B8603338uLL);
      }
      uint64_t v27 = (v11 - 1);
      uint64_t v21 = 0;
      char v22 = 0;
      int v23 = v13 + 1;
      uint64_t v24 = v11 - 1;
      do
      {
        uint64_t v25 = UINibDecoderDecodeObjectForValue(a1, *(void *)(a1 + 56) + 8 * (v23 + v21), *(unsigned __int8 *)(*(void *)(a1 + 64) + (v23 + v21)));
        *(void *)&v15[8 * v21] = v25;
        v22 |= v25 == 0;
        ++v21;
      }
      while (v24 != v21);
      if (v22)
      {

        uint64_t v20 = 0;
        goto LABEL_36;
      }
      uint64_t v14 = v27;
LABEL_35:
      uint64_t v20 = [v12 initWithObjects:v15 count:v14];
LABEL_36:
      if (v15 != v30) {
        free(v15);
      }
      goto LABEL_38;
    }
  }
  return result;
}

void sub_18E4FDD18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long a15, uint64_t a16)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    *(void *)(*(void *)(v16 + *(int *)(v18 + 2336)) + 8 * v17) = 0;
    *(void *)(v16 + 200) = a16;
    *(_OWORD *)(v16 + 184) = a15;
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_18E4FDD64()
{
}

uint64_t UIReadNibArchiveVInt32(uint64_t a1, unint64_t a2, uint64_t *a3, int *a4)
{
  uint64_t v4 = *a3;
  if (a2 >= *a3) {
    unsigned int v5 = a2 - *a3;
  }
  else {
    unsigned int v5 = 0;
  }
  if (v5 < 5)
  {
    __memcpy_chk();
    if (v5 == 3 || v5 == 2 || v5 == 1) {
      return 0;
    }
    else {
      return 0;
    }
  }
  else
  {
    int v6 = *(_DWORD *)(a1 + v4);
    if ((v6 & 0x80) != 0)
    {
      int v7 = *(_DWORD *)(a1 + v4) & 0x7F;
      int v8 = 1;
    }
    else if ((v6 & 0x8000) != 0)
    {
      int v7 = *(_DWORD *)(a1 + v4) & 0x7F | (((*(_DWORD *)(a1 + v4) >> 8) & 0x7F) << 7);
      int v8 = 2;
    }
    else if ((v6 & 0x800000) != 0)
    {
      int v7 = *(_DWORD *)(a1 + v4) & 0x7F | (((*(_DWORD *)(a1 + v4) >> 8) & 0x7F) << 7) | (*(_DWORD *)(a1 + v4) >> 2) & 0x1FC000;
      int v8 = 3;
    }
    else if (v6 < 0)
    {
      int v7 = *(_DWORD *)(a1 + v4) & 0x7F | ((HIWORD(*(_DWORD *)(a1 + v4)) & 0x7F) << 14) | (*(_DWORD *)(a1 + v4) >> 3) & 0xFE00000 | (*(_DWORD *)(a1 + v4) >> 1) & 0x3F80;
      int v8 = 4;
    }
    else
    {
      int v7 = (*(_DWORD *)(a1 + v4) >> 3) & 0xFE00000 | (*(unsigned __int8 *)(v4 + a1 + 4) << 28) | (*(_DWORD *)(a1 + v4) >> 2) & 0x1FC000 | (*(_DWORD *)(a1 + v4) >> 1) & 0x3F80 | *(_DWORD *)(a1 + v4) & 0x7F;
      int v8 = 5;
    }
    *a4 = v7;
    *a3 = (v4 + v8);
    return 1;
  }
}

uint64_t UIFixedByteLengthForType(unsigned int a1)
{
  if (a1 > 0xA) {
    return -2;
  }
  else {
    return UIFixedByteLengthForType_table[a1];
  }
}

uint64_t UINibDecoderDecodeDictionary(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (int *)(a1[6] + 8 * a1[23]);
  unint64_t v3 = v2[1];
  if (!v3) {
    UINibDecoderDecodeDictionary_cold_1();
  }
  uint64_t v4 = a2;
  if ((v3 & 1) == 0)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Invalid NSDictionary in archive. Illegal quantity of Keys and Values"];

    return 0;
  }
  int v7 = *v2;
  unint64_t v8 = v3 >> 1;
  if (v3 < 0x42)
  {
    uint64_t v9 = v20;
    uint64_t v10 = v19;
    if (v3 < 2) {
      goto LABEL_26;
    }
    uint64_t v18 = a2;
  }
  else
  {
    uint64_t v18 = a2;
    uint64_t v9 = malloc_type_malloc(8 * v8, 0x80040B8603338uLL);
    uint64_t v10 = malloc_type_malloc(8 * v8, 0x80040B8603338uLL);
  }
  uint64_t v11 = 0;
  char v12 = 0;
  if (v8 <= 1) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = v8;
  }
  for (unsigned int i = v7 + 2; ; i += 2)
  {
    *(void *)&v9[8 * v11] = UINibDecoderDecodeObjectForValue(a1, a1[7] + 8 * (i - 1), *(unsigned __int8 *)(a1[8] + i - 1));
    uint64_t v15 = UINibDecoderDecodeObjectForValue(a1, a1[7] + 8 * i, *(unsigned __int8 *)(a1[8] + i));
    *(void *)&v10[8 * v11] = v15;
    if ((v12 & 1) == 0) {
      break;
    }
    if (++v11 == v13) {
      goto LABEL_24;
    }
    char v12 = 1;
LABEL_22:
    ;
  }
  if (*(void *)&v9[8 * v11]) {
    BOOL v16 = v15 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  char v12 = v16;
  if (++v11 != v13) {
    goto LABEL_22;
  }
  if (v12)
  {
LABEL_24:

    uint64_t v5 = 0;
    goto LABEL_27;
  }
  uint64_t v4 = v18;
LABEL_26:
  uint64_t v5 = [v4 initWithObjects:v10 forKeys:v9 count:v8];
LABEL_27:
  if (v9 != v20) {
    free(v9);
  }
  if (v10 != v19) {
    free(v10);
  }
  return v5;
}

CFTypeRef __UIFontDescriptorWithTextStyle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  +[UIFont _normalizedContentSizeCategory:a2 default:a3];
  if (!a4 && !a5 && !a6)
  {
    if (a7 == -1)
    {
      uint64_t v11 = 0;
      goto LABEL_16;
    }
    goto LABEL_14;
  }
  char v12 = objc_opt_new();
  if (a4) {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", a4), @"NSCTFontSymbolicTrait");
  }
  if (a5) {
    [v12 setObject:a5 forKeyedSubscript:@"NSCTFontUIFontDesignTrait"];
  }
  if (a6) {
    [v12 setObject:a6 forKeyedSubscript:@"NSCTFontWeightTrait"];
  }
  uint64_t v11 = objc_opt_new();
  [v11 setObject:v12 forKeyedSubscript:@"NSCTFontTraitsAttribute"];

  if (a7 != -1)
  {
    if (v11)
    {
LABEL_15:
      uint64_t v13 = [NSNumber numberWithLong:a7];
      [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F24590]];
      goto LABEL_16;
    }
LABEL_14:
    uint64_t v11 = objc_opt_new();
    goto LABEL_15;
  }
LABEL_16:
  uint64_t v14 = (const void *)CTFontDescriptorCreateWithTextStyleAndAttributes();
  CFTypeRef v15 = (id)CFMakeCollectable(v14);

  return v15;
}

const __CTFont *__UIFontForTextStyle(const __CTFont *result, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (!result) {
    return result;
  }
  uint64_t v9 = (uint64_t)result;
  id v10 = +[UIFont _sharedFontCache];
  if (a5)
  {
    id v11 = 0;
  }
  else
  {
    uint64_t v12 = +[UIFont _normalizedContentSizeCategory:a2 default:a4];
    if (a3 == -1) {
      BOOL v13 = _AXSEnhanceTextLegibilityEnabled() != 0;
    }
    else {
      BOOL v13 = a3 == 1;
    }
    id v11 = +[_UIFontCacheKey newFontCacheKeyWithTextStyle:v9 contentSizeCategory:v12 textLegibility:v13];
    uint64_t v14 = (const __CTFont *)[v10 retainedObjectForKey:v11];
    if (v14) {
      goto LABEL_15;
    }
  }
  CFTypeRef v15 = (const __CTFontDescriptor *)__UIFontDescriptorWithTextStyle(v9, a2, a4, 0, 0, 0, a3);
  if (v15)
  {
    BOOL v16 = CTFontCreateWithFontDescriptor(v15, 0.0, 0);
    uint64_t v14 = v16;
    if ((a5 & 1) == 0 && v16) {
      [v10 setObject:v16 forKey:v11];
    }
    if (!a5) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if (!a5) {
      goto LABEL_15;
    }
  }
  uint64_t ExtraData = __CTFontGetExtraData(v14);
  *(unsigned char *)(ExtraData + 24) |= 2u;
LABEL_15:

  return v14;
}

uint64_t _NSCopyBreakIterator(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a1;
  if (shouldUseHangulWordPriorityWithLineBreakStrategy_once != -1) {
    dispatch_once(&shouldUseHangulWordPriorityWithLineBreakStrategy_once, &__block_literal_global_19);
  }
  defaultBreakLanguage();
  int v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  int v7 = v6;
  if (v5 && v6 != v5 && ![(__CFString *)v6 isEqualToString:v5])
  {
LABEL_11:
    if (([(__CFString *)v5 isEqualToString:NSPOSIXLocaleIdentifier] & 1) != 0
      || [(__CFString *)v5 isEqualToString:NSPOSIXLanguageIdentifier])
    {
      if (!_NSCopyBreakIterator_posixBreakerSeed[!(a4 & 1)])
      {
        unint64_t v11 = ubrk_open();
        uint64_t v12 = 0;
        atomic_compare_exchange_strong_explicit(&_NSCopyBreakIterator_posixBreakerSeed[!(a4 & 1)], (unint64_t *)&v12, v11, memory_order_relaxed, memory_order_relaxed);
        if (v12) {
          ubrk_close();
        }
      }
      uint64_t v8 = ubrk_clone();
      ubrk_setText();
      if ((a4 & 1) == 0 && v8) {
        goto LABEL_31;
      }
    }
    else
    {
      BOOL v13 = v5;
      uint64_t v5 = v13;
      uint64_t v14 = v13;
      if ((a4 & 2) != 0)
      {
        uint64_t v14 = v13;
        if ([(__CFString *)v13 rangeOfString:@"lb="] == 0x7FFFFFFFFFFFFFFFLL)
        {
          [(__CFString *)v5 stringByAppendingString:@"@lb=strict"];
          uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      CFStringGetCString(v14, buffer, 128, 0x600u);
      uint64_t v8 = ubrk_open();
      if (!v8) {
        uint64_t v8 = ubrk_open();
      }
      if ((a4 & 1) == 0 && v8) {
        ubrk_setLineWordOpts();
      }
    }
    goto LABEL_26;
  }
  if (a4 >= 4) {
    _NSCopyBreakIterator_cold_1();
  }
  uint64_t v8 = __NSDefaultBreakers[a4];
  if (!v8
    || (atomic_ullong v9 = __NSDefaultBreakers[a4],
        atomic_compare_exchange_strong_explicit(&__NSDefaultBreakers[a4], (unint64_t *)&v9, 0, memory_order_relaxed, memory_order_relaxed), v9 != v8))
  {
    id v10 = v7;

    uint64_t v5 = v10;
    goto LABEL_11;
  }
  ubrk_setText();
  if ((a4 & 1) == 0) {
LABEL_31:
  }
    ubrk_setLineWordOpts();
LABEL_26:

  return v8;
}

id defaultBreakLanguage()
{
  if (defaultBreakLanguage_onceToken != -1) {
    dispatch_once(&defaultBreakLanguage_onceToken, &__block_literal_global_17_0);
  }
  v0 = (void *)defaultBreakLanguage_result;

  return v0;
}

void sub_18E5021BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E50228C(_Unwind_Exception *a1)
{
}

void sub_18E5022AC(void *a1)
{
}

void sub_18E502394(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E5024AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __NSLineBreakStrategyStandardActualOptions(char a1)
{
  if (!__NSUsesOptimalLineBreaking) {
    return 7;
  }
  uint64_t result = 11;
  if ((a1 & 1) == 0 && !__NSUsesOptimalLineBreakingForNonJustifiedAlignments) {
    return 7;
  }
  return result;
}

void sub_18E502910(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id __NSCreateNormalizedLanguage(CFStringRef localeIdentifier)
{
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringRef CanonicalLocaleIdentifierFromString = CFLocaleCreateCanonicalLocaleIdentifierFromString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], localeIdentifier);
  CFDictionaryRef ComponentsFromLocaleIdentifier = CFLocaleCreateComponentsFromLocaleIdentifier(v1, CanonicalLocaleIdentifierFromString);
  CFDictionaryRef v4 = ComponentsFromLocaleIdentifier;
  if (!ComponentsFromLocaleIdentifier
    || (Value = (void *)CFDictionaryGetValue(ComponentsFromLocaleIdentifier, (const void *)*MEMORY[0x1E4F1D218])) == 0)
  {
    id v6 = 0;
    if (!CanonicalLocaleIdentifierFromString) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v6 = Value;
  if (CanonicalLocaleIdentifierFromString) {
LABEL_6:
  }
    CFRelease(CanonicalLocaleIdentifierFromString);
LABEL_7:
  if (v4) {
    CFRelease(v4);
  }
  return v6;
}

CTFontRef UINewFont(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, CGFloat a7, double a8)
{
  v54[3] = *MEMORY[0x1E4F143B8];
  if (a7 != 0.0 || a3 != 0)
  {
    int v9 = a6;
    int v14 = a2;
    if (a5)
    {
      if (a3) {
        id v16 = +[_UIFontCacheKey newSystemFontCacheKeyWithDesign:a3 weight:a4 width:a6 pointSize:a8 monospacedDigits:a7];
      }
      else {
        id v16 = +[_UIFontCacheKey newSystemFontCacheKeyWithTraits:a2 pointSize:a4 width:a7];
      }
    }
    else
    {
      id v16 = +[_UIFontCacheKey newFontCacheKeyWithFontName:a1 traits:a2 pointSize:a7];
    }
    uint64_t v19 = v16;
    CTFontRef v20 = (CTFontRef)objc_msgSend(+[UIFont _sharedFontCache](UIFont, "_sharedFontCache"), "retainedObjectForKey:", v16);
    if (v20) {
      goto LABEL_46;
    }
    if (a5)
    {
      if (a3)
      {
        if (a4)
        {
          v54[0] = a3;
          v53[0] = @"NSCTFontUIFontDesignTrait";
          v53[1] = @"NSCTFontWeightTrait";
          v53[2] = @"NSCTFontProportionTrait";
          v54[1] = [NSNumber numberWithDouble:a8];
          v54[2] = a4;
          uint64_t v21 = (void *)MEMORY[0x1E4F1C9E8];
          char v22 = v54;
          int v23 = v53;
          uint64_t v24 = 3;
        }
        else
        {
          v51[0] = @"NSCTFontUIFontDesignTrait";
          v51[1] = @"NSCTFontWeightTrait";
          v52[0] = a3;
          v52[1] = [NSNumber numberWithDouble:a8];
          uint64_t v21 = (void *)MEMORY[0x1E4F1C9E8];
          char v22 = v52;
          int v23 = v51;
          uint64_t v24 = 2;
        }
        uint64_t v27 = [v21 dictionaryWithObjects:v22 forKeys:v23 count:v24];
        uint64_t v28 = v27;
        if (v9)
        {
          v49[0] = @"NSCTFontFeatureSettingsAttribute";
          v46[0] = @"CTFeatureTypeIdentifier";
          v46[1] = @"CTFeatureSelectorIdentifier";
          v47[0] = &unk_1EDD68D18;
          v47[1] = &unk_1EDD68D30;
          uint64_t v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
          uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
          v49[1] = @"NSCTFontTraitsAttribute";
          v50[0] = v29;
          v50[1] = v28;
          uint64_t v30 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v31 = v50;
          uint64_t v32 = (__CFString **)v49;
          uint64_t v33 = 2;
        }
        else
        {
          uint64_t v44 = @"NSCTFontTraitsAttribute";
          uint64_t v45 = v27;
          uint64_t v30 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v31 = &v45;
          uint64_t v32 = &v44;
          uint64_t v33 = 1;
        }
        uint64_t v34 = +[UIFontDescriptor fontDescriptorWithFontAttributes:](UIFontDescriptor, "fontDescriptorWithFontAttributes:", [v30 dictionaryWithObjects:v31 forKeys:v32 count:v33]);
        if (!v34)
        {
          uint64_t v39 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "UIFont *__UIUncachedFontWithDescriptor(UIFontDescriptor *, CGFloat)"), @"UIFont.m", 183, @"descriptor must not be nil!");
        }
        uint64_t v35 = CTFontCreateWithFontDescriptor((CTFontDescriptorRef)v34, a7, 0);
      }
      else
      {
        if (v14)
        {
          if ((v14 & 2) != 0)
          {
            CTFontUIFontType v26 = kCTFontUIFontEmphasizedSystem;
          }
          else if (v14)
          {
            CTFontUIFontType v26 = kCTFontControlContentFontType|kCTFontUserFixedPitchFontType;
          }
          else if ((v14 & 0x10) != 0)
          {
            CTFontUIFontType v26 = 104;
          }
          else if ((v14 & 8) != 0)
          {
            CTFontUIFontType v26 = kCTFontMiniEmphasizedSystemFontType|0x60;
          }
          else if ((v14 & 4) != 0)
          {
            CTFontUIFontType v26 = 102;
          }
          else
          {
            CTFontUIFontType v26 = kCTFontUIFontSystem;
          }
        }
        else
        {
          CTFontUIFontType v26 = kCTFontUIFontSystem;
        }
        CTFontRef UIFontForLanguage = CTFontCreateUIFontForLanguage(v26, a7, 0);
        CTFontRef v20 = UIFontForLanguage;
        if (!a4 || !UIFontForLanguage) {
          goto LABEL_44;
        }
        unint64_t v37 = (void *)[(__CTFont *)UIFontForLanguage fontDescriptor];
        uint64_t v41 = a4;
        uint64_t v42 = @"NSCTFontTraitsAttribute";
        id v40 = @"NSCTFontProportionTrait";
        uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        uint64_t v38 = objc_msgSend(v37, "fontDescriptorByAddingAttributes:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));

        uint64_t v35 = +[UIFont fontWithDescriptor:v38 size:a7];
      }
      uint64_t v25 = v35;
    }
    else
    {
      uint64_t v25 = (const __CTFont *)_CTFontCreateWithNameAndSymbolicTraits();
    }
    CTFontRef v20 = v25;
LABEL_44:
    if (v20)
    {
      __CTFontGetExtraData(v20);
      objc_msgSend(+[UIFont _sharedFontCache](UIFont, "_sharedFontCache"), "setObject:forKey:", v20, v19);
    }
LABEL_46:

    return v20;
  }
  id v17 = +[UIFont _sharedZeroPointFont];

  return (CTFontRef)v17;
}

CTLineRef __NSCoreTypesetterCreateBaseLineFromAttributedString(void *a1, CFIndex a2, unint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  v36[2] = *MEMORY[0x1E4F143B8];
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3052000000;
  uint64_t v30 = __Block_byref_object_copy__11;
  uint64_t v31 = __Block_byref_object_dispose__11;
  uint64_t v32 = a1;
  uint64_t v21 = 0;
  char v22 = &v21;
  uint64_t v23 = 0x3052000000;
  uint64_t v24 = __Block_byref_object_copy__11;
  uint64_t v25 = __Block_byref_object_dispose__11;
  uint64_t v26 = 0;
  if (!a2)
  {
    BOOL v11 = a3 >= [a1 length];
    if (!a6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  BOOL v11 = 0;
  if (a6)
  {
LABEL_5:
    uint64_t v12 = (void *)v28[5];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = ____NSCoreTypesetterCreateBaseLineFromAttributedString_block_invoke;
    v20[3] = &unk_1E55C77C8;
    v20[5] = &v27;
    v20[6] = &v21;
    v20[4] = a6;
    objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", @"NSAttachment", a2, a3, 0x100000, v20);
  }
LABEL_6:
  if (a4 == 1)
  {
    uint64_t v13 = *MEMORY[0x1E4F247F8];
    v35[0] = *MEMORY[0x1E4F24800];
    v35[1] = v13;
    v36[0] = MEMORY[0x1E4F1CC38];
    v36[1] = MEMORY[0x1E4F1CC38];
    CFDictionaryRef v14 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
LABEL_16:
    uint64_t v18 = CTTypesetterCreateWithAttributedStringAndOptions((CFAttributedStringRef)v28[5], v14);
    v37.location = a2;
    v37.length = a3;
    CTLineRef Line = CTTypesetterCreateLine(v18, v37);
    CFRelease(v18);
    goto LABEL_17;
  }
  if (a5)
  {
    CTLineRef Line = CTLineCreateWithAttributedString((CFAttributedStringRef)v28[5]);
    if (Line) {
      char v16 = v11;
    }
    else {
      char v16 = 1;
    }
    if ((v16 & 1) == 0)
    {
      uint64_t v17 = CTLineCreateFromLineWithOffset();
      CFRelease(Line);
      CTLineRef Line = (CTLineRef)v17;
    }
  }
  else
  {
    CTLineRef Line = 0;
  }
  uint64_t v33 = *MEMORY[0x1E4F247F8];
  uint64_t v34 = MEMORY[0x1E4F1CC38];
  CFDictionaryRef v14 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  if (!Line) {
    goto LABEL_16;
  }
LABEL_17:

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  return Line;
}

void sub_18E5033E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18E5038D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E5050D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

void __Block_byref_object_dispose__16(uint64_t a1)
{
}

void __Block_byref_object_dispose__17(uint64_t a1)
{
}

void __Block_byref_object_dispose__18(uint64_t a1)
{
}

void __Block_byref_object_dispose__19(uint64_t a1)
{
}

void sub_18E505E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose((const void *)(v44 - 232), 8);
  _Unwind_Resume(a1);
}

void sub_18E506308(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E5069AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose((const void *)(v54 - 248), 8);
  _Block_object_dispose((const void *)(v54 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_18E506B28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _UIFoundationAssert(void *a1, void *a2, int a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = a4;
  if (_UIFoundationAssert_onceToken == -1)
  {
    if (a3) {
      goto LABEL_9;
    }
  }
  else
  {
    dispatch_once(&_UIFoundationAssert_onceToken, &__block_literal_global_5);
    if (a3) {
      goto LABEL_9;
    }
  }
  id v10 = v9[2](v9, v7);
  if (![v10 length])
  {
    uint64_t v20 = (uint64_t)v8;
    uint64_t v11 = [NSString stringWithFormat:@"%@: Assertion failure"];

    id v10 = (void *)v11;
  }
  if (_UIFoundationAssert_raise)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@", v10 format];
  }
  else
  {
    uint64_t v12 = [v8 UTF8String];
    uint64_t v13 = [v10 UTF8String];
    __UIFoundationWriteLog(v12, OS_LOG_TYPE_DEBUG, v13, v14, v15, v16, v17, v18, v20);
  }

LABEL_9:
  return a3 ^ 1u;
}

void sub_18E507558(void *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  objc_begin_catch(exc_buf);
  *(void *)(v27 + 120) = a12;
  objc_exception_rethrow();
}

void sub_18E5075A8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,id a58,char a59)
{
  objc_end_catch();
  objc_destroyWeak(location);
  objc_destroyWeak(&a58);
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose((const void *)(v59 - 224), 8);
  _Block_object_dispose((const void *)(v59 - 192), 8);
  JUMPOUT(0x18E5075E4);
}

void sub_18E507674(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E507804(void *a1)
{
  objc_begin_catch(a1);
  *(unsigned char *)(v1 + v4) = 0;
  _OWORD *v2 = xmmword_18E5F72A0;
  *(_OWORD *)(v1 + v3) = xmmword_18E5F72A0;
  *(void *)(v1 + 176) = 0;
  *(void *)(v1 + v5) = 0;
  objc_exception_rethrow();
}

void sub_18E507834(_Unwind_Exception *a1)
{
  objc_end_catch();
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E5078EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E5080D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

void sub_18E508240(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E508310(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E5084D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E50863C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E508748(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E5087D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E508A2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E508B5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E508E3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_copy__6(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__7(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__8(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__9(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__10(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__11(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__12(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__13(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__14(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__15(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__16(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__17(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__18(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__19(uint64_t a1, uint64_t a2)
{
}

BOOL __NSScaledTextOversized(__CFString *a1, unint64_t a2, void *a3, uint64_t a4, void *a5, unint64_t a6, double a7, double a8, CGFloat a9, CGFloat a10, CGFloat a11, CGFloat a12)
{
  unsigned __int8 v33 = 0;
  [a5 setLayout:0];
  double v24 = __NSStringDrawingEngine(a1, a3, a4, 0, a5, 0, &v33, a9, a10, a11, a12, 0.0);
  double v27 = v26;
  if (a6 == 1)
  {
    double v28 = a7 / v25;
    if (a7 / v25 >= a8 / v26) {
      double v28 = a8 / v26;
    }
    return v28 < 1.0;
  }
  else
  {
    BOOL v30 = v26 > a8;
    if (a6)
    {
      unint64_t v31 = objc_msgSend(a5, "numberOfLineFragments", v24);
      BOOL v30 = v27 > a8 || v31 > a6;
    }
    if (a2 >= 0x201) {
      return v30;
    }
    else {
      return (v33 | v30) != 0;
    }
  }
}

CFLocaleRef __NSCreateLocaleForPreferredLanguage(CFStringRef localeIdentifier)
{
  CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringRef CanonicalLocaleIdentifierFromString = CFLocaleCreateCanonicalLocaleIdentifierFromString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], localeIdentifier);
  CFLocaleRef v3 = CFLocaleCreate(v1, CanonicalLocaleIdentifierFromString);
  if (CanonicalLocaleIdentifierFromString) {
    CFRelease(CanonicalLocaleIdentifierFromString);
  }
  return v3;
}

void sub_18E50BC30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __defaultTabStops_block_invoke()
{
  id v4 = (id)[objc_allocWithZone(MEMORY[0x1E4F1CA48]) initWithCapacity:12];
  unint64_t v0 = 1;
  uint64_t v1 = MEMORY[0x1E4F1CC08];
  do
  {
    objc_opt_class();
    uint64_t v2 = (NSTextTab *)__NSTextTabAllocMarkerInstance;
    if (!__NSTextTabAllocMarkerInstance) {
      uint64_t v2 = [NSTextTab alloc];
    }
    CFLocaleRef v3 = [(NSTextTab *)v2 initWithTextAlignment:0 location:v1 options:(double)v0 * 28.0];
    [v4 addObject:v3];

    ++v0;
  }
  while (v0 != 13);
  defaultTabStops_array = [v4 copyWithZone:0];
}

void sub_18E50BFD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E50C6D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

char *textTabHashCFSetCallback(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8);
  double v2 = *(double *)(a1 + 16);
  CFLocaleRef v3 = *(char **)(a1 + 24);
  if (v3) {
    CFLocaleRef v3 = (char *)CFHash(v3);
  }
  return &v3[0x10000000 * v1 + (unint64_t)v2];
}

void __NSCoreTypesetterRenderLineAndAttachments(CTLineRef line, void *a2, uint64_t a3, void *a4, const __CFAttributedString *a5, uint64_t a6, int a7, uint64_t a8, CGFloat a9, CGFloat a10, CGFloat a11, CGFloat a12, CGFloat a13, CGFloat a14)
{
  if (line) {
    _NSCoreTypesetterRenderLine(line, a2, a6, a5, a7, a8, a9, a10, a11, a12, a13, a14);
  }
  if (a4 && a2)
  {
    CFArrayRef GlyphRuns = CTLineGetGlyphRuns(line);
    CFIndex Count = CFArrayGetCount(GlyphRuns);
    v49.origin.x = a11;
    v49.origin.y = a12;
    v49.size.width = a13;
    v49.size.height = a14;
    BOOL v24 = NSEqualRects(v49, *MEMORY[0x1E4F28AD8]);
    double v25 = (CGContext *)[a2 CGContext];
    double v26 = v25;
    BOOL v40 = v24;
    if (!v24)
    {
      CGContextSaveGState(v25);
      v50.origin.x = a11;
      v50.origin.y = a12;
      v50.size.width = a13;
      v50.size.height = a14;
      CGContextClipToRect(v26, v50);
    }
    c = v26;
    if (Count >= 1)
    {
      CFIndex v27 = 0;
      uint64_t v28 = *MEMORY[0x1E4F247B0];
      do
      {
        ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, v27);
        CFDictionaryRef Attributes = CTRunGetAttributes(ValueAtIndex);
        if (-[__CFDictionary objectForKeyedSubscript:](Attributes, "objectForKeyedSubscript:", v28, c))
        {
          uint64_t v31 = [(__CFDictionary *)Attributes objectForKeyedSubscript:@"NSAttachment"];
          if (v31)
          {
            uint64_t v32 = (void *)v31;
            CFIndex location = CTRunGetStringRange(ValueAtIndex).location;
            CGPoint buffer = (CGPoint)0;
            long long v46 = 0u;
            CGFloat descent = 0.0;
            CGFloat ascent = 0.0;
            v47.CFIndex location = 0;
            v47.length = 0;
            double TypographicBounds = CTRunGetTypographicBounds(ValueAtIndex, v47, &ascent, &descent, 0);
            v48.CFIndex location = 0;
            v48.length = 1;
            CTRunGetPositions(ValueAtIndex, v48, &buffer);
            *(double *)&long long v46 = TypographicBounds;
            buffer.x = a9 + buffer.x;
            if ([a2 isFlipped])
            {
              double v35 = descent;
              double v36 = a10 + descent - buffer.y;
            }
            else
            {
              double v35 = descent;
              double v36 = buffer.y + a10 - descent;
            }
            buffer.y = v36;
            *((double *)&v46 + 1) = v35 + ascent;
            CFRange v37 = [[NSCountableTextLocation alloc] initWithIndex:location];
            uint64_t v38 = [a4 textContainerForLocation:v37];
            objc_msgSend(v32, "_showWithBounds:attributes:location:textContainer:applicationFrameworkContext:acceptsViewProvider:", Attributes, v37, v38, a3, 0, buffer.x, buffer.y, v46);
          }
        }
        ++v27;
      }
      while (Count != v27);
    }
    if (!v40) {
      CGContextRestoreGState(c);
    }
  }
}

void _NSCoreTypesetterRenderLine(const __CTLine *a1, void *a2, uint64_t a3, const __CFAttributedString *a4, int a5, uint64_t a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10, CGFloat a11, CGFloat a12)
{
  if (!a2) {
    return;
  }
  BOOL v24 = (CGContext *)[a2 CGContext];
  v38.origin.double x = a9;
  v38.origin.double y = a10;
  v38.size.double width = a11;
  v38.size.double height = a12;
  BOOL v25 = NSEqualRects(v38, *MEMORY[0x1E4F28AD8]);
  int v26 = [a2 isFlipped];
  if (!v25)
  {
    CGContextSaveGState(v24);
    v39.origin.double x = a9;
    v39.origin.double y = a10;
    v39.size.double width = a11;
    v39.size.double height = a12;
    CGContextClipToRect(v24, v39);
  }
  v37.a = 1.0;
  v37.b = 0.0;
  v37.c = 0.0;
  v37.d = 1.0;
  v37.tdouble x = 0.0;
  v37.tdouble y = 0.0;
  CGContextSetTextMatrix(v24, &v37);
  memset(&v36, 0, sizeof(v36));
  CGContextGetCTM(&v36, v24);
  double v27 = 1.0;
  transform.b = 0.0;
  transform.c = 0.0;
  if (v26) {
    double v27 = -1.0;
  }
  transform.a = 1.0;
  transform.d = v27;
  transform.tdouble x = a7;
  transform.tdouble y = a8;
  CGContextConcatCTM(v24, &transform);
  if (a5)
  {
    CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(a1, 8uLL);
    double x = BoundsWithOptions.origin.x;
    double y = BoundsWithOptions.origin.y;
    double width = BoundsWithOptions.size.width;
    double height = BoundsWithOptions.size.height;
  }
  else
  {
    double x = *MEMORY[0x1E4F1DB28];
    double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  if (!a3)
  {
    CTLineDraw(a1, v24);
    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  CTLineDrawWithAttributeOverrides();
  if (a4)
  {
LABEL_11:
    long long v32 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v34.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v34.c = v32;
    *(_OWORD *)&v34.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    CGContextSetTextMatrix(v24, &v34);
    unsigned __int8 v33 = CTLineCreateWithAttributedString(a4);
    CTLineDraw(v33, v24);
    CFRelease(v33);
  }
LABEL_12:
  CGAffineTransform v34 = v36;
  CGContextSetCTM();
  if (a6) {
    (*(void (**)(uint64_t, CGContext *, double, double, double, double))(a6 + 16))(a6, v24, x, y, width, height);
  }
  if (!v25) {
    CGContextRestoreGState(v24);
  }
}

void sub_18E50D644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t UIColorFunction()
{
  return classUIColor;
}

uint64_t UIColorFunction_0()
{
  return classUIColor_0;
}

uint64_t UIColorFunction_1()
{
  return classUIColor_1;
}

double _NSStringDrawingCore(__CFString *a1, void *a2, uint64_t a3, unsigned int a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, double a9, uint64_t a10, void *a11)
{
  uint64_t v21 = +[NSTextGraphicsContextProvider textGraphicsContextProviderClass];
  if (a11) {
    uint64_t v22 = [a11 applicationFrameworkContext];
  }
  else {
    uint64_t v22 = _NSTextScalingTypeForCurrentEnvironment();
  }
  uint64_t v23 = (void *)[(objc_class *)v21 graphicsContextForApplicationFrameworkContext:v22];

  return __NSStringDrawingEngine(a1, a2, a3, a4, a11, v23, 0, a5, a6, a7, a8, a9);
}

void sub_18E50EAF4(_Unwind_Exception *a1)
{
}

void sub_18E50EB14(void *a1)
{
}

void sub_18E50F174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_18E50F698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18E50F91C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18E510144(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t UIImageFunction()
{
  return classUIImage;
}

uint64_t UIImageFunction_0()
{
  return classUIImage_0;
}

void sub_18E5106E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18E5108B4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

Class initUIImage()
{
  __NSGetFrameworkReference(0, 0);
  Class result = objc_getClass("UIImage");
  classUIImage = (uint64_t)result;
  if (!result) {
    initUIImage_cold_1();
  }
  getUIImageClass Class = UIImageFunction;
  return result;
}

Class initUIImage_0()
{
  __NSGetFrameworkReference(0, 0);
  Class result = objc_getClass("UIImage");
  classUIImage_0 = (uint64_t)result;
  if (!result) {
    initUIImage_cold_1_0();
  }
  getUIImageClass_0 = UIImageFunction_0;
  return result;
}

Class initUIColor()
{
  __NSGetFrameworkReference(0, 0);
  Class result = objc_getClass("UIColor");
  classUIColor = (uint64_t)result;
  if (!result) {
    initUIColor_cold_1();
  }
  getUIColorClass[0] = UIColorFunction;
  return result;
}

Class initUIColor_0()
{
  __NSGetFrameworkReference(0, 0);
  Class result = objc_getClass("UIColor");
  classUIColor_0 = (uint64_t)result;
  if (!result) {
    initUIColor_cold_1_0();
  }
  getUIColorClass_0[0] = UIColorFunction_0;
  return result;
}

Class initUIColor_1()
{
  __NSGetFrameworkReference(0, 0);
  Class result = objc_getClass("UIColor");
  classUIColor_1 = (uint64_t)result;
  if (!result) {
    initUIColor_cold_1_1();
  }
  getUIColorClass_1[0] = UIColorFunction_1;
  return result;
}

uint64_t __UIGetLegibilityWeight(void *a1)
{
  if (a1) {
    return [a1 legibilityWeight];
  }
  else {
    return -1;
  }
}

uint64_t UIContentSizeCategoryUnspecifiedFunction()
{
  return constantUIContentSizeCategoryUnspecified;
}

uint64_t initUIContentSizeCategoryUnspecified()
{
  unint64_t v0 = (void *)__NSGetFrameworkReference(0, 0);
  uint64_t v1 = (uint64_t *)dlsym(v0, "UIContentSizeCategoryUnspecified");
  if (!v1) {
    initUIContentSizeCategoryUnspecified_cold_1();
  }
  uint64_t result = *v1;
  constantUIContentSizeCategoryUnspecified = result;
  getUIContentSizeCategoryUnspecified = UIContentSizeCategoryUnspecifiedFunction;
  return result;
}

uint64_t UIApplicationDidEnterBackgroundNotificationFunction()
{
  return constantUIApplicationDidEnterBackgroundNotification;
}

uint64_t UIApplicationDidEnterBackgroundNotificationFunction_0()
{
  return constantUIApplicationDidEnterBackgroundNotification_0;
}

void sub_18E5132B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E5134EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

NSUInteger __NSTextContentStorageEnumerateCachedElementsInElementIndexRange(NSUInteger result, NSUInteger a2, NSUInteger a3, uint64_t a4)
{
  NSUInteger v4 = a2 + a3;
  if (a2 < a2 + a3)
  {
    NSUInteger v8 = result;
    v13.CFIndex location = 0;
    v13.length = 0;
    NSUInteger v9 = a2;
    do
    {
      uint64_t v10 = [*(id *)(v8 + 96) pointerToElement:v9 directlyAccessibleElements:&v13];
      v14.length = v13.location - v9 + v13.length;
      v13.CFIndex location = v9;
      v13.length = v14.length;
      v14.CFIndex location = v9;
      v15.CFIndex location = a2;
      v15.length = a3;
      NSRange v11 = NSIntersectionRange(v14, v15);
      uint64_t result = v11.location;
      NSRange v13 = v11;
      if (v10) {
        BOOL v12 = v11.length == 0;
      }
      else {
        BOOL v12 = 1;
      }
      if (v12) {
        break;
      }
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, NSUInteger, NSUInteger))(a4 + 16))(a4, v10, v11.location, v11.length);
      NSUInteger v9 = v13.length + v13.location;
    }
    while (v13.length + v13.location < v4);
  }
  return result;
}

uint64_t initUIApplicationDidEnterBackgroundNotification()
{
  unint64_t v0 = (void *)__NSGetFrameworkReference(0, 0);
  uint64_t v1 = (uint64_t *)dlsym(v0, "UIApplicationDidEnterBackgroundNotification");
  if (!v1) {
    initUIApplicationDidEnterBackgroundNotification_cold_1();
  }
  uint64_t result = *v1;
  constantUIApplicationDidEnterBackgroundNotification = result;
  getUIApplicationDidEnterBackgroundNotification[0] = UIApplicationDidEnterBackgroundNotificationFunction;
  return result;
}

uint64_t initUIApplicationDidEnterBackgroundNotification_0()
{
  unint64_t v0 = (void *)__NSGetFrameworkReference(0, 0);
  uint64_t v1 = (uint64_t *)dlsym(v0, "UIApplicationDidEnterBackgroundNotification");
  if (!v1) {
    initUIApplicationDidEnterBackgroundNotification_cold_1_0();
  }
  uint64_t result = *v1;
  constantUIApplicationDidEnterBackgroundNotification_0 = result;
  getUIApplicationDidEnterBackgroundNotification_0 = UIApplicationDidEnterBackgroundNotificationFunction_0;
  return result;
}

uint64_t __NSGetFrameworkReference(void *a1, int a2)
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&__NSGetFrameworkReference_frameworkCacheLock);
    NSUInteger v4 = (const char *)[(id)__NSGetFrameworkReference_table objectForKey:a1];
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSGetFrameworkReference_frameworkCacheLock);
    if (!v4)
    {
      NSUInteger v4 = __NSLoadFramework(a1, a2);
      if (v4)
      {
        os_unfair_lock_lock((os_unfair_lock_t)&__NSGetFrameworkReference_frameworkCacheLock);
        uint64_t v5 = (void *)__NSGetFrameworkReference_table;
        if (!__NSGetFrameworkReference_table)
        {
          uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:2 capacity:0];
          __NSGetFrameworkReference_table = (uint64_t)v5;
        }
        if (![v5 objectForKey:a1]) {
          [(id)__NSGetFrameworkReference_table setObject:v4 forKey:a1];
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&__NSGetFrameworkReference_frameworkCacheLock);
      }
    }
  }
  else
  {
    if (__NSGetFrameworkReference_onceToken != -1) {
      dispatch_once(&__NSGetFrameworkReference_onceToken, &__block_literal_global_28);
    }
    return __NSGetFrameworkReference_UIFrameworkReference;
  }
  return (uint64_t)v4;
}

uint64_t initUIContentSizeCategoryDidChangeNotification()
{
  unint64_t v0 = (void *)__NSGetFrameworkReference(0, 0);
  uint64_t v1 = (uint64_t *)dlsym(v0, "UIContentSizeCategoryDidChangeNotification");
  if (!v1) {
    initUIContentSizeCategoryDidChangeNotification_cold_1();
  }
  uint64_t result = *v1;
  constantUIContentSizeCategoryDidChangeNotification = result;
  getUIContentSizeCategoryDidChangeNotification[0] = UIContentSizeCategoryDidChangeNotificationFunction;
  return result;
}

void __NSTextContentStorageUpdateElementIndexRangeForRange(uint64_t a1, id *a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
  int64x2_t v25 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  *(void *)&long long v26 = 0;
  *((void *)&v26 + 1) = 1;
  if (a3 >= 1)
  {
    BOOL v12 = a2;
    unint64_t v13 = (unint64_t)&a2[a3];
    do
    {
      uint64_t v14 = objc_msgSend((id)objc_msgSend(*v12, "elementRange"), "range");
      uint64_t v16 = v15;
      v25.i64[0] = a4;
      id v17 = *v12++;
      BYTE8(v26) = [v17 coalescingType];
      objc_msgSend(*(id *)(a1 + 88), "replaceElementsInRange:withElement:coalesceRuns:", v14, v16, &v25, 0);
      ++a4;
    }
    while ((unint64_t)v12 < v13);
  }
  if (a6)
  {
    __n128 v24 = 0uLL;
    unint64_t v18 = a5 + a6;
    if (a5 < a5 + a6)
    {
      do
      {
        uint64_t v19 = *(void **)(a1 + 88);
        _NSBlockNumberForIndex(v19, a5, &v24);
        if (v19[11] <= v20) {
          uint64_t v21 = v19[4] - v19[3];
        }
        else {
          uint64_t v21 = 0;
        }
        uint64_t v22 = v19[7] + (v19[2] + 8) * (v21 + v20);
        long long v23 = *(_OWORD *)(v22 + 24);
        int64x2_t v25 = *(int64x2_t *)(v22 + 8);
        long long v26 = v23;
        if (v25.i64[0] != 0x7FFFFFFFFFFFFFFFLL)
        {
          v25.i64[0] += a7;
          [*(id *)(a1 + 88) replaceElementsInRange:*(_OWORD *)&v24 withElement:&v25 coalesceRuns:0];
        }
        a5 = v24.n128_u64[1] + v24.n128_u64[0];
      }
      while (v24.n128_u64[1] + v24.n128_u64[0] < v18);
    }
  }
}

void _replaceElements(int64x2_t *a1, NSRange range1, NSUInteger a3, void *a4, int a5)
{
  NSUInteger length = range1.length;
  NSUInteger location = range1.location;
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  if (_NSConsistencyCheckEnabled) {
    [(int64x2_t *)a1 _consistencyCheck:0];
  }
  if (a3 && !a4)
  {
    uint64_t v10 = @"*** NSRunStorage (%p), _replaceElements(): no new element was given with a non-zero new length.";
LABEL_9:
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], v10, a1);
    goto LABEL_10;
  }
  if (!a3 && a4)
  {
    uint64_t v10 = @"*** NSRunStorage (%p), _replaceElements(): a new element was given with a new length of zero.";
    goto LABEL_9;
  }
LABEL_10:
  unint64_t v11 = location + length;
  NSUInteger v12 = a1->u64[1];
  unint64_t v13 = (void *)MEMORY[0x1E4F1C4A8];
  if (location + length > v12)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C4A8], @"*** NSRunStorage (%p), _replaceElements(): replaced range {%lu, %lu} extends beyond current run storage size %lu.", a1, location, length, v12 format];
    NSUInteger v12 = a1->u64[1];
  }
  if (__CFADD__(length, location))
  {
    [MEMORY[0x1E4F1CA00] raise:*v13, @"*** NSRunStorage (%p), _replaceElements(): replaced range {%llu, %llu} extends beyond current run storage size %llu and suffers from unsigned integer overflow.", a1, location, length, v12 format];
    NSUInteger v12 = a1->u64[1];
  }
  __n128 v151 = 0uLL;
  __n128 v150 = 0uLL;
  __src = a4;
  if (location >= v12)
  {
    uint64_t v16 = a1[1].i64[1];
    if (v16)
    {
      unint64_t v17 = v16 - 1;
      if (a1[5].i64[1] <= (unint64_t)(v16 - 1)) {
        uint64_t v18 = a1[2].i64[0] - v16;
      }
      else {
        uint64_t v18 = 0;
      }
      unint64_t v21 = *(void *)(a1[3].i64[1] + (a1[1].i64[0] + 8) * (v18 + v17));
      if (v17 >= a1[2].i64[1]) {
        v21 += a1[3].u64[0];
      }
      unint64_t v19 = v12 - v21;
    }
    else
    {
      unint64_t v19 = 0;
      unint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
      unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    }
    BOOL v23 = 0;
    int v20 = 0;
    NSUInteger v24 = 0;
    unint64_t v144 = 0;
    v25.NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v15 = a1[1].u64[1];
LABEL_62:
    unint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v16 || (unint64_t v38 = a1[2].u64[1], v38 == 0x7FFFFFFFFFFFFFFFLL))
    {
      char v39 = 1;
      goto LABEL_88;
    }
    unint64_t v40 = v16 - 1;
    if (v38 <= v16 - 1)
    {
      uint64_t v41 = a1[3].i64[1];
      do
      {
        uint64_t v42 = a1[3].i64[0];
        a1[2].i64[1] = v38 + 1;
        if (a1[5].i64[1] <= v38) {
          uint64_t v43 = a1[2].i64[0] - a1[1].i64[1];
        }
        else {
          uint64_t v43 = 0;
        }
        uint64_t v44 = (a1[1].i64[0] + 8) * (v43 + v38);
        *(void *)(v41 + v44) += v42;
        unint64_t v38 = a1[2].u64[1];
      }
      while (v38 <= v40);
      uint64_t v16 = a1[1].i64[1];
    }
    unint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
    char v45 = 1;
    char v39 = 1;
    if (v38 != v16) {
      goto LABEL_88;
    }
LABEL_87:
    a1[2].i64[1] = 0x7FFFFFFFFFFFFFFFLL;
    a1[3].i64[0] = 0;
    char v39 = v45;
    goto LABEL_88;
  }
  _NSBlockNumberForIndex(a1, location, &v151);
  unint64_t v15 = v14;
  if (length) {
    _NSBlockNumberForIndex(a1, v11 - 1, &v150);
  }
  else {
    __n128 v150 = v151;
  }
  if (v151.n128_u64[0] >= location)
  {
    if (v15)
    {
      unint64_t v17 = v15 - 1;
      if (a1[5].i64[1] <= v15 - 1) {
        uint64_t v22 = a1[2].i64[0] - a1[1].i64[1];
      }
      else {
        uint64_t v22 = 0;
      }
      unint64_t v21 = *(void *)(a1[3].i64[1] + (a1[1].i64[0] + 8) * (v22 + v17));
      if (v17 >= a1[2].i64[1]) {
        v21 += a1[3].u64[0];
      }
      int v20 = 0;
      unint64_t v19 = v151.n128_u64[0] - v21;
    }
    else
    {
      unint64_t v19 = 0;
      int v20 = 0;
      unint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
      unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    unint64_t v19 = v151.n128_u64[1];
    unint64_t v17 = v15++;
    int v20 = 1;
    unint64_t v21 = v151.n128_u64[0];
  }
  NSUInteger v24 = v150.n128_u64[1];
  v25.NSUInteger location = v150.n128_u64[0];
  if (v150.n128_u64[1] + v150.n128_u64[0] > v11)
  {
    BOOL v23 = v11 != v150.n128_u64[0];
    unint64_t v26 = v14;
    goto LABEL_58;
  }
  uint64_t v16 = a1[1].i64[1];
  unint64_t v26 = v14 + 1;
  if (v14 >= v16 - 1)
  {
    BOOL v23 = 0;
    NSUInteger v24 = 0;
    unint64_t v30 = v26 - v15;
    if (v26 < v15) {
      unint64_t v30 = 0;
    }
    unint64_t v144 = v30;
    v25.NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_62;
  }
  uint64_t v27 = a1[3].i64[1];
  unint64_t v28 = a1[5].u64[1];
  if (v28 <= v26) {
    uint64_t v29 = a1[2].i64[0] - v16;
  }
  else {
    uint64_t v29 = 0;
  }
  unint64_t v31 = v29 + v26;
  uint64_t v32 = a1[1].i64[0] + 8;
  v25.NSUInteger location = *(void *)(v27 + v32 * v31);
  unint64_t v33 = a1[2].u64[1];
  if (v26 >= v33) {
    v25.location += a1[3].u64[0];
  }
  if (v26 >= v16 - 1)
  {
    BOOL v23 = 0;
    uint64_t v36 = a1->i64[1];
  }
  else
  {
    unint64_t v34 = v14 + 2;
    if (v28 <= v14 + 2) {
      uint64_t v35 = a1[2].i64[0] - v16;
    }
    else {
      uint64_t v35 = 0;
    }
    uint64_t v36 = *(void *)(v27 + (v35 + v34) * v32);
    if (v34 >= v33) {
      v36 += a1[3].i64[0];
    }
    BOOL v23 = 0;
  }
  NSUInteger v24 = v36 - v25.location;
LABEL_58:
  unint64_t v37 = v26 - v15;
  if (v26 < v15) {
    unint64_t v37 = 0;
  }
  unint64_t v144 = v37;
  if (v26 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v16 = a1[1].i64[1];
    goto LABEL_62;
  }
  unint64_t v46 = a1[1].u64[1];
  if (v26 + 1 >= v46) {
    unint64_t v47 = v26;
  }
  else {
    unint64_t v47 = v26 + 1;
  }
  unint64_t v48 = a1[2].u64[1];
  if (v48 == 0x7FFFFFFFFFFFFFFFLL)
  {
    char v39 = 0;
    goto LABEL_88;
  }
  if (v48 <= v47)
  {
    uint64_t v49 = a1[3].i64[1];
    do
    {
      uint64_t v50 = a1[3].i64[0];
      a1[2].i64[1] = v48 + 1;
      if (a1[5].i64[1] <= v48) {
        uint64_t v51 = a1[2].i64[0] - a1[1].i64[1];
      }
      else {
        uint64_t v51 = 0;
      }
      uint64_t v52 = (a1[1].i64[0] + 8) * (v51 + v48);
      *(void *)(v49 + v52) += v50;
      unint64_t v48 = a1[2].u64[1];
    }
    while (v48 <= v47);
    unint64_t v46 = a1[1].u64[1];
  }
  char v45 = 0;
  char v39 = 0;
  if (v48 == v46) {
    goto LABEL_87;
  }
LABEL_88:
  NSUInteger range1a = length;
  NSUInteger v146 = a3;
  uint64_t v143 = a3 - length;
  if (v20) {
    unint64_t v19 = location - v21;
  }
  NSUInteger v53 = 0x7FFFFFFFFFFFFFFFLL;
  if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v54 = 0;
  }
  else {
    NSUInteger v54 = v19;
  }
  if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v55 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    NSUInteger v55 = v21;
  }
  if (v39)
  {
    NSUInteger v24 = 0;
  }
  else if (v23)
  {
    v154.NSUInteger location = location;
    v154.NSUInteger length = range1a;
    v25.NSUInteger length = v24;
    int v56 = v20;
    BOOL v57 = v23;
    unint64_t v148 = v26;
    NSUInteger v58 = location;
    unint64_t v59 = v15;
    NSUInteger v60 = v54;
    NSUInteger v61 = v55;
    unint64_t v62 = v17;
    char v63 = v39;
    NSRange v64 = NSIntersectionRange(v154, v25);
    char v39 = v63;
    unint64_t v17 = v62;
    NSUInteger v55 = v61;
    NSUInteger v54 = v60;
    unint64_t v15 = v59;
    NSUInteger location = v58;
    unint64_t v26 = v148;
    BOOL v23 = v57;
    int v20 = v56;
    BOOL v65 = v148 != v17 || v56 == 0;
    NSUInteger v53 = location + v146;
    if (v65) {
      NSUInteger v66 = 0;
    }
    else {
      NSUInteger v66 = v54;
    }
    NSUInteger v24 = v24 - v64.length - v66;
  }
  else
  {
    NSUInteger v53 = v25.location + v143;
  }
  unint64_t v149 = v15;
  uint64_t v140 = v53;
  if (!a5)
  {
    NSUInteger v69 = range1a;
    NSUInteger v70 = v146;
    v71 = __src;
    unint64_t v72 = v144;
    goto LABEL_188;
  }
  uint64_t v67 = 0;
  __n128 v151 = 0uLL;
  v152 = 0;
  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a1[5].i64[1] <= v17) {
      uint64_t v68 = a1[2].i64[0] - a1[1].i64[1];
    }
    else {
      uint64_t v68 = 0;
    }
    v151.n128_u64[0] = a1[3].i64[1] + (a1[1].i64[0] + 8) * (v68 + v17) + 8;
    uint64_t v67 = 1;
  }
  if (__src) {
    v151.n128_u64[v67++] = (unint64_t)__src;
  }
  if ((v39 & 1) == 0)
  {
    if (a1[5].i64[1] <= v26) {
      uint64_t v73 = a1[2].i64[0] - a1[1].i64[1];
    }
    else {
      uint64_t v73 = 0;
    }
    v151.n128_u64[v67++] = a1[3].i64[1] + (a1[1].i64[0] + 8) * (v73 + v26) + 8;
  }
  unint64_t v74 = v17;
  if (v67 == 3)
  {
    NSUInteger range2 = v24;
    BOOL v139 = v23;
    int v142 = v20;
    v77 = (const void *)v151.n128_u64[1];
    size_t v78 = a1[1].u64[0];
    if (!memcmp((const void *)v151.n128_u64[0], (const void *)v151.n128_u64[1], v78))
    {
      v156.NSUInteger location = location;
      v156.NSUInteger length = v146;
      v161.NSUInteger location = v55;
      v161.NSUInteger length = v54;
      NSRange v81 = NSUnionRange(v156, v161);
      NSUInteger location = v81.location;
      NSUInteger v80 = v81.length;
      int v142 = 0;
      --v149;
      ++v144;
      size_t v78 = a1[1].u64[0];
      if (v74) {
        uint64_t v79 = v74 - 1;
      }
      else {
        uint64_t v79 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      uint64_t v79 = v74;
      NSUInteger v80 = v146;
    }
    if (memcmp(v77, v152, v78))
    {
      NSUInteger v76 = location;
      unint64_t v17 = v79;
      NSUInteger v69 = range1a;
      NSUInteger v70 = v146;
      v71 = __src;
      int v20 = v142;
      unint64_t v72 = v144;
      BOOL v23 = v139;
      goto LABEL_187;
    }
    v157.NSUInteger location = location;
    v157.NSUInteger length = v80;
    v162.NSUInteger location = v53;
    v162.NSUInteger length = range2;
    NSRange v83 = NSUnionRange(v157, v162);
    NSUInteger v82 = v83.length;
    NSUInteger v76 = v83.location;
    unint64_t v84 = v144;
    if (v74 != v26) {
      unint64_t v84 = v144 + 1;
    }
    unint64_t v144 = v84;
    ++v26;
    unint64_t v85 = a1[1].u64[1];
    if (v26 < v85)
    {
      unint64_t v17 = v79;
      NSUInteger location = v83.location;
      NSUInteger v69 = range1a;
      NSUInteger v70 = v146;
      v71 = __src;
      int v20 = v142;
      unint64_t v72 = v144;
      goto LABEL_156;
    }
    BOOL v23 = 0;
    uint64_t v140 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v17 = v79;
    NSUInteger v69 = range1a;
    NSUInteger v70 = v146;
    v71 = __src;
    int v20 = v142;
    goto LABEL_184;
  }
  if (v67 != 2)
  {
    NSUInteger v76 = location;
    NSUInteger v69 = range1a;
    NSUInteger v70 = v146;
    v71 = __src;
    goto LABEL_128;
  }
  int v75 = v20;
  if (!memcmp((const void *)v151.n128_u64[0], (const void *)v151.n128_u64[1], a1[1].u64[0]))
  {
    unint64_t v17 = v74;
    if (__src && v74 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v155.NSUInteger location = location;
      v155.NSUInteger length = v146;
      v160.NSUInteger location = v55;
      v160.NSUInteger length = v54;
      NSUInteger v70 = v146;
      NSUInteger v76 = NSUnionRange(v155, v160).location;
      int v20 = 0;
      --v149;
      NSUInteger v69 = range1a;
      unint64_t v72 = v144 + 1;
      if (v74) {
        unint64_t v17 = v74 - 1;
      }
      else {
        unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v71 = __src;
      goto LABEL_187;
    }
    if (__src && v26 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v158.NSUInteger location = location;
      NSUInteger v70 = v146;
      v158.NSUInteger length = v146;
      v163.NSUInteger location = v53;
      v163.NSUInteger length = v24;
      NSRange v86 = NSUnionRange(v158, v163);
      NSUInteger v82 = v86.length;
      NSUInteger v76 = v86.location;
      NSUInteger v69 = range1a;
      unint64_t v72 = v144 + 1;
      ++v26;
      unint64_t v85 = a1[1].u64[1];
      if (v26 >= v85)
      {
        BOOL v23 = 0;
        uint64_t v140 = 0x7FFFFFFFFFFFFFFFLL;
        unint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
        v71 = __src;
        int v20 = v75;
        goto LABEL_129;
      }
      NSUInteger location = v86.location;
      v71 = __src;
      int v20 = v75;
      unint64_t v17 = v74;
LABEL_156:
      uint64_t v140 = v76 + v82;
      if (v26 == 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v89 = a1[2].u64[1];
        if (v89 == 0x7FFFFFFFFFFFFFFFLL)
        {
          BOOL v23 = 0;
          NSUInteger v76 = location;
          unint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_187;
        }
        unint64_t v96 = v85 - 1;
        if (v89 <= v85 - 1)
        {
          uint64_t v97 = a1[3].i64[1];
          do
          {
            uint64_t v98 = a1[3].i64[0];
            a1[2].i64[1] = v89 + 1;
            if (a1[5].i64[1] <= v89) {
              uint64_t v99 = a1[2].i64[0] - a1[1].i64[1];
            }
            else {
              uint64_t v99 = 0;
            }
            uint64_t v100 = (a1[1].i64[0] + 8) * (v99 + v89);
            *(void *)(v97 + v100) += v98;
            unint64_t v89 = a1[2].u64[1];
          }
          while (v89 <= v96);
          unint64_t v85 = a1[1].u64[1];
        }
        BOOL v23 = 0;
        if (v89 == v85) {
          *(int64x2_t *)((char *)&a1[2] + _Block_object_dispose(&STACK[0x768], 8) = (int64x2_t)xmmword_18E5F72A0;
        }
        unint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        if (v26 + 1 >= v85) {
          unint64_t v90 = v26;
        }
        else {
          unint64_t v90 = v26 + 1;
        }
        unint64_t v91 = a1[2].u64[1];
        if (v91 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_172;
        }
        if (v91 <= v90)
        {
          uint64_t v92 = a1[3].i64[1];
          do
          {
            uint64_t v93 = a1[3].i64[0];
            a1[2].i64[1] = v91 + 1;
            if (a1[5].i64[1] <= v91) {
              uint64_t v94 = a1[2].i64[0] - a1[1].i64[1];
            }
            else {
              uint64_t v94 = 0;
            }
            uint64_t v95 = (a1[1].i64[0] + 8) * (v94 + v91);
            *(void *)(v92 + v95) += v93;
            unint64_t v91 = a1[2].u64[1];
          }
          while (v91 <= v90);
          unint64_t v85 = a1[1].u64[1];
        }
        if (v91 != v85)
        {
LABEL_172:
          BOOL v23 = 0;
        }
        else
        {
          BOOL v23 = 0;
          *(int64x2_t *)((char *)&a1[2] + _Block_object_dispose(&STACK[0x768], 8) = (int64x2_t)xmmword_18E5F72A0;
        }
      }
      NSUInteger v76 = location;
      goto LABEL_187;
    }
    int v20 = v75;
    v87.NSUInteger location = v53;
    if (v26 != 0x7FFFFFFFFFFFFFFFLL && v74 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v159.NSUInteger location = v55;
      v159.NSUInteger length = v54;
      v87.NSUInteger length = v24;
      NSRange v88 = NSUnionRange(v159, v87);
      NSUInteger v82 = v88.length;
      NSUInteger v76 = v88.location;
      unint64_t v17 = v74;
      unint64_t v72 = v144;
      if (v74 != v26) {
        unint64_t v72 = v144 + 1;
      }
      ++v26;
      unint64_t v85 = a1[1].u64[1];
      if (v26 >= v85)
      {
        BOOL v23 = 0;
        uint64_t v140 = 0x7FFFFFFFFFFFFFFFLL;
        NSUInteger v76 = location;
        unint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
        NSUInteger v69 = range1a;
        NSUInteger v70 = v146;
        v71 = __src;
        int v20 = v75;
        goto LABEL_187;
      }
      NSUInteger v69 = range1a;
      NSUInteger v70 = v146;
      v71 = __src;
      int v20 = v75;
      goto LABEL_156;
    }
    NSUInteger v76 = location;
    NSUInteger v69 = range1a;
    NSUInteger v70 = v146;
    v71 = __src;
LABEL_184:
    unint64_t v72 = v144;
    goto LABEL_187;
  }
  NSUInteger v76 = location;
  NSUInteger v69 = range1a;
  NSUInteger v70 = v146;
  v71 = __src;
  int v20 = v75;
LABEL_128:
  unint64_t v72 = v144;
LABEL_129:
  unint64_t v17 = v74;
LABEL_187:
  NSUInteger location = v76;
LABEL_188:
  uint64_t v101 = 1;
  if (v71) {
    uint64_t v101 = 2;
  }
  if (v17 != v26) {
    uint64_t v101 = v71 != 0;
  }
  if (!v23 || v20 == 0) {
    unint64_t v103 = v71 != 0;
  }
  else {
    unint64_t v103 = v101;
  }
  uint64_t v104 = v103 - v72;
  if (v103 <= v72)
  {
    if (v103 >= v72) {
      goto LABEL_209;
    }
    unint64_t v105 = v17;
    uint64_t v108 = v72 - v103;
    -[int64x2_t _moveGapAndMergeWithBlockRange:](a1, "_moveGapAndMergeWithBlockRange:", v103 + v149, v72 - v103);
    uint64_t v109 = a1[2].i64[1];
    if (v109 != 0x7FFFFFFFFFFFFFFFLL) {
      a1[2].i64[1] = v109 - v108;
    }
    unint64_t v107 = v26 - v108;
  }
  else
  {
    unint64_t v105 = v17;
    [(int64x2_t *)a1 _ensureCapacity:a1[1].i64[1] + v104];
    [(int64x2_t *)a1 _moveGapToBlockIndex:v72 + v149];
    a1[1].i64[1] += v104;
    a1[5].i64[1] += v104;
    uint64_t v106 = a1[2].i64[1];
    if (v106 != 0x7FFFFFFFFFFFFFFFLL) {
      a1[2].i64[1] = v106 + v104;
    }
    unint64_t v107 = v104 + v26;
  }
  if (v26 != 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v26 = v107;
  }
  unint64_t v17 = v105;
LABEL_209:
  if (v103 != 1)
  {
    if (v103 == 2)
    {
      p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSTextElementProvider + 32);
      unint64_t v111 = v17;
      if (a1[5].i64[1] <= v149) {
        uint64_t v112 = a1[2].i64[0] - a1[1].i64[1];
      }
      else {
        uint64_t v112 = 0;
      }
      int v117 = (NSUInteger *)(a1[3].i64[1] + (a1[1].i64[0] + 8) * (v112 + v149));
      *int v117 = location;
      memmove(v117 + 1, v71, a1[1].u64[0]);
      uint64_t v113 = a1[3].i64[1];
      if (a1[5].i64[1] <= v149 + 1) {
        uint64_t v118 = a1[2].i64[0] - a1[1].i64[1];
      }
      else {
        uint64_t v118 = 0;
      }
      uint64_t v116 = v143;
      v119 = (uint64_t *)(v113 + (a1[1].i64[0] + 8) * (v118 + v149 + 1));
      uint64_t *v119 = v140;
      char v120 = v119 + 1;
      if (a1[5].i64[1] <= v111) {
        uint64_t v121 = a1[2].i64[0] - a1[1].i64[1];
      }
      else {
        uint64_t v121 = 0;
      }
      unint64_t v122 = v121 + v111;
LABEL_239:
      memmove(v120, (const void *)(v113 + (a1[1].i64[0] + 8) * v122 + 8), a1[1].u64[0]);
      goto LABEL_240;
    }
    p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSTextElementProvider + 32);
    uint64_t v116 = v143;
    if (v26 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_240;
    }
LABEL_230:
    if (a1[5].i64[1] <= v26) {
      uint64_t v125 = a1[2].i64[0] - a1[1].i64[1];
    }
    else {
      uint64_t v125 = 0;
    }
    *(void *)(a1[3].i64[1] + (a1[1].i64[0] + 8) * (v125 + v26)) = v140;
    goto LABEL_240;
  }
  uint64_t v113 = a1[3].i64[1];
  unint64_t v114 = a1[5].u64[1];
  if (!v71)
  {
    if (v114 <= v149) {
      uint64_t v123 = a1[2].i64[0] - a1[1].i64[1];
    }
    else {
      uint64_t v123 = 0;
    }
    p_class_meths = &OBJC_PROTOCOL___NSTextElementProvider.class_meths;
    uint64_t v116 = v143;
    double v126 = (uint64_t *)(v113 + (a1[1].i64[0] + 8) * (v123 + v149));
    *double v126 = v140;
    char v120 = v126 + 1;
    if (a1[5].i64[1] <= v17) {
      uint64_t v127 = a1[2].i64[0] - a1[1].i64[1];
    }
    else {
      uint64_t v127 = 0;
    }
    unint64_t v122 = v127 + v17;
    goto LABEL_239;
  }
  if (v114 <= v149) {
    uint64_t v115 = a1[2].i64[0] - a1[1].i64[1];
  }
  else {
    uint64_t v115 = 0;
  }
  p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSTextElementProvider + 32);
  uint64_t v116 = v143;
  double v124 = (NSUInteger *)(v113 + (a1[1].i64[0] + 8) * (v115 + v149));
  *double v124 = location;
  memmove(v124 + 1, v71, a1[1].u64[0]);
  if (v26 != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_230;
  }
LABEL_240:
  unint64_t v128 = a1[2].u64[1];
  BOOL v130 = v70 != v69 && v26 != 0x7FFFFFFFFFFFFFFFLL;
  if (v128 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!v130 || v26 + 1 >= a1[1].i64[1]) {
      goto LABEL_262;
    }
    a1[2].i64[1] = v26 + 1;
  }
  else
  {
    if (!v130) {
      goto LABEL_262;
    }
    unint64_t v131 = v26 + 1;
    unint64_t v132 = a1[1].u64[1];
    if (v26 + 1 >= v132) {
      goto LABEL_262;
    }
    if (v128 == v131)
    {
      a1[3].i64[0] += v116;
      goto LABEL_262;
    }
    unint64_t v133 = v132 - 1;
    if (v128 <= v133)
    {
      uint64_t v134 = a1[3].i64[1];
      do
      {
        uint64_t v135 = a1[3].i64[0];
        a1[2].i64[1] = v128 + 1;
        if (a1[5].i64[1] <= v128) {
          uint64_t v136 = a1[2].i64[0] - a1[1].i64[1];
        }
        else {
          uint64_t v136 = 0;
        }
        uint64_t v137 = (a1[1].i64[0] + 8) * (v136 + v128);
        *(void *)(v134 + v137) += v135;
        unint64_t v128 = a1[2].u64[1];
      }
      while (v128 <= v133);
    }
    a1[2].i64[1] = v131;
  }
  a1[3].i64[0] = v116;
LABEL_262:
  a1->i64[1] += v116;
  a1[4] = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  a1[5].i64[0] = 0;
  if (*((unsigned char *)p_class_meths + 2792)) {
    [(int64x2_t *)a1 _consistencyCheck:1];
  }
}

void sub_18E515568(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_18E516784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,id location,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&a72, 8);
  _Block_object_dispose(&STACK[0x218], 8);
  _Unwind_Resume(a1);
}

void sub_18E516D7C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E516FA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E517024(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E5179F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_18E518104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_18E518374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  if (v10) {
    objc_end_catch();
  }
  _Block_object_dispose(va, 8);
  objc_sync_exit(v9);
  _Unwind_Resume(a1);
}

void sub_18E5183A8(void *a1)
{
}

void sub_18E518DFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *__NSTextElementGetFirstRepresentableChild(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v1 = objc_msgSend(a1, "childElements", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)v10;
LABEL_3:
  uint64_t v5 = 0;
  while (1)
  {
    if (*(void *)v10 != v4) {
      objc_enumerationMutation(v1);
    }
    id v6 = *(void **)(*((void *)&v9 + 1) + 8 * v5);
    if ([v6 isRepresentedElement]) {
      return v6;
    }
    uint64_t FirstRepresentableChild = __NSTextElementGetFirstRepresentableChild(v6);
    if (FirstRepresentableChild) {
      return (void *)FirstRepresentableChild;
    }
    if (v3 == ++v5)
    {
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      id v6 = 0;
      if (v3) {
        goto LABEL_3;
      }
      return v6;
    }
  }
}

void sub_18E5190B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18E519298(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E51938C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E519658(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E519774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18E5197FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E519C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
}

void sub_18E51A28C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E51A3AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *__NSTextContentStorageChildElementsEnumerationCacheGetNextElement(uint64_t a1)
{
  while (1)
  {
    int v2 = *(unsigned __int8 *)(a1 + 33);
    *(unsigned char *)(a1 + 33) = 0;
    uint64_t v3 = (void *)MEMORY[0x192FAE510]();
    unint64_t v4 = *(void *)(a1 + 24);
    if ((v4 & 0x8000000000000000) != 0 || v4 >= [*(id *)(a1 + 8) count]) {
      break;
    }
    uint64_t v5 = *(void *)(a1 + 24);
    NextElement = (void *)[*(id *)(a1 + 8) objectAtIndexedSubscript:v5];
    uint64_t v7 = [NextElement childElements];
    NSUInteger v8 = (void *)v7;
    if (*(unsigned char *)(a1 + 32))
    {
      unint64_t v9 = v5 + 1;
      if (v7)
      {
        long long v10 = *(void **)(a1 + 16);
        *(void *)a1 = NextElement;
        *(void *)(a1 + _Block_object_dispose(&STACK[0x768], 8) = v7;
        if (v10) {
          long long v11 = (void *)[v10 indexPathByAddingIndex:v9];
        }
        else {
          long long v11 = (void *)[MEMORY[0x1E4F28D58] indexPathWithIndex:v9];
        }
        *(void *)(a1 + 16) = v11;
        if (*(unsigned char *)(a1 + 32)) {
          uint64_t v28 = 0;
        }
        else {
          uint64_t v28 = [v8 count] - 1;
        }
        *(void *)(a1 + 24) = v28;
      }
      else if (v9 >= [*(id *)(a1 + 8) count])
      {
        do
        {
          uint64_t v22 = *(void **)(a1 + 16);
          uint64_t v23 = [v22 length];
          NSUInteger v24 = *(void **)a1;
          *(unsigned char *)(a1 + 33) = *(void *)a1 != 0;
          NSRange v25 = (void *)[v24 parentElement];
          *(void *)a1 = v25;
          *(void *)(a1 + _Block_object_dispose(&STACK[0x768], 8) = [v25 childElements];
          if (v23 <= 0)
          {
            id v26 = 0;
            *(void *)(a1 + 24) = 0x7FFFFFFFFFFFFFFFLL;
          }
          else
          {
            *(void *)(a1 + 24) = [*(id *)(a1 + 16) indexAtPosition:v23 - 1];
            if (v23 == 1) {
              id v26 = 0;
            }
            else {
              id v26 = (id)[*(id *)(a1 + 16) indexPathByRemovingLastIndex];
            }
          }
          *(void *)(a1 + 16) = v26;

          if (![*(id *)a1 parentElement]) {
            break;
          }
          unint64_t v27 = *(void *)(a1 + 24);
        }
        while (v27 >= [*(id *)(a1 + 8) count]);
      }
      else
      {
        *(void *)(a1 + 24) = v9;
      }
      goto LABEL_15;
    }
    if (v2 || !v7)
    {
      if (v5 < 0)
      {
        uint64_t v29 = *(void **)(a1 + 16);
        uint64_t v30 = [v29 length];
        id v31 = *(id *)a1;
        *(unsigned char *)(a1 + 33) = *(void *)a1 != 0;
        uint64_t v32 = (void *)[v31 parentElement];
        *(void *)a1 = v32;
        *(void *)(a1 + _Block_object_dispose(&STACK[0x768], 8) = [v32 childElements];
        if (v30 <= 0)
        {
          id v33 = 0;
          *(void *)(a1 + 24) = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          *(void *)(a1 + 24) = [*(id *)(a1 + 16) indexAtPosition:v30 - 1];
          if (v30 == 1) {
            id v33 = 0;
          }
          else {
            id v33 = (id)[*(id *)(a1 + 16) indexPathByRemovingLastIndex];
          }
        }
        *(void *)(a1 + 16) = v33;

        goto LABEL_15;
      }
      uint64_t v21 = v5 - 1;
    }
    else
    {
      do
      {
        unint64_t v17 = *(void **)(a1 + 16);
        *(void *)a1 = NextElement;
        *(void *)(a1 + _Block_object_dispose(&STACK[0x768], 8) = v8;
        if (v17) {
          uint64_t v18 = (void *)[v17 indexPathByAddingIndex:v5];
        }
        else {
          uint64_t v18 = (void *)[MEMORY[0x1E4F28D58] indexPathWithIndex:v5];
        }
        *(void *)(a1 + 16) = v18;
        if (*(unsigned char *)(a1 + 32)) {
          uint64_t v19 = 0;
        }
        else {
          uint64_t v19 = [v8 count] - 1;
        }
        *(void *)(a1 + 24) = v19;

        uint64_t v20 = [*(id *)(a1 + 8) count];
        uint64_t v5 = v20 - 1;
        NextElement = (void *)[*(id *)(a1 + 8) objectAtIndexedSubscript:v20 - 1];
        NSUInteger v8 = (void *)[NextElement childElements];
      }
      while (v8);
      uint64_t v21 = v20 - 2;
    }
    *(void *)(a1 + 24) = v21;
LABEL_15:
    if (!NextElement || [NextElement isRepresentedElement]) {
      return NextElement;
    }
  }
  long long v12 = *(void **)(a1 + 16);
  uint64_t v13 = [v12 length];
  id v14 = *(id *)a1;
  *(unsigned char *)(a1 + 33) = *(void *)a1 != 0;
  unint64_t v15 = (void *)[v14 parentElement];
  *(void *)a1 = v15;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x768], 8) = [v15 childElements];
  if (v13 <= 0)
  {
    id v16 = 0;
    *(void *)(a1 + 24) = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    *(void *)(a1 + 24) = [*(id *)(a1 + 16) indexAtPosition:v13 - 1];
    if (v13 == 1) {
      id v16 = 0;
    }
    else {
      id v16 = (id)[*(id *)(a1 + 16) indexPathByRemovingLastIndex];
    }
  }
  *(void *)(a1 + 16) = v16;

  if (!*(unsigned char *)(a1 + 32) && *(unsigned char *)(a1 + 33))
  {
    NextElement = (void *)__NSTextContentStorageChildElementsEnumerationCacheGetNextElement(a1);
    goto LABEL_15;
  }
  return 0;
}

void sub_18E51AD34(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E51C308(void *a1)
{
}

void sub_18E51C324(_Unwind_Exception *a1)
{
}

void __NSCoreTypesetterProcessTextLineFragment(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14)
{
  uint64_t v28 = [NSTextLineFragment alloc];
  if (a1) {
    uint64_t v29 = -[NSTextLineFragment initWithAttributedString:range:](v28, "initWithAttributedString:range:", a1, a4, a5);
  }
  else {
    uint64_t v29 = -[NSTextLineFragment initWithString:attributes:range:](v28, "initWithString:attributes:range:", a2, a3, a4, a5);
  }
  uint64_t v30 = v29;
  -[NSTextLineFragment setGlyphOrigin:](v29, "setGlyphOrigin:", a8 + a14, a9);
  -[NSTextLineFragment setTypographicBounds:](v30, "setTypographicBounds:", a10, a11, a12 + a14 * 2.0, a13);
  [(NSTextLineFragment *)v30 setPadding:a14];
  [(NSTextLineFragment *)v30 setApplicationFrameworkContext:a6];
  (*(void (**)(uint64_t, NSTextLineFragment *))(a7 + 16))(a7, v30);
}

CGFloat __NSTextLayoutFragmentUpdateTotalBoundsWithTypographicBounds(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double v8 = a8;
  double v9 = a7;
  CGFloat v10 = a6;
  v32.origin.double x = a5;
  v32.origin.double y = a6;
  v32.size.double width = a7;
  v32.size.double height = a8;
  BOOL v16 = CGRectEqualToRect(v32, *MEMORY[0x1E4F1DB28]);
  CGFloat v17 = a1;
  CGFloat v18 = a2;
  CGFloat v19 = a3;
  CGFloat v20 = a4;
  if (v16)
  {
    if (CGRectGetMinY(*(CGRect *)&v17) > 0.0)
    {
      v33.origin.double x = a1;
      v33.origin.double y = a2;
      v33.size.double width = a3;
      v33.size.double height = a4;
      CGRectGetMaxY(v33);
    }
  }
  else if (CGRectGetWidth(*(CGRect *)&v17) <= 0.0 {
         && (v34.origin.double x = a1, v34.origin.y = a2,
  }
                                v34.size.double width = a3,
                                v34.size.double height = a4,
                                CGRectGetHeight(v34) <= 0.0))
  {
    return a5;
  }
  else
  {
    v35.origin.double x = a1;
    v35.origin.double y = a2;
    v35.size.double width = a3;
    v35.size.double height = a4;
    CGFloat MinX = CGRectGetMinX(v35);
    CGFloat v22 = a5;
    double v23 = MinX;
    double rect = v22;
    v36.origin.double x = v22;
    v36.origin.double y = v10;
    v36.size.double width = v9;
    v36.size.double height = v8;
    if (v23 < CGRectGetMinX(v36))
    {
      v37.origin.double x = rect;
      v37.origin.double y = v10;
      v37.size.double width = v9;
      v37.size.double height = v8;
      double MaxX = CGRectGetMaxX(v37);
      v38.origin.double x = a1;
      v38.origin.double y = a2;
      v38.size.double width = a3;
      v38.size.double height = a4;
      double v9 = MaxX - CGRectGetMinX(v38);
      v39.origin.double x = a1;
      v39.origin.double y = a2;
      v39.size.double width = a3;
      v39.size.double height = a4;
      double rect = CGRectGetMinX(v39);
    }
    v40.origin.double x = a1;
    v40.origin.double y = a2;
    v40.size.double width = a3;
    v40.size.double height = a4;
    double v25 = CGRectGetMaxX(v40);
    v41.origin.double x = rect;
    v41.origin.double y = v10;
    v41.size.double width = v9;
    v41.size.double height = v8;
    if (v25 > CGRectGetMaxX(v41))
    {
      v42.origin.double x = a1;
      v42.origin.double y = a2;
      v42.size.double width = a3;
      v42.size.double height = a4;
      double v26 = CGRectGetMaxX(v42);
      v43.origin.double x = rect;
      v43.origin.double y = v10;
      v43.size.double width = v9;
      v43.size.double height = v8;
      double v9 = v26 - CGRectGetMinX(v43);
    }
    v44.origin.double x = a1;
    v44.origin.double y = a2;
    v44.size.double width = a3;
    v44.size.double height = a4;
    double MinY = CGRectGetMinY(v44);
    v45.origin.double x = rect;
    v45.origin.double y = v10;
    v45.size.double width = v9;
    v45.size.double height = v8;
    if (MinY < CGRectGetMinY(v45))
    {
      v46.origin.double x = rect;
      v46.origin.double y = v10;
      v46.size.double width = v9;
      v46.size.double height = v8;
      double MaxY = CGRectGetMaxY(v46);
      v47.origin.double x = a1;
      v47.origin.double y = a2;
      v47.size.double width = a3;
      v47.size.double height = a4;
      double v8 = MaxY - CGRectGetMinY(v47);
      v48.origin.double x = a1;
      v48.origin.double y = a2;
      v48.size.double width = a3;
      v48.size.double height = a4;
      CGFloat v10 = CGRectGetMinY(v48);
    }
    v49.origin.double x = a1;
    v49.origin.double y = a2;
    v49.size.double width = a3;
    v49.size.double height = a4;
    double v29 = CGRectGetMaxY(v49);
    v50.origin.double x = rect;
    v50.origin.double y = v10;
    v50.size.double width = v9;
    v50.size.double height = v8;
    if (v29 <= CGRectGetMaxY(v50))
    {
      return rect;
    }
    else
    {
      v51.origin.double x = a1;
      v51.origin.double y = a2;
      v51.size.double width = a3;
      v51.size.double height = a4;
      CGRectGetMaxY(v51);
      a1 = rect;
      v52.origin.double x = rect;
      v52.origin.double y = v10;
      v52.size.double width = v9;
      v52.size.double height = v8;
      CGRectGetMinY(v52);
    }
  }
  return a1;
}

void sub_18E51CC70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18E51CEA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t textTabIsEqualCFSetCallback(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24)) {
    uint64_t v3 = *(void **)(a1 + 24);
  }
  else {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  if (*(void *)(a2 + 24)) {
    unint64_t v4 = *(void **)(a2 + 24);
  }
  else {
    unint64_t v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  if (((*(_DWORD *)(a2 + 8) ^ *(_DWORD *)(a1 + 8)) & 0xF) != 0 || *(double *)(a1 + 16) != *(double *)(a2 + 16)) {
    return 0;
  }
  if (v3 == v4) {
    return 1;
  }
  return objc_msgSend(v3, "isEqualToDictionary:");
}

void sub_18E51DF3C(_Unwind_Exception *a1)
{
}

void sub_18E51DF5C(void *a1)
{
}

uint64_t __NSConcreteTextStorageLockedForwarding(id *a1, uint64_t a2)
{
  int v4 = [a1 _lockForWritingWithExceptionHandler:0];
  [a1[13] beginEditing];
  (*(void (**)(uint64_t))(a2 + 16))(a2);
  uint64_t result = [a1[13] endEditing];
  if (v4) {
    return [a1 _unlock];
  }
  return result;
}

void sub_18E51DFE8(_Unwind_Exception *a1)
{
}

void sub_18E51E134(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E51E1A4(_Unwind_Exception *a1)
{
}

void sub_18E51E1C4(void *a1)
{
}

void sub_18E520DB4(_Unwind_Exception *a1)
{
}

void sub_18E520DC8(void *a1)
{
  objc_begin_catch(a1);
  if (v1) {
    JUMPOUT(0x18E520D94);
  }
  JUMPOUT(0x18E520D84);
}

void sub_18E5218D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E521A78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_18E521B4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

NSUInteger __NSTextContentStorageUpdateCachedRange(uint64_t a1)
{
  NSUInteger result = [*(id *)(a1 + 96) count];
  if (result && (v3 = result, NSUInteger result = [*(id *)(a1 + 96) count], v3 <= result))
  {
    NSUInteger result = objc_msgSend((id)objc_msgSend(*(id *)objc_msgSend(*(id *)(a1 + 96), "elementAtIndex:", 0), "elementRange"), "range");
    NSUInteger location = result;
    NSUInteger length = v6;
    if (v3 >= 2)
    {
      v10.NSUInteger location = objc_msgSend((id)objc_msgSend(*(id *)objc_msgSend(*(id *)(a1 + 96), "elementAtIndex:", v3 - 1), "elementRange"), "range");
      v10.NSUInteger length = v7;
      v9.NSUInteger location = location;
      v9.NSUInteger length = length;
      NSRange v8 = NSUnionRange(v9, v10);
      NSUInteger result = v8.location;
      NSUInteger location = v8.location;
      NSUInteger length = v8.length;
    }
  }
  else
  {
    NSUInteger length = 0;
    NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
  }
  *(void *)(a1 + 104) = location;
  *(void *)(a1 + 112) = length;
  return result;
}

NSUInteger __NSTextContentStorageReleaseElementsInRange(NSUInteger a1, NSUInteger a2, NSUInteger a3)
{
  if (a2 == 0x7FFFFFFFFFFFFFFFLL && a3 == 0)
  {
    a3 = [*(id *)(a1 + 96) count];
    a2 = 0;
  }

  return __NSTextContentStorageEnumerateCachedElementsInElementIndexRange(a1, a2, a3, (uint64_t)&__block_literal_global_307);
}

uint64_t __NSTextContentStorageGetElementIndexRangeForRange(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v3 = a2;
  unint64_t v5 = a2 + a3;
  unint64_t v6 = [*(id *)(a1 + 88) count];
  if (v5 >= v6) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = v5;
  }
  if (v3 >= v7) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  __n128 v13 = 0uLL;
  do
  {
    NSRange v8 = *(void **)(a1 + 88);
    _NSBlockNumberForIndex(v8, v3, &v13);
    if (v8[11] <= v9) {
      uint64_t v10 = v8[4] - v8[3];
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = *(void *)(v8[7] + (v8[2] + 8) * (v10 + v9) + 8);
    unint64_t v3 = v13.n128_u64[1] + v13.n128_u64[0];
  }
  while (v13.n128_u64[1] + v13.n128_u64[0] < v7 && v11 == 0x7FFFFFFFFFFFFFFFLL);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v3 < v7)
  {
    do
    {
      _NSBlockNumberForIndex(*(void **)(a1 + 88), v3, &v13);
      unint64_t v3 = v13.n128_u64[1] + v13.n128_u64[0];
    }
    while (v13.n128_u64[1] + v13.n128_u64[0] < v7);
  }
  return v11;
}

void sub_18E522248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v7);
  _Unwind_Resume(a1);
}

void sub_18E522CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
}

void sub_18E5246E0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18E5249F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18E524D5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E525594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

void sub_18E525D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_18E525EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18E5264E0(_Unwind_Exception *exception_object)
{
}

void sub_18E526510(void *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x18E52647CLL);
  }
  JUMPOUT(0x18E526504);
}

void __NSTextLayoutFragmentConfigureForTextAnimationContext(uint64_t a1, void *a2)
{
  *(void *)(a1 + 112) = a2;
  if (a2)
  {
    *(void *)(a1 + 120) = [a2 _effectiveComponents];
    *(void *)(a1 + 12_Block_object_dispose(&STACK[0x2B0], 8) = [a2 _effectiveExclusiveComponents];
    *(unsigned char *)(a1 + 216) = 0;
    int v4 = (void *)[a2 textRanges];
    uint64_t v5 = [(id)a1 rangeInElement];
    if (v4)
    {
      uint64_t v6 = v5;
      if (objc_msgSend((id)objc_msgSend(a2, "_unionTextRange"), "intersectsWithTextRange:", v5))
      {
        unint64_t v7 = [v4 count];
        uint64_t v12 = 0;
        uint64_t v13 = &v12;
        uint64_t v14 = 0x2020000000;
        uint64_t v15 = 0;
        uint64_t v8 = [(id)a1 textParagraph];
        uint64_t v9 = objc_msgSend((id)objc_msgSend((id)a1, "textLayoutManager"), "textContentManager");
        if (v7 < 5)
        {
          v13[3] = a1 + 136;
          *(unsigned char *)(a1 + 216) = 1;
        }
        else
        {
          uint64_t v10 = NSZoneCalloc(0, v7 + 1, 0x10uLL);
          *(void *)(a1 + 136) = v10;
          v13[3] = (uint64_t)v10;
        }
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = ____NSTextLayoutFragmentConfigureForTextAnimationContext_block_invoke;
        v11[3] = &unk_1E55C55B0;
        v11[4] = v6;
        v11[5] = a1;
        v11[6] = v9;
        v11[7] = v8;
        v11[8] = &v12;
        v11[9] = v7;
        [v4 enumerateObjectsUsingBlock:v11];
        *(_OWORD *)v13[3] = xmmword_18E5F72A0;
        _Block_object_dispose(&v12, 8);
      }
    }
  }
  else if (!*(unsigned char *)(a1 + 216) && !*(void *)(a1 + 136))
  {
    NSZoneFree(0, 0);
    *(void *)(a1 + 136) = 0;
  }
}

void sub_18E526870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __NSCoreTypesetterHyphenateLine(uint64_t a1, uint64_t a2, int a3, double *a4, double *a5)
{
  if (*(void *)a1)
  {
    CTLineGetStringRange(*(CTLineRef *)a1);
    uint64_t HyphenatedLineWithOffset = CTLineCreateHyphenatedLineWithOffset();
    if (!HyphenatedLineWithOffset) {
      __NSCoreTypesetterHyphenateLine_cold_1();
    }
    uint64_t v10 = (const void *)HyphenatedLineWithOffset;
    if (a3)
    {
      if (*(double *)(a1 + 80) > 0.0)
      {
        uint64_t JustifiedLineWithOptions = CTLineCreateJustifiedLineWithOptions();
        if (JustifiedLineWithOptions)
        {
          uint64_t v12 = (const void *)JustifiedLineWithOptions;
          CFRelease(v10);
          uint64_t v10 = v12;
        }
      }
    }
    CFRelease(*(CFTypeRef *)a1);
    *(void *)a1 = v10;
    if (a4) {
      *a4 = CTLineGetTypographicBounds((CTLineRef)v10, 0, 0, 0);
    }
    if (a5) {
      *a5 = CTLineGetTrailingWhitespaceWidth(*(CTLineRef *)a1);
    }
  }
}

void sub_18E526D48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E526DC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id __NSDefaultFont_block_invoke()
{
  _NSTextScalingTypeForCurrentEnvironment();
  unint64_t v0 = objc_opt_class();
  uint64_t v1 = (void *)[v0 fontWithName:@"Helvetica" size:12.0];
  NSDefaultFont__defaultFont = (uint64_t)v1;
  if (!v1)
  {
    uint64_t v1 = (void *)[v0 systemFontOfSize:12.0];
    NSDefaultFont__defaultFont = (uint64_t)v1;
  }

  return v1;
}

void sub_18E527C34(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v2 - 224), 8);
  _Block_object_dispose((const void *)(v2 - 176), 8);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E52813C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

uint64_t __NSTextLayoutManagerRemoveTextLayoutFragmentsInTextRange(id *a1, void *a2, uint64_t a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a1, "textContentManager"), "documentRange");
  if (a3 || ![a2 isEqualToTextRange:v6])
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a1[10], "contentRange"), "endLocation");
    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x3052000000;
    CGRect v32 = __Block_byref_object_copy__2;
    CGRect v33 = __Block_byref_object_dispose__2;
    uint64_t v34 = 0;
    uint64_t v23 = 0;
    NSUInteger v24 = &v23;
    uint64_t v25 = 0x3052000000;
    double v26 = __Block_byref_object_copy__2;
    unint64_t v27 = __Block_byref_object_dispose__2;
    id v28 = 0;
    if (a3) {
      id v8 = (id)[a2 location];
    }
    else {
      id v8 = 0;
    }
    id v28 = v8;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3052000000;
    v22[3] = __Block_byref_object_copy__2;
    v22[4] = __Block_byref_object_dispose__2;
    v22[5] = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = ____NSTextLayoutManagerRemoveTextLayoutFragmentsInTextRange_block_invoke;
    v21[3] = &unk_1E55C6500;
    v21[6] = a3;
    v21[7] = v22;
    v21[8] = &v23;
    v21[9] = &v29;
    v21[4] = a1;
    v21[5] = v7;
    if (objc_msgSend((id)objc_msgSend(a2, "endLocation"), "isEqual:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "textContentManager"), "documentRange"), "endLocation")))objc_msgSend(a1[10], "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", objc_msgSend(a2, "location"), 0, v21); {
    else
    }
      [a1[10] enumerateTextLayoutFragmentInTextRange:a2 options:0 usingBlock:v21];
    objc_msgSend(a1[10], "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", objc_msgSend(a2, "endLocation"), 0, &__block_literal_global_579);
    if ([(id)v30[5] count])
    {
      if (v7 && [(id)v24[5] compare:v7] == -1)
      {
        uint64_t v9 = [NSTextRange alloc];
        uint64_t v10 = [(NSTextRange *)v9 initWithLocation:v24[5] endLocation:v7];
        [(id)v30[5] addObject:v10];
      }
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v11 = (void *)v30[5];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v35 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v18;
        char v14 = 1;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v11);
            }
            [a1[10] invalidateTextLayoutFragmentsInTextRange:*(void *)(*((void *)&v17 + 1) + 8 * i) adjustTextRange:v14 & 1];
            char v14 = 0;
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v35 count:16];
          char v14 = 0;
        }
        while (v12);
      }
    }
    else
    {
      [a1[10] invalidateTextLayoutFragmentsInTextRange:a2 adjustTextRange:1];
    }

    _Block_object_dispose(v22, 8);
    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);
  }
  else
  {

    a1[11] = 0;
    a1[10] = 0;
  }
  uint64_t result = [a1[11] count];
  if (!result) {
    return [a1 _setSoftInvalidationLocation:0 onlyIfUpstream:1];
  }
  return result;
}

void sub_18E528534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
}

void sub_18E528900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18E5290D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v7);
  _Unwind_Resume(a1);
}

void sub_18E529170(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E529350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18E529648(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v2 - 96), 8);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E52975C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18E5298F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E5299EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18E529AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

NSUInteger __NSTextRunStorageReleaseElementContentsInRange(NSUInteger result, NSUInteger a2, NSUInteger a3)
{
  if (!*(void *)(result + 16))
  {
    NSUInteger v3 = result;
    if (a2 == 0x7FFFFFFFFFFFFFFFLL && !a3)
    {
      a3 = [*(id *)(result + 24) count];
      a2 = 0;
    }
    return __NSTextRunStorageEnumerateElementsInRange(v3, a2, a3, 0, (uint64_t)&__block_literal_global_29);
  }
  return result;
}

void sub_18E529DD8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v2 - 112), 8);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E52A018(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double __NSTextLayoutManagerClearTextContainerEntry(uint64_t a1)
{
  [*(id *)a1 setTextLayoutManager:0];

  *(void *)(a1 + 64) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 4_Block_object_dispose(&STACK[0x2B0], 8) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

void sub_18E52A2AC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18E52A8F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose((const void *)(v64 - 248), 8);
  _Block_object_dispose((const void *)(v64 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_18E52AC6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __NSTextLayoutManagerGetLayoutFragmentForPosition(void *a1, id *a2, char a3, double a4, double a5)
{
  [*a2 size];
  double v11 = v10;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3052000000;
  uint64_t v25 = __Block_byref_object_copy__2;
  double v26 = __Block_byref_object_dispose__2;
  uint64_t v27 = 0;
  uint64_t v12 = (void *)[a2[2] endLocation];
  BOOL v13 = v11 < 10000000.0 && v11 > 0.0;
  double v14 = 1.79769313e308;
  if (v13) {
    double v14 = v11;
  }
  __NSTextLayoutManagerFillSoftInvalidationToLocation((uint64_t)a1, v12, v14);
  if ([a2[2] isNotEmpty])
  {
    id v15 = a2[2];
    LOBYTE(v21) = a3;
    int v16 = objc_msgSend((id)objc_msgSend(v15, "endLocation"), "isEqual:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "textContentManager", MEMORY[0x1E4F143A8], 3221225472, ____NSTextLayoutManagerGetLayoutFragmentForPosition_block_invoke, &unk_1E55C6488, &v22, *(void *)&a4, *(void *)&a5, v21), "documentRange"), "endLocation"));
    uint64_t v17 = (void *)a1[10];
    if (v16) {
      objc_msgSend(v17, "enumerateTextLayoutFragmentFromLocation:options:usingBlock:", objc_msgSend(v15, "location"), 2, &v20);
    }
    else {
      [v17 enumerateTextLayoutFragmentInTextRange:v15 options:2 usingBlock:&v20];
    }
  }
  uint64_t v18 = v23[5];
  _Block_object_dispose(&v22, 8);
  return v18;
}

void sub_18E52AE6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18E52B1A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E52B98C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __NSCreateRenderingContextForAttributedString(uint64_t a1, uint64_t a2, char a3, char a4, char a5, double a6, double a7)
{
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x3052000000;
  uint64_t v18 = __Block_byref_object_copy__10;
  long long v19 = __Block_byref_object_dispose__10;
  uint64_t v20 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ____NSCreateRenderingContextForAttributedString_block_invoke;
  v9[3] = &unk_1E55C75E8;
  *(double *)&v9[6] = a6;
  v9[4] = a1;
  v9[5] = &v15;
  v9[7] = a2;
  char v10 = 0;
  char v11 = a5;
  char v12 = a3;
  char v13 = a4;
  *(double *)&v9[8] = a7;
  char v14 = 0;
  +[NSSingleLineTypesetter performWithSingleLineTypesetterContext:v9];
  uint64_t v7 = v16[5];
  _Block_object_dispose(&v15, 8);
  return v7;
}

void sub_18E52C52C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18E52FE08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E52FF24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E52FFB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __NSTextLayoutManagerAddTextContainerEntry(uint64_t a1, void *a2)
{
  uint64_t v4 = a1 + 152;
  if (*(void *)(a1 + 152))
  {
    uint64_t v5 = *(void *)(a1 + 248);
    if (v5 == *(void *)(a1 + 240))
    {
      uint64_t v6 = v5 + 8;
      *(void *)(a1 + 240) = v6;
      uint64_t v7 = (char *)NSZoneRealloc(0, *(void **)(a1 + 224), 72 * v6);
      *(void *)(a1 + 224) = v7;
      uint64_t v5 = *(void *)(a1 + 248);
    }
    else
    {
      uint64_t v7 = *(char **)(a1 + 224);
    }
    id v8 = &v7[72 * v5];
    *(_OWORD *)id v8 = *(_OWORD *)v4;
    long long v9 = *(_OWORD *)(v4 + 16);
    long long v10 = *(_OWORD *)(v4 + 32);
    long long v11 = *(_OWORD *)(v4 + 48);
    *((void *)v8 + _Block_object_dispose(&STACK[0x2B0], 8) = *(void *)(v4 + 64);
    *((_OWORD *)v8 + 2) = v10;
    *((_OWORD *)v8 + 3) = v11;
    *((_OWORD *)v8 + 1) = v9;
    ++*(void *)(a1 + 248);
  }
  id v12 = (id)[*(id *)(a1 + 168) endLocation];
  *(_OWORD *)uint64_t v4 = 0u;
  *(_OWORD *)(v4 + 16) = 0u;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_OWORD *)(v4 + 4_Block_object_dispose(&STACK[0x2B0], 8) = 0u;
  *(void *)(v4 + 64) = 0;
  *(void *)(a1 + 152) = a2;
  *(void *)(a1 + 160) = v12;
  *(void *)(a1 + 20_Block_object_dispose(&STACK[0x2B0], 8) = *(void *)(a1 + 248);
  *(void *)(a1 + 232) = 0;

  return [a2 setTextLayoutManager:a1];
}

uint64_t compareBlockApplier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)a3 + 16))();
}

void sub_18E531524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

void __defaultBreakLanguage_block_invoke()
{
  unint64_t v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 stringForKey:@"AppleTextBreakLocale"];
  uint64_t v2 = (void *)defaultBreakLanguage_result;
  defaultBreakLanguage_double result = v1;

  if (defaultBreakLanguage_result)
  {
    objc_msgSend(MEMORY[0x1E4F1CA20], "canonicalLanguageIdentifierFromString:");
    NSUInteger v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v5 = [v4 languageIdentifier];
    uint64_t v6 = (void *)defaultBreakLanguage_result;
    defaultBreakLanguage_double result = v5;

    if (defaultBreakLanguage_result) {
      return;
    }
    NSUInteger v3 = @"en_US";
  }
  defaultBreakLanguage_double result = (uint64_t)v3;

  MEMORY[0x1F41817F8]();
}

uint64_t charIsNormalWhitespace(uint64_t a1)
{
  if (charIsNormalWhitespace_once != -1) {
    dispatch_once(&charIsNormalWhitespace_once, &__block_literal_global_484);
  }
  uint64_t v2 = (void *)charIsNormalWhitespace_set;

  return [v2 characterIsMember:a1];
}

void sub_18E532CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
}

uint64_t __NSShouldUseTokenizerForPushOut(const __CFString *a1)
{
  uint64_t v2 = __NSTokenizerLanguageSet();
  uint64_t v3 = 0;
  if (a1)
  {
    uint64_t v4 = (void *)v2;
    if (v2)
    {
      id v5 = __NSCreateNormalizedLanguage(a1);
      if (v5) {
        uint64_t v3 = [v4 containsObject:v5];
      }
      else {
        uint64_t v3 = 0;
      }
    }
  }
  return v3;
}

uint64_t __NSTokenizerLanguageSet()
{
  uint64_t result = __tokenizerLanguageSet;
  if (!__tokenizerLanguageSet)
  {
    if (_createTokenizerLanguageSet_onceToken != -1) {
      dispatch_once(&_createTokenizerLanguageSet_onceToken, &__block_literal_global_317);
    }
    return __tokenizerLanguageSet;
  }
  return result;
}

void sub_18E5341E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18E53451C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E534590(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E534618(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E53537C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_18E535FA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E5361E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __charIsNormalWhitespace_block_invoke()
{
  unint64_t v0 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  id v3 = (id)[v0 mutableCopy];

  objc_msgSend(v3, "removeCharactersInRange:", 160, 1);
  objc_msgSend(v3, "removeCharactersInRange:", 9, 1);
  uint64_t v1 = [v3 copy];
  uint64_t v2 = (void *)charIsNormalWhitespace_set;
  charIsNormalWhitespace_set = v1;
}

void sub_18E536828(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const char *__NSLoadFramework(void *a1, int a2)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  v10[0] = 0;
  v10[1] = 0;
  if (a1)
  {
    uint64_t result = (const char *)[a1 UTF8String];
    uint64_t v4 = result;
    if (!result) {
      return result;
    }
  }
  else
  {
    uint64_t v4 = "UIKit";
  }
  id v5 = "/System/Library/Frameworks/";
  if (a2) {
    id v5 = "/System/Library/PrivateFrameworks/";
  }
  for (uint64_t i = (const char **)v10; ; ++i)
  {
    if (snprintf(__str, 0x400uLL, "%s%s.framework/%s", v5, v4, v4) <= 1023)
    {
      uint64_t result = (const char *)dlopen(__str, 258);
      if (result) {
        break;
      }
    }
    uint64_t v7 = *i;
    id v5 = v7;
    if (!v7) {
      return 0;
    }
  }
  return result;
}

void sub_18E536C3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E536CD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E537670(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void ___createTokenizerLanguageSet_block_invoke()
{
  if (!__tokenizerLanguageSet) {
    __tokenizerLanguageSet = (uint64_t)(id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"zh", @"ja", 0);
  }
}

BOOL UIDataLooksLikeNibArchive(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ((unint64_t)[v1 length] < 4)
  {
    BOOL v3 = 0;
  }
  else
  {
    [v1 getBytes:&v5 length:10];
    BOOL v3 = v5 == 0x696863724142494ELL && v6 == 25974;
  }

  return v3;
}

uint64_t setCurrentCGContextDuringBlock_iOS(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (softLinkUIGraphicsGetCurrentContext_0() == a1)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t))(a3 + 16);
    return v7(a3);
  }
  else
  {
    softLinkUIGraphicsPushContext(a1);
    (*(void (**)(uint64_t))(a3 + 16))(a3);
    uint64_t v5 = softLinkUIGraphicsPopContext;
    return v5();
  }
}

uint64_t __shouldUseHangulWordPriorityWithLineBreakStrategy_block_invoke()
{
  unint64_t v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v3 = [v0 objectForKey:@"NSForceHangulWordBreakPriority"];

  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v1 = [v3 unsignedIntegerValue];
    }
    else {
      uint64_t v1 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v1 = 0x7FFFFFFFFFFFFFFFLL;
  }
  shouldUseHangulWordPriorityWithLineBreakStrategy_hangulWordBreakPriorityDefault = v1;

  return MEMORY[0x1F41817F8]();
}

void __NSATSGlyphStorageInitBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v12 = (NSZone *)[(id)a1 zone];
  char v13 = v12;
  *(void *)(a1 + (int)*MEMORY[0x1E4F243A0]) = a6;
  *(void *)(a1 + 112) = a2;
  *(void *)(a1 + 120) = a3;
  *(void *)(a1 + 12_Block_object_dispose(&STACK[0x2B0], 8) = a4;
  *(void *)(a1 + 136) = a5;
  if (a6 <= 0) {
    uint64_t v14 = -(-a6 & 0x7F);
  }
  else {
    uint64_t v14 = a6 & 0x7F;
  }
  *(_DWORD *)(a1 + 224) = 0;
  int64_t v15 = a6 - v14 + 128;
  if (*(void *)(a1 + 144) < v15)
  {
    int v16 = (int *)MEMORY[0x1E4F24398];
    uint64_t v17 = *(void **)(a1 + (int)*MEMORY[0x1E4F24398]);
    if (v17) {
      NSZoneFree(v12, v17);
    }
    *(void *)(a1 + *v16) = NSZoneCalloc(v13, v15, 0x1EuLL);
    uint64_t v18 = *(void *)(a1 + *v16);
    if (!v18)
    {
      *(void *)(a1 + 144) = 0;
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Failed to allocate buffer for text layout processing."];
      uint64_t v18 = *(void *)(a1 + *v16);
    }
    long long v19 = (int *)MEMORY[0x1E4F243B8];
    *(void *)(a1 + (int)*MEMORY[0x1E4F243B8]) = v18 + 16 * v15;
    uint64_t v20 = *(void *)(a1 + *v19) + 8 * v15;
    uint64_t v21 = (int *)MEMORY[0x1E4F243B0];
    *(void *)(a1 + (int)*MEMORY[0x1E4F243B0]) = v20;
    *(void *)(a1 + (int)*MEMORY[0x1E4F243A8]) = *(void *)(a1 + *v21) + 4 * v15;
    *(void *)(a1 + 144) = v15;
  }
  uint64_t v22 = (int *)MEMORY[0x1E4F24390];
  uint64_t v23 = *(void **)(a1 + (int)*MEMORY[0x1E4F24390]);
  if (v23)
  {
    NSZoneFree(v13, v23);
    *(void *)(a1 + *v22) = 0;
  }
  uint64_t v24 = *(void **)(a1 + 192);
  if (v24)
  {
    NSZoneFree(v13, v24);
    *(void *)(a1 + 192) = 0;
  }
  *(void *)(a1 + 96) = 0;
  if (a3 != a5) {
    *(_DWORD *)(a1 + 224) |= 0x10u;
  }
  uint64_t v25 = *(__CFSet **)(a1 + 160);
  if (v25) {
    CFSetRemoveAllValues(v25);
  }
  *(void *)(a1 + 16_Block_object_dispose(&STACK[0x2B0], 8) = 0;
  *(void *)(a1 + 176) = 0;
  *(void *)(a1 + 200) = 0;
  *(void *)(a1 + 20_Block_object_dispose(&STACK[0x2B0], 8) = 0;
  *(void *)(a1 + 216) = 0;
}

void sub_18E53CD40(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _CFArraySortValuesWithBlock(__CFArray *a1, CFIndex a2, CFIndex a3, void *a4)
{
  id context = a4;
  v8.NSUInteger location = a2;
  v8.NSUInteger length = a3;
  CFArraySortValues(a1, v8, (CFComparatorFunction)compareBlockApplier, &context);
}

void sub_18E53D64C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v2 - 128), 8);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void UIFreeMissingClasses(void **a1, uint64_t a2)
{
  uint64_t v2 = (id *)*a1;
  if (*a1)
  {
    if (a2 >= 1)
    {
      uint64_t v5 = 0;
      unsigned int v6 = 1;
      do
      {

        uint64_t v5 = v6++;
      }
      while (v5 < a2);
    }
    free(v2);
    *a1 = 0;
  }
}

void sub_18E53DAA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E53DEB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _NSStringImputedBaseWritingDirectionAtIndex(const __CFString *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  CFStringRef theString = a1;
  uint64_t v59 = a3;
  int64_t v60 = a4;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  BOOL v57 = (UniChar *)CharactersPtr;
  if (CharactersPtr) {
    CStringPtr = 0;
  }
  else {
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  }
  int64_t v61 = 0;
  int64_t v62 = 0;
  NSUInteger v58 = CStringPtr;
  if (!_NSStringImputedBaseWritingDirectionAtIndex_bidiPropertyBMP) {
    _NSStringImputedBaseWritingDirectionAtIndex_bidiPropertyBMP = CFUniCharGetUnicodePropertyDataForPlane();
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  *(_OWORD *)CGPoint buffer = 0u;
  long long v49 = 0u;
  uint64_t v10 = ~a3 + a2;
  if (v10 < 0) {
    goto LABEL_22;
  }
  if ((uint64_t)a4 <= v10)
  {
    uint64_t v47 = a2;
    UniChar v12 = 0;
LABEL_24:
    int64_t v15 = ~a3 + a2;
LABEL_25:
    uint64_t v17 = -1;
    while (1)
    {
      UniChar v18 = v12;
      uint64_t UnicodePropertyDataForPlane = _NSStringImputedBaseWritingDirectionAtIndex_bidiPropertyBMP;
      if (!v15)
      {
        int64_t v24 = 0;
        goto LABEL_38;
      }
      if (v12 >> 10 != 55) {
        goto LABEL_37;
      }
      int64_t v20 = v60;
      if (v60 <= v15) {
        goto LABEL_37;
      }
      uint64_t v21 = v57;
      if (v57) {
        break;
      }
      if (!v58)
      {
        if (v62 <= v15 || (int64_t v29 = v61, v61 > v15))
        {
          int64_t v30 = v15 - 4;
          if ((unint64_t)v15 < 4) {
            int64_t v30 = 0;
          }
          if (v30 + 64 < v60) {
            int64_t v20 = v30 + 64;
          }
          int64_t v61 = v30;
          int64_t v62 = v20;
          v65.NSUInteger location = v59 + v30;
          v65.NSUInteger length = v20 - v30;
          CFStringGetCharacters(theString, v65, buffer);
          int64_t v29 = v61;
        }
        int64_t v22 = v15 - v29;
        uint64_t v21 = buffer;
        goto LABEL_31;
      }
      UniChar v23 = v58[v59 + v15];
LABEL_35:
      if (v23 >> 10 == 54)
      {
        v18 += 9216 + (v23 << 10);
        int64_t v24 = v15 - 1;
        uint64_t UnicodePropertyDataForPlane = CFUniCharGetUnicodePropertyDataForPlane();
        goto LABEL_38;
      }
LABEL_37:
      int64_t v24 = v15;
LABEL_38:
      if (!UnicodePropertyDataForPlane) {
        goto LABEL_45;
      }
      unsigned int v25 = *(unsigned __int8 *)(UnicodePropertyDataForPlane + HIBYTE(v18));
      if (v25 >= 0x13) {
        unsigned int v25 = *(unsigned __int8 *)(UnicodePropertyDataForPlane
      }
                                 + (((v25 << 8) - 4864) & 0xFFFFFF00)
                                 + v18
                                 + 256);
      if (v25 <= 0x11)
      {
        if (((1 << v25) & 0xC024) != 0)
        {
          uint64_t v17 = 1;
          goto LABEL_46;
        }
        if (((1 << v25) & 0x30002) != 0)
        {
LABEL_45:
          uint64_t v17 = 0;
          goto LABEL_46;
        }
        if (v25 == 13)
        {
LABEL_70:
          a2 = v47;
          goto LABEL_71;
        }
      }
LABEL_46:
      if (!v24) {
        goto LABEL_70;
      }
      UniChar v12 = 0;
      int64_t v15 = v24 - 1;
      int64_t v26 = v60;
      if (v60 >= v24)
      {
        if (v57)
        {
          UniChar v12 = v57[v59 + v15];
        }
        else if (v58)
        {
          UniChar v12 = v58[v59 + v15];
        }
        else
        {
          if (v62 < v24 || (int64_t v27 = v61, v61 >= v24))
          {
            int64_t v28 = v24 - 5;
            if ((unint64_t)v24 < 5) {
              int64_t v28 = 0;
            }
            if (v28 + 64 < v60) {
              int64_t v26 = v28 + 64;
            }
            int64_t v61 = v28;
            int64_t v62 = v26;
            v64.NSUInteger location = v59 + v28;
            v64.NSUInteger length = v26 - v28;
            CFStringGetCharacters(theString, v64, buffer);
            int64_t v27 = v61;
          }
          UniChar v12 = buffer[v15 - v27];
        }
      }
    }
    int64_t v22 = v59 + v15;
LABEL_31:
    UniChar v23 = v21[v22];
    goto LABEL_35;
  }
  if (CharactersPtr)
  {
    uint64_t v11 = 0;
    UniChar v12 = CharactersPtr[a2 - 1];
  }
  else if (CStringPtr)
  {
    uint64_t v11 = 0;
    UniChar v12 = CStringPtr[a2 - 1];
  }
  else
  {
    uint64_t v13 = v10 - 4;
    if ((unint64_t)v10 < 4) {
      uint64_t v13 = 0;
    }
    unint64_t v14 = v13 + 64;
    if (v13 + 64 >= (uint64_t)a4) {
      unint64_t v14 = a4;
    }
    int64_t v61 = v13;
    int64_t v62 = v14;
    v63.NSUInteger location = a3 + v13;
    v63.NSUInteger length = v14 - v13;
    CFStringGetCharacters(a1, v63, buffer);
    uint64_t v11 = v61;
    UniChar v12 = buffer[v10 - v61];
  }
  if (v12 >> 10 != 54)
  {
    uint64_t v47 = a2;
    goto LABEL_24;
  }
  --a2;
  if (v10)
  {
    int64_t v15 = v10 - 1;
    uint64_t v16 = v60;
    uint64_t v47 = a2;
    if (v60 >= v10)
    {
      if (v57)
      {
        UniChar v12 = v57[v59 + v15];
      }
      else if (v58)
      {
        UniChar v12 = v58[v59 + v15];
      }
      else
      {
        if (v62 < v10 || v11 >= v10)
        {
          uint64_t v46 = v10 - 5;
          if ((unint64_t)v10 < 5) {
            uint64_t v46 = 0;
          }
          if (v46 + 64 < v60) {
            uint64_t v16 = v46 + 64;
          }
          int64_t v61 = v46;
          int64_t v62 = v16;
          v68.NSUInteger location = v59 + v46;
          v68.NSUInteger length = v16 - v46;
          CFStringGetCharacters(theString, v68, buffer);
          uint64_t v11 = v61;
        }
        UniChar v12 = buffer[v15 - v11];
      }
    }
    else
    {
      UniChar v12 = 0;
    }
    goto LABEL_25;
  }
LABEL_22:
  uint64_t v17 = -1;
LABEL_71:
  uint64_t v31 = a2 - a3;
  if (a2 - a3 < a4 && v17 == -1)
  {
    while (1)
    {
      if (v31 < 0 || (uint64_t v32 = v60, v60 <= v31))
      {
        UniChar v33 = 0;
      }
      else if (v57)
      {
        UniChar v33 = v57[v59 + v31];
      }
      else if (v58)
      {
        UniChar v33 = v58[v59 + v31];
      }
      else
      {
        if (v62 <= v31 || (int64_t v39 = v61, v61 > v31))
        {
          uint64_t v40 = v31 - 4;
          if ((unint64_t)v31 < 4) {
            uint64_t v40 = 0;
          }
          if (v40 + 64 < v60) {
            uint64_t v32 = v40 + 64;
          }
          int64_t v61 = v40;
          int64_t v62 = v32;
          v66.NSUInteger location = v59 + v40;
          v66.NSUInteger length = v32 - v40;
          CFStringGetCharacters(theString, v66, buffer);
          int64_t v39 = v61;
        }
        UniChar v33 = buffer[v31 - v39];
      }
      uint64_t v34 = v31 + 1;
      UniChar v35 = v33;
      uint64_t v36 = _NSStringImputedBaseWritingDirectionAtIndex_bidiPropertyBMP;
      if (v31 >= -1 && v34 < a4 && (v33 & 0xFC00) == 0xD800)
      {
        uint64_t v37 = v60;
        if (v60 > v34)
        {
          if (v57)
          {
            UniChar v38 = v57[v59 + v34];
          }
          else if (v58)
          {
            UniChar v38 = v58[v59 + v34];
          }
          else
          {
            if (v62 <= v34 || (int64_t v41 = v61, v61 > v34))
            {
              uint64_t v42 = v31 - 3;
              if ((unint64_t)v31 < 3) {
                uint64_t v42 = 0;
              }
              if (v42 + 64 < v60) {
                uint64_t v37 = v42 + 64;
              }
              int64_t v61 = v42;
              int64_t v62 = v37;
              v67.NSUInteger location = v59 + v42;
              v67.NSUInteger length = v37 - v42;
              CFStringGetCharacters(theString, v67, buffer);
              int64_t v41 = v61;
            }
            UniChar v38 = buffer[v34 - v41];
          }
          if (v38 >> 10 == 55)
          {
            UniChar v35 = (v35 << 10) + 9216 + v38;
            uint64_t v34 = v31 + 2;
            uint64_t v36 = CFUniCharGetUnicodePropertyDataForPlane();
          }
        }
      }
      if (!v36) {
        return 0;
      }
      unint64_t v43 = *(unsigned __int8 *)(v36 + HIBYTE(v35));
      if (v43 >= 0x13) {
        LODWORD(v43) = *(unsigned __int8 *)(v36 + (((v43 << 8) - 4864) & 0xFFFFFF00) + v35 + 256);
      }
      unsigned int v44 = v43 - 1;
      if (v44 < 0x11 && ((0x1F013u >> v44) & 1) != 0) {
        break;
      }
      uint64_t v31 = v34;
      if (v34 >= a4) {
        return -1;
      }
    }
    return qword_18E5F7668[(char)v44];
  }
  return v17;
}

unint64_t _NSLayoutNodeSuggestedFragmentCapacity(unint64_t a1)
{
  if (a1 <= 1) {
    unint64_t v1 = 1;
  }
  else {
    unint64_t v1 = a1;
  }
  unint64_t v2 = 16;
  if (v1 > *MEMORY[0x1E4F14B00] >> 4) {
    unint64_t v2 = *MEMORY[0x1E4F14B00] >> 3;
  }
  unint64_t v3 = (v1 + v2 - 1) / v2 * v2;
  if (v3 >= 0x2000) {
    unint64_t v3 = 0x2000;
  }
  if (v3 <= v1) {
    return v1;
  }
  else {
    return v3;
  }
}

unint64_t _NSLayoutNodeSuggestedLocationCapacity(unint64_t a1)
{
  if (a1 <= 1) {
    unint64_t v1 = 1;
  }
  else {
    unint64_t v1 = a1;
  }
  unint64_t v2 = 16;
  if (v1 > *MEMORY[0x1E4F14B00] >> 4) {
    unint64_t v2 = *MEMORY[0x1E4F14B00] >> 3;
  }
  unint64_t v3 = (v1 + v2 - 1) / v2 * v2;
  if (v3 >= 0x2000) {
    unint64_t v3 = 0x2000;
  }
  if (v3 <= v1) {
    return v1;
  }
  else {
    return v3;
  }
}

unint64_t _NSLayoutNodeSuggestedAttachmentSizeCapacity(unint64_t a1)
{
  if (a1 <= 1) {
    unint64_t v1 = 1;
  }
  else {
    unint64_t v1 = a1;
  }
  unint64_t v2 = 16;
  if (v1 > *MEMORY[0x1E4F14B00] >> 4) {
    unint64_t v2 = *MEMORY[0x1E4F14B00] >> 3;
  }
  unint64_t v3 = (v1 + v2 - 1) / v2 * v2;
  if (v3 >= 0x2000) {
    unint64_t v3 = 0x2000;
  }
  if (v3 <= v1) {
    return v1;
  }
  else {
    return v3;
  }
}

__n128 _NSLayoutTreeCreate(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 240) + 208) + 8);
  unint64_t v3 = (double *)malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
  *((unsigned char *)v3 + 59) = 1;
  unint64_t v4 = v2 - 1;
  if (!v2) {
    unint64_t v4 = 0;
  }
  *(void *)unint64_t v3 = v2;
  v3[1] = (double)((v4 >> 6) + 1) * 14.0;
  *((unsigned char *)v3 + 56) = v2 != 0;
  *(void *)(*(void *)(a1 + 240) + 240) = v3;
  *(void *)(*(void *)(a1 + 240) + 264) = 0;
  uint64_t v5 = *(void *)(a1 + 240) + 240;
  __n128 result = *(__n128 *)MEMORY[0x1E4F28AD8];
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F28AD8] + 16);
  *(_OWORD *)(v5 + 32) = *MEMORY[0x1E4F28AD8];
  *(_OWORD *)(v5 + 4_Block_object_dispose(&STACK[0x2B0], 8) = v7;
  uint64_t v8 = *(void *)(a1 + 240) + 240;
  *(__n128 *)(v8 + 64) = result;
  *(_OWORD *)(v8 + 80) = v7;
  *(void *)(*(void *)(a1 + 240) + 336) = 64;
  *(void *)(*(void *)(a1 + 240) + 344) = 0x402C000000000000;
  *(void *)(*(void *)(a1 + 240) + 24_Block_object_dispose(&STACK[0x2B0], 8) = *(void *)(*(void *)(a1 + 240) + 240);
  *(void *)(*(void *)(a1 + 240) + 256) = 0;
  *(void *)(*(void *)(a1 + 240) + 264) = 0;
  return result;
}

double *_NSLayoutNodeCreateLeaf(uint64_t a1, unint64_t a2, double a3)
{
  __n128 result = (double *)malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
  *((unsigned char *)result + 59) = 1;
  *(void *)__n128 result = a1;
  unint64_t v7 = a1 - 1;
  if (!a1) {
    unint64_t v7 = 0;
  }
  result[1] = (double)(v7 / a2 + 1) * a3;
  *((unsigned char *)result + 56) = a1 != 0;
  return result;
}

void _NSLayoutTreeFree(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 240) + 24_Block_object_dispose(&STACK[0x2B0], 8) = 0;
  *(void *)(*(void *)(a1 + 240) + 240) = 0;
}

void _NSLayoutNodeFree(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = (void **)(a1 + 24);
    if (*(unsigned char *)(a1 + 59))
    {
      if (*v2)
      {
        free(*v2);
        id *v2 = 0;
      }
      unint64_t v3 = *(void **)(a1 + 32);
      if (v3)
      {
        free(v3);
        *(void *)(a1 + 32) = 0;
        *(unsigned char *)(a1 + 5_Block_object_dispose(&STACK[0x2B0], 8) = 0;
      }
      unint64_t v4 = *(void **)(a1 + 40);
      if (v4) {
        free(v4);
      }
    }
    else
    {
      for (uint64_t i = 0; i != 3; ++i)
      {
        if (v2[i]) {
          _NSLayoutNodeFree();
        }
      }
    }
    free((void *)a1);
  }
}

uint64_t _NSLayoutTreeSummaryDescription(uint64_t a1)
{
  unint64_t v11 = 0;
  uint64_t v12 = 0;
  unint64_t v9 = 0;
  unint64_t v10 = 0;
  unint64_t v2 = [*(id *)(a1 + 8) length];
  _NSLayoutTreeCalculateMemoryUsage(a1, &v12, &v11, &v10, &v9);
  double v3 = 0.0;
  double v4 = 0.0;
  if (v2) {
    double v4 = (double)v11 / (double)v2;
  }
  unint64_t v5 = **(void **)(*(void *)(a1 + 240) + 240);
  if (v5) {
    double v3 = (double)v11 / (double)v5;
  }
  if (v9)
  {
    double v6 = (double)v10 / (double)v9;
    double v7 = (double)v11 / (double)v9;
  }
  else
  {
    double v6 = 0.0;
    double v7 = 0.0;
  }
  return [NSString stringWithFormat:@"Layout tree contents:  %lu characters, %lu glyphs, %lu laid glyphs, %lu laid line fragments, %lu nodes, %lu node bytes, %lu storage bytes, %lu total bytes, %.2f bytes per character, %.2f bytes per glyph, %.2f laid glyphs per laid line fragment, %.2f bytes per laid line fragment", v2, v5, v10, v9, v12, v12 << 6, v11 - (v12 << 6), v11, *(void *)&v4, *(void *)&v3, *(void *)&v6, *(void *)&v7];
}

uint64_t _NSLayoutTreeCalculateMemoryUsage(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v12 = 0;
  uint64_t v9 = *(void *)(a1 + 240);
  uint64_t v11 = 0;
  uint64_t result = _NSLayoutNodeCalculateMemoryUsage(*(void *)(v9 + 240), &v14, &v13, &v12, &v11);
  if (a2) {
    *a2 = v14;
  }
  if (a3) {
    *a3 = v13;
  }
  if (a4) {
    *a4 = v12;
  }
  if (a5) {
    *a5 = v11;
  }
  return result;
}

void *_NSLayoutTreeDescription(uint64_t a1)
{
  unint64_t v2 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v3 = objc_opt_class();
  double v4 = (void *)[v2 stringWithFormat:@"<%@: %p>\n%@\n", v3, a1, _NSLayoutTreeSummaryDescription(a1)];
  unint64_t v5 = *(NSUInteger **)(*(void *)(a1 + 240) + 248);
  v7.NSUInteger location = *(void *)(*(void *)(a1 + 240) + 256);
  v7.NSUInteger length = *v5;
  [v4 appendFormat:@"Current node %p glyph range %@\nRoot ", v5, NSStringFromRange(v7)];
  _NSLayoutNodeDescribe(*(void *)(*(void *)(a1 + 240) + 240), v4, 0);
  return v4;
}

uint64_t _NSLayoutNodeDescribe(uint64_t result, void *a2, uint64_t a3)
{
  if (!result) {
    return result;
  }
  uint64_t v3 = a3;
  unint64_t v5 = (void *)result;
  if (a3)
  {
    uint64_t v6 = a3;
    do
    {
      [a2 appendString:@"  "];
      --v6;
    }
    while (v6);
  }
  NSRange v7 = (unint64_t **)(v5 + 3);
  if (!*((unsigned char *)v5 + 59))
  {
    for (uint64_t i = 0; i != 3; ++i)
    {
      if (!v5[i + 3]) {
        break;
      }
    }
    [a2 appendFormat:@"Internal node %p with %lu glyphs, %lu children, offset %g, flags 0x%x\n", v5, *v5, i, v5[1], *((unsigned __int8 *)v5 + 56)];
    for (uint64_t j = 0; j != 3; ++j)
      uint64_t result = _NSLayoutNodeDescribe(v7[j], a2, v3 + 1);
    return result;
  }
  if (!*v7) {
    return [a2 appendFormat:@"Leaf node %p with %lu glyphs (not laid), offset %g, flags 0x%x\n", v5, *v5, v5[1], *((unsigned __int8 *)v5 + 56)];
  }
  uint64_t v8 = (CGFloat *)MEMORY[0x1E4F28AD0];
  unint64_t v97 = *v5;
  [a2 appendFormat:@"Leaf node %p with %lu glyphs (laid), offset %g, flags 0x%x\n", v5, *v5, v5[1], *((unsigned __int8 *)v5 + 56)];
  if (v3)
  {
    uint64_t v9 = v3;
    do
    {
      [a2 appendString:@"  "];
      --v9;
    }
    while (v9);
  }
  CGFloat v10 = *v8;
  CGFloat v11 = v8[1];
  objc_msgSend(a2, "appendFormat:", @"  %lu fragments out of %lu", **v7, (*v7)[1]);
  unint64_t v12 = 0;
  uint64_t v13 = (uint64_t)(*v7 + 4);
  unint64_t v14 = **v7;
  unint64_t v15 = v14 - 1;
  while (1)
  {
    unint64_t v16 = (v12 + v15) >> 1;
    unint64_t v17 = *(void *)(v13 + 80 * v16) & 0x8FFFFFFFFFFFFFFFLL;
    if (!v17) {
      break;
    }
    unint64_t v15 = v16 - 1;
LABEL_15:
    if (v15 < v12)
    {
LABEL_16:
      unint64_t v18 = *(void *)(80 * v16 + v13 + 80) & 0x8FFFFFFFFFFFFFFFLL;
      goto LABEL_25;
    }
  }
  unint64_t v12 = v16 + 1;
  if (v16 + 1 < v14)
  {
    if ((*(void *)(v13 + 80 * v12) & 0x8FFFFFFFFFFFFFFFLL) != 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  unint64_t v18 = v97;
LABEL_25:
  uint64_t v21 = (CGFloat *)(v13 + 80 * v16);
  v101.origin.double x = v21[6];
  v101.size.double width = v21[8];
  v101.size.double height = v21[9];
  v101.origin.double y = v21[7] + 0.0;
  CGFloat v22 = v21[2];
  CGFloat v23 = v21[4];
  CGFloat v24 = v21[5];
  CGFloat v25 = v21[3] + 0.0;
  int64_t v26 = NSStringFromRect(v101);
  v102.origin.double x = v22;
  v102.origin.double y = v25;
  v102.size.double width = v23;
  v102.size.double height = v24;
  [a2 appendFormat:@" (8-float) <%lu:%@/%@", v17, v26, NSStringFromRect(v102)];
  int64_t v27 = *v7;
  unint64_t v28 = **v7;
  if (v28 < 2) {
    goto LABEL_39;
  }
  unint64_t v29 = v18 - v17;
  unint64_t v30 = 1;
  while (2)
  {
    unint64_t v31 = 0;
    unint64_t v32 = v29 + v17;
    UniChar v33 = v27 + 4;
    unint64_t v34 = v28 - 1;
    while (2)
    {
      unint64_t v35 = (v31 + v34) >> 1;
      unint64_t v17 = v33[10 * v35] & 0x8FFFFFFFFFFFFFFFLL;
      if (v17 > v32)
      {
        unint64_t v34 = v35 - 1;
        goto LABEL_32;
      }
      unint64_t v31 = v35 + 1;
      if (v35 + 1 < v28)
      {
        if ((v33[10 * v31] & 0x8FFFFFFFFFFFFFFFLL) > v32) {
          goto LABEL_33;
        }
LABEL_32:
        if (v34 < v31)
        {
LABEL_33:
          unint64_t v36 = v33[10 * v35 + 10] & 0x8FFFFFFFFFFFFFFFLL;
          goto LABEL_35;
        }
        continue;
      }
      break;
    }
    unint64_t v36 = v97;
LABEL_35:
    uint64_t v37 = (CGFloat *)&v33[10 * v35];
    v103.origin.double x = v37[6];
    v103.size.double width = v37[8];
    v103.size.double height = v37[9];
    v103.origin.double y = v37[7] + 0.0;
    CGFloat v38 = v37[2];
    CGFloat v39 = v37[4];
    CGFloat v40 = v37[5];
    CGFloat v41 = v37[3] + 0.0;
    uint64_t v42 = NSStringFromRect(v103);
    v104.origin.double x = v38;
    v104.origin.double y = v41;
    v104.size.double width = v39;
    v104.size.double height = v40;
    [a2 appendFormat:@" %lu:%@/%@", v17, v42, NSStringFromRect(v104)];
    int64_t v27 = *v7;
    unint64_t v28 = **v7;
    if (v30 <= 0x3E)
    {
      unint64_t v29 = v36 - v17;
      if (++v30 < v28) {
        continue;
      }
    }
    break;
  }
  if (v28 > 0x40)
  {
    unint64_t v43 = @"...>\n";
    goto LABEL_40;
  }
LABEL_39:
  unint64_t v43 = @">\n";
LABEL_40:
  uint64_t result = [a2 appendString:v43];
  unsigned int v44 = (void *)v5[4];
  if (!v44) {
    goto LABEL_89;
  }
  if (v3)
  {
    uint64_t v45 = v3;
    do
    {
      [a2 appendString:@"  "];
      --v45;
    }
    while (v45);
    unsigned int v44 = (void *)v5[4];
  }
  objc_msgSend(a2, "appendFormat:", @"  %lu locations out of %lu", *v44, v44[1]);
  unint64_t v46 = 0;
  uint64_t v47 = (unint64_t *)v5[4];
  int v48 = *((unsigned __int8 *)v5 + 58);
  uint64_t v49 = 24;
  if (v48 != 1) {
    uint64_t v49 = 0;
  }
  uint64_t v50 = 16;
  if (*((unsigned char *)v5 + 58)) {
    uint64_t v50 = v49;
  }
  unint64_t v53 = *v47;
  long long v51 = v47 + 2;
  unint64_t v52 = v53;
  unint64_t v54 = v53 - 1;
  while (2)
  {
    unint64_t v55 = (v46 + v54) >> 1;
    unint64_t v56 = *(void *)((char *)v51 + v55 * v50) & 0x8FFFFFFFFFFFFFFFLL;
    if (v56)
    {
      unint64_t v54 = v55 - 1;
      goto LABEL_54;
    }
    unint64_t v46 = v55 + 1;
    if (v55 + 1 < v52)
    {
      uint64_t v57 = v46 * v50;
      if ((*(void *)((char *)v51 + v46 * v50) & 0x8FFFFFFFFFFFFFFFLL) != 0) {
        goto LABEL_56;
      }
LABEL_54:
      if (v54 < v46)
      {
        uint64_t v57 = v50 + v50 * v55;
LABEL_56:
        unint64_t v58 = *(void *)((char *)v51 + v57) & 0x8FFFFFFFFFFFFFFFLL;
        goto LABEL_58;
      }
      continue;
    }
    break;
  }
  unint64_t v58 = v97;
LABEL_58:
  if (v48 == 1)
  {
    uint64_t v59 = (double *)&v51[3 * v55];
    CGFloat v10 = v59[1];
    CGFloat v11 = v59[2];
  }
  else if (!*((unsigned char *)v5 + 58))
  {
    CGFloat v10 = *(double *)&v51[2 * v55 + 1];
    CGFloat v11 = 0.0;
  }
  v99.double x = v10;
  v99.double y = v11;
  [a2 appendFormat:@" (2-float) <%lu:%@", v56, NSStringFromPoint(v99)];
  int64_t v60 = (unint64_t *)v5[4];
  unint64_t v61 = *v60;
  if (*v60 < 2) {
    goto LABEL_87;
  }
  unint64_t v62 = v58 - v56;
  unint64_t v63 = 1;
  while (2)
  {
    unint64_t v64 = 0;
    int v65 = *((unsigned __int8 *)v5 + 58);
    unint64_t v66 = v62 + v56;
    if (v65 == 1) {
      uint64_t v67 = 24;
    }
    else {
      uint64_t v67 = 0;
    }
    if (*((unsigned char *)v5 + 58)) {
      uint64_t v68 = v67;
    }
    else {
      uint64_t v68 = 16;
    }
    NSUInteger v69 = v60 + 2;
    unint64_t v70 = v61 - 1;
    while (2)
    {
      unint64_t v71 = (v64 + v70) >> 1;
      unint64_t v56 = *(void *)((char *)v69 + v71 * v68) & 0x8FFFFFFFFFFFFFFFLL;
      if (v56 > v66)
      {
        unint64_t v70 = v71 - 1;
        goto LABEL_75;
      }
      unint64_t v64 = v71 + 1;
      if (v71 + 1 < v61)
      {
        uint64_t v72 = v64 * v68;
        if ((*(void *)((char *)v69 + v64 * v68) & 0x8FFFFFFFFFFFFFFFLL) > v66) {
          goto LABEL_77;
        }
LABEL_75:
        if (v70 < v64)
        {
          uint64_t v72 = v68 + v68 * v71;
LABEL_77:
          unint64_t v73 = *(void *)((char *)v69 + v72) & 0x8FFFFFFFFFFFFFFFLL;
          goto LABEL_79;
        }
        continue;
      }
      break;
    }
    unint64_t v73 = v97;
LABEL_79:
    if (v65 == 1)
    {
      unint64_t v74 = (double *)&v69[3 * v71];
      CGFloat v10 = v74[1];
      CGFloat v11 = v74[2];
    }
    else if (!*((unsigned char *)v5 + 58))
    {
      CGFloat v10 = *(double *)&v69[2 * v71 + 1];
      CGFloat v11 = 0.0;
    }
    v100.double x = v10;
    v100.double y = v11;
    [a2 appendFormat:@" %lu:%@", v56, NSStringFromPoint(v100)];
    int64_t v60 = (unint64_t *)v5[4];
    unint64_t v61 = *v60;
    if (v63 <= 0x3E)
    {
      unint64_t v62 = v73 - v56;
      if (++v63 < v61) {
        continue;
      }
    }
    break;
  }
  if (v61 > 0x40)
  {
    int v75 = @"...>\n";
    goto LABEL_88;
  }
LABEL_87:
  int v75 = @">\n";
LABEL_88:
  uint64_t result = [a2 appendString:v75];
LABEL_89:
  NSUInteger v76 = (void *)v5[5];
  if (!v76) {
    return result;
  }
  if (v3)
  {
    do
    {
      [a2 appendString:@"  "];
      --v3;
    }
    while (v3);
    NSUInteger v76 = (void *)v5[5];
  }
  objc_msgSend(a2, "appendFormat:", @"  %lu attachment sizes out of %lu ("), *v76, v76[1];
  unint64_t v77 = 0;
  size_t v78 = (unint64_t *)v5[5];
  unint64_t v81 = *v78;
  uint64_t v79 = v78 + 2;
  unint64_t v80 = v81;
  unint64_t v82 = v81 - 1;
  while (2)
  {
    unint64_t v83 = (v77 + v82) >> 1;
    unint64_t v84 = v79[3 * v83] & 0x8FFFFFFFFFFFFFFFLL;
    if (v84)
    {
      unint64_t v82 = v83 - 1;
      goto LABEL_98;
    }
    unint64_t v77 = v83 + 1;
    if (v83 + 1 < v80)
    {
      if ((v79[3 * v77] & 0x8FFFFFFFFFFFFFFFLL) != 0) {
        goto LABEL_99;
      }
LABEL_98:
      if (v82 < v77)
      {
LABEL_99:
        unint64_t v85 = v79[3 * v83 + 3] & 0x8FFFFFFFFFFFFFFFLL;
        goto LABEL_102;
      }
      continue;
    }
    break;
  }
  unint64_t v85 = v97;
LABEL_102:
  [a2 appendFormat:@"%lu:%@", v84, NSStringFromSize(*(NSSize *)&v79[3 * v83 + 1])];
  NSRange v86 = (unint64_t *)v5[5];
  unint64_t v87 = *v86;
  if (*v86 < 2) {
    goto LABEL_116;
  }
  unint64_t v88 = v85 - v84;
  unint64_t v89 = 1;
  while (2)
  {
    unint64_t v90 = 0;
    unint64_t v91 = v88 + v84;
    uint64_t v92 = v86 + 2;
    unint64_t v93 = v87 - 1;
    while (2)
    {
      unint64_t v94 = (v90 + v93) >> 1;
      unint64_t v84 = v92[3 * v94] & 0x8FFFFFFFFFFFFFFFLL;
      if (v84 > v91)
      {
        unint64_t v93 = v94 - 1;
        goto LABEL_109;
      }
      unint64_t v90 = v94 + 1;
      if (v94 + 1 < v87)
      {
        if ((v92[3 * v90] & 0x8FFFFFFFFFFFFFFFLL) > v91) {
          goto LABEL_110;
        }
LABEL_109:
        if (v93 < v90)
        {
LABEL_110:
          unint64_t v95 = v92[3 * v94 + 3] & 0x8FFFFFFFFFFFFFFFLL;
          goto LABEL_112;
        }
        continue;
      }
      break;
    }
    unint64_t v95 = v97;
LABEL_112:
    [a2 appendFormat:@" %lu:%@", v84, NSStringFromSize(*(NSSize *)&v92[3 * v94 + 1])];
    NSRange v86 = (unint64_t *)v5[5];
    unint64_t v87 = *v86;
    if (v89 <= 0x3E)
    {
      unint64_t v88 = v95 - v84;
      if (++v89 < v87) {
        continue;
      }
    }
    break;
  }
  if (v87 >= 0x41)
  {
    unint64_t v96 = @"...\n");
    goto LABEL_117;
  }
LABEL_116:
  unint64_t v96 = @"\n");
LABEL_117:

  return [a2 appendString:v96];
}

void _NSLayoutTreeLogDebug(NSString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if ((unint64_t)_NSLayoutTreeLogDebug_logCount <= 0xF)
  {
    ++_NSLayoutTreeLogDebug_logCount;
    NSLogv(a1, &a9);
    if ((unint64_t)_NSLayoutTreeLogDebug_logCount >= 0x10) {
      NSLog((NSString *)@"!!! Suppressing further NSLayoutTree logs");
    }
  }
}

uint64_t _NSLayoutNodeCalculateMemoryUsage(uint64_t result, void *a2, uint64_t *a3, void *a4, void *a5)
{
  if (result)
  {
    ++*a2;
    uint64_t v9 = *a3;
    *a3 += 64;
    uint64_t v10 = result + 24;
    if (*(unsigned char *)(result + 59))
    {
      if (*(void *)v10)
      {
        *a3 = v9 + 80 * *(void *)(*(void *)v10 + 8) + 96;
        *a4 += *(void *)result;
        *a5 += **(void **)(result + 24);
      }
      uint64_t v11 = *(void *)(result + 32);
      if (v11)
      {
        int v12 = *(unsigned __int8 *)(result + 58);
        uint64_t v13 = 24;
        if (v12 != 1) {
          uint64_t v13 = 0;
        }
        BOOL v14 = v12 == 0;
        uint64_t v15 = 16;
        if (!v14) {
          uint64_t v15 = v13;
        }
        uint64_t v16 = *a3 + v15 * *(void *)(v11 + 8) + 16;
        *a3 = v16;
        if (*(void *)(result + 40)) {
          *a3 = v16 + 24 * *(void *)(*(void *)(result + 32) + 8) + 16;
        }
      }
    }
    else
    {
      for (uint64_t i = 0; i != 24; i += 8)
        uint64_t result = _NSLayoutNodeCalculateMemoryUsage(*(void *)(v10 + i), a2, a3, a4, a5);
    }
  }
  return result;
}

uint64_t _NSLayoutTreeSetGlyphsPerLineEstimate(uint64_t result, uint64_t a2)
{
  uint64_t v2 = 64;
  if (a2) {
    uint64_t v2 = a2;
  }
  *(void *)(*(void *)(result + 240) + 336) = v2;
  return result;
}

uint64_t _NSLayoutTreeSetOffsetPerLineEstimate(uint64_t result, double a2)
{
  if (a2 <= 0.0) {
    a2 = 14.0;
  }
  *(double *)(*(void *)(result + 240) + 344) = a2;
  return result;
}

uint64_t _NSLayoutTreeGetFirstHoleAfterGlyphIndex(uint64_t result, unint64_t a2, unint64_t *a3)
{
  uint64_t v3 = *(void *)(result + 240) + 240;
  double v4 = *(unint64_t **)v3;
  unint64_t v5 = a2;
  if ((*(unsigned char *)(*(void *)v3 + 56) & 2) != 0)
  {
    unint64_t v5 = *v4;
    if (*(unsigned char *)(*(void *)v3 + 56))
    {
      *(void *)(*(void *)(result + 240) + 24_Block_object_dispose(&STACK[0x2B0], 8) = v4;
      *(void *)(*(void *)(result + 240) + 256) = 0;
      *(void *)(*(void *)(result + 240) + 264) = 0;
      if (v5 > a2)
      {
        unint64_t v6 = a2;
        while (1)
        {
          NSRange v7 = (void *)(*(void *)(result + 240) + 240);
          uint64_t v8 = *(uint64_t **)(*(void *)(result + 240) + 248);
          if (v8) {
            break;
          }
          unint64_t v6 = v5;
LABEL_17:
          v7[1] = *v7;
          *(void *)(*(void *)(result + 240) + 256) = 0;
          *(void *)(*(void *)(result + 240) + 264) = 0;
          if (v6 >= v5) {
            goto LABEL_20;
          }
        }
        while (1)
        {
          uint64_t v9 = v7[2];
          if (*((unsigned char *)v8 + 59)) {
            break;
          }
          uint64_t v10 = *v8;
          uint64_t v11 = 24;
          while (1)
          {
            uint64_t v12 = *(void *)(result + 240);
            uint64_t v13 = *(double **)(*(void *)(v12 + 248) + v11);
            if (!v13) {
              break;
            }
            double v14 = *v13;
            uint64_t v15 = *(void *)(v12 + 256);
            if ((_BYTE)v13[7])
            {
              unint64_t v16 = *(void *)&v14 + v15;
              if (v6 < v16) {
                break;
              }
            }
            else
            {
              unint64_t v16 = v15 + *(void *)&v14;
            }
            *(void *)(v12 + 256) = v16;
            *(double *)(*(void *)(result + 240) + 264) = v13[1] + *(double *)(*(void *)(result + 240) + 264);
            v11 += 8;
            if (v11 == 48)
            {
              uint64_t v13 = 0;
              uint64_t v12 = *(void *)(result + 240);
              break;
            }
          }
          *(void *)(v12 + 24_Block_object_dispose(&STACK[0x2B0], 8) = v13;
          NSRange v7 = (void *)(*(void *)(result + 240) + 240);
          uint64_t v8 = *(uint64_t **)(*(void *)(result + 240) + 248);
          if (!v8)
          {
            unint64_t v6 = v10 + v9;
            goto LABEL_17;
          }
        }
        unint64_t v5 = v7[2];
      }
    }
  }
LABEL_20:
  if (a3)
  {
    if (v5 <= a2) {
      unint64_t v5 = a2;
    }
    *a3 = v5;
  }
  return result;
}

uint64_t _NSLayoutTreeGetFirstHoleAfterGlyphIndexWithLength(uint64_t result, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5)
{
  NSRange v7 = (unint64_t **)(*(void *)(result + 240) + 240);
  unint64_t v8 = **v7;
  if (((*v7)[7] & 2) == 0)
  {
    unint64_t v9 = 0;
    goto LABEL_22;
  }
  if (((*v7)[7] & 1) == 0 {
    || (uint64_t v10 = result,
  }
        *(void *)(*(void *)(result + 240) + 24_Block_object_dispose(&STACK[0x2B0], 8) = *v7,
        *(void *)(*(void *)(result + 240) + 256) = 0,
        *(void *)(*(void *)(result + 240) + 264) = 0,
        v8 <= a2))
  {
LABEL_20:
    unint64_t v9 = v8;
    goto LABEL_21;
  }
  while (1)
  {
    uint64_t v12 = (void *)(*(void *)(result + 240) + 240);
    uint64_t v13 = *(uint64_t **)(*(void *)(result + 240) + 248);
    if (v13) {
      break;
    }
    a2 = v8;
LABEL_19:
    v12[1] = *v12;
    *(void *)(*(void *)(result + 240) + 256) = 0;
    *(void *)(*(void *)(result + 240) + 264) = 0;
    if (a2 >= v8) {
      goto LABEL_20;
    }
  }
  if (!*((unsigned char *)v13 + 59))
  {
    while (1)
    {
      uint64_t v14 = v12[2];
      uint64_t v15 = *v13;
      uint64_t v16 = 24;
      while (1)
      {
        uint64_t v17 = *(void *)(result + 240);
        unint64_t v18 = *(double **)(*(void *)(v17 + 248) + v16);
        if (!v18) {
          break;
        }
        double v19 = *v18;
        uint64_t v20 = *(void *)(v17 + 256);
        if ((_BYTE)v18[7])
        {
          unint64_t v21 = *(void *)&v19 + v20;
          if (a2 < v21) {
            break;
          }
        }
        else
        {
          unint64_t v21 = v20 + *(void *)&v19;
        }
        *(void *)(v17 + 256) = v21;
        *(double *)(*(void *)(result + 240) + 264) = v18[1] + *(double *)(*(void *)(result + 240) + 264);
        v16 += 8;
        if (v16 == 48)
        {
          unint64_t v18 = 0;
          uint64_t v17 = *(void *)(result + 240);
          break;
        }
      }
      *(void *)(v17 + 24_Block_object_dispose(&STACK[0x2B0], 8) = v18;
      uint64_t v12 = (void *)(*(void *)(result + 240) + 240);
      uint64_t v13 = *(uint64_t **)(*(void *)(result + 240) + 248);
      if (!v13) {
        break;
      }
      if (*((unsigned char *)v13 + 59)) {
        goto LABEL_27;
      }
    }
    a2 = v15 + v14;
    goto LABEL_19;
  }
LABEL_27:
  unint64_t v9 = v12[2];
  if (!a5)
  {
LABEL_21:
    unint64_t v8 = 0;
    goto LABEL_22;
  }
  unint64_t v8 = 0;
  do
  {
    if (v8 >= a3) {
      break;
    }
    uint64_t v22 = **(void **)(*(void *)(v10 + 240) + 248);
    v8 += v22;
    uint64_t result = _NSLayoutTreeMoveToGlyphIndex(v10, *(void *)(*(void *)(v10 + 240) + 256) + v22);
    if (!result) {
      break;
    }
  }
  while (!*(void *)(*(void *)(*(void *)(v10 + 240) + 248) + 24));
LABEL_22:
  if (a4) {
    *a4 = v9;
  }
  if (a5) {
    *a5 = v8;
  }
  return result;
}

BOOL _NSLayoutTreeMoveToGlyphIndex(uint64_t a1, unint64_t a2)
{
  for (uint64_t i = (void *)(*(void *)(a1 + 240) + 240); ; uint64_t i = (void *)(*(void *)(a1 + 240) + 240))
  {
    uint64_t v3 = (void *)i[1];
    if (!v3 || !v3[2]) {
      break;
    }
    unint64_t v4 = i[2];
    if (v4 <= a2 && *v3 + v4 > a2) {
      goto LABEL_14;
    }
    uint64_t v5 = 24;
    while (1)
    {
      uint64_t v6 = *(void *)(a1 + 240);
      uint64_t v7 = *(void *)(v6 + 248);
      uint64_t v8 = *(void *)(v7 + 16);
      uint64_t v9 = *(void *)(v8 + v5);
      if (!v9) {
        break;
      }
      if (v7 == v9) {
        goto LABEL_12;
      }
      *(void *)(v6 + 256) -= *(void *)v9;
      *(double *)(*(void *)(a1 + 240) + 264) = *(double *)(*(void *)(a1 + 240) + 264) - *(double *)(v9 + 8);
      v5 += 8;
      if (v5 == 48)
      {
        uint64_t v8 = 0;
        uint64_t v6 = *(void *)(a1 + 240);
        goto LABEL_12;
      }
    }
    uint64_t v8 = 0;
LABEL_12:
    *(void *)(v6 + 24_Block_object_dispose(&STACK[0x2B0], 8) = v8;
  }
  i[1] = *i;
  *(void *)(*(void *)(a1 + 240) + 256) = 0;
  *(void *)(*(void *)(a1 + 240) + 264) = 0;
LABEL_14:
  uint64_t v10 = (void *)(*(void *)(a1 + 240) + 240);
  unint64_t v11 = *(void *)(*(void *)(a1 + 240) + 256);
  if (v11 > a2) {
    return 0;
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 240) + 248);
  if (*(void *)v12 + v11 <= a2) {
    return 0;
  }
  for (BOOL j = *(unsigned char *)(v12 + 59) != 0; !*(unsigned char *)(v12 + 59); BOOL j = *(unsigned char *)(v12 + 59) != 0)
  {
    uint64_t v14 = 24;
    while (1)
    {
      uint64_t v15 = *(void *)(a1 + 240);
      uint64_t v16 = *(void *)(*(void *)(v15 + 248) + v14);
      if (!v16) {
        break;
      }
      unint64_t v17 = *(void *)(v15 + 256);
      unint64_t v18 = *(void *)v16 + v17;
      if (v17 <= a2 && v18 > a2) {
        break;
      }
      *(void *)(v15 + 256) = v18;
      *(double *)(*(void *)(a1 + 240) + 264) = *(double *)(v16 + 8) + *(double *)(*(void *)(a1 + 240) + 264);
      v14 += 8;
      if (v14 == 48)
      {
        uint64_t v16 = 0;
        uint64_t v15 = *(void *)(a1 + 240);
        break;
      }
    }
    *(void *)(v15 + 24_Block_object_dispose(&STACK[0x2B0], 8) = v16;
    uint64_t v10 = (void *)(*(void *)(a1 + 240) + 240);
    uint64_t v12 = *(void *)(*(void *)(a1 + 240) + 248);
    if (!v12) {
      goto LABEL_29;
    }
  }
  if (!*(void *)(v12 + 16))
  {
LABEL_29:
    v10[1] = *v10;
    *(void *)(*(void *)(a1 + 240) + 256) = 0;
    *(void *)(*(void *)(a1 + 240) + 264) = 0;
    return j;
  }
  return 1;
}

double _NSLayoutTreeLineFragmentRectForGlyphAtIndex(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  if (!_NSLayoutTreeMoveToGlyphIndex(a1, a2))
  {
    double v27 = *MEMORY[0x1E4F28AD8];
    _NSLayoutTreeLogDebug((NSString *)@"!!! _NSLayoutTreeLineFragmentRectForGlyphAtIndex invalid glyph index %lu", v6, v7, v8, v9, v10, v11, v12, a2);
    unint64_t v25 = 0;
    uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
    if (!a3) {
      return v27;
    }
    goto LABEL_13;
  }
  uint64_t v14 = *(unint64_t **)(*(void *)(a1 + 240) + 248);
  uint64_t v13 = *(void *)(*(void *)(a1 + 240) + 256);
  uint64_t v15 = (unint64_t *)v14[3];
  unint64_t v16 = *v14;
  if (!v15)
  {
    unint64_t v29 = *(void *)(*(void *)(a1 + 240) + 336);
    uint64_t v26 = v13 + (a2 - v13) / v29 * v29;
    unint64_t v30 = v16 + v13;
    unint64_t v25 = v30 - v26;
    if (v26 + v29 <= v30) {
      unint64_t v25 = *(void *)(*(void *)(a1 + 240) + 336);
    }
    double v27 = 0.0;
    if (!a3) {
      return v27;
    }
    goto LABEL_13;
  }
  unint64_t v17 = 0;
  unint64_t v18 = a2 - v13;
  unint64_t v21 = *v15;
  double v19 = v15 + 4;
  unint64_t v20 = v21;
  unint64_t v22 = v21 - 1;
  while (1)
  {
    unint64_t v23 = (v17 + v22) >> 1;
    unint64_t v24 = v19[10 * v23] & 0x8FFFFFFFFFFFFFFFLL;
    if (v24 <= v18) {
      break;
    }
    unint64_t v22 = v23 - 1;
LABEL_8:
    if (v22 < v17) {
      goto LABEL_9;
    }
  }
  unint64_t v17 = v23 + 1;
  if (v23 + 1 >= v20) {
    goto LABEL_10;
  }
  if ((v19[10 * v17] & 0x8FFFFFFFFFFFFFFFLL) <= v18) {
    goto LABEL_8;
  }
LABEL_9:
  unint64_t v16 = v19[10 * v23 + 10] & 0x8FFFFFFFFFFFFFFFLL;
LABEL_10:
  unint64_t v25 = v16 - v24;
  uint64_t v26 = v24 + v13;
  double v27 = *(double *)&v19[10 * v23 + 6];
  if (a3)
  {
LABEL_13:
    *a3 = v26;
    a3[1] = v25;
  }
  return v27;
}

double _NSLayoutTreeLineFragmentUsedRectForGlyphAtIndex(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  if (!_NSLayoutTreeMoveToGlyphIndex(a1, a2))
  {
    double v27 = *MEMORY[0x1E4F28AD8];
    _NSLayoutTreeLogDebug((NSString *)@"!!! _NSLayoutTreeLineFragmentUsedRectForGlyphAtIndex invalid glyph index %lu", v6, v7, v8, v9, v10, v11, v12, a2);
    unint64_t v25 = 0;
    uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
    if (!a3) {
      return v27;
    }
    goto LABEL_13;
  }
  uint64_t v14 = *(unint64_t **)(*(void *)(a1 + 240) + 248);
  uint64_t v13 = *(void *)(*(void *)(a1 + 240) + 256);
  uint64_t v15 = (unint64_t *)v14[3];
  unint64_t v16 = *v14;
  if (!v15)
  {
    unint64_t v29 = *(void *)(*(void *)(a1 + 240) + 336);
    uint64_t v26 = v13 + (a2 - v13) / v29 * v29;
    unint64_t v30 = v16 + v13;
    unint64_t v25 = v30 - v26;
    if (v26 + v29 <= v30) {
      unint64_t v25 = *(void *)(*(void *)(a1 + 240) + 336);
    }
    double v27 = 0.0;
    if (!a3) {
      return v27;
    }
    goto LABEL_13;
  }
  unint64_t v17 = 0;
  unint64_t v18 = a2 - v13;
  unint64_t v21 = *v15;
  double v19 = v15 + 4;
  unint64_t v20 = v21;
  unint64_t v22 = v21 - 1;
  while (1)
  {
    unint64_t v23 = (v17 + v22) >> 1;
    unint64_t v24 = v19[10 * v23] & 0x8FFFFFFFFFFFFFFFLL;
    if (v24 <= v18) {
      break;
    }
    unint64_t v22 = v23 - 1;
LABEL_8:
    if (v22 < v17) {
      goto LABEL_9;
    }
  }
  unint64_t v17 = v23 + 1;
  if (v23 + 1 >= v20) {
    goto LABEL_10;
  }
  if ((v19[10 * v17] & 0x8FFFFFFFFFFFFFFFLL) <= v18) {
    goto LABEL_8;
  }
LABEL_9:
  unint64_t v16 = v19[10 * v23 + 10] & 0x8FFFFFFFFFFFFFFFLL;
LABEL_10:
  unint64_t v25 = v16 - v24;
  uint64_t v26 = v24 + v13;
  double v27 = *(double *)&v19[10 * v23 + 2];
  if (a3)
  {
LABEL_13:
    *a3 = v26;
    a3[1] = v25;
  }
  return v27;
}

void _NSLayoutTreeGetBaselineOffsetForGlyphAtIndex(uint64_t a1, unint64_t a2, void *a3)
{
  if (_NSLayoutTreeMoveToGlyphIndex(a1, a2))
  {
    if (!a3) {
      return;
    }
    uint64_t v13 = *(unint64_t **)(*(void *)(*(void *)(a1 + 240) + 248) + 24);
    if (v13)
    {
      unint64_t v14 = 0;
      unint64_t v15 = a2 - *(void *)(*(void *)(a1 + 240) + 256);
      unint64_t v18 = *v13;
      unint64_t v16 = v13 + 4;
      unint64_t v17 = v18;
      unint64_t v19 = v18 - 1;
      while (1)
      {
        unint64_t v20 = (v14 + v19) >> 1;
        if ((v16[10 * v20] & 0x8FFFFFFFFFFFFFFFLL) <= v15)
        {
          unint64_t v14 = v20 + 1;
          if (v20 + 1 >= v17 || (v16[10 * v14] & 0x8FFFFFFFFFFFFFFFLL) > v15)
          {
LABEL_10:
            *a3 = v16[10 * v20 + 1];
            return;
          }
        }
        else
        {
          unint64_t v19 = v20 - 1;
        }
        if (v19 < v14) {
          goto LABEL_10;
        }
      }
    }
    *a3 = 0;
  }
  else
  {
    _NSLayoutTreeLogDebug((NSString *)@"!!! _NSLayoutTreeGetBaselineOffsetForGlyphAtIndex invalid glyph index %lu", v6, v7, v8, v9, v10, v11, v12, a2);
  }
}

BOOL _NSLayoutTreeHasFragmentsForGlyphAtIndex(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  BOOL result = _NSLayoutTreeMoveToGlyphIndex(a1, a2);
  if (!result)
  {
    uint64_t v8 = 0;
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    if (!a3) {
      return result;
    }
    goto LABEL_5;
  }
  uint64_t v7 = *(uint64_t **)(*(void *)(a1 + 240) + 248);
  uint64_t v6 = *(void *)(*(void *)(a1 + 240) + 256);
  uint64_t v8 = *v7;
  BOOL result = v7[3] != 0;
  if (a3)
  {
LABEL_5:
    *a3 = v6;
    a3[1] = v8;
  }
  return result;
}

double _NSLayoutTreeRunLocationForGlyphAtIndex(uint64_t a1, unint64_t a2, void *a3)
{
  double v6 = *MEMORY[0x1E4F28AD0];
  if (!_NSLayoutTreeMoveToGlyphIndex(a1, a2))
  {
    _NSLayoutTreeLogDebug((NSString *)@"!!! _NSLayoutTreeRunLocationForGlyphAtIndex invalid glyph index %lu", v7, v8, v9, v10, v11, v12, v13, a2);
    return v6;
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 240) + 248);
  unint64_t v15 = *(unint64_t **)(v14 + 32);
  if (!v15)
  {
    unint64_t v30 = *(unint64_t **)(v14 + 24);
    if (!v30)
    {
      if (a3)
      {
        uint64_t v41 = *(void *)(*(void *)(a1 + 240) + 256);
        unint64_t v42 = *(void *)(*(void *)(a1 + 240) + 336);
        uint64_t v43 = v41 + (a2 - v41) / v42 * v42;
        unint64_t v44 = *(void *)v14 + v41;
        if (v43 + v42 <= v44) {
          uint64_t v45 = *(void *)(*(void *)(a1 + 240) + 336);
        }
        else {
          uint64_t v45 = v44 - v43;
        }
        *a3 = v43;
        a3[1] = v45;
      }
      return v6;
    }
    if (!a3) {
      return v6;
    }
    unint64_t v31 = 0;
    uint64_t v32 = *(void *)(*(void *)(a1 + 240) + 256);
    unint64_t v33 = *(void *)v14;
    unint64_t v34 = a2 - v32;
    unint64_t v37 = *v30;
    unint64_t v35 = v30 + 4;
    unint64_t v36 = v37;
    unint64_t v38 = v37 - 1;
    while (1)
    {
      unint64_t v39 = (v31 + v38) >> 1;
      unint64_t v40 = v35[10 * v39] & 0x8FFFFFFFFFFFFFFFLL;
      if (v40 <= v34)
      {
        unint64_t v31 = v39 + 1;
        if (v39 + 1 >= v36) {
          goto LABEL_26;
        }
        if ((v35[10 * v31] & 0x8FFFFFFFFFFFFFFFLL) > v34)
        {
LABEL_25:
          unint64_t v33 = v35[10 * v39 + 10] & 0x8FFFFFFFFFFFFFFFLL;
LABEL_26:
          *a3 = v40 + v32;
          a3[1] = v33 - v40;
          return v6;
        }
      }
      else
      {
        unint64_t v38 = v39 - 1;
      }
      if (v38 < v31) {
        goto LABEL_25;
      }
    }
  }
  unint64_t v16 = 0;
  int v17 = *(unsigned __int8 *)(v14 + 58);
  uint64_t v18 = *(void *)(*(void *)(a1 + 240) + 256);
  unint64_t v19 = *(void *)v14;
  unint64_t v20 = a2 - v18;
  uint64_t v21 = 24;
  if (v17 != 1) {
    uint64_t v21 = 0;
  }
  uint64_t v22 = 16;
  if (v17) {
    uint64_t v22 = v21;
  }
  unint64_t v25 = *v15;
  unint64_t v23 = v15 + 2;
  unint64_t v24 = v25;
  unint64_t v26 = v25 - 1;
  while (1)
  {
    unint64_t v27 = (v16 + v26) >> 1;
    unint64_t v28 = *(void *)((char *)v23 + v27 * v22) & 0x8FFFFFFFFFFFFFFFLL;
    if (v28 <= v20) {
      break;
    }
    unint64_t v26 = v27 - 1;
LABEL_12:
    if (v26 < v16)
    {
LABEL_13:
      if (!a3) {
        goto LABEL_29;
      }
      unint64_t v19 = *(void *)((char *)v23 + v22 + v22 * v27) & 0x8FFFFFFFFFFFFFFFLL;
      goto LABEL_28;
    }
  }
  unint64_t v16 = v27 + 1;
  if (v27 + 1 < v24)
  {
    if ((*(void *)((char *)v23 + v16 * v22) & 0x8FFFFFFFFFFFFFFFLL) > v20) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (!a3) {
    goto LABEL_29;
  }
LABEL_28:
  *a3 = v28 + v18;
  a3[1] = v19 - v28;
LABEL_29:
  if (v17 == 1) {
    return *(double *)&v23[3 * v27 + 1];
  }
  if (!v17) {
    return *(double *)&v23[2 * v27 + 1];
  }
  return v6;
}

double _NSLayoutTreeAttachmentSizeForGlyphAtIndex(uint64_t a1, unint64_t a2)
{
  double v2 = -1.0;
  if ((*(unsigned char *)(*(void *)(*(void *)(a1 + 240) + 240) + 56) & 8) != 0 && _NSLayoutTreeMoveToGlyphIndex(a1, a2))
  {
    uint64_t v5 = *(unint64_t **)(*(void *)(*(void *)(a1 + 240) + 248) + 40);
    if (v5)
    {
      unint64_t v6 = 0;
      unint64_t v7 = a2 - *(void *)(*(void *)(a1 + 240) + 256);
      unint64_t v10 = *v5;
      uint64_t v8 = v5 + 2;
      unint64_t v9 = v10;
      unint64_t v11 = v10 - 1;
      while (1)
      {
        unint64_t v12 = (v6 + v11) >> 1;
        if ((v8[3 * v12] & 0x8FFFFFFFFFFFFFFFLL) <= v7)
        {
          unint64_t v6 = v12 + 1;
          if (v12 + 1 >= v9 || (v8[3 * v6] & 0x8FFFFFFFFFFFFFFFLL) > v7) {
            return *(double *)&v8[3 * v12 + 1];
          }
        }
        else
        {
          unint64_t v11 = v12 - 1;
        }
        if (v11 < v6) {
          return *(double *)&v8[3 * v12 + 1];
        }
      }
    }
  }
  return v2;
}

BOOL _NSLayoutTreeLineFragmentDrawsOutsideLineForGlyphAtIndex(uint64_t a1, unint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(*(void *)(a1 + 240) + 240) + 56) & 0x10) == 0) {
    return 0;
  }
  BOOL result = _NSLayoutTreeMoveToGlyphIndex(a1, a2);
  if (!result) {
    return result;
  }
  uint64_t v5 = *(unint64_t **)(*(void *)(*(void *)(a1 + 240) + 248) + 24);
  if (!v5) {
    return 0;
  }
  unint64_t v6 = 0;
  unint64_t v7 = a2 - *(void *)(*(void *)(a1 + 240) + 256);
  unint64_t v10 = *v5;
  uint64_t v8 = v5 + 4;
  unint64_t v9 = v10;
  unint64_t v11 = v10 - 1;
  while (1)
  {
    unint64_t v12 = (v6 + v11) >> 1;
    unint64_t v13 = v8[10 * v12];
    if ((v13 & 0x8FFFFFFFFFFFFFFFLL) <= v7) {
      break;
    }
    unint64_t v11 = v12 - 1;
LABEL_10:
    if (v11 < v6) {
      return (v13 >> 60) & 1;
    }
  }
  unint64_t v6 = v12 + 1;
  if (v12 + 1 < v9 && (v8[10 * v6] & 0x8FFFFFFFFFFFFFFFLL) <= v7) {
    goto LABEL_10;
  }
  return (v13 >> 60) & 1;
}

BOOL _NSLayoutTreeOutsideDrawsUponLineFragmentForGlyphAtIndex(uint64_t a1, unint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(*(void *)(a1 + 240) + 240) + 56) & 0x20) == 0) {
    return 0;
  }
  BOOL result = _NSLayoutTreeMoveToGlyphIndex(a1, a2);
  if (!result) {
    return result;
  }
  uint64_t v5 = *(unint64_t **)(*(void *)(*(void *)(a1 + 240) + 248) + 24);
  if (!v5) {
    return 0;
  }
  unint64_t v6 = 0;
  unint64_t v7 = a2 - *(void *)(*(void *)(a1 + 240) + 256);
  unint64_t v10 = *v5;
  uint64_t v8 = v5 + 4;
  unint64_t v9 = v10;
  unint64_t v11 = v10 - 1;
  while (1)
  {
    unint64_t v12 = (v6 + v11) >> 1;
    unint64_t v13 = v8[10 * v12];
    if ((v13 & 0x8FFFFFFFFFFFFFFFLL) <= v7) {
      break;
    }
    unint64_t v11 = v12 - 1;
LABEL_10:
    if (v11 < v6) {
      return (v13 >> 61) & 1;
    }
  }
  unint64_t v6 = v12 + 1;
  if (v12 + 1 < v9 && (v8[10 * v6] & 0x8FFFFFFFFFFFFFFFLL) <= v7) {
    goto LABEL_10;
  }
  return (v13 >> 61) & 1;
}

uint64_t _NSLayoutTreeGetExtraLineFragmentRect(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(result + 240) + 272);
  double v6 = *(double *)(*(void *)(result + 240) + 280);
  uint64_t v7 = *(void *)(*(void *)(result + 240) + 304);
  double v8 = *(double *)(*(void *)(result + 240) + 312);
  long long v26 = *(_OWORD *)(*(void *)(result + 240) + 320);
  long long v27 = *(_OWORD *)(*(void *)(result + 240) + 288);
  uint64_t v9 = **(void **)(*(void *)(result + 240) + 240);
  double v10 = 0.0;
  if (v9)
  {
    uint64_t v11 = result;
    uint64_t v12 = v9 - 1;
    BOOL result = _NSLayoutTreeMoveToGlyphIndex(result, v9 - 1);
    if (result)
    {
      uint64_t v13 = *(void *)(*(void *)(v11 + 240) + 256);
      uint64_t v14 = *(unint64_t **)(*(void *)(*(void *)(v11 + 240) + 248) + 24);
      double v15 = *(double *)(*(void *)(v11 + 240) + 264);
      if (v14)
      {
        unint64_t v16 = 0;
        unint64_t v17 = v12 - v13;
        unint64_t v20 = *v14;
        uint64_t v18 = v14 + 4;
        unint64_t v19 = v20;
        unint64_t v21 = v20 - 1;
        while (1)
        {
          unint64_t v22 = (v16 + v21) >> 1;
          if ((v18[10 * v22] & 0x8FFFFFFFFFFFFFFFLL) <= v17)
          {
            unint64_t v16 = v22 + 1;
            if (v22 + 1 >= v19 || (v18[10 * v16] & 0x8FFFFFFFFFFFFFFFLL) > v17)
            {
LABEL_10:
              unint64_t v23 = (double *)&v18[10 * v22];
              double v24 = v23[9];
              double v25 = v15 + v23[7];
              goto LABEL_12;
            }
          }
          else
          {
            unint64_t v21 = v22 - 1;
          }
          if (v21 < v16) {
            goto LABEL_10;
          }
        }
      }
      double v24 = *(double *)(*(void *)(v11 + 240) + 344);
      double v25 = v15 + (double)((unint64_t)(v12 - v13) / *(void *)(*(void *)(v11 + 240) + 336)) * v24;
LABEL_12:
      double v10 = v25 + v24;
    }
  }
  if (a2)
  {
    *(void *)a2 = v5;
    *(double *)(a2 + _Block_object_dispose(&STACK[0x2B0], 8) = v6 + v10;
    *(_OWORD *)(a2 + 16) = v27;
  }
  if (a3)
  {
    *(void *)a3 = v7;
    *(double *)(a3 + _Block_object_dispose(&STACK[0x2B0], 8) = v8 + v10;
    *(_OWORD *)(a3 + 16) = v26;
  }
  return result;
}

void _NSLayoutTreeInvalidateLayoutForCharacterRange(uint64_t a1, unint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v13 = _NSGlyphTreeGlyphIndexForCharacterAtIndex(a1, a2);
  unint64_t v14 = _NSGlyphTreeGlyphIndexForCharacterAtIndex(a1, a2 + a3);
  unint64_t v19 = **(void **)(*(void *)(a1 + 240) + 240);
  if (v14 < v19) {
    unint64_t v19 = v14;
  }
  if (v19 > v13 && (a4 & 1) == 0)
  {
    _NSLayoutTreeInvalidateLayoutForGlyphRange(a1, v13, v19 - v13, 0, v15, v16, v17, v18, a9);
  }
}

void _NSLayoutTreeInvalidateLayoutForGlyphRange(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (!(a3 | a4)) {
    return;
  }
  unint64_t v9 = a2;
  uint64_t v10 = a1;
  uint64_t v11 = &OBJC_IVAR___NSLayoutManager__extraData;
  unint64_t v12 = a2 + a3;
  uint64_t v153 = **(void **)(*(void *)(a1 + 240) + 240);
  if (a2 < a2 + a3)
  {
    uint64_t v13 = a3 + a4;
    uint64_t v14 = a4;
    while (1)
    {
      uint64_t v15 = v13 - (v12 - v9);
      if (!_NSLayoutTreeMoveToGlyphIndex(v10, v9)) {
        break;
      }
      uint64_t v16 = v11;
      uint64_t v17 = *(void *)(v10 + *v11);
      uint64_t v19 = *(void *)(v17 + 248);
      unint64_t v18 = *(void *)(v17 + 256);
      unint64_t v20 = *(void *)v19;
      unint64_t v21 = *(void *)v19 + v18;
      unint64_t v22 = v21 - v9;
      if (v12 <= v21) {
        unint64_t v22 = v12 - v9;
      }
      else {
        uint64_t v15 = v13 - (v21 - v9);
      }
      double v24 = (void **)(v19 + 24);
      unint64_t v23 = *(void **)(v19 + 24);
      if (v23)
      {
        if (v9 <= v18)
        {
          if (v9)
          {
            uint64_t v36 = v21 - (v22 + v9);
            if (v21 <= v22 + v9)
            {
              uint64_t v10 = a1;
              _NSLayoutTreeDeleteCurrentNode(a1, a2, v36, a4, a5, a6, a7, a8);
              uint64_t v11 = v16;
              if (!v13) {
                goto LABEL_62;
              }
            }
            else
            {
              _NSLayoutNodeTruncate(*(void *)(v17 + 248), v22 + v9 - v18, v36, *(void *)(v17 + 336), *(double *)(v17 + 344));
              uint64_t v11 = v16;
              uint64_t v10 = a1;
              if (!v13) {
                goto LABEL_62;
              }
            }
            if (_NSLayoutTreeMoveToGlyphIndex(v10, v9 - 1))
            {
              uint64_t v58 = *(void *)(v10 + *v11) + 240;
              uint64_t v59 = *(void *)(*(void *)(v10 + *v11) + 248);
              uint64_t v60 = v10;
              unint64_t v61 = (void **)(v59 + 24);
              if (*(void *)(v59 + 24))
              {
                unint64_t v62 = *(void *)(v58 + 96);
                double v63 = *(double *)(v58 + 104);
                unint64_t v64 = (double *)malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
                *((unsigned char *)v64 + 59) = 1;
                *(void *)unint64_t v64 = v13;
                v64[1] = v63 * (double)((v13 - 1) / v62 + 1);
                *((unsigned char *)v64 + 56) = 1;
                _NSLayoutTreeInsertNodeAfterCurrentNode(v60, (uint64_t)v64, v65, v66, v67, v68, v69, v70);
                uint64_t v10 = v60;
              }
              else
              {
                uint64_t v81 = *(void *)v59;
                unint64_t v152 = *(void *)(v58 + 96);
                double v82 = *(double *)(v58 + 104);
                if (*(unsigned char *)(v59 + 59))
                {
                  unint64_t v83 = 0;
                }
                else
                {
                  for (uint64_t i = 0; i != 3; ++i)
                  {
                    uint64_t v85 = (uint64_t)v61[i];
                    if (v85)
                    {
                      _NSLayoutNodeFree(v85);
                      v61[i] = 0;
                    }
                  }
                  unint64_t v83 = *v61;
                  uint64_t v11 = v16;
                }
                uint64_t v86 = v81 + v13;
                *(unsigned char *)(v59 + 59) = 1;
                unint64_t v87 = v81 + v13 - 1;
                if (!(v81 + v13)) {
                  unint64_t v87 = 0;
                }
                *(void *)uint64_t v59 = v86;
                *(double *)(v59 + _Block_object_dispose(&STACK[0x2B0], 8) = v82 * (double)(v87 / v152 + 1);
                *(unsigned char *)(v59 + 56) = v86 != 0;
                if (v83)
                {
                  free(v83);
                  *unint64_t v61 = 0;
                }
                unint64_t v88 = *(void **)(v59 + 32);
                if (v88)
                {
                  free(v88);
                  *(void *)(v59 + 32) = 0;
                  *(unsigned char *)(v59 + 5_Block_object_dispose(&STACK[0x2B0], 8) = 0;
                }
                unint64_t v89 = *(void **)(v59 + 40);
                uint64_t v10 = a1;
                if (v89)
                {
                  free(v89);
                  *(void *)(v59 + 40) = 0;
                }
                _NSLayoutNodeSetInvariants(v59);
              }
              goto LABEL_62;
            }
            unint64_t v33 = @"!!! _NSLayoutTreeInvalidateLayoutForGlyphRange found invalid glyph index";
            goto LABEL_13;
          }
          uint64_t v47 = v21 - v22;
          uint64_t v11 = v16;
          if (v21 <= v22)
          {
            if (!v13)
            {
              uint64_t v10 = a1;
              _NSLayoutTreeDeleteCurrentNode(a1, a2, v47, a4, a5, a6, a7, a8);
              goto LABEL_62;
            }
            unint64_t v71 = *(void *)(v17 + 336);
            double v72 = *(double *)(v17 + 344);
            if (!*(unsigned char *)(v19 + 59))
            {
              for (uint64_t j = 0; j != 3; ++j)
              {
                uint64_t v74 = (uint64_t)v24[j];
                if (v74)
                {
                  _NSLayoutNodeFree(v74);
                  v24[j] = 0;
                }
              }
              unint64_t v23 = *v24;
            }
            *(unsigned char *)(v19 + 59) = 1;
            *(void *)uint64_t v19 = v13;
            *(double *)(v19 + _Block_object_dispose(&STACK[0x2B0], 8) = v72 * (double)((v13 - 1) / v71 + 1);
            *(unsigned char *)(v19 + 56) = 1;
            if (v23)
            {
LABEL_55:
              free(v23);
              *double v24 = 0;
            }
LABEL_56:
            uint64_t v79 = *(void **)(v19 + 32);
            uint64_t v11 = v16;
            if (v79)
            {
              free(v79);
              *(void *)(v19 + 32) = 0;
              *(unsigned char *)(v19 + 5_Block_object_dispose(&STACK[0x2B0], 8) = 0;
            }
            unint64_t v80 = *(void **)(v19 + 40);
            if (v80)
            {
              free(v80);
              *(void *)(v19 + 40) = 0;
            }
            _NSLayoutNodeSetInvariants(v19);
LABEL_61:
            uint64_t v10 = a1;
            goto LABEL_62;
          }
          _NSLayoutNodeTruncate(*(void *)(v17 + 248), v22 - v18, v47, *(void *)(v17 + 336), *(double *)(v17 + 344));
          if (!v13) {
            goto LABEL_61;
          }
          unint64_t v48 = *(void *)(*(void *)(a1 + *v16) + 336);
          double v49 = *(double *)(*(void *)(a1 + *v16) + 344);
          uint64_t v50 = (double *)malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
          *((unsigned char *)v50 + 59) = 1;
          *(void *)uint64_t v50 = v13;
          unint64_t v51 = (v13 - 1) / v48;
          uint64_t v10 = a1;
          v50[1] = v49 * (double)(v51 + 1);
          *((unsigned char *)v50 + 56) = 1;
          _NSLayoutTreeInsertNodeBeforeCurrentNode(a1, (uint64_t)v50, v52, v53, v54, v55, v56, v57);
        }
        else
        {
          unint64_t v25 = v22 + v9;
          if (v21 <= v25)
          {
            uint64_t v11 = v16;
          }
          else
          {
            SubNode = _NSLayoutNodeCreateSubNode(*(void *)(v17 + 248), v25 - v18, v21 - v25, *(void *)(v17 + 336), *(double *)(v17 + 344));
            _NSLayoutTreeInsertNodeAfterCurrentNode(a1, (uint64_t)SubNode, v27, v28, v29, v30, v31, v32);
            uint64_t v11 = v16;
            uint64_t v17 = *(void *)(a1 + *v16);
            uint64_t v19 = *(void *)(v17 + 248);
            unint64_t v18 = *(void *)(v17 + 256);
          }
          _NSLayoutNodeTruncate(v19, 0, v9 - v18, *(void *)(v17 + 336), *(double *)(v17 + 344));
          if (!v13) {
            goto LABEL_61;
          }
          unint64_t v37 = *(void *)(*(void *)(a1 + *v11) + 336);
          double v38 = *(double *)(*(void *)(a1 + *v11) + 344);
          unint64_t v39 = (double *)malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
          *((unsigned char *)v39 + 59) = 1;
          *(void *)unint64_t v39 = v13;
          unint64_t v40 = (v13 - 1) / v37;
          uint64_t v10 = a1;
          v39[1] = v38 * (double)(v40 + 1);
          *((unsigned char *)v39 + 56) = 1;
          _NSLayoutTreeInsertNodeAfterCurrentNode(a1, (uint64_t)v39, v41, v42, v43, v44, v45, v46);
        }
      }
      else
      {
        if (!v15)
        {
          uint64_t v11 = v16;
          goto LABEL_61;
        }
        if (v15 > 0 || v20 > -v15)
        {
          double v35 = *(double *)(v17 + 344);
          unint64_t v152 = *(void *)(v17 + 336);
          if (*(unsigned char *)(v19 + 59))
          {
            unint64_t v23 = 0;
          }
          else
          {
            for (uint64_t k = 0; k != 3; ++k)
            {
              uint64_t v76 = (uint64_t)v24[k];
              if (v76)
              {
                _NSLayoutNodeFree(v76);
                v24[k] = 0;
              }
            }
            unint64_t v23 = *v24;
          }
          unint64_t v77 = v15 + v20;
          *(unsigned char *)(v19 + 59) = 1;
          unint64_t v78 = v15 + v20 - 1;
          if (!(v15 + v20)) {
            unint64_t v78 = 0;
          }
          *(void *)uint64_t v19 = v77;
          *(double *)(v19 + _Block_object_dispose(&STACK[0x2B0], 8) = v35 * (double)(v78 / v152 + 1);
          *(unsigned char *)(v19 + 56) = v77 != 0;
          if (v23) {
            goto LABEL_55;
          }
          goto LABEL_56;
        }
        uint64_t v10 = a1;
        _NSLayoutTreeDeleteCurrentNode(a1, a2, a3, a4, a5, a6, a7, a8);
        uint64_t v11 = v16;
      }
LABEL_62:
      v9 += v13;
      v12 += v15;
      v14 -= v15;
      uint64_t v13 = 0;
      if (v9 >= v12) {
        goto LABEL_82;
      }
    }
    unint64_t v33 = @"!!! _NSLayoutTreeInvalidateLayoutForGlyphRange invalid range 1";
LABEL_13:
    _NSLayoutTreeLogDebug((NSString *)v33, a2, a3, a4, a5, a6, a7, a8, v152);
    goto LABEL_62;
  }
  uint64_t v14 = a4;
LABEL_82:
  unint64_t v90 = v14 - 1;
  if (v14 < 1)
  {
    uint64_t v110 = v153;
    if (v14 < 0) {
      _NSLayoutTreeLogDebug((NSString *)@"!!! _NSLayoutTreeInvalidateLayoutForGlyphRange invalid change in length", a2, a3, a4, a5, a6, a7, a8, v152);
    }
    goto LABEL_130;
  }
  if (!v9)
  {
    unint64_t v111 = (void *)(*(void *)(v10 + *v11) + 240);
    if (!*(void *)*v111)
    {
      v111[1] = *v111;
      *(void *)(*(void *)(v10 + *v11) + 256) = 0;
      *(void *)(*(void *)(v10 + *v11) + 264) = 0;
      uint64_t v123 = *(void *)(*(void *)(v10 + *v11) + 248);
      unint64_t v124 = *(void *)(*(void *)(v10 + *v11) + 336);
      double v125 = *(double *)(*(void *)(v10 + *v11) + 344);
      if (!*(unsigned char *)(v123 + 59))
      {
        uint64_t v126 = 0;
        uint64_t v127 = v123 + 24;
        do
        {
          uint64_t v128 = *(void *)(v127 + v126);
          if (v128)
          {
            _NSLayoutNodeFree(v128);
            *(void *)(v127 + v126) = 0;
          }
          v126 += 8;
        }
        while (v126 != 24);
      }
      *(unsigned char *)(v123 + 59) = 1;
      *(void *)uint64_t v123 = v14;
      *(double *)(v123 + _Block_object_dispose(&STACK[0x2B0], 8) = v125 * (double)((v14 - 1) / v124 + 1);
      *(unsigned char *)(v123 + 56) = 1;
      double v129 = *(void **)(v123 + 24);
      if (v129)
      {
        free(v129);
        *(void *)(v123 + 24) = 0;
      }
      BOOL v130 = *(void **)(v123 + 32);
      uint64_t v110 = v153;
      if (v130)
      {
        free(v130);
        *(void *)(v123 + 32) = 0;
        *(unsigned char *)(v123 + 5_Block_object_dispose(&STACK[0x2B0], 8) = 0;
      }
      unint64_t v131 = *(void **)(v123 + 40);
      uint64_t v10 = a1;
      if (v131)
      {
        free(v131);
        *(void *)(v123 + 40) = 0;
      }
      uint64_t v132 = v123;
      goto LABEL_129;
    }
    if (_NSLayoutTreeMoveToGlyphIndex(v10, 0))
    {
      uint64_t v112 = *(void **)(*(void *)(v10 + *v11) + 248);
      if (v112[3])
      {
        unint64_t v113 = *(void *)(*(void *)(v10 + *v11) + 336);
        double v114 = *(double *)(*(void *)(v10 + *v11) + 344);
        uint64_t v115 = (double *)malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
        *((unsigned char *)v115 + 59) = 1;
        *(void *)uint64_t v115 = v14;
        v115[1] = v114 * (double)(v90 / v113 + 1);
        *((unsigned char *)v115 + 56) = 1;
        _NSLayoutTreeInsertNodeBeforeCurrentNode(v10, (uint64_t)v115, v116, v117, v118, v119, v120, v121);
      }
      else
      {
        _NSLayoutNodeInvalidate((uint64_t)v112, *v112 + v14, *(void *)(*(void *)(v10 + *v11) + 336), *(double *)(*(void *)(v10 + *v11) + 344));
      }
      goto LABEL_113;
    }
    unint64_t v122 = @"!!! _NSLayoutTreeInvalidateLayoutForGlyphRange invalid range 3";
LABEL_110:
    _NSLayoutTreeLogDebug((NSString *)v122, v91, v92, v93, v94, v95, v96, v97, v152);
LABEL_113:
    uint64_t v110 = v153;
    goto LABEL_130;
  }
  if (!_NSLayoutTreeMoveToGlyphIndex(v10, v9 - 1))
  {
    unint64_t v122 = @"!!! _NSLayoutTreeInvalidateLayoutForGlyphRange invalid range 2";
    goto LABEL_110;
  }
  uint64_t v98 = *(void *)(v10 + *v11);
  uint64_t v99 = *(void *)(v98 + 248);
  NSPoint v100 = (void **)(v99 + 24);
  if (*(void *)(v99 + 24))
  {
    uint64_t v101 = *(void *)(v98 + 256);
    unint64_t v102 = *(void *)v99 + v101;
    if (v102 <= v9)
    {
      uint64_t v10 = a1;
    }
    else
    {
      NSRect v103 = _NSLayoutNodeCreateSubNode(*(void *)(v98 + 248), v9 - v101, v102 - v9, *(void *)(v98 + 336), *(double *)(v98 + 344));
      uint64_t v10 = a1;
      _NSLayoutTreeInsertNodeAfterCurrentNode(a1, (uint64_t)v103, v104, v105, v106, v107, v108, v109);
      _NSLayoutNodeTruncate(*(void *)(*(void *)(v10 + *v11) + 248), 0, v9 - *(void *)(*(void *)(v10 + *v11) + 256), *(void *)(*(void *)(v10 + *v11) + 336), *(double *)(*(void *)(v10 + *v11) + 344));
      uint64_t v98 = *(void *)(a1 + *v11);
    }
    uint64_t v137 = v98 + 240;
    unint64_t v138 = *(void *)(v137 + 96);
    double v139 = *(double *)(v137 + 104);
    uint64_t v140 = (double *)malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
    *((unsigned char *)v140 + 59) = 1;
    *(void *)uint64_t v140 = v14;
    v140[1] = v139 * (double)(v90 / v138 + 1);
    *((unsigned char *)v140 + 56) = 1;
    _NSLayoutTreeInsertNodeAfterCurrentNode(v10, (uint64_t)v140, v141, v142, v143, v144, v145, v146);
    goto LABEL_113;
  }
  uint64_t v133 = *(void *)v99 + v14;
  unint64_t v134 = *(void *)(v98 + 336);
  double v135 = *(double *)(v98 + 344);
  if (*(unsigned char *)(v99 + 59))
  {
    uint64_t v136 = 0;
  }
  else
  {
    for (uint64_t m = 0; m != 3; ++m)
    {
      uint64_t v148 = (uint64_t)v100[m];
      if (v148)
      {
        _NSLayoutNodeFree(v148);
        v100[m] = 0;
      }
    }
    uint64_t v136 = *v100;
  }
  *(unsigned char *)(v99 + 59) = 1;
  unint64_t v149 = v133 - 1;
  if (!v133) {
    unint64_t v149 = 0;
  }
  *(void *)uint64_t v99 = v133;
  *(double *)(v99 + _Block_object_dispose(&STACK[0x2B0], 8) = v135 * (double)(v149 / v134 + 1);
  *(unsigned char *)(v99 + 56) = v133 != 0;
  if (v136)
  {
    free(v136);
    *NSPoint v100 = 0;
  }
  __n128 v150 = *(void **)(v99 + 32);
  uint64_t v110 = v153;
  if (v150)
  {
    free(v150);
    *(void *)(v99 + 32) = 0;
    *(unsigned char *)(v99 + 5_Block_object_dispose(&STACK[0x2B0], 8) = 0;
  }
  __n128 v151 = *(void **)(v99 + 40);
  uint64_t v10 = a1;
  if (v151)
  {
    free(v151);
    *(void *)(v99 + 40) = 0;
  }
  uint64_t v132 = v99;
LABEL_129:
  _NSLayoutNodeSetInvariants(v132);
LABEL_130:
  if (v110 + a4 != **(void **)(*(void *)(v10 + *v11) + 240))
  {
    _NSLayoutTreeLogDebug((NSString *)@"!!! _NSLayoutTreeInvalidateLayoutForGlyphRange glyph count mismatch", a2, a3, a4, a5, a6, a7, a8, a9);
  }
}

void _NSLayoutTreeInsertNodeAfterCurrentNode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double v8 = *(void **)(*(void *)(a1 + 240) + 248);
  if (v8) {
    BOOL v9 = a2 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    return;
  }
  uint64_t v10 = (void *)a2;
  long long v23 = 0u;
  long long v24 = 0u;
  while (1)
  {
    unint64_t v12 = (void *)v8[2];
    if (!v12)
    {
      unint64_t v22 = malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
      v22[1] = 0;
      v22[3] = v8;
      v22[4] = v10;
      v8[2] = v22;
      v10[2] = v22;
      _NSLayoutNodeSetInvariants((uint64_t)v22);
      *(void *)(*(void *)(a1 + 240) + 240) = v22;
      return;
    }
    unint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = (void *)v12[v13 + 3];
      if (!v14) {
        break;
      }
      if (v8 == v14)
      {
        uint64_t v14 = v8;
        break;
      }
      if (++v13 == 3)
      {
        uint64_t v14 = 0;
        break;
      }
    }
    if (v8 != v14)
    {
      _NSLayoutTreeLogDebug((NSString *)@"!!! _NSLayoutTreeInsertNodeAfterCurrentNode found broken link", a2, a3, a4, a5, a6, a7, a8, v23);
      unint64_t v12 = v8;
      uint64_t v15 = v10;
      if (!v8) {
        return;
      }
      goto LABEL_23;
    }
    if (!v12[5]) {
      break;
    }
    uint64_t v15 = malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
    uint64_t v16 = 0;
    v15[1] = 0;
    do
    {
      *(void *)((char *)&v23 + v16 * _Block_object_dispose(&STACK[0x2B0], 8) = v12[v16 + 3];
      v12[v16 + 3] = 0;
      ++v16;
    }
    while (v16 != 3);
    unint64_t v17 = v13 + 1;
    if (v13 <= 1)
    {
      uint64_t v18 = 0;
      do
      {
        *((void *)&v24 + v18 + 1) = *((void *)&v23 + v18 + 2);
        unint64_t v19 = v18 + 2;
        --v18;
      }
      while (v19 > v17);
    }
    *((void *)&v23 + v17) = v10;
    long long v20 = v23;
    v12[3] = v23;
    *(void *)(v20 + 16) = v12;
    v12[4] = *((void *)&v20 + 1);
    *(void *)(*((void *)&v20 + 1) + 16) = v12;
    _NSLayoutNodeSetInvariants((uint64_t)v12);
    long long v21 = v24;
    v15[3] = v24;
    *(void *)(v21 + 16) = v15;
    v15[4] = *((void *)&v21 + 1);
    *(void *)(*((void *)&v21 + 1) + 16) = v15;
    _NSLayoutNodeSetInvariants((uint64_t)v15);
LABEL_23:
    uint64_t v10 = v15;
    double v8 = v12;
    if (!v15) {
      return;
    }
  }
  if (!v13) {
    v12[5] = v12[4];
  }
  v12[v13 + 4] = v10;
  v10[2] = v12;

  _NSLayoutNodeSetInvariants((uint64_t)v12);
}

double *_NSLayoutNodeCreateSubNode(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, double a5)
{
  unint64_t v10 = *(void *)a1;
  uint64_t v11 = (double *)malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
  unint64_t v12 = v11;
  *((unsigned char *)v11 + 59) = 1;
  *(void *)uint64_t v11 = a3;
  unint64_t v13 = a3 - 1;
  if (!a3) {
    unint64_t v13 = 0;
  }
  v11[1] = (double)(v13 / a4 + 1) * a5;
  *((unsigned char *)v11 + 56) = a3 != 0;
  *((unsigned char *)v11 + 56) = *(unsigned char *)(a1 + 56);
  uint64_t v14 = *(unint64_t **)(a1 + 24);
  if (v14)
  {
    unint64_t v15 = 0;
    uint64_t v16 = v14 + 4;
    unint64_t v17 = *v14 - 1;
    while (1)
    {
      unint64_t v18 = v15 + v17;
      unint64_t v19 = (v15 + v17) >> 1;
      if ((v16[10 * v19] & 0x8FFFFFFFFFFFFFFFLL) <= a2)
      {
        unint64_t v15 = v19 + 1;
        if (v19 + 1 >= *v14 || (v16[10 * v15] & 0x8FFFFFFFFFFFFFFFLL) > a2)
        {
LABEL_10:
          if (v18 > 1)
          {
            double v23 = *(double *)&v16[10 * v19 - 3] + *(double *)&v16[10 * v19 - 1];
            SubRange = _NSGlyphRangeListCreateSubRange(v14, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedFragmentCapacity, v10, 32, 80, a2, a3);
            long long v21 = SubRange + 4;
            uint64_t v22 = *SubRange;
            if (v23 != 0.0 && v22 != 0)
            {
              uint64_t v25 = (double *)(SubRange + 11);
              uint64_t v26 = *SubRange;
              do
              {
                *uint64_t v25 = *v25 - v23;
                *(v25 - 4) = *(v25 - 4) - v23;
                v25 += 10;
                --v26;
              }
              while (v26);
            }
          }
          else
          {
            SubRange = _NSGlyphRangeListCreateSubRange(v14, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedFragmentCapacity, v10, 32, 80, a2, a3);
            long long v21 = SubRange + 4;
            uint64_t v22 = *SubRange;
          }
          v12[1] = *(double *)&v21[10 * v22 - 3] + *(double *)&v21[10 * v22 - 1];
          *((void *)v12 + 3) = SubRange;
          break;
        }
      }
      else
      {
        unint64_t v17 = v19 - 1;
      }
      if (v17 < v15) {
        goto LABEL_10;
      }
    }
  }
  if (*(void *)(a1 + 32))
  {
    *((unsigned char *)v12 + 5_Block_object_dispose(&STACK[0x2B0], 8) = *(unsigned char *)(a1 + 58);
    uint64_t v27 = 24;
    if (*(unsigned char *)(a1 + 58) != 1) {
      uint64_t v27 = 0;
    }
    if (*(unsigned char *)(a1 + 58)) {
      uint64_t v28 = v27;
    }
    else {
      uint64_t v28 = 16;
    }
    *((void *)v12 + 4) = _NSGlyphRangeListCreateSubRange(*(unint64_t **)(a1 + 32), (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedLocationCapacity, v10, 16, v28, a2, a3);
  }
  uint64_t v29 = *(unint64_t **)(a1 + 40);
  if (v29) {
    *((void *)v12 + 5) = _NSGlyphRangeListCreateSubRange(v29, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedAttachmentSizeCapacity, v10, 16, 24, a2, a3);
  }
  return v12;
}

uint64_t _NSLayoutNodeTruncate(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, double a5)
{
  unint64_t v8 = *(void *)a1;
  BOOL v9 = *(void **)(a1 + 24);
  if (v9)
  {
    unint64_t v10 = 0;
    uint64_t v11 = v9 + 4;
    unint64_t v12 = *v9 - 1;
    while (1)
    {
      unint64_t v13 = v10 + v12;
      unint64_t v14 = (v10 + v12) >> 1;
      if ((v11[10 * v14] & 0x8FFFFFFFFFFFFFFFLL) <= a2)
      {
        unint64_t v10 = v14 + 1;
        if (v14 + 1 >= *v9 || (v11[10 * v10] & 0x8FFFFFFFFFFFFFFFLL) > a2)
        {
LABEL_8:
          if (v13 > 1)
          {
            double v19 = *(double *)&v11[10 * v14 - 3] + *(double *)&v11[10 * v14 - 1];
            unint64_t v15 = _NSGlyphRangeListTruncate(v9, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedFragmentCapacity, v8, 32, 80, a2, a3);
            uint64_t v16 = v15 + 4;
            uint64_t v17 = *v15;
            if (v19 != 0.0 && v17 != 0)
            {
              long long v21 = (double *)(v15 + 11);
              uint64_t v22 = *v15;
              do
              {
                *long long v21 = *v21 - v19;
                *(v21 - 4) = *(v21 - 4) - v19;
                v21 += 10;
                --v22;
              }
              while (v22);
            }
          }
          else
          {
            unint64_t v15 = _NSGlyphRangeListTruncate(v9, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedFragmentCapacity, v8, 32, 80, a2, a3);
            uint64_t v16 = v15 + 4;
            uint64_t v17 = *v15;
          }
          *(double *)(a1 + _Block_object_dispose(&STACK[0x2B0], 8) = *(double *)&v16[10 * v17 - 3] + *(double *)&v16[10 * v17 - 1];
          *(void *)(a1 + 24) = v15;
          goto LABEL_20;
        }
      }
      else
      {
        unint64_t v12 = v14 - 1;
      }
      if (v12 < v10) {
        goto LABEL_8;
      }
    }
  }
  unint64_t v18 = a3 - 1;
  if (!a3) {
    unint64_t v18 = 0;
  }
  *(double *)(a1 + _Block_object_dispose(&STACK[0x2B0], 8) = (double)(v18 / a4 + 1) * a5;
LABEL_20:
  double v23 = *(void **)(a1 + 32);
  if (v23)
  {
    uint64_t v24 = 24;
    if (*(unsigned char *)(a1 + 58) != 1) {
      uint64_t v24 = 0;
    }
    if (*(unsigned char *)(a1 + 58)) {
      uint64_t v25 = v24;
    }
    else {
      uint64_t v25 = 16;
    }
    *(void *)(a1 + 32) = _NSGlyphRangeListTruncate(v23, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedLocationCapacity, v8, 16, v25, a2, a3);
  }
  uint64_t v26 = *(void **)(a1 + 40);
  if (v26) {
    *(void *)(a1 + 40) = _NSGlyphRangeListTruncate(v26, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedAttachmentSizeCapacity, v8, 16, 24, a2, a3);
  }
  *(void *)a1 = a3;

  return _NSLayoutNodeSetInvariants(a1);
}

uint64_t _NSLayoutTreeDeleteCurrentNode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  while (2)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 240) + 248);
    if (*(void *)(v9 + 16))
    {
      for (unint64_t i = 0; i != 3; ++i)
      {
        uint64_t v11 = *(void *)(*(void *)(a1 + 240) + 248);
        uint64_t v12 = *(void *)(v11 + 16);
        uint64_t v13 = *(void *)(v12 + 8 * i + 24);
        if (!v13) {
          goto LABEL_12;
        }
        if (v11 == v13)
        {
          *(void *)(*(void *)(a1 + 240) + 24_Block_object_dispose(&STACK[0x2B0], 8) = v12;
          if (i <= 1)
          {
            do
            {
              unint64_t v14 = i;
              uint64_t v15 = *(void *)(*(void *)(a1 + 240) + 248) + 8 * i;
              *(void *)(v15 + 24) = *(void *)(v15 + 32);
              unint64_t i = 1;
            }
            while (!v14);
          }
          goto LABEL_10;
        }
        *(void *)(*(void *)(a1 + 240) + 256) -= *(void *)v13;
        *(double *)(*(void *)(a1 + 240) + 264) = *(double *)(*(void *)(a1 + 240) + 264) - *(double *)(v13 + 8);
      }
      if (*(void *)(*(void *)(a1 + 240) + 248))
      {
LABEL_12:
        _NSLayoutTreeLogDebug((NSString *)@"!!! _NSLayoutTreeDeleteCurrentNode found broken link", a2, a3, a4, a5, a6, a7, a8, v27);
        break;
      }
      uint64_t v11 = 0;
      *(void *)(*(void *)(a1 + 240) + 24_Block_object_dispose(&STACK[0x2B0], 8) = MEMORY[0x10];
LABEL_10:
      *(void *)(*(void *)(*(void *)(a1 + 240) + 248) + 40) = 0;
      _NSLayoutNodeFree(v11);
      uint64_t v16 = *(void *)(*(void *)(a1 + 240) + 248);
      if (!*(void *)(v16 + 24)) {
        continue;
      }
      _NSLayoutNodeSetInvariants(v16);
    }
    else
    {
      uint64_t v23 = *(void *)(*(void *)(a1 + 240) + 240);
      _NSLayoutNodeFree(*(void *)(*(void *)(a1 + 240) + 248));
      uint64_t v24 = (void *)(*(void *)(a1 + 240) + 240);
      if (v9 == v23)
      {
        uint64_t v25 = *(void *)(*(void *)(a1 + 240) + 344);
        uint64_t v26 = malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
        v26[59] = 1;
        *(void *)uint64_t v26 = 0;
        *((void *)v26 + 1) = v25;
        v26[56] = 0;
        *(void *)(*(void *)(a1 + 240) + 240) = v26;
        uint64_t v24 = (void *)(*(void *)(a1 + 240) + 240);
      }
      v24[1] = *v24;
      *(void *)(*(void *)(a1 + 240) + 256) = 0;
      *(void *)(*(void *)(a1 + 240) + 264) = 0;
    }
    break;
  }
  uint64_t v17 = (void *)(a1 + 240);
  for (uint64_t result = *(void *)(*(void *)(a1 + 240) + 240);
        !*(unsigned char *)(result + 59);
        uint64_t result = *(void *)(*(void *)(a1 + 240) + 240))
  {
    if (*(void *)(result + 32)) {
      break;
    }
    uint64_t v19 = *(void *)(result + 24);
    if (v19)
    {
      *(void *)(result + 24) = 0;
      *(void *)(v19 + 16) = 0;
      long long v20 = (void *)(*v17 + 240);
      if (v20[1] == *v20) {
        v20[1] = v19;
      }
      _NSLayoutNodeFree(*(void *)(*(void *)(a1 + 240) + 240));
      *(void *)(*(void *)(a1 + 240) + 240) = v19;
    }
    else
    {
      _NSLayoutNodeFree(result);
      uint64_t v21 = *(void *)(*(void *)(a1 + 240) + 344);
      uint64_t v22 = malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
      v22[59] = 1;
      *(void *)uint64_t v22 = 0;
      *((void *)v22 + 1) = v21;
      v22[56] = 0;
      *(void *)(*(void *)(a1 + 240) + 240) = v22;
      *(void *)(*(void *)(a1 + 240) + 24_Block_object_dispose(&STACK[0x2B0], 8) = *(void *)(*(void *)(a1 + 240) + 240);
      *(void *)(*(void *)(a1 + 240) + 256) = 0;
      *(void *)(*(void *)(a1 + 240) + 264) = 0;
    }
    uint64_t v17 = (void *)(a1 + 240);
  }
  return result;
}

uint64_t _NSLayoutNodeInvalidate(uint64_t a1, uint64_t a2, unint64_t a3, double a4)
{
  if (!*(unsigned char *)(a1 + 59))
  {
    uint64_t v8 = 0;
    uint64_t v9 = a1 + 24;
    do
    {
      uint64_t v10 = *(void *)(v9 + v8);
      if (v10)
      {
        _NSLayoutNodeFree(v10);
        *(void *)(v9 + v_Block_object_dispose(&STACK[0x2B0], 8) = 0;
      }
      v8 += 8;
    }
    while (v8 != 24);
  }
  *(unsigned char *)(a1 + 59) = 1;
  *(void *)a1 = a2;
  unint64_t v11 = a2 - 1;
  if (!a2) {
    unint64_t v11 = 0;
  }
  *(double *)(a1 + _Block_object_dispose(&STACK[0x2B0], 8) = (double)(v11 / a3 + 1) * a4;
  *(unsigned char *)(a1 + 56) = a2 != 0;
  uint64_t v12 = *(void **)(a1 + 24);
  if (v12)
  {
    free(v12);
    *(void *)(a1 + 24) = 0;
  }
  uint64_t v13 = *(void **)(a1 + 32);
  if (v13)
  {
    free(v13);
    *(void *)(a1 + 32) = 0;
    *(unsigned char *)(a1 + 5_Block_object_dispose(&STACK[0x2B0], 8) = 0;
  }
  unint64_t v14 = *(void **)(a1 + 40);
  if (v14)
  {
    free(v14);
    *(void *)(a1 + 40) = 0;
  }

  return _NSLayoutNodeSetInvariants(a1);
}

double _NSLayoutTreeInsertNodeBeforeCurrentNode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = *(void *)(a1 + 240);
  if (!a2) {
    goto LABEL_27;
  }
  unint64_t v11 = *(void **)(v10 + 248);
  if (!v11) {
    goto LABEL_27;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v12 = a2;
  while (1)
  {
    uint64_t v13 = (void *)v11[2];
    if (!v13)
    {
      uint64_t v23 = malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
      v23[1] = 0;
      v23[3] = v12;
      v23[4] = v11;
      *(void *)(v12 + 16) = v23;
      v11[2] = v23;
      _NSLayoutNodeSetInvariants((uint64_t)v23);
      *(void *)(*(void *)(a1 + 240) + 240) = v23;
      goto LABEL_26;
    }
    unint64_t v14 = 0;
    while (1)
    {
      uint64_t v15 = (void *)v13[v14 + 3];
      if (!v15) {
        break;
      }
      if (v11 == v15)
      {
        uint64_t v15 = v11;
        break;
      }
      if (++v14 == 3)
      {
        uint64_t v15 = 0;
        break;
      }
    }
    if (v11 != v15)
    {
      _NSLayoutTreeLogDebug((NSString *)@"!!! _NSLayoutTreeInsertNodeBeforeCurrentNode found broken link", a2, a3, a4, a5, a6, a7, a8, v27);
      uint64_t v13 = v11;
      uint64_t v16 = (void *)v12;
      goto LABEL_20;
    }
    if (!v13[5]) {
      break;
    }
    uint64_t v17 = malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
    uint64_t v16 = v17;
    uint64_t v18 = 0;
    v17[1] = 0;
    do
    {
      *(void *)((char *)&v27 + v18 * _Block_object_dispose(&STACK[0x2B0], 8) = v13[v18 + 3];
      v13[v18 + 3] = 0;
      ++v18;
    }
    while (v18 != 3);
    if (v14 <= 2)
    {
      uint64_t v19 = 0;
      do
      {
        *((void *)&v28 + v19 + 1) = *((void *)&v27 + v19 + 2);
        unint64_t v20 = v19 + 2;
        --v19;
      }
      while (v20 > v14);
    }
    *((void *)&v27 + v14) = v12;
    long long v21 = v27;
    v17[3] = v27;
    *(void *)(v21 + 16) = v17;
    v17[4] = *((void *)&v21 + 1);
    *(void *)(*((void *)&v21 + 1) + 16) = v17;
    _NSLayoutNodeSetInvariants((uint64_t)v17);
    long long v22 = v28;
    v13[3] = v28;
    *(void *)(v22 + 16) = v13;
    v13[4] = *((void *)&v22 + 1);
    *(void *)(*((void *)&v22 + 1) + 16) = v13;
    _NSLayoutNodeSetInvariants((uint64_t)v13);
    if (!v16) {
      goto LABEL_26;
    }
LABEL_20:
    uint64_t v12 = (uint64_t)v16;
    unint64_t v11 = v13;
  }
  if (v14 <= 1)
  {
    uint64_t v24 = 0;
    do
    {
      v13[v24 + 5] = v13[v24 + 4];
      unint64_t v25 = v24-- + 1;
    }
    while (v25 > v14);
  }
  v13[v14 + 3] = v12;
  *(void *)(v12 + 16) = v13;
  _NSLayoutNodeSetInvariants((uint64_t)v13);
LABEL_26:
  uint64_t v10 = *(void *)(a1 + 240);
LABEL_27:
  *(void *)(v10 + 256) += *(void *)a2;
  double result = *(double *)(a2 + 8) + *(double *)(*(void *)(a1 + 240) + 264);
  *(double *)(*(void *)(a1 + 240) + 264) = result;
  return result;
}

void _NSLayoutTreeSetLineFragmentRectForGlyphRange(uint64_t a1, unint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (!a3) {
    return;
  }
  if (!_NSLayoutTreeMoveToGlyphIndex(a1, a2)
    || (unint64_t v35 = a2 + a3,
        uint64_t v36 = *(void *)(a1 + 240),
        uint64_t v37 = *(void *)(v36 + 248),
        unint64_t v38 = *(void *)(v36 + 256),
        unint64_t v29 = *(void *)v37,
        unint64_t v39 = *(void *)v37 + v38,
        v39 < a2 + a3))
  {
    unint64_t v40 = @"!!! _NSLayoutTreeSetLineFragmentRectForGlyphRange invalid glyph range";
    goto LABEL_5;
  }
  uint64_t v41 = *(void **)(v37 + 24);
  if (v41)
  {
    unint64_t v42 = 0;
    double v43 = *(double *)(v36 + 264);
    unint64_t v32 = a2 - v38;
    uint64_t v44 = v41 + 4;
    unint64_t v45 = *v41 - 1;
    while (1)
    {
      unint64_t v46 = (v42 + v45) >> 1;
      unint64_t v47 = v44[10 * v46] & 0x8FFFFFFFFFFFFFFFLL;
      if (v47 <= v32)
      {
        unint64_t v42 = v46 + 1;
        if (v46 + 1 >= *v41)
        {
          unint64_t v48 = *(void *)v37;
LABEL_40:
          unint64_t v81 = v48 - v47;
          if (a2 != v47 + v38 || a3 != v81)
          {
            unint64_t v40 = @"!!! _NSLayoutTreeSetLineFragmentRectForGlyphRange does not match existing range";
            goto LABEL_5;
          }
          unint64_t v83 = (double *)&v44[10 * v46];
          double v116 = v83[9];
          double v119 = v43 + v83[7];
          unint64_t __src = a2 - v38;
          uint64_t v121 = 0;
          *(double *)&long long v127 = a6;
          *((double *)&v127 + 1) = a7;
          double v125 = a4;
          double v126 = a5 - v43;
          *(double *)&long long v124 = a10;
          *((double *)&v124 + 1) = a11;
          double v122 = a8;
          double v123 = a9 - v43;
          *(void *)(*(void *)(*(void *)(a1 + 240) + 248) + 24) = _NSGlyphRangeListSet(v41, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedFragmentCapacity, v29, 32, 0x50uLL, v32, a3, &__src);
          uint64_t v84 = *(void *)(a1 + 240) + 240;
          double v85 = a5 + a7;
          double v86 = v119 + v116 - (a5 + a7);
          uint64_t v87 = *(void *)(*(void *)(a1 + 240) + 248);
          uint64_t v88 = *(void *)(*(void *)(a1 + 240) + 256);
          unint64_t v89 = *(void *)v87;
          if (v35 >= *(void *)v87 + v88 || v85 == v119 + v116) {
            goto LABEL_58;
          }
LABEL_49:
          unint64_t v91 = 0;
          uint64_t v92 = *(void **)(v87 + 24);
          double v93 = *(double *)(v84 + 24);
          unint64_t v94 = v35 - v88;
          uint64_t v95 = v92 + 4;
          unint64_t v96 = *v92 - 1;
          while (1)
          {
            unint64_t v97 = (v91 + v96) >> 1;
            unint64_t v98 = v95[10 * v97] & 0x8FFFFFFFFFFFFFFFLL;
            if (v98 <= v94)
            {
              unint64_t v91 = v97 + 1;
              if (v97 + 1 >= *v92)
              {
                unint64_t v99 = v89;
LABEL_57:
                NSPoint v100 = (double *)&v95[10 * v97];
                double v101 = v100[6];
                double v102 = v100[2];
                double v103 = v93 + v100[3] - v86;
                double v104 = v93 + v100[7] - v86 - v93;
                long long v105 = *((_OWORD *)v100 + 2);
                long long v106 = *((_OWORD *)v100 + 4);
                unint64_t __src = v98;
                uint64_t v121 = 0;
                long long v127 = v106;
                double v125 = v101;
                double v126 = v104;
                long long v124 = v105;
                double v122 = v102;
                double v123 = v103 - v93;
                *(void *)(*(void *)(*(void *)(a1 + 240) + 248) + 24) = _NSGlyphRangeListSet(v92, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedFragmentCapacity, v89, 32, 0x50uLL, v98, v99 - v98, &__src);
                unint64_t v35 = v99 + v88;
                uint64_t v84 = *(void *)(a1 + 240) + 240;
                uint64_t v87 = *(void *)(*(void *)(a1 + 240) + 248);
                uint64_t v88 = *(void *)(*(void *)(a1 + 240) + 256);
                unint64_t v89 = *(void *)v87;
                if (v35 >= *(void *)v87 + v88)
                {
LABEL_58:
                  *(double *)(v87 + _Block_object_dispose(&STACK[0x2B0], 8) = *(double *)(v87 + 8) - v86;
                  _NSLayoutNodeSetInvariants(*(void *)(*(void *)(a1 + 240) + 248));
                  return;
                }
                goto LABEL_49;
              }
              if ((v95[10 * v91] & 0x8FFFFFFFFFFFFFFFLL) > v94) {
                goto LABEL_55;
              }
            }
            else
            {
              unint64_t v96 = v97 - 1;
            }
            if (v96 < v91)
            {
LABEL_55:
              unint64_t v99 = v95[10 * v97 + 10] & 0x8FFFFFFFFFFFFFFFLL;
              goto LABEL_57;
            }
          }
        }
        if ((v44[10 * v42] & 0x8FFFFFFFFFFFFFFFLL) > v32) {
          goto LABEL_15;
        }
      }
      else
      {
        unint64_t v45 = v46 - 1;
      }
      if (v45 < v42)
      {
LABEL_15:
        unint64_t v48 = v44[10 * v46 + 10] & 0x8FFFFFFFFFFFFFFFLL;
        goto LABEL_40;
      }
    }
  }
  if (a2 > v38)
  {
    if (v39 > v35)
    {
      Leaf = _NSLayoutNodeCreateLeaf(v39 - v35, *(void *)(v36 + 336), *(double *)(v36 + 344));
      _NSLayoutTreeInsertNodeAfterCurrentNode(a1, (uint64_t)Leaf, v50, v51, v52, v53, v54, v55);
      uint64_t v36 = *(void *)(a1 + 240);
      uint64_t v37 = *(void *)(v36 + 248);
      unint64_t v38 = *(void *)(v36 + 256);
    }
    uint64_t v56 = v36 + 240;
    uint64_t v57 = a2 - v38;
    unint64_t v115 = *(void *)(v56 + 96);
    double v117 = *(double *)(v56 + 104);
    if (!*(unsigned char *)(v37 + 59))
    {
      uint64_t v58 = 0;
      uint64_t v59 = v37 + 24;
      do
      {
        uint64_t v60 = *(void *)(v59 + v58);
        if (v60)
        {
          _NSLayoutNodeFree(v60);
          *(void *)(v59 + v5_Block_object_dispose(&STACK[0x2B0], 8) = 0;
        }
        v58 += 8;
      }
      while (v58 != 24);
    }
    *(unsigned char *)(v37 + 59) = 1;
    *(void *)uint64_t v37 = v57;
    unint64_t v61 = v57 - 1;
    if (!v57) {
      unint64_t v61 = 0;
    }
    *(double *)(v37 + _Block_object_dispose(&STACK[0x2B0], 8) = v117 * (double)(v61 / v115 + 1);
    *(unsigned char *)(v37 + 56) = a2 != v38;
    unint64_t v62 = *(void **)(v37 + 24);
    if (v62)
    {
      free(v62);
      *(void *)(v37 + 24) = 0;
    }
    double v63 = *(void **)(v37 + 32);
    if (v63)
    {
      free(v63);
      *(void *)(v37 + 32) = 0;
      *(unsigned char *)(v37 + 5_Block_object_dispose(&STACK[0x2B0], 8) = 0;
    }
    unint64_t v64 = *(void **)(v37 + 40);
    if (v64)
    {
      free(v64);
      *(void *)(v37 + 40) = 0;
    }
    _NSLayoutNodeSetInvariants(v37);
    unint64_t v65 = *(void *)(*(void *)(a1 + 240) + 336);
    double v118 = *(double *)(*(void *)(a1 + 240) + 344);
    uint64_t v66 = (double *)malloc_type_calloc(1uLL, 0x40uLL, 0x10A2040487CA78AuLL);
    uint64_t v73 = (uint64_t)v66;
    *((unsigned char *)v66 + 59) = 1;
    *(void *)uint64_t v66 = a3;
    v66[1] = v118 * (double)((a3 - 1) / v65 + 1);
    *((unsigned char *)v66 + 56) = 1;
LABEL_33:
    _NSLayoutNodeSetLineFragment((uint64_t)v66, a3, *(double *)(*(void *)(a1 + 240) + 264) + *(double *)(*(void *)(*(void *)(a1 + 240) + 248) + 8), a4, a5, a6, a7, v67, v68, v69, v70, v71, v72, *(uint64_t *)&a8, *(uint64_t *)&a9, *(uint64_t *)&a10, *(uint64_t *)&a11);
    _NSLayoutTreeInsertNodeAfterCurrentNode(a1, v73, v74, v75, v76, v77, v78, v79);
    return;
  }
  if (a2)
  {
    uint64_t v80 = v39 - v35;
    if (v39 <= v35) {
      _NSLayoutTreeDeleteCurrentNode(a1, v80, v29, v30, v31, v32, v33, v34);
    }
    else {
      _NSLayoutNodeInvalidate(*(void *)(v36 + 248), v80, *(void *)(v36 + 336), *(double *)(v36 + 344));
    }
    if (_NSLayoutTreeMoveToGlyphIndex(a1, a2 - 1))
    {
      double v114 = *(void **)(*(void *)(a1 + 240) + 248);
      if (v114[3] && (unint64_t)(*v114 + a3) <= 0x2000)
      {
        _NSLayoutNodeAppendLineFragment((uint64_t)v114, a3, v29, v30, v31, v32, v33, v34, *(double *)(*(void *)(a1 + 240) + 264), a4, a5, a6, a7, *(uint64_t *)&a8, *(uint64_t *)&a9, *(uint64_t *)&a10, *(uint64_t *)&a11);
        return;
      }
      uint64_t v66 = _NSLayoutNodeCreateLeaf(a3, *(void *)(*(void *)(a1 + 240) + 336), *(double *)(*(void *)(a1 + 240) + 344));
      uint64_t v73 = (uint64_t)v66;
      goto LABEL_33;
    }
    unint64_t v40 = @"!!! _NSLayoutTreeSetLineFragmentRectForGlyphRange found invalid glyph index";
LABEL_5:
    _NSLayoutTreeLogDebug((NSString *)v40, v28, v29, v30, v31, v32, v33, v34, a17);
  }
  else
  {
    if (v39 > v35)
    {
      uint64_t v107 = _NSLayoutNodeCreateLeaf(v39 - v35, *(void *)(v36 + 336), *(double *)(v36 + 344));
      _NSLayoutTreeInsertNodeAfterCurrentNode(a1, (uint64_t)v107, v108, v109, v110, v111, v112, v113);
      uint64_t v36 = *(void *)(a1 + 240);
      uint64_t v37 = *(void *)(v36 + 248);
    }
    _NSLayoutNodeSetLineFragment(v37, a3, *(double *)(v36 + 264), a4, a5, a6, a7, v29, v30, v31, v32, v33, v34, *(uint64_t *)&a8, *(uint64_t *)&a9, *(uint64_t *)&a10, *(uint64_t *)&a11);
  }
}

uint64_t _NSLayoutNodeSetInvariants(uint64_t result)
{
  for (; result; double result = *(void *)(result + 16))
  {
    if (!*(unsigned char *)(result + 59))
    {
      char v1 = 0;
      uint64_t v2 = 0;
      double v3 = 0.0;
      for (uint64_t i = 24; i != 48; i += 8)
      {
        uint64_t v5 = *(void *)(result + i);
        if (v5)
        {
          v2 += *(void *)v5;
          double v3 = v3 + *(double *)(v5 + 8);
          v1 |= *(unsigned char *)(v5 + 56);
        }
      }
      *(void *)double result = v2;
      *(double *)(result + _Block_object_dispose(&STACK[0x2B0], 8) = v3;
      *(unsigned char *)(result + 56) = v1;
    }
  }
  return result;
}

uint64_t _NSLayoutNodeSetLineFragment(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v24 = *(void **)(a1 + 24);
  if (v24)
  {
    free(v24);
    *(void *)(a1 + 24) = 0;
  }
  unint64_t v25 = *(void **)(a1 + 32);
  if (v25)
  {
    free(v25);
    *(void *)(a1 + 32) = 0;
    *(unsigned char *)(a1 + 5_Block_object_dispose(&STACK[0x2B0], 8) = 0;
  }
  uint64_t v26 = *(void **)(a1 + 40);
  if (v26)
  {
    free(v26);
    *(void *)(a1 + 40) = 0;
  }
  *(void *)a1 = a2;
  *(unsigned char *)(a1 + 56) = 2;
  unint64_t v27 = *MEMORY[0x1E4F14B00] >> 3;
  if (v27 >= 0x2000) {
    unint64_t v27 = 0x2000;
  }
  if (v27 <= 1) {
    unint64_t v27 = 1;
  }
  if (*MEMORY[0x1E4F14B00] >= 0x10uLL) {
    unint64_t v28 = 16;
  }
  else {
    unint64_t v28 = v27;
  }
  size_t v29 = 80 * v28 + 32;
  uint64_t v30 = *(unint64_t **)(a1 + 24);
  if (v30)
  {
    unint64_t v31 = *v30;
    unint64_t v32 = (char *)malloc_type_realloc(v30, v29, 0xFBC9DBC4uLL);
    *(void *)(a1 + 24) = v32;
    if (v28 > v31) {
      bzero(&v32[80 * v31 + 32], 80 * (v28 - v31));
    }
  }
  else
  {
    uint64_t v33 = malloc_type_calloc(1uLL, v29, 0x70A7E097uLL);
    *(void *)(a1 + 24) = v33;
    v33[1] = *MEMORY[0x1E4F28AE0];
  }
  *(void *)(*(void *)(a1 + 24) + _Block_object_dispose(&STACK[0x2B0], 8) = v28;
  **(void **)(a1 + 24) = 1;
  *(void *)(*(void *)(a1 + 24) + 32) = 0;
  *(void *)(*(void *)(a1 + 24) + 40) = 0;
  uint64_t v34 = *(double **)(a1 + 24);
  v34[10] = a4;
  v34[11] = a5;
  v34[12] = a6;
  v34[13] = a7;
  unint64_t v35 = *(void **)(a1 + 24);
  v35[6] = a14;
  v35[7] = a15;
  v35[8] = a16;
  v35[9] = a17;
  *(double *)(*(void *)(a1 + 24) + 8_Block_object_dispose(&STACK[0x2B0], 8) = *(double *)(*(void *)(a1 + 24) + 88) - a3;
  *(double *)(*(void *)(a1 + 24) + 56) = *(double *)(*(void *)(a1 + 24) + 56) - a3;
  *(double *)(a1 + _Block_object_dispose(&STACK[0x2B0], 8) = a5 + a7 - a3;

  return _NSLayoutNodeSetInvariants(a1);
}

uint64_t _NSLayoutNodeAppendLineFragment(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8, double a9, double a10, double a11, double a12, double a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  unint64_t v22 = *(void *)a1;
  unint64_t v23 = *(void *)a1 + a2;
  *(void *)a1 = v23;
  uint64_t v24 = *(void **)(a1 + 24);
  unint64_t v38 = v22;
  *(void *)&long long v39 = 0;
  double v45 = a12;
  double v46 = a13;
  double v43 = a10;
  double v44 = a11 - a9;
  uint64_t v41 = a16;
  uint64_t v42 = a17;
  *((void *)&v39 + 1) = a14;
  double v40 = *(double *)&a15 - a9;
  *(void *)(a1 + 24) = _NSGlyphRangeListSet(v24, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedFragmentCapacity, v23, 32, 0x50uLL, v22, a2, &v38);
  unint64_t v25 = *(void **)(a1 + 32);
  if (v25)
  {
    int v26 = *(unsigned __int8 *)(a1 + 58);
    long long v27 = *MEMORY[0x1E4F28AD0];
    unint64_t v47 = 0;
    uint64_t v48 = 0;
    unint64_t v38 = 0;
    long long v39 = 0uLL;
    if (v26 == 1)
    {
      unint64_t v38 = v22;
      long long v39 = v27;
      unint64_t v28 = &v38;
    }
    else
    {
      unint64_t v28 = 0;
      if (!v26)
      {
        unint64_t v47 = v22;
        uint64_t v48 = v27;
        unint64_t v28 = &v47;
      }
    }
    uint64_t v29 = 24;
    if (v26 != 1) {
      uint64_t v29 = 0;
    }
    if (v26) {
      size_t v30 = v29;
    }
    else {
      size_t v30 = 16;
    }
    *(void *)(a1 + 32) = _NSGlyphRangeListSet(v25, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedLocationCapacity, v23, 16, v30, v22, a2, v28);
  }
  unint64_t v31 = *(void **)(a1 + 40);
  if (v31)
  {
    unint64_t v38 = v22;
    __asm { FMOV            V0.2D, #-1.0 }
    long long v39 = _Q0;
    *(void *)(a1 + 40) = _NSGlyphRangeListSet(v31, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedAttachmentSizeCapacity, v23, 16, 0x18uLL, v22, a2, &v38);
  }
  *(double *)(a1 + _Block_object_dispose(&STACK[0x2B0], 8) = a11 + a13 - a9;
  return _NSLayoutNodeSetInvariants(a1);
}

void _NSLayoutTreeSetLocationForGlyphRange(uint64_t a1, unint64_t a2, uint64_t a3, double a4, double a5)
{
  if (a3)
  {
    if (_NSLayoutTreeMoveToGlyphIndex(a1, a2)
      && (uint64_t v17 = *(void *)(*(void *)(a1 + 240) + 248),
          uint64_t v18 = *(void *)(*(void *)(a1 + 240) + 256),
          unint64_t v11 = *(void *)v17,
          a2 + a3 <= *(void *)v17 + v18))
    {
      uint64_t v19 = *(void **)(v17 + 32);
      if (!v19)
      {
        *(unsigned char *)(v17 + 56) |= 4u;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 240) + 248) + 5_Block_object_dispose(&STACK[0x2B0], 8) = 1;
        uint64_t v20 = *(void *)(*(void *)(a1 + 240) + 248);
        unint64_t v21 = *MEMORY[0x1E4F14B00] >> 3;
        if (v21 >= 0x2000) {
          unint64_t v21 = 0x2000;
        }
        if (v21 <= 1) {
          unint64_t v21 = 1;
        }
        if (*MEMORY[0x1E4F14B00] >= 0x10uLL) {
          unint64_t v22 = 16;
        }
        else {
          unint64_t v22 = v21;
        }
        uint64_t v23 = 24;
        if (*(unsigned char *)(v20 + 58) != 1) {
          uint64_t v23 = 0;
        }
        if (*(unsigned char *)(v20 + 58)) {
          uint64_t v24 = v23;
        }
        else {
          uint64_t v24 = 16;
        }
        size_t v25 = v22 * v24 + 16;
        int v26 = *(unint64_t **)(v20 + 32);
        if (v26)
        {
          unint64_t v27 = *v26;
          unint64_t v28 = malloc_type_realloc(v26, v25, 0xE24B4C6BuLL);
          *(void *)(v20 + 32) = v28;
          if (v22 > v27)
          {
            bzero((char *)v28 + v27 * v24 + 16, (v22 - v27) * v24);
            unint64_t v28 = *(void **)(v20 + 32);
          }
        }
        else
        {
          unint64_t v28 = malloc_type_calloc(1uLL, v25, 0x4FAA93BuLL);
          *(void *)(v20 + 32) = v28;
        }
        v28[1] = v22;
        **(void **)(*(void *)(*(void *)(a1 + 240) + 248) + 32) = 1;
        *(void *)(*(void *)(*(void *)(*(void *)(a1 + 240) + 248) + 32) + 16) = 0;
        *(_OWORD *)(*(void *)(*(void *)(*(void *)(a1 + 240) + 248) + 32) + 24) = *MEMORY[0x1E4F28AD0];
        _NSLayoutNodeSetInvariants(*(void *)(*(void *)(a1 + 240) + 248));
        uint64_t v17 = *(void *)(*(void *)(a1 + 240) + 248);
        uint64_t v18 = *(void *)(*(void *)(a1 + 240) + 256);
        uint64_t v19 = *(void **)(v17 + 32);
        unint64_t v11 = *(void *)v17;
      }
      int v29 = *(unsigned __int8 *)(v17 + 58);
      unint64_t v30 = a2 - v18;
      uint64_t v37 = 0;
      double v38 = 0.0;
      uint64_t __src = 0;
      double v35 = 0.0;
      double v36 = 0.0;
      if (v29 == 1)
      {
        uint64_t __src = a2 - v18;
        p_src = &__src;
        double v35 = a4;
        double v36 = a5;
      }
      else
      {
        p_src = 0;
        if (!v29)
        {
          uint64_t v37 = a2 - v18;
          double v38 = a4;
          p_src = &v37;
        }
      }
      uint64_t v32 = 24;
      if (v29 != 1) {
        uint64_t v32 = 0;
      }
      if (v29) {
        size_t v33 = v32;
      }
      else {
        size_t v33 = 16;
      }
      *(void *)(*(void *)(*(void *)(a1 + 240) + 248) + 32) = _NSGlyphRangeListSet(v19, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedLocationCapacity, v11, 16, v33, v30, a3, p_src);
    }
    else
    {
      _NSLayoutTreeLogDebug((NSString *)@"!!! _NSLayoutTreeSetLocationForGlyphRange invalid glyph range {%lu, %lu}", v10, v11, v12, v13, v14, v15, v16, a2);
    }
  }
}

void _NSLayoutTreeSetAttachmentSizeForGlyphRange(uint64_t a1, unint64_t a2, uint64_t a3, double a4, double a5)
{
  if (a3)
  {
    if (_NSLayoutTreeMoveToGlyphIndex(a1, a2)
      && (uint64_t v18 = *(unint64_t **)(*(void *)(a1 + 240) + 248),
          uint64_t v17 = *(void *)(*(void *)(a1 + 240) + 256),
          unint64_t v11 = *v18,
          a2 + a3 <= *v18 + v17))
    {
      uint64_t v19 = (void *)v18[5];
      if (!v19)
      {
        unint64_t v20 = *MEMORY[0x1E4F14B00] >> 3;
        if (v20 >= 0x2000) {
          unint64_t v20 = 0x2000;
        }
        if (v20 <= 1) {
          unint64_t v20 = 1;
        }
        if (*MEMORY[0x1E4F14B00] >= 0x10uLL) {
          uint64_t v21 = 16;
        }
        else {
          uint64_t v21 = v20;
        }
        unint64_t v22 = malloc_type_calloc(1uLL, 24 * v21 + 16, 0xF93562B6uLL);
        v18[5] = (unint64_t)v22;
        v22[1] = v21;
        **(void **)(*(void *)(*(void *)(a1 + 240) + 248) + 40) = 1;
        *(void *)(*(void *)(*(void *)(*(void *)(a1 + 240) + 248) + 40) + 16) = 0;
        __asm { FMOV            V0.2D, #-1.0 }
        *(_OWORD *)(*(void *)(*(void *)(*(void *)(a1 + 240) + 248) + 40) + 24) = _Q0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 240) + 248) + 56) |= 8u;
        _NSLayoutNodeSetInvariants(*(void *)(*(void *)(a1 + 240) + 248));
        unint64_t v28 = *(unint64_t **)(*(void *)(a1 + 240) + 248);
        uint64_t v17 = *(void *)(*(void *)(a1 + 240) + 256);
        uint64_t v19 = (void *)v28[5];
        unint64_t v11 = *v28;
      }
      __src[0] = a2 - v17;
      *(double *)&__src[1] = a4;
      *(double *)&__src[2] = a5;
      *(void *)(*(void *)(*(void *)(a1 + 240) + 248) + 40) = _NSGlyphRangeListSet(v19, (uint64_t (*)(unint64_t))_NSLayoutNodeSuggestedAttachmentSizeCapacity, v11, 16, 0x18uLL, a2 - v17, a3, __src);
    }
    else
    {
      _NSLayoutTreeLogDebug((NSString *)@"!!! _NSLayoutTreeSetAttachmentSizeForGlyphRange invalid glyph range {%lu, %lu}", v10, v11, v12, v13, v14, v15, v16, a2);
    }
  }
}

void _NSLayoutTreeSetLineFragmentDrawsOutsideLineAtGlyphIndex(uint64_t a1, unint64_t a2)
{
  if (!_NSLayoutTreeMoveToGlyphIndex(a1, a2)
    || (unint64_t v11 = *(unint64_t **)(*(void *)(*(void *)(a1 + 240) + 248) + 24)) == 0)
  {
    _NSLayoutTreeLogDebug((NSString *)@"!!! _NSLayoutTreeSetLineFragmentDrawsOutsideLineAtGlyphIndex invalid glyph index %lu", v4, v5, v6, v7, v8, v9, v10, a2);
    return;
  }
  unint64_t v12 = 0;
  unint64_t v13 = a2 - *(void *)(*(void *)(a1 + 240) + 256);
  unint64_t v16 = *v11;
  uint64_t v14 = v11 + 4;
  unint64_t v15 = v16;
  unint64_t v17 = v16 - 1;
  unint64_t v18 = v16 - 1;
  while (1)
  {
    unint64_t v19 = (v12 + v18) >> 1;
    uint64_t v20 = v14[10 * v19];
    if ((v20 & 0x8FFFFFFFFFFFFFFFLL) <= v13) {
      break;
    }
    unint64_t v18 = v19 - 1;
LABEL_8:
    if (v18 < v12) {
      goto LABEL_9;
    }
  }
  unint64_t v12 = v19 + 1;
  if (v19 + 1 < v15 && (v14[10 * v12] & 0x8FFFFFFFFFFFFFFFLL) <= v13) {
    goto LABEL_8;
  }
LABEL_9:
  if ((v20 & 0x1000000000000000) != 0) {
    return;
  }
  unint64_t v21 = 0;
  while (2)
  {
    unint64_t v22 = (v21 + v17) >> 1;
    unint64_t v23 = v14[10 * v22] & 0x8FFFFFFFFFFFFFFFLL;
    if (v23 > v13)
    {
      unint64_t v17 = v22 - 1;
      goto LABEL_15;
    }
    unint64_t v21 = v22 + 1;
    if (v22 + 1 < v15 && (v14[10 * v21] & 0x8FFFFFFFFFFFFFFFLL) <= v13)
    {
LABEL_15:
      if (v17 < v21) {
        break;
      }
      continue;
    }
    break;
  }
  v14[10 * v22] = v20 & 0xE000000000000000 | v23 | 0x1000000000000000;
  uint64_t v24 = *(void *)(*(void *)(a1 + 240) + 248);
  if ((*(unsigned char *)(v24 + 56) & 0x10) == 0)
  {
    *(unsigned char *)(v24 + 56) |= 0x10u;
    uint64_t v25 = *(void *)(*(void *)(a1 + 240) + 248);
    _NSLayoutNodeSetInvariants(v25);
  }
}

void _NSLayoutTreeSetOutsideDrawsUponLineFragmentAtGlyphIndex(uint64_t a1, unint64_t a2)
{
  if (!_NSLayoutTreeMoveToGlyphIndex(a1, a2)
    || (unint64_t v11 = *(unint64_t **)(*(void *)(*(void *)(a1 + 240) + 248) + 24)) == 0)
  {
    _NSLayoutTreeLogDebug((NSString *)@"!!! _NSLayoutTreeSetOutsideDrawsUponLineFragmentAtGlyphIndex invalid glyph index %lu", v4, v5, v6, v7, v8, v9, v10, a2);
    return;
  }
  unint64_t v12 = 0;
  unint64_t v13 = a2 - *(void *)(*(void *)(a1 + 240) + 256);
  unint64_t v16 = *v11;
  uint64_t v14 = v11 + 4;
  unint64_t v15 = v16;
  unint64_t v17 = v16 - 1;
  unint64_t v18 = v16 - 1;
  while (1)
  {
    unint64_t v19 = (v12 + v18) >> 1;
    uint64_t v20 = v14[10 * v19];
    if ((v20 & 0x8FFFFFFFFFFFFFFFLL) <= v13) {
      break;
    }
    unint64_t v18 = v19 - 1;
LABEL_8:
    if (v18 < v12) {
      goto LABEL_9;
    }
  }
  unint64_t v12 = v19 + 1;
  if (v19 + 1 < v15 && (v14[10 * v12] & 0x8FFFFFFFFFFFFFFFLL) <= v13) {
    goto LABEL_8;
  }
LABEL_9:
  if ((v20 & 0x2000000000000000) != 0) {
    return;
  }
  unint64_t v21 = 0;
  while (2)
  {
    unint64_t v22 = (v21 + v17) >> 1;
    unint64_t v23 = v14[10 * v22] & 0x8FFFFFFFFFFFFFFFLL;
    if (v23 > v13)
    {
      unint64_t v17 = v22 - 1;
      goto LABEL_15;
    }
    unint64_t v21 = v22 + 1;
    if (v22 + 1 < v15 && (v14[10 * v21] & 0x8FFFFFFFFFFFFFFFLL) <= v13)
    {
LABEL_15:
      if (v17 < v21) {
        break;
      }
      continue;
    }
    break;
  }
  v14[10 * v22] = v20 & 0xD000000000000000 | v23 | 0x2000000000000000;
  uint64_t v24 = *(void *)(*(void *)(a1 + 240) + 248);
  if ((*(unsigned char *)(v24 + 56) & 0x20) == 0)
  {
    *(unsigned char *)(v24 + 56) |= 0x20u;
    uint64_t v25 = *(void *)(*(void *)(a1 + 240) + 248);
    _NSLayoutNodeSetInvariants(v25);
  }
}

unint64_t _NSLayoutTreeSetBlocksDependUponLineFragmentAtGlyphIndex(uint64_t a1, unint64_t a2)
{
  unint64_t result = _NSLayoutTreeMoveToGlyphIndex(a1, a2);
  if (!result) {
    return result;
  }
  uint64_t v5 = *(unint64_t **)(*(void *)(*(void *)(a1 + 240) + 248) + 24);
  if (!v5) {
    return result;
  }
  unint64_t v6 = 0;
  unint64_t v7 = a2 - *(void *)(*(void *)(a1 + 240) + 256);
  unint64_t v10 = *v5;
  uint64_t v8 = v5 + 4;
  unint64_t v9 = v10;
  unint64_t v11 = v10 - 1;
  unint64_t v12 = v10 - 1;
  while (1)
  {
    unint64_t result = (v6 + v12) >> 1;
    uint64_t v13 = v8[10 * result];
    if ((v13 & 0x8FFFFFFFFFFFFFFFLL) <= v7) {
      break;
    }
    unint64_t v12 = result - 1;
LABEL_8:
    if (v12 < v6) {
      goto LABEL_9;
    }
  }
  unint64_t v6 = result + 1;
  if (result + 1 < v9)
  {
    unint64_t result = v8[10 * v6] & 0x8FFFFFFFFFFFFFFFLL;
    if (result <= v7) {
      goto LABEL_8;
    }
  }
LABEL_9:
  if ((v13 & 0x4000000000000000) != 0) {
    return result;
  }
  unint64_t v14 = 0;
  while (2)
  {
    unint64_t v15 = (v14 + v11) >> 1;
    unint64_t result = v8[10 * v15] & 0x8FFFFFFFFFFFFFFFLL;
    if (result > v7)
    {
      unint64_t v11 = v15 - 1;
      goto LABEL_15;
    }
    unint64_t v14 = v15 + 1;
    if (v15 + 1 < v9 && (v8[10 * v14] & 0x8FFFFFFFFFFFFFFFLL) <= v7)
    {
LABEL_15:
      if (v11 < v14) {
        break;
      }
      continue;
    }
    break;
  }
  v8[10 * v15] = v13 & 0xB000000000000000 | result | 0x4000000000000000;
  uint64_t v16 = *(void *)(*(void *)(a1 + 240) + 248);
  if ((*(unsigned char *)(v16 + 56) & 0x40) == 0)
  {
    *(unsigned char *)(v16 + 56) |= 0x40u;
    uint64_t v17 = *(void *)(*(void *)(a1 + 240) + 248);
    return _NSLayoutNodeSetInvariants(v17);
  }
  return result;
}

double _NSLayoutTreeSetExtraLineFragmentRect(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  uint64_t v17 = *(void *)(a1 + 240);
  uint64_t v18 = **(void **)(v17 + 240);
  double v19 = 0.0;
  if (v18)
  {
    double v38 = a4;
    uint64_t v20 = v18 - 1;
    BOOL v21 = _NSLayoutTreeMoveToGlyphIndex(a1, v18 - 1);
    uint64_t v17 = *(void *)(a1 + 240);
    if (v21)
    {
      uint64_t v22 = *(void *)(v17 + 256);
      unint64_t v23 = *(unint64_t **)(*(void *)(v17 + 248) + 24);
      double v24 = *(double *)(v17 + 264);
      if (v23)
      {
        unint64_t v25 = 0;
        unint64_t v26 = v20 - v22;
        unint64_t v29 = *v23;
        unint64_t v27 = v23 + 4;
        unint64_t v28 = v29;
        unint64_t v30 = v29 - 1;
        while (1)
        {
          unint64_t v31 = (v25 + v30) >> 1;
          if ((v27[10 * v31] & 0x8FFFFFFFFFFFFFFFLL) <= v26)
          {
            unint64_t v25 = v31 + 1;
            if (v31 + 1 >= v28 || (v27[10 * v25] & 0x8FFFFFFFFFFFFFFFLL) > v26)
            {
LABEL_10:
              uint64_t v32 = (double *)&v27[10 * v31];
              double v33 = v32[9];
              double v34 = v24 + v32[7];
              goto LABEL_12;
            }
          }
          else
          {
            unint64_t v30 = v31 - 1;
          }
          if (v30 < v25) {
            goto LABEL_10;
          }
        }
      }
      double v33 = *(double *)(v17 + 344);
      double v34 = v24 + (double)((unint64_t)(v20 - v22) / *(void *)(v17 + 336)) * v33;
LABEL_12:
      double v19 = v34 + v33;
    }
    a4 = v38;
  }
  double v35 = (double *)(v17 + 240);
  v35[4] = a2;
  v35[5] = a3;
  v35[6] = a4;
  v35[7] = a5;
  double v36 = (double *)(*(void *)(a1 + 240) + 240);
  v36[8] = a6;
  v36[9] = a7;
  v36[10] = a8;
  v36[11] = a9;
  *(double *)(*(void *)(a1 + 240) + 280) = *(double *)(*(void *)(a1 + 240) + 280) - v19;
  double result = *(double *)(*(void *)(a1 + 240) + 312) - v19;
  *(double *)(*(void *)(a1 + 240) + 312) = result;
  return result;
}

void _NSLayoutTreeSetBaselineOffsetForGlyphAtIndex(uint64_t a1, unint64_t a2, double a3)
{
  if (_NSLayoutTreeMoveToGlyphIndex(a1, a2))
  {
    if (a3 != 0.0)
    {
      uint64_t v13 = *(unint64_t **)(*(void *)(*(void *)(a1 + 240) + 248) + 24);
      if (v13)
      {
        unint64_t v14 = 0;
        unint64_t v15 = a2 - *(void *)(*(void *)(a1 + 240) + 256);
        unint64_t v18 = *v13;
        uint64_t v16 = v13 + 4;
        unint64_t v17 = v18;
        unint64_t v19 = v18 - 1;
        while (1)
        {
          unint64_t v20 = (v14 + v19) >> 1;
          if ((v16[10 * v20] & 0x8FFFFFFFFFFFFFFFLL) <= v15)
          {
            unint64_t v14 = v20 + 1;
            if (v20 + 1 >= v17 || (v16[10 * v14] & 0x8FFFFFFFFFFFFFFFLL) > v15)
            {
LABEL_10:
              *(double *)&v16[10 * v20 + 1] = a3;
              return;
            }
          }
          else
          {
            unint64_t v19 = v20 - 1;
          }
          if (v19 < v14) {
            goto LABEL_10;
          }
        }
      }
    }
  }
  else
  {
    _NSLayoutTreeLogDebug((NSString *)@"!!! _NSLayoutTreeGetBaselineOffsetForGlyphAtIndex invalid glyph index %lu", v6, v7, v8, v9, v10, v11, v12, a2);
  }
}

void *_NSGlyphRangeListCreateSubRange(unint64_t *a1, uint64_t (*a2)(unint64_t), unint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  unint64_t v10 = 0;
  unint64_t v11 = *a1;
  uint64_t v12 = (char *)a1 + a4;
  unint64_t v13 = *a1 - 1;
  unint64_t v14 = v13;
  while (1)
  {
    unint64_t v15 = (v14 + v10) >> 1;
    unint64_t v16 = v15 * a5;
    if ((*(void *)&v12[v15 * a5] & 0x8FFFFFFFFFFFFFFFLL) <= a6) {
      break;
    }
    unint64_t v14 = v15 - 1;
LABEL_6:
    if (v14 < v10)
    {
      unint64_t v18 = &v12[v16];
      uint64_t v17 = a5 + a5 * v15;
      goto LABEL_10;
    }
  }
  unint64_t v10 = v15 + 1;
  if (v15 + 1 >= v11)
  {
    unint64_t v18 = &v12[v16];
    goto LABEL_11;
  }
  uint64_t v17 = v10 * a5;
  if ((*(void *)&v12[v10 * a5] & 0x8FFFFFFFFFFFFFFFLL) <= a6) {
    goto LABEL_6;
  }
  unint64_t v18 = &v12[v16];
LABEL_10:
  a3 = *(void *)&v12[v17] & 0x8FFFFFFFFFFFFFFFLL;
LABEL_11:
  unint64_t v19 = v15;
  if (a6 + a7 > a3)
  {
    unint64_t v20 = 0;
    unint64_t v21 = a6 + a7 - 1;
    do
    {
      unint64_t v19 = (v13 + v20) >> 1;
      if ((*(void *)&v12[v19 * a5] & 0x8FFFFFFFFFFFFFFFLL) <= v21)
      {
        unint64_t v20 = v19 + 1;
        if (v19 + 1 >= v11 || (*(void *)&v12[v20 * a5] & 0x8FFFFFFFFFFFFFFFLL) > v21) {
          break;
        }
      }
      else
      {
        unint64_t v13 = v19 - 1;
      }
    }
    while (v13 >= v20);
  }
  unint64_t v22 = v19 - v15;
  unint64_t v23 = v19 - v15 + 1;
  uint64_t v24 = a2(v23);
  unint64_t v25 = malloc_type_calloc(1uLL, a4 + v24 * a5, 0xCF99949DuLL);
  *unint64_t v25 = v23;
  v25[1] = v24;
  memmove((char *)v25 + a4, v18, v23 * a5);
  if (a6)
  {
    *(void *)((char *)v25 + a4) &= 0x7000000000000000uLL;
    if (v23 >= 2)
    {
      unint64_t v26 = (void *)((char *)v25 + a5 + a4);
      do
      {
        *unint64_t v26 = ((*v26 & 0x8FFFFFFFFFFFFFFFLL) - a6) & 0x8FFFFFFFFFFFFFFFLL | (((*v26 >> 60) & 7) << 60);
        unint64_t v26 = (unint64_t *)((char *)v26 + a5);
        --v22;
      }
      while (v22);
    }
  }
  return v25;
}

void *_NSGlyphRangeListTruncate(void *a1, uint64_t (*a2)(unint64_t), unint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  unint64_t v11 = a1;
  unint64_t v12 = 0;
  unint64_t v13 = *a1;
  uint64_t v14 = a1[1];
  unint64_t v15 = (void *)((char *)a1 + a4);
  unint64_t v16 = *a1 - 1;
  unint64_t v17 = v16;
  while (1)
  {
    unint64_t v18 = v17 + v12;
    unint64_t v19 = (v17 + v12) >> 1;
    unint64_t v20 = v19 * a5;
    if ((*(void *)((char *)v15 + v19 * a5) & 0x8FFFFFFFFFFFFFFFLL) <= a6) {
      break;
    }
    unint64_t v17 = v19 - 1;
LABEL_6:
    if (v17 < v12)
    {
      unint64_t v22 = (char *)v15 + v20;
      uint64_t v21 = a5 + a5 * v19;
      goto LABEL_10;
    }
  }
  unint64_t v12 = v19 + 1;
  if (v19 + 1 >= v13)
  {
    unint64_t v22 = (char *)v15 + v20;
    goto LABEL_11;
  }
  uint64_t v21 = v12 * a5;
  if ((*(void *)((char *)v15 + v12 * a5) & 0x8FFFFFFFFFFFFFFFLL) <= a6) {
    goto LABEL_6;
  }
  unint64_t v22 = (char *)v15 + v20;
LABEL_10:
  a3 = *(void *)((char *)v15 + v21) & 0x8FFFFFFFFFFFFFFFLL;
LABEL_11:
  unint64_t v23 = v19;
  if (a6 + a7 > a3)
  {
    unint64_t v24 = 0;
    unint64_t v25 = a6 + a7 - 1;
    do
    {
      unint64_t v23 = (v16 + v24) >> 1;
      if ((*(void *)((char *)v15 + v23 * a5) & 0x8FFFFFFFFFFFFFFFLL) <= v25)
      {
        unint64_t v24 = v23 + 1;
        if (v23 + 1 >= v13 || (*(void *)((char *)v15 + v24 * a5) & 0x8FFFFFFFFFFFFFFFLL) > v25) {
          break;
        }
      }
      else
      {
        unint64_t v16 = v23 - 1;
      }
    }
    while (v16 >= v24);
  }
  unint64_t v26 = v23 - v19;
  unint64_t v27 = v23 - v19 + 1;
  if (v27 < v13)
  {
    if (v18 >= 2) {
      memmove((char *)a1 + a4, v22, v27 * a5);
    }
    *unint64_t v11 = v27;
    uint64_t v28 = a2(v27);
    unint64_t v29 = v28;
    if (v28 != v14)
    {
      v11[1] = v28;
      unint64_t v11 = malloc_type_realloc(v11, a4 + v28 * a5, 0x7296AF6uLL);
      unint64_t v15 = (void *)((char *)v11 + a4);
    }
    if (v29 > v27) {
      bzero((char *)v15 + v27 * a5, (v29 - v27) * a5);
    }
  }
  if (a6)
  {
    *v15 &= 0x7000000000000000uLL;
    if (v27 >= 2)
    {
      unint64_t v30 = (void *)((char *)v15 + a5);
      do
      {
        *unint64_t v30 = ((*v30 & 0x8FFFFFFFFFFFFFFFLL) - a6) & 0x8FFFFFFFFFFFFFFFLL | (((*v30 >> 60) & 7) << 60);
        unint64_t v30 = (unint64_t *)((char *)v30 + a5);
        --v26;
      }
      while (v26);
    }
  }
  return v11;
}

void *_NSGlyphRangeListSet(void *a1, uint64_t (*a2)(unint64_t), unint64_t a3, uint64_t a4, size_t __len, unint64_t a6, uint64_t a7, void *__src)
{
  uint64_t v8 = a1;
  if (!a7) {
    return v8;
  }
  unint64_t v11 = 0;
  unint64_t v13 = *a1;
  unint64_t v12 = a1[1];
  uint64_t v14 = (char *)a1 + a4;
  unint64_t v15 = *a1 - 1;
  unint64_t v16 = v15;
  while (1)
  {
    unint64_t v17 = (v16 + v11) >> 1;
    unint64_t v18 = *(void *)&v14[v17 * __len] & 0x8FFFFFFFFFFFFFFFLL;
    if (v18 <= a6) {
      break;
    }
    unint64_t v16 = v17 - 1;
LABEL_7:
    if (v16 < v11)
    {
      size_t v19 = __len + __len * v17;
LABEL_9:
      char v20 = 0;
      unint64_t v21 = *(void *)&v14[v19] & 0x8FFFFFFFFFFFFFFFLL;
      goto LABEL_11;
    }
  }
  unint64_t v11 = v17 + 1;
  if (v17 + 1 < v13)
  {
    size_t v19 = v11 * __len;
    if ((*(void *)&v14[v11 * __len] & 0x8FFFFFFFFFFFFFFFLL) > a6) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  char v20 = 1;
  unint64_t v21 = a3;
LABEL_11:
  unint64_t v22 = a6 + a7;
  unint64_t v23 = v17;
  if (a6 + a7 > v21)
  {
    unint64_t v24 = 0;
    unint64_t v25 = v22 - 1;
    do
    {
      unint64_t v23 = (v15 + v24) >> 1;
      if ((*(void *)&v14[v23 * __len] & 0x8FFFFFFFFFFFFFFFLL) <= v25)
      {
        unint64_t v24 = v23 + 1;
        if (v23 + 1 >= v13) {
          goto LABEL_20;
        }
        if ((*(void *)&v14[v24 * __len] & 0x8FFFFFFFFFFFFFFFLL) > v25) {
          break;
        }
      }
      else
      {
        unint64_t v15 = v23 - 1;
      }
    }
    while (v15 >= v24);
  }
  if ((v20 & 1) == 0) {
    a3 = *(void *)&v14[__len + __len * v23] & 0x8FFFFFFFFFFFFFFFLL;
  }
LABEL_20:
  if (a6 <= v18) {
    unint64_t v26 = v17;
  }
  else {
    unint64_t v26 = v17 + 1;
  }
  if (v22 < a3) {
    unint64_t v27 = v23;
  }
  else {
    unint64_t v27 = v23 + 1;
  }
  if (v22 >= a3) {
    uint64_t v28 = v26 - v23;
  }
  else {
    uint64_t v28 = v26 - v23 + 1;
  }
  if (v28)
  {
    unint64_t v29 = v28 + v13;
    *a1 = v28 + v13;
    double v34 = __src;
    if (v28 + v13 <= v12)
    {
      unint64_t v33 = v12;
    }
    else
    {
      uint64_t v31 = a2(v28 + v13);
      v8[1] = v31;
      unint64_t v33 = v31;
      uint64_t v8 = malloc_type_realloc(v8, a4 + v31 * __len, 0xDFFEB160uLL);
      uint64_t v14 = (char *)v8 + a4;
    }
    if (v13 > v27) {
      memmove(&v14[(v27 + v28) * __len], &v14[v27 * __len], (v13 - v27) * __len);
    }
    if (v33 > v29) {
      bzero(&v14[v29 * __len], (v33 - v29) * __len);
    }
    uint64_t __src = v34;
  }
  else
  {
    unint64_t v29 = *a1;
  }
  memmove(&v14[v26 * __len], __src, __len);
  *(void *)&v14[v26 * __len] = a6 & 0x8FFFFFFFFFFFFFFFLL | (((*(void *)&v14[v26 * __len] >> 60) & 7) << 60);
  if (v26 + 1 < v29) {
    *(void *)&v14[(v26 + 1) * __len] = v22 & 0x8FFFFFFFFFFFFFFFLL | (((*(void *)&v14[(v26 + 1) * __len] >> 60) & 7) << 60);
  }
  return v8;
}

void sub_18E54490C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
}

void sub_18E544D40(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18E546594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18E546708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18E546A5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E546FDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E547048(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __NSGetCircledImage(uint64_t a1, double a2, double a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = ____NSGetCircledImage_block_invoke;
  v5[3] = &unk_1E55C5618;
  v5[4] = a1;
  *(double *)&v5[5] = a2;
  *(double *)&v5[6] = a3;
  softLinkUIGraphicsBeginImageContextWithOptions(0, a2 + 1.0, a3, 2.0);
  ____NSGetCircledImage_block_invoke((uint64_t)v5, (CGContext *)objc_msgSend((id)-[objc_class graphicsContextForApplicationFrameworkContext:](+[NSTextGraphicsContextProvider textGraphicsContextProviderClass](NSTextGraphicsContextProvider, "textGraphicsContextProviderClass"), "graphicsContextForApplicationFrameworkContext:", 1), "CGContext"));
  uint64_t ImageFromCurrentImageContext = softLinkUIGraphicsGetImageFromCurrentImageContext();
  softLinkUIGraphicsEndImageContext();
  return ImageFromCurrentImageContext;
}

uint64_t __NSGetColorForSpellingState(char a1)
{
  if (a1)
  {
    uint64_t v1 = &selRef_systemRedColor;
    goto LABEL_6;
  }
  if ((a1 & 2) == 0)
  {
    if ((a1 & 0x80) == 0) {
      return 0;
    }
    uint64_t v1 = &selRef_systemBlueColor;
LABEL_6:
    uint64_t v2 = *v1;
    if (*v1) {
      goto LABEL_7;
    }
    return 0;
  }
  uint64_t v2 = sel_textGrammarIndicatorColor;
  if (!sel_textGrammarIndicatorColor) {
    return 0;
  }
  getNSColorClass[0]();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v1 = &selRef_systemGreenColor;
    goto LABEL_6;
  }
LABEL_7:
  getNSColorClass[0]();
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  Class v3 = (Class)getNSColorClass[0]();

  return [(objc_class *)v3 performSelector:v2];
}

uint64_t _maxApplierFunction(uint64_t result, unint64_t a2, void *a3)
{
  unint64_t v3 = a3[1];
  if (v3 < a2 || v3 == a2 && *a3 > result)
  {
    *a3 = result;
    a3[1] = a2;
  }
  return result;
}

uint64_t initUIGraphicsBeginImageContextWithOptions(uint64_t a1, double a2, double a3, double a4)
{
  uint64_t v8 = (void *)__NSGetFrameworkReference(0, 0);
  uint64_t v9 = (uint64_t (*)())dlsym(v8, "UIGraphicsBeginImageContextWithOptions");
  softLinkUIGraphicsBeginImageContextWithOptions = v9;
  if (!v9) {
    initUIGraphicsBeginImageContextWithOptions_cold_1();
  }
  v10.n128_f64[0] = a2;
  v11.n128_f64[0] = a3;
  v12.n128_f64[0] = a4;

  return ((uint64_t (*)(uint64_t, __n128, __n128, __n128))v9)(a1, v10, v11, v12);
}

uint64_t initUIGraphicsGetImageFromCurrentImageContext()
{
  unint64_t v0 = (void *)__NSGetFrameworkReference(0, 0);
  uint64_t v1 = (uint64_t (*)())dlsym(v0, "UIGraphicsGetImageFromCurrentImageContext");
  softLinkUIGraphicsGetuint64_t ImageFromCurrentImageContext = v1;
  if (!v1) {
    initUIGraphicsGetImageFromCurrentImageContext_cold_1();
  }

  return v1();
}

uint64_t initUIGraphicsEndImageContext()
{
  unint64_t v0 = (void *)__NSGetFrameworkReference(0, 0);
  uint64_t v1 = (uint64_t (*)())dlsym(v0, "UIGraphicsEndImageContext");
  softLinkUIGraphicsEndImageContext = v1;
  if (!v1) {
    initUIGraphicsEndImageContext_cold_1();
  }

  return v1();
}

Class initNSColor()
{
  __NSGetFrameworkReference(0, 0);
  Class result = objc_getClass("NSColor");
  classNSColor = (uint64_t)result;
  if (!result) {
    initNSColor_cold_1();
  }
  getNSColorClass[0] = NSColorFunction;
  return result;
}

uint64_t NSColorFunction()
{
  return classNSColor;
}

double *lmProcessPathElement(double *result, uint64_t a2)
{
  switch(*(_DWORD *)a2)
  {
    case 0:
      int v2 = 0;
      *(_OWORD *)Class result = *(_OWORD *)*(void *)(a2 + 8);
      unint64_t v3 = result + 1;
      goto LABEL_9;
    case 1:
      uint64_t v4 = *(double **)(a2 + 8);
      unint64_t v3 = v4 + 1;
      goto LABEL_7;
    case 2:
      uint64_t v5 = *(void *)(a2 + 8);
      uint64_t v4 = (double *)(v5 + 16);
      unint64_t v3 = (double *)(v5 + 24);
      goto LABEL_7;
    case 3:
      uint64_t v6 = *(void *)(a2 + 8);
      uint64_t v4 = (double *)(v6 + 32);
      unint64_t v3 = (double *)(v6 + 40);
LABEL_7:
      int v2 = 1;
      break;
    case 4:
      unint64_t v3 = result + 1;
      int v2 = 1;
LABEL_9:
      uint64_t v4 = result;
      break;
    default:
      int v2 = 0;
      uint64_t v4 = (double *)MEMORY[0x1E4F1DAD8];
      unint64_t v3 = (double *)(MEMORY[0x1E4F1DAD8] + 8);
      break;
  }
  double v7 = *v4;
  double v8 = *v3;
  double v10 = result[4];
  double v9 = result[5];
  BOOL v11 = v10 < *v3 && v8 < v9;
  if (v11 || (v8 < v10 ? (BOOL v12 = v9 < v8) : (BOOL v12 = 0), v12))
  {
    if (v7 < result[6]) {
      result[6] = v7;
    }
    if (v7 > result[7]) {
      result[7] = v7;
    }
  }
  if (v2)
  {
    double v13 = result[2];
    double v14 = result[3];
    BOOL v15 = v10 < v8 && v14 < v10;
    if (v15 || (v8 < v10 ? (BOOL v16 = v14 <= v10) : (BOOL v16 = 1), !v16))
    {
      double v17 = v13 + (v7 - v13) * (v10 - v14) / (v8 - v14);
      double v18 = result[6];
      if (v18 >= v17) {
        double v18 = v17;
      }
      if (result[7] >= v17) {
        double v17 = result[7];
      }
      result[6] = v18;
      result[7] = v17;
    }
    BOOL v19 = v14 > v9;
    if (v8 >= v9) {
      BOOL v19 = 0;
    }
    if (v8 > v9 && v14 < v9 || v19)
    {
      double v22 = v13 + (v7 - v13) * (v9 - v14) / (v8 - v14);
      double v23 = result[6];
      if (v23 >= v22) {
        double v23 = v22;
      }
      if (result[7] >= v22) {
        double v22 = result[7];
      }
      result[6] = v23;
      result[7] = v22;
    }
  }
  result[2] = v7;
  result[3] = v8;
  return result;
}

unsigned char *_NSGlyphTreeCreate(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 8) length];
  Class result = malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
  result[59] = 1;
  *(void *)Class result = v2;
  *((void *)result + 1) = v2;
  result[56] = v2 != 0;
  *(void *)(*(void *)(a1 + 240) + 20_Block_object_dispose(&STACK[0x2B0], 8) = result;
  *(void *)(*(void *)(a1 + 240) + 216) = result;
  *(void *)(*(void *)(a1 + 240) + 232) = 0;
  *(void *)(*(void *)(a1 + 240) + 224) = 0;
  return result;
}

void _NSGlyphTreeFree(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 240) + 216) = 0;
  *(void *)(*(void *)(a1 + 240) + 20_Block_object_dispose(&STACK[0x2B0], 8) = 0;
}

void _NSGlyphNodeFree(unsigned char *a1)
{
  if (a1)
  {
    if (a1[59])
    {
      _NSGlyphNodeSetCapacity((uint64_t)a1, 0);
    }
    else
    {
      for (uint64_t i = 0; i != 24; i += 8)
      {
        if (*(void *)&a1[i + 24]) {
          _NSGlyphNodeFree();
        }
      }
    }
    free(a1);
  }
}

uint64_t _NSGlyphTreeSummaryDescription(uint64_t a1)
{
  uint64_t v9 = 0;
  uint64_t v1 = *(void *)(a1 + 240);
  unint64_t v8 = 0;
  uint64_t v2 = *(unint64_t **)(v1 + 208);
  _NSGlyphNodeCalculateMemoryUsage((uint64_t)v2, &v9, (uint64_t *)&v8);
  double v3 = 0.0;
  double v4 = 0.0;
  unint64_t v5 = *v2;
  if (*v2) {
    double v4 = (double)v8 / (double)v5;
  }
  unint64_t v6 = v2[1];
  if (v6) {
    double v3 = (double)v8 / (double)v6;
  }
  return [NSString stringWithFormat:@"Glyph tree contents:  %lu characters, %lu glyphs, %lu nodes, %lu node bytes, %lu storage bytes, %lu total bytes, %.2f bytes per character, %.2f bytes per glyph", v5, v6, v9, v9 << 6, v8 - (v9 << 6), v8, *(void *)&v4, *(void *)&v3];
}

void *_NSGlyphTreeDescription(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v3 = objc_opt_class();
  double v4 = (void *)[v2 stringWithFormat:@"<%@: %p>\n%@\n", v3, a1, _NSGlyphTreeSummaryDescription(a1)];
  unint64_t v5 = *(NSUInteger **)(*(void *)(a1 + 240) + 216);
  v8.NSUInteger location = *(void *)(*(void *)(a1 + 240) + 224);
  v8.NSUInteger length = *v5;
  unint64_t v6 = NSStringFromRange(v8);
  v9.NSUInteger location = *(void *)(*(void *)(a1 + 240) + 232);
  v9.NSUInteger length = *(void *)(*(void *)(*(void *)(a1 + 240) + 216) + 8);
  [v4 appendFormat:@"Current node %p char range %@ glyph range %@\nRoot ", v5, v6, NSStringFromRange(v9)];
  _NSGlyphNodeDescribe(*(void *)(*(void *)(a1 + 240) + 208), v4, 0);
  return v4;
}

uint64_t _NSGlyphNodeDescribe(uint64_t result, void *a2, uint64_t a3)
{
  if (!result) {
    return result;
  }
  uint64_t v3 = a3;
  uint64_t v5 = result;
  if (a3)
  {
    uint64_t v6 = a3;
    do
    {
      [a2 appendString:@"  "];
      --v6;
    }
    while (v6);
  }
  double v7 = (unsigned __int8 **)(v5 + 24);
  if (!*(unsigned char *)(v5 + 59))
  {
    for (uint64_t i = 0; i != 3; ++i)
    {
      if (!*(void *)(v5 + 8 * i + 24)) {
        break;
      }
    }
    [a2 appendFormat:@"Internal node %p with %lu chars, %lu glyphs, %lu children, flags 0x%x\n", v5, *(void *)v5, *(void *)(v5 + 8), i, *(unsigned __int8 *)(v5 + 56)];
    for (uint64_t j = 0; j != 3; ++j)
      Class result = _NSGlyphNodeDescribe(v7[j], a2, v3 + 1);
    return result;
  }
  uint64_t v8 = *(void *)v5;
  if (!*(void *)(v5 + 24)) {
    return [a2 appendFormat:@"Leaf node %p with %lu chars, %lu glyphs (not generated), flags 0x%x\n", v5, v8, *(void *)(v5 + 8), *(unsigned __int8 *)(v5 + 56)];
  }
  [a2 appendFormat:@"Leaf node %p with %lu chars, %lu glyphs, capacity %lu, flags 0x%x\n", v5, v8, *(void *)(v5 + 8), *(void *)(v5 + 48), *(unsigned __int8 *)(v5 + 56)];
  if (v3)
  {
    uint64_t v9 = v3;
    do
    {
      [a2 appendString:@"  "];
      --v9;
    }
    while (v9);
  }
  unint64_t v10 = *(char *)(v5 + 57);
  if (v10 > 3) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = qword_18E5F7310[v10];
  }
  double v14 = *v7;
  if (*v7)
  {
    switch(*(unsigned char *)(v5 + 57))
    {
      case 0:
        unsigned int v17 = *v14;
        if (v17 >= 4) {
          unsigned int v18 = *v14;
        }
        else {
          unsigned int v18 = 0xFFFFFF;
        }
        if (v17 <= 0xEF) {
          uint64_t v16 = v18;
        }
        else {
          uint64_t v16 = v17 & 3;
        }
        break;
      case 1:
        unsigned int v15 = *(unsigned __int16 *)v14;
        goto LABEL_31;
      case 2:
      case 3:
        unsigned int v15 = *(_DWORD *)v14;
LABEL_31:
        unsigned int v19 = v15 >> 8;
        BOOL v20 = v15 > 0xFF;
        LODWORD(v16) = ((char)v15 >> 7) & 0xFFFFFF;
        if (v20) {
          uint64_t v16 = v19;
        }
        else {
          uint64_t v16 = v16;
        }
        break;
      default:
        goto LABEL_23;
    }
  }
  else
  {
LABEL_23:
    uint64_t v16 = 0;
  }
  objc_msgSend(a2, "appendFormat:", @"  glyphs (%lu-byte) <%d", v11, v16);
  if (*(void *)(v5 + 8) < 2uLL) {
    goto LABEL_55;
  }
  unint64_t v21 = 1;
  uint64_t v22 = 24;
  do
  {
    double v23 = *v7;
    if (*v7)
    {
      switch(*(unsigned char *)(v5 + 57))
      {
        case 0:
          unsigned int v24 = v23[v21];
          if (v24 >= 4) {
            unsigned int v25 = v24;
          }
          else {
            unsigned int v25 = 0xFFFFFF;
          }
          if (v24 <= 0xEF) {
            double v23 = (unsigned __int8 *)v25;
          }
          else {
            double v23 = (unsigned __int8 *)(v24 & 3);
          }
          break;
        case 1:
          unsigned int v26 = *(unsigned __int16 *)&v23[2 * v21];
          goto LABEL_48;
        case 2:
          unsigned int v26 = *(_DWORD *)&v23[4 * v21];
          goto LABEL_48;
        case 3:
          unsigned int v26 = *(_DWORD *)&v23[v22];
LABEL_48:
          unsigned int v27 = v26 >> 8;
          BOOL v20 = v26 > 0xFF;
          LODWORD(v23) = ((char)v26 >> 7) & 0xFFFFFF;
          if (v20) {
            double v23 = (unsigned __int8 *)v27;
          }
          else {
            double v23 = (unsigned __int8 *)v23;
          }
          break;
        default:
          double v23 = 0;
          break;
      }
    }
    objc_msgSend(a2, "appendFormat:", @" %d", v23);
    unint64_t v28 = *(void *)(v5 + 8);
    if (v21 > 0xFE) {
      break;
    }
    ++v21;
    v22 += 24;
  }
  while (v21 < v28);
  if (v28 <= 0x100) {
LABEL_55:
  }
    unint64_t v29 = @">\n";
  else {
    unint64_t v29 = @"...>\n";
  }
  Class result = [a2 appendString:v29];
  if (*(void *)(v5 + 32))
  {
    for (; v3; --v3)
      [a2 appendString:@"  "];
    unint64_t v30 = *(char *)(v5 + 58);
    if (v30 > 2) {
      uint64_t v31 = 0;
    }
    else {
      uint64_t v31 = qword_18E5F7330[v30];
    }
    uint64_t v32 = *(int **)(v5 + 32);
    if (v32)
    {
      if (v30 == 2)
      {
        uint64_t v33 = *v32;
      }
      else
      {
        if (*(unsigned char *)(v5 + 58) != 1)
        {
          if (!*(unsigned char *)(v5 + 58))
          {
            uint64_t v33 = *(char *)v32;
            goto LABEL_71;
          }
          goto LABEL_68;
        }
        uint64_t v33 = *(__int16 *)v32;
      }
LABEL_71:
      objc_msgSend(a2, "appendFormat:", @"  deltas (%lu-byte) <%ld", v31, v33);
      if (*(void *)(v5 + 8) < 2uLL) {
        goto LABEL_85;
      }
      unint64_t v34 = 1;
      do
      {
        uint64_t v35 = *(void *)(v5 + 32);
        if (v35)
        {
          int v36 = *(unsigned __int8 *)(v5 + 58);
          if (v36 == 2)
          {
            uint64_t v35 = *(int *)(v35 + 4 * v34);
          }
          else if (v36 == 1)
          {
            uint64_t v35 = *(__int16 *)(v35 + 2 * v34);
          }
          else if (*(unsigned char *)(v5 + 58))
          {
            uint64_t v35 = 0;
          }
          else
          {
            uint64_t v35 = *(char *)(v35 + v34);
          }
        }
        objc_msgSend(a2, "appendFormat:", @" %ld", v35);
        unint64_t v37 = *(void *)(v5 + 8);
        if (v34 > 0xFE) {
          break;
        }
        ++v34;
      }
      while (v34 < v37);
      if (v37 < 0x101) {
LABEL_85:
      }
        double v38 = @">\n";
      else {
        double v38 = @"...>\n";
      }
      return [a2 appendString:v38];
    }
LABEL_68:
    uint64_t v33 = 0;
    goto LABEL_71;
  }
  return result;
}

void _NSGlyphTreeLogDebug(NSString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if ((unint64_t)_NSGlyphTreeLogDebug_logCount <= 0xF)
  {
    ++_NSGlyphTreeLogDebug_logCount;
    NSLogv(a1, &a9);
    if ((unint64_t)_NSGlyphTreeLogDebug_logCount >= 0x10) {
      NSLog((NSString *)@"!!! Suppressing further NSGlyphTree logs");
    }
  }
}

uint64_t _NSGlyphNodeCalculateMemoryUsage(uint64_t result, void *a2, uint64_t *a3)
{
  if (result)
  {
    ++*a2;
    uint64_t v5 = *a3 + 64;
    *a3 = v5;
    if (*(unsigned char *)(result + 59))
    {
      unint64_t v6 = *(char *)(result + 57);
      if (v6 > 3) {
        uint64_t v7 = 0;
      }
      else {
        uint64_t v7 = qword_18E5F7310[v6];
      }
      unint64_t v10 = *(char *)(result + 58);
      if (v10 > 2) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = qword_18E5F7330[v10];
      }
      uint64_t v12 = *(void *)(result + 48);
      if (*(void *)(result + 24))
      {
        v5 += v12 * v7;
        *a3 = v5;
      }
      if (*(void *)(result + 32))
      {
        v5 += v12 * v11;
        *a3 = v5;
      }
      if (*(void *)(result + 40)) {
        *a3 = v5 + v12;
      }
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v9 = result + 24;
      do
      {
        Class result = _NSGlyphNodeCalculateMemoryUsage(*(void *)(v9 + v8), a2, a3);
        v8 += 8;
      }
      while (v8 != 24);
    }
  }
  return result;
}

uint64_t _NSGlyphTreeGetFirstHoleAfterCharacterIndex(uint64_t result, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5, uint64_t *a6)
{
  unint64_t v9 = a2;
  uint64_t v10 = result;
  uint64_t v11 = (unint64_t **)(*(void *)(result + 240) + 208);
  uint64_t v12 = *v11;
  unint64_t v13 = **v11;
  if (((*v11)[7] & 2) == 0)
  {
    unint64_t v14 = v13 - a2;
    Class result = _NSGlyphTreeGlyphIndexForCharacterAtIndex(result, a2);
    uint64_t v15 = result;
    goto LABEL_21;
  }
  uint64_t v15 = v12[1];
  if (((*v11)[7] & 1) == 0
    || (*(void *)(*(void *)(result + 240) + 216) = v12,
        *(void *)(*(void *)(result + 240) + 232) = 0,
        *(void *)(*(void *)(result + 240) + 224) = 0,
        v13 <= a2))
  {
LABEL_20:
    unint64_t v14 = 0;
    unint64_t v9 = v13;
    goto LABEL_21;
  }
  while (1)
  {
    unsigned int v17 = *(void **)(v10 + 240);
    unsigned int v18 = v17 + 26;
    unsigned int v19 = (uint64_t *)v17[27];
    if (v19) {
      break;
    }
    unint64_t v9 = v13;
LABEL_19:
    v18[1] = *v18;
    *(void *)(*(void *)(v10 + 240) + 232) = 0;
    *(void *)(*(void *)(v10 + 240) + 224) = 0;
    if (v9 >= v13) {
      goto LABEL_20;
    }
  }
  if (!*((unsigned char *)v19 + 59))
  {
    while (1)
    {
      uint64_t v20 = v18[2];
      uint64_t v21 = *v19;
      uint64_t v22 = 24;
      while (1)
      {
        uint64_t v23 = *(void *)(v10 + 240);
        unsigned int v24 = *(uint64_t **)(*(void *)(v23 + 216) + v22);
        if (!v24) {
          break;
        }
        Class result = *((unsigned __int8 *)v24 + 56);
        uint64_t v25 = *v24;
        uint64_t v26 = *(void *)(v23 + 224);
        if (result)
        {
          unint64_t v27 = v25 + v26;
          if (v9 < v27) {
            break;
          }
        }
        else
        {
          unint64_t v27 = v26 + v25;
        }
        *(void *)(v23 + 224) = v27;
        *(void *)(*(void *)(v10 + 240) + 232) += v24[1];
        v22 += 8;
        if (v22 == 48)
        {
          unsigned int v24 = 0;
          uint64_t v23 = *(void *)(v10 + 240);
          break;
        }
      }
      *(void *)(v23 + 216) = v24;
      unsigned int v17 = *(void **)(v10 + 240);
      unsigned int v18 = v17 + 26;
      unsigned int v19 = (uint64_t *)v17[27];
      if (!v19) {
        break;
      }
      if (*((unsigned char *)v19 + 59)) {
        goto LABEL_28;
      }
    }
    unint64_t v9 = v21 + v20;
    goto LABEL_19;
  }
LABEL_28:
  unint64_t v14 = 0;
  unint64_t v9 = v18[2];
  uint64_t v15 = v18[3];
  if (a5)
  {
    if (a3)
    {
      unint64_t v14 = *v19;
      Class result = _NSGlyphTreeMoveToCharacterIndex(v10, v17[28] + *v19);
      if (result)
      {
        do
        {
          uint64_t v28 = *(void *)(v10 + 240);
          uint64_t v29 = *(void *)(v28 + 216);
          if (*(unsigned char *)(v29 + 59))
          {
            if (*(void *)(v29 + 24)) {
              BOOL v30 = 1;
            }
            else {
              BOOL v30 = v14 >= a3;
            }
            if (v30) {
              break;
            }
          }
          else if (v14 >= a3)
          {
            break;
          }
          v14 += *(void *)v29;
          Class result = _NSGlyphTreeMoveToCharacterIndex(v10, *(void *)(v28 + 224) + *(void *)v29);
        }
        while ((result & 1) != 0);
      }
    }
  }
LABEL_21:
  if (a4) {
    *a4 = v9;
  }
  if (a5) {
    *a5 = v14;
  }
  if (a6) {
    *a6 = v15;
  }
  return result;
}

uint64_t _NSGlyphTreeGlyphIndexForCharacterAtIndex(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  if ((*(unsigned char *)(*(void *)(*(void *)(a1 + 240) + 208) + 56) & 4) == 0) {
    return v2;
  }
  BOOL v4 = _NSGlyphTreeMoveToCharacterIndex(a1, a2);
  uint64_t v5 = *(void *)(a1 + 240) + 208;
  if (!v4)
  {
    unint64_t v14 = *(void **)v5;
    uint64_t v15 = v14 + 1;
    return *v15 + v2 - *v14;
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 240) + 216);
  if (!*(unsigned char *)(v6 + 59) || (uint64_t v7 = *(void *)(v6 + 32)) == 0)
  {
    uint64_t v15 = (void *)(v5 + 24);
    unint64_t v14 = (void *)(v5 + 16);
    return *v15 + v2 - *v14;
  }
  uint64_t v9 = *(void *)(v5 + 16);
  unint64_t v8 = *(void *)(v5 + 24);
  unint64_t v10 = _NSGlyphNodePrimitiveRelativeGlyphIndexForRelativeCharacterIndex(*(void *)(v5 + 8), v2 - v9);
  unint64_t v11 = v10 + v8;
  if (v8 < v10 + v8) {
    unint64_t v11 = v8;
  }
  while (v8 + v10 > v8)
  {
    int v12 = *(unsigned __int8 *)(v6 + 58);
    if (v12 == 2)
    {
      uint64_t v13 = *(int *)(v7 + 4 * v10 - 4);
    }
    else if (v12 == 1)
    {
      uint64_t v13 = *(__int16 *)(v7 - 2 + 2 * v10);
    }
    else if (*(unsigned char *)(v6 + 58))
    {
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v13 = *(char *)(v7 + v10 - 1);
    }
    --v10;
    if (v9 - v13 + v10 < v2) {
      return v8 + v10 + 1;
    }
  }
  return v11;
}

BOOL _NSGlyphTreeMoveToCharacterIndex(uint64_t a1, unint64_t a2)
{
  for (uint64_t i = (void *)(*(void *)(a1 + 240) + 208); ; uint64_t i = (void *)(*(void *)(a1 + 240) + 208))
  {
    uint64_t v3 = (void *)i[1];
    if (!v3 || !v3[2]) {
      break;
    }
    unint64_t v4 = i[2];
    if (v4 <= a2 && *v3 + v4 > a2) {
      goto LABEL_14;
    }
    uint64_t v5 = 24;
    while (1)
    {
      uint64_t v6 = *(void *)(a1 + 240);
      uint64_t v7 = *(void **)(v6 + 216);
      uint64_t v8 = v7[2];
      uint64_t v9 = *(void **)(v8 + v5);
      if (!v9) {
        break;
      }
      if (v7 == v9) {
        goto LABEL_12;
      }
      uint64_t v10 = v9[1];
      *(void *)(v6 + 224) -= *v9;
      *(void *)(*(void *)(a1 + 240) + 232) -= v10;
      v5 += 8;
      if (v5 == 48)
      {
        uint64_t v8 = 0;
        uint64_t v6 = *(void *)(a1 + 240);
        goto LABEL_12;
      }
    }
    uint64_t v8 = 0;
LABEL_12:
    *(void *)(v6 + 216) = v8;
  }
  i[1] = *i;
  *(void *)(*(void *)(a1 + 240) + 232) = 0;
  *(void *)(*(void *)(a1 + 240) + 224) = 0;
LABEL_14:
  unint64_t v11 = (void *)(*(void *)(a1 + 240) + 208);
  unint64_t v12 = *(void *)(*(void *)(a1 + 240) + 224);
  if (v12 > a2) {
    return 0;
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 240) + 216);
  if (*(void *)v13 + v12 <= a2) {
    return 0;
  }
  for (BOOL j = *(unsigned char *)(v13 + 59) != 0; !*(unsigned char *)(v13 + 59); BOOL j = *(unsigned char *)(v13 + 59) != 0)
  {
    uint64_t v15 = 24;
    while (1)
    {
      uint64_t v16 = *(void *)(a1 + 240);
      unsigned int v17 = *(void **)(*(void *)(v16 + 216) + v15);
      if (!v17) {
        break;
      }
      unint64_t v18 = *(void *)(v16 + 224);
      unint64_t v19 = *v17 + v18;
      if (v18 <= a2 && v19 > a2) {
        break;
      }
      *(void *)(v16 + 224) = v19;
      *(void *)(*(void *)(a1 + 240) + 232) += v17[1];
      v15 += 8;
      if (v15 == 48)
      {
        unsigned int v17 = 0;
        uint64_t v16 = *(void *)(a1 + 240);
        break;
      }
    }
    *(void *)(v16 + 216) = v17;
    unint64_t v11 = (void *)(*(void *)(a1 + 240) + 208);
    uint64_t v13 = *(void *)(*(void *)(a1 + 240) + 216);
    if (!v13) {
      goto LABEL_29;
    }
  }
  if (!*(void *)(v13 + 16))
  {
LABEL_29:
    v11[1] = *v11;
    *(void *)(*(void *)(a1 + 240) + 232) = 0;
    *(void *)(*(void *)(a1 + 240) + 224) = 0;
    return j;
  }
  return 1;
}

uint64_t _NSGlyphTreeGetFirstHoleAfterGlyphIndex(uint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4, unint64_t *a5, unint64_t *a6)
{
  unint64_t v9 = a2;
  uint64_t v10 = result;
  uint64_t v11 = *(void *)(result + 240) + 208;
  unint64_t v12 = *(uint64_t **)v11;
  if ((*(unsigned char *)(*(void *)v11 + 56) & 2) == 0)
  {
    Class result = _NSGlyphTreeCharacterIndexForGlyphAtIndex(result, a2);
    uint64_t v13 = result;
    unint64_t v14 = **(void **)(*(void *)(v10 + 240) + 208) - result;
    goto LABEL_21;
  }
  uint64_t v13 = *v12;
  unint64_t v15 = v12[1];
  if ((*(unsigned char *)(*(void *)v11 + 56) & 1) == 0
    || (*(void *)(*(void *)(result + 240) + 216) = v12,
        *(void *)(*(void *)(result + 240) + 232) = 0,
        *(void *)(*(void *)(result + 240) + 224) = 0,
        v15 <= a2))
  {
LABEL_20:
    unint64_t v14 = 0;
    unint64_t v9 = v15;
    goto LABEL_21;
  }
  while (1)
  {
    unsigned int v17 = *(void **)(result + 240);
    unint64_t v18 = v17 + 26;
    uint64_t v19 = v17[27];
    if (v19) {
      break;
    }
    unint64_t v9 = v15;
LABEL_19:
    v18[1] = *v18;
    *(void *)(*(void *)(result + 240) + 232) = 0;
    *(void *)(*(void *)(result + 240) + 224) = 0;
    if (v9 >= v15) {
      goto LABEL_20;
    }
  }
  if (!*(unsigned char *)(v19 + 59))
  {
    while (1)
    {
      uint64_t v20 = v18[3];
      uint64_t v21 = *(void *)(v19 + 8);
      uint64_t v22 = 24;
      while (1)
      {
        uint64_t v23 = *(void **)(result + 240);
        uint64_t v24 = *(void *)(v23[27] + v22);
        if (!v24) {
          break;
        }
        if (*(unsigned char *)(v24 + 56))
        {
          uint64_t v25 = *(void *)(v24 + 8);
          if (v9 < v25 + v23[29]) {
            break;
          }
        }
        else
        {
          uint64_t v25 = *(void *)(v24 + 8);
        }
        v23[28] += *(void *)v24;
        *(void *)(*(void *)(result + 240) + 232) += v25;
        v22 += 8;
        if (v22 == 48)
        {
          uint64_t v24 = 0;
          uint64_t v23 = *(void **)(result + 240);
          break;
        }
      }
      v23[27] = v24;
      unsigned int v17 = *(void **)(result + 240);
      unint64_t v18 = v17 + 26;
      uint64_t v19 = v17[27];
      if (!v19) {
        break;
      }
      if (*(unsigned char *)(v19 + 59)) {
        goto LABEL_28;
      }
    }
    unint64_t v9 = v21 + v20;
    goto LABEL_19;
  }
LABEL_28:
  unint64_t v14 = 0;
  uint64_t v13 = v18[2];
  unint64_t v9 = v18[3];
  if (a5)
  {
    if (a3)
    {
      unint64_t v14 = *(void *)v19;
      Class result = _NSGlyphTreeMoveToCharacterIndex(result, v17[28] + *(void *)v19);
      if (result)
      {
        do
        {
          uint64_t v26 = *(void *)(v10 + 240);
          uint64_t v27 = *(void *)(v26 + 216);
          if (*(unsigned char *)(v27 + 59))
          {
            if (*(void *)(v27 + 24)) {
              BOOL v28 = 1;
            }
            else {
              BOOL v28 = v14 >= a3;
            }
            if (v28) {
              break;
            }
          }
          else if (v14 >= a3)
          {
            break;
          }
          v14 += *(void *)v27;
          Class result = _NSGlyphTreeMoveToCharacterIndex(v10, *(void *)(v26 + 224) + *(void *)v27);
        }
        while ((result & 1) != 0);
      }
    }
  }
LABEL_21:
  if (a4) {
    *a4 = v13;
  }
  if (a5) {
    *a5 = v14;
  }
  if (a6) {
    *a6 = v9;
  }
  return result;
}

unint64_t _NSGlyphTreeCharacterIndexForGlyphAtIndex(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  if ((*(unsigned char *)(*(void *)(*(void *)(a1 + 240) + 208) + 56) & 4) != 0)
  {
    if (_NSGlyphTreeMoveToGlyphIndex(a1, a2))
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 240) + 216);
      if (*(unsigned char *)(v4 + 59) && (uint64_t v5 = *(void *)(v4 + 32)) != 0)
      {
        uint64_t v6 = *(void *)(*(void *)(a1 + 240) + 232);
        int v7 = *(unsigned __int8 *)(v4 + 58);
        uint64_t v8 = v2 - v6;
        if (v7 == 2)
        {
          uint64_t v9 = *(int *)(v5 + 4 * v8);
        }
        else if (v7 == 1)
        {
          uint64_t v9 = *(__int16 *)(v5 + 2 * v8);
        }
        else if (v7)
        {
          uint64_t v9 = 0;
        }
        else
        {
          uint64_t v9 = *(char *)(v5 + v8);
        }
        return *(void *)(*(void *)(a1 + 240) + 224) + v2 - v6 - v9;
      }
      else
      {
        return *(void *)(*(void *)(a1 + 240) + 224) + v2 - *(void *)(*(void *)(a1 + 240) + 232);
      }
    }
    else
    {
      return **(void **)(*(void *)(a1 + 240) + 208)
           + v2
           - *(void *)(*(void *)(*(void *)(a1 + 240) + 208) + 8);
    }
  }
  return v2;
}

BOOL _NSGlyphTreeMoveToGlyphIndex(uint64_t a1, unint64_t a2)
{
  for (uint64_t i = (void *)(*(void *)(a1 + 240) + 208); ; uint64_t i = (void *)(*(void *)(a1 + 240) + 208))
  {
    uint64_t v3 = i[1];
    if (!v3 || !*(void *)(v3 + 16)) {
      break;
    }
    unint64_t v4 = i[3];
    if (v4 <= a2 && *(void *)(v3 + 8) + v4 > a2) {
      goto LABEL_14;
    }
    uint64_t v5 = 24;
    while (1)
    {
      uint64_t v6 = *(void *)(a1 + 240);
      int v7 = *(void **)(v6 + 216);
      uint64_t v8 = v7[2];
      uint64_t v9 = *(void **)(v8 + v5);
      if (!v9) {
        break;
      }
      if (v7 == v9) {
        goto LABEL_12;
      }
      uint64_t v10 = v9[1];
      *(void *)(v6 + 224) -= *v9;
      *(void *)(*(void *)(a1 + 240) + 232) -= v10;
      v5 += 8;
      if (v5 == 48)
      {
        uint64_t v8 = 0;
        uint64_t v6 = *(void *)(a1 + 240);
        goto LABEL_12;
      }
    }
    uint64_t v8 = 0;
LABEL_12:
    *(void *)(v6 + 216) = v8;
  }
  i[1] = *i;
  *(void *)(*(void *)(a1 + 240) + 232) = 0;
  *(void *)(*(void *)(a1 + 240) + 224) = 0;
LABEL_14:
  uint64_t v11 = (void *)(*(void *)(a1 + 240) + 208);
  unint64_t v12 = *(void *)(*(void *)(a1 + 240) + 232);
  if (v12 > a2) {
    return 0;
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 240) + 216);
  if (*(void *)(v13 + 8) + v12 <= a2) {
    return 0;
  }
  for (BOOL j = *(unsigned char *)(v13 + 59) != 0; !*(unsigned char *)(v13 + 59); BOOL j = *(unsigned char *)(v13 + 59) != 0)
  {
    uint64_t v15 = 24;
    while (1)
    {
      uint64_t v16 = *(void **)(a1 + 240);
      unsigned int v17 = *(void **)(v16[27] + v15);
      if (!v17) {
        break;
      }
      unint64_t v18 = v16[29];
      uint64_t v19 = v17[1];
      if (v18 <= a2 && v19 + v18 > a2) {
        break;
      }
      v16[28] += *v17;
      *(void *)(*(void *)(a1 + 240) + 232) += v19;
      v15 += 8;
      if (v15 == 48)
      {
        unsigned int v17 = 0;
        uint64_t v16 = *(void **)(a1 + 240);
        break;
      }
    }
    v16[27] = v17;
    uint64_t v11 = (void *)(*(void *)(a1 + 240) + 208);
    uint64_t v13 = *(void *)(*(void *)(a1 + 240) + 216);
    if (!v13) {
      goto LABEL_29;
    }
  }
  if (!*(void *)(v13 + 16))
  {
LABEL_29:
    v11[1] = *v11;
    *(void *)(*(void *)(a1 + 240) + 232) = 0;
    *(void *)(*(void *)(a1 + 240) + 224) = 0;
    return j;
  }
  return 1;
}

unint64_t _NSGlyphNodePrimitiveRelativeGlyphIndexForRelativeCharacterIndex(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  unint64_t v3 = v2 - 1;
  if (v2 != 1)
  {
    unint64_t v4 = 0;
    uint64_t v5 = *(void *)(a1 + 32);
    while (1)
    {
      unint64_t v6 = (v3 + v4) >> 1;
      if (!v5) {
        goto LABEL_8;
      }
      int v7 = *(unsigned __int8 *)(a1 + 58);
      if (v7 == 2)
      {
        uint64_t v8 = *(int *)(v5 + 4 * v6);
        goto LABEL_11;
      }
      if (v7 == 1)
      {
        uint64_t v8 = *(__int16 *)(v5 + 2 * v6);
        goto LABEL_11;
      }
      if (*(unsigned char *)(a1 + 58)) {
LABEL_8:
      }
        uint64_t v8 = 0;
      else {
        uint64_t v8 = *(char *)(v5 + v6);
      }
LABEL_11:
      unint64_t v9 = v6 - v8;
      if (v9 >= a2)
      {
        if (v9 <= a2) {
          return v6;
        }
        if (v6 <= v4) {
          unint64_t v6 = v4;
        }
        else {
          --v6;
        }
        unint64_t v3 = v6;
      }
      else
      {
        if (v6 < v3) {
          ++v6;
        }
        else {
          unint64_t v6 = v3;
        }
        unint64_t v4 = v6;
      }
      if (v4 >= v3) {
        return v6;
      }
    }
  }
  return 0;
}

uint64_t _NSGlyphTreeCharacterRangeForGlyphRange(uint64_t a1, unint64_t a2, uint64_t a3, int a4, int a5, unint64_t *a6)
{
  uint64_t v7 = a3;
  unint64_t v8 = a2;
  uint64_t v10 = 0;
  unint64_t v11 = 0;
  if (a2 && a3)
  {
    if (_NSGlyphTreeMoveToGlyphIndex(a1, a2))
    {
      unint64_t v11 = v8;
      uint64_t v94 = v7;
LABEL_5:
      uint64_t v20 = *(void **)(a1 + 240);
      uint64_t v21 = v20 + 26;
      uint64_t v22 = v20[27];
      if (*(unsigned char *)(v22 + 59))
      {
        uint64_t v23 = *(void *)(v22 + 32);
        if (v23)
        {
          unint64_t v24 = v20[29];
          int v25 = *(unsigned __int8 *)(v22 + 58);
          uint64_t v26 = v11 - v24;
          if (v25 == 2)
          {
            uint64_t v27 = *(int *)(v23 + 4 * v26);
          }
          else if (v25 == 1)
          {
            uint64_t v27 = *(__int16 *)(v23 + 2 * v26);
          }
          else if (*(unsigned char *)(v22 + 58))
          {
            uint64_t v27 = 0;
          }
          else
          {
            uint64_t v27 = *(char *)(v23 + v26);
          }
          uint64_t v28 = 0;
          uint64_t v10 = v20[28] + v11 - v24 - v27;
          if (v11 >= v24) {
            unint64_t v29 = v20[29];
          }
          else {
            unint64_t v29 = v11;
          }
          uint64_t v30 = -v27;
          uint64_t v13 = v23 + v11 - v24 - 1;
          uint64_t v14 = v23 - 2 * v24 + 2 * v11 - 2;
          uint64_t v31 = v23 - 4 * v24 + 4 * v11 - 4;
          while (1)
          {
            uint64_t v15 = v11 + v28;
            if (v11 + v28 <= v24) {
              break;
            }
            if (v25 == 2)
            {
              uint64_t v32 = *(int *)(v31 + 4 * v28);
            }
            else if (v25 == 1)
            {
              uint64_t v32 = *(__int16 *)(v14 + 2 * v28);
            }
            else if (*(unsigned char *)(v22 + 58))
            {
              uint64_t v32 = 0;
            }
            else
            {
              uint64_t v32 = *(char *)(v13 + v28);
            }
            --v28;
            uint64_t v15 = v30 + v32;
            if (v15 != v28)
            {
              unint64_t v33 = v8;
              unint64_t v34 = v11 + v28 + 1;
              goto LABEL_32;
            }
          }
          unint64_t v11 = v29;
          if (!v29) {
            goto LABEL_67;
          }
          goto LABEL_31;
        }
      }
      uint64_t v10 = v20[28] + v11 - v20[29];
      if (v11)
      {
LABEL_31:
        unint64_t v33 = v8;
        unint64_t v34 = v11;
LABEL_32:
        if (*(unsigned char *)(v22 + 59))
        {
          uint64_t v35 = 24 * v34;
          unint64_t v11 = v34;
          do
          {
            uint64_t v36 = *(void *)(v22 + 24);
            if (!v36) {
              break;
            }
            uint64_t v37 = v21[3];
            switch(*(unsigned char *)(v22 + 57))
            {
              case 0:
                unsigned int v38 = *(unsigned __int8 *)(v36 - v37 + v11);
                if (v38 >= 4) {
                  int v39 = v38;
                }
                else {
                  int v39 = 0xFFFFFF;
                }
                if (v38 <= 0xEF) {
                  int v40 = v39;
                }
                else {
                  int v40 = v38 & 3;
                }
                break;
              case 1:
                unsigned int v41 = *(unsigned __int16 *)(v36 - 2 * v37 + 2 * v11);
                unsigned int v42 = v41 >> 8;
                BOOL v43 = v41 > 0xFF;
                int v40 = ((char)v41 >> 7) & 0xFFFFFF;
                if (v43) {
                  int v40 = v42;
                }
                break;
              case 2:
                unsigned int v44 = *(_DWORD *)(v36 - 4 * v37 + 4 * v11);
                goto LABEL_48;
              case 3:
                unsigned int v44 = *(_DWORD *)(v36 - 24 * v37 + v35);
LABEL_48:
                if (v44 > 0xFF) {
                  int v40 = v44 >> 8;
                }
                else {
                  int v40 = ((char)v44 >> 7) & 0xFFFFFF;
                }
                break;
              default:
                int v40 = 0;
                break;
            }
            if (!v11 || v40)
            {
              if (v40 == 0xFFFFFF || !v40) {
                goto LABEL_66;
              }
              BOOL v45 = v11 >= v34;
              unint64_t v8 = v33;
              uint64_t v7 = v94;
              if (v45) {
                goto LABEL_67;
              }
              goto LABEL_5;
            }
            if (--v11 < v20[29])
            {
              if (!_NSGlyphTreeMoveToGlyphIndex(a1, v11)) {
                goto LABEL_66;
              }
              uint64_t v20 = *(void **)(a1 + 240);
            }
            uint64_t v21 = v20 + 26;
            uint64_t v22 = v20[27];
            v35 -= 24;
          }
          while (*(unsigned char *)(v22 + 59));
        }
        if (a4) {
          _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeCharacterRangeForGlyphRange missing glyphs 1", v13, v14, v15, v16, v17, v18, v19, v88);
        }
LABEL_66:
        unint64_t v11 = v34;
        unint64_t v8 = v33;
        uint64_t v7 = v94;
      }
    }
    else
    {
      double v46 = *(uint64_t **)(*(void *)(a1 + 240) + 208);
      uint64_t v10 = *v46;
      unint64_t v11 = v46[1];
    }
  }
LABEL_67:
  unint64_t v47 = v8 + v7;
  if (!(v8 + v7)) {
    goto LABEL_133;
  }
  uint64_t v95 = v7;
  uint64_t v48 = *(uint64_t **)(*(void *)(a1 + 240) + 208);
  uint64_t v49 = *v48;
  if (!*v48)
  {
    if (!a6) {
      return v10;
    }
    goto LABEL_147;
  }
  unint64_t v50 = v48[1];
  if (!v50)
  {
LABEL_133:
    uint64_t v49 = 0;
    if (!a6) {
      return v10;
    }
    goto LABEL_147;
  }
  unint64_t v89 = v8;
  unint64_t v90 = a6;
  if (v47 >= v50) {
    goto LABEL_138;
  }
  unint64_t v51 = v47 - 1;
  if (!_NSGlyphTreeMoveToGlyphIndex(a1, v47 - 1))
  {
    double v86 = *(uint64_t **)(*(void *)(a1 + 240) + 208);
    uint64_t v49 = *v86;
    unint64_t v50 = v86[1];
LABEL_138:
    uint64_t v92 = v49 - 1;
    unint64_t v78 = v50 - 1;
    goto LABEL_139;
  }
  char v52 = a5;
  if (v7) {
    char v52 = 0;
  }
  char v91 = v52;
  while (1)
  {
    uint64_t v53 = *(void **)(a1 + 240);
    uint64_t v54 = v53[27];
    if (*(unsigned char *)(v54 + 59) && (uint64_t v55 = *(void *)(v54 + 32)) != 0)
    {
      uint64_t v56 = v53[29];
      int v57 = *(unsigned __int8 *)(v54 + 58);
      uint64_t v58 = v51 - v56;
      if (v57 == 2)
      {
        uint64_t v59 = *(int *)(v55 + 4 * v58);
      }
      else if (v57 == 1)
      {
        uint64_t v59 = *(__int16 *)(v55 + 2 * v58);
      }
      else
      {
        uint64_t v59 = *(unsigned char *)(v54 + 58) ? 0 : *(char *)(v55 + v58);
      }
      uint64_t v61 = 0;
      uint64_t v62 = v53[28];
      uint64_t v63 = v62 + v51 - v56 - v59;
      unint64_t v64 = *(void *)(v54 + 8) + v56;
      uint64_t v65 = v64 <= v51 + 1 ? v51 + 1 : *(void *)(v54 + 8) + v56;
      unint64_t v66 = v65 - 1;
      uint64_t v67 = v55 + v58 + 1;
      uint64_t v68 = v55 - 2 * v56 + 2 * v51 + 2;
      uint64_t v69 = v55 - 4 * v56 + 4 * v51 + 4;
      do
      {
        if (v51 + v61 + 1 >= v64)
        {
          uint64_t v92 = v62 + *(void *)v54 - 1;
          unint64_t v51 = v66;
          goto LABEL_101;
        }
        if (v57 == 2)
        {
          uint64_t v70 = *(int *)(v69 + 4 * v61);
        }
        else if (v57 == 1)
        {
          uint64_t v70 = *(__int16 *)(v68 + 2 * v61);
        }
        else if (*(unsigned char *)(v54 + 58))
        {
          uint64_t v70 = 0;
        }
        else
        {
          uint64_t v70 = *(char *)(v67 + v61);
        }
        ++v61;
        uint64_t v71 = v59 - v70 + v61;
      }
      while (v71 < 1);
      uint64_t v72 = v51 + v62;
      unint64_t v51 = v51 + v61 - 1;
      uint64_t v60 = ~v56 + v72 - v70 + v61;
      if (v71 == 1) {
        uint64_t v60 = v63;
      }
    }
    else
    {
      uint64_t v56 = v53[29];
      uint64_t v60 = v53[28] + v51 - v56;
    }
    uint64_t v92 = v60;
LABEL_101:
    unint64_t v73 = v51 + 1;
    char v74 = v91;
    if (v51 + 1 >= *(void *)(v53[26] + 8)) {
      char v74 = 1;
    }
    if (v74) {
      break;
    }
    uint64_t v75 = 24 * v51 + 24;
    char v76 = 1;
    while (2)
    {
      char v77 = v76;
      unint64_t v78 = v51;
      unint64_t v79 = v73;
      if (v73 >= *(void *)(v54 + 8) + v56)
      {
        if (!_NSGlyphTreeMoveToGlyphIndex(a1, v73)) {
          break;
        }
        uint64_t v53 = *(void **)(a1 + 240);
        uint64_t v54 = v53[27];
      }
      if (*(unsigned char *)(v54 + 59))
      {
        uint64_t v80 = *(void *)(v54 + 24);
        if (v80)
        {
          uint64_t v56 = v53[29];
          switch(*(unsigned char *)(v54 + 57))
          {
            case 0:
              unsigned int v81 = *(unsigned __int8 *)(v80 - v56 + v79);
              if (v81 >= 4) {
                int v82 = v81;
              }
              else {
                int v82 = 0xFFFFFF;
              }
              if (v81 <= 0xEF) {
                int v83 = v82;
              }
              else {
                int v83 = v81 & 3;
              }
              goto LABEL_124;
            case 1:
              unsigned int v84 = *(unsigned __int16 *)(v80 - 2 * v56 + 2 * v79);
              goto LABEL_120;
            case 2:
              unsigned int v84 = *(_DWORD *)(v80 - 4 * v56 + 4 * v79);
              goto LABEL_120;
            case 3:
              unsigned int v84 = *(_DWORD *)(v80 - 24 * v56 + v75);
LABEL_120:
              if (v84 > 0xFF)
              {
                int v83 = v84 >> 8;
              }
              else
              {
                if ((v84 & 0x80) != 0) {
                  break;
                }
LABEL_122:
                int v83 = 0;
              }
LABEL_124:
              char v76 = 0;
              unint64_t v73 = v79 + 1;
              v75 += 24;
              ++v51;
              if (v83) {
                break;
              }
              continue;
            default:
              goto LABEL_122;
          }
        }
      }
      break;
    }
    if (v77) {
      goto LABEL_139;
    }
    unint64_t v51 = v79 - 1;
    unint64_t v85 = *(void *)(*(void *)(a1 + 240) + 232);
    if (v79 - 1 < v85 || v51 >= *(void *)(*(void *)(*(void *)(a1 + 240) + 216) + 8) + v85)
    {
      if (v77 & 1 | !_NSGlyphTreeMoveToGlyphIndex(a1, v79 - 1)) {
        goto LABEL_139;
      }
    }
    else if (v77)
    {
      break;
    }
  }
  unint64_t v78 = v51;
LABEL_139:
  if (v95)
  {
    uint64_t v49 = v78 - v11 + 1;
  }
  else
  {
    uint64_t v10 = v92 + 1;
    if (a5)
    {
      uint64_t v49 = 0;
      if (v89 >= *(void *)(*(void *)(*(void *)(a1 + 240) + 208) + 8)) {
        unint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 240) + 208) + 8);
      }
      else {
        unint64_t v11 = v89;
      }
    }
    else
    {
      uint64_t v49 = 0;
      unint64_t v11 = v78 + 1;
    }
  }
  a6 = v90;
  if (v90)
  {
LABEL_147:
    *a6 = v11;
    a6[1] = v49;
  }
  return v10;
}

unint64_t _NSGlyphTreeGlyphRangeForCharacterRange(uint64_t a1, unint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9 = a3;
  unint64_t v12 = 0;
  uint64_t v13 = &OBJC_IVAR___NSExtraLMData__glyphTree;
  if (a2)
  {
    uint64_t v14 = 0;
    if (a3)
    {
      if (_NSGlyphTreeMoveToCharacterIndex(a1, a2))
      {
        uint64_t v22 = *(void *)(*(void *)(a1 + 240) + 216);
        if (*(unsigned char *)(v22 + 59) && *(void *)(v22 + 32))
        {
          uint64_t v23 = a6;
          uint64_t v24 = v9;
          uint64_t v25 = *(void *)(*(void *)(a1 + 240) + 232);
          unint64_t v12 = _NSGlyphNodePrimitiveRelativeGlyphIndexForRelativeCharacterIndex(v22, a2 - *(void *)(*(void *)(a1 + 240) + 224))+ v25;
          uint64_t v9 = v24;
          a6 = v23;
        }
        else
        {
          unint64_t v12 = *(void *)(*(void *)(a1 + 240) + 232) + a2 - *(void *)(*(void *)(a1 + 240) + 224);
        }
        int v27 = 0xFFFFFF;
        uint64_t v116 = v9;
        while (1)
        {
          uint64_t v28 = *(void *)(*(void *)(a1 + 240) + 216);
          if (*(unsigned char *)(v28 + 59) && (uint64_t v29 = *(void *)(v28 + 32)) != 0)
          {
            unint64_t v30 = *(void *)(*(void *)(a1 + 240) + 232);
            int v31 = *(unsigned __int8 *)(v28 + 58);
            uint64_t v32 = v12 - v30;
            if (v31 == 2)
            {
              uint64_t v33 = *(int *)(v29 + 4 * v32);
            }
            else if (v31 == 1)
            {
              uint64_t v33 = *(__int16 *)(v29 + 2 * v32);
            }
            else
            {
              uint64_t v33 = v31 ? 0 : *(char *)(v29 + v32);
            }
            uint64_t v34 = 0;
            uint64_t v14 = *(void *)(*(void *)(a1 + 240) + 224) + v12 - v30 - v33;
            unint64_t v35 = v12 >= v30 ? *(void *)(*(void *)(a1 + 240) + 232) : v12;
            uint64_t v36 = -v33;
            uint64_t v37 = v29 + v12 - v30 - 1;
            uint64_t v38 = v29 - 2 * v30 + 2 * v12 - 2;
            uint64_t v39 = v29 - 4 * v30 + 4 * v12 - 4;
            while (v12 + v34 > v30)
            {
              if (v31 == 2)
              {
                uint64_t v40 = *(int *)(v39 + 4 * v34);
              }
              else if (v31 == 1)
              {
                uint64_t v40 = *(__int16 *)(v38 + 2 * v34);
              }
              else if (v31)
              {
                uint64_t v40 = 0;
              }
              else
              {
                uint64_t v40 = *(char *)(v37 + v34);
              }
              if (v36 + v40 != --v34)
              {
                unint64_t v41 = v12 + v34 + 1;
                if (a6) {
                  goto LABEL_39;
                }
                goto LABEL_36;
              }
            }
            unint64_t v12 = v35;
            if (!v35) {
              goto LABEL_72;
            }
          }
          else
          {
            uint64_t v14 = *(void *)(*(void *)(a1 + 240) + 224) + v12 - *(void *)(*(void *)(a1 + 240) + 232);
            if (!v12) {
              goto LABEL_72;
            }
          }
          unint64_t v41 = v12;
          if (a6) {
            break;
          }
LABEL_36:
          unint64_t v12 = v41;
LABEL_65:
          if (v27 == 0xFFFFFF)
          {
LABEL_155:
            unint64_t v12 = v41;
            uint64_t v9 = v116;
            goto LABEL_72;
          }
          BOOL v55 = v12 >= v41;
          uint64_t v9 = v116;
          if (v55) {
            goto LABEL_72;
          }
        }
LABEL_39:
        uint64_t v111 = v14;
        uint64_t v42 = a6;
        uint64_t v43 = *(void *)(a1 + 240) + 208;
        uint64_t v44 = *(void *)(*(void *)(a1 + 240) + 216);
        if (*(unsigned char *)(v44 + 59))
        {
          uint64_t v45 = 24 * v41;
          unint64_t v12 = v41;
          do
          {
            uint64_t v46 = *(void *)(v44 + 24);
            if (!v46) {
              break;
            }
            int v47 = *(unsigned __int8 *)(v44 + 57);
            unint64_t v48 = *(void *)(v43 + 24);
            switch(v47)
            {
              case 0:
                unsigned int v49 = *(unsigned __int8 *)(v46 - v48 + v12);
                if (v49 >= 4) {
                  int v50 = *(unsigned __int8 *)(v46 - v48 + v12);
                }
                else {
                  int v50 = 0xFFFFFF;
                }
                if (v49 <= 0xEF) {
                  int v27 = v50;
                }
                else {
                  int v27 = v49 & 3;
                }
                break;
              case 1:
                unsigned int v51 = *(unsigned __int16 *)(v46 - 2 * v48 + 2 * v12);
                unsigned int v52 = v51 >> 8;
                BOOL v53 = v51 > 0xFF;
                int v27 = ((char)v51 >> 7) & 0xFFFFFF;
                if (v53) {
                  int v27 = v52;
                }
                break;
              case 2:
                unsigned int v54 = *(_DWORD *)(v46 - 4 * v48 + 4 * v12);
                goto LABEL_55;
              case 3:
                unsigned int v54 = *(_DWORD *)(v46 - 24 * v48 + v45);
LABEL_55:
                if (v54 > 0xFF) {
                  int v27 = v54 >> 8;
                }
                else {
                  int v27 = ((char)v54 >> 7) & 0xFFFFFF;
                }
                break;
              default:
                int v27 = 0;
                break;
            }
            if (!v12 || v27)
            {
              a6 = v42;
              uint64_t v14 = v111;
              if (!v27) {
                goto LABEL_155;
              }
              goto LABEL_65;
            }
            if (--v12 < v48 && !_NSGlyphTreeMoveToGlyphIndex(a1, v12)) {
              goto LABEL_71;
            }
            uint64_t v43 = *(void *)(a1 + 240) + 208;
            uint64_t v44 = *(void *)(*(void *)(a1 + 240) + 216);
            v45 -= 24;
          }
          while (*(unsigned char *)(v44 + 59));
        }
        if (a4) {
          _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeGlyphRangeForCharacterRange missing glyphs 1", v15, v16, v17, v18, v19, v20, v21, v108);
        }
LABEL_71:
        unint64_t v12 = v41;
        uint64_t v9 = v116;
        LODWORD(a6) = v42;
        uint64_t v14 = v111;
      }
      else
      {
        uint64_t v26 = *(uint64_t **)(*(void *)(a1 + 240) + 208);
        uint64_t v14 = *v26;
        unint64_t v12 = v26[1];
      }
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
LABEL_72:
  unint64_t v56 = a2 + v9;
  if (!(a2 + v9)) {
    goto LABEL_90;
  }
  int v57 = *(unint64_t **)(*(void *)(a1 + 240) + 208);
  unint64_t v58 = *v57;
  if (!*v57) {
    goto LABEL_91;
  }
  unint64_t v59 = v57[1];
  if (!v59)
  {
LABEL_90:
    unint64_t v58 = 0;
    goto LABEL_91;
  }
  unint64_t v109 = a2;
  uint64_t v110 = a7;
  uint64_t v117 = v9;
  uint64_t v112 = v14;
  if (v56 >= v58) {
    goto LABEL_82;
  }
  unint64_t v60 = v56 - 1;
  BOOL v61 = _NSGlyphTreeMoveToCharacterIndex(a1, v56 - 1);
  uint64_t v62 = (unint64_t **)(*(void *)(a1 + 240) + 208);
  if (!v61)
  {
    unint64_t v66 = *v62;
    unint64_t v58 = **v62;
    unint64_t v59 = v66[1];
LABEL_82:
    unint64_t v67 = v59 - 1;
    uint64_t v115 = v58 - 1;
    goto LABEL_83;
  }
  uint64_t v63 = *(void *)(*(void *)(a1 + 240) + 216);
  if (*(unsigned char *)(v63 + 59) && *(void *)(v63 + 32))
  {
    uint64_t v64 = *(void *)(*(void *)(a1 + 240) + 232);
    unint64_t v65 = _NSGlyphNodePrimitiveRelativeGlyphIndexForRelativeCharacterIndex(v63, v60 - *(void *)(*(void *)(a1 + 240) + 224))+ v64;
  }
  else
  {
    unint64_t v65 = *(void *)(*(void *)(a1 + 240) + 232) + v60 - *(void *)(*(void *)(a1 + 240) + 224);
  }
  while (1)
  {
    uint64_t v69 = *(void *)(a1 + 240);
    uint64_t v70 = *v13;
    uint64_t v71 = (void *)(v69 + v70);
    uint64_t v72 = *(void *)(v69 + v70 + 8);
    if (*(unsigned char *)(v72 + 59) && (uint64_t v73 = *(void *)(v72 + 32)) != 0)
    {
      uint64_t v74 = v71[3];
      int v75 = *(unsigned __int8 *)(v72 + 58);
      uint64_t v76 = v65 - v74;
      if (v75 == 2)
      {
        uint64_t v77 = *(int *)(v73 + 4 * v76);
      }
      else if (v75 == 1)
      {
        uint64_t v77 = *(__int16 *)(v73 + 2 * v76);
      }
      else if (*(unsigned char *)(v72 + 58))
      {
        uint64_t v77 = 0;
      }
      else
      {
        uint64_t v77 = *(char *)(v73 + v76);
      }
      uint64_t v79 = 0;
      uint64_t v80 = v71[2];
      uint64_t v81 = v80 + v65 - v74 - v77;
      unint64_t v82 = *(void *)(v72 + 8) + v74;
      if (v82 <= v65 + 1) {
        unint64_t v83 = v65 + 1;
      }
      else {
        unint64_t v83 = *(void *)(v72 + 8) + v74;
      }
      unint64_t v84 = v83 - 1;
      uint64_t v85 = v73 + v76 + 1;
      uint64_t v86 = v73 - 2 * v74 + 2 * v65 + 2;
      uint64_t v87 = v73 - 4 * v74 + 4 * v65 + 4;
      do
      {
        if (v65 + v79 + 1 >= v82)
        {
          uint64_t v115 = v80 + *(void *)v72 - 1;
          unint64_t v65 = v84;
          goto LABEL_121;
        }
        if (v75 == 2)
        {
          uint64_t v88 = *(int *)(v87 + 4 * v79);
        }
        else if (v75 == 1)
        {
          uint64_t v88 = *(__int16 *)(v86 + 2 * v79);
        }
        else if (*(unsigned char *)(v72 + 58))
        {
          uint64_t v88 = 0;
        }
        else
        {
          uint64_t v88 = *(char *)(v85 + v79);
        }
        ++v79;
        uint64_t v89 = v77 - v88 + v79;
      }
      while (v89 < 1);
      uint64_t v90 = v65 + v80;
      unint64_t v65 = v65 + v79 - 1;
      uint64_t v78 = ~v74 + v90 - v88 + v79;
      if (v89 == 1) {
        uint64_t v78 = v81;
      }
    }
    else
    {
      uint64_t v74 = v71[3];
      uint64_t v78 = v71[2] + v65 - v74;
    }
    uint64_t v115 = v78;
LABEL_121:
    unint64_t v91 = v65 + 1;
    if (v65 + 1 >= *(void *)(*v71 + 8) || a6 == 0)
    {
      unint64_t v67 = v65;
      goto LABEL_83;
    }
    double v93 = v13;
    int v94 = 0;
    uint64_t v95 = 24 * v65 + 24;
    char v96 = 1;
    while (2)
    {
      unint64_t v67 = v65;
      char v97 = v96;
      int v98 = v94;
      unint64_t v99 = v91;
      if (v91 >= *(void *)(v72 + 8) + v74)
      {
        if (!_NSGlyphTreeMoveToGlyphIndex(a1, v91)) {
          break;
        }
        LODWORD(v70) = *v93;
        uint64_t v69 = *(void *)(a1 + 240);
        uint64_t v100 = *v93;
        uint64_t v72 = *(void *)(v69 + v100 + 8);
      }
      else
      {
        uint64_t v100 = (int)v70;
      }
      if (*(unsigned char *)(v72 + 59))
      {
        uint64_t v101 = *(void *)(v72 + 24);
        if (v101)
        {
          uint64_t v74 = *(void *)(v69 + v100 + 24);
          switch(*(unsigned char *)(v72 + 57))
          {
            case 0:
              unsigned int v102 = *(unsigned __int8 *)(v101 - v74 + v99);
              if (v102 >= 4) {
                int v103 = v102;
              }
              else {
                int v103 = 0xFFFFFF;
              }
              if (v102 <= 0xEF) {
                int v104 = v103;
              }
              else {
                int v104 = v102 & 3;
              }
              goto LABEL_146;
            case 1:
              unsigned int v105 = *(unsigned __int16 *)(v101 - 2 * v74 + 2 * v99);
              goto LABEL_142;
            case 2:
              unsigned int v105 = *(_DWORD *)(v101 - 4 * v74 + 4 * v99);
              goto LABEL_142;
            case 3:
              unsigned int v105 = *(_DWORD *)(v101 - 24 * v74 + v95);
LABEL_142:
              if (v105 > 0xFF)
              {
                int v104 = v105 >> 8;
              }
              else
              {
                if ((v105 & 0x80) != 0) {
                  break;
                }
LABEL_144:
                int v104 = 0;
              }
LABEL_146:
              char v96 = 0;
              unint64_t v91 = v99 + 1;
              v95 += 24;
              ++v65;
              int v94 = 1;
              if (v104) {
                break;
              }
              continue;
            default:
              goto LABEL_144;
          }
        }
      }
      break;
    }
    unint64_t v65 = v99 - 1;
    if (v97) {
      break;
    }
    uint64_t v13 = v93;
    uint64_t v106 = *(void *)(a1 + 240) + *v93;
    unint64_t v107 = *(void *)(v106 + 24);
    if (v65 < v107 || v65 >= *(void *)(*(void *)(v106 + 8) + 8) + v107)
    {
      if ((v98 & _NSGlyphTreeMoveToGlyphIndex(a1, v99 - 1) & 1) == 0) {
        goto LABEL_83;
      }
    }
    else if (v97)
    {
      goto LABEL_83;
    }
  }
  unint64_t v67 = v99 - 1;
  uint64_t v13 = v93;
LABEL_83:
  if (v117)
  {
    a7 = v110;
    uint64_t v14 = v112;
    unint64_t v58 = v115 - v112 + 1;
    goto LABEL_91;
  }
  unint64_t v12 = v67 + 1;
  uint64_t v14 = v115 + 1;
  a7 = v110;
  if (!a5 || (~*(_DWORD *)(a1 + 64) & 0xC000) != 0) {
    goto LABEL_90;
  }
  unint64_t v58 = 0;
  if (v109 >= **(void **)(*(void *)(a1 + 240) + *v13)) {
    uint64_t v14 = **(void **)(*(void *)(a1 + 240) + *v13);
  }
  else {
    uint64_t v14 = v109;
  }
LABEL_91:
  if (a7)
  {
    *a7 = v14;
    a7[1] = v58;
  }
  return v12;
}

uint64_t _NSGlyphTreeGlyphAtIndex(uint64_t a1, unint64_t a2, unsigned char *a3)
{
  uint64_t result = _NSGlyphTreeMoveToGlyphIndex(a1, a2);
  char v14 = result;
  if (result)
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 240) + 216);
    if (*(unsigned char *)(v15 + 59) && (uint64_t v16 = *(void *)(v15 + 24)) != 0)
    {
      unint64_t v17 = a2 - *(void *)(*(void *)(a1 + 240) + 232);
      switch(*(unsigned char *)(v15 + 57))
      {
        case 0:
          unsigned int v18 = *(unsigned __int8 *)(v16 + v17);
          if (v18 >= 4) {
            unsigned int v19 = v18;
          }
          else {
            unsigned int v19 = 0xFFFFFF;
          }
          if (v18 <= 0xEF) {
            uint64_t result = v19;
          }
          else {
            uint64_t result = v18 & 3;
          }
          break;
        case 1:
          unsigned int v20 = *(unsigned __int16 *)(v16 + 2 * v17);
          goto LABEL_19;
        case 2:
          unsigned int v20 = *(_DWORD *)(v16 + 4 * v17);
          goto LABEL_19;
        case 3:
          unsigned int v20 = *(_DWORD *)(v16 + 24 * v17);
LABEL_19:
          if (v20 > 0xFF) {
            uint64_t result = v20 >> 8;
          }
          else {
            uint64_t result = ((char)v20 >> 7) & 0xFFFFFF;
          }
          break;
        default:
          goto LABEL_12;
      }
    }
    else
    {
      _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeGlyphAtIndex missing glyphs", v7, v8, v9, v10, v11, v12, v13, v21);
LABEL_12:
      uint64_t result = 0;
    }
  }
  if (a3) {
    *a3 = v14;
  }
  return result;
}

BOOL _NSGlyphTreeHasGlyphsForCharacterAtIndex(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  BOOL result = _NSGlyphTreeMoveToCharacterIndex(a1, a2);
  if (result)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 240) + 216);
    uint64_t v6 = *(void *)(*(void *)(a1 + 240) + 224);
    uint64_t v8 = *(void *)v7;
    if (*(unsigned char *)(v7 + 59))
    {
      BOOL result = *(void *)(v7 + 24) != 0;
      if (!a3) {
        return result;
      }
    }
    else
    {
      BOOL result = 0;
      if (!a3) {
        return result;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    if (!a3) {
      return result;
    }
  }
  *a3 = v6;
  a3[1] = v8;
  return result;
}

uint64_t _NSGlyphTreeBidiLevelForGlyphAtIndex(uint64_t a1, unint64_t a2)
{
  if (_NSGlyphTreeMoveToGlyphIndex(a1, a2))
  {
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 240) + 216) + 40);
    if (v11) {
      return *(unsigned __int8 *)(v11 + a2 - *(void *)(*(void *)(a1 + 240) + 232));
    }
  }
  else
  {
    _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeBidiLevelForGlyphAtIndex invalid glyph index %lu", v4, v5, v6, v7, v8, v9, v10, a2);
  }
  return 0;
}

uint64_t _NSGlyphTreeIntAttributeForGlyphAtIndex(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (!_NSGlyphTreeMoveToGlyphIndex(a1, a2))
  {
    _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeIntAttributeForGlyphAtIndex invalid glyph index %lu", v6, v7, v8, v9, v10, v11, v12, a2);
    return -1;
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 240) + 216);
  if (!*(unsigned char *)(v13 + 59)) {
    return -1;
  }
  uint64_t v14 = *(void *)(v13 + 24);
  if (!v14) {
    return -1;
  }
  uint64_t result = -1;
  switch(a3)
  {
    case 0:
      int v16 = *(unsigned __int8 *)(v13 + 57);
      unint64_t v17 = a2 - *(void *)(*(void *)(a1 + 240) + 232);
      switch(v16)
      {
        case 3:
          unsigned int v18 = *(unsigned __int8 *)(v14 + 24 * v17);
          break;
        case 2:
          unsigned int v18 = *(_DWORD *)(v14 + 4 * v17);
          break;
        case 1:
          unsigned int v18 = *(unsigned __int16 *)(v14 + 2 * v17);
          break;
        default:
          goto LABEL_21;
      }
LABEL_25:
      unsigned int v21 = (v18 >> 3) & 1;
      goto LABEL_33;
    case 1:
      unint64_t v20 = a2 - *(void *)(*(void *)(a1 + 240) + 232);
      switch(*(unsigned char *)(v13 + 57))
      {
        case 0:
          unsigned int v18 = *(unsigned __int8 *)(v14 + v20);
          if (v18 >= 0xF0) {
            goto LABEL_25;
          }
          if (v18 > 3) {
            goto LABEL_21;
          }
          unsigned int v21 = (v18 >> 1) & 1;
          break;
        case 1:
          unsigned int v24 = *(unsigned __int16 *)(v14 + 2 * v20);
          goto LABEL_32;
        case 2:
          unsigned int v24 = *(_DWORD *)(v14 + 4 * v20);
          goto LABEL_32;
        case 3:
          unsigned int v24 = *(unsigned __int8 *)(v14 + 24 * v20);
LABEL_32:
          unsigned int v21 = (v24 >> 4) & 1;
          break;
        default:
          goto LABEL_21;
      }
      goto LABEL_33;
    case 2:
      uint64_t v19 = *(void *)(v13 + 40);
      if (v19) {
        return *(unsigned __int8 *)(v19 + a2 - *(void *)(*(void *)(a1 + 240) + 232));
      }
      else {
        return 0;
      }
    case 5:
      int v22 = *(unsigned __int8 *)(v13 + 57);
      unint64_t v23 = a2 - *(void *)(*(void *)(a1 + 240) + 232);
      switch(v22)
      {
        case 3:
          LOBYTE(v14) = *(unsigned char *)(v14 + 24 * v23);
          break;
        case 2:
          LODWORD(v14) = *(_DWORD *)(v14 + 4 * v23);
          break;
        case 1:
          LOWORD(v14) = *(_WORD *)(v14 + 2 * v23);
          break;
        default:
LABEL_21:
          unsigned int v21 = 0;
          goto LABEL_33;
      }
      unsigned int v21 = v14 & 1;
LABEL_33:
      uint64_t result = v21;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t _NSGlyphTreeNotShownAttributeForGlyphAtIndex(uint64_t a1, unint64_t a2)
{
  if (!_NSGlyphTreeMoveToGlyphIndex(a1, a2))
  {
    _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeNotShownAttributeForGlyphAtIndex invalid glyph index %lu", v4, v5, v6, v7, v8, v9, v10, a2);
    return 0;
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 240) + 216);
  if (!*(unsigned char *)(v11 + 59)) {
    return 0;
  }
  uint64_t v12 = *(void *)(v11 + 24);
  if (!v12) {
    return 0;
  }
  unint64_t v13 = a2 - *(void *)(*(void *)(a1 + 240) + 232);
  switch(*(unsigned char *)(v11 + 57))
  {
    case 0:
      unsigned int v14 = *(unsigned __int8 *)(v12 + v13);
      if (v14 >= 0xF0) {
        return (v14 >> 2) & 1;
      }
      if (v14 > 3) {
        return 0;
      }
      uint64_t result = v14 & 1;
      break;
    case 1:
      unsigned int v16 = *(unsigned __int16 *)(v12 + 2 * v13);
      return (v16 >> 6) & 1;
    case 2:
      unsigned int v16 = *(_DWORD *)(v12 + 4 * v13);
      return (v16 >> 6) & 1;
    case 3:
      unsigned int v16 = *(unsigned __int8 *)(v12 + 24 * v13);
      return (v16 >> 6) & 1;
    default:
      return 0;
  }
  return result;
}

uint64_t _NSGlyphTreeDrawsOutsideLineFragmentForGlyphAtIndex(uint64_t a1, unint64_t a2)
{
  if (!_NSGlyphTreeMoveToGlyphIndex(a1, a2))
  {
    _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeDrawsOutsideLineFragmentForGlyphAtIndex invalid glyph index %lu", v4, v5, v6, v7, v8, v9, v10, a2);
    return 0;
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 240) + 216);
  if (!*(unsigned char *)(v11 + 59)) {
    return 0;
  }
  uint64_t v12 = *(void *)(v11 + 24);
  if (!v12) {
    return 0;
  }
  int v13 = *(unsigned __int8 *)(v11 + 57);
  unint64_t v14 = a2 - *(void *)(*(void *)(a1 + 240) + 232);
  if (v13 == 3)
  {
    unsigned int v15 = *(unsigned __int8 *)(v12 + 24 * v14);
    return (v15 >> 5) & 1;
  }
  if (v13 == 2)
  {
    unsigned int v15 = *(_DWORD *)(v12 + 4 * v14);
    return (v15 >> 5) & 1;
  }
  if (v13 != 1) {
    return 0;
  }
  unsigned int v15 = *(unsigned __int16 *)(v12 + 2 * v14);
  return (v15 >> 5) & 1;
}

uint64_t _NSGlyphTreeVirtualEllipsisAttributeForGlyphAtIndex(uint64_t a1, unint64_t a2)
{
  if (!_NSGlyphTreeMoveToGlyphIndex(a1, a2))
  {
    _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeDrawsOutsideLineFragmentForGlyphAtIndex invalid glyph index %lu", v4, v5, v6, v7, v8, v9, v10, a2);
    return 0;
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 240) + 216);
  if (!*(unsigned char *)(v11 + 59)) {
    return 0;
  }
  uint64_t v12 = *(void *)(v11 + 24);
  if (!v12) {
    return 0;
  }
  int v13 = *(unsigned __int8 *)(v11 + 57);
  unint64_t v14 = a2 - *(void *)(*(void *)(a1 + 240) + 232);
  switch(v13)
  {
    case 0:
      unsigned int v15 = 0;
      unsigned int v16 = *(unsigned __int8 *)(v12 + v14);
      if (v16 >= 4) {
        int v17 = v16;
      }
      else {
        int v17 = 0xFFFFFF;
      }
      if (v16 <= 0xEF) {
        int v18 = v17;
      }
      else {
        int v18 = v16 & 3;
      }
      break;
    case 1:
      unsigned int v20 = *(unsigned __int16 *)(v12 + 2 * v14);
      goto LABEL_17;
    case 2:
      unsigned int v20 = *(_DWORD *)(v12 + 4 * v14);
      goto LABEL_17;
    case 3:
      unsigned int v20 = *(_DWORD *)(v12 + 24 * v14);
LABEL_17:
      int v18 = v20 >> 8;
      if (v20 < 0x100) {
        int v18 = ((char)v20 >> 7) & 0xFFFFFF;
      }
      unsigned int v15 = (v20 >> 1) & 1;
      break;
    default:
      int v18 = 0;
      unsigned int v15 = 0;
      break;
  }
  if (v18 == 0xFFFFFF) {
    return v15;
  }
  else {
    return 0;
  }
}

unint64_t _NSGlyphTreeEllipsisGlyphIndexForTruncatedGlyphRange(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v5 = a3 + a2 - 1;
  if (!_NSGlyphTreeMoveToGlyphIndex(a1, v5))
  {
    _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeDrawsOutsideLineFragmentForGlyphAtIndex invalid glyph index %lu", v6, v7, v8, v9, v10, v11, v12, v5);
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v13 = *(void *)(a1 + 240) + 208;
  uint64_t v14 = *(void *)(*(void *)(a1 + 240) + 216);
  if (!*(unsigned char *)(v14 + 59)) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  while (1)
  {
    uint64_t v15 = *(void *)(v14 + 24);
    if (v5 <= a2 || !v15) {
      break;
    }
    unint64_t v16 = *(void *)(v13 + 24);
    if (v16 <= a2) {
      unint64_t v17 = a2;
    }
    else {
      unint64_t v17 = *(void *)(v13 + 24);
    }
    if (v17 < v5)
    {
      uint64_t v18 = v15 - v16;
      uint64_t v19 = v15 - 2 * v16;
      uint64_t v20 = v15 - 4 * v16;
      unsigned int v21 = (unsigned char *)(v15 + 24 * v5 - 24 * v16);
      unint64_t result = v5;
      while (2)
      {
        switch(*(unsigned char *)(v14 + 57))
        {
          case 0:
            unsigned int v23 = *(unsigned __int8 *)(v18 + result);
            if (v23 < 0xF0)
            {
              if (v23 > 3 || (v23 & 1) == 0)
              {
                unint64_t v5 = result;
                goto LABEL_33;
              }
            }
            else if ((v23 & 4) == 0)
            {
              goto LABEL_34;
            }
LABEL_24:
            --result;
            v21 -= 24;
            if (v17 < result) {
              continue;
            }
            unint64_t v5 = v17;
            break;
          case 1:
            if ((*(_WORD *)(v19 + 2 * result) & 0x40) == 0) {
              goto LABEL_34;
            }
            goto LABEL_24;
          case 2:
            if ((*(_DWORD *)(v20 + 4 * result) & 0x40) == 0) {
              goto LABEL_34;
            }
            goto LABEL_24;
          case 3:
            if ((*v21 & 0x40) == 0) {
              goto LABEL_34;
            }
            goto LABEL_24;
          default:
            goto LABEL_33;
        }
        break;
      }
    }
    if (v5 > a2) {
      _NSGlyphTreeMoveToGlyphIndex(a1, --v5);
    }
    uint64_t v13 = *(void *)(a1 + 240) + 208;
    uint64_t v14 = *(void *)(*(void *)(a1 + 240) + 216);
    unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
    if (!*(unsigned char *)(v14 + 59)) {
      return result;
    }
  }
LABEL_33:
  unint64_t result = v5;
  if (!v15) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_34:
  int v25 = *(unsigned __int8 *)(v14 + 57);
  unint64_t v26 = result - *(void *)(v13 + 24);
  if (v25 == 3)
  {
    if ((*(_DWORD *)(v15 + 24 * v26) & 2) != 0) {
      return result;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v25 == 2)
  {
    if ((*(_DWORD *)(v15 + 4 * v26) & 2) != 0) {
      return result;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v25 != 1 || (*(_WORD *)(v15 + 2 * v26) & 2) == 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

unint64_t _NSGlyphTreeGetCGGlyphsInRange(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t *a5, void *a6, unsigned char *a7)
{
  unint64_t v57 = a2 + a3;
  if (a2 < a2 + a3)
  {
    unint64_t v12 = 0;
    while (1)
    {
      unint64_t v58 = a2;
      if (!_NSGlyphTreeMoveToGlyphIndex(a1, a2)) {
        return v12;
      }
      uint64_t v19 = *(void *)(*(void *)(a1 + 240) + 216);
      unint64_t v20 = *(void *)(v19 + 8) + *(void *)(*(void *)(a1 + 240) + 232);
      if (v20 >= v57) {
        unint64_t v21 = v57;
      }
      else {
        unint64_t v21 = *(void *)(v19 + 8) + *(void *)(*(void *)(a1 + 240) + 232);
      }
      if (!*(unsigned char *)(v19 + 59) || !*(void *)(v19 + 24))
      {
        unint64_t v22 = *(void *)(v19 + 8) + *(void *)(*(void *)(a1 + 240) + 232);
        _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeGetGlyphsInRange missing glyphs", v13, v20, v14, v15, v16, v17, v18, v55);
        unint64_t v20 = v22;
      }
      if (!(a4 | (unint64_t)a5))
      {
        a4 = 0;
        a5 = 0;
        unint64_t v23 = v58;
        goto LABEL_71;
      }
      unint64_t v23 = v58;
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 240) + 216) + 57)) {
        break;
      }
      if (v21 > v58)
      {
        uint64_t v24 = 24 * v58;
        for (unint64_t i = v58; v21 != i; ++i)
        {
          uint64_t v26 = *(void *)(*(void *)(a1 + 240) + 216);
          LODWORD(v27) = *(unsigned __int8 *)(v26 + 59);
          if (*(unsigned char *)(v26 + 59))
          {
            uint64_t v27 = *(void *)(v26 + 24);
            if (v27)
            {
              uint64_t v28 = *(void *)(*(void *)(a1 + 240) + 232);
              switch(*(unsigned char *)(v26 + 57))
              {
                case 0:
                  unsigned int v29 = *(unsigned __int8 *)(v27 - v28 + i);
                  if (v29 >= 4) {
                    int v30 = v29;
                  }
                  else {
                    int v30 = 0xFFFFFF;
                  }
                  if (v29 <= 0xEF) {
                    LODWORD(v27) = v30;
                  }
                  else {
                    LODWORD(v27) = v29 & 3;
                  }
                  if (a4) {
                    goto LABEL_33;
                  }
                  goto LABEL_34;
                case 1:
                  unsigned int v31 = *(unsigned __int16 *)(v27 - 2 * v28 + 2 * i);
                  goto LABEL_30;
                case 2:
                  unsigned int v31 = *(_DWORD *)(v27 - 4 * v28 + 4 * i);
                  goto LABEL_30;
                case 3:
                  unsigned int v31 = *(_DWORD *)(v27 - 24 * v28 + v24);
LABEL_30:
                  if (v31 <= 0xFF)
                  {
                    LODWORD(v27) = ((char)v31 >> 7) & 0xFFFFFF;
                    break;
                  }
                  LODWORD(v27) = v31 >> 8;
                  if (!a4) {
                    goto LABEL_34;
                  }
                  goto LABEL_33;
                default:
                  LODWORD(v27) = 0;
                  if (a4) {
                    goto LABEL_33;
                  }
                  goto LABEL_34;
              }
            }
          }
          if (a4)
          {
LABEL_33:
            *(_WORD *)a4 = v27;
            a4 += 2;
          }
LABEL_34:
          if (a5)
          {
            if (v27 == 0xFFFFFF) {
              uint64_t v32 = 2;
            }
            else {
              uint64_t v32 = v27 == 0;
            }
            uint64_t v33 = *(void *)(*(void *)(a1 + 240) + 216);
            if (*(unsigned char *)(v33 + 59))
            {
              uint64_t v34 = *(void *)(v33 + 24);
              if (v34)
              {
                uint64_t v35 = *(void *)(*(void *)(a1 + 240) + 232);
                uint64_t v36 = *(unsigned __int8 *)(v33 + 57);
                switch(*(unsigned char *)(v33 + 57))
                {
                  case 0:
                    unsigned int v37 = *(unsigned __int8 *)(v34 - v35 + i);
                    if (v37 < 0xF0)
                    {
                      if (v37 <= 3 && (v37 & 2) != 0)
                      {
LABEL_56:
                        uint64_t v36 = 0;
                        goto LABEL_57;
                      }
                    }
                    else if ((v37 & 8) != 0)
                    {
                      goto LABEL_56;
                    }
                    break;
                  case 1:
                    if ((*(_WORD *)(v34 - 2 * v35 + 2 * i) & 0x10) == 0) {
                      goto LABEL_61;
                    }
                    uint64_t v36 = 1;
                    goto LABEL_57;
                  case 2:
                    if ((*(_DWORD *)(v34 - 4 * v35 + 4 * i) & 0x10) == 0) {
                      goto LABEL_65;
                    }
                    uint64_t v36 = 2;
                    goto LABEL_57;
                  case 3:
                    if ((*(_DWORD *)(v34 - 24 * v35 + v24) & 0x10) == 0) {
                      goto LABEL_63;
                    }
                    uint64_t v36 = 3;
LABEL_57:
                    v32 |= 4uLL;
LABEL_58:
                    if (v36 == 3)
                    {
LABEL_63:
                      if ((*(_DWORD *)(v34 - 24 * v35 + v24) & 1) == 0) {
                        break;
                      }
LABEL_66:
                      v32 |= 8uLL;
                      break;
                    }
                    if (v36 == 2)
                    {
LABEL_65:
                      if ((*(_DWORD *)(v34 - 4 * v35 + 4 * i) & 1) == 0) {
                        break;
                      }
                      goto LABEL_66;
                    }
                    if (v36 != 1) {
                      break;
                    }
LABEL_61:
                    if (*(_WORD *)(v34 - 2 * v35 + 2 * i)) {
                      goto LABEL_66;
                    }
                    break;
                  default:
                    goto LABEL_58;
                }
              }
            }
            *a5++ = v32;
          }
          v24 += 24;
        }
      }
LABEL_71:
      if (a6)
      {
        uint64_t v39 = *(void *)(*(void *)(a1 + 240) + 216);
        if (*(unsigned char *)(v39 + 59) && *(void *)(v39 + 32))
        {
          if (v21 > v23)
          {
            unint64_t v40 = v23;
            while (1)
            {
              uint64_t v41 = *(void *)(*(void *)(a1 + 240) + 232);
              uint64_t v42 = *(void *)(*(void *)(a1 + 240) + 216);
              if (!*(unsigned char *)(v42 + 59)) {
                break;
              }
              uint64_t v43 = *(void *)(v42 + 32);
              if (v43)
              {
                int v44 = *(unsigned __int8 *)(v42 + 58);
                if (v44 == 2)
                {
                  uint64_t v43 = *(int *)(v43 - 4 * v41 + 4 * v40);
                  goto LABEL_83;
                }
                if (v44 == 1)
                {
                  uint64_t v43 = *(__int16 *)(v43 - 2 * v41 + 2 * v40);
                  goto LABEL_83;
                }
                if (v44) {
                  break;
                }
                uint64_t v43 = *(char *)(v43 - v41 + v40);
              }
LABEL_83:
              *a6++ = v40 + *(void *)(*(void *)(a1 + 240) + 224) - v43 - v41;
              if (v21 == ++v40) {
                goto LABEL_90;
              }
            }
            uint64_t v43 = 0;
            goto LABEL_83;
          }
        }
        else if (v21 > v23)
        {
          unint64_t v45 = v23;
          do
          {
            *a6++ = v45 + *(void *)(*(void *)(a1 + 240) + 224) - *(void *)(*(void *)(a1 + 240) + 232);
            ++v45;
          }
          while (v21 != v45);
        }
      }
LABEL_90:
      if (a7)
      {
        if (*(void *)(*(void *)(*(void *)(a1 + 240) + 216) + 40))
        {
          unint64_t v46 = v23;
          if (v21 > v23)
          {
            do
              *a7++ = *(unsigned char *)(*(void *)(*(void *)(*(void *)(a1 + 240) + 216) + 40)
                               - *(void *)(*(void *)(a1 + 240) + 232)
                               + v46++);
            while (v21 != v46);
          }
        }
        else
        {
          unint64_t v47 = v12;
          unint64_t v48 = v21 - v23;
          if (v21 > v23)
          {
            unint64_t v56 = v20;
            bzero(a7, v21 - v23);
            unint64_t v20 = v56;
            unint64_t v23 = v58;
            a7 += v48;
          }
          unint64_t v12 = v47;
        }
      }
      unint64_t v12 = v12 - v23 + v21;
      a2 = v21;
      if (v57 <= v20) {
        return v12;
      }
    }
    if (v21 <= v58) {
      goto LABEL_71;
    }
    unint64_t v49 = v58;
    while (1)
    {
      uint64_t v50 = *(void *)(*(void *)(a1 + 240) + 216);
      if (*(unsigned char *)(v50 + 59))
      {
        uint64_t v51 = *(void *)(v50 + 24);
        if (v51)
        {
          unsigned int v52 = *(unsigned __int8 *)(v51 - *(void *)(*(void *)(a1 + 240) + 232) + v49);
          if (v52 < 0xF0)
          {
            if (v52 > 3)
            {
              LODWORD(v51) = 0;
            }
            else
            {
              LODWORD(v51) = (v52 >> 1) & 1;
              unsigned int v52 = 0xFFFFFF;
            }
          }
          else
          {
            LODWORD(v51) = (v52 >> 3) & 1;
            v52 &= 3u;
          }
          goto LABEL_108;
        }
      }
      else
      {
        LODWORD(v51) = 0;
      }
      unsigned int v52 = 0;
LABEL_108:
      if (a4)
      {
        *(_WORD *)a4 = v52;
        a4 += 2;
      }
      if (a5)
      {
        if (v52 == 0xFFFFFF) {
          uint64_t v53 = 2;
        }
        else {
          uint64_t v53 = v52 == 0;
        }
        if (v51) {
          v53 |= 4uLL;
        }
        *a5++ = v53;
      }
      if (v21 == ++v49) {
        goto LABEL_71;
      }
    }
  }
  return 0;
}

unint64_t _NSGlyphTreeGetGlyphsInRange(uint64_t a1, unint64_t a2, uint64_t a3, unsigned int *a4, void *a5, void *a6, unsigned char *a7, unsigned char *a8)
{
  unint64_t v8 = a2 + a3;
  if (a2 < a2 + a3)
  {
    unint64_t v62 = 0;
    unint64_t v60 = a2 + a3;
    while (1)
    {
      unint64_t v61 = a2;
      if (!_NSGlyphTreeMoveToGlyphIndex(a1, a2)) {
        return v62;
      }
      uint64_t v22 = *(void *)(*(void *)(a1 + 240) + 232);
      uint64_t v23 = *(void *)(*(void *)(a1 + 240) + 216);
      uint64_t v24 = *(void *)(v23 + 8);
      unint64_t v25 = v24 + v22;
      if (v24 + v22 < v8) {
        unint64_t v8 = v24 + v22;
      }
      if (!*(unsigned char *)(v23 + 59) || !*(void *)(v23 + 24))
      {
        unint64_t v26 = v24 + v22;
        _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeGetGlyphsInRange missing glyphs", v15, v16, v17, v18, v19, v20, v21, v59);
        unint64_t v25 = v26;
      }
      if (!a4 && !a6 && !a7)
      {
        a4 = 0;
        a6 = 0;
        unint64_t v27 = v61;
        goto LABEL_87;
      }
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 240) + 216) + 57)) {
        break;
      }
      unint64_t v27 = v61;
      if (v8 > v61)
      {
        uint64_t v28 = 24 * v61;
        for (unint64_t i = v61; v8 != i; ++i)
        {
          if (a4)
          {
            uint64_t v30 = *(void *)(*(void *)(a1 + 240) + 216);
            LODWORD(v31) = *(unsigned __int8 *)(v30 + 59);
            if (*(unsigned char *)(v30 + 59))
            {
              uint64_t v31 = *(void *)(v30 + 24);
              if (v31)
              {
                uint64_t v32 = *(void *)(*(void *)(a1 + 240) + 232);
                switch(*(unsigned char *)(v30 + 57))
                {
                  case 0:
                    unsigned int v33 = *(unsigned __int8 *)(v31 - v32 + i);
                    if (v33 >= 4) {
                      int v34 = v33;
                    }
                    else {
                      int v34 = 0xFFFFFF;
                    }
                    if (v33 <= 0xEF) {
                      LODWORD(v31) = v34;
                    }
                    else {
                      LODWORD(v31) = v33 & 3;
                    }
                    break;
                  case 1:
                    unsigned int v35 = *(unsigned __int16 *)(v31 - 2 * v32 + 2 * i);
                    goto LABEL_30;
                  case 2:
                    unsigned int v35 = *(_DWORD *)(v31 - 4 * v32 + 4 * i);
                    goto LABEL_30;
                  case 3:
                    unsigned int v35 = *(_DWORD *)(v31 - 24 * v32 + v28);
LABEL_30:
                    if (v35 > 0xFF) {
                      LODWORD(v31) = v35 >> 8;
                    }
                    else {
                      LODWORD(v31) = ((char)v35 >> 7) & 0xFFFFFF;
                    }
                    break;
                  default:
                    LODWORD(v31) = 0;
                    break;
                }
              }
            }
            *a4++ = v31;
          }
          if (!a6) {
            goto LABEL_46;
          }
          uint64_t v36 = *(void *)(*(void *)(a1 + 240) + 216);
          LODWORD(v37) = *(unsigned __int8 *)(v36 + 59);
          if (*(unsigned char *)(v36 + 59))
          {
            uint64_t v37 = *(void *)(v36 + 24);
            if (v37)
            {
              uint64_t v38 = *(void *)(*(void *)(a1 + 240) + 232);
              int v39 = *(unsigned __int8 *)(v36 + 57);
              switch(v39)
              {
                case 3:
                  LOBYTE(v37) = *(unsigned char *)(v37 - 24 * v38 + v28);
                  break;
                case 2:
                  LODWORD(v37) = *(_DWORD *)(v37 - 4 * v38 + 4 * i);
                  break;
                case 1:
                  LOWORD(v37) = *(_WORD *)(v37 - 2 * v38 + 2 * i);
                  break;
                default:
                  LODWORD(v37) = 0;
                  goto LABEL_45;
              }
              LODWORD(v37) = v37 & 1;
            }
          }
LABEL_45:
          *a6++ = v37;
LABEL_46:
          if (a7)
          {
            uint64_t v40 = *(void *)(*(void *)(a1 + 240) + 216);
            LOBYTE(v41) = *(unsigned char *)(v40 + 59);
            if ((_BYTE)v41)
            {
              uint64_t v41 = *(void *)(v40 + 24);
              if (v41)
              {
                uint64_t v42 = *(void *)(*(void *)(a1 + 240) + 232);
                switch(*(unsigned char *)(v40 + 57))
                {
                  case 0:
                    unsigned int v43 = *(unsigned __int8 *)(v41 - v42 + i);
                    if (v43 < 0xF0)
                    {
                      if (v43 > 3) {
                        goto LABEL_58;
                      }
                      LODWORD(v41) = (v43 >> 1) & 1;
                    }
                    else
                    {
                      LODWORD(v41) = (v43 >> 3) & 1;
                    }
                    break;
                  case 1:
                    unsigned int v44 = *(unsigned __int16 *)(v41 - 2 * v42 + 2 * i);
                    goto LABEL_55;
                  case 2:
                    unsigned int v44 = *(_DWORD *)(v41 - 4 * v42 + 4 * i);
                    goto LABEL_55;
                  case 3:
                    unsigned int v44 = *(unsigned __int8 *)(v41 - 24 * v42 + v28);
LABEL_55:
                    LODWORD(v41) = (v44 >> 4) & 1;
                    break;
                  default:
LABEL_58:
                    LOBYTE(v41) = 0;
                    break;
                }
              }
            }
            *a7++ = v41;
          }
          v28 += 24;
        }
      }
LABEL_87:
      if (a5)
      {
        uint64_t v49 = *(void *)(*(void *)(a1 + 240) + 216);
        if (*(unsigned char *)(v49 + 59) && *(void *)(v49 + 32))
        {
          if (v8 > v27)
          {
            unint64_t v50 = v27;
            while (1)
            {
              uint64_t v51 = *(void *)(*(void *)(a1 + 240) + 232);
              uint64_t v52 = *(void *)(*(void *)(a1 + 240) + 216);
              if (!*(unsigned char *)(v52 + 59)) {
                break;
              }
              uint64_t v53 = *(void *)(v52 + 32);
              if (v53)
              {
                int v54 = *(unsigned __int8 *)(v52 + 58);
                if (v54 == 2)
                {
                  uint64_t v53 = *(int *)(v53 - 4 * v51 + 4 * v50);
                  goto LABEL_99;
                }
                if (v54 == 1)
                {
                  uint64_t v53 = *(__int16 *)(v53 - 2 * v51 + 2 * v50);
                  goto LABEL_99;
                }
                if (v54) {
                  break;
                }
                uint64_t v53 = *(char *)(v53 - v51 + v50);
              }
LABEL_99:
              *a5++ = v50 + *(void *)(*(void *)(a1 + 240) + 224) - v53 - v51;
              if (v8 == ++v50) {
                goto LABEL_106;
              }
            }
            uint64_t v53 = 0;
            goto LABEL_99;
          }
        }
        else if (v8 > v27)
        {
          unint64_t v55 = v27;
          do
          {
            *a5++ = v55 + *(void *)(*(void *)(a1 + 240) + 224) - *(void *)(*(void *)(a1 + 240) + 232);
            ++v55;
          }
          while (v8 != v55);
        }
      }
LABEL_106:
      if (a8)
      {
        if (*(void *)(*(void *)(*(void *)(a1 + 240) + 216) + 40))
        {
          unint64_t v56 = v27;
          if (v8 > v27)
          {
            do
              *a8++ = *(unsigned char *)(*(void *)(*(void *)(*(void *)(a1 + 240) + 216) + 40)
                               - *(void *)(*(void *)(a1 + 240) + 232)
                               + v56++);
            while (v8 != v56);
          }
        }
        else
        {
          unint64_t v57 = v8 - v27;
          if (v8 > v27)
          {
            unint64_t v59 = v25;
            bzero(a8, v8 - v27);
            unint64_t v25 = v59;
            unint64_t v27 = v61;
            a8 += v57;
          }
        }
      }
      unint64_t v62 = v62 - v27 + v8;
      a2 = v8;
      unint64_t v8 = v60;
      if (v60 <= v25) {
        return v62;
      }
    }
    unint64_t v27 = v61;
    if (v8 <= v61) {
      goto LABEL_87;
    }
    unint64_t v45 = v61;
    while (1)
    {
      uint64_t v46 = *(void *)(*(void *)(a1 + 240) + 216);
      if (*(unsigned char *)(v46 + 59))
      {
        uint64_t v47 = *(void *)(v46 + 24);
        if (v47)
        {
          unsigned int v48 = *(unsigned __int8 *)(v47 - *(void *)(*(void *)(a1 + 240) + 232) + v45);
          if (v48 < 0xF0)
          {
            if (v48 > 3)
            {
              LOBYTE(v47) = 0;
            }
            else
            {
              LODWORD(v47) = (v48 >> 1) & 1;
              unsigned int v48 = 0xFFFFFF;
            }
          }
          else
          {
            LODWORD(v47) = (v48 >> 3) & 1;
            v48 &= 3u;
          }
          goto LABEL_70;
        }
      }
      else
      {
        LOBYTE(v47) = 0;
      }
      unsigned int v48 = 0;
LABEL_70:
      if (a4) {
        *a4 = v48;
      }
      if (a7) {
        *a7 = v47;
      }
      if (a4) {
        ++a4;
      }
      else {
        a4 = 0;
      }
      if (a6) {
        *a6++ = 0;
      }
      if (a7) {
        ++a7;
      }
      else {
        a7 = 0;
      }
      if (v8 == ++v45) {
        goto LABEL_87;
      }
    }
  }
  return 0;
}

uint64_t _NSGlyphTreeGetShownGlyphsInRange(uint64_t a1, unint64_t a2, uint64_t a3, int *a4)
{
  unint64_t v5 = a2 + a3;
  if (a2 >= a2 + a3)
  {
    uint64_t v8 = 0;
  }
  else
  {
    unint64_t v6 = a2;
    uint64_t v8 = 0;
    do
    {
      if (!_NSGlyphTreeMoveToGlyphIndex(a1, v6)) {
        break;
      }
      uint64_t v16 = *(void *)(*(void *)(a1 + 240) + 232);
      uint64_t v17 = *(void *)(*(void *)(a1 + 240) + 216);
      uint64_t v18 = *(void *)(v17 + 8);
      unint64_t v19 = v18 + v16;
      if (v18 + v16 >= v5) {
        unint64_t v20 = v5;
      }
      else {
        unint64_t v20 = v18 + v16;
      }
      if (!*(unsigned char *)(v17 + 59) || !*(void *)(v17 + 24)) {
        _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeGetShownGlyphsInRange missing glyphs", v9, v10, v11, v12, v13, v14, v15, v33);
      }
      if (v6 < v20)
      {
        uint64_t v21 = 24 * v6;
        do
        {
          uint64_t v22 = *(void *)(*(void *)(a1 + 240) + 216);
          if (*(unsigned char *)(v22 + 59))
          {
            uint64_t v23 = *(void *)(v22 + 24);
            if (v23)
            {
              uint64_t v24 = *(void *)(*(void *)(a1 + 240) + 232);
              switch(*(unsigned char *)(v22 + 57))
              {
                case 0:
                  uint64_t v25 = v23 - v24;
                  unsigned int v26 = *(unsigned __int8 *)(v25 + v6);
                  if (v26 < 0xF0)
                  {
                    if (v26 > 3 || (v26 & 1) == 0)
                    {
LABEL_32:
                      unsigned int v30 = *(unsigned __int8 *)(v25 + v6);
                      if (v30 >= 4) {
                        int v31 = v30;
                      }
                      else {
                        int v31 = 0xFFFFFF;
                      }
                      if (v30 <= 0xEF) {
                        int v28 = v31;
                      }
                      else {
                        int v28 = v30 & 3;
                      }
                      goto LABEL_38;
                    }
                  }
                  else if ((v26 & 4) == 0)
                  {
                    goto LABEL_32;
                  }
                  break;
                case 1:
                  unsigned int v27 = *(unsigned __int16 *)(v23 - 2 * v24 + 2 * v6);
                  if ((v27 & 0x40) != 0) {
                    break;
                  }
                  goto LABEL_23;
                case 2:
                  unsigned int v27 = *(_DWORD *)(v23 - 4 * v24 + 4 * v6);
                  if ((v27 & 0x40) != 0) {
                    break;
                  }
                  goto LABEL_23;
                case 3:
                  unsigned int v27 = *(_DWORD *)(v23 - 24 * v24 + v21);
                  if ((v27 & 0x40) != 0) {
                    break;
                  }
LABEL_23:
                  if (v27 <= 0xFF)
                  {
                    if ((v27 & 0x80) == 0) {
                      break;
                    }
                    int v28 = 0xFFFFFF;
LABEL_39:
                    if (a4) {
                      *a4++ = v28;
                    }
                    ++v8;
                    break;
                  }
                  int v28 = v27 >> 8;
LABEL_38:
                  if (v28) {
                    goto LABEL_39;
                  }
                  break;
                default:
                  break;
              }
            }
          }
          ++v6;
          v21 += 24;
        }
        while (v20 != v6);
      }
      unint64_t v6 = v20;
    }
    while (v5 > v19);
  }
  if (a4) {
    *a4 = 0;
  }
  return v8;
}

uint64_t _NSGlyphTreeGetPackedGlyphsInRange(uint64_t a1, unint64_t a2, uint64_t a3, _WORD *a4)
{
  unint64_t v4 = a2 + a3;
  if (a2 >= a2 + a3) {
    return 0;
  }
  unint64_t v6 = a2;
  uint64_t v8 = 0;
  do
  {
    if (!_NSGlyphTreeMoveToGlyphIndex(a1, v6)) {
      break;
    }
    uint64_t v16 = *(void *)(*(void *)(a1 + 240) + 232);
    uint64_t v17 = *(void *)(*(void *)(a1 + 240) + 216);
    uint64_t v18 = *(void *)(v17 + 8);
    unint64_t v19 = v18 + v16;
    if (v18 + v16 >= v4) {
      unint64_t v20 = v4;
    }
    else {
      unint64_t v20 = v18 + v16;
    }
    if (!*(unsigned char *)(v17 + 59) || !*(void *)(v17 + 24)) {
      _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeGetShownGlyphsInRange missing glyphs", v9, v10, v11, v12, v13, v14, v15, v33);
    }
    if (v6 < v20)
    {
      uint64_t v21 = 24 * v6;
      do
      {
        uint64_t v22 = *(void *)(*(void *)(a1 + 240) + 216);
        LODWORD(v23) = *(unsigned __int8 *)(v22 + 59);
        if (*(unsigned char *)(v22 + 59) && (uint64_t v23 = *(void *)(v22 + 24)) != 0)
        {
          uint64_t v24 = *(void *)(*(void *)(a1 + 240) + 232);
          switch(*(unsigned char *)(v22 + 57))
          {
            case 0:
              uint64_t v25 = v23 - v24;
              unsigned int v26 = *(unsigned __int8 *)(v25 + v6);
              if (v26 < 0xF0)
              {
                if (v26 <= 3 && (v26 & 1) != 0) {
                  goto LABEL_35;
                }
              }
              else if ((v26 & 4) != 0)
              {
                goto LABEL_35;
              }
              unsigned int v30 = *(unsigned __int8 *)(v25 + v6);
              if (v30 >= 4) {
                int v31 = v30;
              }
              else {
                int v31 = 0xFFFFFF;
              }
              if (v30 <= 0xEF) {
                LODWORD(v23) = v31;
              }
              else {
                LODWORD(v23) = v30 & 3;
              }
              if (a4) {
                goto LABEL_30;
              }
              break;
            case 1:
              unsigned int v27 = *(unsigned __int16 *)(v23 - 2 * v24 + 2 * v6);
              if ((v27 & 0x40) != 0) {
                goto LABEL_35;
              }
              goto LABEL_25;
            case 2:
              unsigned int v27 = *(_DWORD *)(v23 - 4 * v24 + 4 * v6);
              if ((v27 & 0x40) != 0) {
                goto LABEL_35;
              }
              goto LABEL_25;
            case 3:
              unsigned int v27 = *(_DWORD *)(v23 - 24 * v24 + v21);
              if ((v27 & 0x40) != 0) {
                goto LABEL_35;
              }
LABEL_25:
              if (v27 > 0xFF)
              {
                LODWORD(v23) = v27 >> 8;
                goto LABEL_29;
              }
              LODWORD(v23) = ((char)v27 >> 7) & 0xFFFFFF;
              if (a4) {
                goto LABEL_30;
              }
              break;
            default:
              LODWORD(v23) = 0;
              if (!a4) {
                break;
              }
              goto LABEL_30;
          }
        }
        else
        {
LABEL_29:
          if (a4)
          {
LABEL_30:
            if (v23 == 0xFFFFFF) {
              __int16 v28 = 0;
            }
            else {
              __int16 v28 = v23;
            }
            *a4++ = v28;
          }
        }
        ++v8;
LABEL_35:
        ++v6;
        v21 += 24;
      }
      while (v20 != v6);
    }
    unint64_t v6 = v20;
  }
  while (v4 > v19);
  return v8;
}

uint64_t _NSGlyphTreePrepareToInvalidateGlyphsForCharacterRange(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(*(void *)(result + 240) + 496) = a4;
  return result;
}

void _NSGlyphTreeInvalidateGlyphsForCharacterRange(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a4) {
    int v9 = 0;
  }
  else {
    int v9 = a5;
  }
  int v143 = v9;
  if (!(a3 | a4)) {
    return;
  }
  uint64_t v10 = a4;
  unint64_t v11 = a2;
  uint64_t v12 = a1;
  uint64_t v13 = &OBJC_IVAR___NSExtraLMData__glyphTree;
  uint64_t v14 = *(uint64_t **)(*(void *)(a1 + 240) + 208);
  if (v143)
  {
    if ((v14[7] & 0x24) == 0) {
      return;
    }
  }
  uint64_t v137 = v14[1];
  uint64_t v138 = *v14;
  unint64_t v15 = a2 + a3;
  uint64_t v16 = a3 + a4;
  uint64_t v135 = _NSGlyphTreeGlyphIndexForCharacterAtIndex(a1, a2);
  uint64_t v136 = v16;
  uint64_t v139 = v10;
  if (v11 < v15)
  {
    char v140 = 0;
    uint64_t v142 = v12;
    while (1)
    {
      uint64_t v24 = v16 - (v15 - v11);
      if (_NSGlyphTreeMoveToCharacterIndex(v12, v11))
      {
        uint64_t v25 = v13;
        uint64_t v26 = *(void *)(v12 + 240) + *v13;
        __int16 v28 = *(int64x2_t **)(v26 + 8);
        unint64_t v27 = *(void *)(v26 + 16);
        unint64_t v29 = v28->i64[0];
        unint64_t v30 = v28->i64[0] + v27;
        unint64_t v31 = v30 - v11;
        if (v15 <= v30) {
          unint64_t v31 = v15 - v11;
        }
        else {
          uint64_t v24 = v16 - (v30 - v11);
        }
        if (v143 && (v28[3].i8[8] & 0x24) == 0) {
          goto LABEL_34;
        }
        if (v28[3].i8[11] && v28[1].i64[1])
        {
          if (v11 <= v27)
          {
            if (v11)
            {
              unint64_t v45 = v31 + v11;
              uint64_t v46 = v30 - v45;
              if (v30 <= v45)
              {
                uint64_t v12 = v142;
                _NSGlyphTreeDeleteCurrentNode(v142, v17, v46, v19, v20, v21, v22, v23);
                uint64_t v13 = v25;
                if (!v16) {
                  goto LABEL_62;
                }
              }
              else
              {
                _NSGlyphNodeTruncate(v28, v45 - v27, v46);
                uint64_t v13 = v25;
                uint64_t v12 = v142;
                if (!v16) {
                  goto LABEL_62;
                }
              }
              if (!_NSGlyphTreeMoveToCharacterIndex(v12, v11 - 1))
              {
                _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeInvalidateGlyphsForCharacterRange found invalid char index", v62, v63, v64, v65, v66, v67, v68, v135);
LABEL_62:
                char v140 = 1;
                goto LABEL_63;
              }
              uint64_t v69 = *(int64x2_t **)(*(void *)(v12 + 240) + *v13 + 8);
              if (!v69[3].i8[11])
              {
                uint64_t v77 = 0;
                uint64_t v78 = &v69[1].i8[8];
                uint64_t v141 = v69->i64[0];
                do
                {
                  uint64_t v79 = *(unsigned char **)&v78[v77];
                  if (v79)
                  {
                    _NSGlyphNodeFree(v79);
                    *(void *)&v78[v77] = 0;
                  }
                  v77 += 8;
                }
                while (v77 != 24);
                uint64_t v13 = v25;
                uint64_t v80 = v141;
                uint64_t v12 = v142;
                goto LABEL_66;
              }
              if (!v69[1].i64[1])
              {
                uint64_t v80 = v69->i64[0];
LABEL_66:
                uint64_t v81 = v80 + v16;
                char v140 = 1;
                v69[3].i8[11] = 1;
                v69[3].i8[8] = v81 != 0;
                v69->i64[0] = v81;
                v69->i64[1] = v81;
                _NSGlyphNodeSetCapacity((uint64_t)v69, 0);
                _NSGlyphNodeSetInvariants(v69);
                goto LABEL_63;
              }
              uint64_t v70 = malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
              v70[59] = 1;
              *(void *)uint64_t v70 = v16;
              *((void *)v70 + 1) = v16;
              v70[56] = 1;
              _NSGlyphTreeInsertNodeAfterCurrentNode(v12, (uint64_t)v70, v71, v72, v73, v74, v75, v76);
              goto LABEL_51;
            }
            uint64_t v54 = v30 - v31;
            if (v30 <= v31)
            {
              uint64_t v13 = v25;
              if (!v16)
              {
                uint64_t v12 = v142;
                _NSGlyphTreeDeleteCurrentNode(v142, v17, v54, v19, v20, v21, v22, v23);
                goto LABEL_62;
              }
              v28[3].i8[11] = 1;
              char v140 = 1;
              v28[3].i8[8] = 1;
              v28->i64[0] = v16;
              v28->i64[1] = v16;
              _NSGlyphNodeSetCapacity((uint64_t)v28, 0);
              _NSGlyphNodeSetInvariants(v28);
            }
            else
            {
              _NSGlyphNodeTruncate(v28, v31 - v27, v54);
              uint64_t v13 = v25;
              if (v16)
              {
                unint64_t v55 = (int64x2_t *)malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
                v55[3].i8[11] = 1;
                v55->i64[0] = v16;
                v55->i64[1] = v16;
                v55[3].i8[8] = 1;
                uint64_t v12 = v142;
                _NSGlyphTreeInsertNodeBeforeCurrentNode(v142, v55, v56, v57, v58, v59, v60, v61);
LABEL_51:
                char v140 = 1;
                goto LABEL_63;
              }
              char v140 = 1;
            }
          }
          else
          {
            unint64_t v32 = v31 + v11;
            if (v30 <= v32)
            {
              uint64_t v13 = v25;
            }
            else
            {
              SubNode = _NSGlyphNodeCreateSubNode((uint64_t)v28, v32 - v27, v30 - v32);
              _NSGlyphTreeInsertNodeAfterCurrentNode(v142, (uint64_t)SubNode, v34, v35, v36, v37, v38, v39);
              uint64_t v13 = v25;
              uint64_t v40 = *(void *)(v142 + 240) + *v25;
              __int16 v28 = *(int64x2_t **)(v40 + 8);
              unint64_t v27 = *(void *)(v40 + 16);
            }
            _NSGlyphNodeTruncate(v28, 0, v11 - v27);
            char v140 = 1;
            if (v16)
            {
              uint64_t v47 = malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
              v47[59] = 1;
              *(void *)uint64_t v47 = v16;
              *((void *)v47 + 1) = v16;
              v47[56] = 1;
              uint64_t v12 = v142;
              _NSGlyphTreeInsertNodeAfterCurrentNode(v142, (uint64_t)v47, v48, v49, v50, v51, v52, v53);
              goto LABEL_63;
            }
          }
          goto LABEL_35;
        }
        if (!v24)
        {
          char v140 = 1;
LABEL_34:
          uint64_t v13 = v25;
LABEL_35:
          uint64_t v12 = v142;
          goto LABEL_63;
        }
        if (v24 > 0 || v29 > -v24)
        {
          if (!v28[3].i8[11])
          {
            uint64_t v42 = 0;
            unsigned int v43 = &v28[1].i8[8];
            do
            {
              unsigned int v44 = *(unsigned char **)&v43[v42];
              if (v44)
              {
                _NSGlyphNodeFree(v44);
                *(void *)&v43[v42] = 0;
              }
              v42 += 8;
            }
            while (v42 != 24);
          }
          char v140 = 1;
          v28[3].i8[11] = 1;
          v28[3].i8[8] = v24 + v29 != 0;
          v28->i64[0] = v24 + v29;
          v28->i64[1] = v24 + v29;
          _NSGlyphNodeSetCapacity((uint64_t)v28, 0);
          _NSGlyphNodeSetInvariants(v28);
          goto LABEL_34;
        }
        uint64_t v12 = v142;
        _NSGlyphTreeDeleteCurrentNode(v142, v17, v18, v19, v20, v21, v22, v23);
        char v140 = 1;
        uint64_t v13 = v25;
      }
      else
      {
        _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeInvalidateGlyphsForCharacterRange invalid char range 1", v17, v18, v19, v20, v21, v22, v23, v135);
      }
LABEL_63:
      v11 += v16;
      v15 += v24;
      v10 -= v24;
      uint64_t v16 = 0;
      if (v11 >= v15) {
        goto LABEL_68;
      }
    }
  }
  char v140 = 0;
LABEL_68:
  if (v10 < 1)
  {
    uint64_t v93 = v136;
    uint64_t v92 = v137;
    uint64_t v89 = v138;
    if (v10 < 0) {
      _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeInvalidateGlyphsForCharacterRange invalid change in length", v17, v18, v19, v20, v21, v22, v23, v135);
    }
    goto LABEL_108;
  }
  if (v11)
  {
    uint64_t v89 = v138;
    if (_NSGlyphTreeMoveToCharacterIndex(v12, v11 - 1))
    {
      uint64_t v90 = *(void *)(v12 + 240) + *v13;
      uint64_t v91 = *(void *)(v90 + 8);
      uint64_t v93 = v136;
      uint64_t v92 = v137;
      if (*(unsigned char *)(v91 + 59))
      {
        if (*(void *)(v91 + 24))
        {
          uint64_t v94 = *(void *)(v90 + 16);
          unint64_t v95 = *(void *)v91 + v94;
          if (v95 > v11)
          {
            char v96 = _NSGlyphNodeCreateSubNode(v91, v11 - v94, v95 - v11);
            _NSGlyphTreeInsertNodeAfterCurrentNode(v12, (uint64_t)v96, v97, v98, v99, v100, v101, v102);
            uint64_t v103 = *(void *)(v12 + 240) + *v13;
            _NSGlyphNodeTruncate(*(int64x2_t **)(v103 + 8), 0, v11 - *(void *)(v103 + 16));
          }
          int v104 = malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
          v104[59] = 1;
          *(void *)int v104 = v10;
          *((void *)v104 + 1) = v10;
          v104[56] = 1;
          _NSGlyphTreeInsertNodeAfterCurrentNode(v12, (uint64_t)v104, v105, v106, v107, v108, v109, v110);
          goto LABEL_108;
        }
        uint64_t v126 = *(void *)v91;
      }
      else
      {
        uint64_t v124 = 0;
        uint64_t v125 = v91 + 24;
        uint64_t v126 = *(void *)v91;
        do
        {
          long long v127 = *(unsigned char **)(v125 + v124);
          if (v127)
          {
            _NSGlyphNodeFree(v127);
            *(void *)(v125 + v124) = 0;
          }
          v124 += 8;
        }
        while (v124 != 24);
      }
      *(unsigned char *)(v91 + 59) = 1;
      *(unsigned char *)(v91 + 56) = v126 + v10 != 0;
      *(void *)uint64_t v91 = v126 + v10;
      *(void *)(v91 + _Block_object_dispose(&STACK[0x2B0], 8) = v126 + v10;
      _NSGlyphNodeSetCapacity(v91, 0);
      uint64_t v128 = (int64x2_t *)v91;
      goto LABEL_107;
    }
    uint64_t v120 = @"!!! _NSGlyphTreeInvalidateGlyphsForCharacterRange invalid char range 2";
    goto LABEL_96;
  }
  uint64_t v111 = (void *)(*(void *)(v12 + 240) + *v13);
  uint64_t v89 = v138;
  if (!*(void *)*v111)
  {
    v111[1] = *v111;
    *(void *)(*(void *)(v12 + 240) + *v13 + 24) = 0;
    *(void *)(*(void *)(v12 + 240) + *v13 + 16) = 0;
    uint64_t v112 = *(void *)(*(void *)(v12 + 240) + *v13 + 8);
    uint64_t v93 = v136;
    uint64_t v92 = v137;
    if (!*(unsigned char *)(v112 + 59))
    {
      uint64_t v121 = 0;
      uint64_t v122 = v112 + 24;
      do
      {
        double v123 = *(unsigned char **)(v122 + v121);
        if (v123)
        {
          _NSGlyphNodeFree(v123);
          *(void *)(v122 + v121) = 0;
        }
        v121 += 8;
      }
      while (v121 != 24);
    }
    *(unsigned char *)(v112 + 59) = 1;
    *(unsigned char *)(v112 + 56) = 1;
    *(void *)uint64_t v112 = v10;
    *(void *)(v112 + _Block_object_dispose(&STACK[0x2B0], 8) = v10;
    goto LABEL_106;
  }
  if (!_NSGlyphTreeMoveToCharacterIndex(v12, 0))
  {
    uint64_t v120 = @"!!! _NSGlyphTreeInvalidateGlyphsForCharacterRange invalid char range 3";
LABEL_96:
    _NSGlyphTreeLogDebug((NSString *)v120, v82, v83, v84, v85, v86, v87, v88, v135);
    uint64_t v93 = v136;
    uint64_t v92 = v137;
    goto LABEL_108;
  }
  uint64_t v112 = *(void *)(*(void *)(v12 + 240) + *v13 + 8);
  uint64_t v93 = v136;
  uint64_t v92 = v137;
  if (!*(unsigned char *)(v112 + 59))
  {
    uint64_t v129 = 0;
    uint64_t v130 = v112 + 24;
    uint64_t v131 = *(void *)v112;
    do
    {
      uint64_t v132 = *(unsigned char **)(v130 + v129);
      if (v132)
      {
        _NSGlyphNodeFree(v132);
        *(void *)(v130 + v129) = 0;
      }
      v129 += 8;
    }
    while (v129 != 24);
    goto LABEL_105;
  }
  if (!*(void *)(v112 + 24))
  {
    uint64_t v131 = *(void *)v112;
LABEL_105:
    *(unsigned char *)(v112 + 59) = 1;
    *(unsigned char *)(v112 + 56) = v131 + v10 != 0;
    *(void *)uint64_t v112 = v131 + v10;
    *(void *)(v112 + _Block_object_dispose(&STACK[0x2B0], 8) = v131 + v10;
LABEL_106:
    _NSGlyphNodeSetCapacity(v112, 0);
    uint64_t v128 = (int64x2_t *)v112;
LABEL_107:
    _NSGlyphNodeSetInvariants(v128);
    goto LABEL_108;
  }
  uint64_t v113 = (int64x2_t *)malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
  v113[3].i8[11] = 1;
  v113->i64[0] = v10;
  v113->i64[1] = v10;
  v113[3].i8[8] = 1;
  _NSGlyphTreeInsertNodeBeforeCurrentNode(v12, v113, v114, v115, v116, v117, v118, v119);
LABEL_108:
  uint64_t v133 = *(void *)(v12 + 240);
  if (v89 + v139 != **(void **)(v133 + *v13))
  {
    _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeInvalidateGlyphsForCharacterRange character count mismatch", v17, v18, v19, v20, v21, v22, v23, v135);
    uint64_t v133 = *(void *)(v12 + 240);
  }
  *(void *)(v133 + 496) = 0;
  uint64_t v134 = *(void *)(*(void *)(*(void *)(v12 + 240) + *v13) + 8);
  if (v140 & 1 | (v134 != v92))
  {
    _NSLayoutTreeInvalidateLayoutForGlyphRange(v12, v135, v93 - (v134 - v92), v134 - v92, v20, v21, v22, v23, a9);
  }
}

void _NSGlyphTreeInsertNodeAfterCurrentNode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *(int64x2_t **)(*(void *)(a1 + 240) + 216);
  if (v8) {
    BOOL v9 = a2 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    return;
  }
  uint64_t v10 = (int64x2_t *)a2;
  long long v23 = 0u;
  long long v24 = 0u;
  while (1)
  {
    uint64_t v12 = (int64x2_t *)v8[1].i64[0];
    if (!v12)
    {
      uint64_t v22 = (int64x2_t *)malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
      v22[1].i64[1] = (uint64_t)v8;
      v22[2].i64[0] = (uint64_t)v10;
      v8[1].i64[0] = (uint64_t)v22;
      v10[1].i64[0] = (uint64_t)v22;
      _NSGlyphNodeSetInvariants(v22);
      *(void *)(*(void *)(a1 + 240) + 20_Block_object_dispose(&STACK[0x2B0], 8) = v22;
      return;
    }
    unint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = v12[1].i64[v13 + 1];
      if (!v14) {
        break;
      }
      if (v8 == (int64x2_t *)v14)
      {
        uint64_t v14 = (uint64_t)v8;
        break;
      }
      if (++v13 == 3)
      {
        uint64_t v14 = 0;
        break;
      }
    }
    if (v8 != (int64x2_t *)v14)
    {
      _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeInsertNodeAfterCurrentNode found broken link", a2, a3, a4, a5, a6, a7, a8, v23);
      uint64_t v12 = v8;
      unint64_t v15 = v10;
      if (!v8) {
        return;
      }
      goto LABEL_23;
    }
    if (!v12[2].i64[1]) {
      break;
    }
    unint64_t v15 = (int64x2_t *)malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
    for (uint64_t i = 0; i != 3; ++i)
    {
      *(void *)((char *)&v23 + i * _Block_object_dispose(&STACK[0x2B0], 8) = v12[1].i64[i + 1];
      v12[1].i64[i + 1] = 0;
    }
    unint64_t v17 = v13 + 1;
    if (v13 <= 1)
    {
      uint64_t v18 = 0;
      do
      {
        *((void *)&v24 + v18 + 1) = *((void *)&v23 + v18 + 2);
        unint64_t v19 = v18 + 2;
        --v18;
      }
      while (v19 > v17);
    }
    *((void *)&v23 + v17) = v10;
    long long v20 = v23;
    v12[1].i64[1] = v23;
    *(void *)(v20 + 16) = v12;
    v12[2].i64[0] = *((void *)&v20 + 1);
    *(void *)(*((void *)&v20 + 1) + 16) = v12;
    _NSGlyphNodeSetInvariants(v12);
    long long v21 = v24;
    v15[1].i64[1] = v24;
    *(void *)(v21 + 16) = v15;
    v15[2].i64[0] = *((void *)&v21 + 1);
    *(void *)(*((void *)&v21 + 1) + 16) = v15;
    _NSGlyphNodeSetInvariants(v15);
LABEL_23:
    uint64_t v10 = v15;
    uint64_t v8 = v12;
    if (!v15) {
      return;
    }
  }
  if (!v13) {
    v12[2].i64[1] = v12[2].i64[0];
  }
  v12[2].i64[v13] = (uint64_t)v10;
  v10[1].i64[0] = (uint64_t)v12;

  _NSGlyphNodeSetInvariants(v12);
}

unsigned __int8 *_NSGlyphNodeCreateSubNode(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v6 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
  v6[59] = 1;
  *(void *)unint64_t v6 = a3;
  *((void *)v6 + 1) = a3;
  v6[56] = a3 != 0;
  if (*(void *)(a1 + 24))
  {
    unint64_t v7 = a2 + a3;
    unint64_t v8 = *(char *)(a1 + 57);
    unsigned __int8 v9 = *(unsigned char *)(a1 + 57);
    if (v8 > 3) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = qword_18E5F7310[v8];
    }
    unint64_t v11 = *(unsigned __int8 *)(a1 + 58);
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12)
    {
      if (a2)
      {
        unint64_t v13 = _NSGlyphNodePrimitiveRelativeGlyphIndexForRelativeCharacterIndex(a1, a2) - 1;
        while (v13 != -1)
        {
          if (v11 == 2)
          {
            uint64_t v14 = *(int *)(v12 + 4 * v13);
          }
          else if (v11 == 1)
          {
            uint64_t v14 = *(__int16 *)(v12 + 2 * v13);
          }
          else if (v11)
          {
            uint64_t v14 = 0;
          }
          else
          {
            uint64_t v14 = *(char *)(v12 + v13);
          }
          if (--v13 - v14 + 1 < a2)
          {
            a2 = v13 + 2;
            goto LABEL_19;
          }
        }
        a2 = 0;
      }
LABEL_19:
      if (v7 >= *(void *)a1)
      {
        unint64_t v7 = *(void *)(a1 + 8);
      }
      else
      {
        unint64_t v15 = _NSGlyphNodePrimitiveRelativeGlyphIndexForRelativeCharacterIndex(a1, v7) - 1;
        while (v15 != -1)
        {
          if (v11 == 2)
          {
            uint64_t v16 = *(int *)(v12 + 4 * v15);
          }
          else if (v11 == 1)
          {
            uint64_t v16 = *(__int16 *)(v12 + 2 * v15);
          }
          else if (v11)
          {
            uint64_t v16 = 0;
          }
          else
          {
            uint64_t v16 = *(char *)(v12 + v15);
          }
          if (--v15 - v16 + 1 < v7)
          {
            unint64_t v7 = v15 + 2;
            goto LABEL_33;
          }
        }
        unint64_t v7 = 0;
      }
    }
LABEL_33:
    size_t v17 = v7 - a2;
    *((void *)v6 + 1) = v7 - a2;
    v6[56] = *(unsigned char *)(a1 + 56);
    v6[57] = v9;
    unint64_t v18 = *MEMORY[0x1E4F14B00];
    if (v7 - a2 <= *MEMORY[0x1E4F14B00] >> 1) {
      unint64_t v18 = 64;
    }
    unint64_t v19 = (v17 + v18 - 1) / v18 * v18;
    if (v19 >= 0x2000) {
      unint64_t v19 = 0x2000;
    }
    if (v19 <= v17) {
      size_t v20 = v7 - a2;
    }
    else {
      size_t v20 = v19;
    }
    _NSGlyphNodeSetCapacity((uint64_t)v6, v20);
    memmove(*((void **)v6 + 3), (const void *)(*(void *)(a1 + 24) + a2 * v10), v17 * v10);
    if (v12)
    {
      if (v11 == 2)
      {
        uint64_t v21 = *(int *)(v12 + 4 * a2);
      }
      else if (v11 == 1)
      {
        uint64_t v21 = *(__int16 *)(v12 + 2 * a2);
      }
      else
      {
        uint64_t v21 = v11 ? 0 : *(char *)(v12 + a2);
      }
      _NSGlyphNodeSetDeltaFormat((uint64_t)v6, v11);
      BOOL v22 = v7 > a2;
      unint64_t v23 = v7 - a2;
      if (v22)
      {
        uint64_t v24 = 0;
        uint64_t v25 = *((void *)v6 + 4);
        uint64_t v35 = v12 + a2;
        uint64_t v33 = v12 + 2 * a2;
        uint64_t v34 = v12 + 4 * a2;
        do
        {
          if (v11 == 2)
          {
            uint64_t v26 = *(int *)(v34 + 4 * v24);
          }
          else if (v11 == 1)
          {
            uint64_t v26 = *(__int16 *)(v33 + 2 * v24);
          }
          else if (v11)
          {
            uint64_t v26 = 0;
          }
          else
          {
            uint64_t v26 = *(char *)(v35 + v24);
          }
          uint64_t v27 = v26 - v21;
          BOOL v28 = v26 - v21 != (char)(v26 - v21);
          if (v27 == (__int16)v27) {
            unint64_t v29 = v28;
          }
          else {
            unint64_t v29 = 2;
          }
          if (v29 > v11)
          {
            _NSGlyphNodeSetDeltaFormat((uint64_t)v6, v29);
            unint64_t v11 = v6[58];
            uint64_t v25 = *((void *)v6 + 4);
          }
          if (v25)
          {
            switch(v11)
            {
              case 2uLL:
                *(_DWORD *)(v25 + 4 * v24) = v27;
                break;
              case 1uLL:
                *(_WORD *)(v25 + 2 * v24) = v27;
                break;
              case 0uLL:
                *(unsigned char *)(v25 + v24) = v27;
                break;
            }
          }
          ++v24;
        }
        while (v23 != v24);
      }
    }
    uint64_t v30 = *(void *)(a1 + 40);
    if (v30)
    {
      unint64_t v31 = (void *)*((void *)v6 + 5);
      if (*((void *)v6 + 6) && !v31)
      {
        unint64_t v31 = malloc_type_calloc(*((void *)v6 + 6), 1uLL, 0x68C02440uLL);
        *((void *)v6 + 5) = v31;
        uint64_t v30 = *(void *)(a1 + 40);
      }
      memmove(v31, (const void *)(v30 + a2), v17);
    }
  }
  return v6;
}

int64x2_t *_NSGlyphNodeTruncate(int64x2_t *a1, unint64_t a2, uint64_t a3)
{
  unint64_t v5 = (char *)a1[1].i64[1];
  if (!v5)
  {
    a1->i64[0] = a3;
    a1->i64[1] = a3;
    goto LABEL_78;
  }
  unint64_t v6 = a2;
  unint64_t v7 = a2 + a3;
  unint64_t v8 = a1[3].u8[10];
  uint64_t v9 = a1[2].i64[0];
  if (v9)
  {
    if (a2)
    {
      unint64_t v10 = _NSGlyphNodePrimitiveRelativeGlyphIndexForRelativeCharacterIndex((uint64_t)a1, a2) - 1;
      while (v10 != -1)
      {
        if (v8 == 2)
        {
          uint64_t v11 = *(int *)(v9 + 4 * v10);
        }
        else if (v8 == 1)
        {
          uint64_t v11 = *(__int16 *)(v9 + 2 * v10);
        }
        else if (v8)
        {
          uint64_t v11 = 0;
        }
        else
        {
          uint64_t v11 = *(char *)(v9 + v10);
        }
        if (--v10 - v11 + 1 < v6)
        {
          unint64_t v6 = v10 + 2;
          goto LABEL_17;
        }
      }
      unint64_t v6 = 0;
    }
LABEL_17:
    if (v7 >= a1->i64[0])
    {
      unint64_t v7 = a1->u64[1];
    }
    else
    {
      unint64_t v12 = _NSGlyphNodePrimitiveRelativeGlyphIndexForRelativeCharacterIndex((uint64_t)a1, v7) - 1;
      while (v12 != -1)
      {
        if (v8 == 2)
        {
          uint64_t v13 = *(int *)(v9 + 4 * v12);
        }
        else if (v8 == 1)
        {
          uint64_t v13 = *(__int16 *)(v9 + 2 * v12);
        }
        else if (v8)
        {
          uint64_t v13 = 0;
        }
        else
        {
          uint64_t v13 = *(char *)(v9 + v12);
        }
        if (--v12 - v13 + 1 < v7)
        {
          unint64_t v7 = v12 + 2;
          goto LABEL_31;
        }
      }
      unint64_t v7 = 0;
    }
  }
LABEL_31:
  size_t v14 = v7 - v6;
  a1->i64[0] = a3;
  a1->i64[1] = v7 - v6;
  if (v6)
  {
    unint64_t v15 = a1[3].i8[9];
    if (v15 > 3) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = qword_18E5F7310[v15];
    }
    memmove(v5, &v5[v16 * v6], v16 * v14);
    if (!v9
      || (v8 == 2
        ? (uint64_t v17 = *(int *)(v9 + 4 * v6))
        : v8 == 1
        ? (uint64_t v17 = *(__int16 *)(v9 + 2 * v6))
        : v8
        ? (uint64_t v17 = 0)
        : (uint64_t v17 = *(char *)(v9 + v6)),
          BOOL v18 = v7 > v6,
          unint64_t v19 = v7 - v6,
          !v18))
    {
LABEL_67:
      uint64_t v25 = (char *)a1[2].i64[1];
      if (v25) {
        memmove(v25, &v25[v6], v14);
      }
      goto LABEL_69;
    }
    uint64_t v20 = 0;
    while (1)
    {
      if (!v9) {
        goto LABEL_51;
      }
      if (v8 == 2)
      {
        uint64_t v21 = *(int *)(v9 + 4 * v6 + 4 * v20);
        goto LABEL_54;
      }
      if (v8 == 1)
      {
        uint64_t v21 = *(__int16 *)(v9 + 2 * v6 + 2 * v20);
        goto LABEL_54;
      }
      if (v8) {
LABEL_51:
      }
        uint64_t v21 = 0;
      else {
        uint64_t v21 = *(char *)(v9 + v6 + v20);
      }
LABEL_54:
      uint64_t v22 = v21 - v17;
      BOOL v23 = v21 - v17 != (char)(v21 - v17);
      if (v22 == (__int16)v22) {
        unint64_t v24 = v23;
      }
      else {
        unint64_t v24 = 2;
      }
      if (v24 > v8)
      {
        _NSGlyphNodeSetDeltaFormat((uint64_t)a1, v24);
        unint64_t v8 = a1[3].u8[10];
        uint64_t v9 = a1[2].i64[0];
      }
      if (v9)
      {
        switch(v8)
        {
          case 2uLL:
            *(_DWORD *)(v9 + 4 * v20) = v22;
            break;
          case 1uLL:
            *(_WORD *)(v9 + 2 * v20) = v22;
            break;
          case 0uLL:
            *(unsigned char *)(v9 + v20) = v22;
            break;
        }
      }
      if (v19 == ++v20) {
        goto LABEL_67;
      }
    }
  }
LABEL_69:
  unint64_t v26 = a1->u64[1];
  unint64_t v27 = *MEMORY[0x1E4F14B00];
  if (v26 <= *MEMORY[0x1E4F14B00] >> 1) {
    unint64_t v27 = 64;
  }
  unint64_t v28 = (v26 + v27 - 1) / v27 * v27;
  if (v28 >= 0x2000) {
    unint64_t v28 = 0x2000;
  }
  if (v28 <= v26) {
    size_t v29 = a1->u64[1];
  }
  else {
    size_t v29 = v28;
  }
  if (v29 < a1[3].i64[0]) {
    _NSGlyphNodeSetCapacity((uint64_t)a1, v29);
  }
LABEL_78:

  return _NSGlyphNodeSetInvariants(a1);
}

uint64_t _NSGlyphTreeDeleteCurrentNode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  while (2)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 240) + 216);
    if (*(void *)(v9 + 16))
    {
      for (unint64_t i = 0; i != 3; ++i)
      {
        uint64_t v11 = *(uint64_t **)(*(void *)(a1 + 240) + 216);
        uint64_t v12 = v11[2];
        uint64_t v13 = *(uint64_t **)(v12 + 8 * i + 24);
        if (!v13) {
          goto LABEL_12;
        }
        if (v11 == v13)
        {
          *(void *)(*(void *)(a1 + 240) + 216) = v12;
          if (i <= 1)
          {
            do
            {
              unint64_t v16 = i;
              uint64_t v17 = *(void *)(*(void *)(a1 + 240) + 216) + 8 * i;
              *(void *)(v17 + 24) = *(void *)(v17 + 32);
              unint64_t i = 1;
            }
            while (!v16);
          }
          goto LABEL_10;
        }
        uint64_t v15 = *v13;
        uint64_t v14 = v13[1];
        *(void *)(*(void *)(a1 + 240) + 224) -= v15;
        *(void *)(*(void *)(a1 + 240) + 232) -= v14;
      }
      if (*(void *)(*(void *)(a1 + 240) + 216))
      {
LABEL_12:
        _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeDeleteCurrentNode found broken link", a2, a3, a4, a5, a6, a7, a8, v26);
        break;
      }
      uint64_t v11 = 0;
      *(void *)(*(void *)(a1 + 240) + 216) = MEMORY[0x10];
LABEL_10:
      *(void *)(*(void *)(*(void *)(a1 + 240) + 216) + 40) = 0;
      _NSGlyphNodeFree(v11);
      BOOL v18 = *(int64x2_t **)(*(void *)(a1 + 240) + 216);
      if (!v18[1].i64[1]) {
        continue;
      }
      _NSGlyphNodeSetInvariants(v18);
    }
    else
    {
      uint64_t v24 = *(void *)(*(void *)(a1 + 240) + 208);
      _NSGlyphNodeFree(*(unsigned char **)(*(void *)(a1 + 240) + 216));
      if (v9 == v24)
      {
        uint64_t v25 = malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
        v25[59] = 1;
        v25[56] = 0;
        *(void *)uint64_t v25 = 0;
        *((void *)v25 + 1) = 0;
        *(void *)(*(void *)(a1 + 240) + 20_Block_object_dispose(&STACK[0x2B0], 8) = v25;
        *(void *)(*(void *)(a1 + 240) + 216) = v25;
      }
      else
      {
        *(void *)(*(void *)(a1 + 240) + 216) = *(void *)(*(void *)(a1 + 240) + 208);
      }
      *(void *)(*(void *)(a1 + 240) + 232) = 0;
      *(void *)(*(void *)(a1 + 240) + 224) = 0;
    }
    break;
  }
  unint64_t v19 = (void *)(a1 + 240);
  for (uint64_t result = *(void *)(*(void *)(a1 + 240) + 208);
        !*(unsigned char *)(result + 59);
        uint64_t result = *(void *)(*(void *)(a1 + 240) + 208))
  {
    if (*(void *)(result + 32)) {
      break;
    }
    uint64_t v21 = *(void *)(result + 24);
    if (v21)
    {
      *(void *)(result + 24) = 0;
      *(void *)(v21 + 16) = 0;
      uint64_t v22 = (void *)(*v19 + 208);
      if (v22[1] == *v22) {
        v22[1] = v21;
      }
      _NSGlyphNodeFree(*(unsigned char **)(*(void *)(a1 + 240) + 208));
      *(void *)(*(void *)(a1 + 240) + 20_Block_object_dispose(&STACK[0x2B0], 8) = v21;
    }
    else
    {
      _NSGlyphNodeFree((unsigned char *)result);
      BOOL v23 = malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
      v23[59] = 1;
      v23[56] = 0;
      *(void *)BOOL v23 = 0;
      *((void *)v23 + 1) = 0;
      *(void *)(*(void *)(a1 + 240) + 20_Block_object_dispose(&STACK[0x2B0], 8) = v23;
      *(void *)(*(void *)(a1 + 240) + 216) = v23;
      *(void *)(*(void *)(a1 + 240) + 232) = 0;
      *(void *)(*(void *)(a1 + 240) + 224) = 0;
    }
    unint64_t v19 = (void *)(a1 + 240);
  }
  return result;
}

void _NSGlyphTreeInsertNodeBeforeCurrentNode(uint64_t a1, int64x2_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = *(void *)(a1 + 240);
  if (!a2) {
    goto LABEL_27;
  }
  uint64_t v11 = *(int64x2_t **)(v10 + 216);
  if (!v11) {
    goto LABEL_27;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v12 = a2;
  while (1)
  {
    uint64_t v13 = (int64x2_t *)v11[1].i64[0];
    if (!v13)
    {
      BOOL v23 = (int64x2_t *)malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
      v23[1].i64[1] = (uint64_t)v12;
      v23[2].i64[0] = (uint64_t)v11;
      v12[1].i64[0] = (uint64_t)v23;
      v11[1].i64[0] = (uint64_t)v23;
      _NSGlyphNodeSetInvariants(v23);
      *(void *)(*(void *)(a1 + 240) + 20_Block_object_dispose(&STACK[0x2B0], 8) = v23;
      goto LABEL_26;
    }
    unint64_t v14 = 0;
    while (1)
    {
      uint64_t v15 = v13[1].i64[v14 + 1];
      if (!v15) {
        break;
      }
      if (v11 == (int64x2_t *)v15)
      {
        uint64_t v15 = (uint64_t)v11;
        break;
      }
      if (++v14 == 3)
      {
        uint64_t v15 = 0;
        break;
      }
    }
    if (v11 != (int64x2_t *)v15)
    {
      _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeInsertNodeBeforeCurrentNode found broken link", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v26);
      uint64_t v13 = v11;
      unint64_t v16 = v12;
      goto LABEL_20;
    }
    if (!v13[2].i64[1]) {
      break;
    }
    uint64_t v17 = (int64x2_t *)malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
    unint64_t v16 = v17;
    for (uint64_t i = 0; i != 3; ++i)
    {
      *(void *)((char *)&v26 + i * _Block_object_dispose(&STACK[0x2B0], 8) = v13[1].i64[i + 1];
      v13[1].i64[i + 1] = 0;
    }
    if (v14 <= 2)
    {
      uint64_t v19 = 0;
      do
      {
        *((void *)&v27 + v19 + 1) = *((void *)&v26 + v19 + 2);
        unint64_t v20 = v19 + 2;
        --v19;
      }
      while (v20 > v14);
    }
    *((void *)&v26 + v14) = v12;
    long long v21 = v26;
    v17[1].i64[1] = v26;
    *(void *)(v21 + 16) = v17;
    v17[2].i64[0] = *((void *)&v21 + 1);
    *(void *)(*((void *)&v21 + 1) + 16) = v17;
    _NSGlyphNodeSetInvariants(v17);
    long long v22 = v27;
    v13[1].i64[1] = v27;
    *(void *)(v22 + 16) = v13;
    v13[2].i64[0] = *((void *)&v22 + 1);
    *(void *)(*((void *)&v22 + 1) + 16) = v13;
    _NSGlyphNodeSetInvariants(v13);
    if (!v16) {
      goto LABEL_26;
    }
LABEL_20:
    uint64_t v12 = v16;
    uint64_t v11 = v13;
  }
  if (v14 <= 1)
  {
    uint64_t v24 = 0;
    do
    {
      v13[2].i64[v24 + 1] = v13[2].i64[v24];
      unint64_t v25 = v24-- + 1;
    }
    while (v25 > v14);
  }
  v13[1].i64[v14 + 1] = (uint64_t)v12;
  v12[1].i64[0] = (uint64_t)v13;
  _NSGlyphNodeSetInvariants(v13);
LABEL_26:
  uint64_t v10 = *(void *)(a1 + 240);
LABEL_27:
  *(void *)(v10 + 224) += a2->i64[0];
  *(void *)(*(void *)(a1 + 240) + 232) += a2->i64[1];
}

void _NSGlyphTreeInsertGlyphs(uint64_t a1, unint64_t a2, unint64_t a3, size_t a4, unsigned int *a5)
{
  if (a5)
  {
    size_t v5 = a4;
    if (a4)
    {
      unint64_t v6 = a5;
      do
      {
        if (_NSGlyphTreeMoveToCharacterIndex(a1, a2))
        {
          BOOL v18 = *(int64x2_t **)(*(void *)(a1 + 240) + 216);
          unint64_t v17 = *(void *)(*(void *)(a1 + 240) + 224);
          unint64_t v19 = v18->i64[0] + v17;
          if (a2 + v5 <= v19) {
            size_t v20 = v5;
          }
          else {
            size_t v20 = v19 - a2;
          }
          if (v18[3].i8[11] && v18[1].i64[1])
          {
            if (v20)
            {
              uint64_t v21 = 0;
              while (1)
              {
                unint64_t v22 = *(void *)(*(void *)(a1 + 240) + 232);
                if (a3 + v21 < v22) {
                  break;
                }
                BOOL v23 = *(int64x2_t **)(*(void *)(a1 + 240) + 216);
                if (a3 + v21 > v23->i64[1] + v22) {
                  break;
                }
                _NSGlyphNodeInsertGlyph(v23, a2 + v21 - *(void *)(*(void *)(a1 + 240) + 224), a3 + v21 - v22, 0, v6[v21]);
                if (++v21 >= v20)
                {
                  uint64_t v99 = 0;
                  goto LABEL_30;
                }
              }
              _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeInsertGlyphs glyph index issue 1", v10, v11, v12, v13, v14, v15, v16, v95);
              uint64_t v99 = 0;
LABEL_30:
              objc_msgSend(*(id *)(a1 + 48), "insertElement:range:coalesceRuns:", &v99, a3, v20, 1, v95);
              unsigned int v44 = *(void **)(*(void *)(a1 + 240) + 184);
              if (v44) {
                _NSInsertGlyphRangeInTextBlocks(v44, a3, v20);
              }
            }
            _NSLayoutTreeInvalidateLayoutForGlyphRange(a1, a3, 0, v20, v13, v14, v15, v16, v95);
            goto LABEL_44;
          }
          if (a3 == a2 - v17 + *(void *)(*(void *)(a1 + 240) + 232))
          {
            if (a2 > v17)
            {
              size_t v24 = v19 - (v20 + a2);
              if (v19 > v20 + a2)
              {
                unint64_t v25 = malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
                v25[59] = 1;
                *(void *)unint64_t v25 = v24;
                *((void *)v25 + 1) = v24;
                v25[56] = 1;
                _NSGlyphTreeInsertNodeAfterCurrentNode(a1, (uint64_t)v25, v26, v27, v28, v29, v30, v31);
              }
              unint64_t v32 = (int64x2_t *)malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
              v32[3].i8[11] = 1;
              v32->i64[0] = v20;
              v32->i64[1] = v20;
              v32[3].i8[8] = v20 != 0;
              _NSGlyphNodeSetGlyphs(v32, v20, v6);
              uint64_t v33 = *(int64x2_t **)(*(void *)(a1 + 240) + 216);
              uint64_t v97 = *(void *)(*(void *)(a1 + 240) + 224);
              if (!v33[3].i8[11])
              {
                uint64_t v34 = 0;
                uint64_t v35 = &v33[1].i8[8];
                do
                {
                  uint64_t v36 = *(unsigned char **)&v35[v34];
                  if (v36)
                  {
                    _NSGlyphNodeFree(v36);
                    *(void *)&v35[v34] = 0;
                  }
                  v34 += 8;
                }
                while (v34 != 24);
              }
              v33[3].i8[11] = 1;
              v33[3].i8[8] = a2 != v97;
              v33->i64[0] = a2 - v97;
              v33->i64[1] = a2 - v97;
              _NSGlyphNodeSetCapacity((uint64_t)v33, 0);
              _NSGlyphNodeSetInvariants(v33);
              _NSGlyphTreeInsertNodeAfterCurrentNode(a1, (uint64_t)v32, v37, v38, v39, v40, v41, v42);
              goto LABEL_44;
            }
            if (!a2)
            {
              size_t v49 = v19 - v20;
              if (v19 > v20)
              {
                uint64_t v50 = malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
                v50[59] = 1;
                *(void *)uint64_t v50 = v49;
                *((void *)v50 + 1) = v49;
                v50[56] = 1;
                _NSGlyphTreeInsertNodeAfterCurrentNode(a1, (uint64_t)v50, v51, v52, v53, v54, v55, v56);
                BOOL v18 = *(int64x2_t **)(*(void *)(a1 + 240) + 216);
              }
              _NSGlyphNodeSetGlyphs(v18, v20, v6);
              goto LABEL_44;
            }
            uint64_t v45 = v19 - (v20 + a2);
            if (v19 <= v20 + a2)
            {
              _NSGlyphTreeDeleteCurrentNode(a1, v10, v11, v12, v13, v14, v15, v16);
            }
            else
            {
              if (!v18[3].i8[11])
              {
                uint64_t v46 = 0;
                uint64_t v47 = &v18[1].i8[8];
                do
                {
                  uint64_t v48 = *(unsigned char **)&v47[v46];
                  if (v48)
                  {
                    _NSGlyphNodeFree(v48);
                    *(void *)&v47[v46] = 0;
                  }
                  v46 += 8;
                }
                while (v46 != 24);
              }
              v18[3].i8[11] = 1;
              v18[3].i8[8] = 1;
              v18->i64[0] = v45;
              v18->i64[1] = v45;
              _NSGlyphNodeSetCapacity((uint64_t)v18, 0);
              _NSGlyphNodeSetInvariants(v18);
            }
            if (_NSGlyphTreeMoveToCharacterIndex(a1, a2 - 1))
            {
              uint64_t v57 = *(int64x2_t **)(*(void *)(a1 + 240) + 216);
              if (v57[3].i8[11] && v57[1].i64[1] && (uint64_t v58 = v57->i64[1], v59 = v58 + v20, v58 + v20 <= 0x2000))
              {
                if (v58 - v57->i64[0] == (__int16)(v58 - v57->i16[0])) {
                  unint64_t v60 = 0;
                }
                else {
                  unint64_t v60 = 2;
                }
                if (v20)
                {
                  unint64_t v61 = v57[3].u8[9];
                  unint64_t v62 = v61;
                  if (v61 <= 1)
                  {
                    size_t v63 = 0;
                    unint64_t v62 = v57[3].u8[9];
                    do
                    {
                      unsigned int v64 = v6[v63];
                      if (v64 == 0xFFFFFF)
                      {
                        unint64_t v65 = 0;
                      }
                      else if (v64 <= 0xFF)
                      {
                        unint64_t v65 = v64 > 0xEF;
                      }
                      else
                      {
                        unint64_t v65 = 2;
                      }
                      if (v65 > v62) {
                        unint64_t v62 = v65;
                      }
                      if (v62 > 1) {
                        break;
                      }
                      ++v63;
                    }
                    while (v63 < v20);
                  }
                  uint64_t v96 = v58 - v57->i64[0];
                  uint64_t v98 = *(int64x2_t **)(*(void *)(a1 + 240) + 216);
                  unint64_t v95 = v60;
                  if (v59 > v57[3].i64[0])
                  {
                    unint64_t v66 = *MEMORY[0x1E4F14B00];
                    if (v59 <= *MEMORY[0x1E4F14B00] >> 1) {
                      unint64_t v66 = 64;
                    }
                    unint64_t v67 = (v59 + v66 - 1) / v66 * v66;
                    if (v67 >= 0x2000) {
                      unint64_t v67 = 0x2000;
                    }
                    if (v67 <= v59) {
                      size_t v68 = v58 + v20;
                    }
                    else {
                      size_t v68 = v67;
                    }
                    uint64_t v69 = v57->i64[1];
                    _NSGlyphNodeSetCapacity((uint64_t)v57, v68);
                    unint64_t v60 = v95;
                    uint64_t v58 = v69;
                    uint64_t v57 = v98;
                    unint64_t v61 = v98[3].u8[9];
                  }
                  if (v62 > v61)
                  {
                    unint64_t v61 = v58;
                    _NSGlyphNodeSetGlyphFormat((uint64_t)v57, v62);
                    unint64_t v60 = v95;
                    uint64_t v58 = v61;
                    uint64_t v57 = v98;
                    LODWORD(v61) = v98[3].u8[9];
                  }
                  unint64_t v70 = v57[3].u8[10];
                  if (v60 > v70)
                  {
                    uint64_t v71 = v58;
                    _NSGlyphNodeSetDeltaFormat((uint64_t)v57, v60);
                    uint64_t v58 = v71;
                    uint64_t v57 = v98;
                    LODWORD(v70) = v98[3].u8[10];
                  }
                  *uint64_t v57 = vaddq_s64(*v57, vdupq_n_s64(v20));
                  uint64_t v73 = v57[1].i64[1];
                  uint64_t v72 = v57[2].i64[0];
                  uint64_t v74 = v57[2].i64[1];
                  uint64_t v75 = (unsigned char *)(v73 + v58);
                  uint64_t v76 = (unsigned char *)(v73 + 2 * v58);
                  uint64_t v77 = (unsigned char *)(v73 + 4 * v58);
                  uint64_t v78 = v73 + 24 * v58;
                  uint64_t v79 = v6;
                  size_t v80 = v20;
                  do
                  {
                    unsigned int v82 = *v79++;
                    unsigned int v81 = v82;
                    if (v73)
                    {
                      switch((int)v61)
                      {
                        case 0:
                          if (v81 == 0xFFFFFF)
                          {
                            *uint64_t v75 = 0;
                          }
                          else if (v81 > 3)
                          {
                            if (v81 <= 0xEF) {
                              *uint64_t v75 = v81;
                            }
                          }
                          else
                          {
                            *uint64_t v75 = v81 | 0xF0;
                          }
                          break;
                        case 1:
                          *uint64_t v76 = 0;
                          __int16 v83 = (_WORD)v81 << 8;
                          if (v81 == 0xFFFFFF) {
                            __int16 v83 = 128;
                          }
                          *(_WORD *)uint64_t v76 = v83 & 0xFF80 | *(_WORD *)v76 & 0x7F;
                          break;
                        case 2:
                          unsigned char *v77 = 0;
                          int v84 = v81 << 8;
                          if (v81 == 0xFFFFFF) {
                            int v84 = 128;
                          }
                          *(_DWORD *)uint64_t v77 = v84 & 0xFFFFFF80 | *(_DWORD *)v77 & 0x7F;
                          break;
                        case 3:
                          *(unsigned char *)uint64_t v78 = 0;
                          *(void *)(v78 + 16) = 0;
                          int v85 = v81 << 8;
                          if (v81 == 0xFFFFFF) {
                            int v85 = 128;
                          }
                          *(_DWORD *)uint64_t v78 = v85 & 0xFFFFFF80 | *(_DWORD *)v78 & 0x7F;
                          break;
                        default:
                          break;
                      }
                    }
                    ++v75;
                    v76 += 2;
                    v77 += 4;
                    v78 += 24;
                    --v80;
                  }
                  while (v80);
                  if (v72)
                  {
                    uint64_t v86 = v58;
                    size_t v87 = v20;
                    do
                    {
                      switch(v70)
                      {
                        case 2:
                          *(_DWORD *)(v72 + 4 * v86) = v96;
                          break;
                        case 1:
                          *(_WORD *)(v72 + 2 * v86) = v96;
                          break;
                        case 0:
                          *(unsigned char *)(v72 + v86) = v96;
                          break;
                      }
                      ++v86;
                      --v87;
                    }
                    while (v87);
                  }
                  if (v74)
                  {
                    bzero((void *)(v74 + v58), v20);
                    uint64_t v57 = v98;
                  }
                  _NSGlyphNodeSetInvariants(v57);
                }
              }
              else
              {
                uint64_t v88 = (int64x2_t *)malloc_type_calloc(1uLL, 0x40uLL, 0x1032040CA0E71A0uLL);
                v88[3].i8[11] = 1;
                v88->i64[0] = v20;
                v88->i64[1] = v20;
                v88[3].i8[8] = v20 != 0;
                _NSGlyphNodeSetGlyphs(v88, v20, v6);
                _NSGlyphTreeInsertNodeAfterCurrentNode(a1, (uint64_t)v88, v89, v90, v91, v92, v93, v94);
              }
              goto LABEL_44;
            }
            unsigned int v43 = @"!!! _NSGlyphTreeInsertGlyphs found invalid char index";
          }
          else
          {
            unsigned int v43 = @"!!! _NSGlyphTreeInsertGlyphs glyph index issue 2";
          }
          _NSGlyphTreeLogDebug((NSString *)v43, v10, v11, v12, v13, v14, v15, v16, v95);
        }
        else
        {
          _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeInsertGlyphs invalid char index", v10, v11, v12, v13, v14, v15, v16, v95);
          size_t v20 = v5;
        }
LABEL_44:
        a2 += v20;
        a3 += v20;
        v6 += v20;
        v5 -= v20;
      }
      while (v5);
    }
  }
}

int64x2_t *_NSGlyphNodeInsertGlyph(int64x2_t *a1, uint64_t a2, unint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t v9 = a3 - a2;
  uint64_t v10 = 2;
  if (a5 <= 0xFF) {
    uint64_t v10 = a5 > 0xEF;
  }
  if (a5 == 0xFFFFFF) {
    unint64_t v11 = 0;
  }
  else {
    unint64_t v11 = v10;
  }
  if (v9 == (__int16)v9) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = 2;
  }
  if (v11 > a1[3].u8[9]) {
    _NSGlyphNodeSetGlyphFormat((uint64_t)a1, v11);
  }
  if (!a1[2].i64[0] || v12 > a1[3].u8[10])
  {
    a1[3].i8[8] |= 4u;
    _NSGlyphNodeSetDeltaFormat((uint64_t)a1, v12);
  }
  uint64_t v13 = a1->i64[1];
  size_t v14 = v13 + 1;
  a1->i64[1] = v13 + 1;
  if ((unint64_t)(v13 + 1) > a1[3].i64[0])
  {
    unint64_t v15 = *MEMORY[0x1E4F14B00];
    if (v14 <= *MEMORY[0x1E4F14B00] >> 1) {
      unint64_t v15 = 64;
    }
    unint64_t v16 = (v15 + v13) / v15 * v15;
    if (v16 >= 0x2000) {
      unint64_t v16 = 0x2000;
    }
    if (v16 <= v14) {
      size_t v17 = v14;
    }
    else {
      size_t v17 = v16;
    }
    _NSGlyphNodeSetCapacity((uint64_t)a1, v17);
  }
  unint64_t v18 = a1[3].i8[9];
  if (v18 > 3) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = qword_18E5F7310[v18];
  }
  unint64_t v20 = a1[3].u8[10];
  uint64_t v21 = a1[1].i64[1];
  uint64_t v22 = a1[2].i64[0];
  uint64_t v23 = a1[2].i64[1];
  if (v21)
  {
    unint64_t v24 = a1->u64[1];
    if (a3 + 1 < v24)
    {
      uint64_t v36 = a1[1].i64[1];
      memmove((void *)(v21 + v19 * (a3 + 1)), (const void *)(v21 + v19 * a3), (v24 + ~a3) * v19);
      uint64_t v25 = a1->i64[1];
      int v37 = v9;
      if (v25 - 1 > a3)
      {
        do
        {
          if (!v22) {
            goto LABEL_34;
          }
          if (v20 == 2)
          {
            uint64_t v26 = *(int *)(v22 + 4 * v25 - 8);
            goto LABEL_37;
          }
          if (v20 == 1)
          {
            uint64_t v26 = *(__int16 *)(v22 + 2 * v25 - 4);
            goto LABEL_37;
          }
          if (v20) {
LABEL_34:
          }
            uint64_t v26 = 0;
          else {
            uint64_t v26 = *(char *)(v22 + v25 - 2);
          }
LABEL_37:
          uint64_t v27 = v26 - a4;
          if ((unint64_t)(v26 - a4 - 0x7FFF) >= 0xFFFFFFFFFFFF0000) {
            unint64_t v28 = (unint64_t)(v27 - 127) < 0xFFFFFFFFFFFFFF00;
          }
          else {
            unint64_t v28 = 2;
          }
          if (v28 > v20)
          {
            _NSGlyphNodeSetDeltaFormat((uint64_t)a1, v28);
            unint64_t v20 = a1[3].u8[10];
            uint64_t v22 = a1[2].i64[0];
          }
          if (v22)
          {
            int v29 = v27 + 1;
            switch(v20)
            {
              case 2uLL:
                *(_DWORD *)(v22 + 4 * v25 - 4) = v29;
                break;
              case 1uLL:
                *(_WORD *)(v22 + 2 * v25 - 2) = v29;
                break;
              case 0uLL:
                *(unsigned char *)(v22 + v25 - 1) = v29;
                break;
            }
          }
          unint64_t v30 = v25 - 2;
          --v25;
        }
        while (v30 > a3);
      }
      LODWORD(v9) = v37;
      if (v23) {
        memmove((void *)(v23 + a3 + 1), (const void *)(v23 + a3), a1->i64[1] + ~a3);
      }
      uint64_t v21 = v36;
    }
    switch((int)v18)
    {
      case 0:
        if (a5 == 0xFFFFFF)
        {
          *(unsigned char *)(v21 + a3) = 0;
        }
        else if (a5 > 3)
        {
          if (a5 <= 0xEF) {
            *(unsigned char *)(v21 + a3) = a5;
          }
        }
        else
        {
          *(unsigned char *)(v21 + a3) = a5 | 0xF0;
        }
        break;
      case 1:
        *(unsigned char *)(v21 + 2 * a3) = 0;
        __int16 v34 = (_WORD)a5 << 8;
        if (a5 == 0xFFFFFF) {
          __int16 v34 = 128;
        }
        *(_WORD *)(v21 + 2 * a3) = v34 & 0xFF80 | *(_WORD *)(v21 + 2 * a3) & 0x7F;
        break;
      case 2:
        *(unsigned char *)(v21 + 4 * a3) = 0;
        int v31 = a5 << 8;
        if (a5 == 0xFFFFFF) {
          int v31 = 128;
        }
        *(_DWORD *)(v21 + 4 * a3) = v31 & 0xFFFFFF80 | *(_DWORD *)(v21 + 4 * a3) & 0x7F;
        break;
      case 3:
        unint64_t v32 = v21 + 24 * a3;
        *(unsigned char *)unint64_t v32 = 0;
        *(void *)(v32 + 16) = 0;
        int v33 = a5 << 8;
        if (a5 == 0xFFFFFF) {
          int v33 = 128;
        }
        *(_DWORD *)unint64_t v32 = v33 & 0xFFFFFF80 | *(_DWORD *)v32 & 0x7F;
        break;
      default:
        break;
    }
  }
  if (!v22) {
    goto LABEL_72;
  }
  if (v20 == 2)
  {
    *(_DWORD *)(v22 + 4 * a3) = v9;
    goto LABEL_72;
  }
  if (v20 != 1)
  {
    if (!v20)
    {
      *(unsigned char *)(v22 + a3) = v9;
      if (!v23) {
        goto LABEL_74;
      }
LABEL_73:
      *(unsigned char *)(v23 + a3) = 0;
      goto LABEL_74;
    }
LABEL_72:
    if (!v23) {
      goto LABEL_74;
    }
    goto LABEL_73;
  }
  *(_WORD *)(v22 + 2 * a3) = v9;
  if (v23) {
    goto LABEL_73;
  }
LABEL_74:
  a1[3].i8[8] |= 0x20u;

  return _NSGlyphNodeSetInvariants(a1);
}

int64x2_t *_NSGlyphNodeSetGlyphs(int64x2_t *a1, size_t a2, unsigned int *a3)
{
  _NSGlyphNodeSetCapacity((uint64_t)a1, 0);
  a1->i64[0] = a2;
  a1->i64[1] = a2;
  if (a2 && a3)
  {
    size_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      unsigned int v8 = a3[v6];
      if (v8 == 0xFFFFFF)
      {
        unint64_t v9 = 0;
      }
      else if (v8 <= 0xFF)
      {
        unint64_t v9 = v8 > 0xEF;
      }
      else
      {
        unint64_t v9 = 2;
      }
      if (v9 > v7) {
        unint64_t v7 = v9;
      }
      if (v7 > 1) {
        break;
      }
      ++v6;
    }
    while (v6 < a2);
    a1[3].i8[9] = v7;
    a1[3].i8[8] = 2;
    unint64_t v10 = *MEMORY[0x1E4F14B00];
    if (a2 <= *MEMORY[0x1E4F14B00] >> 1) {
      unint64_t v10 = 64;
    }
    unint64_t v11 = (a2 + v10 - 1) / v10 * v10;
    if (v11 >= 0x2000) {
      unint64_t v11 = 0x2000;
    }
    if (v11 <= a2) {
      size_t v12 = a2;
    }
    else {
      size_t v12 = v11;
    }
    _NSGlyphNodeSetCapacity((uint64_t)a1, v12);
    uint64_t v13 = (unsigned char *)a1[1].i64[1];
    size_t v14 = v13;
    unint64_t v15 = v13;
    unint64_t v16 = v13;
    while (1)
    {
      unsigned int v18 = *a3++;
      unsigned int v17 = v18;
      if (v13)
      {
        if (v7 == 2)
        {
          *unint64_t v16 = 0;
          if (v17 == 0xFFFFFF) {
            int v20 = 128;
          }
          else {
            int v20 = v17 << 8;
          }
          *(_DWORD *)unint64_t v16 = v20 & 0xFFFFFF80 | *(_DWORD *)v16 & 0x7F;
          goto LABEL_38;
        }
        if (v7 == 1)
        {
          *unint64_t v15 = 0;
          if (v17 == 0xFFFFFF) {
            __int16 v19 = 128;
          }
          else {
            __int16 v19 = (_WORD)v17 << 8;
          }
          *(_WORD *)unint64_t v15 = v19 & 0xFF80 | *(_WORD *)v15 & 0x7F;
          goto LABEL_38;
        }
        if (v17 == 0xFFFFFF)
        {
          unsigned char *v14 = 0;
        }
        else
        {
          if (v17 <= 3)
          {
            LOBYTE(v17) = v17 | 0xF0;
LABEL_37:
            unsigned char *v14 = v17;
            goto LABEL_38;
          }
          if (v17 <= 0xEF) {
            goto LABEL_37;
          }
        }
      }
LABEL_38:
      v16 += 4;
      v15 += 2;
      ++v14;
      if (!--a2) {
        goto LABEL_41;
      }
    }
  }
  a1[3].i8[8] = a2 != 0;
LABEL_41:

  return _NSGlyphNodeSetInvariants(a1);
}

void _NSGlyphTreeDeleteGlyphsInRange(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a3)
  {
    unint64_t v32 = a2 - 1;
    size_t v12 = a3;
    do
    {
      if (_NSGlyphTreeMoveToGlyphIndex(a1, a2))
      {
        unint64_t v16 = *(void *)(*(void *)(a1 + 240) + 232);
        unsigned int v17 = *(int64x2_t **)(*(void *)(a1 + 240) + 216);
        size_t v18 = v17->i64[1] + v16;
        if (v12 + a2 <= v18) {
          size_t v19 = v12;
        }
        else {
          size_t v19 = v18 - a2;
        }
        if (!v17[3].i8[11] || !v17[1].i64[1])
        {
          uint64_t v22 = @"!!! _NSGlyphTreeDeleteGlyphsInRange missing glyphs";
LABEL_14:
          _NSGlyphTreeLogDebug((NSString *)v22, v13, v14, v15, a5, a6, a7, a8, v31);
          goto LABEL_15;
        }
        size_t v20 = a2 - v16;
        if (a2 <= v16)
        {
          size_t v23 = v19 + a2;
          if (v19 + a2 >= v18)
          {
            uint64_t v29 = v17->i64[0];
            _NSGlyphTreeDeleteCurrentNode(a1, v20, v14, v15, a5, a6, a7, a8);
            if (!v29) {
              goto LABEL_15;
            }
          }
          else
          {
            uint64_t v24 = v17[2].i64[0];
            uint64_t v25 = *(void *)(*(void *)(a1 + 240) + 224);
            if (v24)
            {
              int v26 = v17[3].u8[10];
              size_t v27 = v23 - v16;
              if (v26 == 2)
              {
                uint64_t v28 = *(int *)(v24 + 4 * v27);
              }
              else if (v26 == 1)
              {
                uint64_t v28 = *(__int16 *)(v24 + 2 * v27);
              }
              else if (v17[3].i8[10])
              {
                uint64_t v28 = 0;
              }
              else
              {
                uint64_t v28 = *(char *)(v24 + v27);
              }
              size_t v30 = v23 + v25 - v16 - v28;
            }
            else
            {
              size_t v30 = v23 - v16 + v25;
            }
            uint64_t v29 = v30 - v25;
            _NSGlyphNodeDeleteGlyphs(v17, v20, v19, v30 - v25);
            if (!v29) {
              goto LABEL_15;
            }
          }
          if (!a2 || !_NSGlyphTreeMoveToGlyphIndex(a1, v32))
          {
            uint64_t v22 = @"!!! _NSGlyphTreeDeleteGlyphsInRange invalid glyph range";
            goto LABEL_14;
          }
          **(void **)(*(void *)(a1 + 240) + 216) += v29;
          unsigned int v17 = *(int64x2_t **)(*(void *)(a1 + 240) + 216);
          size_t v20 = *(void *)(*(void *)(a1 + 240) + 232);
          size_t v21 = 0;
        }
        else
        {
          size_t v21 = v19;
        }
        _NSGlyphNodeDeleteGlyphs(v17, v20, v21, 0);
      }
      else
      {
        _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeDeleteGlyphsInRange invalid glyph range", v13, v14, v15, a5, a6, a7, a8, v31);
        size_t v19 = v12;
      }
LABEL_15:
      v12 -= v19;
    }
    while (v12);
  }

  _NSLayoutTreeInvalidateLayoutForGlyphRange(a1, a2, a3, -a3, a5, a6, a7, a8, a9);
}

int64x2_t *_NSGlyphNodeDeleteGlyphs(int64x2_t *a1, size_t a2, size_t a3, uint64_t a4)
{
  if (a3 == (__int16)a3) {
    unint64_t v8 = 0;
  }
  else {
    unint64_t v8 = 2;
  }
  if (!a1[2].i64[0] || v8 > a1[3].u8[10])
  {
    a1[3].i8[8] |= 4u;
    _NSGlyphNodeSetDeltaFormat((uint64_t)a1, v8);
  }
  size_t v9 = a1->i64[1] - a3;
  a1->i64[0] -= a4;
  a1->i64[1] = v9;
  if (a3)
  {
    unint64_t v10 = a1[3].i8[9];
    if (v10 > 3) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = qword_18E5F7310[v10];
    }
    unint64_t v12 = a1[3].u8[10];
    uint64_t v14 = a1[1].i64[1];
    uint64_t v13 = a1[2].i64[0];
    uint64_t v15 = a1[2].i64[1];
    BOOL v16 = v9 > a2;
    size_t v17 = v9 - a2;
    if (!v16)
    {
LABEL_39:
      if (v12 > 2) {
        uint64_t v26 = 0;
      }
      else {
        uint64_t v26 = qword_18E5F7330[v12];
      }
      bzero((void *)(v14 + a1->i64[1] * v11), v11 * a3);
      bzero((void *)(v13 + a1->i64[1] * v26), v26 * a3);
      if (v15) {
        bzero((void *)(v15 + a1->i64[1]), a3);
      }
      goto LABEL_44;
    }
    size_t v18 = a3 + a2;
    memmove((void *)(v14 + v11 * a2), (const void *)(v14 + v11 * (a3 + a2)), v11 * v17);
    unint64_t v19 = a1->u64[1];
    if (v19 <= a2)
    {
LABEL_37:
      if (v15) {
        memmove((void *)(v15 + a2), (const void *)(v15 + v18), v19 - a2);
      }
      goto LABEL_39;
    }
    uint64_t v28 = v15;
    unint64_t v20 = a2;
    while (1)
    {
      if (!v13) {
        goto LABEL_20;
      }
      if (v12 == 2)
      {
        uint64_t v21 = *(int *)(v13 + 4 * a3 + 4 * v20);
        goto LABEL_23;
      }
      if (v12 == 1)
      {
        uint64_t v21 = *(__int16 *)(v13 + 2 * a3 + 2 * v20);
        goto LABEL_23;
      }
      if (v12) {
LABEL_20:
      }
        uint64_t v21 = 0;
      else {
        uint64_t v21 = *(char *)(v13 + a3 + v20);
      }
LABEL_23:
      size_t v22 = v21 - a3;
      size_t v23 = v22 + a4;
      BOOL v24 = v22 + a4 != (char)(v22 + a4);
      if (v23 == (__int16)v23) {
        unint64_t v25 = v24;
      }
      else {
        unint64_t v25 = 2;
      }
      if (v25 > v12)
      {
        _NSGlyphNodeSetDeltaFormat((uint64_t)a1, v25);
        unint64_t v12 = a1[3].u8[10];
        uint64_t v13 = a1[2].i64[0];
      }
      if (v13)
      {
        switch(v12)
        {
          case 2uLL:
            *(_DWORD *)(v13 + 4 * v20) = v23;
            break;
          case 1uLL:
            *(_WORD *)(v13 + 2 * v20) = v23;
            break;
          case 0uLL:
            *(unsigned char *)(v13 + v20) = v23;
            break;
        }
      }
      ++v20;
      unint64_t v19 = a1->u64[1];
      if (v20 >= v19)
      {
        uint64_t v15 = v28;
        size_t v18 = a3 + a2;
        goto LABEL_37;
      }
    }
  }
LABEL_44:
  a1[3].i8[8] |= 0x20u;

  return _NSGlyphNodeSetInvariants(a1);
}

void _NSGlyphTreeReplaceGlyphAtIndex(uint64_t a1, unint64_t a2, unsigned int a3)
{
  if (_NSGlyphTreeMoveToGlyphIndex(a1, a2))
  {
    uint64_t v13 = *(void *)(a1 + 240);
    uint64_t v14 = *(void *)(v13 + 216);
    if (*(unsigned char *)(v14 + 59) && *(void *)(v14 + 24))
    {
      if (a3 == 0xFFFFFF
        || (a3 <= 0xFF ? (unint64_t v15 = a3 > 0xEF) : (unint64_t v15 = 2),
            v15 <= *(unsigned __int8 *)(v14 + 57)
         || (_NSGlyphNodeSetGlyphFormat(v14, v15),
             uint64_t v13 = *(void *)(a1 + 240),
             uint64_t v14 = *(void *)(v13 + 216),
             *(unsigned char *)(v14 + 59))))
      {
        uint64_t v16 = *(void *)(v14 + 24);
        if (v16)
        {
          unint64_t v17 = a2 - *(void *)(v13 + 232);
          switch(*(unsigned char *)(v14 + 57))
          {
            case 0:
              if (a3 == 0xFFFFFF)
              {
                *(unsigned char *)(v16 + v17) = 0;
              }
              else if (a3 > 3)
              {
                if (a3 <= 0xEF) {
                  *(unsigned char *)(v16 + v17) = a3;
                }
              }
              else
              {
                *(unsigned char *)(v16 + v17) = a3 | 0xF0;
              }
              break;
            case 1:
              *(unsigned char *)(v16 + 2 * v17) = 0;
              __int16 v21 = (_WORD)a3 << 8;
              if (a3 == 0xFFFFFF) {
                __int16 v21 = 128;
              }
              *(_WORD *)(v16 + 2 * v17) = v21 & 0xFF80 | *(_WORD *)(v16 + 2 * v17) & 0x7F;
              break;
            case 2:
              *(unsigned char *)(v16 + 4 * v17) = 0;
              int v18 = a3 << 8;
              if (a3 == 0xFFFFFF) {
                int v18 = 128;
              }
              *(_DWORD *)(v16 + 4 * v17) = v18 & 0xFFFFFF80 | *(_DWORD *)(v16 + 4 * v17) & 0x7F;
              break;
            case 3:
              uint64_t v19 = v16 + 24 * v17;
              *(unsigned char *)uint64_t v19 = 0;
              *(void *)(v19 + 16) = 0;
              int v20 = a3 << 8;
              if (a3 == 0xFFFFFF) {
                int v20 = 128;
              }
              *(_DWORD *)uint64_t v19 = v20 & 0xFFFFFF80 | *(_DWORD *)v19 & 0x7F;
              break;
            default:
              break;
          }
        }
      }
      uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 240) + 216) + 40);
      if (v22) {
        *(unsigned char *)(v22 + a2 - *(void *)(*(void *)(a1 + 240) + 232)) = 0;
      }
    }
    else
    {
      _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeReplaceGlyphAtIndex missing glyphs", v6, v7, v8, v9, v10, v11, v12, v25);
    }
    uint64_t v23 = *(void *)(*(void *)(a1 + 240) + 216);
    if ((*(unsigned char *)(v23 + 56) & 0x20) == 0)
    {
      *(unsigned char *)(v23 + 56) |= 0x20u;
      BOOL v24 = *(int64x2_t **)(*(void *)(a1 + 240) + 216);
      _NSGlyphNodeSetInvariants(v24);
    }
  }
  else
  {
    _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeReplaceGlyphAtIndex invalid glyph index %lu", v6, v7, v8, v9, v10, v11, v12, a2);
  }
}

void _NSGlyphNodeSetGlyphFormat(uint64_t a1, unint64_t a2)
{
  size_t v4 = *(void *)(a1 + 48);
  if (a2 > 3)
  {
    size_t v5 = 0;
    if (!v4) {
      return;
    }
LABEL_5:
    uint64_t v6 = *(unsigned __int8 **)(a1 + 24);
    if (v6)
    {
      uint64_t v7 = *(unsigned __int8 *)(a1 + 57);
      if (v7 == a2)
      {
LABEL_64:
        *(unsigned char *)(a1 + 57) = a2;
        return;
      }
      uint64_t v8 = (unsigned __int8 *)malloc_type_calloc(v4, v5, 0xD0C45EE4uLL);
      uint64_t v9 = v8;
      if (*(void *)(a1 + 8))
      {
        uint64_t v10 = 0;
        uint64_t v11 = 0;
        uint64_t v12 = 0;
        unint64_t v13 = 0;
        while (1)
        {
          switch((int)v7)
          {
            case 0:
              unsigned int v14 = v6[v13];
              if (v14 >= 4) {
                int v15 = v6[v13];
              }
              else {
                int v15 = 0xFFFFFF;
              }
              if (v14 <= 0xEF) {
                unsigned int v16 = v15;
              }
              else {
                unsigned int v16 = v14 & 3;
              }
              break;
            case 1:
              unsigned int v17 = *(unsigned __int16 *)&v6[v10];
              goto LABEL_20;
            case 2:
              unsigned int v17 = *(_DWORD *)&v6[v11];
              goto LABEL_20;
            case 3:
              unsigned int v17 = *(_DWORD *)&v6[v12];
LABEL_20:
              unsigned int v18 = v17 >> 8;
              BOOL v19 = v17 > 0xFF;
              unsigned int v16 = ((char)v17 >> 7) & 0xFFFFFF;
              if (v19) {
                unsigned int v16 = v18;
              }
              break;
            default:
              unsigned int v16 = 0;
              break;
          }
          if (!v8) {
            goto LABEL_42;
          }
          switch(a2)
          {
            case 0uLL:
              if (v16 == 0xFFFFFF)
              {
                v8[v13] = 0;
              }
              else
              {
                if (v16 <= 3)
                {
                  LOBYTE(v16) = v16 | 0xF0;
LABEL_41:
                  v8[v13] = v16;
                  goto LABEL_42;
                }
                if (v16 <= 0xEF) {
                  goto LABEL_41;
                }
              }
LABEL_42:
              switch((int)v7)
              {
                case 0:
                  unsigned int v24 = v6[v13];
                  if (v24 < 0xF0)
                  {
                    if (v24 > 3) {
                      goto LABEL_50;
                    }
                    unsigned int v25 = (8 * (_BYTE)v24) & 0x10 | ((_BYTE)v24 << 6) | 0xFFFFFF80;
                  }
                  else
                  {
                    unsigned int v25 = (16 * v24) & 0x40 | (16 * ((v24 >> 3) & 1));
                  }
                  break;
                case 1:
                  unsigned int v25 = v6[v10];
                  break;
                case 2:
                  unsigned int v25 = v6[v11];
                  break;
                case 3:
                  unsigned int v25 = v6[v12];
                  break;
                default:
LABEL_50:
                  unsigned int v25 = 0;
                  break;
              }
              if (v8)
              {
                switch(a2)
                {
                  case 0uLL:
                    unsigned int v26 = v8[v13];
                    if (v26 < 0xF0)
                    {
                      if (v26 <= 3) {
                        v8[v13] = (v25 >> 3) & 2 | ((v25 & 0x40) != 0);
                      }
                    }
                    else
                    {
                      v8[v13] = (v25 >> 1) & 8 | (v25 >> 4) & 4 | v26 & 3 | 0xF0;
                    }
                    break;
                  case 1uLL:
                    v8[v10] = v25;
                    break;
                  case 2uLL:
                    v8[v11] = v25;
                    break;
                  case 3uLL:
                    v8[v12] = v25;
                    break;
                  default:
                    break;
                }
              }
              ++v13;
              v12 += 24;
              v11 += 4;
              v10 += 2;
              if (v13 >= *(void *)(a1 + 8)) {
                goto LABEL_61;
              }
              break;
            case 1uLL:
              v8[v10] = 0;
              if (v16 == 0xFFFFFF) {
                __int16 v20 = 128;
              }
              else {
                __int16 v20 = (_WORD)v16 << 8;
              }
              *(_WORD *)&v8[v10] = v20 & 0xFF80 | *(_WORD *)&v8[v10] & 0x7F;
              goto LABEL_42;
            case 2uLL:
              v8[v11] = 0;
              if (v16 == 0xFFFFFF) {
                int v21 = 128;
              }
              else {
                int v21 = v16 << 8;
              }
              *(_DWORD *)&v8[v11] = v21 & 0xFFFFFF80 | *(_DWORD *)&v8[v11] & 0x7F;
              goto LABEL_42;
            case 3uLL:
              uint64_t v22 = &v8[v12];
              *uint64_t v22 = 0;
              *((void *)v22 + 2) = 0;
              if (v16 == 0xFFFFFF) {
                int v23 = 128;
              }
              else {
                int v23 = v16 << 8;
              }
              *(_DWORD *)uint64_t v22 = v23 & 0xFFFFFF80 | *(_DWORD *)&v8[v12] & 0x7F;
              goto LABEL_42;
            default:
              goto LABEL_42;
          }
        }
      }
LABEL_61:
      free(v6);
    }
    else
    {
      uint64_t v9 = malloc_type_calloc(v4, v5, 0x9D5A80FCuLL);
    }
    *(void *)(a1 + 24) = v9;
    goto LABEL_64;
  }
  size_t v5 = qword_18E5F7310[a2];
  if (v4) {
    goto LABEL_5;
  }
}

int64x2_t *_NSGlyphNodeSetInvariants(int64x2_t *result)
{
  for (; result; uint64_t result = (int64x2_t *)result[1].i64[0])
  {
    if (!result[3].i8[11])
    {
      __int8 v1 = 0;
      int64x2_t v2 = 0uLL;
      for (uint64_t i = 3; i != 6; ++i)
      {
        size_t v4 = (int64x2_t *)result->i64[i];
        if (v4)
        {
          int64x2_t v2 = vaddq_s64(*v4, v2);
          v1 |= v4[3].u8[8];
        }
      }
      *uint64_t result = v2;
      result[3].i8[8] = v1;
    }
  }
  return result;
}

void _NSGlyphTreeSetCharacterIndexForGlyphAtIndex(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (!_NSGlyphTreeMoveToGlyphIndex(a1, a3)) {
    goto LABEL_63;
  }
  uint64_t v12 = *(int64x2_t **)(*(void *)(a1 + 240) + 216);
  if (!v12[3].i8[11]) {
    goto LABEL_63;
  }
  uint64_t v13 = v12[1].i64[1];
  if (!v13) {
    goto LABEL_63;
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 240) + 232);
  size_t v15 = a3 - v14;
  switch(v12[3].i8[9])
  {
    case 0:
      unsigned int v16 = *(unsigned __int8 *)(v13 + v15);
      if (v16 <= 0xEF)
      {
        if (v16 > 3)
        {
          unsigned int v18 = 0;
          unsigned int v17 = v16;
        }
        else
        {
          unsigned int v18 = (8 * v16) & 0x10 | (v16 << 6) | 0xFFFFFF80;
          unsigned int v17 = 0xFFFFFF;
        }
      }
      else
      {
        unsigned int v17 = v16 & 3;
        unsigned int v18 = (16 * v16) & 0x40 | (16 * ((v16 >> 3) & 1));
      }
      break;
    case 1:
      unsigned int v18 = *(unsigned __int16 *)(v13 + 2 * v15);
      goto LABEL_11;
    case 2:
      unsigned int v18 = *(_DWORD *)(v13 + 4 * v15);
      goto LABEL_11;
    case 3:
      unsigned int v18 = *(_DWORD *)(v13 + 24 * v15);
LABEL_11:
      if (v18 >= 0x100) {
        unsigned int v17 = v18 >> 8;
      }
      else {
        unsigned int v17 = ((char)v18 >> 7) & 0xFFFFFF;
      }
      break;
    default:
      unsigned int v17 = 0;
      unsigned int v18 = 0;
      break;
  }
  uint64_t v19 = v12[2].i64[1];
  if (v19) {
    int v20 = *(unsigned __int8 *)(v19 + v15);
  }
  else {
    int v20 = 0;
  }
  unint64_t v21 = *(void *)(*(void *)(a1 + 240) + 224);
  if (v21 > a2 && a3 == v14 && v14 != 0)
  {
    uint64_t v28 = v12[2].i64[0];
    if (v28)
    {
      int v29 = v12[3].u8[10];
      if (v29 == 2)
      {
        uint64_t v30 = *(int *)(v28 + 4);
      }
      else if (v29 == 1)
      {
        uint64_t v30 = *(__int16 *)(v28 + 2);
      }
      else if (v12[3].i8[10])
      {
        uint64_t v30 = 0;
      }
      else
      {
        uint64_t v30 = *(char *)(v28 + 1);
      }
      unint64_t v31 = v21 + 1 - v30;
    }
    else
    {
      unint64_t v31 = v21 + 1;
    }
    uint64_t v32 = v31 - v21;
    _NSGlyphNodeDeleteGlyphs(v12, v15, 1uLL, v31 - v21);
    if (_NSGlyphTreeMoveToGlyphIndex(a1, a3 - 1))
    {
      uint64_t v40 = *(void *)(*(void *)(a1 + 240) + 216);
      if (*(unsigned char *)(v40 + 59))
      {
        if (*(void *)(v40 + 24))
        {
          uint64_t v41 = *(void *)(*(void *)(a1 + 240) + 224) + *(void *)v40 - 1;
          goto LABEL_59;
        }
      }
    }
LABEL_62:
    _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeSetCharacterIndexForGlyphAtIndex invalid glyph index %lu", v33, v34, v35, v36, v37, v38, v39, a3);
    goto LABEL_63;
  }
  unint64_t v24 = v12->i64[0] + v21;
  if (v24 > a2
    || a3 + 1 != v12->i64[1] + v14
    || a3 + 1 >= *(void *)(*(void *)(*(void *)(a1 + 240) + 208) + 8))
  {
    goto LABEL_63;
  }
  uint64_t v25 = v12[2].i64[0];
  if (v25)
  {
    int v26 = v12[3].u8[10];
    if (v26 == 2)
    {
      uint64_t v27 = *(int *)(v25 + 4 * v15);
    }
    else if (v26 == 1)
    {
      uint64_t v27 = *(__int16 *)(v25 + 2 * v15);
    }
    else if (v12[3].i8[10])
    {
      uint64_t v27 = 0;
    }
    else
    {
      uint64_t v27 = *(char *)(v25 + v15);
    }
    size_t v42 = v21 + a3 - v14 - v27;
  }
  else
  {
    size_t v42 = v21 + v15;
  }
  uint64_t v32 = v24 - v42;
  _NSGlyphNodeDeleteGlyphs(v12, v15, 1uLL, v24 - v42);
  if (!_NSGlyphTreeMoveToGlyphIndex(a1, a3)) {
    goto LABEL_62;
  }
  uint64_t v40 = *(void *)(*(void *)(a1 + 240) + 216);
  if (!*(unsigned char *)(v40 + 59) || !*(void *)(v40 + 24)) {
    goto LABEL_62;
  }
  uint64_t v41 = *(void *)(*(void *)(a1 + 240) + 224);
LABEL_59:
  if (v41 != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)v40 += v32;
    if (v17 == 0xFFFFFF)
    {
      uint64_t v43 = 0;
    }
    else if (v17 <= 0xFF)
    {
      uint64_t v43 = v17 > 0xEF;
    }
    else
    {
      uint64_t v43 = 2;
    }
    if ((_BYTE)v18) {
      BOOL v76 = v43 == 0;
    }
    else {
      BOOL v76 = 0;
    }
    uint64_t v77 = *(uint64_t **)(a1 + 240);
    if (v76) {
      unint64_t v78 = 1;
    }
    else {
      unint64_t v78 = v43;
    }
    uint64_t v79 = (int64x2_t *)v77[27];
    if (v78 > v79[3].u8[9])
    {
      uint64_t v80 = v41;
      _NSGlyphNodeSetGlyphFormat(v77[27], v78);
      uint64_t v41 = v80;
      uint64_t v77 = *(uint64_t **)(a1 + 240);
      uint64_t v79 = (int64x2_t *)v77[27];
    }
    if (v79[2].i64[1]) {
      BOOL v81 = 1;
    }
    else {
      BOOL v81 = v20 == 0;
    }
    if (!v81)
    {
      v79[3].i8[8] |= 8u;
      uint64_t v77 = *(uint64_t **)(a1 + 240);
      uint64_t v79 = (int64x2_t *)v77[27];
      size_t v82 = v79[3].u64[0];
      if (v82)
      {
        if (!v79[2].i64[1])
        {
          uint64_t v92 = v41;
          __int16 v83 = malloc_type_calloc(v82, 1uLL, 0x68C02440uLL);
          uint64_t v41 = v92;
          v79[2].i64[1] = (uint64_t)v83;
          uint64_t v77 = *(uint64_t **)(a1 + 240);
          uint64_t v79 = (int64x2_t *)v77[27];
        }
      }
    }
    _NSGlyphNodeInsertGlyph(v79, v41 - v77[28], a3 - v77[29], v32, v17);
    uint64_t v84 = *(void *)(*(void *)(a1 + 240) + 216);
    if (*(unsigned char *)(v84 + 59))
    {
      uint64_t v85 = *(void *)(v84 + 24);
      if (v85)
      {
        unint64_t v86 = a3 - *(void *)(*(void *)(a1 + 240) + 232);
        switch(*(unsigned char *)(v84 + 57))
        {
          case 0:
            unsigned int v87 = *(unsigned __int8 *)(v85 + v86);
            if (v87 < 0xF0)
            {
              if (v87 > 3) {
                break;
              }
              int v88 = (v18 >> 3) & 2 | (v18 >> 6) & 1;
            }
            else
            {
              int v88 = (v18 >> 1) & 8 | (v18 >> 4) & 4 | v87 & 3 | 0xF0;
            }
            *(unsigned char *)(v85 + v86) = v88;
            break;
          case 1:
            uint64_t v89 = 2 * v86;
            goto LABEL_148;
          case 2:
            uint64_t v89 = 4 * v86;
            goto LABEL_148;
          case 3:
            uint64_t v89 = 24 * v86;
LABEL_148:
            *(unsigned char *)(v85 + v89) = v18;
            break;
          default:
            break;
        }
      }
    }
    uint64_t v90 = *(void *)(*(void *)(*(void *)(a1 + 240) + 216) + 40);
    if (v90) {
      *(unsigned char *)(v90 + a3 - *(void *)(*(void *)(a1 + 240) + 232)) = v20;
    }
  }
LABEL_63:
  if (!_NSGlyphTreeMoveToGlyphIndex(a1, a3))
  {
    _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeSetCharacterIndexForGlyphAtIndex invalid glyph index %lu", v44, v45, v46, v47, v48, v49, v50, a3);
    return;
  }
  unint64_t v51 = *(void *)(*(void *)(a1 + 240) + 224);
  uint64_t v52 = v51 - a2;
  if (v51 > a2 || (uint64_t v53 = *(void *)(*(void *)(a1 + 240) + 216), *(void *)v53 + v51 <= a2))
  {
    unint64_t v60 = @"!!! _NSGlyphTreeSetCharacterIndexForGlyphAtIndex invalid char index 1";
LABEL_76:
    _NSGlyphTreeLogDebug((NSString *)v60, v44, v45, v46, v47, v48, v49, v50, a9);
    return;
  }
  unint64_t v54 = *(void *)(*(void *)(a1 + 240) + 232);
  uint64_t v55 = a3 - v54;
  if (a3 > v54)
  {
    if (*(unsigned char *)(v53 + 59) && (uint64_t v56 = *(void *)(v53 + 32)) != 0)
    {
      int v57 = *(unsigned __int8 *)(v53 + 58);
      uint64_t v58 = a3 - 1 - v54;
      if (v57 == 2)
      {
        uint64_t v59 = *(int *)(v56 + 4 * v58);
      }
      else if (v57 == 1)
      {
        uint64_t v59 = *(__int16 *)(v56 + 2 * v58);
      }
      else
      {
        uint64_t v59 = *(unsigned char *)(v53 + 58) ? 0 : *(char *)(v56 + v58);
      }
      unint64_t v61 = v51 + a3 - 1 - v54 - v59;
    }
    else
    {
      unint64_t v61 = v51 + a3 + ~v54;
    }
    if (v61 > a2)
    {
      unint64_t v60 = @"!!! _NSGlyphTreeSetCharacterIndexForGlyphAtIndex invalid char index 2";
      goto LABEL_76;
    }
  }
  unint64_t v62 = a3 + 1;
  if (a3 + 1 < *(void *)(v53 + 8) + v54)
  {
    if (*(unsigned char *)(v53 + 59) && (uint64_t v63 = *(void *)(v53 + 32)) != 0)
    {
      uint64_t v44 = *(unsigned __int8 *)(v53 + 58);
      uint64_t v64 = v62 - v54;
      if (v44 == 2)
      {
        uint64_t v65 = *(int *)(v63 + 4 * v64);
      }
      else if (v44 == 1)
      {
        uint64_t v65 = *(__int16 *)(v63 + 2 * v64);
      }
      else
      {
        uint64_t v65 = *(unsigned char *)(v53 + 58) ? 0 : *(char *)(v63 + v64);
      }
      unint64_t v66 = v51 + v62 - v54 - v65;
    }
    else
    {
      unint64_t v66 = v51 + v62 - v54;
    }
    if (v66 < a2)
    {
      unint64_t v60 = @"!!! _NSGlyphTreeSetCharacterIndexForGlyphAtIndex invalid char index 3";
      goto LABEL_76;
    }
  }
  uint64_t v67 = v55 + v52;
  BOOL v68 = v55 + v52 != (char)(v55 + v52);
  if (v67 == (__int16)v67) {
    unint64_t v69 = v68;
  }
  else {
    unint64_t v69 = 2;
  }
  if (*(unsigned char *)(v53 + 59) && *(void *)(v53 + 24))
  {
    if (*(void *)(v53 + 32))
    {
      if (v69 > *(unsigned __int8 *)(v53 + 58)) {
        _NSGlyphNodeSetDeltaFormat(v53, v69);
      }
    }
    else
    {
      *(unsigned char *)(v53 + 56) |= 4u;
      _NSGlyphNodeSetDeltaFormat(*(void *)(*(void *)(a1 + 240) + 216), v69);
      _NSGlyphNodeSetInvariants(*(int64x2_t **)(*(void *)(a1 + 240) + 216));
    }
    uint64_t v72 = *(void *)(*(void *)(a1 + 240) + 216);
    if (*(unsigned char *)(v72 + 59))
    {
      uint64_t v73 = *(void *)(v72 + 32);
      if (v73)
      {
        unint64_t v74 = a3 - *(void *)(*(void *)(a1 + 240) + 232);
        int v75 = *(unsigned __int8 *)(v72 + 58);
        switch(v75)
        {
          case 2:
            *(_DWORD *)(v73 + 4 * v74) = v67;
            break;
          case 1:
            *(_WORD *)(v73 + 2 * v74) = v67;
            break;
          case 0:
            *(unsigned char *)(v73 + v74) = v67;
            break;
        }
      }
    }
  }
  else
  {
    _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeSetCharacterIndexForGlyphAtIndex missing glyphs", v69, v45, v46, v47, v48, v49, v50, v91);
  }
  uint64_t v70 = *(void *)(*(void *)(a1 + 240) + 216);
  if ((*(unsigned char *)(v70 + 56) & 0x20) == 0)
  {
    *(unsigned char *)(v70 + 56) |= 0x20u;
    uint64_t v71 = *(int64x2_t **)(*(void *)(a1 + 240) + 216);
    _NSGlyphNodeSetInvariants(v71);
  }
}

void _NSGlyphNodeSetDeltaFormat(uint64_t a1, unint64_t a2)
{
  size_t v4 = *(void *)(a1 + 48);
  if (a2 > 2)
  {
    size_t v5 = 0;
    if (!v4) {
      return;
    }
LABEL_5:
    uint64_t v6 = *(__int16 **)(a1 + 32);
    if (v6)
    {
      uint64_t v7 = *(unsigned __int8 *)(a1 + 58);
      if (v7 == a2)
      {
LABEL_29:
        *(unsigned char *)(a1 + 5_Block_object_dispose(&STACK[0x2B0], 8) = a2;
        return;
      }
      uint64_t v8 = malloc_type_calloc(v4, v5, 0x232E7F18uLL);
      uint64_t v9 = v8;
      unint64_t v10 = *(void *)(a1 + 8);
      if (v10)
      {
        for (unint64_t i = 0; i < v10; ++i)
        {
          if (v7 == 2)
          {
            int v12 = *(_DWORD *)&v6[2 * i];
            if (v8) {
              goto LABEL_19;
            }
          }
          else if (v7 == 1)
          {
            int v12 = v6[i];
            if (v8) {
              goto LABEL_19;
            }
          }
          else if (v7)
          {
            int v12 = 0;
            if (v8)
            {
LABEL_19:
              switch(a2)
              {
                case 2uLL:
                  *((_DWORD *)v8 + i) = v12;
                  break;
                case 1uLL:
                  *((_WORD *)v8 + i) = v12;
                  break;
                case 0uLL:
                  *((unsigned char *)v8 + i) = v12;
                  unint64_t v10 = *(void *)(a1 + 8);
                  break;
              }
            }
          }
          else
          {
            int v12 = *((char *)v6 + i);
            if (v8) {
              goto LABEL_19;
            }
          }
        }
      }
      free(v6);
    }
    else
    {
      uint64_t v9 = malloc_type_calloc(v4, v5, 0x6D5A52B7uLL);
    }
    *(void *)(a1 + 32) = v9;
    goto LABEL_29;
  }
  size_t v5 = qword_18E5F7330[a2];
  if (v4) {
    goto LABEL_5;
  }
}

void _NSGlyphTreeSetIntAttributeForGlyphAtIndex(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (!_NSGlyphTreeMoveToGlyphIndex(a1, a2))
  {
    _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeSetIntAttributeForGlyphAtIndex invalid glyph index %lu", v13, v14, v15, v16, v17, v18, v19, a2);
    return;
  }
  uint64_t v20 = *(void *)(a1 + 240);
  uint64_t v21 = *(void *)(v20 + 216);
  if (!*(unsigned char *)(v21 + 59) || (uint64_t v22 = *(void *)(v21 + 24)) == 0)
  {
    if (a4)
    {
      _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeSetIntAttributeForGlyphAtIndex missing glyphs", v13, v14, v15, v16, v17, v18, v19, a9);
    }
    return;
  }
  if (a3 == 2)
  {
    if (a4 && !*(void *)(v21 + 40))
    {
      *(unsigned char *)(v21 + 56) |= 8u;
      int v23 = *(int64x2_t **)(*(void *)(a1 + 240) + 216);
      size_t v24 = v23[3].u64[0];
      if (v24 && !v23[2].i64[1])
      {
        v23[2].i64[1] = (uint64_t)malloc_type_calloc(v24, 1uLL, 0x68C02440uLL);
        int v23 = *(int64x2_t **)(*(void *)(a1 + 240) + 216);
      }
      _NSGlyphNodeSetInvariants(v23);
      uint64_t v20 = *(void *)(a1 + 240);
      uint64_t v21 = *(void *)(v20 + 216);
    }
    uint64_t v25 = *(void *)(v21 + 40);
    if (v25) {
      *(unsigned char *)(v25 + a2 - *(void *)(v20 + 232)) = a4;
    }
    return;
  }
  if (a4 && !*(unsigned char *)(v21 + 57))
  {
    if (a3 == 1 && *(unsigned __int8 *)(v22 + a2 - *(void *)(v20 + 232)) - 240 < 0xFFFFFF14) {
      goto LABEL_41;
    }
    _NSGlyphNodeSetGlyphFormat(v21, 1uLL);
  }
  if (a3 != 5)
  {
    if (a3 != 1)
    {
      if (!a3)
      {
        uint64_t v26 = *(void *)(*(void *)(a1 + 240) + 216);
        if (*(unsigned char *)(v26 + 59))
        {
          uint64_t v27 = *(void *)(v26 + 24);
          if (v27)
          {
            unint64_t v28 = a2 - *(void *)(*(void *)(a1 + 240) + 232);
            int v29 = *(unsigned __int8 *)(v26 + 57);
            switch(v29)
            {
              case 3:
                *(_DWORD *)(v27 + 24 * v2_Block_object_dispose(&STACK[0x2B0], 8) = *(_DWORD *)(v27 + 24 * v28) & 0xFFFFFFF7 | (8 * (a4 != 0));
                return;
              case 2:
                *(_DWORD *)(v27 + 4 * v2_Block_object_dispose(&STACK[0x2B0], 8) = *(_DWORD *)(v27 + 4 * v28) & 0xFFFFFFF7 | (8 * (a4 != 0));
                return;
              case 1:
                __int16 v30 = *(_WORD *)(v27 + 2 * v28) & 0xFFF7 | (8 * (a4 != 0));
LABEL_39:
                *(_WORD *)(v27 + 2 * v2_Block_object_dispose(&STACK[0x2B0], 8) = v30;
                return;
            }
          }
        }
      }
      return;
    }
    uint64_t v20 = *(void *)(a1 + 240);
    uint64_t v21 = *(void *)(v20 + 216);
    if (!*(unsigned char *)(v21 + 59)) {
      return;
    }
LABEL_41:
    uint64_t v33 = *(void *)(v21 + 24);
    if (v33)
    {
      unint64_t v34 = a2 - *(void *)(v20 + 232);
      switch(*(unsigned char *)(v21 + 57))
      {
        case 0:
          unsigned int v35 = *(unsigned __int8 *)(v33 + v34);
          if (v35 < 0xF0)
          {
            if (v35 <= 3) {
              *(unsigned char *)(v33 + v34) = v35 & 1 | (2 * (a4 != 0));
            }
          }
          else
          {
            if (a4) {
              char v36 = -8;
            }
            else {
              char v36 = -16;
            }
            *(unsigned char *)(v33 + v34) = v36 & 0xF8 | v35 & 7;
          }
          break;
        case 1:
          *(_WORD *)(v33 + 2 * v34) = *(_WORD *)(v33 + 2 * v34) & 0xFFEF | (16 * (a4 != 0));
          break;
        case 2:
          *(_DWORD *)(v33 + 4 * v34) = *(_DWORD *)(v33 + 4 * v34) & 0xFFFFFFEF | (16 * (a4 != 0));
          break;
        case 3:
          *(_DWORD *)(v33 + 24 * v34) = *(_DWORD *)(v33 + 24 * v34) & 0xFFFFFFEF | (16 * (a4 != 0));
          break;
        default:
          return;
      }
    }
    return;
  }
  uint64_t v31 = *(void *)(*(void *)(a1 + 240) + 216);
  if (*(unsigned char *)(v31 + 59))
  {
    uint64_t v27 = *(void *)(v31 + 24);
    if (v27)
    {
      unint64_t v28 = a2 - *(void *)(*(void *)(a1 + 240) + 232);
      int v32 = *(unsigned __int8 *)(v31 + 57);
      switch(v32)
      {
        case 3:
          *(_DWORD *)(v27 + 24 * v2_Block_object_dispose(&STACK[0x2B0], 8) = *(_DWORD *)(v27 + 24 * v28) & 0xFFFFFFFE | (a4 != 0);
          return;
        case 2:
          *(_DWORD *)(v27 + 4 * v2_Block_object_dispose(&STACK[0x2B0], 8) = *(_DWORD *)(v27 + 4 * v28) & 0xFFFFFFFE | (a4 != 0);
          return;
        case 1:
          __int16 v30 = *(_WORD *)(v27 + 2 * v28) & 0xFFFE | (a4 != 0);
          goto LABEL_39;
      }
    }
  }
}

void _NSGlyphTreeSetNotShownAttributeForGlyphAtIndex(uint64_t a1, unint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (!_NSGlyphTreeMoveToGlyphIndex(a1, a2))
  {
    _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeSetNotShownAttributeForGlyphAtIndex invalid glyph index %lu", v12, v13, v14, v15, v16, v17, v18, a2);
    return;
  }
  uint64_t v19 = *(void *)(a1 + 240);
  uint64_t v20 = *(void *)(v19 + 216);
  if (*(unsigned char *)(v20 + 59) && (uint64_t v21 = *(void *)(v20 + 24)) != 0)
  {
    if (!a3
      || *(unsigned char *)(v20 + 57)
      || *(unsigned __int8 *)(v21 + a2 - *(void *)(v19 + 232)) - 240 < 0xFFFFFF14
      || (_NSGlyphNodeSetGlyphFormat(v20, 1uLL),
          uint64_t v19 = *(void *)(a1 + 240),
          uint64_t v20 = *(void *)(v19 + 216),
          *(unsigned char *)(v20 + 59)))
    {
      uint64_t v22 = *(void *)(v20 + 24);
      if (v22)
      {
        unint64_t v23 = a2 - *(void *)(v19 + 232);
        switch(*(unsigned char *)(v20 + 57))
        {
          case 0:
            unsigned int v24 = *(unsigned __int8 *)(v22 + v23);
            if (v24 < 0xF0)
            {
              if (v24 > 3) {
                return;
              }
              char v27 = v24 & 2 | a3;
            }
            else
            {
              char v25 = v24 & 0xFB;
              if (a3) {
                char v26 = -12;
              }
              else {
                char v26 = -16;
              }
              char v27 = v25 | v26;
            }
            *(unsigned char *)(v22 + v23) = v27;
            break;
          case 1:
            if (a3) {
              __int16 v31 = 64;
            }
            else {
              __int16 v31 = 0;
            }
            *(_WORD *)(v22 + 2 * v23) = *(_WORD *)(v22 + 2 * v23) & 0xFFBF | v31;
            break;
          case 2:
            if (a3) {
              int v28 = 64;
            }
            else {
              int v28 = 0;
            }
            *(_DWORD *)(v22 + 4 * v23) = *(_DWORD *)(v22 + 4 * v23) & 0xFFFFFFBF | v28;
            break;
          case 3:
            uint64_t v29 = 24 * v23;
            if (a3) {
              int v30 = 64;
            }
            else {
              int v30 = 0;
            }
            *(_DWORD *)(v22 + v29) = *(_DWORD *)(v22 + v29) & 0xFFFFFFBF | v30;
            break;
          default:
            return;
        }
      }
    }
  }
  else if (a3)
  {
    _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeSetNotShownAttributeForGlyphAtIndex missing glyphs", v12, v13, v14, v15, v16, v17, v18, a9);
  }
}

void _NSGlyphTreeSetDrawsOutsideLineFragmentForGlyphAtIndex(uint64_t a1, unint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (_NSGlyphTreeMoveToGlyphIndex(a1, a2))
  {
    uint64_t v19 = *(void *)(a1 + 240);
    uint64_t v20 = *(void *)(v19 + 216);
    if (*(unsigned char *)(v20 + 59) && *(void *)(v20 + 24))
    {
      if (!a3
        || *(unsigned char *)(v20 + 57)
        || (_NSGlyphNodeSetGlyphFormat(v20, 1uLL),
            uint64_t v19 = *(void *)(a1 + 240),
            uint64_t v20 = *(void *)(v19 + 216),
            *(unsigned char *)(v20 + 59)))
      {
        uint64_t v21 = *(void *)(v20 + 24);
        if (v21)
        {
          unint64_t v22 = a2 - *(void *)(v19 + 232);
          int v23 = *(unsigned __int8 *)(v20 + 57);
          switch(v23)
          {
            case 3:
              uint64_t v25 = 24 * v22;
              if (a3) {
                int v26 = 32;
              }
              else {
                int v26 = 0;
              }
              *(_DWORD *)(v21 + v25) = *(_DWORD *)(v21 + v25) & 0xFFFFFFDF | v26;
              break;
            case 2:
              if (a3) {
                int v27 = 32;
              }
              else {
                int v27 = 0;
              }
              *(_DWORD *)(v21 + 4 * v22) = *(_DWORD *)(v21 + 4 * v22) & 0xFFFFFFDF | v27;
              break;
            case 1:
              if (a3) {
                __int16 v24 = 32;
              }
              else {
                __int16 v24 = 0;
              }
              *(_WORD *)(v21 + 2 * v22) = *(_WORD *)(v21 + 2 * v22) & 0xFFDF | v24;
              break;
          }
        }
      }
    }
    else if (a3)
    {
      _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeSetDrawsOutsideLineFragmentForGlyphAtIndex missing glyphs", v12, v13, v14, v15, v16, v17, v18, a9);
    }
  }
  else
  {
    _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeSetDrawsOutsideLineFragmentForGlyphAtIndex invalid glyph index %lu", v12, v13, v14, v15, v16, v17, v18, a2);
  }
}

void _NSGlyphTreeSetEllipsisAttributeForGlyphAtIndex(uint64_t a1, unint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (_NSGlyphTreeMoveToGlyphIndex(a1, a2))
  {
    uint64_t v19 = *(void *)(a1 + 240);
    uint64_t v20 = *(void *)(v19 + 216);
    if (*(unsigned char *)(v20 + 59) && *(void *)(v20 + 24))
    {
      if (!a3
        || *(unsigned char *)(v20 + 57)
        || (_NSGlyphNodeSetGlyphFormat(v20, 1uLL),
            uint64_t v19 = *(void *)(a1 + 240),
            uint64_t v20 = *(void *)(v19 + 216),
            *(unsigned char *)(v20 + 59)))
      {
        uint64_t v21 = *(void *)(v20 + 24);
        if (v21)
        {
          unint64_t v22 = a2 - *(void *)(v19 + 232);
          int v23 = *(unsigned __int8 *)(v20 + 57);
          switch(v23)
          {
            case 3:
              uint64_t v25 = 24 * v22;
              if (a3) {
                int v26 = 2;
              }
              else {
                int v26 = 0;
              }
              *(_DWORD *)(v21 + v25) = *(_DWORD *)(v21 + v25) & 0xFFFFFFFD | v26;
              break;
            case 2:
              if (a3) {
                int v27 = 2;
              }
              else {
                int v27 = 0;
              }
              *(_DWORD *)(v21 + 4 * v22) = *(_DWORD *)(v21 + 4 * v22) & 0xFFFFFFFD | v27;
              break;
            case 1:
              if (a3) {
                __int16 v24 = 2;
              }
              else {
                __int16 v24 = 0;
              }
              *(_WORD *)(v21 + 2 * v22) = *(_WORD *)(v21 + 2 * v22) & 0xFFFD | v24;
              break;
          }
        }
      }
    }
    else if (a3)
    {
      _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeSetEllipsisAttributeForGlyphAtIndex missing glyphs", v12, v13, v14, v15, v16, v17, v18, a9);
    }
  }
  else
  {
    _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeSetEllipsisAttributeForGlyphAtIndex invalid glyph index %lu", v12, v13, v14, v15, v16, v17, v18, a2);
  }
}

void _NSGlyphTreeResetLayoutAttributesForGlyphsInRange(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  unint64_t v9 = a2 + a3;
  if (a2 < a2 + a3)
  {
    unint64_t v10 = a2;
    while (_NSGlyphTreeMoveToGlyphIndex(a1, v10))
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 240) + 232);
      uint64_t v20 = *(void *)(*(void *)(a1 + 240) + 216);
      unint64_t v21 = *(void *)(v20 + 8) + v19;
      if (v21 >= v9) {
        unint64_t v22 = v9;
      }
      else {
        unint64_t v22 = *(void *)(v20 + 8) + v19;
      }
      if (*(unsigned char *)(v20 + 59))
      {
        if (*(void *)(v20 + 24) && v10 < v22)
        {
          uint64_t v24 = 24 * v10;
          while (2)
          {
            uint64_t v25 = *(void *)(*(void *)(a1 + 240) + 216);
            if (!*(unsigned char *)(v25 + 59)) {
              goto LABEL_24;
            }
            uint64_t v26 = *(void *)(v25 + 24);
            if (!v26) {
              goto LABEL_24;
            }
            uint64_t v27 = *(void *)(*(void *)(a1 + 240) + 232);
            switch(*(unsigned char *)(v25 + 57))
            {
              case 0:
                uint64_t v28 = v26 - v27;
                unsigned int v29 = *(unsigned __int8 *)(v28 + v10);
                if (v29 >= 0xF0)
                {
                  char v30 = v29 & 0xB | 0xF0;
                  goto LABEL_23;
                }
                if (v29 <= 3)
                {
                  char v30 = v29 & 2;
LABEL_23:
                  *(unsigned char *)(v28 + v10) = v30;
                }
LABEL_24:
                ++v10;
                v24 += 24;
                if (v22 == v10) {
                  break;
                }
                continue;
              case 1:
                *(_WORD *)(v26 - 2 * v27 + 2 * v10) &= 0xFF9Du;
                goto LABEL_24;
              case 2:
                *(_DWORD *)(v26 - 4 * v27 + 4 * v10) &= 0xFFFFFF9D;
                goto LABEL_24;
              case 3:
                *(_DWORD *)(v26 - 24 * v27 + v24) &= 0xFFFFFF9D;
                goto LABEL_24;
              default:
                goto LABEL_24;
            }
            break;
          }
        }
      }
      unint64_t v10 = v22;
      if (v9 <= v21) {
        return;
      }
    }
    _NSGlyphTreeLogDebug((NSString *)@"!!! _NSGlyphTreeResetNotShownAttributeAndDrawsOutsideLineFragmentForGlyphsInRange invalid glyph range", v12, v13, v14, v15, v16, v17, v18, a9);
  }
}

void _NSGlyphNodeSetCapacity(uint64_t a1, size_t count)
{
  if (count)
  {
    unint64_t v4 = *(char *)(a1 + 57);
    if (v4 > 3) {
      size_t v5 = 0;
    }
    else {
      size_t v5 = qword_18E5F7310[v4];
    }
    unint64_t v9 = *(char *)(a1 + 58);
    if (v9 > 2) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = qword_18E5F7330[v9];
    }
    uint64_t v11 = *(void **)(a1 + 24);
    if (v11)
    {
      uint64_t v12 = (char *)malloc_type_realloc(v11, v5 * count, 0xFFF8BB3uLL);
      *(void *)(a1 + 24) = v12;
      unint64_t v13 = *(void *)(a1 + 8);
      if (count > v13) {
        bzero(&v12[v13 * v5], (count - v13) * v5);
      }
    }
    else
    {
      *(void *)(a1 + 24) = malloc_type_calloc(count, v5, 0x613E76F8uLL);
    }
    uint64_t v14 = *(void **)(a1 + 32);
    if (v14)
    {
      uint64_t v15 = (char *)malloc_type_realloc(v14, v10 * count, 0xC5D7BF81uLL);
      *(void *)(a1 + 32) = v15;
      unint64_t v16 = *(void *)(a1 + 8);
      if (count > v16) {
        bzero(&v15[v16 * v10], (count - v16) * v10);
      }
    }
    uint64_t v17 = *(void **)(a1 + 40);
    if (v17)
    {
      uint64_t v18 = (char *)malloc_type_realloc(v17, count, 0x77C57A6BuLL);
      *(void *)(a1 + 40) = v18;
      unint64_t v19 = *(void *)(a1 + 8);
      if (count > v19) {
        bzero(&v18[v19], count - v19);
      }
    }
  }
  else
  {
    uint64_t v6 = *(void **)(a1 + 24);
    if (v6)
    {
      free(v6);
      *(void *)(a1 + 24) = 0;
    }
    uint64_t v7 = *(void **)(a1 + 32);
    if (v7)
    {
      free(v7);
      *(void *)(a1 + 32) = 0;
    }
    uint64_t v8 = *(void **)(a1 + 40);
    if (v8)
    {
      free(v8);
      *(void *)(a1 + 40) = 0;
    }
    *(_WORD *)(a1 + 57) = 0;
  }
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x2B0], 8) = count;
}

void sub_18E55441C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

_NSRange -[NSLayoutManager _blockRangeForCharRange:](NSLayoutManager *self, SEL a2, _NSRange a3)
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v6 = [(NSTextStorage *)self->_textStorage length];
  if (location >= v6)
  {
    NSUInteger v13 = length;
    NSUInteger v14 = location;
    goto LABEL_24;
  }
  unint64_t v7 = v6;
  uint64_t v8 = objc_msgSend((id)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", @"NSParagraphStyle", location, 0), "textBlocks");
  if (!v8 || (unint64_t v9 = v8, ![v8 count]))
  {
    NSUInteger v15 = 0;
    NSUInteger v16 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_8:
    NSUInteger v13 = length;
    NSUInteger v14 = location;
    goto LABEL_12;
  }
  uint64_t v10 = (void *)[v9 objectAtIndex:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = -[NSAttributedString rangeOfTextTable:atIndex:](self->_textStorage, "rangeOfTextTable:atIndex:", [v10 table], location);
  }
  else {
    uint64_t v11 = [(NSAttributedString *)self->_textStorage rangeOfTextBlock:v10 atIndex:location];
  }
  NSUInteger v16 = v11;
  NSUInteger v15 = v12;
  if (!v12) {
    goto LABEL_8;
  }
  v33.NSUInteger location = location;
  v33.NSUInteger length = length;
  v36.NSUInteger location = v16;
  v36.NSUInteger length = v15;
  NSRange v17 = NSUnionRange(v33, v36);
  NSUInteger v14 = v17.location;
  NSUInteger v13 = v17.length;
LABEL_12:
  if (length >= 2)
  {
    NSUInteger v18 = location + length;
    if (location + length < v7)
    {
      NSUInteger v19 = v18 - 1;
      BOOL v20 = v18 - 1 >= v16;
      NSUInteger v21 = v18 - 1 - v16;
      if (!v20 || v21 >= v15)
      {
        unint64_t v22 = objc_msgSend((id)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", @"NSParagraphStyle", v19, 0), "textBlocks");
        if (v22)
        {
          int v23 = v22;
          if ([v22 count])
          {
            uint64_t v24 = (void *)[v23 objectAtIndex:0];
            objc_opt_class();
            isKindOfClass Class = objc_opt_isKindOfClass();
            textStorage = self->_textStorage;
            if (isKindOfClass) {
              NSUInteger v27 = -[NSAttributedString rangeOfTextTable:atIndex:](textStorage, "rangeOfTextTable:atIndex:", [v24 table], v19);
            }
            else {
              NSUInteger v27 = [(NSAttributedString *)textStorage rangeOfTextBlock:v24 atIndex:v19];
            }
            v29.NSUInteger location = v27;
            v29.NSUInteger length = v28;
            if (v28)
            {
              v34.NSUInteger location = v14;
              v34.NSUInteger length = v13;
              NSRange v30 = NSUnionRange(v34, v29);
              NSUInteger v14 = v30.location;
              NSUInteger v13 = v30.length;
            }
          }
        }
      }
    }
  }
LABEL_24:
  NSUInteger v31 = v14;
  NSUInteger v32 = v13;
  result.NSUInteger length = v32;
  result.NSUInteger location = v31;
  return result;
}

_NSRange -[NSLayoutManager _blockRangeForGlyphRange:](NSLayoutManager *self, SEL a2, _NSRange a3)
{
  uint64_t v4 = -[NSLayoutManager _primitiveCharacterRangeForGlyphRange:](self, "_primitiveCharacterRangeForGlyphRange:", a3.location, a3.length);
  uint64_t v7 = -[NSLayoutManager _blockRangeForCharRange:](self, "_blockRangeForCharRange:", v4, v5);

  NSUInteger v8 = -[NSLayoutManager _primitiveGlyphRangeForCharacterRange:](self, "_primitiveGlyphRangeForCharacterRange:", v7, v6);
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

_NSRange -[NSLayoutManager _blockRowRangeForCharRange:completeRows:](NSLayoutManager *self, SEL a2, _NSRange a3, BOOL *a4)
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v8 = [(NSTextStorage *)self->_textStorage length];
  if (location >= v8)
  {
    BOOL v17 = 1;
    if (!a4) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  unint64_t v9 = v8;
  uint64_t v10 = objc_msgSend((id)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", @"NSParagraphStyle", location, 0), "textBlocks");
  if (v10 && (uint64_t v11 = v10, [v10 count]))
  {
    NSUInteger v12 = (void *)[v11 objectAtIndex:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned __int8 v38 = 0;
      NSUInteger v13 = -[NSAttributedString _rangeOfTextTableRow:atIndex:completeRow:](self->_textStorage, "_rangeOfTextTableRow:atIndex:completeRow:", [v12 table], location, &v38);
      NSUInteger v15 = v14;
      int v16 = v38;
      if (!v14) {
        goto LABEL_10;
      }
LABEL_12:
      v39.NSUInteger location = location;
      v39.NSUInteger length = length;
      int v21 = v16;
      v42.NSUInteger location = v13;
      v42.NSUInteger length = v15;
      NSRange v22 = NSUnionRange(v39, v42);
      int v16 = v21;
      NSUInteger v19 = v22.location;
      NSUInteger v18 = v22.length;
      goto LABEL_13;
    }
    NSUInteger v13 = [(NSAttributedString *)self->_textStorage rangeOfTextBlock:v12 atIndex:location];
    NSUInteger v15 = v20;
    int v16 = 1;
    if (v20) {
      goto LABEL_12;
    }
  }
  else
  {
    NSUInteger v15 = 0;
    NSUInteger v13 = 0x7FFFFFFFFFFFFFFFLL;
    int v16 = 1;
  }
LABEL_10:
  NSUInteger v18 = length;
  NSUInteger v19 = location;
LABEL_13:
  if (length >= 2)
  {
    NSUInteger v23 = location + length;
    if (location + length < v9)
    {
      NSUInteger v24 = v23 - 1;
      BOOL v25 = v23 - 1 >= v13;
      NSUInteger v26 = v23 - 1 - v13;
      if (!v25 || v26 >= v15)
      {
        int v27 = v16;
        NSUInteger v28 = objc_msgSend((id)-[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", @"NSParagraphStyle", v24, 0, @"NSParagraphStyle"), "textBlocks");
        if (v28)
        {
          NSRange v29 = v28;
          if ([v28 count])
          {
            NSRange v30 = (void *)[v29 objectAtIndex:0];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              char v37 = 0;
              v32.NSUInteger location = -[NSAttributedString _rangeOfTextTableRow:atIndex:completeRow:](self->_textStorage, "_rangeOfTextTableRow:atIndex:completeRow:", [v30 table], v24, &v37);
              v32.NSUInteger length = v31;
              if (!v37) {
                int v27 = 0;
              }
            }
            else
            {
              v32.NSUInteger location = [(NSAttributedString *)self->_textStorage rangeOfTextBlock:v30 atIndex:v24];
              v32.NSUInteger length = v33;
            }
            if (v32.length)
            {
              v40.NSUInteger location = v19;
              v40.NSUInteger length = v18;
              NSRange v34 = NSUnionRange(v40, v32);
              NSUInteger v19 = v34.location;
              NSUInteger v18 = v34.length;
            }
          }
        }
        int v16 = v27;
      }
    }
  }
  BOOL v17 = v16 != 0;
  NSUInteger length = v18;
  NSUInteger location = v19;
  if (a4) {
LABEL_29:
  }
    *a4 = v17;
LABEL_30:
  NSUInteger v35 = location;
  NSUInteger v36 = length;
  result.NSUInteger length = v36;
  result.NSUInteger location = v35;
  return result;
}

_NSRange -[NSLayoutManager _blockRowRangeForCharRange:](NSLayoutManager *self, SEL a2, _NSRange a3)
{
  NSUInteger v3 = -[NSLayoutManager _blockRowRangeForCharRange:completeRows:](self, "_blockRowRangeForCharRange:completeRows:", a3.location, a3.length, 0);
  result.NSUInteger length = v4;
  result.NSUInteger location = v3;
  return result;
}

_NSRange -[NSLayoutManager _blockRowRangeForGlyphRange:completeRows:](NSLayoutManager *self, SEL a2, _NSRange a3, BOOL *a4)
{
  uint64_t v6 = -[NSLayoutManager _primitiveCharacterRangeForGlyphRange:](self, "_primitiveCharacterRangeForGlyphRange:", a3.location, a3.length);
  uint64_t v9 = -[NSLayoutManager _blockRowRangeForCharRange:completeRows:](self, "_blockRowRangeForCharRange:completeRows:", v6, v7, a4);

  NSUInteger v10 = -[NSLayoutManager _primitiveGlyphRangeForCharacterRange:](self, "_primitiveGlyphRangeForCharacterRange:", v9, v8);
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

_NSRange -[NSLayoutManager _blockRowRangeForGlyphRange:](NSLayoutManager *self, SEL a2, _NSRange a3)
{
  uint64_t v4 = -[NSLayoutManager _primitiveCharacterRangeForGlyphRange:](self, "_primitiveCharacterRangeForGlyphRange:", a3.location, a3.length);
  uint64_t v7 = -[NSLayoutManager _blockRowRangeForCharRange:completeRows:](self, "_blockRowRangeForCharRange:completeRows:", v4, v5, 0);

  NSUInteger v8 = -[NSLayoutManager _primitiveGlyphRangeForCharacterRange:](self, "_primitiveGlyphRangeForCharacterRange:", v7, v6);
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

void _NSFastFillAllGlyphHolesForGlyphRange(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  unint64_t v34 = 0;
  uint64_t v6 = *(void *)(a1 + 240);
  HIDWORD(v23) = objc_msgSend((id)objc_msgSend((id)a1, "textStorage"), "_isStringDrawingTextStorage");
  if ((v23 & 0x100000000) == 0 && !*(void *)(v6 + 56))
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28FD0], "allocWithZone:", objc_msgSend((id)a1, "zone")), "init");
    uint64_t v8 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)(v6 + 56), (unint64_t *)&v8, (unint64_t)v7);
    if (v8) {
  }
    }
  [*(id *)(v6 + 56) lock];
  NSUInteger v9 = (__CFString *)[*(id *)(a1 + 8) string];
  uint64_t v33 = 0;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  memset(v29, 0, sizeof(v29));
  CFTypeRef cf = 0;
  LODWORD(v23) = [MEMORY[0x1E4F29060] isMainThread];
  if (v23) {
    CFTypeRef cf = (CFTypeRef)__NSMainThreadScratchString;
  }
  if (!v9) {
    NSUInteger v9 = &stru_1EDD49F70;
  }
  *(void *)&long long v30 = v9;
  *((void *)&v31 + 1) = 0;
  *(void *)&long long v32 = [(__CFString *)v9 length];
  CharactersPtr = CFStringGetCharactersPtr(v9);
  CStringPtr = 0;
  *((void *)&v30 + 1) = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v9, 0x600u);
  }
  *((void *)&v32 + 1) = 0;
  uint64_t v33 = 0;
  *(void *)&long long v31 = CStringPtr;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 240) + 208) + 56))
  {
    char v12 = 0;
    do
    {
      unint64_t v26 = 0;
      unint64_t v27 = 0;
      unint64_t v13 = [(__CFString *)v9 length];
      int v14 = *(_DWORD *)(a1 + 64);
      unint64_t v15 = 2048;
      if ((v14 & 0x8000000) != 0)
      {
        uint64_t v16 = 1024;
      }
      else
      {
        unint64_t v15 = 0x2000;
        uint64_t v16 = 4096;
      }
      if ((v14 & 0x40000000) != 0) {
        unint64_t v17 = a2;
      }
      else {
        unint64_t v17 = 0;
      }
      if (a3 <= v15) {
        unint64_t v18 = v15;
      }
      else {
        unint64_t v18 = a3;
      }
      _NSGlyphTreeGetFirstHoleAfterGlyphIndex(a1, v17, v18, (uint64_t *)&v27, &v26, &v34);
      unint64_t v19 = v34;
      if (v16 + v34 < v17)
      {
        unint64_t v34 = v17 - v16;
        unint64_t v20 = _NSGlyphTreeCharacterIndexForGlyphAtIndex(a1, v17 - v16);
        unint64_t v21 = __NSGetClusterHeadWithLimit(v9, v20, (uint64_t)v29, (CFMutableStringRef *)&cf, v35);
        if (v21 == v20)
        {
          unint64_t v19 = v34;
        }
        else
        {
          unint64_t v22 = v21;
          unint64_t v19 = _NSGlyphTreeGlyphIndexForCharacterAtIndex(a1, v21);
          unint64_t v34 = v19;
          unint64_t v20 = v22;
        }
        v26 += v27 - v20;
        unint64_t v27 = v20;
      }
      if (a2 + a3 <= v19 || v27 >= v13 || !v26) {
        break;
      }
      char v12 = (v12 & 1) != 0 ? 1 : [*(id *)(a1 + 8) _lockForReading];
      objc_msgSend((id)a1, "_fillGlyphHoleForCharacterRange:startGlyphIndex:desiredNumberOfCharacters:");
    }
    while ((*(unsigned char *)(*(void *)(*(void *)(a1 + 240) + 208) + 56) & 1) != 0);
  }
  else
  {
    char v12 = 0;
  }
  if (!cf)
  {
LABEL_38:
    if ((v12 & 1) == 0) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  if (v24)
  {
    __NSMainThreadScratchString = (uint64_t)cf;
    goto LABEL_38;
  }
  CFRelease(cf);
  if (v12) {
LABEL_39:
  }
    [*(id *)(a1 + 8) _unlock];
LABEL_40:
  if ((v25 & 1) == 0) {
    [*(id *)(*(void *)(a1 + 240) + 56) unlock];
  }
}

uint64_t _enableTextViewResizing(uint64_t result)
{
  if ((*(unsigned char *)(result + 64) & 8) == 0)
  {
    uint64_t v1 = result;
    if (!*(_WORD *)(result + 80) || (--*(_WORD *)(result + 80), !*(_WORD *)(result + 80)))
    {
      *(_DWORD *)(result + 64) |= 8u;
      uint64_t v2 = [*(id *)(result + 32) count];
      _NSRange result = [*(id *)(v1 + 32) count];
      if (result)
      {
        uint64_t v3 = result;
        for (uint64_t i = 0; i != v3; ++i)
        {
          _NSRange result = CFStorageGetValueAtIndex();
          if (*(unsigned char *)(result + 64)) {
            _NSRange result = [(id)v1 _recalculateUsageForTextContainerAtIndex:i];
          }
        }
      }
      if (v2)
      {
        for (uint64_t j = 0; j != v2; ++j)
        {
          _NSRange result = CFStorageGetValueAtIndex();
          if ((*(unsigned char *)(result + 64) & 2) != 0) {
            _NSRange result = objc_msgSend((id)v1, "_resizeTextViewForTextContainer:", objc_msgSend(*(id *)(v1 + 32), "objectAtIndex:", j));
          }
        }
      }
      *(_DWORD *)(v1 + 64) &= ~8u;
    }
  }
  return result;
}

uint64_t _NSRemoveDirtyLayoutManager(uint64_t a1)
{
  uint64_t result = _dirtyLMs;
  if (_dirtyLMs)
  {
    uint64_t result = [(id)_dirtyLMs count];
    if (result)
    {
      uint64_t v3 = result;
      uint64_t v4 = 0;
      for (uint64_t i = 0; i != v3; ++i)
      {
        uint64_t result = [(id)_dirtyLMs pointerAtIndex:v4 + i];
        if (result == a1 || result == 0)
        {
          uint64_t v7 = result;
          uint64_t result = [(id)_dirtyLMs removePointerAtIndex:v4 + i];
          if (v7) {
            break;
          }
          --v4;
        }
      }
    }
  }
  *(_DWORD *)(a1 + 64) &= ~0x100u;
  return result;
}

void _NSFastFillAllGlyphHolesForCharacterRange(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v33 = 0;
  unint64_t v34 = 0;
  uint64_t v6 = *(void *)(a1 + 240);
  char v25 = objc_msgSend((id)objc_msgSend((id)a1, "textStorage"), "_isStringDrawingTextStorage");
  if ((v25 & 1) == 0 && !*(void *)(v6 + 56))
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28FD0], "allocWithZone:", objc_msgSend((id)a1, "zone")), "init");
    uint64_t v8 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)(v6 + 56), (unint64_t *)&v8, (unint64_t)v7);
    if (v8) {
  }
    }
  [*(id *)(v6 + 56) lock];
  NSUInteger v9 = (__CFString *)[*(id *)(a1 + 8) string];
  uint64_t v32 = 0;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  memset(v28, 0, sizeof(v28));
  CFTypeRef cf = 0;
  int v24 = [MEMORY[0x1E4F29060] isMainThread];
  if (v24) {
    CFTypeRef cf = (CFTypeRef)__NSMainThreadScratchString;
  }
  if (!v9) {
    NSUInteger v9 = &stru_1EDD49F70;
  }
  *(void *)&long long v29 = v9;
  *((void *)&v30 + 1) = 0;
  *(void *)&long long v31 = [(__CFString *)v9 length];
  CharactersPtr = CFStringGetCharactersPtr(v9);
  CStringPtr = 0;
  *((void *)&v29 + 1) = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v9, 0x600u);
  }
  *((void *)&v31 + 1) = 0;
  uint64_t v32 = 0;
  *(void *)&long long v30 = CStringPtr;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 240) + 208) + 56))
  {
    char v12 = 0;
    unint64_t v13 = a3 + a2;
    do
    {
      unint64_t v26 = 0;
      unint64_t v14 = [(__CFString *)v9 length];
      unint64_t v15 = v14;
      unint64_t v16 = 0;
      int v17 = *(_DWORD *)(a1 + 64);
      if ((v17 & 0x8000000) != 0) {
        unint64_t v18 = 2048;
      }
      else {
        unint64_t v18 = 0x2000;
      }
      if ((v17 & 0x8000000) != 0) {
        uint64_t v19 = 1024;
      }
      else {
        uint64_t v19 = 4096;
      }
      unint64_t v20 = a3;
      if ((v17 & 0x40000000) != 0)
      {
        unint64_t v16 = a2;
        unint64_t v20 = a3;
        if (a2 < v14)
        {
          unint64_t v16 = __NSGetClusterHeadWithLimit(v9, a2, (uint64_t)v28, (CFMutableStringRef *)&cf, v35);
          unint64_t v20 = v13 - v16;
          if (v16 >= a2) {
            unint64_t v20 = a3;
          }
        }
      }
      if (v20 <= v18) {
        unint64_t v21 = v18;
      }
      else {
        unint64_t v21 = v20;
      }
      _NSGlyphTreeGetFirstHoleAfterCharacterIndex(a1, v16, v21, &v34, &v26, &v33);
      unint64_t v22 = v34;
      if (v34 + v19 < v16)
      {
        unint64_t v23 = __NSGetClusterHeadWithLimit(v9, v16 - v19, (uint64_t)v28, (CFMutableStringRef *)&cf, v35);
        v26 += v34 - v23;
        unint64_t v34 = v23;
        uint64_t v33 = _NSGlyphTreeGlyphIndexForCharacterAtIndex(a1, v23);
        unint64_t v22 = v34;
      }
      if (v13 <= v22 || v22 >= v15 || !v26) {
        break;
      }
      if (v12)
      {
        char v12 = 1;
      }
      else
      {
        char v12 = [*(id *)(a1 + 8) _lockForReading];
        unint64_t v22 = v34;
      }
      objc_msgSend((id)a1, "_fillGlyphHoleForCharacterRange:startGlyphIndex:desiredNumberOfCharacters:", v22);
    }
    while ((*(unsigned char *)(*(void *)(*(void *)(a1 + 240) + 208) + 56) & 1) != 0);
  }
  else
  {
    char v12 = 0;
  }
  if (!cf)
  {
LABEL_39:
    if ((v12 & 1) == 0) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
  if (v24)
  {
    __NSMainThreadScratchString = (uint64_t)cf;
    goto LABEL_39;
  }
  CFRelease(cf);
  if (v12) {
LABEL_40:
  }
    [*(id *)(a1 + 8) _unlock];
LABEL_41:
  if ((v25 & 1) == 0) {
    [*(id *)(*(void *)(a1 + 240) + 56) unlock];
  }
}

void _NSAddDirtyLayoutManager(uint64_t a1)
{
  id v2 = (id)_dirtyLMs;
  if (!_dirtyLMs)
  {
    id v2 = (id)[MEMORY[0x1E4F28F50] pointerArrayWithOptions:517];
    _dirtyLMs = (uint64_t)v2;
  }
  if ((*(unsigned char *)(a1 + 65) & 1) == 0)
  {
    [v2 addPointer:a1];
    *(_DWORD *)(a1 + 64) |= 0x100u;
  }
  if (!_immediateBackgroundLayoutObserver)
  {
    _immediateBackgroundLayoutObserver = (uint64_t)CFRunLoopObserverCreate(0, 2uLL, 0, 400000, (CFRunLoopObserverCallBack)_NSPostBackgroundLayout, 0);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddObserver(Current, (CFRunLoopObserverRef)_immediateBackgroundLayoutObserver, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
  }
  if (!_backgroundLayoutObserver)
  {
    _backgroundLayoutObserver = (uint64_t)CFRunLoopObserverCreate(0, 0x20uLL, 1u, 400000, (CFRunLoopObserverCallBack)_NSPostBackgroundLayout, 0);
    uint64_t v4 = CFRunLoopGetCurrent();
    uint64_t v5 = (__CFRunLoopObserver *)_backgroundLayoutObserver;
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D410];
    CFRunLoopAddObserver(v4, v5, v6);
  }
}

void _NSPostBackgroundLayout()
{
  MEMORY[0x192FADEA0](0);
  if (_immediateBackgroundLayoutObserver)
  {
    CFRunLoopObserverInvalidate((CFRunLoopObserverRef)_immediateBackgroundLayoutObserver);
    CFRelease((CFTypeRef)_immediateBackgroundLayoutObserver);
    _immediateBackgroundLayoutObserver = 0;
  }
  if ([(id)_dirtyLMs count])
  {
    if (!_backgroundLayoutTimer)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      _backgroundLayoutTimer = (uint64_t)CFRunLoopTimerCreate(0, v0 + 0.001, 0.0, 0, 400000, (CFRunLoopTimerCallBack)_NSTimeBackgroundLayout, 0);
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddTimer(Current, (CFRunLoopTimerRef)_backgroundLayoutTimer, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    }
    if (!_backgroundLayoutObserver)
    {
      _backgroundLayoutObserver = (uint64_t)CFRunLoopObserverCreate(0, 0x20uLL, 1u, 400000, (CFRunLoopObserverCallBack)_NSPostBackgroundLayout, 0);
      id v2 = CFRunLoopGetCurrent();
      CFRunLoopAddObserver(v2, (CFRunLoopObserverRef)_backgroundLayoutObserver, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    }
  }
  else if (_backgroundLayoutObserver)
  {
    CFRunLoopObserverInvalidate((CFRunLoopObserverRef)_backgroundLayoutObserver);
    CFRelease((CFTypeRef)_backgroundLayoutObserver);
    _backgroundLayoutObserver = 0;
  }

  JUMPOUT(0x192FADE90);
}

id -[NSLayoutManager _blockDescription](NSLayoutManager *self, SEL a2)
{
  v26.receiver = self;
  v26.super_class = (Class)NSLayoutManager;
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", -[NSLayoutManager description](&v26, sel_description));
  unint64_t v23 = self;
  uint64_t v4 = (void *)*((void *)self->_extraData + 23);
  if (v4)
  {
    uint64_t v5 = [v4 count];
    objc_msgSend(v3, "appendFormat:", @" has %lu runs\n", v5);
    if (v5)
    {
      uint64_t v6 = 0;
      unint64_t v22 = v5;
      do
      {
        uint64_t v7 = (void *)[*((id *)v23->_extraData + 23) objectAtIndex:v6];
        unint64_t v8 = [v7 count];
        NSRange v25 = (NSRange)0;
        uint64_t v24 = v6;
        [v3 appendFormat:@"run %lu, %lu elements: ", v6, v8];
        if (v8)
        {
          unint64_t v9 = 0;
          while (1)
          {
            _NSBlockNumberForIndex(v7, v9, (__n128 *)&v25);
            uint64_t v11 = v7[11] <= v10 ? v7[4] - v7[3] : 0;
            uint64_t v12 = *(void *)(v7[7] + (v7[2] + 8) * (v11 + v10) + 8);
            unint64_t v13 = NSStringFromRange(v25);
            unint64_t v14 = v13;
            if (v12)
            {
              uint64_t v15 = *(void *)(v12 + 8);
              unint64_t v16 = NSStringFromRect(*(NSRect *)(v12 + 16));
              [v3 appendFormat:@"%@ block %p helper %p lr %@ br %@", v14, v15, v12, v16, NSStringFromRect(*(NSRect *)(v12 + 48))];
            }
            else
            {
              [v3 appendFormat:@"%@ empty", v13, v18, v19, v20, v21];
            }
            unint64_t v9 = v25.length + v25.location;
            if (v25.length + v25.location >= v8) {
              break;
            }
            [v3 appendString:@"; "];
          }
        }
        uint64_t v6 = v24 + 1;
        if (v24 + 1 < v22) {
          [v3 appendString:@"\n"];
        }
      }
      while (v6 != v22);
    }
  }
  return v3;
}

double NSLMUnionRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  BOOL v8 = a7 <= 0.0;
  if (a8 > 0.0) {
    BOOL v8 = 0;
  }
  if (a3 > 0.0 || a4 > 0.0)
  {
    if (v8)
    {
      return a1;
    }
    else if (a1 < a5)
    {
      return a1;
    }
  }
  else if (v8)
  {
    return *MEMORY[0x1E4F28AD8];
  }
  return a5;
}

unint64_t _NSFastFillAllLayoutHolesForGlyphRange(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v55 = -1;
  unint64_t v6 = [*(id *)(a1 + 8) length];
  unint64_t v50 = a3;
  unint64_t v7 = a2 + a3;
  uint64_t v8 = *(void *)(a1 + 240);
  char v9 = 1;
  unint64_t v51 = a2;
  do
  {
    char v10 = objc_msgSend((id)objc_msgSend((id)a1, "textStorage"), "_isStringDrawingTextStorage");
    char v11 = v10;
    if ((v10 & 1) == 0 && !*(void *)(v8 + 56))
    {
      char v48 = v10;
      uint64_t v12 = (void *)MEMORY[0x1E4F28FD0];
      uint64_t v13 = [(id)a1 zone];
      unint64_t v14 = v12;
      char v11 = v48;
      uint64_t v15 = objc_msgSend((id)objc_msgSend(v14, "allocWithZone:", v13), "init");
      uint64_t v16 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(v8 + 56), (unint64_t *)&v16, (unint64_t)v15);
      if (v16) {
    }
      }
    unint64_t result = [*(id *)(v8 + 56) lock];
    if ((*(unsigned char *)(*(void *)(*(void *)(a1 + 240) + 240) + 56) & 1) == 0)
    {
      char v18 = 0;
      if (v11) {
        goto LABEL_91;
      }
LABEL_90:
      unint64_t result = [*(id *)(*(void *)(a1 + 240) + 56) unlock];
      goto LABEL_91;
    }
    char v49 = v11;
    char v47 = v9;
    char v52 = 0;
    char v18 = 0;
    while (1)
    {
      if ((*(_DWORD *)(a1 + 64) & 0x40000000) != 0) {
        unint64_t v19 = a2;
      }
      else {
        unint64_t v19 = 0;
      }
      unint64_t v54 = 0;
      unint64_t v20 = v7 - v19;
      if (v7 - v19 <= 0x400) {
        unint64_t v20 = 1024;
      }
      unint64_t v21 = v20 >= 0x4000 ? 0x4000 : v20;
      unint64_t result = _NSLayoutTreeGetFirstHoleAfterGlyphIndexWithLength(a1, v19, v21, &v55, &v54);
      unint64_t v22 = v55;
      if (v55 >= v7 || v55 >= *(void *)(*(void *)(*(void *)(a1 + 240) + 208) + 8)) {
        break;
      }
      if (v19) {
        BOOL v23 = v55 > v19;
      }
      else {
        BOOL v23 = 1;
      }
      if (!v23)
      {
        unint64_t v24 = _NSGlyphTreeCharacterIndexForGlyphAtIndex(a1, v19);
        uint64_t v25 = [*(id *)(a1 + 8) string];
        if (v24)
        {
          objc_super v26 = (void *)v25;
          long long v59 = 0u;
          long long v57 = 0u;
          memset(v58, 0, sizeof(v58));
          unint64_t v27 = v24 - 1;
          long long v56 = 0u;
          unint64_t v28 = objc_msgSend((id)a1, "_blockRangeForCharRange:", v24 - 1, 1);
          unint64_t v29 = v28 - 2;
          if (v28 < 2) {
            unint64_t v29 = 0;
          }
          if (v28 < v27) {
            unint64_t v27 = v29;
          }
          *((void *)&v57 + 1) = v24;
          *(void *)&v58[0] = v27;
          *(void *)&long long v57 = v26;
          if (v24 <= v27)
          {
            *(void *)&long long v56 = 0;
            __int16 v31 = -1;
          }
          else
          {
            if (v24 - v27 >= 0x20) {
              uint64_t v30 = 32;
            }
            else {
              uint64_t v30 = v24 - v27;
            }
            *(void *)&long long v56 = v30;
            objc_msgSend(v26, sel_getUid("getCharacters:range:"), (char *)v58 + 8, v27, v30);
            __int16 v31 = WORD4(v58[0]);
          }
          WORD4(v59) = v31;
          if (v27)
          {
            for (unint64_t i = 1; ; unint64_t i = *((void *)&v56 + 1))
            {
              uint64_t v33 = i - 2;
              if (i < 2)
              {
                if (!*(void *)&v58[0])
                {
                  *((void *)&v56 + 1) = 0;
                  WORD4(v59) = -1;
                  goto LABEL_60;
                }
                if (*(void *)&v58[0] >= 0x20uLL) {
                  uint64_t v34 = 32;
                }
                else {
                  uint64_t v34 = *(void *)&v58[0];
                }
                *(void *)&long long v56 = v34;
                *((void *)&v56 + 1) = v34;
                *(void *)&v58[0] -= v34;
                objc_msgSend((id)v57, sel_getUid("getCharacters:range:"), (char *)v58 + 8, *(void *)&v58[0], v34);
                uint64_t v33 = *((void *)&v56 + 1) - 1;
              }
              else
              {
                *((void *)&v56 + 1) = i - 1;
              }
              WORD4(v59) = *((_WORD *)v58 + v33 + 4);
              if (WORD4(v59) > 0x84u)
              {
                if (WORD4(v59) - 8232 < 2 || WORD4(v59) == 133) {
                  break;
                }
              }
              else if (WORD4(v59) == 13)
              {
                if (v27 >= [v26 length]
                  || [v26 characterAtIndex:v27] != 10)
                {
                  break;
                }
              }
              else if (WORD4(v59) == 10 || WORD4(v59) == 12)
              {
                break;
              }
LABEL_60:
              if (!--v27) {
                break;
              }
            }
          }
        }
        else
        {
          unint64_t v27 = 0;
        }
        a2 = v51;
        unint64_t v36 = _NSGlyphTreeGlyphIndexForCharacterAtIndex(a1, v27);
        _NSLayoutTreeGetFirstHoleAfterGlyphIndexWithLength(a1, v36, v21, &v55, &v54);
        unint64_t v22 = v55;
        if (v55 < v36)
        {
          v54 += v55 - v36;
          unint64_t v55 = v36;
          unint64_t v22 = v36;
        }
      }
      unint64_t result = _NSGlyphTreeCharacterIndexForGlyphAtIndex(a1, v22);
      if (result < v6)
      {
        unint64_t v37 = result;
        unint64_t v38 = _NSGlyphTreeCharacterIndexForGlyphAtIndex(a1, v54 + v55);
        if (v38 >= v6) {
          unint64_t v39 = v6;
        }
        else {
          unint64_t v39 = v38;
        }
        *(void *)&long long v56 = 0;
        uint64_t v53 = 0;
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "string"), "getLineStart:end:contentsEnd:forRange:", &v56, &v53, 0, v37, v39 - v37);
        if ((unint64_t)v56 < v37)
        {
          unint64_t v40 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "string"), "rangeOfComposedCharacterSequenceAtIndex:", v37);
          if (v37 > v40 && v40 >= (unint64_t)v56 && v37 - v40 < v41) {
            unint64_t v37 = v40;
          }
        }
        uint64_t v43 = v53;
        if (v7 - v55 < 0x64) {
          unint64_t v44 = 1;
        }
        else {
          unint64_t v44 = (v7 - v55) / 0x64;
        }
        if ((v18 & 1) == 0)
        {
          if (v52) {
            char v52 = 1;
          }
          else {
            char v52 = [*(id *)(a1 + 8) _lockForReading];
          }
          if ((*(unsigned char *)(a1 + 64) & 8) == 0) {
            ++*(_WORD *)(a1 + 80);
          }
          _NSFastFillAllGlyphHolesForGlyphRange(a1, a2, v50);
        }
        unint64_t result = objc_msgSend((id)a1, "_fillLayoutHoleForCharacterRange:desiredNumberOfLines:isSoft:", v37, v43 - v37, v44, 0);
        char v18 = 1;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 240) + 240) + 56)) {
          continue;
        }
      }
      break;
    }
    if (v18 & 1) != 0 && (v52) {
      unint64_t result = [*(id *)(a1 + 8) _unlock];
    }
    char v9 = v47;
    if ((v49 & 1) == 0) {
      goto LABEL_90;
    }
LABEL_91:
    if ((v18 & 1) == 0) {
      break;
    }
    _enableTextViewResizing(a1);
    unint64_t v45 = (*(_DWORD *)(a1 + 64) & 0x40000000) != 0 ? a2 : 0;
    unint64_t result = _NSLayoutTreeGetFirstHoleAfterGlyphIndex(a1, v45, &v55);
    if (v55 >= v7) {
      break;
    }
    uint64_t v8 = *(void *)(a1 + 240);
    char v46 = *(unsigned char *)(*(void *)(v8 + 240) + 56) & v9;
    char v9 = 0;
  }
  while ((v46 & 1) != 0);
  return result;
}

NSInsertionPointHelper *_insertionPointHelperForCharacterAtIndex(uint64_t a1, unint64_t a2)
{
  unint64_t v4 = [*(id *)(a1 + 8) length];
  uint64_t v5 = (__CFString *)[*(id *)(a1 + 8) string];
  unint64_t v6 = v5;
  if (v4 != a2 || v4 == 0) {
    goto LABEL_17;
  }
  int v8 = [(__CFString *)v5 characterAtIndex:a2 - 1];
  if (v8 > 132)
  {
    if ((v8 - 8232) < 2 || v8 == 133) {
      goto LABEL_17;
    }
LABEL_16:
    --a2;
    goto LABEL_17;
  }
  BOOL v9 = v8 == 10 || v8 == 12;
  if (!v9
    && (v8 != 13
     || [(__CFString *)v6 length] > a2
     && [(__CFString *)v6 characterAtIndex:a2] == 10))
  {
    goto LABEL_16;
  }
LABEL_17:
  char v10 = *(void **)(*(void *)(a1 + 240) + 200);
  if (!v10)
  {
    unint64_t v11 = 0;
    *(void *)(*(void *)(a1 + 240) + 200) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "allocWithZone:", objc_msgSend((id)a1, "zone")), "init");
LABEL_31:
    objc_msgSend((id)a1, "ensureLayoutForCharacterRange:", a2, 1);
    if (a2 == v4)
    {
      if (*(void *)(a1 + 56))
      {
        if (!v4)
        {
LABEL_53:
          [*(id *)(a1 + 56) lineFragmentPadding];
          double v20 = v19;
          long long v31 = 0u;
          long long v32 = 0u;
          _NSLayoutTreeGetExtraLineFragmentRect(a1, (uint64_t)&v31, 0);
          double v21 = *(double *)&v31;
          double v22 = *(double *)&v32;
          long long v31 = 0u;
          long long v32 = 0u;
          _NSLayoutTreeGetExtraLineFragmentRect(a1, 0, (uint64_t)&v31);
          double v23 = v20 + *(double *)&v31;
          if (*(double *)&v31 + *(double *)&v32 != v21 + v22) {
            double v23 = *(double *)&v31 + *(double *)&v32 - v20;
          }
          double v24 = v23 - v21;
          if (v4 && (*(unsigned char *)(a1 + 67) & 2) != 0)
          {
            unint64_t v28 = (void *)[*(id *)(a1 + 8) attribute:@"NSParagraphStyle" atIndex:v4 - 1 effectiveRange:0];
            unint64_t v29 = v28;
            if (!v28
              || (HasRightToLeftBaseWritingDirectionAtIndedouble x = [v28 baseWritingDirection],
                  HasRightToLeftBaseWritingDirectionAtIndex == -1))
            {
              uint64_t v30 = (void *)[*(id *)(a1 + 56) textView];
              if (objc_opt_respondsToSelector()) {
                unint64_t v29 = (void *)[v30 defaultParagraphStyle];
              }
              if (!v29
                || (HasRightToLeftBaseWritingDirectionAtIndedouble x = [v29 baseWritingDirection],
                    HasRightToLeftBaseWritingDirectionAtIndex == -1))
              {
                HasRightToLeftBaseWritingDirectionAtIndedouble x = _NSStringHasRightToLeftBaseWritingDirectionAtIndex(v6, v4 - 1, 0, v4);
              }
            }
          }
          else
          {
            HasRightToLeftBaseWritingDirectionAtIndedouble x = 0;
          }
          char v18 = -[NSInsertionPointHelper init](+[NSInsertionPointHelper allocWithZone:](NSInsertionPointHelper, "allocWithZone:", [(id)a1 zone]), "init");
          v18->_charRange.NSUInteger location = v4;
          v18->_charRange.NSUInteger length = 0;
          v18->_writingDirection = HasRightToLeftBaseWritingDirectionAtIndex;
          v18->_count = 1;
          v18->_logicalPositions = (double *)NSAllocateCollectable(8uLL, 0);
          v18->_logicalLeftBoundaries = (double *)NSAllocateCollectable(8uLL, 0);
          v18->_logicalRightBoundaries = (double *)NSAllocateCollectable(8uLL, 0);
          v18->_logicalCharIndexes = (unint64_t *)NSAllocateCollectable(8uLL, 0);
          v18->_displayPositions = (double *)NSAllocateCollectable(8uLL, 0);
          objc_super v26 = (unint64_t *)NSAllocateCollectable(8uLL, 0);
          v18->_displayCharIndexes = v26;
          *v18->_displayPositions = v24;
          *v18->_logicalRightBoundaries = v24;
          *v18->_logicalLeftBoundaries = v24;
          *v18->_logicalPositions = v24;
          *objc_super v26 = v4;
          *v18->_logicalCharIndexes = v4;
LABEL_59:
          if (v11 >= 0x10) {
            [*(id *)(*(void *)(a1 + 240) + 200) removeLastObject];
          }
          [*(id *)(*(void *)(a1 + 240) + 200) insertObject:v18 atIndex:0];
          return v18;
        }
        a2 = v4 - 1;
        int v17 = [(__CFString *)v6 characterAtIndex:v4 - 1];
        if (v17 > 132)
        {
          if ((v17 - 8232) < 2 || v17 == 133) {
            goto LABEL_53;
          }
        }
        else if (v17 == 10 {
               || v17 == 12
        }
               || v17 == 13
               && (v4 >= [(__CFString *)v6 length]
                || [(__CFString *)v6 characterAtIndex:v4] != 10))
        {
          goto LABEL_53;
        }
        goto LABEL_47;
      }
      if (v4)
      {
        a2 = v4 - 1;
LABEL_47:
        objc_msgSend((id)a1, "ensureLayoutForCharacterRange:", a2, 1);
LABEL_48:
        char v18 = (NSInsertionPointHelper *)objc_msgSend((id)a1, "_insertionPointHelperForGlyphAtIndex:", objc_msgSend((id)a1, "glyphIndexForCharacterAtIndex:", a2));
        if (!v18) {
          return v18;
        }
        goto LABEL_59;
      }
    }
    else if (v4)
    {
      goto LABEL_48;
    }
    return 0;
  }
  unint64_t v11 = [v10 count];
  if (!v11) {
    goto LABEL_31;
  }
  uint64_t v12 = 0;
  while (1)
  {
    uint64_t v13 = [*(id *)(*(void *)(a1 + 240) + 200) objectAtIndex:v12];
    unint64_t v14 = *(void *)(v13 + 8);
    BOOL v15 = a2 - v14 < *(void *)(v13 + 16) && a2 >= v14;
    if (a2 == v14 || v15) {
      break;
    }
    if (v11 == ++v12) {
      goto LABEL_31;
    }
  }
  char v18 = (NSInsertionPointHelper *)v13;
  if (v12)
  {
    [*(id *)(*(void *)(a1 + 240) + 200) insertObject:v13 atIndex:0];
    [*(id *)(*(void *)(a1 + 240) + 200) removeObjectAtIndex:v12 + 1];
  }
  return v18;
}

void sub_18E564AB8()
{
}

void sub_18E564C7C(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x18E564C8CLL);
  }
  JUMPOUT(0x18E564B90);
}

uint64_t __NSGetClusterHeadWithLimit(__CFString *a1, unint64_t a2, uint64_t a3, CFMutableStringRef *a4, UniChar *a5)
{
  CFMutableStringRef v9 = a1;
  if ((unint64_t)[(__CFString *)a1 length] < 0x101)
  {
    int64_t v10 = 0;
  }
  else
  {
    int64_t v10 = 0;
    if (a2 >= 0x10) {
      int64_t v11 = a2 - 16;
    }
    else {
      int64_t v11 = 0;
    }
    if (a2 >= 0x11)
    {
      int64_t v10 = v11;
      if ((v11 & 0x8000000000000000) == 0)
      {
        int64_t v12 = *(void *)(a3 + 160);
        if (v12 > v11)
        {
          uint64_t v13 = *(void *)(a3 + 136);
          if (v13)
          {
            unsigned __int16 v14 = *(_WORD *)(v13 + 2 * (*(void *)(a3 + 152) + v11));
          }
          else
          {
            uint64_t v15 = *(void *)(a3 + 144);
            if (v15)
            {
              unsigned __int16 v14 = *(char *)(v15 + *(void *)(a3 + 152) + v11);
            }
            else
            {
              if (*(void *)(a3 + 176) <= v11 || (int64_t v16 = *(void *)(a3 + 168), v16 > v11))
              {
                unint64_t v17 = a2 - 20;
                if (a2 < 0x14) {
                  unint64_t v17 = 0;
                }
                if ((uint64_t)(v17 + 64) < v12) {
                  int64_t v12 = v17 + 64;
                }
                *(void *)(a3 + 16_Block_object_dispose(&STACK[0x2B0], 8) = v17;
                *(void *)(a3 + 176) = v12;
                v53.NSUInteger location = *(void *)(a3 + 152) + v17;
                v53.NSUInteger length = v12 - v17;
                CFStringGetCharacters(*(CFStringRef *)(a3 + 128), v53, (UniChar *)a3);
                int64_t v16 = *(void *)(a3 + 168);
              }
              unsigned __int16 v14 = *(_WORD *)(a3 + 2 * (v11 - v16));
            }
          }
          if (v14 >> 10 == 55)
          {
            int64_t v10 = v11 - 1;
            int64_t v18 = *(void *)(a3 + 160);
            if (v18 >= v11)
            {
              uint64_t v20 = *(void *)(a3 + 136);
              if (v20)
              {
                unsigned __int16 v19 = *(_WORD *)(v20 + 2 * (*(void *)(a3 + 152) + v10));
              }
              else
              {
                uint64_t v21 = *(void *)(a3 + 144);
                if (v21)
                {
                  unsigned __int16 v19 = *(char *)(v21 + *(void *)(a3 + 152) + v10);
                }
                else
                {
                  if (*(void *)(a3 + 176) < v11 || (int64_t v22 = *(void *)(a3 + 168), v22 >= v11))
                  {
                    unint64_t v23 = a2 - 21;
                    if (a2 < 0x15) {
                      unint64_t v23 = 0;
                    }
                    if ((uint64_t)(v23 + 64) < v18) {
                      int64_t v18 = v23 + 64;
                    }
                    *(void *)(a3 + 16_Block_object_dispose(&STACK[0x2B0], 8) = v23;
                    *(void *)(a3 + 176) = v18;
                    v54.NSUInteger location = *(void *)(a3 + 152) + v23;
                    v54.NSUInteger length = v18 - v23;
                    CFStringGetCharacters(*(CFStringRef *)(a3 + 128), v54, (UniChar *)a3);
                    int64_t v22 = *(void *)(a3 + 168);
                  }
                  unsigned __int16 v19 = *(_WORD *)(a3 + 2 * (v10 - v22));
                }
              }
            }
            else
            {
              unsigned __int16 v19 = 0;
            }
            if (v19 >> 10 != 54) {
              int64_t v10 = v11;
            }
          }
        }
      }
    }
    unint64_t v24 = [(__CFString *)v9 length];
    if (v24 >= a2 + 16) {
      int64_t v25 = a2 + 16;
    }
    else {
      int64_t v25 = v24;
    }
    CFIndex v26 = v25 - v10;
    if (v25 < (unint64_t)[(__CFString *)v9 length])
    {
      int64_t v27 = v25 - 1;
      if (v25 - 1 >= 0)
      {
        int64_t v28 = *(void *)(a3 + 160);
        if (v28 > v27)
        {
          uint64_t v29 = *(void *)(a3 + 136);
          if (v29)
          {
            unsigned __int16 v30 = *(_WORD *)(v29 + 2 * (*(void *)(a3 + 152) + v27));
          }
          else
          {
            uint64_t v31 = *(void *)(a3 + 144);
            if (v31)
            {
              unsigned __int16 v30 = *(char *)(v31 + *(void *)(a3 + 152) + v27);
            }
            else
            {
              if (*(void *)(a3 + 176) <= v27 || (int64_t v32 = *(void *)(a3 + 168), v32 > v27))
              {
                int64_t v33 = v25 - 5;
                if ((unint64_t)v27 < 4) {
                  int64_t v33 = 0;
                }
                if (v33 + 64 < v28) {
                  int64_t v28 = v33 + 64;
                }
                *(void *)(a3 + 16_Block_object_dispose(&STACK[0x2B0], 8) = v33;
                *(void *)(a3 + 176) = v28;
                v55.NSUInteger location = *(void *)(a3 + 152) + v33;
                v55.NSUInteger length = v28 - v33;
                CFStringGetCharacters(*(CFStringRef *)(a3 + 128), v55, (UniChar *)a3);
                int64_t v32 = *(void *)(a3 + 168);
              }
              unsigned __int16 v30 = *(_WORD *)(a3 + 2 * (v27 - v32));
            }
          }
          if (v30 >> 10 == 54)
          {
            int64_t v34 = *(void *)(a3 + 160);
            if (v34 <= v25)
            {
              unsigned __int16 v36 = 0;
            }
            else
            {
              uint64_t v35 = *(void *)(a3 + 136);
              if (v35)
              {
                unsigned __int16 v36 = *(_WORD *)(v35 + 2 * (*(void *)(a3 + 152) + v25));
              }
              else
              {
                uint64_t v50 = *(void *)(a3 + 144);
                if (v50)
                {
                  unsigned __int16 v36 = *(char *)(v50 + *(void *)(a3 + 152) + v25);
                }
                else
                {
                  if (*(void *)(a3 + 176) <= v25 || (int64_t v51 = *(void *)(a3 + 168), v51 > v25))
                  {
                    int64_t v52 = v25 - 4;
                    if ((unint64_t)v25 < 4) {
                      int64_t v52 = 0;
                    }
                    if (v52 + 64 < v34) {
                      int64_t v34 = v52 + 64;
                    }
                    *(void *)(a3 + 16_Block_object_dispose(&STACK[0x2B0], 8) = v52;
                    *(void *)(a3 + 176) = v34;
                    v56.NSUInteger location = *(void *)(a3 + 152) + v52;
                    v56.NSUInteger length = v34 - v52;
                    CFStringGetCharacters(*(CFStringRef *)(a3 + 128), v56, (UniChar *)a3);
                    int64_t v51 = *(void *)(a3 + 168);
                  }
                  unsigned __int16 v36 = *(_WORD *)(a3 + 2 * (v25 - v51));
                }
              }
            }
            if (v36 >> 10 == 55) {
              ++v26;
            }
          }
        }
      }
    }
    if (*a4) {
      CFStringSetExternalCharactersNoCopy(*a4, a5, v26, 64);
    }
    else {
      *a4 = CFStringCreateMutableWithExternalCharactersNoCopy(0, a5, v26, 64, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
    }
    uint64_t v37 = *(void *)(a3 + 136);
    if (v37)
    {
      memmove(a5, (const void *)(v37 + 2 * *(void *)(a3 + 152) + 2 * v10), 2 * v26);
    }
    else
    {
      uint64_t v39 = *(void *)(a3 + 168);
      if (v10 < v39 || (int64_t v40 = *(void *)(a3 + 176), v41 = v40 <= v10, v42 = v40 - v10, v41))
      {
        CFIndex v45 = v26 + v10 - v39;
        if (v26 + v10 > v39 && v26 + v10 < *(void *)(a3 + 176))
        {
          CFIndex v26 = v39 - v10;
          memmove(&a5[v39 - v10], (const void *)a3, 2 * v45);
        }
        int64_t v44 = v10;
      }
      else
      {
        if (v26 >= v42) {
          CFIndex v43 = v42;
        }
        else {
          CFIndex v43 = v26;
        }
        memmove(a5, (const void *)(a3 + 2 * (v10 - v39)), 2 * v43);
        a5 += v43;
        int64_t v44 = v43 + v10;
        v26 -= v43;
      }
      if (v26 >= 1)
      {
        uint64_t v46 = *(void *)(a3 + 144);
        v47.NSUInteger location = *(void *)(a3 + 152) + v44;
        if (v46)
        {
          char v48 = (char *)(v46 + v47.location);
          do
          {
            UniChar v49 = *v48++;
            *a5++ = v49;
            --v26;
          }
          while (v26);
        }
        else
        {
          v47.NSUInteger length = v26;
          CFStringGetCharacters(*(CFStringRef *)(a3 + 128), v47, a5);
        }
      }
    }
    CFMutableStringRef v9 = *a4;
  }
  return [(__CFString *)v9 rangeOfComposedCharacterSequenceAtIndex:a2 - v10]+ v10;
}

uint64_t _NSFastFillAllLayoutHolesUpToEndOfContainerForGlyphIndex(uint64_t a1, unint64_t a2)
{
  unint64_t v4 = &OBJC_IVAR___NSLayoutManager__extraData;
  uint64_t v34 = -1;
  uint64_t v5 = *(void *)(a1 + 240);
  unint64_t v6 = &OBJC_IVAR___NSExtraLMData__layoutTree;
  unint64_t v7 = &OBJC_IVAR___NSLayoutManager__firstUnlaidCharIndex;
  int v8 = &OBJC_IVAR___NSLayoutManager__firstUnlaidGlyphIndex;
  char v31 = 1;
  do
  {
    char v32 = objc_msgSend((id)objc_msgSend((id)a1, "textStorage"), "_isStringDrawingTextStorage");
    if ((v32 & 1) == 0 && !*(void *)(v5 + 56))
    {
      CFMutableStringRef v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28FD0], "allocWithZone:", objc_msgSend((id)a1, "zone")), "init");
      uint64_t v10 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)(v5 + 56), (unint64_t *)&v10, (unint64_t)v9);
      if (v10) {
    }
      }
    uint64_t result = [*(id *)(v5 + 56) lock];
    if ((*(unsigned char *)(*(void *)(*(void *)(a1 + *v4) + *v6) + 56) & 1) == 0)
    {
      char v12 = 0;
      goto LABEL_45;
    }
    char v12 = 0;
    char v33 = 0;
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)(a1 + *v7) == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v14 = *(void *)(a1 + *v8), v14 == 0x7FFFFFFFFFFFFFFFLL))
      {
        [(id)a1 getFirstUnlaidCharacterIndex:0 glyphIndex:&v34];
        unint64_t v14 = v34;
      }
      else
      {
        uint64_t v34 = *(void *)(a1 + *v8);
      }
      BOOL v15 = a2 >= v14;
      unint64_t v16 = a2 - v14;
      if (v15)
      {
        unint64_t v20 = v16 / 0x64 + 100;
        if ((v12 & 1) == 0) {
          goto LABEL_34;
        }
        goto LABEL_40;
      }
      if (!v13)
      {
        if ((*(unsigned char *)(a1 + 67) & 0x40) != 0)
        {
          uint64_t v13 = [*(id *)(a1 + 32) objectAtIndex:0];
        }
        else if ([*(id *)(a1 + 48) count] <= a2)
        {
          uint64_t v13 = 0;
        }
        else
        {
          unint64_t v17 = *(void **)(a1 + 48);
          _NSBlockNumberForIndex(v17, a2, 0);
          uint64_t v19 = 0;
          if (v17[11] <= v18) {
            uint64_t v19 = v17[4] - v17[3];
          }
          uint64_t v13 = *(void *)(v17[7] + (v17[2] + 8) * (v19 + v18) + 8);
        }
      }
      if ((*(unsigned char *)(a1 + 67) & 0x40) != 0)
      {
        uint64_t result = [*(id *)(a1 + 32) objectAtIndex:0];
      }
      else
      {
        uint64_t v21 = v8;
        int64_t v22 = v4;
        unint64_t v23 = v7;
        unint64_t v24 = v6;
        unint64_t v25 = v34 - 1;
        if ([*(id *)(a1 + 48) count] <= v25)
        {
          uint64_t result = 0;
        }
        else
        {
          CFIndex v26 = *(void **)(a1 + 48);
          _NSBlockNumberForIndex(v26, v25, 0);
          uint64_t v28 = 0;
          if (v26[11] <= v27) {
            uint64_t v28 = v26[4] - v26[3];
          }
          uint64_t result = *(void *)(v26[7] + (v26[2] + 8) * (v28 + v27) + 8);
        }
        unint64_t v6 = v24;
        unint64_t v7 = v23;
        unint64_t v4 = v22;
        int v8 = v21;
      }
      if (result != v13) {
        break;
      }
      unint64_t v20 = 100;
      if ((v12 & 1) == 0)
      {
LABEL_34:
        if (v33) {
          char v33 = 1;
        }
        else {
          char v33 = [*(id *)(a1 + 8) _lockForReading];
        }
        if ((*(unsigned char *)(a1 + 64) & 8) == 0) {
          ++*(_WORD *)(a1 + 80);
        }
        _NSFastFillAllGlyphHolesForGlyphRange(a1, a2, 1uLL);
      }
LABEL_40:
      uint64_t result = [(id)a1 _fillLayoutHoleAtIndex:0 desiredNumberOfLines:v20];
      char v12 = 1;
      if ((*(unsigned char *)(*(void *)(*(void *)(a1 + *v4) + *v6) + 56) & 1) == 0) {
        goto LABEL_43;
      }
    }
    if ((v12 & 1) == 0) {
      goto LABEL_45;
    }
LABEL_43:
    if (v33) {
      uint64_t result = [*(id *)(a1 + 8) _unlock];
    }
LABEL_45:
    if ((v32 & 1) == 0) {
      uint64_t result = [*(id *)(*(void *)(a1 + *v4) + 56) unlock];
    }
    if ((v12 & 1) == 0) {
      break;
    }
    uint64_t result = _enableTextViewResizing(a1);
    if (*(void *)(a1 + *v7) == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v29 = *(void *)(a1 + *v8), v29 == 0x7FFFFFFFFFFFFFFFLL))
    {
      uint64_t result = [(id)a1 getFirstUnlaidCharacterIndex:0 glyphIndex:&v34];
      unint64_t v29 = v34;
    }
    else
    {
      uint64_t v34 = *(void *)(a1 + *v8);
    }
    if (v29 > a2) {
      break;
    }
    uint64_t v5 = *(void *)(a1 + *v4);
    char v30 = *(unsigned char *)(*(void *)(v5 + *v6) + 56) & v31;
    char v31 = 0;
  }
  while ((v30 & 1) != 0);
  return result;
}

uint64_t _NSInsertionPointDisplayCompareR(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)(a1 + 16);
  double v3 = *(double *)(a2 + 16);
  if (v2 < v3) {
    return 0xFFFFFFFFLL;
  }
  if (v2 > v3) {
    return 1;
  }
  unsigned int v5 = *(void *)a1 > *(void *)a2;
  if (*(void *)a1 < *(void *)a2) {
    unsigned int v5 = -1;
  }
  if ((*(void *)(a1 + 8) | *(void *)(a2 + 8))) {
    return -v5;
  }
  else {
    return v5;
  }
}

uint64_t _NSInsertionPointDisplayCompareL(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)(a1 + 16);
  double v3 = *(double *)(a2 + 16);
  if (v2 < v3) {
    return 0xFFFFFFFFLL;
  }
  if (v2 > v3) {
    return 1;
  }
  unsigned int v5 = *(void *)a1 > *(void *)a2;
  if (*(void *)a1 < *(void *)a2) {
    unsigned int v5 = -1;
  }
  if ((*(void *)(a2 + 8) & 1) == 0 || (*(void *)(a1 + 8) & 1) == 0) {
    return v5;
  }
  else {
    return -v5;
  }
}

uint64_t _NSInsertionPointLogicalCompare(void *a1, void *a2)
{
  if (*a1 < *a2) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a1 > *a2;
  }
}

void sub_18E5685CC(void *a1)
{
  objc_begin_catch(a1);
  if (v1) {
    int v4 = 0x200000;
  }
  else {
    int v4 = 0;
  }
  *(_DWORD *)(*v2 + *v3) = *(_DWORD *)(*v2 + *v3) & 0xFFDFFFFF | v4;
  objc_exception_rethrow();
}

void sub_18E568604(_Unwind_Exception *a1)
{
}

Class initNSColor_0()
{
  __NSGetFrameworkReference(0, 0);
  Class result = objc_getClass("NSColor");
  classNSColor_0 = (uint64_t)result;
  if (!result) {
    initNSColor_cold_1_0();
  }
  getNSColorClass_0[0] = NSColorFunction_0;
  return result;
}

uint64_t NSColorFunction_0()
{
  return classNSColor_0;
}

void _NSTimeBackgroundLayout()
{
  _backgroundLayoutTimer = 0;
}

uint64_t initUIRectIntegralWithScale(double a1, double a2, double a3, double a4, double a5)
{
  uint64_t v10 = (void *)__NSGetFrameworkReference(0, 0);
  int64_t v11 = (uint64_t (*)())dlsym(v10, "UIRectIntegralWithScale");
  softLinkUIRectIntegralWithScale = v11;
  if (!v11) {
    initUIRectIntegralWithScale_cold_1();
  }
  v12.n128_f64[0] = a1;
  v13.n128_f64[0] = a2;
  v14.n128_f64[0] = a3;
  v15.n128_f64[0] = a4;
  v16.n128_f64[0] = a5;

  return ((uint64_t (*)(__n128, __n128, __n128, __n128, __n128))v11)(v12, v13, v14, v15, v16);
}

void sub_18E56AD1C(void *a1)
{
}

CFStringRef __NSRunCopyStringCallback(uint64_t a1, char *a2, uint64_t a3)
{
  if (*(void *)(a3 + 152)) {
    uint64_t v5 = *(void *)(a3 + 152);
  }
  else {
    uint64_t v5 = a3;
  }
  id v6 = objc_allocWithZone((Class)__NSATSStringSegment);
  CFStringRef v7 = (const __CFString *)objc_msgSend((id)objc_msgSend(*(id *)(v5 + 80), "attributedString"), "string");
  uint64_t v8 = *(void *)(v5 + 128) + a1;

  return [(__NSATSStringSegment *)v6 initWithOriginalString:v8 range:a2];
}

uint64_t __NSRunGetBidiLevels(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [*(id *)(a3 + 80) _bidiLevels];
  if (v4) {
    return v4 + a1;
  }
  else {
    return 0;
  }
}

uint64_t __NSCleanCopyRun(const __CTRun *a1, uint64_t a2, uint64_t a3)
{
  CFRange StringRange = CTRunGetStringRange(a1);
  uint64_t v5 = [(NSATSGlyphStorage *)a3 childGlyphStorageWithCharacterRange:StringRange.length];
  id v6 = v5[11];
  if ([v5[10] _bidiLevels]) {
    [v5[10] _baseWritingDirection];
  }
  if ((*((_DWORD *)v6 + 24) & 0x20) == 0
    || (CFStringRef v7 = (void *)[*((id *)v6 + 1) _kernOverride], objc_msgSend(v7, "doubleValue"), v8 == 0.0))
  {
    MutableCopdouble y = 0;
  }
  else
  {
    MutableCopdouble y = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)v6);
    CFDictionaryAddValue(MutableCopy, @"NSKern", v7);
  }
  if ((*((unsigned char *)v6 + 96) & 0x40) != 0 && ![*(id *)v6 objectForKey:@"CTVerticalForms"])
  {
    if (!MutableCopy) {
      MutableCopdouble y = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)v6);
    }
    CFDictionaryAddValue(MutableCopy, @"CTVerticalForms", (const void *)*MEMORY[0x1E4F1CFD0]);
  }
  if ((*((unsigned char *)v6 + 96) & 0x80) != 0)
  {
    if (!MutableCopy) {
      MutableCopdouble y = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)v6);
    }
    CFDictionarySetValue(MutableCopy, @"NSFont", *((const void **)v6 + 1));
  }
  if (MutableCopy)
  {
    uint64_t MutableRunsWithStorageAndOptions = CTRunCreateMutableRunsWithStorageAndOptions();
    CFRelease(MutableCopy);
    return MutableRunsWithStorageAndOptions;
  }
  else
  {
    return CTRunCreateMutableRunsWithStorageAndOptions();
  }
}

const void *_NSATSGlyphStorageCreateTruncationToken(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a3 < 1) {
    return 0;
  }
  else {
    return [(NSATSGlyphStorage *)a5 _createEllipsisRunWithStringRange:a3 attributes:a4];
  }
}

uint64_t __NSATSLineFragmentRunCompare(const __CTRun *a1, const __CTRun *a2)
{
  CFIndex location = CTRunGetStringRange(a1).location;
  CFIndex v4 = CTRunGetStringRange(a2).location;
  uint64_t v5 = -1;
  if (location >= v4) {
    uint64_t v5 = 1;
  }
  if (location == v4) {
    return 0;
  }
  else {
    return v5;
  }
}

void __NSDoReordants(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t *a8, uint64_t *a9)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = (a7 >> 63) | 1;
  uint64_t v15 = *a8;
  uint64_t v31 = *a9;
  int64_t v16 = v14 * a7;
  if (v14 * a7 < 11)
  {
    if (v16 <= 0)
    {
      qsort(__base, v14 * a7, 0x18uLL, (int (__cdecl *)(const void *, const void *))__NSReordantIndexCompare);
      *a8 = v15;
      *a9 = v31;
      return;
    }
    unint64_t v17 = __base;
  }
  else
  {
    unint64_t v17 = NSZoneMalloc(0, 24 * v16);
  }
  unint64_t v29 = a8;
  uint64_t v18 = 0;
  uint64_t v19 = v17 + 16;
  int64_t v20 = v16;
  uint64_t v21 = v17;
  do
  {
    *((void *)v19 - 2) = v18;
    *((void *)v19 - 1) = *(void *)(a4 + 8 * v18);
    *uint64_t v19 = (*(_DWORD *)(a3 + 4 * v18) & 0x20000) != 0;
    v19 += 24;
    v18 += v14;
    --v20;
  }
  while (v20);
  qsort(v17, v16, 0x18uLL, (int (__cdecl *)(const void *, const void *))__NSReordantIndexCompare);
  uint64_t v28 = v21;
  do
  {
    int v22 = *(_DWORD *)(a3 + 4 * *v21);
    if ((v22 & 0x20000) != 0)
    {
      if ((v22 & 0x20) != 0) {
        goto LABEL_28;
      }
      [a1 insertGlyph:*(unsigned __int16 *)(a2 + 2 * *v21) atGlyphIndex:v15 characterIndex:*(void *)(a4 + 8 * *v21) + a6];
      ++v31;
    }
    if ((v22 & 0x40000) != 0)
    {
      int v24 = *(unsigned __int16 *)(a2 + 2 * *v21);
      if (v24 == 0xFFFF) {
        int v24 = 0;
      }
      v33[0] = v24;
      uint64_t v23 = 1;
      if (!a5) {
        goto LABEL_20;
      }
LABEL_17:
      uint64_t v25 = *(void *)(a5 + 8 * *v21);
      if (v25 < 1) {
        goto LABEL_20;
      }
      if ((v22 & 0x40000) != 0)
      {
        uint64_t v26 = v15;
        if (objc_msgSend(a1, "glyphRangeForCharacterRange:actualCharacterRange:", *(void *)(a4 + 8 * *v21) + a6, 1, 0) != v15)
        {
          v33[v25] = v33[0];
          __memset_chk();
          *(_DWORD *)(a3 + 4 * *v21) |= 0x400000u;
          uint64_t v26 = v15;
          goto LABEL_25;
        }
      }
      else
      {
        uint64_t v26 = v15 + 1;
      }
      bzero(&v33[v23], 4 * v25);
LABEL_25:
      uint64_t v27 = v25 + v23;
      v15 += v25;
      goto LABEL_26;
    }
    uint64_t v23 = 0;
    if (a5) {
      goto LABEL_17;
    }
LABEL_20:
    if ((v22 & 0x40000) != 0)
    {
      uint64_t v27 = 1;
      uint64_t v26 = v15;
LABEL_26:
      objc_msgSend(a1, "substituteGlyphsInRange:withGlyphs:", v26, v27, v33, v28);
    }
    ++v15;
LABEL_28:
    v21 += 3;
    --v16;
  }
  while (v16);
  uint64_t *v29 = v15;
  *a9 = v31;
  if (__base != v28) {
    NSZoneFree(0, v28);
  }
}

uint64_t __NSReordantIndexCompare(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 < v3) {
    return 0xFFFFFFFFLL;
  }
  if (v2 == v3) {
    return *(unsigned __int8 *)(a1 + 16) - *(unsigned __int8 *)(a2 + 16);
  }
  return 1;
}

uint64_t UIAppendVInt32ToData(void *a1, unsigned int a2)
{
  if (a2 > 0x7F)
  {
    if (a2 >> 14)
    {
      if (a2 >> 21)
      {
        int v3 = (4 * a2) & 0x7F0000 | (((a2 >> 21) & 0x7F) << 24) | a2 & 0x7F | (((a2 >> 7) & 0x7F) << 8);
        if (a2 >> 28)
        {
          char v8 = a2 >> 28;
          uint64_t v4 = 5;
        }
        else
        {
          v3 |= 0x80000000;
          uint64_t v4 = 4;
        }
      }
      else
      {
        int v3 = (2 * a2) & 0x7F00 | a2 & 0x7F | (((a2 >> 14) & 0x7F) << 16) | 0x800000;
        uint64_t v4 = 3;
      }
    }
    else
    {
      int v3 = (2 * a2) & 0x7F00 | a2 & 0x7F | 0x8000;
      uint64_t v4 = 2;
    }
  }
  else
  {
    int v3 = a2 | 0x80;
    uint64_t v4 = 1;
  }
  int v7 = v3;
  __memcpy_chk();
  return [a1 appendBytes:v6 length:v4];
}

void sub_18E570280(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E571404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18E5717B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Block_object_dispose((const void *)(v33 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18E5720E8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_18E5725E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18E572AA8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_18E573754(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_18E573B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v6 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18E574B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_18E575730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose((const void *)(v59 - 240), 8);
  _Unwind_Resume(a1);
}

void sub_18E57606C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __normalizeTextRanges_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (void *)[a2 location];
  uint64_t v5 = [a3 location];

  return [v4 compare:v5];
}

uint64_t __visualBidiSelectionEnabled_block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSVisualBidiSelectionEnabled");
  visualBidiSelectionEnabled_uint64_t result = result;
  return result;
}

void NSTextLayoutManagerBreakOnNilContentManager()
{
  if (NSTextLayoutManagerBreakOnNilContentManager_onceToken != -1) {
    dispatch_once(&NSTextLayoutManagerBreakOnNilContentManager_onceToken, &__block_literal_global_4);
  }
}

void __NSTextLayoutManagerBreakOnNilContentManager_block_invoke()
{
}

void sub_18E5766A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E576AFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E576B7C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E576C44(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E576D00(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E577344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_18E577468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18E577914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_18E577C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18E577EFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E57837C(void *a1)
{
  objc_begin_catch(a1);
  *(unsigned char *)(v1 + 12_Block_object_dispose(&STACK[0x2B0], 8) = 0;
  objc_exception_rethrow();
}

void sub_18E57838C(_Unwind_Exception *a1)
{
  objc_end_catch();
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E57851C(void *a1)
{
  objc_begin_catch(a1);
  *(unsigned char *)(v1 + 12_Block_object_dispose(&STACK[0x2B0], 8) = 0;
  objc_exception_rethrow();
}

void sub_18E57852C(_Unwind_Exception *a1)
{
  objc_end_catch();
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E578708(void *a1)
{
  objc_begin_catch(a1);
  *(unsigned char *)(v1 + 12_Block_object_dispose(&STACK[0x2B0], 8) = 0;
  objc_exception_rethrow();
}

void sub_18E578718(_Unwind_Exception *a1)
{
  objc_end_catch();
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E578844(void *a1)
{
  objc_begin_catch(a1);
  *(unsigned char *)(v1 + 12_Block_object_dispose(&STACK[0x2B0], 8) = 0;
  objc_exception_rethrow();
}

void sub_18E578854(_Unwind_Exception *a1)
{
  objc_end_catch();
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E578D14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E578E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18E579178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18E579494(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18E579AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18E57A0B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL textRangesAreConnected(void *a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a1, "endLocation"), "compare:", objc_msgSend(a2, "location")) != -1
      && objc_msgSend((id)objc_msgSend(a2, "endLocation"), "compare:", objc_msgSend(a1, "location")) != -1;
}

void sub_18E57A520(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E57A58C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E57A6CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18E57AD2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18E57B0F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E57B16C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __UIFoundationWriteLog(uint64_t a1, os_log_type_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ____UIFoundationWriteLog_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (__UIFoundationWriteLog_onceToken != -1) {
    dispatch_once(&__UIFoundationWriteLog_onceToken, block);
  }
  int64_t v11 = (void *)[[NSString alloc] initWithUTF8String:a3];
  __n128 v12 = (void *)[[NSString alloc] initWithFormat:v11 arguments:&a9];
  __n128 v13 = __UIFoundationWriteLog_uifoundationLog;
  if (os_log_type_enabled((os_log_t)__UIFoundationWriteLog_uifoundationLog, a2))
  {
    *(_DWORD *)buf = 138543362;
    int64_t v16 = v12;
    _os_log_impl(&dword_18E4E8000, v13, a2, "%{public}@", buf, 0xCu);
  }
}

void sub_18E57B6FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E57B788(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double __NSTruncationTokenAttachmentGetWidth(void *a1)
{
  [a1 bounds];

  return CGRectGetWidth(*(CGRect *)&v1);
}

__CFString *UINibCoderValueTypeToString(unsigned int a1)
{
  if (a1 > 0xA) {
    return 0;
  }
  else {
    return UINibCoderValueTypeToString_table[a1];
  }
}

Class initNSColor_1()
{
  __NSGetFrameworkReference(0, 0);
  Class result = objc_getClass("NSColor");
  classNSColor_1 = (uint64_t)result;
  if (!result) {
    initNSColor_cold_1_1();
  }
  getNSColorClass_1 = (uint64_t)NSColorFunction_1;
  return result;
}

uint64_t NSColorFunction_1()
{
  return classNSColor_1;
}

uint64_t _NSSecureDecodingError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  CFMutableStringRef v9 = (void *)[[NSString alloc] initWithFormat:a3 arguments:&a9];
  uint64_t v10 = [NSString stringWithFormat:@"%@: %@", _NSMethodExceptionProem(), v9];
  uint64_t v11 = *MEMORY[0x1E4F281F8];
  uint64_t v14 = *MEMORY[0x1E4F28228];
  v15[0] = v10;
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v11, 4864, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1));

  return v12;
}

Class initNSColor_2()
{
  __NSGetFrameworkReference(0, 0);
  Class result = objc_getClass("NSColor");
  classNSColor_2 = (uint64_t)result;
  if (!result) {
    initNSColor_cold_1_2();
  }
  getNSColorClass_2[0] = NSColorFunction_2;
  return result;
}

uint64_t NSColorFunction_2()
{
  return classNSColor_2;
}

uint64_t _NSAttachmentCharacterSet()
{
  uint64_t result = _attachmentCharSet;
  if (!_attachmentCharSet)
  {
    if (_createAttachmentAndBidiCharSets_onceToken != -1) {
      dispatch_once(&_createAttachmentAndBidiCharSets_onceToken, &__block_literal_global_204);
    }
    return _attachmentCharSet;
  }
  return result;
}

uint64_t _NSNonAttachmentCharacterSet()
{
  uint64_t result = _nonAttachmentCharSet;
  if (!_nonAttachmentCharSet)
  {
    if (_createAttachmentAndBidiCharSets_onceToken != -1) {
      dispatch_once(&_createAttachmentAndBidiCharSets_onceToken, &__block_literal_global_204);
    }
    return _nonAttachmentCharSet;
  }
  return result;
}

uint64_t _NSBidiEmbeddingAndOverrideCharSet()
{
  uint64_t result = _bidiEmbeddingAndOverrideCharSet;
  if (!_bidiEmbeddingAndOverrideCharSet)
  {
    if (_createAttachmentAndBidiCharSets_onceToken != -1) {
      dispatch_once(&_createAttachmentAndBidiCharSets_onceToken, &__block_literal_global_204);
    }
    return _bidiEmbeddingAndOverrideCharSet;
  }
  return result;
}

uint64_t _NSBidiControlCharacterSet()
{
  uint64_t result = _bidiControlCharacterSet;
  if (!_bidiControlCharacterSet)
  {
    if (_createAttachmentAndBidiCharSets_onceToken != -1) {
      dispatch_once(&_createAttachmentAndBidiCharSets_onceToken, &__block_literal_global_204);
    }
    return _bidiControlCharacterSet;
  }
  return result;
}

unint64_t _NSXMLEncoding(char *a1, unint64_t a2)
{
  uint64_t v4 = 0;
  uint64_t v5 = 10;
  if (a2 > 0xA) {
    uint64_t v5 = a2;
  }
  uint64_t v6 = v5 - 10;
  uint64_t v7 = -1;
  char v8 = a1;
  do
  {
    if (!v6) {
      return 0;
    }
    uint64_t v9 = v4 + 10;
    ++v4;
    if (!strncasecmp(v8, "encoding=\"", 0xAuLL)) {
      uint64_t v7 = v9;
    }
    --v6;
    ++v8;
  }
  while (v7 < 0);
  if (v7 + 1 >= a2) {
    return 0;
  }
  CFIndex v10 = 0;
  CFIndex v11 = -1;
  do
  {
    if (a1[v7 + v10] == 34) {
      CFIndex v11 = v10;
    }
    if ((v11 & 0x8000000000000000) == 0) {
      break;
    }
    unint64_t v12 = v7 + 2 + v10++;
  }
  while (v12 < a2);
  if (v11 < 1) {
    return 0;
  }
  CFStringRef v13 = CFStringCreateWithBytes(0, (const UInt8 *)&a1[v7], v11, 0x201u, 0);
  if (!v13) {
    return 0;
  }
  CFStringRef v14 = v13;
  CFStringEncoding v15 = CFStringConvertIANACharSetNameToEncoding(v13);
  CFRelease(v14);
  if (v15 == -1) {
    return 0;
  }

  return CFStringConvertEncodingToNSStringEncoding(v15);
}

unint64_t _NSHTMLEncoding(char *a1, unint64_t a2)
{
  uint64_t v4 = 0;
  uint64_t v5 = 8;
  if (a2 > 8) {
    uint64_t v5 = a2;
  }
  uint64_t v6 = v5 - 8;
  uint64_t v7 = -1;
  char v8 = a1;
  do
  {
    if (!v6) {
      return 0;
    }
    uint64_t v9 = v4 + 8;
    ++v4;
    if (!strncasecmp(v8, "charset=", 8uLL)) {
      uint64_t v7 = v9;
    }
    --v6;
    ++v8;
  }
  while (v7 < 0);
  if (v7 + 1 >= a2) {
    return 0;
  }
  CFIndex v10 = 0;
  CFIndex v11 = -1;
  do
  {
    if (a1[v7 + v10] == 34) {
      CFIndex v11 = v10;
    }
    if ((v11 & 0x8000000000000000) == 0) {
      break;
    }
    unint64_t v12 = v7 + 2 + v10++;
  }
  while (v12 < a2);
  if (v11 < 1) {
    return 0;
  }
  CFStringRef v13 = CFStringCreateWithBytes(0, (const UInt8 *)&a1[v7], v11, 0x201u, 0);
  if (!v13) {
    return 0;
  }
  CFStringRef v14 = v13;
  CFStringEncoding v15 = CFStringConvertIANACharSetNameToEncoding(v13);
  CFRelease(v14);
  if (v15 == -1) {
    return 0;
  }

  return CFStringConvertEncodingToNSStringEncoding(v15);
}

uint64_t _NSReadAttributedStringFromURLOrData(void *a1, unint64_t a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  uint64_t v8 = (uint64_t)a1;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3052000000;
  unint64_t v29 = __Block_byref_object_copy__3;
  char v30 = __Block_byref_object_dispose__3;
  uint64_t v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3052000000;
  uint64_t v23 = __Block_byref_object_copy__3;
  int v24 = __Block_byref_object_dispose__3;
  uint64_t v25 = 0;
  uint64_t v14 = 0;
  CFStringEncoding v15 = &v14;
  uint64_t v16 = 0x3052000000;
  uint64_t v17 = __Block_byref_object_copy__3;
  uint64_t v18 = __Block_byref_object_dispose__3;
  uint64_t v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = ___NSReadAttributedStringFromURLOrData_block_invoke;
  v13[3] = &unk_1E55C6720;
  v13[4] = &v26;
  v13[5] = &v20;
  v13[6] = &v14;
  _NSReadAttributedStringFromURLOrDataCommon(a1, a2, a3, a4, 0, (uint64_t)v13);
  uint64_t v9 = (void *)v27[5];
  if (v9)
  {
    if (v8) {

    }
    else {
      uint64_t v8 = v27[5];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  CFIndex v10 = (void *)v21[5];
  if (a5) {
    *a5 = v10;
  }
  else {

  }
  CFIndex v11 = (void *)v15[5];
  if (a6) {
    *a6 = v11;
  }
  else {

  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
  return v8;
}

void sub_18E57F538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

_NSAttributedStringAsyncReadReply *_NSReadAttributedStringFromURLOrDataAsync(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!(a1 | a2))
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F281F8];
    uint64_t v15 = 258;
    uint64_t v16 = 0;
LABEL_14:
    (*(void (**)(uint64_t, void, void, uint64_t))(a4 + 16))(a4, 0, 0, [v13 errorWithDomain:v14 code:v15 userInfo:v16]);
    return 0;
  }
  if (a1 && ([(id)a1 isFileURL] & 1) == 0)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F281F8];
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:a1 forKey:*MEMORY[0x1E4F289D0]];
    uint64_t v13 = v17;
    uint64_t v14 = v18;
    uint64_t v15 = 262;
    goto LABEL_14;
  }
  if (!a3) {
    a3 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  uint64_t v8 = [(id)a1 path];
  uint64_t v9 = [MEMORY[0x1E4F28B18] _allowedOptionClasses];
  uint64_t v26 = 0;
  uint64_t v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v26];
  if (v10) {
    [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v9 fromData:v10 error:&v26];
  }
  if (v26)
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithObject:v26 forKey:*MEMORY[0x1E4F28A50]];
    uint64_t v12 = (uint64_t)v11;
    if (v8) {
      [v11 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28328]];
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F281F8];
    uint64_t v15 = 256;
    uint64_t v16 = v12;
    goto LABEL_14;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___NSReadAttributedStringFromURLOrDataAsync_block_invoke;
  block[3] = &unk_1E55C5470;
  block[4] = v9;
  if (_NSReadAttributedStringFromURLOrDataAsync_onceToken != -1) {
    dispatch_once(&_NSReadAttributedStringFromURLOrDataAsync_onceToken, block);
  }
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.textkit.nsattributedstringagent"];
  [v21 setRemoteObjectInterface:_NSReadAttributedStringFromURLOrDataAsync_connectionInterface];
  [v21 _setQueue:_NSReadAttributedStringFromURLOrDataAsync_connectionQueue];
  [v21 resume];
  uint64_t v19 = +[_NSAttributedStringAsyncReadReply readReplyWithConnection:v21 reply:a4];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = ___NSReadAttributedStringFromURLOrDataAsync_block_invoke_2;
  v24[3] = &unk_1E55C6680;
  v24[4] = v19;
  uint64_t v22 = (void *)[v21 remoteObjectProxyWithErrorHandler:v24];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = ___NSReadAttributedStringFromURLOrDataAsync_block_invoke_3;
  v23[3] = &unk_1E55C66D0;
  v23[4] = a3;
  v23[5] = v21;
  v23[6] = a1;
  v23[7] = v22;
  v23[8] = a2;
  v23[9] = v19;
  [v22 startWithReply:v23];
  return v19;
}

uint64_t _NSReadAttributedStringFromHTMLData(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  v68[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    BOOL v41 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _NSReadAttributedStringFromHTMLData(NSData *, NSDictionary *, NSString *, NSAttributedString **, NSDictionary **, NSError **)"), @"NSAttributedStringAdditions.m", 2289, @"Invalid parameter not satisfying: %@", @"fileContents" file lineNumber description];
    if (a4)
    {
LABEL_3:
      if (a2) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  CFIndex v42 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  [v42 handleFailureInFunction:objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _NSReadAttributedStringFromHTMLData(NSData *, NSDictionary *, NSString *, NSAttributedString **, NSDictionary **, NSError **)"), @"NSAttributedStringAdditions.m", 2290, @"Invalid parameter not satisfying: %@", @"outString" file lineNumber description];
  if (!a2) {
LABEL_4:
  }
    a2 = (void *)[MEMORY[0x1E4F1C9E8] dictionary];
LABEL_5:
  *a4 = 0;
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  uint64_t v12 = [MEMORY[0x1E4F28B18] _allowedOptionClasses];
  uint64_t v60 = 0;
  uint64_t v13 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a2 requiringSecureCoding:1 error:&v60];
  if (v13) {
    [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v12 fromData:v13 error:&v60];
  }
  if (!v60) {
    goto LABEL_17;
  }
  uint64_t v14 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithObject:v60 forKey:*MEMORY[0x1E4F28A50]];
  uint64_t v15 = v14;
  if (a3) {
    [v14 setObject:a3 forKeyedSubscript:*MEMORY[0x1E4F28328]];
  }
  id v16 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:256 userInfo:v15];
  if (!v16)
  {
LABEL_17:
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___NSReadAttributedStringFromHTMLData_block_invoke;
    block[3] = &unk_1E55C5470;
    block[4] = v12;
    if (_NSReadAttributedStringFromHTMLData_onceToken != -1) {
      dispatch_once(&_NSReadAttributedStringFromHTMLData_onceToken, block);
    }
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.textkit.nsattributedstringagent"];
    [v18 setRemoteObjectInterface:_NSReadAttributedStringFromHTMLData_connectionInterface];
    [v18 _setQueue:_NSReadAttributedStringFromHTMLData_connectionQueue];
    [v18 resume];
    uint64_t v60 = 0;
    unint64_t v61 = &v60;
    uint64_t v62 = 0x3052000000;
    uint64_t v63 = __Block_byref_object_copy__3;
    uint64_t v64 = __Block_byref_object_dispose__3;
    uint64_t v65 = 0;
    uint64_t v54 = 0;
    CFRange v55 = &v54;
    uint64_t v56 = 0x3052000000;
    long long v57 = __Block_byref_object_copy__3;
    uint64_t v58 = __Block_byref_object_dispose__3;
    uint64_t v59 = 0;
    uint64_t v48 = 0;
    UniChar v49 = &v48;
    uint64_t v50 = 0x3052000000;
    int64_t v51 = __Block_byref_object_copy__3;
    int64_t v52 = __Block_byref_object_dispose__3;
    uint64_t v53 = 0;
    uint64_t v19 = (void *)[a2 objectForKeyedSubscript:NSTimeoutDocumentOption];
    double v20 = -1.0;
    if (v19
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && ([v19 doubleValue], double v20 = v21, v21 >= 0.0))
    {
      uint64_t v23 = dispatch_semaphore_create(0);
      dispatch_retain(v23);
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      void v46[2] = ___NSReadAttributedStringFromHTMLData_block_invoke_3;
      v46[3] = &unk_1E55C6770;
      v46[4] = v23;
      v46[5] = &v48;
      uint64_t v22 = (void *)[v18 remoteObjectProxyWithErrorHandler:v46];
      char v24 = 0;
    }
    else
    {
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      void v47[2] = ___NSReadAttributedStringFromHTMLData_block_invoke_2;
      v47[3] = &unk_1E55C6748;
      v47[4] = &v48;
      uint64_t v22 = (void *)[v18 synchronousRemoteObjectProxyWithErrorHandler:v47];
      uint64_t v23 = 0;
      char v24 = 1;
    }
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = ___NSReadAttributedStringFromHTMLData_block_invoke_4;
    v44[3] = &unk_1E55C67C0;
    v44[4] = a2;
    v44[5] = v18;
    v44[6] = v22;
    v44[7] = a1;
    v44[10] = &v54;
    v44[11] = &v48;
    char v45 = v24;
    v44[8] = v23;
    v44[9] = &v60;
    [v22 startWithReply:v44];
    if (v24)
    {
      uint64_t v25 = (void *)v49[5];
      if (!v25)
      {
LABEL_37:
        if (v61[5])
        {
          if (objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"DocumentType"), "isEqualToString:", @"NSWebArchive"))
          {
            unint64_t v33 = [(id)v61[5] length];
            if (v33)
            {
              unint64_t v34 = 0;
              char v35 = 0;
              long long v43 = xmmword_18E5F73B0;
              do
              {
                while (1)
                {
                  unsigned __int16 v36 = objc_msgSend((id)v61[5], "attribute:atIndex:longestEffectiveRange:inRange:", @"NSFont", v34, &v43, v34, v33 - v34);
                  if (!CTFontIsLastResort()) {
                    break;
                  }
                  if ((v35 & 1) == 0) {
                    [(id)v61[5] beginEditing];
                  }
                  [v36 pointSize];
                  id v37 = +[UIFont userFontOfSize:](UIFont, "userFontOfSize:");
                  unint64_t v38 = (void *)v61[5];
                  uint64_t v67 = @"NSFont";
                  v68[0] = v37;
                  uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:&v67 count:1];
                  [v38 setAttributes:v39 range:v43];
                  unint64_t v34 = v43 + *((void *)&v43 + 1);
                  *(void *)&long long v43 = v34;
                  char v35 = 1;
                  if (v34 >= v33) {
                    goto LABEL_51;
                  }
                }
                unint64_t v34 = v43 + *((void *)&v43 + 1);
                *(void *)&long long v43 = v34;
              }
              while (v34 < v33);
              if ((v35 & 1) == 0) {
                goto LABEL_52;
              }
LABEL_51:
              [(id)v61[5] endEditing];
            }
          }
LABEL_52:
          *a4 = v61[5];
          int64_t v40 = (void *)v55[5];
          if (a5)
          {
            id v16 = 0;
            *a5 = v40;
          }
          else
          {

            id v16 = 0;
          }
          uint64_t v17 = 1;
        }
        else
        {
          uint64_t v17 = 0;
          id v16 = 0;
        }
LABEL_29:
        _Block_object_dispose(&v48, 8);
        _Block_object_dispose(&v54, 8);
        _Block_object_dispose(&v60, 8);
        if (!a6) {
          return v17;
        }
        goto LABEL_30;
      }
    }
    else
    {
      dispatch_time_t v26 = dispatch_time(0, (uint64_t)(v20 * 1000000000.0));
      intptr_t v27 = dispatch_semaphore_wait(v23, v26);
      dispatch_release(v23);
      uint64_t v25 = (void *)v49[5];
      if (!v25)
      {
        if (!v27) {
          goto LABEL_37;
        }
        unint64_t v29 = (void *)MEMORY[0x1E4F1CA60];
        uint64_t v30 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:2 userInfo:0];
        uint64_t v31 = (void *)[v29 dictionaryWithObject:v30 forKey:*MEMORY[0x1E4F28A50]];
        char v32 = v31;
        if (a3) {
          [v31 setObject:a3 forKeyedSubscript:*MEMORY[0x1E4F28328]];
        }
        id v16 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:v32];

LABEL_28:
        uint64_t v17 = 0;
        goto LABEL_29;
      }
    }
    id v16 = v25;

    goto LABEL_28;
  }
  uint64_t v17 = 0;
  if (!a6) {
    return v17;
  }
LABEL_30:
  if ((v17 & 1) == 0) {
    *a6 = v16;
  }
  return v17;
}

void sub_18E5808D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 256), 8);
  _Block_object_dispose((const void *)(v37 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t *_NSFontAttributeNames()
{
  if (_NSFontAttributeNames_onceToken != -1) {
    dispatch_once(&_NSFontAttributeNames_onceToken, &__block_literal_global_99);
  }
  return &_NSFontAttributeNames_names;
}

const char *_extensionTokenForPath(long long *a1, void *a2)
{
  if (!a2) {
    return 0;
  }
  [a2 fileSystemRepresentation];
  long long v4 = *a1;
  long long v5 = a1[1];
  uint64_t result = (const char *)sandbox_extension_issue_file_to_process();
  if (result) {
    return (const char *)objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", result, strlen(result) + 1, 1, v4, v5);
  }
  return result;
}

void *_NSReadAttributedStringFromURLOrDataSync(void *a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  objc_initWeak(&location, v12);
  uint64_t v13 = objc_loadWeak(&location);
  dispatch_retain(v13);
  uint64_t v44 = 0;
  char v45 = &v44;
  uint64_t v46 = 0x3052000000;
  CFRange v47 = __Block_byref_object_copy__3;
  uint64_t v48 = __Block_byref_object_dispose__3;
  uint64_t v49 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3052000000;
  BOOL v41 = __Block_byref_object_copy__3;
  CFIndex v42 = __Block_byref_object_dispose__3;
  uint64_t v43 = 0;
  uint64_t v32 = 0;
  unint64_t v33 = &v32;
  uint64_t v34 = 0x3052000000;
  char v35 = __Block_byref_object_copy__3;
  unsigned __int16 v36 = __Block_byref_object_dispose__3;
  uint64_t v37 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = ___NSReadAttributedStringFromURLOrDataSync_block_invoke;
  v30[3] = &unk_1E55C66F8;
  v30[4] = &v44;
  v30[5] = &v38;
  v30[6] = &v32;
  objc_copyWeak(&v31, &location);
  uint64_t v14 = _NSReadAttributedStringFromURLOrDataAsync((unint64_t)a2, a3, (uint64_t)a4, (uint64_t)v30);
  uint64_t v15 = (void *)[a4 objectForKeyedSubscript:NSTimeoutDocumentOption];
  if (v15)
  {
    [v15 doubleValue];
    double v17 = v16;
  }
  else
  {
    double v17 = 60.0;
  }
  uint64_t v18 = objc_loadWeak(&location);
  dispatch_time_t v19 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
  intptr_t v20 = dispatch_semaphore_wait(v18, v19);
  double v21 = objc_loadWeak(&location);
  dispatch_release(v21);
  uint64_t v22 = (void *)v33[5];
  if (v22)
  {
    if (a6) {
      *a6 = v22;
    }
    else {

    }
LABEL_13:
    a1 = 0;
    goto LABEL_14;
  }
  if (v20)
  {
    uint64_t v23 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v24 = *MEMORY[0x1E4F281F8];
    uint64_t v25 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4097 userInfo:0];
    dispatch_time_t v26 = (void *)[v23 dictionaryWithObject:v25 forKey:*MEMORY[0x1E4F28A50]];
    uint64_t v27 = [a2 path];
    if (v27) {
      [v26 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F28328]];
    }
    -[_NSAttributedStringAsyncReadReply cancelWithError:](v14, "cancelWithError:", [MEMORY[0x1E4F28C58] errorWithDomain:v24 code:259 userInfo:v26]);

    goto LABEL_13;
  }
  if (v45[5])
  {
    if (a1)
    {
      objc_msgSend(a1, "setAttributedString:");
    }
    else
    {
      a1 = (void *)v45[5];
    }
    unint64_t v29 = (void *)v39[5];
    if (a5) {
      *a5 = v29;
    }
    else {
  }
    }
LABEL_14:
  objc_destroyWeak(&v31);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);
  objc_destroyWeak(&location);
  return a1;
}

void sub_18E582914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  objc_destroyWeak(v24);
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose((const void *)(v25 - 136), 8);
  objc_destroyWeak((id *)(v25 - 88));
  _Unwind_Resume(a1);
}

void _NSReadAttributedStringFromURLOrDataAgent(unint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
}

void _NSReadAttributedStringFromURLOrDataCommon(void *a1, unint64_t a2, uint64_t a3, void *a4, int a5, uint64_t a6)
{
  id v7 = a4;
  *(void *)((char *)&v200[64] + 1) = *MEMORY[0x1E4F143B8];
  id v195 = 0;
  uint64_t v10 = (void *)[a4 objectForKey:@"NSIndexing"];
  uint64_t v11 = (void *)[v7 objectForKey:@"NSThumbnail"];
  uint64_t v179 = [v10 integerValue];
  uint64_t v12 = [v11 integerValue];
  uint64_t v13 = (void *)[v7 objectForKey:@"NSFileHeaderData"];
  char v14 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", @"NSNoReadNecessary"), "BOOLValue");
  BOOL v15 = +[NSTextList includesTextListMarkers];
  bzero(v200, 0x201uLL);
  id v194 = 0;
  if (!v10)
  {
    double v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"NSTextIndexing");
    if (v16) {
      uint64_t v179 = [v16 integerValue];
    }
  }
  uint64_t v17 = v179;
  if (v179 <= 0) {
    uint64_t v17 = v12;
  }
  uint64_t v178 = v17;
  if (!(a2 | a3)) {
    goto LABEL_12;
  }
  if (a2)
  {
    if (([(id)a2 isFileURL] & 1) == 0)
    {
      uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F281F8];
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:a2 forKey:*MEMORY[0x1E4F289D0]];
      uint64_t v18 = v28;
      uint64_t v19 = v29;
      uint64_t v20 = 262;
      goto LABEL_30;
    }
    double v172 = (void *)[(id)a2 path];
    if (!a3 && [(id)a2 isFileURL] && !v172)
    {
LABEL_12:
      uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F281F8];
      uint64_t v20 = 258;
      uint64_t v21 = 0;
LABEL_30:
      [v18 errorWithDomain:v19 code:v20 userInfo:v21];
      uint64_t v30 = *(void (**)(void))(a6 + 16);
      v30();
      return;
    }
  }
  else
  {
    double v172 = (void *)[0 path];
  }
  int v175 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", @"TextKit1ListMarkerFormat"), "BOOLValue");
  uint64_t v22 = objc_msgSend(v7, "objectForKey:");
  if (!v22)
  {
    uint64_t v22 = [v7 objectForKey:NSFileTypeDocumentOption];
    if (v22) {
      uint64_t v22 = [MEMORY[0x1E4F28B18] _documentTypeForFileType:v22];
    }
  }
  char v164 = v14;
  uint64_t v166 = v13;
  BOOL v23 = 0;
  if (v22) {
    BOOL v24 = a3 == 0;
  }
  else {
    BOOL v24 = 1;
  }
  double v170 = (__CFString *)v22;
  uint64_t v25 = (__CFString *)v22;
  int v26 = 0;
  if (!v24)
  {
    int v169 = 0;
    goto LABEL_45;
  }
  int v169 = 0;
  if (v172)
  {
    *(void *)&long long v196 = 0;
    uint64_t v27 = objc_msgSend((id)objc_msgSend(v172, "pathExtension"), "lowercaseString");
    int v169 = [(id)a2 getResourceValue:&v196 forKey:*MEMORY[0x1E4F1C628] error:&v194];
    if (v169)
    {
      if ((void)v196)
      {
        int v26 = [(id)v196 BOOLValue];
        if (!v170)
        {
          if (v26)
          {
            if ([@"rtfd" isEqual:v27])
            {
              uint64_t v25 = @"NSRTFD";
            }
            else
            {
              uint64_t v188 = 0;
              int v49 = [(id)a2 getResourceValue:&v188 forKey:*MEMORY[0x1E4F1C728] error:0];
              if (v188) {
                int v50 = v49;
              }
              else {
                int v50 = 0;
              }
              if (v50 == 1)
              {
                int64_t v51 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:");
                if ([v51 conformsToType:*MEMORY[0x1E4F444A8]]) {
                  uint64_t v25 = @"NSRTFD";
                }
                else {
                  uint64_t v25 = 0;
                }
              }
              else
              {
                uint64_t v25 = 0;
              }
            }
            int v26 = 1;
            goto LABEL_44;
          }
LABEL_37:
          if ([@"rtf" isEqual:v27])
          {
            int v26 = 0;
            id v31 = (__CFString **)&NSRTFTextDocumentType;
LABEL_43:
            uint64_t v25 = *v31;
            goto LABEL_44;
          }
          if (([@"html" isEqualToString:v27] & 1) != 0
            || [@"htm" isEqualToString:v27])
          {
            int v26 = 0;
            id v31 = (__CFString **)&NSHTMLTextDocumentType;
            goto LABEL_43;
          }
          if ([@"webarchive" isEqualToString:v27])
          {
            int v26 = 0;
            id v31 = (__CFString **)&NSWebArchiveTextDocumentType;
            goto LABEL_43;
          }
          if ([@"txt" isEqualToString:v27])
          {
            int v26 = 0;
            id v31 = (__CFString **)&NSPlainTextDocumentType;
            goto LABEL_43;
          }
          uint64_t v188 = 0;
          int v52 = [(id)a2 getResourceValue:&v188 forKey:*MEMORY[0x1E4F1C728] error:0];
          if (v188) {
            int v53 = v52;
          }
          else {
            int v53 = 0;
          }
          if (v53 == 1)
          {
            uint64_t v54 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:");
            if ([v54 conformsToType:*MEMORY[0x1E4F444A0]])
            {
              CFRange v55 = &NSRTFTextDocumentType;
            }
            else
            {
              if (![v54 conformsToType:*MEMORY[0x1E4F443F0]])
              {
                if ([v54 conformsToType:*MEMORY[0x1E4F44538]]) {
                  uint64_t v25 = @"NSWebArchive";
                }
                else {
                  uint64_t v25 = 0;
                }
                goto LABEL_432;
              }
              CFRange v55 = &NSHTMLTextDocumentType;
            }
            uint64_t v25 = (__CFString *)*v55;
          }
          else
          {
            uint64_t v25 = 0;
          }
LABEL_432:
          int v26 = 0;
          goto LABEL_44;
        }
LABEL_36:
        uint64_t v25 = v170;
LABEL_44:
        BOOL v23 = v25 != 0;
        goto LABEL_45;
      }
    }
    else if (!a3)
    {
      uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v172, *MEMORY[0x1E4F28328], 0);
      (*(void (**)(uint64_t, void, void, uint64_t))(a6 + 16))(a6, 0, 0, [v32 errorWithDomain:*MEMORY[0x1E4F281F8] code:260 userInfo:v33]);
      return;
    }
    if (!v170) {
      goto LABEL_37;
    }
    int v26 = 0;
    goto LABEL_36;
  }
LABEL_45:
  BOOL v167 = v23;
  int v168 = v26;
  if (v25)
  {
    v173 = 0;
    unint64_t v34 = 0;
    goto LABEL_134;
  }
  if (a3)
  {
    unint64_t v35 = [(id)a3 length];
    if (v35 >= 0x200) {
      unint64_t v34 = 512;
    }
    else {
      unint64_t v34 = v35;
    }
    [(id)a3 getBytes:v200 length:v34];
  }
  else
  {
    if (!v13)
    {
      if (v169)
      {
        uint64_t v48 = createOrResetFileHandle(0, (uint64_t)v172, v7, v179 > 0);
        unint64_t v34 = [v48 readDataOfLength:512 buffer:v200];
        v173 = v48;
        if (v34) {
          goto LABEL_58;
        }
      }
      else
      {
        v173 = 0;
        unint64_t v34 = 0;
      }
      goto LABEL_71;
    }
    unint64_t v36 = [v13 length];
    if (v36 >= 0x200) {
      unint64_t v34 = 512;
    }
    else {
      unint64_t v34 = v36;
    }
    [v13 getBytes:v200 length:v34];
  }
  v173 = 0;
  if (v34)
  {
LABEL_58:
    unint64_t v37 = 0;
    uint64_t v38 = MEMORY[0x1E4F14390];
    do
    {
      uint64_t v39 = *((unsigned __int8 *)v200 + v37);
      if (*((char *)v200 + v37) < 0) {
        int v40 = __maskrune(v39, 0x4000uLL);
      }
      else {
        int v40 = *(_DWORD *)(v38 + 4 * v39 + 60) & 0x4000;
      }
      if (v40) {
        uint64_t v41 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v41 = v37;
      }
      ++v37;
    }
    while (v41 == 0x7FFFFFFFFFFFFFFFLL && v37 < v34);
    if (v41 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_72;
    }
  }
LABEL_71:
  uint64_t v41 = 0;
LABEL_72:
  if (v34 >= 9)
  {
    BOOL v43 = LODWORD(v200[0]) == 1768714338 && WORD2(v200[0]) == 29811;
    if (v43
      && BYTE6(v200[0]) >= 0x30u
      && BYTE6(v200[0]) <= 0x39u
      && HIBYTE(v200[0]) >= 0x30u
      && HIBYTE(v200[0]) <= 0x39u)
    {
LABEL_82:
      uint64_t v44 = (__CFString **)&NSWebArchiveTextDocumentType;
LABEL_132:
      uint64_t v25 = *v44;
      goto LABEL_133;
    }
    if (a3 && v200[0] == 1684436082)
    {
      uint64_t v44 = (__CFString **)&NSRTFDTextDocumentType;
      goto LABEL_132;
    }
  }
  size_t v45 = v34 - v41;
  if (v34 - v41 >= 6)
  {
    uint64_t v46 = (char *)v200 + v41;
    if (*(_DWORD *)((char *)v200 + v41) == 1953651835 && *((unsigned char *)v200 + v41 + 4) == 102)
    {
      uint64_t v44 = (__CFString **)&NSRTFTextDocumentType;
      goto LABEL_132;
    }
    if (v45 >= 7)
    {
      if (!strncasecmp(v46, "<html", 5uLL) || !strncasecmp(v46, "<head", 5uLL) || !strncasecmp(v46, "<title", 6uLL)) {
        goto LABEL_131;
      }
      if (v45 >= 0xF)
      {
        if (!strncasecmp(v46, "<!doctype html", 0xEuLL))
        {
LABEL_131:
          uint64_t v44 = (__CFString **)&NSHTMLTextDocumentType;
          goto LABEL_132;
        }
        if (v45 >= 0x14)
        {
          if (!strncasecmp(v46, "<?xml", 5uLL) && strnstr(v46, "<!DOCTYPE html", v45)) {
            goto LABEL_131;
          }
          if (v45 >= 0x41
            && !strncasecmp(v46, "<?xml", 5uLL)
            && (strnstr(v46, "<!DOCTYPE plist", v45) || strnstr(v46, "<!doctype plist", v45))
            && strnstr(v46, "<plist", v45))
          {
            if (!strnstr(v46, "<key>WebMainResource</key>", v45))
            {
              uint64_t v44 = (__CFString **)&NSPlainTextDocumentType;
              goto LABEL_132;
            }
            goto LABEL_82;
          }
        }
      }
    }
  }
  uint64_t v25 = 0;
LABEL_133:
  [v173 seekToFileOffset:0];
  int v26 = v168;
LABEL_134:
  uint64_t v56 = @"NSPlainText";
  if (v26) {
    uint64_t v56 = 0;
  }
  if (v25) {
    long long v57 = v25;
  }
  else {
    long long v57 = v56;
  }
  double v171 = v57;
  unsigned int v165 = v175 | v15;
  if (([(__CFString *)v57 isEqual:@"NSRTF"] & 1) == 0
    && ![(__CFString *)v171 isEqual:@"NSRTFD"])
  {
    if (([(__CFString *)v171 isEqual:@"NSHTML"] & 1) != 0
      || [(__CFString *)v171 isEqual:@"NSWebArchive"])
    {
      if (a3)
      {
        id v61 = (id)a3;
        goto LABEL_161;
      }
      id v64 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      if (v179 <= 0) {
        uint64_t v65 = 0;
      }
      else {
        uint64_t v65 = 2;
      }
      id v61 = (id)[v64 initWithContentsOfFile:v172 options:v65 error:&v194];
      if (v61)
      {
LABEL_161:
        if (v179
          || !+[NSHTMLReader allowsAttributedStringAgentForOptions:v7])
        {
          uint64_t v67 = [[NSHTMLReader alloc] initWithData:v61 options:v7];
          if (v67)
          {
            id v68 = a1;
            if (!a1) {
              id v68 = objc_alloc_init(MEMORY[0x1E4F28E48]);
            }
            id v176 = v68;
            -[NSHTMLReader setMutableAttributedString:](v67, "setMutableAttributedString:");
            [(NSHTMLReader *)v67 setIncludesTextListMarkers:v165];
            if ([(NSHTMLReader *)v67 attributedString])
            {
              id v69 = [(NSHTMLReader *)v67 documentAttributes];
              if (v69) {
                id v70 = (id)[v69 mutableCopy];
              }
              else {
                id v70 = (id)[MEMORY[0x1E4F1CA60] dictionary];
              }
              id v195 = v70;
              [v70 setObject:v171 forKey:@"DocumentType"];
              if ([(__CFString *)v171 isEqual:@"NSHTML"])
              {
                objc_msgSend(v195, "setObject:forKey:", objc_msgSend((id)*MEMORY[0x1E4F443F0], "identifier"), @"UTI");
              }
              else if ([(__CFString *)v171 isEqual:@"NSWebArchive"])
              {
                objc_msgSend(v195, "setObject:forKey:", objc_msgSend((id)*MEMORY[0x1E4F44538], "identifier"), @"UTI");
              }
              int v81 = 1;
            }
            else
            {
              int v88 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v89 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v172, *MEMORY[0x1E4F28328], 0);
              int v81 = 0;
              id v194 = (id)[v88 errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:v89];
            }
          }
          else
          {
            int v81 = 0;
            id v176 = a1;
          }
        }
        else
        {
          if (![v7 objectForKeyedSubscript:@"DocumentType"]
            || ![v7 objectForKeyedSubscript:@"_WKAllowNetworkLoadsOption"])
          {
            if (v7) {
              uint64_t v66 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v7];
            }
            else {
              uint64_t v66 = [MEMORY[0x1E4F1CA60] dictionary];
            }
            uint64_t v115 = (void *)v66;
            if (![v7 objectForKeyedSubscript:@"DocumentType"]) {
              [v115 setObject:v171 forKeyedSubscript:@"DocumentType"];
            }
            if (![v7 objectForKeyedSubscript:@"_WKAllowNetworkLoadsOption"])
            {
              uint64_t v116 = (void *)[v115 objectForKeyedSubscript:@"_NSHTMLAllowNetworkAccess"];
              if (v116) {
                uint64_t v117 = [v116 BOOLValue];
              }
              else {
                uint64_t v117 = 1;
              }
              objc_msgSend(v115, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v117), @"_WKAllowNetworkLoadsOption");
              [v115 removeObjectForKey:@"_NSHTMLAllowNetworkAccess"];
            }
            id v7 = (id)[v115 copy];
          }
          if (a5)
          {
            __n128 v151 = dispatch_semaphore_create(0);
            dispatch_retain(v151);
            *(void *)&long long v196 = 0;
            *((void *)&v196 + 1) = &v196;
            *(void *)&long long v197 = 0x3052000000;
            *((void *)&v197 + 1) = __Block_byref_object_copy__3;
            v198 = __Block_byref_object_dispose__3;
            uint64_t v199 = 0;
            uint64_t v188 = 0;
            v189 = &v188;
            uint64_t v190 = 0x3052000000;
            v191 = __Block_byref_object_copy__3;
            v192 = __Block_byref_object_dispose__3;
            uint64_t v193 = 0;
            uint64_t v182 = 0;
            v183 = &v182;
            uint64_t v184 = 0x3052000000;
            v185 = __Block_byref_object_copy__3;
            v186 = __Block_byref_object_dispose__3;
            uint64_t v187 = 0;
            v181[0] = MEMORY[0x1E4F143A8];
            v181[1] = 3221225472;
            v181[2] = ___NSReadAttributedStringFromURLOrDataCommon_block_invoke;
            v181[3] = &unk_1E55C67E8;
            v181[6] = &v196;
            v181[7] = &v188;
            v181[8] = &v182;
            v181[4] = v7;
            v181[5] = v151;
            uint64_t v90 = v170;
            if ([(__CFString *)v171 isEqual:@"NSWebArchive"])
            {
              id v152 = (id)[v7 objectForKeyedSubscript:NSBaseURLDocumentOption];
              if (!v152) {
                id v152 = objc_alloc_init(MEMORY[0x1E4F1CB10]);
              }
              uint64_t v153 = [v7 objectForKey:NSTextEncodingNameDocumentOption];
              NSRange v154 = &stru_1EDD49F70;
              v180[0] = MEMORY[0x1E4F143A8];
              v180[1] = 3221225472;
              v180[2] = ___NSReadAttributedStringFromURLOrDataCommon_block_invoke_2;
              v180[3] = &unk_1E55C6810;
              if (v153) {
                NSRange v154 = (__CFString *)v153;
              }
              v180[4] = v61;
              v180[5] = v154;
              v180[6] = v152;
              [MEMORY[0x1E4F28B18] _loadFromHTMLWithOptions:v7 contentLoader:v180 completionHandler:v181];
            }
            else
            {
              [MEMORY[0x1E4F28B18] loadFromHTMLWithData:v61 options:v7 completionHandler:v181];
            }
            NSRange v155 = (void *)[v7 objectForKeyedSubscript:NSTimeoutDocumentOption];
            int v91 = v168;
            if (v155) {
              [v155 doubleValue];
            }
            else {
              double v156 = 60.0;
            }
            dispatch_time_t v157 = dispatch_time(0, (uint64_t)(v156 * 1000000000.0));
            intptr_t v158 = dispatch_semaphore_wait(v151, v157);
            dispatch_release(v151);
            NSRange v159 = (void *)v183[5];
            if (v159)
            {
              id v194 = v159;
            }
            else if (v158)
            {
              NSRange v160 = (void *)MEMORY[0x1E4F1CA60];
              uint64_t v161 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:2 userInfo:0];
              NSRange v162 = (void *)[v160 dictionaryWithObject:v161 forKey:*MEMORY[0x1E4F28A50]];
              NSRange v163 = v162;
              if (v172) {
                [v162 setObject:v172 forKeyedSubscript:*MEMORY[0x1E4F28328]];
              }
              id v194 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:v163];
            }
            else
            {
              id v176 = *(id *)(*((void *)&v196 + 1) + 40);
              if (v176)
              {
                if (a1)
                {
                  [a1 setAttributedString:v176];

                  id v176 = a1;
                }
                id v195 = (id)v189[5];
                int v81 = 1;
                goto LABEL_422;
              }
            }
            int v81 = 0;
            id v176 = a1;
LABEL_422:
            _Block_object_dispose(&v182, 8);
            _Block_object_dispose(&v188, 8);
            _Block_object_dispose(&v196, 8);
            goto LABEL_228;
          }
          *(void *)&long long v196 = 0;
          int v81 = _NSReadAttributedStringFromHTMLData((uint64_t)v61, v7, (uint64_t)v172, &v196, &v195, &v194);
          id v176 = a1;
          if (v81)
          {
            if (a1)
            {
              id v176 = a1;
              if ((void)v196)
              {
                [a1 setAttributedString:(void)v196];
                id v176 = a1;
              }
            }
            else
            {
              id v176 = (id)[(id)v196 mutableCopy];
            }
          }
        }
        uint64_t v90 = v170;
        int v91 = v168;
LABEL_228:
        if (v90) {
          BOOL v92 = 0;
        }
        else {
          BOOL v92 = v81 == 0;
        }
        int v93 = v167;
        if (!v92) {
          int v93 = 1;
        }
        int v86 = (v93 | v91) ^ 1;
        goto LABEL_234;
      }
    }
    else if (v170 && ([(__CFString *)v171 isEqual:@"NSPlainText"] & 1) == 0)
    {
      id v194 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:65806 userInfo:0];
    }
    if (([(__CFString *)v171 isEqual:@"NSPlainText"] & 1) == 0)
    {
      BOOL v87 = 0;
      uint64_t v59 = v173;
      id v176 = a1;
      goto LABEL_378;
    }
    id v176 = a1;
    goto LABEL_240;
  }
  uint64_t v58 = [(id)*MEMORY[0x1E4F444A0] identifier];
  if ([(__CFString *)v171 isEqual:@"NSRTF"])
  {
    if (a3) {
      goto LABEL_180;
    }
    if (v179 < 1)
    {
      a3 = (uint64_t)(id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v172 options:0 error:&v194];
    }
    else
    {
      a3 = (uint64_t)v166;
      if ((v14 & 1) == 0)
      {
        uint64_t v59 = createOrResetFileHandle(v173, (uint64_t)v172, v7, 1);
        a3 = [v59 readDataToEndOfFile];
        if (!a3)
        {
          uint64_t v113 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v114 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v172, *MEMORY[0x1E4F28328], 0);
          a3 = 0;
          int v81 = 0;
          id v194 = (id)[v113 errorWithDomain:*MEMORY[0x1E4F281F8] code:256 userInfo:v114];
          goto LABEL_208;
        }
        v173 = v59;
        goto LABEL_180;
      }
    }
    if (a3)
    {
LABEL_180:
      uint64_t v60 = [[NSRTFReader alloc] initWithRTF:a3];
      if (v60) {
        goto LABEL_181;
      }
    }
LABEL_207:
    int v81 = 0;
    uint64_t v59 = v173;
LABEL_208:
    id v176 = a1;
    goto LABEL_209;
  }
  if (!a3)
  {
    if (v179 < 1)
    {
      uint64_t v82 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", objc_msgSend(v172, "stringByResolvingSymlinksInPath"));
      id v83 = (id)[objc_alloc(MEMORY[0x1E4F28CF0]) initWithURL:v82 options:1 error:&v194];
      if (v83)
      {
        uint64_t v60 = [[NSRTFReader alloc] initWithRTFDFileWrapper:v83];
        goto LABEL_206;
      }
    }
    else
    {
      uint64_t v62 = [v172 stringByAppendingPathComponent:@"TXT.rtf"];
      uint64_t v63 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v62 options:2 error:&v194];
      if (v63)
      {
        uint64_t v60 = [[NSRTFReader alloc] initWithRTF:v63];

        goto LABEL_206;
      }
    }
    uint64_t v60 = 0;
LABEL_206:
    uint64_t v58 = [(id)*MEMORY[0x1E4F444A8] identifier];
    a3 = 0;
    if (v60) {
      goto LABEL_181;
    }
    goto LABEL_207;
  }
  uint64_t v60 = [[NSRTFReader alloc] initWithRTFD:a3];
  uint64_t v58 = [(id)*MEMORY[0x1E4F443C0] identifier];
  if (!v60) {
    goto LABEL_207;
  }
LABEL_181:
  uint64_t v71 = [v7 objectForKey:@"TargetTextScaling"];
  uint64_t v72 = [v7 objectForKey:@"TargetTextScaling"];
  uint64_t v73 = (void *)[v7 objectForKey:@"SourceTextScaling"];
  if (v72) {
    BOOL v74 = 1;
  }
  else {
    BOOL v74 = v71 == 0;
  }
  if (v74) {
    int v75 = (void *)v72;
  }
  else {
    int v75 = (void *)v71;
  }
  if (v75)
  {
    -[NSRTFReader _setTargetTextScaling:](v60, "_setTargetTextScaling:", [v75 integerValue]);
    if (v73) {
      -[NSRTFReader _setSourceTextScaling:](v60, "_setSourceTextScaling:", [v73 integerValue]);
    }
  }
  id v76 = a1;
  if (!a1) {
    id v76 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  }
  id v176 = v76;
  -[NSRTFReader setMutableAttributedString:](v60, "setMutableAttributedString:");
  if (v179 > 0) {
    [(NSRTFReader *)v60 setReadLimit:v179];
  }
  if (v12 >= 1) {
    [(NSRTFReader *)v60 setThumbnailLimit:v12];
  }
  [(NSRTFReader *)v60 setIncludesTextListMarkers:v165];
  if ([(NSRTFReader *)v60 attributedString])
  {
    id v77 = [(NSRTFReader *)v60 documentAttributes];
    if (v77) {
      id v78 = (id)[v77 mutableCopy];
    }
    else {
      id v78 = (id)[MEMORY[0x1E4F1CA60] dictionary];
    }
    id v195 = v78;
    [v78 setObject:v171 forKey:@"DocumentType"];
    [v195 setObject:v58 forKey:@"UTI"];
    int v81 = 1;
  }
  else
  {
    uint64_t v79 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v80 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v172, *MEMORY[0x1E4F28328], 0);
    int v81 = 0;
    id v194 = (id)[v79 errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:v80];
  }

  uint64_t v59 = v173;
LABEL_209:
  if (v170) {
    BOOL v84 = 0;
  }
  else {
    BOOL v84 = v81 == 0;
  }
  int v85 = v167;
  if (!v84) {
    int v85 = 1;
  }
  if ((v168 | v85))
  {
    int v86 = 0;
    v173 = v59;
    id v61 = (id)a3;
LABEL_234:
    BOOL v87 = v81 != 0;
    if (v81)
    {
      uint64_t v59 = v173;
      goto LABEL_378;
    }
    a3 = (uint64_t)v61;
    uint64_t v59 = v173;
    goto LABEL_237;
  }
  int v86 = [(__CFString *)v171 isEqual:@"NSRTF"];
LABEL_237:
  if (([(__CFString *)v171 isEqual:@"NSPlainText"] & 1) == 0 && !v86)
  {
    BOOL v87 = 0;
    goto LABEL_378;
  }
  v173 = v59;
LABEL_240:
  long long v196 = 0u;
  long long v197 = 0u;
  if (a3)
  {
    unint64_t v94 = [(id)a3 length];
    if (v94 >= 0x200) {
      unint64_t v34 = 512;
    }
    else {
      unint64_t v34 = v94;
    }
    [(id)a3 getBytes:v200 length:v34];
  }
  else if (v166)
  {
    unint64_t v95 = [v166 length];
    if (v95 >= 0x200) {
      unint64_t v34 = 512;
    }
    else {
      unint64_t v34 = v95;
    }
    [v166 getBytes:v200 length:v34];
  }
  else if (v169)
  {
    uint64_t v96 = createOrResetFileHandle(v173, (uint64_t)v172, v7, v179 > 0);
    unint64_t v34 = [v96 readDataOfLength:512 buffer:v200];
    v173 = v96;
  }
  int v97 = _NSExplicitCharacterEncodingTakesPrecedence_characterEncodingTakesPrecedence;
  if (_NSExplicitCharacterEncodingTakesPrecedence_characterEncodingTakesPrecedence == 254)
  {
    int v97 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSExplicitCharacterEncodingTakesPrecedence");
    _NSExplicitCharacterEncodingTakesPrecedence_characterEncodingTakesPrecedence = v97;
  }
  if (!v97
    || (unint64_t v98 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", @"CharacterEncoding"), "unsignedIntegerValue")) == 0)
  {
    uint64_t v100 = v173;
    if (v173 || (uint64_t v100 = createOrResetFileHandle(0, (uint64_t)v172, v7, v179 > 0)) != 0)
    {
      v173 = v100;
      [v100 fileDescriptor];
      [MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.TextEncoding"];
      if ([(id)_NSReadExtendedAttributesFromFileDescriptor() objectForKey:@"com.apple.TextEncoding"])
      {
        uint64_t v101 = _NSEncodingFromDataForExtendedAttribute();
        if (v101 != 0xFFFFFFFFLL)
        {
          uint64_t v99 = v101;
          if (v101) {
            goto LABEL_263;
          }
        }
      }
    }
    else
    {
      v173 = 0;
    }
    if (!v34) {
      goto LABEL_279;
    }
    unint64_t v103 = 0;
    uint64_t v104 = MEMORY[0x1E4F14390];
    do
    {
      uint64_t v105 = *((unsigned __int8 *)v200 + v103);
      if (*((char *)v200 + v103) < 0) {
        int v106 = __maskrune(v105, 0x4000uLL);
      }
      else {
        int v106 = *(_DWORD *)(v104 + 4 * v105 + 60) & 0x4000;
      }
      if (v106) {
        uint64_t v107 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v107 = v103;
      }
      ++v103;
    }
    while (v107 == 0x7FFFFFFFFFFFFFFFLL && v103 < v34);
    if (v107 == 0x7FFFFFFFFFFFFFFFLL) {
LABEL_279:
    }
      uint64_t v107 = 0;
    if (v34 < 4)
    {
      if (v34 < 2)
      {
LABEL_295:
        if (!v97)
        {
          uint64_t v112 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", @"CharacterEncoding"), "unsignedIntegerValue");
          if (v112)
          {
            unint64_t v102 = 0;
            uint64_t v99 = v112;
            goto LABEL_322;
          }
        }
        if (v34 >= 3 && LOBYTE(v200[0]) == 239 && BYTE1(v200[0]) == 187 && BYTE2(v200[0]) == 191) {
          goto LABEL_309;
        }
        unint64_t v111 = v34 - v107;
        if (v34 - v107 < 6) {
          goto LABEL_309;
        }
        if (!strncasecmp((const char *)v200 + v107, "<?xml", 5uLL))
        {
          unint64_t v118 = _NSXMLEncoding((char *)v200 + v107, v34 - v107);
          unint64_t v102 = 0;
          if (v118) {
            uint64_t v99 = v118;
          }
          else {
            uint64_t v99 = 4;
          }
          goto LABEL_322;
        }
        if (v111 < 7
          || strncasecmp((const char *)v200 + v107, "<html", 5uLL)
          && strncasecmp((const char *)v200 + v107, "<head", 5uLL)
          && strncasecmp((const char *)v200 + v107, "<title", 6uLL)
          && (v111 < 0xF || strncasecmp((const char *)v200 + v107, "<!doctype html", 0xEuLL))
          || (unint64_t v98 = _NSHTMLEncoding((char *)v200 + v107, v34 - v107)) == 0)
        {
LABEL_309:
          *(void *)&long long v196 = [NSString defaultCStringEncoding];
          unint64_t v102 = 1;
          uint64_t v99 = 4;
          goto LABEL_322;
        }
        goto LABEL_257;
      }
      int v109 = LOBYTE(v200[0]);
      int v110 = BYTE1(v200[0]);
    }
    else
    {
      int v109 = LOBYTE(v200[0]);
      int v110 = BYTE1(v200[0]);
      if (LOBYTE(v200[0]) == 255 && BYTE1(v200[0]) == 254 && !WORD1(v200[0])
        || !LOWORD(v200[0]) && BYTE2(v200[0]) == 254 && BYTE3(v200[0]) == 255)
      {
        unint64_t v102 = 0;
        uint64_t v99 = 2348810496;
        goto LABEL_322;
      }
    }
    if (v109 == 255 && v110 == 254 || v109 == 254 && v110 == 255)
    {
      unint64_t v102 = 0;
      uint64_t v99 = 10;
      goto LABEL_322;
    }
    goto LABEL_295;
  }
LABEL_257:
  uint64_t v99 = v98;
LABEL_263:
  unint64_t v102 = 0;
LABEL_322:
  if (!a3)
  {
    if (v178 < 1)
    {
      uint64_t v59 = v173;
      if (v173)
      {
        [v173 seekToFileOffset:0];
        id v119 = (id)[v173 readDataToEndOfFile];
      }
      else
      {
        id v119 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v172 options:0 error:&v194];
        uint64_t v59 = 0;
      }
      a3 = (uint64_t)v119;
      if (!v119) {
        goto LABEL_438;
      }
    }
    else
    {
      uint64_t v59 = v173;
      if (v164)
      {
        a3 = (uint64_t)v166;
        if (!v166)
        {
LABEL_438:
          int v123 = 0;
          goto LABEL_377;
        }
      }
      else
      {
        uint64_t v59 = createOrResetFileHandle(v173, (uint64_t)v172, v7, v179 > 0);
        a3 = [v59 readDataOfLength:v178];
        if (!a3)
        {
          uint64_t v120 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v121 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v172, *MEMORY[0x1E4F28328], 0);
          uint64_t v122 = [v120 errorWithDomain:*MEMORY[0x1E4F281F8] code:256 userInfo:v121];
          int v123 = 0;
          id v194 = (id)v122;
          goto LABEL_377;
        }
      }
    }
    v173 = v59;
  }
  if (!a1)
  {
    if (v176) {

    }
    id v176 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  }
  [v176 beginEditing];
  if (!v99)
  {
    if (!v194) {
      goto LABEL_361;
    }
LABEL_366:
    int v123 = 0;
    goto LABEL_376;
  }
  unint64_t v124 = 0;
  unint64_t v125 = v99;
  while (1)
  {
    uint64_t v126 = objc_opt_class();
    if (v126 == objc_opt_class())
    {
      id v127 = objc_alloc_init(MEMORY[0x1E4F28B40]);
      if (([v127 _setData:a3 encoding:v125] & 1) == 0)
      {

        goto LABEL_344;
      }
    }
    else
    {
      id v127 = (id)[[NSString alloc] initWithData:a3 encoding:v125];
    }
    if (v127) {
      goto LABEL_358;
    }
LABEL_344:
    uint64_t v188 = 0;
    uint64_t v188 = [(id)a3 length];
    if (v178 == v188 && v178 > 0)
    {
      CFStringConvertNSStringEncodingToEncoding(v125);
      [(id)a3 bytes];
      if (CFStringEncodingBytesToUnicode() == 1 && v188 > 0)
      {
        id v129 = objc_allocWithZone(NSString);
        uint64_t v130 = [(id)a3 bytes];
        id v127 = (id)[v129 initWithBytes:v130 length:v188 encoding:v125];
        if (v127) {
          goto LABEL_358;
        }
      }
    }
    if (v124 >= v102) {
      break;
    }
    unint64_t v125 = *((void *)&v196 + v124++);
    if (!v125)
    {
      id v127 = 0;
      BOOL v131 = 0;
      goto LABEL_359;
    }
  }
  id v127 = 0;
  unint64_t v125 = 0;
LABEL_358:
  BOOL v131 = v127 != 0;
LABEL_359:
  if (!v131 && !v194)
  {
LABEL_361:
    uint64_t v132 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v133 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v134 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    uint64_t v135 = objc_msgSend(v133, "dictionaryWithObjectsAndKeys:", v134, *MEMORY[0x1E4F28908], v172, *MEMORY[0x1E4F28328], 0);
    int v123 = 0;
    id v194 = (id)[v132 errorWithDomain:*MEMORY[0x1E4F281F8] code:261 userInfo:v135];
    goto LABEL_376;
  }
  if (!v131) {
    goto LABEL_366;
  }
  CFStringEncoding v136 = CFStringConvertNSStringEncodingToEncoding(v125);
  objc_msgSend(v176, "replaceCharactersInRange:withString:", 0, objc_msgSend(v176, "length"), v127);
  if (v136 == 1586 || (v136 & 0xFFF) == 0x100)
  {
    [v127 rangeOfCharacterFromSet:_NSBidiControlCharacterSet()];
    BOOL v137 = v138 == 0;
  }
  else
  {
    BOOL v137 = 1;
  }

  uint64_t v139 = [v7 objectForKey:@"DefaultAttributes"];
  if (v139)
  {
    objc_msgSend(v176, "setAttributes:range:", v139, 0, objc_msgSend(v176, "length"));
    if (!v137) {
      [v176 convertBidiControlCharactersToWritingDirection];
    }
  }
  else if (!v179)
  {
    char v140 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", +[UIFont userFontOfSize:](NSFont, "userFontOfSize:", 12.0), @"NSFont", 0);
    objc_msgSend(v176, "setAttributes:range:", v140, 0, objc_msgSend(v176, "length"));
  }
  uint64_t v141 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v142 = [(id)*MEMORY[0x1E4F44470] identifier];
  int v143 = objc_msgSend(v141, "dictionaryWithObjectsAndKeys:", @"NSPlainText", @"DocumentType", v142, @"UTI", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v125), @"CharacterEncoding", 0);
  id v195 = v143;
  if (v139) {
    [v143 setObject:v139 forKey:@"DefaultAttributes"];
  }
  int v123 = 1;
LABEL_376:
  [v176 endEditing];
  uint64_t v59 = v173;
LABEL_377:
  BOOL v87 = v123 != 0;
LABEL_378:
  if (v59) {
    [v59 closeFile];
  }
  uint64_t v144 = (uint64_t)v194;
  if (v194) {
    char v145 = 1;
  }
  else {
    char v145 = v87;
  }
  if ((v145 & 1) == 0)
  {
    uint64_t v146 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v147 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v172, *MEMORY[0x1E4F28328], 0);
    uint64_t v144 = [v146 errorWithDomain:*MEMORY[0x1E4F281F8] code:256 userInfo:v147];
    id v194 = (id)v144;
  }
  if (v87) {
    id v148 = v176;
  }
  else {
    id v148 = 0;
  }
  if (v87) {
    id v149 = v195;
  }
  else {
    id v149 = 0;
  }
  if (v87) {
    uint64_t v150 = 0;
  }
  else {
    uint64_t v150 = v144;
  }
  (*(void (**)(uint64_t, id, id, uint64_t))(a6 + 16))(a6, v148, v149, v150);
  if (!a1) {
}
  }

uint64_t _NSReadAttributedStringFromData(void *a1, uint64_t a2, void *a3, void *a4)
{
  return _NSReadAttributedStringFromURLOrData(a1, 0, a2, a3, a4, 0);
}

uint64_t _NSReadAttributedStringFromURL(void *a1, unint64_t a2, void *a3, void *a4)
{
  return _NSReadAttributedStringFromURLOrData(a1, a2, 0, a3, a4, 0);
}

void ___createAttachmentAndBidiCharSets_block_invoke()
{
  id v0 = (id)_attachmentCharSet;
  if (!_attachmentCharSet)
  {
    id v0 = (id)objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithRange:", 65532, 1);
    _attachmentCharSet = (uint64_t)v0;
  }
  if (!_nonAttachmentCharSet) {
    _nonAttachmentCharSet = (uint64_t)(id)[v0 invertedSet];
  }
  id v1 = (id)_bidiEmbeddingAndOverrideCharSet;
  if (!_bidiEmbeddingAndOverrideCharSet)
  {
    id v1 = (id)objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithRange:", 8234, 5);
    _bidiEmbeddingAndOverrideCharSet = (uint64_t)v1;
  }
  if (!_bidiControlCharacterSet)
  {
    id v2 = (id)[v1 mutableCopy];
    objc_msgSend(v2, "addCharactersInRange:", 8206, 2);
    _bidiControlCharacterSet = [v2 copy];
  }
}

uint64_t __NSAttributedStringFileTypeToDocumentTypeDictionary_block_invoke()
{
  id v6 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v0 = [(id)*MEMORY[0x1E4F44470] identifier];
  uint64_t v1 = [(id)*MEMORY[0x1E4F444A0] identifier];
  uint64_t v2 = [(id)*MEMORY[0x1E4F444A8] identifier];
  uint64_t v3 = [(id)*MEMORY[0x1E4F443C0] identifier];
  uint64_t v4 = [(id)*MEMORY[0x1E4F443F0] identifier];
  uint64_t result = objc_msgSend(v6, "initWithObjectsAndKeys:", @"NSPlainText", v0, @"NSRTF", v1, @"NSRTFD", v2, @"NSRTFD", v3, @"NSHTML", v4, @"NSWebArchive", objc_msgSend((id)*MEMORY[0x1E4F44538], "identifier"), 0);
  NSAttributedStringFileTypeToDocumentTypeDictionary___fileTypeToDocTypeDict = result;
  return result;
}

void *createOrResetFileHandle(void *a1, uint64_t a2, void *a3, int a4)
{
  uint64_t v4 = a1;
  if (a1 || (uint64_t v4 = (void *)[a3 objectForKey:@"NSFileHandle"]) != 0)
  {
    [v4 seekToFileOffset:0];
  }
  else
  {
    uint64_t v8 = (void *)[MEMORY[0x1E4F28CB0] fileHandleForReadingAtPath:a2];
    uint64_t v4 = v8;
    if (a4 && v8) {
      fcntl([v8 fileDescriptor], 48, 1);
    }
  }
  return v4;
}

uint64_t UINibDecoderDecodeSet(void *a1, void *a2)
{
  v16[32] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (int *)(a1[6] + 8 * a1[23]);
  uint64_t v3 = v2[1];
  if (!v3) {
    UINibDecoderDecodeSet_cold_1();
  }
  int v6 = *v2;
  uint64_t v7 = (v3 - 1);
  if (v7 < 0x21)
  {
    uint64_t v8 = v16;
    if (v3 < 2) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v8 = malloc_type_malloc(8 * v7, 0x80040B8603338uLL);
  }
  uint64_t v9 = 0;
  char v10 = 0;
  int v11 = v6 + 1;
  uint64_t v12 = v3 - 1;
  do
  {
    uint64_t v13 = UINibDecoderDecodeObjectForValue(a1, a1[7] + 8 * (v11 + v9), *(unsigned __int8 *)(a1[8] + (v11 + v9)));
    v8[v9] = v13;
    v10 |= v13 == 0;
    ++v9;
  }
  while (v12 != v9);
  if (v10)
  {

    uint64_t v14 = 0;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v14 = [a2 initWithObjects:v8 count:v7];
LABEL_10:
  if (v8 != v16) {
    free(v8);
  }
  return v14;
}

void sub_18E5866C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E586A6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E58748C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18E58785C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18E587B90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18E588AC0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

double _UIFoundationRoundedTextScalingFactor()
{
  return 0.77;
}

double _UIFoundationRoundedInverseTextScalingFactor()
{
  return 1.29871;
}

double _NSTextScalingConvertFontPointSize(uint64_t a1, uint64_t a2, double result)
{
  if (a1 != a2) {
    return dbl_18E5F7510[a2 == 1] * result * 100000.0 / 100000.0;
  }
  return result;
}

void sub_18E58AA68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18E58ABDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E58AC74(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E58ADB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E58B034(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E58B0B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E58D7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18E58E35C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18E58E568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18E58ED64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

void sub_18E58F0D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18E58F4AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__56(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__57(uint64_t a1)
{
}

void sub_18E58FB90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _freeExtraData(uint64_t a1)
{
  uint64_t v1 = (void *)a1;
  uint64_t v2 = *(void **)(a1 + 56);
  if (v2)
  {

    uint64_t v1 = (void *)a1;
  }
  uint64_t v3 = (void *)v1[9];
  if (v3)
  {

    uint64_t v1 = (void *)a1;
  }
  uint64_t v4 = (const void *)v1[11];
  if (v4)
  {
    CFRelease(v4);
    uint64_t v1 = (void *)a1;
  }
  long long v5 = (const void *)v1[12];
  if (v5)
  {
    CFRelease(v5);
    uint64_t v1 = (void *)a1;
  }
  int v6 = (void *)v1[23];
  if (v6)
  {
    _NSRemoveTextBlocksStartingAtGlyphIndex(v6, 0);

    uint64_t v1 = (void *)a1;
  }
  uint64_t v7 = (void *)v1[25];
  if (v7)
  {

    uint64_t v1 = (void *)a1;
  }
  uint64_t v8 = (void *)v1[52];
  if (v8)
  {

    uint64_t v1 = (void *)a1;
  }
  uint64_t v9 = (void *)v1[53];
  if (v9)
  {

    uint64_t v1 = (void *)a1;
  }
  char v10 = (void *)v1[54];
  if (v10)
  {

    uint64_t v1 = (void *)a1;
  }
  int v11 = (void *)v1[55];
  if (v11)
  {

    uint64_t v1 = (void *)a1;
  }
  uint64_t v12 = (void *)v1[64];
  if (v12) {

  }
  return MEMORY[0x1F41817F8]();
}

uint64_t _NSRemoveTextBlocksStartingAtGlyphIndex(void *a1, unint64_t a2)
{
  uint64_t v21 = 0;
  uint64_t result = [a1 count];
  uint64_t v18 = result;
  if (result)
  {
    uint64_t v4 = 0;
    do
    {
      long long v5 = (void *)[a1 objectAtIndex:v4];
      unint64_t v6 = [v5 count];
      unint64_t v8 = a2;
      unint64_t v9 = v6 - a2;
      v20.n128_u64[0] = a2;
      v20.n128_u64[1] = v6 - a2;
      if (v6 > a2)
      {
        unint64_t v10 = v6;
        unint64_t v8 = a2;
        unint64_t v11 = a2;
        do
        {
          *(void *)&long long v7 = _NSBlockNumberForIndex(v5, v11, &v20).n128_u64[0];
          if (v5[11] <= v12) {
            uint64_t v13 = v5[4] - v5[3];
          }
          else {
            uint64_t v13 = 0;
          }
          uint64_t v14 = *(_OWORD **)(v5[7] + (v5[2] + 8) * (v13 + v12) + 8);
          unint64_t v15 = v20.n128_u64[0];
          if (v14)
          {
            if (v20.n128_u64[0] >= a2)
            {

              unint64_t v15 = v20.n128_u64[0];
            }
            else
            {
              unint64_t v16 = v20.n128_u64[1] + v20.n128_u64[0];
              if (v20.n128_u64[1] + v20.n128_u64[0] > a2)
              {
                long long v7 = *MEMORY[0x1E4F28AD8];
                long long v17 = *(_OWORD *)(MEMORY[0x1E4F28AD8] + 16);
                v14[3] = *MEMORY[0x1E4F28AD8];
                v14[4] = v17;
                unint64_t v8 = v16;
              }
            }
          }
          unint64_t v11 = v20.n128_u64[1] + v15;
        }
        while (v20.n128_u64[1] + v15 < v10);
        unint64_t v9 = v10 - v8;
      }
      uint64_t result = objc_msgSend(v5, "replaceElementsInRange:withElement:coalesceRuns:", v8, v9, &v21, 1, *(double *)&v7);
      ++v4;
    }
    while (v4 != v18);
  }
  return result;
}

uint64_t _enableTextViewResizing_0(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 64);
  if ((v1 & 8) == 0)
  {
    uint64_t v2 = result;
    if (!*(_WORD *)(result + 80) || (__int16 v3 = *(_WORD *)(result + 80) - 1, (*(_WORD *)(result + 80) = v3) == 0))
    {
      *(_DWORD *)(result + 64) = v1 | 8;
      uint64_t v4 = [*(id *)(result + 32) count];
      uint64_t result = [*(id *)(v2 + 32) count];
      if (result)
      {
        uint64_t v5 = result;
        for (uint64_t i = 0; i != v5; ++i)
        {
          uint64_t result = CFStorageGetValueAtIndex();
          if (*(unsigned char *)(result + 64)) {
            uint64_t result = [(id)v2 _recalculateUsageForTextContainerAtIndex:i];
          }
        }
      }
      if (v4)
      {
        for (uint64_t j = 0; j != v4; ++j)
        {
          uint64_t result = CFStorageGetValueAtIndex();
          if ((*(unsigned char *)(result + 64) & 2) != 0) {
            uint64_t result = objc_msgSend((id)v2, "_resizeTextViewForTextContainer:", objc_msgSend(*(id *)(v2 + 32), "objectAtIndex:", j));
          }
        }
      }
      *(_DWORD *)(v2 + 64) &= ~8u;
    }
  }
  return result;
}

void sub_18E592940(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E592A88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E594DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

double _NSTextBlockBoundingRectAtIndex(uint64_t a1, unint64_t a2)
{
  double x = *MEMORY[0x1E4F28AD8];
  CGFloat y = *(double *)(MEMORY[0x1E4F28AD8] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F28AD8] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F28AD8] + 24);
  uint64_t v8 = [*(id *)(*(void *)(a1 + 240) + 184) count];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t i = 0; i != v9; ++i)
    {
      unint64_t v11 = (void *)[*(id *)(*(void *)(a1 + 240) + 184) objectAtIndex:i];
      __n128 v21 = 0uLL;
      _NSBlockNumberForIndex(v11, a2, &v21);
      uint64_t v13 = 0;
      if (v11[11] <= v12) {
        uint64_t v13 = v11[4] - v11[3];
      }
      uint64_t v14 = *(CGFloat **)(v11[7] + (v11[2] + 8) * (v13 + v12) + 8);
      if (v14)
      {
        CGFloat v15 = v14[6];
        double v16 = v14[7];
        CGFloat v17 = v14[8];
        CGFloat v18 = v14[9];
        v22.origin.double x = v15;
        v22.origin.CGFloat y = v16;
        v22.size.CGFloat width = v17;
        v22.size.CGFloat height = v18;
        if (!NSIsEmptyRect(v22))
        {
          if (v21.n128_u64[0])
          {
            _NSLayoutTreeLineFragmentRectForGlyphAtIndex(a1, v21.n128_u64[0], 0);
            double v16 = v16 + v19;
          }
          v23.origin.double x = x;
          v23.origin.CGFloat y = y;
          v23.size.CGFloat width = width;
          v23.size.CGFloat height = height;
          if (NSIsEmptyRect(v23))
          {
            CGFloat height = v18;
            CGFloat width = v17;
            CGFloat y = v16;
            double x = v15;
          }
          else
          {
            v24.origin.double x = v15;
            v24.origin.CGFloat y = v16;
            v24.size.CGFloat width = v17;
            v24.size.CGFloat height = v18;
            v26.origin.double x = x;
            v26.origin.CGFloat y = y;
            v26.size.CGFloat width = width;
            v26.size.CGFloat height = height;
            NSRect v25 = NSUnionRect(v24, v26);
            double x = v25.origin.x;
            CGFloat y = v25.origin.y;
            CGFloat width = v25.size.width;
            CGFloat height = v25.size.height;
          }
        }
      }
    }
  }
  return x;
}

void *_getFirstUnlaid(void *result, void *a2, void *a3)
{
  uint64_t v5 = result;
  uint64_t v6 = result[30];
  uint64_t v7 = *(void *)(v6 + 208);
  if (!v7 || (uint64_t v8 = *(void *)(v6 + 240)) == 0)
  {
    result[26] = 0;
    result[27] = 0;
    goto LABEL_9;
  }
  char v9 = *(unsigned char *)(v8 + 56);
  unint64_t v10 = result[27];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    char v11 = *(unsigned char *)(v7 + 56);
    unint64_t v13 = 0;
    unint64_t v14 = 0;
    unint64_t v12 = 0;
    if (v9 & 1) != 0 && (v11)
    {
      _NSGlyphTreeGetFirstHoleAfterGlyphIndex((uint64_t)result, 0, 0, (uint64_t *)&v14, 0, &v13);
      _NSLayoutTreeGetFirstHoleAfterGlyphIndex((uint64_t)v5, 0, &v12);
      uint64_t result = (void *)_NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)v5, v12);
      unint64_t v10 = v14;
      if (v14 > (unint64_t)result)
      {
        v5[27] = result;
        unint64_t v10 = (unint64_t)result;
        goto LABEL_20;
      }
LABEL_19:
      v5[26] = v13;
      v5[27] = v10;
      goto LABEL_20;
    }
    if (v11)
    {
      uint64_t result = (void *)_NSGlyphTreeGetFirstHoleAfterGlyphIndex((uint64_t)result, 0, 0, (uint64_t *)&v14, 0, &v13);
      unint64_t v10 = v14;
      goto LABEL_19;
    }
    if (v9)
    {
      _NSLayoutTreeGetFirstHoleAfterGlyphIndex((uint64_t)result, 0, &v12);
      uint64_t result = (void *)_NSGlyphTreeCharacterIndexForGlyphAtIndex((uint64_t)v5, v12);
      unint64_t v10 = (unint64_t)result;
      v5[27] = result;
    }
    else
    {
      uint64_t result = (void *)result[1];
      if (result)
      {
        uint64_t result = (void *)[result length];
        unint64_t v10 = (unint64_t)result;
      }
      else
      {
        unint64_t v10 = 0;
      }
      v5[27] = v10;
    }
  }
LABEL_20:
  if (a3 && v5[26] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v9)
    {
      uint64_t result = (void *)[v5 _glyphIndexForCharacterIndex:v10 startOfRange:1 okToFillHoles:0];
      v5[26] = result;
    }
    else
    {
      unint64_t v14 = 0;
      uint64_t result = (void *)_NSGlyphTreeGetFirstHoleAfterGlyphIndex((uint64_t)v5, 0, 0, 0, 0, &v14);
      v5[26] = v14;
    }
  }
LABEL_9:
  if (a2) {
    *a2 = v5[27];
  }
  if (a3) {
    *a3 = v5[26];
  }
  return result;
}

void _NSRemoveTextBlocksForGlyphRange(void *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v21 = 0;
  uint64_t v17 = [a1 count];
  if (v17)
  {
    uint64_t v4 = 0;
    unint64_t v16 = a2 + a3;
    do
    {
      uint64_t v5 = (void *)[a1 objectAtIndex:v4];
      unint64_t v6 = [v5 count];
      __n128 v20 = 0uLL;
      if (v16 <= v6) {
        unint64_t v7 = a3;
      }
      else {
        unint64_t v7 = v6 - a2;
      }
      if (v6 >= v16) {
        unint64_t v8 = a2 + a3;
      }
      else {
        unint64_t v8 = v6;
      }
      unint64_t v9 = a2;
      if (a2 < v8)
      {
        unint64_t v10 = a2;
        do
        {
          _NSBlockNumberForIndex(v5, v10, &v20);
          if (v5[11] <= v11) {
            uint64_t v12 = v5[4] - v5[3];
          }
          else {
            uint64_t v12 = 0;
          }
          unint64_t v13 = *(_OWORD **)(v5[7] + (v5[2] + 8) * (v12 + v11) + 8);
          if (v13)
          {
            if (a2 <= v20.n128_u64[0])
            {

              unint64_t v10 = v20.n128_u64[1] + v20.n128_u64[0];
              if (v20.n128_u64[1] + v20.n128_u64[0] > v7 + v9) {
                unint64_t v7 = v20.n128_u64[1] + v20.n128_u64[0] - v9;
              }
            }
            else
            {
              unint64_t v10 = v20.n128_u64[1] + v20.n128_u64[0];
              if (a2 < v20.n128_u64[1] + v20.n128_u64[0])
              {
                long long v14 = *(_OWORD *)(MEMORY[0x1E4F28AD8] + 16);
                v13[3] = *MEMORY[0x1E4F28AD8];
                v13[4] = v14;
                if (v9 < v10)
                {
                  BOOL v15 = v7 + v9 >= v10;
                  unint64_t v7 = v7 + v9 - v10;
                  if (v7 == 0 || !v15) {
                    goto LABEL_27;
                  }
                  unint64_t v9 = v10;
                }
              }
            }
          }
          else
          {
            unint64_t v10 = v20.n128_u64[1] + v20.n128_u64[0];
          }
        }
        while (v10 < v8);
      }
      if (v7) {
        objc_msgSend(v5, "replaceElementsInRange:withElement:coalesceRuns:", v9, v7, &v21, 1);
      }
LABEL_27:
      ++v4;
    }
    while (v4 != v17);
  }
}

uint64_t _NSDeleteGlyphRangeFromTextBlocks(void *a1, unint64_t a2, unint64_t a3)
{
  uint64_t result = [a1 count];
  uint64_t v15 = result;
  if (result)
  {
    uint64_t v6 = 0;
    unint64_t v7 = a2 + a3;
    do
    {
      unint64_t v8 = objc_msgSend(a1, "objectAtIndex:", v6, v15);
      v17.n128_u64[0] = a2;
      v17.n128_u64[1] = a3;
      if (a2 < v7)
      {
        unint64_t v9 = a2;
        do
        {
          _NSBlockNumberForIndex(v8, v9, &v17);
          if (v8[11] <= v10) {
            uint64_t v11 = v8[4] - v8[3];
          }
          else {
            uint64_t v11 = 0;
          }
          uint64_t v12 = *(void **)(v8[7] + (v8[2] + 8) * (v11 + v10) + 8);
          unint64_t v13 = v17.n128_u64[0];
          if (v12) {
            BOOL v14 = a2 > v17.n128_u64[0];
          }
          else {
            BOOL v14 = 1;
          }
          if (!v14 && v17.n128_u64[1] + v17.n128_u64[0] <= v7)
          {

            unint64_t v13 = v17.n128_u64[0];
          }
          unint64_t v9 = v17.n128_u64[1] + v13;
        }
        while (v17.n128_u64[1] + v13 < v7);
      }
      uint64_t result = objc_msgSend(v8, "removeElementsInRange:coalesceRuns:", a2, a3, 1);
      ++v6;
    }
    while (v6 != v15);
  }
  return result;
}

uint64_t _NSInsertGlyphRangeInTextBlocks(void *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v17 = 0;
  uint64_t result = [a1 count];
  if (result)
  {
    uint64_t v7 = result;
    for (uint64_t i = 0; i != v7; ++i)
    {
      unint64_t v9 = objc_msgSend(a1, "objectAtIndex:", i, v15);
      unint64_t v10 = [v9 count];
      __n128 v16 = 0uLL;
      uint64_t v15 = 0;
      if (a2 < v10
        && ((*(void *)&double v11 = _NSBlockNumberForIndex(v9, a2, &v16).n128_u64[0], v9[11] <= v12)
          ? (uint64_t v13 = v9[4] - v9[3])
          : (uint64_t v13 = 0),
            (uint64_t v15 = *(void *)(v9[7] + (v9[2] + 8) * (v13 + v12) + 8)) != 0
         && v16.n128_u64[0] < a2
         && a2 < v16.n128_u64[1] + v16.n128_u64[0]))
      {
        BOOL v14 = &v15;
      }
      else
      {
        BOOL v14 = &v17;
      }
      uint64_t result = objc_msgSend(v9, "insertElement:range:coalesceRuns:", v14, a2, a3, 1, v11, v15);
    }
  }
  return result;
}

NSLayoutManagerTextBlockHelper *_NSAddTextBlockWithGlyphRange(uint64_t a1, id *a2, uint64_t a3, unint64_t a4, unint64_t a5)
{
  uint64_t v30 = 0;
  id v31 = 0;
  unint64_t v9 = (double *)MEMORY[0x1E4F28AD8];
  id v10 = *a2;
  if (!*a2)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *a2 = v10;
  }
  double v11 = *v9;
  double v12 = v9[1];
  double v13 = v9[2];
  double v14 = v9[3];
  uint64_t v15 = [v10 count];
  if (!v15)
  {
    double v18 = v12;
    double v19 = v11;
    double v20 = v14;
    double v21 = v13;
    goto LABEL_20;
  }
  unint64_t v16 = v15;
  uint64_t v17 = 0;
  double v18 = v12;
  double v19 = v11;
  double v20 = v14;
  double v21 = v13;
  while (1)
  {
    NSRect v22 = (NSIdRunStorage *)[*a2 objectAtIndex:v17];
    __n128 v29 = 0uLL;
    *(void *)&double v24 = _NSBlockNumberForIndex(v22, a4, &v29).n128_u64[0];
    unint64_t v25 = 0;
    if (v22->super._gapBlockIndex <= v23) {
      unint64_t v25 = v22->super._maxBlocks - v22->super._numBlocks;
    }
    NSRect v26 = *(double **)&v22->super._runs->var1[(v22->super._elementSize + 8) * (v25 + v23)];
    if (!v26) {
      break;
    }
    if (*((void *)v26 + 1) == a3)
    {
      if (__PAIR128__(a5, a4) == *(_OWORD *)&v29) {
        return (NSLayoutManagerTextBlockHelper *)v26;
      }
      double v11 = v26[2];
      double v12 = v26[3];
      double v21 = v26[4];
      double v20 = v26[5];
      double v19 = v26[6];
      double v18 = v26[7];
      double v13 = v26[8];
      double v14 = v26[9];
      -[NSRunStorage replaceElementsInRange:withElement:coalesceRuns:](v22, "replaceElementsInRange:withElement:coalesceRuns:", v24);

      _NSBlockNumberForIndex(v22, a4, &v29);
      break;
    }
LABEL_12:
    NSRect v22 = 0;
LABEL_16:
    if (++v17 >= v16) {
      goto LABEL_17;
    }
  }
  if (v29.n128_u64[0] > a4) {
    goto LABEL_12;
  }
  if (a4 + a5 > v29.n128_u64[1] + v29.n128_u64[0]) {
    NSRect v22 = 0;
  }
  if (!v22) {
    goto LABEL_16;
  }
LABEL_17:
  if (!v22)
  {
LABEL_20:
    NSRect v22 = [(NSRunStorage *)[NSIdRunStorage alloc] initWithElementSize:8 capacity:0];
    -[NSRunStorage insertElement:range:coalesceRuns:](v22, "insertElement:range:coalesceRuns:", &v30, 0, *(void *)(*(void *)(*(void *)(a1 + 240) + 208) + 8), 1);
    [*a2 addObject:v22];
  }
  id v31 = -[NSLayoutManagerTextBlockHelper initWithTextBlock:layoutRect:boundsRect:]([NSLayoutManagerTextBlockHelper alloc], "initWithTextBlock:layoutRect:boundsRect:", a3, v11, v12, v21, v20, v19, v18, v13, v14);
  -[NSRunStorage replaceElementsInRange:withElement:coalesceRuns:](v22, "replaceElementsInRange:withElement:coalesceRuns:", a4, a5, &v31, 1);
  return v31;
}

__n128 _NSLocateTextBlockAtIndex(void *a1, uint64_t a2, unint64_t a3, long long *a4)
{
  uint64_t v8 = [a1 count];
  if (v8)
  {
    unint64_t v10 = v8;
    uint64_t v11 = 0;
    long long v16 = xmmword_18E5F72A0;
    while (1)
    {
      double v12 = (void *)[a1 objectAtIndex:v11];
      long long v17 = xmmword_18E5F72A0;
      __n128 result = _NSBlockNumberForIndex(v12, a3, (__n128 *)&v17);
      uint64_t v14 = v12[11] <= v13 ? v12[4] - v12[3] : 0;
      uint64_t v15 = *(void *)(v12[7] + (v12[2] + 8) * (v14 + v13) + 8);
      if (v15)
      {
        if (*(void *)(v15 + 8) == a2) {
          break;
        }
      }
      if (++v11 >= v10) {
        goto LABEL_13;
      }
    }
    result.n128_u64[0] = v17;
    long long v16 = v17;
LABEL_13:
    if (a4) {
      goto LABEL_14;
    }
  }
  else
  {
    result.n128_u64[0] = 0x7FFFFFFFFFFFFFFFLL;
    long long v16 = xmmword_18E5F72A0;
    if (a4)
    {
LABEL_14:
      __n128 result = (__n128)v16;
      *a4 = v16;
    }
  }
  return result;
}

uint64_t _NSClearGlyphIndexForPointCache(uint64_t result)
{
  *(void *)(*(void *)(result + 240) + 472) = 0;
  return result;
}

NSUInteger _glyphIndexForPoint(uint64_t a1, void *a2, double *a3, double a4, double a5)
{
  NSRange v143 = (NSRange)0;
  unint64_t v142 = 0;
  uint64_t v10 = *(void *)(a1 + 240);
  if (*(void **)(v10 + 472) == a2 && a4 == *(double *)(v10 + 456) && a5 == *(double *)(v10 + 464))
  {
    if (a3) {
      *a3 = *(double *)(v10 + 488);
    }
    return *(void *)(v10 + 480);
  }
  if ([a2 layoutManager] != a1) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"*** NSLayoutManager _glyphIndexForPoint(): given container does not appear in the list of containers for this NSLayoutManager."];
  }
  *(void *)(v10 + 472) = a2;
  *(double *)(v10 + 456) = a4;
  *(double *)(v10 + 464) = a5;
  _NSFastFillAllLayoutHolesForGlyphRange(a1, 0, 1uLL);
  if ((*(unsigned char *)(*(void *)(*(void *)(a1 + 240) + 208) + 56) & 2) == 0)
  {
    if (a3) {
      *a3 = 0.0;
    }
    goto LABEL_7;
  }
  unsigned long long v145 = 0uLL;
  NSRange v144 = (NSRange)0;
  unint64_t v12 = [(id)a1 _indexOfFirstGlyphInTextContainer:a2 okToFillHoles:1];
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3) {
      *a3 = 1.0;
    }
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 240) + 208) + 8);
    goto LABEL_12;
  }
  NSUInteger v11 = v12;
  double v14 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex(a1, v12, (uint64_t *)&v145);
  double v16 = v15;
  double v18 = v17;
  if (v15 > a5)
  {
    uint64_t v19 = objc_msgSend((id)a1, "_blockRangeForGlyphRange:", v145, v14);
    if (v145 == __PAIR128__(v20, v19))
    {
      if (a3) {
        *a3 = 0.0;
      }
      *(void *)(v10 + 480) = v11;
      *(void *)(v10 + 48_Block_object_dispose(&STACK[0x2B0], 8) = 0;
      return v11;
    }
  }
  if ((*(unsigned char *)(a1 + 67) & 0x40) != 0)
  {
    unint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 240) + 208) + 8);
    v143.unint64_t location = 0;
    v143.unint64_t length = v22;
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 0, v14);
  }
  else if (objc_msgSend(*(id *)(a1 + 48), "count", v14) > v11)
  {
    *(void *)&double v21 = _NSBlockNumberForIndex((void *)*(void *)(a1 + 48), v11, (__n128 *)&v143).n128_u64[0];
  }
  if ((*(unsigned char *)(a1 + 67) & 0x40) != 0)
  {
    unint64_t length = v143.length;
    unint64_t location = v143.location;
  }
  else
  {
    if (*(void *)(a1 + 216) == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v23 = *(void *)(a1 + 208), v23 == 0x7FFFFFFFFFFFFFFFLL))
    {
      objc_msgSend((id)a1, "getFirstUnlaidCharacterIndex:glyphIndex:", 0, &v142, v21);
      unint64_t v23 = v142;
    }
    else
    {
      unint64_t v142 = *(void *)(a1 + 208);
    }
    unint64_t length = v143.length;
    unint64_t location = v143.location;
    if (v143.length + v143.location > v23)
    {
      unint64_t length = v23 - v143.location;
      v143.unint64_t length = v23 - v143.location;
    }
  }
  char v140 = a3;
  _NSLayoutTreeLineFragmentRectForGlyphAtIndex(a1, location + length - 1, (uint64_t *)&v144);
  double v28 = v26;
  if (a5 >= v26)
  {
    double v32 = v27;
    BOOL v33 = a5 < v26 + v27;
    unsigned long long v145 = (unsigned __int128)v144;
    double v16 = v26;
  }
  else
  {
    NSUInteger v29 = *((void *)&v145 + 1);
    NSUInteger v30 = v145;
    NSUInteger v31 = v144.location;
    NSRange v141 = (NSRange)0;
    if (a5 < v16 || a5 >= v16 + v18)
    {
      if ((void)v145 != v144.location)
      {
        while (v30 + v29 != v31)
        {
          _NSLayoutTreeLineFragmentRectForGlyphAtIndex(a1, v30 + v29 - 1 + ((v31 - (v30 + v29 - 1)) >> 1), (uint64_t *)&v141);
          double v16 = v54;
          if (a5 >= v54 && a5 < v54 + v55)
          {
            double v32 = v55;
            unsigned long long v145 = (unsigned __int128)v141;
            goto LABEL_42;
          }
          if (v54 <= a5)
          {
            NSUInteger v29 = v141.length;
            NSUInteger v30 = v141.location;
          }
          else
          {
            NSUInteger v31 = v141.location;
          }
          if (v30 == v31) {
            goto LABEL_41;
          }
        }
      }
      NSUInteger v31 = v30;
LABEL_41:
      _NSLayoutTreeLineFragmentRectForGlyphAtIndex(a1, v31, 0);
      double v16 = v34;
      double v32 = v35;
      *(void *)&unsigned long long v145 = v31;
      *((void *)&v145 + 1) = v29;
    }
    else
    {
      double v32 = v18;
    }
LABEL_42:
    BOOL v33 = 1;
  }
  if ((*(unsigned char *)(a1 + 67) & 0x40) != 0)
  {
    _NSFastFillAllLayoutHolesForGlyphRange(a1, v145, *((unint64_t *)&v145 + 1));
    _NSLayoutTreeLineFragmentRectForGlyphAtIndex(a1, v145, (uint64_t *)&v145);
    double v16 = v36;
    double v32 = v37;
  }
  uint64_t v38 = (double *)MEMORY[0x1E4F28AD8];
  if (v33 && (unint64_t)v145 > v143.location)
  {
    NSRange v141 = (NSRange)v145;
    NSUInteger v39 = v145;
    NSUInteger v40 = 0;
    NSUInteger v139 = 0;
    NSUInteger v41 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v42 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      int v43 = *(_DWORD *)(a1 + 64);
      if ((v43 & 0x40000000) != 0)
      {
        _NSFastFillAllLayoutHolesForGlyphRange(a1, v39 - 1, 1uLL);
        NSUInteger v39 = v141.location;
        int v43 = *(_DWORD *)(a1 + 64);
      }
      if ((v43 & 0x40000000) != 0)
      {
        uint64_t v49 = [*(id *)(a1 + 32) objectAtIndex:0];
      }
      else
      {
        NSUInteger v44 = v40;
        unint64_t v45 = v39 - 1;
        if ([*(id *)(a1 + 48) count] <= v39 - 1)
        {
          uint64_t v49 = 0;
        }
        else
        {
          uint64_t v46 = *(void **)(a1 + 48);
          _NSBlockNumberForIndex(v46, v45, 0);
          uint64_t v48 = 0;
          if (v46[11] <= v47) {
            uint64_t v48 = v46[4] - v46[3];
          }
          uint64_t v49 = *(void *)(v46[7] + (v46[2] + 8) * (v48 + v47) + 8);
        }
        NSUInteger v40 = v44;
      }
      _NSLayoutTreeLineFragmentRectForGlyphAtIndex(a1, v141.location - 1, (uint64_t *)&v141);
      if ((void *)v49 != a2) {
        break;
      }
      if (v50 + v51 <= a5)
      {
        if (v42 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v146.unint64_t location = objc_msgSend((id)a1, "_blockRowRangeForGlyphRange:", v141, v50 + v51);
          NSRange v52 = NSIntersectionRange(v146, v143);
          NSUInteger v42 = v52.location;
          NSUInteger v139 = v52.length;
        }
        if (v42 == 0x7FFFFFFFFFFFFFFFLL || !v139 || v141.location <= v42) {
          break;
        }
      }
      else if (v50 <= a5)
      {
        if (v41 == 0x7FFFFFFFFFFFFFFFLL)
        {
          NSUInteger v40 = v141.length;
          NSUInteger v41 = v141.location;
        }
        else
        {
          v147.unint64_t location = v41;
          v147.unint64_t length = v40;
          NSRange v53 = NSUnionRange(v147, v141);
          NSUInteger v41 = v53.location;
          NSUInteger v40 = v53.length;
        }
      }
      NSUInteger v39 = v141.location;
    }
    while (v141.location > v143.location);
    uint64_t v38 = (double *)MEMORY[0x1E4F28AD8];
  }
  else
  {
    NSUInteger v40 = 0;
    NSUInteger v41 = 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger v57 = 0;
  double v58 = *v38;
  NSUInteger v59 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    if (v16 <= a5)
    {
      if (v32 + v16 > a5)
      {
        if (v41 == 0x7FFFFFFFFFFFFFFFLL)
        {
          NSUInteger v40 = *((void *)&v145 + 1);
          NSUInteger v41 = v145;
        }
        else
        {
          v149.unint64_t location = v41;
          v149.unint64_t length = v40;
          NSRange v61 = NSUnionRange(v149, (NSRange)v145);
          NSUInteger v41 = v61.location;
          NSUInteger v40 = v61.length;
        }
      }
      goto LABEL_96;
    }
    if (v59 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v148.unint64_t location = [(id)a1 _blockRowRangeForGlyphRange:v145];
      NSRange v60 = NSIntersectionRange(v148, v143);
      NSUInteger v59 = v60.location;
      NSUInteger v57 = v60.length;
    }
    if (v59 == 0x7FFFFFFFFFFFFFFFLL || !v57 || *((void *)&v145 + 1) + (void)v145 >= v59 + v57) {
      break;
    }
LABEL_96:
    NSUInteger v11 = *((void *)&v145 + 1) + v145;
    if (a5 >= v28 || (*(unsigned char *)(a1 + 67) & 0x40) != 0) {
      _NSFastFillAllLayoutHolesForGlyphRange(a1, *((void *)&v145 + 1) + v145, 1uLL);
    }
    if (v11 < *(void *)(*(void *)(*(void *)(a1 + 240) + 208) + 8))
    {
      double v62 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex(a1, v11, (uint64_t *)&v145);
      double v16 = v63;
      double v32 = v64;
      if ((*(unsigned char *)(a1 + 67) & 0x40) != 0)
      {
        uint64_t v68 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 0, v62);
      }
      else if (objc_msgSend(*(id *)(a1 + 48), "count", v62) <= v11)
      {
        uint64_t v68 = 0;
      }
      else
      {
        uint64_t v65 = *(void **)(a1 + 48);
        _NSBlockNumberForIndex(v65, v11, 0);
        uint64_t v67 = 0;
        if (v65[11] <= v66) {
          uint64_t v67 = v65[4] - v65[3];
        }
        uint64_t v68 = *(void *)(v65[7] + (v65[2] + 8) * (v67 + v66) + 8);
      }
      if ((void *)v68 == a2) {
        continue;
      }
    }
    break;
  }
  if (!v40)
  {
    if (v11 < *(void *)(*(void *)(*(void *)(a1 + 240) + 208) + 8))
    {
      if ((void)v145)
      {
        NSRange v141 = (NSRange)0;
        _NSLayoutTreeLineFragmentRectForGlyphAtIndex(a1, v145 - 1, (uint64_t *)&v141);
        if (v98 + v99 - a5 <= a5 - v16)
        {
          if (v140) {
            *char v140 = 1.0;
          }
          NSUInteger v11 = v141.location + v141.length - 1;
          double v100 = 1.0;
        }
        else
        {
          if (v140) {
            *char v140 = 0.0;
          }
          double v100 = 0.0;
          NSUInteger v11 = v145;
        }
        *(void *)(v10 + 480) = v11;
        *(double *)(v10 + 48_Block_object_dispose(&STACK[0x2B0], 8) = v100;
        return v11;
      }
      if (v140) {
        *char v140 = 0.0;
      }
LABEL_7:
      NSUInteger v11 = 0;
      *(void *)(v10 + 480) = 0;
      *(void *)(v10 + 48_Block_object_dispose(&STACK[0x2B0], 8) = 0;
      return v11;
    }
    uint64_t v101 = [(id)a1 glyphRangeForTextContainer:a2];
    if (v140) {
      *char v140 = 1.0;
    }
    uint64_t v13 = v102 + v101;
LABEL_12:
    NSUInteger v11 = v13 - 1;
    *(void *)(v10 + 480) = v13 - 1;
    *(void *)(v10 + 48_Block_object_dispose(&STACK[0x2B0], 8) = 0x3FF0000000000000;
    return v11;
  }
  v150.unint64_t location = objc_msgSend((id)a1, "_blockRowRangeForGlyphRange:", v41, v40);
  NSRange v69 = NSIntersectionRange(v150, v143);
  v70.unint64_t length = v69.length;
  NSUInteger v71 = v40;
  NSUInteger v72 = v41;
  if (v69.length)
  {
    v70.unint64_t location = v69.location;
    v151.unint64_t location = v41;
    v151.unint64_t length = v40;
    NSRange v73 = NSUnionRange(v151, v70);
    NSUInteger v71 = v73.length;
    NSUInteger v72 = v73.location;
  }
  double v74 = 10000000.0;
  if (v72 == v41 && v71 == v40 || (NSUInteger v75 = v72 + v71, v72 >= v72 + v71))
  {
    NSUInteger v76 = 0;
  }
  else
  {
    NSUInteger v76 = 0;
    NSUInteger v77 = 0x7FFFFFFFFFFFFFFFLL;
    double v74 = 10000000.0;
    do
    {
      double v78 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex(a1, v72, (uint64_t *)&v145);
      double v82 = v79 + v81;
      if (a5 >= v79 && a5 < v82)
      {
        if (a4 >= v78)
        {
          double v85 = v78 + v80;
          BOOL v121 = a4 <= v85;
          double v84 = a4 - v85;
          if (v121) {
            double v84 = 0.0;
          }
        }
        else
        {
          double v84 = v78 - a4;
        }
        if (a5 >= v79)
        {
          double v86 = 0.0;
          if (a5 > v82) {
            double v86 = a5 - v82;
          }
        }
        else
        {
          double v86 = v79 - a5;
        }
        double v87 = sqrt(v86 * v86 + v84 * v84);
        if (v87 <= v74)
        {
          NSUInteger v76 = *((void *)&v145 + 1);
          NSUInteger v77 = v145;
          double v74 = v87;
          double v58 = v78;
        }
      }
      NSUInteger v72 = *((void *)&v145 + 1) + v145;
    }
    while (*((void *)&v145 + 1) + (void)v145 < v75);
    if (v77 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_158;
    }
  }
  NSUInteger v88 = v41 + v40;
  NSUInteger v77 = 0x7FFFFFFFFFFFFFFFLL;
  if (v41 < v41 + v40)
  {
    while (1)
    {
      double v89 = _NSLayoutTreeLineFragmentRectForGlyphAtIndex(a1, v41, (uint64_t *)&v145);
      if (a4 >= v89)
      {
        double v94 = v89 + v91;
        BOOL v121 = a4 <= v94;
        double v93 = a4 - v94;
        if (v121) {
          double v93 = 0.0;
        }
      }
      else
      {
        double v93 = v89 - a4;
      }
      if (a5 >= v90)
      {
        double v96 = v90 + v92;
        double v95 = 0.0;
        if (a5 > v96) {
          double v95 = a5 - v96;
        }
      }
      else
      {
        double v95 = v90 - a5;
      }
      double v97 = sqrt(v95 * v95 + v93 * v93);
      if (v97 == 0.0) {
        break;
      }
      if (v97 < v74)
      {
        double v74 = v97;
        NSUInteger v76 = *((void *)&v145 + 1);
        NSUInteger v77 = v145;
        double v58 = v89;
      }
      NSUInteger v41 = *((void *)&v145 + 1) + v145;
      if (*((void *)&v145 + 1) + (void)v145 >= v88) {
        goto LABEL_158;
      }
    }
    NSUInteger v76 = *((void *)&v145 + 1);
    NSUInteger v77 = v145;
    double v58 = v89;
  }
LABEL_158:
  double v103 = _NSLayoutTreeLineFragmentUsedRectForGlyphAtIndex(a1, v77, (uint64_t *)&v145);
  double v105 = v104;
  [a2 lineFragmentPadding];
  double v107 = v103 + v105 - v106;
  unint64_t v108 = v77 + v76;
  if (v77 >= v77 + v76)
  {
    double v113 = 10000000.0;
    unint64_t v112 = v77;
    unint64_t v111 = v77;
  }
  else
  {
    double v109 = 10000000.0;
    unint64_t v110 = v77;
    unint64_t v111 = v77;
    unint64_t v112 = v77;
    double v113 = 10000000.0;
    do
    {
      int v114 = _NSGlyphTreeGlyphAtIndex(a1, v110, 0);
      if (!v114) {
        goto LABEL_220;
      }
      int v115 = v114;
      [(id)a1 locationForGlyphAtIndex:v110];
      double v117 = v116;
      if ((*(unsigned char *)(a1 + 67) & 2) != 0)
      {
        if (_NSGlyphTreeBidiLevelForGlyphAtIndex(a1, v110))
        {
          int v118 = 1;
        }
        else
        {
          int v118 = 0;
          if (v110 > v77 && v115 == 0xFFFFFF && v110 + 1 >= v108) {
            int v118 = _NSGlyphTreeBidiLevelForGlyphAtIndex(a1, v110 - 1) & 1;
          }
        }
      }
      else
      {
        int v118 = 0;
      }
      double v119 = v58 + v117;
      double v120 = v58 + v117 - a4;
      if (v58 + v117 <= a4) {
        double v120 = a4 - (v58 + v117);
      }
      BOOL v121 = v119 > v113 || v113 <= a4;
      if (!v121
        || (v119 < v113 ? (char v122 = 1) : (char v122 = v118),
            (v122 & 1) == 0 && v119 <= a4
         || (char v123 = v118 ^ 1, ((v118 ^ 1) & 1) == 0) && (v119 > v113 ? (v124 = v119 > a4) : (v124 = 1), !v124)))
      {
        char v123 = v118 ^ 1;
        double v113 = v58 + v117;
        unint64_t v111 = v110;
      }
      if (v119 >= v107) {
        char v125 = 1;
      }
      else {
        char v125 = v118;
      }
      if ((v125 & 1) == 0 && v119 > a4 || (v119 > v107 ? (char v126 = 1) : (char v126 = v123), (v126 & 1) == 0 && v119 > a4)) {
        double v107 = v58 + v117;
      }
      char v127 = v120 > v109 ? 1 : v118;
      if ((v127 & 1) == 0 && v119 <= a4) {
        goto LABEL_221;
      }
      char v128 = v120 >= v109 ? 1 : v118;
      if ((v128 & 1) == 0 && v119 > a4) {
        goto LABEL_221;
      }
      if (v120 >= v109) {
        int v118 = 0;
      }
      BOOL v129 = v118 != 1 || v119 > a4;
      if (v129 && (v120 > v109 ? (char v130 = 1) : (char v130 = v123), (v130 & 1) != 0 || v119 <= a4)) {
LABEL_220:
      }
        double v120 = v109;
      else {
LABEL_221:
      }
        unint64_t v112 = v110;
      ++v110;
      double v109 = v120;
      --v76;
    }
    while (v76);
  }
  if (v113 > a4)
  {
    *(void *)(v10 + 480) = v112;
    double v131 = 0.0;
    if ((*(unsigned char *)(a1 + 67) & 2) != 0)
    {
      BOOL v132 = (_NSGlyphTreeBidiLevelForGlyphAtIndex(a1, v112) & 1) == 0;
      double v131 = 1.0;
      double v133 = 0.0;
LABEL_238:
      if (v132) {
        double v131 = v133;
      }
    }
    goto LABEL_250;
  }
  if (v107 < a4)
  {
    *(void *)(v10 + 480) = v112;
    double v131 = 1.0;
    if ((*(unsigned char *)(a1 + 67) & 2) == 0) {
      goto LABEL_250;
    }
    uint64_t v134 = a1;
    unint64_t v135 = v112;
LABEL_237:
    BOOL v132 = (_NSGlyphTreeBidiLevelForGlyphAtIndex(v134, v135) & 1) == 0;
    double v131 = 0.0;
    double v133 = 1.0;
    goto LABEL_238;
  }
  *(void *)(v10 + 480) = v111;
  int v136 = *(_DWORD *)(a1 + 64);
  if (v113 < v107)
  {
    if (v136 & 0x2000000) != 0 && (_NSGlyphTreeBidiLevelForGlyphAtIndex(a1, v111)) {
      double v137 = v107 - a4;
    }
    else {
      double v137 = a4 - v113;
    }
    double v131 = v137 / (v107 - v113);
    goto LABEL_250;
  }
  double v131 = 1.0;
  if ((v136 & 0x2000000) != 0)
  {
    uint64_t v134 = a1;
    unint64_t v135 = v111;
    goto LABEL_237;
  }
LABEL_250:
  *(double *)(v10 + 48_Block_object_dispose(&STACK[0x2B0], 8) = v131;
  if (v140) {
    *char v140 = v131;
  }
  return *(void *)(v10 + 480);
}

void sub_18E59AEF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___allocExtraData_block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSUsesDefaultHyphenation");
  __NSUsesDefaultHyphenation = result;
  return result;
}

uint64_t ___nonDisplayInvalidatingTemporaryAttributeSet_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  return objc_msgSend(v0, "initWithObjects:", NSDataDetectionAttributeName, @"NSDominantLanguageAttributeName", @"NSDominantScriptAttributeName", NSOrthographyAttributeName, NSTextCheckedAttributeName, NSTextEditedAttributeName, 0);
}

uint64_t initUIGraphicsPushContext(uint64_t a1)
{
  uint64_t v2 = (void *)__NSGetFrameworkReference(0, 0);
  __int16 v3 = (uint64_t (*)())dlsym(v2, "UIGraphicsPushContext");
  softLinkUIGraphicsPushContext = v3;
  if (!v3) {
    initUIGraphicsPushContext_cold_1();
  }

  return ((uint64_t (*)(uint64_t))v3)(a1);
}

uint64_t initUIGraphicsPopContext()
{
  id v0 = (void *)__NSGetFrameworkReference(0, 0);
  int v1 = (uint64_t (*)())dlsym(v0, "UIGraphicsPopContext");
  softLinkUIGraphicsPopContext = v1;
  if (!v1) {
    initUIGraphicsPopContext_cold_1();
  }

  return v1();
}

uint64_t _NSCTTextAlignmentToHorizontalAlignment(uint64_t result, uint64_t *a2, char *a3)
{
  switch((int)result)
  {
    case 0:
      if (!a2) {
        goto LABEL_15;
      }
      uint64_t v3 = 2;
      goto LABEL_8;
    case 1:
      if (!a2) {
        goto LABEL_15;
      }
      uint64_t v3 = 3;
      goto LABEL_8;
    case 2:
      if (!a2) {
        goto LABEL_15;
      }
      uint64_t v3 = 4;
LABEL_8:
      *a2 = v3;
LABEL_15:
      if (!a3) {
        return result;
      }
      char v4 = 0;
LABEL_17:
      *a3 = v4;
      return result;
    case 3:
      if (a2) {
        *a2 = 0;
      }
      if (!a3) {
        return result;
      }
      char v4 = 1;
      goto LABEL_17;
    case 4:
      if (a2) {
        *a2 = 0;
      }
      goto LABEL_15;
    default:
      return result;
  }
}

void sub_18E59FCC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E5A01AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E5A0800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_18E5A09C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E5A0A48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E5A1654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double getWidthOfRuns(const __CTLine *a1, unint64_t a2, uint64_t a3)
{
  CFArrayRef GlyphRuns = CTLineGetGlyphRuns(a1);
  double v6 = 0.0;
  if (a2 < a2 + a3)
  {
    CFArrayRef v7 = GlyphRuns;
    do
    {
      ValueAtIndedouble x = (const __CTRun *)CFArrayGetValueAtIndex(v7, a2);
      v10.unint64_t length = CTRunGetGlyphCount(ValueAtIndex);
      v10.unint64_t location = 0;
      double v6 = v6 + CTRunGetTypographicBounds(ValueAtIndex, v10, 0, 0, 0);
      ++a2;
      --a3;
    }
    while (a3);
  }
  return v6;
}

uint64_t __NSCreateRenderingContextForString(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6, double a7, double a8)
{
  uint64_t v16 = 0;
  double v17 = &v16;
  uint64_t v18 = 0x3052000000;
  uint64_t v19 = __Block_byref_object_copy__10;
  unint64_t v20 = __Block_byref_object_dispose__10;
  uint64_t v21 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ____NSCreateRenderingContextForString_block_invoke;
  void v10[3] = &unk_1E55C75C0;
  v10[4] = a1;
  v10[5] = a2;
  *(double *)&v10[7] = a7;
  v10[6] = &v16;
  v10[8] = a3;
  char v11 = 0;
  char v12 = a6;
  char v13 = a4;
  char v14 = a5;
  *(double *)&v10[9] = a8;
  char v15 = 0;
  +[NSSingleLineTypesetter performWithSingleLineTypesetterContext:v10];
  uint64_t v8 = v17[5];
  _Block_object_dispose(&v16, 8);
  return v8;
}

void sub_18E5A3590(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_18E5A3CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t initSwiftUITextAnimationProviderClass()
{
  id v0 = (void *)__NSGetFrameworkReference(@"SwiftUI", 0);
  uint64_t v1 = (uint64_t (*)())dlsym(v0, "SwiftUITextAnimationProviderClass");
  softLinkSwiftUITextAnimationProviderClass Class = v1;
  if (!v1) {
    initSwiftUITextAnimationProviderClass_cold_1();
  }

  return v1();
}

uint64_t __attributedStringAtKeyframe_block_invoke_2(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  if (a3 > *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", objc_msgSend(*(id *)(a1 + 40), "attributedSubstringFromRange:"));
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
  }
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "attributedSubstringFromRange:", a3, a4);
  if (a2)
  {
    uint64_t v9 = [a2 applyKeyframe:*(void *)(a1 + 48) toContent:v8];
    if (v9)
    {
      CFRange v10 = (void *)v9;
      uint64_t v11 = [v8 length];
      uint64_t v8 = v10;
      if (v11 != [v10 length]) {
        __attributedStringAtKeyframe_block_invoke_2_cold_1();
      }
    }
  }
  uint64_t result = [*(id *)(a1 + 32) appendAttributedString:v8];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3 + a4;
  return result;
}

void sub_18E5A4E80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E5A4ED4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E5A4FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18E5A5760(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_18E5A5900(_Unwind_Exception *a1)
{
}

void sub_18E5A5920(void *a1)
{
}

void NSTextContentStorageBreakOnEnumerateWhileEditing()
{
  if (NSTextContentStorageBreakOnEnumerateWhileEditing_onceToken != -1) {
    dispatch_once(&NSTextContentStorageBreakOnEnumerateWhileEditing_onceToken, &__block_literal_global_206);
  }
}

void __NSTextContentStorageBreakOnEnumerateWhileEditing_block_invoke()
{
}

void sub_18E5A6018(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E5A62BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __NSTextContentStorageFillAttributedStringWithElementsInIndexRange(NSUInteger a1, NSUInteger a2, NSUInteger a3, void *a4, uint64_t a5, uint64_t a6)
{
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x3010000000;
  char v15 = "";
  uint64_t v16 = a5;
  uint64_t v17 = a6;
  if (a5 + a6 >= (unint64_t)[a4 length]) {
    uint64_t v10 = a3 - 1;
  }
  else {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [a4 beginEditing];
  if (a3)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = ____NSTextContentStorageFillAttributedStringWithElementsInIndexRange_block_invoke;
    v11[3] = &unk_1E55C7980;
    v11[4] = a4;
    v11[5] = &v12;
    v11[6] = v18;
    v11[7] = v10;
    __NSTextContentStorageEnumerateCachedElementsInElementIndexRange(a1, a2, a3, (uint64_t)v11);
  }
  else
  {
    objc_msgSend(a4, "replaceCharactersInRange:withString:", v13[4], v13[5], &stru_1EDD49F70);
  }
  [a4 endEditing];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v18, 8);
}

void sub_18E5A642C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

BOOL _NSStringHasRightToLeftBaseWritingDirectionAtIndex(const __CFString *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  if (CFStringGetCStringPtr(a1, SystemEncoding) || CFStringGetCStringPtr(a1, 0x600u)) {
    return 0;
  }
  NSWritingDirection v10 = _NSStringImputedBaseWritingDirectionAtIndex(a1, a2, a3, a4);
  if (v10 == NSWritingDirectionNatural) {
    NSWritingDirection v10 = +[NSParagraphStyle defaultWritingDirectionForLanguage:0];
  }
  return v10 == NSWritingDirectionRightToLeft;
}

uint64_t _NSStringHasRightToLeftCharactersInRange(const __CFString *a1, uint64_t a2, unint64_t a3)
{
  CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
  if (!CFStringGetCStringPtr(a1, SystemEncoding) && !CFStringGetCStringPtr(a1, 0x600u))
  {
    CFStringRef theString = a1;
    uint64_t v31 = a2;
    int64_t v32 = a3;
    CharactersPtr = CFStringGetCharactersPtr(a1);
    if (CharactersPtr) {
      CStringPtr = 0;
    }
    else {
      CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
    }
    int64_t v33 = 0;
    int64_t v34 = 0;
    NSUInteger v30 = CStringPtr;
    if (!_NSStringHasRightToLeftCharactersInRange_bidiPropertyBMP) {
      _NSStringHasRightToLeftCharactersInRange_bidiPropertyBMP = CFUniCharGetUnicodePropertyDataForPlane();
    }
    if (a3)
    {
      int64_t v9 = 0;
      memset(v27, 0, sizeof(v27));
      do
      {
        uint64_t v10 = v9;
        if (v9 < 0 || (int64_t v11 = v32, v32 <= v9))
        {
          UniChar v14 = 0;
        }
        else
        {
          uint64_t v12 = CharactersPtr;
          if (CharactersPtr)
          {
            int64_t v13 = v31 + v9;
          }
          else
          {
            if (v30)
            {
              UniChar v14 = v30[v31 + v9];
              goto LABEL_18;
            }
            if (v34 <= v9 || (int64_t v23 = v33, v33 > v9))
            {
              int64_t v24 = v9 - 4;
              if ((unint64_t)v9 < 4) {
                int64_t v24 = 0;
              }
              if (v24 + 64 < v32) {
                int64_t v11 = v24 + 64;
              }
              int64_t v33 = v24;
              int64_t v34 = v11;
              v35.unint64_t location = v31 + v24;
              v35.unint64_t length = v11 - v24;
              CFStringGetCharacters(theString, v35, (UniChar *)v27);
              int64_t v23 = v33;
            }
            int64_t v13 = v9 - v23;
            uint64_t v12 = (const UniChar *)v27;
          }
          UniChar v14 = v12[v13];
        }
LABEL_18:
        ++v9;
        UniChar v15 = v14;
        uint64_t UnicodePropertyDataForPlane = _NSStringHasRightToLeftCharactersInRange_bidiPropertyBMP;
        if (v10 < -1) {
          goto LABEL_31;
        }
        if (v9 >= a3) {
          goto LABEL_31;
        }
        if ((v14 & 0xFC00) != 0xD800) {
          goto LABEL_31;
        }
        uint64_t v17 = v32;
        if (v32 <= v9) {
          goto LABEL_31;
        }
        uint64_t v18 = CharactersPtr;
        if (CharactersPtr)
        {
          int64_t v19 = v31 + v9;
LABEL_24:
          UniChar v20 = v18[v19];
          goto LABEL_29;
        }
        if (!v30)
        {
          if (v34 <= v9 || (int64_t v25 = v33, v33 > v9))
          {
            uint64_t v26 = v10 - 3;
            if ((unint64_t)v10 < 3) {
              uint64_t v26 = 0;
            }
            if (v26 + 64 < v32) {
              uint64_t v17 = v26 + 64;
            }
            int64_t v33 = v26;
            int64_t v34 = v17;
            v36.unint64_t location = v31 + v26;
            v36.unint64_t length = v17 - v26;
            CFStringGetCharacters(theString, v36, (UniChar *)v27);
            int64_t v25 = v33;
          }
          int64_t v19 = v9 - v25;
          uint64_t v18 = (const UniChar *)v27;
          goto LABEL_24;
        }
        UniChar v20 = v30[v31 + v9];
LABEL_29:
        if (v20 >> 10 == 55)
        {
          UniChar v15 = (v15 << 10) + v20 + 9216;
          int64_t v9 = v10 + 2;
          uint64_t UnicodePropertyDataForPlane = CFUniCharGetUnicodePropertyDataForPlane();
        }
LABEL_31:
        if (UnicodePropertyDataForPlane)
        {
          unint64_t v21 = *(unsigned __int8 *)(UnicodePropertyDataForPlane + HIBYTE(v15));
          if (v21 >= 0x13) {
            LODWORD(v21) = *(unsigned __int8 *)(UnicodePropertyDataForPlane
          }
                                              + ((v21 << 8) - 4864)
                                              + v15
                                              + 256);
          unsigned int v22 = v21 - 2;
          if (v22 < 0xE && ((0x3009u >> v22) & 1) != 0) {
            return 1;
          }
        }
      }
      while (v9 < a3);
    }
  }
  return 0;
}

void sub_18E5A94F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

double NSTCIntersectionRect(double result, double a2, double a3, double a4, double a5, double a6, double a7)
{
  if (a3 <= 0.0) {
    double v7 = -0.0;
  }
  else {
    double v7 = a3;
  }
  double v8 = result + v7;
  if (a7 <= 0.0) {
    double v9 = -0.0;
  }
  else {
    double v9 = a7;
  }
  double v10 = a5 + v9;
  if (result < a5 || v8 > v10)
  {
    if (result > a5 || v8 < v10)
    {
      if (result < a5) {
        return a5;
      }
    }
    else
    {
      return a5;
    }
  }
  return result;
}

double _NSCalculateContainerOrigin(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  double v18 = a7 + a11 * 2.0;
  if (v18 >= a3) {
    return a1 + a11 - a5;
  }
  double v19 = a3 - v18;
  double v20 = a9 - (a5 + a7);
  if (v19 + 0.001 >= a5 + v20) {
    return a1 + a11;
  }
  double v21 = v19 * 0.5;
  if (v19 * 0.5 <= a5 && v21 <= v20) {
    return a1 + a11 - a5 + v21;
  }
  double result = a1 + a11;
  if (v21 > v20) {
    return result - a5 + v19 - v20;
  }
  return result;
}

void *romanString(uint64_t a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28E78] string];
  uint64_t v3 = v2;
  if (a1 <= 0)
  {
    objc_msgSend(v2, "appendFormat:", @"%ld", a1);
    return v3;
  }
  for (unint64_t i = a1 % 0xFA0uLL; i; i += v5)
  {
    if (i <= 0x3E7)
    {
      if (i <= 0x383)
      {
        if (i <= 0x1F3)
        {
          if (i <= 0x18F)
          {
            if (i <= 0x63)
            {
              if (i <= 0x59)
              {
                if (i <= 0x31)
                {
                  if (i <= 0x27)
                  {
                    if (i <= 9)
                    {
                      if (i == 9)
                      {
                        double v8 = @"ix";
                        goto LABEL_32;
                      }
                      if (i <= 4)
                      {
                        if (i == 4)
                        {
                          double v8 = @"iv";
LABEL_32:
                          [v3 appendString:v8];
                          return v3;
                        }
                        uint64_t v5 = -1;
                        double v6 = @"i";
                      }
                      else
                      {
                        uint64_t v5 = -5;
                        double v6 = @"v";
                      }
                    }
                    else
                    {
                      uint64_t v5 = -10;
                      double v6 = @"x";
                    }
                  }
                  else
                  {
                    uint64_t v5 = -40;
                    double v6 = @"xl";
                  }
                }
                else
                {
                  uint64_t v5 = -50;
                  double v6 = @"l";
                }
              }
              else
              {
                uint64_t v5 = -90;
                double v6 = @"xc";
              }
            }
            else
            {
              uint64_t v5 = -100;
              double v6 = @"c";
            }
          }
          else
          {
            uint64_t v5 = -400;
            double v6 = @"cd";
          }
        }
        else
        {
          uint64_t v5 = -500;
          double v6 = @"d";
        }
      }
      else
      {
        uint64_t v5 = -900;
        double v6 = @"cm";
      }
    }
    else
    {
      uint64_t v5 = -1000;
      double v6 = @"m";
    }
    [v3 appendString:v6];
  }
  return v3;
}

void *cjkString(unint64_t a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28E78] string];
  uint64_t v3 = v2;
  if ((a1 & 0x8000000000000000) != 0)
  {
    objc_msgSend(v2, "appendFormat:", @"%ld", a1);
    return v3;
  }
  if (!a1)
  {
    uint64_t v5 = 38646;
LABEL_13:
    objc_msgSend(v3, "appendFormat:", @"%C", v5);
    return v3;
  }
  unint64_t v4 = a1 % 0x64;
  if (!(a1 % 0x64))
  {
    [v2 appendString:@"百"];
    return v3;
  }
  if (v4 < 0x14)
  {
    if (v4 < 0xA) {
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(v2, "appendFormat:", @"%C", cjk_numerals[a1 % 0x64 / 0xA]);
  }
  objc_msgSend(v3, "appendFormat:", @"%C", 21313);
LABEL_11:
  int v6 = a1 % 0x64 % 0xA;
  if (v6)
  {
    uint64_t v5 = cjk_numerals[v6];
    goto LABEL_13;
  }
  return v3;
}

void *arabicIndicString(uint64_t a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28E78] string];
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a1);
  uint64_t v4 = [v3 length];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      int v7 = [v3 characterAtIndex:i];
      if ((v7 - 48) >= 0xA) {
        __int16 v8 = 0;
      }
      else {
        __int16 v8 = 1584;
      }
      objc_msgSend(v2, "appendFormat:", @"%C", (unsigned __int16)(v8 + v7));
    }
  }
  return v2;
}

void *hebrewString(unint64_t a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F28E78] string];
  uint64_t v3 = v2;
  if ((a1 & 0x8000000000000000) != 0)
  {
    objc_msgSend(v2, "appendFormat:", @"%ld", a1);
  }
  else if (a1)
  {
    for (unint64_t i = a1 % 0x3E8; i; i += v5)
    {
      if (i <= 0x18F)
      {
        if (i <= 0x12B)
        {
          if (i <= 0xC7)
          {
            if (i <= 0x63)
            {
              if (i == 15)
              {
                double v9 = @"טו";
LABEL_40:
                objc_msgSend(v3, "appendFormat:", v9, v10);
                break;
              }
              if (i == 16)
              {
                double v9 = @"טז";
                goto LABEL_40;
              }
              if (i <= 0x59)
              {
                if (i <= 0x4F)
                {
                  if (i <= 0x45)
                  {
                    if (i <= 0x3B)
                    {
                      if (i <= 0x31)
                      {
                        if (i <= 0x27)
                        {
                          if (i <= 0x1D)
                          {
                            if (i <= 0x13)
                            {
                              if (i <= 9)
                              {
                                objc_msgSend(v3, "appendFormat:", @"%C", (i + 1487));
                                break;
                              }
                              uint64_t v5 = -10;
                              int v6 = @"י";
                            }
                            else
                            {
                              uint64_t v5 = -20;
                              int v6 = @"כ";
                            }
                          }
                          else
                          {
                            uint64_t v5 = -30;
                            int v6 = @"ל";
                          }
                        }
                        else
                        {
                          uint64_t v5 = -40;
                          int v6 = @"מ";
                        }
                      }
                      else
                      {
                        uint64_t v5 = -50;
                        int v6 = @"נ";
                      }
                    }
                    else
                    {
                      uint64_t v5 = -60;
                      int v6 = @"ס";
                    }
                  }
                  else
                  {
                    uint64_t v5 = -70;
                    int v6 = @"ע";
                  }
                }
                else
                {
                  uint64_t v5 = -80;
                  int v6 = @"פ";
                }
              }
              else
              {
                uint64_t v5 = -90;
                int v6 = @"צ";
              }
            }
            else
            {
              uint64_t v5 = -100;
              int v6 = @"ק";
            }
          }
          else
          {
            uint64_t v5 = -200;
            int v6 = @"ר";
          }
        }
        else
        {
          uint64_t v5 = -300;
          int v6 = @"ש";
        }
      }
      else
      {
        uint64_t v5 = -400;
        int v6 = @"ת";
      }
      [v3 appendString:v6];
    }
    unint64_t v7 = [v3 length];
    if (v7 >= 2) {
      [v3 insertString:@"״" atIndex:v7 - 1];
    }
  }
  else
  {
    [v2 appendString:@"אפס"];
  }
  return v3;
}

void sub_18E5AB4EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double _NSGetUIFoundationVersionNumber()
{
  if (_NSGetUIFoundationVersionNumber_onceToken != -1) {
    dispatch_once(&_NSGetUIFoundationVersionNumber_onceToken, &__block_literal_global_27);
  }
  return *(double *)&_NSGetUIFoundationVersionNumber_UIFoundationVersionNumber;
}

NSUInteger __NSTextRunStorageEnumerateElementsInRange(NSUInteger result, NSUInteger a2, NSUInteger a3, int a4, uint64_t a5)
{
  NSUInteger v5 = a3 - 1;
  if (a4) {
    uint64_t v6 = -1;
  }
  else {
    uint64_t v6 = a3;
  }
  if (a4) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = 1;
  }
  if (!a4) {
    NSUInteger v5 = 0;
  }
  if (v5 != v6)
  {
    NSUInteger v12 = result;
    NSUInteger v23 = result;
    NSUInteger v24 = v6 + a2;
    v25.unint64_t location = 0;
    v25.NSUInteger length = 0;
    NSUInteger v13 = a2 + v5;
    uint64_t v22 = -v7;
    do
    {
      uint64_t v14 = objc_msgSend(*(id *)(v12 + 24), "pointerToElement:directlyAccessibleElements:", v13, &v25, v22);
      if (a4)
      {
        v15.unint64_t location = v25.location;
        v15.NSUInteger length = v13 - v25.location + 1;
        v25.NSUInteger length = v15.length;
      }
      else
      {
        v15.NSUInteger length = v25.location - v13 + v25.length;
        v25.unint64_t location = v13;
        v25.NSUInteger length = v15.length;
        v15.unint64_t location = v13;
      }
      v26.unint64_t location = a2;
      v26.NSUInteger length = a3;
      NSRange v16 = NSIntersectionRange(v15, v26);
      double result = v16.location;
      NSRange v25 = v16;
      if (v14) {
        BOOL v17 = v16.length == 0;
      }
      else {
        BOOL v17 = 1;
      }
      if (!v17)
      {
        if (a4) {
          NSUInteger length = -1;
        }
        else {
          NSUInteger length = v16.length;
        }
        if (v13 == length + v16.location)
        {
          NSUInteger v19 = v13;
        }
        else
        {
          uint64_t v20 = v14 + 16 * v13;
          NSUInteger v21 = v22 + v16.location + length;
          do
          {
            if (*(void *)(v20 - 16 * v25.location + 8)) {
              double result = (*(uint64_t (**)(uint64_t))(a5 + 16))(a5);
            }
            NSUInteger v19 = v13 + v7;
            v20 += 16 * v7;
            BOOL v17 = v21 == v13;
            v13 += v7;
          }
          while (!v17);
        }
        NSUInteger v13 = v19;
        NSUInteger v12 = v23;
      }
    }
    while (v13 != v24);
  }
  return result;
}

uint64_t __NSTextRunStorageGetElementIndexForTextLocation(uint64_t a1, void *a2, int a3)
{
  uint64_t v6 = [*(id *)(a1 + 24) count];
  uint64_t v7 = *(void **)(a1 + 32);
  if (v7)
  {
    if (objc_msgSend(a2, "compare:", objc_msgSend(v7, "location")) == -1)
    {
      unint64_t v10 = 0;
      uint64_t v6 = *(void *)(a1 + 48);
    }
    else
    {
      uint64_t v8 = objc_msgSend(a2, "compare:", objc_msgSend(*(id *)(a1 + 32), "endLocation"));
      unint64_t v9 = *(void *)(a1 + 48);
      if (v8 == -1) {
        return v9;
      }
      unint64_t v10 = v9 + 1;
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  int v31 = a3;
  if ((uint64_t)v10 >= v6)
  {
LABEL_43:
    if (v31) {
      return v10;
    }
    else {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  unint64_t v11 = 0;
  uint64_t v12 = 0;
  unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v30 = a2;
  while (1)
  {
    unint64_t v14 = v6 - v10;
    if (v6 >= (uint64_t)v10) {
      uint64_t v15 = v6 - v10;
    }
    else {
      uint64_t v15 = v14 + 1;
    }
    unint64_t v9 = v15 >> 1;
    unint64_t v32 = v13;
    unint64_t v33 = v11;
    BOOL v17 = v15 >> 1 >= v10;
    unint64_t v16 = (v15 >> 1) - v10;
    BOOL v17 = !v17 || v16 >= v14;
    if (v17)
    {
LABEL_25:
      unint64_t v32 = v13;
      unint64_t v33 = v11;
      if (v10 > v9 || v16 >= v14) {
        goto LABEL_43;
      }
      uint64_t v23 = -(uint64_t)v9;
      while (1)
      {
        if (!v12 || (unint64_t v24 = v9 - v13, v9 < v13) || v24 >= v33)
        {
          uint64_t v25 = objc_msgSend(*(id *)(a1 + 24), "pointerToElement:directlyAccessibleElements:", v9, &v32, v30);
          unint64_t v13 = v32;
          uint64_t v12 = v25 + 16 * (v23 + v32);
          unint64_t v24 = v9 - v32;
        }
        NSUInteger v21 = *(void **)(v12 + 16 * v24);
        if (v21) {
          break;
        }
        if (v10 <= v9 - 1)
        {
          unint64_t v26 = ~v10 + v9;
          ++v23;
          --v9;
          if (v26 < v14) {
            continue;
          }
        }
        goto LABEL_43;
      }
    }
    else
    {
      uint64_t v18 = -(uint64_t)v9;
      while (1)
      {
        if (!v12 || (unint64_t v19 = v9 - v13, v9 < v13) || v19 >= v33)
        {
          uint64_t v20 = objc_msgSend(*(id *)(a1 + 24), "pointerToElement:directlyAccessibleElements:", v9, &v32, v30);
          unint64_t v13 = v32;
          uint64_t v12 = v20 + 16 * (v18 + v32);
          unint64_t v19 = v9 - v32;
        }
        NSUInteger v21 = *(void **)(v12 + 16 * v19);
        if (v21) {
          break;
        }
        if (v10 <= ++v9)
        {
          --v18;
          if (v9 - v10 < v14) {
            continue;
          }
        }
        unint64_t v11 = v33;
        unint64_t v16 = v9 - v10;
        goto LABEL_25;
      }
    }
    unint64_t v11 = v33;
    double v27 = v30;
    if (objc_msgSend(v30, "compare:", objc_msgSend(v21, "location", v30)) == -1)
    {
      uint64_t v6 = v9;
      goto LABEL_42;
    }
    if (objc_msgSend(v27, "compare:", objc_msgSend(v21, "endLocation")) == -1) {
      break;
    }
    unint64_t v10 = v9;
LABEL_42:
    if ((uint64_t)v10 >= v6) {
      goto LABEL_43;
    }
  }
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x2B0], 8) = v9;
  *(void *)(a1 + 32) = v21;
  if (v31) {
    uint64_t v29 = v10;
  }
  else {
    uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    return v29;
  }
  return v9;
}

NSUInteger __NSTextRunStorageGetElementIndexForTextRange(NSUInteger a1, void *a2, char a3)
{
  uint64_t ElementIndexForTextLocation = __NSTextRunStorageGetElementIndexForTextLocation(a1, (void *)[a2 location], 1);
  uint64_t v7 = *(void **)(a1 + 24);
  if (ElementIndexForTextLocation != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = *(void **)[v7 elementAtIndex:ElementIndexForTextLocation];
    uint64_t v9 = objc_msgSend((id)objc_msgSend(a2, "location"), "compare:", objc_msgSend(v8, "location"));
    uint64_t v10 = objc_msgSend((id)objc_msgSend(a2, "endLocation"), "compare:", objc_msgSend(v8, "endLocation"));
    if (v10) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = v9 == 1;
    }
    if (!v11) {
      return ElementIndexForTextLocation;
    }
    uint64_t v12 = v10;
    if (v9 == 1)
    {
      unint64_t v13 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", [v8 location], objc_msgSend(a2, "location"));
      NSUInteger v14 = ElementIndexForTextLocation + 1;
    }
    else
    {
      if (!v10)
      {
        if ((a3 & 1) == 0) {
          return ElementIndexForTextLocation;
        }
        NSUInteger v18 = 1;
        NSUInteger v14 = ElementIndexForTextLocation;
        NSUInteger v15 = ElementIndexForTextLocation;
LABEL_34:
        __NSTextRunStorageReleaseElementContentsInRange(a1, v15, v18);
        objc_msgSend(*(id *)(a1 + 24), "removeElementsInRange:", v15, v18);
        return v14;
      }
      if (v10 == -1)
      {
        if (objc_msgSend((id)objc_msgSend(a2, "endLocation"), "compare:", objc_msgSend(v8, "location")) != 1) {
          goto LABEL_3;
        }
        unint64_t v13 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", [a2 endLocation], objc_msgSend(v8, "location"));
        NSUInteger v18 = 0;
        NSUInteger v15 = 0x7FFFFFFFFFFFFFFFLL;
        int v23 = 1;
        NSUInteger v14 = ElementIndexForTextLocation;
        if (v13) {
          goto LABEL_37;
        }
        goto LABEL_32;
      }
      unint64_t v13 = 0;
      NSUInteger v14 = ElementIndexForTextLocation;
    }
    NSUInteger v15 = 0x7FFFFFFFFFFFFFFFLL;
    if (v12 == 1)
    {
      uint64_t v16 = __NSTextRunStorageGetElementIndexForTextLocation(a1, (void *)[a2 endLocation], 1);
      BOOL v17 = *(void **)(a1 + 24);
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v16 = [v17 count];
      }
      else
      {
        uint64_t v20 = (id *)[v17 elementAtIndex:v16];
        id v21 = *v20;
        if (objc_msgSend((id)objc_msgSend(a2, "endLocation"), "compare:", objc_msgSend(*v20, "location")) == 1)
        {
          if (objc_msgSend((id)objc_msgSend(a2, "endLocation"), "compare:", objc_msgSend(v21, "endLocation")))
          {
            uint64_t v22 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", [a2 endLocation], objc_msgSend(v21, "endLocation"));

            *uint64_t v20 = v22;
          }
          else
          {
            ++v16;
          }
        }
      }
      NSUInteger v18 = v16 - v14;
      if ((uint64_t)(v16 - v14) >= 1)
      {
        if (a3)
        {
          int v23 = 0;
          NSUInteger v15 = v14;
          if (!v13) {
            goto LABEL_32;
          }
LABEL_37:
          unint64_t v24 = (id *)[*(id *)(a1 + 24) elementAtIndex:ElementIndexForTextLocation];

          *unint64_t v24 = v13;
          if ((v23 & 1) == 0)
          {
LABEL_33:
            if (!v18) {
              return v14;
            }
            goto LABEL_34;
          }
LABEL_38:
          uint64_t ElementIndexForTextLocation = v14;
          goto LABEL_3;
        }
        __NSTextRunStorageReleaseElementContentsInRange(a1, v14, v16 - v14);
        if (v18 >= 2) {
          objc_msgSend(*(id *)(a1 + 24), "removeElementsInRange:", v14 + 1, v16 - v14 - 1);
        }
        int v23 = 0;
        NSUInteger v18 = 0;
        NSUInteger v15 = 0x7FFFFFFFFFFFFFFFLL;
        if (v13) {
          goto LABEL_37;
        }
LABEL_32:
        if (!v23) {
          goto LABEL_33;
        }
        goto LABEL_38;
      }
      NSUInteger v18 = 0;
      NSUInteger v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      NSUInteger v18 = 0;
    }
    int v23 = 1;
    if (v13) {
      goto LABEL_37;
    }
    goto LABEL_32;
  }
  uint64_t ElementIndexForTextLocation = [v7 count];
LABEL_3:
  v25[0] = 0;
  v25[1] = 0;
  [*(id *)(a1 + 24) insertElements:v25 count:1 atIndex:ElementIndexForTextLocation];
  return ElementIndexForTextLocation;
}

uint64_t _moveLinesInLayoutManager(void *a1, uint64_t a2, uint64_t a3, int a4, double a5)
{
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  uint64_t result = [a1 isValidGlyphIndex:a2];
  if (result)
  {
    [a1 lineFragmentRectForGlyphAtIndex:a2 effectiveRange:&v36 withoutAdditionalLayout:1];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    [a1 lineFragmentUsedRectForGlyphAtIndex:a2 effectiveRange:0 withoutAdditionalLayout:1];
    uint64_t result = objc_msgSend(a1, "setLineFragmentRect:forGlyphRange:usedRect:", v36, v37, v12, v14 + a5, v16, v18, v20, v19 + a5, v21, v22);
  }
  if (a4)
  {
    uint64_t v23 = a2 + a3;
    uint64_t result = [a1 isValidGlyphIndex:v23];
    if (result)
    {
      [a1 lineFragmentRectForGlyphAtIndex:v23 effectiveRange:&v36 withoutAdditionalLayout:1];
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;
      [a1 lineFragmentUsedRectForGlyphAtIndex:v23 effectiveRange:0 withoutAdditionalLayout:1];
      return objc_msgSend(a1, "setLineFragmentRect:forGlyphRange:usedRect:", v36, v37, v25, v27 - a5, v29, v31, v33, v32 - a5, v34, v35);
    }
  }
  return result;
}

uint64_t _colorValForColor(void *a1)
{
  uint64_t v1 = (CGColor *)[a1 CGColor];
  if (!v1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v2 = v1;
  ColorSpace = CGColorGetColorSpace(v1);
  CFRetain(v2);
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1DC10];
  CFStringRef Name = CGColorSpaceGetName(ColorSpace);
  if (!CFEqual(v4, Name))
  {
    uint64_t v6 = CGColorSpaceCreateWithName(v4);
    CGColorRef CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v6, kCGRenderingIntentDefault, v2, 0);
    if (CopyByMatchingToColorSpace)
    {
      CGColorRef v8 = CopyByMatchingToColorSpace;
      CFRelease(v2);
      uint64_t v2 = v8;
    }
    CFRelease(v6);
  }
  if (CGColorGetNumberOfComponents(v2) >= 3 && (Components = (float64x2_t *)CGColorGetComponents(v2)) != 0)
  {
    unint64_t v10 = (unint64_t)&off_18E5F7000;
    LODWORD(v10) = vcvtmd_s64_f64(Components[1].f64[0] * 255.0 + 0.5);
    __asm { FMOV            V2.2D, #0.5 }
    int32x2_t v16 = vmovn_s64(vcvtq_s64_f64(vrndmq_f64(vmlaq_f64(_Q2, (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL), *Components))));
    v17.i64[0] = v16.u32[0];
    v17.i64[1] = v16.u32[1];
    int64x2_t v18 = (int64x2_t)vshlq_u64(v17, (uint64x2_t)xmmword_18E5F77B0);
    unint64_t v19 = vorrq_s8((int8x16_t)vdupq_laneq_s64(v18, 1), (int8x16_t)v18).u64[0] | v10;
  }
  else
  {
    unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  }
  CFRelease(v2);
  return v19;
}

void sub_18E5B3CB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E5B3DCC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E5B4088(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E5B42FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E5B4B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 192), 8);
  _Block_object_dispose((const void *)(v26 - 160), 8);
  _Block_object_dispose((const void *)(v26 - 128), 8);
  _Block_object_dispose((const void *)(v26 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_18E5B4E64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E5B80A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,int a53,int a54,uint64_t a55,void *a56,uint64_t a57,uint64_t a58,uint64_t a59)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    [a56 paragraphGlyphRange];
    NSLog((NSString *)@"%@: Exception %@ raised during typesetting layout manager %@, glyph range {%lu %lu}. Ignoring...");
    objc_end_catch();
    JUMPOUT(0x18E5B7B30);
  }
  _Unwind_Resume(exception_object);
}

uint64_t UINumberWithNibArchiveIndex(uint64_t a1)
{
  return [NSNumber numberWithUnsignedInt:a1];
}

__n128 UIRetainedIdentityKeyDictionaryCallbacks@<Q0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  __n128 result = *(__n128 *)(MEMORY[0x1E4F1D530] + 8);
  *(__n128 *)(a1 + _Block_object_dispose(&STACK[0x2B0], 8) = result;
  uint64_t v2 = MEMORY[0x1E4F1C220];
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 24) = v2;
  return result;
}

__n128 UIRetainedIdentityValueDictionaryCallbacks@<Q0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  __n128 result = *(__n128 *)(MEMORY[0x1E4F1D540] + 8);
  *(__n128 *)(a1 + _Block_object_dispose(&STACK[0x2B0], 8) = result;
  *(void *)(a1 + 24) = MEMORY[0x1E4F1C220];
  *(void *)(a1 + 32) = 0;
  return result;
}

__n128 UIRetainedIdentitySetCallbacks@<Q0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  __n128 result = *(__n128 *)(MEMORY[0x1E4F1D548] + 8);
  *(__n128 *)(a1 + _Block_object_dispose(&STACK[0x2B0], 8) = result;
  uint64_t v2 = MEMORY[0x1E4F1C220];
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 24) = v2;
  return result;
}

__n128 UIRetainedIdentityArrayCallbacks@<Q0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  __n128 result = *(__n128 *)(MEMORY[0x1E4F1D510] + 8);
  *(__n128 *)(a1 + _Block_object_dispose(&STACK[0x2B0], 8) = result;
  *(void *)(a1 + 24) = MEMORY[0x1E4F1C220];
  *(void *)(a1 + 32) = 0;
  return result;
}

__n128 UIRetainedValueUniquingSetCallbacks@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1 = MEMORY[0x1E4F1D548];
  *(void *)a1 = 0;
  __n128 result = *(__n128 *)(v1 + 8);
  *(__n128 *)(a1 + _Block_object_dispose(&STACK[0x2B0], 8) = result;
  *(void *)(a1 + 24) = MEMORY[0x1E4F1C220];
  *(void *)(a1 + 32) = UICFStrictBoolNumberEqual;
  *(void *)(a1 + 40) = MEMORY[0x1E4F1C240];
  return result;
}

uint64_t UICFStrictBoolNumberEqual(const void *a1, const void *a2)
{
  if ((const void *)*MEMORY[0x1E4F1CFD0] == a1 || *MEMORY[0x1E4F1CFD0] == (void)a2) {
    return a1 == a2;
  }
  if ((const void *)*MEMORY[0x1E4F1CFC8] == a1 || *MEMORY[0x1E4F1CFC8] == (void)a2) {
    return a1 == a2;
  }
  else {
    return CFEqual(a1, a2);
  }
}

void *UIAppendBytesForValueToData(void *result, uint64_t a2)
{
  switch(*(unsigned char *)(a2 + 20))
  {
    case 0:
      LOBYTE(v5) = *(void *)(a2 + 24);
      uint64_t v2 = 1;
      goto LABEL_8;
    case 1:
      LOWORD(v5) = *(void *)(a2 + 24);
      uint64_t v2 = 2;
      goto LABEL_8;
    case 2:
    case 0xA:
      LODWORD(v5) = *(void *)(a2 + 24);
      goto LABEL_7;
    case 3:
    case 7:
      uint64_t v5 = *(void *)(a2 + 24);
      uint64_t v2 = 8;
      goto LABEL_8;
    case 6:
      LODWORD(v5) = *(_DWORD *)(a2 + 24);
LABEL_7:
      uint64_t v2 = 4;
LABEL_8:
      __n128 result = (void *)[result appendBytes:&v5 length:v2];
      break;
    case 8:
      uint64_t v3 = *(void *)(a2 + 24);
      uint64_t v4 = *(void *)(a2 + 32);
      __n128 result = (void *)[result appendBytes:v3 length:v4];
      break;
    default:
      return result;
  }
  return result;
}

__CFArray *UICreateOrderedAndStrippedCoderValues(const __CFArray *a1, uint64_t a2)
{
  uint64_t Count = CFArrayGetCount(a1);
  if (Count >= 2)
  {
    CFIndex v5 = Count;
    Mutable = CFDictionaryCreateMutable(0, Count, 0, MEMORY[0x1E4F1D540]);
    for (CFIndex i = 0; i != v5; ++i)
    {
      ValueAtIndedouble x = CFArrayGetValueAtIndex(a1, i);
      CFDictionarySetValue(Mutable, ValueAtIndex, (const void *)[NSNumber numberWithInteger:i]);
    }
    MutableCopCGFloat y = CFArrayCreateMutableCopy(0, v5, a1);
    v15.unint64_t location = 0;
    v15.NSUInteger length = v5;
    CFArraySortValues(MutableCopy, v15, (CFComparatorFunction)UIOrderNibCoderValues, Mutable);
    CFRelease(Mutable);
    unint64_t v10 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    CFIndex v11 = 0;
    while (1)
    {
      double v12 = CFArrayGetValueAtIndex(MutableCopy, v11);
      if (*((_DWORD *)v12 + 4) != -1) {
        [v10 removeAllObjects];
      }
      if ([*((id *)v12 + 1) isEqual:a2]) {
        goto LABEL_11;
      }
      if (![v10 objectForKey:*((void *)v12 + 1)]) {
        break;
      }
      --v5;
      CFArrayRemoveValueAtIndex(MutableCopy, v11);
LABEL_12:
      if (v11 >= v5) {
        return MutableCopy;
      }
    }
    objc_msgSend(v10, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", v11), *((void *)v12 + 1));
LABEL_11:
    ++v11;
    goto LABEL_12;
  }

  return (__CFArray *)CFRetain(a1);
}

uint64_t UIOrderNibCoderValues(_DWORD *key, _DWORD *a2, CFDictionaryRef theDict)
{
  unsigned int v5 = key[4];
  unsigned int v6 = a2[4];
  if (v5 < v6) {
    uint64_t result = -1;
  }
  else {
    uint64_t result = 1;
  }
  if (v5 == v6)
  {
    uint64_t v9 = objc_msgSend((id)CFDictionaryGetValue(theDict, key), "integerValue");
    uint64_t v10 = objc_msgSend((id)CFDictionaryGetValue(theDict, a2), "integerValue");
    if (v9 < v10) {
      uint64_t v11 = -1;
    }
    else {
      uint64_t v11 = 1;
    }
    if (v9 == v10) {
      return 0;
    }
    else {
      return v11;
    }
  }
  return result;
}

void UIWriteArchiveToData(void *a1, int a2, void *a3, void *a4, const __CFArray *a5, uint64_t a6)
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA80] set];
  CFIndex Count = CFArrayGetCount(a5);
  if (Count >= 1)
  {
    CFIndex v9 = Count;
    for (CFIndex i = 0; i != v9; ++i)
      objc_msgSend(v7, "addObject:", *((void *)CFArrayGetValueAtIndex(a5, i) + 1));
  }
  CFArrayRef v90 = a5;
  uint64_t v11 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  double v95 = (void *)[MEMORY[0x1E4F1CA58] data];
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  obuint64_t j = v7;
  uint64_t v12 = [v7 countByEnumeratingWithState:&v117 objects:v127 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    uint64_t v15 = *(void *)v118;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v118 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64x2_t v17 = *(void **)(*((void *)&v117 + 1) + 8 * j);
        int64x2_t v18 = (const char *)[v17 UTF8String];
        unsigned int v19 = strlen(v18);
        UIAppendVInt32ToData(v95, v19);
        [v95 appendBytes:v18 length:v19];
        [v11 setObject:UINumberWithNibArchiveIndex(v14 + j) forKey:v17];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v117 objects:v127 count:16];
      uint64_t v14 = (v14 + j);
    }
    while (v13);
  }
  double v20 = UICreateOrderedAndStrippedCoderValues(v90, a6);
  double v86 = (void *)[MEMORY[0x1E4F1CA58] data];
  double v21 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  double v89 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v22 = UINumberWithNibArchiveIndex(0);
  NSUInteger v88 = v21;
  [v21 setObject:v22 forKey:UINumberWithNibArchiveIndex(0)];
  theArraCGFloat y = v20;
  CFIndex v23 = CFArrayGetCount(v20);
  if (v23 < 1)
  {
    uint64_t v25 = 0;
    uint64_t v26 = 0;
LABEL_22:
    uint64_t v35 = UINumberWithNibArchiveIndex(v26);
    [v89 setObject:v35 forKey:UINumberWithNibArchiveIndex(v25)];
    goto LABEL_23;
  }
  CFIndex v24 = v23;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  for (CFIndex k = 0; k != v24; ++k)
  {
    ValueAtIndedouble x = (unsigned int *)CFArrayGetValueAtIndex(v20, k);
    uint64_t v29 = ValueAtIndex[4];
    if (v29 < v25) {
      UIWriteArchiveToData_cold_1();
    }
    uint64_t v30 = (uint64_t)ValueAtIndex;
    if (v29 != v25)
    {
      uint64_t v31 = UINumberWithNibArchiveIndex(k);
      [v88 setObject:v31 forKey:UINumberWithNibArchiveIndex(v29)];
      uint64_t v32 = UINumberWithNibArchiveIndex(v26);
      [v89 setObject:v32 forKey:UINumberWithNibArchiveIndex(v25)];
      LODWORD(v26) = 0;
      uint64_t v25 = v29;
    }
    unsigned int v33 = UINibArchiveIndexFromNumber([v11 objectForKey:*(void *)(v30 + 8)]);
    int v34 = UIFixedByteLengthForType(*(char *)(v30 + 20));
    UIAppendVInt32ToData(v86, v33);
    LOBYTE(v121) = *(unsigned char *)(v30 + 20);
    [v86 appendBytes:&v121 length:1];
    if (v34 == -1) {
      UIAppendVInt32ToData(v86, [(id)v30 byteLength]);
    }
    UIAppendBytesForValueToData(v86, v30);
    uint64_t v26 = (v26 + 1);
  }
  if (v25 != -1) {
    goto LABEL_22;
  }
LABEL_23:
  uint64_t v36 = (void *)[MEMORY[0x1E4F1CA70] orderedSet];
  uint64_t v37 = objc_msgSend((id)objc_msgSend(a3, "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global_34);
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v113 objects:v126 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v114;
    do
    {
      for (uint64_t m = 0; m != v39; ++m)
      {
        if (*(void *)v114 != v40) {
          objc_enumerationMutation(v37);
        }
        objc_msgSend(v36, "addObject:", objc_msgSend(a3, "objectForKey:", *(void *)(*((void *)&v113 + 1) + 8 * m)));
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v113 objects:v126 count:16];
    }
    while (v39);
  }
  NSUInteger v42 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  int v43 = objc_msgSend((id)objc_msgSend(a4, "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global_10_0);
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v109 objects:v125 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v110;
    do
    {
      for (uint64_t n = 0; n != v45; ++n)
      {
        if (*(void *)v110 != v46) {
          objc_enumerationMutation(v43);
        }
        objc_msgSend(v36, "addObjectsFromArray:", objc_msgSend(a4, "objectForKey:", *(void *)(*((void *)&v109 + 1) + 8 * n)));
      }
      uint64_t v45 = [v43 countByEnumeratingWithState:&v109 objects:v125 count:16];
    }
    while (v45);
  }
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  uint64_t v48 = [v36 countByEnumeratingWithState:&v105 objects:v124 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = 0;
    uint64_t v51 = *(void *)v106;
    do
    {
      for (iCFIndex i = 0; ii != v49; ++ii)
      {
        if (*(void *)v106 != v51) {
          objc_enumerationMutation(v36);
        }
        [v42 setObject:UINumberWithNibArchiveIndex(v50 + ii) forKey:*(void *)(*((void *)&v105 + 1) + 8 * ii)];
      }
      uint64_t v49 = [v36 countByEnumeratingWithState:&v105 objects:v124 count:16];
      uint64_t v50 = (v50 + ii);
    }
    while (v49);
  }
  NSRange v53 = (void *)[MEMORY[0x1E4F1CA58] data];
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v91 = v36;
  uint64_t v54 = [v36 countByEnumeratingWithState:&v101 objects:v123 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v94 = *(void *)v102;
    do
    {
      for (juint64_t j = 0; jj != v55; ++jj)
      {
        if (*(void *)v102 != v94) {
          objc_enumerationMutation(v91);
        }
        NSUInteger v57 = *(void **)(*((void *)&v101 + 1) + 8 * jj);
        double v58 = (void *)[a4 objectForKey:v57];
        NSUInteger v59 = (const char *)[v57 UTF8String];
        unsigned int v60 = strlen(v59);
        unsigned int v61 = [v58 count];
        UIAppendVInt32ToData(v53, v60 + 1);
        UIAppendVInt32ToData(v53, v61);
        long long v99 = 0u;
        long long v100 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        uint64_t v62 = [v58 countByEnumeratingWithState:&v97 objects:v122 count:16];
        if (v62)
        {
          uint64_t v63 = v62;
          uint64_t v64 = *(void *)v98;
          do
          {
            for (kCFIndex k = 0; kk != v63; ++kk)
            {
              if (*(void *)v98 != v64) {
                objc_enumerationMutation(v58);
              }
              int v121 = UINibArchiveIndexFromNumber(objc_msgSend(v42, "objectForKey:", *(void *)(*((void *)&v97 + 1)
                                                                                              + 8 * kk)));
              [v53 appendBytes:&v121 length:4];
            }
            uint64_t v63 = [v58 countByEnumeratingWithState:&v97 objects:v122 count:16];
          }
          while (v63);
        }
        [v53 appendBytes:v59 length:v60];
        LOBYTE(v121) = 0;
        [v53 appendBytes:&v121 length:1];
      }
      uint64_t v55 = [v91 countByEnumeratingWithState:&v101 objects:v123 count:16];
    }
    while (v55);
  }
  unint64_t v66 = (void *)[MEMORY[0x1E4F1CA58] data];
  uint64_t v67 = [a3 count];
  if (v67 >= 1)
  {
    uint64_t v68 = v67;
    for (muint64_t m = 0; mm != v68; ++mm)
    {
      uint64_t v70 = [NSNumber numberWithInteger:mm];
      uint64_t v71 = [a3 objectForKey:v70];
      if (!v71) {
        UIWriteArchiveToData_cold_2();
      }
      uint64_t v72 = [v42 objectForKey:v71];
      uint64_t v73 = [v88 objectForKey:v70];
      uint64_t v74 = [v89 objectForKey:v70];
      if (!v72 || ((uint64_t v75 = v74, v73) ? (v76 = v74 == 0) : (v76 = 0), v76)) {
        UIWriteArchiveToData_cold_3();
      }
      unsigned int v77 = UINibArchiveIndexFromNumber(v72);
      UIAppendVInt32ToData(v66, v77);
      if (v73) {
        unsigned int v78 = UINibArchiveIndexFromNumber(v73);
      }
      else {
        unsigned int v78 = 0;
      }
      UIAppendVInt32ToData(v66, v78);
      if (v75) {
        unsigned int v79 = UINibArchiveIndexFromNumber(v75);
      }
      else {
        unsigned int v79 = 0;
      }
      UIAppendVInt32ToData(v66, v79);
    }
  }
  [a1 appendBytes:"NIBArchive" length:10];
  int v121 = a2;
  [a1 appendBytes:&v121 length:4];
  int v121 = 10;
  [a1 appendBytes:&v121 length:4];
  int v121 = [a3 count];
  [a1 appendBytes:&v121 length:4];
  int v121 = 50;
  [a1 appendBytes:&v121 length:4];
  int v121 = [obj count];
  [a1 appendBytes:&v121 length:4];
  int v121 = [v66 length] + 50;
  [a1 appendBytes:&v121 length:4];
  int v121 = CFArrayGetCount(theArray);
  [a1 appendBytes:&v121 length:4];
  int v80 = [v66 length];
  int v121 = v80 + [v95 length] + 50;
  [a1 appendBytes:&v121 length:4];
  int v121 = [v91 count];
  [a1 appendBytes:&v121 length:4];
  int v81 = [v66 length];
  int v82 = v81 + [v95 length];
  int v121 = v82 + [v86 length] + 50;
  [a1 appendBytes:&v121 length:4];
  [a1 appendData:v66];
  [a1 appendData:v95];
  [a1 appendData:v86];
  [a1 appendData:v53];
  CFRelease(theArray);
}

uint64_t __UIWriteArchiveToData_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3 != 0 && a2 == 0) {
    uint64_t result = -1;
  }
  else {
    uint64_t result = 1;
  }
  if ((a2 != 0) == (a3 != 0)) {
    return objc_msgSend(a2, "compare:");
  }
  return result;
}

uint64_t __UIWriteArchiveToData_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void sub_18E5BB90C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class initNSImage()
{
  __NSGetFrameworkReference(0, 0);
  Class result = objc_getClass("NSImage");
  classNSImage = (uint64_t)result;
  if (!result) {
    initNSImage_cold_1();
  }
  getNSImageClass Class = (uint64_t)NSImageFunction;
  return result;
}

uint64_t NSImageFunction()
{
  return classNSImage;
}

uint64_t initUIImagePNGRepresentation(uint64_t a1)
{
  uint64_t v2 = (void *)__NSGetFrameworkReference(0, 0);
  uint64_t v3 = (uint64_t (*)())dlsym(v2, "UIImagePNGRepresentation");
  softLinkUIImagePNGRepresentation[0] = v3;
  if (!v3) {
    initUIImagePNGRepresentation_cold_1();
  }

  return ((uint64_t (*)(uint64_t))v3)(a1);
}

Class initNSTextAttachmentView()
{
  __NSGetFrameworkReference(0, 0);
  Class result = objc_getClass("NSTextAttachmentView");
  classNSTextAttachmentView = (uint64_t)result;
  if (!result) {
    initNSTextAttachmentView_cold_1();
  }
  getNSTextAttachmentViewClass Class = (uint64_t)NSTextAttachmentViewFunction;
  return result;
}

uint64_t NSTextAttachmentViewFunction()
{
  return classNSTextAttachmentView;
}

Class initUITextAttachmentView()
{
  __NSGetFrameworkReference(0, 0);
  Class result = objc_getClass("UITextAttachmentView");
  classUITextAttachmentView = (uint64_t)result;
  if (!result) {
    initUITextAttachmentView_cold_1();
  }
  getUITextAttachmentViewClass Class = UITextAttachmentViewFunction;
  return result;
}

uint64_t UITextAttachmentViewFunction()
{
  return classUITextAttachmentView;
}

uint64_t init_UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection(uint64_t a1)
{
  uint64_t v2 = (void *)__NSGetFrameworkReference(0, 0);
  uint64_t v3 = (uint64_t (*)())dlsym(v2, "_UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection");
  softLink_UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollectiouint64_t n = v3;
  if (!v3) {
    init_UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection_cold_1();
  }

  return ((uint64_t (*)(uint64_t))v3)(a1);
}

void _CFDictionaryApplyBlock(const __CFDictionary *a1, void *a2)
{
  id context = a2;
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)keyValueBlockApplier, &context);
}

uint64_t keyValueBlockApplier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)a3 + 16))();
}

void _CFArrayApplyBlock(const __CFArray *a1, CFIndex a2, CFIndex a3, void *a4)
{
  id context = a4;
  v8.unint64_t location = a2;
  v8.NSUInteger length = a3;
  CFArrayApplyFunction(a1, v8, (CFArrayApplierFunction)valueBlockApplier, &context);
}

uint64_t valueBlockApplier(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)a2 + 16))();
}

void _CFSetApplyBlock(const __CFSet *a1, void *a2)
{
  id context = a2;
  CFSetApplyFunction(a1, (CFSetApplierFunction)valueBlockApplier, &context);
}

uint64_t _rtfWhiteColor()
{
  if (onceToken != -1) {
    dispatch_once(&onceToken, &__block_literal_global_36);
  }
  return _white;
}

id initRTFColors()
{
  _white = (uint64_t)(id)[(Class)getNSColorClass_3[0]() colorWithCalibratedWhite:1.0 alpha:1.0];
  id result = (id)[(Class)getNSColorClass_3[0]() colorWithCalibratedWhite:0.0 alpha:1.0];
  _blacCFIndex k = (uint64_t)result;
  return result;
}

uint64_t _rtfBlackColor()
{
  if (onceToken != -1) {
    dispatch_once(&onceToken, &__block_literal_global_2_0);
  }
  return _black;
}

uint64_t rtfDataFromFileWrapper(void *a1)
{
  uint64_t v1 = (void *)[a1 fileWrappers];
  uint64_t v2 = (void *)[v1 objectForKey:@"TXT.rtf"];
  if (!v2) {
    uint64_t v2 = (void *)[v1 objectForKey:@"index.rtf"];
  }
  if (![v2 isRegularFile]) {
    return 0;
  }

  return [v2 regularFileContents];
}

uint64_t cachedRTFFontHash(uint64_t a1, uint64_t a2)
{
  return ((*(unsigned __int8 *)(a2 + 16) + 13 * (*(unsigned __int8 *)(a2 + 17) + 13 * (uint64_t)*(double *)(a2 + 8))) ^ *(__int16 *)(a2 + 18))
       + *(void *)a2;
}

BOOL cachedRTFFontIsEqual(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return *(void *)a2 == *(void *)a3
      && *(unsigned __int8 *)(a2 + 16) == *(unsigned __int8 *)(a3 + 16)
      && *(unsigned __int8 *)(a2 + 17) == *(unsigned __int8 *)(a3 + 17)
      && *(double *)(a2 + 8) == *(double *)(a3 + 8)
      && *(unsigned __int16 *)(a2 + 18) == *(unsigned __int16 *)(a3 + 18);
}

void cachedRTFFontFree(uint64_t a1, void *a2)
{
  uint64_t v3 = (NSZone *)MEMORY[0x192FADFB0](a2);

  NSZoneFree(v3, a2);
}

uint64_t raiseRTFException(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", NSRTFException, objc_msgSend(NSString, "stringWithUTF8String:", a1), 0);

  return [v1 raise];
}

uint64_t unknownClass(uint64_t result)
{
  if (*(_DWORD *)(result + 2800) == 2)
  {
    uint64_t v1 = result + 536;
    _NSRTFSkipGroup((_DWORD *)(result + 536));
    return _NSRTFRouteToken(v1);
  }
  return result;
}

void textClass(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 2808)) {
    flushCharacters(a1, 1);
  }
  char v2 = *(_DWORD *)(a1 + 2768);
  uint64_t v3 = *(void *)(a1 + 328);
  *(void *)(a1 + 32_Block_object_dispose(&STACK[0x2B0], 8) = v3 + 1;
  *(unsigned char *)(a1 + v3 + 72) = v2;
  if (*(void *)(a1 + 328) >= 0x80uLL)
  {
    flushCharacters(a1, 0);
  }
}

void controlClass(uint64_t a1)
{
  uint64_t v347 = *MEMORY[0x1E4F143B8];
  flushCharacters(a1, 1);
  switch(*(_DWORD *)(a1 + 2768))
  {
    case 0:
      *(_DWORD *)(a1 + 336) = *(_DWORD *)(a1 + 2776) != 0;
      return;
    case 2:
      int v3 = *(_DWORD *)(a1 + 2772);
      if (v3 == 4)
      {
        CFStringEncoding v73 = CFStringConvertWindowsCodepageToEncoding(*(_DWORD *)(a1 + 2776));
        *(_DWORD *)(a1 + 36_Block_object_dispose(&STACK[0x2B0], 8) = v73;
        *(_DWORD *)(a1 + 360) = v73;
        if (CFStringIsEncodingAvailable(v73))
        {
LABEL_137:
          *(unsigned char *)(a1 + 2809) = 1;
          return;
        }
LABEL_136:
        CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
        *(_DWORD *)(a1 + 36_Block_object_dispose(&STACK[0x2B0], 8) = SystemEncoding;
        *(_DWORD *)(a1 + 360) = SystemEncoding;
        goto LABEL_137;
      }
      if (v3 == 1) {
        goto LABEL_136;
      }
      if (!v3 && *(_DWORD *)(a1 + 336))
      {
        *(_DWORD *)(a1 + 36_Block_object_dispose(&STACK[0x2B0], 8) = 1280;
        *(_DWORD *)(a1 + 360) = 1280;
        return;
      }
      *(_DWORD *)(a1 + 36_Block_object_dispose(&STACK[0x2B0], 8) = 2817;
      *(_DWORD *)(a1 + 360) = 2817;
      int v68 = *(_DWORD *)(a1 + 340);
      if (v68 == -1)
      {
        *(_DWORD *)(a1 + 340) = 1;
        *(void *)(a1 + 520) = 0;
      }
      else
      {
LABEL_129:
        if (v68 < 1) {
          return;
        }
        *(void *)(a1 + 520) = 0;
        if (v68 > 0x482) {
          return;
        }
      }
      int v77 = 1;
LABEL_148:
      *(_DWORD *)(a1 + 352) = v77;
      return;
    case 3:
      unint64_t v4 = *(void *)(a1 + 560);
      int v5 = *(_DWORD *)(a1 + 2772);
      switch(v5)
      {
        case 'A':
        case 'C':
          return;
        case 'B':
          char v6 = 0;
          uint64_t v7 = 0;
          double v335 = 0.0;
          v336 = &v335;
          uint64_t v337 = 0x2020000000;
          v338 = bytes;
          uint64_t v331 = 0;
          v332 = &v331;
          uint64_t v333 = 0x2020000000;
          uint64_t v334 = 1000;
          uint64_t v327 = 0;
          v328 = &v327;
          uint64_t v329 = 0x2020000000;
          uint64_t v330 = 0;
          __endptr[0] = (char *)MEMORY[0x1E4F143A8];
          __endptr[1] = (char *)3221225472;
          v340 = (uint64_t (*)(char **))__readFieldInst_block_invoke;
          v341 = &unk_1E55C8330;
          v342 = &v331;
          v343 = &v335;
          uint64_t v8 = 1;
          v344 = &v327;
          unint64_t v9 = 0x1E4F1C000uLL;
          uint64_t v10 = MEMORY[0x1E4F14390];
          while (2)
          {
            if (_NSRTFGetToken((_DWORD *)(a1 + 536)) == 4)
            {
LABEL_307:
              BOOL v129 = (UInt8 *)*((void *)v336 + 3);
              if (v129 != bytes) {
                free(v129);
              }
              _NSRTFRouteToken(a1 + 536);
              if (v7) {
                objc_msgSend((id)objc_msgSend((id)a1, "mutableAttributes"), "setObject:forKey:", v7, @"NSLink");
              }
              _Block_object_dispose(&v327, 8);
              _Block_object_dispose(&v331, 8);
              _Block_object_dispose(&v335, 8);
              return;
            }
            if (v6)
            {
LABEL_12:
              char v6 = 1;
LABEL_13:
              int v11 = *(_DWORD *)(a1 + 2764);
LABEL_31:
              if (v11 == 1)
              {
                int v16 = *(_DWORD *)(a1 + 2768);
                if (v16 != 1)
                {
                  if (!v16) {
                    ++v8;
                  }
                  continue;
                }
                BOOL v32 = v8-- <= 1;
                if (v32) {
                  goto LABEL_307;
                }
              }
              continue;
            }
            break;
          }
          int v11 = *(_DWORD *)(a1 + 2764);
          if (v11 != 2)
          {
LABEL_30:
            char v6 = 0;
            goto LABEL_31;
          }
          uint64_t v12 = v328;
          uint64_t v13 = v328[3];
          while (1)
          {
            if (v13 == v332[3])
            {
              if (!v340(__endptr))
              {
                char v6 = 0;
                goto LABEL_13;
              }
              uint64_t v12 = v328;
              uint64_t v13 = v328[3];
            }
            uint64_t v14 = *(unsigned int *)(a1 + 2768);
            if (!v13)
            {
              if (v14 > 0x7F)
              {
                if (__maskrune(v14, 0x4000uLL)) {
                  goto LABEL_21;
                }
              }
              else if ((*(_DWORD *)(v10 + 4 * v14 + 60) & 0x4000) != 0)
              {
                goto LABEL_21;
              }
              LODWORD(v14) = *(_DWORD *)(a1 + 2768);
              uint64_t v12 = v328;
              uint64_t v13 = v328[3];
            }
            uint64_t v15 = *((void *)v336 + 3);
            v12[3] = v13 + 1;
            *(unsigned char *)(v15 + v13) = v14;
LABEL_21:
            _NSRTFGetToken((_DWORD *)(a1 + 536));
            uint64_t v12 = v328;
            uint64_t v13 = v328[3];
            if (v13 == 9 && !strncmp(*((const char **)v336 + 3), "HYPERLINK", 9uLL))
            {
              v12[3] = 0;
              while (1)
              {
                uint64x2_t v17 = v328;
                if (*(_DWORD *)(a1 + 2764) != 2) {
                  break;
                }
                uint64_t v18 = v328[3];
                if (v18 == v332[3])
                {
                  int v19 = v340(__endptr);
                  uint64x2_t v17 = v328;
                  if (!v19) {
                    break;
                  }
                  uint64_t v18 = v328[3];
                }
                int v20 = *(_DWORD *)(a1 + 2768);
                uint64_t v21 = *((void *)v336 + 3);
                v17[3] = v18 + 1;
                *(unsigned char *)(v21 + v1_Block_object_dispose(&STACK[0x2B0], 8) = v20;
                _NSRTFGetToken((_DWORD *)(a1 + 536));
              }
              unint64_t v22 = v17[3];
              if (v22)
              {
                unint64_t v23 = 0;
                while (1)
                {
                  uint64_t v24 = *(unsigned __int8 *)(*((void *)v336 + 3) + v23);
                  if (*(char *)(*((void *)v336 + 3) + v23) < 0)
                  {
                    int v25 = __maskrune(v24, 0x4000uLL);
                    uint64x2_t v17 = v328;
                  }
                  else
                  {
                    int v25 = *(_DWORD *)(v10 + 4 * v24 + 60) & 0x4000;
                  }
                  if (!v25) {
                    break;
                  }
                  ++v23;
                  unint64_t v22 = v17[3];
                  if (v23 >= v22) {
                    goto LABEL_52;
                  }
                }
                unint64_t v22 = v17[3];
LABEL_52:
                if (v22 > v23)
                {
                  id v325 = (id)v7;
                  uint64_t v26 = v8;
                  unint64_t v27 = v9;
                  while (1)
                  {
                    unint64_t v28 = v22 - 1;
                    int v29 = *(char *)(*((void *)v336 + 3) + v22 - 1);
                    if (v29 < 0)
                    {
                      int v30 = __maskrune(v29, 0x4000uLL);
                      uint64_t v31 = v328;
                    }
                    else
                    {
                      int v30 = *(_DWORD *)(v10 + 4 * v29 + 60) & 0x4000;
                      uint64_t v31 = v17;
                    }
                    if (!v30) {
                      break;
                    }
                    v17[3] = v28;
                    unint64_t v22 = v31[3];
                    uint64x2_t v17 = v31;
                    if (v22 <= v23) {
                      goto LABEL_64;
                    }
                  }
                  unint64_t v22 = v31[3];
LABEL_64:
                  uint64x2_t v17 = v31;
                  unint64_t v9 = v27;
                  uint64_t v8 = v26;
                  uint64_t v7 = (uint64_t)v325;
                }
              }
              else
              {
                unint64_t v23 = 0;
              }
              unint64_t v33 = v22 - 1;
              if (v22 - 1 > v23
                && (uint64_t v34 = *((void *)v336 + 3), *(unsigned char *)(v34 + v23) == 34)
                && *(unsigned char *)(v34 + v33) == 34)
              {
                v17[3] = v33;
                ++v23;
              }
              else
              {
                unint64_t v33 = v22;
              }
              CFStringEncoding v35 = *(_DWORD *)(a1 + 372);
              if (v35 == -1) {
                CFStringEncoding v35 = *(_DWORD *)(a1 + 360);
              }
              CFStringRef v36 = CFStringCreateWithBytes(0, (const UInt8 *)(*((void *)v336 + 3) + v23), v33 - v23, v35, 0);
              uint64_t v37 = (id)CFMakeCollectable(v36);
              uint64_t v38 = v37;
              if (v37)
              {
                if ([v37 length] && v7 == 0) {
                  uint64_t v7 = [*(id *)(v9 + 2832) URLWithString:v38];
                }
              }
              goto LABEL_12;
            }
            int v11 = *(_DWORD *)(a1 + 2764);
            if (v11 != 2) {
              goto LABEL_30;
            }
          }
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
        case 'K':
        case 'M':
        case 'N':
        case 'U':
        case 'V':
        case '[':
LABEL_312:
          uint64_t v113 = a1 + 536;
          int v130 = *(_DWORD *)(a1 + 340);
          if (v130 == -1)
          {
            *(_DWORD *)(a1 + 340) = 0;
          }
          else if (v130 >= 1)
          {
            *(void *)(a1 + 520) = 0;
            if (v130 <= 0x482) {
              *(_DWORD *)(a1 + 352) = 1;
            }
          }
          _NSRTFSkipGroup((_DWORD *)(a1 + 536));
          goto LABEL_660;
        case 'I':
          uint64_t v101 = a1;
          int v102 = 0;
          goto LABEL_233;
        case 'J':
          long long v103 = (_DWORD *)(a1 + 536);
          _NSRTFSkipGroup(v103);
          uint64_t v104 = (uint64_t)v103;
          goto LABEL_661;
        case 'L':
          uint64_t v101 = a1;
          int v102 = 1;
LABEL_233:
          readNeXTGraphic(v101, v102);
          return;
        case 'O':
          uint64_t v105 = *(int *)(a1 + 2776);
          _NSRTFGetToken((_DWORD *)(a1 + 536));
          if (*(_DWORD *)(a1 + 2764) == 2)
          {
            CFIndex v106 = 0;
            do
            {
              unint64_t v107 = v106++;
              bytes[v107] = *(_DWORD *)(a1 + 2768);
              _NSRTFGetToken((_DWORD *)(a1 + 536));
            }
            while (v107 <= 0x18E && *(_DWORD *)(a1 + 2764) == 2);
          }
          else
          {
            CFIndex v106 = 0;
          }
          CFStringRef v211 = CFStringCreateWithBytes(0, bytes, v106, 0x8000100u, 0);
          v212 = (void *)CFMakeCollectable(v211);
          int v213 = *(_DWORD *)(a1 + 2764);
          if (v213 != 3)
          {
            v241 = 0;
            uint64_t v216 = -1;
            goto LABEL_572;
          }
          if (*(_DWORD *)(a1 + 2768) != 12)
          {
            v241 = 0;
            uint64_t v216 = -1;
            goto LABEL_888;
          }
          int v214 = *(_DWORD *)(a1 + 2772);
          if (v214 == 42)
          {
            if (*(_DWORD *)(a1 + 2776) == -1000000) {
              int v215 = -1;
            }
            else {
              int v215 = *(_DWORD *)(a1 + 2776);
            }
            _NSRTFGetToken((_DWORD *)(a1 + 536));
            uint64_t v216 = v215;
            int v213 = *(_DWORD *)(a1 + 2764);
            if (v213 != 3)
            {
              v241 = 0;
              goto LABEL_572;
            }
            if (*(_DWORD *)(a1 + 2768) != 12) {
              goto LABEL_887;
            }
            int v214 = *(_DWORD *)(a1 + 2772);
          }
          else
          {
            uint64_t v216 = -1;
          }
          if (v214 == 43)
          {
            _NSRTFGetToken((_DWORD *)(a1 + 536));
            if (*(_DWORD *)(a1 + 2764) == 2)
            {
              unint64_t v309 = 0;
              do
              {
                bytes[v309] = *(_DWORD *)(a1 + 2768);
                _NSRTFGetToken((_DWORD *)(a1 + 536));
                CFIndex v310 = v309 + 1;
                if (v309 > 0x18E) {
                  break;
                }
                ++v309;
              }
              while (*(_DWORD *)(a1 + 2764) == 2);
            }
            else
            {
              CFIndex v310 = 0;
            }
            CFStringRef v324 = CFStringCreateWithBytes(0, bytes, v310, 0x8000100u, 0);
            v241 = (void *)CFMakeCollectable(v324);
            int v213 = *(_DWORD *)(a1 + 2764);
LABEL_572:
            if (v213 == 1 && *(_DWORD *)(a1 + 2768) == 1)
            {
LABEL_889:
              _NSRTFRouteToken(a1 + 536);
              if (v241)
              {
                [(id)a1 _updateAttributes];
                uint64_t v311 = objc_msgSend((id)objc_msgSend((id)a1, "mutableAttributes"), "objectForKey:", @"NSFont");
                if (v311)
                {
                  v312 = +[NSGlyphInfo glyphInfoWithGlyphName:v241 forFont:v311 baseString:v212];
                  goto LABEL_896;
                }
LABEL_898:

                return;
              }
              if (v216 == -1)
              {
                [(id)a1 _updateAttributes];
                uint64_t v313 = objc_msgSend((id)objc_msgSend((id)a1, "mutableAttributes"), "objectForKey:", @"NSFont");
                if (!v313) {
                  goto LABEL_898;
                }
                v312 = +[NSGlyphInfo glyphInfoWithGlyph:v105 forFont:v313 baseString:v212];
              }
              else
              {
                v312 = +[NSGlyphInfo glyphInfoWithCharacterIdentifier:v105 collection:v216 baseString:v212];
              }
LABEL_896:
              v314 = v312;
              if (v312)
              {
                v315 = (void *)[(id)a1 mutableAttributes];
                [v315 setObject:v314 forKey:NSGlyphInfoAttributeName];
              }
              goto LABEL_898;
            }
LABEL_888:
            _NSRTFSkipGroup((_DWORD *)(a1 + 536));
            goto LABEL_889;
          }
LABEL_887:
          v241 = 0;
          goto LABEL_888;
        case 'P':
          if (_NSRTFGetToken((_DWORD *)(a1 + 536)) == 4)
          {
            _NSRTFRouteToken(a1 + 536);
            return;
          }
          uint64_t v217 = 0;
          unint64_t v218 = 0;
          int v219 = 0;
          BOOL v220 = 0;
          int v221 = 0;
          char v222 = 0;
          uint64_t v223 = 1;
          while (1)
          {
            if ((v222 & 1) == 0) {
              goto LABEL_478;
            }
            if (*(_DWORD *)(a1 + 2764) != 2 || v218 > 0x18E) {
              break;
            }
            bytes[v218++] = *(_DWORD *)(a1 + 2768);
            char v222 = 1;
LABEL_479:
            int v225 = *(_DWORD *)(a1 + 2764);
            if (v225 == 1)
            {
              int v226 = *(_DWORD *)(a1 + 2768);
              if (v226 == 1)
              {
                if (v223 < 2) {
                  goto LABEL_575;
                }
                --v223;
              }
              else if (!v226)
              {
                ++v223;
              }
            }
            else if (!v217 && v225 == 3 && *(_DWORD *)(a1 + 2768) == 26)
            {
              int v227 = *(_DWORD *)(a1 + 2772);
              switch(v227)
              {
                case 'R':
                  int v221 = 0;
                  unint64_t v218 = 0;
                  char v222 = 1;
                  break;
                case 'T':
                  int v219 = 1;
                  break;
                case 'S':
                  unint64_t v218 = 0;
                  char v222 = 1;
                  int v221 = 1;
                  break;
              }
            }
            if (_NSRTFGetToken((_DWORD *)(a1 + 536)) == 4)
            {
LABEL_575:
              _NSRTFRouteToken(a1 + 536);
              if (v217) {
                [(id)a1 setBackgroundColor:v217];
              }
              return;
            }
          }
          if (v218 - 1 <= 0x18E)
          {
            bytes[v218] = 0;
            if (v221 & v220 & v219)
            {
              __endptr[0] = 0;
              uint64_t v224 = strtol((const char *)bytes, __endptr, 10);
              if ((UInt8 *)__endptr[0] == &bytes[v218]) {
                uint64_t v217 = colorFromRTFRGB(a1, v224, BYTE1(v224), BYTE2(v224));
              }
            }
            char v222 = 0;
            BOOL v220 = (v221 & 1) == 0 && *(void *)bytes == 0x6F6C6F436C6C6966 && v346 == 114;
            goto LABEL_479;
          }
LABEL_478:
          char v222 = 0;
          goto LABEL_479;
        case 'Q':
          uint64_t v108 = objc_msgSend((id)objc_msgSend((id)a1, "attributedStringToEndOfGroup"), "string");
          if (!v108) {
            return;
          }
          uint64_t v70 = v108;
          uint64_t v71 = (void *)-[NSRTFReader _documentInfoDictionary](a1);
          uint64_t v72 = &NSCompanyDocumentAttribute;
          goto LABEL_329;
        case 'R':
          uint64_t v109 = objc_msgSend((id)objc_msgSend((id)a1, "attributedStringToEndOfGroup"), "string");
          if (!v109) {
            return;
          }
          uint64_t v70 = v109;
          uint64_t v71 = (void *)-[NSRTFReader _documentInfoDictionary](a1);
          uint64_t v72 = &NSManagerDocumentAttribute;
          goto LABEL_329;
        case 'S':
          uint64_t Date = readDate(a1);
          if (!Date) {
            return;
          }
          uint64_t v70 = Date;
          uint64_t v71 = (void *)-[NSRTFReader _documentInfoDictionary](a1);
          uint64_t v72 = &NSCreationTimeDocumentAttribute;
          goto LABEL_329;
        case 'T':
          uint64_t v111 = readDate(a1);
          if (!v111) {
            return;
          }
          uint64_t v70 = v111;
          uint64_t v71 = (void *)-[NSRTFReader _documentInfoDictionary](a1);
          uint64_t v72 = &NSModificationTimeDocumentAttribute;
          goto LABEL_329;
        case 'W':
          long long v112 = (void *)[MEMORY[0x1E4F1CA48] array];
          if (_NSRTFGetToken((_DWORD *)(a1 + 536)) == 4) {
            goto LABEL_252;
          }
          char v229 = 0;
          v230 = 0;
          uint64_t v231 = 0;
          uint64_t v232 = -1;
          uint64_t v233 = 1;
          uint64_t v234 = 1;
          break;
        case 'X':
          uint64_t v113 = a1 + 536;
          if (_NSRTFGetToken((_DWORD *)(a1 + 536)) == 4) {
            goto LABEL_280;
          }
          uint64_t v114 = 0;
          uint64_t v115 = 0;
          uint64_t v116 = 1;
          do
          {
            int v117 = *(_DWORD *)(a1 + 2764);
            if (v117 == 1)
            {
              int v120 = *(_DWORD *)(a1 + 2768);
              if (v120 == 1)
              {
                if (v116 == 2)
                {
                  if (v115 && v114)
                  {
                    [(id)a1 _addOverride:v114 forKey:v115];
                    uint64_t v115 = 0;
                    uint64_t v114 = 0;
                  }
                  uint64_t v116 = 1;
                }
                else
                {
                  BOOL v32 = v116-- < 2;
                  if (v32) {
                    break;
                  }
                }
              }
              else if (!v120)
              {
                ++v116;
              }
            }
            else if (v117 == 3)
            {
              int v118 = *(_DWORD *)(a1 + 2768);
              if (v118 == 11)
              {
                if (*(_DWORD *)(a1 + 2772) == 110) {
                  uint64_t v114 = *(int *)(a1 + 2776);
                }
              }
              else if (v118 == 28)
              {
                int v119 = *(_DWORD *)(a1 + 2772);
                if (v119 == 18)
                {
                  if (v115 != 0 && v114 != 0)
                  {
                    uint64_t v115 = 0;
                    uint64_t v114 = 0;
                  }
                }
                else if (v119 == 17)
                {
                  uint64_t v115 = *(int *)(a1 + 2776);
                }
              }
            }
          }
          while (_NSRTFGetToken((_DWORD *)(a1 + 536)) != 4);
LABEL_280:
          *(void *)(a1 + 56_Block_object_dispose(&STACK[0x2B0], 8) = *(void *)(a1 + 560);
LABEL_660:
          uint64_t v104 = v113;
LABEL_661:
          _NSRTFRouteToken(v104);
          return;
        case 'Y':
          uint64_t v121 = objc_msgSend((id)objc_msgSend((id)a1, "attributedStringToEndOfGroup"), "string");
          if (!v121) {
            return;
          }
          uint64_t v70 = v121;
          uint64_t v71 = (void *)-[NSRTFReader _documentInfoDictionary](a1);
          uint64_t v72 = &NSCopyrightDocumentAttribute;
          goto LABEL_329;
        case 'Z':
          uint64_t v122 = objc_msgSend((id)objc_msgSend((id)a1, "attributedStringToEndOfGroup"), "string");
          if (!v122) {
            return;
          }
          uint64_t v70 = v122;
          uint64_t v71 = (void *)-[NSRTFReader _documentInfoDictionary](a1);
          uint64_t v72 = &NSCategoryDocumentAttribute;
LABEL_329:
          char v140 = (__CFString *)*v72;
          [v71 setObject:v70 forKey:*v72];
          if (*(uint64_t *)(a1 + 2816) >= 1)
          {
            uint64_t v137 = a1;
            unint64_t v138 = v4;
            int v136 = v140;
LABEL_331:
            SaveMetadataInfo(v137, v138, (uint64_t)v136);
          }
          return;
        case '\\':
          _NSRTFGetToken((_DWORD *)(a1 + 536));
          _NSRTFGetToken((_DWORD *)(a1 + 536));
          if (*(_DWORD *)(a1 + 2764) == 2)
          {
            uint64_t v123 = 0;
            id v124 = 0;
            do
            {
              int v125 = *(_DWORD *)(a1 + 2768);
              if (v125 == 59)
              {
                if (v123)
                {
                  uint64_t v123 = [[NSString alloc] initWithBytes:bytes length:v123 encoding:1];
                  if (v123)
                  {
                    if (!v124) {
                      id v124 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    }
                    [v124 addObject:v123];

                    uint64_t v123 = 0;
                  }
                }
              }
              else
              {
                bytes[v123++] = v125;
              }
              _NSRTFGetToken((_DWORD *)(a1 + 536));
            }
            while (*(_DWORD *)(a1 + 2764) == 2);
          }
          else
          {
            id v124 = 0;
          }
          _NSRTFRouteToken(a1 + 536);
          *(void *)(a1 + 300_Block_object_dispose(&STACK[0x2B0], 8) = v124;
          return;
        case ']':
          _NSRTFGetToken((_DWORD *)(a1 + 536));
          _NSRTFGetToken((_DWORD *)(a1 + 536));
          if (*(_DWORD *)(a1 + 2764) == 2)
          {
            uint64_t v126 = 0;
            id v127 = 0;
            do
            {
              int v128 = *(_DWORD *)(a1 + 2768);
              if (v128 == 59)
              {
                if (v126)
                {
                  uint64_t v126 = [[NSString alloc] initWithBytes:bytes length:v126 encoding:1];
                  if (v126)
                  {
                    if (!v127) {
                      id v127 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    }
                    [v127 addObject:v126];

                    uint64_t v126 = 0;
                  }
                }
              }
              else
              {
                bytes[v126++] = v128;
              }
              _NSRTFGetToken((_DWORD *)(a1 + 536));
            }
            while (*(_DWORD *)(a1 + 2764) == 2);
          }
          else
          {
            id v127 = 0;
          }
          _NSRTFRouteToken(a1 + 536);
          *(void *)(a1 + 3016) = v127;
          return;
        default:
          switch(v5)
          {
            case 10:
              return;
            case 11:
              uint64_t v69 = objc_msgSend((id)objc_msgSend((id)a1, "attributedStringToEndOfGroup"), "string");
              if (!v69) {
                return;
              }
              uint64_t v70 = v69;
              uint64_t v71 = (void *)-[NSRTFReader _documentInfoDictionary](a1);
              uint64_t v72 = &NSTitleDocumentAttribute;
              goto LABEL_329;
            case 12:
              uint64_t v131 = objc_msgSend((id)objc_msgSend((id)a1, "attributedStringToEndOfGroup"), "string");
              if (!v131) {
                return;
              }
              uint64_t v70 = v131;
              uint64_t v71 = (void *)-[NSRTFReader _documentInfoDictionary](a1);
              uint64_t v72 = &NSSubjectDocumentAttribute;
              goto LABEL_329;
            case 13:
              uint64_t v132 = objc_msgSend((id)objc_msgSend((id)a1, "attributedStringToEndOfGroup"), "string");
              if (!v132) {
                return;
              }
              uint64_t v70 = v132;
              uint64_t v71 = (void *)-[NSRTFReader _documentInfoDictionary](a1);
              uint64_t v72 = &NSAuthorDocumentAttribute;
              goto LABEL_329;
            case 14:
              uint64_t v133 = objc_msgSend((id)objc_msgSend((id)a1, "attributedStringToEndOfGroup"), "string");
              if (!v133) {
                return;
              }
              uint64_t v70 = v133;
              uint64_t v71 = (void *)-[NSRTFReader _documentInfoDictionary](a1);
              uint64_t v72 = &NSEditorDocumentAttribute;
              goto LABEL_329;
            case 15:
              uint64_t v134 = objc_msgSend((id)objc_msgSend((id)a1, "attributedStringToEndOfGroup"), "string");
              if (!v134) {
                return;
              }
              uint64_t v135 = [v134 componentsSeparatedByString:@", "];
              if (v135) {
                [(id)-[NSRTFReader _documentInfoDictionary](a1) setObject:v135 forKey:@"NSKeywordsDocumentAttribute"];
              }
              if (*(uint64_t *)(a1 + 2816) < 1) {
                return;
              }
              int v136 = @"NSKeywordsDocumentAttribute";
              uint64_t v137 = a1;
              unint64_t v138 = v4;
              goto LABEL_331;
            case 18:
              uint64_t v139 = objc_msgSend((id)objc_msgSend((id)a1, "attributedStringToEndOfGroup"), "string");
              if (!v139) {
                return;
              }
              uint64_t v70 = v139;
              uint64_t v71 = (void *)-[NSRTFReader _documentInfoDictionary](a1);
              uint64_t v72 = &NSCommentDocumentAttribute;
              goto LABEL_329;
            default:
              goto LABEL_312;
          }
      }
      while (1)
      {
        int v235 = *(_DWORD *)(a1 + 2764);
        if (v235 == 1)
        {
          int v237 = *(_DWORD *)(a1 + 2768);
          if (v237 != 1)
          {
            if (!v237) {
              ++v234;
            }
            goto LABEL_512;
          }
          if (v234 == 2)
          {
            if (v231)
            {
              if ([v112 count]) {
                [(id)a1 _addListDefinition:v112 forKey:v231];
              }
              [v112 removeAllObjects];
              uint64_t v231 = 0;
            }
            uint64_t v234 = 1;
            goto LABEL_512;
          }
          if (v234 == 3)
          {
            if (v232 < 0)
            {
              uint64_t v234 = 2;
              goto LABEL_512;
            }
            if (!v230)
            {
              v230 = @"{upper-roman}.";
              switch(v232)
              {
                case 1:
                  break;
                case 2:
                  v230 = @"{lower-roman}.";
                  break;
                case 3:
                  v230 = @"{upper-alpha}.";
                  break;
                case 4:
                  v230 = @"{lower-alpha}.";
                  break;
                default:
                  if (v232 == 23) {
                    v230 = @"{disc}";
                  }
                  else {
                    v230 = @"{decimal}.";
                  }
                  break;
              }
            }
            v238 = [[NSTextList alloc] initWithMarkerFormat:v230 options:v229 & 1];
            [(NSTextList *)v238 setStartingItemNumber:v233];
            [v112 addObject:v238];

            v230 = 0;
            char v229 = 0;
            uint64_t v232 = -1;
            uint64_t v234 = 2;
            goto LABEL_519;
          }
          if (v234 < 2)
          {
LABEL_252:
            *(void *)(a1 + 56_Block_object_dispose(&STACK[0x2B0], 8) = *(void *)(a1 + 560);
            _NSRTFRouteToken(a1 + 536);
            return;
          }
          --v234;
        }
        else
        {
          if (v235 != 3 || *(_DWORD *)(a1 + 2768) != 28) {
            goto LABEL_512;
          }
          int v236 = *(_DWORD *)(a1 + 2772);
          if (v236 == 17)
          {
            uint64_t v231 = *(int *)(a1 + 2776);
          }
          else
          {
            if ((v236 - 5) <= 1)
            {
              uint64_t v232 = *(int *)(a1 + 2776);
              goto LABEL_512;
            }
            if (v236 > 19)
            {
              if (v236 == 20)
              {
                _NSRTFGetToken((_DWORD *)(a1 + 536));
                if (*(_DWORD *)(a1 + 2764) == 2)
                {
                  unint64_t v240 = 0;
                  do
                  {
                    if (v240 <= 0x3FE) {
                      bytes[v240++] = *(_DWORD *)(a1 + 2768);
                    }
                    _NSRTFGetToken((_DWORD *)(a1 + 536));
                  }
                  while (*(_DWORD *)(a1 + 2764) == 2);
                }
                else
                {
                  unint64_t v240 = 0;
                }
                _NSRTFUngetToken(a1 + 536);
                bytes[v240] = 0;
                v230 = (__CFString *)[NSString stringWithUTF8String:bytes];
                goto LABEL_512;
              }
              if (v236 != 21)
              {
LABEL_548:
                if (!v236 && v231)
                {
                  if ([v112 count]) {
                    [(id)a1 _addListDefinition:v112 forKey:v231];
                  }
                  [v112 removeAllObjects];
                  uint64_t v231 = 0;
                }
                goto LABEL_512;
              }
              char v229 = 1;
            }
            else
            {
              if (v236 == 4)
              {
                if (v232 < 0) {
                  goto LABEL_512;
                }
                if (!v230)
                {
                  v230 = @"{upper-roman}.";
                  switch(v232)
                  {
                    case 1:
                      break;
                    case 2:
                      v230 = @"{lower-roman}.";
                      break;
                    case 3:
                      v230 = @"{upper-alpha}.";
                      break;
                    case 4:
                      v230 = @"{lower-alpha}.";
                      break;
                    default:
                      if (v232 == 23) {
                        v230 = @"{disc}";
                      }
                      else {
                        v230 = @"{decimal}.";
                      }
                      break;
                  }
                }
                v239 = [[NSTextList alloc] initWithMarkerFormat:v230 options:v229 & 1];
                [(NSTextList *)v239 setStartingItemNumber:v233];
                [v112 addObject:v239];

                v230 = 0;
                char v229 = 0;
                uint64_t v232 = -1;
LABEL_519:
                uint64_t v233 = 1;
                goto LABEL_512;
              }
              if (v236 != 10) {
                goto LABEL_548;
              }
              uint64_t v233 = *(int *)(a1 + 2776);
            }
          }
        }
LABEL_512:
        if (_NSRTFGetToken((_DWORD *)(a1 + 536)) == 4) {
          goto LABEL_252;
        }
      }
    case 6:
      int v45 = 0;
      int v46 = 0;
      __int16 v47 = 12;
      switch(*(_DWORD *)(a1 + 2772))
      {
        case 0x1A:
        case 0x3B:
          char v48 = [(id)a1 _currentTableCellIsPlaceholder];
          if ((v48 & 1) == 0)
          {
            uint64_t v49 = (_DWORD *)(a1 + 410);
            if ((*(_DWORD *)(a1 + 410) & 0x10000) != 0)
            {
              int v45 = 1;
              goto LABEL_441;
            }
          }
          if (v48) {
            goto LABEL_451;
          }
          int v45 = 1;
          __int16 v47 = 10;
          int v46 = 1;
          goto LABEL_443;
        case 0x1B:
        case 0x3C:
          [(id)a1 _endTableRow];
          return;
        case 0x1C:
          int v45 = 0;
          if (*(unsigned char *)(a1 + 412))
          {
            uint64_t v49 = (_DWORD *)(a1 + 410);
LABEL_441:
            int v46 = 1;
            flushCharacters(a1, 1);
            objc_msgSend((id)objc_msgSend((id)a1, "mutableAttributes"), "removeObjectForKey:", @"NSWritingDirection");
            *v49 &= ~0x10000u;
          }
          else
          {
            int v46 = 1;
          }
          __int16 v47 = 10;
          goto LABEL_443;
        case 0x1E:
          goto LABEL_443;
        case 0x20:
          int v45 = 0;
          int v46 = 0;
          __int16 v47 = 8232;
          goto LABEL_443;
        case 0x25:
          int v45 = 0;
          int v46 = 0;
          __int16 v47 = 9;
          goto LABEL_443;
        case 0x26:
          int v45 = 0;
          int v46 = 0;
          __int16 v47 = 8212;
          goto LABEL_443;
        case 0x27:
          int v45 = 0;
          int v46 = 0;
          __int16 v47 = 8211;
          goto LABEL_443;
        case 0x28:
          int v45 = 0;
          int v46 = 0;
          __int16 v47 = 8195;
          goto LABEL_443;
        case 0x29:
          int v45 = 0;
          int v46 = 0;
          __int16 v47 = 8194;
          goto LABEL_443;
        case 0x2A:
          int v45 = 0;
          int v46 = 0;
          __int16 v47 = 8226;
          goto LABEL_443;
        case 0x2B:
          int v45 = 0;
          int v46 = 0;
          __int16 v47 = 8216;
          goto LABEL_443;
        case 0x2C:
          int v45 = 0;
          int v46 = 0;
          __int16 v47 = 8217;
          goto LABEL_443;
        case 0x2D:
          int v45 = 0;
          int v46 = 0;
          __int16 v47 = 8220;
          goto LABEL_443;
        case 0x2E:
          int v45 = 0;
          int v46 = 0;
          __int16 v47 = 8221;
          goto LABEL_443;
        case 0x31:
          int v45 = 0;
          int v46 = 0;
          __int16 v47 = 160;
          goto LABEL_443;
        case 0x33:
          int v45 = 0;
          int v46 = 0;
          __int16 v47 = 8209;
          goto LABEL_443;
        case 0x37:
          int v45 = 0;
          int v46 = 0;
          __int16 v47 = 8205;
          goto LABEL_443;
        case 0x38:
          int v45 = 0;
          int v46 = 0;
          __int16 v47 = 8204;
LABEL_443:
          if (!*(unsigned char *)(a1 + 2808)) {
            flushCharacters(a1, 1);
          }
          uint64_t v210 = *(void *)(a1 + 328);
          *(void *)(a1 + 32_Block_object_dispose(&STACK[0x2B0], 8) = v210 + 1;
          *(_WORD *)(a1 + 2 * v210 + 72) = v47;
          *(unsigned char *)(a1 + 280_Block_object_dispose(&STACK[0x2B0], 8) = 1;
          if (*(void *)(a1 + 328) < 0x80uLL)
          {
            if (!v46)
            {
LABEL_447:
              if (!v45) {
                return;
              }
              goto LABEL_451;
            }
          }
          else
          {
            flushCharacters(a1, 1);
            if ((v46 & 1) == 0) {
              goto LABEL_447;
            }
          }
          flushCharacters(a1, 1);
          if ((v45 & 1) == 0) {
            return;
          }
LABEL_451:
          [(id)a1 _endTableCell];
          return;
        default:
          return;
      }
    case 8:
      int v50 = *(_DWORD *)(a1 + 2772);
      if (v50 <= 75)
      {
        switch(v50)
        {
          case '(':
            int v65 = *(_DWORD *)(a1 + 2776);
            [(id)a1 paperSize];
            double v67 = (double)v65 / 20.0;
            goto LABEL_163;
          case ')':
            [(id)a1 paperSize];
            double v66 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_163:
            objc_msgSend((id)a1, "setPaperSize:", v67, v66);
            return;
          case '*':
            return;
          case '+':
            double v83 = (double)*(int *)(a1 + 2776) / 20.0;
            [(id)a1 setLeftMargin:v83];
            return;
          case ',':
            double v84 = (double)*(int *)(a1 + 2776) / 20.0;
            [(id)a1 setRightMargin:v84];
            return;
          case '-':
            double v85 = (double)*(int *)(a1 + 2776) / 20.0;
            [(id)a1 setTopMargin:v85];
            return;
          case '.':
            double v86 = (double)*(int *)(a1 + 2776) / 20.0;
            [(id)a1 setBottomMargin:v86];
            return;
          default:
            if (!v50)
            {
              double v57 = (double)*(int *)(a1 + 2776) / 20.0;
              double v58 = (void *)a1;
              goto LABEL_399;
            }
            if (v50 != 4) {
              return;
            }
            LODWORD(v2) = *(_DWORD *)"fff?";
            if (!*(_DWORD *)(a1 + 2776)) {
              *(float *)&double v2 = 0.0;
            }
LABEL_580:
            unsigned long long v145 = (void *)a1;
            break;
        }
LABEL_581:
        [v145 setHyphenationFactor:v2];
      }
      else
      {
        switch(v50)
        {
          case 'L':
            uint64_t v51 = (void *)a1;
            goto LABEL_376;
          case 'N':
            int v92 = *(_DWORD *)(a1 + 2776);
            if (v92 < 1)
            {
              double v2 = 0.0;
            }
            else
            {
              double v2 = (double)v92 / 100.0;
              *(float *)&double v2 = v2;
            }
            goto LABEL_580;
          case 'O':
            int v93 = *(_DWORD *)(a1 + 2776);
            if (v93 <= 0) {
              uint64_t v94 = 100;
            }
            else {
              uint64_t v94 = v93;
            }
            [(id)a1 setViewScale:v94];
            return;
          case 'Q':
            uint64_t v95 = *(int *)(a1 + 2776);
            [(id)a1 setViewKind:v95];
            return;
          case 'R':
            int v96 = *(_DWORD *)(a1 + 2776);
            [(id)a1 viewSize];
            double v98 = (double)v96 / 20.0;
            goto LABEL_198;
          case 'S':
            [(id)a1 viewSize];
            double v97 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_198:
            objc_msgSend((id)a1, "setViewSize:", v98, v97);
            break;
          case 'T':
            int v68 = *(_DWORD *)(a1 + 340);
            if (v68 == -1)
            {
              int v68 = *(_DWORD *)(a1 + 2776);
              *(_DWORD *)(a1 + 340) = v68;
            }
            goto LABEL_129;
          case 'U':
            *(_DWORD *)(a1 + 34_Block_object_dispose(&STACK[0x2B0], 8) = *(_DWORD *)(a1 + 2776);
            break;
          case 'V':
            *(_DWORD *)(a1 + 344) = *(_DWORD *)(a1 + 2776);
            break;
          case 'W':
            int v77 = *(_DWORD *)(a1 + 2776);
            goto LABEL_148;
          case 'X':
            uint64_t v99 = *(unsigned int *)(a1 + 2776);
            if (v99 <= 1) {
              *(void *)(a1 + 296_Block_object_dispose(&STACK[0x2B0], 8) = v99;
            }
            break;
          case 'Y':
            uint64_t v100 = *(unsigned int *)(a1 + 2776);
            if (v100 <= 2) {
              *(void *)(a1 + 2976) = v100;
            }
            break;
          default:
            return;
        }
      }
      return;
    case 9:
      if (*(_DWORD *)(a1 + 2772) == 54)
      {
        uint64_t v40 = *(int *)(a1 + 2776);
        [(id)a1 setTextFlow:v40];
      }
      return;
    case 0xA:
      NSRange v52 = (void *)[(id)a1 _currentTable];
      NSRange v53 = (void *)[(id)a1 _currentTableCell];
      uint64_t v54 = v53;
      switch(*(_DWORD *)(a1 + 2772))
      {
        case 0:
          [(id)a1 _startTableRowDefinition];
          return;
        case 2:
          [(id)a1 _endTableCellDefinition];
          return;
        case 4:
          [(id)a1 _mergeTableCellsHorizontally];
          return;
        case 0xE:
          v279 = (void *)a1;
          uint64_t v280 = 1;
          goto LABEL_675;
        case 0xF:
          v279 = (void *)a1;
          uint64_t v280 = 0;
          goto LABEL_675;
        case 0x10:
          v279 = (void *)a1;
          uint64_t v280 = 3;
          goto LABEL_675;
        case 0x11:
          v279 = (void *)a1;
          uint64_t v280 = 2;
LABEL_675:
          uint64_t v281 = 1;
          goto LABEL_685;
        case 0x16:
          uint64_t v176 = *(int *)(a1 + 2776);
          uint64_t v177 = (_DWORD *)a1;
          uint64_t v178 = 8;
          goto LABEL_692;
        case 0x19:
          [(id)a1 _lastTableRow];
          return;
        case 0x1C:
          v279 = (void *)a1;
          uint64_t v280 = 3;
          goto LABEL_684;
        case 0x1D:
          v279 = (void *)a1;
          uint64_t v280 = 1;
          goto LABEL_684;
        case 0x1E:
          v279 = (void *)a1;
          uint64_t v280 = 0;
          goto LABEL_684;
        case 0x1F:
          v279 = (void *)a1;
          uint64_t v280 = 2;
LABEL_684:
          uint64_t v281 = 0;
LABEL_685:
          [v279 _setCurrentBorderEdge:v280 isTable:v281];
          return;
        case 0x21:
          v282 = (void *)[(id)a1 _currentTableCell];
          [v282 setBackgroundColor:0];
          return;
        case 0x2F:
          uint64_t v176 = *(int *)(a1 + 2776);
          uint64_t v177 = (_DWORD *)a1;
          uint64_t v178 = 7;
          goto LABEL_692;
        case 0x30:
          int v283 = *(_DWORD *)(a1 + 2776);
          uint64_t v284 = [v52 valueTypeForDimension:0];
          double v285 = (double)v283 / 20.0;
          goto LABEL_697;
        case 0x31:
          [v52 valueForDimension:0];
          uint64_t v284 = *(_DWORD *)(a1 + 2776) == 2;
LABEL_697:
          NSRange v53 = v52;
          goto LABEL_730;
        case 0x32:
          uint64_t v286 = *(int *)(a1 + 2776);
          [v52 _setTableFlags:v286];
          return;
        case 0x33:
          double v285 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          uint64_t v284 = 0;
          goto LABEL_730;
        case 0x34:
          double v285 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          goto LABEL_733;
        case 0x35:
          double v285 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          goto LABEL_736;
        case 0x36:
          double v285 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          goto LABEL_738;
        case 0x37:
          double v285 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          goto LABEL_741;
        case 0x38:
          double v285 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          goto LABEL_743;
        case 0x39:
          double v285 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          goto LABEL_746;
        case 0x3A:
          double v285 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          goto LABEL_748;
        case 0x3B:
          double v285 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          goto LABEL_751;
        case 0x3C:
          double v285 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          goto LABEL_753;
        case 0x3D:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          goto LABEL_759;
        case 0x3E:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          goto LABEL_761;
        case 0x3F:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          goto LABEL_764;
        case 0x40:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          goto LABEL_766;
        case 0x41:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          goto LABEL_769;
        case 0x42:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          goto LABEL_771;
        case 0x43:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          goto LABEL_774;
        case 0x44:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          goto LABEL_776;
        case 0x45:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          goto LABEL_779;
        case 0x46:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          goto LABEL_781;
        case 0x47:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          goto LABEL_785;
        case 0x48:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          goto LABEL_787;
        case 0x49:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          goto LABEL_791;
        case 0x4A:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          goto LABEL_793;
        case 0x4B:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          goto LABEL_797;
        case 0x4C:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
          NSRange v53 = v52;
          goto LABEL_799;
        case 0x4D:
          int v288 = *(_DWORD *)(a1 + 2776);
          uint64_t v284 = [v53 valueTypeForDimension:0];
          double v285 = (double)v288 / 20.0;
          goto LABEL_729;
        case 0x4E:
          [v53 valueForDimension:0];
          uint64_t v284 = *(_DWORD *)(a1 + 2776) == 2;
LABEL_729:
          NSRange v53 = v54;
LABEL_730:
          uint64_t v289 = 0;
          goto LABEL_755;
        case 0x4F:
          double v285 = (double)*(int *)(a1 + 2776) / 20.0;
          uint64_t v284 = 0;
          goto LABEL_734;
        case 0x50:
          double v285 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_733:
          uint64_t v284 = 1;
LABEL_734:
          uint64_t v289 = 1;
          goto LABEL_755;
        case 0x51:
          double v285 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_736:
          uint64_t v284 = 0;
          goto LABEL_739;
        case 0x52:
          double v285 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_738:
          uint64_t v284 = 1;
LABEL_739:
          uint64_t v289 = 2;
          goto LABEL_755;
        case 0x53:
          double v285 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_741:
          uint64_t v284 = 0;
          goto LABEL_744;
        case 0x54:
          double v285 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_743:
          uint64_t v284 = 1;
LABEL_744:
          uint64_t v289 = 4;
          goto LABEL_755;
        case 0x55:
          double v285 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_746:
          uint64_t v284 = 0;
          goto LABEL_749;
        case 0x56:
          double v285 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_748:
          uint64_t v284 = 1;
LABEL_749:
          uint64_t v289 = 5;
          goto LABEL_755;
        case 0x57:
          double v285 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_751:
          uint64_t v284 = 0;
          goto LABEL_754;
        case 0x58:
          double v285 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_753:
          uint64_t v284 = 1;
LABEL_754:
          uint64_t v289 = 6;
LABEL_755:
          [v53 setValue:v284 type:v289 forDimension:v285];
          return;
        case 0x59:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_759:
          uint64_t v290 = 0;
          goto LABEL_762;
        case 0x5A:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_761:
          uint64_t v290 = 1;
LABEL_762:
          uint64_t v291 = 1;
          goto LABEL_783;
        case 0x5B:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_764:
          uint64_t v290 = 0;
          goto LABEL_767;
        case 0x5C:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_766:
          uint64_t v290 = 1;
LABEL_767:
          uint64_t v291 = 1;
          goto LABEL_789;
        case 0x5D:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_769:
          uint64_t v290 = 0;
          goto LABEL_772;
        case 0x5E:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_771:
          uint64_t v290 = 1;
LABEL_772:
          uint64_t v291 = 1;
          goto LABEL_795;
        case 0x5F:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_774:
          uint64_t v290 = 0;
          goto LABEL_777;
        case 0x60:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_776:
          uint64_t v290 = 1;
LABEL_777:
          uint64_t v291 = 1;
          goto LABEL_801;
        case 0x61:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_779:
          uint64_t v290 = 0;
          goto LABEL_782;
        case 0x62:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_781:
          uint64_t v290 = 1;
LABEL_782:
          uint64_t v291 = -1;
LABEL_783:
          uint64_t v292 = 1;
          goto LABEL_802;
        case 0x63:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_785:
          uint64_t v290 = 0;
          goto LABEL_788;
        case 0x64:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_787:
          uint64_t v290 = 1;
LABEL_788:
          uint64_t v291 = -1;
LABEL_789:
          uint64_t v292 = 0;
          goto LABEL_802;
        case 0x65:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_791:
          uint64_t v290 = 0;
          goto LABEL_794;
        case 0x66:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_793:
          uint64_t v290 = 1;
LABEL_794:
          uint64_t v291 = -1;
LABEL_795:
          uint64_t v292 = 3;
          goto LABEL_802;
        case 0x67:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_797:
          uint64_t v290 = 0;
          goto LABEL_800;
        case 0x68:
          double v287 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_799:
          uint64_t v290 = 1;
LABEL_800:
          uint64_t v291 = -1;
LABEL_801:
          uint64_t v292 = 2;
LABEL_802:
          [v53 setWidth:v290 type:v291 forLayer:v292 edge:v287];
          return;
        case 0x69:
          uint64_t v293 = 0;
          goto LABEL_809;
        case 0x6A:
          uint64_t v293 = 3;
          goto LABEL_809;
        case 0x6B:
          uint64_t v293 = 1;
          goto LABEL_809;
        case 0x6C:
          uint64_t v293 = 2;
LABEL_809:
          [v53 setVerticalAlignment:v293];
          break;
        case 0x6E:
          [(id)a1 _mergeTableCellsVertically];
          break;
        default:
          return;
      }
      return;
    case 0xB:
      int v55 = *(_DWORD *)(a1 + 2772);
      switch(v55)
      {
        case 0:
          uint64_t v56 = (void *)[(id)a1 _mutableParagraphStyle];
          objc_msgSend(v56, "setParagraphStyle:", objc_msgSend((id)a1, "defaultParagraphStyle"));
          [(id)a1 defaultTabInterval];
          double v58 = v56;
LABEL_399:
          [v58 setDefaultTabInterval:v57];
          return;
        case 1:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 22:
          return;
        case 2:
          int v144 = *(_DWORD *)(a1 + 2776);
          unsigned long long v145 = (void *)[(id)a1 _mutableParagraphStyle];
          if (v144 == -1000000) {
            LODWORD(v2) = 1.0;
          }
          else {
            double v2 = 0.0;
          }
          goto LABEL_581;
        case 3:
          [(id)a1 _paragraphInTable];
          return;
        case 11:
          NSRange v146 = (void *)[(id)a1 _mutableParagraphStyle];
          uint64_t v147 = 0;
          goto LABEL_388;
        case 12:
          NSRange v146 = (void *)[(id)a1 _mutableParagraphStyle];
          uint64_t v147 = 2;
          goto LABEL_388;
        case 13:
          NSRange v146 = (void *)[(id)a1 _mutableParagraphStyle];
          uint64_t v147 = 3;
          goto LABEL_388;
        case 14:
          NSRange v146 = (void *)[(id)a1 _mutableParagraphStyle];
          uint64_t v147 = 1;
LABEL_388:
          [v146 setAlignment:v147];
          return;
        case 15:
          NSRange v148 = (void *)[(id)a1 _mutableParagraphStyle];
          [v148 headIndent];
          double v150 = (double)*(int *)(a1 + 2776) / 20.0;
          goto LABEL_355;
        case 16:
          NSRange v148 = (void *)[(id)a1 _mutableParagraphStyle];
          [v148 firstLineHeadIndent];
          double v152 = v151;
          [v148 headIndent];
          double v154 = v153;
          [v148 setHeadIndent:(double)*(int *)(a1 + 2776) / 20.0];
          double v149 = v152 - v154;
          double v150 = (double)*(int *)(a1 + 2776) / 20.0;
LABEL_355:
          double v155 = v149 + v150;
          [v148 setFirstLineHeadIndent:v155];
          return;
        case 17:
          int v156 = *(_DWORD *)(a1 + 2776);
          if (*(double *)(a1 + 424) - (*(double *)(a1 + 448) + *(double *)(a1 + 440)) + (double)v156 / -20.0 >= 0.0) {
            double v157 = *(double *)(a1 + 424) - (*(double *)(a1 + 448) + *(double *)(a1 + 440)) + (double)v156 / -20.0;
          }
          else {
            double v157 = 0.0;
          }
          intptr_t v158 = (void *)[(id)a1 _mutableParagraphStyle];
          [v158 setTailIndent:v157];
          return;
        case 18:
          NSRange v159 = (void *)[(id)a1 _mutableParagraphStyle];
          double v160 = (double)*(int *)(a1 + 2776) / 20.0;
          [v159 setParagraphSpacingBefore:v160];
          return;
        case 19:
          int v161 = ParAttr_ignoreParaSpacing;
          if (ParAttr_ignoreParaSpacing != 254) {
            goto LABEL_869;
          }
          if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"NSIgnoreRTFParagraphSpacing"))
          {
            int v161 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSIgnoreRTFParagraphSpacing");
            ParAttr_ignoreParaSpacing = v161;
          }
          else
          {
            int v161 = ParAttr_ignoreParaSpacing;
            if (ParAttr_ignoreParaSpacing == 254)
            {
              ParAttr_ignoreParaSpacing = 2;
              goto LABEL_871;
            }
          }
LABEL_869:
          if (!v161) {
            goto LABEL_872;
          }
          if (v161 != 2) {
            return;
          }
LABEL_871:
          if (*(_DWORD *)(a1 + 340) == 100) {
            return;
          }
LABEL_872:
          v307 = (void *)[(id)a1 _mutableParagraphStyle];
          double v308 = (double)*(int *)(a1 + 2776) / 20.0;
          [v307 setParagraphSpacing:v308];
          break;
        case 20:
          if (*(_DWORD *)(a1 + 2776) != 1000)
          {
            NSRange v162 = (void *)[(id)a1 _mutableParagraphStyle];
            NSRange v163 = v162;
            unsigned int v164 = *(_DWORD *)(a1 + 2776);
            if ((v164 & 0x80000000) != 0)
            {
              [v162 setMinimumLineHeight:(double)-v164 / 20.0];
              double v165 = (double)-*(_DWORD *)(a1 + 2776) / 20.0;
            }
            else
            {
              [v162 setMinimumLineHeight:(double)v164 / 20.0];
              double v165 = 0.0;
            }
            CFIndex v180 = v163;
LABEL_877:
            [v180 setMaximumLineHeight:v165];
          }
          return;
        case 21:
          if (*(_DWORD *)(a1 + 2776) == 1)
          {
            uint64_t v166 = (void *)[(id)a1 _mutableParagraphStyle];
            [v166 minimumLineHeight];
            [v166 setLineHeightMultiple:v167 / 12.0];
            double v168 = 0.0;
            int v169 = v166;
LABEL_395:
            [v169 setMinimumLineHeight:v168];
          }
          return;
        case 23:
          uint64_t v51 = (void *)[(id)a1 _mutableParagraphStyle];
LABEL_376:
          uint64_t v170 = 1;
          goto LABEL_425;
        case 24:
          uint64_t v51 = (void *)[(id)a1 _mutableParagraphStyle];
          uint64_t v170 = 0;
LABEL_425:
          [v51 setBaseWritingDirection:v170];
          return;
        case 25:
          double v171 = (void *)[(id)a1 _mutableParagraphStyle];
          double v172 = (_DWORD *)(a1 + 410);
          v173 = -[NSTextTab initWithType:location:](+[NSTextTab allocWithZone:](NSTextTab, "allocWithZone:", [v171 zone]), "initWithType:location:", ((unint64_t)*(unsigned int *)(a1 + 410) >> 10) & 0xF, (double)*(int *)(a1 + 2776) / 20.0);
          [v171 addTabStop:v173];

          *v172 &= 0xFFFFC3FF;
          return;
        case 26:
          uint64_t v174 = (unsigned int *)(a1 + 410);
          unsigned int v175 = *(_DWORD *)(a1 + 410) & 0xFFFFC3FF;
          goto LABEL_826;
        case 27:
          uint64_t v174 = (unsigned int *)(a1 + 410);
          unsigned int v175 = *(_DWORD *)(a1 + 410) & 0xFFFFC3FF | 0x400;
          goto LABEL_826;
        case 28:
          uint64_t v174 = (unsigned int *)(a1 + 410);
          unsigned int v175 = *(_DWORD *)(a1 + 410) & 0xFFFFC3FF | 0x800;
          goto LABEL_826;
        case 29:
          uint64_t v174 = (unsigned int *)(a1 + 410);
          unsigned int v175 = *(_DWORD *)(a1 + 410) & 0xFFFFC3FF | 0xC00;
          goto LABEL_826;
        default:
          switch(v55)
          {
            case 'V':
              uint64_t v63 = [(id)a1 _currentBorderEdge];
              if ([(id)a1 _currentBorderIsTable]) {
                uint64_t v64 = (void *)[(id)a1 _currentTable];
              }
              else {
                uint64_t v64 = (void *)[(id)a1 _currentTableCell];
              }
              v294 = v64;
              [v64 setWidth:0 type:0 forLayer:v63 edge:(double)*(int *)(a1 + 2776) / 20.0];
              if ([v294 borderColorForEdge:v63]) {
                return;
              }
              uint64_t v295 = [(Class)getNSColorClass_3[0]() colorWithCalibratedWhite:0.75 alpha:1.0];
              v296 = v294;
LABEL_820:
              [v296 setBorderColor:v295 forEdge:v63];
              return;
            case 'W':
              uint64_t v176 = *(int *)(a1 + 2776);
              uint64_t v177 = (_DWORD *)a1;
              uint64_t v178 = 6;
LABEL_692:
              goto LABEL_694;
            case 'Y':
              uint64_t v63 = [(id)a1 _currentBorderEdge];
              if ([(id)a1 _currentBorderIsTable]) {
                uint64_t v179 = (void *)[(id)a1 _currentTable];
              }
              else {
                uint64_t v179 = (void *)[(id)a1 _currentTableCell];
              }
              v297 = v179;
              [v179 setWidth:0 type:0 forLayer:v63 edge:0.0];
              v296 = v297;
              uint64_t v295 = 0;
              goto LABEL_820;
            case 'i':
              CFIndex v180 = (void *)[(id)a1 _mutableParagraphStyle];
              double v165 = (double)*(int *)(a1 + 2776) / 20.0;
              goto LABEL_877;
            case 'j':
              NSRange v146 = (void *)[(id)a1 _mutableParagraphStyle];
              uint64_t v147 = 4;
              goto LABEL_388;
            case 'k':
              CGRect v181 = (void *)[(id)a1 _mutableParagraphStyle];
              double v182 = (double)*(int *)(a1 + 2776) / 20.0;
              [v181 setLineSpacing:v182];
              return;
            case 'l':
              int v169 = (void *)[(id)a1 _mutableParagraphStyle];
              double v168 = (double)*(int *)(a1 + 2776) / 20.0;
              goto LABEL_395;
            case 'm':
              double v58 = (void *)[(id)a1 _mutableParagraphStyle];
              double v57 = (double)*(int *)(a1 + 2776) / 20.0;
              goto LABEL_399;
            case 'n':
              if ((*(_DWORD *)(a1 + 2776) & 0x80000000) != 0) {
                return;
              }
              objc_msgSend((id)a1, "_setCurrentListNumber:");
              if ((*(_DWORD *)(a1 + 2776) & 0x80000000) != 0) {
                return;
              }
              v183 = (void *)[(id)a1 _listDefinitions];
              uint64_t v184 = objc_msgSend(v183, "objectForKey:", objc_msgSend(NSNumber, "numberWithInteger:", *(int *)(a1 + 2776)));
              if (!v184) {
                return;
              }
              v185 = (void *)v184;
              unint64_t v186 = [(id)a1 _currentListLevel];
              if (v186 >= [v185 count]) {
                return;
              }
              uint64_t v187 = (void *)[(id)a1 _mutableParagraphStyle];
              uint64_t v188 = (void *)[v187 tabStops];
              objc_msgSend(v187, "setTextLists:", objc_msgSend(v185, "subarrayWithRange:", 0, objc_msgSend((id)a1, "_currentListLevel") + 1));
              if ((unint64_t)[v188 count] < 2) {
                return;
              }
              v189 = v188;
              goto LABEL_414;
            case 'o':
              if ((*(_DWORD *)(a1 + 2776) & 0x80000000) != 0) {
                return;
              }
              objc_msgSend((id)a1, "_setCurrentListLevel:");
              if ((*(_DWORD *)(a1 + 2776) & 0x80000000) != 0) {
                return;
              }
              uint64_t v190 = (void *)[(id)a1 _listDefinitions];
              v191 = objc_msgSend(v190, "objectForKey:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend((id)a1, "_currentListNumber")));
              if (!v191) {
                return;
              }
              v192 = v191;
              unint64_t v193 = *(int *)(a1 + 2776);
              if ([v191 count] <= v193) {
                return;
              }
              uint64_t v187 = (void *)[(id)a1 _mutableParagraphStyle];
              id v194 = (void *)[v187 tabStops];
              objc_msgSend(v187, "setTextLists:", objc_msgSend(v192, "subarrayWithRange:", 0, *(int *)(a1 + 2776) + 1));
              if ((unint64_t)[v194 count] < 2) {
                return;
              }
              v189 = v194;
LABEL_414:
              id v195 = (void *)[v189 objectAtIndex:1];
              long long v196 = +[NSTextTab allocWithZone:](NSTextTab, "allocWithZone:", [v187 zone]);
              [v195 location];
              v326 = -[NSTextTab initWithTextAlignment:location:options:](v196, "initWithTextAlignment:location:options:", 4, [v195 options], v197);
              [v187 removeTabStop:v195];
              [v187 addTabStop:v326];

              break;
            case 'p':
              uint64_t v198 = *(int *)(a1 + 2776);
              [(id)a1 _setTableNestingLevel:v198];
              return;
            case 'q':
              unsigned long long v145 = (void *)[(id)a1 _mutableParagraphStyle];
              double v2 = (double)*(int *)(a1 + 2776) / 20.0;
              *(float *)&double v2 = v2;
              goto LABEL_581;
            case 'r':
              uint64_t v199 = (void *)[(id)a1 _mutableParagraphStyle];
              double v200 = (double)*(int *)(a1 + 2776) / 20.0;
              *(float *)&double v200 = v200;
              [v199 setTighteningFactorForTruncation:v200];
              return;
            case 's':
              uint64_t v51 = (void *)[(id)a1 _mutableParagraphStyle];
              uint64_t v170 = -1;
              goto LABEL_425;
            case 't':
              v201 = (void *)[(id)a1 _mutableParagraphStyle];
              [v201 setSpansAllLines:1];
              return;
            case 'u':
              v202 = (void *)[(id)a1 _mutableParagraphStyle];
              uint64_t v203 = *(int *)(a1 + 2776);
              [v202 setHorizontalAlignment:v203];
              return;
            case 'v':
              v204 = (void *)[(id)a1 _mutableParagraphStyle];
              [v204 setFullyJustified:1];
              return;
            default:
              return;
          }
          return;
      }
      return;
    case 0xC:
      int v59 = *(unsigned __int8 *)(*(int *)(a1 + 2760) + a1 + 1735);
      switch(*(_DWORD *)(a1 + 2772))
      {
        case 0:
          unsigned int v60 = (void *)[(id)a1 mutableAttributes];
          int v245 = *(_DWORD *)(a1 + 410);
          *(void *)(a1 + 384) = 0x4028000000000000;
          *(_DWORD *)(a1 + 410) = v245 & 0xFFFFFFF8;
          processFont(a1, 0);
          [v60 removeObjectForKey:@"NSBaselineOffset"];
          [v60 removeObjectForKey:@"NSSuperScript"];
          [v60 removeObjectForKey:@"NSKern"];
          [v60 removeObjectForKey:@"NSUnderline"];
          [v60 removeObjectForKey:@"NSStrikethrough"];
          [v60 removeObjectForKey:@"NSColor"];
          [v60 removeObjectForKey:@"NSBackgroundColor"];
          [v60 removeObjectForKey:@"NSStrokeColor"];
          [v60 removeObjectForKey:@"NSUnderlineColor"];
          [v60 removeObjectForKey:@"NSStrikethroughColor"];
          [v60 removeObjectForKey:@"NSStrokeWidth"];
          [v60 removeObjectForKey:@"NSShadow"];
          [v60 removeObjectForKey:@"NSObliqueness"];
          [v60 removeObjectForKey:@"NSExpansion"];
          [v60 removeObjectForKey:@"NSTextHighlightStyle"];
          v244 = NSTextHighlightColorSchemeAttributeName;
          goto LABEL_632;
        case 1:
          v246 = (unsigned int *)(a1 + 410);
          unsigned int v247 = *(_DWORD *)(a1 + 410) & 0xFFFFFFFA | (v59 != 48);
          goto LABEL_610;
        case 4:
          int v248 = *(_DWORD *)(a1 + 2776);
          if (v248 == -1000000)
          {
            double v299 = -6.0;
            goto LABEL_863;
          }
          if (!v248) {
            goto LABEL_614;
          }
          int v249 = -v248;
          goto LABEL_834;
        case 5:
        case 0x1A:
          if (*(_DWORD *)(a1 + 2776) == -1000000) {
            *(_DWORD *)(a1 + 2776) = 1;
          }
          unsigned int v60 = (void *)[(id)a1 mutableAttributes];
          if (*(_DWORD *)(a1 + 2772) == 5) {
            int v141 = -*(_DWORD *)(a1 + 2776);
          }
          else {
            int v141 = *(_DWORD *)(a1 + 2776);
          }
          uint64_t v142 = [NSNumber numberWithInteger:v141];
          NSRange v143 = (__CFString **)&NSSuperscriptAttributeName;
          goto LABEL_844;
        case 6:
          v242 = (void *)[(id)a1 mutableAttributes];
          v243 = (__CFString **)&NSSuperscriptAttributeName;
          goto LABEL_858;
        case 7:
          int v250 = *(_DWORD *)(a1 + 2776);
          if (!v250) {
            goto LABEL_823;
          }
          int v251 = *(_DWORD *)(a1 + 340);
          if (v251 == -1) {
            int v251 = 80;
          }
          BOOL v252 = v251 > 102 || v251 == 0;
          double v253 = 0.5;
          if (v252) {
            double v253 = 0.25;
          }
          double v254 = v253 * (double)v250;
          goto LABEL_824;
        case 8:
          int v255 = *(_DWORD *)(a1 + 2776);
          if (v255) {
            double v254 = (double)v255 / 20.0;
          }
          else {
LABEL_823:
          }
            double v254 = 0.0;
LABEL_824:
          *(double *)(a1 + 392) = v254;
          goto LABEL_825;
        case 9:
          if (!*(_DWORD *)(a1 + 2776))
          {
            *(void *)(a1 + 392) = 0xC0F86A0000000000;
            goto LABEL_825;
          }
          if ((*(unsigned char *)(a1 + 410) & 0x10) != 0)
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "mutableAttributes"), "objectForKey:", @"NSKern"), "doubleValue");
            if (v306 != 0.0) {
              goto LABEL_825;
            }
          }
          else if (*(double *)(a1 + 392) != -100000.0)
          {
            goto LABEL_825;
          }
          *(void *)(a1 + 392) = 0;
LABEL_825:
          uint64_t v174 = (unsigned int *)(a1 + 410);
          unsigned int v175 = *(_DWORD *)(a1 + 410) & 0xFFFFFFEF;
LABEL_826:
          *uint64_t v174 = v175;
          return;
        case 0xA:
          processFont(a1, *(int *)(a1 + 2776));
          goto LABEL_648;
        case 0xB:
          double v256 = (double)*(int *)(a1 + 2776) * 0.5;
          goto LABEL_646;
        case 0xC:
          v246 = (unsigned int *)(a1 + 410);
          unsigned int v247 = *(_DWORD *)(a1 + 410) & 0xFFFFFFF9 | (2 * (v59 != 48));
LABEL_610:
          unsigned int *v246 = v247;
          return;
        case 0x12:
        case 0x44:
        case 0x45:
        case 0x46:
        case 0x49:
        case 0x4A:
          unsigned int v78 = (void *)[(id)a1 mutableAttributes];
          unsigned int v79 = v78;
          if (*(_DWORD *)(a1 + 2772) == 18 && !*(_DWORD *)(a1 + 2776))
          {
            v242 = (void *)[(id)a1 mutableAttributes];
            v243 = (__CFString **)&NSShadowAttributeName;
            goto LABEL_858;
          }
          int v80 = (void *)[v78 objectForKey:@"NSShadow"];
          int v81 = v80;
          if (v80 && *(_DWORD *)(a1 + 2772) != 18) {
            int v82 = (NSShadow *)[v80 copy];
          }
          else {
            int v82 = objc_alloc_init(NSShadow);
          }
          v205 = v82;
          int v206 = *(_DWORD *)(a1 + 2772);
          switch(v206)
          {
            case 'D':
              double v207 = (double)*(int *)(a1 + 2776) / 20.0;
              [v81 shadowOffset];
              v208 = v205;
              double v209 = v207;
              goto LABEL_829;
            case 'E':
              [v81 shadowOffset];
              goto LABEL_828;
            case 'F':
              [(NSShadow *)v82 setShadowBlurRadius:(double)*(int *)(a1 + 2776) / 20.0];
              goto LABEL_833;
            case 'G':
            case 'H':
              goto LABEL_833;
            case 'I':
              *(void *)bytes = 0;
              __endptr[0] = 0;
              double v335 = 0.0;
              int v298 = *(_DWORD *)(a1 + 2776);
              objc_msgSend(-[NSShadow shadowColor](v82, "shadowColor"), "getRed:green:blue:alpha:", bytes, __endptr, &v335, 0);
              -[NSShadow setShadowColor:](v205, "setShadowColor:", [(Class)getNSColorClass_3[0]() colorWithCalibratedRed:*(double *)bytes green:*(double *)__endptr blue:v335 alpha:(double)v298 / 255.0]);
              goto LABEL_833;
            case 'J':
              processColor((_DWORD *)a1, *(int *)(a1 + 2776), 5, v82);
              goto LABEL_833;
            default:
              if (v206 != 18) {
                goto LABEL_833;
              }
              double v209 = 3.0;
LABEL_828:
              v208 = v205;
LABEL_829:
              [(NSShadow *)v208 setShadowOffset:v209];
LABEL_833:
              [v79 setObject:v205 forKey:@"NSShadow"];

              break;
          }
          return;
        case 0x13:
        case 0x25:
        case 0x2E:
          double v87 = (void *)[(id)a1 mutableAttributes];
          unsigned int v60 = v87;
          if (!*(_DWORD *)(a1 + 2776))
          {
            [v87 removeObjectForKey:@"NSStrikethrough"];
            v244 = (__CFString **)&NSStrikethroughColorAttributeName;
            goto LABEL_632;
          }
          int v88 = *(_DWORD *)(a1 + 2772);
          uint64_t v89 = 9;
          if (v88 != 46) {
            uint64_t v89 = 1;
          }
          if (v88 == 37) {
            uint64_t v90 = 32769;
          }
          else {
            uint64_t v90 = v89;
          }
          id v91 = NSNumber;
          goto LABEL_635;
        case 0x14:
        case 0x15:
        case 0x16:
        case 0x18:
        case 0x30:
        case 0x31:
        case 0x32:
        case 0x33:
        case 0x34:
        case 0x35:
        case 0x36:
        case 0x37:
        case 0x38:
        case 0x39:
        case 0x3A:
        case 0x3B:
        case 0x3C:
          unsigned int v60 = (void *)[(id)a1 mutableAttributes];
          if (!*(_DWORD *)(a1 + 2776)) {
            goto LABEL_631;
          }
          int v61 = *(_DWORD *)(a1 + 2772);
          if (v61 <= 47)
          {
            switch(v61)
            {
              case 21:
                uint64_t v62 = 257;
                break;
              case 22:
LABEL_456:
                uint64_t v62 = 9;
                break;
              case 24:
                uint64_t v62 = 32769;
                break;
              default:
LABEL_841:
                uint64_t v62 = 1;
                break;
            }
          }
          else
          {
            switch(v61)
            {
              case '0':
              case '3':
                uint64_t v62 = 513;
                break;
              case '1':
                uint64_t v62 = 769;
                break;
              case '2':
                uint64_t v62 = 1025;
                break;
              case '4':
              case '<':
                uint64_t v62 = 2;
                break;
              case '5':
                uint64_t v62 = 258;
                break;
              case '6':
              case '9':
                uint64_t v62 = 514;
                break;
              case '7':
                uint64_t v62 = 770;
                break;
              case '8':
                uint64_t v62 = 1026;
                break;
              case ';':
                goto LABEL_456;
              default:
                goto LABEL_841;
            }
          }
          v261 = NSNumber;
          goto LABEL_843;
        case 0x17:
          v242 = (void *)[(id)a1 mutableAttributes];
          v243 = (__CFString **)&NSUnderlineStyleAttributeName;
          goto LABEL_858;
        case 0x19:
          int v249 = *(_DWORD *)(a1 + 2776);
          if (v249 == -1000000)
          {
            double v299 = 6.0;
          }
          else
          {
            if (!v249)
            {
LABEL_614:
              v242 = (void *)[(id)a1 mutableAttributes];
              v243 = (__CFString **)&NSBaselineOffsetAttributeName;
              goto LABEL_858;
            }
LABEL_834:
            double v299 = (double)v249 * 0.5;
          }
LABEL_863:
          uint64_t v304 = [(id)a1 mutableAttributes];
          uint64_t v142 = [NSNumber numberWithDouble:v299];
          v305 = (__CFString **)&NSBaselineOffsetAttributeName;
          goto LABEL_864;
        case 0x1C:
          uint64_t v176 = *(int *)(a1 + 2776);
          uint64_t v177 = (_DWORD *)a1;
          uint64_t v178 = 0;
          goto LABEL_694;
        case 0x1D:
          uint64_t v176 = *(int *)(a1 + 2776);
          uint64_t v177 = (_DWORD *)a1;
          uint64_t v178 = 1;
          goto LABEL_694;
        case 0x24:
          if (!*(_DWORD *)(a1 + 336)) {
            processCharacter(a1, *(_WORD *)(a1 + 2776));
          }
          return;
        case 0x26:
          processMSUnicodeChar(a1);
          return;
        case 0x27:
          *(_DWORD *)(a1 + 410) = *(_DWORD *)(a1 + 410) & 0xFFFFFC7F | ((*(_DWORD *)(a1 + 2776) & 7) << 7);
          return;
        case 0x28:
          int v257 = *(_DWORD *)(a1 + 2776);
          unsigned int v60 = (void *)[(id)a1 mutableAttributes];
          if (v257)
          {
            uint64_t v142 = [NSNumber numberWithInteger:*(int *)(a1 + 2776)];
            NSRange v143 = (__CFString **)&NSCharacterShapeAttributeName;
            goto LABEL_844;
          }
          v244 = (__CFString **)&NSCharacterShapeAttributeName;
          goto LABEL_632;
        case 0x29:
          int v258 = *(_DWORD *)(a1 + 2776);
          unsigned int v60 = (void *)[(id)a1 mutableAttributes];
          if (v258 == 1)
          {
            v244 = (__CFString **)&NSLigatureAttributeName;
            goto LABEL_632;
          }
          uint64_t v142 = [NSNumber numberWithInteger:*(int *)(a1 + 2776)];
          NSRange v143 = (__CFString **)&NSLigatureAttributeName;
          goto LABEL_844;
        case 0x2F:
          uint64_t v176 = *(int *)(a1 + 2776);
          uint64_t v177 = (_DWORD *)a1;
          uint64_t v178 = 3;
          goto LABEL_694;
        case 0x3D:
          int v259 = *(_DWORD *)(a1 + 2776);
          unsigned int v60 = (void *)[(id)a1 mutableAttributes];
          if (v259)
          {
            uint64_t v142 = [NSNumber numberWithDouble:(double)*(int *)(a1 + 2776) / 20.0];
            NSRange v143 = (__CFString **)&NSStrokeWidthAttributeName;
            goto LABEL_844;
          }
          v244 = (__CFString **)&NSStrokeWidthAttributeName;
          goto LABEL_632;
        case 0x3E:
          uint64_t v176 = *(int *)(a1 + 2776);
          uint64_t v177 = (_DWORD *)a1;
          uint64_t v178 = 2;
          goto LABEL_694;
        case 0x3F:
          int v260 = *(_DWORD *)(a1 + 2776);
          unsigned int v60 = (void *)[(id)a1 mutableAttributes];
          if (!v260)
          {
LABEL_631:
            v244 = (__CFString **)&NSUnderlineStyleAttributeName;
            goto LABEL_632;
          }
          v261 = NSNumber;
          uint64_t v62 = *(int *)(a1 + 2776);
LABEL_843:
          uint64_t v142 = [v261 numberWithUnsignedInteger:v62];
          NSRange v143 = (__CFString **)&NSUnderlineStyleAttributeName;
          goto LABEL_844;
        case 0x40:
          int v263 = *(_DWORD *)(a1 + 2776);
          unsigned int v60 = (void *)[(id)a1 mutableAttributes];
          if (!v263)
          {
            v244 = (__CFString **)&NSStrikethroughStyleAttributeName;
            goto LABEL_632;
          }
          id v91 = NSNumber;
          uint64_t v90 = *(int *)(a1 + 2776);
LABEL_635:
          uint64_t v142 = [v91 numberWithUnsignedInteger:v90];
          NSRange v143 = (__CFString **)&NSStrikethroughStyleAttributeName;
          goto LABEL_844;
        case 0x41:
          uint64_t v176 = *(int *)(a1 + 2776);
          uint64_t v177 = (_DWORD *)a1;
          uint64_t v178 = 4;
LABEL_694:
          processColor(v177, v176, v178, 0);
          return;
        case 0x42:
          int v264 = *(_DWORD *)(a1 + 2776);
          unsigned int v60 = (void *)[(id)a1 mutableAttributes];
          if (v264)
          {
            uint64_t v142 = [NSNumber numberWithDouble:(double)*(int *)(a1 + 2776) / 20.0 / 100.0];
            NSRange v143 = (__CFString **)&NSObliquenessAttributeName;
            goto LABEL_844;
          }
          v244 = (__CFString **)&NSObliquenessAttributeName;
          goto LABEL_632;
        case 0x43:
          int v265 = *(_DWORD *)(a1 + 2776);
          unsigned int v60 = (void *)[(id)a1 mutableAttributes];
          if (v265)
          {
            uint64_t v142 = [NSNumber numberWithDouble:(double)*(int *)(a1 + 2776) / 20.0 / 100.0];
            NSRange v143 = (__CFString **)&NSExpansionAttributeName;
LABEL_844:
            v300 = *v143;
            v301 = v60;
            goto LABEL_845;
          }
          v244 = (__CFString **)&NSExpansionAttributeName;
LABEL_632:
          v262 = *v244;
          v242 = v60;
          goto LABEL_859;
        case 0x47:
          TypographyFeatures = readTypographyFeatures((_DWORD *)a1);
          [(id)a1 _updateAttributes];
          v267 = (void *)[(id)a1 mutableAttributes];
          v268 = objc_msgSend((id)objc_msgSend(v267, "objectForKey:", @"NSFont"), "fontDescriptor");
          v269 = v268;
          if (TypographyFeatures)
          {
            if (v268) {
              v270 = objc_msgSend((id)objc_msgSend(v268, "fontAttributes"), "mutableCopyWithZone:", 0);
            }
            else {
              v270 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
            }
            v303 = v270;
            [v270 setObject:TypographyFeatures forKey:*MEMORY[0x1E4F24550]];
            if (!v303) {
              return;
            }
          }
          else
          {
            uint64_t v302 = *MEMORY[0x1E4F24550];
            if ([v268 objectForKey:*MEMORY[0x1E4F24550]])
            {
              v303 = objc_msgSend((id)objc_msgSend(v269, "fontAttributes"), "mutableCopyWithZone:", 0);
              [v303 removeObjectForKey:v302];
            }
            else
            {
              v303 = 0;
            }
            uint64_t v318 = *MEMORY[0x1E4F24568];
            if ([v269 objectForKey:*MEMORY[0x1E4F24568]])
            {
              if (!v303) {
                v303 = objc_msgSend((id)objc_msgSend(v269, "fontAttributes"), "mutableCopyWithZone:", 0);
              }
              [v303 removeObjectForKey:v318];
            }
            if (!v303) {
              return;
            }
            if ([v303 count] == 2)
            {
              uint64_t v319 = [v303 objectForKey:@"NSFontNameAttribute"];
              v320 = (void *)[v303 objectForKey:@"NSFontSizeAttribute"];
              if (v319)
              {
                if (v320)
                {
                  [v320 doubleValue];
                  v321 = +[UIFont _fontWithName:size:](UIFont, "_fontWithName:size:", v319);
                  if (v321) {
                    goto LABEL_927;
                  }
                }
              }
            }
          }
          uint64_t v322 = [*(id *)(a1 + 2960) objectForKey:v303];
          if (!v322)
          {
            v321 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", +[UIFontDescriptor fontDescriptorWithFontAttributes:v303], 0.0);
            id v323 = *(id *)(a1 + 2960);
            if (!v323)
            {
              id v323 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              *(void *)(a1 + 2960) = v323;
            }
            [v323 setObject:v321 forKey:v303];

            if (!v321) {
              return;
            }
LABEL_931:
            v301 = v267;
            uint64_t v142 = (uint64_t)v321;
            v300 = @"NSFont";
            goto LABEL_845;
          }
          v321 = (UIFont *)v322;
LABEL_927:

          goto LABEL_931;
        case 0x48:
          double v256 = (double)*(int *)(a1 + 2776) / 1000.0;
LABEL_646:
          *(double *)(a1 + 384) = v256;
          goto LABEL_648;
        case 0x4C:
          *(_WORD *)(a1 + 40_Block_object_dispose(&STACK[0x2B0], 8) = *(_DWORD *)(a1 + 2776);
LABEL_648:
          uint64_t v174 = (unsigned int *)(a1 + 410);
          unsigned int v175 = *(_DWORD *)(a1 + 410) & 0xFFFFFFFB;
          goto LABEL_826;
        case 0x4D:
          FontPaletteColors = readFontPaletteColors((_DWORD *)a1);
          if ([FontPaletteColors count])
          {
            [(id)a1 _updateAttributes];
            v272 = (void *)[(id)a1 mutableAttributes];
            v273 = objc_msgSend((id)objc_msgSend(v272, "objectForKey:", @"NSFont"), "fontDescriptor");
            __endptr[0] = *(char **)MEMORY[0x1E4F245D0];
            *(void *)bytes = FontPaletteColors;
            v274 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", objc_msgSend(v273, "fontDescriptorByAddingAttributes:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", bytes, __endptr, 1)), 0.0);
            if (v274) {
              [v272 setObject:v274 forKey:@"NSFont"];
            }
          }
          return;
        case 0x4E:
          uint64_t v275 = *(int *)(a1 + 2776);
          if (!v275)
          {
            v242 = (void *)[(id)a1 mutableAttributes];
            v243 = NSTextHighlightStyleAttributeName;
            goto LABEL_858;
          }
          if ((v275 & 0x80000000) != 0) {
            v276 = +[NSRTFReader defaultTextHighlightStyles];
          }
          else {
            v276 = *(NSArray **)(a1 + 3008);
          }
          if ((int)v275 < 0) {
            unint64_t v316 = ~v275;
          }
          else {
            unint64_t v316 = v275 - 1;
          }
          if (v316 >= [(NSArray *)v276 count]) {
            return;
          }
          uint64_t v304 = [(id)a1 mutableAttributes];
          uint64_t v142 = [(NSArray *)v276 objectAtIndexedSubscript:v316];
          v305 = NSTextHighlightStyleAttributeName;
          goto LABEL_864;
        case 0x4F:
          uint64_t v277 = *(int *)(a1 + 2776);
          if (v277)
          {
            if ((v277 & 0x80000000) != 0) {
              v278 = +[NSRTFReader defaultTextHighlightColorSchemes];
            }
            else {
              v278 = *(NSArray **)(a1 + 3016);
            }
            if ((int)v277 < 0) {
              unint64_t v317 = ~v277;
            }
            else {
              unint64_t v317 = v277 - 1;
            }
            if (v317 < [(NSArray *)v278 count])
            {
              uint64_t v304 = [(id)a1 mutableAttributes];
              uint64_t v142 = [(NSArray *)v278 objectAtIndexedSubscript:v317];
              v305 = NSTextHighlightColorSchemeAttributeName;
LABEL_864:
              v300 = *v305;
              v301 = (void *)v304;
LABEL_845:
              [v301 setObject:v142 forKey:v300];
            }
          }
          else
          {
            v242 = (void *)[(id)a1 mutableAttributes];
            v243 = NSTextHighlightColorSchemeAttributeName;
LABEL_858:
            v262 = *v243;
LABEL_859:
            [v242 removeObjectForKey:v262];
          }
          return;
        default:
          return;
      }
    case 0x17:
      if (*(_DWORD *)(a1 + 2772) == 2) {
        *(_DWORD *)(a1 + 372) = CFStringConvertWindowsCodepageToEncoding(*(_DWORD *)(a1 + 2776));
      }
      return;
    case 0x1C:
      if (*(_DWORD *)(a1 + 2772) != 22) {
        return;
      }
      if (!*(unsigned char *)(a1 + 3024))
      {
        uint64_t v75 = 0;
        while (1)
        {
          do
            _NSRTFGetToken((_DWORD *)(a1 + 536));
          while (*(_DWORD *)(a1 + 2764) != 1);
          int v76 = *(_DWORD *)(a1 + 2768);
          if (v76 == 1)
          {
            if (!v75) {
              goto LABEL_94;
            }
            --v75;
          }
          if (!v76) {
            ++v75;
          }
        }
      }
      int v41 = *(_DWORD *)(a1 + 340);
      if (v41 == -1) {
        int v41 = 80;
      }
      double v42 = (double)*(int *)(a1 + 344) / 1000.0 + (double)v41;
      if (v42 >= 810.0 && v42 <= 824.0)
      {
        _NSRTFGetToken((_DWORD *)(a1 + 536));
        if (*(_DWORD *)(a1 + 2764) != 3
          || *(_DWORD *)(a1 + 2768) != 6
          || *(_DWORD *)(a1 + 2772) != 37
          || (_NSRTFRouteToken(a1 + 536), _NSRTFGetToken((_DWORD *)(a1 + 536)), *(_DWORD *)(a1 + 2764) != 1)
          || *(_DWORD *)(a1 + 2768) != 1)
        {
LABEL_94:
          _NSRTFUngetToken(a1 + 536);
          return;
        }
      }
      return;
    case 0x1D:
      if (*(_DWORD *)(a1 + 356) == -1)
      {
        unsigned int v43 = *(_DWORD *)(a1 + 2772);
        if (v43 <= 3 && v43 != 1) {
          *(_DWORD *)(a1 + 356) = v43;
        }
      }
      return;
    default:
      return;
  }
}

void sub_18E5C1894(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v8 = va_arg(va2, void);
  uint64_t v10 = va_arg(va2, void);
  uint64_t v11 = va_arg(va2, void);
  uint64_t v12 = va_arg(va2, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);
  _Unwind_Resume(a1);
}

void groupClass(_DWORD *a1)
{
  flushCharacters((uint64_t)a1, 1);
  int v2 = a1[692];
  if (v2 == 1)
  {
    [a1 _popState];
  }
  else if (!v2)
  {
    [a1 _pushState];
  }
}

Class initNSColor_3()
{
  __NSGetFrameworkReference(0, 0);
  Class result = objc_getClass("NSColor");
  classNSColor_3 = (uint64_t)result;
  if (!result) {
    initNSColor_cold_1_3();
  }
  getNSColorClass_3[0] = NSColorFunction_3;
  return result;
}

uint64_t NSColorFunction_3()
{
  return classNSColor_3;
}

void flushCharacters(uint64_t a1, char a2)
{
  CFIndex v2 = *(void *)(a1 + 328);
  if (v2)
  {
    *(void *)(a1 + 32_Block_object_dispose(&STACK[0x2B0], 8) = 0;
    unint64_t v4 = (const UniChar *)(a1 + 72);
    if (*(unsigned char *)(a1 + 2808))
    {
      CFStringRef v5 = CFStringCreateWithCharactersNoCopy(0, v4, v2, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
    }
    else
    {
      CFStringRef v7 = CFStringCreateWithBytes(0, (const UInt8 *)v4, v2, *(_DWORD *)(a1 + 368), 0);
      CFStringRef v5 = v7;
      if (v2 >= 2 && (*(unsigned char *)(a1 + 410) & 0x40) != 0 && !v7)
      {
        CFIndex v8 = v2 - 1;
        CFStringRef v9 = CFStringCreateWithBytes(0, (const UInt8 *)v4, v8, *(_DWORD *)(a1 + 368), 0);
        CFStringRef v5 = v9;
        if ((a2 & 1) == 0)
        {
          if (v9)
          {
            *(unsigned char *)(a1 + 72) = *((unsigned char *)v4 + v8);
            *(void *)(a1 + 32_Block_object_dispose(&STACK[0x2B0], 8) = 1;
            goto LABEL_11;
          }
        }
      }
    }
    if (!v5)
    {
LABEL_12:
      *(unsigned char *)(a1 + 280_Block_object_dispose(&STACK[0x2B0], 8) = 0;
      return;
    }
LABEL_11:
    [(id)a1 processString:v5];
    CFRelease(v5);
    goto LABEL_12;
  }
}

uint64_t SaveMetadataInfo(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = [NSString stringWithFormat:@"%@Range", a3];
  if (*(void *)(a1 + 560) > a2) {
    objc_msgSend((id)-[NSRTFReader _documentInfoDictionary](a1), "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a2, *(void *)(a1 + 560) + ~a2), v5);
  }
  uint64_t v6 = (void *)-[NSRTFReader _documentInfoDictionary](a1);
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 560)];

  return [v6 setObject:v7 forKey:@"NSRTFMetadataEndLocation"];
}

uint64_t readDate(uint64_t a1)
{
  CFIndex v2 = objc_opt_new();
  _NSRTFGetToken((_DWORD *)(a1 + 536));
  if (*(_DWORD *)(a1 + 2764) != 3) {
    goto LABEL_15;
  }
  uint64_t v3 = 0x8000000000000000;
  do
  {
    if (*(_DWORD *)(a1 + 2768) != 6) {
      break;
    }
    int v4 = *(_DWORD *)(a1 + 2772);
    switch(v4)
    {
      case 6:
        [v2 setYear:*(int *)(a1 + 2776)];
        break;
      case 7:
        [v2 setMonth:*(int *)(a1 + 2776)];
        break;
      case 8:
        [v2 setDay:*(int *)(a1 + 2776)];
        break;
      case 9:
        [v2 setHour:*(int *)(a1 + 2776)];
        break;
      case 10:
        [v2 setMinute:*(int *)(a1 + 2776)];
        break;
      case 11:
        [v2 setSecond:*(int *)(a1 + 2776)];
        break;
      default:
        if (v4 == 58) {
          uint64_t v3 = *(int *)(a1 + 2776);
        }
        break;
    }
    _NSRTFGetToken((_DWORD *)(a1 + 536));
  }
  while (*(_DWORD *)(a1 + 2764) == 3);
  if (v3 != 0x8000000000000000)
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v3];
  }
  else
  {
LABEL_15:
    uint64_t v5 = *(void **)(a1 + 2952);
    if (!v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F1C9A8]);
      uint64_t v7 = (void *)[v6 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
      *(void *)(a1 + 2952) = v7;
      objc_msgSend(v7, "setTimeZone:", objc_msgSend(MEMORY[0x1E4F1CAF0], "localTimeZone"));
      uint64_t v5 = *(void **)(a1 + 2952);
    }
    uint64_t v8 = [v5 dateFromComponents:v2];
  }
  uint64_t v9 = v8;

  if (*(_DWORD *)(a1 + 2764) != 1 || *(_DWORD *)(a1 + 2768) != 1) {
    _NSRTFSkipGroup((_DWORD *)(a1 + 536));
  }
  _NSRTFRouteToken(a1 + 536);
  return v9;
}

uint64_t readNeXTGraphic(uint64_t a1, int a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    BOOL v6 = 1;
LABEL_6:
    BOOL v40 = +[NSAdaptiveImageGlyph _readsAdaptiveImageGlyphFromDocumentFormats];
    goto LABEL_8;
  }
  int v4 = *(_DWORD *)(a1 + 340);
  if (v4 == -1) {
    int v5 = 80;
  }
  else {
    int v5 = *(_DWORD *)(a1 + 340);
  }
  BOOL v6 = (double)*(int *)(a1 + 344) / 1000.0 + (double)v5 < 988.0;
  if (v4 <= 2781) {
    goto LABEL_6;
  }
  BOOL v40 = 0;
LABEL_8:
  BOOL v7 = +[NSAdaptiveImageGlyph prefersEmojiImageTextAttachment];
  _NSRTFGetToken((_DWORD *)(a1 + 536));
  if (*(_DWORD *)(a1 + 2764) == 2)
  {
    unint64_t v8 = 0;
    do
    {
      CFIndex v9 = v8 + 1;
      v43[v8] = *(_DWORD *)(a1 + 2768);
      _NSRTFGetToken((_DWORD *)(a1 + 536));
      if (*(_DWORD *)(a1 + 2764) != 2) {
        break;
      }
    }
    while (v8++ < 0x3FF);
    if (v9 == 1)
    {
      CFIndex v11 = 1;
    }
    else if (v43[v9 - 1] == 32)
    {
      CFIndex v11 = v9 - 1;
    }
    else
    {
      CFIndex v11 = v9;
    }
  }
  else
  {
    CFIndex v11 = 0;
  }
  double v12 = 0.0;
  if ((a2 & 1) == 0 && _NSRTFGetToken((_DWORD *)(a1 + 536)) != 4)
  {
    unint64_t v13 = 0;
    char v16 = 0;
    uint64_t v39 = 0;
    uint64_t v17 = 1;
    HIDWORD(v3_Block_object_dispose(&STACK[0x2B0], 8) = 1;
    uint64_t v41 = 1;
    while (1)
    {
      int v18 = *(_DWORD *)(a1 + 2764);
      if ((v16 & 1) != 0 && v18 == 2 && v13 <= 0x3FF)
      {
        bytes[v13++] = *(_DWORD *)(a1 + 2768);
LABEL_32:
        char v16 = 1;
      }
      else
      {
        if (v18 == 3)
        {
          if (*(_DWORD *)(a1 + 2768) == 15)
          {
            switch(*(_DWORD *)(a1 + 2772))
            {
              case 5:
                char v16 = 0;
                BOOL v6 = 1;
                goto LABEL_50;
              case 6:
                HIDWORD(v3_Block_object_dispose(&STACK[0x2B0], 8) = 0;
                goto LABEL_49;
              case 7:
                char v16 = 0;
                double v12 = (double)*(int *)(a1 + 2776) / 20.0;
                goto LABEL_50;
              case 8:
                char v16 = 0;
                uint64_t v39 = *(int *)(a1 + 2776);
                goto LABEL_50;
              case 9:
                uint64_t v41 = 0;
                goto LABEL_49;
              case 0xA:
                char v16 = 0;
                uint64_t v20 = 2;
                goto LABEL_55;
              case 0xB:
                char v16 = 0;
                uint64_t v20 = 1;
                goto LABEL_55;
              case 0xC:
                char v16 = 0;
                uint64_t v20 = 3;
LABEL_55:
                uint64_t v41 = v20;
                break;
              case 0xD:
                BOOL v40 = 1;
                goto LABEL_32;
              default:
                goto LABEL_49;
            }
            goto LABEL_50;
          }
        }
        else if (v18 == 1)
        {
          int v19 = *(_DWORD *)(a1 + 2768);
          if (v19 == 1)
          {
            if (v17 < 2) {
              goto LABEL_22;
            }
            char v16 = 0;
            --v17;
          }
          else
          {
            if (!v19) {
              ++v17;
            }
            char v16 = 0;
          }
          goto LABEL_50;
        }
LABEL_49:
        char v16 = 0;
      }
LABEL_50:
      if (_NSRTFGetToken((_DWORD *)(a1 + 536)) == 4) {
        goto LABEL_22;
      }
    }
  }
  uint64_t v39 = 0;
  unint64_t v13 = 0;
  uint64_t v41 = 1;
  HIDWORD(v3_Block_object_dispose(&STACK[0x2B0], 8) = 1;
LABEL_22:
  LODWORD(v3_Block_object_dispose(&STACK[0x2B0], 8) = v6;
  _NSRTFRouteToken(a1 + 536);
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  if (!+[NSAdaptiveImageGlyph prefersTextAttachment]
    && v13)
  {
    uint64_t v14 = (NSAdaptiveImageGlyph *)CFStringCreateWithBytes(0, bytes, v13, 0x8000100u, 0);
    if (v14)
    {
      if (v7)
      {
        uint64_t v15 = (uint64_t)+[NSEmojiImageTextAttachment emojiImageTextAttachmentForContentIdentifier:v14];
        uint64_t v14 = 0;
        goto LABEL_59;
      }
      uint64_t v14 = [[NSAdaptiveImageGlyph alloc] initWithContentIdentifier:v14];
    }
    uint64_t v15 = 0;
  }
LABEL_59:
  if (v15 || !v11)
  {
LABEL_81:
    if (!(v15 | (unint64_t)v14)) {
      goto LABEL_90;
    }
    goto LABEL_82;
  }
  if (*(unsigned char *)(a1 + 2809))
  {
    CFStringRef v21 = CFStringCreateWithBytes(0, v43, v11, 0x8000100u, 0);
  }
  else
  {
    id v22 = [NSString alloc];
    CFStringRef v21 = (CFStringRef)objc_msgSend(v22, "initWithBytes:length:encoding:", v43, v11, objc_msgSend(NSString, "defaultCStringEncoding"));
  }
  unint64_t v23 = (__CFString *)v21;
  uint64_t v24 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "fileWrappers", v38), "objectForKey:", v21);
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = 0;
    unint64_t v27 = v23;
  }
  else
  {
    uint64_t v26 = (__CFString *)CFStringCreateWithBytes(0, v43, v11, *(_DWORD *)(a1 + 360), 0);
    uint64_t v28 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "fileWrappers"), "objectForKey:", v26);
    if (!v28)
    {
      CFStringEncoding v35 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "fileWrappers"), "keyEnumerator");
      while (1)
      {
        CFStringRef v36 = (__CFString *)[v35 nextObject];
        if (!v36) {
          break;
        }
        unint64_t v27 = v36;
        if (!-[__CFString compare:options:range:](v36, "compare:options:range:", v23, 0, 0, -[__CFString length](v36, "length"))|| !-[__CFString compare:options:range:](v27, "compare:options:range:", v26, 0, 0, [(__CFString *)v27 length]))
        {
          uint64_t v37 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "fileWrappers"), "objectForKey:", v27);
          if (!v37) {
            break;
          }
          uint64_t v25 = v37;
          goto LABEL_68;
        }
      }
LABEL_76:
      uint64_t v15 = 0;
      goto LABEL_77;
    }
    uint64_t v25 = v28;
    unint64_t v27 = v26;
  }
LABEL_68:
  int v29 = textAttachmentClassForDocumentName(v27, v40);
  int v30 = [(objc_class *)v29 isSubclassOfClass:objc_opt_class()];
  if ((v30 & 1) != 0 || ![(objc_class *)v29 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v15 = [[v29 alloc] initWithFileWrapper:v25];
    int v31 = 0;
  }
  else
  {
    uint64_t v14 = (NSAdaptiveImageGlyph *)[[v29 alloc] initWithFileWrapper:v25];
    uint64_t v15 = 0;
    int v31 = 1;
  }
  if (!(v15 | (unint64_t)v14))
  {
    if ((v30 | v31) == 1)
    {
      uint64_t v15 = objc_msgSend(objc_alloc(textAttachmentClassForDocumentName(v27, 0)), "initWithFileWrapper:", v25);
      uint64_t v14 = 0;
      goto LABEL_77;
    }
    uint64_t v14 = 0;
    goto LABEL_76;
  }
LABEL_77:

  if (!v15) {
    goto LABEL_81;
  }
  if (v38) {
    [(id)v15 setIgnoresOrientation:1];
  }
  [(id)v15 setStandaloneAlignment:v41];
  [(id)v15 setEmbeddingType:v39];
  [(id)v15 setAllowsTextAttachmentView:BYTE4(v38) & 1];
  [(id)v15 setLineLayoutPadding:v12];
LABEL_82:
  BOOL v32 = objc_msgSend((id)a1, "mutableAttributes", v38);
  if (v14)
  {
    [v32 setObject:v14 forKeyedSubscript:@"CTAdaptiveImageProvider"];
  }
  else
  {
    [v32 setObject:v15 forKey:@"NSAttachment"];
    uint64_t v14 = 0;
  }

  if (!*(unsigned char *)(a1 + 2808)) {
    flushCharacters(a1, 1);
  }
  uint64_t v33 = *(void *)(a1 + 328);
  *(void *)(a1 + 32_Block_object_dispose(&STACK[0x2B0], 8) = v33 + 1;
  *(_WORD *)(a1 + 2 * v33 + 72) = -4;
  *(unsigned char *)(a1 + 280_Block_object_dispose(&STACK[0x2B0], 8) = 1;
  if (*(void *)(a1 + 328) >= 0x80uLL) {
    flushCharacters(a1, 1);
  }
  flushCharacters(a1, 1);
LABEL_90:
  if (a2) {
    return [(id)a1 _popState];
  }
  _NSRTFSkipGroup((_DWORD *)(a1 + 536));
  return _NSRTFRouteToken(a1 + 536);
}

uint64_t __readFieldInst_block_invoke(void *a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1[4] + 8) + 24);
  if (v1 < 1) {
    return 0;
  }
  uint64_t v3 = 2 * v1;
  uint64_t result = (uint64_t)malloc_type_malloc(2 * v1, 0xB9D50CFBuLL);
  if (result)
  {
    uint64_t v5 = result;
    memcpy((void *)result, *(const void **)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 24));
    if (*(void *)(*(void *)(a1[4] + 8) + 24) != 1000) {
      free(*(void **)(*(void *)(a1[5] + 8) + 24));
    }
    *(void *)(*(void *)(a1[5] + 8) + 24) = v5;
    *(void *)(*(void *)(a1[4] + 8) + 24) = v3;
    return 1;
  }
  return result;
}

objc_class *textAttachmentClassForDocumentName(void *a1, int a2)
{
  uint64_t v3 = [a1 pathExtension];
  if (v3)
  {
    int v4 = (void *)[MEMORY[0x1E4F442D8] typeWithFilenameExtension:v3];
    if (v4)
    {
      uint64_t v5 = v4;
      if (a2
        && objc_msgSend(v4, "isEqual:", +[NSAdaptiveImageGlyph contentType](NSAdaptiveImageGlyph, "contentType")))
      {
        if (+[NSAdaptiveImageGlyph prefersEmojiImageTextAttachment])
        {
          uint64_t result = +[NSTextAttachment textAttachmentClassForFileType:](NSTextAttachment, "textAttachmentClassForFileType:", objc_msgSend(+[NSEmojiImageTextAttachment _UTIForEmojiImage](NSEmojiImageTextAttachment, "_UTIForEmojiImage"), "identifier"));
          if (result) {
            return result;
          }
        }
        else if (!+[NSAdaptiveImageGlyph prefersTextAttachment])
        {
          uint64_t result = (objc_class *)objc_opt_class();
          if (result) {
            return result;
          }
        }
      }
      uint64_t result = +[NSTextAttachment textAttachmentClassForFileType:](NSTextAttachment, "textAttachmentClassForFileType:", [v5 identifier]);
      if (result) {
        return result;
      }
    }
  }

  return (objc_class *)objc_opt_class();
}

void processCharacter(uint64_t a1, __int16 a2)
{
  if (!*(unsigned char *)(a1 + 2808)) {
    flushCharacters(a1, 1);
  }
  uint64_t v4 = *(void *)(a1 + 328);
  *(void *)(a1 + 32_Block_object_dispose(&STACK[0x2B0], 8) = v4 + 1;
  *(_WORD *)(a1 + 2 * v4 + 72) = a2;
  *(unsigned char *)(a1 + 280_Block_object_dispose(&STACK[0x2B0], 8) = 1;
  if (*(void *)(a1 + 328) >= 0x80uLL)
  {
    flushCharacters(a1, 1);
  }
}

uint64_t colorFromRTFRGB(uint64_t a1, int a2, int a3, int a4)
{
  int v7 = *(_DWORD *)(a1 + 356);
  Class v8 = (Class)getNSColorClass_3[0]();
  double v9 = (double)a2 / 255.0;
  double v10 = (double)a3 / 255.0;
  double v11 = (double)a4 / 255.0;
  if (v7 == 3)
  {
    return [(objc_class *)v8 colorWithDisplayP3Red:v9 green:v10 blue:v11 alpha:1.0];
  }
  else
  {
    return [(objc_class *)v8 _disambiguated_due_to_CIImage_colorWithRed:v9 green:v10 blue:v11 alpha:1.0];
  }
}

void *processColor(_DWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result = (void *)getColor((uint64_t)a1, a2);
  double v9 = result;
  switch(a3)
  {
    case 0:
      if (!result) {
        goto LABEL_6;
      }
      if (onceToken != -1) {
        dispatch_once(&onceToken, &__block_literal_global_2_0);
      }
      if ([v9 isEqual:_black])
      {
LABEL_6:
        double v10 = (void *)[a1 mutableAttributes];
        double v12 = &NSForegroundColorAttributeName;
        goto LABEL_38;
      }
      double v10 = (void *)[a1 mutableAttributes];
      unint64_t v23 = &NSForegroundColorAttributeName;
      goto LABEL_48;
    case 1:
      if (a1 && a2 == 1)
      {
        int v13 = a1[85];
        if (v13 == -1) {
          int v13 = 80;
        }
        double v14 = (double)(int)a1[86] / 1000.0 + (double)v13;
        if (v14 <= 1504.69 && v14 >= 1504.0 || result == 0) {
          goto LABEL_37;
        }
      }
      else if (!result)
      {
        goto LABEL_37;
      }
      if (onceToken != -1) {
        dispatch_once(&onceToken, &__block_literal_global_36);
      }
      if (([v9 isEqual:_white] & 1) == 0)
      {
        double v10 = (void *)[a1 mutableAttributes];
        unint64_t v23 = &NSBackgroundColorAttributeName;
LABEL_48:
        NSAttributedStringKey v11 = *v23;
LABEL_49:
        return (void *)[v10 setObject:v9 forKey:v11];
      }
LABEL_37:
      double v10 = (void *)[a1 mutableAttributes];
      double v12 = &NSBackgroundColorAttributeName;
LABEL_38:
      NSAttributedStringKey v18 = *v12;
LABEL_39:
      return objc_msgSend(v10, "removeObjectForKey:", v18, v11);
    case 2:
      double v10 = (void *)[a1 mutableAttributes];
      uint64_t v17 = &NSStrokeColorAttributeName;
      goto LABEL_23;
    case 3:
      double v10 = (void *)[a1 mutableAttributes];
      uint64_t v17 = &NSUnderlineColorAttributeName;
      goto LABEL_23;
    case 4:
      double v10 = (void *)[a1 mutableAttributes];
      uint64_t v17 = &NSStrikethroughColorAttributeName;
LABEL_23:
      NSAttributedStringKey v11 = *v17;
      if (v9) {
        goto LABEL_49;
      }
      NSAttributedStringKey v18 = *v17;
      goto LABEL_39;
    case 5:
      double v26 = 0.0;
      double v27 = 0.0;
      double v24 = 0.333333333;
      double v25 = 0.0;
      objc_msgSend((id)objc_msgSend(a4, "shadowColor"), "getRed:green:blue:alpha:", 0, 0, 0, &v24);
      [v9 getRed:&v27 green:&v26 blue:&v25 alpha:0];
      return objc_msgSend(a4, "setShadowColor:", objc_msgSend((Class)getNSColorClass_3[0](), "colorWithCalibratedRed:green:blue:alpha:", v27, v26, v25, v24));
    case 6:
      if ([a1 _currentBorderIsTable]) {
        uint64_t v19 = [a1 _currentTable];
      }
      else {
        uint64_t v19 = [a1 _currentTableCell];
      }
      CFStringRef v21 = (void *)v19;
      uint64_t v22 = [a1 _currentBorderEdge];
      return (void *)[v21 setBorderColor:v9 forEdge:v22];
    case 7:
      uint64_t v20 = (void *)[a1 _currentTableCell];
      goto LABEL_30;
    case 8:
      uint64_t v20 = (void *)[a1 _currentTable];
LABEL_30:
      return (void *)[v20 setBackgroundColor:v9];
    default:
      return result;
  }
}

const void *getColor(uint64_t a1, uint64_t a2)
{
  v42[5] = *(CGFloat *)MEMORY[0x1E4F143B8];
  if (*(uint64_t *)(a1 + 2816) > 0) {
    return 0;
  }
  uint64_t v5 = _NSRTFGetColor(a1 + 536, a2);
  uint64_t v6 = _NSTextScalingTypeForCurrentEnvironment();
  if (!v5) {
    return 0;
  }
  CFIndex v2 = *(const void **)(v5 + 24);
  if (!v2)
  {
    uint64_t v7 = v6;
    Class v8 = *(const char **)(v5 + 32);
    if (v8)
    {
      if (strlen(v8) <= 0x63)
      {
        double v9 = (NSString *)[[NSString alloc] initWithUTF8String:*(void *)(v5 + 32)];
        if (v9)
        {
          double v10 = v9;
          NSAttributedStringKey v11 = NSSelectorFromString(v9);
          if (v11
            && (double v12 = v11, [NSStringFromSelector(v11) hasSuffix:@"Color"])
            && (ColorClass Class = __NSTextGraphicsContextProviderGetColorClass(v7),
                double v14 = (void *)[(objc_class *)ColorClass methodSignatureForSelector:v12],
                uint64_t v15 = (const char *)[v14 methodReturnType],
                [v14 numberOfArguments] == 2)
            && v15
            && !strcmp(v15, "@"))
          {
            CFIndex v2 = (const void *)[(objc_class *)ColorClass performSelector:v12];

            if (v2) {
              goto LABEL_77;
            }
          }
          else
          {
          }
        }
      }
    }
    uint64_t v16 = *(int *)(v5 + 40);
    if (v16 > 5) {
      goto LABEL_63;
    }
    CFStringRef v17 = (const __CFString *)**((void **)&unk_1E55C8350 + v16);
    if (!v17) {
      goto LABEL_63;
    }
    NSAttributedStringKey v18 = CGColorSpaceCreateWithName(v17);
    if (!v18) {
      goto LABEL_63;
    }
    CGColorSpaceRef v19 = v18;
    size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(v18);
    if (!NumberOfComponents
      || ((v21 = *(int *)(v5 + 44), NumberOfComponents != v21) ? (BOOL v22 = NumberOfComponents + 1 == v21) : (BOOL v22 = 1), !v22))
    {
LABEL_62:
      CFRelease(v19);
      goto LABEL_63;
    }
    if ((int)v21 >= 1)
    {
      int v23 = 0;
      double v24 = (unsigned int *)(v5 + 48);
      double v25 = v42;
      uint64_t v26 = *(int *)(v5 + 44);
      while (1)
      {
        unsigned int v28 = *v24++;
        int v27 = v28;
        if (v28 > 0x186A0)
        {
          if (v23)
          {
            if (v27 >= 0) {
              int v29 = 100000;
            }
            else {
              int v29 = 0;
            }
            if (v23 != 2) {
              goto LABEL_39;
            }
            int v27 = v29;
          }
          else
          {
            unsigned int v30 = *(_DWORD *)(v5 + 40);
            BOOL v31 = v30 > 4;
            int v32 = (1 << v30) & 0x13;
            if (!v31 && v32 != 0)
            {
              int v23 = 1;
              goto LABEL_39;
            }
            if (v27 >= 0) {
              int v27 = 100000;
            }
            else {
              int v27 = 0;
            }
          }
          int v23 = 2;
        }
LABEL_39:
        *v25++ = (double)v27 / 100000.0;
        if (!--v26) {
          goto LABEL_45;
        }
      }
    }
    int v23 = 0;
LABEL_45:
    if (NumberOfComponents == v21) {
      v42[NumberOfComponents] = 1.0;
    }
    if (v23 != 1) {
      goto LABEL_58;
    }
    int v34 = *(_DWORD *)(v5 + 40);
    if (v34)
    {
      if (v34 != 4)
      {
        if (v34 == 1)
        {
          CFStringEncoding v35 = (const __CFString **)MEMORY[0x1E4F1DBE0];
          goto LABEL_56;
        }
LABEL_58:
        if (!v19) {
          goto LABEL_63;
        }
        CGColorRef v37 = CGColorCreate(v19, v42);
        if (!v37) {
          goto LABEL_62;
        }
        CGColorRef v38 = v37;
        CFIndex v2 = (const void *)[(Class)getNSColorClass_3[0]() colorWithCGColor:v37];
        CFRelease(v38);
        CFRelease(v19);
        if (v2) {
          goto LABEL_77;
        }
LABEL_63:
        int v39 = *(_DWORD *)(v5 + 4);
        int v40 = *(_DWORD *)(v5 + 8);
        if (v39 == v40)
        {
          if (v39 == *(_DWORD *)(v5 + 12))
          {
            if (v39 <= 0)
            {
              if (onceToken != -1) {
                dispatch_once(&onceToken, &__block_literal_global_2_0);
              }
              uint64_t v41 = &_black;
LABEL_74:
              CFIndex v2 = (const void *)*v41;
              if (!*v41)
              {
                int v39 = *(_DWORD *)(v5 + 4);
                int v40 = *(_DWORD *)(v5 + 8);
                goto LABEL_76;
              }
LABEL_77:
              *(void *)(v5 + 24) = CFRetain(v2);
              return v2;
            }
            int v40 = *(_DWORD *)(v5 + 4);
            if (v39 == 255)
            {
              if (onceToken != -1) {
                dispatch_once(&onceToken, &__block_literal_global_36);
              }
              uint64_t v41 = &_white;
              goto LABEL_74;
            }
          }
          else
          {
            int v40 = *(_DWORD *)(v5 + 4);
          }
        }
LABEL_76:
        CFIndex v2 = (const void *)colorFromRTFRGB(a1, v39, v40, *(_DWORD *)(v5 + 12));
        goto LABEL_77;
      }
      CFStringEncoding v35 = (const __CFString **)MEMORY[0x1E4F1DBB8];
    }
    else
    {
      CFStringEncoding v35 = (const __CFString **)MEMORY[0x1E4F1DBE8];
    }
LABEL_56:
    CFStringRef v36 = *v35;
    if (*v35)
    {
      CFRelease(v19);
      CGColorSpaceRef v19 = CGColorSpaceCreateWithName(v36);
    }
    goto LABEL_58;
  }
  return v2;
}

Class __NSTextGraphicsContextProviderGetColorClass(uint64_t a1)
{
  if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery])
  {
    CFIndex v2 = +[NSTextGraphicsContextProvider textGraphicsContextProviderClass];
    return (Class)[(objc_class *)v2 colorClassForApplicationFrameworkContext:a1];
  }
  else
  {
    return +[NSTextGraphicsContextProvider __defaultColorClass];
  }
}

uint64_t processFont(uint64_t a1, uint64_t a2)
{
  uint64_t result = _NSRTFGetFont(a1 + 536, a2);
  CFStringEncoding v23 = -1;
  if (!result)
  {
    uint64_t result = NSDefaultFont();
    uint64_t v5 = (NSFont *)result;
    CFStringEncoding SystemEncoding = *(_DWORD *)(a1 + 360);
    goto LABEL_78;
  }
  uint64_t v4 = result;
  uint64_t v5 = *(NSFont **)(result + 48);
  if (v5)
  {
    CFStringEncoding SystemEncoding = *(_DWORD *)(result + 64);
    goto LABEL_78;
  }
  int v7 = *(_DWORD *)(result + 24);
  if (v7 < 0) {
    goto LABEL_35;
  }
  if (v7 <= 161)
  {
    if (v7 > 127)
    {
      switch(v7)
      {
        case 128:
          CFStringEncoding SystemEncoding = 1056;
          goto LABEL_53;
        case 129:
          CFStringEncoding SystemEncoding = 1058;
          goto LABEL_53;
        case 130:
          CFStringEncoding SystemEncoding = 1296;
          goto LABEL_53;
        case 131:
        case 132:
        case 133:
        case 135:
          goto LABEL_34;
        case 134:
          CFStringEncoding SystemEncoding = 1057;
          goto LABEL_53;
        case 136:
          CFStringEncoding SystemEncoding = 1059;
          goto LABEL_53;
        default:
          if (v7 != 161) {
            goto LABEL_34;
          }
          CFStringEncoding SystemEncoding = 1283;
          break;
      }
      goto LABEL_53;
    }
    if (!v7) {
      goto LABEL_40;
    }
    if (v7 == 2)
    {
      CFStringEncoding SystemEncoding = 33;
      goto LABEL_53;
    }
    goto LABEL_34;
  }
  if (v7 > 185)
  {
    if (v7 > 221)
    {
      if (v7 == 222)
      {
        CFStringEncoding SystemEncoding = 1053;
        goto LABEL_53;
      }
      if (v7 == 238)
      {
        CFStringEncoding SystemEncoding = 1281;
        goto LABEL_53;
      }
    }
    else
    {
      if (v7 == 186)
      {
        CFStringEncoding SystemEncoding = 1287;
        goto LABEL_53;
      }
      if (v7 == 204)
      {
        CFStringEncoding SystemEncoding = 1282;
        goto LABEL_53;
      }
    }
    goto LABEL_34;
  }
  if (v7 > 176)
  {
    if (v7 == 177)
    {
      CFStringEncoding SystemEncoding = 1285;
      goto LABEL_53;
    }
    if (v7 == 178)
    {
      CFStringEncoding SystemEncoding = 1286;
      goto LABEL_53;
    }
    goto LABEL_34;
  }
  if (v7 == 162)
  {
    CFStringEncoding SystemEncoding = 1284;
    goto LABEL_53;
  }
  if (v7 != 163)
  {
LABEL_34:
    CFStringEncoding SystemEncoding = v7 - 77;
    if ((v7 - 77) <= 0x32) {
      goto LABEL_53;
    }
LABEL_35:
    if (*(_DWORD *)(a1 + 360) >= 0x100u && *(_DWORD *)(a1 + 336) && *(_DWORD *)(result + 36) == -1) {
      goto LABEL_40;
    }
    UInt32 v8 = *(_DWORD *)(result + 36);
    if (v8 != -1)
    {
      if (v8 == 437)
      {
LABEL_40:
        CFStringEncoding SystemEncoding = 1280;
        goto LABEL_53;
      }
      CFStringEncoding SystemEncoding = CFStringConvertWindowsCodepageToEncoding(v8);
      CFStringEncoding v23 = SystemEncoding;
      if (SystemEncoding != -1) {
        goto LABEL_54;
      }
    }
    if (!*(unsigned char *)(a1 + 2809)
      && (double v9 = *(const char **)v4) != 0
      && (!strcmp("GothicBBB", *(const char **)v4) || !strcmp("Ryumin", v9)))
    {
      CFStringEncoding SystemEncoding = 2336;
    }
    else
    {
      if (*(_DWORD *)(a1 + 360) != 2817) {
        goto LABEL_56;
      }
      CFStringEncoding SystemEncoding = 2817;
    }
    goto LABEL_53;
  }
  CFStringEncoding SystemEncoding = 1288;
LABEL_53:
  CFStringEncoding v23 = SystemEncoding;
LABEL_54:
  if (*(uint64_t *)(a1 + 2816) > 0)
  {
    uint64_t v5 = 0;
    goto LABEL_72;
  }
LABEL_56:
  double v10 = *(double *)(a1 + 384);
  if (v10 >= 0.0) {
    [(id)NSDefaultFont() pointSize];
  }
  double v11 = -[NSRTFReader _updateFontSizeForTextScalingIfNeeded:](a1, v10);
  double v12 = v11;
  if (!*(void *)v4 || (uint64_t v5 = (NSFont *)processFontName(*(char **)v4, *(_DWORD *)(a1 + 360), &v23, v11)) == 0)
  {
    int v13 = *(char **)(v4 + 8);
    if (!v13 || (uint64_t v5 = (NSFont *)processFontName(v13, *(_DWORD *)(a1 + 360), &v23, v12)) == 0)
    {
      unsigned int v14 = *(_DWORD *)(v4 + 20) - 1;
      uint64_t v15 = v14 > 5 ? @"Helvetica" : off_1E55C8380[v14];
      uint64_t v5 = +[NSFont fontWithName:v15 size:v12];
      if (!v5
        && (*(_DWORD *)(v4 + 20) != 3
         || (uint64_t v5 = +[UIFont fontWithName:@"Courier New" size:v12]) == 0))
      {
        uint64_t v5 = +[UIFont systemFontOfSize:v12];
        if (!v5)
        {
          uint64_t v5 = (NSFont *)NSDefaultFont();
          if (!v5) {
            raiseRTFException((uint64_t)"Cannot find any font to use");
          }
        }
      }
    }
  }
  CFStringEncoding SystemEncoding = v23;
  if (v23 != -1)
  {
LABEL_72:
    if (CFStringIsEncodingAvailable(SystemEncoding)) {
      goto LABEL_75;
    }
    CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
    if (SystemEncoding != -1) {
      goto LABEL_75;
    }
  }
  CFStringEncoding SystemEncoding = *(_DWORD *)(a1 + 360);
LABEL_75:
  uint64_t v16 = v5;
  if (!v5) {
    uint64_t v16 = (const void *)NSDefaultFont();
  }
  uint64_t result = (uint64_t)CFRetain(v16);
  *(void *)(v4 + 4_Block_object_dispose(&STACK[0x2B0], 8) = result;
  *(_DWORD *)(v4 + 64) = SystemEncoding;
LABEL_78:
  unsigned int v17 = SystemEncoding - 1056;
  int v18 = (SystemEncoding == 1057) << 6;
  if (SystemEncoding == 2336) {
    int v18 = 64;
  }
  if (v17 > 3 || v17 == 1) {
    int v20 = v18;
  }
  else {
    int v20 = 64;
  }
  if (SystemEncoding > 0x19 || ((1 << SystemEncoding) & 0x200000E) == 0) {
    int v22 = v20;
  }
  else {
    int v22 = 64;
  }
  *(_DWORD *)(a1 + 410) = *(_DWORD *)(a1 + 410) & 0xFFFFFFBF | v22;
  *(_DWORD *)(a1 + 36_Block_object_dispose(&STACK[0x2B0], 8) = SystemEncoding;
  *(void *)(a1 + 376) = v5;
  return result;
}

void processMSUnicodeChar(uint64_t a1)
{
  int v2 = *(unsigned __int16 *)(a1 + 2776);
  if (!_NSValidCharacterSet)
  {
    CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetIllegal);
    _NSValidCharacterSet = (uint64_t)CFCharacterSetCreateMutableCopy(0, Predefined);
    CFCharacterSetInvert((CFMutableCharacterSetRef)_NSValidCharacterSet);
  }
  if (v2 == 65533)
  {
    uint64_t v4 = (void *)[(id)a1 mutableAttributes];
    if (![v4 objectForKey:NSGlyphInfoAttributeName]) {
      return;
    }
  }
  else
  {
    if (!CFCharacterSetIsCharacterMember((CFCharacterSetRef)_NSValidCharacterSet, v2)
      && (*(_WORD *)(a1 + 410) & 0x380) != 0)
    {
      return;
    }
    if ((v2 - 8234) <= 4)
    {
      flushCharacters(a1, 1);
      int v5 = *(unsigned __int16 *)(a1 + 2776);
      uint64_t v6 = objc_msgSend((id)objc_msgSend((id)a1, "mutableAttributes"), "objectForKey:", @"NSWritingDirection");
      int v7 = v6;
      uint64_t v8 = 0;
      switch(v5)
      {
        case 8234:
          goto LABEL_21;
        case 8235:
          uint64_t v8 = 1;
          goto LABEL_21;
        case 8236:
          if (!v6 || (unint64_t)objc_msgSend(v6, "count", 0) < 2) {
            goto LABEL_29;
          }
          uint64_t v10 = objc_msgSend(v7, "subarrayWithRange:", 0, objc_msgSend(v7, "count") - 1);
          goto LABEL_26;
        case 8237:
          uint64_t v8 = 2;
          goto LABEL_21;
        case 8238:
          uint64_t v8 = 3;
LABEL_21:
          uint64_t v11 = [NSNumber numberWithUnsignedInteger:v8];
          if (!v11) {
            goto LABEL_27;
          }
          uint64_t v12 = v11;
          if (v7 && [v7 count]) {
            uint64_t v10 = [v7 arrayByAddingObject:v12];
          }
          else {
            uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObject:v12];
          }
LABEL_26:
          int v7 = (void *)v10;
LABEL_27:
          if (v7)
          {
            objc_msgSend((id)objc_msgSend((id)a1, "mutableAttributes", v8), "setObject:forKey:", v7, @"NSWritingDirection");
            int v13 = (unsigned int *)(a1 + 410);
            unsigned int v14 = *(_DWORD *)(a1 + 410) | 0x10000;
          }
          else
          {
LABEL_29:
            objc_msgSend((id)objc_msgSend((id)a1, "mutableAttributes", v8), "removeObjectForKey:", @"NSWritingDirection");
            int v13 = (unsigned int *)(a1 + 410);
            unsigned int v14 = *(_DWORD *)(a1 + 410) & 0xFFFEFFFF;
          }
          *int v13 = v14;
          break;
        default:
          goto LABEL_27;
      }
      goto LABEL_31;
    }
  }
  if (!*(unsigned char *)(a1 + 2808)) {
    flushCharacters(a1, 1);
  }
  uint64_t v9 = *(void *)(a1 + 328);
  *(void *)(a1 + 32_Block_object_dispose(&STACK[0x2B0], 8) = v9 + 1;
  *(_WORD *)(a1 + 2 * v9 + 72) = v2;
  *(unsigned char *)(a1 + 280_Block_object_dispose(&STACK[0x2B0], 8) = 1;
  if (*(void *)(a1 + 328) >= 0x80uLL) {
    flushCharacters(a1, 1);
  }
LABEL_31:
  unint64_t v15 = ((unint64_t)*(unsigned int *)(a1 + 410) >> 7) & 7;
  if (v15)
  {
    do
    {
      if (_NSRTFGetToken((_DWORD *)(a1 + 536)) != 2) {
        break;
      }
      v15 -= *(_DWORD *)(a1 + 2768) != 32;
    }
    while (v15);
    if (*(_DWORD *)(a1 + 2764) != 2)
    {
      _NSRTFUngetToken(a1 + 536);
    }
  }
}

void *readFontPaletteColors(_DWORD *a1)
{
  int v2 = a1 + 134;
  _NSRTFGetToken(a1 + 134);
  if (a1[692] == 30)
  {
    uint64_t v3 = 0;
    do
    {
      if (!a1[693])
      {
        unint64_t v4 = a1[694];
        if ((int)v4 >= 1)
        {
          uint64_t v5 = [NSNumber numberWithInteger:v4 >> 16];
          Color = (void *)getColor((uint64_t)a1, *((unsigned __int16 *)a1 + 1388));
          if (Color)
          {
            int v7 = Color;
            if (!v3) {
              uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
            }
            objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v7, "CGColor"), v5);
          }
        }
      }
      _NSRTFGetToken(v2);
    }
    while (a1[692] == 30);
  }
  else
  {
    uint64_t v3 = 0;
  }
  _NSRTFUngetToken((uint64_t)v2);
  return v3;
}

void *readTypographyFeatures(_DWORD *a1)
{
  int v2 = a1 + 134;
  _NSRTFGetToken(a1 + 134);
  if (a1[692] == 26)
  {
    uint64_t v3 = 0;
    uint64_t v4 = *MEMORY[0x1E4F24558];
    uint64_t v5 = *MEMORY[0x1E4F24548];
    do
    {
      if (!a1[693])
      {
        unint64_t v6 = a1[694];
        if ((int)v6 >= 1)
        {
          uint64_t v7 = [NSNumber numberWithInteger:v6 >> 16];
          uint64_t v8 = [NSNumber numberWithInteger:*((unsigned __int16 *)a1 + 1388)];
          if (!v3) {
            uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
          }
          uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, v4, v8, v5, 0);
          [v3 addObject:v9];
        }
      }
      _NSRTFGetToken(v2);
    }
    while (a1[692] == 26);
  }
  else
  {
    uint64_t v3 = 0;
  }
  _NSRTFUngetToken((uint64_t)v2);
  return v3;
}

id processFontName(char *cStr, CFStringEncoding a2, CFStringEncoding *a3, double a4)
{
  CFStringEncoding v8 = *a3;
  if (*a3 == -1 || (CFStringRef v9 = CFStringCreateWithCString(0, cStr, *a3)) == 0)
  {
    id v11 = 0;
  }
  else
  {
    CFStringRef v10 = v9;
    id v11 = +[UIFont _fontWithName:v9 size:a4];
    CFRelease(v10);
  }
  if (a2 != -1 && !v11)
  {
    if (v8 == a2 || (CFStringRef v12 = CFStringCreateWithCString(0, cStr, a2)) == 0)
    {
      id v11 = 0;
    }
    else
    {
      CFStringRef v13 = v12;
      id v11 = +[UIFont _fontWithName:v12 size:a4];
      CFRelease(v13);
    }
  }
  *a3 = v8;
  return v11;
}

CGImageSource *NSEmojiImageSourceCreateWithData(const __CFData *a1, void *a2, void *a3)
{
  uint64_t v5 = CGImageSourceCreateWithData(a1, 0);
  unint64_t v6 = v5;
  if (v5)
  {
    if (!CGImageSourceGetCount(v5)) {
      goto LABEL_4;
    }
    CFDictionaryRef v7 = CGImageSourceCopyPropertiesAtIndex(v6, 0, 0);
    CFStringEncoding v8 = [(__CFDictionary *)v7 objectForKeyedSubscript:*MEMORY[0x1E4F2FD40]];
    id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F2FD48]];
    *a2 = v9;
    *a3 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F2FD58]];

    if (!v9)
    {
LABEL_4:
      CFRelease(v6);
      id v9 = 0;
      unint64_t v6 = 0;
    }
  }
  return v6;
}

void *NSEmojiImageSourceCopyImageStrikes(CGImageSource *a1)
{
  size_t Count = CGImageSourceGetCount(a1);
  uint64_t v3 = objc_opt_new();
  size_t v22 = Count;
  if (Count)
  {
    size_t v4 = 0;
    uint64_t v21 = *MEMORY[0x1E4F2FD40];
    double v5 = *MEMORY[0x1E4F1DB30];
    double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    uint64_t v7 = *MEMORY[0x1E4F2FDA0];
    uint64_t v8 = *MEMORY[0x1E4F2FDB0];
    do
    {
      ImageAtIndedouble x = CGImageSourceCreateImageAtIndex(a1, v4, 0);
      CFDictionaryRef v10 = CGImageSourceCopyPropertiesAtIndex(a1, v4, 0);
      id v11 = [(__CFDictionary *)v10 objectForKeyedSubscript:v21];
      CFStringRef v12 = [v11 objectForKeyedSubscript:v7];
      CFStringRef v13 = v12;
      double v14 = v5;
      if (v12)
      {
        [v12 doubleValue];
        double v14 = v15;
      }
      uint64_t v16 = objc_msgSend(v11, "objectForKeyedSubscript:", v8, v21);

      double v17 = v6;
      if (v16)
      {
        [v16 doubleValue];
        double v17 = v18;
      }
      CGColorSpaceRef v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F24380]), "initWithImage:alignmentInset:", ImageAtIndex, v14, v17);
      [v3 addObject:v19];
      CGImageRelease(ImageAtIndex);

      ++v4;
    }
    while (v22 != v4);
  }
  return v3;
}

uint64_t NSEmojiImageSourceGetImageIndex(CGImageSource *a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6)
{
  v43[1] = *MEMORY[0x1E4F143B8];
  size_t Count = CGImageSourceGetCount(a1);
  if (!Count)
  {
    CFDictionaryRef v13 = 0;
    goto LABEL_23;
  }
  size_t v12 = Count;
  *(void *)&long long v40 = a2;
  *((void *)&v40 + 1) = a3;
  CFDictionaryRef v13 = 0;
  size_t v14 = 0;
  uint64_t v15 = 0;
  double v16 = ceil(a5 * a6);
  uint64_t v17 = *MEMORY[0x1E4F2FCE8];
  double v18 = 0.0;
  uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    CFDictionaryRef v20 = CGImageSourceCopyPropertiesAtIndex(a1, v14, 0);
    uint64_t v21 = [(__CFDictionary *)v20 objectForKeyedSubscript:v17];
    size_t v22 = v21;
    if (!v21) {
      goto LABEL_14;
    }
    [v21 doubleValue];
    double v24 = v23;
    if (v23 < v16)
    {
      if (v18 == 0.0)
      {
        uint64_t v25 = v15;
      }
      else
      {
        uint64_t v25 = v15;
        if (v15 & 1 | (v23 <= v18)) {
          goto LABEL_14;
        }
      }
LABEL_13:
      CFDictionaryRef v26 = v20;

      uint64_t v15 = v25;
      double v18 = v24;
      CFDictionaryRef v13 = v26;
      uint64_t v19 = v14;
      goto LABEL_14;
    }
    uint64_t v25 = 1;
    if (v18 == 0.0 || ((v15 ^ 1) & 1) != 0 || v23 < v18) {
      goto LABEL_13;
    }
LABEL_14:

    ++v14;
  }
  while (v12 != v14);
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_23:
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_24;
  }
  if (v40 == 0) {
    goto LABEL_24;
  }
  int v27 = [(__CFDictionary *)v13 objectForKeyedSubscript:*MEMORY[0x1E4F2FD00]];
  unsigned int v28 = v27;
  double v29 = v18;
  if (v27) {
    objc_msgSend(v27, "doubleValue", v18);
  }
  double v30 = 1.0;
  if (v18 <= a5)
  {
    a5 = v18;
    if (!(void)v40) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  double v30 = a5 / v18;
  double v29 = a5 / v18 * v29;
  if ((void)v40)
  {
LABEL_26:
    *(double *)long long v40 = v29;
    *(double *)(v40 + _Block_object_dispose(&STACK[0x2B0], 8) = a5;
  }
LABEL_27:
  if (*((void *)&v40 + 1))
  {
    int v32 = -[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F2FD40], v29);
    uint64_t v33 = (double *)MEMORY[0x1E4F1DAD8];
    int v34 = [v32 objectForKeyedSubscript:*MEMORY[0x1E4F2FDA0]];

    if (v34)
    {
      [v34 doubleValue];
      double v36 = floor(v35 * v30 + 0.5);
    }
    else
    {
      double v36 = *v33;
    }
    unsigned int v28 = [v32 objectForKeyedSubscript:*MEMORY[0x1E4F2FDB0]];

    if (v28)
    {
      [v28 doubleValue];
      double v38 = -floor(v37 * v30 + 0.5);
    }
    else
    {
      double v38 = v33[1];
    }
    double v42 = @"NSEmojiImagePropertyKeyOrigin";
    *(double *)uint64_t v41 = v36;
    *(double *)&v41[1] = v38;
    int v39 = [MEMORY[0x1E4F29238] valueWithBytes:v41 objCType:"{CGPoint=dd}"];
    v43[0] = v39;
    **((void **)&v40 + 1) = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
  }
LABEL_24:

  return v19;
}

double _NSRTFInit(uint64_t a1)
{
  *(unsigned char *)(a1 + 60) = 0;
  *(unsigned char *)(a1 + 1200) = 0;
  int v2 = *(void **)(a1 + 1120);
  if (v2) {
    NSZoneFree(0, v2);
  }
  uint64_t v3 = *(void **)(a1 + 1128);
  if (v3) {
    NSZoneFree(0, v3);
  }
  *(_OWORD *)(a1 + 1152) = 0u;
  *(_OWORD *)(a1 + 116_Block_object_dispose(&STACK[0x2B0], 8) = 0u;
  *(_OWORD *)(a1 + 1120) = 0u;
  *(_OWORD *)(a1 + 1136) = 0u;
  for (uint64_t i = *(void *)(a1 + 1096); i; *(void *)(a1 + 1096) = i)
  {
    uint64_t v5 = i;
    uint64_t i = *(void *)(i + 40);
    double v6 = *(const void **)(v5 + 48);
    if (v6)
    {
      CFRelease(v6);
      uint64_t v5 = *(void *)(a1 + 1096);
    }
    if (*(void *)v5)
    {
      NSZoneFree(0, *(void **)v5);
      uint64_t v5 = *(void *)(a1 + 1096);
      if (!v5) {
        continue;
      }
    }
    NSZoneFree(0, (void *)v5);
  }
  for (uint64_t j = *(void *)(a1 + 1104); j; *(void *)(a1 + 1104) = j)
  {
    uint64_t v8 = j;
    uint64_t j = *(void *)(j + 16);
    id v9 = *(const void **)(v8 + 24);
    if (v9)
    {
      CFRelease(v9);
      uint64_t v8 = *(void *)(a1 + 1104);
    }
    if (*(void *)(v8 + 32))
    {
      NSZoneFree(0, *(void **)(v8 + 32));
      uint64_t v8 = *(void *)(a1 + 1104);
      if (!v8) {
        continue;
      }
    }
    NSZoneFree(0, (void *)v8);
  }
  for (uint64_t k = *(void *)(a1 + 1112); k; *(void *)(a1 + 1112) = k)
  {
    uint64_t v11 = k;
    uint64_t k = *(void *)(k + 64);
    size_t v12 = *(void **)(v11 + 48);
    if (v12)
    {
      do
      {
        CFDictionaryRef v13 = (void *)v12[2];
        size_t v14 = (void *)v12[3];
        if (v13) {
          NSZoneFree(0, v13);
        }
        NSZoneFree(0, v12);
        size_t v12 = v14;
      }
      while (v14);
      uint64_t v11 = *(void *)(a1 + 1112);
    }
    if (*(void *)v11)
    {
      NSZoneFree(0, *(void **)v11);
      uint64_t v11 = *(void *)(a1 + 1112);
      if (!v11) {
        continue;
      }
    }
    NSZoneFree(0, (void *)v11);
  }
  *(_DWORD *)(a1 + 222_Block_object_dispose(&STACK[0x2B0], 8) = -1;
  *(void *)(a1 + 40) = -1;
  double result = 0.0;
  *(_OWORD *)(a1 + 224_Block_object_dispose(&STACK[0x2B0], 8) = 0u;
  *(void *)(a1 + 1084) = 0xFFFFFFFFLL;
  *(void *)(a1 + 1184) = DefaultMsgProc;
  *(void *)(a1 + 1192) = DefaultPanicProc;
  return result;
}

uint64_t _NSRTFSetClassCallback(uint64_t result, unint64_t a2, uint64_t a3)
{
  if (a2 <= 4) {
    *(void *)(result + 8 * a2 + 1136) = a3;
  }
  return result;
}

void *_NSRTFSetInput(void *result, uint64_t a2, uint64_t a3)
{
  result[1] = a2;
  result[2] = a3;
  result[3] = 0;
  result[4] = 0;
  return result;
}

char *_NSRTFStrSave(const char *a1)
{
  NSUInteger v2 = strlen(a1) + 1;
  uint64_t v3 = (char *)NSZoneMalloc(0, v2);
  size_t v4 = v3;
  if (v3) {
    strlcpy(v3, a1, v2);
  }
  return v4;
}

uint64_t _NSRTFPanic(uint64_t a1, char *__format, ...)
{
  va_start(va, __format);
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  vsnprintf(__str, 0x400uLL, __format, va);
  __strlcat_chk();
  return (*(uint64_t (**)(char *))(a1 + 1192))(__str);
}

uint64_t _NSRTFGetToken(_DWORD *a1)
{
  _RTFGetToken((uint64_t)a1);
  int v2 = a1[557];
  if (v2 == 2)
  {
    while (1)
    {
      unsigned int v3 = a1[558];
      BOOL v4 = v3 > 0xD;
      int v5 = (1 << v3) & 0x2401;
      if (v4 || v5 == 0) {
        break;
      }
      _RTFGetToken((uint64_t)a1);
      int v2 = a1[557];
      if (v2 != 2) {
        goto LABEL_9;
      }
    }
    int v2 = 2;
  }
LABEL_9:
  int v7 = a1[566];
  if (v7 == 2)
  {
    if (!v2) {
      return v2;
    }
    goto LABEL_23;
  }
  if (v7 != 1)
  {
    if (!v7 && v2 == 1 && !a1[558])
    {
      int v8 = 1;
LABEL_24:
      a1[566] = v8;
      return v2;
    }
    return v2;
  }
  if (a1[559] == 52 && v2 == 3 && a1[558] == 6)
  {
    int v8 = 2;
    goto LABEL_24;
  }
  if (v2 != 1 || a1[558])
  {
LABEL_23:
    int v8 = 0;
    goto LABEL_24;
  }
  return v2;
}

uint64_t _NSRTFRouteToken(uint64_t result)
{
  uint64_t v1 = result;
  unsigned int v2 = *(_DWORD *)(result + 2228);
  if (v2 >= 5)
  {
    double result = _NSRTFPanic(result, "Unknown class %ld: %s (reader malfunction)", *(unsigned int *)(result + 2228), (const char *)(result + 1200));
    unsigned int v2 = *(_DWORD *)(v1 + 2228);
  }
  uint64_t v3 = (int)v2;
  if (v2 == 3)
  {
    if (*(_DWORD *)(v1 + 2232) == 3)
    {
      uint64_t v4 = *(int *)(v1 + 2236);
      int v5 = ReadFontTbl;
      if (v4 > 43)
      {
        switch(v4)
        {
          case ',':
            int v5 = (uint64_t (*)(uint64_t))ReadPictGroup;
            goto LABEL_21;
          case '-':
            int v5 = (uint64_t (*)(uint64_t))ReadObjGroup;
            goto LABEL_21;
          case '[':
            int v5 = ReadExpandedColorTbl;
            goto LABEL_21;
        }
      }
      else
      {
        if (!*(_DWORD *)(v1 + 2236))
        {
LABEL_21:
          double v6 = v5;
          uint64_t v7 = v1;
          goto LABEL_22;
        }
        if (v4 == 6)
        {
          int v5 = ReadColorTbl;
          goto LABEL_21;
        }
        if (v4 == 7)
        {
          int v5 = ReadStyleSheet;
          goto LABEL_21;
        }
      }
    }
  }
  else if (v2 > 4)
  {
    return result;
  }
  double v6 = *(uint64_t (**)(uint64_t))(v1 + 8 * v3 + 1136);
  if (!v6) {
    return result;
  }
  uint64_t v7 = *(void *)v1;
LABEL_22:

  return v6(v7);
}

uint64_t _NSRTFSkipGroup(_DWORD *a1)
{
  uint64_t result = _NSRTFGetToken(a1);
  if (result != 4)
  {
    uint64_t v3 = 1;
    do
    {
      if (a1[557] == 1)
      {
        int v4 = a1[558];
        if (v4 == 1)
        {
          if (v3 < 2) {
            return result;
          }
          --v3;
        }
        else if (!v4)
        {
          ++v3;
        }
      }
      uint64_t result = _NSRTFGetToken(a1);
    }
    while (result != 4);
  }
  return result;
}

uint64_t _RTFGetToken(uint64_t result)
{
  uint64_t v1 = result;
  int v2 = *(_DWORD *)(result + 44);
  if ((v2 & 0x80000000) == 0)
  {
    *(_DWORD *)(result + 222_Block_object_dispose(&STACK[0x2B0], 8) = v2;
    *(void *)(result + 2232) = *(void *)(result + 48);
    *(_DWORD *)(result + 2240) = *(_DWORD *)(result + 56);
    __strlcpy_chk();
    uint64_t result = strlen((const char *)(v1 + 1200));
    *(_DWORD *)(v1 + 2224) = result;
    *(_DWORD *)(v1 + 44) = -1;
    return result;
  }
  uint64_t v3 = (_DWORD *)(result + 2228);
  *(_DWORD *)(result + 2240) = -1000000;
  *(_OWORD *)(result + 2224) = 0u;
  *(unsigned char *)(result + 1200) = 0;
  uint64_t v4 = *(int *)(result + 40);
  if (v4 == -1)
  {
    unint64_t v5 = *(void *)(result + 24);
    if (v5 >= *(void *)(result + 16))
    {
      _DWORD *v3 = 4;
      return result;
    }
    uint64_t v6 = *(void *)(result + 8);
    *(void *)(result + 24) = v5 + 1;
    uint64_t v4 = *(unsigned __int8 *)(v6 + v5);
    *(_DWORD *)(result + 2224) = 1;
    *(_WORD *)(result + 1200) = v4;
  }
  else
  {
    *(_DWORD *)(result + 2224) = 1;
    *(unsigned char *)(result + 1200) = v4;
    *(unsigned char *)(result + 1201) = 0;
    *(_DWORD *)(result + 40) = -1;
  }
  if (v4 > 122)
  {
    if (v4 == 125)
    {
      uint64_t v12 = 0x100000001;
    }
    else
    {
      if (v4 != 123) {
        goto LABEL_22;
      }
      uint64_t v12 = 1;
    }
    *(void *)uint64_t v3 = v12;
    return result;
  }
  if (v4 == 9)
  {
    *(void *)uint64_t v3 = 0x600000003;
    int v13 = 37;
    goto LABEL_19;
  }
  if (v4 != 92)
  {
LABEL_22:
    *(_DWORD *)(result + 222_Block_object_dispose(&STACK[0x2B0], 8) = 2;
    *(_DWORD *)(result + 2232) = v4;
    return result;
  }
  unint64_t v7 = *(void *)(result + 24);
  if (v7 >= *(void *)(result + 16)) {
    return result;
  }
  uint64_t v8 = *(void *)(result + 8);
  *(void *)(result + 24) = v7 + 1;
  int v9 = *(char *)(v8 + v7);
  uint64_t v10 = v9;
  *(_DWORD *)(result + 2224) = 2;
  *(_WORD *)(result + 1201) = v9;
  int v11 = v9;
  if (v9 < 0) {
    uint64_t result = __maskrune(v9, 0x100uLL);
  }
  else {
    uint64_t result = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v9 + 60) & 0x100;
  }
  if (!result)
  {
    if (v10 > 122)
    {
      switch(v10)
      {
        case '{':
        case '}':
          goto LABEL_48;
        case '|':
        case '~':
          goto LABEL_49;
        default:
          return result;
      }
      return result;
    }
    char v19 = v10 - 39;
    if ((unint64_t)(v10 - 39) <= 0x38)
    {
      if (((1 << v19) & 0x100000000000048) != 0)
      {
LABEL_49:
        *(void *)uint64_t v3 = 0x600000003;
        if (v10 <= 94)
        {
          if (v10 == 42)
          {
            int v13 = 52;
          }
          else
          {
            if (v10 != 45) {
              return result;
            }
            int v13 = 50;
          }
        }
        else
        {
          switch(v10)
          {
            case '_':
              int v13 = 51;
              break;
            case '|':
              int v13 = 47;
              break;
            case '~':
              int v13 = 49;
              break;
            default:
              return result;
          }
        }
        goto LABEL_19;
      }
      if (((1 << v19) & 0x20000000080000) != 0)
      {
LABEL_48:
        *(_DWORD *)(v1 + 222_Block_object_dispose(&STACK[0x2B0], 8) = 2;
        *(_DWORD *)(v1 + 2232) = v11;
        return result;
      }
      if (v10 == 39)
      {
        uint64_t result = GetChar(v1);
        if (result != -1)
        {
          char v20 = result;
          uint64_t result = GetChar(v1);
          if (result != -1)
          {
            char v21 = result;
            *(_DWORD *)(v1 + 222_Block_object_dispose(&STACK[0x2B0], 8) = 2;
            int v22 = RTFCharToHex(v20);
            uint64_t result = RTFCharToHex(v21);
            *(_DWORD *)(v1 + 2232) = result + 16 * v22;
          }
        }
        return result;
      }
    }
    if (v10 != 10 && v10 != 13) {
      return result;
    }
    *(void *)uint64_t v3 = 0x600000003;
    int v13 = 28;
LABEL_19:
    *(_DWORD *)(v1 + 2236) = v13;
    return result;
  }
  uint64_t v14 = MEMORY[0x1E4F14390];
  if ((v10 & 0x80) == 0) {
    goto LABEL_28;
  }
LABEL_26:
  if (__maskrune(v10, 0x100uLL))
  {
    while (1)
    {
      unint64_t v15 = *(void *)(v1 + 24);
      if (v15 >= *(void *)(v1 + 16)) {
        break;
      }
      uint64_t v16 = *(int *)(v1 + 2224);
      if ((int)v16 > 1022) {
        break;
      }
      uint64_t v17 = *(void *)(v1 + 8);
      *(void *)(v1 + 24) = v15 + 1;
      uint64_t v10 = *(unsigned __int8 *)(v17 + v15);
      *(_DWORD *)(v1 + 2224) = v16 + 1;
      uint64_t v18 = v1 + 1200;
      *(unsigned char *)(v18 + v16) = v10;
      *(unsigned char *)(v18 + *(int *)(v1 + 2224)) = 0;
      if ((v10 & 0x80) != 0) {
        goto LABEL_26;
      }
LABEL_28:
      if ((*(_DWORD *)(v14 + 4 * v10 + 60) & 0x100) == 0) {
        goto LABEL_44;
      }
    }
    return Lookup(v1, (char *)(v1 + 1200));
  }
  else
  {
LABEL_44:
    *(unsigned char *)(*(int *)(v1 + 2224) + v1 + 1200 - 1) = 0;
    uint64_t result = Lookup(v1, (char *)(v1 + 1200));
    *(unsigned char *)(*(int *)(v1 + 2224) + v1 + 1200 - 1) = v10;
    if (v10 == 45)
    {
      uint64_t result = GetChar(v1);
      if (result == -1) {
        return result;
      }
      uint64_t v10 = result;
      int v23 = -1;
    }
    else
    {
      int v23 = 1;
    }
    if ((v10 - 48) <= 9)
    {
      *(_DWORD *)(v1 + 2240) = 0;
      while (1)
      {
        int v24 = v10 + 10 * *(_DWORD *)(v1 + 2240) - 48;
        *(_DWORD *)(v1 + 2240) = v24;
        unint64_t v25 = *(void *)(v1 + 24);
        if (v25 >= *(void *)(v1 + 16)) {
          break;
        }
        uint64_t v26 = *(int *)(v1 + 2224);
        if ((int)v26 > 1022) {
          break;
        }
        uint64_t v27 = *(void *)(v1 + 8);
        *(void *)(v1 + 24) = v25 + 1;
        uint64_t v10 = *(unsigned __int8 *)(v27 + v25);
        *(_DWORD *)(v1 + 2224) = v26 + 1;
        uint64_t v28 = v1 + 1200;
        *(unsigned char *)(v28 + v26) = v10;
        *(unsigned char *)(v28 + *(int *)(v1 + 2224)) = 0;
        if ((v10 - 48) >= 0xA)
        {
          int v24 = *(_DWORD *)(v1 + 2240);
          goto LABEL_68;
        }
      }
      uint64_t v10 = -1;
LABEL_68:
      *(_DWORD *)(v1 + 2240) = v24 * v23;
    }
    if (v10 != -1)
    {
      if (v10 != 32) {
        *(_DWORD *)(v1 + 40) = v10;
      }
      uint64_t v29 = *(int *)(v1 + 2224) - 1;
      *(_DWORD *)(v1 + 2224) = v29;
      *(unsigned char *)(v1 + v29 + 1200) = 0;
    }
  }
  return result;
}

uint64_t _NSRTFUngetToken(uint64_t a1)
{
  if ((*(_DWORD *)(a1 + 44) & 0x80000000) == 0) {
    _NSRTFPanic(a1, "cannot unget two tokens");
  }
  int v2 = *(_DWORD *)(a1 + 2228);
  if (v2 < 0)
  {
    _NSRTFPanic(a1, "no token to unget");
    int v2 = *(_DWORD *)(a1 + 2228);
  }
  *(_DWORD *)(a1 + 44) = v2;
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x2B0], 8) = *(void *)(a1 + 2232);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a1 + 2240);

  return __strlcpy_chk();
}

uint64_t _NSRTFGetFont(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 1096);
  if (a2 != -1 && result)
  {
    do
    {
      if (*(_DWORD *)(result + 16) == a2) {
        break;
      }
      uint64_t result = *(void *)(result + 40);
    }
    while (result);
  }
  return result;
}

uint64_t _NSRTFGetColor(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 1104);
  if (a2 != -1 && result)
  {
    do
    {
      if (*(_DWORD *)result == a2) {
        break;
      }
      uint64_t result = *(void *)(result + 16);
    }
    while (result);
  }
  return result;
}

uint64_t _NSRTFMsg(uint64_t a1, char *__format, ...)
{
  va_start(va, __format);
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  vsnprintf(__str, 0x400uLL, __format, va);
  return (*(uint64_t (**)(char *))(a1 + 1184))(__str);
}

uint64_t _NSRTFSetPanicProc(uint64_t result, uint64_t a2)
{
  *(void *)(result + 1192) = a2;
  return result;
}

uint64_t ReadFontTbl(uint64_t a1)
{
  int v2 = 0;
  uint64_t v3 = (const char *)(a1 + 1200);
  uint64_t v4 = -1;
  *(void *)&v21[1] = *MEMORY[0x1E4F143B8];
  do
  {
    _NSRTFGetToken((_DWORD *)a1);
    int v5 = *(_DWORD *)(a1 + 2228);
    if (v4 != -1) {
      goto LABEL_3;
    }
    if (v5 != 2) {
      goto LABEL_11;
    }
    unsigned int v6 = *(_DWORD *)(a1 + 2232);
    if (v6 == 59)
    {
      _NSRTFGetToken((_DWORD *)a1);
      int v5 = *(_DWORD *)(a1 + 2228);
LABEL_3:
      if (v5 != 2) {
        goto LABEL_11;
      }
      unsigned int v6 = *(_DWORD *)(a1 + 2232);
    }
    int v7 = 0;
    int v5 = 2;
    if (v6 > 0x20 || ((1 << v6) & 0x100002600) == 0) {
      goto LABEL_14;
    }
    _NSRTFGetToken((_DWORD *)a1);
    int v5 = *(_DWORD *)(a1 + 2228);
LABEL_11:
    if (v5 == 1)
    {
      if (*(_DWORD *)(a1 + 2232) == 1) {
        break;
      }
      int v5 = 1;
      int v7 = 1;
LABEL_14:
      if ((v4 & 0x8000000000000000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_18;
    }
    int v7 = 0;
    if ((v4 & 0x8000000000000000) == 0)
    {
LABEL_15:
      if (!v4) {
        goto LABEL_25;
      }
      int v8 = 0;
      goto LABEL_33;
    }
LABEL_18:
    if (v5 != 3)
    {
      if (!v7 || *(_DWORD *)(a1 + 2232))
      {
LABEL_24:
        _NSRTFPanic(a1, "%s: Cannot determine format", "ReadFontTbl");
        int v8 = 0;
        uint64_t v4 = -1;
        goto LABEL_33;
      }
LABEL_25:
      if (v5 == 2)
      {
        unsigned int v9 = *(_DWORD *)(a1 + 2232);
        if (v9 > 0x20 || ((1 << v9) & 0x100002600) == 0)
        {
LABEL_31:
          _NSRTFPanic(a1, "%s: missing \"{\"", "ReadFontTbl");
LABEL_32:
          _NSRTFGetToken((_DWORD *)a1);
          uint64_t v4 = 0;
          int v8 = 1;
          goto LABEL_33;
        }
        _NSRTFGetToken((_DWORD *)a1);
        int v5 = *(_DWORD *)(a1 + 2228);
      }
      if (v5 == 1 && !*(_DWORD *)(a1 + 2232)) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
    if (*(_DWORD *)(a1 + 2232) != 12 || *(_DWORD *)(a1 + 2236) != 10) {
      goto LABEL_24;
    }
    int v8 = 0;
    uint64_t v4 = 1;
LABEL_33:
    int v2 = NSZoneMalloc(0, 0x48uLL);
    if (!v2) {
      _NSRTFPanic(a1, "%s: cannot allocate font entry", "ReadFontTbl");
    }
    v2[5] = *(void *)(a1 + 1096);
    *(void *)(a1 + 1096) = v2;
    void *v2 = 0;
    v2[1] = 0;
    *(void *)&long long v10 = 0xFFFFFFFFLL;
    *((void *)&v10 + 1) = 0xFFFFFFFFLL;
    *((_OWORD *)v2 + 1) = v10;
    v2[4] = 0xFFFFFFFF00000000;
    v2[6] = 0;
    *((_DWORD *)v2 + 16) = -1;
    while (1)
    {
      int v11 = *(_DWORD *)(a1 + 2228);
      if (v11 == 4) {
        break;
      }
      if (v11 == 1)
      {
        int v12 = *(_DWORD *)(a1 + 2232);
        if (v12 == 1) {
          goto LABEL_77;
        }
        if (v11 == 3) {
          goto LABEL_45;
        }
        if (!v12)
        {
          _NSRTFSkipGroup((_DWORD *)a1);
          goto LABEL_75;
        }
        if (v11 != 2)
        {
LABEL_63:
          _NSRTFMsg(a1, "%s: unknown token \"%s\"\n", "ReadFontTbl", v3);
          goto LABEL_75;
        }
LABEL_52:
        uint64_t v13 = 0;
        while (1)
        {
          uint64_t v14 = *(int *)(a1 + 2228);
          if (v14 == 4) {
            break;
          }
          if (v14 == 1)
          {
            unsigned int v15 = *(_DWORD *)(a1 + 2232);
            if (v15 < 2) {
              break;
            }
          }
          else if (v14 == 2)
          {
            unsigned int v15 = *(_DWORD *)(a1 + 2232);
            if (v15 == 59) {
              break;
            }
          }
          else
          {
            unsigned int v15 = *(_DWORD *)(a1 + 2232);
          }
          uint64_t v16 = v13 + 1;
          v20[v13] = v15;
          _NSRTFGetToken((_DWORD *)a1);
          uint64_t v13 = v16;
          if (v16 == 1023)
          {
            uint64_t v17 = v21;
            goto LABEL_65;
          }
        }
        uint64_t v17 = &v20[v13];
LABEL_65:
        *uint64_t v17 = 0;
        uint64_t v18 = _NSRTFStrSave(v20);
        void *v2 = v18;
        if (!v18) {
          _NSRTFPanic(a1, "%s: cannot allocate font name", "ReadFontTbl");
        }
      }
      else
      {
        if (v11 == 2 && *(_DWORD *)(a1 + 2232) == 59) {
          goto LABEL_77;
        }
        if (v11 == 2) {
          goto LABEL_52;
        }
        if (v11 != 3) {
          goto LABEL_63;
        }
        int v12 = *(_DWORD *)(a1 + 2232);
LABEL_45:
        switch(v12)
        {
          case 4:
            goto LABEL_70;
          case 12:
            if (*(_DWORD *)(a1 + 2236) == 10) {
              *((_DWORD *)v2 + 4) = *(_DWORD *)(a1 + 2240);
            }
            break;
          case 23:
            switch(*(_DWORD *)(a1 + 2236))
            {
              case 0:
                *((_DWORD *)v2 + 6) = *(_DWORD *)(a1 + 2240);
                break;
              case 1:
                *((_DWORD *)v2 + 7) = *(_DWORD *)(a1 + 2240);
                break;
              case 2:
                *((_DWORD *)v2 + 9) = *(_DWORD *)(a1 + 2240);
                break;
              case 3:
              case 4:
                *((_DWORD *)v2 + _Block_object_dispose(&STACK[0x2B0], 8) = *(_DWORD *)(a1 + 2240);
                break;
              default:
                goto LABEL_75;
            }
            break;
          default:
            _NSRTFMsg(a1, "%s: unknown token \"%s\"\n", "ReadFontTbl", v3);
LABEL_70:
            *((_DWORD *)v2 + 5) = *(_DWORD *)(a1 + 2236);
            break;
        }
LABEL_75:
        _NSRTFGetToken((_DWORD *)a1);
      }
    }
    int v11 = 4;
LABEL_77:
    if (v8)
    {
      if (v11 == 1 && *(_DWORD *)(a1 + 2232) == 1
        || (_NSRTFGetToken((_DWORD *)a1), *(_DWORD *)(a1 + 2228) == 1) && *(_DWORD *)(a1 + 2232) == 1)
      {
        int v11 = 1;
      }
      else
      {
        _NSRTFPanic(a1, "%s: missing \"}\"", "ReadFontTbl");
        int v11 = *(_DWORD *)(a1 + 2228);
      }
    }
  }
  while (v11 != 4);
  if (v2 && *((_DWORD *)v2 + 4) == -1) {
    _NSRTFPanic(a1, "%s: missing font number", "ReadFontTbl");
  }
  *(void *)(a1 + 32) = *(void *)(a1 + 24);
  return _NSRTFRouteToken(a1);
}

uint64_t ReadColorTbl(uint64_t a1)
{
  uint64_t v2 = 0;
  uint64_t v3 = *(void *)(a1 + 1104);
  while (1)
  {
    _NSRTFGetToken((_DWORD *)a1);
    int v4 = *(_DWORD *)(a1 + 2228);
    if (v4 != 2) {
      break;
    }
    unsigned int v5 = *(_DWORD *)(a1 + 2232);
    BOOL v6 = v5 > 0x20;
    uint64_t v7 = (1 << v5) & 0x100002600;
    if (!v6 && v7 != 0)
    {
      _NSRTFGetToken((_DWORD *)a1);
      int v4 = *(_DWORD *)(a1 + 2228);
      break;
    }
LABEL_10:
    if (v3 && (unsigned int v9 = *(void **)(a1 + 1104)) != 0)
    {
      while (v2 != *(_DWORD *)v9)
      {
        unsigned int v9 = (void *)v9[2];
        if (!v9) {
          goto LABEL_14;
        }
      }
    }
    else
    {
LABEL_14:
      unsigned int v9 = NSZoneMalloc(0, 0x48uLL);
      if (!v9) {
        _NSRTFPanic(a1, "%s: cannot allocate color entry", "ReadColorTbl");
      }
      *(_DWORD *)unsigned int v9 = v2;
      uint64_t v10 = *(void *)(a1 + 1104);
      *((_DWORD *)v9 + 3) = -1;
      *(void *)((char *)v9 + 4) = -1;
      *((_DWORD *)v9 + 10) = -1;
      v9[2] = v10;
      v9[3] = 0;
      v9[4] = 0;
      *(void *)(a1 + 1104) = v9;
    }
    ++v2;
    while (1)
    {
      uint64_t v11 = *(int *)(a1 + 2228);
      if (v11 != 3) {
        break;
      }
      if (*(_DWORD *)(a1 + 2232) != 5) {
        goto LABEL_29;
      }
      int v12 = *(_DWORD *)(a1 + 2236);
      switch(v12)
      {
        case 2:
          *((_DWORD *)v9 + 3) = *(_DWORD *)(a1 + 2240);
          break;
        case 1:
          *((_DWORD *)v9 + 2) = *(_DWORD *)(a1 + 2240);
          break;
        case 0:
          *((_DWORD *)v9 + 1) = *(_DWORD *)(a1 + 2240);
          break;
      }
      _NSRTFGetToken((_DWORD *)a1);
    }
    if (v11 != 2 || *(_DWORD *)(a1 + 2232) != 59)
    {
LABEL_29:
      _NSRTFPanic(a1, "%s: malformed entry", "ReadColorTbl");
      continue;
    }
  }
  if (v4 != 1 || *(_DWORD *)(a1 + 2232) != 1) {
    goto LABEL_10;
  }
  *(void *)(a1 + 32) = *(void *)(a1 + 24);

  return _NSRTFRouteToken(a1);
}

uint64_t ReadExpandedColorTbl(uint64_t a1)
{
  uint64_t v2 = 0;
  *(void *)&v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 1104);
LABEL_2:
  _NSRTFGetToken((_DWORD *)a1);
  int v4 = *(_DWORD *)(a1 + 2228);
  if (v4 == 2)
  {
    unsigned int v5 = *(_DWORD *)(a1 + 2232);
    BOOL v6 = v5 > 0x20;
    uint64_t v7 = (1 << v5) & 0x100002600;
    if (v6 || v7 == 0) {
      goto LABEL_10;
    }
    _NSRTFGetToken((_DWORD *)a1);
    int v4 = *(_DWORD *)(a1 + 2228);
  }
  if (v4 != 1 || *(_DWORD *)(a1 + 2232) != 1)
  {
LABEL_10:
    if (v3)
    {
      for (uint64_t i = *(void **)(a1 + 1104); i; uint64_t i = (void *)i[2])
      {
        if (v2 == *(_DWORD *)i) {
          goto LABEL_39;
        }
      }
    }
    uint64_t i = NSZoneMalloc(0, 0x48uLL);
    if (!i) {
      _NSRTFPanic(a1, "%s: cannot allocate color entry", "ReadColorTbl");
    }
    *(_DWORD *)uint64_t i = v2;
    uint64_t v10 = *(void *)(a1 + 1104);
    *((_DWORD *)i + 3) = -1;
    *(void *)((char *)i + 4) = -1;
    *((_DWORD *)i + 10) = -1;
    i[2] = v10;
    i[3] = 0;
    i[4] = 0;
    *(void *)(a1 + 1104) = i;
    while (1)
    {
      while (1)
      {
LABEL_39:
        while (1)
        {
          uint64_t v17 = *(int *)(a1 + 2228);
          if (v17 != 1) {
            break;
          }
          if (*(_DWORD *)(a1 + 2232)) {
            goto LABEL_33;
          }
          _NSRTFSkipGroup((_DWORD *)a1);
        }
        if (v17 != 2) {
          break;
        }
        if (*(_DWORD *)(a1 + 2232) == 59)
        {
          ++v2;
          goto LABEL_2;
        }
LABEL_33:
        _NSRTFGetToken((_DWORD *)a1);
      }
      if (v17 != 3) {
        goto LABEL_33;
      }
      int v18 = *(_DWORD *)(a1 + 2232);
      if (v18 == 5)
      {
        if (*(_DWORD *)(a1 + 2236) != 22) {
          goto LABEL_33;
        }
        _NSRTFGetToken((_DWORD *)a1);
        if (!i[4] && *(_DWORD *)(a1 + 2228) == 2)
        {
          uint64_t v11 = 0;
          int v12 = 2;
          uint64_t v13 = v21;
          while (1)
          {
            if (v12 == 1)
            {
              unsigned int v14 = *(_DWORD *)(a1 + 2232);
              if (v14 < 2) {
                goto LABEL_37;
              }
            }
            else if (v12 == 2)
            {
              unsigned int v14 = *(_DWORD *)(a1 + 2232);
              if (v14 == 59)
              {
                uint64_t v13 = &v21[v11];
                goto LABEL_37;
              }
            }
            else
            {
              unsigned int v14 = *(_DWORD *)(a1 + 2232);
            }
            v21[v11] = v14;
            _NSRTFGetToken((_DWORD *)a1);
            if (v11 == 99) {
              break;
            }
            ++v11;
            int v12 = *(_DWORD *)(a1 + 2228);
            uint64_t v13 = &v21[v11];
            if (v12 == 4) {
              goto LABEL_37;
            }
          }
          uint64_t v13 = v22;
LABEL_37:
          *uint64_t v13 = 0;
          uint64_t v16 = _NSRTFStrSave(v21);
          i[4] = v16;
          if (!v16) {
            _NSRTFPanic(a1, "%s: cannot allocate color name", "ReadColorTbl");
          }
        }
      }
      else
      {
        if (v18 != 29) {
          goto LABEL_33;
        }
        *((_DWORD *)i + 10) = *(_DWORD *)(a1 + 2236);
        _NSRTFGetToken((_DWORD *)a1);
        if (*(_DWORD *)(a1 + 2228) == 3)
        {
          uint64_t v15 = 0;
          do
          {
            if (*(_DWORD *)(a1 + 2232) != 5 || *(_DWORD *)(a1 + 2236) != 21) {
              break;
            }
            if (v15 <= 4)
            {
              char v19 = (char *)i + 4 * v15++;
              *((_DWORD *)v19 + 12) = *(_DWORD *)(a1 + 2240);
            }
            _NSRTFGetToken((_DWORD *)a1);
          }
          while (*(_DWORD *)(a1 + 2228) == 3);
        }
        else
        {
          LODWORD(v15) = 0;
        }
        *((_DWORD *)i + 11) = v15;
      }
    }
  }
  *(void *)(a1 + 32) = *(void *)(a1 + 24);
  return _NSRTFRouteToken(a1);
}

uint64_t ReadStyleSheet(uint64_t a1)
{
  _NSRTFSkipGroup((_DWORD *)a1);
  *(void *)(a1 + 32) = *(void *)(a1 + 24);

  return _NSRTFRouteToken(a1);
}

uint64_t ReadPictGroup(_DWORD *a1)
{
  int v1 = (int)a1;
  _NSRTFSkipGroup(a1);

  return _NSRTFRouteToken(v1);
}

uint64_t ReadObjGroup(_DWORD *a1)
{
  int v1 = (int)a1;
  _NSRTFSkipGroup(a1);

  return _NSRTFRouteToken(v1);
}

uint64_t GetChar(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 24);
  if (v1 >= *(void *)(a1 + 16)) {
    return -1;
  }
  uint64_t v2 = *(int *)(a1 + 2224);
  if ((int)v2 > 1022) {
    return -1;
  }
  uint64_t v4 = *(void *)(a1 + 8);
  *(void *)(a1 + 24) = v1 + 1;
  uint64_t v3 = *(unsigned __int8 *)(v4 + v1);
  *(_DWORD *)(a1 + 2224) = v2 + 1;
  uint64_t v5 = a1 + 1200;
  *(unsigned char *)(v5 + v2) = v3;
  *(unsigned char *)(v5 + *(int *)(a1 + 2224)) = 0;
  return v3;
}

uint64_t RTFCharToHex(unsigned int a1)
{
  __darwin_ct_rune_t v1 = a1;
  if ((a1 & 0x80000000) == 0)
  {
    if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * a1 + 60) & 0x8000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (__maskrune(a1, 0x8000uLL)) {
LABEL_3:
  }
    __darwin_ct_rune_t v1 = (char)__tolower(v1);
LABEL_4:
  int v2 = v1 - 48;
  if ((v1 - 48) >= 0xA) {
    return v1 - 87;
  }
  return v2;
}

uint64_t Lookup(uint64_t result, char *__s1)
{
  int v2 = (int32x2_t *)result;
  uint64_t v4 = __s1 + 1;
  int v3 = __s1[1];
  if (!__s1[1]
    || __s1[2]
    || ((v3 - 85) <= 0x21 ? (BOOL v16 = ((1 << (v3 - 85)) & 0x300122001) == 0) : (BOOL v16 = 1),
        v16))
  {
    uint64_t v5 = 0;
    uint64_t v6 = 30;
    uint64_t v7 = (char *)&rtfVeryCommonKey;
    do
    {
      uint64_t v8 = v6 + v5;
      if (v6 + v5 < 0 != __OFADD__(v6, v5)) {
        ++v8;
      }
      uint64_t v9 = v8 >> 1;
      uint64_t result = strcmp(v4, *((const char **)&rtfVeryCommonKey + 3 * (v8 >> 1) + 2));
      if ((result & 0x80000000) != 0)
      {
        uint64_t v6 = v9 - 1;
      }
      else
      {
        if (!result)
        {
LABEL_28:
          v2[279] = vmovn_s64(*(int64x2_t *)&v7[24 * v9]);
          v2[278].i32[1] = 3;
          return result;
        }
        uint64_t v5 = v9 + 1;
      }
    }
    while (v6 >= v5);
    uint64_t v10 = 0;
    uint64_t v11 = 30;
    uint64_t v7 = (char *)&rtfSomewhatCommonKey;
    do
    {
      uint64_t v12 = v11 + v10;
      if (v11 + v10 < 0 != __OFADD__(v11, v10)) {
        ++v12;
      }
      uint64_t v9 = v12 >> 1;
      uint64_t result = strcmp(v4, *((const char **)&rtfSomewhatCommonKey + 3 * (v12 >> 1) + 2));
      if ((result & 0x80000000) != 0)
      {
        uint64_t v11 = v9 - 1;
      }
      else
      {
        if (!result) {
          goto LABEL_28;
        }
        uint64_t v10 = v9 + 1;
      }
    }
    while (v11 >= v10);
    uint64_t v13 = 0;
    uint64_t v14 = 907;
    uint64_t v7 = (char *)&rtfKey;
    do
    {
      uint64_t v15 = v14 + v13;
      if (v14 + v13 < 0 != __OFADD__(v14, v13)) {
        ++v15;
      }
      uint64_t v9 = v15 >> 1;
      uint64_t result = strcmp(v4, *((const char **)&rtfKey + 3 * (v15 >> 1) + 2));
      if ((result & 0x80000000) != 0)
      {
        uint64_t v14 = v9 - 1;
      }
      else
      {
        if (!result) {
          goto LABEL_28;
        }
        uint64_t v13 = v9 + 1;
      }
    }
    while (v14 >= v13);
    v2[278].i32[1] = 0;
  }
  else
  {
    *(void *)(result + 222_Block_object_dispose(&STACK[0x2B0], 8) = 0xC00000003;
    if (v3 > 104)
    {
      switch(v3)
      {
        case 'i':
          int v17 = 12;
          break;
        case 'u':
          int v17 = 38;
          break;
        case 'v':
          int v17 = 27;
          break;
        default:
          return result;
      }
    }
    else
    {
      switch(v3)
      {
        case 'U':
          int v17 = 36;
          break;
        case 'b':
          int v17 = 1;
          break;
        case 'f':
          int v17 = 10;
          break;
        default:
          return result;
      }
    }
    *(_DWORD *)(result + 2236) = v17;
  }
  return result;
}

uint64_t UIAreObjectsSortableForEncoding(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v2)
  {
    isKindOfClass Class = 1;
    int v6 = 1;
    return (isKindOfClass | v6) & 1;
  }
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)v10;
  LOBYTE(isKindOfClass) = 1;
  LOBYTE(v6) = 1;
  while (2)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v10 != v4) {
        objc_enumerationMutation(a1);
      }
      if (isKindOfClass)
      {
        objc_opt_class();
        isKindOfClass Class = objc_opt_isKindOfClass();
        if ((v6 & 1) == 0) {
          goto LABEL_8;
        }
      }
      else
      {
        isKindOfClass Class = 0;
        if ((v6 & 1) == 0)
        {
LABEL_8:
          int v6 = 0;
          goto LABEL_11;
        }
      }
      objc_opt_class();
      int v6 = objc_opt_isKindOfClass();
LABEL_11:
      if (((isKindOfClass | v6) & 1) == 0)
      {
        isKindOfClass Class = 0;
        int v6 = 0;
        return (isKindOfClass | v6) & 1;
      }
    }
    uint64_t v3 = [a1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3) {
      continue;
    }
    return (isKindOfClass | v6) & 1;
  }
}

void sub_18E5CAE58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

__CFString *_UISystemFontName()
{
  return @"Helvetica";
}

CTFontRef UISystemFontCreate(int a1, int a2)
{
  if (a2) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 0;
  }
  return UINewFont(@"Helvetica", v2, 0, 0, 1, 0, (double)a1, 0.0);
}

CTFontRef UISystemFontForSize(int a1)
{
  uint64_t v1 = (a1 - 10);
  if (v1 > 0xF)
  {
    return UINewFont(@"Helvetica", 0, 0, 0, 1, 0, (double)a1, 0.0);
  }
  else
  {
    if (!__fontTable[v1])
    {
      CTFontRef v3 = UINewFont(@"Helvetica", 0, 0, 0, 1, 0, (double)a1, 0.0);
      if (v3)
      {
        uint64_t v4 = 0;
        atomic_compare_exchange_strong(&__fontTable[v1], (unint64_t *)&v4, (unint64_t)v3);
        if (v4) {
      }
        }
    }
    return (CTFontRef)__fontTable[v1];
  }
}

CTFontRef UISystemFontBoldForSize(int a1)
{
  uint64_t v1 = (a1 - 10);
  if (v1 > 0xF)
  {
    return UINewFont(@"Helvetica", 2, 0, 0, 1, 0, (double)a1, 0.0);
  }
  else
  {
    if (!__boldTable[v1])
    {
      CTFontRef v3 = UINewFont(@"Helvetica", 2, 0, 0, 1, 0, (double)a1, 0.0);
      if (v3)
      {
        uint64_t v4 = 0;
        atomic_compare_exchange_strong(&__boldTable[v1], (unint64_t *)&v4, (unint64_t)v3);
        if (v4) {
      }
        }
    }
    return (CTFontRef)__boldTable[v1];
  }
}

uint64_t UIContentSizeCategoryDidChangeNotificationFunction()
{
  return constantUIContentSizeCategoryDidChangeNotification;
}

void __NSLoadWebKit()
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ____NSLoadWebKit_block_invoke_2;
  block[3] = &unk_1E55CDF20;
  block[4] = &__block_literal_global_1814;
  if (__NSLoadWebKit_onceToken != -1) {
    dispatch_once(&__NSLoadWebKit_onceToken, block);
  }
}

id -[NSHTMLReader _blockLevelElementForNode:](NSHTMLReader *self, SEL a2, id a3)
{
  id v3 = a3;
  if (!a3) {
    return v3;
  }
  while ([v3 nodeType] != 1)
  {
    id v3 = (id)[v3 parentNode];
    if (!v3) {
      return v3;
    }
  }
  if ([(NSHTMLReader *)self _elementIsBlockLevel:v3]) {
    return v3;
  }
  uint64_t v6 = [v3 parentNode];

  return [(NSHTMLReader *)self _blockLevelElementForNode:v6];
}

uint64_t _dateForString(void *a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v3 = (void *)[v2 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  uint64_t v5 = (char *)[a1 UTF8String];
  int v6 = *v5;
  if ((v6 - 48) > 9)
  {
    uint64_t v9 = 0;
  }
  else
  {
    char v7 = 0;
    do
    {
      int v8 = *++v5;
      char v7 = v6 + 10 * v7 - 48;
      LOBYTE(v6) = v8;
    }
    while ((v8 - 48) < 0xA);
    uint64_t v9 = v7;
  }
  [v4 setYear:v9];
  if (*v5 != 45
    || (int v10 = v5[1], (v10 - 48) > 9)
    || (int v11 = v5[2], (v11 - 48) > 9)
    || (v12 = v11 + 10 * v10 - 16, uint64_t v9 = v12, v5[3] != 45))
  {
    [v4 setMonth:v9];
LABEL_24:
    [v4 setDay:v9];
LABEL_25:
    [v4 setHour:v9];
LABEL_26:
    [v4 setMinute:v9];
LABEL_27:
    uint64_t v24 = 0;
    goto LABEL_28;
  }
  [v4 setMonth:v12];
  int v13 = v5[4];
  if ((v13 - 48) > 9) {
    goto LABEL_24;
  }
  int v14 = v5[5];
  if ((v14 - 48) > 9) {
    goto LABEL_24;
  }
  char v15 = v14 + 10 * v13 - 16;
  uint64_t v9 = v15;
  if (v5[6] != 84) {
    goto LABEL_24;
  }
  [v4 setDay:v15];
  int v16 = v5[7];
  if ((v16 - 48) > 9) {
    goto LABEL_25;
  }
  int v17 = v5[8];
  if ((v17 - 48) > 9) {
    goto LABEL_25;
  }
  char v18 = v17 + 10 * v16 - 16;
  uint64_t v9 = v18;
  if (v5[9] != 58) {
    goto LABEL_25;
  }
  [v4 setHour:v18];
  int v19 = v5[10];
  if ((v19 - 48) > 9) {
    goto LABEL_26;
  }
  int v20 = v5[11];
  if ((v20 - 48) > 9) {
    goto LABEL_26;
  }
  char v21 = v20 + 10 * v19 - 16;
  if (v5[12] != 58)
  {
    uint64_t v9 = v21;
    goto LABEL_26;
  }
  [v4 setMinute:v21];
  int v22 = v5[13];
  if ((v22 - 48) > 9) {
    goto LABEL_27;
  }
  int v23 = v5[14];
  if ((v23 - 48) > 9 || v5[15] != 90) {
    goto LABEL_27;
  }
  [v4 setSecond:(char)(v23 + 10 * v22 - 16)];
  uint64_t v24 = [v3 dateFromComponents:v4];
LABEL_28:

  return v24;
}

uint64_t _colCompare(void *a1, void *a2)
{
  uint64_t v3 = [a1 startingColumn];
  uint64_t v4 = [a2 startingColumn];
  if (v3 < v4) {
    return -1;
  }
  else {
    return v3 != v4;
  }
}

__CFString *_fontNameForFont(UIFont *a1, int a2)
{
  uint64_t v4 = [(UIFont *)a1 familyName];
  if (_fontNameForFont_onceToken != -1) {
    dispatch_once(&_fontNameForFont_onceToken, &__block_literal_global_1850);
  }
  uint64_t v5 = [(UIFont *)a1 fontName];
  int v6 = +[UIFont fontNamesForFamilyName:v4];
  unint64_t v7 = [(NSArray *)v6 count];
  if ([(NSString *)v5 isEqualToString:@"LastResort"]) {
    return 0;
  }
  int v23 = a2;
  id v9 = 0;
  if (v6 && v7)
  {
    int v10 = [(UIFont *)a1 traits];
    int v11 = a1;
    if ((v10 & 2) != 0)
    {
      uint64_t v12 = [(UIFont *)a1 familyName];
      [(UIFont *)a1 pointSize];
      int v11 = +[UIFont fontWithFamilyName:traits:size:](UIFont, "fontWithFamilyName:traits:size:", v12, v10 & 0xFFFFFFFD);
    }
    if (v10)
    {
      uint64_t v13 = [(UIFont *)v11 familyName];
      [(UIFont *)v11 pointSize];
      int v11 = +[UIFont fontWithFamilyName:traits:size:](UIFont, "fontWithFamilyName:traits:size:", v13, v10 & 0xFFFFFFFE);
    }
    if (v11) {
      int v14 = v11;
    }
    else {
      int v14 = a1;
    }
    uint64_t v15 = [(UIFont *)v14 fontName];
    for (unint64_t i = 0; i < v7; ++i)
    {
      id v17 = [(NSArray *)v6 objectAtIndex:i];
      if ([v17 isEqualToString:v5])
      {
        if (v7 < 3) {
          goto LABEL_30;
        }
      }
      else
      {
        id v9 = 0;
        if (![v17 isEqualToString:v15] || v7 <= 2) {
          continue;
        }
      }
      id v9 = [(NSArray *)v6 objectAtIndex:1];
      if (v9)
      {
        if ([(__CFString *)v4 hasSuffix:v9]) {
          goto LABEL_30;
        }
        uint64_t v18 = [(id)_fontNameForFont_faceNamesToAdd count];
        if (!v18) {
          goto LABEL_30;
        }
        unint64_t v19 = v18;
        unint64_t v20 = 0;
        do
        {
          uint64_t v21 = objc_msgSend(v9, "compare:options:", objc_msgSend((id)_fontNameForFont_faceNamesToAdd, "objectAtIndex:", v20++), 1);
          if (v21) {
            BOOL v22 = v20 >= v19;
          }
          else {
            BOOL v22 = 1;
          }
        }
        while (!v22);
        if (v21)
        {
LABEL_30:
          id v9 = 0;
          continue;
        }
        id v9 = (id)[NSString stringWithFormat:@"%@ %@", v4, v9];
        if (v9) {
          break;
        }
      }
    }
  }
  if (v23 && [(__CFString *)v4 hasPrefix:@".SF"]) {
    uint64_t v4 = @"system-ui";
  }
  if (v9) {
    return (__CFString *)v9;
  }
  else {
    return v4;
  }
}

void sub_18E5D5928(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _colorValForColor_0(void *a1)
{
  if (!a1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  getUIColorClass_0[0]();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v8 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
    double v4 = 0.0;
    double v5 = 0.0;
    if ([a1 getRed:&v8 green:&v7 blue:&v6 alpha:&v5]) {
      return (int)((vcvtmd_s64_f64(v8 * 255.0 + 0.5) << 24) | (vcvtmd_s64_f64(v7 * 255.0 + 0.5) << 16) | (vcvtmd_s64_f64(v6 * 255.0 + 0.5) << 8) | vcvtmd_s64_f64(v5 * 255.0 + 0.5));
    }
    if ([a1 getWhite:&v4 alpha:&v5]) {
      return (int)((16843008 * vcvtmd_s64_f64(v4 * 255.0 + 0.5)) | vcvtmd_s64_f64(v5 * 255.0 + 0.5));
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t _rgbaString(uint64_t a1)
{
  if (a1 == 0x7FFFFFFFFFFFFFFFLL) {
    unsigned int v1 = 255;
  }
  else {
    unsigned int v1 = a1;
  }
  if ((_BYTE)v1)
  {
    double v2 = 1.0;
    if (v1 != 255) {
      double v2 = (double)v1 / 255.0;
    }
  }
  else
  {
    double v2 = 0.0;
  }
  return [NSString stringWithFormat:@"rgba(%u, %u, %u, %.2g)", HIBYTE(v1), BYTE2(v1), BYTE1(v1), *(void *)&v2];
}

void sub_18E5D6940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *_escapedStringForString(void *a1, int a2)
{
  unint64_t v4 = [a1 length];
  double v5 = (void *)[MEMORY[0x1E4F28E78] string];
  if (v4)
  {
    unint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = [a1 characterAtIndex:v6];
      uint64_t v9 = v8;
      if ((v8 > 0x3E || ((1 << v8) & 0x5000004000000000) == 0) && (v8 != 34 || !a2))
      {
        if (++v6 == v4 && v4 > v7) {
          objc_msgSend(v5, "appendString:", objc_msgSend(a1, "substringWithRange:", v7, v4 - v7));
        }
        continue;
      }
      uint64_t v10 = v6 - v7;
      if (v6 > v7) {
        objc_msgSend(v5, "appendString:", objc_msgSend(a1, "substringWithRange:", v7, v10));
      }
      if ((int)v9 > 59)
      {
        if (v9 == 62)
        {
          int v11 = v5;
          uint64_t v12 = @"&gt;";
        }
        else
        {
          if (v9 != 60)
          {
LABEL_22:
            objc_msgSend(v5, "appendFormat:", @"&#x%X;", v10, v9);
            goto LABEL_23;
          }
          int v11 = v5;
          uint64_t v12 = @"&lt;";
        }
      }
      else if (v9 == 34)
      {
        int v11 = v5;
        uint64_t v12 = @"&quot;";
      }
      else
      {
        if (v9 != 38) {
          goto LABEL_22;
        }
        int v11 = v5;
        uint64_t v12 = @"&amp;";
      }
      objc_msgSend(v11, "appendString:", v12, v10);
LABEL_23:
      unint64_t v7 = ++v6;
    }
    while (v6 != v4);
  }
  return v5;
}

unint64_t -[NSHTMLWriter _blockClassForBlock:](NSHTMLWriter *self, SEL a2, id a3)
{
  blockStyleStrings = self->_blockStyleStrings;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [a3 valueForDimension:0];
  double v6 = v5;
  [a3 valueForDimension:1];
  double v8 = v7;
  [a3 valueForDimension:2];
  double v10 = v9;
  [a3 valueForDimension:4];
  double v12 = v11;
  [a3 valueForDimension:5];
  double v14 = v13;
  [a3 valueForDimension:6];
  double v16 = v15;
  uint64_t v17 = [a3 valueTypeForDimension:0];
  uint64_t v18 = [a3 valueTypeForDimension:1];
  uint64_t v64 = [a3 valueTypeForDimension:2];
  uint64_t v65 = [a3 valueTypeForDimension:4];
  uint64_t v66 = [a3 valueTypeForDimension:5];
  uint64_t v68 = [a3 valueTypeForDimension:6];
  uint64_t v19 = _colorValForColor_0((void *)[a3 backgroundColor]);
  [a3 widthForLayer:1 edge:1];
  double v88 = v20;
  [a3 widthForLayer:1 edge:2];
  double v87 = v21;
  [a3 widthForLayer:1 edge:3];
  double v85 = v22;
  [a3 widthForLayer:1 edge:0];
  double v24 = v23;
  uint64_t v75 = [a3 widthValueTypeForLayer:1 edge:1];
  uint64_t v74 = [a3 widthValueTypeForLayer:1 edge:2];
  uint64_t v73 = [a3 widthValueTypeForLayer:1 edge:3];
  uint64_t v71 = [a3 widthValueTypeForLayer:1 edge:0];
  [a3 widthForLayer:0 edge:1];
  double v86 = v25;
  [a3 widthForLayer:0 edge:2];
  double v84 = v26;
  [a3 widthForLayer:0 edge:3];
  double v83 = v27;
  [a3 widthForLayer:0 edge:0];
  double v29 = v28;
  uint64_t v72 = [a3 widthValueTypeForLayer:0 edge:1];
  uint64_t v70 = [a3 widthValueTypeForLayer:0 edge:2];
  uint64_t v69 = [a3 widthValueTypeForLayer:0 edge:3];
  uint64_t v67 = [a3 widthValueTypeForLayer:0 edge:0];
  double v30 = (void *)[a3 borderColorForEdge:1];
  BOOL v31 = (void *)[a3 borderColorForEdge:2];
  int v32 = (void *)[a3 borderColorForEdge:3];
  uint64_t v33 = (void *)[a3 borderColorForEdge:0];
  uint64_t v34 = _colorValForColor_0(v30);
  uint64_t v35 = _colorValForColor_0(v31);
  uint64_t v81 = _colorValForColor_0(v32);
  uint64_t v36 = _colorValForColor_0(v33);
  [a3 widthForLayer:-1 edge:1];
  double v92 = v37;
  [a3 widthForLayer:-1 edge:2];
  double v91 = v38;
  [a3 widthForLayer:-1 edge:3];
  double v90 = v39;
  [a3 widthForLayer:-1 edge:0];
  double v89 = v40;
  uint64_t v79 = [a3 widthValueTypeForLayer:-1 edge:1];
  uint64_t v78 = [a3 widthValueTypeForLayer:-1 edge:2];
  uint64_t v77 = [a3 widthValueTypeForLayer:-1 edge:3];
  uint64_t v76 = [a3 widthValueTypeForLayer:-1 edge:0];
  if (v6 > 0.0)
  {
    if (v17 == 1) {
      uint64_t v41 = @"%";
    }
    else {
      uint64_t v41 = @"px";
    }
    [v4 appendFormat:@"width: %.1f%@; ", *(void *)&v6, v41];
  }
  if (v8 > 0.0)
  {
    if (v18 == 1) {
      double v42 = @"%";
    }
    else {
      double v42 = @"px";
    }
    [v4 appendFormat:@"min-width: %.1f%@; ", *(void *)&v8, v42];
  }
  if (v10 > 0.0)
  {
    if (v64 == 1) {
      unsigned int v43 = @"%";
    }
    else {
      unsigned int v43 = @"px";
    }
    [v4 appendFormat:@"max-width: %.1f%@; ", *(void *)&v10, v43];
  }
  if (v12 > 0.0)
  {
    if (v65 == 1) {
      uint64_t v44 = @"%";
    }
    else {
      uint64_t v44 = @"px";
    }
    [v4 appendFormat:@"height: %.1f%@; ", *(void *)&v12, v44];
  }
  if (v14 > 0.0)
  {
    if (v66 == 1) {
      int v45 = @"%";
    }
    else {
      int v45 = @"px";
    }
    [v4 appendFormat:@"min-height: %.1f%@; ", *(void *)&v14, v45];
  }
  if (v16 > 0.0)
  {
    if (v68 == 1) {
      int v46 = @"%";
    }
    else {
      int v46 = @"px";
    }
    [v4 appendFormat:@"max-height: %.1f%@; ", *(void *)&v16, v46];
  }
  if (v19 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "appendFormat:", @"background-color: #%.6x; ", v19 >> 8);
    if ((_BYTE)v19 != 0xFF) {
      [v4 appendFormat:@"background-color: %@; ", _rgbaString(v19)];
    }
  }
  if (v24 > 0.0 || v88 > 0.0 || v87 > 0.0 || v85 > 0.0)
  {
    if (v75 == 1) {
      __int16 v47 = @"%";
    }
    else {
      __int16 v47 = @"px";
    }
    if (v74 == 1) {
      char v48 = @"%";
    }
    else {
      char v48 = @"px";
    }
    if (v73 == 1) {
      uint64_t v49 = @"%";
    }
    else {
      uint64_t v49 = @"px";
    }
    if (v71 == 1) {
      int v50 = @"%";
    }
    else {
      int v50 = @"px";
    }
    objc_msgSend(v4, "appendFormat:", @"margin: %.1f%@ %.1f%@ %.1f%@ %.1f%@; ",
      *(void *)&v88,
      v47,
      *(void *)&v87,
      v48,
      *(void *)&v85,
      v49,
      *(void *)&v24,
      v50);
  }
  if (v29 > 0.0 || v86 > 0.0 || v84 > 0.0 || v83 > 0.0)
  {
    uint64_t v51 = v72 == 1 ? @"%" : @"px";
    NSRange v52 = v70 == 1 ? @"%" : @"px";
    NSRange v53 = v69 == 1 ? @"%" : @"px";
    uint64_t v54 = v67 == 1 ? @"%" : @"px";
    objc_msgSend(v4, "appendFormat:", @"border-style: solid; border-width: %.1f%@ %.1f%@ %.1f%@ %.1f%@; ",
      *(void *)&v86,
      v51,
      *(void *)&v84,
      v52,
      *(void *)&v83,
      v53,
      *(void *)&v29,
      v54);
    if (v36 != 0x7FFFFFFFFFFFFFFFLL
      || v34 != 0x7FFFFFFFFFFFFFFFLL
      || v35 != 0x7FFFFFFFFFFFFFFFLL
      || v81 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [v4 appendFormat:@"border-color:"];
      if (v34 == 0x7FFFFFFFFFFFFFFFLL) {
        [v4 appendString:@" transparent"];
      }
      else {
        objc_msgSend(v4, "appendFormat:", @" #%.6x", v34 >> 8);
      }
      if (v35 == 0x7FFFFFFFFFFFFFFFLL) {
        [v4 appendString:@" transparent"];
      }
      else {
        objc_msgSend(v4, "appendFormat:", @" #%.6x", v35 >> 8);
      }
      if (v81 == 0x7FFFFFFFFFFFFFFFLL) {
        [v4 appendString:@" transparent"];
      }
      else {
        objc_msgSend(v4, "appendFormat:", @" #%.6x", v81 >> 8);
      }
      if (v36 == 0x7FFFFFFFFFFFFFFFLL) {
        [v4 appendString:@" transparent; "];
      }
      else {
        objc_msgSend(v4, "appendFormat:", @" #%.6x; ", v36 >> 8);
      }
    }
  }
  if (v89 > 0.0 || v92 > 0.0 || v91 > 0.0 || v90 > 0.0)
  {
    if (v79 == 1) {
      int v55 = @"%";
    }
    else {
      int v55 = @"px";
    }
    if (v78 == 1) {
      uint64_t v56 = @"%";
    }
    else {
      uint64_t v56 = @"px";
    }
    if (v77 == 1) {
      double v57 = @"%";
    }
    else {
      double v57 = @"px";
    }
    if (v76 == 1) {
      double v58 = @"%";
    }
    else {
      double v58 = @"px";
    }
    objc_msgSend(v4, "appendFormat:", @"padding: %.1f%@ %.1f%@ %.1f%@ %.1f%@; ",
      *(void *)&v92,
      v55,
      *(void *)&v91,
      v56,
      *(void *)&v90,
      v57,
      *(void *)&v89,
      v58);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([a3 collapsesBorders]) {
      [v4 appendString:@"border-collapse: collapse; "];
    }
    if ([a3 hidesEmptyCells]) {
      [v4 appendString:@"empty-cells: hide; "];
    }
    if ([a3 layoutAlgorithm] == 1) {
      [v4 appendString:@"table-layout: fixed; "];
    }
  }
  if (![v4 length])
  {
    unint64_t v60 = 0;
    goto LABEL_122;
  }
  while (([v4 hasSuffix:@" "] & 1) != 0
       || [v4 hasSuffix:@";"])
    objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 1, 1);
  if ((self->_excludedElements2 & 0x1140000) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v61 = 120;
    }
    else
    {
      objc_opt_class();
      int v59 = blockStyleStrings;
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_119;
      }
      uint64_t v61 = 128;
    }
    int v59 = *(NSMutableArray **)((char *)&self->super.isa + v61);
    goto LABEL_119;
  }
  int v59 = blockStyleStrings;
LABEL_119:
  uint64_t v62 = [(NSMutableArray *)v59 indexOfObject:v4];
  if (v62 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v62 = [(NSMutableArray *)v59 count];
    [(NSMutableArray *)v59 addObject:v4];
  }
  unint64_t v60 = v62 + 1;
LABEL_122:

  return v60;
}

uint64_t init_UIApplicationLoadWebKit()
{
  id v0 = (void *)__NSGetFrameworkReference(0, 0);
  unsigned int v1 = (uint64_t (*)())dlsym(v0, "_UIApplicationLoadWebKit");
  softLink_UIApplicationLoadWebKit = v1;
  if (!v1) {
    init_UIApplicationLoadWebKit_cold_1();
  }

  return v1();
}

Class initNSColor_4()
{
  __NSGetFrameworkReference(0, 0);
  Class result = objc_getClass("NSColor");
  classNSColor_4 = (uint64_t)result;
  if (!result) {
    initNSColor_cold_1_4();
  }
  getNSColorClass_4[0] = NSColorFunction_4;
  return result;
}

uint64_t NSColorFunction_4()
{
  return classNSColor_4;
}

uint64_t initWebThreadLock()
{
  id v0 = (void *)__NSGetFrameworkReference(@"WebCore", 1);
  unsigned int v1 = (uint64_t (*)())dlsym(v0, "WebThreadLock");
  softLinkWebThreadLocuint64_t k = v1;
  if (!v1) {
    initWebThreadLock_cold_1();
  }

  return v1();
}

uint64_t initWebThreadIsLocked()
{
  id v0 = (void *)__NSGetFrameworkReference(@"WebCore", 1);
  unsigned int v1 = (uint64_t (*)())dlsym(v0, "WebThreadIsLocked");
  softLinkWebThreadIsLocked = v1;
  if (!v1) {
    initWebThreadIsLocked_cold_1();
  }

  return v1();
}

uint64_t ___fontNameForFont_block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"Condensed", @"Light", @"SemiBold", @"UltraLight", @"ExtraBlack", @"Ornaments", 0);
  _fontNameForFont_faceNamesToAdd = result;
  return result;
}

uint64_t writeCharacters(uint64_t result, const __CFString *a2, CFIndex a3, uint64_t a4, unsigned int a5)
{
  uint64_t v6 = a4;
  double v8 = (void *)result;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  BOOL v9 = 1;
  if (a5 > 0x19 || ((1 << a5) & 0x200000E) == 0) {
    BOOL v9 = a5 - 1056 < 4;
  }
  if (a4)
  {
    uint64_t v28 = 0;
    do
    {
      double v25 = &v28;
      uint64_t v10 = v6;
      uint64_t result = __CFStringEncodeByteStream();
      if (result)
      {
        uint64_t v11 = result;
        uint64_t v6 = v10 - result;
        v30[v28] = 0;
        LOBYTE(v12) = v30[0];
        if (v30[0])
        {
          uint64_t v26 = v10 - result;
          double v13 = v30;
          do
          {
            LOBYTE(v14) = v12;
            if ((char)v12 < 1)
            {
              uint64_t v20 = 0;
            }
            else
            {
              uint64_t v15 = 0;
              while (1)
              {
                unsigned int v16 = v14 - 92;
                BOOL v17 = v16 > 0x21;
                uint64_t v18 = (1 << v16) & 0x280000001;
                if (!v17 && v18 != 0) {
                  break;
                }
                uint64_t v20 = v15 + 1;
                int v14 = v13[++v15];
                if (v14 < 1) {
                  goto LABEL_19;
                }
              }
              uint64_t v20 = v15;
            }
LABEL_19:
            double v21 = &v13[v20];
            uint64_t result = objc_msgSend(v8, "appendBytes:length:", v25);
            int v12 = *v21;
            if (!*v21) {
              break;
            }
            if (v12 < 0)
            {
              do
              {
                snprintf(__str, 0x28uLL, "\\'%x", v12);
                uint64_t result = [v8 appendBytes:__str length:strlen(__str)];
                if (v9)
                {
                  if (a5 != 1056 && a5 != 1
                    || (unsigned int v23 = *v21, v23 > 0xDF)
                    || (v23 + 127) <= 0x1Eu)
                  {
                    if (v21[1])
                    {
                      snprintf(__str, 0x28uLL, "\\'%x", v21[1]);
                      uint64_t result = [v8 appendBytes:__str length:strlen(__str)];
                      ++v21;
                    }
                  }
                }
                int v24 = *++v21;
                LOBYTE(v12) = v24;
              }
              while (v24 < 0);
            }
            else
            {
              [v8 appendBytes:"\\"" length:1];
              uint64_t result = [v8 appendBytes:v21 length:1];
              char v22 = *++v21;
              LOBYTE(v12) = v22;
            }
            double v13 = v21;
          }
          while ((_BYTE)v12);
          uint64_t v6 = v26;
        }
      }
      else
      {
        if (writeCharacters_writeOldForm == 254) {
          writeCharacters_writeOldForuint64_t m = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults", &v28), "BOOLForKey:", @"NSRTFWriteOldUnicodeForm");
        }
        CFStringGetCharacterAtIndex(a2, a3);
        if (writeCharacters_writeOldForm) {
          snprintf(__str, 0x28uLL, "\\U%d %s\\u%d ");
        }
        else {
          snprintf(__str, 0x28uLL, "%s\\u%d ");
        }
        uint64_t result = [v8 appendBytes:__str length:strlen(__str)];
        uint64_t v6 = v10 - 1;
        uint64_t v11 = 1;
      }
      a3 += v11;
    }
    while (v6);
  }
  return result;
}

uint64_t __NSLayoutSectionComparator(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  unint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  if (v3 == v5) {
    goto LABEL_4;
  }
  if (!v3) {
    return 1;
  }
  if (!v5) {
    return -1;
  }
LABEL_4:
  BOOL v6 = v2 >= v4;
  BOOL v7 = v2 == v4;
  uint64_t v8 = -1;
  if (v6) {
    uint64_t v8 = 1;
  }
  if (v7) {
    return 0;
  }
  else {
    return v8;
  }
}

uint64_t RGBColorForColor(void *a1)
{
  CFTypeID v2 = CFGetTypeID(a1);
  CFTypeID TypeID = CGColorGetTypeID();
  if (!a1 || v2 != TypeID)
  {
    getUIColorClass_1[0]();
    if (objc_opt_isKindOfClass())
    {
      double v12 = 0.0;
      double v13 = 0.0;
      double v10 = 0.0;
      double v11 = 0.0;
      if ([a1 getRed:&v13 green:&v12 blue:&v11 alpha:&v10])
      {
        Class NSColorClass_5 = getNSColorClass_5();
        double v6 = v12;
        double v5 = v13;
        double v8 = v10;
        double v7 = v11;
        return [(objc_class *)NSColorClass_5 colorWithCalibratedRed:v5 green:v6 blue:v7 alpha:v8];
      }
      if ([a1 getWhite:&v13 alpha:&v10])
      {
        Class NSColorClass_5 = getNSColorClass_5();
        double v5 = v13;
        double v8 = v10;
        double v6 = v13;
        double v7 = v13;
        return [(objc_class *)NSColorClass_5 colorWithCalibratedRed:v5 green:v6 blue:v7 alpha:v8];
      }
    }
  }
  return 0;
}

uint64_t newCGColorByConvertingToColorSpaceWithName(int a1, CFStringRef name)
{
  CGColorSpaceRef v2 = CGColorSpaceCreateWithName(name);
  if (!v2) {
    return 0;
  }
  CGColorSpaceRef v3 = v2;
  if (MEMORY[0x192FACF50](v2, 0))
  {
    uint64_t v4 = CGColorTransformConvertColor();
    CGColorTransformRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  CFRelease(v3);
  return v4;
}

uint64_t thoroughDataHash(void *a1)
{
  [a1 bytes];
  unint64_t v2 = [a1 length];
  uint64_t v3 = CFHashBytes();
  if (v2 >= 0x41)
  {
    v3 ^= CFHashBytes();
    if (v2 >= 0x61) {
      return CFHashBytes() ^ v3;
    }
  }
  return v3;
}

void sub_18E5E74B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initNSColor_5()
{
  __NSGetFrameworkReference(0, 0);
  Class result = objc_getClass("NSColor");
  classNSColor_5 = (uint64_t)result;
  if (!result) {
    initNSColor_cold_1_5();
  }
  getClass NSColorClass_5 = NSColorFunction_5;
  return result;
}

uint64_t NSColorFunction_5()
{
  return classNSColor_5;
}

void sub_18E5E7694(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18E5E79F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __UIKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UIKitLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void initUIGraphicsBeginImageContextWithOptions_cold_1()
{
}

void initUIGraphicsGetImageFromCurrentImageContext_cold_1()
{
}

void initUIGraphicsEndImageContext_cold_1()
{
}

void initNSColor_cold_1()
{
}

void initNSColor_cold_1_0()
{
}

void initUIRectIntegralWithScale_cold_1()
{
}

void initUIColor_cold_1()
{
}

void initNSColor_cold_1_1()
{
}

void initUIGraphicsGetCurrentContext_cold_1()
{
}

void initNSColor_cold_1_2()
{
}

void UINibDecoderDecodeDictionary_cold_1()
{
  __assert_rtn("UINibDecoderDecodeDictionary", "UINibDecoder.m", 648, "count >= 1 && \"It isn't possible to get here with count == 0.\"");
}

void UINibDecoderDecodeSet_cold_1()
{
  __assert_rtn("UINibDecoderDecodeSet", "UINibDecoder.m", 628, "count >= 1 && \"It isn't possible to get here with count == 0.\"");
}

void initUIImage_cold_1()
{
}

void initUIGraphicsGetCurrentContext_cold_1_0()
{
}

void initUIGraphicsPushContext_cold_1()
{
}

void initUIGraphicsPopContext_cold_1()
{
}

void _NSCopyBreakIterator_cold_1()
{
}

void initSwiftUITextAnimationProviderClass_cold_1()
{
}

void __NSCoreTypesetterHyphenateLine_cold_1()
{
}

void __attributedStringAtKeyframe_block_invoke_2_cold_1()
{
  __assert_rtn("attributedStringAtKeyframe_block_invoke_2", "NSCoreTypesetter.m", 2236, "subAttrStr.length == resolvedAttrStr.length");
}

void UIWriteArchiveToData_cold_1()
{
  __assert_rtn("UIWriteArchiveToData", "UINibEncoderDataGeneration.m", 182, "scopeID >= previousScopeID && \"Scopes are out of order.\"");
}

void UIWriteArchiveToData_cold_2()
{
}

void UIWriteArchiveToData_cold_3()
{
}

void initNSImage_cold_1()
{
}

void initUIImage_cold_1_0()
{
}

void initUIImagePNGRepresentation_cold_1()
{
}

void initNSTextAttachmentView_cold_1()
{
}

void initUITextAttachmentView_cold_1()
{
}

void init_UIAccessibilityContentSizeCategoryImageAdjustingScaleFactorForTraitCollection_cold_1()
{
}

void initNSColor_cold_1_3()
{
}

void initUIContentSizeCategoryUnspecified_cold_1()
{
}

void initUIContentSizeCategoryDidChangeNotification_cold_1()
{
}

void initUIApplicationDidEnterBackgroundNotification_cold_1()
{
}

void init_UIApplicationLoadWebKit_cold_1()
{
}

void initUIColor_cold_1_0()
{
}

void initNSColor_cold_1_4()
{
}

void initWebThreadLock_cold_1()
{
}

void initWebThreadIsLocked_cold_1()
{
}

void initUIColor_cold_1_1()
{
}

void initNSColor_cold_1_5()
{
}

void initUIApplicationDidEnterBackgroundNotification_cold_1_0()
{
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7198](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArrayReplaceValues(CFMutableArrayRef theArray, CFRange range, const void **newValues, CFIndex newCount)
{
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

uint64_t CFAttributedStringGetBidiLevelsAndResolvedDirections()
{
  return MEMORY[0x1F40D7290]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x1F40D7448](bundle);
}

CFArrayRef CFBundleCopyPreferredLocalizationsFromArray(CFArrayRef locArray)
{
  return (CFArrayRef)MEMORY[0x1F40D74C0](locArray);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40D75D0](bundle, key);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutableCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFMutableCharacterSetRef)MEMORY[0x1F40D7720](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7740](theSetIdentifier);
}

uint64_t CFCharacterSetInitInlineBuffer()
{
  return MEMORY[0x1F40D7758]();
}

void CFCharacterSetInvert(CFMutableCharacterSetRef theSet)
{
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1F40D7770](theSet, theChar);
}

Boolean CFCharacterSetIsLongCharacterMember(CFCharacterSetRef theSet, UTF32Char theChar)
{
  return MEMORY[0x1F40D7778](theSet, *(void *)&theChar);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1F40D77A8](cf);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B68](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

uint64_t CFHashBytes()
{
  return MEMORY[0x1F40D7BA8]();
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BB8]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BE0](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLocaleIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x1F40D7BF8](allocator, localeIdentifier);
}

CFDictionaryRef CFLocaleCreateComponentsFromLocaleIdentifier(CFAllocatorRef allocator, CFLocaleIdentifier localeID)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7C00](allocator, localeID);
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x1F40D7C48](locale, key);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D7CA0](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

uint64_t CFQSortArray()
{
  return MEMORY[0x1F40D7F80]();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x1F40D80D8](allocator, activities, repeats, order, callout, context);
}

void CFRunLoopObserverInvalidate(CFRunLoopObserverRef observer)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1F40D8128](mode, returnAfterSourceHandled, seconds);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x1F40D8180](allocator, flags, order, callout, context, fireDate, interval);
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1F40D81F8](theSet, value);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x1F40D8200](allocator, values, numValues, callBacks);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x1F40D8238](theSet, value);
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
}

uint64_t CFStorageCreate()
{
  return MEMORY[0x1F40D82F0]();
}

uint64_t CFStorageGetCount()
{
  return MEMORY[0x1F40D8310]();
}

uint64_t CFStorageGetValueAtIndex()
{
  return MEMORY[0x1F40D8318]();
}

uint64_t CFStorageInsertValues()
{
  return MEMORY[0x1F40D8328]();
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
}

CFStringRef CFStringConvertEncodingToIANACharSetName(CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D83A0](*(void *)&encoding);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x1F40D83A8](*(void *)&encoding);
}

UInt32 CFStringConvertEncodingToWindowsCodepage(CFStringEncoding encoding)
{
  return MEMORY[0x1F40D83B0](*(void *)&encoding);
}

CFStringEncoding CFStringConvertIANACharSetNameToEncoding(CFStringRef theString)
{
  return MEMORY[0x1F40D83B8](theString);
}

CFStringEncoding CFStringConvertNSStringEncodingToEncoding(unint64_t encoding)
{
  return MEMORY[0x1F40D83C0](encoding);
}

CFStringEncoding CFStringConvertWindowsCodepageToEncoding(UInt32 codepage)
{
  return MEMORY[0x1F40D83C8](*(void *)&codepage);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableWithExternalCharactersNoCopy(CFAllocatorRef alloc, UniChar *chars, CFIndex numChars, CFIndex capacity, CFAllocatorRef externalCharactersAllocator)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8418](alloc, chars, numChars, capacity, externalCharactersAllocator);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8470](alloc, chars, numChars, contentsDeallocator);
}

uint64_t CFStringEncodingBytesToUnicode()
{
  return MEMORY[0x1F40D84B8]();
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1F40D8528](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

CFIndex CFStringGetHyphenationLocationBeforeIndex(CFStringRef string, CFIndex location, CFRange limitRange, CFOptionFlags options, CFLocaleRef locale, UTF32Char *character)
{
  return MEMORY[0x1F40D8560](string, location, limitRange.location, limitRange.length, options, locale, character);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

uint64_t CFStringGetRangeOfCharacterClusterAtIndex()
{
  return MEMORY[0x1F40D85D0]();
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x1F40D85E0]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1F40D8600](theString, prefix);
}

Boolean CFStringIsEncodingAvailable(CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8638](*(void *)&encoding);
}

Boolean CFStringIsHyphenationAvailableForLocale(CFLocaleRef locale)
{
  return MEMORY[0x1F40D8640](locale);
}

uint64_t CFStringOpenUText()
{
  return MEMORY[0x1F40D8658]();
}

void CFStringSetExternalCharactersNoCopy(CFMutableStringRef theString, UniChar *chars, CFIndex length, CFIndex capacity)
{
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1F40D8680](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1F40D8698](alloc, string, range.location, range.length, options, locale);
}

CFIndex CFStringTokenizerGetCurrentSubTokens(CFStringTokenizerRef tokenizer, CFRange *ranges, CFIndex maxRangeLength, CFMutableArrayRef derivedSubTokens)
{
  return MEMORY[0x1F40D86A0](tokenizer, ranges, maxRangeLength, derivedSubTokens);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x1F40D86A8](tokenizer);
  result.NSUInteger length = v2;
  result.unint64_t location = v1;
  return result;
}

CFStringTokenizerTokenType CFStringTokenizerGoToTokenAtIndex(CFStringTokenizerRef tokenizer, CFIndex index)
{
  return MEMORY[0x1F40D86B0](tokenizer, index);
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x1F40D86C0](string, range, transform, reverse);
}

CFDataRef CFURLCreateData(CFAllocatorRef allocator, CFURLRef url, CFStringEncoding encoding, Boolean escapeWhitespace)
{
  return (CFDataRef)MEMORY[0x1F40D8820](allocator, url, *(void *)&encoding, escapeWhitespace);
}

uint64_t CFUniCharGetBitmapPtrForPlane()
{
  return MEMORY[0x1F40D8A00]();
}

uint64_t CFUniCharGetUnicodePropertyDataForPlane()
{
  return MEMORY[0x1F40D8A08]();
}

uint64_t CFUniCharIsMemberOf()
{
  return MEMORY[0x1F40D8A10]();
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1F40D97A0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x1F40D9980](a1, *(void *)&intent, color, options);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1F40D9A18](color);
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x1F40D9A30]();
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1F40D9AB8](space);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1F40D9BE8](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BF0](space);
}

uint64_t CGColorTransformConvertColor()
{
  return MEMORY[0x1F40D9C90]();
}

uint64_t CGColorTransformCreate()
{
  return MEMORY[0x1F40D9CA8]();
}

uint64_t CGColorTransformRelease()
{
  return MEMORY[0x1F40D9CB8]();
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextBeginPath(CGContextRef c)
{
}

void CGContextBeginTransparencyLayer(CGContextRef c, CFDictionaryRef auxiliaryInfo)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextClipToRects(CGContextRef c, const CGRect *rects, size_t count)
{
}

void CGContextClosePath(CGContextRef c)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

CGPoint CGContextConvertPointToDeviceSpace(CGContextRef c, CGPoint point)
{
  MEMORY[0x1F40D9D70](c, (__n128)point, *(__n128 *)&point.y);
  result.CGFloat y = v3;
  result.double x = v2;
  return result;
}

CGPoint CGContextConvertPointToUserSpace(CGContextRef c, CGPoint point)
{
  MEMORY[0x1F40D9D78](c, (__n128)point, *(__n128 *)&point.y);
  result.CGFloat y = v3;
  result.double x = v2;
  return result;
}

CGRect CGContextConvertRectToDeviceSpace(CGContextRef c, CGRect rect)
{
  MEMORY[0x1F40D9D80](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.double x = v2;
  return result;
}

CGRect CGContextConvertRectToUserSpace(CGContextRef c, CGRect rect)
{
  MEMORY[0x1F40D9D88](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.double x = v2;
  return result;
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillRects(CGContextRef c, const CGRect *rects, size_t count)
{
}

uint64_t CGContextGetBaseCTM()
{
  return MEMORY[0x1F40D9F58]();
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9F68](retstr, c);
}

uint64_t CGContextGetCompositeOperation()
{
  return MEMORY[0x1F40D9F80]();
}

uint64_t CGContextGetFontRenderingStyle()
{
  return MEMORY[0x1F40D9FA8]();
}

uint64_t CGContextGetStrokeColorAsColor()
{
  return MEMORY[0x1F40DA010]();
}

CGAffineTransform *__cdecl CGContextGetTextMatrix(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1F40DA020](retstr, c);
}

uint64_t CGContextGetType()
{
  return MEMORY[0x1F40DA030]();
}

CGAffineTransform *__cdecl CGContextGetUserSpaceToDeviceSpaceTransform(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1F40DA038](retstr, c);
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

CGContextRef CGContextRetain(CGContextRef c)
{
  return (CGContextRef)MEMORY[0x1F40DA090](c);
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

uint64_t CGContextSetCTM()
{
  return MEMORY[0x1F40DA0F0]();
}

void CGContextSetCharacterSpacing(CGContextRef c, CGFloat spacing)
{
}

uint64_t CGContextSetCompositeOperation()
{
  return MEMORY[0x1F40DA100]();
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetFont(CGContextRef c, CGFontRef font)
{
}

uint64_t CGContextSetFontRenderingStyle()
{
  return MEMORY[0x1F40DA148]();
}

void CGContextSetFontSize(CGContextRef c, CGFloat size)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetPatternPhase(CGContextRef c, CGSize phase)
{
}

void CGContextSetShadow(CGContextRef c, CGSize offset, CGFloat blur)
{
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

void CGContextSetTextDrawingMode(CGContextRef c, CGTextDrawingMode mode)
{
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

uint64_t CGFontCreateGlyphPath()
{
  return MEMORY[0x1F40DA428]();
}

uint64_t CGFontGetGlyphVerticalOffsets()
{
  return MEMORY[0x1F40DA4F0]();
}

uint64_t CGFontGetGlyphsForCIDs()
{
  return MEMORY[0x1F40DA500]();
}

uint64_t CGFontGetRegistryOrderingSupplement()
{
  return MEMORY[0x1F40DA538]();
}

int CGFontGetUnitsPerEm(CGFontRef font)
{
  return MEMORY[0x1F40DA560](font);
}

void CGImageRelease(CGImageRef image)
{
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E99F8](isrc);
}

void CGPDFContextSetURLForRect(CGContextRef context, CFURLRef url, CGRect rect)
{
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGPathRef CGPathCreateCopy(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1F40DB010](path);
}

CGPathRef CGPathCreateCopyByUnioningPath(CGPathRef path, CGPathRef maskPath, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x1F40DB050](path, maskPath, evenOddFillRule);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0A8](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0B0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

uint64_t CGPathCreateWithUnevenCornersRoundedRect()
{
  return MEMORY[0x1F40DB0C0]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.double x = v2;
  return result;
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.double x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.double x = v1;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1F40DB2F0](dict, rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.double x = v2;
  return result;
}

CFTypeRef CTFontCopyAttribute(CTFontRef font, CFStringRef attribute)
{
  return (CFTypeRef)MEMORY[0x1F40DF270](font, attribute);
}

CFCharacterSetRef CTFontCopyCharacterSet(CTFontRef font)
{
  return (CFCharacterSetRef)MEMORY[0x1F40DF280](font);
}

CFStringRef CTFontCopyFamilyName(CTFontRef font)
{
  return (CFStringRef)MEMORY[0x1F40DF298](font);
}

CFArrayRef CTFontCopyFeatureSettings(CTFontRef font)
{
  return (CFArrayRef)MEMORY[0x1F40DF2A0](font);
}

CTFontDescriptorRef CTFontCopyFontDescriptor(CTFontRef font)
{
  return (CTFontDescriptorRef)MEMORY[0x1F40DF2B8](font);
}

CGFontRef CTFontCopyGraphicsFont(CTFontRef font, CTFontDescriptorRef *attributes)
{
  return (CGFontRef)MEMORY[0x1F40DF2D0](font, attributes);
}

CFStringRef CTFontCopyPostScriptName(CTFontRef font)
{
  return (CFStringRef)MEMORY[0x1F40DF2E8](font);
}

uint64_t CTFontCreateEmojiFontForFont()
{
  return MEMORY[0x1F40DF348]();
}

uint64_t CTFontCreateForCharactersWithLanguage()
{
  return MEMORY[0x1F40DF350]();
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return (CTFontRef)MEMORY[0x1F40DF370](*(void *)&uiType, language, size);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1F40DF378](descriptor, matrix, size);
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return (CTFontRef)MEMORY[0x1F40DF398](name, matrix, options, size);
}

uint64_t CTFontDescriptorCanCreateWithTextStyle()
{
  return MEMORY[0x1F40DF3A0]();
}

CFTypeRef CTFontDescriptorCopyAttribute(CTFontDescriptorRef descriptor, CFStringRef attribute)
{
  return (CFTypeRef)MEMORY[0x1F40DF3A8](descriptor, attribute);
}

CFDictionaryRef CTFontDescriptorCopyAttributes(CTFontDescriptorRef descriptor)
{
  return (CFDictionaryRef)MEMORY[0x1F40DF3B0](descriptor);
}

CTFontDescriptorRef CTFontDescriptorCreateCopyWithAttributes(CTFontDescriptorRef original, CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1F40DF3C0](original, attributes);
}

CTFontDescriptorRef CTFontDescriptorCreateCopyWithSymbolicTraits(CTFontDescriptorRef original, CTFontSymbolicTraits symTraitValue, CTFontSymbolicTraits symTraitMask)
{
  return (CTFontDescriptorRef)MEMORY[0x1F40DF3D0](original, *(void *)&symTraitValue, *(void *)&symTraitMask);
}

CTFontDescriptorRef CTFontDescriptorCreateMatchingFontDescriptor(CTFontDescriptorRef descriptor, CFSetRef mandatoryAttributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1F40DF3F0](descriptor, mandatoryAttributes);
}

CFArrayRef CTFontDescriptorCreateMatchingFontDescriptors(CTFontDescriptorRef descriptor, CFSetRef mandatoryAttributes)
{
  return (CFArrayRef)MEMORY[0x1F40DF3F8](descriptor, mandatoryAttributes);
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1F40DF408](attributes);
}

uint64_t CTFontDescriptorCreateWithAttributesAndOptions()
{
  return MEMORY[0x1F40DF410]();
}

CTFontDescriptorRef CTFontDescriptorCreateWithNameAndSize(CFStringRef name, CGFloat size)
{
  return (CTFontDescriptorRef)MEMORY[0x1F40DF418](name, size);
}

uint64_t CTFontDescriptorCreateWithTextStyleAndAttributes()
{
  return MEMORY[0x1F40DF428]();
}

uint64_t CTFontDescriptorGetContentSizeCategoryIndex()
{
  return MEMORY[0x1F40DF430]();
}

uint64_t CTFontDescriptorGetOptions()
{
  return MEMORY[0x1F40DF438]();
}

uint64_t CTFontDescriptorGetSymbolicTraits()
{
  return MEMORY[0x1F40DF440]();
}

uint64_t CTFontDescriptorGetTextStyleSize()
{
  return MEMORY[0x1F40DF448]();
}

CFTypeID CTFontDescriptorGetTypeID(void)
{
  return MEMORY[0x1F40DF458]();
}

uint64_t CTFontDescriptorsCopyAttribute()
{
  return MEMORY[0x1F40DF470]();
}

uint64_t CTFontDrawGlyphsAtPositions()
{
  return MEMORY[0x1F40DF480]();
}

uint64_t CTFontDrawGlyphsWithAdvances()
{
  return MEMORY[0x1F40DF488]();
}

double CTFontGetAdvancesForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGSize *advances, CFIndex count)
{
  MEMORY[0x1F40DF4A0](font, *(void *)&orientation, glyphs, advances, count);
  return result;
}

CGFloat CTFontGetAscent(CTFontRef font)
{
  MEMORY[0x1F40DF4A8](font);
  return result;
}

CGRect CTFontGetBoundingBox(CTFontRef font)
{
  MEMORY[0x1F40DF4B8](font);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.double x = v1;
  return result;
}

CGRect CTFontGetBoundingRectsForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGRect *boundingRects, CFIndex count)
{
  MEMORY[0x1F40DF4C0](font, *(void *)&orientation, glyphs, boundingRects, count);
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.double x = v5;
  return result;
}

CGFloat CTFontGetCapHeight(CTFontRef font)
{
  MEMORY[0x1F40DF4C8](font);
  return result;
}

uint64_t CTFontGetClientObject()
{
  return MEMORY[0x1F40DF4D8]();
}

CGFloat CTFontGetDescent(CTFontRef font)
{
  MEMORY[0x1F40DF4E0](font);
  return result;
}

CFIndex CTFontGetGlyphCount(CTFontRef font)
{
  return MEMORY[0x1F40DF4F8](font);
}

CGGlyph CTFontGetGlyphWithName(CTFontRef font, CFStringRef glyphName)
{
  return MEMORY[0x1F40DF500](font, glyphName);
}

BOOL CTFontGetGlyphsForCharacters(CTFontRef font, const UniChar *characters, CGGlyph *glyphs, CFIndex count)
{
  return MEMORY[0x1F40DF510](font, characters, glyphs, count);
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x1F40DF518]();
}

CGFloat CTFontGetLeading(CTFontRef font)
{
  MEMORY[0x1F40DF528](font);
  return result;
}

CFIndex CTFontGetLigatureCaretPositions(CTFontRef font, CGGlyph glyph, CGFloat *positions, CFIndex maxPositions)
{
  return MEMORY[0x1F40DF530](font, glyph, positions, maxPositions);
}

CGAffineTransform *__cdecl CTFontGetMatrix(CGAffineTransform *__return_ptr retstr, CTFontRef font)
{
  return (CGAffineTransform *)MEMORY[0x1F40DF538](retstr, font);
}

CGFloat CTFontGetSize(CTFontRef font)
{
  MEMORY[0x1F40DF558](font);
  return result;
}

CFStringEncoding CTFontGetStringEncoding(CTFontRef font)
{
  return MEMORY[0x1F40DF560](font);
}

CTFontSymbolicTraits CTFontGetSymbolicTraits(CTFontRef font)
{
  return MEMORY[0x1F40DF568](font);
}

uint64_t CTFontGetTransformedAdvancesForGlyphsAndStyle()
{
  return MEMORY[0x1F40DF578]();
}

CFTypeID CTFontGetTypeID(void)
{
  return MEMORY[0x1F40DF580]();
}

uint64_t CTFontGetUIFontType()
{
  return MEMORY[0x1F40DF598]();
}

CGFloat CTFontGetUnderlinePosition(CTFontRef font)
{
  MEMORY[0x1F40DF5A0](font);
  return result;
}

CGFloat CTFontGetUnderlineThickness(CTFontRef font)
{
  MEMORY[0x1F40DF5A8](font);
  return result;
}

unsigned int CTFontGetUnitsPerEm(CTFontRef font)
{
  return MEMORY[0x1F40DF5B0](font);
}

uint64_t CTFontGetWeight()
{
  return MEMORY[0x1F40DF5D0]();
}

CGFloat CTFontGetXHeight(CTFontRef font)
{
  MEMORY[0x1F40DF5D8](font);
  return result;
}

uint64_t CTFontHasExuberatedLineHeight()
{
  return MEMORY[0x1F40DF5E0]();
}

uint64_t CTFontHasTable()
{
  return MEMORY[0x1F40DF5F0]();
}

uint64_t CTFontIsLastResort()
{
  return MEMORY[0x1F40DF608]();
}

uint64_t CTFontIsSystemUIFont()
{
  return MEMORY[0x1F40DF610]();
}

uint64_t CTFontIsTextStyleFont()
{
  return MEMORY[0x1F40DF618]();
}

uint64_t CTFontIsVertical()
{
  return MEMORY[0x1F40DF620]();
}

CFArrayRef CTFontManagerCopyAvailableFontFamilyNames(void)
{
  return (CFArrayRef)MEMORY[0x1F40DF628]();
}

uint64_t CTFontSetClientObject()
{
  return MEMORY[0x1F40DF670]();
}

uint64_t CTFontSwapDefaultLineHeightAdjustment()
{
  return MEMORY[0x1F40DF680]();
}

uint64_t CTFontSwapDefaultSize()
{
  return MEMORY[0x1F40DF688]();
}

uint64_t CTFontTransformGlyphsWithLanguage()
{
  return MEMORY[0x1F40DF698]();
}

uint64_t CTFramesetterCreateCGRectArray()
{
  return MEMORY[0x1F40DF6D8]();
}

uint64_t CTFramesetterFindRectPosition()
{
  return MEMORY[0x1F40DF6F8]();
}

CTCharacterCollection CTGlyphInfoGetCharacterCollection(CTGlyphInfoRef glyphInfo)
{
  return (unsigned __int16)MEMORY[0x1F40DF710](glyphInfo);
}

CGFontIndex CTGlyphInfoGetCharacterIdentifier(CTGlyphInfoRef glyphInfo)
{
  return MEMORY[0x1F40DF718](glyphInfo);
}

CFStringRef CTGlyphInfoGetGlyphName(CTGlyphInfoRef glyphInfo)
{
  return (CFStringRef)MEMORY[0x1F40DF720](glyphInfo);
}

CFTypeID CTGlyphInfoGetTypeID(void)
{
  return MEMORY[0x1F40DF728]();
}

uint64_t CTGlyphStorageCreateMutableWithInterface()
{
  return MEMORY[0x1F40DF730]();
}

uint64_t CTGlyphStorageGetRefCon()
{
  return MEMORY[0x1F40DF738]();
}

uint64_t CTGlyphStorageSyncWithInterface()
{
  return MEMORY[0x1F40DF740]();
}

uint64_t CTLineCreateFromLineWithOffset()
{
  return MEMORY[0x1F40DF758]();
}

uint64_t CTLineCreateHyphenatedLineWithOffset()
{
  return MEMORY[0x1F40DF760]();
}

CTLineRef CTLineCreateJustifiedLine(CTLineRef line, CGFloat justificationFactor, double justificationWidth)
{
  return (CTLineRef)MEMORY[0x1F40DF768](line, justificationFactor, justificationWidth);
}

uint64_t CTLineCreateJustifiedLineWithOptions()
{
  return MEMORY[0x1F40DF770]();
}

uint64_t CTLineCreateTruncatedLineWithTokenCallback()
{
  return MEMORY[0x1F40DF780]();
}

uint64_t CTLineCreateTruncatedLineWithTokenHandler()
{
  return MEMORY[0x1F40DF788]();
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1F40DF790](attrString);
}

uint64_t CTLineCreateWithRunArray()
{
  return MEMORY[0x1F40DF798]();
}

uint64_t CTLineCreateWithString()
{
  return MEMORY[0x1F40DF7A0]();
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
}

uint64_t CTLineDrawWithAttributeOverrides()
{
  return MEMORY[0x1F40DF7B8]();
}

void CTLineEnumerateCaretOffsets(CTLineRef line, void *block)
{
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  MEMORY[0x1F40DF7C8](line, options);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.double x = v2;
  return result;
}

CFIndex CTLineGetGlyphCount(CTLineRef line)
{
  return MEMORY[0x1F40DF7D8](line);
}

CFArrayRef CTLineGetGlyphRuns(CTLineRef line)
{
  return (CFArrayRef)MEMORY[0x1F40DF7E0](line);
}

CGRect CTLineGetImageBounds(CTLineRef line, CGContextRef context)
{
  MEMORY[0x1F40DF7E8](line, context);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.double x = v2;
  return result;
}

CGFloat CTLineGetOffsetForStringIndex(CTLineRef line, CFIndex charIndex, CGFloat *secondaryOffset)
{
  MEMORY[0x1F40DF7F0](line, charIndex, secondaryOffset);
  return result;
}

double CTLineGetPenOffsetForFlush(CTLineRef line, CGFloat flushFactor, double flushWidth)
{
  MEMORY[0x1F40DF7F8](line, flushFactor, flushWidth);
  return result;
}

uint64_t CTLineGetStringIndexOfTabOverflow()
{
  return MEMORY[0x1F40DF808]();
}

CFRange CTLineGetStringRange(CTLineRef line)
{
  CFIndex v1 = MEMORY[0x1F40DF810](line);
  result.NSUInteger length = v2;
  result.unint64_t location = v1;
  return result;
}

double CTLineGetTrailingWhitespaceWidth(CTLineRef line)
{
  MEMORY[0x1F40DF818](line);
  return result;
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  MEMORY[0x1F40DF820](line, ascent, descent, leading);
  return result;
}

uint64_t CTLineHasBidiLevels()
{
  return MEMORY[0x1F40DF830]();
}

uint64_t CTLineIsRightToLeft()
{
  return MEMORY[0x1F40DF838]();
}

uint64_t CTLineSuggestClusterBreakWithOffset()
{
  return MEMORY[0x1F40DF840]();
}

uint64_t CTLineSuggestClusterBreakWithTabOverflow()
{
  return MEMORY[0x1F40DF848]();
}

uint64_t CTLineSuggestLineBreakWithTabOverflow()
{
  return MEMORY[0x1F40DF858]();
}

uint64_t CTLineSyncWithRuns()
{
  return MEMORY[0x1F40DF860]();
}

uint64_t CTRunCreateMutableRunsWithStorageAndOptions()
{
  return MEMORY[0x1F40DF890]();
}

CTRunDelegateRef CTRunDelegateCreate(const CTRunDelegateCallbacks *callbacks, void *refCon)
{
  return (CTRunDelegateRef)MEMORY[0x1F40DF898](callbacks, refCon);
}

CFDictionaryRef CTRunGetAttributes(CTRunRef run)
{
  return (CFDictionaryRef)MEMORY[0x1F40DF8B8](run);
}

void CTRunGetBaseAdvancesAndOrigins(CTRunRef runRef, CFRange range, CGSize *advancesBuffer, CGPoint *originsBuffer)
{
}

uint64_t CTRunGetFont()
{
  return MEMORY[0x1F40DF8D0]();
}

CFIndex CTRunGetGlyphCount(CTRunRef run)
{
  return MEMORY[0x1F40DF8D8](run);
}

uint64_t CTRunGetGlyphStorage()
{
  return MEMORY[0x1F40DF8E0]();
}

uint64_t CTRunGetInitialAdvance()
{
  return MEMORY[0x1F40DF900]();
}

uint64_t CTRunGetInitialBaseAdvance()
{
  return MEMORY[0x1F40DF908]();
}

void CTRunGetPositions(CTRunRef run, CFRange range, CGPoint *buffer)
{
}

uint64_t CTRunGetPropertiesPtr()
{
  return MEMORY[0x1F40DF920]();
}

CTRunStatus CTRunGetStatus(CTRunRef run)
{
  return MEMORY[0x1F40DF928](run);
}

void CTRunGetStringIndices(CTRunRef run, CFRange range, CFIndex *buffer)
{
}

CFRange CTRunGetStringRange(CTRunRef run)
{
  CFIndex v1 = MEMORY[0x1F40DF940](run);
  result.NSUInteger length = v2;
  result.unint64_t location = v1;
  return result;
}

double CTRunGetTypographicBounds(CTRunRef run, CFRange range, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  MEMORY[0x1F40DF950](run, range.location, range.length, ascent, descent, leading);
  return result;
}

uint64_t CTRunSyncWithStorage()
{
  return MEMORY[0x1F40DF958]();
}

uint64_t CTSwapLineBreakEpsilon()
{
  return MEMORY[0x1F40DF970]();
}

CTLineRef CTTypesetterCreateLine(CTTypesetterRef typesetter, CFRange stringRange)
{
  return (CTLineRef)MEMORY[0x1F40DF990](typesetter, stringRange.location, stringRange.length);
}

CTTypesetterRef CTTypesetterCreateWithAttributedStringAndOptions(CFAttributedStringRef string, CFDictionaryRef options)
{
  return (CTTypesetterRef)MEMORY[0x1F40DF9A0](string, options);
}

uint64_t CTTypesetterCreateWithRunArray()
{
  return MEMORY[0x1F40DF9A8]();
}

uint64_t CTTypesetterCreateWithRunArrayAndOptions()
{
  return MEMORY[0x1F40DF9B0]();
}

CFIndex CTTypesetterSuggestClusterBreak(CTTypesetterRef typesetter, CFIndex startIndex, double width)
{
  return MEMORY[0x1F40DF9C0](typesetter, startIndex, width);
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1F40E6FD8](table);
}

void *__cdecl NSAllocateCollectable(NSUInteger size, NSUInteger options)
{
  return (void *)MEMORY[0x1F40E6FE8](size, options);
}

id NSAllocateObject(Class aClass, NSUInteger extraBytes, NSZone *zone)
{
  return (id)MEMORY[0x1F40E6FF0](aClass, extraBytes, zone);
}

uint64_t NSAllocateScannedUncollectable()
{
  return MEMORY[0x1F40E6FF8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

BOOL NSContainsRect(NSRect aRect, NSRect bRect)
{
  return MEMORY[0x1F40E7028]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
}

NSMapTable *__cdecl NSCreateMapTableWithZone(NSMapTableKeyCallBacks *keyCallBacks, NSMapTableValueCallBacks *valueCallBacks, NSUInteger capacity, NSZone *zone)
{
  return (NSMapTable *)MEMORY[0x1F40E7058](keyCallBacks, valueCallBacks, capacity, zone);
}

void NSDeallocateObject(id object)
{
}

BOOL NSEqualPoints(NSPoint aPoint, NSPoint bPoint)
{
  return MEMORY[0x1F40E70B8]((__n128)aPoint, *(__n128 *)&aPoint.y, (__n128)bPoint, *(__n128 *)&bPoint.y);
}

BOOL NSEqualRects(NSRect aRect, NSRect bRect)
{
  return MEMORY[0x1F40E70C0]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
}

BOOL NSEqualSizes(NSSize aSize, NSSize bSize)
{
  return MEMORY[0x1F40E70C8]((__n128)aSize, *(__n128 *)&aSize.height, (__n128)bSize, *(__n128 *)&bSize.height);
}

void NSFreeMapTable(NSMapTable *table)
{
}

NSRect NSInsetRect(NSRect aRect, CGFloat dX, CGFloat dY)
{
  MEMORY[0x1F40E7128]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, dX, dY);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.double x = v3;
  return result;
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.NSUInteger length = v3;
  result.unint64_t location = v2;
  return result;
}

NSRect NSIntersectionRect(NSRect aRect, NSRect bRect)
{
  MEMORY[0x1F40E7148]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.double x = v2;
  return result;
}

uint64_t NSIntersectsRange()
{
  return MEMORY[0x1F40E7150]();
}

BOOL NSIntersectsRect(NSRect aRect, NSRect bRect)
{
  return MEMORY[0x1F40E7158]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
}

BOOL NSIsEmptyRect(NSRect aRect)
{
  return MEMORY[0x1F40E7160]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

void NSLog(NSString *format, ...)
{
}

void NSLogv(NSString *format, va_list args)
{
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1F40E7180](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

void NSMapInsertKnownAbsent(NSMapTable *table, const void *key, const void *value)
{
}

BOOL NSPointInRect(NSPoint aPoint, NSRect aRect)
{
  return MEMORY[0x1F40E71D8]((__n128)aPoint, *(__n128 *)&aPoint.y, (__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

uint64_t NSPopAutoreleasePool()
{
  return MEMORY[0x1F40E71E0]();
}

uint64_t NSPushAutoreleasePool()
{
  return MEMORY[0x1F40E71F0]();
}

void *__cdecl NSReallocateCollectable(void *ptr, NSUInteger size, NSUInteger options)
{
  return (void *)MEMORY[0x1F40E7208](ptr, size, options);
}

uint64_t NSReallocateScannedUncollectable()
{
  return MEMORY[0x1F40E7210]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1F40E7228]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x1F40E7290]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1F40E72A8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1F40E72C0]((__n128)aSize, *(__n128 *)&aSize.height);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.NSUInteger length = v3;
  result.unint64_t location = v2;
  return result;
}

NSRect NSUnionRect(NSRect aRect, NSRect bRect)
{
  MEMORY[0x1F40E72E8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.double x = v2;
  return result;
}

void *__cdecl NSZoneCalloc(NSZone *zone, NSUInteger numElems, NSUInteger byteSize)
{
  return (void *)MEMORY[0x1F40E72F8](zone, numElems, byteSize);
}

void NSZoneFree(NSZone *zone, void *ptr)
{
}

NSZone *__cdecl NSZoneFromPointer(void *ptr)
{
  return (NSZone *)MEMORY[0x1F40E7308](ptr);
}

void *__cdecl NSZoneMalloc(NSZone *zone, NSUInteger size)
{
  return (void *)MEMORY[0x1F40E7310](zone, size);
}

void *__cdecl NSZoneRealloc(NSZone *zone, void *ptr, NSUInteger size)
{
  return (void *)MEMORY[0x1F40E7318](zone, ptr, size);
}

uint64_t _AXSEnhanceTextLegibilityEnabled()
{
  return MEMORY[0x1F4178A88]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFExecutableLinkedOnOrAfter()
{
  return MEMORY[0x1F40D8DB8]();
}

uint64_t _CFHyphenationGetAllPossibleHyphenationLocations()
{
  return MEMORY[0x1F40D8E10]();
}

uint64_t _CFIsDeallocating()
{
  return MEMORY[0x1F40D8E18]();
}

uint64_t _CFNonObjCEqual()
{
  return MEMORY[0x1F40D8EA8]();
}

uint64_t _CFNonObjCHash()
{
  return MEMORY[0x1F40D8EB0]();
}

uint64_t _CFNonObjCRelease()
{
  return MEMORY[0x1F40D8EB8]();
}

uint64_t _CFNonObjCRetain()
{
  return MEMORY[0x1F40D8EC0]();
}

uint64_t _CFStringTokenizerSetLocale()
{
  return MEMORY[0x1F40D9190]();
}

uint64_t _CFTryRetain()
{
  return MEMORY[0x1F40D91E0]();
}

uint64_t _CTFontCreateWithNameAndSymbolicTraits()
{
  return MEMORY[0x1F40DF9D8]();
}

uint64_t _CTGetVisibleFormatterCharacterSet()
{
  return MEMORY[0x1F40DF9E0]();
}

uint64_t _CTGlyphInfoGetFont()
{
  return MEMORY[0x1F40DF9F0]();
}

uint64_t _CTGlyphInfoGetGlyph()
{
  return MEMORY[0x1F40DF9F8]();
}

uint64_t _NSEncodingFromDataForExtendedAttribute()
{
  return MEMORY[0x1F40E7330]();
}

uint64_t _NSFaultInObject()
{
  return MEMORY[0x1F40E7350]();
}

uint64_t _NSFullMethodName()
{
  return MEMORY[0x1F40E7358]();
}

uint64_t _NSMethodExceptionProem()
{
  return MEMORY[0x1F40E7398]();
}

uint64_t _NSReadExtendedAttributesFromFileDescriptor()
{
  return MEMORY[0x1F40E73A8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __CFStringEncodeByteStream()
{
  return MEMORY[0x1F40D95E8]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1F40C9C30]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x1F40C9C38]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1F40C9CD0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void *__cdecl bsearch_b(const void *__key, const void *__base, size_t __nel, size_t __width, void *__compar)
{
  return (void *)MEMORY[0x1F40CA578](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1F41814C8](cls, name, imp, types);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x1F4181530](cls);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1F4181540](cls, name);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_program_minos_at_least()
{
  return MEMORY[0x1F40CBEC0]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

const char *__cdecl fmtcheck(const char *a1, const char *a2)
{
  return (const char *)MEMORY[0x1F40CC1B0](a1, a2);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void memset_pattern8(void *__b, const void *__pattern8, size_t __len)
{
}

objc_method_description *__cdecl method_getDescription(Method m)
{
  return (objc_method_description *)MEMORY[0x1F41815F0](m);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1F41815F8](m);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1F4181778](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

Class objc_lookUpClass(const char *name)
{
  return (Class)MEMORY[0x1F4181788](name);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_storeWeakOrNil(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A20](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

Class object_setClass(id a1, Class a2)
{
  return (Class)MEMORY[0x1F4181A90](a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1F40CD5E8]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40CDA20](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1F40CDA40](a1, a2);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDAE8](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x1F40CDAF0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDAF8](a1);
}

int pthread_rwlock_trywrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDB08](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1F40CDB10](a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40CDB70](a1, a2);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1F40CDE08]();
}

SEL sel_getUid(const char *str)
{
  return (SEL)MEMORY[0x1F4181B30](str);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1F40CE1D8](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1F40CE200](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1F40CE210](__big, __little, __len);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

uint64_t ubrk_clone()
{
  return MEMORY[0x1F417FA28]();
}

uint64_t ubrk_close()
{
  return MEMORY[0x1F417FA30]();
}

uint64_t ubrk_following()
{
  return MEMORY[0x1F417FA50]();
}

uint64_t ubrk_next()
{
  return MEMORY[0x1F417FA78]();
}

uint64_t ubrk_open()
{
  return MEMORY[0x1F417FA80]();
}

uint64_t ubrk_preceding()
{
  return MEMORY[0x1F417FA88]();
}

uint64_t ubrk_setLineWordOpts()
{
  return MEMORY[0x1F417FA98]();
}

uint64_t ubrk_setText()
{
  return MEMORY[0x1F417FAA0]();
}

uint64_t ubrk_setUText()
{
  return MEMORY[0x1F417FAA8]();
}

UText *__cdecl utext_close(UText *ut)
{
  return (UText *)MEMORY[0x1F4180780](ut);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1F40CE790](__str, __size, __format, a4);
}