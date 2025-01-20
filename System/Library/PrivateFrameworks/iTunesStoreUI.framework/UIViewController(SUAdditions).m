@interface UIViewController(SUAdditions)
- (BOOL)isDescendantOfViewController:()SUAdditions;
- (BOOL)isInMoreList;
- (SUViewControllerContext)copyArchivableContext;
- (id)_sectionForViewController:()SUAdditions;
- (id)su_closestNavigationController;
- (id)viewControllerFactory;
- (uint64_t)iTunesStoreUI_dismissAction:()SUAdditions;
- (uint64_t)isRootViewController;
- (uint64_t)isSkLoaded;
- (uint64_t)isSkLoading;
- (uint64_t)section;
- (uint64_t)shouldInvalidateForMemoryPurge;
- (void)dismissAnimated:()SUAdditions;
- (void)keyboardDidHideWithInfo:()SUAdditions;
- (void)keyboardDidShowWithInfo:()SUAdditions;
- (void)keyboardWillHideWithInfo:()SUAdditions;
- (void)keyboardWillShowWithInfo:()SUAdditions;
- (void)parentViewControllerHierarchyDidChange;
- (void)resetRestoredContext;
- (void)setBadgeValue:()SUAdditions animated:blink:;
@end

@implementation UIViewController(SUAdditions)

- (void)parentViewControllerHierarchyDidChange
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v1 = [a1 childViewControllers];
  v2 = (void *)[v1 copy];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "parentViewControllerHierarchyDidChange", (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (SUViewControllerContext)copyArchivableContext
{
  v2 = objc_alloc_init(SUViewControllerContext);
  id v3 = [a1 section];
  uint64_t v4 = [v3 identifier];
  [(SUViewControllerContext *)v2 setSectionIdentifier:v4];

  return v2;
}

- (void)dismissAnimated:()SUAdditions
{
  id v14 = [a1 presentingViewController];
  uint64_t v5 = [a1 overlayViewController];
  uint64_t v6 = [a1 _popoverController];
  uint64_t v7 = (void *)v6;
  if (v5)
  {
    v8 = [v5 overlayBackgroundViewController];
    [v8 dismissOverlay:v5 animated:a3];
LABEL_5:

    goto LABEL_6;
  }
  if (v14)
  {
    v8 = objc_msgSend(MEMORY[0x263F1CB68], "transitionSafePerformer:");
    [v8 dismissViewControllerAnimated:a3 completion:0];
    goto LABEL_5;
  }
  if (!v6)
  {
    uint64_t v7 = [a1 tabBarController];
    v8 = [v7 transientViewController];
    if (v8 && [a1 isDescendantOfViewController:v8])
    {
      long long v10 = [MEMORY[0x263F1CB68] transitionSafePerformer:v7];
      [v10 setTransientViewController:0 animated:a3];
    }
    else
    {
      long long v11 = (void *)MEMORY[0x263F1CB68];
      long long v12 = [a1 navigationController];
      long long v10 = [v11 transitionSafePerformer:v12];

      id v13 = (id)[v10 popViewControllerAnimated:a3];
    }

    goto LABEL_5;
  }
  long long v9 = [MEMORY[0x263F1CB68] transitionSafePerformer:v6];

  [v9 dismissPopoverAnimated:a3];
  uint64_t v7 = v9;
LABEL_6:
}

- (uint64_t)iTunesStoreUI_dismissAction:()SUAdditions
{
  return [a1 dismissAnimated:1];
}

- (BOOL)isDescendantOfViewController:()SUAdditions
{
  id v4 = a3;
  id v5 = a1;
  id v6 = v5;
  for (BOOL i = v5 != 0; v6 != v4 && v6; BOOL i = v6 != 0)
  {
    v8 = v6;
    id v6 = [v6 parentViewController];
  }
  return i;
}

- (BOOL)isInMoreList
{
  v2 = [a1 tabBarController];
  if (!v2)
  {
    v2 = +[SUClientDispatch tabBarController];
    if (!v2) {
      return 0;
    }
  }
  id v3 = [v2 moreNavigationController];
  id v4 = [a1 navigationController];
  id v5 = [v2 allViewControllers];
  uint64_t v6 = [v5 indexOfObjectIdenticalTo:v3];
  uint64_t v7 = [v5 indexOfObjectIdenticalTo:v4];
  BOOL v9 = v7 >= v6 && v7 != 0x7FFFFFFFFFFFFFFFLL;

  return v9;
}

- (uint64_t)isSkLoaded
{
  return 1;
}

- (uint64_t)isSkLoading
{
  return 0;
}

- (uint64_t)isRootViewController
{
  v2 = [a1 tabBarController];
  uint64_t v3 = [a1 navigationController];
  id v4 = (void *)v3;
  if (v2 && v3)
  {
    id v5 = [v2 moreNavigationController];
    BOOL v6 = v5 == v4;

    unint64_t v7 = v6;
  }
  else
  {
    if (!v3)
    {
      long long v12 = [a1 parentViewController];
LABEL_14:
      uint64_t v13 = 1;
      goto LABEL_15;
    }
    unint64_t v7 = 0;
  }
  v8 = [v4 viewControllers];
  if (v7 >= [v8 count])
  {
    BOOL v10 = 1;
  }
  else
  {
    BOOL v9 = [v8 objectAtIndex:v7];
    BOOL v10 = v9 == a1;
  }
  long long v11 = [a1 parentViewController];
  long long v12 = v11;
  if (v10) {
    goto LABEL_14;
  }
  uint64_t v13 = 0;
  if (v11 != v4 && v11 != v2) {
    uint64_t v13 = [v11 isRootViewController];
  }
LABEL_15:

  return v13;
}

- (void)keyboardDidHideWithInfo:()SUAdditions
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [a1 childViewControllers];
  BOOL v6 = (void *)[v5 copy];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "keyboardDidHideWithInfo:", v4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)keyboardDidShowWithInfo:()SUAdditions
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [a1 childViewControllers];
  BOOL v6 = (void *)[v5 copy];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "keyboardDidShowWithInfo:", v4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)keyboardWillHideWithInfo:()SUAdditions
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [a1 childViewControllers];
  BOOL v6 = (void *)[v5 copy];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "keyboardWillHideWithInfo:", v4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)keyboardWillShowWithInfo:()SUAdditions
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [a1 childViewControllers];
  BOOL v6 = (void *)[v5 copy];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "keyboardWillShowWithInfo:", v4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)resetRestoredContext
{
  id v1 = [a1 parentViewController];
  [v1 resetRestoredContext];
}

