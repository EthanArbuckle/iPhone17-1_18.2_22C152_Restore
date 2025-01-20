@interface TSUNumberFormatter
+ (id)availableCurrencyCodes;
+ (id)currencySymbolForCurrencyCode:(id)a3;
+ (id)currentLocaleCurrencyCode;
+ (id)currentNonCachedLocaleCurrencyCode;
+ (id)currentNonCachedLocaleDecimalSeparator;
+ (id)defaultFormatStringForValueType:(int)a3;
+ (id)defaultFormatStringForValueType:(int)a3 negativeStyle:(int)a4;
+ (id)displayNameForCurrencyCode:(id)a3;
+ (id)formatString:(id)a3 transformedForNegativeStyle:(int)a4;
+ (id)formatterForLocale:(__CFLocale *)a3;
+ (id)localizedPercentSymbol;
+ (id)numberFormatStringSpecialSymbols;
+ (id)userVisibleCurrencyCodes;
+ (int)positionOfCurrencySymbolInNumberFormatSubpattern:(id)a3;
+ (int)positionOfMinusSignInNumberFormatSubpattern:(id)a3;
+ (int)positionOfSymbol:(id)a3 inNumberFormatSubpattern:(id)a4;
+ (unsigned)defaultDecimalPlacesForCurrencyCode:(id)a3;
+ (void)formatString:(id)a3 replaceOccurencesOfUnescapedString:(id)a4 withString:(id)a5;
+ (void)initialize;
- (BOOL)currencyFromString:(__CFString *)a3 additionalCurrencyCode:(__CFString *)a4 value:(double *)a5 formatString:(const __CFString *)a6 currencyCode:(const __CFString *)a7;
- (BOOL)decimalFromString:(__CFString *)a3 value:(double *)a4 formatString:(const __CFString *)a5;
- (BOOL)findCurrencySymbolInString:(__CFString *)a3 additionalCurrencyCode:(__CFString *)a4 successTSUlString:(const __CFString *)a5;
- (BOOL)fractionFromString:(__CFString *)a3 value:(double *)a4;
- (BOOL)percentageFromString:(__CFString *)a3 value:(double *)a4 formatString:(const __CFString *)a5;
- (BOOL)scientificFromString:(__CFString *)a3 value:(double *)a4 formatString:(const __CFString *)a5;
- (BOOL)valueFromString:(__CFString *)a3 formatters:(__CFArray *)a4 value:(double *)a5 formatString:(const __CFString *)a6 currencyCode:(const __CFString *)a7;
- (TSUNumberFormatter)initWithLocale:(__CFLocale *)a3;
- (__CFArray)p_currencyFormatters;
- (__CFArray)p_decimalFormatters;
- (__CFArray)p_percentageFormatters;
- (__CFArray)p_scientificFormatters;
- (id)currencySymbolForCurrencyCode:(id)a3;
- (id)currentLocaleCurrencyCode;
- (id)defaultFormatStringForValueType:(int)a3;
- (id)defaultFormatStringForValueType:(int)a3 negativeStyle:(int)a4;
- (id)displayNameForCurrencyCode:(id)a3;
- (id)halfWidthCurrencySymbolForCurrencyCode:(id)a3;
- (id)localizedPercentSymbol;
- (void)dealloc;
- (void)numberPreferencesChanged:(id)a3;
@end

@implementation TSUNumberFormatter

+ (void)initialize
{
  gLockTSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific = (uint64_t)objc_alloc_init(MEMORY[0x263F08AE0]);
  gLockTSUNumberFormatterStringFromDoubleWithFormat = (uint64_t)objc_alloc_init(MEMORY[0x263F08AE0]);
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSUNumberFormatter;
  objc_msgSendSuper2(&v3, sel_initialize);
}

+ (int)positionOfSymbol:(id)a3 inNumberFormatSubpattern:(id)a4
{
  uint64_t v5 = [a4 rangeOfString:a3];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v7 = v5;
  unint64_t v8 = [a4 indexOfFirstNonPrefixCharacterInNumberFormatSubpattern];
  return v8 != 0x7FFFFFFFFFFFFFFFLL && v7 >= v8;
}

+ (int)positionOfCurrencySymbolInNumberFormatSubpattern:(id)a3
{
  return [a1 positionOfSymbol:@"¤" inNumberFormatSubpattern:a3];
}

+ (int)positionOfMinusSignInNumberFormatSubpattern:(id)a3
{
  uint64_t v5 = [NSString stringWithFormat:@"-"];
  return [a1 positionOfSymbol:v5 inNumberFormatSubpattern:a3];
}

