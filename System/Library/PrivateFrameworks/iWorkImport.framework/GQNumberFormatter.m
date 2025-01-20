@interface GQNumberFormatter
+ (id)availableCurrencyCodes;
+ (id)currencySymbolForCurrencyCode:(id)a3;
+ (id)currentLocaleCurrencyCode;
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
- (BOOL)currencyFromString:(__CFString *)a3 additionalCurrencyCode:(__CFString *)a4 value:(double *)a5 formatString:(const __CFString *)a6 currencyCode:(const __CFString *)a7;
- (BOOL)decimalFromString:(__CFString *)a3 value:(double *)a4 formatString:(const __CFString *)a5;
- (BOOL)findCurrencySymbolInString:(__CFString *)a3 additionalCurrencyCode:(__CFString *)a4 successfulString:(const __CFString *)a5;
- (BOOL)fractionFromString:(__CFString *)a3 value:(double *)a4;
- (BOOL)percentageFromString:(__CFString *)a3 value:(double *)a4 formatString:(const __CFString *)a5;
- (BOOL)scientificFromString:(__CFString *)a3 value:(double *)a4 formatString:(const __CFString *)a5;
- (BOOL)valueFromString:(__CFString *)a3 formatters:(__CFArray *)a4 value:(double *)a5 formatString:(const __CFString *)a6 currencyCode:(const __CFString *)a7;
- (GQNumberFormatter)initWithLocale:(__CFLocale *)a3;
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

@implementation GQNumberFormatter

+ (int)positionOfSymbol:(id)a3 inNumberFormatSubpattern:(id)a4
{
  id v5 = [a4 rangeOfString:a3];
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v7 = (unint64_t)v5;
  signed int v8 = objc_msgSend(a4, "sfu_indexOfFirstNonPrefixCharacterInNumberFormatSubpattern");
  return v8 != -1 && v7 >= v8;
}

+ (int)positionOfCurrencySymbolInNumberFormatSubpattern:(id)a3
{
  id v5 = +[NSString stringWithFormat:@"%C", 164];
  return [a1 positionOfSymbol:v5 inNumberFormatSubpattern:a3];
}

+ (int)positionOfMinusSignInNumberFormatSubpattern:(id)a3
{
  id v5 = +[NSString stringWithFormat:@"-"];
  return [a1 positionOfSymbol:v5 inNumberFormatSubpattern:a3];
}

