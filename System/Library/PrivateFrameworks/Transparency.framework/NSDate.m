@interface NSDate
@end

@implementation NSDate

void __40__NSDate_TransparencyDate__kt_fuzzyDate__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF410]];
  v1 = (void *)kt_fuzzyDate_zulu;
  kt_fuzzyDate_zulu = v0;

  id v2 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
  [(id)kt_fuzzyDate_zulu setTimeZone:v2];
}

@end