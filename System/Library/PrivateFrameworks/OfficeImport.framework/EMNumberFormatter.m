@interface EMNumberFormatter
+ (id)formatterForFormat:(id)a3;
- (BOOL)isNegativeRed;
- (BOOL)useBigNumberFormatterForValue:(double)a3;
- (EMNumberFormatter)initWithExcelFormatString:(id)a3;
- (__CFDateFormatter)_dateFormatter;
- (__CFNumberFormatter)_bigNumberFormatter;
- (__CFNumberFormatter)_currencyFormatter;
- (__CFNumberFormatter)_doubleFormatter;
- (__CFNumberFormatter)_genericFormatterForNumberOfSignificantDigits:(unint64_t)a3;
- (__CFNumberFormatter)_percentFormatter;
- (id)_icuFormatStringForCurrencyFormat;
- (id)_icuFormatStringForDateFormat;
- (id)convertedGenericNumberFormatWithFormat:(id)a3;
- (id)formatCurrency:(double)a3;
- (id)formatDate:(id)a3;
- (id)formatDefault:(double)a3;
- (id)formatDefault:(double)a3 showingNumberOfDigits:(unint64_t)a4;
- (id)formatDoubleValue:(double)a3;
- (id)formatFraction:(double)a3;
- (id)formatPercent:(double)a3;
- (id)formatPhoneNumber:(double)a3;
- (id)formatValue:(double)a3 inWorkbook:(id)a4;
- (id)initForGeneralFormatting;
- (int)formatType;
- (unint64_t)optimalNumberOfDigitsForValue:(double)a3;
- (void)_parseExcelFormatString:(id)a3;
- (void)convertGenericNumberFormat:(id)a3;
- (void)dealloc;
@end

@implementation EMNumberFormatter

+ (id)formatterForFormat:(id)a3
{
  v3 = (__CFString *)a3;
  v4 = v3;
  v5 = @"General";
  if (v3) {
    v5 = v3;
  }
  v6 = v5;
  if (qword_2689BCCF8 != -1) {
    dispatch_once(&qword_2689BCCF8, &__block_literal_global_6_2);
  }
  id v7 = (id)_MergedGlobals_55;
  objc_sync_enter(v7);
  v8 = [(id)_MergedGlobals_55 objectForKey:v6];
  if (!v8)
  {
    if (v4 && ([(__CFString *)v4 isEqualToString:@"@"] & 1) == 0) {
      v9 = [[EMNumberFormatter alloc] initWithExcelFormatString:v4];
    }
    else {
      v9 = [[EMNumberFormatter alloc] initForGeneralFormatting];
    }
    v8 = v9;
    [(id)_MergedGlobals_55 setObject:v9 forKey:v6];
  }
  objc_sync_exit(v7);

  return v8;
}

- (EMNumberFormatter)initWithExcelFormatString:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EMNumberFormatter;
  v5 = [(EMNumberFormatter *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_formatType = 0;
    v5->_isNegativeRed = 0;
    uint64_t v7 = [v4 copy];
    excelFormatString = v6->_excelFormatString;
    v6->_excelFormatString = (NSString *)v7;

    [(EMNumberFormatter *)v6 _parseExcelFormatString:v4];
  }

  return v6;
}

- (int)formatType
{
  return self->_formatType;
}

- (BOOL)isNegativeRed
{
  return self->_isNegativeRed;
}

- (id)formatCurrency:(double)a3
{
  double valuePtr = a3;
  id v4 = [(EMNumberFormatter *)self _currencyFormatter];
  v5 = self;
  objc_sync_enter(v5);
  v6 = (__CFString *)CFNumberFormatterCreateStringWithValue((CFAllocatorRef)*MEMORY[0x263EFFB08], v4, kCFNumberDoubleType, &valuePtr);
  objc_sync_exit(v5);

  return v6;
}

