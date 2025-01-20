@interface NSDate
@end

@implementation NSDate

uint64_t __37__NSDate_IC__ic_localDateWithSeconds__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)ic_localDateWithSeconds_localFormatter;
  ic_localDateWithSeconds_localFormatter = (uint64_t)v0;

  [(id)ic_localDateWithSeconds_localFormatter setTimeStyle:3];
  v2 = (void *)ic_localDateWithSeconds_localFormatter;
  return [v2 setDateStyle:1];
}

uint64_t __28__NSDate_IC__ic_iso8601Date__block_invoke()
{
  ic_iso8601Date_dateFormatter = (uint64_t)objc_alloc_init(MEMORY[0x263F088C0]);
  return MEMORY[0x270F9A758]();
}

uint64_t __52__NSDate_IC__ic_shortFormattedDateForAccessibility___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)ic_shortFormattedDateForAccessibility__shortRelativeformatter;
  ic_shortFormattedDateForAccessibility__shortRelativeformatter = (uint64_t)v0;

  [(id)ic_shortFormattedDateForAccessibility__shortRelativeformatter setTimeStyle:1];
  [(id)ic_shortFormattedDateForAccessibility__shortRelativeformatter setDateStyle:1];
  v2 = (void *)ic_shortFormattedDateForAccessibility__shortRelativeformatter;
  return [v2 setDoesRelativeDateFormatting:1];
}

uint64_t __52__NSDate_IC__ic_shortFormattedDateForAccessibility___block_invoke_2()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)ic_shortFormattedDateForAccessibility__shortAccessibilityStandardformatter;
  ic_shortFormattedDateForAccessibility__shortAccessibilityStandardformatter = (uint64_t)v0;

  [(id)ic_shortFormattedDateForAccessibility__shortAccessibilityStandardformatter setTimeStyle:1];
  v2 = (void *)ic_shortFormattedDateForAccessibility__shortAccessibilityStandardformatter;
  return [v2 setDateStyle:3];
}

uint64_t __52__NSDate_IC__ic_shortFormattedDateForAccessibility___block_invoke_3()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)ic_shortFormattedDateForAccessibility__shortStandardformatter;
  ic_shortFormattedDateForAccessibility__shortStandardformatter = (uint64_t)v0;

  [(id)ic_shortFormattedDateForAccessibility__shortStandardformatter setTimeStyle:1];
  v2 = (void *)ic_shortFormattedDateForAccessibility__shortStandardformatter;
  return [v2 setDateStyle:1];
}

uint64_t __43__NSDate_IC__ic_briefFormattedDate_locale___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  v3 = (void *)ic_briefFormattedDate_locale__briefTodayFormatter;
  ic_briefFormattedDate_locale__briefTodayFormatter = (uint64_t)v2;

  [(id)ic_briefFormattedDate_locale__briefTodayFormatter setTimeStyle:1];
  [(id)ic_briefFormattedDate_locale__briefTodayFormatter setDateStyle:0];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = (void *)ic_briefFormattedDate_locale__briefTodayFormatter;
  return [v5 setLocale:v4];
}

void __43__NSDate_IC__ic_briefFormattedDate_locale___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  v3 = (void *)ic_briefFormattedDate_locale__templateFormatter;
  ic_briefFormattedDate_locale__templateFormatter = (uint64_t)v2;

  [(id)ic_briefFormattedDate_locale__templateFormatter setLocale:*(void *)(a1 + 32)];
  uint64_t v4 = (void *)ic_briefFormattedDate_locale__templateFormatter;
  id v5 = [MEMORY[0x263F08790] dateFormatFromTemplate:@"cccc" options:0 locale:*(void *)(a1 + 32)];
  [v4 setDateFormat:v5];
}

uint64_t __43__NSDate_IC__ic_briefFormattedDate_locale___block_invoke_3(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  v3 = (void *)ic_briefFormattedDate_locale__accessibilityDateFormatter;
  ic_briefFormattedDate_locale__accessibilityDateFormatter = (uint64_t)v2;

  [(id)ic_briefFormattedDate_locale__accessibilityDateFormatter setDateStyle:3];
  [(id)ic_briefFormattedDate_locale__accessibilityDateFormatter setTimeStyle:0];
  [(id)ic_briefFormattedDate_locale__accessibilityDateFormatter setDoesRelativeDateFormatting:1];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (void *)ic_briefFormattedDate_locale__accessibilityDateFormatter;
  return [v5 setLocale:v4];
}

uint64_t __43__NSDate_IC__ic_briefFormattedDate_locale___block_invoke_4(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  v3 = (void *)ic_briefFormattedDate_locale__briefRelativeFormatter;
  ic_briefFormattedDate_locale__briefRelativeFormatter = (uint64_t)v2;

  [(id)ic_briefFormattedDate_locale__briefRelativeFormatter setTimeStyle:0];
  [(id)ic_briefFormattedDate_locale__briefRelativeFormatter setDateStyle:1];
  [(id)ic_briefFormattedDate_locale__briefRelativeFormatter setDoesRelativeDateFormatting:1];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (void *)ic_briefFormattedDate_locale__briefRelativeFormatter;
  return [v5 setLocale:v4];
}

@end