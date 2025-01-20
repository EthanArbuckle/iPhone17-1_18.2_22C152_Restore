@interface OITSUDateParser
- (OITSUDateParser)initWithLocale:(id)a3;
- (__CFDateFormatter)specialCaseDateFormatterForLocale:(id)a3;
- (id)formatStringsDictionary;
- (id)newDateFromString:(id)a3 preferredFormatString:(id)a4 successfulFormatString:(id *)a5 tryAggressiveFormats:(BOOL)a6;
- (id)newDateFromString:(id)a3 successfulFormatString:(id *)a4;
- (id)p_initialPatternParsingFormat:(id)a3 separator:(unsigned __int16 *)a4;
- (id)p_newDateFromStringTryingFormats:(id)a3 locale:(id)a4 formats:(id)a5 outSuccessfulFormatString:(id *)a6;
- (void)dealloc;
- (void)p_addFormat:(id)a3 locale:(id)a4 formatCategoryMap:(id)a5;
@end

@implementation OITSUDateParser

- (OITSUDateParser)initWithLocale:(id)a3
{
  id v5 = a3;
  v70.receiver = self;
  v70.super_class = (Class)OITSUDateParser;
  v6 = [(OITSUDateParser *)&v70 init];
  if (v6)
  {
    if (!v5)
    {
      v7 = [NSString stringWithUTF8String:"-[OITSUDateParser initWithLocale:]"];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUDateParser.m"];
      +[OITSUAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:92 isFatal:0 description:"A locale is required here"];

      +[OITSUAssertionHandler logBacktraceThrottled];
    }
    id v63 = v5;
    p_locale = (id *)&v6->_locale;
    objc_storeStrong((id *)&v6->_locale, a3);
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    formatCategories = v6->_formatCategories;
    v6->_formatCategories = v10;

    v12 = [(OITSULocale *)v6->_locale gregorianCalendarLocale];
    v13 = [v12 objectForKey:*MEMORY[0x263EFF4D0]];

    v14 = [(OITSULocale *)v6->_locale gregorianCalendarLocale];
    v15 = [v14 objectForKey:*MEMORY[0x263EFF508]];

    if (v13)
    {
      BOOL v16 = [v13 compare:@"JP" options:1] || v15 == 0;
      if (!v16 && ![v15 compare:@"ja" options:1]) {
        v6->_isJapaneseLocale = 1;
      }
    }
    v61 = v15;
    v62 = v13;
    id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v18 = [*p_locale gregorianCalendarLocale];
    v19 = (void *)TSUCreateArrayOfDateFormatStringsForLocale(v18);

    v20 = [*p_locale gregorianCalendarLocale];
    v21 = (void *)TSUCreateArrayOfTimeFormatStringsForLocale(v20);

    v69 = v19;
    uint64_t v22 = [v19 count];
    v68 = v21;
    uint64_t v23 = [v21 count];
    if (v22)
    {
      uint64_t v24 = 0;
      do
      {
        uint64_t v66 = v24;
        v25 = objc_msgSend(v69, "objectAtIndex:");
        v26 = [v25 stringByAppendingString:@" "];
        v27 = [(OITSULocale *)v6->_locale gregorianCalendarLocale];
        v64 = v25;
        [(OITSUDateParser *)v6 p_addFormat:v25 locale:v27 formatCategoryMap:v17];

        if (v23)
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            v29 = [v68 objectAtIndex:i];
            v30 = [v26 stringByAppendingString:v29];
            v31 = [(OITSULocale *)v6->_locale gregorianCalendarLocale];
            [(OITSUDateParser *)v6 p_addFormat:v30 locale:v31 formatCategoryMap:v17];
          }
        }

        uint64_t v24 = v66 + 1;
      }
      while (v66 + 1 != v22);
    }
    if (v23)
    {
      uint64_t v32 = 0;
      do
      {
        uint64_t v67 = v32;
        v33 = objc_msgSend(v68, "objectAtIndex:");
        v34 = [v33 stringByAppendingString:@" "];
        v35 = [(OITSULocale *)v6->_locale gregorianCalendarLocale];
        v65 = v33;
        [(OITSUDateParser *)v6 p_addFormat:v33 locale:v35 formatCategoryMap:v17];

        if (v22)
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            v37 = [v69 objectAtIndex:j];
            v38 = [v34 stringByAppendingString:v37];
            v39 = [(OITSULocale *)v6->_locale gregorianCalendarLocale];
            [(OITSUDateParser *)v6 p_addFormat:v38 locale:v39 formatCategoryMap:v17];
          }
        }

        uint64_t v32 = v67 + 1;
      }
      while (v67 + 1 != v23);
    }
    CFDateFormatterStyle v40 = kCFDateFormatterNoStyle;
    id v5 = v63;
    do
    {
      for (CFDateFormatterStyle k = kCFDateFormatterNoStyle; k != (kCFDateFormatterFullStyle|kCFDateFormatterShortStyle); ++k)
      {
        if (k | v40)
        {
          v42 = CFDateFormatterCreate(0, [(OITSULocale *)v6->_locale cfGregorianCalendarLocale], v40, k);
          v43 = CFDateFormatterGetFormat(v42);
          v44 = [(OITSULocale *)v6->_locale gregorianCalendarLocale];
          [(OITSUDateParser *)v6 p_addFormat:v43 locale:v44 formatCategoryMap:v17];

          CFRelease(v42);
        }
      }
      ++v40;
    }
    while (v40 != (kCFDateFormatterFullStyle|kCFDateFormatterShortStyle));
    v45 = TSUDefaultDateTimeFormat(v6->_locale);
    v46 = [(OITSULocale *)v6->_locale gregorianCalendarLocale];
    [(OITSUDateParser *)v6 p_addFormat:v45 locale:v46 formatCategoryMap:v17];

    v47 = TSUShortestCompleteDateOnlyFormat(v6->_locale);
    v48 = [(OITSULocale *)v6->_locale gregorianCalendarLocale];
    [(OITSUDateParser *)v6 p_addFormat:v47 locale:v48 formatCategoryMap:v17];

    v49 = TSUShortestCompleteTimeOnlyFormat(v6->_locale);
    v50 = [(OITSULocale *)v6->_locale gregorianCalendarLocale];
    [(OITSUDateParser *)v6 p_addFormat:v49 locale:v50 formatCategoryMap:v17];

    v51 = TSUShortestCompleteDateTimeFormat(v6->_locale);
    v52 = [(OITSULocale *)v6->_locale gregorianCalendarLocale];
    [(OITSUDateParser *)v6 p_addFormat:v51 locale:v52 formatCategoryMap:v17];

    v53 = TSUDefaultDateOnlyShortFormat(v6->_locale);
    v54 = [(OITSULocale *)v6->_locale gregorianCalendarLocale];
    [(OITSUDateParser *)v6 p_addFormat:v53 locale:v54 formatCategoryMap:v17];

    v55 = TSUDefaultDateOnlyMediumFormat(v6->_locale);
    v56 = [(OITSULocale *)v6->_locale gregorianCalendarLocale];
    [(OITSUDateParser *)v6 p_addFormat:v55 locale:v56 formatCategoryMap:v17];

    v57 = TSUDefaultTimeOnlyShortFormat(v6->_locale);
    v58 = [(OITSULocale *)v6->_locale gregorianCalendarLocale];
    [(OITSUDateParser *)v6 p_addFormat:v57 locale:v58 formatCategoryMap:v17];

    v59 = v6;
  }

  return v6;
}