+ (id)formatString:(id)a3 transformedForNegativeStyle:(int)a4
{
  id v7 = +[NSMutableString string];
  signed int v8 = v7;
  if (!a4)
  {
    objc_msgSend(v7, "appendString:", objc_msgSend(a3, "sfu_positiveSubpatternOfNumberFormatPattern"));
    [v8 appendString:@";"];
    v12 = (__CFString *)objc_msgSend(objc_msgSend(a3, "sfu_positiveSubpatternOfNumberFormatPattern"), "mutableCopy");
    [a1 formatString:v12 replaceOccurencesOfUnescapedString:@"-" withString:&stru_85630];
    unsigned int v13 = +[GQNumberFormatter positionOfMinusSignInNumberFormatSubpattern:](GQNumberFormatter, "positionOfMinusSignInNumberFormatSubpattern:", objc_msgSend(a3, "sfu_negativeSubpatternOfNumberFormatPattern"));
    if (v13)
    {
      unsigned int v14 = v13;
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
    objc_msgSend(v7, "appendString:", objc_msgSend(a3, "sfu_positiveSubpatternOfNumberFormatPattern"));
    [v8 appendString:@";"];
    v9 = (__CFString *)objc_msgSend(objc_msgSend(a3, "sfu_positiveSubpatternOfNumberFormatPattern"), "mutableCopy");
    [a1 formatString:v9 replaceOccurencesOfUnescapedString:@"-" withString:&stru_85630];
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
    objc_msgSend(v7, "appendString:", objc_msgSend(a3, "sfu_positiveSubpatternOfNumberFormatPattern"));
    [v8 appendString:@";"];
    v9 = (__CFString *)objc_msgSend(objc_msgSend(a3, "sfu_positiveSubpatternOfNumberFormatPattern"), "mutableCopy");
    [a1 formatString:v9 replaceOccurencesOfUnescapedString:@"-" withString:&stru_85630];
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
  id v19 = objc_msgSend(a3, "sfu_createRangesOfEscapedCharactersInNumberFormatPattern");
  unsigned int v8 = [a3 length];
  if ([v19 count])
  {
    objc_msgSend(a3, "replaceOccurrencesOfString:withString:options:range:", a4, a5, 0, 0, objc_msgSend(objc_msgSend(v19, "objectAtIndex:", 0), "rangeValue"));
    if ((unint64_t)[v19 count] >= 2)
    {
      unsigned int v9 = 2;
      uint64_t v10 = 1;
      do
      {
        uint64_t v11 = v8 - [a3 length];
        v12 = objc_msgSend(objc_msgSend(v19, "objectAtIndex:", v9 - 2), "rangeValue");
        objc_msgSend(a3, "replaceOccurrencesOfString:withString:options:range:", a4, a5, 0, &v12[v13 - v11], (unsigned char *)objc_msgSend(objc_msgSend(v19, "objectAtIndex:", v10), "rangeValue") - &v12[v13]);
        uint64_t v10 = v9;
      }
      while ((unint64_t)[v19 count] > v9++);
    }
    v15 = objc_msgSend(objc_msgSend(v19, "lastObject"), "rangeValue");
    v17 = &v15[v16];
    v18 = (char *)((unsigned char *)[a3 length] - &v15[v16]);
  }
  else
  {
    v18 = (char *)[a3 length];
    v17 = 0;
  }
  objc_msgSend(a3, "replaceOccurrencesOfString:withString:options:range:", a4, a5, 0, v17, v18);
}

+ (id)availableCurrencyCodes
{
  CFArrayRef v2 = CFLocaleCopyISOCurrencyCodes();
  return v2;
}

+ (id)displayNameForCurrencyCode:(id)a3
{
  id v4 = [a1 formatterForLocale:0];
  return [v4 displayNameForCurrencyCode:a3];
}

+ (id)currencySymbolForCurrencyCode:(id)a3
{
  id v4 = [a1 formatterForLocale:0];
  return [v4 currencySymbolForCurrencyCode:a3];
}

+ (unsigned)defaultDecimalPlacesForCurrencyCode:(id)a3
{
  int32_t defaultFractionDigits = 0;
  double v6 = 0.0;
  int DecimalInfoForCurrencyCode = CFNumberFormatterGetDecimalInfoForCurrencyCode((CFStringRef)a3, &defaultFractionDigits, &v6);
  int v4 = defaultFractionDigits & ~(defaultFractionDigits >> 31);
  if (!DecimalInfoForCurrencyCode) {
    LOWORD(v4) = 0;
  }
  return v4;
}

+ (id)currentLocaleCurrencyCode
{
  id v2 = [a1 formatterForLocale:0];
  return [v2 currentLocaleCurrencyCode];
}

+ (id)numberFormatStringSpecialSymbols
{
  id v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"0123456789@#.-,E+;'*%%%C%C",
         8240,
         164);
  return +[NSCharacterSet characterSetWithCharactersInString:v2];
}

+ (id)defaultFormatStringForValueType:(int)a3 negativeStyle:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id v6 = [a1 formatterForLocale:0];
  return [v6 defaultFormatStringForValueType:v5 negativeStyle:v4];
}

+ (id)defaultFormatStringForValueType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [a1 formatterForLocale:0];
  return [v4 defaultFormatStringForValueType:v3];
}

+ (id)localizedPercentSymbol
{
  id v2 = [a1 formatterForLocale:0];
  return [v2 localizedPercentSymbol];
}

