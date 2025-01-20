@interface WFLinkStartWorkoutAction
- (id)parameterOverrides;
- (id)parameterSummary;
- (void)initializeParameters;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFLinkStartWorkoutAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v5 = [(WFAction *)self parameterValueForKey:@"workoutStyle" ofClass:objc_opt_class()];
  if (v5)
  {
    [(WFLinkAction *)self runAsynchronouslyWithLinkAction:v5];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WFLinkStartWorkoutAction;
    [(WFLinkAction *)&v6 runAsynchronouslyWithInput:v4];
  }
}

- (id)parameterOverrides
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v2 = [(WFAppIntentExecutionAction *)self metadata];
  v3 = [v2 actionConfiguration];

  if (v3)
  {
    id v4 = 0;
  }
  else
  {
    v15 = @"workoutStyle";
    v5 = [WFParameterDefinition alloc];
    v13[0] = @"Class";
    objc_super v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v13[1] = @"DisallowedVariableTypes";
    v14[0] = v7;
    v12 = @"Variable";
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    v14[1] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    v10 = [(WFParameterDefinition *)v5 initWithDictionary:v9];
    v16[0] = v10;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  }
  return v4;
}

- (id)parameterSummary
{
  v2 = [WFActionParameterSummary alloc];
  v3 = WFLocalizedStringResourceWithKey(@"Start ${workoutStyle} Workout", @"Start ${workoutStyle} Workout");
  id v4 = [(WFActionParameterSummary *)v2 initWithString:v3];

  return v4;
}

- (void)initializeParameters
{
  v7.receiver = self;
  v7.super_class = (Class)WFLinkStartWorkoutAction;
  [(WFLinkAction *)&v7 initializeParameters];
  v3 = [(WFAppIntentExecutionAction *)self metadata];
  id v4 = [v3 actionConfiguration];

  if (!v4)
  {
    v5 = [(WFAction *)self parameterForKey:@"workoutStyle"];
    [v5 setAction:self];
    objc_super v6 = [(WFAction *)self parameters];
    [v6 enumerateObjectsUsingBlock:&__block_literal_global_15569];
  }
}

void __48__WFLinkStartWorkoutAction_initializeParameters__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [v2 setHidden:1];
  }
}

@end