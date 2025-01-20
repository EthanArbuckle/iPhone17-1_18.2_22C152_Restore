@interface TSUDateParser
+ (id)parserForDefaultLocale;
- (TSUDateParser)initWithLocale:(__CFLocale *)a3;
- (__CFDate)newDateFromString:(__CFString *)a3 preferredFormatString:(__CFString *)a4 successfulFormatString:(const __CFString *)a5 tryAggressiveFormats:(BOOL)a6;
- (__CFDate)newDateFromString:(__CFString *)a3 successfulFormatString:(const __CFString *)a4;
- (__CFDate)newDateFromStringTryingFormats:(__CFString *)a3 locale:(__CFLocale *)a4 formats:(id)a5 outSuccessfulFormatString:(const __CFString *)a6;
- (__CFDateFormatter)specialCaseDateFormatterForLocale:(__CFLocale *)a3;
- (void)addFormat:(id)a3 locale:(__CFLocale *)a4 formatCategoryMap:(id)a5;
- (void)datePreferencesChanged:(id)a3;
- (void)dealloc;
- (void)parseFormat:(id)a3 initialPattern:(id *)a4 separator:(unsigned __int16 *)a5;
@end

@implementation TSUDateParser

+ (id)parserForDefaultLocale
{
  v2 = (void *)[MEMORY[0x263F08B88] currentThread];
  v3 = (void *)[v2 threadDictionary];
  v4 = (void *)[v3 objectForKey:@"TSUDateParserThreadDictionaryKey"];
  if (!v4)
  {
    v4 = objc_msgSend(+[TSUDateParserLibrary sharedDateParserLibrary](TSUDateParserLibrary, "sharedDateParserLibrary"), "checkoutDateParser");
    [v3 setObject:v4 forKey:@"TSUDateParserThreadDictionaryKey"];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __39__TSUDateParser_parserForDefaultLocale__block_invoke;
    v9[3] = &unk_26462A148;
    v9[4] = v2;
    v9[5] = v4;
    [v3 setObject:TSURegisterLocaleChangeObserver((uint64_t)v9) forKey:@"TSUDateParserThreadDictionaryLocaleObserverKey"];
    v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    uint64_t v6 = *MEMORY[0x263F08520];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __39__TSUDateParser_parserForDefaultLocale__block_invoke_2;
    v8[3] = &unk_26462A170;
    v8[4] = v4;
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v6, v2, 0, v8), @"TSUDateParserThreadDictionaryExitObserverKey");
  }
  return v4;
}

uint64_t __39__TSUDateParser_parserForDefaultLocale__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [MEMORY[0x263F08B88] currentThread];
  v5 = *(void **)(a1 + 32);
  if ((void *)v4 == v5)
  {
    v7 = *(void **)(a1 + 40);
    return [v7 datePreferencesChanged:a2];
  }
  else
  {
    uint64_t result = [v5 isFinished];
    if ((result & 1) == 0)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      v8 = *(void **)(a1 + 40);
      return [v8 performSelector:sel_datePreferencesChanged_ onThread:v9 withObject:a2 waitUntilDone:0];
    }
  }
  return result;
}

uint64_t __39__TSUDateParser_parserForDefaultLocale__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) datePreferencesChanged:a2];
}

