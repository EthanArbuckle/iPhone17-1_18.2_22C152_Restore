@interface WFComposeNavigationController
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
@end

@implementation WFComposeNavigationController

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v17.receiver = self;
  v17.super_class = (Class)WFComposeNavigationController;
  [(WFComposeNavigationController *)&v17 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3)
  {
    [(WFComposeNavigationController *)self setNavigationBarHidden:1];
    v6 = [(WFComposeNavigationController *)self navigationBar];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    v13 = [(WFComposeNavigationController *)self navigationBar];
    [v13 intrinsicContentSize];
    double v15 = v14;

    v16 = [(WFComposeNavigationController *)self navigationBar];
    objc_msgSend(v16, "setBounds:", v8, v10, v12, v15);

    [(WFComposeNavigationController *)self setNavigationBarHidden:0];
  }
}

@end