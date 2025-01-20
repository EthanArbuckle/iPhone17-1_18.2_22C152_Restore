@interface WFComposeUserActivityManager
- (BOOL)isActive;
- (NSDictionary)userInfo;
- (UIResponder)responder;
- (WFComposeUserActivityManager)initWithWorkflow:(id)a3 targetResponder:(id)a4;
- (WFWorkflow)workflow;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setActive:(BOOL)a3;
- (void)setResponder:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)updateUserActivityState:(id)a3;
@end

@implementation WFComposeUserActivityManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_responder);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
}

- (void)setResponder:(id)a3
{
}

- (UIResponder)responder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_responder);
  return (UIResponder *)WeakRetained;
}

- (void)setUserInfo:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)WFWorkflowNameContext == a6 || WFWorkflowIconContext == (void)a6)
  {
    id v13 = [(WFComposeUserActivityManager *)self responder];
    v8 = [(WFComposeUserActivityManager *)self workflow];
    v9 = [v8 createUserActivityForViewing];

    v10 = [v9 userInfo];
    [(WFComposeUserActivityManager *)self setUserInfo:v10];

    v11 = [v13 userActivity];
    [v11 invalidate];

    [v13 setUserActivity:v9];
    if ([(WFComposeUserActivityManager *)self isActive])
    {
      v12 = [v13 userActivity];
      [v12 becomeCurrent];
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)WFComposeUserActivityManager;
    -[WFComposeUserActivityManager observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
  BOOL v4 = [(WFComposeUserActivityManager *)self isActive];
  id v7 = [(WFComposeUserActivityManager *)self responder];
  v5 = [v7 userActivity];
  v6 = v5;
  if (v4) {
    [v5 becomeCurrent];
  }
  else {
    [v5 resignCurrent];
  }
}

- (void)updateUserActivityState:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(WFComposeUserActivityManager *)self userInfo];

  if (v4)
  {
    v5 = [(WFComposeUserActivityManager *)self userInfo];
    [v6 addUserInfoEntriesFromDictionary:v5];
  }
}

- (void)dealloc
{
  v3 = [(WFComposeUserActivityManager *)self workflow];
  [v3 removeObserver:self forKeyPath:@"name" context:WFWorkflowNameContext];

  BOOL v4 = [(WFComposeUserActivityManager *)self workflow];
  [v4 removeObserver:self forKeyPath:@"icon" context:WFWorkflowIconContext];

  v5.receiver = self;
  v5.super_class = (Class)WFComposeUserActivityManager;
  [(WFComposeUserActivityManager *)&v5 dealloc];
}

- (WFComposeUserActivityManager)initWithWorkflow:(id)a3 targetResponder:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFComposeUserActivityManager.m", 30, @"Invalid parameter not satisfying: %@", @"workflow" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)WFComposeUserActivityManager;
  v10 = [(WFComposeUserActivityManager *)&v18 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_workflow, a3);
    objc_storeWeak((id *)&v11->_responder, v9);
    v12 = [v9 userActivity];
    [v12 invalidate];

    id v13 = [v8 createUserActivityForViewing];
    objc_super v14 = [v13 userInfo];
    [(WFComposeUserActivityManager *)v11 setUserInfo:v14];

    [v9 setUserActivity:v13];
    [v8 addObserver:v11 forKeyPath:@"name" options:0 context:WFWorkflowNameContext];
    [v8 addObserver:v11 forKeyPath:@"icon" options:0 context:WFWorkflowIconContext];
    v15 = v11;
  }
  return v11;
}

@end