@interface PASSimpleCoalescingTimer
@end

@implementation PASSimpleCoalescingTimer

uint64_t __67___PASSimpleCoalescingTimer_initWithQueue_leewaySeconds_operation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    v6 = [NSString stringWithUTF8String:"-[_PASSimpleCoalescingTimer initWithQueue:leewaySeconds:operation:]_block_invoke_2"];
    [v5 handleFailureInFunction:v6 file:@"_PASCoalescingTimer.m" lineNumber:234 description:@"accumulatedData unexpectedly non-nil"];
  }
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

uint64_t __67___PASSimpleCoalescingTimer_initWithQueue_leewaySeconds_operation___block_invoke()
{
  return 0;
}

@end