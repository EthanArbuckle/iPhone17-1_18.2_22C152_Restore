@interface SiriUINavigationContentViewController
- (BOOL)hasContentAtPoint:(CGPoint)a3;
- (BOOL)isContentLayoutEnabled;
- (SiriSharedUIContentPlatterViewController)contentPlatterViewController;
- (UIViewController)contentViewController;
- (id)_navigationContentView;
- (id)title;
- (void)contentViewDidUpdateSize;
- (void)loadView;
- (void)prepareForDrillInAnimation;
- (void)prepareForPopAnimationOfType:(int64_t)a3;
- (void)setContentLayoutEnabled:(BOOL)a3;
- (void)setContentViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation SiriUINavigationContentViewController

- (void)loadView
{
  v3 = objc_alloc_init(_SiriUINavigationContentView);
  [(SiriUINavigationContentViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SiriUINavigationContentViewController;
  [(SiriUINavigationContentViewController *)&v5 viewDidLoad];
  v3 = [(SiriUINavigationContentViewController *)self view];
  v4 = [MEMORY[0x263F1C550] clearColor];
  [v3 setBackgroundColor:v4];
}

- (id)title
{
  v2 = [(SiriUINavigationContentViewController *)self contentViewController];
  v3 = [v2 title];

  return v3;
}

- (void)prepareForDrillInAnimation
{
  v2 = [(SiriUINavigationContentViewController *)self _navigationContentView];
  id v3 = [v2 contentView];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 prepareForDrillInAnimation];
  }
}

- (void)prepareForPopAnimationOfType:(int64_t)a3
{
  v4 = [(SiriUINavigationContentViewController *)self _navigationContentView];
  id v5 = [v4 contentView];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 prepareForPopAnimationOfType:a3];
  }
}

- (void)setContentViewController:(id)a3
{
  v9 = (UIViewController *)a3;
  if (self->_contentViewController != v9)
  {
    id v5 = [(SiriUINavigationContentViewController *)self contentViewController];
    [v5 removeFromParentViewController];
    v6 = [(SiriUINavigationContentViewController *)self _navigationContentView];
    [v6 setContentView:0];

    [v5 didMoveToParentViewController:0];
    objc_storeStrong((id *)&self->_contentViewController, a3);
    [(SiriUINavigationContentViewController *)self addChildViewController:v9];
    v7 = [(SiriUINavigationContentViewController *)self _navigationContentView];
    v8 = [(UIViewController *)v9 view];
    [v7 setContentView:v8];

    [(UIViewController *)v9 didMoveToParentViewController:self];
  }
}

- (BOOL)isContentLayoutEnabled
{
  v2 = [(SiriUINavigationContentViewController *)self _navigationContentView];
  char v3 = [v2 isContentLayoutEnabled];

  return v3;
}

- (void)setContentLayoutEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SiriUINavigationContentViewController *)self _navigationContentView];
  [v4 setContentLayoutEnabled:v3];
}

- (BOOL)hasContentAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(SiriUINavigationContentViewController *)self contentPlatterViewController];

  if (!v6) {
    return 0;
  }
  v7 = [(SiriUINavigationContentViewController *)self view];
  v8 = [(SiriUINavigationContentViewController *)self contentPlatterViewController];
  v9 = [v8 view];
  objc_msgSend(v7, "convertPoint:toView:", v9, x, y);
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v14 = [(SiriUINavigationContentViewController *)self contentPlatterViewController];
  v15 = [v14 view];
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  if (SiriUIDeviceIsPad())
  {
    double v24 = v17;
    double v25 = v19;
    double v26 = v21;
    double v27 = v23;
  }
  else
  {
    v28 = [(SiriUINavigationContentViewController *)self _navigationContentView];
    [v28 safeAreaInsets];
    double v30 = v29;
    double v32 = v31;

    double v24 = v17 - v30;
    double v25 = v19 - v30;
    double v33 = -v32 - v30;
    double v26 = v21 - v33;
    double v27 = v23 - v33;
  }
  v35.double x = v11;
  v35.double y = v13;
  return CGRectContainsPoint(*(CGRect *)&v24, v35);
}

- (void)contentViewDidUpdateSize
{
  BOOL v3 = [(SiriUINavigationContentViewController *)self view];
  [v3 setNeedsLayout];

  id v5 = [(SiriUINavigationContentViewController *)self contentViewController];
  id v4 = [v5 view];
  [v4 setNeedsLayout];
}

- (id)_navigationContentView
{
  v2 = [(SiriUINavigationContentViewController *)self view];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (SiriSharedUIContentPlatterViewController)contentPlatterViewController
{
  v2 = [(SiriUINavigationContentViewController *)self contentViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void).cxx_destruct
{
}

@end