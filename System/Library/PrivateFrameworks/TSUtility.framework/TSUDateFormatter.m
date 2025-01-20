@interface TSUDateFormatter
+ (id)dateFormatStringSpecialSymbols;
+ (id)datePortionOfDateTimeFormatString:(id)a3;
+ (id)defaultDateTimeFormat;
+ (id)shortMonthNamesForNonCachedCurrentLocale;
+ (id)supportedDateFormats;
+ (id)supportedTimeFormats;
+ (id)timePortionOfDateTimeFormatString:(id)a3;
+ (unint64_t)p_DateTimeSplitLocationInFormatString:(id)a3;
- (TSUDateFormatter)init;
- (id)appropriateOutputFormatStringForInputFormatString:(id)a3;
- (id)fullDateString:(id)a3;
- (id)stringFromDate:(id)a3 format:(id)a4;
- (void)dealloc;
@end

@implementation TSUDateFormatter

+ (id)defaultDateTimeFormat
{
  id result = (id)defaultDateTimeFormat_sFormat;
  if (!defaultDateTimeFormat_sFormat)
  {
    id result = TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterMediumStyle, kCFDateFormatterShortStyle);
    defaultDateTimeFormat_sFormat = (uint64_t)result;
  }
  return result;
}

+ (id)supportedDateFormats
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterShortStyle, kCFDateFormatterNoStyle);
  v3 = TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterMediumStyle, kCFDateFormatterNoStyle);
  v4 = TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterLongStyle, kCFDateFormatterNoStyle);
  v5 = TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterFullStyle, kCFDateFormatterNoStyle);
  id v6 = TSUDateFormatterCopyDateTimeFormatInfoDictionaryForLocale(0);
  v7 = objc_msgSend((id)objc_msgSend(v6, "objectForKey:", TSUDateFormatterDateTimeFormatInfoDisplayedDateFormats), "mutableCopy");

  v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v7, "count"));
  CFDateRef v9 = (const __CFDate *)[MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:0.0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v8, "addObject:", TSUDateFormatterStringFromDateWithFormat(v9, *(const __CFString **)(*((void *)&v19 + 1) + 8 * v13++)));
      }
      while (v11 != v13);
      uint64_t v11 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
  CFStringRef v14 = TSUDateFormatterStringFromDateWithFormat(v9, v2);
  CFStringRef v15 = TSUDateFormatterStringFromDateWithFormat(v9, v3);
  CFStringRef v16 = TSUDateFormatterStringFromDateWithFormat(v9, v4);
  CFStringRef v17 = TSUDateFormatterStringFromDateWithFormat(v9, v5);
  if (([v8 containsObject:v14] & 1) == 0) {
    [v7 addObject:v2];
  }
  if (([v8 containsObject:v15] & 1) == 0) {
    [v7 addObject:v3];
  }
  if (([v8 containsObject:v16] & 1) == 0) {
    [v7 addObject:v4];
  }
  if (([v8 containsObject:v17] & 1) == 0) {
    [v7 addObject:v5];
  }

  return v7;
}

+ (id)supportedTimeFormats
{
  v2 = TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);
  v3 = TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterNoStyle, kCFDateFormatterMediumStyle);
  id v4 = TSUDateFormatterCopyDateTimeFormatInfoDictionaryForLocale(0);
  v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKey:", TSUDateFormatterDateTimeFormatInfoDisplayedTimeFormats), "mutableCopy");

  id v6 = (void *)[(__CFString *)v2 mutableCopy];
  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", @"h", @"hh", 0, 0, objc_msgSend(v6, "length"));
  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", @"H", @"HH", 0, 0, objc_msgSend(v6, "length"));
  CFStringRef v17 = v2;
  v7 = (void *)[(__CFString *)v2 mutableCopy];
  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", @"hh", @"h", 0, 0, objc_msgSend(v7, "length"));
  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", @"HH", @"H", 0, 0, objc_msgSend(v7, "length"));
  v8 = (void *)[(__CFString *)v3 mutableCopy];
  objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", @"h", @"hh", 0, 0, objc_msgSend(v8, "length"));
  objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", @"H", @"HH", 0, 0, objc_msgSend(v8, "length"));
  CFDateRef v9 = (void *)[(__CFString *)v3 mutableCopy];
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", @"hh", @"h", 0, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", @"HH", @"H", 0, 0, objc_msgSend(v9, "length"));
  uint64_t v10 = [v5 indexOfObject:v6];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
    [v5 removeObjectAtIndex:v10];
  }
  uint64_t v11 = [v5 indexOfObject:v7];
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = v11;
    [v5 removeObjectAtIndex:v11];
    uint64_t v10 = v12;
  }
  if (([v5 containsObject:v17] & 1) == 0)
  {
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      [v5 addObject:v17];
    }
    else {
      [v5 insertObject:v17 atIndex:v10];
    }
  }
  uint64_t v13 = [v5 indexOfObject:v8];
  if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
    [v5 removeObjectAtIndex:v13];
  }
  uint64_t v14 = [v5 indexOfObject:v9];
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = v14;
    [v5 removeObjectAtIndex:v14];
    uint64_t v13 = v15;
  }
  if (([v5 containsObject:v3] & 1) == 0)
  {
    if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
      [v5 addObject:v3];
    }
    else {
      [v5 insertObject:v3 atIndex:v13];
    }
  }

  return v5;
}

+ (id)dateFormatStringSpecialSymbols
{
  return (id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"GyMdhHmsSEDFwWakKZ'"];
}

