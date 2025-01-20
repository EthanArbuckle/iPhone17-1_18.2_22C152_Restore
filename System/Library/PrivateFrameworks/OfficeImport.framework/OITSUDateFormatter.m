@interface OITSUDateFormatter
+ (id)dateFormatStringSpecialSymbols;
+ (id)datePortionOfDateTimeFormatString:(id)a3;
+ (id)defaultDateTimeFormatForLocale:(id)a3;
+ (id)p_supportedDateFormatMatchingFormat:(id)a3 locale:(id)a4;
+ (id)p_supportedTimeFormatMatchingFormat:(id)a3 locale:(id)a4;
+ (id)supportedDateFormatsForLocale:(id)a3;
+ (id)supportedTimeFormatsForLocale:(id)a3;
+ (id)timePortionOfDateTimeFormatString:(id)a3;
+ (unint64_t)p_DateTimeSplitLocationInFormatString:(id)a3;
- (OITSUDateFormatter)init;
- (OITSUDateFormatter)initWithLocale:(id)a3;
- (void)dealloc;
@end

@implementation OITSUDateFormatter

+ (id)defaultDateTimeFormatForLocale:(id)a3
{
  id v3 = a3;
  v4 = [v3 localeSpecificStorageForKey:@"TSUDateFormatter_defaultDateTimeFormat"];
  if (!v4)
  {
    v5 = objc_opt_class();
    objc_sync_enter(v5);
    v4 = (void *)TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterMediumStyle, kCFDateFormatterShortStyle, v3);
    [v3 setLocaleSpecificStorage:v4 forKey:@"TSUDateFormatter_defaultDateTimeFormat"];
    objc_sync_exit(v5);
  }
  return v4;
}

+ (id)supportedDateFormatsForLocale:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 localeSpecificStorageForKey:@"TSUDateFormatter_supportedDateFormats"];
  if (!v4)
  {
    objc_opt_class();
    id obj = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(obj);
    v26 = (void *)TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterShortStyle, kCFDateFormatterNoStyle, v3);
    v25 = (void *)TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterMediumStyle, kCFDateFormatterNoStyle, v3);
    v24 = (void *)TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterLongStyle, kCFDateFormatterNoStyle, v3);
    v5 = (void *)TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterFullStyle, kCFDateFormatterNoStyle, v3);
    v6 = [v3 locale];
    v7 = (void *)TSUDateFormatterCopyDateTimeFormatInfoDictionaryForLocale(v6);

    v8 = [v7 objectForKey:@"DisplayedDateFormats"];
    v9 = (void *)[v8 mutableCopy];

    v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v11 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:0.0];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    v22 = v7;
    if (v13)
    {
      uint64_t v14 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v12);
          }
          v16 = TSUDateFormatterStringFromDateWithFormat(v11, *(void **)(*((void *)&v27 + 1) + 8 * i), v3);
          [v10 addObject:v16];
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v13);
    }

    v17 = TSUDateFormatterStringFromDateWithFormat(v11, v26, v3);
    v18 = TSUDateFormatterStringFromDateWithFormat(v11, v25, v3);
    v19 = TSUDateFormatterStringFromDateWithFormat(v11, v24, v3);
    v20 = TSUDateFormatterStringFromDateWithFormat(v11, v5, v3);
    if (([v10 containsObject:v17] & 1) == 0)
    {
      [v10 addObject:v17];
      [v12 addObject:v26];
    }
    if (([v10 containsObject:v18] & 1) == 0)
    {
      [v10 addObject:v18];
      [v12 addObject:v25];
    }
    if (([v10 containsObject:v19] & 1) == 0)
    {
      [v10 addObject:v19];
      [v12 addObject:v24];
    }
    if (([v10 containsObject:v20] & 1) == 0)
    {
      [v10 addObject:v20];
      [v12 addObject:v5];
    }
    v4 = (void *)[v12 copy];
    [v3 setLocaleSpecificStorage:v4 forKey:@"TSUDateFormatter_supportedDateFormats"];

    objc_sync_exit(obj);
  }

  return v4;
}