+ (id)userVisibleCurrencyCodes
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  if ([(NSUserDefaults *)v2 BOOLForKey:off_9D7A0])
  {
    uint64_t v3 = (NSMutableArray *)CFLocaleCopyCommonISOCurrencyCodes();
    id v4 = v3;
  }
  else
  {
    uint64_t v3 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", @"AUD", @"CAD", @"HKD", @"SGD", @"TWD", @"USD", @"EUR", @"CHF", @"SEK", @"DKK", @"NOK", @"MXN", @"GBP", @"BRL", @"INR", @"KRW", @"JPY",
           @"CNY",
           @"IDR",
           @"RUB",
           @"TRY",
           @"THB",
           @"PLN",
           @"ZAR",
           @"ARS",
           0);
    id v5 = +[GQNumberFormatter currentLocaleCurrencyCode];
    if (([(NSMutableArray *)v3 containsObject:v5] & 1) == 0) {
      [(NSMutableArray *)v3 insertObject:v5 atIndex:0];
    }
  }
  return v3;
}

+ (id)formatterForLocale:(__CFLocale *)a3
{
  if (a3)
  {
    id v3 = [objc_alloc((Class)a1) initWithLocale:a3];
    return v3;
  }
  else
  {
    id v5 = (id)qword_A45A8;
    if (!qword_A45A8)
    {
      id v5 = [objc_alloc((Class)a1) initWithLocale:0];
      qword_A45A8 = (uint64_t)v5;
    }
    return v5;
  }
}

- (GQNumberFormatter)initWithLocale:(__CFLocale *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)GQNumberFormatter;
  id v4 = [(GQNumberFormatter *)&v15 init];
  if (v4)
  {
    if (a3) {
      CFLocaleRef v5 = (const __CFLocale *)CFRetain(a3);
    }
    else {
      CFLocaleRef v5 = CFLocaleCopyCurrent();
    }
    v4->CFLocaleRef mLocale = v5;
    v4->mDecimalFormatters = sub_53290(v5);
    CFLocaleRef mLocale = v4->mLocale;
    id v7 = +[NSArray arrayWithObjects:CFLocaleGetValue(mLocale, kCFLocaleCurrencyCode), @"USD", @"JPY", @"GBP", @"EUR", 0, 0];
    v4->mCurrencyFormatters = sub_534F0(mLocale, (const __CFArray *)v7);
    v4->mPercentageFormatters = sub_53D64(v4->mLocale);
    v4->mScientificFormatters = sub_53E3C(v4->mLocale);
    v4->mFractionFormatter = CFNumberFormatterCreate(0, v4->mLocale, kCFNumberFormatterDecimalStyle);
    v4->mCurrencyCodeToSymbolMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v4->mCurrencyCodeToHalfWidthSymbolMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    unsigned int v8 = CFNumberFormatterCreate(0, v4->mLocale, kCFNumberFormatterCurrencyStyle);
    v4->mCurrencyString = (NSString *)[(__CFString *)(id)CFNumberFormatterGetFormat(v8) copy];
    CFRelease(v8);
    unsigned int v9 = CFNumberFormatterCreate(0, v4->mLocale, kCFNumberFormatterPercentStyle);
    v4->mPercentageString = (NSString *)[(__CFString *)(id)CFNumberFormatterGetFormat(v9) copy];
    CFRelease(v9);
    uint64_t v10 = CFNumberFormatterCreate(0, v4->mLocale, kCFNumberFormatterNoStyle);
    CFNumberFormatterSetFormat(v10, @"#E+00");
    v4->mScientificString = (NSString *)[(__CFString *)(id)CFNumberFormatterGetFormat(v10) copy];
    CFRelease(v10);
    uint64_t v11 = CFNumberFormatterCreate(0, v4->mLocale, kCFNumberFormatterDecimalStyle);
    v4->mDecimalString = (NSString *)[(__CFString *)(id)CFNumberFormatterGetFormat(v11) copy];
    CFRelease(v11);
    v4->mTransformedDecimalStrings = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:4];
    v4->mTransformedCurrencyStrings = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:4];
    v4->mTransformedPercentageStrings = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:4];
    uint64_t v12 = 0;
    v4->mTransformedScientificStrings = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:4];
    do
    {
      [(NSMutableArray *)v4->mTransformedDecimalStrings insertObject:+[GQNumberFormatter formatString:v4->mDecimalString transformedForNegativeStyle:v12] atIndex:v12];
      [(NSMutableArray *)v4->mTransformedCurrencyStrings insertObject:+[GQNumberFormatter formatString:v4->mCurrencyString transformedForNegativeStyle:v12] atIndex:v12];
      [(NSMutableArray *)v4->mTransformedPercentageStrings insertObject:+[GQNumberFormatter formatString:v4->mPercentageString transformedForNegativeStyle:v12] atIndex:v12];
      [(NSMutableArray *)v4->mTransformedScientificStrings insertObject:+[GQNumberFormatter formatString:v4->mScientificString transformedForNegativeStyle:v12] atIndex:v12];
      ++v12;
    }
    while (v12 != 4);
    uint64_t v13 = CFNumberFormatterCreate(0, v4->mLocale, kCFNumberFormatterNoStyle);
    v4->mPercentSymbol = (NSString *)CFNumberFormatterCopyProperty(v13, kCFNumberFormatterPercentSymbol);
    CFRelease(v13);
  }
  return v4;
}