- (__CFNumberFormatter)_currencyFormatter
{
  result = self->_currencyFormatter;
  if (!result)
  {
    id v4 = self;
    objc_sync_enter(v4);
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (qword_2689BCCF0 != -1) {
      dispatch_once(&qword_2689BCCF0, &__block_literal_global_109);
    }
    v6 = CFNumberFormatterCreate(v5, (CFLocaleRef)qword_2689BCCE8, kCFNumberFormatterCurrencyStyle);
    self->_currencyFormatter = v6;
    CFNumberFormatterSetProperty(v6, (CFNumberFormatterKey)*MEMORY[0x263EFFE20], &unk_26EC81230);
    uint64_t v7 = [(EMNumberFormatter *)v4 _icuFormatStringForCurrencyFormat];
    if (v7) {
      CFNumberFormatterSetFormat(self->_currencyFormatter, v7);
    }

    objc_sync_exit(v4);
    return self->_currencyFormatter;
  }
  return result;
}

- (id)formatPercent:(double)a3
{
  double valuePtr = a3;
  id v4 = [(EMNumberFormatter *)self _percentFormatter];
  CFAllocatorRef v5 = self;
  objc_sync_enter(v5);
  v6 = (__CFString *)CFNumberFormatterCreateStringWithValue((CFAllocatorRef)*MEMORY[0x263EFFB08], v4, kCFNumberDoubleType, &valuePtr);
  objc_sync_exit(v5);

  return v6;
}

- (id)formatDefault:(double)a3
{
  unint64_t v5 = -[EMNumberFormatter optimalNumberOfDigitsForValue:](self, "optimalNumberOfDigitsForValue:");
  return [(EMNumberFormatter *)self formatDefault:v5 showingNumberOfDigits:a3];
}

- (void)dealloc
{
  dateFormatter = self->_dateFormatter;
  if (dateFormatter) {
    CFRelease(dateFormatter);
  }
  genericFormatter = self->_genericFormatter;
  if (genericFormatter) {
    CFRelease(genericFormatter);
  }
  currencyFormatter = self->_currencyFormatter;
  if (currencyFormatter) {
    CFRelease(currencyFormatter);
  }
  bigNumberFormatter = self->_bigNumberFormatter;
  if (bigNumberFormatter) {
    CFRelease(bigNumberFormatter);
  }
  percentFormatter = self->_percentFormatter;
  if (percentFormatter) {
    CFRelease(percentFormatter);
  }
  doubleFormatter = self->_doubleFormatter;
  if (doubleFormatter) {
    CFRelease(doubleFormatter);
  }
  v9.receiver = self;
  v9.super_class = (Class)EMNumberFormatter;
  [(EMNumberFormatter *)&v9 dealloc];
}

- (id)formatDate:(id)a3
{
  CFDateRef v4 = (const __CFDate *)a3;
  unint64_t v5 = [(EMNumberFormatter *)self _dateFormatter];
  v6 = self;
  objc_sync_enter(v6);
  StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate((CFAllocatorRef)*MEMORY[0x263EFFB08], v5, v4);
  objc_sync_exit(v6);

  return StringWithDate;
}

- (__CFDateFormatter)_dateFormatter
{
  result = self->_dateFormatter;
  if (!result)
  {
    CFDateRef v4 = self;
    objc_sync_enter(v4);
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (qword_2689BCCF0 != -1) {
      dispatch_once(&qword_2689BCCF0, &__block_literal_global_109);
    }
    self->_dateFormatter = CFDateFormatterCreate(v5, (CFLocaleRef)qword_2689BCCE8, kCFDateFormatterShortStyle, kCFDateFormatterNoStyle);
    CFTimeZoneRef v6 = CFTimeZoneCreateWithTimeIntervalFromGMT(v5, 0.0);
    CFDateFormatterSetProperty(self->_dateFormatter, (CFStringRef)*MEMORY[0x263EFFC10], v6);
    CFRelease(v6);
    uint64_t v7 = [(EMNumberFormatter *)v4 _icuFormatStringForDateFormat];
    if (v7) {
      CFDateFormatterSetFormat(self->_dateFormatter, v7);
    }

    objc_sync_exit(v4);
    return self->_dateFormatter;
  }
  return result;
}

