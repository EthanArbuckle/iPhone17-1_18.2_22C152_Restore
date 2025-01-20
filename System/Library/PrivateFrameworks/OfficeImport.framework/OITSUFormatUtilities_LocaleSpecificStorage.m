@interface OITSUFormatUtilities_LocaleSpecificStorage
+ (id)localeSpecificStorageForLocale:(id)a3;
- (NSString)formatCurrencyString;
- (NSString)formatCurrencyStringMinus;
- (NSString)formatCurrencyStringRedOnly;
- (NSString)formatCurrencyStringWithParens;
- (NSString)formatDateTimeString;
- (NSString)formatDecimalString;
- (NSString)formatDecimalStringMinus;
- (NSString)formatDecimalStringRedOnly;
- (NSString)formatDecimalStringWithParens;
- (NSString)formatPercentageString;
- (NSString)formatPercentageStringMinus;
- (NSString)formatPercentageStringRedOnly;
- (NSString)formatPercentageStringWithParens;
- (NSString)formatScientificString;
- (NSString)formatScientificStringMinus;
- (NSString)formatScientificStringRedOnly;
- (NSString)formatScientificStringWithParens;
- (OITSUFormatUtilities_LocaleSpecificStorage)initWithLocale:(id)a3;
@end

@implementation OITSUFormatUtilities_LocaleSpecificStorage

- (OITSUFormatUtilities_LocaleSpecificStorage)initWithLocale:(id)a3
{
  id v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)OITSUFormatUtilities_LocaleSpecificStorage;
  v5 = [(OITSUFormatUtilities_LocaleSpecificStorage *)&v59 init];
  if (v5)
  {
    v6 = [v4 locale];
    v7 = TSUHarmonizedCFNumberFormatterCreate((uint64_t)v6, 2);

    uint64_t v8 = [(__CFString *)(id)CFNumberFormatterGetFormat(v7) copy];
    formatCurrencyString = v5->_formatCurrencyString;
    v5->_formatCurrencyString = (NSString *)v8;

    CFRelease(v7);
    v10 = +[OITSUNumberFormatter formatString:v5->_formatCurrencyString transformedForNegativeStyle:0];
    uint64_t v11 = [v10 copy];
    formatCurrencyStringMinus = v5->_formatCurrencyStringMinus;
    v5->_formatCurrencyStringMinus = (NSString *)v11;

    v13 = +[OITSUNumberFormatter formatString:v5->_formatCurrencyString transformedForNegativeStyle:1];
    uint64_t v14 = [v13 copy];
    formatCurrencyStringRedOnly = v5->_formatCurrencyStringRedOnly;
    v5->_formatCurrencyStringRedOnly = (NSString *)v14;

    v16 = +[OITSUNumberFormatter formatString:v5->_formatCurrencyString transformedForNegativeStyle:2];
    uint64_t v17 = [v16 copy];
    formatCurrencyStringWithParens = v5->_formatCurrencyStringWithParens;
    v5->_formatCurrencyStringWithParens = (NSString *)v17;

    v19 = [v4 locale];
    v20 = TSUHarmonizedCFNumberFormatterCreate((uint64_t)v19, 3);

    uint64_t v21 = [(__CFString *)(id)CFNumberFormatterGetFormat(v20) copy];
    formatPercentageString = v5->_formatPercentageString;
    v5->_formatPercentageString = (NSString *)v21;

    CFRelease(v20);
    v23 = +[OITSUNumberFormatter formatString:v5->_formatPercentageString transformedForNegativeStyle:0];
    uint64_t v24 = [v23 copy];
    formatPercentageStringMinus = v5->_formatPercentageStringMinus;
    v5->_formatPercentageStringMinus = (NSString *)v24;

    v26 = +[OITSUNumberFormatter formatString:v5->_formatPercentageString transformedForNegativeStyle:1];
    uint64_t v27 = [v26 copy];
    formatPercentageStringRedOnly = v5->_formatPercentageStringRedOnly;
    v5->_formatPercentageStringRedOnly = (NSString *)v27;

    v29 = +[OITSUNumberFormatter formatString:v5->_formatPercentageString transformedForNegativeStyle:2];
    uint64_t v30 = [v29 copy];
    formatPercentageStringWithParens = v5->_formatPercentageStringWithParens;
    v5->_formatPercentageStringWithParens = (NSString *)v30;

    v32 = [v4 locale];
    v33 = TSUHarmonizedCFNumberFormatterCreate((uint64_t)v32, 0);

    CFNumberFormatterSetFormat(v33, @"#.##E+00");
    uint64_t v34 = [(__CFString *)(id)CFNumberFormatterGetFormat(v33) copy];
    formatScientificString = v5->_formatScientificString;
    v5->_formatScientificString = (NSString *)v34;

    CFRelease(v33);
    v36 = +[OITSUNumberFormatter formatString:v5->_formatScientificString transformedForNegativeStyle:0];
    uint64_t v37 = [v36 copy];
    formatScientificStringMinus = v5->_formatScientificStringMinus;
    v5->_formatScientificStringMinus = (NSString *)v37;

    v39 = +[OITSUNumberFormatter formatString:v5->_formatScientificString transformedForNegativeStyle:1];
    uint64_t v40 = [v39 copy];
    formatScientificStringRedOnly = v5->_formatScientificStringRedOnly;
    v5->_formatScientificStringRedOnly = (NSString *)v40;

    v42 = +[OITSUNumberFormatter formatString:v5->_formatScientificString transformedForNegativeStyle:2];
    uint64_t v43 = [v42 copy];
    formatScientificStringWithParens = v5->_formatScientificStringWithParens;
    v5->_formatScientificStringWithParens = (NSString *)v43;

    v45 = [v4 locale];
    v46 = TSUHarmonizedCFNumberFormatterCreate((uint64_t)v45, 1);

    uint64_t v47 = [(__CFString *)(id)CFNumberFormatterGetFormat(v46) copy];
    formatDecimalString = v5->_formatDecimalString;
    v5->_formatDecimalString = (NSString *)v47;

    CFRelease(v46);
    v49 = +[OITSUNumberFormatter formatString:v5->_formatDecimalString transformedForNegativeStyle:0];
    uint64_t v50 = [v49 copy];
    formatDecimalStringMinus = v5->_formatDecimalStringMinus;
    v5->_formatDecimalStringMinus = (NSString *)v50;

    v52 = +[OITSUNumberFormatter formatString:v5->_formatDecimalString transformedForNegativeStyle:1];
    uint64_t v53 = [v52 copy];
    formatDecimalStringRedOnly = v5->_formatDecimalStringRedOnly;
    v5->_formatDecimalStringRedOnly = (NSString *)v53;

    v55 = +[OITSUNumberFormatter formatString:v5->_formatDecimalString transformedForNegativeStyle:2];
    uint64_t v56 = [v55 copy];
    formatDecimalStringWithParens = v5->_formatDecimalStringWithParens;
    v5->_formatDecimalStringWithParens = (NSString *)v56;
  }
  return v5;
}

