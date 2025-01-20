@interface SUNavigationContainerViewController
- (AMSBinaryPromise)appearancePromise;
- (BOOL)bridgedNavigation;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldRunPopHandler;
- (SUNavigationContainerViewController)initWithChildViewController:(id)a3;
- (UIViewController)embeddedViewController;
- (id)popHandler;
- (void)setAppearancePromise:(id)a3;
- (void)setBridgedNavigation:(BOOL)a3;
- (void)setEmbeddedViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setPopHandler:(id)a3;
- (void)setShouldRunPopHandler:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SUNavigationContainerViewController

- (SUNavigationContainerViewController)initWithChildViewController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)SUNavigationContainerViewController;
    v5 = [(SUViewController *)&v15 init];
    if (v5)
    {
      id v6 = v4;
      v7 = [v6 parentViewController];

      if (v7)
      {
        [v6 willMoveToParentViewController:0];
        v8 = [v6 view];
        [v8 removeFromSuperview];

        [v6 removeFromParentViewController];
      }
      v9 = (AMSBinaryPromise *)objc_alloc_init(MEMORY[0x263F27B58]);
      appearancePromise = v5->_appearancePromise;
      v5->_appearancePromise = v9;

      [(SUNavigationContainerViewController *)v5 addChildViewController:v6];
      v11 = [(SUNavigationContainerViewController *)v5 view];
      v12 = [v6 view];
      [v11 addSubview:v12];

      [v6 didMoveToParentViewController:v5];
    }
    self = v5;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SUNavigationContainerViewController;
  [(SUNavigationContainerViewController *)&v5 viewDidLoad];
  v3 = [(SUNavigationContainerViewController *)self view];
  id v4 = [MEMORY[0x263F1C550] systemBackgroundColor];
  [v3 setBackgroundColor:v4];
}

- (void)viewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)SUNavigationContainerViewController;
  [(SUNavigationContainerViewController *)&v6 viewWillLayoutSubviews];
  v3 = [(SUNavigationContainerViewController *)self embeddedViewController];
  id v4 = [v3 view];
  objc_super v5 = [(SUNavigationContainerViewController *)self view];
  [v5 bounds];
  objc_msgSend(v4, "setFrame:");
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUNavigationContainerViewController;
  [(SUViewController *)&v7 viewDidAppear:a3];
  id v4 = [(SUNavigationContainerViewController *)self appearancePromise];
  [v4 finishWithSuccess];

  if ([(SUNavigationContainerViewController *)self shouldRunPopHandler])
  {
    [(SUNavigationContainerViewController *)self setShouldRunPopHandler:0];
    objc_super v5 = [(SUNavigationContainerViewController *)self popHandler];

    if (v5)
    {
      objc_super v6 = [(SUNavigationContainerViewController *)self popHandler];
      ((void (**)(void, SUNavigationContainerViewController *))v6)[2](v6, self);
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(UIViewController *)self su_closestNavigationController];
  objc_super v6 = [v5 topViewController];
  BOOL v7 = v6 != self;

  [(SUNavigationContainerViewController *)self setShouldRunPopHandler:v7];
  v8.receiver = self;
  v8.super_class = (Class)SUNavigationContainerViewController;
  [(SUViewController *)&v8 viewDidDisappear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F27B58]);
  [(SUNavigationContainerViewController *)self setAppearancePromise:v5];

  v6.receiver = self;
  v6.super_class = (Class)SUNavigationContainerViewController;
  [(SUViewController *)&v6 viewWillDisappear:v3];
}

- (void)setEmbeddedViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(void))a5;
  v10 = [(SUNavigationContainerViewController *)self embeddedViewController];
  id v11 = v8;
  id v12 = v11;
  if (!v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x263F1CB68]);
    v13 = [v12 view];
    v14 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [v13 setBackgroundColor:v14];
  }
  objc_super v15 = [v12 view];
  v16 = [v10 view];
  [v16 frame];
  objc_msgSend(v15, "setFrame:");

  [v10 willMoveToParentViewController:0];
  if (a4)
  {
    [(SUNavigationContainerViewController *)self addChildViewController:v12];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __85__SUNavigationContainerViewController_setEmbeddedViewController_animated_completion___block_invoke_2;
    v21[3] = &unk_264813F00;
    id v22 = v10;
    id v23 = v12;
    v24 = self;
    v25 = v9;
    v20.receiver = self;
    v20.super_class = (Class)SUNavigationContainerViewController;
    [(SUNavigationContainerViewController *)&v20 transitionFromViewController:v22 toViewController:v23 duration:5242880 options:&__block_literal_global_9 animations:v21 completion:0.5];
  }
  else
  {
    v17 = [v10 view];
    [v17 removeFromSuperview];

    [v10 removeFromParentViewController];
    [(SUNavigationContainerViewController *)self addChildViewController:v12];
    v18 = [(SUNavigationContainerViewController *)self view];
    v19 = [v12 view];
    [v18 addSubview:v19];

    [v12 didMoveToParentViewController:self];
    if (v9) {
      v9[2](v9);
    }
  }
}

uint64_t __85__SUNavigationContainerViewController_setEmbeddedViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromParentViewController];
  [*(id *)(a1 + 40) didMoveToParentViewController:*(void *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 1;
}

- (UIViewController)embeddedViewController
{
  v2 = [(SUNavigationContainerViewController *)self childViewControllers];
  BOOL v3 = [v2 firstObject];

  return (UIViewController *)v3;
}

- (AMSBinaryPromise)appearancePromise
{
  return self->_appearancePromise;
}

- (void)setAppearancePromise:(id)a3
{
}

- (BOOL)bridgedNavigation
{
  return self->_bridgedNavigation;
}

- (void)setBridgedNavigation:(BOOL)a3
{
  self->_bridgedNavigation = a3;
}

- (id)popHandler
{
  return self->_popHandler;
}

- (void)setPopHandler:(id)a3
{
}

- (BOOL)shouldRunPopHandler
{
  return self->_shouldRunPopHandler;
}

- (void)setShouldRunPopHandler:(BOOL)a3
{
  self->_shouldRunPopHandler = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_popHandler, 0);

  objc_storeStrong((id *)&self->_appearancePromise, 0);
}

@end