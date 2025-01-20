@interface WFHomeWorkflowController
- (BOOL)isRunning;
- (WFHomeWorkflow)workflow;
- (WFHomeWorkflowController)init;
- (WFHomeWorkflowController)initWithWorkflow:(id)a3;
- (WFOutOfProcessWorkflowController)workflowController;
- (id)completionHandler;
- (void)cancel;
- (void)outOfProcessWorkflowController:(id)a3 didFinishWithResult:(id)a4 dialogAttribution:(id)a5 runResidency:(unint64_t)a6;
- (void)setCompletionHandler:(id)a3;
- (void)startWithCompletionHandler:(id)a3;
@end

@implementation WFHomeWorkflowController

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_storeStrong((id *)&self->_workflowController, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (WFHomeWorkflow)workflow
{
  return self->_workflow;
}

- (WFOutOfProcessWorkflowController)workflowController
{
  workflowController = self->_workflowController;
  if (!workflowController)
  {
    v4 = (WFOutOfProcessWorkflowController *)[objc_alloc(MEMORY[0x1E4FB4820]) initWithEnvironment:1 runningContext:0 presentationMode:0];
    v5 = self->_workflowController;
    self->_workflowController = v4;

    [(WFOutOfProcessWorkflowController *)self->_workflowController setDelegate:self];
    workflowController = self->_workflowController;
  }
  return workflowController;
}

- (void)outOfProcessWorkflowController:(id)a3 didFinishWithResult:(id)a4 dialogAttribution:(id)a5 runResidency:(unint64_t)a6
{
  id v13 = a4;
  v8 = [v13 error];
  if (v8)
  {
    v6 = [v13 error];
    v9 = WFMakeHomeError(2, v6);
  }
  else
  {
    v9 = 0;
  }
  uint64_t v10 = [v13 isCancelled];
  uint64_t v11 = [(WFHomeWorkflowController *)self completionHandler];
  v12 = (void *)v11;
  if (v11) {
    (*(void (**)(uint64_t, void *, uint64_t))(v11 + 16))(v11, v9, v10);
  }

  if (v8)
  {
  }
  [(WFHomeWorkflowController *)self setCompletionHandler:0];
}

- (BOOL)isRunning
{
  return [(WFOutOfProcessWorkflowController *)self->_workflowController isRunning];
}

- (void)cancel
{
}

- (void)startWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  v5 = [WFHomeWorkflowRunDescriptor alloc];
  v6 = [(WFHomeWorkflowController *)self workflow];
  v7 = [(WFHomeWorkflowRunDescriptor *)v5 initWithHomeWorkflow:v6];

  v8 = (void *)[objc_alloc(MEMORY[0x1E4FB4A78]) initWithInput:0 presentationMode:3];
  [v8 setRunSource:*MEMORY[0x1E4FB4F18]];
  v9 = [(WFHomeWorkflowController *)self workflowController];
  id v13 = 0;
  char v10 = [v9 runWorkflowWithDescriptor:v7 request:v8 error:&v13];
  id v11 = v13;

  if (v10)
  {
    [(WFHomeWorkflowController *)self setCompletionHandler:v4];
  }
  else
  {
    v12 = WFMakeHomeError(1, v11);
    if (v4) {
      v4[2](v4, v12, 0);
    }
  }
}

- (WFHomeWorkflowController)init
{
  return 0;
}

- (WFHomeWorkflowController)initWithWorkflow:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFHomeWorkflowController.m", 34, @"Invalid parameter not satisfying: %@", @"workflow" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFHomeWorkflowController;
  v7 = [(WFHomeWorkflowController *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_workflow, a3);
    v9 = v8;
  }

  return v8;
}

@end