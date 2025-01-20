@interface WFFiniteRepeatAction
- (BOOL)shouldRepeatWithVariableSource:(id)a3;
- (id)outputVariableWithVariableProvider:(id)a3 UUIDProvider:(id)a4;
- (id)repeatCountVariableName;
- (id)repeatInputVariableName;
- (id)repeatInputWithVariableSource:(id)a3;
- (int64_t)repeatCountWithVariableSource:(id)a3;
- (unint64_t)numberOfLoops;
- (void)resetEvaluationCriteriaWithVariableSource:(id)a3;
- (void)runWithInput:(id)a3 error:(id *)a4;
- (void)runWithInput:(id)a3 userInterface:(id)a4 runningDelegate:(id)a5 variableSource:(id)a6 workQueue:(id)a7 completionHandler:(id)a8;
- (void)setRepeatCount:(int64_t)a3 withVariableSource:(id)a4;
- (void)setRepeatInput:(id)a3 withVariableSource:(id)a4;
@end

@implementation WFFiniteRepeatAction

- (unint64_t)numberOfLoops
{
  return self->_numberOfLoops;
}

- (void)runWithInput:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WFFiniteRepeatAction;
  [(WFRepeatAction *)&v24 runWithInput:v6 error:a4];
  v7 = [(WFAction *)self variableSource];
  int64_t v8 = [(WFControlFlowAction *)self mode];
  if (v8 == 2)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v13 = objc_msgSend(v6, "items", 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          v19 = [(WFAction *)self output];
          [v19 addItem:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v15);
    }
  }
  else if (!v8)
  {
    v9 = [(WFFiniteRepeatAction *)self repeatInputWithVariableSource:v7];

    if (v9)
    {
LABEL_6:
      v12 = [(WFFiniteRepeatAction *)self repeatInputWithVariableSource:v7];
      [(WFAction *)self setOutput:v12];

      [(WFFiniteRepeatAction *)self setRepeatCount:[(WFFiniteRepeatAction *)self repeatCountWithVariableSource:v7] - 1 withVariableSource:v7];
      goto LABEL_15;
    }
    v10 = [(WFAction *)self parameterValueForKey:@"WFRepeatCount" ofClass:objc_opt_class()];
    unint64_t v11 = [v10 integerValue];

    if (v11)
    {
      [(WFFiniteRepeatAction *)self setRepeatInput:v6 withVariableSource:v7];
      [(WFFiniteRepeatAction *)self setRepeatCount:v11 withVariableSource:v7];
      self->_numberOfLoops = v11;
      goto LABEL_6;
    }
    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFActionErrorDomain" code:0 userInfo:0];
    }
  }
LABEL_15:
}

- (int64_t)repeatCountWithVariableSource:(id)a3
{
  id v4 = a3;
  v5 = [(WFFiniteRepeatAction *)self repeatCountVariableName];
  id v6 = [v4 contentForVariableWithName:v5];

  v7 = [v6 items];
  int64_t v8 = [v7 firstObject];
  v9 = [v8 number];
  int64_t v10 = [v9 integerValue];

  return v10;
}

- (void)setRepeatCount:(int64_t)a3 withVariableSource:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  if (a3)
  {
    int64_t v10 = (void *)MEMORY[0x1E4F5A830];
    unint64_t v11 = (void *)MEMORY[0x1E4F5A848];
    id v4 = [NSNumber numberWithInteger:a3];
    v5 = [v11 itemWithObject:v4];
    v14[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    v12 = [v10 collectionWithItems:v6];
  }
  else
  {
    v12 = 0;
  }
  v13 = [(WFFiniteRepeatAction *)self repeatCountVariableName];
  [v9 setContent:v12 forVariableWithName:v13];

  if (a3)
  {
  }
}

- (id)repeatInputWithVariableSource:(id)a3
{
  id v4 = a3;
  v5 = [(WFFiniteRepeatAction *)self repeatInputVariableName];
  id v6 = [v4 contentForVariableWithName:v5];

  return v6;
}

- (void)setRepeatInput:(id)a3 withVariableSource:(id)a4
{
  id v6 = a4;
  id v8 = (id)[a3 copy];
  v7 = [(WFFiniteRepeatAction *)self repeatInputVariableName];
  [v6 setContent:v8 forVariableWithName:v7];
}

- (id)repeatCountVariableName
{
  v2 = [(WFAction *)self groupingIdentifier];
  v3 = [v2 stringByAppendingString:@"-count"];

  return v3;
}

- (id)repeatInputVariableName
{
  v2 = [(WFAction *)self groupingIdentifier];
  v3 = [v2 stringByAppendingString:@"-input"];

  return v3;
}

- (id)outputVariableWithVariableProvider:(id)a3 UUIDProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(WFControlFlowAction *)self mode] == 2)
  {
    v10.receiver = self;
    v10.super_class = (Class)WFFiniteRepeatAction;
    id v8 = [(WFAction *)&v10 outputVariableWithVariableProvider:v6 UUIDProvider:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)runWithInput:(id)a3 userInterface:(id)a4 runningDelegate:(id)a5 variableSource:(id)a6 workQueue:(id)a7 completionHandler:(id)a8
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (![(WFControlFlowAction *)self mode])
  {
    long long v20 = [(WFAction *)self processedParameters];

    if (!v20)
    {
      v27 = [(WFFiniteRepeatAction *)self repeatCountVariableName];
      long long v21 = [v17 contentForVariableWithName:v27];
      long long v22 = [v21 items];
      long long v23 = [v22 firstObject];

      objc_super v24 = v23;
      if (v23)
      {
        v29 = @"WFRepeatCount";
        v25 = [v23 number];
        v30[0] = v25;
        uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
        [(WFAction *)self setProcessedParameters:v26];
      }
    }
  }
  v28.receiver = self;
  v28.super_class = (Class)WFFiniteRepeatAction;
  [(WFAction *)&v28 runWithInput:v14 userInterface:v15 runningDelegate:v16 variableSource:v17 workQueue:v18 completionHandler:v19];
}

- (void)resetEvaluationCriteriaWithVariableSource:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFFiniteRepeatAction;
  id v4 = a3;
  [(WFRepeatAction *)&v5 resetEvaluationCriteriaWithVariableSource:v4];
  -[WFFiniteRepeatAction setRepeatInput:withVariableSource:](self, "setRepeatInput:withVariableSource:", 0, v4, v5.receiver, v5.super_class);
  [(WFFiniteRepeatAction *)self setRepeatCount:0 withVariableSource:v4];
}

- (BOOL)shouldRepeatWithVariableSource:(id)a3
{
  id v5 = a3;
  if ([(WFControlFlowAction *)self mode])
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"WFFiniteRepeatAction.m" lineNumber:23 description:@"Only open action can determine control flow"];
  }
  BOOL v6 = [(WFFiniteRepeatAction *)self repeatCountWithVariableSource:v5] > 0;

  return v6;
}

@end