+ (id)formatString:(id)a3 transformedForNegativeStyle:(int)a4
{
  unint64_t v7 = (void *)[MEMORY[0x263F089D8] string];
  unint64_t v8 = v7;
  if (!a4)
  {
    objc_msgSend(v7, "appendString:", objc_msgSend(a3, "positiveSubpatternOfNumberFormatPattern"));
    [v8 appendString:@";"];
    v12 = (__CFString *)objc_msgSend((id)objc_msgSend(a3, "positiveSubpatternOfNumberFormatPattern"), "mutableCopy");
    [a1 formatString:v12 replaceOccurencesOfUnescapedString:@"-" withString:&stru_26D4F03D0];
    int v13 = +[TSUNumberFormatter positionOfMinusSignInNumberFormatSubpattern:](TSUNumberFormatter, "positionOfMinusSignInNumberFormatSubpattern:", [a3 negativeSubpatternOfNumberFormatPattern]);
    if (v13)
    {
      int v14 = v13;
      [v8 appendString:v12];
      if (v14 != 1)
      {
LABEL_13:

        return v8;
      }
      v15 = @"-";
      v16 = v8;
    }
    else
    {
      [v8 appendString:@"-"];
      v16 = v8;
      v15 = v12;
    }
    [v16 appendString:v15];
    goto LABEL_13;
  }
  if (a4 == 1)
  {
    objc_msgSend(v7, "appendString:", objc_msgSend(a3, "positiveSubpatternOfNumberFormatPattern"));
    [v8 appendString:@";"];
    v9 = (__CFString *)objc_msgSend((id)objc_msgSend(a3, "positiveSubpatternOfNumberFormatPattern"), "mutableCopy");
    [a1 formatString:v9 replaceOccurencesOfUnescapedString:@"-" withString:&stru_26D4F03D0];
    v10 = v8;
    v11 = v9;
  }
  else
  {
    if ((a4 & 0xFFFFFFFE) != 2)
    {
      [v7 appendString:a3];
      return v8;
    }
    objc_msgSend(v7, "appendString:", objc_msgSend(a3, "positiveSubpatternOfNumberFormatPattern"));
    [v8 appendString:@";"];
    v9 = (__CFString *)objc_msgSend((id)objc_msgSend(a3, "positiveSubpatternOfNumberFormatPattern"), "mutableCopy");
    [a1 formatString:v9 replaceOccurencesOfUnescapedString:@"-" withString:&stru_26D4F03D0];
    objc_msgSend(v8, "appendString:", @"(");
    [v8 appendString:v9];
    v11 = @"");
    v10 = v8;
  }
  [v10 appendString:v11];

  return v8;
}

+ (void)formatString:(id)a3 replaceOccurencesOfUnescapedString:(id)a4 withString:(id)a5
{
  id v17 = (id)[a3 newRangesOfEscapedCharactersInNumberFormatPattern];
  uint64_t v8 = [a3 length];
  if ([v17 count])
  {
    objc_msgSend(a3, "replaceOccurrencesOfString:withString:options:range:", a4, a5, 0, 0, objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", 0), "rangeValue"));
    if ((unint64_t)[v17 count] >= 2)
    {
      unint64_t v9 = 1;
      do
      {
        uint64_t v10 = [a3 length];
        uint64_t v11 = objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", v9 - 1), "rangeValue");
        objc_msgSend(a3, "replaceOccurrencesOfString:withString:options:range:", a4, a5, 0, v12 + v11 - v8 + v10, objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", v9++), "rangeValue") - (v12 + v11));
      }
      while (v9 < [v17 count]);
    }
    uint64_t v13 = objc_msgSend((id)objc_msgSend(v17, "lastObject"), "rangeValue");
    uint64_t v15 = v13 + v14;
    uint64_t v16 = [a3 length] - (v13 + v14);
  }
  else
  {
    uint64_t v16 = [a3 length];
    uint64_t v15 = 0;
  }
  objc_msgSend(a3, "replaceOccurrencesOfString:withString:options:range:", a4, a5, 0, v15, v16);
}

+ (id)availableCurrencyCodes
{
  CFArrayRef v2 = CFLocaleCopyISOCurrencyCodes();
  return v2;
}

+ (id)displayNameForCurrencyCode:(id)a3
{
  v4 = (void *)[a1 formatterForLocale:0];
  return (id)[v4 displayNameForCurrencyCode:a3];
}

+ (id)currencySymbolForCurrencyCode:(id)a3
{
  v4 = (void *)[a1 formatterForLocale:0];
  return (id)[v4 currencySymbolForCurrencyCode:a3];
}

+ (unsigned)defaultDecimalPlacesForCurrencyCode:(id)a3
{
  int32_t defaultFractionDigits = 0;
  double v7 = 0.0;
  if (CFNumberFormatterGetDecimalInfoForCurrencyCode((CFStringRef)a3, &defaultFractionDigits, &v7))
  {
    return defaultFractionDigits & ~(defaultFractionDigits >> 31);
  }
  else
  {
    id v4 = +[TSUAssertionHandler currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"+[TSUNumberFormatter defaultDecimalPlacesForCurrencyCode:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNumberFormatter.m"), 1629, @"Couldn't get decimal info for a currency code.");
    LOWORD(v3) = 0;
  }
  return v3;
}

+ (id)currentLocaleCurrencyCode
{
  CFArrayRef v2 = (void *)[a1 formatterForLocale:0];
  return (id)[v2 currentLocaleCurrencyCode];
}

+ (id)currentNonCachedLocaleCurrencyCode
{
  CFLocaleRef v2 = (const __CFLocale *)[MEMORY[0x263EFF960] currentLocale];
  id result = (id)(id)CFLocaleGetValue(v2, (CFLocaleKey)*MEMORY[0x263EFFCB8]);
  if (!result) {
    return @"USD";
  }
  return result;
}

+ (id)currentNonCachedLocaleDecimalSeparator
{
  CFLocaleRef v2 = (const __CFLocale *)[MEMORY[0x263EFF960] currentLocale];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x263EFFCD0];
  return (id)CFLocaleGetValue(v2, v3);
}

