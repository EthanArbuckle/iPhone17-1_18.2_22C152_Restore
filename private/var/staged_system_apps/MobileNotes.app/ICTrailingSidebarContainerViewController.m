@interface ICTrailingSidebarContainerViewController
- (BOOL)isSidebarHidden;
- (BOOL)isTransitioning;
- (BOOL)resizesWindow;
- (ICTrailingSidebarContainerViewController)init;
- (NSLayoutConstraint)sidebarWidthConstraint;
- (UIStackView)stackView;
- (UIView)contentContainerView;
- (UIView)sidebarContainerView;
- (UIViewController)contentViewController;
- (UIViewController)sidebarViewController;
- (double)preferredSidebarWidth;
- (double)sidebarWidth;
- (void)createLayout;
- (void)setContentViewController:(id)a3;
- (void)setPreferredSidebarWidth:(double)a3;
- (void)setResizesWindow:(BOOL)a3;
- (void)setSidebarHidden:(BOOL)a3;
- (void)setSidebarViewController:(id)a3;
- (void)setSidebarWidth:(double)a3;
- (void)setSidebarWidthConstraint:(id)a3;
- (void)setTransitioning:(BOOL)a3;
@end

@implementation ICTrailingSidebarContainerViewController

- (ICTrailingSidebarContainerViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICTrailingSidebarContainerViewController;
  v2 = [(ICTrailingSidebarContainerViewController *)&v5 initWithNibName:0 bundle:0];
  v3 = v2;
  if (v2)
  {
    v2->_sidebarHidden = 1;
    v2->_resizesWindow = 1;
    v2->_preferredSidebarWidth = 300.0;
    [(ICTrailingSidebarContainerViewController *)v2 createLayout];
  }
  return v3;
}

- (void)setContentViewController:(id)a3
{
  id v9 = a3;
  [(UIViewController *)self->_contentViewController willMoveToParentViewController:0];
  [(UIViewController *)self->_contentViewController removeFromParentViewController];
  objc_super v5 = [(UIViewController *)self->_contentViewController view];
  [v5 removeFromSuperview];

  objc_storeStrong((id *)&self->_contentViewController, a3);
  if (v9)
  {
    v6 = [(ICTrailingSidebarContainerViewController *)self contentContainerView];
    v7 = [v9 view];
    [v6 addSubview:v7];

    [(ICTrailingSidebarContainerViewController *)self addChildViewController:v9];
    [v9 didMoveToParentViewController:self];
    v8 = [v9 view];
    [v8 ic_addConstraintsToFillSuperview];
  }
}

- (void)setSidebarViewController:(id)a3
{
  id v9 = a3;
  [(UIViewController *)self->_sidebarViewController willMoveToParentViewController:0];
  [(UIViewController *)self->_sidebarViewController removeFromParentViewController];
  objc_super v5 = [(UIViewController *)self->_sidebarViewController view];
  [v5 removeFromSuperview];

  objc_storeStrong((id *)&self->_sidebarViewController, a3);
  if (v9)
  {
    v6 = [(ICTrailingSidebarContainerViewController *)self sidebarContainerView];
    v7 = [v9 view];
    [v6 addSubview:v7];

    [(ICTrailingSidebarContainerViewController *)self addChildViewController:v9];
    [v9 didMoveToParentViewController:self];
    v8 = [v9 view];
    [v8 ic_addConstraintsToFillSuperview];
  }
}

- (void)setSidebarHidden:(BOOL)a3
{
  if (self->_sidebarHidden != a3)
  {
    BOOL v3 = a3;
    [(ICTrailingSidebarContainerViewController *)self setTransitioning:1];
    self->_sidebarHidden = v3;
    objc_super v5 = [(ICTrailingSidebarContainerViewController *)self sidebarContainerView];
    [v5 setHidden:v3];

    double v6 = 0.0;
    if (!v3) {
      [(ICTrailingSidebarContainerViewController *)self preferredSidebarWidth];
    }
    [(ICTrailingSidebarContainerViewController *)self setSidebarWidth:v6];
    [(ICTrailingSidebarContainerViewController *)self sidebarWidth];
    double v8 = v7;
    id v9 = [(ICTrailingSidebarContainerViewController *)self sidebarWidthConstraint];
    [v9 setConstant:v8];

    [(ICTrailingSidebarContainerViewController *)self setTransitioning:0];
  }
}

