@interface WFWorkflowRunDescriptor(Conversion)
- (uint64_t)createWorkflowWithEnvironment:()Conversion database:completionHandler:;
- (uint64_t)donateRunInteractionWithDatabase:()Conversion workflowReference:completionHandler:;
- (uint64_t)workflowReferenceWithDatabase:()Conversion error:;
@end

@implementation WFWorkflowRunDescriptor(Conversion)

- (uint64_t)donateRunInteractionWithDatabase:()Conversion workflowReference:completionHandler:
{
  return (*(uint64_t (**)(uint64_t))(a5 + 16))(a5);
}

- (uint64_t)createWorkflowWithEnvironment:()Conversion database:completionHandler:
{
  return (*(uint64_t (**)(uint64_t, void, void))(a5 + 16))(a5, 0, 0);
}

- (uint64_t)workflowReferenceWithDatabase:()Conversion error:
{
  return 0;
}

@end