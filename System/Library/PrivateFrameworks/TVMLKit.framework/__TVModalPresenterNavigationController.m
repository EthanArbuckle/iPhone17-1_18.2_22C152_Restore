@interface __TVModalPresenterNavigationController
- (BOOL)shouldAutorotate;
- (NSArray)previousViewControllers;
- (__TVModalPresenterNavigationController)initWithRootViewController:(id)a3;
- (id)activeDocument;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (id)dismissalBlock;
- (id)popViewControllerAnimated:(BOOL)a3;
- (void)_dismissForLastViewController;
- (void)_dismissForLastViewController:(BOOL)a3;
- (void)_ensureNavigationBarHiddenSafelyForViewSize:(CGSize)a3;
- (void)didShowViewController:(id)a3 animated:(BOOL)a4;
- (void)popViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)pushViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)reset;
- (void)setDismissalBlock:(id)a3;
- (void)setPreviousViewControllers:(id)a3;
- (void)updatePreferredFocusedViewStateForFocus:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation __TVModalPresenterNavigationController

- (__TVModalPresenterNavigationController)initWithRootViewController:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)__TVModalPresenterNavigationController;
  v6 = [(__TVModalPresenterNavigationController *)&v15 initWithRootViewController:v5];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rootViewController, a3);
    uint64_t v8 = [MEMORY[0x263F08968] mapTableWithKeyOptions:5 valueOptions:0x10000];
    pushCompletionBlocks = v7->_pushCompletionBlocks;
    v7->_pushCompletionBlocks = (NSMapTable *)v8;

    uint64_t v10 = [MEMORY[0x263F08968] mapTableWithKeyOptions:5 valueOptions:0x10000];
    popCompletionBlocks = v7->_popCompletionBlocks;
    v7->_popCompletionBlocks = (NSMapTable *)v10;

    [(__TVModalPresenterNavigationController *)v7 setNavigationBarHidden:1 animated:0];
    v12 = [(__TVModalPresenterNavigationController *)v7 navigationBar];
    [v12 setPrefersLargeTitles:1];

    v13 = [(__TVModalPresenterNavigationController *)v7 navigationBar];
    [v13 _setHidesShadow:1];
  }
  return v7;
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  v2 = [(__TVModalPresenterNavigationController *)self childViewControllers];
  v3 = [v2 lastObject];

  return v3;
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)__TVModalPresenterNavigationController;
  [(__TVModalPresenterNavigationController *)&v6 viewDidLayoutSubviews];
  v3 = [(__TVModalPresenterNavigationController *)self view];
  [v3 frame];
  -[__TVModalPresenterNavigationController _ensureNavigationBarHiddenSafelyForViewSize:](self, "_ensureNavigationBarHiddenSafelyForViewSize:", v4, v5);
}

- (void)_ensureNavigationBarHiddenSafelyForViewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_super v6 = [(__TVModalPresenterNavigationController *)self topViewController];
  v13 = objc_getAssociatedObject(v6, "TVMLPresenterConfiguration");

  uint64_t v8 = v13;
  if (v13)
  {
    uint64_t v7 = [v13 navigationBarHidden];
    uint64_t v8 = v13;
    if (v7)
    {
      uint64_t v9 = [v13 configurationType];
      uint64_t v8 = v13;
      if (v9 == 1 || (v7 = [v13 configurationType], uint64_t v8 = v13, v7 == 3))
      {
        if ([v8 configurationType] == 1) {
          [v13 formSheetSize];
        }
        else {
          [v13 popoverSize];
        }
        if (width == v10 && height == v11 || ([v13 navigationBarHidden] & 1) == 0) {
          uint64_t v12 = [v13 navigationBarHidden];
        }
        else {
          uint64_t v12 = 0;
        }
        uint64_t v7 = [(__TVModalPresenterNavigationController *)self setNavigationBarHidden:v12];
        uint64_t v8 = v13;
      }
    }
  }
  MEMORY[0x270F9A758](v7, v8);
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  if (a5)
  {
    pushCompletionBlocks = self->_pushCompletionBlocks;
    uint64_t v9 = (void *)MEMORY[0x230FC9DC0](a5);
    [(NSMapTable *)pushCompletionBlocks setObject:v9 forKey:v10];
  }
  [(__TVModalPresenterNavigationController *)self pushViewController:v10 animated:v6];
}

