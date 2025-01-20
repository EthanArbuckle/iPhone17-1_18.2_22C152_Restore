@interface TPSContextualBiomeAppInFocusEvent
+ (id)observationDateFromEvent:(id)a3;
- (id)_filteringPredicate;
- (id)filterHandler;
- (id)filterParametersForBiomeQuery;
- (id)publisherFromStartTime:(double)a3;
@end

@implementation TPSContextualBiomeAppInFocusEvent

+ (id)observationDateFromEvent:(id)a3
{
  v3 = [a3 eventBody];
  v4 = [v3 absoluteTimestamp];

  return v4;
}

- (id)publisherFromStartTime:(double)a3
{
  v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
  id v4 = objc_alloc(MEMORY[0x1E4F503E8]);
  v5 = [MEMORY[0x1E4F1C9C8] date];
  v6 = (void *)[v4 initWithStartDate:v3 endDate:v5 maxEvents:0 lastN:0 reversed:0];

  v7 = BiomeLibrary();
  v8 = [v7 App];
  v9 = [v8 InFocus];
  v10 = [v9 publisherWithOptions:v6];

  return v10;
}

- (id)filterHandler
{
  v2 = [(TPSContextualBiomeAppInFocusEvent *)self _filteringPredicate];
  v3 = v2;
  if (v2)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__TPSContextualBiomeAppInFocusEvent_filterHandler__block_invoke;
    aBlock[3] = &unk_1E5906CF8;
    id v7 = v2;
    id v4 = _Block_copy(aBlock);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t __50__TPSContextualBiomeAppInFocusEvent_filterHandler__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = [*(id *)(a1 + 32) evaluateWithObject:v3];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)filterParametersForBiomeQuery
{
  v3 = [(TPSContextualBiomeEvent *)self filterInfo];

  if (v3)
  {
    v20.receiver = self;
    v20.super_class = (Class)TPSContextualBiomeAppInFocusEvent;
    uint64_t v4 = [(TPSContextualBiomeEvent *)&v20 filterParametersForBiomeQuery];
    v5 = (void *)[v4 mutableCopy];
    v6 = v5;
    if (v5) {
      id v7 = v5;
    }
    else {
      id v7 = (id)objc_opt_new();
    }
    v9 = v7;

    v10 = [(TPSContextualBiomeEvent *)self filterInfo];
    v11 = [v10 TPSSafeObjectForKey:@"launchReason"];

    if (v11)
    {
      v12 = [(TPSContextualBiomeEvent *)self filterInfo];
      v13 = [v12 TPSSafeStringForKey:@"launchReason"];
      [v9 setObject:v13 forKeyedSubscript:@"launchReason"];
    }
    v14 = [(TPSContextualBiomeEvent *)self filterInfo];
    uint64_t v15 = [v14 TPSSafeUIntegerForKey:@"launchType"];

    if (v15)
    {
      v16 = NSNumber;
      v17 = [(TPSContextualBiomeEvent *)self filterInfo];
      v18 = objc_msgSend(v16, "numberWithInt:", objc_msgSend(v17, "TPSSafeIntForKey:", @"launchType"));
      [v9 setObject:v18 forKeyedSubscript:@"launchType"];
    }
    v8 = (void *)[v9 copy];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_filteringPredicate
{
  v3 = [(TPSContextualBiomeEvent *)self filterInfo];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5 = [(TPSContextualBiomeEvent *)self filterInfo];
    v6 = [v5 TPSSafeObjectForKey:@"isStarting"];

    if (v6)
    {
      id v7 = [(TPSContextualBiomeEvent *)self filterInfo];
      char v8 = [v7 TPSSafeBoolForKey:@"isStarting"];

      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __56__TPSContextualBiomeAppInFocusEvent__filteringPredicate__block_invoke;
      v37[3] = &__block_descriptor_33_e39_B24__0__BMAppInFocus_8__NSDictionary_16l;
      char v38 = v8;
      v9 = [MEMORY[0x1E4F28F60] predicateWithBlock:v37];
      [v4 addObject:v9];
    }
    v10 = [(TPSContextualBiomeEvent *)self filterInfo];
    v11 = [v10 TPSSafeObjectForKey:@"bundleID"];

    if (v11)
    {
      v12 = [(TPSContextualBiomeEvent *)self filterInfo];
      v13 = [v12 TPSSafeStringForKey:@"bundleID"];

      v14 = (void *)MEMORY[0x1E4F28F60];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __56__TPSContextualBiomeAppInFocusEvent__filteringPredicate__block_invoke_2;
      v35[3] = &unk_1E5906F30;
      id v36 = v13;
      id v15 = v13;
      v16 = [v14 predicateWithBlock:v35];
      [v4 addObject:v16];
    }
    v17 = [(TPSContextualBiomeEvent *)self filterInfo];
    v18 = [v17 TPSSafeObjectForKey:@"launchReason"];

    if (v18)
    {
      v19 = [(TPSContextualBiomeEvent *)self filterInfo];
      objc_super v20 = [v19 TPSSafeStringForKey:@"launchReason"];

      v21 = (void *)MEMORY[0x1E4F28F60];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __56__TPSContextualBiomeAppInFocusEvent__filteringPredicate__block_invoke_3;
      v33[3] = &unk_1E5906F30;
      id v34 = v20;
      id v22 = v20;
      v23 = [v21 predicateWithBlock:v33];
      [v4 addObject:v23];
    }
    v24 = [(TPSContextualBiomeEvent *)self filterInfo];
    v25 = [v24 TPSSafeObjectForKey:@"launchType"];

    if (v25)
    {
      v26 = [(TPSContextualBiomeEvent *)self filterInfo];
      int v27 = [v26 TPSSafeIntForKey:@"launchType"];

      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __56__TPSContextualBiomeAppInFocusEvent__filteringPredicate__block_invoke_4;
      v31[3] = &__block_descriptor_36_e39_B24__0__BMAppInFocus_8__NSDictionary_16l;
      int v32 = v27;
      v28 = [MEMORY[0x1E4F28F60] predicateWithBlock:v31];
      [v4 addObject:v28];
    }
    if ([v4 count])
    {
      v29 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v4];
    }
    else
    {
      v29 = 0;
    }
  }
  else
  {
    v29 = 0;
  }
  return v29;
}

BOOL __56__TPSContextualBiomeAppInFocusEvent__filteringPredicate__block_invoke(uint64_t a1, void *a2)
{
  return *(unsigned __int8 *)(a1 + 32) == [a2 starting];
}

uint64_t __56__TPSContextualBiomeAppInFocusEvent__filteringPredicate__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 bundleID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __56__TPSContextualBiomeAppInFocusEvent__filteringPredicate__block_invoke_3(uint64_t a1, void *a2)
{
  v3 = [a2 launchReason];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

BOOL __56__TPSContextualBiomeAppInFocusEvent__filteringPredicate__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 type] == *(_DWORD *)(a1 + 32);
}

@end