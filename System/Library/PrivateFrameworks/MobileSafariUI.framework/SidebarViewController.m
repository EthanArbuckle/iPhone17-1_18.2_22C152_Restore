@interface SidebarViewController
- (UIViewController)contentViewController;
- (id)preferredFocusEnvironments;
- (void)setContentViewController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SidebarViewController

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)SidebarViewController;
  [(SidebarViewController *)&v8 viewDidLoad];
  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  verticalSeparator = self->_verticalSeparator;
  self->_verticalSeparator = v3;

  v5 = [MEMORY[0x1E4FB1618] opaqueSeparatorColor];
  [(UIView *)self->_verticalSeparator setBackgroundColor:v5];

  v6 = [(SidebarViewController *)self view];
  [v6 addSubview:self->_verticalSeparator];

  v7 = [(SidebarViewController *)self traitOverrides];
  [v7 setNSIntegerValue:1 forTrait:objc_opt_class()];
}

- (void)viewWillLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)SidebarViewController;
  [(SidebarViewController *)&v9 viewWillLayoutSubviews];
  v3 = [(SidebarViewController *)self view];
  char v4 = objc_msgSend(v3, "_sf_usesLeftToRightLayout");

  [(SidebarViewController *)self separatorWidth];
  double v6 = v5;
  if (v4)
  {
    v7 = [(SidebarViewController *)self view];
    [v7 bounds];
    double Width = CGRectGetWidth(v10);
  }
  else
  {
    double Width = -v5;
  }
  -[UIView setFrame:](self->_verticalSeparator, "setFrame:", Width, v6, v6, 100000.0);
}

- (void)setContentViewController:(id)a3
{
  double v5 = (UIViewController *)a3;
  p_contentViewController = &self->_contentViewController;
  contentViewController = self->_contentViewController;
  v12 = v5;
  if (contentViewController != v5)
  {
    [(UIViewController *)contentViewController willMoveToParentViewController:0];
    objc_super v8 = [(UIViewController *)*p_contentViewController view];
    [v8 removeFromSuperview];

    [(UIViewController *)*p_contentViewController removeFromParentViewController];
    objc_storeStrong((id *)&self->_contentViewController, a3);
    if (*p_contentViewController)
    {
      objc_super v9 = [(SidebarViewController *)self view];
      [(SidebarViewController *)self addChildViewController:*p_contentViewController];
      CGRect v10 = [(UIViewController *)*p_contentViewController view];
      [v10 setAccessibilityIdentifier:@"Sidebar"];
      v11 = [MEMORY[0x1E4FB1618] clearColor];
      [v10 setBackgroundColor:v11];

      [v9 bounds];
      objc_msgSend(v10, "setFrame:");
      [v9 addSubview:v10];
      [(UIViewController *)*p_contentViewController didMoveToParentViewController:self];
    }
  }
}

- (id)preferredFocusEnvironments
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (self->_contentViewController)
  {
    v4[0] = self->_contentViewController;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v2;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_verticalSeparator, 0);
}

@end