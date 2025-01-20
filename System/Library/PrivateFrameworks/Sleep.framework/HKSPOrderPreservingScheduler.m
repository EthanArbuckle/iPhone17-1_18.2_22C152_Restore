@interface HKSPOrderPreservingScheduler
@end

@implementation HKSPOrderPreservingScheduler

uint64_t __55___HKSPOrderPreservingScheduler__actuallyScheduleTask___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeTask:*(void *)(a1 + 40)];
}

void __60___HKSPOrderPreservingScheduler__scheduleNextTaskIfPossible__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 9) && !*(unsigned char *)(v1 + 8))
  {
    uint64_t v3 = [*(id *)(v1 + 16) firstObject];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
    }
  }
}

uint64_t __47___HKSPOrderPreservingScheduler__scheduleTask___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

uint64_t __47___HKSPOrderPreservingScheduler__taskDidFinish__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObjectAtIndex:0];
}

uint64_t __56___HKSPOrderPreservingScheduler_performCancelableBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __40___HKSPOrderPreservingScheduler_suspend__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 9) = 1;
  return result;
}

uint64_t __39___HKSPOrderPreservingScheduler_resume__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 9) = 0;
  return result;
}

uint64_t __55___HKSPOrderPreservingScheduler__actuallyScheduleTask___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeTask:*(void *)(a1 + 40)];
}

@end