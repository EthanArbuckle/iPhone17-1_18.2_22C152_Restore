@interface _UICollectionViewListAccessoryVerticalSeparator
- (BOOL)_shouldDrawThickSeparators;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_UICollectionViewListAccessoryVerticalSeparator)initWithFrame:(CGRect)a3;
@end

@implementation _UICollectionViewListAccessoryVerticalSeparator

- (_UICollectionViewListAccessoryVerticalSeparator)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UICollectionViewListAccessoryVerticalSeparator;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(UIView *)v3 layer];
    [v5 setAllowsEdgeAntialiasing:1];
  }
  return v4;
}

- (BOOL)_shouldDrawThickSeparators
{
  v2 = [(UIView *)self traitCollection];
  v3 = [v2 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  BOOL v5 = [(_UICollectionViewListAccessoryVerticalSeparator *)self _shouldDrawThickSeparators];
  double v6 = 1.0;
  if (!v5)
  {
    [(UIView *)self _currentScreenScale];
    double v6 = 1.0 / v7;
  }
  double v8 = height;
  result.CGFloat height = v8;
  result.width = v6;
  return result;
}

@end