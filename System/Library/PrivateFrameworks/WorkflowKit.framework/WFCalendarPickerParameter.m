@interface WFCalendarPickerParameter
- (BOOL)allowsAllCalendars;
- (BOOL)hidesReadOnlyCalendars;
- (Class)singleStateClass;
- (INObjectCollection)calendarsCollection;
- (OS_dispatch_queue)stateQueue;
- (WFCalendarPickerParameter)initWithDefinition:(id)a3;
- (id)defaultSerializedCalendarRepresentation;
- (id)enumeration:(id)a3 accessoryColorForPossibleState:(id)a4;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (void)clearPossibleStates;
- (void)loadDefaultSerializedRepresentationForEnumeration:(id)a3 completionHandler:(id)a4;
- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5;
- (void)possibleStatesDidChange;
- (void)setCalendarsCollection:(id)a3;
- (void)setDefaultSerializedCalendarRepresentation:(id)a3;
- (void)wasAddedToWorkflow;
- (void)wasRemovedFromWorkflow;
@end

@implementation WFCalendarPickerParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_calendarsCollection, 0);
  objc_storeStrong(&self->_defaultSerializedCalendarRepresentation, 0);
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (void)setCalendarsCollection:(id)a3
{
}

- (INObjectCollection)calendarsCollection
{
  return self->_calendarsCollection;
}

- (void)setDefaultSerializedCalendarRepresentation:(id)a3
{
}

- (id)defaultSerializedCalendarRepresentation
{
  return self->_defaultSerializedCalendarRepresentation;
}

- (BOOL)hidesReadOnlyCalendars
{
  return self->_hidesReadOnlyCalendars;
}

- (BOOL)allowsAllCalendars
{
  return self->_allowsAllCalendars;
}

- (id)enumeration:(id)a3 accessoryColorForPossibleState:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  v5 = [v4 value];
  v6 = [v5 calendarRGBAValue];

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4FB45E0];
    v8 = [v4 value];
    v9 = [v8 calendarRGBAValue];
    v10 = objc_msgSend(v7, "colorWithRGBAValue:", objc_msgSend(v9, "unsignedIntValue"));
  }
  else
  {
    v11 = WFGetWorkflowEventStore();
    v12 = [v11 calendarsForEntityType:0];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = v12;
    v10 = (void *)[v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v13);
          }
          v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v17 = objc_msgSend(v16, "title", (void)v24);
          v18 = [v4 value];
          v19 = [v18 calendarTitle];
          char v20 = [v17 isEqualToString:v19];

          if (v20)
          {
            v21 = (void *)MEMORY[0x1E4FB45E0];
            v22 = objc_msgSend(MEMORY[0x1E4FB45E0], "colorWithCGColor:", objc_msgSend(v16, "CGColor"));
            v10 = objc_msgSend(v21, "colorWithRGBAValue:", objc_msgSend(v22, "RGBAValue"));

            goto LABEL_13;
          }
        }
        v10 = (void *)[v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v10;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v4 = a4;
  v5 = [v4 value];
  int v6 = [v5 allCalendars];

  if (v6)
  {
    v7 = @"All Calendars";
LABEL_7:
    uint64_t v14 = WFLocalizedString(v7);
    goto LABEL_8;
  }
  v8 = [v4 value];
  v9 = [v8 calendarTitle];
  int v10 = [v9 isEqualToString:@"Found in Mail"];

  if (v10)
  {
    v7 = @"Found in Mail";
    goto LABEL_7;
  }
  v11 = [v4 value];
  v12 = [v11 calendarTitle];
  int v13 = [v12 isEqualToString:@"Birthdays"];

  if (v13)
  {
    v7 = @"Birthdays";
    goto LABEL_7;
  }
  v16 = [v4 value];
  uint64_t v14 = [v16 calendarTitle];

LABEL_8:
  return v14;
}

- (void)possibleStatesDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)WFCalendarPickerParameter;
  [(WFDynamicEnumerationParameter *)&v3 possibleStatesDidChange];
  [(WFDynamicEnumerationParameter *)self defaultSerializedRepresentationDidChange];
}

- (void)loadDefaultSerializedRepresentationForEnumeration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void))a4;
  v8 = [(WFCalendarPickerParameter *)self defaultSerializedCalendarRepresentation];

  if (v8)
  {
    v9 = [(WFCalendarPickerParameter *)self defaultSerializedCalendarRepresentation];
    v7[2](v7, v9, 0);
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __97__WFCalendarPickerParameter_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke;
    v10[3] = &unk_1E6556648;
    v10[4] = self;
    v11 = v7;
    [(WFCalendarPickerParameter *)self loadPossibleStatesForEnumeration:v6 searchTerm:0 completionHandler:v10];
  }
}