- (id)formatDoubleValue:(double)a3
{
  double valuePtr = a3;
  CFDateRef v4 = [(EMNumberFormatter *)self _doubleFormatter];
  CFAllocatorRef v5 = self;
  objc_sync_enter(v5);
  CFTimeZoneRef v6 = (__CFString *)CFNumberFormatterCreateStringWithValue((CFAllocatorRef)*MEMORY[0x263EFFB08], v4, kCFNumberDoubleType, &valuePtr);
  objc_sync_exit(v5);

  return v6;
}

- (__CFNumberFormatter)_bigNumberFormatter
{
  result = self->_bigNumberFormatter;
  if (!result)
  {
    CFDateRef v4 = self;
    objc_sync_enter(v4);
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (qword_2689BCCF0 != -1) {
      dispatch_once(&qword_2689BCCF0, &__block_literal_global_109);
    }
    CFTimeZoneRef v6 = CFNumberFormatterCreate(v5, (CFLocaleRef)qword_2689BCCE8, kCFNumberFormatterScientificStyle);
    self->_bigNumberFormatter = v6;
    CFNumberFormatterSetFormat(v6, @"0.0####E+00");
    objc_sync_exit(v4);

    return self->_bigNumberFormatter;
  }
  return result;
}

- (id)formatFraction:(double)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%1.2f", *(void *)&a3);
}

- (id)formatPhoneNumber:(double)a3
{
  if (a3 >= 9999999.0) {
    objc_msgSend(NSString, "stringWithFormat:", @"(%.3d) %.3d-%.4d", (int)(a3 / 10000000.0), ((int)(a3 - (double)(int)(a3 / 10000000.0) * 10000000.0) / 10000), ((int)(a3 - (double)(int)(a3 / 10000000.0) * 10000000.0) % 10000));
  }
  else {
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%.3d-%.4d", ((int)a3 / 10000), ((int)a3 % 10000), v5);
  }
  return v3;
}

uint64_t __40__EMNumberFormatter_formatterForFormat___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  v1 = (void *)_MergedGlobals_55;
  _MergedGlobals_55 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_55;
  return [v2 setName:@"Excel Formatters cache"];
}

- (id)initForGeneralFormatting
{
  v6.receiver = self;
  v6.super_class = (Class)EMNumberFormatter;
  v2 = [(EMNumberFormatter *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_formatType = 1;
    v2->_isNegativeRed = 0;
    excelFormatString = v2->_excelFormatString;
    v2->_excelFormatString = 0;
  }
  return v3;
}

- (__CFNumberFormatter)_genericFormatterForNumberOfSignificantDigits:(unint64_t)a3
{
  if (qword_2689BCD08 != -1) {
    dispatch_once(&qword_2689BCD08, &__block_literal_global_17_1);
  }
  if (self->_baseICUFormatString)
  {
    result = self->_genericFormatter;
    if (!result)
    {
      objc_super v6 = self;
      objc_sync_enter(v6);
      CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      if (qword_2689BCCF0 != -1) {
        dispatch_once(&qword_2689BCCF0, &__block_literal_global_109);
      }
      self->_genericFormatter = CFNumberFormatterCreate(v7, (CFLocaleRef)qword_2689BCCE8, kCFNumberFormatterDecimalStyle);
      v8 = [(EMNumberFormatter *)v6 convertedGenericNumberFormatWithFormat:self->_baseICUFormatString];
      CFNumberFormatterSetFormat(self->_genericFormatter, v8);
      CFNumberFormatterSetProperty(self->_genericFormatter, (CFNumberFormatterKey)*MEMORY[0x263EFFE20], &unk_26EC81230);

      objc_sync_exit(v6);
      return self->_genericFormatter;
    }
  }
  else
  {
    id v9 = (id)qword_2689BCD00;
    objc_sync_enter(v9);
    objc_super v10 = (void *)qword_2689BCD00;
    v11 = [NSNumber numberWithUnsignedInteger:a3];
    v12 = [v10 objectForKey:v11];

    if (!v12)
    {
      CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      if (qword_2689BCCF0 != -1) {
        dispatch_once(&qword_2689BCCF0, &__block_literal_global_109);
      }
      v12 = CFNumberFormatterCreate(v13, (CFLocaleRef)qword_2689BCCE8, kCFNumberFormatterDecimalStyle);
      v14 = [MEMORY[0x263F089D8] stringWithCapacity:a3];
      [(__CFString *)v14 appendString:@"@"];
      unint64_t v15 = a3 - 1;
      if (a3 != 1)
      {
        do
        {
          [(__CFString *)v14 appendString:@"#"];
          --v15;
        }
        while (v15);
      }
      CFNumberFormatterSetFormat(v12, v14);
      v16 = (void *)qword_2689BCD00;
      v17 = [NSNumber numberWithUnsignedInteger:a3];
      [v16 setObject:v12 forKey:v17];
    }
    objc_sync_exit(v9);

    return (__CFNumberFormatter *)CFAutorelease(v12);
  }
  return result;
}

uint64_t __67__EMNumberFormatter__genericFormatterForNumberOfSignificantDigits___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  v1 = (void *)qword_2689BCD00;
  qword_2689BCD00 = (uint64_t)v0;

  v2 = (void *)qword_2689BCD00;
  return [v2 setName:@"Excel Generic Formatters cache"];
}

