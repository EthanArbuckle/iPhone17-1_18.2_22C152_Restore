@interface WFInputAction
+ (id)inputActionForWorkflow:(id)a3;
+ (id)serializedParametersForWorkflow:(id)a3;
+ (id)serializedParametersFromActionSerializedParameters:(id)a3 itemClass:(Class)a4;
- (BOOL)isDeletable;
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (NSSet)inputSurfaces;
- (WFInputAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5;
- (id)actionSerializedParametersForSelectionOfItemClass:(Class)a3;
- (id)minimumSupportedClientVersion;
- (id)noInputBehavior;
- (id)selectedAskForType;
- (id)selectedBehavior;
- (id)selectedInputTypes;
- (void)removedFromWorkflow;
- (void)setInputSurfaces:(id)a3;
- (void)updateWorkflowState;
@end

@implementation WFInputAction

- (void).cxx_destruct
{
}

- (void)setInputSurfaces:(id)a3
{
}

- (NSSet)inputSurfaces
{
  return self->_inputSurfaces;
}

- (id)noInputBehavior
{
  v3 = [(WFInputAction *)self selectedBehavior];
  if ([v3 isEqualToString:@"Continue"]) {
    goto LABEL_2;
  }
  if ([v3 isEqualToString:@"Ask For"])
  {
    v5 = [(WFInputAction *)self selectedAskForType];
    id v6 = WFInputActionContentItemClassCorrespondingToAskForParameterValue(v5);
    if (v6)
    {
      id v7 = v6;
      v8 = [WFWorkflowNoInputBehaviorAskForInput alloc];
      v9 = [(WFInputAction *)self actionSerializedParametersForSelectionOfItemClass:v7];
      v4 = [(WFWorkflowNoInputBehaviorAskForInput *)v8 initWithContentItemClass:v7 serializedParameters:v9];
    }
    else
    {
      v4 = 0;
    }
    goto LABEL_11;
  }
  if ([v3 isEqualToString:@"Stop and Respond"])
  {
    v5 = [(WFAction *)self parameterStateForKey:@"WFStopAndRespondResponse"];
    v10 = [WFWorkflowNoInputBehaviorShowError alloc];
    v11 = [v5 variableString];
    v12 = [v11 stringByRemovingVariables];
    v4 = [(WFWorkflowNoInputBehaviorShowError *)v10 initWithErrorString:v12];

LABEL_11:
    goto LABEL_12;
  }
  if (![v3 isEqualToString:@"Get Clipboard"])
  {
LABEL_2:
    v4 = 0;
    goto LABEL_12;
  }
  v4 = objc_alloc_init(WFWorkflowNoInputBehaviorGetClipboard);
LABEL_12:

  return v4;
}

- (id)actionSerializedParametersForSelectionOfItemClass:(Class)a3
{
  if (a3)
  {
    v4 = WFInputActionParameterKeysForSelectingItemOfClass(a3);
    v5 = objc_opt_new();
    id v6 = [(WFAction *)self serializedParameters];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__WFInputAction_actionSerializedParametersForSelectionOfItemClass___block_invoke;
    v13[3] = &unk_1E654E390;
    id v14 = v4;
    id v15 = v5;
    id v7 = v5;
    id v8 = v4;
    [v6 enumerateKeysAndObjectsUsingBlock:v13];

    v9 = (void *)[v7 copy];
  }
  else
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFInputAction.m", 357, @"Invalid parameter not satisfying: %@", @"contentItemClass" object file lineNumber description];

    v9 = 0;
  }
  return v9;
}

void __67__WFInputAction_actionSerializedParametersForSelectionOfItemClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v6]) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
  }
}

- (id)selectedInputTypes
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(WFAction *)self parameterStateForKey:@"WFInputType"];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v3 = v2;
    }
    else {
      v3 = 0;
    }
    id v4 = v3;

    id v5 = v2;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    if (v4)
    {
      id v8 = [v4 value];
      v12[0] = NSClassFromString(v8);
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

      goto LABEL_12;
    }
  }
  else
  {
    id v7 = 0;
  }
  v10 = [v7 parameterStates];
  v9 = objc_msgSend(v10, "if_map:", &__block_literal_global_7843);

  id v5 = 0;
LABEL_12:

  return v9;
}

id __35__WFInputAction_selectedInputTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v3 = v2;
    }
    else {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }
  id v4 = v3;
  id v5 = [v4 value];

  id v6 = NSClassFromString(v5);

  return v6;
}

- (id)selectedAskForType
{
  v3 = [(WFInputAction *)self selectedBehavior];
  int v4 = [v3 isEqualToString:@"Ask For"];

  if (v4)
  {
    id v5 = [(WFAction *)self parameterStateForKey:@"WFAskForType"];
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v6 = v5;
      }
      else {
        id v6 = 0;
      }
    }
    else
    {
      id v6 = 0;
    }
    id v8 = v6;

    id v7 = [v8 value];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)selectedBehavior
{
  id v2 = [(WFAction *)self parameterStateForKey:@"WFNoInputBehavior"];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v3 = v2;
    }
    else {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }
  id v4 = v3;

  id v5 = [v4 value];

  return v5;
}

