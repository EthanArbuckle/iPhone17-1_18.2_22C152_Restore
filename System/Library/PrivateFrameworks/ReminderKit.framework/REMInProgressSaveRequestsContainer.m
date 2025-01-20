@interface REMInProgressSaveRequestsContainer
@end

@implementation REMInProgressSaveRequestsContainer

uint64_t __67___REMInProgressSaveRequestsContainer_latestSaveInProgressAccount___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _latestSaveInProgressAccountForObjectID:*(void *)(a1 + 40) saveRequest:a2];
}

uint64_t __64___REMInProgressSaveRequestsContainer_latestSaveInProgressList___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _latestSaveInProgressListForObjectID:*(void *)(a1 + 40) fallbackAccount:*(void *)(a1 + 48) fallbackParentList:*(void *)(a1 + 56) saveRequest:a2];
}

uint64_t __68___REMInProgressSaveRequestsContainer_latestSaveInProgressReminder___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _latestSaveInProgressReminderForObjectID:*(void *)(a1 + 40) fallbackAccount:*(void *)(a1 + 48) fallbackList:*(void *)(a1 + 56) fallbackParentList:*(void *)(a1 + 64) fallbackParentReminder:*(void *)(a1 + 72) saveRequest:a2];
}

uint64_t __89___REMInProgressSaveRequestsContainer_latestSaveInProgressReminderForReminderChangeItem___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _latestSaveInProgressReminderForObjectID:*(void *)(a1 + 40) fallbackAccount:0 fallbackList:0 fallbackParentList:0 fallbackParentReminder:0 saveRequest:a2];
}

@end