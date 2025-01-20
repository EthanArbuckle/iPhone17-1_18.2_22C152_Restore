@interface UIDatePickerCalendarMonthSet
@end

@implementation UIDatePickerCalendarMonthSet

void __50___UIDatePickerCalendarMonthSet__loadOffsetRange___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1[7] + 8);
  if (*(void *)(v5 + 32) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[4], @"_UIDatePickerCalendarMonthSet.m", 150, @"More than one range needed. This should never happen. Offsets needed: %@; offsets missing: %@",
      a1[5],
      a1[6]);

    uint64_t v5 = *(void *)(a1[7] + 8);
  }
  *(void *)(v5 + 32) = a2;
  *(void *)(v5 + 40) = a3;
}

@end