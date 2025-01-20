@interface WFOutputAction
- (BOOL)getInputContentFromVariablesInParameterState:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (BOOL)hasOutputFallback;
- (BOOL)outputSurfaceIsAvailable;
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (id)inheritedOutputContentClassesInWorkflow:(id)a3 context:(id)a4;
- (id)outputContentClasses;
- (id)outputVariableString;
- (id)runSource;
- (id)runningContext;
- (unint64_t)outputBehavior;
- (void)finishRunningWithOutput:(id)a3 error:(id)a4;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFOutputAction

- (id)outputContentClasses
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [(WFOutputAction *)self outputVariableString];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 variables];
    uint64_t v5 = [v4 count];
    v6 = [v3 stringsAndVariables];
    uint64_t v7 = [v6 count];

    if (v5 == v7)
    {
      v8 = objc_opt_new();
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      v9 = objc_msgSend(v3, "variables", 0);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = [*(id *)(*((void *)&v17 + 1) + 8 * i) possibleAggrandizedContentClasses];
            [v8 unionOrderedSet:v14];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
        }
        while (v11);
      }

      v15 = [v8 array];
    }
    else
    {
      uint64_t v21 = objc_opt_class();
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v15;
}

- (BOOL)getInputContentFromVariablesInParameterState:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (WFGetVariableInputContentForPreviewing(v8, v9, v10))
  {
    BOOL v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFOutputAction;
    BOOL v11 = [(WFAction *)&v13 getInputContentFromVariablesInParameterState:v8 context:v9 completionHandler:v10];
  }

  return v11;
}

- (id)outputVariableString
{
  v2 = [(WFAction *)self parameterStateForKey:@"WFOutput"];
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

  uint64_t v5 = [v4 variableString];

  return v5;
}

- (id)inheritedOutputContentClassesInWorkflow:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 containsObject:self])
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    [v7 addObject:self];
    v10.receiver = self;
    v10.super_class = (Class)WFOutputAction;
    id v8 = [(WFAction *)&v10 inheritedOutputContentClassesInWorkflow:v6 context:v7];
  }

  return v8;
}

- (BOOL)hasOutputFallback
{
  v2 = [(WFAction *)self parameterStateForKey:@"WFNoOutputSurfaceBehavior"];
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

  uint64_t v5 = [v4 value];

  LOBYTE(v4) = [v5 isEqualToString:@"Do Nothing"] ^ 1;
  return (char)v4;
}

- (id)runningContext
{
  v3 = [(WFAction *)self runningDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(WFAction *)self runningDelegate];
    id v6 = [v5 currentRunningContextForAction:self];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)runSource
{
  v2 = [(WFOutputAction *)self runningContext];
  v3 = [v2 runSource];
  char v4 = v3;
  if (!v3) {
    v3 = (void *)*MEMORY[0x1E4FB4F90];
  }
  id v5 = v3;

  return v5;
}

- (unint64_t)outputBehavior
{
  v2 = [(WFOutputAction *)self runningContext];
  v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 outputBehavior];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)outputSurfaceIsAvailable
{
  v3 = [(WFOutputAction *)self runSource];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4FB4F58]];

  return (v4 & 1) != 0 || [(WFOutputAction *)self outputBehavior] != 1;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WFOutputAction;
  BOOL v7 = [(WFAction *)&v16 setParameterState:a3 forKey:v6];
  if (v7)
  {
    id v8 = [(WFAction *)self parameterStateForKey:@"WFResponse"];
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
    id v10 = v9;

    int v11 = [v6 isEqualToString:@"WFNoOutputSurfaceBehavior"];
    uint64_t v12 = [v10 variableString];

    int v13 = [v12 isEmpty];
    if (v11 && v13)
    {
      v14 = [(WFAction *)self parameterStateForKey:@"WFOutput"];
      [(WFOutputAction *)self setParameterState:v14 forKey:@"WFResponse"];
    }
  }

  return v7;
}

- (void)finishRunningWithOutput:(id)a3 error:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    [(WFAction *)self finishRunningWithError:a4];
  }
  else
  {
    [(WFAction *)self setOutput:a3];
    id v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28588];
    id v6 = WFLocalizedString(@"User requested shortcut exit.");
    v10[0] = v6;
    BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v8 = [v5 errorWithDomain:@"WFActionErrorDomain" code:4 userInfo:v7];

    [(WFAction *)self finishRunningWithError:v8];
  }
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAction *)self parameterValueForKey:@"WFNoOutputSurfaceBehavior" ofClass:objc_opt_class()];
  if ([(WFOutputAction *)self outputSurfaceIsAvailable]
    || ![v4 numberOfItems])
  {
    id v8 = self;
    id v9 = v4;
  }
  else
  {
    if ([v5 isEqualToString:@"Respond"])
    {
      id v6 = [(WFAction *)self parameterValueForKey:@"WFResponse" ofClass:objc_opt_class()];
      if (!v6)
      {
        [(WFOutputAction *)self finishRunningWithOutput:0 error:0];
        goto LABEL_13;
      }
      BOOL v7 = [(WFAction *)self userInterface];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __45__WFOutputAction_runAsynchronouslyWithInput___block_invoke;
      v15[3] = &unk_1E6557668;
      v15[4] = self;
      WFShowResult(v6, v7, 1, v15);
LABEL_10:

LABEL_13:
      goto LABEL_14;
    }
    if ([v5 isEqualToString:@"Copy to Clipboard"])
    {
      id v10 = +[WFActionRegistry sharedRegistry];
      id v6 = [v10 createActionWithIdentifier:@"is.workflow.actions.setclipboard" serializedParameters:0];

      BOOL v7 = [(WFAction *)self userInterface];
      int v11 = [(WFAction *)self runningDelegate];
      uint64_t v12 = [(WFAction *)self variableSource];
      int v13 = [(WFAction *)self workQueue];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __45__WFOutputAction_runAsynchronouslyWithInput___block_invoke_2;
      v14[3] = &unk_1E65577A0;
      v14[4] = self;
      [v6 runWithInput:v4 userInterface:v7 runningDelegate:v11 variableSource:v12 workQueue:v13 completionHandler:v14];

      goto LABEL_10;
    }
    id v8 = self;
    id v9 = 0;
  }
  [(WFOutputAction *)v8 finishRunningWithOutput:v9 error:0];
LABEL_14:
}

uint64_t __45__WFOutputAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishRunningWithOutput:0 error:a2];
}

uint64_t __45__WFOutputAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishRunningWithOutput:0 error:a3];
}

@end