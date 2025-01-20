@interface WFWorkflowImportQuestion
- (NSString)question;
- (WFAction)action;
- (WFParameter)parameter;
- (WFParameterState)defaultState;
- (WFWorkflowImportQuestion)initWithAction:(id)a3 parameter:(id)a4 question:(id)a5 defaultState:(id)a6;
- (WFWorkflowImportQuestion)initWithSerializedRepresentation:(id)a3 workflowActions:(id)a4;
- (id)serializedRepresentationWithWorkflowActions:(id)a3;
@end

@implementation WFWorkflowImportQuestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultState, 0);
  objc_storeStrong((id *)&self->_question, 0);
  objc_destroyWeak((id *)&self->_parameter);
  objc_destroyWeak((id *)&self->_action);
}

- (WFParameterState)defaultState
{
  return self->_defaultState;
}

- (NSString)question
{
  return self->_question;
}

- (WFParameter)parameter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parameter);
  return (WFParameter *)WeakRetained;
}

- (WFAction)action
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  return (WFAction *)WeakRetained;
}

- (id)serializedRepresentationWithWorkflowActions:(id)a3
{
  id v4 = a3;
  v5 = [(WFWorkflowImportQuestion *)self action];
  uint64_t v6 = [(WFWorkflowImportQuestion *)self parameter];
  v7 = (void *)v6;
  v8 = 0;
  if (v5 && v6)
  {
    uint64_t v9 = [v4 indexOfObject:v5];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = 0;
    }
    else
    {
      uint64_t v10 = v9;
      v8 = objc_opt_new();
      [v8 setObject:@"Parameter" forKey:@"Category"];
      v11 = [NSNumber numberWithUnsignedInteger:v10];
      [v8 setObject:v11 forKey:@"ActionIndex"];

      v12 = [v7 key];
      [v8 setObject:v12 forKey:@"ParameterKey"];

      v13 = [(WFWorkflowImportQuestion *)self question];
      [v8 setValue:v13 forKey:@"Text"];

      v14 = [(WFWorkflowImportQuestion *)self defaultState];
      v15 = [v14 serializedRepresentation];
      [v8 setValue:v15 forKey:@"DefaultValue"];
    }
  }

  return v8;
}

- (WFWorkflowImportQuestion)initWithSerializedRepresentation:(id)a3 workflowActions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 objectForKey:@"Category"];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = WFEnforceClass(v8, v9);

  v11 = [v7 objectForKey:@"ActionIndex"];
  uint64_t v12 = objc_opt_class();
  v13 = WFEnforceClass(v11, v12);

  v14 = [v7 objectForKey:@"ParameterKey"];
  uint64_t v15 = objc_opt_class();
  v16 = WFEnforceClass(v14, v15);

  v17 = [v7 objectForKey:@"Text"];
  uint64_t v18 = objc_opt_class();
  v19 = WFEnforceClass(v17, v18);

  v20 = [v7 objectForKey:@"DefaultValue"];

  v21 = 0;
  if ([v10 isEqualToString:@"Parameter"] && v13 && v16)
  {
    unint64_t v22 = [v13 unsignedIntegerValue];
    if (v22 >= [v6 count])
    {
      v21 = 0;
    }
    else
    {
      v27 = self;
      v23 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v13, "unsignedIntegerValue"));
      v24 = [v23 parameterForKey:v16];
      if (v24)
      {
        v25 = [v23 createStateForParameter:v24 fromSerializedRepresentation:v20];
        v21 = [[WFWorkflowImportQuestion alloc] initWithAction:v23 parameter:v24 question:v19 defaultState:v25];
      }
      else
      {
        v21 = 0;
      }

      self = v27;
    }
  }

  return v21;
}

- (WFWorkflowImportQuestion)initWithAction:(id)a3 parameter:(id)a4 question:(id)a5 defaultState:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [v11 parameters];
  if ([v15 containsObject:v12])
  {
    char v16 = 1;
  }
  else
  {
    v17 = [v11 visibleParametersWithProcessing:0];
    char v16 = [v17 containsObject:v12];
  }
  if (!v11 || !v12 || (v16 & 1) == 0)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"WFWorkflowImportQuestion.m", 26, @"Invalid parameter not satisfying: %@", @"action && parameter && actionHasParameter" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)WFWorkflowImportQuestion;
  uint64_t v18 = [(WFWorkflowImportQuestion *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_action, v11);
    objc_storeWeak((id *)&v19->_parameter, v12);
    uint64_t v20 = [v13 copy];
    question = v19->_question;
    v19->_question = (NSString *)v20;

    objc_storeStrong((id *)&v19->_defaultState, a6);
    unint64_t v22 = v19;
  }

  return v19;
}

@end