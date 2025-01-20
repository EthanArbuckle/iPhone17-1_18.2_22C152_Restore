@interface NSNumberFormatter(NWMNumberFormatters)
+ (id)nwm_airQualityIndexNumberFormatter;
+ (id)nwm_ultravioletIndexNumberFormatter;
@end

@implementation NSNumberFormatter(NWMNumberFormatters)

+ (id)nwm_airQualityIndexNumberFormatter
{
  v0 = objc_opt_new();
  v1 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  [v0 setLocale:v1];

  [v0 setMaximumFractionDigits:0];
  [v0 setMinimumIntegerDigits:1];

  return v0;
}

+ (id)nwm_ultravioletIndexNumberFormatter
{
  v0 = objc_opt_new();
  v1 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  [v0 setLocale:v1];

  [v0 setMinimumIntegerDigits:1];

  return v0;
}

@end