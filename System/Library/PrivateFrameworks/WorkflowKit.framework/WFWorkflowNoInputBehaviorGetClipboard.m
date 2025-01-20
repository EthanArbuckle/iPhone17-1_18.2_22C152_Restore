@interface WFWorkflowNoInputBehaviorGetClipboard
+ (BOOL)resolvesInput;
+ (id)behaviorName;
- (WFWorkflowNoInputBehaviorGetClipboard)initWithSerializedRepresentation:(id)a3;
- (id)serializedRepresentation;
- (void)resolveWithUserInterface:(id)a3 runningDelegate:(id)a4 completionHandler:(id)a5;
@end

@implementation WFWorkflowNoInputBehaviorGetClipboard

+ (BOOL)resolvesInput
{
  return 1;
}

+ (id)behaviorName
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)serializedRepresentation
{
  v2 = [(id)objc_opt_class() behaviorName];
  v3 = WFNoInputBehaviorSerializedRepresentation(v2, MEMORY[0x1E4F1CC08]);

  return v3;
}

- (WFWorkflowNoInputBehaviorGetClipboard)initWithSerializedRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() behaviorName];
  v6 = WFNoInputBehaviorParametersIfBehavior(v5, v4);

  if (v6)
  {
    self = [(WFWorkflowNoInputBehaviorGetClipboard *)self init];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)resolveWithUserInterface:(id)a3 runningDelegate:(id)a4 completionHandler:(id)a5
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFWorkflowNoInputBehavior.m", 207, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"WFWorkflowNoInputBehavior.m", 208, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  v12 = +[WFActionRegistry sharedRegistry];
  v13 = [v12 createActionWithIdentifier:@"is.workflow.actions.getclipboard" serializedParameters:0];

  [v9 noInputBehavior:self wantsToRunAction:v13 completionHandler:v11];
}

@end