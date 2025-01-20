@interface UIMoreNavigationController
+ (Class)_moreListControllerClass;
- (BOOL)allowsCustomizing;
- (BOOL)moreViewControllersChanged;
- (NSArray)moreViewControllers;
- (UIMoreNavigationController)init;
- (UIViewController)displayedViewController;
- (UIViewController)moreListController;
- (id)_preparedViewController:(id)a3;
- (id)_resolvedTab;
- (id)_stateRestorationParentForChildViewController:(id)a3 index:(unint64_t *)a4;
- (void)_ensureChildrenHaveParentViewController;
- (void)_redisplayMoreTableView;
- (void)_restoreOriginalNavigationController;
- (void)_willChangeToIdiom:(int64_t)a3 onScreen:(id)a4;
- (void)didShowViewController:(id)a3 animated:(BOOL)a4;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)restoreOriginalNavigationControllerIfNecessary:(id)a3;
- (void)setAllowsCustomizing:(BOOL)a3;
- (void)setDisplayedViewController:(id)a3;
- (void)setMoreViewControllers:(id)a3;
- (void)setMoreViewControllersChanged:(BOOL)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
@end

@implementation UIMoreNavigationController

- (void)_willChangeToIdiom:(int64_t)a3 onScreen:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)UIMoreNavigationController;
  [(UIViewController *)&v6 _willChangeToIdiom:a3 onScreen:a4];
  [(UINavigationController *)self setNavigationBarHidden:a3 == 3 animated:0];
}

- (UIViewController)displayedViewController
{
  v2 = self;
  v3 = v2;
  originalNavigationController = v2->_originalNavigationController;
  if (originalNavigationController)
  {
    v5 = originalNavigationController;
  }
  else
  {
    objc_super v6 = [(UINavigationController *)v2 viewControllers];
    unint64_t v7 = [v6 count];

    if (v7 < 2) {
      goto LABEL_6;
    }
    v8 = [(UINavigationController *)v3 viewControllers];
    v5 = [(UIMoreNavigationController *)v8 objectAtIndex:1];

    v3 = v8;
  }

  v3 = v5;
LABEL_6:
  return (UIViewController *)v3;
}

- (NSArray)moreViewControllers
{
  return [(UIMoreListController *)self->_moreListController moreViewControllers];
}

- (void)setAllowsCustomizing:(BOOL)a3
{
}

- (UIViewController)moreListController
{
  return &self->_moreListController->super;
}

- (UIMoreNavigationController)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIMoreNavigationController;
  v2 = [(UIViewController *)&v6 init];
  if (v2)
  {
    v3 = (UIMoreListController *)objc_alloc_init((Class)[(id)objc_opt_class() _moreListControllerClass]);
    moreListController = v2->_moreListController;
    v2->_moreListController = v3;

    [(UIMoreNavigationController *)v2 pushViewController:v2->_moreListController animated:0];
  }
  return v2;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v10[1] = *MEMORY[0x1E4F143B8];
  objc_super v6 = [(UIMoreNavigationController *)self _preparedViewController:a3];
  if ([v6 count] == 1 || (dyld_program_sdk_at_least() & 1) == 0)
  {
    v8 = [v6 firstObject];
    if (!v8)
    {
LABEL_8:

      goto LABEL_9;
    }
    v9.receiver = self;
    v9.super_class = (Class)UIMoreNavigationController;
    [(UINavigationController *)&v9 pushViewController:v8 animated:v4];
LABEL_7:
    [(id)UIApp _findBestActivityToMakeCurrent:self];
    goto LABEL_8;
  }
  if ([v6 count])
  {
    v10[0] = self->_moreListController;
    unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    v8 = [v7 arrayByAddingObjectsFromArray:v6];

    [(UINavigationController *)self setViewControllers:v8 animated:v4];
    goto LABEL_7;
  }
LABEL_9:
}

+ (Class)_moreListControllerClass
{
  return (Class)objc_opt_class();
}

- (void)setMoreViewControllers:(id)a3
{
  [(UIMoreListController *)self->_moreListController setMoreViewControllers:a3];
  [(UIMoreNavigationController *)self _ensureChildrenHaveParentViewController];
}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)UIMoreNavigationController;
  objc_super v6 = (UIMoreListController *)a3;
  [(UINavigationController *)&v8 didShowViewController:v6 animated:v4];
  moreListController = self->_moreListController;

  if (moreListController == v6) {
    [(UIMoreNavigationController *)self _restoreOriginalNavigationController];
  }
  [(UIMoreNavigationController *)self _ensureChildrenHaveParentViewController];
}

- (void)_ensureChildrenHaveParentViewController
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(UIViewController *)self parentViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 viewControllers];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          objc_super v9 = -[UIViewController _parentViewController]((id *)v8);

          if (v8) {
            BOOL v10 = v9 == 0;
          }
          else {
            BOOL v10 = 0;
          }
          if (v10)
          {
            __int16 v11 = *(_WORD *)(v8 + 384);
            *(_WORD *)(v8 + 384) = v11 | 0x100;
            [(id)v8 setParentViewController:v2];
            *(_WORD *)(v8 + 384) = *(_WORD *)(v8 + 384) & 0xFEFF | v11 & 0x100;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
  }
}

- (void)setDisplayedViewController:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(UIMoreNavigationController *)self _restoreOriginalNavigationController];
  uint64_t v5 = [(UIMoreNavigationController *)self _preparedViewController:v4];

  v8[0] = self->_moreListController;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  unint64_t v7 = [v6 arrayByAddingObjectsFromArray:v5];
  [(UINavigationController *)self setViewControllers:v7];

  [(id)UIApp _findBestActivityToMakeCurrent:self];
}