+ (id)numberFormatStringSpecialSymbols
{
  return (id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"0123456789@#.-,E+;'*%‰¤"];
}

+ (id)defaultFormatStringForValueType:(int)a3 negativeStyle:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  v6 = (void *)[a1 formatterForLocale:0];
  return (id)[v6 defaultFormatStringForValueType:v5 negativeStyle:v4];
}

+ (id)defaultFormatStringForValueType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = (void *)[a1 formatterForLocale:0];
  return (id)[v4 defaultFormatStringForValueType:v3];
}

+ (id)localizedPercentSymbol
{
  CFLocaleRef v2 = (void *)[a1 formatterForLocale:0];
  return (id)[v2 localizedPercentSymbol];
}

+ (id)userVisibleCurrencyCodes
{
  CFLocaleRef v2 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];
  if ([v2 BOOLForKey:TSUDefaultsShowCompleteCurrencyList])
  {
    CFArrayRef v3 = CFLocaleCopyCommonISOCurrencyCodes();
    CFArrayRef v4 = v3;
  }
  else
  {
    CFArrayRef v3 = (CFArrayRef)objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", @"AUD", @"CAD", @"HKD", @"SGD", @"TWD", @"USD", @"EUR", @"CHF", @"SEK", @"DKK", @"NOK", @"MXN", @"GBP", @"BRL", @"INR", @"KRW", @"JPY",
                       @"CNY",
                       @"IDR",
                       @"RUB",
                       @"TRY",
                       @"THB",
                       @"PLN",
                       @"ZAR",
                       @"ARS",
                       0);
    id v5 = +[TSUNumberFormatter currentLocaleCurrencyCode];
    if (([(__CFArray *)v3 containsObject:v5] & 1) == 0) {
      [(__CFArray *)v3 insertObject:v5 atIndex:0];
    }
  }
  return v3;
}

+ (id)formatterForLocale:(__CFLocale *)a3
{
  if (a3)
  {
    CFArrayRef v4 = (void *)[objc_alloc((Class)a1) initWithLocale:a3];
    return v4;
  }
  else
  {
    v6 = (void *)[MEMORY[0x263F08B88] currentThread];
    double v7 = (void *)[v6 threadDictionary];
    id v8 = (id)[v7 objectForKey:@"TSUNumberFormatterThreadDictionaryKey"];
    if (!v8)
    {
      id v8 = (id)[objc_alloc((Class)a1) initWithLocale:0];
      [v7 setObject:v8 forKey:@"TSUNumberFormatterThreadDictionaryKey"];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __50__TSUNumberFormatter_Private__formatterForLocale___block_invoke;
      v12[3] = &unk_26462A148;
      v12[4] = v6;
      v12[5] = v8;
      [v7 setObject:TSURegisterLocaleChangeObserver((uint64_t)v12) forKey:@"TSUNumberFormatterThreadDictionaryLocaleObserverKey"];
      unint64_t v9 = (void *)[MEMORY[0x263F08A00] defaultCenter];
      uint64_t v10 = *MEMORY[0x263F08520];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __50__TSUNumberFormatter_Private__formatterForLocale___block_invoke_2;
      v11[3] = &unk_26462A170;
      v11[4] = v8;
      objc_msgSend(v7, "setObject:forKey:", objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", v10, v6, 0, v11), @"TSUNumberFormatterThreadDictionaryExitObserverKey");
    }
    return v8;
  }
}

uint64_t __50__TSUNumberFormatter_Private__formatterForLocale___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [MEMORY[0x263F08B88] currentThread];
  id v5 = *(void **)(a1 + 32);
  if ((void *)v4 == v5)
  {
    double v7 = *(void **)(a1 + 40);
    return [v7 numberPreferencesChanged:a2];
  }
  else
  {
    uint64_t result = [v5 isFinished];
    if ((result & 1) == 0)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v8 = *(void **)(a1 + 40);
      return [v8 performSelector:sel_numberPreferencesChanged_ onThread:v9 withObject:a2 waitUntilDone:0];
    }
  }
  return result;
}

uint64_t __50__TSUNumberFormatter_Private__formatterForLocale___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) numberPreferencesChanged:a2];
}

