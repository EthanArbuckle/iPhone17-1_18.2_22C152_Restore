@interface _UICollectionViewListCellContentView
- (UIEdgeInsets)_concreteDefaultLayoutMargins;
@end

@implementation _UICollectionViewListCellContentView

- (UIEdgeInsets)_concreteDefaultLayoutMargins
{
  v15.receiver = self;
  v15.super_class = (Class)_UICollectionViewListCellContentView;
  [(UIView *)&v15 _concreteDefaultLayoutMargins];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  int v10 = _UIShouldApplyVerticalLayoutMarginsToListHeaderFooterViews();
  double v11 = 0.0;
  if (v10) {
    double v12 = 0.0;
  }
  else {
    double v12 = v7;
  }
  if (!v10) {
    double v11 = v3;
  }
  double v13 = v5;
  double v14 = v9;
  result.right = v14;
  result.bottom = v12;
  result.left = v13;
  result.top = v11;
  return result;
}

@end