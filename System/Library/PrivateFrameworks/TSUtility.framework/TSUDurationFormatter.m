@interface TSUDurationFormatter
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (NSString)format;
- (TSUDurationFormatter)init;
- (TSUDurationFormatter)initWithCoder:(id)a3;
- (id)stringForObjectValue:(id)a3;
- (int)compactStyleStartUnit;
- (void)dealloc;
- (void)p_commonInit;
- (void)setCompactStyleStartUnit:(int)a3;
- (void)setFormat:(id)a3;
@end

@implementation TSUDurationFormatter

- (TSUDurationFormatter)init
{
  v5.receiver = self;
  v5.super_class = (Class)TSUDurationFormatter;
  v2 = [(TSUDurationFormatter *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TSUDurationFormatter *)v2 p_commonInit];
  }
  return v3;
}

- (TSUDurationFormatter)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSUDurationFormatter;
  v3 = [(TSUDurationFormatter *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(TSUDurationFormatter *)v3 p_commonInit];
  }
  return v4;
}

- (void)p_commonInit
{
  self->mFormat = (NSString *)[@"hh:mm:ss" copy];
  self->mCompactStyleStartUnit = 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSUDurationFormatter;
  [(TSUDurationFormatter *)&v3 dealloc];
}

- (id)stringForObjectValue:(id)a3
{
  if (!a3 || (objc_opt_respondsToSelector() & 1) == 0) {
    return &stru_26D4F03D0;
  }
  [a3 doubleValue];
  double v6 = v5;
  v7 = [(TSUDurationFormatter *)self format];
  return (id)TSUDurationFormatterStringFromTimeIntervalWithFormatAndRoundingAndSingularOption(v7, 0, 0, v6);
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  double v9 = NAN;
  int started = TSUDurationFormatterTimeIntervalFromStringWithCompactStyleStartUnit(a4, &v9, 0, 0, [(TSUDurationFormatter *)self compactStyleStartUnit]);
  if (started)
  {
    *a3 = (id)[NSNumber numberWithDouble:v9];
  }
  else if (a5)
  {
    *a5 = (id)[(id)SFUBundle() localizedStringForKey:@"The time is invalid." value:&stru_26D4F03D0 table:@"TSUtility"];
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

- (int)compactStyleStartUnit
{
  return self->mCompactStyleStartUnit;
}

- (void)setCompactStyleStartUnit:(int)a3
{
  self->mCompactStyleStartUnit = a3;
}

@end