- (id)formatStringsDictionary
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_formatCategories;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "initialPattern", (void)v15);
        [v3 addObject:v11];
        v12 = [v10 formatStringsDictionary];
        [v4 addObject:v12];
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v7);
  }

  v19[0] = @"keys";
  v19[1] = @"values";
  v20[0] = v3;
  v20[1] = v4;
  v13 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v13;
}

- (void)dealloc
{
  specialCaseFormatter = self->_specialCaseFormatter;
  if (specialCaseFormatter) {
    CFRelease(specialCaseFormatter);
  }
  v4.receiver = self;
  v4.super_class = (Class)OITSUDateParser;
  [(OITSUDateParser *)&v4 dealloc];
}

- (__CFDateFormatter)specialCaseDateFormatterForLocale:(id)a3
{
  CFLocaleRef v4 = (CFLocaleRef)a3;
  specialCaseFormatter = self->_specialCaseFormatter;
  if (!specialCaseFormatter)
  {
LABEL_5:
    ADateFormatter = p_createADateFormatter(v4);
    self->_specialCaseFormatter = ADateFormatter;
    goto LABEL_6;
  }
  CFLocaleRef Locale = CFDateFormatterGetLocale(specialCaseFormatter);
  ADateFormatter = self->_specialCaseFormatter;
  if (Locale != v4)
  {
    if (ADateFormatter) {
      CFRelease(self->_specialCaseFormatter);
    }
    goto LABEL_5;
  }
LABEL_6:

  return ADateFormatter;
}

