@interface UIViewController
- (CGSize)pageContainerSize;
- (UIEdgeInsets)pageMarginInsets;
@end

@implementation UIViewController

- (CGSize)pageContainerSize
{
  v2 = self;
  v3 = [(UIViewController *)v2 view];
  if (v3)
  {
    v6 = v3;
    [(UIView *)v3 bounds];
    double v8 = v7;
    double v10 = v9;

    double v4 = v8;
    double v5 = v10;
  }
  else
  {
    __break(1u);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (UIEdgeInsets)pageMarginInsets
{
  v2 = self;
  [(UIViewController *)v2 pageContainerSize];
  StandardGridSpec.basePageMargin(for:)(v3);
  double v5 = v4;

  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = v5;
  double v9 = v5;
  result.right = v9;
  result.bottom = v7;
  result.left = v8;
  result.top = v6;
  return result;
}

@end