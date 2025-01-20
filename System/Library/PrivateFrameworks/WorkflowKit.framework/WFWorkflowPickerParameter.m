@interface WFWorkflowPickerParameter
- (BOOL)parameterStateIsValid:(id)a3;
- (BOOL)preferParameterValuePicker;
- (Class)singleStateClass;
- (WFWorkflow)workflow;
- (WFWorkflowPickerParameter)initWithDefinition:(id)a3;
- (id)accessoryIconForPossibleState:(id)a3;
- (id)accessoryImageForPossibleState:(id)a3;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (id)workflowForState:(id)a3;
- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5;
- (void)setWorkflow:(id)a3;
@end

@implementation WFWorkflowPickerParameter

- (void).cxx_destruct
{
}

- (void)setWorkflow:(id)a3
{
}

- (WFWorkflow)workflow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
  return (WFWorkflow *)WeakRetained;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  v5 = objc_msgSend(a4, "value", a3);
  v6 = +[WFDatabaseProxy defaultDatabase];
  v7 = [(WFWorkflowPickerParameter *)self workflow];
  v8 = [v7 reference];
  v9 = [v5 displayNameWithDatabase:v6 containingWorkflow:v8];

  return v9;
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, void *, void))a5;
  v7 = +[WFDatabaseProxy defaultDatabase];
  id v14 = 0;
  v8 = [v7 sortedVisibleWorkflowsByNameWithError:&v14];
  id v9 = v14;

  if (!v8)
  {
    v10 = getWFGeneralLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[WFWorkflowPickerParameter loadPossibleStatesForEnumeration:searchTerm:completionHandler:]";
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_ERROR, "%s Failed to load workflows in WFWorkflowPickerParameter: %@", buf, 0x16u);
    }
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__WFWorkflowPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
  v13[3] = &unk_1E654F098;
  v13[4] = self;
  v11 = objc_msgSend(v8, "if_map:", v13);
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F30570]) initWithItems:v11];
  v6[2](v6, v12, 0);
}

WFWorkflowParameterState *__91__WFWorkflowPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 identifier];
  v5 = [*(id *)(a1 + 32) workflow];
  v6 = [v5 workflowID];
  uint64_t v7 = [v4 isEqualToString:v6];

  v8 = [[WFWorkflowParameterStateDescriptor alloc] initWithWorkflowReference:v3 isSelf:v7];
  id v9 = [(WFVariableSubstitutableParameterState *)[WFWorkflowParameterState alloc] initWithValue:v8];

  return v9;
}

- (BOOL)preferParameterValuePicker
{
  return 1;
}

- (BOOL)parameterStateIsValid:(id)a3
{
  return 1;
}

- (id)accessoryIconForPossibleState:(id)a3
{
  id v3 = [(WFWorkflowPickerParameter *)self workflowForState:a3];
  v4 = [v3 attributionIcon];

  return v4;
}

- (id)accessoryImageForPossibleState:(id)a3
{
  id v3 = [(WFWorkflowPickerParameter *)self workflowForState:a3];
  v4 = [MEMORY[0x1E4FB46B8] currentDevice];
  [v4 screenScale];
  v6 = objc_msgSend(v3, "attributionIconWithSize:scale:rounded:", 1, 38.0, 38.0, v5);

  return v6;
}

- (id)workflowForState:(id)a3
{
  v4 = [a3 value];
  if (v4)
  {
    double v5 = +[WFDatabaseProxy defaultDatabase];
    v6 = [(WFWorkflowPickerParameter *)self workflow];
    uint64_t v7 = [v6 reference];
    v8 = [v4 matchingWorkflowInDatabase:v5 containingWorkflow:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFWorkflowPickerParameter)initWithDefinition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFWorkflowPickerParameter;
  id v3 = [(WFEnumerationParameter *)&v7 initWithDefinition:a3];
  v4 = v3;
  if (v3)
  {
    [(WFDynamicEnumerationParameter *)v3 setDataSource:v3];
    double v5 = v4;
  }

  return v4;
}

@end