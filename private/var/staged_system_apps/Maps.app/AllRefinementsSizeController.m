@interface AllRefinementsSizeController
- (UIEdgeInsets)multiSelectBackgroundContentInsets;
- (UIEdgeInsets)multiSelectSectionContentInsets;
- (UIEdgeInsets)togglesBackgroundContentInsets;
- (UIEdgeInsets)togglesSectionContentInsets;
- (double)headerHeightWithTitle:(id)a3 collectionView:(id)a4;
- (double)multiSelectHeaderLeadingAdjustment;
- (double)multiSelectPaddingBetweenCells;
- (double)togglesHeaderLeadingAdjustment;
@end

@implementation AllRefinementsSizeController

- (double)headerHeightWithTitle:(id)a3 collectionView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    v7 = objc_alloc_init(AllRefinementsHeaderView);
    [(AllRefinementsHeaderView *)v7 setTitle:v5];
    [v6 frame];
    double v9 = v8;
    LODWORD(v8) = 1148846080;
    LODWORD(v10) = 1132068864;
    -[AllRefinementsHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v7, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v9, UILayoutFittingExpandedSize.height, v8, v10);
    double v12 = v11;
  }
  else
  {
    double v12 = 0.0;
  }

  return v12;
}

- (UIEdgeInsets)togglesSectionContentInsets
{
  double v2 = 16.0;
  double v3 = 16.0;
  double v4 = 16.0;
  double v5 = 16.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)togglesBackgroundContentInsets
{
  double v2 = 8.0;
  double v3 = 16.0;
  double v4 = 8.0;
  double v5 = 16.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)togglesHeaderLeadingAdjustment
{
  return 16.0;
}

- (UIEdgeInsets)multiSelectSectionContentInsets
{
  double v2 = 32.0;
  double v3 = 24.0;
  double v4 = 24.0;
  double v5 = 32.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v2;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)multiSelectBackgroundContentInsets
{
  double v2 = 8.0;
  double v3 = 16.0;
  double v4 = 8.0;
  double v5 = 16.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)multiSelectHeaderLeadingAdjustment
{
  return -16.0;
}

- (double)multiSelectPaddingBetweenCells
{
  return 8.0;
}

@end