@interface WFChooseFromMenuAction
- (BOOL)ignoresOutputFromAction:(id)a3 inWorkflow:(id)a4;
- (BOOL)inputPassthrough;
- (BOOL)inputRequired;
- (WFChooseFromMenuAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5;
- (WFChooseFromMenuActionEventCoordinator)eventCoordinator;
- (WFVariableString)itemTitle;
- (id)createAccompanyingActions;
- (id)inputSourceInWorkflow:(id)a3;
- (id)localizedDefaultOutputNameWithContext:(id)a3;
- (id)localizedNameWithContext:(id)a3;
- (id)newIntermediaryActionWithMenuItemTitle:(id)a3;
- (id)serializedParameters;
- (int64_t)latestMenuChoice;
- (unint64_t)numberOfActionsIncludedWithAction:(id)a3;
- (void)arrayParameter:(id)a3 confirmDeletionOfItemAtIndex:(unint64_t)a4 withHandler:(id)a5;
- (void)arrayParameter:(id)a3 itemWasInserted:(id)a4 atIndex:(unint64_t)a5;
- (void)arrayParameter:(id)a3 itemWasMovedFromIndex:(unint64_t)a4 toIndex:(unint64_t)a5;
- (void)arrayParameter:(id)a3 itemWasUpdatedAtIndex:(unint64_t)a4 toValue:(id)a5;
- (void)initializeParameters;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setEventCoordinator:(id)a3;
- (void)setItemTitle:(id)a3;
- (void)showAlertWithInput:(id)a3;
@end

@implementation WFChooseFromMenuAction

- (WFChooseFromMenuAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[a5 mutableCopy];
  v11 = objc_msgSend(v10, "wf_popObjectForKey:", @"WFMenuItemTitle");
  uint64_t v12 = objc_opt_class();
  v13 = WFEnforceClass(v11, v12);

  v14 = objc_msgSend(v10, "wf_popObjectForKey:", @"WFMenuItemAttributedTitle");
  uint64_t v15 = objc_opt_class();
  v16 = WFEnforceClass(v14, v15);

  v22.receiver = self;
  v22.super_class = (Class)WFChooseFromMenuAction;
  v17 = [(WFControlFlowAction *)&v22 initWithIdentifier:v9 definition:v8 serializedParameters:v10];

  if (v17)
  {
    if (v16)
    {
      v18 = [[WFVariableString alloc] initWithSerializedRepresentation:v16 variableProvider:v17 parameter:0];
    }
    else
    {
      if (!v13) {
        goto LABEL_7;
      }
      v18 = [[WFVariableString alloc] initWithString:v13];
    }
    itemTitle = v17->_itemTitle;
    v17->_itemTitle = v18;

LABEL_7:
    [(WFVariableString *)v17->_itemTitle addVariableDelegate:v17];
    v20 = v17;
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_eventCoordinator);
  objc_storeStrong((id *)&self->_itemTitle, 0);
}

- (void)setEventCoordinator:(id)a3
{
}

- (WFChooseFromMenuActionEventCoordinator)eventCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventCoordinator);
  return (WFChooseFromMenuActionEventCoordinator *)WeakRetained;
}

- (WFVariableString)itemTitle
{
  return self->_itemTitle;
}

- (int64_t)latestMenuChoice
{
  return self->_latestMenuChoice;
}

- (void)arrayParameter:(id)a3 confirmDeletionOfItemAtIndex:(unint64_t)a4 withHandler:(id)a5
{
  v14 = (void (**)(id, void))a5;
  v7 = [(WFChooseFromMenuAction *)self intermediaryActions];
  unint64_t v8 = [v7 count];

  if (v8 <= a4)
  {
    v14[2](v14, 0);
  }
  else
  {
    id v9 = [(WFAction *)self workflow];
    v10 = [v9 editingDelegate];
    v11 = [(WFAction *)self workflow];
    uint64_t v12 = [(WFChooseFromMenuAction *)self intermediaryActions];
    v13 = [v12 objectAtIndexedSubscript:a4];
    [v10 workflow:v11 removeAction:v13 completionHandler:v14];
  }
}

