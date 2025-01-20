@interface NSCalendar(WFWeatherChannelParser)
- (id)wf_dateComponentsForEpochDateNumber:()WFWeatherChannelParser toUnitGranularity:;
@end

@implementation NSCalendar(WFWeatherChannelParser)

- (id)wf_dateComponentsForEpochDateNumber:()WFWeatherChannelParser toUnitGranularity:
{
  uint64_t v5 = 3146270;
  uint64_t v6 = 3146334;
  if (a4 != 64) {
    uint64_t v6 = 3146462;
  }
  if (a4 != 32) {
    uint64_t v5 = v6;
  }
  uint64_t v7 = v5 | 0x20;
  v8 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(a3, "unsignedIntegerValue"));
  v9 = [a1 components:v7 fromDate:v8];

  return v9;
}

@end