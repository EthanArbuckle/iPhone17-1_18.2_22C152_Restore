@interface SMSuggestion
@end

@implementation SMSuggestion

void __64__SMSuggestion_RTCoreDataTransformable__createWithSuggestionMO___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F999B8]);
  uint64_t v3 = (int)[*(id *)(a1 + 32) suggestionTrigger];
  uint64_t v4 = (int)[*(id *)(a1 + 32) suggestionUserType];
  uint64_t v5 = (int)[*(id *)(a1 + 32) suppressionReason];
  uint64_t v6 = (int)[*(id *)(a1 + 32) sessionType];
  id v7 = objc_alloc(MEMORY[0x1E4F5CE00]);
  [*(id *)(a1 + 32) sourceLocationLatitude];
  double v9 = v8;
  [*(id *)(a1 + 32) sourceLocationLongitude];
  id v42 = (id)[v7 initWithLatitude:0 longitude:v9 horizontalUncertainty:v10 date:0.0];
  id v11 = objc_alloc(MEMORY[0x1E4F5CE00]);
  [*(id *)(a1 + 32) destinationLocationLatitude];
  double v13 = v12;
  [*(id *)(a1 + 32) destinationLocationLongitude];
  uint64_t v15 = [v11 initWithLatitude:0 longitude:v13 horizontalUncertainty:v14 date:0.0];
  id v16 = objc_alloc(MEMORY[0x1E4F99830]);
  uint64_t v17 = [*(id *)(a1 + 32) buddyEmail];
  uint64_t v18 = [*(id *)(a1 + 32) buddyPhoneNumber];
  v41 = (void *)[v16 initWithEmail:v17 phoneNumber:v18];
  v19 = [*(id *)(a1 + 32) startDate];
  uint64_t v39 = v6;
  v40 = (void *)v15;
  v37 = (void *)v18;
  v38 = (void *)v17;
  if (v19)
  {
    uint64_t v20 = [*(id *)(a1 + 32) endDate];
    if (v20)
    {
      v36 = (void *)v20;
      v21 = v2;
      v22 = [*(id *)(a1 + 32) startDate];
      v34 = [*(id *)(a1 + 32) endDate];
      v35 = v22;
      if ([v22 compare:v34] == -1)
      {
        id v30 = objc_alloc(MEMORY[0x1E4F28C18]);
        uint64_t v31 = [*(id *)(a1 + 32) startDate];
        v32 = [*(id *)(a1 + 32) endDate];
        v33 = (void *)v31;
        v24 = [v30 initWithStartDate:v31];
        int v25 = 1;
        int v23 = 1;
      }
      else
      {
        int v23 = 0;
        v24 = 0;
        int v25 = 1;
      }
    }
    else
    {
      v21 = v2;
      v36 = 0;
      int v25 = 0;
      int v23 = 0;
      v24 = 0;
    }
  }
  else
  {
    v21 = v2;
    int v25 = 0;
    int v23 = 0;
    v24 = 0;
  }
  v26 = [*(id *)(a1 + 32) creationDate];
  uint64_t v27 = [v21 initWithSuggestionTrigger:v3 suggestionUserType:v4 suppressionReason:v5 sessionType:v39 sourceLocation:v42 destinationLocation:v40 buddy:v41 dateInterval:v24 creationDate:v26];
  uint64_t v28 = *(void *)(*(void *)(a1 + 40) + 8);
  v29 = *(void **)(v28 + 40);
  *(void *)(v28 + 40) = v27;

  if (v23)
  {
  }
  if (v25)
  {
  }
  if (v19) {
}
  }

@end