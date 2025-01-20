@interface UIViewController(PXSettings)
- (uint64_t)_px_dismiss:()PXSettings;
- (void)px_presentViewControllerInNavigationController:()PXSettings animated:dimissButtonLocation:completion:;
@end

@implementation UIViewController(PXSettings)

- (uint64_t)_px_dismiss:()PXSettings
{
  return [a1 dismissViewControllerAnimated:1 completion:0];
}

- (void)px_presentViewControllerInNavigationController:()PXSettings animated:dimissButtonLocation:completion:
{
  id v14 = a6;
  v9 = (objc_class *)MEMORY[0x1E4FB19E8];
  id v10 = a3;
  v11 = (void *)[[v9 alloc] initWithRootViewController:v10];
  [v11 setToolbarHidden:0];
  objc_msgSend(v11, "setModalPresentationStyle:", objc_msgSend(v10, "modalPresentationStyle"));
  v12 = [v10 navigationItem];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:v10 action:sel__px_dismiss_];

  if (a5 == 1)
  {
    [v12 setRightBarButtonItem:v13];
  }
  else if (!a5)
  {
    [v12 setLeftBarButtonItem:v13];
  }
  [a1 presentViewController:v11 animated:1 completion:v14];
}

@end