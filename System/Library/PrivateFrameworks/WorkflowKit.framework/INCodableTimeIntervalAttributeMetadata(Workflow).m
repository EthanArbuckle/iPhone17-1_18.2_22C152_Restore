@interface INCodableTimeIntervalAttributeMetadata(Workflow)
- (WFQuantityParameterState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:;
- (__CFString)unitNameForUnit:()Workflow;
- (id)unitNamesWithMinimumUnit:()Workflow maximumUnit:;
- (id)wf_updatedParameterDefinition:()Workflow forCodableAttribute:localizer:;
- (uint64_t)wf_objectClass;
- (uint64_t)wf_parameterClass;
- (uint64_t)wf_processParameterValue:()Workflow forParameter:parameterState:codableAttribute:completionHandler:;
@end

@implementation INCodableTimeIntervalAttributeMetadata(Workflow)

- (id)unitNamesWithMinimumUnit:()Workflow maximumUnit:
{
  v7 = objc_opt_new();
  if (a3 <= a4)
  {
    uint64_t v8 = a4 + 1;
    do
    {
      v9 = [a1 unitNameForUnit:a3];
      [v7 addObject:v9];

      ++a3;
    }
    while (v8 != a3);
  }
  return v7;
}

- (__CFString)unitNameForUnit:()Workflow
{
  if (a3 > 2) {
    return @"days";
  }
  else {
    return off_1E6552A48[a3];
  }
}

- (WFQuantityParameterState)wf_parameterStateForIntentValue:()Workflow parameterDefinition:
{
  [a3 doubleValue];
  double v5 = v4;
  uint64_t v6 = [a1 defaultUnit];
  uint64_t v7 = v6;
  switch(v6)
  {
    case 1:
      double v8 = 60.0;
      break;
    case 2:
      double v8 = 3600.0;
      break;
    case 3:
      double v8 = 86400.0;
      break;
    default:
      goto LABEL_8;
  }
  double v5 = v5 / v8;
LABEL_8:
  v9 = [WFNumberStringSubstitutableState alloc];
  v10 = [NSNumber numberWithDouble:v5];
  v11 = [v10 stringValue];
  v12 = [(WFNumberStringSubstitutableState *)v9 initWithValue:v11];

  v13 = [WFQuantityParameterState alloc];
  v14 = [a1 unitNameForUnit:v7];
  v15 = [(WFQuantityParameterState *)v13 initWithMagnitudeState:v12 unitString:v14];

  return v15;
}

- (uint64_t)wf_processParameterValue:()Workflow forParameter:parameterState:codableAttribute:completionHandler:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = a7;
  uint64_t v10 = objc_opt_class();
  id v11 = v8;
  if (v11)
  {
    if (objc_opt_isKindOfClass())
    {
      v12 = [v11 unitString];
      unint64_t v13 = +[WFDurationQuantityFieldParameter calendarUnitFromUnitString:v12];

      v14 = [v11 magnitude];
      [v14 doubleValue];
      double v16 = v15;

      switch(v13)
      {
        case 0x40uLL:
          double v17 = 60.0;
          break;
        case 0x20uLL:
          double v17 = 3600.0;
          break;
        case 0x10uLL:
          double v17 = 86400.0;
          break;
        default:
LABEL_14:
          v21 = [NSNumber numberWithDouble:v16];
          v20 = v11;
          goto LABEL_15;
      }
      double v16 = v16 * v17;
      goto LABEL_14;
    }
    v18 = getWFGeneralLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      int v23 = 136315906;
      v24 = "WFEnforceClass";
      __int16 v25 = 2114;
      id v26 = v11;
      __int16 v27 = 2114;
      id v28 = (id)objc_opt_class();
      __int16 v29 = 2114;
      uint64_t v30 = v10;
      id v19 = v28;
      _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v23, 0x2Au);
    }
  }
  v20 = 0;
  v21 = 0;
LABEL_15:
  v9[2](v9, v21, 0);

  return 1;
}

- (id)wf_updatedParameterDefinition:()Workflow forCodableAttribute:localizer:
{
  v1 = a1;
  v16[4] = *MEMORY[0x1E4F143B8];
  v14.receiver = a1;
  v14.super_class = (Class)&off_1F237F578;
  v2 = objc_msgSendSuper2(&v14, sel_wf_updatedParameterDefinition_forCodableAttribute_localizer_);
  v3 = objc_msgSend(v1, "unitNamesWithMinimumUnit:maximumUnit:", objc_msgSend(v1, "minimumUnit"), objc_msgSend(v1, "maximumUnit"));
  v16[0] = v3;
  v15[0] = @"PossibleUnits";
  v15[1] = @"DefaultUnit";
  double v4 = [v3 firstObject];
  v16[1] = v4;
  v15[2] = @"DefaultValue";
  double v5 = [v1 defaultValue];
  uint64_t v6 = [v5 stringValue];
  v16[2] = v6;
  v15[3] = @"AllowsNegativeNumbers";
  uint64_t v7 = NSNumber;
  id v8 = [v1 minimumValue];
  if (v8)
  {
    v1 = [v1 minimumValue];
    BOOL v9 = [v1 compare:&unk_1F2316B60] == -1;
  }
  else
  {
    BOOL v9 = 0;
  }
  uint64_t v10 = [v7 numberWithInt:v9];
  v16[3] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  v12 = [v2 definitionByAddingEntriesInDictionary:v11];

  if (v8) {
  return v12;
  }
}

- (uint64_t)wf_parameterClass
{
  return objc_opt_class();
}

- (uint64_t)wf_objectClass
{
  return objc_opt_class();
}

@end