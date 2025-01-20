@interface _TVModalPageBezelViewController
- (CGSize)contentSize;
- (UIColor)bezelBackgroundColor;
- (UIViewController)contentViewController;
- (_TVModalPageBezelViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)bezelCornerRadius;
- (void)setBezelBackgroundColor:(id)a3;
- (void)setBezelCornerRadius:(double)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setContentViewController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation _TVModalPageBezelViewController

- (_TVModalPageBezelViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_TVModalPageBezelViewController;
  result = [(_TVModalPageBezelViewController *)&v5 initWithNibName:a3 bundle:a4];
  if (result) {
    result->_contentSize = (CGSize)xmmword_230C38230;
  }
  return result;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)_TVModalPageBezelViewController;
  [(_TVModalPageBezelViewController *)&v8 viewDidLoad];
  v3 = [(UIViewController *)self->_contentViewController view];
  v4 = [v3 layer];
  [v4 setCornerRadius:self->_bezelCornerRadius];

  objc_super v5 = [(UIViewController *)self->_contentViewController view];
  v6 = v5;
  if (self->_bezelBackgroundColor)
  {
    objc_msgSend(v5, "setBackgroundColor:");
  }
  else
  {
    v7 = [MEMORY[0x263F1C550] systemBackgroundColor];
    [v6 setBackgroundColor:v7];
  }
}

- (void)viewDidLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)_TVModalPageBezelViewController;
  [(_TVModalPageBezelViewController *)&v15 viewDidLayoutSubviews];
  v3 = [(_TVModalPageBezelViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v12 = [(UIViewController *)self->_contentViewController view];
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  CGRectGetWidth(v16);
  v17.origin.x = v5;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v11;
  CGRectGetHeight(v17);
  v13 = [(_TVModalPageBezelViewController *)self view];
  [v13 bounds];
  UIRectCenteredIntegralRect();
  objc_msgSend(v12, "setFrame:");

  v14 = [(UIViewController *)self->_contentViewController view];
  [v14 setAutoresizingMask:45];
}

- (void)setBezelCornerRadius:(double)a3
{
  if (vabdd_f64(self->_bezelCornerRadius, a3) > 0.00000011920929)
  {
    self->_bezelCornerRadius = a3;
    id v5 = [(UIViewController *)self->_contentViewController view];
    double v4 = [v5 layer];
    [v4 setCornerRadius:self->_bezelCornerRadius];
  }
}

- (void)setBezelBackgroundColor:(id)a3
{
  p_bezelBackgroundColor = (id *)&self->_bezelBackgroundColor;
  id v9 = a3;
  if ((objc_msgSend(*p_bezelBackgroundColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_bezelBackgroundColor, a3);
    double v6 = [(UIViewController *)self->_contentViewController view];
    CGFloat v7 = v6;
    if (*p_bezelBackgroundColor)
    {
      objc_msgSend(v6, "setBackgroundColor:");
    }
    else
    {
      double v8 = [MEMORY[0x263F1C550] systemBackgroundColor];
      [v7 setBackgroundColor:v8];
    }
  }
}

- (void)setContentSize:(CGSize)a3
{
  if (a3.width <= 0.0) {
    a3.width = 524.0;
  }
  if (a3.height <= 0.0) {
    a3.height = 547.0;
  }
  if (self->_contentSize.width != a3.width || self->_contentSize.height != a3.height)
  {
    self->_contentSize = a3;
    id v4 = [(_TVModalPageBezelViewController *)self view];
    [v4 setNeedsLayout];
  }
}

- (void)setContentViewController:(id)a3
{
  id v5 = (UIViewController *)a3;
  p_contentViewController = &self->_contentViewController;
  contentViewController = self->_contentViewController;
  v12 = v5;
  if (contentViewController != v5)
  {
    if (contentViewController)
    {
      [(UIViewController *)contentViewController willMoveToParentViewController:0];
      double v8 = [(UIViewController *)*p_contentViewController view];
      [v8 removeFromSuperview];

      [(UIViewController *)*p_contentViewController removeFromParentViewController];
    }
    objc_storeStrong((id *)&self->_contentViewController, a3);
    if (*p_contentViewController)
    {
      -[_TVModalPageBezelViewController addChildViewController:](self, "addChildViewController:");
      id v9 = [(_TVModalPageBezelViewController *)self view];
      double v10 = [(UIViewController *)*p_contentViewController view];
      [v9 addSubview:v10];

      [(UIViewController *)*p_contentViewController didMoveToParentViewController:self];
      CGFloat v11 = [(_TVModalPageBezelViewController *)self view];
      [v11 setNeedsLayout];
    }
  }
}

- (double)bezelCornerRadius
{
  return self->_bezelCornerRadius;
}

- (UIColor)bezelBackgroundColor
{
  return self->_bezelBackgroundColor;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_bezelBackgroundColor, 0);
}

@end