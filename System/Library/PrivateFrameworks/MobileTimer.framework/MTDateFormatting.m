@interface MTDateFormatting
+ (id)sharedInstance;
- (BOOL)timeDesignatorAppearsBeforeTime;
- (BOOL)use24HourTime;
- (MTDateFormatting)init;
- (NSString)amString;
- (NSString)pmString;
- (id)_dateOnlyFormatter;
- (id)_timeOnlyFormatter;
- (id)localizedTimeStringFromDate:(id)a3 forTimeZone:(id)a4 timeDesignator:(id *)a5;
- (id)localizedTimeStringFromDate:(id)a3 timeDesignator:(id *)a4;
- (id)timeDesignatorForDate:(id)a3;
- (id)timeDesignatorForDate:(id)a3 timeZone:(id)a4;
- (void)_clearLocaleDependentState;
- (void)_loadLocaleInfo;
- (void)_reloadLocaleInfo;
- (void)dealloc;
@end

@implementation MTDateFormatting

- (BOOL)timeDesignatorAppearsBeforeTime
{
  return self->_timeDesignatorAppearsBeforeTime;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)sharedInstance_sSharedFormatter;
  return v2;
}

- (id)localizedTimeStringFromDate:(id)a3 forTimeZone:(id)a4 timeDesignator:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(MTDateFormatting *)self _timeOnlyFormatter];
  v11 = v10;
  if (v9)
  {
    v12 = [v10 timeZone];
    char v13 = [v9 isEqualToTimeZone:v12];

    if ((v13 & 1) == 0)
    {
      v14 = (void *)[v11 copy];

      [v14 setTimeZone:v9];
      v11 = v14;
    }
  }
  if (a5)
  {
    *a5 = [(MTDateFormatting *)self timeDesignatorForDate:v8 timeZone:v9];
  }
  v15 = [v11 stringFromDate:v8];

  return v15;
}

- (id)timeDesignatorForDate:(id)a3 timeZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_use24HourTime)
  {
    id v8 = &stru_1EEDE16C8;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v10 = v9;
    if (v7) {
      [v9 setTimeZone:v7];
    }
    if ([v10 component:32 fromDate:v6] < 12) {
      [(MTDateFormatting *)self amString];
    }
    else {
    id v8 = [(MTDateFormatting *)self pmString];
    }
  }
  return v8;
}

- (NSString)amString
{
  amString = self->_amString;
  if (!amString)
  {
    v4 = [(MTDateFormatting *)self _dateOnlyFormatter];
    v5 = [v4 AMSymbol];
    id v6 = (NSString *)[v5 copy];
    id v7 = self->_amString;
    self->_amString = v6;

    amString = self->_amString;
  }
  return amString;
}

- (id)_timeOnlyFormatter
{
  timeOnlyFormatter = self->_timeOnlyFormatter;
  if (!timeOnlyFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    v5 = self->_timeOnlyFormatter;
    self->_timeOnlyFormatter = v4;

    [(NSDateFormatter *)self->_timeOnlyFormatter setLocalizedDateFormatFromTemplate:@"Jmm"];
    timeOnlyFormatter = self->_timeOnlyFormatter;
  }
  return timeOnlyFormatter;
}

- (id)_dateOnlyFormatter
{
  dateOnlyFormatter = self->_dateOnlyFormatter;
  if (!dateOnlyFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    v5 = self->_dateOnlyFormatter;
    self->_dateOnlyFormatter = v4;

    id v6 = self->_dateOnlyFormatter;
    id v7 = [MEMORY[0x1E4F1CA20] currentLocale];
    [(NSDateFormatter *)v6 setLocale:v7];

    [(NSDateFormatter *)self->_dateOnlyFormatter setDateStyle:1];
    [(NSDateFormatter *)self->_dateOnlyFormatter setTimeStyle:0];
    dateOnlyFormatter = self->_dateOnlyFormatter;
  }
  return dateOnlyFormatter;
}

uint64_t __34__MTDateFormatting_sharedInstance__block_invoke()
{
  sharedInstance_sSharedFormatter = objc_alloc_init(MTDateFormatting);
  return MEMORY[0x1F41817F8]();
}

- (MTDateFormatting)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTDateFormatting;
  v2 = [(MTDateFormatting *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__reloadLocaleInfo name:*MEMORY[0x1E4F1C370] object:0];

    [(MTDateFormatting *)v2 _loadLocaleInfo];
  }
  return v2;
}

- (void)_loadLocaleInfo
{
  v3 = (void *)MEMORY[0x1E4F28C10];
  v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v11 = [v3 dateFormatFromTemplate:@"j" options:0 locale:v4];

  BOOL v5 = [v11 rangeOfString:@"H"] != 0x7FFFFFFFFFFFFFFFLL
    || [v11 rangeOfString:@"k"] != 0x7FFFFFFFFFFFFFFFLL;
  self->_use24HourTime = v5;
  uint64_t v6 = [v11 rangeOfString:@"a"];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v7 = 0;
  }
  else
  {
    unint64_t v8 = v6;
    unint64_t v9 = [v11 rangeOfString:@"h" options:1];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v9 = [v11 rangeOfString:@"k" options:1];
    }
    BOOL v7 = v9 != 0x7FFFFFFFFFFFFFFFLL && v8 < v9;
  }
  self->_timeDesignatorAppearsBeforeTime = v7;
}

- (void)dealloc
{
  [(MTDateFormatting *)self _clearLocaleDependentState];
  v3.receiver = self;
  v3.super_class = (Class)MTDateFormatting;
  [(MTDateFormatting *)&v3 dealloc];
}

- (void)_clearLocaleDependentState
{
  amString = self->_amString;
  self->_amString = 0;

  pmString = self->_pmString;
  self->_pmString = 0;

  dateOnlyFormatter = self->_dateOnlyFormatter;
  self->_dateOnlyFormatter = 0;

  timeOnlyFormatter = self->_timeOnlyFormatter;
  self->_timeOnlyFormatter = 0;
}

- (void)_reloadLocaleInfo
{
  [(MTDateFormatting *)self _clearLocaleDependentState];
  [(MTDateFormatting *)self _loadLocaleInfo];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"MTDateFormattingLocaleDidChangeNotification" object:0];
}

- (NSString)pmString
{
  pmString = self->_pmString;
  if (!pmString)
  {
    v4 = [(MTDateFormatting *)self _dateOnlyFormatter];
    BOOL v5 = [v4 PMSymbol];
    uint64_t v6 = (NSString *)[v5 copy];
    BOOL v7 = self->_pmString;
    self->_pmString = v6;

    pmString = self->_pmString;
  }
  return pmString;
}

- (id)localizedTimeStringFromDate:(id)a3 timeDesignator:(id *)a4
{
  return [(MTDateFormatting *)self localizedTimeStringFromDate:a3 forTimeZone:0 timeDesignator:a4];
}

- (id)timeDesignatorForDate:(id)a3
{
  return [(MTDateFormatting *)self timeDesignatorForDate:a3 timeZone:0];
}

- (BOOL)use24HourTime
{
  return self->_use24HourTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeOnlyFormatter, 0);
  objc_storeStrong((id *)&self->_dateOnlyFormatter, 0);
  objc_storeStrong((id *)&self->_pmString, 0);
  objc_storeStrong((id *)&self->_amString, 0);
}

@end