- (void)dealloc
{
  CFRelease(self->mLocale);
  CFRelease(self->mDecimalFormatters);
  CFRelease(self->mCurrencyFormatters);
  CFRelease(self->mPercentageFormatters);
  CFRelease(self->mScientificFormatters);
  CFRelease(self->mFractionFormatter);

  mAdditionalCurrencyCode = self->mAdditionalCurrencyCode;
  if (mAdditionalCurrencyCode) {
    CFRelease(mAdditionalCurrencyCode);
  }
  mAdditionalCurrencyCodeFormatters = self->mAdditionalCurrencyCodeFormatters;
  if (mAdditionalCurrencyCodeFormatters) {
    CFRelease(mAdditionalCurrencyCodeFormatters);
  }
  v5.receiver = self;
  v5.super_class = (Class)GQNumberFormatter;
  [(GQNumberFormatter *)&v5 dealloc];
}

- (void)numberPreferencesChanged:(id)a3
{
  qword_A45A8 = 0;
}

- (BOOL)decimalFromString:(__CFString *)a3 value:(double *)a4 formatString:(const __CFString *)a5
{
  return [(GQNumberFormatter *)self valueFromString:a3 formatters:self->mDecimalFormatters value:a4 formatString:a5 currencyCode:0];
}

- (BOOL)currencyFromString:(__CFString *)a3 additionalCurrencyCode:(__CFString *)a4 value:(double *)a5 formatString:(const __CFString *)a6 currencyCode:(const __CFString *)a7
{
  CFTypeRef cf = 0;
  if ([(GQNumberFormatter *)self findCurrencySymbolInString:a3 additionalCurrencyCode:a4 successfulString:&cf])
  {
    unsigned __int8 v12 = [(GQNumberFormatter *)self valueFromString:cf formatters:self->mCurrencyFormatters value:a5 formatString:a6 currencyCode:a7];
    BOOL v13 = v12;
    if (!a4 || (v12 & 1) != 0) {
      goto LABEL_14;
    }
    mAdditionalCurrencyCode = self->mAdditionalCurrencyCode;
    if (mAdditionalCurrencyCode)
    {
      if (CFEqual(mAdditionalCurrencyCode, a4))
      {
        mAdditionalCurrencyCodeFormatters = self->mAdditionalCurrencyCodeFormatters;
LABEL_13:
        BOOL v13 = [(GQNumberFormatter *)self valueFromString:cf formatters:mAdditionalCurrencyCodeFormatters value:a5 formatString:a6 currencyCode:a7];
LABEL_14:
        CFRelease(cf);
        return v13;
      }
      objc_super v15 = self->mAdditionalCurrencyCode;
      if (v15) {
        CFRelease(v15);
      }
    }
    uint64_t v16 = self->mAdditionalCurrencyCodeFormatters;
    if (v16) {
      CFRelease(v16);
    }
    v17 = (__CFString *)CFRetain(a4);
    self->mAdditionalCurrencyCode = v17;
    mAdditionalCurrencyCodeFormatters = sub_534F0(self->mLocale, (const __CFArray *)+[NSArray arrayWithObject:v17]);
    self->mAdditionalCurrencyCodeFormatters = mAdditionalCurrencyCodeFormatters;
    goto LABEL_13;
  }
  return 0;
}