- (TSUNumberFormatter)initWithLocale:(__CFLocale *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)TSUNumberFormatter;
  uint64_t v4 = [(TSUNumberFormatter *)&v13 init];
  if (v4)
  {
    if (a3) {
      CFLocaleRef v5 = (const __CFLocale *)CFRetain(a3);
    }
    else {
      CFLocaleRef v5 = CFLocaleCopyCurrent();
    }
    v4->mLocale = v5;
    v4->mFractionFormatter = CFNumberFormatterCreate(0, v5, kCFNumberFormatterDecimalStyle);
    v4->mCurrencyCodeToSymbolMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v4->mCurrencyCodeToHalfWidthSymbolMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v6 = CFNumberFormatterCreate(0, v4->mLocale, kCFNumberFormatterCurrencyStyle);
    v4->mCurrencyString = (NSString *)[(__CFString *)(id)CFNumberFormatterGetFormat(v6) copy];
    CFRelease(v6);
    double v7 = CFNumberFormatterCreate(0, v4->mLocale, kCFNumberFormatterPercentStyle);
    v4->mPercentageString = (NSString *)[(__CFString *)(id)CFNumberFormatterGetFormat(v7) copy];
    CFRelease(v7);
    id v8 = CFNumberFormatterCreate(0, v4->mLocale, kCFNumberFormatterNoStyle);
    CFNumberFormatterSetFormat(v8, @"#.##E+00");
    v4->mScientificString = (NSString *)[(__CFString *)(id)CFNumberFormatterGetFormat(v8) copy];
    CFRelease(v8);
    uint64_t v9 = CFNumberFormatterCreate(0, v4->mLocale, kCFNumberFormatterDecimalStyle);
    v4->mDecimalString = (NSString *)[(__CFString *)(id)CFNumberFormatterGetFormat(v9) copy];
    CFRelease(v9);
    v4->mTransformedDecimalStrings = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
    v4->mTransformedCurrencyStrings = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
    v4->mTransformedPercentageStrings = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
    uint64_t v10 = 0;
    v4->mTransformedScientificStrings = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
    do
    {
      [(NSMutableArray *)v4->mTransformedDecimalStrings insertObject:+[TSUNumberFormatter formatString:v4->mDecimalString transformedForNegativeStyle:v10] atIndex:v10];
      [(NSMutableArray *)v4->mTransformedCurrencyStrings insertObject:+[TSUNumberFormatter formatString:v4->mCurrencyString transformedForNegativeStyle:v10] atIndex:v10];
      [(NSMutableArray *)v4->mTransformedPercentageStrings insertObject:+[TSUNumberFormatter formatString:v4->mPercentageString transformedForNegativeStyle:v10] atIndex:v10];
      [(NSMutableArray *)v4->mTransformedScientificStrings insertObject:+[TSUNumberFormatter formatString:v4->mScientificString transformedForNegativeStyle:v10] atIndex:v10];
      ++v10;
    }
    while (v10 != 5);
    uint64_t v11 = CFNumberFormatterCreate(0, v4->mLocale, kCFNumberFormatterNoStyle);
    v4->mPercentSymbol = (NSString *)CFNumberFormatterCopyProperty(v11, (CFNumberFormatterKey)*MEMORY[0x263EFFDF8]);
    CFRelease(v11);
  }
  return v4;
}

- (void)dealloc
{
  CFRelease(self->mLocale);
  mDecimalFormatters = self->mDecimalFormatters;
  if (mDecimalFormatters) {
    CFRelease(mDecimalFormatters);
  }
  mCurrencyFormatters = self->mCurrencyFormatters;
  if (mCurrencyFormatters) {
    CFRelease(mCurrencyFormatters);
  }
  mPercentageFormatters = self->mPercentageFormatters;
  if (mPercentageFormatters) {
    CFRelease(mPercentageFormatters);
  }
  mScientificFormatters = self->mScientificFormatters;
  if (mScientificFormatters) {
    CFRelease(mScientificFormatters);
  }
  CFRelease(self->mFractionFormatter);

  mAdditionalCurrencyCode = self->mAdditionalCurrencyCode;
  if (mAdditionalCurrencyCode) {
    CFRelease(mAdditionalCurrencyCode);
  }
  mAdditionalCurrencyCodeFormatters = self->mAdditionalCurrencyCodeFormatters;
  if (mAdditionalCurrencyCodeFormatters) {
    CFRelease(mAdditionalCurrencyCodeFormatters);
  }
  [(id)gLockTSUNumberFormatterStringFromDoubleWithFormat lock];
  sActiveFormatter = 0;
  sActiveCurrencyFormatter = 0;
  uint64_t v9 = (void *)sActiveCurrencyCode;
  sActiveCurrencyCode = 0;

  uint64_t v10 = (void *)sActiveFormat;
  sActiveFormat = 0;

  uint64_t v11 = (void *)sActiveCurrencyFormat;
  sActiveCurrencyFormat = 0;

  [(id)gLockTSUNumberFormatterStringFromDoubleWithFormat unlock];
  v12.receiver = self;
  v12.super_class = (Class)TSUNumberFormatter;
  [(TSUNumberFormatter *)&v12 dealloc];
}

