@interface WFHarnessActionCondition
- (Class)eventClass;
- (WFHarnessActionCondition)initWithSelector:(id)a3 eventClass:(Class)a4 eventHandler:(id)a5;
- (WFHarnessActionSelector)selector;
- (id)eventHandler;
- (void)evaluateWithEvent:(id)a3 context:(id)a4 withResponse:(id)a5;
@end

@implementation WFHarnessActionCondition

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_eventClass, 0);
  objc_storeStrong((id *)&self->_selector, 0);
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (Class)eventClass
{
  return self->_eventClass;
}

- (WFHarnessActionSelector)selector
{
  return self->_selector;
}

- (void)evaluateWithEvent:(id)a3 context:(id)a4 withResponse:(id)a5
{
  id v15 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v15)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_8:
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFHarnessActionCondition.m", 36, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2, self, @"WFHarnessActionCondition.m", 35, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];

  if (!v9) {
    goto LABEL_8;
  }
LABEL_3:
  if (v10) {
    goto LABEL_4;
  }
LABEL_9:
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"WFHarnessActionCondition.m", 37, @"Invalid parameter not satisfying: %@", @"responseBlock" object file lineNumber description];

LABEL_4:
  v11 = [(WFHarnessActionCondition *)self eventHandler];
  ((void (**)(void, id, id, id))v11)[2](v11, v15, v9, v10);
}

- (WFHarnessActionCondition)initWithSelector:(id)a3 eventClass:(Class)a4 eventHandler:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  if (v10)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_8:
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFHarnessActionCondition.m", 19, @"Invalid parameter not satisfying: %@", @"eventClass" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"WFHarnessActionCondition.m", 18, @"Invalid parameter not satisfying: %@", @"selector" object file lineNumber description];

  if (!a4) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_9:
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"WFHarnessActionCondition.m", 20, @"Invalid parameter not satisfying: %@", @"eventHandler" object file lineNumber description];

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)WFHarnessActionCondition;
  v12 = [(WFHarnessActionCondition *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_selector, a3);
    objc_storeStrong((id *)&v13->_eventClass, a4);
    v14 = _Block_copy(v11);
    id eventHandler = v13->_eventHandler;
    v13->_id eventHandler = v14;

    v16 = v13;
  }

  return v13;
}

@end