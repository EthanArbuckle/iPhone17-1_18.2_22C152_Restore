@interface UITableView
- (BOOL)mf_isIndexPathVisible:(id)a3;
- (BOOL)mf_isIndexPathVisible:(id)a3 overlap:(CGRect)a4;
- (CGRect)mf_safeVisibleBounds;
@end

@implementation UITableView

- (CGRect)mf_safeVisibleBounds
{
  [(UITableView *)self visibleBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UITableView *)self safeAreaInsets];
  double v12 = v6 + v11;
  double v15 = v8 - (v13 + v14);
  double v17 = v10 - (v11 + v16);
  double v18 = v4 + v13;
  double v19 = v12;
  double v20 = v15;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (BOOL)mf_isIndexPathVisible:(id)a3
{
  id v4 = a3;
  double v5 = [(UITableView *)self indexPathsForVisibleRows];
  unsigned int v6 = [v5 containsObject:v4];

  if (v6)
  {
    [(UITableView *)self rectForRowAtIndexPath:v4];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [(UITableView *)self mf_safeVisibleBounds];
    v18.origin.x = v8;
    v18.origin.y = v10;
    v18.size.width = v12;
    v18.size.height = v14;
    BOOL v15 = CGRectContainsRect(v17, v18);
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)mf_isIndexPathVisible:(id)a3 overlap:(CGRect)a4
{
  id v5 = a3;
  unsigned int v6 = [(UITableView *)self indexPathsForVisibleRows];
  unsigned int v7 = [v6 containsObject:v5];

  if (v7)
  {
    [(UITableView *)self rectForRowAtIndexPath:v5];
    -[UITableView convertRect:toView:](self, "convertRect:toView:", self);
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    [(UITableView *)self mf_safeVisibleBounds];
    CGFloat x = v24.origin.x;
    CGFloat y = v24.origin.y;
    CGFloat width = v24.size.width;
    CGFloat height = v24.size.height;
    v26.origin.CGFloat x = v9;
    v26.origin.CGFloat y = v11;
    v26.size.CGFloat width = v13;
    v26.size.CGFloat height = v15;
    if (CGRectContainsRect(v24, v26))
    {
      char v20 = 1;
    }
    else
    {
      v25.origin.CGFloat x = x;
      v25.origin.CGFloat y = y;
      v25.size.CGFloat width = width;
      v25.size.CGFloat height = height;
      v27.origin.CGFloat x = v9;
      v27.origin.CGFloat y = v11;
      v27.size.CGFloat width = v13;
      v27.size.CGFloat height = v15;
      char v20 = CGRectIntersectsRect(v25, v27);
    }
    if (!CGRectIsNull(a4))
    {
      v28.origin.CGFloat x = v9;
      v28.origin.CGFloat y = v11;
      v28.size.CGFloat width = v13;
      v28.size.CGFloat height = v15;
      BOOL v21 = CGRectContainsRect(a4, v28);
      v29.origin.CGFloat x = v9;
      v29.origin.CGFloat y = v11;
      v29.size.CGFloat width = v13;
      v29.size.CGFloat height = v15;
      CGRectIntersectsRect(a4, v29);
      v20 &= !v21;
    }
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

@end