- (id)_sectionForViewController:()SUAdditions
{
  v2 = [a1 parentViewController];
  uint64_t v3 = [v2 _sectionForViewController:a1];

  return v3;
}

- (uint64_t)section
{
  return [a1 _sectionForViewController:0];
}

- (void)setBadgeValue:()SUAdditions animated:blink:
{
  LODWORD(v6) = a4;
  id v8 = a3;
  id v19 = v8;
  if (v8) {
    uint64_t v9 = a5;
  }
  else {
    uint64_t v9 = 0;
  }
  if (v8) {
    uint64_t v6 = v6;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v10 = [a1 tabBarItem];
  [v10 setBadgeValue:v19 animated:v6 blink:v9];

  uint64_t v11 = [a1 tabBarController];
  if (!v11)
  {
    uint64_t v11 = +[SUClientDispatch tabBarController];
  }
  long long v12 = [v11 moreNavigationController];
  long long v13 = [v12 tabBarItem];

  if ([a1 isInMoreList])
  {
    long long v14 = v13;
    id v15 = v19;
    uint64_t v16 = v6;
    uint64_t v17 = v9;
  }
  else
  {
    long long v14 = v13;
    id v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
  }
  [v14 setBadgeValue:v15 animated:v16 blink:v17];
  v18 = [MEMORY[0x263F08A00] defaultCenter];
  [v18 postNotificationName:@"SUViewControllerBadgeDidChangeNotification" object:a1];
}

- (uint64_t)shouldInvalidateForMemoryPurge
{
  return 1;
}

- (id)viewControllerFactory
{
  id v1 = [a1 parentViewController];
  v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 viewControllerFactory];
LABEL_3:
    id v4 = v3;
    goto LABEL_5;
  }
  id v5 = +[SUClientDispatch clientInterface];
  id v4 = [v5 viewControllerFactory];

  if (!v4)
  {
    uint64_t v3 = objc_alloc_init(SUViewControllerFactory);
    goto LABEL_3;
  }
LABEL_5:

  return v4;
}

- (id)su_closestNavigationController
{
  v2 = [a1 navigationController];

  if (v2)
  {
    uint64_t v3 = [a1 navigationController];
  }
  else
  {
    id v4 = [a1 parentViewController];
    uint64_t v3 = objc_msgSend(v4, "su_closestNavigationController");
  }

  return v3;
}

@end