- (void)numberPreferencesChanged:(id)a3
{
  CFArrayRef v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B88], "currentThread", a3), "threadDictionary");
  if ((TSUNumberFormatter *)[v3 objectForKey:@"TSUNumberFormatterThreadDictionaryKey"] != self)
  {
    id v4 = +[TSUAssertionHandler currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSUNumberFormatter(Private) numberPreferencesChanged:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNumberFormatter.m"), 1886, @"Registered wrong date formatter for date preference change notification");
  }
  v6 = self;
  [v3 removeObjectForKey:@"TSUNumberFormatterThreadDictionaryKey"];
  TSURemoveLocaleChangeObserver((void *)[v3 objectForKey:@"TSUNumberFormatterThreadDictionaryLocaleObserverKey"]);
  [v3 removeObjectForKey:@"TSUNumberFormatterThreadDictionaryLocaleObserverKey"];
  uint64_t v7 = [v3 objectForKey:@"TSUNumberFormatterThreadDictionaryExitObserverKey"];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", v7);
  [v3 removeObjectForKey:@"TSUNumberFormatterThreadDictionaryExitObserverKey"];
}

- (BOOL)decimalFromString:(__CFString *)a3 value:(double *)a4 formatString:(const __CFString *)a5
{
  uint64_t v9 = [(TSUNumberFormatter *)self p_decimalFormatters];
  return [(TSUNumberFormatter *)self valueFromString:a3 formatters:v9 value:a4 formatString:a5 currencyCode:0];
}

- (BOOL)currencyFromString:(__CFString *)a3 additionalCurrencyCode:(__CFString *)a4 value:(double *)a5 formatString:(const __CFString *)a6 currencyCode:(const __CFString *)a7
{
  CFTypeRef cf = 0;
  if ([(TSUNumberFormatter *)self findCurrencySymbolInString:a3 additionalCurrencyCode:a4 successTSUlString:&cf])
  {
    BOOL v12 = [(TSUNumberFormatter *)self valueFromString:cf formatters:[(TSUNumberFormatter *)self p_currencyFormatters] value:a5 formatString:a6 currencyCode:a7];
    BOOL v13 = v12;
    if (!a4 || v12) {
      goto LABEL_14;
    }
    mAdditionalCurrencyCode = self->mAdditionalCurrencyCode;
    if (mAdditionalCurrencyCode)
    {
      if (CFEqual(mAdditionalCurrencyCode, a4))
      {
        mAdditionalCurrencyCodeFormatters = self->mAdditionalCurrencyCodeFormatters;
LABEL_13:
        BOOL v13 = [(TSUNumberFormatter *)self valueFromString:cf formatters:mAdditionalCurrencyCodeFormatters value:a5 formatString:a6 currencyCode:a7];
LABEL_14:
        CFRelease(cf);
        return v13;
      }
      uint64_t v15 = self->mAdditionalCurrencyCode;
      if (v15) {
        CFRelease(v15);
      }
    }
    uint64_t v16 = self->mAdditionalCurrencyCodeFormatters;
    if (v16) {
      CFRelease(v16);
    }
    id v17 = (__CFString *)CFRetain(a4);
    self->mAdditionalCurrencyCode = v17;
    mAdditionalCurrencyCodeFormatters = TSUCreateArrayOfCurrencyFormattersForLocale(self->mLocale, (const __CFArray *)[MEMORY[0x263EFF8C0] arrayWithObject:v17]);
    self->mAdditionalCurrencyCodeFormatters = mAdditionalCurrencyCodeFormatters;
    goto LABEL_13;
  }
  return 0;
}

- (BOOL)percentageFromString:(__CFString *)a3 value:(double *)a4 formatString:(const __CFString *)a5
{
  uint64_t v9 = [(TSUNumberFormatter *)self p_percentageFormatters];
  return [(TSUNumberFormatter *)self valueFromString:a3 formatters:v9 value:a4 formatString:a5 currencyCode:0];
}

- (BOOL)scientificFromString:(__CFString *)a3 value:(double *)a4 formatString:(const __CFString *)a5
{
  uint64_t v9 = [(TSUNumberFormatter *)self p_scientificFormatters];
  return [(TSUNumberFormatter *)self valueFromString:a3 formatters:v9 value:a4 formatString:a5 currencyCode:0];
}

