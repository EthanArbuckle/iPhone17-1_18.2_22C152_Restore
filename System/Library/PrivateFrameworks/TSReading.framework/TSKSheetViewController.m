@interface TSKSheetViewController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isShowingForTransitionContext:(id)a3;
- (BOOL)shouldAutorotate;
- (TSKSheetViewController)initWithContentViewController:(id)a3;
- (TSKSheetViewController)initWithContentViewController:(id)a3 allowTapsOutsideContentView:(BOOL)a4;
- (TSKSheetViewControllerDelegate)delegate;
- (double)transitionDuration:(id)a3;
- (void)animateDismissWithContext:(id)a3;
- (void)animateShowWithContext:(id)a3;
- (void)animateTransition:(id)a3;
- (void)didTapView;
- (void)dismissSheetAnimated:(BOOL)a3 completion:(id)a4;
- (void)setContentHidden:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation TSKSheetViewController

- (TSKSheetViewController)initWithContentViewController:(id)a3
{
  return [(TSKSheetViewController *)self initWithContentViewController:a3 allowTapsOutsideContentView:1];
}

- (TSKSheetViewController)initWithContentViewController:(id)a3 allowTapsOutsideContentView:(BOOL)a4
{
  BOOL v4 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TSKSheetViewController;
  v6 = [(TSKSheetViewController *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_contentViewController = (UIViewController *)a3;
    [(TSKSheetViewController *)v6 setTransitioningDelegate:v6];
    [(TSKSheetViewController *)v7 setModalPresentationStyle:4];
    v8 = (void *)[(TSKSheetViewController *)v7 view];
    v9 = (void *)[a3 view];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TSKSheetViewController *)v7 addChildViewController:a3];
    [v8 addSubview:v9];
    [v8 addConstraints:objc_msgSend(MEMORY[0x263F08938], "constraintsWithVisualFormat:options:metrics:views:", @"|[contentView]|", 0, 0, _NSDictionaryOfVariableBindings((NSString *)@"contentView", v9, 0))];
    [(TSKSheetViewController *)v7 setContentHidden:1];
    [a3 preferredContentSize];
    objc_msgSend(v8, "addConstraint:", objc_msgSend(MEMORY[0x263F08938], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 8, 0, 0, 0, 1.0));
    [a3 didMoveToParentViewController:v7];
    if (v4)
    {
      v10 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v7 action:sel_didTapView];
      [v10 setDelegate:v7];
      [v8 addGestureRecognizer:v10];
    }
  }
  return v7;
}

- (void)dismissSheetAnimated:(BOOL)a3 completion:(id)a4
{
  if (a3)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __58__TSKSheetViewController_dismissSheetAnimated_completion___block_invoke;
    v6[3] = &unk_2646AF7B8;
    v6[4] = self;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __58__TSKSheetViewController_dismissSheetAnimated_completion___block_invoke_2;
    v5[3] = &unk_2646B09D0;
    v5[4] = self;
    v5[5] = a4;
    [MEMORY[0x263F1CB60] animateWithDuration:0 delay:v6 options:v5 animations:0.25 completion:0.0];
  }
  else
  {
    -[TSKSheetViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:");
  }
}

uint64_t __58__TSKSheetViewController_dismissSheetAnimated_completion___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) view];
  objc_msgSend(v2, "setBackgroundColor:", objc_msgSend(MEMORY[0x263F1C550], "clearColor"));
  [*(id *)(a1 + 32) setContentHidden:1];

  return [v2 layoutIfNeeded];
}

uint64_t __58__TSKSheetViewController_dismissSheetAnimated_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:*(void *)(a1 + 40)];
}

- (void)didTapView
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __36__TSKSheetViewController_didTapView__block_invoke;
  v2[3] = &unk_2646AF7B8;
  v2[4] = self;
  [(TSKSheetViewController *)self dismissSheetAnimated:1 completion:v2];
}

uint64_t __36__TSKSheetViewController_didTapView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1000), "didDismissSheetViewController:");
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (double)transitionDuration:(id)a3
{
  BOOL v3 = [(TSKSheetViewController *)self isShowingForTransitionContext:a3];
  double result = 0.0;
  if (v3) {
    return 0.25;
  }
  return result;
}

- (void)animateTransition:(id)a3
{
  if (-[TSKSheetViewController isShowingForTransitionContext:](self, "isShowingForTransitionContext:"))
  {
    [(TSKSheetViewController *)self animateShowWithContext:a3];
  }
  else
  {
    [(TSKSheetViewController *)self animateDismissWithContext:a3];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "view", a3);
  return v5 == [(TSKSheetViewController *)self view];
}

- (BOOL)isShowingForTransitionContext:(id)a3
{
  return [a3 viewControllerForKey:*MEMORY[0x263F1D7B0]] == (void)self;
}

- (void)animateShowWithContext:(id)a3
{
  uint64_t v5 = (void *)[a3 containerView];
  v6 = (void *)[(TSKSheetViewController *)self view];
  [v5 addSubview:v6];
  v7 = _NSDictionaryOfVariableBindings((NSString *)@"rootView", v6, 0);
  objc_msgSend(v5, "addConstraints:", objc_msgSend(MEMORY[0x263F08938], "constraintsWithVisualFormat:options:metrics:views:", @"H:|[rootView]|", 0, 0, v7));
  objc_msgSend(v5, "addConstraints:", objc_msgSend(MEMORY[0x263F08938], "constraintsWithVisualFormat:options:metrics:views:", @"V:|[rootView]|", 0, 0, v7));
  objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(MEMORY[0x263F1C550], "clearColor"));
  [(TSKSheetViewController *)self setContentHidden:1];
  [v6 layoutIfNeeded];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__TSKSheetViewController_animateShowWithContext___block_invoke;
  v9[3] = &unk_2646B0750;
  v9[4] = v6;
  v9[5] = self;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__TSKSheetViewController_animateShowWithContext___block_invoke_2;
  v8[3] = &unk_2646B09F8;
  v8[4] = a3;
  [MEMORY[0x263F1CB60] animateWithDuration:0 delay:v9 options:v8 animations:0.25 completion:0.0];
}

uint64_t __49__TSKSheetViewController_animateShowWithContext___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.0, 0.4));
  [*(id *)(a1 + 40) setContentHidden:0];
  v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

uint64_t __49__TSKSheetViewController_animateShowWithContext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTransition:1];
}

- (void)animateDismissWithContext:(id)a3
{
  objc_msgSend((id)-[TSKSheetViewController view](self, "view"), "removeFromSuperview");

  [a3 completeTransition:1];
}

- (void)setContentHidden:(BOOL)a3
{
  if (self->_isContentHidden != a3)
  {
    BOOL v3 = a3;
    self->_isContentHidden = a3;
    uint64_t v5 = (void *)[(TSKSheetViewController *)self view];
    v6 = [(UIViewController *)self->_contentViewController view];
    if (self->_contentVerticalConstraint) {
      objc_msgSend(v5, "removeConstraint:");
    }
    if (v3) {
      uint64_t v7 = 3;
    }
    else {
      uint64_t v7 = 4;
    }
    v8 = (NSLayoutConstraint *)[MEMORY[0x263F08938] constraintWithItem:v6 attribute:v7 relatedBy:0 toItem:v5 attribute:4 multiplier:1.0 constant:0.0];
    self->_contentVerticalConstraint = v8;
    [v5 addConstraint:v8];
  }
}

- (TSKSheetViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TSKSheetViewControllerDelegate *)a3;
}

@end