+ (id)p_supportedDateFormatMatchingFormat:(id)a3 locale:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:0.0];
  v8 = TSUDateFormatterStringFromDateWithFormat(v7, v5, v6);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v9 = +[OITSUDateFormatter supportedDateFormatsForLocale:](OITSUDateFormatter, "supportedDateFormatsForLocale:", v6, 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v15 = TSUDateFormatterStringFromDateWithFormat(v7, v14, v6);
        if ([v15 isEqualToString:v8])
        {
          id v16 = v14;

          goto LABEL_11;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v16 = v5;
LABEL_11:

  return v16;
}

+ (id)supportedTimeFormatsForLocale:(id)a3
{
  id v3 = a3;
  v4 = [v3 localeSpecificStorageForKey:@"TSUDateFormatter_supportedTimeFormats"];
  if (!v4)
  {
    id v5 = objc_opt_class();
    objc_sync_enter(v5);
    id obj = v5;
    id v6 = (void *)TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterNoStyle, kCFDateFormatterShortStyle, v3);
    v7 = (void *)TSUDateFormatterCopyFormatStringForDateAndTimeStyles(kCFDateFormatterNoStyle, kCFDateFormatterMediumStyle, v3);
    v8 = [v3 locale];
    v9 = (void *)TSUDateFormatterCopyDateTimeFormatInfoDictionaryForLocale(v8);

    long long v21 = v9;
    uint64_t v10 = [v9 objectForKey:@"DisplayedTimeFormats"];
    uint64_t v11 = (void *)[v10 mutableCopy];

    uint64_t v12 = (void *)[v6 mutableCopy];
    objc_msgSend(v12, "replaceOccurrencesOfString:withString:options:range:", @"h", @"hh", 0, 0, objc_msgSend(v12, "length"));
    objc_msgSend(v12, "replaceOccurrencesOfString:withString:options:range:", @"H", @"HH", 0, 0, objc_msgSend(v12, "length"));
    uint64_t v13 = (void *)[v6 mutableCopy];
    objc_msgSend(v13, "replaceOccurrencesOfString:withString:options:range:", @"hh", @"h", 0, 0, objc_msgSend(v13, "length"));
    objc_msgSend(v13, "replaceOccurrencesOfString:withString:options:range:", @"HH", @"H", 0, 0, objc_msgSend(v13, "length"));
    uint64_t v14 = (void *)[v7 mutableCopy];
    objc_msgSend(v14, "replaceOccurrencesOfString:withString:options:range:", @"h", @"hh", 0, 0, objc_msgSend(v14, "length"));
    objc_msgSend(v14, "replaceOccurrencesOfString:withString:options:range:", @"H", @"HH", 0, 0, objc_msgSend(v14, "length"));
    v15 = (void *)[v7 mutableCopy];
    objc_msgSend(v15, "replaceOccurrencesOfString:withString:options:range:", @"hh", @"h", 0, 0, objc_msgSend(v15, "length"));
    objc_msgSend(v15, "replaceOccurrencesOfString:withString:options:range:", @"HH", @"H", 0, 0, objc_msgSend(v15, "length"));
    uint64_t v16 = [v11 indexOfObject:v12];
    if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
      [v11 removeObjectAtIndex:v16];
    }
    uint64_t v17 = [v11 indexOfObject:v13];
    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [v11 removeObjectAtIndex:v17];
      uint64_t v16 = v17;
    }
    if (([v11 containsObject:v6] & 1) == 0)
    {
      if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
        [v11 addObject:v6];
      }
      else {
        [v11 insertObject:v6 atIndex:v16];
      }
    }
    uint64_t v18 = [v11 indexOfObject:v14];
    if (v18 != 0x7FFFFFFFFFFFFFFFLL) {
      [v11 removeObjectAtIndex:v18];
    }
    uint64_t v19 = [v11 indexOfObject:v15];
    if (v19 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [v11 removeObjectAtIndex:v19];
      uint64_t v18 = v19;
    }
    if (([v11 containsObject:v7] & 1) == 0)
    {
      if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
        [v11 addObject:v7];
      }
      else {
        [v11 insertObject:v7 atIndex:v18];
      }
    }
    v4 = (void *)[v11 copy];
    [v3 setLocaleSpecificStorage:v4 forKey:@"TSUDateFormatter_supportedTimeFormats"];

    objc_sync_exit(obj);
  }

  return v4;
}

