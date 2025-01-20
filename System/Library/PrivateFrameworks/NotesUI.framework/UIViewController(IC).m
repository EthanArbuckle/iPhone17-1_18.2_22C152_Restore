@interface UIViewController(IC)
+ (void)ic_enableUIViewAnimations:()IC forBlock:;
- (BOOL)ic_hasFullScreenModalPresentationStyle;
- (BOOL)ic_isViewVisible;
- (double)ic_safeAreaDistanceFromBottom;
- (double)ic_safeAreaDistanceFromTop;
- (id)ic_embedInNavigationControllerForModalPresentation;
- (id)ic_rootNavigationController;
- (id)ic_safeAreaLayoutGuide;
- (id)ic_topViewController;
- (id)ic_viewControllerManager;
- (id)ic_window;
- (id)ic_windowScene;
- (uint64_t)ic_behavior;
- (uint64_t)ic_isBeingRevealedFromPoppingViewController;
- (uint64_t)ic_isRTL;
- (uint64_t)ic_showSingleButtonAlertWithTitle:()IC message:;
- (void)ic_dismissPresentedViewControllerAnimated:()IC completion:;
- (void)ic_dismissViewControllerOfClass:()IC animated:completion:;
- (void)ic_performBlockAfterActiveTransition:()IC;
- (void)ic_replacePresentedViewControllerWithViewController:()IC animated:completion:;
- (void)ic_showSingleButtonAlertWithTitle:()IC message:handler:;
- (void)ic_showViewController:()IC animated:sender:;
@end

@implementation UIViewController(IC)

- (uint64_t)ic_behavior
{
  v1 = [a1 traitCollection];
  uint64_t v2 = objc_msgSend(v1, "ic_behavior");

  return v2;
}

- (id)ic_windowScene
{
  v1 = [a1 view];
  uint64_t v2 = objc_msgSend(v1, "ic_windowScene");

  return v2;
}

- (double)ic_safeAreaDistanceFromTop
{
  v1 = objc_msgSend(a1, "ic_safeAreaLayoutGuide");
  [v1 layoutFrame];
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;

  uint64_t v10 = v3;
  uint64_t v11 = v5;
  uint64_t v12 = v7;
  uint64_t v13 = v9;
  return CGRectGetMinY(*(CGRect *)&v10);
}

- (double)ic_safeAreaDistanceFromBottom
{
  uint64_t v2 = objc_msgSend(a1, "ic_safeAreaLayoutGuide");
  [v2 layoutFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  uint64_t v11 = [a1 view];
  [v11 bounds];
  double MaxY = CGRectGetMaxY(v15);
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  double v13 = MaxY - CGRectGetMaxY(v16);

  return v13;
}

- (id)ic_safeAreaLayoutGuide
{
  v1 = [a1 view];
  uint64_t v2 = [v1 safeAreaLayoutGuide];

  return v2;
}

- (BOOL)ic_isViewVisible
{
  uint64_t v2 = [a1 viewIfLoaded];
  double v3 = [v2 window];
  if (v3) {
    BOOL v4 = [a1 _appearState] != 3;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)ic_viewControllerManager
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__12;
  CGFloat v10 = __Block_byref_object_dispose__12;
  id v11 = 0;
  uint64_t v4 = MEMORY[0x1E4F143A8];
  performBlockOnMainThreadAndWait();
  v1 = (void *)v7[5];
  if (v1)
  {
    uint64_t v2 = objc_msgSend(v1, "ic_viewControllerManager", v4, 3221225472, __48__UIViewController_IC__ic_viewControllerManager__block_invoke, &unk_1E5FD91F8, a1, &v6);
  }
  else
  {
    uint64_t v2 = 0;
  }
  _Block_object_dispose(&v6, 8);

  return v2;
}

- (uint64_t)ic_isRTL
{
  v1 = [a1 view];
  uint64_t v2 = objc_msgSend(v1, "ic_isRTL");

  return v2;
}

+ (void)ic_enableUIViewAnimations:()IC forBlock:
{
  double v7 = a4;
  uint64_t v5 = [MEMORY[0x1E4FB1EB0] areAnimationsEnabled];
  if (v5 == a3)
  {
    v7[2]();
  }
  else
  {
    uint64_t v6 = v5;
    [MEMORY[0x1E4FB1EB0] setAnimationsEnabled:a3];
    v7[2]();
    [MEMORY[0x1E4FB1EB0] setAnimationsEnabled:v6];
  }
}

- (void)ic_showViewController:()IC animated:sender:
{
  id v8 = a3;
  id v9 = a5;
  CGFloat v10 = objc_opt_class();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__UIViewController_IC__ic_showViewController_animated_sender___block_invoke;
  v13[3] = &unk_1E5FD8FE8;
  v13[4] = a1;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  objc_msgSend(v10, "ic_enableUIViewAnimations:forBlock:", a4, v13);
}

- (uint64_t)ic_showSingleButtonAlertWithTitle:()IC message:
{
  return objc_msgSend(a1, "ic_showSingleButtonAlertWithTitle:message:handler:", a3, a4, 0);
}

- (void)ic_showSingleButtonAlertWithTitle:()IC message:handler:
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((unint64_t)[v18 length] < 0xC9)
  {
    id v13 = v18;
  }
  else
  {
    CGFloat v10 = NSString;
    id v11 = [v18 substringToIndex:200];
    uint64_t v12 = [v10 stringWithFormat:@"%@…", v11];

    id v13 = (id)v12;
  }
  id v19 = v13;
  id v14 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v13 message:v8 preferredStyle:1];
  id v15 = (void *)MEMORY[0x1E4FB1410];
  CGRect v16 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"OK" value:@"OK" table:0 allowSiri:1];
  v17 = [v15 actionWithTitle:v16 style:0 handler:v9];

  [v14 addAction:v17];
  [a1 presentViewController:v14 animated:1 completion:0];
}