void __97__WFCalendarPickerParameter_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = a3;
  id v6 = [v4 defaultSerializedCalendarRepresentation];
  (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = [(WFCalendarPickerParameter *)self stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__WFCalendarPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
  block[3] = &unk_1E6557D28;
  id v13 = v7;
  uint64_t v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __91__WFCalendarPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(id *a1)
{
  v40[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] possibleStates];
  if (v2
    && ([a1[5] calendarsCollection],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v2,
        v3))
  {
    id v4 = (void (**)(id))a1[6];
    id v27 = [a1[5] calendarsCollection];
    v4[2](v4);
  }
  else
  {
    id v5 = WFGetWorkflowEventStore();
    id v6 = [v5 defaultCalendarForNewEvents];
    id v7 = objc_opt_new();
    id v8 = [WFCalendarSubstitutableState alloc];
    v9 = [[WFEKCalendarDescriptor alloc] initWithAllCalendars];
    id v10 = [(WFVariableSubstitutableParameterState *)v8 initWithValue:v9];

    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__31028;
    v37 = __Block_byref_object_dispose__31029;
    id v38 = 0;
    if ([a1[5] allowsAllCalendars])
    {
      id v11 = objc_alloc(MEMORY[0x1E4F30580]);
      v40[0] = v10;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
      id v13 = (void *)[v11 initWithTitle:0 items:v12];

      [v7 addObject:v13];
    }
    uint64_t v14 = [v5 sourcesEnabledForEntityType:0];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __91__WFCalendarPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_181;
    v30[3] = &unk_1E65518D0;
    v30[4] = a1[5];
    id v15 = v6;
    id v31 = v15;
    v32 = &v33;
    v16 = objc_msgSend(v14, "if_compactMap:", v30);
    v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title" ascending:1 selector:sel_localizedStandardCompare_];
    v39 = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
    v19 = [v16 sortedArrayUsingDescriptors:v18];

    [v7 addObjectsFromArray:v19];
    char v20 = (void *)[objc_alloc(MEMORY[0x1E4F30570]) initWithSections:v7];
    [a1[5] setCalendarsCollection:v20];

    if ([a1[5] allowsAllCalendars])
    {
      uint64_t v21 = [(WFVariableSubstitutableParameterState *)v10 serializedRepresentation];
      v22 = a1[5];
      v23 = (void *)v22[35];
      v22[35] = v21;
    }
    else
    {
      long long v24 = a1[5];
      id v25 = (id)v34[5];
      v23 = (void *)v24[35];
      v24[35] = v25;
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__WFCalendarPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_4;
    block[3] = &unk_1E65572A0;
    id v26 = a1[6];
    void block[4] = a1[5];
    id v29 = v26;
    dispatch_async(MEMORY[0x1E4F14428], block);

    _Block_object_dispose(&v33, 8);
  }
}

id __91__WFCalendarPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_181(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 calendarsForEntityType:0];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __91__WFCalendarPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2;
  v19[3] = &unk_1E6551880;
  v19[4] = *(void *)(a1 + 32);
  id v5 = [v4 objectsPassingTest:v19];
  id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title" ascending:1 selector:sel_localizedStandardCompare_];
  v20[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  id v8 = [v5 sortedArrayUsingDescriptors:v7];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__WFCalendarPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_3;
  v16[3] = &unk_1E65518A8;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  id v17 = v9;
  uint64_t v18 = v10;
  id v11 = objc_msgSend(v8, "if_map:", v16);
  if ([v11 count])
  {
    id v12 = objc_alloc(MEMORY[0x1E4F30580]);
    id v13 = [v3 title];
    uint64_t v14 = (void *)[v12 initWithTitle:v13 items:v11];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

void __91__WFCalendarPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) calendarsCollection];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

BOOL __91__WFCalendarPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = ![*(id *)(a1 + 32) hidesReadOnlyCalendars]
    || [v3 allowsContentModifications];

  return v4;
}

WFCalendarSubstitutableState *__91__WFCalendarPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [[WFCalendarSubstitutableState alloc] initWithCalendar:v3];
  int v5 = [*(id *)(a1 + 32) isEqual:v3];

  if (v5)
  {
    uint64_t v6 = [(WFVariableSubstitutableParameterState *)v4 serializedRepresentation];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  return v4;
}

- (void)clearPossibleStates
{
  id v3 = [(WFCalendarPickerParameter *)self stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__WFCalendarPickerParameter_clearPossibleStates__block_invoke;
  block[3] = &unk_1E6558B28;
  void block[4] = self;
  dispatch_async(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)WFCalendarPickerParameter;
  [(WFDynamicEnumerationParameter *)&v4 clearPossibleStates];
}

uint64_t __48__WFCalendarPickerParameter_clearPossibleStates__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDefaultSerializedCalendarRepresentation:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 setCalendarsCollection:0];
}

- (void)wasRemovedFromWorkflow
{
  v5.receiver = self;
  v5.super_class = (Class)WFCalendarPickerParameter;
  [(WFParameter *)&v5 wasRemovedFromWorkflow];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_super v4 = getEKEventStoreChangedNotification();
  [v3 removeObserver:self name:v4 object:0];
}

- (void)wasAddedToWorkflow
{
  v5.receiver = self;
  v5.super_class = (Class)WFCalendarPickerParameter;
  [(WFParameter *)&v5 wasAddedToWorkflow];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_super v4 = getEKEventStoreChangedNotification();
  [v3 addObserver:self selector:sel_reloadPossibleStates name:v4 object:0];
}

- (WFCalendarPickerParameter)initWithDefinition:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WFCalendarPickerParameter;
  objc_super v5 = [(WFEnumerationParameter *)&v21 initWithDefinition:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"AllowsAllCalendars"];
    uint64_t v7 = objc_opt_class();
    id v8 = WFEnforceClass(v6, v7);
    v5->_allowsAllCalendars = [v8 BOOLValue];

    id v9 = [v4 objectForKey:@"HidesReadOnlyCalendars"];
    uint64_t v10 = objc_opt_class();
    id v11 = WFEnforceClass(v9, v10);
    v5->_hidesReadOnlyCalendars = [v11 BOOLValue];

    id v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    id v13 = objc_claimAutoreleasedReturnValue();
    uint64_t v14 = (const char *)[v13 UTF8String];
    id v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v17 = dispatch_queue_create(v14, v16);
    stateQueue = v5->_stateQueue;
    v5->_stateQueue = (OS_dispatch_queue *)v17;

    [(WFDynamicEnumerationParameter *)v5 setDataSource:v5];
    v19 = v5;
  }

  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end