- (__CFNumberFormatter)_doubleFormatter
{
  result = self->_doubleFormatter;
  if (!result)
  {
    CFDateRef v4 = self;
    objc_sync_enter(v4);
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (qword_2689BCCF0 != -1) {
      dispatch_once(&qword_2689BCCF0, &__block_literal_global_109);
    }
    self->_doubleFormatter = CFNumberFormatterCreate(v5, (CFLocaleRef)qword_2689BCCE8, kCFNumberFormatterDecimalStyle);
    if (v4->_baseICUFormatString)
    {
      -[EMNumberFormatter convertedGenericNumberFormatWithFormat:](v4, "convertedGenericNumberFormatWithFormat:");
      objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFNumberFormatterSetFormat(self->_doubleFormatter, v6);
    }
    objc_sync_exit(v4);

    return self->_doubleFormatter;
  }
  return result;
}

- (__CFNumberFormatter)_percentFormatter
{
  result = self->_percentFormatter;
  if (!result)
  {
    CFDateRef v4 = self;
    objc_sync_enter(v4);
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (qword_2689BCCF0 != -1) {
      dispatch_once(&qword_2689BCCF0, &__block_literal_global_109);
    }
    self->_percentFormatter = CFNumberFormatterCreate(v5, (CFLocaleRef)qword_2689BCCE8, kCFNumberFormatterPercentStyle);
    if (v4->_baseICUFormatString)
    {
      -[EMNumberFormatter convertedGenericNumberFormatWithFormat:](v4, "convertedGenericNumberFormatWithFormat:");
      objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFNumberFormatterSetFormat(self->_percentFormatter, v6);
    }
    objc_sync_exit(v4);

    return self->_percentFormatter;
  }
  return result;
}

