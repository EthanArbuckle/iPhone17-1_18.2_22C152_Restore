@interface SiriUINavigationController
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)popToRootViewController;
- (SiriUINavigationController)initWithCoder:(id)a3;
- (SiriUINavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (SiriUINavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (SiriUINavigationController)initWithRootViewController:(id)a3;
- (SiriUINavigationTransitioning)transitionController;
- (UIView)animatingBackgroundView;
- (UIView)blurrableView;
- (UIView)firstCommonAncestralView;
- (UIView)shadowView;
- (_SiriUINavigationControllerDelegateAdapter)_delegateAdapter;
- (id)delegate;
- (int64_t)popAnimationType;
- (void)_handleGestureFromRecognizer:(id)a3;
- (void)_setDelegateAdapter:(id)a3;
- (void)_sharedInit;
- (void)contentPlatterViewScrolledToContentOffset:(CGPoint)a3;
- (void)setAnimatingBackgroundView:(id)a3;
- (void)setBlurrableView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstCommonAncestralView:(id)a3;
- (void)setPopAnimationType:(int64_t)a3;
- (void)setPopToRootViewController:(BOOL)a3;
- (void)setShadowView:(id)a3;
- (void)setTransitionController:(id)a3;
- (void)viewDidLoad;
@end

@implementation SiriUINavigationController

- (SiriUINavigationController)initWithRootViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SiriUINavigationController;
  v3 = [(SiriUINavigationController *)&v6 initWithRootViewController:a3];
  v4 = v3;
  if (v3) {
    [(SiriUINavigationController *)v3 _sharedInit];
  }
  return v4;
}

- (SiriUINavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SiriUINavigationController;
  v4 = [(SiriUINavigationController *)&v7 initWithNavigationBarClass:a3 toolbarClass:a4];
  v5 = v4;
  if (v4) {
    [(SiriUINavigationController *)v4 _sharedInit];
  }
  return v5;
}

- (SiriUINavigationController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SiriUINavigationController;
  v3 = [(SiriUINavigationController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(SiriUINavigationController *)v3 _sharedInit];
  }
  return v4;
}

- (SiriUINavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SiriUINavigationController;
  v4 = [(SiriUINavigationController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(SiriUINavigationController *)v4 _sharedInit];
  }
  return v5;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)SiriUINavigationController;
  [(SiriUINavigationController *)&v4 viewDidLoad];
  v3 = [(SiriUINavigationController *)self view];
  [v3 setClipsToBounds:0];
}

- (id)delegate
{
  v2 = [(SiriUINavigationController *)self _delegateAdapter];
  v3 = [v2 externalDelegate];

  return v3;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(SiriUINavigationController *)self _delegateAdapter];
  v7.receiver = self;
  v7.super_class = (Class)SiriUINavigationController;
  [(SiriUINavigationController *)&v7 setDelegate:v5];

  objc_super v6 = [(SiriUINavigationController *)self _delegateAdapter];
  [v6 setExternalDelegate:v4];
}

- (SiriUINavigationTransitioning)transitionController
{
  v2 = [(SiriUINavigationController *)self _delegateAdapter];
  v3 = [v2 transitionController];

  return (SiriUINavigationTransitioning *)v3;
}

- (void)setTransitionController:(id)a3
{
  id v6 = a3;
  id v4 = [(SiriUINavigationController *)self transitionController];

  if (v4 != v6)
  {
    if (objc_opt_respondsToSelector()) {
      [v6 configureWithNavigationController:self];
    }
    v5 = [(SiriUINavigationController *)self _delegateAdapter];
    [v5 setTransitionController:v6];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(SiriUINavigationController *)self interactivePopGestureRecognizer];

  if (self->_supportsSAE)
  {
    id v6 = [(SiriUINavigationController *)self viewControllers];
    BOOL v7 = (unint64_t)[v6 count] > 2;
  }
  else
  {
    BOOL v7 = v5 == v4;
  }

  return v7;
}

- (void)_sharedInit
{
  [(SiriUINavigationController *)self setDelegate:0];
  self->_supportsSAE = [MEMORY[0x263F286B8] isSAEEnabled];
  self->_popAnimationType = 0;
  v3 = [(SiriUINavigationController *)self navigationBar];
  objc_msgSend(v3, "siriui_customizeAppearanceGivenSAEEnabled:", self->_supportsSAE);

  [(SiriUINavigationController *)self _setBuiltinTransitionStyle:!self->_supportsSAE];
  id v4 = [(SiriUINavigationController *)self interactivePopGestureRecognizer];
  [v4 setDelegate:self];

  id v5 = [(SiriUINavigationController *)self interactivePopGestureRecognizer];
  [v5 addTarget:self action:sel__handleGestureFromRecognizer_];
}

- (_SiriUINavigationControllerDelegateAdapter)_delegateAdapter
{
  delegateAdapter = self->_delegateAdapter;
  if (!delegateAdapter)
  {
    id v4 = objc_alloc_init(_SiriUINavigationControllerDelegateAdapter);
    id v5 = self->_delegateAdapter;
    self->_delegateAdapter = v4;

    delegateAdapter = self->_delegateAdapter;
  }
  return delegateAdapter;
}

- (void)_handleGestureFromRecognizer:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 state] == 1)
  {
    id v4 = [(SiriUINavigationController *)self transitionController];
    if (objc_opt_respondsToSelector()) {
      [v4 setOperation:2];
    }
    if (objc_opt_respondsToSelector())
    {
      id v5 = [(SiriUINavigationController *)self transitionCoordinator];
      [v4 coordinateAdditionalTransitionsWithTransitionCoordinator:v5];
    }
  }
}

- (void)contentPlatterViewScrolledToContentOffset:(CGPoint)a3
{
  if (a3.y < -100.0)
  {
    id v4 = [(SiriUINavigationController *)self viewControllers];
    unint64_t v5 = [v4 count];

    if (v5 >= 2)
    {
      id v6 = [(SiriUINavigationController *)self transitionController];
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        v8 = [(SiriUINavigationController *)self transitionController];
        [v8 setOperation:2];

        [(SiriUINavigationController *)self setPopToRootViewController:1];
        [(SiriUINavigationController *)self setPopAnimationType:1];
        id v9 = (id)[(SiriUINavigationController *)self popToRootViewControllerAnimated:1];
      }
    }
  }
}

- (BOOL)popToRootViewController
{
  return self->_popToRootViewController;
}

- (void)setPopToRootViewController:(BOOL)a3
{
  self->_popToRootViewController = a3;
}

- (int64_t)popAnimationType
{
  return self->_popAnimationType;
}

- (void)setPopAnimationType:(int64_t)a3
{
  self->_popAnimationType = a3;
}

- (UIView)animatingBackgroundView
{
  return self->_animatingBackgroundView;
}

- (void)setAnimatingBackgroundView:(id)a3
{
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
}

- (UIView)blurrableView
{
  return self->_blurrableView;
}

- (void)setBlurrableView:(id)a3
{
}

- (UIView)firstCommonAncestralView
{
  return self->_firstCommonAncestralView;
}

- (void)setFirstCommonAncestralView:(id)a3
{
}

- (void)_setDelegateAdapter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateAdapter, 0);
  objc_storeStrong((id *)&self->_firstCommonAncestralView, 0);
  objc_storeStrong((id *)&self->_blurrableView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_animatingBackgroundView, 0);
}

@end