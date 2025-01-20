@interface WFWorkflowRunningContext(SystemAction)
- (id)action;
- (void)setAction:()SystemAction;
@end

@implementation WFWorkflowRunningContext(SystemAction)

- (id)action
{
  return objc_getAssociatedObject(a1, sel_action);
}

- (void)setAction:()SystemAction
{
}

@end