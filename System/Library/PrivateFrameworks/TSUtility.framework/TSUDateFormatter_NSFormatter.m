@interface TSUDateFormatter_NSFormatter
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (BOOL)isDateOnly;
- (BOOL)isTimeOnly;
- (NSString)preferredFormat;
- (id)stringForObjectValue:(id)a3;
- (void)dealloc;
- (void)setIsDateOnly:(BOOL)a3;
- (void)setIsTimeOnly:(BOOL)a3;
- (void)setPreferredFormat:(id)a3;
@end

@implementation TSUDateFormatter_NSFormatter

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSUDateFormatter_NSFormatter;
  [(TSUDateFormatter_NSFormatter *)&v3 dealloc];
}

- (void)setPreferredFormat:(id)a3
{
  mPreferredFormat = self->mPreferredFormat;
  if ([(TSUDateFormatter_NSFormatter *)self isDateOnly])
  {
    id v6 = +[TSUDateFormatter datePortionOfDateTimeFormatString:a3];
  }
  else
  {
    if (![(TSUDateFormatter_NSFormatter *)self isTimeOnly]) {
      goto LABEL_6;
    }
    id v6 = +[TSUDateFormatter timePortionOfDateTimeFormatString:a3];
  }
  a3 = v6;
LABEL_6:
  self->mPreferredFormat = (NSString *)a3;

  v7 = self->mPreferredFormat;
  v8 = v7;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  uint64_t v12 = 0;
  v9 = objc_msgSend(+[TSUDateParserLibrary sharedDateParserLibrary](TSUDateParserLibrary, "sharedDateParserLibrary"), "checkoutDateParser");
  v10 = (void *)[v9 newDateFromString:a4 preferredFormatString:0 successfulFormatString:&v12 tryAggressiveFormats:0];
  objc_msgSend(+[TSUDateParserLibrary sharedDateParserLibrary](TSUDateParserLibrary, "sharedDateParserLibrary"), "returnDateParser:", v9);
  if (v12) {
    -[TSUDateFormatter_NSFormatter setPreferredFormat:](self, "setPreferredFormat:");
  }
  if (v10)
  {
    *a3 = v10;
  }
  else
  {
    *a3 = 0;
    if (a5) {
      *a5 = (id)[(id)SFUBundle() localizedStringForKey:@"The date is invalid." value:&stru_26D4F03D0 table:@"TSUtility"];
    }
  }
  return v10 != 0;
}

- (id)stringForObjectValue:(id)a3
{
  if (![(TSUDateFormatter_NSFormatter *)self preferredFormat])
  {
    if (!TSUShortestCompleteDateOnlyFormat_sFormat) {
      TSUShortestCompleteDateOnlyFormat_sFormat = (uint64_t)CFDateFormatterCreateDateFormatFromTemplate(0, @"yMd", 0, (CFLocaleRef)sDateFormatterLocale);
    }
    -[TSUDateFormatter_NSFormatter setPreferredFormat:](self, "setPreferredFormat:");
  }
  uint64_t v5 = objc_opt_class();
  id result = (id)TSUDynamicCast(v5, (uint64_t)a3);
  if (result)
  {
    CFDateRef v7 = (const __CFDate *)result;
    v8 = [(TSUDateFormatter_NSFormatter *)self preferredFormat];
    return (id)TSUDateFormatterStringFromDateWithFormat(v7, (const __CFString *)v8);
  }
  return result;
}

- (NSString)preferredFormat
{
  return self->mPreferredFormat;
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

@end