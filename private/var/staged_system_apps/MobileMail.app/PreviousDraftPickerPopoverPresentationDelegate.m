@interface PreviousDraftPickerPopoverPresentationDelegate
- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4;
@end

@implementation PreviousDraftPickerPopoverPresentationDelegate

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  id v4 = a3;
  id v5 = objc_alloc((Class)UINavigationController);
  v6 = [v4 presentedViewController];
  id v7 = [v5 initWithRootViewController:v6];

  return v7;
}

@end