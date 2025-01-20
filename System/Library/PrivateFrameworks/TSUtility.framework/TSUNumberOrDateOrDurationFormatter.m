@interface TSUNumberOrDateOrDurationFormatter
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (TSUNumberOrDateOrDurationFormatter)init;
- (id)stringForObjectValue:(id)a3;
- (void)dealloc;
@end

@implementation TSUNumberOrDateOrDurationFormatter

- (TSUNumberOrDateOrDurationFormatter)init
{
  v6.receiver = self;
  v6.super_class = (Class)TSUNumberOrDateOrDurationFormatter;
  v2 = [(TSUNumberOrDateOrDurationFormatter *)&v6 init];
  if (v2)
  {
    v3 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x263F08A30]);
    v2->mNumberFormatter = v3;
    [(NSNumberFormatter *)v3 setFormatterBehavior:1040];
    v4 = (void *)[MEMORY[0x263EFF960] currentLocale];
    -[NSNumberFormatter setDecimalSeparator:](v2->mNumberFormatter, "setDecimalSeparator:", [v4 objectForKey:*MEMORY[0x263EFF4E8]]);
    -[NSNumberFormatter setGroupingSeparator:](v2->mNumberFormatter, "setGroupingSeparator:", [v4 objectForKey:*MEMORY[0x263EFF4F8]]);
    [(NSNumberFormatter *)v2->mNumberFormatter setPositiveFormat:@"#.#########"];
    [(NSNumberFormatter *)v2->mNumberFormatter setZeroSymbol:@"0"];
    [(NSNumberFormatter *)v2->mNumberFormatter setNegativeFormat:@"-#.#########"];
  }
  return v2;
}

- (void)dealloc
{
  self->mNumberFormatter = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSUNumberOrDateOrDurationFormatter;
  [(TSUNumberOrDateOrDurationFormatter *)&v3 dealloc];
}

- (id)stringForObjectValue:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    mNumberFormatter = self->mNumberFormatter;
    return (id)[(NSNumberFormatter *)mNumberFormatter stringForObjectValue:a3];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFAbsoluteTime v7 = MEMORY[0x223C9E280](a3);
      CFTimeZoneRef v8 = TSUGetGMTTimeZone();
      CFGregorianDate GregorianDate = CFAbsoluteTimeGetGregorianDate(v7, v8);
      v10 = TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterShortStyle, (CFDateFormatterStyle)(2* ((*(void *)&GregorianDate.second & 0x7FFFFFFFFFFFFFFFLL | HIWORD(*(void *)&GregorianDate.year)) != 0)));
      CFStringRef v11 = TSUDateFormatterStringFromDateWithFormat((const __CFDate *)a3, v10);

      return (id)v11;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [a3 timeInterval];
        double v13 = v12;
        unsigned int v14 = TSUDurationFormatterDurationUnitsNecessaryToFullyDisplayDuration(2, 1, v12);
        v15 = TSUDurationFormatterFormatFromDurationUnits(v14, 1u, 0);
        return (id)TSUDurationFormatterStringFromTimeIntervalWithFormat(v15, v13);
      }
      else
      {
        return 0;
      }
    }
  }
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  id v8 = (id)TSUCreateDateFromString((uint64_t)a4, 0, 0);
  if (v8)
  {
    if (!a3) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  double v12 = 0.0;
  if (TSUGetNumberValueAndTypeFromString((const __CFString *)a4, 0, (uint64_t)&v12, 0, 0, 0))
  {
    if (!a3)
    {
LABEL_8:
      LOBYTE(v9) = 1;
      return v9;
    }
    id v8 = (id)[NSNumber numberWithDouble:v12];
LABEL_7:
    *a3 = v8;
    goto LABEL_8;
  }
  double v11 = 0.0;
  int v9 = TSUDurationFormatterTimeIntervalFromString(a4, &v11, 0, 0);
  if (v9)
  {
    if (a3) {
      *a3 = +[TSUDuration durationWithTimeInterval:v11];
    }
  }
  else if (a5)
  {
    *a5 = @"Failed to parse a number, date, or duration!";
  }
  return v9;
}

@end