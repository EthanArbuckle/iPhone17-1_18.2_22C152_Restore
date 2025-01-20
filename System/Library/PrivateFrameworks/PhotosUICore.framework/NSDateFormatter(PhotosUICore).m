@interface NSDateFormatter(PhotosUICore)
+ (BOOL)px_yearBeforeMonthForLocale:()PhotosUICore;
+ (uint64_t)px_shouldAlwaysDisplayYearBeforeMonthForCurrentLocale;
@end

@implementation NSDateFormatter(PhotosUICore)

+ (BOOL)px_yearBeforeMonthForLocale:()PhotosUICore
{
  v3 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"yMMM" options:0 locale:a3];
  if ([v3 containsString:@"y"]
    && [v3 containsString:@"M"])
  {
    unint64_t v4 = [v3 localizedStandardRangeOfString:@"y"];
    BOOL v5 = v4 < [v3 localizedStandardRangeOfString:@"M"];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (uint64_t)px_shouldAlwaysDisplayYearBeforeMonthForCurrentLocale
{
  if (px_shouldAlwaysDisplayYearBeforeMonthForCurrentLocale_onceToken != -1) {
    dispatch_once(&px_shouldAlwaysDisplayYearBeforeMonthForCurrentLocale_onceToken, &__block_literal_global_135128);
  }
  if (px_shouldAlwaysDisplayYearBeforeMonthForCurrentLocale_cachedLocale) {
    return px_shouldAlwaysDisplayYearBeforeMonthForCurrentLocale_yearFirst != 0;
  }
  uint64_t v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  unint64_t v4 = (void *)px_shouldAlwaysDisplayYearBeforeMonthForCurrentLocale_cachedLocale;
  px_shouldAlwaysDisplayYearBeforeMonthForCurrentLocale_cachedLocale = v3;

  uint64_t result = objc_msgSend(a1, "px_yearBeforeMonthForLocale:", px_shouldAlwaysDisplayYearBeforeMonthForCurrentLocale_cachedLocale);
  px_shouldAlwaysDisplayYearBeforeMonthForCurrentLocale_yearFirst = result;
  return result;
}

@end