- (void)arrayParameter:(id)a3 itemWasUpdatedAtIndex:(unint64_t)a4 toValue:(id)a5
{
  WFTitleForParameterValue(a5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = [(WFChooseFromMenuAction *)self intermediaryActions];
  unint64_t v8 = [v7 objectAtIndexedSubscript:a4];
  [v8 setItemTitle:v9];
}

- (void)arrayParameter:(id)a3 itemWasMovedFromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  id v23 = [(WFChooseFromMenuAction *)self intermediaryActions];
  if ([v23 count] > a4)
  {
    unint64_t v8 = (__PAIR128__(a5, a4) - a5) >> 64;
    if (v8 < [v23 count])
    {
      objc_super v22 = [v23 objectAtIndexedSubscript:a4];
      id v9 = [v23 objectAtIndexedSubscript:v8];
      v10 = [(WFAction *)self workflow];
      v11 = [v10 actions];

      uint64_t v12 = [v11 indexOfObject:v22];
      uint64_t v13 = [v11 indexOfObject:v9];
      unint64_t v14 = [(WFChooseFromMenuAction *)self numberOfActionsIncludedWithAction:v22];
      unint64_t v15 = [(WFChooseFromMenuAction *)self numberOfActionsIncludedWithAction:v9];
      v16 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v12, v14);
      unint64_t v17 = v15 - v14;
      if (v8 <= a4) {
        unint64_t v17 = 0;
      }
      v18 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v17 + v13, v14);
      v19 = [(WFAction *)self workflow];
      v20 = [v19 editingDelegate];
      v21 = [(WFAction *)self workflow];
      [v20 workflow:v21 moveActionsAtIndexes:v16 toIndexes:v18];
    }
  }
}

- (void)arrayParameter:(id)a3 itemWasInserted:(id)a4 atIndex:(unint64_t)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  unint64_t v8 = [(WFChooseFromMenuAction *)self intermediaryActions];
  id v9 = objc_msgSend(v8, "subarrayWithRange:", 0, a5);

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v10);
        }
        v13 += -[WFChooseFromMenuAction numberOfActionsIncludedWithAction:](self, "numberOfActionsIncludedWithAction:", *(void *)(*((void *)&v27 + 1) + 8 * i), (void)v27);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v12);
    uint64_t v16 = v13 + 1;
  }
  else
  {
    uint64_t v16 = 1;
  }

  unint64_t v17 = WFTitleForParameterValue(v7);
  id v18 = [(WFChooseFromMenuAction *)self newIntermediaryActionWithMenuItemTitle:v17];

  v19 = [(WFAction *)self workflow];
  v20 = [v19 actions];
  uint64_t v21 = v16 + [v20 indexOfObject:self];

  objc_super v22 = [(WFAction *)self workflow];
  id v23 = [v22 editingDelegate];
  v24 = [(WFAction *)self workflow];
  id v31 = v18;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v26 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v21];
  [v23 workflow:v24 insertActions:v25 atIndexes:v26];
}

- (unint64_t)numberOfActionsIncludedWithAction:(id)a3
{
  id v5 = a3;
  v6 = [(WFChooseFromMenuAction *)self intermediaryActions];
  unint64_t v7 = [v6 indexOfObject:v5];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"WFChooseFromMenuAction.m" lineNumber:197 description:@"action must be an intermediary action"];
  }
  if ([v6 count] - 1 <= v7) {
    [(WFControlFlowAction *)self groupedCloseAction];
  }
  else {
  unint64_t v8 = [v6 objectAtIndex:v7 + 1];
  }
  id v9 = [(WFAction *)self workflow];
  id v10 = [v9 actions];

  unint64_t v11 = [v10 indexOfObject:v8];
  unint64_t v12 = [v10 indexOfObject:v5];
  BOOL v13 = v11 >= v12;
  unint64_t v14 = v11 - v12;
  if (!v13)
  {
    unint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"WFChooseFromMenuAction.m" lineNumber:208 description:@"Found a fatal ordering inconsistency between the actions in the grouping cache and the workflow"];
  }
  return v14;
}