- (BOOL)percentageFromString:(__CFString *)a3 value:(double *)a4 formatString:(const __CFString *)a5
{
  return [(GQNumberFormatter *)self valueFromString:a3 formatters:self->mPercentageFormatters value:a4 formatString:a5 currencyCode:0];
}

- (BOOL)scientificFromString:(__CFString *)a3 value:(double *)a4 formatString:(const __CFString *)a5
{
  return [(GQNumberFormatter *)self valueFromString:a3 formatters:self->mScientificFormatters value:a4 formatString:a5 currencyCode:0];
}

- (BOOL)fractionFromString:(__CFString *)a3 value:(double *)a4
{
  CFRange v7 = CFStringFind(a3, @"/", 0);
  if (v7.location != -1 && v7.length != 0)
  {
    v29.location = 0;
    v29.length = v7.location;
    CFStringRef v10 = CFStringCreateWithSubstring(kCFAllocatorDefault, a3, v29);
    CFIndex v11 = v7.location + 1;
    if (v11 >= CFStringGetLength(a3))
    {
      CFMutableStringRef v18 = 0;
      CFMutableStringRef v19 = 0;
      CFMutableStringRef v14 = 0;
      CFMutableStringRef MutableCopy = 0;
      CFStringRef v17 = 0;
      CFStringRef v23 = 0;
      CFStringRef v12 = 0;
      goto LABEL_31;
    }
    v30.length = CFStringGetLength(a3) - v11;
    v30.location = v7.location + 1;
    CFStringRef v12 = CFStringCreateWithSubstring(kCFAllocatorDefault, a3, v30);
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, v10);
    CFMutableStringRef v14 = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, v12);
    CFStringTrimWhitespace(MutableCopy);
    CFStringTrimWhitespace(v14);
    CFRange v15 = CFStringFind(MutableCopy, @" ", 0);
    if (v15.location == 0x7FFFFFFFFFFFFFFFLL || v15.length == 0)
    {
      CFStringRef v23 = 0;
      CFStringRef v17 = 0;
      CFMutableStringRef v18 = 0;
      double v27 = 0.0;
      double v28 = 0.0;
      double v26 = 0.0;
    }
    else
    {
      v31.location = 0;
      v31.length = v15.location;
      CFStringRef v23 = CFStringCreateWithSubstring(kCFAllocatorDefault, MutableCopy, v31);
      CFIndex v24 = v15.location + 1;
      if (v24 >= CFStringGetLength(MutableCopy))
      {
        CFMutableStringRef v18 = 0;
        CFMutableStringRef v19 = 0;
        CFStringRef v17 = 0;
        goto LABEL_31;
      }
      v32.length = CFStringGetLength(MutableCopy) - v24;
      v32.location = v15.location + 1;
      CFStringRef v17 = CFStringCreateWithSubstring(kCFAllocatorDefault, MutableCopy, v32);
      CFMutableStringRef v19 = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, v23);
      CFMutableStringRef v18 = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, v17);
      CFStringTrimWhitespace(v19);
      CFStringTrimWhitespace(v18);
      double v27 = 0.0;
      double v28 = 0.0;
      double v26 = 0.0;
      if (v19)
      {
        if (!sub_53EA4(self->mFractionFormatter, v19, &v26)) {
          goto LABEL_31;
        }
        double v20 = floor(v26);
        if (vabdd_f64(v26, v20) > 0.00001 || (sub_53EA4(self->mFractionFormatter, v18, &v28) & 1) == 0) {
          goto LABEL_31;
        }
        goto LABEL_17;
      }
    }
    CFMutableStringRef v19 = 0;
    if ((sub_53EA4(self->mFractionFormatter, MutableCopy, &v28) & 1) == 0) {
      goto LABEL_31;
    }
    double v20 = 0.0;
