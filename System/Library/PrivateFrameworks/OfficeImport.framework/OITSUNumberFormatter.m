@interface OITSUNumberFormatter
+ (__CFNumberFormatter)createHarmonizedCFNumberFormatterWithLocale:(id)a3 style:(int64_t)a4;
+ (id)currencyDecimalSeparatorForLocale:(id)a3;
+ (id)currencyGroupingSeparatorForLocale:(id)a3;
+ (id)currencySymbolForCurrencyCode:(id)a3;
+ (id)currencySymbolForCurrencyCode:(id)a3 locale:(id)a4;
+ (id)currentLocaleCurrencyCode;
+ (id)currentLocaleCurrencyDecimalSeparator;
+ (id)currentLocaleDecimalSeparator;
+ (id)decimalSeparatorForLocale:(id)a3;
+ (id)defaultCurrencyCodeForLocale:(id)a3;
+ (id)defaultFormatStringForValueType:(int)a3;
+ (id)defaultFormatStringForValueType:(int)a3 negativeStyle:(int)a4;
+ (id)displayNameForCurrencyCode:(id)a3;
+ (id)formatString:(id)a3 transformedForNegativeStyle:(int)a4;
+ (id)formatterForLocale:(id)a3;
+ (id)groupingSeparatorForLocale:(id)a3;
+ (id)numberFormatStringSpecialSymbols;
+ (id)percentSymbolForLocale:(id)a3;
+ (id)stringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand:(id)a3;
+ (id)userVisibleCurrencyCodes;
+ (int)positionOfCurrencySymbolInNumberFormatSubpattern:(id)a3;
+ (int)positionOfMinusSignInNumberFormatSubpattern:(id)a3;
+ (int)positionOfSymbol:(id)a3 inNumberFormatSubpattern:(id)a4;
+ (unint64_t)groupingSizeForLocale:(id)a3;
+ (unsigned)defaultDecimalPlacesForCurrencyCode:(id)a3;
+ (void)formatString:(id)a3 replaceOccurencesOfUnescapedString:(id)a4 withString:(id)a5;
+ (void)initialize;
- (BOOL)currencyFromString:(id)a3 additionalCurrencyCode:(id)a4 value:(double *)a5 formatString:(id *)a6 currencyCode:(id *)a7;
- (BOOL)decimalFromString:(id)a3 value:(double *)a4 formatString:(id *)a5;
- (BOOL)fractionFromString:(id)a3 value:(double *)a4;
- (BOOL)p_valueFromString:(id)a3 formatters:(id)a4 value:(double *)a5 formatString:(id *)a6;
- (BOOL)percentageFromString:(id)a3 value:(double *)a4 formatString:(id *)a5;
- (BOOL)scientificFromString:(id)a3 value:(double *)a4 formatString:(id *)a5;
- (OITSUNumberFormatter)initWithLocale:(id)a3;
- (__CFNumberFormatter)p_createHarmonizedCFNumberFormatterOfStyle:(int64_t)a3;
- (id)currencyCode;
- (id)currencyDecimalSeparator;
- (id)currencyGroupingSeparator;
- (id)currencySymbolForCurrencyCode:(id)a3;
- (id)decimalSeparator;
- (id)defaultFormatStringForValueType:(int)a3;
- (id)defaultFormatStringForValueType:(int)a3 negativeStyle:(int)a4;
- (id)displayNameForCurrencyCode:(id)a3;
- (id)groupingSeparator;
- (id)halfWidthCurrencySymbolForCurrencyCode:(id)a3;
- (id)p_createDictionaryOfCurrencyFormattersForCurrencies:(id)a3;
- (id)p_currencyFormatters;
- (id)p_decimalFormatters;
- (id)p_findCurrencySymbolInString:(id)a3 additionalCurrencyCode:(id)a4 successfullString:(id *)a5 currencyCode:(id *)a6;
- (id)p_percentageFormatters;
- (id)p_scientificFormatters;
- (id)percentSymbol;
- (unint64_t)groupingSize;
- (void)dealloc;
- (void)p_loadHarmonizedNumberFormatterSymbols;
- (void)p_numberPreferencesChanged:(id)a3;
@end

@implementation OITSUNumberFormatter

+ (void)initialize
{
  v3 = (void *)sNumberingSystemForZeroChar;
  sNumberingSystemForZeroChar = (uint64_t)&unk_26EC81270;

  uint64_t v4 = objc_opt_new();
  v5 = (void *)sNumberingSystemForLocaleIdentifier;
  sNumberingSystemForLocaleIdentifier = v4;

  id v6 = objc_alloc_init(MEMORY[0x263F08958]);
  v7 = (void *)gLockTSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific;
  gLockTSUNumberOfTrailingZerosInMantissaWhenFormattedAsScientific = (uint64_t)v6;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___OITSUNumberFormatter;
  objc_msgSendSuper2(&v8, sel_initialize);
}

+ (id)stringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand:(id)a3
{
  id v3 = a3;
  if (stringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand__once != -1) {
    dispatch_once(&stringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand__once, &__block_literal_global_375);
  }
  uint64_t v4 = [v3 rangeOfCharacterFromSet:stringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand__replacedCharacterSet];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = v4;
    v7 = (void *)[v3 mutableCopy];
    uint64_t v8 = [v7 length];
    uint64_t v9 = v8 - v6;
    objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", @"−", @"-", 0, v6, v8 - v6);
    objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", @"﹣", @"-", 0, v6, v9);
    objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", @"－", @"-", 0, v6, v9);
    objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", @"﹢", @"+", 0, v6, v9);
    objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", @"＋", @"+", 0, v6, v9);
    id v5 = [NSString stringWithString:v7];
  }
  return v5;
}

void __88__OITSUNumberFormatter_stringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"−﹣－﹢＋"];
  v1 = (void *)stringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand__replacedCharacterSet;
  stringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand__replacedCharacterSet = v0;
}

+ (int)positionOfSymbol:(id)a3 inNumberFormatSubpattern:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 rangeOfString:a3];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v7 = 0;
  }
  else
  {
    unint64_t v8 = v6;
    unint64_t v9 = objc_msgSend(v5, "tsu_indexOfFirstNonPrefixCharacterInNumberFormatSubpattern");
    BOOL v7 = v9 != 0x7FFFFFFFFFFFFFFFLL && v8 >= v9;
  }

  return v7;
}

+ (int)positionOfCurrencySymbolInNumberFormatSubpattern:(id)a3
{
  return [a1 positionOfSymbol:@"¤" inNumberFormatSubpattern:a3];
}

+ (int)positionOfMinusSignInNumberFormatSubpattern:(id)a3
{
  uint64_t v4 = NSString;
  id v5 = a3;
  uint64_t v6 = [v4 stringWithFormat:@"-"];
  LODWORD(a1) = [a1 positionOfSymbol:v6 inNumberFormatSubpattern:v5];

  return (int)a1;
}

