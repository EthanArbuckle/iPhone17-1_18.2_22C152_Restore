@interface PSContactFillerDataCollectionUtilities
@end

@implementation PSContactFillerDataCollectionUtilities

BOOL __98___PSContactFillerDataCollectionUtilities_recipientPredictedCorrectlyByRule_interaction_bundleId___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 type];
  v3 = [v2 identifier];
  v4 = [getBMItemTypeClass() interactionRecipients];
  v5 = [v4 identifier];
  BOOL v6 = v3 == v5;

  return v6;
}

uint64_t __108___PSContactFillerDataCollectionUtilities_initContactPropertyCache_timeOfShareInteraction_interactionStore___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "direction"));
  if ([v4 containsObject:v5])
  {
    BOOL v6 = *(void **)(a1 + 40);
    v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "mechanism"));
    uint64_t v8 = [v6 containsObject:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end