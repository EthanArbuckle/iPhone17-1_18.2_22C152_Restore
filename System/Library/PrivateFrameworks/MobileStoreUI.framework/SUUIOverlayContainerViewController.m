@interface SUUIOverlayContainerViewController
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (CGRect)_centeredFrameForViewController:(id)a3 inBounds:(CGRect)a4;
- (CGSize)_overlaySizeForController:(id)a3 atBoundsSize:(CGSize)a4;
- (NSArray)viewControllers;
- (SUUIOverlayContainerDelegate)delegate;
- (SUUIOverlayContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIColor)dimmingViewColor;
- (UIControl)backstopControl;
- (double)_overlaySpacingForSize:(CGSize)a3;
- (id)_selectedViewController;
- (id)_viewControllerForPoint:(CGPoint)a3;
- (int64_t)_indexOfViewControllerForPoint:(CGPoint)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_fadeInViewController:(id)a3 withCompletionBlock:(id)a4;
- (void)_frameAction:(id)a3;
- (void)_popViewControllers;
- (void)_positionViewControllersForSize:(CGSize)a3 traitCollection:(id)a4;
- (void)_pushViewController:(id)a3;
- (void)_removeChildren;
- (void)_slideInViewController:(id)a3 withCompletionBlock:(id)a4;
- (void)_tapAction:(id)a3;
- (void)dealloc;
- (void)dismissWithFadeTransitionCompletionBlock:(id)a3;
- (void)dismissWithFlipTransition:(id)a3 completionBlock:(id)a4;
- (void)loadView;
- (void)popViewControllerAnimated:(BOOL)a3;
- (void)popViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)replaceViewController:(id)a3 withViewController:(id)a4;
- (void)setDelegate:(id)a3;
- (void)showViewController:(id)a3 withCompletionBlock:(id)a4;
- (void)showViewController:(id)a3 withFlipTransition:(id)a4 completionBlock:(id)a5;
- (void)showViewControllers:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SUUIOverlayContainerViewController

- (SUUIOverlayContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SUUIOverlayContainerViewController;
  v4 = [(SUUIOverlayContainerViewController *)&v9 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v4->_selectedViewControllerIndex = 0x7FFFFFFFFFFFFFFFLL;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    viewControllers = v5->_viewControllers;
    v5->_viewControllers = v6;
  }
  return v5;
}

- (void)dealloc
{
  [(UIControl *)self->_backstopView removeGestureRecognizer:self->_tapGestureRecognizer];
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer removeTarget:self action:0];
  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIOverlayContainerViewController;
  [(SUUIOverlayContainerViewController *)&v3 dealloc];
}

- (UIControl)backstopControl
{
  backstopView = self->_backstopView;
  if (!backstopView)
  {
    v4 = objc_alloc_init(SUUIOverlayContainerView);
    v5 = self->_backstopView;
    self->_backstopView = &v4->super;

    v6 = self->_backstopView;
    v7 = [MEMORY[0x263F825C8] clearColor];
    [(UIControl *)v6 setBackgroundColor:v7];

    [(UIControl *)self->_backstopView addTarget:self action:sel__frameAction_ forControlEvents:4096];
    v8 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__tapAction_];
    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v8;

    [(UITapGestureRecognizer *)self->_tapGestureRecognizer setDelegate:self];
    [(UIControl *)self->_backstopView addGestureRecognizer:self->_tapGestureRecognizer];
    backstopView = self->_backstopView;
  }
  return backstopView;
}

