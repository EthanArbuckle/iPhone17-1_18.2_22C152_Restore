@interface NSDate
@end

@implementation NSDate

uint64_t __37__NSDate_VK__vk_localDateWithSeconds__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)vk_localDateWithSeconds_localFormatter;
  vk_localDateWithSeconds_localFormatter = (uint64_t)v0;

  [(id)vk_localDateWithSeconds_localFormatter setTimeStyle:3];
  v2 = (void *)vk_localDateWithSeconds_localFormatter;
  return [v2 setDateStyle:1];
}

uint64_t __35__NSDate_VK__vk_shortFormattedDate__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)vk_shortFormattedDate_shortRelativeformatter;
  vk_shortFormattedDate_shortRelativeformatter = (uint64_t)v0;

  [(id)vk_shortFormattedDate_shortRelativeformatter setTimeStyle:1];
  [(id)vk_shortFormattedDate_shortRelativeformatter setDateStyle:1];
  v2 = (void *)vk_shortFormattedDate_shortRelativeformatter;
  return [v2 setDoesRelativeDateFormatting:1];
}

uint64_t __35__NSDate_VK__vk_shortFormattedDate__block_invoke_2()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)vk_shortFormattedDate_shortStandardformatter;
  vk_shortFormattedDate_shortStandardformatter = (uint64_t)v0;

  [(id)vk_shortFormattedDate_shortStandardformatter setTimeStyle:1];
  v2 = (void *)vk_shortFormattedDate_shortStandardformatter;
  return [v2 setDateStyle:1];
}

uint64_t __36__NSDate_VK__vk_briefFormattedDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)vk_briefFormattedDate__briefTodayFormatter;
  vk_briefFormattedDate__briefTodayFormatter = (uint64_t)v0;

  [(id)vk_briefFormattedDate__briefTodayFormatter setTimeStyle:1];
  v2 = (void *)vk_briefFormattedDate__briefTodayFormatter;
  return [v2 setDateStyle:0];
}

void __36__NSDate_VK__vk_briefFormattedDate___block_invoke_2()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)vk_briefFormattedDate__templateFormatter;
  vk_briefFormattedDate__templateFormatter = (uint64_t)v0;

  v2 = (void *)vk_briefFormattedDate__templateFormatter;
  v3 = (void *)MEMORY[0x1E4F28C10];
  id v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  v4 = [v3 dateFormatFromTemplate:@"cccc" options:0 locale:v5];
  [v2 setDateFormat:v4];
}

uint64_t __36__NSDate_VK__vk_briefFormattedDate___block_invoke_3()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)vk_briefFormattedDate__accessibilityDateFormatter;
  vk_briefFormattedDate__accessibilityDateFormatter = (uint64_t)v0;

  [(id)vk_briefFormattedDate__accessibilityDateFormatter setDateStyle:3];
  [(id)vk_briefFormattedDate__accessibilityDateFormatter setTimeStyle:0];
  v2 = (void *)vk_briefFormattedDate__accessibilityDateFormatter;
  return [v2 setDoesRelativeDateFormatting:1];
}

uint64_t __36__NSDate_VK__vk_briefFormattedDate___block_invoke_4()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)vk_briefFormattedDate__briefRelativeFormatter;
  vk_briefFormattedDate__briefRelativeFormatter = (uint64_t)v0;

  [(id)vk_briefFormattedDate__briefRelativeFormatter setTimeStyle:0];
  [(id)vk_briefFormattedDate__briefRelativeFormatter setDateStyle:1];
  v2 = (void *)vk_briefFormattedDate__briefRelativeFormatter;
  return [v2 setDoesRelativeDateFormatting:1];
}

@end