+ (id)localeSpecificStorageForLocale:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v5 = [NSString stringWithUTF8String:"+[OITSUFormatUtilities_LocaleSpecificStorage localeSpecificStorageForLocale:]"];
    v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFormatUtilities.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:133 isFatal:0 description:"Need a locale here"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  v7 = [v4 localeSpecificStorageForKey:@"TSUFormatUtilities_LocaleSpecificStorage"];
  if (!v7)
  {
    id v8 = a1;
    objc_sync_enter(v8);
    v7 = [v4 localeSpecificStorageForKey:@"TSUFormatUtilities_LocaleSpecificStorage"];
    if (!v7)
    {
      v7 = [[OITSUFormatUtilities_LocaleSpecificStorage alloc] initWithLocale:v4];
      [v4 setLocaleSpecificStorage:v7 forKey:@"TSUFormatUtilities_LocaleSpecificStorage"];
    }
    objc_sync_exit(v8);
  }
  return v7;
}

- (NSString)formatDecimalString
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)formatDecimalStringMinus
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)formatDecimalStringRedOnly
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)formatCurrencyString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)formatCurrencyStringMinus
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)formatCurrencyStringRedOnly
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)formatPercentageString
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)formatPercentageStringMinus
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)formatPercentageStringRedOnly
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)formatScientificString
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)formatScientificStringMinus
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)formatScientificStringRedOnly
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)formatDateTimeString
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)formatDecimalStringWithParens
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)formatScientificStringWithParens
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)formatCurrencyStringWithParens
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)formatPercentageStringWithParens
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatPercentageStringWithParens, 0);
  objc_storeStrong((id *)&self->_formatCurrencyStringWithParens, 0);
  objc_storeStrong((id *)&self->_formatScientificStringWithParens, 0);
  objc_storeStrong((id *)&self->_formatDecimalStringWithParens, 0);
  objc_storeStrong((id *)&self->_formatDateTimeString, 0);
  objc_storeStrong((id *)&self->_formatScientificStringRedOnly, 0);
  objc_storeStrong((id *)&self->_formatScientificStringMinus, 0);
  objc_storeStrong((id *)&self->_formatScientificString, 0);
  objc_storeStrong((id *)&self->_formatPercentageStringRedOnly, 0);
  objc_storeStrong((id *)&self->_formatPercentageStringMinus, 0);
  objc_storeStrong((id *)&self->_formatPercentageString, 0);
  objc_storeStrong((id *)&self->_formatCurrencyStringRedOnly, 0);
  objc_storeStrong((id *)&self->_formatCurrencyStringMinus, 0);
  objc_storeStrong((id *)&self->_formatCurrencyString, 0);
  objc_storeStrong((id *)&self->_formatDecimalStringRedOnly, 0);
  objc_storeStrong((id *)&self->_formatDecimalStringMinus, 0);
  objc_storeStrong((id *)&self->_formatDecimalString, 0);
}

@end