- (void)dismissWithFlipTransition:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v7 = [a3 flipSourceView];
  backstopView = self->_backstopView;
  [v7 frame];
  -[UIControl convertRect:fromView:](backstopView, "convertRect:fromView:", 0);
  objc_msgSend(v7, "setFrame:");
  objc_super v9 = [(NSMutableArray *)self->_viewControllers objectAtIndex:self->_selectedViewControllerIndex];
  v10 = [v9 view];
  self->_isAdjustingViewsForDismiss = 1;
  v11 = [[SUUIScalingFlipView alloc] initWithFrontView:v10 backView:v7];
  [(UIControl *)self->_backstopView addSubview:v11];
  [(SUUIScalingFlipView *)v11 setDirection:1];
  [(SUUIScalingFlipView *)v11 setDuration:0.449999988];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __80__SUUIOverlayContainerViewController_dismissWithFlipTransition_completionBlock___block_invoke;
  v15[3] = &unk_265400980;
  v15[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v15 animations:0.449999988];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __80__SUUIOverlayContainerViewController_dismissWithFlipTransition_completionBlock___block_invoke_2;
  v13[3] = &unk_2654059E8;
  v13[4] = self;
  id v14 = v6;
  id v12 = v6;
  [(SUUIScalingFlipView *)v11 performFlipWithCompletionBlock:v13];
  self->_isAdjustingViewsForDismiss = 0;
}

void __80__SUUIOverlayContainerViewController_dismissWithFlipTransition_completionBlock___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 976);
  id v2 = [MEMORY[0x263F825C8] clearColor];
  [v1 setBackgroundColor:v2];
}

uint64_t __80__SUUIOverlayContainerViewController_dismissWithFlipTransition_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 removeFromSuperview];
  [*(id *)(a1 + 32) _removeChildren];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)dismissWithFadeTransitionCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F82E00];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__SUUIOverlayContainerViewController_dismissWithFadeTransitionCompletionBlock___block_invoke;
  v9[3] = &unk_265400980;
  v9[4] = self;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__SUUIOverlayContainerViewController_dismissWithFadeTransitionCompletionBlock___block_invoke_2;
  v7[3] = &unk_265400B68;
  id v8 = v4;
  id v6 = v4;
  [v5 animateWithDuration:v9 animations:v7 completion:0.449999988];
}

void __79__SUUIOverlayContainerViewController_dismissWithFadeTransitionCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(*(void *)(a1 + 32) + 976);
  objc_super v3 = [MEMORY[0x263F825C8] clearColor];
  [v2 setBackgroundColor:v3];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 1016);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "view", (void)v10);
        [v9 setAlpha:0.0];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

uint64_t __79__SUUIOverlayContainerViewController_dismissWithFadeTransitionCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)popViewControllerAnimated:(BOOL)a3
{
}

- (void)popViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  int64_t selectedViewControllerIndex = self->_selectedViewControllerIndex;
  BOOL v9 = selectedViewControllerIndex < 1;
  int64_t v10 = selectedViewControllerIndex - 1;
  if (!v9)
  {
    self->_int64_t selectedViewControllerIndex = v10;
    if (a3)
    {
      ++self->_popViewControllerCount;
      long long v11 = (void *)MEMORY[0x263F82E00];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __75__SUUIOverlayContainerViewController_popViewControllerAnimated_completion___block_invoke;
      v20[3] = &unk_265400980;
      v20[4] = self;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __75__SUUIOverlayContainerViewController_popViewControllerAnimated_completion___block_invoke_2;
      v18[3] = &unk_265404258;
      v18[4] = self;
      id v19 = v6;
      [v11 animateWithDuration:v20 animations:v18 completion:0.349999994];
    }
    else
    {
      long long v12 = [(SUUIOverlayContainerViewController *)self view];
      [v12 bounds];
      double v14 = v13;
      double v16 = v15;
      v17 = [(SUUIOverlayContainerViewController *)self traitCollection];
      -[SUUIOverlayContainerViewController _positionViewControllersForSize:traitCollection:](self, "_positionViewControllersForSize:traitCollection:", v17, v14, v16);

      [(SUUIOverlayContainerViewController *)self _popViewControllers];
    }
  }
}

void __75__SUUIOverlayContainerViewController_popViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v8 = [v2 view];
  [v8 bounds];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = [*(id *)(a1 + 32) traitCollection];
  objc_msgSend(v2, "_positionViewControllersForSize:traitCollection:", v7, v4, v6);
}

