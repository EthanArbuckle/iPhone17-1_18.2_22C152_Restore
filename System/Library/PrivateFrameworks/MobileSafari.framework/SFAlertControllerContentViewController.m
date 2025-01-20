@interface SFAlertControllerContentViewController
- (void)viewDidLayoutSubviews;
@end

@implementation SFAlertControllerContentViewController

- (void)viewDidLayoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)SFAlertControllerContentViewController;
  [(SFAlertControllerContentViewController *)&v23 viewDidLayoutSubviews];
  v3 = [(SFAlertControllerContentViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v12 = [(SFAlertControllerContentViewController *)self view];
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  CGFloat Width = CGRectGetWidth(v24);
  LODWORD(v14) = 1148846080;
  LODWORD(v15) = 1112014848;
  objc_msgSend(v12, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", Width, 1.79769313e308, v14, v15);
  double v17 = v16;
  double v19 = v18;

  [(SFAlertControllerContentViewController *)self preferredContentSize];
  if (v21 != v17 || v20 != v19) {
    -[SFAlertControllerContentViewController setPreferredContentSize:](self, "setPreferredContentSize:", v17, v19);
  }
}

@end