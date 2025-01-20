@interface WFWorkflowNoInputBehaviorAskForInput
+ (BOOL)resolvesInput;
+ (id)behaviorName;
- (Class)contentItemClass;
- (NSDictionary)serializedParameters;
- (WFWorkflowNoInputBehaviorAskForInput)initWithContentItemClass:(Class)a3 serializedParameters:(id)a4;
- (WFWorkflowNoInputBehaviorAskForInput)initWithSerializedRepresentation:(id)a3;
- (id)serializedRepresentation;
- (void)resolveWithUserInterface:(id)a3 runningDelegate:(id)a4 completionHandler:(id)a5;
@end

@implementation WFWorkflowNoInputBehaviorAskForInput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItemClass, 0);
  objc_storeStrong((id *)&self->_serializedParameters, 0);
}

- (Class)contentItemClass
{
  return self->_contentItemClass;
}

- (id)serializedRepresentation
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v12 = @"ItemClass";
  v3 = NSStringFromClass([(WFWorkflowNoInputBehaviorAskForInput *)self contentItemClass]);
  v13[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v5 = (void *)[v4 mutableCopy];

  v6 = [(WFWorkflowNoInputBehaviorAskForInput *)self serializedParameters];

  if (v6)
  {
    v7 = [(WFWorkflowNoInputBehaviorAskForInput *)self serializedParameters];
    [v5 setObject:v7 forKeyedSubscript:@"SerializedParameters"];
  }
  v8 = [(id)objc_opt_class() behaviorName];
  v9 = (void *)[v5 copy];
  v10 = WFNoInputBehaviorSerializedRepresentation(v8, v9);

  return v10;
}

- (WFWorkflowNoInputBehaviorAskForInput)initWithSerializedRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() behaviorName];
  v6 = WFNoInputBehaviorParametersIfBehavior(v5, v4);

  if (!v6)
  {
    v11 = 0;
    goto LABEL_13;
  }
  v7 = [v6 objectForKeyedSubscript:@"ItemClass"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    Class v8 = NSClassFromString(v7);
    if ([(objc_class *)v8 isSubclassOfClass:objc_opt_class()])
    {
      v9 = [v6 objectForKeyedSubscript:@"SerializedParameters"];
      if (v9)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v10 = v9;
        }
        else {
          v10 = 0;
        }
      }
      else
      {
        v10 = 0;
      }
      id v13 = v10;

      v14 = [(WFWorkflowNoInputBehaviorAskForInput *)self initWithContentItemClass:v8 serializedParameters:v13];
      self = v14;
      v11 = self;
      goto LABEL_11;
    }
  }
  else
  {

    v7 = 0;
  }
  v11 = 0;
LABEL_11:

LABEL_13:
  return v11;
}

- (void)resolveWithUserInterface:(id)a3 runningDelegate:(id)a4 completionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(void, void, void))v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"WFWorkflowNoInputBehavior.m", 83, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"WFWorkflowNoInputBehavior.m", 84, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v13 = +[WFActionRegistry sharedRegistry];
  v14 = [(WFWorkflowNoInputBehaviorAskForInput *)self contentItemClass];
  v15 = [(WFWorkflowNoInputBehaviorAskForInput *)self serializedParameters];
  v16 = [v13 createActionForSelectingContentOfType:v14 serializedParameters:v15];

  if (v16)
  {
    [v10 noInputBehavior:self wantsToRunAction:v16 completionHandler:v12];
  }
  else
  {
    v17 = getWFGeneralLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[WFWorkflowNoInputBehaviorAskForInput resolveWithUserInterface:runningDelegate:completionHandler:]";
      _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_FAULT, "%s Tried to run an Ask For input behavior, but the content type is unknown?", buf, 0xCu);
    }

    v12[2](v12, 0, 0);
  }
}

- (NSDictionary)serializedParameters
{
  if ([(NSDictionary *)self->_serializedParameters count])
  {
    v3 = self->_serializedParameters;
  }
  else
  {
    id v4 = +[WFActionRegistry sharedRegistry];
    objc_msgSend(v4, "defaultSerializedParametersForActionSelectingContentOfType:", -[WFWorkflowNoInputBehaviorAskForInput contentItemClass](self, "contentItemClass"));
    v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (WFWorkflowNoInputBehaviorAskForInput)initWithContentItemClass:(Class)a3 serializedParameters:(id)a4
{
  id v8 = a4;
  if (!a3)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFWorkflowNoInputBehavior.m", 56, @"Invalid parameter not satisfying: %@", @"contentItemClass" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)WFWorkflowNoInputBehaviorAskForInput;
  id v9 = [(WFWorkflowNoInputBehaviorAskForInput *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contentItemClass, a3);
    objc_storeStrong((id *)&v10->_serializedParameters, a4);
    id v11 = v10;
  }

  return v10;
}

+ (BOOL)resolvesInput
{
  return 1;
}

+ (id)behaviorName
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end