+ (id)p_supportedTimeFormatMatchingFormat:(id)a3 locale:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:0.0];
  v8 = TSUDateFormatterStringFromDateWithFormat(v7, v5, v6);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v9 = +[OITSUDateFormatter supportedTimeFormatsForLocale:](OITSUDateFormatter, "supportedTimeFormatsForLocale:", v6, 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v15 = TSUDateFormatterStringFromDateWithFormat(v7, v14, v6);
        if ([v15 isEqualToString:v8])
        {
          id v16 = v14;

          goto LABEL_11;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v16 = v5;
LABEL_11:

  return v16;
}

+ (id)dateFormatStringSpecialSymbols
{
  return (id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"GyMdhHmsSEDFwWakKZ'"];
}

+ (unint64_t)p_DateTimeSplitLocationInFormatString:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 length];
  id v5 = [MEMORY[0x263F08B08] scannerWithString:v3];
  [v5 setCharactersToBeSkipped:0];
  id v6 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"'hHmsSakKZ"];
  unint64_t v7 = [v5 scanLocation];
  if (v7 >= [v3 length])
  {
    id v9 = 0;
  }
  else
  {
    id v8 = 0;
    while (1)
    {
      id v21 = v8;
      [v5 scanUpToCharactersFromSet:v6 intoString:&v21];
      id v9 = v21;

      unint64_t v10 = [v5 scanLocation];
      if (v10 >= [v3 length]
        || objc_msgSend(v3, "characterAtIndex:", objc_msgSend(v5, "scanLocation")) != 39)
      {
        break;
      }
      uint64_t v11 = [v5 scanLocation];
      unint64_t v12 = [v5 scanLocation] + 1;
      if (v12 >= [v3 length]) {
        goto LABEL_14;
      }
      objc_msgSend(v5, "setScanLocation:", objc_msgSend(v5, "scanLocation") + 1);
      id v20 = v9;
      [v5 scanUpToString:@"'" intoString:&v20];
      id v8 = v20;

      unint64_t v13 = [v5 scanLocation] + 1;
      unint64_t v14 = [v3 length];
      uint64_t v15 = [v5 scanLocation] + 1;
      if (v13 >= v14)
      {
        if (v15 == [v3 length]) {
          goto LABEL_10;
        }
        id v16 = [NSString stringWithUTF8String:"+[OITSUDateFormatter p_DateTimeSplitLocationInFormatString:]"];
        uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUDateFormatter.m"];
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 1007, 0, "Unmatched single quote found in format string %{public}@", v3);

        +[OITSUAssertionHandler logBacktraceThrottled];
        uint64_t v15 = v11 + 1;
      }
      [v5 setScanLocation:v15];
      unint64_t v18 = [v5 scanLocation];
      if (v18 >= [v3 length])
      {
LABEL_10:
        id v9 = v8;
        goto LABEL_14;
      }
    }
    unint64_t v4 = [v5 scanLocation];
  }
LABEL_14:

  return v4;
}

+ (id)datePortionOfDateTimeFormatString:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "substringToIndex:", objc_msgSend(a1, "p_DateTimeSplitLocationInFormatString:", v4));

  id v6 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  unint64_t v7 = [v5 stringByTrimmingCharactersInSet:v6];

  return v7;
}

+ (id)timePortionOfDateTimeFormatString:(id)a3
{
  id v4 = a3;
  unint64_t v5 = objc_msgSend(a1, "p_DateTimeSplitLocationInFormatString:", v4);
  if (v5 >= [v4 length])
  {
    id v8 = &stru_26EBF24D8;
  }
  else
  {
    id v6 = [v4 substringFromIndex:v5];
    unint64_t v7 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    id v8 = [v6 stringByTrimmingCharactersInSet:v7];
  }
  return v8;
}

- (OITSUDateFormatter)initWithLocale:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)OITSUDateFormatter;
  unint64_t v5 = [(OITSUDateFormatter *)&v19 init];
  if (v5)
  {
    id v6 = [v4 gregorianCalendarLocale];
    UsingHarmonizedSymbols = TSUDateFormatterCFDateFormatterCreateUsingHarmonizedSymbols(0, v6, kCFDateFormatterMediumStyle, kCFDateFormatterNoStyle);

    id v8 = [v4 gregorianCalendarLocale];
    id v9 = TSUDateFormatterCFDateFormatterCreateUsingHarmonizedSymbols(0, v8, kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);

    uint64_t v10 = CFDateFormatterGetFormat(UsingHarmonizedSymbols);
    dateOnlyFormatString = v5->_dateOnlyFormatString;
    v5->_dateOnlyFormatString = (NSString *)v10;

    uint64_t v12 = CFDateFormatterGetFormat(v9);
    timeOnlyFormatString = v5->_timeOnlyFormatString;
    v5->_timeOnlyFormatString = (NSString *)v12;

    unint64_t v14 = [v4 gregorianCalendarLocale];
    v5->_fullDateFormatter = TSUDateFormatterCFDateFormatterCreateUsingHarmonizedSymbols(0, v14, kCFDateFormatterFullStyle, kCFDateFormatterFullStyle);

    fullDateFormatter = v5->_fullDateFormatter;
    CFStringRef v16 = (const __CFString *)*MEMORY[0x263EFFC10];
    uint64_t v17 = TSUGetGMTTimeZone();
    CFDateFormatterSetProperty(fullDateFormatter, v16, v17);

    CFRelease(UsingHarmonizedSymbols);
    CFRelease(v9);
  }

  return v5;
}

- (OITSUDateFormatter)init
{
  id v3 = [NSString stringWithUTF8String:"-[OITSUDateFormatter init]"];
  id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUDateFormatter.m"];
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 1060, 0, "I don't think anyone creates these objects anymore - if they do, a locale needs to be supplied");

  +[OITSUAssertionHandler logBacktraceThrottled];
  unint64_t v5 = +[OITSULocale currentLocale];
  id v6 = [(OITSUDateFormatter *)self initWithLocale:v5];

  return v6;
}

- (void)dealloc
{
  CFRelease(self->_fullDateFormatter);
  v3.receiver = self;
  v3.super_class = (Class)OITSUDateFormatter;
  [(OITSUDateFormatter *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeOnlyFormatString, 0);
  objc_storeStrong((id *)&self->_dateOnlyFormatString, 0);
}

@end