@interface OITSUDateFormatter_NSFormatter
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (BOOL)isDateOnly;
- (BOOL)isTimeOnly;
- (NSString)preferredFormat;
- (OITSUDateFormatter_NSFormatter)init;
- (OITSULocale)locale;
- (id)stringForObjectValue:(id)a3;
- (void)setIsDateOnly:(BOOL)a3;
- (void)setIsTimeOnly:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setPreferredFormat:(id)a3;
@end

@implementation OITSUDateFormatter_NSFormatter

- (OITSUDateFormatter_NSFormatter)init
{
  v5.receiver = self;
  v5.super_class = (Class)OITSUDateFormatter_NSFormatter;
  v2 = [(OITSUDateFormatter_NSFormatter *)&v5 init];
  if (v2)
  {
    v3 = +[OITSULocale currentLocale];
    [(OITSUDateFormatter_NSFormatter *)v2 setLocale:v3];
  }
  return v2;
}

- (void)setPreferredFormat:(id)a3
{
  id v7 = a3;
  if ([(OITSUDateFormatter_NSFormatter *)self isDateOnly])
  {
    v4 = +[OITSUDateFormatter datePortionOfDateTimeFormatString:v7];
LABEL_5:
    preferredFormat = self->_preferredFormat;
    self->_preferredFormat = v4;
    goto LABEL_7;
  }
  if ([(OITSUDateFormatter_NSFormatter *)self isTimeOnly])
  {
    v4 = +[OITSUDateFormatter timePortionOfDateTimeFormatString:v7];
    goto LABEL_5;
  }
  v6 = (NSString *)v7;
  preferredFormat = self->_preferredFormat;
  self->_preferredFormat = v6;
LABEL_7:
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  id v8 = a4;
  v9 = [(OITSUDateFormatter_NSFormatter *)self locale];
  id v14 = 0;
  v10 = (void *)TSUCreateDateFromStringWithPreferredFormat(v8, v9, 0, (uint64_t)&v14, 0);

  id v11 = v14;
  if (v11) {
    [(OITSUDateFormatter_NSFormatter *)self setPreferredFormat:v11];
  }
  if (v10)
  {
    *a3 = v10;
  }
  else
  {
    *a3 = 0;
    if (a5)
    {
      v12 = SFUBundle();
      *a5 = [v12 localizedStringForKey:@"The date is invalid." value:&stru_26EBF24D8 table:@"TSUtility"];
    }
  }

  return v10 != 0;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(OITSUDateFormatter_NSFormatter *)self locale];

  if (!v5)
  {
    v6 = [NSString stringWithUTF8String:"-[OITSUDateFormatter_NSFormatter stringForObjectValue:]"];
    id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUDateFormatter.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:1127 isFatal:0 description:"Locale property has been inappropriately cleared."];

    +[OITSUAssertionHandler logBacktraceThrottled];
    id v8 = +[OITSULocale currentLocale];
    [(OITSUDateFormatter_NSFormatter *)self setLocale:v8];
  }
  v9 = [(OITSUDateFormatter_NSFormatter *)self preferredFormat];

  if (!v9)
  {
    v10 = [(OITSUDateFormatter_NSFormatter *)self locale];
    id v11 = TSUShortestCompleteDateOnlyFormat(v10);
    [(OITSUDateFormatter_NSFormatter *)self setPreferredFormat:v11];
  }
  uint64_t v12 = objc_opt_class();
  v13 = TSUDynamicCast(v12, (uint64_t)v4);

  if (v13)
  {
    id v14 = [(OITSUDateFormatter_NSFormatter *)self preferredFormat];
    v15 = [(OITSUDateFormatter_NSFormatter *)self locale];
    v16 = TSUDateFormatterStringFromDateWithFormat(v13, v14, v15);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSString)preferredFormat
{
  return self->_preferredFormat;
}

- (BOOL)isDateOnly
{
  return self->isDateOnly;
}

- (void)setIsDateOnly:(BOOL)a3
{
  self->isDateOnly = a3;
}

- (BOOL)isTimeOnly
{
  return self->isTimeOnly;
}

- (void)setIsTimeOnly:(BOOL)a3
{
  self->isTimeOnly = a3;
}

- (OITSULocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_preferredFormat, 0);
}

@end