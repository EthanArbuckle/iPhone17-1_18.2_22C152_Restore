@interface WFFilePickerParameter
- (BOOL)allowsMultipleSelection;
- (BOOL)displaysMultipleValueEditor;
- (BOOL)parameterStateIsValid:(id)a3;
- (BOOL)shouldShowFullContextualPath;
- (Class)singleStateClass;
- (NSArray)supportedTypes;
- (WFFilePickerParameter)initWithDefinition:(id)a3;
- (WFWorkflow)workflow;
- (id)defaultSerializedRepresentation;
- (void)setAllowsMultipleSelection:(BOOL)a3;
- (void)setWorkflow:(id)a3;
@end

@implementation WFFilePickerParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedTypes, 0);
  objc_destroyWeak((id *)&self->_workflow);
}

- (BOOL)shouldShowFullContextualPath
{
  return self->_shouldShowFullContextualPath;
}

- (void)setAllowsMultipleSelection:(BOOL)a3
{
  self->_allowsMultipleSelection = a3;
}

- (BOOL)allowsMultipleSelection
{
  return self->_allowsMultipleSelection;
}

- (NSArray)supportedTypes
{
  return self->_supportedTypes;
}

- (void)setWorkflow:(id)a3
{
}

- (WFWorkflow)workflow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
  return (WFWorkflow *)WeakRetained;
}

- (id)defaultSerializedRepresentation
{
  v3 = [(WFParameter *)self definition];
  v4 = [v3 objectForKey:@"DefaultsToShortcutsFolder"];

  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  int v7 = [v6 BOOLValue];
  if (v7)
  {
    v8 = [(WFFilePickerParameter *)self workflow];
    v9 = [v8 workflowID];
    v10 = +[WFFileValue defaultValueWithWorkflowID:v9];

    if (v10)
    {
      v11 = [(WFVariableSubstitutableParameterState *)[WFFileParameterState alloc] initWithValue:v10];
      v12 = [(WFVariableSubstitutableParameterState *)v11 serializedRepresentation];
LABEL_19:
      v19 = v12;

      goto LABEL_21;
    }
  }
  v13 = [(WFParameter *)self definition];
  v10 = [v13 objectForKey:@"DefaultValue"];

  v14 = [(WFParameter *)self definition];
  v15 = [v14 objectForKey:@"AllowsMultipleValues"];

  if (v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }
  id v17 = v16;

  [v17 BOOLValue];
  if (v10)
  {
    v11 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v18 = v11;
    }
    else {
      v18 = 0;
    }
    v12 = v18;
    goto LABEL_19;
  }
  v19 = 0;
LABEL_21:

  return v19;
}

- (BOOL)displaysMultipleValueEditor
{
  return 0;
}

- (BOOL)parameterStateIsValid:(id)a3
{
  id v4 = a3;
  v5 = [v4 variable];

  if (v5)
  {
    v8.receiver = self;
    v8.super_class = (Class)WFFilePickerParameter;
    BOOL v6 = [(WFParameter *)&v8 parameterStateIsValid:v4];
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFFilePickerParameter)initWithDefinition:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WFFilePickerParameter;
  v5 = [(WFParameter *)&v21 initWithDefinition:v4];
  if (v5)
  {
    BOOL v6 = [v4 objectForKey:@"AllowsMultipleValues"];
    uint64_t v7 = objc_opt_class();
    objc_super v8 = WFEnforceClass(v6, v7);
    v5->_allowsMultipleSelection = [v8 BOOLValue];

    v9 = [v4 objectForKey:@"ShowsFullContextualPath"];
    uint64_t v10 = objc_opt_class();
    v11 = WFEnforceClass(v9, v10);
    v5->_shouldShowFullContextualPath = [v11 BOOLValue];

    v12 = [v4 objectForKey:@"FilePickerSupportedTypes"];
    uint64_t v13 = objc_opt_class();
    v14 = WFEnforceClass(v12, v13);
    uint64_t v15 = objc_msgSend(v14, "if_compactMap:", &__block_literal_global_28697);
    supportedTypes = v5->_supportedTypes;
    v5->_supportedTypes = (NSArray *)v15;

    if (![(NSArray *)v5->_supportedTypes count])
    {
      v22[0] = *MEMORY[0x1E4F44408];
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
      v18 = v5->_supportedTypes;
      v5->_supportedTypes = (NSArray *)v17;
    }
    v19 = v5;
  }

  return v5;
}

uint64_t __44__WFFilePickerParameter_initWithDefinition___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F442D8] typeWithIdentifier:a2];
}

@end