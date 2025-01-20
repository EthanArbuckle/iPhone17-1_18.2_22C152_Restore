@interface NSDateComponentsFormatter(ScreenTimeAdditions)
+ (id)st_sharedAbbreviatedSecondsDateFormatter;
+ (id)st_sharedShortDynamicDateFormatter;
@end

@implementation NSDateComponentsFormatter(ScreenTimeAdditions)

+ (id)st_sharedAbbreviatedSecondsDateFormatter
{
  if (st_sharedAbbreviatedSecondsDateFormatter_onceToken != -1) {
    dispatch_once(&st_sharedAbbreviatedSecondsDateFormatter_onceToken, &__block_literal_global_21);
  }
  v0 = (void *)st_sharedAbbreviatedSecondsDateFormatter_usageTimeFormatter;

  return v0;
}

+ (id)st_sharedShortDynamicDateFormatter
{
  if (st_sharedShortDynamicDateFormatter_onceToken != -1) {
    dispatch_once(&st_sharedShortDynamicDateFormatter_onceToken, &__block_literal_global_14);
  }
  v0 = (void *)st_sharedShortDynamicDateFormatter_usageTimeFormatter;

  return v0;
}

@end