- (id)_icuFormatStringForDateFormat
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  excelFormatString = self->_excelFormatString;
  if (excelFormatString && ![(NSString *)excelFormatString isEqualToString:@"GenericDate"])
  {
    uint64_t v5 = [(NSString *)self->_excelFormatString rangeOfString:@";"];
    if (v6)
    {
      CFAllocatorRef v7 = (void *)MEMORY[0x263F089D8];
      v8 = [(NSString *)self->_excelFormatString substringToIndex:v5];
      CFDateRef v4 = [v7 stringWithString:v8];
    }
    else
    {
      CFDateRef v4 = [MEMORY[0x263F089D8] stringWithString:self->_excelFormatString];
    }
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"dddd", @"EEEE", 2, 0, objc_msgSend(v4, "length"));
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"ddd", @"EEE", 2, 0, objc_msgSend(v4, "length"));
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"aaaa", @"EEEE", 2, 0, objc_msgSend(v4, "length"));
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"aaa", @"EEE", 2, 0, objc_msgSend(v4, "length"));
    uint64_t v9 = [v4 rangeOfString:@"AM/PM"];
    uint64_t v11 = v10;
    uint64_t v12 = [v4 rangeOfString:@"a/p"];
    uint64_t v14 = v13;
    if (v11)
    {
      objc_msgSend(v4, "deleteCharactersInRange:", v9, v11);
      [v4 insertString:@"a" atIndex:v9];
    }
    if (v14)
    {
      objc_msgSend(v4, "deleteCharactersInRange:", v12, v14);
      [v4 insertString:@"a" atIndex:v12];
    }
    if (qword_2689BCD20 != -1) {
      dispatch_once(&qword_2689BCD20, &__block_literal_global_64_0);
    }
    if (qword_2689BCD10) {
      objc_msgSend((id)qword_2689BCD10, "replaceMatchesInString:options:range:withTemplate:", v4, 0, 0, objc_msgSend(v4, "length"), @"$1");
    }
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"m", @"M", 2, 0, objc_msgSend(v4, "length"));
    if (qword_2689BCD18)
    {
      objc_msgSend((id)qword_2689BCD18, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v31 != v17) {
              objc_enumerationMutation(v15);
            }
            uint64_t v19 = [*(id *)(*((void *)&v30 + 1) + 8 * i) range];
            objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"M", @"m", 2, v19, v20);
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v16);
      }
    }
    if (!(v14 | v11)) {
      objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"h", @"H", 2, 0, objc_msgSend(v4, "length"));
    }
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"\\", &stru_26EBF24D8, 2, 0, objc_msgSend(v4, "length""));
    v21 = (void *)MEMORY[0x263F08790];
    if (qword_2689BCCF0 != -1) {
      dispatch_once(&qword_2689BCCF0, &__block_literal_global_109);
    }
    v22 = [v21 dateFormatFromTemplate:@"yMd" options:0 locale:qword_2689BCCE8];
    unint64_t v23 = [v22 rangeOfString:@"d"];
    unint64_t v24 = [v22 rangeOfString:@"M"];
    unint64_t v25 = [v22 rangeOfString:@"y"];
    if ([v4 rangeOfString:@"MM"] == 0x7FFFFFFFFFFFFFFFLL
      && v23 != 0x7FFFFFFFFFFFFFFFLL
      && v24 != 0x7FFFFFFFFFFFFFFFLL
      && v23 < v24
      && (v25 == 0x7FFFFFFFFFFFFFFFLL || v25 > v24))
    {
      objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"M/d", @"d/M", 2, 0, objc_msgSend(v4, "length"));
    }
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"ggge", @"Gy", 2, 0, objc_msgSend(v4, "length"));
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"gge", @"Gy", 2, 0, objc_msgSend(v4, "length"));
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"ge", @"Gy", 2, 0, objc_msgSend(v4, "length"));
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"\\\", @"===////", 2, 0, objc_msgSend(v4, "length""));
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"\", &stru_26EBF24D8, 2, 0, objc_msgSend(v4, "length""));
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"===////", @"\\\", 2, 0, objc_msgSend(v4, "length""));
    id v29 = 0;
    v26 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\\[\\$\\-.*\\]" options:1 error:&v29];
    id v27 = v29;
    if (v26) {
      objc_msgSend(v26, "replaceMatchesInString:options:range:withTemplate:", v4, 0, 0, objc_msgSend(v4, "length"), &stru_26EBF24D8);
    }
  }
  else
  {
    CFDateRef v4 = 0;
  }
  return v4;
}

