@interface NSFormatter
@end

@implementation NSFormatter

void __42__NSFormatter_SMExtensions__dateFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_13;
  _MergedGlobals_13 = v0;

  id v2 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  [(id)_MergedGlobals_13 setLocale:v2];
}

uint64_t __50__NSFormatter_SMExtensions__relativeDateFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)qword_26B349940;
  qword_26B349940 = v0;

  id v2 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  [(id)qword_26B349940 setLocale:v2];

  [(id)qword_26B349940 setUnitsStyle:0];
  [(id)qword_26B349940 setDateTimeStyle:1];
  v3 = (void *)qword_26B349940;
  return [v3 setFormattingContext:1];
}

uint64_t __46__NSFormatter_SMExtensions__dateTimeFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)qword_26B349950;
  qword_26B349950 = v0;

  id v2 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  [(id)qword_26B349950 setLocale:v2];

  [(id)qword_26B349950 setDateStyle:0];
  v3 = (void *)qword_26B349950;
  return [v3 setTimeStyle:1];
}

void __60__NSFormatter_SMExtensions__transcriptTimeIntervalFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)qword_26B349960;
  qword_26B349960 = v0;

  [(id)qword_26B349960 setUnitsStyle:3];
  [(id)qword_26B349960 setAllowedUnits:96];
  [(id)qword_26B349960 setIncludesApproximationPhrase:1];
  id v2 = [MEMORY[0x263EFF8F0] autoupdatingCurrentCalendar];
  [(id)qword_26B349960 setCalendar:v2];
}

void __60__NSFormatter_SMExtensions__hourMinuteTimeIntervalFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)qword_26B349970;
  qword_26B349970 = v0;

  [(id)qword_26B349970 setUnitsStyle:3];
  [(id)qword_26B349970 setAllowedUnits:96];
  id v2 = [MEMORY[0x263EFF8F0] autoupdatingCurrentCalendar];
  [(id)qword_26B349970 setCalendar:v2];
}

void __65__NSFormatter_SMExtensions__hourMinuteShortTimeIntervalFormatter__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)qword_26B349980;
  qword_26B349980 = v0;

  [(id)qword_26B349980 setUnitsStyle:5];
  [(id)qword_26B349980 setAllowedUnits:96];
  id v2 = [MEMORY[0x263EFF8F0] autoupdatingCurrentCalendar];
  [(id)qword_26B349980 setCalendar:v2];
}

@end