@interface OITSUDurationLocaleSpecificStorage
+ (id)localeSpecificStorageForLocale:(id)a3;
- (NSArray)fullStopDurationUnitStrings;
- (NSArray)multiWordDurationUnitStrings;
- (NSCharacterSet)alphabeticCharacterSet;
- (NSCharacterSet)decimalDigitAndSeperatorsCharacterSet;
- (NSCharacterSet)decimalDigitCharacterSet;
- (NSCharacterSet)emptyCharacterSet;
- (NSCharacterSet)minusSignCharacterSet;
- (NSCharacterSet)separatorPunctuationCharacterSet;
- (NSCharacterSet)specialDurationFormatCharacters;
- (NSCharacterSet)whitespaceAndNewlineCharacterSet;
- (NSCharacterSet)whitespaceCharacterSet;
- (NSString)dayLongPluralString;
- (NSString)dayLongSingularString;
- (NSString)dayMediumPluralString;
- (NSString)dayMediumSingularString;
- (NSString)dayShortString;
- (NSString)hourLongPluralString;
- (NSString)hourLongSingularString;
- (NSString)hourMediumPluralString;
- (NSString)hourMediumSingularString;
- (NSString)hourShortString;
- (NSString)millisecondLongPluralString;
- (NSString)millisecondLongSingularString;
- (NSString)millisecondShortString;
- (NSString)minuteLongPluralString;
- (NSString)minuteLongSingularString;
- (NSString)minuteMediumPluralString;
- (NSString)minuteMediumSingularString;
- (NSString)minuteShortString;
- (NSString)secondLongPluralString;
- (NSString)secondLongSingularString;
- (NSString)secondMediumPluralString;
- (NSString)secondMediumSingularString;
- (NSString)secondShortString;
- (NSString)weekLongPluralString;
- (NSString)weekLongSingularString;
- (NSString)weekMediumPluralString;
- (NSString)weekMediumSingularString;
- (NSString)weekShortString;
- (OITSUDurationLocaleSpecificStorage)initWithLocale:(id)a3;
- (void)addDurationUnit:(id)a3;
- (void)dealloc;
@end

@implementation OITSUDurationLocaleSpecificStorage

