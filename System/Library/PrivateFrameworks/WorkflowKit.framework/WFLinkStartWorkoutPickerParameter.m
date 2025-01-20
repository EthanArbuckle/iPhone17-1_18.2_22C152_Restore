@interface WFLinkStartWorkoutPickerParameter
- (Class)singleStateClass;
- (WFLinkAction)action;
- (WFLinkStartWorkoutPickerParameter)initWithDefinition:(id)a3;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (id)localizedLabelForPossibleState:(id)a3;
- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5;
- (void)setAction:(id)a3;
@end

@implementation WFLinkStartWorkoutPickerParameter

- (void).cxx_destruct
{
}

- (void)setAction:(id)a3
{
}

- (WFLinkAction)action
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  return (WFLinkAction *)WeakRetained;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  return (id)[a3 localizedTitle];
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v11 = [(WFLinkStartWorkoutPickerParameter *)self action];
  v12 = [(WFLinkStartWorkoutPickerParameter *)self action];
  v13 = [v12 processedParameters];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __99__WFLinkStartWorkoutPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
  v15[3] = &unk_1E65500B8;
  id v14 = v10;
  id v16 = v14;
  objc_copyWeak(&v17, &location);
  [v11 getLinkActionWithProcessedParameters:v13 completionHandler:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __99__WFLinkStartWorkoutPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = [WeakRetained action];
    v6 = [v5 connection];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __99__WFLinkStartWorkoutPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2;
    v7[3] = &unk_1E65586C8;
    id v8 = *(id *)(a1 + 32);
    [v6 fetchSuggestedActionsForStartWorkoutAction:v3 completionHandler:v7];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __99__WFLinkStartWorkoutPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "if_map:", &__block_literal_global_21731);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F30570]) initWithItems:v4];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

WFLinkStartWorkoutParameterState *__99__WFLinkStartWorkoutPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[WFLinkStartWorkoutParameterState alloc] initWithLinkAction:v2];

  return v3;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  return (id)objc_msgSend(a4, "localizedTitle", a3);
}

- (WFLinkStartWorkoutPickerParameter)initWithDefinition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFLinkStartWorkoutPickerParameter;
  id v3 = [(WFEnumerationParameter *)&v7 initWithDefinition:a3];
  id v4 = v3;
  if (v3)
  {
    [(WFDynamicEnumerationParameter *)v3 setDataSource:v3];
    v5 = v4;
  }

  return v4;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end