- (BOOL)ignoresOutputFromAction:(id)a3 inWorkflow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(WFControlFlowAction *)self mode]) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = [(WFAction *)self legacyBehaviorIgnoresOutputFromAction:v6 inWorkflow:v7];
  }

  return v8;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Menu Result", @"Menu Result");
  id v5 = [v3 localize:v4];

  return v5;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  if ([(WFControlFlowAction *)self mode])
  {
    self->_latestMenuChoice = -1;
    [(WFAction *)self finishRunningWithError:0];
  }
  else
  {
    [(WFChooseFromMenuAction *)self showAlertWithInput:v4];
  }
}

- (void)showAlertWithInput:(id)a3
{
  id v4 = [(WFAction *)self parameterValueForKey:@"WFMenuItems" ofClass:objc_opt_class()];
  if ([v4 count])
  {
    id v5 = [MEMORY[0x1E4F5A768] alertWithPreferredStyle:1];
    id v6 = [(WFAction *)self parameterValueForKey:@"WFMenuPrompt" ofClass:objc_opt_class()];
    if ([v6 length])
    {
      [v5 setTitle:v6];
    }
    else
    {
      id v7 = [(WFAction *)self localizedDefaultDisambiguationPrompt];
      [v5 setTitle:v7];
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __45__WFChooseFromMenuAction_showAlertWithInput___block_invoke;
    v14[3] = &unk_1E6557078;
    v14[4] = self;
    id v8 = v5;
    id v15 = v8;
    [v4 enumerateObjectsUsingBlock:v14];
    id v9 = [(WFAction *)self userInterface];
    char v10 = [v9 isRunningWithSiriUI];

    if ((v10 & 1) == 0)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __45__WFChooseFromMenuAction_showAlertWithInput___block_invoke_3;
      v13[3] = &unk_1E6558B28;
      v13[4] = self;
      unint64_t v11 = [MEMORY[0x1E4F5A770] cancelButtonWithHandler:v13];
      [v8 addButton:v11];
    }
    unint64_t v12 = [(WFAction *)self userInterface];
    [v12 presentAlert:v8];
  }
  else
  {
    self->_latestMenuChoice = -1;
    [(WFAction *)self finishRunningWithError:0];
  }
}

void __45__WFChooseFromMenuAction_showAlertWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 subtitle];
  if ([v6 length])
  {
    id v7 = [v5 subtitle];
  }
  else
  {
    id v7 = 0;
  }

  id v8 = (void *)MEMORY[0x1E4F5AA08];
  id v9 = [v5 string];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__WFChooseFromMenuAction_showAlertWithInput___block_invoke_2;
  v12[3] = &unk_1E6557050;
  v12[4] = *(void *)(a1 + 32);
  v12[5] = a3;
  char v10 = [v8 buttonWithTitle:v9 subtitle:v7 selected:0 style:0 handler:v12];

  unint64_t v11 = [v5 synonyms];
  [v10 setAlternativeSpeakableMatches:v11];

  [*(id *)(a1 + 40) addButton:v10];
}

void __45__WFChooseFromMenuAction_showAlertWithInput___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 344) = -1;
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] userCancelledError];
  [v1 finishRunningWithError:v2];
}

uint64_t __45__WFChooseFromMenuAction_showAlertWithInput___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 344) = *(void *)(a1 + 40);
  return [*(id *)(a1 + 32) finishRunningWithError:0];
}

- (id)newIntermediaryActionWithMenuItemTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(WFControlFlowAction *)self createAccompanyingActionWithMode:1];
  [v5 setItemTitle:v4];

  return v5;
}

- (id)createAccompanyingActions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(WFControlFlowAction *)self mode])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = objc_opt_new();
    id v4 = [(WFAction *)self parameterStateForKey:@"WFMenuItems"];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = objc_msgSend(v4, "values", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          char v10 = WFTitleForParameterValue(*(void **)(*((void *)&v14 + 1) + 8 * i));
          id v11 = [(WFChooseFromMenuAction *)self newIntermediaryActionWithMenuItemTitle:v10];
          [v3 addObject:v11];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    unint64_t v12 = [(WFControlFlowAction *)self createAccompanyingActionWithMode:2];
    [v3 addObject:v12];
  }
  return v3;
}