- (BOOL)fractionFromString:(__CFString *)a3 value:(double *)a4
{
  CFRange v7 = CFStringFind(a3, @"/", 0);
  if (v7.location != -1 && v7.length != 0)
  {
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    v31.location = 0;
    v31.length = v7.location;
    CFStringRef v11 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x263EFFB08], a3, v31);
    CFIndex v12 = v7.location + 1;
    if (v12 >= CFStringGetLength(a3))
    {
      CFMutableStringRef v19 = 0;
      CFMutableStringRef v20 = 0;
      CFMutableStringRef v15 = 0;
      CFMutableStringRef MutableCopy = 0;
      CFStringRef v18 = 0;
      CFStringRef v25 = 0;
      CFStringRef v13 = 0;
      goto LABEL_33;
    }
    v32.length = CFStringGetLength(a3) - v12;
    v32.location = v7.location + 1;
    CFStringRef v13 = CFStringCreateWithSubstring(v10, a3, v32);
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(v10, 0, v11);
    CFMutableStringRef v15 = CFStringCreateMutableCopy(v10, 0, v13);
    CFStringTrimWhitespace(MutableCopy);
    CFStringTrimWhitespace(v15);
    CFRange v16 = CFStringFind(MutableCopy, @" ", 0);
    if (v16.location == 0x7FFFFFFFFFFFFFFFLL || v16.length == 0)
    {
      CFStringRef v25 = 0;
      CFStringRef v18 = 0;
      CFMutableStringRef v19 = 0;
      double v29 = 0.0;
      double v30 = 0.0;
      double v28 = 0.0;
    }
    else
    {
      v33.location = 0;
      v33.length = v16.location;
      CFStringRef v25 = CFStringCreateWithSubstring(v10, MutableCopy, v33);
      CFIndex v26 = v16.location + 1;
      if (v26 >= CFStringGetLength(MutableCopy))
      {
        CFMutableStringRef v19 = 0;
        CFMutableStringRef v20 = 0;
        CFStringRef v18 = 0;
        goto LABEL_33;
      }
      v34.length = CFStringGetLength(MutableCopy) - v26;
      v34.location = v16.location + 1;
      CFStringRef v18 = CFStringCreateWithSubstring(v10, MutableCopy, v34);
      CFMutableStringRef v20 = CFStringCreateMutableCopy(v10, 0, v25);
      CFMutableStringRef v19 = CFStringCreateMutableCopy(v10, 0, v18);
      CFStringTrimWhitespace(v20);
      CFStringTrimWhitespace(v19);
      double v29 = 0.0;
      double v30 = 0.0;
      double v28 = 0.0;
      if (v20)
      {
        if (!TSUImprovedCFNumberFormatterGetValueFromString(self->mFractionFormatter, v20, &v28)) {
          goto LABEL_33;
        }
        double v21 = floor(v28);
        if (vabdd_f64(v28, v21) > 0.00001
          || (TSUImprovedCFNumberFormatterGetValueFromString(self->mFractionFormatter, v19, &v30) & 1) == 0)
        {
          goto LABEL_33;
        }
        goto LABEL_17;
      }
    }
    CFMutableStringRef v20 = 0;
    if ((TSUImprovedCFNumberFormatterGetValueFromString(self->mFractionFormatter, MutableCopy, &v30) & 1) == 0) {
      goto LABEL_33;
    }
    double v21 = 0.0;
LABEL_17:
    if ((TSUImprovedCFNumberFormatterGetValueFromString(self->mFractionFormatter, v15, &v29) & 1) != 0 && v29 != 0.0)
    {
      double v22 = v30;
      if (v21 < 0.0)
      {
        double v22 = -v30;
        double v30 = -v30;
      }
      double v23 = v21 + v22 / v29;
      if (__fpclassifyd(v23) != 2 && __fpclassifyd(v23) != 1)
      {
        if (!a4)
        {
          BOOL v9 = 1;
          if (!v11) {
            goto LABEL_37;
          }
          goto LABEL_36;
        }
        double v24 = v21 + v30 / v29;
        BOOL v9 = 1;
LABEL_34:
        *a4 = v24;
LABEL_35:
        if (!v11)
        {
LABEL_37:
          if (v13) {
            CFRelease(v13);
          }
          if (v25) {
            CFRelease(v25);
          }
          if (v18) {
            CFRelease(v18);
          }
          if (MutableCopy) {
            CFRelease(MutableCopy);
          }
          if (v15) {
            CFRelease(v15);
          }
          if (v20) {
            CFRelease(v20);
          }
          if (v19) {
            CFRelease(v19);
          }
          return v9;
        }
LABEL_36:
        CFRelease(v11);
        goto LABEL_37;
      }
    }
LABEL_33:
    BOOL v9 = 0;
    double v24 = 0.0;
    if (!a4) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  BOOL v9 = 0;
  if (a4) {
    *a4 = 0.0;
  }
  return v9;
}

