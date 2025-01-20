@interface WFWeatherConditions(NWCDate)
- (uint64_t)nwc_date;
- (uint64_t)nwc_expirationDate;
@end

@implementation WFWeatherConditions(NWCDate)

- (uint64_t)nwc_date
{
  return [a1 objectForKeyedSubscript:*MEMORY[0x263F85FD0]];
}

- (uint64_t)nwc_expirationDate
{
  return [a1 objectForKeyedSubscript:*MEMORY[0x263F85FD8]];
}

@end