+ (id)formatString:(id)a3 transformedForNegativeStyle:(int)a4
{
  id v6 = a3;
  BOOL v7 = [MEMORY[0x263F089D8] string];
  unint64_t v8 = v7;
  if (!a4)
  {
    v14 = objc_msgSend(v6, "tsu_positiveSubpatternOfNumberFormatPattern");
    [v8 appendString:v14];

    [v8 appendString:@";"];
    v15 = objc_msgSend(v6, "tsu_positiveSubpatternOfNumberFormatPattern");
    v16 = (__CFString *)[v15 mutableCopy];

    [a1 formatString:v16 replaceOccurencesOfUnescapedString:@"-" withString:&stru_26EBF24D8];
    v17 = objc_msgSend(v6, "tsu_negativeSubpatternOfNumberFormatPattern");
    int v18 = +[OITSUNumberFormatter positionOfMinusSignInNumberFormatSubpattern:v17];

    if (v18)
    {
      [v8 appendString:v16];
      if (v18 != 1)
      {
LABEL_13:

        goto LABEL_14;
      }
      v19 = @"-";
      v20 = v8;
    }
    else
    {
      [v8 appendString:@"-"];
      v20 = v8;
      v19 = v16;
    }
    [v20 appendString:v19];
    goto LABEL_13;
  }
  if (a4 == 1)
  {
    unint64_t v9 = objc_msgSend(v6, "tsu_positiveSubpatternOfNumberFormatPattern");
    [v8 appendString:v9];

    [v8 appendString:@";"];
    v10 = objc_msgSend(v6, "tsu_positiveSubpatternOfNumberFormatPattern");
    v11 = (__CFString *)[v10 mutableCopy];

    [a1 formatString:v11 replaceOccurencesOfUnescapedString:@"-" withString:&stru_26EBF24D8];
    v12 = v8;
    v13 = v11;
LABEL_9:
    [v12 appendString:v13];

    goto LABEL_14;
  }
  if ((a4 & 0xFFFFFFFE) == 2)
  {
    v21 = objc_msgSend(v6, "tsu_positiveSubpatternOfNumberFormatPattern");
    [v8 appendString:v21];

    [v8 appendString:@";"];
    v22 = objc_msgSend(v6, "tsu_positiveSubpatternOfNumberFormatPattern");
    v11 = (__CFString *)[v22 mutableCopy];

    [a1 formatString:v11 replaceOccurencesOfUnescapedString:@"-" withString:&stru_26EBF24D8];
    objc_msgSend(v8, "appendString:", @"(");
    [v8 appendString:v11];
    v13 = @"");
    v12 = v8;
    goto LABEL_9;
  }
  [v7 appendString:v6];
LABEL_14:

  return v8;
}

+ (void)formatString:(id)a3 replaceOccurencesOfUnescapedString:(id)a4 withString:(id)a5
{
  id v26 = a3;
  id v7 = a4;
  id v8 = a5;
  unint64_t v9 = objc_msgSend(v26, "tsu_newRangesOfEscapedCharactersInNumberFormatPattern");
  uint64_t v10 = [v26 length];
  if ([v9 count])
  {
    v11 = [v9 objectAtIndex:0];
    objc_msgSend(v26, "replaceOccurrencesOfString:withString:options:range:", v7, v8, 0, 0, objc_msgSend(v11, "rangeValue"));

    if ((unint64_t)[v9 count] >= 2)
    {
      unint64_t v12 = 1;
      do
      {
        uint64_t v13 = [v26 length];
        v14 = [v9 objectAtIndex:v12 - 1];
        uint64_t v15 = [v14 rangeValue];
        uint64_t v17 = v16;

        int v18 = [v9 objectAtIndex:v12];
        uint64_t v19 = [v18 rangeValue];

        objc_msgSend(v26, "replaceOccurrencesOfString:withString:options:range:", v7, v8, 0, v17 + v15 - v10 + v13, v19 - (v17 + v15));
        ++v12;
      }
      while (v12 < [v9 count]);
    }
    v20 = [v9 lastObject];
    uint64_t v21 = [v20 rangeValue];
    uint64_t v23 = v22;

    uint64_t v24 = v21 + v23;
    uint64_t v25 = [v26 length] - (v21 + v23);
  }
  else
  {
    uint64_t v25 = [v26 length];
    uint64_t v24 = 0;
  }
  objc_msgSend(v26, "replaceOccurrencesOfString:withString:options:range:", v7, v8, 0, v24, v25);
}

+ (id)displayNameForCurrencyCode:(id)a3
{
  id v4 = a3;
  id v5 = [a1 formatterForLocale:0];
  id v6 = [v5 displayNameForCurrencyCode:v4];

  return v6;
}

+ (id)currencySymbolForCurrencyCode:(id)a3
{
  return (id)[a1 currencySymbolForCurrencyCode:a3 locale:0];
}

+ (id)currencySymbolForCurrencyCode:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = [a1 formatterForLocale:a4];
  id v8 = [v7 currencySymbolForCurrencyCode:v6];

  return v8;
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
    id v4 = [NSString stringWithUTF8String:"+[OITSUNumberFormatter defaultDecimalPlacesForCurrencyCode:]"];
    id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormatter.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:1376 isFatal:0 description:"Couldn't get decimal info for a currency code."];

    +[OITSUAssertionHandler logBacktraceThrottled];
    LOWORD(v3) = 0;
  }
  return v3;
}

+ (id)defaultCurrencyCodeForLocale:(id)a3
{
  int v3 = [a1 formatterForLocale:a3];
  id v4 = [v3 currencyCode];

  return v4;
}

+ (id)currentLocaleCurrencyCode
{
  return (id)[a1 defaultCurrencyCodeForLocale:0];
}

+ (id)currentLocaleDecimalSeparator
{
  v2 = +[OITSULocale currentLocale];
  int v3 = [v2 decimalSeparator];

  return v3;
}

+ (id)currentLocaleCurrencyDecimalSeparator
{
  v2 = +[OITSULocale currentLocale];
  int v3 = [v2 currencyDecimalSeparator];

  return v3;
}

+ (id)numberFormatStringSpecialSymbols
{
  return (id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"0123456789@#.-,E+;'*%‰¤"];
}

+ (id)defaultFormatStringForValueType:(int)a3 negativeStyle:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id v6 = [a1 formatterForLocale:0];
  double v7 = [v6 defaultFormatStringForValueType:v5 negativeStyle:v4];

  return v7;
}

+ (id)defaultFormatStringForValueType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = [a1 formatterForLocale:0];
  uint64_t v5 = [v4 defaultFormatStringForValueType:v3];

  return v5;
}

+ (id)decimalSeparatorForLocale:(id)a3
{
  uint64_t v3 = [a1 formatterForLocale:a3];
  uint64_t v4 = [v3 decimalSeparator];

  return v4;
}

+ (id)groupingSeparatorForLocale:(id)a3
{
  uint64_t v3 = [a1 formatterForLocale:a3];
  uint64_t v4 = [v3 groupingSeparator];

  return v4;
}

+ (id)currencyDecimalSeparatorForLocale:(id)a3
{
  uint64_t v3 = [a1 formatterForLocale:a3];
  uint64_t v4 = [v3 currencyDecimalSeparator];

  return v4;
}

+ (id)currencyGroupingSeparatorForLocale:(id)a3
{
  uint64_t v3 = [a1 formatterForLocale:a3];
  uint64_t v4 = [v3 currencyGroupingSeparator];

  return v4;
}

+ (id)percentSymbolForLocale:(id)a3
{
  uint64_t v3 = [a1 formatterForLocale:a3];
  uint64_t v4 = [v3 percentSymbol];

  return v4;
}

+ (unint64_t)groupingSizeForLocale:(id)a3
{
  uint64_t v3 = [a1 formatterForLocale:a3];
  unint64_t v4 = [v3 groupingSize];

  return v4;
}