- (UIView)contentContainerView
{
  contentContainerView = self->_contentContainerView;
  if (!contentContainerView)
  {
    v4 = (UIView *)objc_alloc_init((Class)UIView);
    objc_super v5 = self->_contentContainerView;
    self->_contentContainerView = v4;

    [(UIView *)self->_contentContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    contentContainerView = self->_contentContainerView;
  }

  return contentContainerView;
}

- (UIView)sidebarContainerView
{
  sidebarContainerView = self->_sidebarContainerView;
  if (!sidebarContainerView)
  {
    v4 = (UIView *)objc_alloc_init((Class)UIView);
    objc_super v5 = self->_sidebarContainerView;
    self->_sidebarContainerView = v4;

    [(UIView *)self->_sidebarContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_sidebarContainerView setHidden:[(ICTrailingSidebarContainerViewController *)self isSidebarHidden]];
    sidebarContainerView = self->_sidebarContainerView;
  }

  return sidebarContainerView;
}

- (UIStackView)stackView
{
  stackView = self->_stackView;
  if (!stackView)
  {
    id v4 = objc_alloc((Class)UIStackView);
    objc_super v5 = [(ICTrailingSidebarContainerViewController *)self contentContainerView];
    v11[0] = v5;
    double v6 = [(ICTrailingSidebarContainerViewController *)self sidebarContainerView];
    v11[1] = v6;
    double v7 = +[NSArray arrayWithObjects:v11 count:2];
    double v8 = (UIStackView *)[v4 initWithArrangedSubviews:v7];
    id v9 = self->_stackView;
    self->_stackView = v8;

    [(UIView *)self->_sidebarContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)self->_stackView setSpacing:9.0];
    stackView = self->_stackView;
  }

  return stackView;
}

- (void)createLayout
{
  BOOL v3 = [(ICTrailingSidebarContainerViewController *)self view];
  id v4 = [(ICTrailingSidebarContainerViewController *)self stackView];
  [v3 addSubview:v4];

  objc_super v5 = [(ICTrailingSidebarContainerViewController *)self stackView];
  [v5 ic_addConstraintsToFillSuperview];

  double v6 = [(ICTrailingSidebarContainerViewController *)self sidebarContainerView];
  double v7 = [v6 widthAnchor];
  [(ICTrailingSidebarContainerViewController *)self sidebarWidth];
  [v7 constraintEqualToConstant:];
  double v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  sidebarWidthConstraint = self->_sidebarWidthConstraint;
  self->_sidebarWidthConstraint = v8;

  v11 = v8;
  v10 = +[NSArray arrayWithObjects:&v11 count:1];
  +[NSLayoutConstraint activateConstraints:v10];
}

- (void)setPreferredSidebarWidth:(double)a3
{
  self->_preferredSidebarWidth = a3;
  [(ICTrailingSidebarContainerViewController *)self sidebarWidth];
  double v5 = v4;
  id v6 = [(ICTrailingSidebarContainerViewController *)self sidebarWidthConstraint];
  [v6 setConstant:v5];
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (UIViewController)sidebarViewController
{
  return self->_sidebarViewController;
}

- (BOOL)isSidebarHidden
{
  return self->_sidebarHidden;
}

- (double)preferredSidebarWidth
{
  return self->_preferredSidebarWidth;
}

- (BOOL)resizesWindow
{
  return self->_resizesWindow;
}

- (void)setResizesWindow:(BOOL)a3
{
  self->_resizesWindow = a3;
}

- (double)sidebarWidth
{
  return self->_sidebarWidth;
}

- (void)setSidebarWidth:(double)a3
{
  self->_sidebarWidth = a3;
}

- (NSLayoutConstraint)sidebarWidthConstraint
{
  return self->_sidebarWidthConstraint;
}

- (void)setSidebarWidthConstraint:(id)a3
{
}

- (BOOL)isTransitioning
{
  return self->_transitioning;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidebarWidthConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_sidebarContainerView, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_sidebarViewController, 0);

  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end