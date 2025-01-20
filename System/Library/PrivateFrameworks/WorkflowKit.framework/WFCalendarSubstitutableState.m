@interface WFCalendarSubstitutableState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFCalendarSubstitutableState)initWithCalendar:(id)a3;
- (WFCalendarSubstitutableState)initWithRemindersList:(id)a3;
- (id)legacySerializedRepresentation;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFCalendarSubstitutableState

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__WFCalendarSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
  v13[3] = &unk_1E6556B68;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  v12.receiver = self;
  v12.super_class = (Class)WFCalendarSubstitutableState;
  id v10 = v9;
  id v11 = v8;
  [(WFVariableSubstitutableParameterState *)&v12 processWithContext:v11 userInputRequiredHandler:a4 valueHandler:v13];
}

void __89__WFCalendarSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5
    || ([*(id *)(a1 + 32) variable],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) variable];
    uint64_t v9 = objc_opt_class();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __89__WFCalendarSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
    v11[3] = &unk_1E65550D8;
    uint64_t v10 = *(void *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    [v8 getObjectRepresentationForClass:v9 context:v10 completionHandler:v11];
  }
}

void __89__WFCalendarSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v7;
  if (v7)
  {
    id v9 = a5;
    uint64_t v10 = [[WFEKCalendarDescriptor alloc] initWithCalendarTitle:v12 identifier:0 RGBAValue:0];
    (*(void (**)(uint64_t, WFEKCalendarDescriptor *, id))(v8 + 16))(v8, v10, v9);
  }
  else
  {
    id v11 = *(void (**)(uint64_t, void, WFEKCalendarDescriptor *))(v8 + 16);
    uint64_t v10 = a5;
    v11(v8, 0, v10);
  }
}

- (WFCalendarSubstitutableState)initWithRemindersList:(id)a3
{
  id v4 = a3;
  id v5 = [WFEKCalendarDescriptor alloc];
  id v6 = [v4 name];
  id v7 = [v4 objectID];

  uint64_t v8 = [v7 stringRepresentation];
  id v9 = [(WFEKCalendarDescriptor *)v5 initWithCalendarTitle:v6 identifier:v8 RGBAValue:0];

  v12.receiver = self;
  v12.super_class = (Class)WFCalendarSubstitutableState;
  uint64_t v10 = [(WFVariableSubstitutableParameterState *)&v12 initWithValue:v9];

  return v10;
}

- (WFCalendarSubstitutableState)initWithCalendar:(id)a3
{
  id v4 = a3;
  id v5 = [WFEKCalendarDescriptor alloc];
  id v6 = [v4 title];
  id v7 = [v4 calendarIdentifier];
  uint64_t v8 = NSNumber;
  id v9 = (void *)MEMORY[0x1E4FB45E0];
  uint64_t v10 = [v4 CGColor];

  id v11 = [v9 colorWithCGColor:v10];
  objc_super v12 = objc_msgSend(v8, "numberWithUnsignedInt:", objc_msgSend(v11, "RGBAValue"));
  v13 = [(WFEKCalendarDescriptor *)v5 initWithCalendarTitle:v6 identifier:v7 RGBAValue:v12];

  v16.receiver = self;
  v16.super_class = (Class)WFCalendarSubstitutableState;
  id v14 = [(WFVariableSubstitutableParameterState *)&v16 initWithValue:v13];

  return v14;
}

- (id)legacySerializedRepresentation
{
  v3 = [(WFVariableSubstitutableParameterState *)self value];
  if ([v3 allCalendars])
  {
    id v4 = &stru_1F229A4D8;
  }
  else
  {
    id v5 = [(WFVariableSubstitutableParameterState *)self value];
    id v4 = [v5 calendarTitle];
  }
  return v4;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"WFCalendarSubstitutableState.m", 207, @"Invalid parameter not satisfying: %@", @"[value isKindOfClass:[WFEKCalendarDescriptor class]]" object file lineNumber description];
  }
  id v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "allCalendars"));
  [v6 setObject:v7 forKeyedSubscript:@"IsAllCalendar"];

  if (([v5 allCalendars] & 1) == 0)
  {
    uint64_t v8 = [v5 calendarTitle];
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v8, @"Title");

    id v9 = [v5 calendarIdentifier];
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v9, @"Identifier");

    uint64_t v10 = [v5 calendarRGBAValue];
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v10, @"RGBAValue");
  }
  return v6;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v7;
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = [v10 objectForKeyedSubscript:@"IsAllCalendar"];
      if (v11)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_super v12 = v11;
        }
        else {
          objc_super v12 = 0;
        }
      }
      else
      {
        objc_super v12 = 0;
      }
      id v20 = v12;

      int v21 = [v20 BOOLValue];
      if (v21)
      {
        v19 = [[WFEKCalendarDescriptor alloc] initWithAllCalendars];
      }
      else
      {
        v22 = [v10 objectForKeyedSubscript:@"Title"];
        if (v22)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v23 = v22;
          }
          else {
            v23 = 0;
          }
        }
        else
        {
          v23 = 0;
        }
        id v24 = v23;

        v25 = [v10 objectForKeyedSubscript:@"Identifier"];
        if (v25)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v26 = v25;
          }
          else {
            v26 = 0;
          }
        }
        else
        {
          v26 = 0;
        }
        id v27 = v26;

        v28 = [v10 objectForKeyedSubscript:@"RGBAValue"];
        if (v28)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v29 = v28;
          }
          else {
            v29 = 0;
          }
        }
        else
        {
          v29 = 0;
        }
        id v30 = v29;

        v19 = [[WFEKCalendarDescriptor alloc] initWithCalendarTitle:v24 identifier:v27 RGBAValue:v30];
      }
      id v15 = v10;
      goto LABEL_39;
    }
  }

  uint64_t v13 = objc_opt_class();
  id v14 = v10;
  if (v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v16 = getWFGeneralLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      int v32 = 136315906;
      v33 = "WFEnforceClass";
      __int16 v34 = 2114;
      id v35 = v14;
      __int16 v36 = 2114;
      id v37 = (id)objc_opt_class();
      __int16 v38 = 2114;
      uint64_t v39 = v13;
      id v17 = v37;
      _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v32, 0x2Au);
    }
    id v15 = 0;
  }
  else
  {
    id v15 = v14;
  }

  if ([v15 isEqualToString:&stru_1F229A4D8])
  {
    v18 = [[WFEKCalendarDescriptor alloc] initWithAllCalendars];
LABEL_17:
    v19 = v18;
    goto LABEL_39;
  }
  if (v15)
  {
    v18 = [[WFEKCalendarDescriptor alloc] initWithCalendarTitle:v15 identifier:0 RGBAValue:0];
    goto LABEL_17;
  }
  v19 = 0;
LABEL_39:

  return v19;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end