- (id)p_newDateFromStringTryingFormats:(id)a3 locale:(id)a4 formats:(id)a5 outSuccessfulFormatString:(id *)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  if (!v11)
  {
    v13 = [NSString stringWithUTF8String:"-[OITSUDateParser p_newDateFromStringTryingFormats:locale:formats:outSuccessfulFormatString:]"];
    v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUDateParser.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:204 isFatal:0 description:"A locale is now required here"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  long long v15 = [(OITSUDateParser *)self specialCaseDateFormatterForLocale:v11];
  CFIndex v16 = [(__CFString *)v10 length];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = v12;
  uint64_t v17 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    id v32 = v11;
    v33 = a6;
    uint64_t v19 = *(void *)v38;
    uint64_t v34 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(__CFString **)(*((void *)&v37 + 1) + 8 * i);
        CFDateFormatterSetFormat(v15, v21);
        rangep.location = 0;
        rangep.length = v16;
        CFDateRef v22 = CFDateFormatterCreateDateFromString(0, v15, v10, &rangep);
        if (v22)
        {
          CFDateRef v23 = v22;
          if (rangep.location || rangep.length != v16)
          {
          }
          else
          {
            CFDateRef v24 = (const __CFDate *)(id)TSUCreateDateWithGregorianUnitsSetToDefaultValue(v22, v21);

            StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, v15, v24);
            if ([(__CFString *)v10 isEqualToString:StringWithDate])
            {
              if (v33) {
                id *v33 = v21;
              }
              CFDateRef v26 = v24;
            }
            else
            {
              CFDateRef v27 = v24;
              if ([(__CFString *)v21 rangeOfString:@"yyyy"] != 0x7FFFFFFFFFFFFFFFLL)
              {
                v28 = [(__CFString *)v21 tsu_stringByReplacing4DigitYearStringWith2DigitYearString];
                CFDateFormatterSetFormat(v15, v28);
                CFDateRef v27 = CFDateFormatterCreateDateFromString(0, v15, v10, &rangep);
              }
              v29 = (void *)TSUCreateDateWithGregorianUnitsSetToDefaultValue(v27, v21);

              CFDateRef v24 = v29;
              v30 = (__CFString *)CFDateFormatterCreateStringWithDate(0, v15, v24);
              if ([(__CFString *)v10 isEqualToString:v30])
              {
                CFDateRef v26 = v24;
                if (v33)
                {
                  id *v33 = v21;
                  CFDateRef v26 = v24;
                }
              }
              else
              {

                CFDateRef v26 = 0;
              }
            }
            uint64_t v19 = v34;

            if (v26) {
              goto LABEL_27;
            }
          }
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v18);
    CFDateRef v26 = 0;
LABEL_27:
    id v11 = v32;
  }
  else
  {
    CFDateRef v26 = 0;
  }

  return v26;
}

