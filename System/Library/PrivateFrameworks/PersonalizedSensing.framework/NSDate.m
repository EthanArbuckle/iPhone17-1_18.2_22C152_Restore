@interface NSDate
@end

@implementation NSDate

uint64_t __37__NSDate_MOExtensions__dateFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)dateFormatter_dateFormatter;
  dateFormatter_dateFormatter = v0;

  v2 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  [(id)dateFormatter_dateFormatter setLocale:v2];

  [(id)dateFormatter_dateFormatter setDateStyle:1];
  v3 = (void *)dateFormatter_dateFormatter;
  return [v3 setTimeStyle:3];
}

void __49__NSDate_MOExtensions__dayNameFormatterInEnglish__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)dayNameFormatterInEnglish_dateFormatter;
  dayNameFormatterInEnglish_dateFormatter = v0;

  [(id)dayNameFormatterInEnglish_dateFormatter setDateFormat:@"EEEE"];
  id v2 = (id)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US"];
  [(id)dayNameFormatterInEnglish_dateFormatter setLocale:v2];
}

uint64_t __51__NSDate_MOExtensions__relativeBundleDateFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)relativeBundleDateFormatter_dateFormatter;
  relativeBundleDateFormatter_dateFormatter = v0;

  id v2 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  [(id)relativeBundleDateFormatter_dateFormatter setLocale:v2];

  [(id)relativeBundleDateFormatter_dateFormatter setTimeStyle:0];
  [(id)relativeBundleDateFormatter_dateFormatter setDateStyle:4];
  [(id)relativeBundleDateFormatter_dateFormatter setDoesRelativeDateFormatting:1];
  v3 = (void *)relativeBundleDateFormatter_dateFormatter;
  return [v3 setFormattingContext:5];
}

void __41__NSDate_MOExtensions__monthDayFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)monthDayFormatter_dateFormatter;
  monthDayFormatter_dateFormatter = v0;

  id v2 = (void *)MEMORY[0x263F08790];
  v3 = [MEMORY[0x263EFF960] currentLocale];
  id v4 = [v2 dateFormatFromTemplate:@"MM/dd" options:0 locale:v3];

  [(id)monthDayFormatter_dateFormatter setDateFormat:v4];
}

@end