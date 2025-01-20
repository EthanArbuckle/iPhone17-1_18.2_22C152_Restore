@interface WFSageWorkflowRunRequest
- (BOOL)handlesDialogRequests;
- (BOOL)isStepwise;
@end

@implementation WFSageWorkflowRunRequest

- (BOOL)handlesDialogRequests
{
  return 1;
}

- (BOOL)isStepwise
{
  return 1;
}

@end