- (TSUDateParser)initWithLocale:(__CFLocale *)a3
{
  v27.receiver = self;
  v27.super_class = (Class)TSUDateParser;
  uint64_t v4 = [(TSUDateParser *)&v27 init];
  if (v4)
  {
    v4->mFormatCategories = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    if (a3) {
      CFLocaleRef v5 = (const __CFLocale *)CFRetain(a3);
    }
    else {
      CFLocaleRef v5 = TSUCopyCurrentLocaleWithGregorianCalendar();
    }
    v4->mLocale = v5;
    CFStringRef Value = (const __CFString *)CFLocaleGetValue(v5, (CFLocaleKey)*MEMORY[0x263EFFCB0]);
    CFStringRef v7 = (const __CFString *)CFLocaleGetValue(v4->mLocale, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
    if (Value)
    {
      CFStringRef v8 = v7;
      BOOL v9 = CFStringCompare(Value, @"JP", 1uLL) || v8 == 0;
      if (!v9 && CFStringCompare(v8, @"ja", 1uLL) == kCFCompareEqualTo) {
        v4->mIsJapaneseLocale = 1;
      }
    }
    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    CFArrayRef v11 = (const __CFArray *)TSUCreateArrayOfDateFormatStringsForLocale(v4->mLocale);
    CFArrayRef v12 = (const __CFArray *)TSUCreateArrayOfTimeFormatStringsForLocale(v4->mLocale);
    CFIndex Count = CFArrayGetCount(v11);
    CFIndex v14 = CFArrayGetCount(v12);
    if (Count >= 1)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(v11, i);
        v17 = (void *)[ValueAtIndex stringByAppendingString:@" "];
        [(TSUDateParser *)v4 addFormat:ValueAtIndex locale:v4->mLocale formatCategoryMap:v10];
        if (v14 >= 1)
        {
          for (CFIndex j = 0; j != v14; ++j)
            -[TSUDateParser addFormat:locale:formatCategoryMap:](v4, "addFormat:locale:formatCategoryMap:", objc_msgSend(v17, "stringByAppendingString:", CFArrayGetValueAtIndex(v12, j)), v4->mLocale, v10);
        }
      }
    }
    if (v14 >= 1)
    {
      for (CFIndex k = 0; k != v14; ++k)
      {
        v20 = (void *)CFArrayGetValueAtIndex(v12, k);
        v21 = (void *)[v20 stringByAppendingString:@" "];
        [(TSUDateParser *)v4 addFormat:v20 locale:v4->mLocale formatCategoryMap:v10];
        if (Count >= 1)
        {
          for (CFIndex m = 0; m != Count; ++m)
            -[TSUDateParser addFormat:locale:formatCategoryMap:](v4, "addFormat:locale:formatCategoryMap:", objc_msgSend(v21, "stringByAppendingString:", CFArrayGetValueAtIndex(v11, m)), v4->mLocale, v10);
        }
      }
    }
    CFRelease(v12);
    CFRelease(v11);
    for (CFDateFormatterStyle n = kCFDateFormatterNoStyle; n != (kCFDateFormatterFullStyle|kCFDateFormatterShortStyle); ++n)
    {
      for (iCFIndex i = kCFDateFormatterNoStyle; ii != (kCFDateFormatterFullStyle|kCFDateFormatterShortStyle); ++ii)
      {
        if (ii | n)
        {
          v25 = CFDateFormatterCreate(0, v4->mLocale, n, ii);
          [(TSUDateParser *)v4 addFormat:CFDateFormatterGetFormat(v25) locale:v4->mLocale formatCategoryMap:v10];
          CFRelease(v25);
        }
      }
    }
    [(TSUDateParser *)v4 addFormat:TSUDefaultDateTimeFormat() locale:v4->mLocale formatCategoryMap:v10];
  }
  return v4;
}

- (void)dealloc
{
  mSpecialCaseFormatter = self->mSpecialCaseFormatter;
  if (mSpecialCaseFormatter) {
    CFRelease(mSpecialCaseFormatter);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSUDateParser;
  [(TSUDateParser *)&v4 dealloc];
}

- (__CFDateFormatter)specialCaseDateFormatterForLocale:(__CFLocale *)a3
{
  mSpecialCaseFormatter = self->mSpecialCaseFormatter;
  if (!mSpecialCaseFormatter)
  {
LABEL_5:
    CFStringRef v7 = CFDateFormatterCreate(0, a3, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
    self->mSpecialCaseFormatter = v7;
    CFDateFormatterSetProperty(v7, (CFStringRef)*MEMORY[0x263EFFBA0], (CFTypeRef)*MEMORY[0x263EFFB38]);
    CFStringRef v8 = self->mSpecialCaseFormatter;
    CFStringRef v9 = (const __CFString *)*MEMORY[0x263EFFC10];
    CFTimeZoneRef v10 = TSUGetGMTTimeZone();
    CFDateFormatterSetProperty(v8, v9, v10);
    return self->mSpecialCaseFormatter;
  }
  if (CFDateFormatterGetLocale(mSpecialCaseFormatter) != a3)
  {
    uint64_t v6 = self->mSpecialCaseFormatter;
    if (v6) {
      CFRelease(v6);
    }
    goto LABEL_5;
  }
  return self->mSpecialCaseFormatter;
}

- (__CFDate)newDateFromStringTryingFormats:(__CFString *)a3 locale:(__CFLocale *)a4 formats:(id)a5 outSuccessfulFormatString:(const __CFString *)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (a4)
  {
    CFTimeZoneRef v10 = [(TSUDateParser *)self specialCaseDateFormatterForLocale:a4];
  }
  else
  {
    CFLocaleRef v11 = TSUCopyCurrentLocaleWithGregorianCalendar();
    CFTimeZoneRef v10 = [(TSUDateParser *)self specialCaseDateFormatterForLocale:v11];
    CFRelease(v11);
  }
  CFIndex Length = CFStringGetLength(a3);
  rangep.locatioCFDateFormatterStyle n = 0;
  rangep.length = Length;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v13 = [a5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    v22 = a6;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(a5);
        }
        v17 = *(__CFString **)(*((void *)&v23 + 1) + 8 * i);
        CFDateFormatterSetFormat(v10, v17);
        CFDateRef v18 = CFDateFormatterCreateDateFromString(0, v10, a3, &rangep);
        if (v18)
        {
          CFDateRef v19 = v18;
          if (rangep.location || rangep.length != Length)
          {
            CFRelease(v18);
          }
          else
          {
            v20 = TSUCreateDateWithGregorianUnitsSetToDefaultValue((uint64_t)v18, v17);
            CFRelease(v19);
            if (v22) {
              *v22 = CFStringCreateCopy(0, v17);
            }
            if (v20) {
              return v20;
            }
          }
        }
      }
      uint64_t v14 = [a5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v14);
  }
  return 0;
}

