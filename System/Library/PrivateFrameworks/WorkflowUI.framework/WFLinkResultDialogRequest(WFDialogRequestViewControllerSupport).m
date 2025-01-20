@interface WFLinkResultDialogRequest(WFDialogRequestViewControllerSupport)
- (uint64_t)wf_dialogViewControllerClass;
@end

@implementation WFLinkResultDialogRequest(WFDialogRequestViewControllerSupport)

- (uint64_t)wf_dialogViewControllerClass
{
  return objc_opt_class();
}

@end