+ (id)userVisibleCurrencyCodes
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v3 = [v2 BOOLForKey:@"SFTDefaultsShowCompleteCurrencyList"];

  if (v3)
  {
    unint64_t v4 = CFLocaleCopyCommonISOCurrencyCodes();
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", @"AUD", @"CAD", @"HKD", @"SGD", @"TWD", @"USD", @"EUR", @"CHF", @"SEK", @"DKK", @"NOK", @"MXN", @"GBP", @"BRL", @"INR", @"KRW", @"JPY",
      @"CNY",
      @"IDR",
      @"RUB",
      @"TRY",
      @"THB",
      @"PLN",
      @"ZAR",
      @"ARS",
      @"SAR",
      @"AED",
      @"EGP",
      @"HRK",
      @"CZK",
      @"ILS",
      @"HUF",
      @"RON",
      @"UAH",
      @"VND",
      @"MYR",
    unint64_t v4 = 0);
    uint64_t v5 = +[OITSUNumberFormatter currentLocaleCurrencyCode];
    if (([v4 containsObject:v5] & 1) == 0) {
      [v4 insertObject:v5 atIndex:0];
    }
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalCurrencyCodeFormatters, 0);
  objc_storeStrong((id *)&self->_additionalCurrencyCode, 0);
  objc_storeStrong((id *)&self->_currencyCodeToHalfWidthSymbolMap, 0);
  objc_storeStrong((id *)&self->_currencyCodeToSymbolMap, 0);
  objc_storeStrong((id *)&self->_harmonizedNumberFormatterSymbols, 0);
  objc_storeStrong((id *)&self->_transformedScientificStrings, 0);
  objc_storeStrong((id *)&self->_transformedPercentageStrings, 0);
  objc_storeStrong((id *)&self->_transformedCurrencyStrings, 0);
  objc_storeStrong((id *)&self->_transformedDecimalStrings, 0);
  objc_storeStrong((id *)&self->_percentSymbol, 0);
  objc_storeStrong((id *)&self->_currencyGroupingSeparator, 0);
  objc_storeStrong((id *)&self->_groupingSeparator, 0);
  objc_storeStrong((id *)&self->_currencyDecimalSeparator, 0);
  objc_storeStrong((id *)&self->_decimalSeparator, 0);
  objc_storeStrong((id *)&self->_decimalString, 0);
  objc_storeStrong((id *)&self->_scientificString, 0);
  objc_storeStrong((id *)&self->_percentageString, 0);
  objc_storeStrong((id *)&self->_currencyString, 0);
  objc_storeStrong((id *)&self->_scientificFormatters, 0);
  objc_storeStrong((id *)&self->_percentageFormatters, 0);
  objc_storeStrong((id *)&self->_currencyFormatters, 0);
  objc_storeStrong((id *)&self->_decimalFormatters, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

+ (__CFNumberFormatter)createHarmonizedCFNumberFormatterWithLocale:(id)a3 style:(int64_t)a4
{
  uint64_t v5 = +[OITSUNumberFormatter formatterForLocale:a3];
  id v6 = (__CFNumberFormatter *)objc_msgSend(v5, "p_createHarmonizedCFNumberFormatterOfStyle:", a4);

  return v6;
}

+ (id)formatterForLocale:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F08B88] currentThread];
    id v6 = [v5 threadDictionary];
    double v7 = TSUNumberFormatterThreadDictionaryKeyForLocale(v4);
    id v8 = [v6 objectForKey:v7];
    if (!v8)
    {
      id v8 = (id)[objc_alloc((Class)a1) initWithLocale:v4];
      [v6 setObject:v8 forKey:v7];
      if (+[OITSULocale localeIsAutoUpdating:v4])
      {
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __52__OITSUNumberFormatter_Private__formatterForLocale___block_invoke;
        v18[3] = &unk_264D60C70;
        id v9 = v5;
        id v19 = v9;
        id v10 = v8;
        id v20 = v10;
        v11 = TSURegisterLocaleChangeObserver((uint64_t)v18);
        [v6 setObject:v11 forKey:@"TSUNumberFormatterThreadDictionaryLocaleObserverKey"];
        unint64_t v12 = [MEMORY[0x263F08A00] defaultCenter];
        uint64_t v13 = *MEMORY[0x263F08520];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __52__OITSUNumberFormatter_Private__formatterForLocale___block_invoke_2;
        v16[3] = &unk_264D60C98;
        id v8 = v10;
        id v17 = v8;
        v14 = [v12 addObserverForName:v13 object:v9 queue:0 usingBlock:v16];

        [v6 setObject:v14 forKey:@"TSUNumberFormatterThreadDictionaryExitObserverKey"];
      }
    }
  }
  else
  {
    uint64_t v5 = +[OITSULocale currentLocale];
    id v6 = [v5 locale];
    id v8 = [a1 formatterForLocale:v6];
  }

  return v8;
}

void __52__OITSUNumberFormatter_Private__formatterForLocale___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  int v3 = [MEMORY[0x263F08B88] currentThread];
  id v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "p_numberPreferencesChanged:", v5);
  }
  else if (([*(id *)(a1 + 32) isFinished] & 1) == 0)
  {
    [*(id *)(a1 + 40) performSelector:sel_p_numberPreferencesChanged_ onThread:*(void *)(a1 + 32) withObject:v5 waitUntilDone:0];
  }
}

uint64_t __52__OITSUNumberFormatter_Private__formatterForLocale___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_numberPreferencesChanged:", a2);
}