uint64_t __75__SUUIOverlayContainerViewController_popViewControllerAnimated_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _popViewControllers];
  --*(void *)(*(void *)(a1 + 32) + 992);
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)replaceViewController:(id)a3 withViewController:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSMutableArray *)self->_viewControllers indexOfObjectIdenticalTo:v12];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v7;
    BOOL v9 = [v12 view];
    int64_t v10 = [v6 view];
    [v9 frame];
    objc_msgSend(v10, "setFrame:");
    [(SUUIOverlayContainerViewController *)self addChildViewController:v6];
    long long v11 = [v9 superview];
    [v11 addSubview:v10];

    [v9 removeFromSuperview];
    [v12 removeFromParentViewController];
    [(NSMutableArray *)self->_viewControllers replaceObjectAtIndex:v8 withObject:v6];
  }
}

- (void)showViewController:(id)a3 withCompletionBlock:(id)a4
{
  viewControllers = self->_viewControllers;
  id v7 = a4;
  id v8 = a3;
  if ([(NSMutableArray *)viewControllers count]) {
    [(SUUIOverlayContainerViewController *)self _slideInViewController:v8 withCompletionBlock:v7];
  }
  else {
    [(SUUIOverlayContainerViewController *)self _fadeInViewController:v8 withCompletionBlock:v7];
  }
}

- (void)showViewControllers:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  backstopView = self->_backstopView;
  id v6 = [(SUUIOverlayContainerViewController *)self dimmingViewColor];
  [(UIControl *)backstopView setBackgroundColor:v6];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        -[SUUIOverlayContainerViewController _pushViewController:](self, "_pushViewController:", *(void *)(*((void *)&v18 + 1) + 8 * v11++), (void)v18);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  id v12 = [(SUUIOverlayContainerViewController *)self view];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  v17 = [(SUUIOverlayContainerViewController *)self traitCollection];
  -[SUUIOverlayContainerViewController _positionViewControllersForSize:traitCollection:](self, "_positionViewControllersForSize:traitCollection:", v17, v14, v16);
}

- (void)showViewController:(id)a3 withFlipTransition:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v10 view];
  [v11 setAutoresizingMask:45];
  id v12 = [(SUUIOverlayContainerViewController *)self view];
  [v12 bounds];
  -[SUUIOverlayContainerViewController _centeredFrameForViewController:inBounds:](self, "_centeredFrameForViewController:inBounds:", v10);
  objc_msgSend(v11, "setFrame:");

  double v13 = [v9 flipSourceView];

  backstopView = self->_backstopView;
  [v13 frame];
  -[UIControl convertRect:fromView:](backstopView, "convertRect:fromView:", 0);
  objc_msgSend(v13, "setFrame:");
  double v15 = [[SUUIScalingFlipView alloc] initWithFrontView:v13 backView:v11];
  [(SUUIScalingFlipView *)v15 setDuration:0.449999988];
  [(UIControl *)self->_backstopView addSubview:v15];
  [(SUUIOverlayContainerViewController *)self addChildViewController:v10];
  [(NSMutableArray *)self->_viewControllers addObject:v10];

  self->_int64_t selectedViewControllerIndex = [(NSMutableArray *)self->_viewControllers count] - 1;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __92__SUUIOverlayContainerViewController_showViewController_withFlipTransition_completionBlock___block_invoke;
  v21[3] = &unk_265400980;
  v21[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v21 animations:0.449999988];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __92__SUUIOverlayContainerViewController_showViewController_withFlipTransition_completionBlock___block_invoke_2;
  v18[3] = &unk_265405A10;
  v18[4] = self;
  id v19 = v11;
  id v20 = v8;
  id v16 = v8;
  id v17 = v11;
  [(SUUIScalingFlipView *)v15 performFlipWithCompletionBlock:v18];
}

void __92__SUUIOverlayContainerViewController_showViewController_withFlipTransition_completionBlock___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = (void *)v1[122];
  id v3 = [v1 dimmingViewColor];
  [v2 setBackgroundColor:v3];
}