- (BOOL)valueFromString:(__CFString *)a3 formatters:(__CFArray *)a4 value:(double *)a5 formatString:(const __CFString *)a6 currencyCode:(const __CFString *)a7
{
  CFIndex Count = CFArrayGetCount(a4);
  if (Count >= 1)
  {
    CFIndex v13 = Count;
    ValueAtIndex = (__CFNumberFormatter *)CFArrayGetValueAtIndex(a4, 0);
    if (TSUImprovedCFNumberFormatterGetValueFromString(ValueAtIndex, a3, a5))
    {
      BOOL v15 = 1;
      if (a6)
      {
LABEL_4:
        CFStringRef Format = CFNumberFormatterGetFormat(ValueAtIndex);
        *a6 = (const __CFString *)CFRetain(Format);
      }
LABEL_5:
      if (a7)
      {
        CFStringRef v17 = (const __CFString *)CFNumberFormatterCopyProperty(ValueAtIndex, (CFNumberFormatterKey)*MEMORY[0x263EFFD20]);
LABEL_16:
        *a7 = v17;
        return v15;
      }
      return v15;
    }
    CFIndex v18 = 1;
    while (v13 != v18)
    {
      ValueAtIndex = (__CFNumberFormatter *)CFArrayGetValueAtIndex(a4, v18++);
      if (TSUImprovedCFNumberFormatterGetValueFromString(ValueAtIndex, a3, a5))
      {
        BOOL v15 = v18 - 1 < v13;
        if (a6) {
          goto LABEL_4;
        }
        goto LABEL_5;
      }
    }
  }
  if (a6) {
    *a6 = 0;
  }
  BOOL v15 = 0;
  if (a7)
  {
    CFStringRef v17 = 0;
    goto LABEL_16;
  }
  return v15;
}

- (BOOL)findCurrencySymbolInString:(__CFString *)a3 additionalCurrencyCode:(__CFString *)a4 successTSUlString:(const __CFString *)a5
{
  CFIndex Length = CFStringGetLength(a3);
  if (!Length
    || ((uint64_t v10 = Length, Length >= 8) ? (v11 = 8) : (v11 = Length),
        CFIndex v12 = TSUCurrencyCodesForLocale(self->mLocale, (uint64_t)a4),
        (uint64_t v13 = [v12 count]) == 0))
  {
    LOBYTE(v19) = 0;
    return v19;
  }
  unint64_t v14 = v13;
  double v23 = a5;
  uint64_t v15 = 0;
  while (1)
  {
    uint64_t v16 = [v12 objectAtIndex:v15];
    CFStringRef v17 = [(TSUNumberFormatter *)self currencySymbolForCurrencyCode:v16];
    v25.location = 0;
    v25.length = v11;
    if (CFStringFindWithOptions(a3, v17, v25, 0, 0)) {
      break;
    }
    if (v10 >= 1)
    {
      v26.location = v10 - v11;
      v26.length = v11;
      if (CFStringFindWithOptions(a3, v17, v26, 0, 0)) {
        break;
      }
    }
    CFStringRef v18 = [(TSUNumberFormatter *)self halfWidthCurrencySymbolForCurrencyCode:v16];
    result.location = 0;
    result.length = 0;
    v27.location = 0;
    v27.length = v11;
    if (CFStringFindWithOptions(a3, v18, v27, 0, &result))
    {
      BOOL v19 = 1;
    }
    else
    {
      if (v10 < 1)
      {
        LOBYTE(v19) = 0;
        goto LABEL_17;
      }
      v28.location = v10 - v11;
      v28.length = v11;
      BOOL v19 = CFStringFindWithOptions(a3, v18, v28, 0, &result) != 0;
    }
    if (v23 && v19)
    {
      LOBYTE(v19) = 1;
      result.length = 1;
      CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, a3);
      CFStringRef v21 = [(TSUNumberFormatter *)self currencySymbolForCurrencyCode:v16];
      CFStringReplace(MutableCopy, result, v21);
      *double v23 = MutableCopy;
      return v19;
    }
    if (v19) {
      return v19;
    }
LABEL_17:
    if (++v15 >= v14) {
      return v19;
    }
  }
  if (v23) {
    *double v23 = (const __CFString *)CFRetain(a3);
  }
  LOBYTE(v19) = 1;
  return v19;
}

- (id)displayNameForCurrencyCode:(id)a3
{
  CFArrayRef v3 = (__CFString *)CFLocaleCopyDisplayNameForPropertyValue(self->mLocale, (CFLocaleKey)*MEMORY[0x263EFFCB8], (CFStringRef)a3);
  return v3;
}

- (id)currencySymbolForCurrencyCode:(id)a3
{
  CFArrayRef v3 = (__CFString *)a3;
  if (!a3)
  {
    id v5 = +[TSUAssertionHandler currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSUNumberFormatter(Private) currencySymbolForCurrencyCode:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNumberFormatter.m"), 2177, @"can't get the currency symbol for a nil currency code. Using USD.");
    CFArrayRef v3 = @"USD";
  }
  mCurrencyCodeToSymbolMap = self->mCurrencyCodeToSymbolMap;
  objc_sync_enter(mCurrencyCodeToSymbolMap);
  id v8 = (void *)[(NSMutableDictionary *)self->mCurrencyCodeToSymbolMap objectForKey:v3];
  if (!v8)
  {
    CFStringRef v9 = (const __CFString *)MEMORY[0x223C9E410](self->mLocale);
    CFDictionaryRef ComponentsFromLocaleIdentifier = CFLocaleCreateComponentsFromLocaleIdentifier(0, v9);
    CFMutableStringRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, ComponentsFromLocaleIdentifier);
    CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x263EFFCB8], v3);
    CFStringRef LocaleIdentifierFromComponents = CFLocaleCreateLocaleIdentifierFromComponents(0, MutableCopy);
    CFLocaleRef v13 = CFLocaleCreate(0, LocaleIdentifierFromComponents);
    id v8 = objc_msgSend((id)CFLocaleGetValue(v13, (CFLocaleKey)*MEMORY[0x263EFFCC0]), "copy");
    [(NSMutableDictionary *)self->mCurrencyCodeToSymbolMap setObject:v8 forKey:v3];

    CFRelease(v13);
    CFRelease(LocaleIdentifierFromComponents);
    CFRelease(MutableCopy);
    CFRelease(ComponentsFromLocaleIdentifier);
  }
  objc_sync_exit(mCurrencyCodeToSymbolMap);
  return v8;
}