- (OITSUNumberFormatter)initWithLocale:(id)a3
{
  id v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)OITSUNumberFormatter;
  id v5 = [(OITSUNumberFormatter *)&v62 init];
  if (v5)
  {
    if (!v4)
    {
      double v7 = [NSString stringWithUTF8String:"-[OITSUNumberFormatter(Private) initWithLocale:]"];
      id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormatter.m"];
      +[OITSUAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:1527 isFatal:1 description:"TSUNumberFormatter cannot be initialized without a locale. Please check comments near this assertion or <rdar://problem/23557988> for details."];

      TSUCrash((uint64_t)"TSUNumberFormatter cannot be initialized without a locale. Please check comments near this assertion or <rdar://problem/23557988> for details.", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v62.receiver);
    }
    id v6 = (NSLocale *)v4;
    locale = v5->_locale;
    v5->_locale = v6;

    id v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    currencyCodeToHalfWidthSymbolMap = v5->_currencyCodeToHalfWidthSymbolMap;
    v5->_currencyCodeToHalfWidthSymbolMap = v17;

    id v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    currencyCodeToSymbolMap = v5->_currencyCodeToSymbolMap;
    v5->_currencyCodeToSymbolMap = v19;

    uint64_t v21 = [(OITSUNumberFormatter *)v5 p_createHarmonizedCFNumberFormatterOfStyle:2];
    uint64_t v22 = [(__CFString *)(id)CFNumberFormatterGetFormat(v21) copy];
    currencyString = v5->_currencyString;
    v5->_currencyString = (NSString *)v22;

    uint64_t v24 = (NSString *)CFNumberFormatterCopyProperty(v21, (CFNumberFormatterKey)*MEMORY[0x263EFFD28]);
    currencyDecimalSeparator = v5->_currencyDecimalSeparator;
    v5->_currencyDecimalSeparator = v24;

    id v26 = (NSString *)CFNumberFormatterCopyProperty(v21, (CFNumberFormatterKey)*MEMORY[0x263EFFD30]);
    currencyGroupingSeparator = v5->_currencyGroupingSeparator;
    v5->_currencyGroupingSeparator = v26;

    CFRelease(v21);
    v28 = [(OITSUNumberFormatter *)v5 p_createHarmonizedCFNumberFormatterOfStyle:3];
    v29 = (NSString *)CFNumberFormatterCopyProperty(v28, (CFNumberFormatterKey)*MEMORY[0x263EFFDF8]);
    percentSymbol = v5->_percentSymbol;
    v5->_percentSymbol = v29;

    uint64_t v31 = [(__CFString *)(id)CFNumberFormatterGetFormat(v28) copy];
    percentageString = v5->_percentageString;
    v5->_percentageString = (NSString *)v31;

    CFRelease(v28);
    v33 = [(OITSUNumberFormatter *)v5 p_createHarmonizedCFNumberFormatterOfStyle:0];
    CFNumberFormatterSetFormat(v33, @"#.##E+00");
    uint64_t v34 = [(__CFString *)(id)CFNumberFormatterGetFormat(v33) copy];
    scientificString = v5->_scientificString;
    v5->_scientificString = (NSString *)v34;

    CFRelease(v33);
    v36 = [(OITSUNumberFormatter *)v5 p_createHarmonizedCFNumberFormatterOfStyle:1];
    uint64_t v37 = [(__CFString *)(id)CFNumberFormatterGetFormat(v36) copy];
    decimalString = v5->_decimalString;
    v5->_decimalString = (NSString *)v37;

    v39 = (NSString *)CFNumberFormatterCopyProperty(v36, (CFNumberFormatterKey)*MEMORY[0x263EFFD40]);
    decimalSeparator = v5->_decimalSeparator;
    v5->_decimalSeparator = v39;

    v41 = (NSString *)CFNumberFormatterCopyProperty(v36, (CFNumberFormatterKey)*MEMORY[0x263EFFD60]);
    groupingSeparator = v5->_groupingSeparator;
    v5->_groupingSeparator = v41;

    v43 = (void *)CFNumberFormatterCopyProperty(v36, (CFNumberFormatterKey)*MEMORY[0x263EFFD68]);
    v5->_groupingSize = [v43 unsignedIntegerValue];
    CFRelease(v36);
    uint64_t v44 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
    transformedDecimalStrings = v5->_transformedDecimalStrings;
    v5->_transformedDecimalStrings = (NSMutableArray *)v44;

    uint64_t v46 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
    transformedCurrencyStrings = v5->_transformedCurrencyStrings;
    v5->_transformedCurrencyStrings = (NSMutableArray *)v46;

    uint64_t v48 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
    transformedPercentageStrings = v5->_transformedPercentageStrings;
    v5->_transformedPercentageStrings = (NSMutableArray *)v48;

    uint64_t v50 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
    transformedScientificStrings = v5->_transformedScientificStrings;
    v5->_transformedScientificStrings = (NSMutableArray *)v50;

    for (uint64_t i = 0; i != 5; ++i)
    {
      v53 = v5->_transformedDecimalStrings;
      v54 = +[OITSUNumberFormatter formatString:v5->_decimalString transformedForNegativeStyle:i];
      [(NSMutableArray *)v53 insertObject:v54 atIndex:i];

      v55 = v5->_transformedCurrencyStrings;
      v56 = +[OITSUNumberFormatter formatString:v5->_currencyString transformedForNegativeStyle:i];
      [(NSMutableArray *)v55 insertObject:v56 atIndex:i];

      v57 = v5->_transformedPercentageStrings;
      v58 = +[OITSUNumberFormatter formatString:v5->_percentageString transformedForNegativeStyle:i];
      [(NSMutableArray *)v57 insertObject:v58 atIndex:i];

      v59 = v5->_transformedScientificStrings;
      v60 = +[OITSUNumberFormatter formatString:v5->_scientificString transformedForNegativeStyle:i];
      [(NSMutableArray *)v59 insertObject:v60 atIndex:i];
    }
    v5->_fractionFormatter = [(OITSUNumberFormatter *)v5 p_createHarmonizedCFNumberFormatterOfStyle:1];
  }
  return v5;
}

- (void)dealloc
{
  fractionFormatter = self->_fractionFormatter;
  if (fractionFormatter)
  {
    CFRelease(fractionFormatter);
    self->_fractionFormatter = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)OITSUNumberFormatter;
  [(OITSUNumberFormatter *)&v4 dealloc];
}

