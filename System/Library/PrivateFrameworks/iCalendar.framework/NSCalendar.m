@interface NSCalendar
@end

@implementation NSCalendar

void __52__NSCalendar_VCSUtilities__VCS_gregorianGMTCalendar__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
  uint64_t v2 = objc_msgSend(v1, "VCS_gregorianLocalCalendar:", v4);
  v3 = (void *)VCS_gregorianGMTCalendar_gregorianGMTCalendar;
  VCS_gregorianGMTCalendar_gregorianGMTCalendar = v2;
}

@end