uint64_t __92__SUUIOverlayContainerViewController_showViewController_withFlipTransition_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = [v3 view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  id v10 = [*(id *)(a1 + 32) traitCollection];
  objc_msgSend(v3, "_positionViewControllersForSize:traitCollection:", v10, v7, v9);

  [*(id *)(*(void *)(a1 + 32) + 976) addSubview:*(void *)(a1 + 40)];
  [v4 removeFromSuperview];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v12 = *(uint64_t (**)(void))(result + 16);
    return v12();
  }
  return result;
}

- (NSArray)viewControllers
{
  if (self->_popViewControllerCount)
  {
    int64_t selectedViewControllerIndex = self->_selectedViewControllerIndex;
    unint64_t v4 = [(NSMutableArray *)self->_viewControllers count];
    if (selectedViewControllerIndex + 1 < v4) {
      unint64_t v5 = selectedViewControllerIndex + 1;
    }
    else {
      unint64_t v5 = v4;
    }
    -[NSMutableArray subarrayWithRange:](self->_viewControllers, "subarrayWithRange:", 0, v5);
    double v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v6 = self->_viewControllers;
  }
  return (NSArray *)v6;
}

- (void)loadView
{
  id v3 = [(SUUIOverlayContainerViewController *)self backstopControl];
  [(SUUIOverlayContainerViewController *)self setView:v3];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return !self->_isAdjustingViewsForDismiss;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __89__SUUIOverlayContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_265405A38;
  v4[4] = self;
  CGSize v5 = a3;
  [a4 animateAlongsideTransition:v4 completion:&__block_literal_global_32];
}

void __89__SUUIOverlayContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 traitCollection];
  objc_msgSend(v2, "_positionViewControllersForSize:traitCollection:", v3, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)traitCollectionDidChange:(id)a3
{
  id v9 = [(SUUIOverlayContainerViewController *)self view];
  [v9 bounds];
  double v5 = v4;
  double v7 = v6;
  double v8 = [(SUUIOverlayContainerViewController *)self traitCollection];
  -[SUUIOverlayContainerViewController _positionViewControllersForSize:traitCollection:](self, "_positionViewControllersForSize:traitCollection:", v8, v5, v7);
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SUUIOverlayContainerViewController;
  [(SUUIOverlayContainerViewController *)&v10 viewWillAppear:a3];
  double v4 = [(SUUIOverlayContainerViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  id v9 = [(SUUIOverlayContainerViewController *)self traitCollection];
  -[SUUIOverlayContainerViewController _positionViewControllersForSize:traitCollection:](self, "_positionViewControllersForSize:traitCollection:", v9, v6, v8);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  double v5 = [(SUUIOverlayContainerViewController *)self _selectedViewController];
  if (v5)
  {
    [v4 locationInView:self->_backstopView];
    double v6 = -[SUUIOverlayContainerViewController _viewControllerForPoint:](self, "_viewControllerForPoint:");
    if (v6) {
      BOOL v7 = v5 == v6;
    }
    else {
      BOOL v7 = 1;
    }
    BOOL v8 = !v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_tapAction:(id)a3
{
  [a3 locationInView:self->_backstopView];
  int64_t v4 = -[SUUIOverlayContainerViewController _indexOfViewControllerForPoint:](self, "_indexOfViewControllerForPoint:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL && v4 != self->_selectedViewControllerIndex)
  {
    self->_int64_t selectedViewControllerIndex = v4;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __49__SUUIOverlayContainerViewController__tapAction___block_invoke;
    v6[3] = &unk_265400980;
    v6[4] = self;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __49__SUUIOverlayContainerViewController__tapAction___block_invoke_2;
    v5[3] = &unk_265400AC8;
    v5[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:v6 animations:v5 completion:0.349999994];
  }
}

void __49__SUUIOverlayContainerViewController__tapAction___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v8 = [v2 view];
  [v8 bounds];
  double v4 = v3;
  double v6 = v5;
  BOOL v7 = [*(id *)(a1 + 32) traitCollection];
  objc_msgSend(v2, "_positionViewControllersForSize:traitCollection:", v7, v4, v6);
}

uint64_t __49__SUUIOverlayContainerViewController__tapAction___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _popViewControllers];
}

- (void)_frameAction:(id)a3
{
  id v9 = [(SUUIOverlayContainerViewController *)self view];
  [v9 bounds];
  double v5 = v4;
  double v7 = v6;
  id v8 = [(SUUIOverlayContainerViewController *)self traitCollection];
  -[SUUIOverlayContainerViewController _positionViewControllersForSize:traitCollection:](self, "_positionViewControllersForSize:traitCollection:", v8, v5, v7);
}

- (UIColor)dimmingViewColor
{
  id v2 = [(SUUIOverlayContainerViewController *)self view];
  [v2 bounds];
  double v4 = v3;

  if (v4 <= 1024.0) {
    [MEMORY[0x263F825C8] _dimmingViewColor];
  }
  else {
  double v5 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.7];
  }
  return (UIColor *)v5;
}

- (void)_fadeInViewController:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 view];
  [(UIControl *)self->_backstopView bounds];
  -[SUUIOverlayContainerViewController _centeredFrameForViewController:inBounds:](self, "_centeredFrameForViewController:inBounds:", v7);
  objc_msgSend(v8, "setFrame:");
  [v8 setAlpha:0.0];
  [(SUUIOverlayContainerViewController *)self _pushViewController:v7];

  id v9 = (void *)MEMORY[0x263F82E00];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __80__SUUIOverlayContainerViewController__fadeInViewController_withCompletionBlock___block_invoke;
  v14[3] = &unk_265400890;
  v14[4] = self;
  id v15 = v8;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __80__SUUIOverlayContainerViewController__fadeInViewController_withCompletionBlock___block_invoke_2;
  v12[3] = &unk_265400B68;
  id v13 = v6;
  id v10 = v6;
  id v11 = v8;
  [v9 animateWithDuration:v14 animations:v12 completion:0.349999994];
}