- (__CFNumberFormatter)p_createHarmonizedCFNumberFormatterOfStyle:(int64_t)a3
{
  id v5 = self->_locale;
  BOOL v6 = +[OITSULocale localeIsAutoUpdating:v5];
  if (!v6)
  {
    uint64_t v7 = TSULocaleNSLocaleWithHarmonizedNumberingSystem(v5);

    id v5 = (NSLocale *)v7;
  }
  id v8 = CFNumberFormatterCreate(0, (CFLocaleRef)v5, (CFNumberFormatterStyle)a3);
  if (v8)
  {
    if (v6) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v9 = [NSString stringWithUTF8String:"-[OITSUNumberFormatter(Private) p_createHarmonizedCFNumberFormatterOfStyle:]"];
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormatter.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 1616, 0, "invalid nil value for '%{public}s'", "formatter");

    +[OITSUAssertionHandler logBacktraceThrottled];
    if (v6) {
      goto LABEL_17;
    }
  }
  [(OITSUNumberFormatter *)self p_loadHarmonizedNumberFormatterSymbols];
  uint64_t v11 = TSUNumberFormatterNumberingSystemForFormatter(v8);
  harmonizedNumberFormatterSymbols = self->_harmonizedNumberFormatterSymbols;
  uint64_t v13 = [NSString stringWithFormat:@"symbol-%@-decimal", v11];
  uint64_t v14 = [(OITSULocaleStructuredDictionary *)harmonizedNumberFormatterSymbols objectForKey:v13 locale:v5];

  if (v14)
  {
    CFStringRef v15 = (const __CFString *)*MEMORY[0x263EFFD40];
    uint64_t v16 = self->_harmonizedNumberFormatterSymbols;
    [NSString stringWithFormat:@"symbol-%@-decimal", v11];
    int v18 = v17 = a3;
    id v19 = [(OITSULocaleStructuredDictionary *)v16 objectForKey:v18 locale:v5];
    CFNumberFormatterSetProperty(v8, v15, v19);

    CFStringRef v20 = (const __CFString *)*MEMORY[0x263EFFD60];
    uint64_t v21 = self->_harmonizedNumberFormatterSymbols;
    uint64_t v22 = [NSString stringWithFormat:@"symbol-%@-group", v11];
    uint64_t v23 = [(OITSULocaleStructuredDictionary *)v21 objectForKey:v22 locale:v5];
    CFNumberFormatterSetProperty(v8, v20, v23);

    CFStringRef v24 = (const __CFString *)*MEMORY[0x263EFFD28];
    uint64_t v25 = self->_harmonizedNumberFormatterSymbols;
    id v26 = [NSString stringWithFormat:@"symbol-%@-decimal", v11];
    v27 = [(OITSULocaleStructuredDictionary *)v25 objectForKey:v26 locale:v5];
    CFNumberFormatterSetProperty(v8, v24, v27);

    a3 = v17;
    CFStringRef v28 = (const __CFString *)*MEMORY[0x263EFFD30];
    v29 = self->_harmonizedNumberFormatterSymbols;
    v30 = [NSString stringWithFormat:@"symbol-%@-group", v11];
    uint64_t v31 = [(OITSULocaleStructuredDictionary *)v29 objectForKey:v30 locale:v5];
    CFNumberFormatterSetProperty(v8, v28, v31);

    CFStringRef v32 = (const __CFString *)*MEMORY[0x263EFFDF8];
    v33 = self->_harmonizedNumberFormatterSymbols;
    uint64_t v34 = [NSString stringWithFormat:@"symbol-%@-percentSign", v11];
    v35 = [(OITSULocaleStructuredDictionary *)v33 objectForKey:v34 locale:v5];
    CFNumberFormatterSetProperty(v8, v32, v35);

    CFStringRef v36 = (const __CFString *)*MEMORY[0x263EFFE00];
    uint64_t v37 = self->_harmonizedNumberFormatterSymbols;
    v38 = [NSString stringWithFormat:@"symbol-%@-plusSign", v11];
    v39 = [(OITSULocaleStructuredDictionary *)v37 objectForKey:v38 locale:v5];
    CFNumberFormatterSetProperty(v8, v36, v39);

    CFStringRef v40 = (const __CFString *)*MEMORY[0x263EFFDB8];
    v41 = self->_harmonizedNumberFormatterSymbols;
    v42 = [NSString stringWithFormat:@"symbol-%@-minusSign", v11];
    v43 = [(OITSULocaleStructuredDictionary *)v41 objectForKey:v42 locale:v5];
    CFNumberFormatterSetProperty(v8, v40, v43);

    CFStringRef v44 = (const __CFString *)*MEMORY[0x263EFFD50];
    v45 = self->_harmonizedNumberFormatterSymbols;
    uint64_t v46 = [NSString stringWithFormat:@"symbol-%@-exponential", v11];
    v47 = [(OITSULocaleStructuredDictionary *)v45 objectForKey:v46 locale:v5];
    CFNumberFormatterSetProperty(v8, v44, v47);

    CFStringRef v48 = (const __CFString *)*MEMORY[0x263EFFDF0];
    v49 = self->_harmonizedNumberFormatterSymbols;
    uint64_t v50 = [NSString stringWithFormat:@"symbol-%@-perMille", v11];
    v51 = [(OITSULocaleStructuredDictionary *)v49 objectForKey:v50 locale:v5];
    CFNumberFormatterSetProperty(v8, v48, v51);

    CFStringRef v52 = (const __CFString *)*MEMORY[0x263EFFD70];
    v53 = self->_harmonizedNumberFormatterSymbols;
    v54 = [NSString stringWithFormat:@"symbol-%@-infinity", v11];
    v55 = [(OITSULocaleStructuredDictionary *)v53 objectForKey:v54 locale:v5];
    CFNumberFormatterSetProperty(v8, v52, v55);

    CFStringRef v56 = (const __CFString *)*MEMORY[0x263EFFDC8];
    v57 = self->_harmonizedNumberFormatterSymbols;
    v58 = [NSString stringWithFormat:@"symbol-%@-nan", v11];
    v59 = [(OITSULocaleStructuredDictionary *)v57 objectForKey:v58 locale:v5];
    CFNumberFormatterSetProperty(v8, v56, v59);
  }
  v60 = self->_harmonizedNumberFormatterSymbols;
  v61 = [NSString stringWithFormat:@"format-%@-decimalFormat", v11];
  objc_super v62 = [(OITSULocaleStructuredDictionary *)v60 objectForKey:v61 locale:v5];

  if (v62)
  {
    switch(a3)
    {
      case 0:
      case 1:
        v63 = self->_harmonizedNumberFormatterSymbols;
        [NSString stringWithFormat:@"format-%@-decimalFormat", v11];
        goto LABEL_15;
      case 2:
        v63 = self->_harmonizedNumberFormatterSymbols;
        [NSString stringWithFormat:@"format-%@-currencyFormat", v11];
        goto LABEL_15;
      case 3:
        v63 = self->_harmonizedNumberFormatterSymbols;
        [NSString stringWithFormat:@"format-%@-percentFormat", v11];
        goto LABEL_15;
      case 4:
        v63 = self->_harmonizedNumberFormatterSymbols;
        [NSString stringWithFormat:@"format-%@-scientificFormat", v11];
        v64 = LABEL_15:;
        v65 = [(OITSULocaleStructuredDictionary *)v63 objectForKey:v64 locale:v5];
        CFNumberFormatterSetFormat(v8, v65);

        break;
      default:
        break;
    }
  }

LABEL_17:
  return v8;
}

- (void)p_numberPreferencesChanged:(id)a3
{
  objc_super v4 = objc_msgSend(MEMORY[0x263F08B88], "currentThread", a3);
  id v11 = [v4 threadDictionary];

  id v5 = [v11 objectForKey:@"TSUNumberFormatterThreadDictionaryKey"];
  if (v5 != self)
  {
    BOOL v6 = [NSString stringWithUTF8String:"-[OITSUNumberFormatter(Private) p_numberPreferencesChanged:]"];
    uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormatter.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:1703 isFatal:0 description:"Registered wrong date formatter for date preference change notification"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  [v11 removeObjectForKey:@"TSUNumberFormatterThreadDictionaryKey"];
  id v8 = [v11 objectForKey:@"TSUNumberFormatterThreadDictionaryLocaleObserverKey"];
  TSURemoveLocaleChangeObserver(v8);

  [v11 removeObjectForKey:@"TSUNumberFormatterThreadDictionaryLocaleObserverKey"];
  uint64_t v9 = [v11 objectForKey:@"TSUNumberFormatterThreadDictionaryExitObserverKey"];
  uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 removeObserver:v9];

  [v11 removeObjectForKey:@"TSUNumberFormatterThreadDictionaryExitObserverKey"];
}

- (BOOL)decimalFromString:(id)a3 value:(double *)a4 formatString:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(OITSUNumberFormatter *)self p_decimalFormatters];
  LOBYTE(a5) = [(OITSUNumberFormatter *)self p_valueFromString:v8 formatters:v9 value:a4 formatString:a5];

  return (char)a5;
}

