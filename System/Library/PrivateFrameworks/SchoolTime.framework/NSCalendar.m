@interface NSCalendar
@end

@implementation NSCalendar

void __45__NSCalendar_SchoolTime__SCL_orderedWeekdays__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithInteger:a2];
  [v2 addObject:v3];
}

void __44__NSCalendar_SchoolTime__SCL_nonWeekendDays__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithInteger:a2];
  [v2 addObject:v3];
}

@end