uint64_t __80__SUUIOverlayContainerViewController__fadeInViewController_withCompletionBlock___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  double v3 = (void *)v2[122];
  double v4 = [v2 dimmingViewColor];
  [v3 setBackgroundColor:v4];

  double v5 = *(void **)(a1 + 40);
  return [v5 setAlpha:1.0];
}

uint64_t __80__SUUIOverlayContainerViewController__fadeInViewController_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (CGRect)_centeredFrameForViewController:(id)a3 inBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  id v7 = a3;
  id v8 = [v7 view];
  [v8 frame];

  -[SUUIOverlayContainerViewController _overlaySizeForController:atBoundsSize:](self, "_overlaySizeForController:atBoundsSize:", v7, width, height);
  double v10 = v9;
  double v12 = v11;

  float v13 = (width - v10) * 0.5;
  double v14 = floorf(v13);
  float v15 = (height - v12) * 0.5;
  double v16 = floorf(v15);
  double v17 = v10;
  double v18 = v12;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.y = v16;
  result.origin.x = v14;
  return result;
}

- (int64_t)_indexOfViewControllerForPoint:(CGPoint)a3
{
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000;
  viewControllers = self->_viewControllers;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__SUUIOverlayContainerViewController__indexOfViewControllerForPoint___block_invoke;
  v6[3] = &unk_265405A80;
  CGPoint v7 = a3;
  v6[4] = &v8;
  [(NSMutableArray *)viewControllers enumerateObjectsUsingBlock:v6];
  int64_t v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __69__SUUIOverlayContainerViewController__indexOfViewControllerForPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if ([v9 isViewLoaded])
  {
    CGPoint v7 = [v9 view];
    [v7 frame];
    BOOL v8 = CGRectContainsPoint(v11, *(CGPoint *)(a1 + 40));

    if (v8)
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
      *a4 = 1;
    }
  }
}

