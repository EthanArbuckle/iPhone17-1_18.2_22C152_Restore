@interface NSDateComponentsFormatter
@end

@implementation NSDateComponentsFormatter

uint64_t __90__NSDateComponentsFormatter_ScreenTimeAdditions__st_sharedAbbreviatedSecondsDateFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)st_sharedAbbreviatedSecondsDateFormatter_usageTimeFormatter;
  st_sharedAbbreviatedSecondsDateFormatter_usageTimeFormatter = v0;

  [(id)st_sharedAbbreviatedSecondsDateFormatter_usageTimeFormatter setAllowedUnits:128];
  v2 = (void *)st_sharedAbbreviatedSecondsDateFormatter_usageTimeFormatter;

  return [v2 setUnitsStyle:1];
}

uint64_t __84__NSDateComponentsFormatter_ScreenTimeAdditions__st_sharedShortDynamicDateFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)st_sharedShortDynamicDateFormatter_usageTimeFormatter;
  st_sharedShortDynamicDateFormatter_usageTimeFormatter = v0;

  [(id)st_sharedShortDynamicDateFormatter_usageTimeFormatter setFormattingContext:1];
  v2 = (void *)st_sharedShortDynamicDateFormatter_usageTimeFormatter;

  return [v2 setUnitsStyle:2];
}

@end