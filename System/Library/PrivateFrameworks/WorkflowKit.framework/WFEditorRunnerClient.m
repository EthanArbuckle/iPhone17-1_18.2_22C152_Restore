@interface WFEditorRunnerClient
- (WFEditorRunnerClient)initWithWorkflow:(id)a3 runSource:(id)a4;
- (WFEditorRunnerClient)initWithWorkflowData:(id)a3 runSource:(id)a4;
@end

@implementation WFEditorRunnerClient

- (WFEditorRunnerClient)initWithWorkflowData:(id)a3 runSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((_os_feature_enabled_impl() & 1) == 0) {
    __assert_rtn("-[WFEditorRunnerClient initWithWorkflowData:runSource:]", "WFEditorRunnerClient.m", 37, "os_feature_enabled(Shortcuts, intermediate_outputs)");
  }
  v8 = (void *)[objc_alloc(MEMORY[0x1E4FB4A38]) initWithWorkflowData:v6];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4FB4A78]) initWithInput:0 presentationMode:3];
  [v9 setRunSource:v7];
  [v9 setOutputBehavior:3];
  [v9 setAllowsDialogNotifications:0];
  v12.receiver = self;
  v12.super_class = (Class)WFEditorRunnerClient;
  v10 = [(WFWorkflowRunnerClient *)&v12 initWithDescriptor:v8 runRequest:v9 delegateQueue:MEMORY[0x1E4F14428]];

  return v10;
}

- (WFEditorRunnerClient)initWithWorkflow:(id)a3 runSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((_os_feature_enabled_impl() & 1) == 0) {
    __assert_rtn("-[WFEditorRunnerClient initWithWorkflow:runSource:]", "WFEditorRunnerClient.m", 24, "os_feature_enabled(Shortcuts, intermediate_outputs)");
  }
  v8 = (void *)[objc_alloc(MEMORY[0x1E4FB4A78]) initWithInput:0 presentationMode:0];
  id v9 = objc_alloc(MEMORY[0x1E4FB4A40]);
  v10 = [v6 identifier];
  v11 = [v6 name];
  objc_super v12 = (void *)[v9 initWithIdentifier:v10 name:v11];

  [v8 setRunSource:v7];
  [v8 setOutputBehavior:3];
  [v8 setAllowsDialogNotifications:0];
  v15.receiver = self;
  v15.super_class = (Class)WFEditorRunnerClient;
  v13 = [(WFWorkflowRunnerClient *)&v15 initWithDescriptor:v12 runRequest:v8 delegateQueue:MEMORY[0x1E4F14428]];

  return v13;
}

@end