- (BOOL)currencyFromString:(id)a3 additionalCurrencyCode:(id)a4 value:(double *)a5 formatString:(id *)a6 currencyCode:(id *)a7
{
  id v12 = a4;
  id v50 = 0;
  id v51 = 0;
  uint64_t v13 = [(OITSUNumberFormatter *)self p_findCurrencySymbolInString:a3 additionalCurrencyCode:v12 successfullString:&v51 currencyCode:&v50];
  id v14 = v51;
  CFStringRef v15 = (NSString *)v50;
  uint64_t v16 = v15;
  BOOL v17 = 0;
  if (v13 && v15)
  {
    CFStringRef v48 = [(OITSUNumberFormatter *)self p_currencyFormatters];
    int v18 = [v48 objectForKeyedSubscript:v16];
    if (!v18)
    {
      id v19 = [NSString stringWithUTF8String:"-[OITSUNumberFormatter(Private) currencyFromString:additionalCurrencyCode:value:formatString:currencyCode:]"];
      CFStringRef v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormatter.m"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 1741, 1, v16, self->_locale);

      TSUCrash((uint64_t)"No currency formatters found for currencyCode:%{public}@ locale:%{public}@", v21, v22, v23, v24, v25, v26, v27, (uint64_t)v16);
    }
    BOOL v28 = [(OITSUNumberFormatter *)self p_valueFromString:v14 formatters:v18 value:a5 formatString:a6];
    BOOL v17 = v28;
    if (!v12 || v28) {
      goto LABEL_15;
    }
    if (self->_additionalCurrencyCode)
    {
      if (objc_msgSend(v12, "isEqualToString:"))
      {
LABEL_12:
        uint64_t v34 = a6;
        v35 = self->_additionalCurrencyCode;

        uint64_t v36 = [(NSDictionary *)self->_additionalCurrencyCodeFormatters objectForKey:self->_additionalCurrencyCode];

        if (!v36)
        {
          uint64_t v37 = [NSString stringWithUTF8String:"-[OITSUNumberFormatter(Private) currencyFromString:additionalCurrencyCode:value:formatString:currencyCode:]"];
          v38 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormatter.m"];
          +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v37, v38, 1764, 1, self->_additionalCurrencyCode, self->_locale);

          TSUCrash((uint64_t)"No currency formatters found for additional currencyCode:%{public}@ locale:%{public}@", v39, v40, v41, v42, v43, v44, v45, (uint64_t)self->_additionalCurrencyCode);
        }
        BOOL v17 = [(OITSUNumberFormatter *)self p_valueFromString:v14 formatters:v36 value:a5 formatString:v34];
        uint64_t v16 = v35;
        int v18 = (void *)v36;
LABEL_15:

        goto LABEL_16;
      }
      additionalCurrencyCode = self->_additionalCurrencyCode;
    }
    else
    {
      additionalCurrencyCode = 0;
    }
    self->_additionalCurrencyCode = 0;

    additionalCurrencyCodeFormatters = self->_additionalCurrencyCodeFormatters;
    self->_additionalCurrencyCodeFormatters = 0;

    objc_storeStrong((id *)&self->_additionalCurrencyCode, a4);
    uint64_t v31 = [MEMORY[0x263EFF8C0] arrayWithObject:self->_additionalCurrencyCode];
    CFStringRef v32 = [(OITSUNumberFormatter *)self p_createDictionaryOfCurrencyFormattersForCurrencies:v31];
    v33 = self->_additionalCurrencyCodeFormatters;
    self->_additionalCurrencyCodeFormatters = v32;

    goto LABEL_12;
  }
LABEL_16:
  if (a7)
  {
    if (v17) {
      uint64_t v46 = v16;
    }
    else {
      uint64_t v46 = 0;
    }
    *a7 = v46;
  }

  return v17;
}

- (BOOL)percentageFromString:(id)a3 value:(double *)a4 formatString:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(OITSUNumberFormatter *)self p_percentageFormatters];
  LOBYTE(a5) = [(OITSUNumberFormatter *)self p_valueFromString:v8 formatters:v9 value:a4 formatString:a5];

  return (char)a5;
}

- (BOOL)scientificFromString:(id)a3 value:(double *)a4 formatString:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = [(OITSUNumberFormatter *)self p_scientificFormatters];
  LOBYTE(a5) = [(OITSUNumberFormatter *)self p_valueFromString:v8 formatters:v9 value:a4 formatString:a5];

  return (char)a5;
}

- (BOOL)fractionFromString:(id)a3 value:(double *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 rangeOfString:@"/"];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL || v8 == 0)
  {
    id v12 = 0;
    if (!a4)
    {
LABEL_26:
      BOOL v10 = 0;
      goto LABEL_41;
    }
  }
  else
  {
    uint64_t v11 = v7;
    id v12 = objc_msgSend(v6, "substringWithRange:", 0, v7);
    unint64_t v13 = v11 + 1;
    if (v13 < [v6 length])
    {
      id v14 = objc_msgSend(v6, "substringWithRange:", v13, objc_msgSend(v6, "length") - v13);
      CFStringRef v15 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      uint64_t v16 = [v12 stringByTrimmingCharactersInSet:v15];
      BOOL v17 = [v14 stringByTrimmingCharactersInSet:v15];
      uint64_t v18 = [v16 rangeOfString:@" "];
      if (v18 == 0x7FFFFFFFFFFFFFFFLL || v19 == 0)
      {
        uint64_t v27 = 0;
        v35 = 0;
        uint64_t v36 = 0;
        double v38 = 0.0;
        double v39 = 0.0;
        double v37 = 0.0;
      }
      else
      {
        uint64_t v26 = v18;
        uint64_t v27 = objc_msgSend(v16, "substringWithRange:", 0, v18);
        unint64_t v28 = v26 + 1;
        if (v28 >= [v16 length])
        {
          BOOL v10 = 0;
          if (a4) {
            *a4 = 0.0;
          }
          goto LABEL_40;
        }
        uint64_t v34 = v17;
        v29 = objc_msgSend(v16, "substringWithRange:", v28, objc_msgSend(v16, "length") - v28);
        uint64_t v21 = [v27 stringByTrimmingCharactersInSet:v15];
        uint64_t v36 = v29;
        uint64_t v30 = [v29 stringByTrimmingCharactersInSet:v15];
        double v38 = 0.0;
        double v39 = 0.0;
        double v37 = 0.0;
        v35 = (void *)v30;
        if (v21)
        {
          uint64_t v31 = (void *)v30;
          if (!TSUImprovedCFNumberFormatterGetValueFromString(self->_fractionFormatter, v21, &v37)
            || (double v22 = floor(v37), vabdd_f64(v37, v22) > 0.00001))
          {
            BOOL v10 = 0;
            double v25 = 0.0;
            BOOL v17 = v34;
            if (!a4) {
              goto LABEL_39;
            }
            goto LABEL_38;
          }
          char ValueFromString = TSUImprovedCFNumberFormatterGetValueFromString(self->_fractionFormatter, v31, &v39);
          BOOL v17 = v34;
          if ((ValueFromString & 1) == 0)
          {
LABEL_37:
            BOOL v10 = 0;
            double v25 = 0.0;
            if (!a4)
            {
LABEL_39:

LABEL_40:
              goto LABEL_41;
            }
LABEL_38:
            *a4 = v25;
            goto LABEL_39;
          }
LABEL_17:
          if ((TSUImprovedCFNumberFormatterGetValueFromString(self->_fractionFormatter, v17, &v38) & 1) != 0
            && v38 != 0.0)
          {
            double v23 = v39;
            if (v22 < 0.0)
            {
              double v23 = -v39;
              double v39 = -v39;
            }
            double v24 = v22 + v23 / v38;
            if (__fpclassifyd(v24) != 2 && __fpclassifyd(v24) != 1)
            {
              if (!a4)
              {
                BOOL v10 = 1;
                goto LABEL_39;
              }
              double v25 = v22 + v39 / v38;
              BOOL v10 = 1;
              goto LABEL_38;
            }
          }
          goto LABEL_37;
        }
        BOOL v17 = v34;
      }
      uint64_t v21 = 0;
      if ((TSUImprovedCFNumberFormatterGetValueFromString(self->_fractionFormatter, v16, &v39) & 1) == 0) {
        goto LABEL_37;
      }
      double v22 = 0.0;
      goto LABEL_17;
    }
    if (!a4) {
      goto LABEL_26;
    }
  }
  BOOL v10 = 0;
  *a4 = 0.0;
LABEL_41:

  return v10;
}