void __50__EMNumberFormatter__icuFormatStringForDateFormat__block_invoke()
{
  id v7 = 0;
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"\\[(h|m|s)\\]" options:0 error:&v7];
  id v1 = v7;
  v2 = (void *)qword_2689BCD10;
  qword_2689BCD10 = v0;

  if (!qword_2689BCD10) {
    NSLog((NSString *)@"Unable to compile hmsBrackets regex: %@", v1);
  }
  id v6 = v1;
  uint64_t v3 = [objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"([Hh][^MmHhs]*[M]{1,2})|([M]{1,2}[^MmHhs]*s)" options:0 error:&v6];
  id v4 = v6;

  uint64_t v5 = (void *)qword_2689BCD18;
  qword_2689BCD18 = v3;

  if (!qword_2689BCD18) {
    NSLog((NSString *)@"Unable to compile mMinute regex: %@", v4);
  }
}

- (id)_icuFormatStringForCurrencyFormat
{
  uint64_t v3 = (void *)[(NSString *)self->_baseICUFormatString mutableCopy];
  if (v3)
  {
    id v8 = 0;
    objc_msgSend(MEMORY[0x263F08AE8], "regularExpressionWithPattern:options:error:", @"\\[\\$([^-;]+)-{0,1}[^\\];]*?\\]",
      1,
    id v4 = &v8);
    id v5 = v8;
    if (v4) {
      objc_msgSend(v4, "replaceMatchesInString:options:range:withTemplate:", v3, 0, 0, objc_msgSend(v3, "length"), @"\"$1\"");
    }
    [(EMNumberFormatter *)self convertGenericNumberFormat:v3];
    id v6 = v3;
  }
  return v3;
}

- (unint64_t)optimalNumberOfDigitsForValue:(double)a3
{
  if (round(a3) == a3) {
    return 11;
  }
  else {
    return 10;
  }
}

- (BOOL)useBigNumberFormatterForValue:(double)a3
{
  if (round(a3) == a3) {
    return a3 <= -1.0e11 || a3 >= 1.0e11;
  }
  BOOL result = 1;
  if (a3 <= 1.0e10 && a3 >= -1.0e10)
  {
    BOOL v4 = a3 != 0.0;
    if (a3 >= 0.000000001) {
      BOOL v4 = 0;
    }
    return a3 > -0.000000001 && v4;
  }
  return result;
}

- (id)formatDefault:(double)a3 showingNumberOfDigits:(unint64_t)a4
{
  double valuePtr = a3;
  if (-[EMNumberFormatter useBigNumberFormatterForValue:](self, "useBigNumberFormatterForValue:"))
  {
    id v7 = [(EMNumberFormatter *)self _bigNumberFormatter];
  }
  else
  {
    LODWORD(v8) = a3 > -1.0;
    if (a3 >= 1.0) {
      LODWORD(v8) = 0;
    }
    if (a4 > 1) {
      uint64_t v8 = v8;
    }
    else {
      uint64_t v8 = 0;
    }
    id v7 = [(EMNumberFormatter *)self _genericFormatterForNumberOfSignificantDigits:a4 - v8];
  }
  uint64_t v9 = v7;
  uint64_t v10 = self;
  objc_sync_enter(v10);
  uint64_t v11 = (__CFString *)CFNumberFormatterCreateStringWithValue((CFAllocatorRef)*MEMORY[0x263EFFB08], v9, kCFNumberDoubleType, &valuePtr);
  objc_sync_exit(v10);

  return v11;
}