- (CGSize)_overlaySizeForController:(id)a3 atBoundsSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = [a3 navigationController];
  CGPoint v7 = [v6 navigationBar];

  if (v7)
  {
    [v7 frame];
    double v8 = CGRectGetHeight(v15);
  }
  else
  {
    double v8 = 0.0;
  }
  if (width >= 1366.0)
  {
    double v10 = 784.0;
    double v9 = 904.0;
  }
  else
  {
    double v9 = 1045.0;
    if (width >= 1024.0 && height >= 1045.0)
    {
      double v10 = 784.0;
    }
    else
    {
      double v9 = 630.0;
      double v10 = 630.0;
    }
  }
  double v11 = v8 + v9;

  double v12 = v10;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (double)_overlaySpacingForSize:(CGSize)a3
{
  BOOL v3 = a3.width <= a3.height;
  double result = 35.0;
  if (!v3) {
    return 120.0;
  }
  return result;
}

- (void)_popViewControllers
{
  if (self->_selectedViewControllerIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v3 = [(NSMutableArray *)self->_viewControllers count];
    if (v3 > self->_selectedViewControllerIndex + 1)
    {
      int64_t v4 = v3;
      do
      {
        double v5 = [(NSMutableArray *)self->_viewControllers objectAtIndex:--v4];
        [v5 removeFromParentViewController];
        if ([v5 isViewLoaded])
        {
          id v6 = [v5 view];
          [v6 removeFromSuperview];
        }
        CGPoint v7 = [(SUUIOverlayContainerViewController *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [v7 overlayContainerViewController:self willPopViewController:v5];
        }
        [(NSMutableArray *)self->_viewControllers removeObjectAtIndex:v4];
      }
      while (v4 > self->_selectedViewControllerIndex + 1);
    }
  }
}

- (void)_positionViewControllersForSize:(CGSize)a3 traitCollection:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v46 = [(SUUIOverlayContainerViewController *)self _selectedViewController];
  if (v46)
  {
    -[SUUIOverlayContainerViewController _overlaySpacingForSize:](self, "_overlaySpacingForSize:", width, height);
    double v47 = v7;
    -[SUUIOverlayContainerViewController _centeredFrameForViewController:inBounds:](self, "_centeredFrameForViewController:inBounds:", v46, 0.0, 0.0, width, height);
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v16 = [v46 view];
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

    int64_t selectedViewControllerIndex = self->_selectedViewControllerIndex;
    double v48 = height;
    if (selectedViewControllerIndex >= 1)
    {
      unint64_t v18 = selectedViewControllerIndex + 1;
      do
      {
        id v19 = [(NSMutableArray *)self->_viewControllers objectAtIndex:v18 - 2];
        -[SUUIOverlayContainerViewController _centeredFrameForViewController:inBounds:](self, "_centeredFrameForViewController:inBounds:", v19, 0.0, 0.0, width, height);
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;
        v50.origin.x = v9;
        v50.origin.y = v11;
        v50.size.double width = v13;
        v50.size.double height = v15;
        double v9 = CGRectGetMinX(v50) - v23 - v47;
        v26 = [v19 view];
        objc_msgSend(v26, "setFrame:", v9, v21, v23, v25);

        --v18;
        double v15 = v25;
        double v13 = v23;
        double v11 = v21;
        double height = v48;
      }
      while (v18 > 1);
    }
    uint64_t v27 = [(NSMutableArray *)self->_viewControllers count];
    v28 = [(SUUIOverlayContainerViewController *)self view];
    [v28 bounds];
    double v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;

    int64_t v37 = self->_selectedViewControllerIndex + 1;
    if (v37 < v27)
    {
      do
      {
        v38 = [(NSMutableArray *)self->_viewControllers objectAtIndex:v37];
        -[SUUIOverlayContainerViewController _centeredFrameForViewController:inBounds:](self, "_centeredFrameForViewController:inBounds:", v38, 0.0, 0.0, width, height);
        double v40 = v39;
        double v42 = v41;
        double v44 = v43;
        v51.origin.x = v30;
        v51.origin.y = v32;
        v51.size.double width = v34;
        v51.size.double height = v36;
        double v30 = v47 + CGRectGetMaxX(v51);
        v45 = [v38 view];
        objc_msgSend(v45, "setFrame:", v30, v40, v42, v44);

        ++v37;
        CGFloat v36 = v44;
        double height = v48;
        CGFloat v34 = v42;
        CGFloat v32 = v40;
      }
      while (v27 != v37);
    }
  }
}

