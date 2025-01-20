@interface GEOLPRLPRConvertRule(MNExtras)
- (id)fillRulesForPlateTypes:()MNExtras atIndexes:;
- (id)mapRulesForPlateTypes:()MNExtras atIndexes:;
- (id)pickupRulesForPlateTypes:()MNExtras atIndexes:;
- (id)rules:()MNExtras forPlateTypes:atIndexes:;
- (id)validDateInterval;
- (uint64_t)hasValidDateInterval;
@end

@implementation GEOLPRLPRConvertRule(MNExtras)

- (uint64_t)hasValidDateInterval
{
  if ([a1 hasValidStartTime] && objc_msgSend(a1, "hasValidEndTime"))
  {
    unsigned int v2 = [a1 validStartTime];
    return v2 < [a1 validEndTime];
  }
  else if ([a1 hasValidStartTime])
  {
    return 1;
  }
  else
  {
    return [a1 hasValidEndTime];
  }
}

- (id)validDateInterval
{
  if ([a1 hasValidStartTime]) {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(a1, "validStartTime"));
  }
  else {
  unsigned int v2 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  if ([a1 hasValidEndTime]) {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(a1, "validEndTime"));
  }
  else {
  v3 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v2 endDate:v3];

  return v4;
}

- (id)rules:()MNExtras forPlateTypes:atIndexes:
{
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4F1CA48];
  id v11 = a3;
  v12 = objc_msgSend(v10, "arrayWithCapacity:", objc_msgSend(a1, "pickupRulesCount"));
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __64__GEOLPRLPRConvertRule_MNExtras__rules_forPlateTypes_atIndexes___block_invoke;
  v19[3] = &unk_1E60F7590;
  id v13 = v12;
  id v20 = v13;
  id v21 = v9;
  id v22 = v8;
  id v14 = v8;
  id v15 = v9;
  [v11 enumerateObjectsUsingBlock:v19];

  v16 = v22;
  id v17 = v13;

  return v17;
}

- (id)pickupRulesForPlateTypes:()MNExtras atIndexes:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 pickupRules];
  id v9 = [a1 rules:v8 forPlateTypes:v7 atIndexes:v6];

  return v9;
}

- (id)mapRulesForPlateTypes:()MNExtras atIndexes:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 mapRules];
  id v9 = [a1 rules:v8 forPlateTypes:v7 atIndexes:v6];

  return v9;
}

- (id)fillRulesForPlateTypes:()MNExtras atIndexes:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 fillRules];
  id v9 = [a1 rules:v8 forPlateTypes:v7 atIndexes:v6];

  return v9;
}

@end