+ (unint64_t)p_DateTimeSplitLocationInFormatString:(id)a3
{
  unint64_t v4 = [a3 length];
  v5 = (void *)[MEMORY[0x263F08B08] scannerWithString:a3];
  [v5 setCharactersToBeSkipped:0];
  uint64_t v6 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"'hHmsSakKZ"];
  uint64_t v11 = 0;
  unint64_t v7 = [v5 scanLocation];
  if (v7 < [a3 length])
  {
    while (1)
    {
      [v5 scanUpToCharactersFromSet:v6 intoString:&v11];
      unint64_t v8 = [v5 scanLocation];
      if (v8 >= [a3 length]
        || objc_msgSend(a3, "characterAtIndex:", objc_msgSend(v5, "scanLocation")) != 39)
      {
        break;
      }
      [v5 scanLocation];
      objc_msgSend(v5, "setScanLocation:", objc_msgSend(v5, "scanLocation") + 1);
      [v5 scanUpToString:@"'" intoString:&v11];
      objc_msgSend(v5, "setScanLocation:", objc_msgSend(v5, "scanLocation") + 1);
      [v5 scanLocation];
      unint64_t v9 = [v5 scanLocation];
      if (v9 >= [a3 length]) {
        return v4;
      }
    }
    return [v5 scanLocation];
  }
  return v4;
}

+ (id)datePortionOfDateTimeFormatString:(id)a3
{
  v3 = objc_msgSend(a3, "substringToIndex:", objc_msgSend(a1, "p_DateTimeSplitLocationInFormatString:"));
  uint64_t v4 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  return (id)[v3 stringByTrimmingCharactersInSet:v4];
}

+ (id)timePortionOfDateTimeFormatString:(id)a3
{
  unint64_t v4 = objc_msgSend(a1, "p_DateTimeSplitLocationInFormatString:");
  if (v4 >= [a3 length]) {
    return &stru_26D4F03D0;
  }
  v5 = (void *)[a3 substringFromIndex:v4];
  uint64_t v6 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  return (id)[v5 stringByTrimmingCharactersInSet:v6];
}

+ (id)shortMonthNamesForNonCachedCurrentLocale
{
  v2 = CFDateFormatterCreate(0, (CFLocaleRef)[MEMORY[0x263EFF960] currentLocale], kCFDateFormatterMediumStyle, kCFDateFormatterMediumStyle);
  v3 = (void *)CFDateFormatterCopyProperty(v2, (CFDateFormatterKey)*MEMORY[0x263EFFBD8]);
  CFRelease(v2);
  return v3;
}

- (TSUDateFormatter)init
{
  v9.receiver = self;
  v9.super_class = (Class)TSUDateFormatter;
  v2 = [(TSUDateFormatter *)&v9 init];
  if (v2)
  {
    TSUDateFormatterInit();
    v3 = CFDateFormatterCreate(0, (CFLocaleRef)sDateFormatterLocale, kCFDateFormatterMediumStyle, kCFDateFormatterNoStyle);
    unint64_t v4 = CFDateFormatterCreate(0, (CFLocaleRef)sDateFormatterLocale, kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);
    v2->mDateOnlyFormatString = (NSString *)(id)CFDateFormatterGetFormat(v3);
    v2->mTimeOnlyFormatString = (NSString *)(id)CFDateFormatterGetFormat(v4);
    v5 = CFDateFormatterCreate(0, (CFLocaleRef)sDateFormatterLocale, kCFDateFormatterFullStyle, kCFDateFormatterFullStyle);
    v2->mFullDateFormatter = v5;
    CFStringRef v6 = (const __CFString *)*MEMORY[0x263EFFC10];
    CFTimeZoneRef v7 = TSUGetGMTTimeZone();
    CFDateFormatterSetProperty(v5, v6, v7);
    CFRelease(v3);
    CFRelease(v4);
  }
  return v2;
}

- (void)dealloc
{
  CFRelease(self->mFullDateFormatter);
  v3.receiver = self;
  v3.super_class = (Class)TSUDateFormatter;
  [(TSUDateFormatter *)&v3 dealloc];
}

- (id)fullDateString:(id)a3
{
  if (!a3) {
    return 0;
  }
  StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, self->mFullDateFormatter, (CFDateRef)a3);
  return StringWithDate;
}

- (id)appropriateOutputFormatStringForInputFormatString:(id)a3
{
  unint64_t v4 = TSUGregorianUnitsPresentInFormatString(a3);
  if (v4 >= 8 && (v4 & 7) != 0) {
    return (id)[NSString stringWithFormat:@"%@ %@", self->mDateOnlyFormatString, self->mTimeOnlyFormatString];
  }
  if ((v4 & 7) != 0)
  {
    CFStringRef v6 = NSString;
    mDateOnlyFormatString = self->mDateOnlyFormatString;
  }
  else
  {
    if (v4 < 8)
    {
      id v8 = +[TSUAssertionHandler currentHandler];
      uint64_t v9 = [NSString stringWithUTF8String:"-[TSUDateFormatter(Private) appropriateOutputFormatStringForInputFormatString:]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUDateFormatter.m"), 783, @"this should never be reached");
      return 0;
    }
    CFStringRef v6 = NSString;
    mDateOnlyFormatString = self->mTimeOnlyFormatString;
  }
  return (id)[v6 stringWithString:mDateOnlyFormatString];
}

- (id)stringFromDate:(id)a3 format:(id)a4
{
  return (id)TSUDateFormatterStringFromDateWithFormat((const __CFDate *)a3, (const __CFString *)a4);
}

@end