@interface UIViewController(PUNavigationController_Private)
- (id)pu_navigationController;
- (void)ppt_performBlockAfterNextNavigationAnimation:()PUNavigationController_Private;
@end

@implementation UIViewController(PUNavigationController_Private)

- (void)ppt_performBlockAfterNextNavigationAnimation:()PUNavigationController_Private
{
  id v5 = a3;
  id v6 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:v6 file:@"PUNavigationController.m" lineNumber:544 description:@"navigation controller must be a PUNavigationController"];
  }
  if (v5)
  {
    v7 = objc_msgSend(v6, "ppt_onDidShowViewControllerBlock");

    if (v7)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:v6 file:@"PUNavigationController.m" lineNumber:547 description:@"a previous block has already been scheduled for after the next navigation animation"];
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __97__UIViewController_PUNavigationController_Private__ppt_performBlockAfterNextNavigationAnimation___block_invoke;
    v10[3] = &unk_1E5F2EBA0;
    id v11 = v5;
    objc_msgSend(v6, "ppt_setOnDidShowViewControllerBlock:", v10);
  }
  else
  {
    objc_msgSend(v6, "ppt_setOnDidShowViewControllerBlock:", 0);
  }
}

- (id)pu_navigationController
{
  v1 = [a1 navigationController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v1 = 0;
  }

  return v1;
}

@end