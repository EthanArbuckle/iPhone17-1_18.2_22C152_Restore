@interface NSDate
@end

@implementation NSDate

void __56__NSDate_MTAdditions__mt_dateFormatterNoYearAbbrevMonth__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28C10];
  v1 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  id v6 = [v0 dateFormatFromTemplate:@"MMM d" options:0 locale:v1];

  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v3 = (void *)mt_dateFormatterNoYearAbbrevMonth__s__dateFormatterNoYearAbbrevMonth;
  mt_dateFormatterNoYearAbbrevMonth__s__dateFormatterNoYearAbbrevMonth = (uint64_t)v2;

  [(id)mt_dateFormatterNoYearAbbrevMonth__s__dateFormatterNoYearAbbrevMonth setDateFormat:v6];
  v4 = (void *)mt_dateFormatterNoYearAbbrevMonth__s__dateFormatterNoYearAbbrevMonth;
  v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v4 setLocale:v5];
}

void __53__NSDate_MTAdditions__dayOfWeekFromDate_abbreviated___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)dayOfWeekFromDate_abbreviated__formatterAbbrev;
  dayOfWeekFromDate_abbreviated__formatterAbbrev = (uint64_t)v0;

  id v2 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [(id)dayOfWeekFromDate_abbreviated__formatterAbbrev setLocale:v2];

  v3 = (void *)MEMORY[0x1E4F28C10];
  id v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  v4 = [v3 dateFormatFromTemplate:@"EEE" options:0 locale:v5];
  [(id)dayOfWeekFromDate_abbreviated__formatterAbbrev setDateFormat:v4];
}

void __53__NSDate_MTAdditions__dayOfWeekFromDate_abbreviated___block_invoke_2()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)dayOfWeekFromDate_abbreviated__formatterVerbose;
  dayOfWeekFromDate_abbreviated__formatterVerbose = (uint64_t)v0;

  id v2 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [(id)dayOfWeekFromDate_abbreviated__formatterVerbose setLocale:v2];

  v3 = (void *)MEMORY[0x1E4F28C10];
  id v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  v4 = [v3 dateFormatFromTemplate:@"EEEE" options:0 locale:v5];
  [(id)dayOfWeekFromDate_abbreviated__formatterVerbose setDateFormat:v4];
}

uint64_t __33__NSDate_MTAdditions__timeString__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)timeString_fmt;
  timeString_fmt = (uint64_t)v0;

  [(id)timeString_fmt setDateStyle:0];
  id v2 = (void *)timeString_fmt;
  return [v2 setTimeStyle:1];
}

void __50__NSDate_MTAdditions__mt_dateFormatterRelativeDay__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)mt_dateFormatterRelativeDay__s__dateFormatterRelativeDay;
  mt_dateFormatterRelativeDay__s__dateFormatterRelativeDay = (uint64_t)v0;

  [(id)mt_dateFormatterRelativeDay__s__dateFormatterRelativeDay setDoesRelativeDateFormatting:1];
  [(id)mt_dateFormatterRelativeDay__s__dateFormatterRelativeDay setDateStyle:2];
  [(id)mt_dateFormatterRelativeDay__s__dateFormatterRelativeDay setFormattingContext:4];
  id v2 = (void *)mt_dateFormatterRelativeDay__s__dateFormatterRelativeDay;
  id v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v2 setLocale:v3];
}

void __47__NSDate_MTAdditions__mt_dateFormatterWithYear__block_invoke()
{
  id v0 = (void *)MEMORY[0x1E4F28C10];
  v1 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  id v6 = [v0 dateFormatFromTemplate:@"MMM d, yyyy", 0, v1 options locale];

  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v3 = (void *)mt_dateFormatterWithYear__s__dateFormatterWithYear;
  mt_dateFormatterWithYear__s__dateFormatterWithYear = (uint64_t)v2;

  [(id)mt_dateFormatterWithYear__s__dateFormatterWithYear setDateFormat:v6];
  v4 = (void *)mt_dateFormatterWithYear__s__dateFormatterWithYear;
  id v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v4 setLocale:v5];
}

