@interface WFConfiguratorRunnerClient
- (WFConfiguratorRunnerClient)initWithWorkflowName:(id)a3 inputStrings:(id)a4;
@end

@implementation WFConfiguratorRunnerClient

- (WFConfiguratorRunnerClient)initWithWorkflowName:(id)a3 inputStrings:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFConfiguratorRunnerClient.m", 19, @"Invalid parameter not satisfying: %@", @"workflowName" object file lineNumber description];
  }
  v9 = [[WFWorkflowDatabaseRunDescriptor alloc] initWithName:v7];
  v10 = [[WFConfiguratorRunRequest alloc] initWithInputStrings:v8 presentationMode:0];
  v14.receiver = self;
  v14.super_class = (Class)WFConfiguratorRunnerClient;
  v11 = [(WFWorkflowRunnerClient *)&v14 initWithDescriptor:v9 runRequest:v10];

  return v11;
}

@end