- (id)_preparedViewController:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      p_originalNavigationController = &self->_originalNavigationController;
      objc_storeStrong((id *)&self->_originalNavigationController, a3);
      unint64_t v7 = [v5 viewControllers];
      if (dyld_program_sdk_at_least()) {
        [v7 firstObject];
      }
      else {
      uint64_t v8 = [v7 lastObject];
      }
      originalRootViewController = self->_originalRootViewController;
      self->_originalRootViewController = v8;

      BOOL v10 = *p_originalNavigationController;
      if (*p_originalNavigationController)
      {
        __int16 v11 = *((_WORD *)&v10->super._viewControllerFlags + 4);
        *((_WORD *)&v10->super._viewControllerFlags + 4) = v11 | 0x100;
        [(UIViewController *)v10 setParentViewController:0];
        *((_WORD *)&v10->super._viewControllerFlags + 4) = *((_WORD *)&v10->super._viewControllerFlags + 4) & 0xFEFF | v11 & 0x100;
        long long v12 = *p_originalNavigationController;
      }
      else
      {
        long long v12 = 0;
      }
      [(UINavigationController *)v12 setViewControllers:MEMORY[0x1E4F1CBF0]];
    }
    else
    {
      v14[0] = v5;
      unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    }
  }
  else
  {
    unint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (void)_restoreOriginalNavigationController
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (self->_originalNavigationController)
  {
    if (dyld_program_sdk_at_least())
    {
      v3 = [(UINavigationController *)self viewControllers];
      id v4 = [v3 firstObject];
      moreListController = self->_moreListController;

      if (v4 == moreListController)
      {
        uint64_t v6 = objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);

        v3 = (void *)v6;
      }
      if (![v3 count])
      {
        if (self->_originalRootViewController)
        {
          v19[0] = self->_originalRootViewController;
          uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];

          v3 = (void *)v7;
        }
        else
        {

          v3 = (void *)MEMORY[0x1E4F1CBF0];
        }
      }
      id v9 = [(UINavigationController *)self popToRootViewControllerAnimated:0];
    }
    else
    {
      if (self->_originalRootViewController)
      {
        originalRootViewController = self->_originalRootViewController;
        v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&originalRootViewController count:1];
      }
      else
      {
        v3 = (void *)MEMORY[0x1E4F1CBF0];
      }
      id v8 = [(UINavigationController *)self popViewControllerAnimated:0];
    }
    BOOL v10 = [v3 lastObject];
    __int16 v11 = [v10 _existingView];
    long long v12 = [v11 superview];
    [v12 removeFromSuperview];

    originalNavigationController = self->_originalNavigationController;
    long long v14 = [(UIViewController *)self tabBarController];
    if (originalNavigationController)
    {
      __int16 v15 = *((_WORD *)&originalNavigationController->super._viewControllerFlags + 4);
      *((_WORD *)&originalNavigationController->super._viewControllerFlags + 4) = v15 | 0x100;
      [(UIViewController *)originalNavigationController setParentViewController:v14];
      *((_WORD *)&originalNavigationController->super._viewControllerFlags + 4) = *((_WORD *)&originalNavigationController->super._viewControllerFlags
                                                                                  + 4) & 0xFEFF | v15 & 0x100;
    }

    [(UINavigationController *)self->_originalNavigationController setViewControllers:v3];
    v16 = self->_originalNavigationController;
    self->_originalNavigationController = 0;

    uint64_t v17 = self->_originalRootViewController;
    self->_originalRootViewController = 0;
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)UIMoreNavigationController;
  [(UINavigationController *)&v6 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (!a3)
  {
    if ([(UINavigationController *)self needsDeferredTransition]) {
      [(UINavigationController *)self _startDeferredTransitionIfNeeded];
    }
  }
}

- (id)_resolvedTab
{
  v2 = objc_alloc_init(_UIMoreTabElement);
  return v2;
}

- (void)restoreOriginalNavigationControllerIfNecessary:(id)a3
{
  if (self->_originalNavigationController == a3) {
    [(UIMoreNavigationController *)self _restoreOriginalNavigationController];
  }
}

- (id)_stateRestorationParentForChildViewController:(id)a3 index:(unint64_t *)a4
{
  objc_super v6 = (UIMoreListController *)a3;
  uint64_t v7 = [(UIMoreNavigationController *)self moreViewControllers];
  int v8 = [v7 containsObject:v6];

  if (v8)
  {
    id v9 = [(UIViewController *)self tabBarController];
    goto LABEL_9;
  }
  if (!self->_originalNavigationController
    || self->_moreListController == v6
    || ([(UINavigationController *)self viewControllers],
        BOOL v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 containsObject:v6],
        v10,
        !v11))
  {
    id v9 = 0;
LABEL_9:
    unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    if (!a4) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  id v9 = self->_originalNavigationController;
  unint64_t v12 = 0;
  if (a4) {
LABEL_10:
  }
    *a4 = v12;
LABEL_11:

  return v9;
}

- (void)_redisplayMoreTableView
{
  id v2 = [(UIMoreListController *)self->_moreListController table];
  [v2 reloadData];
}

- (BOOL)allowsCustomizing
{
  return [(UIMoreListController *)self->_moreListController allowsCustomizing];
}

- (BOOL)moreViewControllersChanged
{
  return [(UIMoreListController *)self->_moreListController moreViewControllersChanged];
}

- (void)setMoreViewControllersChanged:(BOOL)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRootViewController, 0);
  objc_storeStrong((id *)&self->_originalNavigationController, 0);
  objc_storeStrong((id *)&self->_moreListController, 0);
}

@end