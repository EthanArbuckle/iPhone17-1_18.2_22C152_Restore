@interface WFLinkDynamicOptionsEnumerationParameter
- (BOOL)allowsMultipleValues;
- (BOOL)alwaysShowsButton;
- (BOOL)displaysMultipleValueEditor;
- (BOOL)dynamicOptionsSupportsSearch;
- (BOOL)hidesSubtitleInEditor;
- (BOOL)parameterStateIsValid:(id)a3;
- (BOOL)wf_allowsMultipleSelection;
- (BOOL)wf_shouldValidateCurrentStateOnCollectionChanged;
- (BOOL)wf_supportsSearch;
- (Class)singleStateClass;
- (LNActionParameterMetadata)parameterMetadata;
- (WFAppIntentExecutionAction)action;
- (WFLinkDynamicOptionsEnumerationParameter)initWithDefinition:(id)a3;
- (WFPropertyListObject)serializedDefaultParameterOption;
- (id)localizedTitleForButtonWithState:(id)a3;
- (id)statesForMultipleStateLabelWithStates:(id)a3;
- (id)wf_pickerLocalizedSubtitleForState:(id)a3;
- (id)wf_pickerLocalizedTitleForState:(id)a3;
- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6;
- (void)createParameterStateFromDialogResponse:(id)a3 completionHandler:(id)a4;
- (void)setAction:(id)a3;
- (void)setAllowsMultipleValues:(BOOL)a3;
- (void)setParameterMetadata:(id)a3;
- (void)wf_loadStatesWithSearchTerm:(id)a3 completionHandler:(id)a4;
@end

@implementation WFLinkDynamicOptionsEnumerationParameter

- (void)setParameterMetadata:(id)a3
{
}

- (void)setAction:(id)a3
{
}

- (WFLinkDynamicOptionsEnumerationParameter)initWithDefinition:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFLinkDynamicOptionsEnumerationParameter;
  v5 = [(WFEnumerationParameter *)&v14 initWithDefinition:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"AllowsMultipleValues"];
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v7 = v6;
      }
      else {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
    id v8 = v7;

    char v9 = [v8 BOOLValue];
    v5->_allowsMultipleValues = v9;
    uint64_t v10 = [v4 objectForKey:@"DefaultValue"];
    serializedDefaultParameterOption = v5->_serializedDefaultParameterOption;
    v5->_serializedDefaultParameterOption = (WFPropertyListObject *)v10;

    v12 = v5;
  }

  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedDefaultParameterOption, 0);
  objc_destroyWeak((id *)&self->_action);
  objc_storeStrong((id *)&self->_parameterMetadata, 0);
}

- (BOOL)allowsMultipleValues
{
  int allowsMultipleValues = self->_allowsMultipleValues;
  if (!self->_allowsMultipleValues)
  {
    v3 = [(WFLinkDynamicOptionsEnumerationParameter *)self parameterMetadata];
    id v4 = [v3 valueType];
    objc_opt_class();
    int allowsMultipleValues = objc_opt_isKindOfClass() & 1;
  }
  return allowsMultipleValues != 0;
}

- (LNActionParameterMetadata)parameterMetadata
{
  return self->_parameterMetadata;
}

- (WFPropertyListObject)serializedDefaultParameterOption
{
  return self->_serializedDefaultParameterOption;
}

- (WFAppIntentExecutionAction)action
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  return (WFAppIntentExecutionAction *)WeakRetained;
}

- (void)setAllowsMultipleValues:(BOOL)a3
{
  self->_int allowsMultipleValues = a3;
}

- (void)createParameterStateFromDialogResponse:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v9 = [(WFLinkDynamicOptionsEnumerationParameter *)self action];
    uint64_t v10 = [v9 variableSource];

    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v11 = v10;
      }
      else {
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
    }
    id v13 = v11;

    objc_super v14 = (void *)MEMORY[0x1E4F72E10];
    v15 = [v8 queryResults];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __101__WFLinkDynamicOptionsEnumerationParameter_createParameterStateFromDialogResponse_completionHandler___block_invoke;
    v16[3] = &unk_1E6558040;
    v16[4] = self;
    id v17 = v7;
    [v14 produceValuesFromEncodedTypedValues:v15 variableDataSource:v13 associatedParameter:self completionHandler:v16];

    v12 = v8;
  }
  else
  {

    v18.receiver = self;
    v18.super_class = (Class)WFLinkDynamicOptionsEnumerationParameter;
    v12 = [(WFEnumerationParameter *)&v18 parameterStateFromDialogResponse:v8];
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
}

void __101__WFLinkDynamicOptionsEnumerationParameter_createParameterStateFromDialogResponse_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "if_map:", &__block_literal_global_2839);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if ([*(id *)(a1 + 32) allowsMultipleValues])
  {
    v3 = [WFMultipleValueParameterState alloc];
    id v4 = objc_msgSend(v8, "if_map:", &__block_literal_global_195);
    uint64_t v5 = [(WFMultipleValueParameterState *)v3 initWithParameterStates:v4];
LABEL_5:
    id v7 = (void *)v5;

    goto LABEL_7;
  }
  if ([v8 count])
  {
    id v6 = [WFLinkDynamicOptionSubstitutableState alloc];
    id v4 = [v8 firstObject];
    uint64_t v5 = [(WFVariableSubstitutableParameterState *)v6 initWithValue:v4];
    goto LABEL_5;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v7 = 0;
LABEL_7:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

WFLinkDynamicOptionSubstitutableState *__101__WFLinkDynamicOptionsEnumerationParameter_createParameterStateFromDialogResponse_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(WFVariableSubstitutableParameterState *)[WFLinkDynamicOptionSubstitutableState alloc] initWithValue:v2];

  return v3;
}

