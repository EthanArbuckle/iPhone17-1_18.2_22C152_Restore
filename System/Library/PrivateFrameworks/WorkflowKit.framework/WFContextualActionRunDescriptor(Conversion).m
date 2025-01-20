@interface WFContextualActionRunDescriptor(Conversion)
- (void)createWorkflowWithEnvironment:()Conversion database:completionHandler:;
@end

@implementation WFContextualActionRunDescriptor(Conversion)

- (void)createWorkflowWithEnvironment:()Conversion database:completionHandler:
{
  id v7 = a5;
  v8 = [a1 context];
  v9 = [a1 action];
  v10 = [v8 files];
  BOOL v11 = [v10 count] != 0;

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __104__WFContextualActionRunDescriptor_Conversion__createWorkflowWithEnvironment_database_completionHandler___block_invoke;
  v15[3] = &unk_1E6558AF0;
  id v18 = v7;
  uint64_t v19 = a3;
  id v16 = v9;
  id v17 = v8;
  id v12 = v8;
  id v13 = v9;
  id v14 = v7;
  [v13 getActionRepresentationTakingInput:v11 context:v12 completionHandler:v15];
}

@end