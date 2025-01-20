@interface WFChooseFromListDialogRequest(WFDialogRequestViewControllerSupport)
- (uint64_t)wf_dialogViewControllerClass;
@end

@implementation WFChooseFromListDialogRequest(WFDialogRequestViewControllerSupport)

- (uint64_t)wf_dialogViewControllerClass
{
  return objc_opt_class();
}

@end