id __101__WFLinkDynamicOptionsEnumerationParameter_createParameterStateFromDialogResponse_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F72C08];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithValue:v3 indentationLevel:0];

  return v4;
}

- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_super v14 = [(WFLinkDynamicOptionsEnumerationParameter *)self parameterMetadata];
  v15 = [v14 valueType];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([(WFLinkDynamicOptionsEnumerationParameter *)self action],
        (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_6;
  }
  id v17 = (void *)v16;
  objc_super v18 = [(WFLinkDynamicOptionsEnumerationParameter *)self action];
  int v19 = [v18 runningInToolKit];

  if (!v19)
  {
LABEL_6:
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __117__WFLinkDynamicOptionsEnumerationParameter_createDialogRequestWithAttribution_defaultState_prompt_completionHandler___block_invoke;
    v24[3] = &unk_1E654D110;
    id v25 = v13;
    v23.receiver = self;
    v23.super_class = (Class)WFLinkDynamicOptionsEnumerationParameter;
    [(WFDynamicEnumerationParameter *)&v23 createDialogRequestWithAttribution:v10 defaultState:v11 prompt:v12 completionHandler:v24];

    goto LABEL_7;
  }
  id v20 = objc_alloc(MEMORY[0x1E4FB4838]);
  v21 = [(WFParameter *)self key];
  v22 = (void *)[v20 initWithParameterKey:v21 attribution:v10 prompt:v12];

  (*((void (**)(id, void *))v13 + 2))(v13, v22);
LABEL_7:
}

void __117__WFLinkDynamicOptionsEnumerationParameter_createDialogRequestWithAttribution_defaultState_prompt_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4FB47E0]);
    [v3 setTitleLineLimit:&unk_1F23165F0];
    [v4 setDisplayConfiguration:v3];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)statesForMultipleStateLabelWithStates:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)localizedTitleForButtonWithState:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WFLinkDynamicOptionsEnumerationParameter;
  uint64_t v5 = [(WFEnumerationParameter *)&v20 localizedTitleForButtonWithState:v4];
  if (v5) {
    goto LABEL_2;
  }
  char v9 = [(WFLinkDynamicOptionsEnumerationParameter *)self parameterMetadata];
  id v10 = [v9 valueType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    WFLocalizedString(@"Loading…");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  id v12 = [(WFLinkDynamicOptionsEnumerationParameter *)self parameterMetadata];
  id v13 = [v12 valueType];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [v13 memberValueType];

    id v13 = (void *)v14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

LABEL_2:
    id v6 = v5;
LABEL_3:
    id v7 = v6;
    goto LABEL_4;
  }
  id v15 = v4;
  uint64_t v16 = [(WFLinkDynamicOptionsEnumerationParameter *)self parameterMetadata];
  id v17 = objc_msgSend(v13, "wf_parameterDefinitionWithParameterMetadata:", v16);

  objc_super v18 = [v15 value];

  int v19 = [v18 value];
  id v7 = [v17 localizedTitleForLinkValue:v19];

LABEL_4:
  return v7;
}

- (BOOL)parameterStateIsValid:(id)a3
{
  return 1;
}

- (BOOL)displaysMultipleValueEditor
{
  if ([(WFLinkDynamicOptionsEnumerationParameter *)self dynamicOptionsSupportsSearch]) {
    return 1;
  }
  return [(WFParameter *)self isRangedSizeArray];
}

- (BOOL)hidesSubtitleInEditor
{
  return 1;
}

- (BOOL)alwaysShowsButton
{
  return 1;
}

- (BOOL)dynamicOptionsSupportsSearch
{
  id v2 = [(WFLinkDynamicOptionsEnumerationParameter *)self parameterMetadata];
  BOOL v3 = [v2 dynamicOptionsSupport] == 2;

  return v3;
}

- (void)wf_loadStatesWithSearchTerm:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFDynamicEnumerationParameter *)self dataSource];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __109__WFLinkDynamicOptionsEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke;
  v10[3] = &unk_1E6557340;
  id v11 = v6;
  id v9 = v6;
  [v8 loadPossibleStatesForEnumeration:self searchTerm:v7 completionHandler:v10];
}

void __109__WFLinkDynamicOptionsEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__WFLinkDynamicOptionsEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_2;
  block[3] = &unk_1E6557D28;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __109__WFLinkDynamicOptionsEnumerationParameter_WFParameterPicker__wf_loadStatesWithSearchTerm_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (BOOL)wf_shouldValidateCurrentStateOnCollectionChanged
{
  return 1;
}

- (BOOL)wf_allowsMultipleSelection
{
  BOOL v3 = [(WFLinkDynamicOptionsEnumerationParameter *)self allowsMultipleValues];
  if (v3) {
    LOBYTE(v3) = ![(WFLinkDynamicOptionsEnumerationParameter *)self wf_supportsSearch];
  }
  return v3;
}

- (id)wf_pickerLocalizedSubtitleForState:(id)a3
{
  return (id)[a3 localizedSubtitle];
}

- (id)wf_pickerLocalizedTitleForState:(id)a3
{
  return (id)[a3 localizedTitle];
}

- (BOOL)wf_supportsSearch
{
  id v2 = [(WFLinkDynamicOptionsEnumerationParameter *)self parameterMetadata];
  BOOL v3 = [v2 dynamicOptionsSupport] == 2;

  return v3;
}

@end