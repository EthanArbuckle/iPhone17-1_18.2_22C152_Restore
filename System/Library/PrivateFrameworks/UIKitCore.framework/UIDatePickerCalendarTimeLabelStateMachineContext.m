@interface UIDatePickerCalendarTimeLabelStateMachineContext
@end

@implementation UIDatePickerCalendarTimeLabelStateMachineContext

uint64_t __88___UIDatePickerCalendarTimeLabelStateMachineContext_currentSateCanTransitionWithEvents___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = handleEvent(_UIDatePickerCalendarTimeLabelStateMachineSpec_0, *(void *)(a1 + 40), a2, 0, &v6);
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

@end