- (void)convertGenericNumberFormat:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (qword_2689BCD40 != -1)
  {
    dispatch_once(&qword_2689BCD40, &__block_literal_global_159);
    id v4 = v7;
  }
  objc_msgSend((id)qword_2689BCD28, "replaceMatchesInString:options:range:withTemplate:", v7, 0, 0, objc_msgSend(v4, "length"), @" ");
  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", @"\\%", @"'%'", 2, 0, objc_msgSend(v7, "length"));
  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", @"\\", &stru_26EBF24D8, 2, 0, objc_msgSend(v7, "length""));
  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", @"\", &stru_26EBF24D8, 2, 0, objc_msgSend(v7, "length""));
  objc_msgSend((id)qword_2689BCD38, "replaceMatchesInString:options:range:withTemplate:", v7, 0, 0, objc_msgSend(v7, "length"), @"$1 -");
  if (self->_hasLocales) {
    objc_msgSend((id)qword_2689BCD30, "replaceMatchesInString:options:range:withTemplate:", v7, 0, 0, objc_msgSend(v7, "length"), &stru_26EBF24D8);
  }
  uint64_t v5 = [v7 rangeOfString:@";"];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = objc_msgSend(v7, "rangeOfString:options:range:", @";", 0, v5 + 1, objc_msgSend(v7, "length") + ~v5);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v7, "deleteCharactersInRange:", v6, objc_msgSend(v7, "length") - v6);
    }
  }
}

void __48__EMNumberFormatter_convertGenericNumberFormat___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"_." options:0 error:0];
  id v1 = (void *)qword_2689BCD28;
  qword_2689BCD28 = v0;

  uint64_t v2 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\\[\\$.*?\\]" options:0 error:0];
  uint64_t v3 = (void *)qword_2689BCD30;
  qword_2689BCD30 = v2;

  uint64_t v4 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"([^;])\\* -" options:0 error:0];
  uint64_t v5 = (void *)qword_2689BCD38;
  qword_2689BCD38 = v4;
}

- (id)convertedGenericNumberFormatWithFormat:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = (void *)[v4 mutableCopy];
    [(EMNumberFormatter *)self convertGenericNumberFormat:v6];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_parseExcelFormatString:(id)a3
{
  obj = (NSString *)a3;
  if (![(NSString *)obj isEqualToString:@"GenericDate"])
  {
    self->_formatType = 0;
    if (!obj)
    {
      baseICUFormatString = self->_baseICUFormatString;
      self->_baseICUFormatString = 0;
      goto LABEL_14;
    }
    if (qword_2689BCD50 != -1) {
      dispatch_once(&qword_2689BCD50, &__block_literal_global_182);
    }
    OcText::OcText(&v28);
    [(NSString *)obj copyToOcText:&v28];
    FormatInfo = (XlFormatInfo *)XlFormatProcessor::getFormatInfo((XlFormatProcessor *)qword_2689BCD48, &v28);
    id v27 = FormatInfo;
    if (!FormatInfo
      || (uint64_t v7 = *((void *)FormatInfo + 1),
          unint64_t v8 = *((void *)FormatInfo + 2) - v7,
          (uint64_t v9 = (unsigned __int16)(v8 >> 3)) == 0))
    {
LABEL_53:
      ChAutoPtr<XlFormatInfo>::~ChAutoPtr(&v27);
      OcText::~OcText(&v28);

      return;
    }
    unint64_t v10 = v8 >> 3;
    if (!(v8 >> 3)) {
      std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
    }
    uint64_t v11 = *(unsigned char **)v7;
    if ((unsigned __int16)(v8 >> 3) == 1)
    {
      if (*v11 && ((*((void *)v11 + 10) - *((void *)v11 + 9)) & 0x7FFFFFFF8) == 8)
      {
        int v12 = 1;
LABEL_52:
        self->_formatType = v12;
        goto LABEL_53;
      }
    }
    else
    {
      if (v10 <= 1) {
        std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
      }
      uint64_t v13 = *(void *)(v7 + 8);
      if (*(unsigned char *)(v13 + 10) && *(_WORD *)(v13 + 42) == 2)
      {
        uint64_t v14 = [(NSString *)obj stringByReplacingOccurrencesOfString:@"[Red]", &stru_26EBF24D8, 2, 0, [(NSString *)obj length] withString options range];

        self->_isNegativeRed = 1;
        uint64_t v7 = *((void *)v27 + 1);
        unint64_t v15 = (unint64_t)(*((void *)v27 + 2) - v7) >> 3;
        obj = (NSString *)v14;
        goto LABEL_22;
      }
    }
    unint64_t v15 = v8 >> 3;
LABEL_22:
    unint64_t v15 = v15;
    do
    {
      if (!v15) {
        std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
      }
      if (**(unsigned char **)v7)
      {
        self->_formatType = 1;
        uint64_t v16 = [(NSString *)obj stringByReplacingOccurrencesOfString:@"General" withString:@"@#########"];
        uint64_t v17 = self->_baseICUFormatString;
        self->_baseICUFormatString = v16;

        goto LABEL_53;
      }
      v7 += 8;
      --v15;
      --v9;
    }
    while (v9);
    if ((unsigned __int16)(v8 >> 3) == 2
      && v11[11]
      && *((double *)v11 + 2) == 9999999.0
      && *((_DWORD *)v11 + 11) == 3
      && *((_WORD *)v11 + 18) == 7)
    {
      int v12 = 3;
    }
    else
    {
      objc_storeStrong((id *)&self->_baseICUFormatString, obj);
      uint64_t v18 = 0;
      self->_formatType = 10;
      uint64_t v19 = *((void *)v27 + 1);
      uint64_t v20 = ((unint64_t)(*((void *)v27 + 2) - v19) >> 3);
      if ((v10 & 0xFFFE) != 0) {
        uint64_t v21 = (unsigned __int16)(v8 >> 3);
      }
      else {
        uint64_t v21 = 1;
      }
      while (1)
      {
        if (v18 == v20) {
          std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
        }
        uint64_t v22 = *(void *)(v19 + 8 * v18);
        if (*(unsigned char *)(v22 + 2))
        {
          int v12 = 8;
          goto LABEL_52;
        }
        if (*(unsigned char *)(v22 + 4))
        {
          int v12 = 9;
          goto LABEL_52;
        }
        if (*(unsigned char *)(v22 + 5)) {
          break;
        }
        unint64_t v23 = *(int ***)(v22 + 72);
        unint64_t v24 = *(int ***)(v22 + 80);
        while (v23 != v24)
        {
          int v25 = **v23;
          if (v25 == 78)
          {
            self->_hasLocales = 1;
          }
          else if (v25 == 51)
          {
            self->_formatType = 4;
          }
          ++v23;
        }
        if (++v18 == v21) {
          goto LABEL_53;
        }
      }
      int v12 = 5;
    }
    goto LABEL_52;
  }
  self->_formatType = 8;
  id v4 = self->_baseICUFormatString;
  self->_baseICUFormatString = 0;

  baseICUFormatString = obj;
LABEL_14:
}

