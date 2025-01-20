@interface _UIAlertViewShimAccessoryViewController
- (CGSize)preferredContentSize;
- (_UIAlertViewShimAccessoryViewController)initWithAccessoryViewController:(id)a3;
@end

@implementation _UIAlertViewShimAccessoryViewController

- (_UIAlertViewShimAccessoryViewController)initWithAccessoryViewController:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_UIAlertViewShimAccessoryViewController;
  v6 = [(UIViewController *)&v29 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    p_accessoryViewController = (id *)&v6->_accessoryViewController;
    objc_storeStrong((id *)&v6->_accessoryViewController, a3);
    v9 = [*p_accessoryViewController view];
    [v9 frame];
    double v11 = v10;

    double v12 = 120.0;
    if (v11 <= 120.0) {
      double v12 = v11;
    }
    v7->_preferredHeight = v12;
    v13 = [*p_accessoryViewController view];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

    v14 = [(UIViewController *)v7 view];
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

    [(UIViewController *)v7 addChildViewController:*p_accessoryViewController];
    v15 = [(UIViewController *)v7 view];
    v16 = [*p_accessoryViewController view];
    [v15 addSubview:v16];

    v17 = [MEMORY[0x1E4F1CA48] array];
    v18 = [*p_accessoryViewController view];
    v19 = (void *)MEMORY[0x1E4F5B268];
    v20 = _NSDictionaryOfVariableBindings(&cfstr_Accessoryview.isa, v18, 0);
    v21 = [v19 constraintsWithVisualFormat:@"V:|[accessoryView]|" options:0 metrics:0 views:v20];
    [v17 addObjectsFromArray:v21];

    v22 = (void *)MEMORY[0x1E4F5B268];
    v23 = _NSDictionaryOfVariableBindings(&cfstr_Accessoryview.isa, v18, 0);
    v24 = [v22 constraintsWithVisualFormat:@"H:|[accessoryView]|" options:0 metrics:0 views:v23];
    [v17 addObjectsFromArray:v24];

    v25 = [MEMORY[0x1E4F5B268] constraintWithItem:v18 attribute:7 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:1000.0];
    LODWORD(v26) = 1148829696;
    [v25 setPriority:v26];
    [v17 addObject:v25];
    v27 = [(UIViewController *)v7 view];
    [v27 addConstraints:v17];
  }
  return v7;
}

- (CGSize)preferredContentSize
{
  double preferredHeight = self->_preferredHeight;
  double v3 = 0.0;
  result.height = preferredHeight;
  result.width = v3;
  return result;
}

- (void).cxx_destruct
{
}

@end