- (__CFDate)newDateFromString:(__CFString *)a3 preferredFormatString:(__CFString *)a4 successfulFormatString:(const __CFString *)a5 tryAggressiveFormats:(BOOL)a6
{
  if (!a3) {
    return 0;
  }
  BOOL v6 = a6;
  if (!CFStringGetLength(a3)) {
    return 0;
  }
  MutableCopy = CFStringCreateMutableCopy(0, 0, a3);
  CFStringTransform(MutableCopy, 0, (CFStringRef)*MEMORY[0x263EFFEF0], 0);
  if (a4)
  {
    if ([&stru_26D4F03D0 isEqualToString:a4])
    {
      a4 = 0;
    }
    else
    {
      id v12 = +[TSUDateFormatter datePortionOfDateTimeFormatString:a4];
      id v13 = +[TSUDateFormatter timePortionOfDateTimeFormatString:a4];
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
      [v14 addObject:a4];
      if (v12 && ([&stru_26D4F03D0 isEqualToString:v12] & 1) == 0) {
        [v14 addObject:v12];
      }
      if (v13 && ([&stru_26D4F03D0 isEqualToString:v13] & 1) == 0) {
        [v14 addObject:v13];
      }
      a4 = [(TSUDateParser *)self newDateFromStringTryingFormats:MutableCopy locale:self->mLocale formats:v14 outSuccessfulFormatString:a5];
    }
  }
  uint64_t v15 = (void *)[(NSMutableArray *)self->mFormatCategories objectEnumerator];
  char v23 = 0;
  if (a4) {
    goto LABEL_15;
  }
  v17 = v15;
  CFDateRef v18 = (void *)[v15 nextObject];
  if (v18)
  {
    a4 = 0;
    CFStringRef v19 = 0;
    while (1)
    {
      v20 = (__CFString *)[v18 newDateFromString:MutableCopy forceAllowAMPM:self->mIsJapaneseLocale successfulFormatString:a5 perfect:&v23];
      if (v20)
      {
        v21 = v20;
        if (v23)
        {
          if (a4) {
            CFRelease(a4);
          }
          a4 = v21;
          goto LABEL_39;
        }
        if (!a4)
        {
          if (a5)
          {
            CFStringRef v19 = *a5;
            goto LABEL_28;
          }
LABEL_29:
          a4 = v21;
          goto LABEL_30;
        }
        CFRelease(v20);
        if (a5)
        {
          if (*a5) {
            CFRelease(*a5);
          }
          v21 = a4;
LABEL_28:
          *a5 = 0;
          goto LABEL_29;
        }
      }
LABEL_30:
      CFDateRef v18 = (void *)[v17 nextObject];
      if (!v18)
      {
        if (!a4) {
          goto LABEL_39;
        }
        if (a5) {
          *a5 = v19;
        }
        goto LABEL_15;
      }
    }
  }
  CFStringRef v19 = 0;
  a4 = 0;
LABEL_39:
  if (v19) {
    CFRelease(v19);
  }
  if (!a4 && v6)
  {
    uint64_t v22 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"yy", 0);
    a4 = 0;
    if (-[__CFString rangeOfCharacterFromSet:](MutableCopy, "rangeOfCharacterFromSet:", [MEMORY[0x263F08708] decimalDigitCharacterSet]) != 0x7FFFFFFFFFFFFFFFLL)a4 = -[TSUDateParser newDateFromStringTryingFormats:locale:formats:outSuccessfulFormatString:](self, "newDateFromStringTryingFormats:locale:formats:outSuccessfulFormatString:", MutableCopy, self->mLocale, v22, a5); {
  }
    }
LABEL_15:
  CFRelease(MutableCopy);
  return (__CFDate *)a4;
}

- (__CFDate)newDateFromString:(__CFString *)a3 successfulFormatString:(const __CFString *)a4
{
  return [(TSUDateParser *)self newDateFromString:a3 preferredFormatString:0 successfulFormatString:a4 tryAggressiveFormats:0];
}