- (id)minimumSupportedClientVersion
{
  v3 = [(WFAction *)self parameterStateForKey:@"WFNoInputBehavior"];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 value];

  LOBYTE(v5) = [v6 isEqualToString:@"Continue"];
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)WFInputAction;
    id v7 = [(WFAction *)&v10 minimumSupportedClientVersion];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFInputAction;
    id v8 = [(WFAction *)&v11 minimumSupportedClientVersion];
    id v7 = WFMaximumBundleVersion(v8, @"1113");
  }
  return v7;
}

- (void)removedFromWorkflow
{
  v3 = [(WFAction *)self workflow];
  [v3 setNoInputBehavior:0];

  id v4 = [(WFAction *)self workflow];
  [v4 save];
}

- (void)updateWorkflowState
{
  v3 = [(WFInputAction *)self noInputBehavior];
  id v4 = [(WFAction *)self workflow];
  [v4 setNoInputBehavior:v3];

  id v5 = [(WFInputAction *)self selectedInputTypes];
  id v6 = [(WFAction *)self workflow];
  [v6 setInputClasses:v5];

  id v7 = [(WFAction *)self workflow];
  [v7 save];
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)WFInputAction;
  BOOL v5 = [(WFAction *)&v7 setParameterState:a3 forKey:a4];
  if (v5) {
    [(WFInputAction *)self updateWorkflowState];
  }
  return v5;
}

- (BOOL)isDeletable
{
  return 0;
}

- (WFInputAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (WFActionDefinition *)a4;
  id v10 = a5;
  if (!v9)
  {
    objc_super v11 = [WFActionDefinition alloc];
    v9 = [(WFActionDefinition *)v11 initWithDictionary:MEMORY[0x1E4F1CC08]];
  }
  v12 = [(WFActionDefinition *)v9 objectForKey:@"WFContentSelectionParametersAreInjected"];
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  id v14 = v13;

  char v15 = [v14 BOOLValue];
  if ((v15 & 1) == 0)
  {
    v16 = WFContentSelectionActionParameterDefinitions();
    v17 = [(WFActionDefinition *)v9 objectForKey:@"Parameters"];
    if (v17)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v18 = v17;
      }
      else {
        v18 = 0;
      }
    }
    else
    {
      v18 = 0;
    }
    id v19 = v18;

    v20 = [v19 arrayByAddingObjectsFromArray:v16];

    v26[0] = @"Parameters";
    v26[1] = @"WFContentSelectionParametersAreInjected";
    v27[0] = v20;
    v27[1] = MEMORY[0x1E4F1CC38];
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
    uint64_t v22 = [(WFActionDefinition *)v9 definitionByAddingEntriesInDictionary:v21];

    v9 = (WFActionDefinition *)v22;
  }
  v25.receiver = self;
  v25.super_class = (Class)WFInputAction;
  v23 = [(WFAction *)&v25 initWithIdentifier:v8 definition:v9 serializedParameters:v10];

  return v23;
}