void __45__EMNumberFormatter__parseExcelFormatString___block_invoke()
{
}

- (id)formatValue:(double)a3 inWorkbook:(id)a4
{
  id v6 = a4;
  uint64_t v7 = 0;
  switch(self->_formatType)
  {
    case 0:
      goto LABEL_10;
    case 1:
    case 0xA:
      uint64_t v8 = [(EMNumberFormatter *)self formatDefault:a3];
      goto LABEL_9;
    case 3:
      uint64_t v8 = [(EMNumberFormatter *)self formatPhoneNumber:a3];
      goto LABEL_9;
    case 4:
      uint64_t v8 = [(EMNumberFormatter *)self formatCurrency:a3];
      goto LABEL_9;
    case 5:
      uint64_t v8 = [(EMNumberFormatter *)self formatPercent:a3];
      goto LABEL_9;
    case 8:
      uint64_t v9 = +[ECUtils dateFromXlDateTimeNumber:v6 edWorkbook:a3];
      uint64_t v7 = [(EMNumberFormatter *)self formatDate:v9];

      goto LABEL_10;
    case 9:
      uint64_t v8 = [(EMNumberFormatter *)self formatFraction:a3];
      goto LABEL_9;
    default:
      uint64_t v8 = [(EMNumberFormatter *)self formatDoubleValue:a3];
LABEL_9:
      uint64_t v7 = (void *)v8;
LABEL_10:

      return v7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseICUFormatString, 0);
  objc_storeStrong((id *)&self->_excelFormatString, 0);
}

@end