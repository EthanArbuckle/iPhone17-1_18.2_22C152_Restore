@interface NSDateFormatter
@end

@implementation NSDateFormatter

uint64_t __143__NSDateFormatter_MNExtras___navigation_localizedTimestampStringForDepartureArrivalDate_inTimeZone_canIncludeDate_showTimeZone_useShortFormat___block_invoke()
{
  _MergedGlobals_20 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1C998]);
  return MEMORY[0x1F41817F8]();
}

void __65__NSDateFormatter_MNExtras___navigation_debugDescriptionForDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)qword_1EB59C020;
  qword_1EB59C020 = (uint64_t)v0;

  [(id)qword_1EB59C020 setFormatterBehavior:1040];
  [(id)qword_1EB59C020 setDateStyle:1];
  [(id)qword_1EB59C020 setTimeStyle:3];
  v2 = (void *)qword_1EB59C020;
  id v3 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  [v2 setTimeZone:v3];
}

@end