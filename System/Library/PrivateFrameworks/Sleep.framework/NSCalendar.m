@interface NSCalendar
@end

@implementation NSCalendar

void __48__NSCalendar_HKSPSleep__hksp_firstNonWeekendDay__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  v6 = *(void **)(a1 + 32);
  v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:a2];
  LOBYTE(v6) = [v6 containsObject:v7];

  if ((v6 & 1) == 0)
  {
    if ((unint64_t)(a2 - 1) >= 7) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = a2;
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
    *a3 = 1;
  }
}

uint64_t __78__NSCalendar_HKSPSleep___hksp_nextDateAfterDate_matchingComponents_backwards___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) nextDateAfterDate:a2 matchingComponents:*(void *)(a1 + 40) options:*(void *)(a1 + 48)];
}

void __46__NSCalendar_HKSPSleep__hksp_orderedSleepDays__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:a2];
  [v2 addObject:v3];
}

void __62__NSCalendar_HKSPSleep__hksp_orderedSleepWeekdaysForWeekdays___block_invoke(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 + 2) > 9) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = qword_1A7ED5410[a2 + 2];
  }
  id v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v2];
  [v3 addObject:v4];
}

uint64_t __78__NSCalendar_HKSPSleep___hksp_nextDateAfterDate_matchingUnit_value_backwards___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) nextDateAfterDate:a2 matchingUnit:*(void *)(a1 + 40) value:*(void *)(a1 + 48) options:*(void *)(a1 + 56)];
}

@end