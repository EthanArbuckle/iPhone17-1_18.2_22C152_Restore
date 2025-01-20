@interface NSURL
@end

@implementation NSURL

uint64_t __59__NSURL_MTUtilities__mtURLForClockAppSection_timerManager___block_invoke(uint64_t a1, void *a2)
{
  if (([a2 state] & 0xFFFFFFFFFFFFFFFELL) == 2) {
    v3 = @"clock-timer-running";
  }
  else {
    v3 = @"clock-timer";
  }
  v4 = *(void **)(a1 + 32);
  return [v4 finishWithResult:v3];
}

id __59__NSURL_MTUtilities__mtURLForClockAppSection_timerManager___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v3 = [*(id *)(a1 + 32) mtURLForScheme:a2];
  v4 = [v2 futureWithResult:v3];

  return v4;
}

@end