- (id)newDateFromString:(id)a3 preferredFormatString:(id)a4 successfulFormatString:(id *)a5 tryAggressiveFormats:(BOOL)a6
{
  BOOL v6 = a6;
  v38[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  if (v10 && [v10 length])
  {
    id v12 = (__CFString *)[v10 mutableCopy];
    CFStringTransform(v12, 0, (CFStringRef)*MEMORY[0x263EFFEF0], 0);
    v13 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    v14 = [(__CFString *)v12 stringByTrimmingCharactersInSet:v13];

    long long v15 = [v14 stringByReplacingOccurrencesOfString:@"\u200F" withString:&stru_26EBF24D8];

    CFIndex v16 = [v15 stringByReplacingOccurrencesOfString:@"\u200E" withString:&stru_26EBF24D8];

    if (v11 && ([&stru_26EBF24D8 isEqualToString:v11] & 1) == 0)
    {
      v38[0] = v11;
      uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1];
      uint64_t v18 = [(OITSULocale *)self->_locale gregorianCalendarLocale];
      id v19 = [(OITSUDateParser *)self p_newDateFromStringTryingFormats:v16 locale:v18 formats:v17 outSuccessfulFormatString:a5];

      if (v19)
      {
        id v20 = v19;
LABEL_35:

        goto LABEL_36;
      }
    }
    BOOL v34 = v6;
    id v35 = v11;
    v36 = v12;
    uint64_t v17 = [(NSMutableArray *)self->_formatCategories objectEnumerator];
    char v37 = 0;
    uint64_t v21 = [v17 nextObject];
    CFDateRef v22 = (void *)v21;
    if (!v21)
    {
      id v24 = 0;
      id v23 = 0;
LABEL_23:
      if (v23)
      {
        id v23 = v23;
        id v11 = v35;
        if (a5)
        {
          id v24 = v24;
          *a5 = v24;
        }
        id v27 = v23;
      }
      else
      {
        if (v34)
        {
          v29 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"yy", 0);
          v30 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
          uint64_t v31 = [v16 rangeOfCharacterFromSet:v30];

          id v27 = 0;
          if (v31 != 0x7FFFFFFFFFFFFFFFLL)
          {
            id v32 = [(OITSULocale *)self->_locale gregorianCalendarLocale];
            id v27 = [(OITSUDateParser *)self p_newDateFromStringTryingFormats:v16 locale:v32 formats:v29 outSuccessfulFormatString:a5];
          }
          id v23 = 0;
        }
        else
        {
          id v23 = 0;
          id v27 = 0;
        }
LABEL_33:
        id v11 = v35;
      }
      id v20 = v27;

      id v12 = v36;
      goto LABEL_35;
    }
    id v23 = 0;
    id v24 = 0;
    v25 = (void *)v21;
    while (1)
    {
      CFDateRef v26 = (void *)[v25 newDateFromString:v16 forceAllowAMPM:self->_isJapaneseLocale successfulFormatString:a5 perfect:&v37];
      if (v26)
      {
        id v27 = v26;
        if (v37)
        {
          CFDateRef v22 = v25;
          goto LABEL_33;
        }
        if (v23)
        {

          if (!a5) {
            goto LABEL_19;
          }
        }
        else
        {
          if (!a5)
          {
            id v23 = v26;
            goto LABEL_19;
          }
          id v28 = *a5;

          id v24 = v28;
          id v23 = v27;
        }
        *a5 = 0;
      }
LABEL_19:
      CFDateRef v22 = [v17 nextObject];

      v25 = v22;
      if (!v22) {
        goto LABEL_23;
      }
    }
  }
  id v20 = 0;
LABEL_36:

  return v20;
}

- (id)newDateFromString:(id)a3 successfulFormatString:(id *)a4
{
  return [(OITSUDateParser *)self newDateFromString:a3 preferredFormatString:0 successfulFormatString:a4 tryAggressiveFormats:0];
}