- (id)ic_topViewController
{
  id v1 = a1;
  uint64_t v2 = [v1 presentedViewController];

  if (v2)
  {
    do
    {
      double v3 = [v1 presentedViewController];

      uint64_t v4 = [v3 presentedViewController];

      id v1 = v3;
    }
    while (v4);
  }
  else
  {
    double v3 = v1;
  }
  return v3;
}

- (id)ic_embedInNavigationControllerForModalPresentation
{
  id v1 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:a1];
  if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision")) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = 2;
  }
  [v1 setModalPresentationStyle:v2];
  return v1;
}

- (id)ic_rootNavigationController
{
  id v1 = [a1 navigationController];
  uint64_t v2 = [v1 navigationController];

  if (v2)
  {
    do
    {
      double v3 = [v1 navigationController];

      uint64_t v4 = [v3 navigationController];

      id v1 = v3;
    }
    while (v4);
  }
  else
  {
    double v3 = v1;
  }
  return v3;
}

- (id)ic_window
{
  id v1 = [a1 view];
  uint64_t v2 = objc_msgSend(v1, "ic_window");

  return v2;
}

- (BOOL)ic_hasFullScreenModalPresentationStyle
{
  return ![a1 modalPresentationStyle] || objc_msgSend(a1, "modalPresentationStyle") == 5;
}

- (uint64_t)ic_isBeingRevealedFromPoppingViewController
{
  uint64_t v2 = [a1 navigationController];
  double v3 = [v2 transitionCoordinator];

  uint64_t v4 = [v3 viewControllerForKey:*MEMORY[0x1E4FB30B8]];
  if (v4)
  {
    uint64_t v5 = [a1 navigationController];
    uint64_t v6 = [v5 viewControllers];
    char v7 = [v6 containsObject:v4];
  }
  else
  {
    char v7 = 1;
  }
  id v8 = [a1 navigationController];
  id v9 = [v8 topViewController];

  CGFloat v10 = [a1 presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v11 = 1;
  }
  else
  {
    uint64_t v12 = [a1 presentedViewController];
    if ([v12 modalPresentationStyle] == 7)
    {
      BOOL v11 = 1;
    }
    else
    {
      id v13 = [a1 presentedViewController];
      BOOL v11 = [v13 modalPresentationStyle] == 1;
    }
  }

  if (v9 == a1) {
    char v14 = v7;
  }
  else {
    char v14 = 1;
  }
  if (v14)
  {
    uint64_t v15 = 0;
  }
  else
  {
    CGRect v16 = [a1 presentedViewController];
    if (v16) {
      uint64_t v15 = v11;
    }
    else {
      uint64_t v15 = 1;
    }
  }
  return v15;
}

- (void)ic_dismissViewControllerOfClass:()IC animated:completion:
{
  id v8 = a5;
  char isKindOfClass = objc_opt_isKindOfClass();
  CGFloat v10 = [a1 childViewControllers];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__UIViewController_IC__ic_dismissViewControllerOfClass_animated_completion___block_invoke;
  v12[3] = &__block_descriptor_40_e33_B32__0__UIViewController_8Q16_B24lu32l8;
  v12[4] = a3;
  int v11 = objc_msgSend(v10, "ic_containsObjectPassingTest:", v12);

  if ((isKindOfClass & 1) != 0 || v11) {
    [a1 dismissViewControllerAnimated:a4 completion:v8];
  }
}

- (void)ic_dismissPresentedViewControllerAnimated:()IC completion:
{
  char v7 = a4;
  uint64_t v6 = [a1 presentedViewController];

  if (v6) {
    [a1 dismissViewControllerAnimated:a3 completion:v7];
  }
  else {
    v7[2]();
  }
}

- (void)ic_replacePresentedViewControllerWithViewController:()IC animated:completion:
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__UIViewController_IC__ic_replacePresentedViewControllerWithViewController_animated_completion___block_invoke;
  v12[3] = &unk_1E5FDA000;
  v12[4] = a1;
  id v13 = v8;
  char v15 = a4;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  objc_msgSend(a1, "ic_dismissPresentedViewControllerAnimated:completion:", a4, v12);
}

- (void)ic_performBlockAfterActiveTransition:()IC
{
  uint64_t v4 = a3;
  uint64_t v5 = [a1 transitionCoordinator];

  if (v5)
  {
    uint64_t v6 = [a1 transitionCoordinator];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__UIViewController_IC__ic_performBlockAfterActiveTransition___block_invoke;
    v7[3] = &unk_1E5FDA028;
    id v8 = v4;
    [v6 animateAlongsideTransition:0 completion:v7];
  }
  else
  {
    v4[2](v4);
  }
}

@end