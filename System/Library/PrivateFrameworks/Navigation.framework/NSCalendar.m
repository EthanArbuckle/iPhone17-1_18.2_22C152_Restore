@interface NSCalendar
@end

@implementation NSCalendar

void __97__NSCalendar_MNExtras___navigation_dateStringForDate_withStyle_useRelativeFormatting_inTimeZone___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_39;
  _MergedGlobals_39 = (uint64_t)v0;

  [(id)_MergedGlobals_39 setTimeStyle:0];
  v2 = (void *)_MergedGlobals_39;
  id v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v2 setLocale:v3];
}

void __81__NSCalendar_MNExtras___navigation_relativeDateStringForDate_context_inTimeZone___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)qword_1EB59C228;
  qword_1EB59C228 = (uint64_t)v0;

  [(id)qword_1EB59C228 setTimeStyle:0];
  [(id)qword_1EB59C228 setDateStyle:1];
  v2 = (void *)qword_1EB59C228;
  id v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v2 setLocale:v3];
}

uint64_t __102__NSCalendar_MNExtras___navigation_transitRelativeDateStringForDate_context_inTimeZone_outUsedFormat___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)qword_1EB59C238;
  qword_1EB59C238 = (uint64_t)v0;

  v2 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [(id)qword_1EB59C238 setLocale:v2];

  id v3 = (void *)qword_1EB59C238;
  return [v3 setDateFormat:@"EEEE"];
}

uint64_t __102__NSCalendar_MNExtras___navigation_transitRelativeDateStringForDate_context_inTimeZone_outUsedFormat___block_invoke_2()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)qword_1EB59C248;
  qword_1EB59C248 = (uint64_t)v0;

  v2 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [(id)qword_1EB59C248 setLocale:v2];

  id v3 = (void *)qword_1EB59C248;
  return [v3 setLocalizedDateFormatFromTemplate:@"MMd"];
}

@end