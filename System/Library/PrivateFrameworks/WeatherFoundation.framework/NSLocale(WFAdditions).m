@interface NSLocale(WFAdditions)
- (uint64_t)wf_temperatureUnit;
- (void)setWf_temperatureUnit:()WFAdditions;
@end

@implementation NSLocale(WFAdditions)

- (uint64_t)wf_temperatureUnit
{
  v1 = [a1 objectForKey:*MEMORY[0x263EFF548]];
  uint64_t v2 = NSLocaleTemperatureUnitToWFTemperatureUnit(v1);

  return v2;
}

- (void)setWf_temperatureUnit:()WFAdditions
{
  NSLocaleTemperatureUnitFromWFTemperatureUnit(a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x263EFF960] _setPreferredTemperatureUnit:v3];
}

@end