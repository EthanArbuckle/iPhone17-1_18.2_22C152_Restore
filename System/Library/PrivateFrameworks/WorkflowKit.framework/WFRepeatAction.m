@interface WFRepeatAction
- (BOOL)displaysParameterSummary;
- (BOOL)ignoresOutputFromAction:(id)a3 inWorkflow:(id)a4;
- (BOOL)outputsMultipleItems;
- (BOOL)shouldRepeatWithVariableSource:(id)a3;
- (id)createAccompanyingActions;
- (id)indexVariableName;
- (id)indexVariableNameWithScopeLevel:(unint64_t)a3;
- (id)itemVariableNameWithScopeLevel:(unint64_t)a3;
- (id)localizedDefaultOutputNameWithContext:(id)a3;
- (id)localizedNameWithContext:(id)a3;
- (id)providedVariableNames;
- (int64_t)currentIndex;
- (unint64_t)numberOfLoops;
- (void)resetEvaluationCriteriaWithVariableSource:(id)a3;
- (void)runWithInput:(id)a3 error:(id *)a4;
@end

@implementation WFRepeatAction

- (int64_t)currentIndex
{
  return self->_currentIndex;
}

- (id)providedVariableNames
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([(WFControlFlowAction *)self mode])
  {
    v3 = 0;
  }
  else
  {
    v4 = [(WFRepeatAction *)self indexVariableName];
    v6[0] = v4;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  return v3;
}

- (id)itemVariableNameWithScopeLevel:(unint64_t)a3
{
  return 0;
}

- (id)indexVariableNameWithScopeLevel:(unint64_t)a3
{
  if (a3 == 1)
  {
    v4 = @"Repeat Index";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Repeat Index %lu", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)indexVariableName
{
  uint64_t v3 = [(WFAction *)self workflow];
  v4 = [v3 variableAvailability];
  v5 = [(WFAction *)self groupingIdentifier];
  v6 = -[WFRepeatAction indexVariableNameWithScopeLevel:](self, "indexVariableNameWithScopeLevel:", [v4 variableScopeLevelForGroupingIdentifier:v5]);

  return v6;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Repeat Results", @"Repeat Results");
  v5 = [v3 localize:v4];

  return v5;
}

- (BOOL)ignoresOutputFromAction:(id)a3 inWorkflow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(WFControlFlowAction *)self mode])
  {
    unsigned __int8 v8 = v6 == 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFRepeatAction;
    unsigned __int8 v8 = [(WFAction *)&v10 ignoresOutputFromAction:v6 inWorkflow:v7];
  }

  return v8;
}

- (void)runWithInput:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v5 = [(WFRepeatAction *)self indexVariableName];
  if (v5 && ![(WFControlFlowAction *)self mode])
  {
    id v6 = [(WFAction *)self variableSource];
    id v7 = [v6 contentForVariableWithName:v5];
    unsigned __int8 v8 = [v7 items];
    v9 = [v8 firstObject];
    objc_super v10 = [v9 number];
    uint64_t v11 = [v10 integerValue];

    v12 = [(WFAction *)self variableSource];
    v13 = (void *)MEMORY[0x1E4F5A830];
    v14 = (void *)MEMORY[0x1E4F5A848];
    v15 = [NSNumber numberWithInteger:v11 + 1];
    v16 = [v14 itemWithObject:v15];
    v19[0] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    v18 = [v13 collectionWithItems:v17];
    [v12 setContent:v18 forVariableWithName:v5];
  }
}

- (unint64_t)numberOfLoops
{
  return 0;
}

- (void)resetEvaluationCriteriaWithVariableSource:(id)a3
{
  id v4 = a3;
  id v5 = [(WFRepeatAction *)self indexVariableName];
  [v4 setContent:0 forVariableWithName:v5];
}

- (BOOL)outputsMultipleItems
{
  if ([(WFControlFlowAction *)self mode] == 2) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)WFRepeatAction;
  return [(WFControlFlowAction *)&v4 inputTypePassthrough];
}

- (BOOL)shouldRepeatWithVariableSource:(id)a3
{
  return 0;
}

- (id)createAccompanyingActions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([(WFControlFlowAction *)self mode])
  {
    v6.receiver = self;
    v6.super_class = (Class)WFRepeatAction;
    id v3 = [(WFAction *)&v6 createAccompanyingActions];
  }
  else
  {
    objc_super v4 = [(WFControlFlowAction *)self createAccompanyingActionWithMode:2];
    v7[0] = v4;
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  return v3;
}

- (BOOL)displaysParameterSummary
{
  return [(WFControlFlowAction *)self mode] != 2;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4 = a3;
  if ([(WFControlFlowAction *)self mode] == 2)
  {
    id v5 = WFLocalizedStringResourceWithKey(@"WFRepeatAction - End Repeat", @"End Repeat");
    objc_super v6 = [v4 localize:v5];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFRepeatAction;
    objc_super v6 = [(WFAction *)&v8 localizedNameWithContext:v4];
  }

  return v6;
}

@end