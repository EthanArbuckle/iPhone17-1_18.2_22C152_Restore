@interface UIViewController(MTAdditions)
+ (id)mt_rootViewController;
- (BOOL)mt_isVisible;
- (id)_recursiveDescriptionWithLevel:()MTAdditions result:;
- (id)mt_topNavigationController;
- (id)mt_topViewController;
- (id)mt_topViewControllerExcludingPopovers;
- (id)recursiveDescription;
- (uint64_t)isADescendantOfParentViewController:()MTAdditions;
- (void)useDefaultRestorationIdentifier;
- (void)visitChildenViewControllers:()MTAdditions;
@end

@implementation UIViewController(MTAdditions)

- (void)useDefaultRestorationIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setRestorationIdentifier:v3];
}

- (id)_recursiveDescriptionWithLevel:()MTAdditions result:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [@"\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t\t|\t" substringToIndex:3 * a3];
  [v6 appendFormat:@"%@", v7];

  uint64_t v8 = [a1 restorationIdentifier];
  v9 = (void *)v8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  else {
    v10 = @"nil";
  }
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  [v6 appendFormat:@"(%p) [SRI:%@] %@\n", a1, v10, v12];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v13 = [a1 childViewControllers];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    uint64_t v17 = a3 + 1;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        id v19 = (id)[*(id *)(*((void *)&v21 + 1) + 8 * i) _recursiveDescriptionWithLevel:v17 result:v6];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }

  return v6;
}

- (id)recursiveDescription
{
  v2 = [MEMORY[0x1E4F28E78] string];
  id v3 = [a1 _recursiveDescriptionWithLevel:0 result:v2];

  return v3;
}

- (void)visitChildenViewControllers:()MTAdditions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = objc_msgSend(a1, "childViewControllers", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v12 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
      [v10 visitChildenViewControllers:v4];
      if (v4[2](v4, v10)) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (uint64_t)isADescendantOfParentViewController:()MTAdditions
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  memset(v7, 0, sizeof(v7));
  v4 = objc_msgSend(a3, "childViewControllers", 0);
  if ([v4 countByEnumeratingWithState:v7 objects:v8 count:16])
  {
    if (**((void ***)&v7[0] + 1) == a1) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = objc_msgSend(a1, "isADescendantOfParentViewController:");
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)mt_isVisible
{
  if (![a1 isViewLoaded]) {
    return 0;
  }
  v2 = [a1 view];
  id v3 = [v2 window];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)mt_topViewController
{
  id v1 = a1;
  v2 = [v1 presentedViewController];

  if (v2)
  {
    do
    {
      id v3 = [v1 presentedViewController];

      BOOL v4 = [v3 presentedViewController];

      id v1 = v3;
    }
    while (v4);
  }
  else
  {
    id v3 = v1;
  }

  return v3;
}

- (id)mt_topViewControllerExcludingPopovers
{
  id v1 = a1;
  v2 = [v1 presentedViewController];
  id v3 = v2;
  if (v2
    && ([v2 popoverPresentationController],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    do
    {
      id v5 = v3;

      uint64_t v6 = [v5 popoverPresentationController];

      id v1 = v5;
    }
    while (!v6);
  }
  else
  {
    id v5 = v1;
  }

  return v5;
}

- (id)mt_topNavigationController
{
  id v1 = a1;
  objc_msgSend(MEMORY[0x1E4FB1EC0], "mt_rootViewController");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = 0;
  if (v1)
  {
    while (v1 != v2)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v4 = v1;

        id v3 = v4;
      }
      uint64_t v5 = [v1 parentViewController];

      id v1 = (id)v5;
      if (!v5) {
        goto LABEL_8;
      }
    }
    id v1 = v2;
  }
LABEL_8:
  id v6 = v3;

  return v6;
}

+ (id)mt_rootViewController
{
  v0 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v1 = [v0 delegate];

  id v2 = [v1 window];
  id v3 = [v2 rootViewController];

  return v3;
}

@end