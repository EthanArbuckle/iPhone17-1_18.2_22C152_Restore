@interface RTProximityEvent
@end

@implementation RTProximityEvent

void __72__RTProximityEvent_RTCoreDataTransformable__createWithProximityEventMO___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F5CEA8]);
  id v14 = [*(id *)(a1 + 32) eventID];
  v3 = [*(id *)(a1 + 32) startDate];
  v4 = [*(id *)(a1 + 32) endDate];
  uint64_t v5 = [*(id *)(a1 + 32) relationship];
  [*(id *)(a1 + 32) socialScore];
  double v7 = v6;
  v8 = [*(id *)(a1 + 32) frequencyTransformable];
  v9 = [*(id *)(a1 + 32) recencyTransformable];
  v10 = [*(id *)(a1 + 32) significanceTransformable];
  uint64_t v11 = [v2 initWithEventID:v14 startDate:v3 endDate:v4 relationship:v5 socialScore:v8 combinedFrequencyScores:v9 combinedRecencyScores:v7 combinedSignificanceScores:v10];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

@end