- (void)_pushViewController:(id)a3
{
  id v4 = a3;
  double v5 = [v4 view];
  [v5 _setContinuousCornerRadius:8.0];

  id v6 = [v4 view];
  [v6 setClipsToBounds:1];

  [(SUUIOverlayContainerViewController *)self addChildViewController:v4];
  backstopView = self->_backstopView;
  double v8 = [v4 view];
  [(UIControl *)backstopView addSubview:v8];

  [v4 didMoveToParentViewController:self];
  [(NSMutableArray *)self->_viewControllers addObject:v4];

  self->_int64_t selectedViewControllerIndex = [(NSMutableArray *)self->_viewControllers count] - 1;
}

- (void)_removeChildren
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = self->_viewControllers;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "isViewLoaded", (void)v9))
        {
          double v8 = [v7 view];
          [v8 removeFromSuperview];
        }
        [v7 removeFromParentViewController];
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (id)_selectedViewController
{
  if (self->_selectedViewControllerIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v2 = 0;
  }
  else
  {
    id v2 = -[NSMutableArray objectAtIndex:](self->_viewControllers, "objectAtIndex:");
  }
  return v2;
}

- (void)_slideInViewController:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  viewControllers = self->_viewControllers;
  id v8 = a3;
  long long v9 = [(NSMutableArray *)viewControllers lastObject];
  long long v10 = [v8 view];
  long long v11 = [(SUUIOverlayContainerViewController *)self view];
  [v11 bounds];
  -[SUUIOverlayContainerViewController _centeredFrameForViewController:inBounds:](self, "_centeredFrameForViewController:inBounds:", v8);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  unint64_t v18 = [(SUUIOverlayContainerViewController *)self view];
  [v18 bounds];
  -[SUUIOverlayContainerViewController _overlaySpacingForSize:](self, "_overlaySpacingForSize:", v19, v20);
  double v22 = v21;

  double v23 = [v9 view];
  [v23 frame];
  double v24 = v22 + CGRectGetMaxX(v30);

  objc_msgSend(v10, "setFrame:", v24, v13, v15, v17);
  [(SUUIOverlayContainerViewController *)self _pushViewController:v8];

  double v25 = (void *)MEMORY[0x263F82E00];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __81__SUUIOverlayContainerViewController__slideInViewController_withCompletionBlock___block_invoke;
  v29[3] = &unk_265400980;
  v29[4] = self;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __81__SUUIOverlayContainerViewController__slideInViewController_withCompletionBlock___block_invoke_2;
  v27[3] = &unk_265400B68;
  id v28 = v6;
  id v26 = v6;
  [v25 animateWithDuration:v29 animations:v27 completion:0.349999994];
}

void __81__SUUIOverlayContainerViewController__slideInViewController_withCompletionBlock___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v8 = [v2 view];
  [v8 bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = [*(id *)(a1 + 32) traitCollection];
  objc_msgSend(v2, "_positionViewControllersForSize:traitCollection:", v7, v4, v6);
}

uint64_t __81__SUUIOverlayContainerViewController__slideInViewController_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_viewControllerForPoint:(CGPoint)a3
{
  unint64_t v4 = -[SUUIOverlayContainerViewController _indexOfViewControllerForPoint:](self, "_indexOfViewControllerForPoint:", a3.x, a3.y);
  if (v4 >= [(NSMutableArray *)self->_viewControllers count])
  {
    double v5 = 0;
  }
  else
  {
    double v5 = [(NSMutableArray *)self->_viewControllers objectAtIndex:v4];
  }
  return v5;
}

- (SUUIOverlayContainerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIOverlayContainerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_backstopView, 0);
}

@end