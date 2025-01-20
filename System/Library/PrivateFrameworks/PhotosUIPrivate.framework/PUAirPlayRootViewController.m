@interface PUAirPlayRootViewController
- (NSArray)_childViewConstraints;
- (UIViewController)childViewController;
- (void)_setChildViewConstraints:(id)a3;
- (void)setChildViewController:(id)a3;
- (void)setChildViewController:(id)a3 animated:(BOOL)a4;
- (void)updateViewConstraints;
- (void)viewDidLoad;
@end

@implementation PUAirPlayRootViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__childViewConstraints, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
}

- (void)_setChildViewConstraints:(id)a3
{
}

- (NSArray)_childViewConstraints
{
  return self->__childViewConstraints;
}

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (void)setChildViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (UIViewController *)a3;
  v8 = self->_childViewController;
  if (v8 != v7)
  {
    objc_storeStrong((id *)&self->_childViewController, a3);
    v9 = [(UIViewController *)v7 view];
    v10 = [(UIViewController *)v8 view];
    [(PUAirPlayRootViewController *)self _setChildViewConstraints:0];
    [(UIViewController *)v8 willMoveToParentViewController:0];
    if (v7)
    {
      [(PUAirPlayRootViewController *)self addChildViewController:v7];
      v11 = [(PUAirPlayRootViewController *)self view];
      [v11 addSubview:v9];

      v12 = [(PUAirPlayRootViewController *)self view];
      [v12 setNeedsUpdateConstraints];

      [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__PUAirPlayRootViewController_setChildViewController_animated___block_invoke;
    aBlock[3] = &unk_1E5F2D098;
    id v13 = v10;
    id v23 = v13;
    v24 = v8;
    v25 = v7;
    v26 = self;
    v14 = _Block_copy(aBlock);
    v15 = v14;
    if (v4)
    {
      [v9 setAlpha:0.0];
      v16 = (void *)MEMORY[0x1E4FB1EB0];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __63__PUAirPlayRootViewController_setChildViewController_animated___block_invoke_2;
      v19[3] = &unk_1E5F2ECC8;
      id v20 = v9;
      id v21 = v13;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __63__PUAirPlayRootViewController_setChildViewController_animated___block_invoke_3;
      v17[3] = &unk_1E5F2D990;
      id v18 = v15;
      [v16 _animateUsingDefaultTimingWithOptions:0 animations:v19 completion:v17];
    }
    else
    {
      (*((void (**)(void *))v14 + 2))(v14);
    }
  }
}

uint64_t __63__PUAirPlayRootViewController_setChildViewController_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  [*(id *)(a1 + 40) removeFromParentViewController];
  v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  return [v2 didMoveToParentViewController:v3];
}

void *__63__PUAirPlayRootViewController_setChildViewController_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  result = *(void **)(a1 + 40);
  if (result && !*(void *)(a1 + 32))
  {
    return (void *)[result setAlpha:0.0];
  }
  return result;
}

uint64_t __63__PUAirPlayRootViewController_setChildViewController_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setChildViewController:(id)a3
{
}

- (void)updateViewConstraints
{
  v12.receiver = self;
  v12.super_class = (Class)PUAirPlayRootViewController;
  [(PUAirPlayRootViewController *)&v12 updateViewConstraints];
  uint64_t v3 = [(PUAirPlayRootViewController *)self childViewController];
  BOOL v4 = [v3 view];

  if (v4)
  {
    uint64_t v5 = [v4 superview];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [(PUAirPlayRootViewController *)self _childViewConstraints];

      if (!v7)
      {
        v8 = _NSDictionaryOfVariableBindings(&cfstr_Childview.isa, v4, 0);
        v9 = [MEMORY[0x1E4F1CA48] array];
        v10 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[childView]|" options:0 metrics:0 views:v8];
        [v9 addObjectsFromArray:v10];

        v11 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[childView]|" options:0 metrics:0 views:v8];
        [v9 addObjectsFromArray:v11];

        [MEMORY[0x1E4F28DC8] activateConstraints:v9];
        [(PUAirPlayRootViewController *)self _setChildViewConstraints:v9];
      }
    }
  }
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PUAirPlayRootViewController;
  [(PUAirPlayRootViewController *)&v6 viewDidLoad];
  uint64_t v3 = +[PUInterfaceManager currentTheme];
  BOOL v4 = [v3 airPlayControllerBackgroundColor];

  uint64_t v5 = [(PUAirPlayRootViewController *)self view];
  [v5 setBackgroundColor:v4];
}

@end