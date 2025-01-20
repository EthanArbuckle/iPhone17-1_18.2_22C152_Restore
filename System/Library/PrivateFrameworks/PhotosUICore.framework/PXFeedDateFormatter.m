@interface PXFeedDateFormatter
+ (id)defaultFeedSectionDateFormatter;
- (BOOL)_canSubstitueDateStringsWithLocale:(id)a3;
- (BOOL)isDateInFuture:(id)a3;
- (BOOL)isDateInToday:(id)a3;
- (PXFeedDateFormatter)init;
- (PXFeedDateFormatter)initWithLocale:(id)a3 ignoreWhitelist:(BOOL)a4;
- (id)_completeRelativeStringForDate:(id)a3 dateFormatter:(id)a4;
- (id)stringFromDate:(id)a3;
- (void)_invalidate;
- (void)_prepare;
- (void)dealloc;
@end

@implementation PXFeedDateFormatter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatterForNoncurrentYears, 0);
  objc_storeStrong((id *)&self->_dateFormatterForCurrentYear, 0);
  objc_storeStrong((id *)&self->_yesterdayString, 0);
  objc_storeStrong((id *)&self->_todayString, 0);
  objc_storeStrong((id *)&self->_yesterday, 0);
  objc_storeStrong((id *)&self->_today, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

- (BOOL)_canSubstitueDateStringsWithLocale:(id)a3
{
  id v4 = a3;
  if (self->_ignoreWhitelist) {
    goto LABEL_5;
  }
  if (_canSubstitueDateStringsWithLocale__onceToken != -1) {
    dispatch_once(&_canSubstitueDateStringsWithLocale__onceToken, &__block_literal_global_18_270164);
  }
  uint64_t v5 = _canSubstitueDateStringsWithLocale__whitelistedLanguageCodes;
  v6 = [v4 languageCode];
  LOBYTE(v5) = [(id)v5 containsObject:v6];

  if (v5)
  {
LABEL_5:
    char v7 = 1;
  }
  else
  {
    v9 = (void *)_canSubstitueDateStringsWithLocale__whitelistedLocaleIdentifiers;
    v10 = [v4 localeIdentifier];
    char v7 = [v9 containsObject:v10];
  }
  return v7;
}

void __58__PXFeedDateFormatter__canSubstitueDateStringsWithLocale___block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"ar", @"de", @"el", @"en", @"es", @"he", @"hr", @"id", @"ko", @"nl", @"pl", @"pt", @"ro", @"ru", @"sk", @"sv", @"uk",
    @"vi",
    @"yue",
    @"zh",
  uint64_t v0 = 0);
  v1 = (void *)_canSubstitueDateStringsWithLocale__whitelistedLanguageCodes;
  _canSubstitueDateStringsWithLocale__whitelistedLanguageCodes = v0;

  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"ms", @"ms_BN", @"ms_MY", @"ms_SG", 0);
  v3 = (void *)_canSubstitueDateStringsWithLocale__whitelistedLocaleIdentifiers;
  _canSubstitueDateStringsWithLocale__whitelistedLocaleIdentifiers = v2;
}

- (id)_completeRelativeStringForDate:(id)a3 dateFormatter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 stringFromDate:v6];
  v9 = [v7 locale];

  id v10 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v10 setLocale:v9];
  [v10 setDateStyle:4];
  v11 = (void *)[v10 copy];
  [v11 setDoesRelativeDateFormatting:1];
  v12 = [v11 stringFromDate:v6];
  v13 = [v10 stringFromDate:v6];
  if (([v12 isEqualToString:v13] & 1) == 0)
  {
    if ([(PXFeedDateFormatter *)self _canSubstitueDateStringsWithLocale:v9])
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      [v14 setLocale:v9];
      v15 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"EEEE" options:0 locale:v9];
      [v14 setDateFormat:v15];

      v16 = [v14 stringFromDate:v6];
      uint64_t v17 = [v8 rangeOfString:v16 options:1];
      if (v17 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v19 = objc_msgSend(v8, "stringByReplacingCharactersInRange:withString:", v17, v18, v12);

        v8 = (void *)v19;
      }
      id v20 = v8;

      v8 = v14;
    }
    else
    {
      id v20 = v12;
    }

    v8 = v20;
  }
  v21 = objc_msgSend(v8, "px_stringByApplyingCapitalization:", 3);

  return v21;
}

