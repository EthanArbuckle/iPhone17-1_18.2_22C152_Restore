@interface OITSUDurationFormatter
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (NSString)format;
- (OITSUDurationFormatter)init;
- (OITSUDurationFormatter)initWithCoder:(id)a3;
- (OITSUDurationFormatter)initWithLocale:(id)a3;
- (OITSULocale)locale;
- (id)stringForObjectValue:(id)a3;
- (int)compactStyleStartUnit;
- (void)dealloc;
- (void)p_commonInit;
- (void)setCompactStyleStartUnit:(int)a3;
- (void)setFormat:(id)a3;
@end

@implementation OITSUDurationFormatter

- (OITSUDurationFormatter)initWithLocale:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OITSUDurationFormatter;
  v4 = [(OITSUDurationFormatter *)&v6 init];
  if (v4)
  {
    v4->mLocale = (OITSULocale *)a3;
    [(OITSUDurationFormatter *)v4 p_commonInit];
  }
  return v4;
}

- (OITSUDurationFormatter)init
{
  v5.receiver = self;
  v5.super_class = (Class)OITSUDurationFormatter;
  v2 = [(OITSUDurationFormatter *)&v5 init];
  v3 = v2;
  if (v2) {
    [(OITSUDurationFormatter *)v2 p_commonInit];
  }
  return v3;
}

- (OITSUDurationFormatter)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OITSUDurationFormatter;
  v3 = [(OITSUDurationFormatter *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(OITSUDurationFormatter *)v3 p_commonInit];
  }
  return v4;
}

- (void)p_commonInit
{
  self->mFormat = (NSString *)[@"hh:mm:ss" copy];
  self->mCompactStyleStartUnit = 0;
  if (!self->mLocale) {
    self->mLocale = (OITSULocale *)+[OITSULocale currentLocale];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OITSUDurationFormatter;
  [(OITSUDurationFormatter *)&v3 dealloc];
}

- (id)stringForObjectValue:(id)a3
{
  if (!a3 || (objc_opt_respondsToSelector() & 1) == 0) {
    return &stru_26EBF24D8;
  }
  [a3 doubleValue];
  double v6 = v5;
  v7 = [(OITSUDurationFormatter *)self format];
  v8 = [(OITSUDurationFormatter *)self locale];
  return (id)TSUDurationFormatterStringFromTimeIntervalWithFormatAndRounding(v7, 1, v8, v6);
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  double v9 = NAN;
  int started = TSUDurationFormatterTimeIntervalFromStringWithCompactStyleStartUnit(a4, &v9, 0, 0, [(OITSUDurationFormatter *)self compactStyleStartUnit], [(OITSUDurationFormatter *)self locale]);
  if (started)
  {
    *a3 = (id)[NSNumber numberWithDouble:v9];
  }
  else if (a5)
  {
    *a5 = (id)[(id)SFUBundle() localizedStringForKey:@"The time is invalid." value:&stru_26EBF24D8 table:@"TSUtility"];
  }
  return started;
}

- (NSString)format
{
  return self->mFormat;
}

- (void)setFormat:(id)a3
{
}

- (OITSULocale)locale
{
  return self->mLocale;
}

- (int)compactStyleStartUnit
{
  return self->mCompactStyleStartUnit;
}

- (void)setCompactStyleStartUnit:(int)a3
{
  self->mCompactStyleStartUnit = a3;
}

@end