void __47__NSDate_MTAdditions__mt_dateFormatterJustYear__block_invoke()
{
  id v0 = (void *)MEMORY[0x1E4F28C10];
  v1 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  id v6 = [v0 dateFormatFromTemplate:@"yyyy" options:0 locale:v1];

  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v3 = (void *)mt_dateFormatterJustYear_justYearFormatter;
  mt_dateFormatterJustYear_justYearFormatter = (uint64_t)v2;

  [(id)mt_dateFormatterJustYear_justYearFormatter setDateFormat:v6];
  v4 = (void *)mt_dateFormatterJustYear_justYearFormatter;
  id v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v4 setLocale:v5];
}

void __52__NSDate_MTAdditions__mt_dateFormatterNoDayWithYear__block_invoke()
{
  id v0 = (void *)MEMORY[0x1E4F28C10];
  v1 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  id v6 = [v0 dateFormatFromTemplate:@"MMM yyyy" options:0 locale:v1];

  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v3 = (void *)mt_dateFormatterNoDayWithYear__s__dateFormatterNoDayWithYear;
  mt_dateFormatterNoDayWithYear__s__dateFormatterNoDayWithYear = (uint64_t)v2;

  [(id)mt_dateFormatterNoDayWithYear__s__dateFormatterNoDayWithYear setDateFormat:v6];
  v4 = (void *)mt_dateFormatterNoDayWithYear__s__dateFormatterNoDayWithYear;
  id v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v4 setLocale:v5];
}

void __57__NSDate_MTAdditions__mt_dateFormatterShortStyleWithYear__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)mt_dateFormatterShortStyleWithYear_dateFormatter;
  mt_dateFormatterShortStyleWithYear_dateFormatter = (uint64_t)v0;

  [(id)mt_dateFormatterShortStyleWithYear_dateFormatter setDateStyle:1];
  [(id)mt_dateFormatterShortStyleWithYear_dateFormatter setTimeStyle:0];
  id v2 = (void *)mt_dateFormatterShortStyleWithYear_dateFormatter;
  id v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v2 setLocale:v3];
}

void __45__NSDate_MTAdditions__mt_dateFormatterNoYear__block_invoke()
{
  id v0 = (void *)MEMORY[0x1E4F28C10];
  v1 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  id v6 = [v0 dateFormatFromTemplate:@"MMMM d" options:0 locale:v1];

  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v3 = (void *)mt_dateFormatterNoYear__s__dateFormatterNoYear;
  mt_dateFormatterNoYear__s__dateFormatterNoYear = (uint64_t)v2;

  [(id)mt_dateFormatterNoYear__s__dateFormatterNoYear setDateFormat:v6];
  v4 = (void *)mt_dateFormatterNoYear__s__dateFormatterNoYear;
  id v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v4 setLocale:v5];
}

void __46__NSDate_MTAdditions__mt_verboseDateFormatter__block_invoke()
{
  id v0 = (void *)MEMORY[0x1E4F28C10];
  v1 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  id v6 = [v0 dateFormatFromTemplate:@"MMMM d, yyyy", 0, v1 options locale];

  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v3 = (void *)mt_verboseDateFormatter__s__dateFormatterWithYear;
  mt_verboseDateFormatter__s__dateFormatterWithYear = (uint64_t)v2;

  [(id)mt_verboseDateFormatter__s__dateFormatterWithYear setDateFormat:v6];
  v4 = (void *)mt_verboseDateFormatter__s__dateFormatterWithYear;
  id v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v4 setLocale:v5];
}

void __50__NSDate_MTAdditions__mt_lessVerboseDateFormatter__block_invoke()
{
  id v0 = (void *)MEMORY[0x1E4F28C10];
  v1 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  id v6 = [v0 dateFormatFromTemplate:@"MMM d, yyyy", 0, v1 options locale];

  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v3 = (void *)mt_lessVerboseDateFormatter__s__dateFormatterWithYear;
  mt_lessVerboseDateFormatter__s__dateFormatterWithYear = (uint64_t)v2;

  [(id)mt_lessVerboseDateFormatter__s__dateFormatterWithYear setDateFormat:v6];
  v4 = (void *)mt_lessVerboseDateFormatter__s__dateFormatterWithYear;
  id v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v4 setLocale:v5];
}

@end