- (void)p_addFormat:(id)a3 locale:(id)a4 formatCategoryMap:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int16 v13 = 0;
  id v11 = [(OITSUDateParser *)self p_initialPatternParsingFormat:v8 separator:&v13];
  id v12 = [v10 objectForKey:v11];
  if (!v12)
  {
    id v12 = [[OITSUDateFormatCategory alloc] initWithInitialPattern:v11 locale:v9];
    [(NSMutableArray *)self->_formatCategories addObject:v12];
    [v10 setObject:v12 forKey:v11];
  }
  [(OITSUDateFormatCategory *)v12 addSeparator:v13 format:v8 locale:v9];
}

- (id)p_initialPatternParsingFormat:(id)a3 separator:(unsigned __int16 *)a4
{
  id v5 = [a3 stringByReplacingOccurrencesOfString:@"\u200F" withString:&stru_26EBF24D8];
  BOOL v6 = [v5 stringByReplacingOccurrencesOfString:@"\u200E" withString:&stru_26EBF24D8];

  if (p_initialPatternParsingFormat_separator__onceToken != -1) {
    dispatch_once(&p_initialPatternParsingFormat_separator__onceToken, &__block_literal_global_3);
  }
  unint64_t v7 = [v6 length];
  if (!v7)
  {
    id v8 = [NSString stringWithUTF8String:"-[OITSUDateParser p_initialPatternParsingFormat:separator:]"];
    id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUDateParser.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:385 isFatal:0 description:"Zero length date format"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  uint64_t v10 = [v6 rangeOfCharacterFromSet:p_initialPatternParsingFormat_separator__formatCharacterSet];
  unint64_t v11 = v7;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL
    || ((v12 = objc_msgSend(v6, "rangeOfCharacterFromSet:options:range:", p_initialPatternParsingFormat_separator__inverseFormatCharacterSet, 0, v10, v7 - v10), v12 != 0x7FFFFFFFFFFFFFFFLL)? (unint64_t v11 = v12): (unint64_t v11 = v7), v11 >= v7))
  {
    *a4 = 0;
  }
  else
  {
    int v13 = [v6 characterAtIndex:v11];
    if (v13 == 34) {
      int v14 = 39;
    }
    else {
      int v14 = v13;
    }
    *a4 = v14;
    if (v14 == 39)
    {
      if (v11 + 1 >= v7)
      {
        long long v15 = [NSString stringWithUTF8String:"-[OITSUDateParser p_initialPatternParsingFormat:separator:]"];
        CFIndex v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUDateParser.m"];
        +[OITSUAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:413 isFatal:0 description:"No character following single quote"];

        +[OITSUAssertionHandler logBacktraceThrottled];
      }
      int v17 = [v6 characterAtIndex:v11 + 1];
      *a4 = v17;
      if (v17 == 39)
      {
        uint64_t v18 = [NSString stringWithUTF8String:"-[OITSUDateParser p_initialPatternParsingFormat:separator:]"];
        id v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUDateParser.m"];
        +[OITSUAssertionHandler handleFailureInFunction:v18 file:v19 lineNumber:415 isFatal:0 description:"Two single quotes in a row"];

        +[OITSUAssertionHandler logBacktraceThrottled];
      }
    }
  }
  id v20 = [v6 substringToIndex:v11];

  return v20;
}

void __59__OITSUDateParser_p_initialPatternParsingFormat_separator___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"GyYuUQqMLlwWdDFgEecahHKkjmsSAzZOvVXx"];
  v1 = (void *)p_initialPatternParsingFormat_separator__formatCharacterSet;
  p_initialPatternParsingFormat_separator__formatCharacterSet = v0;

  uint64_t v2 = [(id)p_initialPatternParsingFormat_separator__formatCharacterSet invertedSet];
  v3 = (void *)p_initialPatternParsingFormat_separator__inverseFormatCharacterSet;
  p_initialPatternParsingFormat_separator__inverseFormatCharacterSet = v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_formatCategories, 0);
}

@end