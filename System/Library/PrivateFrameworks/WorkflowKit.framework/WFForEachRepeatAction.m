@interface WFForEachRepeatAction
- (BOOL)shouldRepeatWithVariableSource:(id)a3;
- (id)inheritedOutputContentClassesInWorkflow:(id)a3 context:(id)a4;
- (id)itemVariableName;
- (id)itemVariableNameWithScopeLevel:(unint64_t)a3;
- (id)outputVariableWithVariableProvider:(id)a3 UUIDProvider:(id)a4;
- (id)providedVariableNames;
- (id)repeatCollectionWithVariableSource:(id)a3;
- (unint64_t)numberOfLoops;
- (void)resetEvaluationCriteriaWithVariableSource:(id)a3;
- (void)runWithInput:(id)a3 error:(id *)a4;
- (void)setRepeatCollection:(id)a3 withVariableSource:(id)a4;
@end

@implementation WFForEachRepeatAction

- (unint64_t)numberOfLoops
{
  return self->_numberOfLoops;
}

- (id)providedVariableNames
{
  if ([(WFControlFlowAction *)self mode])
  {
    v3 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)WFForEachRepeatAction;
    v4 = [(WFRepeatAction *)&v7 providedVariableNames];
    v5 = [(WFForEachRepeatAction *)self itemVariableName];
    v3 = [v4 arrayByAddingObject:v5];
  }
  return v3;
}

- (id)itemVariableNameWithScopeLevel:(unint64_t)a3
{
  if (a3 == 1)
  {
    v4 = @"Repeat Item";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Repeat Item %lu", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)itemVariableName
{
  uint64_t v3 = [(WFAction *)self workflow];
  v4 = [v3 variableAvailability];
  v5 = [(WFAction *)self groupingIdentifier];
  v6 = -[WFForEachRepeatAction itemVariableNameWithScopeLevel:](self, "itemVariableNameWithScopeLevel:", [v4 variableScopeLevelForGroupingIdentifier:v5]);

  return v6;
}

- (id)inheritedOutputContentClassesInWorkflow:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(WFControlFlowAction *)self mode])
  {
    v14.receiver = self;
    v14.super_class = (Class)WFForEachRepeatAction;
    v8 = [(WFControlFlowAction *)&v14 inheritedOutputContentClassesInWorkflow:v6 context:v7];
  }
  else if ([v7 containsObject:self])
  {
    v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    [v7 addObject:self];
    v9 = [(WFAction *)self inputParameterKey];
    v10 = [(WFAction *)self parameterStateForKey:v9];

    v11 = [v10 variable];
    v12 = [v11 possibleAggrandizedContentClassesWithContext:v7];
    v8 = [v12 array];
  }
  return v8;
}

- (id)outputVariableWithVariableProvider:(id)a3 UUIDProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(WFControlFlowAction *)self mode])
  {
    v12.receiver = self;
    v12.super_class = (Class)WFForEachRepeatAction;
    v8 = [(WFAction *)&v12 outputVariableWithVariableProvider:v6 UUIDProvider:v7];
  }
  else
  {
    v9 = [WFUserDefinedVariable alloc];
    v10 = [(WFForEachRepeatAction *)self itemVariableName];
    v8 = [(WFUserDefinedVariable *)v9 initWithName:v10 variableProvider:v6 aggrandizements:0];
  }
  return v8;
}

- (void)runWithInput:(id)a3 error:(id *)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)WFForEachRepeatAction;
  [(WFRepeatAction *)&v30 runWithInput:v6 error:a4];
  id v7 = [(WFAction *)self variableSource];
  int64_t v8 = [(WFControlFlowAction *)self mode];
  if (v8 == 2)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v17 = objc_msgSend(v6, "items", 0);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v26 + 1) + 8 * v21);
          v23 = [(WFAction *)self output];
          [v23 addItem:v22];

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v19);
    }

    v11 = [(WFControlFlowAction *)self controlFlowTracker];
    [v11 leftScopeOfControlFlowAction:self];
    goto LABEL_15;
  }
  if (v8) {
    goto LABEL_16;
  }
  v9 = [(WFForEachRepeatAction *)self repeatCollectionWithVariableSource:v7];

  if (!v9)
  {
    [(WFForEachRepeatAction *)self setRepeatCollection:v6 withVariableSource:v7];
    self->_numberOfLoops = [v6 numberOfItems];
    v10 = [(WFControlFlowAction *)self controlFlowTracker];
    [v10 enteredScopeOfControlFlowAction:self withInput:v6];
  }
  v11 = [(WFForEachRepeatAction *)self repeatCollectionWithVariableSource:v7];
  objc_super v12 = [v11 items];
  v13 = [v12 firstObject];

  if (v13)
  {
    objc_super v14 = (void *)MEMORY[0x1E4F5A830];
    v32[0] = v13;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    v16 = [v14 collectionWithItems:v15];
    [(WFAction *)self setOutput:v16];

    [v11 removeItem:v13];
LABEL_15:

LABEL_16:
    v11 = [(WFForEachRepeatAction *)self itemVariableName];
    if (v11)
    {
      v24 = [(WFAction *)self variableSource];
      v25 = [(WFAction *)self output];
      [v24 setContent:v25 forVariableWithName:v11];
    }
    goto LABEL_18;
  }
  if (a4)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFActionErrorDomain" code:0 userInfo:0];
  }
LABEL_18:
}

- (id)repeatCollectionWithVariableSource:(id)a3
{
  id v4 = a3;
  v5 = [(WFAction *)self groupingIdentifier];
  id v6 = [v5 stringByAppendingString:@"-collection"];
  id v7 = [v4 contentForVariableWithName:v6];

  return v7;
}

- (void)setRepeatCollection:(id)a3 withVariableSource:(id)a4
{
  id v6 = a4;
  id v9 = (id)[a3 copy];
  id v7 = [(WFAction *)self groupingIdentifier];
  int64_t v8 = [v7 stringByAppendingString:@"-collection"];
  [v6 setContent:v9 forVariableWithName:v8];
}

- (void)resetEvaluationCriteriaWithVariableSource:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFForEachRepeatAction;
  id v4 = a3;
  [(WFRepeatAction *)&v5 resetEvaluationCriteriaWithVariableSource:v4];
  -[WFForEachRepeatAction setRepeatCollection:withVariableSource:](self, "setRepeatCollection:withVariableSource:", 0, v4, v5.receiver, v5.super_class);
}

- (BOOL)shouldRepeatWithVariableSource:(id)a3
{
  id v5 = a3;
  if ([(WFControlFlowAction *)self mode])
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"WFForEachRepeatAction.m" lineNumber:22 description:@"Only open action can determine control flow"];
  }
  id v6 = [(WFForEachRepeatAction *)self repeatCollectionWithVariableSource:v5];
  BOOL v7 = [v6 numberOfItems] > 0;

  return v7;
}

@end