- (BOOL)p_valueFromString:(id)a3 formatters:(id)a4 value:(double *)a5 formatString:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  if (!v10)
  {
    BOOL v15 = 0;
    if (!a6) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  unint64_t v12 = [v10 count];
  unint64_t v13 = objc_opt_class();
  objc_sync_enter(v13);
  if (v12)
  {
    uint64_t v14 = 0;
    BOOL v15 = 1;
    while (1)
    {
      uint64_t v16 = (__CFNumberFormatter *)[v11 objectAtIndex:v14];
      if (TSUImprovedCFNumberFormatterGetValueFromString(v16, v9, a5)) {
        break;
      }
      BOOL v15 = ++v14 < v12;
      if (v12 == v14) {
        goto LABEL_6;
      }
    }
    if (a6)
    {
      CFNumberFormatterGetFormat(v16);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
LABEL_6:
    BOOL v15 = 0;
  }
  objc_sync_exit(v13);

  if (a6)
  {
LABEL_12:
    if (!v15) {
      *a6 = 0;
    }
  }
LABEL_14:

  return v15;
}

- (id)p_findCurrencySymbolInString:(id)a3 additionalCurrencyCode:(id)a4 successfullString:(id *)a5 currencyCode:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [v10 length];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v40 = a5;
    objc_opt_class();
    id obj = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(obj);
    uint64_t v14 = 8;
    uint64_t v47 = v13;
    if (v13 < 8) {
      uint64_t v14 = v13;
    }
    uint64_t v48 = v14;
    BOOL v15 = TSUCurrencyCodesForLocale(self->_locale, v11);
    uint64_t v16 = [v15 count];
    id v37 = v11;
    if (v16)
    {
      uint64_t v41 = v16;
      double v39 = a6;
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      uint64_t v17 = 0;
      unint64_t v46 = 0;
      uint64_t v43 = v13 - v48;
      uint64_t v42 = self;
      while (1)
      {
        uint64_t v18 = v15;
        uint64_t v19 = objc_msgSend(v15, "objectAtIndex:", v17, v37);
        CFStringRef v20 = [(OITSUNumberFormatter *)self currencySymbolForCurrencyCode:v19];
        uint64_t v21 = [v20 stringByReplacingOccurrencesOfString:@"\u200F" withString:&stru_26EBF24D8];
        uint64_t v22 = objc_msgSend(v10, "rangeOfString:options:range:", v21, 0, 0, v48);
        unint64_t v24 = v23;
        unint64_t v26 = 0;
        uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
        if (v47 >= 1) {
          uint64_t v25 = objc_msgSend(v10, "rangeOfString:options:range:", v21, 0, v43, v48);
        }
        if (v22 != 0x7FFFFFFFFFFFFFFFLL || v25 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v22 != 0x7FFFFFFFFFFFFFFFLL && v24 > v46) {
            break;
          }
          if (v25 != 0x7FFFFFFFFFFFFFFFLL)
          {
            unint64_t v24 = v26;
            if (v26 > v46) {
              break;
            }
          }
        }
        uint64_t v27 = [(OITSUNumberFormatter *)self halfWidthCurrencySymbolForCurrencyCode:v19];
        uint64_t v28 = objc_msgSend(v10, "rangeOfString:options:range:", v27, 0, 0, v48);
        unint64_t v30 = v29;
        unint64_t v24 = 0;
        uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
        if (v47 >= 1)
        {
          uint64_t v31 = objc_msgSend(v10, "rangeOfString:options:range:", v27, 0, v43, v48);
          unint64_t v24 = v32;
        }
        if (v28 != 0x7FFFFFFFFFFFFFFFLL || v31 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v28 != 0x7FFFFFFFFFFFFFFFLL && v30 > v46)
          {
            unint64_t v24 = v30;
            uint64_t v31 = v28;
LABEL_25:
            objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", v31, v24, v21);
            id v33 = (id)objc_claimAutoreleasedReturnValue();

LABEL_26:
            id v34 = v21;

            if (v40) {
              *uint64_t v40 = v33;
            }
            if (v39) {
              id *v39 = v19;
            }
            uint64_t v44 = v33;
            uint64_t v45 = v34;
            unint64_t v46 = v24;
            goto LABEL_31;
          }
          if (v31 != 0x7FFFFFFFFFFFFFFFLL && v24 > v46) {
            goto LABEL_25;
          }
        }

LABEL_31:
        ++v17;
        self = v42;
        BOOL v15 = v18;
        if (v41 == v17) {
          goto LABEL_35;
        }
      }
      id v33 = v10;
      uint64_t v27 = v44;
      goto LABEL_26;
    }
    uint64_t v44 = 0;
    uint64_t v45 = 0;
LABEL_35:

    objc_sync_exit(obj);
    id v11 = v37;
    v35 = v45;
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (id)displayNameForCurrencyCode:(id)a3
{
  return [(NSLocale *)self->_locale displayNameForKey:*MEMORY[0x263EFF4D8] value:a3];
}

- (void)p_loadHarmonizedNumberFormatterSymbols
{
  if (!self->_harmonizedNumberFormatterSymbols)
  {
    id obj = self;
    objc_sync_enter(obj);
    if (!self->_harmonizedNumberFormatterSymbols)
    {
      locale = obj->_locale;
      objc_super v4 = SFUBundle();
      id v5 = +[OITSULocaleStructuredDictionary dictionaryWithContentsOfFileForLocale:locale inDirectory:@"NumberFormatterSymbols" inBundle:v4];
      harmonizedNumberFormatterSymbols = self->_harmonizedNumberFormatterSymbols;
      self->_harmonizedNumberFormatterSymbols = v5;

      if (!self->_harmonizedNumberFormatterSymbols)
      {
        uint64_t v7 = +[OITSULocaleStructuredDictionary numberFormatterSymbolsFallbackDictionary];
        uint64_t v8 = self->_harmonizedNumberFormatterSymbols;
        self->_harmonizedNumberFormatterSymbols = v7;
      }
    }
    objc_sync_exit(obj);
  }
}

- (id)currencySymbolForCurrencyCode:(id)a3
{
  objc_super v4 = (__CFString *)a3;
  if (!v4)
  {
    id v5 = [NSString stringWithUTF8String:"-[OITSUNumberFormatter(Private) currencySymbolForCurrencyCode:]"];
    id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNumberFormatter.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:2075 isFatal:0 description:"can't get the currency symbol for a nil currency code. Using USD."];

    +[OITSUAssertionHandler logBacktraceThrottled];
    objc_super v4 = @"USD";
  }
  uint64_t v7 = self->_currencyCodeToSymbolMap;
  objc_sync_enter(v7);
  uint64_t v8 = [(NSMutableDictionary *)self->_currencyCodeToSymbolMap objectForKey:v4];
  if (!v8)
  {
    if (+[OITSULocale localeIsAutoUpdating:self->_locale])
    {
      id v9 = self->_locale;
      id v10 = (void *)MEMORY[0x263EFF9A0];
      id v11 = (void *)MEMORY[0x263EFF960];
      uint64_t v12 = [(NSLocale *)v9 localeIdentifier];
      uint64_t v13 = [v11 componentsFromLocaleIdentifier:v12];
      uint64_t v14 = [v10 dictionaryWithDictionary:v13];

      [v14 setObject:v4 forKey:*MEMORY[0x263EFF4D8]];
      BOOL v15 = [MEMORY[0x263EFF960] localeIdentifierFromComponents:v14];
      uint64_t v16 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v15];
      uint64_t v8 = [v16 objectForKey:*MEMORY[0x263EFF4E0]];

      if (!v8) {
        goto LABEL_9;
      }
    }
    else
    {
      [(OITSUNumberFormatter *)self p_loadHarmonizedNumberFormatterSymbols];
      uint64_t v8 = [(OITSULocaleStructuredDictionary *)self->_harmonizedNumberFormatterSymbols objectForKey:v4 locale:self->_locale];
      if (!v8) {
        goto LABEL_9;
      }
    }
    [(NSMutableDictionary *)self->_currencyCodeToSymbolMap setObject:v8 forKey:v4];
  }
