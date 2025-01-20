@interface WFWorkflowNoInputBehaviorShowError
+ (BOOL)resolvesInput;
+ (id)behaviorName;
- (NSString)errorString;
- (WFWorkflowNoInputBehaviorShowError)initWithErrorString:(id)a3;
- (WFWorkflowNoInputBehaviorShowError)initWithSerializedRepresentation:(id)a3;
- (id)serializedRepresentation;
- (void)resolveWithUserInterface:(id)a3 runningDelegate:(id)a4 completionHandler:(id)a5;
@end

@implementation WFWorkflowNoInputBehaviorShowError

- (void).cxx_destruct
{
}

- (NSString)errorString
{
  return self->_errorString;
}

- (id)serializedRepresentation
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = [(WFWorkflowNoInputBehaviorShowError *)self errorString];
  if (v3)
  {
    v9 = @"Error";
    v4 = [(WFWorkflowNoInputBehaviorShowError *)self errorString];
    v10[0] = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CC08];
  }

  v6 = [(id)objc_opt_class() behaviorName];
  v7 = WFNoInputBehaviorSerializedRepresentation(v6, v5);

  return v7;
}

- (WFWorkflowNoInputBehaviorShowError)initWithSerializedRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() behaviorName];
  v6 = WFNoInputBehaviorParametersIfBehavior(v5, v4);

  if (v6)
  {
    v7 = [v6 objectForKeyedSubscript:@"Error"];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v8 = v7;
      }
      else {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
    id v10 = v8;

    v11 = [(WFWorkflowNoInputBehaviorShowError *)self initWithErrorString:v10];
    self = v11;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)resolveWithUserInterface:(id)a3 runningDelegate:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(void, void, void))v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFWorkflowNoInputBehavior.m", 153, @"Invalid parameter not satisfying: %@", @"userInterface" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"WFWorkflowNoInputBehavior.m", 154, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  v13 = [(WFWorkflowNoInputBehaviorShowError *)self errorString];
  if (v13)
  {
    v14 = [MEMORY[0x1E4F5A768] alertWithPreferredStyle:0];
    [v14 setMessage:v13];
    v15 = (void *)MEMORY[0x1E4F5A770];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __97__WFWorkflowNoInputBehaviorShowError_resolveWithUserInterface_runningDelegate_completionHandler___block_invoke;
    v19[3] = &unk_1E6558678;
    v20 = v12;
    v16 = [v15 okButtonWithHandler:v19];
    [v14 addButton:v16];

    [v9 presentAlert:v14];
  }
  else
  {
    v14 = [MEMORY[0x1E4F28C58] userCancelledError];
    ((void (**)(void, void, void *))v12)[2](v12, 0, v14);
  }
}

void __97__WFWorkflowNoInputBehaviorShowError_resolveWithUserInterface_runningDelegate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] userCancelledError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (WFWorkflowNoInputBehaviorShowError)initWithErrorString:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWorkflowNoInputBehaviorShowError;
  v6 = [(WFWorkflowNoInputBehaviorShowError *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_errorString, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)resolvesInput
{
  return 0;
}

+ (id)behaviorName
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end