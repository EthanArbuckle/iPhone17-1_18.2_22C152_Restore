@interface CRLDecimalFormatter
- (BOOL)getValueFromString:(id)a3 rangePtr:(_NSRange *)a4 valuePtr:(double *)a5;
- (BOOL)useGroupingSeparator;
- (CRLDecimalFormatter)initWithLocale:(id)a3 style:(int64_t)a4;
- (CRLLocale)locale;
- (NSString)currencyCode;
- (NSString)currencySymbol;
- (NSString)exponentSymbol;
- (NSString)format;
- (_NSRange)crl_rangeOfNumericValueInString:(id)a3;
- (id)copyFormatterPropertyForKey:(__CFString *)a3;
- (id)createStringWithValue:(double)a3;
- (int)maxFractionDigits;
- (int)maxIntegerDigits;
- (int)minFractionDigits;
- (int)minIntegerDigits;
- (void)setExponentSymbol:(id)a3;
- (void)setFormat:(id)a3;
- (void)setMaxFractionDigits:(int)a3;
- (void)setMaxIntegerDigits:(int)a3;
- (void)setMinFractionDigits:(int)a3;
- (void)setMinIntegerDigits:(int)a3;
- (void)setUseGroupingSeparator:(BOOL)a3;
@end

@implementation CRLDecimalFormatter

- (CRLDecimalFormatter)initWithLocale:(id)a3 style:(int64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CRLDecimalFormatter;
  v4 = [(CRLDecimalFormatter *)&v11 init];
  v5 = v4;
  if (v4)
  {
    format = v4->_format;
    v4->_format = (NSString *)@"#.##";

    v5->_useGroupingSeparator = 1;
    *(_OWORD *)&v5->_minIntegerDigits = xmmword_101177760;
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)@"USD";

    currencySymbol = v5->_currencySymbol;
    v5->_currencySymbol = (NSString *)@"$";

    exponentSymbol = v5->_exponentSymbol;
    v5->_exponentSymbol = (NSString *)@"E";
  }
  return v5;
}

- (CRLLocale)locale
{
  return +[CRLLocale preferredLocale];
}

- (id)createStringWithValue:(double)a3
{
  return +[NSString stringWithFormat:@"%f", *(void *)&a3];
}

- (BOOL)getValueFromString:(id)a3 rangePtr:(_NSRange *)a4 valuePtr:(double *)a5
{
  id v7 = a3;
  v8 = +[CRLLocale preferredLocale];
  BOOL v9 = +[CRLNumberParser numberValueFromString:v7 locale:v8 outDoubleValue:a5];

  if (a4)
  {
    id v10 = [v7 length];
    a4->location = 0;
    a4->length = (NSUInteger)v10;
  }

  return v9;
}

- (id)copyFormatterPropertyForKey:(__CFString *)a3
{
  return 0;
}

- (NSString)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
}

- (BOOL)useGroupingSeparator
{
  return self->_useGroupingSeparator;
}

- (void)setUseGroupingSeparator:(BOOL)a3
{
  self->_useGroupingSeparator = a3;
}

- (int)minIntegerDigits
{
  return self->_minIntegerDigits;
}

- (void)setMinIntegerDigits:(int)a3
{
  self->_minIntegerDigits = a3;
}

- (int)maxIntegerDigits
{
  return self->_maxIntegerDigits;
}

- (void)setMaxIntegerDigits:(int)a3
{
  self->_maxIntegerDigits = a3;
}

- (int)minFractionDigits
{
  return self->_minFractionDigits;
}

- (void)setMinFractionDigits:(int)a3
{
  self->_minFractionDigits = a3;
}

- (int)maxFractionDigits
{
  return self->_maxFractionDigits;
}

- (void)setMaxFractionDigits:(int)a3
{
  self->_maxFractionDigits = a3;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (NSString)currencySymbol
{
  return self->_currencySymbol;
}

- (NSString)exponentSymbol
{
  return self->_exponentSymbol;
}

- (void)setExponentSymbol:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exponentSymbol, 0);
  objc_storeStrong((id *)&self->_currencySymbol, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);

  objc_storeStrong((id *)&self->_format, 0);
}

- (_NSRange)crl_rangeOfNumericValueInString:(id)a3
{
  NSUInteger v3 = sub_100F8A338(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_100F898D8);
  result.length = v4;
  result.location = v3;
  return result;
}

@end