- (void)_prepare
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v2 = obj;
  if (!obj->_prepared)
  {
    obj->_prepared = 1;
    uint64_t v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    calendar = obj->_calendar;
    obj->_calendar = (NSCalendar *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
    today = obj->_today;
    obj->_today = (NSDate *)v5;

    id v7 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v7 setDay:-1];
    uint64_t v8 = [(NSCalendar *)obj->_calendar dateByAddingComponents:v7 toDate:obj->_today options:0];
    yesterday = obj->_yesterday;
    obj->_yesterday = (NSDate *)v8;

    locale = obj->_locale;
    if (locale)
    {
      v11 = locale;
    }
    else
    {
      v11 = [MEMORY[0x1E4F1CA20] currentLocale];
    }
    v12 = v11;
    v13 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatterForCurrentYear = obj->_dateFormatterForCurrentYear;
    obj->_dateFormatterForCurrentYear = v13;

    [(NSDateFormatter *)obj->_dateFormatterForCurrentYear setLocale:v12];
    v15 = obj->_dateFormatterForCurrentYear;
    v16 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"EEEE, MMMM d", 0, v12 options locale];
    [(NSDateFormatter *)v15 setDateFormat:v16];

    uint64_t v17 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatterForNoncurrentYears = obj->_dateFormatterForNoncurrentYears;
    obj->_dateFormatterForNoncurrentYears = v17;

    [(NSDateFormatter *)obj->_dateFormatterForNoncurrentYears setLocale:v12];
    [(NSDateFormatter *)obj->_dateFormatterForNoncurrentYears setDateStyle:4];
    uint64_t v19 = [(PXFeedDateFormatter *)obj _completeRelativeStringForDate:obj->_today dateFormatter:obj->_dateFormatterForCurrentYear];
    todayString = obj->_todayString;
    obj->_todayString = (NSString *)v19;

    uint64_t v21 = [(PXFeedDateFormatter *)obj _completeRelativeStringForDate:obj->_yesterday dateFormatter:obj->_dateFormatterForCurrentYear];
    yesterdayString = obj->_yesterdayString;
    obj->_yesterdayString = (NSString *)v21;

    uint64_t v2 = obj;
  }
  objc_sync_exit(v2);
}

- (void)_invalidate
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  v2->_prepared = 0;
  objc_sync_exit(v2);

  px_dispatch_on_main_queue();
}

void __34__PXFeedDateFormatter__invalidate__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"PXFeedDateFormatterChangedNotification" object:*(void *)(a1 + 32)];
}

- (BOOL)isDateInFuture:(id)a3
{
  id v4 = a3;
  [(PXFeedDateFormatter *)self _prepare];
  NSComparisonResult v5 = [(NSCalendar *)self->_calendar compareDate:self->_today toDate:v4 toUnitGranularity:16];

  return v5 == NSOrderedAscending;
}

- (BOOL)isDateInToday:(id)a3
{
  id v4 = a3;
  [(PXFeedDateFormatter *)self _prepare];
  LOBYTE(self) = [(NSCalendar *)self->_calendar isDate:v4 inSameDayAsDate:self->_today];

  return (char)self;
}

- (id)stringFromDate:(id)a3
{
  id v4 = a3;
  [(PXFeedDateFormatter *)self _prepare];
  if ([(NSCalendar *)self->_calendar isDate:v4 inSameDayAsDate:self->_today])
  {
    todayString = self->_todayString;
LABEL_5:
    id v6 = todayString;
    goto LABEL_9;
  }
  if ([(NSCalendar *)self->_calendar isDate:v4 inSameDayAsDate:self->_yesterday])
  {
    todayString = self->_yesterdayString;
    goto LABEL_5;
  }
  BOOL v7 = [(NSCalendar *)self->_calendar isDate:v4 equalToDate:self->_today toUnitGranularity:4];
  uint64_t v8 = 80;
  if (v7) {
    uint64_t v8 = 72;
  }
  v9 = [*(id *)((char *)&self->super.isa + v8) stringFromDate:v4];
  objc_msgSend(v9, "px_stringByApplyingCapitalization:", 3);
  id v6 = (NSString *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v6;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PXFeedDateFormatter;
  [(PXFeedDateFormatter *)&v4 dealloc];
}

- (PXFeedDateFormatter)initWithLocale:(id)a3 ignoreWhitelist:(BOOL)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXFeedDateFormatter;
  uint64_t v8 = [(PXFeedDateFormatter *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_locale, a3);
    v9->_ignoreWhitelist = a4;
    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v9 selector:sel__calendarDayChanged_ name:*MEMORY[0x1E4F1C2E0] object:0];

    if (!v9->_locale)
    {
      v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v11 addObserver:v9 selector:sel__currentLocaleChanged_ name:*MEMORY[0x1E4F1C370] object:0];
    }
  }

  return v9;
}

- (PXFeedDateFormatter)init
{
  return [(PXFeedDateFormatter *)self initWithLocale:0 ignoreWhitelist:0];
}

+ (id)defaultFeedSectionDateFormatter
{
  if (defaultFeedSectionDateFormatter_onceToken != -1) {
    dispatch_once(&defaultFeedSectionDateFormatter_onceToken, &__block_literal_global_270262);
  }
  id v2 = (void *)defaultFeedSectionDateFormatter_defaultFeedSectionDateFormatter;
  return v2;
}

void __54__PXFeedDateFormatter_defaultFeedSectionDateFormatter__block_invoke()
{
  uint64_t v0 = objc_alloc_init(PXFeedDateFormatter);
  v1 = (void *)defaultFeedSectionDateFormatter_defaultFeedSectionDateFormatter;
  defaultFeedSectionDateFormatter_defaultFeedSectionDateFormatter = (uint64_t)v0;
}

@end