+ (id)serializedParametersForWorkflow:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, a1, @"WFInputAction.m", 399, @"Invalid parameter not satisfying: %@", @"workflow" object file lineNumber description];
  }
  id v6 = objc_opt_new();
  objc_super v7 = [v5 inputClasses];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = [v5 inputClasses];
    id v10 = objc_msgSend(v9, "if_map:", &__block_literal_global_258);
    [v6 setObject:v10 forKeyedSubscript:@"WFInputType"];
  }
  else
  {
    [v6 setObject:MEMORY[0x1E4F1CBF0] forKeyedSubscript:@"WFInputType"];
  }
  id v11 = v5;
  if (!v5)
  {
    v44 = [MEMORY[0x1E4F28B00] currentHandler];
    v45 = [NSString stringWithUTF8String:"NSString * _Nullable WFDescribeWorkflowInputSurfaces(WFWorkflow * _Nonnull __strong)"];
    [v44 handleFailureInFunction:v45, @"WFInputAction.m", 53, @"Invalid parameter not satisfying: %@", @"workflow" file lineNumber description];
  }
  v12 = objc_opt_new();
  v13 = [v11 workflowTypes];
  int v14 = [v13 containsObject:*MEMORY[0x1E4FB4FB8]];

  if (v14)
  {
    char v15 = WFLocalizedString(@"Share Sheet");
    [v12 addObject:v15];
  }
  v16 = [v11 workflowTypes];
  int v17 = [v16 containsObject:*MEMORY[0x1E4FB4FA8]];

  if (v17)
  {
    v18 = WFLocalizedString(@"Quick Actions");
    [v12 addObject:v18];
  }
  id v19 = [v11 workflowTypes];
  int v20 = [v19 containsObject:*MEMORY[0x1E4FB4FB0]];

  if (v20)
  {
    v21 = WFLocalizedString(@"What’s On Screen");
    [v12 addObject:v21];
  }
  if ([v12 count])
  {
    uint64_t v22 = [v12 componentsJoinedByString:@", "];
  }
  else
  {
    uint64_t v22 = 0;
  }

  if (v22) {
    [v6 setObject:v22 forKeyedSubscript:@"WFInputSurface"];
  }
  id v23 = [v11 noInputBehavior];
  if (!v23) {
    goto LABEL_39;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v24 = v23;
  }
  else {
    v24 = 0;
  }
  id v25 = v24;

  id v26 = v23;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v27 = v26;
  }
  else {
    v27 = 0;
  }
  id v28 = v27;

  id v29 = v26;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v30 = v29;
  }
  else {
    v30 = 0;
  }
  id v31 = v30;

  if (v25)
  {
    [v6 setObject:@"Stop and Respond" forKeyedSubscript:@"WFNoInputBehavior"];
    v32 = [v25 errorString];
    if (v32) {
      [v6 setObject:v32 forKeyedSubscript:@"WFStopAndRespondResponse"];
    }
    v33 = (void *)[v6 copy];

    v34 = v29;
    goto LABEL_60;
  }
  if (!v28)
  {
    if (v31)
    {
      v38 = @"Get Clipboard";
LABEL_40:
      [v6 setObject:v38 forKeyedSubscript:@"WFNoInputBehavior"];
      v33 = (void *)[v6 copy];
      v34 = 0;
      id v28 = 0;
      id v31 = v29;
      goto LABEL_60;
    }
LABEL_39:
    id v29 = 0;
    v38 = @"Continue";
    goto LABEL_40;
  }
  [v6 setObject:@"Ask For" forKeyedSubscript:@"WFNoInputBehavior"];
  v35 = (void *)[v28 contentItemClass];
  if (v35)
  {
    v36 = v35;
    if ([v35 isEqual:objc_opt_class()])
    {
      v37 = @"Files";
    }
    else if ([v36 isEqual:objc_opt_class()])
    {
      v37 = @"Text";
    }
    else if ([v36 isEqual:objc_opt_class()])
    {
      v37 = @"Date";
    }
    else if ([v36 isEqual:objc_opt_class()])
    {
      v37 = @"Photos";
    }
    else if ([v36 isEqual:objc_opt_class()])
    {
      v37 = @"Contacts";
    }
    else if ([v36 isEqual:objc_opt_class()])
    {
      v37 = @"Email Address";
    }
    else if ([v36 isEqual:objc_opt_class()])
    {
      v37 = @"Music";
    }
    else if ([v36 isEqual:objc_opt_class()])
    {
      v37 = @"Phone Number";
    }
    else
    {
      v37 = 0;
    }
    [v6 setObject:v37 forKeyedSubscript:@"WFAskForType"];
    v39 = [v28 serializedParameters];
    if (v39)
    {
      v40 = +[WFInputAction serializedParametersFromActionSerializedParameters:v39 itemClass:v36];
      uint64_t v41 = objc_msgSend(v6, "if_dictionaryByAddingEntriesFromDictionary:", v40);

      id v6 = (void *)v41;
    }
  }
  v33 = (void *)[v6 copy];
  v34 = 0;
  id v28 = v29;
LABEL_60:

  return v33;
}

NSString *__49__WFInputAction_serializedParametersForWorkflow___block_invoke(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

+ (id)serializedParametersFromActionSerializedParameters:(id)a3 itemClass:(Class)a4
{
  id v7 = a3;
  uint64_t v8 = v7;
  if (a4)
  {
    if (v7)
    {
LABEL_3:
      v9 = WFInputActionParameterKeysForSelectingItemOfClass(a4);
      id v10 = objc_opt_new();
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __78__WFInputAction_serializedParametersFromActionSerializedParameters_itemClass___block_invoke;
      v16[3] = &unk_1E654E390;
      id v17 = v9;
      id v18 = v10;
      id v11 = v10;
      id v12 = v9;
      [v8 enumerateKeysAndObjectsUsingBlock:v16];
      v13 = (void *)[v11 copy];

      goto LABEL_6;
    }
  }
  else
  {
    int v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"WFInputAction.m", 378, @"Invalid parameter not satisfying: %@", @"contentItemClass" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  v13 = 0;
LABEL_6:

  return v13;
}

void __78__WFInputAction_serializedParametersFromActionSerializedParameters_itemClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v6]) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
  }
}

+ (id)inputActionForWorkflow:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    int v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"WFInputAction.m", 253, @"Invalid parameter not satisfying: %@", @"workflow" object file lineNumber description];
  }
  id v6 = [a1 serializedParametersForWorkflow:v5];
  id v7 = +[WFActionRegistry sharedRegistry];
  uint64_t v8 = [v7 createActionWithIdentifier:@"is.workflow.actions.input" serializedParameters:v6];

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    id v10 = [v5 workflowTypes];
    id v11 = [v9 setWithArray:v10];
    [v8 setInputSurfaces:v11];

    [v8 willBeAddedToWorkflow:v5];
    [v8 wasAddedToWorkflow:v5];
    id v12 = v8;
  }

  return v8;
}

@end