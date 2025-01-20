@interface PSEditingPane
+ (float)preferredHeight;
+ (id)defaultBackgroundColor;
- (BOOL)changed;
- (BOOL)handlesDoneButton;
- (BOOL)requiresKeyboard;
- (BOOL)shouldInsetContent;
- (BOOL)wantsNewButton;
- (PSEditingPane)initWithFrame:(CGRect)a3;
- (UIViewController)viewController;
- (id)childViewControllerForHostingViewController;
- (id)preferenceSpecifier;
- (id)preferenceValue;
- (id)scrollViewToBeInsetted;
- (id)specifierLabel;
- (void)insetContent;
- (void)layoutInsetContent:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setPreferenceSpecifier:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation PSEditingPane

+ (id)defaultBackgroundColor
{
  v2 = +[PSListController appearance];
  v3 = [v2 backgroundColor];

  if (v3)
  {
    v4 = +[PSListController appearance];
    v5 = [v4 backgroundColor];
  }
  else
  {
    v5 = [MEMORY[0x1E4F428B8] systemGroupedBackgroundColor];
  }
  return v5;
}

+ (float)preferredHeight
{
  return -1.0;
}

- (PSEditingPane)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PSEditingPane;
  v3 = -[PSEditingPane initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PSEditingPane *)v3 setAutoresizingMask:18];
  }
  return v4;
}

- (void)setDelegate:(id)a3
{
}

- (void)setPreferenceSpecifier:(id)a3
{
  v5 = (PSSpecifier *)a3;
  p_specifier = &self->_specifier;
  if (self->_specifier != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_specifier, a3);
    v5 = v7;
  }
  MEMORY[0x1F41817F8](p_specifier, v5);
}

- (id)preferenceSpecifier
{
  return self->_specifier;
}

- (id)preferenceValue
{
  return 0;
}

- (BOOL)requiresKeyboard
{
  return *((unsigned char *)self + 424) & 1;
}

- (id)specifierLabel
{
  return [(PSSpecifier *)self->_specifier name];
}

- (BOOL)wantsNewButton
{
  return 0;
}

- (BOOL)handlesDoneButton
{
  return 0;
}

- (BOOL)changed
{
  return 0;
}

- (BOOL)shouldInsetContent
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  if (objc_msgSend(v2, "sf_isiPad")) {
    int v3 = PSIsRunningInAssistant() ^ 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (void)insetContent
{
  id v4 = [(PSEditingPane *)self scrollViewToBeInsetted];
  if (v4)
  {
    objc_msgSend(v4, "setScrollIndicatorInsets:", 0.0, 0.0, 0.0, -PSTableViewSideInset());
    [v4 setClipsToBounds:0];
    int v3 = [MEMORY[0x1E4F428B8] groupTableViewBackgroundColor];
    [(PSEditingPane *)self setBackgroundColor:v3];
  }
}

- (void)layoutInsetContent:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = [(PSEditingPane *)self scrollViewToBeInsetted];
  if (v8)
  {
    double v7 = PSTableViewSideInset();
    v10.origin.CGFloat x = x;
    v10.origin.CGFloat y = y;
    v10.size.CGFloat width = width;
    v10.size.CGFloat height = height;
    CGRect v11 = CGRectInset(v10, v7, 0.0);
    objc_msgSend(v8, "setFrame:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
  }
}

- (id)childViewControllerForHostingViewController
{
  return 0;
}

- (id)scrollViewToBeInsetted
{
  uint64_t v3 = objc_opt_class();
  return PSFindViewOfClass(self, v3);
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (UIViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_specifier, 0);
}

@end