LABEL_9:
  objc_sync_exit(v7);

  if (v8) {
    uint64_t v17 = v8;
  }
  else {
    uint64_t v17 = v4;
  }
  uint64_t v18 = v17;

  return v18;
}

- (id)halfWidthCurrencySymbolForCurrencyCode:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_currencyCodeToHalfWidthSymbolMap objectForKey:v4];
  if (!v5)
  {
    id v6 = [(OITSUNumberFormatter *)self currencySymbolForCurrencyCode:v4];
    uint64_t v7 = (__CFString *)[v6 mutableCopy];
    CFStringTransform(v7, 0, (CFStringRef)*MEMORY[0x263EFFEF0], 0);
    id v5 = (void *)[(__CFString *)v7 copy];

    [(NSMutableDictionary *)self->_currencyCodeToHalfWidthSymbolMap setObject:v5 forKey:v4];
  }

  return v5;
}

- (id)currencyCode
{
  v2 = [(NSLocale *)self->_locale objectForKey:*MEMORY[0x263EFF4D8]];
  if (!v2) {
    v2 = @"USD";
  }
  return v2;
}

- (id)defaultFormatStringForValueType:(int)a3 negativeStyle:(int)a4
{
  uint64_t v4 = 136;
  if ((a3 - 1) < 3) {
    uint64_t v4 = 8 * (a3 - 1) + 144;
  }
  if (a4 >= 4) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = a4;
  }
  id v6 = [*(id *)((char *)&self->super.isa + v4) objectAtIndex:v5];
  return v6;
}

- (id)defaultFormatStringForValueType:(int)a3
{
  uint64_t v3 = 80;
  if ((a3 - 1) < 3) {
    uint64_t v3 = 8 * (a3 - 1) + 56;
  }
  return *(id *)((char *)&self->super.isa + v3);
}

- (id)decimalSeparator
{
  return self->_decimalSeparator;
}

- (id)groupingSeparator
{
  return self->_groupingSeparator;
}

- (id)currencyDecimalSeparator
{
  return self->_currencyDecimalSeparator;
}

- (id)currencyGroupingSeparator
{
  return self->_currencyGroupingSeparator;
}

- (id)percentSymbol
{
  return self->_percentSymbol;
}

- (unint64_t)groupingSize
{
  return self->_groupingSize;
}

- (id)p_createDictionaryOfCurrencyFormattersForCurrencies:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v7 = [(OITSUNumberFormatter *)self p_createHarmonizedCFNumberFormatterOfStyle:2];
  CFNumberFormatterSetProperty(v7, (CFNumberFormatterKey)*MEMORY[0x263EFFD50], @"xyzzyqghbv&q");
  uint64_t v8 = CFNumberFormatterGetFormat(v7);
  id v9 = objc_msgSend(v8, "tsu_positiveSubpatternOfNumberFormatPattern");
  id v10 = objc_msgSend(v9, "tsu_numberPortionOfNumberFormatSubpattern");

  CFRelease(v7);
  id v11 = [NSString stringWithFormat:@"¤%@", v10];
  [v6 addObject:v11];

  uint64_t v12 = [NSString stringWithFormat:@"¤%@;- ¤%@", v10, v10];
  [v6 addObject:v12];

  uint64_t v13 = [NSString stringWithFormat:@"%@¤", v10];
  [v6 addObject:v13];

  uint64_t v14 = [NSString stringWithFormat:@"%@¤;- %@¤", v10, v10];
  [v6 addObject:v14];

  BOOL v15 = [NSString stringWithFormat:@"¤%@;¤-%@", v10, v10];
  [v6 addObject:v15];

  uint64_t v16 = [NSString stringWithFormat:@"¤%@;(¤%@)", v10, v10];
  [v6 addObject:v16];

  uint64_t v17 = [NSString stringWithFormat:@"¤%@;¤(%@)", v10, v10];
  [v6 addObject:v17];

  uint64_t v18 = [NSString stringWithFormat:@"%@¤;(%@¤)", v10, v10];
  [v6 addObject:v18];

  uint64_t v19 = [NSString stringWithFormat:@"%@¤;(%@)¤", v10, v10];
  [v6 addObject:v19];

  CFStringRef v20 = [NSString stringWithFormat:@"¤%@;¤%@-", v10, v10];
  [v6 addObject:v20];

  uint64_t v21 = [v4 count];
  if (v21 >= 1)
  {
    uint64_t v22 = v21;
    for (uint64_t i = 0; i != v22; ++i)
    {
      unint64_t v24 = [v4 objectAtIndex:i];
      uint64_t v25 = p_newArrayOfCurrencyFormattersForCurrencyCode(self->_locale, v6, v24);
      [v5 setObject:v25 forKey:v24];
    }
  }

  return v5;
}

- (id)p_decimalFormatters
{
  decimalFormatters = self->_decimalFormatters;
  if (!decimalFormatters)
  {
    id v4 = objc_opt_class();
    objc_sync_enter(v4);
    if (!self->_decimalFormatters)
    {
      TSUCreateArrayOfDecimalFormattersForLocale(self->_locale);
      uint64_t v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
      __dmb(0xBu);
      id v6 = self->_decimalFormatters;
      self->_decimalFormatters = v5;
    }
    objc_sync_exit(v4);

    decimalFormatters = self->_decimalFormatters;
  }
  return decimalFormatters;
}

- (id)p_currencyFormatters
{
  currencyFormatters = self->_currencyFormatters;
  if (!currencyFormatters)
  {
    id v4 = objc_opt_class();
    objc_sync_enter(v4);
    if (!self->_currencyFormatters)
    {
      uint64_t v5 = TSUCurrencyCodesForLocale(self->_locale, 0);
      id v6 = [(OITSUNumberFormatter *)self p_createDictionaryOfCurrencyFormattersForCurrencies:v5];

      __dmb(0xBu);
      uint64_t v7 = self->_currencyFormatters;
      self->_currencyFormatters = v6;
    }
    objc_sync_exit(v4);

    currencyFormatters = self->_currencyFormatters;
  }
  return currencyFormatters;
}

- (id)p_percentageFormatters
{
  percentageFormatters = self->_percentageFormatters;
  if (!percentageFormatters)
  {
    id v4 = objc_opt_class();
    objc_sync_enter(v4);
    if (!self->_percentageFormatters)
    {
      TSUCreateArrayOfPercentageFormattersForLocale(self->_locale);
      uint64_t v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
      __dmb(0xBu);
      id v6 = self->_percentageFormatters;
      self->_percentageFormatters = v5;
    }
    objc_sync_exit(v4);

    percentageFormatters = self->_percentageFormatters;
  }
  return percentageFormatters;
}

- (id)p_scientificFormatters
{
  scientificFormatters = self->_scientificFormatters;
  if (!scientificFormatters)
  {
    id v4 = objc_opt_class();
    objc_sync_enter(v4);
    if (!self->_scientificFormatters)
    {
      TSUCreateArrayOfScientificFormattersForLocale(self->_locale);
      uint64_t v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
      __dmb(0xBu);
      id v6 = self->_scientificFormatters;
      self->_scientificFormatters = v5;
    }
    objc_sync_exit(v4);

    scientificFormatters = self->_scientificFormatters;
  }
  return scientificFormatters;
}

@end