- (void)popViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  if (a4)
  {
    popCompletionBlocks = self->_popCompletionBlocks;
    uint64_t v7 = (void *)MEMORY[0x230FC9DC0](a4, a2);
    uint64_t v8 = [(__TVModalPresenterNavigationController *)self viewControllers];
    uint64_t v9 = [v8 lastObject];
    [(NSMapTable *)popCompletionBlocks setObject:v7 forKey:v9];
  }
  id v10 = [(__TVModalPresenterNavigationController *)self popViewControllerAnimated:v4];
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(__TVModalPresenterNavigationController *)self viewControllers];
  uint64_t v8 = [v7 count];

  if (v8 == 1)
  {
    uint64_t v9 = [v6 navigationItem];
    [v9 setHidesBackButton:1];
  }
  id v10 = [(__TVModalPresenterNavigationController *)self viewControllers];
  [(__TVModalPresenterNavigationController *)self setPreviousViewControllers:v10];

  v11.receiver = self;
  v11.super_class = (Class)__TVModalPresenterNavigationController;
  [(__TVModalPresenterNavigationController *)&v11 pushViewController:v6 animated:v4];
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(__TVModalPresenterNavigationController *)self viewControllers];
  [(__TVModalPresenterNavigationController *)self setPreviousViewControllers:v5];

  id v6 = [(__TVModalPresenterNavigationController *)self viewControllers];
  uint64_t v7 = [v6 count];

  if (v7 == 2)
  {
    [(__TVModalPresenterNavigationController *)self _dismissForLastViewController:v3];
    uint64_t v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)__TVModalPresenterNavigationController;
    uint64_t v8 = [(__TVModalPresenterNavigationController *)&v10 popViewControllerAnimated:v3];
  }
  return v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  self->_isModalNavVisisble = 1;
  v3.receiver = self;
  v3.super_class = (Class)__TVModalPresenterNavigationController;
  [(__TVModalPresenterNavigationController *)&v3 viewWillAppear:a3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)__TVModalPresenterNavigationController;
  [(__TVModalPresenterNavigationController *)&v5 viewDidAppear:a3];
  BOOL v4 = [(__TVModalPresenterNavigationController *)self interactivePopGestureRecognizer];
  [v4 setEnabled:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(__TVModalPresenterNavigationController *)self isBeingDismissed])
  {
    objc_super v5 = [MEMORY[0x263F1C408] sharedApplication];
    id v6 = [v5 delegate];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v6 setOverrideOrientation:0];
    }
    self->_isModalNavVisisble = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)__TVModalPresenterNavigationController;
  [(__TVModalPresenterNavigationController *)&v7 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)__TVModalPresenterNavigationController;
  [(__TVModalPresenterNavigationController *)&v6 viewDidDisappear:a3];
  if (!self->_isModalNavVisisble)
  {
    BOOL v4 = [(__TVModalPresenterNavigationController *)self dismissalBlock];

    if (v4)
    {
      objc_super v5 = [(__TVModalPresenterNavigationController *)self dismissalBlock];
      v5[2]();

      [(__TVModalPresenterNavigationController *)self setDismissalBlock:0];
    }
  }
}

- (void)reset
{
  v4[1] = *MEMORY[0x263EF8340];
  [(NSMapTable *)self->_popCompletionBlocks removeAllObjects];
  [(NSMapTable *)self->_pushCompletionBlocks removeAllObjects];
  v4[0] = self->_rootViewController;
  BOOL v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  [(__TVModalPresenterNavigationController *)self setViewControllers:v3];

  [(__TVModalPresenterNavigationController *)self setPreviousViewControllers:0];
}

- (BOOL)shouldAutorotate
{
  BOOL v3 = [MEMORY[0x263F1C5C0] currentDevice];
  BOOL v4 = [v3 userInterfaceIdiom] == 1 || self->_isModalNavVisisble;

  return v4;
}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  id v13 = a3;
  objc_super v5 = [(__TVModalPresenterNavigationController *)self previousViewControllers];
  objc_super v6 = [(__TVModalPresenterNavigationController *)self viewControllers];
  if (([v5 containsObject:v13] & 1) == 0
    && ([v6 lastObject], id v7 = (id)objc_claimAutoreleasedReturnValue(), v7, v7 == v13))
  {
    objc_super v10 = [(NSMapTable *)self->_pushCompletionBlocks objectForKey:v13];
    [(NSMapTable *)self->_pushCompletionBlocks removeObjectForKey:v13];
  }
  else
  {
    popCompletionBlocks = self->_popCompletionBlocks;
    uint64_t v9 = [v5 lastObject];
    objc_super v10 = [(NSMapTable *)popCompletionBlocks objectForKey:v9];

    objc_super v11 = self->_popCompletionBlocks;
    uint64_t v12 = [v5 lastObject];
    [(NSMapTable *)v11 removeObjectForKey:v12];
  }
  [(__TVModalPresenterNavigationController *)self setPreviousViewControllers:0];
  if (v10) {
    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
}

- (void)_dismissForLastViewController
{
}

- (void)_dismissForLastViewController:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(__TVModalPresenterNavigationController *)self previousViewControllers];
  id v9 = [v5 lastObject];

  objc_super v6 = [(NSMapTable *)self->_popCompletionBlocks objectForKey:v9];
  id v7 = +[_TVModalPresenter presenter];
  [v7 _dismissAnimated:v3 completion:v6];

  uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 postNotificationName:@"TVModalPresenterDismissedNotification" object:0];
}

- (void)updatePreferredFocusedViewStateForFocus:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(__TVModalPresenterNavigationController *)self childViewControllers];
  id v5 = [v4 lastObject];

  if ([v5 conformsToProtocol:&unk_26E5D0B90]) {
    [v5 updatePreferredFocusedViewStateForFocus:v3];
  }
}

- (id)activeDocument
{
  v2 = [(__TVModalPresenterNavigationController *)self topViewController];
  if ([v2 conformsToProtocol:&unk_26E5D0C80]) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  BOOL v4 = [v3 activeDocument];

  return v4;
}

- (NSArray)previousViewControllers
{
  return self->_previousViewControllers;
}

- (void)setPreviousViewControllers:(id)a3
{
}

- (id)dismissalBlock
{
  return self->_dismissalBlock;
}

- (void)setDismissalBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissalBlock, 0);
  objc_storeStrong((id *)&self->_previousViewControllers, 0);
  objc_storeStrong((id *)&self->_popCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_pushCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
}

@end