- (OITSUDurationLocaleSpecificStorage)initWithLocale:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)OITSUDurationLocaleSpecificStorage;
  v4 = [(OITSUDurationLocaleSpecificStorage *)&v8 init];
  if (v4)
  {
    v4->_emptyCharacterSet = (NSCharacterSet *)(id)[MEMORY[0x263F08708] characterSetWithCharactersInString:&stru_26EBF24D8];
    v4->_minusSignCharacterSet = (NSCharacterSet *)(id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"-"];
    v4->_alphabeticCharacterSet = (NSCharacterSet *)(id)[MEMORY[0x263F08708] letterCharacterSet];
    v4->_decimalDigitCharacterSet = (NSCharacterSet *)(id)[MEMORY[0x263F08708] decimalDigitCharacterSet];
    v4->_whitespaceCharacterSet = (NSCharacterSet *)(id)[MEMORY[0x263F08708] whitespaceCharacterSet];
    v4->_whitespaceAndNewlineCharacterSet = (NSCharacterSet *)(id)[MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    v4->_specialDurationFormatCharacters = (NSCharacterSet *)(id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"wdhmsf"];
    v5 = (void *)[MEMORY[0x263F089C0] characterSetWithCharactersInString:@":."];
    objc_msgSend(v5, "addCharactersInString:", objc_msgSend(a3, "decimalSeparator"));
    v4->_separatorPunctuationCharacterSet = (NSCharacterSet *)[v5 copy];
    v6 = (void *)[MEMORY[0x263F089C0] decimalDigitCharacterSet];
    objc_msgSend(v6, "addCharactersInString:", objc_msgSend(a3, "decimalSeparator"));
    objc_msgSend(v6, "addCharactersInString:", objc_msgSend(a3, "groupingSeparator"));
    v4->_decimalDigitAndSeperatorsCharacterSet = (NSCharacterSet *)[v6 copy];
    v4->_weekLongSingularString = (NSString *)(id)[a3 localizedStringForKey:@"week" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_weekLongPluralString = (NSString *)(id)[a3 localizedStringForKey:@"weeks" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_weekMediumSingularString = (NSString *)(id)[a3 localizedStringForKey:@"wk" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_weekMediumPluralString = (NSString *)(id)[a3 localizedStringForKey:@"wks" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_weekShortString = (NSString *)(id)[a3 localizedStringForKey:@"w" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_dayLongSingularString = (NSString *)(id)[a3 localizedStringForKey:@"day" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_dayLongPluralString = (NSString *)(id)[a3 localizedStringForKey:@"days" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_dayMediumSingularString = (NSString *)(id)[a3 localizedStringForKey:@"day" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_dayMediumPluralString = (NSString *)(id)[a3 localizedStringForKey:@"days" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_dayShortString = (NSString *)(id)[a3 localizedStringForKey:@"d" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_hourLongSingularString = (NSString *)(id)[a3 localizedStringForKey:@"hour" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_hourLongPluralString = (NSString *)(id)[a3 localizedStringForKey:@"hours" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_hourMediumSingularString = (NSString *)(id)[a3 localizedStringForKey:@"hr" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_hourMediumPluralString = (NSString *)(id)[a3 localizedStringForKey:@"hrs" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_hourShortString = (NSString *)(id)[a3 localizedStringForKey:@"h" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_minuteLongSingularString = (NSString *)(id)[a3 localizedStringForKey:@"minute" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_minuteLongPluralString = (NSString *)(id)[a3 localizedStringForKey:@"minutes" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_minuteMediumSingularString = (NSString *)(id)[a3 localizedStringForKey:@"min" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_minuteMediumPluralString = (NSString *)(id)[a3 localizedStringForKey:@"mins" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_minuteShortString = (NSString *)(id)[a3 localizedStringForKey:@"m" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_secondLongSingularString = (NSString *)(id)[a3 localizedStringForKey:@"second" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_secondLongPluralString = (NSString *)(id)[a3 localizedStringForKey:@"seconds" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_secondMediumSingularString = (NSString *)(id)[a3 localizedStringForKey:@"sec" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_secondMediumPluralString = (NSString *)(id)[a3 localizedStringForKey:@"secs" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_secondShortString = (NSString *)(id)[a3 localizedStringForKey:@"s" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_millisecondLongSingularString = (NSString *)(id)[a3 localizedStringForKey:@"millisecond" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_millisecondLongPluralString = (NSString *)(id)[a3 localizedStringForKey:@"milliseconds" value:&stru_26EBF24D8 table:@"TSUtility"];
    v4->_millisecondShortString = (NSString *)(id)[a3 localizedStringForKey:@"ms" value:&stru_26EBF24D8 table:@"TSUtility"];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_weekLongSingularString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_weekLongPluralString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_weekMediumSingularString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_weekMediumPluralString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_weekShortString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_dayLongSingularString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_dayLongPluralString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_dayMediumSingularString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_dayMediumPluralString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_dayShortString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_hourLongSingularString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_hourLongPluralString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_hourMediumSingularString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_hourMediumPluralString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_hourShortString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_minuteLongSingularString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_minuteLongPluralString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_minuteMediumSingularString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_minuteMediumPluralString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_minuteShortString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_secondLongSingularString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_secondLongPluralString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_secondMediumSingularString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_secondMediumPluralString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_secondShortString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_millisecondLongSingularString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_millisecondLongPluralString];
    [(OITSUDurationLocaleSpecificStorage *)v4 addDurationUnit:v4->_millisecondShortString];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OITSUDurationLocaleSpecificStorage;
  [(OITSUDurationLocaleSpecificStorage *)&v3 dealloc];
}

- (void)addDurationUnit:(id)a3
{
  v4 = (void *)[a3 stringByTrimmingCharactersInSet:self->_whitespaceCharacterSet];
  if ([v4 rangeOfString:@" "] != 0x7FFFFFFFFFFFFFFFLL)
  {
    multiWordDurationUnitStrings = self->_multiWordDurationUnitStrings;
    if (!multiWordDurationUnitStrings)
    {
      multiWordDurationUnitStrings = (NSMutableArray *)objc_opt_new();
      self->_multiWordDurationUnitStrings = multiWordDurationUnitStrings;
    }
    [(NSMutableArray *)multiWordDurationUnitStrings addObject:v4];
  }
  if ([v4 rangeOfString:@"."] != 0x7FFFFFFFFFFFFFFFLL)
  {
    fullStopDurationUnitStrings = self->_fullStopDurationUnitStrings;
    if (!fullStopDurationUnitStrings)
    {
      fullStopDurationUnitStrings = (NSMutableArray *)objc_opt_new();
      self->_fullStopDurationUnitStrings = fullStopDurationUnitStrings;
    }
    [(NSMutableArray *)fullStopDurationUnitStrings addObject:v4];
  }
}

+ (id)localeSpecificStorageForLocale:(id)a3
{
  id v3 = a3;
  if (!a3)
  {
    uint64_t v5 = [NSString stringWithUTF8String:"+[OITSUDurationLocaleSpecificStorage localeSpecificStorageForLocale:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUDurationFormatter.m"], 347, 0, "No locale passed in, falling to back current locale.");
    +[OITSUAssertionHandler logBacktraceThrottled];
    id v3 = +[OITSULocale currentLocale];
  }
  v6 = (OITSUDurationLocaleSpecificStorage *)[v3 localeSpecificStorageForKey:@"durationFormatterLocaleStorageKey"];
  if (!v6)
  {
    objc_sync_enter(a1);
    v6 = [[OITSUDurationLocaleSpecificStorage alloc] initWithLocale:v3];
    [v3 setLocaleSpecificStorage:v6 forKey:@"durationFormatterLocaleStorageKey"];
    objc_sync_exit(a1);
  }
  return v6;
}

- (NSString)weekLongSingularString
{
  return self->_weekLongSingularString;
}

- (NSString)weekLongPluralString
{
  return self->_weekLongPluralString;
}

- (NSString)weekMediumSingularString
{
  return self->_weekMediumSingularString;
}

- (NSString)weekMediumPluralString
{
  return self->_weekMediumPluralString;
}

- (NSString)weekShortString
{
  return self->_weekShortString;
}

- (NSString)dayLongSingularString
{
  return self->_dayLongSingularString;
}

- (NSString)dayLongPluralString
{
  return self->_dayLongPluralString;
}

- (NSString)dayMediumSingularString
{
  return self->_dayMediumSingularString;
}

- (NSString)dayMediumPluralString
{
  return self->_dayMediumPluralString;
}

- (NSString)dayShortString
{
  return self->_dayShortString;
}

- (NSString)hourLongSingularString
{
  return self->_hourLongSingularString;
}

- (NSString)hourLongPluralString
{
  return self->_hourLongPluralString;
}

- (NSString)hourMediumSingularString
{
  return self->_hourMediumSingularString;
}

- (NSString)hourMediumPluralString
{
  return self->_hourMediumPluralString;
}

- (NSString)hourShortString
{
  return self->_hourShortString;
}

- (NSString)minuteLongSingularString
{
  return self->_minuteLongSingularString;
}

- (NSString)minuteLongPluralString
{
  return self->_minuteLongPluralString;
}

- (NSString)minuteMediumSingularString
{
  return self->_minuteMediumSingularString;
}

- (NSString)minuteMediumPluralString
{
  return self->_minuteMediumPluralString;
}

- (NSString)minuteShortString
{
  return self->_minuteShortString;
}

- (NSString)secondLongSingularString
{
  return self->_secondLongSingularString;
}

- (NSString)secondLongPluralString
{
  return self->_secondLongPluralString;
}

- (NSString)secondMediumSingularString
{
  return self->_secondMediumSingularString;
}

- (NSString)secondMediumPluralString
{
  return self->_secondMediumPluralString;
}

- (NSString)secondShortString
{
  return self->_secondShortString;
}

- (NSString)millisecondLongSingularString
{
  return self->_millisecondLongSingularString;
}

- (NSString)millisecondLongPluralString
{
  return self->_millisecondLongPluralString;
}

- (NSString)millisecondShortString
{
  return self->_millisecondShortString;
}

- (NSArray)multiWordDurationUnitStrings
{
  return &self->_multiWordDurationUnitStrings->super;
}

- (NSArray)fullStopDurationUnitStrings
{
  return &self->_fullStopDurationUnitStrings->super;
}

- (NSCharacterSet)alphabeticCharacterSet
{
  return self->_alphabeticCharacterSet;
}

- (NSCharacterSet)decimalDigitCharacterSet
{
  return self->_decimalDigitCharacterSet;
}

- (NSCharacterSet)decimalDigitAndSeperatorsCharacterSet
{
  return self->_decimalDigitAndSeperatorsCharacterSet;
}

- (NSCharacterSet)whitespaceCharacterSet
{
  return self->_whitespaceCharacterSet;
}

- (NSCharacterSet)emptyCharacterSet
{
  return self->_emptyCharacterSet;
}

- (NSCharacterSet)separatorPunctuationCharacterSet
{
  return self->_separatorPunctuationCharacterSet;
}

- (NSCharacterSet)minusSignCharacterSet
{
  return self->_minusSignCharacterSet;
}

- (NSCharacterSet)whitespaceAndNewlineCharacterSet
{
  return self->_whitespaceAndNewlineCharacterSet;
}

- (NSCharacterSet)specialDurationFormatCharacters
{
  return self->_specialDurationFormatCharacters;
}

@end