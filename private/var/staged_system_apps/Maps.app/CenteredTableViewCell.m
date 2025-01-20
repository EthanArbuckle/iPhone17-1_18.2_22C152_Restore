@interface CenteredTableViewCell
- (CenteredTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CenteringCellLayoutManager)centeringLayoutManager;
- (UIEdgeInsets)minimumHorizontalMargins;
- (double)maximumContentWidth;
- (void)setMaximumContentWidth:(double)a3;
- (void)setMinimumHorizontalMargins:(UIEdgeInsets)a3;
@end

@implementation CenteredTableViewCell

- (CenteredTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CenteredTableViewCell;
  v5 = [(CenteredTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  if (v5)
  {
    v6 = +[CenteringCellLayoutManager layoutManagerForTableViewCellStyle:a3];
    [(CenteredTableViewCell *)v5 setLayoutManager:v6];

    [(CenteredTableViewCell *)v5 setMaximumContentWidth:1.79769313e308];
    v7 = v5;
  }

  return v5;
}

- (CenteringCellLayoutManager)centeringLayoutManager
{
  v3 = [(CenteredTableViewCell *)self layoutManager];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(CenteredTableViewCell *)self layoutManager];
  }
  else
  {
    v5 = 0;
  }

  return (CenteringCellLayoutManager *)v5;
}

- (void)setMaximumContentWidth:(double)a3
{
  id v4 = [(CenteredTableViewCell *)self centeringLayoutManager];
  [v4 setMaximumCellContentWidth:a3];
}

- (double)maximumContentWidth
{
  v2 = [(CenteredTableViewCell *)self centeringLayoutManager];
  v3 = v2;
  if (v2)
  {
    [v2 maximumCellContentWidth];
    double v5 = v4;
  }
  else
  {
    double v5 = 1.79769313e308;
  }

  return v5;
}

- (void)setMinimumHorizontalMargins:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v7 = [(CenteredTableViewCell *)self centeringLayoutManager];
  [v7 setMinimumHorizontalMargins:top, left, bottom, right];
}

- (UIEdgeInsets)minimumHorizontalMargins
{
  v2 = [(CenteredTableViewCell *)self centeringLayoutManager];
  [v2 minimumHorizontalMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.double right = v14;
  result.double bottom = v13;
  result.double left = v12;
  result.double top = v11;
  return result;
}

@end