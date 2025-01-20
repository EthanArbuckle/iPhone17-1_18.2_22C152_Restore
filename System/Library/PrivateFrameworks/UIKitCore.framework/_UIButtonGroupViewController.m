@interface _UIButtonGroupViewController
- (BOOL)_canShowWhileLocked;
- (UIColor)backgroundColor;
- (UIColor)tintColor;
- (_UIButtonGroupViewController)initWithBarButtonItemGroups:(id)a3 overLightKeyboard:(BOOL)a4;
- (_UIButtonGroupViewController)initWithCoder:(id)a3;
- (_UIButtonGroupViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissIfNecessary;
- (void)loadView;
- (void)setBackgroundColor:(id)a3;
- (void)setTintColor:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _UIButtonGroupViewController

- (_UIButtonGroupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s should not be called", a4, "-[_UIButtonGroupViewController initWithNibName:bundle:]");
  v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
  [v8 raise];

  return 0;
}

- (_UIButtonGroupViewController)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s should not be called", "-[_UIButtonGroupViewController initWithCoder:]");
  v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];
  [v7 raise];

  return 0;
}

- (_UIButtonGroupViewController)initWithBarButtonItemGroups:(id)a3 overLightKeyboard:(BOOL)a4
{
  id v7 = a3;
  if (![v7 count])
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    [v26 handleFailureInMethod:a2, self, @"UIButtonGroupViewController.m", 49, @"You can't create a %@ with no bar button item groups...", v28 object file lineNumber description];
  }
  v32.receiver = self;
  v32.super_class = (Class)_UIButtonGroupViewController;
  v8 = [(UIViewController *)&v32 initWithNibName:0 bundle:0];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    barButtonItemGroups = v8->_barButtonItemGroups;
    v8->_barButtonItemGroups = (NSArray *)v9;

    v11 = objc_alloc_init(_UIButtonBar);
    buttonBar = v8->_buttonBar;
    v8->_buttonBar = v11;

    objc_opt_class();
    v13 = _UIButtonBarButtonMakerForVisualProvider();
    [(_UIButtonBar *)v8->_buttonBar setViewUpdater:v13];

    [(_UIButtonBar *)v8->_buttonBar setItemsInGroupUseSameSize:1];
    v8->_overLightKeyboard = a4;
    objc_initWeak(&location, v8);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __78___UIButtonGroupViewController_initWithBarButtonItemGroups_overLightKeyboard___block_invoke;
    v29[3] = &unk_1E52DDD28;
    objc_copyWeak(&v30, &location);
    [(_UIButtonBar *)v8->_buttonBar setDefaultActionFilter:v29];
    [(UIViewController *)v8 setModalPresentationStyle:7];
    v14 = [(NSArray *)v8->_barButtonItemGroups firstObject];
    v15 = [v14 representativeItem];
    v16 = [(UIViewController *)v8 popoverPresentationController];
    [v16 setSourceItem:v15];

    v17 = [(UIViewController *)v8 popoverPresentationController];
    [v17 setPermittedArrowDirections:3];

    v18 = [(UIViewController *)v8 popoverPresentationController];
    [v18 _setIgnoreBarButtonItemSiblings:1];

    v19 = [(UIViewController *)v8 popoverPresentationController];
    [v19 setDelegate:v8];

    LODWORD(v15) = v8->_overLightKeyboard;
    v20 = [(UIViewController *)v8 popoverPresentationController];
    v21 = v20;
    if (v15) {
      uint64_t v22 = 6;
    }
    else {
      uint64_t v22 = 7;
    }
    [v20 _setPopoverBackgroundStyle:v22];

    if (!v8->_overLightKeyboard)
    {
      v23 = +[UIColor colorWithRed:0.498039216 green:0.501960784 blue:0.509803922 alpha:0.8];
      v24 = [(UIViewController *)v8 popoverPresentationController];
      [v24 setBackgroundColor:v23];
    }
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)dismissIfNecessary
{
  v3 = [(UIViewController *)self popoverPresentationController];
  v4 = [v3 _realSourceView];
  uint64_t v5 = [v4 superview];

  if (!v5)
  {
    id v6 = [(UIViewController *)self presentingViewController];
    [v6 dismissViewControllerAnimated:0 completion:0];
  }
}

- (void)loadView
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(UIView);
  [(UIViewController *)self setView:v3];
  v4 = objc_alloc_init(UIScrollView);
  scrollView = self->_scrollView;
  self->_scrollView = v4;

  [(UIView *)self->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:", 0.0, 17.5, 0.0, 17.5);
  [(UIView *)v3 addSubview:self->_scrollView];
  id v6 = [(_UIButtonGroupViewController *)self tintColor];
  [(UIView *)v3 setTintColor:v6];

  [(_UIButtonBar *)self->_buttonBar setBarButtonGroups:self->_barButtonItemGroups];
  [(_UIButtonBar *)self->_buttonBar setMinimumInterItemSpace:15.0];
  id v7 = [(_UIButtonBar *)self->_buttonBar view];
  objc_msgSend(v7, "setLayoutMargins:", 10.0, 0.0, 10.0, 0.0);

  v8 = [(_UIButtonBar *)self->_buttonBar view];
  [(UIView *)self->_scrollView addSubview:v8];
  v23[0] = @"buttonBar";
  v23[1] = @"scrollView";
  uint64_t v9 = self->_scrollView;
  v24[0] = v8;
  v24[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  v11 = (void *)MEMORY[0x1E4F5B268];
  uint64_t v12 = MEMORY[0x1E4F1CC08];
  v13 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"H:|[scrollView]|" options:0 metrics:MEMORY[0x1E4F1CC08] views:v10];
  [v11 activateConstraints:v13];

  v14 = (void *)MEMORY[0x1E4F5B268];
  v15 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"V:|[scrollView]|" options:0 metrics:v12 views:v10];
  [v14 activateConstraints:v15];

  v16 = (void *)MEMORY[0x1E4F5B268];
  v17 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"H:|[buttonBar]|" options:0 metrics:v12 views:v10];
  [v16 activateConstraints:v17];

  v18 = (void *)MEMORY[0x1E4F5B268];
  v19 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"V:|[buttonBar(<=56)]|" options:0 metrics:v12 views:v10];
  [v18 activateConstraints:v19];

  [v8 layoutIfNeeded];
  LODWORD(v20) = 1112014848;
  LODWORD(v21) = 1112014848;
  objc_msgSend(v8, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", 0.0, 0.0, v20, v21);
  [(UIViewController *)self setPreferredContentSize:v22 + 35.0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIButtonGroupViewController;
  [(UIViewController *)&v4 viewWillAppear:a3];
  [(_UIButtonBar *)self->_buttonBar _validateAllItems];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIColor)backgroundColor
{
  v2 = [(UIViewController *)self popoverPresentationController];
  v3 = [v2 backgroundColor];

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  id v5 = [(UIViewController *)self popoverPresentationController];
  [v5 setBackgroundColor:v4];
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
  id v5 = a3;
  id v6 = [(UIViewController *)self view];
  [v6 setTintColor:v5];
}

- (UIColor)tintColor
{
  tintColor = self->_tintColor;
  if (tintColor)
  {
    v3 = tintColor;
  }
  else
  {
    if (self->_overLightKeyboard) {
      +[UIColor blackColor];
    }
    else {
    v3 = +[UIColor whiteColor];
    }
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_barButtonItemGroups, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_buttonBar, 0);
  objc_destroyWeak((id *)&self->_originalOwner);
}

@end