- (id)halfWidthCurrencySymbolForCurrencyCode:(id)a3
{
  mCurrencyCodeToHalfWidthSymbolMap = self->mCurrencyCodeToHalfWidthSymbolMap;
  objc_sync_enter(mCurrencyCodeToHalfWidthSymbolMap);
  CFMutableStringRef MutableCopy = (__CFString *)[(NSMutableDictionary *)self->mCurrencyCodeToHalfWidthSymbolMap objectForKey:a3];
  if (!MutableCopy)
  {
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, (CFStringRef)[(TSUNumberFormatter *)self currencySymbolForCurrencyCode:a3]);
    CFStringTransform(MutableCopy, 0, (CFStringRef)*MEMORY[0x263EFFEF0], 0);
    [(NSMutableDictionary *)self->mCurrencyCodeToHalfWidthSymbolMap setObject:MutableCopy forKey:a3];
    CFRelease(MutableCopy);
  }
  objc_sync_exit(mCurrencyCodeToHalfWidthSymbolMap);
  return MutableCopy;
}

- (id)currentLocaleCurrencyCode
{
  id result = (id)(id)CFLocaleGetValue(self->mLocale, (CFLocaleKey)*MEMORY[0x263EFFCB8]);
  if (!result) {
    return @"USD";
  }
  return result;
}

- (id)defaultFormatStringForValueType:(int)a3 negativeStyle:(int)a4
{
  uint64_t v4 = 112;
  if ((a3 - 1) < 3) {
    uint64_t v4 = 8 * (a3 - 1) + 120;
  }
  if (a4 >= 4) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = a4;
  }
  return (id)[*(id *)((char *)&self->super.isa + v4) objectAtIndex:v5];
}

- (id)defaultFormatStringForValueType:(int)a3
{
  uint64_t v3 = 96;
  if ((a3 - 1) < 3) {
    uint64_t v3 = 8 * (a3 - 1) + 72;
  }
  return *(Class *)((char *)&self->super.isa + v3);
}

- (id)localizedPercentSymbol
{
  return self->mPercentSymbol;
}

- (__CFArray)p_decimalFormatters
{
  id result = self->mDecimalFormatters;
  if (!result)
  {
    objc_sync_enter(self);
    if (!self->mDecimalFormatters)
    {
      uint64_t v4 = TSUCreateArrayOfDecimalFormattersForLocale(self->mLocale);
      __dmb(0xBu);
      self->mDecimalFormatters = v4;
    }
    objc_sync_exit(self);
    return self->mDecimalFormatters;
  }
  return result;
}

- (__CFArray)p_currencyFormatters
{
  id result = self->mCurrencyFormatters;
  if (!result)
  {
    objc_sync_enter(self);
    if (!self->mCurrencyFormatters)
    {
      mLocale = self->mLocale;
      CFArrayRef v5 = (const __CFArray *)TSUCurrencyCodesForLocale(mLocale, 0);
      uint64_t v6 = TSUCreateArrayOfCurrencyFormattersForLocale(mLocale, v5);
      __dmb(0xBu);
      self->mCurrencyFormatters = v6;
    }
    objc_sync_exit(self);
    return self->mCurrencyFormatters;
  }
  return result;
}

- (__CFArray)p_percentageFormatters
{
  id result = self->mPercentageFormatters;
  if (!result)
  {
    objc_sync_enter(self);
    if (!self->mPercentageFormatters)
    {
      uint64_t v4 = TSUCreateArrayOfPercentageFormattersForLocale(self->mLocale);
      __dmb(0xBu);
      self->mPercentageFormatters = v4;
    }
    objc_sync_exit(self);
    return self->mPercentageFormatters;
  }
  return result;
}

- (__CFArray)p_scientificFormatters
{
  id result = self->mScientificFormatters;
  if (!result)
  {
    objc_sync_enter(self);
    if (!self->mScientificFormatters)
    {
      uint64_t v4 = TSUCreateArrayOfScientificFormattersForLocale(self->mLocale);
      __dmb(0xBu);
      self->mScientificFormatters = v4;
    }
    objc_sync_exit(self);
    return self->mScientificFormatters;
  }
  return result;
}

@end