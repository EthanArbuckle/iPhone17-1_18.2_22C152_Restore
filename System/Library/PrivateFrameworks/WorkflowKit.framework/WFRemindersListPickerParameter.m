@interface WFRemindersListPickerParameter
- (BOOL)allowsAllLists;
- (Class)singleStateClass;
- (NSArray)listStates;
- (WFRemindersListPickerParameter)initWithDefinition:(id)a3;
- (id)accessoryColorForPossibleState:(id)a3;
- (id)defaultSerializedListRepresentation;
- (id)localizedLabelForPossibleState:(id)a3;
- (void)reloadStates;
- (void)setDefaultSerializedListRepresentation:(id)a3;
- (void)setListStates:(id)a3;
- (void)storeDidChange;
- (void)wasAddedToWorkflow;
- (void)wasRemovedFromWorkflow;
@end

@implementation WFRemindersListPickerParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listStates, 0);
  objc_storeStrong(&self->_defaultSerializedListRepresentation, 0);
}

- (void)setListStates:(id)a3
{
}

- (NSArray)listStates
{
  return self->_listStates;
}

- (void)setDefaultSerializedListRepresentation:(id)a3
{
}

- (id)defaultSerializedListRepresentation
{
  return self->_defaultSerializedListRepresentation;
}

- (BOOL)allowsAllLists
{
  return self->_allowsAllLists;
}

- (id)accessoryColorForPossibleState:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 value];
  v5 = [v4 calendarRGBAValue];

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4FB45E0];
    v7 = [v3 value];
    v8 = [v7 calendarRGBAValue];
    v9 = objc_msgSend(v6, "colorWithRGBAValue:", objc_msgSend(v8, "unsignedIntValue"));
  }
  else
  {
    [MEMORY[0x1E4F5A9F8] allLists];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v9 = (void *)[v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v11 = *(void *)v22;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v10);
          }
          v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "name", (void)v21);
          v15 = [v3 value];
          v16 = [v15 calendarTitle];
          char v17 = [v14 isEqualToString:v16];

          if (v17)
          {
            v18 = (void *)MEMORY[0x1E4FB45E0];
            v19 = [v13 color];
            v9 = [v18 colorWithRemindersColor:v19];

            goto LABEL_13;
          }
        }
        v9 = (void *)[v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v9;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  id v3 = a3;
  v4 = [v3 value];
  int v5 = [v4 allCalendars];

  if (v5)
  {
    v6 = WFLocalizedString(@"All Lists");
  }
  else
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    v7 = (void *)getREMDisplayNameUtilsClass_softClass;
    uint64_t v16 = getREMDisplayNameUtilsClass_softClass;
    if (!getREMDisplayNameUtilsClass_softClass)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __getREMDisplayNameUtilsClass_block_invoke;
      v12[3] = &unk_1E6558B78;
      v12[4] = &v13;
      __getREMDisplayNameUtilsClass_block_invoke((uint64_t)v12);
      v7 = (void *)v14[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v13, 8);
    v9 = [v3 value];
    id v10 = [v9 calendarTitle];
    v6 = [v8 displayNameFromListName:v10 isPlaceholder:0];
  }
  return v6;
}

- (void)reloadStates
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F5A9F8] allLists];
  v4 = [MEMORY[0x1E4F5A9F8] defaultList];
  int v5 = objc_opt_new();
  v6 = [WFCalendarSubstitutableState alloc];
  v7 = [[WFEKCalendarDescriptor alloc] initWithAllCalendars];
  uint64_t v8 = [(WFVariableSubstitutableParameterState *)v6 initWithValue:v7];

  if ([(WFRemindersListPickerParameter *)self allowsAllLists]) {
    [v5 addObject:v8];
  }
  long long v22 = (void *)v8;
  long long v23 = self;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v3;
  uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v15 = [[WFCalendarSubstitutableState alloc] initWithRemindersList:v14];
        [v5 addObject:v15];
        uint64_t v16 = [v4 objectID];
        char v17 = [v14 objectID];
        int v18 = [v16 isEqual:v17];

        if (v18)
        {
          uint64_t v19 = [(WFVariableSubstitutableParameterState *)v15 serializedRepresentation];

          uint64_t v11 = (void *)v19;
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  [(WFRemindersListPickerParameter *)v23 setListStates:v5];
  if ([(WFRemindersListPickerParameter *)v23 allowsAllLists])
  {
    v20 = v22;
    long long v21 = [v22 serializedRepresentation];
    [(WFRemindersListPickerParameter *)v23 setDefaultSerializedListRepresentation:v21];
  }
  else
  {
    [(WFRemindersListPickerParameter *)v23 setDefaultSerializedListRepresentation:v11];
    v20 = v22;
  }
  [(WFEnumerationParameter *)v23 possibleStatesDidChange];
  [(WFParameter *)v23 defaultSerializedRepresentationDidChange];
}

- (void)storeDidChange
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__WFRemindersListPickerParameter_storeDidChange__block_invoke;
  block[3] = &unk_1E6558B28;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __48__WFRemindersListPickerParameter_storeDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadStates];
}

- (void)wasRemovedFromWorkflow
{
  v5.receiver = self;
  v5.super_class = (Class)WFRemindersListPickerParameter;
  [(WFParameter *)&v5 wasRemovedFromWorkflow];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = [getREMStoreClass() storeDidChangeNotificationName];
  [v3 removeObserver:self name:v4 object:0];
}

- (void)wasAddedToWorkflow
{
  v5.receiver = self;
  v5.super_class = (Class)WFRemindersListPickerParameter;
  [(WFParameter *)&v5 wasAddedToWorkflow];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = [getREMStoreClass() storeDidChangeNotificationName];
  [v3 addObserver:self selector:sel_storeDidChange name:v4 object:0];

  [(WFRemindersListPickerParameter *)self reloadStates];
}

- (WFRemindersListPickerParameter)initWithDefinition:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFRemindersListPickerParameter;
  objc_super v5 = [(WFEnumerationParameter *)&v15 initWithDefinition:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"AllowsAllLists"];
    uint64_t v7 = objc_opt_class();
    id v8 = v6;
    if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v10 = getWFGeneralLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        uint64_t v11 = objc_opt_class();
        *(_DWORD *)buf = 136315906;
        char v17 = "WFEnforceClass";
        __int16 v18 = 2114;
        id v19 = v8;
        __int16 v20 = 2114;
        long long v21 = v11;
        __int16 v22 = 2114;
        uint64_t v23 = v7;
        id v12 = v11;
        _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
      }
      id v9 = 0;
    }
    else
    {
      id v9 = v8;
    }

    v5->_allowsAllLists = [v9 BOOLValue];
    uint64_t v13 = v5;
  }

  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end