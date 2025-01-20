@interface SBDisplayConnectionDonationTimer
@end

@implementation SBDisplayConnectionDonationTimer

void __57___SBDisplayConnectionDonationTimer_resetTimerOnConnect___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57___SBDisplayConnectionDonationTimer_resetTimerOnConnect___block_invoke_2;
  v5[3] = &unk_1E6B08C90;
  v5[4] = *(void *)(a1 + 32);
  uint64_t v2 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v5 block:0.5];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;
}

uint64_t __57___SBDisplayConnectionDonationTimer_resetTimerOnConnect___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) stateChanged];
  if (result)
  {
    *(void *)(*(void *)(a1 + 32) + 48) = 0;
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 56) + 16);
    return v3();
  }
  return result;
}

@end