LABEL_17:
    if ((sub_53EA4(self->mFractionFormatter, v14, &v27) & 1) != 0 && v27 != 0.0)
    {
      double v21 = v20 + v28 / v27;
      if (__fpclassifyd(v21) != 2 && __fpclassifyd(v21) != 1)
      {
        if (!a4)
        {
          BOOL v9 = 1;
          if (!v10) {
            goto LABEL_35;
          }
          goto LABEL_34;
        }
        double v22 = v20 + v28 / v27;
        BOOL v9 = 1;
LABEL_32:
        *a4 = v22;
LABEL_33:
        if (!v10)
        {
LABEL_35:
          if (v12) {
            CFRelease(v12);
          }
          if (v23) {
            CFRelease(v23);
          }
          if (v17) {
            CFRelease(v17);
          }
          if (MutableCopy) {
            CFRelease(MutableCopy);
          }
          if (v14) {
            CFRelease(v14);
          }
          if (v19) {
            CFRelease(v19);
          }
          if (v18) {
            CFRelease(v18);
          }
          return v9;
        }
LABEL_34:
        CFRelease(v10);
        goto LABEL_35;
      }
    }
LABEL_31:
    BOOL v9 = 0;
    double v22 = 0.0;
    if (!a4) {
      goto LABEL_33;
    }
    goto LABEL_32;
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
    if (sub_53EA4(ValueAtIndex, a3, a5))
    {
      char v15 = 1;
      if (a6)
      {
LABEL_4:
        CFStringRef Format = CFNumberFormatterGetFormat(ValueAtIndex);
        *a6 = (const __CFString *)CFRetain(Format);
      }
LABEL_5:
      if (a7)
      {
        CFStringRef v17 = (const __CFString *)CFNumberFormatterCopyProperty(ValueAtIndex, kCFNumberFormatterCurrencyCode);
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
      if (sub_53EA4(ValueAtIndex, a3, a5))
      {
        char v15 = v18 - 1 < v13;
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
  char v15 = 0;
  if (a7)
  {
    CFStringRef v17 = 0;
    goto LABEL_16;
  }
  return v15;
}

- (BOOL)findCurrencySymbolInString:(__CFString *)a3 additionalCurrencyCode:(__CFString *)a4 successfulString:(const __CFString *)a5
{
  int Length = CFStringGetLength(a3);
  int v10 = Length;
  if (!Length
    || (Length >= 8 ? (int v11 = 8) : (int v11 = Length),
        v12 = +[NSArray arrayWithObjects:CFLocaleGetValue(self->mLocale, kCFLocaleCurrencyCode), @"USD", @"JPY", @"GBP", @"EUR", a4, 0], int v13 = [(NSArray *)v12 count], v13 < 1))
  {
    LOBYTE(v21) = 0;
    return v21;
  }
  v25 = a5;
  uint64_t v14 = 0;
  CFIndex v15 = v11;
  CFIndex v16 = v10 - v11;
  uint64_t v17 = v13;
  while (1)
  {
    id v18 = [(NSArray *)v12 objectAtIndex:v14];
    CFStringRef v19 = [(GQNumberFormatter *)self currencySymbolForCurrencyCode:v18];
    v27.location = 0;
    v27.length = v15;
    if (CFStringFindWithOptions(a3, v19, v27, 0, 0)) {
      break;
    }
    if (v10 >= 1)
    {
      v28.location = v16;
      v28.length = v15;
      if (CFStringFindWithOptions(a3, v19, v28, 0, 0)) {
        break;
      }
    }
    CFStringRef v20 = [(GQNumberFormatter *)self halfWidthCurrencySymbolForCurrencyCode:v18];
    result.location = 0;
    result.length = 0;
    v29.location = 0;
    v29.length = v15;
    if (CFStringFindWithOptions(a3, v20, v29, 0, &result))
    {
      int v21 = 1;
    }
    else
    {
      if (v10 < 1)
      {
        LOBYTE(v21) = 0;
        goto LABEL_17;
      }
      v30.location = v16;
      v30.length = v15;
      int v21 = CFStringFindWithOptions(a3, v20, v30, 0, &result) != 0;
    }
    if (v25 && v21)
    {
      LOBYTE(v21) = 1;
      result.length = 1;
      CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, a3);
      CFStringRef v23 = [(GQNumberFormatter *)self currencySymbolForCurrencyCode:v18];
      CFStringReplace(MutableCopy, result, v23);
      *v25 = MutableCopy;
      return v21;
    }
    if (v21) {
      return v21;
    }
LABEL_17:
    if (++v14 >= v17) {
      return v21;
    }
  }
  if (v25) {
    *v25 = (const __CFString *)CFRetain(a3);
  }
  LOBYTE(v21) = 1;
  return v21;
}

- (id)displayNameForCurrencyCode:(id)a3
{
  id v3 = (__CFString *)CFLocaleCopyDisplayNameForPropertyValue(self->mLocale, kCFLocaleCurrencyCode, (CFStringRef)a3);
  return v3;
}

- (id)currencySymbolForCurrencyCode:(id)a3
{
  id v5 = -[NSMutableDictionary objectForKey:](self->mCurrencyCodeToSymbolMap, "objectForKey:");
  if (!v5)
  {
    CFStringRef Identifier = CFLocaleGetIdentifier(self->mLocale);
    ComponentsFromLocaleCFStringRef Identifier = CFLocaleCreateComponentsFromLocaleIdentifier(0, Identifier);
    CFMutableStringRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, ComponentsFromLocaleIdentifier);
    CFDictionarySetValue(MutableCopy, kCFLocaleCurrencyCode, a3);
    CFStringRef LocaleIdentifierFromComponents = CFLocaleCreateLocaleIdentifierFromComponents(0, MutableCopy);
    CFLocaleRef v10 = CFLocaleCreate(0, LocaleIdentifierFromComponents);
    id v5 = objc_msgSend((id)CFLocaleGetValue(v10, kCFLocaleCurrencySymbol), "copy");
    [(NSMutableDictionary *)self->mCurrencyCodeToSymbolMap setObject:v5 forKey:a3];

    CFRelease(v10);
    CFRelease(LocaleIdentifierFromComponents);
    CFRelease(MutableCopy);
    CFRelease(ComponentsFromLocaleIdentifier);
  }
  return v5;
}

- (id)halfWidthCurrencySymbolForCurrencyCode:(id)a3
{
  CFMutableStringRef MutableCopy = (__CFString *)-[NSMutableDictionary objectForKey:](self->mCurrencyCodeToHalfWidthSymbolMap, "objectForKey:");
  if (!MutableCopy)
  {
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, (CFStringRef)[(GQNumberFormatter *)self currencySymbolForCurrencyCode:a3]);
    CFStringTransform(MutableCopy, 0, kCFStringTransformFullwidthHalfwidth, 0);
    [(NSMutableDictionary *)self->mCurrencyCodeToHalfWidthSymbolMap setObject:MutableCopy forKey:a3];
    CFRelease(MutableCopy);
  }
  return MutableCopy;
}

- (id)currentLocaleCurrencyCode
{
  id v2 = (id)CFLocaleGetValue(self->mLocale, kCFLocaleCurrencyCode);
  return v2;
}

- (id)defaultFormatStringForValueType:(int)a3 negativeStyle:(int)a4
{
  uint64_t v4 = 112;
  if ((a3 - 1) < 3) {
    uint64_t v4 = 8 * (a3 - 1) + 120;
  }
  return [*(id *)((char *)&self->super.isa + v4) objectAtIndex:a4];
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

@end