- (id)inputSourceInWorkflow:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(WFControlFlowAction *)self mode];
  if (v5 == 1)
  {
    uint64_t v6 = [(WFControlFlowAction *)self groupedOpenAction];
    goto LABEL_5;
  }
  if (!v5)
  {
    v9.receiver = self;
    v9.super_class = (Class)WFChooseFromMenuAction;
    uint64_t v6 = [(WFAction *)&v9 inputSourceInWorkflow:v4];
LABEL_5:
    uint64_t v7 = (void *)v6;
    goto LABEL_7;
  }
  uint64_t v7 = 0;
LABEL_7:

  return v7;
}

- (BOOL)inputPassthrough
{
  return 1;
}

- (BOOL)inputRequired
{
  return [(WFControlFlowAction *)self mode] != 0;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(WFControlFlowAction *)self mode];
  if (v5 == 2)
  {
    uint64_t v6 = WFLocalizedStringResourceWithKey(@"Choose From Menu - End Menu", @"End Menu");
    uint64_t v7 = [v4 localize:v6];
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    uint64_t v6 = [(WFChooseFromMenuAction *)self itemTitle];
    uint64_t v7 = [v6 stringByReplacingVariablesWithNames];
LABEL_5:
    uint64_t v8 = (void *)v7;

    goto LABEL_7;
  }
  v10.receiver = self;
  v10.super_class = (Class)WFChooseFromMenuAction;
  uint64_t v8 = [(WFAction *)&v10 localizedNameWithContext:v4];
LABEL_7:

  return v8;
}

- (void)setItemTitle:(id)a3
{
  id v11 = a3;
  int64_t v4 = [(WFControlFlowAction *)self mode];
  itemTitle = self->_itemTitle;
  if (v4 == 1)
  {
    BOOL v6 = [(WFVariableString *)itemTitle isEqual:v11];
    [(WFVariableString *)self->_itemTitle removeVariableDelegate:self];
    uint64_t v7 = (WFVariableString *)[v11 copy];
    uint64_t v8 = self->_itemTitle;
    self->_itemTitle = v7;

    [(WFVariableString *)self->_itemTitle addVariableDelegate:self];
    if (!v6) {
      [(WFAction *)self nameUpdated];
    }
  }
  else
  {
    [(WFVariableString *)itemTitle removeVariableDelegate:self];
    objc_super v9 = (WFVariableString *)[v11 copy];
    objc_super v10 = self->_itemTitle;
    self->_itemTitle = v9;

    [(WFVariableString *)self->_itemTitle addVariableDelegate:self];
  }
}

- (id)serializedParameters
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v14.receiver = self;
  v14.super_class = (Class)WFChooseFromMenuAction;
  int64_t v4 = [(WFControlFlowAction *)&v14 serializedParameters];
  int64_t v5 = (void *)[v3 initWithDictionary:v4];

  BOOL v6 = [(WFChooseFromMenuAction *)self itemTitle];
  uint64_t v7 = [v6 stringByReplacingVariablesWithNames];
  [v5 setValue:v7 forKey:@"WFMenuItemTitle"];

  uint64_t v8 = [(WFChooseFromMenuAction *)self itemTitle];
  objc_super v9 = [v8 variables];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    id v11 = [(WFChooseFromMenuAction *)self itemTitle];
    unint64_t v12 = [v11 serializedRepresentation];
    [v5 setValue:v12 forKey:@"WFMenuItemAttributedTitle"];
  }
  return v5;
}

- (void)initializeParameters
{
  v4.receiver = self;
  v4.super_class = (Class)WFChooseFromMenuAction;
  [(WFAction *)&v4 initializeParameters];
  id v3 = [(WFAction *)self parameterForKey:@"WFMenuItems"];
  [v3 addEventObserver:self];
}

@end