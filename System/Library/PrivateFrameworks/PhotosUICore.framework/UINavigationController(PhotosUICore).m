@interface UINavigationController(PhotosUICore)
- (BOOL)px_preparePopToViewController:()PhotosUICore forced:;
- (id)px_childViewControllersForModalInPresentation;
- (id)px_popToViewControllerPrecedingViewController:()PhotosUICore animated:;
- (uint64_t)px_pushViewController:()PhotosUICore animated:completion:;
@end

@implementation UINavigationController(PhotosUICore)

- (id)px_childViewControllersForModalInPresentation
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [a1 topViewController];
  v2 = (void *)v1;
  if (v1)
  {
    v5[0] = v1;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

- (uint64_t)px_pushViewController:()PhotosUICore animated:completion:
{
  v8 = (void *)MEMORY[0x1E4F39CF8];
  id v9 = a5;
  id v10 = a3;
  [v8 begin];
  [MEMORY[0x1E4F39CF8] setCompletionBlock:v9];

  [a1 pushViewController:v10 animated:a4];
  v11 = (void *)MEMORY[0x1E4F39CF8];
  return [v11 commit];
}

- (id)px_popToViewControllerPrecedingViewController:()PhotosUICore animated:
{
  id v6 = a3;
  v7 = [a1 viewControllers];
  uint64_t v8 = [v7 indexOfObjectIdenticalTo:v6];

  id v9 = 0;
  if (v8 && v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = [v7 objectAtIndexedSubscript:v8 - 1];
    id v9 = [a1 popToViewController:v10 animated:a4];
  }
  return v9;
}

- (BOOL)px_preparePopToViewController:()PhotosUICore forced:
{
  id v7 = a3;
  uint64_t v8 = [a1 viewControllers];
  char v9 = [v8 containsObject:v7];

  if ((v9 & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = [a1 viewControllers];
    [v12 handleFailureInMethod:a2, a1, @"UINavigationController+PhotosUICore.m", 24, @"Trying to pop to a view controller %@ that isn't in the view controllers of %@: %@", v7, a1, v13 object file lineNumber description];
  }
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  if (a4) {
    goto LABEL_5;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__UINavigationController_PhotosUICore__px_preparePopToViewController_forced___block_invoke;
  v16[3] = &unk_1E5DCA598;
  id v17 = v7;
  v18 = &v19;
  objc_msgSend(a1, "px_enumerateDescendantViewControllersWithOptions:usingBlock:", 2, v16);

  if (*((unsigned char *)v20 + 24))
  {
LABEL_5:
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77__UINavigationController_PhotosUICore__px_preparePopToViewController_forced___block_invoke_2;
    v14[3] = &unk_1E5DCA5C0;
    id v15 = v7;
    objc_msgSend(a1, "px_enumerateDescendantViewControllersWithOptions:usingBlock:", 2, v14);

    BOOL v10 = *((unsigned char *)v20 + 24) != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  _Block_object_dispose(&v19, 8);

  return v10;
}

@end