- (void)addFormat:(id)a3 locale:(__CFLocale *)a4 formatCategoryMap:(id)a5
{
  uint64_t v12 = 0;
  unsigned __int16 v11 = 0;
  [(TSUDateParser *)self parseFormat:a3 initialPattern:&v12 separator:&v11];
  CFStringRef v9 = (TSUDateFormatCategory *)[a5 objectForKey:v12];
  if (!v9)
  {
    CFTimeZoneRef v10 = [TSUDateFormatCategory alloc];
    CFStringRef v9 = [(TSUDateFormatCategory *)v10 initWithInitialPattern:v12 locale:a4];
    [(NSMutableArray *)self->mFormatCategories addObject:v9];
    [a5 setObject:v9 forKey:v12];
  }
  [(TSUDateFormatCategory *)v9 addSeparator:v11 format:a3 locale:a4];
}

- (void)parseFormat:(id)a3 initialPattern:(id *)a4 separator:(unsigned __int16 *)a5
{
  if (!parseFormat_initialPattern_separator__formatCharacterSet)
  {
    CFStringRef v8 = objc_opt_class();
    objc_sync_enter(v8);
    if (!parseFormat_initialPattern_separator__formatCharacterSet)
    {
      id v9 = (id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"GyMdhHmsSEDFwWakKZ"];
      parseFormat_initialPattern_separator__inverseFormatCharacterSet = (uint64_t)(id)[v9 invertedSet];
      __dmb(0xBu);
      parseFormat_initialPattern_separator__formatCharacterSet = (uint64_t)v9;
    }
    objc_sync_exit(v8);
  }
  unint64_t v10 = [a3 length];
  if (!v10)
  {
    id v11 = +[TSUAssertionHandler currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSUDateParser(Private) parseFormat:initialPattern:separator:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDateParser.m"), 425, @"Zero length date format");
  }
  uint64_t v13 = [a3 rangeOfCharacterFromSet:parseFormat_initialPattern_separator__formatCharacterSet];
  unint64_t v14 = v10;
  if (v13 == 0x7FFFFFFFFFFFFFFFLL
    || ((v15 = objc_msgSend(a3, "rangeOfCharacterFromSet:options:range:", parseFormat_initialPattern_separator__inverseFormatCharacterSet, 0, v13, v10 - v13), v15 != 0x7FFFFFFFFFFFFFFFLL)? (unint64_t v14 = v15): (unint64_t v14 = v10), v14 >= v10))
  {
    *a5 = 0;
  }
  else
  {
    int v16 = [a3 characterAtIndex:v14];
    if (v16 == 34) {
      int v17 = 39;
    }
    else {
      int v17 = v16;
    }
    *a5 = v17;
    if (v17 == 39)
    {
      if (v14 + 1 >= v10)
      {
        id v18 = +[TSUAssertionHandler currentHandler];
        uint64_t v19 = [NSString stringWithUTF8String:"-[TSUDateParser(Private) parseFormat:initialPattern:separator:]"];
        objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDateParser.m"), 458, @"No character following single quote");
      }
      int v20 = [a3 characterAtIndex:v14 + 1];
      *a5 = v20;
      if (v20 == 39)
      {
        id v21 = +[TSUAssertionHandler currentHandler];
        uint64_t v22 = [NSString stringWithUTF8String:"-[TSUDateParser(Private) parseFormat:initialPattern:separator:]"];
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDateParser.m"), 460, @"Two single quotes in a row");
      }
    }
  }
  *a4 = (id)[a3 substringToIndex:v14];
}

- (void)datePreferencesChanged:(id)a3
{
  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B88], "currentThread", a3), "threadDictionary");
  if ((TSUDateParser *)[v3 objectForKey:@"TSUDateParserThreadDictionaryKey"] != self)
  {
    id v4 = +[TSUAssertionHandler currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSUDateParser(Private) datePreferencesChanged:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDateParser.m"), 476, @"Registered wrong date parser for date preference change notification");
  }
  BOOL v6 = self;
  [v3 removeObjectForKey:@"TSUDateParserThreadDictionaryKey"];
  TSURemoveLocaleChangeObserver((void *)[v3 objectForKey:@"TSUDateParserThreadDictionaryLocaleObserverKey"]);
  [v3 removeObjectForKey:@"TSUDateParserThreadDictionaryLocaleObserverKey"];
  uint64_t v7 = [v3 objectForKey:@"TSUDateParserThreadDictionaryExitObserverKey"];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", v7);
  [v3 removeObjectForKey:@"TSUDateParserThreadDictionaryExitObserverKey"];
  objc_msgSend(+[TSUDateParserLibrary sharedDateParserLibrary](TSUDateParserLibrary, "sharedDateParserLibrary"), "returnDateParser:", self);
}

@end